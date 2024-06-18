// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
==============================================================================
lisa_uart.v:  Little ISA (LISA) dedicated UART (not shared with debug).

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

module lisa_uart
(
   input  wire          clk,
   input  wire          rst_n,
   input  wire          rst_async_n,

   // UART signals
   input  wire          rx,
   output wire          tx,

   // UART
   input  wire [7:0]    tx_d,
   input  wire          tx_wr,
   input  wire          rx_rd,
   output wire [7:0]    rx_d,
   output wire          rx_data_avail,
   output wire          tx_buf_empty,
   input  wire          brg_wr,
   input  wire [7:0]    brg_d,
   input  wire          autobaud_disable
);

   reg   [1:0] s_rx_pipe;
   wire        s_baud_ref;
   wire        s_brg_wr;
   wire  [7:0] s_brg_d;
   wire        s_auto_brg_wr;
   wire  [7:0] s_auto_brg_d;
   wire  [1:0] rx_sel;

   always @(posedge clk)
   begin
      if (~rst_n)
         s_rx_pipe <= 2'h0;
      else
         s_rx_pipe <= { s_rx_pipe[0], rx };
   end

   // ===================================================================
   // Create a RX8N Uart Receiver module for Debug interface
   // ===================================================================
   lisa_rx8n i_lisa_rx8n_2
   (
       .clk        ( clk             ),   // Connect sample clock
       .rst_n      ( rst_n           ),   // Connect the reset signal
       .baud_ref   ( s_baud_ref      ),   // Baud rate reference
       .rxd        ( s_rx_pipe[1]    ),   // Connect the rx data
       .rd         ( rx_rd           ),   // Connect the rd signal
       .data_avail ( rx_data_avail   ),   // Connect data avail signal
       .d          ( rx_d            )    // Connect the data
   );

   // ===================================================================
   // Create a TX8N  Uart Transmitter module for Debug interface
   // ===================================================================
   lisa_tx8n i_lisa_tx8n_2
   (
       .clk       ( clk            ),  // Connect clock
       .rst_n     ( rst_n          ),  // Connect the reset signal
       .baud_ref  ( s_baud_ref     ),  // Baud rate reference
       .txd       ( tx             ),  // Connect the TX data
       .wr        ( tx_wr          ),  // Connect the tx write signal
       .d         ( tx_d           ),  // Connect the data
       .buf_empty ( tx_buf_empty   )   // Connect the buf empty signal
   );

   // ===================================================================
   // Create a baud rate generator
   // ===================================================================
   debug_brg i_lisa_brg
   (
       .clk      ( clk        ),       // Connect clock
       .rst_n    ( rst_n      ),       // Connect the reset signal
       .wr       ( s_brg_wr   ),       // Connect the tx write signal
       .d        ( s_brg_d    ),       // Connect the data
       .baud_set ( 1'b0       ),
       .baud_div ( 7'h0       ),
       .baud_ref ( s_baud_ref )        // Baud rate reference
   );

   // ==========================================================================
   // Instantiate the autobaud detector
   // ==========================================================================
   debug_autobaud i_lisa_autobaud
   (
      // Timing and reset inputs
      .clk       ( clk                       ), // System clock
      .rst_n     ( rst_async_n               ), // Active low reset
      .disabled  ( autobaud_disable          ), // Disabled if set externally
      .rx1       ( s_rx_pipe[1]              ), // Input from the UART
      .rx2       ( 1'b0                      ), // Input from the UART
      .rx3       ( 1'b0                      ), // Input from the UART
      .wr        ( s_auto_brg_wr             ), // Write the baud rate
      .div       ( s_auto_brg_d              ), // The divisor
      .rx_sel    ( rx_sel                    )  // Selected RX input
   );

   assign s_brg_wr = brg_wr | s_auto_brg_wr;
   assign s_brg_d  = brg_d  | s_auto_brg_d;


endmodule

