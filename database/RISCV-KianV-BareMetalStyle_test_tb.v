// This program was cloned from: https://github.com/splinedrive/RISCV-KianV-BareMetalStyle
// License: Apache License 2.0

// SPDX-FileCopyrightText: © 2023 Uri Shaked   <uri@wokwi.com>
//                                Hirosh Dabui <hirosh@dabui.de>
// SPDX-License-Identifier: MIT

`default_nettype none `timescale 1ns / 1ps

/*
this testbench just instantiates the module and makes some convenient wires
that can be driven / tested by the cocotb test.py
*/

// testbench is controlled by test.py
module tb ();

  // wire up the inputs and outputs
  reg clk;
  reg rst_n;
  reg ena;
  wire [7:0] uio_in;

  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  reg spi_sio1_so_miso0;
  reg uart_rx;
  wire uart_tx = uo_out[4];

  wire spi_cen0 = uo_out[0];
  wire spi_sclk0 = uo_out[1];
  wire spi_sio0_si_mosi0 = uo_out[2];
  wire pwm_o = uo_out[3];

  wire [7:0] ui_in = {4'b0, uart_rx, spi_sio1_so_miso0, 2'b0};
  tt_um_kianv_bare_metal tt_um_kianv_bare_metal_I (
      // include power ports for the Gate Level test
`ifdef GL_TEST
      .VPWR   (1'b1),
      .VGND   (1'b0),
`endif
      .ui_in  (ui_in),    // Dedicated inputs
      .uo_out (uo_out),   // Dedicated outputs
      .uio_in (uio_in),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n)     // not reset
  );

  wire spi_flash_clk;
  wire spi_psram_clk;
  assign #1 spi_flash_clk = uio_out[3];
  assign spi_psram_clk = uio_out[3];

  wire spi_ce0 = uio_out[0];
  wire spi_ce1 = uio_out[6];

  wire spi_io3 = uio_oe[5] ? uio_out[5] : 'z;
  wire spi_io2 = uio_oe[4] ? uio_out[4] : 'z;
  wire spi_io1 = uio_oe[2] ? uio_out[2] : 'z;
  wire spi_io0 = uio_oe[1] ? uio_out[1] : 'z;
  assign uio_in = {uio_out[7:6], spi_io3, spi_io2, uio_out[3], spi_io1, spi_io0, uio_out[0]};

  spiflash #(
      // change the hex file to match your project
      .FILENAME("firmware/firmware.hex")
  ) spiflash (
      .csb(spi_ce0),
      .clk(spi_flash_clk),
      .io0(spi_io0),
      .io1(spi_io1),
      .io2(spi_io2),
      .io3(spi_io3)
  );

  psram psram_I (
      .ce_n(spi_ce1),
      .sck (spi_psram_clk),
      .dio ({spi_io3, spi_io2, spi_io1, spi_io0})
  );

  // this part dumps the trace to a vcd file that can be viewed with GTKWave
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end


endmodule
