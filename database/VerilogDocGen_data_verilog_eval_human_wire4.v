// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module wire4 (
  input a,
  input b,
  input c,
  output w,
  output x,
  output y,
  output z
);

  assign {w,x,y,z} = {a,b,b,c};

endmodule



