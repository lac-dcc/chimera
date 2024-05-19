// This program was cloned from: https://github.com/apuder/TRS-IO
// License: GNU General Public License v3.0

//Copyright (C)2014-2022 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//GOWIN Version: V1.9.8.05
//Part Number: GW1NR-LV9QN88PC6/I5
//Device: GW1NR-9C
//Created Time: Mon Jun 06 17:15:20 2022

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

    Gowin_CLKDIV1 your_instance_name(
        .clkout(clkout_o), //output clkout
        .hclkin(hclkin_i), //input hclkin
        .resetn(resetn_i) //input resetn
    );

//--------Copy end-------------------
