// $Id: c_decode.v 5188 2012-08-30 00:31:31Z dub $

/*
 Copyright (c) 2007-2012, Trustees of The Leland Stanford Junior University
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 Redistributions of source code must retain the above copyright notice, this 
 list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this
 list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//==============================================================================
// encoder from one-hot to binary
//==============================================================================

// NOTE: This file was automatically generated. Do not edit by hand!

module c_decode
  (data_in, data_out);
   
`include "c_functions.v"
   
   // number of output ports (i.e., width of decoded word)
   parameter num_ports = 8;
   
   // start at offset
   parameter offset = 0;
   
   // use 'thermometer' encoding
   parameter therm_enc = 0;
   
   localparam width = clogb(num_ports);
   localparam [0:0] fillchar = therm_enc ? 1'b1 : 1'b0;
   
   // encoded input data
   input [0:width-1] data_in;
   
   // decoded output data
   output [0:num_ports-1] data_out;
   reg [0:num_ports-1] 	  data_out;
   
   generate
      
      // synopsys translate_off
      if(num_ports < 2)
	begin
	   initial
	     begin
		$display({"ERROR: Decoder module %m needs at least 2 outputs."});
		$stop;
	     end
	end
      else if(num_ports > 64)
	begin
	   initial
	     begin
		$display({"ERROR: Decoder module %m supports at most 64 outputs."});
		$stop;
	     end
	end
      // synopsys translate_on
      
      if(num_ports == 2)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 2):
                 data_out = {1'b1, {1{fillchar}}};
               ((1 + offset) % 2):
                 data_out = {{1{1'b0}}, 1'b1};
               default:
                 data_out = {2{1'bx}};
             endcase
          end
      else if(num_ports == 3)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 3):
                 data_out = {1'b1, {2{fillchar}}};
               ((1 + offset) % 3):
                 data_out = {{1{1'b0}}, 1'b1, {1{fillchar}}};
               ((2 + offset) % 3):
                 data_out = {{2{1'b0}}, 1'b1};
               default:
                 data_out = {3{1'bx}};
             endcase
          end
      else if(num_ports == 4)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 4):
                 data_out = {1'b1, {3{fillchar}}};
               ((1 + offset) % 4):
                 data_out = {{1{1'b0}}, 1'b1, {2{fillchar}}};
               ((2 + offset) % 4):
                 data_out = {{2{1'b0}}, 1'b1, {1{fillchar}}};
               ((3 + offset) % 4):
                 data_out = {{3{1'b0}}, 1'b1};
               default:
                 data_out = {4{1'bx}};
             endcase
          end
      else if(num_ports == 5)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 5):
                 data_out = {1'b1, {4{fillchar}}};
               ((1 + offset) % 5):
                 data_out = {{1{1'b0}}, 1'b1, {3{fillchar}}};
               ((2 + offset) % 5):
                 data_out = {{2{1'b0}}, 1'b1, {2{fillchar}}};
               ((3 + offset) % 5):
                 data_out = {{3{1'b0}}, 1'b1, {1{fillchar}}};
               ((4 + offset) % 5):
                 data_out = {{4{1'b0}}, 1'b1};
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 6)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 6):
                 data_out = {1'b1, {5{fillchar}}};
               ((1 + offset) % 6):
                 data_out = {{1{1'b0}}, 1'b1, {4{fillchar}}};
               ((2 + offset) % 6):
                 data_out = {{2{1'b0}}, 1'b1, {3{fillchar}}};
               ((3 + offset) % 6):
                 data_out = {{3{1'b0}}, 1'b1, {2{fillchar}}};
               ((4 + offset) % 6):
                 data_out = {{4{1'b0}}, 1'b1, {1{fillchar}}};
               ((5 + offset) % 6):
                 data_out = {{5{1'b0}}, 1'b1};
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 7)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 7):
                 data_out = {1'b1, {6{fillchar}}};
               ((1 + offset) % 7):
                 data_out = {{1{1'b0}}, 1'b1, {5{fillchar}}};
               ((2 + offset) % 7):
                 data_out = {{2{1'b0}}, 1'b1, {4{fillchar}}};
               ((3 + offset) % 7):
                 data_out = {{3{1'b0}}, 1'b1, {3{fillchar}}};
               ((4 + offset) % 7):
                 data_out = {{4{1'b0}}, 1'b1, {2{fillchar}}};
               ((5 + offset) % 7):
                 data_out = {{5{1'b0}}, 1'b1, {1{fillchar}}};
               ((6 + offset) % 7):
                 data_out = {{6{1'b0}}, 1'b1};
               default:
                 data_out = {7{1'bx}};
             endcase
          end
      else if(num_ports == 8)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 8):
                 data_out = {1'b1, {7{fillchar}}};
               ((1 + offset) % 8):
                 data_out = {{1{1'b0}}, 1'b1, {6{fillchar}}};
               ((2 + offset) % 8):
                 data_out = {{2{1'b0}}, 1'b1, {5{fillchar}}};
               ((3 + offset) % 8):
                 data_out = {{3{1'b0}}, 1'b1, {4{fillchar}}};
               ((4 + offset) % 8):
                 data_out = {{4{1'b0}}, 1'b1, {3{fillchar}}};
               ((5 + offset) % 8):
                 data_out = {{5{1'b0}}, 1'b1, {2{fillchar}}};
               ((6 + offset) % 8):
                 data_out = {{6{1'b0}}, 1'b1, {1{fillchar}}};
               ((7 + offset) % 8):
                 data_out = {{7{1'b0}}, 1'b1};
               default:
                 data_out = {8{1'bx}};
             endcase
          end
      else if(num_ports == 9)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 9):
                 data_out = {1'b1, {8{fillchar}}};
               ((1 + offset) % 9):
                 data_out = {{1{1'b0}}, 1'b1, {7{fillchar}}};
               ((2 + offset) % 9):
                 data_out = {{2{1'b0}}, 1'b1, {6{fillchar}}};
               ((3 + offset) % 9):
                 data_out = {{3{1'b0}}, 1'b1, {5{fillchar}}};
               ((4 + offset) % 9):
                 data_out = {{4{1'b0}}, 1'b1, {4{fillchar}}};
               ((5 + offset) % 9):
                 data_out = {{5{1'b0}}, 1'b1, {3{fillchar}}};
               ((6 + offset) % 9):
                 data_out = {{6{1'b0}}, 1'b1, {2{fillchar}}};
               ((7 + offset) % 9):
                 data_out = {{7{1'b0}}, 1'b1, {1{fillchar}}};
               ((8 + offset) % 9):
                 data_out = {{8{1'b0}}, 1'b1};
               default:
                 data_out = {9{1'bx}};
             endcase
          end
      else if(num_ports == 10)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 10):
                 data_out = {1'b1, {9{fillchar}}};
               ((1 + offset) % 10):
                 data_out = {{1{1'b0}}, 1'b1, {8{fillchar}}};
               ((2 + offset) % 10):
                 data_out = {{2{1'b0}}, 1'b1, {7{fillchar}}};
               ((3 + offset) % 10):
                 data_out = {{3{1'b0}}, 1'b1, {6{fillchar}}};
               ((4 + offset) % 10):
                 data_out = {{4{1'b0}}, 1'b1, {5{fillchar}}};
               ((5 + offset) % 10):
                 data_out = {{5{1'b0}}, 1'b1, {4{fillchar}}};
               ((6 + offset) % 10):
                 data_out = {{6{1'b0}}, 1'b1, {3{fillchar}}};
               ((7 + offset) % 10):
                 data_out = {{7{1'b0}}, 1'b1, {2{fillchar}}};
               ((8 + offset) % 10):
                 data_out = {{8{1'b0}}, 1'b1, {1{fillchar}}};
               ((9 + offset) % 10):
                 data_out = {{9{1'b0}}, 1'b1};
               default:
                 data_out = {10{1'bx}};
             endcase
          end
      else if(num_ports == 11)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 11):
                 data_out = {1'b1, {10{fillchar}}};
               ((1 + offset) % 11):
                 data_out = {{1{1'b0}}, 1'b1, {9{fillchar}}};
               ((2 + offset) % 11):
                 data_out = {{2{1'b0}}, 1'b1, {8{fillchar}}};
               ((3 + offset) % 11):
                 data_out = {{3{1'b0}}, 1'b1, {7{fillchar}}};
               ((4 + offset) % 11):
                 data_out = {{4{1'b0}}, 1'b1, {6{fillchar}}};
               ((5 + offset) % 11):
                 data_out = {{5{1'b0}}, 1'b1, {5{fillchar}}};
               ((6 + offset) % 11):
                 data_out = {{6{1'b0}}, 1'b1, {4{fillchar}}};
               ((7 + offset) % 11):
                 data_out = {{7{1'b0}}, 1'b1, {3{fillchar}}};
               ((8 + offset) % 11):
                 data_out = {{8{1'b0}}, 1'b1, {2{fillchar}}};
               ((9 + offset) % 11):
                 data_out = {{9{1'b0}}, 1'b1, {1{fillchar}}};
               ((10 + offset) % 11):
                 data_out = {{10{1'b0}}, 1'b1};
               default:
                 data_out = {11{1'bx}};
             endcase
          end
      else if(num_ports == 12)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 12):
                 data_out = {1'b1, {11{fillchar}}};
               ((1 + offset) % 12):
                 data_out = {{1{1'b0}}, 1'b1, {10{fillchar}}};
               ((2 + offset) % 12):
                 data_out = {{2{1'b0}}, 1'b1, {9{fillchar}}};
               ((3 + offset) % 12):
                 data_out = {{3{1'b0}}, 1'b1, {8{fillchar}}};
               ((4 + offset) % 12):
                 data_out = {{4{1'b0}}, 1'b1, {7{fillchar}}};
               ((5 + offset) % 12):
                 data_out = {{5{1'b0}}, 1'b1, {6{fillchar}}};
               ((6 + offset) % 12):
                 data_out = {{6{1'b0}}, 1'b1, {5{fillchar}}};
               ((7 + offset) % 12):
                 data_out = {{7{1'b0}}, 1'b1, {4{fillchar}}};
               ((8 + offset) % 12):
                 data_out = {{8{1'b0}}, 1'b1, {3{fillchar}}};
               ((9 + offset) % 12):
                 data_out = {{9{1'b0}}, 1'b1, {2{fillchar}}};
               ((10 + offset) % 12):
                 data_out = {{10{1'b0}}, 1'b1, {1{fillchar}}};
               ((11 + offset) % 12):
                 data_out = {{11{1'b0}}, 1'b1};
               default:
                 data_out = {12{1'bx}};
             endcase
          end
      else if(num_ports == 13)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 13):
                 data_out = {1'b1, {12{fillchar}}};
               ((1 + offset) % 13):
                 data_out = {{1{1'b0}}, 1'b1, {11{fillchar}}};
               ((2 + offset) % 13):
                 data_out = {{2{1'b0}}, 1'b1, {10{fillchar}}};
               ((3 + offset) % 13):
                 data_out = {{3{1'b0}}, 1'b1, {9{fillchar}}};
               ((4 + offset) % 13):
                 data_out = {{4{1'b0}}, 1'b1, {8{fillchar}}};
               ((5 + offset) % 13):
                 data_out = {{5{1'b0}}, 1'b1, {7{fillchar}}};
               ((6 + offset) % 13):
                 data_out = {{6{1'b0}}, 1'b1, {6{fillchar}}};
               ((7 + offset) % 13):
                 data_out = {{7{1'b0}}, 1'b1, {5{fillchar}}};
               ((8 + offset) % 13):
                 data_out = {{8{1'b0}}, 1'b1, {4{fillchar}}};
               ((9 + offset) % 13):
                 data_out = {{9{1'b0}}, 1'b1, {3{fillchar}}};
               ((10 + offset) % 13):
                 data_out = {{10{1'b0}}, 1'b1, {2{fillchar}}};
               ((11 + offset) % 13):
                 data_out = {{11{1'b0}}, 1'b1, {1{fillchar}}};
               ((12 + offset) % 13):
                 data_out = {{12{1'b0}}, 1'b1};
               default:
                 data_out = {13{1'bx}};
             endcase
          end
      else if(num_ports == 14)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 14):
                 data_out = {1'b1, {13{fillchar}}};
               ((1 + offset) % 14):
                 data_out = {{1{1'b0}}, 1'b1, {12{fillchar}}};
               ((2 + offset) % 14):
                 data_out = {{2{1'b0}}, 1'b1, {11{fillchar}}};
               ((3 + offset) % 14):
                 data_out = {{3{1'b0}}, 1'b1, {10{fillchar}}};
               ((4 + offset) % 14):
                 data_out = {{4{1'b0}}, 1'b1, {9{fillchar}}};
               ((5 + offset) % 14):
                 data_out = {{5{1'b0}}, 1'b1, {8{fillchar}}};
               ((6 + offset) % 14):
                 data_out = {{6{1'b0}}, 1'b1, {7{fillchar}}};
               ((7 + offset) % 14):
                 data_out = {{7{1'b0}}, 1'b1, {6{fillchar}}};
               ((8 + offset) % 14):
                 data_out = {{8{1'b0}}, 1'b1, {5{fillchar}}};
               ((9 + offset) % 14):
                 data_out = {{9{1'b0}}, 1'b1, {4{fillchar}}};
               ((10 + offset) % 14):
                 data_out = {{10{1'b0}}, 1'b1, {3{fillchar}}};
               ((11 + offset) % 14):
                 data_out = {{11{1'b0}}, 1'b1, {2{fillchar}}};
               ((12 + offset) % 14):
                 data_out = {{12{1'b0}}, 1'b1, {1{fillchar}}};
               ((13 + offset) % 14):
                 data_out = {{13{1'b0}}, 1'b1};
               default:
                 data_out = {14{1'bx}};
             endcase
          end
      else if(num_ports == 15)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 15):
                 data_out = {1'b1, {14{fillchar}}};
               ((1 + offset) % 15):
                 data_out = {{1{1'b0}}, 1'b1, {13{fillchar}}};
               ((2 + offset) % 15):
                 data_out = {{2{1'b0}}, 1'b1, {12{fillchar}}};
               ((3 + offset) % 15):
                 data_out = {{3{1'b0}}, 1'b1, {11{fillchar}}};
               ((4 + offset) % 15):
                 data_out = {{4{1'b0}}, 1'b1, {10{fillchar}}};
               ((5 + offset) % 15):
                 data_out = {{5{1'b0}}, 1'b1, {9{fillchar}}};
               ((6 + offset) % 15):
                 data_out = {{6{1'b0}}, 1'b1, {8{fillchar}}};
               ((7 + offset) % 15):
                 data_out = {{7{1'b0}}, 1'b1, {7{fillchar}}};
               ((8 + offset) % 15):
                 data_out = {{8{1'b0}}, 1'b1, {6{fillchar}}};
               ((9 + offset) % 15):
                 data_out = {{9{1'b0}}, 1'b1, {5{fillchar}}};
               ((10 + offset) % 15):
                 data_out = {{10{1'b0}}, 1'b1, {4{fillchar}}};
               ((11 + offset) % 15):
                 data_out = {{11{1'b0}}, 1'b1, {3{fillchar}}};
               ((12 + offset) % 15):
                 data_out = {{12{1'b0}}, 1'b1, {2{fillchar}}};
               ((13 + offset) % 15):
                 data_out = {{13{1'b0}}, 1'b1, {1{fillchar}}};
               ((14 + offset) % 15):
                 data_out = {{14{1'b0}}, 1'b1};
               default:
                 data_out = {15{1'bx}};
             endcase
          end
      else if(num_ports == 16)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 16):
                 data_out = {1'b1, {15{fillchar}}};
               ((1 + offset) % 16):
                 data_out = {{1{1'b0}}, 1'b1, {14{fillchar}}};
               ((2 + offset) % 16):
                 data_out = {{2{1'b0}}, 1'b1, {13{fillchar}}};
               ((3 + offset) % 16):
                 data_out = {{3{1'b0}}, 1'b1, {12{fillchar}}};
               ((4 + offset) % 16):
                 data_out = {{4{1'b0}}, 1'b1, {11{fillchar}}};
               ((5 + offset) % 16):
                 data_out = {{5{1'b0}}, 1'b1, {10{fillchar}}};
               ((6 + offset) % 16):
                 data_out = {{6{1'b0}}, 1'b1, {9{fillchar}}};
               ((7 + offset) % 16):
                 data_out = {{7{1'b0}}, 1'b1, {8{fillchar}}};
               ((8 + offset) % 16):
                 data_out = {{8{1'b0}}, 1'b1, {7{fillchar}}};
               ((9 + offset) % 16):
                 data_out = {{9{1'b0}}, 1'b1, {6{fillchar}}};
               ((10 + offset) % 16):
                 data_out = {{10{1'b0}}, 1'b1, {5{fillchar}}};
               ((11 + offset) % 16):
                 data_out = {{11{1'b0}}, 1'b1, {4{fillchar}}};
               ((12 + offset) % 16):
                 data_out = {{12{1'b0}}, 1'b1, {3{fillchar}}};
               ((13 + offset) % 16):
                 data_out = {{13{1'b0}}, 1'b1, {2{fillchar}}};
               ((14 + offset) % 16):
                 data_out = {{14{1'b0}}, 1'b1, {1{fillchar}}};
               ((15 + offset) % 16):
                 data_out = {{15{1'b0}}, 1'b1};
               default:
                 data_out = {16{1'bx}};
             endcase
          end
      else if(num_ports == 17)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 17):
                 data_out = {1'b1, {16{fillchar}}};
               ((1 + offset) % 17):
                 data_out = {{1{1'b0}}, 1'b1, {15{fillchar}}};
               ((2 + offset) % 17):
                 data_out = {{2{1'b0}}, 1'b1, {14{fillchar}}};
               ((3 + offset) % 17):
                 data_out = {{3{1'b0}}, 1'b1, {13{fillchar}}};
               ((4 + offset) % 17):
                 data_out = {{4{1'b0}}, 1'b1, {12{fillchar}}};
               ((5 + offset) % 17):
                 data_out = {{5{1'b0}}, 1'b1, {11{fillchar}}};
               ((6 + offset) % 17):
                 data_out = {{6{1'b0}}, 1'b1, {10{fillchar}}};
               ((7 + offset) % 17):
                 data_out = {{7{1'b0}}, 1'b1, {9{fillchar}}};
               ((8 + offset) % 17):
                 data_out = {{8{1'b0}}, 1'b1, {8{fillchar}}};
               ((9 + offset) % 17):
                 data_out = {{9{1'b0}}, 1'b1, {7{fillchar}}};
               ((10 + offset) % 17):
                 data_out = {{10{1'b0}}, 1'b1, {6{fillchar}}};
               ((11 + offset) % 17):
                 data_out = {{11{1'b0}}, 1'b1, {5{fillchar}}};
               ((12 + offset) % 17):
                 data_out = {{12{1'b0}}, 1'b1, {4{fillchar}}};
               ((13 + offset) % 17):
                 data_out = {{13{1'b0}}, 1'b1, {3{fillchar}}};
               ((14 + offset) % 17):
                 data_out = {{14{1'b0}}, 1'b1, {2{fillchar}}};
               ((15 + offset) % 17):
                 data_out = {{15{1'b0}}, 1'b1, {1{fillchar}}};
               ((16 + offset) % 17):
                 data_out = {{16{1'b0}}, 1'b1};
               default:
                 data_out = {17{1'bx}};
             endcase
          end
      else if(num_ports == 18)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 18):
                 data_out = {1'b1, {17{fillchar}}};
               ((1 + offset) % 18):
                 data_out = {{1{1'b0}}, 1'b1, {16{fillchar}}};
               ((2 + offset) % 18):
                 data_out = {{2{1'b0}}, 1'b1, {15{fillchar}}};
               ((3 + offset) % 18):
                 data_out = {{3{1'b0}}, 1'b1, {14{fillchar}}};
               ((4 + offset) % 18):
                 data_out = {{4{1'b0}}, 1'b1, {13{fillchar}}};
               ((5 + offset) % 18):
                 data_out = {{5{1'b0}}, 1'b1, {12{fillchar}}};
               ((6 + offset) % 18):
                 data_out = {{6{1'b0}}, 1'b1, {11{fillchar}}};
               ((7 + offset) % 18):
                 data_out = {{7{1'b0}}, 1'b1, {10{fillchar}}};
               ((8 + offset) % 18):
                 data_out = {{8{1'b0}}, 1'b1, {9{fillchar}}};
               ((9 + offset) % 18):
                 data_out = {{9{1'b0}}, 1'b1, {8{fillchar}}};
               ((10 + offset) % 18):
                 data_out = {{10{1'b0}}, 1'b1, {7{fillchar}}};
               ((11 + offset) % 18):
                 data_out = {{11{1'b0}}, 1'b1, {6{fillchar}}};
               ((12 + offset) % 18):
                 data_out = {{12{1'b0}}, 1'b1, {5{fillchar}}};
               ((13 + offset) % 18):
                 data_out = {{13{1'b0}}, 1'b1, {4{fillchar}}};
               ((14 + offset) % 18):
                 data_out = {{14{1'b0}}, 1'b1, {3{fillchar}}};
               ((15 + offset) % 18):
                 data_out = {{15{1'b0}}, 1'b1, {2{fillchar}}};
               ((16 + offset) % 18):
                 data_out = {{16{1'b0}}, 1'b1, {1{fillchar}}};
               ((17 + offset) % 18):
                 data_out = {{17{1'b0}}, 1'b1};
               default:
                 data_out = {18{1'bx}};
             endcase
          end
      else if(num_ports == 19)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 19):
                 data_out = {1'b1, {18{fillchar}}};
               ((1 + offset) % 19):
                 data_out = {{1{1'b0}}, 1'b1, {17{fillchar}}};
               ((2 + offset) % 19):
                 data_out = {{2{1'b0}}, 1'b1, {16{fillchar}}};
               ((3 + offset) % 19):
                 data_out = {{3{1'b0}}, 1'b1, {15{fillchar}}};
               ((4 + offset) % 19):
                 data_out = {{4{1'b0}}, 1'b1, {14{fillchar}}};
               ((5 + offset) % 19):
                 data_out = {{5{1'b0}}, 1'b1, {13{fillchar}}};
               ((6 + offset) % 19):
                 data_out = {{6{1'b0}}, 1'b1, {12{fillchar}}};
               ((7 + offset) % 19):
                 data_out = {{7{1'b0}}, 1'b1, {11{fillchar}}};
               ((8 + offset) % 19):
                 data_out = {{8{1'b0}}, 1'b1, {10{fillchar}}};
               ((9 + offset) % 19):
                 data_out = {{9{1'b0}}, 1'b1, {9{fillchar}}};
               ((10 + offset) % 19):
                 data_out = {{10{1'b0}}, 1'b1, {8{fillchar}}};
               ((11 + offset) % 19):
                 data_out = {{11{1'b0}}, 1'b1, {7{fillchar}}};
               ((12 + offset) % 19):
                 data_out = {{12{1'b0}}, 1'b1, {6{fillchar}}};
               ((13 + offset) % 19):
                 data_out = {{13{1'b0}}, 1'b1, {5{fillchar}}};
               ((14 + offset) % 19):
                 data_out = {{14{1'b0}}, 1'b1, {4{fillchar}}};
               ((15 + offset) % 19):
                 data_out = {{15{1'b0}}, 1'b1, {3{fillchar}}};
               ((16 + offset) % 19):
                 data_out = {{16{1'b0}}, 1'b1, {2{fillchar}}};
               ((17 + offset) % 19):
                 data_out = {{17{1'b0}}, 1'b1, {1{fillchar}}};
               ((18 + offset) % 19):
                 data_out = {{18{1'b0}}, 1'b1};
               default:
                 data_out = {19{1'bx}};
             endcase
          end
      else if(num_ports == 20)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 20):
                 data_out = {1'b1, {19{fillchar}}};
               ((1 + offset) % 20):
                 data_out = {{1{1'b0}}, 1'b1, {18{fillchar}}};
               ((2 + offset) % 20):
                 data_out = {{2{1'b0}}, 1'b1, {17{fillchar}}};
               ((3 + offset) % 20):
                 data_out = {{3{1'b0}}, 1'b1, {16{fillchar}}};
               ((4 + offset) % 20):
                 data_out = {{4{1'b0}}, 1'b1, {15{fillchar}}};
               ((5 + offset) % 20):
                 data_out = {{5{1'b0}}, 1'b1, {14{fillchar}}};
               ((6 + offset) % 20):
                 data_out = {{6{1'b0}}, 1'b1, {13{fillchar}}};
               ((7 + offset) % 20):
                 data_out = {{7{1'b0}}, 1'b1, {12{fillchar}}};
               ((8 + offset) % 20):
                 data_out = {{8{1'b0}}, 1'b1, {11{fillchar}}};
               ((9 + offset) % 20):
                 data_out = {{9{1'b0}}, 1'b1, {10{fillchar}}};
               ((10 + offset) % 20):
                 data_out = {{10{1'b0}}, 1'b1, {9{fillchar}}};
               ((11 + offset) % 20):
                 data_out = {{11{1'b0}}, 1'b1, {8{fillchar}}};
               ((12 + offset) % 20):
                 data_out = {{12{1'b0}}, 1'b1, {7{fillchar}}};
               ((13 + offset) % 20):
                 data_out = {{13{1'b0}}, 1'b1, {6{fillchar}}};
               ((14 + offset) % 20):
                 data_out = {{14{1'b0}}, 1'b1, {5{fillchar}}};
               ((15 + offset) % 20):
                 data_out = {{15{1'b0}}, 1'b1, {4{fillchar}}};
               ((16 + offset) % 20):
                 data_out = {{16{1'b0}}, 1'b1, {3{fillchar}}};
               ((17 + offset) % 20):
                 data_out = {{17{1'b0}}, 1'b1, {2{fillchar}}};
               ((18 + offset) % 20):
                 data_out = {{18{1'b0}}, 1'b1, {1{fillchar}}};
               ((19 + offset) % 20):
                 data_out = {{19{1'b0}}, 1'b1};
               default:
                 data_out = {20{1'bx}};
             endcase
          end
      else if(num_ports == 21)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 21):
                 data_out = {1'b1, {20{fillchar}}};
               ((1 + offset) % 21):
                 data_out = {{1{1'b0}}, 1'b1, {19{fillchar}}};
               ((2 + offset) % 21):
                 data_out = {{2{1'b0}}, 1'b1, {18{fillchar}}};
               ((3 + offset) % 21):
                 data_out = {{3{1'b0}}, 1'b1, {17{fillchar}}};
               ((4 + offset) % 21):
                 data_out = {{4{1'b0}}, 1'b1, {16{fillchar}}};
               ((5 + offset) % 21):
                 data_out = {{5{1'b0}}, 1'b1, {15{fillchar}}};
               ((6 + offset) % 21):
                 data_out = {{6{1'b0}}, 1'b1, {14{fillchar}}};
               ((7 + offset) % 21):
                 data_out = {{7{1'b0}}, 1'b1, {13{fillchar}}};
               ((8 + offset) % 21):
                 data_out = {{8{1'b0}}, 1'b1, {12{fillchar}}};
               ((9 + offset) % 21):
                 data_out = {{9{1'b0}}, 1'b1, {11{fillchar}}};
               ((10 + offset) % 21):
                 data_out = {{10{1'b0}}, 1'b1, {10{fillchar}}};
               ((11 + offset) % 21):
                 data_out = {{11{1'b0}}, 1'b1, {9{fillchar}}};
               ((12 + offset) % 21):
                 data_out = {{12{1'b0}}, 1'b1, {8{fillchar}}};
               ((13 + offset) % 21):
                 data_out = {{13{1'b0}}, 1'b1, {7{fillchar}}};
               ((14 + offset) % 21):
                 data_out = {{14{1'b0}}, 1'b1, {6{fillchar}}};
               ((15 + offset) % 21):
                 data_out = {{15{1'b0}}, 1'b1, {5{fillchar}}};
               ((16 + offset) % 21):
                 data_out = {{16{1'b0}}, 1'b1, {4{fillchar}}};
               ((17 + offset) % 21):
                 data_out = {{17{1'b0}}, 1'b1, {3{fillchar}}};
               ((18 + offset) % 21):
                 data_out = {{18{1'b0}}, 1'b1, {2{fillchar}}};
               ((19 + offset) % 21):
                 data_out = {{19{1'b0}}, 1'b1, {1{fillchar}}};
               ((20 + offset) % 21):
                 data_out = {{20{1'b0}}, 1'b1};
               default:
                 data_out = {21{1'bx}};
             endcase
          end
      else if(num_ports == 22)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 22):
                 data_out = {1'b1, {21{fillchar}}};
               ((1 + offset) % 22):
                 data_out = {{1{1'b0}}, 1'b1, {20{fillchar}}};
               ((2 + offset) % 22):
                 data_out = {{2{1'b0}}, 1'b1, {19{fillchar}}};
               ((3 + offset) % 22):
                 data_out = {{3{1'b0}}, 1'b1, {18{fillchar}}};
               ((4 + offset) % 22):
                 data_out = {{4{1'b0}}, 1'b1, {17{fillchar}}};
               ((5 + offset) % 22):
                 data_out = {{5{1'b0}}, 1'b1, {16{fillchar}}};
               ((6 + offset) % 22):
                 data_out = {{6{1'b0}}, 1'b1, {15{fillchar}}};
               ((7 + offset) % 22):
                 data_out = {{7{1'b0}}, 1'b1, {14{fillchar}}};
               ((8 + offset) % 22):
                 data_out = {{8{1'b0}}, 1'b1, {13{fillchar}}};
               ((9 + offset) % 22):
                 data_out = {{9{1'b0}}, 1'b1, {12{fillchar}}};
               ((10 + offset) % 22):
                 data_out = {{10{1'b0}}, 1'b1, {11{fillchar}}};
               ((11 + offset) % 22):
                 data_out = {{11{1'b0}}, 1'b1, {10{fillchar}}};
               ((12 + offset) % 22):
                 data_out = {{12{1'b0}}, 1'b1, {9{fillchar}}};
               ((13 + offset) % 22):
                 data_out = {{13{1'b0}}, 1'b1, {8{fillchar}}};
               ((14 + offset) % 22):
                 data_out = {{14{1'b0}}, 1'b1, {7{fillchar}}};
               ((15 + offset) % 22):
                 data_out = {{15{1'b0}}, 1'b1, {6{fillchar}}};
               ((16 + offset) % 22):
                 data_out = {{16{1'b0}}, 1'b1, {5{fillchar}}};
               ((17 + offset) % 22):
                 data_out = {{17{1'b0}}, 1'b1, {4{fillchar}}};
               ((18 + offset) % 22):
                 data_out = {{18{1'b0}}, 1'b1, {3{fillchar}}};
               ((19 + offset) % 22):
                 data_out = {{19{1'b0}}, 1'b1, {2{fillchar}}};
               ((20 + offset) % 22):
                 data_out = {{20{1'b0}}, 1'b1, {1{fillchar}}};
               ((21 + offset) % 22):
                 data_out = {{21{1'b0}}, 1'b1};
               default:
                 data_out = {22{1'bx}};
             endcase
          end
      else if(num_ports == 23)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 23):
                 data_out = {1'b1, {22{fillchar}}};
               ((1 + offset) % 23):
                 data_out = {{1{1'b0}}, 1'b1, {21{fillchar}}};
               ((2 + offset) % 23):
                 data_out = {{2{1'b0}}, 1'b1, {20{fillchar}}};
               ((3 + offset) % 23):
                 data_out = {{3{1'b0}}, 1'b1, {19{fillchar}}};
               ((4 + offset) % 23):
                 data_out = {{4{1'b0}}, 1'b1, {18{fillchar}}};
               ((5 + offset) % 23):
                 data_out = {{5{1'b0}}, 1'b1, {17{fillchar}}};
               ((6 + offset) % 23):
                 data_out = {{6{1'b0}}, 1'b1, {16{fillchar}}};
               ((7 + offset) % 23):
                 data_out = {{7{1'b0}}, 1'b1, {15{fillchar}}};
               ((8 + offset) % 23):
                 data_out = {{8{1'b0}}, 1'b1, {14{fillchar}}};
               ((9 + offset) % 23):
                 data_out = {{9{1'b0}}, 1'b1, {13{fillchar}}};
               ((10 + offset) % 23):
                 data_out = {{10{1'b0}}, 1'b1, {12{fillchar}}};
               ((11 + offset) % 23):
                 data_out = {{11{1'b0}}, 1'b1, {11{fillchar}}};
               ((12 + offset) % 23):
                 data_out = {{12{1'b0}}, 1'b1, {10{fillchar}}};
               ((13 + offset) % 23):
                 data_out = {{13{1'b0}}, 1'b1, {9{fillchar}}};
               ((14 + offset) % 23):
                 data_out = {{14{1'b0}}, 1'b1, {8{fillchar}}};
               ((15 + offset) % 23):
                 data_out = {{15{1'b0}}, 1'b1, {7{fillchar}}};
               ((16 + offset) % 23):
                 data_out = {{16{1'b0}}, 1'b1, {6{fillchar}}};
               ((17 + offset) % 23):
                 data_out = {{17{1'b0}}, 1'b1, {5{fillchar}}};
               ((18 + offset) % 23):
                 data_out = {{18{1'b0}}, 1'b1, {4{fillchar}}};
               ((19 + offset) % 23):
                 data_out = {{19{1'b0}}, 1'b1, {3{fillchar}}};
               ((20 + offset) % 23):
                 data_out = {{20{1'b0}}, 1'b1, {2{fillchar}}};
               ((21 + offset) % 23):
                 data_out = {{21{1'b0}}, 1'b1, {1{fillchar}}};
               ((22 + offset) % 23):
                 data_out = {{22{1'b0}}, 1'b1};
               default:
                 data_out = {23{1'bx}};
             endcase
          end
      else if(num_ports == 24)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 24):
                 data_out = {1'b1, {23{fillchar}}};
               ((1 + offset) % 24):
                 data_out = {{1{1'b0}}, 1'b1, {22{fillchar}}};
               ((2 + offset) % 24):
                 data_out = {{2{1'b0}}, 1'b1, {21{fillchar}}};
               ((3 + offset) % 24):
                 data_out = {{3{1'b0}}, 1'b1, {20{fillchar}}};
               ((4 + offset) % 24):
                 data_out = {{4{1'b0}}, 1'b1, {19{fillchar}}};
               ((5 + offset) % 24):
                 data_out = {{5{1'b0}}, 1'b1, {18{fillchar}}};
               ((6 + offset) % 24):
                 data_out = {{6{1'b0}}, 1'b1, {17{fillchar}}};
               ((7 + offset) % 24):
                 data_out = {{7{1'b0}}, 1'b1, {16{fillchar}}};
               ((8 + offset) % 24):
                 data_out = {{8{1'b0}}, 1'b1, {15{fillchar}}};
               ((9 + offset) % 24):
                 data_out = {{9{1'b0}}, 1'b1, {14{fillchar}}};
               ((10 + offset) % 24):
                 data_out = {{10{1'b0}}, 1'b1, {13{fillchar}}};
               ((11 + offset) % 24):
                 data_out = {{11{1'b0}}, 1'b1, {12{fillchar}}};
               ((12 + offset) % 24):
                 data_out = {{12{1'b0}}, 1'b1, {11{fillchar}}};
               ((13 + offset) % 24):
                 data_out = {{13{1'b0}}, 1'b1, {10{fillchar}}};
               ((14 + offset) % 24):
                 data_out = {{14{1'b0}}, 1'b1, {9{fillchar}}};
               ((15 + offset) % 24):
                 data_out = {{15{1'b0}}, 1'b1, {8{fillchar}}};
               ((16 + offset) % 24):
                 data_out = {{16{1'b0}}, 1'b1, {7{fillchar}}};
               ((17 + offset) % 24):
                 data_out = {{17{1'b0}}, 1'b1, {6{fillchar}}};
               ((18 + offset) % 24):
                 data_out = {{18{1'b0}}, 1'b1, {5{fillchar}}};
               ((19 + offset) % 24):
                 data_out = {{19{1'b0}}, 1'b1, {4{fillchar}}};
               ((20 + offset) % 24):
                 data_out = {{20{1'b0}}, 1'b1, {3{fillchar}}};
               ((21 + offset) % 24):
                 data_out = {{21{1'b0}}, 1'b1, {2{fillchar}}};
               ((22 + offset) % 24):
                 data_out = {{22{1'b0}}, 1'b1, {1{fillchar}}};
               ((23 + offset) % 24):
                 data_out = {{23{1'b0}}, 1'b1};
               default:
                 data_out = {24{1'bx}};
             endcase
          end
      else if(num_ports == 25)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 25):
                 data_out = {1'b1, {24{fillchar}}};
               ((1 + offset) % 25):
                 data_out = {{1{1'b0}}, 1'b1, {23{fillchar}}};
               ((2 + offset) % 25):
                 data_out = {{2{1'b0}}, 1'b1, {22{fillchar}}};
               ((3 + offset) % 25):
                 data_out = {{3{1'b0}}, 1'b1, {21{fillchar}}};
               ((4 + offset) % 25):
                 data_out = {{4{1'b0}}, 1'b1, {20{fillchar}}};
               ((5 + offset) % 25):
                 data_out = {{5{1'b0}}, 1'b1, {19{fillchar}}};
               ((6 + offset) % 25):
                 data_out = {{6{1'b0}}, 1'b1, {18{fillchar}}};
               ((7 + offset) % 25):
                 data_out = {{7{1'b0}}, 1'b1, {17{fillchar}}};
               ((8 + offset) % 25):
                 data_out = {{8{1'b0}}, 1'b1, {16{fillchar}}};
               ((9 + offset) % 25):
                 data_out = {{9{1'b0}}, 1'b1, {15{fillchar}}};
               ((10 + offset) % 25):
                 data_out = {{10{1'b0}}, 1'b1, {14{fillchar}}};
               ((11 + offset) % 25):
                 data_out = {{11{1'b0}}, 1'b1, {13{fillchar}}};
               ((12 + offset) % 25):
                 data_out = {{12{1'b0}}, 1'b1, {12{fillchar}}};
               ((13 + offset) % 25):
                 data_out = {{13{1'b0}}, 1'b1, {11{fillchar}}};
               ((14 + offset) % 25):
                 data_out = {{14{1'b0}}, 1'b1, {10{fillchar}}};
               ((15 + offset) % 25):
                 data_out = {{15{1'b0}}, 1'b1, {9{fillchar}}};
               ((16 + offset) % 25):
                 data_out = {{16{1'b0}}, 1'b1, {8{fillchar}}};
               ((17 + offset) % 25):
                 data_out = {{17{1'b0}}, 1'b1, {7{fillchar}}};
               ((18 + offset) % 25):
                 data_out = {{18{1'b0}}, 1'b1, {6{fillchar}}};
               ((19 + offset) % 25):
                 data_out = {{19{1'b0}}, 1'b1, {5{fillchar}}};
               ((20 + offset) % 25):
                 data_out = {{20{1'b0}}, 1'b1, {4{fillchar}}};
               ((21 + offset) % 25):
                 data_out = {{21{1'b0}}, 1'b1, {3{fillchar}}};
               ((22 + offset) % 25):
                 data_out = {{22{1'b0}}, 1'b1, {2{fillchar}}};
               ((23 + offset) % 25):
                 data_out = {{23{1'b0}}, 1'b1, {1{fillchar}}};
               ((24 + offset) % 25):
                 data_out = {{24{1'b0}}, 1'b1};
               default:
                 data_out = {25{1'bx}};
             endcase
          end
      else if(num_ports == 26)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 26):
                 data_out = {1'b1, {25{fillchar}}};
               ((1 + offset) % 26):
                 data_out = {{1{1'b0}}, 1'b1, {24{fillchar}}};
               ((2 + offset) % 26):
                 data_out = {{2{1'b0}}, 1'b1, {23{fillchar}}};
               ((3 + offset) % 26):
                 data_out = {{3{1'b0}}, 1'b1, {22{fillchar}}};
               ((4 + offset) % 26):
                 data_out = {{4{1'b0}}, 1'b1, {21{fillchar}}};
               ((5 + offset) % 26):
                 data_out = {{5{1'b0}}, 1'b1, {20{fillchar}}};
               ((6 + offset) % 26):
                 data_out = {{6{1'b0}}, 1'b1, {19{fillchar}}};
               ((7 + offset) % 26):
                 data_out = {{7{1'b0}}, 1'b1, {18{fillchar}}};
               ((8 + offset) % 26):
                 data_out = {{8{1'b0}}, 1'b1, {17{fillchar}}};
               ((9 + offset) % 26):
                 data_out = {{9{1'b0}}, 1'b1, {16{fillchar}}};
               ((10 + offset) % 26):
                 data_out = {{10{1'b0}}, 1'b1, {15{fillchar}}};
               ((11 + offset) % 26):
                 data_out = {{11{1'b0}}, 1'b1, {14{fillchar}}};
               ((12 + offset) % 26):
                 data_out = {{12{1'b0}}, 1'b1, {13{fillchar}}};
               ((13 + offset) % 26):
                 data_out = {{13{1'b0}}, 1'b1, {12{fillchar}}};
               ((14 + offset) % 26):
                 data_out = {{14{1'b0}}, 1'b1, {11{fillchar}}};
               ((15 + offset) % 26):
                 data_out = {{15{1'b0}}, 1'b1, {10{fillchar}}};
               ((16 + offset) % 26):
                 data_out = {{16{1'b0}}, 1'b1, {9{fillchar}}};
               ((17 + offset) % 26):
                 data_out = {{17{1'b0}}, 1'b1, {8{fillchar}}};
               ((18 + offset) % 26):
                 data_out = {{18{1'b0}}, 1'b1, {7{fillchar}}};
               ((19 + offset) % 26):
                 data_out = {{19{1'b0}}, 1'b1, {6{fillchar}}};
               ((20 + offset) % 26):
                 data_out = {{20{1'b0}}, 1'b1, {5{fillchar}}};
               ((21 + offset) % 26):
                 data_out = {{21{1'b0}}, 1'b1, {4{fillchar}}};
               ((22 + offset) % 26):
                 data_out = {{22{1'b0}}, 1'b1, {3{fillchar}}};
               ((23 + offset) % 26):
                 data_out = {{23{1'b0}}, 1'b1, {2{fillchar}}};
               ((24 + offset) % 26):
                 data_out = {{24{1'b0}}, 1'b1, {1{fillchar}}};
               ((25 + offset) % 26):
                 data_out = {{25{1'b0}}, 1'b1};
               default:
                 data_out = {26{1'bx}};
             endcase
          end
      else if(num_ports == 27)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 27):
                 data_out = {1'b1, {26{fillchar}}};
               ((1 + offset) % 27):
                 data_out = {{1{1'b0}}, 1'b1, {25{fillchar}}};
               ((2 + offset) % 27):
                 data_out = {{2{1'b0}}, 1'b1, {24{fillchar}}};
               ((3 + offset) % 27):
                 data_out = {{3{1'b0}}, 1'b1, {23{fillchar}}};
               ((4 + offset) % 27):
                 data_out = {{4{1'b0}}, 1'b1, {22{fillchar}}};
               ((5 + offset) % 27):
                 data_out = {{5{1'b0}}, 1'b1, {21{fillchar}}};
               ((6 + offset) % 27):
                 data_out = {{6{1'b0}}, 1'b1, {20{fillchar}}};
               ((7 + offset) % 27):
                 data_out = {{7{1'b0}}, 1'b1, {19{fillchar}}};
               ((8 + offset) % 27):
                 data_out = {{8{1'b0}}, 1'b1, {18{fillchar}}};
               ((9 + offset) % 27):
                 data_out = {{9{1'b0}}, 1'b1, {17{fillchar}}};
               ((10 + offset) % 27):
                 data_out = {{10{1'b0}}, 1'b1, {16{fillchar}}};
               ((11 + offset) % 27):
                 data_out = {{11{1'b0}}, 1'b1, {15{fillchar}}};
               ((12 + offset) % 27):
                 data_out = {{12{1'b0}}, 1'b1, {14{fillchar}}};
               ((13 + offset) % 27):
                 data_out = {{13{1'b0}}, 1'b1, {13{fillchar}}};
               ((14 + offset) % 27):
                 data_out = {{14{1'b0}}, 1'b1, {12{fillchar}}};
               ((15 + offset) % 27):
                 data_out = {{15{1'b0}}, 1'b1, {11{fillchar}}};
               ((16 + offset) % 27):
                 data_out = {{16{1'b0}}, 1'b1, {10{fillchar}}};
               ((17 + offset) % 27):
                 data_out = {{17{1'b0}}, 1'b1, {9{fillchar}}};
               ((18 + offset) % 27):
                 data_out = {{18{1'b0}}, 1'b1, {8{fillchar}}};
               ((19 + offset) % 27):
                 data_out = {{19{1'b0}}, 1'b1, {7{fillchar}}};
               ((20 + offset) % 27):
                 data_out = {{20{1'b0}}, 1'b1, {6{fillchar}}};
               ((21 + offset) % 27):
                 data_out = {{21{1'b0}}, 1'b1, {5{fillchar}}};
               ((22 + offset) % 27):
                 data_out = {{22{1'b0}}, 1'b1, {4{fillchar}}};
               ((23 + offset) % 27):
                 data_out = {{23{1'b0}}, 1'b1, {3{fillchar}}};
               ((24 + offset) % 27):
                 data_out = {{24{1'b0}}, 1'b1, {2{fillchar}}};
               ((25 + offset) % 27):
                 data_out = {{25{1'b0}}, 1'b1, {1{fillchar}}};
               ((26 + offset) % 27):
                 data_out = {{26{1'b0}}, 1'b1};
               default:
                 data_out = {27{1'bx}};
             endcase
          end
      else if(num_ports == 28)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 28):
                 data_out = {1'b1, {27{fillchar}}};
               ((1 + offset) % 28):
                 data_out = {{1{1'b0}}, 1'b1, {26{fillchar}}};
               ((2 + offset) % 28):
                 data_out = {{2{1'b0}}, 1'b1, {25{fillchar}}};
               ((3 + offset) % 28):
                 data_out = {{3{1'b0}}, 1'b1, {24{fillchar}}};
               ((4 + offset) % 28):
                 data_out = {{4{1'b0}}, 1'b1, {23{fillchar}}};
               ((5 + offset) % 28):
                 data_out = {{5{1'b0}}, 1'b1, {22{fillchar}}};
               ((6 + offset) % 28):
                 data_out = {{6{1'b0}}, 1'b1, {21{fillchar}}};
               ((7 + offset) % 28):
                 data_out = {{7{1'b0}}, 1'b1, {20{fillchar}}};
               ((8 + offset) % 28):
                 data_out = {{8{1'b0}}, 1'b1, {19{fillchar}}};
               ((9 + offset) % 28):
                 data_out = {{9{1'b0}}, 1'b1, {18{fillchar}}};
               ((10 + offset) % 28):
                 data_out = {{10{1'b0}}, 1'b1, {17{fillchar}}};
               ((11 + offset) % 28):
                 data_out = {{11{1'b0}}, 1'b1, {16{fillchar}}};
               ((12 + offset) % 28):
                 data_out = {{12{1'b0}}, 1'b1, {15{fillchar}}};
               ((13 + offset) % 28):
                 data_out = {{13{1'b0}}, 1'b1, {14{fillchar}}};
               ((14 + offset) % 28):
                 data_out = {{14{1'b0}}, 1'b1, {13{fillchar}}};
               ((15 + offset) % 28):
                 data_out = {{15{1'b0}}, 1'b1, {12{fillchar}}};
               ((16 + offset) % 28):
                 data_out = {{16{1'b0}}, 1'b1, {11{fillchar}}};
               ((17 + offset) % 28):
                 data_out = {{17{1'b0}}, 1'b1, {10{fillchar}}};
               ((18 + offset) % 28):
                 data_out = {{18{1'b0}}, 1'b1, {9{fillchar}}};
               ((19 + offset) % 28):
                 data_out = {{19{1'b0}}, 1'b1, {8{fillchar}}};
               ((20 + offset) % 28):
                 data_out = {{20{1'b0}}, 1'b1, {7{fillchar}}};
               ((21 + offset) % 28):
                 data_out = {{21{1'b0}}, 1'b1, {6{fillchar}}};
               ((22 + offset) % 28):
                 data_out = {{22{1'b0}}, 1'b1, {5{fillchar}}};
               ((23 + offset) % 28):
                 data_out = {{23{1'b0}}, 1'b1, {4{fillchar}}};
               ((24 + offset) % 28):
                 data_out = {{24{1'b0}}, 1'b1, {3{fillchar}}};
               ((25 + offset) % 28):
                 data_out = {{25{1'b0}}, 1'b1, {2{fillchar}}};
               ((26 + offset) % 28):
                 data_out = {{26{1'b0}}, 1'b1, {1{fillchar}}};
               ((27 + offset) % 28):
                 data_out = {{27{1'b0}}, 1'b1};
               default:
                 data_out = {28{1'bx}};
             endcase
          end
      else if(num_ports == 29)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 29):
                 data_out = {1'b1, {28{fillchar}}};
               ((1 + offset) % 29):
                 data_out = {{1{1'b0}}, 1'b1, {27{fillchar}}};
               ((2 + offset) % 29):
                 data_out = {{2{1'b0}}, 1'b1, {26{fillchar}}};
               ((3 + offset) % 29):
                 data_out = {{3{1'b0}}, 1'b1, {25{fillchar}}};
               ((4 + offset) % 29):
                 data_out = {{4{1'b0}}, 1'b1, {24{fillchar}}};
               ((5 + offset) % 29):
                 data_out = {{5{1'b0}}, 1'b1, {23{fillchar}}};
               ((6 + offset) % 29):
                 data_out = {{6{1'b0}}, 1'b1, {22{fillchar}}};
               ((7 + offset) % 29):
                 data_out = {{7{1'b0}}, 1'b1, {21{fillchar}}};
               ((8 + offset) % 29):
                 data_out = {{8{1'b0}}, 1'b1, {20{fillchar}}};
               ((9 + offset) % 29):
                 data_out = {{9{1'b0}}, 1'b1, {19{fillchar}}};
               ((10 + offset) % 29):
                 data_out = {{10{1'b0}}, 1'b1, {18{fillchar}}};
               ((11 + offset) % 29):
                 data_out = {{11{1'b0}}, 1'b1, {17{fillchar}}};
               ((12 + offset) % 29):
                 data_out = {{12{1'b0}}, 1'b1, {16{fillchar}}};
               ((13 + offset) % 29):
                 data_out = {{13{1'b0}}, 1'b1, {15{fillchar}}};
               ((14 + offset) % 29):
                 data_out = {{14{1'b0}}, 1'b1, {14{fillchar}}};
               ((15 + offset) % 29):
                 data_out = {{15{1'b0}}, 1'b1, {13{fillchar}}};
               ((16 + offset) % 29):
                 data_out = {{16{1'b0}}, 1'b1, {12{fillchar}}};
               ((17 + offset) % 29):
                 data_out = {{17{1'b0}}, 1'b1, {11{fillchar}}};
               ((18 + offset) % 29):
                 data_out = {{18{1'b0}}, 1'b1, {10{fillchar}}};
               ((19 + offset) % 29):
                 data_out = {{19{1'b0}}, 1'b1, {9{fillchar}}};
               ((20 + offset) % 29):
                 data_out = {{20{1'b0}}, 1'b1, {8{fillchar}}};
               ((21 + offset) % 29):
                 data_out = {{21{1'b0}}, 1'b1, {7{fillchar}}};
               ((22 + offset) % 29):
                 data_out = {{22{1'b0}}, 1'b1, {6{fillchar}}};
               ((23 + offset) % 29):
                 data_out = {{23{1'b0}}, 1'b1, {5{fillchar}}};
               ((24 + offset) % 29):
                 data_out = {{24{1'b0}}, 1'b1, {4{fillchar}}};
               ((25 + offset) % 29):
                 data_out = {{25{1'b0}}, 1'b1, {3{fillchar}}};
               ((26 + offset) % 29):
                 data_out = {{26{1'b0}}, 1'b1, {2{fillchar}}};
               ((27 + offset) % 29):
                 data_out = {{27{1'b0}}, 1'b1, {1{fillchar}}};
               ((28 + offset) % 29):
                 data_out = {{28{1'b0}}, 1'b1};
               default:
                 data_out = {29{1'bx}};
             endcase
          end
      else if(num_ports == 30)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 30):
                 data_out = {1'b1, {29{fillchar}}};
               ((1 + offset) % 30):
                 data_out = {{1{1'b0}}, 1'b1, {28{fillchar}}};
               ((2 + offset) % 30):
                 data_out = {{2{1'b0}}, 1'b1, {27{fillchar}}};
               ((3 + offset) % 30):
                 data_out = {{3{1'b0}}, 1'b1, {26{fillchar}}};
               ((4 + offset) % 30):
                 data_out = {{4{1'b0}}, 1'b1, {25{fillchar}}};
               ((5 + offset) % 30):
                 data_out = {{5{1'b0}}, 1'b1, {24{fillchar}}};
               ((6 + offset) % 30):
                 data_out = {{6{1'b0}}, 1'b1, {23{fillchar}}};
               ((7 + offset) % 30):
                 data_out = {{7{1'b0}}, 1'b1, {22{fillchar}}};
               ((8 + offset) % 30):
                 data_out = {{8{1'b0}}, 1'b1, {21{fillchar}}};
               ((9 + offset) % 30):
                 data_out = {{9{1'b0}}, 1'b1, {20{fillchar}}};
               ((10 + offset) % 30):
                 data_out = {{10{1'b0}}, 1'b1, {19{fillchar}}};
               ((11 + offset) % 30):
                 data_out = {{11{1'b0}}, 1'b1, {18{fillchar}}};
               ((12 + offset) % 30):
                 data_out = {{12{1'b0}}, 1'b1, {17{fillchar}}};
               ((13 + offset) % 30):
                 data_out = {{13{1'b0}}, 1'b1, {16{fillchar}}};
               ((14 + offset) % 30):
                 data_out = {{14{1'b0}}, 1'b1, {15{fillchar}}};
               ((15 + offset) % 30):
                 data_out = {{15{1'b0}}, 1'b1, {14{fillchar}}};
               ((16 + offset) % 30):
                 data_out = {{16{1'b0}}, 1'b1, {13{fillchar}}};
               ((17 + offset) % 30):
                 data_out = {{17{1'b0}}, 1'b1, {12{fillchar}}};
               ((18 + offset) % 30):
                 data_out = {{18{1'b0}}, 1'b1, {11{fillchar}}};
               ((19 + offset) % 30):
                 data_out = {{19{1'b0}}, 1'b1, {10{fillchar}}};
               ((20 + offset) % 30):
                 data_out = {{20{1'b0}}, 1'b1, {9{fillchar}}};
               ((21 + offset) % 30):
                 data_out = {{21{1'b0}}, 1'b1, {8{fillchar}}};
               ((22 + offset) % 30):
                 data_out = {{22{1'b0}}, 1'b1, {7{fillchar}}};
               ((23 + offset) % 30):
                 data_out = {{23{1'b0}}, 1'b1, {6{fillchar}}};
               ((24 + offset) % 30):
                 data_out = {{24{1'b0}}, 1'b1, {5{fillchar}}};
               ((25 + offset) % 30):
                 data_out = {{25{1'b0}}, 1'b1, {4{fillchar}}};
               ((26 + offset) % 30):
                 data_out = {{26{1'b0}}, 1'b1, {3{fillchar}}};
               ((27 + offset) % 30):
                 data_out = {{27{1'b0}}, 1'b1, {2{fillchar}}};
               ((28 + offset) % 30):
                 data_out = {{28{1'b0}}, 1'b1, {1{fillchar}}};
               ((29 + offset) % 30):
                 data_out = {{29{1'b0}}, 1'b1};
               default:
                 data_out = {30{1'bx}};
             endcase
          end
      else if(num_ports == 31)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 31):
                 data_out = {1'b1, {30{fillchar}}};
               ((1 + offset) % 31):
                 data_out = {{1{1'b0}}, 1'b1, {29{fillchar}}};
               ((2 + offset) % 31):
                 data_out = {{2{1'b0}}, 1'b1, {28{fillchar}}};
               ((3 + offset) % 31):
                 data_out = {{3{1'b0}}, 1'b1, {27{fillchar}}};
               ((4 + offset) % 31):
                 data_out = {{4{1'b0}}, 1'b1, {26{fillchar}}};
               ((5 + offset) % 31):
                 data_out = {{5{1'b0}}, 1'b1, {25{fillchar}}};
               ((6 + offset) % 31):
                 data_out = {{6{1'b0}}, 1'b1, {24{fillchar}}};
               ((7 + offset) % 31):
                 data_out = {{7{1'b0}}, 1'b1, {23{fillchar}}};
               ((8 + offset) % 31):
                 data_out = {{8{1'b0}}, 1'b1, {22{fillchar}}};
               ((9 + offset) % 31):
                 data_out = {{9{1'b0}}, 1'b1, {21{fillchar}}};
               ((10 + offset) % 31):
                 data_out = {{10{1'b0}}, 1'b1, {20{fillchar}}};
               ((11 + offset) % 31):
                 data_out = {{11{1'b0}}, 1'b1, {19{fillchar}}};
               ((12 + offset) % 31):
                 data_out = {{12{1'b0}}, 1'b1, {18{fillchar}}};
               ((13 + offset) % 31):
                 data_out = {{13{1'b0}}, 1'b1, {17{fillchar}}};
               ((14 + offset) % 31):
                 data_out = {{14{1'b0}}, 1'b1, {16{fillchar}}};
               ((15 + offset) % 31):
                 data_out = {{15{1'b0}}, 1'b1, {15{fillchar}}};
               ((16 + offset) % 31):
                 data_out = {{16{1'b0}}, 1'b1, {14{fillchar}}};
               ((17 + offset) % 31):
                 data_out = {{17{1'b0}}, 1'b1, {13{fillchar}}};
               ((18 + offset) % 31):
                 data_out = {{18{1'b0}}, 1'b1, {12{fillchar}}};
               ((19 + offset) % 31):
                 data_out = {{19{1'b0}}, 1'b1, {11{fillchar}}};
               ((20 + offset) % 31):
                 data_out = {{20{1'b0}}, 1'b1, {10{fillchar}}};
               ((21 + offset) % 31):
                 data_out = {{21{1'b0}}, 1'b1, {9{fillchar}}};
               ((22 + offset) % 31):
                 data_out = {{22{1'b0}}, 1'b1, {8{fillchar}}};
               ((23 + offset) % 31):
                 data_out = {{23{1'b0}}, 1'b1, {7{fillchar}}};
               ((24 + offset) % 31):
                 data_out = {{24{1'b0}}, 1'b1, {6{fillchar}}};
               ((25 + offset) % 31):
                 data_out = {{25{1'b0}}, 1'b1, {5{fillchar}}};
               ((26 + offset) % 31):
                 data_out = {{26{1'b0}}, 1'b1, {4{fillchar}}};
               ((27 + offset) % 31):
                 data_out = {{27{1'b0}}, 1'b1, {3{fillchar}}};
               ((28 + offset) % 31):
                 data_out = {{28{1'b0}}, 1'b1, {2{fillchar}}};
               ((29 + offset) % 31):
                 data_out = {{29{1'b0}}, 1'b1, {1{fillchar}}};
               ((30 + offset) % 31):
                 data_out = {{30{1'b0}}, 1'b1};
               default:
                 data_out = {31{1'bx}};
             endcase
          end
      else if(num_ports == 32)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 32):
                 data_out = {1'b1, {31{fillchar}}};
               ((1 + offset) % 32):
                 data_out = {{1{1'b0}}, 1'b1, {30{fillchar}}};
               ((2 + offset) % 32):
                 data_out = {{2{1'b0}}, 1'b1, {29{fillchar}}};
               ((3 + offset) % 32):
                 data_out = {{3{1'b0}}, 1'b1, {28{fillchar}}};
               ((4 + offset) % 32):
                 data_out = {{4{1'b0}}, 1'b1, {27{fillchar}}};
               ((5 + offset) % 32):
                 data_out = {{5{1'b0}}, 1'b1, {26{fillchar}}};
               ((6 + offset) % 32):
                 data_out = {{6{1'b0}}, 1'b1, {25{fillchar}}};
               ((7 + offset) % 32):
                 data_out = {{7{1'b0}}, 1'b1, {24{fillchar}}};
               ((8 + offset) % 32):
                 data_out = {{8{1'b0}}, 1'b1, {23{fillchar}}};
               ((9 + offset) % 32):
                 data_out = {{9{1'b0}}, 1'b1, {22{fillchar}}};
               ((10 + offset) % 32):
                 data_out = {{10{1'b0}}, 1'b1, {21{fillchar}}};
               ((11 + offset) % 32):
                 data_out = {{11{1'b0}}, 1'b1, {20{fillchar}}};
               ((12 + offset) % 32):
                 data_out = {{12{1'b0}}, 1'b1, {19{fillchar}}};
               ((13 + offset) % 32):
                 data_out = {{13{1'b0}}, 1'b1, {18{fillchar}}};
               ((14 + offset) % 32):
                 data_out = {{14{1'b0}}, 1'b1, {17{fillchar}}};
               ((15 + offset) % 32):
                 data_out = {{15{1'b0}}, 1'b1, {16{fillchar}}};
               ((16 + offset) % 32):
                 data_out = {{16{1'b0}}, 1'b1, {15{fillchar}}};
               ((17 + offset) % 32):
                 data_out = {{17{1'b0}}, 1'b1, {14{fillchar}}};
               ((18 + offset) % 32):
                 data_out = {{18{1'b0}}, 1'b1, {13{fillchar}}};
               ((19 + offset) % 32):
                 data_out = {{19{1'b0}}, 1'b1, {12{fillchar}}};
               ((20 + offset) % 32):
                 data_out = {{20{1'b0}}, 1'b1, {11{fillchar}}};
               ((21 + offset) % 32):
                 data_out = {{21{1'b0}}, 1'b1, {10{fillchar}}};
               ((22 + offset) % 32):
                 data_out = {{22{1'b0}}, 1'b1, {9{fillchar}}};
               ((23 + offset) % 32):
                 data_out = {{23{1'b0}}, 1'b1, {8{fillchar}}};
               ((24 + offset) % 32):
                 data_out = {{24{1'b0}}, 1'b1, {7{fillchar}}};
               ((25 + offset) % 32):
                 data_out = {{25{1'b0}}, 1'b1, {6{fillchar}}};
               ((26 + offset) % 32):
                 data_out = {{26{1'b0}}, 1'b1, {5{fillchar}}};
               ((27 + offset) % 32):
                 data_out = {{27{1'b0}}, 1'b1, {4{fillchar}}};
               ((28 + offset) % 32):
                 data_out = {{28{1'b0}}, 1'b1, {3{fillchar}}};
               ((29 + offset) % 32):
                 data_out = {{29{1'b0}}, 1'b1, {2{fillchar}}};
               ((30 + offset) % 32):
                 data_out = {{30{1'b0}}, 1'b1, {1{fillchar}}};
               ((31 + offset) % 32):
                 data_out = {{31{1'b0}}, 1'b1};
               default:
                 data_out = {32{1'bx}};
             endcase
          end
      else if(num_ports == 33)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 33):
                 data_out = {1'b1, {32{fillchar}}};
               ((1 + offset) % 33):
                 data_out = {{1{1'b0}}, 1'b1, {31{fillchar}}};
               ((2 + offset) % 33):
                 data_out = {{2{1'b0}}, 1'b1, {30{fillchar}}};
               ((3 + offset) % 33):
                 data_out = {{3{1'b0}}, 1'b1, {29{fillchar}}};
               ((4 + offset) % 33):
                 data_out = {{4{1'b0}}, 1'b1, {28{fillchar}}};
               ((5 + offset) % 33):
                 data_out = {{5{1'b0}}, 1'b1, {27{fillchar}}};
               ((6 + offset) % 33):
                 data_out = {{6{1'b0}}, 1'b1, {26{fillchar}}};
               ((7 + offset) % 33):
                 data_out = {{7{1'b0}}, 1'b1, {25{fillchar}}};
               ((8 + offset) % 33):
                 data_out = {{8{1'b0}}, 1'b1, {24{fillchar}}};
               ((9 + offset) % 33):
                 data_out = {{9{1'b0}}, 1'b1, {23{fillchar}}};
               ((10 + offset) % 33):
                 data_out = {{10{1'b0}}, 1'b1, {22{fillchar}}};
               ((11 + offset) % 33):
                 data_out = {{11{1'b0}}, 1'b1, {21{fillchar}}};
               ((12 + offset) % 33):
                 data_out = {{12{1'b0}}, 1'b1, {20{fillchar}}};
               ((13 + offset) % 33):
                 data_out = {{13{1'b0}}, 1'b1, {19{fillchar}}};
               ((14 + offset) % 33):
                 data_out = {{14{1'b0}}, 1'b1, {18{fillchar}}};
               ((15 + offset) % 33):
                 data_out = {{15{1'b0}}, 1'b1, {17{fillchar}}};
               ((16 + offset) % 33):
                 data_out = {{16{1'b0}}, 1'b1, {16{fillchar}}};
               ((17 + offset) % 33):
                 data_out = {{17{1'b0}}, 1'b1, {15{fillchar}}};
               ((18 + offset) % 33):
                 data_out = {{18{1'b0}}, 1'b1, {14{fillchar}}};
               ((19 + offset) % 33):
                 data_out = {{19{1'b0}}, 1'b1, {13{fillchar}}};
               ((20 + offset) % 33):
                 data_out = {{20{1'b0}}, 1'b1, {12{fillchar}}};
               ((21 + offset) % 33):
                 data_out = {{21{1'b0}}, 1'b1, {11{fillchar}}};
               ((22 + offset) % 33):
                 data_out = {{22{1'b0}}, 1'b1, {10{fillchar}}};
               ((23 + offset) % 33):
                 data_out = {{23{1'b0}}, 1'b1, {9{fillchar}}};
               ((24 + offset) % 33):
                 data_out = {{24{1'b0}}, 1'b1, {8{fillchar}}};
               ((25 + offset) % 33):
                 data_out = {{25{1'b0}}, 1'b1, {7{fillchar}}};
               ((26 + offset) % 33):
                 data_out = {{26{1'b0}}, 1'b1, {6{fillchar}}};
               ((27 + offset) % 33):
                 data_out = {{27{1'b0}}, 1'b1, {5{fillchar}}};
               ((28 + offset) % 33):
                 data_out = {{28{1'b0}}, 1'b1, {4{fillchar}}};
               ((29 + offset) % 33):
                 data_out = {{29{1'b0}}, 1'b1, {3{fillchar}}};
               ((30 + offset) % 33):
                 data_out = {{30{1'b0}}, 1'b1, {2{fillchar}}};
               ((31 + offset) % 33):
                 data_out = {{31{1'b0}}, 1'b1, {1{fillchar}}};
               ((32 + offset) % 33):
                 data_out = {{32{1'b0}}, 1'b1};
               default:
                 data_out = {33{1'bx}};
             endcase
          end
      else if(num_ports == 34)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 34):
                 data_out = {1'b1, {33{fillchar}}};
               ((1 + offset) % 34):
                 data_out = {{1{1'b0}}, 1'b1, {32{fillchar}}};
               ((2 + offset) % 34):
                 data_out = {{2{1'b0}}, 1'b1, {31{fillchar}}};
               ((3 + offset) % 34):
                 data_out = {{3{1'b0}}, 1'b1, {30{fillchar}}};
               ((4 + offset) % 34):
                 data_out = {{4{1'b0}}, 1'b1, {29{fillchar}}};
               ((5 + offset) % 34):
                 data_out = {{5{1'b0}}, 1'b1, {28{fillchar}}};
               ((6 + offset) % 34):
                 data_out = {{6{1'b0}}, 1'b1, {27{fillchar}}};
               ((7 + offset) % 34):
                 data_out = {{7{1'b0}}, 1'b1, {26{fillchar}}};
               ((8 + offset) % 34):
                 data_out = {{8{1'b0}}, 1'b1, {25{fillchar}}};
               ((9 + offset) % 34):
                 data_out = {{9{1'b0}}, 1'b1, {24{fillchar}}};
               ((10 + offset) % 34):
                 data_out = {{10{1'b0}}, 1'b1, {23{fillchar}}};
               ((11 + offset) % 34):
                 data_out = {{11{1'b0}}, 1'b1, {22{fillchar}}};
               ((12 + offset) % 34):
                 data_out = {{12{1'b0}}, 1'b1, {21{fillchar}}};
               ((13 + offset) % 34):
                 data_out = {{13{1'b0}}, 1'b1, {20{fillchar}}};
               ((14 + offset) % 34):
                 data_out = {{14{1'b0}}, 1'b1, {19{fillchar}}};
               ((15 + offset) % 34):
                 data_out = {{15{1'b0}}, 1'b1, {18{fillchar}}};
               ((16 + offset) % 34):
                 data_out = {{16{1'b0}}, 1'b1, {17{fillchar}}};
               ((17 + offset) % 34):
                 data_out = {{17{1'b0}}, 1'b1, {16{fillchar}}};
               ((18 + offset) % 34):
                 data_out = {{18{1'b0}}, 1'b1, {15{fillchar}}};
               ((19 + offset) % 34):
                 data_out = {{19{1'b0}}, 1'b1, {14{fillchar}}};
               ((20 + offset) % 34):
                 data_out = {{20{1'b0}}, 1'b1, {13{fillchar}}};
               ((21 + offset) % 34):
                 data_out = {{21{1'b0}}, 1'b1, {12{fillchar}}};
               ((22 + offset) % 34):
                 data_out = {{22{1'b0}}, 1'b1, {11{fillchar}}};
               ((23 + offset) % 34):
                 data_out = {{23{1'b0}}, 1'b1, {10{fillchar}}};
               ((24 + offset) % 34):
                 data_out = {{24{1'b0}}, 1'b1, {9{fillchar}}};
               ((25 + offset) % 34):
                 data_out = {{25{1'b0}}, 1'b1, {8{fillchar}}};
               ((26 + offset) % 34):
                 data_out = {{26{1'b0}}, 1'b1, {7{fillchar}}};
               ((27 + offset) % 34):
                 data_out = {{27{1'b0}}, 1'b1, {6{fillchar}}};
               ((28 + offset) % 34):
                 data_out = {{28{1'b0}}, 1'b1, {5{fillchar}}};
               ((29 + offset) % 34):
                 data_out = {{29{1'b0}}, 1'b1, {4{fillchar}}};
               ((30 + offset) % 34):
                 data_out = {{30{1'b0}}, 1'b1, {3{fillchar}}};
               ((31 + offset) % 34):
                 data_out = {{31{1'b0}}, 1'b1, {2{fillchar}}};
               ((32 + offset) % 34):
                 data_out = {{32{1'b0}}, 1'b1, {1{fillchar}}};
               ((33 + offset) % 34):
                 data_out = {{33{1'b0}}, 1'b1};
               default:
                 data_out = {34{1'bx}};
             endcase
          end
      else if(num_ports == 35)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 35):
                 data_out = {1'b1, {34{fillchar}}};
               ((1 + offset) % 35):
                 data_out = {{1{1'b0}}, 1'b1, {33{fillchar}}};
               ((2 + offset) % 35):
                 data_out = {{2{1'b0}}, 1'b1, {32{fillchar}}};
               ((3 + offset) % 35):
                 data_out = {{3{1'b0}}, 1'b1, {31{fillchar}}};
               ((4 + offset) % 35):
                 data_out = {{4{1'b0}}, 1'b1, {30{fillchar}}};
               ((5 + offset) % 35):
                 data_out = {{5{1'b0}}, 1'b1, {29{fillchar}}};
               ((6 + offset) % 35):
                 data_out = {{6{1'b0}}, 1'b1, {28{fillchar}}};
               ((7 + offset) % 35):
                 data_out = {{7{1'b0}}, 1'b1, {27{fillchar}}};
               ((8 + offset) % 35):
                 data_out = {{8{1'b0}}, 1'b1, {26{fillchar}}};
               ((9 + offset) % 35):
                 data_out = {{9{1'b0}}, 1'b1, {25{fillchar}}};
               ((10 + offset) % 35):
                 data_out = {{10{1'b0}}, 1'b1, {24{fillchar}}};
               ((11 + offset) % 35):
                 data_out = {{11{1'b0}}, 1'b1, {23{fillchar}}};
               ((12 + offset) % 35):
                 data_out = {{12{1'b0}}, 1'b1, {22{fillchar}}};
               ((13 + offset) % 35):
                 data_out = {{13{1'b0}}, 1'b1, {21{fillchar}}};
               ((14 + offset) % 35):
                 data_out = {{14{1'b0}}, 1'b1, {20{fillchar}}};
               ((15 + offset) % 35):
                 data_out = {{15{1'b0}}, 1'b1, {19{fillchar}}};
               ((16 + offset) % 35):
                 data_out = {{16{1'b0}}, 1'b1, {18{fillchar}}};
               ((17 + offset) % 35):
                 data_out = {{17{1'b0}}, 1'b1, {17{fillchar}}};
               ((18 + offset) % 35):
                 data_out = {{18{1'b0}}, 1'b1, {16{fillchar}}};
               ((19 + offset) % 35):
                 data_out = {{19{1'b0}}, 1'b1, {15{fillchar}}};
               ((20 + offset) % 35):
                 data_out = {{20{1'b0}}, 1'b1, {14{fillchar}}};
               ((21 + offset) % 35):
                 data_out = {{21{1'b0}}, 1'b1, {13{fillchar}}};
               ((22 + offset) % 35):
                 data_out = {{22{1'b0}}, 1'b1, {12{fillchar}}};
               ((23 + offset) % 35):
                 data_out = {{23{1'b0}}, 1'b1, {11{fillchar}}};
               ((24 + offset) % 35):
                 data_out = {{24{1'b0}}, 1'b1, {10{fillchar}}};
               ((25 + offset) % 35):
                 data_out = {{25{1'b0}}, 1'b1, {9{fillchar}}};
               ((26 + offset) % 35):
                 data_out = {{26{1'b0}}, 1'b1, {8{fillchar}}};
               ((27 + offset) % 35):
                 data_out = {{27{1'b0}}, 1'b1, {7{fillchar}}};
               ((28 + offset) % 35):
                 data_out = {{28{1'b0}}, 1'b1, {6{fillchar}}};
               ((29 + offset) % 35):
                 data_out = {{29{1'b0}}, 1'b1, {5{fillchar}}};
               ((30 + offset) % 35):
                 data_out = {{30{1'b0}}, 1'b1, {4{fillchar}}};
               ((31 + offset) % 35):
                 data_out = {{31{1'b0}}, 1'b1, {3{fillchar}}};
               ((32 + offset) % 35):
                 data_out = {{32{1'b0}}, 1'b1, {2{fillchar}}};
               ((33 + offset) % 35):
                 data_out = {{33{1'b0}}, 1'b1, {1{fillchar}}};
               ((34 + offset) % 35):
                 data_out = {{34{1'b0}}, 1'b1};
               default:
                 data_out = {35{1'bx}};
             endcase
          end
      else if(num_ports == 36)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 36):
                 data_out = {1'b1, {35{fillchar}}};
               ((1 + offset) % 36):
                 data_out = {{1{1'b0}}, 1'b1, {34{fillchar}}};
               ((2 + offset) % 36):
                 data_out = {{2{1'b0}}, 1'b1, {33{fillchar}}};
               ((3 + offset) % 36):
                 data_out = {{3{1'b0}}, 1'b1, {32{fillchar}}};
               ((4 + offset) % 36):
                 data_out = {{4{1'b0}}, 1'b1, {31{fillchar}}};
               ((5 + offset) % 36):
                 data_out = {{5{1'b0}}, 1'b1, {30{fillchar}}};
               ((6 + offset) % 36):
                 data_out = {{6{1'b0}}, 1'b1, {29{fillchar}}};
               ((7 + offset) % 36):
                 data_out = {{7{1'b0}}, 1'b1, {28{fillchar}}};
               ((8 + offset) % 36):
                 data_out = {{8{1'b0}}, 1'b1, {27{fillchar}}};
               ((9 + offset) % 36):
                 data_out = {{9{1'b0}}, 1'b1, {26{fillchar}}};
               ((10 + offset) % 36):
                 data_out = {{10{1'b0}}, 1'b1, {25{fillchar}}};
               ((11 + offset) % 36):
                 data_out = {{11{1'b0}}, 1'b1, {24{fillchar}}};
               ((12 + offset) % 36):
                 data_out = {{12{1'b0}}, 1'b1, {23{fillchar}}};
               ((13 + offset) % 36):
                 data_out = {{13{1'b0}}, 1'b1, {22{fillchar}}};
               ((14 + offset) % 36):
                 data_out = {{14{1'b0}}, 1'b1, {21{fillchar}}};
               ((15 + offset) % 36):
                 data_out = {{15{1'b0}}, 1'b1, {20{fillchar}}};
               ((16 + offset) % 36):
                 data_out = {{16{1'b0}}, 1'b1, {19{fillchar}}};
               ((17 + offset) % 36):
                 data_out = {{17{1'b0}}, 1'b1, {18{fillchar}}};
               ((18 + offset) % 36):
                 data_out = {{18{1'b0}}, 1'b1, {17{fillchar}}};
               ((19 + offset) % 36):
                 data_out = {{19{1'b0}}, 1'b1, {16{fillchar}}};
               ((20 + offset) % 36):
                 data_out = {{20{1'b0}}, 1'b1, {15{fillchar}}};
               ((21 + offset) % 36):
                 data_out = {{21{1'b0}}, 1'b1, {14{fillchar}}};
               ((22 + offset) % 36):
                 data_out = {{22{1'b0}}, 1'b1, {13{fillchar}}};
               ((23 + offset) % 36):
                 data_out = {{23{1'b0}}, 1'b1, {12{fillchar}}};
               ((24 + offset) % 36):
                 data_out = {{24{1'b0}}, 1'b1, {11{fillchar}}};
               ((25 + offset) % 36):
                 data_out = {{25{1'b0}}, 1'b1, {10{fillchar}}};
               ((26 + offset) % 36):
                 data_out = {{26{1'b0}}, 1'b1, {9{fillchar}}};
               ((27 + offset) % 36):
                 data_out = {{27{1'b0}}, 1'b1, {8{fillchar}}};
               ((28 + offset) % 36):
                 data_out = {{28{1'b0}}, 1'b1, {7{fillchar}}};
               ((29 + offset) % 36):
                 data_out = {{29{1'b0}}, 1'b1, {6{fillchar}}};
               ((30 + offset) % 36):
                 data_out = {{30{1'b0}}, 1'b1, {5{fillchar}}};
               ((31 + offset) % 36):
                 data_out = {{31{1'b0}}, 1'b1, {4{fillchar}}};
               ((32 + offset) % 36):
                 data_out = {{32{1'b0}}, 1'b1, {3{fillchar}}};
               ((33 + offset) % 36):
                 data_out = {{33{1'b0}}, 1'b1, {2{fillchar}}};
               ((34 + offset) % 36):
                 data_out = {{34{1'b0}}, 1'b1, {1{fillchar}}};
               ((35 + offset) % 36):
                 data_out = {{35{1'b0}}, 1'b1};
               default:
                 data_out = {36{1'bx}};
             endcase
          end
      else if(num_ports == 37)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 37):
                 data_out = {1'b1, {36{fillchar}}};
               ((1 + offset) % 37):
                 data_out = {{1{1'b0}}, 1'b1, {35{fillchar}}};
               ((2 + offset) % 37):
                 data_out = {{2{1'b0}}, 1'b1, {34{fillchar}}};
               ((3 + offset) % 37):
                 data_out = {{3{1'b0}}, 1'b1, {33{fillchar}}};
               ((4 + offset) % 37):
                 data_out = {{4{1'b0}}, 1'b1, {32{fillchar}}};
               ((5 + offset) % 37):
                 data_out = {{5{1'b0}}, 1'b1, {31{fillchar}}};
               ((6 + offset) % 37):
                 data_out = {{6{1'b0}}, 1'b1, {30{fillchar}}};
               ((7 + offset) % 37):
                 data_out = {{7{1'b0}}, 1'b1, {29{fillchar}}};
               ((8 + offset) % 37):
                 data_out = {{8{1'b0}}, 1'b1, {28{fillchar}}};
               ((9 + offset) % 37):
                 data_out = {{9{1'b0}}, 1'b1, {27{fillchar}}};
               ((10 + offset) % 37):
                 data_out = {{10{1'b0}}, 1'b1, {26{fillchar}}};
               ((11 + offset) % 37):
                 data_out = {{11{1'b0}}, 1'b1, {25{fillchar}}};
               ((12 + offset) % 37):
                 data_out = {{12{1'b0}}, 1'b1, {24{fillchar}}};
               ((13 + offset) % 37):
                 data_out = {{13{1'b0}}, 1'b1, {23{fillchar}}};
               ((14 + offset) % 37):
                 data_out = {{14{1'b0}}, 1'b1, {22{fillchar}}};
               ((15 + offset) % 37):
                 data_out = {{15{1'b0}}, 1'b1, {21{fillchar}}};
               ((16 + offset) % 37):
                 data_out = {{16{1'b0}}, 1'b1, {20{fillchar}}};
               ((17 + offset) % 37):
                 data_out = {{17{1'b0}}, 1'b1, {19{fillchar}}};
               ((18 + offset) % 37):
                 data_out = {{18{1'b0}}, 1'b1, {18{fillchar}}};
               ((19 + offset) % 37):
                 data_out = {{19{1'b0}}, 1'b1, {17{fillchar}}};
               ((20 + offset) % 37):
                 data_out = {{20{1'b0}}, 1'b1, {16{fillchar}}};
               ((21 + offset) % 37):
                 data_out = {{21{1'b0}}, 1'b1, {15{fillchar}}};
               ((22 + offset) % 37):
                 data_out = {{22{1'b0}}, 1'b1, {14{fillchar}}};
               ((23 + offset) % 37):
                 data_out = {{23{1'b0}}, 1'b1, {13{fillchar}}};
               ((24 + offset) % 37):
                 data_out = {{24{1'b0}}, 1'b1, {12{fillchar}}};
               ((25 + offset) % 37):
                 data_out = {{25{1'b0}}, 1'b1, {11{fillchar}}};
               ((26 + offset) % 37):
                 data_out = {{26{1'b0}}, 1'b1, {10{fillchar}}};
               ((27 + offset) % 37):
                 data_out = {{27{1'b0}}, 1'b1, {9{fillchar}}};
               ((28 + offset) % 37):
                 data_out = {{28{1'b0}}, 1'b1, {8{fillchar}}};
               ((29 + offset) % 37):
                 data_out = {{29{1'b0}}, 1'b1, {7{fillchar}}};
               ((30 + offset) % 37):
                 data_out = {{30{1'b0}}, 1'b1, {6{fillchar}}};
               ((31 + offset) % 37):
                 data_out = {{31{1'b0}}, 1'b1, {5{fillchar}}};
               ((32 + offset) % 37):
                 data_out = {{32{1'b0}}, 1'b1, {4{fillchar}}};
               ((33 + offset) % 37):
                 data_out = {{33{1'b0}}, 1'b1, {3{fillchar}}};
               ((34 + offset) % 37):
                 data_out = {{34{1'b0}}, 1'b1, {2{fillchar}}};
               ((35 + offset) % 37):
                 data_out = {{35{1'b0}}, 1'b1, {1{fillchar}}};
               ((36 + offset) % 37):
                 data_out = {{36{1'b0}}, 1'b1};
               default:
                 data_out = {37{1'bx}};
             endcase
          end
      else if(num_ports == 38)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 38):
                 data_out = {1'b1, {37{fillchar}}};
               ((1 + offset) % 38):
                 data_out = {{1{1'b0}}, 1'b1, {36{fillchar}}};
               ((2 + offset) % 38):
                 data_out = {{2{1'b0}}, 1'b1, {35{fillchar}}};
               ((3 + offset) % 38):
                 data_out = {{3{1'b0}}, 1'b1, {34{fillchar}}};
               ((4 + offset) % 38):
                 data_out = {{4{1'b0}}, 1'b1, {33{fillchar}}};
               ((5 + offset) % 38):
                 data_out = {{5{1'b0}}, 1'b1, {32{fillchar}}};
               ((6 + offset) % 38):
                 data_out = {{6{1'b0}}, 1'b1, {31{fillchar}}};
               ((7 + offset) % 38):
                 data_out = {{7{1'b0}}, 1'b1, {30{fillchar}}};
               ((8 + offset) % 38):
                 data_out = {{8{1'b0}}, 1'b1, {29{fillchar}}};
               ((9 + offset) % 38):
                 data_out = {{9{1'b0}}, 1'b1, {28{fillchar}}};
               ((10 + offset) % 38):
                 data_out = {{10{1'b0}}, 1'b1, {27{fillchar}}};
               ((11 + offset) % 38):
                 data_out = {{11{1'b0}}, 1'b1, {26{fillchar}}};
               ((12 + offset) % 38):
                 data_out = {{12{1'b0}}, 1'b1, {25{fillchar}}};
               ((13 + offset) % 38):
                 data_out = {{13{1'b0}}, 1'b1, {24{fillchar}}};
               ((14 + offset) % 38):
                 data_out = {{14{1'b0}}, 1'b1, {23{fillchar}}};
               ((15 + offset) % 38):
                 data_out = {{15{1'b0}}, 1'b1, {22{fillchar}}};
               ((16 + offset) % 38):
                 data_out = {{16{1'b0}}, 1'b1, {21{fillchar}}};
               ((17 + offset) % 38):
                 data_out = {{17{1'b0}}, 1'b1, {20{fillchar}}};
               ((18 + offset) % 38):
                 data_out = {{18{1'b0}}, 1'b1, {19{fillchar}}};
               ((19 + offset) % 38):
                 data_out = {{19{1'b0}}, 1'b1, {18{fillchar}}};
               ((20 + offset) % 38):
                 data_out = {{20{1'b0}}, 1'b1, {17{fillchar}}};
               ((21 + offset) % 38):
                 data_out = {{21{1'b0}}, 1'b1, {16{fillchar}}};
               ((22 + offset) % 38):
                 data_out = {{22{1'b0}}, 1'b1, {15{fillchar}}};
               ((23 + offset) % 38):
                 data_out = {{23{1'b0}}, 1'b1, {14{fillchar}}};
               ((24 + offset) % 38):
                 data_out = {{24{1'b0}}, 1'b1, {13{fillchar}}};
               ((25 + offset) % 38):
                 data_out = {{25{1'b0}}, 1'b1, {12{fillchar}}};
               ((26 + offset) % 38):
                 data_out = {{26{1'b0}}, 1'b1, {11{fillchar}}};
               ((27 + offset) % 38):
                 data_out = {{27{1'b0}}, 1'b1, {10{fillchar}}};
               ((28 + offset) % 38):
                 data_out = {{28{1'b0}}, 1'b1, {9{fillchar}}};
               ((29 + offset) % 38):
                 data_out = {{29{1'b0}}, 1'b1, {8{fillchar}}};
               ((30 + offset) % 38):
                 data_out = {{30{1'b0}}, 1'b1, {7{fillchar}}};
               ((31 + offset) % 38):
                 data_out = {{31{1'b0}}, 1'b1, {6{fillchar}}};
               ((32 + offset) % 38):
                 data_out = {{32{1'b0}}, 1'b1, {5{fillchar}}};
               ((33 + offset) % 38):
                 data_out = {{33{1'b0}}, 1'b1, {4{fillchar}}};
               ((34 + offset) % 38):
                 data_out = {{34{1'b0}}, 1'b1, {3{fillchar}}};
               ((35 + offset) % 38):
                 data_out = {{35{1'b0}}, 1'b1, {2{fillchar}}};
               ((36 + offset) % 38):
                 data_out = {{36{1'b0}}, 1'b1, {1{fillchar}}};
               ((37 + offset) % 38):
                 data_out = {{37{1'b0}}, 1'b1};
               default:
                 data_out = {38{1'bx}};
             endcase
          end
      else if(num_ports == 39)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 39):
                 data_out = {1'b1, {38{fillchar}}};
               ((1 + offset) % 39):
                 data_out = {{1{1'b0}}, 1'b1, {37{fillchar}}};
               ((2 + offset) % 39):
                 data_out = {{2{1'b0}}, 1'b1, {36{fillchar}}};
               ((3 + offset) % 39):
                 data_out = {{3{1'b0}}, 1'b1, {35{fillchar}}};
               ((4 + offset) % 39):
                 data_out = {{4{1'b0}}, 1'b1, {34{fillchar}}};
               ((5 + offset) % 39):
                 data_out = {{5{1'b0}}, 1'b1, {33{fillchar}}};
               ((6 + offset) % 39):
                 data_out = {{6{1'b0}}, 1'b1, {32{fillchar}}};
               ((7 + offset) % 39):
                 data_out = {{7{1'b0}}, 1'b1, {31{fillchar}}};
               ((8 + offset) % 39):
                 data_out = {{8{1'b0}}, 1'b1, {30{fillchar}}};
               ((9 + offset) % 39):
                 data_out = {{9{1'b0}}, 1'b1, {29{fillchar}}};
               ((10 + offset) % 39):
                 data_out = {{10{1'b0}}, 1'b1, {28{fillchar}}};
               ((11 + offset) % 39):
                 data_out = {{11{1'b0}}, 1'b1, {27{fillchar}}};
               ((12 + offset) % 39):
                 data_out = {{12{1'b0}}, 1'b1, {26{fillchar}}};
               ((13 + offset) % 39):
                 data_out = {{13{1'b0}}, 1'b1, {25{fillchar}}};
               ((14 + offset) % 39):
                 data_out = {{14{1'b0}}, 1'b1, {24{fillchar}}};
               ((15 + offset) % 39):
                 data_out = {{15{1'b0}}, 1'b1, {23{fillchar}}};
               ((16 + offset) % 39):
                 data_out = {{16{1'b0}}, 1'b1, {22{fillchar}}};
               ((17 + offset) % 39):
                 data_out = {{17{1'b0}}, 1'b1, {21{fillchar}}};
               ((18 + offset) % 39):
                 data_out = {{18{1'b0}}, 1'b1, {20{fillchar}}};
               ((19 + offset) % 39):
                 data_out = {{19{1'b0}}, 1'b1, {19{fillchar}}};
               ((20 + offset) % 39):
                 data_out = {{20{1'b0}}, 1'b1, {18{fillchar}}};
               ((21 + offset) % 39):
                 data_out = {{21{1'b0}}, 1'b1, {17{fillchar}}};
               ((22 + offset) % 39):
                 data_out = {{22{1'b0}}, 1'b1, {16{fillchar}}};
               ((23 + offset) % 39):
                 data_out = {{23{1'b0}}, 1'b1, {15{fillchar}}};
               ((24 + offset) % 39):
                 data_out = {{24{1'b0}}, 1'b1, {14{fillchar}}};
               ((25 + offset) % 39):
                 data_out = {{25{1'b0}}, 1'b1, {13{fillchar}}};
               ((26 + offset) % 39):
                 data_out = {{26{1'b0}}, 1'b1, {12{fillchar}}};
               ((27 + offset) % 39):
                 data_out = {{27{1'b0}}, 1'b1, {11{fillchar}}};
               ((28 + offset) % 39):
                 data_out = {{28{1'b0}}, 1'b1, {10{fillchar}}};
               ((29 + offset) % 39):
                 data_out = {{29{1'b0}}, 1'b1, {9{fillchar}}};
               ((30 + offset) % 39):
                 data_out = {{30{1'b0}}, 1'b1, {8{fillchar}}};
               ((31 + offset) % 39):
                 data_out = {{31{1'b0}}, 1'b1, {7{fillchar}}};
               ((32 + offset) % 39):
                 data_out = {{32{1'b0}}, 1'b1, {6{fillchar}}};
               ((33 + offset) % 39):
                 data_out = {{33{1'b0}}, 1'b1, {5{fillchar}}};
               ((34 + offset) % 39):
                 data_out = {{34{1'b0}}, 1'b1, {4{fillchar}}};
               ((35 + offset) % 39):
                 data_out = {{35{1'b0}}, 1'b1, {3{fillchar}}};
               ((36 + offset) % 39):
                 data_out = {{36{1'b0}}, 1'b1, {2{fillchar}}};
               ((37 + offset) % 39):
                 data_out = {{37{1'b0}}, 1'b1, {1{fillchar}}};
               ((38 + offset) % 39):
                 data_out = {{38{1'b0}}, 1'b1};
               default:
                 data_out = {39{1'bx}};
             endcase
          end
      else if(num_ports == 40)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 40):
                 data_out = {1'b1, {39{fillchar}}};
               ((1 + offset) % 40):
                 data_out = {{1{1'b0}}, 1'b1, {38{fillchar}}};
               ((2 + offset) % 40):
                 data_out = {{2{1'b0}}, 1'b1, {37{fillchar}}};
               ((3 + offset) % 40):
                 data_out = {{3{1'b0}}, 1'b1, {36{fillchar}}};
               ((4 + offset) % 40):
                 data_out = {{4{1'b0}}, 1'b1, {35{fillchar}}};
               ((5 + offset) % 40):
                 data_out = {{5{1'b0}}, 1'b1, {34{fillchar}}};
               ((6 + offset) % 40):
                 data_out = {{6{1'b0}}, 1'b1, {33{fillchar}}};
               ((7 + offset) % 40):
                 data_out = {{7{1'b0}}, 1'b1, {32{fillchar}}};
               ((8 + offset) % 40):
                 data_out = {{8{1'b0}}, 1'b1, {31{fillchar}}};
               ((9 + offset) % 40):
                 data_out = {{9{1'b0}}, 1'b1, {30{fillchar}}};
               ((10 + offset) % 40):
                 data_out = {{10{1'b0}}, 1'b1, {29{fillchar}}};
               ((11 + offset) % 40):
                 data_out = {{11{1'b0}}, 1'b1, {28{fillchar}}};
               ((12 + offset) % 40):
                 data_out = {{12{1'b0}}, 1'b1, {27{fillchar}}};
               ((13 + offset) % 40):
                 data_out = {{13{1'b0}}, 1'b1, {26{fillchar}}};
               ((14 + offset) % 40):
                 data_out = {{14{1'b0}}, 1'b1, {25{fillchar}}};
               ((15 + offset) % 40):
                 data_out = {{15{1'b0}}, 1'b1, {24{fillchar}}};
               ((16 + offset) % 40):
                 data_out = {{16{1'b0}}, 1'b1, {23{fillchar}}};
               ((17 + offset) % 40):
                 data_out = {{17{1'b0}}, 1'b1, {22{fillchar}}};
               ((18 + offset) % 40):
                 data_out = {{18{1'b0}}, 1'b1, {21{fillchar}}};
               ((19 + offset) % 40):
                 data_out = {{19{1'b0}}, 1'b1, {20{fillchar}}};
               ((20 + offset) % 40):
                 data_out = {{20{1'b0}}, 1'b1, {19{fillchar}}};
               ((21 + offset) % 40):
                 data_out = {{21{1'b0}}, 1'b1, {18{fillchar}}};
               ((22 + offset) % 40):
                 data_out = {{22{1'b0}}, 1'b1, {17{fillchar}}};
               ((23 + offset) % 40):
                 data_out = {{23{1'b0}}, 1'b1, {16{fillchar}}};
               ((24 + offset) % 40):
                 data_out = {{24{1'b0}}, 1'b1, {15{fillchar}}};
               ((25 + offset) % 40):
                 data_out = {{25{1'b0}}, 1'b1, {14{fillchar}}};
               ((26 + offset) % 40):
                 data_out = {{26{1'b0}}, 1'b1, {13{fillchar}}};
               ((27 + offset) % 40):
                 data_out = {{27{1'b0}}, 1'b1, {12{fillchar}}};
               ((28 + offset) % 40):
                 data_out = {{28{1'b0}}, 1'b1, {11{fillchar}}};
               ((29 + offset) % 40):
                 data_out = {{29{1'b0}}, 1'b1, {10{fillchar}}};
               ((30 + offset) % 40):
                 data_out = {{30{1'b0}}, 1'b1, {9{fillchar}}};
               ((31 + offset) % 40):
                 data_out = {{31{1'b0}}, 1'b1, {8{fillchar}}};
               ((32 + offset) % 40):
                 data_out = {{32{1'b0}}, 1'b1, {7{fillchar}}};
               ((33 + offset) % 40):
                 data_out = {{33{1'b0}}, 1'b1, {6{fillchar}}};
               ((34 + offset) % 40):
                 data_out = {{34{1'b0}}, 1'b1, {5{fillchar}}};
               ((35 + offset) % 40):
                 data_out = {{35{1'b0}}, 1'b1, {4{fillchar}}};
               ((36 + offset) % 40):
                 data_out = {{36{1'b0}}, 1'b1, {3{fillchar}}};
               ((37 + offset) % 40):
                 data_out = {{37{1'b0}}, 1'b1, {2{fillchar}}};
               ((38 + offset) % 40):
                 data_out = {{38{1'b0}}, 1'b1, {1{fillchar}}};
               ((39 + offset) % 40):
                 data_out = {{39{1'b0}}, 1'b1};
               default:
                 data_out = {40{1'bx}};
             endcase
          end
      else if(num_ports == 41)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 41):
                 data_out = {1'b1, {40{fillchar}}};
               ((1 + offset) % 41):
                 data_out = {{1{1'b0}}, 1'b1, {39{fillchar}}};
               ((2 + offset) % 41):
                 data_out = {{2{1'b0}}, 1'b1, {38{fillchar}}};
               ((3 + offset) % 41):
                 data_out = {{3{1'b0}}, 1'b1, {37{fillchar}}};
               ((4 + offset) % 41):
                 data_out = {{4{1'b0}}, 1'b1, {36{fillchar}}};
               ((5 + offset) % 41):
                 data_out = {{5{1'b0}}, 1'b1, {35{fillchar}}};
               ((6 + offset) % 41):
                 data_out = {{6{1'b0}}, 1'b1, {34{fillchar}}};
               ((7 + offset) % 41):
                 data_out = {{7{1'b0}}, 1'b1, {33{fillchar}}};
               ((8 + offset) % 41):
                 data_out = {{8{1'b0}}, 1'b1, {32{fillchar}}};
               ((9 + offset) % 41):
                 data_out = {{9{1'b0}}, 1'b1, {31{fillchar}}};
               ((10 + offset) % 41):
                 data_out = {{10{1'b0}}, 1'b1, {30{fillchar}}};
               ((11 + offset) % 41):
                 data_out = {{11{1'b0}}, 1'b1, {29{fillchar}}};
               ((12 + offset) % 41):
                 data_out = {{12{1'b0}}, 1'b1, {28{fillchar}}};
               ((13 + offset) % 41):
                 data_out = {{13{1'b0}}, 1'b1, {27{fillchar}}};
               ((14 + offset) % 41):
                 data_out = {{14{1'b0}}, 1'b1, {26{fillchar}}};
               ((15 + offset) % 41):
                 data_out = {{15{1'b0}}, 1'b1, {25{fillchar}}};
               ((16 + offset) % 41):
                 data_out = {{16{1'b0}}, 1'b1, {24{fillchar}}};
               ((17 + offset) % 41):
                 data_out = {{17{1'b0}}, 1'b1, {23{fillchar}}};
               ((18 + offset) % 41):
                 data_out = {{18{1'b0}}, 1'b1, {22{fillchar}}};
               ((19 + offset) % 41):
                 data_out = {{19{1'b0}}, 1'b1, {21{fillchar}}};
               ((20 + offset) % 41):
                 data_out = {{20{1'b0}}, 1'b1, {20{fillchar}}};
               ((21 + offset) % 41):
                 data_out = {{21{1'b0}}, 1'b1, {19{fillchar}}};
               ((22 + offset) % 41):
                 data_out = {{22{1'b0}}, 1'b1, {18{fillchar}}};
               ((23 + offset) % 41):
                 data_out = {{23{1'b0}}, 1'b1, {17{fillchar}}};
               ((24 + offset) % 41):
                 data_out = {{24{1'b0}}, 1'b1, {16{fillchar}}};
               ((25 + offset) % 41):
                 data_out = {{25{1'b0}}, 1'b1, {15{fillchar}}};
               ((26 + offset) % 41):
                 data_out = {{26{1'b0}}, 1'b1, {14{fillchar}}};
               ((27 + offset) % 41):
                 data_out = {{27{1'b0}}, 1'b1, {13{fillchar}}};
               ((28 + offset) % 41):
                 data_out = {{28{1'b0}}, 1'b1, {12{fillchar}}};
               ((29 + offset) % 41):
                 data_out = {{29{1'b0}}, 1'b1, {11{fillchar}}};
               ((30 + offset) % 41):
                 data_out = {{30{1'b0}}, 1'b1, {10{fillchar}}};
               ((31 + offset) % 41):
                 data_out = {{31{1'b0}}, 1'b1, {9{fillchar}}};
               ((32 + offset) % 41):
                 data_out = {{32{1'b0}}, 1'b1, {8{fillchar}}};
               ((33 + offset) % 41):
                 data_out = {{33{1'b0}}, 1'b1, {7{fillchar}}};
               ((34 + offset) % 41):
                 data_out = {{34{1'b0}}, 1'b1, {6{fillchar}}};
               ((35 + offset) % 41):
                 data_out = {{35{1'b0}}, 1'b1, {5{fillchar}}};
               ((36 + offset) % 41):
                 data_out = {{36{1'b0}}, 1'b1, {4{fillchar}}};
               ((37 + offset) % 41):
                 data_out = {{37{1'b0}}, 1'b1, {3{fillchar}}};
               ((38 + offset) % 41):
                 data_out = {{38{1'b0}}, 1'b1, {2{fillchar}}};
               ((39 + offset) % 41):
                 data_out = {{39{1'b0}}, 1'b1, {1{fillchar}}};
               ((40 + offset) % 41):
                 data_out = {{40{1'b0}}, 1'b1};
               default:
                 data_out = {41{1'bx}};
             endcase
          end
      else if(num_ports == 42)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 42):
                 data_out = {1'b1, {41{fillchar}}};
               ((1 + offset) % 42):
                 data_out = {{1{1'b0}}, 1'b1, {40{fillchar}}};
               ((2 + offset) % 42):
                 data_out = {{2{1'b0}}, 1'b1, {39{fillchar}}};
               ((3 + offset) % 42):
                 data_out = {{3{1'b0}}, 1'b1, {38{fillchar}}};
               ((4 + offset) % 42):
                 data_out = {{4{1'b0}}, 1'b1, {37{fillchar}}};
               ((5 + offset) % 42):
                 data_out = {{5{1'b0}}, 1'b1, {36{fillchar}}};
               ((6 + offset) % 42):
                 data_out = {{6{1'b0}}, 1'b1, {35{fillchar}}};
               ((7 + offset) % 42):
                 data_out = {{7{1'b0}}, 1'b1, {34{fillchar}}};
               ((8 + offset) % 42):
                 data_out = {{8{1'b0}}, 1'b1, {33{fillchar}}};
               ((9 + offset) % 42):
                 data_out = {{9{1'b0}}, 1'b1, {32{fillchar}}};
               ((10 + offset) % 42):
                 data_out = {{10{1'b0}}, 1'b1, {31{fillchar}}};
               ((11 + offset) % 42):
                 data_out = {{11{1'b0}}, 1'b1, {30{fillchar}}};
               ((12 + offset) % 42):
                 data_out = {{12{1'b0}}, 1'b1, {29{fillchar}}};
               ((13 + offset) % 42):
                 data_out = {{13{1'b0}}, 1'b1, {28{fillchar}}};
               ((14 + offset) % 42):
                 data_out = {{14{1'b0}}, 1'b1, {27{fillchar}}};
               ((15 + offset) % 42):
                 data_out = {{15{1'b0}}, 1'b1, {26{fillchar}}};
               ((16 + offset) % 42):
                 data_out = {{16{1'b0}}, 1'b1, {25{fillchar}}};
               ((17 + offset) % 42):
                 data_out = {{17{1'b0}}, 1'b1, {24{fillchar}}};
               ((18 + offset) % 42):
                 data_out = {{18{1'b0}}, 1'b1, {23{fillchar}}};
               ((19 + offset) % 42):
                 data_out = {{19{1'b0}}, 1'b1, {22{fillchar}}};
               ((20 + offset) % 42):
                 data_out = {{20{1'b0}}, 1'b1, {21{fillchar}}};
               ((21 + offset) % 42):
                 data_out = {{21{1'b0}}, 1'b1, {20{fillchar}}};
               ((22 + offset) % 42):
                 data_out = {{22{1'b0}}, 1'b1, {19{fillchar}}};
               ((23 + offset) % 42):
                 data_out = {{23{1'b0}}, 1'b1, {18{fillchar}}};
               ((24 + offset) % 42):
                 data_out = {{24{1'b0}}, 1'b1, {17{fillchar}}};
               ((25 + offset) % 42):
                 data_out = {{25{1'b0}}, 1'b1, {16{fillchar}}};
               ((26 + offset) % 42):
                 data_out = {{26{1'b0}}, 1'b1, {15{fillchar}}};
               ((27 + offset) % 42):
                 data_out = {{27{1'b0}}, 1'b1, {14{fillchar}}};
               ((28 + offset) % 42):
                 data_out = {{28{1'b0}}, 1'b1, {13{fillchar}}};
               ((29 + offset) % 42):
                 data_out = {{29{1'b0}}, 1'b1, {12{fillchar}}};
               ((30 + offset) % 42):
                 data_out = {{30{1'b0}}, 1'b1, {11{fillchar}}};
               ((31 + offset) % 42):
                 data_out = {{31{1'b0}}, 1'b1, {10{fillchar}}};
               ((32 + offset) % 42):
                 data_out = {{32{1'b0}}, 1'b1, {9{fillchar}}};
               ((33 + offset) % 42):
                 data_out = {{33{1'b0}}, 1'b1, {8{fillchar}}};
               ((34 + offset) % 42):
                 data_out = {{34{1'b0}}, 1'b1, {7{fillchar}}};
               ((35 + offset) % 42):
                 data_out = {{35{1'b0}}, 1'b1, {6{fillchar}}};
               ((36 + offset) % 42):
                 data_out = {{36{1'b0}}, 1'b1, {5{fillchar}}};
               ((37 + offset) % 42):
                 data_out = {{37{1'b0}}, 1'b1, {4{fillchar}}};
               ((38 + offset) % 42):
                 data_out = {{38{1'b0}}, 1'b1, {3{fillchar}}};
               ((39 + offset) % 42):
                 data_out = {{39{1'b0}}, 1'b1, {2{fillchar}}};
               ((40 + offset) % 42):
                 data_out = {{40{1'b0}}, 1'b1, {1{fillchar}}};
               ((41 + offset) % 42):
                 data_out = {{41{1'b0}}, 1'b1};
               default:
                 data_out = {42{1'bx}};
             endcase
          end
      else if(num_ports == 43)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 43):
                 data_out = {1'b1, {42{fillchar}}};
               ((1 + offset) % 43):
                 data_out = {{1{1'b0}}, 1'b1, {41{fillchar}}};
               ((2 + offset) % 43):
                 data_out = {{2{1'b0}}, 1'b1, {40{fillchar}}};
               ((3 + offset) % 43):
                 data_out = {{3{1'b0}}, 1'b1, {39{fillchar}}};
               ((4 + offset) % 43):
                 data_out = {{4{1'b0}}, 1'b1, {38{fillchar}}};
               ((5 + offset) % 43):
                 data_out = {{5{1'b0}}, 1'b1, {37{fillchar}}};
               ((6 + offset) % 43):
                 data_out = {{6{1'b0}}, 1'b1, {36{fillchar}}};
               ((7 + offset) % 43):
                 data_out = {{7{1'b0}}, 1'b1, {35{fillchar}}};
               ((8 + offset) % 43):
                 data_out = {{8{1'b0}}, 1'b1, {34{fillchar}}};
               ((9 + offset) % 43):
                 data_out = {{9{1'b0}}, 1'b1, {33{fillchar}}};
               ((10 + offset) % 43):
                 data_out = {{10{1'b0}}, 1'b1, {32{fillchar}}};
               ((11 + offset) % 43):
                 data_out = {{11{1'b0}}, 1'b1, {31{fillchar}}};
               ((12 + offset) % 43):
                 data_out = {{12{1'b0}}, 1'b1, {30{fillchar}}};
               ((13 + offset) % 43):
                 data_out = {{13{1'b0}}, 1'b1, {29{fillchar}}};
               ((14 + offset) % 43):
                 data_out = {{14{1'b0}}, 1'b1, {28{fillchar}}};
               ((15 + offset) % 43):
                 data_out = {{15{1'b0}}, 1'b1, {27{fillchar}}};
               ((16 + offset) % 43):
                 data_out = {{16{1'b0}}, 1'b1, {26{fillchar}}};
               ((17 + offset) % 43):
                 data_out = {{17{1'b0}}, 1'b1, {25{fillchar}}};
               ((18 + offset) % 43):
                 data_out = {{18{1'b0}}, 1'b1, {24{fillchar}}};
               ((19 + offset) % 43):
                 data_out = {{19{1'b0}}, 1'b1, {23{fillchar}}};
               ((20 + offset) % 43):
                 data_out = {{20{1'b0}}, 1'b1, {22{fillchar}}};
               ((21 + offset) % 43):
                 data_out = {{21{1'b0}}, 1'b1, {21{fillchar}}};
               ((22 + offset) % 43):
                 data_out = {{22{1'b0}}, 1'b1, {20{fillchar}}};
               ((23 + offset) % 43):
                 data_out = {{23{1'b0}}, 1'b1, {19{fillchar}}};
               ((24 + offset) % 43):
                 data_out = {{24{1'b0}}, 1'b1, {18{fillchar}}};
               ((25 + offset) % 43):
                 data_out = {{25{1'b0}}, 1'b1, {17{fillchar}}};
               ((26 + offset) % 43):
                 data_out = {{26{1'b0}}, 1'b1, {16{fillchar}}};
               ((27 + offset) % 43):
                 data_out = {{27{1'b0}}, 1'b1, {15{fillchar}}};
               ((28 + offset) % 43):
                 data_out = {{28{1'b0}}, 1'b1, {14{fillchar}}};
               ((29 + offset) % 43):
                 data_out = {{29{1'b0}}, 1'b1, {13{fillchar}}};
               ((30 + offset) % 43):
                 data_out = {{30{1'b0}}, 1'b1, {12{fillchar}}};
               ((31 + offset) % 43):
                 data_out = {{31{1'b0}}, 1'b1, {11{fillchar}}};
               ((32 + offset) % 43):
                 data_out = {{32{1'b0}}, 1'b1, {10{fillchar}}};
               ((33 + offset) % 43):
                 data_out = {{33{1'b0}}, 1'b1, {9{fillchar}}};
               ((34 + offset) % 43):
                 data_out = {{34{1'b0}}, 1'b1, {8{fillchar}}};
               ((35 + offset) % 43):
                 data_out = {{35{1'b0}}, 1'b1, {7{fillchar}}};
               ((36 + offset) % 43):
                 data_out = {{36{1'b0}}, 1'b1, {6{fillchar}}};
               ((37 + offset) % 43):
                 data_out = {{37{1'b0}}, 1'b1, {5{fillchar}}};
               ((38 + offset) % 43):
                 data_out = {{38{1'b0}}, 1'b1, {4{fillchar}}};
               ((39 + offset) % 43):
                 data_out = {{39{1'b0}}, 1'b1, {3{fillchar}}};
               ((40 + offset) % 43):
                 data_out = {{40{1'b0}}, 1'b1, {2{fillchar}}};
               ((41 + offset) % 43):
                 data_out = {{41{1'b0}}, 1'b1, {1{fillchar}}};
               ((42 + offset) % 43):
                 data_out = {{42{1'b0}}, 1'b1};
               default:
                 data_out = {43{1'bx}};
             endcase
          end
      else if(num_ports == 44)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 44):
                 data_out = {1'b1, {43{fillchar}}};
               ((1 + offset) % 44):
                 data_out = {{1{1'b0}}, 1'b1, {42{fillchar}}};
               ((2 + offset) % 44):
                 data_out = {{2{1'b0}}, 1'b1, {41{fillchar}}};
               ((3 + offset) % 44):
                 data_out = {{3{1'b0}}, 1'b1, {40{fillchar}}};
               ((4 + offset) % 44):
                 data_out = {{4{1'b0}}, 1'b1, {39{fillchar}}};
               ((5 + offset) % 44):
                 data_out = {{5{1'b0}}, 1'b1, {38{fillchar}}};
               ((6 + offset) % 44):
                 data_out = {{6{1'b0}}, 1'b1, {37{fillchar}}};
               ((7 + offset) % 44):
                 data_out = {{7{1'b0}}, 1'b1, {36{fillchar}}};
               ((8 + offset) % 44):
                 data_out = {{8{1'b0}}, 1'b1, {35{fillchar}}};
               ((9 + offset) % 44):
                 data_out = {{9{1'b0}}, 1'b1, {34{fillchar}}};
               ((10 + offset) % 44):
                 data_out = {{10{1'b0}}, 1'b1, {33{fillchar}}};
               ((11 + offset) % 44):
                 data_out = {{11{1'b0}}, 1'b1, {32{fillchar}}};
               ((12 + offset) % 44):
                 data_out = {{12{1'b0}}, 1'b1, {31{fillchar}}};
               ((13 + offset) % 44):
                 data_out = {{13{1'b0}}, 1'b1, {30{fillchar}}};
               ((14 + offset) % 44):
                 data_out = {{14{1'b0}}, 1'b1, {29{fillchar}}};
               ((15 + offset) % 44):
                 data_out = {{15{1'b0}}, 1'b1, {28{fillchar}}};
               ((16 + offset) % 44):
                 data_out = {{16{1'b0}}, 1'b1, {27{fillchar}}};
               ((17 + offset) % 44):
                 data_out = {{17{1'b0}}, 1'b1, {26{fillchar}}};
               ((18 + offset) % 44):
                 data_out = {{18{1'b0}}, 1'b1, {25{fillchar}}};
               ((19 + offset) % 44):
                 data_out = {{19{1'b0}}, 1'b1, {24{fillchar}}};
               ((20 + offset) % 44):
                 data_out = {{20{1'b0}}, 1'b1, {23{fillchar}}};
               ((21 + offset) % 44):
                 data_out = {{21{1'b0}}, 1'b1, {22{fillchar}}};
               ((22 + offset) % 44):
                 data_out = {{22{1'b0}}, 1'b1, {21{fillchar}}};
               ((23 + offset) % 44):
                 data_out = {{23{1'b0}}, 1'b1, {20{fillchar}}};
               ((24 + offset) % 44):
                 data_out = {{24{1'b0}}, 1'b1, {19{fillchar}}};
               ((25 + offset) % 44):
                 data_out = {{25{1'b0}}, 1'b1, {18{fillchar}}};
               ((26 + offset) % 44):
                 data_out = {{26{1'b0}}, 1'b1, {17{fillchar}}};
               ((27 + offset) % 44):
                 data_out = {{27{1'b0}}, 1'b1, {16{fillchar}}};
               ((28 + offset) % 44):
                 data_out = {{28{1'b0}}, 1'b1, {15{fillchar}}};
               ((29 + offset) % 44):
                 data_out = {{29{1'b0}}, 1'b1, {14{fillchar}}};
               ((30 + offset) % 44):
                 data_out = {{30{1'b0}}, 1'b1, {13{fillchar}}};
               ((31 + offset) % 44):
                 data_out = {{31{1'b0}}, 1'b1, {12{fillchar}}};
               ((32 + offset) % 44):
                 data_out = {{32{1'b0}}, 1'b1, {11{fillchar}}};
               ((33 + offset) % 44):
                 data_out = {{33{1'b0}}, 1'b1, {10{fillchar}}};
               ((34 + offset) % 44):
                 data_out = {{34{1'b0}}, 1'b1, {9{fillchar}}};
               ((35 + offset) % 44):
                 data_out = {{35{1'b0}}, 1'b1, {8{fillchar}}};
               ((36 + offset) % 44):
                 data_out = {{36{1'b0}}, 1'b1, {7{fillchar}}};
               ((37 + offset) % 44):
                 data_out = {{37{1'b0}}, 1'b1, {6{fillchar}}};
               ((38 + offset) % 44):
                 data_out = {{38{1'b0}}, 1'b1, {5{fillchar}}};
               ((39 + offset) % 44):
                 data_out = {{39{1'b0}}, 1'b1, {4{fillchar}}};
               ((40 + offset) % 44):
                 data_out = {{40{1'b0}}, 1'b1, {3{fillchar}}};
               ((41 + offset) % 44):
                 data_out = {{41{1'b0}}, 1'b1, {2{fillchar}}};
               ((42 + offset) % 44):
                 data_out = {{42{1'b0}}, 1'b1, {1{fillchar}}};
               ((43 + offset) % 44):
                 data_out = {{43{1'b0}}, 1'b1};
               default:
                 data_out = {44{1'bx}};
             endcase
          end
      else if(num_ports == 45)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 45):
                 data_out = {1'b1, {44{fillchar}}};
               ((1 + offset) % 45):
                 data_out = {{1{1'b0}}, 1'b1, {43{fillchar}}};
               ((2 + offset) % 45):
                 data_out = {{2{1'b0}}, 1'b1, {42{fillchar}}};
               ((3 + offset) % 45):
                 data_out = {{3{1'b0}}, 1'b1, {41{fillchar}}};
               ((4 + offset) % 45):
                 data_out = {{4{1'b0}}, 1'b1, {40{fillchar}}};
               ((5 + offset) % 45):
                 data_out = {{5{1'b0}}, 1'b1, {39{fillchar}}};
               ((6 + offset) % 45):
                 data_out = {{6{1'b0}}, 1'b1, {38{fillchar}}};
               ((7 + offset) % 45):
                 data_out = {{7{1'b0}}, 1'b1, {37{fillchar}}};
               ((8 + offset) % 45):
                 data_out = {{8{1'b0}}, 1'b1, {36{fillchar}}};
               ((9 + offset) % 45):
                 data_out = {{9{1'b0}}, 1'b1, {35{fillchar}}};
               ((10 + offset) % 45):
                 data_out = {{10{1'b0}}, 1'b1, {34{fillchar}}};
               ((11 + offset) % 45):
                 data_out = {{11{1'b0}}, 1'b1, {33{fillchar}}};
               ((12 + offset) % 45):
                 data_out = {{12{1'b0}}, 1'b1, {32{fillchar}}};
               ((13 + offset) % 45):
                 data_out = {{13{1'b0}}, 1'b1, {31{fillchar}}};
               ((14 + offset) % 45):
                 data_out = {{14{1'b0}}, 1'b1, {30{fillchar}}};
               ((15 + offset) % 45):
                 data_out = {{15{1'b0}}, 1'b1, {29{fillchar}}};
               ((16 + offset) % 45):
                 data_out = {{16{1'b0}}, 1'b1, {28{fillchar}}};
               ((17 + offset) % 45):
                 data_out = {{17{1'b0}}, 1'b1, {27{fillchar}}};
               ((18 + offset) % 45):
                 data_out = {{18{1'b0}}, 1'b1, {26{fillchar}}};
               ((19 + offset) % 45):
                 data_out = {{19{1'b0}}, 1'b1, {25{fillchar}}};
               ((20 + offset) % 45):
                 data_out = {{20{1'b0}}, 1'b1, {24{fillchar}}};
               ((21 + offset) % 45):
                 data_out = {{21{1'b0}}, 1'b1, {23{fillchar}}};
               ((22 + offset) % 45):
                 data_out = {{22{1'b0}}, 1'b1, {22{fillchar}}};
               ((23 + offset) % 45):
                 data_out = {{23{1'b0}}, 1'b1, {21{fillchar}}};
               ((24 + offset) % 45):
                 data_out = {{24{1'b0}}, 1'b1, {20{fillchar}}};
               ((25 + offset) % 45):
                 data_out = {{25{1'b0}}, 1'b1, {19{fillchar}}};
               ((26 + offset) % 45):
                 data_out = {{26{1'b0}}, 1'b1, {18{fillchar}}};
               ((27 + offset) % 45):
                 data_out = {{27{1'b0}}, 1'b1, {17{fillchar}}};
               ((28 + offset) % 45):
                 data_out = {{28{1'b0}}, 1'b1, {16{fillchar}}};
               ((29 + offset) % 45):
                 data_out = {{29{1'b0}}, 1'b1, {15{fillchar}}};
               ((30 + offset) % 45):
                 data_out = {{30{1'b0}}, 1'b1, {14{fillchar}}};
               ((31 + offset) % 45):
                 data_out = {{31{1'b0}}, 1'b1, {13{fillchar}}};
               ((32 + offset) % 45):
                 data_out = {{32{1'b0}}, 1'b1, {12{fillchar}}};
               ((33 + offset) % 45):
                 data_out = {{33{1'b0}}, 1'b1, {11{fillchar}}};
               ((34 + offset) % 45):
                 data_out = {{34{1'b0}}, 1'b1, {10{fillchar}}};
               ((35 + offset) % 45):
                 data_out = {{35{1'b0}}, 1'b1, {9{fillchar}}};
               ((36 + offset) % 45):
                 data_out = {{36{1'b0}}, 1'b1, {8{fillchar}}};
               ((37 + offset) % 45):
                 data_out = {{37{1'b0}}, 1'b1, {7{fillchar}}};
               ((38 + offset) % 45):
                 data_out = {{38{1'b0}}, 1'b1, {6{fillchar}}};
               ((39 + offset) % 45):
                 data_out = {{39{1'b0}}, 1'b1, {5{fillchar}}};
               ((40 + offset) % 45):
                 data_out = {{40{1'b0}}, 1'b1, {4{fillchar}}};
               ((41 + offset) % 45):
                 data_out = {{41{1'b0}}, 1'b1, {3{fillchar}}};
               ((42 + offset) % 45):
                 data_out = {{42{1'b0}}, 1'b1, {2{fillchar}}};
               ((43 + offset) % 45):
                 data_out = {{43{1'b0}}, 1'b1, {1{fillchar}}};
               ((44 + offset) % 45):
                 data_out = {{44{1'b0}}, 1'b1};
               default:
                 data_out = {45{1'bx}};
             endcase
          end
      else if(num_ports == 46)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 46):
                 data_out = {1'b1, {45{fillchar}}};
               ((1 + offset) % 46):
                 data_out = {{1{1'b0}}, 1'b1, {44{fillchar}}};
               ((2 + offset) % 46):
                 data_out = {{2{1'b0}}, 1'b1, {43{fillchar}}};
               ((3 + offset) % 46):
                 data_out = {{3{1'b0}}, 1'b1, {42{fillchar}}};
               ((4 + offset) % 46):
                 data_out = {{4{1'b0}}, 1'b1, {41{fillchar}}};
               ((5 + offset) % 46):
                 data_out = {{5{1'b0}}, 1'b1, {40{fillchar}}};
               ((6 + offset) % 46):
                 data_out = {{6{1'b0}}, 1'b1, {39{fillchar}}};
               ((7 + offset) % 46):
                 data_out = {{7{1'b0}}, 1'b1, {38{fillchar}}};
               ((8 + offset) % 46):
                 data_out = {{8{1'b0}}, 1'b1, {37{fillchar}}};
               ((9 + offset) % 46):
                 data_out = {{9{1'b0}}, 1'b1, {36{fillchar}}};
               ((10 + offset) % 46):
                 data_out = {{10{1'b0}}, 1'b1, {35{fillchar}}};
               ((11 + offset) % 46):
                 data_out = {{11{1'b0}}, 1'b1, {34{fillchar}}};
               ((12 + offset) % 46):
                 data_out = {{12{1'b0}}, 1'b1, {33{fillchar}}};
               ((13 + offset) % 46):
                 data_out = {{13{1'b0}}, 1'b1, {32{fillchar}}};
               ((14 + offset) % 46):
                 data_out = {{14{1'b0}}, 1'b1, {31{fillchar}}};
               ((15 + offset) % 46):
                 data_out = {{15{1'b0}}, 1'b1, {30{fillchar}}};
               ((16 + offset) % 46):
                 data_out = {{16{1'b0}}, 1'b1, {29{fillchar}}};
               ((17 + offset) % 46):
                 data_out = {{17{1'b0}}, 1'b1, {28{fillchar}}};
               ((18 + offset) % 46):
                 data_out = {{18{1'b0}}, 1'b1, {27{fillchar}}};
               ((19 + offset) % 46):
                 data_out = {{19{1'b0}}, 1'b1, {26{fillchar}}};
               ((20 + offset) % 46):
                 data_out = {{20{1'b0}}, 1'b1, {25{fillchar}}};
               ((21 + offset) % 46):
                 data_out = {{21{1'b0}}, 1'b1, {24{fillchar}}};
               ((22 + offset) % 46):
                 data_out = {{22{1'b0}}, 1'b1, {23{fillchar}}};
               ((23 + offset) % 46):
                 data_out = {{23{1'b0}}, 1'b1, {22{fillchar}}};
               ((24 + offset) % 46):
                 data_out = {{24{1'b0}}, 1'b1, {21{fillchar}}};
               ((25 + offset) % 46):
                 data_out = {{25{1'b0}}, 1'b1, {20{fillchar}}};
               ((26 + offset) % 46):
                 data_out = {{26{1'b0}}, 1'b1, {19{fillchar}}};
               ((27 + offset) % 46):
                 data_out = {{27{1'b0}}, 1'b1, {18{fillchar}}};
               ((28 + offset) % 46):
                 data_out = {{28{1'b0}}, 1'b1, {17{fillchar}}};
               ((29 + offset) % 46):
                 data_out = {{29{1'b0}}, 1'b1, {16{fillchar}}};
               ((30 + offset) % 46):
                 data_out = {{30{1'b0}}, 1'b1, {15{fillchar}}};
               ((31 + offset) % 46):
                 data_out = {{31{1'b0}}, 1'b1, {14{fillchar}}};
               ((32 + offset) % 46):
                 data_out = {{32{1'b0}}, 1'b1, {13{fillchar}}};
               ((33 + offset) % 46):
                 data_out = {{33{1'b0}}, 1'b1, {12{fillchar}}};
               ((34 + offset) % 46):
                 data_out = {{34{1'b0}}, 1'b1, {11{fillchar}}};
               ((35 + offset) % 46):
                 data_out = {{35{1'b0}}, 1'b1, {10{fillchar}}};
               ((36 + offset) % 46):
                 data_out = {{36{1'b0}}, 1'b1, {9{fillchar}}};
               ((37 + offset) % 46):
                 data_out = {{37{1'b0}}, 1'b1, {8{fillchar}}};
               ((38 + offset) % 46):
                 data_out = {{38{1'b0}}, 1'b1, {7{fillchar}}};
               ((39 + offset) % 46):
                 data_out = {{39{1'b0}}, 1'b1, {6{fillchar}}};
               ((40 + offset) % 46):
                 data_out = {{40{1'b0}}, 1'b1, {5{fillchar}}};
               ((41 + offset) % 46):
                 data_out = {{41{1'b0}}, 1'b1, {4{fillchar}}};
               ((42 + offset) % 46):
                 data_out = {{42{1'b0}}, 1'b1, {3{fillchar}}};
               ((43 + offset) % 46):
                 data_out = {{43{1'b0}}, 1'b1, {2{fillchar}}};
               ((44 + offset) % 46):
                 data_out = {{44{1'b0}}, 1'b1, {1{fillchar}}};
               ((45 + offset) % 46):
                 data_out = {{45{1'b0}}, 1'b1};
               default:
                 data_out = {46{1'bx}};
             endcase
          end
      else if(num_ports == 47)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 47):
                 data_out = {1'b1, {46{fillchar}}};
               ((1 + offset) % 47):
                 data_out = {{1{1'b0}}, 1'b1, {45{fillchar}}};
               ((2 + offset) % 47):
                 data_out = {{2{1'b0}}, 1'b1, {44{fillchar}}};
               ((3 + offset) % 47):
                 data_out = {{3{1'b0}}, 1'b1, {43{fillchar}}};
               ((4 + offset) % 47):
                 data_out = {{4{1'b0}}, 1'b1, {42{fillchar}}};
               ((5 + offset) % 47):
                 data_out = {{5{1'b0}}, 1'b1, {41{fillchar}}};
               ((6 + offset) % 47):
                 data_out = {{6{1'b0}}, 1'b1, {40{fillchar}}};
               ((7 + offset) % 47):
                 data_out = {{7{1'b0}}, 1'b1, {39{fillchar}}};
               ((8 + offset) % 47):
                 data_out = {{8{1'b0}}, 1'b1, {38{fillchar}}};
               ((9 + offset) % 47):
                 data_out = {{9{1'b0}}, 1'b1, {37{fillchar}}};
               ((10 + offset) % 47):
                 data_out = {{10{1'b0}}, 1'b1, {36{fillchar}}};
               ((11 + offset) % 47):
                 data_out = {{11{1'b0}}, 1'b1, {35{fillchar}}};
               ((12 + offset) % 47):
                 data_out = {{12{1'b0}}, 1'b1, {34{fillchar}}};
               ((13 + offset) % 47):
                 data_out = {{13{1'b0}}, 1'b1, {33{fillchar}}};
               ((14 + offset) % 47):
                 data_out = {{14{1'b0}}, 1'b1, {32{fillchar}}};
               ((15 + offset) % 47):
                 data_out = {{15{1'b0}}, 1'b1, {31{fillchar}}};
               ((16 + offset) % 47):
                 data_out = {{16{1'b0}}, 1'b1, {30{fillchar}}};
               ((17 + offset) % 47):
                 data_out = {{17{1'b0}}, 1'b1, {29{fillchar}}};
               ((18 + offset) % 47):
                 data_out = {{18{1'b0}}, 1'b1, {28{fillchar}}};
               ((19 + offset) % 47):
                 data_out = {{19{1'b0}}, 1'b1, {27{fillchar}}};
               ((20 + offset) % 47):
                 data_out = {{20{1'b0}}, 1'b1, {26{fillchar}}};
               ((21 + offset) % 47):
                 data_out = {{21{1'b0}}, 1'b1, {25{fillchar}}};
               ((22 + offset) % 47):
                 data_out = {{22{1'b0}}, 1'b1, {24{fillchar}}};
               ((23 + offset) % 47):
                 data_out = {{23{1'b0}}, 1'b1, {23{fillchar}}};
               ((24 + offset) % 47):
                 data_out = {{24{1'b0}}, 1'b1, {22{fillchar}}};
               ((25 + offset) % 47):
                 data_out = {{25{1'b0}}, 1'b1, {21{fillchar}}};
               ((26 + offset) % 47):
                 data_out = {{26{1'b0}}, 1'b1, {20{fillchar}}};
               ((27 + offset) % 47):
                 data_out = {{27{1'b0}}, 1'b1, {19{fillchar}}};
               ((28 + offset) % 47):
                 data_out = {{28{1'b0}}, 1'b1, {18{fillchar}}};
               ((29 + offset) % 47):
                 data_out = {{29{1'b0}}, 1'b1, {17{fillchar}}};
               ((30 + offset) % 47):
                 data_out = {{30{1'b0}}, 1'b1, {16{fillchar}}};
               ((31 + offset) % 47):
                 data_out = {{31{1'b0}}, 1'b1, {15{fillchar}}};
               ((32 + offset) % 47):
                 data_out = {{32{1'b0}}, 1'b1, {14{fillchar}}};
               ((33 + offset) % 47):
                 data_out = {{33{1'b0}}, 1'b1, {13{fillchar}}};
               ((34 + offset) % 47):
                 data_out = {{34{1'b0}}, 1'b1, {12{fillchar}}};
               ((35 + offset) % 47):
                 data_out = {{35{1'b0}}, 1'b1, {11{fillchar}}};
               ((36 + offset) % 47):
                 data_out = {{36{1'b0}}, 1'b1, {10{fillchar}}};
               ((37 + offset) % 47):
                 data_out = {{37{1'b0}}, 1'b1, {9{fillchar}}};
               ((38 + offset) % 47):
                 data_out = {{38{1'b0}}, 1'b1, {8{fillchar}}};
               ((39 + offset) % 47):
                 data_out = {{39{1'b0}}, 1'b1, {7{fillchar}}};
               ((40 + offset) % 47):
                 data_out = {{40{1'b0}}, 1'b1, {6{fillchar}}};
               ((41 + offset) % 47):
                 data_out = {{41{1'b0}}, 1'b1, {5{fillchar}}};
               ((42 + offset) % 47):
                 data_out = {{42{1'b0}}, 1'b1, {4{fillchar}}};
               ((43 + offset) % 47):
                 data_out = {{43{1'b0}}, 1'b1, {3{fillchar}}};
               ((44 + offset) % 47):
                 data_out = {{44{1'b0}}, 1'b1, {2{fillchar}}};
               ((45 + offset) % 47):
                 data_out = {{45{1'b0}}, 1'b1, {1{fillchar}}};
               ((46 + offset) % 47):
                 data_out = {{46{1'b0}}, 1'b1};
               default:
                 data_out = {47{1'bx}};
             endcase
          end
      else if(num_ports == 48)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 48):
                 data_out = {1'b1, {47{fillchar}}};
               ((1 + offset) % 48):
                 data_out = {{1{1'b0}}, 1'b1, {46{fillchar}}};
               ((2 + offset) % 48):
                 data_out = {{2{1'b0}}, 1'b1, {45{fillchar}}};
               ((3 + offset) % 48):
                 data_out = {{3{1'b0}}, 1'b1, {44{fillchar}}};
               ((4 + offset) % 48):
                 data_out = {{4{1'b0}}, 1'b1, {43{fillchar}}};
               ((5 + offset) % 48):
                 data_out = {{5{1'b0}}, 1'b1, {42{fillchar}}};
               ((6 + offset) % 48):
                 data_out = {{6{1'b0}}, 1'b1, {41{fillchar}}};
               ((7 + offset) % 48):
                 data_out = {{7{1'b0}}, 1'b1, {40{fillchar}}};
               ((8 + offset) % 48):
                 data_out = {{8{1'b0}}, 1'b1, {39{fillchar}}};
               ((9 + offset) % 48):
                 data_out = {{9{1'b0}}, 1'b1, {38{fillchar}}};
               ((10 + offset) % 48):
                 data_out = {{10{1'b0}}, 1'b1, {37{fillchar}}};
               ((11 + offset) % 48):
                 data_out = {{11{1'b0}}, 1'b1, {36{fillchar}}};
               ((12 + offset) % 48):
                 data_out = {{12{1'b0}}, 1'b1, {35{fillchar}}};
               ((13 + offset) % 48):
                 data_out = {{13{1'b0}}, 1'b1, {34{fillchar}}};
               ((14 + offset) % 48):
                 data_out = {{14{1'b0}}, 1'b1, {33{fillchar}}};
               ((15 + offset) % 48):
                 data_out = {{15{1'b0}}, 1'b1, {32{fillchar}}};
               ((16 + offset) % 48):
                 data_out = {{16{1'b0}}, 1'b1, {31{fillchar}}};
               ((17 + offset) % 48):
                 data_out = {{17{1'b0}}, 1'b1, {30{fillchar}}};
               ((18 + offset) % 48):
                 data_out = {{18{1'b0}}, 1'b1, {29{fillchar}}};
               ((19 + offset) % 48):
                 data_out = {{19{1'b0}}, 1'b1, {28{fillchar}}};
               ((20 + offset) % 48):
                 data_out = {{20{1'b0}}, 1'b1, {27{fillchar}}};
               ((21 + offset) % 48):
                 data_out = {{21{1'b0}}, 1'b1, {26{fillchar}}};
               ((22 + offset) % 48):
                 data_out = {{22{1'b0}}, 1'b1, {25{fillchar}}};
               ((23 + offset) % 48):
                 data_out = {{23{1'b0}}, 1'b1, {24{fillchar}}};
               ((24 + offset) % 48):
                 data_out = {{24{1'b0}}, 1'b1, {23{fillchar}}};
               ((25 + offset) % 48):
                 data_out = {{25{1'b0}}, 1'b1, {22{fillchar}}};
               ((26 + offset) % 48):
                 data_out = {{26{1'b0}}, 1'b1, {21{fillchar}}};
               ((27 + offset) % 48):
                 data_out = {{27{1'b0}}, 1'b1, {20{fillchar}}};
               ((28 + offset) % 48):
                 data_out = {{28{1'b0}}, 1'b1, {19{fillchar}}};
               ((29 + offset) % 48):
                 data_out = {{29{1'b0}}, 1'b1, {18{fillchar}}};
               ((30 + offset) % 48):
                 data_out = {{30{1'b0}}, 1'b1, {17{fillchar}}};
               ((31 + offset) % 48):
                 data_out = {{31{1'b0}}, 1'b1, {16{fillchar}}};
               ((32 + offset) % 48):
                 data_out = {{32{1'b0}}, 1'b1, {15{fillchar}}};
               ((33 + offset) % 48):
                 data_out = {{33{1'b0}}, 1'b1, {14{fillchar}}};
               ((34 + offset) % 48):
                 data_out = {{34{1'b0}}, 1'b1, {13{fillchar}}};
               ((35 + offset) % 48):
                 data_out = {{35{1'b0}}, 1'b1, {12{fillchar}}};
               ((36 + offset) % 48):
                 data_out = {{36{1'b0}}, 1'b1, {11{fillchar}}};
               ((37 + offset) % 48):
                 data_out = {{37{1'b0}}, 1'b1, {10{fillchar}}};
               ((38 + offset) % 48):
                 data_out = {{38{1'b0}}, 1'b1, {9{fillchar}}};
               ((39 + offset) % 48):
                 data_out = {{39{1'b0}}, 1'b1, {8{fillchar}}};
               ((40 + offset) % 48):
                 data_out = {{40{1'b0}}, 1'b1, {7{fillchar}}};
               ((41 + offset) % 48):
                 data_out = {{41{1'b0}}, 1'b1, {6{fillchar}}};
               ((42 + offset) % 48):
                 data_out = {{42{1'b0}}, 1'b1, {5{fillchar}}};
               ((43 + offset) % 48):
                 data_out = {{43{1'b0}}, 1'b1, {4{fillchar}}};
               ((44 + offset) % 48):
                 data_out = {{44{1'b0}}, 1'b1, {3{fillchar}}};
               ((45 + offset) % 48):
                 data_out = {{45{1'b0}}, 1'b1, {2{fillchar}}};
               ((46 + offset) % 48):
                 data_out = {{46{1'b0}}, 1'b1, {1{fillchar}}};
               ((47 + offset) % 48):
                 data_out = {{47{1'b0}}, 1'b1};
               default:
                 data_out = {48{1'bx}};
             endcase
          end
      else if(num_ports == 49)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 49):
                 data_out = {1'b1, {48{fillchar}}};
               ((1 + offset) % 49):
                 data_out = {{1{1'b0}}, 1'b1, {47{fillchar}}};
               ((2 + offset) % 49):
                 data_out = {{2{1'b0}}, 1'b1, {46{fillchar}}};
               ((3 + offset) % 49):
                 data_out = {{3{1'b0}}, 1'b1, {45{fillchar}}};
               ((4 + offset) % 49):
                 data_out = {{4{1'b0}}, 1'b1, {44{fillchar}}};
               ((5 + offset) % 49):
                 data_out = {{5{1'b0}}, 1'b1, {43{fillchar}}};
               ((6 + offset) % 49):
                 data_out = {{6{1'b0}}, 1'b1, {42{fillchar}}};
               ((7 + offset) % 49):
                 data_out = {{7{1'b0}}, 1'b1, {41{fillchar}}};
               ((8 + offset) % 49):
                 data_out = {{8{1'b0}}, 1'b1, {40{fillchar}}};
               ((9 + offset) % 49):
                 data_out = {{9{1'b0}}, 1'b1, {39{fillchar}}};
               ((10 + offset) % 49):
                 data_out = {{10{1'b0}}, 1'b1, {38{fillchar}}};
               ((11 + offset) % 49):
                 data_out = {{11{1'b0}}, 1'b1, {37{fillchar}}};
               ((12 + offset) % 49):
                 data_out = {{12{1'b0}}, 1'b1, {36{fillchar}}};
               ((13 + offset) % 49):
                 data_out = {{13{1'b0}}, 1'b1, {35{fillchar}}};
               ((14 + offset) % 49):
                 data_out = {{14{1'b0}}, 1'b1, {34{fillchar}}};
               ((15 + offset) % 49):
                 data_out = {{15{1'b0}}, 1'b1, {33{fillchar}}};
               ((16 + offset) % 49):
                 data_out = {{16{1'b0}}, 1'b1, {32{fillchar}}};
               ((17 + offset) % 49):
                 data_out = {{17{1'b0}}, 1'b1, {31{fillchar}}};
               ((18 + offset) % 49):
                 data_out = {{18{1'b0}}, 1'b1, {30{fillchar}}};
               ((19 + offset) % 49):
                 data_out = {{19{1'b0}}, 1'b1, {29{fillchar}}};
               ((20 + offset) % 49):
                 data_out = {{20{1'b0}}, 1'b1, {28{fillchar}}};
               ((21 + offset) % 49):
                 data_out = {{21{1'b0}}, 1'b1, {27{fillchar}}};
               ((22 + offset) % 49):
                 data_out = {{22{1'b0}}, 1'b1, {26{fillchar}}};
               ((23 + offset) % 49):
                 data_out = {{23{1'b0}}, 1'b1, {25{fillchar}}};
               ((24 + offset) % 49):
                 data_out = {{24{1'b0}}, 1'b1, {24{fillchar}}};
               ((25 + offset) % 49):
                 data_out = {{25{1'b0}}, 1'b1, {23{fillchar}}};
               ((26 + offset) % 49):
                 data_out = {{26{1'b0}}, 1'b1, {22{fillchar}}};
               ((27 + offset) % 49):
                 data_out = {{27{1'b0}}, 1'b1, {21{fillchar}}};
               ((28 + offset) % 49):
                 data_out = {{28{1'b0}}, 1'b1, {20{fillchar}}};
               ((29 + offset) % 49):
                 data_out = {{29{1'b0}}, 1'b1, {19{fillchar}}};
               ((30 + offset) % 49):
                 data_out = {{30{1'b0}}, 1'b1, {18{fillchar}}};
               ((31 + offset) % 49):
                 data_out = {{31{1'b0}}, 1'b1, {17{fillchar}}};
               ((32 + offset) % 49):
                 data_out = {{32{1'b0}}, 1'b1, {16{fillchar}}};
               ((33 + offset) % 49):
                 data_out = {{33{1'b0}}, 1'b1, {15{fillchar}}};
               ((34 + offset) % 49):
                 data_out = {{34{1'b0}}, 1'b1, {14{fillchar}}};
               ((35 + offset) % 49):
                 data_out = {{35{1'b0}}, 1'b1, {13{fillchar}}};
               ((36 + offset) % 49):
                 data_out = {{36{1'b0}}, 1'b1, {12{fillchar}}};
               ((37 + offset) % 49):
                 data_out = {{37{1'b0}}, 1'b1, {11{fillchar}}};
               ((38 + offset) % 49):
                 data_out = {{38{1'b0}}, 1'b1, {10{fillchar}}};
               ((39 + offset) % 49):
                 data_out = {{39{1'b0}}, 1'b1, {9{fillchar}}};
               ((40 + offset) % 49):
                 data_out = {{40{1'b0}}, 1'b1, {8{fillchar}}};
               ((41 + offset) % 49):
                 data_out = {{41{1'b0}}, 1'b1, {7{fillchar}}};
               ((42 + offset) % 49):
                 data_out = {{42{1'b0}}, 1'b1, {6{fillchar}}};
               ((43 + offset) % 49):
                 data_out = {{43{1'b0}}, 1'b1, {5{fillchar}}};
               ((44 + offset) % 49):
                 data_out = {{44{1'b0}}, 1'b1, {4{fillchar}}};
               ((45 + offset) % 49):
                 data_out = {{45{1'b0}}, 1'b1, {3{fillchar}}};
               ((46 + offset) % 49):
                 data_out = {{46{1'b0}}, 1'b1, {2{fillchar}}};
               ((47 + offset) % 49):
                 data_out = {{47{1'b0}}, 1'b1, {1{fillchar}}};
               ((48 + offset) % 49):
                 data_out = {{48{1'b0}}, 1'b1};
               default:
                 data_out = {49{1'bx}};
             endcase
          end
      else if(num_ports == 50)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 50):
                 data_out = {1'b1, {49{fillchar}}};
               ((1 + offset) % 50):
                 data_out = {{1{1'b0}}, 1'b1, {48{fillchar}}};
               ((2 + offset) % 50):
                 data_out = {{2{1'b0}}, 1'b1, {47{fillchar}}};
               ((3 + offset) % 50):
                 data_out = {{3{1'b0}}, 1'b1, {46{fillchar}}};
               ((4 + offset) % 50):
                 data_out = {{4{1'b0}}, 1'b1, {45{fillchar}}};
               ((5 + offset) % 50):
                 data_out = {{5{1'b0}}, 1'b1, {44{fillchar}}};
               ((6 + offset) % 50):
                 data_out = {{6{1'b0}}, 1'b1, {43{fillchar}}};
               ((7 + offset) % 50):
                 data_out = {{7{1'b0}}, 1'b1, {42{fillchar}}};
               ((8 + offset) % 50):
                 data_out = {{8{1'b0}}, 1'b1, {41{fillchar}}};
               ((9 + offset) % 50):
                 data_out = {{9{1'b0}}, 1'b1, {40{fillchar}}};
               ((10 + offset) % 50):
                 data_out = {{10{1'b0}}, 1'b1, {39{fillchar}}};
               ((11 + offset) % 50):
                 data_out = {{11{1'b0}}, 1'b1, {38{fillchar}}};
               ((12 + offset) % 50):
                 data_out = {{12{1'b0}}, 1'b1, {37{fillchar}}};
               ((13 + offset) % 50):
                 data_out = {{13{1'b0}}, 1'b1, {36{fillchar}}};
               ((14 + offset) % 50):
                 data_out = {{14{1'b0}}, 1'b1, {35{fillchar}}};
               ((15 + offset) % 50):
                 data_out = {{15{1'b0}}, 1'b1, {34{fillchar}}};
               ((16 + offset) % 50):
                 data_out = {{16{1'b0}}, 1'b1, {33{fillchar}}};
               ((17 + offset) % 50):
                 data_out = {{17{1'b0}}, 1'b1, {32{fillchar}}};
               ((18 + offset) % 50):
                 data_out = {{18{1'b0}}, 1'b1, {31{fillchar}}};
               ((19 + offset) % 50):
                 data_out = {{19{1'b0}}, 1'b1, {30{fillchar}}};
               ((20 + offset) % 50):
                 data_out = {{20{1'b0}}, 1'b1, {29{fillchar}}};
               ((21 + offset) % 50):
                 data_out = {{21{1'b0}}, 1'b1, {28{fillchar}}};
               ((22 + offset) % 50):
                 data_out = {{22{1'b0}}, 1'b1, {27{fillchar}}};
               ((23 + offset) % 50):
                 data_out = {{23{1'b0}}, 1'b1, {26{fillchar}}};
               ((24 + offset) % 50):
                 data_out = {{24{1'b0}}, 1'b1, {25{fillchar}}};
               ((25 + offset) % 50):
                 data_out = {{25{1'b0}}, 1'b1, {24{fillchar}}};
               ((26 + offset) % 50):
                 data_out = {{26{1'b0}}, 1'b1, {23{fillchar}}};
               ((27 + offset) % 50):
                 data_out = {{27{1'b0}}, 1'b1, {22{fillchar}}};
               ((28 + offset) % 50):
                 data_out = {{28{1'b0}}, 1'b1, {21{fillchar}}};
               ((29 + offset) % 50):
                 data_out = {{29{1'b0}}, 1'b1, {20{fillchar}}};
               ((30 + offset) % 50):
                 data_out = {{30{1'b0}}, 1'b1, {19{fillchar}}};
               ((31 + offset) % 50):
                 data_out = {{31{1'b0}}, 1'b1, {18{fillchar}}};
               ((32 + offset) % 50):
                 data_out = {{32{1'b0}}, 1'b1, {17{fillchar}}};
               ((33 + offset) % 50):
                 data_out = {{33{1'b0}}, 1'b1, {16{fillchar}}};
               ((34 + offset) % 50):
                 data_out = {{34{1'b0}}, 1'b1, {15{fillchar}}};
               ((35 + offset) % 50):
                 data_out = {{35{1'b0}}, 1'b1, {14{fillchar}}};
               ((36 + offset) % 50):
                 data_out = {{36{1'b0}}, 1'b1, {13{fillchar}}};
               ((37 + offset) % 50):
                 data_out = {{37{1'b0}}, 1'b1, {12{fillchar}}};
               ((38 + offset) % 50):
                 data_out = {{38{1'b0}}, 1'b1, {11{fillchar}}};
               ((39 + offset) % 50):
                 data_out = {{39{1'b0}}, 1'b1, {10{fillchar}}};
               ((40 + offset) % 50):
                 data_out = {{40{1'b0}}, 1'b1, {9{fillchar}}};
               ((41 + offset) % 50):
                 data_out = {{41{1'b0}}, 1'b1, {8{fillchar}}};
               ((42 + offset) % 50):
                 data_out = {{42{1'b0}}, 1'b1, {7{fillchar}}};
               ((43 + offset) % 50):
                 data_out = {{43{1'b0}}, 1'b1, {6{fillchar}}};
               ((44 + offset) % 50):
                 data_out = {{44{1'b0}}, 1'b1, {5{fillchar}}};
               ((45 + offset) % 50):
                 data_out = {{45{1'b0}}, 1'b1, {4{fillchar}}};
               ((46 + offset) % 50):
                 data_out = {{46{1'b0}}, 1'b1, {3{fillchar}}};
               ((47 + offset) % 50):
                 data_out = {{47{1'b0}}, 1'b1, {2{fillchar}}};
               ((48 + offset) % 50):
                 data_out = {{48{1'b0}}, 1'b1, {1{fillchar}}};
               ((49 + offset) % 50):
                 data_out = {{49{1'b0}}, 1'b1};
               default:
                 data_out = {50{1'bx}};
             endcase
          end
      else if(num_ports == 51)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 51):
                 data_out = {1'b1, {50{fillchar}}};
               ((1 + offset) % 51):
                 data_out = {{1{1'b0}}, 1'b1, {49{fillchar}}};
               ((2 + offset) % 51):
                 data_out = {{2{1'b0}}, 1'b1, {48{fillchar}}};
               ((3 + offset) % 51):
                 data_out = {{3{1'b0}}, 1'b1, {47{fillchar}}};
               ((4 + offset) % 51):
                 data_out = {{4{1'b0}}, 1'b1, {46{fillchar}}};
               ((5 + offset) % 51):
                 data_out = {{5{1'b0}}, 1'b1, {45{fillchar}}};
               ((6 + offset) % 51):
                 data_out = {{6{1'b0}}, 1'b1, {44{fillchar}}};
               ((7 + offset) % 51):
                 data_out = {{7{1'b0}}, 1'b1, {43{fillchar}}};
               ((8 + offset) % 51):
                 data_out = {{8{1'b0}}, 1'b1, {42{fillchar}}};
               ((9 + offset) % 51):
                 data_out = {{9{1'b0}}, 1'b1, {41{fillchar}}};
               ((10 + offset) % 51):
                 data_out = {{10{1'b0}}, 1'b1, {40{fillchar}}};
               ((11 + offset) % 51):
                 data_out = {{11{1'b0}}, 1'b1, {39{fillchar}}};
               ((12 + offset) % 51):
                 data_out = {{12{1'b0}}, 1'b1, {38{fillchar}}};
               ((13 + offset) % 51):
                 data_out = {{13{1'b0}}, 1'b1, {37{fillchar}}};
               ((14 + offset) % 51):
                 data_out = {{14{1'b0}}, 1'b1, {36{fillchar}}};
               ((15 + offset) % 51):
                 data_out = {{15{1'b0}}, 1'b1, {35{fillchar}}};
               ((16 + offset) % 51):
                 data_out = {{16{1'b0}}, 1'b1, {34{fillchar}}};
               ((17 + offset) % 51):
                 data_out = {{17{1'b0}}, 1'b1, {33{fillchar}}};
               ((18 + offset) % 51):
                 data_out = {{18{1'b0}}, 1'b1, {32{fillchar}}};
               ((19 + offset) % 51):
                 data_out = {{19{1'b0}}, 1'b1, {31{fillchar}}};
               ((20 + offset) % 51):
                 data_out = {{20{1'b0}}, 1'b1, {30{fillchar}}};
               ((21 + offset) % 51):
                 data_out = {{21{1'b0}}, 1'b1, {29{fillchar}}};
               ((22 + offset) % 51):
                 data_out = {{22{1'b0}}, 1'b1, {28{fillchar}}};
               ((23 + offset) % 51):
                 data_out = {{23{1'b0}}, 1'b1, {27{fillchar}}};
               ((24 + offset) % 51):
                 data_out = {{24{1'b0}}, 1'b1, {26{fillchar}}};
               ((25 + offset) % 51):
                 data_out = {{25{1'b0}}, 1'b1, {25{fillchar}}};
               ((26 + offset) % 51):
                 data_out = {{26{1'b0}}, 1'b1, {24{fillchar}}};
               ((27 + offset) % 51):
                 data_out = {{27{1'b0}}, 1'b1, {23{fillchar}}};
               ((28 + offset) % 51):
                 data_out = {{28{1'b0}}, 1'b1, {22{fillchar}}};
               ((29 + offset) % 51):
                 data_out = {{29{1'b0}}, 1'b1, {21{fillchar}}};
               ((30 + offset) % 51):
                 data_out = {{30{1'b0}}, 1'b1, {20{fillchar}}};
               ((31 + offset) % 51):
                 data_out = {{31{1'b0}}, 1'b1, {19{fillchar}}};
               ((32 + offset) % 51):
                 data_out = {{32{1'b0}}, 1'b1, {18{fillchar}}};
               ((33 + offset) % 51):
                 data_out = {{33{1'b0}}, 1'b1, {17{fillchar}}};
               ((34 + offset) % 51):
                 data_out = {{34{1'b0}}, 1'b1, {16{fillchar}}};
               ((35 + offset) % 51):
                 data_out = {{35{1'b0}}, 1'b1, {15{fillchar}}};
               ((36 + offset) % 51):
                 data_out = {{36{1'b0}}, 1'b1, {14{fillchar}}};
               ((37 + offset) % 51):
                 data_out = {{37{1'b0}}, 1'b1, {13{fillchar}}};
               ((38 + offset) % 51):
                 data_out = {{38{1'b0}}, 1'b1, {12{fillchar}}};
               ((39 + offset) % 51):
                 data_out = {{39{1'b0}}, 1'b1, {11{fillchar}}};
               ((40 + offset) % 51):
                 data_out = {{40{1'b0}}, 1'b1, {10{fillchar}}};
               ((41 + offset) % 51):
                 data_out = {{41{1'b0}}, 1'b1, {9{fillchar}}};
               ((42 + offset) % 51):
                 data_out = {{42{1'b0}}, 1'b1, {8{fillchar}}};
               ((43 + offset) % 51):
                 data_out = {{43{1'b0}}, 1'b1, {7{fillchar}}};
               ((44 + offset) % 51):
                 data_out = {{44{1'b0}}, 1'b1, {6{fillchar}}};
               ((45 + offset) % 51):
                 data_out = {{45{1'b0}}, 1'b1, {5{fillchar}}};
               ((46 + offset) % 51):
                 data_out = {{46{1'b0}}, 1'b1, {4{fillchar}}};
               ((47 + offset) % 51):
                 data_out = {{47{1'b0}}, 1'b1, {3{fillchar}}};
               ((48 + offset) % 51):
                 data_out = {{48{1'b0}}, 1'b1, {2{fillchar}}};
               ((49 + offset) % 51):
                 data_out = {{49{1'b0}}, 1'b1, {1{fillchar}}};
               ((50 + offset) % 51):
                 data_out = {{50{1'b0}}, 1'b1};
               default:
                 data_out = {51{1'bx}};
             endcase
          end
      else if(num_ports == 52)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 52):
                 data_out = {1'b1, {51{fillchar}}};
               ((1 + offset) % 52):
                 data_out = {{1{1'b0}}, 1'b1, {50{fillchar}}};
               ((2 + offset) % 52):
                 data_out = {{2{1'b0}}, 1'b1, {49{fillchar}}};
               ((3 + offset) % 52):
                 data_out = {{3{1'b0}}, 1'b1, {48{fillchar}}};
               ((4 + offset) % 52):
                 data_out = {{4{1'b0}}, 1'b1, {47{fillchar}}};
               ((5 + offset) % 52):
                 data_out = {{5{1'b0}}, 1'b1, {46{fillchar}}};
               ((6 + offset) % 52):
                 data_out = {{6{1'b0}}, 1'b1, {45{fillchar}}};
               ((7 + offset) % 52):
                 data_out = {{7{1'b0}}, 1'b1, {44{fillchar}}};
               ((8 + offset) % 52):
                 data_out = {{8{1'b0}}, 1'b1, {43{fillchar}}};
               ((9 + offset) % 52):
                 data_out = {{9{1'b0}}, 1'b1, {42{fillchar}}};
               ((10 + offset) % 52):
                 data_out = {{10{1'b0}}, 1'b1, {41{fillchar}}};
               ((11 + offset) % 52):
                 data_out = {{11{1'b0}}, 1'b1, {40{fillchar}}};
               ((12 + offset) % 52):
                 data_out = {{12{1'b0}}, 1'b1, {39{fillchar}}};
               ((13 + offset) % 52):
                 data_out = {{13{1'b0}}, 1'b1, {38{fillchar}}};
               ((14 + offset) % 52):
                 data_out = {{14{1'b0}}, 1'b1, {37{fillchar}}};
               ((15 + offset) % 52):
                 data_out = {{15{1'b0}}, 1'b1, {36{fillchar}}};
               ((16 + offset) % 52):
                 data_out = {{16{1'b0}}, 1'b1, {35{fillchar}}};
               ((17 + offset) % 52):
                 data_out = {{17{1'b0}}, 1'b1, {34{fillchar}}};
               ((18 + offset) % 52):
                 data_out = {{18{1'b0}}, 1'b1, {33{fillchar}}};
               ((19 + offset) % 52):
                 data_out = {{19{1'b0}}, 1'b1, {32{fillchar}}};
               ((20 + offset) % 52):
                 data_out = {{20{1'b0}}, 1'b1, {31{fillchar}}};
               ((21 + offset) % 52):
                 data_out = {{21{1'b0}}, 1'b1, {30{fillchar}}};
               ((22 + offset) % 52):
                 data_out = {{22{1'b0}}, 1'b1, {29{fillchar}}};
               ((23 + offset) % 52):
                 data_out = {{23{1'b0}}, 1'b1, {28{fillchar}}};
               ((24 + offset) % 52):
                 data_out = {{24{1'b0}}, 1'b1, {27{fillchar}}};
               ((25 + offset) % 52):
                 data_out = {{25{1'b0}}, 1'b1, {26{fillchar}}};
               ((26 + offset) % 52):
                 data_out = {{26{1'b0}}, 1'b1, {25{fillchar}}};
               ((27 + offset) % 52):
                 data_out = {{27{1'b0}}, 1'b1, {24{fillchar}}};
               ((28 + offset) % 52):
                 data_out = {{28{1'b0}}, 1'b1, {23{fillchar}}};
               ((29 + offset) % 52):
                 data_out = {{29{1'b0}}, 1'b1, {22{fillchar}}};
               ((30 + offset) % 52):
                 data_out = {{30{1'b0}}, 1'b1, {21{fillchar}}};
               ((31 + offset) % 52):
                 data_out = {{31{1'b0}}, 1'b1, {20{fillchar}}};
               ((32 + offset) % 52):
                 data_out = {{32{1'b0}}, 1'b1, {19{fillchar}}};
               ((33 + offset) % 52):
                 data_out = {{33{1'b0}}, 1'b1, {18{fillchar}}};
               ((34 + offset) % 52):
                 data_out = {{34{1'b0}}, 1'b1, {17{fillchar}}};
               ((35 + offset) % 52):
                 data_out = {{35{1'b0}}, 1'b1, {16{fillchar}}};
               ((36 + offset) % 52):
                 data_out = {{36{1'b0}}, 1'b1, {15{fillchar}}};
               ((37 + offset) % 52):
                 data_out = {{37{1'b0}}, 1'b1, {14{fillchar}}};
               ((38 + offset) % 52):
                 data_out = {{38{1'b0}}, 1'b1, {13{fillchar}}};
               ((39 + offset) % 52):
                 data_out = {{39{1'b0}}, 1'b1, {12{fillchar}}};
               ((40 + offset) % 52):
                 data_out = {{40{1'b0}}, 1'b1, {11{fillchar}}};
               ((41 + offset) % 52):
                 data_out = {{41{1'b0}}, 1'b1, {10{fillchar}}};
               ((42 + offset) % 52):
                 data_out = {{42{1'b0}}, 1'b1, {9{fillchar}}};
               ((43 + offset) % 52):
                 data_out = {{43{1'b0}}, 1'b1, {8{fillchar}}};
               ((44 + offset) % 52):
                 data_out = {{44{1'b0}}, 1'b1, {7{fillchar}}};
               ((45 + offset) % 52):
                 data_out = {{45{1'b0}}, 1'b1, {6{fillchar}}};
               ((46 + offset) % 52):
                 data_out = {{46{1'b0}}, 1'b1, {5{fillchar}}};
               ((47 + offset) % 52):
                 data_out = {{47{1'b0}}, 1'b1, {4{fillchar}}};
               ((48 + offset) % 52):
                 data_out = {{48{1'b0}}, 1'b1, {3{fillchar}}};
               ((49 + offset) % 52):
                 data_out = {{49{1'b0}}, 1'b1, {2{fillchar}}};
               ((50 + offset) % 52):
                 data_out = {{50{1'b0}}, 1'b1, {1{fillchar}}};
               ((51 + offset) % 52):
                 data_out = {{51{1'b0}}, 1'b1};
               default:
                 data_out = {52{1'bx}};
             endcase
          end
      else if(num_ports == 53)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 53):
                 data_out = {1'b1, {52{fillchar}}};
               ((1 + offset) % 53):
                 data_out = {{1{1'b0}}, 1'b1, {51{fillchar}}};
               ((2 + offset) % 53):
                 data_out = {{2{1'b0}}, 1'b1, {50{fillchar}}};
               ((3 + offset) % 53):
                 data_out = {{3{1'b0}}, 1'b1, {49{fillchar}}};
               ((4 + offset) % 53):
                 data_out = {{4{1'b0}}, 1'b1, {48{fillchar}}};
               ((5 + offset) % 53):
                 data_out = {{5{1'b0}}, 1'b1, {47{fillchar}}};
               ((6 + offset) % 53):
                 data_out = {{6{1'b0}}, 1'b1, {46{fillchar}}};
               ((7 + offset) % 53):
                 data_out = {{7{1'b0}}, 1'b1, {45{fillchar}}};
               ((8 + offset) % 53):
                 data_out = {{8{1'b0}}, 1'b1, {44{fillchar}}};
               ((9 + offset) % 53):
                 data_out = {{9{1'b0}}, 1'b1, {43{fillchar}}};
               ((10 + offset) % 53):
                 data_out = {{10{1'b0}}, 1'b1, {42{fillchar}}};
               ((11 + offset) % 53):
                 data_out = {{11{1'b0}}, 1'b1, {41{fillchar}}};
               ((12 + offset) % 53):
                 data_out = {{12{1'b0}}, 1'b1, {40{fillchar}}};
               ((13 + offset) % 53):
                 data_out = {{13{1'b0}}, 1'b1, {39{fillchar}}};
               ((14 + offset) % 53):
                 data_out = {{14{1'b0}}, 1'b1, {38{fillchar}}};
               ((15 + offset) % 53):
                 data_out = {{15{1'b0}}, 1'b1, {37{fillchar}}};
               ((16 + offset) % 53):
                 data_out = {{16{1'b0}}, 1'b1, {36{fillchar}}};
               ((17 + offset) % 53):
                 data_out = {{17{1'b0}}, 1'b1, {35{fillchar}}};
               ((18 + offset) % 53):
                 data_out = {{18{1'b0}}, 1'b1, {34{fillchar}}};
               ((19 + offset) % 53):
                 data_out = {{19{1'b0}}, 1'b1, {33{fillchar}}};
               ((20 + offset) % 53):
                 data_out = {{20{1'b0}}, 1'b1, {32{fillchar}}};
               ((21 + offset) % 53):
                 data_out = {{21{1'b0}}, 1'b1, {31{fillchar}}};
               ((22 + offset) % 53):
                 data_out = {{22{1'b0}}, 1'b1, {30{fillchar}}};
               ((23 + offset) % 53):
                 data_out = {{23{1'b0}}, 1'b1, {29{fillchar}}};
               ((24 + offset) % 53):
                 data_out = {{24{1'b0}}, 1'b1, {28{fillchar}}};
               ((25 + offset) % 53):
                 data_out = {{25{1'b0}}, 1'b1, {27{fillchar}}};
               ((26 + offset) % 53):
                 data_out = {{26{1'b0}}, 1'b1, {26{fillchar}}};
               ((27 + offset) % 53):
                 data_out = {{27{1'b0}}, 1'b1, {25{fillchar}}};
               ((28 + offset) % 53):
                 data_out = {{28{1'b0}}, 1'b1, {24{fillchar}}};
               ((29 + offset) % 53):
                 data_out = {{29{1'b0}}, 1'b1, {23{fillchar}}};
               ((30 + offset) % 53):
                 data_out = {{30{1'b0}}, 1'b1, {22{fillchar}}};
               ((31 + offset) % 53):
                 data_out = {{31{1'b0}}, 1'b1, {21{fillchar}}};
               ((32 + offset) % 53):
                 data_out = {{32{1'b0}}, 1'b1, {20{fillchar}}};
               ((33 + offset) % 53):
                 data_out = {{33{1'b0}}, 1'b1, {19{fillchar}}};
               ((34 + offset) % 53):
                 data_out = {{34{1'b0}}, 1'b1, {18{fillchar}}};
               ((35 + offset) % 53):
                 data_out = {{35{1'b0}}, 1'b1, {17{fillchar}}};
               ((36 + offset) % 53):
                 data_out = {{36{1'b0}}, 1'b1, {16{fillchar}}};
               ((37 + offset) % 53):
                 data_out = {{37{1'b0}}, 1'b1, {15{fillchar}}};
               ((38 + offset) % 53):
                 data_out = {{38{1'b0}}, 1'b1, {14{fillchar}}};
               ((39 + offset) % 53):
                 data_out = {{39{1'b0}}, 1'b1, {13{fillchar}}};
               ((40 + offset) % 53):
                 data_out = {{40{1'b0}}, 1'b1, {12{fillchar}}};
               ((41 + offset) % 53):
                 data_out = {{41{1'b0}}, 1'b1, {11{fillchar}}};
               ((42 + offset) % 53):
                 data_out = {{42{1'b0}}, 1'b1, {10{fillchar}}};
               ((43 + offset) % 53):
                 data_out = {{43{1'b0}}, 1'b1, {9{fillchar}}};
               ((44 + offset) % 53):
                 data_out = {{44{1'b0}}, 1'b1, {8{fillchar}}};
               ((45 + offset) % 53):
                 data_out = {{45{1'b0}}, 1'b1, {7{fillchar}}};
               ((46 + offset) % 53):
                 data_out = {{46{1'b0}}, 1'b1, {6{fillchar}}};
               ((47 + offset) % 53):
                 data_out = {{47{1'b0}}, 1'b1, {5{fillchar}}};
               ((48 + offset) % 53):
                 data_out = {{48{1'b0}}, 1'b1, {4{fillchar}}};
               ((49 + offset) % 53):
                 data_out = {{49{1'b0}}, 1'b1, {3{fillchar}}};
               ((50 + offset) % 53):
                 data_out = {{50{1'b0}}, 1'b1, {2{fillchar}}};
               ((51 + offset) % 53):
                 data_out = {{51{1'b0}}, 1'b1, {1{fillchar}}};
               ((52 + offset) % 53):
                 data_out = {{52{1'b0}}, 1'b1};
               default:
                 data_out = {53{1'bx}};
             endcase
          end
      else if(num_ports == 54)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 54):
                 data_out = {1'b1, {53{fillchar}}};
               ((1 + offset) % 54):
                 data_out = {{1{1'b0}}, 1'b1, {52{fillchar}}};
               ((2 + offset) % 54):
                 data_out = {{2{1'b0}}, 1'b1, {51{fillchar}}};
               ((3 + offset) % 54):
                 data_out = {{3{1'b0}}, 1'b1, {50{fillchar}}};
               ((4 + offset) % 54):
                 data_out = {{4{1'b0}}, 1'b1, {49{fillchar}}};
               ((5 + offset) % 54):
                 data_out = {{5{1'b0}}, 1'b1, {48{fillchar}}};
               ((6 + offset) % 54):
                 data_out = {{6{1'b0}}, 1'b1, {47{fillchar}}};
               ((7 + offset) % 54):
                 data_out = {{7{1'b0}}, 1'b1, {46{fillchar}}};
               ((8 + offset) % 54):
                 data_out = {{8{1'b0}}, 1'b1, {45{fillchar}}};
               ((9 + offset) % 54):
                 data_out = {{9{1'b0}}, 1'b1, {44{fillchar}}};
               ((10 + offset) % 54):
                 data_out = {{10{1'b0}}, 1'b1, {43{fillchar}}};
               ((11 + offset) % 54):
                 data_out = {{11{1'b0}}, 1'b1, {42{fillchar}}};
               ((12 + offset) % 54):
                 data_out = {{12{1'b0}}, 1'b1, {41{fillchar}}};
               ((13 + offset) % 54):
                 data_out = {{13{1'b0}}, 1'b1, {40{fillchar}}};
               ((14 + offset) % 54):
                 data_out = {{14{1'b0}}, 1'b1, {39{fillchar}}};
               ((15 + offset) % 54):
                 data_out = {{15{1'b0}}, 1'b1, {38{fillchar}}};
               ((16 + offset) % 54):
                 data_out = {{16{1'b0}}, 1'b1, {37{fillchar}}};
               ((17 + offset) % 54):
                 data_out = {{17{1'b0}}, 1'b1, {36{fillchar}}};
               ((18 + offset) % 54):
                 data_out = {{18{1'b0}}, 1'b1, {35{fillchar}}};
               ((19 + offset) % 54):
                 data_out = {{19{1'b0}}, 1'b1, {34{fillchar}}};
               ((20 + offset) % 54):
                 data_out = {{20{1'b0}}, 1'b1, {33{fillchar}}};
               ((21 + offset) % 54):
                 data_out = {{21{1'b0}}, 1'b1, {32{fillchar}}};
               ((22 + offset) % 54):
                 data_out = {{22{1'b0}}, 1'b1, {31{fillchar}}};
               ((23 + offset) % 54):
                 data_out = {{23{1'b0}}, 1'b1, {30{fillchar}}};
               ((24 + offset) % 54):
                 data_out = {{24{1'b0}}, 1'b1, {29{fillchar}}};
               ((25 + offset) % 54):
                 data_out = {{25{1'b0}}, 1'b1, {28{fillchar}}};
               ((26 + offset) % 54):
                 data_out = {{26{1'b0}}, 1'b1, {27{fillchar}}};
               ((27 + offset) % 54):
                 data_out = {{27{1'b0}}, 1'b1, {26{fillchar}}};
               ((28 + offset) % 54):
                 data_out = {{28{1'b0}}, 1'b1, {25{fillchar}}};
               ((29 + offset) % 54):
                 data_out = {{29{1'b0}}, 1'b1, {24{fillchar}}};
               ((30 + offset) % 54):
                 data_out = {{30{1'b0}}, 1'b1, {23{fillchar}}};
               ((31 + offset) % 54):
                 data_out = {{31{1'b0}}, 1'b1, {22{fillchar}}};
               ((32 + offset) % 54):
                 data_out = {{32{1'b0}}, 1'b1, {21{fillchar}}};
               ((33 + offset) % 54):
                 data_out = {{33{1'b0}}, 1'b1, {20{fillchar}}};
               ((34 + offset) % 54):
                 data_out = {{34{1'b0}}, 1'b1, {19{fillchar}}};
               ((35 + offset) % 54):
                 data_out = {{35{1'b0}}, 1'b1, {18{fillchar}}};
               ((36 + offset) % 54):
                 data_out = {{36{1'b0}}, 1'b1, {17{fillchar}}};
               ((37 + offset) % 54):
                 data_out = {{37{1'b0}}, 1'b1, {16{fillchar}}};
               ((38 + offset) % 54):
                 data_out = {{38{1'b0}}, 1'b1, {15{fillchar}}};
               ((39 + offset) % 54):
                 data_out = {{39{1'b0}}, 1'b1, {14{fillchar}}};
               ((40 + offset) % 54):
                 data_out = {{40{1'b0}}, 1'b1, {13{fillchar}}};
               ((41 + offset) % 54):
                 data_out = {{41{1'b0}}, 1'b1, {12{fillchar}}};
               ((42 + offset) % 54):
                 data_out = {{42{1'b0}}, 1'b1, {11{fillchar}}};
               ((43 + offset) % 54):
                 data_out = {{43{1'b0}}, 1'b1, {10{fillchar}}};
               ((44 + offset) % 54):
                 data_out = {{44{1'b0}}, 1'b1, {9{fillchar}}};
               ((45 + offset) % 54):
                 data_out = {{45{1'b0}}, 1'b1, {8{fillchar}}};
               ((46 + offset) % 54):
                 data_out = {{46{1'b0}}, 1'b1, {7{fillchar}}};
               ((47 + offset) % 54):
                 data_out = {{47{1'b0}}, 1'b1, {6{fillchar}}};
               ((48 + offset) % 54):
                 data_out = {{48{1'b0}}, 1'b1, {5{fillchar}}};
               ((49 + offset) % 54):
                 data_out = {{49{1'b0}}, 1'b1, {4{fillchar}}};
               ((50 + offset) % 54):
                 data_out = {{50{1'b0}}, 1'b1, {3{fillchar}}};
               ((51 + offset) % 54):
                 data_out = {{51{1'b0}}, 1'b1, {2{fillchar}}};
               ((52 + offset) % 54):
                 data_out = {{52{1'b0}}, 1'b1, {1{fillchar}}};
               ((53 + offset) % 54):
                 data_out = {{53{1'b0}}, 1'b1};
               default:
                 data_out = {54{1'bx}};
             endcase
          end
      else if(num_ports == 55)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 55):
                 data_out = {1'b1, {54{fillchar}}};
               ((1 + offset) % 55):
                 data_out = {{1{1'b0}}, 1'b1, {53{fillchar}}};
               ((2 + offset) % 55):
                 data_out = {{2{1'b0}}, 1'b1, {52{fillchar}}};
               ((3 + offset) % 55):
                 data_out = {{3{1'b0}}, 1'b1, {51{fillchar}}};
               ((4 + offset) % 55):
                 data_out = {{4{1'b0}}, 1'b1, {50{fillchar}}};
               ((5 + offset) % 55):
                 data_out = {{5{1'b0}}, 1'b1, {49{fillchar}}};
               ((6 + offset) % 55):
                 data_out = {{6{1'b0}}, 1'b1, {48{fillchar}}};
               ((7 + offset) % 55):
                 data_out = {{7{1'b0}}, 1'b1, {47{fillchar}}};
               ((8 + offset) % 55):
                 data_out = {{8{1'b0}}, 1'b1, {46{fillchar}}};
               ((9 + offset) % 55):
                 data_out = {{9{1'b0}}, 1'b1, {45{fillchar}}};
               ((10 + offset) % 55):
                 data_out = {{10{1'b0}}, 1'b1, {44{fillchar}}};
               ((11 + offset) % 55):
                 data_out = {{11{1'b0}}, 1'b1, {43{fillchar}}};
               ((12 + offset) % 55):
                 data_out = {{12{1'b0}}, 1'b1, {42{fillchar}}};
               ((13 + offset) % 55):
                 data_out = {{13{1'b0}}, 1'b1, {41{fillchar}}};
               ((14 + offset) % 55):
                 data_out = {{14{1'b0}}, 1'b1, {40{fillchar}}};
               ((15 + offset) % 55):
                 data_out = {{15{1'b0}}, 1'b1, {39{fillchar}}};
               ((16 + offset) % 55):
                 data_out = {{16{1'b0}}, 1'b1, {38{fillchar}}};
               ((17 + offset) % 55):
                 data_out = {{17{1'b0}}, 1'b1, {37{fillchar}}};
               ((18 + offset) % 55):
                 data_out = {{18{1'b0}}, 1'b1, {36{fillchar}}};
               ((19 + offset) % 55):
                 data_out = {{19{1'b0}}, 1'b1, {35{fillchar}}};
               ((20 + offset) % 55):
                 data_out = {{20{1'b0}}, 1'b1, {34{fillchar}}};
               ((21 + offset) % 55):
                 data_out = {{21{1'b0}}, 1'b1, {33{fillchar}}};
               ((22 + offset) % 55):
                 data_out = {{22{1'b0}}, 1'b1, {32{fillchar}}};
               ((23 + offset) % 55):
                 data_out = {{23{1'b0}}, 1'b1, {31{fillchar}}};
               ((24 + offset) % 55):
                 data_out = {{24{1'b0}}, 1'b1, {30{fillchar}}};
               ((25 + offset) % 55):
                 data_out = {{25{1'b0}}, 1'b1, {29{fillchar}}};
               ((26 + offset) % 55):
                 data_out = {{26{1'b0}}, 1'b1, {28{fillchar}}};
               ((27 + offset) % 55):
                 data_out = {{27{1'b0}}, 1'b1, {27{fillchar}}};
               ((28 + offset) % 55):
                 data_out = {{28{1'b0}}, 1'b1, {26{fillchar}}};
               ((29 + offset) % 55):
                 data_out = {{29{1'b0}}, 1'b1, {25{fillchar}}};
               ((30 + offset) % 55):
                 data_out = {{30{1'b0}}, 1'b1, {24{fillchar}}};
               ((31 + offset) % 55):
                 data_out = {{31{1'b0}}, 1'b1, {23{fillchar}}};
               ((32 + offset) % 55):
                 data_out = {{32{1'b0}}, 1'b1, {22{fillchar}}};
               ((33 + offset) % 55):
                 data_out = {{33{1'b0}}, 1'b1, {21{fillchar}}};
               ((34 + offset) % 55):
                 data_out = {{34{1'b0}}, 1'b1, {20{fillchar}}};
               ((35 + offset) % 55):
                 data_out = {{35{1'b0}}, 1'b1, {19{fillchar}}};
               ((36 + offset) % 55):
                 data_out = {{36{1'b0}}, 1'b1, {18{fillchar}}};
               ((37 + offset) % 55):
                 data_out = {{37{1'b0}}, 1'b1, {17{fillchar}}};
               ((38 + offset) % 55):
                 data_out = {{38{1'b0}}, 1'b1, {16{fillchar}}};
               ((39 + offset) % 55):
                 data_out = {{39{1'b0}}, 1'b1, {15{fillchar}}};
               ((40 + offset) % 55):
                 data_out = {{40{1'b0}}, 1'b1, {14{fillchar}}};
               ((41 + offset) % 55):
                 data_out = {{41{1'b0}}, 1'b1, {13{fillchar}}};
               ((42 + offset) % 55):
                 data_out = {{42{1'b0}}, 1'b1, {12{fillchar}}};
               ((43 + offset) % 55):
                 data_out = {{43{1'b0}}, 1'b1, {11{fillchar}}};
               ((44 + offset) % 55):
                 data_out = {{44{1'b0}}, 1'b1, {10{fillchar}}};
               ((45 + offset) % 55):
                 data_out = {{45{1'b0}}, 1'b1, {9{fillchar}}};
               ((46 + offset) % 55):
                 data_out = {{46{1'b0}}, 1'b1, {8{fillchar}}};
               ((47 + offset) % 55):
                 data_out = {{47{1'b0}}, 1'b1, {7{fillchar}}};
               ((48 + offset) % 55):
                 data_out = {{48{1'b0}}, 1'b1, {6{fillchar}}};
               ((49 + offset) % 55):
                 data_out = {{49{1'b0}}, 1'b1, {5{fillchar}}};
               ((50 + offset) % 55):
                 data_out = {{50{1'b0}}, 1'b1, {4{fillchar}}};
               ((51 + offset) % 55):
                 data_out = {{51{1'b0}}, 1'b1, {3{fillchar}}};
               ((52 + offset) % 55):
                 data_out = {{52{1'b0}}, 1'b1, {2{fillchar}}};
               ((53 + offset) % 55):
                 data_out = {{53{1'b0}}, 1'b1, {1{fillchar}}};
               ((54 + offset) % 55):
                 data_out = {{54{1'b0}}, 1'b1};
               default:
                 data_out = {55{1'bx}};
             endcase
          end
      else if(num_ports == 56)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 56):
                 data_out = {1'b1, {55{fillchar}}};
               ((1 + offset) % 56):
                 data_out = {{1{1'b0}}, 1'b1, {54{fillchar}}};
               ((2 + offset) % 56):
                 data_out = {{2{1'b0}}, 1'b1, {53{fillchar}}};
               ((3 + offset) % 56):
                 data_out = {{3{1'b0}}, 1'b1, {52{fillchar}}};
               ((4 + offset) % 56):
                 data_out = {{4{1'b0}}, 1'b1, {51{fillchar}}};
               ((5 + offset) % 56):
                 data_out = {{5{1'b0}}, 1'b1, {50{fillchar}}};
               ((6 + offset) % 56):
                 data_out = {{6{1'b0}}, 1'b1, {49{fillchar}}};
               ((7 + offset) % 56):
                 data_out = {{7{1'b0}}, 1'b1, {48{fillchar}}};
               ((8 + offset) % 56):
                 data_out = {{8{1'b0}}, 1'b1, {47{fillchar}}};
               ((9 + offset) % 56):
                 data_out = {{9{1'b0}}, 1'b1, {46{fillchar}}};
               ((10 + offset) % 56):
                 data_out = {{10{1'b0}}, 1'b1, {45{fillchar}}};
               ((11 + offset) % 56):
                 data_out = {{11{1'b0}}, 1'b1, {44{fillchar}}};
               ((12 + offset) % 56):
                 data_out = {{12{1'b0}}, 1'b1, {43{fillchar}}};
               ((13 + offset) % 56):
                 data_out = {{13{1'b0}}, 1'b1, {42{fillchar}}};
               ((14 + offset) % 56):
                 data_out = {{14{1'b0}}, 1'b1, {41{fillchar}}};
               ((15 + offset) % 56):
                 data_out = {{15{1'b0}}, 1'b1, {40{fillchar}}};
               ((16 + offset) % 56):
                 data_out = {{16{1'b0}}, 1'b1, {39{fillchar}}};
               ((17 + offset) % 56):
                 data_out = {{17{1'b0}}, 1'b1, {38{fillchar}}};
               ((18 + offset) % 56):
                 data_out = {{18{1'b0}}, 1'b1, {37{fillchar}}};
               ((19 + offset) % 56):
                 data_out = {{19{1'b0}}, 1'b1, {36{fillchar}}};
               ((20 + offset) % 56):
                 data_out = {{20{1'b0}}, 1'b1, {35{fillchar}}};
               ((21 + offset) % 56):
                 data_out = {{21{1'b0}}, 1'b1, {34{fillchar}}};
               ((22 + offset) % 56):
                 data_out = {{22{1'b0}}, 1'b1, {33{fillchar}}};
               ((23 + offset) % 56):
                 data_out = {{23{1'b0}}, 1'b1, {32{fillchar}}};
               ((24 + offset) % 56):
                 data_out = {{24{1'b0}}, 1'b1, {31{fillchar}}};
               ((25 + offset) % 56):
                 data_out = {{25{1'b0}}, 1'b1, {30{fillchar}}};
               ((26 + offset) % 56):
                 data_out = {{26{1'b0}}, 1'b1, {29{fillchar}}};
               ((27 + offset) % 56):
                 data_out = {{27{1'b0}}, 1'b1, {28{fillchar}}};
               ((28 + offset) % 56):
                 data_out = {{28{1'b0}}, 1'b1, {27{fillchar}}};
               ((29 + offset) % 56):
                 data_out = {{29{1'b0}}, 1'b1, {26{fillchar}}};
               ((30 + offset) % 56):
                 data_out = {{30{1'b0}}, 1'b1, {25{fillchar}}};
               ((31 + offset) % 56):
                 data_out = {{31{1'b0}}, 1'b1, {24{fillchar}}};
               ((32 + offset) % 56):
                 data_out = {{32{1'b0}}, 1'b1, {23{fillchar}}};
               ((33 + offset) % 56):
                 data_out = {{33{1'b0}}, 1'b1, {22{fillchar}}};
               ((34 + offset) % 56):
                 data_out = {{34{1'b0}}, 1'b1, {21{fillchar}}};
               ((35 + offset) % 56):
                 data_out = {{35{1'b0}}, 1'b1, {20{fillchar}}};
               ((36 + offset) % 56):
                 data_out = {{36{1'b0}}, 1'b1, {19{fillchar}}};
               ((37 + offset) % 56):
                 data_out = {{37{1'b0}}, 1'b1, {18{fillchar}}};
               ((38 + offset) % 56):
                 data_out = {{38{1'b0}}, 1'b1, {17{fillchar}}};
               ((39 + offset) % 56):
                 data_out = {{39{1'b0}}, 1'b1, {16{fillchar}}};
               ((40 + offset) % 56):
                 data_out = {{40{1'b0}}, 1'b1, {15{fillchar}}};
               ((41 + offset) % 56):
                 data_out = {{41{1'b0}}, 1'b1, {14{fillchar}}};
               ((42 + offset) % 56):
                 data_out = {{42{1'b0}}, 1'b1, {13{fillchar}}};
               ((43 + offset) % 56):
                 data_out = {{43{1'b0}}, 1'b1, {12{fillchar}}};
               ((44 + offset) % 56):
                 data_out = {{44{1'b0}}, 1'b1, {11{fillchar}}};
               ((45 + offset) % 56):
                 data_out = {{45{1'b0}}, 1'b1, {10{fillchar}}};
               ((46 + offset) % 56):
                 data_out = {{46{1'b0}}, 1'b1, {9{fillchar}}};
               ((47 + offset) % 56):
                 data_out = {{47{1'b0}}, 1'b1, {8{fillchar}}};
               ((48 + offset) % 56):
                 data_out = {{48{1'b0}}, 1'b1, {7{fillchar}}};
               ((49 + offset) % 56):
                 data_out = {{49{1'b0}}, 1'b1, {6{fillchar}}};
               ((50 + offset) % 56):
                 data_out = {{50{1'b0}}, 1'b1, {5{fillchar}}};
               ((51 + offset) % 56):
                 data_out = {{51{1'b0}}, 1'b1, {4{fillchar}}};
               ((52 + offset) % 56):
                 data_out = {{52{1'b0}}, 1'b1, {3{fillchar}}};
               ((53 + offset) % 56):
                 data_out = {{53{1'b0}}, 1'b1, {2{fillchar}}};
               ((54 + offset) % 56):
                 data_out = {{54{1'b0}}, 1'b1, {1{fillchar}}};
               ((55 + offset) % 56):
                 data_out = {{55{1'b0}}, 1'b1};
               default:
                 data_out = {56{1'bx}};
             endcase
          end
      else if(num_ports == 57)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 57):
                 data_out = {1'b1, {56{fillchar}}};
               ((1 + offset) % 57):
                 data_out = {{1{1'b0}}, 1'b1, {55{fillchar}}};
               ((2 + offset) % 57):
                 data_out = {{2{1'b0}}, 1'b1, {54{fillchar}}};
               ((3 + offset) % 57):
                 data_out = {{3{1'b0}}, 1'b1, {53{fillchar}}};
               ((4 + offset) % 57):
                 data_out = {{4{1'b0}}, 1'b1, {52{fillchar}}};
               ((5 + offset) % 57):
                 data_out = {{5{1'b0}}, 1'b1, {51{fillchar}}};
               ((6 + offset) % 57):
                 data_out = {{6{1'b0}}, 1'b1, {50{fillchar}}};
               ((7 + offset) % 57):
                 data_out = {{7{1'b0}}, 1'b1, {49{fillchar}}};
               ((8 + offset) % 57):
                 data_out = {{8{1'b0}}, 1'b1, {48{fillchar}}};
               ((9 + offset) % 57):
                 data_out = {{9{1'b0}}, 1'b1, {47{fillchar}}};
               ((10 + offset) % 57):
                 data_out = {{10{1'b0}}, 1'b1, {46{fillchar}}};
               ((11 + offset) % 57):
                 data_out = {{11{1'b0}}, 1'b1, {45{fillchar}}};
               ((12 + offset) % 57):
                 data_out = {{12{1'b0}}, 1'b1, {44{fillchar}}};
               ((13 + offset) % 57):
                 data_out = {{13{1'b0}}, 1'b1, {43{fillchar}}};
               ((14 + offset) % 57):
                 data_out = {{14{1'b0}}, 1'b1, {42{fillchar}}};
               ((15 + offset) % 57):
                 data_out = {{15{1'b0}}, 1'b1, {41{fillchar}}};
               ((16 + offset) % 57):
                 data_out = {{16{1'b0}}, 1'b1, {40{fillchar}}};
               ((17 + offset) % 57):
                 data_out = {{17{1'b0}}, 1'b1, {39{fillchar}}};
               ((18 + offset) % 57):
                 data_out = {{18{1'b0}}, 1'b1, {38{fillchar}}};
               ((19 + offset) % 57):
                 data_out = {{19{1'b0}}, 1'b1, {37{fillchar}}};
               ((20 + offset) % 57):
                 data_out = {{20{1'b0}}, 1'b1, {36{fillchar}}};
               ((21 + offset) % 57):
                 data_out = {{21{1'b0}}, 1'b1, {35{fillchar}}};
               ((22 + offset) % 57):
                 data_out = {{22{1'b0}}, 1'b1, {34{fillchar}}};
               ((23 + offset) % 57):
                 data_out = {{23{1'b0}}, 1'b1, {33{fillchar}}};
               ((24 + offset) % 57):
                 data_out = {{24{1'b0}}, 1'b1, {32{fillchar}}};
               ((25 + offset) % 57):
                 data_out = {{25{1'b0}}, 1'b1, {31{fillchar}}};
               ((26 + offset) % 57):
                 data_out = {{26{1'b0}}, 1'b1, {30{fillchar}}};
               ((27 + offset) % 57):
                 data_out = {{27{1'b0}}, 1'b1, {29{fillchar}}};
               ((28 + offset) % 57):
                 data_out = {{28{1'b0}}, 1'b1, {28{fillchar}}};
               ((29 + offset) % 57):
                 data_out = {{29{1'b0}}, 1'b1, {27{fillchar}}};
               ((30 + offset) % 57):
                 data_out = {{30{1'b0}}, 1'b1, {26{fillchar}}};
               ((31 + offset) % 57):
                 data_out = {{31{1'b0}}, 1'b1, {25{fillchar}}};
               ((32 + offset) % 57):
                 data_out = {{32{1'b0}}, 1'b1, {24{fillchar}}};
               ((33 + offset) % 57):
                 data_out = {{33{1'b0}}, 1'b1, {23{fillchar}}};
               ((34 + offset) % 57):
                 data_out = {{34{1'b0}}, 1'b1, {22{fillchar}}};
               ((35 + offset) % 57):
                 data_out = {{35{1'b0}}, 1'b1, {21{fillchar}}};
               ((36 + offset) % 57):
                 data_out = {{36{1'b0}}, 1'b1, {20{fillchar}}};
               ((37 + offset) % 57):
                 data_out = {{37{1'b0}}, 1'b1, {19{fillchar}}};
               ((38 + offset) % 57):
                 data_out = {{38{1'b0}}, 1'b1, {18{fillchar}}};
               ((39 + offset) % 57):
                 data_out = {{39{1'b0}}, 1'b1, {17{fillchar}}};
               ((40 + offset) % 57):
                 data_out = {{40{1'b0}}, 1'b1, {16{fillchar}}};
               ((41 + offset) % 57):
                 data_out = {{41{1'b0}}, 1'b1, {15{fillchar}}};
               ((42 + offset) % 57):
                 data_out = {{42{1'b0}}, 1'b1, {14{fillchar}}};
               ((43 + offset) % 57):
                 data_out = {{43{1'b0}}, 1'b1, {13{fillchar}}};
               ((44 + offset) % 57):
                 data_out = {{44{1'b0}}, 1'b1, {12{fillchar}}};
               ((45 + offset) % 57):
                 data_out = {{45{1'b0}}, 1'b1, {11{fillchar}}};
               ((46 + offset) % 57):
                 data_out = {{46{1'b0}}, 1'b1, {10{fillchar}}};
               ((47 + offset) % 57):
                 data_out = {{47{1'b0}}, 1'b1, {9{fillchar}}};
               ((48 + offset) % 57):
                 data_out = {{48{1'b0}}, 1'b1, {8{fillchar}}};
               ((49 + offset) % 57):
                 data_out = {{49{1'b0}}, 1'b1, {7{fillchar}}};
               ((50 + offset) % 57):
                 data_out = {{50{1'b0}}, 1'b1, {6{fillchar}}};
               ((51 + offset) % 57):
                 data_out = {{51{1'b0}}, 1'b1, {5{fillchar}}};
               ((52 + offset) % 57):
                 data_out = {{52{1'b0}}, 1'b1, {4{fillchar}}};
               ((53 + offset) % 57):
                 data_out = {{53{1'b0}}, 1'b1, {3{fillchar}}};
               ((54 + offset) % 57):
                 data_out = {{54{1'b0}}, 1'b1, {2{fillchar}}};
               ((55 + offset) % 57):
                 data_out = {{55{1'b0}}, 1'b1, {1{fillchar}}};
               ((56 + offset) % 57):
                 data_out = {{56{1'b0}}, 1'b1};
               default:
                 data_out = {57{1'bx}};
             endcase
          end
      else if(num_ports == 58)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 58):
                 data_out = {1'b1, {57{fillchar}}};
               ((1 + offset) % 58):
                 data_out = {{1{1'b0}}, 1'b1, {56{fillchar}}};
               ((2 + offset) % 58):
                 data_out = {{2{1'b0}}, 1'b1, {55{fillchar}}};
               ((3 + offset) % 58):
                 data_out = {{3{1'b0}}, 1'b1, {54{fillchar}}};
               ((4 + offset) % 58):
                 data_out = {{4{1'b0}}, 1'b1, {53{fillchar}}};
               ((5 + offset) % 58):
                 data_out = {{5{1'b0}}, 1'b1, {52{fillchar}}};
               ((6 + offset) % 58):
                 data_out = {{6{1'b0}}, 1'b1, {51{fillchar}}};
               ((7 + offset) % 58):
                 data_out = {{7{1'b0}}, 1'b1, {50{fillchar}}};
               ((8 + offset) % 58):
                 data_out = {{8{1'b0}}, 1'b1, {49{fillchar}}};
               ((9 + offset) % 58):
                 data_out = {{9{1'b0}}, 1'b1, {48{fillchar}}};
               ((10 + offset) % 58):
                 data_out = {{10{1'b0}}, 1'b1, {47{fillchar}}};
               ((11 + offset) % 58):
                 data_out = {{11{1'b0}}, 1'b1, {46{fillchar}}};
               ((12 + offset) % 58):
                 data_out = {{12{1'b0}}, 1'b1, {45{fillchar}}};
               ((13 + offset) % 58):
                 data_out = {{13{1'b0}}, 1'b1, {44{fillchar}}};
               ((14 + offset) % 58):
                 data_out = {{14{1'b0}}, 1'b1, {43{fillchar}}};
               ((15 + offset) % 58):
                 data_out = {{15{1'b0}}, 1'b1, {42{fillchar}}};
               ((16 + offset) % 58):
                 data_out = {{16{1'b0}}, 1'b1, {41{fillchar}}};
               ((17 + offset) % 58):
                 data_out = {{17{1'b0}}, 1'b1, {40{fillchar}}};
               ((18 + offset) % 58):
                 data_out = {{18{1'b0}}, 1'b1, {39{fillchar}}};
               ((19 + offset) % 58):
                 data_out = {{19{1'b0}}, 1'b1, {38{fillchar}}};
               ((20 + offset) % 58):
                 data_out = {{20{1'b0}}, 1'b1, {37{fillchar}}};
               ((21 + offset) % 58):
                 data_out = {{21{1'b0}}, 1'b1, {36{fillchar}}};
               ((22 + offset) % 58):
                 data_out = {{22{1'b0}}, 1'b1, {35{fillchar}}};
               ((23 + offset) % 58):
                 data_out = {{23{1'b0}}, 1'b1, {34{fillchar}}};
               ((24 + offset) % 58):
                 data_out = {{24{1'b0}}, 1'b1, {33{fillchar}}};
               ((25 + offset) % 58):
                 data_out = {{25{1'b0}}, 1'b1, {32{fillchar}}};
               ((26 + offset) % 58):
                 data_out = {{26{1'b0}}, 1'b1, {31{fillchar}}};
               ((27 + offset) % 58):
                 data_out = {{27{1'b0}}, 1'b1, {30{fillchar}}};
               ((28 + offset) % 58):
                 data_out = {{28{1'b0}}, 1'b1, {29{fillchar}}};
               ((29 + offset) % 58):
                 data_out = {{29{1'b0}}, 1'b1, {28{fillchar}}};
               ((30 + offset) % 58):
                 data_out = {{30{1'b0}}, 1'b1, {27{fillchar}}};
               ((31 + offset) % 58):
                 data_out = {{31{1'b0}}, 1'b1, {26{fillchar}}};
               ((32 + offset) % 58):
                 data_out = {{32{1'b0}}, 1'b1, {25{fillchar}}};
               ((33 + offset) % 58):
                 data_out = {{33{1'b0}}, 1'b1, {24{fillchar}}};
               ((34 + offset) % 58):
                 data_out = {{34{1'b0}}, 1'b1, {23{fillchar}}};
               ((35 + offset) % 58):
                 data_out = {{35{1'b0}}, 1'b1, {22{fillchar}}};
               ((36 + offset) % 58):
                 data_out = {{36{1'b0}}, 1'b1, {21{fillchar}}};
               ((37 + offset) % 58):
                 data_out = {{37{1'b0}}, 1'b1, {20{fillchar}}};
               ((38 + offset) % 58):
                 data_out = {{38{1'b0}}, 1'b1, {19{fillchar}}};
               ((39 + offset) % 58):
                 data_out = {{39{1'b0}}, 1'b1, {18{fillchar}}};
               ((40 + offset) % 58):
                 data_out = {{40{1'b0}}, 1'b1, {17{fillchar}}};
               ((41 + offset) % 58):
                 data_out = {{41{1'b0}}, 1'b1, {16{fillchar}}};
               ((42 + offset) % 58):
                 data_out = {{42{1'b0}}, 1'b1, {15{fillchar}}};
               ((43 + offset) % 58):
                 data_out = {{43{1'b0}}, 1'b1, {14{fillchar}}};
               ((44 + offset) % 58):
                 data_out = {{44{1'b0}}, 1'b1, {13{fillchar}}};
               ((45 + offset) % 58):
                 data_out = {{45{1'b0}}, 1'b1, {12{fillchar}}};
               ((46 + offset) % 58):
                 data_out = {{46{1'b0}}, 1'b1, {11{fillchar}}};
               ((47 + offset) % 58):
                 data_out = {{47{1'b0}}, 1'b1, {10{fillchar}}};
               ((48 + offset) % 58):
                 data_out = {{48{1'b0}}, 1'b1, {9{fillchar}}};
               ((49 + offset) % 58):
                 data_out = {{49{1'b0}}, 1'b1, {8{fillchar}}};
               ((50 + offset) % 58):
                 data_out = {{50{1'b0}}, 1'b1, {7{fillchar}}};
               ((51 + offset) % 58):
                 data_out = {{51{1'b0}}, 1'b1, {6{fillchar}}};
               ((52 + offset) % 58):
                 data_out = {{52{1'b0}}, 1'b1, {5{fillchar}}};
               ((53 + offset) % 58):
                 data_out = {{53{1'b0}}, 1'b1, {4{fillchar}}};
               ((54 + offset) % 58):
                 data_out = {{54{1'b0}}, 1'b1, {3{fillchar}}};
               ((55 + offset) % 58):
                 data_out = {{55{1'b0}}, 1'b1, {2{fillchar}}};
               ((56 + offset) % 58):
                 data_out = {{56{1'b0}}, 1'b1, {1{fillchar}}};
               ((57 + offset) % 58):
                 data_out = {{57{1'b0}}, 1'b1};
               default:
                 data_out = {58{1'bx}};
             endcase
          end
      else if(num_ports == 59)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 59):
                 data_out = {1'b1, {58{fillchar}}};
               ((1 + offset) % 59):
                 data_out = {{1{1'b0}}, 1'b1, {57{fillchar}}};
               ((2 + offset) % 59):
                 data_out = {{2{1'b0}}, 1'b1, {56{fillchar}}};
               ((3 + offset) % 59):
                 data_out = {{3{1'b0}}, 1'b1, {55{fillchar}}};
               ((4 + offset) % 59):
                 data_out = {{4{1'b0}}, 1'b1, {54{fillchar}}};
               ((5 + offset) % 59):
                 data_out = {{5{1'b0}}, 1'b1, {53{fillchar}}};
               ((6 + offset) % 59):
                 data_out = {{6{1'b0}}, 1'b1, {52{fillchar}}};
               ((7 + offset) % 59):
                 data_out = {{7{1'b0}}, 1'b1, {51{fillchar}}};
               ((8 + offset) % 59):
                 data_out = {{8{1'b0}}, 1'b1, {50{fillchar}}};
               ((9 + offset) % 59):
                 data_out = {{9{1'b0}}, 1'b1, {49{fillchar}}};
               ((10 + offset) % 59):
                 data_out = {{10{1'b0}}, 1'b1, {48{fillchar}}};
               ((11 + offset) % 59):
                 data_out = {{11{1'b0}}, 1'b1, {47{fillchar}}};
               ((12 + offset) % 59):
                 data_out = {{12{1'b0}}, 1'b1, {46{fillchar}}};
               ((13 + offset) % 59):
                 data_out = {{13{1'b0}}, 1'b1, {45{fillchar}}};
               ((14 + offset) % 59):
                 data_out = {{14{1'b0}}, 1'b1, {44{fillchar}}};
               ((15 + offset) % 59):
                 data_out = {{15{1'b0}}, 1'b1, {43{fillchar}}};
               ((16 + offset) % 59):
                 data_out = {{16{1'b0}}, 1'b1, {42{fillchar}}};
               ((17 + offset) % 59):
                 data_out = {{17{1'b0}}, 1'b1, {41{fillchar}}};
               ((18 + offset) % 59):
                 data_out = {{18{1'b0}}, 1'b1, {40{fillchar}}};
               ((19 + offset) % 59):
                 data_out = {{19{1'b0}}, 1'b1, {39{fillchar}}};
               ((20 + offset) % 59):
                 data_out = {{20{1'b0}}, 1'b1, {38{fillchar}}};
               ((21 + offset) % 59):
                 data_out = {{21{1'b0}}, 1'b1, {37{fillchar}}};
               ((22 + offset) % 59):
                 data_out = {{22{1'b0}}, 1'b1, {36{fillchar}}};
               ((23 + offset) % 59):
                 data_out = {{23{1'b0}}, 1'b1, {35{fillchar}}};
               ((24 + offset) % 59):
                 data_out = {{24{1'b0}}, 1'b1, {34{fillchar}}};
               ((25 + offset) % 59):
                 data_out = {{25{1'b0}}, 1'b1, {33{fillchar}}};
               ((26 + offset) % 59):
                 data_out = {{26{1'b0}}, 1'b1, {32{fillchar}}};
               ((27 + offset) % 59):
                 data_out = {{27{1'b0}}, 1'b1, {31{fillchar}}};
               ((28 + offset) % 59):
                 data_out = {{28{1'b0}}, 1'b1, {30{fillchar}}};
               ((29 + offset) % 59):
                 data_out = {{29{1'b0}}, 1'b1, {29{fillchar}}};
               ((30 + offset) % 59):
                 data_out = {{30{1'b0}}, 1'b1, {28{fillchar}}};
               ((31 + offset) % 59):
                 data_out = {{31{1'b0}}, 1'b1, {27{fillchar}}};
               ((32 + offset) % 59):
                 data_out = {{32{1'b0}}, 1'b1, {26{fillchar}}};
               ((33 + offset) % 59):
                 data_out = {{33{1'b0}}, 1'b1, {25{fillchar}}};
               ((34 + offset) % 59):
                 data_out = {{34{1'b0}}, 1'b1, {24{fillchar}}};
               ((35 + offset) % 59):
                 data_out = {{35{1'b0}}, 1'b1, {23{fillchar}}};
               ((36 + offset) % 59):
                 data_out = {{36{1'b0}}, 1'b1, {22{fillchar}}};
               ((37 + offset) % 59):
                 data_out = {{37{1'b0}}, 1'b1, {21{fillchar}}};
               ((38 + offset) % 59):
                 data_out = {{38{1'b0}}, 1'b1, {20{fillchar}}};
               ((39 + offset) % 59):
                 data_out = {{39{1'b0}}, 1'b1, {19{fillchar}}};
               ((40 + offset) % 59):
                 data_out = {{40{1'b0}}, 1'b1, {18{fillchar}}};
               ((41 + offset) % 59):
                 data_out = {{41{1'b0}}, 1'b1, {17{fillchar}}};
               ((42 + offset) % 59):
                 data_out = {{42{1'b0}}, 1'b1, {16{fillchar}}};
               ((43 + offset) % 59):
                 data_out = {{43{1'b0}}, 1'b1, {15{fillchar}}};
               ((44 + offset) % 59):
                 data_out = {{44{1'b0}}, 1'b1, {14{fillchar}}};
               ((45 + offset) % 59):
                 data_out = {{45{1'b0}}, 1'b1, {13{fillchar}}};
               ((46 + offset) % 59):
                 data_out = {{46{1'b0}}, 1'b1, {12{fillchar}}};
               ((47 + offset) % 59):
                 data_out = {{47{1'b0}}, 1'b1, {11{fillchar}}};
               ((48 + offset) % 59):
                 data_out = {{48{1'b0}}, 1'b1, {10{fillchar}}};
               ((49 + offset) % 59):
                 data_out = {{49{1'b0}}, 1'b1, {9{fillchar}}};
               ((50 + offset) % 59):
                 data_out = {{50{1'b0}}, 1'b1, {8{fillchar}}};
               ((51 + offset) % 59):
                 data_out = {{51{1'b0}}, 1'b1, {7{fillchar}}};
               ((52 + offset) % 59):
                 data_out = {{52{1'b0}}, 1'b1, {6{fillchar}}};
               ((53 + offset) % 59):
                 data_out = {{53{1'b0}}, 1'b1, {5{fillchar}}};
               ((54 + offset) % 59):
                 data_out = {{54{1'b0}}, 1'b1, {4{fillchar}}};
               ((55 + offset) % 59):
                 data_out = {{55{1'b0}}, 1'b1, {3{fillchar}}};
               ((56 + offset) % 59):
                 data_out = {{56{1'b0}}, 1'b1, {2{fillchar}}};
               ((57 + offset) % 59):
                 data_out = {{57{1'b0}}, 1'b1, {1{fillchar}}};
               ((58 + offset) % 59):
                 data_out = {{58{1'b0}}, 1'b1};
               default:
                 data_out = {59{1'bx}};
             endcase
          end
      else if(num_ports == 60)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 60):
                 data_out = {1'b1, {59{fillchar}}};
               ((1 + offset) % 60):
                 data_out = {{1{1'b0}}, 1'b1, {58{fillchar}}};
               ((2 + offset) % 60):
                 data_out = {{2{1'b0}}, 1'b1, {57{fillchar}}};
               ((3 + offset) % 60):
                 data_out = {{3{1'b0}}, 1'b1, {56{fillchar}}};
               ((4 + offset) % 60):
                 data_out = {{4{1'b0}}, 1'b1, {55{fillchar}}};
               ((5 + offset) % 60):
                 data_out = {{5{1'b0}}, 1'b1, {54{fillchar}}};
               ((6 + offset) % 60):
                 data_out = {{6{1'b0}}, 1'b1, {53{fillchar}}};
               ((7 + offset) % 60):
                 data_out = {{7{1'b0}}, 1'b1, {52{fillchar}}};
               ((8 + offset) % 60):
                 data_out = {{8{1'b0}}, 1'b1, {51{fillchar}}};
               ((9 + offset) % 60):
                 data_out = {{9{1'b0}}, 1'b1, {50{fillchar}}};
               ((10 + offset) % 60):
                 data_out = {{10{1'b0}}, 1'b1, {49{fillchar}}};
               ((11 + offset) % 60):
                 data_out = {{11{1'b0}}, 1'b1, {48{fillchar}}};
               ((12 + offset) % 60):
                 data_out = {{12{1'b0}}, 1'b1, {47{fillchar}}};
               ((13 + offset) % 60):
                 data_out = {{13{1'b0}}, 1'b1, {46{fillchar}}};
               ((14 + offset) % 60):
                 data_out = {{14{1'b0}}, 1'b1, {45{fillchar}}};
               ((15 + offset) % 60):
                 data_out = {{15{1'b0}}, 1'b1, {44{fillchar}}};
               ((16 + offset) % 60):
                 data_out = {{16{1'b0}}, 1'b1, {43{fillchar}}};
               ((17 + offset) % 60):
                 data_out = {{17{1'b0}}, 1'b1, {42{fillchar}}};
               ((18 + offset) % 60):
                 data_out = {{18{1'b0}}, 1'b1, {41{fillchar}}};
               ((19 + offset) % 60):
                 data_out = {{19{1'b0}}, 1'b1, {40{fillchar}}};
               ((20 + offset) % 60):
                 data_out = {{20{1'b0}}, 1'b1, {39{fillchar}}};
               ((21 + offset) % 60):
                 data_out = {{21{1'b0}}, 1'b1, {38{fillchar}}};
               ((22 + offset) % 60):
                 data_out = {{22{1'b0}}, 1'b1, {37{fillchar}}};
               ((23 + offset) % 60):
                 data_out = {{23{1'b0}}, 1'b1, {36{fillchar}}};
               ((24 + offset) % 60):
                 data_out = {{24{1'b0}}, 1'b1, {35{fillchar}}};
               ((25 + offset) % 60):
                 data_out = {{25{1'b0}}, 1'b1, {34{fillchar}}};
               ((26 + offset) % 60):
                 data_out = {{26{1'b0}}, 1'b1, {33{fillchar}}};
               ((27 + offset) % 60):
                 data_out = {{27{1'b0}}, 1'b1, {32{fillchar}}};
               ((28 + offset) % 60):
                 data_out = {{28{1'b0}}, 1'b1, {31{fillchar}}};
               ((29 + offset) % 60):
                 data_out = {{29{1'b0}}, 1'b1, {30{fillchar}}};
               ((30 + offset) % 60):
                 data_out = {{30{1'b0}}, 1'b1, {29{fillchar}}};
               ((31 + offset) % 60):
                 data_out = {{31{1'b0}}, 1'b1, {28{fillchar}}};
               ((32 + offset) % 60):
                 data_out = {{32{1'b0}}, 1'b1, {27{fillchar}}};
               ((33 + offset) % 60):
                 data_out = {{33{1'b0}}, 1'b1, {26{fillchar}}};
               ((34 + offset) % 60):
                 data_out = {{34{1'b0}}, 1'b1, {25{fillchar}}};
               ((35 + offset) % 60):
                 data_out = {{35{1'b0}}, 1'b1, {24{fillchar}}};
               ((36 + offset) % 60):
                 data_out = {{36{1'b0}}, 1'b1, {23{fillchar}}};
               ((37 + offset) % 60):
                 data_out = {{37{1'b0}}, 1'b1, {22{fillchar}}};
               ((38 + offset) % 60):
                 data_out = {{38{1'b0}}, 1'b1, {21{fillchar}}};
               ((39 + offset) % 60):
                 data_out = {{39{1'b0}}, 1'b1, {20{fillchar}}};
               ((40 + offset) % 60):
                 data_out = {{40{1'b0}}, 1'b1, {19{fillchar}}};
               ((41 + offset) % 60):
                 data_out = {{41{1'b0}}, 1'b1, {18{fillchar}}};
               ((42 + offset) % 60):
                 data_out = {{42{1'b0}}, 1'b1, {17{fillchar}}};
               ((43 + offset) % 60):
                 data_out = {{43{1'b0}}, 1'b1, {16{fillchar}}};
               ((44 + offset) % 60):
                 data_out = {{44{1'b0}}, 1'b1, {15{fillchar}}};
               ((45 + offset) % 60):
                 data_out = {{45{1'b0}}, 1'b1, {14{fillchar}}};
               ((46 + offset) % 60):
                 data_out = {{46{1'b0}}, 1'b1, {13{fillchar}}};
               ((47 + offset) % 60):
                 data_out = {{47{1'b0}}, 1'b1, {12{fillchar}}};
               ((48 + offset) % 60):
                 data_out = {{48{1'b0}}, 1'b1, {11{fillchar}}};
               ((49 + offset) % 60):
                 data_out = {{49{1'b0}}, 1'b1, {10{fillchar}}};
               ((50 + offset) % 60):
                 data_out = {{50{1'b0}}, 1'b1, {9{fillchar}}};
               ((51 + offset) % 60):
                 data_out = {{51{1'b0}}, 1'b1, {8{fillchar}}};
               ((52 + offset) % 60):
                 data_out = {{52{1'b0}}, 1'b1, {7{fillchar}}};
               ((53 + offset) % 60):
                 data_out = {{53{1'b0}}, 1'b1, {6{fillchar}}};
               ((54 + offset) % 60):
                 data_out = {{54{1'b0}}, 1'b1, {5{fillchar}}};
               ((55 + offset) % 60):
                 data_out = {{55{1'b0}}, 1'b1, {4{fillchar}}};
               ((56 + offset) % 60):
                 data_out = {{56{1'b0}}, 1'b1, {3{fillchar}}};
               ((57 + offset) % 60):
                 data_out = {{57{1'b0}}, 1'b1, {2{fillchar}}};
               ((58 + offset) % 60):
                 data_out = {{58{1'b0}}, 1'b1, {1{fillchar}}};
               ((59 + offset) % 60):
                 data_out = {{59{1'b0}}, 1'b1};
               default:
                 data_out = {60{1'bx}};
             endcase
          end
      else if(num_ports == 61)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 61):
                 data_out = {1'b1, {60{fillchar}}};
               ((1 + offset) % 61):
                 data_out = {{1{1'b0}}, 1'b1, {59{fillchar}}};
               ((2 + offset) % 61):
                 data_out = {{2{1'b0}}, 1'b1, {58{fillchar}}};
               ((3 + offset) % 61):
                 data_out = {{3{1'b0}}, 1'b1, {57{fillchar}}};
               ((4 + offset) % 61):
                 data_out = {{4{1'b0}}, 1'b1, {56{fillchar}}};
               ((5 + offset) % 61):
                 data_out = {{5{1'b0}}, 1'b1, {55{fillchar}}};
               ((6 + offset) % 61):
                 data_out = {{6{1'b0}}, 1'b1, {54{fillchar}}};
               ((7 + offset) % 61):
                 data_out = {{7{1'b0}}, 1'b1, {53{fillchar}}};
               ((8 + offset) % 61):
                 data_out = {{8{1'b0}}, 1'b1, {52{fillchar}}};
               ((9 + offset) % 61):
                 data_out = {{9{1'b0}}, 1'b1, {51{fillchar}}};
               ((10 + offset) % 61):
                 data_out = {{10{1'b0}}, 1'b1, {50{fillchar}}};
               ((11 + offset) % 61):
                 data_out = {{11{1'b0}}, 1'b1, {49{fillchar}}};
               ((12 + offset) % 61):
                 data_out = {{12{1'b0}}, 1'b1, {48{fillchar}}};
               ((13 + offset) % 61):
                 data_out = {{13{1'b0}}, 1'b1, {47{fillchar}}};
               ((14 + offset) % 61):
                 data_out = {{14{1'b0}}, 1'b1, {46{fillchar}}};
               ((15 + offset) % 61):
                 data_out = {{15{1'b0}}, 1'b1, {45{fillchar}}};
               ((16 + offset) % 61):
                 data_out = {{16{1'b0}}, 1'b1, {44{fillchar}}};
               ((17 + offset) % 61):
                 data_out = {{17{1'b0}}, 1'b1, {43{fillchar}}};
               ((18 + offset) % 61):
                 data_out = {{18{1'b0}}, 1'b1, {42{fillchar}}};
               ((19 + offset) % 61):
                 data_out = {{19{1'b0}}, 1'b1, {41{fillchar}}};
               ((20 + offset) % 61):
                 data_out = {{20{1'b0}}, 1'b1, {40{fillchar}}};
               ((21 + offset) % 61):
                 data_out = {{21{1'b0}}, 1'b1, {39{fillchar}}};
               ((22 + offset) % 61):
                 data_out = {{22{1'b0}}, 1'b1, {38{fillchar}}};
               ((23 + offset) % 61):
                 data_out = {{23{1'b0}}, 1'b1, {37{fillchar}}};
               ((24 + offset) % 61):
                 data_out = {{24{1'b0}}, 1'b1, {36{fillchar}}};
               ((25 + offset) % 61):
                 data_out = {{25{1'b0}}, 1'b1, {35{fillchar}}};
               ((26 + offset) % 61):
                 data_out = {{26{1'b0}}, 1'b1, {34{fillchar}}};
               ((27 + offset) % 61):
                 data_out = {{27{1'b0}}, 1'b1, {33{fillchar}}};
               ((28 + offset) % 61):
                 data_out = {{28{1'b0}}, 1'b1, {32{fillchar}}};
               ((29 + offset) % 61):
                 data_out = {{29{1'b0}}, 1'b1, {31{fillchar}}};
               ((30 + offset) % 61):
                 data_out = {{30{1'b0}}, 1'b1, {30{fillchar}}};
               ((31 + offset) % 61):
                 data_out = {{31{1'b0}}, 1'b1, {29{fillchar}}};
               ((32 + offset) % 61):
                 data_out = {{32{1'b0}}, 1'b1, {28{fillchar}}};
               ((33 + offset) % 61):
                 data_out = {{33{1'b0}}, 1'b1, {27{fillchar}}};
               ((34 + offset) % 61):
                 data_out = {{34{1'b0}}, 1'b1, {26{fillchar}}};
               ((35 + offset) % 61):
                 data_out = {{35{1'b0}}, 1'b1, {25{fillchar}}};
               ((36 + offset) % 61):
                 data_out = {{36{1'b0}}, 1'b1, {24{fillchar}}};
               ((37 + offset) % 61):
                 data_out = {{37{1'b0}}, 1'b1, {23{fillchar}}};
               ((38 + offset) % 61):
                 data_out = {{38{1'b0}}, 1'b1, {22{fillchar}}};
               ((39 + offset) % 61):
                 data_out = {{39{1'b0}}, 1'b1, {21{fillchar}}};
               ((40 + offset) % 61):
                 data_out = {{40{1'b0}}, 1'b1, {20{fillchar}}};
               ((41 + offset) % 61):
                 data_out = {{41{1'b0}}, 1'b1, {19{fillchar}}};
               ((42 + offset) % 61):
                 data_out = {{42{1'b0}}, 1'b1, {18{fillchar}}};
               ((43 + offset) % 61):
                 data_out = {{43{1'b0}}, 1'b1, {17{fillchar}}};
               ((44 + offset) % 61):
                 data_out = {{44{1'b0}}, 1'b1, {16{fillchar}}};
               ((45 + offset) % 61):
                 data_out = {{45{1'b0}}, 1'b1, {15{fillchar}}};
               ((46 + offset) % 61):
                 data_out = {{46{1'b0}}, 1'b1, {14{fillchar}}};
               ((47 + offset) % 61):
                 data_out = {{47{1'b0}}, 1'b1, {13{fillchar}}};
               ((48 + offset) % 61):
                 data_out = {{48{1'b0}}, 1'b1, {12{fillchar}}};
               ((49 + offset) % 61):
                 data_out = {{49{1'b0}}, 1'b1, {11{fillchar}}};
               ((50 + offset) % 61):
                 data_out = {{50{1'b0}}, 1'b1, {10{fillchar}}};
               ((51 + offset) % 61):
                 data_out = {{51{1'b0}}, 1'b1, {9{fillchar}}};
               ((52 + offset) % 61):
                 data_out = {{52{1'b0}}, 1'b1, {8{fillchar}}};
               ((53 + offset) % 61):
                 data_out = {{53{1'b0}}, 1'b1, {7{fillchar}}};
               ((54 + offset) % 61):
                 data_out = {{54{1'b0}}, 1'b1, {6{fillchar}}};
               ((55 + offset) % 61):
                 data_out = {{55{1'b0}}, 1'b1, {5{fillchar}}};
               ((56 + offset) % 61):
                 data_out = {{56{1'b0}}, 1'b1, {4{fillchar}}};
               ((57 + offset) % 61):
                 data_out = {{57{1'b0}}, 1'b1, {3{fillchar}}};
               ((58 + offset) % 61):
                 data_out = {{58{1'b0}}, 1'b1, {2{fillchar}}};
               ((59 + offset) % 61):
                 data_out = {{59{1'b0}}, 1'b1, {1{fillchar}}};
               ((60 + offset) % 61):
                 data_out = {{60{1'b0}}, 1'b1};
               default:
                 data_out = {61{1'bx}};
             endcase
          end
      else if(num_ports == 62)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 62):
                 data_out = {1'b1, {61{fillchar}}};
               ((1 + offset) % 62):
                 data_out = {{1{1'b0}}, 1'b1, {60{fillchar}}};
               ((2 + offset) % 62):
                 data_out = {{2{1'b0}}, 1'b1, {59{fillchar}}};
               ((3 + offset) % 62):
                 data_out = {{3{1'b0}}, 1'b1, {58{fillchar}}};
               ((4 + offset) % 62):
                 data_out = {{4{1'b0}}, 1'b1, {57{fillchar}}};
               ((5 + offset) % 62):
                 data_out = {{5{1'b0}}, 1'b1, {56{fillchar}}};
               ((6 + offset) % 62):
                 data_out = {{6{1'b0}}, 1'b1, {55{fillchar}}};
               ((7 + offset) % 62):
                 data_out = {{7{1'b0}}, 1'b1, {54{fillchar}}};
               ((8 + offset) % 62):
                 data_out = {{8{1'b0}}, 1'b1, {53{fillchar}}};
               ((9 + offset) % 62):
                 data_out = {{9{1'b0}}, 1'b1, {52{fillchar}}};
               ((10 + offset) % 62):
                 data_out = {{10{1'b0}}, 1'b1, {51{fillchar}}};
               ((11 + offset) % 62):
                 data_out = {{11{1'b0}}, 1'b1, {50{fillchar}}};
               ((12 + offset) % 62):
                 data_out = {{12{1'b0}}, 1'b1, {49{fillchar}}};
               ((13 + offset) % 62):
                 data_out = {{13{1'b0}}, 1'b1, {48{fillchar}}};
               ((14 + offset) % 62):
                 data_out = {{14{1'b0}}, 1'b1, {47{fillchar}}};
               ((15 + offset) % 62):
                 data_out = {{15{1'b0}}, 1'b1, {46{fillchar}}};
               ((16 + offset) % 62):
                 data_out = {{16{1'b0}}, 1'b1, {45{fillchar}}};
               ((17 + offset) % 62):
                 data_out = {{17{1'b0}}, 1'b1, {44{fillchar}}};
               ((18 + offset) % 62):
                 data_out = {{18{1'b0}}, 1'b1, {43{fillchar}}};
               ((19 + offset) % 62):
                 data_out = {{19{1'b0}}, 1'b1, {42{fillchar}}};
               ((20 + offset) % 62):
                 data_out = {{20{1'b0}}, 1'b1, {41{fillchar}}};
               ((21 + offset) % 62):
                 data_out = {{21{1'b0}}, 1'b1, {40{fillchar}}};
               ((22 + offset) % 62):
                 data_out = {{22{1'b0}}, 1'b1, {39{fillchar}}};
               ((23 + offset) % 62):
                 data_out = {{23{1'b0}}, 1'b1, {38{fillchar}}};
               ((24 + offset) % 62):
                 data_out = {{24{1'b0}}, 1'b1, {37{fillchar}}};
               ((25 + offset) % 62):
                 data_out = {{25{1'b0}}, 1'b1, {36{fillchar}}};
               ((26 + offset) % 62):
                 data_out = {{26{1'b0}}, 1'b1, {35{fillchar}}};
               ((27 + offset) % 62):
                 data_out = {{27{1'b0}}, 1'b1, {34{fillchar}}};
               ((28 + offset) % 62):
                 data_out = {{28{1'b0}}, 1'b1, {33{fillchar}}};
               ((29 + offset) % 62):
                 data_out = {{29{1'b0}}, 1'b1, {32{fillchar}}};
               ((30 + offset) % 62):
                 data_out = {{30{1'b0}}, 1'b1, {31{fillchar}}};
               ((31 + offset) % 62):
                 data_out = {{31{1'b0}}, 1'b1, {30{fillchar}}};
               ((32 + offset) % 62):
                 data_out = {{32{1'b0}}, 1'b1, {29{fillchar}}};
               ((33 + offset) % 62):
                 data_out = {{33{1'b0}}, 1'b1, {28{fillchar}}};
               ((34 + offset) % 62):
                 data_out = {{34{1'b0}}, 1'b1, {27{fillchar}}};
               ((35 + offset) % 62):
                 data_out = {{35{1'b0}}, 1'b1, {26{fillchar}}};
               ((36 + offset) % 62):
                 data_out = {{36{1'b0}}, 1'b1, {25{fillchar}}};
               ((37 + offset) % 62):
                 data_out = {{37{1'b0}}, 1'b1, {24{fillchar}}};
               ((38 + offset) % 62):
                 data_out = {{38{1'b0}}, 1'b1, {23{fillchar}}};
               ((39 + offset) % 62):
                 data_out = {{39{1'b0}}, 1'b1, {22{fillchar}}};
               ((40 + offset) % 62):
                 data_out = {{40{1'b0}}, 1'b1, {21{fillchar}}};
               ((41 + offset) % 62):
                 data_out = {{41{1'b0}}, 1'b1, {20{fillchar}}};
               ((42 + offset) % 62):
                 data_out = {{42{1'b0}}, 1'b1, {19{fillchar}}};
               ((43 + offset) % 62):
                 data_out = {{43{1'b0}}, 1'b1, {18{fillchar}}};
               ((44 + offset) % 62):
                 data_out = {{44{1'b0}}, 1'b1, {17{fillchar}}};
               ((45 + offset) % 62):
                 data_out = {{45{1'b0}}, 1'b1, {16{fillchar}}};
               ((46 + offset) % 62):
                 data_out = {{46{1'b0}}, 1'b1, {15{fillchar}}};
               ((47 + offset) % 62):
                 data_out = {{47{1'b0}}, 1'b1, {14{fillchar}}};
               ((48 + offset) % 62):
                 data_out = {{48{1'b0}}, 1'b1, {13{fillchar}}};
               ((49 + offset) % 62):
                 data_out = {{49{1'b0}}, 1'b1, {12{fillchar}}};
               ((50 + offset) % 62):
                 data_out = {{50{1'b0}}, 1'b1, {11{fillchar}}};
               ((51 + offset) % 62):
                 data_out = {{51{1'b0}}, 1'b1, {10{fillchar}}};
               ((52 + offset) % 62):
                 data_out = {{52{1'b0}}, 1'b1, {9{fillchar}}};
               ((53 + offset) % 62):
                 data_out = {{53{1'b0}}, 1'b1, {8{fillchar}}};
               ((54 + offset) % 62):
                 data_out = {{54{1'b0}}, 1'b1, {7{fillchar}}};
               ((55 + offset) % 62):
                 data_out = {{55{1'b0}}, 1'b1, {6{fillchar}}};
               ((56 + offset) % 62):
                 data_out = {{56{1'b0}}, 1'b1, {5{fillchar}}};
               ((57 + offset) % 62):
                 data_out = {{57{1'b0}}, 1'b1, {4{fillchar}}};
               ((58 + offset) % 62):
                 data_out = {{58{1'b0}}, 1'b1, {3{fillchar}}};
               ((59 + offset) % 62):
                 data_out = {{59{1'b0}}, 1'b1, {2{fillchar}}};
               ((60 + offset) % 62):
                 data_out = {{60{1'b0}}, 1'b1, {1{fillchar}}};
               ((61 + offset) % 62):
                 data_out = {{61{1'b0}}, 1'b1};
               default:
                 data_out = {62{1'bx}};
             endcase
          end
      else if(num_ports == 63)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 63):
                 data_out = {1'b1, {62{fillchar}}};
               ((1 + offset) % 63):
                 data_out = {{1{1'b0}}, 1'b1, {61{fillchar}}};
               ((2 + offset) % 63):
                 data_out = {{2{1'b0}}, 1'b1, {60{fillchar}}};
               ((3 + offset) % 63):
                 data_out = {{3{1'b0}}, 1'b1, {59{fillchar}}};
               ((4 + offset) % 63):
                 data_out = {{4{1'b0}}, 1'b1, {58{fillchar}}};
               ((5 + offset) % 63):
                 data_out = {{5{1'b0}}, 1'b1, {57{fillchar}}};
               ((6 + offset) % 63):
                 data_out = {{6{1'b0}}, 1'b1, {56{fillchar}}};
               ((7 + offset) % 63):
                 data_out = {{7{1'b0}}, 1'b1, {55{fillchar}}};
               ((8 + offset) % 63):
                 data_out = {{8{1'b0}}, 1'b1, {54{fillchar}}};
               ((9 + offset) % 63):
                 data_out = {{9{1'b0}}, 1'b1, {53{fillchar}}};
               ((10 + offset) % 63):
                 data_out = {{10{1'b0}}, 1'b1, {52{fillchar}}};
               ((11 + offset) % 63):
                 data_out = {{11{1'b0}}, 1'b1, {51{fillchar}}};
               ((12 + offset) % 63):
                 data_out = {{12{1'b0}}, 1'b1, {50{fillchar}}};
               ((13 + offset) % 63):
                 data_out = {{13{1'b0}}, 1'b1, {49{fillchar}}};
               ((14 + offset) % 63):
                 data_out = {{14{1'b0}}, 1'b1, {48{fillchar}}};
               ((15 + offset) % 63):
                 data_out = {{15{1'b0}}, 1'b1, {47{fillchar}}};
               ((16 + offset) % 63):
                 data_out = {{16{1'b0}}, 1'b1, {46{fillchar}}};
               ((17 + offset) % 63):
                 data_out = {{17{1'b0}}, 1'b1, {45{fillchar}}};
               ((18 + offset) % 63):
                 data_out = {{18{1'b0}}, 1'b1, {44{fillchar}}};
               ((19 + offset) % 63):
                 data_out = {{19{1'b0}}, 1'b1, {43{fillchar}}};
               ((20 + offset) % 63):
                 data_out = {{20{1'b0}}, 1'b1, {42{fillchar}}};
               ((21 + offset) % 63):
                 data_out = {{21{1'b0}}, 1'b1, {41{fillchar}}};
               ((22 + offset) % 63):
                 data_out = {{22{1'b0}}, 1'b1, {40{fillchar}}};
               ((23 + offset) % 63):
                 data_out = {{23{1'b0}}, 1'b1, {39{fillchar}}};
               ((24 + offset) % 63):
                 data_out = {{24{1'b0}}, 1'b1, {38{fillchar}}};
               ((25 + offset) % 63):
                 data_out = {{25{1'b0}}, 1'b1, {37{fillchar}}};
               ((26 + offset) % 63):
                 data_out = {{26{1'b0}}, 1'b1, {36{fillchar}}};
               ((27 + offset) % 63):
                 data_out = {{27{1'b0}}, 1'b1, {35{fillchar}}};
               ((28 + offset) % 63):
                 data_out = {{28{1'b0}}, 1'b1, {34{fillchar}}};
               ((29 + offset) % 63):
                 data_out = {{29{1'b0}}, 1'b1, {33{fillchar}}};
               ((30 + offset) % 63):
                 data_out = {{30{1'b0}}, 1'b1, {32{fillchar}}};
               ((31 + offset) % 63):
                 data_out = {{31{1'b0}}, 1'b1, {31{fillchar}}};
               ((32 + offset) % 63):
                 data_out = {{32{1'b0}}, 1'b1, {30{fillchar}}};
               ((33 + offset) % 63):
                 data_out = {{33{1'b0}}, 1'b1, {29{fillchar}}};
               ((34 + offset) % 63):
                 data_out = {{34{1'b0}}, 1'b1, {28{fillchar}}};
               ((35 + offset) % 63):
                 data_out = {{35{1'b0}}, 1'b1, {27{fillchar}}};
               ((36 + offset) % 63):
                 data_out = {{36{1'b0}}, 1'b1, {26{fillchar}}};
               ((37 + offset) % 63):
                 data_out = {{37{1'b0}}, 1'b1, {25{fillchar}}};
               ((38 + offset) % 63):
                 data_out = {{38{1'b0}}, 1'b1, {24{fillchar}}};
               ((39 + offset) % 63):
                 data_out = {{39{1'b0}}, 1'b1, {23{fillchar}}};
               ((40 + offset) % 63):
                 data_out = {{40{1'b0}}, 1'b1, {22{fillchar}}};
               ((41 + offset) % 63):
                 data_out = {{41{1'b0}}, 1'b1, {21{fillchar}}};
               ((42 + offset) % 63):
                 data_out = {{42{1'b0}}, 1'b1, {20{fillchar}}};
               ((43 + offset) % 63):
                 data_out = {{43{1'b0}}, 1'b1, {19{fillchar}}};
               ((44 + offset) % 63):
                 data_out = {{44{1'b0}}, 1'b1, {18{fillchar}}};
               ((45 + offset) % 63):
                 data_out = {{45{1'b0}}, 1'b1, {17{fillchar}}};
               ((46 + offset) % 63):
                 data_out = {{46{1'b0}}, 1'b1, {16{fillchar}}};
               ((47 + offset) % 63):
                 data_out = {{47{1'b0}}, 1'b1, {15{fillchar}}};
               ((48 + offset) % 63):
                 data_out = {{48{1'b0}}, 1'b1, {14{fillchar}}};
               ((49 + offset) % 63):
                 data_out = {{49{1'b0}}, 1'b1, {13{fillchar}}};
               ((50 + offset) % 63):
                 data_out = {{50{1'b0}}, 1'b1, {12{fillchar}}};
               ((51 + offset) % 63):
                 data_out = {{51{1'b0}}, 1'b1, {11{fillchar}}};
               ((52 + offset) % 63):
                 data_out = {{52{1'b0}}, 1'b1, {10{fillchar}}};
               ((53 + offset) % 63):
                 data_out = {{53{1'b0}}, 1'b1, {9{fillchar}}};
               ((54 + offset) % 63):
                 data_out = {{54{1'b0}}, 1'b1, {8{fillchar}}};
               ((55 + offset) % 63):
                 data_out = {{55{1'b0}}, 1'b1, {7{fillchar}}};
               ((56 + offset) % 63):
                 data_out = {{56{1'b0}}, 1'b1, {6{fillchar}}};
               ((57 + offset) % 63):
                 data_out = {{57{1'b0}}, 1'b1, {5{fillchar}}};
               ((58 + offset) % 63):
                 data_out = {{58{1'b0}}, 1'b1, {4{fillchar}}};
               ((59 + offset) % 63):
                 data_out = {{59{1'b0}}, 1'b1, {3{fillchar}}};
               ((60 + offset) % 63):
                 data_out = {{60{1'b0}}, 1'b1, {2{fillchar}}};
               ((61 + offset) % 63):
                 data_out = {{61{1'b0}}, 1'b1, {1{fillchar}}};
               ((62 + offset) % 63):
                 data_out = {{62{1'b0}}, 1'b1};
               default:
                 data_out = {63{1'bx}};
             endcase
          end
      else if(num_ports == 64)
        always@(data_in)
          begin
             case(data_in)
               ((0 + offset) % 64):
                 data_out = {1'b1, {63{fillchar}}};
               ((1 + offset) % 64):
                 data_out = {{1{1'b0}}, 1'b1, {62{fillchar}}};
               ((2 + offset) % 64):
                 data_out = {{2{1'b0}}, 1'b1, {61{fillchar}}};
               ((3 + offset) % 64):
                 data_out = {{3{1'b0}}, 1'b1, {60{fillchar}}};
               ((4 + offset) % 64):
                 data_out = {{4{1'b0}}, 1'b1, {59{fillchar}}};
               ((5 + offset) % 64):
                 data_out = {{5{1'b0}}, 1'b1, {58{fillchar}}};
               ((6 + offset) % 64):
                 data_out = {{6{1'b0}}, 1'b1, {57{fillchar}}};
               ((7 + offset) % 64):
                 data_out = {{7{1'b0}}, 1'b1, {56{fillchar}}};
               ((8 + offset) % 64):
                 data_out = {{8{1'b0}}, 1'b1, {55{fillchar}}};
               ((9 + offset) % 64):
                 data_out = {{9{1'b0}}, 1'b1, {54{fillchar}}};
               ((10 + offset) % 64):
                 data_out = {{10{1'b0}}, 1'b1, {53{fillchar}}};
               ((11 + offset) % 64):
                 data_out = {{11{1'b0}}, 1'b1, {52{fillchar}}};
               ((12 + offset) % 64):
                 data_out = {{12{1'b0}}, 1'b1, {51{fillchar}}};
               ((13 + offset) % 64):
                 data_out = {{13{1'b0}}, 1'b1, {50{fillchar}}};
               ((14 + offset) % 64):
                 data_out = {{14{1'b0}}, 1'b1, {49{fillchar}}};
               ((15 + offset) % 64):
                 data_out = {{15{1'b0}}, 1'b1, {48{fillchar}}};
               ((16 + offset) % 64):
                 data_out = {{16{1'b0}}, 1'b1, {47{fillchar}}};
               ((17 + offset) % 64):
                 data_out = {{17{1'b0}}, 1'b1, {46{fillchar}}};
               ((18 + offset) % 64):
                 data_out = {{18{1'b0}}, 1'b1, {45{fillchar}}};
               ((19 + offset) % 64):
                 data_out = {{19{1'b0}}, 1'b1, {44{fillchar}}};
               ((20 + offset) % 64):
                 data_out = {{20{1'b0}}, 1'b1, {43{fillchar}}};
               ((21 + offset) % 64):
                 data_out = {{21{1'b0}}, 1'b1, {42{fillchar}}};
               ((22 + offset) % 64):
                 data_out = {{22{1'b0}}, 1'b1, {41{fillchar}}};
               ((23 + offset) % 64):
                 data_out = {{23{1'b0}}, 1'b1, {40{fillchar}}};
               ((24 + offset) % 64):
                 data_out = {{24{1'b0}}, 1'b1, {39{fillchar}}};
               ((25 + offset) % 64):
                 data_out = {{25{1'b0}}, 1'b1, {38{fillchar}}};
               ((26 + offset) % 64):
                 data_out = {{26{1'b0}}, 1'b1, {37{fillchar}}};
               ((27 + offset) % 64):
                 data_out = {{27{1'b0}}, 1'b1, {36{fillchar}}};
               ((28 + offset) % 64):
                 data_out = {{28{1'b0}}, 1'b1, {35{fillchar}}};
               ((29 + offset) % 64):
                 data_out = {{29{1'b0}}, 1'b1, {34{fillchar}}};
               ((30 + offset) % 64):
                 data_out = {{30{1'b0}}, 1'b1, {33{fillchar}}};
               ((31 + offset) % 64):
                 data_out = {{31{1'b0}}, 1'b1, {32{fillchar}}};
               ((32 + offset) % 64):
                 data_out = {{32{1'b0}}, 1'b1, {31{fillchar}}};
               ((33 + offset) % 64):
                 data_out = {{33{1'b0}}, 1'b1, {30{fillchar}}};
               ((34 + offset) % 64):
                 data_out = {{34{1'b0}}, 1'b1, {29{fillchar}}};
               ((35 + offset) % 64):
                 data_out = {{35{1'b0}}, 1'b1, {28{fillchar}}};
               ((36 + offset) % 64):
                 data_out = {{36{1'b0}}, 1'b1, {27{fillchar}}};
               ((37 + offset) % 64):
                 data_out = {{37{1'b0}}, 1'b1, {26{fillchar}}};
               ((38 + offset) % 64):
                 data_out = {{38{1'b0}}, 1'b1, {25{fillchar}}};
               ((39 + offset) % 64):
                 data_out = {{39{1'b0}}, 1'b1, {24{fillchar}}};
               ((40 + offset) % 64):
                 data_out = {{40{1'b0}}, 1'b1, {23{fillchar}}};
               ((41 + offset) % 64):
                 data_out = {{41{1'b0}}, 1'b1, {22{fillchar}}};
               ((42 + offset) % 64):
                 data_out = {{42{1'b0}}, 1'b1, {21{fillchar}}};
               ((43 + offset) % 64):
                 data_out = {{43{1'b0}}, 1'b1, {20{fillchar}}};
               ((44 + offset) % 64):
                 data_out = {{44{1'b0}}, 1'b1, {19{fillchar}}};
               ((45 + offset) % 64):
                 data_out = {{45{1'b0}}, 1'b1, {18{fillchar}}};
               ((46 + offset) % 64):
                 data_out = {{46{1'b0}}, 1'b1, {17{fillchar}}};
               ((47 + offset) % 64):
                 data_out = {{47{1'b0}}, 1'b1, {16{fillchar}}};
               ((48 + offset) % 64):
                 data_out = {{48{1'b0}}, 1'b1, {15{fillchar}}};
               ((49 + offset) % 64):
                 data_out = {{49{1'b0}}, 1'b1, {14{fillchar}}};
               ((50 + offset) % 64):
                 data_out = {{50{1'b0}}, 1'b1, {13{fillchar}}};
               ((51 + offset) % 64):
                 data_out = {{51{1'b0}}, 1'b1, {12{fillchar}}};
               ((52 + offset) % 64):
                 data_out = {{52{1'b0}}, 1'b1, {11{fillchar}}};
               ((53 + offset) % 64):
                 data_out = {{53{1'b0}}, 1'b1, {10{fillchar}}};
               ((54 + offset) % 64):
                 data_out = {{54{1'b0}}, 1'b1, {9{fillchar}}};
               ((55 + offset) % 64):
                 data_out = {{55{1'b0}}, 1'b1, {8{fillchar}}};
               ((56 + offset) % 64):
                 data_out = {{56{1'b0}}, 1'b1, {7{fillchar}}};
               ((57 + offset) % 64):
                 data_out = {{57{1'b0}}, 1'b1, {6{fillchar}}};
               ((58 + offset) % 64):
                 data_out = {{58{1'b0}}, 1'b1, {5{fillchar}}};
               ((59 + offset) % 64):
                 data_out = {{59{1'b0}}, 1'b1, {4{fillchar}}};
               ((60 + offset) % 64):
                 data_out = {{60{1'b0}}, 1'b1, {3{fillchar}}};
               ((61 + offset) % 64):
                 data_out = {{61{1'b0}}, 1'b1, {2{fillchar}}};
               ((62 + offset) % 64):
                 data_out = {{62{1'b0}}, 1'b1, {1{fillchar}}};
               ((63 + offset) % 64):
                 data_out = {{63{1'b0}}, 1'b1};
               default:
                 data_out = {64{1'bx}};
             endcase
          end
      
   endgenerate
   
endmodule
