// This program was cloned from: https://github.com/yohanes-erwin/pemrograman_zynq
// License: MIT License

// *** Author : Erwin Ouyang
// *** Date   : 10 May 2018
`timescale 1ns / 1ps

module axi_dnn
    (
        // *** AXI4 clock and reset port ***
        input  wire        aclk,
        input  wire        aresetn,
        // *** AXI4-lite slave port ***
        output wire        s_axi_awready,
        input  wire [31:0] s_axi_awaddr,
        input  wire        s_axi_awvalid,
        output wire        s_axi_wready,
        input  wire [3:0]  s_axi_wstrb,
        input  wire [31:0] s_axi_wdata,
        input  wire        s_axi_wvalid,
        input  wire        s_axi_bready,
        output wire [1:0]  s_axi_bresp,
        output wire        s_axi_bvalid,
        output wire        s_axi_arready,
        input  wire [31:0] s_axi_araddr,
        input  wire        s_axi_arvalid,
        input  wire        s_axi_rready,
        output wire [31:0] s_axi_rdata,     
        output wire [1:0]  s_axi_rresp,
        output wire        s_axi_rvalid
    );

    // *** Register map ***
    // 0x000: busy
    //        bit 0 = busy_reg (R)
    // 0x004: reserved
    // 0x008: reserved
    // 0x00C: reserved
    // 0x010: weight register 0
    //        bit 15~0 = w000[15:0] (R/W)
    // -----: -----
    // 0x20C: weight register 127
    //        bit 15~0 = w127[15:0] (R/W)
    // 0x210: i/o register 0
    //        bit 15~0 = io00[15:0] (R/W)
    // -----: -----
    // 0x30C: i/o register 63
    //        bit 15~0 = io63[15:0] (R/W)  
    localparam C_ADDR_BITS = 10;
    // *** Memory-mapped Address ***
    localparam C_ADDR_CTRL0 = 10'h000,
               // *** Weight ***
               C_ADDR_W000 = 10'h010, C_ADDR_W001 = 10'h014, C_ADDR_W002 = 10'h018, C_ADDR_W003 = 10'h01c,
               C_ADDR_W004 = 10'h020, C_ADDR_W005 = 10'h024, C_ADDR_W006 = 10'h028, C_ADDR_W007 = 10'h02c,
               C_ADDR_W008 = 10'h030, C_ADDR_W009 = 10'h034, C_ADDR_W010 = 10'h038, C_ADDR_W011 = 10'h03c,
               C_ADDR_W012 = 10'h040, C_ADDR_W013 = 10'h044, C_ADDR_W014 = 10'h048, C_ADDR_W015 = 10'h04c,
               C_ADDR_W016 = 10'h050, C_ADDR_W017 = 10'h054, C_ADDR_W018 = 10'h058, C_ADDR_W019 = 10'h05c,
               C_ADDR_W020 = 10'h060, C_ADDR_W021 = 10'h064, C_ADDR_W022 = 10'h068, C_ADDR_W023 = 10'h06c,
               C_ADDR_W024 = 10'h070, C_ADDR_W025 = 10'h074, C_ADDR_W026 = 10'h078, C_ADDR_W027 = 10'h07c,
               C_ADDR_W028 = 10'h080, C_ADDR_W029 = 10'h084, C_ADDR_W030 = 10'h088, C_ADDR_W031 = 10'h08c,
               C_ADDR_W032 = 10'h090, C_ADDR_W033 = 10'h094, C_ADDR_W034 = 10'h098, C_ADDR_W035 = 10'h09c,
               C_ADDR_W036 = 10'h0a0, C_ADDR_W037 = 10'h0a4, C_ADDR_W038 = 10'h0a8, C_ADDR_W039 = 10'h0ac,
               C_ADDR_W040 = 10'h0b0, C_ADDR_W041 = 10'h0b4, C_ADDR_W042 = 10'h0b8, C_ADDR_W043 = 10'h0bc,
               C_ADDR_W044 = 10'h0c0, C_ADDR_W045 = 10'h0c4, C_ADDR_W046 = 10'h0c8, C_ADDR_W047 = 10'h0cc,          
               C_ADDR_W048 = 10'h0d0, C_ADDR_W049 = 10'h0d4, C_ADDR_W050 = 10'h0d8, C_ADDR_W051 = 10'h0dc,
               C_ADDR_W052 = 10'h0e0, C_ADDR_W053 = 10'h0e4, C_ADDR_W054 = 10'h0e8, C_ADDR_W055 = 10'h0ec,
               C_ADDR_W056 = 10'h0f0, C_ADDR_W057 = 10'h0f4, C_ADDR_W058 = 10'h0f8, C_ADDR_W059 = 10'h0fc,
               C_ADDR_W060 = 10'h100, C_ADDR_W061 = 10'h104, C_ADDR_W062 = 10'h108, C_ADDR_W063 = 10'h10c,
               C_ADDR_W064 = 10'h110, C_ADDR_W065 = 10'h114, C_ADDR_W066 = 10'h118, C_ADDR_W067 = 10'h11c,
               C_ADDR_W068 = 10'h120, C_ADDR_W069 = 10'h124, C_ADDR_W070 = 10'h128, C_ADDR_W071 = 10'h12c,
               C_ADDR_W072 = 10'h130, C_ADDR_W073 = 10'h134, C_ADDR_W074 = 10'h138, C_ADDR_W075 = 10'h13c,
               C_ADDR_W076 = 10'h140, C_ADDR_W077 = 10'h144, C_ADDR_W078 = 10'h148, C_ADDR_W079 = 10'h14c,
               C_ADDR_W080 = 10'h150, C_ADDR_W081 = 10'h154, C_ADDR_W082 = 10'h158, C_ADDR_W083 = 10'h15c,
               C_ADDR_W084 = 10'h160, C_ADDR_W085 = 10'h164, C_ADDR_W086 = 10'h168, C_ADDR_W087 = 10'h16c,
               C_ADDR_W088 = 10'h170, C_ADDR_W089 = 10'h174, C_ADDR_W090 = 10'h178, C_ADDR_W091 = 10'h17c,
               C_ADDR_W092 = 10'h180, C_ADDR_W093 = 10'h184, C_ADDR_W094 = 10'h188, C_ADDR_W095 = 10'h18c,
               C_ADDR_W096 = 10'h190, C_ADDR_W097 = 10'h194, C_ADDR_W098 = 10'h198, C_ADDR_W099 = 10'h19c,
               C_ADDR_W100 = 10'h1a0, C_ADDR_W101 = 10'h1a4, C_ADDR_W102 = 10'h1a8, C_ADDR_W103 = 10'h1ac,
               C_ADDR_W104 = 10'h1b0, C_ADDR_W105 = 10'h1b4, C_ADDR_W106 = 10'h1b8, C_ADDR_W107 = 10'h1bc,
               C_ADDR_W108 = 10'h1c0, C_ADDR_W109 = 10'h1c4, C_ADDR_W110 = 10'h1c8, C_ADDR_W111 = 10'h1cc,
               C_ADDR_W112 = 10'h1d0, C_ADDR_W113 = 10'h1d4, C_ADDR_W114 = 10'h1d8, C_ADDR_W115 = 10'h1dc,
               C_ADDR_W116 = 10'h1e0, C_ADDR_W117 = 10'h1e4, C_ADDR_W118 = 10'h1e8, C_ADDR_W119 = 10'h1ec,
               C_ADDR_W120 = 10'h1f0, C_ADDR_W121 = 10'h1f4, C_ADDR_W122 = 10'h1f8, C_ADDR_W123 = 10'h1fc,
               C_ADDR_W124 = 10'h200, C_ADDR_W125 = 10'h204, C_ADDR_W126 = 10'h208, C_ADDR_W127 = 10'h20c,
               // *** I/O ***
               C_ADDR_IO00 = 10'h210, C_ADDR_IO01 = 10'h214, C_ADDR_IO02 = 10'h218, C_ADDR_IO03 = 10'h21c,
               C_ADDR_IO04 = 10'h220, C_ADDR_IO05 = 10'h224, C_ADDR_IO06 = 10'h228, C_ADDR_IO07 = 10'h22c,
               C_ADDR_IO08 = 10'h230, C_ADDR_IO09 = 10'h234, C_ADDR_IO10 = 10'h238, C_ADDR_IO11 = 10'h23c,
               C_ADDR_IO12 = 10'h240, C_ADDR_IO13 = 10'h244, C_ADDR_IO14 = 10'h248, C_ADDR_IO15 = 10'h24c,
               C_ADDR_IO16 = 10'h250, C_ADDR_IO17 = 10'h254, C_ADDR_IO18 = 10'h258, C_ADDR_IO19 = 10'h25c,
               C_ADDR_IO20 = 10'h260, C_ADDR_IO21 = 10'h264, C_ADDR_IO22 = 10'h268, C_ADDR_IO23 = 10'h26c,
               C_ADDR_IO24 = 10'h270, C_ADDR_IO25 = 10'h274, C_ADDR_IO26 = 10'h278, C_ADDR_IO27 = 10'h27c,
               C_ADDR_IO28 = 10'h280, C_ADDR_IO29 = 10'h284, C_ADDR_IO30 = 10'h288, C_ADDR_IO31 = 10'h28c,
               C_ADDR_IO32 = 10'h290, C_ADDR_IO33 = 10'h294, C_ADDR_IO34 = 10'h298, C_ADDR_IO35 = 10'h29c,
               C_ADDR_IO36 = 10'h2a0, C_ADDR_IO37 = 10'h2a4, C_ADDR_IO38 = 10'h2a8, C_ADDR_IO39 = 10'h2ac,
               C_ADDR_IO40 = 10'h2b0, C_ADDR_IO41 = 10'h2b4, C_ADDR_IO42 = 10'h2b8, C_ADDR_IO43 = 10'h2bc,
               C_ADDR_IO44 = 10'h2c0, C_ADDR_IO45 = 10'h2c4, C_ADDR_IO46 = 10'h2c8, C_ADDR_IO47 = 10'h2cc;
    // *** AXI write FSM ***
    localparam S_WRIDLE = 2'h0,
               S_WRDATA = 2'h1,
               S_WRRESP = 2'h2;
    // *** AXI read FSM ***
    localparam S_RDIDLE = 2'h0,
               S_RDDATA = 2'h1;
    // *** DNN cobtroller FSM ***
    localparam S_IDLE = 7'h0,
               S_LDINP = 7'h1,
               S_LDW1 = 7'h2, S_P1_1 = 7'h3, S_P1_2 = 7'h4, S_P1_3 = 7'h5, S_P1_4 = 7'h6, S_P1_5 = 7'h7, S_P1_6 = 7'h8, S_P1_7 = 7'h9,
               S_P1_8 = 7'ha, S_P1_9 = 7'hb, S_P1_10 = 7'hc, S_P1_11 = 7'hd, S_P1_12 = 7'he, S_P1_13 = 7'hf, S_P1_14 = 7'h10, S_P1_R1 = 7'h11,
               S_P1_R2 = 7'h12, S_P1_R3 = 7'h13, S_P1_R4 = 7'h14, S_P1_R5 = 7'h15, S_P1_R6 = 7'h16, S_P1_R7 = 7'h17, S_P1_R8 = 7'h18, S_P1_R9 = 7'h19,
               S_P1_R10 = 7'h1a, S_P1_R11 = 7'h1b,
               S_LDW2 = 7'h1c, S_P2_1 = 7'h1d, S_P2_2 = 7'h1e, S_P2_3 = 7'h1f, S_P2_4 = 7'h20, S_P2_5 = 7'h21, S_P2_6 = 7'h22, S_P2_7 = 7'h23,
               S_P2_8 = 7'h24, S_P2_9 = 7'h25, S_P2_10 = 7'h26, S_P2_11 = 7'h27, S_P2_12 = 7'h28, S_P2_13 = 7'h29, S_P2_14 = 7'h2a, S_P2_15 = 7'h2b,
               S_P2_16 = 7'h2c, S_P2_R1 = 7'h2d, S_P2_R2 = 7'h2e, S_P2_R3 = 7'h2f, S_P2_R4 = 7'h30, S_P2_R5 = 7'h31, S_P2_R6 = 7'h32, S_P2_R7 = 7'h33,
               S_LDW3 = 7'h34, S_P3_1 = 7'h35, S_P3_2 = 7'h36, S_P3_3 = 7'h37, S_P3_4 = 7'h38, S_P3_5 = 7'h39, S_P3_6 = 7'h3a, S_P3_7 = 7'h3b,
               S_P3_8 = 7'h3c, S_P3_9 = 7'h3d, S_P3_10 = 7'h3e, S_P3_11 = 7'h3f, S_P3_12 = 7'h40, S_P3_13 = 7'h41, S_P3_14 = 7'h42, S_P3_R1 = 7'h43,
               S_P3_R2 = 7'h44, S_P3_R3 = 7'h45, S_P3_R4 = 7'h46, S_P3_R5 = 7'h47, S_P3_R6 = 7'h48, S_P3_R7 = 7'h49,
               S_LDW4 = 7'h4a, S_P4_1 = 7'h4b, S_P4_2 = 7'h4c, S_P4_3 = 7'h4d, S_P4_4 = 7'h4e, S_P4_5 = 7'h4f, S_P4_6 = 7'h50, S_P4_7 = 7'h51,
               S_P4_8 = 7'h52, S_P4_9 = 7'h53, S_P4_10 = 7'h54, S_P4_11 = 7'h55, S_P4_12 = 7'h56, S_P4_R1 = 7'h57, S_P4_R2 = 7'h58, S_P4_R3 = 7'h59,
               S_P4_R4 = 7'h5a, S_P4_R5 = 7'h5b, S_P4_R6 = 7'h5c, S_P4_R7 = 7'h5d,
               S_WROUT = 7'h5e, S_DONE = 7'h5f;
    // *** AXI write ***
    reg [1:0] wstate_cs, wstate_ns;
    reg [C_ADDR_BITS-1:0] waddr;
    wire [31:0] wmask;
    wire aw_hs, w_hs;
    // *** AXI read ***
    reg [1:0] rstate_cs, rstate_ns;
    wire [C_ADDR_BITS-1:0] raddr;
    reg [31:0] rdata;
    wire ar_hs;
    // *** Internal registers ***
    reg signed [15:0] w_reg [0:127];
    reg signed [15:0] io_reg [0:47];
    reg start_reg;
    reg busy_reg;
    // *** DNN controller ***
    reg [6:0] _cs, _ns;
    reg w_cp_cs, w_cp_ns;
    reg signed [15:0] buf_cs [0:63], buf_ns [0:63];
    reg clr_cs, clr_ns;
    reg signed [15:0] x0_cs, x1_cs, x2_cs, x3_cs, x4_cs, x5_cs, x6_cs, x7_cs;
    reg signed [15:0] x0_ns, x1_ns, x2_ns, x3_ns, x4_ns, x5_ns, x6_ns, x7_ns;
    reg signed [15:0] w00_cs, w01_cs, w02_cs, w03_cs, w04_cs, w05_cs, w06_cs, w07_cs,
                      w10_cs, w11_cs, w12_cs, w13_cs, w14_cs, w15_cs, w16_cs, w17_cs,
                      w20_cs, w21_cs, w22_cs, w23_cs, w24_cs, w25_cs, w26_cs, w27_cs,
                      w30_cs, w31_cs, w32_cs, w33_cs, w34_cs, w35_cs, w36_cs, w37_cs,
                      w40_cs, w41_cs, w42_cs, w43_cs, w44_cs, w45_cs, w46_cs, w47_cs,
                      w50_cs, w51_cs, w52_cs, w53_cs, w54_cs, w55_cs, w56_cs, w57_cs,
                      w60_cs, w61_cs, w62_cs, w63_cs, w64_cs, w65_cs, w66_cs, w67_cs,
                      w70_cs, w71_cs, w72_cs, w73_cs, w74_cs, w75_cs, w76_cs, w77_cs;
    reg signed [15:0] w00_ns, w01_ns, w02_ns, w03_ns, w04_ns, w05_ns, w06_ns, w07_ns,
                      w10_ns, w11_ns, w12_ns, w13_ns, w14_ns, w15_ns, w16_ns, w17_ns,
                      w20_ns, w21_ns, w22_ns, w23_ns, w24_ns, w25_ns, w26_ns, w27_ns,
                      w30_ns, w31_ns, w32_ns, w33_ns, w34_ns, w35_ns, w36_ns, w37_ns,
                      w40_ns, w41_ns, w42_ns, w43_ns, w44_ns, w45_ns, w46_ns, w47_ns,
                      w50_ns, w51_ns, w52_ns, w53_ns, w54_ns, w55_ns, w56_ns, w57_ns,
                      w60_ns, w61_ns, w62_ns, w63_ns, w64_ns, w65_ns, w66_ns, w67_ns,
                      w70_ns, w71_ns, w72_ns, w73_ns, w74_ns, w75_ns, w76_ns, w77_ns;
    wire signed [15:0] a0_w, a1_w, a2_w, a3_w, a4_w, a5_w, a6_w, a7_w;
    reg done_cs, done_ns;
    // *** Index ***
    integer i;

    // *** AXI write ************************************************************
    assign s_axi_awready = (wstate_cs == S_WRIDLE);
    assign s_axi_wready = (wstate_cs == S_WRDATA);
    assign s_axi_bresp = 2'b00;    // OKAY
    assign s_axi_bvalid = (wstate_cs == S_WRRESP);
    assign wmask = {{8{s_axi_wstrb[3]}}, {8{s_axi_wstrb[2]}}, {8{s_axi_wstrb[1]}}, {8{s_axi_wstrb[0]}}};
    assign aw_hs = s_axi_awvalid & s_axi_awready;
    assign w_hs = s_axi_wvalid & s_axi_wready;

    // *** Write state register ***
    always @(posedge aclk)
    begin
        if (!aresetn)
            wstate_cs <= S_WRIDLE;
        else
            wstate_cs <= wstate_ns;
    end
    
    // *** Write state next ***
    always @(*)
    begin
        case (wstate_cs)
            S_WRIDLE:
                if (s_axi_awvalid)
                    wstate_ns = S_WRDATA;
                else
                    wstate_ns = S_WRIDLE;
            S_WRDATA:
                if (s_axi_wvalid)
                    wstate_ns = S_WRRESP;
                else
                    wstate_ns = S_WRDATA;
            S_WRRESP:
                if (s_axi_bready)
                    wstate_ns = S_WRIDLE;
                else
                    wstate_ns = S_WRRESP;
            default:
                wstate_ns = S_WRIDLE;
        endcase
    end
    
    // *** Write address register ***
    always @(posedge aclk)
    begin
        if (aw_hs)
            waddr <= s_axi_awaddr[C_ADDR_BITS-1:0];
    end

    // *** AXI read *************************************************************
    assign s_axi_arready = (rstate_cs == S_RDIDLE);
    assign s_axi_rdata = rdata;
    assign s_axi_rresp = 2'b00;   // OKAY
    assign s_axi_rvalid = (rstate_cs == S_RDDATA);
    assign ar_hs = s_axi_arvalid & s_axi_arready;
    assign raddr = s_axi_araddr[C_ADDR_BITS-1:0];
    
    // *** Read state register ***
    always @(posedge aclk)
    begin
        if (!aresetn)
            rstate_cs <= S_RDIDLE;
        else
            rstate_cs <= rstate_ns;
    end

    // *** Read state next ***
    always @(*) 
    begin
        case (rstate_cs)
            S_RDIDLE:
                if (s_axi_arvalid)
                    rstate_ns = S_RDDATA;
                else
                    rstate_ns = S_RDIDLE;
            S_RDDATA:
                if (s_axi_rready)
                    rstate_ns = S_RDIDLE;
                else
                    rstate_ns = S_RDDATA;
            default:
                rstate_ns = S_RDIDLE;
        endcase
    end
    
    // *** Read data register ***
    always @(posedge aclk)
    begin
        if (!aresetn)
            rdata <= 0;
        else if (ar_hs)
            case (raddr)
                C_ADDR_CTRL0: rdata <= {31'h0, busy_reg};
                C_ADDR_W000: rdata <= w_reg[0];
                C_ADDR_W001: rdata <= w_reg[1];
                C_ADDR_W002: rdata <= w_reg[2];
                C_ADDR_W003: rdata <= w_reg[3];
                C_ADDR_W004: rdata <= w_reg[4];
                C_ADDR_W005: rdata <= w_reg[5];
                C_ADDR_W006: rdata <= w_reg[6];
                C_ADDR_W007: rdata <= w_reg[7];
                C_ADDR_W008: rdata <= w_reg[8];
                C_ADDR_W009: rdata <= w_reg[9];
                C_ADDR_W010: rdata <= w_reg[10];
                C_ADDR_W011: rdata <= w_reg[11];
                C_ADDR_W012: rdata <= w_reg[12];
                C_ADDR_W013: rdata <= w_reg[13];
                C_ADDR_W014: rdata <= w_reg[14];
                C_ADDR_W015: rdata <= w_reg[15];
                C_ADDR_W016: rdata <= w_reg[16];
                C_ADDR_W017: rdata <= w_reg[17];
                C_ADDR_W018: rdata <= w_reg[18];
                C_ADDR_W019: rdata <= w_reg[19];
                C_ADDR_W020: rdata <= w_reg[20];
                C_ADDR_W021: rdata <= w_reg[21];
                C_ADDR_W022: rdata <= w_reg[22];
                C_ADDR_W023: rdata <= w_reg[23];
                C_ADDR_W024: rdata <= w_reg[24];
                C_ADDR_W025: rdata <= w_reg[25];
                C_ADDR_W026: rdata <= w_reg[26];
                C_ADDR_W027: rdata <= w_reg[27];
                C_ADDR_W028: rdata <= w_reg[28];
                C_ADDR_W029: rdata <= w_reg[29];
                C_ADDR_W030: rdata <= w_reg[30];
                C_ADDR_W031: rdata <= w_reg[31];
                C_ADDR_W032: rdata <= w_reg[32];
                C_ADDR_W033: rdata <= w_reg[33];
                C_ADDR_W034: rdata <= w_reg[34];
                C_ADDR_W035: rdata <= w_reg[35];
                C_ADDR_W036: rdata <= w_reg[36];
                C_ADDR_W037: rdata <= w_reg[37];
                C_ADDR_W038: rdata <= w_reg[38];
                C_ADDR_W039: rdata <= w_reg[39];
                C_ADDR_W040: rdata <= w_reg[40];
                C_ADDR_W041: rdata <= w_reg[41];
                C_ADDR_W042: rdata <= w_reg[42];
                C_ADDR_W043: rdata <= w_reg[43];
                C_ADDR_W044: rdata <= w_reg[44]; 
                C_ADDR_W045: rdata <= w_reg[45];
                C_ADDR_W046: rdata <= w_reg[46];
                C_ADDR_W047: rdata <= w_reg[47];
                C_ADDR_W048: rdata <= w_reg[48];
                C_ADDR_W049: rdata <= w_reg[49];
                C_ADDR_W050: rdata <= w_reg[50];
                C_ADDR_W051: rdata <= w_reg[51];
                C_ADDR_W052: rdata <= w_reg[52];
                C_ADDR_W053: rdata <= w_reg[53];
                C_ADDR_W054: rdata <= w_reg[54];
                C_ADDR_W055: rdata <= w_reg[55];
                C_ADDR_W056: rdata <= w_reg[56];
                C_ADDR_W057: rdata <= w_reg[57];
                C_ADDR_W058: rdata <= w_reg[58];
                C_ADDR_W059: rdata <= w_reg[59];
                C_ADDR_W060: rdata <= w_reg[60];
                C_ADDR_W061: rdata <= w_reg[61];
                C_ADDR_W062: rdata <= w_reg[62];
                C_ADDR_W063: rdata <= w_reg[63];
                C_ADDR_W064: rdata <= w_reg[64];
                C_ADDR_W065: rdata <= w_reg[65];
                C_ADDR_W066: rdata <= w_reg[66];
                C_ADDR_W067: rdata <= w_reg[67];
                C_ADDR_W068: rdata <= w_reg[68];
                C_ADDR_W069: rdata <= w_reg[69];
                C_ADDR_W070: rdata <= w_reg[70];
                C_ADDR_W071: rdata <= w_reg[71];
                C_ADDR_W072: rdata <= w_reg[72];
                C_ADDR_W073: rdata <= w_reg[73];
                C_ADDR_W074: rdata <= w_reg[74];
                C_ADDR_W075: rdata <= w_reg[75];
                C_ADDR_W076: rdata <= w_reg[76];
                C_ADDR_W077: rdata <= w_reg[77];
                C_ADDR_W078: rdata <= w_reg[78];
                C_ADDR_W079: rdata <= w_reg[79];
                C_ADDR_W080: rdata <= w_reg[80];
                C_ADDR_W081: rdata <= w_reg[81];
                C_ADDR_W082: rdata <= w_reg[82];
                C_ADDR_W083: rdata <= w_reg[83];
                C_ADDR_W084: rdata <= w_reg[84];
                C_ADDR_W085: rdata <= w_reg[85];
                C_ADDR_W086: rdata <= w_reg[86];
                C_ADDR_W087: rdata <= w_reg[87];
                C_ADDR_W088: rdata <= w_reg[88];
                C_ADDR_W089: rdata <= w_reg[89];
                C_ADDR_W090: rdata <= w_reg[90];
                C_ADDR_W091: rdata <= w_reg[91];
                C_ADDR_W092: rdata <= w_reg[92];
                C_ADDR_W093: rdata <= w_reg[93];
                C_ADDR_W094: rdata <= w_reg[94];
                C_ADDR_W095: rdata <= w_reg[95];
                C_ADDR_W096: rdata <= w_reg[96];
                C_ADDR_W097: rdata <= w_reg[97];
                C_ADDR_W098: rdata <= w_reg[98];
                C_ADDR_W099: rdata <= w_reg[99];
                C_ADDR_W100: rdata <= w_reg[100];
                C_ADDR_W101: rdata <= w_reg[101];
                C_ADDR_W102: rdata <= w_reg[102];
                C_ADDR_W103: rdata <= w_reg[103];
                C_ADDR_W104: rdata <= w_reg[104];
                C_ADDR_W105: rdata <= w_reg[105];
                C_ADDR_W106: rdata <= w_reg[106];
                C_ADDR_W107: rdata <= w_reg[107];
                C_ADDR_W108: rdata <= w_reg[108];
                C_ADDR_W109: rdata <= w_reg[109];
                C_ADDR_W110: rdata <= w_reg[110];
                C_ADDR_W111: rdata <= w_reg[111];
                C_ADDR_W112: rdata <= w_reg[112];
                C_ADDR_W113: rdata <= w_reg[113];
                C_ADDR_W114: rdata <= w_reg[114];
                C_ADDR_W115: rdata <= w_reg[115];
                C_ADDR_W116: rdata <= w_reg[116];
                C_ADDR_W117: rdata <= w_reg[117];
                C_ADDR_W118: rdata <= w_reg[118];
                C_ADDR_W119: rdata <= w_reg[119];
                C_ADDR_W120: rdata <= w_reg[120];
                C_ADDR_W121: rdata <= w_reg[121];
                C_ADDR_W122: rdata <= w_reg[122];
                C_ADDR_W123: rdata <= w_reg[123];
                C_ADDR_W124: rdata <= w_reg[124];
                C_ADDR_W125: rdata <= w_reg[125];
                C_ADDR_W126: rdata <= w_reg[126];
                C_ADDR_W127: rdata <= w_reg[127];
                C_ADDR_IO00: rdata <= io_reg[0];
                C_ADDR_IO01: rdata <= io_reg[1];
                C_ADDR_IO02: rdata <= io_reg[2];
                C_ADDR_IO03: rdata <= io_reg[3];
                C_ADDR_IO04: rdata <= io_reg[4];
                C_ADDR_IO05: rdata <= io_reg[5];
                C_ADDR_IO06: rdata <= io_reg[6];
                C_ADDR_IO07: rdata <= io_reg[7];
                C_ADDR_IO08: rdata <= io_reg[8];
                C_ADDR_IO09: rdata <= io_reg[9];
                C_ADDR_IO10: rdata <= io_reg[10];
                C_ADDR_IO11: rdata <= io_reg[11];
                C_ADDR_IO12: rdata <= io_reg[12];
                C_ADDR_IO13: rdata <= io_reg[13];
                C_ADDR_IO14: rdata <= io_reg[14];
                C_ADDR_IO15: rdata <= io_reg[15];
                C_ADDR_IO16: rdata <= io_reg[16];
                C_ADDR_IO17: rdata <= io_reg[17];
                C_ADDR_IO18: rdata <= io_reg[18];
                C_ADDR_IO19: rdata <= io_reg[19];
                C_ADDR_IO20: rdata <= io_reg[20];
                C_ADDR_IO21: rdata <= io_reg[21];
                C_ADDR_IO22: rdata <= io_reg[22];
                C_ADDR_IO23: rdata <= io_reg[23];
                C_ADDR_IO24: rdata <= io_reg[24];
                C_ADDR_IO25: rdata <= io_reg[25];
                C_ADDR_IO26: rdata <= io_reg[26];
                C_ADDR_IO27: rdata <= io_reg[27];
                C_ADDR_IO28: rdata <= io_reg[28];
                C_ADDR_IO29: rdata <= io_reg[29];
                C_ADDR_IO30: rdata <= io_reg[30];
                C_ADDR_IO31: rdata <= io_reg[31];
                C_ADDR_IO32: rdata <= io_reg[32];
                C_ADDR_IO33: rdata <= io_reg[33];
                C_ADDR_IO34: rdata <= io_reg[34];
                C_ADDR_IO35: rdata <= io_reg[35];
                C_ADDR_IO36: rdata <= io_reg[36];
                C_ADDR_IO37: rdata <= io_reg[37];
                C_ADDR_IO38: rdata <= io_reg[38];
                C_ADDR_IO39: rdata <= io_reg[39];
                C_ADDR_IO40: rdata <= io_reg[40];
                C_ADDR_IO41: rdata <= io_reg[41];
                C_ADDR_IO42: rdata <= io_reg[42];
                C_ADDR_IO43: rdata <= io_reg[43];
                C_ADDR_IO44: rdata <= io_reg[44]; 
                C_ADDR_IO45: rdata <= io_reg[45];
                C_ADDR_IO46: rdata <= io_reg[46];
                C_ADDR_IO47: rdata <= io_reg[47];
            endcase
    end

    // *** Internal registers ***************************************************
    // *** w_reg[0][15:0] - w_reg[127][15:0] ***
    always @(posedge aclk)
    begin
        if (!aresetn)
        begin
            for (i = 0; i <= 127; i = i+1)
                w_reg[i] <= 0;
        end
        // *** Write from CPU ***
        else if (w_hs && waddr == C_ADDR_W000)
        begin
            w_reg[0][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[0][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W001)
        begin
            w_reg[1][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[1][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W002)
        begin
            w_reg[2][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[2][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W003)
        begin
            w_reg[3][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[3][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W004)
        begin
            w_reg[4][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[4][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W005)
        begin
            w_reg[5][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[5][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W006)
        begin
            w_reg[6][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[6][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W007)
        begin
            w_reg[7][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[7][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W008)
        begin
            w_reg[8][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[8][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W009)
        begin
            w_reg[9][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[9][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W010)
        begin
            w_reg[10][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[10][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W011)
        begin
            w_reg[11][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[11][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W012)
        begin
            w_reg[12][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[12][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W013)
        begin
            w_reg[13][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[13][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W014)
        begin
            w_reg[14][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[14][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W015)
        begin
            w_reg[15][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[15][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W016)
        begin
            w_reg[16][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[16][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W017)
        begin
            w_reg[17][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[17][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W018)
        begin
            w_reg[18][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[18][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W019)
        begin
            w_reg[19][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[19][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W020)
        begin
            w_reg[20][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[20][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W021)
        begin
            w_reg[21][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[21][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W022)
        begin
            w_reg[22][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[22][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W023)
        begin
            w_reg[23][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[23][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W024)
        begin
            w_reg[24][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[24][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W025)
        begin
            w_reg[25][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[25][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W026)
        begin
            w_reg[26][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[26][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W027)
        begin
            w_reg[27][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[27][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W028)
        begin
            w_reg[28][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[28][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W029)
        begin
            w_reg[29][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[29][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W030)
        begin
            w_reg[30][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[30][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W031)
        begin
            w_reg[31][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[31][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W032)
        begin
            w_reg[32][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[32][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W033)
        begin
            w_reg[33][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[33][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W034)
        begin
            w_reg[34][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[34][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W035)
        begin
            w_reg[35][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[35][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W036)
        begin
            w_reg[36][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[36][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W037)
        begin
            w_reg[37][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[37][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W038)
        begin
            w_reg[38][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[38][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W039)
        begin
            w_reg[39][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[39][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W040)
        begin
            w_reg[40][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[40][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W041)
        begin
            w_reg[41][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[41][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W042)
        begin
            w_reg[42][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[42][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W043)
        begin
            w_reg[43][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[43][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W044)
        begin
            w_reg[44][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[44][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W045)
        begin
            w_reg[45][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[45][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W046)
        begin
            w_reg[46][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[46][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W047)
        begin
            w_reg[47][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[47][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W048)
        begin
            w_reg[48][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[48][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W049)
        begin
            w_reg[49][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[49][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W050)
        begin
            w_reg[50][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[50][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W051)
        begin
            w_reg[51][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[51][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W052)
        begin
            w_reg[52][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[52][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W053)
        begin
            w_reg[53][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[53][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W054)
        begin
            w_reg[54][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[54][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W055)
        begin
            w_reg[55][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[55][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W056)
        begin
            w_reg[56][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[56][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W057)
        begin
            w_reg[57][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[57][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W058)
        begin
            w_reg[58][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[58][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W059)
        begin
            w_reg[59][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[59][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W060)
        begin
            w_reg[60][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[60][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W061)
        begin
            w_reg[61][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[61][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W062)
        begin
            w_reg[62][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[62][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W063)
        begin
            w_reg[63][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[63][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W064)
        begin
            w_reg[64][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[64][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W065)
        begin
            w_reg[65][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[65][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W066)
        begin
            w_reg[66][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[66][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W067)
        begin
            w_reg[67][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[67][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W068)
        begin
            w_reg[68][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[68][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W069)
        begin
            w_reg[69][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[69][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W070)
        begin
            w_reg[70][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[70][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W071)
        begin
            w_reg[71][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[71][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W072)
        begin
            w_reg[72][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[72][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W073)
        begin
            w_reg[73][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[73][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W074)
        begin
            w_reg[74][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[74][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W075)
        begin
            w_reg[75][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[75][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W076)
        begin
            w_reg[76][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[76][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W077)
        begin
            w_reg[77][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[77][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W078)
        begin
            w_reg[78][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[78][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W079)
        begin
            w_reg[79][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[79][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W080)
        begin
            w_reg[80][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[80][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W081)
        begin
            w_reg[81][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[81][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W082)
        begin
            w_reg[82][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[82][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W083)
        begin
            w_reg[83][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[83][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W084)
        begin
            w_reg[84][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[84][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W085)
        begin
            w_reg[85][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[85][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W086)
        begin
            w_reg[86][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[86][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W087)
        begin
            w_reg[87][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[87][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W088)
        begin
            w_reg[88][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[88][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W089)
        begin
            w_reg[89][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[89][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W090)
        begin
            w_reg[90][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[90][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W091)
        begin
            w_reg[91][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[91][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W092)
        begin
            w_reg[92][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[92][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W093)
        begin
            w_reg[93][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[93][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W094)
        begin
            w_reg[94][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[94][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W095)
        begin
            w_reg[95][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[95][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W096)
        begin
            w_reg[96][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[96][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W097)
        begin
            w_reg[97][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[97][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W098)
        begin
            w_reg[98][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[98][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W099)
        begin
            w_reg[99][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[99][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W100)
        begin
            w_reg[100][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[100][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W101)
        begin
            w_reg[101][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[101][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W102)
        begin
            w_reg[102][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[102][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W103)
        begin
            w_reg[103][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[103][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W104)
        begin
            w_reg[104][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[104][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W105)
        begin
            w_reg[105][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[105][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W106)
        begin
            w_reg[106][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[106][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W107)
        begin
            w_reg[107][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[107][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W108)
        begin
            w_reg[108][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[108][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W109)
        begin
            w_reg[109][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[109][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W110)
        begin
            w_reg[110][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[110][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W111)
        begin
            w_reg[111][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[111][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W112)
        begin
            w_reg[112][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[112][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W113)
        begin
            w_reg[113][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[113][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W114)
        begin
            w_reg[114][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[114][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W115)
        begin
            w_reg[115][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[115][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W116)
        begin
            w_reg[116][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[116][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W117)
        begin
            w_reg[117][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[117][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W118)
        begin
            w_reg[118][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[118][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W119)
        begin
            w_reg[119][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[119][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W120)
        begin
            w_reg[120][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[120][15:0] & ~wmask);
        end      
        else if (w_hs && waddr == C_ADDR_W121)
        begin
            w_reg[121][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[121][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W122)
        begin
            w_reg[122][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[122][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W123)
        begin
            w_reg[123][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[123][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W124)
        begin
            w_reg[124][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[124][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W125)
        begin
            w_reg[125][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[125][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W126)
        begin
            w_reg[126][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[126][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_W127)
        begin
            w_reg[127][15:0] <= (s_axi_wdata[31:0] & wmask) | (w_reg[127][15:0] & ~wmask);
        end
    end

    // *** io_reg[0][15:0] - io_reg[47][15:0], start_reg, busy_reg ***
    always @(posedge aclk)
    begin
        if (!aresetn)
        begin
            for (i = 0; i <= 47; i = i+1)
                io_reg[i] <= 0;
            start_reg <= 0;
            busy_reg <= 0;
        end
        // *** Write from CPU ***
        else if (w_hs && waddr == C_ADDR_IO00)
        begin
            io_reg[0][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[0][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO01)
        begin
            io_reg[1][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[1][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO02)
        begin
            io_reg[2][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[2][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO03)
        begin
            io_reg[3][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[3][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO04)
        begin
            io_reg[4][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[4][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO05)
        begin
            io_reg[5][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[5][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO06)
        begin
            io_reg[6][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[6][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO07)
        begin
            io_reg[7][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[7][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO08)
        begin
            io_reg[8][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[8][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO09)
        begin
            io_reg[9][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[9][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO10)
        begin
            io_reg[10][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[10][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO11)
        begin
            io_reg[11][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[11][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO12)
        begin
            io_reg[12][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[12][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO13)
        begin
            io_reg[13][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[13][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO14)
        begin
            io_reg[14][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[14][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO15)
        begin
            io_reg[15][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[15][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO16)
        begin
            io_reg[16][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[16][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO17)
        begin
            io_reg[17][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[17][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO18)
        begin
            io_reg[18][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[18][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO19)
        begin
            io_reg[19][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[19][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO20)
        begin
            io_reg[20][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[20][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO21)
        begin
            io_reg[21][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[21][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO22)
        begin
            io_reg[22][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[22][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO23)
        begin
            io_reg[23][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[23][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO24)
        begin
            io_reg[24][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[24][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO25)
        begin
            io_reg[25][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[25][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO26)
        begin
            io_reg[26][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[26][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO27)
        begin
            io_reg[27][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[27][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO28)
        begin
            io_reg[28][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[28][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO29)
        begin
            io_reg[29][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[29][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO30)
        begin
            io_reg[30][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[30][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO31)
        begin
            io_reg[31][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[31][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO32)
        begin
            io_reg[32][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[32][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO33)
        begin
            io_reg[33][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[33][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO34)
        begin
            io_reg[34][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[34][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO35)
        begin
            io_reg[35][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[35][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO36)
        begin
            io_reg[36][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[36][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO37)
        begin
            io_reg[37][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[37][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO38)
        begin
            io_reg[38][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[38][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO39)
        begin
            io_reg[39][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[39][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO40)
        begin
            io_reg[40][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[40][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO41)
        begin
            io_reg[41][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[41][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO42)
        begin
            io_reg[42][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[42][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO43)
        begin
            io_reg[43][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[43][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO44)
        begin
            io_reg[44][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[44][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO45)
        begin
            io_reg[45][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[45][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO46)
        begin
            io_reg[46][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[46][15:0] & ~wmask);
        end
        else if (w_hs && waddr == C_ADDR_IO47)
        begin
            start_reg <= 1;
            busy_reg <= 1;
            io_reg[47][15:0] <= (s_axi_wdata[31:0] & wmask) | (io_reg[47][15:0] & ~wmask);
        end
        // *** Write from co-processor ***
        else if (w_cp_cs)
        begin
            for (i = 0; i <= 15; i = i+1)
                io_reg[i] <= buf_cs[i]; 
        end
        else if (done_cs)
        begin
            busy_reg <= 0;
        end
        else
        begin
            start_reg <= 0;
        end
    end

    // *** DNN controller *******************************************************
    // *** DNN instantiation ***
    dnn_dp dnn_dp_0
    (
        .clk(aclk),
        .rst_n(aresetn),
        .en(1),
        .clr(clr_cs),
        .x0(x0_cs), .x1(x1_cs), .x2(x2_cs), .x3(x3_cs), .x4(x4_cs), .x5(x5_cs), .x6(x6_cs), .x7(x7_cs),
        .w00(w00_cs), .w01(w01_cs), .w02(w02_cs), .w03(w03_cs), .w04(w04_cs), .w05(w05_cs), .w06(w06_cs), .w07(w07_cs),
        .w10(w10_cs), .w11(w11_cs), .w12(w12_cs), .w13(w13_cs), .w14(w14_cs), .w15(w15_cs), .w16(w16_cs), .w17(w17_cs),
        .w20(w20_cs), .w21(w21_cs), .w22(w22_cs), .w23(w23_cs), .w24(w24_cs), .w25(w25_cs), .w26(w26_cs), .w27(w27_cs),
        .w30(w30_cs), .w31(w31_cs), .w32(w32_cs), .w33(w33_cs), .w34(w34_cs), .w35(w35_cs), .w36(w36_cs), .w37(w37_cs),
        .w40(w40_cs), .w41(w41_cs), .w42(w42_cs), .w43(w43_cs), .w44(w44_cs), .w45(w45_cs), .w46(w46_cs), .w47(w47_cs),
        .w50(w50_cs), .w51(w51_cs), .w52(w52_cs), .w53(w53_cs), .w54(w54_cs), .w55(w55_cs), .w56(w56_cs), .w57(w57_cs),
        .w60(w60_cs), .w61(w61_cs), .w62(w62_cs), .w63(w63_cs), .w64(w64_cs), .w65(w65_cs), .w66(w66_cs), .w67(w67_cs),
        .w70(w70_cs), .w71(w71_cs), .w72(w72_cs), .w73(w73_cs), .w74(w74_cs), .w75(w75_cs), .w76(w76_cs), .w77(w77_cs),
        .a0(a0_w), .a1(a1_w), .a2(a2_w), .a3(a3_w), .a4(a4_w), .a5(a5_w), .a6(a6_w), .a7(a7_w)
    );
    
    // *** DNN FSM register ***
    always @(posedge aclk)
    begin
        if (!aresetn)
        begin
            _cs <= S_IDLE;
            w_cp_cs <= 0;
            for (i = 0; i <= 63; i = i+1)
                buf_cs[i] <= 0;
            clr_cs <= 0;
            x0_cs <= 0; x1_cs <= 0; x2_cs <= 0; x3_cs <= 0;
            x4_cs <= 0; x5_cs <= 0; x6_cs <= 0; x7_cs <= 0;
            w00_cs <= 0; w01_cs <= 0; w02_cs <= 0; w03_cs <= 0; w04_cs <= 0; w05_cs <= 0; w06_cs <= 0; w07_cs <= 0;
            w10_cs <= 0; w11_cs <= 0; w12_cs <= 0; w13_cs <= 0; w14_cs <= 0; w15_cs <= 0; w16_cs <= 0; w17_cs <= 0;
            w20_cs <= 0; w21_cs <= 0; w22_cs <= 0; w23_cs <= 0; w24_cs <= 0; w25_cs <= 0; w26_cs <= 0; w27_cs <= 0;
            w30_cs <= 0; w31_cs <= 0; w32_cs <= 0; w33_cs <= 0; w34_cs <= 0; w35_cs <= 0; w36_cs <= 0; w37_cs <= 0;
            w40_cs <= 0; w41_cs <= 0; w42_cs <= 0; w43_cs <= 0; w44_cs <= 0; w45_cs <= 0; w46_cs <= 0; w47_cs <= 0;
            w50_cs <= 0; w51_cs <= 0; w52_cs <= 0; w53_cs <= 0; w54_cs <= 0; w55_cs <= 0; w56_cs <= 0; w57_cs <= 0;
            w60_cs <= 0; w61_cs <= 0; w62_cs <= 0; w63_cs <= 0; w64_cs <= 0; w65_cs <= 0; w66_cs <= 0; w67_cs <= 0;
            w70_cs <= 0; w71_cs <= 0; w72_cs <= 0; w73_cs <= 0; w74_cs <= 0; w75_cs <= 0; w76_cs <= 0; w77_cs <= 0;
            done_cs <= 0;
        end
        else
        begin
            _cs <= _ns;
            w_cp_cs <= w_cp_ns;
            for (i = 0; i <= 63; i = i+1)
                buf_cs[i] <= buf_ns[i];
            clr_cs <= clr_ns;
            x0_cs <= x0_ns; x1_cs <= x1_ns; x2_cs <= x2_ns; x3_cs <= x3_ns;
            x4_cs <= x4_ns; x5_cs <= x5_ns; x6_cs <= x6_ns; x7_cs <= x7_ns;
            w00_cs <= w00_ns; w01_cs <= w01_ns; w02_cs <= w02_ns; w03_cs <= w03_ns; w04_cs <= w04_ns; w05_cs <= w05_ns; w06_cs <= w06_ns; w07_cs <= w07_ns;
            w10_cs <= w10_ns; w11_cs <= w11_ns; w12_cs <= w12_ns; w13_cs <= w13_ns; w14_cs <= w14_ns; w15_cs <= w15_ns; w16_cs <= w16_ns; w17_cs <= w17_ns;
            w20_cs <= w20_ns; w21_cs <= w21_ns; w22_cs <= w22_ns; w23_cs <= w23_ns; w24_cs <= w24_ns; w25_cs <= w25_ns; w26_cs <= w26_ns; w27_cs <= w27_ns;
            w30_cs <= w30_ns; w31_cs <= w31_ns; w32_cs <= w32_ns; w33_cs <= w33_ns; w34_cs <= w34_ns; w35_cs <= w35_ns; w36_cs <= w36_ns; w37_cs <= w37_ns;
            w40_cs <= w40_ns; w41_cs <= w41_ns; w42_cs <= w42_ns; w43_cs <= w43_ns; w44_cs <= w44_ns; w45_cs <= w45_ns; w46_cs <= w46_ns; w47_cs <= w47_ns;
            w50_cs <= w50_ns; w51_cs <= w51_ns; w52_cs <= w52_ns; w53_cs <= w53_ns; w54_cs <= w54_ns; w55_cs <= w55_ns; w56_cs <= w56_ns; w57_cs <= w57_ns;
            w60_cs <= w60_ns; w61_cs <= w61_ns; w62_cs <= w62_ns; w63_cs <= w63_ns; w64_cs <= w64_ns; w65_cs <= w65_ns; w66_cs <= w66_ns; w67_cs <= w67_ns;
            w70_cs <= w70_ns; w71_cs <= w71_ns; w72_cs <= w72_ns; w73_cs <= w73_ns; w74_cs <= w74_ns; w75_cs <= w75_ns; w76_cs <= w76_ns; w77_cs <= w77_ns;
            done_cs <= done_ns;
        end
    end
    
    // *** DNN FSM next state ***
    always @(*)
    begin
        _ns = _cs;
        w_cp_ns = 0;
        for (i = 0; i <= 63; i = i+1)
            buf_ns[i] = buf_cs[i];
        clr_ns = clr_cs;
        x0_ns = x0_cs; x1_ns = x1_cs; x2_ns = x2_cs; x3_ns = x3_cs;
        x4_ns = x4_cs; x5_ns = x5_cs; x6_ns = x6_cs; x7_ns = x7_cs;
        w00_ns = w00_cs; w01_ns = w01_cs; w02_ns = w02_cs; w03_ns = w03_cs; w04_ns = w04_cs; w05_ns = w05_cs; w06_ns = w06_cs; w07_ns = w07_cs;
        w10_ns = w10_cs; w11_ns = w11_cs; w12_ns = w12_cs; w13_ns = w13_cs; w14_ns = w14_cs; w15_ns = w15_cs; w16_ns = w16_cs; w17_ns = w17_cs;
        w20_ns = w20_cs; w21_ns = w21_cs; w22_ns = w22_cs; w23_ns = w23_cs; w24_ns = w24_cs; w25_ns = w25_cs; w26_ns = w26_cs; w27_ns = w27_cs;
        w30_ns = w30_cs; w31_ns = w31_cs; w32_ns = w32_cs; w33_ns = w33_cs; w34_ns = w34_cs; w35_ns = w35_cs; w36_ns = w36_cs; w37_ns = w37_cs;
        w40_ns = w40_cs; w41_ns = w41_cs; w42_ns = w42_cs; w43_ns = w43_cs; w44_ns = w44_cs; w45_ns = w45_cs; w46_ns = w46_cs; w47_ns = w47_cs;
        w50_ns = w50_cs; w51_ns = w51_cs; w52_ns = w52_cs; w53_ns = w53_cs; w54_ns = w54_cs; w55_ns = w55_cs; w56_ns = w56_cs; w57_ns = w57_cs;
        w60_ns = w60_cs; w61_ns = w61_cs; w62_ns = w62_cs; w63_ns = w63_cs; w64_ns = w64_cs; w65_ns = w65_cs; w66_ns = w66_cs; w67_ns = w67_cs;
        w70_ns = w70_cs; w71_ns = w71_cs; w72_ns = w72_cs; w73_ns = w73_cs; w74_ns = w74_cs; w75_ns = w75_cs; w76_ns = w76_cs; w77_ns = w77_cs;
        done_ns = 0;
        case (_cs)
            S_IDLE:
            begin
                if (start_reg)
                    _ns = S_LDINP;
            end
            S_LDINP:    // Load x input from IO register to buffer register
            begin
                for (i = 0; i <= 47; i = i+1)
                    buf_ns[i] = io_reg[i];
                _ns = S_LDW1;
            end
            S_LDW1:     // Load w for hidden layer 1
            begin
                clr_ns = 1;
                w00_ns = w_reg[0]; w01_ns = w_reg[1]; w02_ns = w_reg[2]; w03_ns = w_reg[3]; w04_ns = w_reg[4]; w05_ns = w_reg[5]; w06_ns = w_reg[6]; w07_ns = w_reg[7];
                w10_ns = w_reg[8]; w11_ns = w_reg[9]; w12_ns = w_reg[10]; w13_ns = w_reg[11]; w14_ns = w_reg[12]; w15_ns = w_reg[13]; w16_ns = w_reg[14]; w17_ns = w_reg[15];
                w20_ns = w_reg[16]; w21_ns = w_reg[17]; w22_ns = w_reg[18]; w23_ns = w_reg[19]; w24_ns = w_reg[20]; w25_ns = w_reg[21]; w26_ns = w_reg[22]; w27_ns = w_reg[23];
                w30_ns = w_reg[24]; w31_ns = w_reg[25]; w32_ns = w_reg[26]; w33_ns = w_reg[27]; w34_ns = w_reg[28]; w35_ns = w_reg[29]; w36_ns = w_reg[30]; w37_ns = w_reg[31];
                w40_ns = w_reg[32]; w41_ns = w_reg[33]; w42_ns = w_reg[34]; w43_ns = w_reg[35]; w44_ns = w_reg[36]; w45_ns = w_reg[37]; w46_ns = w_reg[38]; w47_ns = w_reg[39];
                w50_ns = w_reg[40]; w51_ns = w_reg[41]; w52_ns = w_reg[42]; w53_ns = w_reg[43]; w54_ns = w_reg[44]; w55_ns = w_reg[45]; w56_ns = w_reg[46]; w57_ns = w_reg[47];
                _ns = S_P1_1;                 
            end
            S_P1_1:     // Laod x input from buffer register to x register
            begin
                clr_ns = 0;
                x0_ns = buf_cs[0]; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P1_2;
            end
            S_P1_2:     // Laod x input from buffer register to x register
            begin
                x0_ns = buf_cs[6]; x1_ns = buf_cs[1]; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P1_3;   
            end
            S_P1_3:     // Laod x input from buffer register to x register
            begin
                x0_ns = buf_cs[12]; x1_ns = buf_cs[7]; x2_ns = buf_cs[2]; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P1_4;   
            end
            S_P1_4:     // Laod x input from buffer register to x register
            begin
                x0_ns = buf_cs[18]; x1_ns = buf_cs[13]; x2_ns = buf_cs[8]; x3_ns = buf_cs[3];
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P1_5;   
            end
            S_P1_5:     // Laod x input from buffer register to x register
            begin
                x0_ns = buf_cs[24]; x1_ns = buf_cs[19]; x2_ns = buf_cs[14]; x3_ns = buf_cs[9];
                x4_ns = buf_cs[4]; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P1_6;   
            end
            S_P1_6:     // Laod x input from buffer register to x register
            begin
                x0_ns = buf_cs[30]; x1_ns = buf_cs[25]; x2_ns = buf_cs[20]; x3_ns = buf_cs[15];
                x4_ns = buf_cs[10]; x5_ns = buf_cs[5]; x6_ns = 0; x7_ns = 0;
                _ns = S_P1_7;   
            end
            S_P1_7:     // Laod x input from buffer register to x register
            begin
                x0_ns = buf_cs[36]; x1_ns = buf_cs[31]; x2_ns = buf_cs[26]; x3_ns = buf_cs[21];
                x4_ns = buf_cs[16]; x5_ns = buf_cs[11]; x6_ns = 0; x7_ns = 0;
                _ns = S_P1_8;   
            end
            S_P1_8:     // Laod x input from buffer register to x register
            begin
                x0_ns = buf_cs[42]; x1_ns = buf_cs[37]; x2_ns = buf_cs[32]; x3_ns = buf_cs[27];
                x4_ns = buf_cs[22]; x5_ns = buf_cs[17]; x6_ns = 0; x7_ns = 0;
                _ns = S_P1_9;   
            end
            S_P1_9:     // Laod x input from buffer register to x register
            begin
                x0_ns = 0; x1_ns = buf_cs[43]; x2_ns = buf_cs[38]; x3_ns = buf_cs[33];
                x4_ns = buf_cs[28]; x5_ns = buf_cs[23]; x6_ns = 0; x7_ns = 0;
                _ns = S_P1_10;   
            end
            S_P1_10:     // Laod x input from buffer register to x register
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = buf_cs[44]; x3_ns = buf_cs[39];
                x4_ns = buf_cs[34]; x5_ns = buf_cs[29]; x6_ns = 0; x7_ns = 0;
                _ns = S_P1_11;   
            end
            S_P1_11:     // Laod x input from buffer register to x register
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = buf_cs[45];
                x4_ns = buf_cs[40]; x5_ns = buf_cs[35]; x6_ns = 0; x7_ns = 0;
                _ns = S_P1_12;
                
                buf_ns[0] = a0_w;                   
            end
            S_P1_12:     // Laod x input from buffer register to x register
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = buf_cs[46]; x5_ns = buf_cs[41]; x6_ns = 0; x7_ns = 0;
                _ns = S_P1_13;
                
                buf_ns[1] = a1_w; buf_ns[8] = a0_w;
            end
            S_P1_13:     // Laod x input from buffer register to x register
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = buf_cs[47]; x6_ns = 0; x7_ns = 0;
                _ns = S_P1_14;
                
                buf_ns[2] = a2_w; buf_ns[9] = a1_w; buf_ns[16] = a0_w;
            end
            S_P1_14:     // Laod x input from buffer register to x register
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P1_R1;
                
                buf_ns[3] = a3_w; buf_ns[10] = a2_w; buf_ns[17] = a1_w; buf_ns[24] = a0_w;
            end
            S_P1_R1:
            begin
                _ns = S_P1_R2;
                buf_ns[4] = a4_w; buf_ns[11] = a3_w; buf_ns[18] = a2_w; buf_ns[25] = a1_w; buf_ns[32] = a0_w;
            end
            S_P1_R2:
            begin
                _ns = S_P1_R3;
                buf_ns[5] = a5_w; buf_ns[12] = a4_w; buf_ns[19] = a3_w; buf_ns[26] = a2_w; buf_ns[33] = a1_w; buf_ns[40] = a0_w;
            end
            S_P1_R3:
            begin
                _ns = S_P1_R4;
                buf_ns[6] = a6_w; buf_ns[13] = a5_w; buf_ns[20] = a4_w; buf_ns[27] = a3_w; buf_ns[34] = a2_w; buf_ns[41] = a1_w; buf_ns[48] = a0_w;
            end
            S_P1_R4:
            begin
                _ns = S_P1_R5;
                buf_ns[7] = a7_w; buf_ns[14] = a6_w; buf_ns[21] = a5_w; buf_ns[28] = a4_w; buf_ns[35] = a3_w; buf_ns[42] = a2_w; buf_ns[49] = a1_w; buf_ns[56] = a0_w;
            end
            S_P1_R5:
            begin
                _ns = S_P1_R6;
                buf_ns[15] = a7_w; buf_ns[22] = a6_w; buf_ns[29] = a5_w; buf_ns[36] = a4_w; buf_ns[43] = a3_w; buf_ns[50] = a2_w; buf_ns[57] = a1_w;
            end
            S_P1_R6:
            begin
                _ns = S_P1_R7;
                buf_ns[23] = a7_w; buf_ns[30] = a6_w; buf_ns[37] = a5_w; buf_ns[44] = a4_w; buf_ns[51] = a3_w; buf_ns[58] = a2_w;
            end
            S_P1_R7:
            begin
                _ns = S_P1_R8;
                buf_ns[31] = a7_w; buf_ns[38] = a6_w; buf_ns[45] = a5_w; buf_ns[52] = a4_w; buf_ns[59] = a3_w;
            end
            S_P1_R8:
            begin
                _ns = S_P1_R9;
                buf_ns[39] = a7_w; buf_ns[46] = a6_w; buf_ns[53] = a5_w; buf_ns[60] = a4_w;
            end                   
            S_P1_R9:
            begin
                _ns = S_P1_R10;
                buf_ns[47] = a7_w; buf_ns[54] = a6_w; buf_ns[61] = a5_w;
            end
            S_P1_R10:
            begin
                _ns = S_P1_R11;
                buf_ns[55] = a7_w; buf_ns[62] = a6_w;
            end
            S_P1_R11:
            begin
                _ns = S_LDW2;
                buf_ns[63] = a7_w;
            end
            S_LDW2:
            begin
                clr_ns = 1;
                w00_ns = w_reg[48]; w01_ns = w_reg[49]; w02_ns = w_reg[50]; w03_ns = w_reg[51]; w04_ns = w_reg[52]; w05_ns = w_reg[53]; w06_ns = 0; w07_ns = 0;
                w10_ns = w_reg[54]; w11_ns = w_reg[55]; w12_ns = w_reg[56]; w13_ns = w_reg[57]; w14_ns = w_reg[58]; w15_ns = w_reg[59]; w16_ns = 0; w17_ns = 0;
                w20_ns = w_reg[60]; w21_ns = w_reg[61]; w22_ns = w_reg[62]; w23_ns = w_reg[63]; w24_ns = w_reg[64]; w25_ns = w_reg[65]; w26_ns = 0; w27_ns = 0;
                w30_ns = w_reg[66]; w31_ns = w_reg[67]; w32_ns = w_reg[68]; w33_ns = w_reg[69]; w34_ns = w_reg[70]; w35_ns = w_reg[71]; w36_ns = 0; w37_ns = 0;
                w40_ns = w_reg[72]; w41_ns = w_reg[73]; w42_ns = w_reg[74]; w43_ns = w_reg[75]; w44_ns = w_reg[76]; w45_ns = w_reg[77]; w46_ns = 0; w47_ns = 0;
                w50_ns = w_reg[78]; w51_ns = w_reg[79]; w52_ns = w_reg[80]; w53_ns = w_reg[81]; w54_ns = w_reg[82]; w55_ns = w_reg[83]; w56_ns = 0; w57_ns = 0;
                w60_ns = w_reg[84]; w61_ns = w_reg[85]; w62_ns = w_reg[86]; w63_ns = w_reg[87]; w64_ns = w_reg[88]; w65_ns = w_reg[89]; w66_ns = 0; w67_ns = 0;
                w70_ns = w_reg[90]; w71_ns = w_reg[91]; w72_ns = w_reg[92]; w73_ns = w_reg[93]; w74_ns = w_reg[94]; w75_ns = w_reg[95]; w76_ns = 0; w77_ns = 0;
                _ns = S_P2_1;           
            end
            S_P2_1:
            begin
                clr_ns = 0;
                x0_ns = buf_cs[0]; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P2_2;
            end
            S_P2_2:
            begin
                x0_ns = buf_cs[8]; x1_ns = buf_cs[1]; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P2_3;
            end
            S_P2_3:
            begin
                x0_ns = buf_cs[16]; x1_ns = buf_cs[9]; x2_ns = buf_cs[2]; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P2_4;
            end
            S_P2_4:
            begin
                x0_ns = buf_cs[24]; x1_ns = buf_cs[17]; x2_ns = buf_cs[10]; x3_ns = buf_cs[3];
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P2_5;
            end
            S_P2_5:
            begin
                x0_ns = buf_cs[32]; x1_ns = buf_cs[25]; x2_ns = buf_cs[18]; x3_ns = buf_cs[11];
                x4_ns = buf_cs[4]; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P2_6;
            end        
            S_P2_6:
            begin
                x0_ns = buf_cs[40]; x1_ns = buf_cs[33]; x2_ns = buf_cs[26]; x3_ns = buf_cs[19];
                x4_ns = buf_cs[12]; x5_ns = buf_cs[5]; x6_ns = 0; x7_ns = 0;
                _ns = S_P2_7;
            end
            S_P2_7:
            begin
                x0_ns = buf_cs[48]; x1_ns = buf_cs[41]; x2_ns = buf_cs[34]; x3_ns = buf_cs[27];
                x4_ns = buf_cs[20]; x5_ns = buf_cs[13]; x6_ns = buf_cs[6]; x7_ns = 0;
                _ns = S_P2_8;
            end
            S_P2_8:
            begin
                x0_ns = buf_cs[56]; x1_ns = buf_cs[49]; x2_ns = buf_cs[42]; x3_ns = buf_cs[35];
                x4_ns = buf_cs[28]; x5_ns = buf_cs[21]; x6_ns = buf_cs[14]; x7_ns = buf_cs[7];
                _ns = S_P2_9;
            end
            S_P2_9:
            begin
                x0_ns = 0; x1_ns = buf_cs[57]; x2_ns = buf_cs[50]; x3_ns = buf_cs[43];
                x4_ns = buf_cs[36]; x5_ns = buf_cs[29]; x6_ns = buf_cs[22]; x7_ns = buf_cs[15];
                _ns = S_P2_10;
            end
            S_P2_10:
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = buf_cs[58]; x3_ns = buf_cs[51];
                x4_ns = buf_cs[44]; x5_ns = buf_cs[37]; x6_ns = buf_cs[30]; x7_ns = buf_cs[23];
                _ns = S_P2_11;
            end
            S_P2_11:
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = buf_cs[59];
                x4_ns = buf_cs[52]; x5_ns = buf_cs[45]; x6_ns = buf_cs[38]; x7_ns = buf_cs[31];
                _ns = S_P2_12;
                
                buf_ns[0] = a0_w;
            end
            S_P2_12:
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = buf_cs[60]; x5_ns = buf_cs[53]; x6_ns = buf_cs[46]; x7_ns = buf_cs[39];
                _ns = S_P2_13;
                
                buf_ns[1] = a1_w; buf_ns[6] = a0_w;
            end
            S_P2_13:
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = buf_cs[61]; x6_ns = buf_cs[54]; x7_ns = buf_cs[47];
                _ns = S_P2_14;
                 
                buf_ns[2] = a2_w; buf_ns[7] = a1_w; buf_ns[12] = a0_w;
            end
            S_P2_14:
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = buf_cs[62]; x7_ns = buf_cs[55];
                _ns = S_P2_15;
                
                buf_ns[3] = a3_w; buf_ns[8] = a2_w; buf_ns[13] = a1_w; buf_ns[18] = a0_w;
            end
            S_P2_15:
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = buf_cs[63];
                _ns = S_P2_16;
                
                buf_ns[4] = a4_w; buf_ns[9] = a3_w; buf_ns[14] = a2_w; buf_ns[19] = a1_w; buf_ns[24] = a0_w;
            end
            S_P2_16:
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P2_R1;
                
                buf_ns[5] = a5_w; buf_ns[10] = a4_w; buf_ns[15] = a3_w; buf_ns[20] = a2_w; buf_ns[25] = a1_w; buf_ns[30] = a0_w;
            end
            S_P2_R1:
            begin
                _ns = S_P2_R2;
                buf_ns[11] = a5_w; buf_ns[16] = a4_w; buf_ns[21] = a3_w; buf_ns[26] = a2_w; buf_ns[31] = a1_w; buf_ns[36] = a0_w;
            end
            S_P2_R2:
            begin
                _ns = S_P2_R3;
                buf_ns[17] = a5_w; buf_ns[22] = a4_w; buf_ns[27] = a3_w; buf_ns[32] = a2_w; buf_ns[37] = a1_w; buf_ns[42] = a0_w;
            end
            S_P2_R3:
            begin
                _ns = S_P2_R4;
                buf_ns[23] = a5_w; buf_ns[28] = a4_w; buf_ns[33] = a3_w; buf_ns[38] = a2_w; buf_ns[43] = a1_w;
            end
            S_P2_R4:
            begin
                _ns = S_P2_R5;
                buf_ns[29] = a5_w; buf_ns[34] = a4_w; buf_ns[39] = a3_w; buf_ns[44] = a2_w;
            end
            S_P2_R5:
            begin
                _ns = S_P2_R6;
                buf_ns[35] = a5_w; buf_ns[40] = a4_w; buf_ns[45] = a3_w;
            end
            S_P2_R6:
            begin
                _ns = S_P2_R7;
                buf_ns[41] = a5_w; buf_ns[46] = a4_w;
            end
            S_P2_R7:
            begin
                _ns = S_LDW3;
                buf_ns[47] = a5_w;
            end
            S_LDW3:
            begin
                clr_ns = 1;
                w00_ns = w_reg[96]; w01_ns = w_reg[97]; w02_ns = w_reg[98]; w03_ns = w_reg[99]; w04_ns = 0; w05_ns = 0; w06_ns = 0; w07_ns = 0;
                w10_ns = w_reg[100]; w11_ns = w_reg[101]; w12_ns = w_reg[102]; w13_ns = w_reg[103]; w14_ns = 0; w15_ns = 0; w16_ns = 0; w17_ns = 0;
                w20_ns = w_reg[104]; w21_ns = w_reg[105]; w22_ns = w_reg[106]; w23_ns = w_reg[107]; w24_ns = 0; w25_ns = 0; w26_ns = 0; w27_ns = 0;
                w30_ns = w_reg[108]; w31_ns = w_reg[109]; w32_ns = w_reg[110]; w33_ns = w_reg[111]; w34_ns = 0; w35_ns = 0; w36_ns = 0; w37_ns = 0;
                w40_ns = w_reg[112]; w41_ns = w_reg[113]; w42_ns = w_reg[114]; w43_ns = w_reg[115]; w44_ns = 0; w45_ns = 0; w46_ns = 0; w47_ns = 0;
                w50_ns = w_reg[116]; w51_ns = w_reg[117]; w52_ns = w_reg[118]; w53_ns = w_reg[119]; w54_ns = 0; w55_ns = 0; w56_ns = 0; w57_ns = 0;
                w60_ns = 0; w61_ns = 0; w62_ns = 0; w63_ns = 0; w64_ns = 0; w65_ns = 0; w66_ns = 0; w67_ns = 0;
                w70_ns = 0; w71_ns = 0; w72_ns = 0; w73_ns = 0; w74_ns = 0; w75_ns = 0; w76_ns = 0; w77_ns = 0;
                _ns = S_P3_1;           
            end
            S_P3_1:
            begin
                clr_ns = 0;
                x0_ns = buf_cs[0]; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P3_2;
            end
            S_P3_2:
            begin
                x0_ns = buf_cs[6]; x1_ns = buf_cs[1]; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P3_3;   
            end
            S_P3_3:
            begin
                x0_ns = buf_cs[12]; x1_ns = buf_cs[7]; x2_ns = buf_cs[2]; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P3_4;   
            end
            S_P3_4:
            begin
                x0_ns = buf_cs[18]; x1_ns = buf_cs[13]; x2_ns = buf_cs[8]; x3_ns = buf_cs[3];
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P3_5;   
            end
            S_P3_5:
            begin
                x0_ns = buf_cs[24]; x1_ns = buf_cs[19]; x2_ns = buf_cs[14]; x3_ns = buf_cs[9];
                x4_ns = buf_cs[4]; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P3_6;   
            end
            S_P3_6:
            begin
                x0_ns = buf_cs[30]; x1_ns = buf_cs[25]; x2_ns = buf_cs[20]; x3_ns = buf_cs[15];
                x4_ns = buf_cs[10]; x5_ns = buf_cs[5]; x6_ns = 0; x7_ns = 0;
                _ns = S_P3_7;   
            end
            S_P3_7:
            begin
                x0_ns = buf_cs[36]; x1_ns = buf_cs[31]; x2_ns = buf_cs[26]; x3_ns = buf_cs[21];
                x4_ns = buf_cs[16]; x5_ns = buf_cs[11]; x6_ns = 0; x7_ns = 0;
                _ns = S_P3_8;   
            end
            S_P3_8:
            begin
                x0_ns = buf_cs[42]; x1_ns = buf_cs[37]; x2_ns = buf_cs[32]; x3_ns = buf_cs[27];
                x4_ns = buf_cs[22]; x5_ns = buf_cs[17]; x6_ns = 0; x7_ns = 0;
                _ns = S_P3_9;   
            end
            S_P3_9:
            begin
                x0_ns = 0; x1_ns = buf_cs[43]; x2_ns = buf_cs[38]; x3_ns = buf_cs[33];
                x4_ns = buf_cs[28]; x5_ns = buf_cs[23]; x6_ns = 0; x7_ns = 0;
                _ns = S_P3_10;   
            end
            S_P3_10:
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = buf_cs[44]; x3_ns = buf_cs[39];
                x4_ns = buf_cs[34]; x5_ns = buf_cs[29]; x6_ns = 0; x7_ns = 0;
                _ns = S_P3_11;   
            end
            S_P3_11:
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = buf_cs[45];
                x4_ns = buf_cs[40]; x5_ns = buf_cs[35]; x6_ns = 0; x7_ns = 0;
                _ns = S_P3_12;
                
                buf_ns[0] = a0_w;                   
            end
            S_P3_12:
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = buf_cs[46]; x5_ns = buf_cs[41]; x6_ns = 0; x7_ns = 0;
                _ns = S_P3_13;
                
                buf_ns[1] = a1_w; buf_ns[4] = a0_w;
            end
            S_P3_13:
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = buf_cs[47]; x6_ns = 0; x7_ns = 0;
                _ns = S_P3_14;
                
                buf_ns[2] = a2_w; buf_ns[5] = a1_w; buf_ns[8] = a0_w;
            end
            S_P3_14:begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P3_R1;
                
                buf_ns[3] = a3_w; buf_ns[6] = a2_w; buf_ns[9] = a1_w; buf_ns[12] = a0_w;
            end
            S_P3_R1:
            begin
                _ns = S_P3_R2;
                buf_ns[7] = a3_w; buf_ns[10] = a2_w; buf_ns[13] = a1_w; buf_ns[16] = a0_w;
            end
            S_P3_R2:
            begin
                _ns = S_P3_R3;
                buf_ns[11] = a3_w; buf_ns[14] = a2_w; buf_ns[17] = a1_w; buf_ns[20] = a0_w;
            end
            S_P3_R3:
            begin
                _ns = S_P3_R4;
                buf_ns[15] = a3_w; buf_ns[18] = a2_w; buf_ns[21] = a1_w; buf_ns[24] = a0_w;
            end
            S_P3_R4:
            begin
                _ns = S_P3_R5;
                buf_ns[19] = a3_w; buf_ns[22] = a2_w; buf_ns[25] = a1_w; buf_ns[28] = a0_w;
            end
            S_P3_R5:
            begin
                _ns = S_P3_R6;
                buf_ns[23] = a3_w; buf_ns[26] = a2_w; buf_ns[29] = a1_w;
            end
            S_P3_R6:
            begin
                _ns = S_P3_R7;
                buf_ns[27] = a3_w; buf_ns[30] = a2_w;
            end
            S_P3_R7:
            begin
                _ns = S_LDW4;
                buf_ns[31] = a3_w;
            end
            S_LDW4:
            begin
                clr_ns = 1;
                w00_ns = w_reg[120]; w01_ns = w_reg[121]; w02_ns = 0; w03_ns = 0; w04_ns = 0; w05_ns = 0; w06_ns = 0; w07_ns = 0;
                w10_ns = w_reg[122]; w11_ns = w_reg[123]; w12_ns = 0; w13_ns = 0; w14_ns = 0; w15_ns = 0; w16_ns = 0; w17_ns = 0;
                w20_ns = w_reg[124]; w21_ns = w_reg[125]; w22_ns = 0; w23_ns = 0; w24_ns = 0; w25_ns = 0; w26_ns = 0; w27_ns = 0;
                w30_ns = w_reg[126]; w31_ns = w_reg[127]; w32_ns = 0; w33_ns = 0; w34_ns = 0; w35_ns = 0; w36_ns = 0; w37_ns = 0;
                w40_ns = 0; w41_ns = 0; w42_ns = 0; w43_ns = 0; w44_ns = 0; w45_ns = 0; w46_ns = 0; w47_ns = 0;
                w50_ns = 0; w51_ns = 0; w52_ns = 0; w53_ns = 0; w54_ns = 0; w55_ns = 0; w56_ns = 0; w57_ns = 0;
                w60_ns = 0; w61_ns = 0; w62_ns = 0; w63_ns = 0; w64_ns = 0; w65_ns = 0; w66_ns = 0; w67_ns = 0;
                w70_ns = 0; w71_ns = 0; w72_ns = 0; w73_ns = 0; w74_ns = 0; w75_ns = 0; w76_ns = 0; w77_ns = 0;
                _ns = S_P4_1;                
            end
            S_P4_1:
            begin
                clr_ns = 0;
                x0_ns = buf_cs[0]; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P4_2;
            end
            S_P4_2:
            begin
                x0_ns = buf_cs[4]; x1_ns = buf_ns[1]; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P4_3;
            end
            S_P4_3:
            begin
                x0_ns = buf_cs[8]; x1_ns = buf_ns[5]; x2_ns = buf_ns[2]; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P4_4;
            end
            S_P4_4:
            begin
                x0_ns = buf_cs[12]; x1_ns = buf_ns[9]; x2_ns = buf_ns[6]; x3_ns = buf_ns[3];
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P4_5;
            end
            S_P4_5:
            begin
                x0_ns = buf_cs[16]; x1_ns = buf_ns[13]; x2_ns = buf_ns[10]; x3_ns = buf_ns[7];
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P4_6;
            end
            S_P4_6:
            begin
                x0_ns = buf_cs[20]; x1_ns = buf_ns[17]; x2_ns = buf_ns[14]; x3_ns = buf_ns[11];
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P4_7;
            end
            S_P4_7:
            begin
                x0_ns = buf_cs[24]; x1_ns = buf_ns[21]; x2_ns = buf_ns[18]; x3_ns = buf_ns[15];
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P4_8;
            end
            S_P4_8:
            begin
                x0_ns = buf_cs[28]; x1_ns = buf_ns[25]; x2_ns = buf_ns[22]; x3_ns = buf_ns[19];
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P4_9;
            end
            S_P4_9:
            begin
                x0_ns = 0; x1_ns = buf_ns[29]; x2_ns = buf_ns[26]; x3_ns = buf_ns[23];
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P4_10;
            end
            S_P4_10:
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = buf_ns[30]; x3_ns = buf_ns[27];
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P4_11;
            end
            S_P4_11:
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = buf_ns[31];
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P4_12;
                
                buf_ns[0] = a0_w;
            end
            S_P4_12:
            begin
                x0_ns = 0; x1_ns = 0; x2_ns = 0; x3_ns = 0;
                x4_ns = 0; x5_ns = 0; x6_ns = 0; x7_ns = 0;
                _ns = S_P4_R1;

                buf_ns[1] = a1_w; buf_ns[2] = a0_w;
            end
            S_P4_R1:
            begin
                _ns = S_P4_R2;
                buf_ns[3] = a1_w; buf_ns[4] = a0_w;
            end
            S_P4_R2:
            begin
                _ns = S_P4_R3;
                buf_ns[5] = a1_w; buf_ns[6] = a0_w;
            end
            S_P4_R3:
            begin
                _ns = S_P4_R4;
                buf_ns[7] = a1_w; buf_ns[8] = a0_w;
            end
            S_P4_R4:
            begin
                _ns = S_P4_R5;
                buf_ns[9] = a1_w; buf_ns[10] = a0_w;
            end
            S_P4_R5:
            begin
                _ns = S_P4_R6;
                buf_ns[11] = a1_w; buf_ns[12] = a0_w;
            end
            S_P4_R6:
            begin
                _ns = S_P4_R7;
                buf_ns[13] = a1_w; buf_ns[14] = a0_w;
            end
            S_P4_R7:
            begin
                _ns = S_WROUT;
                buf_ns[15] = a1_w;
            end
            S_WROUT:
            begin
                _ns = S_DONE;
                w_cp_ns = 1;
            end
            S_DONE:
            begin
                _ns = S_IDLE;
                done_ns = 1;
            end
        endcase
    end
    
endmodule
