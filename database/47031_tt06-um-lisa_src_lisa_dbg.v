// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
==============================================================================
lisa_dbg.v:  Little ISA (LISA) 8-bit processor debugger.

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
Debug module:

   Debug Addresses
      0:    Control / Status
               { 8'h0, D_BITS[4:0], PC_BITS[3:0], 5'h0, single_step, resume, halt }
      1:    Acc / flags
               { 4'h0,  cond_code[1:0], cflag, zflag, acc }
      2:    PC
      3:    SP
      4:    RA
      5:    IX
      6:    Data bus
      7:    Data Bus Address
      8:    Breakpoint 0
               [ en0, bkpt0 }
      9:    Breakpoint 0
               [ en1, bkpt1 }
      f:    Current instruction word
      etc.

==========================================================================================
*/
`define SIX_BREAK

module lisa_dbg
#(
      parameter PC_BITS        = 12,
      parameter D_BITS         = 9,
      parameter DBG_BRKPOINTS  = 6
)
(
   input                      clk,
   input                      rst_n,

   // Processor signals
   input  wire [15:0]         inst,
   input  wire [PC_BITS-1:0]  pc,
   input  wire [7:0]          acc,
   input  wire [D_BITS-1:0]   sp,
   input  wire [PC_BITS-1:0]  ix,
   input  wire [PC_BITS-1:0]  ra,
   input  wire [1:0]          cond,
   input  wire                zflag,
   input  wire                cflag,

   // Signal to processor to stop execution
   output wire                stop,
   output reg                 cont_q,

   // Data bus signals
   output wire [D_BITS-1:0]   d_addr,
   output wire [7:0]          d_o,
   output wire                d_access,
   input  wire [7:0]          d_i,
   output wire                d_periph,
   output reg                 d_rd,

   // The debug control bus
   input  wire [7:0]          dbg_a,
   input  wire [15:0]         dbg_di,
   output reg  [15:0]         dbg_do,
   input  wire                dbg_we,
   input  wire                dbg_rd,
   output wire                dbg_ready,
   output wire                dbg_halted
);

   reg               halted;
   wire              cont;
   wire [PC_BITS:0]  brk_r[DBG_BRKPOINTS-1:0];
   reg  [PC_BITS:0]  brk_r0;
   reg  [PC_BITS:0]  brk_r1;
   reg  [PC_BITS:0]  brk_r2;
   reg  [PC_BITS:0]  brk_r3;
`ifdef SIX_BREAK
   reg  [PC_BITS:0]  brk_r4;
   reg  [PC_BITS:0]  brk_r5;
`endif
   reg               brk_halt;
   reg               d_access_r;
   reg               d_active_r;
   reg  [1:0]        access_state;
   reg  [D_BITS:0]   d_addr_r;
   reg  [1:0]        delay;
   wire [3:0]        d_bits;
   wire [3:0]        pc_bits;
   wire              d_active;
	integer				i;

   assign d_o      = dbg_di[7:0];
   assign d_access = (dbg_we | dbg_rd) && dbg_a == 8'h6 && halted;
   assign d_active = (dbg_we | dbg_rd) && dbg_a[7:4] == 4'h0;
   assign dbg_halted = halted;
   assign dbg_ready = (d_active & !d_active_r) ? 1'b0 : d_access ? ((delay == 2'h0) | d_periph) : d_active;

   always @(posedge clk)
   begin
      if (~rst_n)
      begin
         halted <= 1'b1;
         cont_q <= 1'b0;
         delay  <= 2'h0;
         d_addr_r <= {(D_BITS+1){1'b0}};
         access_state <= 2'h0;
         d_access_r <= 1'b0;
         d_active_r <= 1'b0;
         brk_r0 <= 16'h0;
         brk_r1 <= 16'h0;
         brk_r2 <= 16'h0;
         brk_r3 <= 16'h0;
`ifdef SIX_BREAK
         brk_r4 <= 16'h0;
         brk_r5 <= 16'h0;
`endif
         //d_we   <= 1'b0;
         d_rd   <= 1'b0;
      end
      else
      begin
         // Status register write
         if (dbg_we && dbg_a == 8'h0)
         begin
            // Write to halt register
            halted <= dbg_di[0];

            // Test for resume or single_step
            if ((dbg_di[1] || dbg_di[2]) && cont)
               cont_q <= 1'b1;
         end
         else
         begin
            // Test for end of write cycle to drive cont_q low
            if (dbg_we == 1'b0)
               cont_q <= 1'b0;

            // Test for halt from breakpoint
            if (brk_halt)
               halted <= 1'b1;
         end

         d_access_r <= d_access;
         d_active_r <= d_active;

         // Breakpoint register write
         if (dbg_we & dbg_a[3])
         begin
            if (dbg_a[2:0] == 3'h0)
               brk_r0 <= dbg_di[PC_BITS:0];
            if (dbg_a[2:0] == 3'h1)
               brk_r1 <= dbg_di[PC_BITS:0];
            if (dbg_a[2:0] == 3'h2)
               brk_r2 <= dbg_di[PC_BITS:0];
            if (dbg_a[2:0] == 3'h3)
               brk_r3 <= dbg_di[PC_BITS:0];
`ifdef SIX_BREAK
            if (dbg_a[2:0] == 3'h4)
               brk_r4 <= dbg_di[PC_BITS:0];
            if (dbg_a[2:0] == 3'h5)
               brk_r5 <= dbg_di[PC_BITS:0];
`endif
         end

         // Data bus register write
         if (dbg_we & dbg_a == 8'h7)
            d_addr_r <= dbg_di[D_BITS:0];

         // Increment data bus access address at the end of the cycle
         else if (d_access_r && !d_access)
            d_addr_r <= d_addr_r + 1;

         if (d_access || (access_state != 2'h0))
            case (access_state)
            2'h0:
            begin
               access_state <= 2'h1;
               delay        <= 2'h3;
            end

            2'h1:
            begin
               if (dbg_rd)
                  d_rd <= 1'b1;
               access_state <= 2'h2;
            end

            2'h2:
            begin
               access_state <= 2'h3;
            end

            2'h3:
            begin
               if (delay != 2'h0)
                  delay <= delay - 1;
               if (dbg_rd == 0 && dbg_we == 0)
               begin
                  d_rd <= 1'b0;
                  access_state <= 2'h0;
               end
            end
            endcase
      end
   end

   /*
   ================================================================
   Logic to test for PC match break
   ================================================================
   */
   assign brk_r[0] = brk_r0;
   assign brk_r[1] = brk_r1;
   assign brk_r[2] = brk_r2;
   assign brk_r[3] = brk_r3;
`ifdef SIX_BREAK
   assign brk_r[4] = brk_r4;
   assign brk_r[5] = brk_r5;
`endif
   always @*
   begin
      brk_halt = 1'b0;
      for (i = 0; i < DBG_BRKPOINTS; i = i + 1)
      begin
         if (brk_r[i][PC_BITS])
            brk_halt = brk_halt | (brk_r[i][PC_BITS-1:0] == pc);
      end
   end
   
   assign cont = dbg_we && dbg_a == 8'h0 && |dbg_di[2:1] && ~cont_q;
   assign stop = (halted | brk_halt) && !cont;
   assign d_addr   = d_addr_r[D_BITS-1:0];
   assign d_periph = d_addr_r[D_BITS];

   assign d_bits = D_BITS;
   assign pc_bits = PC_BITS;

   always @*
   begin
      dbg_do = 16'h0;
      if (dbg_a[7:4] == 4'h0)
      begin
         case (dbg_a)
         0:    dbg_do = { d_bits, pc_bits, 7'h0, halted };
         1:    dbg_do = { 4'h0,  cond, cflag, zflag, acc };
         2:    dbg_do = { {(16-PC_BITS){1'b0}}, pc };
         3:    dbg_do = { {(16-D_BITS){1'b0}},  sp };
         4:    dbg_do = { {(16-PC_BITS){1'b0}}, ra };
         5:    dbg_do = { {(16-PC_BITS){1'b0}}, ix };
         6:    dbg_do = { 8'h0, d_i };
         7:    dbg_do = d_addr_r;
         15:   dbg_do = inst;
         default:
            if (dbg_a[3])
`ifdef SIX_BREAK
               dbg_do = brk_r[dbg_a[2:0]];
`else
               dbg_do = brk_r[dbg_a[1:0]];
`endif
         endcase
      end
   end

endmodule

