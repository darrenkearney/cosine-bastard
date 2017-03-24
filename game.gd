extends Node

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var wave_controller = get_node("WaveController")
	var wave_renderer = get_node("WaveRenderer")
	
	# Grab the controller signals
	wave_controller.connect("update_wave_parameter", self, "wave_controller_signal_handler") 
	self.connect("start_game", self, "start_game_handler")
	
	set_process(true)

func wave_controller_signal_handler(parameter, value):
	#if (parameter == "frequency"):
		#var frequency = value + 30 # boost the frequency
		#get_node("WaveRenderer/WaveParticles").set_param( 2, frequency )

	#get_node("Label").set_text("wave_controller_signal_handler(a,b): " + str(parameter) + str(value))
	get_node("WaveRenderer").set(parameter, value)
	get_node("WaveRenderer").update_wave_parameter_renderer()

func start_game_handler():
	self.remove_child("TitleScreen")

func _process():
	get_node("Label").set_text("wave_renderer.get('period'): " + str(get_node("WaveRenderer").get("period")))
	
