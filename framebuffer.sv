import screen::position;
module framebuffer(
	input logic [2:0] data_in,
	input position read_pos,
	input position write_pos,
	input logic wren,
	input logic rden,
	input logic clk,
	output logic [2:0] data_out
);

	(* ram_init_file = "mif/board.mif" *) logic [2:0] frame [479:0][639:0];
	
	always_ff @(posedge clk) begin
		if (wren)
			frame[write_pos.line][write_pos.pixel] <= data_in;
		if (rden)
			data_out <= frame[read_pos.line][read_pos.pixel];
	end
	
endmodule
