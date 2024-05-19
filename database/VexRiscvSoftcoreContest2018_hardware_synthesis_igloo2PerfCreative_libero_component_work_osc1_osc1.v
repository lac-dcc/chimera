// This program was cloned from: https://github.com/SpinalHDL/VexRiscvSoftcoreContest2018
// License: Apache License 2.0

//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sat Oct 27 12:00:17 2018
// Version: v11.8 SP2 11.8.2.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// osc1
module osc1(
    // Outputs
    RCOSC_25_50MHZ_CCC
);

//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output RCOSC_25_50MHZ_CCC;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC;
wire   RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC_net_0;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   GND_net;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net = 1'b0;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC_net_0 = RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC;
assign RCOSC_25_50MHZ_CCC                              = RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC_net_0;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------osc1_osc1_0_OSC   -   Actel:SgCore:OSC:2.0.101
osc1_osc1_0_OSC osc1_0(
        // Inputs
        .XTL                ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .RCOSC_25_50MHZ_CCC ( RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC ),
        .RCOSC_25_50MHZ_O2F (  ),
        .RCOSC_1MHZ_CCC     (  ),
        .RCOSC_1MHZ_O2F     (  ),
        .XTLOSC_CCC         (  ),
        .XTLOSC_O2F         (  ) 
        );


endmodule
