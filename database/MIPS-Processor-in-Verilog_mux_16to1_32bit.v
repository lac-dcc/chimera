`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// Laboratory 1
// Module - mux_2to1_32bit.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module mux_16to1_32bit(out, in0, in1, in2, in3,in4,in5,in6,in7,in8, in9, in10, in11,in12,in13,in14,in15, sel);

    output  [31:0] out;
    
    input   [31:0] in0, in1, in2, in3,in4,in5,in6,in7,in8, in9, in10, in11,in12,in13,in14,in15;
    input   [3:0]  sel;
	reg [31:0]out;
    /* Fill in the implementation here ... */ 
	 always@(in0, in1, in2, in3,in4,in5,in6,in7,in8, in9, in10, in11,in12,in13,in14,in15,sel)
	 begin
		case (sel) 
			0:
				out <= in0;
			1:
				out <= in1;
			2:
				out <= in2;
			3:
				out <= in3;
			4:
				out <= in4;
			5:
				out <= in5;
			6:
				out <= in6;
			7:
				out <= in7;
			8:
				out <= in8;
			9:
				out <= in9;
			10:
				out <= in10;
			11:
				out <= in11;
			12:
				out <= in12;
			13:
				out <= in13;
			14:
				out <= in14;
			15:
				out <= in15;
		endcase
	 end
	 

endmodule
