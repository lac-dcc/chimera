// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
==============================================================================
lisa_io_mux.v:  Tiny Tapeout User Module for the LISA 8-bit processor.

Copyright 2024 by Ken Pettit <pettitkd@gmail.com>

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions
are met:
1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
SUCH DAMAGE.

==============================================================================
*/

// ==============================================================================
// I/O Usage:
//
//
//                 +------------------------+
//                 |     tt_um_lisa         |
//                 |                        |
//                 |ui_in             uo_out|
//        |        | 0                    0 |
//        |        | 1                    1 |
//  baud  |        | 2                    2 |
//   val -+   rx   | 3                    3 |
//        |        | 4                    4 | tx
//        |        | 5                    5 |
//        |        | 6                    6 |
//        baud_set | 7                    7 |
//                 |                        |
//                 |                   uio  |
//                 |                      0 |
//                 |                      1 |
//                 |                      2 |   FSM
//                 |                      3 |   I/O
//                 |                      4 |
//                 |                      5 |
//                 |                      6 |
//                 |                      7 |
//                 |                        |
//                 +------------------------+
//
//  Output Muxes:
//    2'b00:  Default outputs (baud_reference, debug_tx, etc.)
//    2'b01:  LISA port A output
//    2'b10:  Peripheral select 1 (RP2040 SPI SRAM)
//    2'b11:  Peripheral select 2 (Custom QSPI SRAM / QSPI FLASH / UART) board
//
//   ui:
//      3: Debug RX
//
//      7: HIGH to sample ui[6:0] as BAUD divider at reset.
//    6-0: When [7] is HIGH at reset, sets the UART BAUD divider.
//
//
//  RP2040 SPI RAM:
//     uio[0] - CE
//     uio[1] - MOSI
//     uio[2] - MISO
//     uio[3] - SCLK
//
//  Custom QSPI SRAM / QSPI Flash / UART board:
//     uio[0] - CE_CLK
//     uio[1] - MOSI / CE0
//     uio[2] - MISO
//     uio[3] - SCLK / CE1
//     uio[4] - DEBUG_RX (input)
//     uio[5] - DEBUG_TX (output)
//     uio[6] - Q2 / WP
//     uio[7] - Q3 / HOLD
//
// ==============================================================================

`define WANT_UART2

module lisa_io_mux
(
   input   wire            clk,
   input   wire            rst_n,
   input   wire            ena,

   // Tiny Tapeout I/O definitions
   input   wire [7:0]      ui_in,               // Connected to the input switches
   output  wire [7:0]      uo_out,              // Connected to the 7 segment display
   input   wire [7:0]      uio_in,              // PMOD inputs
   output  wire [7:0]      uio_out,             // PMOD outputs
   output  wire [7:0]      uio_oe,              // PMOD BIDIR Enable (0=input, 1=output)
   
   // Control inputs
   input  wire [1:0]       rx_sel,              // Selects UART port
   input  wire [15:0]      output_mux_bits,     // Output select bits per output
   input  wire [7:0]       io_mux_bits,         // I/O select bits per output

   // Debug UART signals                                                             
   input  wire             rx1,
   input  wire             rx2,
   input  wire             rx3,

`ifdef WANT_UART2
   // UART2 signals
   output wire             uart2_rx,
   input  wire             uart2_tx,
`endif

   // QSPI I/O signals
   input  wire             sclk,                // SPI clock input
   input  wire [1:0]       ce,                  // SPI Chip Enables
   output wire             sio0_si_mosi_i,      // QUAD input from selected pin(s)
   output wire             sio1_so_miso_i,      // QUAD input from selected pin(s)
   output wire             sio2_i,              // QUAD input from selected pin(s)
   output wire             sio3_i,              // QUAD input from selected pin(s)
   input  wire             sio0_si_mosi_o,      // QUAD output to selected pin(s)
   input  wire             sio1_so_miso_o,      // QUAD output to selected pin(s)
   input  wire             sio2_o,              // QUAD output to selected pin(s)
   input  wire             sio3_o,              // QUAD output to selected pin(s)
   input  wire [3:0]       sio_oe,              // QUAD output enable controls

   // LISA peripheral Port signals
   output wire [7:0]       lisa_porta_o,        // Inputs to Port A peripheral
   input  wire [7:0]       lisa_portb_i,        // Outputs from Port B peripheral
   input  wire [3:0]       lisa_portc_i,        // Outputs from Port C peripheral
   input  wire [3:0]       lisa_portc_dir_i,    // Port C direction register
   output wire [3:0]       lisa_portc_o,        // Inputs to Port C peripheral

   // UART signals
   input  wire             baud_ref,            // Baud rate reference clock
   input  wire             debug_tx,            // The UART TX data
   output wire             debug_rx,            // RX data to debugger from active input

   // I2C - can be muxed on uio[5:4]
   output wire             scl_pad_i,
   input  wire             scl_pad_o,
   input  wire             scl_padoen_o,
   output wire             sda_pad_i,
   input  wire             sda_pad_o,
   input  wire             sda_padoen_o
);
   // Mux control and routing signals
   wire [1:0]              out_mux_sel[7:0];    // Output mux selection per output
   wire [7:0]              out_mux;             // Latched output from reg_table
   wire [7:0]              out_default;         // Default (MUX 0) outputs
   wire [7:0]              periph_sel1;         // Peripheral select 1
   wire [7:0]              periph_sel2;         // Peripheral select 2
   reg  [7:0]              s_uio_out;
   reg  [7:0]              s_uio_oe;

   // CE latch signals
   wire                    ce_latch;
   wire                    ce_latch_n;
   reg  [1:0]              ce_last;
   reg  [1:0]              ce_last_n;
   reg  [1:0]              last_mux;
   reg  [1:0]              last_mux_n;
   wire                    custom_pmod;

   // ==========================================================================
   // Assign SPI signals
   // ==========================================================================
   assign sio0_si_mosi_i = uio_in[1];
   assign sio1_so_miso_i = uio_in[2];
   assign sio2_i         = uio_in[6];
   assign sio3_i         = uio_in[7];

   // ==========================================================================
   // Assign the RX receive pin
   // ==========================================================================
   assign debug_rx = rx_sel == 2'h1 ? rx1 :           // Input from RP2040
                     rx_sel == 2'h2 ? rx2 :           // Input from PMOD UART
                     rx_sel == 2'h3 ? rx3 :           // Input from PMOD Custom board
                     1'b1;                            // No RX data

`ifdef WANT_UART2
   // UART2 signals
   assign uart2_rx = out_mux_sel[0] == 2'h2 ? ui_in[0] : 
                     out_mux_sel[1] == 2'h2 ? ui_in[1] :
                     out_mux_sel[2] == 2'h2 ? ui_in[2] :
                     1'b1;
`endif

   // ==========================================================================
   // Generate output pin MUX for each output pin
   // ==========================================================================
   generate
   for (genvar i = 0; i < 8; i = i + 1)
   begin: GEN_MUX_OUT
      assign out_mux_sel[i] = output_mux_bits[2*(i+1)-1 -: 2];
      if (i == 4)
      begin : GEN_OUT4
      assign out_mux[i] = (out_mux_sel[i] == 2'h0 || rx_sel == 2'h1) ? out_default[i] :
                          out_mux_sel[i] == 2'h1 ? lisa_portb_i[i] :
                          out_mux_sel[i] == 2'h2 ? periph_sel1[i] :
                                                   periph_sel2[i];
      end
      else
      begin : GEN_OTHERS
      assign out_mux[i] = out_mux_sel[i] == 2'h0 ? out_default[i] :
                          out_mux_sel[i] == 2'h1 ? lisa_portb_i[i] :
                          out_mux_sel[i] == 2'h2 ? periph_sel1[i] :
                                                   periph_sel2[i];
      end
   end
   endgenerate

   // Assign default outputs
   assign out_default[0] = baud_ref;
   assign out_default[3:1] = ena ? uio_in[3:1] : 4'h0;
   assign out_default[4] = rx_sel == 2'h1 ? debug_tx : 1'b1;
   assign out_default[7:5] = 3'h0;

   // Assign peripheral select 1 signals
`ifdef WANT_UART2
   assign periph_sel1[0] = uart2_tx;
   assign periph_sel1[1] = uart2_tx;
   assign periph_sel1[2] = uart2_tx;
`else
   assign periph_sel1[0] = 1'b0;
   assign periph_sel1[1] = 1'b0;
   assign periph_sel1[2] = 1'b0;
`endif
   assign periph_sel1[3] = 1'b0;
   assign periph_sel1[4] = rx_sel == 2'h1 ? debug_tx : 1'b1;
   assign periph_sel1[5] = 1'b0;
   assign periph_sel1[6] = 1'b0;
   assign periph_sel1[7] = 1'b0;

   // Assign peripheral select 2 signals
   assign periph_sel2[0] = 1'b0;
   assign periph_sel2[1] = 1'b0;
   assign periph_sel2[2] = 1'b0;
   assign periph_sel2[3] = 1'b0;
   assign periph_sel2[4] = rx_sel == 2'h1 ? debug_tx : 1'b0;
   assign periph_sel2[5] = 1'b0;
   assign periph_sel2[6] = 1'b0;
   assign periph_sel2[7] = 1'b0;

   // ==============================================================
   // Assign final output pins from the generated MUXes
   // ==============================================================
   assign uo_out = out_mux;

   // ==============================================================
   // Assign the Lisa Port A inputs from the Tiny Tapeout inputs
   // ==============================================================
   assign lisa_porta_o = ui_in;
   assign lisa_portc_o = uio_in[7:4];

   // Assign uio_out signals
   assign uio_out[4:0] = s_uio_out[4:0];
   assign uio_out[5]   = (rx_sel == 2'h2 || rx_sel == 2'h3) ? debug_tx : s_uio_out[5];
   assign uio_out[7:6] = s_uio_out[7:6];

   // Assign uio_oe signals
   assign uio_oe[3:0] = s_uio_oe[3:0];
   assign uio_oe[4]   = rx_sel == 2'h3 ? 1'b0 : s_uio_oe[4];
   assign uio_oe[5]   = (rx_sel == 2'h2 || rx_sel == 2'h3) ? 1'b1 : s_uio_oe[5];
   assign uio_oe[6]   = rx_sel == 2'h2 ? 1'b0 : s_uio_oe[6];
   assign uio_oe[7]   = s_uio_oe[7];

   // Assign uio_out data

   always @*
   begin
      s_uio_out[0] = custom_pmod ? ce_latch & ce_latch_n : ce[0];
      s_uio_out[1] = ce_latch ? ce[0] : sio0_si_mosi_o;
      s_uio_out[2] = ce_latch ? ce[1] : sio1_so_miso_o;
      s_uio_out[3] = sclk;

      // UIO bit 4
      case (io_mux_bits[1:0])
         2'h1:    s_uio_out[4] = lisa_portc_i[0];
         2'h2:    s_uio_out[4] = scl_pad_o;
         2'h3:    s_uio_out[4] = ce[1];
         default: s_uio_out[4] = 1'b0;
      endcase

      // UIO bit 5
      case (io_mux_bits[3:2])
         2'h1:    s_uio_out[5] = lisa_portc_i[1];
         2'h2:    s_uio_out[5] = sda_pad_o;
         2'h3:    s_uio_out[5] = 1'b0;
         default: s_uio_out[5] = 1'b0;
      endcase

      // UIO bit 6
      case (io_mux_bits[5:4])
         2'h0:    s_uio_out[6] = scl_pad_o;
         2'h1:    s_uio_out[6] = lisa_portc_i[2];
         2'h2:    s_uio_out[6] = sio2_o;
         2'h3:    s_uio_out[6] = sio2_o;
      endcase

      // UIO bit 7
      case (io_mux_bits[7:6])
         2'h0:    s_uio_out[7] = sda_pad_o;
         2'h1:    s_uio_out[7] = lisa_portc_i[3];
         2'h2:    s_uio_out[7] = sio3_o;
         2'h3:    s_uio_out[7] = sio3_o;
      endcase
   end

   // Assign uio_oe Output Enables
   always @*
   begin
      s_uio_oe[0] = 1'b1;                // CE[0]
      s_uio_oe[1] = ce_latch ? 1'b1 : sio_oe[0];           // MOSI
      s_uio_oe[2] = ce_latch ? 1'b1 : sio_oe[1];           // MOSI
      s_uio_oe[3] = 1'b1;                // SCLK

      // UIO bit 4
      case (io_mux_bits[1:0])
         2'h1:    s_uio_oe[4] = lisa_portc_dir_i[0];
         2'h2:    s_uio_oe[4] = scl_padoen_o;
         2'h3:    s_uio_oe[4] = 1'b1;  // CE[1]
         default: s_uio_oe[4] = 1'b0;
      endcase

      // UIO bit 5
      case (io_mux_bits[3:2])
         2'h1:    s_uio_oe[5] = lisa_portc_dir_i[1];
         2'h2:    s_uio_oe[5] = sda_padoen_o;
         2'h3:    s_uio_oe[5] = 1'b0;
         default: s_uio_oe[5] = 1'b0;
      endcase

      // UIO bit 6
      case (io_mux_bits[5:4])
         2'h0:    s_uio_oe[6] = scl_padoen_o;
         2'h1:    s_uio_oe[6] = lisa_portc_dir_i[2];
         2'h2:    s_uio_oe[6] = sio_oe[2];            // DQ2
         2'h3:    s_uio_oe[6] = sio_oe[2];
      endcase

      // UIO bit 7
      case (io_mux_bits[7:6])
         2'h0:    s_uio_oe[7] = sda_padoen_o;
         2'h1:    s_uio_oe[7] = lisa_portc_dir_i[3];
         2'h2:    s_uio_oe[7] = sio_oe[3];            // DQ3
         2'h3:    s_uio_oe[7] = sio_oe[3];
      endcase
   end

   // ==========================================================================
   // Assign I2C inputs
   // ==========================================================================
   assign scl_pad_i = io_mux_bits[1:0] == 2'h2 ? uio_in[4] :
                      io_mux_bits[5:4] == 2'h0 ? uio_in[6] :
                      1'b1;
   assign sda_pad_i = io_mux_bits[3:2] == 2'h2 ? uio_in[5] :
                      io_mux_bits[7:6] == 2'h0 ? uio_in[7] :
                      1'b1;

   // ==============================================================
   // Generate logic for latching CE outputs for custom PMOD
   // ==============================================================
   always @(posedge clk)
      if (~rst_n)
      begin
         ce_last  <= 2'h3;
         last_mux <= 2'h0;
      end
      else
      begin
         ce_last <= ce;
         last_mux <= io_mux_bits[7:6];
      end

   // ==============================================================
   // Generate logic for latching CE outputs for custom PMOD
   // ==============================================================
   always @(negedge clk)
      if (~rst_n)
      begin
         ce_last_n  <= 2'h3;
         last_mux_n <= 2'h0;
      end
      else
      begin
         ce_last_n <= ce;
         last_mux_n <= io_mux_bits[7:6];
      end
   assign ce_latch_n = custom_pmod && (ce_last_n != ce || io_mux_bits[7:6] != last_mux_n);

   assign custom_pmod = io_mux_bits[7:6] == 2'h3;
   assign ce_latch    = custom_pmod && (ce != ce_last || io_mux_bits[7:6] != last_mux);

endmodule // lisa_io_mux

