extends RefCounted

const constants = preload("res://Scripts/Logic/chess_constants.gd")

func is_empty(piece: int) -> bool:
	return piece == constants.Piece.EMPTY

func piece_type(piece: int) -> int:
	return (piece - 1) % 6

func piece_color(piece: int) -> int:
	if piece <= 6:
		return constants.PieceColor.WHITE
	else:
		return constants.PieceColor.BLACK
