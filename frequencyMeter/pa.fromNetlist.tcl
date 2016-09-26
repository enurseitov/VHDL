
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name frequencyMeter -dir "C:/Users/ster/VHDL/frequencyMeter/planAhead_run_2" -part xc3s500efg320-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/ster/VHDL/frequencyMeter/device.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/ster/VHDL/frequencyMeter} }
set_property target_constrs_file "port_mapping.ucf" [current_fileset -constrset]
add_files [list {port_mapping.ucf}] -fileset [get_property constrset [current_run]]
link_design
