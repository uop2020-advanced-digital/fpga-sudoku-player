vlog -sv -work work [pwd]/board_selector.sv
vlog -sv -work work [pwd]/test_board_selector.sv
vsim test_board_selector

add wave -radix b *
add wave -radix b dutxboard_selector/*
view structure
view signals

run 3000
wave zoomfull
