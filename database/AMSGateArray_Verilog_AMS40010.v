// ===============================================================================
//
//  Amstrad CPC Gate Array for Xilinx X95288XL
//
//  Copyright (C) 2021 Darren Johnstone <darren@darrenjohnstone.scot>
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
//      Acknowledgements:
//
//  Based on 40010-simplified_V03.pdf by Gerald 
//  (https://www.cpcwiki.eu/forum/amstrad-cpc-hardware/gate-array-decapped!) 
//  
//  Partially based on  the Amstrad MiSTer core by Gyorgy Szombathelyi
//  https://github.com/MiSTer-devel/Amstrad_MiSTer
// ===============================================================================
module AMS40010(input PAD_RESET_n,
                input PAD_MREQ_n,
                input PAD_M1_n,
                input PAD_RD_n,
                input PAD_IORQ_n,
                input PAD_16MHz,
                input PAD_HSYNC,
                input PAD_VSYNC,
                input PAD_DISPEN,
                input A15,
                input A14,
                input D0,
                input D1,
                input D2,
                input D3,
                input D4,
                input D5,
                input D6,
                input D7,
                output PAD_RAS_n,
                output PAD_READY,
                output PAD_CASAD_n,
                output PAD_CPU,
                output PAD_MWE_n,
                output PAD_244E_n,
                output PAD_CCLK,
                output PAD_PHI_n,
                inout PAD_CAS_n,
                output PAD_SYNC_n,
                output PAD_INT_n,
                output PAD_RED,
                output PAD_GREEN,
                output PAD_BLUE,
                output PAD_ROMEN_n,
                output PAD_RAMRD_n);
  // Data bus
  wire[7 : 0] D = { D7, D6, D5, D4, D3, D2, D1, D0 };
  // Sequencer
  wire[7 : 0] S;
  wire CLK_n = ~PAD_16MHz;
  wire RESET = ~PAD_RESET_n;
  Sequencer sequencer(.RESET(RESET),
                      .M1_n(PAD_M1_n),
                      .IORQ_n(PAD_IORQ_n),
                      .RD_n(PAD_RD_n),
                      .CLK_n(CLK_n),
                      .S(S));
  // Sequence Decoder
  wire RAS_n;
  wire READY;
  wire CASAD_n;
  wire CPU_n;
  wire MWE_n;
  wire s244E_n;
  wire CCLK;
  wire PHI_n;
  SequenceDecoder sequenceDecoder(.S(S),
                                  .RD_n(PAD_RD_n),
                                  .IORQ_n(PAD_IORQ_n),
                                  .CLK_n(CLK_n),
                                  .RAS_n(RAS_n),
                                  .READY(READY),
                                  .CASAD_n(CASAD_n),
                                  .CPU_n(CPU_n),
                                  .MWE_n(MWE_n),
                                  .s244E_n(s244E_n),
                                  .CCLK(CCLK),
                                  .PHI_n(PHI_n));
  // CAS Generator
  wire CAS_n;
  CasGen casGen(.PHI_n(PHI_n),
                .RESET(RESET),
                .MREQ_n(PAD_MREQ_n),
                .M1_n(PAD_M1_n),
                .S(S),
                .CLK_n(CLK_n),
                .CAS_n(CAS_n));
  // Registers
  wire IRQ_RESET;
  wire[1 : 0] MODE;
  wire[15 : 0] INKR4;
  wire[15 : 0] INKR3;
  wire[15 : 0] INKR2;
  wire[15 : 0] INKR1;
  wire[15 : 0] INKR0;
  wire[4 : 0] BORDER;
  wire HROMEN;
  wire LROMEN;

  Registers registers(.RESET(RESET),
                      .CLK_n(CLK_n),
                      .IORQ_n(PAD_IORQ_n),
                      .M1_n(PAD_M1_n),
                      .A15(A15),
                      .A14(A14),
                      .S0(S[0]),
                      .S7(S[7]),
                      .D(D),
                      .IRQ_RESET(IRQ_RESET),
                      .MODE(MODE),
                      .INKR4(INKR4),
                      .INKR3(INKR3),
                      .INKR2(INKR2),
                      .INKR1(INKR1),
                      .INKR0(INKR0),
                      .BORDER(BORDER),
                      .HROMEN(HROMEN),
                      .LROMEN(LROMEN));
  // VSync
  wire NSYNC;
  wire INT_n;
  wire MODE_SYNC;
  wire HCNTLT28;
  VSync vsync(
              .CLK_n(CLK_n),
              .CCLK(CCLK),
              .RESET(RESET),
              .M1_n(PAD_M1_n),
              .IORQ_n(PAD_IORQ_n),
              .HSYNC(PAD_HSYNC),
              .VSYNC(PAD_VSYNC),
              .IRQ_RESET(IRQ_RESET),
              .HCNTLT28(HCNTLT28),
              .NSYNC(NSYNC),
              .INT_n(INT_n),
              .MODE_SYNC(MODE_SYNC));
  // Video Buffer
  wire[7 : 0] VIDEO_BUF;
  wire DISPEN_BUF;
  VideoBuffer videoBuffer(.CAS_n_in(PAD_CAS_n),
                          .DISPEN(PAD_DISPEN),
                          .D(D),
                          .S3(S[3]),
                          .VIDEO_BUF(VIDEO_BUF),
                          .DISPEN_BUF(DISPEN_BUF));
  // ROM Mapping
  wire ROMEN_n;
  wire RAMRD_n;
  ROMMapping romMapping(.HROMEN(HROMEN),
                        .LROMEN(LROMEN),
                        .A15(A15),
                        .A14(A14),
                        .RD_n(PAD_RD_n),
                        .MREQ_n(PAD_MREQ_n),
                        .ROMEN_n(ROMEN_n),
                        .RAMRD_n(RAMRD_n));
  // Video Control
  wire KEEP;
  wire SHIFT;
  wire LOAD;
  wire COLOUR_KEEP;
  wire INK_SEL;
  wire BORDER_SEL;
  wire MODE_IS_0;
  wire MODE_IS_2;
  VideoControl videoControl(.PHI_n(PHI_n),
                            .CLK_n(CLK_n),
                            .DISPEN_BUF(DISPEN_BUF),
                            .S5(S[5]),
                            .S6(S[6]),
                            .MODE_SYNC(MODE_SYNC),
                            .MODE(MODE),
                            .KEEP(KEEP),
                            .SHIFT(SHIFT),
                            .LOAD(LOAD),
                            .COLOUR_KEEP(COLOUR_KEEP),
                            .INK_SEL(INK_SEL),
                            .BORDER_SEL(BORDER_SEL),
                            .MODE_IS_0(MODE_IS_0),
                            .MODE_IS_2(MODE_IS_2));
  // Video Shift
  wire[3 : 0] CIDX;
  VideoShift videoShift(.CLK_n(CLK_n),
                        .VIDEO(VIDEO_BUF),
                        .KEEP(KEEP),
                        .SHIFT(SHIFT),
                        .LOAD(LOAD),
                        .CIDX(CIDX));
  // ColourMux
  wire[4 : 0] COLOUR;
  ColourMux colourMux(.CLK_n(CLK_n),
                      .CIDX(CIDX),
                      .COLOUR_KEEP(COLOUR_KEEP),
                      .INK_SEL(INK_SEL),
                      .BORDER_SEL(BORDER_SEL),
                      .MODE_IS_0(MODE_IS_0),
                      .MODE_IS_2(MODE_IS_2),
                      .INKR4(INKR4),
                      .INKR3(INKR3),
                      .INKR2(INKR2),
                      .INKR1(INKR1),
                      .INKR0(INKR0),
                      .BORDER(BORDER),
                      .COLOUR(COLOUR));
  // ColourDecode
  wire RED;
  wire RED_OEn;
  wire GREEN;
  wire GREEN_OEn;
  wire BLUE;
  wire BLUE_OEn;
  ColourDecode colourDecode(.CLK_n(CLK_n),
                            .HSYNC(PAD_HSYNC),
                            .HCNTLT28(HCNTLT28),
                            .COLOUR(COLOUR),
                            .RED(RED),
                            .RED_OEn(RED_OEn),
                            .GREEN(GREEN),
                            .GREEN_OEn(GREEN_OEn),
                            .BLUE(BLUE),
                            .BLUE_OEn(BLUE_OEn));
  // Outputs
  assign PAD_RAS_n = RAS_n;
  assign PAD_READY = READY;
  assign PAD_CASAD_n = CASAD_n;
  assign PAD_CPU = CPU_n;
  assign PAD_MWE_n = MWE_n;
  assign PAD_244E_n = s244E_n;
  assign PAD_CCLK = CCLK;
  assign PAD_PHI_n = PHI_n;
  assign PAD_CAS_n = CAS_n;
  assign PAD_SYNC_n = NSYNC;
  assign PAD_INT_n = INT_n;

  assign PAD_RED = RED_OEn ? 1'bz : RED;
  assign PAD_BLUE = BLUE_OEn ? 1'bz : BLUE;
  assign PAD_GREEN = GREEN_OEn ? 1'bz : GREEN;
  assign PAD_ROMEN_n = ROMEN_n;
  assign PAD_RAMRD_n = RAMRD_n;
endmodule
