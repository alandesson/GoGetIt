extends Spatial


const min_angle = -60;
var max_angle = 60;

# Called when the node enters the scene tree for the first time.
func _ready():
	$braco.add_collision_exception_with($bod)
	
func rotate_braco(angle):
	var final_angle = clamp($braco/Pazinha.rotation_degrees.x + angle, min_angle, max_angle)
	var aux = deg2rad(final_angle-$braco/Pazinha.rotation_degrees.x)
	if abs(aux) < 0.0001:
		return false
	$braco/Pazinha.rotate_x(aux)
	return true
	
func pazinha_bump():
	while $braco/Pazinha.move_and_collide(Vector3(0,0,0),true,true,true) != null:
		var check = rotate_braco(-1)
		if check == false:
			return

func pazinha_drop():
	if $braco/Pazinha.move_and_collide(Vector3(0,0,0),true,true,true) == null:
		rotate_braco(1)
		

func roda_ombro(angle):
	$braco.rotate_x(angle)
	var colidiu_cima = $braco.move_and_collide(Vector3(0,0,0),true,true,true)
	if colidiu_cima != null:
		$braco.rotate_x(-angle)
		return
	
	var colidiu_baixo = $braco/Pazinha.move_and_collide(Vector3(0,0,0),true,true,true)
	if colidiu_baixo != null:
		pazinha_bump()
		if $braco/Pazinha.move_and_collide(Vector3(0,0,0),true,true,true) != null:
			$braco.rotate_x(-angle)
	
func abaixa_ombro(dist):
	$braco.translate(Vector3(0, dist, 0))
	var colidiu_cima = $braco.move_and_collide(Vector3(0,0,0),true,true,true)
	if colidiu_cima != null:
		$braco.translate(Vector3(0, -dist, 0))
		return
	
	var colidiu_baixo = $braco/Pazinha.move_and_collide(Vector3(0,0,0),true,true,true)
	if colidiu_baixo != null:
		pazinha_bump()
		if $braco/Pazinha.move_and_collide(Vector3(0,0,0),true,true,true) != null:
			$braco.translate(Vector3(0, -dist, 0))
	
func roda_pazinha(angle):
	var target_angle = clamp(max_angle + angle, -60, 60)
	if target_angle < max_angle:
		$braco/Pazinha.rotate_x(deg2rad(angle))
		
	max_angle = target_angle
	

func _physics_process(delta):
	pazinha_drop()
	var mouse_input = Input.get_axis("negativeRotation","positiveRotation") * 0.1;
	if mouse_input != 0:
		pass
