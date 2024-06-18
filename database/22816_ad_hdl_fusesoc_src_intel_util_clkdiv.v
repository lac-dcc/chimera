// This program was cloned from: https://github.com/johnathan-convertino-afrl/ad_hdl_fusesoc
// License: MIT License

// ***************************************************************************
// ***************************************************************************
// Copyright 2014 - 2017 (c) Analog Devices, Inc. All rights reserved.
//
// In this HDL repository, there are many different and unique modules, consisting
// of various HDL (Verilog or VHDL) components. The individual modules are
// developed independently, and may be accompanied by separate and unique license
// terms.
//
// The user should read each of these license terms, and understand the
// freedoms and responsibilities that he or she has by using this source/core.
//
// This core is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
// A PARTICULAR PURPOSE.
//
// Redistribution and use of source or resulting binaries, with or without modification
// of this file, are permitted under one of the following two license terms:
//
//   1. The GNU General Public License version 2 as published by the
//      Free Software Foundation, which can be found in the top level directory
//      of this repository (LICENSE_GPL2), and also online at:
//      <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>
//
// OR
//
//   2. An ADI specific BSD license, which can be found in the top level directory
//      of this repository (LICENSE_ADIBSD), and also on-line at:
//      https://github.com/analogdevicesinc/hdl/blob/master/LICENSE_ADIBSD
//      This will allow to generate bit files and not release the source code,
//      as long as it attaches to an ADI device.
//
//  Arria10 added by Jay Convertino
//
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

// Divides the input clock to SEL_0_DIV if clk_sel is 0 or SEL_1_DIV if
// clk_sel is 1.

module util_clkdiv #(
  parameter SIM_DEVICE = "ARRIA10",
  parameter CLOCK_TYPE = "Global Clock"
) (
  input   clk,
  input   clk_sel,
  output  clk_out
);

  wire [1:0] concat_clocks;
  wire sel_clk;

  reg d = 1;
  reg dd = 1;

  assign concat_clocks = {dd, d};

  generate if (SIM_DEVICE == "CYCLONE5") begin
    cyclonev_clkena #(
      .clock_type (CLOCK_TYPE),
      .ena_register_mode ("falling edge"),
      .lpm_type ("cyclonev_clkena")
    ) clock_divider_by_2 (
      .ena(clk_sel),
      .enaout(),
      .inclk(clk),
      // .clkselect (2'b0),
      .outclk(clk_out));

  end else if (SIM_DEVICE == "ARRIA10") begin

    //constant enable D flip flop takes input clock and divideds by two.
    always @(posedge clk) begin
      d <= ~d;
    end

    //same clock, but enable comes from divided flip flop above. Dividing the clock again resulting in a divide by 4 in comparison to the original.
    always @(posedge clk) begin
      if(d) begin
        dd <= ~dd;
      end
    end

    //select clock needed
    twentynm_clkselect clk_sel (
      .clkselect(clk_sel),
      .inclk(concat_clocks),
      .outclk(sel_clk)
    );

    //set new selected clock to a buffer
    twentynm_clkena #(
      .clock_type(CLOCK_TYPE),
      .en_register_mode("always enabled"),
      .lpm_type("twentynm_clkena")
    ) clk_buf (
      .ena(1'b1),
      .enaout(),
      .inclk(sel_clk),
      .outclk(clk)
    );

  end endgenerate

endmodule
