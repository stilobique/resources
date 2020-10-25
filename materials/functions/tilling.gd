tool
extends VisualShaderNodeCustom
class_name VisualShaderNodeTileUv


func _get_name():
	return "TileUv"
	
func _get_category():
	return "UV"
	
func _get_description():
	return "Size uv on x/y/z input."
	
func _get_return_icon_type():
	return VisualShaderNode.PORT_TYPE_VECTOR
	
func _get_input_port_count():
	return 4
	
func _get_input_port_name(port):
	match port:
		0:
			return "uv"
		1:
			return "XSize"
		2:
			return "YSize"
		3:
			return "ZSize"

func _get_input_port_type(port):
	match port:
		0:
			return VisualShaderNode.PORT_TYPE_VECTOR
		1:
			return VisualShaderNode.PORT_TYPE_SCALAR
		2:
			return VisualShaderNode.PORT_TYPE_SCALAR
		3: 
			return VisualShaderNode.PORT_TYPE_SCALAR

func _get_output_port_count():
	return 1

func _get_output_port_name(_port):
	return "uv"
	
func _get_output_port_type(_port):
	return VisualShaderNode.PORT_TYPE_VECTOR
	
func _get_global_code(_mode):
	return """
	vec3 tileUV(vec3 uv, float xaxis, float yaxis, float zaxis) {
		return vec3(uv.x * xaxis, uv.y * yaxis, uv.z * zaxis);
	}
	"""

func _get_code(input_vars, output_vars, _mode, _type):
	return output_vars[0] + " = tileUV(vec3(%s), %s, %s, %s);" % [input_vars[0], input_vars[1], input_vars[2], input_vars[3] ]

