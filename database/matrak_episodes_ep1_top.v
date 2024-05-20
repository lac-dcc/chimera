// This program was cloned from: https://github.com/necaticakaci/matrak
// License: MIT License

// Matrak M10 RV32I RISC-V Processor
// Gülpare II Architechture 2023
// Top Module

module top (
   input             clk_i,
   input             rst_i
);

   wire [31:0] inst;
   wire [31:0] inst_addr;

   matrak mt1 (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .inst_i(inst),
      .inst_addr_o(inst_addr)
   );

   memory me1 (
      .clk_i(clk_i),
      .wen_i(1'b0),
      .addr_i(inst_addr),
      .data_i(32'b0),
      .data_o(inst)
   );

endmodule
