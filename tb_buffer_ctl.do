if {[file exists work]} {
	vdel -lib work -all
}
vlib work
vmap work work

# design files #
vlog -sv -work work [pwd]/screen.sv
vlog -sv -work work [pwd]/framebuffer.sv
vlog -sv -work work [pwd]/buffer_ctl.sv

# utils package #
# vlog -sv -work work [pwd]/testbench_utils.sv

# testbench file #
vlog -sv -work work [pwd]/tb_buffer_ctl.sv

# top-level module #
vsim tb_buffer_ctl

# waves #
add wave clk
add wave sig
add wave dut/ctl

add wave read_pos
add wave write_pos
add wave data_in
add wave data_out

add wave dut/buf_A/rden
add wave dut/buf_A/wren
add wave dut/buf_B/rden
add wave dut/buf_B/wren




view structure 
view signals 

# run time #
run 20ms

view -undock wave
wave zoomfull 