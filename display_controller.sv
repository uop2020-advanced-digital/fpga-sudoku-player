import screen::*;
module display_controller(
	(* chip_pin = "AG15" *)  input logic clk,
	
	input logic cursor_down,
	input logic cursor_right,
	
	input logic [3:0] display_grid [8:0][8:0],
	
	// VGA output signals
	output logic [7:0] vga_r,
	output logic [7:0] vga_g,
	output logic [7:0] vga_b,
	output logic vga_clk,
	output logic vga_blank_n, // active low
	output logic vga_sync_n, // active low
	output logic vga_hs,
	output logic vga_vs
);
	logic pixel_clk;
	
	// from the game board encoders
	position write_pixel = {10'd0, 10'h0};
	logic [2:0] write_data = 3'b100;
	
	position pixel_request;
	logic [2:0] read_data;
	
	logic [3:0] cursor_row = 4'd4;
	logic [3:0] cursor_col = 4'd4;
	
	color screen_pixel;
	
	// temporary cursor mover
	always_ff @(negedge cursor_down) begin
		cursor_col <= (cursor_col + 4'd1) % 9;
	end
	always_ff @(negedge cursor_right) begin
		cursor_row <= (cursor_row + 4'd1) % 9;
	end
	
	
	clock_divider pixeldiv(
		.clk_in(clk),
		.clk_out(pixel_clk)
	);
	
	colormux decoder(
		.code_in(read_data),
		.color_out(screen_pixel)
	);
	
	vga vga_port(
		.pixel_clk(pixel_clk),
		.pixel_in(screen_pixel),
		.current_pixel(pixel_request),
		.vga_r(vga_r),
		.vga_g(vga_g),
		.vga_b(vga_b),
		.vga_clk(vga_clk),
		.vga_blank_n(vga_blank_n),
		.vga_sync_n(vga_sync_n),
		.vga_hs(vga_hs),
		.vga_vs(vga_vs)
	);
	
	
	framebuffer fbuf(
		.data_in(write_data),
		.read_pos(pixel_request),
		.write_pos(write_pixel),
		.wren(1'b1),
		.rden(1'b1),
		.clk(pixel_clk),
		.data_out(read_data)
	);
	
	game_sync gs(
		.clk(pixel_clk),
		.display_grid(display_grid),
		.actual_cursor_row(cursor_row),
		.actual_cursor_col(cursor_col),
		.write_pos(write_pixel),
		.write_data(write_data)
	);
	
	
endmodule
