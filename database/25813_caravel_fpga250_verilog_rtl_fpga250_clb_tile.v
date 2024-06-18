// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

module clb_tile #(
  parameter S_XX_BASE = 4,
  parameter NUM_LUTS = 4,
  
  parameter WS = 4,
  parameter WD = 8,
  parameter WG = 0,
  parameter CLBIN = 10,
  parameter CLBIN_EACH_SIDE = 10,
  parameter CLBOUT = 5,
  parameter CLBOUT_EACH_SIDE = 5,
  parameter CLBOS = 4,
  parameter CLBOD = 4,
  parameter CLBX = 1
) (
  input clk,
  input rst,
  input cen,

  // Naming convention
  // (except single/double wires)
  // {BLOCK_NAME}_{SIDE}_{IN/OUT}
  //   where BLOCK_NAME: cb, sb, clb (slicel)
  //         SIDE: north, south, east, west

  inout [WS-1:0] north_single, east_single, south_single, west_single,
  inout [WD-1:0] north_double, east_double, south_double, west_double,

  // Connections from the CLBs in the N/E tiles to the N/E CBs in this tile
  output [CLBIN_EACH_SIDE-1:0]  cb_north_out, cb_east_out,
  input  [CLBOUT_EACH_SIDE-1:0] cb_north_in,  cb_east_in,

  // Connections from the CLB in this tile to the N/E CBs in the S/W tiles
  input  [CLBIN_EACH_SIDE-1:0]  clb_south_in,  clb_west_in,
  output [CLBOUT_EACH_SIDE-1:0] clb_south_out, clb_west_out,

  input shift_in_hard, set_in_hard,
  output shift_out_hard, set_out_hard,

  input carry_in,
  output carry_out
);

// Intermediate shifter signals
// SHIFT_IN -> SLICEL -> CB_NORTH -> SB -> CB_EAST -> SHIFT_OUT
wire slice_so, cb_north_so, sb_so, cb_east_so;
assign shift_out_hard = cb_east_so;

// Config set output
wire set;
assign set_out_hard = set;

wire set_in_soft, shift_in_soft;

wire [1:0] north_comb_out, east_comb_out, south_comb_out, west_comb_out;
wire [1:0] north_sync_out, east_sync_out, south_sync_out, west_sync_out;

wire [9:0] slicel_n_in, slicel_e_in, slicel_s_in, slicel_w_in;
wire [4:0] slicel_n_out, slicel_e_out, slicel_s_out, slicel_w_out;

// the south and west wires are connected to CBs in other tiles, i.e. they should be output of this tile
assign slicel_s_in   = clb_south_in;
assign clb_south_out = slicel_s_out;
assign slicel_w_in   = clb_west_in;
assign clb_west_out  = slicel_w_out;

assign set_in_soft   = slicel_n_in[9];
assign shift_in_soft = slicel_n_in[8];

assign slicel_n_out = {set, north_sync_out, north_comb_out};
assign slicel_e_out = {cb_east_so, east_sync_out, east_comb_out};
assign slicel_s_out = {set, south_sync_out, south_comb_out};
assign slicel_w_out = {cb_east_so, west_sync_out, west_comb_out};

baked_slicel #(
  .S_XX_BASE(S_XX_BASE),
  .NUM_LUTS(NUM_LUTS),
  .MUX_LVLS(2)
) slice (
  .clk(clk),
  .rst(rst),
  .cen(cen),

  .set_in(set_in_hard),
  .shift_in(shift_in_hard),

  .set_in_soft(set_in_soft),
  .shift_in_soft(shift_in_soft),

  .set_out(set),
  .shift_out(slice_so),

  .carry_in(carry_in),
  .carry_out(carry_out),

  .higher_order_address(slicel_e_in[9:8]),
  .reg_we(slicel_s_in[8]),

  .luts_input({slicel_n_in[7:0], slicel_w_in[7:0], slicel_s_in[7:0], slicel_e_in[7:0]}),
  .comb_output({north_comb_out, west_comb_out, south_comb_out, east_comb_out}),
  .sync_output({north_sync_out, west_sync_out, south_sync_out, east_sync_out})
);

baked_connection_block_north #(
  .WS(WS),
  .WD(WD),
  .WG(WG),
  .CLBIN(CLBIN),
  .CLBIN0(CLBIN_EACH_SIDE),
  .CLBIN1(CLBIN_EACH_SIDE),
  .CLBOUT(CLBOUT),
  .CLBOUT0(CLBOUT_EACH_SIDE),
  .CLBOUT1(CLBOUT_EACH_SIDE),
  .CLBOS(CLBOS),
  .CLBOD(CLBOD),
  .CLBX(CLBX)

) cb_north (
  .clk(clk),
  .rst(rst),
  .cen(cen),

  .set_in(set),
  .shift_in(slice_so),
  .shift_out(cb_north_so),

  .single0(west_single),
  .double0(west_double),
  .single1(),
  .double1(),

  // no global wire for now
  // carry signals go directly to top-level interface
  .clb0_cout(),
  .clb1_cout(),
  .clb0_cin(),
  .clb1_cin(),

  .clb0_output(slicel_n_out),
  .clb1_output(cb_north_in),
  .clb0_input(slicel_n_in),
  .clb1_input(cb_north_out)
);

baked_connection_block_east #(
  .WS(WS),
  .WD(WD),
  .WG(WG),
  .CLBIN(CLBIN),
  .CLBIN0(CLBIN_EACH_SIDE),
  .CLBIN1(CLBIN_EACH_SIDE),
  .CLBOUT(CLBOUT),
  .CLBOUT0(CLBOUT_EACH_SIDE),
  .CLBOUT1(CLBOUT_EACH_SIDE),
  .CLBOS(CLBOS),
  .CLBOD(CLBOD),
  .CLBX(CLBX)

) cb_east (
  .clk(clk),
  .rst(rst),
  .cen(cen),

  .set_in(set),
  .shift_in(sb_so),
  .shift_out(cb_east_so),

  .single0(south_single),
  .double0(south_double),
  .single1(),
  .double1(),

  // no global wire for now
  // carry signals go directly to top-level interface
  .clb0_cout(),
  .clb1_cout(),
  .clb0_cin(),
  .clb1_cin(),

  .clb0_output(slicel_e_out),
  .clb1_output(cb_east_in),
  .clb0_input(slicel_e_in),
  .clb1_input(cb_east_out)
);

baked_clb_switch_box #(
  .WS(WS),
  .WD(WD)
) sb (
  .clk(clk),
  .rst(rst),
  .cen(cen),

  .set_in(set),
  .shift_in(cb_north_so),
  .shift_out(sb_so),

  .north_single(north_single),
  .north_double(north_double),
  .east_single(east_single),
  .east_double(east_double),

  .south_single(south_single),
  .south_double(south_double),
  .west_single(west_single),
  .west_double(west_double)
);

endmodule
