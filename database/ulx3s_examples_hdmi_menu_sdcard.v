
module sdcard
(
  input resetn,
  input clk,
  input iomem_valid,
  output reg iomem_ready,
  input [3:0]  iomem_wstrb,
  input [31:0] iomem_addr,
  input [31:0] iomem_wdata,
  output reg [31:0] iomem_rdata,
  inout SD_MOSI,
  inout SD_MISO,
  inout SD_SCK,
  inout SD_CS);

  reg spi_wr, spi_rd;
  reg [31:0] spi_rdata;
  reg spi_ready;
  spi_master #(.CLOCK_FREQ_HZ(25000000), .CS_LENGTH(1)) sd (
      .clk(clk),
      .resetn(resetn),
      .ctrl_wr(spi_wr),
      .ctrl_rd(spi_rd),
      .ctrl_addr(iomem_addr[7:0]),
      .ctrl_wdat(iomem_wdata),
      .ctrl_rdat(spi_rdata),
      .ctrl_done(spi_ready),
      .mosi(SD_MOSI),
      .miso(SD_MISO),
      .sclk(SD_SCK),
      .CS(SD_CS));


  always @(posedge clk) begin
    spi_wr <= 0;
    spi_rd <= 0;
    iomem_ready <= 0;
    if (iomem_valid && !iomem_ready) begin
         iomem_ready <= spi_ready;
         iomem_rdata <= spi_rdata;
         spi_wr <= spi_ready ? 0 : |iomem_wstrb;
         spi_rd <= !iomem_wstrb && !spi_ready;
    end
  end

endmodule
