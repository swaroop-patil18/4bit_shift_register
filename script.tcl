read_lib /home/install/FOUNDRY/digital/45nm/dig/lib/fast.lib
read_hdl /home/asic/02fe23bec401/sdp/code.v
       elaborate shift_register_siso_sipo
       read_sdc constraints.sdc
      syn_generic
      write_hdl
      syn_map
      syn_opt
      write_hdl
      write_hdl > code.v
      write_sdc > code.sdc
      report_area
      report_gates
      report_gates -power
     report_timing -unconstrained
      gui_show
      history
@genus:root: 30> exit
