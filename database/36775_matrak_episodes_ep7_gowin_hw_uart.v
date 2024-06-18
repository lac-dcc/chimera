// This program was cloned from: https://github.com/necaticakaci/matrak
// License: MIT License

// Matrak M10 RV32I RISC-V Processor
// Gülpare II Architechture 2023
// UART TX Module

module uart (
   input                clk_i,
   input                rst_i,
   input                sel_i,      // Seçim sinyali
   input                wen_i,      // Yazma yetkilendirme
   input [31:0]         addr_i,     // Adres girişi, işlemciden geliyor.
   input [31:0]         data_i,     // Veri girişi, işlemciden geliyor.
   output [31:0]        data_o,     // Veri çıkışı, işlemciye gidiyor.
   output               uart_tx_o   // UART TX bağlantısı
);

   localparam UART_TRANSMIT_REG  = 4'h0;
   localparam UART_STATUS_REG    = 4'h4;

   wire done;

   // Kaydedici adresi çözümleniyor.
   wire tx_sel       = (UART_TRANSMIT_REG == addr_i[3:0]);
   wire status_sel   = (UART_STATUS_REG == addr_i[3:0]);

   // Gönderilecek veri yazılıyor. (gönderimi başlat)
   wire tx_en     = sel_i & wen_i & tx_sel;

   // Durum okunuyor.
   wire status_en = sel_i & status_sel;

   assign data_o  = status_en ? {30'b0, done} : 31'b0;

   transmitter t1 (
      .clk_i(clk_i),
      .rst_i(rst_i),
      .tx_data_i(data_i[7:0]),
      .tx_en_i(tx_en),
      .tx_done_o(done),
      .tx_o(uart_tx_o)
   );

endmodule

module transmitter (
   input                clk_i,
   input                rst_i,
   input [7:0]          tx_data_i,
   input                tx_en_i,
   output reg           tx_done_o,
   output reg           tx_o
);

   localparam IDLE      = 2'b00;
   localparam START     = 2'b01;
   localparam TRANSMIT  = 2'b10;
   localparam DONE      = 2'b11;

   localparam CLKFREQ   = 18_000_000;
   localparam BAUD_RATE = 115200;

   localparam BAUD_DIV  = CLKFREQ/BAUD_RATE;

   reg [15:0] t_counter;
   reg [2:0] b_counter;

   reg [7:0] shr;

   reg [1:0] state;

   always @(posedge clk_i, posedge rst_i) begin
      if (rst_i) begin
         state       <= IDLE;
         t_counter   <= 0;
         b_counter   <= 0;
         shr         <= 8'b0;
         tx_done_o   <= 1'b1;
         tx_o        <= 1'b1;
      end else begin
         case (state)
            IDLE : begin
               b_counter   <= 0;
               tx_done_o   <= 1'b1;
               tx_o        <= 1'b1;
               if (tx_en_i) begin
                  tx_o     <= 1'b0;
                  shr      <= tx_data_i;
                  state    <= START;
               end else begin
                  state    <= IDLE;
               end
            end
            START : begin
               tx_done_o   <= 1'b0;
               if (t_counter == BAUD_DIV-1) begin
                  t_counter   <= 0;
                  shr[7]      <= shr[0];
                  shr[6:0]    <= shr[7:1];
                  tx_o        <= shr[0];
                  state       <= TRANSMIT;
               end else begin
                  t_counter   <= t_counter + 1;
               end
            end
            TRANSMIT : begin
               tx_done_o   <= 1'b0;
               if (b_counter == 7) begin
                  if (t_counter == BAUD_DIV-1) begin
                     t_counter   <= 0;
                     b_counter   <= 0;
                     tx_o        <= 1'b1;
                     state       <= DONE;
                  end else begin
                     t_counter   <= t_counter + 1;
                  end
               end else begin
                  if (t_counter == BAUD_DIV-1) begin
                     t_counter   <= 0;
                     b_counter   <= b_counter + 1;
                     shr[7]      <= shr[0];
                     shr[6:0]    <= shr[7:1];
                     tx_o        <= shr[0];
                  end else begin
                     t_counter   <= t_counter + 1;
                  end
               end
            end
            DONE : begin
               if (t_counter == BAUD_DIV-1) begin
                  t_counter   <= 0;
                  tx_done_o   <= 1'b1;
                  state       <= IDLE;
               end else begin
                  t_counter   <= t_counter + 1;
               end
            end
            default : state <= IDLE;
         endcase
      end
   end

endmodule
