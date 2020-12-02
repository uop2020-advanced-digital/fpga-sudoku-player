import screen::*;
module draw_cursor(
	input logic clk,
	input sys_state current_state,
	input logic [3:0] draw_cursor_row,
	input logic [3:0] draw_cursor_col,
	output logic drawing_cursor,
	output logic [2:0] cursor_draw_color,
	output position cursor_draw_pos
);

	logic [3:0] stored_row = 4'd0;
	logic [3:0] stored_col = 4'd0;
	
	position current_pos = {10'd0, 10'd0};
	logic [6:0] iter = 7'b0;
	
	logic [6:0] coord_iter;
	
	cursor_position pos_muxer(.relative_pos(current_pos), .row(stored_row), .col(stored_col), .actual_pos(cursor_draw_pos));
	cursor_provider coords(.clk(clk), .iter(coord_iter), .pos(current_pos));
	
	//increment
	always_ff @(posedge clk) begin
		if (current_state == cursor_draw) begin
			if (iter < 95) begin
				iter <= iter + 7'b1;
			end else begin
				drawing_cursor <= 1'b0;
			end
		// wait for the signal to start working again
		end else if (current_state == cursor_signal)begin
			drawing_cursor <= 1'b1;
			iter <= 7'd0;
		end else begin
			drawing_cursor <= 1'b0;
		end
	end
	
	always_ff @(negedge clk) begin
		if (iter < 48) begin
			coord_iter <= iter;
		end else begin
			coord_iter <= iter - 7'd48;
		end
	end
	
	always_ff @(negedge clk) begin
		if (iter == 48) begin
			stored_row <= draw_cursor_row;
			stored_col <= draw_cursor_col;
		end
	end
	
	always_ff @(negedge clk) begin
		// first remove the old cursor
		if (iter < 49) begin
			cursor_draw_color <= 3'b001;
		// then draw the new
		end else begin
			cursor_draw_color <= 3'b110;
		end
	end

endmodule
