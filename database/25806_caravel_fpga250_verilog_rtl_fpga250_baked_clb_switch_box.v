// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module baked_clb_switch_box #(
  parameter WS = 4,
  parameter WD = 8
)(
  // Common
  input wire clk,
  input wire rst,

  // Confiuration Signals:

  input wire cen,

  // Config set input (from tile module)
  input wire set_in,

  // Config shift input (from tile module)
  input wire shift_in,
  // Config shift output (to tile module)
  output wire shift_out,

  // Single Wires
  inout [WS-1:0] north_single, east_single, south_single, west_single,
  // Double Wires
  inout [WD-1:0] north_double, east_double, south_double, west_double
);

localparam SWITCHBOX_CONF_WIDTH = (WS + WD/2)*6;

wire [SWITCHBOX_CONF_WIDTH-1:0] switch_conf_bus;

reg [SWITCHBOX_CONF_WIDTH-1:0] switch_conf_regs;

always @(clk) begin
  if (set_in) begin
    switch_conf_regs <= switch_conf_bus;
  end
end

clb_switch_box #(
  .WS(WS),
  .WD(WD)
) switcharoni (
  .north_single(north_single),
  .east_single(east_single),
  .west_single(west_single),
  .south_single(south_single),

  .north_double(north_double),
  .east_double(east_double),
  .west_double(west_double),
  .south_double(south_double),

  .c(switch_conf_regs)
);

// OH GREAT ABC9 WORK THY OPTIMIZATIONS VERILY
config_tile #(
  .COMB_N(SWITCHBOX_CONF_WIDTH),
  .MEM_N(0)
) configuroni (
  .clk(clk),
  .rst(rst),

  .shift_enable(cen & (~set_in)),
  .shift_in_hard(shift_in),
  .shift_in_soft(shift_in),
  .shift_out(shift_out),

  .set_hard(set_in),
  .set_soft(set_in),

  .comb_config(switch_conf_bus),
  .comb_set(),

  .mem_config(),
  .mem_set()
);

endmodule
