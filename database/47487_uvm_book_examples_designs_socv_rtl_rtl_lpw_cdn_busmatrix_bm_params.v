// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : bm_params.v
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
// Define the address range of each of the target slaves here.

parameter       SLAVE0_START_ADDR  = 32'h0000_0000;
parameter       SLAVE0_END_ADDR    = 32'h007F_FFFF;

parameter       SLAVE1_START_ADDR  = 32'h2000_0000;
parameter       SLAVE1_END_ADDR    = 32'h2010_FFFF;

parameter       SLAVE2_START_ADDR  = 32'hFFFF_0000;
parameter       SLAVE2_END_ADDR    = 32'hFFFF_07FF;

parameter       SLAVE3_START_ADDR  = 32'h0080_0000;
parameter       SLAVE3_END_ADDR    = 32'h008F_FFFF;

parameter       SLAVE4_START_ADDR  = 32'h00C0_0000;
parameter       SLAVE4_END_ADDR    = 32'h00C0_FFFF;

parameter       SLAVE5_START_ADDR  = 32'h00C1_0000;
parameter       SLAVE5_END_ADDR    = 32'h00C1_FFFF;

parameter       SLAVE6_START_ADDR  = 32'h00A0_0000;
parameter       SLAVE6_END_ADDR    = 32'h00AF_FFFF;

parameter       SLAVE7_START_ADDR  = 32'h0060_0000;
parameter       SLAVE7_END_ADDR    = 32'h006F_03FF;

parameter       SLAVE8_START_ADDR  = 32'h0000_0000;
parameter       SLAVE8_END_ADDR    = 32'h0000_0000;
parameter       SLAVE9_START_ADDR  = 32'h0000_0000;
parameter       SLAVE9_END_ADDR    = 32'h0000_0000;
parameter       SLAVE10_START_ADDR = 32'h0000_0000;
parameter       SLAVE10_END_ADDR   = 32'h0000_0000;
parameter       SLAVE11_START_ADDR = 32'h0000_0000;
parameter       SLAVE11_END_ADDR   = 32'h0000_0000;
parameter       SLAVE12_START_ADDR = 32'h0000_0000;
parameter       SLAVE12_END_ADDR   = 32'h0000_0000;
parameter       SLAVE13_START_ADDR = 32'h0000_0000;
parameter       SLAVE13_END_ADDR   = 32'h0000_0000;
parameter       SLAVE14_START_ADDR = 32'h0000_0000;
parameter       SLAVE14_END_ADDR   = 32'h0000_0000;
parameter       SLAVE15_START_ADDR = 32'h0000_0000;
parameter       SLAVE15_END_ADDR   = 32'h0000_0000;

