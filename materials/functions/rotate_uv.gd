tool
extends VisualShaderNodeCustom
class_name VisualShaderNodeRotateUv


func _get_name():
	return "RotateUv"
	
func _get_category():
	return "UV"
	
func _get_description():
	return "Rotate an UV vector, use an scale at 0 to 1."
	
func _get_return_icon_type():
	return VisualShaderNode.PORT_TYPE_SCALAR
	
func _get_input_port_count():
	return 2
	
func _get_input_port_name(port):
	match port:
		0:
			return "uv"
		1:
			return "Angle"

func _get_input_port_type(port):
	match port:
		0:
			return VisualShaderNode.PORT_TYPE_VECTOR
		1:
			return VisualShaderNode.PORT_TYPE_SCALAR

func _get_output_port_count():
	return 1

func _get_output_port_name(_port):
	return "uv"
	
func _get_output_port_type(_port):
	return VisualShaderNode.PORT_TYPE_VECTOR
	
func _get_global_code(_mode):
	return """
	vec3 rotateUV(vec3 uv, float rotation) {
		rotation = radians(rotation) * 360.0;
		float mid = 0.5;
		return vec3(
			cos(rotation) * (uv.x - mid) + sin(rotation) * (uv.y - mid) + mid,
			cos(rotation) * (uv.y - mid) - sin(rotation) * (uv.x - mid) + mid,
			1
		);
	}
	"""

func _get_code(input_vars, output_vars, _mode, _type):
	return output_vars[0] + " = rotateUV(vec3(%s), %s);" % [input_vars[0], input_vars[1]]

