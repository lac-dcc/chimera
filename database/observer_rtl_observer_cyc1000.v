`default_nettype none
module observer_cyc1000
(
 input wire  i_clk,
 input wire  i_user_btn,
 output wire spi_g_sen_sclk,
 output wire spi_g_sen_cs_n,
 output wire spi_g_sen_mosi,
 input wire  spi_g_sen_miso,
 output wire q,
 output wire o_uart_tx);

   wire      wb_clk;
   wire      wb_rst;

   assign o_uart_tx = q;

   cyc1000_clock_gen clock_gen
     (.i_clk (i_clk),
      .o_clk (wb_clk),
      .o_rst (wb_rst));

   observer observer
     (.i_clk (wb_clk),
      .i_rst (wb_rst),
      .i_user_btn (i_user_btn),
      .o_sclk   (spi_g_sen_sclk),
      .o_cs_n   (spi_g_sen_cs_n),
      .o_mosi   (spi_g_sen_mosi),
      .i_miso   (spi_g_sen_miso),
      .o_uart_tx  (q));

endmodule
