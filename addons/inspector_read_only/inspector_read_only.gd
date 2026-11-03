extends EditorInspectorPlugin

func _can_handle(object: Object) -> bool:
	return true # will run on all objects - create conditions if you only want it on some and return false on those you want to skip

func _parse_begin(object: Object) -> void:  # happens when you click on the object/node - change to _parse_end to put it at the bottom of the inspector
	var container:= FoldableContainer.new()   # parent container which allows labels to be folded away
	container.title = "Read-Only Properties"
	
	var v_container := VBoxContainer.new() # will arrange the labels vertically
	container.add_child(v_container)           
	
	var properties = object.get_property_list() # gets all the properties of the object being parsed
	for property in properties:
		if property["usage"] == 0:   # can check link below to ensure this is the only flag you want to use
			var button := Button.new()
			button.text = property["name"]
			button.tooltip_text = property["hint_string"]
			v_container.add_child(button)
	
	add_custom_control(container)   # adds the FoldableContainer whose child VBoxContainer is now populated with all 
									# usage == 0 properties to the inspector

# https://docs.godotengine.org/en/stable/classes/class_%40globalscope.html#enum-globalscope-propertyusageflags
