// This program was cloned from: https://github.com/apuder/TRS-IO
// License: GNU General Public License v3.0

//Copyright (C)2014-2022 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: V1.9.8.09 Education
//Part Number: GW2A-LV18PG256C8/I7
//Device: GW2A-18C
//Created Time: Wed May 17 06:46:12 2023

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    Gowin_DCS0 your_instance_name(
        .clkout(clkout_o), //output clkout
        .clksel(clksel_i), //input [3:0] clksel
        .clk0(clk0_i), //input clk0
        .clk1(clk1_i), //input clk1
        .clk2(clk2_i), //input clk2
        .clk3(clk3_i) //input clk3
    );

//--------Copy end-------------------
