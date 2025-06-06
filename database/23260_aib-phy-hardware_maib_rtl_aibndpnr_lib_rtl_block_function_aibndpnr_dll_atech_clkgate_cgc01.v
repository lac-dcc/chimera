// This program was cloned from: https://github.com/intel/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. All rights reserved
module aibndpnr_dll_atech_clkgate_cgc01
(
    input    wire   clk,
    input    wire   en,
    input    wire   te,
    output   wire   clkout
);

wire    d;
reg     o;

assign  d = en | te;

always @ (d, clk)
    begin
       if (~clk)
          begin
             o <=d;
          end
    end 

assign clkout = clk & o;



endmodule
