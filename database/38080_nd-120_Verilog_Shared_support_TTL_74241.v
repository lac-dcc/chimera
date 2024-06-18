// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Component : TTL_74241                                                    **
 ** buffers with TTL-compatible CMOS inputs and 3-state outputs              **
 ** https://www.ti.com/product/SN74ABT241A                                   **
 *****************************************************************************/

module TTL_74241
(  
   input  [3:0] A1,
   output [3:0] Y1,
   input        G1_n,


   input  [3:0] A2,
   output [3:0] Y2,
   input        G2
);
 
   assign Y1[3:0] = G1_n ? 4'b0     : A1[3:0];
   assign Y2[3:0] = G2   ? A2[3:0]  : 4'b0;

endmodule
