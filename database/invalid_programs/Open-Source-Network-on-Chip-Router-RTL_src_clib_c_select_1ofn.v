// $Id: c_select_1ofn.v 5188 2012-08-30 00:31:31Z dub $

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
// generic select mux (i.e., mux with one-hot control signal)
//==============================================================================

// NOTE: This file was automatically generated. Do not edit by hand!

module c_select_1ofn
  (select, data_in, data_out);
   
`include "c_constants.v"
   
   // number of input ports
   parameter num_ports = 4;
   
   // width of each port
   parameter width = 32;
   
   // control signal to select active port
   input [0:num_ports-1] select;
   
   // vector of inputs
   input [0:num_ports*width-1] data_in;
   
   // result
   output [0:width-1] 	       data_out;
   reg [0:width-1] 	       data_out;
   
   generate
      
      // synopsys translate_off
      if(num_ports < 1)
	begin
	   initial
	     begin
		$display({"ERROR: Select-mux module %m needs at least 1 inputs."});
		$stop;
	     end
	end
      else if(num_ports > 64)
	begin
	   initial
	     begin
		$display({"ERROR: Select-mux module %m supports at most 64 inputs."});
		$stop;
	     end
	end
      // synopsys translate_on
      
      if(num_ports == 1)
        always@(select, data_in)
          begin
             case(select)
               1'b1:
                 data_out = data_in[0*width:1*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 2)
        always@(select, data_in)
          begin
             case(select)
               2'b10:
                 data_out = data_in[0*width:1*width-1];
               2'b01:
                 data_out = data_in[1*width:2*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 3)
        always@(select, data_in)
          begin
             case(select)
               3'b100:
                 data_out = data_in[0*width:1*width-1];
               3'b010:
                 data_out = data_in[1*width:2*width-1];
               3'b001:
                 data_out = data_in[2*width:3*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 4)
        always@(select, data_in)
          begin
             case(select)
               4'b1000:
                 data_out = data_in[0*width:1*width-1];
               4'b0100:
                 data_out = data_in[1*width:2*width-1];
               4'b0010:
                 data_out = data_in[2*width:3*width-1];
               4'b0001:
                 data_out = data_in[3*width:4*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 5)
        always@(select, data_in)
          begin
             case(select)
               5'b10000:
                 data_out = data_in[0*width:1*width-1];
               5'b01000:
                 data_out = data_in[1*width:2*width-1];
               5'b00100:
                 data_out = data_in[2*width:3*width-1];
               5'b00010:
                 data_out = data_in[3*width:4*width-1];
               5'b00001:
                 data_out = data_in[4*width:5*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 6)
        always@(select, data_in)
          begin
             case(select)
               6'b100000:
                 data_out = data_in[0*width:1*width-1];
               6'b010000:
                 data_out = data_in[1*width:2*width-1];
               6'b001000:
                 data_out = data_in[2*width:3*width-1];
               6'b000100:
                 data_out = data_in[3*width:4*width-1];
               6'b000010:
                 data_out = data_in[4*width:5*width-1];
               6'b000001:
                 data_out = data_in[5*width:6*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 7)
        always@(select, data_in)
          begin
             case(select)
               7'b1000000:
                 data_out = data_in[0*width:1*width-1];
               7'b0100000:
                 data_out = data_in[1*width:2*width-1];
               7'b0010000:
                 data_out = data_in[2*width:3*width-1];
               7'b0001000:
                 data_out = data_in[3*width:4*width-1];
               7'b0000100:
                 data_out = data_in[4*width:5*width-1];
               7'b0000010:
                 data_out = data_in[5*width:6*width-1];
               7'b0000001:
                 data_out = data_in[6*width:7*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 8)
        always@(select, data_in)
          begin
             case(select)
               8'b10000000:
                 data_out = data_in[0*width:1*width-1];
               8'b01000000:
                 data_out = data_in[1*width:2*width-1];
               8'b00100000:
                 data_out = data_in[2*width:3*width-1];
               8'b00010000:
                 data_out = data_in[3*width:4*width-1];
               8'b00001000:
                 data_out = data_in[4*width:5*width-1];
               8'b00000100:
                 data_out = data_in[5*width:6*width-1];
               8'b00000010:
                 data_out = data_in[6*width:7*width-1];
               8'b00000001:
                 data_out = data_in[7*width:8*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 9)
        always@(select, data_in)
          begin
             case(select)
               9'b100000000:
                 data_out = data_in[0*width:1*width-1];
               9'b010000000:
                 data_out = data_in[1*width:2*width-1];
               9'b001000000:
                 data_out = data_in[2*width:3*width-1];
               9'b000100000:
                 data_out = data_in[3*width:4*width-1];
               9'b000010000:
                 data_out = data_in[4*width:5*width-1];
               9'b000001000:
                 data_out = data_in[5*width:6*width-1];
               9'b000000100:
                 data_out = data_in[6*width:7*width-1];
               9'b000000010:
                 data_out = data_in[7*width:8*width-1];
               9'b000000001:
                 data_out = data_in[8*width:9*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 10)
        always@(select, data_in)
          begin
             case(select)
               10'b1000000000:
                 data_out = data_in[0*width:1*width-1];
               10'b0100000000:
                 data_out = data_in[1*width:2*width-1];
               10'b0010000000:
                 data_out = data_in[2*width:3*width-1];
               10'b0001000000:
                 data_out = data_in[3*width:4*width-1];
               10'b0000100000:
                 data_out = data_in[4*width:5*width-1];
               10'b0000010000:
                 data_out = data_in[5*width:6*width-1];
               10'b0000001000:
                 data_out = data_in[6*width:7*width-1];
               10'b0000000100:
                 data_out = data_in[7*width:8*width-1];
               10'b0000000010:
                 data_out = data_in[8*width:9*width-1];
               10'b0000000001:
                 data_out = data_in[9*width:10*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 11)
        always@(select, data_in)
          begin
             case(select)
               11'b10000000000:
                 data_out = data_in[0*width:1*width-1];
               11'b01000000000:
                 data_out = data_in[1*width:2*width-1];
               11'b00100000000:
                 data_out = data_in[2*width:3*width-1];
               11'b00010000000:
                 data_out = data_in[3*width:4*width-1];
               11'b00001000000:
                 data_out = data_in[4*width:5*width-1];
               11'b00000100000:
                 data_out = data_in[5*width:6*width-1];
               11'b00000010000:
                 data_out = data_in[6*width:7*width-1];
               11'b00000001000:
                 data_out = data_in[7*width:8*width-1];
               11'b00000000100:
                 data_out = data_in[8*width:9*width-1];
               11'b00000000010:
                 data_out = data_in[9*width:10*width-1];
               11'b00000000001:
                 data_out = data_in[10*width:11*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 12)
        always@(select, data_in)
          begin
             case(select)
               12'b100000000000:
                 data_out = data_in[0*width:1*width-1];
               12'b010000000000:
                 data_out = data_in[1*width:2*width-1];
               12'b001000000000:
                 data_out = data_in[2*width:3*width-1];
               12'b000100000000:
                 data_out = data_in[3*width:4*width-1];
               12'b000010000000:
                 data_out = data_in[4*width:5*width-1];
               12'b000001000000:
                 data_out = data_in[5*width:6*width-1];
               12'b000000100000:
                 data_out = data_in[6*width:7*width-1];
               12'b000000010000:
                 data_out = data_in[7*width:8*width-1];
               12'b000000001000:
                 data_out = data_in[8*width:9*width-1];
               12'b000000000100:
                 data_out = data_in[9*width:10*width-1];
               12'b000000000010:
                 data_out = data_in[10*width:11*width-1];
               12'b000000000001:
                 data_out = data_in[11*width:12*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 13)
        always@(select, data_in)
          begin
             case(select)
               13'b1000000000000:
                 data_out = data_in[0*width:1*width-1];
               13'b0100000000000:
                 data_out = data_in[1*width:2*width-1];
               13'b0010000000000:
                 data_out = data_in[2*width:3*width-1];
               13'b0001000000000:
                 data_out = data_in[3*width:4*width-1];
               13'b0000100000000:
                 data_out = data_in[4*width:5*width-1];
               13'b0000010000000:
                 data_out = data_in[5*width:6*width-1];
               13'b0000001000000:
                 data_out = data_in[6*width:7*width-1];
               13'b0000000100000:
                 data_out = data_in[7*width:8*width-1];
               13'b0000000010000:
                 data_out = data_in[8*width:9*width-1];
               13'b0000000001000:
                 data_out = data_in[9*width:10*width-1];
               13'b0000000000100:
                 data_out = data_in[10*width:11*width-1];
               13'b0000000000010:
                 data_out = data_in[11*width:12*width-1];
               13'b0000000000001:
                 data_out = data_in[12*width:13*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 14)
        always@(select, data_in)
          begin
             case(select)
               14'b10000000000000:
                 data_out = data_in[0*width:1*width-1];
               14'b01000000000000:
                 data_out = data_in[1*width:2*width-1];
               14'b00100000000000:
                 data_out = data_in[2*width:3*width-1];
               14'b00010000000000:
                 data_out = data_in[3*width:4*width-1];
               14'b00001000000000:
                 data_out = data_in[4*width:5*width-1];
               14'b00000100000000:
                 data_out = data_in[5*width:6*width-1];
               14'b00000010000000:
                 data_out = data_in[6*width:7*width-1];
               14'b00000001000000:
                 data_out = data_in[7*width:8*width-1];
               14'b00000000100000:
                 data_out = data_in[8*width:9*width-1];
               14'b00000000010000:
                 data_out = data_in[9*width:10*width-1];
               14'b00000000001000:
                 data_out = data_in[10*width:11*width-1];
               14'b00000000000100:
                 data_out = data_in[11*width:12*width-1];
               14'b00000000000010:
                 data_out = data_in[12*width:13*width-1];
               14'b00000000000001:
                 data_out = data_in[13*width:14*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 15)
        always@(select, data_in)
          begin
             case(select)
               15'b100000000000000:
                 data_out = data_in[0*width:1*width-1];
               15'b010000000000000:
                 data_out = data_in[1*width:2*width-1];
               15'b001000000000000:
                 data_out = data_in[2*width:3*width-1];
               15'b000100000000000:
                 data_out = data_in[3*width:4*width-1];
               15'b000010000000000:
                 data_out = data_in[4*width:5*width-1];
               15'b000001000000000:
                 data_out = data_in[5*width:6*width-1];
               15'b000000100000000:
                 data_out = data_in[6*width:7*width-1];
               15'b000000010000000:
                 data_out = data_in[7*width:8*width-1];
               15'b000000001000000:
                 data_out = data_in[8*width:9*width-1];
               15'b000000000100000:
                 data_out = data_in[9*width:10*width-1];
               15'b000000000010000:
                 data_out = data_in[10*width:11*width-1];
               15'b000000000001000:
                 data_out = data_in[11*width:12*width-1];
               15'b000000000000100:
                 data_out = data_in[12*width:13*width-1];
               15'b000000000000010:
                 data_out = data_in[13*width:14*width-1];
               15'b000000000000001:
                 data_out = data_in[14*width:15*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 16)
        always@(select, data_in)
          begin
             case(select)
               16'b1000000000000000:
                 data_out = data_in[0*width:1*width-1];
               16'b0100000000000000:
                 data_out = data_in[1*width:2*width-1];
               16'b0010000000000000:
                 data_out = data_in[2*width:3*width-1];
               16'b0001000000000000:
                 data_out = data_in[3*width:4*width-1];
               16'b0000100000000000:
                 data_out = data_in[4*width:5*width-1];
               16'b0000010000000000:
                 data_out = data_in[5*width:6*width-1];
               16'b0000001000000000:
                 data_out = data_in[6*width:7*width-1];
               16'b0000000100000000:
                 data_out = data_in[7*width:8*width-1];
               16'b0000000010000000:
                 data_out = data_in[8*width:9*width-1];
               16'b0000000001000000:
                 data_out = data_in[9*width:10*width-1];
               16'b0000000000100000:
                 data_out = data_in[10*width:11*width-1];
               16'b0000000000010000:
                 data_out = data_in[11*width:12*width-1];
               16'b0000000000001000:
                 data_out = data_in[12*width:13*width-1];
               16'b0000000000000100:
                 data_out = data_in[13*width:14*width-1];
               16'b0000000000000010:
                 data_out = data_in[14*width:15*width-1];
               16'b0000000000000001:
                 data_out = data_in[15*width:16*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 17)
        always@(select, data_in)
          begin
             case(select)
               17'b10000000000000000:
                 data_out = data_in[0*width:1*width-1];
               17'b01000000000000000:
                 data_out = data_in[1*width:2*width-1];
               17'b00100000000000000:
                 data_out = data_in[2*width:3*width-1];
               17'b00010000000000000:
                 data_out = data_in[3*width:4*width-1];
               17'b00001000000000000:
                 data_out = data_in[4*width:5*width-1];
               17'b00000100000000000:
                 data_out = data_in[5*width:6*width-1];
               17'b00000010000000000:
                 data_out = data_in[6*width:7*width-1];
               17'b00000001000000000:
                 data_out = data_in[7*width:8*width-1];
               17'b00000000100000000:
                 data_out = data_in[8*width:9*width-1];
               17'b00000000010000000:
                 data_out = data_in[9*width:10*width-1];
               17'b00000000001000000:
                 data_out = data_in[10*width:11*width-1];
               17'b00000000000100000:
                 data_out = data_in[11*width:12*width-1];
               17'b00000000000010000:
                 data_out = data_in[12*width:13*width-1];
               17'b00000000000001000:
                 data_out = data_in[13*width:14*width-1];
               17'b00000000000000100:
                 data_out = data_in[14*width:15*width-1];
               17'b00000000000000010:
                 data_out = data_in[15*width:16*width-1];
               17'b00000000000000001:
                 data_out = data_in[16*width:17*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 18)
        always@(select, data_in)
          begin
             case(select)
               18'b100000000000000000:
                 data_out = data_in[0*width:1*width-1];
               18'b010000000000000000:
                 data_out = data_in[1*width:2*width-1];
               18'b001000000000000000:
                 data_out = data_in[2*width:3*width-1];
               18'b000100000000000000:
                 data_out = data_in[3*width:4*width-1];
               18'b000010000000000000:
                 data_out = data_in[4*width:5*width-1];
               18'b000001000000000000:
                 data_out = data_in[5*width:6*width-1];
               18'b000000100000000000:
                 data_out = data_in[6*width:7*width-1];
               18'b000000010000000000:
                 data_out = data_in[7*width:8*width-1];
               18'b000000001000000000:
                 data_out = data_in[8*width:9*width-1];
               18'b000000000100000000:
                 data_out = data_in[9*width:10*width-1];
               18'b000000000010000000:
                 data_out = data_in[10*width:11*width-1];
               18'b000000000001000000:
                 data_out = data_in[11*width:12*width-1];
               18'b000000000000100000:
                 data_out = data_in[12*width:13*width-1];
               18'b000000000000010000:
                 data_out = data_in[13*width:14*width-1];
               18'b000000000000001000:
                 data_out = data_in[14*width:15*width-1];
               18'b000000000000000100:
                 data_out = data_in[15*width:16*width-1];
               18'b000000000000000010:
                 data_out = data_in[16*width:17*width-1];
               18'b000000000000000001:
                 data_out = data_in[17*width:18*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 19)
        always@(select, data_in)
          begin
             case(select)
               19'b1000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               19'b0100000000000000000:
                 data_out = data_in[1*width:2*width-1];
               19'b0010000000000000000:
                 data_out = data_in[2*width:3*width-1];
               19'b0001000000000000000:
                 data_out = data_in[3*width:4*width-1];
               19'b0000100000000000000:
                 data_out = data_in[4*width:5*width-1];
               19'b0000010000000000000:
                 data_out = data_in[5*width:6*width-1];
               19'b0000001000000000000:
                 data_out = data_in[6*width:7*width-1];
               19'b0000000100000000000:
                 data_out = data_in[7*width:8*width-1];
               19'b0000000010000000000:
                 data_out = data_in[8*width:9*width-1];
               19'b0000000001000000000:
                 data_out = data_in[9*width:10*width-1];
               19'b0000000000100000000:
                 data_out = data_in[10*width:11*width-1];
               19'b0000000000010000000:
                 data_out = data_in[11*width:12*width-1];
               19'b0000000000001000000:
                 data_out = data_in[12*width:13*width-1];
               19'b0000000000000100000:
                 data_out = data_in[13*width:14*width-1];
               19'b0000000000000010000:
                 data_out = data_in[14*width:15*width-1];
               19'b0000000000000001000:
                 data_out = data_in[15*width:16*width-1];
               19'b0000000000000000100:
                 data_out = data_in[16*width:17*width-1];
               19'b0000000000000000010:
                 data_out = data_in[17*width:18*width-1];
               19'b0000000000000000001:
                 data_out = data_in[18*width:19*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 20)
        always@(select, data_in)
          begin
             case(select)
               20'b10000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               20'b01000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               20'b00100000000000000000:
                 data_out = data_in[2*width:3*width-1];
               20'b00010000000000000000:
                 data_out = data_in[3*width:4*width-1];
               20'b00001000000000000000:
                 data_out = data_in[4*width:5*width-1];
               20'b00000100000000000000:
                 data_out = data_in[5*width:6*width-1];
               20'b00000010000000000000:
                 data_out = data_in[6*width:7*width-1];
               20'b00000001000000000000:
                 data_out = data_in[7*width:8*width-1];
               20'b00000000100000000000:
                 data_out = data_in[8*width:9*width-1];
               20'b00000000010000000000:
                 data_out = data_in[9*width:10*width-1];
               20'b00000000001000000000:
                 data_out = data_in[10*width:11*width-1];
               20'b00000000000100000000:
                 data_out = data_in[11*width:12*width-1];
               20'b00000000000010000000:
                 data_out = data_in[12*width:13*width-1];
               20'b00000000000001000000:
                 data_out = data_in[13*width:14*width-1];
               20'b00000000000000100000:
                 data_out = data_in[14*width:15*width-1];
               20'b00000000000000010000:
                 data_out = data_in[15*width:16*width-1];
               20'b00000000000000001000:
                 data_out = data_in[16*width:17*width-1];
               20'b00000000000000000100:
                 data_out = data_in[17*width:18*width-1];
               20'b00000000000000000010:
                 data_out = data_in[18*width:19*width-1];
               20'b00000000000000000001:
                 data_out = data_in[19*width:20*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 21)
        always@(select, data_in)
          begin
             case(select)
               21'b100000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               21'b010000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               21'b001000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               21'b000100000000000000000:
                 data_out = data_in[3*width:4*width-1];
               21'b000010000000000000000:
                 data_out = data_in[4*width:5*width-1];
               21'b000001000000000000000:
                 data_out = data_in[5*width:6*width-1];
               21'b000000100000000000000:
                 data_out = data_in[6*width:7*width-1];
               21'b000000010000000000000:
                 data_out = data_in[7*width:8*width-1];
               21'b000000001000000000000:
                 data_out = data_in[8*width:9*width-1];
               21'b000000000100000000000:
                 data_out = data_in[9*width:10*width-1];
               21'b000000000010000000000:
                 data_out = data_in[10*width:11*width-1];
               21'b000000000001000000000:
                 data_out = data_in[11*width:12*width-1];
               21'b000000000000100000000:
                 data_out = data_in[12*width:13*width-1];
               21'b000000000000010000000:
                 data_out = data_in[13*width:14*width-1];
               21'b000000000000001000000:
                 data_out = data_in[14*width:15*width-1];
               21'b000000000000000100000:
                 data_out = data_in[15*width:16*width-1];
               21'b000000000000000010000:
                 data_out = data_in[16*width:17*width-1];
               21'b000000000000000001000:
                 data_out = data_in[17*width:18*width-1];
               21'b000000000000000000100:
                 data_out = data_in[18*width:19*width-1];
               21'b000000000000000000010:
                 data_out = data_in[19*width:20*width-1];
               21'b000000000000000000001:
                 data_out = data_in[20*width:21*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 22)
        always@(select, data_in)
          begin
             case(select)
               22'b1000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               22'b0100000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               22'b0010000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               22'b0001000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               22'b0000100000000000000000:
                 data_out = data_in[4*width:5*width-1];
               22'b0000010000000000000000:
                 data_out = data_in[5*width:6*width-1];
               22'b0000001000000000000000:
                 data_out = data_in[6*width:7*width-1];
               22'b0000000100000000000000:
                 data_out = data_in[7*width:8*width-1];
               22'b0000000010000000000000:
                 data_out = data_in[8*width:9*width-1];
               22'b0000000001000000000000:
                 data_out = data_in[9*width:10*width-1];
               22'b0000000000100000000000:
                 data_out = data_in[10*width:11*width-1];
               22'b0000000000010000000000:
                 data_out = data_in[11*width:12*width-1];
               22'b0000000000001000000000:
                 data_out = data_in[12*width:13*width-1];
               22'b0000000000000100000000:
                 data_out = data_in[13*width:14*width-1];
               22'b0000000000000010000000:
                 data_out = data_in[14*width:15*width-1];
               22'b0000000000000001000000:
                 data_out = data_in[15*width:16*width-1];
               22'b0000000000000000100000:
                 data_out = data_in[16*width:17*width-1];
               22'b0000000000000000010000:
                 data_out = data_in[17*width:18*width-1];
               22'b0000000000000000001000:
                 data_out = data_in[18*width:19*width-1];
               22'b0000000000000000000100:
                 data_out = data_in[19*width:20*width-1];
               22'b0000000000000000000010:
                 data_out = data_in[20*width:21*width-1];
               22'b0000000000000000000001:
                 data_out = data_in[21*width:22*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 23)
        always@(select, data_in)
          begin
             case(select)
               23'b10000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               23'b01000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               23'b00100000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               23'b00010000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               23'b00001000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               23'b00000100000000000000000:
                 data_out = data_in[5*width:6*width-1];
               23'b00000010000000000000000:
                 data_out = data_in[6*width:7*width-1];
               23'b00000001000000000000000:
                 data_out = data_in[7*width:8*width-1];
               23'b00000000100000000000000:
                 data_out = data_in[8*width:9*width-1];
               23'b00000000010000000000000:
                 data_out = data_in[9*width:10*width-1];
               23'b00000000001000000000000:
                 data_out = data_in[10*width:11*width-1];
               23'b00000000000100000000000:
                 data_out = data_in[11*width:12*width-1];
               23'b00000000000010000000000:
                 data_out = data_in[12*width:13*width-1];
               23'b00000000000001000000000:
                 data_out = data_in[13*width:14*width-1];
               23'b00000000000000100000000:
                 data_out = data_in[14*width:15*width-1];
               23'b00000000000000010000000:
                 data_out = data_in[15*width:16*width-1];
               23'b00000000000000001000000:
                 data_out = data_in[16*width:17*width-1];
               23'b00000000000000000100000:
                 data_out = data_in[17*width:18*width-1];
               23'b00000000000000000010000:
                 data_out = data_in[18*width:19*width-1];
               23'b00000000000000000001000:
                 data_out = data_in[19*width:20*width-1];
               23'b00000000000000000000100:
                 data_out = data_in[20*width:21*width-1];
               23'b00000000000000000000010:
                 data_out = data_in[21*width:22*width-1];
               23'b00000000000000000000001:
                 data_out = data_in[22*width:23*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 24)
        always@(select, data_in)
          begin
             case(select)
               24'b100000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               24'b010000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               24'b001000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               24'b000100000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               24'b000010000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               24'b000001000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               24'b000000100000000000000000:
                 data_out = data_in[6*width:7*width-1];
               24'b000000010000000000000000:
                 data_out = data_in[7*width:8*width-1];
               24'b000000001000000000000000:
                 data_out = data_in[8*width:9*width-1];
               24'b000000000100000000000000:
                 data_out = data_in[9*width:10*width-1];
               24'b000000000010000000000000:
                 data_out = data_in[10*width:11*width-1];
               24'b000000000001000000000000:
                 data_out = data_in[11*width:12*width-1];
               24'b000000000000100000000000:
                 data_out = data_in[12*width:13*width-1];
               24'b000000000000010000000000:
                 data_out = data_in[13*width:14*width-1];
               24'b000000000000001000000000:
                 data_out = data_in[14*width:15*width-1];
               24'b000000000000000100000000:
                 data_out = data_in[15*width:16*width-1];
               24'b000000000000000010000000:
                 data_out = data_in[16*width:17*width-1];
               24'b000000000000000001000000:
                 data_out = data_in[17*width:18*width-1];
               24'b000000000000000000100000:
                 data_out = data_in[18*width:19*width-1];
               24'b000000000000000000010000:
                 data_out = data_in[19*width:20*width-1];
               24'b000000000000000000001000:
                 data_out = data_in[20*width:21*width-1];
               24'b000000000000000000000100:
                 data_out = data_in[21*width:22*width-1];
               24'b000000000000000000000010:
                 data_out = data_in[22*width:23*width-1];
               24'b000000000000000000000001:
                 data_out = data_in[23*width:24*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 25)
        always@(select, data_in)
          begin
             case(select)
               25'b1000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               25'b0100000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               25'b0010000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               25'b0001000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               25'b0000100000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               25'b0000010000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               25'b0000001000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               25'b0000000100000000000000000:
                 data_out = data_in[7*width:8*width-1];
               25'b0000000010000000000000000:
                 data_out = data_in[8*width:9*width-1];
               25'b0000000001000000000000000:
                 data_out = data_in[9*width:10*width-1];
               25'b0000000000100000000000000:
                 data_out = data_in[10*width:11*width-1];
               25'b0000000000010000000000000:
                 data_out = data_in[11*width:12*width-1];
               25'b0000000000001000000000000:
                 data_out = data_in[12*width:13*width-1];
               25'b0000000000000100000000000:
                 data_out = data_in[13*width:14*width-1];
               25'b0000000000000010000000000:
                 data_out = data_in[14*width:15*width-1];
               25'b0000000000000001000000000:
                 data_out = data_in[15*width:16*width-1];
               25'b0000000000000000100000000:
                 data_out = data_in[16*width:17*width-1];
               25'b0000000000000000010000000:
                 data_out = data_in[17*width:18*width-1];
               25'b0000000000000000001000000:
                 data_out = data_in[18*width:19*width-1];
               25'b0000000000000000000100000:
                 data_out = data_in[19*width:20*width-1];
               25'b0000000000000000000010000:
                 data_out = data_in[20*width:21*width-1];
               25'b0000000000000000000001000:
                 data_out = data_in[21*width:22*width-1];
               25'b0000000000000000000000100:
                 data_out = data_in[22*width:23*width-1];
               25'b0000000000000000000000010:
                 data_out = data_in[23*width:24*width-1];
               25'b0000000000000000000000001:
                 data_out = data_in[24*width:25*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 26)
        always@(select, data_in)
          begin
             case(select)
               26'b10000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               26'b01000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               26'b00100000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               26'b00010000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               26'b00001000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               26'b00000100000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               26'b00000010000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               26'b00000001000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               26'b00000000100000000000000000:
                 data_out = data_in[8*width:9*width-1];
               26'b00000000010000000000000000:
                 data_out = data_in[9*width:10*width-1];
               26'b00000000001000000000000000:
                 data_out = data_in[10*width:11*width-1];
               26'b00000000000100000000000000:
                 data_out = data_in[11*width:12*width-1];
               26'b00000000000010000000000000:
                 data_out = data_in[12*width:13*width-1];
               26'b00000000000001000000000000:
                 data_out = data_in[13*width:14*width-1];
               26'b00000000000000100000000000:
                 data_out = data_in[14*width:15*width-1];
               26'b00000000000000010000000000:
                 data_out = data_in[15*width:16*width-1];
               26'b00000000000000001000000000:
                 data_out = data_in[16*width:17*width-1];
               26'b00000000000000000100000000:
                 data_out = data_in[17*width:18*width-1];
               26'b00000000000000000010000000:
                 data_out = data_in[18*width:19*width-1];
               26'b00000000000000000001000000:
                 data_out = data_in[19*width:20*width-1];
               26'b00000000000000000000100000:
                 data_out = data_in[20*width:21*width-1];
               26'b00000000000000000000010000:
                 data_out = data_in[21*width:22*width-1];
               26'b00000000000000000000001000:
                 data_out = data_in[22*width:23*width-1];
               26'b00000000000000000000000100:
                 data_out = data_in[23*width:24*width-1];
               26'b00000000000000000000000010:
                 data_out = data_in[24*width:25*width-1];
               26'b00000000000000000000000001:
                 data_out = data_in[25*width:26*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 27)
        always@(select, data_in)
          begin
             case(select)
               27'b100000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               27'b010000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               27'b001000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               27'b000100000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               27'b000010000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               27'b000001000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               27'b000000100000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               27'b000000010000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               27'b000000001000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               27'b000000000100000000000000000:
                 data_out = data_in[9*width:10*width-1];
               27'b000000000010000000000000000:
                 data_out = data_in[10*width:11*width-1];
               27'b000000000001000000000000000:
                 data_out = data_in[11*width:12*width-1];
               27'b000000000000100000000000000:
                 data_out = data_in[12*width:13*width-1];
               27'b000000000000010000000000000:
                 data_out = data_in[13*width:14*width-1];
               27'b000000000000001000000000000:
                 data_out = data_in[14*width:15*width-1];
               27'b000000000000000100000000000:
                 data_out = data_in[15*width:16*width-1];
               27'b000000000000000010000000000:
                 data_out = data_in[16*width:17*width-1];
               27'b000000000000000001000000000:
                 data_out = data_in[17*width:18*width-1];
               27'b000000000000000000100000000:
                 data_out = data_in[18*width:19*width-1];
               27'b000000000000000000010000000:
                 data_out = data_in[19*width:20*width-1];
               27'b000000000000000000001000000:
                 data_out = data_in[20*width:21*width-1];
               27'b000000000000000000000100000:
                 data_out = data_in[21*width:22*width-1];
               27'b000000000000000000000010000:
                 data_out = data_in[22*width:23*width-1];
               27'b000000000000000000000001000:
                 data_out = data_in[23*width:24*width-1];
               27'b000000000000000000000000100:
                 data_out = data_in[24*width:25*width-1];
               27'b000000000000000000000000010:
                 data_out = data_in[25*width:26*width-1];
               27'b000000000000000000000000001:
                 data_out = data_in[26*width:27*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 28)
        always@(select, data_in)
          begin
             case(select)
               28'b1000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               28'b0100000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               28'b0010000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               28'b0001000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               28'b0000100000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               28'b0000010000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               28'b0000001000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               28'b0000000100000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               28'b0000000010000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               28'b0000000001000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               28'b0000000000100000000000000000:
                 data_out = data_in[10*width:11*width-1];
               28'b0000000000010000000000000000:
                 data_out = data_in[11*width:12*width-1];
               28'b0000000000001000000000000000:
                 data_out = data_in[12*width:13*width-1];
               28'b0000000000000100000000000000:
                 data_out = data_in[13*width:14*width-1];
               28'b0000000000000010000000000000:
                 data_out = data_in[14*width:15*width-1];
               28'b0000000000000001000000000000:
                 data_out = data_in[15*width:16*width-1];
               28'b0000000000000000100000000000:
                 data_out = data_in[16*width:17*width-1];
               28'b0000000000000000010000000000:
                 data_out = data_in[17*width:18*width-1];
               28'b0000000000000000001000000000:
                 data_out = data_in[18*width:19*width-1];
               28'b0000000000000000000100000000:
                 data_out = data_in[19*width:20*width-1];
               28'b0000000000000000000010000000:
                 data_out = data_in[20*width:21*width-1];
               28'b0000000000000000000001000000:
                 data_out = data_in[21*width:22*width-1];
               28'b0000000000000000000000100000:
                 data_out = data_in[22*width:23*width-1];
               28'b0000000000000000000000010000:
                 data_out = data_in[23*width:24*width-1];
               28'b0000000000000000000000001000:
                 data_out = data_in[24*width:25*width-1];
               28'b0000000000000000000000000100:
                 data_out = data_in[25*width:26*width-1];
               28'b0000000000000000000000000010:
                 data_out = data_in[26*width:27*width-1];
               28'b0000000000000000000000000001:
                 data_out = data_in[27*width:28*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 29)
        always@(select, data_in)
          begin
             case(select)
               29'b10000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               29'b01000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               29'b00100000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               29'b00010000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               29'b00001000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               29'b00000100000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               29'b00000010000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               29'b00000001000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               29'b00000000100000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               29'b00000000010000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               29'b00000000001000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               29'b00000000000100000000000000000:
                 data_out = data_in[11*width:12*width-1];
               29'b00000000000010000000000000000:
                 data_out = data_in[12*width:13*width-1];
               29'b00000000000001000000000000000:
                 data_out = data_in[13*width:14*width-1];
               29'b00000000000000100000000000000:
                 data_out = data_in[14*width:15*width-1];
               29'b00000000000000010000000000000:
                 data_out = data_in[15*width:16*width-1];
               29'b00000000000000001000000000000:
                 data_out = data_in[16*width:17*width-1];
               29'b00000000000000000100000000000:
                 data_out = data_in[17*width:18*width-1];
               29'b00000000000000000010000000000:
                 data_out = data_in[18*width:19*width-1];
               29'b00000000000000000001000000000:
                 data_out = data_in[19*width:20*width-1];
               29'b00000000000000000000100000000:
                 data_out = data_in[20*width:21*width-1];
               29'b00000000000000000000010000000:
                 data_out = data_in[21*width:22*width-1];
               29'b00000000000000000000001000000:
                 data_out = data_in[22*width:23*width-1];
               29'b00000000000000000000000100000:
                 data_out = data_in[23*width:24*width-1];
               29'b00000000000000000000000010000:
                 data_out = data_in[24*width:25*width-1];
               29'b00000000000000000000000001000:
                 data_out = data_in[25*width:26*width-1];
               29'b00000000000000000000000000100:
                 data_out = data_in[26*width:27*width-1];
               29'b00000000000000000000000000010:
                 data_out = data_in[27*width:28*width-1];
               29'b00000000000000000000000000001:
                 data_out = data_in[28*width:29*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 30)
        always@(select, data_in)
          begin
             case(select)
               30'b100000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               30'b010000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               30'b001000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               30'b000100000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               30'b000010000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               30'b000001000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               30'b000000100000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               30'b000000010000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               30'b000000001000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               30'b000000000100000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               30'b000000000010000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               30'b000000000001000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               30'b000000000000100000000000000000:
                 data_out = data_in[12*width:13*width-1];
               30'b000000000000010000000000000000:
                 data_out = data_in[13*width:14*width-1];
               30'b000000000000001000000000000000:
                 data_out = data_in[14*width:15*width-1];
               30'b000000000000000100000000000000:
                 data_out = data_in[15*width:16*width-1];
               30'b000000000000000010000000000000:
                 data_out = data_in[16*width:17*width-1];
               30'b000000000000000001000000000000:
                 data_out = data_in[17*width:18*width-1];
               30'b000000000000000000100000000000:
                 data_out = data_in[18*width:19*width-1];
               30'b000000000000000000010000000000:
                 data_out = data_in[19*width:20*width-1];
               30'b000000000000000000001000000000:
                 data_out = data_in[20*width:21*width-1];
               30'b000000000000000000000100000000:
                 data_out = data_in[21*width:22*width-1];
               30'b000000000000000000000010000000:
                 data_out = data_in[22*width:23*width-1];
               30'b000000000000000000000001000000:
                 data_out = data_in[23*width:24*width-1];
               30'b000000000000000000000000100000:
                 data_out = data_in[24*width:25*width-1];
               30'b000000000000000000000000010000:
                 data_out = data_in[25*width:26*width-1];
               30'b000000000000000000000000001000:
                 data_out = data_in[26*width:27*width-1];
               30'b000000000000000000000000000100:
                 data_out = data_in[27*width:28*width-1];
               30'b000000000000000000000000000010:
                 data_out = data_in[28*width:29*width-1];
               30'b000000000000000000000000000001:
                 data_out = data_in[29*width:30*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 31)
        always@(select, data_in)
          begin
             case(select)
               31'b1000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               31'b0100000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               31'b0010000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               31'b0001000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               31'b0000100000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               31'b0000010000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               31'b0000001000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               31'b0000000100000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               31'b0000000010000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               31'b0000000001000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               31'b0000000000100000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               31'b0000000000010000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               31'b0000000000001000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               31'b0000000000000100000000000000000:
                 data_out = data_in[13*width:14*width-1];
               31'b0000000000000010000000000000000:
                 data_out = data_in[14*width:15*width-1];
               31'b0000000000000001000000000000000:
                 data_out = data_in[15*width:16*width-1];
               31'b0000000000000000100000000000000:
                 data_out = data_in[16*width:17*width-1];
               31'b0000000000000000010000000000000:
                 data_out = data_in[17*width:18*width-1];
               31'b0000000000000000001000000000000:
                 data_out = data_in[18*width:19*width-1];
               31'b0000000000000000000100000000000:
                 data_out = data_in[19*width:20*width-1];
               31'b0000000000000000000010000000000:
                 data_out = data_in[20*width:21*width-1];
               31'b0000000000000000000001000000000:
                 data_out = data_in[21*width:22*width-1];
               31'b0000000000000000000000100000000:
                 data_out = data_in[22*width:23*width-1];
               31'b0000000000000000000000010000000:
                 data_out = data_in[23*width:24*width-1];
               31'b0000000000000000000000001000000:
                 data_out = data_in[24*width:25*width-1];
               31'b0000000000000000000000000100000:
                 data_out = data_in[25*width:26*width-1];
               31'b0000000000000000000000000010000:
                 data_out = data_in[26*width:27*width-1];
               31'b0000000000000000000000000001000:
                 data_out = data_in[27*width:28*width-1];
               31'b0000000000000000000000000000100:
                 data_out = data_in[28*width:29*width-1];
               31'b0000000000000000000000000000010:
                 data_out = data_in[29*width:30*width-1];
               31'b0000000000000000000000000000001:
                 data_out = data_in[30*width:31*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 32)
        always@(select, data_in)
          begin
             case(select)
               32'b10000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               32'b01000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               32'b00100000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               32'b00010000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               32'b00001000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               32'b00000100000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               32'b00000010000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               32'b00000001000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               32'b00000000100000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               32'b00000000010000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               32'b00000000001000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               32'b00000000000100000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               32'b00000000000010000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               32'b00000000000001000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               32'b00000000000000100000000000000000:
                 data_out = data_in[14*width:15*width-1];
               32'b00000000000000010000000000000000:
                 data_out = data_in[15*width:16*width-1];
               32'b00000000000000001000000000000000:
                 data_out = data_in[16*width:17*width-1];
               32'b00000000000000000100000000000000:
                 data_out = data_in[17*width:18*width-1];
               32'b00000000000000000010000000000000:
                 data_out = data_in[18*width:19*width-1];
               32'b00000000000000000001000000000000:
                 data_out = data_in[19*width:20*width-1];
               32'b00000000000000000000100000000000:
                 data_out = data_in[20*width:21*width-1];
               32'b00000000000000000000010000000000:
                 data_out = data_in[21*width:22*width-1];
               32'b00000000000000000000001000000000:
                 data_out = data_in[22*width:23*width-1];
               32'b00000000000000000000000100000000:
                 data_out = data_in[23*width:24*width-1];
               32'b00000000000000000000000010000000:
                 data_out = data_in[24*width:25*width-1];
               32'b00000000000000000000000001000000:
                 data_out = data_in[25*width:26*width-1];
               32'b00000000000000000000000000100000:
                 data_out = data_in[26*width:27*width-1];
               32'b00000000000000000000000000010000:
                 data_out = data_in[27*width:28*width-1];
               32'b00000000000000000000000000001000:
                 data_out = data_in[28*width:29*width-1];
               32'b00000000000000000000000000000100:
                 data_out = data_in[29*width:30*width-1];
               32'b00000000000000000000000000000010:
                 data_out = data_in[30*width:31*width-1];
               32'b00000000000000000000000000000001:
                 data_out = data_in[31*width:32*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 33)
        always@(select, data_in)
          begin
             case(select)
               33'b100000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               33'b010000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               33'b001000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               33'b000100000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               33'b000010000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               33'b000001000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               33'b000000100000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               33'b000000010000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               33'b000000001000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               33'b000000000100000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               33'b000000000010000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               33'b000000000001000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               33'b000000000000100000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               33'b000000000000010000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               33'b000000000000001000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               33'b000000000000000100000000000000000:
                 data_out = data_in[15*width:16*width-1];
               33'b000000000000000010000000000000000:
                 data_out = data_in[16*width:17*width-1];
               33'b000000000000000001000000000000000:
                 data_out = data_in[17*width:18*width-1];
               33'b000000000000000000100000000000000:
                 data_out = data_in[18*width:19*width-1];
               33'b000000000000000000010000000000000:
                 data_out = data_in[19*width:20*width-1];
               33'b000000000000000000001000000000000:
                 data_out = data_in[20*width:21*width-1];
               33'b000000000000000000000100000000000:
                 data_out = data_in[21*width:22*width-1];
               33'b000000000000000000000010000000000:
                 data_out = data_in[22*width:23*width-1];
               33'b000000000000000000000001000000000:
                 data_out = data_in[23*width:24*width-1];
               33'b000000000000000000000000100000000:
                 data_out = data_in[24*width:25*width-1];
               33'b000000000000000000000000010000000:
                 data_out = data_in[25*width:26*width-1];
               33'b000000000000000000000000001000000:
                 data_out = data_in[26*width:27*width-1];
               33'b000000000000000000000000000100000:
                 data_out = data_in[27*width:28*width-1];
               33'b000000000000000000000000000010000:
                 data_out = data_in[28*width:29*width-1];
               33'b000000000000000000000000000001000:
                 data_out = data_in[29*width:30*width-1];
               33'b000000000000000000000000000000100:
                 data_out = data_in[30*width:31*width-1];
               33'b000000000000000000000000000000010:
                 data_out = data_in[31*width:32*width-1];
               33'b000000000000000000000000000000001:
                 data_out = data_in[32*width:33*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 34)
        always@(select, data_in)
          begin
             case(select)
               34'b1000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               34'b0100000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               34'b0010000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               34'b0001000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               34'b0000100000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               34'b0000010000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               34'b0000001000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               34'b0000000100000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               34'b0000000010000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               34'b0000000001000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               34'b0000000000100000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               34'b0000000000010000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               34'b0000000000001000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               34'b0000000000000100000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               34'b0000000000000010000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               34'b0000000000000001000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               34'b0000000000000000100000000000000000:
                 data_out = data_in[16*width:17*width-1];
               34'b0000000000000000010000000000000000:
                 data_out = data_in[17*width:18*width-1];
               34'b0000000000000000001000000000000000:
                 data_out = data_in[18*width:19*width-1];
               34'b0000000000000000000100000000000000:
                 data_out = data_in[19*width:20*width-1];
               34'b0000000000000000000010000000000000:
                 data_out = data_in[20*width:21*width-1];
               34'b0000000000000000000001000000000000:
                 data_out = data_in[21*width:22*width-1];
               34'b0000000000000000000000100000000000:
                 data_out = data_in[22*width:23*width-1];
               34'b0000000000000000000000010000000000:
                 data_out = data_in[23*width:24*width-1];
               34'b0000000000000000000000001000000000:
                 data_out = data_in[24*width:25*width-1];
               34'b0000000000000000000000000100000000:
                 data_out = data_in[25*width:26*width-1];
               34'b0000000000000000000000000010000000:
                 data_out = data_in[26*width:27*width-1];
               34'b0000000000000000000000000001000000:
                 data_out = data_in[27*width:28*width-1];
               34'b0000000000000000000000000000100000:
                 data_out = data_in[28*width:29*width-1];
               34'b0000000000000000000000000000010000:
                 data_out = data_in[29*width:30*width-1];
               34'b0000000000000000000000000000001000:
                 data_out = data_in[30*width:31*width-1];
               34'b0000000000000000000000000000000100:
                 data_out = data_in[31*width:32*width-1];
               34'b0000000000000000000000000000000010:
                 data_out = data_in[32*width:33*width-1];
               34'b0000000000000000000000000000000001:
                 data_out = data_in[33*width:34*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 35)
        always@(select, data_in)
          begin
             case(select)
               35'b10000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               35'b01000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               35'b00100000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               35'b00010000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               35'b00001000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               35'b00000100000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               35'b00000010000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               35'b00000001000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               35'b00000000100000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               35'b00000000010000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               35'b00000000001000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               35'b00000000000100000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               35'b00000000000010000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               35'b00000000000001000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               35'b00000000000000100000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               35'b00000000000000010000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               35'b00000000000000001000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               35'b00000000000000000100000000000000000:
                 data_out = data_in[17*width:18*width-1];
               35'b00000000000000000010000000000000000:
                 data_out = data_in[18*width:19*width-1];
               35'b00000000000000000001000000000000000:
                 data_out = data_in[19*width:20*width-1];
               35'b00000000000000000000100000000000000:
                 data_out = data_in[20*width:21*width-1];
               35'b00000000000000000000010000000000000:
                 data_out = data_in[21*width:22*width-1];
               35'b00000000000000000000001000000000000:
                 data_out = data_in[22*width:23*width-1];
               35'b00000000000000000000000100000000000:
                 data_out = data_in[23*width:24*width-1];
               35'b00000000000000000000000010000000000:
                 data_out = data_in[24*width:25*width-1];
               35'b00000000000000000000000001000000000:
                 data_out = data_in[25*width:26*width-1];
               35'b00000000000000000000000000100000000:
                 data_out = data_in[26*width:27*width-1];
               35'b00000000000000000000000000010000000:
                 data_out = data_in[27*width:28*width-1];
               35'b00000000000000000000000000001000000:
                 data_out = data_in[28*width:29*width-1];
               35'b00000000000000000000000000000100000:
                 data_out = data_in[29*width:30*width-1];
               35'b00000000000000000000000000000010000:
                 data_out = data_in[30*width:31*width-1];
               35'b00000000000000000000000000000001000:
                 data_out = data_in[31*width:32*width-1];
               35'b00000000000000000000000000000000100:
                 data_out = data_in[32*width:33*width-1];
               35'b00000000000000000000000000000000010:
                 data_out = data_in[33*width:34*width-1];
               35'b00000000000000000000000000000000001:
                 data_out = data_in[34*width:35*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 36)
        always@(select, data_in)
          begin
             case(select)
               36'b100000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               36'b010000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               36'b001000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               36'b000100000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               36'b000010000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               36'b000001000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               36'b000000100000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               36'b000000010000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               36'b000000001000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               36'b000000000100000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               36'b000000000010000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               36'b000000000001000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               36'b000000000000100000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               36'b000000000000010000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               36'b000000000000001000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               36'b000000000000000100000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               36'b000000000000000010000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               36'b000000000000000001000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               36'b000000000000000000100000000000000000:
                 data_out = data_in[18*width:19*width-1];
               36'b000000000000000000010000000000000000:
                 data_out = data_in[19*width:20*width-1];
               36'b000000000000000000001000000000000000:
                 data_out = data_in[20*width:21*width-1];
               36'b000000000000000000000100000000000000:
                 data_out = data_in[21*width:22*width-1];
               36'b000000000000000000000010000000000000:
                 data_out = data_in[22*width:23*width-1];
               36'b000000000000000000000001000000000000:
                 data_out = data_in[23*width:24*width-1];
               36'b000000000000000000000000100000000000:
                 data_out = data_in[24*width:25*width-1];
               36'b000000000000000000000000010000000000:
                 data_out = data_in[25*width:26*width-1];
               36'b000000000000000000000000001000000000:
                 data_out = data_in[26*width:27*width-1];
               36'b000000000000000000000000000100000000:
                 data_out = data_in[27*width:28*width-1];
               36'b000000000000000000000000000010000000:
                 data_out = data_in[28*width:29*width-1];
               36'b000000000000000000000000000001000000:
                 data_out = data_in[29*width:30*width-1];
               36'b000000000000000000000000000000100000:
                 data_out = data_in[30*width:31*width-1];
               36'b000000000000000000000000000000010000:
                 data_out = data_in[31*width:32*width-1];
               36'b000000000000000000000000000000001000:
                 data_out = data_in[32*width:33*width-1];
               36'b000000000000000000000000000000000100:
                 data_out = data_in[33*width:34*width-1];
               36'b000000000000000000000000000000000010:
                 data_out = data_in[34*width:35*width-1];
               36'b000000000000000000000000000000000001:
                 data_out = data_in[35*width:36*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 37)
        always@(select, data_in)
          begin
             case(select)
               37'b1000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               37'b0100000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               37'b0010000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               37'b0001000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               37'b0000100000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               37'b0000010000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               37'b0000001000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               37'b0000000100000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               37'b0000000010000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               37'b0000000001000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               37'b0000000000100000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               37'b0000000000010000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               37'b0000000000001000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               37'b0000000000000100000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               37'b0000000000000010000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               37'b0000000000000001000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               37'b0000000000000000100000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               37'b0000000000000000010000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               37'b0000000000000000001000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               37'b0000000000000000000100000000000000000:
                 data_out = data_in[19*width:20*width-1];
               37'b0000000000000000000010000000000000000:
                 data_out = data_in[20*width:21*width-1];
               37'b0000000000000000000001000000000000000:
                 data_out = data_in[21*width:22*width-1];
               37'b0000000000000000000000100000000000000:
                 data_out = data_in[22*width:23*width-1];
               37'b0000000000000000000000010000000000000:
                 data_out = data_in[23*width:24*width-1];
               37'b0000000000000000000000001000000000000:
                 data_out = data_in[24*width:25*width-1];
               37'b0000000000000000000000000100000000000:
                 data_out = data_in[25*width:26*width-1];
               37'b0000000000000000000000000010000000000:
                 data_out = data_in[26*width:27*width-1];
               37'b0000000000000000000000000001000000000:
                 data_out = data_in[27*width:28*width-1];
               37'b0000000000000000000000000000100000000:
                 data_out = data_in[28*width:29*width-1];
               37'b0000000000000000000000000000010000000:
                 data_out = data_in[29*width:30*width-1];
               37'b0000000000000000000000000000001000000:
                 data_out = data_in[30*width:31*width-1];
               37'b0000000000000000000000000000000100000:
                 data_out = data_in[31*width:32*width-1];
               37'b0000000000000000000000000000000010000:
                 data_out = data_in[32*width:33*width-1];
               37'b0000000000000000000000000000000001000:
                 data_out = data_in[33*width:34*width-1];
               37'b0000000000000000000000000000000000100:
                 data_out = data_in[34*width:35*width-1];
               37'b0000000000000000000000000000000000010:
                 data_out = data_in[35*width:36*width-1];
               37'b0000000000000000000000000000000000001:
                 data_out = data_in[36*width:37*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 38)
        always@(select, data_in)
          begin
             case(select)
               38'b10000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               38'b01000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               38'b00100000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               38'b00010000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               38'b00001000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               38'b00000100000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               38'b00000010000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               38'b00000001000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               38'b00000000100000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               38'b00000000010000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               38'b00000000001000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               38'b00000000000100000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               38'b00000000000010000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               38'b00000000000001000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               38'b00000000000000100000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               38'b00000000000000010000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               38'b00000000000000001000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               38'b00000000000000000100000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               38'b00000000000000000010000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               38'b00000000000000000001000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               38'b00000000000000000000100000000000000000:
                 data_out = data_in[20*width:21*width-1];
               38'b00000000000000000000010000000000000000:
                 data_out = data_in[21*width:22*width-1];
               38'b00000000000000000000001000000000000000:
                 data_out = data_in[22*width:23*width-1];
               38'b00000000000000000000000100000000000000:
                 data_out = data_in[23*width:24*width-1];
               38'b00000000000000000000000010000000000000:
                 data_out = data_in[24*width:25*width-1];
               38'b00000000000000000000000001000000000000:
                 data_out = data_in[25*width:26*width-1];
               38'b00000000000000000000000000100000000000:
                 data_out = data_in[26*width:27*width-1];
               38'b00000000000000000000000000010000000000:
                 data_out = data_in[27*width:28*width-1];
               38'b00000000000000000000000000001000000000:
                 data_out = data_in[28*width:29*width-1];
               38'b00000000000000000000000000000100000000:
                 data_out = data_in[29*width:30*width-1];
               38'b00000000000000000000000000000010000000:
                 data_out = data_in[30*width:31*width-1];
               38'b00000000000000000000000000000001000000:
                 data_out = data_in[31*width:32*width-1];
               38'b00000000000000000000000000000000100000:
                 data_out = data_in[32*width:33*width-1];
               38'b00000000000000000000000000000000010000:
                 data_out = data_in[33*width:34*width-1];
               38'b00000000000000000000000000000000001000:
                 data_out = data_in[34*width:35*width-1];
               38'b00000000000000000000000000000000000100:
                 data_out = data_in[35*width:36*width-1];
               38'b00000000000000000000000000000000000010:
                 data_out = data_in[36*width:37*width-1];
               38'b00000000000000000000000000000000000001:
                 data_out = data_in[37*width:38*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 39)
        always@(select, data_in)
          begin
             case(select)
               39'b100000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               39'b010000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               39'b001000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               39'b000100000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               39'b000010000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               39'b000001000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               39'b000000100000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               39'b000000010000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               39'b000000001000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               39'b000000000100000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               39'b000000000010000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               39'b000000000001000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               39'b000000000000100000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               39'b000000000000010000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               39'b000000000000001000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               39'b000000000000000100000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               39'b000000000000000010000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               39'b000000000000000001000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               39'b000000000000000000100000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               39'b000000000000000000010000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               39'b000000000000000000001000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               39'b000000000000000000000100000000000000000:
                 data_out = data_in[21*width:22*width-1];
               39'b000000000000000000000010000000000000000:
                 data_out = data_in[22*width:23*width-1];
               39'b000000000000000000000001000000000000000:
                 data_out = data_in[23*width:24*width-1];
               39'b000000000000000000000000100000000000000:
                 data_out = data_in[24*width:25*width-1];
               39'b000000000000000000000000010000000000000:
                 data_out = data_in[25*width:26*width-1];
               39'b000000000000000000000000001000000000000:
                 data_out = data_in[26*width:27*width-1];
               39'b000000000000000000000000000100000000000:
                 data_out = data_in[27*width:28*width-1];
               39'b000000000000000000000000000010000000000:
                 data_out = data_in[28*width:29*width-1];
               39'b000000000000000000000000000001000000000:
                 data_out = data_in[29*width:30*width-1];
               39'b000000000000000000000000000000100000000:
                 data_out = data_in[30*width:31*width-1];
               39'b000000000000000000000000000000010000000:
                 data_out = data_in[31*width:32*width-1];
               39'b000000000000000000000000000000001000000:
                 data_out = data_in[32*width:33*width-1];
               39'b000000000000000000000000000000000100000:
                 data_out = data_in[33*width:34*width-1];
               39'b000000000000000000000000000000000010000:
                 data_out = data_in[34*width:35*width-1];
               39'b000000000000000000000000000000000001000:
                 data_out = data_in[35*width:36*width-1];
               39'b000000000000000000000000000000000000100:
                 data_out = data_in[36*width:37*width-1];
               39'b000000000000000000000000000000000000010:
                 data_out = data_in[37*width:38*width-1];
               39'b000000000000000000000000000000000000001:
                 data_out = data_in[38*width:39*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 40)
        always@(select, data_in)
          begin
             case(select)
               40'b1000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               40'b0100000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               40'b0010000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               40'b0001000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               40'b0000100000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               40'b0000010000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               40'b0000001000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               40'b0000000100000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               40'b0000000010000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               40'b0000000001000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               40'b0000000000100000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               40'b0000000000010000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               40'b0000000000001000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               40'b0000000000000100000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               40'b0000000000000010000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               40'b0000000000000001000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               40'b0000000000000000100000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               40'b0000000000000000010000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               40'b0000000000000000001000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               40'b0000000000000000000100000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               40'b0000000000000000000010000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               40'b0000000000000000000001000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               40'b0000000000000000000000100000000000000000:
                 data_out = data_in[22*width:23*width-1];
               40'b0000000000000000000000010000000000000000:
                 data_out = data_in[23*width:24*width-1];
               40'b0000000000000000000000001000000000000000:
                 data_out = data_in[24*width:25*width-1];
               40'b0000000000000000000000000100000000000000:
                 data_out = data_in[25*width:26*width-1];
               40'b0000000000000000000000000010000000000000:
                 data_out = data_in[26*width:27*width-1];
               40'b0000000000000000000000000001000000000000:
                 data_out = data_in[27*width:28*width-1];
               40'b0000000000000000000000000000100000000000:
                 data_out = data_in[28*width:29*width-1];
               40'b0000000000000000000000000000010000000000:
                 data_out = data_in[29*width:30*width-1];
               40'b0000000000000000000000000000001000000000:
                 data_out = data_in[30*width:31*width-1];
               40'b0000000000000000000000000000000100000000:
                 data_out = data_in[31*width:32*width-1];
               40'b0000000000000000000000000000000010000000:
                 data_out = data_in[32*width:33*width-1];
               40'b0000000000000000000000000000000001000000:
                 data_out = data_in[33*width:34*width-1];
               40'b0000000000000000000000000000000000100000:
                 data_out = data_in[34*width:35*width-1];
               40'b0000000000000000000000000000000000010000:
                 data_out = data_in[35*width:36*width-1];
               40'b0000000000000000000000000000000000001000:
                 data_out = data_in[36*width:37*width-1];
               40'b0000000000000000000000000000000000000100:
                 data_out = data_in[37*width:38*width-1];
               40'b0000000000000000000000000000000000000010:
                 data_out = data_in[38*width:39*width-1];
               40'b0000000000000000000000000000000000000001:
                 data_out = data_in[39*width:40*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 41)
        always@(select, data_in)
          begin
             case(select)
               41'b10000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               41'b01000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               41'b00100000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               41'b00010000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               41'b00001000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               41'b00000100000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               41'b00000010000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               41'b00000001000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               41'b00000000100000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               41'b00000000010000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               41'b00000000001000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               41'b00000000000100000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               41'b00000000000010000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               41'b00000000000001000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               41'b00000000000000100000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               41'b00000000000000010000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               41'b00000000000000001000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               41'b00000000000000000100000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               41'b00000000000000000010000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               41'b00000000000000000001000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               41'b00000000000000000000100000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               41'b00000000000000000000010000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               41'b00000000000000000000001000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               41'b00000000000000000000000100000000000000000:
                 data_out = data_in[23*width:24*width-1];
               41'b00000000000000000000000010000000000000000:
                 data_out = data_in[24*width:25*width-1];
               41'b00000000000000000000000001000000000000000:
                 data_out = data_in[25*width:26*width-1];
               41'b00000000000000000000000000100000000000000:
                 data_out = data_in[26*width:27*width-1];
               41'b00000000000000000000000000010000000000000:
                 data_out = data_in[27*width:28*width-1];
               41'b00000000000000000000000000001000000000000:
                 data_out = data_in[28*width:29*width-1];
               41'b00000000000000000000000000000100000000000:
                 data_out = data_in[29*width:30*width-1];
               41'b00000000000000000000000000000010000000000:
                 data_out = data_in[30*width:31*width-1];
               41'b00000000000000000000000000000001000000000:
                 data_out = data_in[31*width:32*width-1];
               41'b00000000000000000000000000000000100000000:
                 data_out = data_in[32*width:33*width-1];
               41'b00000000000000000000000000000000010000000:
                 data_out = data_in[33*width:34*width-1];
               41'b00000000000000000000000000000000001000000:
                 data_out = data_in[34*width:35*width-1];
               41'b00000000000000000000000000000000000100000:
                 data_out = data_in[35*width:36*width-1];
               41'b00000000000000000000000000000000000010000:
                 data_out = data_in[36*width:37*width-1];
               41'b00000000000000000000000000000000000001000:
                 data_out = data_in[37*width:38*width-1];
               41'b00000000000000000000000000000000000000100:
                 data_out = data_in[38*width:39*width-1];
               41'b00000000000000000000000000000000000000010:
                 data_out = data_in[39*width:40*width-1];
               41'b00000000000000000000000000000000000000001:
                 data_out = data_in[40*width:41*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 42)
        always@(select, data_in)
          begin
             case(select)
               42'b100000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               42'b010000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               42'b001000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               42'b000100000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               42'b000010000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               42'b000001000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               42'b000000100000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               42'b000000010000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               42'b000000001000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               42'b000000000100000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               42'b000000000010000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               42'b000000000001000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               42'b000000000000100000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               42'b000000000000010000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               42'b000000000000001000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               42'b000000000000000100000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               42'b000000000000000010000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               42'b000000000000000001000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               42'b000000000000000000100000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               42'b000000000000000000010000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               42'b000000000000000000001000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               42'b000000000000000000000100000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               42'b000000000000000000000010000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               42'b000000000000000000000001000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               42'b000000000000000000000000100000000000000000:
                 data_out = data_in[24*width:25*width-1];
               42'b000000000000000000000000010000000000000000:
                 data_out = data_in[25*width:26*width-1];
               42'b000000000000000000000000001000000000000000:
                 data_out = data_in[26*width:27*width-1];
               42'b000000000000000000000000000100000000000000:
                 data_out = data_in[27*width:28*width-1];
               42'b000000000000000000000000000010000000000000:
                 data_out = data_in[28*width:29*width-1];
               42'b000000000000000000000000000001000000000000:
                 data_out = data_in[29*width:30*width-1];
               42'b000000000000000000000000000000100000000000:
                 data_out = data_in[30*width:31*width-1];
               42'b000000000000000000000000000000010000000000:
                 data_out = data_in[31*width:32*width-1];
               42'b000000000000000000000000000000001000000000:
                 data_out = data_in[32*width:33*width-1];
               42'b000000000000000000000000000000000100000000:
                 data_out = data_in[33*width:34*width-1];
               42'b000000000000000000000000000000000010000000:
                 data_out = data_in[34*width:35*width-1];
               42'b000000000000000000000000000000000001000000:
                 data_out = data_in[35*width:36*width-1];
               42'b000000000000000000000000000000000000100000:
                 data_out = data_in[36*width:37*width-1];
               42'b000000000000000000000000000000000000010000:
                 data_out = data_in[37*width:38*width-1];
               42'b000000000000000000000000000000000000001000:
                 data_out = data_in[38*width:39*width-1];
               42'b000000000000000000000000000000000000000100:
                 data_out = data_in[39*width:40*width-1];
               42'b000000000000000000000000000000000000000010:
                 data_out = data_in[40*width:41*width-1];
               42'b000000000000000000000000000000000000000001:
                 data_out = data_in[41*width:42*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 43)
        always@(select, data_in)
          begin
             case(select)
               43'b1000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               43'b0100000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               43'b0010000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               43'b0001000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               43'b0000100000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               43'b0000010000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               43'b0000001000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               43'b0000000100000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               43'b0000000010000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               43'b0000000001000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               43'b0000000000100000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               43'b0000000000010000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               43'b0000000000001000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               43'b0000000000000100000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               43'b0000000000000010000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               43'b0000000000000001000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               43'b0000000000000000100000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               43'b0000000000000000010000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               43'b0000000000000000001000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               43'b0000000000000000000100000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               43'b0000000000000000000010000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               43'b0000000000000000000001000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               43'b0000000000000000000000100000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               43'b0000000000000000000000010000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               43'b0000000000000000000000001000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               43'b0000000000000000000000000100000000000000000:
                 data_out = data_in[25*width:26*width-1];
               43'b0000000000000000000000000010000000000000000:
                 data_out = data_in[26*width:27*width-1];
               43'b0000000000000000000000000001000000000000000:
                 data_out = data_in[27*width:28*width-1];
               43'b0000000000000000000000000000100000000000000:
                 data_out = data_in[28*width:29*width-1];
               43'b0000000000000000000000000000010000000000000:
                 data_out = data_in[29*width:30*width-1];
               43'b0000000000000000000000000000001000000000000:
                 data_out = data_in[30*width:31*width-1];
               43'b0000000000000000000000000000000100000000000:
                 data_out = data_in[31*width:32*width-1];
               43'b0000000000000000000000000000000010000000000:
                 data_out = data_in[32*width:33*width-1];
               43'b0000000000000000000000000000000001000000000:
                 data_out = data_in[33*width:34*width-1];
               43'b0000000000000000000000000000000000100000000:
                 data_out = data_in[34*width:35*width-1];
               43'b0000000000000000000000000000000000010000000:
                 data_out = data_in[35*width:36*width-1];
               43'b0000000000000000000000000000000000001000000:
                 data_out = data_in[36*width:37*width-1];
               43'b0000000000000000000000000000000000000100000:
                 data_out = data_in[37*width:38*width-1];
               43'b0000000000000000000000000000000000000010000:
                 data_out = data_in[38*width:39*width-1];
               43'b0000000000000000000000000000000000000001000:
                 data_out = data_in[39*width:40*width-1];
               43'b0000000000000000000000000000000000000000100:
                 data_out = data_in[40*width:41*width-1];
               43'b0000000000000000000000000000000000000000010:
                 data_out = data_in[41*width:42*width-1];
               43'b0000000000000000000000000000000000000000001:
                 data_out = data_in[42*width:43*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 44)
        always@(select, data_in)
          begin
             case(select)
               44'b10000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               44'b01000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               44'b00100000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               44'b00010000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               44'b00001000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               44'b00000100000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               44'b00000010000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               44'b00000001000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               44'b00000000100000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               44'b00000000010000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               44'b00000000001000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               44'b00000000000100000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               44'b00000000000010000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               44'b00000000000001000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               44'b00000000000000100000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               44'b00000000000000010000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               44'b00000000000000001000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               44'b00000000000000000100000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               44'b00000000000000000010000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               44'b00000000000000000001000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               44'b00000000000000000000100000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               44'b00000000000000000000010000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               44'b00000000000000000000001000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               44'b00000000000000000000000100000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               44'b00000000000000000000000010000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               44'b00000000000000000000000001000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               44'b00000000000000000000000000100000000000000000:
                 data_out = data_in[26*width:27*width-1];
               44'b00000000000000000000000000010000000000000000:
                 data_out = data_in[27*width:28*width-1];
               44'b00000000000000000000000000001000000000000000:
                 data_out = data_in[28*width:29*width-1];
               44'b00000000000000000000000000000100000000000000:
                 data_out = data_in[29*width:30*width-1];
               44'b00000000000000000000000000000010000000000000:
                 data_out = data_in[30*width:31*width-1];
               44'b00000000000000000000000000000001000000000000:
                 data_out = data_in[31*width:32*width-1];
               44'b00000000000000000000000000000000100000000000:
                 data_out = data_in[32*width:33*width-1];
               44'b00000000000000000000000000000000010000000000:
                 data_out = data_in[33*width:34*width-1];
               44'b00000000000000000000000000000000001000000000:
                 data_out = data_in[34*width:35*width-1];
               44'b00000000000000000000000000000000000100000000:
                 data_out = data_in[35*width:36*width-1];
               44'b00000000000000000000000000000000000010000000:
                 data_out = data_in[36*width:37*width-1];
               44'b00000000000000000000000000000000000001000000:
                 data_out = data_in[37*width:38*width-1];
               44'b00000000000000000000000000000000000000100000:
                 data_out = data_in[38*width:39*width-1];
               44'b00000000000000000000000000000000000000010000:
                 data_out = data_in[39*width:40*width-1];
               44'b00000000000000000000000000000000000000001000:
                 data_out = data_in[40*width:41*width-1];
               44'b00000000000000000000000000000000000000000100:
                 data_out = data_in[41*width:42*width-1];
               44'b00000000000000000000000000000000000000000010:
                 data_out = data_in[42*width:43*width-1];
               44'b00000000000000000000000000000000000000000001:
                 data_out = data_in[43*width:44*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 45)
        always@(select, data_in)
          begin
             case(select)
               45'b100000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               45'b010000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               45'b001000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               45'b000100000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               45'b000010000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               45'b000001000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               45'b000000100000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               45'b000000010000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               45'b000000001000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               45'b000000000100000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               45'b000000000010000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               45'b000000000001000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               45'b000000000000100000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               45'b000000000000010000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               45'b000000000000001000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               45'b000000000000000100000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               45'b000000000000000010000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               45'b000000000000000001000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               45'b000000000000000000100000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               45'b000000000000000000010000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               45'b000000000000000000001000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               45'b000000000000000000000100000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               45'b000000000000000000000010000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               45'b000000000000000000000001000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               45'b000000000000000000000000100000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               45'b000000000000000000000000010000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               45'b000000000000000000000000001000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               45'b000000000000000000000000000100000000000000000:
                 data_out = data_in[27*width:28*width-1];
               45'b000000000000000000000000000010000000000000000:
                 data_out = data_in[28*width:29*width-1];
               45'b000000000000000000000000000001000000000000000:
                 data_out = data_in[29*width:30*width-1];
               45'b000000000000000000000000000000100000000000000:
                 data_out = data_in[30*width:31*width-1];
               45'b000000000000000000000000000000010000000000000:
                 data_out = data_in[31*width:32*width-1];
               45'b000000000000000000000000000000001000000000000:
                 data_out = data_in[32*width:33*width-1];
               45'b000000000000000000000000000000000100000000000:
                 data_out = data_in[33*width:34*width-1];
               45'b000000000000000000000000000000000010000000000:
                 data_out = data_in[34*width:35*width-1];
               45'b000000000000000000000000000000000001000000000:
                 data_out = data_in[35*width:36*width-1];
               45'b000000000000000000000000000000000000100000000:
                 data_out = data_in[36*width:37*width-1];
               45'b000000000000000000000000000000000000010000000:
                 data_out = data_in[37*width:38*width-1];
               45'b000000000000000000000000000000000000001000000:
                 data_out = data_in[38*width:39*width-1];
               45'b000000000000000000000000000000000000000100000:
                 data_out = data_in[39*width:40*width-1];
               45'b000000000000000000000000000000000000000010000:
                 data_out = data_in[40*width:41*width-1];
               45'b000000000000000000000000000000000000000001000:
                 data_out = data_in[41*width:42*width-1];
               45'b000000000000000000000000000000000000000000100:
                 data_out = data_in[42*width:43*width-1];
               45'b000000000000000000000000000000000000000000010:
                 data_out = data_in[43*width:44*width-1];
               45'b000000000000000000000000000000000000000000001:
                 data_out = data_in[44*width:45*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 46)
        always@(select, data_in)
          begin
             case(select)
               46'b1000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               46'b0100000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               46'b0010000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               46'b0001000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               46'b0000100000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               46'b0000010000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               46'b0000001000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               46'b0000000100000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               46'b0000000010000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               46'b0000000001000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               46'b0000000000100000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               46'b0000000000010000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               46'b0000000000001000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               46'b0000000000000100000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               46'b0000000000000010000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               46'b0000000000000001000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               46'b0000000000000000100000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               46'b0000000000000000010000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               46'b0000000000000000001000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               46'b0000000000000000000100000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               46'b0000000000000000000010000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               46'b0000000000000000000001000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               46'b0000000000000000000000100000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               46'b0000000000000000000000010000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               46'b0000000000000000000000001000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               46'b0000000000000000000000000100000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               46'b0000000000000000000000000010000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               46'b0000000000000000000000000001000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               46'b0000000000000000000000000000100000000000000000:
                 data_out = data_in[28*width:29*width-1];
               46'b0000000000000000000000000000010000000000000000:
                 data_out = data_in[29*width:30*width-1];
               46'b0000000000000000000000000000001000000000000000:
                 data_out = data_in[30*width:31*width-1];
               46'b0000000000000000000000000000000100000000000000:
                 data_out = data_in[31*width:32*width-1];
               46'b0000000000000000000000000000000010000000000000:
                 data_out = data_in[32*width:33*width-1];
               46'b0000000000000000000000000000000001000000000000:
                 data_out = data_in[33*width:34*width-1];
               46'b0000000000000000000000000000000000100000000000:
                 data_out = data_in[34*width:35*width-1];
               46'b0000000000000000000000000000000000010000000000:
                 data_out = data_in[35*width:36*width-1];
               46'b0000000000000000000000000000000000001000000000:
                 data_out = data_in[36*width:37*width-1];
               46'b0000000000000000000000000000000000000100000000:
                 data_out = data_in[37*width:38*width-1];
               46'b0000000000000000000000000000000000000010000000:
                 data_out = data_in[38*width:39*width-1];
               46'b0000000000000000000000000000000000000001000000:
                 data_out = data_in[39*width:40*width-1];
               46'b0000000000000000000000000000000000000000100000:
                 data_out = data_in[40*width:41*width-1];
               46'b0000000000000000000000000000000000000000010000:
                 data_out = data_in[41*width:42*width-1];
               46'b0000000000000000000000000000000000000000001000:
                 data_out = data_in[42*width:43*width-1];
               46'b0000000000000000000000000000000000000000000100:
                 data_out = data_in[43*width:44*width-1];
               46'b0000000000000000000000000000000000000000000010:
                 data_out = data_in[44*width:45*width-1];
               46'b0000000000000000000000000000000000000000000001:
                 data_out = data_in[45*width:46*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 47)
        always@(select, data_in)
          begin
             case(select)
               47'b10000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               47'b01000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               47'b00100000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               47'b00010000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               47'b00001000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               47'b00000100000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               47'b00000010000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               47'b00000001000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               47'b00000000100000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               47'b00000000010000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               47'b00000000001000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               47'b00000000000100000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               47'b00000000000010000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               47'b00000000000001000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               47'b00000000000000100000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               47'b00000000000000010000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               47'b00000000000000001000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               47'b00000000000000000100000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               47'b00000000000000000010000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               47'b00000000000000000001000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               47'b00000000000000000000100000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               47'b00000000000000000000010000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               47'b00000000000000000000001000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               47'b00000000000000000000000100000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               47'b00000000000000000000000010000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               47'b00000000000000000000000001000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               47'b00000000000000000000000000100000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               47'b00000000000000000000000000010000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               47'b00000000000000000000000000001000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               47'b00000000000000000000000000000100000000000000000:
                 data_out = data_in[29*width:30*width-1];
               47'b00000000000000000000000000000010000000000000000:
                 data_out = data_in[30*width:31*width-1];
               47'b00000000000000000000000000000001000000000000000:
                 data_out = data_in[31*width:32*width-1];
               47'b00000000000000000000000000000000100000000000000:
                 data_out = data_in[32*width:33*width-1];
               47'b00000000000000000000000000000000010000000000000:
                 data_out = data_in[33*width:34*width-1];
               47'b00000000000000000000000000000000001000000000000:
                 data_out = data_in[34*width:35*width-1];
               47'b00000000000000000000000000000000000100000000000:
                 data_out = data_in[35*width:36*width-1];
               47'b00000000000000000000000000000000000010000000000:
                 data_out = data_in[36*width:37*width-1];
               47'b00000000000000000000000000000000000001000000000:
                 data_out = data_in[37*width:38*width-1];
               47'b00000000000000000000000000000000000000100000000:
                 data_out = data_in[38*width:39*width-1];
               47'b00000000000000000000000000000000000000010000000:
                 data_out = data_in[39*width:40*width-1];
               47'b00000000000000000000000000000000000000001000000:
                 data_out = data_in[40*width:41*width-1];
               47'b00000000000000000000000000000000000000000100000:
                 data_out = data_in[41*width:42*width-1];
               47'b00000000000000000000000000000000000000000010000:
                 data_out = data_in[42*width:43*width-1];
               47'b00000000000000000000000000000000000000000001000:
                 data_out = data_in[43*width:44*width-1];
               47'b00000000000000000000000000000000000000000000100:
                 data_out = data_in[44*width:45*width-1];
               47'b00000000000000000000000000000000000000000000010:
                 data_out = data_in[45*width:46*width-1];
               47'b00000000000000000000000000000000000000000000001:
                 data_out = data_in[46*width:47*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 48)
        always@(select, data_in)
          begin
             case(select)
               48'b100000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               48'b010000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               48'b001000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               48'b000100000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               48'b000010000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               48'b000001000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               48'b000000100000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               48'b000000010000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               48'b000000001000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               48'b000000000100000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               48'b000000000010000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               48'b000000000001000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               48'b000000000000100000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               48'b000000000000010000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               48'b000000000000001000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               48'b000000000000000100000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               48'b000000000000000010000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               48'b000000000000000001000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               48'b000000000000000000100000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               48'b000000000000000000010000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               48'b000000000000000000001000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               48'b000000000000000000000100000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               48'b000000000000000000000010000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               48'b000000000000000000000001000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               48'b000000000000000000000000100000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               48'b000000000000000000000000010000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               48'b000000000000000000000000001000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               48'b000000000000000000000000000100000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               48'b000000000000000000000000000010000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               48'b000000000000000000000000000001000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               48'b000000000000000000000000000000100000000000000000:
                 data_out = data_in[30*width:31*width-1];
               48'b000000000000000000000000000000010000000000000000:
                 data_out = data_in[31*width:32*width-1];
               48'b000000000000000000000000000000001000000000000000:
                 data_out = data_in[32*width:33*width-1];
               48'b000000000000000000000000000000000100000000000000:
                 data_out = data_in[33*width:34*width-1];
               48'b000000000000000000000000000000000010000000000000:
                 data_out = data_in[34*width:35*width-1];
               48'b000000000000000000000000000000000001000000000000:
                 data_out = data_in[35*width:36*width-1];
               48'b000000000000000000000000000000000000100000000000:
                 data_out = data_in[36*width:37*width-1];
               48'b000000000000000000000000000000000000010000000000:
                 data_out = data_in[37*width:38*width-1];
               48'b000000000000000000000000000000000000001000000000:
                 data_out = data_in[38*width:39*width-1];
               48'b000000000000000000000000000000000000000100000000:
                 data_out = data_in[39*width:40*width-1];
               48'b000000000000000000000000000000000000000010000000:
                 data_out = data_in[40*width:41*width-1];
               48'b000000000000000000000000000000000000000001000000:
                 data_out = data_in[41*width:42*width-1];
               48'b000000000000000000000000000000000000000000100000:
                 data_out = data_in[42*width:43*width-1];
               48'b000000000000000000000000000000000000000000010000:
                 data_out = data_in[43*width:44*width-1];
               48'b000000000000000000000000000000000000000000001000:
                 data_out = data_in[44*width:45*width-1];
               48'b000000000000000000000000000000000000000000000100:
                 data_out = data_in[45*width:46*width-1];
               48'b000000000000000000000000000000000000000000000010:
                 data_out = data_in[46*width:47*width-1];
               48'b000000000000000000000000000000000000000000000001:
                 data_out = data_in[47*width:48*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 49)
        always@(select, data_in)
          begin
             case(select)
               49'b1000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               49'b0100000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               49'b0010000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               49'b0001000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               49'b0000100000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               49'b0000010000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               49'b0000001000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               49'b0000000100000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               49'b0000000010000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               49'b0000000001000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               49'b0000000000100000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               49'b0000000000010000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               49'b0000000000001000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               49'b0000000000000100000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               49'b0000000000000010000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               49'b0000000000000001000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               49'b0000000000000000100000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               49'b0000000000000000010000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               49'b0000000000000000001000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               49'b0000000000000000000100000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               49'b0000000000000000000010000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               49'b0000000000000000000001000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               49'b0000000000000000000000100000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               49'b0000000000000000000000010000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               49'b0000000000000000000000001000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               49'b0000000000000000000000000100000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               49'b0000000000000000000000000010000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               49'b0000000000000000000000000001000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               49'b0000000000000000000000000000100000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               49'b0000000000000000000000000000010000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               49'b0000000000000000000000000000001000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               49'b0000000000000000000000000000000100000000000000000:
                 data_out = data_in[31*width:32*width-1];
               49'b0000000000000000000000000000000010000000000000000:
                 data_out = data_in[32*width:33*width-1];
               49'b0000000000000000000000000000000001000000000000000:
                 data_out = data_in[33*width:34*width-1];
               49'b0000000000000000000000000000000000100000000000000:
                 data_out = data_in[34*width:35*width-1];
               49'b0000000000000000000000000000000000010000000000000:
                 data_out = data_in[35*width:36*width-1];
               49'b0000000000000000000000000000000000001000000000000:
                 data_out = data_in[36*width:37*width-1];
               49'b0000000000000000000000000000000000000100000000000:
                 data_out = data_in[37*width:38*width-1];
               49'b0000000000000000000000000000000000000010000000000:
                 data_out = data_in[38*width:39*width-1];
               49'b0000000000000000000000000000000000000001000000000:
                 data_out = data_in[39*width:40*width-1];
               49'b0000000000000000000000000000000000000000100000000:
                 data_out = data_in[40*width:41*width-1];
               49'b0000000000000000000000000000000000000000010000000:
                 data_out = data_in[41*width:42*width-1];
               49'b0000000000000000000000000000000000000000001000000:
                 data_out = data_in[42*width:43*width-1];
               49'b0000000000000000000000000000000000000000000100000:
                 data_out = data_in[43*width:44*width-1];
               49'b0000000000000000000000000000000000000000000010000:
                 data_out = data_in[44*width:45*width-1];
               49'b0000000000000000000000000000000000000000000001000:
                 data_out = data_in[45*width:46*width-1];
               49'b0000000000000000000000000000000000000000000000100:
                 data_out = data_in[46*width:47*width-1];
               49'b0000000000000000000000000000000000000000000000010:
                 data_out = data_in[47*width:48*width-1];
               49'b0000000000000000000000000000000000000000000000001:
                 data_out = data_in[48*width:49*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 50)
        always@(select, data_in)
          begin
             case(select)
               50'b10000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               50'b01000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               50'b00100000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               50'b00010000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               50'b00001000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               50'b00000100000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               50'b00000010000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               50'b00000001000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               50'b00000000100000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               50'b00000000010000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               50'b00000000001000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               50'b00000000000100000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               50'b00000000000010000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               50'b00000000000001000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               50'b00000000000000100000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               50'b00000000000000010000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               50'b00000000000000001000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               50'b00000000000000000100000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               50'b00000000000000000010000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               50'b00000000000000000001000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               50'b00000000000000000000100000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               50'b00000000000000000000010000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               50'b00000000000000000000001000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               50'b00000000000000000000000100000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               50'b00000000000000000000000010000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               50'b00000000000000000000000001000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               50'b00000000000000000000000000100000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               50'b00000000000000000000000000010000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               50'b00000000000000000000000000001000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               50'b00000000000000000000000000000100000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               50'b00000000000000000000000000000010000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               50'b00000000000000000000000000000001000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               50'b00000000000000000000000000000000100000000000000000:
                 data_out = data_in[32*width:33*width-1];
               50'b00000000000000000000000000000000010000000000000000:
                 data_out = data_in[33*width:34*width-1];
               50'b00000000000000000000000000000000001000000000000000:
                 data_out = data_in[34*width:35*width-1];
               50'b00000000000000000000000000000000000100000000000000:
                 data_out = data_in[35*width:36*width-1];
               50'b00000000000000000000000000000000000010000000000000:
                 data_out = data_in[36*width:37*width-1];
               50'b00000000000000000000000000000000000001000000000000:
                 data_out = data_in[37*width:38*width-1];
               50'b00000000000000000000000000000000000000100000000000:
                 data_out = data_in[38*width:39*width-1];
               50'b00000000000000000000000000000000000000010000000000:
                 data_out = data_in[39*width:40*width-1];
               50'b00000000000000000000000000000000000000001000000000:
                 data_out = data_in[40*width:41*width-1];
               50'b00000000000000000000000000000000000000000100000000:
                 data_out = data_in[41*width:42*width-1];
               50'b00000000000000000000000000000000000000000010000000:
                 data_out = data_in[42*width:43*width-1];
               50'b00000000000000000000000000000000000000000001000000:
                 data_out = data_in[43*width:44*width-1];
               50'b00000000000000000000000000000000000000000000100000:
                 data_out = data_in[44*width:45*width-1];
               50'b00000000000000000000000000000000000000000000010000:
                 data_out = data_in[45*width:46*width-1];
               50'b00000000000000000000000000000000000000000000001000:
                 data_out = data_in[46*width:47*width-1];
               50'b00000000000000000000000000000000000000000000000100:
                 data_out = data_in[47*width:48*width-1];
               50'b00000000000000000000000000000000000000000000000010:
                 data_out = data_in[48*width:49*width-1];
               50'b00000000000000000000000000000000000000000000000001:
                 data_out = data_in[49*width:50*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 51)
        always@(select, data_in)
          begin
             case(select)
               51'b100000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               51'b010000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               51'b001000000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               51'b000100000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               51'b000010000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               51'b000001000000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               51'b000000100000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               51'b000000010000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               51'b000000001000000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               51'b000000000100000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               51'b000000000010000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               51'b000000000001000000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               51'b000000000000100000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               51'b000000000000010000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               51'b000000000000001000000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               51'b000000000000000100000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               51'b000000000000000010000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               51'b000000000000000001000000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               51'b000000000000000000100000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               51'b000000000000000000010000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               51'b000000000000000000001000000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               51'b000000000000000000000100000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               51'b000000000000000000000010000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               51'b000000000000000000000001000000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               51'b000000000000000000000000100000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               51'b000000000000000000000000010000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               51'b000000000000000000000000001000000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               51'b000000000000000000000000000100000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               51'b000000000000000000000000000010000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               51'b000000000000000000000000000001000000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               51'b000000000000000000000000000000100000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               51'b000000000000000000000000000000010000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               51'b000000000000000000000000000000001000000000000000000:
                 data_out = data_in[32*width:33*width-1];
               51'b000000000000000000000000000000000100000000000000000:
                 data_out = data_in[33*width:34*width-1];
               51'b000000000000000000000000000000000010000000000000000:
                 data_out = data_in[34*width:35*width-1];
               51'b000000000000000000000000000000000001000000000000000:
                 data_out = data_in[35*width:36*width-1];
               51'b000000000000000000000000000000000000100000000000000:
                 data_out = data_in[36*width:37*width-1];
               51'b000000000000000000000000000000000000010000000000000:
                 data_out = data_in[37*width:38*width-1];
               51'b000000000000000000000000000000000000001000000000000:
                 data_out = data_in[38*width:39*width-1];
               51'b000000000000000000000000000000000000000100000000000:
                 data_out = data_in[39*width:40*width-1];
               51'b000000000000000000000000000000000000000010000000000:
                 data_out = data_in[40*width:41*width-1];
               51'b000000000000000000000000000000000000000001000000000:
                 data_out = data_in[41*width:42*width-1];
               51'b000000000000000000000000000000000000000000100000000:
                 data_out = data_in[42*width:43*width-1];
               51'b000000000000000000000000000000000000000000010000000:
                 data_out = data_in[43*width:44*width-1];
               51'b000000000000000000000000000000000000000000001000000:
                 data_out = data_in[44*width:45*width-1];
               51'b000000000000000000000000000000000000000000000100000:
                 data_out = data_in[45*width:46*width-1];
               51'b000000000000000000000000000000000000000000000010000:
                 data_out = data_in[46*width:47*width-1];
               51'b000000000000000000000000000000000000000000000001000:
                 data_out = data_in[47*width:48*width-1];
               51'b000000000000000000000000000000000000000000000000100:
                 data_out = data_in[48*width:49*width-1];
               51'b000000000000000000000000000000000000000000000000010:
                 data_out = data_in[49*width:50*width-1];
               51'b000000000000000000000000000000000000000000000000001:
                 data_out = data_in[50*width:51*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 52)
        always@(select, data_in)
          begin
             case(select)
               52'b1000000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               52'b0100000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               52'b0010000000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               52'b0001000000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               52'b0000100000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               52'b0000010000000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               52'b0000001000000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               52'b0000000100000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               52'b0000000010000000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               52'b0000000001000000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               52'b0000000000100000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               52'b0000000000010000000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               52'b0000000000001000000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               52'b0000000000000100000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               52'b0000000000000010000000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               52'b0000000000000001000000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               52'b0000000000000000100000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               52'b0000000000000000010000000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               52'b0000000000000000001000000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               52'b0000000000000000000100000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               52'b0000000000000000000010000000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               52'b0000000000000000000001000000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               52'b0000000000000000000000100000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               52'b0000000000000000000000010000000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               52'b0000000000000000000000001000000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               52'b0000000000000000000000000100000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               52'b0000000000000000000000000010000000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               52'b0000000000000000000000000001000000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               52'b0000000000000000000000000000100000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               52'b0000000000000000000000000000010000000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               52'b0000000000000000000000000000001000000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               52'b0000000000000000000000000000000100000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               52'b0000000000000000000000000000000010000000000000000000:
                 data_out = data_in[32*width:33*width-1];
               52'b0000000000000000000000000000000001000000000000000000:
                 data_out = data_in[33*width:34*width-1];
               52'b0000000000000000000000000000000000100000000000000000:
                 data_out = data_in[34*width:35*width-1];
               52'b0000000000000000000000000000000000010000000000000000:
                 data_out = data_in[35*width:36*width-1];
               52'b0000000000000000000000000000000000001000000000000000:
                 data_out = data_in[36*width:37*width-1];
               52'b0000000000000000000000000000000000000100000000000000:
                 data_out = data_in[37*width:38*width-1];
               52'b0000000000000000000000000000000000000010000000000000:
                 data_out = data_in[38*width:39*width-1];
               52'b0000000000000000000000000000000000000001000000000000:
                 data_out = data_in[39*width:40*width-1];
               52'b0000000000000000000000000000000000000000100000000000:
                 data_out = data_in[40*width:41*width-1];
               52'b0000000000000000000000000000000000000000010000000000:
                 data_out = data_in[41*width:42*width-1];
               52'b0000000000000000000000000000000000000000001000000000:
                 data_out = data_in[42*width:43*width-1];
               52'b0000000000000000000000000000000000000000000100000000:
                 data_out = data_in[43*width:44*width-1];
               52'b0000000000000000000000000000000000000000000010000000:
                 data_out = data_in[44*width:45*width-1];
               52'b0000000000000000000000000000000000000000000001000000:
                 data_out = data_in[45*width:46*width-1];
               52'b0000000000000000000000000000000000000000000000100000:
                 data_out = data_in[46*width:47*width-1];
               52'b0000000000000000000000000000000000000000000000010000:
                 data_out = data_in[47*width:48*width-1];
               52'b0000000000000000000000000000000000000000000000001000:
                 data_out = data_in[48*width:49*width-1];
               52'b0000000000000000000000000000000000000000000000000100:
                 data_out = data_in[49*width:50*width-1];
               52'b0000000000000000000000000000000000000000000000000010:
                 data_out = data_in[50*width:51*width-1];
               52'b0000000000000000000000000000000000000000000000000001:
                 data_out = data_in[51*width:52*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 53)
        always@(select, data_in)
          begin
             case(select)
               53'b10000000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               53'b01000000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               53'b00100000000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               53'b00010000000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               53'b00001000000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               53'b00000100000000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               53'b00000010000000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               53'b00000001000000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               53'b00000000100000000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               53'b00000000010000000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               53'b00000000001000000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               53'b00000000000100000000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               53'b00000000000010000000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               53'b00000000000001000000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               53'b00000000000000100000000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               53'b00000000000000010000000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               53'b00000000000000001000000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               53'b00000000000000000100000000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               53'b00000000000000000010000000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               53'b00000000000000000001000000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               53'b00000000000000000000100000000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               53'b00000000000000000000010000000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               53'b00000000000000000000001000000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               53'b00000000000000000000000100000000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               53'b00000000000000000000000010000000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               53'b00000000000000000000000001000000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               53'b00000000000000000000000000100000000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               53'b00000000000000000000000000010000000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               53'b00000000000000000000000000001000000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               53'b00000000000000000000000000000100000000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               53'b00000000000000000000000000000010000000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               53'b00000000000000000000000000000001000000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               53'b00000000000000000000000000000000100000000000000000000:
                 data_out = data_in[32*width:33*width-1];
               53'b00000000000000000000000000000000010000000000000000000:
                 data_out = data_in[33*width:34*width-1];
               53'b00000000000000000000000000000000001000000000000000000:
                 data_out = data_in[34*width:35*width-1];
               53'b00000000000000000000000000000000000100000000000000000:
                 data_out = data_in[35*width:36*width-1];
               53'b00000000000000000000000000000000000010000000000000000:
                 data_out = data_in[36*width:37*width-1];
               53'b00000000000000000000000000000000000001000000000000000:
                 data_out = data_in[37*width:38*width-1];
               53'b00000000000000000000000000000000000000100000000000000:
                 data_out = data_in[38*width:39*width-1];
               53'b00000000000000000000000000000000000000010000000000000:
                 data_out = data_in[39*width:40*width-1];
               53'b00000000000000000000000000000000000000001000000000000:
                 data_out = data_in[40*width:41*width-1];
               53'b00000000000000000000000000000000000000000100000000000:
                 data_out = data_in[41*width:42*width-1];
               53'b00000000000000000000000000000000000000000010000000000:
                 data_out = data_in[42*width:43*width-1];
               53'b00000000000000000000000000000000000000000001000000000:
                 data_out = data_in[43*width:44*width-1];
               53'b00000000000000000000000000000000000000000000100000000:
                 data_out = data_in[44*width:45*width-1];
               53'b00000000000000000000000000000000000000000000010000000:
                 data_out = data_in[45*width:46*width-1];
               53'b00000000000000000000000000000000000000000000001000000:
                 data_out = data_in[46*width:47*width-1];
               53'b00000000000000000000000000000000000000000000000100000:
                 data_out = data_in[47*width:48*width-1];
               53'b00000000000000000000000000000000000000000000000010000:
                 data_out = data_in[48*width:49*width-1];
               53'b00000000000000000000000000000000000000000000000001000:
                 data_out = data_in[49*width:50*width-1];
               53'b00000000000000000000000000000000000000000000000000100:
                 data_out = data_in[50*width:51*width-1];
               53'b00000000000000000000000000000000000000000000000000010:
                 data_out = data_in[51*width:52*width-1];
               53'b00000000000000000000000000000000000000000000000000001:
                 data_out = data_in[52*width:53*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 54)
        always@(select, data_in)
          begin
             case(select)
               54'b100000000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               54'b010000000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               54'b001000000000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               54'b000100000000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               54'b000010000000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               54'b000001000000000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               54'b000000100000000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               54'b000000010000000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               54'b000000001000000000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               54'b000000000100000000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               54'b000000000010000000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               54'b000000000001000000000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               54'b000000000000100000000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               54'b000000000000010000000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               54'b000000000000001000000000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               54'b000000000000000100000000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               54'b000000000000000010000000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               54'b000000000000000001000000000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               54'b000000000000000000100000000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               54'b000000000000000000010000000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               54'b000000000000000000001000000000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               54'b000000000000000000000100000000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               54'b000000000000000000000010000000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               54'b000000000000000000000001000000000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               54'b000000000000000000000000100000000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               54'b000000000000000000000000010000000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               54'b000000000000000000000000001000000000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               54'b000000000000000000000000000100000000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               54'b000000000000000000000000000010000000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               54'b000000000000000000000000000001000000000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               54'b000000000000000000000000000000100000000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               54'b000000000000000000000000000000010000000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               54'b000000000000000000000000000000001000000000000000000000:
                 data_out = data_in[32*width:33*width-1];
               54'b000000000000000000000000000000000100000000000000000000:
                 data_out = data_in[33*width:34*width-1];
               54'b000000000000000000000000000000000010000000000000000000:
                 data_out = data_in[34*width:35*width-1];
               54'b000000000000000000000000000000000001000000000000000000:
                 data_out = data_in[35*width:36*width-1];
               54'b000000000000000000000000000000000000100000000000000000:
                 data_out = data_in[36*width:37*width-1];
               54'b000000000000000000000000000000000000010000000000000000:
                 data_out = data_in[37*width:38*width-1];
               54'b000000000000000000000000000000000000001000000000000000:
                 data_out = data_in[38*width:39*width-1];
               54'b000000000000000000000000000000000000000100000000000000:
                 data_out = data_in[39*width:40*width-1];
               54'b000000000000000000000000000000000000000010000000000000:
                 data_out = data_in[40*width:41*width-1];
               54'b000000000000000000000000000000000000000001000000000000:
                 data_out = data_in[41*width:42*width-1];
               54'b000000000000000000000000000000000000000000100000000000:
                 data_out = data_in[42*width:43*width-1];
               54'b000000000000000000000000000000000000000000010000000000:
                 data_out = data_in[43*width:44*width-1];
               54'b000000000000000000000000000000000000000000001000000000:
                 data_out = data_in[44*width:45*width-1];
               54'b000000000000000000000000000000000000000000000100000000:
                 data_out = data_in[45*width:46*width-1];
               54'b000000000000000000000000000000000000000000000010000000:
                 data_out = data_in[46*width:47*width-1];
               54'b000000000000000000000000000000000000000000000001000000:
                 data_out = data_in[47*width:48*width-1];
               54'b000000000000000000000000000000000000000000000000100000:
                 data_out = data_in[48*width:49*width-1];
               54'b000000000000000000000000000000000000000000000000010000:
                 data_out = data_in[49*width:50*width-1];
               54'b000000000000000000000000000000000000000000000000001000:
                 data_out = data_in[50*width:51*width-1];
               54'b000000000000000000000000000000000000000000000000000100:
                 data_out = data_in[51*width:52*width-1];
               54'b000000000000000000000000000000000000000000000000000010:
                 data_out = data_in[52*width:53*width-1];
               54'b000000000000000000000000000000000000000000000000000001:
                 data_out = data_in[53*width:54*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 55)
        always@(select, data_in)
          begin
             case(select)
               55'b1000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               55'b0100000000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               55'b0010000000000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               55'b0001000000000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               55'b0000100000000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               55'b0000010000000000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               55'b0000001000000000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               55'b0000000100000000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               55'b0000000010000000000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               55'b0000000001000000000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               55'b0000000000100000000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               55'b0000000000010000000000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               55'b0000000000001000000000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               55'b0000000000000100000000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               55'b0000000000000010000000000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               55'b0000000000000001000000000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               55'b0000000000000000100000000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               55'b0000000000000000010000000000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               55'b0000000000000000001000000000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               55'b0000000000000000000100000000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               55'b0000000000000000000010000000000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               55'b0000000000000000000001000000000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               55'b0000000000000000000000100000000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               55'b0000000000000000000000010000000000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               55'b0000000000000000000000001000000000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               55'b0000000000000000000000000100000000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               55'b0000000000000000000000000010000000000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               55'b0000000000000000000000000001000000000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               55'b0000000000000000000000000000100000000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               55'b0000000000000000000000000000010000000000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               55'b0000000000000000000000000000001000000000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               55'b0000000000000000000000000000000100000000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               55'b0000000000000000000000000000000010000000000000000000000:
                 data_out = data_in[32*width:33*width-1];
               55'b0000000000000000000000000000000001000000000000000000000:
                 data_out = data_in[33*width:34*width-1];
               55'b0000000000000000000000000000000000100000000000000000000:
                 data_out = data_in[34*width:35*width-1];
               55'b0000000000000000000000000000000000010000000000000000000:
                 data_out = data_in[35*width:36*width-1];
               55'b0000000000000000000000000000000000001000000000000000000:
                 data_out = data_in[36*width:37*width-1];
               55'b0000000000000000000000000000000000000100000000000000000:
                 data_out = data_in[37*width:38*width-1];
               55'b0000000000000000000000000000000000000010000000000000000:
                 data_out = data_in[38*width:39*width-1];
               55'b0000000000000000000000000000000000000001000000000000000:
                 data_out = data_in[39*width:40*width-1];
               55'b0000000000000000000000000000000000000000100000000000000:
                 data_out = data_in[40*width:41*width-1];
               55'b0000000000000000000000000000000000000000010000000000000:
                 data_out = data_in[41*width:42*width-1];
               55'b0000000000000000000000000000000000000000001000000000000:
                 data_out = data_in[42*width:43*width-1];
               55'b0000000000000000000000000000000000000000000100000000000:
                 data_out = data_in[43*width:44*width-1];
               55'b0000000000000000000000000000000000000000000010000000000:
                 data_out = data_in[44*width:45*width-1];
               55'b0000000000000000000000000000000000000000000001000000000:
                 data_out = data_in[45*width:46*width-1];
               55'b0000000000000000000000000000000000000000000000100000000:
                 data_out = data_in[46*width:47*width-1];
               55'b0000000000000000000000000000000000000000000000010000000:
                 data_out = data_in[47*width:48*width-1];
               55'b0000000000000000000000000000000000000000000000001000000:
                 data_out = data_in[48*width:49*width-1];
               55'b0000000000000000000000000000000000000000000000000100000:
                 data_out = data_in[49*width:50*width-1];
               55'b0000000000000000000000000000000000000000000000000010000:
                 data_out = data_in[50*width:51*width-1];
               55'b0000000000000000000000000000000000000000000000000001000:
                 data_out = data_in[51*width:52*width-1];
               55'b0000000000000000000000000000000000000000000000000000100:
                 data_out = data_in[52*width:53*width-1];
               55'b0000000000000000000000000000000000000000000000000000010:
                 data_out = data_in[53*width:54*width-1];
               55'b0000000000000000000000000000000000000000000000000000001:
                 data_out = data_in[54*width:55*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 56)
        always@(select, data_in)
          begin
             case(select)
               56'b10000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               56'b01000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               56'b00100000000000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               56'b00010000000000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               56'b00001000000000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               56'b00000100000000000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               56'b00000010000000000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               56'b00000001000000000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               56'b00000000100000000000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               56'b00000000010000000000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               56'b00000000001000000000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               56'b00000000000100000000000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               56'b00000000000010000000000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               56'b00000000000001000000000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               56'b00000000000000100000000000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               56'b00000000000000010000000000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               56'b00000000000000001000000000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               56'b00000000000000000100000000000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               56'b00000000000000000010000000000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               56'b00000000000000000001000000000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               56'b00000000000000000000100000000000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               56'b00000000000000000000010000000000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               56'b00000000000000000000001000000000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               56'b00000000000000000000000100000000000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               56'b00000000000000000000000010000000000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               56'b00000000000000000000000001000000000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               56'b00000000000000000000000000100000000000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               56'b00000000000000000000000000010000000000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               56'b00000000000000000000000000001000000000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               56'b00000000000000000000000000000100000000000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               56'b00000000000000000000000000000010000000000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               56'b00000000000000000000000000000001000000000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               56'b00000000000000000000000000000000100000000000000000000000:
                 data_out = data_in[32*width:33*width-1];
               56'b00000000000000000000000000000000010000000000000000000000:
                 data_out = data_in[33*width:34*width-1];
               56'b00000000000000000000000000000000001000000000000000000000:
                 data_out = data_in[34*width:35*width-1];
               56'b00000000000000000000000000000000000100000000000000000000:
                 data_out = data_in[35*width:36*width-1];
               56'b00000000000000000000000000000000000010000000000000000000:
                 data_out = data_in[36*width:37*width-1];
               56'b00000000000000000000000000000000000001000000000000000000:
                 data_out = data_in[37*width:38*width-1];
               56'b00000000000000000000000000000000000000100000000000000000:
                 data_out = data_in[38*width:39*width-1];
               56'b00000000000000000000000000000000000000010000000000000000:
                 data_out = data_in[39*width:40*width-1];
               56'b00000000000000000000000000000000000000001000000000000000:
                 data_out = data_in[40*width:41*width-1];
               56'b00000000000000000000000000000000000000000100000000000000:
                 data_out = data_in[41*width:42*width-1];
               56'b00000000000000000000000000000000000000000010000000000000:
                 data_out = data_in[42*width:43*width-1];
               56'b00000000000000000000000000000000000000000001000000000000:
                 data_out = data_in[43*width:44*width-1];
               56'b00000000000000000000000000000000000000000000100000000000:
                 data_out = data_in[44*width:45*width-1];
               56'b00000000000000000000000000000000000000000000010000000000:
                 data_out = data_in[45*width:46*width-1];
               56'b00000000000000000000000000000000000000000000001000000000:
                 data_out = data_in[46*width:47*width-1];
               56'b00000000000000000000000000000000000000000000000100000000:
                 data_out = data_in[47*width:48*width-1];
               56'b00000000000000000000000000000000000000000000000010000000:
                 data_out = data_in[48*width:49*width-1];
               56'b00000000000000000000000000000000000000000000000001000000:
                 data_out = data_in[49*width:50*width-1];
               56'b00000000000000000000000000000000000000000000000000100000:
                 data_out = data_in[50*width:51*width-1];
               56'b00000000000000000000000000000000000000000000000000010000:
                 data_out = data_in[51*width:52*width-1];
               56'b00000000000000000000000000000000000000000000000000001000:
                 data_out = data_in[52*width:53*width-1];
               56'b00000000000000000000000000000000000000000000000000000100:
                 data_out = data_in[53*width:54*width-1];
               56'b00000000000000000000000000000000000000000000000000000010:
                 data_out = data_in[54*width:55*width-1];
               56'b00000000000000000000000000000000000000000000000000000001:
                 data_out = data_in[55*width:56*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 57)
        always@(select, data_in)
          begin
             case(select)
               57'b100000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               57'b010000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               57'b001000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               57'b000100000000000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               57'b000010000000000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               57'b000001000000000000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               57'b000000100000000000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               57'b000000010000000000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               57'b000000001000000000000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               57'b000000000100000000000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               57'b000000000010000000000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               57'b000000000001000000000000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               57'b000000000000100000000000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               57'b000000000000010000000000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               57'b000000000000001000000000000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               57'b000000000000000100000000000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               57'b000000000000000010000000000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               57'b000000000000000001000000000000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               57'b000000000000000000100000000000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               57'b000000000000000000010000000000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               57'b000000000000000000001000000000000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               57'b000000000000000000000100000000000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               57'b000000000000000000000010000000000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               57'b000000000000000000000001000000000000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               57'b000000000000000000000000100000000000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               57'b000000000000000000000000010000000000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               57'b000000000000000000000000001000000000000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               57'b000000000000000000000000000100000000000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               57'b000000000000000000000000000010000000000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               57'b000000000000000000000000000001000000000000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               57'b000000000000000000000000000000100000000000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               57'b000000000000000000000000000000010000000000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               57'b000000000000000000000000000000001000000000000000000000000:
                 data_out = data_in[32*width:33*width-1];
               57'b000000000000000000000000000000000100000000000000000000000:
                 data_out = data_in[33*width:34*width-1];
               57'b000000000000000000000000000000000010000000000000000000000:
                 data_out = data_in[34*width:35*width-1];
               57'b000000000000000000000000000000000001000000000000000000000:
                 data_out = data_in[35*width:36*width-1];
               57'b000000000000000000000000000000000000100000000000000000000:
                 data_out = data_in[36*width:37*width-1];
               57'b000000000000000000000000000000000000010000000000000000000:
                 data_out = data_in[37*width:38*width-1];
               57'b000000000000000000000000000000000000001000000000000000000:
                 data_out = data_in[38*width:39*width-1];
               57'b000000000000000000000000000000000000000100000000000000000:
                 data_out = data_in[39*width:40*width-1];
               57'b000000000000000000000000000000000000000010000000000000000:
                 data_out = data_in[40*width:41*width-1];
               57'b000000000000000000000000000000000000000001000000000000000:
                 data_out = data_in[41*width:42*width-1];
               57'b000000000000000000000000000000000000000000100000000000000:
                 data_out = data_in[42*width:43*width-1];
               57'b000000000000000000000000000000000000000000010000000000000:
                 data_out = data_in[43*width:44*width-1];
               57'b000000000000000000000000000000000000000000001000000000000:
                 data_out = data_in[44*width:45*width-1];
               57'b000000000000000000000000000000000000000000000100000000000:
                 data_out = data_in[45*width:46*width-1];
               57'b000000000000000000000000000000000000000000000010000000000:
                 data_out = data_in[46*width:47*width-1];
               57'b000000000000000000000000000000000000000000000001000000000:
                 data_out = data_in[47*width:48*width-1];
               57'b000000000000000000000000000000000000000000000000100000000:
                 data_out = data_in[48*width:49*width-1];
               57'b000000000000000000000000000000000000000000000000010000000:
                 data_out = data_in[49*width:50*width-1];
               57'b000000000000000000000000000000000000000000000000001000000:
                 data_out = data_in[50*width:51*width-1];
               57'b000000000000000000000000000000000000000000000000000100000:
                 data_out = data_in[51*width:52*width-1];
               57'b000000000000000000000000000000000000000000000000000010000:
                 data_out = data_in[52*width:53*width-1];
               57'b000000000000000000000000000000000000000000000000000001000:
                 data_out = data_in[53*width:54*width-1];
               57'b000000000000000000000000000000000000000000000000000000100:
                 data_out = data_in[54*width:55*width-1];
               57'b000000000000000000000000000000000000000000000000000000010:
                 data_out = data_in[55*width:56*width-1];
               57'b000000000000000000000000000000000000000000000000000000001:
                 data_out = data_in[56*width:57*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 58)
        always@(select, data_in)
          begin
             case(select)
               58'b1000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               58'b0100000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               58'b0010000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               58'b0001000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               58'b0000100000000000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               58'b0000010000000000000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               58'b0000001000000000000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               58'b0000000100000000000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               58'b0000000010000000000000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               58'b0000000001000000000000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               58'b0000000000100000000000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               58'b0000000000010000000000000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               58'b0000000000001000000000000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               58'b0000000000000100000000000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               58'b0000000000000010000000000000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               58'b0000000000000001000000000000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               58'b0000000000000000100000000000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               58'b0000000000000000010000000000000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               58'b0000000000000000001000000000000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               58'b0000000000000000000100000000000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               58'b0000000000000000000010000000000000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               58'b0000000000000000000001000000000000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               58'b0000000000000000000000100000000000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               58'b0000000000000000000000010000000000000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               58'b0000000000000000000000001000000000000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               58'b0000000000000000000000000100000000000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               58'b0000000000000000000000000010000000000000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               58'b0000000000000000000000000001000000000000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               58'b0000000000000000000000000000100000000000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               58'b0000000000000000000000000000010000000000000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               58'b0000000000000000000000000000001000000000000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               58'b0000000000000000000000000000000100000000000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               58'b0000000000000000000000000000000010000000000000000000000000:
                 data_out = data_in[32*width:33*width-1];
               58'b0000000000000000000000000000000001000000000000000000000000:
                 data_out = data_in[33*width:34*width-1];
               58'b0000000000000000000000000000000000100000000000000000000000:
                 data_out = data_in[34*width:35*width-1];
               58'b0000000000000000000000000000000000010000000000000000000000:
                 data_out = data_in[35*width:36*width-1];
               58'b0000000000000000000000000000000000001000000000000000000000:
                 data_out = data_in[36*width:37*width-1];
               58'b0000000000000000000000000000000000000100000000000000000000:
                 data_out = data_in[37*width:38*width-1];
               58'b0000000000000000000000000000000000000010000000000000000000:
                 data_out = data_in[38*width:39*width-1];
               58'b0000000000000000000000000000000000000001000000000000000000:
                 data_out = data_in[39*width:40*width-1];
               58'b0000000000000000000000000000000000000000100000000000000000:
                 data_out = data_in[40*width:41*width-1];
               58'b0000000000000000000000000000000000000000010000000000000000:
                 data_out = data_in[41*width:42*width-1];
               58'b0000000000000000000000000000000000000000001000000000000000:
                 data_out = data_in[42*width:43*width-1];
               58'b0000000000000000000000000000000000000000000100000000000000:
                 data_out = data_in[43*width:44*width-1];
               58'b0000000000000000000000000000000000000000000010000000000000:
                 data_out = data_in[44*width:45*width-1];
               58'b0000000000000000000000000000000000000000000001000000000000:
                 data_out = data_in[45*width:46*width-1];
               58'b0000000000000000000000000000000000000000000000100000000000:
                 data_out = data_in[46*width:47*width-1];
               58'b0000000000000000000000000000000000000000000000010000000000:
                 data_out = data_in[47*width:48*width-1];
               58'b0000000000000000000000000000000000000000000000001000000000:
                 data_out = data_in[48*width:49*width-1];
               58'b0000000000000000000000000000000000000000000000000100000000:
                 data_out = data_in[49*width:50*width-1];
               58'b0000000000000000000000000000000000000000000000000010000000:
                 data_out = data_in[50*width:51*width-1];
               58'b0000000000000000000000000000000000000000000000000001000000:
                 data_out = data_in[51*width:52*width-1];
               58'b0000000000000000000000000000000000000000000000000000100000:
                 data_out = data_in[52*width:53*width-1];
               58'b0000000000000000000000000000000000000000000000000000010000:
                 data_out = data_in[53*width:54*width-1];
               58'b0000000000000000000000000000000000000000000000000000001000:
                 data_out = data_in[54*width:55*width-1];
               58'b0000000000000000000000000000000000000000000000000000000100:
                 data_out = data_in[55*width:56*width-1];
               58'b0000000000000000000000000000000000000000000000000000000010:
                 data_out = data_in[56*width:57*width-1];
               58'b0000000000000000000000000000000000000000000000000000000001:
                 data_out = data_in[57*width:58*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 59)
        always@(select, data_in)
          begin
             case(select)
               59'b10000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               59'b01000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               59'b00100000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               59'b00010000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               59'b00001000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               59'b00000100000000000000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               59'b00000010000000000000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               59'b00000001000000000000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               59'b00000000100000000000000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               59'b00000000010000000000000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               59'b00000000001000000000000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               59'b00000000000100000000000000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               59'b00000000000010000000000000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               59'b00000000000001000000000000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               59'b00000000000000100000000000000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               59'b00000000000000010000000000000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               59'b00000000000000001000000000000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               59'b00000000000000000100000000000000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               59'b00000000000000000010000000000000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               59'b00000000000000000001000000000000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               59'b00000000000000000000100000000000000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               59'b00000000000000000000010000000000000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               59'b00000000000000000000001000000000000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               59'b00000000000000000000000100000000000000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               59'b00000000000000000000000010000000000000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               59'b00000000000000000000000001000000000000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               59'b00000000000000000000000000100000000000000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               59'b00000000000000000000000000010000000000000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               59'b00000000000000000000000000001000000000000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               59'b00000000000000000000000000000100000000000000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               59'b00000000000000000000000000000010000000000000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               59'b00000000000000000000000000000001000000000000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               59'b00000000000000000000000000000000100000000000000000000000000:
                 data_out = data_in[32*width:33*width-1];
               59'b00000000000000000000000000000000010000000000000000000000000:
                 data_out = data_in[33*width:34*width-1];
               59'b00000000000000000000000000000000001000000000000000000000000:
                 data_out = data_in[34*width:35*width-1];
               59'b00000000000000000000000000000000000100000000000000000000000:
                 data_out = data_in[35*width:36*width-1];
               59'b00000000000000000000000000000000000010000000000000000000000:
                 data_out = data_in[36*width:37*width-1];
               59'b00000000000000000000000000000000000001000000000000000000000:
                 data_out = data_in[37*width:38*width-1];
               59'b00000000000000000000000000000000000000100000000000000000000:
                 data_out = data_in[38*width:39*width-1];
               59'b00000000000000000000000000000000000000010000000000000000000:
                 data_out = data_in[39*width:40*width-1];
               59'b00000000000000000000000000000000000000001000000000000000000:
                 data_out = data_in[40*width:41*width-1];
               59'b00000000000000000000000000000000000000000100000000000000000:
                 data_out = data_in[41*width:42*width-1];
               59'b00000000000000000000000000000000000000000010000000000000000:
                 data_out = data_in[42*width:43*width-1];
               59'b00000000000000000000000000000000000000000001000000000000000:
                 data_out = data_in[43*width:44*width-1];
               59'b00000000000000000000000000000000000000000000100000000000000:
                 data_out = data_in[44*width:45*width-1];
               59'b00000000000000000000000000000000000000000000010000000000000:
                 data_out = data_in[45*width:46*width-1];
               59'b00000000000000000000000000000000000000000000001000000000000:
                 data_out = data_in[46*width:47*width-1];
               59'b00000000000000000000000000000000000000000000000100000000000:
                 data_out = data_in[47*width:48*width-1];
               59'b00000000000000000000000000000000000000000000000010000000000:
                 data_out = data_in[48*width:49*width-1];
               59'b00000000000000000000000000000000000000000000000001000000000:
                 data_out = data_in[49*width:50*width-1];
               59'b00000000000000000000000000000000000000000000000000100000000:
                 data_out = data_in[50*width:51*width-1];
               59'b00000000000000000000000000000000000000000000000000010000000:
                 data_out = data_in[51*width:52*width-1];
               59'b00000000000000000000000000000000000000000000000000001000000:
                 data_out = data_in[52*width:53*width-1];
               59'b00000000000000000000000000000000000000000000000000000100000:
                 data_out = data_in[53*width:54*width-1];
               59'b00000000000000000000000000000000000000000000000000000010000:
                 data_out = data_in[54*width:55*width-1];
               59'b00000000000000000000000000000000000000000000000000000001000:
                 data_out = data_in[55*width:56*width-1];
               59'b00000000000000000000000000000000000000000000000000000000100:
                 data_out = data_in[56*width:57*width-1];
               59'b00000000000000000000000000000000000000000000000000000000010:
                 data_out = data_in[57*width:58*width-1];
               59'b00000000000000000000000000000000000000000000000000000000001:
                 data_out = data_in[58*width:59*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 60)
        always@(select, data_in)
          begin
             case(select)
               60'b100000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               60'b010000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               60'b001000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               60'b000100000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               60'b000010000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               60'b000001000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               60'b000000100000000000000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               60'b000000010000000000000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               60'b000000001000000000000000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               60'b000000000100000000000000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               60'b000000000010000000000000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               60'b000000000001000000000000000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               60'b000000000000100000000000000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               60'b000000000000010000000000000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               60'b000000000000001000000000000000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               60'b000000000000000100000000000000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               60'b000000000000000010000000000000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               60'b000000000000000001000000000000000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               60'b000000000000000000100000000000000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               60'b000000000000000000010000000000000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               60'b000000000000000000001000000000000000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               60'b000000000000000000000100000000000000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               60'b000000000000000000000010000000000000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               60'b000000000000000000000001000000000000000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               60'b000000000000000000000000100000000000000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               60'b000000000000000000000000010000000000000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               60'b000000000000000000000000001000000000000000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               60'b000000000000000000000000000100000000000000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               60'b000000000000000000000000000010000000000000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               60'b000000000000000000000000000001000000000000000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               60'b000000000000000000000000000000100000000000000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               60'b000000000000000000000000000000010000000000000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               60'b000000000000000000000000000000001000000000000000000000000000:
                 data_out = data_in[32*width:33*width-1];
               60'b000000000000000000000000000000000100000000000000000000000000:
                 data_out = data_in[33*width:34*width-1];
               60'b000000000000000000000000000000000010000000000000000000000000:
                 data_out = data_in[34*width:35*width-1];
               60'b000000000000000000000000000000000001000000000000000000000000:
                 data_out = data_in[35*width:36*width-1];
               60'b000000000000000000000000000000000000100000000000000000000000:
                 data_out = data_in[36*width:37*width-1];
               60'b000000000000000000000000000000000000010000000000000000000000:
                 data_out = data_in[37*width:38*width-1];
               60'b000000000000000000000000000000000000001000000000000000000000:
                 data_out = data_in[38*width:39*width-1];
               60'b000000000000000000000000000000000000000100000000000000000000:
                 data_out = data_in[39*width:40*width-1];
               60'b000000000000000000000000000000000000000010000000000000000000:
                 data_out = data_in[40*width:41*width-1];
               60'b000000000000000000000000000000000000000001000000000000000000:
                 data_out = data_in[41*width:42*width-1];
               60'b000000000000000000000000000000000000000000100000000000000000:
                 data_out = data_in[42*width:43*width-1];
               60'b000000000000000000000000000000000000000000010000000000000000:
                 data_out = data_in[43*width:44*width-1];
               60'b000000000000000000000000000000000000000000001000000000000000:
                 data_out = data_in[44*width:45*width-1];
               60'b000000000000000000000000000000000000000000000100000000000000:
                 data_out = data_in[45*width:46*width-1];
               60'b000000000000000000000000000000000000000000000010000000000000:
                 data_out = data_in[46*width:47*width-1];
               60'b000000000000000000000000000000000000000000000001000000000000:
                 data_out = data_in[47*width:48*width-1];
               60'b000000000000000000000000000000000000000000000000100000000000:
                 data_out = data_in[48*width:49*width-1];
               60'b000000000000000000000000000000000000000000000000010000000000:
                 data_out = data_in[49*width:50*width-1];
               60'b000000000000000000000000000000000000000000000000001000000000:
                 data_out = data_in[50*width:51*width-1];
               60'b000000000000000000000000000000000000000000000000000100000000:
                 data_out = data_in[51*width:52*width-1];
               60'b000000000000000000000000000000000000000000000000000010000000:
                 data_out = data_in[52*width:53*width-1];
               60'b000000000000000000000000000000000000000000000000000001000000:
                 data_out = data_in[53*width:54*width-1];
               60'b000000000000000000000000000000000000000000000000000000100000:
                 data_out = data_in[54*width:55*width-1];
               60'b000000000000000000000000000000000000000000000000000000010000:
                 data_out = data_in[55*width:56*width-1];
               60'b000000000000000000000000000000000000000000000000000000001000:
                 data_out = data_in[56*width:57*width-1];
               60'b000000000000000000000000000000000000000000000000000000000100:
                 data_out = data_in[57*width:58*width-1];
               60'b000000000000000000000000000000000000000000000000000000000010:
                 data_out = data_in[58*width:59*width-1];
               60'b000000000000000000000000000000000000000000000000000000000001:
                 data_out = data_in[59*width:60*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 61)
        always@(select, data_in)
          begin
             case(select)
               61'b1000000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               61'b0100000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               61'b0010000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               61'b0001000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               61'b0000100000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               61'b0000010000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               61'b0000001000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               61'b0000000100000000000000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               61'b0000000010000000000000000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               61'b0000000001000000000000000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               61'b0000000000100000000000000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               61'b0000000000010000000000000000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               61'b0000000000001000000000000000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               61'b0000000000000100000000000000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               61'b0000000000000010000000000000000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               61'b0000000000000001000000000000000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               61'b0000000000000000100000000000000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               61'b0000000000000000010000000000000000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               61'b0000000000000000001000000000000000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               61'b0000000000000000000100000000000000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               61'b0000000000000000000010000000000000000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               61'b0000000000000000000001000000000000000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               61'b0000000000000000000000100000000000000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               61'b0000000000000000000000010000000000000000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               61'b0000000000000000000000001000000000000000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               61'b0000000000000000000000000100000000000000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               61'b0000000000000000000000000010000000000000000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               61'b0000000000000000000000000001000000000000000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               61'b0000000000000000000000000000100000000000000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               61'b0000000000000000000000000000010000000000000000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               61'b0000000000000000000000000000001000000000000000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               61'b0000000000000000000000000000000100000000000000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               61'b0000000000000000000000000000000010000000000000000000000000000:
                 data_out = data_in[32*width:33*width-1];
               61'b0000000000000000000000000000000001000000000000000000000000000:
                 data_out = data_in[33*width:34*width-1];
               61'b0000000000000000000000000000000000100000000000000000000000000:
                 data_out = data_in[34*width:35*width-1];
               61'b0000000000000000000000000000000000010000000000000000000000000:
                 data_out = data_in[35*width:36*width-1];
               61'b0000000000000000000000000000000000001000000000000000000000000:
                 data_out = data_in[36*width:37*width-1];
               61'b0000000000000000000000000000000000000100000000000000000000000:
                 data_out = data_in[37*width:38*width-1];
               61'b0000000000000000000000000000000000000010000000000000000000000:
                 data_out = data_in[38*width:39*width-1];
               61'b0000000000000000000000000000000000000001000000000000000000000:
                 data_out = data_in[39*width:40*width-1];
               61'b0000000000000000000000000000000000000000100000000000000000000:
                 data_out = data_in[40*width:41*width-1];
               61'b0000000000000000000000000000000000000000010000000000000000000:
                 data_out = data_in[41*width:42*width-1];
               61'b0000000000000000000000000000000000000000001000000000000000000:
                 data_out = data_in[42*width:43*width-1];
               61'b0000000000000000000000000000000000000000000100000000000000000:
                 data_out = data_in[43*width:44*width-1];
               61'b0000000000000000000000000000000000000000000010000000000000000:
                 data_out = data_in[44*width:45*width-1];
               61'b0000000000000000000000000000000000000000000001000000000000000:
                 data_out = data_in[45*width:46*width-1];
               61'b0000000000000000000000000000000000000000000000100000000000000:
                 data_out = data_in[46*width:47*width-1];
               61'b0000000000000000000000000000000000000000000000010000000000000:
                 data_out = data_in[47*width:48*width-1];
               61'b0000000000000000000000000000000000000000000000001000000000000:
                 data_out = data_in[48*width:49*width-1];
               61'b0000000000000000000000000000000000000000000000000100000000000:
                 data_out = data_in[49*width:50*width-1];
               61'b0000000000000000000000000000000000000000000000000010000000000:
                 data_out = data_in[50*width:51*width-1];
               61'b0000000000000000000000000000000000000000000000000001000000000:
                 data_out = data_in[51*width:52*width-1];
               61'b0000000000000000000000000000000000000000000000000000100000000:
                 data_out = data_in[52*width:53*width-1];
               61'b0000000000000000000000000000000000000000000000000000010000000:
                 data_out = data_in[53*width:54*width-1];
               61'b0000000000000000000000000000000000000000000000000000001000000:
                 data_out = data_in[54*width:55*width-1];
               61'b0000000000000000000000000000000000000000000000000000000100000:
                 data_out = data_in[55*width:56*width-1];
               61'b0000000000000000000000000000000000000000000000000000000010000:
                 data_out = data_in[56*width:57*width-1];
               61'b0000000000000000000000000000000000000000000000000000000001000:
                 data_out = data_in[57*width:58*width-1];
               61'b0000000000000000000000000000000000000000000000000000000000100:
                 data_out = data_in[58*width:59*width-1];
               61'b0000000000000000000000000000000000000000000000000000000000010:
                 data_out = data_in[59*width:60*width-1];
               61'b0000000000000000000000000000000000000000000000000000000000001:
                 data_out = data_in[60*width:61*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 62)
        always@(select, data_in)
          begin
             case(select)
               62'b10000000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               62'b01000000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               62'b00100000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               62'b00010000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               62'b00001000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               62'b00000100000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               62'b00000010000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               62'b00000001000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               62'b00000000100000000000000000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               62'b00000000010000000000000000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               62'b00000000001000000000000000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               62'b00000000000100000000000000000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               62'b00000000000010000000000000000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               62'b00000000000001000000000000000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               62'b00000000000000100000000000000000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               62'b00000000000000010000000000000000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               62'b00000000000000001000000000000000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               62'b00000000000000000100000000000000000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               62'b00000000000000000010000000000000000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               62'b00000000000000000001000000000000000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               62'b00000000000000000000100000000000000000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               62'b00000000000000000000010000000000000000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               62'b00000000000000000000001000000000000000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               62'b00000000000000000000000100000000000000000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               62'b00000000000000000000000010000000000000000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               62'b00000000000000000000000001000000000000000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               62'b00000000000000000000000000100000000000000000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               62'b00000000000000000000000000010000000000000000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               62'b00000000000000000000000000001000000000000000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               62'b00000000000000000000000000000100000000000000000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               62'b00000000000000000000000000000010000000000000000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               62'b00000000000000000000000000000001000000000000000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               62'b00000000000000000000000000000000100000000000000000000000000000:
                 data_out = data_in[32*width:33*width-1];
               62'b00000000000000000000000000000000010000000000000000000000000000:
                 data_out = data_in[33*width:34*width-1];
               62'b00000000000000000000000000000000001000000000000000000000000000:
                 data_out = data_in[34*width:35*width-1];
               62'b00000000000000000000000000000000000100000000000000000000000000:
                 data_out = data_in[35*width:36*width-1];
               62'b00000000000000000000000000000000000010000000000000000000000000:
                 data_out = data_in[36*width:37*width-1];
               62'b00000000000000000000000000000000000001000000000000000000000000:
                 data_out = data_in[37*width:38*width-1];
               62'b00000000000000000000000000000000000000100000000000000000000000:
                 data_out = data_in[38*width:39*width-1];
               62'b00000000000000000000000000000000000000010000000000000000000000:
                 data_out = data_in[39*width:40*width-1];
               62'b00000000000000000000000000000000000000001000000000000000000000:
                 data_out = data_in[40*width:41*width-1];
               62'b00000000000000000000000000000000000000000100000000000000000000:
                 data_out = data_in[41*width:42*width-1];
               62'b00000000000000000000000000000000000000000010000000000000000000:
                 data_out = data_in[42*width:43*width-1];
               62'b00000000000000000000000000000000000000000001000000000000000000:
                 data_out = data_in[43*width:44*width-1];
               62'b00000000000000000000000000000000000000000000100000000000000000:
                 data_out = data_in[44*width:45*width-1];
               62'b00000000000000000000000000000000000000000000010000000000000000:
                 data_out = data_in[45*width:46*width-1];
               62'b00000000000000000000000000000000000000000000001000000000000000:
                 data_out = data_in[46*width:47*width-1];
               62'b00000000000000000000000000000000000000000000000100000000000000:
                 data_out = data_in[47*width:48*width-1];
               62'b00000000000000000000000000000000000000000000000010000000000000:
                 data_out = data_in[48*width:49*width-1];
               62'b00000000000000000000000000000000000000000000000001000000000000:
                 data_out = data_in[49*width:50*width-1];
               62'b00000000000000000000000000000000000000000000000000100000000000:
                 data_out = data_in[50*width:51*width-1];
               62'b00000000000000000000000000000000000000000000000000010000000000:
                 data_out = data_in[51*width:52*width-1];
               62'b00000000000000000000000000000000000000000000000000001000000000:
                 data_out = data_in[52*width:53*width-1];
               62'b00000000000000000000000000000000000000000000000000000100000000:
                 data_out = data_in[53*width:54*width-1];
               62'b00000000000000000000000000000000000000000000000000000010000000:
                 data_out = data_in[54*width:55*width-1];
               62'b00000000000000000000000000000000000000000000000000000001000000:
                 data_out = data_in[55*width:56*width-1];
               62'b00000000000000000000000000000000000000000000000000000000100000:
                 data_out = data_in[56*width:57*width-1];
               62'b00000000000000000000000000000000000000000000000000000000010000:
                 data_out = data_in[57*width:58*width-1];
               62'b00000000000000000000000000000000000000000000000000000000001000:
                 data_out = data_in[58*width:59*width-1];
               62'b00000000000000000000000000000000000000000000000000000000000100:
                 data_out = data_in[59*width:60*width-1];
               62'b00000000000000000000000000000000000000000000000000000000000010:
                 data_out = data_in[60*width:61*width-1];
               62'b00000000000000000000000000000000000000000000000000000000000001:
                 data_out = data_in[61*width:62*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 63)
        always@(select, data_in)
          begin
             case(select)
               63'b100000000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               63'b010000000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               63'b001000000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               63'b000100000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               63'b000010000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               63'b000001000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               63'b000000100000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               63'b000000010000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               63'b000000001000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               63'b000000000100000000000000000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               63'b000000000010000000000000000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               63'b000000000001000000000000000000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               63'b000000000000100000000000000000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               63'b000000000000010000000000000000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               63'b000000000000001000000000000000000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               63'b000000000000000100000000000000000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               63'b000000000000000010000000000000000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               63'b000000000000000001000000000000000000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               63'b000000000000000000100000000000000000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               63'b000000000000000000010000000000000000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               63'b000000000000000000001000000000000000000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               63'b000000000000000000000100000000000000000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               63'b000000000000000000000010000000000000000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               63'b000000000000000000000001000000000000000000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               63'b000000000000000000000000100000000000000000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               63'b000000000000000000000000010000000000000000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               63'b000000000000000000000000001000000000000000000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               63'b000000000000000000000000000100000000000000000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               63'b000000000000000000000000000010000000000000000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               63'b000000000000000000000000000001000000000000000000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               63'b000000000000000000000000000000100000000000000000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               63'b000000000000000000000000000000010000000000000000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               63'b000000000000000000000000000000001000000000000000000000000000000:
                 data_out = data_in[32*width:33*width-1];
               63'b000000000000000000000000000000000100000000000000000000000000000:
                 data_out = data_in[33*width:34*width-1];
               63'b000000000000000000000000000000000010000000000000000000000000000:
                 data_out = data_in[34*width:35*width-1];
               63'b000000000000000000000000000000000001000000000000000000000000000:
                 data_out = data_in[35*width:36*width-1];
               63'b000000000000000000000000000000000000100000000000000000000000000:
                 data_out = data_in[36*width:37*width-1];
               63'b000000000000000000000000000000000000010000000000000000000000000:
                 data_out = data_in[37*width:38*width-1];
               63'b000000000000000000000000000000000000001000000000000000000000000:
                 data_out = data_in[38*width:39*width-1];
               63'b000000000000000000000000000000000000000100000000000000000000000:
                 data_out = data_in[39*width:40*width-1];
               63'b000000000000000000000000000000000000000010000000000000000000000:
                 data_out = data_in[40*width:41*width-1];
               63'b000000000000000000000000000000000000000001000000000000000000000:
                 data_out = data_in[41*width:42*width-1];
               63'b000000000000000000000000000000000000000000100000000000000000000:
                 data_out = data_in[42*width:43*width-1];
               63'b000000000000000000000000000000000000000000010000000000000000000:
                 data_out = data_in[43*width:44*width-1];
               63'b000000000000000000000000000000000000000000001000000000000000000:
                 data_out = data_in[44*width:45*width-1];
               63'b000000000000000000000000000000000000000000000100000000000000000:
                 data_out = data_in[45*width:46*width-1];
               63'b000000000000000000000000000000000000000000000010000000000000000:
                 data_out = data_in[46*width:47*width-1];
               63'b000000000000000000000000000000000000000000000001000000000000000:
                 data_out = data_in[47*width:48*width-1];
               63'b000000000000000000000000000000000000000000000000100000000000000:
                 data_out = data_in[48*width:49*width-1];
               63'b000000000000000000000000000000000000000000000000010000000000000:
                 data_out = data_in[49*width:50*width-1];
               63'b000000000000000000000000000000000000000000000000001000000000000:
                 data_out = data_in[50*width:51*width-1];
               63'b000000000000000000000000000000000000000000000000000100000000000:
                 data_out = data_in[51*width:52*width-1];
               63'b000000000000000000000000000000000000000000000000000010000000000:
                 data_out = data_in[52*width:53*width-1];
               63'b000000000000000000000000000000000000000000000000000001000000000:
                 data_out = data_in[53*width:54*width-1];
               63'b000000000000000000000000000000000000000000000000000000100000000:
                 data_out = data_in[54*width:55*width-1];
               63'b000000000000000000000000000000000000000000000000000000010000000:
                 data_out = data_in[55*width:56*width-1];
               63'b000000000000000000000000000000000000000000000000000000001000000:
                 data_out = data_in[56*width:57*width-1];
               63'b000000000000000000000000000000000000000000000000000000000100000:
                 data_out = data_in[57*width:58*width-1];
               63'b000000000000000000000000000000000000000000000000000000000010000:
                 data_out = data_in[58*width:59*width-1];
               63'b000000000000000000000000000000000000000000000000000000000001000:
                 data_out = data_in[59*width:60*width-1];
               63'b000000000000000000000000000000000000000000000000000000000000100:
                 data_out = data_in[60*width:61*width-1];
               63'b000000000000000000000000000000000000000000000000000000000000010:
                 data_out = data_in[61*width:62*width-1];
               63'b000000000000000000000000000000000000000000000000000000000000001:
                 data_out = data_in[62*width:63*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      else if(num_ports == 64)
        always@(select, data_in)
          begin
             case(select)
               64'b1000000000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[0*width:1*width-1];
               64'b0100000000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[1*width:2*width-1];
               64'b0010000000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[2*width:3*width-1];
               64'b0001000000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[3*width:4*width-1];
               64'b0000100000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[4*width:5*width-1];
               64'b0000010000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[5*width:6*width-1];
               64'b0000001000000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[6*width:7*width-1];
               64'b0000000100000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[7*width:8*width-1];
               64'b0000000010000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[8*width:9*width-1];
               64'b0000000001000000000000000000000000000000000000000000000000000000:
                 data_out = data_in[9*width:10*width-1];
               64'b0000000000100000000000000000000000000000000000000000000000000000:
                 data_out = data_in[10*width:11*width-1];
               64'b0000000000010000000000000000000000000000000000000000000000000000:
                 data_out = data_in[11*width:12*width-1];
               64'b0000000000001000000000000000000000000000000000000000000000000000:
                 data_out = data_in[12*width:13*width-1];
               64'b0000000000000100000000000000000000000000000000000000000000000000:
                 data_out = data_in[13*width:14*width-1];
               64'b0000000000000010000000000000000000000000000000000000000000000000:
                 data_out = data_in[14*width:15*width-1];
               64'b0000000000000001000000000000000000000000000000000000000000000000:
                 data_out = data_in[15*width:16*width-1];
               64'b0000000000000000100000000000000000000000000000000000000000000000:
                 data_out = data_in[16*width:17*width-1];
               64'b0000000000000000010000000000000000000000000000000000000000000000:
                 data_out = data_in[17*width:18*width-1];
               64'b0000000000000000001000000000000000000000000000000000000000000000:
                 data_out = data_in[18*width:19*width-1];
               64'b0000000000000000000100000000000000000000000000000000000000000000:
                 data_out = data_in[19*width:20*width-1];
               64'b0000000000000000000010000000000000000000000000000000000000000000:
                 data_out = data_in[20*width:21*width-1];
               64'b0000000000000000000001000000000000000000000000000000000000000000:
                 data_out = data_in[21*width:22*width-1];
               64'b0000000000000000000000100000000000000000000000000000000000000000:
                 data_out = data_in[22*width:23*width-1];
               64'b0000000000000000000000010000000000000000000000000000000000000000:
                 data_out = data_in[23*width:24*width-1];
               64'b0000000000000000000000001000000000000000000000000000000000000000:
                 data_out = data_in[24*width:25*width-1];
               64'b0000000000000000000000000100000000000000000000000000000000000000:
                 data_out = data_in[25*width:26*width-1];
               64'b0000000000000000000000000010000000000000000000000000000000000000:
                 data_out = data_in[26*width:27*width-1];
               64'b0000000000000000000000000001000000000000000000000000000000000000:
                 data_out = data_in[27*width:28*width-1];
               64'b0000000000000000000000000000100000000000000000000000000000000000:
                 data_out = data_in[28*width:29*width-1];
               64'b0000000000000000000000000000010000000000000000000000000000000000:
                 data_out = data_in[29*width:30*width-1];
               64'b0000000000000000000000000000001000000000000000000000000000000000:
                 data_out = data_in[30*width:31*width-1];
               64'b0000000000000000000000000000000100000000000000000000000000000000:
                 data_out = data_in[31*width:32*width-1];
               64'b0000000000000000000000000000000010000000000000000000000000000000:
                 data_out = data_in[32*width:33*width-1];
               64'b0000000000000000000000000000000001000000000000000000000000000000:
                 data_out = data_in[33*width:34*width-1];
               64'b0000000000000000000000000000000000100000000000000000000000000000:
                 data_out = data_in[34*width:35*width-1];
               64'b0000000000000000000000000000000000010000000000000000000000000000:
                 data_out = data_in[35*width:36*width-1];
               64'b0000000000000000000000000000000000001000000000000000000000000000:
                 data_out = data_in[36*width:37*width-1];
               64'b0000000000000000000000000000000000000100000000000000000000000000:
                 data_out = data_in[37*width:38*width-1];
               64'b0000000000000000000000000000000000000010000000000000000000000000:
                 data_out = data_in[38*width:39*width-1];
               64'b0000000000000000000000000000000000000001000000000000000000000000:
                 data_out = data_in[39*width:40*width-1];
               64'b0000000000000000000000000000000000000000100000000000000000000000:
                 data_out = data_in[40*width:41*width-1];
               64'b0000000000000000000000000000000000000000010000000000000000000000:
                 data_out = data_in[41*width:42*width-1];
               64'b0000000000000000000000000000000000000000001000000000000000000000:
                 data_out = data_in[42*width:43*width-1];
               64'b0000000000000000000000000000000000000000000100000000000000000000:
                 data_out = data_in[43*width:44*width-1];
               64'b0000000000000000000000000000000000000000000010000000000000000000:
                 data_out = data_in[44*width:45*width-1];
               64'b0000000000000000000000000000000000000000000001000000000000000000:
                 data_out = data_in[45*width:46*width-1];
               64'b0000000000000000000000000000000000000000000000100000000000000000:
                 data_out = data_in[46*width:47*width-1];
               64'b0000000000000000000000000000000000000000000000010000000000000000:
                 data_out = data_in[47*width:48*width-1];
               64'b0000000000000000000000000000000000000000000000001000000000000000:
                 data_out = data_in[48*width:49*width-1];
               64'b0000000000000000000000000000000000000000000000000100000000000000:
                 data_out = data_in[49*width:50*width-1];
               64'b0000000000000000000000000000000000000000000000000010000000000000:
                 data_out = data_in[50*width:51*width-1];
               64'b0000000000000000000000000000000000000000000000000001000000000000:
                 data_out = data_in[51*width:52*width-1];
               64'b0000000000000000000000000000000000000000000000000000100000000000:
                 data_out = data_in[52*width:53*width-1];
               64'b0000000000000000000000000000000000000000000000000000010000000000:
                 data_out = data_in[53*width:54*width-1];
               64'b0000000000000000000000000000000000000000000000000000001000000000:
                 data_out = data_in[54*width:55*width-1];
               64'b0000000000000000000000000000000000000000000000000000000100000000:
                 data_out = data_in[55*width:56*width-1];
               64'b0000000000000000000000000000000000000000000000000000000010000000:
                 data_out = data_in[56*width:57*width-1];
               64'b0000000000000000000000000000000000000000000000000000000001000000:
                 data_out = data_in[57*width:58*width-1];
               64'b0000000000000000000000000000000000000000000000000000000000100000:
                 data_out = data_in[58*width:59*width-1];
               64'b0000000000000000000000000000000000000000000000000000000000010000:
                 data_out = data_in[59*width:60*width-1];
               64'b0000000000000000000000000000000000000000000000000000000000001000:
                 data_out = data_in[60*width:61*width-1];
               64'b0000000000000000000000000000000000000000000000000000000000000100:
                 data_out = data_in[61*width:62*width-1];
               64'b0000000000000000000000000000000000000000000000000000000000000010:
                 data_out = data_in[62*width:63*width-1];
               64'b0000000000000000000000000000000000000000000000000000000000000001:
                 data_out = data_in[63*width:64*width-1];
               default:
                 data_out = {width{1'bx}};
             endcase
          end
      
   endgenerate
   
endmodule
