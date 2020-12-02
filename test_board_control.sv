module test_board_control();

    logic clock = 1;
    logic [3:0] key, new_x, new_y;

    always #25 clock = ~clock;

    board_control dutxboard_control(
        // Input
        .clock(clock),
        .key_input(key),
        // Outputs
        .new_grid_i(new_y),
        .new_grid_j(new_x)
    );

    task testControl(input logic [3:0] in_key, exp_x, exp_y);
    @(negedge clock);
        key <= in_key;
    @(posedge clock);
    #1 tx: assert (new_x == exp_x)
        else
            $display("key=%d exp_x=%d actual_x=%d", key, exp_x, new_x);
    #1 ty: assert (new_y == exp_y)
        else
            $display("key=%d exp_y=%d actual_y=%d", key, exp_y, new_y);
    endtask


    initial
    begin
        testControl(2, 0, 0);
        testControl(3, 0, 0);
        testControl(1, 0, 1);
        testControl(1, 0, 2);
        testControl(1, 0, 3);
        testControl(1, 0, 4);
        testControl(4, 1, 4);
        testControl(4, 2, 4);
        testControl(4, 3, 4);
        testControl(4, 4, 4);
        testControl(4, 5, 4);
        testControl(4, 6, 4);
        testControl(4, 7, 4);
        testControl(4, 8, 4);
        testControl(4, 8, 4);
        testControl(1, 8, 5);
        testControl(5, 8, 5);
        testControl(2, 7, 5);
        testControl(1, 7, 6);
        testControl(1, 7, 7);
        testControl(1, 7, 8);
        testControl(1, 7, 8);
        $display("Test Complete.");
        #50 $stop;
    end

endmodule