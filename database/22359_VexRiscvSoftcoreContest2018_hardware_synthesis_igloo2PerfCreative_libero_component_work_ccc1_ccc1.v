// This program was cloned from: https://github.com/SpinalHDL/VexRiscvSoftcoreContest2018
// License: Apache License 2.0

//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Mon Nov 19 15:05:18 2018
// Version: v11.8 SP2 11.8.2.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// ccc1
module ccc1(
    // Inputs
    RCOSC_25_50MHZ,
    // Outputs
    GL0,
    LOCK
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  RCOSC_25_50MHZ;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output GL0;
output LOCK;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire   GL0_net_0;
wire   LOCK_net_0;
wire   RCOSC_25_50MHZ;
wire   GL0_net_1;
wire   LOCK_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   GND_net;
wire   [7:2]PADDR_const_net_0;
wire   [7:0]PWDATA_const_net_0;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign GND_net            = 1'b0;
assign PADDR_const_net_0  = 6'h00;
assign PWDATA_const_net_0 = 8'h00;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign GL0_net_1  = GL0_net_0;
assign GL0        = GL0_net_1;
assign LOCK_net_1 = LOCK_net_0;
assign LOCK       = LOCK_net_1;
//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------ccc1_ccc1_0_FCCC   -   Actel:SgCore:FCCC:2.0.201
ccc1_ccc1_0_FCCC ccc1_0(
        // Inputs
        .RCOSC_25_50MHZ ( RCOSC_25_50MHZ ),
        // Outputs
        .GL0            ( GL0_net_0 ),
        .LOCK           ( LOCK_net_0 ) 
        );


endmodule
