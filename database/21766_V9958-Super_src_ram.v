// This program was cloned from: https://github.com/dinoboards/V9958-Super
// License: BSD 3-Clause "New" or "Revised" License

// ram.v
//   256 bytes of block memory
//   Revision 1.00
//
// Copyright (c) 2006 Kazuhiro Tsujikawa (ESE Artists' factory)
// All rights reserved.
//
// Redistribution and use of this source code or any derivative works, are
// permitted provided that the following conditions are met:
//
// 1. Redistributions of source code must retain the above copyright notice,
//    this list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
// 3. Redistributions may not be sold, nor may they be used in a commercial
//    product or activity without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
// TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
// OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
// WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
// OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

module RAM8 (
    input wire [7:0] ADR,
    input wire CLK,
    input wire WE,
    input wire [7:0] DBO,
    output wire [7:0] DBI
);

  parameter int MEM_SIZE = 256;

  reg [7:0] blkram[MEM_SIZE:0];
  reg [7:0] iadr;

  always @(posedge CLK) begin
    if (WE) begin
      blkram[ADR] <= DBO;
    end
    iadr <= ADR;
  end

  assign DBI = blkram[iadr];

endmodule

module RAM10 #(
    parameter int MEM_SIZE = 1024
) (
    input wire [9:0] ADR,
    input wire CLK,
    input wire WE,
    input wire [7:0] DBO,
    output wire [7:0] DBI
);

  reg [7:0] blkram[MEM_SIZE:0];
  reg [9:0] iadr;

  always @(posedge CLK) begin
    if (WE) begin
      blkram[ADR] <= DBO;
    end
    iadr <= ADR;
  end

  assign DBI = blkram[iadr];

endmodule

module DUAL_PORT_RAM10 #(
    parameter int MEM_SIZE = 1024
) (
    input bit [9:0] ADR1,
    input bit [9:0] ADR2,
    input bit CLK,
    input bit WE1,
    input bit [7:0] DBO1,
    output bit [7:0] DBI1,
    output bit [7:0] DBI2
);

  bit [7:0] blkram[MEM_SIZE:0];
  bit [9:0] iadr1, iadr2;

  always @(posedge CLK) begin
    if (WE1) begin
      blkram[ADR1] <= DBO1;
    end
    iadr1 <= ADR1;
    iadr2 <= ADR2;
  end

  assign DBI1 = blkram[iadr1];
  assign DBI2 = blkram[iadr2];

endmodule
