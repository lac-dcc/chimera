// This program was cloned from: https://github.com/chipsalliance/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. 
//Verilog HDL for "aibcr_lib", "aibcr_inv_split_align" "verilog"


module aibcr3_nd2d0_custom (zn, a1, a2, vcc_regphy, vss_io );

  output zn;
  input a2;
  input a1;
  input vss_io;
  input vcc_regphy;

  assign zn = ~(a1 && a2) ;

endmodule

