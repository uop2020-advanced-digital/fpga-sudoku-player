import screen::*;
module tb_vga();

	logic pixel_clk = 1'b0;
	color pixel_in =color_from_code(3'b010);
	
	position current_pixel;
	
	
	logic [0:7] vga_r = 8'hFF;
	logic [0:7] vga_g = 8'hFF;
	logic [0:7] vga_b = 8'hFF;
	logic vga_clk = 1'b0;
	logic vga_blank_n = 1'b1; // active low
	logic vga_sync_n = 1'b1; // active low
	logic vga_hs = 1'b0;
	logic vga_vs = 1'b0;
	
	vga dut(
		.pixel_clk(pixel_clk), 
		.pixel_in(pixel_in), 
		.current_pixel(current_pixel), 
		.vga_r(vga_r), 
		.vga_g(vga_g), 
		.vga_b(vga_b), 
		.vga_clk(vga_clk), 
		.vga_blank_n(vga_blank_n), 
		.vga_sync_n(vga_sync_n), 
		.vga_hs(vga_hs), 
		.vga_vs(vga_vs)
	);

	always #1 pixel_clk <= ~pixel_clk;
	
	initial begin
		repeat((800 * 530) * 2) begin
			@(posedge pixel_clk);
			//pixel_in <= pixel_in + 24'd1;
		end
		$stop;
	end

endmodule
