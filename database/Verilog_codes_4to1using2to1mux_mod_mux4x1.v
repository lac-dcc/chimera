// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module mux4x1(input j, input k, input l, input m, input [1:0] sel, output y);
  wire w1, w2;
  mux2x1 m1(.a(j), .b(k), .s(sel[0]), .y(w1));
  mux2x1 m2(.a(l), .b(m), .s(sel[0]), .y(w2));
  mux2x1 m3(.a(w1), .b(w2), .s(sel[1]), .y(y));
endmodule
