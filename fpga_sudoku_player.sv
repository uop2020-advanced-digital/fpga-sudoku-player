// Top module of sudoku player
module fpga_sudoku_player(
    (* chip_pin = "AG15" *)input logic clock, 
	 (* chip_pin = "Y23" *) input logic board_enable, 
	 (* chip_pin = "Y24" *) input logic board_sel,
	 
	 
    (* chip_pin = "AD27, AC27, AC28, AB28" *) input logic [3:0] key_input, 
	 input logic [3:0] user_value, // These vars will come from keyboard
	
	// for testing purposes
	(* chip_pin = "N21" *) input logic cursor_down,
	(* chip_pin = "M21" *) input logic cursor_right,
	
	// VGA output signals
	(* chip_pin = "H10, H8, J12, G10, F12, D10, E11, E12" *) output logic [7:0] vga_r,
	(* chip_pin = "C9, F10, B8, C8, H12, F8, G11, G8" *) output logic [7:0] vga_g,
	(* chip_pin = "D12, D11, C12, A11, B11, C11, A10, B10" *) output logic [7:0] vga_b,
	(* chip_pin = "A12" *) output logic vga_clk,
	(* chip_pin = "F11" *) output logic vga_blank_n, // active low
	(* chip_pin = "C10" *) output logic vga_sync_n, // active low
	(* chip_pin = "G13" *) output logic vga_hs,
	(* chip_pin = "C13" *) output logic vga_vs

);

    logic [3:0] display_grid [8:0][8:0];

    gamelogic_top xgame_logic_top(
        // Inputs
        .clock(clock),
        .board_enable(board_enable),
        .board_sel(board_sel),
        .key_input(key_input),
        .user_value(user_value),
        // Output
        .display_grid(display_grid)
    );
	 
	 display_controller(
		// in
		.clk(clock),
		.cursor_down(cursor_down),
		.cursor_right(cursor_right),
		.display_grid(display_grid),
		// out
		.vga_r(vga_r),
		.vga_g(vga_g),
		.vga_b(vga_b),
		.vga_clk(vga_clk),
		.vga_blank_n(vga_blank_n),
		.vga_sync_n(vga_sync_n),
		.vga_hs(vga_hs),
		.vga_vs(vga_vs)
	 );


endmodule