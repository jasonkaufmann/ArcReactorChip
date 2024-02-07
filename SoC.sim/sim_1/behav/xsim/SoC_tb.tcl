set curr_wave [current_wave_config]
if { [string length $curr_wave] == 0 } {
  if { [llength [get_objects]] > 0} {
    add_wave /
    set_property needs_save false [current_wave_config]
  } else {
     send_msg_id Add_Wave-1 WARNING "No top level signals found. Simulator will start without a wave window. If you want to open a wave window go to 'File->New Waveform Configuration' or type 'create_wave_config' in the TCL console."
  }
}
log_wave -r /

# execute post tcl file
set rc [catch {
  puts "source post_sim.tcl"
  source "post_sim.tcl"
} result]
if {$rc} {
  [catch {send_msg_id USF-simtcl-1 ERROR "$result"}]
  [catch {send_msg_id USF-simtcl-2 ERROR "Script failed:post_sim.tcl"}]
}

run 10000ns
