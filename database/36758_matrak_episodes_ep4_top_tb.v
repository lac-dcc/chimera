// This program was cloned from: https://github.com/necaticakaci/matrak
// License: MIT License

// Matrak M10 RV32I RISC-V Processor
// Gülpare II Architechture 2023
// Top Module Testbench

module top_tb ();

   reg tb_clk_i;
   reg tb_rst_i;

   top t1 (
      .clk_i(tb_clk_i),
      .rst_i(tb_rst_i)
   );

   initial begin
      tb_clk_i = 1'b0;
      tb_rst_i = 1'b0;
      #1 tb_rst_i = 1'b1;
      #1 tb_rst_i = 1'b0;
      forever begin
         #1 tb_clk_i = ~tb_clk_i;
      end
   end

endmodule
