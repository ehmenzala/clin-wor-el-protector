extends CanvasLayer


var life = 10

var collected_bottles = 0

var _number_1: TextureRect
var _number_2: TextureRect
var _number_3: TextureRect

# Índice desde donde empieza el número 1 en la imagen atlas de letras y números
var _index_number_1 = 8
# Índice exacto del número 0, en la imagen atlas de letras y números
var _index_number_0 = 17

@onready var bar = $LifeBar/Bar
@onready var bottle_group = $LifeBar/BottelGroup

# Called when the node enters the scene tree for the first time.
func _ready():
	print(bar.value)
	remove_life(5)
	print(bar.value)
	add_points(3, bottle_group)
	self.visible = true

func add_life(value: int):
	life += value
	if life > 10:
		life = 10
	_set_life_progress(life)

func remove_life(value: int):
	life -= value
	if life < 0:
		life = 0
	_set_life_progress(life)

func add_points(value: int, group = null):
	_number_1 = group.find_child("Number1")
	_number_2 = group.find_child("Number2")
	_number_3 = group.find_child("Number3")
	collected_bottles =+ value
	_set_points(collected_bottles)
	
func restart():
	life = 10
	_set_life_progress(life)
	collected_bottles = 0

func _set_life_progress(value: int):
	bar.value = value

func _set_points(value: int):
	# El valor máximo a representar es 999
	if value > 999:
		value = 999
	var digit_str = str(value)  # Convierte el número en una cadena de texto
	var digit_list = digit_str.split("")  # Divide la cadena en una lista de caracteres
	
	# Rellenamos el listado con 0 al inicio por si el número es menor que 99
	if value < 100:
		for i in range(3 - digit_list.size()):
			digit_list.insert(0, "0") # Insertamos ceros al inicio
	
	for index in range(digit_list.size()):
		var n = digit_list[index]
		var region = Rect2()
		if n == "0":
			region = _get_text_region(_index_number_0)
		else:
			var v = int(n)
			# Generamos una posición usando el número más la posición de los digitos en el "atlas"
			# y restamos 1, porque _index_number_1 ya tiene la posición del número 1
			var position = v + _index_number_1 - 1
			region = _get_text_region(position)
		match index: # Actualizamos cada imagen (3 imágenes desde 0 a 2)
			0:
				_number_1.texture.set_region(region)
			1:
				_number_2.texture.set_region(region)
			2:
				_number_3.texture.set_region(region)

# Genera una región (Rect2) para la posición del caracter según el "Atlas de imágenes"
# Se pasa posición de la letra de 0 a N, y retorna un Rect2, para dibujar la letra o número específico
func _get_text_region(position: int):
	var w = 10 # Ancho de la letra (siempre es 10)
	var h = 11 # Alto de la letra (siempre es 11)
	var x = 4.0 # Valor de la posición X (inicia con el valor 4)
	var y = 4.0 # Valor de la posición Y (inicia con el valor 4)
	var delta = 20.0 # Separación entre letras
	var column_count = 6.0 # Número de columnas según el atlas generado (en este caso 6)
	
	# Generamos un loop, para ir avanzando por cada región (por cada letra)
	for p in range(position):
		if x / delta < column_count - 1.0:
			# Nos vamos moviendo por las columnas
			x += delta # Avanzamos a la siguiente columna
		else:
			# Si llegamos a la última columna, seguimos avanzando desde la siguiente fila
			x = 4 # Volvemos a la primera columna
			y += delta # Avanzamos a la siguiente fila
			
	return Rect2(x, y, w, h)
