import screen::*;
module cursor_position(
	input position relative_pos,
	input logic [3:0] row,
	input logic [3:0] col,
	output position actual_pos
);
	
	always_comb begin
		case (row)
			5'd0:		actual_pos.line <= relative_pos.line + 10'd20;
			5'd1:		actual_pos.line <= relative_pos.line + 10'd69;
			5'd2:		actual_pos.line <= relative_pos.line + 10'd118;
			5'd3:		actual_pos.line <= relative_pos.line + 10'd168;
			5'd4:		actual_pos.line <= relative_pos.line + 10'd217;
			5'd5:		actual_pos.line <= relative_pos.line + 10'd266;
			5'd6:		actual_pos.line <= relative_pos.line + 10'd316;
			5'd7:		actual_pos.line <= relative_pos.line + 10'd365;
			5'd8:		actual_pos.line <= relative_pos.line + 10'd414;
			default:	actual_pos.line <= relative_pos.line + 10'd0;
		endcase
	end
	
	always_comb begin
		case (col)
			5'd0:		actual_pos.pixel <= relative_pos.pixel + 10'd100;
			5'd1:		actual_pos.pixel <= relative_pos.pixel + 10'd149;
			5'd2:		actual_pos.pixel <= relative_pos.pixel + 10'd198;
			5'd3:		actual_pos.pixel <= relative_pos.pixel + 10'd248;
			5'd4:		actual_pos.pixel <= relative_pos.pixel + 10'd297;
			5'd5:		actual_pos.pixel <= relative_pos.pixel + 10'd346;
			5'd6:		actual_pos.pixel <= relative_pos.pixel + 10'd396;
			5'd7:		actual_pos.pixel <= relative_pos.pixel + 10'd445;
			5'd8:		actual_pos.pixel <= relative_pos.pixel + 10'd494;
			default:	actual_pos.pixel <= relative_pos.pixel + 10'd0;
		endcase
	end

endmodule
