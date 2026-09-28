extends Area3D

# Path ของ Scene ที่ต้องการเปลี่ยนไป
@export_file("*.tscn") var target_scene: String = "res://Scenes/scene_1.tscn"

# อ้างอิง Node ลูก Range
@onready var range_area: Area3D = $Range

func _ready() -> void:
	# เชื่อมต่อ Signal จาก Node 'Range' เมื่อมี Object มาชน
	range_area.body_entered.connect(_on_range_body_entered)

func _on_range_body_entered(body: Node3D) -> void:
	# ตรวจสอบว่าสิ่งที่มาชนเป็น Player (เช็กจากชื่อ Node หรือ Group)
	if body.is_in_group("Player") or body.name == "Player":
		change_scene()

func change_scene() -> void:
	# สลับ Scene ไปยัง scene_1.tscn
	get_tree().change_scene_to_file(target_scene)
