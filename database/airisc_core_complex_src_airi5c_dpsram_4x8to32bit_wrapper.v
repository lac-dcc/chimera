//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the “License”);
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an “AS IS” BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//
//
// File             : airi5c_dpsram_4x8to32bit_wrapper.v
// Author           : A. Stanitzki
// Creation Date    : 09.10.20
// Last Modified    : 15.02.21
// Version          : 1.0
// Abstract         : Forms a 32-bit DPSRAM out of four 8-Bit DPSRAMS that has byte aligned addresses and bytewise write
//                    enable. The wrapper is entirely combinatorial, so no further latency is introduced.
//
`timescale 1ns/100ps


`include "airi5c_hasti_constants.vh"

module airi5c_dpsram_4x8to32bit_wrapper(
  input clk,
  input  [`HASTI_ADDR_WIDTH-1:0] sram_addra,
  input  [`HASTI_BUS_NBYTES-1:0] sram_wena,
  input  [`HASTI_BUS_WIDTH-1:0]  sram_dia,
  output [`HASTI_BUS_WIDTH-1:0]  sram_doa, 
  input  [`HASTI_ADDR_WIDTH-1:0] sram_addrb,
  input  [`HASTI_BUS_NBYTES-1:0] sram_wenb,
  input  [`HASTI_BUS_WIDTH-1:0]  sram_dib,
  output [`HASTI_BUS_WIDTH-1:0]  sram_dob 
);

wire [31:0] sram_dia_shifted,
      sram_dib_shifted,
      sram_doa_unshifted,
      sram_dob_unshifted;

reg [1:0]  addra_LSB_r, addrb_LSB_r;    //a clock latency of 1 is expected for the DPSRAM. Hence one delay stage for output reordering is sufficient.    

wire [3:0] sram_wena_shifted,
           sram_wenb_shifted;

wire [11:0] sram_addr_0a,
            sram_addr_0b,
            sram_addr_1a,
            sram_addr_1b,
            sram_addr_2a,
            sram_addr_2b,
            sram_addr_3a,
            sram_addr_3b;

assign sram_dia_shifted =    (sram_addra[1:0] == 2'b11)    ? {sram_dia[7:0],sram_dia[31:8]} :
        (sram_addra[1:0] == 2'b10)     ? {sram_dia[15:0],sram_dia[31:16]} : 
        (sram_addra[1:0] == 2'b01)     ? {sram_dia[23:0],sram_dia[31:24]} : sram_dia;

assign sram_dib_shifted =    (sram_addrb[1:0] == 2'b11)    ? {sram_dib[7:0],sram_dib[31:8]} :
        (sram_addrb[1:0] == 2'b10)     ? {sram_dib[15:0],sram_dib[31:16]} : 
        (sram_addrb[1:0] == 2'b01)     ? {sram_dib[23:0],sram_dib[31:24]} : sram_dib;

// For XFAB IP, write enable is active low.
assign sram_wena_shifted =    ~((sram_addra[1:0] == 2'b11)    ? {sram_wena[0],sram_wena[3:1]} :
        (sram_addra[1:0] == 2'b10)    ? {sram_wena[1:0],sram_wena[3:2]} :
        (sram_addra[1:0] == 2'b01)    ? {sram_wena[2:0],sram_wena[3]} : sram_wena);

assign sram_wenb_shifted =    ~((sram_addrb[1:0] == 2'b11)    ? {sram_wenb[0],sram_wenb[3:1]} :
        (sram_addrb[1:0] == 2'b10)    ? {sram_wenb[1:0],sram_wenb[3:2]} :
        (sram_addrb[1:0] == 2'b01)    ? {sram_wenb[2:0],sram_wenb[3]} : sram_wenb);

assign sram_doa =        (addra_LSB_r == 2'b01)        ? {sram_doa_unshifted[7:0],sram_doa_unshifted[31:8]} :
        (addra_LSB_r == 2'b10)         ? {sram_doa_unshifted[15:0],sram_doa_unshifted[31:16]} : 
        (addra_LSB_r == 2'b11)         ? {sram_doa_unshifted[23:0],sram_doa_unshifted[31:24]} : sram_doa_unshifted;

assign sram_dob =        (addrb_LSB_r == 2'b01)        ? {sram_dob_unshifted[7:0],sram_dob_unshifted[31:8]} :
        (addrb_LSB_r == 2'b10)         ? {sram_dob_unshifted[15:0],sram_dob_unshifted[31:16]} : 
        (addrb_LSB_r == 2'b11)         ? {sram_dob_unshifted[23:0],sram_dob_unshifted[31:24]} : sram_dob_unshifted;

assign sram_addr_0a = |sram_addra[1:0] ? sram_addra[13:2]+1 : sram_addra[13:2];
assign sram_addr_0b = |sram_addrb[1:0] ? sram_addrb[13:2]+1 : sram_addrb[13:2];
assign sram_addr_1a = sram_addra[1] ? sram_addra[13:2]+1 : sram_addra[13:2];
assign sram_addr_1b = sram_addrb[1] ? sram_addrb[13:2]+1 : sram_addrb[13:2];
assign sram_addr_2a = &sram_addra[1:0] ? sram_addra[13:2]+1 : sram_addra[13:2];
assign sram_addr_2b = &sram_addrb[1:0] ? sram_addrb[13:2]+1 : sram_addrb[13:2];
assign sram_addr_3a = sram_addra[13:2];
assign sram_addr_3b = sram_addrb[13:2];

always @(posedge clk) begin
  addra_LSB_r <= sram_addra[1:0];
  addrb_LSB_r <= sram_addrb[1:0];
end

XDPRAMJI_4096X8_M16P airi5c_sram_0(
  .QA(sram_doa_unshifted[7:0]),
  .QB(sram_dob_unshifted[7:0]),
  .DA(sram_dia_shifted[7:0]),
  .DB(sram_dib_shifted[7:0]),
  .AA(sram_addr_0a),
  .AB(sram_addr_0b),
  .CLKA(clk),
  .CLKB(clk),
  .CEnA(1'b0),
  .CEnB(1'b0),
  .WEnA(sram_wena_shifted[0]),
  .WEnB(sram_wenb_shifted[0]),
  .OEnA(1'b0),
  .OEnB(1'b0)
);
XDPRAMJI_4096X8_M16P airi5c_sram_1(
  .QA(sram_doa_unshifted[15:8]),
  .QB(sram_dob_unshifted[15:8]),
  .DA(sram_dia_shifted[15:8]),
  .DB(sram_dib_shifted[15:8]),
  .AA(sram_addr_1a),
  .AB(sram_addr_1b),
  .CLKA(clk),
  .CLKB(clk),
  .CEnA(1'b0),
  .CEnB(1'b0),
  .WEnA(sram_wena_shifted[1]),
  .WEnB(sram_wenb_shifted[1]),
  .OEnA(1'b0),
  .OEnB(1'b0)
);

XDPRAMJI_4096X8_M16P airi5c_sram_2(
  .QA(sram_doa_unshifted[23:16]),
  .QB(sram_dob_unshifted[23:16]),
  .DA(sram_dia_shifted[23:16]),
  .DB(sram_dib_shifted[23:16]),
  .AA(sram_addr_2a),
  .AB(sram_addr_2b),
  .CLKA(clk),
  .CLKB(clk),
  .CEnA(1'b0),
  .CEnB(1'b0),
  .WEnA(sram_wena_shifted[2]),
  .WEnB(sram_wenb_shifted[2]),
  .OEnA(1'b0),
  .OEnB(1'b0)
);

XDPRAMJI_4096X8_M16P airi5c_sram_3(
  .QA(sram_doa_unshifted[31:24]),
  .QB(sram_dob_unshifted[31:24]),
  .DA(sram_dia_shifted[31:24]),
  .DB(sram_dib_shifted[31:24]),
  .AA(sram_addr_3a),
  .AB(sram_addr_3b),
  .CLKA(clk),
  .CLKB(clk),
  .CEnA(1'b0),
  .CEnB(1'b0),
  .WEnA(sram_wena_shifted[3]),
  .WEnB(sram_wenb_shifted[3]),
  .OEnA(1'b0),
  .OEnB(1'b0)
);

endmodule