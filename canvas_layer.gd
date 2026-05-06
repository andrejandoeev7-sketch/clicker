extends CanvasLayer

# Ссылки на узлы интерфейса
@onready var score_label: Label = $UI/ScoreLabel
@onready var click_button: Button = $UI/ClickButton
@onready var show_score_button: Button = $UI/ShowScoreButton
@onready var score_window: Window = $ScoreWindow
@onready var score_display_label: Label = $ScoreWindow/ScoreDisplayLabel
@onready var close_window_button: Button = $ScoreWindow/CloseWindowButton

# Переменная для хранения счёта
var score: int = 0

func _ready():
	# Подключаем обработчики сигналов
	click_button.pressed.connect(_on_click)
	show_score_button.pressed.connect(_on_show_score)
	close_window_button.pressed.connect(_on_close_window)
	
	# Скрываем окно счёта при старте игры
	score_window.hide()
	
	# Инициализируем отображение счёта (чтобы сразу показать 0)
	update_score_display()

# Обработчик нажатия основной кнопки клика
func _on_click():
	score += 1  # Увеличиваем счёт на 1
	update_score_display()  # Обновляем отображение в обоих местах

# Обработчик открытия окна счёта
func _on_show_score():
	score_window.show()  # Показываем окно
	update_score_display()  # Обновляем данные в окне (на случай, если счёт изменился)

# Обработчик закрытия окна счёта
func _on_close_window():
	score_window.hide()  # Скрываем окно

# Функция обновления отображения счёта в обоих интерфейсах
func update_score_display():
	# Обновляем счёт в основном интерфейсе (внизу экрана)
	score_label.text = "Счёт: " + str(score)
	
	# Обновляем счёт в отдельном окне
	score_display_label.text = "Текущий счёт: " + str(score)
