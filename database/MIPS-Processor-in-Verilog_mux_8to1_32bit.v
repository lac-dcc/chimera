`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Laboratory 1
// Module - mux_2to1_32bit.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module mux_8to1_32bit(out, inA, inB, inC, inD,inE,inF,inG,inH, sel);

    output  [31:0] out;
    
    input   [31:0] inA,inB, inC, inD,inE,inF,inG,inH;
    input   [2:0]  sel;
	reg [31:0]out;
    /* Fill in the implementation here ... */ 
	 always@(inA,inB,inC, inD,inE,inF,inG,inH,sel)
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
			4:
				out <= inE;
			5:
				out <= inF;
			6:
				out <= inG;
			7:
				out <= inH;
		endcase
	 end
	 

endmodule
