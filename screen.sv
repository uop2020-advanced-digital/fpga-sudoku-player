/*
	Definitions for terms related to the display
*/
package screen;

	typedef struct packed {
		logic [7:0] r;
		logic [7:0] g;
		logic [7:0] b;
	} color;
	
	typedef struct packed {
		logic [9:0] pixel;
		logic [9:0] line;
	} position;
	
	typedef enum logic [2:0] {
		idle,
		cell_signal,
		cell_draw,
		cursor_signal,
		cursor_draw
	} sys_state;

endpackage
