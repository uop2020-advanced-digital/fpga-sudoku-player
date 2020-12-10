import screen::*;
module font_provider(
	input logic clk,
	input logic [3:0] digit,
	input position pos,
	output logic [2:0] color_code
);
	
	logic [2:0] color_out;
	
	// digits
	(* ram_init_file = "mif/one.mif" *) logic one [39:0][39:0];
	(* ram_init_file = "mif/two.mif" *) logic two [39:0][39:0];
	(* ram_init_file = "mif/three.mif" *) logic three [39:0][39:0];
	(* ram_init_file = "mif/four.mif" *) logic four [39:0][39:0];
	(* ram_init_file = "mif/five.mif" *) logic five [39:0][39:0];
	(* ram_init_file = "mif/six.mif" *) logic six [39:0][39:0];
	(* ram_init_file = "mif/seven.mif" *) logic seven [39:0][39:0];
	(* ram_init_file = "mif/eight.mif" *) logic eight [39:0][39:0];
	(* ram_init_file = "mif/nine.mif" *) logic nine [39:0][39:0];
	
	always_ff @(negedge clk) begin
		case (digit)
			4'd1:	
				if (one[pos.line][pos.pixel])
					color_out <= 3'b001;
				else
					color_out <= 3'b000;
			4'd2:	
				if (two[pos.line][pos.pixel])
					color_out <= 3'b001;
				else
					color_out <= 3'b000;
			4'd3:	
				if (three[pos.line][pos.pixel])
					color_out <= 3'b001;
				else
					color_out <= 3'b000;
			4'd4:	
				if (four[pos.line][pos.pixel])
					color_out <= 3'b001;
				else
					color_out <= 3'b000;
			4'd5:	
				if (five[pos.line][pos.pixel])
					color_out <= 3'b001;
				else
					color_out <= 3'b000;
			4'd6:	
				if (six[pos.line][pos.pixel])
					color_out <= 3'b001;
				else
					color_out <= 3'b000;
			4'd7:	
				if (seven[pos.line][pos.pixel])
					color_out <= 3'b001;
				else
					color_out <= 3'b000;
			4'd8:	
				if (eight[pos.line][pos.pixel])
					color_out <= 3'b001;
				else
					color_out <= 3'b000;
			4'd9:	
				if (nine[pos.line][pos.pixel])
					color_out <= 3'b001;
				else
					color_out <= 3'b000;
			default: color_out <= 3'b001; // empty square
		endcase
	end
	
	always_ff @(negedge clk) begin
		color_code <= color_out;
	end

endmodule
