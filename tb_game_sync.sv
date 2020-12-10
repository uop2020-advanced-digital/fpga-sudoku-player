import screen::*;
module tb_game_sync();

	logic clk = 1'b0;
	logic [3:0] cell_in = 4'd0;
	logic [3:0] actual_cursor_row = 4'd4;
	logic [3:0] actual_cursor_col = 4'd4;
	position write_pos;
	logic [2:0] write_data;
	
	game_sync dut(
		.clk(clk),
		.actual_cursor_row(actual_cursor_row),
		.actual_cursor_col(actual_cursor_col),
		.cell_in(cell_in),
		.write_pos(write_pos),
		.write_data(write_data)
	);
	
	always #2 clk <= ~clk;
	
	task init();
		for(int i = 0; i < 48; i++) begin
			dut.cursor_drawer.coords.sprite[i] = {i, i};
		end
	endtask
	
	initial begin
		init();
		repeat(6) begin
			repeat (80) begin
				@(posedge clk);
			end
			actual_cursor_row <= actual_cursor_row + 4'd1;
			actual_cursor_col <= actual_cursor_col + 4'd1;
		end
		$stop;
	end

endmodule
