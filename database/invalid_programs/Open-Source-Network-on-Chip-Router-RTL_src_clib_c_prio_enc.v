// $Id: c_prio_enc.v 5188 2012-08-30 00:31:31Z dub $

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
// priority encoder
//==============================================================================

// NOTE: This file was automatically generated. Do not edit by hand!

module c_prio_enc
  (data_in, data_out);
   
`include "c_functions.v"
   
   // number of input ports (i.e., decoded width)
   parameter num_ports = 8;
   
   // start at offset
   parameter offset = 0;
   
   localparam width = clogb(num_ports);
   
   // one-hot input data
   input [0:num_ports-1] data_in;
   
   // binary encoded output data
   output [0:width-1] 	 data_out;
   reg [0:width-1] 	 data_out;
   
   generate
      
      // synopsys translate_off
      if(num_ports < 2)
	begin
	   initial
	     begin
		$display({"ERROR: Priority encoder module %m needs at least 2 inputs."});
		$stop;
	     end
	end
      else if(num_ports > 64)
	begin
	   initial
	     begin
		$display({"ERROR: Encoder module %m supports at most 64 inputs."});
		$stop;
	     end
	end
      // synopsys translate_on
      
      if(num_ports == 2)
        always@(data_in)
          begin
             case(data_in)
               2'b1x:
                 data_out = (0 + offset) % 2;
               2'b01:
                 data_out = (1 + offset) % 2;
               default:
                 data_out = {1{1'bx}};
             endcase
          end
      else if(num_ports == 3)
        always@(data_in)
          begin
             case(data_in)
               3'b1xx:
                 data_out = (0 + offset) % 3;
               3'b01x:
                 data_out = (1 + offset) % 3;
               3'b001:
                 data_out = (2 + offset) % 3;
               default:
                 data_out = {2{1'bx}};
             endcase
          end
      else if(num_ports == 4)
        always@(data_in)
          begin
             case(data_in)
               4'b1xxx:
                 data_out = (0 + offset) % 4;
               4'b01xx:
                 data_out = (1 + offset) % 4;
               4'b001x:
                 data_out = (2 + offset) % 4;
               4'b0001:
                 data_out = (3 + offset) % 4;
               default:
                 data_out = {2{1'bx}};
             endcase
          end
      else if(num_ports == 5)
        always@(data_in)
          begin
             case(data_in)
               5'b1xxxx:
                 data_out = (0 + offset) % 5;
               5'b01xxx:
                 data_out = (1 + offset) % 5;
               5'b001xx:
                 data_out = (2 + offset) % 5;
               5'b0001x:
                 data_out = (3 + offset) % 5;
               5'b00001:
                 data_out = (4 + offset) % 5;
               default:
                 data_out = {3{1'bx}};
             endcase
          end
      else if(num_ports == 6)
        always@(data_in)
          begin
             case(data_in)
               6'b1xxxxx:
                 data_out = (0 + offset) % 6;
               6'b01xxxx:
                 data_out = (1 + offset) % 6;
               6'b001xxx:
                 data_out = (2 + offset) % 6;
               6'b0001xx:
                 data_out = (3 + offset) % 6;
               6'b00001x:
                 data_out = (4 + offset) % 6;
               6'b000001:
                 data_out = (5 + offset) % 6;
               default:
                 data_out = {3{1'bx}};
             endcase
          end
      else if(num_ports == 7)
        always@(data_in)
          begin
             case(data_in)
               7'b1xxxxxx:
                 data_out = (0 + offset) % 7;
               7'b01xxxxx:
                 data_out = (1 + offset) % 7;
               7'b001xxxx:
                 data_out = (2 + offset) % 7;
               7'b0001xxx:
                 data_out = (3 + offset) % 7;
               7'b00001xx:
                 data_out = (4 + offset) % 7;
               7'b000001x:
                 data_out = (5 + offset) % 7;
               7'b0000001:
                 data_out = (6 + offset) % 7;
               default:
                 data_out = {3{1'bx}};
             endcase
          end
      else if(num_ports == 8)
        always@(data_in)
          begin
             case(data_in)
               8'b1xxxxxxx:
                 data_out = (0 + offset) % 8;
               8'b01xxxxxx:
                 data_out = (1 + offset) % 8;
               8'b001xxxxx:
                 data_out = (2 + offset) % 8;
               8'b0001xxxx:
                 data_out = (3 + offset) % 8;
               8'b00001xxx:
                 data_out = (4 + offset) % 8;
               8'b000001xx:
                 data_out = (5 + offset) % 8;
               8'b0000001x:
                 data_out = (6 + offset) % 8;
               8'b00000001:
                 data_out = (7 + offset) % 8;
               default:
                 data_out = {3{1'bx}};
             endcase
          end
      else if(num_ports == 9)
        always@(data_in)
          begin
             case(data_in)
               9'b1xxxxxxxx:
                 data_out = (0 + offset) % 9;
               9'b01xxxxxxx:
                 data_out = (1 + offset) % 9;
               9'b001xxxxxx:
                 data_out = (2 + offset) % 9;
               9'b0001xxxxx:
                 data_out = (3 + offset) % 9;
               9'b00001xxxx:
                 data_out = (4 + offset) % 9;
               9'b000001xxx:
                 data_out = (5 + offset) % 9;
               9'b0000001xx:
                 data_out = (6 + offset) % 9;
               9'b00000001x:
                 data_out = (7 + offset) % 9;
               9'b000000001:
                 data_out = (8 + offset) % 9;
               default:
                 data_out = {4{1'bx}};
             endcase
          end
      else if(num_ports == 10)
        always@(data_in)
          begin
             case(data_in)
               10'b1xxxxxxxxx:
                 data_out = (0 + offset) % 10;
               10'b01xxxxxxxx:
                 data_out = (1 + offset) % 10;
               10'b001xxxxxxx:
                 data_out = (2 + offset) % 10;
               10'b0001xxxxxx:
                 data_out = (3 + offset) % 10;
               10'b00001xxxxx:
                 data_out = (4 + offset) % 10;
               10'b000001xxxx:
                 data_out = (5 + offset) % 10;
               10'b0000001xxx:
                 data_out = (6 + offset) % 10;
               10'b00000001xx:
                 data_out = (7 + offset) % 10;
               10'b000000001x:
                 data_out = (8 + offset) % 10;
               10'b0000000001:
                 data_out = (9 + offset) % 10;
               default:
                 data_out = {4{1'bx}};
             endcase
          end
      else if(num_ports == 11)
        always@(data_in)
          begin
             case(data_in)
               11'b1xxxxxxxxxx:
                 data_out = (0 + offset) % 11;
               11'b01xxxxxxxxx:
                 data_out = (1 + offset) % 11;
               11'b001xxxxxxxx:
                 data_out = (2 + offset) % 11;
               11'b0001xxxxxxx:
                 data_out = (3 + offset) % 11;
               11'b00001xxxxxx:
                 data_out = (4 + offset) % 11;
               11'b000001xxxxx:
                 data_out = (5 + offset) % 11;
               11'b0000001xxxx:
                 data_out = (6 + offset) % 11;
               11'b00000001xxx:
                 data_out = (7 + offset) % 11;
               11'b000000001xx:
                 data_out = (8 + offset) % 11;
               11'b0000000001x:
                 data_out = (9 + offset) % 11;
               11'b00000000001:
                 data_out = (10 + offset) % 11;
               default:
                 data_out = {4{1'bx}};
             endcase
          end
      else if(num_ports == 12)
        always@(data_in)
          begin
             case(data_in)
               12'b1xxxxxxxxxxx:
                 data_out = (0 + offset) % 12;
               12'b01xxxxxxxxxx:
                 data_out = (1 + offset) % 12;
               12'b001xxxxxxxxx:
                 data_out = (2 + offset) % 12;
               12'b0001xxxxxxxx:
                 data_out = (3 + offset) % 12;
               12'b00001xxxxxxx:
                 data_out = (4 + offset) % 12;
               12'b000001xxxxxx:
                 data_out = (5 + offset) % 12;
               12'b0000001xxxxx:
                 data_out = (6 + offset) % 12;
               12'b00000001xxxx:
                 data_out = (7 + offset) % 12;
               12'b000000001xxx:
                 data_out = (8 + offset) % 12;
               12'b0000000001xx:
                 data_out = (9 + offset) % 12;
               12'b00000000001x:
                 data_out = (10 + offset) % 12;
               12'b000000000001:
                 data_out = (11 + offset) % 12;
               default:
                 data_out = {4{1'bx}};
             endcase
          end
      else if(num_ports == 13)
        always@(data_in)
          begin
             case(data_in)
               13'b1xxxxxxxxxxxx:
                 data_out = (0 + offset) % 13;
               13'b01xxxxxxxxxxx:
                 data_out = (1 + offset) % 13;
               13'b001xxxxxxxxxx:
                 data_out = (2 + offset) % 13;
               13'b0001xxxxxxxxx:
                 data_out = (3 + offset) % 13;
               13'b00001xxxxxxxx:
                 data_out = (4 + offset) % 13;
               13'b000001xxxxxxx:
                 data_out = (5 + offset) % 13;
               13'b0000001xxxxxx:
                 data_out = (6 + offset) % 13;
               13'b00000001xxxxx:
                 data_out = (7 + offset) % 13;
               13'b000000001xxxx:
                 data_out = (8 + offset) % 13;
               13'b0000000001xxx:
                 data_out = (9 + offset) % 13;
               13'b00000000001xx:
                 data_out = (10 + offset) % 13;
               13'b000000000001x:
                 data_out = (11 + offset) % 13;
               13'b0000000000001:
                 data_out = (12 + offset) % 13;
               default:
                 data_out = {4{1'bx}};
             endcase
          end
      else if(num_ports == 14)
        always@(data_in)
          begin
             case(data_in)
               14'b1xxxxxxxxxxxxx:
                 data_out = (0 + offset) % 14;
               14'b01xxxxxxxxxxxx:
                 data_out = (1 + offset) % 14;
               14'b001xxxxxxxxxxx:
                 data_out = (2 + offset) % 14;
               14'b0001xxxxxxxxxx:
                 data_out = (3 + offset) % 14;
               14'b00001xxxxxxxxx:
                 data_out = (4 + offset) % 14;
               14'b000001xxxxxxxx:
                 data_out = (5 + offset) % 14;
               14'b0000001xxxxxxx:
                 data_out = (6 + offset) % 14;
               14'b00000001xxxxxx:
                 data_out = (7 + offset) % 14;
               14'b000000001xxxxx:
                 data_out = (8 + offset) % 14;
               14'b0000000001xxxx:
                 data_out = (9 + offset) % 14;
               14'b00000000001xxx:
                 data_out = (10 + offset) % 14;
               14'b000000000001xx:
                 data_out = (11 + offset) % 14;
               14'b0000000000001x:
                 data_out = (12 + offset) % 14;
               14'b00000000000001:
                 data_out = (13 + offset) % 14;
               default:
                 data_out = {4{1'bx}};
             endcase
          end
      else if(num_ports == 15)
        always@(data_in)
          begin
             case(data_in)
               15'b1xxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 15;
               15'b01xxxxxxxxxxxxx:
                 data_out = (1 + offset) % 15;
               15'b001xxxxxxxxxxxx:
                 data_out = (2 + offset) % 15;
               15'b0001xxxxxxxxxxx:
                 data_out = (3 + offset) % 15;
               15'b00001xxxxxxxxxx:
                 data_out = (4 + offset) % 15;
               15'b000001xxxxxxxxx:
                 data_out = (5 + offset) % 15;
               15'b0000001xxxxxxxx:
                 data_out = (6 + offset) % 15;
               15'b00000001xxxxxxx:
                 data_out = (7 + offset) % 15;
               15'b000000001xxxxxx:
                 data_out = (8 + offset) % 15;
               15'b0000000001xxxxx:
                 data_out = (9 + offset) % 15;
               15'b00000000001xxxx:
                 data_out = (10 + offset) % 15;
               15'b000000000001xxx:
                 data_out = (11 + offset) % 15;
               15'b0000000000001xx:
                 data_out = (12 + offset) % 15;
               15'b00000000000001x:
                 data_out = (13 + offset) % 15;
               15'b000000000000001:
                 data_out = (14 + offset) % 15;
               default:
                 data_out = {4{1'bx}};
             endcase
          end
      else if(num_ports == 16)
        always@(data_in)
          begin
             case(data_in)
               16'b1xxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 16;
               16'b01xxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 16;
               16'b001xxxxxxxxxxxxx:
                 data_out = (2 + offset) % 16;
               16'b0001xxxxxxxxxxxx:
                 data_out = (3 + offset) % 16;
               16'b00001xxxxxxxxxxx:
                 data_out = (4 + offset) % 16;
               16'b000001xxxxxxxxxx:
                 data_out = (5 + offset) % 16;
               16'b0000001xxxxxxxxx:
                 data_out = (6 + offset) % 16;
               16'b00000001xxxxxxxx:
                 data_out = (7 + offset) % 16;
               16'b000000001xxxxxxx:
                 data_out = (8 + offset) % 16;
               16'b0000000001xxxxxx:
                 data_out = (9 + offset) % 16;
               16'b00000000001xxxxx:
                 data_out = (10 + offset) % 16;
               16'b000000000001xxxx:
                 data_out = (11 + offset) % 16;
               16'b0000000000001xxx:
                 data_out = (12 + offset) % 16;
               16'b00000000000001xx:
                 data_out = (13 + offset) % 16;
               16'b000000000000001x:
                 data_out = (14 + offset) % 16;
               16'b0000000000000001:
                 data_out = (15 + offset) % 16;
               default:
                 data_out = {4{1'bx}};
             endcase
          end
      else if(num_ports == 17)
        always@(data_in)
          begin
             case(data_in)
               17'b1xxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 17;
               17'b01xxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 17;
               17'b001xxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 17;
               17'b0001xxxxxxxxxxxxx:
                 data_out = (3 + offset) % 17;
               17'b00001xxxxxxxxxxxx:
                 data_out = (4 + offset) % 17;
               17'b000001xxxxxxxxxxx:
                 data_out = (5 + offset) % 17;
               17'b0000001xxxxxxxxxx:
                 data_out = (6 + offset) % 17;
               17'b00000001xxxxxxxxx:
                 data_out = (7 + offset) % 17;
               17'b000000001xxxxxxxx:
                 data_out = (8 + offset) % 17;
               17'b0000000001xxxxxxx:
                 data_out = (9 + offset) % 17;
               17'b00000000001xxxxxx:
                 data_out = (10 + offset) % 17;
               17'b000000000001xxxxx:
                 data_out = (11 + offset) % 17;
               17'b0000000000001xxxx:
                 data_out = (12 + offset) % 17;
               17'b00000000000001xxx:
                 data_out = (13 + offset) % 17;
               17'b000000000000001xx:
                 data_out = (14 + offset) % 17;
               17'b0000000000000001x:
                 data_out = (15 + offset) % 17;
               17'b00000000000000001:
                 data_out = (16 + offset) % 17;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 18)
        always@(data_in)
          begin
             case(data_in)
               18'b1xxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 18;
               18'b01xxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 18;
               18'b001xxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 18;
               18'b0001xxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 18;
               18'b00001xxxxxxxxxxxxx:
                 data_out = (4 + offset) % 18;
               18'b000001xxxxxxxxxxxx:
                 data_out = (5 + offset) % 18;
               18'b0000001xxxxxxxxxxx:
                 data_out = (6 + offset) % 18;
               18'b00000001xxxxxxxxxx:
                 data_out = (7 + offset) % 18;
               18'b000000001xxxxxxxxx:
                 data_out = (8 + offset) % 18;
               18'b0000000001xxxxxxxx:
                 data_out = (9 + offset) % 18;
               18'b00000000001xxxxxxx:
                 data_out = (10 + offset) % 18;
               18'b000000000001xxxxxx:
                 data_out = (11 + offset) % 18;
               18'b0000000000001xxxxx:
                 data_out = (12 + offset) % 18;
               18'b00000000000001xxxx:
                 data_out = (13 + offset) % 18;
               18'b000000000000001xxx:
                 data_out = (14 + offset) % 18;
               18'b0000000000000001xx:
                 data_out = (15 + offset) % 18;
               18'b00000000000000001x:
                 data_out = (16 + offset) % 18;
               18'b000000000000000001:
                 data_out = (17 + offset) % 18;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 19)
        always@(data_in)
          begin
             case(data_in)
               19'b1xxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 19;
               19'b01xxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 19;
               19'b001xxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 19;
               19'b0001xxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 19;
               19'b00001xxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 19;
               19'b000001xxxxxxxxxxxxx:
                 data_out = (5 + offset) % 19;
               19'b0000001xxxxxxxxxxxx:
                 data_out = (6 + offset) % 19;
               19'b00000001xxxxxxxxxxx:
                 data_out = (7 + offset) % 19;
               19'b000000001xxxxxxxxxx:
                 data_out = (8 + offset) % 19;
               19'b0000000001xxxxxxxxx:
                 data_out = (9 + offset) % 19;
               19'b00000000001xxxxxxxx:
                 data_out = (10 + offset) % 19;
               19'b000000000001xxxxxxx:
                 data_out = (11 + offset) % 19;
               19'b0000000000001xxxxxx:
                 data_out = (12 + offset) % 19;
               19'b00000000000001xxxxx:
                 data_out = (13 + offset) % 19;
               19'b000000000000001xxxx:
                 data_out = (14 + offset) % 19;
               19'b0000000000000001xxx:
                 data_out = (15 + offset) % 19;
               19'b00000000000000001xx:
                 data_out = (16 + offset) % 19;
               19'b000000000000000001x:
                 data_out = (17 + offset) % 19;
               19'b0000000000000000001:
                 data_out = (18 + offset) % 19;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 20)
        always@(data_in)
          begin
             case(data_in)
               20'b1xxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 20;
               20'b01xxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 20;
               20'b001xxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 20;
               20'b0001xxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 20;
               20'b00001xxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 20;
               20'b000001xxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 20;
               20'b0000001xxxxxxxxxxxxx:
                 data_out = (6 + offset) % 20;
               20'b00000001xxxxxxxxxxxx:
                 data_out = (7 + offset) % 20;
               20'b000000001xxxxxxxxxxx:
                 data_out = (8 + offset) % 20;
               20'b0000000001xxxxxxxxxx:
                 data_out = (9 + offset) % 20;
               20'b00000000001xxxxxxxxx:
                 data_out = (10 + offset) % 20;
               20'b000000000001xxxxxxxx:
                 data_out = (11 + offset) % 20;
               20'b0000000000001xxxxxxx:
                 data_out = (12 + offset) % 20;
               20'b00000000000001xxxxxx:
                 data_out = (13 + offset) % 20;
               20'b000000000000001xxxxx:
                 data_out = (14 + offset) % 20;
               20'b0000000000000001xxxx:
                 data_out = (15 + offset) % 20;
               20'b00000000000000001xxx:
                 data_out = (16 + offset) % 20;
               20'b000000000000000001xx:
                 data_out = (17 + offset) % 20;
               20'b0000000000000000001x:
                 data_out = (18 + offset) % 20;
               20'b00000000000000000001:
                 data_out = (19 + offset) % 20;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 21)
        always@(data_in)
          begin
             case(data_in)
               21'b1xxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 21;
               21'b01xxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 21;
               21'b001xxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 21;
               21'b0001xxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 21;
               21'b00001xxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 21;
               21'b000001xxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 21;
               21'b0000001xxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 21;
               21'b00000001xxxxxxxxxxxxx:
                 data_out = (7 + offset) % 21;
               21'b000000001xxxxxxxxxxxx:
                 data_out = (8 + offset) % 21;
               21'b0000000001xxxxxxxxxxx:
                 data_out = (9 + offset) % 21;
               21'b00000000001xxxxxxxxxx:
                 data_out = (10 + offset) % 21;
               21'b000000000001xxxxxxxxx:
                 data_out = (11 + offset) % 21;
               21'b0000000000001xxxxxxxx:
                 data_out = (12 + offset) % 21;
               21'b00000000000001xxxxxxx:
                 data_out = (13 + offset) % 21;
               21'b000000000000001xxxxxx:
                 data_out = (14 + offset) % 21;
               21'b0000000000000001xxxxx:
                 data_out = (15 + offset) % 21;
               21'b00000000000000001xxxx:
                 data_out = (16 + offset) % 21;
               21'b000000000000000001xxx:
                 data_out = (17 + offset) % 21;
               21'b0000000000000000001xx:
                 data_out = (18 + offset) % 21;
               21'b00000000000000000001x:
                 data_out = (19 + offset) % 21;
               21'b000000000000000000001:
                 data_out = (20 + offset) % 21;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 22)
        always@(data_in)
          begin
             case(data_in)
               22'b1xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 22;
               22'b01xxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 22;
               22'b001xxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 22;
               22'b0001xxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 22;
               22'b00001xxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 22;
               22'b000001xxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 22;
               22'b0000001xxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 22;
               22'b00000001xxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 22;
               22'b000000001xxxxxxxxxxxxx:
                 data_out = (8 + offset) % 22;
               22'b0000000001xxxxxxxxxxxx:
                 data_out = (9 + offset) % 22;
               22'b00000000001xxxxxxxxxxx:
                 data_out = (10 + offset) % 22;
               22'b000000000001xxxxxxxxxx:
                 data_out = (11 + offset) % 22;
               22'b0000000000001xxxxxxxxx:
                 data_out = (12 + offset) % 22;
               22'b00000000000001xxxxxxxx:
                 data_out = (13 + offset) % 22;
               22'b000000000000001xxxxxxx:
                 data_out = (14 + offset) % 22;
               22'b0000000000000001xxxxxx:
                 data_out = (15 + offset) % 22;
               22'b00000000000000001xxxxx:
                 data_out = (16 + offset) % 22;
               22'b000000000000000001xxxx:
                 data_out = (17 + offset) % 22;
               22'b0000000000000000001xxx:
                 data_out = (18 + offset) % 22;
               22'b00000000000000000001xx:
                 data_out = (19 + offset) % 22;
               22'b000000000000000000001x:
                 data_out = (20 + offset) % 22;
               22'b0000000000000000000001:
                 data_out = (21 + offset) % 22;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 23)
        always@(data_in)
          begin
             case(data_in)
               23'b1xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 23;
               23'b01xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 23;
               23'b001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 23;
               23'b0001xxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 23;
               23'b00001xxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 23;
               23'b000001xxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 23;
               23'b0000001xxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 23;
               23'b00000001xxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 23;
               23'b000000001xxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 23;
               23'b0000000001xxxxxxxxxxxxx:
                 data_out = (9 + offset) % 23;
               23'b00000000001xxxxxxxxxxxx:
                 data_out = (10 + offset) % 23;
               23'b000000000001xxxxxxxxxxx:
                 data_out = (11 + offset) % 23;
               23'b0000000000001xxxxxxxxxx:
                 data_out = (12 + offset) % 23;
               23'b00000000000001xxxxxxxxx:
                 data_out = (13 + offset) % 23;
               23'b000000000000001xxxxxxxx:
                 data_out = (14 + offset) % 23;
               23'b0000000000000001xxxxxxx:
                 data_out = (15 + offset) % 23;
               23'b00000000000000001xxxxxx:
                 data_out = (16 + offset) % 23;
               23'b000000000000000001xxxxx:
                 data_out = (17 + offset) % 23;
               23'b0000000000000000001xxxx:
                 data_out = (18 + offset) % 23;
               23'b00000000000000000001xxx:
                 data_out = (19 + offset) % 23;
               23'b000000000000000000001xx:
                 data_out = (20 + offset) % 23;
               23'b0000000000000000000001x:
                 data_out = (21 + offset) % 23;
               23'b00000000000000000000001:
                 data_out = (22 + offset) % 23;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 24)
        always@(data_in)
          begin
             case(data_in)
               24'b1xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 24;
               24'b01xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 24;
               24'b001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 24;
               24'b0001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 24;
               24'b00001xxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 24;
               24'b000001xxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 24;
               24'b0000001xxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 24;
               24'b00000001xxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 24;
               24'b000000001xxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 24;
               24'b0000000001xxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 24;
               24'b00000000001xxxxxxxxxxxxx:
                 data_out = (10 + offset) % 24;
               24'b000000000001xxxxxxxxxxxx:
                 data_out = (11 + offset) % 24;
               24'b0000000000001xxxxxxxxxxx:
                 data_out = (12 + offset) % 24;
               24'b00000000000001xxxxxxxxxx:
                 data_out = (13 + offset) % 24;
               24'b000000000000001xxxxxxxxx:
                 data_out = (14 + offset) % 24;
               24'b0000000000000001xxxxxxxx:
                 data_out = (15 + offset) % 24;
               24'b00000000000000001xxxxxxx:
                 data_out = (16 + offset) % 24;
               24'b000000000000000001xxxxxx:
                 data_out = (17 + offset) % 24;
               24'b0000000000000000001xxxxx:
                 data_out = (18 + offset) % 24;
               24'b00000000000000000001xxxx:
                 data_out = (19 + offset) % 24;
               24'b000000000000000000001xxx:
                 data_out = (20 + offset) % 24;
               24'b0000000000000000000001xx:
                 data_out = (21 + offset) % 24;
               24'b00000000000000000000001x:
                 data_out = (22 + offset) % 24;
               24'b000000000000000000000001:
                 data_out = (23 + offset) % 24;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 25)
        always@(data_in)
          begin
             case(data_in)
               25'b1xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 25;
               25'b01xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 25;
               25'b001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 25;
               25'b0001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 25;
               25'b00001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 25;
               25'b000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 25;
               25'b0000001xxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 25;
               25'b00000001xxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 25;
               25'b000000001xxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 25;
               25'b0000000001xxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 25;
               25'b00000000001xxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 25;
               25'b000000000001xxxxxxxxxxxxx:
                 data_out = (11 + offset) % 25;
               25'b0000000000001xxxxxxxxxxxx:
                 data_out = (12 + offset) % 25;
               25'b00000000000001xxxxxxxxxxx:
                 data_out = (13 + offset) % 25;
               25'b000000000000001xxxxxxxxxx:
                 data_out = (14 + offset) % 25;
               25'b0000000000000001xxxxxxxxx:
                 data_out = (15 + offset) % 25;
               25'b00000000000000001xxxxxxxx:
                 data_out = (16 + offset) % 25;
               25'b000000000000000001xxxxxxx:
                 data_out = (17 + offset) % 25;
               25'b0000000000000000001xxxxxx:
                 data_out = (18 + offset) % 25;
               25'b00000000000000000001xxxxx:
                 data_out = (19 + offset) % 25;
               25'b000000000000000000001xxxx:
                 data_out = (20 + offset) % 25;
               25'b0000000000000000000001xxx:
                 data_out = (21 + offset) % 25;
               25'b00000000000000000000001xx:
                 data_out = (22 + offset) % 25;
               25'b000000000000000000000001x:
                 data_out = (23 + offset) % 25;
               25'b0000000000000000000000001:
                 data_out = (24 + offset) % 25;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 26)
        always@(data_in)
          begin
             case(data_in)
               26'b1xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 26;
               26'b01xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 26;
               26'b001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 26;
               26'b0001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 26;
               26'b00001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 26;
               26'b000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 26;
               26'b0000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 26;
               26'b00000001xxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 26;
               26'b000000001xxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 26;
               26'b0000000001xxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 26;
               26'b00000000001xxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 26;
               26'b000000000001xxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 26;
               26'b0000000000001xxxxxxxxxxxxx:
                 data_out = (12 + offset) % 26;
               26'b00000000000001xxxxxxxxxxxx:
                 data_out = (13 + offset) % 26;
               26'b000000000000001xxxxxxxxxxx:
                 data_out = (14 + offset) % 26;
               26'b0000000000000001xxxxxxxxxx:
                 data_out = (15 + offset) % 26;
               26'b00000000000000001xxxxxxxxx:
                 data_out = (16 + offset) % 26;
               26'b000000000000000001xxxxxxxx:
                 data_out = (17 + offset) % 26;
               26'b0000000000000000001xxxxxxx:
                 data_out = (18 + offset) % 26;
               26'b00000000000000000001xxxxxx:
                 data_out = (19 + offset) % 26;
               26'b000000000000000000001xxxxx:
                 data_out = (20 + offset) % 26;
               26'b0000000000000000000001xxxx:
                 data_out = (21 + offset) % 26;
               26'b00000000000000000000001xxx:
                 data_out = (22 + offset) % 26;
               26'b000000000000000000000001xx:
                 data_out = (23 + offset) % 26;
               26'b0000000000000000000000001x:
                 data_out = (24 + offset) % 26;
               26'b00000000000000000000000001:
                 data_out = (25 + offset) % 26;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 27)
        always@(data_in)
          begin
             case(data_in)
               27'b1xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 27;
               27'b01xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 27;
               27'b001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 27;
               27'b0001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 27;
               27'b00001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 27;
               27'b000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 27;
               27'b0000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 27;
               27'b00000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 27;
               27'b000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 27;
               27'b0000000001xxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 27;
               27'b00000000001xxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 27;
               27'b000000000001xxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 27;
               27'b0000000000001xxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 27;
               27'b00000000000001xxxxxxxxxxxxx:
                 data_out = (13 + offset) % 27;
               27'b000000000000001xxxxxxxxxxxx:
                 data_out = (14 + offset) % 27;
               27'b0000000000000001xxxxxxxxxxx:
                 data_out = (15 + offset) % 27;
               27'b00000000000000001xxxxxxxxxx:
                 data_out = (16 + offset) % 27;
               27'b000000000000000001xxxxxxxxx:
                 data_out = (17 + offset) % 27;
               27'b0000000000000000001xxxxxxxx:
                 data_out = (18 + offset) % 27;
               27'b00000000000000000001xxxxxxx:
                 data_out = (19 + offset) % 27;
               27'b000000000000000000001xxxxxx:
                 data_out = (20 + offset) % 27;
               27'b0000000000000000000001xxxxx:
                 data_out = (21 + offset) % 27;
               27'b00000000000000000000001xxxx:
                 data_out = (22 + offset) % 27;
               27'b000000000000000000000001xxx:
                 data_out = (23 + offset) % 27;
               27'b0000000000000000000000001xx:
                 data_out = (24 + offset) % 27;
               27'b00000000000000000000000001x:
                 data_out = (25 + offset) % 27;
               27'b000000000000000000000000001:
                 data_out = (26 + offset) % 27;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 28)
        always@(data_in)
          begin
             case(data_in)
               28'b1xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 28;
               28'b01xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 28;
               28'b001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 28;
               28'b0001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 28;
               28'b00001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 28;
               28'b000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 28;
               28'b0000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 28;
               28'b00000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 28;
               28'b000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 28;
               28'b0000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 28;
               28'b00000000001xxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 28;
               28'b000000000001xxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 28;
               28'b0000000000001xxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 28;
               28'b00000000000001xxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 28;
               28'b000000000000001xxxxxxxxxxxxx:
                 data_out = (14 + offset) % 28;
               28'b0000000000000001xxxxxxxxxxxx:
                 data_out = (15 + offset) % 28;
               28'b00000000000000001xxxxxxxxxxx:
                 data_out = (16 + offset) % 28;
               28'b000000000000000001xxxxxxxxxx:
                 data_out = (17 + offset) % 28;
               28'b0000000000000000001xxxxxxxxx:
                 data_out = (18 + offset) % 28;
               28'b00000000000000000001xxxxxxxx:
                 data_out = (19 + offset) % 28;
               28'b000000000000000000001xxxxxxx:
                 data_out = (20 + offset) % 28;
               28'b0000000000000000000001xxxxxx:
                 data_out = (21 + offset) % 28;
               28'b00000000000000000000001xxxxx:
                 data_out = (22 + offset) % 28;
               28'b000000000000000000000001xxxx:
                 data_out = (23 + offset) % 28;
               28'b0000000000000000000000001xxx:
                 data_out = (24 + offset) % 28;
               28'b00000000000000000000000001xx:
                 data_out = (25 + offset) % 28;
               28'b000000000000000000000000001x:
                 data_out = (26 + offset) % 28;
               28'b0000000000000000000000000001:
                 data_out = (27 + offset) % 28;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 29)
        always@(data_in)
          begin
             case(data_in)
               29'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 29;
               29'b01xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 29;
               29'b001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 29;
               29'b0001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 29;
               29'b00001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 29;
               29'b000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 29;
               29'b0000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 29;
               29'b00000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 29;
               29'b000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 29;
               29'b0000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 29;
               29'b00000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 29;
               29'b000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 29;
               29'b0000000000001xxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 29;
               29'b00000000000001xxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 29;
               29'b000000000000001xxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 29;
               29'b0000000000000001xxxxxxxxxxxxx:
                 data_out = (15 + offset) % 29;
               29'b00000000000000001xxxxxxxxxxxx:
                 data_out = (16 + offset) % 29;
               29'b000000000000000001xxxxxxxxxxx:
                 data_out = (17 + offset) % 29;
               29'b0000000000000000001xxxxxxxxxx:
                 data_out = (18 + offset) % 29;
               29'b00000000000000000001xxxxxxxxx:
                 data_out = (19 + offset) % 29;
               29'b000000000000000000001xxxxxxxx:
                 data_out = (20 + offset) % 29;
               29'b0000000000000000000001xxxxxxx:
                 data_out = (21 + offset) % 29;
               29'b00000000000000000000001xxxxxx:
                 data_out = (22 + offset) % 29;
               29'b000000000000000000000001xxxxx:
                 data_out = (23 + offset) % 29;
               29'b0000000000000000000000001xxxx:
                 data_out = (24 + offset) % 29;
               29'b00000000000000000000000001xxx:
                 data_out = (25 + offset) % 29;
               29'b000000000000000000000000001xx:
                 data_out = (26 + offset) % 29;
               29'b0000000000000000000000000001x:
                 data_out = (27 + offset) % 29;
               29'b00000000000000000000000000001:
                 data_out = (28 + offset) % 29;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 30)
        always@(data_in)
          begin
             case(data_in)
               30'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 30;
               30'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 30;
               30'b001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 30;
               30'b0001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 30;
               30'b00001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 30;
               30'b000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 30;
               30'b0000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 30;
               30'b00000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 30;
               30'b000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 30;
               30'b0000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 30;
               30'b00000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 30;
               30'b000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 30;
               30'b0000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 30;
               30'b00000000000001xxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 30;
               30'b000000000000001xxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 30;
               30'b0000000000000001xxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 30;
               30'b00000000000000001xxxxxxxxxxxxx:
                 data_out = (16 + offset) % 30;
               30'b000000000000000001xxxxxxxxxxxx:
                 data_out = (17 + offset) % 30;
               30'b0000000000000000001xxxxxxxxxxx:
                 data_out = (18 + offset) % 30;
               30'b00000000000000000001xxxxxxxxxx:
                 data_out = (19 + offset) % 30;
               30'b000000000000000000001xxxxxxxxx:
                 data_out = (20 + offset) % 30;
               30'b0000000000000000000001xxxxxxxx:
                 data_out = (21 + offset) % 30;
               30'b00000000000000000000001xxxxxxx:
                 data_out = (22 + offset) % 30;
               30'b000000000000000000000001xxxxxx:
                 data_out = (23 + offset) % 30;
               30'b0000000000000000000000001xxxxx:
                 data_out = (24 + offset) % 30;
               30'b00000000000000000000000001xxxx:
                 data_out = (25 + offset) % 30;
               30'b000000000000000000000000001xxx:
                 data_out = (26 + offset) % 30;
               30'b0000000000000000000000000001xx:
                 data_out = (27 + offset) % 30;
               30'b00000000000000000000000000001x:
                 data_out = (28 + offset) % 30;
               30'b000000000000000000000000000001:
                 data_out = (29 + offset) % 30;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 31)
        always@(data_in)
          begin
             case(data_in)
               31'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 31;
               31'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 31;
               31'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 31;
               31'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 31;
               31'b00001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 31;
               31'b000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 31;
               31'b0000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 31;
               31'b00000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 31;
               31'b000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 31;
               31'b0000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 31;
               31'b00000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 31;
               31'b000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 31;
               31'b0000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 31;
               31'b00000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 31;
               31'b000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 31;
               31'b0000000000000001xxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 31;
               31'b00000000000000001xxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 31;
               31'b000000000000000001xxxxxxxxxxxxx:
                 data_out = (17 + offset) % 31;
               31'b0000000000000000001xxxxxxxxxxxx:
                 data_out = (18 + offset) % 31;
               31'b00000000000000000001xxxxxxxxxxx:
                 data_out = (19 + offset) % 31;
               31'b000000000000000000001xxxxxxxxxx:
                 data_out = (20 + offset) % 31;
               31'b0000000000000000000001xxxxxxxxx:
                 data_out = (21 + offset) % 31;
               31'b00000000000000000000001xxxxxxxx:
                 data_out = (22 + offset) % 31;
               31'b000000000000000000000001xxxxxxx:
                 data_out = (23 + offset) % 31;
               31'b0000000000000000000000001xxxxxx:
                 data_out = (24 + offset) % 31;
               31'b00000000000000000000000001xxxxx:
                 data_out = (25 + offset) % 31;
               31'b000000000000000000000000001xxxx:
                 data_out = (26 + offset) % 31;
               31'b0000000000000000000000000001xxx:
                 data_out = (27 + offset) % 31;
               31'b00000000000000000000000000001xx:
                 data_out = (28 + offset) % 31;
               31'b000000000000000000000000000001x:
                 data_out = (29 + offset) % 31;
               31'b0000000000000000000000000000001:
                 data_out = (30 + offset) % 31;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 32)
        always@(data_in)
          begin
             case(data_in)
               32'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 32;
               32'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 32;
               32'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 32;
               32'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 32;
               32'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 32;
               32'b000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 32;
               32'b0000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 32;
               32'b00000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 32;
               32'b000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 32;
               32'b0000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 32;
               32'b00000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 32;
               32'b000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 32;
               32'b0000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 32;
               32'b00000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 32;
               32'b000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 32;
               32'b0000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 32;
               32'b00000000000000001xxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 32;
               32'b000000000000000001xxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 32;
               32'b0000000000000000001xxxxxxxxxxxxx:
                 data_out = (18 + offset) % 32;
               32'b00000000000000000001xxxxxxxxxxxx:
                 data_out = (19 + offset) % 32;
               32'b000000000000000000001xxxxxxxxxxx:
                 data_out = (20 + offset) % 32;
               32'b0000000000000000000001xxxxxxxxxx:
                 data_out = (21 + offset) % 32;
               32'b00000000000000000000001xxxxxxxxx:
                 data_out = (22 + offset) % 32;
               32'b000000000000000000000001xxxxxxxx:
                 data_out = (23 + offset) % 32;
               32'b0000000000000000000000001xxxxxxx:
                 data_out = (24 + offset) % 32;
               32'b00000000000000000000000001xxxxxx:
                 data_out = (25 + offset) % 32;
               32'b000000000000000000000000001xxxxx:
                 data_out = (26 + offset) % 32;
               32'b0000000000000000000000000001xxxx:
                 data_out = (27 + offset) % 32;
               32'b00000000000000000000000000001xxx:
                 data_out = (28 + offset) % 32;
               32'b000000000000000000000000000001xx:
                 data_out = (29 + offset) % 32;
               32'b0000000000000000000000000000001x:
                 data_out = (30 + offset) % 32;
               32'b00000000000000000000000000000001:
                 data_out = (31 + offset) % 32;
               default:
                 data_out = {5{1'bx}};
             endcase
          end
      else if(num_ports == 33)
        always@(data_in)
          begin
             case(data_in)
               33'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 33;
               33'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 33;
               33'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 33;
               33'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 33;
               33'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 33;
               33'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 33;
               33'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 33;
               33'b00000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 33;
               33'b000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 33;
               33'b0000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 33;
               33'b00000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 33;
               33'b000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 33;
               33'b0000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 33;
               33'b00000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 33;
               33'b000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 33;
               33'b0000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 33;
               33'b00000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 33;
               33'b000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 33;
               33'b0000000000000000001xxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 33;
               33'b00000000000000000001xxxxxxxxxxxxx:
                 data_out = (19 + offset) % 33;
               33'b000000000000000000001xxxxxxxxxxxx:
                 data_out = (20 + offset) % 33;
               33'b0000000000000000000001xxxxxxxxxxx:
                 data_out = (21 + offset) % 33;
               33'b00000000000000000000001xxxxxxxxxx:
                 data_out = (22 + offset) % 33;
               33'b000000000000000000000001xxxxxxxxx:
                 data_out = (23 + offset) % 33;
               33'b0000000000000000000000001xxxxxxxx:
                 data_out = (24 + offset) % 33;
               33'b00000000000000000000000001xxxxxxx:
                 data_out = (25 + offset) % 33;
               33'b000000000000000000000000001xxxxxx:
                 data_out = (26 + offset) % 33;
               33'b0000000000000000000000000001xxxxx:
                 data_out = (27 + offset) % 33;
               33'b00000000000000000000000000001xxxx:
                 data_out = (28 + offset) % 33;
               33'b000000000000000000000000000001xxx:
                 data_out = (29 + offset) % 33;
               33'b0000000000000000000000000000001xx:
                 data_out = (30 + offset) % 33;
               33'b00000000000000000000000000000001x:
                 data_out = (31 + offset) % 33;
               33'b000000000000000000000000000000001:
                 data_out = (32 + offset) % 33;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 34)
        always@(data_in)
          begin
             case(data_in)
               34'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 34;
               34'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 34;
               34'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 34;
               34'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 34;
               34'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 34;
               34'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 34;
               34'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 34;
               34'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 34;
               34'b000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 34;
               34'b0000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 34;
               34'b00000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 34;
               34'b000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 34;
               34'b0000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 34;
               34'b00000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 34;
               34'b000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 34;
               34'b0000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 34;
               34'b00000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 34;
               34'b000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 34;
               34'b0000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 34;
               34'b00000000000000000001xxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 34;
               34'b000000000000000000001xxxxxxxxxxxxx:
                 data_out = (20 + offset) % 34;
               34'b0000000000000000000001xxxxxxxxxxxx:
                 data_out = (21 + offset) % 34;
               34'b00000000000000000000001xxxxxxxxxxx:
                 data_out = (22 + offset) % 34;
               34'b000000000000000000000001xxxxxxxxxx:
                 data_out = (23 + offset) % 34;
               34'b0000000000000000000000001xxxxxxxxx:
                 data_out = (24 + offset) % 34;
               34'b00000000000000000000000001xxxxxxxx:
                 data_out = (25 + offset) % 34;
               34'b000000000000000000000000001xxxxxxx:
                 data_out = (26 + offset) % 34;
               34'b0000000000000000000000000001xxxxxx:
                 data_out = (27 + offset) % 34;
               34'b00000000000000000000000000001xxxxx:
                 data_out = (28 + offset) % 34;
               34'b000000000000000000000000000001xxxx:
                 data_out = (29 + offset) % 34;
               34'b0000000000000000000000000000001xxx:
                 data_out = (30 + offset) % 34;
               34'b00000000000000000000000000000001xx:
                 data_out = (31 + offset) % 34;
               34'b000000000000000000000000000000001x:
                 data_out = (32 + offset) % 34;
               34'b0000000000000000000000000000000001:
                 data_out = (33 + offset) % 34;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 35)
        always@(data_in)
          begin
             case(data_in)
               35'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 35;
               35'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 35;
               35'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 35;
               35'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 35;
               35'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 35;
               35'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 35;
               35'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 35;
               35'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 35;
               35'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 35;
               35'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 35;
               35'b00000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 35;
               35'b000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 35;
               35'b0000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 35;
               35'b00000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 35;
               35'b000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 35;
               35'b0000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 35;
               35'b00000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 35;
               35'b000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 35;
               35'b0000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 35;
               35'b00000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 35;
               35'b000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 35;
               35'b0000000000000000000001xxxxxxxxxxxxx:
                 data_out = (21 + offset) % 35;
               35'b00000000000000000000001xxxxxxxxxxxx:
                 data_out = (22 + offset) % 35;
               35'b000000000000000000000001xxxxxxxxxxx:
                 data_out = (23 + offset) % 35;
               35'b0000000000000000000000001xxxxxxxxxx:
                 data_out = (24 + offset) % 35;
               35'b00000000000000000000000001xxxxxxxxx:
                 data_out = (25 + offset) % 35;
               35'b000000000000000000000000001xxxxxxxx:
                 data_out = (26 + offset) % 35;
               35'b0000000000000000000000000001xxxxxxx:
                 data_out = (27 + offset) % 35;
               35'b00000000000000000000000000001xxxxxx:
                 data_out = (28 + offset) % 35;
               35'b000000000000000000000000000001xxxxx:
                 data_out = (29 + offset) % 35;
               35'b0000000000000000000000000000001xxxx:
                 data_out = (30 + offset) % 35;
               35'b00000000000000000000000000000001xxx:
                 data_out = (31 + offset) % 35;
               35'b000000000000000000000000000000001xx:
                 data_out = (32 + offset) % 35;
               35'b0000000000000000000000000000000001x:
                 data_out = (33 + offset) % 35;
               35'b00000000000000000000000000000000001:
                 data_out = (34 + offset) % 35;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 36)
        always@(data_in)
          begin
             case(data_in)
               36'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 36;
               36'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 36;
               36'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 36;
               36'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 36;
               36'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 36;
               36'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 36;
               36'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 36;
               36'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 36;
               36'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 36;
               36'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 36;
               36'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 36;
               36'b000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 36;
               36'b0000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 36;
               36'b00000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 36;
               36'b000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 36;
               36'b0000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 36;
               36'b00000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 36;
               36'b000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 36;
               36'b0000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 36;
               36'b00000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 36;
               36'b000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 36;
               36'b0000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 36;
               36'b00000000000000000000001xxxxxxxxxxxxx:
                 data_out = (22 + offset) % 36;
               36'b000000000000000000000001xxxxxxxxxxxx:
                 data_out = (23 + offset) % 36;
               36'b0000000000000000000000001xxxxxxxxxxx:
                 data_out = (24 + offset) % 36;
               36'b00000000000000000000000001xxxxxxxxxx:
                 data_out = (25 + offset) % 36;
               36'b000000000000000000000000001xxxxxxxxx:
                 data_out = (26 + offset) % 36;
               36'b0000000000000000000000000001xxxxxxxx:
                 data_out = (27 + offset) % 36;
               36'b00000000000000000000000000001xxxxxxx:
                 data_out = (28 + offset) % 36;
               36'b000000000000000000000000000001xxxxxx:
                 data_out = (29 + offset) % 36;
               36'b0000000000000000000000000000001xxxxx:
                 data_out = (30 + offset) % 36;
               36'b00000000000000000000000000000001xxxx:
                 data_out = (31 + offset) % 36;
               36'b000000000000000000000000000000001xxx:
                 data_out = (32 + offset) % 36;
               36'b0000000000000000000000000000000001xx:
                 data_out = (33 + offset) % 36;
               36'b00000000000000000000000000000000001x:
                 data_out = (34 + offset) % 36;
               36'b000000000000000000000000000000000001:
                 data_out = (35 + offset) % 36;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 37)
        always@(data_in)
          begin
             case(data_in)
               37'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 37;
               37'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 37;
               37'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 37;
               37'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 37;
               37'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 37;
               37'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 37;
               37'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 37;
               37'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 37;
               37'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 37;
               37'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 37;
               37'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 37;
               37'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 37;
               37'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 37;
               37'b00000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 37;
               37'b000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 37;
               37'b0000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 37;
               37'b00000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 37;
               37'b000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 37;
               37'b0000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 37;
               37'b00000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 37;
               37'b000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 37;
               37'b0000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 37;
               37'b00000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 37;
               37'b000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (23 + offset) % 37;
               37'b0000000000000000000000001xxxxxxxxxxxx:
                 data_out = (24 + offset) % 37;
               37'b00000000000000000000000001xxxxxxxxxxx:
                 data_out = (25 + offset) % 37;
               37'b000000000000000000000000001xxxxxxxxxx:
                 data_out = (26 + offset) % 37;
               37'b0000000000000000000000000001xxxxxxxxx:
                 data_out = (27 + offset) % 37;
               37'b00000000000000000000000000001xxxxxxxx:
                 data_out = (28 + offset) % 37;
               37'b000000000000000000000000000001xxxxxxx:
                 data_out = (29 + offset) % 37;
               37'b0000000000000000000000000000001xxxxxx:
                 data_out = (30 + offset) % 37;
               37'b00000000000000000000000000000001xxxxx:
                 data_out = (31 + offset) % 37;
               37'b000000000000000000000000000000001xxxx:
                 data_out = (32 + offset) % 37;
               37'b0000000000000000000000000000000001xxx:
                 data_out = (33 + offset) % 37;
               37'b00000000000000000000000000000000001xx:
                 data_out = (34 + offset) % 37;
               37'b000000000000000000000000000000000001x:
                 data_out = (35 + offset) % 37;
               37'b0000000000000000000000000000000000001:
                 data_out = (36 + offset) % 37;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 38)
        always@(data_in)
          begin
             case(data_in)
               38'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 38;
               38'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 38;
               38'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 38;
               38'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 38;
               38'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 38;
               38'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 38;
               38'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 38;
               38'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 38;
               38'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 38;
               38'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 38;
               38'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 38;
               38'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 38;
               38'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 38;
               38'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 38;
               38'b000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 38;
               38'b0000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 38;
               38'b00000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 38;
               38'b000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 38;
               38'b0000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 38;
               38'b00000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 38;
               38'b000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 38;
               38'b0000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 38;
               38'b00000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 38;
               38'b000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 38;
               38'b0000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (24 + offset) % 38;
               38'b00000000000000000000000001xxxxxxxxxxxx:
                 data_out = (25 + offset) % 38;
               38'b000000000000000000000000001xxxxxxxxxxx:
                 data_out = (26 + offset) % 38;
               38'b0000000000000000000000000001xxxxxxxxxx:
                 data_out = (27 + offset) % 38;
               38'b00000000000000000000000000001xxxxxxxxx:
                 data_out = (28 + offset) % 38;
               38'b000000000000000000000000000001xxxxxxxx:
                 data_out = (29 + offset) % 38;
               38'b0000000000000000000000000000001xxxxxxx:
                 data_out = (30 + offset) % 38;
               38'b00000000000000000000000000000001xxxxxx:
                 data_out = (31 + offset) % 38;
               38'b000000000000000000000000000000001xxxxx:
                 data_out = (32 + offset) % 38;
               38'b0000000000000000000000000000000001xxxx:
                 data_out = (33 + offset) % 38;
               38'b00000000000000000000000000000000001xxx:
                 data_out = (34 + offset) % 38;
               38'b000000000000000000000000000000000001xx:
                 data_out = (35 + offset) % 38;
               38'b0000000000000000000000000000000000001x:
                 data_out = (36 + offset) % 38;
               38'b00000000000000000000000000000000000001:
                 data_out = (37 + offset) % 38;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 39)
        always@(data_in)
          begin
             case(data_in)
               39'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 39;
               39'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 39;
               39'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 39;
               39'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 39;
               39'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 39;
               39'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 39;
               39'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 39;
               39'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 39;
               39'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 39;
               39'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 39;
               39'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 39;
               39'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 39;
               39'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 39;
               39'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 39;
               39'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 39;
               39'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 39;
               39'b00000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 39;
               39'b000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 39;
               39'b0000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 39;
               39'b00000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 39;
               39'b000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 39;
               39'b0000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 39;
               39'b00000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 39;
               39'b000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 39;
               39'b0000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 39;
               39'b00000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (25 + offset) % 39;
               39'b000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (26 + offset) % 39;
               39'b0000000000000000000000000001xxxxxxxxxxx:
                 data_out = (27 + offset) % 39;
               39'b00000000000000000000000000001xxxxxxxxxx:
                 data_out = (28 + offset) % 39;
               39'b000000000000000000000000000001xxxxxxxxx:
                 data_out = (29 + offset) % 39;
               39'b0000000000000000000000000000001xxxxxxxx:
                 data_out = (30 + offset) % 39;
               39'b00000000000000000000000000000001xxxxxxx:
                 data_out = (31 + offset) % 39;
               39'b000000000000000000000000000000001xxxxxx:
                 data_out = (32 + offset) % 39;
               39'b0000000000000000000000000000000001xxxxx:
                 data_out = (33 + offset) % 39;
               39'b00000000000000000000000000000000001xxxx:
                 data_out = (34 + offset) % 39;
               39'b000000000000000000000000000000000001xxx:
                 data_out = (35 + offset) % 39;
               39'b0000000000000000000000000000000000001xx:
                 data_out = (36 + offset) % 39;
               39'b00000000000000000000000000000000000001x:
                 data_out = (37 + offset) % 39;
               39'b000000000000000000000000000000000000001:
                 data_out = (38 + offset) % 39;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 40)
        always@(data_in)
          begin
             case(data_in)
               40'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 40;
               40'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 40;
               40'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 40;
               40'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 40;
               40'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 40;
               40'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 40;
               40'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 40;
               40'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 40;
               40'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 40;
               40'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 40;
               40'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 40;
               40'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 40;
               40'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 40;
               40'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 40;
               40'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 40;
               40'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 40;
               40'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 40;
               40'b000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 40;
               40'b0000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 40;
               40'b00000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 40;
               40'b000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 40;
               40'b0000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 40;
               40'b00000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 40;
               40'b000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 40;
               40'b0000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 40;
               40'b00000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 40;
               40'b000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (26 + offset) % 40;
               40'b0000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (27 + offset) % 40;
               40'b00000000000000000000000000001xxxxxxxxxxx:
                 data_out = (28 + offset) % 40;
               40'b000000000000000000000000000001xxxxxxxxxx:
                 data_out = (29 + offset) % 40;
               40'b0000000000000000000000000000001xxxxxxxxx:
                 data_out = (30 + offset) % 40;
               40'b00000000000000000000000000000001xxxxxxxx:
                 data_out = (31 + offset) % 40;
               40'b000000000000000000000000000000001xxxxxxx:
                 data_out = (32 + offset) % 40;
               40'b0000000000000000000000000000000001xxxxxx:
                 data_out = (33 + offset) % 40;
               40'b00000000000000000000000000000000001xxxxx:
                 data_out = (34 + offset) % 40;
               40'b000000000000000000000000000000000001xxxx:
                 data_out = (35 + offset) % 40;
               40'b0000000000000000000000000000000000001xxx:
                 data_out = (36 + offset) % 40;
               40'b00000000000000000000000000000000000001xx:
                 data_out = (37 + offset) % 40;
               40'b000000000000000000000000000000000000001x:
                 data_out = (38 + offset) % 40;
               40'b0000000000000000000000000000000000000001:
                 data_out = (39 + offset) % 40;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 41)
        always@(data_in)
          begin
             case(data_in)
               41'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 41;
               41'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 41;
               41'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 41;
               41'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 41;
               41'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 41;
               41'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 41;
               41'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 41;
               41'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 41;
               41'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 41;
               41'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 41;
               41'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 41;
               41'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 41;
               41'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 41;
               41'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 41;
               41'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 41;
               41'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 41;
               41'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 41;
               41'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 41;
               41'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 41;
               41'b00000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 41;
               41'b000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 41;
               41'b0000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 41;
               41'b00000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 41;
               41'b000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 41;
               41'b0000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 41;
               41'b00000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 41;
               41'b000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 41;
               41'b0000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (27 + offset) % 41;
               41'b00000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (28 + offset) % 41;
               41'b000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (29 + offset) % 41;
               41'b0000000000000000000000000000001xxxxxxxxxx:
                 data_out = (30 + offset) % 41;
               41'b00000000000000000000000000000001xxxxxxxxx:
                 data_out = (31 + offset) % 41;
               41'b000000000000000000000000000000001xxxxxxxx:
                 data_out = (32 + offset) % 41;
               41'b0000000000000000000000000000000001xxxxxxx:
                 data_out = (33 + offset) % 41;
               41'b00000000000000000000000000000000001xxxxxx:
                 data_out = (34 + offset) % 41;
               41'b000000000000000000000000000000000001xxxxx:
                 data_out = (35 + offset) % 41;
               41'b0000000000000000000000000000000000001xxxx:
                 data_out = (36 + offset) % 41;
               41'b00000000000000000000000000000000000001xxx:
                 data_out = (37 + offset) % 41;
               41'b000000000000000000000000000000000000001xx:
                 data_out = (38 + offset) % 41;
               41'b0000000000000000000000000000000000000001x:
                 data_out = (39 + offset) % 41;
               41'b00000000000000000000000000000000000000001:
                 data_out = (40 + offset) % 41;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 42)
        always@(data_in)
          begin
             case(data_in)
               42'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 42;
               42'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 42;
               42'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 42;
               42'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 42;
               42'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 42;
               42'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 42;
               42'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 42;
               42'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 42;
               42'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 42;
               42'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 42;
               42'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 42;
               42'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 42;
               42'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 42;
               42'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 42;
               42'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 42;
               42'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 42;
               42'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 42;
               42'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 42;
               42'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 42;
               42'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 42;
               42'b000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 42;
               42'b0000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 42;
               42'b00000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 42;
               42'b000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 42;
               42'b0000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 42;
               42'b00000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 42;
               42'b000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 42;
               42'b0000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 42;
               42'b00000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (28 + offset) % 42;
               42'b000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (29 + offset) % 42;
               42'b0000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (30 + offset) % 42;
               42'b00000000000000000000000000000001xxxxxxxxxx:
                 data_out = (31 + offset) % 42;
               42'b000000000000000000000000000000001xxxxxxxxx:
                 data_out = (32 + offset) % 42;
               42'b0000000000000000000000000000000001xxxxxxxx:
                 data_out = (33 + offset) % 42;
               42'b00000000000000000000000000000000001xxxxxxx:
                 data_out = (34 + offset) % 42;
               42'b000000000000000000000000000000000001xxxxxx:
                 data_out = (35 + offset) % 42;
               42'b0000000000000000000000000000000000001xxxxx:
                 data_out = (36 + offset) % 42;
               42'b00000000000000000000000000000000000001xxxx:
                 data_out = (37 + offset) % 42;
               42'b000000000000000000000000000000000000001xxx:
                 data_out = (38 + offset) % 42;
               42'b0000000000000000000000000000000000000001xx:
                 data_out = (39 + offset) % 42;
               42'b00000000000000000000000000000000000000001x:
                 data_out = (40 + offset) % 42;
               42'b000000000000000000000000000000000000000001:
                 data_out = (41 + offset) % 42;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 43)
        always@(data_in)
          begin
             case(data_in)
               43'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 43;
               43'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 43;
               43'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 43;
               43'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 43;
               43'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 43;
               43'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 43;
               43'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 43;
               43'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 43;
               43'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 43;
               43'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 43;
               43'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 43;
               43'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 43;
               43'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 43;
               43'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 43;
               43'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 43;
               43'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 43;
               43'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 43;
               43'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 43;
               43'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 43;
               43'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 43;
               43'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 43;
               43'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 43;
               43'b00000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 43;
               43'b000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 43;
               43'b0000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 43;
               43'b00000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 43;
               43'b000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 43;
               43'b0000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 43;
               43'b00000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 43;
               43'b000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (29 + offset) % 43;
               43'b0000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (30 + offset) % 43;
               43'b00000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (31 + offset) % 43;
               43'b000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (32 + offset) % 43;
               43'b0000000000000000000000000000000001xxxxxxxxx:
                 data_out = (33 + offset) % 43;
               43'b00000000000000000000000000000000001xxxxxxxx:
                 data_out = (34 + offset) % 43;
               43'b000000000000000000000000000000000001xxxxxxx:
                 data_out = (35 + offset) % 43;
               43'b0000000000000000000000000000000000001xxxxxx:
                 data_out = (36 + offset) % 43;
               43'b00000000000000000000000000000000000001xxxxx:
                 data_out = (37 + offset) % 43;
               43'b000000000000000000000000000000000000001xxxx:
                 data_out = (38 + offset) % 43;
               43'b0000000000000000000000000000000000000001xxx:
                 data_out = (39 + offset) % 43;
               43'b00000000000000000000000000000000000000001xx:
                 data_out = (40 + offset) % 43;
               43'b000000000000000000000000000000000000000001x:
                 data_out = (41 + offset) % 43;
               43'b0000000000000000000000000000000000000000001:
                 data_out = (42 + offset) % 43;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 44)
        always@(data_in)
          begin
             case(data_in)
               44'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 44;
               44'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 44;
               44'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 44;
               44'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 44;
               44'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 44;
               44'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 44;
               44'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 44;
               44'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 44;
               44'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 44;
               44'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 44;
               44'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 44;
               44'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 44;
               44'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 44;
               44'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 44;
               44'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 44;
               44'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 44;
               44'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 44;
               44'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 44;
               44'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 44;
               44'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 44;
               44'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 44;
               44'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 44;
               44'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 44;
               44'b000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 44;
               44'b0000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 44;
               44'b00000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 44;
               44'b000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 44;
               44'b0000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 44;
               44'b00000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 44;
               44'b000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 44;
               44'b0000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (30 + offset) % 44;
               44'b00000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (31 + offset) % 44;
               44'b000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (32 + offset) % 44;
               44'b0000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (33 + offset) % 44;
               44'b00000000000000000000000000000000001xxxxxxxxx:
                 data_out = (34 + offset) % 44;
               44'b000000000000000000000000000000000001xxxxxxxx:
                 data_out = (35 + offset) % 44;
               44'b0000000000000000000000000000000000001xxxxxxx:
                 data_out = (36 + offset) % 44;
               44'b00000000000000000000000000000000000001xxxxxx:
                 data_out = (37 + offset) % 44;
               44'b000000000000000000000000000000000000001xxxxx:
                 data_out = (38 + offset) % 44;
               44'b0000000000000000000000000000000000000001xxxx:
                 data_out = (39 + offset) % 44;
               44'b00000000000000000000000000000000000000001xxx:
                 data_out = (40 + offset) % 44;
               44'b000000000000000000000000000000000000000001xx:
                 data_out = (41 + offset) % 44;
               44'b0000000000000000000000000000000000000000001x:
                 data_out = (42 + offset) % 44;
               44'b00000000000000000000000000000000000000000001:
                 data_out = (43 + offset) % 44;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 45)
        always@(data_in)
          begin
             case(data_in)
               45'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 45;
               45'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 45;
               45'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 45;
               45'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 45;
               45'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 45;
               45'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 45;
               45'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 45;
               45'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 45;
               45'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 45;
               45'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 45;
               45'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 45;
               45'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 45;
               45'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 45;
               45'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 45;
               45'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 45;
               45'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 45;
               45'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 45;
               45'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 45;
               45'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 45;
               45'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 45;
               45'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 45;
               45'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 45;
               45'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 45;
               45'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 45;
               45'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 45;
               45'b00000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 45;
               45'b000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 45;
               45'b0000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 45;
               45'b00000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 45;
               45'b000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 45;
               45'b0000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 45;
               45'b00000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (31 + offset) % 45;
               45'b000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (32 + offset) % 45;
               45'b0000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (33 + offset) % 45;
               45'b00000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (34 + offset) % 45;
               45'b000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (35 + offset) % 45;
               45'b0000000000000000000000000000000000001xxxxxxxx:
                 data_out = (36 + offset) % 45;
               45'b00000000000000000000000000000000000001xxxxxxx:
                 data_out = (37 + offset) % 45;
               45'b000000000000000000000000000000000000001xxxxxx:
                 data_out = (38 + offset) % 45;
               45'b0000000000000000000000000000000000000001xxxxx:
                 data_out = (39 + offset) % 45;
               45'b00000000000000000000000000000000000000001xxxx:
                 data_out = (40 + offset) % 45;
               45'b000000000000000000000000000000000000000001xxx:
                 data_out = (41 + offset) % 45;
               45'b0000000000000000000000000000000000000000001xx:
                 data_out = (42 + offset) % 45;
               45'b00000000000000000000000000000000000000000001x:
                 data_out = (43 + offset) % 45;
               45'b000000000000000000000000000000000000000000001:
                 data_out = (44 + offset) % 45;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 46)
        always@(data_in)
          begin
             case(data_in)
               46'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 46;
               46'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 46;
               46'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 46;
               46'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 46;
               46'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 46;
               46'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 46;
               46'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 46;
               46'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 46;
               46'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 46;
               46'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 46;
               46'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 46;
               46'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 46;
               46'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 46;
               46'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 46;
               46'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 46;
               46'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 46;
               46'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 46;
               46'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 46;
               46'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 46;
               46'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 46;
               46'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 46;
               46'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 46;
               46'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 46;
               46'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 46;
               46'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 46;
               46'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 46;
               46'b000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 46;
               46'b0000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 46;
               46'b00000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 46;
               46'b000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 46;
               46'b0000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 46;
               46'b00000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 46;
               46'b000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (32 + offset) % 46;
               46'b0000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (33 + offset) % 46;
               46'b00000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (34 + offset) % 46;
               46'b000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (35 + offset) % 46;
               46'b0000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (36 + offset) % 46;
               46'b00000000000000000000000000000000000001xxxxxxxx:
                 data_out = (37 + offset) % 46;
               46'b000000000000000000000000000000000000001xxxxxxx:
                 data_out = (38 + offset) % 46;
               46'b0000000000000000000000000000000000000001xxxxxx:
                 data_out = (39 + offset) % 46;
               46'b00000000000000000000000000000000000000001xxxxx:
                 data_out = (40 + offset) % 46;
               46'b000000000000000000000000000000000000000001xxxx:
                 data_out = (41 + offset) % 46;
               46'b0000000000000000000000000000000000000000001xxx:
                 data_out = (42 + offset) % 46;
               46'b00000000000000000000000000000000000000000001xx:
                 data_out = (43 + offset) % 46;
               46'b000000000000000000000000000000000000000000001x:
                 data_out = (44 + offset) % 46;
               46'b0000000000000000000000000000000000000000000001:
                 data_out = (45 + offset) % 46;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 47)
        always@(data_in)
          begin
             case(data_in)
               47'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 47;
               47'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 47;
               47'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 47;
               47'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 47;
               47'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 47;
               47'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 47;
               47'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 47;
               47'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 47;
               47'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 47;
               47'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 47;
               47'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 47;
               47'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 47;
               47'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 47;
               47'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 47;
               47'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 47;
               47'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 47;
               47'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 47;
               47'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 47;
               47'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 47;
               47'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 47;
               47'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 47;
               47'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 47;
               47'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 47;
               47'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 47;
               47'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 47;
               47'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 47;
               47'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 47;
               47'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 47;
               47'b00000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 47;
               47'b000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 47;
               47'b0000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 47;
               47'b00000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 47;
               47'b000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 47;
               47'b0000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (33 + offset) % 47;
               47'b00000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (34 + offset) % 47;
               47'b000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (35 + offset) % 47;
               47'b0000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (36 + offset) % 47;
               47'b00000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (37 + offset) % 47;
               47'b000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (38 + offset) % 47;
               47'b0000000000000000000000000000000000000001xxxxxxx:
                 data_out = (39 + offset) % 47;
               47'b00000000000000000000000000000000000000001xxxxxx:
                 data_out = (40 + offset) % 47;
               47'b000000000000000000000000000000000000000001xxxxx:
                 data_out = (41 + offset) % 47;
               47'b0000000000000000000000000000000000000000001xxxx:
                 data_out = (42 + offset) % 47;
               47'b00000000000000000000000000000000000000000001xxx:
                 data_out = (43 + offset) % 47;
               47'b000000000000000000000000000000000000000000001xx:
                 data_out = (44 + offset) % 47;
               47'b0000000000000000000000000000000000000000000001x:
                 data_out = (45 + offset) % 47;
               47'b00000000000000000000000000000000000000000000001:
                 data_out = (46 + offset) % 47;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 48)
        always@(data_in)
          begin
             case(data_in)
               48'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 48;
               48'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 48;
               48'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 48;
               48'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 48;
               48'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 48;
               48'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 48;
               48'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 48;
               48'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 48;
               48'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 48;
               48'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 48;
               48'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 48;
               48'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 48;
               48'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 48;
               48'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 48;
               48'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 48;
               48'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 48;
               48'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 48;
               48'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 48;
               48'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 48;
               48'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 48;
               48'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 48;
               48'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 48;
               48'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 48;
               48'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 48;
               48'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 48;
               48'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 48;
               48'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 48;
               48'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 48;
               48'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 48;
               48'b000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 48;
               48'b0000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 48;
               48'b00000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 48;
               48'b000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 48;
               48'b0000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 48;
               48'b00000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (34 + offset) % 48;
               48'b000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (35 + offset) % 48;
               48'b0000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (36 + offset) % 48;
               48'b00000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (37 + offset) % 48;
               48'b000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (38 + offset) % 48;
               48'b0000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (39 + offset) % 48;
               48'b00000000000000000000000000000000000000001xxxxxxx:
                 data_out = (40 + offset) % 48;
               48'b000000000000000000000000000000000000000001xxxxxx:
                 data_out = (41 + offset) % 48;
               48'b0000000000000000000000000000000000000000001xxxxx:
                 data_out = (42 + offset) % 48;
               48'b00000000000000000000000000000000000000000001xxxx:
                 data_out = (43 + offset) % 48;
               48'b000000000000000000000000000000000000000000001xxx:
                 data_out = (44 + offset) % 48;
               48'b0000000000000000000000000000000000000000000001xx:
                 data_out = (45 + offset) % 48;
               48'b00000000000000000000000000000000000000000000001x:
                 data_out = (46 + offset) % 48;
               48'b000000000000000000000000000000000000000000000001:
                 data_out = (47 + offset) % 48;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 49)
        always@(data_in)
          begin
             case(data_in)
               49'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 49;
               49'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 49;
               49'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 49;
               49'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 49;
               49'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 49;
               49'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 49;
               49'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 49;
               49'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 49;
               49'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 49;
               49'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 49;
               49'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 49;
               49'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 49;
               49'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 49;
               49'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 49;
               49'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 49;
               49'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 49;
               49'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 49;
               49'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 49;
               49'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 49;
               49'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 49;
               49'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 49;
               49'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 49;
               49'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 49;
               49'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 49;
               49'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 49;
               49'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 49;
               49'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 49;
               49'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 49;
               49'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 49;
               49'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 49;
               49'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 49;
               49'b00000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 49;
               49'b000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 49;
               49'b0000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 49;
               49'b00000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 49;
               49'b000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (35 + offset) % 49;
               49'b0000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (36 + offset) % 49;
               49'b00000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (37 + offset) % 49;
               49'b000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (38 + offset) % 49;
               49'b0000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (39 + offset) % 49;
               49'b00000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (40 + offset) % 49;
               49'b000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (41 + offset) % 49;
               49'b0000000000000000000000000000000000000000001xxxxxx:
                 data_out = (42 + offset) % 49;
               49'b00000000000000000000000000000000000000000001xxxxx:
                 data_out = (43 + offset) % 49;
               49'b000000000000000000000000000000000000000000001xxxx:
                 data_out = (44 + offset) % 49;
               49'b0000000000000000000000000000000000000000000001xxx:
                 data_out = (45 + offset) % 49;
               49'b00000000000000000000000000000000000000000000001xx:
                 data_out = (46 + offset) % 49;
               49'b000000000000000000000000000000000000000000000001x:
                 data_out = (47 + offset) % 49;
               49'b0000000000000000000000000000000000000000000000001:
                 data_out = (48 + offset) % 49;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 50)
        always@(data_in)
          begin
             case(data_in)
               50'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 50;
               50'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 50;
               50'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 50;
               50'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 50;
               50'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 50;
               50'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 50;
               50'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 50;
               50'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 50;
               50'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 50;
               50'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 50;
               50'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 50;
               50'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 50;
               50'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 50;
               50'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 50;
               50'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 50;
               50'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 50;
               50'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 50;
               50'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 50;
               50'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 50;
               50'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 50;
               50'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 50;
               50'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 50;
               50'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 50;
               50'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 50;
               50'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 50;
               50'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 50;
               50'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 50;
               50'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 50;
               50'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 50;
               50'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 50;
               50'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 50;
               50'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 50;
               50'b000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 50;
               50'b0000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 50;
               50'b00000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 50;
               50'b000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 50;
               50'b0000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (36 + offset) % 50;
               50'b00000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (37 + offset) % 50;
               50'b000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (38 + offset) % 50;
               50'b0000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (39 + offset) % 50;
               50'b00000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (40 + offset) % 50;
               50'b000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (41 + offset) % 50;
               50'b0000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (42 + offset) % 50;
               50'b00000000000000000000000000000000000000000001xxxxxx:
                 data_out = (43 + offset) % 50;
               50'b000000000000000000000000000000000000000000001xxxxx:
                 data_out = (44 + offset) % 50;
               50'b0000000000000000000000000000000000000000000001xxxx:
                 data_out = (45 + offset) % 50;
               50'b00000000000000000000000000000000000000000000001xxx:
                 data_out = (46 + offset) % 50;
               50'b000000000000000000000000000000000000000000000001xx:
                 data_out = (47 + offset) % 50;
               50'b0000000000000000000000000000000000000000000000001x:
                 data_out = (48 + offset) % 50;
               50'b00000000000000000000000000000000000000000000000001:
                 data_out = (49 + offset) % 50;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 51)
        always@(data_in)
          begin
             case(data_in)
               51'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 51;
               51'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 51;
               51'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 51;
               51'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 51;
               51'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 51;
               51'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 51;
               51'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 51;
               51'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 51;
               51'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 51;
               51'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 51;
               51'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 51;
               51'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 51;
               51'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 51;
               51'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 51;
               51'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 51;
               51'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 51;
               51'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 51;
               51'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 51;
               51'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 51;
               51'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 51;
               51'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 51;
               51'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 51;
               51'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 51;
               51'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 51;
               51'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 51;
               51'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 51;
               51'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 51;
               51'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 51;
               51'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 51;
               51'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 51;
               51'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 51;
               51'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 51;
               51'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 51;
               51'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 51;
               51'b00000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 51;
               51'b000000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 51;
               51'b0000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (36 + offset) % 51;
               51'b00000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (37 + offset) % 51;
               51'b000000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (38 + offset) % 51;
               51'b0000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (39 + offset) % 51;
               51'b00000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (40 + offset) % 51;
               51'b000000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (41 + offset) % 51;
               51'b0000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (42 + offset) % 51;
               51'b00000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (43 + offset) % 51;
               51'b000000000000000000000000000000000000000000001xxxxxx:
                 data_out = (44 + offset) % 51;
               51'b0000000000000000000000000000000000000000000001xxxxx:
                 data_out = (45 + offset) % 51;
               51'b00000000000000000000000000000000000000000000001xxxx:
                 data_out = (46 + offset) % 51;
               51'b000000000000000000000000000000000000000000000001xxx:
                 data_out = (47 + offset) % 51;
               51'b0000000000000000000000000000000000000000000000001xx:
                 data_out = (48 + offset) % 51;
               51'b00000000000000000000000000000000000000000000000001x:
                 data_out = (49 + offset) % 51;
               51'b000000000000000000000000000000000000000000000000001:
                 data_out = (50 + offset) % 51;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 52)
        always@(data_in)
          begin
             case(data_in)
               52'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 52;
               52'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 52;
               52'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 52;
               52'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 52;
               52'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 52;
               52'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 52;
               52'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 52;
               52'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 52;
               52'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 52;
               52'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 52;
               52'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 52;
               52'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 52;
               52'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 52;
               52'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 52;
               52'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 52;
               52'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 52;
               52'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 52;
               52'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 52;
               52'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 52;
               52'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 52;
               52'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 52;
               52'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 52;
               52'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 52;
               52'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 52;
               52'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 52;
               52'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 52;
               52'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 52;
               52'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 52;
               52'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 52;
               52'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 52;
               52'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 52;
               52'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 52;
               52'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 52;
               52'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 52;
               52'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 52;
               52'b000000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 52;
               52'b0000000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (36 + offset) % 52;
               52'b00000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (37 + offset) % 52;
               52'b000000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (38 + offset) % 52;
               52'b0000000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (39 + offset) % 52;
               52'b00000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (40 + offset) % 52;
               52'b000000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (41 + offset) % 52;
               52'b0000000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (42 + offset) % 52;
               52'b00000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (43 + offset) % 52;
               52'b000000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (44 + offset) % 52;
               52'b0000000000000000000000000000000000000000000001xxxxxx:
                 data_out = (45 + offset) % 52;
               52'b00000000000000000000000000000000000000000000001xxxxx:
                 data_out = (46 + offset) % 52;
               52'b000000000000000000000000000000000000000000000001xxxx:
                 data_out = (47 + offset) % 52;
               52'b0000000000000000000000000000000000000000000000001xxx:
                 data_out = (48 + offset) % 52;
               52'b00000000000000000000000000000000000000000000000001xx:
                 data_out = (49 + offset) % 52;
               52'b000000000000000000000000000000000000000000000000001x:
                 data_out = (50 + offset) % 52;
               52'b0000000000000000000000000000000000000000000000000001:
                 data_out = (51 + offset) % 52;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 53)
        always@(data_in)
          begin
             case(data_in)
               53'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 53;
               53'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 53;
               53'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 53;
               53'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 53;
               53'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 53;
               53'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 53;
               53'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 53;
               53'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 53;
               53'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 53;
               53'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 53;
               53'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 53;
               53'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 53;
               53'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 53;
               53'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 53;
               53'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 53;
               53'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 53;
               53'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 53;
               53'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 53;
               53'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 53;
               53'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 53;
               53'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 53;
               53'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 53;
               53'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 53;
               53'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 53;
               53'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 53;
               53'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 53;
               53'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 53;
               53'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 53;
               53'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 53;
               53'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 53;
               53'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 53;
               53'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 53;
               53'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 53;
               53'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 53;
               53'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 53;
               53'b000000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 53;
               53'b0000000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (36 + offset) % 53;
               53'b00000000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (37 + offset) % 53;
               53'b000000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (38 + offset) % 53;
               53'b0000000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (39 + offset) % 53;
               53'b00000000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (40 + offset) % 53;
               53'b000000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (41 + offset) % 53;
               53'b0000000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (42 + offset) % 53;
               53'b00000000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (43 + offset) % 53;
               53'b000000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (44 + offset) % 53;
               53'b0000000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (45 + offset) % 53;
               53'b00000000000000000000000000000000000000000000001xxxxxx:
                 data_out = (46 + offset) % 53;
               53'b000000000000000000000000000000000000000000000001xxxxx:
                 data_out = (47 + offset) % 53;
               53'b0000000000000000000000000000000000000000000000001xxxx:
                 data_out = (48 + offset) % 53;
               53'b00000000000000000000000000000000000000000000000001xxx:
                 data_out = (49 + offset) % 53;
               53'b000000000000000000000000000000000000000000000000001xx:
                 data_out = (50 + offset) % 53;
               53'b0000000000000000000000000000000000000000000000000001x:
                 data_out = (51 + offset) % 53;
               53'b00000000000000000000000000000000000000000000000000001:
                 data_out = (52 + offset) % 53;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 54)
        always@(data_in)
          begin
             case(data_in)
               54'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 54;
               54'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 54;
               54'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 54;
               54'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 54;
               54'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 54;
               54'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 54;
               54'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 54;
               54'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 54;
               54'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 54;
               54'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 54;
               54'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 54;
               54'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 54;
               54'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 54;
               54'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 54;
               54'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 54;
               54'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 54;
               54'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 54;
               54'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 54;
               54'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 54;
               54'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 54;
               54'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 54;
               54'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 54;
               54'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 54;
               54'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 54;
               54'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 54;
               54'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 54;
               54'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 54;
               54'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 54;
               54'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 54;
               54'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 54;
               54'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 54;
               54'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 54;
               54'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 54;
               54'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 54;
               54'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 54;
               54'b000000000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 54;
               54'b0000000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (36 + offset) % 54;
               54'b00000000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (37 + offset) % 54;
               54'b000000000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (38 + offset) % 54;
               54'b0000000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (39 + offset) % 54;
               54'b00000000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (40 + offset) % 54;
               54'b000000000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (41 + offset) % 54;
               54'b0000000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (42 + offset) % 54;
               54'b00000000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (43 + offset) % 54;
               54'b000000000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (44 + offset) % 54;
               54'b0000000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (45 + offset) % 54;
               54'b00000000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (46 + offset) % 54;
               54'b000000000000000000000000000000000000000000000001xxxxxx:
                 data_out = (47 + offset) % 54;
               54'b0000000000000000000000000000000000000000000000001xxxxx:
                 data_out = (48 + offset) % 54;
               54'b00000000000000000000000000000000000000000000000001xxxx:
                 data_out = (49 + offset) % 54;
               54'b000000000000000000000000000000000000000000000000001xxx:
                 data_out = (50 + offset) % 54;
               54'b0000000000000000000000000000000000000000000000000001xx:
                 data_out = (51 + offset) % 54;
               54'b00000000000000000000000000000000000000000000000000001x:
                 data_out = (52 + offset) % 54;
               54'b000000000000000000000000000000000000000000000000000001:
                 data_out = (53 + offset) % 54;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 55)
        always@(data_in)
          begin
             case(data_in)
               55'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 55;
               55'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 55;
               55'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 55;
               55'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 55;
               55'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 55;
               55'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 55;
               55'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 55;
               55'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 55;
               55'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 55;
               55'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 55;
               55'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 55;
               55'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 55;
               55'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 55;
               55'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 55;
               55'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 55;
               55'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 55;
               55'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 55;
               55'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 55;
               55'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 55;
               55'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 55;
               55'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 55;
               55'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 55;
               55'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 55;
               55'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 55;
               55'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 55;
               55'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 55;
               55'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 55;
               55'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 55;
               55'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 55;
               55'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 55;
               55'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 55;
               55'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 55;
               55'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 55;
               55'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 55;
               55'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 55;
               55'b000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 55;
               55'b0000000000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (36 + offset) % 55;
               55'b00000000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (37 + offset) % 55;
               55'b000000000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (38 + offset) % 55;
               55'b0000000000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (39 + offset) % 55;
               55'b00000000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (40 + offset) % 55;
               55'b000000000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (41 + offset) % 55;
               55'b0000000000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (42 + offset) % 55;
               55'b00000000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (43 + offset) % 55;
               55'b000000000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (44 + offset) % 55;
               55'b0000000000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (45 + offset) % 55;
               55'b00000000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (46 + offset) % 55;
               55'b000000000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (47 + offset) % 55;
               55'b0000000000000000000000000000000000000000000000001xxxxxx:
                 data_out = (48 + offset) % 55;
               55'b00000000000000000000000000000000000000000000000001xxxxx:
                 data_out = (49 + offset) % 55;
               55'b000000000000000000000000000000000000000000000000001xxxx:
                 data_out = (50 + offset) % 55;
               55'b0000000000000000000000000000000000000000000000000001xxx:
                 data_out = (51 + offset) % 55;
               55'b00000000000000000000000000000000000000000000000000001xx:
                 data_out = (52 + offset) % 55;
               55'b000000000000000000000000000000000000000000000000000001x:
                 data_out = (53 + offset) % 55;
               55'b0000000000000000000000000000000000000000000000000000001:
                 data_out = (54 + offset) % 55;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 56)
        always@(data_in)
          begin
             case(data_in)
               56'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 56;
               56'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 56;
               56'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 56;
               56'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 56;
               56'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 56;
               56'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 56;
               56'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 56;
               56'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 56;
               56'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 56;
               56'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 56;
               56'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 56;
               56'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 56;
               56'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 56;
               56'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 56;
               56'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 56;
               56'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 56;
               56'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 56;
               56'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 56;
               56'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 56;
               56'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 56;
               56'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 56;
               56'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 56;
               56'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 56;
               56'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 56;
               56'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 56;
               56'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 56;
               56'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 56;
               56'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 56;
               56'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 56;
               56'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 56;
               56'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 56;
               56'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 56;
               56'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 56;
               56'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 56;
               56'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 56;
               56'b000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 56;
               56'b0000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (36 + offset) % 56;
               56'b00000000000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (37 + offset) % 56;
               56'b000000000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (38 + offset) % 56;
               56'b0000000000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (39 + offset) % 56;
               56'b00000000000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (40 + offset) % 56;
               56'b000000000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (41 + offset) % 56;
               56'b0000000000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (42 + offset) % 56;
               56'b00000000000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (43 + offset) % 56;
               56'b000000000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (44 + offset) % 56;
               56'b0000000000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (45 + offset) % 56;
               56'b00000000000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (46 + offset) % 56;
               56'b000000000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (47 + offset) % 56;
               56'b0000000000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (48 + offset) % 56;
               56'b00000000000000000000000000000000000000000000000001xxxxxx:
                 data_out = (49 + offset) % 56;
               56'b000000000000000000000000000000000000000000000000001xxxxx:
                 data_out = (50 + offset) % 56;
               56'b0000000000000000000000000000000000000000000000000001xxxx:
                 data_out = (51 + offset) % 56;
               56'b00000000000000000000000000000000000000000000000000001xxx:
                 data_out = (52 + offset) % 56;
               56'b000000000000000000000000000000000000000000000000000001xx:
                 data_out = (53 + offset) % 56;
               56'b0000000000000000000000000000000000000000000000000000001x:
                 data_out = (54 + offset) % 56;
               56'b00000000000000000000000000000000000000000000000000000001:
                 data_out = (55 + offset) % 56;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 57)
        always@(data_in)
          begin
             case(data_in)
               57'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 57;
               57'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 57;
               57'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 57;
               57'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 57;
               57'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 57;
               57'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 57;
               57'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 57;
               57'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 57;
               57'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 57;
               57'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 57;
               57'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 57;
               57'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 57;
               57'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 57;
               57'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 57;
               57'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 57;
               57'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 57;
               57'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 57;
               57'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 57;
               57'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 57;
               57'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 57;
               57'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 57;
               57'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 57;
               57'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 57;
               57'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 57;
               57'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 57;
               57'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 57;
               57'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 57;
               57'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 57;
               57'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 57;
               57'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 57;
               57'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 57;
               57'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 57;
               57'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 57;
               57'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 57;
               57'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 57;
               57'b000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 57;
               57'b0000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (36 + offset) % 57;
               57'b00000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (37 + offset) % 57;
               57'b000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (38 + offset) % 57;
               57'b0000000000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (39 + offset) % 57;
               57'b00000000000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (40 + offset) % 57;
               57'b000000000000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (41 + offset) % 57;
               57'b0000000000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (42 + offset) % 57;
               57'b00000000000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (43 + offset) % 57;
               57'b000000000000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (44 + offset) % 57;
               57'b0000000000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (45 + offset) % 57;
               57'b00000000000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (46 + offset) % 57;
               57'b000000000000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (47 + offset) % 57;
               57'b0000000000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (48 + offset) % 57;
               57'b00000000000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (49 + offset) % 57;
               57'b000000000000000000000000000000000000000000000000001xxxxxx:
                 data_out = (50 + offset) % 57;
               57'b0000000000000000000000000000000000000000000000000001xxxxx:
                 data_out = (51 + offset) % 57;
               57'b00000000000000000000000000000000000000000000000000001xxxx:
                 data_out = (52 + offset) % 57;
               57'b000000000000000000000000000000000000000000000000000001xxx:
                 data_out = (53 + offset) % 57;
               57'b0000000000000000000000000000000000000000000000000000001xx:
                 data_out = (54 + offset) % 57;
               57'b00000000000000000000000000000000000000000000000000000001x:
                 data_out = (55 + offset) % 57;
               57'b000000000000000000000000000000000000000000000000000000001:
                 data_out = (56 + offset) % 57;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 58)
        always@(data_in)
          begin
             case(data_in)
               58'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 58;
               58'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 58;
               58'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 58;
               58'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 58;
               58'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 58;
               58'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 58;
               58'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 58;
               58'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 58;
               58'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 58;
               58'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 58;
               58'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 58;
               58'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 58;
               58'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 58;
               58'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 58;
               58'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 58;
               58'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 58;
               58'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 58;
               58'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 58;
               58'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 58;
               58'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 58;
               58'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 58;
               58'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 58;
               58'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 58;
               58'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 58;
               58'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 58;
               58'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 58;
               58'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 58;
               58'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 58;
               58'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 58;
               58'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 58;
               58'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 58;
               58'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 58;
               58'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 58;
               58'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 58;
               58'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 58;
               58'b000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 58;
               58'b0000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (36 + offset) % 58;
               58'b00000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (37 + offset) % 58;
               58'b000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (38 + offset) % 58;
               58'b0000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (39 + offset) % 58;
               58'b00000000000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (40 + offset) % 58;
               58'b000000000000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (41 + offset) % 58;
               58'b0000000000000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (42 + offset) % 58;
               58'b00000000000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (43 + offset) % 58;
               58'b000000000000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (44 + offset) % 58;
               58'b0000000000000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (45 + offset) % 58;
               58'b00000000000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (46 + offset) % 58;
               58'b000000000000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (47 + offset) % 58;
               58'b0000000000000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (48 + offset) % 58;
               58'b00000000000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (49 + offset) % 58;
               58'b000000000000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (50 + offset) % 58;
               58'b0000000000000000000000000000000000000000000000000001xxxxxx:
                 data_out = (51 + offset) % 58;
               58'b00000000000000000000000000000000000000000000000000001xxxxx:
                 data_out = (52 + offset) % 58;
               58'b000000000000000000000000000000000000000000000000000001xxxx:
                 data_out = (53 + offset) % 58;
               58'b0000000000000000000000000000000000000000000000000000001xxx:
                 data_out = (54 + offset) % 58;
               58'b00000000000000000000000000000000000000000000000000000001xx:
                 data_out = (55 + offset) % 58;
               58'b000000000000000000000000000000000000000000000000000000001x:
                 data_out = (56 + offset) % 58;
               58'b0000000000000000000000000000000000000000000000000000000001:
                 data_out = (57 + offset) % 58;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 59)
        always@(data_in)
          begin
             case(data_in)
               59'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 59;
               59'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 59;
               59'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 59;
               59'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 59;
               59'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 59;
               59'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 59;
               59'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 59;
               59'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 59;
               59'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 59;
               59'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 59;
               59'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 59;
               59'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 59;
               59'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 59;
               59'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 59;
               59'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 59;
               59'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 59;
               59'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 59;
               59'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 59;
               59'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 59;
               59'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 59;
               59'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 59;
               59'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 59;
               59'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 59;
               59'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 59;
               59'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 59;
               59'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 59;
               59'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 59;
               59'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 59;
               59'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 59;
               59'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 59;
               59'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 59;
               59'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 59;
               59'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 59;
               59'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 59;
               59'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 59;
               59'b000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 59;
               59'b0000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (36 + offset) % 59;
               59'b00000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (37 + offset) % 59;
               59'b000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (38 + offset) % 59;
               59'b0000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (39 + offset) % 59;
               59'b00000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (40 + offset) % 59;
               59'b000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (41 + offset) % 59;
               59'b0000000000000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (42 + offset) % 59;
               59'b00000000000000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (43 + offset) % 59;
               59'b000000000000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (44 + offset) % 59;
               59'b0000000000000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (45 + offset) % 59;
               59'b00000000000000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (46 + offset) % 59;
               59'b000000000000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (47 + offset) % 59;
               59'b0000000000000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (48 + offset) % 59;
               59'b00000000000000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (49 + offset) % 59;
               59'b000000000000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (50 + offset) % 59;
               59'b0000000000000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (51 + offset) % 59;
               59'b00000000000000000000000000000000000000000000000000001xxxxxx:
                 data_out = (52 + offset) % 59;
               59'b000000000000000000000000000000000000000000000000000001xxxxx:
                 data_out = (53 + offset) % 59;
               59'b0000000000000000000000000000000000000000000000000000001xxxx:
                 data_out = (54 + offset) % 59;
               59'b00000000000000000000000000000000000000000000000000000001xxx:
                 data_out = (55 + offset) % 59;
               59'b000000000000000000000000000000000000000000000000000000001xx:
                 data_out = (56 + offset) % 59;
               59'b0000000000000000000000000000000000000000000000000000000001x:
                 data_out = (57 + offset) % 59;
               59'b00000000000000000000000000000000000000000000000000000000001:
                 data_out = (58 + offset) % 59;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 60)
        always@(data_in)
          begin
             case(data_in)
               60'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 60;
               60'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 60;
               60'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 60;
               60'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 60;
               60'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 60;
               60'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 60;
               60'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 60;
               60'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 60;
               60'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 60;
               60'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 60;
               60'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 60;
               60'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 60;
               60'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 60;
               60'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 60;
               60'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 60;
               60'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 60;
               60'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 60;
               60'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 60;
               60'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 60;
               60'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 60;
               60'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 60;
               60'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 60;
               60'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 60;
               60'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 60;
               60'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 60;
               60'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 60;
               60'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 60;
               60'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 60;
               60'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 60;
               60'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 60;
               60'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 60;
               60'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 60;
               60'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 60;
               60'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 60;
               60'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 60;
               60'b000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 60;
               60'b0000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (36 + offset) % 60;
               60'b00000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (37 + offset) % 60;
               60'b000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (38 + offset) % 60;
               60'b0000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (39 + offset) % 60;
               60'b00000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (40 + offset) % 60;
               60'b000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (41 + offset) % 60;
               60'b0000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (42 + offset) % 60;
               60'b00000000000000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (43 + offset) % 60;
               60'b000000000000000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (44 + offset) % 60;
               60'b0000000000000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (45 + offset) % 60;
               60'b00000000000000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (46 + offset) % 60;
               60'b000000000000000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (47 + offset) % 60;
               60'b0000000000000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (48 + offset) % 60;
               60'b00000000000000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (49 + offset) % 60;
               60'b000000000000000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (50 + offset) % 60;
               60'b0000000000000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (51 + offset) % 60;
               60'b00000000000000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (52 + offset) % 60;
               60'b000000000000000000000000000000000000000000000000000001xxxxxx:
                 data_out = (53 + offset) % 60;
               60'b0000000000000000000000000000000000000000000000000000001xxxxx:
                 data_out = (54 + offset) % 60;
               60'b00000000000000000000000000000000000000000000000000000001xxxx:
                 data_out = (55 + offset) % 60;
               60'b000000000000000000000000000000000000000000000000000000001xxx:
                 data_out = (56 + offset) % 60;
               60'b0000000000000000000000000000000000000000000000000000000001xx:
                 data_out = (57 + offset) % 60;
               60'b00000000000000000000000000000000000000000000000000000000001x:
                 data_out = (58 + offset) % 60;
               60'b000000000000000000000000000000000000000000000000000000000001:
                 data_out = (59 + offset) % 60;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 61)
        always@(data_in)
          begin
             case(data_in)
               61'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 61;
               61'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 61;
               61'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 61;
               61'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 61;
               61'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 61;
               61'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 61;
               61'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 61;
               61'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 61;
               61'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 61;
               61'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 61;
               61'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 61;
               61'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 61;
               61'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 61;
               61'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 61;
               61'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 61;
               61'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 61;
               61'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 61;
               61'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 61;
               61'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 61;
               61'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 61;
               61'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 61;
               61'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 61;
               61'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 61;
               61'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 61;
               61'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 61;
               61'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 61;
               61'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 61;
               61'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 61;
               61'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 61;
               61'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 61;
               61'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 61;
               61'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 61;
               61'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 61;
               61'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 61;
               61'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 61;
               61'b000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 61;
               61'b0000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (36 + offset) % 61;
               61'b00000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (37 + offset) % 61;
               61'b000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (38 + offset) % 61;
               61'b0000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (39 + offset) % 61;
               61'b00000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (40 + offset) % 61;
               61'b000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (41 + offset) % 61;
               61'b0000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (42 + offset) % 61;
               61'b00000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (43 + offset) % 61;
               61'b000000000000000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (44 + offset) % 61;
               61'b0000000000000000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (45 + offset) % 61;
               61'b00000000000000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (46 + offset) % 61;
               61'b000000000000000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (47 + offset) % 61;
               61'b0000000000000000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (48 + offset) % 61;
               61'b00000000000000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (49 + offset) % 61;
               61'b000000000000000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (50 + offset) % 61;
               61'b0000000000000000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (51 + offset) % 61;
               61'b00000000000000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (52 + offset) % 61;
               61'b000000000000000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (53 + offset) % 61;
               61'b0000000000000000000000000000000000000000000000000000001xxxxxx:
                 data_out = (54 + offset) % 61;
               61'b00000000000000000000000000000000000000000000000000000001xxxxx:
                 data_out = (55 + offset) % 61;
               61'b000000000000000000000000000000000000000000000000000000001xxxx:
                 data_out = (56 + offset) % 61;
               61'b0000000000000000000000000000000000000000000000000000000001xxx:
                 data_out = (57 + offset) % 61;
               61'b00000000000000000000000000000000000000000000000000000000001xx:
                 data_out = (58 + offset) % 61;
               61'b000000000000000000000000000000000000000000000000000000000001x:
                 data_out = (59 + offset) % 61;
               61'b0000000000000000000000000000000000000000000000000000000000001:
                 data_out = (60 + offset) % 61;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 62)
        always@(data_in)
          begin
             case(data_in)
               62'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 62;
               62'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 62;
               62'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 62;
               62'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 62;
               62'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 62;
               62'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 62;
               62'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 62;
               62'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 62;
               62'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 62;
               62'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 62;
               62'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 62;
               62'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 62;
               62'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 62;
               62'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 62;
               62'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 62;
               62'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 62;
               62'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 62;
               62'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 62;
               62'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 62;
               62'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 62;
               62'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 62;
               62'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 62;
               62'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 62;
               62'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 62;
               62'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 62;
               62'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 62;
               62'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 62;
               62'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 62;
               62'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 62;
               62'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 62;
               62'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 62;
               62'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 62;
               62'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 62;
               62'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 62;
               62'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 62;
               62'b000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 62;
               62'b0000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (36 + offset) % 62;
               62'b00000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (37 + offset) % 62;
               62'b000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (38 + offset) % 62;
               62'b0000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (39 + offset) % 62;
               62'b00000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (40 + offset) % 62;
               62'b000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (41 + offset) % 62;
               62'b0000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (42 + offset) % 62;
               62'b00000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (43 + offset) % 62;
               62'b000000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (44 + offset) % 62;
               62'b0000000000000000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (45 + offset) % 62;
               62'b00000000000000000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (46 + offset) % 62;
               62'b000000000000000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (47 + offset) % 62;
               62'b0000000000000000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (48 + offset) % 62;
               62'b00000000000000000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (49 + offset) % 62;
               62'b000000000000000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (50 + offset) % 62;
               62'b0000000000000000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (51 + offset) % 62;
               62'b00000000000000000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (52 + offset) % 62;
               62'b000000000000000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (53 + offset) % 62;
               62'b0000000000000000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (54 + offset) % 62;
               62'b00000000000000000000000000000000000000000000000000000001xxxxxx:
                 data_out = (55 + offset) % 62;
               62'b000000000000000000000000000000000000000000000000000000001xxxxx:
                 data_out = (56 + offset) % 62;
               62'b0000000000000000000000000000000000000000000000000000000001xxxx:
                 data_out = (57 + offset) % 62;
               62'b00000000000000000000000000000000000000000000000000000000001xxx:
                 data_out = (58 + offset) % 62;
               62'b000000000000000000000000000000000000000000000000000000000001xx:
                 data_out = (59 + offset) % 62;
               62'b0000000000000000000000000000000000000000000000000000000000001x:
                 data_out = (60 + offset) % 62;
               62'b00000000000000000000000000000000000000000000000000000000000001:
                 data_out = (61 + offset) % 62;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 63)
        always@(data_in)
          begin
             case(data_in)
               63'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 63;
               63'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 63;
               63'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 63;
               63'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 63;
               63'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 63;
               63'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 63;
               63'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 63;
               63'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 63;
               63'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 63;
               63'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 63;
               63'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 63;
               63'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 63;
               63'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 63;
               63'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 63;
               63'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 63;
               63'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 63;
               63'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 63;
               63'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 63;
               63'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 63;
               63'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 63;
               63'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 63;
               63'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 63;
               63'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 63;
               63'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 63;
               63'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 63;
               63'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 63;
               63'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 63;
               63'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 63;
               63'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 63;
               63'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 63;
               63'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 63;
               63'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 63;
               63'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 63;
               63'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 63;
               63'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 63;
               63'b000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 63;
               63'b0000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (36 + offset) % 63;
               63'b00000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (37 + offset) % 63;
               63'b000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (38 + offset) % 63;
               63'b0000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (39 + offset) % 63;
               63'b00000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (40 + offset) % 63;
               63'b000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (41 + offset) % 63;
               63'b0000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (42 + offset) % 63;
               63'b00000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (43 + offset) % 63;
               63'b000000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (44 + offset) % 63;
               63'b0000000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (45 + offset) % 63;
               63'b00000000000000000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (46 + offset) % 63;
               63'b000000000000000000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (47 + offset) % 63;
               63'b0000000000000000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (48 + offset) % 63;
               63'b00000000000000000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (49 + offset) % 63;
               63'b000000000000000000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (50 + offset) % 63;
               63'b0000000000000000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (51 + offset) % 63;
               63'b00000000000000000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (52 + offset) % 63;
               63'b000000000000000000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (53 + offset) % 63;
               63'b0000000000000000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (54 + offset) % 63;
               63'b00000000000000000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (55 + offset) % 63;
               63'b000000000000000000000000000000000000000000000000000000001xxxxxx:
                 data_out = (56 + offset) % 63;
               63'b0000000000000000000000000000000000000000000000000000000001xxxxx:
                 data_out = (57 + offset) % 63;
               63'b00000000000000000000000000000000000000000000000000000000001xxxx:
                 data_out = (58 + offset) % 63;
               63'b000000000000000000000000000000000000000000000000000000000001xxx:
                 data_out = (59 + offset) % 63;
               63'b0000000000000000000000000000000000000000000000000000000000001xx:
                 data_out = (60 + offset) % 63;
               63'b00000000000000000000000000000000000000000000000000000000000001x:
                 data_out = (61 + offset) % 63;
               63'b000000000000000000000000000000000000000000000000000000000000001:
                 data_out = (62 + offset) % 63;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      else if(num_ports == 64)
        always@(data_in)
          begin
             case(data_in)
               64'b1xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (0 + offset) % 64;
               64'b01xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (1 + offset) % 64;
               64'b001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (2 + offset) % 64;
               64'b0001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (3 + offset) % 64;
               64'b00001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (4 + offset) % 64;
               64'b000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (5 + offset) % 64;
               64'b0000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (6 + offset) % 64;
               64'b00000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (7 + offset) % 64;
               64'b000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (8 + offset) % 64;
               64'b0000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (9 + offset) % 64;
               64'b00000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (10 + offset) % 64;
               64'b000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (11 + offset) % 64;
               64'b0000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (12 + offset) % 64;
               64'b00000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (13 + offset) % 64;
               64'b000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (14 + offset) % 64;
               64'b0000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (15 + offset) % 64;
               64'b00000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (16 + offset) % 64;
               64'b000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (17 + offset) % 64;
               64'b0000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (18 + offset) % 64;
               64'b00000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (19 + offset) % 64;
               64'b000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (20 + offset) % 64;
               64'b0000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (21 + offset) % 64;
               64'b00000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (22 + offset) % 64;
               64'b000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (23 + offset) % 64;
               64'b0000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (24 + offset) % 64;
               64'b00000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (25 + offset) % 64;
               64'b000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (26 + offset) % 64;
               64'b0000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (27 + offset) % 64;
               64'b00000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (28 + offset) % 64;
               64'b000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (29 + offset) % 64;
               64'b0000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (30 + offset) % 64;
               64'b00000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (31 + offset) % 64;
               64'b000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (32 + offset) % 64;
               64'b0000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (33 + offset) % 64;
               64'b00000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (34 + offset) % 64;
               64'b000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (35 + offset) % 64;
               64'b0000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (36 + offset) % 64;
               64'b00000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (37 + offset) % 64;
               64'b000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (38 + offset) % 64;
               64'b0000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (39 + offset) % 64;
               64'b00000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (40 + offset) % 64;
               64'b000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxxx:
                 data_out = (41 + offset) % 64;
               64'b0000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxxx:
                 data_out = (42 + offset) % 64;
               64'b00000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxxx:
                 data_out = (43 + offset) % 64;
               64'b000000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxxx:
                 data_out = (44 + offset) % 64;
               64'b0000000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxxx:
                 data_out = (45 + offset) % 64;
               64'b00000000000000000000000000000000000000000000001xxxxxxxxxxxxxxxxx:
                 data_out = (46 + offset) % 64;
               64'b000000000000000000000000000000000000000000000001xxxxxxxxxxxxxxxx:
                 data_out = (47 + offset) % 64;
               64'b0000000000000000000000000000000000000000000000001xxxxxxxxxxxxxxx:
                 data_out = (48 + offset) % 64;
               64'b00000000000000000000000000000000000000000000000001xxxxxxxxxxxxxx:
                 data_out = (49 + offset) % 64;
               64'b000000000000000000000000000000000000000000000000001xxxxxxxxxxxxx:
                 data_out = (50 + offset) % 64;
               64'b0000000000000000000000000000000000000000000000000001xxxxxxxxxxxx:
                 data_out = (51 + offset) % 64;
               64'b00000000000000000000000000000000000000000000000000001xxxxxxxxxxx:
                 data_out = (52 + offset) % 64;
               64'b000000000000000000000000000000000000000000000000000001xxxxxxxxxx:
                 data_out = (53 + offset) % 64;
               64'b0000000000000000000000000000000000000000000000000000001xxxxxxxxx:
                 data_out = (54 + offset) % 64;
               64'b00000000000000000000000000000000000000000000000000000001xxxxxxxx:
                 data_out = (55 + offset) % 64;
               64'b000000000000000000000000000000000000000000000000000000001xxxxxxx:
                 data_out = (56 + offset) % 64;
               64'b0000000000000000000000000000000000000000000000000000000001xxxxxx:
                 data_out = (57 + offset) % 64;
               64'b00000000000000000000000000000000000000000000000000000000001xxxxx:
                 data_out = (58 + offset) % 64;
               64'b000000000000000000000000000000000000000000000000000000000001xxxx:
                 data_out = (59 + offset) % 64;
               64'b0000000000000000000000000000000000000000000000000000000000001xxx:
                 data_out = (60 + offset) % 64;
               64'b00000000000000000000000000000000000000000000000000000000000001xx:
                 data_out = (61 + offset) % 64;
               64'b000000000000000000000000000000000000000000000000000000000000001x:
                 data_out = (62 + offset) % 64;
               64'b0000000000000000000000000000000000000000000000000000000000000001:
                 data_out = (63 + offset) % 64;
               default:
                 data_out = {6{1'bx}};
             endcase
          end
      
   endgenerate
   
endmodule
