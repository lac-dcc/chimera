// This program was cloned from: https://github.com/AUCOHL/Lighter
// License: Apache License 2.0

//======================================================================
//
// chacha.v
// --------
// Top level wrapper for the ChaCha stream, cipher core providing
// a simple memory like interface with 32 bit data access.
//
//
// Copyright (c) 2013  Secworks Sweden AB
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


`include "designs/chacha/chacha_core.v"




module chacha(
              input wire           clk,
              input wire           reset_n,
              input wire           cs,
              input wire           we,
              input wire [7 : 0]   addr,
              input wire [31 : 0]  write_data,
              output wire [31 : 0] read_data
             );

  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  localparam ADDR_NAME0       = 8'h00;
  localparam ADDR_NAME1       = 8'h01;
  localparam ADDR_VERSION     = 8'h02;

  localparam ADDR_CTRL        = 8'h08;
  localparam CTRL_INIT_BIT    = 0;
  localparam CTRL_NEXT_BIT    = 1;

  localparam ADDR_STATUS      = 8'h09;
  localparam STATUS_READY_BIT = 0;

  localparam ADDR_KEYLEN      = 8'h0a;
  localparam KEYLEN_BIT       = 0;
  localparam ADDR_ROUNDS      = 8'h0b;
  localparam ROUNDS_HIGH_BIT  = 4;
  localparam ROUNDS_LOW_BIT   = 0;

  localparam ADDR_KEY0        = 8'h10;
  localparam ADDR_KEY7        = 8'h17;

  localparam ADDR_IV0         = 8'h20;
  localparam ADDR_IV1         = 8'h21;

  localparam ADDR_DATA_IN0    = 8'h40;
  localparam ADDR_DATA_IN15   = 8'h4f;

  localparam ADDR_DATA_OUT0   = 8'h80;
  localparam ADDR_DATA_OUT15  = 8'h8f;

  localparam CORE_NAME0       = 32'h63686163; // "chac"
  localparam CORE_NAME1       = 32'h68612020; // "ha  "
  localparam CORE_VERSION     = 32'h302e3830; // "0.80"

  localparam DEFAULT_CTR_INIT = 64'h0;


  //----------------------------------------------------------------
  // Registers including update variables and write enable.
  //----------------------------------------------------------------
  reg          init_reg;
  reg          init_new;
  reg          next_reg;
  reg          next_new;

  reg          keylen_reg;
  reg          keylen_we;

  reg [4 : 0]  rounds_reg;
  reg          rounds_we;

  reg [31 : 0] key_reg [0 : 7];
  reg          key_we;

  reg [31 : 0] iv_reg[0 : 1];
  reg          iv_we;

  reg [31 : 0] data_in_reg [0 : 15];
  reg          data_in_we;


  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  wire [255 : 0] core_key;
  wire [63 : 0]  core_iv;
  wire           core_ready;
  wire [511 : 0] core_data_in;
  wire [511 : 0] core_data_out;
  wire           core_data_out_valid;

  reg [31 : 0]   tmp_read_data;


  //----------------------------------------------------------------
  // Concurrent connectivity for ports etc.
  //----------------------------------------------------------------
  assign core_key     = {key_reg[0], key_reg[1], key_reg[2], key_reg[3],
                         key_reg[4], key_reg[5], key_reg[6], key_reg[7]};

  assign core_iv      = {iv_reg[0], iv_reg[1]};

  assign core_data_in = {data_in_reg[00], data_in_reg[01], data_in_reg[02], data_in_reg[03],
                         data_in_reg[04], data_in_reg[05], data_in_reg[06], data_in_reg[07],
                         data_in_reg[08], data_in_reg[09], data_in_reg[10], data_in_reg[11],
                         data_in_reg[12], data_in_reg[13], data_in_reg[14], data_in_reg[15]};

  assign read_data     = tmp_read_data;


  //----------------------------------------------------------------
  // core instantiation.
  //----------------------------------------------------------------
  chacha_core core (
                    .clk(clk),
                    .reset_n(reset_n),
                    .init(init_reg),
                    .next(next_reg),
                    .key(core_key),
                    .keylen(keylen_reg),
                    .iv(core_iv),
                    .ctr(DEFAULT_CTR_INIT),
                    .rounds(rounds_reg),
                    .data_in(core_data_in),
                    .ready(core_ready),
                    .data_out(core_data_out),
                    .data_out_valid(core_data_out_valid)
                   );


  //----------------------------------------------------------------
  // reg_update
  //
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with asynchronous
  // active low reset. All registers have write enable.
  //----------------------------------------------------------------
  always @ (posedge clk)
    begin : reg_update
     integer i;
      if (!reset_n)
        begin
          init_reg   <= 0;
          next_reg   <= 0;
          keylen_reg <= 0;
          rounds_reg <= 5'h0;
          iv_reg[0]  <= 32'h0;
          iv_reg[1]  <= 32'h0;

          for (i = 0 ; i < 8 ; i = i + 1)
            key_reg[i] <= 32'h0;

          for (i = 0 ; i < 16 ; i = i + 1)
            data_in_reg[i] <= 32'h0;
        end
      else
        begin
          init_reg <= init_new;
          next_reg <= next_new;

          if (keylen_we)
            keylen_reg <= write_data[KEYLEN_BIT];

          if (rounds_we)
            rounds_reg <= write_data[ROUNDS_HIGH_BIT : ROUNDS_LOW_BIT];

          if (key_we)
            key_reg[addr[2 : 0]] <= write_data;

          if (iv_we)
            iv_reg[addr[0]] <= write_data;

          if (data_in_we)
            data_in_reg[addr[3 : 0]] <= write_data;
        end
    end // reg_update


  //----------------------------------------------------------------
  // Address decoder logic.
  //----------------------------------------------------------------
  always @*
    begin : addr_decoder
      keylen_we     = 1'h0;
      rounds_we     = 1'h0;
      key_we        = 1'h0;
      iv_we         = 1'h0;
      data_in_we    = 1'h0;
      init_new      = 1'h0;
      next_new      = 1'h0;
      tmp_read_data = 32'h0;

      if (cs)
        begin
          if (we)
            begin
              if (addr == ADDR_CTRL)
                begin
                  init_new = write_data[CTRL_INIT_BIT];
                  next_new = write_data[CTRL_NEXT_BIT];
                end

              if (addr == ADDR_KEYLEN)
                keylen_we = 1;

              if (addr == ADDR_ROUNDS)
                rounds_we = 1;

              if ((addr >= ADDR_KEY0) && (addr <= ADDR_KEY7))
                key_we = 1;

              if ((addr >= ADDR_IV0) && (addr <= ADDR_IV1))
                iv_we = 1;

              if ((addr >= ADDR_DATA_IN0) && (addr <= ADDR_DATA_IN15))
                data_in_we = 1;

            end // if (we)

          else
            begin
              if ((addr >= ADDR_KEY0) && (addr <= ADDR_KEY7))
                tmp_read_data = key_reg[addr[2 : 0]];

              if ((addr >= ADDR_DATA_OUT0) && (addr <= ADDR_DATA_OUT15))
                tmp_read_data = core_data_out[(15 - (addr - ADDR_DATA_OUT0)) * 32 +: 32];

              case (addr)
                ADDR_NAME0:   tmp_read_data = CORE_NAME0;
                ADDR_NAME1:   tmp_read_data = CORE_NAME1;
                ADDR_VERSION: tmp_read_data = CORE_VERSION;
                ADDR_CTRL:    tmp_read_data = {30'h0, next_reg, init_reg};
                ADDR_STATUS:  tmp_read_data = {30'h0, core_data_out_valid, core_ready};
                ADDR_KEYLEN:  tmp_read_data = {31'h0, keylen_reg};
                ADDR_ROUNDS:  tmp_read_data = {27'h0, rounds_reg};
                ADDR_IV0:     tmp_read_data = iv_reg[0];
                ADDR_IV1:     tmp_read_data = iv_reg[1];

                default:
                  begin
                  end
              endcase // case (address)
            end
        end
    end // addr_decoder
endmodule // chacha

//======================================================================
// EOF chacha.v
//======================================================================



