// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module vector0(
  input [2:0] vec,
  output [2:0] outv,
  output o2,
  output o1,
  output o0

);

  assign outv = vec;
  assign {o2, o1, o0} = vec;

endmodule



