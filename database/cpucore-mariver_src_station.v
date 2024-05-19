// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    四组保留站模块，不包含Issue/Execute流水线寄存器
    Upd at 2023.6.24: 增加FPU支持：
        令station管理来自FPU数据buffer
        对于MDU保留站，增加“等待来自FPU的32位数据”和“等待来自FPU的bool数据”
            增加“发射时将rt推到FPU通道发送端”和“发射时捕获buffer中数据”
        对于MU保留站，增加“等待来自FPU的64位数据”和“发射时捕获buffer数据作为rt”
            增加“连续两发射”，并且修改偏移地址+=4，不再发射32位inst
        增加来自Commit的提交信号，从而清空buffer
*/

module station(
    input           clk,
    input           resetn,
    //来自Commit
    input           flush,
    input           commit_en0,
    input           commit_en1,
    input[$clog2(`ROB_SIZE) - 1:0]  commit_num0,
    input[$clog2(`ROB_SIZE) - 1:0]  commit_num1,
    //来自MU和MDU的阻塞信号（ALU永远不阻塞）
    input           mu_busy,
    input           mdu_busy,
    //来自Dispatch的写使能与数据选择
    input[`STATION_ALU_SIZE - 1:0]      station_alu0_wen0,  //若为1则将指令0送入
    input[`STATION_ALU_SIZE - 1:0]      station_alu1_wen0,  //若为1则将指令0送入
    input[`STATION_MU_SIZE - 1:0]       station_mu_wen0,
    input[`STATION_MDU_SIZE - 1:0]      station_mdu_wen0,
    input[`STATION_ALU_SIZE - 1:0]      station_alu0_wen1,  //若为1则将指令1送入
    input[`STATION_ALU_SIZE - 1:0]      station_alu1_wen1,  //若为1则将指令1送入
    input[`STATION_MU_SIZE - 1:0]       station_mu_wen1,
    input[`STATION_MDU_SIZE - 1:0]      station_mdu_wen1,
    //来自Dispatch的保留站选择
    input[3:0] alu0_mask,
    input[3:0] alu1_mask,
    input[2:0] mu_mask,
    input[1:0] mdu_mask,
    //传递给Dispatch的valid信号
    output[`STATION_ALU_SIZE - 1:0]     station_alu0_valid,
    output[`STATION_ALU_SIZE - 1:0]     station_alu1_valid,
    output[`STATION_MDU_SIZE - 1:0]     station_mdu_valid,
    output[`STATION_MU_SIZE - 1:0]      station_mu_valid,
    //来自Dispatch的指令
    input[31:0]                         dispatch_PC0,
    input[31:0]                         dispatch_inst0,
    input                               dispatch_predict0,
    input[31:0]                         dispatch_predict_target0,
    input[`CNT_FU - 1:0]                dispatch_futype0, //若decode检测出异常则视作ALU指令
    input[$clog2(`CNT_ALUOP) - 1:0]     dispatch_aluop0,  //若ALU指令则操作码
    input[`CNT_MDUOP - 1:0]             dispatch_mduop0,
    input[$clog2(`CNT_MUOP) - 1:0]      dispatch_muop0,
    input[`CNT_CTRL - 1:0]              dispatch_ctrl0,
    input[$clog2(`CNT_CMP) - 1:0]       dispatch_cmpop0,
    input[$clog2(`CNT_EXCEPTION) - 1:0] dispatch_excode0,
    input[$clog2(`ROB_SIZE) - 1:0]      dispatch_num0,    //指令0的ROB编号
    input                               dispatch_readyrs0,
    input                               dispatch_readyrt0,
    input[31:0]                         dispatch_rsval0,
    input[31:0]                         dispatch_rtval0,    //这俩val是读过ROB后的val
    input[$clog2(`ROB_SIZE) - 1:0]      dispatch_rsnum0,
    input[$clog2(`ROB_SIZE) - 1:0]      dispatch_rtnum0,
    input[5:0]                          dispatch_cp0addr0,
    input[31:0]                         dispatch_PC1,
    input[31:0]                         dispatch_inst1,
    input                               dispatch_predict1,
    input[31:0]                         dispatch_predict_target1,
    input[`CNT_FU - 1:0]                dispatch_futype1, //若decode检测出异常则视作ALU指令
    input[$clog2(`CNT_ALUOP) - 1:0]     dispatch_aluop1,  //若ALU指令则操作码
    input[`CNT_MDUOP - 1:0]             dispatch_mduop1,
    input[$clog2(`CNT_MUOP) - 1:0]      dispatch_muop1,
    input[`CNT_CTRL - 1:0]              dispatch_ctrl1,
    input[$clog2(`CNT_CMP) - 1:0]       dispatch_cmpop1,
    input[$clog2(`CNT_EXCEPTION) - 1:0] dispatch_excode1,
    input[$clog2(`ROB_SIZE) - 1:0]      dispatch_num1,    //指令1的ROB编号
    input                               dispatch_readyrs1,
    input                               dispatch_readyrt1,
    input[31:0]                         dispatch_rsval1,
    input[31:0]                         dispatch_rtval1,
    input[$clog2(`ROB_SIZE) - 1:0]      dispatch_rsnum1,
    input[$clog2(`ROB_SIZE) - 1:0]      dispatch_rtnum1,
    input[5:0]                          dispatch_cp0addr1,
    //来自ALU0/1.Issue/Execute的提前唤醒旁路（不含数据）
    input                               alu0_execute_wakeup_en,
    input[$clog2(`ROB_SIZE) - 1:0]      alu0_execute_wakeup_num,
    input                               alu1_execute_wakeup_en,
    input[$clog2(`ROB_SIZE) - 1:0]      alu1_execute_wakeup_num,
    //来自MU.MEM的提前唤醒旁路（不含数据）
    input                               mu_mem_wakeup_en,
    input[$clog2(`ROB_SIZE) - 1:0]      mu_mem_wakeup_num,
    //来自premem的提前唤醒旁路
    input                               premem_wakeup_en,
    input[$clog2(`ROB_SIZE) - 1:0]      premem_wakeup_num,
    //来自MDU的提前唤醒旁路
    input                               mdu_wakeup_en,
    input[$clog2(`ROB_SIZE) - 1:0]      mdu_wakeup_num,
    input[31:0]                         mdu_wakeup_data,
    //来自4个WriteBck的提前唤醒与数据旁路
    input                               alu0_writeback_wakeup_en,
    input[$clog2(`ROB_SIZE) - 1:0]      alu0_writeback_wakeup_num,
    input[31:0]                         alu0_writeback_wakeup_data, //数据
    input                               alu1_writeback_wakeup_en,
    input[$clog2(`ROB_SIZE) - 1:0]      alu1_writeback_wakeup_num,
    input[31:0]                         alu1_writeback_wakeup_data, //数据
    input                               mu_writeback_wakeup_en,
    input[$clog2(`ROB_SIZE) - 1:0]      mu_writeback_wakeup_num,
    input[31:0]                         mu_writeback_wakeup_data,   //数据
    input                               mdu_writeback_wakeup_en,
    input[$clog2(`ROB_SIZE) - 1:0]      mdu_writeback_wakeup_num,
    input[31:0]                         mdu_writeback_wakeup_data,  //数据
    //FPU交互通道
    input           fpu_to_mu_valid,
    input[63:0]     fpu_to_mu_data,
    input[$clog2(`ROB_SIZE) - 1:0]  fpu_to_mu_num,
    input           fpu_to_mdu_valid,
    input[31:0]     fpu_to_mdu_data,
    input[$clog2(`ROB_SIZE) - 1:0]  fpu_to_mdu_num,
    input           fpu_to_mdu_bool_valid,
    input           fpu_to_mdu_bool_data,
    input[$clog2(`ROB_SIZE) - 1:0]  fpu_to_mdu_bool_num,
    output reg      mdu_to_fpu_valid,
    output reg[31:0]mdu_to_fpu_data,
    output reg[$clog2(`ROB_SIZE) - 1:0] mdu_to_fpu_num,
    //对4个FU分别输出仲裁出来的指令，以组合逻辑方式呈现，若valid与busy握手则真正修改保留站状态，否则保持不变
    //注意，输出数据自动与ALU的WB进行旁路处理
    //ALU0
    output                              selalu0_valid,              //保留站是否非空
    output[31:0]                        selalu0_PC,                 //仅ALU需要
    output[31:0]                        selalu0_inst,
    output[$clog2(`CNT_ALUOP) - 1:0]    selalu0_aluop,
    output[`CNT_CTRL - 1:0]             selalu0_ctrl,
    output[$clog2(`CNT_CMP) - 1:0]      selalu0_cmpop,
    output[$clog2(`CNT_EXCEPTION) - 1:0]    selalu0_excode,
    output                              selalu0_predict,
    output[31:0]                        selalu0_predict_target,
    output[$clog2(`ROB_SIZE) - 1:0]     selalu0_rsnum,
    output[$clog2(`ROB_SIZE) - 1:0]     selalu0_rtnum,
    output[31:0]                        selalu0_rsval,              //自动与ALU的WB旁路处理
    output[31:0]                        selalu0_rtval,
    output                              selalu0_rsval_ready,        //虽然被唤醒，但值未必准备好
    output                              selalu0_rtval_ready,
    output[$clog2(`ROB_SIZE) - 1:0]     selalu0_destnum,
    //ALU1
    output                              selalu1_valid,              //保留站是否非空
    output[31:0]                        selalu1_PC,                 //仅ALU需要
    output[31:0]                        selalu1_inst,
    output[$clog2(`CNT_ALUOP) - 1:0]    selalu1_aluop,
    output[`CNT_CTRL - 1:0]             selalu1_ctrl,
    output[$clog2(`CNT_CMP) - 1:0]      selalu1_cmpop,
    output[$clog2(`CNT_EXCEPTION) - 1:0]    selalu1_excode,
    output                              selalu1_predict,
    output[31:0]                        selalu1_predict_target,
    output[$clog2(`ROB_SIZE) - 1:0]     selalu1_rsnum,
    output[$clog2(`ROB_SIZE) - 1:0]     selalu1_rtnum,
    output[31:0]                        selalu1_rsval,              //自动与ALU的WB旁路处理
    output[31:0]                        selalu1_rtval,
    output                              selalu1_rsval_ready,        //虽然被唤醒，但值未必准备好
    output                              selalu1_rtval_ready,
    output[$clog2(`ROB_SIZE) - 1:0]     selalu1_destnum,
    //MU
    output                              selmu_valid,
    //output[31:0]                        selmu_inst,
    output[16:0]                        selmu_offset,
    output[$clog2(`CNT_MUOP) - 1:0]     selmu_muop,
    output                              selmu_isload,
    output                              selmu_isstore,              //在保留站里不需要完整的ctrl信号，给MU这俩就行
    output                              selmu_cachewb,
    output                              selmu_wen,
    output[$clog2(`ROB_SIZE) - 1:0]     selmu_rsnum,
    output[$clog2(`ROB_SIZE) - 1:0]     selmu_rtnum,
    output[31:0]                        selmu_rsval,                //自动与ALU的WB旁路处理
    output[31:0]                        selmu_rtval,
    output                              selmu_rsval_ready,        //虽然被唤醒，但值未必准备好
    output                              selmu_rtval_ready,
    output[$clog2(`ROB_SIZE) - 1:0]     selmu_destnum,
    output      selmu_tofpu,
    output      selmu_tofpu_notlast,
    //MDU
    output                              selmdu_valid,
    output[`CNT_MDUOP - 1:0]            selmdu_mduop,
    output[31:0]                        selmdu_rsval,               //无需WB旁路处理
    output[31:0]                        selmdu_rtval,
    output[5:0]                         selmdu_cp0addr,
    output[$clog2(`ROB_SIZE) - 1:0]     selmdu_destnum,
    output          selmdu_fromfpu_bool,
    output[31:0]    selmdu_fromfpu_data
    );

    genvar i;

    //FPU数据buffer
    reg[31:0]   buffer_tomdu[0:`ROB_SIZE - 1];
    reg[31:0]   buffer_tomu0[0:`ROB_SIZE - 1];
    reg[31:0]   buffer_tomu1[0:`ROB_SIZE - 1];
    reg         buffer_tomdu_bool[0:`ROB_SIZE - 1];
    reg[`ROB_SIZE - 1:0]    buffer_tomdu_ready;
    reg[`ROB_SIZE - 1:0]    buffer_tomdu_bool_ready;
    reg[`ROB_SIZE - 1:0]    buffer_tomu_ready;

    generate
        for(i = 0; i < `ROB_SIZE; i = i + 1) begin
            initial begin
                buffer_tomdu[i]=0;
                buffer_tomu0[i]=0;
                buffer_tomu1[i]=0;
                buffer_tomdu_bool[i]=0;
            end
            always@(posedge clk) begin
                if(~resetn) begin
                    buffer_tomdu_ready[i]<=0;
                    buffer_tomdu_bool_ready[i]<=0;
                    buffer_tomu_ready[i]<=0;
                end
                else begin
                    if(flush) begin
                        buffer_tomdu_ready[i]<=0;
                        buffer_tomdu_bool_ready[i]<=0;
                        buffer_tomu_ready[i]<=0;
                    end
                    else begin
                        if(i >= `ROB_SIZE / 2) begin
                            if((commit_en1 & (commit_num1 == i)) | (fpu_to_mu_valid & (fpu_to_mu_num == i)))
                                buffer_tomu_ready[i]<=(fpu_to_mu_valid & (fpu_to_mu_num == i));
                            if((commit_en1 & (commit_num1 == i)) | (fpu_to_mdu_valid & (fpu_to_mdu_num == i)))
                                buffer_tomdu_ready[i]<=(fpu_to_mdu_valid & (fpu_to_mdu_num == i));
                            if((commit_en1 & (commit_num1 == i)) | (fpu_to_mdu_bool_valid & (fpu_to_mdu_bool_num == i)))
                                buffer_tomdu_bool_ready[i]<=(fpu_to_mdu_bool_valid & (fpu_to_mdu_bool_num == i));
                        end
                        else begin
                            if((commit_en0 & (commit_num0 == i)) | (fpu_to_mu_valid & (fpu_to_mu_num == i)))
                                buffer_tomu_ready[i]<=(fpu_to_mu_valid & (fpu_to_mu_num == i));
                            if((commit_en0 & (commit_num0 == i)) | (fpu_to_mdu_valid & (fpu_to_mdu_num == i)))
                                buffer_tomdu_ready[i]<=(fpu_to_mdu_valid & (fpu_to_mdu_num == i));
                            if((commit_en0 & (commit_num0 == i)) | (fpu_to_mdu_bool_valid & (fpu_to_mdu_bool_num == i)))
                                buffer_tomdu_bool_ready[i]<=(fpu_to_mdu_bool_valid & (fpu_to_mdu_bool_num == i));
                        end
                    end
                end
            end
        end
    endgenerate
    always@(posedge clk) begin
        if(fpu_to_mu_valid) begin
            buffer_tomu0[fpu_to_mu_num]<=fpu_to_mu_data[31:0];
            buffer_tomu1[fpu_to_mu_num]<=fpu_to_mu_data[63:32];
        end
        if(fpu_to_mdu_valid)
            buffer_tomdu[fpu_to_mdu_num]<=fpu_to_mdu_data;
        if(fpu_to_mdu_bool_valid)
            buffer_tomdu_bool[fpu_to_mdu_bool_num]<=fpu_to_mdu_bool_data;
    end

    //保留站寄存器
    //ALU0
    reg[`STATION_ALU_SIZE - 1:0] rs_alu0_valid;     //是否被占用
    reg[31:0] rs_alu0_PC[0:`STATION_ALU_SIZE - 1];
    reg[31:0] rs_alu0_inst[0:`STATION_ALU_SIZE - 1];
    reg[$clog2(`CNT_ALUOP) - 1:0] rs_alu0_aluop[0:`STATION_ALU_SIZE - 1];
    reg[`CNT_CTRL - 1:0] rs_alu0_ctrl[0:`STATION_ALU_SIZE - 1];
    reg[$clog2(`CNT_CMP) - 1:0] rs_alu0_cmpop[0:`STATION_ALU_SIZE - 1];
    reg[$clog2(`CNT_EXCEPTION) - 1:0] rs_alu0_excode[0:`STATION_ALU_SIZE - 1];
    reg[`STATION_ALU_SIZE - 1:0] rs_alu0_predict;
    reg[31:0] rs_alu0_predict_target[0:`STATION_ALU_SIZE - 1];
    reg[$clog2(`ROB_SIZE) - 1:0] rs_alu0_rsnum[0:`STATION_ALU_SIZE - 1];
    reg[$clog2(`ROB_SIZE) - 1:0] rs_alu0_rtnum[0:`STATION_ALU_SIZE - 1];
    reg[$clog2(`ROB_SIZE) - 1:0] rs_alu0_destnum[0:`STATION_ALU_SIZE - 1];
    //这些reg是要重点维护的
    reg[31:0] rs_alu0_rsval[0:`STATION_ALU_SIZE - 1];
    reg[31:0] rs_alu0_rtval[0:`STATION_ALU_SIZE - 1];
    reg[`STATION_ALU_SIZE - 1:0] rs_alu0_rsval_ready;
    reg[`STATION_ALU_SIZE - 1:0] rs_alu0_rtval_ready;   //当ready=1时，val不可修改！
    reg[`STATION_ALU_SIZE - 1:0] rs_alu0_wakeuprs;
    reg[`STATION_ALU_SIZE - 1:0] rs_alu0_wakeuprt;      //唤醒位，初始时和ready相同，但唤醒和数据准备好并非一回事
    reg[1:0] rs_alu0_prior[0:`STATION_ALU_SIZE - 1];    //两位优先级

    //ALU1
    reg[`STATION_ALU_SIZE - 1:0] rs_alu1_valid;     //是否被占用
    reg[31:0] rs_alu1_PC[0:`STATION_ALU_SIZE - 1];
    reg[31:0] rs_alu1_inst[0:`STATION_ALU_SIZE - 1];
    reg[$clog2(`CNT_ALUOP) - 1:0] rs_alu1_aluop[0:`STATION_ALU_SIZE - 1];
    reg[`CNT_CTRL - 1:0] rs_alu1_ctrl[0:`STATION_ALU_SIZE - 1];
    reg[$clog2(`CNT_CMP) - 1:0] rs_alu1_cmpop[0:`STATION_ALU_SIZE - 1];
    reg[$clog2(`CNT_EXCEPTION) - 1:0] rs_alu1_excode[0:`STATION_ALU_SIZE - 1];
    reg[`STATION_ALU_SIZE - 1:0] rs_alu1_predict;
    reg[31:0] rs_alu1_predict_target[0:`STATION_ALU_SIZE - 1];
    reg[$clog2(`ROB_SIZE) - 1:0] rs_alu1_rsnum[0:`STATION_ALU_SIZE - 1];
    reg[$clog2(`ROB_SIZE) - 1:0] rs_alu1_rtnum[0:`STATION_ALU_SIZE - 1];
    reg[$clog2(`ROB_SIZE) - 1:0] rs_alu1_destnum[0:`STATION_ALU_SIZE - 1];
    //这些reg是要重点维护的
    reg[31:0] rs_alu1_rsval[0:`STATION_ALU_SIZE - 1];
    reg[31:0] rs_alu1_rtval[0:`STATION_ALU_SIZE - 1];
    reg[`STATION_ALU_SIZE - 1:0] rs_alu1_rsval_ready;
    reg[`STATION_ALU_SIZE - 1:0] rs_alu1_rtval_ready;   //当ready=1时，val不可修改！
    reg[`STATION_ALU_SIZE - 1:0] rs_alu1_wakeuprs;
    reg[`STATION_ALU_SIZE - 1:0] rs_alu1_wakeuprt;      //唤醒位，初始时和ready相同，但唤醒和数据准备好并非一回事
    reg[1:0] rs_alu1_prior[0:`STATION_ALU_SIZE - 1];    //两位优先级

    //MU
    reg[`STATION_MU_SIZE - 1:0] rs_mu_valid;     //是否被占用
    //reg[31:0] rs_mu_inst[0:`STATION_MU_SIZE - 1];
    reg[16:0] rs_mu_offset[0:`STATION_MU_SIZE - 1];
    reg[$clog2(`CNT_MUOP) - 1:0] rs_mu_muop[0:`STATION_MU_SIZE - 1];
    reg[$clog2(`ROB_SIZE) - 1:0] rs_mu_rsnum[0:`STATION_MU_SIZE - 1];
    reg[$clog2(`ROB_SIZE) - 1:0] rs_mu_rtnum[0:`STATION_MU_SIZE - 1];
    reg[$clog2(`ROB_SIZE) - 1:0] rs_mu_destnum[0:`STATION_MU_SIZE - 1];
    reg[`STATION_MU_SIZE - 1:0] rs_mu_isload;
    reg[`STATION_MU_SIZE - 1:0] rs_mu_isstore;
    reg[`STATION_MU_SIZE - 1:0] rs_mu_cachewb;
    reg[`STATION_MU_SIZE - 1:0] rs_mu_wen;
    //这些reg是要重点维护的
    reg[31:0] rs_mu_rsval[0:`STATION_MU_SIZE - 1];
    reg[31:0] rs_mu_rtval[0:`STATION_MU_SIZE - 1];
    reg[`STATION_MU_SIZE - 1:0] rs_mu_rsval_ready;
    reg[`STATION_MU_SIZE - 1:0] rs_mu_rtval_ready;   //当ready=1时，val不可修改！
    reg[`STATION_MU_SIZE - 1:0] rs_mu_wakeuprs;
    reg[`STATION_MU_SIZE - 1:0] rs_mu_wakeuprt;      //唤醒位，初始时和ready相同，但唤醒和数据准备好并非一回事
    reg[1:0] rs_mu_prior[0:`STATION_MU_SIZE - 1];    //两位优先级
    //FPU支持
    reg[`STATION_MU_SIZE - 1:0] rs_mu_issue2;
    reg[`STATION_MU_SIZE - 1:0] rs_mu_tofpu;
    reg[`STATION_MU_SIZE - 1:0] rs_mu_fromfpu_ready;
    reg[`STATION_MU_SIZE - 1:0] rs_mu_usefpu;
    reg[`STATION_MU_SIZE - 1:0] rs_mu_usefpu_double;    //这条指令是否为ldc1/sdc1

    //MDU
    reg[`STATION_MDU_SIZE - 1:0] rs_mdu_valid;     //是否被占用
    reg[`CNT_MDUOP - 1:0] rs_mdu_mduop[0:`STATION_MDU_SIZE - 1];
    reg[$clog2(`ROB_SIZE) - 1:0] rs_mdu_rsnum[0:`STATION_MDU_SIZE - 1];
    reg[$clog2(`ROB_SIZE) - 1:0] rs_mdu_rtnum[0:`STATION_MDU_SIZE - 1];
    reg[$clog2(`ROB_SIZE) - 1:0] rs_mdu_destnum[0:`STATION_MDU_SIZE - 1];
    reg[5:0] rs_mdu_cp0addr[0:`STATION_MDU_SIZE - 1];
    //这些reg是要重点维护的
    reg[31:0] rs_mdu_rsval[0:`STATION_MDU_SIZE - 1];
    reg[31:0] rs_mdu_rtval[0:`STATION_MDU_SIZE - 1];    //注意：MDU不需要ready，只需要wakeup
    reg[`STATION_MDU_SIZE - 1:0] rs_mdu_wakeuprs;
    reg[`STATION_MDU_SIZE - 1:0] rs_mdu_wakeuprt;       //唤醒位，初始时和ready相同，但唤醒和数据准备好并非一回事
    reg[`STATION_MDU_SIZE - 1:0] rs_mdu_prior;          //1位优先级
    //FPU支持
    reg[`STATION_MDU_SIZE - 1:0] rs_mdu_tofpu;
    reg[`STATION_MDU_SIZE - 1:0] rs_mdu_fromfpu_ready;
    reg[`STATION_MDU_SIZE - 1:0] rs_mdu_fromfpu_bool_ready;


    assign station_alu0_valid=rs_alu0_valid;
    assign station_alu1_valid=rs_alu1_valid;
    assign station_mu_valid=rs_mu_valid;
    assign station_mdu_valid=rs_mdu_valid;

    //规定4/3/2个位置的优先级都必须是不同的（00~11、00~10、0~1）
    
    //仲裁电路（这里就不需要用宏定义，直接按4/3/2来）
    wire[3:0] canalu0;
    wire[3:0] canalu1;
    wire[2:0] canmu;
    wire[1:0] canmdu;   //仅表示能否流出
    assign canalu0[0]=rs_alu0_valid[0] & rs_alu0_wakeuprs[0] & rs_alu0_wakeuprt[0];
    assign canalu0[1]=rs_alu0_valid[1] & rs_alu0_wakeuprs[1] & rs_alu0_wakeuprt[1];
    assign canalu0[2]=rs_alu0_valid[2] & rs_alu0_wakeuprs[2] & rs_alu0_wakeuprt[2];
    assign canalu0[3]=rs_alu0_valid[3] & rs_alu0_wakeuprs[3] & rs_alu0_wakeuprt[3];
    assign canalu1[0]=rs_alu1_valid[0] & rs_alu1_wakeuprs[0] & rs_alu1_wakeuprt[0];
    assign canalu1[1]=rs_alu1_valid[1] & rs_alu1_wakeuprs[1] & rs_alu1_wakeuprt[1];
    assign canalu1[2]=rs_alu1_valid[2] & rs_alu1_wakeuprs[2] & rs_alu1_wakeuprt[2];
    assign canalu1[3]=rs_alu1_valid[3] & rs_alu1_wakeuprs[3] & rs_alu1_wakeuprt[3];
    assign canmu[0]=rs_mu_valid[0] & rs_mu_wakeuprs[0] & rs_mu_wakeuprt[0] & rs_mu_fromfpu_ready[0];
    assign canmu[1]=rs_mu_valid[1] & rs_mu_wakeuprs[1] & rs_mu_wakeuprt[1] & rs_mu_fromfpu_ready[1];
    assign canmu[2]=rs_mu_valid[2] & rs_mu_wakeuprs[2] & rs_mu_wakeuprt[2] & rs_mu_fromfpu_ready[2];
    assign canmdu[0]=rs_mdu_valid[0] & rs_mdu_wakeuprs[0] & rs_mdu_wakeuprt[0] & rs_mdu_fromfpu_ready[0] & rs_mdu_fromfpu_bool_ready[0];
    assign canmdu[1]=rs_mdu_valid[1] & rs_mdu_wakeuprs[1] & rs_mdu_wakeuprt[1] & rs_mdu_fromfpu_ready[1] & rs_mdu_fromfpu_bool_ready[1];

    assign selalu0_valid=|canalu0;     //指示是否有指令发射
    assign selalu1_valid=|canalu1;     //指示是否有指令发射
    //注意：MU和MDU必须顺序发射！这和ALU不同
    wire[2:0] mu_head;  //仅将队头置1
    wire[1:0] mdu_head;
    assign mdu_head[0]=rs_mdu_valid[0] & ((~rs_mdu_prior[0]) | ~rs_mdu_valid[1]);
    assign mdu_head[1]=rs_mdu_valid[1] & ((~rs_mdu_prior[1]) | ~rs_mdu_valid[0]);
    //是00，或者是10且其余两个为空，或者是01且为00的位置为空
    assign mu_head[0]=rs_mu_valid[0] & ((~(|rs_mu_prior[0])) | (rs_mu_prior[0][1] & (~rs_mu_valid[1]) & ~rs_mu_valid[2]) | ((~rs_mu_prior[0][1]) & ((rs_mu_prior[1][1] | ~rs_mu_valid[1]) & (rs_mu_prior[2][1] | ~rs_mu_valid[2]))));
    assign mu_head[1]=rs_mu_valid[1] & ((~(|rs_mu_prior[1])) | (rs_mu_prior[1][1] & (~rs_mu_valid[0]) & ~rs_mu_valid[2]) | ((~rs_mu_prior[1][1]) & ((rs_mu_prior[0][1] | ~rs_mu_valid[0]) & (rs_mu_prior[2][1] | ~rs_mu_valid[2]))));
    assign mu_head[2]=rs_mu_valid[2] & ((~(|rs_mu_prior[2])) | (rs_mu_prior[2][1] & (~rs_mu_valid[0]) & ~rs_mu_valid[1]) | ((~rs_mu_prior[2][1]) & ((rs_mu_prior[0][1] | ~rs_mu_valid[0]) & (rs_mu_prior[1][1] | ~rs_mu_valid[1]))));
    
    assign selmdu_valid=(canmdu[0] & mdu_head[0]) | (canmdu[1] & mdu_head[1]);      //仅检查队头
    assign selmu_valid=(canmu[0] & mu_head[0]) | (canmu[1] & mu_head[1]) | (canmu[2] & mu_head[2]);
    
    wire[3:0] select_alu0;
    wire[3:0] select_alu1;  //ALU保留站哪条指令可以流出
    //是00，或者其余3个不能流出(11的充要条件)，或者自己是01/10且其它为0x的不能流出
    assign select_alu0[0]=canalu0[0] & ((~(|rs_alu0_prior[0])) | (~(canalu0[1] | canalu0[2] | canalu0[3])) | ((rs_alu0_prior[0][0] ^ rs_alu0_prior[0][1]) & (rs_alu0_prior[1][1] | ~canalu0[1]) & (rs_alu0_prior[2][1] | ~canalu0[2]) & (rs_alu0_prior[3][1] | ~canalu0[3])));
    assign select_alu0[1]=canalu0[1] & ((~(|rs_alu0_prior[1])) | (~(canalu0[0] | canalu0[2] | canalu0[3])) | ((rs_alu0_prior[1][0] ^ rs_alu0_prior[1][1]) & (rs_alu0_prior[0][1] | ~canalu0[0]) & (rs_alu0_prior[2][1] | ~canalu0[2]) & (rs_alu0_prior[3][1] | ~canalu0[3])));
    assign select_alu0[2]=canalu0[2] & ((~(|rs_alu0_prior[2])) | (~(canalu0[0] | canalu0[1] | canalu0[3])) | ((rs_alu0_prior[2][0] ^ rs_alu0_prior[2][1]) & (rs_alu0_prior[0][1] | ~canalu0[0]) & (rs_alu0_prior[1][1] | ~canalu0[1]) & (rs_alu0_prior[3][1] | ~canalu0[3])));
    assign select_alu0[3]=canalu0[3] & ((~(|rs_alu0_prior[3])) | (~(canalu0[0] | canalu0[1] | canalu0[2])) | ((rs_alu0_prior[3][0] ^ rs_alu0_prior[3][1]) & (rs_alu0_prior[0][1] | ~canalu0[0]) & (rs_alu0_prior[1][1] | ~canalu0[1]) & (rs_alu0_prior[2][1] | ~canalu0[2])));
    assign select_alu1[0]=canalu1[0] & ((~(|rs_alu1_prior[0])) | (~(canalu1[1] | canalu1[2] | canalu1[3])) | ((rs_alu1_prior[0][0] ^ rs_alu1_prior[0][1]) & (rs_alu1_prior[1][1] | ~canalu1[1]) & (rs_alu1_prior[2][1] | ~canalu1[2]) & (rs_alu1_prior[3][1] | ~canalu1[3])));
    assign select_alu1[1]=canalu1[1] & ((~(|rs_alu1_prior[1])) | (~(canalu1[0] | canalu1[2] | canalu1[3])) | ((rs_alu1_prior[1][0] ^ rs_alu1_prior[1][1]) & (rs_alu1_prior[0][1] | ~canalu1[0]) & (rs_alu1_prior[2][1] | ~canalu1[2]) & (rs_alu1_prior[3][1] | ~canalu1[3])));
    assign select_alu1[2]=canalu1[2] & ((~(|rs_alu1_prior[2])) | (~(canalu1[0] | canalu1[1] | canalu1[3])) | ((rs_alu1_prior[2][0] ^ rs_alu1_prior[2][1]) & (rs_alu1_prior[0][1] | ~canalu1[0]) & (rs_alu1_prior[1][1] | ~canalu1[1]) & (rs_alu1_prior[3][1] | ~canalu1[3])));
    assign select_alu1[3]=canalu1[3] & ((~(|rs_alu1_prior[3])) | (~(canalu1[0] | canalu1[1] | canalu1[2])) | ((rs_alu1_prior[3][0] ^ rs_alu1_prior[3][1]) & (rs_alu1_prior[0][1] | ~canalu1[0]) & (rs_alu1_prior[1][1] | ~canalu1[1]) & (rs_alu1_prior[2][1] | ~canalu1[2])));
    
    //选择数据输出
    //ALU0
    assign selalu0_PC=select_alu0[0] ? rs_alu0_PC[0] : (select_alu0[1] ? rs_alu0_PC[1] : (select_alu0[2] ? rs_alu0_PC[2] : rs_alu0_PC[3]));
    assign selalu0_inst=select_alu0[0] ? rs_alu0_inst[0] : (select_alu0[1] ? rs_alu0_inst[1] : (select_alu0[2] ? rs_alu0_inst[2] : rs_alu0_inst[3]));
    assign selalu0_aluop=select_alu0[0] ? rs_alu0_aluop[0] : (select_alu0[1] ? rs_alu0_aluop[1] : (select_alu0[2] ? rs_alu0_aluop[2] : rs_alu0_aluop[3]));
    assign selalu0_ctrl=select_alu0[0] ? rs_alu0_ctrl[0] : (select_alu0[1] ? rs_alu0_ctrl[1] : (select_alu0[2] ? rs_alu0_ctrl[2] : rs_alu0_ctrl[3]));
    assign selalu0_cmpop=select_alu0[0] ? rs_alu0_cmpop[0] : (select_alu0[1] ? rs_alu0_cmpop[1] : (select_alu0[2] ? rs_alu0_cmpop[2] : rs_alu0_cmpop[3]));
    assign selalu0_excode=select_alu0[0] ? rs_alu0_excode[0] : (select_alu0[1] ? rs_alu0_excode[1] : (select_alu0[2] ? rs_alu0_excode[2] : rs_alu0_excode[3]));
    assign selalu0_predict=select_alu0[0] ? rs_alu0_predict[0] : (select_alu0[1] ? rs_alu0_predict[1] : (select_alu0[2] ? rs_alu0_predict[2] : rs_alu0_predict[3]));
    assign selalu0_predict_target=select_alu0[0] ? rs_alu0_predict_target[0] : (select_alu0[1] ? rs_alu0_predict_target[1] : (select_alu0[2] ? rs_alu0_predict_target[2] : rs_alu0_predict_target[3]));
    assign selalu0_rsnum=select_alu0[0] ? rs_alu0_rsnum[0] : (select_alu0[1] ? rs_alu0_rsnum[1] : (select_alu0[2] ? rs_alu0_rsnum[2] : rs_alu0_rsnum[3]));
    assign selalu0_rtnum=select_alu0[0] ? rs_alu0_rtnum[0] : (select_alu0[1] ? rs_alu0_rtnum[1] : (select_alu0[2] ? rs_alu0_rtnum[2] : rs_alu0_rtnum[3]));
    assign selalu0_destnum=select_alu0[0] ? rs_alu0_destnum[0] : (select_alu0[1] ? rs_alu0_destnum[1] : (select_alu0[2] ? rs_alu0_destnum[2] : rs_alu0_destnum[3]));
    //ALU1
    assign selalu1_PC=select_alu1[0] ? rs_alu1_PC[0] : (select_alu1[1] ? rs_alu1_PC[1] : (select_alu1[2] ? rs_alu1_PC[2] : rs_alu1_PC[3]));
    assign selalu1_inst=select_alu1[0] ? rs_alu1_inst[0] : (select_alu1[1] ? rs_alu1_inst[1] : (select_alu1[2] ? rs_alu1_inst[2] : rs_alu1_inst[3]));
    assign selalu1_aluop=select_alu1[0] ? rs_alu1_aluop[0] : (select_alu1[1] ? rs_alu1_aluop[1] : (select_alu1[2] ? rs_alu1_aluop[2] : rs_alu1_aluop[3]));
    assign selalu1_ctrl=select_alu1[0] ? rs_alu1_ctrl[0] : (select_alu1[1] ? rs_alu1_ctrl[1] : (select_alu1[2] ? rs_alu1_ctrl[2] : rs_alu1_ctrl[3]));
    assign selalu1_cmpop=select_alu1[0] ? rs_alu1_cmpop[0] : (select_alu1[1] ? rs_alu1_cmpop[1] : (select_alu1[2] ? rs_alu1_cmpop[2] : rs_alu1_cmpop[3]));
    assign selalu1_excode=select_alu1[0] ? rs_alu1_excode[0] : (select_alu1[1] ? rs_alu1_excode[1] : (select_alu1[2] ? rs_alu1_excode[2] : rs_alu1_excode[3]));
    assign selalu1_predict=select_alu1[0] ? rs_alu1_predict[0] : (select_alu1[1] ? rs_alu1_predict[1] : (select_alu1[2] ? rs_alu1_predict[2] : rs_alu1_predict[3]));
    assign selalu1_predict_target=select_alu1[0] ? rs_alu1_predict_target[0] : (select_alu1[1] ? rs_alu1_predict_target[1] : (select_alu1[2] ? rs_alu1_predict_target[2] : rs_alu1_predict_target[3]));
    assign selalu1_rsnum=select_alu1[0] ? rs_alu1_rsnum[0] : (select_alu1[1] ? rs_alu1_rsnum[1] : (select_alu1[2] ? rs_alu1_rsnum[2] : rs_alu1_rsnum[3]));
    assign selalu1_rtnum=select_alu1[0] ? rs_alu1_rtnum[0] : (select_alu1[1] ? rs_alu1_rtnum[1] : (select_alu1[2] ? rs_alu1_rtnum[2] : rs_alu1_rtnum[3]));
    assign selalu1_destnum=select_alu1[0] ? rs_alu1_destnum[0] : (select_alu1[1] ? rs_alu1_destnum[1] : (select_alu1[2] ? rs_alu1_destnum[2] : rs_alu1_destnum[3]));
    
    //assign selmu_inst=mu_head[0] ? rs_mu_inst[0] : (mu_head[1] ? rs_mu_inst[1] : rs_mu_inst[2]);
    assign selmu_offset=mu_head[0] ? rs_mu_offset[0] : (mu_head[1] ? rs_mu_offset[1] : rs_mu_offset[2]);
    assign selmu_muop=mu_head[0] ? rs_mu_muop[0] : (mu_head[1] ? rs_mu_muop[1] : rs_mu_muop[2]);
    assign selmu_isload=mu_head[0] ? rs_mu_isload[0] : (mu_head[1] ? rs_mu_isload[1] : rs_mu_isload[2]);
    assign selmu_isstore=mu_head[0] ? rs_mu_isstore[0] : (mu_head[1] ? rs_mu_isstore[1] : rs_mu_isstore[2]);
    assign selmu_cachewb=mu_head[0] ? rs_mu_cachewb[0] : (mu_head[1] ? rs_mu_cachewb[1] : rs_mu_cachewb[2]);
    assign selmu_wen=mu_head[0] ? rs_mu_wen[0] : (mu_head[1] ? rs_mu_wen[1] : rs_mu_wen[2]);
    assign selmu_rsnum=mu_head[0] ? rs_mu_rsnum[0] : (mu_head[1] ? rs_mu_rsnum[1] : rs_mu_rsnum[2]);
    assign selmu_rtnum=mu_head[0] ? rs_mu_rtnum[0] : (mu_head[1] ? rs_mu_rtnum[1] : rs_mu_rtnum[2]);
    assign selmu_destnum=mu_head[0] ? rs_mu_destnum[0] : (mu_head[1] ? rs_mu_destnum[1] : rs_mu_destnum[2]);
    assign selmu_tofpu=mu_head[0] ? rs_mu_tofpu[0] : (mu_head[1] ? rs_mu_tofpu[1] : rs_mu_tofpu[2]);
    assign selmu_tofpu_notlast=mu_head[0] ? rs_mu_issue2[0] : (mu_head[1] ? rs_mu_issue2[1] : rs_mu_issue2[2]);

    assign selmdu_mduop=mdu_head[0] ? rs_mdu_mduop[0] : rs_mdu_mduop[1];
    assign selmdu_rsval=mdu_head[0] ? rs_mdu_rsval[0] : rs_mdu_rsval[1];
    assign selmdu_rtval=mdu_head[0] ? rs_mdu_rtval[0] : rs_mdu_rtval[1];
    assign selmdu_cp0addr=mdu_head[0] ? rs_mdu_cp0addr[0] : rs_mdu_cp0addr[1];
    assign selmdu_destnum=mdu_head[0] ? rs_mdu_destnum[0] : rs_mdu_destnum[1];
    assign selmdu_fromfpu_data=buffer_tomdu[selmdu_destnum];
    assign selmdu_fromfpu_bool=buffer_tomdu_bool[selmdu_destnum];

    //将输出的rs/rtval和rs/rtready和旁路进行处理
    wire mursready=|(mu_head & rs_mu_rsval_ready);
    wire murtready=|(mu_head & rs_mu_rtval_ready);
    
    //旁路网络
    //这些旁路要参与数据输出
    wire[3:0] bypass_alu0_alu0[0:1]; //由ALU0.WB->ALU0的保留站的旁路是否有效
    wire[3:0] bypass_alu1_alu0[0:1];
    wire[3:0] bypass_alu0_alu1[0:1];
    wire[3:0] bypass_alu1_alu1[0:1];
    wire[2:0] bypass_alu0_mu[0:1];
    wire[2:0] bypass_alu1_mu[0:1];
    wire[3:0] bypass_mu_alu0[0:1];
    wire[3:0] bypass_mu_alu1[0:1];
    wire[31:0] bypassout_alu0_rsval[0:3];   //对每个保留站选择真正输出的数据
    wire[31:0] bypassout_alu0_rtval[0:3];
    wire[31:0] bypassout_alu1_rsval[0:3];
    wire[31:0] bypassout_alu1_rtval[0:3];
    wire[31:0] bypassout_mu_rsval[0:2];
    wire[31:0] bypassout_mu_rtval[0:2];
    wire[3:0] bypass_mdu_alu0[0:1];
    wire[3:0] bypass_mdu_alu1[0:1];
    wire[3:0] bypass_mdumid_alu0[0:1];
    wire[3:0] bypass_mdumid_alu1[0:1];
    //这些旁路仅用于数据捕获
    wire[2:0] bypass_mu_mu[0:1];
    wire[2:0] bypass_mdu_mu[0:1];
    wire[1:0] bypass_alu0_mdu[0:1];
    wire[1:0] bypass_alu1_mdu[0:1];
    wire[1:0] bypass_mu_mdu[0:1];
    wire[1:0] bypass_mdu_mdu[0:1];
    
    generate
        for(i=0; i < `STATION_ALU_SIZE; i=i + 1) begin
            assign bypass_alu0_alu0[0][i]=alu0_writeback_wakeup_en & (alu0_writeback_wakeup_num == rs_alu0_rsnum[i]);
            assign bypass_alu0_alu0[1][i]=alu0_writeback_wakeup_en & (alu0_writeback_wakeup_num == rs_alu0_rtnum[i]);
            assign bypass_alu1_alu0[0][i]=alu1_writeback_wakeup_en & (alu1_writeback_wakeup_num == rs_alu0_rsnum[i]);
            assign bypass_alu1_alu0[1][i]=alu1_writeback_wakeup_en & (alu1_writeback_wakeup_num == rs_alu0_rtnum[i]);
            assign bypass_alu0_alu1[0][i]=alu0_writeback_wakeup_en & (alu0_writeback_wakeup_num == rs_alu1_rsnum[i]);
            assign bypass_alu0_alu1[1][i]=alu0_writeback_wakeup_en & (alu0_writeback_wakeup_num == rs_alu1_rtnum[i]);
            assign bypass_alu1_alu1[0][i]=alu1_writeback_wakeup_en & (alu1_writeback_wakeup_num == rs_alu1_rsnum[i]);
            assign bypass_alu1_alu1[1][i]=alu1_writeback_wakeup_en & (alu1_writeback_wakeup_num == rs_alu1_rtnum[i]);
            assign bypass_mu_alu0[0][i]=mu_writeback_wakeup_en & (mu_writeback_wakeup_num == rs_alu0_rsnum[i]);
            assign bypass_mu_alu0[1][i]=mu_writeback_wakeup_en & (mu_writeback_wakeup_num == rs_alu0_rtnum[i]);
            assign bypass_mdu_alu0[0][i]=mdu_writeback_wakeup_en & (mdu_writeback_wakeup_num == rs_alu0_rsnum[i]);
            assign bypass_mdu_alu0[1][i]=mdu_writeback_wakeup_en & (mdu_writeback_wakeup_num == rs_alu0_rtnum[i]);
            
            assign bypass_mdumid_alu0[0][i]=mdu_wakeup_en & (mdu_wakeup_num == rs_alu0_rsnum[i]);
            assign bypass_mdumid_alu0[1][i]=mdu_wakeup_en & (mdu_wakeup_num == rs_alu0_rtnum[i]);
            assign bypass_mdumid_alu1[0][i]=mdu_wakeup_en & (mdu_wakeup_num == rs_alu1_rsnum[i]);
            assign bypass_mdumid_alu1[1][i]=mdu_wakeup_en & (mdu_wakeup_num == rs_alu1_rtnum[i]);
            
            assign bypass_mu_alu1[0][i]=mu_writeback_wakeup_en & (mu_writeback_wakeup_num == rs_alu1_rsnum[i]);
            assign bypass_mu_alu1[1][i]=mu_writeback_wakeup_en & (mu_writeback_wakeup_num == rs_alu1_rtnum[i]);
            assign bypass_mdu_alu1[0][i]=mdu_writeback_wakeup_en & (mdu_writeback_wakeup_num == rs_alu1_rsnum[i]);
            assign bypass_mdu_alu1[1][i]=mdu_writeback_wakeup_en & (mdu_writeback_wakeup_num == rs_alu1_rtnum[i]);
            assign bypassout_alu0_rsval[i]=rs_alu0_rsval_ready[i] ? rs_alu0_rsval[i] : (bypass_alu0_alu0[0][i] ? alu0_writeback_wakeup_data : (bypass_alu1_alu0[0][i] ? alu1_writeback_wakeup_data : (bypass_mu_alu0[0][i] ? mu_writeback_wakeup_data : mdu_writeback_wakeup_data)));
            assign bypassout_alu0_rtval[i]=rs_alu0_rtval_ready[i] ? rs_alu0_rtval[i] : (bypass_alu0_alu0[1][i] ? alu0_writeback_wakeup_data : (bypass_alu1_alu0[1][i] ? alu1_writeback_wakeup_data : (bypass_mu_alu0[1][i] ? mu_writeback_wakeup_data : mdu_writeback_wakeup_data)));
            assign bypassout_alu1_rsval[i]=rs_alu1_rsval_ready[i] ? rs_alu1_rsval[i] : (bypass_alu0_alu1[0][i] ? alu0_writeback_wakeup_data : (bypass_alu1_alu1[0][i] ? alu1_writeback_wakeup_data : (bypass_mu_alu1[0][i] ? mu_writeback_wakeup_data : mdu_writeback_wakeup_data)));
            assign bypassout_alu1_rtval[i]=rs_alu1_rtval_ready[i] ? rs_alu1_rtval[i] : (bypass_alu0_alu1[1][i] ? alu0_writeback_wakeup_data : (bypass_alu1_alu1[1][i] ? alu1_writeback_wakeup_data : (bypass_mu_alu1[1][i] ? mu_writeback_wakeup_data : mdu_writeback_wakeup_data)));
        end
        for(i=0; i < `STATION_MU_SIZE; i=i + 1) begin
            assign bypass_alu0_mu[0][i]=alu0_writeback_wakeup_en & (alu0_writeback_wakeup_num == rs_mu_rsnum[i]);
            assign bypass_alu0_mu[1][i]=alu0_writeback_wakeup_en & (alu0_writeback_wakeup_num == rs_mu_rtnum[i]);
            assign bypass_alu1_mu[0][i]=alu1_writeback_wakeup_en & (alu1_writeback_wakeup_num == rs_mu_rsnum[i]);
            assign bypass_alu1_mu[1][i]=alu1_writeback_wakeup_en & (alu1_writeback_wakeup_num == rs_mu_rtnum[i]);
            
            assign bypass_mu_mu[0][i]=mu_writeback_wakeup_en & (mu_writeback_wakeup_num == rs_mu_rsnum[i]);
            assign bypass_mu_mu[1][i]=mu_writeback_wakeup_en & (mu_writeback_wakeup_num == rs_mu_rtnum[i]);
            
            assign bypass_mdu_mu[0][i]=mdu_writeback_wakeup_en & (mdu_writeback_wakeup_num == rs_mu_rsnum[i]);
            assign bypass_mdu_mu[1][i]=mdu_writeback_wakeup_en & (mdu_writeback_wakeup_num == rs_mu_rtnum[i]);
            
            assign bypassout_mu_rsval[i]=rs_mu_rsval_ready[i] ? rs_mu_rsval[i] : (bypass_alu0_mu[0][i] ? alu0_writeback_wakeup_data : (bypass_mu_mu[0][i] ? mu_writeback_wakeup_data : alu1_writeback_wakeup_data));
            assign bypassout_mu_rtval[i]=rs_mu_rtval_ready[i] ? rs_mu_rtval[i] : (bypass_alu0_mu[1][i] ? alu0_writeback_wakeup_data : (bypass_mu_mu[1][i] ? mu_writeback_wakeup_data : alu1_writeback_wakeup_data));
        end
        for(i=0; i < `STATION_MDU_SIZE; i=i + 1) begin
            assign bypass_alu0_mdu[0][i]=alu0_writeback_wakeup_en & (alu0_writeback_wakeup_num == rs_mdu_rsnum[i]);
            assign bypass_alu0_mdu[1][i]=alu0_writeback_wakeup_en & (alu0_writeback_wakeup_num == rs_mdu_rtnum[i]);
            assign bypass_alu1_mdu[0][i]=alu1_writeback_wakeup_en & (alu1_writeback_wakeup_num == rs_mdu_rsnum[i]);
            assign bypass_alu1_mdu[1][i]=alu1_writeback_wakeup_en & (alu1_writeback_wakeup_num == rs_mdu_rtnum[i]);
            assign bypass_mu_mdu[0][i]=mu_writeback_wakeup_en & (mu_writeback_wakeup_num == rs_mdu_rsnum[i]);
            assign bypass_mu_mdu[1][i]=mu_writeback_wakeup_en & (mu_writeback_wakeup_num == rs_mdu_rtnum[i]);
            assign bypass_mdu_mdu[0][i]=mdu_writeback_wakeup_en & (mdu_writeback_wakeup_num == rs_mdu_rsnum[i]);
            assign bypass_mdu_mdu[1][i]=mdu_writeback_wakeup_en & (mdu_writeback_wakeup_num == rs_mdu_rtnum[i]);
        end
    endgenerate

    assign selalu0_rsval_ready=|(select_alu0 & (rs_alu0_rsval_ready | bypass_alu0_alu0[0] | bypass_alu1_alu0[0] | bypass_mu_alu0[0] | bypass_mdu_alu0[0] | bypass_mdumid_alu0[0]));
    assign selalu0_rtval_ready=|(select_alu0 & (rs_alu0_rtval_ready | bypass_alu0_alu0[1] | bypass_alu1_alu0[1] | bypass_mu_alu0[1] | bypass_mdu_alu0[1] | bypass_mdumid_alu0[1]));
    assign selalu1_rsval_ready=|(select_alu1 & (rs_alu1_rsval_ready | bypass_alu0_alu1[0] | bypass_alu1_alu1[0] | bypass_mu_alu1[0] | bypass_mdu_alu1[0] | bypass_mdumid_alu1[0]));
    assign selalu1_rtval_ready=|(select_alu1 & (rs_alu1_rtval_ready | bypass_alu0_alu1[1] | bypass_alu1_alu1[1] | bypass_mu_alu1[1] | bypass_mdu_alu1[1] | bypass_mdumid_alu1[1]));
    assign selmu_rsval_ready=|(mu_head & (rs_mu_rsval_ready | bypass_alu0_mu[0] | bypass_alu1_mu[0] | bypass_mu_mu[0]));
    assign selmu_rtval_ready=|(mu_head & (rs_mu_rtval_ready | bypass_alu0_mu[1] | bypass_alu1_mu[1] | bypass_mu_mu[1]));
    assign selalu0_rsval=select_alu0[0] ? bypassout_alu0_rsval[0] : (select_alu0[1] ? bypassout_alu0_rsval[1] : (select_alu0[2] ? bypassout_alu0_rsval[2] : bypassout_alu0_rsval[3]));
    assign selalu0_rtval=select_alu0[0] ? bypassout_alu0_rtval[0] : (select_alu0[1] ? bypassout_alu0_rtval[1] : (select_alu0[2] ? bypassout_alu0_rtval[2] : bypassout_alu0_rtval[3]));
    assign selalu1_rsval=select_alu1[0] ? bypassout_alu1_rsval[0] : (select_alu1[1] ? bypassout_alu1_rsval[1] : (select_alu1[2] ? bypassout_alu1_rsval[2] : bypassout_alu1_rsval[3]));
    assign selalu1_rtval=select_alu1[0] ? bypassout_alu1_rtval[0] : (select_alu1[1] ? bypassout_alu1_rtval[1] : (select_alu1[2] ? bypassout_alu1_rtval[2] : bypassout_alu1_rtval[3]));
    assign selmu_rsval=mu_head[0] ? bypassout_mu_rsval[0] : (mu_head[1] ? bypassout_mu_rsval[1] : bypassout_mu_rsval[2]);
    //Note: rt可能是从fpubuffer里取出的
    assign selmu_rtval=(|(mu_head & rs_mu_usefpu)) ? ((|(mu_head & (rs_mu_issue2 | ~rs_mu_usefpu_double))) ? buffer_tomu0[selmu_destnum] : buffer_tomu1[selmu_destnum]) : (mu_head[0] ? bypassout_mu_rtval[0] : (mu_head[1] ? bypassout_mu_rtval[1] : bypassout_mu_rtval[2]));
    
    //下一个被填入的位置的prior
    wire[1:0] alu0_next_prior=alu0_mask[0] ? rs_alu0_prior[0] : (alu0_mask[1] ? rs_alu0_prior[1] : (alu0_mask[2] ? rs_alu0_prior[2] : rs_alu0_prior[3]));
    wire[1:0] alu1_next_prior=alu1_mask[0] ? rs_alu1_prior[0] : (alu1_mask[1] ? rs_alu1_prior[1] : (alu1_mask[2] ? rs_alu1_prior[2] : rs_alu1_prior[3]));
    wire[1:0] mu_next_prior=mu_mask[0] ? rs_mu_prior[0] : (mu_mask[1] ? rs_mu_prior[1] : rs_mu_prior[2]);
    wire mdu_next_prior=mdu_mask[0] ? rs_mdu_prior[0] : rs_mdu_prior[1];

    //Note: 禁用MemMid->preMem的旁路
    wire[2:0] wkupmurt;
    assign wkupmurt=0;
    //assign wkupmurt[0]=(rs_mu_wen[1] & (rs_mu_destnum[1] == rs_mu_rtnum[0])) | (rs_mu_wen[2] & (rs_mu_destnum[2] == rs_mu_rtnum[0]));
    //assign wkupmurt[1]=(rs_mu_wen[0] & (rs_mu_destnum[0] == rs_mu_rtnum[1])) | (rs_mu_wen[2] & (rs_mu_destnum[2] == rs_mu_rtnum[1]));
    //assign wkupmurt[2]=(rs_mu_wen[1] & (rs_mu_destnum[1] == rs_mu_rtnum[2])) | (rs_mu_wen[0] & (rs_mu_destnum[0] == rs_mu_rtnum[2]));
    

    generate
        for(i=0; i < `STATION_ALU_SIZE; i=i + 1) begin
            always@(posedge clk) begin
                if(~resetn) begin
                    rs_alu0_PC[i]<=0;
                    rs_alu0_inst[i]<=0;
                    rs_alu0_aluop[i]<=0;
                    rs_alu0_ctrl[i]<=0;
                    rs_alu0_cmpop[i]<=0;
                    rs_alu0_excode[i]<=0;
                    rs_alu0_predict[i]<=0;
                    rs_alu0_predict_target[i]<=0;
                    rs_alu0_rsnum[i]<=0;
                    rs_alu0_rtnum[i]<=0;
                    rs_alu0_destnum[i]<=0;
                    rs_alu1_PC[i]<=0;
                    rs_alu1_inst[i]<=0;
                    rs_alu1_aluop[i]<=0;
                    rs_alu1_ctrl[i]<=0;
                    rs_alu1_cmpop[i]<=0;
                    rs_alu1_excode[i]<=0;
                    rs_alu1_predict[i]<=0;
                    rs_alu1_predict_target[i]<=0;
                    rs_alu1_rsnum[i]<=0;
                    rs_alu1_rtnum[i]<=0;
                    rs_alu1_destnum[i]<=0;
                end
                else begin
                    if(~rs_alu0_valid[i]) begin
                        rs_alu0_PC[i]<=station_alu0_wen0[i] ? dispatch_PC0 : dispatch_PC1;
                        rs_alu0_inst[i]<=station_alu0_wen0[i] ? dispatch_inst0 : dispatch_inst1;
                        rs_alu0_aluop[i]<=station_alu0_wen0[i] ? dispatch_aluop0 : dispatch_aluop1;
                        rs_alu0_ctrl[i]<=station_alu0_wen0[i] ? dispatch_ctrl0 : dispatch_ctrl1;
                        rs_alu0_cmpop[i]<=station_alu0_wen0[i] ? dispatch_cmpop0 : dispatch_cmpop1;
                        rs_alu0_excode[i]<=station_alu0_wen0[i] ? dispatch_excode0 : dispatch_excode1;
                        rs_alu0_predict[i]<=station_alu0_wen0[i] ? dispatch_predict0 : dispatch_predict1;
                        rs_alu0_predict_target[i]<=station_alu0_wen0[i] ? dispatch_predict_target0 : dispatch_predict_target1;
                        rs_alu0_rsnum[i]<=station_alu0_wen0[i] ? dispatch_rsnum0 : dispatch_rsnum1;
                        rs_alu0_rtnum[i]<=station_alu0_wen0[i] ? dispatch_rtnum0 : dispatch_rtnum1;
                        rs_alu0_destnum[i]<=station_alu0_wen0[i] ? dispatch_num0 : dispatch_num1;
                    end
                    if(~rs_alu1_valid[i]) begin
                        rs_alu1_PC[i]<=station_alu1_wen0[i] ? dispatch_PC0 : dispatch_PC1;
                        rs_alu1_inst[i]<=station_alu1_wen0[i] ? dispatch_inst0 : dispatch_inst1;
                        rs_alu1_aluop[i]<=station_alu1_wen0[i] ? dispatch_aluop0 : dispatch_aluop1;
                        rs_alu1_ctrl[i]<=station_alu1_wen0[i] ? dispatch_ctrl0 : dispatch_ctrl1;
                        rs_alu1_cmpop[i]<=station_alu1_wen0[i] ? dispatch_cmpop0 : dispatch_cmpop1;
                        rs_alu1_excode[i]<=station_alu1_wen0[i] ? dispatch_excode0 : dispatch_excode1;
                        rs_alu1_predict[i]<=station_alu1_wen0[i] ? dispatch_predict0 : dispatch_predict1;
                        rs_alu1_predict_target[i]<=station_alu1_wen0[i] ? dispatch_predict_target0 : dispatch_predict_target1;
                        rs_alu1_rsnum[i]<=station_alu1_wen0[i] ? dispatch_rsnum0 : dispatch_rsnum1;
                        rs_alu1_rtnum[i]<=station_alu1_wen0[i] ? dispatch_rtnum0 : dispatch_rtnum1;
                        rs_alu1_destnum[i]<=station_alu1_wen0[i] ? dispatch_num0 : dispatch_num1;
                    end
                end
            end
            always@(posedge clk) begin
                if(~resetn) begin
                    rs_alu0_valid[i]<=0;
                    rs_alu1_valid[i]<=0;
                    rs_alu0_rsval[i]<=0;
                    rs_alu0_rtval[i]<=0;
                    rs_alu1_rsval[i]<=0;
                    rs_alu1_rtval[i]<=0;
                    rs_alu0_rsval_ready[i]<=0;
                    rs_alu0_rtval_ready[i]<=0;
                    rs_alu1_rsval_ready[i]<=0;
                    rs_alu1_rtval_ready[i]<=0;
                    rs_alu0_wakeuprs[i]<=0;
                    rs_alu0_wakeuprt[i]<=0;
                    rs_alu1_wakeuprs[i]<=0;
                    rs_alu1_wakeuprt[i]<=0;
                    rs_alu0_prior[i]<=i;
                    rs_alu1_prior[i]<=i;
                end
                else begin
                    if(flush | (station_alu0_wen0[i] | station_alu0_wen1[i]) | select_alu0[i])
                        rs_alu0_valid[i]<=~(flush | select_alu0[i]);
                    if(flush | (station_alu1_wen0[i] | station_alu1_wen1[i]) | select_alu1[i])
                        rs_alu1_valid[i]<=~(flush | select_alu1[i]);
                    if((~rs_alu0_rsval_ready[i]) | ~rs_alu0_valid[i])
                        rs_alu0_rsval[i]<=(~rs_alu0_valid[i]) ? (station_alu0_wen0[i] ? dispatch_rsval0 : dispatch_rsval1) : (bypass_alu0_alu0[0][i] ? alu0_writeback_wakeup_data : (bypass_alu1_alu0[0][i] ? alu1_writeback_wakeup_data : (bypass_mu_alu0[0][i] ? mu_writeback_wakeup_data : mdu_writeback_wakeup_data)));
                    if((~rs_alu0_rtval_ready[i]) | ~rs_alu0_valid[i])
                        rs_alu0_rtval[i]<=(~rs_alu0_valid[i]) ? (station_alu0_wen0[i] ? dispatch_rtval0 : dispatch_rtval1) : (bypass_alu0_alu0[1][i] ? alu0_writeback_wakeup_data : (bypass_alu1_alu0[1][i] ? alu1_writeback_wakeup_data : (bypass_mu_alu0[1][i] ? mu_writeback_wakeup_data : mdu_writeback_wakeup_data)));
                    if((~rs_alu1_rsval_ready[i]) | ~rs_alu1_valid[i])
                        rs_alu1_rsval[i]<=(~rs_alu1_valid[i]) ? (station_alu1_wen0[i] ? dispatch_rsval0 : dispatch_rsval1) : (bypass_alu0_alu1[0][i] ? alu0_writeback_wakeup_data : (bypass_alu1_alu1[0][i] ? alu1_writeback_wakeup_data : (bypass_mu_alu1[0][i] ? mu_writeback_wakeup_data : mdu_writeback_wakeup_data)));
                    if((~rs_alu1_rtval_ready[i]) | ~rs_alu1_valid[i])
                        rs_alu1_rtval[i]<=(~rs_alu1_valid[i]) ? (station_alu1_wen0[i] ? dispatch_rtval0 : dispatch_rtval1) : (bypass_alu0_alu1[1][i] ? alu0_writeback_wakeup_data : (bypass_alu1_alu1[1][i] ? alu1_writeback_wakeup_data : (bypass_mu_alu1[1][i] ? mu_writeback_wakeup_data : mdu_writeback_wakeup_data)));
                    if((~rs_alu0_rsval_ready[i]) | ~rs_alu0_valid[i])
                        rs_alu0_rsval_ready[i]<=rs_alu0_valid[i] ? (bypass_alu0_alu0[0][i] | bypass_alu1_alu0[0][i] | bypass_mu_alu0[0][i] | bypass_mdu_alu0[0][i]) : (station_alu0_wen0[i] ? dispatch_readyrs0 : dispatch_readyrs1);
                    if((~rs_alu0_rtval_ready[i]) | ~rs_alu0_valid[i])
                        rs_alu0_rtval_ready[i]<=rs_alu0_valid[i] ? (bypass_alu0_alu0[1][i] | bypass_alu1_alu0[1][i] | bypass_mu_alu0[1][i] | bypass_mdu_alu0[1][i]) : (station_alu0_wen0[i] ? dispatch_readyrt0 : dispatch_readyrt1);
                    if((~rs_alu1_rsval_ready[i]) | ~rs_alu1_valid[i])
                        rs_alu1_rsval_ready[i]<=rs_alu1_valid[i] ? (bypass_alu0_alu1[0][i] | bypass_alu1_alu1[0][i] | bypass_mu_alu1[0][i] | bypass_mdu_alu1[0][i]) : (station_alu1_wen0[i] ? dispatch_readyrs0 : dispatch_readyrs1);
                    if((~rs_alu1_rtval_ready[i]) | ~rs_alu1_valid[i])
                        rs_alu1_rtval_ready[i]<=rs_alu1_valid[i] ? (bypass_alu0_alu1[1][i] | bypass_alu1_alu1[1][i] | bypass_mu_alu1[1][i] | bypass_mdu_alu1[1][i]) : (station_alu1_wen0[i] ? dispatch_readyrt0 : dispatch_readyrt1);
                    if((~rs_alu0_wakeuprs[i]) | ~rs_alu0_valid[i])
                        rs_alu0_wakeuprs[i]<=rs_alu0_valid[i] ? (bypass_alu0_alu0[0][i] | bypass_alu1_alu0[0][i] | bypass_mu_alu0[0][i] | bypass_mdu_alu0[0][i] | bypass_mdumid_alu0[0][i] | (mu_mem_wakeup_en & (mu_mem_wakeup_num == rs_alu0_rsnum[i])) | (premem_wakeup_en & (premem_wakeup_num == rs_alu0_rsnum[i])) | (alu0_execute_wakeup_en & (alu0_execute_wakeup_num == rs_alu0_rsnum[i])) | (alu1_execute_wakeup_en & (alu1_execute_wakeup_num == rs_alu0_rsnum[i])) | (selalu0_valid & (selalu0_destnum == rs_alu0_rsnum[i])) | (selalu1_valid & (selalu1_destnum == rs_alu0_rsnum[i]))) : (station_alu0_wen0[i] ? dispatch_readyrs0 : dispatch_readyrs1);
                    if((~rs_alu0_wakeuprt[i]) | ~rs_alu0_valid[i])
                        rs_alu0_wakeuprt[i]<=rs_alu0_valid[i] ? (bypass_alu0_alu0[1][i] | bypass_alu1_alu0[1][i] | bypass_mu_alu0[1][i] | bypass_mdu_alu0[1][i] | bypass_mdumid_alu0[1][i] | (mu_mem_wakeup_en & (mu_mem_wakeup_num == rs_alu0_rtnum[i])) | (premem_wakeup_en & (premem_wakeup_num == rs_alu0_rtnum[i])) | (alu0_execute_wakeup_en & (alu0_execute_wakeup_num == rs_alu0_rtnum[i])) | (alu1_execute_wakeup_en & (alu1_execute_wakeup_num == rs_alu0_rtnum[i])) | (selalu0_valid & (selalu0_destnum == rs_alu0_rtnum[i])) | (selalu1_valid & (selalu1_destnum == rs_alu0_rtnum[i]))) : (station_alu0_wen0[i] ? dispatch_readyrt0 : dispatch_readyrt1);
                    if((~rs_alu1_wakeuprs[i]) | ~rs_alu1_valid[i])
                        rs_alu1_wakeuprs[i]<=rs_alu1_valid[i] ? (bypass_alu0_alu1[0][i] | bypass_alu1_alu1[0][i] | bypass_mu_alu1[0][i] | bypass_mdu_alu1[0][i] | bypass_mdumid_alu1[0][i] | (mu_mem_wakeup_en & (mu_mem_wakeup_num == rs_alu1_rsnum[i])) | (premem_wakeup_en & (premem_wakeup_num == rs_alu1_rsnum[i])) | (alu0_execute_wakeup_en & (alu0_execute_wakeup_num == rs_alu1_rsnum[i])) | (alu1_execute_wakeup_en & (alu1_execute_wakeup_num == rs_alu1_rsnum[i])) | (selalu0_valid & (selalu0_destnum == rs_alu1_rsnum[i])) | (selalu1_valid & (selalu1_destnum == rs_alu1_rsnum[i]))) : (station_alu1_wen0[i] ? dispatch_readyrs0 : dispatch_readyrs1);
                    if((~rs_alu1_wakeuprt[i]) | ~rs_alu1_valid[i])
                        rs_alu1_wakeuprt[i]<=rs_alu1_valid[i] ? (bypass_alu0_alu1[1][i] | bypass_alu1_alu1[1][i] | bypass_mu_alu1[1][i] | bypass_mdu_alu1[1][i] | bypass_mdumid_alu1[1][i] | (mu_mem_wakeup_en & (mu_mem_wakeup_num == rs_alu1_rtnum[i])) | (premem_wakeup_en & (premem_wakeup_num == rs_alu1_rtnum[i])) | (alu0_execute_wakeup_en & (alu0_execute_wakeup_num == rs_alu1_rtnum[i])) | (alu1_execute_wakeup_en & (alu1_execute_wakeup_num == rs_alu1_rtnum[i])) | (selalu0_valid & (selalu0_destnum == rs_alu1_rtnum[i])) | (selalu1_valid & (selalu1_destnum == rs_alu1_rtnum[i]))) : (station_alu1_wen0[i] ? dispatch_readyrt0 : dispatch_readyrt1);
                    if((|station_alu0_wen0) | (|station_alu0_wen1))
                        rs_alu0_prior[i]<=alu0_mask[i] ? 2'b11 : ((rs_alu0_prior[i] > alu0_next_prior) ? {&rs_alu0_prior[i],~rs_alu0_prior[i][0]} : rs_alu0_prior[i]);
                    if((|station_alu1_wen0) | (|station_alu1_wen1))
                        rs_alu1_prior[i]<=alu1_mask[i] ? 2'b11 : ((rs_alu1_prior[i] > alu1_next_prior) ? {&rs_alu1_prior[i],~rs_alu1_prior[i][0]} : rs_alu1_prior[i]);
                end
            end
        end
        for(i=0; i < `STATION_MU_SIZE; i=i + 1) begin
            always@(posedge clk) begin
                if(~resetn) begin
                    //rs_mu_inst[i]<=0;
                    rs_mu_muop[i]<=0;
                    rs_mu_rsnum[i]<=0;
                    rs_mu_rtnum[i]<=0;
                    rs_mu_destnum[i]<=0;
                    rs_mu_isload[i]<=0;
                    rs_mu_isstore[i]<=0;
                    rs_mu_cachewb[i]<=0;
                    rs_mu_wen[i]<=0;
                    rs_mu_tofpu[i]<=0;
                    rs_mu_usefpu[i]<=0;
                    rs_mu_usefpu_double[i]<=0;
                end
                else begin
                    if(~rs_mu_valid[i]) begin
                        //rs_mu_inst[i]<=station_mu_wen0[i] ? dispatch_inst0 : dispatch_inst1;
                        rs_mu_muop[i]<=station_mu_wen0[i] ? dispatch_muop0 : dispatch_muop1;
                        rs_mu_rsnum[i]<=station_mu_wen0[i] ? dispatch_rsnum0 : dispatch_rsnum1;
                        rs_mu_rtnum[i]<=station_mu_wen0[i] ? dispatch_rtnum0 : dispatch_rtnum1;
                        rs_mu_destnum[i]<=station_mu_wen0[i] ? dispatch_num0 : dispatch_num1;
                        rs_mu_isload[i]<=station_mu_wen0[i] ? dispatch_ctrl0[`CTRL_load] : dispatch_ctrl1[`CTRL_load];
                        rs_mu_isstore[i]<=station_mu_wen0[i] ? dispatch_ctrl0[`CTRL_store] : dispatch_ctrl1[`CTRL_store];
                        rs_mu_cachewb[i]<=station_mu_wen0[i] ? dispatch_ctrl0[`CTRL_cachewb] : dispatch_ctrl1[`CTRL_cachewb];
                        rs_mu_wen[i]<=station_mu_wen0[i] ? dispatch_ctrl0[`CTRL_wen] : dispatch_ctrl1[`CTRL_wen];
                        rs_mu_tofpu[i]<=station_mu_wen0[i] ? dispatch_ctrl0[`CTRL_tofpu] : dispatch_ctrl1[`CTRL_tofpu];
                        rs_mu_usefpu[i]<=station_mu_wen0[i] ? dispatch_ctrl0[`CTRL_waitfpu] : dispatch_ctrl1[`CTRL_waitfpu];
                        rs_mu_usefpu_double[i]<=station_mu_wen0[i] ? dispatch_ctrl0[`CTRL_issue2] : dispatch_ctrl1[`CTRL_issue2];
                    end
                end
            end
            always@(posedge clk) begin
                if(~resetn) begin
                    rs_mu_valid[i]<=0;
                    rs_mu_rsval[i]<=0;
                    rs_mu_rtval[i]<=0;
                    rs_mu_rsval_ready[i]<=0;
                    rs_mu_rtval_ready[i]<=0;
                    rs_mu_wakeuprs[i]<=0;
                    rs_mu_wakeuprt[i]<=0;
                    rs_mu_prior[i]<=i;
                    rs_mu_issue2[i]<=0;
                    rs_mu_fromfpu_ready[i]<=0;
                    rs_mu_offset[i]<=0;
                end
                else begin
                    if(flush | (station_mu_wen0[i] | station_mu_wen1[i]) | (mu_head[i] & canmu[i] & (~rs_mu_issue2[i]) & ~mu_busy))
                        rs_mu_valid[i]<=~(flush | mu_head[i]);
                    if((~rs_mu_rsval_ready[i]) | ~rs_mu_valid[i])
                        rs_mu_rsval[i]<=(~rs_mu_valid[i]) ? (station_mu_wen0[i] ? dispatch_rsval0 : dispatch_rsval1) : (bypass_alu0_mu[0][i] ? alu0_writeback_wakeup_data : (bypass_alu1_mu[0][i] ? alu1_writeback_wakeup_data : (bypass_mu_mu[0][i] ? mu_writeback_wakeup_data : mdu_writeback_wakeup_data)));
                    if((~rs_mu_rtval_ready[i]) | ~rs_mu_valid[i])
                        rs_mu_rtval[i]<=(~rs_mu_valid[i]) ? (station_mu_wen0[i] ? dispatch_rtval0 : dispatch_rtval1) : (bypass_alu0_mu[1][i] ? alu0_writeback_wakeup_data : (bypass_alu1_mu[1][i] ? alu1_writeback_wakeup_data : (bypass_mu_mu[1][i] ? mu_writeback_wakeup_data : mdu_writeback_wakeup_data)));
                    if((~rs_mu_rsval_ready[i]) | ~rs_mu_valid[i])
                        rs_mu_rsval_ready[i]<=rs_mu_valid[i] ? (bypass_alu0_mu[0][i] | bypass_alu1_mu[0][i] | bypass_mu_mu[0][i] | bypass_mdu_mu[0][i]) : (station_mu_wen0[i] ? dispatch_readyrs0 : dispatch_readyrs1);
                    if((~rs_mu_rtval_ready[i]) | ~rs_mu_valid[i])
                        rs_mu_rtval_ready[i]<=rs_mu_valid[i] ? (bypass_alu0_mu[1][i] | bypass_alu1_mu[1][i] | bypass_mu_mu[1][i] | bypass_mdu_mu[1][i]) : (station_mu_wen0[i] ? dispatch_readyrt0 : dispatch_readyrt1);
                    
                    if((~rs_mu_wakeuprs[i]) | ~rs_mu_valid[i])
                        rs_mu_wakeuprs[i]<=rs_mu_valid[i] ? (bypass_alu0_mu[0][i] | bypass_alu1_mu[0][i] | bypass_mu_mu[0][i] | bypass_mdu_mu[0][i] | (mu_mem_wakeup_en & (mu_mem_wakeup_num == rs_mu_rsnum[i])) | (alu0_execute_wakeup_en & (alu0_execute_wakeup_num == rs_mu_rsnum[i])) | (alu1_execute_wakeup_en & (alu1_execute_wakeup_num == rs_mu_rsnum[i])) | (selalu0_valid & (selalu0_destnum == rs_mu_rsnum[i])) | (selalu1_valid & (selalu1_destnum == rs_mu_rsnum[i]))) : (station_mu_wen0[i] ? dispatch_readyrs0 : dispatch_readyrs1);
                    
                    //load to store提前唤醒优化
                    if((~rs_mu_wakeuprt[i]) | ~rs_mu_valid[i])
                        rs_mu_wakeuprt[i]<=rs_mu_valid[i] ? (bypass_alu0_mu[1][i] | bypass_alu1_mu[1][i] | bypass_mu_mu[1][i] | bypass_mdu_mu[1][i] | wkupmurt[i] | (mu_mem_wakeup_en & (mu_mem_wakeup_num == rs_mu_rtnum[i])) | (premem_wakeup_en & (premem_wakeup_num == rs_mu_rtnum[i])) | (alu0_execute_wakeup_en & (alu0_execute_wakeup_num == rs_mu_rtnum[i])) | (alu1_execute_wakeup_en & (alu1_execute_wakeup_num == rs_mu_rtnum[i])) | (selalu0_valid & (selalu0_destnum == rs_mu_rtnum[i])) | (selalu1_valid & (selalu1_destnum == rs_mu_rtnum[i]))) : (station_mu_wen0[i] ? dispatch_readyrt0 : dispatch_readyrt1);
                    
                    if((|station_mu_wen0) | (|station_mu_wen1))
                        rs_mu_prior[i]<=mu_mask[i] ? 2'b10 : ((rs_mu_prior[i] > mu_next_prior) ? {1'b0,~rs_mu_prior[i][0]} : rs_mu_prior[i]);
                
                    //第一次发射时将issue2置0，将offset+=4
                    if((~rs_mu_valid[i]) | (mu_head[i] & canmu[i] & rs_mu_wakeuprs[i] & rs_mu_wakeuprt[i] & ~mu_busy)) begin
                        rs_mu_issue2[i]<=(~rs_mu_valid[i]) & (station_mu_wen0[i] ? dispatch_ctrl0[`CTRL_issue2] : dispatch_ctrl1[`CTRL_issue2]);
                        rs_mu_offset[i]<=(~rs_mu_valid[i]) ? (station_mu_wen0[i] ? {dispatch_inst0[15],dispatch_inst0[15:0]} : {dispatch_inst1[15],dispatch_inst1[15:0]}) : (rs_mu_offset[i] + 4);
                    end
                    if((~rs_mu_fromfpu_ready[i]) | ~rs_mu_valid[i])
                        rs_mu_fromfpu_ready[i]<=rs_mu_valid[i] ? (fpu_to_mu_valid & (fpu_to_mu_num == rs_mu_destnum[i])) : (station_mu_wen0[i] ? ((~dispatch_ctrl0[`CTRL_waitfpu]) | buffer_tomu_ready[dispatch_num0] | (fpu_to_mu_valid & (fpu_to_mu_num == dispatch_num0))) : ((~dispatch_ctrl1[`CTRL_waitfpu]) | buffer_tomu_ready[dispatch_num1] | (fpu_to_mu_valid & (fpu_to_mu_num == dispatch_num1))));
                
                end
            end
        end
        for(i=0; i < `STATION_MDU_SIZE; i=i + 1) begin
            always@(posedge clk) begin
                if(~resetn) begin
                    rs_mdu_mduop[i]<=0;
                    rs_mdu_rsnum[i]<=0;
                    rs_mdu_rtnum[i]<=0;
                    rs_mdu_destnum[i]<=0;
                    rs_mdu_cp0addr[i]<=0;
                    rs_mdu_tofpu[i]<=0;
                end
                else begin
                    if(~rs_mdu_valid[i]) begin
                        rs_mdu_mduop[i]<=station_mdu_wen0[i] ? dispatch_mduop0 : dispatch_mduop1;
                        rs_mdu_rsnum[i]<=station_mdu_wen0[i] ? dispatch_rsnum0 : dispatch_rsnum1;
                        rs_mdu_rtnum[i]<=station_mdu_wen0[i] ? dispatch_rtnum0 : dispatch_rtnum1;
                        rs_mdu_destnum[i]<=station_mdu_wen0[i] ? dispatch_num0 : dispatch_num1;
                        rs_mdu_cp0addr[i]<=station_mdu_wen0[i] ? dispatch_cp0addr0 : dispatch_cp0addr1;
                        rs_mdu_tofpu[i]<=station_mdu_wen0[i] ? dispatch_ctrl0[`CTRL_tofpu] : dispatch_ctrl1[`CTRL_tofpu];
                    end
                end
            end
            always@(posedge clk) begin
                if(~resetn) begin
                    rs_mdu_valid[i]<=0;
                    rs_mdu_rsval[i]<=0;
                    rs_mdu_rtval[i]<=0;
                    rs_mdu_wakeuprs[i]<=0;
                    rs_mdu_wakeuprt[i]<=0;
                    rs_mdu_prior[i]<=i;
                    rs_mdu_fromfpu_ready[i]<=0;
                    rs_mdu_fromfpu_bool_ready[i]<=0;
                end
                else begin
                    if(flush | (station_mdu_wen0[i] | station_mdu_wen1[i]) | (mdu_head[i] & canmdu[i] & ~mdu_busy))
                        rs_mdu_valid[i]<=~(flush | (mdu_head[i] & canmdu[i]));
                    if((~rs_mdu_wakeuprs[i]) | ~rs_mdu_valid[i])
                        rs_mdu_rsval[i]<=(~rs_mdu_valid[i]) ? (station_mdu_wen0[i] ? dispatch_rsval0 : dispatch_rsval1) : (bypass_alu0_mdu[0][i] ? alu0_writeback_wakeup_data : (bypass_alu1_mdu[0][i] ? alu1_writeback_wakeup_data : (bypass_mu_mdu[0][i] ? mu_writeback_wakeup_data : mdu_writeback_wakeup_data)));
                    if((~rs_mdu_wakeuprt[i]) | ~rs_mdu_valid[i])
                        rs_mdu_rtval[i]<=(~rs_mdu_valid[i]) ? (station_mdu_wen0[i] ? dispatch_rtval0 : dispatch_rtval1) : (bypass_alu0_mdu[1][i] ? alu0_writeback_wakeup_data : (bypass_alu1_mdu[1][i] ? alu1_writeback_wakeup_data : (bypass_mu_mdu[1][i] ? mu_writeback_wakeup_data : mdu_writeback_wakeup_data)));
                    if((~rs_mdu_wakeuprs[i]) | ~rs_mdu_valid[i])
                        rs_mdu_wakeuprs[i]<=rs_mdu_valid[i] ? (bypass_alu0_mdu[0][i] | bypass_alu1_mdu[0][i] | bypass_mu_mdu[0][i] | bypass_mdu_mdu[0][i]) : (station_mdu_wen0[i] ? dispatch_readyrs0 : dispatch_readyrs1);
                    if((~rs_mdu_wakeuprt[i]) | ~rs_mdu_valid[i])
                        rs_mdu_wakeuprt[i]<=rs_mdu_valid[i] ? (bypass_alu0_mdu[1][i] | bypass_alu1_mdu[1][i] | bypass_mu_mdu[1][i] | bypass_mdu_mdu[1][i]) : (station_mdu_wen0[i] ? dispatch_readyrt0 : dispatch_readyrt1);
                    if((|station_mdu_wen0) | (|station_mdu_wen1))
                        rs_mdu_prior[i]<=mdu_mask[i];
                    
                    if((~rs_mdu_fromfpu_ready[i]) | ~rs_mdu_valid[i])
                        rs_mdu_fromfpu_ready[i]<=rs_mdu_valid[i] ? (fpu_to_mdu_valid & (fpu_to_mdu_num == rs_mdu_destnum[i])) : (station_mdu_wen0[i] ? ((~dispatch_ctrl0[`CTRL_waitfpu]) | buffer_tomdu_ready[dispatch_num0] | (fpu_to_mdu_valid & (fpu_to_mdu_num == dispatch_num0))) : ((~dispatch_ctrl1[`CTRL_waitfpu]) | buffer_tomdu_ready[dispatch_num1] | (fpu_to_mdu_valid & (fpu_to_mdu_num == dispatch_num1))));
                    if((~rs_mdu_fromfpu_bool_ready[i]) | ~rs_mdu_valid[i])
                        rs_mdu_fromfpu_bool_ready[i]<=rs_mdu_valid[i] ? (fpu_to_mdu_bool_valid & (fpu_to_mdu_bool_num == rs_mdu_destnum[i])) : (station_mdu_wen0[i] ? ((~dispatch_ctrl0[`CTRL_waitfpubool]) | buffer_tomdu_bool_ready[dispatch_num0] | (fpu_to_mdu_bool_valid & (fpu_to_mdu_bool_num == dispatch_num0))) : ((~dispatch_ctrl1[`CTRL_waitfpubool]) | buffer_tomdu_bool_ready[dispatch_num1] | (fpu_to_mdu_bool_valid & (fpu_to_mdu_bool_num == dispatch_num1))));
                end
            end
        end
    endgenerate
    
    //发射MDU时将rt推到FPU通道
    always@(posedge clk) begin
        if(~resetn) begin
            mdu_to_fpu_valid<=0;
            mdu_to_fpu_data<=0;
            mdu_to_fpu_num<=0;
        end
        else begin
            mdu_to_fpu_valid<=selmdu_valid & (mdu_head[0] ? rs_mdu_tofpu[0] : rs_mdu_tofpu[1]);
            mdu_to_fpu_num<=mdu_head[0] ? rs_mdu_destnum[0] : rs_mdu_destnum[1];
            mdu_to_fpu_data<=selmdu_rtval;
        end
    end

endmodule