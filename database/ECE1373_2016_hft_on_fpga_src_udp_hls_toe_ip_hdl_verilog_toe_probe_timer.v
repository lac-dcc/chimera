// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.1
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_probe_timer (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        rxEng2timer_clearProbeTimer_V_s_dout,
        rxEng2timer_clearProbeTimer_V_s_empty_n,
        rxEng2timer_clearProbeTimer_V_s_read,
        txEng2timer_setProbeTimer_V_V_dout,
        txEng2timer_setProbeTimer_V_V_empty_n,
        txEng2timer_setProbeTimer_V_V_read,
        probeTimer2eventEng_setEvent_V_din,
        probeTimer2eventEng_setEvent_V_full_n,
        probeTimer2eventEng_setEvent_V_write
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_pp0_stg0_fsm_0 = 1'b1;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv16_0 = 16'b0000000000000000;
parameter    ap_const_lv33_1000002EE = 33'b100000000000000000000001011101110;
parameter    ap_const_lv32_20 = 32'b100000;
parameter    ap_const_lv16_2710 = 16'b10011100010000;
parameter    ap_const_lv16_1 = 16'b1;
parameter    ap_const_lv16_FFFF = 16'b1111111111111111;
parameter    ap_const_lv32_FFFFFFFF = 32'b11111111111111111111111111111111;
parameter    ap_const_lv32_1F = 32'b11111;
parameter    ap_const_lv35_0 = 35'b00000000000000000000000000000000000;
parameter    ap_const_lv3_0 = 3'b000;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [15:0] rxEng2timer_clearProbeTimer_V_s_dout;
input   rxEng2timer_clearProbeTimer_V_s_empty_n;
output   rxEng2timer_clearProbeTimer_V_s_read;
input  [15:0] txEng2timer_setProbeTimer_V_V_dout;
input   txEng2timer_setProbeTimer_V_V_empty_n;
output   txEng2timer_setProbeTimer_V_V_read;
output  [53:0] probeTimer2eventEng_setEvent_V_din;
input   probeTimer2eventEng_setEvent_V_full_n;
output   probeTimer2eventEng_setEvent_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg rxEng2timer_clearProbeTimer_V_s_read;
reg txEng2timer_setProbeTimer_V_V_read;
reg probeTimer2eventEng_setEvent_V_write;
reg    ap_done_reg = 1'b0;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm = 1'b1;
reg    ap_sig_cseq_ST_pp0_stg0_fsm_0;
reg    ap_sig_bdd_20;
wire    ap_reg_ppiten_pp0_it0;
reg    ap_reg_ppiten_pp0_it1 = 1'b0;
reg    ap_reg_ppiten_pp0_it2 = 1'b0;
wire   [0:0] tmp_120_nbreadreq_fu_100_p3;
wire   [0:0] tmp_121_nbreadreq_fu_108_p3;
reg    ap_sig_bdd_67;
reg   [0:0] pt_WaitForWrite_load_reg_344;
reg   [0:0] ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1;
reg   [0:0] tmp_120_reg_348;
reg   [0:0] ap_reg_ppstg_tmp_120_reg_348_pp0_it1;
reg   [0:0] tmp_reg_371;
reg   [0:0] fastResume_reg_178;
reg   [0:0] tmp_167_reg_380;
wire   [0:0] tmp_122_nbwritereq_fu_128_p3;
reg    ap_sig_bdd_98;
reg   [0:0] pt_WaitForWrite = 1'b0;
reg   [15:0] pt_updSessionID_V = 16'b0000000000000000;
reg   [15:0] pt_prevSessionID_V = 16'b0000000000000000;
reg   [13:0] probeTimerTable_address0;
reg    probeTimerTable_ce0;
reg    probeTimerTable_we0;
wire   [32:0] probeTimerTable_d0;
wire   [32:0] probeTimerTable_q0;
wire   [13:0] probeTimerTable_address1;
reg    probeTimerTable_ce1;
reg    probeTimerTable_we1;
reg   [32:0] probeTimerTable_d1;
reg   [15:0] pt_currSessionID_V = 16'b0000000000000000;
reg   [15:0] tmp_sessionID_V_reg_167;
reg   [15:0] ap_reg_ppstg_tmp_sessionID_V_reg_167_pp0_it1;
reg   [13:0] probeTimerTable_addr_1_reg_355;
reg   [13:0] ap_reg_ppstg_probeTimerTable_addr_1_reg_355_pp0_it1;
wire   [0:0] tmp_s_fu_269_p2;
reg   [32:0] probeTimerTable_load_reg_365;
wire   [0:0] tmp_fu_298_p3;
wire   [31:0] tmp_488_fu_306_p1;
reg   [31:0] tmp_488_reg_375;
wire   [0:0] fastResume_phi_fu_183_p4;
wire   [0:0] tmp_167_fu_310_p2;
wire   [15:0] checkID_V_1_fu_231_p3;
wire   [15:0] ap_reg_phiprechg_tmp_sessionID_V_reg_167pp0_it0;
reg   [15:0] tmp_sessionID_V_phi_fu_170_p4;
wire   [0:0] ap_reg_phiprechg_fastResume_reg_178pp0_it0;
reg   [0:0] ap_reg_phiprechg_fastResume_reg_178pp0_it1;
wire   [63:0] tmp_166_fu_246_p1;
wire   [63:0] tmp_162_fu_275_p1;
wire   [15:0] tmp_163_fu_286_p2;
wire   [32:0] probeTimerTable_time_V_addr_s_fu_321_p5;
reg   [32:0] grp_fu_193_p4;
wire   [0:0] tmp_164_fu_219_p2;
wire   [15:0] tmp_165_fu_225_p2;
wire   [31:0] tmp_168_fu_316_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_sig_pprstidle_pp0;
reg    ap_sig_bdd_162;
reg    ap_sig_bdd_53;
reg    ap_sig_bdd_105;
reg    ap_sig_bdd_49;
reg    ap_sig_bdd_178;
reg    ap_sig_bdd_38;
reg    ap_sig_bdd_61;
reg    ap_sig_bdd_174;


toe_probe_timer_probeTimerTable #(
    .DataWidth( 33 ),
    .AddressRange( 10000 ),
    .AddressWidth( 14 ))
probeTimerTable_U(
    .clk( ap_clk ),
    .reset( ap_rst ),
    .address0( probeTimerTable_address0 ),
    .ce0( probeTimerTable_ce0 ),
    .we0( probeTimerTable_we0 ),
    .d0( probeTimerTable_d0 ),
    .q0( probeTimerTable_q0 ),
    .address1( probeTimerTable_address1 ),
    .ce1( probeTimerTable_ce1 ),
    .we1( probeTimerTable_we1 ),
    .d1( probeTimerTable_d1 )
);



/// the current state (ap_CS_fsm) of the state machine. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_CS_fsm
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_pp0_stg0_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

/// ap_done_reg assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_done_reg
    if (ap_rst == 1'b1) begin
        ap_done_reg <= ap_const_logic_0;
    end else begin
        if ((ap_const_logic_1 == ap_continue)) begin
            ap_done_reg <= ap_const_logic_0;
        end else if (((ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
            ap_done_reg <= ap_const_logic_1;
        end
    end
end

/// ap_reg_ppiten_pp0_it1 assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it1
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it1 <= ap_const_logic_0;
    end else begin
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
            ap_reg_ppiten_pp0_it1 <= ap_reg_ppiten_pp0_it0;
        end
    end
end

/// ap_reg_ppiten_pp0_it2 assign process. ///
always @ (posedge ap_clk)
begin : ap_ret_ap_reg_ppiten_pp0_it2
    if (ap_rst == 1'b1) begin
        ap_reg_ppiten_pp0_it2 <= ap_const_logic_0;
    end else begin
        if (~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) begin
            ap_reg_ppiten_pp0_it2 <= ap_reg_ppiten_pp0_it1;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_105) begin
        if (ap_sig_bdd_53) begin
            ap_reg_phiprechg_fastResume_reg_178pp0_it1 <= ap_const_lv1_1;
        end else if (ap_sig_bdd_162) begin
            ap_reg_phiprechg_fastResume_reg_178pp0_it1 <= ap_const_lv1_0;
        end else if ((ap_true == ap_true)) begin
            ap_reg_phiprechg_fastResume_reg_178pp0_it1 <= ap_reg_phiprechg_fastResume_reg_178pp0_it0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_105) begin
        if (ap_sig_bdd_178) begin
            pt_WaitForWrite <= ap_const_lv1_0;
        end else if (ap_sig_bdd_61) begin
            pt_WaitForWrite <= ap_const_lv1_1;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_105) begin
        if (~(pt_WaitForWrite == ap_const_lv1_0)) begin
            pt_prevSessionID_V <= tmp_163_fu_286_p2;
        end else if (ap_sig_bdd_49) begin
            pt_prevSessionID_V <= tmp_sessionID_V_phi_fu_170_p4;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_105) begin
        if (ap_sig_bdd_53) begin
            tmp_sessionID_V_reg_167 <= rxEng2timer_clearProbeTimer_V_s_dout;
        end else if (ap_sig_bdd_162) begin
            tmp_sessionID_V_reg_167 <= checkID_V_1_fu_231_p3;
        end else if ((ap_true == ap_true)) begin
            tmp_sessionID_V_reg_167 <= ap_reg_phiprechg_tmp_sessionID_V_reg_167pp0_it0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        ap_reg_ppstg_probeTimerTable_addr_1_reg_355_pp0_it1 <= probeTimerTable_addr_1_reg_355;
        ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1 <= pt_WaitForWrite_load_reg_344;
        ap_reg_ppstg_tmp_120_reg_348_pp0_it1 <= tmp_120_reg_348;
        ap_reg_ppstg_tmp_sessionID_V_reg_167_pp0_it1 <= tmp_sessionID_V_reg_167;
        pt_WaitForWrite_load_reg_344 <= pt_WaitForWrite;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        fastResume_reg_178 <= ap_reg_phiprechg_fastResume_reg_178pp0_it1;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (pt_WaitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_120_nbreadreq_fu_100_p3) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        probeTimerTable_addr_1_reg_355 <= tmp_166_fu_246_p1;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & (ap_const_lv1_0 == pt_WaitForWrite_load_reg_344) & (ap_const_lv1_0 == tmp_120_reg_348))) begin
        probeTimerTable_load_reg_365 <= probeTimerTable_q0;
        tmp_reg_371 <= probeTimerTable_q0[ap_const_lv32_20];
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (pt_WaitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_120_nbreadreq_fu_100_p3) & (ap_const_lv1_0 == tmp_121_nbreadreq_fu_108_p3) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        pt_currSessionID_V <= checkID_V_1_fu_231_p3;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (pt_WaitForWrite == ap_const_lv1_0) & ~(ap_const_lv1_0 == tmp_120_nbreadreq_fu_100_p3) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        pt_updSessionID_V <= txEng2timer_setProbeTimer_V_V_dout;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (pt_WaitForWrite == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        tmp_120_reg_348 <= tmp_120_nbreadreq_fu_100_p3;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & (ap_const_lv1_0 == pt_WaitForWrite_load_reg_344) & (ap_const_lv1_0 == tmp_120_reg_348) & ~(ap_const_lv1_0 == tmp_fu_298_p3) & (ap_const_lv1_0 == fastResume_phi_fu_183_p4))) begin
        tmp_167_reg_380 <= tmp_167_fu_310_p2;
        tmp_488_reg_375 <= tmp_488_fu_306_p1;
    end
end

/// ap_done assign process. ///
always @ (ap_done_reg or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_67 or ap_sig_bdd_98)
begin
    if (((ap_const_logic_1 == ap_done_reg) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))))) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

/// ap_idle assign process. ///
always @ (ap_start or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_reg_ppiten_pp0_it2)
begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it0) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it1) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it2))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

/// ap_ready assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_67 or ap_sig_bdd_98)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        ap_ready = ap_const_logic_1;
    end else begin
        ap_ready = ap_const_logic_0;
    end
end

/// ap_sig_cseq_ST_pp0_stg0_fsm_0 assign process. ///
always @ (ap_sig_bdd_20)
begin
    if (ap_sig_bdd_20) begin
        ap_sig_cseq_ST_pp0_stg0_fsm_0 = ap_const_logic_1;
    end else begin
        ap_sig_cseq_ST_pp0_stg0_fsm_0 = ap_const_logic_0;
    end
end

/// ap_sig_pprstidle_pp0 assign process. ///
always @ (ap_start or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1)
begin
    if (((ap_const_logic_0 == ap_reg_ppiten_pp0_it0) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it1) & (ap_const_logic_0 == ap_start))) begin
        ap_sig_pprstidle_pp0 = ap_const_logic_1;
    end else begin
        ap_sig_pprstidle_pp0 = ap_const_logic_0;
    end
end

/// probeTimer2eventEng_setEvent_V_write assign process. ///
always @ (ap_done_reg or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_67 or ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1 or ap_reg_ppstg_tmp_120_reg_348_pp0_it1 or tmp_reg_371 or fastResume_reg_178 or tmp_167_reg_380 or tmp_122_nbwritereq_fu_128_p3 or ap_sig_bdd_98)
begin
    if (((ap_const_lv1_0 == ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_120_reg_348_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_371) & (ap_const_lv1_0 == fastResume_reg_178) & ~(ap_const_lv1_0 == tmp_167_reg_380) & ~(ap_const_lv1_0 == tmp_122_nbwritereq_fu_128_p3) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        probeTimer2eventEng_setEvent_V_write = ap_const_logic_1;
    end else begin
        probeTimer2eventEng_setEvent_V_write = ap_const_logic_0;
    end
end

/// probeTimerTable_address0 assign process. ///
always @ (tmp_166_fu_246_p1 or tmp_162_fu_275_p1 or ap_sig_bdd_49 or ap_sig_bdd_178 or ap_sig_bdd_38)
begin
    if (ap_sig_bdd_38) begin
        if (ap_sig_bdd_178) begin
            probeTimerTable_address0 = tmp_162_fu_275_p1;
        end else if (ap_sig_bdd_49) begin
            probeTimerTable_address0 = tmp_166_fu_246_p1;
        end else begin
            probeTimerTable_address0 = 'bx;
        end
    end else begin
        probeTimerTable_address0 = 'bx;
    end
end

/// probeTimerTable_ce0 assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or tmp_120_nbreadreq_fu_100_p3 or ap_sig_bdd_67 or ap_sig_bdd_98 or pt_WaitForWrite or tmp_s_fu_269_p2)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(pt_WaitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_s_fu_269_p2)) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (pt_WaitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_120_nbreadreq_fu_100_p3) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))))) begin
        probeTimerTable_ce0 = ap_const_logic_1;
    end else begin
        probeTimerTable_ce0 = ap_const_logic_0;
    end
end

/// probeTimerTable_ce1 assign process. ///
always @ (ap_done_reg or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_67 or ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1 or ap_reg_ppstg_tmp_120_reg_348_pp0_it1 or tmp_reg_371 or fastResume_reg_178 or tmp_167_reg_380 or tmp_122_nbwritereq_fu_128_p3 or ap_sig_bdd_98)
begin
    if ((((ap_const_lv1_0 == ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_120_reg_348_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_371) & (ap_const_lv1_0 == fastResume_reg_178) & ~(ap_const_lv1_0 == tmp_167_reg_380) & ~(ap_const_lv1_0 == tmp_122_nbwritereq_fu_128_p3) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & (((ap_const_lv1_0 == ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_120_reg_348_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_371) & (ap_const_lv1_0 == fastResume_reg_178) & (ap_const_lv1_0 == tmp_167_reg_380)) | ((ap_const_lv1_0 == ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_120_reg_348_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_371) & (ap_const_lv1_0 == fastResume_reg_178) & (ap_const_lv1_0 == tmp_122_nbwritereq_fu_128_p3)))) | ((ap_const_lv1_0 == ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_120_reg_348_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_371) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(ap_const_lv1_0 == fastResume_reg_178)))) begin
        probeTimerTable_ce1 = ap_const_logic_1;
    end else begin
        probeTimerTable_ce1 = ap_const_logic_0;
    end
end

/// probeTimerTable_d1 assign process. ///
always @ (ap_reg_ppiten_pp0_it2 or ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1 or ap_reg_ppstg_tmp_120_reg_348_pp0_it1 or tmp_reg_371 or fastResume_reg_178 or tmp_167_reg_380 or tmp_122_nbwritereq_fu_128_p3 or probeTimerTable_time_V_addr_s_fu_321_p5 or grp_fu_193_p4)
begin
    if ((((ap_const_lv1_0 == ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_120_reg_348_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_371) & (ap_const_lv1_0 == fastResume_reg_178) & ~(ap_const_lv1_0 == tmp_167_reg_380) & ~(ap_const_lv1_0 == tmp_122_nbwritereq_fu_128_p3) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)) | ((ap_const_lv1_0 == ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_120_reg_348_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_371) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~(ap_const_lv1_0 == fastResume_reg_178)))) begin
        probeTimerTable_d1 = grp_fu_193_p4;
    end else if (((ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & (((ap_const_lv1_0 == ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_120_reg_348_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_371) & (ap_const_lv1_0 == fastResume_reg_178) & (ap_const_lv1_0 == tmp_167_reg_380)) | ((ap_const_lv1_0 == ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_120_reg_348_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_371) & (ap_const_lv1_0 == fastResume_reg_178) & (ap_const_lv1_0 == tmp_122_nbwritereq_fu_128_p3))))) begin
        probeTimerTable_d1 = probeTimerTable_time_V_addr_s_fu_321_p5;
    end else begin
        probeTimerTable_d1 = 'bx;
    end
end

/// probeTimerTable_we0 assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_67 or ap_sig_bdd_98 or pt_WaitForWrite or tmp_s_fu_269_p2)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(pt_WaitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_s_fu_269_p2))) begin
        probeTimerTable_we0 = ap_const_logic_1;
    end else begin
        probeTimerTable_we0 = ap_const_logic_0;
    end
end

/// probeTimerTable_we1 assign process. ///
always @ (ap_done_reg or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_67 or ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1 or ap_reg_ppstg_tmp_120_reg_348_pp0_it1 or tmp_reg_371 or fastResume_reg_178 or tmp_167_reg_380 or tmp_122_nbwritereq_fu_128_p3 or ap_sig_bdd_98)
begin
    if ((((ap_const_lv1_0 == ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_120_reg_348_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_371) & (ap_const_lv1_0 == fastResume_reg_178) & ~(ap_const_lv1_0 == tmp_167_reg_380) & ~(ap_const_lv1_0 == tmp_122_nbwritereq_fu_128_p3) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2)))) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & (((ap_const_lv1_0 == ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_120_reg_348_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_371) & (ap_const_lv1_0 == fastResume_reg_178) & (ap_const_lv1_0 == tmp_167_reg_380)) | ((ap_const_lv1_0 == ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_120_reg_348_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_371) & (ap_const_lv1_0 == fastResume_reg_178) & (ap_const_lv1_0 == tmp_122_nbwritereq_fu_128_p3)))) | ((ap_const_lv1_0 == ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_120_reg_348_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_371) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))) & ~(ap_const_lv1_0 == fastResume_reg_178)))) begin
        probeTimerTable_we1 = ap_const_logic_1;
    end else begin
        probeTimerTable_we1 = ap_const_logic_0;
    end
end

/// rxEng2timer_clearProbeTimer_V_s_read assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or tmp_120_nbreadreq_fu_100_p3 or tmp_121_nbreadreq_fu_108_p3 or ap_sig_bdd_67 or ap_sig_bdd_98 or pt_WaitForWrite)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (pt_WaitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_120_nbreadreq_fu_100_p3) & ~(ap_const_lv1_0 == tmp_121_nbreadreq_fu_108_p3) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        rxEng2timer_clearProbeTimer_V_s_read = ap_const_logic_1;
    end else begin
        rxEng2timer_clearProbeTimer_V_s_read = ap_const_logic_0;
    end
end

/// tmp_sessionID_V_phi_fu_170_p4 assign process. ///
always @ (rxEng2timer_clearProbeTimer_V_s_dout or tmp_121_nbreadreq_fu_108_p3 or checkID_V_1_fu_231_p3 or ap_reg_phiprechg_tmp_sessionID_V_reg_167pp0_it0 or ap_sig_bdd_174)
begin
    if (ap_sig_bdd_174) begin
        if (~(ap_const_lv1_0 == tmp_121_nbreadreq_fu_108_p3)) begin
            tmp_sessionID_V_phi_fu_170_p4 = rxEng2timer_clearProbeTimer_V_s_dout;
        end else if ((ap_const_lv1_0 == tmp_121_nbreadreq_fu_108_p3)) begin
            tmp_sessionID_V_phi_fu_170_p4 = checkID_V_1_fu_231_p3;
        end else begin
            tmp_sessionID_V_phi_fu_170_p4 = ap_reg_phiprechg_tmp_sessionID_V_reg_167pp0_it0;
        end
    end else begin
        tmp_sessionID_V_phi_fu_170_p4 = ap_reg_phiprechg_tmp_sessionID_V_reg_167pp0_it0;
    end
end

/// txEng2timer_setProbeTimer_V_V_read assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or tmp_120_nbreadreq_fu_100_p3 or ap_sig_bdd_67 or ap_sig_bdd_98 or pt_WaitForWrite)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (pt_WaitForWrite == ap_const_lv1_0) & ~(ap_const_lv1_0 == tmp_120_nbreadreq_fu_100_p3) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))))) begin
        txEng2timer_setProbeTimer_V_V_read = ap_const_logic_1;
    end else begin
        txEng2timer_setProbeTimer_V_V_read = ap_const_logic_0;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_done_reg or ap_CS_fsm or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_67 or ap_sig_bdd_98 or ap_sig_pprstidle_pp0)
begin
    case (ap_CS_fsm)
        ap_ST_pp0_stg0_fsm_0 : 
        begin
            ap_NS_fsm = ap_ST_pp0_stg0_fsm_0;
        end
        default : 
        begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_reg_phiprechg_fastResume_reg_178pp0_it0 = 'bx;
assign ap_reg_phiprechg_tmp_sessionID_V_reg_167pp0_it0 = 'bx;
assign ap_reg_ppiten_pp0_it0 = ap_start;

/// ap_sig_bdd_105 assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it2 or ap_sig_bdd_67 or ap_sig_bdd_98)
begin
    ap_sig_bdd_105 = ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_67) | (ap_sig_bdd_98 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it2))));
end

/// ap_sig_bdd_162 assign process. ///
always @ (tmp_120_nbreadreq_fu_100_p3 or tmp_121_nbreadreq_fu_108_p3 or pt_WaitForWrite)
begin
    ap_sig_bdd_162 = ((pt_WaitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_120_nbreadreq_fu_100_p3) & (ap_const_lv1_0 == tmp_121_nbreadreq_fu_108_p3));
end

/// ap_sig_bdd_174 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or tmp_120_nbreadreq_fu_100_p3 or pt_WaitForWrite)
begin
    ap_sig_bdd_174 = ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (pt_WaitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_120_nbreadreq_fu_100_p3));
end

/// ap_sig_bdd_178 assign process. ///
always @ (pt_WaitForWrite or tmp_s_fu_269_p2)
begin
    ap_sig_bdd_178 = (~(pt_WaitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_s_fu_269_p2));
end

/// ap_sig_bdd_20 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_20 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_38 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0)
begin
    ap_sig_bdd_38 = ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0));
end

/// ap_sig_bdd_49 assign process. ///
always @ (tmp_120_nbreadreq_fu_100_p3 or pt_WaitForWrite)
begin
    ap_sig_bdd_49 = ((pt_WaitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_120_nbreadreq_fu_100_p3));
end

/// ap_sig_bdd_53 assign process. ///
always @ (tmp_120_nbreadreq_fu_100_p3 or tmp_121_nbreadreq_fu_108_p3 or pt_WaitForWrite)
begin
    ap_sig_bdd_53 = ((pt_WaitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_120_nbreadreq_fu_100_p3) & ~(ap_const_lv1_0 == tmp_121_nbreadreq_fu_108_p3));
end

/// ap_sig_bdd_61 assign process. ///
always @ (tmp_120_nbreadreq_fu_100_p3 or pt_WaitForWrite)
begin
    ap_sig_bdd_61 = ((pt_WaitForWrite == ap_const_lv1_0) & ~(ap_const_lv1_0 == tmp_120_nbreadreq_fu_100_p3));
end

/// ap_sig_bdd_67 assign process. ///
always @ (ap_start or ap_done_reg or rxEng2timer_clearProbeTimer_V_s_empty_n or tmp_120_nbreadreq_fu_100_p3 or tmp_121_nbreadreq_fu_108_p3 or txEng2timer_setProbeTimer_V_V_empty_n or pt_WaitForWrite)
begin
    ap_sig_bdd_67 = (((rxEng2timer_clearProbeTimer_V_s_empty_n == ap_const_logic_0) & (pt_WaitForWrite == ap_const_lv1_0) & (ap_const_lv1_0 == tmp_120_nbreadreq_fu_100_p3) & ~(ap_const_lv1_0 == tmp_121_nbreadreq_fu_108_p3)) | ((pt_WaitForWrite == ap_const_lv1_0) & (txEng2timer_setProbeTimer_V_V_empty_n == ap_const_logic_0) & ~(ap_const_lv1_0 == tmp_120_nbreadreq_fu_100_p3)) | (ap_start == ap_const_logic_0) | (ap_done_reg == ap_const_logic_1));
end

/// ap_sig_bdd_98 assign process. ///
always @ (probeTimer2eventEng_setEvent_V_full_n or ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1 or ap_reg_ppstg_tmp_120_reg_348_pp0_it1 or tmp_reg_371 or fastResume_reg_178 or tmp_167_reg_380 or tmp_122_nbwritereq_fu_128_p3)
begin
    ap_sig_bdd_98 = ((probeTimer2eventEng_setEvent_V_full_n == ap_const_logic_0) & (ap_const_lv1_0 == ap_reg_ppstg_pt_WaitForWrite_load_reg_344_pp0_it1) & (ap_const_lv1_0 == ap_reg_ppstg_tmp_120_reg_348_pp0_it1) & ~(ap_const_lv1_0 == tmp_reg_371) & (ap_const_lv1_0 == fastResume_reg_178) & ~(ap_const_lv1_0 == tmp_167_reg_380) & ~(ap_const_lv1_0 == tmp_122_nbwritereq_fu_128_p3));
end
assign checkID_V_1_fu_231_p3 = ((tmp_164_fu_219_p2[0:0]===1'b1)? ap_const_lv16_0: tmp_165_fu_225_p2);
assign fastResume_phi_fu_183_p4 = ap_reg_phiprechg_fastResume_reg_178pp0_it1;

always @ (probeTimerTable_load_reg_365) begin
    grp_fu_193_p4 = probeTimerTable_load_reg_365;
    grp_fu_193_p4[ap_const_lv32_20] = ap_const_lv1_0[0];
end


assign probeTimer2eventEng_setEvent_V_din = {{{{ap_const_lv35_0}, {ap_reg_ppstg_tmp_sessionID_V_reg_167_pp0_it1}}}, {ap_const_lv3_0}};
assign probeTimerTable_address1 = ap_reg_ppstg_probeTimerTable_addr_1_reg_355_pp0_it1;
assign probeTimerTable_d0 = ap_const_lv33_1000002EE;
assign probeTimerTable_time_V_addr_s_fu_321_p5 = {{probeTimerTable_load_reg_365[32'd32 : 32'd32]}, {tmp_168_fu_316_p2}};
assign tmp_120_nbreadreq_fu_100_p3 = txEng2timer_setProbeTimer_V_V_empty_n;
assign tmp_121_nbreadreq_fu_108_p3 = rxEng2timer_clearProbeTimer_V_s_empty_n;
assign tmp_122_nbwritereq_fu_128_p3 = probeTimer2eventEng_setEvent_V_full_n;
assign tmp_162_fu_275_p1 = pt_updSessionID_V;
assign tmp_163_fu_286_p2 = ($signed(pt_prevSessionID_V) + $signed(ap_const_lv16_FFFF));
assign tmp_164_fu_219_p2 = (pt_currSessionID_V == ap_const_lv16_2710? 1'b1: 1'b0);
assign tmp_165_fu_225_p2 = (pt_currSessionID_V + ap_const_lv16_1);
assign tmp_166_fu_246_p1 = tmp_sessionID_V_phi_fu_170_p4;
assign tmp_167_fu_310_p2 = (tmp_488_fu_306_p1 == ap_const_lv32_0? 1'b1: 1'b0);
assign tmp_168_fu_316_p2 = ($signed(tmp_488_reg_375) + $signed(ap_const_lv32_FFFFFFFF));
assign tmp_488_fu_306_p1 = probeTimerTable_q0[31:0];
assign tmp_fu_298_p3 = probeTimerTable_q0[ap_const_lv32_20];
assign tmp_s_fu_269_p2 = (pt_updSessionID_V == pt_prevSessionID_V? 1'b1: 1'b0);


endmodule //toe_probe_timer
