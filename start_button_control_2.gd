extends Sprite

signal start_game

func _ready():
	pass

func _input_event(ev):
    if (ev.type==InputEvent.MOUSE_BUTTON and ev.pressed):
        emit_signal("start_game")