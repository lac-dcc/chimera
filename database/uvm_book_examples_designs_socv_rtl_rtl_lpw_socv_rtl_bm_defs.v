// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : bm_defs.v
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
// Following defines the transaction types on AHB bus.
`define SEQ       2'b11
`define NON_SEQ   2'b10
`define IDLE      2'b00
`define BUSY      2'b01

// Following defines the Response types given by AHB slave.
`define OKAY   2'b00 
`define ERROR  2'b01
`define RETRY  2'b10
`define SPLIT  2'b11

// Following defines the number of masters and slave configured for BusMatrix
// It should be between 1 and 16

// Numbers of slaves referes to AHB slave interfaces on busmatrix which 
// interacts with AHB masters 

// Numbers of masters referes to AHB master interfaces on busmatrix which 
// interacts with AHB slaves 
`define NUM_OF_SLAVES  6
`define NUM_OF_MASTERS 9

// Following defines Address bus width and Data bus width of AHB system
`define AHB_ADDR_WIDTH 32
`define AHB_DATA_WIDTH 32


// Following defines the presence  of slave interfaces in BusMatrix
// Define the presence of Slaves in compliance with "NUM_OF_SLAVES"
// define above
`define SLAVE0
`define SLAVE1
`define SLAVE2
`define SLAVE3
`define SLAVE4
`define SLAVE5
// `define SLAVE6
// `define SLAVE7
// `define SLAVE8
// `define SLAVE9
// `define SLAVE10
// `define SLAVE11
// `define SLAVE12
// `define SLAVE13
// `define SLAVE14
// `define SLAVE15

// Following defines the presence  of master interfaces in BusMatrix
// Define the presence of Masters in compliance with "NUM_OF_MASTERS"
// define above
`define MASTER0
`define MASTER1
`define MASTER2
`define MASTER3
`define MASTER4
`define MASTER5
`define MASTER6
`define MASTER7
`define MASTER8
// `define MASTER8
// `define MASTER9
// `define MASTER10
// `define MASTER11
// `define MASTER12
// `define MASTER13
// `define MASTER14
// `define MASTER15


