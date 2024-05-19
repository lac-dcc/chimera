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
module t35_romboard ();

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

  wire romdis_pre;
  wire dout0,dout1,dout2,dout3,dout4,dout5,dout6,dout7;
  wire romvalid, bufoe_b, romdis_b, romen;
  wire VSS_pulldown;
    
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
                      .p24(VDD), .p23(MREQ_B),
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
                          .a12(D0),          .c1(dout1),
                          .a13(D1),          .d6(A6),
                          .d7(A7),         .d5(A5),
                          .d4(A4),         .b2(WR_B),
                          .d2(A2),         .b3(RD_B),
                          .d3(A3),         .b1(IOREQ_B),
                          .c3(dout3),      .b0(MREQ_B),
                          .c4(dout4),      .c0(dout0),
                          .c6(dout6),      .d1(A1),
                          .c7(dout7),      .c5(dout5),
                          .vdd_3v3(),      .gnd2(VSS),
                          .e26(),          .dac1(),
                          .a5(),           .dac0(),
                          .a14(D2),          .a17(D5),
                          .a15(D3),          .c11(),
                          .a16(D4),          .c10(),
                          .b18(A10),       .c9(READY),
                          .b19(A11),       .c8(romvalid),
                          .b10(ROMEN_B),      .e25(READY),
                          .b11(M1_B),       .e24(CLK),
                          
	                          .vusb(),         
	                                                           
	          		  .aref(),         
	          		  .a10(),          
	          		  .a11(),          
	          		  .e11(),          
	                          .e10(),          
	                          .d11(),          
	                          .d15(),        
	                                                   
	                  .a28(),         .d12(),        
	                  .a29(),         .d13(),        
	                  .a26(),         .d14(),        
	                  .b20(A12),      .b5(),       
	                  .b22(A14),      .b4(),    
	                  .b23(A15),      .d9(),           
	                  .b21(A13),      .d8(),           
	                  .gnd5(VSS),      .vdd_3v3_1()
                          );

  SN74245  U1 (
               .dir(VSS_pulldown), .vdd(VDD),
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
  
  SN7400   U2 ( .i0_0(romvalid), .i0_1(A14), .o0(romdis_b),
                .i1_0(romdis_b), .i1_1(romdis_b), .o1(romdis_pre),
                .i2_0(ROMEN_B), .i2_1(ROMEN_B), .o2(romen),
                .i3_0(romen), .i3_1(romdis_pre), .o3(bufoe_b),
                .vss(VSS), .vdd(VDD)
               );
  
  
  DIODE_1N4148 D0 (
                .A(romdis_pre),
                .C(ROMDIS)
                );

  // Pull down resistor to allow 74LS logic buffer
  resistor  RES10K_0(
                   .p0(VSS),
                   .p1(VSS_pulldown)
                   );
  

   // Decoupling caps for 74 logic only - T35 has its own
   cap100nf CAP100N_1 (.p0( VSS ), .p1( VDD ));
   cap100nf CAP100N_2 (.p0( VSS ), .p1( VDD ));

endmodule
