transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+H:/Veri/part_2/mylib {H:/Veri/part_2/mylib/clk_tick.v}
vlog -vlog01compat -work work +incdir+H:/Veri/part_3/ex10 {H:/Veri/part_3/ex10/spi2dac.v}
vlog -vlog01compat -work work +incdir+H:/Veri/part_3/ex10 {H:/Veri/part_3/ex10/ex10_top.v}

