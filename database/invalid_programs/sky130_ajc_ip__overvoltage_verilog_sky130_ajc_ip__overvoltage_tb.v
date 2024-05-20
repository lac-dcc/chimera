// This program was cloned from: https://github.com/ajcci/sky130_ajc_ip__overvoltage
// License: Apache License 2.0

//############################################################################
// Copyright 2024 Ajacci, Ltd. Co.
// License: Apache License, Version 2.0 with Addendum, see NOTICE
// Date: 22 March, 2024   Rev 0
// Description: Testbench for over-voltage detector
//############################################################################

`include "sky130_ajc_ip__overvoltage.v"
module sky130_ajc_ip__overvoltage_tb();

real avdd;
real vbg_1v2;
logic [3:0] otrip;
logic ena;
logic isrc_sel;
real ibg_200n;
real vin;

sky130_ajc_ip__overvoltage sky130_ajc_ip__overvoltage(
//INPUTS
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.vbg_1v2(vbg_1v2),
.otrip(otrip),
.ena(ena), //debug
.isrc_sel(isrc_sel), //debug
.ibg_200n(ibg_200n), //debug 200nA current
//OUTPUTS
.ovout(ovout),
//DEBUG OUTPUTS
.itest(itest),
.vin(vin)
);

assign avss = 1'b0;
assign dvdd = 1'b1;
assign dvss = 1'b0;

initial begin
  $dumpfile("sky130_ajc_ip__overvoltage_tb.vcd");
  $dumpvars(0,sky130_ajc_ip__overvoltage_tb);

  //INPUTS
  avdd = 2.0;
  vbg_1v2 = 1.2;
  otrip = 4'b1111;
  //DEBUG INPUTS
  ena = 1'b1;
  isrc_sel = 1'b0;
  ibg_200n = 200e-9;
  #20000000
  avdd = 5.4;
  #80000000
  avdd = 5.6;
  #40000000
  avdd = 3.3;
  #80000000
  $finish;
end


endmodule
