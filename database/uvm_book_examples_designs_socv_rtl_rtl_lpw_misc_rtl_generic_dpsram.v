// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : generic_dpsram.v
//Title       : 
//Created     : 1999
//Description : Generic dualport SRAM (synchronous)
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

// Module is a generic single port synchronous SRAM
module generic_dpsram (

  clk0,
  clk1,
  n_cs0,
  n_cs1,
  n_we0,
  n_we1,
  n_oe0,
  n_oe1,
  ad0,
  ad1,
  di0,
  di1,
  do0,
  do1
);

  parameter
    DW = 32,          // width of data busses
    DD = 1024,         // depth of RAM
    AW = 10;           // width of address bus

  input  clk0;          // posedge clock
  input  clk1;          // posedge clock
  input  n_cs0;         // RAM select
  input  n_cs1;         // RAM select
  input  n_we0;         // read=1/write=0
  input  n_we1;         // read=1/write=0
  input  n_oe0;         // output enable
  input  n_oe1;         // output enable
  input  [AW-1:0] ad0;  // address
  input  [AW-1:0] ad1;  // address
  input  [DW-1:0] di0;  // data in
  input  [DW-1:0] di1;  // data in
  output [DW-1:0] do0;  // data out
  output [DW-1:0] do1;  // data out

  
  // output signals
  reg    [DW-1:0] do0;
  reg    [DW-1:0] do1;

  // internal signal
  reg    [DW-1:0] ram_array[DD-1:0]; // RAM array
  reg    [DW-1:0] ram_data0;                  // RAM output data
  reg    [DW-1:0] ram_data1;                  // RAM output data
  wire   [AW-1:0] ram_addr0 = ad0;             // buffer address
  wire   [AW-1:0] ram_addr1 = ad1;             // buffer address


  // Ram access on rising edge of clock
  // RAM does nothing if not selected
  always @ ( posedge clk0 )
  begin
    if ( n_cs0 == 1'b0 )
    begin
      if ( n_we0 == 1'b1 )
      begin // read array
        ram_data0 <= ram_array [ ram_addr0 ];
      end
      else
      begin // write array and pass di => do
        ram_array [ ram_addr0 ] <= di0;
        ram_data0 <= di0;
      end
    end
   else
//     ram_data = { DW { 1'bz } };
     ram_data0 <= ram_data0;
  end

  always @ ( posedge clk1 )
  begin
    if ( n_cs1 == 1'b0 )
    begin
      if ( n_we1 == 1'b1 )
      begin // read array
        ram_data1 <= ram_array [ ram_addr1 ];
      end
      else
      begin // write array and pass di => do
        ram_array [ ram_addr1 ] <= di1;
        ram_data1 <= di1;
      end
    end
   else
//     ram_data = { DW { 1'bz } };
     ram_data1 <= ram_data1;
  end

  // RAM output disabled if either not selected or not enabled
  always @ ( ram_data0 )
  begin
//    if ( n_cs == 1'b0 && n_oe == 1'b0 )
      do0 = ram_data0;
//    else 
//      do = { DW { 1'bz } };
  end

  always @ ( ram_data1 )
  begin
//    if ( n_cs == 1'b0 && n_oe == 1'b0 )
      do1 = ram_data1;
//    else 
//      do = { DW { 1'bz } };
  end

endmodule
