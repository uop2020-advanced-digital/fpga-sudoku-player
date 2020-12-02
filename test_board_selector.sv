// Module used to test board_selector
// Port Sizes are modified in order to perform easier testing.
module test_board_selector();

    logic clock = 0;
    logic board_enable, board_sel;
    logic [3:0] initial_status [8:0][8:0];
    logic [3:0] initial_board [8:0][8:0];
    logic [3:0] game_board [8:0][8:0];
    logic [3:0] game_status [8:0][8:0];

    always #10 clock = ~clock;

    // Connect device to test
    board_selector dutxboard_selector(
        // Inputs
        .board_enable(board_enable),
        .board_sel(board_sel),
        .clock(clock),
        .initial_board(initial_board),
        .initial_status(initial_status),
        // Output
        .game_board(game_board),
        .game_status(game_status)
    );


    task testBoard(input logic [3:0] in_board_enable, in_board_sel,
        input logic [3:0] y, x, exp_value);

        @(negedge clock)
        board_enable <= in_board_enable;
        board_sel <= in_board_sel;


        @(posedge clock)
        #1 b00: assert (game_board[y][x] == exp_value)
            else
                $display("board_en=%d board_sel=%d game_board[%d][%d] = %d",
                board_enable, board_sel, y, x, game_board[y][x]);

    endtask

    initial
    begin
        $display("Starting Test of Board 1");
        testBoard(1, 0, 0, 8, 2);
        testBoard(1, 0, 0, 8, 2);
        testBoard(1, 0, 1, 1, 6);
        testBoard(1, 0, 2, 8, 8);

        $display("Starting Test of Board 2");
        testBoard(1, 1, 0, 8, 3);
        testBoard(1, 1, 0, 7, 8);
        $display("Testing complete.");
        #10 $stop;

    end

endmodule
