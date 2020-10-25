tool
extends VisualShaderNodeCustom
class_name VisualShaderNodeChecker


func _get_name():
	return "Checker"
	
func _get_category():
	return "Checker"
	
func _get_description():
	return "Generate a checker pattern."
	
func _get_return_icon_type():
	return VisualShaderNode.PORT_TYPE_VECTOR
	
func _get_input_port_count():
	return 1
	
func _get_input_port_name(port):
	match port:
		0:
			return "uv"

func _get_input_port_type(port):
	match port:
		0:
			return VisualShaderNode.PORT_TYPE_VECTOR

func _get_output_port_count():
	return 1

func _get_output_port_name(_port):
	return "checker"
	
func _get_output_port_type(_port):
	return VisualShaderNode.PORT_TYPE_VECTOR
	
func _get_global_code(_mode):
	return """
	vec3 checker(vec3 uv) {
		float xuv = floor(fract(uv.x * (-1.0)) + 0.5);
		float yuv = floor(fract(uv.x) + 0.5);
		float zuv = floor(fract(uv.y) + 0.5);
		float combine = mix(xuv, yuv, zuv);

		return vec3(combine);
	}
	"""

func _get_code(input_vars, output_vars, _mode, _type):
	return output_vars[0] + " = checker(vec3(%s));" % [input_vars[0]]

