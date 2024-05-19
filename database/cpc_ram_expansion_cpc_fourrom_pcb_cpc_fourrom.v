// This program was cloned from: https://github.com/revaldinho/cpc_ram_expansion
// License: GNU General Public License v3.0

// 
// cpc_fourrom netlist
// 
// netlister.py format
// 
// (c) Revaldinho, 2018
// 
//  
module cpc_fourrom ();

  // wire declarations
  supply0 VSS;
  supply1 VDD_EXT;
  supply1 VDD_CPC;
  supply1 VDD;

  wire Sound;  
  wire A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0 ;
  wire D7,D6,D5,D4,D3,D2,D1,D0 ;
  wire MREQ_B;  
  wire M1_B;
  wire RFSH_B;
  wire IOREQ_B;
  wire RD_B;
  wire WR_B;
  wire HALT_B;
  wire INT_B ;
  wire NMI_B ;
  wire BUSRQ_B;  
  wire BUSACK_B;
  wire READY;
  wire BUSRESET_B;
  wire RESET_B;
  wire ROMEN_B;
  wire ROMDIS ;
  wire RAMRD_B;
  wire RAMDIS;
  wire CURSOR;
  wire LPEN;
  wire EXP_B;
  wire CLK;

  wire dip0,dip1,dip2,dip3,dip4,dip5,dip6,dip7;
  wire skt01p27, skt23p27;
  wire rom01cs_b, rom23cs_b;
  wire romoe_b;
  wire romdis_pre;
  wire roma14;
  
  wire TMS;
  wire TDI;
  wire TDO;
  wire TCK;
  
  // 3 pin header with link to use either CPC or external 5V power for the board
  hdr1x03      L1 (
                   .p1(VDD_CPC),
                   .p2(VDD),
                   .p3(VDD_EXT)
                   );

  // 3 pin Tabbed power connector for external 5V power
  powerheader3   CONN0 (
                        .vdd1(VDD_EXT),
                        .vdd2(VDD_EXT),
                        .gnd(VSS)
                        );

  // Radial electolytic, one per board on the main 5V supply
  cap22uf         CAP22UF(.minus(VSS),.plus(VDD));

  // Amstrad CPC Edge Connector
  //
  // V1.01 Corrected upper and lower rows

  idc_hdr_50w  CONN1 (
                      .p50(Sound),   .p49(VSS),
                      .p48(A15),     .p47(A14),
                      .p46(A13),     .p45(A12),
                      .p44(A11),     .p43(A10),
                      .p42(A9),      .p41(A8)
                      .p40(A7),      .p39(A6),
                      .p38(A5),      .p37(A4),
                      .p36(A3),      .p35(A2),
                      .p34(A1),      .p33(A0),
                      .p32(D7),      .p31(D6)
                      .p30(D5),      .p29(D4),
                      .p28(D3),      .p27(D2),
                      .p26(D1),      .p25(D0),
                      .p24(VDD_CPC), .p23(MREQ_B),
                      .p22(M1_B),    .p21(RFSH_B),
                      .p20(IOREQ_B), .p19(RD_B),
                      .p18(WR_B),    .p17(HALT_B),
                      .p16(INT_B),   .p15(NMI_B),
                      .p14(BUSRQ_B), .p13(BUSACK_B),
                      .p12(READY),   .p11(BUSRESET_B),
                      .p10(RESET_B), .p9 (ROMEN_B),
                      .p8 (ROMDIS),  .p7 (RAMRD_B),
                      .p6 (RAMDIS),  .p5 (CURSOR),
                      .p4 (LPEN),    .p3 (EXP_B),
                      .p2 (VSS),     .p1 (CLK),
                      ) ;

  // Standard layout JTAG port for programming the CPLD
  hdr8way JTAG (
                .p1(VSS),  .p2(VSS),
                .p3(TMS),  .p4(TDI),
                .p5(TDO),  .p6(TCK),
                .p7(VDD),  .p8(),
                );


  // DIP8 switches for CPLD config
  DIP8        dipsw0(
                     .sw0_a(dip0), .sw0_b(VDD),
                     .sw1_a(dip1), .sw1_b(VDD),
                     .sw2_a(dip2), .sw2_b(VDD),
                     .sw3_a(dip3), .sw3_b(VDD),
                     .sw4_a(dip4), .sw4_b(VDD),
                     .sw5_a(dip5), .sw5_b(VDD),
                     .sw6_a(dip6), .sw6_b(VDD),
                     .sw7_a(dip7), .sw7_b(VDD)                   
                     );

  r10k_sil9   sil0 (
                    .common(VSS),
                    .p0(dip0),
                    .p1(dip1),
                    .p2(dip2),
                    .p3(dip3),
                    .p4(dip4),
                    .p5(dip5),
                    .p6(dip6),
                    .p7(dip7)
                    );
    
  // 9572XL CPLD - 3.3V core, 5V IO
  xc9572pc44  CPLD (
                    .p1(dip7),
	            .p2(dip6),
	            .p3(dip5),
	            .p4(dip4),
	            .gck1(CLK),
	            .gck2(dip3),
	            .gck3(dip2),
	            .p8(dip1),
	            .p9(dip0),
	            .gnd1(VSS),
	            .p11(skt23p27),
	            .p12(skt01p27),
	            .p13(romoe_b),
	            .p14(MREQ_B),
	            .tdi(TDI),
	            .tms(TMS),
	            .tck(TCK),
	            .p18(roma14),
	            .p19(rom23cs_b),
	            .p20(rom01cs_b),
	            .vccint1(VDD),
	            .p22(A13),
	            .gnd2(VSS),
	            .p24(A14),
	            .p25(A15),
	            .p26(D7),
	            .p27(D6),
	            .p28(D5),
	            .p29(D4),
	            .tdo(TDO),
	            .gnd3(VSS),
	            .vccio(VDD),
	            .p33(D3),
	            .p34(D2),
	            .p35(D1),
	            .p36(D0),
	            .p37(ROMEN_B),
	            .p38(romdis_pre),
	            .gsr(RESET_B),
	            .gts2(IOREQ_B),
	            .vccint2(VDD),
	            .gts1(WR_B),
	            .p43(),            
	            .p44(RD_B),
                    );

  xc28256 ROM01 (
                .a14(roma14),  .vcc(VDD),  
                .a12(A12),  .web(skt01p27),
                .a7(A7),    .a13(A13),
                .a6(A6),     .a8(A8),
                .a5(A5),     .a9(A9),
                .a4(A4),    .a11(A11),
                .a3(A3),    .oeb(romoe_b),
                .a2(A2),    .a10(A10),
                .a1(A1),    .csb(rom01cs_b),
                .a0(A0),     .d7(D7),
                .d0(D0),     .d6(D6),
                .d1(D1),     .d5(D5),
                .d2(D2),     .d4(D4),
                .vss(VSS),   .d3(D3),
                );

  xc28256 ROM23 (
                .a14(roma14),  .vcc(VDD),  
                .a12(A12),  .web(skt23p27),
                .a7(A7),    .a13(A13),
                .a6(A6),     .a8(A8),
                .a5(A5),     .a9(A9),
                .a4(A4),    .a11(A11),
                .a3(A3),    .oeb(romoe_b),
                .a2(A2),    .a10(A10),
                .a1(A1),    .csb(rom23cs_b),
                .a0(A0),     .d7(D7),
                .d0(D0),     .d6(D6),
                .d1(D1),     .d5(D5),
                .d2(D2),     .d4(D4),
                .vss(VSS),   .d3(D3),
                );
  
  DIODE_1N4148 D0 (
                .A(romdis_pre),
                .C(ROMDIS)
                );

   // Decoupling caps for CPLD and one for SRAM
   cap100nf CAP100N_1 (.p0( VSS ), .p1( VDD ));
   cap100nf CAP100N_2 (.p0( VSS ), .p1( VDD ));
   cap100nf CAP100N_3 (.p0( VSS ), .p1( VDD ));
   cap100nf CAP100N_4 (.p0( VSS ), .p1( VDD ));

endmodule
