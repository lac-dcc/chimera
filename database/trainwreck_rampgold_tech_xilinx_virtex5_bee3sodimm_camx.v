//---------------------------------------------------------------------------   
// File:        camx.v
// Author:      Zhangxi Tan
// Description: Modified for 2GB dual-rank SODIMMs 
//------------------------------------------------------------------------------  

`timescale 1ns / 1ps

// © Copyright Microsoft Corporation, 2008

//The OpenBank Logic
module obLogic(
  input CLK,
  input Reset,  //asserted during Reset or Refresh
  input [13:0] row,
  input [2:0]  bank,
  input        rank,
  input        refRank,
  input doOp,
  input doReset,
  input redoValid,
  output reg [2:0] numOps //001 => Hit, 010 => No-conflict miss, 100 => Conflict
) /* synthesis syn_sharing = on */;

//This allows up to 16 banks to be open at once.
  reg  r_doReset;
  
  reg  [15:0] valid; //valid bits for the 8 row registers of two ranks
  wire [13:0] rowOut; //output of the row LUT rams
  wire rowEqual; //comparator. row == rowOut[bank]?
  wire Hit;
  wire Conflict;
  
  reg numOps_rank;
  reg [2:0] numOps_bank;
  
  genvar x;  //generate the 32 (16 used) x 14 row address LUT ram
  generate
    for (x = 0; x < 14; x = x+1)
    begin: rowMem
      dpram rowElement(
        .CLK(CLK),
        .in(row[x]),
        .out(rowOut[x]),
        .ra({1'b0, rank, bank[2:0]}),
        .wa({1'b0, rank, bank[2:0]}),
        .we(doOp)
      );
    end
  endgenerate

  
  always @(posedge CLK)
  if(Reset) valid <= 16'b0; //clear all valid bits
  else if(doReset) begin //clear all valid bits for the requested rank
    valid [{refRank, 3'b000}] <= 1'b0;
    valid [{refRank, 3'b001}] <= 1'b0;
    valid [{refRank, 3'b010}] <= 1'b0;
    valid [{refRank, 3'b011}] <= 1'b0;
    valid [{refRank, 3'b100}] <= 1'b0;
    valid [{refRank, 3'b101}] <= 1'b0;
    valid [{refRank, 3'b110}] <= 1'b0;
    valid [{refRank, 3'b111}] <= 1'b0;
  end
  else if(doOp) valid [{rank, bank}] <= 1'b1; //bank is assigned
  else if(redoValid) valid [{numOps_rank, numOps_bank}] <= 1'b1;
  
  assign rowEqual = row == rowOut;

  assign Hit = valid[{rank,bank}] & rowEqual;
  assign Conflict = valid[{rank, bank}] & ~rowEqual;  


 /* always @(posedge CLK) if(doOp) numOps <=
  (Hit) ? 3'b001:  
  (~Hit & ~Conflict)? 3'b010: //No-conflict Miss.
  3'b100; //Conflict
 */
 always @(posedge CLK) begin
  //if (Reset | (doReset & (refRank == numOps_rank)))
  if (Reset | (doReset & (refRank == numOps_rank)))
    numOps <= 3'b010;
  else begin
  if(doOp) numOps <=
  (Hit) ? 3'b001:  
  (~Hit & ~Conflict)? 3'b010: //No-conflict Miss.
  3'b100; //Conflict
  
  if (doOp) numOps_rank <= rank;
  if (doOp) numOps_bank <= bank;
    
  end
 end
endmodule