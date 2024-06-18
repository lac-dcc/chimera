// This program was cloned from: https://github.com/hacksterous/Zed80
// License: GNU General Public License v3.0

//Copyright (C)2014-2024 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//Tool Version: V1.9.9.02
//Part Number: GW2AR-LV18QN88C8/I7
//Device: GW2AR-18
//Device Version: C
//Created Time: Mon May  6 11:34:07 2024

module mCLKDIV (clkout, hclkin, resetn);

output clkout;
input hclkin;
input resetn;

wire gw_gnd;

assign gw_gnd = 1'b0;

CLKDIV clkdiv_inst (
    .CLKOUT(clkout),
    .HCLKIN(hclkin),
    .RESETN(resetn),
    .CALIB(gw_gnd)
);

defparam clkdiv_inst.DIV_MODE = "4";
defparam clkdiv_inst.GSREN = "false";

endmodule //mCLKDIV
