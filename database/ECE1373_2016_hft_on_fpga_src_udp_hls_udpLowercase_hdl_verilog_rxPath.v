// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.3
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module rxPath (
        ap_clk,
        ap_rst,
        ap_start,
        start_full_n,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        start_out,
        start_write,
        lbRxDataIn_V_data_V_dout,
        lbRxDataIn_V_data_V_empty_n,
        lbRxDataIn_V_data_V_read,
        lbRxDataIn_V_keep_V_dout,
        lbRxDataIn_V_keep_V_empty_n,
        lbRxDataIn_V_keep_V_read,
        lbRxDataIn_V_last_V_dout,
        lbRxDataIn_V_last_V_empty_n,
        lbRxDataIn_V_last_V_read,
        lbRxMetadataIn_V_dout,
        lbRxMetadataIn_V_empty_n,
        lbRxMetadataIn_V_read,
        lbRequestPortOpenOut_din,
        lbRequestPortOpenOut_full_n,
        lbRequestPortOpenOut_write,
        lbPortOpenReplyIn_V_dout,
        lbPortOpenReplyIn_V_empty_n,
        lbPortOpenReplyIn_V_read,
        lb_packetBuffer_V_din,
        lb_packetBuffer_V_full_n,
        lb_packetBuffer_V_write,
        lb_metadataBuffer_V_s_din,
        lb_metadataBuffer_V_s_full_n,
        lb_metadataBuffer_V_s_write,
        lb_metadataBuffer_V_4_din,
        lb_metadataBuffer_V_4_full_n,
        lb_metadataBuffer_V_4_write,
        lb_metadataBuffer_V_3_din,
        lb_metadataBuffer_V_3_full_n,
        lb_metadataBuffer_V_3_write,
        lb_metadataBuffer_V_1_din,
        lb_metadataBuffer_V_1_full_n,
        lb_metadataBuffer_V_1_write,
        lb_lengthBuffer_V_V_din,
        lb_lengthBuffer_V_V_full_n,
        lb_lengthBuffer_V_V_write
);

parameter    ap_ST_fsm_state1 = 1'b1;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv2_0 = 2'b00;
parameter    ap_const_lv16_0 = 16'b0000000000000000;
parameter    ap_const_lv2_2 = 2'b10;
parameter    ap_const_lv2_3 = 2'b11;
parameter    ap_const_lv2_1 = 2'b1;
parameter    ap_const_lv16_282 = 16'b1010000010;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv32_6 = 32'b110;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv3_1 = 3'b1;
parameter    ap_const_lv32_7 = 32'b111;
parameter    ap_const_lv4_1 = 4'b1;
parameter    ap_const_lv32_10 = 32'b10000;
parameter    ap_const_lv32_2F = 32'b101111;
parameter    ap_const_lv32_30 = 32'b110000;
parameter    ap_const_lv32_3F = 32'b111111;
parameter    ap_const_lv32_40 = 32'b1000000;
parameter    ap_const_lv32_5F = 32'b1011111;
parameter    ap_const_lv32_FFFFFFFF = 32'b11111111111111111111111111111111;

input   ap_clk;
input   ap_rst;
input   ap_start;
input   start_full_n;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
output   start_out;
output   start_write;
input  [63:0] lbRxDataIn_V_data_V_dout;
input   lbRxDataIn_V_data_V_empty_n;
output   lbRxDataIn_V_data_V_read;
input  [7:0] lbRxDataIn_V_keep_V_dout;
input   lbRxDataIn_V_keep_V_empty_n;
output   lbRxDataIn_V_keep_V_read;
input  [0:0] lbRxDataIn_V_last_V_dout;
input   lbRxDataIn_V_last_V_empty_n;
output   lbRxDataIn_V_last_V_read;
input  [95:0] lbRxMetadataIn_V_dout;
input   lbRxMetadataIn_V_empty_n;
output   lbRxMetadataIn_V_read;
output  [15:0] lbRequestPortOpenOut_din;
input   lbRequestPortOpenOut_full_n;
output   lbRequestPortOpenOut_write;
input   lbPortOpenReplyIn_V_dout;
input   lbPortOpenReplyIn_V_empty_n;
output   lbPortOpenReplyIn_V_read;
output  [72:0] lb_packetBuffer_V_din;
input   lb_packetBuffer_V_full_n;
output   lb_packetBuffer_V_write;
output  [15:0] lb_metadataBuffer_V_s_din;
input   lb_metadataBuffer_V_s_full_n;
output   lb_metadataBuffer_V_s_write;
output  [31:0] lb_metadataBuffer_V_4_din;
input   lb_metadataBuffer_V_4_full_n;
output   lb_metadataBuffer_V_4_write;
output  [15:0] lb_metadataBuffer_V_3_din;
input   lb_metadataBuffer_V_3_full_n;
output   lb_metadataBuffer_V_3_write;
output  [31:0] lb_metadataBuffer_V_1_din;
input   lb_metadataBuffer_V_1_full_n;
output   lb_metadataBuffer_V_1_write;
output  [15:0] lb_lengthBuffer_V_V_din;
input   lb_lengthBuffer_V_V_full_n;
output   lb_lengthBuffer_V_V_write;

reg ap_done;
reg ap_idle;
reg start_write;
reg lbRxMetadataIn_V_read;
reg lbRequestPortOpenOut_write;
reg lbPortOpenReplyIn_V_read;
reg[72:0] lb_packetBuffer_V_din;
reg lb_packetBuffer_V_write;
reg[15:0] lb_lengthBuffer_V_V_din;
reg lb_lengthBuffer_V_V_write;

reg    real_start;
reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire   [0:0] ap_CS_fsm_state1;
reg    internal_ap_ready;
reg    start_once_reg;
reg   [1:0] sinkState;
reg   [15:0] lbPacketLength;
reg   [31:0] openPortWaitTime_V;
reg    lbRxDataIn_V_data_V_blk_n;
wire   [0:0] grp_nbreadreq_fu_134_p5;
wire   [0:0] grp_nbwritereq_fu_146_p3;
wire   [0:0] tmp_12_nbreadreq_fu_178_p3;
wire   [0:0] tmp_23_nbwritereq_fu_186_p6;
reg    lbRxDataIn_V_keep_V_blk_n;
reg    lbRxDataIn_V_last_V_blk_n;
reg    lbRxMetadataIn_V_blk_n;
reg    lbRequestPortOpenOut_blk_n;
wire   [0:0] or_cond_i_fu_768_p2;
reg    lbPortOpenReplyIn_V_blk_n;
wire   [0:0] tmp_6_nbreadreq_fu_222_p3;
reg    lb_packetBuffer_V_blk_n;
reg    lb_metadataBuffer_V_s_blk_n;
reg    lb_metadataBuffer_V_4_blk_n;
reg    lb_metadataBuffer_V_3_blk_n;
reg    lb_metadataBuffer_V_1_blk_n;
reg    lb_lengthBuffer_V_V_blk_n;
reg   [0:0] lbPacketLength_flag_s_phi_fu_255_p26;
wire    lbRxDataIn_V_data_V0_status;
wire    lb_metadataBuffer_V_s1_status;
reg    ap_condition_185;
wire   [15:0] tmp_V_1_fu_744_p2;
reg   [15:0] lbPacketLength_new_4_phi_fu_299_p26;
wire   [15:0] tmp_V_fu_551_p2;
reg    lbRxDataIn_V_data_V0_update;
wire   [72:0] tmp_2_fu_404_p4;
wire   [72:0] tmp_1_fu_597_p4;
reg    lb_metadataBuffer_V_s1_update;
wire   [31:0] tmp_8_i_fu_774_p2;
wire   [0:0] tmp_15_fu_415_p1;
wire   [0:0] tmp_16_fu_423_p3;
wire   [1:0] counter_V_1_i_fu_431_p3;
wire   [1:0] p_051_0_cast_i_fu_419_p1;
wire   [1:0] p_051_0_1_i_fu_439_p3;
wire   [0:0] grp_fu_350_p3;
wire   [1:0] counter_V_2_i_fu_447_p2;
wire   [1:0] p_051_0_2_i_fu_453_p3;
wire   [2:0] p_051_0_2_cast_i_fu_461_p1;
wire   [0:0] grp_fu_358_p3;
wire   [2:0] counter_V_3_i_fu_465_p2;
wire   [2:0] p_051_0_3_i_fu_471_p3;
wire   [0:0] grp_fu_366_p3;
wire   [2:0] counter_V_4_i_fu_479_p2;
wire   [2:0] p_051_0_4_i_fu_485_p3;
wire   [0:0] grp_fu_374_p3;
wire   [2:0] counter_V_5_i_fu_493_p2;
wire   [2:0] p_051_0_5_i_fu_499_p3;
wire   [0:0] grp_fu_382_p3;
wire   [2:0] counter_V_6_i_fu_507_p2;
wire   [2:0] p_051_0_6_i_fu_513_p3;
wire   [3:0] p_051_0_6_cast_i_fu_521_p1;
wire   [0:0] tmp_22_fu_525_p3;
wire   [3:0] counter_V_7_i_fu_533_p2;
wire   [3:0] p_051_0_7_i_fu_539_p3;
wire   [15:0] tmp_12_i_fu_547_p1;
wire   [0:0] tmp_25_fu_608_p1;
wire   [0:0] tmp_26_fu_616_p3;
wire   [1:0] counter_V_1_1_i_fu_624_p3;
wire   [1:0] p_067_0_cast_i_fu_612_p1;
wire   [1:0] p_067_0_1_i_fu_632_p3;
wire   [1:0] counter_V_1_2_i_fu_640_p2;
wire   [1:0] p_067_0_2_i_fu_646_p3;
wire   [2:0] p_067_0_2_cast_i_fu_654_p1;
wire   [2:0] counter_V_1_3_i_fu_658_p2;
wire   [2:0] p_067_0_3_i_fu_664_p3;
wire   [2:0] counter_V_1_4_i_fu_672_p2;
wire   [2:0] p_067_0_4_i_fu_678_p3;
wire   [2:0] counter_V_1_5_i_fu_686_p2;
wire   [2:0] p_067_0_5_i_fu_692_p3;
wire   [2:0] counter_V_1_6_i_fu_700_p2;
wire   [2:0] p_067_0_6_i_fu_706_p3;
wire   [3:0] p_067_0_6_cast_i_fu_714_p1;
wire   [0:0] tmp_32_fu_718_p3;
wire   [3:0] counter_V_1_7_i_fu_726_p2;
wire   [3:0] p_067_0_7_i_fu_732_p3;
wire   [15:0] tmp_16_i_fu_740_p1;
wire   [0:0] or_cond_i_fu_768_p0;
wire   [0:0] tmp_i_fu_762_p2;
reg   [0:0] ap_NS_fsm;
reg    ap_condition_574;
reg    ap_condition_572;
reg    ap_condition_579;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'b1;
#0 start_once_reg = 1'b0;
#0 sinkState = 2'b00;
#0 lbPacketLength = 16'b0000000000000000;
#0 openPortWaitTime_V = 32'b1100100;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_continue)) begin
            ap_done_reg <= 1'b0;
        end else if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_condition_185 == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        start_once_reg <= 1'b0;
    end else begin
        if ((1'b1 == real_start)) begin
            start_once_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((ap_CS_fsm_state1 == 1'b1) & (ap_const_lv2_0 == sinkState) & ~(1'b0 == or_cond_i_fu_768_p2) & ~(ap_condition_185 == 1'b1))) begin
        sinkState <= ap_const_lv2_1;
    end else if (((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & (1'b0 == lbRxDataIn_V_last_V_dout) & ~(ap_condition_185 == 1'b1))) begin
        sinkState <= ap_const_lv2_3;
    end else if ((((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3) & ~(1'b0 == lbRxDataIn_V_last_V_dout) & ~(ap_condition_185 == 1'b1)) | ((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_1) & ~(1'b0 == tmp_6_nbreadreq_fu_222_p3) & ~(ap_condition_185 == 1'b1)))) begin
        sinkState <= ap_const_lv2_2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_condition_185 == 1'b1) & ~(1'b0 == lbPacketLength_flag_s_phi_fu_255_p26))) begin
        lbPacketLength <= lbPacketLength_new_4_phi_fu_299_p26;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_CS_fsm_state1 == 1'b1) & (ap_const_lv2_0 == sinkState) & (1'b0 == or_cond_i_fu_768_p2) & ~(ap_condition_185 == 1'b1))) begin
        openPortWaitTime_V <= tmp_8_i_fu_774_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_done_reg) | ((ap_CS_fsm_state1 == 1'b1) & ~(ap_condition_185 == 1'b1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == real_start) & (ap_CS_fsm_state1 == 1'b1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(ap_condition_185 == 1'b1))) begin
        internal_ap_ready = 1'b1;
    end else begin
        internal_ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & ~(1'b0 == lbRxDataIn_V_last_V_dout)) | ((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3) & ~(1'b0 == lbRxDataIn_V_last_V_dout)) | ((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & (1'b0 == lbRxDataIn_V_last_V_dout)) | ((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3) & (1'b0 == lbRxDataIn_V_last_V_dout)))) begin
        lbPacketLength_flag_s_phi_fu_255_p26 = 1'b1;
    end else if ((((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & (1'b0 == tmp_23_nbwritereq_fu_186_p6)) | ((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (1'b0 == tmp_12_nbreadreq_fu_178_p3)) | ((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & (1'b0 == grp_nbwritereq_fu_146_p3)) | ((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & (grp_nbreadreq_fu_134_p5 == 1'b0)) | ((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & (1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3)) | ((ap_CS_fsm_state1 == 1'b1) & (grp_nbreadreq_fu_134_p5 == 1'b0) & (sinkState == ap_const_lv2_3)) | ((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_1)) | ((ap_CS_fsm_state1 == 1'b1) & (ap_const_lv2_0 == sinkState)))) begin
        lbPacketLength_flag_s_phi_fu_255_p26 = 1'b0;
    end else begin
        lbPacketLength_flag_s_phi_fu_255_p26 = 'bx;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3) & (1'b0 == lbRxDataIn_V_last_V_dout))) begin
        lbPacketLength_new_4_phi_fu_299_p26 = tmp_V_fu_551_p2;
    end else if ((((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & ~(1'b0 == lbRxDataIn_V_last_V_dout)) | ((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3) & ~(1'b0 == lbRxDataIn_V_last_V_dout)))) begin
        lbPacketLength_new_4_phi_fu_299_p26 = ap_const_lv16_0;
    end else if (((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & (1'b0 == lbRxDataIn_V_last_V_dout))) begin
        lbPacketLength_new_4_phi_fu_299_p26 = tmp_V_1_fu_744_p2;
    end else begin
        lbPacketLength_new_4_phi_fu_299_p26 = 'bx;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_1) & ~(1'b0 == tmp_6_nbreadreq_fu_222_p3))) begin
        lbPortOpenReplyIn_V_blk_n = lbPortOpenReplyIn_V_empty_n;
    end else begin
        lbPortOpenReplyIn_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_1) & ~(1'b0 == tmp_6_nbreadreq_fu_222_p3) & ~(ap_condition_185 == 1'b1))) begin
        lbPortOpenReplyIn_V_read = 1'b1;
    end else begin
        lbPortOpenReplyIn_V_read = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & (ap_const_lv2_0 == sinkState) & ~(1'b0 == or_cond_i_fu_768_p2))) begin
        lbRequestPortOpenOut_blk_n = lbRequestPortOpenOut_full_n;
    end else begin
        lbRequestPortOpenOut_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & (ap_const_lv2_0 == sinkState) & ~(1'b0 == or_cond_i_fu_768_p2) & ~(ap_condition_185 == 1'b1))) begin
        lbRequestPortOpenOut_write = 1'b1;
    end else begin
        lbRequestPortOpenOut_write = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3) & ~(ap_condition_185 == 1'b1)) | ((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & ~(ap_condition_185 == 1'b1)))) begin
        lbRxDataIn_V_data_V0_update = 1'b1;
    end else begin
        lbRxDataIn_V_data_V0_update = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6)) | ((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3)))) begin
        lbRxDataIn_V_data_V_blk_n = lbRxDataIn_V_data_V_empty_n;
    end else begin
        lbRxDataIn_V_data_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6)) | ((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3)))) begin
        lbRxDataIn_V_keep_V_blk_n = lbRxDataIn_V_keep_V_empty_n;
    end else begin
        lbRxDataIn_V_keep_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6)) | ((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3)))) begin
        lbRxDataIn_V_last_V_blk_n = lbRxDataIn_V_last_V_empty_n;
    end else begin
        lbRxDataIn_V_last_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6))) begin
        lbRxMetadataIn_V_blk_n = lbRxMetadataIn_V_empty_n;
    end else begin
        lbRxMetadataIn_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & ~(ap_condition_185 == 1'b1))) begin
        lbRxMetadataIn_V_read = 1'b1;
    end else begin
        lbRxMetadataIn_V_read = 1'b0;
    end
end

always @ (*) begin
    if ((((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & ~(1'b0 == lbRxDataIn_V_last_V_dout)) | ((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3) & ~(1'b0 == lbRxDataIn_V_last_V_dout)))) begin
        lb_lengthBuffer_V_V_blk_n = lb_lengthBuffer_V_V_full_n;
    end else begin
        lb_lengthBuffer_V_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((ap_condition_572 == 1'b1)) begin
        if ((ap_condition_574 == 1'b1)) begin
            lb_lengthBuffer_V_V_din = tmp_V_1_fu_744_p2;
        end else if ((sinkState == ap_const_lv2_3)) begin
            lb_lengthBuffer_V_V_din = tmp_V_fu_551_p2;
        end else begin
            lb_lengthBuffer_V_V_din = 'bx;
        end
    end else begin
        lb_lengthBuffer_V_V_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & ~(1'b0 == lbRxDataIn_V_last_V_dout) & ~(ap_condition_185 == 1'b1)) | ((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3) & ~(1'b0 == lbRxDataIn_V_last_V_dout) & ~(ap_condition_185 == 1'b1)))) begin
        lb_lengthBuffer_V_V_write = 1'b1;
    end else begin
        lb_lengthBuffer_V_V_write = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6))) begin
        lb_metadataBuffer_V_1_blk_n = lb_metadataBuffer_V_1_full_n;
    end else begin
        lb_metadataBuffer_V_1_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6))) begin
        lb_metadataBuffer_V_3_blk_n = lb_metadataBuffer_V_3_full_n;
    end else begin
        lb_metadataBuffer_V_3_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6))) begin
        lb_metadataBuffer_V_4_blk_n = lb_metadataBuffer_V_4_full_n;
    end else begin
        lb_metadataBuffer_V_4_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & ~(ap_condition_185 == 1'b1))) begin
        lb_metadataBuffer_V_s1_update = 1'b1;
    end else begin
        lb_metadataBuffer_V_s1_update = 1'b0;
    end
end

always @ (*) begin
    if (((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6))) begin
        lb_metadataBuffer_V_s_blk_n = lb_metadataBuffer_V_s_full_n;
    end else begin
        lb_metadataBuffer_V_s_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6)) | ((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3)))) begin
        lb_packetBuffer_V_blk_n = lb_packetBuffer_V_full_n;
    end else begin
        lb_packetBuffer_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((ap_condition_579 == 1'b1)) begin
        if ((ap_condition_574 == 1'b1)) begin
            lb_packetBuffer_V_din = tmp_1_fu_597_p4;
        end else if ((sinkState == ap_const_lv2_3)) begin
            lb_packetBuffer_V_din = tmp_2_fu_404_p4;
        end else begin
            lb_packetBuffer_V_din = 'bx;
        end
    end else begin
        lb_packetBuffer_V_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3) & ~(ap_condition_185 == 1'b1)) | ((ap_CS_fsm_state1 == 1'b1) & (sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & ~(ap_condition_185 == 1'b1)))) begin
        lb_packetBuffer_V_write = 1'b1;
    end else begin
        lb_packetBuffer_V_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b0 == start_full_n)) begin
        real_start = 1'b0;
    end else begin
        real_start = ap_start;
    end
end

always @ (*) begin
    if (((1'b1 == real_start) & ((1'b1 == internal_ap_ready) | (1'b0 == start_once_reg)))) begin
        start_write = 1'b1;
    end else begin
        start_write = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_state1 = ap_CS_fsm[ap_const_lv32_0];

always @ (*) begin
    ap_condition_185 = ((~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3) & (lbRxDataIn_V_data_V0_status == 1'b0)) | (~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3) & (lb_packetBuffer_V_full_n == 1'b0)) | (~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & (sinkState == ap_const_lv2_3) & ~(1'b0 == lbRxDataIn_V_last_V_dout) & (lb_lengthBuffer_V_V_full_n == 1'b0)) | ((sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & (lbRxMetadataIn_V_empty_n == 1'b0)) | ((sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & (lb_metadataBuffer_V_s1_status == 1'b0)) | ((sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & (lbRxDataIn_V_data_V0_status == 1'b0)) | ((sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & (lb_packetBuffer_V_full_n == 1'b0)) | ((sinkState == ap_const_lv2_2) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6) & ~(1'b0 == lbRxDataIn_V_last_V_dout) & (lb_lengthBuffer_V_V_full_n == 1'b0)) | ((sinkState == ap_const_lv2_1) & ~(1'b0 == tmp_6_nbreadreq_fu_222_p3) & (lbPortOpenReplyIn_V_empty_n == 1'b0)) | ((ap_const_lv2_0 == sinkState) & ~(1'b0 == or_cond_i_fu_768_p2) & (lbRequestPortOpenOut_full_n == 1'b0)) | (real_start == 1'b0) | (ap_done_reg == 1'b1));
end

always @ (*) begin
    ap_condition_572 = ((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(1'b0 == lbRxDataIn_V_last_V_dout) & ~(ap_condition_185 == 1'b1));
end

always @ (*) begin
    ap_condition_574 = ((sinkState == ap_const_lv2_2) & ~(1'b0 == tmp_12_nbreadreq_fu_178_p3) & ~(1'b0 == tmp_23_nbwritereq_fu_186_p6));
end

always @ (*) begin
    ap_condition_579 = ((ap_CS_fsm_state1 == 1'b1) & ~(grp_nbreadreq_fu_134_p5 == 1'b0) & ~(1'b0 == grp_nbwritereq_fu_146_p3) & ~(ap_condition_185 == 1'b1));
end

assign ap_ready = internal_ap_ready;

assign counter_V_1_1_i_fu_624_p3 = ((tmp_25_fu_608_p1[0:0] === 1'b1) ? ap_const_lv2_2 : ap_const_lv2_1);

assign counter_V_1_2_i_fu_640_p2 = (ap_const_lv2_1 + p_067_0_1_i_fu_632_p3);

assign counter_V_1_3_i_fu_658_p2 = (ap_const_lv3_1 + p_067_0_2_cast_i_fu_654_p1);

assign counter_V_1_4_i_fu_672_p2 = (ap_const_lv3_1 + p_067_0_3_i_fu_664_p3);

assign counter_V_1_5_i_fu_686_p2 = (ap_const_lv3_1 + p_067_0_4_i_fu_678_p3);

assign counter_V_1_6_i_fu_700_p2 = (ap_const_lv3_1 + p_067_0_5_i_fu_692_p3);

assign counter_V_1_7_i_fu_726_p2 = (ap_const_lv4_1 + p_067_0_6_cast_i_fu_714_p1);

assign counter_V_1_i_fu_431_p3 = ((tmp_15_fu_415_p1[0:0] === 1'b1) ? ap_const_lv2_2 : ap_const_lv2_1);

assign counter_V_2_i_fu_447_p2 = (ap_const_lv2_1 + p_051_0_1_i_fu_439_p3);

assign counter_V_3_i_fu_465_p2 = (ap_const_lv3_1 + p_051_0_2_cast_i_fu_461_p1);

assign counter_V_4_i_fu_479_p2 = (ap_const_lv3_1 + p_051_0_3_i_fu_471_p3);

assign counter_V_5_i_fu_493_p2 = (ap_const_lv3_1 + p_051_0_4_i_fu_485_p3);

assign counter_V_6_i_fu_507_p2 = (ap_const_lv3_1 + p_051_0_5_i_fu_499_p3);

assign counter_V_7_i_fu_533_p2 = (ap_const_lv4_1 + p_051_0_6_cast_i_fu_521_p1);

assign grp_fu_350_p3 = lbRxDataIn_V_keep_V_dout[ap_const_lv32_2];

assign grp_fu_358_p3 = lbRxDataIn_V_keep_V_dout[ap_const_lv32_3];

assign grp_fu_366_p3 = lbRxDataIn_V_keep_V_dout[ap_const_lv32_4];

assign grp_fu_374_p3 = lbRxDataIn_V_keep_V_dout[ap_const_lv32_5];

assign grp_fu_382_p3 = lbRxDataIn_V_keep_V_dout[ap_const_lv32_6];

assign grp_nbreadreq_fu_134_p5 = (lbRxDataIn_V_data_V_empty_n & lbRxDataIn_V_keep_V_empty_n & lbRxDataIn_V_last_V_empty_n);

assign grp_nbwritereq_fu_146_p3 = lb_packetBuffer_V_full_n;

assign lbRequestPortOpenOut_din = ap_const_lv16_282;

assign lbRxDataIn_V_data_V0_status = (lbRxDataIn_V_data_V_empty_n & lbRxDataIn_V_keep_V_empty_n & lbRxDataIn_V_last_V_empty_n);

assign lbRxDataIn_V_data_V_read = lbRxDataIn_V_data_V0_update;

assign lbRxDataIn_V_keep_V_read = lbRxDataIn_V_data_V0_update;

assign lbRxDataIn_V_last_V_read = lbRxDataIn_V_data_V0_update;

assign lb_metadataBuffer_V_1_din = {{lbRxMetadataIn_V_dout[ap_const_lv32_2F : ap_const_lv32_10]}};

assign lb_metadataBuffer_V_1_write = lb_metadataBuffer_V_s1_update;

assign lb_metadataBuffer_V_3_din = lbRxMetadataIn_V_dout[15:0];

assign lb_metadataBuffer_V_3_write = lb_metadataBuffer_V_s1_update;

assign lb_metadataBuffer_V_4_din = {{lbRxMetadataIn_V_dout[ap_const_lv32_5F : ap_const_lv32_40]}};

assign lb_metadataBuffer_V_4_write = lb_metadataBuffer_V_s1_update;

assign lb_metadataBuffer_V_s1_status = (lb_metadataBuffer_V_s_full_n & lb_metadataBuffer_V_4_full_n & lb_metadataBuffer_V_3_full_n & lb_metadataBuffer_V_1_full_n);

assign lb_metadataBuffer_V_s_din = {{lbRxMetadataIn_V_dout[ap_const_lv32_3F : ap_const_lv32_30]}};

assign lb_metadataBuffer_V_s_write = lb_metadataBuffer_V_s1_update;

assign or_cond_i_fu_768_p0 = lbRequestPortOpenOut_full_n;

assign or_cond_i_fu_768_p2 = (or_cond_i_fu_768_p0 & tmp_i_fu_762_p2);

assign p_051_0_1_i_fu_439_p3 = ((tmp_16_fu_423_p3[0:0] === 1'b1) ? counter_V_1_i_fu_431_p3 : p_051_0_cast_i_fu_419_p1);

assign p_051_0_2_cast_i_fu_461_p1 = p_051_0_2_i_fu_453_p3;

assign p_051_0_2_i_fu_453_p3 = ((grp_fu_350_p3[0:0] === 1'b1) ? counter_V_2_i_fu_447_p2 : p_051_0_1_i_fu_439_p3);

assign p_051_0_3_i_fu_471_p3 = ((grp_fu_358_p3[0:0] === 1'b1) ? counter_V_3_i_fu_465_p2 : p_051_0_2_cast_i_fu_461_p1);

assign p_051_0_4_i_fu_485_p3 = ((grp_fu_366_p3[0:0] === 1'b1) ? counter_V_4_i_fu_479_p2 : p_051_0_3_i_fu_471_p3);

assign p_051_0_5_i_fu_499_p3 = ((grp_fu_374_p3[0:0] === 1'b1) ? counter_V_5_i_fu_493_p2 : p_051_0_4_i_fu_485_p3);

assign p_051_0_6_cast_i_fu_521_p1 = p_051_0_6_i_fu_513_p3;

assign p_051_0_6_i_fu_513_p3 = ((grp_fu_382_p3[0:0] === 1'b1) ? counter_V_6_i_fu_507_p2 : p_051_0_5_i_fu_499_p3);

assign p_051_0_7_i_fu_539_p3 = ((tmp_22_fu_525_p3[0:0] === 1'b1) ? counter_V_7_i_fu_533_p2 : p_051_0_6_cast_i_fu_521_p1);

assign p_051_0_cast_i_fu_419_p1 = tmp_15_fu_415_p1;

assign p_067_0_1_i_fu_632_p3 = ((tmp_26_fu_616_p3[0:0] === 1'b1) ? counter_V_1_1_i_fu_624_p3 : p_067_0_cast_i_fu_612_p1);

assign p_067_0_2_cast_i_fu_654_p1 = p_067_0_2_i_fu_646_p3;

assign p_067_0_2_i_fu_646_p3 = ((grp_fu_350_p3[0:0] === 1'b1) ? counter_V_1_2_i_fu_640_p2 : p_067_0_1_i_fu_632_p3);

assign p_067_0_3_i_fu_664_p3 = ((grp_fu_358_p3[0:0] === 1'b1) ? counter_V_1_3_i_fu_658_p2 : p_067_0_2_cast_i_fu_654_p1);

assign p_067_0_4_i_fu_678_p3 = ((grp_fu_366_p3[0:0] === 1'b1) ? counter_V_1_4_i_fu_672_p2 : p_067_0_3_i_fu_664_p3);

assign p_067_0_5_i_fu_692_p3 = ((grp_fu_374_p3[0:0] === 1'b1) ? counter_V_1_5_i_fu_686_p2 : p_067_0_4_i_fu_678_p3);

assign p_067_0_6_cast_i_fu_714_p1 = p_067_0_6_i_fu_706_p3;

assign p_067_0_6_i_fu_706_p3 = ((grp_fu_382_p3[0:0] === 1'b1) ? counter_V_1_6_i_fu_700_p2 : p_067_0_5_i_fu_692_p3);

assign p_067_0_7_i_fu_732_p3 = ((tmp_32_fu_718_p3[0:0] === 1'b1) ? counter_V_1_7_i_fu_726_p2 : p_067_0_6_cast_i_fu_714_p1);

assign p_067_0_cast_i_fu_612_p1 = tmp_25_fu_608_p1;

assign start_out = real_start;

assign tmp_12_i_fu_547_p1 = p_051_0_7_i_fu_539_p3;

assign tmp_12_nbreadreq_fu_178_p3 = lbRxMetadataIn_V_empty_n;

assign tmp_15_fu_415_p1 = lbRxDataIn_V_keep_V_dout[0:0];

assign tmp_16_fu_423_p3 = lbRxDataIn_V_keep_V_dout[ap_const_lv32_1];

assign tmp_16_i_fu_740_p1 = p_067_0_7_i_fu_732_p3;

assign tmp_1_fu_597_p4 = {{{lbRxDataIn_V_last_V_dout}, {lbRxDataIn_V_keep_V_dout}}, {lbRxDataIn_V_data_V_dout}};

assign tmp_22_fu_525_p3 = lbRxDataIn_V_keep_V_dout[ap_const_lv32_7];

assign tmp_23_nbwritereq_fu_186_p6 = (lb_metadataBuffer_V_s_full_n & lb_metadataBuffer_V_4_full_n & lb_metadataBuffer_V_3_full_n & lb_metadataBuffer_V_1_full_n);

assign tmp_25_fu_608_p1 = lbRxDataIn_V_keep_V_dout[0:0];

assign tmp_26_fu_616_p3 = lbRxDataIn_V_keep_V_dout[ap_const_lv32_1];

assign tmp_2_fu_404_p4 = {{{lbRxDataIn_V_last_V_dout}, {lbRxDataIn_V_keep_V_dout}}, {lbRxDataIn_V_data_V_dout}};

assign tmp_32_fu_718_p3 = lbRxDataIn_V_keep_V_dout[ap_const_lv32_7];

assign tmp_6_nbreadreq_fu_222_p3 = lbPortOpenReplyIn_V_empty_n;

assign tmp_8_i_fu_774_p2 = ($signed(openPortWaitTime_V) + $signed(ap_const_lv32_FFFFFFFF));

assign tmp_V_1_fu_744_p2 = (tmp_16_i_fu_740_p1 + lbPacketLength);

assign tmp_V_fu_551_p2 = (tmp_12_i_fu_547_p1 + lbPacketLength);

assign tmp_i_fu_762_p2 = ((openPortWaitTime_V == ap_const_lv32_0) ? 1'b1 : 1'b0);

endmodule //rxPath