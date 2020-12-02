module test_board_update();

    logic clock = 0;
    logic [3:0] x, y, user_val;
    logic [3:0] game_grid [8:0][8:0];
    logic [3:0] stat_grid [8:0][8:0];
    logic [3:0] disp_grid [8:0][8:0];

    always #10 clock = ~clock;

    // Connect device to test
    board_update dutxboard_update(
        // Inputs
        .clock(clock),
        .i(y),
        .j(x),
        .user_value(user_val),
        .guess_grid(game_grid),
        .status_grid(stat_grid),
        // Output
        .display_grid(disp_grid)
    );

    // Test Write To sections.
    task testWriteTo(input logic [3:0] in_x, in_y, in_val);
        @(negedge clock);
            y = in_y;
            x = in_x;
            user_val = in_val;
            stat_grid[y][x] = 5;
        @(posedge clock);
        #1 tc: assert (disp_grid[y][x] == in_val)
            else
                $display("grid[%d][%d] != (%d %d)", in_y, in_x, in_val, disp_grid[y][x]);
    endtask

    // Test that writing does not happen on Initial statuses.
    task testInitial(input logic [3:0] in_x, in_y, in_val);
        @(negedge clock);
            y <= in_y;
            x <= in_x;
            user_val <= in_val;

            stat_grid[y][x] <= 4'b0001;
        @(posedge clock);
        // Should be unknown since nothing has been initialized.
        #1 tc: assert ($isunknown(disp_grid[y][x]))
            else
                $display("grid[%d][%d] == (%d %d)", in_y, in_x, in_val, disp_grid[y][x]);
    endtask

    initial
    begin
        $display("WRITE TO TESTS");
        testWriteTo(1, 1, 1);
        testWriteTo(3, 8, 9);
        testWriteTo(2, 5, 1);
        testWriteTo(7, 8, 2);
        testWriteTo(5, 6, 5);
        testWriteTo(6, 1, 3);

        $display("GIVEN TESTS");
        testInitial(2, 4, 6);
        testInitial(8, 8, 8);
        testInitial(0, 0, 1);
        testInitial(3, 7, 1);
        testInitial(3, 0, 10);

        $display("Tests complete.");
        #10 $stop;
    end


endmodule