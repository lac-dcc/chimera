// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
==============================================================================
lisa_periph.v:  Little ISA (LISA) peripherals.

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

`define TIMER2
`define WANT_UART2

/*
==========================================================================================
lisa_periph:   A peripheral controller for the lisa core.

Address Map:

   GPIO
   ====
   0x00:       PORT A input
   0x01:       PORT B output
   0x02:       PORT C input / output
   0x03:       PORT C direction (1 = output)

   TIMER
   =====
   0x08:       Pre Divisor Low
   0x09:       Pre Divisor High
   0x0A:       Divisor Low
   0x0B:       Divisor High
   0x0C:       Control / Status
   0x0D:       Timer tick

   UART
   ====
   0x10:       TX/RX register
   0x11:       Status register

   I2C
   ====
   0x20:       CLOCK PRE div LSB register
   0x21:       CLOCK PRE div MSB register
   0x22:       CTRL
   0x23:       RX
   0x24:       STATUS
   0x25:       TX
   0x26:       CMD

==========================================================================================
*/
module lisa_periph
(
   input                clk,
   input                rst_n,
`ifdef WANT_UART2
   input                rst_async_n,
`endif

   // UART access
   input  [6:0]         d_addr,
   input  [7:0]         d_i,
   input                d_periph,
   input                d_we,
   input                d_rd,
   output wire [7:0]    d_o,

   // GPIO
   input  wire [7:0]    porta_in,
   output reg  [7:0]    portb,
   output reg  [3:0]    portc,
   input  wire [3:0]    portc_in,
   output reg  [3:0]    portc_dir,

   // UART
   output wire [7:0]    uart_tx_d,
   output wire          uart_tx_wr,
   output wire          uart_rx_rd,
   input  wire [7:0]    uart_rx_d,
   input  wire          uart_rx_data_avail,
   input  wire          uart_tx_buf_empty,

`ifdef WANT_UART2
   // UART 2
   input  wire          uart2_rx,
   output wire          uart2_tx,
`endif

   // I2C
   input  wire          scl_pad_i,
   output wire          scl_pad_o,
   output wire          scl_padoen_o,
   input  wire          sda_pad_i,
   output wire          sda_pad_o,
   output wire          sda_padoen_o
);

   reg   [15:0]         ms_count;
   reg   [15:0]         ms_prediv;
   reg   [15:0]         ms_preload;
   reg   [15:0]         ms_timer;
   reg   [7:0]          ms_tick;
   reg                  ms_enable;
   reg                  ms_rollover;

`ifdef TIMER2
   reg   [15:0]         ms2_count;
   reg   [15:0]         ms2_prediv;
   reg   [15:0]         ms2_preload;
   reg   [15:0]         ms2_timer;
   reg   [7:0]          ms2_tick;
   reg                  ms2_enable;
   reg                  ms2_rollover;
`endif

   wire  [3:0]          portc_read;
   reg   [7:0]          d_o_r;
   wire  [7:0]          i2c_d_o;
   wire                 sda_oen_n;
   wire                 scl_oen_n;

`ifdef WANT_UART2
   // UART
   wire [7:0]    uart2_tx_d;
   wire          uart2_tx_wr;
   wire          uart2_rx_rd;
   wire [7:0]    uart2_rx_d;
   wire          uart2_rx_data_avail;
   wire          uart2_tx_buf_empty;
   wire          uart2_brg_wr;
   wire [7:0]    uart2_brg_d;
   reg           uart2_autobaud_disable;
`endif

   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         portb       <= 8'h00;
         portc       <= 4'h00;
         portc_dir   <= 4'h0;
         ms_prediv   <= 16'd29494;
         ms_count    <= 16'h0;
         ms_timer    <= 16'h0;
         ms_preload  <= 16'h0;
         ms_tick     <= 8'h0;
         ms_enable   <= 1'h0;
         ms_rollover <= 1'b0;
`ifdef TIMER2
         ms2_prediv   <= 16'd29494;
         ms2_count    <= 16'h0;
         ms2_timer    <= 16'h0;
         ms2_preload  <= 16'h0;
         ms2_tick     <= 8'h0;
         ms2_enable   <= 1'h0;
         ms2_rollover <= 1'b0;
`endif
`ifdef WANT_UART2
         uart2_autobaud_disable <= 1'b0;
`endif
      end
      else
      begin
         // ==============================================
         // GPIO signals
         // ==============================================
         // Latch input data as PORTB
         if (d_periph && d_we && d_addr == 7'h01)
            portb <= d_i;

         // Latch input data as PORTC
         if (d_periph && d_we && d_addr == 7'h02)
            portc <= d_i[3:0];

         // Latch input data as PORTC_DIR
         if (d_periph && d_we && d_addr == 7'h03)
            portc_dir <= d_i[3:0];

         // ==============================================
         // Timer signals
         // ==============================================
         // The control signal
         if (d_periph && d_we && d_addr == 7'h0C)
            ms_enable <= d_i[0];

         // The pre divider
         if (d_periph && d_we && d_addr == 7'h08)
            ms_prediv[7:0] <= d_i;

         // The pre divider
         if (d_periph && d_we && d_addr == 7'h09)
            ms_prediv[15:8] <= d_i;

         // The preload
         if (d_periph && d_we && d_addr == 7'h0A)
            ms_preload[7:0] <= d_i;

         // The preload
         if (d_periph && d_we && d_addr == 7'h0B)
            ms_preload[15:8] <= d_i;

         // The ms_rollover bit
         if (d_periph && 
                ((d_rd && d_addr == 7'h0C) ||
                 (d_we && d_addr == 7'h0D)))
            ms_rollover <= 1'b0;
         else if (ms_count == ms_prediv && ms_timer == 16'h01)
            ms_rollover <= 1'b1;

         // Loading tick value also resets 1ms timimg
         if (d_periph && d_we && d_addr == 7'h0D)
         begin
            ms_tick <= d_i;
            ms_timer <= ms_preload;
            ms_count <= 16'h0; 
         end

         // Test if timer is enabled
         else if (ms_enable)
         begin
            // Implement a 1ms tick
            if (ms_count == ms_prediv)
            begin
               ms_count <= 16'h0; 
            
               // Count down to 1 then increment tick and load the preload
               if (ms_timer == 16'h01)
               begin
                  ms_tick <= ms_tick + 1;
                  ms_timer <= ms_preload;
               end
               else
                  ms_timer <= ms_timer - 1;
            end
            else
               ms_count <= ms_count + 16'h1;
         end
         else
         begin
            ms_tick <= 8'h0;
            ms_timer <= ms_preload;
            ms_count <= 16'h0; 
         end

`ifdef TIMER2
         // ==============================================
         // Timer2 signals
         // ==============================================
         // The control signal
         if (d_periph && d_we && d_addr == 7'h1C)
            ms2_enable <= d_i[0];

         // The pre divider
         if (d_periph && d_we && d_addr == 7'h18)
            ms2_prediv[7:0] <= d_i;

         // The pre divider
         if (d_periph && d_we && d_addr == 7'h19)
            ms2_prediv[15:8] <= d_i;

         // The preload
         if (d_periph && d_we && d_addr == 7'h1A)
            ms2_preload[7:0] <= d_i;

         // The preload
         if (d_periph && d_we && d_addr == 7'h1B)
            ms2_preload[15:8] <= d_i;

         // The ms2_rollover bit
         if (d_periph && 
                ((d_rd && d_addr == 7'h1C) ||
                 (d_we && d_addr == 7'h1D)))
            ms2_rollover <= 1'b0;
         else if (ms2_count == ms2_prediv && ms2_timer == 16'h01)
            ms2_rollover <= 1'b1;

         // Loading tick value also resets 1ms timimg
         if (d_periph && d_we && d_addr == 7'h1D)
         begin
            ms2_tick <= d_i;
            ms2_timer <= ms2_preload;
            ms2_count <= 16'h0; 
         end

         // Test if timer is enabled
         else if (ms2_enable)
         begin
            // Implement a 1ms tick
            if (ms2_count == ms2_prediv)
            begin
               ms2_count <= 16'h0; 
            
               // Count down to 1 then increment tick and load the preload
               if (ms2_timer == 16'h01)
               begin
                  ms2_tick <= ms2_tick + 1;
                  ms2_timer <= ms2_preload;
               end
               else
                  ms2_timer <= ms2_timer - 1;
            end
            else
               ms2_count <= ms2_count + 16'h1;
         end
         else
         begin
            ms2_tick <= 8'h0;
            ms2_timer <= ms2_preload;
            ms2_count <= 16'h0; 
         end
`endif
`ifdef WANT_UART2
         // UART2 autobaud disable
         if (d_periph && d_we && d_addr == 7'h13)
            uart2_autobaud_disable <= d_i[2];
`endif
      end
   end

   // ==============================================
   // The read signals
   // ==============================================
   generate
   genvar x;
   for (x = 0; x < 4; x = x + 1)
   begin
      assign portc_read[x] = portc_dir[x] ? portc[x] : portc_in[x];
   end
   endgenerate 

   always @*
   begin
      case (d_addr)
      // GPIO readback
      7'h00:   d_o_r = porta_in;
      7'h01:   d_o_r = portb;
      7'h02:   d_o_r = {4'h0, portc_read};
      7'h03:   d_o_r = {4'h0, portc_dir};

      // Timer readback
      7'h08:   d_o_r = ms_prediv[7:0];
      7'h09:   d_o_r = ms_prediv[15:8];
      7'h0A:   d_o_r = ms_preload[7:0];
      7'h0B:   d_o_r = ms_preload[15:8];
      7'h0C:   d_o_r = { ms_rollover, 6'h0, ms_enable};
      7'h0D:   d_o_r = ms_tick;

      // UART read
      7'h10:   d_o_r = uart_rx_d;
      7'h11:   d_o_r = {6'h0, uart_tx_buf_empty, uart_rx_data_avail};

`ifdef WANT_UART2
      // UART2 read
      7'h12:   d_o_r = uart2_rx_d;
      7'h13:   d_o_r = {5'h0, uart2_autobaud_disable, uart2_tx_buf_empty, uart2_rx_data_avail};
`endif

      // Timer2 readback
`ifdef TIMER2
      7'h18:   d_o_r = ms2_prediv[7:0];
      7'h19:   d_o_r = ms2_prediv[15:8];
      7'h1A:   d_o_r = ms2_preload[7:0];
      7'h1B:   d_o_r = ms2_preload[15:8];
      7'h1C:   d_o_r = { ms2_rollover, 6'h0, ms2_enable};
      7'h1D:   d_o_r = ms2_tick;
`endif

      default: d_o_r = 8'h00;
      endcase
   end

   // ==============================================
   // UART read / write controls
   // ==============================================
   assign uart_tx_wr = d_periph && d_we && d_addr == 7'h10;
   assign uart_rx_rd = d_periph && d_rd && d_addr == 7'h10;
   assign uart_tx_d  = d_i;

`ifdef WANT_UART2
   assign uart2_tx_wr = d_periph && d_we && d_addr == 7'h12;
   assign uart2_rx_rd = d_periph && d_rd && d_addr == 7'h12;
   assign uart2_tx_d  = d_i;
   assign uart2_brg_wr= d_periph && d_rd && d_addr == 7'h14;
   assign uart2_brg_d = d_i;
`endif

   // ==============================================
   // Instantiate I2C master
   // ==============================================
   lisa_i2c i_lisa_i2c
   (
      .clk          ( clk          ),
      .rst_n        ( rst_n        ),
      .d_addr       ( d_addr       ),
      .d_i          ( d_i          ),
      .d_periph     ( d_periph     ),
      .d_we         ( d_we         ),
      .d_o          ( i2c_d_o      ),
      .scl_pad_i    ( scl_pad_i    ),
      .scl_pad_o    ( scl_pad_o    ),
      .scl_padoen_o ( scl_oen_n    ),
      .sda_pad_i    ( sda_pad_i    ),
      .sda_pad_o    ( sda_pad_o    ),
      .sda_padoen_o ( sda_oen_n    )
   );
   assign scl_padoen_o  = ~scl_oen_n;
   assign sda_padoen_o  = ~sda_oen_n;

   assign d_o = d_o_r | i2c_d_o;

`ifdef WANT_UART2
   lisa_uart i_lisa_uart_2
   (
      .clk              ( clk                    ),
      .rst_n            ( rst_n                  ),
      .rst_async_n      ( rst_async_n            ),
      .rx               ( uart2_rx               ),
      .tx               ( uart2_tx               ),
      .tx_d             ( uart2_tx_d             ),
      .tx_wr            ( uart2_tx_wr            ),
      .rx_rd            ( uart2_rx_rd            ),
      .rx_d             ( uart2_rx_d             ),
      .rx_data_avail    ( uart2_rx_data_avail    ),
      .tx_buf_empty     ( uart2_tx_buf_empty     ),
      .brg_wr           ( uart2_brg_wr           ),
      .brg_d            ( uart2_brg_d            ),
      .autobaud_disable ( uart2_autobaud_disable )
   );
`endif
endmodule

