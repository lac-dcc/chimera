// This program was cloned from: https://github.com/jhshi/openofdm
// License: Apache License 2.0

// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/verunilibs/data/unisims/AND5B4.v,v 1.6 2007/05/23 21:43:33 patrickp Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  5-input AND Gate
// /___/   /\     Filename : AND5B4.v
// \   \  /  \    Timestamp : Thu Mar 25 16:42:13 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
//    05/23/07 - Changed timescale to 1 ps / 1 ps.
//    05/23/07 - Added wire declaration for internal signals.

`timescale  1 ps / 1 ps


module AND5B4 (O, I0, I1, I2, I3, I4);

    output O;

    input  I0, I1, I2, I3, I4;

    wire i0_inv;
    wire i1_inv;
    wire i2_inv;
    wire i3_inv;

    not N3 (i3_inv, I3);
    not N2 (i2_inv, I2);
    not N1 (i1_inv, I1);
    not N0 (i0_inv, I0);
    and A1 (O, i0_inv, i1_inv, i2_inv, i3_inv, I4);


endmodule

