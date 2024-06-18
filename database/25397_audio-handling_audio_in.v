// This program was cloned from: https://github.com/b-etz/audio-handling
// License: Apache License 2.0

`timescale 1ns/10ps

//   audio_in.sv
//
//   Copyright 2022 Brady Etz
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


module tdm_rx_master #(
  parameter ClkDiv = 2,    // NOTE: Must be >= 2. Odd divider settings cause high duty cycle to be shortened by one clk_i half-cycle.
  parameter DataSize = 32, // Legal values are 16, 20, 24, and 32.
  parameter NChannels = 8,
  parameter TxOffset = 1   // Must be less than DataSize-1
) (
  input  clk_i, rstn_i,
  
  output reg [DataSize*NChannels-1:0] rx_data_o,
  output reg rx_valid_o,
  
  output reg tdm_bclk_o, tdm_fsync_o,
  input  tdm_data_i
);
  
  localparam CLK_COUNTER_WIDTH = $clog2(ClkDiv);
  reg [CLK_COUNTER_WIDTH-1:0] clk_count;
  
  localparam DAT_COUNTER_WIDTH = $clog2(DataSize)+1;
  reg [DAT_COUNTER_WIDTH-1:0] dat_count;
  
  localparam CH_COUNTER_WIDTH = $clog2(NChannels)+1;
  reg [CH_COUNTER_WIDTH-1:0] ch_count;
  
  localparam FSYNC_TRIG_CH  = NChannels-1;
  localparam FSYNC_TRIG_DAT = DataSize-TxOffset-1;
  
  always @(posedge clk_i or negedge rstn_i) begin
    
    if (!rstn_i) begin
    
      clk_count <= 0;
      dat_count <= 0; ch_count <= 0;
      rx_valid_o <= 1'b0;
      tdm_bclk_o <= 1'b0;
      tdm_fsync_o <= 1'b0;
      
    end 
    else begin
      if (clk_count == ClkDiv-1) begin: Bclk_Rising_Edge
        
        clk_count <= 0;
        tdm_bclk_o <= 1'b1;
        
        tdm_fsync_o <= (ch_count == FSYNC_TRIG_CH) & (dat_count == FSYNC_TRIG_DAT);
        
        if (dat_count == DataSize-1) begin
          dat_count <= 0;
          if (ch_count == NChannels-1) ch_count <= 0;
          else ch_count <= ch_count + 1;
        end
        else dat_count <= dat_count + 1;
        
      end
      else begin 
        if (clk_count == (ClkDiv/2)-1) begin: Bclk_Falling_Edge
        
          tdm_bclk_o <= 1'b0;
          
          rx_data_o[DataSize*ch_count+DataSize-dat_count-1] <= tdm_data_i;
          rx_valid_o <= (ch_count == (NChannels-1)) & (dat_count == (DataSize-1));
          
        end
        clk_count <= clk_count + 1;
      end
    end
    
  end  
endmodule

module pcmd3180_master #(
  parameter ClkDiv = 2,    // NOTE: Must be >= 2. Odd divider settings cause high duty cycle to be shortened by one clk_i half-cycle.
  parameter DataSize = 32, // Legal values are 16, 20, 24, and 32.
  parameter NChannels = 8,
  parameter TxOffset = 1   // Must be less than DataSize
) (
  input  clk_i,
  input  rstn_i,
  
  output reg [NChannels*DataSize-1:0] rx_data_o,
  output reg rx_valid_o,
  
  output reg tdm_bclk_o,
  output reg tdm_fsync_o,
  input  tdm_data_i,
  
  output reg pcmd_shdnz_o
);

  
  
  tdm_rx_master #(
    ClkDiv, DataSize, NChannels, TxOffset
  ) TDM(
    .clk_i(clk_i),
    .rstn_i(rstn_i),
    .rx_data_o(rx_data_o),
    .rx_valid_o(rx_valid_o),
    .tdm_bclk_o(tdm_bclk_o),
    .tdm_fsync_o(tdm_fsync_o),
    .tdm_data_i(tdm_data_i)
  );
endmodule

/*
module tb_tdm_rx_master();
  logic t_clk_i, t_rstn_i;
  logic [7:0] t_rx_data_o[3:0];
  logic t_rx_valid_o;
  logic t_bclk_o, t_fsync_o, t_data_i;
  
  tdm_rx_master #(
    2, 8, 4, 2
  ) DUT(
    .clk_i      (t_clk_i),
    .rstn_i     (t_rstn_i),
    .rx_data_o  (t_rx_data_o),
    .rx_valid_o (t_rx_valid_o),
    .tdm_bclk_o (t_bclk_o),
    .tdm_fsync_o(t_fsync_o),
    .tdm_data_i (t_data_i)
  );
  
  initial begin
    t_clk_i = 1'b0;
    t_rstn_i = 1'b0;
    
    forever
      #20 t_clk_i = ~t_clk_i;
  end
  
  initial begin
    #100 t_rstn_i = 1'b1;
  end

endmodule
*/