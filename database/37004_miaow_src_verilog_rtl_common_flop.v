// This program was cloned from: https://github.com/VerticalResearchGroup/miaow
// License: BSD 3-Clause "New" or "Revised" License

module flop (q, d, clk);

   output         q;
   input          d;
   input          clk;
   reg            state;

   assign q = state;

   always @(posedge clk)
   begin
      state <= d;
   end

`ifdef dump_flops
   always @(posedge gpu_tb.rst)
   begin
      if ($test$plusargs("dump_flops"))
      begin
         $display("%m.state");
      end
   end
`endif
endmodule
