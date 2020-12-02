// Top module of sudoku player
module fpga_sudoku_player(
    input logic clock, board_enable, board_sel,
    input logic [3:0] key_input, user_value, // These vars will come from keyboard

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


endmodule