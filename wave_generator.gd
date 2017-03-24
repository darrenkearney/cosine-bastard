extends Node2D

var screensize

# Wave parameters
var amplitude = 10
var frequency = 2
var period = 100
var velocity = 100 # multiply by 1.20 for optimum display
var wavelength = 100
var emitter_direction = Vector2(0.0, 1.0)
var current_angle = 0

# Wave Particle display
var rendered_console_size
var resting_x # point where the emitter sits in the x axis
var resting_y # point where the waves baseline/rest point is
var max_delta = 0

func _ready():
	# Initialize emitter
	rendered_console_size = get_node("WaveConsole").get_size()
	resting_x = get_node("WaveConsole").get_pos().x + 20
	resting_y = rendered_console_size.y / 2 + get_node("WaveConsole").get_pos().y
	get_node("WaveParticles").set_pos( Vector2(resting_x, resting_y) )
	set_process(true)

func update_wave_parameter_renderer():
	# Refresh some settings - ugly but better in the end
	get_node("WaveParticles").set_pos( Vector2(resting_x, resting_y) ) # set the emitter back to the rest position
	current_angle = 0
	
	# Update debug text
	get_node("DebugText/WaveParameters").set_text("amplitude: "+str(round(amplitude))+"%\nfrequency: "+str(frequency)+"%\nperiod: "+str(period)+"%\nvelocity: "+str(velocity)+"%\nwavelength: "+str(wavelength)+"%\ncurrent_angle: "+str(current_angle)+"deg\n")

func _process(delta):
	
	if (delta > max_delta):
		max_delta = delta
		print(max_delta)
	
	if (current_angle > 360 ):
		current_angle -= 360
	# increase angle at rate of set frequency
	current_angle += frequency / 2 * delta
	
	# Integrate new y value
	var emitter_pos = get_node("WaveParticles").get_pos()
	emitter_pos.y += amplitude * cos(current_angle) * delta * (frequency * 0.5) # This is problematic. I don't know how to get the correct ratios
	get_node("WaveParticles").set_pos(emitter_pos)
	
	# Debug text
	get_node("DebugText").set_text("Emitter pos: " + str(emitter_pos) + "\n" + "Emitter Direction: " + str(emitter_direction) + "\n" + "Time Delta: " + str(delta) + "\n" + "rendered_console_size: " + str(rendered_console_size) + "\nresting_y: " + str(resting_y) + "\nget_node('WaveConsole').get_pos().y: " + str(get_node("WaveConsole").get_pos().y)+"\nemitter_pos: "+str(emitter_pos)+"\ncurrent_angle: "+str(current_angle))
	