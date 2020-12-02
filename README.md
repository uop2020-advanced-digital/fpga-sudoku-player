# fpga-sudoku-player
A sudoku player implemented on an Intel Cyclone FPGA board. Sudoku inputs are registered via ps2 keyboard connection, and the game is displayed via VGA.


## Game Logic Top Description

This submodule is used to control the game logic. This portion consists of initializing the sudoku game board, resetting / changing the sudoku game, accepting the keyboard input, and traversing through the game board to input the user value.

# Parameters and Usage of Sub-Module

- `board_enable`: map to an input switch to enable which game board selection. In order to have values displayed, this switch must go high.

- `board_sel`: map to an input switch to select which game board to use. There are currently only two boards available.

- `key_input`: is the keyboard input. These values are translated so that the module can traverse the game grid successfully.

- `user_value`: the user_value recieved from the keyboard.

- `display_grid`: 4 bit 9x9 array to be displayed via VGA.
