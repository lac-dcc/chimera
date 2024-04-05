//
// spiloop-tb.v
//
// Tests the vspi loopback (spiloop) module
//
// (c) Michael Lyons, 2012
//

`include "vspi-defines.vh"

module spiloop_tb;
  reg  SysClk;
  wire spi_miso;
  reg  spi_mosi;
  reg  spi_clk;
  reg  spi_ss;

`include "vspi-tasks.vh"

spiloop dutSpiloop(
  .Reset(1'b0),
  .SysClk(SysClk),
  .spi_miso(spi_miso),
  .spi_mosi(spi_mosi),
  .spi_clk(spi_clk),
  .spi_ss(spi_ss)
);

always begin
  #5 SysClk = !SysClk;
end

reg [7:0] recvByte;
reg [31:0] recvWord;
integer i;
initial begin
  SysClk = 1'b0;
  spi_mosi = 1'b0;
  spi_clk = 1'b0;
  spi_ss = 1'b1;
  #100

  // Write 0xNNNNNNNN to RegN and read back
  $display("Testing each register");
  for (i = 0; i < 16; i = i + 1) begin
    spiWriteReg(i, {8{i[3:0]}});
    spiReadReg(i, recvWord);
    `expect_h("SPI.r0", {8{i[3:0]}}, recvWord);
  end
  $display("");

  // Write over entire memory, read it back.
  $display("Testing memory");
  spiWriteMemStart();
  for (i = 0; i < 4096; i = i + 1) begin
    spiWriteMemNextByte({i[3:0], i[7:4]});
  end
  spiWriteMemStop();

  spiReadMemStart();
  for (i = 0; i < 4096; i = i + 1) begin
    spiReadMemNextByte(recvWord[7:0]);
    `expect_h("SPI.mem[]", {i[3:0], i[7:4]}, recvWord[7:0]);
  end
  spiReadMemStop();
  $display("\nTestbench passed without error!\n");
  $finish;
end

endmodule

