import screen::*;
module cursor_provider(
	input logic clk,
	input logic [6:0] iter,
	output position pos
);

	(* ram_init_file = "mif/cursor.mif" *) position sprite [47:0];
	
	always_ff @(negedge clk) begin
		pos <= sprite[iter];
	end

endmodule
