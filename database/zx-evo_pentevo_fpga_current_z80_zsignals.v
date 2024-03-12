
// Decoding and strobing of z80 signals

`include "tune.v"

module zsignals
(
  // clocks
  input wire clk,
  input wire zpos,

  // z80 interface input
  input wire rst_n,
  input wire iorq_n,
  input wire mreq_n,
  input wire m1_n,
  input wire rfsh_n,
  input wire rd_n,
  input wire wr_n,

  // Z80 signals
  output wire rst,
  output wire m1,
  output wire rfsh,
  output wire rd,
  output wire wr,
  output wire iorq,
  output wire mreq,
  output wire rdwr,
  output wire iord,
  output wire iowr,
  output wire iordwr,
  output wire memrd,
  output wire memwr,
  output wire memrw,
  output wire opfetch,
  output wire intack,

  // Z80 signals strobes, at fclk
  output wire iorq_s,
  output wire mreq_s,
  output wire iord_s,
  output wire iowr_s,
  output wire iordwr_s,
  output wire memrd_s,
  output wire memwr_s,
  output wire memrw_s,
  output wire opfetch_s
);

  reg [1:0] iorq_r = 0, mreq_r = 0;

  // invertors
  assign rst = !rst_n;
  assign m1 = !m1_n;
  assign rfsh = !rfsh_n;
  assign rd = !rd_n;
  assign wr = !wr_n;

  // requests
  assign iorq = !iorq_n && m1_n;       // this is masked by ~M1 to avoid port decoding on INT ack
  assign mreq = !mreq_n && rfsh_n;     // this is masked by ~RFSH to ignore refresh cycles as memory requests

  // combined
  assign rdwr = rd || wr;
  assign iord = iorq && rd;
  assign iowr = iorq && wr;
  assign iordwr = iorq && rdwr;
  assign memrd = mreq && rd;
  assign memwr = mreq && !rd;
  assign memrw = mreq && rdwr;
  assign opfetch = memrd && m1;
  assign intack = !iorq_n && m1;    // NOT masked by M1

  // strobed
  assign iorq_s = iorq_r[0] && !iorq_r[1];
  assign mreq_s = mreq_r[0] && !mreq_r[1];
  assign iord_s = iorq_s && rd;
  assign iowr_s = iorq_s && wr;
  assign iordwr_s = iorq_s && rdwr;
  assign memrd_s = mreq_s && rd;
  assign memwr_s = mreq_s && !rd;
  assign memrw_s = mreq_s && rdwr;
  assign opfetch_s = memrd_s && m1;

// latch inputs on FPGA clock
  always @(posedge clk) if (zpos)
  begin
    iorq_r[0] <= iorq;
    mreq_r[0] <= mreq;
  end

  always @(posedge clk)
  begin
    iorq_r[1] <= iorq_r[0];
    mreq_r[1] <= mreq_r[0];
  end

endmodule
