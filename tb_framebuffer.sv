import screen::*;
module tb_framebuffer();

	// todo: figure out why this is acting up
	/*
	color data_in = 24'h000000;
	position read_pos = {10'd0, 10'd0};
	position write_pos = {10'd0, 10'd0};
	logic wren = 1'b0;
	logic rden = 1'b1;
	logic clk = 1'b0;
	color data_out;
	
	framebuffer dut(
		.data_in(data_in), 
		.write_pos(write_pos),
		.read_pos(read_pos),
		.wren(wren),
		.rden(rden),
		.clk(clk),
		.data_out(data_out)
	);
	
	always #20 clk <= ~clk;
	
	task init();
		for(logic [0:7] i = 0; i < 8'hFF; i++) begin
			dut.frame[0][i] <= {8'h0, 8'h0, i};
		end
	endtask
	
	initial begin 
		init();
		repeat (32) begin
			@ (posedge clk);
			read_pos.pixel <= read_pos.pixel + 10'd1;
		end
		$stop;
	end
	*/

endmodule
