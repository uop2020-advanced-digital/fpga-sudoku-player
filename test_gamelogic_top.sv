module test_gamelogic_top();

    logic clock = 0;
    logic board_enable, board_sel;
    logic [3:0] key_input, user_value;
    logic [3:0] initial_grid [8:0][8:0];
    logic [3:0] guess_grid [8:0][8:0];
    logic [3:0] display_grid [8:0][8:0];

    always #25 clock = ~clock;

    // Connect device to test
    gamelogic_top dutxgamelogic_top(
        // Inputs
        .clock(clock),
        .board_enable(board_enable),
        .board_sel(board_sel),
        .key_input(key_input),
        .user_value(user_value),
        .initial_grid(initial_grid),
        .guess_grid(guess_grid),
        // Outputs
        .display_grid(display_grid)
    );


    task testGame(input logic in_board_en, in_board_sel,
        input logic [3:0] in_key_input, in_user_value);

        @(negedge clock)
        board_enable <= in_board_en;
        board_sel <= in_board_sel;
        key_input <= in_key_input;
        user_value <= user_value;

        @(posedge clock);

    endtask


    initial
    begin
        $display("Starting writing test");
        $display("Test Complete.");
        testGame(1, 1);
        #25 $stop;
    end

endmodule