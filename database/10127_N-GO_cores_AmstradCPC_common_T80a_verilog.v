// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`default_nettype none

//Z80 compatible microprocessor core, asynchronous top level
//
// Version : 0247b
//
// Copyright (c) 2001-2002 Daniel Wallner (jesus@opencores.org)
//
// All rights reserved
//
// Redistribution and use in source and synthezised forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// Redistributions of source code must retain the above copyright notice,
// this list of conditions and the following disclaimer.
//
// Redistributions in synthesized form must reproduce the above copyright
// notice, this list of conditions and the following disclaimer in the
// documentation and/or other materials provided with the distribution.
//
// Neither the name of the author nor the names of other contributors may
// be used to endorse or promote products derived from this software without
// specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
// THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
// Please report bugs to the author, but before you do so, please
// make sure that this is not a derivative work and that
// you have the latest version of this file.
//
// The latest version of this file can be found at:
//  http://www.opencores.org/cvsweb.shtml/t80/
//
// Limitations :
//
// File history :
//
//  0208 : First complete release
//
//  0211 : Fixed interrupt cycle
//
//  0235 : Updated for T80 interface change
//
//  0238 : Updated for T80 interface change
//
//  0240 : Updated for T80 interface change
//
//  0242 : Updated for T80 interface change
//
//  0247 : Fixed bus req/ack cycle
//
//  0247a: 7th of September, 2003 by Kazuhiro Tsujikawa (tujikawa@hat.hi-ho.ne.jp)
//         Fixed IORQ_n, RD_n, WR_n bus timing
//
//  0247b: 10th April, 2017, by Miguel Angel Rodriguez (mcleod_ideafix) (miguel.angel@zxprojects.com)
//         Fixing the fixes by Kazuhiro so I have INTACK again, and IORQ edges where they should be.
//         I'm not at VHDL so this top level is rewritten in Verilog


module T80a_verilog (
  input wire RESET_n,
  input wire CLK_n,
  input wire WAIT_n,
  input wire INT_n,
  input wire NMI_n,
  input wire BUSRQ_n,
  output wire M1_n,
  output wire MREQ_n,
  output wire IORQ_n,
  output wire RD_n,
  output wire WR_n,
  output wire RFSH_n,
  output wire HALT_n,
  output wire BUSAK_n,
  output wire [15:0] A,
  inout wire [7:0] D
);

  parameter integer Mode = 0; // 0 => Z80, 1 => Fast Z80, 2 => 8080, 3 => GB

  wire CEN;
  reg Reset_s;
  wire IntCycle_n;
  wire IORQ;
  wire NoRead;
  wire Write;
  reg MREQ;
  reg MReq_Inhibit;
  reg IReq_Inhibit;
  reg Req_Inhibit;
  reg RD;
  wire MREQ_n_i;
  reg IORQ_n_i;
  wire RD_n_i;
  reg WR_n_i;
  wire WR_n_j; // da la sensación de que querían generar las escrituras de memoria y de E/S por separado
  wire RFSH_n_i;
  wire BUSAK_n_i;
  wire [15:0] A_i;
  wire [7:0] DO;
  reg [7:0] DI_Reg;
  reg Wait_s;
  wire [2:0] MCycle;
  wire [2:0] TState;

  assign CEN = 1'b1;

  assign BUSAK_n = BUSAK_n_i;
  assign MREQ_n_i = ~MREQ | (Req_Inhibit & MReq_Inhibit);
  assign RD_n_i = ~RD | Req_Inhibit;
  assign WR_n_j = WR_n_i;

  assign MREQ_n = (BUSAK_n_i == 1'b1)? MREQ_n_i : 1'bZ;
  //IORQ_n <= IORQ_n_i or IReq_Inhibit when BUSAK_n_i = '1' else 'Z';	-- 0247a
  assign IORQ_n = (BUSAK_n_i == 1'b1)? IORQ_n_i : 1'bZ;
  assign RD_n   = (BUSAK_n_i == 1'b1)? RD_n_i   : 1'bZ;
  assign WR_n   = (BUSAK_n_i == 1'b1)? WR_n_j   : 1'bZ;
  assign RFSH_n = (BUSAK_n_i == 1'b1)? RFSH_n_i : 1'bZ;
  assign A      = (BUSAK_n_i == 1'b1)? A_i      : 16'hZZZZ;
  assign D      = (BUSAK_n_i == 1'b1 && Write == 1'b1)? DO : 8'hZZ;

  // Sincronizar señal de reset con el reloj
  always @(posedge CLK_n) begin
    if (RESET_n == 1'b0)
      Reset_s <= 1'b0;
    else
      Reset_s <= 1'b1;
  end

  T80 #(.Mode(Mode), .IOWait(1'b1)) u0 (
    .CEN(CEN),
    .M1_n(M1_n),
    .IORQ(IORQ),
    .NoRead(NoRead),
    .Write(Write),
    .RFSH_n(RFSH_n_i),
    .HALT_n(HALT_n),
    .WAIT_n(Wait_s),
    .INT_n(INT_n),
    .NMI_n(NMI_n),
    .RESET_n(Reset_s),
    .BUSRQ_n(BUSRQ_n),
    .BUSAK_n(BUSAK_n_i),
    .CLK_n(CLK_n),
    .A(A_i),
    .DInst(D),
    .DI(DI_Reg),
    .DO(DO),
    .MC(MCycle),
    .TS(TState),
    .IntCycle_n(IntCycle_n)
  );

  always @(negedge CLK_n) begin
    Wait_s <= WAIT_n;  // necesitamos sincronizar WAIT? Revisar esto
    if (TState == 3'b011 && BUSAK_n_i == 1'b1)
      DI_Reg <= D;
  end
  
  // No sé muy bien para qué se necesita esta señal
  always @(posedge CLK_n) begin  // 0247a
    IReq_Inhibit <= ~IORQ;
  end

  // Generación de WR_n para ciclos de E/S
  always @(negedge CLK_n) begin // 0247a
    if (Reset_s == 1'b0)
      WR_n_i <= 1'b1;
    else begin
      if (IORQ == 1'b0) begin
        if (TState == 3'b010)
          WR_n_i <= ~Write;
        else if (TState == 3'b011)
          WR_n_i <= 1'b1;
      end
      else begin
        if (TState == 3'b001 && IORQ_n_i == 1'b0)
          WR_n_i <= ~Write;
        else if (TState == 3'b011)
          WR_n_i <= 1'b1;
      end
    end
  end
  
  // Control de Req_Inhibit. Tengo que averiguar qué hace esto
  always @(posedge CLK_n) begin  // 0247a
    if (Reset_s == 1'b0)
      Req_Inhibit <= 1'b0;
    else begin
      if (MCycle == 3'b001 && TState == 3'b010 && Wait_s == 1'b1)
        Req_Inhibit <= 1'b1;
      else
        Req_Inhibit <= 1'b0;
    end
  end
  
  // Muy parecido a Req_Inhibit...
  always @(negedge CLK_n) begin
    if (Reset_s == 1'b0)
      MReq_Inhibit <= 1'b0;
    else begin
      if (MCycle == 3'b001 && TState == 3'b010)
        MReq_Inhibit <= 1'b1;
      else
        MReq_Inhibit <= 1'b0;
    end
  end
  
  // Generador de las señales RD, MREQ y IORQ_n_i
  always @(negedge CLK_n) begin
    if (Reset_s == 1'b0) begin
      RD <= 1'b0;
      IORQ_n_i <= 1'b1;
      MREQ <= 1'b0;
    end
    else begin
      if (MCycle == 3'b001) begin
        if (TState == 3'b001) begin
          RD <= IntCycle_n;
          MREQ <= IntCycle_n;
          IORQ_n_i <= IntCycle_n;
        end
        if (TState == 3'b011) begin
          RD <= 1'b0;
          IORQ_n_i <= 1'b1;
          MREQ <= 1'b1;
        end
        if (TState == 3'b100) begin
          MREQ <= 1'b0;
        end
      end
      else begin
        if (TState == 3'b001 && NoRead == 1'b0) begin
          IORQ_n_i <= ~IORQ;
          MREQ <= ~IORQ;
          if (IORQ == 1'b0) begin
            RD <= ~Write;
          end
          else if (IORQ_n_i == 1'b0) begin
            RD <= ~Write;
          end
        end
        if (TState == 3'b011) begin
          RD <= 1'b0;
          IORQ_n_i <= 1'b1;
          MREQ <= 1'b0;
        end
      end
    end
  end
endmodule

