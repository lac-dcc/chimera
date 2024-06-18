// This program was cloned from: https://github.com/necaticakaci/matrak
// License: MIT License

// Matrak M10 RV32I RISC-V Processor
// Gülpare II Architechture 2023
// GPIO Output Module

module gpio (
   input                clk_i,
   input                rst_i,
   input                sel_i,   // Seçim sinyali
   input                wen_i,   // Yazma yetkilendirme
   input [31:0]         data_i,  // Veri girişi, işlemciden geliyor.
   output [31:0]        data_o,  // Veri çıkışı, işlemciye gidiyor.
   output reg [7:0]     gpio_o   // GPIO çıkış pinleri
);

   // Çevrebirim seçilmişse ve yazma etkin değilse (okuma etkin) çıkış kaydedicisinin değerini işlemciye gönder.
   assign data_o = (sel_i & !wen_i) ? {24'b0, gpio_o} : 32'b0;

   always @(posedge clk_i, posedge rst_i) begin
      if (rst_i) begin // Çıkışlar sıfırlanıyor.
         gpio_o <= 8'b0;
      end else begin
         // Çevrebirim seçilmişse ve yazma etkinse işlemciden gelen değeri çıkış kaydedicisine aktar.
         if (sel_i & wen_i) begin
            gpio_o <= data_i[7:0];
         end
      end
   end

endmodule
