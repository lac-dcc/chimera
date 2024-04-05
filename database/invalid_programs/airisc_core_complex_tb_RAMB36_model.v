//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//
//
// File              : RAMB36_model.v
// Author            : A. Stanitzki
// Creation Date     : 09.10.20
// Last Modified     : 15.02.21
// Version           : 1.0         
// Abstract          : RAM model
// History           :
// Notes             :
//
`timescale 1ns/100ps


`include "airi5c_hasti_constants.vh"

module RAMB36(
  input  [31:0]  DIA,
  input  [3:0]   DIPA,
  input  [31:0]  ADDRA,
  input  [3:0]   WEA,
  input          ENA,
  input          REGCEA,
  input          SSRA,
  output [31:0]  DOA,
  input          CLKA,

  input  [31:0]  DIB,
  input  [3:0]   DIPB,
  input  [31:0]  ADDRB,
  input  [3:0]   WEB,
  input          ENB,
  input          REGCEB,
  input          SSRB,
  output [31:0]  DOB,
  input          CLKB
);

parameter nwords = 256000000;

// mimic FPGA parameters
parameter INIT_00       = 0;
parameter READ_WIDTH_A  = 36;
parameter READ_WIDTH_B  = 36;
parameter WRITE_WIDTH_A = 36;
parameter WRITE_WIDTH_B = 36;

integer i;

// memory array
reg  [`HASTI_BUS_WIDTH-1:0] mem [nwords-1:0];
wire [31:0]                 addra;    assign addra = (ADDRA >> 5);    // external address is shifted << 5
wire [31:0]                 addrb;    assign addrb = (ADDRB >> 5);

reg  [31:0]                 DOA_r;
reg  [31:0]                 DOB_r;

initial begin

  for (i = 0; i < nwords; i=i+1) mem[i] = 0;
end

always @(posedge CLKA) begin 
  if(ENA) begin
    if(|WEA) begin
      DOA_r[31:24] <= WEA[3] ? DIA[31:24] : mem[addra][31:24];
      DOA_r[23:16] <= WEA[2] ? DIA[23:16] : mem[addra][23:16];
      DOA_r[15:8]  <= WEA[1] ? DIA[15:8]  : mem[addra][15:8];
      DOA_r[7:0]   <= WEA[0] ? DIA[7:0]   : mem[addra][7:0];
    end else begin        
      DOA_r <= mem[addra];
    end
  end
end

always @(posedge CLKB) begin 
  if(ENB) begin
    if(|WEB) begin
      DOB_r[31:24] <= WEB[3] ? DIB[31:24] : mem[addrb][31:24];
      DOB_r[23:16] <= WEB[2] ? DIB[23:16] : mem[addrb][23:16];
      DOB_r[15:8]  <= WEB[1] ? DIB[15:8]  : mem[addrb][15:8];
      DOB_r[7:0]   <= WEB[0] ? DIB[7:0]   : mem[addrb][7:0];
    end else begin        
      DOB_r <= mem[addrb];
    end
  end
end


assign    DOA = DOA_r;
assign    DOB = DOB_r;


always @(posedge CLKA) begin
  if(WEA > 0) begin
    mem[addra][31:24] <= WEA[3] ? DIA[31:24] : mem[addra][31:24];
    mem[addra][23:16] <= WEA[2] ? DIA[23:16] : mem[addra][23:16];
    mem[addra][15:8]  <= WEA[1] ? DIA[15:8]  : mem[addra][15:8];
    mem[addra][7:0]   <= WEA[0] ? DIA[7:0]   : mem[addra][7:0];
    if(addra == 49153) $write("%c",DIA);                    // writes to "tohost" are output on stdout.
  end
end

always @(posedge CLKB) begin
  if(WEB > 0) begin
    mem[addrb][31:24] <= WEB[3] ? DIB[31:24] : mem[addrb][31:24];
    mem[addrb][23:16] <= WEB[2] ? DIB[23:16] : mem[addrb][23:16];
    mem[addrb][15:8]  <= WEB[1] ? DIB[15:8]  : mem[addrb][15:8];
    mem[addrb][7:0]   <= WEB[0] ? DIB[7:0]   : mem[addrb][7:0];        
  end
end

endmodule