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
// ***************************************************************************
// ***************************************************************************
// dc filter- y(n) = c*x(n) + (1-c)*y(n-1)
// NOT IMPLEMENTED

`timescale 1ps/1ps

module ad_dcfilter #(

  // data path disable

  parameter   DISABLE = 0
) (

  // data interface

  input           clk,
  input           valid,
  input   [15:0]  data,
  output          valid_out,
  output  [15:0]  data_out,

  // control interface

  input           dcfilt_enb,
  input   [15:0]  dcfilt_coeff,
  input   [15:0]  dcfilt_offset
);

  // internal registers

  reg     [15:0]  dcfilt_coeff_d = 'd0;
  reg     [47:0]  dc_offset = 'd0;
  reg     [47:0]  dc_offset_d = 'd0;
  reg             valid_d = 'd0;
  reg     [15:0]  data_d = 'd0;
  reg             valid_2d = 'd0;
  reg     [15:0]  data_2d = 'd0;
  reg     [15:0]  data_dcfilt = 'd0;
  reg             valid_int = 'd0;
  reg     [15:0]  data_int = 'd0;

  // internal signals

  wire    [47:0]  dc_offset_s;
  wire    [47:0]  multiply_result_s;
  wire    [15:0]  subtract_result_s;

  // data-path disable

  generate
  if (DISABLE == 1) begin
  assign valid_out = valid;
  assign data_out = data;
  end else begin
  assign valid_out = valid_int;
  assign data_out = data_int;
  end
  endgenerate

  // dcfilt_coeff is flopped so to remove warnings from vivado

  always @(posedge clk) begin
    dcfilt_coeff_d <= dcfilt_coeff;
  end

  // removing dc offset

  always @(posedge clk) begin
    dc_offset   <= dc_offset_s;
    dc_offset_d <= dc_offset;
    valid_d <= valid;
    if (valid == 1'b1) begin
      data_d <= data + dcfilt_offset;
    end
    valid_2d <= valid_d;
    data_2d  <= data_d;
    data_dcfilt <= data_d - dc_offset[32:17];
    if (dcfilt_enb == 1'b1) begin
      valid_int <= valid_2d;
      data_int  <= data_dcfilt;
    end else begin
      valid_int <= valid_2d;
      data_int  <= data_2d;
    end
  end
  // replicate dsp slice instance (D-A)*B+C using lpm types for quartus, this should work across most FPGA designes for Intel based products.
  // D = data_d 16bit
  // A = dc_offset_s[32:17] 16bit
  // B = dcfilt_coeff_d 16bit
  // C = dc_offset_d 48bit
  // using the below IPs since they are universal in quartus, and there is no FPGA family in this section of the code.

  //subtract... hmmm
  parallel_add #(
    .msw_subtract("YES"),
    .pipeline(2),
    .representation("SIGNED"),
    .result_alignment("LSB"),
    .shift(0),
    .size(2),
    .width(16),
    .widthr(16))
   i_parallel_sub (
    .clken(1'b1),
    .aclr(1'b0),
    .clock(clk),
    .data({{dc_offset_s[32:17]}, data_d}),
    .result(subtract_result_s));

  lpm_mult #(
    .lpm_type ("lpm_mult"),
    .lpm_widtha (16),
    .lpm_widthb (16),
    .lpm_widthp (48),
    .lpm_representation ("SIGNED"),
    .lpm_pipeline (3))
   i_lpm_mult (
    .clken (1'b1),
    .aclr (1'b0),
    .sclr (1'b0),
    .sum (1'b0),
    .clock (clk),
    .dataa (subtract_result_s),
    .datab (dcfilt_coeff_d),
    .result (multiply_result_s));

  parallel_add #(
    .msw_subtract("NO"),
    .pipeline(1),
    .representation("SIGNED"),
    .result_alignment("LSB"),
    .shift(0),
    .size(2),
    .width(48),
    .widthr(48))
   i_parallel_add (
    .clken(1'b1),
    .aclr(1'b0),
    .clock(clk),
    .data({dc_offset_d, multiply_result_s}),
    .result(dc_offset_s));

endmodule
// ***************************************************************************
// ***************************************************************************
