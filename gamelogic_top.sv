// Top Module for Game Logic section.
module gamelogic_top(
    input logic clock, board_enable, board_sel,
    input logic [3:0] key_input, user_value,

    output logic [3:0] display_grid [8:0][8:0]
);

    //             Status Codes              //
    // >0 = Write To | 0 = Given Square //

    
    // Load and Select Board
    logic [3:0] pre_selector_board [8:0][8:0];
    logic [3:0] post_selector_board [8:0][8:0];
    logic [3:0] pre_status_board [8:0][8:0];
    logic [3:0] post_status_board [8:0][8:0];

    board_selector xboard_selector(
        // Inputs
        .board_enable(board_enable),
        .clock(clock),
        .board_sel(board_sel),
        .initial_board(pre_selector_board),
        .initial_status(pre_status_board),
        // Outputs
        .game_board(post_selector_board),
        .game_status(post_status_board)
    );


    // Control for i, j, and user_value
    logic [3:0] grid_i, grid_j;

    board_control xboard_control(
        // Inputs
        .clock(clock),
        .key_input(key_input),
        // Outputs
        .new_grid_i(grid_i),
        .new_grid_j(grid_j)
    );

    logic [3:0] new_grid_i, new_grid_j;
    assign new_grid_i = grid_i;
    assign new_grid_j = grid_j;
    
    // Write to grid on update
    board_update xboard_update(
        // Inputs
        .clock(clock),
        .i(new_grid_i),
        .j(new_grid_j),
        .user_value(user_value),
        .guess_grid(post_selector_board),
        .status_grid(post_status_board),
        // Outputs
        .display_grid(display_grid)
    );

    // Check if board has been successfully solved
    //              To be implemented soon      //


endmodule