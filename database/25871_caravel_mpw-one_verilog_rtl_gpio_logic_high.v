// This program was cloned from: https://github.com/efabless/caravel_mpw-one
// License: Apache License 2.0

module gpio_logic_high(
 `ifdef USE_POWER_PINS
         inout vccd1,
         inout vssd1,
  `endif

   output wire gpio_logic1
);

 sky130_fd_sc_hd__conb_1 gpio_logic_high (
`ifdef USE_POWER_PINS
            .VPWR(vccd1),
            .VGND(vssd1),
            .VPB(vccd1),
            .VNB(vssd1),
`endif
            .HI(gpio_logic1),
            .LO()
    );

endmodule
