module clock_divider(
	input logic clk_in,
	output logic clk_out
);
	logic halved = 1'b0;
	assign clk_out = halved;
	
	always_ff @ (posedge clk_in)
		halved <= ~halved;

endmodule
