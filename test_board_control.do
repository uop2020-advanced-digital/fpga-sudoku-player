vlog -sv -work work [pwd]/board_control.sv
vlog -sv -work work [pwd]/test_board_control.sv
vsim test_board_control

add wave -radix d *
add wave -radix b dutxboard_control/*

view structure
view signals

run 3000
wave zoomfull
