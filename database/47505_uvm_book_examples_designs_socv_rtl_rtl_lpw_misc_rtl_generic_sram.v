// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : generic_sram.v
//Title       : 
//Created     : 1999
//Description : Generic singleport SRAM (synchronous)
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
//------------------------------------------------------------------------------

`timescale 1ns/1ns

// Module is a generic single port synchronous SRAM
module generic_sram (

  clk,
  n_cs,
  n_we,
  n_oe,
  ad,
  din,
  dout
);

  parameter
    DW = 140,          // width of data busses
    DD = 1024,         // depth of RAM
    AW = 10;           // width of address bus

  input  clk;          // posedge clock
  input  n_cs;         // RAM select
  input  n_we;         // read=1/write=0
  input  n_oe;         // output enable
  input  [AW-1:0] ad;  // address
  input  [DW-1:0] din; // data in
  output [DW-1:0] dout;// data out

  
  // output signals
  reg    [DW-1:0] dout;

  // internal signal
  reg    [DW-1:0] ram_array[DD-1:0]; // RAM array
  reg    [DW-1:0] ram_data;                  // RAM output data
  wire   [AW-1:0] ram_addr = ad;             // buffer address


  // Ram access on rising edge of clock
  // RAM does nothing if not selected
  always @ ( posedge clk )

  begin : p_array

    if ( n_cs == 1'b0 )

    begin

      if ( n_we == 1'b1 )

      begin // read array

        ram_data <= ram_array [ ram_addr ];

      end

      else

      begin // write array and pass din => dout

        ram_array [ ram_addr ] <= din;
        ram_data <= din;

      end

    end
   else
//     ram_data = { DW { 1'bz } };
     ram_data <= ram_data;

  end // p_array

  // RAM output disabled if either not selected or not enabled
  always @ ( ram_data )

  begin : p_openable

//    if ( n_cs == 1'b0 && n_oe == 1'b0 )

      dout = ram_data;

//    else 

//      dout = { DW { 1'bz } };

  end

endmodule // retry_sram_128
