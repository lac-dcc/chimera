// This program was cloned from: https://github.com/secworks/trng
// License: BSD 2-Clause "Simplified" License

//======================================================================
//
// trng_csprng.v
// -------------
// CSPRNG for the TRNG.
//
//
// Author: Joachim Strombergson
// Copyright (c) 2014, Secworks Sweden AB
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

module trng_csprng(
                   // Clock and reset.
                   input wire           clk,
                   input wire           reset_n,

                   input wire           cs,
                   input wire           we,
                   input wire  [7 : 0]  address,
                   input wire  [31 : 0] write_data,
                   output wire [31 : 0] read_data,
                   output wire          error,

                   input wire           discard,
                   input                test_mode,
                   output wire          more_seed,
                   output wire          security_error,

                   input [511 : 0]      seed_data,
                   input wire           seed_syn,
                   output wire          seed_ack,

                   output wire [7 : 0]  debug,
                   input wire           debug_update
                  );


  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  parameter ADDR_CTRL            = 8'h10;
  parameter CTRL_ENABLE_BIT      = 0;
  parameter CTRL_SEED_BIT        = 1;

  parameter ADDR_STATUS          = 8'h11;
  parameter STATUS_RND_VALID_BIT = 0;

  parameter ADDR_RND_DATA        = 8'h20;

  parameter ADDR_NUM_ROUNDS      = 8'h40;
  parameter ADDR_NUM_BLOCKS_LOW   = 8'h41;
  parameter ADDR_NUM_BLOCKS_HIGH  = 8'h42;

  parameter CIPHER_KEYLEN256  = 1'b1; // 256 bit key.
  parameter CIPHER_MAX_BLOCKS = 64'h1000000000000000;

  parameter CTRL_IDLE      = 4'h0;
  parameter CTRL_SEED0     = 4'h1;
  parameter CTRL_NSYN      = 4'h2;
  parameter CTRL_SEED1     = 4'h3;
  parameter CTRL_INIT0     = 4'h4;
  parameter CTRL_INIT1     = 4'h5;
  parameter CTRL_NEXT0     = 4'h6;
  parameter CTRL_NEXT1     = 4'h7;
  parameter CTRL_MORE      = 4'h8;
  parameter CTRL_CANCEL    = 4'hf;

  parameter DEFAULT_NUM_ROUNDS = 5'h18;
  parameter DEFAULT_NUM_BLOCKS = 64'h1000000000000000;


  //----------------------------------------------------------------
  // Registers including update variables and write enable.
  //----------------------------------------------------------------
  reg [255 : 0] cipher_key_reg;
  reg [255 : 0] cipher_key_new;
  reg           cipher_key_we;

  reg [63 : 0]  cipher_iv_reg;
  reg [63 : 0]  cipher_iv_new;
  reg           cipher_iv_we;

  reg [63 : 0]  cipher_ctr_reg;
  reg [63 : 0]  cipher_ctr_new;
  reg           cipher_ctr_we;

  reg [511 : 0] cipher_block_reg;
  reg [511 : 0] cipher_block_new;
  reg           cipher_block_we;

  reg [63 : 0]  block_ctr_reg;
  reg [63 : 0]  block_ctr_new;
  reg           block_ctr_inc;
  reg           block_ctr_rst;
  reg           block_ctr_we;
  reg           block_ctr_max;

  reg           ready_reg;
  reg           ready_new;
  reg           ready_we;

  reg           more_seed_reg;
  reg           more_seed_new;

  reg           seed_ack_reg;
  reg           seed_ack_new;

  reg           enable_reg;
  reg           enable_new;
  reg           enable_we;

  reg           seed_reg;
  reg           seed_new;

  reg [4 : 0]   num_rounds_reg;
  reg [4 : 0]   num_rounds_new;
  reg           num_rounds_we;

  reg [31 : 0]  num_blocks_low_reg;
  reg [31 : 0]  num_blocks_low_new;
  reg           num_blocks_low_we;

  reg [31 : 0]  num_blocks_high_reg;
  reg [31 : 0]  num_blocks_high_new;
  reg           num_blocks_high_we;

  reg [3 : 0]   csprng_ctrl_reg;
  reg [3 : 0]   csprng_ctrl_new;
  reg           csprng_ctrl_we;


  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  reg [31 : 0]   tmp_read_data;
  reg            tmp_error;

  reg            cipher_init;
  reg            cipher_next;

  wire [511 : 0] cipher_data_out;
  wire           cipher_data_out_valid;
  wire           cipher_ready;

  wire           fifo_more_data;
  reg            fifo_discard;
  wire           rnd_syn;
  wire [31 : 0]  rnd_data;
  reg            rnd_ack;
  reg            fifo_cipher_data_valid;

  wire [63 : 0]  num_blocks;

  wire           muxed_rnd_ack;


  //----------------------------------------------------------------
  // Concurrent connectivity for ports etc.
  //----------------------------------------------------------------
  assign read_data      = tmp_read_data;
  assign error          = tmp_error;
  assign seed_ack       = seed_ack_reg;
  assign more_seed      = more_seed_reg;
  assign debug          = rnd_data[7 : 0];
  assign security_error = 0;

  assign num_blocks     = {num_blocks_high_reg, num_blocks_low_reg};
  assign muxed_rnd_ack  = rnd_ack | debug_update;


  //----------------------------------------------------------------
  // core instantiation.
  //----------------------------------------------------------------
  chacha_core cipher_inst(
                          .clk(clk),
                          .reset_n(reset_n),

                          .init(cipher_init),
                          .next(cipher_next),

                          .key(cipher_key_reg),
                          .keylen(CIPHER_KEYLEN256),
                          .iv(cipher_iv_reg),
                          .ctr(cipher_ctr_reg),
                          .rounds(num_rounds_reg),

                          .data_in(cipher_block_reg),
                          .ready(cipher_ready),

                          .data_out(cipher_data_out),
                          .data_out_valid(cipher_data_out_valid)
                         );


  trng_csprng_fifo fifo_inst(
                             .clk(clk),
                             .reset_n(reset_n),

                             .csprng_data(cipher_data_out),
                             .csprng_data_valid(fifo_cipher_data_valid),
                             .discard(fifo_discard),
                             .more_data(fifo_more_data),

                             .rnd_syn(rnd_syn),
                             .rnd_data(rnd_data),
                             .rnd_ack(muxed_rnd_ack)
                            );


  //----------------------------------------------------------------
  // reg_update
  //
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with synchronous
  // active low reset. All registers have write enable.
  //----------------------------------------------------------------
  always @ (posedge clk or negedge reset_n)
    begin
      if (!reset_n)
        begin
          cipher_key_reg      <= {8{32'h00000000}};
          cipher_iv_reg       <= {2{32'h00000000}};
          cipher_ctr_reg      <= {2{32'h00000000}};
          cipher_block_reg    <= {16{32'h00000000}};
          block_ctr_reg       <= {2{32'h00000000}};
          more_seed_reg       <= 0;
          seed_ack_reg        <= 0;
          ready_reg           <= 0;
          enable_reg          <= 1;
          seed_reg            <= 0;
          num_rounds_reg      <= DEFAULT_NUM_ROUNDS;
          num_blocks_low_reg  <= DEFAULT_NUM_BLOCKS[31 : 0];
          num_blocks_high_reg <= DEFAULT_NUM_BLOCKS[63 : 32];
          csprng_ctrl_reg     <= CTRL_IDLE;
        end
      else
        begin
          more_seed_reg <= more_seed_new;
          seed_ack_reg  <= seed_ack_new;
          seed_reg      <= seed_new;

          if (enable_we)
            begin
              enable_reg <= enable_new;
            end

          if (cipher_key_we)
            begin
              cipher_key_reg <= cipher_key_new;
            end

          if (cipher_iv_we)
            begin
              cipher_iv_reg <= cipher_iv_new;
            end

          if (cipher_ctr_we)
            begin
              cipher_ctr_reg <= cipher_ctr_new;
            end

          if (cipher_block_we)
            begin
              cipher_block_reg <= cipher_block_new;
            end

          if (block_ctr_we)
            begin
              block_ctr_reg <= block_ctr_new;
            end

          if (ready_we)
            begin
              ready_reg <= ready_new;
            end

          if (csprng_ctrl_we)
            begin
              csprng_ctrl_reg <= csprng_ctrl_new;
            end

          if (num_rounds_we)
            begin
              num_rounds_reg <= num_rounds_new;
            end

          if (num_blocks_low_we)
            begin
              num_blocks_low_reg <= num_blocks_low_new;
            end

          if (num_blocks_high_we)
            begin
              num_blocks_high_reg <= num_blocks_high_new;
            end
        end
    end // reg_update


  //----------------------------------------------------------------
  // csprng_api_logic
  //----------------------------------------------------------------
  always @*
    begin : csprng_api_logic
      enable_new          = 0;
      enable_we           = 0;
      seed_new            = 0;

      num_rounds_new      = 5'h00;
      num_rounds_we       = 0;

      num_blocks_low_new  = 32'h00000000;
      num_blocks_low_we   = 0;
      num_blocks_high_new = 32'h00000000;
      num_blocks_high_we  = 0;

      rnd_ack             = 0;

      tmp_read_data       = 32'h00000000;
      tmp_error           = 0;

      if (cs)
        begin
          if (we)
            begin
              // Write operations.
              case (address)
                // Write operations.
                ADDR_CTRL:
                  begin
                    enable_new = write_data[CTRL_ENABLE_BIT];
                    enable_we  = 1;
                    seed_new   = write_data[CTRL_SEED_BIT];
                  end

                ADDR_NUM_ROUNDS:
                  begin
                    num_rounds_new = write_data[4 : 0];
                    num_rounds_we  = 1;
                  end

                ADDR_NUM_BLOCKS_LOW:
                  begin
                    num_blocks_low_new = write_data;
                    num_blocks_low_we  = 1;
                  end

                ADDR_NUM_BLOCKS_HIGH:
                  begin
                    num_blocks_high_new = write_data;
                    num_blocks_high_we  = 1;
                  end

                default:
                  begin
                    tmp_error = 1;
                  end
              endcase // case (address)
            end // if (we)

          else
            begin
              // Read operations.
              case (address)
                // Read operations.
                ADDR_CTRL:
                  begin
                    tmp_read_data = {30'h00000000, seed_reg, enable_reg};
                  end

                ADDR_STATUS:
                  begin
                    tmp_read_data = {30'h00000000, ready_reg, rnd_syn};
                  end

                ADDR_RND_DATA:
                  begin
                    tmp_read_data = rnd_data;
                    rnd_ack  = 1;
                  end

                ADDR_NUM_ROUNDS:
                  begin
                    tmp_read_data = {27'h0000000, num_rounds_reg};
                  end

                ADDR_NUM_BLOCKS_LOW:
                  begin
                    tmp_read_data = num_blocks_low_reg;
                  end

                ADDR_NUM_BLOCKS_HIGH:
                  begin
                    tmp_read_data = num_blocks_high_reg;
                  end

                default:
                  begin
                    tmp_error = 1;
                  end
              endcase // case (address)
            end
        end
    end // cspng_api_logic


  //----------------------------------------------------------------
  // block_ctr
  //
  // Logic to implement the block counter. This includes the
  // ability to detect that maximum allowed number of blocks
  // has been reached. Either as defined by the application
  // or the hard coded CIPHER_MAX_BLOCKS value.
  //----------------------------------------------------------------
  always @*
    begin : block_ctr
      block_ctr_new = 64'h0000000000000000;
      block_ctr_we  = 0;
      block_ctr_max = 0;

      if (block_ctr_rst)
        begin
          block_ctr_new = 64'h0000000000000000;
          block_ctr_we  = 1;
        end

      if (block_ctr_inc)
        begin
          block_ctr_new = block_ctr_reg + 1'b1;
          block_ctr_we  = 1;
        end

      if ((block_ctr_reg == num_blocks) || (block_ctr_reg == CIPHER_MAX_BLOCKS))
        begin
          block_ctr_max = 1;
        end
    end // block_ctr


  //----------------------------------------------------------------
  // csprng_ctrl_fsm
  //
  // Control FSM for the CSPRNG.
  //----------------------------------------------------------------
  always @*
    begin : csprng_ctrl_fsm
      cipher_key_new         = {8{32'h00000000}};
      cipher_key_we          = 0;
      cipher_iv_new          = {2{32'h00000000}};
      cipher_iv_we           = 0;
      cipher_ctr_new         = {2{32'h00000000}};
      cipher_ctr_we          = 0;
      cipher_block_new       = {16{32'h00000000}};
      cipher_block_we        = 0;
      cipher_init            = 0;
      cipher_next            = 0;
      block_ctr_rst          = 0;
      block_ctr_inc          = 0;
      ready_new              = 0;
      ready_we               = 0;
      seed_ack_new           = 0;
      more_seed_new          = 0;
      fifo_discard           = 0;
      fifo_cipher_data_valid = 0;
      csprng_ctrl_new        = CTRL_IDLE;
      csprng_ctrl_we         = 0;

      case (csprng_ctrl_reg)
        CTRL_IDLE:
          begin
            if (!enable_reg)
              begin
                csprng_ctrl_new = CTRL_CANCEL;
                csprng_ctrl_we  = 1;
              end
            else if (fifo_more_data)
              begin
                more_seed_new   = 1;
                csprng_ctrl_new = CTRL_SEED0;
                csprng_ctrl_we  = 1;
              end
          end

        CTRL_SEED0:
          begin
            if ((!enable_reg) || (seed_reg))
              begin
                csprng_ctrl_new = CTRL_CANCEL;
                csprng_ctrl_we  = 1;
              end
            else if (seed_syn)
              begin
                seed_ack_new     = 1;
                cipher_block_new = seed_data;
                cipher_block_we  = 1;
                csprng_ctrl_new  = CTRL_NSYN;
                csprng_ctrl_we   = 1;
              end
          end

        CTRL_NSYN:
          begin
            if ((!enable_reg) || (seed_reg))
              begin
                csprng_ctrl_new = CTRL_CANCEL;
                csprng_ctrl_we  = 1;
              end
            else
              begin
                more_seed_new    = 1;
                csprng_ctrl_new  = CTRL_SEED1;
                csprng_ctrl_we   = 1;
              end
          end

        CTRL_SEED1:
          begin
            if ((!enable_reg) || (seed_reg))
              begin
                csprng_ctrl_new = CTRL_CANCEL;
                csprng_ctrl_we  = 1;
              end
            else if (seed_syn)
              begin
                seed_ack_new    = 1;
                cipher_key_new  = seed_data[255 : 0];
                cipher_key_we   = 1;
                cipher_iv_new   = seed_data[319 : 256];
                cipher_iv_we    = 1;
                cipher_ctr_new  = seed_data[383 : 320];
                cipher_ctr_we   = 1;
                csprng_ctrl_new = CTRL_INIT0;
                csprng_ctrl_we  = 1;
              end
            else
              begin
                more_seed_new = 1;
              end
          end

        CTRL_INIT0:
          begin
            if ((!enable_reg) || (seed_reg))
              begin
                csprng_ctrl_new = CTRL_CANCEL;
                csprng_ctrl_we  = 1;
              end
            else
              begin
                cipher_init     = 1;
                block_ctr_rst   = 1;
                csprng_ctrl_new = CTRL_INIT1;
                csprng_ctrl_we  = 1;
              end
          end

        CTRL_INIT1:
          begin
            if ((!enable_reg) || (seed_reg))
              begin
                csprng_ctrl_new = CTRL_CANCEL;
                csprng_ctrl_we  = 1;
              end
            else if (cipher_ready)
              begin
                csprng_ctrl_new = CTRL_NEXT0;
                csprng_ctrl_we  = 1;
              end
          end

        CTRL_NEXT0:
          begin
            if ((!enable_reg) || (seed_reg))
              begin
                csprng_ctrl_new = CTRL_CANCEL;
                csprng_ctrl_we  = 1;
              end
            else
              begin
                cipher_next     = 1;
                csprng_ctrl_new = CTRL_NEXT1;
                csprng_ctrl_we  = 1;
              end
          end

        CTRL_NEXT1:
            if ((!enable_reg) || (seed_reg))
              begin
                csprng_ctrl_new = CTRL_CANCEL;
                csprng_ctrl_we  = 1;
              end
            else if (cipher_ready)
              begin
                block_ctr_inc          = 1;
                fifo_cipher_data_valid = 1;
                csprng_ctrl_new        = CTRL_MORE;
                csprng_ctrl_we         = 1;
              end

        CTRL_MORE:
          begin
            if ((!enable_reg) || (seed_reg))
              begin
                csprng_ctrl_new = CTRL_CANCEL;
                csprng_ctrl_we  = 1;
              end
            else if (fifo_more_data)
              begin
                if (block_ctr_max)
                  begin
                    more_seed_new   = 1;
                    csprng_ctrl_new = CTRL_SEED0;
                    csprng_ctrl_we  = 1;
                  end
                else
                  begin
                    csprng_ctrl_new = CTRL_NEXT0;
                    csprng_ctrl_we  = 1;
                  end
              end
          end

        CTRL_CANCEL:
          begin
            fifo_discard     = 1;
            cipher_key_new   = {8{32'h00000000}};
            cipher_key_we    = 1;
            cipher_iv_new    = {2{32'h00000000}};
            cipher_iv_we     = 1;
            cipher_ctr_new   = {2{32'h00000000}};
            cipher_ctr_we    = 1;
            cipher_block_new = {16{32'h00000000}};
            cipher_block_we  = 1;
            block_ctr_rst    = 1;
            csprng_ctrl_new  = CTRL_IDLE;
            csprng_ctrl_we   = 1;
          end

      endcase // case (cspng_ctrl_reg)
    end // csprng_ctrl_fsm

endmodule // trng_csprng

//======================================================================
// EOF trng_csprng.v
//======================================================================
