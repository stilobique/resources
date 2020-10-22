tool
extends VisualShaderNodeCustom
class_name VisualShaderNodePanner


func _get_name():
	return "Panner"
	
func _get_category():
	return "UV"
	
func _get_description():
	return "Panner animation."
	
func _get_return_icon_type():
	return VisualShaderNode.PORT_TYPE_VECTOR
	
func _get_input_port_count():
	return 3
	
func _get_input_port_name(port):
	match port:
		0:
			return "time"
		1:
			return "uv"
		2:
			return "speed"

func _get_input_port_type(port):
	match port:
		0:
			return VisualShaderNode.PORT_TYPE_SCALAR
		1:
			return VisualShaderNode.PORT_TYPE_VECTOR
		2:
			return VisualShaderNode.PORT_TYPE_VECTOR

func _get_output_port_count():
	return 1

func _get_output_port_name(_port):
	return "panner"
	
func _get_output_port_type(_port):
	return VisualShaderNode.PORT_TYPE_VECTOR
	
func _get_global_code(_mode):
	return """
	vec3 panner(float time, vec3 uv, vec3 speed) {
		return vec3(time * speed.x + uv.x, time * speed.y + uv.y, time * speed.z + uv.z);
	}
	"""

func _get_code(input_vars, output_vars, _mode, _type):
	print("nput value : ", input_vars)
	return output_vars[0] + " = panner(%s, vec3(%s), vec3(%s));" % [input_vars[0], input_vars[1], input_vars[2]]

