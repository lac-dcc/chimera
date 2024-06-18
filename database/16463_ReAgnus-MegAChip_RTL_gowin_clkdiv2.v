// This program was cloned from: https://github.com/jbilander/ReAgnus-MegAChip
// License: Creative Commons Attribution Share Alike 4.0 International

//Copyright (C)2014-2022 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.8.08
//Part Number: GW1NR-UV9LQ144PC6/I5
//Device: GW1NR-9C
//Created Time: Wed May 08 15:28:19 2024

module Gowin_CLKDIV2 (clkout, hclkin, resetn);

output clkout;
input hclkin;
input resetn;

wire gw_gnd;

assign gw_gnd = 1'b0;

CLKDIV clkdiv2_gen_C14M (
    .CLKOUT(clkout),
    .HCLKIN(hclkin),
    .RESETN(resetn),
    .CALIB(gw_gnd)
);

defparam clkdiv2_gen_C14M.DIV_MODE = "2";
defparam clkdiv2_gen_C14M.GSREN = "false";

endmodule //Gowin_CLKDIV2
