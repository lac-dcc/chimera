// This program was cloned from: https://github.com/TripRichert/hdl_rosetta_stone
// License: MIT License

/**
 * @file
 * @author Trip Richert
 * block ram meant to match xilinx UG901 simple_dual_one_clock block ram
 **/

/**
 * @interface blockram dual port random access memory, meant to use block ram
 **/
module blockram

  #(parameter DATA_WIDTH=32,
    parameter ADDR_WIDTH=10)
    (
     input 			   clk,
     input [(DATA_WIDTH-1):0] 	   dia,   //! data in
     input [(ADDR_WIDTH-1):0] 	   addra, //! write address
     input [(ADDR_WIDTH-1):0] 	   addrb, //! read address
     input                         ena,   //! write enable (also raise wea)
     input 			   wea,   //! write enable (also raise ena)
     input 			   enb,   //! read enable
     output reg [(DATA_WIDTH-1):0] dob    //! data output
     );

   (* ram_style = "block" *) reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
   
   always @ (posedge clk) begin     
     if (ena) begin 
	if (wea) begin
	   ram[addra] <= dia;
	end
     end
   end
  
   always @ (posedge clk) begin
      if (enb) begin
	 dob <= ram[addrb];
      end
   end

endmodule

// Copyright 2021 Trip Richert

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), 
// to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, 
// and/or sell copies of the Software, and to permit persons to whom the 
// Software is furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in 
// all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
// THE SOFTWARE.
