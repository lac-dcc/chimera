// This program was cloned from: https://github.com/apuder/TRS-IO
// License: GNU General Public License v3.0

//Copyright (C)2014-2022 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.8.09 Education
//Part Number: GW2A-LV18PG256C8/I7
//Device: GW2A-18C
//Created Time: Wed May 17 06:46:12 2023

module Gowin_DCS0 (clkout, clksel, clk0, clk1, clk2, clk3);

output clkout;
input [3:0] clksel;
input clk0;
input clk1;
input clk2;
input clk3;

wire gw_vcc;

assign gw_vcc = 1'b1;

DCS dcs_inst (
    .CLKOUT(clkout),
    .CLKSEL(clksel),
    .CLK0(clk0),
    .CLK1(clk1),
    .CLK2(clk2),
    .CLK3(clk3),
    .SELFORCE(gw_vcc)
);

defparam dcs_inst.DCS_MODE = "RISING";

endmodule //Gowin_DCS0
