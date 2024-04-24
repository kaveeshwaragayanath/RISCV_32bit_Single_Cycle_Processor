transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {processor.vo}

vlog -sv -work work +incdir+E:/5th_sem/DSD/Processor {E:/5th_sem/DSD/Processor/tb_final_data_path_02.sv}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  tb_final_data_path_02

add wave *
view structure
view signals
run -all
