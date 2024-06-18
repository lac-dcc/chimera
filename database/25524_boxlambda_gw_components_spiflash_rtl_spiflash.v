// This program was cloned from: https://github.com/epsilon537/boxlambda
// License: MIT License

////////////////////////////////////////////////////////////////////////////////
//
// Epsilon/BoxLambda: This module is based on ZipCPU's spixpress:
//
// https://github.com/ZipCPU/qspiflash/blob/master/rtl/spixpress.v
//
// Changes relative to the original spixpress.v:
// - The SCK output port is the actual SPI clock signal,
//   rather than an enable signal to be used in conjunction with a DDR
//   primitive.
// - I added a clock divider parameter.
// - I removed the pipeline logic.
// - BoxLambda is a little endian platform. When reading from flash
//   the 32-bit words are being shifted in in little endian fashion.
//
// Original module documentation:
//
//    Although this controller has no erase or program capability, it
//    includes a control port.  When using the control port, you should be
//    able to send arbitrary commands to the flash--but not read from the
//    flash during that time.
//
// Memory map:
// {{{
//     Control Port
//     [31:9]    Unused bits, ignored on write, read as zero
//     [8]    CS_n
//             Can be activated via a write to the control port.
//             This will render the memory addresses unreadable.
//             Write a '1' to this value to return the memory to
//             normal operation.
//     [7:0]    BYTE-DATA
//             Following a write to the control port where bit [8]
//             is low, the controller will send bits [7:0] out the
//             SPI port, top bit first.  Once accomplished, the
//             control port may be read to see what values were
//             read from the SPI port.  Those values will be stored
//             in these same bits [7:0].
//
//    Memory
//        Returns the data from the address read
//
//        Requires that the CS_N setting within the control port be
//        deactivated, otherwise requests to read from memory
//        will simply return the control port register immediately
//        without doing anything.
// }}}
//
// Original spixpress Creator:    Dan Gisselquist, Ph.D.
//                                Gisselquist Technology, LLC
//
////////////////////////////////////////////////////////////////////////////////
// }}}
// Copyright (C) 2018-2021, Gisselquist Technology, LLC
// {{{
// This file is part of the set of Wishbone controlled SPI flash controllers
// project
//
// The Wishbone SPI flash controller project is free software (firmware):
// you can redistribute it and/or modify it under the terms of the GNU Lesser
// General Public License as published by the Free Software Foundation, either
// version 3 of the License, or (at your option) any later version.
//
// The Wishbone SPI flash controller project is distributed in the hope
// that it will be useful, but WITHOUT ANY WARRANTY; without even the implied
// warranty of MERCHANTIBILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  (It's in the $(ROOT)/doc directory.  Run make
// with no target there if the PDF file isn't present.)  If not, see
// <http://www.gnu.org/licenses/> for a copy.
// }}}
// License:    LGPL, v3, as defined and found on www.gnu.org,
// {{{
//        http://www.gnu.org/licenses/lgpl.html
//
////////////////////////////////////////////////////////////////////////////////
//
`default_nettype none
// }}}
module spiflash #(
    parameter SCK_CLKDIV = 2  /*Clock divider value for SCK relative to input clock, power of 2, minimum 2.*/
) (
    // {{{
    input  wire        i_clk,
    i_reset,
    //
    input  wire        i_wb_cyc,
    i_wb_stb,
    i_cfg_stb,
    i_wb_we,
    input  wire [21:0] i_wb_addr,
    input  wire [31:0] i_wb_data,
    output reg         o_wb_stall,
    o_wb_ack,
    output reg  [31:0] o_wb_data,
    //
    output reg         o_spi_cs_n,
    o_spi_sck,
    o_spi_mosi,
    input  wire        i_spi_miso
    // }}}
);

  //Number of bits required to hold the clock divider counter.
  localparam SCK_DIV_NUM_BITS = $clog2(SCK_CLKDIV);
  //The counter value in the middle of the period (one before, actually).
  localparam SCK_COUNTER_MIDPOINT = {1'b0, {(SCK_DIV_NUM_BITS - 1) {1'b1}}};
  //The counter value at the end of the period (i.e. one before the beginning
  //of the period.
  localparam SCK_COUNTER_ENDPOINT = {SCK_DIV_NUM_BITS{1'b1}};

  // Signal declarations
  // {{{
  reg                        cfg_user_mode;
  reg [                31:0] wdata_pipe;
  reg [SCK_DIV_NUM_BITS+6:0] ack_delay;
  reg [SCK_DIV_NUM_BITS-1:0] sck_counter;
  wire shift_out_mosi, shift_in_miso;
  reg o_spi_sck_en;

  wire bus_request, user_request;
  // }}}

  assign bus_request  = (i_wb_stb) && (!o_wb_stall) && (!i_wb_we) && (!cfg_user_mode);
  assign user_request = (i_cfg_stb) && (!o_wb_stall) && (i_wb_we) && (!i_wb_data[8]);

  // SCK generation
  // {{{

  // o_spi_sck_en - only enable SCK when there's an ongoing transaction.
  initial o_spi_sck_en = 1'b0;
  always @(posedge i_clk)
    if (i_reset) o_spi_sck_en <= 1'b0;
    else if ((bus_request) || (user_request))
      // Start clocking following any memory read or configuration
      // port write request
      o_spi_sck_en <= 1'b1;
    else if ((i_wb_cyc) && (ack_delay > 2))  // Bus abort check
      // As long as CYC stays high, continue the request
      o_spi_sck_en <= 1'b1;
    else
      // Otherwise, shut it down
      o_spi_sck_en <= 1'b0;

  initial begin
    o_spi_sck   = 0;
    sck_counter = 0;
  end

  always @(posedge i_clk) begin
    if (i_reset) begin
      o_spi_sck   <= 1'b0;
      sck_counter <= 0;
    end else begin
      //SCK rising edge at midpoint
      if (sck_counter == SCK_COUNTER_MIDPOINT) o_spi_sck <= o_spi_sck_en;
      //SCK falling edge at endpoint
      else if (sck_counter == SCK_COUNTER_ENDPOINT) o_spi_sck <= 1'b0;

      if (bus_request || user_request) sck_counter <= 0;
      else sck_counter <= sck_counter + 1;
    end
  end

  //shift out mosi at falling edge.
  assign shift_out_mosi = o_spi_sck_en & (sck_counter == SCK_COUNTER_ENDPOINT);
  //shift in miso at rising edge
  assign shift_in_miso  = o_spi_sck_en & (sck_counter == SCK_COUNTER_MIDPOINT);
  // }}}

  // ack_delay (State control)
  // {{{
  // The state control is nominally the number of clocks to wait until
  // the current operation finishes.  Once ack_delay transitions to 0,
  // the operation is finished and o_wb_ack should be high.
  initial ack_delay = 0;
  always @(posedge i_clk)
    if ((i_reset) || (!i_wb_cyc)) ack_delay <= 0;
    else if (bus_request)
      //'d64 = 8 cmd + 24 adr + 32 data bits. Multiply by clock divider amount.
      ack_delay <= {
        7'd64, {SCK_DIV_NUM_BITS{1'b0}}
      };
    else if (user_request)
      //'d8 = 8 cmd bits. Multiply by clock divider amount.
      ack_delay <= {
        7'd8, {SCK_DIV_NUM_BITS{1'b0}}
      };
    else if (ack_delay != 0) ack_delay <= ack_delay - 1'b1;
  // }}}

  // wdata_pipe
  // {{{
  // MOSI
  // {{{
  // wdata_pipe is a long shift register, containing values that need
  // to be sent to the SPI port for our current transaction.  The
  // basic transaction requires sending a 8'h03 (read) command, followed
  // by a 24-bit address.
  //
  // For purposes of logic minimization, setting wdata_pipe has been
  // broken up into two sections, but it basically follows a couple
  // of models:
  //
  // 1. Upon any flash read request, request a read from the 24-bit
  //    address formed from i_wb_addr[21:0] and 2'b00--since we are
  //    only doing aligned transactions.
  //
  //    wdata_pipe <= { 8'h03, i_wb_addr[21:0], 2'b00 };
  //
  // 2. Upon any configuration port write, set the data based upon the
  //    desired 8-bit command contained in i_wb_data
  //
  //    wdata_pipe <= { i_wb_data[7:0], 24'bz };
  //
  // 3. During any operation, shift the pipe up/left one bit per clock,
  //    backfilling with 1'bz nominally, but 1'b0 in actuality
  //
  // 4. If the interface is idle, wdata_pipe is a don't care.
  // }}}
  //

  //This part handles the 24 lsbs (out of 32).
  initial wdata_pipe = 0;
  always @(posedge i_clk)
    if (!o_wb_stall)
      // On any read request, this sets the address to be read.
      //
      // On a configuration write request, or if the bus is idle,
      // these bits are don't cares so we can optimize them a bit
      wdata_pipe[23:0] <= {
        i_wb_addr[21:0], 2'b00
      };
    else if (shift_out_mosi)
      // While in operation, and shift_out_mosi indicates it's time
      // (SCK falling edge) just shift left one bit at a time.
      wdata_pipe[23:0] <= {
        wdata_pipe[22:0], 1'b0
      };

  //This part handles the 8 msbs (out of 32).
  always @(posedge i_clk)
    if (i_wb_stb && (!o_wb_stall))  // (bus_request)
      // Request to read from the flash
      wdata_pipe[31:24] <= {
        8'h03
      };
    else if (i_cfg_stb && (!o_wb_stall))  // (user_request)
      // Request to send special data to the flash
      wdata_pipe[31:24] <= {
        i_wb_data[7:0]
      };
    else if (shift_out_mosi)
      // Otherwise just shift the register left when shift_out_mosi
      // indicates it's time (SCK falling edge).
      wdata_pipe[31:24] <= {
        wdata_pipe[30:23]
      };
  // }}}

  // The outgoing bit to the flash is simply given by the top bit of
  // this wdata_pipe shift register.
  always @(*) o_spi_mosi = wdata_pipe[31];

  // o_wb_ack, WB-ACK
  // {{{
  initial o_wb_ack = 0;
  always @(posedge i_clk)
    if (i_reset)
      // Clear any acknowledgment on reset
      o_wb_ack <= 0;
    else if (ack_delay == 1)
      // Acknowledge the end of any operation, whether from the
      // configuration port or from reading the memory
      o_wb_ack <= (i_wb_cyc);
    else if ((i_wb_stb) && (!o_wb_stall) && (!bus_request))
      // Immediately acknowledge any write to the memory address
      // space, or any read/write while the configuration port is
      // active.
      o_wb_ack <= 1'b1;
    else if ((i_cfg_stb) && (!o_wb_stall) && (!user_request))
      // Immediately acknowledge any read from the configuration
      // port.  No action is required.
      o_wb_ack <= 1'b1;
    else
      // In all other cases, leave the acknowledgment line low.
      o_wb_ack <= 0;
  // }}}

  // cfg_user_mode, CFG user mode (i.e. override mode)
  // {{{
  // If we are in the configuration/user mode, the CS line will be held
  // low artificially.  This allows us to send multiply byte commands
  // over a series of configuration writes.
  //
  initial cfg_user_mode = 0;
  always @(posedge i_clk)
    if (i_reset) cfg_user_mode <= 0;
    else if ((i_cfg_stb) && (!o_wb_stall) && (i_wb_we)) cfg_user_mode <= !i_wb_data[8];
  // }}}

  // o_wb_data, the Outgoing WB-Data
  // {{{
  always @(posedge i_clk) begin
    //Shift data in when shift_in_miso indicates it's time (SCK rising edge).
    if (shift_in_miso) begin
      if (cfg_user_mode) o_wb_data <= {19'h0, 1'b1, 4'h0, o_wb_data[6:0], i_spi_miso};
      else
        o_wb_data <= {  /*Little Endian logic*/
          o_wb_data[30:24],
          i_spi_miso,
          o_wb_data[22:16],
          o_wb_data[31],
          o_wb_data[14:8],
          o_wb_data[23],
          o_wb_data[6:0],
          o_wb_data[15]
        };
    end

    if (cfg_user_mode) o_wb_data[31:8] <= {19'h0, 1'b1, 4'h0};
  end
  // }}}

  // CSN / o_spi_cs_n
  // {{{
  // This is the negative logic chip select.
  //
  initial o_spi_cs_n = 1'b1;
  always @(posedge i_clk)
    if (i_reset)
      // Idle on reset
      o_spi_cs_n <= 1'b1;
    else if ((!i_wb_cyc) && (!cfg_user_mode))
      // Following any aborted transaction, or any time we
      // leave the configuration mode, return to idle.
      o_spi_cs_n <= 1'b1;
    else if (bus_request)
      // On any bus read request, select the device to initiate a
      // transaction.
      o_spi_cs_n <= 1'b0;
    else if ((i_cfg_stb) && (!o_wb_stall) && (i_wb_we))
      // Similarly, on any write to the configuration port, begin
      // an 8-bit transfer.
      o_spi_cs_n <= i_wb_data[8];
    else if (cfg_user_mode)
      // Even if the transfer is complete, while we are in
      // configuration mode hold the CS line active (low)
      o_spi_cs_n <= 1'b0;
    else if ((ack_delay == 1) && (!cfg_user_mode))
      // In all other cases, a transaction should end on the clock
      // following ack_delay == 1, so end it here.
      o_spi_cs_n <= 1'b1;
  // }}}

  // o_wb_stall
  // {{{
  // WB-stall
  //
  // The WB interface needs to stall any time we are busy calculating
  // an answer, as this core can only process one request at a time.
  initial o_wb_stall = 1'b0;
  always @(posedge i_clk)
    if ((i_reset) || (!i_wb_cyc))
      // Release the stall line on a reset, or bus abort
      o_wb_stall <= 1'b0;
    else if ((bus_request) || (user_request))
      // On any request for a flash transaction, immediately start
      // stalling the bus
      o_wb_stall <= 1'b1;
    else o_wb_stall <= (ack_delay > 1);
  // }}}

  // Make Verilator happy
  // {{{
  // verilator lint_off UNUSED
  wire [22:0] unused;
  assign unused = i_wb_data[31:9];
  // verilator lint_on  UNUSED
  // }}}
endmodule

