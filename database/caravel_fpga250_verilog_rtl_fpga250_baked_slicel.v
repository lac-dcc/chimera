// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module baked_slicel #(
  parameter S_XX_BASE = 4,
  parameter NUM_LUTS = 4,
  parameter MUX_LVLS = $clog2(NUM_LUTS)
)(
  // Common
  input wire clk,
  input wire rst,


  // Configuration signals:

  // Shift enable signal for the config block
  input wire cen,

  // Hardwired config set input (from northward tile)
  input wire set_in,
  // Soft config set input (from fabric)
  input wire set_in_soft,

  // Hardwired config shift input (from northward tile)
  input wire shift_in,
  // Soft shifter input (from fabric)
  input wire shift_in_soft,

  output wire set_out,
  output wire shift_out,


  // LUT Signals:

  // Input to all the luts (from fabric)
  input wire [2*S_XX_BASE*NUM_LUTS-1:0] luts_input,
  // MUX address input for big luts (from fabric)
  input wire [MUX_LVLS-1:0] higher_order_address,
  // Output register WE (from fabric)
  input wire reg_we,

  // Output from LUTs (to fabric)
  output wire [2*NUM_LUTS-1:0] comb_output,
  // Output from LUTs (registered to fabric)
  output wire [2*NUM_LUTS-1:0] sync_output,

  // Carry in input (from fabric)
  input wire carry_in,
  // Carry out output (to fabric)
  output wire carry_out
);

//localparam MUX_LVLS = $clog2(NUM_LUTS);
localparam LUT_CONF_WIDTH = 2*(2**S_XX_BASE) + 1;

// N luts + Muxing + carry enable
localparam TOTAL_COMB_CONF_WIDTH = NUM_LUTS*LUT_CONF_WIDTH + MUX_LVLS + 1;
// Register reset states
localparam TOTAL_MEM_CONF_WIDTH = 2*NUM_LUTS;

wire comb_set;
wire mem_set;

wire [TOTAL_COMB_CONF_WIDTH-1:0] slicel_comb_conf_bus;
wire [TOTAL_MEM_CONF_WIDTH-1:0] slicel_mem_conf_bus; 

assign set_out = comb_set;

slicel #(
  .S_XX_BASE(S_XX_BASE),
  .NUM_LUTS(NUM_LUTS)
) sliceluroni (
  .clk(clk),
  .comb_set(comb_set),
  .mem_set(mem_set),

  .luts_in(luts_input),
  .higher_order_addr(higher_order_address),
  .reg_ce(reg_we),

  .out(comb_output),
  .sync_out(sync_output),

  .Ci(carry_in),
  .Co(carry_out),

  .luts_config_in(slicel_comb_conf_bus[LUT_CONF_WIDTH*NUM_LUTS-1:0]),
  .inter_lut_mux_config(slicel_comb_conf_bus[MUX_LVLS+LUT_CONF_WIDTH*NUM_LUTS-1:LUT_CONF_WIDTH*NUM_LUTS]),
  .config_use_cc(slicel_comb_conf_bus[TOTAL_COMB_CONF_WIDTH-1]),

  .regs_config_in(slicel_mem_conf_bus)
);

config_tile #(
  .COMB_N(TOTAL_COMB_CONF_WIDTH),
  .MEM_N(TOTAL_MEM_CONF_WIDTH)
) configuroni (
  .clk(clk),
  .rst(rst),

  .shift_enable(cen & (~set_in)),
  .shift_in_hard(shift_in),
  .shift_in_soft(shift_in_soft),
  .shift_out(shift_out),

  .set_hard(set_in),
  .set_soft(set_in_soft),

  .comb_config(slicel_comb_conf_bus),
  .comb_set(comb_set),

  .mem_config(slicel_mem_conf_bus),
  .mem_set(mem_set)
);

endmodule
