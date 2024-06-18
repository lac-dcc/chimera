// This program was cloned from: https://github.com/jbilander/ReAgnus-MegAChip
// License: Creative Commons Attribution Share Alike 4.0 International

//Copyright (C)2014-2022 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.8.08
//Part Number: GW1NR-UV9LQ144PC6/I5
//Device: GW1NR-9C
//Created Time: Wed May 08 17:30:38 2024

module Gowin_CLKDIV4 (clkout, hclkin, resetn);

output clkout;
input hclkin;
input resetn;

wire gw_gnd;

assign gw_gnd = 1'b0;

CLKDIV clkdiv4_gen_C7M (
    .CLKOUT(clkout),
    .HCLKIN(hclkin),
    .RESETN(resetn),
    .CALIB(gw_gnd)
);

defparam clkdiv4_gen_C7M.DIV_MODE = "4";
defparam clkdiv4_gen_C7M.GSREN = "false";

endmodule //Gowin_CLKDIV4
