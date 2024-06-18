// This program was cloned from: https://github.com/milind7777/VerilogDocGen
// License: MIT License

module truthtable1 (
  input x3,
  input x2,
  input x1,
  output f

);

  assign f = ( ~x3 & x2 & ~x1 ) |
        ( ~x3 & x2 & x1 ) |
        ( x3 & ~x2 & x1 ) |
        ( x3 & x2 & x1 ) ;

endmodule



