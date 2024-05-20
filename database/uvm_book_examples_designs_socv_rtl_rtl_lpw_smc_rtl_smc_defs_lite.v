// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : smc_defs_lite.v
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

//----------------------------------------------------------------------------

`define DEFINE_SMC_ADDR 12


//----------------------------------------------------------------------------
// Constants
//----------------------------------------------------------------------------

// HTRANS transfer type signal encoding
  `define TRN_IDLE   2'b00
  `define TRN_BUSY   2'b01
  `define TRN_NONSEQ 2'b10
  `define TRN_SEQ    2'b11
 
// HSIZE transfer type signal encoding
  `define SZ_BYTE 3'b000
  `define SZ_HALF 3'b001
  `define SZ_WORD 3'b010
 
// HRESP transfer response signal encoding
  `define RSP_OKAY  2'b00
  `define RSP_ERROR 2'b01
  `define RSP_RETRY 2'b10
  `define RSP_SPLIT 2'b11 // Not used
 
// SMC state machine states
  `define SMC_IDLE  5'b00001
  `define SMC_LE    5'b00010
  `define SMC_RW    5'b00100
  `define SMC_STORE 5'b01000
  `define SMC_FLOAT 5'b10000

// Xfer Sizes
  `define XSIZ_8   2'h0
  `define XSIZ_16  2'h1
  `define XSIZ_32  2'h2

// Bus Sizes
  `define BSIZ_8   2'h0
  `define BSIZ_16  2'h1
  `define BSIZ_32  2'h2
