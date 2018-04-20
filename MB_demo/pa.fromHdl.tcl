
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name MB_demo -dir "F:/FPGA_Study/MB_demo/MB_demo/planAhead_run_1" -part xc6slx16ftg256-2
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "mis603_soc_top.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {mis603_soc/mis603_soc_top.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top mis603_soc_top $srcset
add_files [list {mis603_soc_top.ucf}] -fileset [get_property constrset [current_run]]
add_files [list {F:/FPGA_Study/MB_demo/MB_demo/mis603_soc.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {F:/FPGA_Study/MB_demo/MB_demo/mis603_soc_axi4lite_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {F:/FPGA_Study/MB_demo/MB_demo/mis603_soc_clock_generator_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {F:/FPGA_Study/MB_demo/MB_demo/mis603_soc_microblaze_0_dlmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {F:/FPGA_Study/MB_demo/MB_demo/mis603_soc_microblaze_0_ilmb_wrapper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {F:/FPGA_Study/MB_demo/MB_demo/mis603_soc_microblaze_0_wrapper.ncf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx16ftg256-2
