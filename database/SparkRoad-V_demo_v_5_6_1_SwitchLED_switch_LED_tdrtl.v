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


  assign led[15] = switch[15];
  assign led[14] = switch[14];
  assign led[13] = switch[13];
  assign led[12] = switch[12];
  assign led[11] = switch[11];
  assign led[10] = switch[10];
  assign led[9] = switch[9];
  assign led[8] = switch[8];
  assign led[7] = switch[7];
  assign led[6] = switch[6];
  assign led[5] = switch[5];
  assign led[4] = switch[4];
  assign led[3] = switch[3];
  assign led[2] = switch[2];
  assign led[1] = switch[1];
  assign led[0] = switch[0];

endmodule 

