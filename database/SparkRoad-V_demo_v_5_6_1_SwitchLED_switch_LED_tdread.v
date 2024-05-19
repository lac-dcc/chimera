// This program was cloned from: https://github.com/verimake-team/SparkRoad-V
// License: MIT License

// Verilog netlist created by TD v4.6.12906
// Fri Jul 26 12:55:33 2019

`timescale 1ns / 1ps
module switch_led  // sources/rtl/switch_led.v(15)
  (
  switch,
  led
  );

  input [15:0] switch;  // sources/rtl/switch_led.v(17)
  output [15:0] led;  // sources/rtl/switch_led.v(18)


  buf u0 (led[3], switch[3]);  // sources/rtl/switch_led.v(21)
  buf u1 (led[2], switch[2]);  // sources/rtl/switch_led.v(21)
  buf u10 (led[10], switch[10]);  // sources/rtl/switch_led.v(21)
  buf u11 (led[11], switch[11]);  // sources/rtl/switch_led.v(21)
  buf u12 (led[12], switch[12]);  // sources/rtl/switch_led.v(21)
  buf u13 (led[13], switch[13]);  // sources/rtl/switch_led.v(21)
  buf u14 (led[14], switch[14]);  // sources/rtl/switch_led.v(21)
  buf u15 (led[15], switch[15]);  // sources/rtl/switch_led.v(21)
  buf u2 (led[1], switch[1]);  // sources/rtl/switch_led.v(21)
  buf u3 (led[0], switch[0]);  // sources/rtl/switch_led.v(21)
  buf u4 (led[4], switch[4]);  // sources/rtl/switch_led.v(21)
  buf u5 (led[5], switch[5]);  // sources/rtl/switch_led.v(21)
  buf u6 (led[6], switch[6]);  // sources/rtl/switch_led.v(21)
  buf u7 (led[7], switch[7]);  // sources/rtl/switch_led.v(21)
  buf u8 (led[8], switch[8]);  // sources/rtl/switch_led.v(21)
  buf u9 (led[9], switch[9]);  // sources/rtl/switch_led.v(21)

endmodule 

