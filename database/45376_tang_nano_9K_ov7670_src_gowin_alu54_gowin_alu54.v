// This program was cloned from: https://github.com/phoenix367/tang_nano_9K_ov7670
// License: MIT License

//Copyright (C)2014-2023 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.9 Beta-4
//Part Number: GW1NR-LV9QN88PC6/I5
//Device: GW1NR-9
//Device Version: C
//Created Time: Mon Dec 11 04:15:00 2023

module Gowin_ALU54 (dout, caso, a, b, ce, clk, reset);

output [21:0] dout;
output [54:0] caso;
input [20:0] a;
input [10:0] b;
input ce;
input clk;
input reset;

wire [31:0] dout_w;
wire gw_gnd;

assign gw_gnd = 1'b0;

ALU54D alu54d_inst (
    .DOUT({dout_w[31:0],dout[21:0]}),
    .CASO(caso),
    .A({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,a[20:0]}),
    .B({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,b[10:0]}),
    .ASIGN(gw_gnd),
    .BSIGN(gw_gnd),
    .CASI({gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd,gw_gnd}),
    .ACCLOAD(gw_gnd),
    .CE(ce),
    .CLK(clk),
    .RESET(reset)
);

defparam alu54d_inst.AREG = 1'b0;
defparam alu54d_inst.BREG = 1'b0;
defparam alu54d_inst.ASIGN_REG = 1'b0;
defparam alu54d_inst.BSIGN_REG = 1'b0;
defparam alu54d_inst.ACCLOAD_REG = 1'b0;
defparam alu54d_inst.OUT_REG = 1'b1;
defparam alu54d_inst.B_ADD_SUB = 1'b0;
defparam alu54d_inst.C_ADD_SUB = 1'b0;
defparam alu54d_inst.ALUD_MODE = 0;
defparam alu54d_inst.ALU_RESET_MODE = "ASYNC";

endmodule //Gowin_ALU54
