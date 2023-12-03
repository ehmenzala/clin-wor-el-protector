extends Node

var playerHP = 10
var playerBottels = 0

var levels_paths: Array = [
	"res://scenes/levels/NIVEL FOCA/NIVELFOCA1.tscn",
	"res://scenes/levels/penguin_level/penguin.tscn",
	"res://scenes/levels/raindeer_level/raindeer.tscn"
]

var next_level = 1

var cinematics_paths: Array = [
	"res://scenes/cinematics/finish_seals.tscn",
	"res://scenes/cinematics/finish_penguin.tscn",
	"res://scenes/cinematics/finish_renny.tscn"
]

var next_cinematic = 0
