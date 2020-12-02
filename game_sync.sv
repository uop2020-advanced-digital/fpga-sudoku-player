import screen::*;
module game_sync(
	input logic clk,
	input logic [3:0] actual_cursor_row, // temp
	input logic [3:0] actual_cursor_col, // temp
	input logic [3:0] cell_in,		// temp
	output position write_pos,
	output logic [2:0] write_data
);
	
	// state machine vars
	sys_state current_state = idle;
	logic drawing_cell;
	logic drawing_cursor;
	logic start_cell;
	logic start_cursor;
	
	// transfer vars
	logic [3:0] cell_row;
	logic [3:0] cell_col;
	logic [3:0] cell_data;
	logic [3:0] draw_cursor_row;
	logic [3:0] draw_cursor_col;
	
	logic [2:0] cell_draw_color;
	position cell_draw_pos;
	
	logic [2:0] cursor_draw_color;
	position cursor_draw_pos;
	
	// select output based on which draw module is doing the work
	always_ff @(posedge clk) begin
		if (current_state == cell_draw) begin
			write_pos <= cell_draw_pos;
			write_data <= cell_draw_color;
		end else begin
			write_pos <= cursor_draw_pos;
			write_data <= cursor_draw_color;
		end
	end
	
	always_ff @(negedge clk) begin
		if (drawing_cursor) begin
			current_state <= cursor_draw;
		end else if (drawing_cell) begin
			current_state <= cell_draw;
		end else if (start_cursor) begin
			current_state <= cursor_signal;
		end else if (start_cell) begin
			current_state <= cell_signal;
		end else begin
			current_state <= idle;
		end
	end
	
	board_sync board_scanner(
		.clk(clk),
		.current_state(current_state),
		.cell_in(cell_in), 
		.start_cell(start_cell),
		.cell_row(cell_row),
		.cell_col(cell_col),
		.cell_data(cell_data)
	);
	
	draw_cell cell_drawer(
		.clk(clk),
		.current_state(current_state),
		.cell_row(cell_row),
		.cell_col(cell_col),
		.cell_data(cell_data),
		.drawing_cell(drawing_cell),
		.absolute_position(cell_draw_pos),
		.color_code(cell_draw_color)
	);
	
	cursor_sync cursor_scanner(
		.clk(clk),
		.current_state(current_state),
		.actual_cursor_row(actual_cursor_row),
		.actual_cursor_col(actual_cursor_col),
		//.draw_cursor_row(draw_cursor_row),
		//.draw_cursor_col(draw_cursor_col),
		.start_cursor(start_cursor)
	);
	
	draw_cursor cursor_drawer(
		.clk(clk),
		.current_state(current_state),
		.draw_cursor_row(actual_cursor_row),
		.draw_cursor_col(actual_cursor_col),
		.drawing_cursor(drawing_cursor),
		.cursor_draw_color(cursor_draw_color),
		.cursor_draw_pos(cursor_draw_pos)
	);

endmodule
