import screen::*;
module draw_cell(
	input logic clk,
	input sys_state current_state,
	input logic [3:0] cell_row,
	input logic [3:0] cell_col,
	input logic [3:0] cell_data,
	output logic drawing_cell = 1'b0,
	output position absolute_position,
	output logic [2:0] color_code
);

	position current_pos = {10'd0, 10'd0};
	
	cell_position pos_muxer(.relative_pos(current_pos), .row(cell_row), .col(cell_col), .actual_pos(absolute_position));
	font_provider font(.clk(clk), .digit(cell_data), .pos(current_pos), .color_code(color_code));
	
	//increment
	always_ff @(posedge clk) begin
		if (current_state == cell_draw) begin
			if (current_pos.pixel < 39) begin
				current_pos.pixel <= current_pos.pixel + 10'd1;
			end else if (current_pos.line < 39) begin
				current_pos.pixel <= 10'd0;
				current_pos.line <= current_pos.line + 10'd1;
			end else begin
				drawing_cell <= 1'b0;
			end
		// wait for the signal to start working again
		end else if (current_state == cell_signal) begin
			drawing_cell <= 1'b1;
			current_pos <= {10'd0, 10'd0};
		end else begin
			drawing_cell <= 1'b0;
		end
	end
	
endmodule
