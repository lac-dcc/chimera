// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

module aeqb (   
    input   f3,
    input   f2,
    input   f1,
    input   f0,
    output  aeqb);

assign aeqb = (f3 & f2 & f1 & f0);

endmodule