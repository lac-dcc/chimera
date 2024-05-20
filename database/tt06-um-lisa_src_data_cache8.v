// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
==============================================================================
data_cache.v:  A data bus cache for the LISA core.

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

Due to size limitations in Tiny Tapeout, this is a direct map controller
with 8 CACHE lines of size of 16-bytes each
==============================================================================
*/

module data_cache
(
   input  wire          clk,
   input  wire          rst_n,
   input  wire          disabled,

   // The data bus connection to LISA core
   input  wire [14:0]   d_addr,
   input  wire [7:0]    d_i,
   output wire [7:0]    d_o,
   input  wire          d_valid,
   input  wire          d_we,
   input  wire          d_periph,
   output wire          d_ready,

   // Interface to the RAM32 macro
   output wire [3:0]    ram_we,
   output wire          ram_en,
   output wire [4:0]    ram_a,
   input  wire [31:0]   ram_di,
   output wire [31:0]   ram_do,
   
   // Selects the upper bit for CACHE line mapping
   input  wire [1:0]    cache_map_sel,
   input  wire          data_cache_flush,
   output reg           data_cache_flush_ack,
   input  wire          data_cache_invalidate,
   output reg           data_cache_invalidate_ack,

   // Interface to the QSPI controller
   output wire [15:0]   qspi_addr,           // 8Mx32
   input  wire [15:0]   qspi_rdata,          // Read data
   output wire [15:0]   qspi_wdata,          // Data to write
   output wire [1:0]    qspi_wstrb,          // Which bytes in the 32-bits to write
   input  wire          qspi_ready,          // Next 32-bit value is ready
   output reg           qspi_ready_ack,      // ACK that next write data ready
   input  wire          qspi_xfer_done,      // Total xfer_len transfer is done
   output reg           qspi_valid,          // Indicates a valid request 
   output wire [3:0]    qspi_xfer_len        // Number of 32-bit words to transfer
);
   
   localparam [3:0] ST_IDLE               = 4'd0;
   localparam [3:0] ST_SAVE_BEGIN         = 4'd1;
   localparam [3:0] ST_SAVE_XFER          = 4'd2;
   localparam [3:0] ST_READ_SRAM          = 4'd3;
   localparam [3:0] ST_SAVE_DONE          = 4'd4;
   localparam [3:0] ST_LOAD               = 4'd5;
   localparam [3:0] ST_LOAD_NEXT          = 4'd6;
   localparam [3:0] ST_LOAD_DONE          = 4'd7;
   localparam [3:0] ST_FLUSH              = 4'd8;
   localparam [3:0] ST_FLUSH_NEXT         = 4'd9;

   // ==========================================================================
   // CACHE line addresses and controls
   // ==========================================================================
   reg   [7:0]          cl_addr0;            // CACHE Line address 0 (Low RAM)
   reg   [7:0]          cl_addr1;            // CACHE Line address 1
   reg   [7:0]          cl_addr2;            // CACHE Line address 2
   reg   [7:0]          cl_addr3;            // CACHE Line address 3
   reg   [7:0]          cl_addr4;            // CACHE Line address 4
   reg   [7:0]          cl_addr5;            // CACHE Line address 5
   reg   [7:0]          cl_addr6;            // CACHE Line address 6 (The stack)
   reg   [7:0]          cl_addr7;            // CACHE Line address 7 (The stack)
   reg   [7:0]          cl_valid;            // CACHE Line valid bits
   reg   [7:0]          cl_dirty;            // CACHE Line dirty bits
   reg   [7:0]          cl_set_valid;        // Flag to set cache line valid
   reg   [7:0]          cl_clear_valid;      // Flag to clear cache line valid
   wire  [7:0]          cache_sel;           // Selects one of 4 cache lines based on map
   wire  [7:0]          cl_hit;              // Address match per CACHE line
   wire  [7:0]          cl_addr;             // Address match per CACHE line
   wire  [2:0]          cache_map;           // The mapped CACHE line
   reg   [7:0]          cl_map_addr;
   wire                 cache_hit;           // True when we have a CACHE hit
   wire                 cache_valid;
   reg                  cache_map_bit;

   // ==========================================================================
   // Save/Load state machine signals
   // ==========================================================================
   reg                  write_we;            // RAM WE during cache line save
   wire  [3:0]          lisa_we;             // RAM WE during LISA write
   reg   [7:0]          save_done;           // Goes TRUE when CACHE line save done
   reg   [7:0]          cl_update;           // Goes TRUE to save new CACHE line address
   reg                  save_active;         // TRUE during CACHE save operation
   reg                  save_active_next;    // TRUE during CACHE save operation
   reg                  load_active;         // TRUE during CACHE save operation
   reg                  load_active_next;    // TRUE during CACHE save operation
   reg   [3:0]          state;
   reg   [3:0]          state_next;
   reg   [2:0]          fsm_a;               // Address used by FSM for load/save
   reg   [2:0]          fsm_a_next;          // Address used by FSM for load/save
   reg                  ready_ack;
   reg                  ready_ack_next;
   reg                  flush_active;
   reg                  flush_active_next;
   reg   [2:0]          flush_cache_line;
   reg   [2:0]          flush_cache_line_next;

   // ==========================================================================
   // Test for data hit
   // ==========================================================================
   assign cl_addr[0]   = cl_addr0 == d_addr[13:6];
   assign cl_addr[1]   = cl_addr1 == d_addr[13:6];
   assign cl_addr[2]   = cl_addr2 == d_addr[13:6];
   assign cl_addr[3]   = cl_addr3 == d_addr[13:6];
   assign cl_addr[4]   = cl_addr4 == d_addr[13:6];
   assign cl_addr[5]   = cl_addr5 == d_addr[13:6];
   assign cl_addr[6]   = cl_addr6 == d_addr[13:6];
   assign cl_addr[7]   = cl_addr7 == d_addr[13:6];
   assign cl_hit[0]    = cl_addr[0] && cl_valid[0] && cache_sel[0];
   assign cl_hit[1]    = cl_addr[1] && cl_valid[1] && cache_sel[1];
   assign cl_hit[2]    = cl_addr[2] && cl_valid[2] && cache_sel[2];
   assign cl_hit[3]    = cl_addr[3] && cl_valid[3] && cache_sel[3];
   assign cl_hit[4]    = cl_addr[4] && cl_valid[4] && cache_sel[4];
   assign cl_hit[5]    = cl_addr[5] && cl_valid[5] && cache_sel[5];
   assign cl_hit[6]    = cl_addr[6] && cl_valid[6] && cache_sel[6];
   assign cl_hit[7]    = cl_addr[7] && cl_valid[7] && cache_sel[7];
   assign cache_hit    = |cl_hit;
   assign cache_valid  = cache_hit & d_valid;
   assign cache_map    = flush_active ? flush_cache_line : {cache_map_bit, d_addr[5:4]};
   assign cache_sel[0] = cache_map == 3'h0;
   assign cache_sel[1] = cache_map == 3'h1;
   assign cache_sel[2] = cache_map == 3'h2;
   assign cache_sel[3] = cache_map == 3'h3;
   assign cache_sel[4] = cache_map == 3'h4;
   assign cache_sel[5] = cache_map == 3'h5;
   assign cache_sel[6] = cache_map == 3'h6;
   assign cache_sel[7] = cache_map == 3'h7;

   always @*
   begin
      cl_map_addr = 8'h0;
      case (1'b1)
         cache_sel[0]: cl_map_addr = cl_addr0;
         cache_sel[1]: cl_map_addr = cl_addr1;
         cache_sel[2]: cl_map_addr = cl_addr2;
         cache_sel[3]: cl_map_addr = cl_addr3;
         cache_sel[4]: cl_map_addr = cl_addr4;
         cache_sel[5]: cl_map_addr = cl_addr5;
         cache_sel[6]: cl_map_addr = cl_addr6;
         cache_sel[7]: cl_map_addr = cl_addr7;
      endcase
   end

   always @*
   begin
      cache_map_bit = d_addr[14];
      case (cache_map_sel)
         2'h3: cache_map_bit = d_addr[14];
         2'h2: cache_map_bit = d_addr[13];
         2'h1: cache_map_bit = d_addr[12];
         2'h0: cache_map_bit = d_addr[11];
      endcase
   end

   // ==========================================================================
   // Assign RAM signals
   // ==========================================================================
   assign ram_do[31:16] = load_active ? qspi_rdata : { d_i, d_i };
   assign ram_do[15:0]  = load_active ? qspi_rdata : { d_i, d_i };
   assign ram_en     = 1'b1;
   assign lisa_we[0] = (cache_valid | disabled) & d_we & ~d_periph & (d_addr[1:0] == 2'h0);
   assign lisa_we[1] = (cache_valid | disabled) & d_we & ~d_periph & (d_addr[1:0] == 2'h1);
   assign lisa_we[2] = (cache_valid | disabled) & d_we & ~d_periph & (d_addr[1:0] == 2'h2);
   assign lisa_we[3] = (cache_valid | disabled) & d_we & ~d_periph & (d_addr[1:0] == 2'h3);
   assign ram_we[0]  = lisa_we[0] || (write_we & !fsm_a[0]);
   assign ram_we[1]  = lisa_we[1] || (write_we & !fsm_a[0]);
   assign ram_we[2]  = lisa_we[2] || (write_we & fsm_a[0]);
   assign ram_we[3]  = lisa_we[3] || (write_we & fsm_a[0]);
   assign d_o        = ({8{d_addr[1:0] == 2'h0}} & ram_di[7:0])   |
                       ({8{d_addr[1:0] == 2'h1}} & ram_di[15:8])  |
                       ({8{d_addr[1:0] == 2'h2}} & ram_di[23:16]) |
                       ({8{d_addr[1:0] == 2'h3}} & ram_di[31:24]);
   assign ram_a[1:0] = disabled ? d_addr[3:2] : (save_active | load_active) ? fsm_a[2:1] : d_addr[3:2];
   assign ram_a[4:2] = disabled ? d_addr[6:4] : cache_map;

   // We always transfer 8 16-bit words (16-byte CACHE line size)
   assign qspi_xfer_len   = 4'h7;
   assign qspi_wstrb      = { save_active, save_active };
   assign qspi_addr[15]   = 1'b0;
   assign qspi_addr[14]   = cache_map_sel == 2'h3 ? cache_map[1] : 1'b0;
   assign qspi_addr[13]   = cache_map_sel == 2'h2 ? cache_map[1] : cl_map_addr[7];
   assign qspi_addr[12]   = cache_map_sel == 2'h1 ? cache_map[1] : cl_map_addr[6];
   assign qspi_addr[11]   = cache_map_sel == 2'h0 ? cache_map[1] : cl_map_addr[5];
   assign qspi_addr[10:6] = cl_map_addr[4:0];
   assign qspi_addr[5:4]  = cache_map[1:0];
   assign qspi_addr[3:1]  = fsm_a;
   assign qspi_addr[0]    = 1'b0;            // All 16-bit accesses
   assign qspi_wdata      = fsm_a[0] ? ram_di[31:16] : ram_di[15:0];

   assign d_ready = (d_valid && cache_hit) || disabled;

   // ==========================================================================
   // Generate valid and dirty bits
   // ==========================================================================
   integer i;
   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         cl_valid <= 8'h0;
         cl_dirty <= 8'h0;
         cl_addr0 <= 8'h0;
         cl_addr1 <= 8'h0;
         cl_addr2 <= 8'h0;
         cl_addr3 <= 8'h0;
         cl_addr4 <= 8'h0;
         cl_addr5 <= 8'h0;
         cl_addr6 <= 8'h0;
         cl_addr7 <= 8'h0;
      end
      else
      begin
         // Implement the CACHE line dirty bits
         for (i = 0; i < 8; i = i + 1)
         begin : GEN_DIRTY
            // Implement the cl_dirty signals
            if (cache_valid && d_we && ~d_periph && (cache_map == 3'(i)))
               cl_dirty[i] <= 1'b1;
            else if (save_done[i])
               cl_dirty[i] <= 1'b0;

            // Implement the cl_valid signals
            if (cl_set_valid[i])
               cl_valid[i] <= 1'b1;
            else if (cl_clear_valid[i])
               cl_valid[i] <= 1'b0;
         end

         // Implement the cl_addr updates
         if (cl_update[0])
            cl_addr0 <= d_addr[13:6];
         if (cl_update[1])
            cl_addr1 <= d_addr[13:6];
         if (cl_update[2])
            cl_addr2 <= d_addr[13:6];
         if (cl_update[3])
            cl_addr3 <= d_addr[13:6];
         if (cl_update[4])
            cl_addr4 <= d_addr[13:6];
         if (cl_update[5])
            cl_addr5 <= d_addr[13:6];
         if (cl_update[6])
            cl_addr6 <= d_addr[13:6];
         if (cl_update[7])
            cl_addr7 <= d_addr[13:6];
      end
   end

   // ==========================================================================
   // State machine to control loading / saving RAM32 when no cache hit
   // ==========================================================================
   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         state            <= ST_IDLE;
         save_active      <= 1'b0;
         load_active      <= 1'b0;
         fsm_a            <= 3'h0;
         ready_ack        <= 1'b0;
         flush_active     <= 1'b0;;
         flush_cache_line <= 3'h0;
      end
      else
      begin
         state            <= state_next;
         save_active      <= save_active_next;
         load_active      <= load_active_next;
         fsm_a            <= fsm_a_next;
         ready_ack        <= ready_ack_next;
         flush_active     <= flush_active_next;
         flush_cache_line <= flush_cache_line_next;
      end
   end

   always @*
   begin
      state_next            = state;
      save_active_next      = save_active;
      load_active_next      = load_active;
      fsm_a_next            = fsm_a;
      ready_ack_next        = ready_ack;
      save_done             = 8'h0;
      cl_update             = 8'h0;
      qspi_valid            = 1'b0;
      qspi_ready_ack        = 1'b0;
      cl_clear_valid        = 8'h0;
      cl_set_valid          = 8'h0;
      write_we              = 1'b0;
      data_cache_flush_ack  = 1'b0;
      data_cache_invalidate_ack = 1'b0;
      flush_active_next     = flush_active;
      flush_cache_line_next = flush_cache_line;

      case (state)
         ST_IDLE:
            begin
               // Monitor for data request (read or write) with cache miss
               if (d_valid && !cache_hit && !disabled)
               begin
                  // Start at beginning of mapped CACHE line
                  fsm_a_next = 3'h0;

                  // We have some work to do.  Test if the currently mapped
                  // CACHE line is dirty and go to save state, otherwise
                  // go to load state
                  if (cl_dirty[cache_map])
                  begin
                     state_next = ST_SAVE_BEGIN;
                     save_active_next = 1'b1;
                  end
                  else
                  begin
                     state_next = ST_LOAD;

                     // Mark current cache_map as not valid
                     cl_clear_valid[cache_map] = 1'b1;

                     // Update the CACHE line address
                     cl_update[cache_map] = 1'b1;
                     load_active_next = 1'b1;
                  end
               end
               else if ((data_cache_flush | data_cache_invalidate) &
                         !disabled)
               begin
                  // Start at beginning of mapped CACHE line
                  fsm_a_next = 3'h0;
                  flush_active_next = 1'b1;
                  flush_cache_line_next = 3'h0;
                  state_next = ST_FLUSH;
               end
            end

         // Here we initialize the CACHE line save operation
         ST_SAVE_BEGIN:
            begin
               // We have this BEGIN state to let the RAM read happen
               state_next = ST_SAVE_XFER;
               cl_clear_valid[cache_map] = 1'b1;
            end

         // Here we transfer bytes from the SRAM to the QSPI
         ST_SAVE_XFER:
            begin
               // Indicate we have a valid transfer pending
               qspi_valid = 1'b1;

               // Wait for QSPI controller to give us a ready
               if (qspi_ready)
               begin
                  if (!qspi_xfer_done)
                  begin
                     // Increment to the next address and to 
                     // to state to ACK and read RAM
                     fsm_a_next = fsm_a + 3'h1;
                     state_next = ST_READ_SRAM;
                  end
                  else
                  begin
                     state_next = ST_SAVE_DONE;
                  end
               end
            end

         // Now we have saved the current CACHE Line.  We must
         // clear the dirty bit, save address of the new CACHE
         // line we are about to load, and so to the LOAD state
         ST_SAVE_DONE:
            begin
               // Clear the dirty bit
               save_done[cache_map] = 1'b1;

               // Clear the save_active bit
               save_active_next = 1'b0;

               // Start load at beginning of mapped CACHE line
               fsm_a_next = 3'h0;

               // Test for debug cache flush
               if (flush_active)
                  state_next = ST_FLUSH_NEXT;
               else
               begin
                  // Set the load_active bit
                  load_active_next = 1'b1;

                  // Mark current cache_map as not valid
                  cl_clear_valid[cache_map] = 1'b1;

                  // Update the CACHE line address
                  cl_update[cache_map] = 1'b1;
                  state_next = ST_LOAD;
               end
            end

         // Here we wait for the RAM to read the next data
         ST_READ_SRAM:
            begin
               // Mark current cache_map as not valid
               cl_clear_valid[cache_map] = 1'b1;

               // Send a ready_ack to the QSPI controller so it knows
               // the next data is ready
               qspi_ready_ack = 1'b1;

               // Back to transfer state to send next bytes
               if (!qspi_ready)
                  state_next = ST_SAVE_XFER;
            end

         // Here we initialize the CACHE line load operation
         ST_LOAD:
            begin
               // The CACHE line address is valid and the
               // cl_valid has been cleared.  The QSPI
               // address is also valid.  Just need to 
               // start a QSPI read transfer to get the data.

               // Wait for qspi_ready
               if (qspi_ready)
               begin
                  // Write QSPI data to the SRAM
                  write_we = 1'b1;

                  // Test if the transfer is complete
                  if (!qspi_xfer_done)
                  begin
                     // Increment to the next address and to 
                     // to state to ACK and read RAM
                     fsm_a_next = fsm_a + 3'h1;
                     state_next = ST_LOAD_NEXT;
                     qspi_valid = 1'b1;
                  end
                  else
                  begin
                     // Drop the load_active so SRAM get's the
                     // LISA core address to fetch data
                     load_active_next = 1'b0;
                     state_next = ST_LOAD_DONE;
                  end
               end
               else
                  qspi_valid = 1'b1;
            end

         ST_LOAD_NEXT:
            begin
               qspi_valid = 1'b1;

               // Wait for qspi_ready to go low
               if (qspi_ready == 1'b0)
                  state_next = ST_LOAD;
            end

         ST_LOAD_DONE:
            begin
               // Transfer is complete. Mark the CACHE line as valid.
               cl_set_valid[cache_map] = 1'b1;

               state_next = ST_IDLE;
            end

         ST_FLUSH:
            begin
               // Test if the current cache line is dirty then we must save it
               if (cl_dirty[cache_map])
               begin
                  // Write this cache line to QSPI SRAM
                  fsm_a_next = 3'h0;
                  state_next = ST_SAVE_BEGIN;
                  save_active_next = 1'b1;
               end
               else
                  state_next = ST_FLUSH_NEXT;
            end

         ST_FLUSH_NEXT:
            begin
               // Test for flush completion
               if (flush_cache_line == 3'h7)
               begin
                  // Test for invalidate
                  if (data_cache_invalidate)
                  begin
                     // Invalidate the entire cache
                     cl_clear_valid = 8'hff;         
                     data_cache_invalidate_ack = 1'b1;
                  end

                  // Flush complete
                  flush_active_next = 1'b0;
                  data_cache_flush_ack = 1'b1;
                  state_next = ST_IDLE;
               end
               else
               begin
                  flush_cache_line_next = flush_cache_line + 3'h1;
                  state_next = ST_FLUSH;
               end
            end
         default:
            state_next = ST_IDLE;
      endcase
   end

endmodule

