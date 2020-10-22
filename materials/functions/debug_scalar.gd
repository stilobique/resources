tool
extends VisualShaderNodeCustom
class_name VisualShaderNodeDebugScalar


func _get_name():
	return "DebugScalar"
	
func _get_category():
	return "Debug"
	
func _get_description():
	return "Show an debug scalar value."
	
func _get_return_icon_type():
	return VisualShaderNode.PORT_TYPE_SCALAR
	
func _get_input_port_count():
	return 1
	
func _get_input_port_name(port):
	match port:
		0:
			return "scalar"

func _get_input_port_type(port):
	match port:
		0:
			return VisualShaderNode.PORT_TYPE_SCALAR

func _get_output_port_count():
	return 1

func _get_output_port_name(_port):
	return "scalar"
	
func _get_output_port_type(_port):
	return VisualShaderNode.PORT_TYPE_SCALAR
	
func _get_global_code(_mode):
	return """
	float debugScalar(float debug) {
		return debug;
	}
	"""

func _get_code(input_vars, output_vars, _mode, _type):
	print("Debug scalar, input vars :", input_vars)
	print("Debug scalar, output vars :", output_vars)
	return output_vars[0] + " = debugScalar(%s);" % [input_vars[0]]

