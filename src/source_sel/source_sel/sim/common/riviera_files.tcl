
namespace eval source_sel {
  proc get_design_libraries {} {
    set libraries [dict create]
    dict set libraries altera_merlin_multiplexer_1921 1
    dict set libraries avst_credit_multiplexer_110    1
    dict set libraries altera_reset_controller_1921   1
    dict set libraries source_sel                     1
    return $libraries
  }
  
  proc get_memory_files {QSYS_SIMDIR} {
    set memory_files [list]
    return $memory_files
  }
  
  proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [dict create]
    return $design_files
  }
  
  proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
    set design_files [list]
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1921/sim/source_sel_altera_merlin_multiplexer_1921_hjfvwkq.sv"]\"  -work altera_merlin_multiplexer_1921"                                                                        
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_merlin_multiplexer_1921/sim/altera_merlin_arbitrator.sv"]\"  -work altera_merlin_multiplexer_1921"                                                                                                 
    lappend design_files "vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/source_sel_avst_credit_multiplexer_altera_merlin_multiplexer_110_l2uosvi.v"]\"  -work avst_credit_multiplexer_110"                                                   
    lappend design_files "vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1921/sim/altera_reset_controller.v"]\"  -work altera_reset_controller_1921"                                                                                                  
    lappend design_files "vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../altera_reset_controller_1921/sim/altera_reset_synchronizer.v"]\"  -work altera_reset_controller_1921"                                                                                                
    lappend design_files "vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/source_sel_avst_credit_multiplexer_altera_reset_controller_110_mpjuyrq.v"]\"  -work avst_credit_multiplexer_110"                                                     
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/acl_altera_syncram_wrapped.sv"]\"  -work avst_credit_multiplexer_110"                    
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/acl_high_speed_fifo.sv"]\"  -work avst_credit_multiplexer_110"                           
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/acl_latency_one_ram_fifo.sv"]\"  -work avst_credit_multiplexer_110"                      
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/acl_latency_zero_ram_fifo.sv"]\"  -work avst_credit_multiplexer_110"                     
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/acl_lfsr.sv"]\"  -work avst_credit_multiplexer_110"                                      
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/acl_low_latency_fifo.sv"]\"  -work avst_credit_multiplexer_110"                          
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/acl_mid_speed_fifo.sv"]\"  -work avst_credit_multiplexer_110"                            
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/acl_reset_handler.sv"]\"  -work avst_credit_multiplexer_110"                             
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/acl_tessellated_incr_decr_threshold.sv"]\"  -work avst_credit_multiplexer_110"           
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/acl_tessellated_incr_lookahead.sv"]\"  -work avst_credit_multiplexer_110"                
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/acl_zero_latency_fifo.sv"]\"  -work avst_credit_multiplexer_110"                         
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/hld_fifo.sv"]\"  -work avst_credit_multiplexer_110"                                      
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/credit2ready.sv"]\"  -work avst_credit_multiplexer_110"                                  
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/credit_manager.sv"]\"  -work avst_credit_multiplexer_110"                                
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/altera_avalon_st_pipeline_base.sv"]\"  -work avst_credit_multiplexer_110"                
    lappend design_files "vlog  $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS {\"+incdir+[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/"]\"} \"[normalize_path "$QSYS_SIMDIR/../avst_credit_multiplexer_110/sim/source_sel_avst_credit_multiplexer_110_xsulssa.sv"]\"  -work avst_credit_multiplexer_110"
    lappend design_files "vlog -v2k5 $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/source_sel.v"]\"  -work source_sel"                                                                                                                                                                     
    return $design_files
  }
  
  proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
    set ELAB_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ELAB_OPTIONS
  }
  
  
  proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
    set SIM_OPTIONS ""
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $SIM_OPTIONS
  }
  
  
  proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
    set ENV_VARIABLES [dict create]
    set LD_LIBRARY_PATH [dict create]
    dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
    if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
    } else {
    }
    return $ENV_VARIABLES
  }
  
  
  proc normalize_path {FILEPATH} {
      if {[catch { package require fileutil } err]} { 
          return $FILEPATH 
      } 
      set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
      if {[file pathtype $FILEPATH] eq "relative"} { 
          set path [fileutil::relative [pwd] $path] 
      } 
      return $path 
  } 
}
