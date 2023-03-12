extends VBoxContainer
class_name CraftingsUI

@export var crafting_ui_scene : PackedScene
@export var crafter : Crafter

var craftings : Array[Control]


func set_crafter(crafter : Crafter):
	clear()
	self.crafter = crafter
	crafter.internal_station.on_add_crafting_at.connect(_on_add_crafting_at.bind())
	crafter.internal_station.on_remove_crafting_at.connect(_on_remove_crafting_at.bind())


func clear():
	for crafting in craftings:
		crafting.queue_free()	
	craftings.clear()


func _on_add_crafting_at(crafting_index : int):
	var crafting_obj = crafting_ui_scene.instantiate()
	add_child(crafting_obj)
	craftings.insert(crafting_index, crafting_obj)


func _on_remove_crafting_at(crafting_index : int):
	craftings[crafting_index].queue_free()
	craftings.remove_at(crafting_index)
