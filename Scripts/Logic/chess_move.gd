extends RefCounted

class_name  Move

const constants = preload("res://Scripts/Logic/chess_constants.gd")

var starting_square: int
var destination_square: int
var moving_piece: int
var captured_piece: int = constants.Piece.EMPTY

func _init(from_square: int, to_square: int, piece_to_move: int, piece_captured: int = constants.Piece.EMPTY) -> void:
	starting_square = from_square
	destination_square = to_square
	moving_piece = piece_to_move
	captured_piece = piece_captured
