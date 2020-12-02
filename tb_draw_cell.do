if {[file exists work]} {
	vdel -lib work -all
}
vlib work
vmap work work

# design files #
vlog -sv -work work [pwd]/screen.sv
vlog -sv -work work [pwd]/position_decoder.sv
vlog -sv -work work [pwd]/font_provider.sv
vlog -sv -work work [pwd]/draw_cell.sv

# utils package #
# vlog -sv -work work [pwd]/testbench_utils.sv

# testbench file #
vlog -sv -work work [pwd]/tb_draw_cell.sv

# top-level module #
vsim tb_draw_cell

# waves #
add wave clk
add wave start_write
add wave working
add wave cell_row
add wave cell_col
add wave dut/current_pos
add wave absolute_position
add wave cell_data
add wave color_code




view structure 
view signals 

# run time #
run 20ms

view -undock wave
wave zoomfull 