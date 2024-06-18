// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
==============================================================================
debug_ctrl.v:  Little ISA (LISA) UART debug controller.

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

/*
==========================================================================================
 Debugger command syntax:

 General Control
       v      - Report version of debugger

 CPU Register access
       rhh     - Read CPU register identified by h
       whhvvvv - Write CPU register h with value vvvv (hex value)

 CPU Control
       r000001 - Halt CPU
       r000002 - Resume CPU operation (Go)
       t       - Reset CPU
       l       - Give Lisa core the UART
       +++     - Claim the UART (requires 0.5s guard time)

 All commands must be terminated with \n character
==========================================================================================
*/

module debug_ctrl
(
   input  wire                clk,
   input  wire                rst_n,
   input  wire                rst_async_n,

   // Debug UART signals
   input  wire                debug_rx,
   output wire                debug_tx,

   // List core debug interface signals
   output wire [7:0]          debug_a,
   output wire [15:0]         debug_dout,
   input  wire [15:0]         debug_din,
   output wire                debug_wr,
   output wire                debug_rd,
   output wire                debug_reset,
   input  wire                debug_halted,
   input  wire                debug_ready,

   input  wire                brg_wr,
   input  wire [7:0]          brg_div,

   input  wire                baud_set,
   input  wire [6:0]          baud_div,
   output wire                baud_ref,

   // Signals to connect UART to Lisa
   input  wire [3:0]          plus_guard_time,
   input  wire [7:0]          lisa_tx_d,
   input  wire                lisa_tx_wr,
   input  wire                lisa_rx_rd,
   output wire [7:0]          lisa_rx_d,
   output wire                lisa_rx_data_avail,
   output wire                lisa_tx_buf_empty
);

//   parameter ASCII_BEL     = 8'b00000111;
   parameter ASCII_LF      = 8'b00001010;
   parameter ASCII_CR      = 8'b00001101;
//   parameter ASCII_sp      = 8'b00100000;
   parameter ASCII_dp      = 8'b00101110;
   parameter ASCII_PLUS    = 8'b00101011;
   parameter ASCII_0       = 8'b00110000;
   parameter ASCII_1       = 8'b00110001;
   parameter ASCII_2       = 8'b00110010;
   parameter ASCII_3       = 8'b00110011;
   parameter ASCII_4       = 8'b00110100;
   parameter ASCII_5       = 8'b00110101;
   parameter ASCII_6       = 8'b00110110;
   parameter ASCII_7       = 8'b00110111;
   parameter ASCII_8       = 8'b00111000;
   parameter ASCII_9       = 8'b00111001;
   parameter ASCII_a       = 8'b01100001;
   parameter ASCII_b       = 8'b01100010;
   parameter ASCII_c       = 8'b01100011;
   parameter ASCII_d       = 8'b01100100;
   parameter ASCII_e       = 8'b01100101;
   parameter ASCII_f       = 8'b01100110;
//   parameter ASCII_g       = 8'b01100111;
//   parameter ASCII_h       = 8'b01101000;
   parameter ASCII_i       = 8'b01101001;
//   parameter ASCII_j       = 8'b01101010;
//   parameter ASCII_k       = 8'b01101011;
   parameter ASCII_l       = 8'b01101100;
//   parameter ASCII_m       = 8'b01101101;
//   parameter ASCII_n       = 8'b01101110;
//   parameter ASCII_o       = 8'b01101111;
//   parameter ASCII_p       = 8'b01110000;
//   parameter ASCII_q       = 8'b01110001;
   parameter ASCII_r       = 8'b01110010;
   parameter ASCII_s       = 8'b01110011;
   parameter ASCII_t       = 8'b01110100;
//   parameter ASCII_u       = 8'b01110101;
   parameter ASCII_v       = 8'b01110110;
   parameter ASCII_w       = 8'b01110111;
//   parameter ASCII_x       = 8'b01111000;
//   parameter ASCII_y       = 8'b01111001;
//   parameter ASCII_z       = 8'b01111010;

   parameter st_reset            = 4'd0;
   parameter st_idle             = 4'd1;
   parameter st_parse_cmd        = 4'd2;
   parameter st_flush            = 4'd3;
   parameter st_read_arg         = 4'd4;
   parameter st_await_lf         = 4'd5;
   parameter st_rx_read_delay    = 4'd6;
   parameter st_proc_cmd         = 4'd7;
   parameter st_debug_hold       = 4'd8;
   parameter st_txhex_string     = 4'd9;
   parameter st_txhex_lf         = 4'd10;
   parameter st_txhex_cr         = 4'd11;
   parameter st_write_tx         = 4'd12;
   parameter st_send_ver         = 4'd13;
   parameter st_read_reg_strobe  = 4'd14;
   parameter st_read_reg         = 4'd15;

   // LISA debugger version info
   wire  [7:0]   s_ver[7:0];

   assign   s_ver[7] = ASCII_l;
   assign   s_ver[6] = ASCII_i;
   assign   s_ver[5] = ASCII_s;
   assign   s_ver[4] = ASCII_a;
   assign   s_ver[3] = ASCII_v;
   assign   s_ver[2] = ASCII_1;
   assign   s_ver[1] = ASCII_dp;
   assign   s_ver[0] = ASCII_2;

   reg   [3:0]    s_reset_count;
   reg   [23:0]   s_guard_count;
   reg   [1:0]    s_plus_count;
   reg            s_lisa_has_uart;
   reg            s_lisa_uart_grant;
   reg            s_lisa_rx_avail;
   reg            s_last_rx_avail;

   // Define the RS232 interface signals
   wire           s_uart_rx;        // Receive data in
   wire           s_uart_tx;        // Transmit data out
   wire           s_baud_ref;       // Transmit data out
   wire           s_baud_set;       // Strobe to set baud rate
   wire           s_rx_data_avail;  // RX data avail detect
   reg            s_rx_rd;          // RX rd signal
   wire   [7:0]   s_rx_d;          
   reg            s_tx_wr;          // TX write signal
   reg    [7:0]   s_tx_d;
   wire           s_tx_wr_c;        // Combination of Debug & Lisa WR
   wire   [7:0]   s_tx_d_c;         // Combination of Debug & Lisa TX Data
   wire           s_tx_buf_empty;   // TX buffer empty

   // Lisa Debug interface signals
   wire   [15:0]  s_debug_din;
   reg            s_debug_wr;
   reg            s_debug_rd;
   reg            s_debug_reset;
   reg            s_last_debug_halted;

   // State control registers
   reg    [3:0]   s_state;
   reg    [3:0]   s_after_state;
   reg    [7:0]   s_debug_cmd;
   reg    [23:0]  s_debug_arg;

   // Signals for sending/receiving HEX nibbles
   reg    [2:0]   s_t_len;
   reg    [3:0]   s_atoh;
   wire   [3:0]   s_htoa_val;
   reg    [7:0]   s_htoa;

   // ===================================================================
   // Create an ASCII to hex conversion
   // ===================================================================
   always @*
   begin
      s_atoh = 4'h0;
      case (s_rx_d)
         ASCII_0: s_atoh = 4'h0;
         ASCII_1: s_atoh = 4'h1;
         ASCII_2: s_atoh = 4'h2;
         ASCII_3: s_atoh = 4'h3;
         ASCII_4: s_atoh = 4'h4;
         ASCII_5: s_atoh = 4'h5;
         ASCII_6: s_atoh = 4'h6;
         ASCII_7: s_atoh = 4'h7;
         ASCII_8: s_atoh = 4'h8;
         ASCII_9: s_atoh = 4'h9;
         ASCII_a: s_atoh = 4'hA;
         ASCII_b: s_atoh = 4'hB;
         ASCII_c: s_atoh = 4'hC;
         ASCII_d: s_atoh = 4'hD;
         ASCII_e: s_atoh = 4'hE;
         ASCII_f: s_atoh = 4'hF;
         default: s_atoh = 4'h0;
      endcase
   end

   // ===================================================================
   // Create an ASCII to hex conversion
   // ===================================================================
   always @*
   begin
      case (s_htoa_val)
         4'h0: s_htoa = ASCII_0;
         4'h1: s_htoa = ASCII_1;
         4'h2: s_htoa = ASCII_2;
         4'h3: s_htoa = ASCII_3;
         4'h4: s_htoa = ASCII_4;
         4'h5: s_htoa = ASCII_5;
         4'h6: s_htoa = ASCII_6;
         4'h7: s_htoa = ASCII_7;
         4'h8: s_htoa = ASCII_8;
         4'h9: s_htoa = ASCII_9;
         4'hA: s_htoa = ASCII_a;
         4'hB: s_htoa = ASCII_b;
         4'hC: s_htoa = ASCII_c;
         4'hD: s_htoa = ASCII_d;
         4'hE: s_htoa = ASCII_e;
         4'hF: s_htoa = ASCII_f;
      endcase
   end

   assign s_htoa_val = s_debug_arg[15:12];

   // ===================================================================
   // Connect the Debug UART signals
   // ===================================================================
   assign debug_tx  = s_uart_tx;
   assign s_uart_rx = debug_rx;

   // ===================================================================
   // Connect the debug bus signals
   // ===================================================================
   assign debug_a     = s_debug_arg[23:16];
   assign debug_dout  = s_debug_arg[15:0];
   assign debug_wr    = s_debug_wr;
   assign debug_rd    = s_debug_rd;
   assign debug_reset = s_debug_reset;
   assign s_debug_din = debug_din;

   // ===================================================================
   // State machine update process
   // ===================================================================
   always @(posedge clk or negedge rst_async_n)
   begin
      if (~rst_async_n)
      begin
         s_state             <= st_reset;
         s_rx_rd             <= 1'b0;
         s_tx_wr             <= 1'b0;
         s_debug_arg         <= 24'h0;
         s_debug_wr          <= 1'b0;
         s_debug_rd          <= 1'b0;
         s_debug_reset       <= 1'b0;
         s_lisa_uart_grant   <= 1'b0;
         s_lisa_rx_avail     <= 1'b0;
         s_last_debug_halted <= 1'b1;
         s_tx_d              <= 8'h0;
         s_t_len             <= 3'h0;
      end
      else
      begin
         case (s_state)
            // =======================================================
            // We hold the debugger for a RESET period
            // =======================================================
            st_reset:
            begin
               if (s_reset_count == 14)
               begin
                  // Goto idle state
                  s_state <= st_idle;

                  // Flush any garbage in uart
                  s_rx_rd <= 1'b1;
               end
            end

            // =======================================================
            // In idle state, simply wait for a command from the UART
            // =======================================================
            st_idle:
            begin
               // Ensure RX uart read is low
               s_rx_rd           <= 1'b0;
               s_debug_reset     <= 1'b0;
               s_lisa_uart_grant <= 1'b0;

               // Test for LISA uart RX read
               if (lisa_rx_rd)
                  s_lisa_rx_avail <= 1'b0;

               // Test for rx data
               if (s_rx_data_avail)
               begin
                  // Read data from the UART
                  s_debug_cmd   <= s_rx_d;
                  s_after_state <= s_lisa_has_uart ? st_idle : st_parse_cmd;
                  s_state       <= st_rx_read_delay;
               end
               else
               begin
                  // Test for breakpoint condition
                  if (debug_halted && !s_last_debug_halted)
                  begin
                     s_state       <= st_write_tx;
                     s_tx_d        <= ASCII_s;
                     s_after_state <= st_idle;
                  end

                  // Save last debug_halted
                  s_last_debug_halted <= debug_halted;
               end
            end

            // =======================================================
            // This state waits for an RX byte at the UART
            // =======================================================
            st_rx_read_delay:
            begin
               // Read any byte that arrives during this state
               s_rx_rd <= 1'b1;

               // Wait for rx_data_avail to go low
               if (!s_rx_data_avail)
               begin
                  s_rx_rd <= 1'b0;
                  s_state <= st_debug_hold;
                  if (s_lisa_has_uart)
                     s_lisa_rx_avail <= 1'b1;
               end
            end

            // =======================================================
            // Debug command received.  Parse it and act accordingly
            // =======================================================
            st_parse_cmd:
            begin
               case (s_debug_cmd)
                  // Test for Write CPU register command
                  ASCII_w:
                  begin
                     s_t_len <= 3'd5;
                     s_state <= st_read_arg;
                  end

                  // Test for Read register command
                  ASCII_r:
                  begin
                     s_t_len <= 3'd1;
                     s_state <= st_read_arg;
                  end

                  ASCII_CR:
                  begin
                     s_state     <= st_txhex_lf;
                  end

                  ASCII_LF:
                  begin
                     s_state     <= st_txhex_lf;
                  end

                  // Test for version report
                  ASCII_v:
                  begin
                     s_t_len <= 3'h7;
                     s_state     <= st_send_ver;
                  end

                  // Test for reset command
                  ASCII_t:
                  begin
                     s_debug_reset <= 1'b1;
                     s_state       <= st_idle;
                  end

                  // Test for Lisa UART grant
                  ASCII_l:
                  begin
                     s_lisa_uart_grant <= 1'b1;
                     s_state     <= st_idle;
                  end

                  default:
                  begin
                     s_debug_arg  <= 24'h0;
                     s_state      <= st_flush;
                  end
               endcase
            end

            // =======================================================
            // Read bytes of argument length s_t_len
            // =======================================================
            st_read_arg:
            begin
               // Wait for data from UART RX
               if (s_rx_data_avail)
               begin
                  // Go to process the read
                  s_state <= st_rx_read_delay;

                  // Test if at last byte of argument
                  if (s_t_len == 3'h0)
                     s_after_state <= st_await_lf;
                  else
                  begin
                     // Not at last byte ... decrement count
                     s_after_state <= st_read_arg;
                     s_t_len <= s_t_len - 1;
                  end

                  // Convert data to HEX nibble and store in shift reg
                  s_debug_arg[3:0] <= s_atoh;
                  s_debug_arg[23:4] <= s_debug_arg[19:0];
               end
            end

            // =======================================================
            // Wait for LF and then process the request
            // =======================================================
            st_await_lf:
            begin
               // Wait for data from UART RX
               if (s_rx_data_avail)
               begin
                  // Command received.  Go process it
                  s_rx_rd       <= 1'b1;
                  s_state       <= st_debug_hold;
                  s_after_state <= st_proc_cmd;
               end
            end

            // =======================================================
            // Process the received debugger command
            // =======================================================
            st_proc_cmd:
            begin
               // Drop the RX read signal
               s_rx_rd <= 1'b0;

               // Process the command ... EOL has been received
               case (s_debug_cmd)
                  // Write CPU Register command
                  ASCII_w:
                  begin
                     // The s_debug_reg contains {ADDR, DATA}
                     s_debug_wr    <= 1'b1;
                     s_state       <= st_debug_hold;
                     s_after_state <= st_idle;
                  end

                  // Read CPU Register command
                  ASCII_r:
                  begin
                     // Move the address to upper s_debug_arg bits
                     s_debug_arg[23:16] <= s_debug_arg[7:0];
                     s_state   <= st_read_reg_strobe;
                  end
                      
                  default:
                     s_state <= st_idle;
               endcase
            end

            // =======================================================
            // Delay to account for Lisa decode states
            // =======================================================
            st_debug_hold:
            begin
               if (s_debug_wr)
               begin
                  if (debug_ready)
                  begin
                     s_debug_wr <= 1'b0;
                     s_state    <= s_after_state;
                  end
               end
               else
               begin
                  s_debug_rd <= 1'b0;
                  s_tx_wr    <= 1'b0;
                  s_rx_rd    <= 1'b0;
                  s_state    <= s_after_state;
               end

               // Test for Lisa RX read in this state
               if (s_lisa_rx_avail && lisa_rx_rd)
                  s_lisa_rx_avail <= 1'b0;
            end

            // Flush RX until CR detected
            st_flush:
            begin
               if (s_rx_data_avail)
               begin
                  // Read the next byte
                  s_rx_rd <= 1'b1;

                  // Test for CR or LF
                  if (s_rx_d == ASCII_CR || s_rx_d == ASCII_LF)
                     s_state <= st_idle;
               end
               else
                  s_rx_rd <= 1'b0;
            end

            // =======================================================
            // Transmit byte in htoa register
            // =======================================================
            st_txhex_string:
            begin
               // Wait for TX to be ready
               if (s_tx_buf_empty)
               begin
                  // Latch the HEX data
                  s_tx_d <= s_htoa;

                  // Shift next nibble into place
                  s_debug_arg[23:4] <= s_debug_arg[19:0];

                  // Go to write state
                  s_state <= st_write_tx;         
                  if (s_t_len == 3'h0)
                     s_after_state <= st_txhex_lf;
                  else
                  begin
                     s_after_state <= st_txhex_string;
                     s_t_len <= s_t_len - 1;
                  end
               end
            end

            // Send trailing LF
            st_txhex_lf:
            begin
                // Wait for TX to be ready
                if (s_tx_buf_empty)
                begin
                   s_tx_d        <= ASCII_LF;
                   s_state       <= st_write_tx;
                   s_after_state <= st_txhex_cr;
                end
            end

            // Send trailing CR
            st_txhex_cr:
            begin
               // Wait for TX to be ready
               if (s_tx_buf_empty)
               begin
                   s_tx_d <= ASCII_CR;
                   s_state <= st_write_tx;
                   s_after_state <= st_idle;
               end
            end

            // TX data byte loaded.  Now toggle write line
            st_write_tx:
            begin
               s_tx_wr <= 1'b1;
               s_state <= st_debug_hold;
            end

            // Read CPU register strobe
            st_read_reg_strobe:
            begin
               s_debug_rd <= 1'b1;
               s_state <= st_read_reg;
            end

            // Read CPU REG send MSB nibble
            st_read_reg:
            begin
               if (debug_ready)
               begin
                  s_debug_rd <= 1'b0;

                  // Setup 1 byte string TX
                  s_debug_arg[15:0] <= s_debug_din;
                  s_t_len  <= 3'h3;
                  s_state  <= st_txhex_string;
               end
            end

            // Send version information
            st_send_ver:
            begin
               if (s_tx_buf_empty)
               begin
                   s_tx_d  <= s_ver[s_t_len];
                   s_state <= st_write_tx;

                   if (s_t_len == 3'h0)
                      s_after_state <= st_txhex_lf;
                   else
                   begin
                      s_t_len <= s_t_len - 1;
                      s_after_state <= st_send_ver;
                   end
               end
            end
         endcase
       end
   end

   // ===================================================================
   // Reset state counter
   // ===================================================================
   always @(posedge clk or negedge rst_async_n)
   begin
      if (~rst_async_n)
         s_reset_count <= 0;
      else
      begin
         if (s_reset_count != 14)
            s_reset_count <= s_reset_count + 1;
      end
   end

   // ===================================================================
   // Create a RX8N Uart Receiver module for Debug interface
   // ===================================================================
   lisa_rx8n i_lisa_rx8n
   (
       .clk        ( clk             ),   // Connect sample clock
       .rst_n      ( rst_n           ),   // Connect the reset signal
       .baud_ref   ( s_baud_ref      ),   // Baud rate reference
       .rxd        ( s_uart_rx       ),   // Connect the rx data
       .rd         ( s_rx_rd         ),   // Connect the rd signal
       .data_avail ( s_rx_data_avail ),   // Connect data avail signal
       .d          ( s_rx_d          )    // Connect the data
   );

   // ===================================================================
   // Create a TX8N  Uart Transmitter module for Debug interface
   // ===================================================================
   lisa_tx8n i_lisa_tx8n
   (
       .clk       ( clk            ),  // Connect clock
       .rst_n     ( rst_n          ),  // Connect the reset signal
       .baud_ref  ( s_baud_ref     ),  // Baud rate reference
       .txd       ( s_uart_tx      ),  // Connect the TX data
       .wr        ( s_tx_wr_c      ),  // Connect the tx write signal
       .d         ( s_tx_d_c       ),  // Connect the data
       .buf_empty ( s_tx_buf_empty )   // Connect the buf empty signal
   );

   // ===================================================================
   // Create a baud rate generator
   // ===================================================================
   debug_brg i_debug_brg
   (
       .clk      ( clk        ),       // Connect clock
       .rst_n    ( rst_n      ),       // Connect the reset signal
       .wr       ( brg_wr     ),       // Connect the tx write signal
       .d        ( brg_div    ),       // Connect the data
       .baud_set ( s_baud_set ),
       .baud_div ( baud_div   ),
       .baud_ref ( s_baud_ref )        // Baud rate reference
   );

   assign baud_ref = s_baud_ref;
   assign s_baud_set = baud_set & (s_reset_count == 4'h8);

   // ===================================================================
   // UART sharing guard timer
   // ===================================================================
   always @(posedge clk or negedge rst_async_n)
   begin
      if (~rst_async_n)
      begin
         s_guard_count   <= 24'h0;
         s_lisa_has_uart <= 1'b0;
         s_plus_count    <= 2'h0;
         s_last_rx_avail <= 1'b0;
      end
      else
      begin
         // Test for UART grant
         if (s_lisa_uart_grant)
            s_lisa_has_uart <= 1'b1;

         // Test for Lisa UART revocation
         else if (s_guard_count == 24'h1 && s_plus_count == 2'h3)
            s_lisa_has_uart <= 1'b0;

         // Test for any received data on RX
         if (s_last_rx_avail)
            // Re-load the guard count
            s_guard_count <= {plus_guard_time, 20'hFFFFF};
         else
         begin
            // Test if guard count needs to be decremented
            if (s_guard_count != 0)
               // Decrement the guard count
               s_guard_count <= s_guard_count - 24'h1;

            // Test for new data arrival
            if (s_rx_data_avail && !s_last_rx_avail)
            begin
               // Test for '+' character
               if (s_rx_d == ASCII_PLUS)
               begin
                  // Test for receipt of '+'
                  if (s_guard_count == 24'h0 || s_plus_count != 0)
                  begin
                     // Increment the plus count
                     s_plus_count <= s_plus_count + 2'h1;
                  end
               end
               else
               begin
                  // Reset the plus count
                  s_plus_count <= 2'h0;
               end

               // Test for 'l' command while in debugger mode
               if (!s_lisa_has_uart && s_rx_d == ASCII_l &&
                     s_state == st_parse_cmd)
               begin
                  s_lisa_has_uart <= 1'b1;
               end
            end
         end

         s_last_rx_avail <= s_rx_data_avail;
      end
   end

   assign lisa_rx_data_avail = s_lisa_rx_avail;
   assign lisa_rx_d          = s_debug_cmd;
   assign lisa_tx_buf_empty  = s_tx_buf_empty & s_lisa_has_uart;
   assign s_tx_wr_c          = s_lisa_has_uart ? lisa_tx_wr : s_tx_wr;
   assign s_tx_d_c           = s_lisa_has_uart ? lisa_tx_d  : s_tx_d;

   /*
   ila_1 i_ila_1
   (
       .clk     ( clk ),
       .probe0  ( s_lisa_has_uart ),
       .probe1  ( s_last_rx_avail ),
       .probe2  ( s_guard_count[7:0] ),
       .probe3  ( s_plus_count ),
       .probe4  ( s_rx_d ),
       .probe5  ( s_rx_data_avail ),
       .probe6  ( s_tx_d_c ),
       .probe7  ( s_tx_wr_c ),
       .probe8  ( s_debug_din ),
       .probe9  ( s_debug_dout ),
       .probe10 ( debug_ready )
   );
   */

endmodule

