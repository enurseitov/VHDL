
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name b8adder -dir "C:/Users/ster/VHDL/b8adder/planAhead_run_1" -part xc3s500efg320-5
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/ster/VHDL/b8adder/fourBitAdder.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/ster/VHDL/b8adder} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "fourBitAdder.ucf" [current_fileset -constrset]
add_files [list {fourBitAdder.ucf}] -fileset [get_property constrset [current_run]]
link_design
