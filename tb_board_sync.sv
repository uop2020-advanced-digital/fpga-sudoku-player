import screen::*;
module tb_board_sync();

	logic clk = 1'b0;
	logic working = 1'b0;
	logic start_write;
	logic [3:0] cell_row;
	logic [3:0] cell_col;
	logic [3:0] cell_data;

	board_sync dut(.clk(clk), .working(working), .start_write(start_write), .cell_row(cell_row), .cell_col(cell_col), .cell_data(cell_data));
	
	always #2 clk <= ~clk;
	
	initial begin
		repeat (2) begin
			@(posedge start_write);
			#1 working <= 1'b1;
			repeat (10) begin
				@(negedge clk);
			end
			#1 working <= 1'b0;
		end
		#8;
		$stop;
	end
	

endmodule
