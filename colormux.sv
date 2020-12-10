import screen::*;
module colormux(
	input logic [2:0] code_in,
	output color color_out
);

	always_comb begin
		case (code_in)
			3'b000: color_out <= 24'h000000; // black
			3'b001: color_out <= 24'h808080; // cell background
			3'b010: color_out <= 24'h700060; // screen background
			3'b011: color_out <= 24'hB0B0B0; // pencil
			3'b100: color_out <= 24'h008000; // correct
			3'b101: color_out <= 24'hD02020; // wrong
			3'b110: color_out <= 24'hFF96B8; // cursor
			3'b111: color_out <= 24'hF0F0F0; // white
			default: color_out <= 24'hFF197C; // default - pink
		endcase
	end

endmodule
