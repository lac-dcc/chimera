// This program was cloned from: https://github.com/zf3/nes260
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  Feng Zhou, 2022-6
// 
//  Module to adapt PMOD-LED v1.1 with KV260 PMOD
//  din[7:0] will light up LED7 - LED0 correspondingly
//
//  Mapping through testing:
//  PMOD  ->  LED
//   0         4
//   1         0
//   2         5
//   3         1
//   4         6
//   5         2
//   6         7
//   7         3
//////////////////////////////////////////////////////////////////////////////////

// This need a XDC file
//set_property PACKAGE_PIN H12 [get_ports pmod[0]] ;# PMOD pin 1 - som240_1_a17
//set_property PACKAGE_PIN B10 [get_ports pmod[1]] ;# PMOD pin 2 - som240_1_b20  
//set_property PACKAGE_PIN E10 [get_ports pmod[2]] ;# PMOD pin 3 - som240_1_d20
//set_property PACKAGE_PIN E12 [get_ports pmod[3]] ;# PMOD pin 4 - som240_1_b21
//set_property PACKAGE_PIN D10 [get_ports pmod[4]] ;# PMOD pin 5 - som240_1_d21
//set_property PACKAGE_PIN D11 [get_ports pmod[5]] ;# PMOD pin 6 - som240_1_b22
//set_property PACKAGE_PIN C11 [get_ports pmod[6]] ;# PMOD pin 7 - som240_1_d22
//set_property PACKAGE_PIN B11 [get_ports pmod[7]] ;# PMOD pin 8 - som240_1_c22

//set_property IOSTANDARD LVCMOS33 [get_ports pmod*];
//set_property SLEW SLOW [get_ports pmod*];
//set_property DRIVE 4 [get_ports pmod*];

module pmod_led(
    input [7:0] din,
    output [7:0] dout
    );

assign dout[1] = ~din[0];
assign dout[3] = ~din[1];
assign dout[5] = ~din[2];
assign dout[7] = ~din[3];
assign dout[0] = ~din[4];
assign dout[2] = ~din[5];
assign dout[4] = ~din[6];
assign dout[6] = ~din[7];

endmodule

