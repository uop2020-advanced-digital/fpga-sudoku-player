if {[file exists work]} {
	vdel -lib work -all
}
vlib work
vmap work work

# design files #
vlog -sv -work work [pwd]/screen.sv
vlog -sv -work work [pwd]/framebuffer.sv
vlog -sv -work work [pwd]/buffer_ctl.sv
vlog -sv -work work [pwd]/vga.sv
vlog -sv -work work [pwd]/clock_divider.sv
vlog -sv -work work [pwd]/display_controller.sv

# utils package #
# vlog -sv -work work [pwd]/testbench_utils.sv

# testbench file #
vlog -sv -work work [pwd]/tb_display_controller.sv

# top-level module #
vsim tb_display_controller

# waves #
add wave clk
add wave dut/pixel_clk
add wave vga_clk
add wave dut/sig

add wave dut/pixel_request
add wave dut/screen_pixel
add wave vga_r
add wave vga_g
add wave vga_b
add wave vga_blank_n
add wave vga_sync_n
add wave vga_hs
add wave vga_vs

# add wave dut/bufctl/ctl


view structure 
view signals 

# run time #
run 4ms

view -undock wave
wave zoomfull 