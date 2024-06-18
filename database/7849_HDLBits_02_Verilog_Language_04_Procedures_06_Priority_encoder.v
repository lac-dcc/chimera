// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
	    always@(*) begin  // This is a combinational circuit
            case (in)
      0 : pos = 0;
      1 : pos = 0;
      2 : pos = 1;
      3 : pos = 0;
      4 : pos = 2;
      5 : pos = 0;
      6 : pos = 1;
      7 : pos = 0;
      8 : pos = 3;
      9 : pos = 0;
      10: pos = 1;
      11: pos = 0;
      12: pos = 2;
      13: pos = 0;
      14: pos = 1;
      15: pos = 0;
      default : pos = 0;
    endcase
    end
	
endmodule