// This program was cloned from: https://github.com/mustafabbas/ECE1373_2016_hft_on_fpga
// License: MIT License

// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2015.1
// Copyright (C) 2015 Xilinx Inc. All rights reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module toe_txAppStatusHandler (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        txBufferWriteStatus_V_dout,
        txBufferWriteStatus_V_empty_n,
        txBufferWriteStatus_V_read,
        txApp_eventCache_V_dout,
        txApp_eventCache_V_empty_n,
        txApp_eventCache_V_read,
        txApp2txSar_push_V_din,
        txApp2txSar_push_V_full_n,
        txApp2txSar_push_V_write,
        txApp2eventEng_setEvent_V_din,
        txApp2eventEng_setEvent_V_full_n,
        txApp2eventEng_setEvent_V_write
);

parameter    ap_const_logic_1 = 1'b1;
parameter    ap_const_logic_0 = 1'b0;
parameter    ap_ST_pp0_stg0_fsm_0 = 1'b1;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv1_1 = 1'b1;
parameter    ap_const_lv2_2 = 2'b10;
parameter    ap_const_lv1_0 = 1'b0;
parameter    ap_const_lv2_1 = 2'b1;
parameter    ap_const_lv2_0 = 2'b00;
parameter    ap_const_lv3_0 = 3'b000;
parameter    ap_const_lv32_7 = 32'b111;
parameter    ap_const_lv17_10001 = 17'b10000000000000001;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_12 = 32'b10010;
parameter    ap_const_lv32_13 = 32'b10011;
parameter    ap_const_lv32_22 = 32'b100010;
parameter    ap_const_lv32_23 = 32'b100011;
parameter    ap_const_lv32_32 = 32'b110010;
parameter    ap_const_lv32_33 = 32'b110011;
parameter    ap_const_lv32_35 = 32'b110101;
parameter    ap_true = 1'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [7:0] txBufferWriteStatus_V_dout;
input   txBufferWriteStatus_V_empty_n;
output   txBufferWriteStatus_V_read;
input  [53:0] txApp_eventCache_V_dout;
input   txApp_eventCache_V_empty_n;
output   txApp_eventCache_V_read;
output  [31:0] txApp2txSar_push_V_din;
input   txApp2txSar_push_V_full_n;
output   txApp2txSar_push_V_write;
output  [53:0] txApp2eventEng_setEvent_V_din;
input   txApp2eventEng_setEvent_V_full_n;
output   txApp2eventEng_setEvent_V_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg txBufferWriteStatus_V_read;
reg txApp_eventCache_V_read;
reg[31:0] txApp2txSar_push_V_din;
reg txApp2txSar_push_V_write;
reg[53:0] txApp2eventEng_setEvent_V_din;
reg txApp2eventEng_setEvent_V_write;
reg    ap_done_reg = 1'b0;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm = 1'b1;
reg    ap_sig_cseq_ST_pp0_stg0_fsm_0;
reg    ap_sig_bdd_20;
wire    ap_reg_ppiten_pp0_it0;
reg    ap_reg_ppiten_pp0_it1 = 1'b0;
wire   [0:0] grp_nbreadreq_fu_158_p3;
wire   [0:0] tmp_nbreadreq_fu_172_p3;
reg    ap_sig_bdd_71;
reg   [1:0] tash_state_V_load_reg_410;
reg   [0:0] tmp_155_reg_428;
reg   [0:0] tmp_512_reg_432;
reg   [0:0] tmp_154_reg_436;
reg   [0:0] tmp_53_reg_440;
reg   [0:0] tmp_513_reg_444;
reg   [0:0] tmp_reg_453;
reg   [0:0] tmp_s_reg_477;
reg    ap_sig_bdd_123;
reg   [1:0] tash_state_V = 2'b00;
reg   [2:0] ev_type = 3'b000;
reg   [15:0] ev_sessionID_V = 16'b0000000000000000;
reg   [15:0] ev_address_V = 16'b0000000000000000;
reg   [15:0] ev_length_V = 16'b0000000000000000;
reg   [2:0] ev_rt_count_V = 3'b000;
reg   [15:0] tmp_address_V_4_reg_414;
reg   [15:0] tmp_length_V_8_reg_421;
wire   [0:0] grp_fu_212_p3;
wire   [0:0] tmp_53_fu_252_p2;
wire   [15:0] tmp_app_V_1_fu_258_p1;
reg   [15:0] tmp_app_V_1_reg_448;
reg   [53:0] tmp1_reg_457;
wire   [2:0] tmp_type_fu_268_p1;
reg   [2:0] tmp_type_reg_462;
reg   [15:0] tmp_sessionID_V_reg_467;
reg   [2:0] tmp_rt_count_V_reg_472;
wire   [0:0] tmp_s_fu_324_p2;
wire   [1:0] ap_reg_phiprechg_storemerge_reg_200pp0_it0;
reg   [1:0] storemerge_phi_fu_203_p4;
wire   [31:0] tmp_6_fu_352_p3;
wire   [31:0] tmp_3_fu_374_p3;
wire   [53:0] tmp_7_fu_361_p6;
wire   [53:0] tmp_4_fu_382_p6;
wire   [16:0] rhs_V_fu_242_p1;
wire   [16:0] lhs_V_fu_238_p1;
wire   [16:0] r_V_fu_246_p2;
wire   [15:0] tmp_app_V_fu_348_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_sig_pprstidle_pp0;
reg    ap_sig_bdd_316;
reg    ap_sig_bdd_48;
reg    ap_sig_bdd_52;
reg    ap_sig_bdd_203;
reg    ap_sig_bdd_130;
reg    ap_sig_bdd_88;
reg    ap_sig_bdd_108;
reg    ap_sig_bdd_118;
reg    ap_sig_bdd_190;




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
        end else if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
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
        if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
            ap_reg_ppiten_pp0_it1 <= ap_reg_ppiten_pp0_it0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (ap_sig_bdd_130) begin
        if (ap_sig_bdd_203) begin
            tash_state_V <= ap_const_lv2_1;
        end else if (ap_sig_bdd_52) begin
            tash_state_V <= storemerge_phi_fu_203_p4;
        end else if (ap_sig_bdd_48) begin
            tash_state_V <= ap_const_lv2_0;
        end
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (tash_state_V == ap_const_lv2_0) & ~(ap_const_lv1_0 == tmp_nbreadreq_fu_172_p3) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        ev_address_V <= {{txApp_eventCache_V_dout[ap_const_lv32_22 : ap_const_lv32_13]}};
        ev_length_V <= {{txApp_eventCache_V_dout[ap_const_lv32_32 : ap_const_lv32_23]}};
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_lv2_0 == tash_state_V_load_reg_410) & ~(ap_const_lv1_0 == tmp_reg_453) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        ev_rt_count_V <= tmp_rt_count_V_reg_472;
        ev_sessionID_V <= tmp_sessionID_V_reg_467;
        ev_type <= tmp_type_reg_462;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        tash_state_V_load_reg_410 <= tash_state_V;
        tmp_address_V_4_reg_414 <= ev_address_V;
        tmp_length_V_8_reg_421 <= ev_length_V;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (tash_state_V == ap_const_lv2_0) & ~(ap_const_lv1_0 == tmp_nbreadreq_fu_172_p3) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        tmp1_reg_457 <= txApp_eventCache_V_dout;
        tmp_rt_count_V_reg_472 <= {{txApp_eventCache_V_dout[ap_const_lv32_35 : ap_const_lv32_33]}};
        tmp_s_reg_477 <= tmp_s_fu_324_p2;
        tmp_sessionID_V_reg_467 <= {{txApp_eventCache_V_dout[ap_const_lv32_12 : ap_const_lv32_3]}};
        tmp_type_reg_462 <= tmp_type_fu_268_p1;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (tash_state_V == ap_const_lv2_1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        tmp_154_reg_436 <= grp_nbreadreq_fu_158_p3;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (tash_state_V == ap_const_lv2_2) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        tmp_155_reg_428 <= grp_nbreadreq_fu_158_p3;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (tash_state_V == ap_const_lv2_2) & ~(grp_nbreadreq_fu_158_p3 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        tmp_512_reg_432 <= txBufferWriteStatus_V_dout[ap_const_lv32_7];
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~(grp_nbreadreq_fu_158_p3 == ap_const_lv1_0) & (tash_state_V == ap_const_lv2_1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & ~(ap_const_lv1_0 == tmp_53_fu_252_p2))) begin
        tmp_513_reg_444 <= txBufferWriteStatus_V_dout[ap_const_lv32_7];
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~(grp_nbreadreq_fu_158_p3 == ap_const_lv1_0) & (tash_state_V == ap_const_lv2_1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        tmp_53_reg_440 <= tmp_53_fu_252_p2;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & ~(grp_nbreadreq_fu_158_p3 == ap_const_lv1_0) & (tash_state_V == ap_const_lv2_1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))) & ~(ap_const_lv1_0 == tmp_53_fu_252_p2) & ~(ap_const_lv1_0 == grp_fu_212_p3))) begin
        tmp_app_V_1_reg_448 <= tmp_app_V_1_fu_258_p1;
    end
end

/// assign process. ///
always @(posedge ap_clk)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (tash_state_V == ap_const_lv2_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        tmp_reg_453 <= tmp_nbreadreq_fu_172_p3;
    end
end

/// ap_done assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_71 or ap_sig_bdd_123)
begin
    if (((ap_const_logic_1 == ap_done_reg) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))))) begin
        ap_done = ap_const_logic_1;
    end else begin
        ap_done = ap_const_logic_0;
    end
end

/// ap_idle assign process. ///
always @ (ap_start or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1)
begin
    if ((~(ap_const_logic_1 == ap_start) & (ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it0) & (ap_const_logic_0 == ap_reg_ppiten_pp0_it1))) begin
        ap_idle = ap_const_logic_1;
    end else begin
        ap_idle = ap_const_logic_0;
    end
end

/// ap_ready assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_71 or ap_sig_bdd_123)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
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
always @ (ap_start or ap_reg_ppiten_pp0_it0)
begin
    if (((ap_const_logic_0 == ap_reg_ppiten_pp0_it0) & (ap_const_logic_0 == ap_start))) begin
        ap_sig_pprstidle_pp0 = ap_const_logic_1;
    end else begin
        ap_sig_pprstidle_pp0 = ap_const_logic_0;
    end
end

/// storemerge_phi_fu_203_p4 assign process. ///
always @ (tmp_53_fu_252_p2 or ap_reg_phiprechg_storemerge_reg_200pp0_it0 or ap_sig_bdd_316)
begin
    if (ap_sig_bdd_316) begin
        if (~(ap_const_lv1_0 == tmp_53_fu_252_p2)) begin
            storemerge_phi_fu_203_p4 = ap_const_lv2_0;
        end else if ((ap_const_lv1_0 == tmp_53_fu_252_p2)) begin
            storemerge_phi_fu_203_p4 = ap_const_lv2_2;
        end else begin
            storemerge_phi_fu_203_p4 = ap_reg_phiprechg_storemerge_reg_200pp0_it0;
        end
    end else begin
        storemerge_phi_fu_203_p4 = ap_reg_phiprechg_storemerge_reg_200pp0_it0;
    end
end

/// txApp2eventEng_setEvent_V_din assign process. ///
always @ (tmp1_reg_457 or tmp_7_fu_361_p6 or tmp_4_fu_382_p6 or ap_sig_bdd_88 or ap_sig_bdd_108 or ap_sig_bdd_118 or ap_sig_bdd_190)
begin
    if (ap_sig_bdd_190) begin
        if (ap_sig_bdd_118) begin
            txApp2eventEng_setEvent_V_din = tmp1_reg_457;
        end else if (ap_sig_bdd_108) begin
            txApp2eventEng_setEvent_V_din = tmp_4_fu_382_p6;
        end else if (ap_sig_bdd_88) begin
            txApp2eventEng_setEvent_V_din = tmp_7_fu_361_p6;
        end else begin
            txApp2eventEng_setEvent_V_din = 'bx;
        end
    end else begin
        txApp2eventEng_setEvent_V_din = 'bx;
    end
end

/// txApp2eventEng_setEvent_V_write assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_71 or tash_state_V_load_reg_410 or tmp_155_reg_428 or tmp_512_reg_432 or tmp_154_reg_436 or tmp_53_reg_440 or tmp_513_reg_444 or tmp_reg_453 or tmp_s_reg_477 or ap_sig_bdd_123)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_lv2_2 == tash_state_V_load_reg_410) & ~(ap_const_lv1_0 == tmp_155_reg_428) & ~(ap_const_lv1_0 == tmp_512_reg_432) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_lv2_1 == tash_state_V_load_reg_410) & ~(ap_const_lv1_0 == tmp_154_reg_436) & ~(ap_const_lv1_0 == tmp_53_reg_440) & ~(ap_const_lv1_0 == tmp_513_reg_444) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_lv2_0 == tash_state_V_load_reg_410) & ~(ap_const_lv1_0 == tmp_reg_453) & (ap_const_lv1_0 == tmp_s_reg_477) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))))) begin
        txApp2eventEng_setEvent_V_write = ap_const_logic_1;
    end else begin
        txApp2eventEng_setEvent_V_write = ap_const_logic_0;
    end
end

/// txApp2txSar_push_V_din assign process. ///
always @ (tmp_6_fu_352_p3 or tmp_3_fu_374_p3 or ap_sig_bdd_88 or ap_sig_bdd_108 or ap_sig_bdd_190)
begin
    if (ap_sig_bdd_190) begin
        if (ap_sig_bdd_108) begin
            txApp2txSar_push_V_din = tmp_3_fu_374_p3;
        end else if (ap_sig_bdd_88) begin
            txApp2txSar_push_V_din = tmp_6_fu_352_p3;
        end else begin
            txApp2txSar_push_V_din = 'bx;
        end
    end else begin
        txApp2txSar_push_V_din = 'bx;
    end
end

/// txApp2txSar_push_V_write assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_71 or tash_state_V_load_reg_410 or tmp_155_reg_428 or tmp_512_reg_432 or tmp_154_reg_436 or tmp_53_reg_440 or tmp_513_reg_444 or ap_sig_bdd_123)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_lv2_2 == tash_state_V_load_reg_410) & ~(ap_const_lv1_0 == tmp_155_reg_428) & ~(ap_const_lv1_0 == tmp_512_reg_432) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_lv2_1 == tash_state_V_load_reg_410) & ~(ap_const_lv1_0 == tmp_154_reg_436) & ~(ap_const_lv1_0 == tmp_53_reg_440) & ~(ap_const_lv1_0 == tmp_513_reg_444) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))))) begin
        txApp2txSar_push_V_write = ap_const_logic_1;
    end else begin
        txApp2txSar_push_V_write = ap_const_logic_0;
    end
end

/// txApp_eventCache_V_read assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or tmp_nbreadreq_fu_172_p3 or ap_sig_bdd_71 or ap_sig_bdd_123 or tash_state_V)
begin
    if (((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (tash_state_V == ap_const_lv2_0) & ~(ap_const_lv1_0 == tmp_nbreadreq_fu_172_p3) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))))) begin
        txApp_eventCache_V_read = ap_const_logic_1;
    end else begin
        txApp_eventCache_V_read = ap_const_logic_0;
    end
end

/// txBufferWriteStatus_V_read assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or grp_nbreadreq_fu_158_p3 or ap_sig_bdd_71 or ap_sig_bdd_123 or tash_state_V)
begin
    if ((((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & (tash_state_V == ap_const_lv2_2) & ~(grp_nbreadreq_fu_158_p3 == ap_const_lv1_0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))) | ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(grp_nbreadreq_fu_158_p3 == ap_const_lv1_0) & (tash_state_V == ap_const_lv2_1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1)))))) begin
        txBufferWriteStatus_V_read = ap_const_logic_1;
    end else begin
        txBufferWriteStatus_V_read = ap_const_logic_0;
    end
end
/// the next state (ap_NS_fsm) of the state machine. ///
always @ (ap_done_reg or ap_CS_fsm or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_71 or ap_sig_bdd_123 or ap_sig_pprstidle_pp0)
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

assign ap_reg_phiprechg_storemerge_reg_200pp0_it0 = 'bx;
assign ap_reg_ppiten_pp0_it0 = ap_start;

/// ap_sig_bdd_108 assign process. ///
always @ (tash_state_V_load_reg_410 or tmp_154_reg_436 or tmp_53_reg_440 or tmp_513_reg_444)
begin
    ap_sig_bdd_108 = ((ap_const_lv2_1 == tash_state_V_load_reg_410) & ~(ap_const_lv1_0 == tmp_154_reg_436) & ~(ap_const_lv1_0 == tmp_53_reg_440) & ~(ap_const_lv1_0 == tmp_513_reg_444));
end

/// ap_sig_bdd_118 assign process. ///
always @ (tash_state_V_load_reg_410 or tmp_reg_453 or tmp_s_reg_477)
begin
    ap_sig_bdd_118 = ((ap_const_lv2_0 == tash_state_V_load_reg_410) & ~(ap_const_lv1_0 == tmp_reg_453) & (ap_const_lv1_0 == tmp_s_reg_477));
end

/// ap_sig_bdd_123 assign process. ///
always @ (txApp2txSar_push_V_full_n or tash_state_V_load_reg_410 or tmp_155_reg_428 or tmp_512_reg_432 or txApp2eventEng_setEvent_V_full_n or tmp_154_reg_436 or tmp_53_reg_440 or tmp_513_reg_444 or tmp_reg_453 or tmp_s_reg_477)
begin
    ap_sig_bdd_123 = (((txApp2txSar_push_V_full_n == ap_const_logic_0) & (ap_const_lv2_2 == tash_state_V_load_reg_410) & ~(ap_const_lv1_0 == tmp_155_reg_428) & ~(ap_const_lv1_0 == tmp_512_reg_432)) | ((ap_const_lv2_2 == tash_state_V_load_reg_410) & ~(ap_const_lv1_0 == tmp_155_reg_428) & ~(ap_const_lv1_0 == tmp_512_reg_432) & (txApp2eventEng_setEvent_V_full_n == ap_const_logic_0)) | ((txApp2txSar_push_V_full_n == ap_const_logic_0) & (ap_const_lv2_1 == tash_state_V_load_reg_410) & ~(ap_const_lv1_0 == tmp_154_reg_436) & ~(ap_const_lv1_0 == tmp_53_reg_440) & ~(ap_const_lv1_0 == tmp_513_reg_444)) | ((txApp2eventEng_setEvent_V_full_n == ap_const_logic_0) & (ap_const_lv2_1 == tash_state_V_load_reg_410) & ~(ap_const_lv1_0 == tmp_154_reg_436) & ~(ap_const_lv1_0 == tmp_53_reg_440) & ~(ap_const_lv1_0 == tmp_513_reg_444)) | ((txApp2eventEng_setEvent_V_full_n == ap_const_logic_0) & (ap_const_lv2_0 == tash_state_V_load_reg_410) & ~(ap_const_lv1_0 == tmp_reg_453) & (ap_const_lv1_0 == tmp_s_reg_477)));
end

/// ap_sig_bdd_130 assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_71 or ap_sig_bdd_123)
begin
    ap_sig_bdd_130 = ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))));
end

/// ap_sig_bdd_190 assign process. ///
always @ (ap_done_reg or ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or ap_reg_ppiten_pp0_it1 or ap_sig_bdd_71 or ap_sig_bdd_123)
begin
    ap_sig_bdd_190 = ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1) & ~((ap_done_reg == ap_const_logic_1) | ((ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ap_sig_bdd_71) | (ap_sig_bdd_123 & (ap_const_logic_1 == ap_reg_ppiten_pp0_it1))));
end

/// ap_sig_bdd_20 assign process. ///
always @ (ap_CS_fsm)
begin
    ap_sig_bdd_20 = (ap_CS_fsm[ap_const_lv32_0] == ap_const_lv1_1);
end

/// ap_sig_bdd_203 assign process. ///
always @ (tmp_nbreadreq_fu_172_p3 or tash_state_V or tmp_s_fu_324_p2)
begin
    ap_sig_bdd_203 = ((tash_state_V == ap_const_lv2_0) & ~(ap_const_lv1_0 == tmp_nbreadreq_fu_172_p3) & ~(ap_const_lv1_0 == tmp_s_fu_324_p2));
end

/// ap_sig_bdd_316 assign process. ///
always @ (ap_sig_cseq_ST_pp0_stg0_fsm_0 or ap_reg_ppiten_pp0_it0 or grp_nbreadreq_fu_158_p3 or tash_state_V)
begin
    ap_sig_bdd_316 = ((ap_const_logic_1 == ap_sig_cseq_ST_pp0_stg0_fsm_0) & (ap_const_logic_1 == ap_reg_ppiten_pp0_it0) & ~(grp_nbreadreq_fu_158_p3 == ap_const_lv1_0) & (tash_state_V == ap_const_lv2_1));
end

/// ap_sig_bdd_48 assign process. ///
always @ (grp_nbreadreq_fu_158_p3 or tash_state_V)
begin
    ap_sig_bdd_48 = ((tash_state_V == ap_const_lv2_2) & ~(grp_nbreadreq_fu_158_p3 == ap_const_lv1_0));
end

/// ap_sig_bdd_52 assign process. ///
always @ (grp_nbreadreq_fu_158_p3 or tash_state_V)
begin
    ap_sig_bdd_52 = (~(grp_nbreadreq_fu_158_p3 == ap_const_lv1_0) & (tash_state_V == ap_const_lv2_1));
end

/// ap_sig_bdd_71 assign process. ///
always @ (ap_start or ap_done_reg or txBufferWriteStatus_V_empty_n or grp_nbreadreq_fu_158_p3 or txApp_eventCache_V_empty_n or tmp_nbreadreq_fu_172_p3 or tash_state_V)
begin
    ap_sig_bdd_71 = (((txBufferWriteStatus_V_empty_n == ap_const_logic_0) & (tash_state_V == ap_const_lv2_2) & ~(grp_nbreadreq_fu_158_p3 == ap_const_lv1_0)) | ((txBufferWriteStatus_V_empty_n == ap_const_logic_0) & ~(grp_nbreadreq_fu_158_p3 == ap_const_lv1_0) & (tash_state_V == ap_const_lv2_1)) | ((txApp_eventCache_V_empty_n == ap_const_logic_0) & (tash_state_V == ap_const_lv2_0) & ~(ap_const_lv1_0 == tmp_nbreadreq_fu_172_p3)) | (ap_start == ap_const_logic_0) | (ap_done_reg == ap_const_logic_1));
end

/// ap_sig_bdd_88 assign process. ///
always @ (tash_state_V_load_reg_410 or tmp_155_reg_428 or tmp_512_reg_432)
begin
    ap_sig_bdd_88 = ((ap_const_lv2_2 == tash_state_V_load_reg_410) & ~(ap_const_lv1_0 == tmp_155_reg_428) & ~(ap_const_lv1_0 == tmp_512_reg_432));
end
assign grp_fu_212_p3 = txBufferWriteStatus_V_dout[ap_const_lv32_7];
assign grp_nbreadreq_fu_158_p3 = txBufferWriteStatus_V_empty_n;
assign lhs_V_fu_238_p1 = ev_address_V;
assign r_V_fu_246_p2 = (rhs_V_fu_242_p1 + lhs_V_fu_238_p1);
assign rhs_V_fu_242_p1 = ev_length_V;
assign tmp_3_fu_374_p3 = {{tmp_app_V_1_reg_448}, {ev_sessionID_V}};
assign tmp_4_fu_382_p6 = {{{{{ev_rt_count_V}, {tmp_length_V_8_reg_421}}, {tmp_address_V_4_reg_414}}, {ev_sessionID_V}}, {ev_type}};
assign tmp_53_fu_252_p2 = (r_V_fu_246_p2 < ap_const_lv17_10001? 1'b1: 1'b0);
assign tmp_6_fu_352_p3 = {{tmp_app_V_fu_348_p2}, {ev_sessionID_V}};
assign tmp_7_fu_361_p6 = {{{{{ev_rt_count_V}, {tmp_length_V_8_reg_421}}, {tmp_address_V_4_reg_414}}, {ev_sessionID_V}}, {ev_type}};
assign tmp_app_V_1_fu_258_p1 = r_V_fu_246_p2[15:0];
assign tmp_app_V_fu_348_p2 = (tmp_length_V_8_reg_421 + tmp_address_V_4_reg_414);
assign tmp_nbreadreq_fu_172_p3 = txApp_eventCache_V_empty_n;
assign tmp_s_fu_324_p2 = (tmp_type_fu_268_p1 == ap_const_lv3_0? 1'b1: 1'b0);
assign tmp_type_fu_268_p1 = txApp_eventCache_V_dout[2:0];


endmodule //toe_txAppStatusHandler

