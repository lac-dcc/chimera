// This program was cloned from: https://github.com/necaticakaci/matrak
// License: MIT License

// Matrak M10 RV32I RISC-V Processor
// Gülpare II Architechture 2023
// Top Module

module top (
   input             clk_i,
   input             rst_i
);

   // İşlemci bağlantıları
   wire stall;
   wire wen;
   wire ren;
   wire [3:0] stb;
   wire [31:0] inst_addr;
   wire [31:0] data_addr;
   wire [31:0] wdata;

   matrak mt1 (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .stall_i(stall),
      .inst_i(mem_rdata),
      .data_i(mem_rdata),
      .wen_o(wen),
      .ren_o(ren),
      .stb_o(stb),
      .inst_addr_o(inst_addr),
      .data_addr_o(data_addr),
      .data_o(wdata)
   );

   // Bellek bağlantıları
   wire [31:0] mem_addr;
   wire [31:0] mem_rdata;

   memory me1 (
      .clk_i(clk_i),
      .wen_i(wen),
      .stb_i(stb),
      .addr_i(mem_addr),
      .data_i(wdata),
      .data_o(mem_rdata)
   );

   // Load Store isteği kontrol ediliyor.
   wire loadstore_request = wen | ren;

   // Belleğe aktarılacak adres seçiliyor.
   assign mem_addr   = loadstore_request ? data_addr : inst_addr;

   // Bellek meşgulse işlemciyi durdur.
   assign stall      = loadstore_request;

endmodule
