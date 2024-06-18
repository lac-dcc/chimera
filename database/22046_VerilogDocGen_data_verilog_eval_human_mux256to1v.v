// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module mux256to1v (
  input [1023:0] in,
  input [7:0] sel,
  output [3:0] out

);

  assign out = {in[sel*4+3], in[sel*4+2], in[sel*4+1], in[sel*4+0]};

endmodule



