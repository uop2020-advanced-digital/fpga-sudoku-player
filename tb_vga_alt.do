if {[file exists work]} {
	vdel -lib work -all
}
vlib work
vmap work work

# design files #
vlog -sv -work work [pwd]/vizzy.sv
vlog -sv -work work [pwd]/screen.sv
vlog -sv -work work [pwd]/vga_alt.sv

# utils package #
# vlog -sv -work work [pwd]/testbench_utils.sv

# testbench file #
vlog -sv -work work [pwd]/tb_vga_alt.sv

# top-level module #
vsim tb_vga_alt

# waves #
add wave pixel_clk
add wave vga_clk

add wave vga_blank_n
add wave vga_sync_n
add wave vga_hs
add wave vga_vs
add wave pixel_in
add wave vga_r
add wave vga_g
add wave vga_b

add wave dut/current_state




view structure 
view signals 

# run time #
run 4ms # a few frames

view -undock wave
wave zoomfull 