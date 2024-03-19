module collector_spi
  (input wire 	     i_clk,
   input wire 	      i_rst,
   output wire 	      o_sclk,
   output wire 	      o_cs_n,
   output wire 	      o_mosi,
   input wire 	      i_miso,
   input wire [4:0]   i_wb_adr,
   input wire [31:0]  i_wb_dat,
   input wire 	      i_wb_we,
   input wire 	      i_wb_stb,
   output wire [31:0] o_wb_rdt,
   output wire 	      o_wb_ack);

   wire [7:0] 	     rdt;

   assign o_wb_rdt = {24'd0, rdt};

   simple_spi spi_top
     (
      .clk_i (i_clk),
      .rst_i (i_rst),
      .adr_i (i_wb_adr[4:2]),
      .dat_i (i_wb_dat[7:0]),
      .we_i  (i_wb_we),
      .cyc_i (i_wb_stb),
      .stb_i (i_wb_stb),
      .dat_o (rdt),
      .ack_o (o_wb_ack),
      .inta_o(),

      .sck_o (o_sclk),
      .ss_o  (o_cs_n),
      .mosi_o(o_mosi),
      .miso_i(i_miso));

endmodule
