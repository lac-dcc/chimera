// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>ddr3_wrap
 * @file ddr3_wrap.v
 * @date 2015-04-20  
 * @author Andrey Filippov     
 *
 * @brief ddr3 model wrapper to include delays matching hardware
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * ddr3_wrap.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  ddr3_wrap.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
//`timescale 1ns/1ps
`timescale 1ps / 1ps

module  ddr3_wrap#(
    parameter ADDRESS_NUMBER =      15,
    parameter TRISTATE_DELAY_CLK =   4'h2,
    parameter TRISTATE_DELAY =       0,
    parameter CLK_DELAY =            1500,
    parameter CMDA_DELAY =           1500,
    parameter DQS_IN_DELAY =         1500,
    parameter DQ_IN_DELAY =          1500,
    parameter DQS_OUT_DELAY =        1500,
    parameter DQ_OUT_DELAY =         1500
    )(
    input                       mclk,
    input                [1:0]  dq_tri,
    input                [1:0]  dqs_tri,
    
    input                       SDRST, // DDR3 reset (active low)
    input                       SDCLK, // DDR3 clock differential output, positive
    input                       SDNCLK,// DDR3 clock differential output, negative
    input  [ADDRESS_NUMBER-1:0] SDA,   // output address ports (14:0) for 4Gb device
    input                 [2:0] SDBA,  // output bank address ports
    input                       SDWE,  // output WE port
    input                       SDRAS, // output RAS port
    input                       SDCAS, // output CAS port
    input                       SDCKE, // output Clock Enable port
    input                       SDODT, // output ODT port

    inout                [15:0] SDD,   // DQ  I/O pads
    input                       SDDML, // LDM  I/O pad (actually only output)
    inout                       DQSL,  // LDQS I/O pad
    inout                       NDQSL, // ~LDQS I/O pad
    input                       SDDMU, // UDM  I/O pad (actually only output)
    inout                       DQSU,  // UDQS I/O pad
    inout                       NDQSU //,

);
    localparam CLK_DELAY_H =            CLK_DELAY/4;
    localparam CMDA_DELAY_H =           CMDA_DELAY/4;
    localparam DQS_IN_DELAY_H =         DQS_IN_DELAY/4;
    localparam DQ_IN_DELAY_H =          DQ_IN_DELAY/4;
    localparam DQS_OUT_DELAY_H =        DQS_OUT_DELAY/4;
    localparam DQ_OUT_DELAY_H =         DQ_OUT_DELAY/4;
    
    wire                      #(CLK_DELAY_H)  SDCLK_H1 =   SDCLK;
    wire                      #(CLK_DELAY_H)  SDNCLK_H1 =  SDNCLK;
    wire                      #(CMDA_DELAY_H) SDRST_H1 =   SDRST;
    wire [ADDRESS_NUMBER-1:0] #(CMDA_DELAY_H) SDA_H1 =     SDA;
    wire                [2:0] #(CMDA_DELAY_H) SDBA_H1 =    SDBA;
    wire                      #(CMDA_DELAY_H) SDWE_H1 =    SDWE;
    wire                      #(CMDA_DELAY_H) SDRAS_H1 =   SDRAS;
    wire                      #(CMDA_DELAY_H) SDCAS_H1 =   SDCAS;
    wire                      #(CMDA_DELAY_H) SDCKE_H1 =   SDCKE;
    wire                      #(CMDA_DELAY_H) SDODT_H1 =   SDODT;

    wire                      #(CLK_DELAY_H)  SDCLK_H2 =   SDCLK_H1;
    wire                      #(CLK_DELAY_H)  SDNCLK_H2 =  SDNCLK_H1;
    wire                      #(CMDA_DELAY_H) SDRST_H2 =   SDRST_H1;
    wire [ADDRESS_NUMBER-1:0] #(CMDA_DELAY_H) SDA_H2 =     SDA_H1;
    wire                [2:0] #(CMDA_DELAY_H) SDBA_H2 =    SDBA_H1;
    wire                      #(CMDA_DELAY_H) SDWE_H2 =    SDWE_H1;
    wire                      #(CMDA_DELAY_H) SDRAS_H2 =   SDRAS_H1;
    wire                      #(CMDA_DELAY_H) SDCAS_H2 =   SDCAS_H1;
    wire                      #(CMDA_DELAY_H) SDCKE_H2 =   SDCKE_H1;
    wire                      #(CMDA_DELAY_H) SDODT_H2 =   SDODT_H1;
    
    wire                      #(CLK_DELAY_H)  SDCLK_H3 =   SDCLK_H2;
    wire                      #(CLK_DELAY_H)  SDNCLK_H3 =  SDNCLK_H2;
    wire                      #(CMDA_DELAY_H) SDRST_H3 =   SDRST_H2;
    wire [ADDRESS_NUMBER-1:0] #(CMDA_DELAY_H) SDA_H3 =     SDA_H2;
    wire                [2:0] #(CMDA_DELAY_H) SDBA_H3 =    SDBA_H2;
    wire                      #(CMDA_DELAY_H) SDWE_H3 =    SDWE_H2;
    wire                      #(CMDA_DELAY_H) SDRAS_H3 =   SDRAS_H2;
    wire                      #(CMDA_DELAY_H) SDCAS_H3 =   SDCAS_H2;
    wire                      #(CMDA_DELAY_H) SDCKE_H3 =   SDCKE_H2;
    wire                      #(CMDA_DELAY_H) SDODT_H3=   SDODT_H2;

    wire                      #(CLK_DELAY_H)  SDCLK_D =   SDCLK_H3;
    wire                      #(CLK_DELAY_H)  SDNCLK_D =  SDNCLK_H3;
    wire                      #(CMDA_DELAY_H) SDRST_D =   SDRST_H3;
    wire [ADDRESS_NUMBER-1:0] #(CMDA_DELAY_H) SDA_D =     SDA_H3;
    wire                [2:0] #(CMDA_DELAY_H) SDBA_D =    SDBA_H3;
    wire                      #(CMDA_DELAY_H) SDWE_D =    SDWE_H3;
    wire                      #(CMDA_DELAY_H) SDRAS_D =   SDRAS_H3;
    wire                      #(CMDA_DELAY_H) SDCAS_D =   SDCAS_H3;
    wire                      #(CMDA_DELAY_H) SDCKE_D =   SDCKE_H3;
    wire                      #(CMDA_DELAY_H) SDODT_D =   SDODT_H3;

    wire [1:0] en_dq_dl;
    wire [1:0] en_dqs_dl;
    wire [1:0] #(TRISTATE_DELAY) en_dq_d0  = en_dq_dl;
    wire [1:0] #(TRISTATE_DELAY) en_dqs_d0 = en_dqs_dl;
    
    wire [1:0] #(DQ_OUT_DELAY_H) en_dq_d1=en_dq_d0;
    wire [1:0] #(DQ_OUT_DELAY_H) en_dqs_d1=en_dqs_d0;
    wire [1:0] #(DQ_OUT_DELAY_H) en_dq_d2=en_dq_d1;
    wire [1:0] #(DQ_OUT_DELAY_H) en_dqs_d2=en_dqs_d1;
    wire [1:0] #(DQ_IN_DELAY_H)  en_dq_d3=en_dq_d2;
    wire [1:0] #(DQ_IN_DELAY_H)  en_dqs_d3=en_dqs_d2;
    wire [1:0] #(DQ_OUT_DELAY_H) en_dq_d4=en_dq_d3;
    wire [1:0] #(DQ_OUT_DELAY_H) en_dqs_d4=en_dqs_d3;
    wire [1:0] #(DQ_OUT_DELAY_H) en_dq_d5=en_dq_d4;
    wire [1:0] #(DQ_OUT_DELAY_H) en_dqs_d5=en_dqs_d4;
    wire [1:0] #(DQ_IN_DELAY_H)  en_dq_d6=en_dq_d5;
    wire [1:0] #(DQ_IN_DELAY_H)  en_dqs_d6=en_dqs_d5;
    wire [1:0] #(DQ_IN_DELAY_H)  en_dq_d7=en_dq_d6;
    wire [1:0] #(DQ_IN_DELAY_H)  en_dqs_d7=en_dqs_d6;
    
//  wire [1:0]  en_dq_out=en_dq_d2;
//  wire [1:0]  en_dqs_out=en_dqs_d2;
    wire [1:0]  en_dq_out=en_dq_d3;
    wire [1:0]  en_dqs_out=en_dqs_d3;

//  wire [1:0]  en_dq_in= ~en_dq_d0  & ~en_dq_d1  & ~en_dq_d2  & ~en_dq_d3  & ~en_dq_d4;
//  wire [1:0]  en_dqs_in=~en_dqs_d0 & ~en_dqs_d1 & ~en_dqs_d2 & ~en_dqs_d3 & ~en_dqs_d4;

    wire [1:0]  en_dq_in= ~en_dq_d0  & ~en_dq_d1  & ~en_dq_d2  & ~en_dq_d3  & ~en_dq_d4  & ~en_dq_d5  & ~en_dq_d6  & ~en_dq_d7;
    wire [1:0]  en_dqs_in=~en_dqs_d0 & ~en_dqs_d1 & ~en_dqs_d2 & ~en_dqs_d3 & ~en_dqs_d4 & ~en_dqs_d5 & ~en_dqs_d6 & ~en_dqs_d7;
    
    
    /* Instance template for module dly_16 */
    dly_16 #(
        .WIDTH(4)
    ) dly_16_i (
        .clk     (mclk),
        .rst     (~SDRST),
        .dly     (TRISTATE_DELAY_CLK), 
        .din     ({~dqs_tri,~dq_tri}), 
        .dout    ({en_dqs_dl,en_dq_dl}) 
    );
    wire [15:0] SDD_H1;
    wire        SDDML_H1;
    wire        SDDMU_H1;
    wire        DQSL_H1;
    wire        NDQSL_H1;
    wire        DQSU_H1;
    wire        NDQSU_H1;

    wire [15:0] SDD_H2;
    wire        SDDML_H2;
    wire        SDDMU_H2;
    wire        DQSL_H2;
    wire        NDQSL_H2;
    wire        DQSU_H2;
    wire        NDQSU_H2;

    wire [15:0] SDD_H3;
    wire        SDDML_H3;
    wire        SDDMU_H3;
    wire        DQSL_H3;
    wire        NDQSL_H3;
    wire        DQSU_H3;
    wire        NDQSU_H3;
    
    wire [15:0] SDD_D;
    wire        SDDML_D;
    wire        SDDMU_D;
    wire        DQSL_D;
    wire        NDQSL_D;
    wire        DQSU_D;
    wire        NDQSU_D;

    wire [15:0] SDD_DH1;
    wire        DQSL_DH1;
    wire        NDQSL_DH1;
    wire        DQSU_DH1;
    wire        NDQSU_DH1;
    
    wire [15:0] SDD_DH2;
    wire        DQSL_DH2;
    wire        NDQSL_DH2;
    wire        DQSU_DH2;
    wire        NDQSU_DH2;
    
    wire [15:0] SDD_DH3;
    wire        DQSL_DH3;
    wire        NDQSL_DH3;
    wire        DQSU_DH3;
    wire        NDQSU_DH3;
    
    assign #(DQ_OUT_DELAY_H) SDD_H1[ 7:0] = SDD[7:0];
    assign #(DQ_OUT_DELAY_H) SDD_H1[15:8] = SDD[15:8];
    
    assign #(DQ_OUT_DELAY_H) SDD_H2[ 7:0] = SDD_H1[7:0];
    assign #(DQ_OUT_DELAY_H) SDD_H2[15:8] = SDD_H1[15:8];
    
    assign #(DQ_OUT_DELAY_H) SDD_H3[ 7:0] = SDD_H2[7:0];
    assign #(DQ_OUT_DELAY_H) SDD_H3[15:8] = SDD_H2[15:8];
    
    assign #(DQ_OUT_DELAY_H) SDD_D[ 7:0] = en_dq_out[0]? SDD_H3[7:0]: 8'bz;
    assign #(DQ_OUT_DELAY_H) SDD_D[15:8] = en_dq_out[1]? SDD_H3[15:8]:8'bz;
    
    assign #(DQ_OUT_DELAY_H) SDDML_H1 = SDDML;
    assign #(DQ_OUT_DELAY_H) SDDMU_H1 = SDDMU;

    assign #(DQ_OUT_DELAY_H) SDDML_H2 = SDDML_H1;
    assign #(DQ_OUT_DELAY_H) SDDMU_H2 = SDDMU_H1;

    assign #(DQ_OUT_DELAY_H) SDDML_H3 = SDDML_H2;
    assign #(DQ_OUT_DELAY_H) SDDMU_H3 = SDDMU_H2;

    assign #(DQ_OUT_DELAY_H) SDDML_D = en_dq_out[0]? SDDML_H3: 1'bz;
    assign #(DQ_OUT_DELAY_H) SDDMU_D = en_dq_out[1]? SDDMU_H3: 1'bz;

    assign #(DQ_IN_DELAY_H) SDD_DH1  [ 7:0] = SDD_D[7:0];
    assign #(DQ_IN_DELAY_H) SDD_DH1  [15:8] = SDD_D[15:8];
    
    assign #(DQ_IN_DELAY_H) SDD_DH2  [ 7:0] = SDD_DH1[7:0];
    assign #(DQ_IN_DELAY_H) SDD_DH2  [15:8] = SDD_DH1[15:8];
    
    assign #(DQ_IN_DELAY_H) SDD_DH3  [ 7:0] = SDD_DH2[7:0];
    assign #(DQ_IN_DELAY_H) SDD_DH3  [15:8] = SDD_DH2[15:8];
    
    assign #(DQ_IN_DELAY_H) SDD  [ 7:0] = en_dq_in[0]? SDD_DH3[7:0]:8'bz;
    assign #(DQ_IN_DELAY_H) SDD  [15:8] = en_dq_in[1]? SDD_DH3[15:8]:8'bz;
    

    assign #(DQS_OUT_DELAY_H) DQSL_H1 =  DQSL;
    assign #(DQS_OUT_DELAY_H) NDQSL_H1 = NDQSL;
    assign #(DQS_OUT_DELAY_H) DQSU_H1 =  DQSU;
    assign #(DQS_OUT_DELAY_H) NDQSU_H1 = NDQSU;

    assign #(DQS_OUT_DELAY_H) DQSL_H2 =  DQSL_H1;
    assign #(DQS_OUT_DELAY_H) NDQSL_H2 = NDQSL_H1;
    assign #(DQS_OUT_DELAY_H) DQSU_H2 =  DQSU_H1;
    assign #(DQS_OUT_DELAY_H) NDQSU_H2 = NDQSU_H1;

    assign #(DQS_OUT_DELAY_H) DQSL_H3 =  DQSL_H2;
    assign #(DQS_OUT_DELAY_H) NDQSL_H3 = NDQSL_H2;
    assign #(DQS_OUT_DELAY_H) DQSU_H3 =  DQSU_H2;
    assign #(DQS_OUT_DELAY_H) NDQSU_H3 = NDQSU_H2;
    
    assign #(DQS_OUT_DELAY_H) DQSL_D =  en_dqs_out[0]? DQSL_H3:  1'bz;
    assign #(DQS_OUT_DELAY_H) NDQSL_D = en_dqs_out[0]? NDQSL_H3: 1'bz;
    assign #(DQS_OUT_DELAY_H) DQSU_D =  en_dqs_out[1]? DQSU_H3:  1'bz;
    assign #(DQS_OUT_DELAY_H) NDQSU_D = en_dqs_out[1]? NDQSU_H3: 1'bz;
    
    assign #(DQS_IN_DELAY_H) DQSL_DH1 =  DQSL_D;
    assign #(DQS_IN_DELAY_H) NDQSL_DH1 = NDQSL_D;
    assign #(DQS_IN_DELAY_H) DQSU_DH1 =  DQSU_D;
    assign #(DQS_IN_DELAY_H) NDQSU_DH1 = NDQSU_D;

    assign #(DQS_IN_DELAY_H) DQSL_DH2 =  DQSL_DH1;
    assign #(DQS_IN_DELAY_H) NDQSL_DH2 = NDQSL_DH1;
    assign #(DQS_IN_DELAY_H) DQSU_DH2 =  DQSU_DH1;
    assign #(DQS_IN_DELAY_H) NDQSU_DH2 = NDQSU_DH1;

    assign #(DQS_IN_DELAY_H) DQSL_DH3 =  DQSL_DH2;
    assign #(DQS_IN_DELAY_H) NDQSL_DH3 = NDQSL_DH2;
    assign #(DQS_IN_DELAY_H) DQSU_DH3 =  DQSU_DH2;
    assign #(DQS_IN_DELAY_H) NDQSU_DH3 = NDQSU_DH2;

    assign #(DQS_IN_DELAY_H) DQSL =  en_dqs_in[0]? DQSL_DH3:  1'bz;
    assign #(DQS_IN_DELAY_H) NDQSL = en_dqs_in[0]? NDQSL_DH3: 1'bz;
    assign #(DQS_IN_DELAY_H) DQSU =  en_dqs_in[1]? DQSU_DH3:  1'bz;
    assign #(DQS_IN_DELAY_H) NDQSU = en_dqs_in[1]? NDQSU_DH3: 1'bz;

    ddr3
     /*#(
        .TCK_MIN             (2500), 
        .TJIT_PER            (100),
        .TJIT_CC             (200),
        .TERR_2PER           (147),
        .TERR_3PER           (175),
        .TERR_4PER           (194),
        .TERR_5PER           (209),
        .TERR_6PER           (222),
        .TERR_7PER           (232),
        .TERR_8PER           (241),
        .TERR_9PER           (249),
        .TERR_10PER          (257),
        .TERR_11PER          (263),
        .TERR_12PER          (269),
        .TDS                 (125),
        .TDH                 (150),
        .TDQSQ               (200),
        .TDQSS               (0.25),
        .TDSS                (0.20),
        .TDSH                (0.20),
        .TDQSCK              (400),
        .TQSH                (0.38),
        .TQSL                (0.38),
        .TDIPW               (600),
        .TIPW                (900),
        .TIS                 (350),
        .TIH                 (275),
        .TRAS_MIN            (37500),
        .TRC                 (52500),
        .TRCD                (15000),
        .TRP                 (15000),
        .TXP                 (7500),
        .TCKE                (7500),
        .TAON                (400),
        .TWLS                (325),
        .TWLH                (325),
        .TWLO                (9000),
        .TAA_MIN             (15000),
        .CL_TIME             (15000),
        .TDQSCK_DLLDIS       (400),
        .TRRD                (10000),
        .TFAW                (40000),
        .CL_MIN              (5),
        .CL_MAX              (14),
        .AL_MIN              (0),
        .AL_MAX              (2),
        .WR_MIN              (5),
        .WR_MAX              (16),
        .BL_MIN              (4),
        .BL_MAX              (8),
        .CWL_MIN             (5),
        .CWL_MAX             (10),
        .TCK_MAX             (3300),
        .TCH_AVG_MIN         (0.47),
        .TCL_AVG_MIN         (0.47),
        .TCH_AVG_MAX         (0.53),
        .TCL_AVG_MAX         (0.53),
        .TCH_ABS_MIN         (0.43),
        .TCL_ABS_MIN         (0.43),
        .TCKE_TCK            (3),
        .TAA_MAX             (20000),
        .TQH                 (0.38),
        .TRPRE               (0.90),
        .TRPST               (0.30),
        .TDQSH               (0.45),
        .TDQSL               (0.45),
        .TWPRE               (0.90),
        .TWPST               (0.30),
        .TCCD                (4),
        .TCCD_DG             (2),
        .TRAS_MAX            (60e9),
        .TWR                 (15000),
        .TMRD                (4),
        .TMOD                (15000),
        .TMOD_TCK            (12),
        .TRRD_TCK            (4),
        .TRRD_DG             (3000),
        .TRRD_DG_TCK         (2),
        .TRTP                (7500),
        .TRTP_TCK            (4),
        .TWTR                (7500),
        .TWTR_DG             (3750),
        .TWTR_TCK            (4),
        .TWTR_DG_TCK         (2),
        .TDLLK               (512),
        .TRFC_MIN            (260000),
        .TRFC_MAX            (70200000),
        .TXP_TCK             (3),
        .TXPDLL              (24000),
        .TXPDLL_TCK          (10),
        .TACTPDEN            (1),
        .TPRPDEN             (1),
        .TREFPDEN            (1),
        .TCPDED              (1),
        .TPD_MAX             (70200000),
        .TXPR                (270000),
        .TXPR_TCK            (5),
        .TXS                 (270000),
        .TXS_TCK             (5),
        .TXSDLL              (512),
        .TISXR               (350),
        .TCKSRE              (10000),
        .TCKSRE_TCK          (5),
        .TCKSRX              (10000),
        .TCKSRX_TCK          (5),
        .TCKESR_TCK          (4),
        .TAOF                (0.7),
        .TAONPD              (8500),
        .TAOFPD              (8500),
        .ODTH4               (4),
        .ODTH8               (6),
        .TADC                (0.7),
        .TWLMRD              (40),
        .TWLDQSEN            (25),
        .TWLOE               (2000),
        .DM_BITS             (2),
        .ADDR_BITS           (15),
        .ROW_BITS            (15),
        .COL_BITS            (10),
        .DQ_BITS             (16),
        .DQS_BITS            (2),
        .BA_BITS             (3),
        .MEM_BITS            (10),
        .AP                  (10),
        .BC                  (12),
        .BL_BITS             (3),
        .BO_BITS             (2),
        .CS_BITS             (1),
        .RANKS               (1),
        .RZQ                 (240),
        .PRE_DEF_PAT         (8'hAA),
        .STOP_ON_ERROR       (1),
        .DEBUG               (1),
        .BUS_DELAY           (0),
        .RANDOM_OUT_DELAY    (0),
        .RANDOM_SEED         (31913),
        .RDQSEN_PRE          (2),
        .RDQSEN_PST          (1),
        .RDQS_PRE            (2),
        .RDQS_PST            (1),
        .RDQEN_PRE           (0),
        .RDQEN_PST           (0),
        .WDQS_PRE            (2),
        .WDQS_PST            (1),
        .check_strict_mrbits (1),
        .check_strict_timing (1),
        .feature_pasr        (1),
        .feature_truebl4     (0),
        .feature_odt_hi      (0),
        .PERTCKAVG           (512),
        .LOAD_MODE           (4'b0000),
        .REFRESH             (4'b0001),
        .PRECHARGE           (4'b0010),
        .ACTIVATE            (4'b0011),
        .WRITE               (4'b0100),
        .READ                (4'b0101),
        .ZQ                  (4'b0110),
        .NOP                 (4'b0111),
        .PWR_DOWN            (4'b1000),
        .SELF_REF            (4'b1001),
        .RFF_BITS            (128),
        .RFF_CHUNK           (32),
        .SAME_BANK           (2'd0),
        .DIFF_BANK           (2'd1),
        .DIFF_GROUP          (2'd2),
        .SIMUL_500US         (5),
        .SIMUL_200US         (2)
    ) */        
    ddr3_i (
        .rst_n   (SDRST_D),         // input 
        .ck      (SDCLK_D),         // input 
        .ck_n    (SDNCLK_D),        // input 
        .cke     (SDCKE_D),         // input 
        .cs_n    (1'b0),            // input 
        .ras_n   (SDRAS_D),         // input 
        .cas_n   (SDCAS_D),         // input 
        .we_n    (SDWE_D),          // input 
        .dm_tdqs ({SDDMU_D,SDDML_D}),   // inout[1:0] 
        .ba      (SDBA_D[2:0]),     // input[2:0] 
        .addr    (SDA_D[14:0]),     // input[14:0] 
        .dq      (SDD_D[15:0]),       // inout[15:0] 
        .dqs     ({DQSU_D,DQSL_D}),     // inout[1:0] 
        .dqs_n   ({NDQSU_D,NDQSL_D}),   // inout[1:0] 
        .tdqs_n  (),                // output[1:0] 
        .odt     (SDODT_D)          // input 
    );


endmodule

