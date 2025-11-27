create_clock -name clk -period 2 [get_ports "clk"]
      set
       set_clock_transition -rise 0.01 [get_clocks "clk"]
       set_clock
       set_clock_transition -fall 0.01 [get_clocks "clk"]
       set_clock
      set_clock_uncertainty 0.05 [get_clock "clk"]
      set_clock_uncertainty 0.05 [get_clocks "clk"]
      set_input_delay -max 1.0 [get_ports "rst"] -clock [get_clocks "clk"]
      set_output_delay -max 1.0 [get_ports "count"] -clock [get_clocks "clk"]
