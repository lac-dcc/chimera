// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module mux2x1(a,b,sel,y);
input a,b,sel;
output y;

assign y = (~sel & a) | (sel & b);
endmodule
