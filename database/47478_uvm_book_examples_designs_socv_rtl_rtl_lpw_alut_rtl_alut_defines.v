// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : alut_defines.v
//Title       : 
//Created     : 1999
//Description : 
//Notes       : 
//----------------------------------------------------------------------
//   Copyright 1999-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

// Define the register address constants 
`define AL_FRM_D_ADDR_L         7'h00   //
`define AL_FRM_D_ADDR_U         7'h04   //
`define AL_FRM_S_ADDR_L         7'h08   //
`define AL_FRM_S_ADDR_U         7'h0C   //
`define AL_S_PORT               7'h10   //
`define AL_D_PORT               7'h14   // read only
`define AL_MAC_ADDR_L           7'h18   //
`define AL_MAC_ADDR_U           7'h1C   //
`define AL_CUR_TIME             7'h20   // read only
`define AL_BB_AGE               7'h24   //
`define AL_DIV_CLK              7'h28   //
`define AL_STATUS               7'h2C   // read only
`define AL_COMMAND              7'h30   //
`define AL_LST_INV_ADDR_L       7'h34   // read only
`define AL_LST_INV_ADDR_U       7'h38   // read only
`define AL_LST_INV_PORT         7'h3C   // read only
