extends RefCounted

const BOARD_WIDTH: int = 8
const BOARD_HEIGHT: int = 8
const TOTAL_SQUARES: int = 64

enum Piece {
	EMPTY, # 0
	W_PAWN, W_KNIGHT, W_BISHOP, W_ROOK, W_QUEEN, W_KING, # 1-6
	B_PAWN, B_KNIGHT, B_BISHOP, B_ROOK, B_QUEEN, B_KING, # 7-12
}
enum PieceType {
	PAWN, KNIGHT, BISHOP, ROOK, QUEEN, KING, # 0-5
}
enum PieceColor{
	WHITE, BLACK
}
enum {ERROR = -1}

#                     BOARD POSITION
# a8=56, b8=57, c8=58, d8=59, e8=60, f8=61, g8=62, h8=63
# a7=48, b7=49, c7=50, d7=51, e7=52, f7=53, g7=54, h7=55
# a6=40, b6=41, c6=42, d6=43, e6=44, f6=45, g6=46, h6=47
# a5=32, b5=33, c5=34, d5=35, e5=36, f5=37, g5=38, h5=39
# a4=24, b4=25, c4=26, d4=27, e4=28, f4=29, g4=30, h4=31
# a3=16, b3=17, c3=18, d3=19, e3=20, f3=21, g3=22, h3=23
# a2= 8, b2= 9, c2=10, d2=11, e2=12, f2=13, g2=14, h2=15
# a1= 0, b1= 1, c1= 2, d1= 3, e1= 4, f1= 5, g1= 6, h1= 7
