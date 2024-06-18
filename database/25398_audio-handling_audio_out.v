// This program was cloned from: https://github.com/b-etz/audio-handling
// License: Apache License 2.0

`timescale 1ns/10ps

//   audio_out.v
//
//   Copyright 2024 Brady Etz
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.


module i2s_tx_master #(
  parameter MclkDiv   = 2,     // NOTE: Must be >= 2. Odd divider settings cause high duty cycle to be shortened by one clk_i half-cycle.
  parameter LrckDiv   = 512,   // F_s = F_clk_i / MclkDiv / LrckDiv
  parameter SclkDiv   = 64,    // Number of Sclk periods per frame, T_sclk = MclkDiv * LrckDiv / SclkDiv. Must be >= 2*(DataWidth+1).
  parameter DataWidth = 24
) (
  input      clk_i, rstn_i,
  
  input      [DataWidth-1:0] tx_ldata_i, tx_rdata_i,
  input      tx_valid_i,
  output reg tx_ready_o,
  
  input      mclk_en_i, lrck_en_i,
  output reg i2s_mclk_o, i2s_lrck_o, i2s_sclk_o, i2s_sdat_o
);
  
  localparam MclkPeriod = MclkDiv;
  localparam LrckPeriod = MclkDiv * LrckDiv;
  localparam SclkPeriod = MclkDiv * LrckDiv / SclkDiv;
  reg [$clog2(MclkPeriod+1):0] mclk_counter;
  reg [$clog2(LrckPeriod+1):0] lrck_counter;
  reg [$clog2(SclkPeriod+1):0] sclk_counter;
  reg lrck_rise, lrck_fall, sclk_fall;
  
  localparam Idle = 'd0;
  localparam WaitTx = 'd1;
  localparam LChStart = 'd2; 
  localparam LChWrite = 'd3;
  localparam RChStart = 'd4; 
  localparam RChWrite = 'd5;
  reg [2:0] cur_st, nxt_st;
  
  reg [$clog2(DataWidth)-1:0] data_index;
  
  
  always @(posedge clk_i or negedge rstn_i) begin
    i2s_mclk_o <= 1'b0; i2s_lrck_o <= 1'b0; i2s_sclk_o <= 1'b0;
    lrck_rise <= 1'b0; lrck_fall <= 1'b0; sclk_fall <= 1'b0;
    
    if (!rstn_i) begin
      mclk_counter <= 0; lrck_counter <= 0; sclk_counter <= 0;
    end else begin
      mclk_counter <= mclk_counter + 1;
      lrck_counter <= lrck_counter + 1;
      sclk_counter <= sclk_counter + 1;
    
      if (mclk_counter == MclkPeriod-1) mclk_counter <= 0;
      if (mclk_en_i & (mclk_counter < MclkPeriod/2)) i2s_mclk_o <= 1'b1;
      
      if (lrck_counter == LrckPeriod-1) begin
        lrck_counter <= 0; lrck_fall <= 1'b1;
      end
      if (lrck_counter == LrckPeriod/2 - 1) lrck_rise <= 1'b1;
      if (lrck_en_i & (lrck_counter >= LrckPeriod/2)) i2s_lrck_o <= 1'b1;
      
      if (sclk_counter == SclkPeriod-1) begin
        sclk_counter <= 0; sclk_fall <= 1'b1;
      end
      if (sclk_counter >= SclkPeriod/2) i2s_sclk_o <= 1'b1;
    end
  end
  
  
  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) cur_st <= Idle;
    else         cur_st <= nxt_st;
  end
  
  always @* begin
    nxt_st = cur_st;
    case (cur_st)
      Idle: begin
        if (tx_valid_i & tx_ready_o) begin
          if (lrck_fall) nxt_st = LChStart;
          else           nxt_st = WaitTx;
        end
      end
      WaitTx:   if (lrck_fall) nxt_st = LChStart;
      LChStart: if (sclk_fall) nxt_st = LChWrite;
      LChWrite: if (lrck_rise) nxt_st = RChStart;
      RChStart: if (sclk_fall) nxt_st = RChWrite;
      RChWrite: if (data_index == DataWidth-1) nxt_st = Idle;
      default: ;
    endcase
  end
  
  
  reg [0:DataWidth-1] tx_ldata_r, tx_rdata_r;
  reg n_tx_ready, n_i2s_sdat;
  
  always @* begin
    n_tx_ready = 1'b0;
    
    case (nxt_st)
      Idle: n_tx_ready = 1'b1;
      WaitTx: ;
      LChStart: n_i2s_sdat = tx_ldata_r[0];
      LChWrite: n_i2s_sdat = tx_ldata_r[data_index];
      RChStart: n_i2s_sdat = tx_rdata_r[0];
      RChWrite: n_i2s_sdat = tx_rdata_r[data_index];
      default: ;
    endcase
  end
  
  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) begin
      tx_ldata_r[0] <= 0; tx_rdata_r[1] <= 0;
      {tx_ready_o, i2s_sdat_o} <= 0; 
      data_index <= 0;
    end
    else begin
      tx_ready_o <= n_tx_ready;
      if (tx_valid_i & tx_ready_o) {tx_ldata_r, tx_rdata_r} <= {tx_ldata_i, tx_rdata_i};
      
      case (cur_st)
        Idle: ;
        WaitTx: ;
        LChStart, RChStart: begin
          data_index <= 0;
          if (sclk_fall) i2s_sdat_o <= n_i2s_sdat;
        end
        LChWrite, RChWrite: begin
          if (sclk_fall && (data_index < DataWidth-1)) data_index <= data_index + 1;
          i2s_sdat_o <= n_i2s_sdat;
        end
        default: ;
      endcase
    end
  end
  
endmodule


/*
module tb_i2s_tx_master();
  
  logic clk_i, rstn_i;
  logic signed [23:0] tx_data_i[1:0];
  logic tx_valid_i, tx_ready_o;
  logic mclk_en_i, lrck_en_i;
  logic i2s_mclk_o, i2s_lrck_o, i2s_sclk_o, i2s_sdat_o;
  
  i2s_tx_master #( 2, 512, 64, 24 ) 
  DUT(
    .clk_i,
    .rstn_i,
    .tx_data_i,
    .tx_valid_i,
    .tx_ready_o,
    .mclk_en_i,
    .lrck_en_i,
    .i2s_mclk_o,
    .i2s_lrck_o,
    .i2s_sclk_o,
    .i2s_sdat_o
  );
  
  initial begin
    clk_i = 1'b0; rstn_i = 1'b0;
    mclk_en_i = 1'b0; lrck_en_i = 1'b0;
    tx_valid_i = 1'b0;
    
    forever
      #20 clk_i = ~clk_i;
  end
  
  initial begin
    #100 rstn_i = 1'b1;
    #320 mclk_en_i = 1'b1;
    #640 lrck_en_i = 1'b1;
    #730 tx_data_i[0] = 24'b111111000011110000001111; tx_data_i[1] = 24'b001100110011001100110011;
    #60 tx_valid_i = 1'b1;
    #120 tx_valid_i = 1'b0;
    #60750 tx_data_i[0] = 24'b010101010101001010101010; tx_data_i[1] = 24'b110011001100110011001100;
    #60 tx_valid_i = 1'b1;
  end
  
endmodule
*/


module cs4344_master #(
  parameter FreqIn    = 49152000,
  parameter Fs        = 48000,
  parameter MclkRatio = 512, // MclkDiv = FreqIn / Fs / MclkRatio,  LrckDiv = MclkRatio
  parameter DataWidth = 24   // The CS4344 accepts up to 24-bit values.
) (
  input clk_i, rstn_i,
  
  input [DataWidth-1:0] tx_ldata_i, tx_rdata_i,
  input tx_valid_i,
  output reg tx_ready_o,
  
  input dac_en_i,
  
  output wire i2s_mclk_o, i2s_lrck_o, i2s_sclk_o, i2s_sdat_o
);
  
  localparam LrckDelay = FreqIn / 1000 * 450; // Wait 450ms after enabling MCLK to start LRCK
  reg  lrck_delay_en;
  wire lrck_delay_dn;
  counter #(LrckDelay)
  CNT_LRCK(
    .clk_i(clk_i), .rstn_i(rstn_i),
    .enable(lrck_delay_en),
    .done(lrck_delay_dn)
  );
  
  localparam AudioDelay = FreqIn / Fs * 2000; // Wait 2000 samples after enabling LRCK to play audio
  reg  audio_delay_en;
  wire audio_delay_dn;
  counter #(AudioDelay)
  CNT_AUDIO(
    .clk_i(clk_i), .rstn_i(rstn_i),
    .enable(audio_delay_en),
    .done(audio_delay_dn)
  );
  
  localparam PoweredDown = 2'd0;
  localparam ApplyMclk = 2'd1;
  localparam ApplyLrck = 2'd2;
  localparam PlayAudio = 2'd3;
  reg [1:0] cur_st, nxt_st;
  
  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) cur_st <= PoweredDown;
    else         cur_st <= nxt_st;
  end
  
  always @* begin
    nxt_st = cur_st;
    case (cur_st)
      PoweredDown: if (dac_en_i)       nxt_st = ApplyMclk;
      ApplyMclk:   if (lrck_delay_dn)  nxt_st = ApplyLrck;
                   else if (!dac_en_i) nxt_st = PoweredDown;
      ApplyLrck:   if (audio_delay_dn) nxt_st = PlayAudio;
                   else if (!dac_en_i) nxt_st = PoweredDown;
      PlayAudio:   if (!dac_en_i)      nxt_st = PoweredDown;
      default: ;
    endcase
  end
  
  reg [DataWidth-1:0] tx_ldata_r, tx_rdata_r;
  reg tx_valid_r, mclk_en, lrck_en;
  wire tx_ready_r;
  reg [DataWidth-1:0] n_tx_ldata, n_tx_rdata;
  reg n_tx_valid, n_tx_ready, n_mclk_en, n_lrck_en;
  reg n_lrck_delay_en, n_audio_delay_en;
  
  always @* begin
    {n_lrck_delay_en, n_audio_delay_en} = 2'b00;
    {n_tx_ready, n_tx_valid} = 2'b00;
    {n_tx_ldata, n_tx_rdata} = 0;
    {n_mclk_en, n_lrck_en} = 2'b00;
    
    case (nxt_st)
      PoweredDown: ;
      ApplyMclk: {n_mclk_en, n_lrck_delay_en} = 2'b11;
      ApplyLrck: {n_mclk_en, n_lrck_en, n_audio_delay_en} = 3'b111;
      PlayAudio: begin
        {n_mclk_en, n_lrck_en} = 2'b11;
        {n_tx_ldata, n_tx_rdata} = {tx_ldata_i, tx_rdata_i}; 
        {n_tx_ready, n_tx_valid} = {tx_ready_r, tx_valid_i};
      end
      default: ;
    endcase
  end
  
  always @(posedge clk_i or negedge rstn_i) begin
    if (!rstn_i) begin
      {mclk_en, lrck_en, tx_ready_o, tx_valid_r} <= 0; 
      tx_ldata_r <= 0; tx_rdata_r <= 0;
      {lrck_delay_en, audio_delay_en} <= 0;
    end else begin
      tx_ready_o <= n_tx_ready; 
      tx_valid_r <= n_tx_valid; 
      {tx_ldata_r, tx_rdata_r} <= {n_tx_ldata, n_tx_rdata};
      mclk_en <= n_mclk_en; 
      lrck_en <= n_lrck_en;
      lrck_delay_en <= n_lrck_delay_en; 
      audio_delay_en <= n_audio_delay_en;
    end    
  end
  
  localparam MclkDiv = FreqIn / Fs / MclkRatio;
  localparam SclkDiv = (MclkRatio % 3 == 0) ?    // Must choose a valid SCLK divider for word length and even duty cycle
                       ((DataWidth < 24) ? 48 : 72) :
                       ((DataWidth < 16) ? 32 : 64);
  i2s_tx_master #(MclkDiv, MclkRatio, SclkDiv, DataWidth) 
  I2S(
    .clk_i(clk_i), .rstn_i(rstn_i),
    .tx_ldata_i(tx_ldata_r),
    .tx_rdata_i(tx_rdata_r),
    .tx_valid_i(tx_valid_r), .tx_ready_o(tx_ready_r),
    .mclk_en_i(mclk_en), .lrck_en_i(lrck_en),
    .i2s_mclk_o(i2s_mclk_o), .i2s_lrck_o(i2s_lrck_o), .i2s_sclk_o(i2s_sclk_o), .i2s_sdat_o(i2s_sdat_o)
  );
  
endmodule


/*
module tb_cs4344_master();
  
  logic clk_i, rstn_i;
  logic signed [23:0] tx_data_i[1:0];
  logic tx_valid_i, tx_ready_o;
  logic dac_en_i;
  logic i2s_mclk_o, i2s_lrck_o, i2s_sclk_o, i2s_sdat_o;
  
  cs4344_master #(49152000, 48000, 512, 24)
  DUT(
    .clk_i,
    .rstn_i,
    .tx_data_i,
    .tx_valid_i, .tx_ready_o,
    .dac_en_i,
    .i2s_mclk_o, .i2s_lrck_o, .i2s_sclk_o, .i2s_sdat_o 
  );
  
  initial begin
    clk_i = 1'b0; rstn_i = 1'b0;
    dac_en_i = 1'b0;
    tx_valid_i = 1'b0;
    
    forever
      #10 clk_i = ~clk_i;
  end
  
  initial begin
    #100 rstn_i = 1'b1;
    #730000 tx_data_i[0] = 24'b111111000011110000001111; tx_data_i[1] = 24'b001100110011001100110011;
    #60 tx_valid_i = 1'b1;
    #15000 dac_en_i = 1'b1;
    #600000000
    #120 tx_valid_i = 1'b0;
    #607500 tx_data_i[0] = 24'b010101010101001010101010; tx_data_i[1] = 24'b110011001100110011001100;
    #60 tx_valid_i = 1'b1;
  end
  
endmodule
*/