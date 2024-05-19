// This program was cloned from: https://github.com/revaldinho/cpc_ram_expansion
// License: GNU General Public License v3.0

// 
// t35_romboard netlist
// 
// netlister.py format
// 
// (c) Revaldinho, 2018
// 
//  
module t35_cpld_mfc ();

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

  
  wire TMS;
  wire TDI;
  wire TDO;
  wire TCK;
  
  wire romdis_pre;
  wire dout0,dout1,dout2,dout3,dout4,dout5,dout6,dout7;
  wire scl,sda;
  wire gpio0,gpio1,gpio2,gpio3,gpio4,gpio5,gpio6,gpio7;
  wire gpio8,gpio9,gpio10,gpio11,gpio12,gpio13,gpio14,gpio15;
  wire bufoe_b, bufdir;
  
  
  
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


    // Standard layout JTAG port for programming the CPLD
  hdr8way JTAG (
                .p1(VSS),  .p2(VSS),
                .p3(TMS),  .p4(TDI),
                .p5(TDO),  .p6(TCK),
                .p7(VDD),  .p8(),
                );

 idc_hdr_10w CONN2 (
		    .p1(gpio0), .p2(VDD),
		    .p3(gpio1), .p4(gpio2),
		    .p5(gpio3), .p6(gpio4),
		    .p7(gpio5), .p8(gpio6),
		    .p9(gpio7), .p10(VSS)
                    );

 idc_hdr_10w CONN3 (
		    .p1(gpio8), .p2(VDD),
		    .p3(gpio9), .p4(gpio10),
		    .p5(gpio11), .p6(gpio12),
		    .p7(gpio13), .p8(gpio14),
		    .p9(gpio15), .p10(VSS)
                    );
 i2cheader   CONN4 (
                    .vdd(VDD),
                    .scl(scl),
                    .sda(sda),
                    .gnd(VSS),
                    );
  

  
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



  teensy35_noxpins    U0 (
                          .gnd(VSS),       .vin(VDD),
                          .b16(A8),        .agnd(VSS),
                          .b17(A9),        .vdd_3v3_250ma(),
                          .d0(A0),         .c2(dout2),
                          .a12(),          .c1(dout1),
                          .a13(),          .d6(A6),
                          .d7(A7),         .d5(A5),
                          .d4(A4),         .b2(gpio2),
                          .d2(A2),         .b3(gpio3),
                          .d3(A3),         .b1(gpio1),
                          .c3(dout3),      .b0(gpio0),
                          .c4(dout4),      .c0(dout0),
                          .c6(dout6),      .d1(A1),
                          .c7(dout7),      .c5(dout5),
                          .vdd_3v3(),      .gnd2(VSS),
                          .e26(),          .dac1(),
                          .a5(),           .dac0(),
                          .a14(),          .a17(),
                          .a15(),          .c11(gpio9),
                          .a16(),          .c10(gpio8),
                          .b18(A10),       .c9(gpio7),
                          .b19(A11),       .c8(gpio6),
                          .b10(gpio10),    .e25(sda),
                          .b11(gpio11),    .e24(scl),
                          
	                                   .vusb(),         
	                                                           
	                                   .aref(),         
	                                   .a10(),          
	                                   .a11(),          
	                                   .e11(gpio15),          
	                                   .e10(gpio14),          
	                                   .d11(),          
	                                   .d15(D3),        
	                  
	                  .a28(),         .d12(D0),        
	                  .a29(),         .d13(D1),        
	                  .a26(),         .d14(D2),        
	                  .b20(A12),      .b5(gpio5),       
	                  .b22(A14),      .b4(gpio4),    
	                  .b23(A15),      .d9(gpio13),           
	                  .b21(A13),      .d8(gpio12),           
	                  .gnd5(VSS),     .vdd_3v3_1()
                  );

  // 9572 CPLD - 5V IO
  xc9572pc44  U1 (
                    .p1(gpio0),
	            .p2(gpio1),
	            .p3(gpio2),
	            .p4(gpio3),
	            .gck1(CLK),
	            .gck2(gpio4),
	            .gck3(gpio5),
	            .p8(gpio6),
	            .p9(gpio7),
	            .gnd1(VSS),
	            .p11(M1_B),
	            .p12(BUSRQ_B),
	            .p13(BUSACK_B),
	            .p14(INT_B),
	            .tdi(TDI),
	            .tms(TMS),
	            .tck(TCK),
	            .p18(A13),
	            .p19(A14),
	            .p20(A15),
	            .vccint1(VDD),
	            .p22(bufoe_b),
	            .gnd2(VSS),
	            .p24(bufdir),
	            .p25(D7),
	            .p26(D6),
	            .p27(D5),
	            .p28(D4),
	            .p29(D3),
	            .tdo(TDO),
	            .gnd3(VSS),
	            .vccio(VDD),
	            .p33(D2),
	            .p34(D1),
	            .p35(D0),
	            .p36(MREQ_B),
	            .p37(IOREQ_B),
	            .p38(WR_B),
	            .gsr(RD_B),
	            .gts2(ROMEN_B),
	            .vccint2(VDD),
	            .gts1(READY),
	            .p43(romdis_pre),
	            .p44(RESET_B),
                    );
  
  SN74245  U2 (
               .dir(bufdir),     .vdd(VDD),
               .a0(D7),       .gb(bufoe_b),
               .a1(D6),       .b0(dout7),
               .a2(D5),       .b1(dout6),
               .a3(D4),       .b2(dout5),
               .a4(D3),       .b3(dout4),
               .a5(D2),       .b4(dout3),
               .a6(D1),       .b5(dout2),
               .a7(D0),       .b6(dout1),
               .vss(VSS),     .b7(dout0),
               );
  
  
  DIODE_1N4148 D0 (
                .A(romdis_pre),
                .C(ROMDIS)
                );

   // Decoupling caps for 74 +CPLD logic only - T35 has its own
   cap100nf CAP100N_1 (.p0( VSS ), .p1( VDD ));
   cap100nf CAP100N_2 (.p0( VSS ), .p1( VDD ));
   cap100nf CAP100N_3 (.p0( VSS ), .p1( VDD ));  

endmodule
