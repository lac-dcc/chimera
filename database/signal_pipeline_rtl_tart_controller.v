// This program was cloned from: https://github.com/tart-telescope/signal_pipeline
// License: MIT License

`timescale 1ns / 100ps
/**
 * Module      : verilog/tart_control.v
 * Copyright   : (C) Tim Molteno     2023
 *             : (C) Max Scheel      2023
 *             : (C) Patrick Suggate 2023
 * License     : MIT
 *
 * Maintainer  : Patrick Suggate <patrick.suggate@gmail.com>
 * Stability   : Experimental
 * Portability : only tested with a Papilio board (Xilinx Spartan VI)
 *
 *
 * This file is part of TART.
 *
 * Description:
 * TART's control registers module, connected via AXI4-Lite interconnect.
 *
 * Has system registers for:
 *   2'b00  --  status register;
 *   2'b01  --  extra status-flags;
 *   2'b10  --  reserved/miscellaneous register; and
 *   2'b11  --  reset register,
 *
 * and these each have the bit-fields show below.
 *
 *
 * REGISTERS:
 *  Reg#   7          6          5        4       3      2    1    0
 *      -------------------------------------------------------------------
 *   00 ||  VIZ_EN  | PENDING  | CAP_EN | DEBUG | AQ_EN |    AQ_STATE    ||
 *      ||   (RO)   |   (RO)   |  (RO)  | (RO)  | (RO)  |      (RO)      ||
 *      -------------------------------------------------------------------
 *   01 || OVERFLOW | UNDERRUN |              5'h00              | BUSY  ||
 *      ||   (RO)   |   (RO)   |                                 | (RO)  ||
 *      -------------------------------------------------------------------
 *   10 ||                           RESERVED                            ||
 *      ||                                                               ||
 *      -------------------------------------------------------------------
 *   11 ||                          7'h00                        | RESET ||
 *      ||                                                       | (R/W) ||
 *      -------------------------------------------------------------------
 *
 * By default, the DSP/visibilities unit has address 7'b100_00xx.
 *
 * Note:
 *  - based on `tart_control.v`, from TART2;
 *  - Tang Primer Core Board has a 27.0 MHz oscillator;
 *  - TART motherboard has a 16.368 MHz oscillator;
 *  - Run the correlators at 12x 16.368 MHz (same as TART2)?
 *  - Raspberry Pi 4 has SPI bus with the following clocks:
 *     + 250 MHz / 'n';
 *     + 'n' is any even integer from 2 to 65536;
 *  - The DDR3 SDRAM should have a clock-rate between 100-125 MHz;
 *  - The hardware testbench board has a USB2.0 ULPI PHY with a 60 MHz output
 *    oscillator;
 *
 */
module controller #(
    parameter  integer WIDTH = 8,
    localparam integer MSB   = WIDTH - 1,
    localparam integer ABITS = 2,
    localparam integer ASB   = ABITS - 1,
    localparam integer STRBS = WIDTH / 8,
    localparam integer SSB   = STRBS - 1
) (
    input clock_in,  // ~16.368 MHz on TART
    input ulpi_clk,  // 60 MHz (if present)
    input areset_n,

    output axi_clk_o,
    output axi_rst_o,
    output ddr_clk_o,
    output usb_clk_o,
    output usb_rst_o,
    output acq_clk_o,

    output ulpi_rst_no,
    output tart_reset_o,

    output capture_en_o,
    output acquire_en_o,
    output correlator_o,
    input  visibility_i,

    input s_tvalid,
    output s_tready,
    input s_tlast,
    input [7:0] s_tdata,

    output m_tvalid,
    input m_tready,
    output m_tlast,
    output [7:0] m_tdata
);


  // -- Signals & State Registers -- //

  reg [4:0] reset_count = 5'd0;
  reg rst_q, cap_q, acq_q, cor_q;
  wire clock;


  // -- I/O Assignments -- //

  assign axi_clk_o = clock;
  assign acq_clk_o = clock_in;

  assign tart_reset_o = rst_q;
  assign capture_en_o = cap_q;
  assign acquire_en_o = acq_q;
  assign correlator_o = cor_q;


  // -- Reset Logic -- //

  always @(posedge clock or negedge areset_n) begin
    if (!areset_n) begin
      rst_q <= 1'b1;
      cap_q <= 1'b0;
      acq_q <= 1'b0;
      cor_q <= 1'b0;
    end else begin
      rst_q <= ~reset_count[4];
    end
  end

  // Reset delay after clock starts
  always @(posedge clock or negedge areset_n) begin
    if (!areset_n) begin
      reset_count <= 5'd0;
    end else begin
      if (!reset_count[4]) begin
        reset_count <= reset_count + 5'd1;
      end
    end
  end


  // -- AXI Lite FSM -- //

  localparam [3:0] ST_IDLE = 4'h0;

  reg [3:0] state;

  always @(posedge clock) begin
    if (rst_q) begin
      state <= ST_IDLE;
    end else begin
      case (state)
        ST_IDLE: begin
          state <= state;
        end
        default: begin
          state <= ST_IDLE;
        end
      endcase
    end
  end


  // -- TART Main Clocks & Resets -- //

  clock_reset #(
      .GOWIN_GW2A(1),
      .GOWIN_FCLKIN("27"),  // todo ...
      .GOWIN_RPLL_IDIV(3)  // todo ...
  ) U_AXI_AND_DDR_CLK1 (
      .clock_in(clock_in),
      .areset_n(areset_n),
      .clock(clock),
      .clk2x(ddr_clk_o),
      .reset(axi_rst_o)
  );


  // -- USB ULPI Clocks and Resets (OPTIONAL) -- //

  ulpi_reset U_ULPI_CLK_RST1 (
      .ulpi_clk  (ulpi_clk),
      .areset_n  (areset_n),
      .sys_clock (clock),
      .ulpi_rst_n(ulpi_rst_no),
      .usb_clock (usb_clk_o),
      .usb_reset (usb_rst_o)
  );


endmodule  // controller
