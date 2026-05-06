extends Button

var click_count: int = 0
@onready var count_label: Label = $ "../CountLabel"

func _ready():
	pressed.connect(_on_button_pressed)
	update_display()

func _on_button_pressed():
	print("Кнопка нажата! Всего нажатий: " + str(click_count + 1))
	click_count += 1
	update_display()
	show_message()

func update_display():
	count_label.text = "Нажатий: " + str(click_count)

func show_message():
	var dialog = AcceptDialog.new()
	dialog.title = "Уведомление"
	dialog.dialog_text = "Вы нажали кнопку! Всего нажатий: " + str(click_count)
	get_tree().root.add_child(dialog)
	dialog.popup_centered()
