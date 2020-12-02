// Module used to update game board coordinates and value at that spot
module board_update(
    input logic clock,
    input logic [3:0] i, j, user_value,
    input logic [3:0] guess_grid [8:0][8:0],
    input logic [3:0] status_grid [8:0][8:0],

    output logic [3:0] display_grid [8:0][8:0]
);

    //             Status Codes              //
    // 0> = Write To | 0000 = Initial Square //

    logic [3:0] boxes_status;
    logic [3:0] editable_grid [8:0][8:0];

    assign boxes_status = status_grid[i][j];

    // If conditions are met, then write to grid
    always_ff@(posedge clock)
    begin
        display_grid <= guess_grid;

        if (boxes_status != 0)
            // Assign new values to display grid
            display_grid[i][j] <= user_value;
    end


endmodule
