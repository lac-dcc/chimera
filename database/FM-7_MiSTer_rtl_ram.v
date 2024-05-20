// This program was cloned from: https://github.com/pcornier/FM-7_MiSTer
// License: GNU General Public License v2.0


module ram
#(
  parameter addr_width=12,
  parameter data_width=8
)
(
  input clk,
  input [addr_width-1:0] addr,
  input [data_width-1:0] din,
  output [data_width-1:0] q,
  input rd_n,
  input wr_n,
  input ce_n
);

reg [data_width-1:0] data;
reg [data_width-1:0] mem[(1<<addr_width)-1:0];

assign q = ~ce_n ? data : 0;

always @(posedge clk) begin

  if (~rd_n) data <= mem[addr];
  if (~wr_n & ~ce_n) mem[addr] <= din;

end


endmodule
