transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/memory.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/ALU.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/mux2to1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/mux4to1_3b.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/counter_3b.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/RegisterFile.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/mux8to1_3b.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/mux8to1_16b.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/se6_16.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/se79_16.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/se97_16.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/shifter.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/temp_reg.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/instruction_reg.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/temp_reg_with_en.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/register_3b.v}
vlog -vlog01compat -work work +incdir+C:/Users/Kalpesh\ Patil/OneDrive/Acads/Ankit-kalpesh/Project1 {C:/Users/Kalpesh Patil/OneDrive/Acads/Ankit-kalpesh/Project1/mux4to1_16b.v}

