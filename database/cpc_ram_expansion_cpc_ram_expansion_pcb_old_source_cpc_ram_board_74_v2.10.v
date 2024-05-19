// This program was cloned from: https://github.com/revaldinho/cpc_ram_expansion
// License: GNU General Public License v3.0

// 
// cpc_ram_board netlist
// 
// netlister.py format
// 
// (c) Revaldinho, 2018
// 
//  
module cpc_ram_board ();

  // wire declarations
  supply0 VSS;

#ifdef ALT_POWER  
  supply1 VDD_EXT;
  supply1 VDD_CPC;
#endif  
  supply1 VDD;

  wire    Sound;  
  wire    A15,A14,A13,A12,A11,A10,A9,A8,A7,A6,A5,A4,A3,A2,A1,A0 ;
  wire    D7,D6,D5,D4,D3,D2,D1,D0 ;
  wire    MREQ_B;  
  wire    M1_B;
  wire    RFSH_B;
  wire    IOREQ_B;
  wire    RD_B;
  wire    WR_B;
  wire    HALT_B;
  wire    INT_B ;
  wire    NMI_B ;
  wire    BUSRQ_B;  
  wire    BUSACK_B;
  wire    READY;
  wire    BUSRESET_B;
  wire    RESET_B;
  wire    ROMEN_B;
  wire    ROMDIS ;
  wire    RAMRD_B;
  wire    RAMDIS;
  wire    CURSOR;
  wire    LPEN;
  wire    EXP_B;
  wire    CLK;

  wire    ramadrhi4,ramadrhi3,ramadrhi2,ramadrhi1,ramadrhi0;  
  wire    clken_lat_qb, ramblock_q2, ramblock_q1, ramblock_q0, n20, n21,
          n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
          n36, n37, n38, n39, n40 ;
  
  wire    wclk_b;
  wire    ramcs_b;

   
  
  #ifdef ALT_POWER  
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
#endif
  
  // Radial electolytic, one per board on the main 5V supply
  cap22uf         CAP22UF(.minus(VSS),.plus(VDD));

  // Amstrad CPC Edge Connector
  //
  // Revised pin-out to allow direct connection from ribbon cable or MX4 to RA IDC box
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
#ifdef ALT_POWER                         
                      .p24(VDD_CPC), .p23(MREQ_B),
#else                                    
                      .p24(VDD),     .p23(MREQ_B),
#endif                                   
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

  // Triple NAND3 74HCT10  
  SN7410 U0 (
             .i0_0(A14), .i0_1(ramblock_q1), .i0_2(n35), .o0(n28),
             .i1_0(n24), .i1_1(D6), .i1_2(D7), .o1(n23),
             .i2_0(A14), .i2_1(A15), .i2_2(ramblock_q0), .o2(n30),
             .vdd(VDD), .vss(VSS)
             );
  
  // Dual NOR2 74HCT02
  SN7402 U1 (
             .i0_0(n39), .i0_1(n38), .o0(RAMDIS),
             .i1_0(n37), .i1_1(n36), .o1(n39),
             .i2_0(n33), .i2_1(ramblock_q2), .o2(n37),
             .i3_0(WR_B),.i3_1(IOREQ_B), .o3(n24),
             .vdd(VDD), .vss(VSS)
             );

  // Triple NOR3 74HCT27
  SN7427 U2 (
             .i0_0(ramadrhi3), .i0_1(ramadrhi4), .i0_2(ramadrhi2), .o0(n38),
             .i1_0(A15), .i1_1(n35), .i1_2(n34), .o1(n36),
             .i2_0(CLK), .i2_1(clken_lat_qb), .i2_2(clken_lat_qb), .o2(wclk_b),
             .vdd(VDD), .vss(VSS)
             );


  // Quad NAND2 74HCT00
  SN7400 U3 (
             .i0_0(n21), .i0_1(n22), .o0(n20),
             .i1_0(n31), .i1_1(n30), .o1(n32),
             .i2_0(n32), .i2_1(n32), .o2(n33),
             .i3_0(n35), .i3_1(n21), .o3(n25),
             .vdd(VDD), .vss(VSS)
             );

  // Quad NAND2 74HCT00
  SN7400 U4 (
             .i0_0(n35), .i0_1(ramblock_q0), .o0(n27),
             .i1_0(ramblock_q1), .i1_1(n25), .o1(n26),
             .i2_0(ramblock_q1), .i2_1(n29), .o2(n31),
             .i3_0(ramblock_q0), .i3_1(ramblock_q0), .o3(n29),
             .vdd(VDD), .vss(VSS)
             );
             
  // Quad NAND2 74HCT00
  SN7400 U5 (
	     .i0_0(n27), .i0_1(n26), .o0(ramadrhi1),
             .i1_0(n29), .i1_1(n28), .o1(ramadrhi0),
	     .i2_0(n40), .i2_1(RAMDIS), .o2(ramcs_b),
	     .i3_0(VDD), .i3_1(VDD), .o3(),                          
             .vdd(VDD), .vss(VSS)
             );

  // Quad latch 74HCT75
  // 'd' is active low so take output from q rather than qb in RTL
  SN7475 U6 (
             .en01(CLK), 
             .d0(n20), .q0(clken_lat_qb), .qb0(),
             .d1(VDD), .q1(), .qb1(),
             .en23(VDD),              
             .d2(VDD), .q2(), .qb2(),
             .d3(VDD), .q3(), .qb3(),
             .vdd(VDD), .vss(VSS)
             );

  // Hex posedge triggered D-FF with clear*
  SN74174 U7 (
              .clock(wclk_b), 
              .resetb(RESET_B),
              .d0(D0), .q0(ramblock_q0),
              .d1(D1), .q1(ramblock_q1),
              .d2(D2), .q2(ramblock_q2),
              .d3(D3), .q3(ramadrhi2) ,
              .d4(D4), .q4(ramadrhi3) ,
              .d5(D5), .q5(ramadrhi4), 
              .vdd(VDD), .vss(VSS)
              );
  
  // Hex Inverter 74HCT04
  SN7404 U8 ( 
           .i0(A15), .o0(n21),
           .i1(n23), .o1(n22),
           .i2(ramblock_q2), .o2(n35),
           .i3(A14), .o3(n34),
           .i4(MREQ_B), .o4(n40),
           .i5(VDD), .o5(),
           .vdd(VDD), .vss(VSS)
           );


  // Alliance 512K x 8 SRAM - address pins wired to suit layout
  bs62lv4006  SRAM (
                    .a18(ramadrhi4),  .vcc(VDD),
                    .a16(ramadrhi2),  .a15(ramadrhi1),
                    .a14(ramadrhi0),  .a17(ramadrhi3),
                    .a12(A5),  .web(WR_B),
                    .a7(A6),  .a13(A4),
                    .a6(A7),  .a8(A2),
                    .a5(A8),  .a9(A3),
                    .a4(A9),  .a11(A1),
                    .a3(A10),  .oeb(RAMRD_B),
                    .a2(A11),  .a10(A0),
                    .a1(A13),  .csb(ramcs_b),
                    .a0(A12),  .d7(D7),
                    .d0(D0),  .d6(D6),
                    .d1(D1),  .d5(D5),
                    .d2(D2),  .d4(D4),
                    .vss(VSS),  .d3(D3)
                    );

   // Decoupling caps 
   cap100nf CAP100N_1 (.p0( VSS ), .p1( VDD ));
   cap100nf CAP100N_2 (.p0( VSS ), .p1( VDD ));
   cap100nf CAP100N_3 (.p0( VSS ), .p1( VDD ));
   cap100nf CAP100N_4 (.p0( VSS ), .p1( VDD ));
   cap100nf CAP100N_5 (.p0( VSS ), .p1( VDD ));
   cap100nf CAP100N_6 (.p0( VSS ), .p1( VDD ));  
   cap100nf CAP100N_7 (.p0( VSS ), .p1( VDD ));
   cap100nf CAP100N_8 (.p0( VSS ), .p1( VDD ));  
               
endmodule





