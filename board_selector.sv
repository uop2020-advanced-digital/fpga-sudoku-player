// Module used to select which game board to use.
module board_selector(
    input logic board_enable, clock, board_sel,
    input logic [3:0] initial_board [8:0][8:0],
    input logic [3:0] initial_status [8:0][8:0],

    output logic [3:0] game_board [8:0][8:0],
    output logic [3:0] game_status [8:0][8:0]
);

    logic [3:0] board1 [8:0][8:0] = '{
        '{0, 4, 0, 0, 5, 0, 3, 0, 1},
        '{0, 3, 0, 6, 0, 1, 9, 0, 0},
        '{1, 0, 9, 0, 0, 2, 0, 0, 8},
        '{3, 8, 0, 0, 0, 9, 0, 4, 0},
        '{0, 0, 7, 0, 6, 0, 5, 0, 0},
        '{0, 5, 0, 4, 0, 0, 0, 8, 6},
        '{8, 0, 0, 2, 0, 0, 7, 0, 3},
        '{0, 0, 3, 8, 0, 5, 0, 6, 0},
        '{2, 0, 4, 0, 3, 0, 0, 1, 0}
    };

    logic [3:0] board2 [8:0][8:0] = '{
        '{0, 0, 4, 0, 0, 7, 0, 2, 8},
        '{8, 7, 0, 0, 0, 1, 3, 0, 0},
        '{2, 0, 0, 0, 8, 9, 0, 0, 7},
        '{0, 0, 0, 4, 3, 0, 9, 1, 0},
        '{0, 3, 8, 0, 0, 0, 2, 4, 0},
        '{0, 4, 9, 0, 5, 2, 0, 0, 0},
        '{7, 0, 0, 8, 1, 0, 0, 0, 4},
        '{0, 0, 1, 6, 0, 0, 0, 3, 2},
        '{3, 8, 0, 9, 0, 0, 6, 0, 0}
    };

    always_ff@(posedge clock)
    begin
        if (board_enable == 1 && board_sel == 0) begin
            game_board <= board1;
            game_status <= board1;
        end else if (board_enable == 1 && board_sel == 1) begin
            game_board <= board2;
            game_status <= board2;
        end else begin
            game_board <= initial_board;
            game_status <= initial_status;
        end

    end

endmodule