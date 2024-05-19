// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    FPU顶层模块，提供与CPU交互的接口
    Upd at 2023.6.29: 增加“当Status.CU1=0时报CP1unusable”
*/

module fpu_top(
    input           clk,
    input           resetn,
    input           flush,
    //指令输入接口
    input           inst_valid,                 //指令输入使能
    output          busy,                       //阻塞信号
    input[31:0]     inst,
    input[$clog2(`ROB_SIZE) - 1:0]  robnum,     //指令ROB编号
    input[31:0]     PC,
    input           predict,                    //浮点转移指令是否预测转移
    input[31:0]     predict_target,             //浮点转移指令预测的目标地址
    //指令写回接口
    //Note: 尽管FPR由fpu管理，但是ROB由CPU部分管理，一条浮点指令执行完后要把结果交给CPU部分
    output          rob_wb_en,                  //写回ROB使能
    output[63:0]    rob_wb_result,              //虽然但是，这个涉及到如何commit，还是要写到ROB中
    output[$clog2(`ROB_SIZE) - 1:0] rob_wb_num,
    output[3:0]     rob_wb_waddr,               //FPR
    output[4:0]     rob_wb_wprf0,
    output[4:0]     rob_wb_wprf1,
    output[`FPU_GLOBAL_CNT - 1:0]   rob_wb_gctrl,           //注意：ROB在此之前（一般）不知道该fpu指令控制信号，需要把Commit所需必要控制信号写回
    output[$clog2(`CNT_EXCEPTION) - 1:0]    rob_wb_excode,  //只会报RI和FPE两种异常
    output[`FPECNT - 1:0]           rob_wb_fpeword,         //浮点异常状态字
    //Note: 这里我们埋了个坑，我们干脆不考虑先进行浮点运算/比较然后立刻cfc1这样的情况
    //不对FCSR等设置旁路，仅简单地写回，也不flush……这样或许会引起问题，但最一般的浮点运算程序应该不会有这种情况
    
    //FPR提交接口（Note：如果ROB的这一对指令都具有写回FPR的行为，先写回第一条，这样仅1个写端口即可）
    input           fpr_wen0,                   //提交奇FPR
    input           fpr_wen1,                   //提交偶FPR
    input[3:0]      fpr_waddr,
    input[4:0]      fpr_wprf0,
    input[4:0]      fpr_wprf1,
    //CP1读写接口
    input[4:0]      cp1_raddr,
    output[31:0]    cp1_rdata,
    input           cp1_wen,
    input[4:0]      cp1_waddr,
    input[31:0]     cp1_wdata,
    input           updfcc_en,
    input[2:0]      updfcc_addr,
    input           updfcc_cc,
    input           updfpe_en,
    input[`FPECNT - 1:0]    updfpe_fpeword,
    input           updfpe_exception,       //是否真的引发异常，用于修改Cause
    //FPU -> CPU 交互端口
    //mfc1(传递32位数据到mdu保留站), swc1/sdc1(传递32/64位数据到mu保留站), movf/movt(传递bool到mdu保留站)
    //需要3个通道
    output reg      tomdu_valid,
    output reg[$clog2(`ROB_SIZE) - 1:0] tomdu_num,
    output reg[31:0]    tomdu_data,
    output          tomdu_bool_valid,
    output[$clog2(`ROB_SIZE) - 1:0] tomdu_bool_num,
    output          tomdu_bool_data,
    output reg      tomu_valid,
    output reg[$clog2(`ROB_SIZE) - 1:0] tomu_num,
    output reg[63:0]    tomu_data,
    //CPU -> FPU 交互端口
    //mtc1/movn/movz(从mdu传递32位数据到fpu保留站), lwc1/ldc1(从mu传递32位(2个)数据到fpu保留站), 
    input           frommdu_valid,
    input[$clog2(`ROB_SIZE) - 1:0]  frommdu_num,
    input[31:0]     frommdu_data,
    input           frommu_valid,
    input           frommu_notlast,     //Note: 对于ldc1，送出第一个word时有效，表示不要置ready
    input[$clog2(`ROB_SIZE) - 1:0]  frommu_num,
    input[31:0]     frommu_data,
    //来自CP0
    input           cp1_en
    );

    //主FPU保留站
    reg[`STATION_FPU_SIZE - 1:0]    station_fpu_valid;
    //附加的指令信息：[4:0]=wprf0, [9:5]=wprf1, [13:10]=waddr, [13+fpu_global_cnt:14]=fpu_g_ctrl, [15+fpuglobalcnt:14+fpuglobalcnt]=roundmode
    reg[15 + `FPU_GLOBAL_CNT:0]     station_fpu_ext[0:`STATION_FPU_SIZE - 1];
    reg[4:0]    station_fpu_fs_0[0:`STATION_FPU_SIZE - 1];
    reg[4:0]    station_fpu_fs_1[0:`STATION_FPU_SIZE - 1];
    reg[4:0]    station_fpu_ft_0[0:`STATION_FPU_SIZE - 1];
    reg[4:0]    station_fpu_ft_1[0:`STATION_FPU_SIZE - 1];
    reg[`STATION_FPU_SIZE - 1:0]    station_fpu_fs_ready_0;
    reg[`STATION_FPU_SIZE - 1:0]    station_fpu_fs_ready_1;
    reg[`STATION_FPU_SIZE - 1:0]    station_fpu_ft_ready_0;
    reg[`STATION_FPU_SIZE - 1:0]    station_fpu_ft_ready_1;
    reg[`FPUCTRL_CNT - 1:0]         station_fpu_ctrl[0:`STATION_FPU_SIZE - 1];
    reg[1:0]    station_fpu_prior[0:`STATION_FPU_SIZE - 1];
    //Note: 对于从CPU输入进来的数据，输入buffer，在发射时读取buffer
    reg[`STATION_FPU_SIZE - 1:0]    station_fpu_frommuready;
    reg[`STATION_FPU_SIZE - 1:0]    station_fpu_frommduready;
    reg[$clog2(`ROB_SIZE) - 1:0]    station_fpu_robnum[0:`STATION_FPU_SIZE - 1];
    reg[`FINFOCNT - 1:0]            station_fpu_finfo[0:`STATION_FPU_SIZE - 1];

    //主FPU保留站选路（按照容量=4）
    wire[3:0] station_fpu_sel;
    wire[3:0] station_fpu_can;
    wire[3:0] fsftcan=station_fpu_fs_ready_0 & station_fpu_fs_ready_1 & station_fpu_ft_ready_0 & station_fpu_ft_ready_1 & station_fpu_frommduready & station_fpu_frommuready;
    assign station_fpu_can=fsftcan;
    wire[3:0] fpucannot=(~station_fpu_can) | ~station_fpu_valid;
    wire station_fpu_issueready=~(&fpucannot);
    assign station_fpu_sel[0]=station_fpu_valid[0] & station_fpu_can[0] & (
        (~(|station_fpu_prior[0])) | ((fpucannot[1] | (station_fpu_prior[1][1] & ~(&station_fpu_prior[0]))) & (fpucannot[2] | (station_fpu_prior[2][1] & ~(&station_fpu_prior[0]))) & (fpucannot[3] | (station_fpu_prior[3][1] & ~(&station_fpu_prior[0])))));
    assign station_fpu_sel[1]=station_fpu_valid[1] & station_fpu_can[1] & (
        (~(|station_fpu_prior[1])) | ((fpucannot[0] | (station_fpu_prior[0][1] & ~(&station_fpu_prior[1]))) & (fpucannot[2] | (station_fpu_prior[2][1] & ~(&station_fpu_prior[1]))) & (fpucannot[3] | (station_fpu_prior[3][1] & ~(&station_fpu_prior[1])))));
    assign station_fpu_sel[2]=station_fpu_valid[2] & station_fpu_can[2] & (
        (~(|station_fpu_prior[2])) | ((fpucannot[0] | (station_fpu_prior[0][1] & ~(&station_fpu_prior[2]))) & (fpucannot[1] | (station_fpu_prior[1][1] & ~(&station_fpu_prior[2]))) & (fpucannot[3] | (station_fpu_prior[3][1] & ~(&station_fpu_prior[2])))));
    assign station_fpu_sel[3]=station_fpu_valid[3] & station_fpu_can[3] & (
        (~(|station_fpu_prior[3])) | ((fpucannot[0] | (station_fpu_prior[0][1] & ~(&station_fpu_prior[3]))) & (fpucannot[1] | (station_fpu_prior[1][1] & ~(&station_fpu_prior[3]))) & (fpucannot[2] | (station_fpu_prior[2][1] & ~(&station_fpu_prior[3])))));
    wire[$clog2(`ROB_SIZE) - 1:0] sel_fpu_robnum=(|station_fpu_sel[1:0]) ? (station_fpu_sel[0] ? station_fpu_robnum[0] : station_fpu_robnum[1]) : (station_fpu_sel[2] ? station_fpu_robnum[2] : station_fpu_robnum[3]);
    wire[4:0] sel_fpu_fs_0=(|station_fpu_sel[3:2]) ? (station_fpu_sel[2] ? station_fpu_fs_0[2] : station_fpu_fs_0[3]) : (station_fpu_sel[0] ? station_fpu_fs_0[0] : station_fpu_fs_0[1]);
    wire[4:0] sel_fpu_fs_1=(|station_fpu_sel[1:0]) ? (station_fpu_sel[1] ? station_fpu_fs_1[1] : station_fpu_fs_1[0]) : (station_fpu_sel[3] ? station_fpu_fs_1[3] : station_fpu_fs_1[2]);
    wire[4:0] sel_fpu_ft_0=(|station_fpu_sel[3:2]) ? (station_fpu_sel[3] ? station_fpu_ft_0[3] : station_fpu_ft_0[2]) : (station_fpu_sel[1] ? station_fpu_ft_0[1] : station_fpu_ft_0[0]);
    wire[4:0] sel_fpu_ft_1=(|station_fpu_sel[1:0]) ? (station_fpu_sel[0] ? station_fpu_ft_1[0] : station_fpu_ft_1[1]) : (station_fpu_sel[2] ? station_fpu_ft_1[2] : station_fpu_ft_1[3]);
    wire[`FINFOCNT - 1:0] sel_fpu_finfo=(|station_fpu_sel[1:0]) ? (station_fpu_sel[0] ? station_fpu_finfo[0] : station_fpu_finfo[1]) : (station_fpu_sel[2] ? station_fpu_finfo[2] : station_fpu_finfo[3]);
    wire[15 + `FPU_GLOBAL_CNT:0] sel_fpu_ext=(|station_fpu_sel[1:0]) ? (station_fpu_sel[0] ? station_fpu_ext[0] : station_fpu_ext[1]) : (station_fpu_sel[2] ? station_fpu_ext[2] : station_fpu_ext[3]);

    //fccu保留站
    reg[`STATION_FCCU_SIZE - 1:0]   station_fccu_valid;
    //附加的指令信息：[4:0]=wprf0, [9:5]=wprf1, [13:10]=waddr, 
    //[29:14]=instlo, [32:30]=fccaddr, [64:33]=pc, [96:65]=predicttarget,
    //[97]=predict, [97+fpu_g_cnt:98]=globalctrl
    reg[97 + `FPU_GLOBAL_CNT:0]     station_fccu_ext[0:`STATION_FCCU_SIZE - 1];
    reg[1:0]    station_fccu_prior[0:`STATION_FCCU_SIZE - 1];
    reg[4:0]    station_fccu_fs_0[0:`STATION_FCCU_SIZE - 1];
    reg[4:0]    station_fccu_fs_1[0:`STATION_FCCU_SIZE - 1];
    reg[4:0]    station_fccu_ft_0[0:`STATION_FCCU_SIZE - 1];
    reg[4:0]    station_fccu_ft_1[0:`STATION_FCCU_SIZE - 1];
    reg[`STATION_FCCU_SIZE - 1:0]   station_fccu_fs_ready_0;
    reg[`STATION_FCCU_SIZE - 1:0]   station_fccu_fs_ready_1;
    reg[`STATION_FCCU_SIZE - 1:0]   station_fccu_ft_ready_0;
    reg[`STATION_FCCU_SIZE - 1:0]   station_fccu_ft_ready_1;
    reg[`FCCUCTRL_CNT - 1:0]        station_fccu_ctrl[0:`STATION_FCCU_SIZE - 1];
    reg[$clog2(`ROB_SIZE) - 1:0]    station_fccu_robnum[0:`STATION_FCCU_SIZE - 1];
    reg[`FINFOCNT - 1:0]            station_fccu_finfo[0:`STATION_FCCU_SIZE - 1];
    reg[2:0]    station_fccu_restcnt;   //维护保留站指令个数

    //fccu保留站选路
    wire[3:0] station_fccu_can=station_fccu_fs_ready_0 & station_fccu_fs_ready_1 & station_fccu_ft_ready_0 & station_fccu_ft_ready_1;
    wire[3:0] station_fccu_sel;
    wire[3:0] station_fccu_head;
    assign station_fccu_head[0]=station_fccu_valid[0] & ~(|station_fccu_prior[0]);
    assign station_fccu_head[1]=station_fccu_valid[1] & ~(|station_fccu_prior[1]);
    assign station_fccu_head[2]=station_fccu_valid[2] & ~(|station_fccu_prior[2]);
    assign station_fccu_head[3]=station_fccu_valid[3] & ~(|station_fccu_prior[3]);
    assign station_fccu_sel=station_fccu_valid & station_fccu_can & station_fccu_head;
    wire station_fccu_issueready=|station_fccu_sel;
    wire[4:0] sel_fccu_fs_0=(|station_fccu_head[1:0]) ? (station_fccu_head[0] ? station_fccu_fs_0[0] : station_fccu_fs_0[1]) : (station_fccu_head[2] ? station_fccu_fs_0[2] : station_fccu_fs_0[3]);
    wire[4:0] sel_fccu_fs_1=(|station_fccu_head[1:0]) ? (station_fccu_head[0] ? station_fccu_fs_1[0] : station_fccu_fs_1[1]) : (station_fccu_head[2] ? station_fccu_fs_1[2] : station_fccu_fs_1[3]);
    wire[4:0] sel_fccu_ft_0=(|station_fccu_head[1:0]) ? (station_fccu_head[0] ? station_fccu_ft_0[0] : station_fccu_ft_0[1]) : (station_fccu_head[2] ? station_fccu_ft_0[2] : station_fccu_ft_0[3]);
    wire[4:0] sel_fccu_ft_1=(|station_fccu_head[1:0]) ? (station_fccu_head[0] ? station_fccu_ft_1[0] : station_fccu_ft_1[1]) : (station_fccu_head[2] ? station_fccu_ft_1[2] : station_fccu_ft_1[3]);
    wire[`FINFOCNT - 1:0] sel_fccu_finfo=(|station_fccu_head[1:0]) ? (station_fccu_head[0] ? station_fccu_finfo[0] : station_fccu_finfo[1]) : (station_fccu_head[2] ? station_fccu_finfo[2] : station_fccu_finfo[3]);
    wire[97 + `FPU_GLOBAL_CNT:0] sel_fccu_ext=(|station_fccu_head[1:0]) ? (station_fccu_head[0] ? station_fccu_ext[0] : station_fccu_ext[1]) : (station_fccu_head[2] ? station_fccu_ext[2] : station_fccu_ext[3]);

    //接受CPU输入的缓冲
    reg[31:0]   buffer_frommu0[0:`ROB_SIZE - 1];    //低32位
    reg[31:0]   buffer_frommu1[0:`ROB_SIZE - 1];
    reg[31:0]   buffer_frommdu[0:`ROB_SIZE - 1];
    reg[`ROB_SIZE - 1:0]    buffer_frommu_ready;
    reg[`ROB_SIZE - 1:0]    buffer_frommdu_ready;
    reg[`ROB_SIZE - 1:0]    buffer_frommu_hasfirst; //是否已经接受低32位
    reg[31:0]   buffer_frommu0_rdata;
    reg[31:0]   buffer_frommu1_rdata;
    reg[31:0]   buffer_frommdu_rdata;
    wire[$clog2(`ROB_SIZE) - 1:0] buffer_raddr;
    wire        buffer_rden;

    always@(posedge clk) begin
        if(buffer_rden) begin
            buffer_frommu0_rdata<=buffer_frommu0[buffer_raddr];
            buffer_frommu1_rdata<=buffer_frommu1[buffer_raddr];
            buffer_frommdu_rdata<=buffer_frommdu[buffer_raddr];
        end
    end

    //Rename/FDecode流水线寄存器
    //Note: 将其搞成容量为2的buffer，这样提供给CPU的busy与FPU内部阻塞信号无直接关系
    reg[31:0]   rfd_inst[0:1];
    //附加信息：[31:0]=PC, [63:32]=predicttarget, [64]=predict, [64+robsize:65]=robnum
    reg[64 + $clog2(`ROB_SIZE):0]   rfd_ext[0:1];
    reg[1:0]    rfd_valid;
    reg[1:0]    rfd_first;
    wire[31:0]  real_rfd_inst=rfd_first[0] ? rfd_inst[0] : rfd_inst[1];
    wire[64 + $clog2(`ROB_SIZE):0]  real_rfd_ext=rfd_first[0] ? rfd_ext[0] : rfd_ext[1];

    //FDecode/FRename流水线寄存器
    //附加信息：[31:0]=PC, [63:32]=predicttarget, [64]=predict
    //[80:65]=instlo, [82:81]=round_mode, [85:83]=fccaddr,
    //[85+robsize:86]=robnum, [85+robsize+fpuglobalcnt:86+robsize]=fpugctrl
    //[85+robsize+fpuglobalcnt+fpuctrlcnt:86+robsize+fpuglobalcnt]=fpuctrl
    //[85+robsize+fpuglobalcnt+fpuctrlcnt+fccuctrlcnt:86+robsize+fpuglobalcnt+fpuctrlcnt]=fccuctrl
    reg[85 + $clog2(`ROB_SIZE) + `FPU_GLOBAL_CNT + `FPUCTRL_CNT + `FCCUCTRL_CNT:0]    fdfr_ext;
    reg[`FINFOCNT - 1:0]    fdfr_finfo;
    reg[3:0]                fdfr_fd;
    reg[3:0]                fdfr_fs;
    reg[3:0]                fdfr_ft;
    reg                     fdfr_valid;

    //FRename/FDispatch流水线寄存器
    reg[$clog2(`ROB_SIZE) - 1:0]    fdisp_robnum;
    //附加信息：[31:0]=PC, [63:32]=predicttarget, [64]=predict
    //[80:65]=instlo, [82:81]=round_mode, [85:83]=fccaddr,
    //[85+fpuglobalcnt:86]=fpugctrl
    //[85+fpuglobalcnt+fpuctrlcnt:86+fpuglobalcnt]=fpuctrl
    //[85+fpuglobalcnt+fpuctrlcnt+fccuctrlcnt:86+fpuglobalcnt+fpuctrlcnt]=fccuctrl
    reg[85 + `FPU_GLOBAL_CNT + `FPUCTRL_CNT + `FCCUCTRL_CNT:0]    fdisp_ext;
    reg[`FINFOCNT - 1:0]    fdisp_finfo;
    reg                     fdisp_valid;
    reg[4:0]                fdisp_wprf0;
    reg[4:0]                fdisp_wprf1;
    reg[4:0]                fdisp_fs_0;
    reg[4:0]                fdisp_fs_1;
    reg[4:0]                fdisp_ft_0;
    reg[4:0]                fdisp_ft_1;
    reg[3:0]                fdisp_fs;
    reg[3:0]                fdisp_ft;
    reg[3:0]                fdisp_fd;

    //WB流水线寄存器
    reg[`FPU_GLOBAL_CNT - 1:0]          fwb_gctrl;
    reg[$clog2(`ROB_SIZE) - 1:0]        fwb_robnum;
    reg[$clog2(`CNT_EXCEPTION) - 1:0]   fwb_excode;
    reg[`FPECNT - 1:0]      fwb_fpeword;
    reg[63:0]               fwb_result;
    reg[3:0]                fwb_waddr;
    reg[4:0]                fwb_wprf0;
    reg[4:0]                fwb_wprf1;
    reg                     fwb_valid;
    assign rob_wb_en=fwb_valid;
    assign rob_wb_result=fwb_result;
    assign rob_wb_num=fwb_robnum;
    assign rob_wb_excode=fwb_excode;
    assign rob_wb_waddr=fwb_waddr;
    assign rob_wb_wprf0=fwb_wprf0;
    assign rob_wb_wprf1=fwb_wprf1;
    assign rob_wb_gctrl=fwb_gctrl;
    assign rob_wb_fpeword=fwb_fpeword;


    //控制寄存器组
    reg[1:0]                fcsr_round_mode;
    reg                     fcsr_fs;
    reg[7:0]                fcsr_fcc;
    reg[4:0]                fcsr_enable;
    reg[4:0]                fcsr_flags;
    reg[5:0]                fcsr_cause;
    wire[31:0]  FIR=(1 << 20) | (1 << 17) | (1 << 16);
    wire[31:0]  FCSR={fcsr_fcc[7:1],fcsr_fs,fcsr_fcc[0],5'b0,fcsr_cause,fcsr_enable,fcsr_flags,fcsr_round_mode};
    wire[31:0]  FCCR={24'b0,fcsr_fcc};
    wire[31:0]  FEXR={14'b0,fcsr_cause,5'b0,fcsr_flags,2'b0};
    wire[31:0]  FENR={20'b0,fcsr_enable,4'b0,fcsr_fs,fcsr_round_mode};
    reg[31:0] fcr;
    assign cp1_rdata=fcr;
    always@(*) begin
        case(cp1_raddr)
        0:  fcr=FIR;
        31: fcr=FCSR;
        25: fcr=FCCR;
        26: fcr=FEXR;
        28: fcr=FENR;
        default:    fcr=0;
        endcase
    end
    reg[7:0] chgfcc;
    always@(*) begin
        case(updfcc_addr)
        0:  chgfcc={fcsr_fcc[7:1],updfcc_cc};
        1:  chgfcc={fcsr_fcc[7:2],updfcc_cc,fcsr_fcc[0]};
        2:  chgfcc={fcsr_fcc[7:3],updfcc_cc,fcsr_fcc[1:0]};
        3:  chgfcc={fcsr_fcc[7:4],updfcc_cc,fcsr_fcc[2:0]};
        4:  chgfcc={fcsr_fcc[7:5],updfcc_cc,fcsr_fcc[3:0]};
        5:  chgfcc={fcsr_fcc[7:6],updfcc_cc,fcsr_fcc[4:0]};
        6:  chgfcc={fcsr_fcc[7],updfcc_cc,fcsr_fcc[5:0]};
        7:  chgfcc={updfcc_cc,fcsr_fcc[6:0]};
        default:;
        endcase
    end
    wire[7:0]   newfcc=(cp1_wen & ((cp1_waddr == 31) | (cp1_waddr == 25))) ? ((cp1_waddr == 31) ? {cp1_wdata[31:25],cp1_wdata[23]} : cp1_wdata[7:0]) : (updfcc_en ? chgfcc : fcsr_fcc);
    always@(posedge clk) begin
        if(~resetn) begin
            fcsr_round_mode<=0;
            fcsr_fs<=0;
            fcsr_fcc<=0;
            fcsr_enable<=0;
            fcsr_flags<=0;
            fcsr_cause<=0;
        end
        else begin
            if(cp1_wen & ((cp1_waddr == 31) | (cp1_waddr == 28))) begin
                fcsr_round_mode<=cp1_wdata[1:0];
                fcsr_fs<=(cp1_waddr == 31) ? cp1_wdata[24] : cp1_wdata[2];
            end
            //if(cp1_wen & ((cp1_waddr == 31) | (cp1_waddr == 25)))
              //  fcsr_fcc<=(cp1_waddr == 31) ? {cp1_wdata[31:25],cp1_wdata[23]} : cp1_wdata[7:0];
            //else if(updfcc_en)
              //  fcsr_fcc<=chgfcc;
            fcsr_fcc<=newfcc;

            if(cp1_wen & ((cp1_waddr == 31) | (cp1_waddr == 28)))
                fcsr_enable<=cp1_wdata[11:7];
            if(cp1_wen & ((cp1_waddr == 31) | (cp1_waddr == 26)))
                fcsr_flags<=cp1_wdata[6:2];
            else if(updfpe_en)
                fcsr_flags<=fcsr_flags | {1'b0,updfpe_fpeword[`FPE_INVALID],updfpe_fpeword[`FPE_DIVIDEBYZERO],updfpe_fpeword[`FPE_OVERFLOW],updfpe_fpeword[`FPE_UNDERFLOW],1'b0};
            if(cp1_wen & ((cp1_waddr == 31) | (cp1_waddr == 26)))
                fcsr_cause<=cp1_wdata[17:12];
            else if(updfpe_en & updfpe_exception)
                fcsr_cause<={1'b0,updfpe_fpeword[`FPE_INVALID],updfpe_fpeword[`FPE_DIVIDEBYZERO],updfpe_fpeword[`FPE_OVERFLOW],updfpe_fpeword[`FPE_UNDERFLOW],1'b0};
        end
    end


    //阻塞信号
    wire fdisp_wait=fdisp_valid & ((fdisp_finfo[`FINFO_FCCINST] & (&station_fccu_valid)) | ((~fdisp_finfo[`FINFO_FCCINST]) & (&station_fpu_valid)));
    wire frename_busy;      //TODO
    wire fdfr_wait=fdfr_valid & (frename_busy | fdisp_wait);
    wire rfd_wait=fdfr_wait;
    assign busy=&rfd_valid;

    //物理寄存器文件
    wire[4:0]   frename_prf0;
    wire[4:0]   frename_prf1;
    wire[4:0]   frename_fs_prf0;
    wire[4:0]   frename_fs_prf1;
    wire[4:0]   frename_ft_prf0;
    wire[4:0]   frename_ft_prf1;
    wire        fdispatch_fs_ready0;
    wire        fdispatch_fs_ready1;
    wire        fdispatch_ft_ready0;
    wire        fdispatch_ft_ready1;
    wire[31:0]  rd_fpu_fs_data0;
    wire[31:0]  rd_fpu_fs_data1;
    wire[31:0]  rd_fpu_ft_data0;
    wire[31:0]  rd_fpu_ft_data1;
    wire[31:0]  rd_fccu_fs_data0;
    wire[31:0]  rd_fccu_fs_data1;
    wire[31:0]  rd_fccu_ft_data0;
    wire[31:0]  rd_fccu_ft_data1;
    f_prf prf(
        .clk(clk),.resetn(resetn),.flush(flush),
        .fpr_wen0(fpr_wen0),.fpr_wen1(fpr_wen1),
        .fpr_waddr(fpr_waddr),.fpr_wprf0(fpr_wprf0),.fpr_wprf1(fpr_wprf1),
        .frename_wen0(fdfr_finfo[`FINFO_WEN0] & (~fdisp_wait) & fdfr_valid),.frename_wen1(fdfr_finfo[`FINFO_WEN1] & (~fdisp_wait) & fdfr_valid),
        .frename_waddr(fdfr_fd),.frename_busy(frename_busy),
        .frename_prf0(frename_prf0),.frename_prf1(frename_prf1),
        .frename_fs_addr(fdfr_fs),.frename_ft_addr(fdfr_ft),
        .frename_fs_prf0(frename_fs_prf0),.frename_fs_prf1(frename_fs_prf1),
        .frename_ft_prf0(frename_ft_prf0),.frename_ft_prf1(frename_ft_prf1),
        .fdispatch_fs_prf0(fdisp_fs_0),.fdispatch_fs_prf1(fdisp_fs_1),
        .fdispatch_ft_prf0(fdisp_ft_0),.fdispatch_ft_prf1(fdisp_ft_1),
        .fdispatch_fs_ready0(fdispatch_fs_ready0),.fdispatch_fs_ready1(fdispatch_fs_ready1),
        .fdispatch_ft_ready0(fdispatch_ft_ready0),.fdispatch_ft_ready1(fdispatch_ft_ready1),
        .prf_wen0(fwb_gctrl[`FPU_G_WEN0] & fwb_valid),.prf_wen1(fwb_gctrl[`FPU_G_WEN1] & fwb_valid),
        .prf_waddr0(fwb_wprf0),.prf_waddr1(fwb_wprf1),.prf_wdata(fwb_result),
        .rd_a_fs_addr0(sel_fpu_fs_0),.rd_a_fs_addr1(sel_fpu_fs_1),
        .rd_a_ft_addr0(sel_fpu_ft_0),.rd_a_ft_addr1(sel_fpu_ft_1),
        .rd_b_fs_addr0(sel_fccu_fs_0),.rd_b_fs_addr1(sel_fccu_fs_1),
        .rd_b_ft_addr0(sel_fccu_ft_0),.rd_b_ft_addr1(sel_fccu_ft_1),
        .rd_a_fs_data0(rd_fpu_fs_data0),.rd_a_fs_data1(rd_fpu_fs_data1),
        .rd_a_ft_data0(rd_fpu_ft_data0),.rd_a_ft_data1(rd_fpu_ft_data1),
        .rd_b_fs_data0(rd_fccu_fs_data0),.rd_b_fs_data1(rd_fccu_fs_data1),
        .rd_b_ft_data0(rd_fccu_ft_data0),.rd_b_ft_data1(rd_fccu_ft_data1)
    );

    
    //Note: 对于FPU/FCCU输入的64位操作数，如果使用的是奇fpr的32位，则需要把高位转到低位
    //如果写回的是奇fpr的32位，则需要把结果低位转到高位

    //主FPU
    //info格式：[4:0]=wprf0, [9:5]=wprf1, [13:10]=waddr, [13+fpu_global_cnt:14]=fpu_g_ctrl, 更高处是robnum
    //这和station里的extinfo是一样的
    wire            fpu_wait;   //TODO, 其优先级低于fccu
    wire            fpu_busy;
    wire            fpu_ready;
    wire[63:0]      fpu_result;
    wire[4:0]       fpu_wprf0;
    wire[4:0]       fpu_wprf1;
    wire[3:0]       fpu_waddr;
    wire[`FPU_GLOBAL_CNT - 1:0] fpu_gctrl;
    wire            fpu_invalid;
    wire            fpu_overflow;
    wire            fpu_dividebyzero;
    wire            fpu_underflow;
    wire[63:0]      fpu_issuefs={rd_fpu_fs_data1,(~sel_fpu_finfo[`FINFO_USEFS0]) ? rd_fpu_fs_data1 : rd_fpu_fs_data0};
    wire[$clog2(`ROB_SIZE) - 1:0]   fpu_robnum;
    assign buffer_raddr=sel_fpu_robnum;
    assign buffer_rden=~fpu_busy;
    fu_fpu #(.info_width(14 + `FPU_GLOBAL_CNT + $clog2(`ROB_SIZE))) mainfpu(
        .clk(clk),.resetn(resetn),.flush(flush),.a_wait(fpu_wait),.fcsr_round_mode(fcsr_round_mode),.fcsr_fs(fcsr_fs),
        .info_in({sel_fpu_robnum,sel_fpu_ext[13 + `FPU_GLOBAL_CNT:0]}),
        .op_a(fpu_issuefs),
        .op_b({rd_fpu_ft_data1,(~sel_fpu_finfo[`FINFO_USEFT0]) ? rd_fpu_ft_data1 : rd_fpu_ft_data0}),
        .op_from_mu({/*buffer_frommu1[sel_fpu_robnum]*/buffer_frommu1_rdata,/*buffer_frommu0[sel_fpu_robnum]*/buffer_frommu0_rdata}),
        .op_from_mdu(/*buffer_frommdu[sel_fpu_robnum]*/buffer_frommdu_rdata),
        .fpu_ctrl((|station_fpu_sel[1:0]) ? (station_fpu_sel[0] ? station_fpu_ctrl[0] : station_fpu_ctrl[1]) : (station_fpu_sel[2] ? station_fpu_ctrl[2] : station_fpu_ctrl[3])),
        .round_mode(sel_fpu_ext[15 + `FPU_GLOBAL_CNT:14 + `FPU_GLOBAL_CNT]),
        .valid(station_fpu_issueready),
        .busy(fpu_busy),.ready(fpu_ready),.result(fpu_result),
        .info_out({fpu_robnum,fpu_gctrl,fpu_waddr,fpu_wprf1,fpu_wprf0}),
        .invalid(fpu_invalid),.overflow(fpu_overflow),.underflow(fpu_underflow),.dividebyzero(fpu_dividebyzero)
    );

    //FCCU
    //info不带robnum，剩下跟fpu一样
    wire            fccu_busy;
    wire            fccu_ready;
    wire[63:0]      fccu_result;
    wire[$clog2(`ROB_SIZE) - 1:0]   fccu_robnum;
    wire[4:0]       fccu_wprf0;
    wire[4:0]       fccu_wprf1;
    wire[3:0]       fccu_waddr;
    wire[`FPU_GLOBAL_CNT - 1:0] fccu_gctrl;
    wire            fccu_invalid;
    wire[63:0]      fccu_issuefs={rd_fccu_fs_data1,(~sel_fccu_finfo[`FINFO_USEFS0]) ? rd_fccu_fs_data1 : rd_fccu_fs_data0};
    fu_fccu #(.info_width(14 + `FPU_GLOBAL_CNT)) fccu(
        .clk(clk),.resetn(resetn),.flush(flush),.flush_fcc(newfcc),.a_wait(0),.busy(fccu_busy),
        .valid(station_fccu_issueready),
        .op_a(fccu_issuefs),
        .op_b({rd_fccu_ft_data1,(~sel_fccu_finfo[`FINFO_USEFT0]) ? rd_fccu_ft_data1 : rd_fccu_ft_data0}),
        .fcc_addr(sel_fccu_ext[32:30]),.PC(sel_fccu_ext[64:33]),.predict(sel_fccu_ext[97]),
        .predict_target(sel_fccu_ext[96:65]),.inst_lo(sel_fccu_ext[29:14]),
        .fccu_ctrl((|station_fccu_head[1:0]) ? (station_fccu_head[0] ? station_fccu_ctrl[0] : station_fccu_ctrl[1]) : (station_fccu_head[2] ? station_fccu_ctrl[2] : station_fccu_ctrl[3])),
        .robnum((|station_fccu_head[1:0]) ? (station_fccu_head[0] ? station_fccu_robnum[0] : station_fccu_robnum[1]) : (station_fccu_head[2] ? station_fccu_robnum[2] : station_fccu_robnum[3])),
        .info_in({sel_fccu_ext[97 + `FPU_GLOBAL_CNT:98],sel_fccu_ext[13:0]}),
        .ready(fccu_ready),.result(fccu_result),.wbnum(fccu_robnum),
        .info_out({fccu_gctrl,fccu_waddr,fccu_wprf1,fccu_wprf0}),
        .invalid(fccu_invalid),.tocpu_valid(tomdu_bool_valid),.tocpu_num(tomdu_bool_num),.tocpu_data(tomdu_bool_data)
    );

    assign fpu_wait=fccu_ready;

    //WB
    always@(posedge clk) begin
        if(~resetn) begin
            fwb_gctrl<=0;
            fwb_robnum<=0;
            fwb_excode<=0;
            fwb_fpeword<=0;
            fwb_result<=0;
            fwb_waddr<=0;
            fwb_wprf0<=0;
            fwb_wprf1<=0;
            fwb_valid<=0;
        end
        else begin
            if(flush)
                fwb_valid<=0;
            else
                fwb_valid<=fpu_ready | fccu_ready;
            fwb_gctrl<=fccu_ready ? fccu_gctrl : fpu_gctrl;
            fwb_robnum<=fccu_ready ? fccu_robnum : fpu_robnum;
            fwb_excode<=fccu_ready ? (cp1_en ? ((fccu_invalid & fcsr_enable[4]) ? `E_fpe : 0) : `E_copunusable) : (fpu_gctrl[`FPU_G_RI] ? `E_reserved : (cp1_en ? (((fpu_invalid & fcsr_enable[4]) | (fpu_dividebyzero & fcsr_enable[3]) | (fpu_underflow & fcsr_enable[1]) | (fpu_overflow & fcsr_enable[2])) ? `E_fpe : 0) : `E_copunusable));
            fwb_fpeword<=fccu_ready ? (fccu_invalid ? 1 : 0) : {fpu_dividebyzero,fpu_underflow,fpu_overflow,fpu_invalid};
            fwb_result<=fccu_ready ? fccu_result : fpu_result;
            fwb_waddr<=fccu_ready ? fccu_waddr : fpu_waddr;
            fwb_wprf0<=fccu_ready ? fccu_wprf0 : fpu_wprf0;
            fwb_wprf1<=fccu_ready ? fccu_wprf1 : fpu_wprf1;
        end
    end

    //Rename/FDecode
    always@(posedge clk) begin
        if(~resetn) begin
            rfd_inst[0]<=0;
            rfd_inst[1]<=0;
            rfd_ext[0]<=0;
            rfd_ext[1]<=0;
            rfd_valid<=0;
            rfd_first<=1'b01;
        end
        else begin
            if(flush)
                rfd_valid[0]<=0;
            else if(rfd_valid[0])
                rfd_valid[0]<=~(rfd_first[0] & ~rfd_wait);
            else
                rfd_valid[0]<=inst_valid;
            if(flush)
                rfd_valid[1]<=0;
            else if(rfd_valid[1])
                rfd_valid[1]<=~(rfd_first[1] & ~rfd_wait);
            else if(rfd_valid[0])
                rfd_valid[1]<=inst_valid;
            if(~rfd_valid[0]) begin
                rfd_inst[0]<=inst;
                rfd_ext[0]<={robnum,predict,predict_target,PC};
            end
            if(~rfd_valid[1]) begin
                rfd_inst[1]<=inst;
                rfd_ext[1]<={robnum,predict,predict_target,PC};
            end
            //first怎么变？当pop时取，或者这个时刻全0
            if((rfd_valid == 0) | ~rfd_wait) 
                rfd_first<=(rfd_valid == 0) ? 2'b01 : (~rfd_first);
        end
    end

    //FDecode/FRename
    wire[3:0]           fd_fs;
    wire[3:0]           fd_ft;
    wire[3:0]           fd_fd;
    wire[`FINFOCNT - 1:0]       fd_finfo;
    wire[1:0]           fd_round_mode;
    wire[`FPUCTRL_CNT - 1:0]    fd_fpu_ctrl;
    wire[`FCCUCTRL_CNT - 1:0]   fd_fccu_ctrl;
    wire[`FPU_GLOBAL_CNT - 1:0] fd_fpu_global_ctrl;
    wire[2:0]           fd_fcc_addr;
    f_decoder fdecoder(
        .inst(real_rfd_inst),.fs(fd_fs),.ft(fd_ft),.fd(fd_fd),.finfo(fd_finfo),
        .round_mode(fd_round_mode),.fpu_ctrl(fd_fpu_ctrl),.fccu_ctrl(fd_fccu_ctrl),
        .fpu_global_ctrl(fd_fpu_global_ctrl),.fcc_addr(fd_fcc_addr),.reserved()
    );
    always@(posedge clk) begin
        if(~resetn) begin
            fdfr_ext<=0;
            fdfr_finfo<=0;
            fdfr_fd<=0;
            fdfr_fs<=0;
            fdfr_ft<=0;
            fdfr_valid<=0;
        end
        else begin
            if(flush)
                fdfr_valid<=0;
            else if(~fdfr_wait)
                fdfr_valid<=|rfd_valid;
            if(~fdfr_wait) begin
                fdfr_ext<={fd_fccu_ctrl,fd_fpu_ctrl,fd_fpu_global_ctrl,real_rfd_ext[64 + $clog2(`ROB_SIZE):65],
                    fd_fcc_addr,fd_round_mode,real_rfd_inst[15:0],real_rfd_ext[64:0]};
                fdfr_finfo<=fd_finfo;
                fdfr_fd<=fd_fd;
                fdfr_fs<=fd_fs;
                fdfr_ft<=fd_ft;
            end
        end
    end

    //FRename/FDispatch
    always@(posedge clk) begin
        if(~resetn) begin
            fdisp_robnum<=0;
            fdisp_ext<=0;
            fdisp_finfo<=0;
            fdisp_valid<=0;
            fdisp_wprf0<=0;
            fdisp_wprf1<=0;
            fdisp_fs_0<=0;
            fdisp_fs_1<=0;
            fdisp_ft_0<=0;
            fdisp_ft_1<=0;
            fdisp_fs<=0;
            fdisp_ft<=0;
            fdisp_fd<=0;
        end
        else begin
            if(flush)
                fdisp_valid<=0;
            else if(~fdisp_wait)
                fdisp_valid<=fdfr_valid & ~frename_busy;
            if(~fdisp_wait) begin
                fdisp_robnum<=fdfr_ext[85 + $clog2(`ROB_SIZE):86];
                fdisp_fs<=fdfr_fs;
                fdisp_ft<=fdfr_ft;
                fdisp_fd<=fdfr_fd;
                fdisp_ext<={fdfr_ext[85 + $clog2(`ROB_SIZE) + `FPU_GLOBAL_CNT + `FPUCTRL_CNT + `FCCUCTRL_CNT:86 + $clog2(`ROB_SIZE)],fdfr_ext[85:0]};
                fdisp_finfo<=fdfr_finfo;
                fdisp_wprf0<=frename_prf0;
                fdisp_wprf1<=frename_prf1;
                fdisp_fs_0<=frename_fs_prf0;
                fdisp_fs_1<=frename_fs_prf1;
                fdisp_ft_0<=frename_ft_prf0;
                fdisp_ft_1<=frename_ft_prf1;
            end
        end
    end

    //FPU保留站更新
    wire[3:0] fpu_disp_sel;
    assign fpu_disp_sel[0]=~station_fpu_valid[0];
    assign fpu_disp_sel[1]=station_fpu_valid[0] & ~station_fpu_valid[1];
    assign fpu_disp_sel[2]=(&station_fpu_valid[1:0]) & ~station_fpu_valid[2];
    assign fpu_disp_sel[3]=(&station_fpu_valid[2:0]) & ~station_fpu_valid[3];
    wire[1:0] fpuselprior=(|fpu_disp_sel[1:0]) ? (fpu_disp_sel[0] ? station_fpu_prior[0] : station_fpu_prior[1]) : (fpu_disp_sel[2] ? station_fpu_prior[2] : station_fpu_prior[3]);
    genvar i;
    generate
        for(i = 0; i < `STATION_FPU_SIZE; i = i + 1) begin
            always@(posedge clk) begin
                if(~resetn) begin
                    station_fpu_valid[i]<=0;
                    station_fpu_ext[i]<=0;
                    station_fpu_fs_0[i]<=0;
                    station_fpu_fs_1[i]<=0;
                    station_fpu_ft_0[i]<=0;
                    station_fpu_ft_1[i]<=0;
                    station_fpu_fs_ready_0[i]<=0;
                    station_fpu_fs_ready_1[i]<=0;
                    station_fpu_ft_ready_0[i]<=0;
                    station_fpu_ft_ready_1[i]<=0;
                    station_fpu_ctrl[i]<=0;
                    station_fpu_prior[i]<=i;
                    station_fpu_frommuready[i]<=0;
                    station_fpu_frommduready[i]<=0;
                    station_fpu_robnum[i]<=0;
                    station_fpu_finfo[i]<=0;
                end
                else begin
                    if(flush)
                        station_fpu_valid[i]<=0;
                    else if(fpu_disp_sel[i] | (station_fpu_sel[i] & station_fpu_can[i] & ~fpu_busy))
                        station_fpu_valid[i]<=fdisp_valid & (~station_fpu_valid[i]) & ~fdisp_finfo[`FINFO_FCCINST];
                    //info of inst
                    if(~station_fpu_valid[i]) begin
                        station_fpu_ext[i]<={fdisp_ext[82:81],fdisp_ext[85 + `FPU_GLOBAL_CNT:86],fdisp_fd,fdisp_wprf1,fdisp_wprf0};
                        station_fpu_fs_0[i]<=fdisp_fs_0;
                        station_fpu_fs_1[i]<=fdisp_fs_1;
                        station_fpu_ft_0[i]<=fdisp_ft_0;
                        station_fpu_ft_1[i]<=fdisp_ft_1;
                        station_fpu_ctrl[i]<=fdisp_ext[85 + `FPU_GLOBAL_CNT + `FPUCTRL_CNT:86 + `FPU_GLOBAL_CNT];
                        station_fpu_robnum[i]<=fdisp_robnum;
                        station_fpu_finfo[i]<=fdisp_finfo;
                    end
                    //update prior
                    if(fdisp_valid & (~fdisp_finfo[`FINFO_FCCINST]) & ~(&station_fpu_valid))
                        station_fpu_prior[i]<=fpu_disp_sel[i] ? 2'b11 : ((station_fpu_prior[i] > fpuselprior) ? {&station_fpu_prior[i],~station_fpu_prior[i][0]} : station_fpu_prior[i]);
                    if((~station_fpu_valid[i]) | (~station_fpu_fs_ready_0[i]))
                        station_fpu_fs_ready_0[i]<=((~station_fpu_valid[i]) & ((~fdisp_finfo[`FINFO_USEFS0]) | fdispatch_fs_ready0)) | (station_fpu_valid[i] & fwb_valid & ((fwb_gctrl[`FPU_G_WEN0] & (fwb_wprf0 == station_fpu_fs_0[i]))));
                    if((~station_fpu_valid[i]) | (~station_fpu_fs_ready_1[i]))
                        station_fpu_fs_ready_1[i]<=((~station_fpu_valid[i]) & ((~fdisp_finfo[`FINFO_USEFS1]) | fdispatch_fs_ready1)) | (station_fpu_valid[i] & fwb_valid & ((fwb_gctrl[`FPU_G_WEN1] & (fwb_wprf1 == station_fpu_fs_1[i]))));
                    if((~station_fpu_valid[i]) | (~station_fpu_ft_ready_0[i]))
                        station_fpu_ft_ready_0[i]<=((~station_fpu_valid[i]) & ((~fdisp_finfo[`FINFO_USEFT0]) | fdispatch_ft_ready0)) | (station_fpu_valid[i] & fwb_valid & ((fwb_gctrl[`FPU_G_WEN0] & (fwb_wprf0 == station_fpu_ft_0[i]))));
                    if((~station_fpu_valid[i]) | (~station_fpu_ft_ready_1[i]))
                        station_fpu_ft_ready_1[i]<=((~station_fpu_valid[i]) & ((~fdisp_finfo[`FINFO_USEFT1]) | fdispatch_ft_ready1)) | (station_fpu_valid[i] & fwb_valid & ((fwb_gctrl[`FPU_G_WEN1] & (fwb_wprf1 == station_fpu_ft_1[i]))));
                    if((~station_fpu_valid[i]) | (~station_fpu_frommuready[i]))
                        station_fpu_frommuready[i]<=((~station_fpu_valid[i]) & ((~fdisp_finfo[`FINFO_WAITFORMU]) | buffer_frommu_ready[fdisp_robnum] | (frommu_valid & (~frommu_notlast) & (frommu_num == fdisp_robnum)))) | (station_fpu_valid[i] & frommu_valid & (~frommu_notlast) & (frommu_num == station_fpu_robnum[i]));
                    if((~station_fpu_valid[i]) | (~station_fpu_frommduready[i]))
                        station_fpu_frommduready[i]<=((~station_fpu_valid[i]) & ((~fdisp_finfo[`FINFO_WAITFORMDU]) | buffer_frommdu_ready[fdisp_robnum] | (frommdu_valid & (frommdu_num == fdisp_robnum)))) | (station_fpu_valid[i] & frommdu_valid & (frommdu_num == station_fpu_robnum[i]));
                end
            end
        end
    endgenerate

    //FCCU保留站更新
    wire[3:0] fccu_disp_sel;
    assign fccu_disp_sel[0]=~station_fccu_valid[0];
    assign fccu_disp_sel[1]=station_fccu_valid[0] & ~station_fccu_valid[1];
    assign fccu_disp_sel[2]=(&station_fccu_valid[1:0]) & ~station_fccu_valid[2];
    assign fccu_disp_sel[3]=(&station_fccu_valid[2:0]) & ~station_fccu_valid[3];
    wire[1:0] fccuselprior=(|fccu_disp_sel[1:0]) ? (fccu_disp_sel[0] ? station_fccu_prior[0] : station_fccu_prior[1]) : (fccu_disp_sel[2] ? station_fccu_prior[2] : station_fccu_prior[3]);
    wire[2:0] newcnt=station_fccu_restcnt - {2'b0,station_fccu_issueready & ~fccu_busy};
    generate
        for(i = 0; i < `STATION_FCCU_SIZE; i = i + 1) begin
            always@(posedge clk) begin
                if(~resetn) begin
                    station_fccu_valid[i]<=0;
                    station_fccu_ext[i]<=0;
                    station_fccu_prior[i]<=i;
                    station_fccu_fs_0[i]<=0;
                    station_fccu_fs_1[i]<=0;
                    station_fccu_ft_0[i]<=0;
                    station_fccu_ft_1[i]<=0;
                    station_fccu_fs_ready_0[i]<=0;
                    station_fccu_fs_ready_1[i]<=0;
                    station_fccu_ft_ready_0[i]<=0;
                    station_fccu_ft_ready_1[i]<=0;
                    station_fccu_ctrl[i]<=0;
                    station_fccu_robnum[i]<=0;
                    station_fccu_finfo[i]<=0;
                end
                else begin
                    if(flush)
                        station_fccu_valid[i]<=0;
                    else if(fccu_disp_sel[i] | (station_fccu_sel[i] & station_fccu_can[i] & ~fccu_busy))
                        station_fccu_valid[i]<=(~station_fccu_valid[i]) & fdisp_valid & fdisp_finfo[`FINFO_FCCINST];
                    //info of inst
                    if(~station_fccu_valid[i]) begin
                        station_fccu_ext[i]<={fdisp_ext[85 + `FPU_GLOBAL_CNT:86],fdisp_ext[64],fdisp_ext[63:32],fdisp_ext[31:0],fdisp_ext[85:83],fdisp_ext[80:65],fdisp_fd,fdisp_wprf1,fdisp_wprf0};
                        station_fccu_fs_0[i]<=fdisp_fs_0;
                        station_fccu_fs_1[i]<=fdisp_fs_1;
                        station_fccu_ft_0[i]<=fdisp_ft_0;
                        station_fccu_ft_1[i]<=fdisp_ft_1;
                        station_fccu_ctrl[i]<=fdisp_ext[85 + `FPU_GLOBAL_CNT + `FPUCTRL_CNT + `FCCUCTRL_CNT:86 + `FPU_GLOBAL_CNT + `FPUCTRL_CNT];
                        station_fccu_robnum[i]<=fdisp_robnum;
                        station_fccu_finfo[i]<=fdisp_finfo;
                    end
                    //update prior
                    if((~station_fccu_valid[i]) | (station_fccu_issueready & ~fccu_busy))
                        station_fccu_prior[i]<=station_fccu_valid[i] ? {&station_fccu_prior[i],~station_fccu_prior[i][0]} : newcnt;
                    if((~station_fccu_valid[i]) | (~station_fccu_fs_ready_0[i]))
                        station_fccu_fs_ready_0[i]<=((~station_fccu_valid[i]) & ((~fdisp_finfo[`FINFO_USEFS0]) | fdispatch_fs_ready0)) | (station_fccu_valid[i] & fwb_valid & ((fwb_gctrl[`FPU_G_WEN0] & (fwb_wprf0 == station_fccu_fs_0[i]))));
                    if((~station_fccu_valid[i]) | (~station_fccu_fs_ready_1[i]))
                        station_fccu_fs_ready_1[i]<=((~station_fccu_valid[i]) & ((~fdisp_finfo[`FINFO_USEFS1]) | fdispatch_fs_ready1)) | (station_fccu_valid[i] & fwb_valid & ((fwb_gctrl[`FPU_G_WEN1] & (fwb_wprf1 == station_fccu_fs_1[i]))));
                    if((~station_fccu_valid[i]) | (~station_fccu_ft_ready_0[i]))
                        station_fccu_ft_ready_0[i]<=((~station_fccu_valid[i]) & ((~fdisp_finfo[`FINFO_USEFT0]) | fdispatch_ft_ready0)) | (station_fccu_valid[i] & fwb_valid & ((fwb_gctrl[`FPU_G_WEN0] & (fwb_wprf0 == station_fccu_ft_0[i]))));
                    if((~station_fccu_valid[i]) | (~station_fccu_ft_ready_1[i]))
                        station_fccu_ft_ready_1[i]<=((~station_fccu_valid[i]) & ((~fdisp_finfo[`FINFO_USEFT1]) | fdispatch_ft_ready1)) | (station_fccu_valid[i] & fwb_valid & ((fwb_gctrl[`FPU_G_WEN1] & (fwb_wprf1 == station_fccu_ft_1[i]))));
                end
            end
        end
    endgenerate
    always@(posedge clk) begin
        if(~resetn)
            station_fccu_restcnt<=0;
        else if(flush)
            station_fccu_restcnt<=0;
        else
            station_fccu_restcnt<=(newcnt + {2'b0,fdisp_valid & fdisp_finfo[`FINFO_FCCINST] & ~(&station_fccu_valid)});
    end

    //维护接收缓冲区
    generate
        for(i = 0; i < `ROB_SIZE; i = i + 1) begin
            initial begin
                buffer_frommu0[i]=0;
                buffer_frommu1[i]=0;
                buffer_frommdu[i]=0;
                buffer_frommdu_ready[i]=0;
                buffer_frommu_ready[i]=0;
                buffer_frommu_hasfirst[i]=0;
            end
        end
    endgenerate

`ifdef FPU_ENABLED

    generate
        for(i = 0; i < `ROB_SIZE; i = i + 1) begin
            //Note: 我们在这里是当结果写回ROB时就将对应robnum的bufready位清空
            always@(posedge clk) begin
                if(~resetn) begin
                    buffer_frommdu_ready[i]<=0;
                    buffer_frommu_ready[i]<=0;
                    buffer_frommu_hasfirst[i]<=0;
                end
                else begin
                    if(flush)
                        buffer_frommdu_ready[i]<=0;
                    else if(fwb_valid & (fwb_robnum == i))
                        buffer_frommdu_ready[i]<=0;
                    else if(frommdu_valid & (frommdu_num == i))
                        buffer_frommdu_ready[i]<=1;
                    if(flush)
                        buffer_frommu_ready[i]<=0;
                    else if(fwb_valid & (fwb_robnum == i))
                        buffer_frommu_ready[i]<=0;
                    else if(frommu_valid & (frommu_num == i) & ~frommu_notlast)
                        buffer_frommu_ready[i]<=1;
                    if(flush)
                        buffer_frommu_hasfirst[i]<=0;
                    else if(fwb_valid & (fwb_robnum == i))
                        buffer_frommu_hasfirst[i]<=0;
                    else if(frommu_valid & (frommu_num == i))
                        buffer_frommu_hasfirst[i]<=1;
                end
            end
        end
    endgenerate

    always@(posedge clk) begin
        if(frommu_valid)
            buffer_frommu1[frommu_num]<=frommu_data;
        if(frommu_valid & ~buffer_frommu_hasfirst[frommu_num])
            buffer_frommu0[frommu_num]<=frommu_data;
        if(frommdu_valid)
            buffer_frommdu[frommdu_num]<=frommdu_data;
    end
`endif
    
`ifdef FPU_ENABLED
    //维护发送寄存器
    always@(posedge clk) begin
        if(~resetn) begin
            tomdu_valid<=0;
            tomdu_num<=0;
            tomdu_data<=0;
            tomu_valid<=0;
            tomu_num<=0;
            tomu_data<=0;
        end
        else begin
            if(flush)
                tomu_valid<=0;
            else
                tomu_valid<=station_fpu_issueready & sel_fpu_finfo[`FINFO_TOMU];
            tomu_num<=sel_fpu_robnum;
            tomu_data<=fpu_issuefs;
            if(flush)
                tomdu_valid<=0;
            else
                tomdu_valid<=station_fpu_issueready & sel_fpu_finfo[`FINFO_TOMDU];
            tomdu_num<=sel_fpu_robnum;
            tomdu_data<=fpu_issuefs[31:0];
        end
    end
`else

    initial begin
        tomdu_valid=0;
        tomdu_num=0;
        tomdu_data=0;
        tomu_valid=0;
        tomu_num=0;
        tomu_data=0;
    end

`endif

endmodule