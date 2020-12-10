if {[file exists work]} {
	vdel -lib work -all
}
vlib work
vmap work work

# design files #
vlog -sv -work work [pwd]/screen.sv
vlog -sv -work work [pwd]/framebuffer.sv

# utils package #
# vlog -sv -work work [pwd]/testbench_utils.sv

# testbench file #
vlog -sv -work work [pwd]/tb_framebuffer.sv

# top-level module #
vsim tb_framebuffer

# waves #
add wave clk
add wave wren

add wave read_pos
add wave data_out
add wave dut/data_out
add wave dut/frame(read_pos)




view structure 
view signals 

# run time #
run 20ms

view -undock wave
wave zoomfull 