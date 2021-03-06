import screen::*;
module board_sync(
	input logic clk,
	input sys_state current_state,
	input logic [3:0] display_grid [8:0][8:0],
	output logic start_cell = 1'd0,
	output logic [3:0] cell_row = 4'd0,
	output logic [3:0] cell_col = 4'd0,
	output logic [3:0] cell_data
);

	assign cell_data = display_grid[cell_row][cell_col];
	
	// scan through from [0,0] to [8,8]
	always_ff @(negedge clk) begin
		if (current_state == idle) begin
			start_cell <= 1'b1;
			if (cell_col < 8) begin
				cell_col <= cell_col + 4'd1;
			end else if (cell_row < 8) begin
				cell_col <= 4'd0;
				cell_row <= cell_row + 4'd1;
			end else begin
				// back to beginning
				cell_col <= 4'd0;
				cell_row <= 4'd0;
			end
		end else if (current_state == cell_draw) begin
			start_cell <= 1'b0;
		end
	end

endmodule
