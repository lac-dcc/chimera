// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

`include "../full_adder/full_adder.v"

module carry_lookahead_adder #(
  parameter WIDTH = 8
)
  (
  input cin,
   input [WIDTH-1:0] i_add1,
   input [WIDTH-1:0] i_add2,
   output [WIDTH-1:0]  o_result,
   output cout
   );
     
  wire [WIDTH:0]     w_C;
  wire [WIDTH-1:0]   w_G, w_P, w_SUM;
 
  // Create the Full Adders
  genvar             ii;
  generate
    for (ii=0; ii<WIDTH; ii=ii+1) 
      begin
        full_adder full_adder_inst
            ( 
              .bit1(i_add1[ii]),
              .bit2(i_add2[ii]),
              .cin(w_C[ii]),
              .sum(w_SUM[ii]),
              .cout()
              );
      end
  endgenerate
 
  // Create the Generate (G) Terms:  Gi=Ai*Bi
  // Create the Propagate Terms: Pi=Ai+Bi
  // Create the Carry Terms:
  genvar             jj;
  generate
    for (jj=0; jj<WIDTH; jj=jj+1) 
      begin
        assign w_G[jj]   = i_add1[jj] & i_add2[jj];
        assign w_P[jj]   = i_add1[jj] | i_add2[jj];
        assign w_C[jj+1] = w_G[jj] | (w_P[jj] & w_C[jj]);
      end
  endgenerate
   
  assign w_C[0] = cin; // carry in on first adder
 
  assign o_result = w_SUM;   // Verilog Concatenation
  assign cout = w_C[WIDTH];
 
endmodule // carry_lookahead_adder
