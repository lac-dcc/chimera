// This program was cloned from: https://github.com/kdp1965/tt06-um-lisa
// License: Apache License 2.0

/*
==============================================================================
lisa_div.v:  Little ISA (LISA) hardware 16bit / 8bit divider.

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

`define XPR_LEN            16
`define DOUBLE_XPR_LEN     32
`define LOG2_XPR_LEN        4

module lisa_div
#(
      parameter PC_BITS        = 12
 )
(
   input                clk, rst_n,
   input                reset,        // Positive synchronous reset
                        
   (* keep = "true" *)
   input                op_start,
   input                op_div,
   input                op_rem,
   input                op_remu,
   (* keep = "true" *)
   input       [15:0]   div_rs1,      // Divisor
   (* keep = "true" *)
   input       [15:0]   div_rs2,      // Dividend
   output wire [15:0]   div_rd,
   output wire          div_ready,

   // Flop sharing
   output wire          cflag,
   output wire          signed_inversion,
   input                cflag_val,
   input                signed_inv_val,
   input                cflag_load,
   output wire          zflag,
   input                zflag_val,
   input                zflag_load,
   output [PC_BITS-1:0] ix,
   output               ix_cond,
   input  [PC_BITS-1:0] ix_val,
   input                ix_cond_val,
   input                ix_load,
   output [PC_BITS-1:0] ra,
   output               ra_cond,
   input  [PC_BITS-1:0] ra_val,
   input                ra_cond_val,
   input                ra_load,
   output               ldx_stage_two,
   input                ldx_stage_two_val,
   input                ldx_stage_two_load
);
   wire op_any_rem = |{op_rem, op_remu};
   wire op_signed = |{op_div, op_rem};

   wire div_start = op_start;

   localparam md_state_width = 2;
   localparam [1:0] s_idle = 0;
   localparam [1:0] s_compute = 1;
   localparam [1:0] s_setup_output = 2;
   localparam [1:0] s_done = 3;

   reg [md_state_width-1:0]      state;
   reg                           negate_output;
   wire [`XPR_LEN-1:0]           a;
   reg [`XPR_LEN-1:0]            b;
   reg [`XPR_LEN-1:0]            result;
   reg                           cond;
   reg                           ldx_stage_two_r;
   reg                           zflag_r;
   reg                           cflag_r;

   wire [`XPR_LEN-1:0]           abs_in_1;
   wire                          sign_in_1;
   wire [`XPR_LEN-1:0]           abs_in_2;
   wire                          sign_in_2;

   wire                          a_gt;
   wire [`XPR_LEN-1:0]           result_muxed;
   wire [`XPR_LEN-1:0]           result_muxed_negated;
   wire [`XPR_LEN-1:0]           final_result;
   wire                          div_finish;

   function [`XPR_LEN-1:0] abs_input;
      input [`XPR_LEN-1:0]                          data;
      input                                         is_signed;
      begin
         abs_input = (data[`XPR_LEN-1] == 1'b1 && is_signed) ? -data : data;
      end
   endfunction 

   assign zflag            = zflag_r;
   assign cflag            = cflag_r;
   assign signed_inversion = result[15];
   assign ix               = b[PC_BITS-1:0];
   assign ix_cond          = b[PC_BITS];
   assign ra               = result[PC_BITS-1:0];
   assign ra_cond          = PC_BITS == 15 ? cond : result[PC_BITS];
   assign ldx_stage_two    = ldx_stage_two_r & (state == s_idle);

   assign div_finish = (state == s_done);
   assign div_rd = result[`XPR_LEN-1:0];

   assign abs_in_1  = abs_input(div_rs2,op_signed);
   assign sign_in_1 = op_signed && div_rs2[`XPR_LEN-1];
   assign abs_in_2  = abs_input(div_rs1,op_signed);
   assign sign_in_2 = op_signed && div_rs1[`XPR_LEN-1];

   assign a_gt = a >  b;
   assign result_muxed = op_any_rem ? b : result;
   assign result_muxed_negated = (negate_output) ? -result_muxed : result_muxed;
   assign final_result = result_muxed_negated;

   assign div_ready = div_finish;
   assign a = abs_in_1;

   always @(posedge clk)
   begin
      if (!rst_n || reset)
      begin
         state         <= s_idle;
         result        <= 'd0;
         b             <= 'd0;
         negate_output <= 'd0;
         cond          <= 1'b0;
         zflag_r       <= 1'b0;
         cflag_r       <= 1'b0;
      end
      else
      begin
         case (state)
            s_idle : begin
               if (div_start) 
               begin
                  result <= 0;
                  state  <= s_compute;
                  b <= abs_in_2;
                  negate_output <= op_any_rem ? sign_in_1 : sign_in_1 ^ sign_in_2;
               end
               else 
               begin 
                  if (PC_BITS == 15)
                  begin
                     if (ra_load)
                        {cond, result[PC_BITS-1:0]} <= {ra_cond_val, ra_val};
                  end
                  else
                  begin
                     if (ra_load)
                        result[PC_BITS:0] <= {ra_cond_val, ra_val};
                  end

                  if (cflag_load)
                  begin
                     cflag_r    <= cflag_val;
                     result[15] <= signed_inv_val;
                  end

                  if (zflag_load)
                     zflag_r <= zflag_val;

                  if (ix_load)
                     b[PC_BITS:0] <= {ix_cond_val, ix_val};

                  if (ldx_stage_two_load)
                     ldx_stage_two_r <= ldx_stage_two_val;
               end
            end
           
            s_compute : begin
               // Test for divide by zero
               if (div_rs2 == 0)
               begin
                  // Remainder equals rs1
                  if (op_any_rem)
                     b <= div_rs2;
                  else
                     // DIV is all 1 when /0
                     result <= { `XPR_LEN{1'b1}};

                  // Force counter to zero
                  negate_output <= 1'b0;
                  state <= s_setup_output;
               end
               else if (abs_in_1 == 1)
               begin
                  // Remainder equals 0
                  if (op_any_rem)
                     b <= {`XPR_LEN{1'b0}};
                  else
                     // Result equals input
                     result <= abs_in_2;

                  state <= s_setup_output;
               end
               else
               begin
                   // Do the divide (repeated subtraction)
                   if (a_gt) 
                      state <= s_setup_output;
                   else if (a[15:6] == 10'b0 && {a[5:0], 10'b0} <= b)
                   begin
                      b <= b - {a[5:0], 10'b0};
                      result <= result + 1024;
                   end
                   else if (a[15:9] == 7'b0 && {a[8:0], 7'b0} <= b)
                   begin
                      b <= b - {a[8:0], 7'b0};
                      result <= result + 128;
                   end
                   else if (a[15:12] == 4'b0 && {a[11:0], 4'b0} <= b)
                   begin
                      b <= b - {a[11:0], 4'b0};
                      result <= result + 16;
                   end
                   else
                   begin
                      b <= b - a;
                      result <= result + 1;
                   end
               end

            end // case: s_compute
            s_setup_output : 
            begin
               result <= final_result;
               state <= s_done;
            end
            s_done:
            begin
               // Go to IDLE state
               state <= s_idle;

               // Set ldx_stage_two=0 when done
               b      <= 16'h0000;
            end
         endcase // case (state)
      end
   end // always @ (posedge clk)

endmodule

