// This program was cloned from: https://github.com/jhshi/openofdm
// License: Apache License 2.0

// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/verunilibs/data/unisims/MUXF6.v,v 1.11 2007/08/23 23:00:26 yanx Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  2-to-1 Lookup Table Multiplexer with General Output
// /___/   /\     Filename : MUXF6.v
// \   \  /  \    Timestamp : Thu Mar 25 16:42:55 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    02/04/05 - Rev 0.0.1 Remove input/output bufs; Remove unnessasary begin/end;
//    05/10/07 - When input same, output same for any sel value. (CR434611).
//    08/23/07 - User block statement (CR446704).
// End Revision

`timescale  1 ps / 1 ps


module MUXF6 (O, I0, I1, S);

    output O;
    reg    O;

    input  I0, I1, S;

	always @(I0 or I1 or S)
	    if (S)
		O = I1;
	    else
		O = I0;
endmodule

