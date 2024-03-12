//
// cpc_eightrom netlist
//
// netlister.py format
//
// (c) Revaldinho, 2018
//
//
module cpc_eightrom ();

  // wire declarations
  supply0 GND;
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
  wire lat_en, lat_en_b;
  wire q0,q1,q2,q3,q4,q5,q6,q7;
  wire n1, n2, n3 ;
  wire cs0_b;
  wire cs1_b;
  wire cs2_b;
  wire cs3_b;
  wire cs4_b;
  wire cs5_b;
  wire cs6_b;
  wire cs7_b;
  wire s0_b;
  wire s1_b;
  wire s2_b;
  wire s6_b;
  wire s3_b;
  wire s7_b;
  wire s4_b;
  wire s5_b;
  wire romdis_pre;
  wire romcs01_b;
  wire romcs23_b;
  wire romcs45_b;
  wire romcs67_b;
  wire bank;
  wire eprom01_a14;
  wire eprom23_a14;
  wire eprom45_a14;
  wire eprom67_a14;
  // Radial electolytic, one per board on the main 5V supply
  cap22uf         CAP22UF(.minus(GND),.plus(VDD));

  // Amstrad CPC Edge Connector
  //
  // V1.01 Corrected upper and lower rows

  idc_hdr_50w  CONN1 (
                      .p50(Sound),   .p49(GND),
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
                      .p24(VDD),     .p23(MREQ_B),
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
                      .p2 (GND),     .p1 (CLK),
                      ) ;


  // Octal latch 74HCT573
  SN74573 U0 ( .oeb(GND),   .vdd(VDD),
              .d0(D0),      .q0(q0),
              .d1(D1),      .q1(q1),
              .d2(D2),      .q2(q2),
              .d3(D3),      .q3(q3),
              .d4(D4),      .q4(q4),
              .d5(D5),      .q5(q5),
              .d6(D6),      .q6(q6),
              .d7(D7),      .q7(q7),
              .vss(GND),    .le(lat_en));

  // 74137 3-to-8 line decoder/demultiplexer with address latch
  SN74138 U1 (
              .a0(q0),          .vdd(VDD),
              .a1(q1),          .qb0(s0_b),
              .a2(q2),          .qb1(s1_b),
              .e1b(n1),         .qb2(s2_b),
              .e2b(n3),         .qb3(s3_b),
              .e3(A14),         .qb4(s4_b),
              .qb7(s7_b),       .qb5(s5_b),
              .vss(GND),        .qb6(s6_b) );

  // Quad AND2 74HCT08
  SN7408 U2 (
             .i0_0(cs0_b), .i0_1(cs1_b), .o0(romcs01_b),
             .i1_0(cs4_b), .i1_1(cs5_b), .o1(romcs45_b),
             .i2_0(cs6_b), .i2_1(cs7_b), .o2(romcs67_b),
             .i3_0(cs3_b), .i3_1(cs2_b), .o3(romcs23_b),

             .vdd(VDD), .vss(GND));

  // 7430 - 8 input NAND
  SN7430 U3 (
             .i0(cs0_b),      .vdd(VDD),
             .i1(cs1_b),      .nc1(),
             .i2(cs2_b),      .i6(cs6_b),
             .i3(cs3_b),      .i7(cs7_b),
             .i4(cs4_b),      .nc2(),
             .i5(cs5_b),      .nc3(),
             .vss(GND),       .o(romdis_pre));

  // Trip1e OR3 74HCT27
  SN7427 U4 (
             .i0_0(q7), .i0_1(q6), .i0_2(q5), .o0(n2),
             .i1_0(A13), .i1_1(WR_B), .i1_2(IOREQ_B), .o1(lat_en_b),
             .i2_0(n2), .i2_1(q4), .i2_2(ROMEN_B), .o2(n3),
             .vdd(VDD), .vss(GND));

  // Quad XOR2 74HCT86
  SN7486 U5 (
             .i0_0(bank), .i0_1(q3), .o0(n1),      // XOR
             .i1_0(VDD), .i1_1(VDD), .o1(),        // unused
             .i2_0(VDD), .i2_1(VDD), .o2(),        // unused
             .i3_0(lat_en_b), .i3_1(VDD), .o3(lat_en), // Inverter
             .vdd(VDD), .vss(GND));



  // DIP switches for EEPROM/EPROM selection
  DIP4        dip_b(
                     // ROMA14 is Q0 bit from ROM selection - high for ODD ROMs
                     .sw0_a(q0), .sw0_b(eprom01_a14),
                     .sw1_a(q0), .sw1_b(eprom23_a14),
                     .sw2_a(q0), .sw2_b(eprom45_a14),
                     .sw3_a(q0), .sw3_b(eprom67_a14),
                     );


  hdr1x03     bank ( .p1(GND),
                     .p2(bank),
                     .p3(VDD)
                     );

  r10k_sil5   sil1 (
                    .common(VDD),
                    .p0(eprom01_a14),
                    .p1(eprom23_a14),
                    .p2(eprom45_a14),
                    .p3(eprom67_a14),
                    );


  // DIP8 switches for ROM selection
  DIP8        dip_a(
                     .sw0_a(s0_b), .sw0_b(cs0_b),
                     .sw1_a(s1_b), .sw1_b(cs1_b),
                     .sw2_a(s2_b), .sw2_b(cs2_b),
                     .sw3_a(s3_b), .sw3_b(cs3_b),
                     .sw4_a(s4_b), .sw4_b(cs4_b),
                     .sw5_a(s5_b), .sw5_b(cs5_b),
                     .sw6_a(s6_b), .sw6_b(cs6_b),
                     .sw7_a(s7_b), .sw7_b(cs7_b)
                     );

  r10k_sil9   sil0 (
                    .common(VDD),
                    .p0(cs0_b),
                    .p1(cs1_b),
                    .p2(cs2_b),
                    .p3(cs3_b),
                    .p4(cs4_b),
                    .p5(cs5_b),
                    .p6(cs6_b),
                    .p7(cs7_b)
                    );

  xc28256 ROM01 (
                .a14(q0),  .vcc(VDD),
                .a12(A12),  .web(eprom01_a14),
                .a7(A7),    .a13(A13),
                .a6(A6),     .a8(A8),
                .a5(A5),     .a9(A9),
                .a4(A4),    .a11(A11),
                .a3(A3),    .oeb(ROMEN_B),
                .a2(A2),    .a10(A10),
                .a1(A1),    .csb(romcs01_b),
                .a0(A0),     .d7(D7),
                .d0(D0),     .d6(D6),
                .d1(D1),     .d5(D5),
                .d2(D2),     .d4(D4),
                .vss(GND),   .d3(D3),
                );

  xc28256 ROM23 (
                .a14(q0),  .vcc(VDD),
                .a12(A12),  .web(eprom23_a14),
                .a7(A7),    .a13(A13),
                .a6(A6),     .a8(A8),
                .a5(A5),     .a9(A9),
                .a4(A4),    .a11(A11),
                .a3(A3),    .oeb(ROMEN_B),
                .a2(A2),    .a10(A10),
                .a1(A1),    .csb(romcs23_b),
                .a0(A0),     .d7(D7),
                .d0(D0),     .d6(D6),
                .d1(D1),     .d5(D5),
                .d2(D2),     .d4(D4),
                .vss(GND),   .d3(D3),
                );

  xc28256 ROM45 (
                .a14(q0),  .vcc(VDD),
                .a12(A12),  .web(eprom45_a14),
                .a7(A7),    .a13(A13),
                .a6(A6),     .a8(A8),
                .a5(A5),     .a9(A9),
                .a4(A4),    .a11(A11),
                .a3(A3),    .oeb(ROMEN_B),
                .a2(A2),    .a10(A10),
                .a1(A1),    .csb(romcs45_b),
                .a0(A0),     .d7(D7),
                .d0(D0),     .d6(D6),
                .d1(D1),     .d5(D5),
                .d2(D2),     .d4(D4),
                .vss(GND),   .d3(D3),
                );

  xc28256 ROM67 (
                .a14(q0),  .vcc(VDD),
                .a12(A12),  .web(eprom67_a14),
                .a7(A7),    .a13(A13),
                .a6(A6),     .a8(A8),
                .a5(A5),     .a9(A9),
                .a4(A4),    .a11(A11),
                .a3(A3),    .oeb(ROMEN_B),
                .a2(A2),    .a10(A10),
                .a1(A1),    .csb(romcs67_b),
                .a0(A0),     .d7(D7),
                .d0(D0),     .d6(D6),
                .d1(D1),     .d5(D5),
                .d2(D2),     .d4(D4),
                .vss(GND),   .d3(D3),
                );

  DIODE_1N4148 D0 (
                .A(romdis_pre),
                .C(ROMDIS)
                );

   // Decoupling caps for CPLD and one for SRAM
   cap100nf CAP100N_1 (.p0( GND ), .p1( VDD ));
   cap100nf CAP100N_2 (.p0( GND ), .p1( VDD ));
   cap100nf CAP100N_3 (.p0( GND ), .p1( VDD ));
   cap100nf CAP100N_4 (.p0( GND ), .p1( VDD ));
   cap100nf CAP100N_5 (.p0( GND ), .p1( VDD ));
   cap100nf CAP100N_6 (.p0( GND ), .p1( VDD ));
   cap100nf CAP100N_7 (.p0( GND ), .p1( VDD ));
   cap100nf CAP100N_8 (.p0( GND ), .p1( VDD ));

endmodule
