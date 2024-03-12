//======================================================================
//
// sha1_core.v
// -----------
// Verilog 2001 implementation of the SHA-1 hash function.
// This is the internal core with wide interfaces.
//
//
// Copyright (c) 2013 Secworks Sweden AB
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or
// without modification, are permitted provided that the following
// conditions are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

`default_nettype none

module sha1_core(
                 input wire            clk,
                 input wire            reset_n,

                 input wire            init,
                 input wire            next,

                 input wire [511 : 0]  block,

                 output wire           ready,

                 output wire [159 : 0] digest,
                 output wire           digest_valid
                );


  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  parameter H0_0 = 32'h67452301;
  parameter H0_1 = 32'hefcdab89;
  parameter H0_2 = 32'h98badcfe;
  parameter H0_3 = 32'h10325476;
  parameter H0_4 = 32'hc3d2e1f0;

  parameter SHA1_ROUNDS = 79;

  parameter CTRL_IDLE   = 0;
  parameter CTRL_ROUNDS = 1;
  parameter CTRL_DONE   = 2;


  //----------------------------------------------------------------
  // Registers including update variables and write enable.
  //----------------------------------------------------------------
  reg [31 : 0] a_reg;
  reg [31 : 0] a_new;
  reg [31 : 0] b_reg;
  reg [31 : 0] b_new;
  reg [31 : 0] c_reg;
  reg [31 : 0] c_new;
  reg [31 : 0] d_reg;
  reg [31 : 0] d_new;
  reg [31 : 0] e_reg;
  reg [31 : 0] e_new;
  reg          a_e_we;

  reg [31 : 0] H0_reg;
  reg [31 : 0] H0_new;
  reg [31 : 0] H1_reg;
  reg [31 : 0] H1_new;
  reg [31 : 0] H2_reg;
  reg [31 : 0] H2_new;
  reg [31 : 0] H3_reg;
  reg [31 : 0] H3_new;
  reg [31 : 0] H4_reg;
  reg [31 : 0] H4_new;
  reg          H_we;

  reg [6 : 0] round_ctr_reg;
  reg [6 : 0] round_ctr_new;
  reg         round_ctr_we;
  reg         round_ctr_inc;
  reg         round_ctr_rst;

  reg digest_valid_reg;
  reg digest_valid_new;
  reg digest_valid_we;

  reg [1 : 0] sha1_ctrl_reg;
  reg [1 : 0] sha1_ctrl_new;
  reg         sha1_ctrl_we;


  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  reg           digest_init;
  reg           digest_update;
  reg           state_init;
  reg           state_update;
  reg           first_block;
  reg           ready_flag;
  reg           w_init;
  reg           w_next;
  wire [31 : 0] w;


  //----------------------------------------------------------------
  // Module instantiantions.
  //----------------------------------------------------------------
  sha1_w_mem w_mem_inst(
                        .clk(clk),
                        .reset_n(reset_n),

                        .block(block),

                        .init(w_init),
                        .next(w_next),

                        .w(w)
                       );


  //----------------------------------------------------------------
  // Concurrent connectivity for ports etc.
  //----------------------------------------------------------------
  assign ready        = ready_flag;
  assign digest       = {H0_reg, H1_reg, H2_reg, H3_reg, H4_reg};
  assign digest_valid = digest_valid_reg;


  //----------------------------------------------------------------
  // reg_update
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with
  // asynchronous active low reset.
  //----------------------------------------------------------------
  always @ (posedge clk or negedge reset_n)
    begin : reg_update
      if (!reset_n)
        begin
          a_reg            <= 32'h0;
          b_reg            <= 32'h0;
          c_reg            <= 32'h0;
          d_reg            <= 32'h0;
          e_reg            <= 32'h0;
          H0_reg           <= 32'h0;
          H1_reg           <= 32'h0;
          H2_reg           <= 32'h0;
          H3_reg           <= 32'h0;
          H4_reg           <= 32'h0;
          digest_valid_reg <= 1'h0;
          round_ctr_reg    <= 7'h0;
          sha1_ctrl_reg    <= CTRL_IDLE;
        end
      else
        begin
          if (a_e_we)
            begin
              a_reg <= a_new;
              b_reg <= b_new;
              c_reg <= c_new;
              d_reg <= d_new;
              e_reg <= e_new;
            end

          if (H_we)
            begin
              H0_reg <= H0_new;
              H1_reg <= H1_new;
              H2_reg <= H2_new;
              H3_reg <= H3_new;
              H4_reg <= H4_new;
            end

          if (round_ctr_we)
            round_ctr_reg <= round_ctr_new;

          if (digest_valid_we)
            digest_valid_reg <= digest_valid_new;

          if (sha1_ctrl_we)
            sha1_ctrl_reg <= sha1_ctrl_new;
        end
    end // reg_update


  //----------------------------------------------------------------
  // digest_logic
  //
  // The logic needed to init as well as update the digest.
  //----------------------------------------------------------------
  always @*
    begin : digest_logic
      H0_new = 32'h0;
      H1_new = 32'h0;
      H2_new = 32'h0;
      H3_new = 32'h0;
      H4_new = 32'h0;
      H_we = 0;

      if (digest_init)
        begin
          H0_new = H0_0;
          H1_new = H0_1;
          H2_new = H0_2;
          H3_new = H0_3;
          H4_new = H0_4;
          H_we = 1;
        end

      if (digest_update)
        begin
          H0_new = H0_reg + a_reg;
          H1_new = H1_reg + b_reg;
          H2_new = H2_reg + c_reg;
          H3_new = H3_reg + d_reg;
          H4_new = H4_reg + e_reg;
          H_we = 1;
        end
    end // digest_logic


  //----------------------------------------------------------------
  // state_logic
  //
  // The logic needed to init as well as update the state during
  // round processing.
  //----------------------------------------------------------------
  always @*
    begin : state_logic
      reg [31 : 0] a5;
      reg [31 : 0] f;
      reg [31 : 0] k;
      reg [31 : 0] t;

      a5     = 32'h0;
      f      = 32'h0;
      k      = 32'h0;
      t      = 32'h0;
      a_new  = 32'h0;
      b_new  = 32'h0;
      c_new  = 32'h0;
      d_new  = 32'h0;
      e_new  = 32'h0;
      a_e_we = 1'h0;

      if (state_init)
        begin
          if (first_block)
            begin
              a_new  = H0_0;
              b_new  = H0_1;
              c_new  = H0_2;
              d_new  = H0_3;
              e_new  = H0_4;
              a_e_we = 1;
            end
          else
            begin
              a_new  = H0_reg;
              b_new  = H1_reg;
              c_new  = H2_reg;
              d_new  = H3_reg;
              e_new  = H4_reg;
              a_e_we = 1;
            end
        end

      if (state_update)
        begin
          if (round_ctr_reg <= 19)
            begin
              k = 32'h5a827999;
              f =  ((b_reg & c_reg) ^ (~b_reg & d_reg));
            end
          else if ((round_ctr_reg >= 20) && (round_ctr_reg <= 39))
            begin
              k = 32'h6ed9eba1;
              f = b_reg ^ c_reg ^ d_reg;
            end
          else if ((round_ctr_reg >= 40) && (round_ctr_reg <= 59))
            begin
              k = 32'h8f1bbcdc;
              f = ((b_reg | c_reg) ^ (b_reg | d_reg) ^ (c_reg | d_reg));
            end
          else if (round_ctr_reg >= 60)
            begin
              k = 32'hca62c1d6;
              f = b_reg ^ c_reg ^ d_reg;
            end

          a5 = {a_reg[26 : 0], a_reg[31 : 27]};
          t = a5 + e_reg + f + k + w;

          a_new  = t;
          b_new  = a_reg;
          c_new  = {b_reg[1 : 0], b_reg[31 : 2]};
          d_new  = c_reg;
          e_new  = d_reg;
          a_e_we = 1;
        end
    end // state_logic


  //----------------------------------------------------------------
  // round_ctr
  //
  // Update logic for the round counter, a monotonically
  // increasing counter with reset.
  //----------------------------------------------------------------
  always @*
    begin : round_ctr
      round_ctr_new = 7'h0;
      round_ctr_we  = 1'h0;

      if (round_ctr_rst)
        begin
          round_ctr_new = 7'h0;
          round_ctr_we  = 1'h1;
        end

      if (round_ctr_inc)
        begin
          round_ctr_new = round_ctr_reg + 1'h1;
          round_ctr_we  = 1;
        end
    end // round_ctr


  //----------------------------------------------------------------
  // sha1_ctrl_fsm
  // Logic for the state machine controlling the core behaviour.
  //----------------------------------------------------------------
  always @*
    begin : sha1_ctrl_fsm
      digest_init      = 1'h0;
      digest_update    = 1'h0;
      state_init       = 1'h0;
      state_update     = 1'h0;
      first_block      = 1'h0;
      ready_flag       = 1'h0;
      w_init           = 1'h0;
      w_next           = 1'h0;
      round_ctr_inc    = 1'h0;
      round_ctr_rst    = 1'h0;
      digest_valid_new = 1'h0;
      digest_valid_we  = 1'h0;
      sha1_ctrl_new    = CTRL_IDLE;
      sha1_ctrl_we     = 1'h0;

      case (sha1_ctrl_reg)
        CTRL_IDLE:
          begin
            ready_flag = 1;

            if (init)
              begin
                digest_init      = 1'h1;
                w_init           = 1'h1;
                state_init       = 1'h1;
                first_block      = 1'h1;
                round_ctr_rst    = 1'h1;
                digest_valid_new = 1'h0;
                digest_valid_we  = 1'h1;
                sha1_ctrl_new    = CTRL_ROUNDS;
                sha1_ctrl_we     = 1'h1;
              end

            if (next)
              begin
                w_init           = 1'h1;
                state_init       = 1'h1;
                round_ctr_rst    = 1'h1;
                digest_valid_new = 1'h0;
                digest_valid_we  = 1'h1;
                sha1_ctrl_new    = CTRL_ROUNDS;
                sha1_ctrl_we     = 1'h1;
              end
          end


        CTRL_ROUNDS:
          begin
            state_update  = 1'h1;
            round_ctr_inc = 1'h1;
            w_next        = 1'h1;

            if (round_ctr_reg == SHA1_ROUNDS)
              begin
                sha1_ctrl_new = CTRL_DONE;
                sha1_ctrl_we  = 1'h1;
              end
          end


        CTRL_DONE:
          begin
            digest_update    = 1'h1;
            digest_valid_new = 1'h1;
            digest_valid_we  = 1'h1;
            sha1_ctrl_new    = CTRL_IDLE;
            sha1_ctrl_we     = 1'h1;
          end
      endcase // case (sha1_ctrl_reg)
    end // sha1_ctrl_fsm

endmodule // sha1_core

//======================================================================
// EOF sha1_core.v
//======================================================================
