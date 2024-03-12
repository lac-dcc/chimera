
// This module maps z80 memory accesses into FPGA RAM and ports

`include "tune.v"

module zmaps
(
  // Z80 controls
  input  wire        clk,
  input  wire        memwr_s,
  input  wire [15:0] a,
  input  wire [7:0]  d,

  // config data
  input  wire [4:0]  fmaddr,

  // FPRAM data
  output wire [15:0] zmd,
  output wire [7:0]  zma,

  // DMA
  input  wire [15:0] dma_data,
  input  wire [7:0]  dma_wraddr,
  input  wire        dma_cram_we,
  input  wire        dma_sfile_we,

  // write strobes
  output wire        cram_we,
  output wire        sfile_we,
  output wire        regs_we
);

  // addresses of files withing zmaps
  localparam CRAM  = 3'b000;
  localparam SFIL  = 3'b001;
  localparam REGS  = 4'b0100;

  // DMA
  wire dma_req = dma_cram_we || dma_sfile_we;

  // control signals
  wire hit = (a[15:12] == fmaddr[3:0]) && fmaddr[4] && memwr_s;
  wire cram_hit = (a[11:9] == CRAM) && hit;
  wire sfile_hit = (a[11:9] == SFIL) && hit;

  // write enables
  wire lower_byte_we = (cram_hit || sfile_hit) && !a[0];
  assign cram_we = dma_req ? dma_cram_we : cram_hit && a[0];
  assign sfile_we = dma_req ? dma_sfile_we : sfile_hit && a[0];
  assign regs_we = (a[11:8] == REGS) && hit;

  // LSB fetching
  reg [7:0] lower_byte;

  assign zma = dma_req ? dma_wraddr : a[8:1];
  assign zmd = dma_req ? dma_data : {d, lower_byte};

  always @(posedge clk)
    if (lower_byte_we)
      lower_byte <= d;

endmodule
