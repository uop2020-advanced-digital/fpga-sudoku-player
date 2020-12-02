if {[file exists work]} {
	vdel -lib work -all
}
vlib work
vmap work work

# design files #
vlog -sv -work work [pwd]/screen.sv
vlog -sv -work work [pwd]/clock_divider.sv
vlog -sv -work work [pwd]/vga.sv

# utils package #
# vlog -sv -work work [pwd]/testbench_utils.sv

# testbench file #
vlog -sv -work work [pwd]/tb_vga.sv

# top-level module #
vsim tb_vga

# waves #
add wave vga_clk
add wave pixel_clk
add wave dut/line_clk

add wave pixel_in
add wave vga_r
add wave vga_g
add wave vga_b
add wave vga_blank_n
add wave vga_sync_n
add wave vga_hs
add wave vga_vs

add wave dut/current_pixel
add wave dut/h_timer
add wave dut/v_timer

add wave sig




view structure 
view signals 

# run time #
run 20ms

view -undock wave
wave zoomfull 