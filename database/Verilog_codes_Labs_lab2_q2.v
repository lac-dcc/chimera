// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module q2 (input a, input b, input c, output result);
assign result = (~a & c) | (~b & c) | ~a;
endmodule
