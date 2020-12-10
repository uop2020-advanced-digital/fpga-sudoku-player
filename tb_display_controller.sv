module tb_display_controller();

	logic clk = 1'b0;
	logic [0:7] vga_r = 8'b0;
	logic [0:7] vga_g = 8'b0;
	logic [0:7] vga_b = 8'b0;
	logic vga_clk = 1'b0;
	logic vga_blank_n = 1'b1; // active low
	logic vga_sync_n = 1'b1; // active low
	logic vga_hs = 1'b0;
	logic vga_vs = 1'b0;

	display_controller dut(
		.clk(clk),
		.vga_r(vga_r),
		.vga_g(vga_g),
		.vga_b(vga_b),
		.vga_clk(vga_clk),
		.vga_blank_n(vga_blank_n),
		.vga_sync_n(vga_sync_n),
		.vga_hs(vga_hs),
		.vga_vs(vga_vs)
	);
	
	always #1 clk <= ~clk;
	
	function logic [0:2] odd_or_even(logic [0:9] line, logic [0:9] pixel);
		return (line * 48 + pixel) % 2 ? 3'b100 : 3'b101;
	endfunction
	
	task init();
		for(logic [0:9] line = 0; line < 480; line++) begin
			for(logic [0:9] pixel = 0; pixel < 640; pixel++) begin
				dut.fbuf.frame[line][pixel] <= odd_or_even(line, pixel);
				//dut.bufctl.buf_A.frame[line][pixel] <= 3'b101;
				//dut.bufctl.buf_B.frame[line][pixel] <= 3'b010;
			end
		end
	endtask
	
	initial begin
		init();
		repeat((800 * 530) * 4) begin
			@(negedge clk);
		end
		$stop;
	end
	
endmodule
