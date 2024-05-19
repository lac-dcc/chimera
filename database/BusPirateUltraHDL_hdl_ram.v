// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

`ifndef __RAM__
`define __RAM__
module ram (
  din,
  write_en,
  waddr,
  wclk,
  raddr,
  rclk,
  dout
  );//512x8

parameter DEPTH = 256;
parameter WIDTH = 16;
localparam integer ABITS = $clog2(DEPTH); //256=8
input [ABITS-1:0] waddr, raddr;
input [WIDTH-1:0] din;
input write_en, wclk, rclk;
output reg [WIDTH-1:0] dout;
reg [WIDTH-1:0] mem [DEPTH-1:0];

reg [ABITS-1:0] in_pos = 0;
reg [ABITS-1:0] out_pos = 0;

reg [WIDTH-1:0] memory [0:DEPTH-1];

wire [ABITS-1:0] next_in_pos = (in_pos == DEPTH-1) ? 0 : in_pos + 1;
wire [ABITS-1:0] next_next_in_pos = (next_in_pos == DEPTH-1) ? 0 : next_in_pos + 1;

wire [ABITS-1:0] next_out_pos = (out_pos == DEPTH-1) ? 0 : out_pos + 1;
reg [WIDTH-1:0] out_data_d = 0;


always @(posedge wclk) // Write memory.
  begin
  if (write_en)
    mem[waddr] <= din; // Using write address bus.
  end

always @(posedge rclk) // Read memory.
  begin
    dout <= mem[raddr]; // Using read address bus.
  end

endmodule
`endif
