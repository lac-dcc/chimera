// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    CPU顶层模块
    Upd at 6.23: 增加FPU交互支持
*/

module mycpu_top(
    input[5:0]      ext_int,
    input           aclk,
    input           aresetn,
    //ar
    output[3:0]     arid,
    output[31:0]    araddr,
    output[3:0]     arlen,
    output[2:0]     arsize,
    output[1:0]     arburst,
    output[1:0]     arlock,
    output[3:0]     arcache,
    output[2:0]     arprot,
    output          arvalid,
    input           arready,
    //r
    input[3:0]      rid,
    input[31:0]     rdata,
    input[1:0]      rresp,
    input           rlast,
    input           rvalid,
    output          rready,
    //aw
    output[3:0]     awid,
    output[31:0]    awaddr,
    output[3:0]     awlen,
    output[2:0]     awsize,
    output[1:0]     awburst,
    output[1:0]     awlock,
    output[3:0]     awcache,
    output[2:0]     awprot,
    output          awvalid,
    input           awready,
    //w
    output[3:0]     wid,
    output[31:0]    wdata,
    output[3:0]     wstrb,
    output          wlast,
    output          wvalid,
    input           wready,
    //b
    input[3:0]      bid,
    input[1:0]      bresp,
    input           bvalid,
    output          bready,
    //debug
    output[31:0]    debug_wb_pc0,
    output          debug_wb_rf_wen0,
    output[4:0]     debug_wb_rf_wnum0,
    output[31:0]    debug_wb_rf_wdata0,
    output[31:0]    debug_wb_pc1,
    output          debug_wb_rf_wen1,
    output[4:0]     debug_wb_rf_wnum1,
    output[31:0]    debug_wb_rf_wdata1,
    //useless signals for submission
    output[31:0]    debug_wb_pc,
    output          debug_wb_rf_wen,
    output[4:0]     debug_wb_rf_wnum,
    output[31:0]    debug_wb_rf_wdata
    );

    wire flush;

    wire clk=aclk;
    wire resetn=aresetn;

    wire llbit_wen;
    wire llbit_newval;
    reg llbit;

    always@(posedge clk) begin
        if(~resetn)
            llbit<=0;
        else if(llbit_wen)
            llbit<=llbit_newval;
    end

    wire fpu_busy;
    wire[4:0] fpu_cp1_raddr;
    wire[31:0] fpu_cp1_rdata;
    wire fpu_tomdu_valid;
    wire[$clog2(`ROB_SIZE) - 1:0] fpu_tomdu_num;
    wire[31:0] fpu_tomdu_data;
    wire fpu_tomdu_bool_valid;
    wire[$clog2(`ROB_SIZE) - 1:0] fpu_tomdu_bool_num;
    wire fpu_tomdu_bool_data;
    wire fpu_tomu_valid;
    wire[$clog2(`ROB_SIZE) - 1:0] fpu_tomu_num;
    wire[63:0] fpu_tomu_data;
    
    //维护ROB中关于FPU的部分
    wire[$clog2(`ROB_SIZE) - 2:0] rob_head;
    wire  commit_en0;
    wire [$clog2(`ROB_SIZE)-1:0] commit_num0;
    wire  commit_en1;
    wire [$clog2(`ROB_SIZE)-1:0] commit_num1;

    reg[`ROB_SIZE / 2 - 1:0]    fpurob_ready0;
    reg[`ROB_SIZE / 2 - 1:0]    fpurob_ready1;
    reg[63:0]   fpurob_result0[0:`ROB_SIZE / 2 - 1];
    reg[63:0]   fpurob_result1[0:`ROB_SIZE / 2 - 1];
    //info: [4:0]=wprf0, [9:5]=wprf1, [13:10]=waddr, [13+cntexcode:14]=excode
    //[13+cntexcode+cntgctrl:14+cntexcode]=gctrl
    //[13+cntexcode+cntgctrl+fpecnt:14+cntexcode+cntgctrl]=fpeword
    reg[13 + $clog2(`CNT_EXCEPTION) + `FPU_GLOBAL_CNT + `FPECNT:0]  fpurob_info0[0:`ROB_SIZE / 2 - 1];
    reg[13 + $clog2(`CNT_EXCEPTION) + `FPU_GLOBAL_CNT + `FPECNT:0]  fpurob_info1[0:`ROB_SIZE / 2 - 1];
    
    wire[13 + $clog2(`CNT_EXCEPTION) + `FPU_GLOBAL_CNT + `FPECNT:0] fpurob_head_info0=fpurob_info0[rob_head];
    wire[13 + $clog2(`CNT_EXCEPTION) + `FPU_GLOBAL_CNT + `FPECNT:0] fpurob_head_info1=fpurob_info1[rob_head];

    wire          fpu_rob_wb_en;                  //写回fpu_rob使能
    wire[63:0]    fpu_rob_wb_result;              //虽然但是，这个涉及到如何commit，还是要写到fpu_rob中
    wire[$clog2(`ROB_SIZE) - 1:0] fpu_rob_wb_num;
    wire[3:0]     fpu_rob_wb_waddr;               //FPR
    wire[4:0]     fpu_rob_wb_wprf0;
    wire[4:0]     fpu_rob_wb_wprf1;
    wire[`FPU_GLOBAL_CNT - 1:0]   fpu_rob_wb_gctrl;           //注意：fpu_rob在此之前（一般）不知道该fpu指令控制信号，需要把Commit所需必要控制信号写回
    wire[$clog2(`CNT_EXCEPTION) - 1:0]    fpu_rob_wb_excode;  //只会报RI和FPE两种异常
    wire[`FPECNT - 1:0]           fpu_rob_wb_fpeword;         //浮点异常状态字
    wire[$clog2(`ROB_SIZE) - 2:0] fpu_rob_addr=fpu_rob_wb_num[$clog2(`ROB_SIZE) - 2:0];
    always@(posedge clk) begin
        if(fpu_rob_wb_en & fpu_rob_wb_num[$clog2(`ROB_SIZE) - 1]) begin
            fpurob_result1[fpu_rob_addr]<=fpu_rob_wb_result;
            fpurob_info1[fpu_rob_addr]<={fpu_rob_wb_fpeword,fpu_rob_wb_gctrl,fpu_rob_wb_excode,fpu_rob_wb_waddr,fpu_rob_wb_wprf1,fpu_rob_wb_wprf0};
        end
        if(fpu_rob_wb_en & ~fpu_rob_wb_num[$clog2(`ROB_SIZE) - 1]) begin
            fpurob_result0[fpu_rob_addr]<=fpu_rob_wb_result;
            fpurob_info0[fpu_rob_addr]<={fpu_rob_wb_fpeword,fpu_rob_wb_gctrl,fpu_rob_wb_excode,fpu_rob_wb_waddr,fpu_rob_wb_wprf1,fpu_rob_wb_wprf0};
        end
    end

    genvar i;
    generate
        for(i = 0; i < `ROB_SIZE / 2; i = i + 1) begin
            initial begin
                fpurob_result0[i]=0;
                fpurob_result1[i]=0;
                fpurob_info0[i]=0;
                fpurob_info1[i]=0;
            end
            always@(posedge clk) begin
                if(~resetn) begin
                    fpurob_ready0[i]<=0;
                    fpurob_ready1[i]<=0;
                end
                else begin
                    if(flush) begin
                        fpurob_ready0[i]<=0;
                        fpurob_ready1[i]<=0;
                    end
                    else begin
                        if((commit_en0 & (commit_num0[$clog2(`ROB_SIZE) - 2:0] == i)) | (fpu_rob_wb_en & (fpu_rob_wb_num == i)))
                            fpurob_ready0[i]<=(fpu_rob_wb_en & (fpu_rob_wb_num == i));
                        if((commit_en1 & (commit_num1[$clog2(`ROB_SIZE) - 2:0] == i)) | (fpu_rob_wb_en & (fpu_rob_wb_num == (i + `ROB_SIZE / 2))))
                            fpurob_ready1[i]<=(fpu_rob_wb_en & (fpu_rob_wb_num == (i + `ROB_SIZE / 2)));
                    end
                end
            end
        end
    endgenerate




    wire [3:0] arid0;
    wire [31:0] araddr0;
    wire [3:0] arlen0;
    wire [2:0] arsize0;
    wire [1:0] arburst0;
    wire [1:0] arlock0;
    wire [3:0] arcache0;
    wire [2:0] arprot0;
    wire  arvalid0;
    wire  arready0;
    wire [3:0] rid0;
    wire [31:0] rdata0;
    wire [1:0] rresp0;
    wire  rlast0;
    wire  rvalid0;
    wire  rready0;
    wire [3:0] arid1;
    wire [31:0] araddr1;
    wire [3:0] arlen1;
    wire [2:0] arsize1;
    wire [1:0] arburst1;
    wire [1:0] arlock1;
    wire [3:0] arcache1;
    wire [2:0] arprot1;
    wire  arvalid1;
    wire  arready1;
    wire [3:0] rid1;
    wire [31:0] rdata1;
    wire [1:0] rresp1;
    wire  rlast1;
    wire  rvalid1;
    wire  rready1;

    //aw
    wire[3:0]     awid1;
    wire[31:0]    awaddr1;
    wire[3:0]     awlen1;
    wire[2:0]     awsize1;
    wire[1:0]     awburst1;
    wire[1:0]     awlock1;
    wire[3:0]     awcache1;
    wire[2:0]     awprot1;
    wire          awvalid1;
    wire         awready1;
    //w
    wire[3:0]     wid1;
    wire[31:0]    wdata1;
    wire[3:0]     wstrb1;
    wire          wlast1;
    wire          wvalid1;
    wire         wready1;
    //b
    wire[3:0]    bid1;
    wire[1:0]    bresp1;
    wire         bvalid1;
    wire          bready1;

    interconnect intc(
        .clk(clk),
        .resetn(resetn),
        .arid(arid),
        .araddr(araddr),
        .arlen(arlen),
        .arsize(arsize),
        .arburst(arburst),
        .arlock(arlock),
        .arcache(arcache),
        .arprot(arprot),
        .arvalid(arvalid),
        .arready(arready),
        .rid(rid),
        .rdata(rdata),
        .rresp(rresp),
        .rlast(rlast),
        .rvalid(rvalid),
        .rready(rready),
        .arid0(arid0),
        .araddr0(araddr0),
        .arlen0(arlen0),
        .arsize0(arsize0),
        .arburst0(arburst0),
        .arlock0(arlock0),
        .arcache0(arcache0),
        .arprot0(arprot0),
        .arvalid0(arvalid0),
        .arready0(arready0),
        .rid0(rid0),
        .rdata0(rdata0),
        .rresp0(rresp0),
        .rlast0(rlast0),
        .rvalid0(rvalid0),
        .rready0(rready0),
        .arid1(arid1),
        .araddr1(araddr1),
        .arlen1(arlen1),
        .arsize1(arsize1),
        .arburst1(arburst1),
        .arlock1(arlock1),
        .arcache1(arcache1),
        .arprot1(arprot1),
        .arvalid1(arvalid1),
        .arready1(arready1),
        .rid1(rid1),
        .rdata1(rdata1),
        .rresp1(rresp1),
        .rlast1(rlast1),
        .rvalid1(rvalid1),
        .rready1(rready1),
        .awid1(awid1),
        .awaddr1(awaddr1),
        .awlen1(awlen1),
        .awsize1(awsize1),
        .awburst1(awburst1),
        .awlock1(awlock1),
        .awcache1(awcache1),
        .awprot1(awprot1),
        .awvalid1(awvalid1),
        .awready1(awready1),
        .wid1(wid1),
        .wdata1(wdata1),
        .wstrb1(wstrb1),
        .wlast1(wlast1),
        .wvalid1(wvalid1),
        .wready1(wready1),
        .bid1(bid1),
        .bresp1(bresp1),
        .bvalid1(bvalid1),
        .bready1(bready1),
        .awid(awid),
        .awaddr(awaddr),
        .awlen(awlen),
        .awsize(awsize),
        .awburst(awburst),
        .awlock(awlock),
        .awcache(awcache),
        .awprot(awprot),
        .awvalid(awvalid),
        .awready(awready),
        .wid(wid),
        .wdata(wdata),
        .wstrb(wstrb),
        .wlast(wlast),
        .wvalid(wvalid),
        .wready(wready),
        .bid(bid),
        .bresp(bresp),
        .bvalid(bvalid),
        .bready(bready)
    );

    wire [31:0] flush_target;
    wire [31:0] fetch_inst0;
    wire [31:0] fetch_inst1;
    wire  fetch_valid0;
    wire  fetch_valid1;
    wire [31:0] fetch_PC0;
    wire [31:0] fetch_PC1;
    wire  fetch_predict0;
    wire  fetch_predict1;
    wire [31:0] fetch_predict_target0;
    wire [31:0] fetch_predict_target1;
    wire [$clog2(`CNT_EXCEPTION)-1:0] fetch_excode0;
    wire [$clog2(`CNT_EXCEPTION)-1:0] fetch_excode1;
    wire [63:0] fetch_RAS;
    wire  fetch_output_en;
    wire [31:0] tlb_vaddr0;
    wire [31:0] tlb_paddr0;
    wire  tlb_isexist0;
    wire  tlb_isvalid0;
    wire tlb_uncached0;
    wire tlb_error0;
    wire  icache_clear_en;
    wire [31:0] icache_addr;
    wire  icache_index;
    wire  buffer_full;
    wire  predict_rden;
    wire [31:0] predict_PC0;
    wire [31:0] predict_PC1;
    wire  predict_PC1_valid;
    wire  predict_jump;
    wire [31:0] predict_jump_target;
    wire  predict_isinst1;
    wire [63:0] predict_oldRAS;
    wire[31:0] predict_target0,predict_target1;


    fetch Fetch_module(
        .clk(clk),
        .resetn(resetn),
        .arid(arid0),
        .araddr(araddr0),
        .arlen(arlen0),
        .arsize(arsize0),
        .arburst(arburst0),
        .arlock(arlock0),
        .arcache(arcache0),
        .arprot(arprot0),
        .arvalid(arvalid0),
        .arready(arready0),
        .rid(rid0),
        .rdata(rdata0),
        .rresp(rresp0),
        .rlast(rlast0),
        .rvalid(rvalid0),
        .rready(rready0),
        .flush(flush),
        .flush_target(flush_target),
        .fetch_inst0(fetch_inst0),
        .fetch_inst1(fetch_inst1),
        .fetch_valid0(fetch_valid0),
        .fetch_valid1(fetch_valid1),
        .fetch_PC0(fetch_PC0),
        .fetch_PC1(fetch_PC1),
        .fetch_predict0(fetch_predict0),
        .fetch_predict1(fetch_predict1),
        .fetch_predict_target0(fetch_predict_target0),
        .fetch_predict_target1(fetch_predict_target1),
        .fetch_excode0(fetch_excode0),
        .fetch_excode1(fetch_excode1),
        .fetch_RAS(fetch_RAS),
        .fetch_output_en(fetch_output_en),
        .tlb_vaddr(tlb_vaddr0),
        .tlb_paddr(tlb_paddr0),
        .tlb_isexist(tlb_isexist0),
        .tlb_isvalid(tlb_isvalid0),
        .tlb_uncached(tlb_uncached0),
        .tlb_error(tlb_error0),
        .icache_clear_en(icache_clear_en),
        .icache_addr(icache_addr),
        .icache_index(icache_index),
        .buffer_full(buffer_full),
        .predict_rden(predict_rden),
        .predict_PC0(predict_PC0),
        .predict_PC1(predict_PC1),
        .predict_PC1_valid(predict_PC1_valid),
        .predict_jump(predict_jump),
        .predict_jump_target(predict_jump_target),
        .predict_isinst1(predict_isinst1),
        .predict_oldRAS(predict_oldRAS),
        .predict_target0(predict_target0),
        .predict_target1(predict_target1)
    );

    wire RAS_flush;
    wire RAS_reset_en;
    wire[63:0] RAS_reset_data;
    wire RAS_push_en;
    wire[63:0] RAS_push_data;
    wire  predictor_wr_en;
    wire [31:0] predictor_wr_PC;
    wire [31:0] predictor_wr_target;
    wire  predictor_wr_isret;
    wire  predictor_wr_isjump;

    branch_predictor BranchPredictor_module(
        .clk(clk),
        .resetn(resetn),
        .predict_rden(predict_rden),
        .PC0(predict_PC0),
        .PC1(predict_PC1),
        .PC1_valid(predict_PC1_valid),
        .predict_jump(predict_jump),
        .predict_jump_target(predict_jump_target),
        .predict_isinst1(predict_isinst1),
        .RAS_old(predict_oldRAS),
        .RAS_flush(RAS_flush),
        .RAS_reset_en(RAS_reset_en),
        .RAS_reset_data(RAS_reset_data),
        .RAS_push_en(RAS_push_en),
        .RAS_push_data(RAS_push_data),
        .wr_en(predictor_wr_en),
        .wr_PC(predictor_wr_PC),
        .wr_target(predictor_wr_target),
        .wr_isret(predictor_wr_isret),
        .wr_isjump(predictor_wr_isjump),
        .predict_target0(predict_target0),
        .predict_target1(predict_target1)
    );

    wire  decode_busy;
    wire [63:0] buffer_RAS;
    wire  buffer_valid0;
    wire [31:0] buffer_PC0;
    wire [31:0] buffer_inst0;
    wire  buffer_predict0;
    wire [31:0] buffer_predict_target0;
    wire [$clog2(`CNT_EXCEPTION)-1:0] buffer_excode0;
    wire  buffer_valid1;
    wire [31:0] buffer_PC1;
    wire [31:0] buffer_inst1;
    wire  buffer_predict1;
    wire [31:0] buffer_predict_target1;
    wire [$clog2(`CNT_EXCEPTION)-1:0] buffer_excode1;

    buffer Buffer_module(
        .clk(clk),
        .resetn(resetn),
        .fetch_inst0(fetch_inst0),
        .fetch_inst1(fetch_inst1),
        .fetch_valid0(fetch_valid0),
        .fetch_valid1(fetch_valid1),
        .fetch_PC0(fetch_PC0),
        .fetch_PC1(fetch_PC1),
        .fetch_predict0(fetch_predict0),
        .fetch_predict1(fetch_predict1),
        .fetch_predict_target0(fetch_predict_target0),
        .fetch_predict_target1(fetch_predict_target1),
        .fetch_excode0(fetch_excode0),
        .fetch_excode1(fetch_excode1),
        .fetch_RAS(fetch_RAS),
        .fetch_output_en(fetch_output_en),
        .flush(flush),
        .buffer_full(buffer_full),
        .decode_busy(decode_busy),
        .buffer_RAS(buffer_RAS),
        .buffer_valid0(buffer_valid0),
        .buffer_PC0(buffer_PC0),
        .buffer_inst0(buffer_inst0),
        .buffer_predict0(buffer_predict0),
        .buffer_predict_target0(buffer_predict_target0),
        .buffer_excode0(buffer_excode0),
        .buffer_valid1(buffer_valid1),
        .buffer_PC1(buffer_PC1),
        .buffer_inst1(buffer_inst1),
        .buffer_predict1(buffer_predict1),
        .buffer_predict_target1(buffer_predict_target1),
        .buffer_excode1(buffer_excode1)
    );

    wire rename_busy;
    wire  decode_valid0;
    wire  decode_valid1;
    wire [31:0] decode_inst0;
    wire [31:0] decode_inst1;
    wire [31:0] decode_PC0;
    wire [31:0] decode_PC1;
    wire [63:0] decode_RAS;
    wire  decode_predict0;
    wire [31:0] decode_predict_target0;
    wire  decode_predict1;
    wire [31:0] decode_predict_target1;
    wire [`CNT_FU-1:0] decode_futype0;
    wire [$clog2(`CNT_ALUOP)-1:0] decode_aluop0;
    wire [`CNT_MDUOP-1:0] decode_mduop0;
    wire [$clog2(`CNT_MUOP)-1:0] decode_muop0;
    wire [`CNT_CTRL-1:0] decode_ctrl0;
    wire [$clog2(`CNT_CMP)-1:0] decode_cmpop0;
    wire [$clog2(`CNT_EXCEPTION)-1:0] decode_excode0;
    wire [4:0] decode_rs0;
    wire [4:0] decode_rt0;
    wire [4:0] decode_real_rd0;
    wire [5:0] decode_cp0addr0;
    wire [`CNT_FU-1:0] decode_futype1;
    wire [$clog2(`CNT_ALUOP)-1:0] decode_aluop1;
    wire [`CNT_MDUOP-1:0] decode_mduop1;
    wire [$clog2(`CNT_MUOP)-1:0] decode_muop1;
    wire [`CNT_CTRL-1:0] decode_ctrl1;
    wire [$clog2(`CNT_CMP)-1:0] decode_cmpop1;
    wire [$clog2(`CNT_EXCEPTION)-1:0] decode_excode1;
    wire [4:0] decode_rs1;
    wire [4:0] decode_rt1;
    wire [4:0] decode_real_rd1;
    wire [5:0] decode_cp0addr1;
    wire decode_nop0,decode_nop1;

    wire decode_fpuvalid0;
    wire decode_fpuvalid1;

    wire cp0_en;

    wire decode_cannotissue=rename_busy | (decode_valid0 & decode_fpuvalid0 & decode_valid1 & decode_fpuvalid1) | (((decode_valid0 & decode_fpuvalid0) | (decode_valid1 & decode_fpuvalid1)) & fpu_busy);

    decode Decode_module(
        .clk(clk),
        .resetn(resetn),
        .buffer_RAS(buffer_RAS),
        .buffer_valid0(buffer_valid0),
        .buffer_PC0(buffer_PC0),
        .buffer_inst0(buffer_inst0),
        .buffer_predict0(buffer_predict0),
        .buffer_predict_target0(buffer_predict_target0),
        .buffer_excode0(buffer_excode0),
        .buffer_valid1(buffer_valid1),
        .buffer_PC1(buffer_PC1),
        .buffer_inst1(buffer_inst1),
        .buffer_predict1(buffer_predict1),
        .buffer_predict_target1(buffer_predict_target1),
        .buffer_excode1(buffer_excode1),
        .decode_busy(decode_busy),
        //Note: 这里当FPU忙或者两路都是FPU的时候阻塞
        .rename_busy(decode_cannotissue),
        .RAS_push_en(RAS_push_en),
        .RAS_push_data(RAS_push_data),
        .flush(flush),
        .llbit(llbit),
        .cp0_en(cp0_en),
        .decode_valid0(decode_valid0),
        .decode_valid1(decode_valid1),
        .decode_inst0(decode_inst0),
        .decode_inst1(decode_inst1),
        .decode_PC0(decode_PC0),
        .decode_PC1(decode_PC1),
        .decode_RAS(decode_RAS),
        .decode_predict0(decode_predict0),
        .decode_predict_target0(decode_predict_target0),
        .decode_predict1(decode_predict1),
        .decode_predict_target1(decode_predict_target1),
        .decode_futype0(decode_futype0),
        .decode_aluop0(decode_aluop0),
        .decode_mduop0(decode_mduop0),
        .decode_muop0(decode_muop0),
        .decode_ctrl0(decode_ctrl0),
        .decode_cmpop0(decode_cmpop0),
        .decode_excode0(decode_excode0),
        .decode_rs0(decode_rs0),
        .decode_rt0(decode_rt0),
        .decode_real_rd0(decode_real_rd0),
        .decode_cp0addr0(decode_cp0addr0),
        .decode_futype1(decode_futype1),
        .decode_aluop1(decode_aluop1),
        .decode_mduop1(decode_mduop1),
        .decode_muop1(decode_muop1),
        .decode_ctrl1(decode_ctrl1),
        .decode_cmpop1(decode_cmpop1),
        .decode_excode1(decode_excode1),
        .decode_rs1(decode_rs1),
        .decode_rt1(decode_rt1),
        .decode_real_rd1(decode_real_rd1),
        .decode_cp0addr1(decode_cp0addr1),
        .decode_nop0(decode_nop0),
        .decode_nop1(decode_nop1),
        
        .decode_fpuvalid0(decode_fpuvalid0),
        .decode_fpuvalid1(decode_fpuvalid1),
        .fpu_fetched((~rename_busy) & (~fpu_busy))
    );


    wire  dispatch_busy;
    wire  rob_full;
    wire [$clog2(`ROB_SIZE)-2:0] rob_tail;
    wire  rob_push_en;
    wire [63:0] rob_RAS;
    wire  rob_valid0;
    wire [31:0] rob_PC0;
    wire [`CNT_FU-1:0] rob_futype0;
    wire [`CNT_CTRL-1:0] rob_ctrl0;
    wire [4:0] rob_waddr0;
    wire [5:0] rob_cp0addr0;
    wire  rob_valid1;
    wire [31:0] rob_PC1;
    wire [`CNT_FU-1:0] rob_futype1;
    wire [`CNT_CTRL-1:0] rob_ctrl1;
    wire [4:0] rob_waddr1;
    wire [5:0] rob_cp0addr1;
    wire rob_nop0,rob_nop1;

    wire  rename_valid0;
    wire [31:0] rename_PC0;
    wire [31:0] rename_inst0;
    wire  rename_predict0;
    wire [31:0] rename_predict_target0;
    wire [`CNT_FU-1:0] rename_futype0;
    wire [$clog2(`CNT_ALUOP)-1:0] rename_aluop0;
    wire [`CNT_MDUOP-1:0] rename_mduop0;
    wire [$clog2(`CNT_MUOP)-1:0] rename_muop0;
    wire [`CNT_CTRL-1:0] rename_ctrl0;
    wire [$clog2(`CNT_CMP)-1:0] rename_cmpop0;
    wire [$clog2(`CNT_EXCEPTION)-1:0] rename_excode0;
    wire [$clog2(`ROB_SIZE)-1:0] rename_num0;
    wire  rename_readyrs0;
    wire  rename_readyrt0;
    wire [31:0] rename_rsval0;
    wire [31:0] rename_rtval0;
    wire [$clog2(`ROB_SIZE)-1:0] rename_rsnum0;
    wire [$clog2(`ROB_SIZE)-1:0] rename_rtnum0;
    wire [5:0] rename_cp0addr0;
    wire  rename_valid1;
    wire [31:0] rename_PC1;
    wire [31:0] rename_inst1;
    wire  rename_predict1;
    wire [31:0] rename_predict_target1;
    wire [`CNT_FU-1:0] rename_futype1;
    wire [$clog2(`CNT_ALUOP)-1:0] rename_aluop1;
    wire [`CNT_MDUOP-1:0] rename_mduop1;
    wire [$clog2(`CNT_MUOP)-1:0] rename_muop1;
    wire [`CNT_CTRL-1:0] rename_ctrl1;
    wire [$clog2(`CNT_CMP)-1:0] rename_cmpop1;
    wire [$clog2(`CNT_EXCEPTION)-1:0] rename_excode1;
    wire [$clog2(`ROB_SIZE)-1:0] rename_num1;
    wire  rename_readyrs1;
    wire  rename_readyrt1;
    wire [31:0] rename_rsval1;
    wire [31:0] rename_rtval1;
    wire [$clog2(`ROB_SIZE)-1:0] rename_rsnum1;
    wire [$clog2(`ROB_SIZE)-1:0] rename_rtnum1;
    wire [5:0] rename_cp0addr1;

    wire [4:0] gpr_raddr0;
    wire [4:0] gpr_raddr1;
    wire [4:0] gpr_raddr2;
    wire [4:0] gpr_raddr3;
    wire [31:0] gpr_rdata0;
    wire [31:0] gpr_rdata1;
    wire [31:0] gpr_rdata2;
    wire [31:0] gpr_rdata3;
    wire [$clog2(`ROB_SIZE)-1:0] gpr_rnum0;
    wire [$clog2(`ROB_SIZE)-1:0] gpr_rnum1;
    wire [$clog2(`ROB_SIZE)-1:0] gpr_rnum2;
    wire [$clog2(`ROB_SIZE)-1:0] gpr_rnum3;
    wire  gpr_rbusy0;
    wire  gpr_rbusy1;
    wire  gpr_rbusy2;
    wire  gpr_rbusy3;
    wire [4:0] gpr_waddr0;
    wire  gpr_wen0;
    wire [$clog2(`ROB_SIZE)-1:0] gpr_wnum0;
    wire [4:0] gpr_waddr1;
    wire  gpr_wen1;
    wire [$clog2(`ROB_SIZE)-1:0] gpr_wnum1;

    rename Rename_module(
        .clk(clk),
        .resetn(resetn),
        .decode_cannotissue(decode_cannotissue),
        .decode_valid0(decode_valid0),
        .decode_valid1(decode_valid1),
        .decode_inst0(decode_inst0),
        .decode_inst1(decode_inst1),
        .decode_PC0(decode_PC0),
        .decode_PC1(decode_PC1),
        .decode_RAS(decode_RAS),
        .decode_predict0(decode_predict0),
        .decode_predict_target0(decode_predict_target0),
        .decode_predict1(decode_predict1),
        .decode_predict_target1(decode_predict_target1),
        .decode_futype0(decode_futype0),
        .decode_aluop0(decode_aluop0),
        .decode_mduop0(decode_mduop0),
        .decode_muop0(decode_muop0),
        .decode_ctrl0(decode_ctrl0),
        .decode_cmpop0(decode_cmpop0),
        .decode_excode0(decode_excode0),
        .decode_rs0(decode_rs0),
        .decode_rt0(decode_rt0),
        .decode_real_rd0(decode_real_rd0),
        .decode_cp0addr0(decode_cp0addr0),
        .decode_futype1(decode_futype1),
        .decode_aluop1(decode_aluop1),
        .decode_mduop1(decode_mduop1),
        .decode_muop1(decode_muop1),
        .decode_ctrl1(decode_ctrl1),
        .decode_cmpop1(decode_cmpop1),
        .decode_excode1(decode_excode1),
        .decode_rs1(decode_rs1),
        .decode_rt1(decode_rt1),
        .decode_real_rd1(decode_real_rd1),
        .decode_cp0addr1(decode_cp0addr1),
        .decode_nop0(decode_nop0),
        .decode_nop1(decode_nop1),
        .flush(flush),
        .raddr0(gpr_raddr0),
        .raddr1(gpr_raddr1),
        .raddr2(gpr_raddr2),
        .raddr3(gpr_raddr3),
        .rdata0(gpr_rdata0),
        .rdata1(gpr_rdata1),
        .rdata2(gpr_rdata2),
        .rdata3(gpr_rdata3),
        .rnum0(gpr_rnum0),
        .rnum1(gpr_rnum1),
        .rnum2(gpr_rnum2),
        .rnum3(gpr_rnum3),
        .rbusy0(gpr_rbusy0),
        .rbusy1(gpr_rbusy1),
        .rbusy2(gpr_rbusy2),
        .rbusy3(gpr_rbusy3),
        .waddr0(gpr_waddr0),
        .wen0(gpr_wen0),
        .wnum0(gpr_wnum0),
        .waddr1(gpr_waddr1),
        .wen1(gpr_wen1),
        .wnum1(gpr_wnum1),
        .rename_busy(rename_busy),
        .dispatch_busy(dispatch_busy),
        .rob_full(rob_full),
        .rob_tail(rob_tail),
        .rob_push_en(rob_push_en),
        .rob_RAS(rob_RAS),
        .rob_valid0(rob_valid0),
        .rob_PC0(rob_PC0),
        .rob_futype0(rob_futype0),
        .rob_ctrl0(rob_ctrl0),
        .rob_waddr0(rob_waddr0),
        .rob_cp0addr0(rob_cp0addr0),
        .rob_valid1(rob_valid1),
        .rob_PC1(rob_PC1),
        .rob_futype1(rob_futype1),
        .rob_ctrl1(rob_ctrl1),
        .rob_waddr1(rob_waddr1),
        .rob_cp0addr1(rob_cp0addr1),
        .rob_nop0(rob_nop0),
        .rob_nop1(rob_nop1),
        .rename_valid0(rename_valid0),
        .rename_PC0(rename_PC0),
        .rename_inst0(rename_inst0),
        .rename_predict0(rename_predict0),
        .rename_predict_target0(rename_predict_target0),
        .rename_futype0(rename_futype0),
        .rename_aluop0(rename_aluop0),
        .rename_mduop0(rename_mduop0),
        .rename_muop0(rename_muop0),
        .rename_ctrl0(rename_ctrl0),
        .rename_cmpop0(rename_cmpop0),
        .rename_excode0(rename_excode0),
        .rename_num0(rename_num0),
        .rename_readyrs0(rename_readyrs0),
        .rename_readyrt0(rename_readyrt0),
        .rename_rsval0(rename_rsval0),
        .rename_rtval0(rename_rtval0),
        .rename_rsnum0(rename_rsnum0),
        .rename_rtnum0(rename_rtnum0),
        .rename_cp0addr0(rename_cp0addr0),
        .rename_valid1(rename_valid1),
        .rename_PC1(rename_PC1),
        .rename_inst1(rename_inst1),
        .rename_predict1(rename_predict1),
        .rename_predict_target1(rename_predict_target1),
        .rename_futype1(rename_futype1),
        .rename_aluop1(rename_aluop1),
        .rename_mduop1(rename_mduop1),
        .rename_muop1(rename_muop1),
        .rename_ctrl1(rename_ctrl1),
        .rename_cmpop1(rename_cmpop1),
        .rename_excode1(rename_excode1),
        .rename_num1(rename_num1),
        .rename_readyrs1(rename_readyrs1),
        .rename_readyrt1(rename_readyrt1),
        .rename_rsval1(rename_rsval1),
        .rename_rtval1(rename_rtval1),
        .rename_rsnum1(rename_rsnum1),
        .rename_rtnum1(rename_rtnum1),
        .rename_cp0addr1(rename_cp0addr1)
    );

    wire [4:0] gpr_commit_addr0;
    wire [$clog2(`ROB_SIZE)-1:0] gpr_commit_num0;
    wire  gpr_commit_en0;
    wire [4:0] gpr_commit_addr1;
    wire [$clog2(`ROB_SIZE)-1:0] gpr_commit_num1;
    wire  gpr_commit_en1;

    gpr_table GPR_Table_module(
        .clk(clk),
        .resetn(resetn),
        .flush(flush),
        .raddr0(gpr_raddr0),
        .rnum0(gpr_rnum0),
        .rbusy0(gpr_rbusy0),
        .raddr1(gpr_raddr1),
        .rnum1(gpr_rnum1),
        .rbusy1(gpr_rbusy1),
        .raddr2(gpr_raddr2),
        .rnum2(gpr_rnum2),
        .rbusy2(gpr_rbusy2),
        .raddr3(gpr_raddr3),
        .rnum3(gpr_rnum3),
        .rbusy3(gpr_rbusy3),
        .waddr0(gpr_waddr0),
        .wen0(gpr_wen0),
        .wnum0(gpr_wnum0),
        .waddr1(gpr_waddr1),
        .wen1(gpr_wen1),
        .wnum1(gpr_wnum1),
        .commit_addr0(gpr_commit_addr0),
        .commit_num0(gpr_commit_num0),
        .commit_en0(gpr_commit_en0),
        .commit_addr1(gpr_commit_addr1),
        .commit_num1(gpr_commit_num1),
        .commit_en1(gpr_commit_en1)
    );

    wire [4:0] arf_waddr0;
    wire  arf_wen0;
    wire [31:0] arf_wdata0;
    wire [4:0] arf_waddr1;
    wire  arf_wen1;
    wire [31:0] arf_wdata1;
    assign debug_wb_rf_wdata0=arf_wdata0;
    assign debug_wb_rf_wdata1=arf_wdata1;
    assign debug_wb_rf_wen0=arf_wen0;
    assign debug_wb_rf_wen1=arf_wen1;
    assign debug_wb_rf_wnum0=arf_waddr0;
    assign debug_wb_rf_wnum1=arf_waddr1;
    assign gpr_commit_en0=arf_wen0;
    assign gpr_commit_en1=arf_wen1;
    assign gpr_commit_addr0=arf_waddr0;
    assign gpr_commit_addr1=arf_waddr1;

    arf ARF_module(
        .clk(clk),
        .resetn(resetn),
        .raddr0(gpr_raddr0),
        .rdata0(gpr_rdata0),
        .raddr1(gpr_raddr1),
        .rdata1(gpr_rdata1),
        .raddr2(gpr_raddr2),
        .rdata2(gpr_rdata2),
        .raddr3(gpr_raddr3),
        .rdata3(gpr_rdata3),
        .waddr0(arf_waddr0),
        .wen0(arf_wen0),
        .wdata0(arf_wdata0),
        .waddr1(arf_waddr1),
        .wen1(arf_wen1),
        .wdata1(arf_wdata1)
    );

    wire [$clog2(`ROB_SIZE)-1:0] rob_raddr0;
    wire [$clog2(`ROB_SIZE)-1:0] rob_raddr1;
    wire [$clog2(`ROB_SIZE)-1:0] rob_raddr2;
    wire [$clog2(`ROB_SIZE)-1:0] rob_raddr3;
    wire [31:0] rob_rdata0;
    wire [31:0] rob_rdata1;
    wire [31:0] rob_rdata2;
    wire [31:0] rob_rdata3;
    wire  rob_ready0;
    wire  rob_ready1;
    wire  rob_ready2;
    wire  rob_ready3;
    wire [`STATION_ALU_SIZE-1:0] station_alu0_valid;
    wire [`STATION_ALU_SIZE-1:0] station_alu1_valid;
    wire [`STATION_MDU_SIZE-1:0] station_mdu_valid;
    wire [`STATION_MU_SIZE-1:0] station_mu_valid;
    wire [`STATION_ALU_SIZE-1:0] station_alu0_wen0;
    wire [`STATION_ALU_SIZE-1:0] station_alu1_wen0;
    wire [`STATION_MU_SIZE-1:0] station_mu_wen0;
    wire [`STATION_MDU_SIZE-1:0] station_mdu_wen0;
    wire [`STATION_ALU_SIZE-1:0] station_alu0_wen1;
    wire [`STATION_ALU_SIZE-1:0] station_alu1_wen1;
    wire [`STATION_MU_SIZE-1:0] station_mu_wen1;
    wire [`STATION_MDU_SIZE-1:0] station_mdu_wen1;
    wire [3:0] alu0_mask;
    wire [3:0] alu1_mask;
    wire [2:0] mu_mask;
    wire [1:0] mdu_mask;
    wire [31:0] dispatch_PC0;
    wire [31:0] dispatch_inst0;
    wire  dispatch_predict0;
    wire [31:0] dispatch_predict_target0;
    wire [`CNT_FU-1:0] dispatch_futype0;
    wire [$clog2(`CNT_ALUOP)-1:0] dispatch_aluop0;
    wire [`CNT_MDUOP-1:0] dispatch_mduop0;
    wire [$clog2(`CNT_MUOP)-1:0] dispatch_muop0;
    wire [`CNT_CTRL-1:0] dispatch_ctrl0;
    wire [$clog2(`CNT_CMP)-1:0] dispatch_cmpop0;
    wire [$clog2(`CNT_EXCEPTION)-1:0] dispatch_excode0;
    wire [$clog2(`ROB_SIZE)-1:0] dispatch_num0;
    wire  dispatch_readyrs0;
    wire  dispatch_readyrt0;
    wire [31:0] dispatch_rsval0;
    wire [31:0] dispatch_rtval0;
    wire [$clog2(`ROB_SIZE)-1:0] dispatch_rsnum0;
    wire [$clog2(`ROB_SIZE)-1:0] dispatch_rtnum0;
    wire [5:0] dispatch_cp0addr0;
    wire [31:0] dispatch_PC1;
    wire [31:0] dispatch_inst1;
    wire  dispatch_predict1;
    wire [31:0] dispatch_predict_target1;
    wire [`CNT_FU-1:0] dispatch_futype1;
    wire [$clog2(`CNT_ALUOP)-1:0] dispatch_aluop1;
    wire [`CNT_MDUOP-1:0] dispatch_mduop1;
    wire [$clog2(`CNT_MUOP)-1:0] dispatch_muop1;
    wire [`CNT_CTRL-1:0] dispatch_ctrl1;
    wire [$clog2(`CNT_CMP)-1:0] dispatch_cmpop1;
    wire [$clog2(`CNT_EXCEPTION)-1:0] dispatch_excode1;
    wire [$clog2(`ROB_SIZE)-1:0] dispatch_num1;
    wire  dispatch_readyrs1;
    wire  dispatch_readyrt1;
    wire [31:0] dispatch_rsval1;
    wire [31:0] dispatch_rtval1;
    wire [$clog2(`ROB_SIZE)-1:0] dispatch_rsnum1;
    wire [$clog2(`ROB_SIZE)-1:0] dispatch_rtnum1;
    wire [5:0] dispatch_cp0addr1;

    dispatch Dispatch_module(
        .clk(clk),
        .resetn(resetn),
        .rename_valid0(rename_valid0),
        .rename_PC0(rename_PC0),
        .rename_inst0(rename_inst0),
        .rename_predict0(rename_predict0),
        .rename_predict_target0(rename_predict_target0),
        .rename_futype0(rename_futype0),
        .rename_aluop0(rename_aluop0),
        .rename_mduop0(rename_mduop0),
        .rename_muop0(rename_muop0),
        .rename_ctrl0(rename_ctrl0),
        .rename_cmpop0(rename_cmpop0),
        .rename_excode0(rename_excode0),
        .rename_num0(rename_num0),
        .rename_readyrs0(rename_readyrs0),
        .rename_readyrt0(rename_readyrt0),
        .rename_rsval0(rename_rsval0),
        .rename_rtval0(rename_rtval0),
        .rename_rsnum0(rename_rsnum0),
        .rename_rtnum0(rename_rtnum0),
        .rename_cp0addr0(rename_cp0addr0),
        .rename_valid1(rename_valid1),
        .rename_PC1(rename_PC1),
        .rename_inst1(rename_inst1),
        .rename_predict1(rename_predict1),
        .rename_predict_target1(rename_predict_target1),
        .rename_futype1(rename_futype1),
        .rename_aluop1(rename_aluop1),
        .rename_mduop1(rename_mduop1),
        .rename_muop1(rename_muop1),
        .rename_ctrl1(rename_ctrl1),
        .rename_cmpop1(rename_cmpop1),
        .rename_excode1(rename_excode1),
        .rename_num1(rename_num1),
        .rename_readyrs1(rename_readyrs1),
        .rename_readyrt1(rename_readyrt1),
        .rename_rsval1(rename_rsval1),
        .rename_rtval1(rename_rtval1),
        .rename_rsnum1(rename_rsnum1),
        .rename_rtnum1(rename_rtnum1),
        .rename_cp0addr1(rename_cp0addr1),
        .dispatch_busy(dispatch_busy),
        .flush(flush),
        .rob_raddr0(rob_raddr0),
        .rob_raddr1(rob_raddr1),
        .rob_raddr2(rob_raddr2),
        .rob_raddr3(rob_raddr3),
        .rob_rdata0(rob_rdata0),
        .rob_rdata1(rob_rdata1),
        .rob_rdata2(rob_rdata2),
        .rob_rdata3(rob_rdata3),
        .rob_ready0(rob_ready0),
        .rob_ready1(rob_ready1),
        .rob_ready2(rob_ready2),
        .rob_ready3(rob_ready3),
        .station_alu0_valid(station_alu0_valid),
        .station_alu1_valid(station_alu1_valid),
        .station_mdu_valid(station_mdu_valid),
        .station_mu_valid(station_mu_valid),
        .station_alu0_wen0(station_alu0_wen0),
        .station_alu1_wen0(station_alu1_wen0),
        .station_mu_wen0(station_mu_wen0),
        .station_mdu_wen0(station_mdu_wen0),
        .station_alu0_wen1(station_alu0_wen1),
        .station_alu1_wen1(station_alu1_wen1),
        .station_mu_wen1(station_mu_wen1),
        .station_mdu_wen1(station_mdu_wen1),
        .alu0_mask(alu0_mask),
        .alu1_mask(alu1_mask),
        .mu_mask(mu_mask),
        .mdu_mask(mdu_mask),
        .dispatch_PC0(dispatch_PC0),
        .dispatch_inst0(dispatch_inst0),
        .dispatch_predict0(dispatch_predict0),
        .dispatch_predict_target0(dispatch_predict_target0),
        .dispatch_futype0(dispatch_futype0),
        .dispatch_aluop0(dispatch_aluop0),
        .dispatch_mduop0(dispatch_mduop0),
        .dispatch_muop0(dispatch_muop0),
        .dispatch_ctrl0(dispatch_ctrl0),
        .dispatch_cmpop0(dispatch_cmpop0),
        .dispatch_excode0(dispatch_excode0),
        .dispatch_num0(dispatch_num0),
        .dispatch_readyrs0(dispatch_readyrs0),
        .dispatch_readyrt0(dispatch_readyrt0),
        .dispatch_rsval0(dispatch_rsval0),
        .dispatch_rtval0(dispatch_rtval0),
        .dispatch_rsnum0(dispatch_rsnum0),
        .dispatch_rtnum0(dispatch_rtnum0),
        .dispatch_cp0addr0(dispatch_cp0addr0),
        .dispatch_PC1(dispatch_PC1),
        .dispatch_inst1(dispatch_inst1),
        .dispatch_predict1(dispatch_predict1),
        .dispatch_predict_target1(dispatch_predict_target1),
        .dispatch_futype1(dispatch_futype1),
        .dispatch_aluop1(dispatch_aluop1),
        .dispatch_mduop1(dispatch_mduop1),
        .dispatch_muop1(dispatch_muop1),
        .dispatch_ctrl1(dispatch_ctrl1),
        .dispatch_cmpop1(dispatch_cmpop1),
        .dispatch_excode1(dispatch_excode1),
        .dispatch_num1(dispatch_num1),
        .dispatch_readyrs1(dispatch_readyrs1),
        .dispatch_readyrt1(dispatch_readyrt1),
        .dispatch_rsval1(dispatch_rsval1),
        .dispatch_rtval1(dispatch_rtval1),
        .dispatch_rsnum1(dispatch_rsnum1),
        .dispatch_rtnum1(dispatch_rtnum1),
        .dispatch_cp0addr1(dispatch_cp0addr1)
    );

    wire  mu_busy;
    wire  mdu_busy;
    wire  alu0_execute_wakeup_en;
    wire [$clog2(`ROB_SIZE)-1:0] alu0_execute_wakeup_num;
    wire  alu1_execute_wakeup_en;
    wire [$clog2(`ROB_SIZE)-1:0] alu1_execute_wakeup_num;
    wire  mu_mem_wakeup_en;
    wire [$clog2(`ROB_SIZE)-1:0] mu_mem_wakeup_num;
    wire  alu0_writeback_wakeup_en;
    wire [$clog2(`ROB_SIZE)-1:0] alu0_writeback_wakeup_num;
    wire [31:0] alu0_writeback_wakeup_data;
    wire  alu1_writeback_wakeup_en;
    wire [$clog2(`ROB_SIZE)-1:0] alu1_writeback_wakeup_num;
    wire [31:0] alu1_writeback_wakeup_data;
    wire  mu_writeback_wakeup_en;
    wire [$clog2(`ROB_SIZE)-1:0] mu_writeback_wakeup_num;
    wire [31:0] mu_writeback_wakeup_data;
    wire  mdu_writeback_wakeup_en;
    wire [$clog2(`ROB_SIZE)-1:0] mdu_writeback_wakeup_num;
    wire [31:0] mdu_writeback_wakeup_data;
    wire  selalu0_valid;
    wire [31:0] selalu0_PC;
    wire [31:0] selalu0_inst;
    wire [$clog2(`CNT_ALUOP)-1:0] selalu0_aluop;
    wire [`CNT_CTRL-1:0] selalu0_ctrl;
    wire [$clog2(`CNT_CMP)-1:0] selalu0_cmpop;
    wire [$clog2(`CNT_EXCEPTION)-1:0] selalu0_excode;
    wire  selalu0_predict;
    wire [31:0] selalu0_predict_target;
    wire [$clog2(`ROB_SIZE)-1:0] selalu0_rsnum;
    wire [$clog2(`ROB_SIZE)-1:0] selalu0_rtnum;
    wire [31:0] selalu0_rsval;
    wire [31:0] selalu0_rtval;
    wire  selalu0_rsval_ready;
    wire  selalu0_rtval_ready;
    wire [$clog2(`ROB_SIZE)-1:0] selalu0_destnum;
    wire  selalu1_valid;
    wire [31:0] selalu1_PC;
    wire [31:0] selalu1_inst;
    wire [$clog2(`CNT_ALUOP)-1:0] selalu1_aluop;
    wire [`CNT_CTRL-1:0] selalu1_ctrl;
    wire [$clog2(`CNT_CMP)-1:0] selalu1_cmpop;
    wire [$clog2(`CNT_EXCEPTION)-1:0] selalu1_excode;
    wire  selalu1_predict;
    wire [31:0] selalu1_predict_target;
    wire [$clog2(`ROB_SIZE)-1:0] selalu1_rsnum;
    wire [$clog2(`ROB_SIZE)-1:0] selalu1_rtnum;
    wire [31:0] selalu1_rsval;
    wire [31:0] selalu1_rtval;
    wire  selalu1_rsval_ready;
    wire  selalu1_rtval_ready;
    wire [$clog2(`ROB_SIZE)-1:0] selalu1_destnum;
    wire  selmu_valid;
    //wire [31:0] selmu_inst;
    wire [$clog2(`CNT_MUOP)-1:0] selmu_muop;
    wire  selmu_isload;
    wire  selmu_isstore;
    wire  selmu_cachewb;
    wire  selmu_wen;
    wire [$clog2(`ROB_SIZE)-1:0] selmu_rsnum;
    wire [$clog2(`ROB_SIZE)-1:0] selmu_rtnum;
    wire [31:0] selmu_rsval;
    wire [31:0] selmu_rtval;
    wire  selmu_rsval_ready;
    wire  selmu_rtval_ready;
    wire [$clog2(`ROB_SIZE)-1:0] selmu_destnum;
    wire  selmdu_valid;
    wire [`CNT_MDUOP-1:0] selmdu_mduop;
    wire [31:0] selmdu_rsval;
    wire [31:0] selmdu_rtval;
    wire [5:0] selmdu_cp0addr;
    wire [$clog2(`ROB_SIZE)-1:0] selmdu_destnum;
    wire premem_wakeup_en;
    wire[$clog2(`ROB_SIZE) - 1:0] premem_wakeup_num;
    wire mdu_wakeup_en;
    wire[$clog2(`ROB_SIZE) - 1:0] mdu_wakeup_num;
    wire[31:0] mdu_wakeup_data;

    wire[16:0] selmu_offset;
    wire selmu_tofpu;
    wire selmu_tofpu_notlast;
    wire selmdu_fromfpu_bool;
    wire[31:0] selmdu_fromfpu_data;
    wire mdu_to_fpu_valid;
    wire[31:0] mdu_to_fpu_data;
    wire[$clog2(`ROB_SIZE) - 1:0] mdu_to_fpu_num;


    wire fpu_frommu_valid;
    wire fpu_frommu_notlast;     //Note: 对于ldc1，送出第一个word时有效，表示不要置ready
    wire[$clog2(`ROB_SIZE) - 1:0] fpu_frommu_num;
    wire[31:0] fpu_frommu_data;

    station Station_module(
        .clk(clk),
        .resetn(resetn),
        .flush(flush),
        .mu_busy(mu_busy),
        .mdu_busy(mdu_busy),
        .mdu_wakeup_en(mdu_wakeup_en),
        .mdu_wakeup_num(mdu_wakeup_num),
        .mdu_wakeup_data(mdu_wakeup_data),
        .station_alu0_wen0(station_alu0_wen0),
        .station_alu1_wen0(station_alu1_wen0),
        .station_mu_wen0(station_mu_wen0),
        .station_mdu_wen0(station_mdu_wen0),
        .station_alu0_wen1(station_alu0_wen1),
        .station_alu1_wen1(station_alu1_wen1),
        .station_mu_wen1(station_mu_wen1),
        .station_mdu_wen1(station_mdu_wen1),
        .alu0_mask(alu0_mask),
        .alu1_mask(alu1_mask),
        .mu_mask(mu_mask),
        .mdu_mask(mdu_mask),
        .station_alu0_valid(station_alu0_valid),
        .station_alu1_valid(station_alu1_valid),
        .station_mdu_valid(station_mdu_valid),
        .station_mu_valid(station_mu_valid),
        .dispatch_PC0(dispatch_PC0),
        .dispatch_inst0(dispatch_inst0),
        .dispatch_predict0(dispatch_predict0),
        .dispatch_predict_target0(dispatch_predict_target0),
        .dispatch_futype0(dispatch_futype0),
        .dispatch_aluop0(dispatch_aluop0),
        .dispatch_mduop0(dispatch_mduop0),
        .dispatch_muop0(dispatch_muop0),
        .dispatch_ctrl0(dispatch_ctrl0),
        .dispatch_cmpop0(dispatch_cmpop0),
        .dispatch_excode0(dispatch_excode0),
        .dispatch_num0(dispatch_num0),
        .dispatch_readyrs0(dispatch_readyrs0),
        .dispatch_readyrt0(dispatch_readyrt0),
        .dispatch_rsval0(dispatch_rsval0),
        .dispatch_rtval0(dispatch_rtval0),
        .dispatch_rsnum0(dispatch_rsnum0),
        .dispatch_rtnum0(dispatch_rtnum0),
        .dispatch_cp0addr0(dispatch_cp0addr0),
        .dispatch_PC1(dispatch_PC1),
        .dispatch_inst1(dispatch_inst1),
        .dispatch_predict1(dispatch_predict1),
        .dispatch_predict_target1(dispatch_predict_target1),
        .dispatch_futype1(dispatch_futype1),
        .dispatch_aluop1(dispatch_aluop1),
        .dispatch_mduop1(dispatch_mduop1),
        .dispatch_muop1(dispatch_muop1),
        .dispatch_ctrl1(dispatch_ctrl1),
        .dispatch_cmpop1(dispatch_cmpop1),
        .dispatch_excode1(dispatch_excode1),
        .dispatch_num1(dispatch_num1),
        .dispatch_readyrs1(dispatch_readyrs1),
        .dispatch_readyrt1(dispatch_readyrt1),
        .dispatch_rsval1(dispatch_rsval1),
        .dispatch_rtval1(dispatch_rtval1),
        .dispatch_rsnum1(dispatch_rsnum1),
        .dispatch_rtnum1(dispatch_rtnum1),
        .dispatch_cp0addr1(dispatch_cp0addr1),
        .alu0_execute_wakeup_en(alu0_execute_wakeup_en),
        .alu0_execute_wakeup_num(alu0_execute_wakeup_num),
        .alu1_execute_wakeup_en(alu1_execute_wakeup_en),
        .alu1_execute_wakeup_num(alu1_execute_wakeup_num),
        .mu_mem_wakeup_en(mu_mem_wakeup_en),
        .mu_mem_wakeup_num(mu_mem_wakeup_num),
        .alu0_writeback_wakeup_en(alu0_writeback_wakeup_en),
        .alu0_writeback_wakeup_num(alu0_writeback_wakeup_num),
        .alu0_writeback_wakeup_data(alu0_writeback_wakeup_data),
        .alu1_writeback_wakeup_en(alu1_writeback_wakeup_en),
        .alu1_writeback_wakeup_num(alu1_writeback_wakeup_num),
        .alu1_writeback_wakeup_data(alu1_writeback_wakeup_data),
        .mu_writeback_wakeup_en(mu_writeback_wakeup_en),
        .mu_writeback_wakeup_num(mu_writeback_wakeup_num),
        .mu_writeback_wakeup_data(mu_writeback_wakeup_data),
        .mdu_writeback_wakeup_en(mdu_writeback_wakeup_en),
        .mdu_writeback_wakeup_num(mdu_writeback_wakeup_num),
        .mdu_writeback_wakeup_data(mdu_writeback_wakeup_data),
        .selalu0_valid(selalu0_valid),
        .selalu0_PC(selalu0_PC),
        .selalu0_inst(selalu0_inst),
        .selalu0_aluop(selalu0_aluop),
        .selalu0_ctrl(selalu0_ctrl),
        .selalu0_cmpop(selalu0_cmpop),
        .selalu0_excode(selalu0_excode),
        .selalu0_predict(selalu0_predict),
        .selalu0_predict_target(selalu0_predict_target),
        .selalu0_rsnum(selalu0_rsnum),
        .selalu0_rtnum(selalu0_rtnum),
        .selalu0_rsval(selalu0_rsval),
        .selalu0_rtval(selalu0_rtval),
        .selalu0_rsval_ready(selalu0_rsval_ready),
        .selalu0_rtval_ready(selalu0_rtval_ready),
        .selalu0_destnum(selalu0_destnum),
        .selalu1_valid(selalu1_valid),
        .selalu1_PC(selalu1_PC),
        .selalu1_inst(selalu1_inst),
        .selalu1_aluop(selalu1_aluop),
        .selalu1_ctrl(selalu1_ctrl),
        .selalu1_cmpop(selalu1_cmpop),
        .selalu1_excode(selalu1_excode),
        .selalu1_predict(selalu1_predict),
        .selalu1_predict_target(selalu1_predict_target),
        .selalu1_rsnum(selalu1_rsnum),
        .selalu1_rtnum(selalu1_rtnum),
        .selalu1_rsval(selalu1_rsval),
        .selalu1_rtval(selalu1_rtval),
        .selalu1_rsval_ready(selalu1_rsval_ready),
        .selalu1_rtval_ready(selalu1_rtval_ready),
        .selalu1_destnum(selalu1_destnum),
        .selmu_valid(selmu_valid),
        //.selmu_inst(selmu_inst),
        .selmu_muop(selmu_muop),
        .selmu_isload(selmu_isload),
        .selmu_isstore(selmu_isstore),
        .selmu_cachewb(selmu_cachewb),
        .selmu_wen(selmu_wen),
        .selmu_rsnum(selmu_rsnum),
        .selmu_rtnum(selmu_rtnum),
        .selmu_rsval(selmu_rsval),
        .selmu_rtval(selmu_rtval),
        .selmu_rsval_ready(selmu_rsval_ready),
        .selmu_rtval_ready(selmu_rtval_ready),
        .selmu_destnum(selmu_destnum),
        .selmdu_valid(selmdu_valid),
        .selmdu_mduop(selmdu_mduop),
        .selmdu_rsval(selmdu_rsval),
        .selmdu_rtval(selmdu_rtval),
        .selmdu_cp0addr(selmdu_cp0addr),
        .selmdu_destnum(selmdu_destnum),
        .premem_wakeup_en(premem_wakeup_en),
        .premem_wakeup_num(premem_wakeup_num),

        .commit_en0(commit_en0),
        .commit_en1(commit_en1),
        .commit_num0(commit_num0),
        .commit_num1(commit_num1),

        .selmu_offset(selmu_offset),
        .selmu_tofpu(selmu_tofpu),
        .selmu_tofpu_notlast(selmu_tofpu_notlast),
        .selmdu_fromfpu_bool(selmdu_fromfpu_bool),
        .selmdu_fromfpu_data(selmdu_fromfpu_data),
        .mdu_to_fpu_valid(mdu_to_fpu_valid),
        .mdu_to_fpu_data(mdu_to_fpu_data),
        .mdu_to_fpu_num(mdu_to_fpu_num),
        .fpu_to_mdu_valid(fpu_tomdu_valid),
        .fpu_to_mdu_data(fpu_tomdu_data),
        .fpu_to_mdu_num(fpu_tomdu_num),
        .fpu_to_mdu_bool_valid(fpu_tomdu_bool_valid),
        .fpu_to_mdu_bool_num(fpu_tomdu_bool_num),
        .fpu_to_mdu_bool_data(fpu_tomdu_bool_data),
        .fpu_to_mu_valid(fpu_tomu_valid),
        .fpu_to_mu_num(fpu_tomu_num),
        .fpu_to_mu_data(fpu_tomu_data)
    );

    wire  alu0_wb_valid;
    wire  alu0_wb_wen;
    wire  alu0_wb_wen1;
    wire [$clog2(`ROB_SIZE)-1:0] alu0_wb_num;
    wire [$clog2(`ROB_SIZE)-1:0] alu0_wb_num1;
    wire [31:0] alu0_wb_result;
    wire [`WIDTH_other-1:0] alu0_wb_result_other;
    wire [$clog2(`CNT_EXCEPTION)-1:0] alu0_wb_excode;
    wire  alu1_wb_valid;
    wire  alu1_wb_wen;
    wire  alu1_wb_wen1;
    wire [$clog2(`ROB_SIZE)-1:0] alu1_wb_num;
    wire [$clog2(`ROB_SIZE)-1:0] alu1_wb_num1;
    wire [31:0] alu1_wb_result;
    wire [`WIDTH_other-1:0] alu1_wb_result_other;
    wire [$clog2(`CNT_EXCEPTION)-1:0] alu1_wb_excode;
    assign alu0_writeback_wakeup_en=alu0_wb_wen;
    assign alu0_writeback_wakeup_num=alu0_wb_num;
    assign alu0_writeback_wakeup_data=alu0_wb_result;
    assign alu1_writeback_wakeup_en=alu1_wb_wen;
    assign alu1_writeback_wakeup_num=alu1_wb_num;
    assign alu1_writeback_wakeup_data=alu1_wb_result;
    wire  mu_wb_wen;
    wire [$clog2(`ROB_SIZE)-1:0] mu_wb_num;
    wire [31:0] mu_wb_result;

    fu_alu FU_ALU0_module(
        .clk(clk),
        .resetn(resetn),
        .flush(flush),
        .sel_valid(selalu0_valid),
        .sel_PC(selalu0_PC),
        .sel_inst(selalu0_inst),
        .sel_aluop(selalu0_aluop),
        .sel_ctrl(selalu0_ctrl),
        .sel_cmpop(selalu0_cmpop),
        .sel_excode(selalu0_excode),
        .sel_predict(selalu0_predict),
        .sel_predict_target(selalu0_predict_target),
        .sel_rsnum(selalu0_rsnum),
        .sel_rtnum(selalu0_rtnum),
        .sel_rsval(selalu0_rsval),
        .sel_rtval(selalu0_rtval),
        .sel_rsval_ready(selalu0_rsval_ready),
        .sel_rtval_ready(selalu0_rtval_ready),
        .sel_destnum(selalu0_destnum),
        .bypass_en(alu1_wb_wen),
        .bypass_num(alu1_wb_num),
        .bypass_data(alu1_wb_result),
        .alu_wb_valid(alu0_wb_valid),
        .alu_wb_wen(alu0_wb_wen),
        .alu_wb_wen1(alu0_wb_wen1),
        .alu_wb_num(alu0_wb_num),
        .alu_wb_num1(alu0_wb_num1),
        .alu_wb_result(alu0_wb_result),
        .alu_wb_result_other(alu0_wb_result_other),
        .alu_wb_excode(alu0_wb_excode),
        .alu_execute_wakeup_en(alu0_execute_wakeup_en),
        .alu_execute_wakeup_num(alu0_execute_wakeup_num),
        .mu_bypass_en(mu_wb_wen),
        .mu_bypass_data(mu_wb_result),
        .mu_bypass_num(mu_wb_num)
    );


    fu_alu FU_ALU1_module(
        .clk(clk),
        .resetn(resetn),
        .flush(flush),
        .sel_valid(selalu1_valid),
        .sel_PC(selalu1_PC),
        .sel_inst(selalu1_inst),
        .sel_aluop(selalu1_aluop),
        .sel_ctrl(selalu1_ctrl),
        .sel_cmpop(selalu1_cmpop),
        .sel_excode(selalu1_excode),
        .sel_predict(selalu1_predict),
        .sel_predict_target(selalu1_predict_target),
        .sel_rsnum(selalu1_rsnum),
        .sel_rtnum(selalu1_rtnum),
        .sel_rsval(selalu1_rsval),
        .sel_rtval(selalu1_rtval),
        .sel_rsval_ready(selalu1_rsval_ready),
        .sel_rtval_ready(selalu1_rtval_ready),
        .sel_destnum(selalu1_destnum),
        .bypass_en(alu0_wb_wen),
        .bypass_num(alu0_wb_num),
        .bypass_data(alu0_wb_result),
        .alu_wb_valid(alu1_wb_valid),
        .alu_wb_wen(alu1_wb_wen),
        .alu_wb_wen1(alu1_wb_wen1),
        .alu_wb_num(alu1_wb_num),
        .alu_wb_num1(alu1_wb_num1),
        .alu_wb_result(alu1_wb_result),
        .alu_wb_result_other(alu1_wb_result_other),
        .alu_wb_excode(alu1_wb_excode),
        .alu_execute_wakeup_en(alu1_execute_wakeup_en),
        .alu_execute_wakeup_num(alu1_execute_wakeup_num),
        .mu_bypass_en(mu_wb_wen),
        .mu_bypass_data(mu_wb_result),
        .mu_bypass_num(mu_wb_num)
    );

    wire [31:0] tlb_vaddr1;
    wire [31:0] tlb_paddr1;
    wire  tlb_isexist1;
    wire  tlb_isvalid1;
    wire  tlb_isdirty1;
    wire tlb_uncached1;
    wire tlb_error1;
    assign gpr_commit_num0=commit_num0;
    assign gpr_commit_num1=commit_num1;
    wire  mumid_done_en;
    wire [$clog2(`ROB_SIZE)-1:0] mumid_done_num;
    wire  mu_wb_valid;
    wire mu_wb_uncached;
    
    wire [`WIDTH_other-1:0] mu_wb_result_other;
    wire [$clog2(`CNT_EXCEPTION)-1:0] mu_wb_excode;
    assign mu_writeback_wakeup_en=mu_wb_wen;
    assign mu_writeback_wakeup_num=mu_wb_num;
    assign mu_writeback_wakeup_data=mu_wb_result;

    wire[$clog2(`ROB_SIZE) - 2:0] mu_rob_head;
    wire mu_rob_valid0;
    wire mu_rob_valid1;
    wire mu_wb_tofpu_notlast;

    


    fu_mu FU_MU_module(
        .clk(clk),
        .resetn(resetn),
        .arid(arid1),
        .araddr(araddr1),
        .arlen(arlen1),
        .arsize(arsize1),
        .arburst(arburst1),
        .arlock(arlock1),
        .arcache(arcache1),
        .arprot(arprot1),
        .arvalid(arvalid1),
        .arready(arready1),
        .rid(rid1),
        .rdata(rdata1),
        .rresp(rresp1),
        .rlast(rlast1),
        .rvalid(rvalid1),
        .rready(rready1),
        .awid(awid1),
        .awaddr(awaddr1),
        .awlen(awlen1),
        .awsize(awsize1),
        .awburst(awburst1),
        .awlock(awlock1),
        .awcache(awcache1),
        .awprot(awprot1),
        .awvalid(awvalid1),
        .awready(awready1),
        .wid(wid1),
        .wdata(wdata1),
        .wstrb(wstrb1),
        .wlast(wlast1),
        .wvalid(wvalid1),
        .wready(wready1),
        .bid(bid1),
        .bresp(bresp1),
        .bvalid(bvalid1),
        .bready(bready1),
        .preMEM_busy(mu_busy),
        .tlb_vaddr(tlb_vaddr1),
        .tlb_paddr(tlb_paddr1),
        .tlb_isexist(tlb_isexist1),
        .tlb_isvalid(tlb_isvalid1),
        .tlb_isdirty(tlb_isdirty1),
        .tlb_uncached(tlb_uncached1),
        .tlb_error(tlb_error1),
        .commit_en0(commit_en0),
        .commit_num0(commit_num0),
        .commit_en1(commit_en1),
        .commit_num1(commit_num1),
        .flush(flush),
        .wakeup_en(mu_mem_wakeup_en),
        .wakeup_num(mu_mem_wakeup_num),
        .done_en(mumid_done_en),
        .done_num(mumid_done_num),
        .sel_valid(selmu_valid),
        //.sel_inst(selmu_inst),
        .sel_offset(selmu_offset),
        .sel_muop(selmu_muop),
        .sel_isload(selmu_isload),
        .sel_isstore(selmu_isstore),
        .sel_cachewb(selmu_cachewb),
        .sel_wen(selmu_wen),
        .sel_rsnum(selmu_rsnum),
        .sel_rtnum(selmu_rtnum),
        .sel_rsval(selmu_rsval),
        .sel_rtval(selmu_rtval),
        .sel_destnum(selmu_destnum),
        .sel_rsval_ready(selmu_rsval_ready),
        .sel_rtval_ready(selmu_rtval_ready),
        .mu_wb_valid(mu_wb_valid),
        .mu_wb_wen(mu_wb_wen),
        .mu_wb_num(mu_wb_num),
        .mu_wb_result(mu_wb_result),
        .mu_wb_result_other(mu_wb_result_other),
        .mu_wb_excode(mu_wb_excode),
        .mu_wb_uncached(mu_wb_uncached),
        .mu_wb_tofpu_notlast(mu_wb_tofpu_notlast),
        .bypass0_en(alu0_wb_wen1),
        .bypass0_num(alu0_wb_num1),
        .bypass0_data(alu0_wb_result),
        .bypass1_en(alu1_wb_wen1),
        .bypass1_num(alu1_wb_num1),
        .bypass1_data(alu1_wb_result),
        .premem_wakeup_en(premem_wakeup_en),
        .premem_wakeup_num(premem_wakeup_num),
        .rob_head(mu_rob_head),
        .rob_head_valid0(mu_rob_valid0),
        .rob_head_valid1(mu_rob_valid1),

        .sel_tofpu(selmu_tofpu),
        .sel_tofpu_notlast(selmu_tofpu_notlast),
        .mu_tofpu_valid(fpu_frommu_valid),
        .mu_tofpu_num(fpu_frommu_num),
        .mu_tofpu_notlast(fpu_frommu_notlast),
        .mu_tofpu_data(fpu_frommu_data)
    );

    wire [5:0] cp0_raddr;
    wire [31:0] cp0_rdata;
    wire  mdu_wb_valid;
    wire  mdu_wb_wen;
    wire [$clog2(`ROB_SIZE)-1:0] mdu_wb_num;
    wire [31:0] mdu_wb_result;
    wire [31:0] mdu_wb_result_other;
    reg[31:0] Hi,Lo;    //TODO
    wire [31:0] Hi_wdata;
    wire  Hi_wen;
    wire [31:0] Lo_wdata;
    wire  Lo_wen;
    assign mdu_writeback_wakeup_en=mdu_wb_wen;
    assign mdu_writeback_wakeup_num=mdu_wb_num;
    assign mdu_writeback_wakeup_data=mdu_wb_result;
    
    fu_mdu FU_MDU_module(
        .clk(clk),
        .resetn(resetn),
        .flush(flush),
        .flush_Hi(Hi_wen ? Hi_wdata : Hi),
        .flush_Lo(Lo_wen ? Lo_wdata : Lo),
        .mdu_wakeup_en(mdu_wakeup_en),
        .mdu_wakeup_num(mdu_wakeup_num),
        .mdu_wakeup_data(mdu_wakeup_data),
        .mdu_busy(mdu_busy),
        .sel_valid(selmdu_valid),
        .sel_mduop(selmdu_mduop),
        .sel_rsval(selmdu_rsval),
        .sel_rtval(selmdu_rtval),
        .sel_cp0addr(selmdu_cp0addr),
        .sel_destnum(selmdu_destnum),
        .cp0_raddr(cp0_raddr),
        .cp0_rdata(cp0_rdata),
        .mdu_wb_valid(mdu_wb_valid),
        .mdu_wb_wen(mdu_wb_wen),
        .mdu_wb_num(mdu_wb_num),
        .mdu_wb_result(mdu_wb_result),
        .mdu_wb_result_other(mdu_wb_result_other),

        .fromfpu_data(selmdu_fromfpu_data),
        .fromfpu_bool(selmdu_fromfpu_bool),
        .cp1_raddr(fpu_cp1_raddr),
        .cp1_rdata(fpu_cp1_rdata)
    );

    wire rob_empty;
    wire  rob_pop;
    wire  rob_clear0;
    wire  rob_clear1;
    wire [63:0] RAS;
    wire [31:0] PC0;
    wire  valid0;
    wire [`CNT_FU-1:0] futype0;
    wire [`CNT_CTRL-1:0] ctrl0;
    wire [4:0] waddr0;
    wire [5:0] cp0addr0;
    wire  alu0_ready0;
    wire  alu1_ready0;
    wire  mu_ready0;
    wire mu_uncached0;
    wire  mdu_ready0;
    wire  mumid_ready0;
    wire [31:0] alu0_result0;
    wire [31:0] alu1_result0;
    wire [31:0] mu_result0;
    wire [31:0] mdu_result0;
    wire [`WIDTH_other-1:0] alu0_result_other0;
    wire [`WIDTH_other-1:0] alu1_result_other0;
    wire [`WIDTH_other-1:0] mu_result_other0;
    wire [31:0] mdu_result_other0;
    wire [$clog2(`CNT_EXCEPTION)-1:0] alu0_excode0;
    wire [$clog2(`CNT_EXCEPTION)-1:0] alu1_excode0;
    wire [$clog2(`CNT_EXCEPTION)-1:0] mu_excode0;
    wire [31:0] PC1;
    wire  valid1;
    wire [`CNT_FU-1:0] futype1;
    wire [`CNT_CTRL-1:0] ctrl1;
    wire [4:0] waddr1;
    wire [5:0] cp0addr1;
    wire  alu0_ready1;
    wire  alu1_ready1;
    wire  mu_ready1;
    wire mu_uncached1;
    wire  mdu_ready1;
    wire  mumid_ready1;
    wire [31:0] alu0_result1;
    wire [31:0] alu1_result1;
    wire [31:0] mu_result1;
    wire [31:0] mdu_result1;
    wire [`WIDTH_other-1:0] alu0_result_other1;
    wire [`WIDTH_other-1:0] alu1_result_other1;
    wire [`WIDTH_other-1:0] mu_result_other1;
    wire [31:0] mdu_result_other1;
    wire [$clog2(`CNT_EXCEPTION)-1:0] alu0_excode1;
    wire [$clog2(`CNT_EXCEPTION)-1:0] alu1_excode1;
    wire [$clog2(`CNT_EXCEPTION)-1:0] mu_excode1;

    assign mu_rob_head=rob_head;
    assign mu_rob_valid0=valid0;
    assign mu_rob_valid1=valid1;

    rob ROB_module(
        .clk(clk),
        .resetn(resetn),
        .rob_full(rob_full),
        .rob_empty(rob_empty),
        .rob_head(rob_head),
        .rob_tail(rob_tail),
        .flush(flush),
        .rob_pop(rob_pop),
        .rob_clear0(rob_clear0),
        .rob_clear1(rob_clear1),
        .rename_push_en(rob_push_en),
        .rename_RAS(rob_RAS),
        .rename_valid0(rob_valid0),
        .rename_PC0(rob_PC0),
        .rename_futype0(rob_futype0),
        .rename_ctrl0(rob_ctrl0),
        .rename_waddr0(rob_waddr0),
        .rename_cp0addr0(rob_cp0addr0),
        .rename_valid1(rob_valid1),
        .rename_PC1(rob_PC1),
        .rename_futype1(rob_futype1),
        .rename_ctrl1(rob_ctrl1),
        .rename_waddr1(rob_waddr1),
        .rename_cp0addr1(rob_cp0addr1),
        .rename_nop0(rob_nop0),
        .rename_nop1(rob_nop1),
        .rob_raddr0(rob_raddr0),
        .rob_raddr1(rob_raddr1),
        .rob_raddr2(rob_raddr2),
        .rob_raddr3(rob_raddr3),
        .rob_rdata0(rob_rdata0),
        .rob_rdata1(rob_rdata1),
        .rob_rdata2(rob_rdata2),
        .rob_rdata3(rob_rdata3),
        .rob_ready0(rob_ready0),
        .rob_ready1(rob_ready1),
        .rob_ready2(rob_ready2),
        .rob_ready3(rob_ready3),
        .fu_alu0_wen(alu0_wb_valid),
        .fu_alu0_wresult(alu0_wb_result),
        .fu_alu0_wother(alu0_wb_result_other),
        .fu_alu0_wnum(alu0_wb_num),
        .fu_alu0_excode(alu0_wb_excode),
        .fu_alu1_wen(alu1_wb_valid),
        .fu_alu1_wresult(alu1_wb_result),
        .fu_alu1_wother(alu1_wb_result_other),
        .fu_alu1_wnum(alu1_wb_num),
        .fu_alu1_excode(alu1_wb_excode),
        .fu_mu_wen(mu_wb_valid),
        .fu_mu_wresult(mu_wb_result),
        .fu_mu_wother(mu_wb_result_other),
        .fu_mu_wnum(mu_wb_num),
        .fu_mu_excode(mu_wb_excode),
        .fu_mu_uncached(mu_wb_uncached),
        .fu_mu_tofpu_notlast(mu_wb_tofpu_notlast),
        .fu_mdu_wen(mdu_wb_valid),
        .fu_mdu_wresult(mdu_wb_result),
        .fu_mdu_wother(mdu_wb_result_other),
        .fu_mdu_wnum(mdu_wb_num),
        .fu_mumid_wen(mumid_done_en),
        .fu_mumid_wnum(mumid_done_num),
        .RAS(RAS),
        .PC0(PC0),
        .valid0(valid0),
        .futype0(futype0),
        .ctrl0(ctrl0),
        .waddr0(waddr0),
        .cp0addr0(cp0addr0),
        .alu0_ready0(alu0_ready0),
        .alu1_ready0(alu1_ready0),
        .mu_ready0(mu_ready0),
        .mu_uncached0(mu_uncached0),
        .mdu_ready0(mdu_ready0),
        .mumid_ready0(mumid_ready0),
        .alu0_result0(alu0_result0),
        .alu1_result0(alu1_result0),
        .mu_result0(mu_result0),
        .mdu_result0(mdu_result0),
        .alu0_result_other0(alu0_result_other0),
        .alu1_result_other0(alu1_result_other0),
        .mu_result_other0(mu_result_other0),
        .mdu_result_other0(mdu_result_other0),
        .alu0_excode0(alu0_excode0),
        .alu1_excode0(alu1_excode0),
        .mu_excode0(mu_excode0),
        .PC1(PC1),
        .valid1(valid1),
        .futype1(futype1),
        .ctrl1(ctrl1),
        .waddr1(waddr1),
        .cp0addr1(cp0addr1),
        .alu0_ready1(alu0_ready1),
        .alu1_ready1(alu1_ready1),
        .mu_ready1(mu_ready1),
        .mu_uncached1(mu_uncached1),
        .mdu_ready1(mdu_ready1),
        .mumid_ready1(mumid_ready1),
        .alu0_result1(alu0_result1),
        .alu1_result1(alu1_result1),
        .mu_result1(mu_result1),
        .mdu_result1(mdu_result1),
        .alu0_result_other1(alu0_result_other1),
        .alu1_result_other1(alu1_result_other1),
        .mu_result_other1(mu_result_other1),
        .mdu_result_other1(mdu_result_other1),
        .alu0_excode1(alu0_excode1),
        .alu1_excode1(alu1_excode1),
        .mu_excode1(mu_excode1)
    );

    
    always@(posedge clk) begin
        if(~resetn) begin
            Hi<=0;
            Lo<=0;
        end
        else begin
            if(Hi_wen)
                Hi<=Hi_wdata;
            if(Lo_wen)
                Lo<=Lo_wdata;
        end
    end
    wire  cp0_wen;
    wire [5:0] cp0_waddr;
    wire [31:0] cp0_wdata;
    wire [$clog2(`CNT_EXCEPTION)-1:0] excode;
    wire [31:0] exce_PC;
    wire  exce_isslot;
    wire [31:0] exce_vaddr;
    wire  eret_en;
    wire [31:0] eretaddr;
    wire  tlb_wr_en;
    wire  tlb_wr_useindex;
    wire  tlbp_en;
    wire  tlbr_en;
    wire [7:0] real_intr;
    wire  exception_en;
    wire [17:0] CP0_EBase;
    wire  CP0_Status_BEV;
    wire  CP0_Cause_IV;

    wire l2_tlb_qry_done;
    wire l2_tlb_qry_en;
    wire l2_tlb_qry_isexist;
    wire l1_dtlb_ld_en;
    wire l1_itlb_ld_en;

    wire      fpr_wen0;                   //提交奇FPR
    wire      fpr_wen1;                   //提交偶FPR
    wire[3:0] fpr_waddr;
    wire[4:0] fpr_wprf0;
    wire[4:0] fpr_wprf1;
    wire      cp1_wen;
    wire[4:0] cp1_waddr;
    wire[31:0]cp1_wdata;
    wire      updfcc_en;
    wire[2:0] updfcc_addr;
    wire      updfcc_cc;
    wire      updfpe_en;
    wire[`FPECNT - 1:0]   updfpe_fpeword;
    wire      updfpe_exception;       //是否真的引发异常，用于修改Cause
    
    commit Commit_module(
        .clk(clk),
        .resetn(resetn),
        .rob_head(rob_head),
        .rob_empty(rob_empty),
        .RAS(RAS),
        .PC0(PC0),
        .valid0(valid0),
        .futype0(futype0),
        .ctrl0(ctrl0),
        .waddr0(waddr0),
        .cp0addr0(cp0addr0),
        .alu0_ready0(alu0_ready0),
        .alu1_ready0(alu1_ready0),
        .mu_ready0(mu_ready0),
        .mu_uncached0(mu_uncached0),
        .mdu_ready0(mdu_ready0),
        .mumid_ready0(mumid_ready0),
        .alu0_result0(alu0_result0),
        .alu1_result0(alu1_result0),
        .mu_result0(mu_result0),
        .mdu_result0(mdu_result0),
        .alu0_result_other0(alu0_result_other0),
        .alu1_result_other0(alu1_result_other0),
        .mu_result_other0(mu_result_other0),
        .mdu_result_other0(mdu_result_other0),
        .alu0_excode0(alu0_excode0),
        .alu1_excode0(alu1_excode0),
        .mu_excode0(mu_excode0),
        .PC1(PC1),
        .valid1(valid1),
        .futype1(futype1),
        .ctrl1(ctrl1),
        .waddr1(waddr1),
        .cp0addr1(cp0addr1),
        .alu0_ready1(alu0_ready1),
        .alu1_ready1(alu1_ready1),
        .mu_ready1(mu_ready1),
        .mu_uncached1(mu_uncached1),
        .mdu_ready1(mdu_ready1),
        .mumid_ready1(mumid_ready1),
        .alu0_result1(alu0_result1),
        .alu1_result1(alu1_result1),
        .mu_result1(mu_result1),
        .mdu_result1(mdu_result1),
        .alu0_result_other1(alu0_result_other1),
        .alu1_result_other1(alu1_result_other1),
        .mu_result_other1(mu_result_other1),
        .mdu_result_other1(mdu_result_other1),
        .alu0_excode1(alu0_excode1),
        .alu1_excode1(alu1_excode1),
        .mu_excode1(mu_excode1),
        .rob_pop(rob_pop),
        .rob_clear0(rob_clear0),
        .rob_clear1(rob_clear1),
        .commit_en0(commit_en0),
        .commit_en1(commit_en1),
        .commit_num0(commit_num0),
        .commit_num1(commit_num1),
        .commit_PC0(debug_wb_pc0),
        .commit_PC1(debug_wb_pc1),
        .flush(flush),
        .flush_target(flush_target),
        .arf_wen0(arf_wen0),
        .arf_waddr0(arf_waddr0),
        .arf_wnum0(),
        .arf_wdata0(arf_wdata0),
        .arf_wen1(arf_wen1),
        .arf_waddr1(arf_waddr1),
        .arf_wnum1(),
        .arf_wdata1(arf_wdata1),
        .Hi_wdata(Hi_wdata),
        .Hi_wen(Hi_wen),
        .Lo_wdata(Lo_wdata),
        .Lo_wen(Lo_wen),
        .predictor_wr_en(predictor_wr_en),
        .predictor_wr_PC(predictor_wr_PC),
        .predictor_wr_target(predictor_wr_target),
        .predictor_wr_isret(predictor_wr_isret),
        .predictor_wr_isjump(predictor_wr_isjump),
        .predictor_RAS_flush(RAS_flush),
        .predictor_RAS_reset_en(RAS_reset_en),
        .predictor_RAS_reset_data(RAS_reset_data),
        .cp0_wen(cp0_wen),
        .cp0_waddr(cp0_waddr),
        .cp0_wdata(cp0_wdata),
        .excode(excode),
        .exce_PC(exce_PC),
        .exce_isslot(exce_isslot),
        .exce_vaddr(exce_vaddr),
        .eret_en(eret_en),
        .eretaddr(eretaddr),
        .tlb_wr_en(tlb_wr_en),
        .tlb_wr_useindex(tlb_wr_useindex),
        .tlbp_en(tlbp_en),
        .tlbr_en(tlbr_en),
        .l2_tlb_qry_done(l2_tlb_qry_done),
        .l2_tlb_qry_en(l2_tlb_qry_en),
        .l2_tlb_qry_isexist(l2_tlb_qry_isexist),
        .l1_dtlb_ld_en(l1_dtlb_ld_en),
        .l1_itlb_ld_en(l1_itlb_ld_en),
        .icache_clear_en(icache_clear_en),
        .icache_addr(icache_addr),
        .icache_index(icache_index),
        .ext_int(real_intr),
        .exception_en(exception_en),
        .CP0_EBase(CP0_EBase),
        .CP0_Status_BEV(CP0_Status_BEV),
        .CP0_Cause_IV(CP0_Cause_IV),
        .llbit_wen(llbit_wen),
        .llbit_newval(llbit_newval),

        .fpu_ready0(fpurob_ready0[rob_head]),
        .fpu_ready1(fpurob_ready1[rob_head]),
        .fpu_result0(fpurob_result0[rob_head]),
        .fpu_result1(fpurob_result1[rob_head]),
        .fpu_waddr0(fpurob_head_info0[13:10]),
        .fpu_waddr1(fpurob_head_info1[13:10]),
        .fpu_wprf0_0(fpurob_head_info0[4:0]),
        .fpu_wprf0_1(fpurob_head_info1[4:0]),
        .fpu_wprf1_0(fpurob_head_info0[9:5]),
        .fpu_wprf1_1(fpurob_head_info1[9:5]),
        .fpu_excode0(fpurob_head_info0[13 + $clog2(`CNT_EXCEPTION):14]),
        .fpu_excode1(fpurob_head_info1[13 + $clog2(`CNT_EXCEPTION):14]),
        .fpu_gctrl0(fpurob_head_info0[13 + $clog2(`CNT_EXCEPTION) + `FPU_GLOBAL_CNT:14 + $clog2(`CNT_EXCEPTION)]),
        .fpu_gctrl1(fpurob_head_info1[13 + $clog2(`CNT_EXCEPTION) + `FPU_GLOBAL_CNT:14 + $clog2(`CNT_EXCEPTION)]),
        .fpu_fpeword0(fpurob_head_info0[13 + $clog2(`CNT_EXCEPTION) + `FPU_GLOBAL_CNT + `FPECNT:14 + $clog2(`CNT_EXCEPTION) + `FPU_GLOBAL_CNT]),
        .fpu_fpeword1(fpurob_head_info1[13 + $clog2(`CNT_EXCEPTION) + `FPU_GLOBAL_CNT + `FPECNT:14 + $clog2(`CNT_EXCEPTION) + `FPU_GLOBAL_CNT]),
        
        .fpr_wen0(fpr_wen0),
        .fpr_wen1(fpr_wen1),
        .fpr_waddr(fpr_waddr),
        .fpr_wprf0(fpr_wprf0),
        .fpr_wprf1(fpr_wprf1),
        .cp1_wen(cp1_wen),
        .cp1_waddr(cp1_waddr),
        .cp1_wdata(cp1_wdata),
        .updfcc_en(updfcc_en),
        .updfcc_cc(updfcc_cc),
        .updfcc_addr(updfcc_addr),
        .updfpe_en(updfpe_en),
        .updfpe_fpeword(updfpe_fpeword),
        .updfpe_exception(updfpe_exception)
    );

    wire [5:0] index_new;
    wire [$clog2(`CNT_TLB)-1:0] tlb_index;
    wire [$clog2(`CNT_TLB)-1:0] tlb_random;
    wire [31:0] tlb_EntryHi;
    wire [31:0] tlb_EntryLo0;
    wire [31:0] tlb_EntryLo1;
    wire[2:0] tlb_config0_k0;
    wire[78:0] tlb_new;
    wire[15:0] tlb_pagemask;
    wire[1:0] status_ksu;
    wire cp1_en;

    cp0_group CP0_Group_module(
        .clk(clk),
        .resetn(resetn),
        .raddr(cp0_raddr),
        .rdata(cp0_rdata),
        .mtc0_wen(cp0_wen),
        .mtc0_waddr(cp0_waddr),
        .mtc0_wdata(cp0_wdata),
        .ext_int(ext_int),
        .real_intr(real_intr),
        .exception_en(exception_en),
        .excode(excode),
        .exce_PC(exce_PC),
        .exce_isslot(exce_isslot),
        .exce_vaddr(exce_vaddr),
        .eret_en(eret_en),
        .eretaddr(eretaddr),
        .status_ksu(status_ksu),
        .cp0_en(cp0_en),
        .cp1_en(cp1_en),
        .tlb_new(tlb_new),
        .l2_tlb_qry_isexist(l2_tlb_qry_isexist),
        .l2_tlb_qry_done(l2_tlb_qry_done),
        .index_new(index_new),
        .tlbp_en(tlbp_en),
        .tlbr_en(tlbr_en),
        .tlb_index(tlb_index),
        .tlb_random(tlb_random),
        .tlb_EntryHi(tlb_EntryHi),
        .tlb_EntryLo0(tlb_EntryLo0),
        .tlb_EntryLo1(tlb_EntryLo1),
        .tlb_config0_k0(tlb_config0_k0),
        .tlb_pagemask(tlb_pagemask),
        .out_cp0_cause_iv(CP0_Cause_IV),
        .out_cp0_status_bev(CP0_Status_BEV),
        .out_cp0_ebase(CP0_EBase)
    );

    wire[78:0] qry_tlb;
    
    l2_tlb L2_TLB_module(
        .clk(clk),
        .resetn(resetn),
        .cp0_entryhi(tlb_EntryHi),
        .cp0_entrylo0(tlb_EntryLo0),
        .cp0_entrylo1(tlb_EntryLo1),
        .cp0_index(tlb_index),
        .cp0_random(tlb_random),
        .cp0_pagemask(tlb_pagemask),
        .qry_en(l2_tlb_qry_en),
        .qry_vaddr(exce_vaddr),
        .qry_useentryhi(tlbp_en),
        .qry_tlb(qry_tlb),
        .qry_isexist(l2_tlb_qry_isexist),
        .qry_index(index_new),
        .qry_done(l2_tlb_qry_done),
        .qryind_tlb(tlb_new),
        .tlbwi_en(tlb_wr_en & tlb_wr_useindex),
        .tlbwr_en(tlb_wr_en & ~tlb_wr_useindex)
    );

    l1_tlb #(.isdata(0)) i_TLB_module (
        .clk(clk),
        .resetn(resetn),
        .mmu_vaddr(tlb_vaddr0),
        .mmu_paddr(tlb_paddr0),
        .mmu_isexist(tlb_isexist0),
        .mmu_isvalid(tlb_isvalid0),
        .mmu_isdirty(),
        .mmu_uncached(tlb_uncached0),
        .mmu_error(tlb_error0),
        .ld_tlb(qry_tlb),
        .ld_index(index_new),
        .ld_en(l1_itlb_ld_en),
        .cp0_entryhi(tlb_EntryHi),
        .cp0_entrylo0(tlb_EntryLo0),
        .cp0_entrylo1(tlb_EntryLo1),
        .cp0_random(tlb_random),
        .cp0_index(tlb_index),
        .cp0_config0_k0(tlb_config0_k0),
        .cp0_status_ksu(status_ksu),
        .cp0_pagemask(tlb_pagemask),
        .tlbwi_en(tlb_wr_en & tlb_wr_useindex),
        .tlbwr_en(tlb_wr_en & ~tlb_wr_useindex)
    );  

    l1_tlb #(.isdata(1)) d_TLB_module(
        .clk(clk),
        .resetn(resetn),
        .mmu_vaddr(tlb_vaddr1),
        .mmu_paddr(tlb_paddr1),
        .mmu_isexist(tlb_isexist1),
        .mmu_isvalid(tlb_isvalid1),
        .mmu_isdirty(tlb_isdirty1),
        .mmu_uncached(tlb_uncached1),
        .mmu_error(tlb_error1),
        .ld_tlb(qry_tlb),
        .ld_index(index_new),
        .ld_en(l1_dtlb_ld_en),
        .cp0_entryhi(tlb_EntryHi),
        .cp0_entrylo0(tlb_EntryLo0),
        .cp0_entrylo1(tlb_EntryLo1),
        .cp0_random(tlb_random),
        .cp0_index(tlb_index),
        .cp0_config0_k0(tlb_config0_k0),
        .cp0_status_ksu(status_ksu),
        .cp0_pagemask(tlb_pagemask),
        .tlbwi_en(tlb_wr_en & tlb_wr_useindex),
        .tlbwr_en(tlb_wr_en & ~tlb_wr_useindex)
    );  



    fpu_top fpu(
        .clk(clk),
        .resetn(resetn),
        .flush(flush),
        .inst_valid((~rename_busy) & ((decode_valid0 & decode_fpuvalid0) | (decode_valid1 & decode_fpuvalid1))),
        .busy(fpu_busy),
        .inst((decode_valid0 & decode_fpuvalid0) ? decode_inst0 : decode_inst1),
        .robnum({~(decode_valid0 & decode_fpuvalid0),rob_tail}),
        .PC((decode_valid0 & decode_fpuvalid0) ? decode_PC0 : decode_PC1),
        .predict((decode_valid0 & decode_fpuvalid0) ? decode_predict0 : decode_predict1),
        .predict_target((decode_valid0 & decode_fpuvalid0) ? decode_predict_target0 : decode_predict_target1),
        .rob_wb_en(fpu_rob_wb_en),
        .rob_wb_result(fpu_rob_wb_result),
        .rob_wb_num(fpu_rob_wb_num),
        .rob_wb_waddr(fpu_rob_wb_waddr),
        .rob_wb_wprf0(fpu_rob_wb_wprf0),
        .rob_wb_wprf1(fpu_rob_wb_wprf1),
        .rob_wb_gctrl(fpu_rob_wb_gctrl),
        .rob_wb_excode(fpu_rob_wb_excode),
        .rob_wb_fpeword(fpu_rob_wb_fpeword),
        .fpr_wen0(fpr_wen0),
        .fpr_wen1(fpr_wen1),
        .fpr_waddr(fpr_waddr),
        .fpr_wprf0(fpr_wprf0),
        .fpr_wprf1(fpr_wprf1),
        .cp1_raddr(fpu_cp1_raddr),
        .cp1_rdata(fpu_cp1_rdata),
        .cp1_wen(cp1_wen),
        .cp1_waddr(cp1_waddr),
        .cp1_wdata(cp1_wdata),
        .updfcc_en(updfcc_en),
        .updfcc_addr(updfcc_addr),
        .updfcc_cc(updfcc_cc),
        .updfpe_en(updfpe_en),
        .updfpe_fpeword(updfpe_fpeword),
        .updfpe_exception(updfpe_exception),
        .tomdu_valid(fpu_tomdu_valid),
        .tomdu_num(fpu_tomdu_num),
        .tomdu_data(fpu_tomdu_data),
        .tomdu_bool_valid(fpu_tomdu_bool_valid),
        .tomdu_bool_num(fpu_tomdu_bool_num),
        .tomdu_bool_data(fpu_tomdu_bool_data),
        .tomu_valid(fpu_tomu_valid),
        .tomu_num(fpu_tomu_num),
        .tomu_data(fpu_tomu_data),
        .frommdu_valid(mdu_to_fpu_valid),
        .frommdu_num(mdu_to_fpu_num),
        .frommdu_data(mdu_to_fpu_data),
        .frommu_valid(fpu_frommu_valid),
        .frommu_num(fpu_frommu_num),
        .frommu_notlast(fpu_frommu_notlast),
        .frommu_data(fpu_frommu_data),
        .cp1_en(cp1_en)
    );
    

endmodule