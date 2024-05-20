// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
==============================================================================
inst_cache.v:  A simple 4-entry instruction cache for the LISA core.

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

Due to size limitations in Tiny Tapeout, this is a super simple
4-entry CACHE.  Any time a CACHE miss occurs, we fetch the requested
instruction from SPI / QSPI, plus the 3 instructions that follow it with
the idea being that code as large sections of non-jumps / non-branchs and
we save SPI/QSPI overhead of sending command + address.
==============================================================================
*/

module inst_cache
(
   input  wire          clk,
   input  wire          rst_n,

   // The instruction bus
   input  wire [14:0]   core_i_addr,
   output reg  [15:0]   core_inst,
   input  wire [15:0]   core_inst_i,      // For writing to the SRAM / FLASH
   input  wire          core_inst_we,     // Write enable
   input  wire          core_i_fetch,
   output wire          core_i_ready,

   // Interface to the QSPI controller
   input  wire [15:0]   qspi_rdata,          // Read data
   output wire [15:0]   qspi_wdata,          // Data to write
   output wire [1:0]    qspi_wstrb,          // Which bytes in the 32-bits to write
   input  wire          qspi_ready,          // Next 32-bit value is ready
   output reg           qspi_ready_ack,      // ACK that next write data ready
   input  wire          qspi_xfer_done,      // Total xfer_len transfer is done
   output reg           qspi_valid,          // Indicates a valid request 
   output wire [3:0]    qspi_xfer_len,       // Number of 32-bit words to transfer
   input  wire          inst_cache_invalidate,
   output wire          inst_cache_invalidate_ack
);
   
   localparam [1:0] ST_IDLE               = 2'd0;
   localparam [1:0] ST_LOAD               = 2'd1;
   localparam [1:0] ST_LOAD_NEXT          = 2'd2;
   localparam [1:0] ST_LOAD_DONE          = 2'd3;

   // ==========================================================================
   // CACHE line addresses and controls
   // ==========================================================================
   reg   [14:0]         cl_addr0;            // CACHE Line address 0 (Low RAM)
   reg   [14:0]         cl_addr1;            // CACHE Line address 1
   reg   [14:0]         cl_addr2;            // CACHE Line address 2
   reg   [14:0]         cl_addr3;            // CACHE Line address 3 (The stack)
   reg   [15:0]         cl_inst0;            // CACHE Line address 0 (Low RAM)
   reg   [15:0]         cl_inst1;            // CACHE Line address 1
   reg   [15:0]         cl_inst2;            // CACHE Line address 2
   reg   [15:0]         cl_inst3;            // CACHE Line address 3 (The stack)
   reg                  cl_valid;            // CACHE Line valid bits
   reg                  cl_set_valid;        // Flag to set cache line valid
   reg                  cl_clear_valid;      // Flag to clear cache line valid
   wire  [3:0]          cl_hit;              // Address match per CACHE line
   wire  [3:0]          cl_addr;             // Address match per CACHE line
   wire                 cache_hit;           // True when we have a CACHE hit
   wire                 cache_valid;

   // ==========================================================================
   // Save/Load state machine signals
   // ==========================================================================
   reg                  cl_update;           // Goes TRUE to save new CACHE line address
   reg                  load_addr3;
   reg                  addr3_loaded;
   reg   [1:0]          state;
   reg   [1:0]          state_next;

   // ==========================================================================
   // Test for inst hit
   // ==========================================================================
   assign cl_addr[0]   = cl_addr0 == core_i_addr;
   assign cl_addr[1]   = cl_addr1 == core_i_addr;
   assign cl_addr[2]   = cl_addr2 == core_i_addr;
   assign cl_addr[3]   = cl_addr3 == core_i_addr;
   assign cl_hit[0]    = cl_addr[0] && cl_valid;
   assign cl_hit[1]    = cl_addr[1] && cl_valid;
   assign cl_hit[2]    = cl_addr[2] && cl_valid;
   assign cl_hit[3]    = cl_addr[3] && cl_valid;
   assign cache_hit    = |cl_hit;
   assign cache_valid  = cache_hit & core_i_fetch;
   
   // ==========================================================================
   // Assign RAM signals
   // ==========================================================================
   // We always transfer 4 16-bit instructions
   assign qspi_xfer_len   = 4'h3;
   assign qspi_wstrb      = { core_inst_we, core_inst_we };
   assign qspi_wdata      = core_inst_i;

   // ==========================================================================
   // Assign the instruction output and ready signals
   // ==========================================================================
   always @*
   begin
      core_inst = 16'h0;
      case (1'b1)
         cl_hit[0]:  core_inst = cl_inst0;
         cl_hit[1]:  core_inst = cl_inst1;
         cl_hit[2]:  core_inst = cl_inst2;
         cl_hit[3]:  core_inst = cl_inst3;
         default:    core_inst = 16'h0;
      endcase
   end
   assign core_i_ready = cache_valid;

   assign inst_cache_invalidate_ack = inst_cache_invalidate & !cl_valid;

   // ==========================================================================
   // Generate valid and dirty bits
   // ==========================================================================
   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         cl_valid <= 1'b0;
         cl_addr0 <= 15'h0;
         cl_addr1 <= 15'h0;
         cl_addr2 <= 15'h0;
         cl_addr3 <= 15'h0;
         cl_inst0 <= 16'h0;
         cl_inst1 <= 16'h0;
         cl_inst2 <= 16'h0;
         cl_inst3 <= 16'h0;
         addr3_loaded <= 1'b0;
      end
      else
      begin
         // Implement the cl_valid signals
         if (cl_set_valid)
            cl_valid <= 1'b1;
         else if (cl_clear_valid || inst_cache_invalidate)
            cl_valid <= 1'b0;

         // Implement the cl_addr updates
         if (cl_update)
         begin
            cl_addr0 <= cl_addr1;
            cl_addr1 <= cl_addr2;
            cl_addr2 <= cl_addr3;

            cl_inst0 <= cl_inst1;
            cl_inst1 <= cl_inst2;
            cl_inst2 <= cl_inst3;
            cl_inst3 <= qspi_rdata;
         end

         // We implment cl_addr3 a bit differently because it is also
         // a counter.
         if (load_addr3)
         begin
            cl_addr3 <= core_i_addr;
            addr3_loaded <= 1'b1;
         end
         else if (cl_update)
         begin
            if (!addr3_loaded)
               cl_addr3 <= cl_addr3 + 15'h1;
            addr3_loaded <= 1'b0;
         end
      end
   end

   // ==========================================================================
   // State machine to control loading / saving RAM32 when no cache hit
   // ==========================================================================
   always @(posedge clk)
   begin
      if (~rst_n)
         state       <= ST_IDLE;
      else
         state       <= state_next;
   end

   always @*
   begin
      state_next       = state;
      load_addr3       = 1'b0;
      cl_update        = 1'b0;
      qspi_valid       = 1'b0;
      qspi_ready_ack   = 1'b1;
      cl_clear_valid   = 1'b0;
      cl_set_valid     = 1'b0;

      case (state)
         ST_IDLE:
            begin
               // Monitor for inst fetch request with cache miss
               if (core_i_fetch && !cache_hit)
               begin
                  state_next = ST_LOAD;

                  // Mark current cache as not valid
                  cl_clear_valid = 1'b1;

                  // Update the CACHE line address
                  load_addr3 = 1'b1;
               end
            end

         // Here we initialize the CACHE line load operation
         ST_LOAD:
            begin
               // Wait for qspi_ready
               if (qspi_ready)
               begin
                  // Write QSPI data to the inst array
                  cl_update = 1'b1;

                  // Test if the transfer is complete
                  if (!qspi_xfer_done)
                  begin
                     // Increment to the next address and to 
                     // to state to ACK and read RAM
                     state_next = ST_LOAD_NEXT;
                     qspi_valid = 1'b1;
                  end
                  else
                  begin
                     state_next = ST_LOAD_DONE;
                  end
               end
               else
                  qspi_valid = 1'b1;
            end

         ST_LOAD_NEXT:
            begin
               qspi_valid = 1'b1;

               // Wait for qspi_ready to go low then go read next inst word
               if (qspi_ready == 1'b0)
                  state_next = ST_LOAD;
            end

         ST_LOAD_DONE:
            begin
               // Transfer is complete. Mark the CACHE as valid.
               cl_set_valid = 1'b1;
               state_next = ST_IDLE;
            end

         default:
            state_next = ST_IDLE;
      endcase
   end

endmodule

