// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

// TODO: seems not to clock in all the data - some oddities with the clock, think faster clock for this one.

module fifo#(parameter RAM_SIZE = 256, parameter ADDRESS_WIDTH = 8, parameter WORD_SIZE = 8)(
  output wire [WORD_SIZE-1:0] q,
  input wire [WORD_SIZE-1:0] d,
  input wire clk,
  input wire write,
  input wire read,
  input wire reset,
  output wire empty,
  output wire full,
  output wire lastbyte);

  reg[WORD_SIZE-1:0] mem [0:RAM_SIZE-1] /* synthesis ramstyle = "M144K" */;
  reg[ADDRESS_WIDTH-1:0] raddr = 0;
  reg[ADDRESS_WIDTH-1:0] raddr_l = 0;
  reg[ADDRESS_WIDTH-1:0] waddr = 0;
  reg[ADDRESS_WIDTH:0] size = 0;


  reg prev_write = 1'b0;
  reg prev_read = 1'b0;
  always @(posedge clk) begin
    prev_write <= write;
    prev_read <= read;
    if (prev_write && !write && size != RAM_SIZE) begin
      mem[waddr] <= d;
      waddr <= waddr + 1;
      size <= size + 1;
    end
    else if (prev_read && !read && size != 0) begin
      raddr <= raddr + 1;
      size <= size - 1;
    end
    else if (reset) begin
      raddr <= 1'b0;
      waddr <= 1'b0;
      size <= 1'b0;
    end
  end

  // assign empty = raddr == waddr;
  assign empty = size == 0;
  assign lastbyte = size == 1;
  assign q = mem[raddr];
  assign full = size == RAM_SIZE;
endmodule
