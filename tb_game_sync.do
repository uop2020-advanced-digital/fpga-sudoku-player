if {[file exists work]} {
	vdel -lib work -all
}
vlib work
vmap work work

# design files #
vlog -sv -work work [pwd]/screen.sv
vlog -sv -work work [pwd]/board_sync.sv
vlog -sv -work work [pwd]/cell_position.sv
vlog -sv -work work [pwd]/font_provider.sv
vlog -sv -work work [pwd]/draw_cell.sv
vlog -sv -work work [pwd]/cursor_sync.sv
vlog -sv -work work [pwd]/cursor_position.sv
vlog -sv -work work [pwd]/cursor_provider.sv
vlog -sv -work work [pwd]/draw_cursor.sv
vlog -sv -work work [pwd]/game_sync.sv

# utils package #
# vlog -sv -work work [pwd]/testbench_utils.sv

# testbench file #
vlog -sv -work work [pwd]/tb_game_sync.sv

# top-level module #
vsim tb_game_sync

# waves #
add wave clk
add wave dut/current_state

add wave dut/drawing_cell
add wave dut/drawing_cursor
add wave dut/start_cursor
add wave dut/start_cell

add wave dut/actual_cursor_row
add wave dut/actual_cursor_col
add wave dut/cursor_scanner/stored_cursor_row
add wave dut/cursor_scanner/stored_cursor_col
add wave dut/cursor_drawer/iter
add wave dut/cursor_drawer/coord_iter
add wave dut/cursor_drawer/current_pos
add wave dut/cursor_drawer/draw_cursor_row
add wave dut/cursor_drawer/draw_cursor_col
add wave dut/cursor_drawer/stored_row
add wave dut/cursor_drawer/stored_col
add wave dut/cursor_drawer/pos_muxer/row
add wave dut/cursor_drawer/pos_muxer/col
add wave dut/cursor_drawer/cursor_draw_pos

add wave write_pos
add wave write_data

view structure 
view signals 

# run time #
run 20ns

view -undock wave
wave zoomfull 