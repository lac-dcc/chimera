`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Laboratory 1
// Module - mux_2to1_32bit.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module mux_4to1_5bit(out, inA, inB, inC, inD, sel);

    output  [4:0] out;
    
    input   [4:0] inA,inB, inC, inD;
    input   [1:0]  sel;
	reg [4:0]out;
    /* Fill in the implementation here ... */ 
	 always@(inA,inB,inC, inD,sel)
	 begin
		case (sel) 
			0:
				out <= inA;
			1:
				out <= inB;
			2:
				out <= inC;
			3:
				out <= inD;
		endcase
	 end
	 

endmodule
