// Module used to control and verify that I, J, and input are valid.
module board_control(
    input logic clock,
    input logic [3:0] key_input,
    output logic [3:0] new_grid_i, new_grid_j
);

    logic [3:0] grid_i = 0;
    logic [3:0] grid_j = 0;

    always_ff@(posedge clock)
    //always_comb
    begin

        // Based on key input, inc / dec grid x/y
        if (key_input == 1 && grid_i != 4'b1000) begin// W 
            grid_i <= grid_i + 1;
        end

        if (key_input == 2 && grid_j != 4'b0000) begin// D
            grid_j <= grid_j - 1;
        end

        if (key_input == 3 && grid_i != 4'b0000) begin// S
            grid_i <= grid_i - 1;
        end

        if (key_input == 4 && grid_j != 4'b1000) begin// A
            grid_j <= grid_j + 1;
        end
    end

    assign new_grid_i = grid_i;
    assign new_grid_j = grid_j;

endmodule