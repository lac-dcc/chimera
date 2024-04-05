  //Example instantiation for system 'nios_system'
  nios_system nios_system_inst
    (
      .clk_0                        (clk_0),
      .in_port_to_the_new_number    (in_port_to_the_new_number),
      .out_port_from_the_green_LEDs (out_port_from_the_green_LEDs),
      .out_port_from_the_red_LEDs   (out_port_from_the_red_LEDs),
      .reset_n                      (reset_n)
    );

