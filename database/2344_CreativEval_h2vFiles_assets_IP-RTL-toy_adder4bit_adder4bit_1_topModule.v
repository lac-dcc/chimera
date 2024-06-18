// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License


// Dataflow description of 4-bit adder
// Verilog 2005 module port syntax  
module top ( 
  output [3:0] Sum, 
  output C_out, 
  input [3: 0] A, B, 
  input C_in
);

  assign {C_out, Sum} = A + B + C_in;
endmodule





  

