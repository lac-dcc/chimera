// This program was cloned from: https://github.com/dlmiles/tt06-poc-fskmodem-hdlctrx
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Darryl L. Miles
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_dlmiles_poc_fskmodem_hdlctrx (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Improve reliability when using TT PCB reset button
  reg rst_n_sync;

  always @(posedge clk)
    rst_n_sync <= rst_n;

  // Configuration latch bit experiment (configuration?)
  reg [7:0] latched_rst_n_uio_in;
  always_latch begin
    if (!rst_n_sync)
      latched_rst_n_uio_in = uio_in;
  end

  reg [7:0] latched_rst_n_ui_in;
  always_latch begin
    if (!rst_n_sync)
      latched_rst_n_ui_in = ui_in;
  end

  wire [15:0] latched;
  assign latched = {latched_rst_n_uio_in, latched_rst_n_ui_in};

`ifdef HAVE_DEBUG_FSKMODEM_HDLCTRX
  wire simulation_z;
  assign simulation_z = 1'bz;
`endif

  ModemTop modem (
      .ui_in         (ui_in),        //i Dedicated inputs
      .uo_out        (uo_out),       //o Dedicated outputs
      .uio_in        (uio_in),       //i IOs: Input path
      .uio_out       (uio_out),      //o IOs: Output path
      .uio_oe        (uio_oe),       //o IOs: Enable path (active high: 0=input, 1=output)
      .ena           (ena),          //i enable - goes high when design is selected
      .clk           (clk),          //i clock
      .rst_n         (rst_n_sync),   //i not reset

      .latched       (latched)       //i

`ifdef HAVE_DEBUG_FSKMODEM_HDLCTRX
      ,
      .simulation_z  (simulation_z)  //i
`endif
  );

endmodule
