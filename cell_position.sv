import screen::*;
module cell_position(
	input position relative_pos,
	input logic [3:0] row,
	input logic [3:0] col,
	output position actual_pos
);
	
	always_comb begin
		case (row)
			5'd0:		actual_pos.line <= relative_pos.line + 10'd23;
			5'd1:		actual_pos.line <= relative_pos.line + 10'd72;
			5'd2:		actual_pos.line <= relative_pos.line + 10'd121;
			5'd3:		actual_pos.line <= relative_pos.line + 10'd171;
			5'd4:		actual_pos.line <= relative_pos.line + 10'd220;
			5'd5:		actual_pos.line <= relative_pos.line + 10'd269;
			5'd6:		actual_pos.line <= relative_pos.line + 10'd319;
			5'd7:		actual_pos.line <= relative_pos.line + 10'd368;
			5'd8:		actual_pos.line <= relative_pos.line + 10'd417;
			default:	actual_pos.line <= relative_pos.line + 10'd0;
		endcase
	end
	
	always_comb begin
		case (col)
			5'd0:		actual_pos.pixel <= relative_pos.pixel + 10'd103;
			5'd1:		actual_pos.pixel <= relative_pos.pixel + 10'd152;
			5'd2:		actual_pos.pixel <= relative_pos.pixel + 10'd201;
			5'd3:		actual_pos.pixel <= relative_pos.pixel + 10'd251;
			5'd4:		actual_pos.pixel <= relative_pos.pixel + 10'd300;
			5'd5:		actual_pos.pixel <= relative_pos.pixel + 10'd349;
			5'd6:		actual_pos.pixel <= relative_pos.pixel + 10'd399;
			5'd7:		actual_pos.pixel <= relative_pos.pixel + 10'd448;
			5'd8:		actual_pos.pixel <= relative_pos.pixel + 10'd497;
			default:	actual_pos.pixel <= relative_pos.pixel + 10'd0;
		endcase
	end

endmodule
