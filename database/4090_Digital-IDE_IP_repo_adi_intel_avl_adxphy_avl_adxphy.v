// This program was cloned from: https://github.com/Nitcloud/Digital-IDE
// License: GNU General Public License v3.0

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
// AUTO GENERATED BY avl_adxphy.pl, DO NOT MODIFY!

`timescale 1ns/1ps

module avl_adxphy #(

  // parameters

  parameter   integer NUM_OF_LANES = 4) (

  // rx-ip interface

  output  [((NUM_OF_LANES* 1)-1):0]   rx_ip_locked,
  output  [((NUM_OF_LANES* 1)-1):0]   rx_ip_cal_busy,
  output  [((NUM_OF_LANES* 1)-1):0]   rx_ip_valid,
  output  [((NUM_OF_LANES*32)-1):0]   rx_ip_data,
  output  [((NUM_OF_LANES* 4)-1):0]   rx_ip_disperr,
  output  [((NUM_OF_LANES* 4)-1):0]   rx_ip_deterr,
  output  [((NUM_OF_LANES* 4)-1):0]   rx_ip_kchar,
  output  [((NUM_OF_LANES* 1)-1):0]   rx_ip_full,
  output  [((NUM_OF_LANES* 1)-1):0]   rx_ip_empty,
  input   [((NUM_OF_LANES* 1)-1):0]   rx_ip_align_en,
  input   [((NUM_OF_LANES* 1)-1):0]   rx_ip_lane_polarity,
  input   [((NUM_OF_LANES* 1)-1):0]   rx_ip_lane_powerdown,
  input                               rx_ip_bit_reversal,
  input                               rx_ip_byte_reversal,

  // rx-phy interface(s)

  input                               rx_phy_locked_0,
  input                               rx_phy_cal_busy_0,
  input                               rx_phy_valid_0,
  input   [31:0]                      rx_phy_data_0,
  input   [ 3:0]                      rx_phy_disperr_0,
  input   [ 3:0]                      rx_phy_deterr_0,
  input   [ 3:0]                      rx_phy_kchar_0,
  input                               rx_phy_full_0,
  input                               rx_phy_empty_0,
  output                              rx_phy_align_en_0,
  output                              rx_phy_lane_polarity_0,
  output                              rx_phy_lane_powerdown_0,
  output                              rx_phy_bit_reversal_0,
  output                              rx_phy_byte_reversal_0,
  output                              rx_phy_analogreset_0,
  output                              rx_phy_digitalreset_0,

  input                               rx_phy_locked_1,
  input                               rx_phy_cal_busy_1,
  input                               rx_phy_valid_1,
  input   [31:0]                      rx_phy_data_1,
  input   [ 3:0]                      rx_phy_disperr_1,
  input   [ 3:0]                      rx_phy_deterr_1,
  input   [ 3:0]                      rx_phy_kchar_1,
  input                               rx_phy_full_1,
  input                               rx_phy_empty_1,
  output                              rx_phy_align_en_1,
  output                              rx_phy_lane_polarity_1,
  output                              rx_phy_lane_powerdown_1,
  output                              rx_phy_bit_reversal_1,
  output                              rx_phy_byte_reversal_1,
  output                              rx_phy_analogreset_1,
  output                              rx_phy_digitalreset_1,

  input                               rx_phy_locked_2,
  input                               rx_phy_cal_busy_2,
  input                               rx_phy_valid_2,
  input   [31:0]                      rx_phy_data_2,
  input   [ 3:0]                      rx_phy_disperr_2,
  input   [ 3:0]                      rx_phy_deterr_2,
  input   [ 3:0]                      rx_phy_kchar_2,
  input                               rx_phy_full_2,
  input                               rx_phy_empty_2,
  output                              rx_phy_align_en_2,
  output                              rx_phy_lane_polarity_2,
  output                              rx_phy_lane_powerdown_2,
  output                              rx_phy_bit_reversal_2,
  output                              rx_phy_byte_reversal_2,
  output                              rx_phy_analogreset_2,
  output                              rx_phy_digitalreset_2,

  input                               rx_phy_locked_3,
  input                               rx_phy_cal_busy_3,
  input                               rx_phy_valid_3,
  input   [31:0]                      rx_phy_data_3,
  input   [ 3:0]                      rx_phy_disperr_3,
  input   [ 3:0]                      rx_phy_deterr_3,
  input   [ 3:0]                      rx_phy_kchar_3,
  input                               rx_phy_full_3,
  input                               rx_phy_empty_3,
  output                              rx_phy_align_en_3,
  output                              rx_phy_lane_polarity_3,
  output                              rx_phy_lane_powerdown_3,
  output                              rx_phy_bit_reversal_3,
  output                              rx_phy_byte_reversal_3,
  output                              rx_phy_analogreset_3,
  output                              rx_phy_digitalreset_3,

  input                               rx_phy_locked_4,
  input                               rx_phy_cal_busy_4,
  input                               rx_phy_valid_4,
  input   [31:0]                      rx_phy_data_4,
  input   [ 3:0]                      rx_phy_disperr_4,
  input   [ 3:0]                      rx_phy_deterr_4,
  input   [ 3:0]                      rx_phy_kchar_4,
  input                               rx_phy_full_4,
  input                               rx_phy_empty_4,
  output                              rx_phy_align_en_4,
  output                              rx_phy_lane_polarity_4,
  output                              rx_phy_lane_powerdown_4,
  output                              rx_phy_bit_reversal_4,
  output                              rx_phy_byte_reversal_4,
  output                              rx_phy_analogreset_4,
  output                              rx_phy_digitalreset_4,

  input                               rx_phy_locked_5,
  input                               rx_phy_cal_busy_5,
  input                               rx_phy_valid_5,
  input   [31:0]                      rx_phy_data_5,
  input   [ 3:0]                      rx_phy_disperr_5,
  input   [ 3:0]                      rx_phy_deterr_5,
  input   [ 3:0]                      rx_phy_kchar_5,
  input                               rx_phy_full_5,
  input                               rx_phy_empty_5,
  output                              rx_phy_align_en_5,
  output                              rx_phy_lane_polarity_5,
  output                              rx_phy_lane_powerdown_5,
  output                              rx_phy_bit_reversal_5,
  output                              rx_phy_byte_reversal_5,
  output                              rx_phy_analogreset_5,
  output                              rx_phy_digitalreset_5,

  input                               rx_phy_locked_6,
  input                               rx_phy_cal_busy_6,
  input                               rx_phy_valid_6,
  input   [31:0]                      rx_phy_data_6,
  input   [ 3:0]                      rx_phy_disperr_6,
  input   [ 3:0]                      rx_phy_deterr_6,
  input   [ 3:0]                      rx_phy_kchar_6,
  input                               rx_phy_full_6,
  input                               rx_phy_empty_6,
  output                              rx_phy_align_en_6,
  output                              rx_phy_lane_polarity_6,
  output                              rx_phy_lane_powerdown_6,
  output                              rx_phy_bit_reversal_6,
  output                              rx_phy_byte_reversal_6,
  output                              rx_phy_analogreset_6,
  output                              rx_phy_digitalreset_6,

  input                               rx_phy_locked_7,
  input                               rx_phy_cal_busy_7,
  input                               rx_phy_valid_7,
  input   [31:0]                      rx_phy_data_7,
  input   [ 3:0]                      rx_phy_disperr_7,
  input   [ 3:0]                      rx_phy_deterr_7,
  input   [ 3:0]                      rx_phy_kchar_7,
  input                               rx_phy_full_7,
  input                               rx_phy_empty_7,
  output                              rx_phy_align_en_7,
  output                              rx_phy_lane_polarity_7,
  output                              rx_phy_lane_powerdown_7,
  output                              rx_phy_bit_reversal_7,
  output                              rx_phy_byte_reversal_7,
  output                              rx_phy_analogreset_7,
  output                              rx_phy_digitalreset_7,

  // rx-core interface

  input   [((NUM_OF_LANES* 1)-1):0]   rx_core_analogreset,
  input   [((NUM_OF_LANES* 1)-1):0]   rx_core_digitalreset,
  output  [((NUM_OF_LANES* 1)-1):0]   rx_core_locked,
  output  [((NUM_OF_LANES* 1)-1):0]   rx_core_cal_busy,

  // tx-ip interface

  output  [((NUM_OF_LANES* 1)-1):0]   tx_ip_cal_busy,
  output  [((NUM_OF_LANES* 1)-1):0]   tx_ip_full,
  output  [((NUM_OF_LANES* 1)-1):0]   tx_ip_empty,
  input   [((NUM_OF_LANES*32)-1):0]   tx_ip_data,
  input   [((NUM_OF_LANES* 4)-1):0]   tx_ip_kchar,
  input   [((NUM_OF_LANES* 1)-1):0]   tx_ip_elecidle,
  input   [((NUM_OF_LANES* 1)-1):0]   tx_ip_lane_polarity,
  input   [((NUM_OF_LANES* 1)-1):0]   tx_ip_lane_powerdown,
  input                               tx_ip_bit_reversal,
  input                               tx_ip_byte_reversal,


  // tx-phy interface

  input                               tx_phy_cal_busy_0,
  input                               tx_phy_full_0,
  input                               tx_phy_empty_0,
  output  [31:0]                      tx_phy_data_0,
  output  [ 3:0]                      tx_phy_kchar_0,
  output                              tx_phy_elecidle_0,
  output                              tx_phy_lane_polarity_0,
  output                              tx_phy_lane_powerdown_0,
  output                              tx_phy_bit_reversal_0,
  output                              tx_phy_byte_reversal_0,
  output                              tx_phy_analogreset_0,
  output                              tx_phy_digitalreset_0,

  input                               tx_phy_cal_busy_1,
  input                               tx_phy_full_1,
  input                               tx_phy_empty_1,
  output  [31:0]                      tx_phy_data_1,
  output  [ 3:0]                      tx_phy_kchar_1,
  output                              tx_phy_elecidle_1,
  output                              tx_phy_lane_polarity_1,
  output                              tx_phy_lane_powerdown_1,
  output                              tx_phy_bit_reversal_1,
  output                              tx_phy_byte_reversal_1,
  output                              tx_phy_analogreset_1,
  output                              tx_phy_digitalreset_1,

  input                               tx_phy_cal_busy_2,
  input                               tx_phy_full_2,
  input                               tx_phy_empty_2,
  output  [31:0]                      tx_phy_data_2,
  output  [ 3:0]                      tx_phy_kchar_2,
  output                              tx_phy_elecidle_2,
  output                              tx_phy_lane_polarity_2,
  output                              tx_phy_lane_powerdown_2,
  output                              tx_phy_bit_reversal_2,
  output                              tx_phy_byte_reversal_2,
  output                              tx_phy_analogreset_2,
  output                              tx_phy_digitalreset_2,

  input                               tx_phy_cal_busy_3,
  input                               tx_phy_full_3,
  input                               tx_phy_empty_3,
  output  [31:0]                      tx_phy_data_3,
  output  [ 3:0]                      tx_phy_kchar_3,
  output                              tx_phy_elecidle_3,
  output                              tx_phy_lane_polarity_3,
  output                              tx_phy_lane_powerdown_3,
  output                              tx_phy_bit_reversal_3,
  output                              tx_phy_byte_reversal_3,
  output                              tx_phy_analogreset_3,
  output                              tx_phy_digitalreset_3,

  input                               tx_phy_cal_busy_4,
  input                               tx_phy_full_4,
  input                               tx_phy_empty_4,
  output  [31:0]                      tx_phy_data_4,
  output  [ 3:0]                      tx_phy_kchar_4,
  output                              tx_phy_elecidle_4,
  output                              tx_phy_lane_polarity_4,
  output                              tx_phy_lane_powerdown_4,
  output                              tx_phy_bit_reversal_4,
  output                              tx_phy_byte_reversal_4,
  output                              tx_phy_analogreset_4,
  output                              tx_phy_digitalreset_4,

  input                               tx_phy_cal_busy_5,
  input                               tx_phy_full_5,
  input                               tx_phy_empty_5,
  output  [31:0]                      tx_phy_data_5,
  output  [ 3:0]                      tx_phy_kchar_5,
  output                              tx_phy_elecidle_5,
  output                              tx_phy_lane_polarity_5,
  output                              tx_phy_lane_powerdown_5,
  output                              tx_phy_bit_reversal_5,
  output                              tx_phy_byte_reversal_5,
  output                              tx_phy_analogreset_5,
  output                              tx_phy_digitalreset_5,

  input                               tx_phy_cal_busy_6,
  input                               tx_phy_full_6,
  input                               tx_phy_empty_6,
  output  [31:0]                      tx_phy_data_6,
  output  [ 3:0]                      tx_phy_kchar_6,
  output                              tx_phy_elecidle_6,
  output                              tx_phy_lane_polarity_6,
  output                              tx_phy_lane_powerdown_6,
  output                              tx_phy_bit_reversal_6,
  output                              tx_phy_byte_reversal_6,
  output                              tx_phy_analogreset_6,
  output                              tx_phy_digitalreset_6,

  input                               tx_phy_cal_busy_7,
  input                               tx_phy_full_7,
  input                               tx_phy_empty_7,
  output  [31:0]                      tx_phy_data_7,
  output  [ 3:0]                      tx_phy_kchar_7,
  output                              tx_phy_elecidle_7,
  output                              tx_phy_lane_polarity_7,
  output                              tx_phy_lane_powerdown_7,
  output                              tx_phy_bit_reversal_7,
  output                              tx_phy_byte_reversal_7,
  output                              tx_phy_analogreset_7,
  output                              tx_phy_digitalreset_7,

  // tx-core interface

  input   [((NUM_OF_LANES* 1)-1):0]   tx_core_analogreset,
  input   [((NUM_OF_LANES* 1)-1):0]   tx_core_digitalreset,
  output  [((NUM_OF_LANES* 1)-1):0]   tx_core_cal_busy);

  // rx assignments

  generate
  if (NUM_OF_LANES > 0) begin
  assign rx_core_locked[0] = rx_phy_locked_0;
  assign rx_core_cal_busy[0] = rx_phy_cal_busy_0;
  assign rx_ip_locked[0] = rx_phy_locked_0;
  assign rx_ip_cal_busy[0] = rx_phy_cal_busy_0;
  assign rx_ip_valid[0] = rx_phy_valid_0;
  assign rx_ip_data[((32*1)-1):(32*0)] = rx_phy_data_0;
  assign rx_ip_disperr[((4*1)-1):(4*0)] = rx_phy_disperr_0;
  assign rx_ip_deterr[((4*1)-1):(4*0)] = rx_phy_deterr_0;
  assign rx_ip_kchar[((4*1)-1):(4*0)] = rx_phy_kchar_0;
  assign rx_ip_full[0] = rx_phy_full_0;
  assign rx_ip_empty[0] = rx_phy_empty_0;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 0) begin
  assign rx_phy_align_en_0 = rx_ip_align_en[0];
  assign rx_phy_lane_polarity_0 = rx_ip_lane_polarity[0];
  assign rx_phy_lane_powerdown_0 = rx_ip_lane_powerdown[0];
  assign rx_phy_analogreset_0 = rx_core_analogreset[0];
  assign rx_phy_digitalreset_0 = rx_core_digitalreset[0];
  end else begin
  assign rx_phy_align_en_0 = 1'd0;
  assign rx_phy_lane_polarity_0 = 1'd0;
  assign rx_phy_lane_powerdown_0 = 1'd0;
  assign rx_phy_analogreset_0 = 1'd1;
  assign rx_phy_digitalreset_0 = 1'd1;
  end
  endgenerate

  assign rx_phy_bit_reversal_0 = rx_ip_bit_reversal;
  assign rx_phy_byte_reversal_0 = rx_ip_byte_reversal;

  generate
  if (NUM_OF_LANES > 1) begin
  assign rx_core_locked[1] = rx_phy_locked_1;
  assign rx_core_cal_busy[1] = rx_phy_cal_busy_1;
  assign rx_ip_locked[1] = rx_phy_locked_1;
  assign rx_ip_cal_busy[1] = rx_phy_cal_busy_1;
  assign rx_ip_valid[1] = rx_phy_valid_1;
  assign rx_ip_data[((32*2)-1):(32*1)] = rx_phy_data_1;
  assign rx_ip_disperr[((4*2)-1):(4*1)] = rx_phy_disperr_1;
  assign rx_ip_deterr[((4*2)-1):(4*1)] = rx_phy_deterr_1;
  assign rx_ip_kchar[((4*2)-1):(4*1)] = rx_phy_kchar_1;
  assign rx_ip_full[1] = rx_phy_full_1;
  assign rx_ip_empty[1] = rx_phy_empty_1;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 1) begin
  assign rx_phy_align_en_1 = rx_ip_align_en[1];
  assign rx_phy_lane_polarity_1 = rx_ip_lane_polarity[1];
  assign rx_phy_lane_powerdown_1 = rx_ip_lane_powerdown[1];
  assign rx_phy_analogreset_1 = rx_core_analogreset[1];
  assign rx_phy_digitalreset_1 = rx_core_digitalreset[1];
  end else begin
  assign rx_phy_align_en_1 = 1'd0;
  assign rx_phy_lane_polarity_1 = 1'd0;
  assign rx_phy_lane_powerdown_1 = 1'd0;
  assign rx_phy_analogreset_1 = 1'd1;
  assign rx_phy_digitalreset_1 = 1'd1;
  end
  endgenerate

  assign rx_phy_bit_reversal_1 = rx_ip_bit_reversal;
  assign rx_phy_byte_reversal_1 = rx_ip_byte_reversal;

  generate
  if (NUM_OF_LANES > 2) begin
  assign rx_core_locked[2] = rx_phy_locked_2;
  assign rx_core_cal_busy[2] = rx_phy_cal_busy_2;
  assign rx_ip_locked[2] = rx_phy_locked_2;
  assign rx_ip_cal_busy[2] = rx_phy_cal_busy_2;
  assign rx_ip_valid[2] = rx_phy_valid_2;
  assign rx_ip_data[((32*3)-1):(32*2)] = rx_phy_data_2;
  assign rx_ip_disperr[((4*3)-1):(4*2)] = rx_phy_disperr_2;
  assign rx_ip_deterr[((4*3)-1):(4*2)] = rx_phy_deterr_2;
  assign rx_ip_kchar[((4*3)-1):(4*2)] = rx_phy_kchar_2;
  assign rx_ip_full[2] = rx_phy_full_2;
  assign rx_ip_empty[2] = rx_phy_empty_2;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 2) begin
  assign rx_phy_align_en_2 = rx_ip_align_en[2];
  assign rx_phy_lane_polarity_2 = rx_ip_lane_polarity[2];
  assign rx_phy_lane_powerdown_2 = rx_ip_lane_powerdown[2];
  assign rx_phy_analogreset_2 = rx_core_analogreset[2];
  assign rx_phy_digitalreset_2 = rx_core_digitalreset[2];
  end else begin
  assign rx_phy_align_en_2 = 1'd0;
  assign rx_phy_lane_polarity_2 = 1'd0;
  assign rx_phy_lane_powerdown_2 = 1'd0;
  assign rx_phy_analogreset_2 = 1'd1;
  assign rx_phy_digitalreset_2 = 1'd1;
  end
  endgenerate

  assign rx_phy_bit_reversal_2 = rx_ip_bit_reversal;
  assign rx_phy_byte_reversal_2 = rx_ip_byte_reversal;

  generate
  if (NUM_OF_LANES > 3) begin
  assign rx_core_locked[3] = rx_phy_locked_3;
  assign rx_core_cal_busy[3] = rx_phy_cal_busy_3;
  assign rx_ip_locked[3] = rx_phy_locked_3;
  assign rx_ip_cal_busy[3] = rx_phy_cal_busy_3;
  assign rx_ip_valid[3] = rx_phy_valid_3;
  assign rx_ip_data[((32*4)-1):(32*3)] = rx_phy_data_3;
  assign rx_ip_disperr[((4*4)-1):(4*3)] = rx_phy_disperr_3;
  assign rx_ip_deterr[((4*4)-1):(4*3)] = rx_phy_deterr_3;
  assign rx_ip_kchar[((4*4)-1):(4*3)] = rx_phy_kchar_3;
  assign rx_ip_full[3] = rx_phy_full_3;
  assign rx_ip_empty[3] = rx_phy_empty_3;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 3) begin
  assign rx_phy_align_en_3 = rx_ip_align_en[3];
  assign rx_phy_lane_polarity_3 = rx_ip_lane_polarity[3];
  assign rx_phy_lane_powerdown_3 = rx_ip_lane_powerdown[3];
  assign rx_phy_analogreset_3 = rx_core_analogreset[3];
  assign rx_phy_digitalreset_3 = rx_core_digitalreset[3];
  end else begin
  assign rx_phy_align_en_3 = 1'd0;
  assign rx_phy_lane_polarity_3 = 1'd0;
  assign rx_phy_lane_powerdown_3 = 1'd0;
  assign rx_phy_analogreset_3 = 1'd1;
  assign rx_phy_digitalreset_3 = 1'd1;
  end
  endgenerate

  assign rx_phy_bit_reversal_3 = rx_ip_bit_reversal;
  assign rx_phy_byte_reversal_3 = rx_ip_byte_reversal;

  generate
  if (NUM_OF_LANES > 4) begin
  assign rx_core_locked[4] = rx_phy_locked_4;
  assign rx_core_cal_busy[4] = rx_phy_cal_busy_4;
  assign rx_ip_locked[4] = rx_phy_locked_4;
  assign rx_ip_cal_busy[4] = rx_phy_cal_busy_4;
  assign rx_ip_valid[4] = rx_phy_valid_4;
  assign rx_ip_data[((32*5)-1):(32*4)] = rx_phy_data_4;
  assign rx_ip_disperr[((4*5)-1):(4*4)] = rx_phy_disperr_4;
  assign rx_ip_deterr[((4*5)-1):(4*4)] = rx_phy_deterr_4;
  assign rx_ip_kchar[((4*5)-1):(4*4)] = rx_phy_kchar_4;
  assign rx_ip_full[4] = rx_phy_full_4;
  assign rx_ip_empty[4] = rx_phy_empty_4;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 4) begin
  assign rx_phy_align_en_4 = rx_ip_align_en[4];
  assign rx_phy_lane_polarity_4 = rx_ip_lane_polarity[4];
  assign rx_phy_lane_powerdown_4 = rx_ip_lane_powerdown[4];
  assign rx_phy_analogreset_4 = rx_core_analogreset[4];
  assign rx_phy_digitalreset_4 = rx_core_digitalreset[4];
  end else begin
  assign rx_phy_align_en_4 = 1'd0;
  assign rx_phy_lane_polarity_4 = 1'd0;
  assign rx_phy_lane_powerdown_4 = 1'd0;
  assign rx_phy_analogreset_4 = 1'd1;
  assign rx_phy_digitalreset_4 = 1'd1;
  end
  endgenerate

  assign rx_phy_bit_reversal_4 = rx_ip_bit_reversal;
  assign rx_phy_byte_reversal_4 = rx_ip_byte_reversal;

  generate
  if (NUM_OF_LANES > 5) begin
  assign rx_core_locked[5] = rx_phy_locked_5;
  assign rx_core_cal_busy[5] = rx_phy_cal_busy_5;
  assign rx_ip_locked[5] = rx_phy_locked_5;
  assign rx_ip_cal_busy[5] = rx_phy_cal_busy_5;
  assign rx_ip_valid[5] = rx_phy_valid_5;
  assign rx_ip_data[((32*6)-1):(32*5)] = rx_phy_data_5;
  assign rx_ip_disperr[((4*6)-1):(4*5)] = rx_phy_disperr_5;
  assign rx_ip_deterr[((4*6)-1):(4*5)] = rx_phy_deterr_5;
  assign rx_ip_kchar[((4*6)-1):(4*5)] = rx_phy_kchar_5;
  assign rx_ip_full[5] = rx_phy_full_5;
  assign rx_ip_empty[5] = rx_phy_empty_5;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 5) begin
  assign rx_phy_align_en_5 = rx_ip_align_en[5];
  assign rx_phy_lane_polarity_5 = rx_ip_lane_polarity[5];
  assign rx_phy_lane_powerdown_5 = rx_ip_lane_powerdown[5];
  assign rx_phy_analogreset_5 = rx_core_analogreset[5];
  assign rx_phy_digitalreset_5 = rx_core_digitalreset[5];
  end else begin
  assign rx_phy_align_en_5 = 1'd0;
  assign rx_phy_lane_polarity_5 = 1'd0;
  assign rx_phy_lane_powerdown_5 = 1'd0;
  assign rx_phy_analogreset_5 = 1'd1;
  assign rx_phy_digitalreset_5 = 1'd1;
  end
  endgenerate

  assign rx_phy_bit_reversal_5 = rx_ip_bit_reversal;
  assign rx_phy_byte_reversal_5 = rx_ip_byte_reversal;

  generate
  if (NUM_OF_LANES > 6) begin
  assign rx_core_locked[6] = rx_phy_locked_6;
  assign rx_core_cal_busy[6] = rx_phy_cal_busy_6;
  assign rx_ip_locked[6] = rx_phy_locked_6;
  assign rx_ip_cal_busy[6] = rx_phy_cal_busy_6;
  assign rx_ip_valid[6] = rx_phy_valid_6;
  assign rx_ip_data[((32*7)-1):(32*6)] = rx_phy_data_6;
  assign rx_ip_disperr[((4*7)-1):(4*6)] = rx_phy_disperr_6;
  assign rx_ip_deterr[((4*7)-1):(4*6)] = rx_phy_deterr_6;
  assign rx_ip_kchar[((4*7)-1):(4*6)] = rx_phy_kchar_6;
  assign rx_ip_full[6] = rx_phy_full_6;
  assign rx_ip_empty[6] = rx_phy_empty_6;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 6) begin
  assign rx_phy_align_en_6 = rx_ip_align_en[6];
  assign rx_phy_lane_polarity_6 = rx_ip_lane_polarity[6];
  assign rx_phy_lane_powerdown_6 = rx_ip_lane_powerdown[6];
  assign rx_phy_analogreset_6 = rx_core_analogreset[6];
  assign rx_phy_digitalreset_6 = rx_core_digitalreset[6];
  end else begin
  assign rx_phy_align_en_6 = 1'd0;
  assign rx_phy_lane_polarity_6 = 1'd0;
  assign rx_phy_lane_powerdown_6 = 1'd0;
  assign rx_phy_analogreset_6 = 1'd1;
  assign rx_phy_digitalreset_6 = 1'd1;
  end
  endgenerate

  assign rx_phy_bit_reversal_6 = rx_ip_bit_reversal;
  assign rx_phy_byte_reversal_6 = rx_ip_byte_reversal;

  generate
  if (NUM_OF_LANES > 7) begin
  assign rx_core_locked[7] = rx_phy_locked_7;
  assign rx_core_cal_busy[7] = rx_phy_cal_busy_7;
  assign rx_ip_locked[7] = rx_phy_locked_7;
  assign rx_ip_cal_busy[7] = rx_phy_cal_busy_7;
  assign rx_ip_valid[7] = rx_phy_valid_7;
  assign rx_ip_data[((32*8)-1):(32*7)] = rx_phy_data_7;
  assign rx_ip_disperr[((4*8)-1):(4*7)] = rx_phy_disperr_7;
  assign rx_ip_deterr[((4*8)-1):(4*7)] = rx_phy_deterr_7;
  assign rx_ip_kchar[((4*8)-1):(4*7)] = rx_phy_kchar_7;
  assign rx_ip_full[7] = rx_phy_full_7;
  assign rx_ip_empty[7] = rx_phy_empty_7;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 7) begin
  assign rx_phy_align_en_7 = rx_ip_align_en[7];
  assign rx_phy_lane_polarity_7 = rx_ip_lane_polarity[7];
  assign rx_phy_lane_powerdown_7 = rx_ip_lane_powerdown[7];
  assign rx_phy_analogreset_7 = rx_core_analogreset[7];
  assign rx_phy_digitalreset_7 = rx_core_digitalreset[7];
  end else begin
  assign rx_phy_align_en_7 = 1'd0;
  assign rx_phy_lane_polarity_7 = 1'd0;
  assign rx_phy_lane_powerdown_7 = 1'd0;
  assign rx_phy_analogreset_7 = 1'd1;
  assign rx_phy_digitalreset_7 = 1'd1;
  end
  endgenerate

  assign rx_phy_bit_reversal_7 = rx_ip_bit_reversal;
  assign rx_phy_byte_reversal_7 = rx_ip_byte_reversal;

  // tx assignments

  generate
  if (NUM_OF_LANES > 0) begin
  assign tx_core_cal_busy[0] = tx_phy_cal_busy_0;
  assign tx_ip_cal_busy[0] = tx_phy_cal_busy_0;
  assign tx_ip_full[0] = tx_phy_full_0;
  assign tx_ip_empty[0] = tx_phy_empty_0;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 0) begin
  assign tx_phy_data_0 = tx_ip_data[((32*1)-1):(32*0)];
  assign tx_phy_kchar_0 = tx_ip_kchar[((4*1)-1):(4*0)];
  assign tx_phy_elecidle_0 = tx_ip_elecidle[0];
  assign tx_phy_lane_polarity_0 = tx_ip_lane_polarity[0];
  assign tx_phy_lane_powerdown_0 = tx_ip_lane_powerdown[0];
  end else begin
  assign tx_phy_data_0 = 32'd0;
  assign tx_phy_kchar_0 = 4'd0;
  assign tx_phy_elecidle_0 = 1'd0;
  assign tx_phy_lane_polarity_0 = 1'd0;
  assign tx_phy_lane_powerdown_0 = 1'd0;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 0) begin
  assign tx_phy_analogreset_0 = tx_core_analogreset[0];
  assign tx_phy_digitalreset_0 = tx_core_digitalreset[0];
  end else begin
  assign tx_phy_analogreset_0 = 1'd1;
  assign tx_phy_digitalreset_0 = 1'd1;
  end
  endgenerate

  assign tx_phy_bit_reversal_0 = tx_ip_bit_reversal;
  assign tx_phy_byte_reversal_0 = tx_ip_byte_reversal;

  generate
  if (NUM_OF_LANES > 1) begin
  assign tx_core_cal_busy[1] = tx_phy_cal_busy_1;
  assign tx_ip_cal_busy[1] = tx_phy_cal_busy_1;
  assign tx_ip_full[1] = tx_phy_full_1;
  assign tx_ip_empty[1] = tx_phy_empty_1;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 1) begin
  assign tx_phy_data_1 = tx_ip_data[((32*2)-1):(32*1)];
  assign tx_phy_kchar_1 = tx_ip_kchar[((4*2)-1):(4*1)];
  assign tx_phy_elecidle_1 = tx_ip_elecidle[1];
  assign tx_phy_lane_polarity_1 = tx_ip_lane_polarity[1];
  assign tx_phy_lane_powerdown_1 = tx_ip_lane_powerdown[1];
  end else begin
  assign tx_phy_data_1 = 32'd0;
  assign tx_phy_kchar_1 = 4'd0;
  assign tx_phy_elecidle_1 = 1'd0;
  assign tx_phy_lane_polarity_1 = 1'd0;
  assign tx_phy_lane_powerdown_1 = 1'd0;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 1) begin
  assign tx_phy_analogreset_1 = tx_core_analogreset[1];
  assign tx_phy_digitalreset_1 = tx_core_digitalreset[1];
  end else begin
  assign tx_phy_analogreset_1 = 1'd1;
  assign tx_phy_digitalreset_1 = 1'd1;
  end
  endgenerate

  assign tx_phy_bit_reversal_1 = tx_ip_bit_reversal;
  assign tx_phy_byte_reversal_1 = tx_ip_byte_reversal;

  generate
  if (NUM_OF_LANES > 2) begin
  assign tx_core_cal_busy[2] = tx_phy_cal_busy_2;
  assign tx_ip_cal_busy[2] = tx_phy_cal_busy_2;
  assign tx_ip_full[2] = tx_phy_full_2;
  assign tx_ip_empty[2] = tx_phy_empty_2;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 2) begin
  assign tx_phy_data_2 = tx_ip_data[((32*3)-1):(32*2)];
  assign tx_phy_kchar_2 = tx_ip_kchar[((4*3)-1):(4*2)];
  assign tx_phy_elecidle_2 = tx_ip_elecidle[2];
  assign tx_phy_lane_polarity_2 = tx_ip_lane_polarity[2];
  assign tx_phy_lane_powerdown_2 = tx_ip_lane_powerdown[2];
  end else begin
  assign tx_phy_data_2 = 32'd0;
  assign tx_phy_kchar_2 = 4'd0;
  assign tx_phy_elecidle_2 = 1'd0;
  assign tx_phy_lane_polarity_2 = 1'd0;
  assign tx_phy_lane_powerdown_2 = 1'd0;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 2) begin
  assign tx_phy_analogreset_2 = tx_core_analogreset[2];
  assign tx_phy_digitalreset_2 = tx_core_digitalreset[2];
  end else begin
  assign tx_phy_analogreset_2 = 1'd1;
  assign tx_phy_digitalreset_2 = 1'd1;
  end
  endgenerate

  assign tx_phy_bit_reversal_2 = tx_ip_bit_reversal;
  assign tx_phy_byte_reversal_2 = tx_ip_byte_reversal;

  generate
  if (NUM_OF_LANES > 3) begin
  assign tx_core_cal_busy[3] = tx_phy_cal_busy_3;
  assign tx_ip_cal_busy[3] = tx_phy_cal_busy_3;
  assign tx_ip_full[3] = tx_phy_full_3;
  assign tx_ip_empty[3] = tx_phy_empty_3;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 3) begin
  assign tx_phy_data_3 = tx_ip_data[((32*4)-1):(32*3)];
  assign tx_phy_kchar_3 = tx_ip_kchar[((4*4)-1):(4*3)];
  assign tx_phy_elecidle_3 = tx_ip_elecidle[3];
  assign tx_phy_lane_polarity_3 = tx_ip_lane_polarity[3];
  assign tx_phy_lane_powerdown_3 = tx_ip_lane_powerdown[3];
  end else begin
  assign tx_phy_data_3 = 32'd0;
  assign tx_phy_kchar_3 = 4'd0;
  assign tx_phy_elecidle_3 = 1'd0;
  assign tx_phy_lane_polarity_3 = 1'd0;
  assign tx_phy_lane_powerdown_3 = 1'd0;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 3) begin
  assign tx_phy_analogreset_3 = tx_core_analogreset[3];
  assign tx_phy_digitalreset_3 = tx_core_digitalreset[3];
  end else begin
  assign tx_phy_analogreset_3 = 1'd1;
  assign tx_phy_digitalreset_3 = 1'd1;
  end
  endgenerate

  assign tx_phy_bit_reversal_3 = tx_ip_bit_reversal;
  assign tx_phy_byte_reversal_3 = tx_ip_byte_reversal;

  generate
  if (NUM_OF_LANES > 4) begin
  assign tx_core_cal_busy[4] = tx_phy_cal_busy_4;
  assign tx_ip_cal_busy[4] = tx_phy_cal_busy_4;
  assign tx_ip_full[4] = tx_phy_full_4;
  assign tx_ip_empty[4] = tx_phy_empty_4;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 4) begin
  assign tx_phy_data_4 = tx_ip_data[((32*5)-1):(32*4)];
  assign tx_phy_kchar_4 = tx_ip_kchar[((4*5)-1):(4*4)];
  assign tx_phy_elecidle_4 = tx_ip_elecidle[4];
  assign tx_phy_lane_polarity_4 = tx_ip_lane_polarity[4];
  assign tx_phy_lane_powerdown_4 = tx_ip_lane_powerdown[4];
  end else begin
  assign tx_phy_data_4 = 32'd0;
  assign tx_phy_kchar_4 = 4'd0;
  assign tx_phy_elecidle_4 = 1'd0;
  assign tx_phy_lane_polarity_4 = 1'd0;
  assign tx_phy_lane_powerdown_4 = 1'd0;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 4) begin
  assign tx_phy_analogreset_4 = tx_core_analogreset[4];
  assign tx_phy_digitalreset_4 = tx_core_digitalreset[4];
  end else begin
  assign tx_phy_analogreset_4 = 1'd1;
  assign tx_phy_digitalreset_4 = 1'd1;
  end
  endgenerate

  assign tx_phy_bit_reversal_4 = tx_ip_bit_reversal;
  assign tx_phy_byte_reversal_4 = tx_ip_byte_reversal;

  generate
  if (NUM_OF_LANES > 5) begin
  assign tx_core_cal_busy[5] = tx_phy_cal_busy_5;
  assign tx_ip_cal_busy[5] = tx_phy_cal_busy_5;
  assign tx_ip_full[5] = tx_phy_full_5;
  assign tx_ip_empty[5] = tx_phy_empty_5;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 5) begin
  assign tx_phy_data_5 = tx_ip_data[((32*6)-1):(32*5)];
  assign tx_phy_kchar_5 = tx_ip_kchar[((4*6)-1):(4*5)];
  assign tx_phy_elecidle_5 = tx_ip_elecidle[5];
  assign tx_phy_lane_polarity_5 = tx_ip_lane_polarity[5];
  assign tx_phy_lane_powerdown_5 = tx_ip_lane_powerdown[5];
  end else begin
  assign tx_phy_data_5 = 32'd0;
  assign tx_phy_kchar_5 = 4'd0;
  assign tx_phy_elecidle_5 = 1'd0;
  assign tx_phy_lane_polarity_5 = 1'd0;
  assign tx_phy_lane_powerdown_5 = 1'd0;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 5) begin
  assign tx_phy_analogreset_5 = tx_core_analogreset[5];
  assign tx_phy_digitalreset_5 = tx_core_digitalreset[5];
  end else begin
  assign tx_phy_analogreset_5 = 1'd1;
  assign tx_phy_digitalreset_5 = 1'd1;
  end
  endgenerate

  assign tx_phy_bit_reversal_5 = tx_ip_bit_reversal;
  assign tx_phy_byte_reversal_5 = tx_ip_byte_reversal;

  generate
  if (NUM_OF_LANES > 6) begin
  assign tx_core_cal_busy[6] = tx_phy_cal_busy_6;
  assign tx_ip_cal_busy[6] = tx_phy_cal_busy_6;
  assign tx_ip_full[6] = tx_phy_full_6;
  assign tx_ip_empty[6] = tx_phy_empty_6;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 6) begin
  assign tx_phy_data_6 = tx_ip_data[((32*7)-1):(32*6)];
  assign tx_phy_kchar_6 = tx_ip_kchar[((4*7)-1):(4*6)];
  assign tx_phy_elecidle_6 = tx_ip_elecidle[6];
  assign tx_phy_lane_polarity_6 = tx_ip_lane_polarity[6];
  assign tx_phy_lane_powerdown_6 = tx_ip_lane_powerdown[6];
  end else begin
  assign tx_phy_data_6 = 32'd0;
  assign tx_phy_kchar_6 = 4'd0;
  assign tx_phy_elecidle_6 = 1'd0;
  assign tx_phy_lane_polarity_6 = 1'd0;
  assign tx_phy_lane_powerdown_6 = 1'd0;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 6) begin
  assign tx_phy_analogreset_6 = tx_core_analogreset[6];
  assign tx_phy_digitalreset_6 = tx_core_digitalreset[6];
  end else begin
  assign tx_phy_analogreset_6 = 1'd1;
  assign tx_phy_digitalreset_6 = 1'd1;
  end
  endgenerate

  assign tx_phy_bit_reversal_6 = tx_ip_bit_reversal;
  assign tx_phy_byte_reversal_6 = tx_ip_byte_reversal;

  generate
  if (NUM_OF_LANES > 7) begin
  assign tx_core_cal_busy[7] = tx_phy_cal_busy_7;
  assign tx_ip_cal_busy[7] = tx_phy_cal_busy_7;
  assign tx_ip_full[7] = tx_phy_full_7;
  assign tx_ip_empty[7] = tx_phy_empty_7;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 7) begin
  assign tx_phy_data_7 = tx_ip_data[((32*8)-1):(32*7)];
  assign tx_phy_kchar_7 = tx_ip_kchar[((4*8)-1):(4*7)];
  assign tx_phy_elecidle_7 = tx_ip_elecidle[7];
  assign tx_phy_lane_polarity_7 = tx_ip_lane_polarity[7];
  assign tx_phy_lane_powerdown_7 = tx_ip_lane_powerdown[7];
  end else begin
  assign tx_phy_data_7 = 32'd0;
  assign tx_phy_kchar_7 = 4'd0;
  assign tx_phy_elecidle_7 = 1'd0;
  assign tx_phy_lane_polarity_7 = 1'd0;
  assign tx_phy_lane_powerdown_7 = 1'd0;
  end
  endgenerate

  generate
  if (NUM_OF_LANES > 7) begin
  assign tx_phy_analogreset_7 = tx_core_analogreset[7];
  assign tx_phy_digitalreset_7 = tx_core_digitalreset[7];
  end else begin
  assign tx_phy_analogreset_7 = 1'd1;
  assign tx_phy_digitalreset_7 = 1'd1;
  end
  endgenerate

  assign tx_phy_bit_reversal_7 = tx_ip_bit_reversal;
  assign tx_phy_byte_reversal_7 = tx_ip_byte_reversal;

endmodule

// ***************************************************************************
// ***************************************************************************

