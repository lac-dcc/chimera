// This program was cloned from: https://github.com/JeredGong/codsinglecyclecpu
// License: Apache License 2.0

module PC( clk, rstn, NPC, PC );

  input              clk;
  input             rstn;
  input       [31:0] NPC;
  output reg  [31:0] PC;

   always @(posedge clk, posedge rstn)
    if (rstn) 
      PC <= 32'h0000_0000;
    else
      PC <= NPC;
      
endmodule