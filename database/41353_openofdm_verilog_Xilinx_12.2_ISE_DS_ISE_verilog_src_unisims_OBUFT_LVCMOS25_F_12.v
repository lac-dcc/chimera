// This program was cloned from: https://github.com/jhshi/openofdm
// License: Apache License 2.0

// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/verunilibs/data/unisims/OBUFT_LVCMOS25_F_12.v,v 1.6 2007/05/23 21:43:43 patrickp Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  3-State Output Buffer with LVCMOS25 I/O Standard Fast Slew 12 mA Drive
// /___/   /\     Filename : OBUFT_LVCMOS25_F_12.v
// \   \  /  \    Timestamp : Thu Mar 25 16:43:09 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    05/23/07 - Changed timescale to 1 ps / 1 ps.
//    05/23/07 - Added wire declaration for internal signals.

`timescale  1 ps / 1 ps


module OBUFT_LVCMOS25_F_12 (O, I, T);

    output O;

    input  I, T;

    wire ts;

    tri0 GTS = glbl.GTS;

    or O1 (ts, GTS, T);
    bufif0 T1 (O, I, ts);


endmodule

