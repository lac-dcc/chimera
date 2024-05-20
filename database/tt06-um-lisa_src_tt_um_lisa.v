// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
==============================================================================
tt_um_lisa.v:  Tiny Tapeout User Module for the LISA 8-bit processor.

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
//                          +------------------------+
//                          |     tt_um_lisa         |
//          On              |                        |
//         Reset            |ui_in             uo_out|
//           |          pa0 | 0                    0 | pb0
//           |          pa1 | 1                    1 | pb1
//     baud  |          pa2 | 2                    2 | pb2
//      div -+     rx / pa3 | 3                    3 | pb3
//           |          pa4 | 4                    4 | pb4 / tx
//           |          pa5 | 5                    5 | pb5
//           |          pa6 | 6                    6 | pb6
//           baud_set / pa7 | 7                    7 | pb7 / baud_ref
//                          |                        |
//                          |                   uio  |
//                          |                      0 | cs    / ce_latch
//                          |                      1 | mosi  / dq1 / ce0
//                          |                      2 | miso  / dq2 / ce1
//                          |                      3 | sclk
//                          |                      4 | scl / rx  / portc_io[0]
//                          |                      5 | sda / tx  / portc_io[1]
//                          |                      6 | scl / dq3 / portc_io[2] / rx
//                          |                      7 | sda / dp4 / portc_io[3]
//                          |                        |
//                          +------------------------+
//
//
//   ui: Sampled at reset
//      7: HIGH to sample ui[6:0] as BAUD divider at reset and disable AutoBaud
//    6-0: When [7] is HIGH at reset, sets the UART BAUD divider.
//
// ==============================================================================

`define WANT_UART2

module tt_um_lisa
(
`ifdef USE_POWER_PINS
    input                  VPWR,
    input                  VGND,
`endif
   input   wire [7:0]      ui_in,            // Connected to the input switches
   output  wire [7:0]      uo_out,           // Connected to the 7 segment display
   input   wire [7:0]      uio_in,
   output  wire [7:0]      uio_out,
   output  wire [7:0]      uio_oe,           // BIDIR Enable (0=input, 1=output)
   
   // Control inputs
   input   wire            ena,              // Will go high when the design is enabled
   input   wire            clk,              // System clock 
   input   wire            rst_n             // Active low reset
);
   // ==========================================================================
   // Debug bus signals
   // ==========================================================================
   wire                 debug_rx;
   wire                 debug_tx;
   wire                 baud_ref;

   reg  [2:0]           rst_n_r;
   reg  [2:0]           rst_async_n_r;

   // ==========================================================================
   // I/O mux control signals
   // ==========================================================================
   wire [15:0]          output_mux_bits;     // Output select bits per output
   wire [7:0]           io_mux_bits;         // I/O select bits per BIDIR

   // ==========================================================================
   // Processor Instruction RAM bus
   // ==========================================================================
   wire   [14:0]        core_i_addr;
   wire   [15:0]        core_inst;
   wire   [15:0]        core_inst_o;
   wire                 core_inst_we;
   wire                 core_i_ready;
   wire                 core_i_fetch;

   // ==========================================================================
   // Processor DATA RAM bus
   // ==========================================================================
   wire   [14:0]        d_addr;
   wire   [7:0]         d_i;
   wire   [7:0]         d_i_cache;
   wire   [7:0]         d_i_periph;
   wire   [7:0]         d_o;
   wire                 d_we;
   wire                 d_rd;
   wire                 d_periph;
   wire                 d_valid;
   wire                 d_ready;
   wire   [31:0]        ram_do;
   wire   [31:0]        ram_di;
   wire   [3:0]         ram_we;
   wire   [4:0]         ram_a;
   wire                 ram_en;
   wire                 cache_disabled;
   wire   [1:0]         cache_map_sel;
   wire                 data_cache_flush;
   wire                 data_cache_flush_ack;
   wire                 data_cache_invalidate;
   wire                 data_cache_invalidate_ack;
   wire                 inst_cache_invalidate;
   wire                 inst_cache_invalidate_ack;

   // ==========================================================================
   // Debug signals
   // ==========================================================================
   wire   [7:0]         dbg_a;
   wire   [15:0]        dbg_di;
   wire   [15:0]        dbg_do;
   wire   [15:0]        dbg_do_lisa;
   wire   [15:0]        dbg_do_regs;
   wire                 dbg_we;
   wire                 dbg_rd;
   wire                 dbg_reset;
   wire                 dbg_ready;
   wire                 dbg_ready_lisa;
   wire                 dbg_ready_regs;
   wire                 dbg_halted;

   // ==========================================================================
   // Lisa Peripheral signals
   // ==========================================================================
   wire    [7:0]        porta_in;   
   wire    [7:0]        portb;
   wire    [3:0]        portc;
   wire    [3:0]        portc_in;
   wire    [3:0]        portc_dir;

   // ==========================================================================
   // Lisa UART signals
   // ==========================================================================
   wire    [7:0]        lisa_tx_d;
   wire    [7:0]        lisa_rx_d;
   wire                 lisa_tx_wr;
   wire                 lisa_rx_rd;
   wire                 lisa_rx_data_avail;
   wire                 lisa_tx_buf_empty;
   reg                  rx1_r1, rx1_r2;
   reg                  rx2_r1, rx2_r2;
   reg                  rx3_r1, rx3_r2;

`ifdef WANT_UART2
   wire                 uart2_rx;
   wire                 uart2_tx;
`endif

   // ==========================================================================
   // Lisa I2C
   // ==========================================================================
   wire                 scl_pad_i;
   wire                 scl_pad_o;
   wire                 scl_padoen_o;
   wire                 sda_pad_i;
   wire                 sda_pad_o;
   wire                 sda_padoen_o;

   // ==========================================================================
   // Baud rate control signals
   // ==========================================================================
   wire    [6:0]        baud_div;
   wire                 baud_set;
   wire                 brg_wr;
   wire    [7:0]        brg_div;
   wire    [1:0]        rx_sel;

   // ==========================================================================
   // QSPI Arbiter debug signals
   // ==========================================================================
   wire [23:0]          debug_addr;          // 8Mx32
   wire [15:0]          debug_rdata;         // Read data
   wire [15:0]          debug_wdata;         // Data to write
   wire [1:0]           debug_wstrb;         // Which bytes in the 32-bits to write
   wire                 debug_ready;         // Next 32-bit value is ready
   wire                 debug_ready_ack;     // Next 32-bit value is ready
   wire                 debug_valid;         // Indicates a valid request 
   wire [3:0]           debug_xfer_len;      // Number of 32-bit words to transfer
   wire [1:0]           debug_ce_ctrl;
   wire [7:0]           cmd_quad_write;
   wire                 custom_spi_cmd;
   wire [7:0]           dbg_cmd_quad_write;
   wire                 dbg_custom_spi_cmd;
   wire [3:0]           plus_guard_time;
                        
   // ==========================================================================
   // QSPI Arbiter Lisa instruction bus signals
   // ==========================================================================
   wire [23:0]          lisa1_addr;          // 8Mx32
   wire [15:0]          lisa1_rdata;         // Read data
   wire [15:0]          lisa1_wdata;         // Data to write
   wire [1:0]           lisa1_wstrb;         // Which bytes in the 32-bits to write
   wire                 lisa1_ready;         // Next 32-bit value is ready
   wire                 lisa1_ready_ack;     // Next 32-bit value is ready
   wire                 lisa1_xfer_done;     // Total xfer_len transfer is done
   wire                 lisa1_valid;         // Indicates a valid request 
   wire [3:0]           lisa1_xfer_len;      // Number of 32-bit words to transfer
   wire [1:0]           lisa1_ce_ctrl;
   wire [15:0]          lisa1_base_addr;
                        
   // ==========================================================================
   // QSPI Arbiter Lisa data bus signals
   // ==========================================================================
   wire [23:0]          lisa2_addr;          // 8Mx32
   wire [15:0]          cache_addr;          // 8Mx32
   wire [15:0]          lisa2_rdata;         // Read data
   wire [15:0]          lisa2_wdata;         // Data to write
   wire [1:0]           lisa2_wstrb;         // Which bytes in the 32-bits to write
   wire                 lisa2_ready;         // Next 32-bit value is ready
   wire                 lisa2_ready_ack;     // Next 32-bit value is ready
   wire                 lisa2_xfer_done;     // Total xfer_len transfer is done
   wire                 lisa2_valid;         // Indicates a valid request 
   wire [3:0]           lisa2_xfer_len;      // Number of 32-bit words to transfer
   wire [1:0]           lisa2_ce_ctrl;
   wire [15:0]          lisa2_base_addr;
                        
   // ==========================================================================
   // QSPI module control signals
   // ==========================================================================
   wire [23:0]          addr;                // 8Mx32
   wire [15:0]          rdata;               // Read data
   wire [15:0]          wdata;               // Data to write
   wire [1:0]           wstrb;               // Which bytes in the 32-bits to write
   wire                 ready;               // Next 32-bit value is ready
   wire                 ready_ack;           // Next 32-bit write value is ready
   wire                 xfer_done;           // Total xfer_len transfer is done
   wire                 valid;               // Indicates a valid request 
   wire [3:0]           xfer_len;            // Number of 32-bit words to transfer

   // ==========================================================================
   // Chip select controls
   // ==========================================================================
   wire [1:0]           ce_ctrl;
   wire [1:0]           addr_16b;
   wire [1:0]           is_flash;
   wire [1:0]           quad_mode;
   wire [7:0]           dummy_read_cycles;
   wire [3:0]           spi_clk_div;
   wire [6:0]           spi_ce_delay;
   wire [1:0]           spi_mode;

   // ==========================================================================
   // The QSPI I/O signals
   // ==========================================================================
   wire                 sclk;
   wire                 sio0_si_mosi_i;
   wire                 sio1_so_miso_i;
   wire                 sio2_i;
   wire                 sio3_i;
   wire                 sio0_si_mosi_o;
   wire                 sio1_so_miso_o;
   wire                 sio2_o;
   wire                 sio3_o;
   wire [3:0]           sio_oe;
   wire [1:0]           ce;
                             
   // ==========================================================================
   // Synchronous release async reset
   // ==========================================================================
   always @(posedge clk or negedge rst_n)
   begin
      if (~rst_n)
      begin
         rst_n_r <= 3'h0;
         rst_async_n_r <= 3'h0;
      end
      else
      begin
         rst_n_r <= {rst_n_r[1:0], 1'b1};
         rst_async_n_r <= {rst_async_n_r[1:0], 1'b1};
      end
   end
   
   wire [7:0]  d_o_c;
   wire [14:0] d_addr_c;
   wire        d_valid_c;
   wire        d_we_c;
   wire        d_rd_c;
   wire        d_periph_c;
   wire        d_addr_good;

   // ==========================================================================
   // Instantiate the Lisa Processor Core
   // ==========================================================================
   lisa_core i_lisa_core
   (
      .clk                       ( clk                       ),
      .rst_n                     ( rst_n_r[2]                ),
      .rst_async_n               ( rst_async_n_r[2]          ),
      .reset                     ( dbg_reset                 ),
                                                             
      // Instruction bus                                     
      .inst_i                    ( core_inst                 ),
      .inst_ready                ( core_i_ready              ),
      .i_fetch                   ( core_i_fetch              ),
      .i_addr                    ( core_i_addr               ),
      .inst_o                    ( core_inst_o               ),
      .inst_we                   ( core_inst_we              ),
                                                             
      // Data bus                                            
      .d_i                       ( d_i                       ),
      .d_o                       ( d_o_c                     ),
      .d_addr                    ( d_addr_c                  ),
      .d_periph                  ( d_periph_c                ),
      .d_we                      ( d_we_c                    ),
      .d_rd                      ( d_rd_c                    ),
      .d_valid                   ( d_valid_c                 ),
      .d_ready                   ( d_ready & d_addr_good     ),
                                                             
      // Debug bus                                           
      .dbg_a                     ( dbg_a                     ),
      .dbg_di                    ( dbg_di                    ),
      .dbg_do                    ( dbg_do_lisa               ),
      .dbg_we                    ( dbg_we                    ),
      .dbg_rd                    ( dbg_rd                    ),
      .dbg_ready                 ( dbg_ready_lisa            ),
      .dbg_halted                ( dbg_halted                )
   );

   // ==========================================================================
   // Register the LISA core data bus output to improve timing
   // ==========================================================================
   reg [7:0]  d_o_r;
   reg [14:0] d_addr_r;
   reg        d_valid_r;
   reg        d_we_r;
   reg        d_rd_r;
   reg        d_periph_r;

   assign d_addr_good = d_addr_c == d_addr_r;

   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         d_o_r       <= 8'h0;
         d_addr_r    <= 15'h0;
         d_valid_r   <= 1'b0;
         d_we_r      <= 1'b0;
         d_rd_r      <= 1'b0;
         d_periph_r  <= 1'b0;
      end
      else
      begin
         d_o_r       <= d_o_c;
         d_addr_r    <= d_addr_c;
         d_valid_r   <= d_valid_c;
         d_we_r      <= d_we_c;
         d_rd_r      <= d_rd_c;
         d_periph_r  <= d_periph_c;
      end
   end

   assign d_o      = d_o_r;
   assign d_addr   = d_addr_r;
   assign d_valid  = d_valid_r;
   assign d_we     = d_we_r;
   assign d_rd     = d_rd_r;
   assign d_periph = d_periph_r;

   // ==========================================================================
   // Instantiate the INST CACHE controller
   // ==========================================================================
   inst_cache i_inst_cache
   (
      .clk                       ( clk                       ),
      .rst_n                     ( rst_n_r[2]                ),
                                                             
      // Instruction bus                                     
      .core_i_addr               ( core_i_addr               ),
      .core_inst                 ( core_inst                 ),
      .core_inst_i               ( core_inst_o               ),
      .core_inst_we              ( core_inst_we              ),
      .core_i_fetch              ( core_i_fetch              ),
      .core_i_ready              ( core_i_ready              ),
                                                             
      // Interface to the QSPI controller                    
      .qspi_rdata                ( lisa1_rdata               ),
      .qspi_wdata                ( lisa1_wdata               ),
      .qspi_wstrb                ( lisa1_wstrb               ),
      .qspi_ready                ( lisa1_ready               ),
      .qspi_ready_ack            ( lisa1_ready_ack           ),
      .qspi_xfer_done            ( lisa1_xfer_done           ),
      .qspi_valid                ( lisa1_valid               ),
      .qspi_xfer_len             ( lisa1_xfer_len            ),

      .inst_cache_invalidate     ( inst_cache_invalidate     ),
      .inst_cache_invalidate_ack ( inst_cache_invalidate_ack )
   );

   // ==========================================================================
   // Instantiate the DATA CACHE controller
   // ==========================================================================
   data_cache i_data_cache
   (
      .clk                       ( clk                       ),
      .rst_n                     ( rst_n_r[2]                ),
      .disabled                  ( cache_disabled            ),
                                                             
      // The data bus connection to LISA core                
      .d_addr                    ( d_addr                    ),
      .d_i                       ( d_o                       ),
      .d_o                       ( d_i_cache                 ),
      .d_valid                   ( d_valid                   ),
      .d_we                      ( d_we                      ),
      .d_periph                  ( d_periph                  ),
      .d_ready                   ( d_ready                   ),
                                                             
      // Interface to the RAM32 macro                        
      .ram_we                    ( ram_we                    ),
      .ram_en                    ( ram_en                    ),
      .ram_a                     ( ram_a                     ),
      .ram_di                    ( ram_do                    ),
      .ram_do                    ( ram_di                    ),
      
      // Selects the upper bit for CACHE line mapping
      .cache_map_sel             ( cache_map_sel             ), 
      .data_cache_flush          ( data_cache_flush          ),
      .data_cache_flush_ack      ( data_cache_flush_ack      ),
      .data_cache_invalidate     ( data_cache_invalidate     ),
      .data_cache_invalidate_ack ( data_cache_invalidate_ack ),

      // Interface to the QSPI controller
      .qspi_addr                 ( cache_addr                ),
      .qspi_rdata                ( lisa2_rdata               ),
      .qspi_wdata                ( lisa2_wdata               ),
      .qspi_wstrb                ( lisa2_wstrb               ),
      .qspi_ready                ( lisa2_ready               ),
      .qspi_ready_ack            ( lisa2_ready_ack           ),
      .qspi_xfer_done            ( lisa2_xfer_done           ),
      .qspi_valid                ( lisa2_valid               ),
      .qspi_xfer_len             ( lisa2_xfer_len            )
   );
   assign lisa2_addr = { lisa2_base_addr, 8'h0 } | {8'h0, cache_addr};

   // ==========================================================================
   // Instantiate the DATA RAM
   // ==========================================================================
   RAM32 ram1
   (
`ifdef USE_POWER_PINS
      .VPWR(VPWR),
      .VGND(VGND),
`endif
      .CLK                       ( clk                       ),
      .WE0                       ( ram_we                    ),
      .EN0                       ( ram_en                    ),
      .A0                        ( ram_a                     ),
      .Di0                       ( ram_di                    ),
      .Do0                       ( ram_do                    )
   );
   assign d_i = d_periph ? d_i_periph : d_i_cache;

   // ==========================================================================
   // Instantiate a peripheral controller
   // ==========================================================================
   lisa_periph i_lisa_periph
   (
      .clk                       ( clk                       ),
      .rst_n                     ( rst_n_r[2]                ),
`ifdef WANT_UART2
      .rst_async_n               ( rst_async_n_r[2]          ),
`endif
                                                             
      // Data bus                                            
      .d_i                       ( d_o                       ),
      .d_o                       ( d_i_periph                ),
      .d_addr                    ( d_addr[6:0]               ),
      .d_periph                  ( d_periph                  ),
      .d_we                      ( d_we                      ),
      .d_rd                      ( d_rd                      ),
                                                             
      // GPIO signals                                        
      .porta_in                  ( porta_in                  ),
      .portb                     ( portb                     ),
      .portc                     ( portc                     ),
      .portc_in                  ( portc_in                  ),
      .portc_dir                 ( portc_dir                 ),
                                                             
      // UART signals                                        
      .uart_tx_d                 ( lisa_tx_d                 ),
      .uart_tx_wr                ( lisa_tx_wr                ),
      .uart_rx_rd                ( lisa_rx_rd                ),
      .uart_rx_d                 ( lisa_rx_d                 ),
      .uart_rx_data_avail        ( lisa_rx_data_avail        ),
      .uart_tx_buf_empty         ( lisa_tx_buf_empty         ),

`ifdef WANT_UART2
      .uart2_rx                  ( uart2_rx                  ),
      .uart2_tx                  ( uart2_tx                  ),
`endif
                                                             
      // I2C signals                                         
      .scl_pad_i                 ( scl_pad_i                 ),
      .scl_pad_o                 ( scl_pad_o                 ),
      .scl_padoen_o              ( scl_padoen_o              ),
      .sda_pad_i                 ( sda_pad_i                 ),
      .sda_pad_o                 ( sda_pad_o                 ),
      .sda_padoen_o              ( sda_padoen_o              )
   );

   // ==========================================================================
   // Instantiate the QSPI controller / arbiter
   // ==========================================================================
   lisa_qspi_controller i_lisa_qspi_controller
   (
      .clk                       ( clk                       ),
      .rst_n                     ( rst_n_r[2]                ),

      // Interface for debug
      .debug_addr                ( debug_addr                ), // 8Mx32
      .debug_rdata               ( debug_rdata               ), // Read data
      .debug_wdata               ( debug_wdata               ), // Data to write
      .debug_wstrb               ( debug_wstrb               ), // Which bytes in the 32-bits to write
      .debug_ready               ( debug_ready               ), // Next 32-bit value is ready
      .debug_ready_ack           ( debug_ready_ack           ), // Indicates a valid request
      .debug_valid               ( debug_valid               ), // Indicates a valid request
      .debug_xfer_len            ( debug_xfer_len            ), // Number of 32-bit words to transfer
      .debug_ce_ctrl             ( debug_ce_ctrl             ),
      .debug_custom_spi_cmd      ( dbg_custom_spi_cmd        ),
      .debug_cmd_quad_write      ( dbg_cmd_quad_write        ),

      // Interface for Lisa core instruction bus
      .lisa1_addr                ( lisa1_addr                ), // 8Mx32
      .lisa1_rdata               ( lisa1_rdata               ), // Read data
      .lisa1_wdata               ( lisa1_wdata               ), // Data to write
      .lisa1_wstrb               ( lisa1_wstrb               ), // Which bytes in the 32-bits to write
      .lisa1_ready               ( lisa1_ready               ), // Next 32-bit value is ready
      .lisa1_ready_ack           ( lisa1_ready_ack           ), // Next 32-bit value is ready
      .lisa1_xfer_done           ( lisa1_xfer_done           ), // Total xfer_len transfer is done
      .lisa1_valid               ( lisa1_valid               ), // Indicates a valid request
      .lisa1_xfer_len            ( lisa1_xfer_len            ), // Number of 32-bit words to transfer
      .lisa1_ce_ctrl             ( lisa1_ce_ctrl             ),

      // Interface for Lisa core data bus
      .lisa2_addr                ( lisa2_addr                ), // 8Mx32
      .lisa2_rdata               ( lisa2_rdata               ), // Read data
      .lisa2_wdata               ( lisa2_wdata               ), // Data to write
      .lisa2_wstrb               ( lisa2_wstrb               ), // Which bytes in the 32-bits to write
      .lisa2_ready               ( lisa2_ready               ), // Next 32-bit value is ready
      .lisa2_ready_ack           ( lisa2_ready_ack           ), // Next 32-bit value is ready
      .lisa2_xfer_done           ( lisa2_xfer_done           ), // Total xfer_len transfer is done
      .lisa2_valid               ( lisa2_valid               ), // Indicates a valid request
      .lisa2_xfer_len            ( lisa2_xfer_len            ), // Number of 32-bit words to transfer
      .lisa2_ce_ctrl             ( lisa2_ce_ctrl             ),

      // Interface to the qqspi controller
      .addr                      ( addr                      ), // 8Mx32
      .rdata                     ( rdata                     ), // Read data
      .wdata                     ( wdata                     ), // Data to write
      .wstrb                     ( wstrb                     ), // Which bytes in the 32-bits to write
      .ready                     ( ready                     ), // Next 32-bit value is ready
      .ready_ack                 ( ready_ack                 ), // Next 32-bit value is ready
      .xfer_done                 ( xfer_done                 ), // Total xfer_len transfer is done
      .valid                     ( valid                     ), // Indicates a valid request
      .xfer_len                  ( xfer_len                  ), // Number of 32-bit words to transfer
      .ce_ctrl                   ( ce_ctrl                   ),
      .custom_spi_cmd            ( custom_spi_cmd            ),
      .cmd_quad_write            ( cmd_quad_write            )
   );

   // ==========================================================================
   // Instantiate the QQSPI controller
   // ==========================================================================
   lisa_qqspi i_lisa_qqspi
   (
      .clk                       ( clk                       ),
      .rst_n                     ( rst_n_r[2]                ),
     
      // The control interface
      .addr                      ( addr                      ), // 8Mx32
      .rdata                     ( rdata                     ), // Read data
      .wdata                     ( wdata                     ), // Data to write
      .wstrb                     ( wstrb                     ), // Which bytes in the 32-bits to write
      .ready                     ( ready                     ), // Next 32-bit value is ready
      .ready_ack                 ( ready_ack                 ), // Next 32-bit value is ready
      .xfer_done                 ( xfer_done                 ), // Total xfer_len transfer is done
      .valid                     ( valid                     ), // Indicates a valid request
      .xfer_len                  ( xfer_len                  ), // Number of 32-bit words to transfer
     
      // Per chip-select controls
      .ce_ctrl                   ( ce_ctrl                   ),
      .addr_16b                  ( addr_16b                  ),
      .is_flash                  ( is_flash                  ),
      .quad_mode                 ( quad_mode                 ),
      .spi_clk_div               ( spi_clk_div               ),
      .spi_ce_delay              ( spi_ce_delay              ),
      .spi_mode                  ( spi_mode                  ),
     
      // The QSPI Pin interface
      .sclk                      ( sclk                      ),
      .sio0_si_mosi_i            ( sio0_si_mosi_i            ),
      .sio1_so_miso_i            ( sio1_so_miso_i            ),
      .sio2_i                    ( sio2_i                    ),
      .sio3_i                    ( sio3_i                    ),
      .sio0_si_mosi_o            ( sio0_si_mosi_o            ),
      .sio1_so_miso_o            ( sio1_so_miso_o            ),
      .sio2_o                    ( sio2_o                    ),
      .sio3_o                    ( sio3_o                    ),
      .sio_oe                    ( sio_oe                    ),
      .ce                        ( ce                        ),
      .dummy_read_cycles         ( dummy_read_cycles         ),
      .custom_spi_cmd            ( custom_spi_cmd            ),
      .cmd_quad_write            ( cmd_quad_write            )
   );

   // ==========================================================================
   // Instantiate the debug controller
   // ==========================================================================
   debug_ctrl i_debug_ctrl
   (
      .clk                       ( clk                       ),
      .rst_n                     ( rst_n_r[2]                ),
      .rst_async_n               ( rst_async_n_r[2]          ),
                                                             
      // UART signals                                        
      .debug_rx                  ( debug_rx                  ),
      .debug_tx                  ( debug_tx                  ),

      // Processor debug interface
      .debug_a                   ( dbg_a                     ),
      .debug_dout                ( dbg_di                    ),
      .debug_din                 ( dbg_do                    ),
      .debug_wr                  ( dbg_we                    ),
      .debug_rd                  ( dbg_rd                    ),
      .debug_reset               ( dbg_reset                 ),
      .debug_ready               ( dbg_ready                 ),
      .debug_halted              ( dbg_halted                ),
                                                
      // Baud rate manual set control
      .brg_wr                    ( brg_wr                    ),
      .brg_div                   ( brg_div                   ),
      .baud_set                  ( baud_set                  ),
      .baud_div                  ( baud_div                  ),
      .baud_ref                  ( baud_ref                  ),

      // Signals to share UART with Lisa core
      .plus_guard_time           ( plus_guard_time           ),
      .lisa_tx_d                 ( lisa_tx_d                 ),
      .lisa_tx_wr                ( lisa_tx_wr                ),
      .lisa_rx_rd                ( lisa_rx_rd                ),
      .lisa_rx_d                 ( lisa_rx_d                 ),
      .lisa_rx_data_avail        ( lisa_rx_data_avail        ),
      .lisa_tx_buf_empty         ( lisa_tx_buf_empty         )
   );

   // ==========================================================================
   // Instantiate the debug registers
   // ==========================================================================
   debug_regs i_debug_regs
   (
      // Timing and reset inputs
      .clk                       ( clk                       ), // System clock
      .rst_n                     ( rst_n_r[2]                ), // Active low reset

      // The Debug ctrl interface
      .dbg_a                     ( dbg_a                     ),
      .dbg_di                    ( dbg_di                    ),
      .dbg_do                    ( dbg_do_regs               ),
      .dbg_we                    ( dbg_we                    ),
      .dbg_rd                    ( dbg_rd                    ),
      .dbg_ready                 ( dbg_ready_regs            ),

      // The Debug ctrl interface
      .debug_addr                ( debug_addr                ), // 8Mx32
      .debug_rdata               ( debug_rdata               ), // Read data
      .debug_wdata               ( debug_wdata               ), // Data to write
      .debug_wstrb               ( debug_wstrb               ), // Which bytes in the 32-bits to write
      .debug_ready               ( debug_ready               ), // Next 32-bit value is ready
      .debug_valid               ( debug_valid               ), // Indicates a valid request
      .debug_xfer_len            ( debug_xfer_len            ), // Number of 16-bit words to transfer
      .debug_ce_ctrl             ( debug_ce_ctrl             ),

      // Lisa core QSPI CE and base addresses
      .lisa1_ce_ctrl             ( lisa1_ce_ctrl             ),
      .lisa1_base_addr           ( lisa1_base_addr           ),
      .lisa2_ce_ctrl             ( lisa2_ce_ctrl             ),
      .lisa2_base_addr           ( lisa2_base_addr           ),

      // QSPI Chip Enable options
      .addr_16b                  ( addr_16b                  ),
      .is_flash                  ( is_flash                  ),
      .quad_mode                 ( quad_mode                 ),
      .dummy_read_cycles         ( dummy_read_cycles         ),
                                                             
      .custom_spi_cmd            ( dbg_custom_spi_cmd        ),
      .cmd_quad_write            ( dbg_cmd_quad_write        ),
      .plus_guard_time           ( plus_guard_time           ),
      .spi_clk_div               ( spi_clk_div               ),
      .spi_ce_delay              ( spi_ce_delay              ),
      .spi_mode                  ( spi_mode                  ),
                                                             
      // I/O Mux Bits                                        
      .output_mux_bits           ( output_mux_bits           ),
      .io_mux_bits               ( io_mux_bits               ),

      // Cache control
      .cache_disabled            ( cache_disabled            ),
      .cache_map_sel             ( cache_map_sel             ),

      .data_cache_flush          ( data_cache_flush          ),
      .data_cache_flush_ack      ( data_cache_flush_ack      ),
      .data_cache_invalidate     ( data_cache_invalidate     ),
      .data_cache_invalidate_ack ( data_cache_invalidate_ack ),
      .inst_cache_invalidate     ( inst_cache_invalidate     ),
      .inst_cache_invalidate_ack ( inst_cache_invalidate_ack )
   );

   assign dbg_do         = dbg_do_lisa | dbg_do_regs;
   assign dbg_ready      = dbg_ready_lisa | dbg_ready_regs;
   assign lisa1_addr     = {lisa1_base_addr, 8'h0} | {8'h0, core_i_addr, 1'b0};
   assign baud_div       = ui_in[6:0];
   assign baud_set       = ui_in[7];
   assign debug_ready_ack= 1'b1;

   always @(posedge clk or negedge rst_async_n_r[2])
   begin
      if (~rst_async_n_r[2])
      begin
         rx1_r1 <= 1'b0;
         rx2_r1 <= 1'b0;
         rx3_r1 <= 1'b0;
         rx1_r2 <= 1'b0;
         rx2_r2 <= 1'b0;
         rx3_r2 <= 1'b0;
      end
      else
      begin
         rx1_r1 <= ui_in[3];
         rx1_r2 <= rx1_r1;
         rx2_r1 <= uio_in[6];
         rx2_r2 <= rx2_r1;
         rx3_r1 <= uio_in[4];
         rx3_r2 <= rx3_r1;
      end
   end

   // ==========================================================================
   // Instantiate the autobaud detector
   // ==========================================================================
   debug_autobaud i_debug_autobaud
   (
      // Timing and reset inputs
      .clk                       ( clk                       ), // System clock
      .rst_n                     ( rst_async_n_r[2]          ), // Active low reset
      .disabled                  ( ui_in[7]                  ), // Disabled if set externally
      .rx1                       ( rx1_r2                    ), // Input from the UART
      .rx2                       ( rx2_r2                    ), // Input from the UART
      .rx3                       ( rx3_r2                    ), // Input from the UART
      .wr                        ( brg_wr                    ), // Write the baud rate
      .div                       ( brg_div                   ), // The divisor
      .rx_sel                    ( rx_sel                    )  // Selected RX input
   );

   // ==========================================================================
   // Instantiate the Lisa I/O Mux module
   // ==========================================================================
   lisa_io_mux i_lisa_io_mux
   (
      .clk                       ( clk                       ),
      .rst_n                     ( rst_n_r[2]                ),
      .ena                       ( ena                       ),

      // Chip top I/O signals
      .ui_in                     ( ui_in                     ),
      .uo_out                    ( uo_out                    ),
      .uio_in                    ( uio_in                    ),
      .uio_out                   ( uio_out                   ),
      .uio_oe                    ( uio_oe                    ),

      // I/O mux controls
      .rx_sel                    ( rx_sel                    ),
      .output_mux_bits           ( output_mux_bits           ),
      .io_mux_bits               ( io_mux_bits               ),

      // Debug UART signals
      .rx1                       ( rx1_r2                    ), // Input from the UART
      .rx2                       ( rx2_r2                    ), // Input from the UART
      .rx3                       ( rx3_r2                    ), // Input from the UART

      // UART2 signals
`ifdef WANT_UART2
      .uart2_rx                  ( uart2_rx                  ),
      .uart2_tx                  ( uart2_tx                  ),
`endif

      // QSPI I/O signals
      .sclk                      ( sclk                      ),
      .ce                        ( ce                        ),
      .sio0_si_mosi_i            ( sio0_si_mosi_i            ),
      .sio1_so_miso_i            ( sio1_so_miso_i            ),
      .sio2_i                    ( sio2_i                    ),
      .sio3_i                    ( sio3_i                    ),
      .sio0_si_mosi_o            ( sio0_si_mosi_o            ),
      .sio1_so_miso_o            ( sio1_so_miso_o            ),
      .sio2_o                    ( sio2_o                    ),
      .sio3_o                    ( sio3_o                    ),
      .sio_oe                    ( sio_oe                    ),

      // Lisa parallel port signals
      .lisa_porta_o              ( porta_in                  ),
      .lisa_portb_i              ( portb                     ),
      .lisa_portc_i              ( portc                     ),
      .lisa_portc_dir_i          ( portc_dir                 ),
      .lisa_portc_o              ( portc_in                  ),
                                                             
      // UART inputs                                         
      .baud_ref                  ( baud_ref                  ),
      .debug_tx                  ( debug_tx                  ),
                                                             
      // I2C signals                                         
      .scl_pad_i                 ( scl_pad_i                 ),
      .scl_pad_o                 ( scl_pad_o                 ),
      .scl_padoen_o              ( scl_padoen_o              ),
      .sda_pad_i                 ( sda_pad_i                 ),
      .sda_pad_o                 ( sda_pad_o                 ),
      .sda_padoen_o              ( sda_padoen_o              ),
                                                             
      // Muxed outputs                                       
      .debug_rx                  ( debug_rx                  ) 
   );

endmodule // tt_um_lisa

