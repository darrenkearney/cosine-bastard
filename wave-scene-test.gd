extends Control

var console

# Wave control variables
var wavelength
var amplitude
var frequency
var period
var velocity

# Wave control Signals
signal update_wave_parameter(parameter, value)

func _ready():
	# Called every time the node is added to the scene.
	# Hook up controls signals
	#get_node("Wavelength").connect("changed", self, "_on_Wavelength_changed")
	console = get_node("Console/OutputText")

func _on_Wavelength_value_changed( value ):
	wavelength = value
	get_node("Console/WavelengthReading").set_text( str(value) )
	emit_signal("update_wave_parameter", "wavelength", value )

func _on_Amplitude_value_changed( value ):
	amplitude = value
	get_node("Console/AmplitudeReading").set_text( str(value) )
	emit_signal("update_wave_parameter", "amplitude", value )

func _on_Frequency_value_changed( value ):
	frequency = value
	get_node("Console/FrequencyReading").set_text( str(value) )
	emit_signal("update_wave_parameter", "frequency", value )

func _on_Period_value_changed( value ):
	period = value
	get_node("Console/PeriodReading").set_text( str(value) )
	emit_signal("update_wave_parameter", "period", value )

func _on_Velocity_value_changed( value ):
	velocity = value
	get_node("Console/VelocityReading").set_text( str(value) )
	emit_signal("update_wave_parameter", "velocity", value )