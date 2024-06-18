// This program was cloned from: https://github.com/LiamOswald/IMPACT_Custom_SRAM_03
// License: Apache License 2.0


(* blackbox *)
module core_flat_v4(
`ifdef USE_POWER_PINS
    
        inout vdda1,    // User area 1 1.8V power
        inout vssa1,
        inout vccd1,
        inout vssd1,

`endif

input SEL1,
input DIGITALIN1,
input SEL3,
input DIGITALIN3,
input SEL2,
input DIGITALIN2,
inout AIN1,
inout AIN2,
inout AIN3
  );
endmodule
`default_nettype wire

