// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : multiplexer.v
//Title       : 
//Created     : 1999
//Description : This is a configurable mux. Number of inputs to be muxed can be set 
//              1, 2, 4, 8, 16. width of each inputs can be configured to any number
//              This mux is used to Multiplex transaction attributes from slave 
//              interfaces, responses to slave interfaces, HRDATA and HWDATA
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


module config_mux (

   // input ports
   input0,
   input1,
   input2,
   input3,
   input4,
   input5,
   input6,
   input7,
   input8,
   input9,
   input10,
   input11,
   input12,
   input13,
   input14,
   input15,
   select,

   // output ports
   out

);

parameter MUX_SIZE = 16;
parameter MUX_INPUT_SIZE = 32;


input [MUX_INPUT_SIZE - 1 : 0]  input0;
input [MUX_INPUT_SIZE - 1 : 0]  input1;
input [MUX_INPUT_SIZE - 1 : 0]  input2;
input [MUX_INPUT_SIZE - 1 : 0]  input3;
input [MUX_INPUT_SIZE - 1 : 0]  input4;
input [MUX_INPUT_SIZE - 1 : 0]  input5;
input [MUX_INPUT_SIZE - 1 : 0]  input6;
input [MUX_INPUT_SIZE - 1 : 0]  input7;
input [MUX_INPUT_SIZE - 1 : 0]  input8;
input [MUX_INPUT_SIZE - 1 : 0]  input9;
input [MUX_INPUT_SIZE - 1 : 0]  input10;
input [MUX_INPUT_SIZE - 1 : 0]  input11;
input [MUX_INPUT_SIZE - 1 : 0]  input12;
input [MUX_INPUT_SIZE - 1 : 0]  input13;
input [MUX_INPUT_SIZE - 1 : 0]  input14;
input [MUX_INPUT_SIZE - 1 : 0]  input15;
input [MUX_SIZE - 1 : 0]  select;

output [MUX_INPUT_SIZE - 1 : 0] out;


reg [MUX_INPUT_SIZE - 1 : 0] out;



generate

 if (MUX_SIZE == 16) 
   // 16:1 mux
 
 always @*
   case (select)

    16'h0001 : out = input0;
    16'h0002 : out = input1;
    16'h0004 : out = input2;
    16'h0008 : out = input3;
    16'h0010 : out = input4;
    16'h0020 : out = input5;
    16'h0040 : out = input6;
    16'h0080 : out = input7;
    16'h0100 : out = input8;
    16'h0200 : out = input9;
    16'h0400 : out = input10;
    16'h0800 : out = input11;
    16'h1000 : out = input12;
    16'h2000 : out = input13;
    16'h4000 : out = input14;
    16'h8000 : out = input15;
    default  : out = {MUX_INPUT_SIZE{1'b0}};
  
   endcase

  else if (MUX_SIZE == 8)
   // 8:1 mux

 always @*
   case (select)

    8'h01 : out = input0;
    8'h02 : out = input1;
    8'h04 : out = input2;
    8'h08 : out = input3;
    8'h10 : out = input4;
    8'h20 : out = input5;
    8'h40 : out = input6;
    8'h80 : out = input7;
    default : out = {MUX_INPUT_SIZE{1'b0}};
  
   endcase



  else if (MUX_SIZE == 4)
   // 4:1 mux

 always @*
   case (select)

    4'h1 : out = input0;
    4'h2 : out = input1;
    4'h4 : out = input2;
    4'h8 : out = input3;
    default : out = {MUX_INPUT_SIZE{1'b0}};
  
   endcase

  else if (MUX_SIZE == 2)
   // 2:1 mux

 always @*
   case (select)

    2'h1 : out = input0;
    2'h2 : out = input1;
    default : out = {MUX_INPUT_SIZE{1'b0}};
  
   endcase

  else

 always @*
   out = input0;

endgenerate

endmodule



