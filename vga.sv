import screen::*;
	
module vga(
	// basic input
	input logic pixel_clk,
	
	// control inputs
	input color pixel_in,
	
	// control outputs
	output position current_pixel = {10'b0, 10'b0},
	
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

	logic line_clk = 1'b0;
	logic [9:0] h_timer = 10'd0;
	logic [9:0] v_timer = 10'd0;
	
	
	assign vga_clk = pixel_clk;
	assign vga_sync_n = 1'b0;
	
	// signals are latched to the rising edge in the DAC chip, so change them on the falling
	
	// counters
	always_ff @ (posedge pixel_clk) begin
		h_timer <= h_timer + 1'b1;
		if (h_timer >= 10'd800) begin
			h_timer <= 10'd0;
			v_timer <= v_timer + 10'd1;
		end
		if ( v_timer >= 10'd525 ) begin
			v_timer <= 10'd0;
		end
	end
	
	// line clk
	always_ff @(negedge pixel_clk) begin
		if ( h_timer == 10'd799 ) begin
			line_clk <= 1'b0;
		end else begin
			line_clk <= 1'b1;
		end
	end

	// current pixel
	always_ff @ (negedge pixel_clk) begin
		if (h_timer < 10'd144) begin
			current_pixel.pixel  <= 10'd0;
		end else if (h_timer < 10'd784)  begin
			current_pixel.pixel <= h_timer - 10'd144;
		end else begin
			current_pixel.pixel <= 10'd640;
		end
	end
	
	// current line
	always_ff @ (negedge line_clk) begin
		if (v_timer < 10'd35) begin
			current_pixel.line <= 10'd0;
		end else if (v_timer < 10'd515)  begin
			current_pixel.line <= v_timer - 10'd35;
		end else begin
			current_pixel.line <= 10'd480;
		end
	end
	
	// change the pixel
	always_ff @ ( negedge pixel_clk) begin
		vga_r <= pixel_in.r;
		vga_g <= pixel_in.g;
		vga_b <= pixel_in.b;
	end
	
	// blanking during porches
	always_ff @ (negedge pixel_clk) begin
		if ( v_timer < 10'd35 || v_timer > 10'd514 ) begin
			vga_blank_n <= 1'b0;
		end else if ( h_timer < 10'd144 || h_timer > 10'd783 ) begin
			vga_blank_n <= 1'b0;
		end else begin
			vga_blank_n <= 1'b1;
		end
	end
	
	// horizontal sync wave
	always_ff @ (negedge pixel_clk) begin
		if ( h_timer < 10'd96 ) begin
			vga_hs <= 1'b0;
		end else begin
			vga_hs <= 1'b1;
		end
	end
	
	// vertical sync wave
	always_ff @ (negedge pixel_clk) begin
		if (v_timer < 10'd2) begin
			vga_vs <= 1'b0;
		end else begin
			vga_vs <= 1'b1;
		end
	end
	
endmodule
