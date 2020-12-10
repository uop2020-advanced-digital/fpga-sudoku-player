import screen::*;
module tb_draw_cell();

	logic clk = 1'b0;
	logic start_write = 1'b0;
	logic working;
	logic [3:0] cell_row = 4'd0;
	logic [3:0] cell_col = 4'd0;
	logic [3:0] cell_data = 4'd0;
	position absolute_position;
	logic [2:0] color_code = 3'd0;

	draw_cell dut(.clk(clk), .start_write(start_write), .cell_row(cell_row), .cell_col(cell_col), .cell_data(cell_data), .working(working), .absolute_position(absolute_position), .color_code(color_code));
	
	always #2 clk <= ~clk;
	
	initial begin
		#5;
		repeat(8) begin
			start_write <= 1'b1;
			repeat (5) begin 
				@(posedge clk);
			end
			start_write <= 1'b0;
			@(negedge dut.working);
			repeat (5) begin 
				@(posedge clk);
			end
			cell_data <= cell_data + 4'd1;
		end
		$stop;
	end

endmodule
