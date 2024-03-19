module observer
  (input wire  i_clk,
   input wire  i_rst,
   input wire  i_user_btn,
   output wire o_sclk,
   output wire o_cs_n,
   output wire o_mosi,
   input wire  i_miso,
   output wire o_uart_tx);

   parameter memfile_emitter = "emitter.hex";

   wire [7:0]  tdata;
   wire        tlast;
   wire        tvalid;
   wire        tready;

   junctions junctions
     (.i_clk     (i_clk),
      .i_rst     (i_rst),
      .i_user_btn_gpio    (i_user_btn),
      .o_g_sen_sclk    (o_sclk),
      .o_g_sen_cs_n    (o_cs_n),
      .o_g_sen_mosi    (o_mosi),
      .i_g_sen_miso    (i_miso),
      .o_tdata   (tdata),
      .o_tlast   (tlast),
      .o_tvalid  (tvalid),
      .i_tready  (tready));

   emitter #(.memfile (memfile_emitter)) emitter
     (.i_clk     (i_clk),
      .i_rst     (i_rst),
      .i_tdata   (tdata),
      .i_tlast   (tlast),
      .i_tvalid  (tvalid),
      .o_tready  (tready),
      .o_uart_tx (o_uart_tx));

endmodule
