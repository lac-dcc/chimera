// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 4:1 MULTIPLEXER BEHAVIORAL
************************************************/

module mux_2_1_df(Y,I,S);

	input [3:0]I;
	input [1:0]S;
	output reg Y;

	always@(*)
	case(S)
		2'd0: Y=I[0];
		2'd1: Y=I[1];
		2'd2: Y=I[2];
		2'd3: Y=I[3];
		default:$display("error");
	endcase

endmodule