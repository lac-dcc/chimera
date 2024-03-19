`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Laboratory 1
// Module - mux_2to1_32bit.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module mux_2to1_32bit(out, inA, inB, sel);

    output  [31:0] out;
    
    input   [31:0] inA;
    input   [31:0] inB;
    input          sel;
	reg [31:0]out;
    /* Fill in the implementation here ... */ 
	 always@(inA,inB,sel)
	 begin
    if (sel == 0)
	 begin
	   out <= inA;
	 end
	 else 
	 begin
      out <= inB;
	 end
	 end
	 

endmodule
