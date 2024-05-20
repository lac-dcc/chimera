// This program was cloned from: https://github.com/necaticakaci/matrak
// License: MIT License

// Matrak M10 RV32I RISC-V Processor
// Gülpare II Architechture 2023
// Main Memory Module

module memory (
   input          clk_i,
   input          wen_i,   // Yazma yetkilendirme girişi
   input [3:0]    stb_i,   // Bayt seçim girişi
   input [31:0]   addr_i,  // Adres girişi
   input [31:0]   data_i,  // Yazılacak veri
   input [31:0]   data_o   // Okunan veri
);

   // 512x32 bit = 16384 bit = 2048 bayt = 2 kibibayt (2 KiB)
   reg [31:0] mem [511:0];

   // Programı belleğe yükle
   initial begin
      $readmemh("program.mem", mem);
   end

   // Asenkron okuma
   assign data_o = mem[addr_i[31:2]];

   // Senkron yazma
   always @(posedge clk_i) begin
      if (wen_i) begin
         if (stb_i[0]) mem[addr_i[31:2]][0+:8]  <= data_i[0+:8];
         if (stb_i[1]) mem[addr_i[31:2]][8+:8]  <= data_i[8+:8];
         if (stb_i[2]) mem[addr_i[31:2]][16+:8] <= data_i[16+:8];
         if (stb_i[3]) mem[addr_i[31:2]][24+:8] <= data_i[24+:8];
      end
   end

endmodule
