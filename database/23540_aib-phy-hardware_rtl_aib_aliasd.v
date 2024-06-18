// This program was cloned from: https://github.com/intel/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. All rights reserved
// ==========================================================================
//
//  CELL: aib_aliasd
//
//  Description: Directional alias device
//
//------------------------------------------
 module aib_aliasd( sig_in, sig_red );

    output   sig_red;
    input    sig_in;

    assign sig_red = sig_in;

 endmodule
