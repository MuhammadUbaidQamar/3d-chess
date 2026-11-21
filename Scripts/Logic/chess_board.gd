extends RefCounted

const constants = preload("res://Scripts/Logic/chess_constants.gd")

var board: Array[int] = []

func _init() -> void:
	self.board = []
	initialise_board()

#                     BOARD POSITION
# a8=56, b8=57, c8=58, d8=59, e8=60, f8=61, g8=62, h8=63
# a7=48, b7=49, c7=50, d7=51, e7=52, f7=53, g7=54, h7=55
# a6=40, b6=41, c6=42, d6=43, e6=44, f6=45, g6=46, h6=47
# a5=32, b5=33, c5=34, d5=35, e5=36, f5=37, g5=38, h5=39
# a4=24, b4=25, c4=26, d4=27, e4=28, f4=29, g4=30, h4=31
# a3=16, b3=17, c3=18, d3=19, e3=20, f3=21, g3=22, h3=23
# a2= 8, b2= 9, c2=10, d2=11, e2=12, f2=13, g2=14, h2=15
# a1= 0, b1= 1, c1= 2, d1= 3, e1= 4, f1= 5, g1= 6, h1= 7
func initialise_board():
	self.board = [constants.Piece.W_ROOK, constants.Piece.W_KNIGHT, constants.Piece.W_BISHOP, constants.Piece.W_QUEEN, constants.Piece.W_KING, constants.Piece.W_BISHOP, constants.Piece.W_KNIGHT, constants.Piece.W_ROOK]
	for i in range(8):
		self.board.append(constants.Piece.W_PAWN)
	for i in range(32):
		self.board.append(constants.Piece.EMPTY)
	for i in range(8):
		self.board.append(constants.Piece.B_PAWN)
	self.board += [constants.Piece.B_ROOK, constants.Piece.B_KNIGHT, constants.Piece.B_BISHOP, constants.Piece.B_QUEEN, constants.Piece.B_KING, constants.Piece.B_BISHOP, constants.Piece.B_KNIGHT, constants.Piece.B_ROOK]

func is_valid_index(index: int) -> bool:
	return (index >= 0) and (index <= constants.TOTAL_SQUARES-1)

func get_piece(index: int) -> int:
	if is_valid_index(index):
		return self.board[index]
	return constants.ERROR

func set_piece(index: int, replace_by_piece: int) -> void:
	if is_valid_index(index):
		self.board[index] = replace_by_piece

func clear_square(index:int) -> void:
	if is_valid_index(index):
		self.board[index] = constants.Piece.EMPTY

func make_move(move: Move) -> void:
	if is_valid_index(move.starting_square) and is_valid_index(move.destination_square) and move.moving_piece == self.board[move.starting_square]:
		move.captured_piece = self.board[move.destination_square]
		self.board[move.destination_square] = move.moving_piece
		self.board[move.starting_square] = constants.Piece.EMPTY

'''
func undo_move(move: Move) -> void:
	self.board[move.starting_square] = move.captured_piece
	self.board[move.destination_square] = move.moving_piece
	move.moving_piece = constants.Piece.EMPTY
'''

func reset_board() -> void:
	initialise_board()
