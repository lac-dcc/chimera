// This program was cloned from: https://github.com/b-etz/audio-handling
// License: Apache License 2.0

`timescale 1ns/10ps

//   fifo.v
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


module audio_fifo #(
  parameter FifoLength = 4, // Must be a power of 2 and less than 2^32, for Gray coding
  parameter DataWidth  = 24
) (
  input  rstn_i,
  
  input  clk_wr,
  input [DataWidth-1:0] L_in, R_in,
  input  wr_en,
  output reg full, almost_full,
  
  input  clk_rd,
  output reg [DataWidth-1:0] L_out, R_out,
  input  rd_en,
  output reg empty, almost_empty
);

  localparam PtrWidth = $clog2(FifoLength); // To use streamlined empty/full detection, add another bit to detect "lapping"

  reg [DataWidth-1:0] data_L[0:FifoLength-1];
  reg [DataWidth-1:0] data_R[0:FifoLength-1];
  
  reg [PtrWidth-1:0] rd_pt, rd_pt_gray_r, wr_pt, wr_pt_gray_r;
  wire [PtrWidth-1:0] rd_pt_gray, wr_pt_gray;
  gray_encoder #(PtrWidth) GRAY_W(wr_pt, wr_pt_gray);
  gray_encoder #(PtrWidth) GRAY_R(rd_pt, rd_pt_gray);
  
  (* ASYNC_REG = "TRUE" *) reg [PtrWidth-1:0] rd_pt_gray_sync[0:1];
  (* ASYNC_REG = "TRUE" *) reg [PtrWidth-1:0] wr_pt_gray_sync[0:1];
  wire [PtrWidth-1:0] rd_pt_r, wr_pt_r;
  gray_decoder #(PtrWidth) BIN_W(wr_pt_gray_sync[1], wr_pt_r);
  gray_decoder #(PtrWidth) BIN_R(rd_pt_gray_sync[1], rd_pt_r);
  
  always @(posedge clk_wr) begin // RAM blocks can't be inferred in always_ff processes with asynchronous resets (?)
    if (!rstn_i) begin
      {full, almost_full} <= 2'b00;
      {wr_pt, wr_pt_gray_r} <= 0;
      {rd_pt_gray_sync[0], rd_pt_gray_sync[1]} <= 0;
    end else begin
      rd_pt_gray_sync[1] <= rd_pt_gray_sync[0]; rd_pt_gray_sync[0] <= rd_pt_gray_r; // Synchronize the read pointer
      wr_pt_gray_r <= wr_pt_gray; // Register the Gray code write pointer to avoid timing issues
      
      if (wr_pt != rd_pt_r) full <= 1'b0;
      if ((wr_pt != rd_pt_r) && (wr_pt + 1 != rd_pt_r)) almost_full <= 1'b0;
      
      if (wr_en & (!full || (wr_pt != rd_pt_r))) begin: WriteUpdate
        data_L[wr_pt] <= L_in;
        data_R[wr_pt] <= R_in;
        wr_pt <= wr_pt + 1;
        if (wr_pt + 1 == rd_pt_r) begin
          full <= 1'b1; almost_full <= 1'b1;
        end
        if (wr_pt + 2 == rd_pt_r) almost_full <= 1'b1;
      end
    end
  end
  
  always @(posedge clk_rd /*or negedge rstn_i*/) begin
    if (!rstn_i) begin
      {L_out, R_out} <= 0;
      {empty, almost_empty} <= 2'b11;
      {rd_pt, rd_pt_gray_r} <= 0;
      {wr_pt_gray_sync[0], wr_pt_gray_sync[1]} <= 0;
    end else begin
      wr_pt_gray_sync[1] <= wr_pt_gray_sync[0]; wr_pt_gray_sync[0] <= wr_pt_gray_r; // Synchronize the write pointer
      rd_pt_gray_r <= rd_pt_gray; // Register the Gray code read pointer to avoid timing issues
      
      L_out <= data_L[rd_pt]; // Output data on the read ports whether rd_en or not.
      R_out <= data_R[rd_pt];
      
      if (rd_pt != wr_pt_r) empty <= 1'b0;
      if ((rd_pt != wr_pt_r) && (rd_pt + 1 != wr_pt_r)) almost_empty <= 1'b0;
      
      if (rd_en & (!empty || (rd_pt != wr_pt_r))) begin: ReadUpdate
        rd_pt <= rd_pt + 1;
        if (rd_pt + 1 == wr_pt_r) begin
          empty <= 1'b1; almost_empty <= 1'b1;
        end
        if (rd_pt + 2 == wr_pt_r) almost_empty <= 1'b1;
      end      
    end
  end
  
endmodule
  
