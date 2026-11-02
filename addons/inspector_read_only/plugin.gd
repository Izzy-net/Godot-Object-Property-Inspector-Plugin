@tool
extends EditorPlugin

var plugin


func _enter_tree() -> void:
	plugin = preload("res://addons/inspector_read_only/inspector_read_only.gd").new()
	add_inspector_plugin(plugin)


func _exit_tree() -> void:
	remove_inspector_plugin(plugin)
