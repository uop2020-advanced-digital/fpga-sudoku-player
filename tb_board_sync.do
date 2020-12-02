if {[file exists work]} {
	vdel -lib work -all
}
vlib work
vmap work work

# design files #
vlog -sv -work work [pwd]/screen.sv
vlog -sv -work work [pwd]/board_sync.sv

# utils package #
# vlog -sv -work work [pwd]/testbench_utils.sv

# testbench file #
vlog -sv -work work [pwd]/tb_board_sync.sv

# top-level module #
vsim tb_board_sync

# waves #
add wave clk
add wave working
add wave start_write
add wave cell_row
add wave cell_col
add wave cell_data


view structure 
view signals 

# run time #
run 20ns

view -undock wave
wave zoomfull 