import screen::*;
module cursor_sync(
	input logic clk,
	input sys_state current_state,
	input logic [3:0] actual_cursor_row,
	input logic [3:0] actual_cursor_col,
	//output logic [3:0] draw_cursor_row = 4'd0,
	//output logic [3:0] draw_cursor_col = 4'd0,
	output logic start_cursor = 1'd0
);

	logic [3:0] stored_cursor_row = 4'd0;
	logic [3:0] stored_cursor_col = 4'd0;
	
	// watch the cursor
	always_ff @(negedge clk) begin
		if (stored_cursor_row  != actual_cursor_row || stored_cursor_col != actual_cursor_col) begin
			start_cursor <= 1'b1;
		end else begin
			start_cursor <= 1'b0;
		end
	end
	
	always_ff @(negedge clk) begin
		if (current_state == cursor_signal) begin
			stored_cursor_row <= actual_cursor_row;
			stored_cursor_col <= actual_cursor_col;
		end
	end

endmodule
