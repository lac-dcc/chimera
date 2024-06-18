// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
 *  kianv harris RISCV project
 *
 *  copyright (c) 2022 hirosh dabui <hirosh@dabui.de>
 *
 *  permission to use, copy, modify, and/or distribute this software for any
 *  purpose with or without fee is hereby granted, provided that the above
 *  copyright notice and this permission notice appear in all copies.
 *
 *  the software is provided "as is" and the author disclaims all warranties
 *  with regard to this software including all implied warranties of
 *  merchantability and fitness. in no event shall the author be liable for
 *  any special, direct, indirect, or consequential damages or any damages
 *  whatsoever resulting from loss of use, data or profits, whether in an
 *  action of contract, negligence or other tortious action, arising out of
 *  or in connection with the use or performance of this software.
 *
 */
/*
  re-implementation and extension of from https://github.com/machdyne/qqspi/blob/main/rtl/qqspi.v
  Copyright (c) 2021 Lone Dynamics Corporation. All rights reserved.
*/
// added wmask, sync-comb fsm, spi flash support, cen polarity, faster during
// write operations: sb, sh behaves likes 8Mx32 memory
//
// Modified 3/21/2024 by Ken Pettit for 16-bit LISA instruction / data access.
//

`default_nettype none
module lisa_qqspi
#(
   parameter CHIP_SELECTS = 2
 )
(
   input  wire [23:0]               addr,       // 8Mx32
   output reg  [15:0]               rdata,      // Read data
   input  wire [15:0]               wdata,      // Data to write
   input  wire [1:0]                wstrb,      // Which bytes in the 32-bits to write
   output reg                       ready,      // Next 32-bit value is ready
   input  wire                      ready_ack,  // ACK that next wdata is ready
   output reg                       xfer_done,  // Total xfer_len transfer is done
   input  wire                      valid,      // Indicates a valid request 
   input  wire [3:0]                xfer_len,   // Number of 32-bit words to transfer
   input  wire                      clk,
   input  wire                      rst_n,
   input  wire [CHIP_SELECTS-1:0]   addr_16b,
   input  wire [CHIP_SELECTS-1:0]   is_flash,
   input  wire [CHIP_SELECTS-1:0]   quad_mode,
                                   
   output reg                       sclk,
   input  wire                      sio0_si_mosi_i,
   input  wire                      sio1_so_miso_i,
   input  wire                      sio2_i,
   input  wire                      sio3_i,
   
   output wire                      sio0_si_mosi_o,
   output wire                      sio1_so_miso_o,
   output wire                      sio2_o,
   output wire                      sio3_o,
   
   output reg [3:0]                 sio_oe,
   input wire [CHIP_SELECTS -1:0]   ce_ctrl,
   input wire [CHIP_SELECTS -1:0]   spi_mode,
   output reg [CHIP_SELECTS -1:0]   ce,
   input wire [CHIP_SELECTS*4-1:0]  dummy_read_cycles,
   input wire [3:0]                 spi_clk_div,
   input wire [6:0]                 spi_ce_delay,

   input wire                       custom_spi_cmd,
   input wire [7:0]                 cmd_quad_write
);
//   localparam [7:0] CMD_QUAD_WRITE        = 8'h38;
   localparam [7:0] CMD_FAST_READ_QUAD    = 8'hEB;
   localparam [7:0] CMD_WRITE             = 8'h02;
   localparam [7:0] CMD_READ              = 8'h03;
   localparam [3:0] S0_IDLE               = 4'd0;
   localparam [3:0] S1_SELECT_DEVICE      = 4'd1;
   localparam [3:0] S2_CMD                = 4'd2;
   localparam [3:0] S4_ADDR               = 4'd3;
   localparam [3:0] S5_WAIT               = 4'd4;
   localparam [3:0] S6_XFER               = 4'd5;
   localparam [3:0] S7_WAIT_FOR_XFER_DONE = 4'd6;
   localparam [3:0] S8_SELECT_WREN        = 4'd8;
   localparam [3:0] S9_SEND_WREN          = 4'd9;
   localparam [3:0] S10_DESELECT_WREN     = 4'd10;
   localparam [3:0] S11_WREN_WAIT         = 4'd11;
   
   reg  [3:0]                 sio_out;
   wire [3:0]                 sio_in;
   wire                       write;
   wire                       read;
   reg  [3:0]                 state, next_state;
   reg  [23:0]                spi_buf;
   reg  [4:0]                 xfer_cycles;
   reg                        is_quad;
   reg  [15:0]                rdata_next;
   reg                        sclk_next;
   reg  [3:0]                 sio_oe_next;
   reg  [3:0]                 sio_out_next;
   reg  [23:0]                spi_buf_next;
   reg                        is_quad_next;
   reg  [4:0]                 xfer_cycles_next;
   reg                        ready_next;
   reg                        xfer_done_next;
   reg  [CHIP_SELECTS -1:0]   ce_next;
   reg  [3:0]                 len_count;
   reg  [3:0]                 len_count_next;
   wire                       byte_offset;
   wire [4:0]                 wr_cycles;
   wire [15:0]                wr_buffer;
   wire                       addr_16b_c;
   wire                       quad_mode_c;
   wire                       is_flash_c;
   wire [3:0]                 dummy_read_cycles_c[CHIP_SELECTS-1:0];
   reg  [3:0]                 dummy_cycles;
   wire [7:0]                 custom_cmd_val;
   wire                       custom_cmd_addr;
   wire                       custom_cmd_read;
   wire                       spi_mode1;
   reg  [3:0]                 clk_div_r;
   reg  [3:0]                 clk_div_next;
   reg  [6:0]                 ce_delay_r;

   assign write = |wstrb;
   assign read = ~write;
   assign {sio3_o, sio2_o, sio1_so_miso_o, sio0_si_mosi_o} = sio_out;
   assign sio_in = {sio3_i, sio2_i, sio1_so_miso_i, sio0_si_mosi_i};
   assign addr_16b_c = |(ce_ctrl & addr_16b);
   assign is_flash_c = |(ce_ctrl & is_flash);
   assign quad_mode_c = |(ce_ctrl & quad_mode);
   assign spi_mode1   = |(ce_ctrl & spi_mode );
   assign custom_cmd_val = write ? wdata[7:0] : cmd_quad_write;
   assign custom_cmd_addr = wdata[8];
   assign custom_cmd_read = custom_spi_cmd && !write;

   /*
   ================================================================
   Logic to create the dummy_cycles selection based on ce_ctrl
   ================================================================
   */
   generate
   for (genvar c = 0; c < CHIP_SELECTS; c = c + 1)
      begin : GEN_DUMMY
         assign dummy_read_cycles_c[c] = dummy_read_cycles[(c+1)*4-1 -: 4];
      end
   endgenerate
   
   integer i;
   always @*
   begin
      dummy_cycles = 4'h0;
      for (i = 0; i < CHIP_SELECTS; i = i + 1)
      begin
         dummy_cycles = dummy_cycles | (dummy_read_cycles_c[i] & {4{ce_ctrl[i]}});
      end
   end

   align_wdata align_wdata_i (
      .wstrb      (wstrb),
      .wdata      (wdata),
      .byte_offset(byte_offset),
      .wr_cycles  (wr_cycles),
      .wr_buffer  (wr_buffer)
   );

   // ======================================================================
   // CE delay counter
   // ======================================================================
   always @(posedge clk)
   begin
      if (!rst_n)
         ce_delay_r <= 7'h0;
      else
      begin
         if (ce != {CHIP_SELECTS{1'b1}})
            ce_delay_r <= spi_ce_delay;
         else if (ce_delay_r != 0)
            ce_delay_r <= ce_delay_r - 7'h1;
      end
   end

   always @(posedge clk) begin
      if (!rst_n) begin
         ce           <= ~0;
         sclk         <= 1'b0;
         sio_oe       <= 4'b0000;
         sio_out      <= 4'b0000;
         spi_buf      <= 0;
         is_quad      <= 0;
         xfer_cycles  <= 0;
         ready        <= 0;
         state        <= S0_IDLE;
         len_count    <= 4'h0;
         xfer_done    <= 1'b0;
         clk_div_r    <= 4'h0;
      end else begin
         state         <= next_state;
         ce            <= ce_next;
         sclk          <= sclk_next;
         sio_oe        <= sio_oe_next;
         sio_out       <= sio_out_next;
         spi_buf       <= spi_buf_next;
         is_quad       <= is_quad_next;
         xfer_cycles   <= xfer_cycles_next;
         rdata         <= rdata_next;
         ready         <= ready_next;
         len_count     <= len_count_next;
         xfer_done     <= xfer_done_next;
         clk_div_r     <= clk_div_next;
      end
   end
 
   always @(*) begin
      next_state       = state;
      ce_next          = ce;
      sclk_next        = sclk;
      sio_oe_next      = sio_oe;
      sio_out_next     = sio_out;
      spi_buf_next     = spi_buf;
      is_quad_next     = is_quad;
      xfer_cycles_next = xfer_cycles;
      ready_next       = ready;
      rdata_next       = rdata;
      xfer_cycles_next = xfer_cycles;
      len_count_next   = len_count;
      xfer_done_next   = xfer_done;
      clk_div_next     = clk_div_r;
      
      if (|xfer_cycles)
      begin  
         sio_out_next[3:0] = is_quad ? spi_buf[23:20] : {3'b0, spi_buf[23]};
         
         if (sclk)
         begin
            if (clk_div_r == 4'h0)
            begin
               sclk_next = 1'b0;
               clk_div_next = spi_clk_div;
               if (spi_mode1)
               begin
                  spi_buf_next = is_quad ? {spi_buf[19:0], sio_in[3:0]} : {spi_buf[22:0], sio_in[1]};
                  xfer_cycles_next = is_quad ? xfer_cycles - 4 : xfer_cycles - 1;
               end
            end
            else
               clk_div_next = clk_div_r - 4'h1;
         end else begin
            if (clk_div_r == 4'h0)
            begin
               clk_div_next = spi_clk_div;
               sclk_next = 1'b1;
               if (!spi_mode1)
               begin
                  spi_buf_next = is_quad ? {spi_buf[19:0], sio_in[3:0]} : {spi_buf[22:0], sio_in[1]};
                  xfer_cycles_next = is_quad ? xfer_cycles - 4 : xfer_cycles - 1;
               end
            end
            else
               clk_div_next = clk_div_r - 4'h1;
         end
      end
      else
      begin
         case (state)
            S0_IDLE: begin
               sio_oe_next  = 4'b0001;
               is_quad_next = 0;
               xfer_done_next = 1'b0;
               if (valid && !ready) begin
                  next_state = write & is_flash_c ? S8_SELECT_WREN : S1_SELECT_DEVICE;
                  xfer_cycles_next = 0;
               end else if (!valid && ready) begin
                  ready_next = 1'b0;
                  ce_next = ~0;
               end else begin
                  ce_next = ~0;
               end
            end
          
            S1_SELECT_DEVICE: begin
               if (ce_delay_r == 7'h0)
               begin
                  ce_next        = ~ce_ctrl;
                  next_state     = S2_CMD;
                  len_count_next = xfer_len;
               end
            end
          
            S8_SELECT_WREN: begin
               ce_next        = ~ce_ctrl;
               next_state     = S9_SEND_WREN;
            end
          
            S2_CMD: begin
               if (quad_mode_c) begin
                  spi_buf_next[23:16] = custom_spi_cmd ? custom_cmd_val : write ?
                     cmd_quad_write : CMD_FAST_READ_QUAD;
               end else begin
                  spi_buf_next[23:16] = custom_spi_cmd ? custom_cmd_val : write ? CMD_WRITE : CMD_READ;
               end
           
               sio_out_next[3:0] = is_quad ? spi_buf_next[23:20] : {3'b0, spi_buf_next[23]};
               xfer_cycles_next = 8;
               next_state = ~custom_spi_cmd ? S4_ADDR : custom_cmd_addr ? S4_ADDR :
                            custom_cmd_read ? S6_XFER : S7_WAIT_FOR_XFER_DONE;
            end
          
            S4_ADDR: begin
               if (addr_16b_c)
                  spi_buf_next[23:8] = {addr[15:1], write ? byte_offset : 1'b0};
               else
                  spi_buf_next = {addr[23:1], write ? byte_offset : 1'b0};
              
               sio_oe_next = quad_mode_c ? 4'b1111 : 4'b0001;
               xfer_cycles_next = addr_16b_c ? 16 : 24;
              
               is_quad_next = quad_mode_c;
               next_state = custom_spi_cmd ? S7_WAIT_FOR_XFER_DONE: quad_mode_c && read ?
                              S5_WAIT : S6_XFER;
            end
          
            S5_WAIT: begin
               sio_oe_next = 4'b0000;
               xfer_cycles_next = {1'h0, dummy_cycles};
               is_quad_next = 0;
               next_state = S6_XFER;
            end
          
            S6_XFER: begin
               is_quad_next = quad_mode_c;
               ready_next = 1'b0;
               
               if (write) begin
                 sio_oe_next  = quad_mode_c ? 4'b1111 : 4'b0001;
                 spi_buf_next[23:8] = wr_buffer;
               end else begin
                 sio_oe_next = quad_mode_c ? 4'b0000 : 4'b0001;
               end
               
               xfer_cycles_next = write ? wr_cycles : 16;
               next_state = S7_WAIT_FOR_XFER_DONE;
            end
          
            S7_WAIT_FOR_XFER_DONE: begin
               // transform from little to big endian
               rdata_next = {spi_buf[7:0], spi_buf[15:8]};
               ready_next = 1'b1;
               sclk_next = 1'b0;
               if (len_count == 4'h0)
               begin
                  next_state     = S0_IDLE;
                  xfer_done_next = 1'b1;
               end

               // Wait for ready_ack to ensure new data
               // is available
               else if (ready_ack || !write)
               begin
                  next_state     = S6_XFER;
                  len_count_next = len_count - 4'h1;
               end
            end

            S9_SEND_WREN: begin
               spi_buf_next[23:16] = 8'h06;
               sio_out_next[3:0] = {3'b0, spi_buf_next[23]};
               xfer_cycles_next = 8;
               next_state = S10_DESELECT_WREN;
            end

            S10_DESELECT_WREN: begin
               ce_next        = ~0;
               sclk_next      = 1'b0;
               next_state     = S11_WREN_WAIT;
            end
          
            S11_WREN_WAIT: begin
               next_state     = S1_SELECT_DEVICE;
            end
          
          
            default: next_state = S0_IDLE;
         endcase
      end
   end
endmodule

module align_wdata
(
   input  wire [ 1:0] wstrb,
   input  wire [15:0] wdata,
   output reg         byte_offset,
   output reg  [ 4:0] wr_cycles,
   output reg  [15:0] wr_buffer
);

   always @(*) begin
      wr_buffer = 16'h0;
      case (wstrb)
         2'b01: begin
            byte_offset = 0;
            wr_buffer[15:8] = wdata[7:0];
            wr_cycles = 8;
         end
         2'b10: begin
            byte_offset = 1;
            wr_buffer[15:8] = wdata[15:8];
            wr_cycles = 8;
         end
         2'b11: begin
            byte_offset = 0;
            wr_buffer = {wdata[7:0], wdata[15:8]};
            wr_cycles = 16;
         end
         default: begin
            byte_offset = 0;
            wr_buffer   = {wdata[7:0], wdata[15:8]};
            wr_cycles   = 16;
         end
      endcase
   end
endmodule

// vim: et sw=3 ts=3
