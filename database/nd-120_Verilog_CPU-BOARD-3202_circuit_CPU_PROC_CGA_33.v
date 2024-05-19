// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 CPU, MM&M                                                       **
** CPU/PROC/CGA                                                          **
** CPU GATE ARRAY                                                        **
** SHEET 33 of 50                                                        **
**                                                                       ** 
** Last reviewed: 14-JAN-2024                                            **
** Ronny Hansen                                                          **
***************************************************************************/
/* verilator lint_off UNUSED */

module CPU_PROC_CGA_33( 
   input        ALUCLK,
   input        BEDO_n,
   input        BEMPID_n,
   input        BSTP,
   input [15:0] CD_15_0,
   input [63:0] CSBITS,
   input        ETRAP_n,
   input        EWCA_n,
   input        IBINT10_n,
   input        IBINT11_n,
   input        IBINT12_n,
   input        IBINT13_n,
   input        IBINT15_n,
   input        IOXERR_n,
   input        LCS_n,
   input        MAP_n,
   input        MCLK,
   input        MOR_n,
   input        MR_n,
   input        PAN_n,
   input        PARERR_n,
   input        POWFAIL_n,
   input [6:0]  PT_15_9,
   input        UCLK,

   input [2:0]  SEL_TESTMUX, // Selects testmux signals to output on TEST_4_0

   // in and out
   input  [15:0] FIDB_15_0_IN,
   output [15:0] FIDB_15_0_OUT,

   // Outputs

   output        ACOND_n,
   output        CGABRK_n,
   output [12:0] CSA_12_0,
   output [9:0]  CSCA_9_0,
   output        DOUBLE,
   output        ECCR,
   output        ERF_n, // Not in use, its fetched from PAL 44407A, pin ERF_n (which seems to have the same logic..)   
   output        INTRQ_n_tp1,
   output        IONI,
   output [3:0]  LAA_3_0,
   output [13:0] LA_23_10,
   output [3:0]  LBA_3_0,
   output        LSHADOW,
   output [1:0]  PCR_1_0,
   output [3:0]  PIL_3_0,
   output        PONI,
   output [1:0]  RF_1_0,
   output [4:0]  TEST_4_0,
   output        TRAP_n,
   output        WCS_n,
   output        WRTRF
);
 
 
   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/



// Wire's out from the CHIP_34G
wire s_IBINT10_n;
wire s_IBINT11_n;
wire s_IBINT12_n;
wire s_IBINT13_n;
wire s_IBINT15_n;


/*
   TTL_74374   CHIP_34G (.CK(s_logisimNet3),
                         .D1(1'b0),
                         .D2(1'b0),
                         .D3(1'b0),
                         .D4(s_logisimNet84),
                         .D5(s_logisimNet33),
                         .D6(s_logisimNet85),
                         .D7(s_logisimNet34),
                         .D8(s_logisimNet86),
                         .OE_n(s_logisimNet72),
                         .Q1(),
                         .Q2(),
                         .Q3(),
                         .Q4(s_logisimNet111),
                         .Q5(s_logisimNet22),
                         .Q6(s_logisimNet112),
                         .Q7(s_logisimNet23),
                         .Q8(s_logisimNet113));
*/


// Connect output signals to the wires
wire [7:0] chip_34q;
assign  s_IBINT10_n = chip_34q[7];
assign  s_IBINT11_n = chip_34q[6];
assign  s_IBINT12_n = chip_34q[5];
assign  s_IBINT13_n = chip_34q[4];
assign  s_IBINT15_n = chip_34q[3];


TTL_74374 CHIP_34G (
    .CK(~ALUCLK), //7F (Smith with 1's complement) ?
    .D({IBINT10_n, IBINT11_n, IBINT12_n, IBINT13_n, IBINT15_n, 3'b000}), // 8-bit D input, lower 3 bits unused
    .OE_n('b0), // GND
    .Q(chip_34q) // 8-bit Q output, lower 3 bits ignored      
);




  


// *************** MICROCODE INPUTS ***************
// CSBITS 63-55 => CSALUI_8_0
wire [8:0] s_CSALUI_8_0;
assign s_CSALUI_8_0 = CSBITS[63:55];

// CSBITS 54-53 => CSSTSS_1_0
wire [1:0] s_CSSTSS_1_0;
assign s_CSSTSS_1_0 = CSBITS[54:53];

// CSBITS 52-51 => CSRASEL_1_0
wire [1:0] s_CSRASEL_1_0;
assign s_CSRASEL_1_0 = CSBITS[52:51];

// CSBITS 50 => CSXREF3
wire s_CSXREF3;
assign s_CSXREF3 = CSBITS[50];

// CSBITS 49-48 => CSRBSEL_1_0
wire [1:0] s_CSRBSEL_1_0;
assign s_CSRBSEL_1_0 = CSBITS[49:48];

// CSBITS 47-46 => CSCINSEL_1_0
wire [1:0] s_CSCINSEL_1_0;
assign s_CSCINSEL_1_0 = CSBITS[47:46];

// CSBITS 45-44 => CSALUM_1_0
wire [1:0] s_CSALUM_1_0;
assign s_CSALUM_1_0 = CSBITS[45:44];

// CSBITS 43-42 => CSMIS_1_0
wire [1:0] s_CSMIS_1_0;
assign s_CSMIS_1_0 = CSBITS[43:42];

// CSBITS 41-37 => CSIDBS_4_0
wire [4:0] s_CSIDBS_4_0;
assign s_CSIDBS_4_0 = CSBITS[41:37];

// CSBITS 36-32 => CSCOMM_4_0
wire [4:0] s_CSCOMM_4_0;
assign s_CSCOMM_4_0 = CSBITS[36:32];

// CSBITS 31-28 => CSTS_6_3
wire [3:0] s_CSTS_6_3;
assign s_CSTS_6_3 = CSBITS[31:28];

// CSBITS 27-26 => CSDELAY_1_0 (Not used by CGA, its used outside to control the clock cycles ?)
//wire [1:0] s_CSDELAY_1_0;
//assign s_CSDELAY_1_0 = CSBITS[27:26];

// CSBITS 25 => CSVECT
wire s_CSVECT;
assign s_CSVECT = CSBITS[25];

// CSBITS 24 => CSSCOND
wire s_CSSCOND;
assign s_CSSCOND = CSBITS[24];

// CSBITS 23 => CSECOND
wire s_CSECOND;
assign s_CSECOND = CSBITS[23];

// CSBITS 22 => CSLOOP
wire s_CSLOOP;
assign s_CSLOOP = CSBITS[22];

// CSBITS 21 => CSDLY (Not used by CGA, its used outside to control the clock cycles ?)
//wire s_CSDLY;
//assign s_CSDLY = CSBITS[21];

// CSBITS 20 => CSBIT20
wire s_CSBIT20;
assign s_CSBIT20 = CSBITS[20];

// CSBITS 19-16 => CSRB_3_0
wire [3:0] s_CSRB_3_0;
assign s_CSRB_3_0 = CSBITS[19:16];

// CSBITS 15-0 => CSBIT_15_0
wire [15:0] s_CSBIT_15_0;
assign s_CSBIT_15_0 = CSBITS[15:0];


// ************ END OF MICROCODE INPUTS ************

CGA DELILAH (

/************ INPUT SIGNALS ********************/     
   .XALUCLK(ALUCLK),
   .XBINT10N(s_IBINT10_n),
   .XBINT11N(s_IBINT11_n),
   .XBINT12N(s_IBINT12_n),
   .XBINT13N(s_IBINT13_n),
   .XBINT15N(s_IBINT15_n),
   .XCD_15_0(CD_15_0),

   // *** CSBITS 63-0 (ND-120/CX 64-bit Microcode input to CGA) ***
   .XCSALUI_8_0(s_CSALUI_8_0),
   .XCSSST_1_0(s_CSSTSS_1_0),
   .XCSRASEL_1_0(s_CSRASEL_1_0),
   .XCSXRF3(s_CSXREF3),
   .XCSRBSEL_1_0(s_CSRBSEL_1_0),
   .XCSCINSEL_1_0(s_CSCINSEL_1_0),
   .XCSALUM_1_0(s_CSALUM_1_0),
   .XCSMIS_1_0(s_CSMIS_1_0),
   .XCSIDBS_4_0(s_CSIDBS_4_0),
   .XCSCOMM_4_0(s_CSCOMM_4_0),
   .XCSTS_6_3(s_CSTS_6_3),
   //.XCSDELAY_1_0(s_CSDELAY_1_0),
   .XCSVECT(s_CSVECT),
   .XCSSCOND(s_CSSCOND),
   .XCSECOND(s_CSECOND),
   .XCSLOOP(s_CSLOOP),
   // .XCSDLY(s_CSDLY),
   .XCSBIT20(s_CSBIT20),
   .XCSRB_3_0(s_CSRB_3_0),
   .XCSBIT_15_0(s_CSBIT_15_0),
   // *** CSBITS 63-0 (END) ***
   
   .XEDON(BEDO_n),
   .XEMPIDN(BEMPID_n),
   .XETRAPN(ETRAP_n),
   .XEWCAN(EWCA_n),
   .XFIDB_15_0_IN(FIDB_15_0_IN),
   .XFIDB_15_0_OUT(FIDB_15_0_OUT),
   .XFTRAPN(1'b1),
   .XVTRAPN(1'b1),
   .XILCSN(LCS_n),
   .XIOXERRN(IOXERR_n),
   .XMAPN(MAP_n),
   .XMCLK(MCLK),
   .XMORN(MOR_n),
   .XMRN(MR_n),
   .XPANN(PAN_n),
   .XPARERRN(PARERR_n),
   .XPOWFAILN(POWFAIL_n),
   .XPTSTN(1'b1),
   .XPT_9_15(PT_15_9),
   .XSPARE(1'b1),
   .XSTP(BSTP),
   .XTCLK(UCLK),
   .XTSEL_2_0(SEL_TESTMUX), // Selects testmux signals to output


/************ OUTPUT SIGNALS ********************/

   .XACONDN(ACOND_n),
   .XBRKN(CGABRK_n),
   .XDOUBLE(DOUBLE),
   .XECCR(ECCR),
   .XERFN (ERF_n),  // Not in use (not connected) - Signals is instead fetched from PAL 44407A, pin ERF_n (which seems to have the same logic..)
   .XINTRQN(INTRQ_n_tp1),
   .XIONI(IONI),
   .XLAA_3_0(LAA_3_0),
   .XLA_23_10(LA_23_10),
   .XLBA_3_0(LBA_3_0),
   .XLSHADOW(LSHADOW),
   .XMA_12_0(CSA_12_0),
   .XMCA_9_0(CSCA_9_0),
   .XPCR_1_0(PCR_1_0),
   .XPIL_3_0(PIL_3_0),
   .XPONI(PONI),
   .XRF_1_0(RF_1_0),
   .XTEST_4_0(TEST_4_0),
   .XTRAPN(TRAP_n),
   .XWCSN(WCS_n),
   .XWRTRF(WRTRF)
);

endmodule
