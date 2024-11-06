// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module ece241_2014_q3 (
  input c,
  input d,
  output [3:0] mux_in

);

  assign mux_in[0] = c | d;
  assign mux_in[1] = 0;
  assign mux_in[2] = ~d;
  assign mux_in[3] = c&d;

endmodule



