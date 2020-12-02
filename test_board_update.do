vlog -sv -work work [pwd]/board_update.sv
vlog -sv -work work [pwd]/test_board_update.sv
vsim test_board_update

add wave -radix b *
add wave -radix b dutxboard_update/*

view structure
view signals

run 3000
wave zoomfull
