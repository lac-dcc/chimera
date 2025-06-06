// This program was cloned from: https://github.com/zainryan/INSIDER-System
// License: MIT License

// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4.op
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="dram_write_mux,hls_ip_2017_4_op,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcvu9p-flgb2104-2-i,HLS_INPUT_CLOCK=4.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=3.143800,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=1195,HLS_SYN_LUT=433}" *)

module dram_write_mux (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
ap_continue,
        ap_idle,
        ap_ready,
        dram_write_req_apply_V_num_din,
        dram_write_req_apply_V_num_full_n,
        dram_write_req_apply_V_num_write,
        dram_write_req_apply_V_addr_din,
        dram_write_req_apply_V_addr_full_n,
        dram_write_req_apply_V_addr_write,
        dram_write_req_data_V_last_din,
        dram_write_req_data_V_last_full_n,
        dram_write_req_data_V_last_write,
        dram_write_req_data_V_data_V_din,
        dram_write_req_data_V_data_V_full_n,
        dram_write_req_data_V_data_V_write,
        host_dram_write_req_apply_V_num_dout,
        host_dram_write_req_apply_V_num_empty_n,
        host_dram_write_req_apply_V_num_read,
        host_dram_write_req_apply_V_addr_dout,
        host_dram_write_req_apply_V_addr_empty_n,
        host_dram_write_req_apply_V_addr_read,
        host_dram_write_req_data_V_last_dout,
        host_dram_write_req_data_V_last_empty_n,
        host_dram_write_req_data_V_last_read,
        host_dram_write_req_data_V_data_V_dout,
        host_dram_write_req_data_V_data_V_empty_n,
        host_dram_write_req_data_V_data_V_read,
        device_dram_write_req_apply_V_num_dout,
        device_dram_write_req_apply_V_num_empty_n,
        device_dram_write_req_apply_V_num_read,
        device_dram_write_req_apply_V_addr_dout,
        device_dram_write_req_apply_V_addr_empty_n,
        device_dram_write_req_apply_V_addr_read,
        device_dram_write_req_data_V_last_dout,
        device_dram_write_req_data_V_last_empty_n,
        device_dram_write_req_data_V_last_read,
        device_dram_write_req_data_V_data_V_dout,
        device_dram_write_req_data_V_data_V_empty_n,
        device_dram_write_req_data_V_data_V_read
);

parameter    ap_ST_fsm_state1 = 2'd1;
parameter    ap_ST_fsm_pp0_stage0 = 2'd2;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output ap_ready; output ap_continue;
output  [7:0] dram_write_req_apply_V_num_din;
input   dram_write_req_apply_V_num_full_n;
output   dram_write_req_apply_V_num_write;
output  [63:0] dram_write_req_apply_V_addr_din;
input   dram_write_req_apply_V_addr_full_n;
output   dram_write_req_apply_V_addr_write;
output   dram_write_req_data_V_last_din;
input   dram_write_req_data_V_last_full_n;
output   dram_write_req_data_V_last_write;
output  [511:0] dram_write_req_data_V_data_V_din;
input   dram_write_req_data_V_data_V_full_n;
output   dram_write_req_data_V_data_V_write;
input  [7:0] host_dram_write_req_apply_V_num_dout;
input   host_dram_write_req_apply_V_num_empty_n;
output   host_dram_write_req_apply_V_num_read;
input  [63:0] host_dram_write_req_apply_V_addr_dout;
input   host_dram_write_req_apply_V_addr_empty_n;
output   host_dram_write_req_apply_V_addr_read;
input   host_dram_write_req_data_V_last_dout;
input   host_dram_write_req_data_V_last_empty_n;
output   host_dram_write_req_data_V_last_read;
input  [511:0] host_dram_write_req_data_V_data_V_dout;
input   host_dram_write_req_data_V_data_V_empty_n;
output   host_dram_write_req_data_V_data_V_read;
input  [7:0] device_dram_write_req_apply_V_num_dout;
input   device_dram_write_req_apply_V_num_empty_n;
output   device_dram_write_req_apply_V_num_read;
input  [63:0] device_dram_write_req_apply_V_addr_dout;
input   device_dram_write_req_apply_V_addr_empty_n;
output   device_dram_write_req_apply_V_addr_read;
input   device_dram_write_req_data_V_last_dout;
input   device_dram_write_req_data_V_last_empty_n;
output   device_dram_write_req_data_V_last_read;
input  [511:0] device_dram_write_req_data_V_data_V_dout;
input   device_dram_write_req_data_V_data_V_empty_n;
output   device_dram_write_req_data_V_data_V_read;

reg ap_idle;
reg[7:0] dram_write_req_apply_V_num_din;
reg[63:0] dram_write_req_apply_V_addr_din;
reg dram_write_req_data_V_last_din;
reg[511:0] dram_write_req_data_V_data_V_din;

(* fsm_encoding = "none" *) reg   [1:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    dram_write_req_apply_V_num_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] tmp_reg_484;
reg   [0:0] empty_n_6_reg_514;
reg   [0:0] empty_n_8_reg_528;
reg    dram_write_req_apply_V_addr_blk_n;
reg    dram_write_req_data_V_last_blk_n;
reg   [0:0] empty_n_7_reg_551;
reg   [0:0] empty_n_10_reg_542;
reg   [0:0] tmp_6_reg_488;
reg   [0:0] empty_n_9_reg_505;
reg   [0:0] tmp_9_reg_492;
reg   [0:0] empty_n_11_reg_496;
reg    dram_write_req_data_V_data_V_blk_n;
reg   [511:0] reg_317;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    dram_write_req_data_V_last1_status;
reg    ap_predicate_op103_write_state3;
reg    ap_predicate_op104_write_state3;
wire    dram_write_req_apply_V_num1_status;
reg    ap_predicate_op105_write_state3;
reg    ap_predicate_op106_write_state3;
reg    ap_predicate_op107_write_state3;
reg    ap_predicate_op108_write_state3;
reg    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
wire   [0:0] tmp_fu_335_p2;
wire   [0:0] tmp_6_fu_341_p2;
wire   [0:0] tmp_9_fu_347_p2;
wire   [0:0] empty_n_6_fu_395_p1;
wire   [0:0] empty_n_8_fu_407_p1;
reg   [511:0] reg_322;
wire   [0:0] grp_fu_281_p1;
wire   [0:0] tmp_last_3_fu_356_p2;
reg   [0:0] tmp_last_3_reg_500;
wire   [0:0] grp_fu_294_p1;
reg   [0:0] tmp_last_1_reg_509;
reg   [7:0] tmp_num_reg_518;
reg   [63:0] tmp_addr_reg_523;
reg   [7:0] tmp_num_3_reg_532;
reg   [63:0] tmp_addr_2_reg_537;
wire   [0:0] tmp_last_2_fu_424_p2;
reg   [0:0] tmp_last_2_reg_546;
reg   [0:0] tmp_last_reg_555;
reg    ap_block_pp0_stage0_subdone;
reg    device_dram_write_req_data_V_last0_update;
wire   [0:0] grp_nbread_fu_224_p3_0;
reg    host_dram_write_req_data_V_last0_update;
wire   [0:0] grp_nbread_fu_232_p3_0;
reg    host_dram_write_req_apply_V_num0_update;
wire   [0:0] empty_n_nbread_fu_240_p3_0;
reg    device_dram_write_req_apply_V_num0_update;
wire   [0:0] empty_n_1_nbread_fu_248_p3_0;
reg    dram_write_req_data_V_last1_update;
reg    ap_block_pp0_stage0_01001;
reg    dram_write_req_apply_V_num1_update;
reg   [7:0] pending_flits_read_assign_1_fu_216;
wire   [7:0] tmp_2_i1_fu_362_p2;
wire   [7:0] tmp_2_i_fu_430_p2;
reg   [7:0] state_fu_220;
wire   [7:0] phitmp_i3_cast_cast_fu_368_p3;
wire   [7:0] phitmp_i1_cast_fu_386_p1;
wire   [7:0] phitmp_i2_cast_cast_fu_436_p3;
wire   [7:0] phitmp_i_cast_fu_454_p1;
wire   [0:0] grp_fu_311_p0;
wire   [0:0] grp_fu_311_p2;
reg   [1:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_275;

// power-on initialization
initial begin
#0 ap_CS_fsm = 2'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
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
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((empty_n_6_fu_395_p1 == 1'd0) & (grp_fu_281_p1 == 1'd1) & (empty_n_8_fu_407_p1 == 1'd1) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        pending_flits_read_assign_1_fu_216 <= tmp_2_i_fu_430_p2;
    end else if (((grp_fu_281_p1 == 1'd0) & (empty_n_6_fu_395_p1 == 1'd0) & (empty_n_8_fu_407_p1 == 1'd1) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        pending_flits_read_assign_1_fu_216 <= device_dram_write_req_apply_V_num_dout;
    end else if (((tmp_6_fu_341_p2 == 1'd0) & (tmp_fu_335_p2 == 1'd0) & (grp_fu_281_p1 == 1'd1) & (tmp_9_fu_347_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        pending_flits_read_assign_1_fu_216 <= tmp_2_i1_fu_362_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        pending_flits_read_assign_1_fu_216 <= 8'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_fu_294_p1 == 1'd1) & (empty_n_6_fu_395_p1 == 1'd1) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
                state_fu_220[1 : 0] <= phitmp_i_cast_fu_454_p1[1 : 0];
    end else if (((empty_n_6_fu_395_p1 == 1'd0) & (grp_fu_281_p1 == 1'd1) & (empty_n_8_fu_407_p1 == 1'd1) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
                state_fu_220[1 : 0] <= phitmp_i2_cast_cast_fu_436_p3[1 : 0];
    end else if (((tmp_fu_335_p2 == 1'd0) & (grp_fu_294_p1 == 1'd1) & (tmp_6_fu_341_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
                state_fu_220[1 : 0] <= phitmp_i1_cast_fu_386_p1[1 : 0];
    end else if ((((grp_fu_294_p1 == 1'd0) & (empty_n_6_fu_395_p1 == 1'd1) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((grp_fu_294_p1 == 1'd0) & (tmp_fu_335_p2 == 1'd0) & (tmp_6_fu_341_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
                state_fu_220[0] <= 1'b1;
        state_fu_220[1] <= 1'b0;
    end else if (((tmp_6_fu_341_p2 == 1'd0) & (tmp_fu_335_p2 == 1'd0) & (grp_fu_281_p1 == 1'd1) & (tmp_9_fu_347_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
                state_fu_220[1 : 0] <= phitmp_i3_cast_cast_fu_368_p3[1 : 0];
    end else if ((((grp_fu_281_p1 == 1'd0) & (empty_n_6_fu_395_p1 == 1'd0) & (empty_n_8_fu_407_p1 == 1'd1) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((grp_fu_281_p1 == 1'd0) & (tmp_6_fu_341_p2 == 1'd0) & (tmp_fu_335_p2 == 1'd0) & (tmp_9_fu_347_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
                state_fu_220[0] <= 1'b0;
        state_fu_220[1] <= 1'b1;
    end else if ((((empty_n_8_fu_407_p1 == 1'd0) & (empty_n_6_fu_395_p1 == 1'd0) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1)))) begin
                state_fu_220[0] <= 1'b0;
        state_fu_220[1] <= 1'b0;
    end
end

always @ (posedge ap_clk) begin
    if (((empty_n_6_fu_395_p1 == 1'd0) & (empty_n_8_fu_407_p1 == 1'd1) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        empty_n_10_reg_542 <= grp_nbread_fu_224_p3_0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_6_fu_341_p2 == 1'd0) & (tmp_fu_335_p2 == 1'd0) & (tmp_9_fu_347_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        empty_n_11_reg_496 <= grp_nbread_fu_224_p3_0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        empty_n_6_reg_514 <= empty_n_nbread_fu_240_p3_0;
        tmp_addr_reg_523 <= host_dram_write_req_apply_V_addr_dout;
        tmp_num_reg_518 <= host_dram_write_req_apply_V_num_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((empty_n_6_fu_395_p1 == 1'd1) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        empty_n_7_reg_551 <= grp_nbread_fu_232_p3_0;
        tmp_last_reg_555 <= host_dram_write_req_data_V_last_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((empty_n_6_fu_395_p1 == 1'd0) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        empty_n_8_reg_528 <= empty_n_1_nbread_fu_248_p3_0;
        tmp_addr_2_reg_537 <= device_dram_write_req_apply_V_addr_dout;
        tmp_num_3_reg_532 <= device_dram_write_req_apply_V_num_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_335_p2 == 1'd0) & (tmp_6_fu_341_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        empty_n_9_reg_505 <= grp_nbread_fu_232_p3_0;
        tmp_last_1_reg_509 <= host_dram_write_req_data_V_last_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((((empty_n_6_fu_395_p1 == 1'd0) & (empty_n_8_fu_407_p1 == 1'd1) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_6_fu_341_p2 == 1'd0) & (tmp_fu_335_p2 == 1'd0) & (tmp_9_fu_347_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        reg_317 <= device_dram_write_req_data_V_data_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if ((((empty_n_6_fu_395_p1 == 1'd1) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_fu_335_p2 == 1'd0) & (tmp_6_fu_341_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        reg_322 <= host_dram_write_req_data_V_data_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_335_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_6_reg_488 <= tmp_6_fu_341_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_6_fu_341_p2 == 1'd0) & (tmp_fu_335_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_9_reg_492 <= tmp_9_fu_347_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((empty_n_6_fu_395_p1 == 1'd0) & (grp_fu_281_p1 == 1'd1) & (empty_n_8_fu_407_p1 == 1'd1) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_last_2_reg_546 <= tmp_last_2_fu_424_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_6_fu_341_p2 == 1'd0) & (tmp_fu_335_p2 == 1'd0) & (grp_fu_281_p1 == 1'd1) & (tmp_9_fu_347_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_last_3_reg_500 <= tmp_last_3_fu_356_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        tmp_reg_484 <= tmp_fu_335_p2;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((empty_n_6_fu_395_p1 == 1'd0) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & ((device_dram_write_req_apply_V_num_empty_n & device_dram_write_req_apply_V_addr_empty_n) == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        device_dram_write_req_apply_V_num0_update = 1'b1;
    end else begin
        device_dram_write_req_apply_V_num0_update = 1'b0;
    end
end

always @ (*) begin
    if ((((device_dram_write_req_data_V_last_empty_n & device_dram_write_req_data_V_data_V_empty_n) == 1'b1) & (((empty_n_6_fu_395_p1 == 1'd0) & (empty_n_8_fu_407_p1 == 1'd1) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_6_fu_341_p2 == 1'd0) & (tmp_fu_335_p2 == 1'd0) & (tmp_9_fu_347_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))))) begin
        device_dram_write_req_data_V_last0_update = 1'b1;
    end else begin
        device_dram_write_req_data_V_last0_update = 1'b0;
    end
end

always @ (*) begin
    if ((((empty_n_6_reg_514 == 1'd0) & (empty_n_8_reg_528 == 1'd1) & (tmp_reg_484 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((empty_n_6_reg_514 == 1'd1) & (tmp_reg_484 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        dram_write_req_apply_V_addr_blk_n = dram_write_req_apply_V_addr_full_n;
    end else begin
        dram_write_req_apply_V_addr_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_275)) begin
        if ((ap_predicate_op107_write_state3 == 1'b1)) begin
            dram_write_req_apply_V_addr_din = tmp_addr_reg_523;
        end else if ((ap_predicate_op105_write_state3 == 1'b1)) begin
            dram_write_req_apply_V_addr_din = tmp_addr_2_reg_537;
        end else begin
            dram_write_req_apply_V_addr_din = 'bx;
        end
    end else begin
        dram_write_req_apply_V_addr_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op107_write_state3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op105_write_state3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        dram_write_req_apply_V_num1_update = 1'b1;
    end else begin
        dram_write_req_apply_V_num1_update = 1'b0;
    end
end

always @ (*) begin
    if ((((empty_n_6_reg_514 == 1'd0) & (empty_n_8_reg_528 == 1'd1) & (tmp_reg_484 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((empty_n_6_reg_514 == 1'd1) & (tmp_reg_484 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        dram_write_req_apply_V_num_blk_n = dram_write_req_apply_V_num_full_n;
    end else begin
        dram_write_req_apply_V_num_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_275)) begin
        if ((ap_predicate_op107_write_state3 == 1'b1)) begin
            dram_write_req_apply_V_num_din = tmp_num_reg_518;
        end else if ((ap_predicate_op105_write_state3 == 1'b1)) begin
            dram_write_req_apply_V_num_din = tmp_num_3_reg_532;
        end else begin
            dram_write_req_apply_V_num_din = 'bx;
        end
    end else begin
        dram_write_req_apply_V_num_din = 'bx;
    end
end

always @ (*) begin
    if ((((empty_n_6_reg_514 == 1'd0) & (empty_n_8_reg_528 == 1'd1) & (empty_n_10_reg_542 == 1'd1) & (tmp_reg_484 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((empty_n_6_reg_514 == 1'd1) & (empty_n_7_reg_551 == 1'd1) & (tmp_reg_484 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((tmp_6_reg_488 == 1'd0) & (empty_n_11_reg_496 == 1'd1) & (tmp_9_reg_492 == 1'd1) & (tmp_reg_484 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((empty_n_9_reg_505 == 1'd1) & (tmp_6_reg_488 == 1'd1) & (tmp_reg_484 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        dram_write_req_data_V_data_V_blk_n = dram_write_req_data_V_data_V_full_n;
    end else begin
        dram_write_req_data_V_data_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op108_write_state3 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op104_write_state3 == 1'b1)))) begin
        dram_write_req_data_V_data_V_din = reg_322;
    end else if ((((1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op106_write_state3 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op103_write_state3 == 1'b1)))) begin
        dram_write_req_data_V_data_V_din = reg_317;
    end else begin
        dram_write_req_data_V_data_V_din = 'bx;
    end
end

always @ (*) begin
    if ((((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op108_write_state3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op106_write_state3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op104_write_state3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op103_write_state3 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)))) begin
        dram_write_req_data_V_last1_update = 1'b1;
    end else begin
        dram_write_req_data_V_last1_update = 1'b0;
    end
end

always @ (*) begin
    if ((((empty_n_6_reg_514 == 1'd0) & (empty_n_8_reg_528 == 1'd1) & (empty_n_10_reg_542 == 1'd1) & (tmp_reg_484 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((empty_n_6_reg_514 == 1'd1) & (empty_n_7_reg_551 == 1'd1) & (tmp_reg_484 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((tmp_6_reg_488 == 1'd0) & (empty_n_11_reg_496 == 1'd1) & (tmp_9_reg_492 == 1'd1) & (tmp_reg_484 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((empty_n_9_reg_505 == 1'd1) & (tmp_6_reg_488 == 1'd1) & (tmp_reg_484 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        dram_write_req_data_V_last_blk_n = dram_write_req_data_V_last_full_n;
    end else begin
        dram_write_req_data_V_last_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_275)) begin
        if ((ap_predicate_op108_write_state3 == 1'b1)) begin
            dram_write_req_data_V_last_din = tmp_last_reg_555;
        end else if ((ap_predicate_op106_write_state3 == 1'b1)) begin
            dram_write_req_data_V_last_din = tmp_last_2_reg_546;
        end else if ((ap_predicate_op104_write_state3 == 1'b1)) begin
            dram_write_req_data_V_last_din = tmp_last_1_reg_509;
        end else if ((ap_predicate_op103_write_state3 == 1'b1)) begin
            dram_write_req_data_V_last_din = tmp_last_3_reg_500;
        end else begin
            dram_write_req_data_V_last_din = 'bx;
        end
    end else begin
        dram_write_req_data_V_last_din = 'bx;
    end
end

always @ (*) begin
    if (((tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & ((host_dram_write_req_apply_V_num_empty_n & host_dram_write_req_apply_V_addr_empty_n) == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))) begin
        host_dram_write_req_apply_V_num0_update = 1'b1;
    end else begin
        host_dram_write_req_apply_V_num0_update = 1'b0;
    end
end

always @ (*) begin
    if ((((host_dram_write_req_data_V_last_empty_n & host_dram_write_req_data_V_data_V_empty_n) == 1'b1) & (((empty_n_6_fu_395_p1 == 1'd1) & (tmp_fu_335_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001)) | ((tmp_fu_335_p2 == 1'd0) & (tmp_6_fu_341_p2 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001))))) begin
        host_dram_write_req_data_V_last0_update = 1'b1;
    end else begin
        host_dram_write_req_data_V_last0_update = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((dram_write_req_apply_V_num1_status == 1'b0) & (ap_predicate_op107_write_state3 == 1'b1)) | ((dram_write_req_apply_V_num1_status == 1'b0) & (ap_predicate_op105_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op108_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op106_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op104_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op103_write_state3 == 1'b1))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((dram_write_req_apply_V_num1_status == 1'b0) & (ap_predicate_op107_write_state3 == 1'b1)) | ((dram_write_req_apply_V_num1_status == 1'b0) & (ap_predicate_op105_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op108_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op106_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op104_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op103_write_state3 == 1'b1))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_enable_reg_pp0_iter1 == 1'b1) & (((dram_write_req_apply_V_num1_status == 1'b0) & (ap_predicate_op107_write_state3 == 1'b1)) | ((dram_write_req_apply_V_num1_status == 1'b0) & (ap_predicate_op105_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op108_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op106_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op104_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op103_write_state3 == 1'b1))));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = (((dram_write_req_apply_V_num1_status == 1'b0) & (ap_predicate_op107_write_state3 == 1'b1)) | ((dram_write_req_apply_V_num1_status == 1'b0) & (ap_predicate_op105_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op108_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op106_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op104_write_state3 == 1'b1)) | ((dram_write_req_data_V_last1_status == 1'b0) & (ap_predicate_op103_write_state3 == 1'b1)));
end

always @ (*) begin
    ap_condition_275 = ((1'b0 == ap_block_pp0_stage0_01001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0));
end

assign ap_done = 1'b0;

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_predicate_op103_write_state3 = ((tmp_6_reg_488 == 1'd0) & (empty_n_11_reg_496 == 1'd1) & (tmp_9_reg_492 == 1'd1) & (tmp_reg_484 == 1'd0));
end

always @ (*) begin
    ap_predicate_op104_write_state3 = ((empty_n_9_reg_505 == 1'd1) & (tmp_6_reg_488 == 1'd1) & (tmp_reg_484 == 1'd0));
end

always @ (*) begin
    ap_predicate_op105_write_state3 = ((empty_n_6_reg_514 == 1'd0) & (empty_n_8_reg_528 == 1'd1) & (tmp_reg_484 == 1'd1));
end

always @ (*) begin
    ap_predicate_op106_write_state3 = ((empty_n_6_reg_514 == 1'd0) & (empty_n_8_reg_528 == 1'd1) & (empty_n_10_reg_542 == 1'd1) & (tmp_reg_484 == 1'd1));
end

always @ (*) begin
    ap_predicate_op107_write_state3 = ((empty_n_6_reg_514 == 1'd1) & (tmp_reg_484 == 1'd1));
end

always @ (*) begin
    ap_predicate_op108_write_state3 = ((empty_n_6_reg_514 == 1'd1) & (empty_n_7_reg_551 == 1'd1) & (tmp_reg_484 == 1'd1));
end

assign ap_ready = 1'b0;

assign device_dram_write_req_apply_V_addr_read = device_dram_write_req_apply_V_num0_update;

assign device_dram_write_req_apply_V_num_read = device_dram_write_req_apply_V_num0_update;

assign device_dram_write_req_data_V_data_V_read = device_dram_write_req_data_V_last0_update;

assign device_dram_write_req_data_V_last_read = device_dram_write_req_data_V_last0_update;

assign dram_write_req_apply_V_addr_write = dram_write_req_apply_V_num1_update;

assign dram_write_req_apply_V_num1_status = (dram_write_req_apply_V_num_full_n & dram_write_req_apply_V_addr_full_n);

assign dram_write_req_apply_V_num_write = dram_write_req_apply_V_num1_update;

assign dram_write_req_data_V_data_V_write = dram_write_req_data_V_last1_update;

assign dram_write_req_data_V_last1_status = (dram_write_req_data_V_last_full_n & dram_write_req_data_V_data_V_full_n);

assign dram_write_req_data_V_last_write = dram_write_req_data_V_last1_update;

assign empty_n_1_nbread_fu_248_p3_0 = (device_dram_write_req_apply_V_num_empty_n & device_dram_write_req_apply_V_addr_empty_n);

assign empty_n_6_fu_395_p1 = empty_n_nbread_fu_240_p3_0;

assign empty_n_8_fu_407_p1 = empty_n_1_nbread_fu_248_p3_0;

assign empty_n_nbread_fu_240_p3_0 = (host_dram_write_req_apply_V_num_empty_n & host_dram_write_req_apply_V_addr_empty_n);

assign grp_fu_281_p1 = grp_nbread_fu_224_p3_0;

assign grp_fu_294_p1 = grp_nbread_fu_232_p3_0;

assign grp_fu_311_p0 = host_dram_write_req_data_V_last_dout;

assign grp_fu_311_p2 = (grp_fu_311_p0 ^ 1'd1);

assign grp_nbread_fu_224_p3_0 = (device_dram_write_req_data_V_last_empty_n & device_dram_write_req_data_V_data_V_empty_n);

assign grp_nbread_fu_232_p3_0 = (host_dram_write_req_data_V_last_empty_n & host_dram_write_req_data_V_data_V_empty_n);

assign host_dram_write_req_apply_V_addr_read = host_dram_write_req_apply_V_num0_update;

assign host_dram_write_req_apply_V_num_read = host_dram_write_req_apply_V_num0_update;

assign host_dram_write_req_data_V_data_V_read = host_dram_write_req_data_V_last0_update;

assign host_dram_write_req_data_V_last_read = host_dram_write_req_data_V_last0_update;

assign phitmp_i1_cast_fu_386_p1 = grp_fu_311_p2;

assign phitmp_i2_cast_cast_fu_436_p3 = ((tmp_last_2_fu_424_p2[0:0] === 1'b1) ? 8'd0 : 8'd2);

assign phitmp_i3_cast_cast_fu_368_p3 = ((tmp_last_3_fu_356_p2[0:0] === 1'b1) ? 8'd0 : 8'd2);

assign phitmp_i_cast_fu_454_p1 = grp_fu_311_p2;

assign tmp_2_i1_fu_362_p2 = ($signed(pending_flits_read_assign_1_fu_216) + $signed(8'd255));

assign tmp_2_i_fu_430_p2 = ($signed(device_dram_write_req_apply_V_num_dout) + $signed(8'd255));

assign tmp_6_fu_341_p2 = ((state_fu_220 == 8'd1) ? 1'b1 : 1'b0);

assign tmp_9_fu_347_p2 = ((state_fu_220 == 8'd2) ? 1'b1 : 1'b0);

assign tmp_fu_335_p2 = ((state_fu_220 == 8'd0) ? 1'b1 : 1'b0);

assign tmp_last_2_fu_424_p2 = ((device_dram_write_req_apply_V_num_dout == 8'd1) ? 1'b1 : 1'b0);

assign tmp_last_3_fu_356_p2 = ((pending_flits_read_assign_1_fu_216 == 8'd1) ? 1'b1 : 1'b0);

always @ (posedge ap_clk) begin
    state_fu_220[7:2] <= 6'b000000;
end

endmodule //dram_write_mux
