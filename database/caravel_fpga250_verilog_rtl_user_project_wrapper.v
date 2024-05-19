// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

`default_nettype none
/*
 *-------------------------------------------------------------
 *
 * user_project_wrapper
 *
 * This wrapper enumerates all of the pins available to the
 * user for the user project.
 *
 * An example user project is provided in this wrapper.  The
 * example should be removed and replaced with the actual
 * user project.
 *
 *-------------------------------------------------------------
 */

`ifdef SIM

`include "fpga250/wishbone_configuratorinator_00.v"
`include "fpga250/wishbone_configuratorinator_10.v"
`include "fpga250/wishbone_configuratorinator.v"

`include "fpga250/clb_tile.v"

`include "fpga250/config_tile.v"
`include "fpga250/shift_chain.v"
`include "fpga250/config_latch.v"

`include "fpga250/baked_clb_switch_box.v"
`include "fpga250/clb_switch_box.v"
`include "fpga250/universal_switch_box.v"
`include "fpga250/switch_box_element_two.v"
`include "fpga250/transmission_gate.v"
`include "fpga250/transmission_gate_cell.v"

`include "fpga250/baked_slicel.v"
`include "fpga250/slicel.v"
`include "fpga250/lut_sXX_softcode.v"
`include "fpga250/lut.v"
`include "fpga250/block_config_latches.v"
`include "fpga250/mux_f_slice.v"
`include "fpga250/carry_chain.v"

`include "fpga250/baked_connection_block.v"
`include "fpga250/baked_connection_block_east.v"
`include "fpga250/baked_connection_block_north.v"
`include "fpga250/connection_block.v"
`include "fpga250/transmission_gate_oneway.v"

`include "fpga250/fpga.v"

`endif

module user_project_wrapper #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oen,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // Analog (direct connection to GPIO pad---use with caution)
    // Note that analog I/O is not available on the 7 lowest-numbered
    // GPIO pads, and so the analog_io indexing is offset from the
    // GPIO indexing by 7.
    inout [`MPRJ_IO_PADS-8:0] analog_io,

    // Independent clock (on independent integer divider)
    input   user_clock2
);


// These should match what we built the FPGA core with.
localparam IO_NORTH = 10;
localparam IO_SOUTH = 8;
localparam IO_EAST = 10;
localparam IO_WEST = 10;

wire [IO_NORTH-1:0] gpio_north;
wire [IO_SOUTH-1:0] gpio_south;
wire [IO_EAST-1:0] gpio_east;
wire [IO_WEST-1:0] gpio_west;

// This is done by hand :/
assign gpio_north[8:0] = io_in[23:15];
assign gpio_east[9:0]  = io_in[9:0];
assign gpio_north[9]   = io_in[10];

assign io_out[14:11] = gpio_south[7:4];
assign io_out[37:28] = gpio_west[9:0];
assign io_out[27:24] = gpio_south[3:0];

// output-enable (bar)
assign io_oeb[14:11] = 4'b0;
assign io_oeb[37:28] = 10'b0;
assign io_oeb[27:24] = 4'b0;

fpga #(
  .IO_NORTH(IO_NORTH),
  .IO_SOUTH(IO_SOUTH),
  .IO_EAST(IO_EAST),
  .IO_WEST(IO_WEST)
) fpga250 (
  // GPIO.
  .gpio_north(gpio_north),
  .gpio_south(gpio_south),
  .gpio_west(gpio_west),
  .gpio_east(gpio_east),
  // Wishbone.
  .wb_clk_i(wb_clk_i),
  .wb_rst_i(wb_rst_i),
  .wbs_stb_i(wbs_stb_i),
  .wbs_cyc_i(wbs_cyc_i),
  .wbs_we_i(wbs_we_i),
  .wbs_sel_i(wbs_sel_i),
  .wbs_data_i(wbs_dat_i),
  .wbs_addr_i(wbs_adr_i),
  .wbs_ack_o(wbs_ack_o),
  .wbs_data_o(wbs_dat_o)
);

endmodule	// user_project_wrapper
`default_nettype wire
