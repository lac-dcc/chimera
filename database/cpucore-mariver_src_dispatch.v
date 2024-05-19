// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    Dispatch模块
*/

module dispatch(
    input           clk,
    input           resetn,
    //来自Rename的输入
    input                               rename_valid0,
    input[31:0]                         rename_PC0,
    input[31:0]                         rename_inst0,
    input                               rename_predict0,
    input[31:0]                         rename_predict_target0,
    input[`CNT_FU - 1:0]                rename_futype0, //若decode检测出异常则视作ALU指令
    input[$clog2(`CNT_ALUOP) - 1:0]     rename_aluop0,  //若ALU指令则操作码
    input[`CNT_MDUOP - 1:0]             rename_mduop0,
    input[$clog2(`CNT_MUOP) - 1:0]      rename_muop0,
    input[`CNT_CTRL - 1:0]              rename_ctrl0,
    input[$clog2(`CNT_CMP) - 1:0]       rename_cmpop0,
    input[$clog2(`CNT_EXCEPTION) - 1:0] rename_excode0,
    input[$clog2(`ROB_SIZE) - 1:0]      rename_num0,    //指令0的ROB编号
    input                               rename_readyrs0,
    input                               rename_readyrt0,
    input[31:0]                         rename_rsval0,
    input[31:0]                         rename_rtval0,
    input[$clog2(`ROB_SIZE) - 1:0]      rename_rsnum0,
    input[$clog2(`ROB_SIZE) - 1:0]      rename_rtnum0,      //这个num直接来自GPR状态表
    input[5:0]                          rename_cp0addr0,
    input                               rename_valid1,
    input[31:0]                         rename_PC1,
    input[31:0]                         rename_inst1,
    input                               rename_predict1,
    input[31:0]                         rename_predict_target1,
    input[`CNT_FU - 1:0]                rename_futype1, //若decode检测出异常则视作ALU指令
    input[$clog2(`CNT_ALUOP) - 1:0]     rename_aluop1,  //若ALU指令则操作码
    input[`CNT_MDUOP - 1:0]             rename_mduop1,
    input[$clog2(`CNT_MUOP) - 1:0]      rename_muop1,
    input[`CNT_CTRL - 1:0]              rename_ctrl1,
    input[$clog2(`CNT_CMP) - 1:0]       rename_cmpop1,
    input[$clog2(`CNT_EXCEPTION) - 1:0] rename_excode1,
    input[$clog2(`ROB_SIZE) - 1:0]      rename_num1,    //指令1的ROB编号
    input                               rename_readyrs1,
    input                               rename_readyrt1,
    input[31:0]                         rename_rsval1,
    input[31:0]                         rename_rtval1,
    input[$clog2(`ROB_SIZE) - 1:0]      rename_rsnum1,
    input[$clog2(`ROB_SIZE) - 1:0]      rename_rtnum1,      //这个num直接来自GPR状态表
    input[5:0]                          rename_cp0addr1,
    //反馈给Rename的信号
    output          dispatch_busy,
    //来自Commit
    input           flush,
    //ROB读端口，来自2×2个操作数。注意，如果当前周期在写ROB，则需要旁路支持
    output[$clog2(`ROB_SIZE) - 1:0]     rob_raddr0,
    output[$clog2(`ROB_SIZE) - 1:0]     rob_raddr1,
    output[$clog2(`ROB_SIZE) - 1:0]     rob_raddr2,
    output[$clog2(`ROB_SIZE) - 1:0]     rob_raddr3,
    input[31:0]     rob_rdata0,
    input[31:0]     rob_rdata1,
    input[31:0]     rob_rdata2,
    input[31:0]     rob_rdata3,     //这几个rdata来自result，需要从4个体里选出正确的那个
    input           rob_ready0,
    input           rob_ready1,
    input           rob_ready2,
    input           rob_ready3,     //这4个ready决定了操作数在保留站里是否ready
    //保留站传递过来的反馈信号
    //注意：valid=1表示你【不能】往这个位置上分发！
    input[`STATION_ALU_SIZE - 1:0]      station_alu0_valid,
    input[`STATION_ALU_SIZE - 1:0]      station_alu1_valid,
    input[`STATION_MDU_SIZE - 1:0]      station_mdu_valid,
    input[`STATION_MU_SIZE - 1:0]       station_mu_valid,
    //传递给保留站的写使能信号，保证同valid相适应，既有使能含义，也有0/1数据选择含义
    output[`STATION_ALU_SIZE - 1:0]     station_alu0_wen0,  //若为1则将指令0送入
    output[`STATION_ALU_SIZE - 1:0]     station_alu1_wen0,  //若为1则将指令0送入
    output[`STATION_MU_SIZE - 1:0]      station_mu_wen0,
    output[`STATION_MDU_SIZE - 1:0]     station_mdu_wen0,
    output[`STATION_ALU_SIZE - 1:0]     station_alu0_wen1,  //若为1则将指令1送入
    output[`STATION_ALU_SIZE - 1:0]     station_alu1_wen1,  //若为1则将指令1送入
    output[`STATION_MU_SIZE - 1:0]      station_mu_wen1,
    output[`STATION_MDU_SIZE - 1:0]     station_mdu_wen1,
    //传递给保留站的保留站选择信号，但并不一定有写使能含义
    output[3:0] alu0_mask,
    output[3:0] alu1_mask,
    output[2:0] mu_mask,
    output[1:0] mdu_mask,
    //传递给保留站的信息，以组合逻辑呈现（可能直接使用rename的输出，但也可能有真的组合逻辑，比如data）
    //这里就不需要valid了因为已经蕴含在wen里面了
    output[31:0]                        dispatch_PC0,
    output[31:0]                        dispatch_inst0,
    output                              dispatch_predict0,
    output[31:0]                        dispatch_predict_target0,
    output[`CNT_FU - 1:0]               dispatch_futype0, //若decode检测出异常则视作ALU指令
    output[$clog2(`CNT_ALUOP) - 1:0]    dispatch_aluop0,  //若ALU指令则操作码
    output[`CNT_MDUOP - 1:0]            dispatch_mduop0,
    output[$clog2(`CNT_MUOP) - 1:0]     dispatch_muop0,
    output[`CNT_CTRL - 1:0]             dispatch_ctrl0,
    output[$clog2(`CNT_CMP) - 1:0]      dispatch_cmpop0,
    output[$clog2(`CNT_EXCEPTION) - 1:0]    dispatch_excode0,
    output[$clog2(`ROB_SIZE) - 1:0]     dispatch_num0,    //指令0的ROB编号
    output                              dispatch_readyrs0,
    output                              dispatch_readyrt0,
    output[31:0]                        dispatch_rsval0,
    output[31:0]                        dispatch_rtval0,    //这俩val是读过ROB后的val
    output[$clog2(`ROB_SIZE) - 1:0]     dispatch_rsnum0,
    output[$clog2(`ROB_SIZE) - 1:0]     dispatch_rtnum0,
    output[5:0]                         dispatch_cp0addr0,
    output[31:0]                        dispatch_PC1,
    output[31:0]                        dispatch_inst1,
    output                              dispatch_predict1,
    output[31:0]                        dispatch_predict_target1,
    output[`CNT_FU - 1:0]               dispatch_futype1, //若decode检测出异常则视作ALU指令
    output[$clog2(`CNT_ALUOP) - 1:0]    dispatch_aluop1,  //若ALU指令则操作码
    output[`CNT_MDUOP - 1:0]            dispatch_mduop1,
    output[$clog2(`CNT_MUOP) - 1:0]     dispatch_muop1,
    output[`CNT_CTRL - 1:0]             dispatch_ctrl1,
    output[$clog2(`CNT_CMP) - 1:0]      dispatch_cmpop1,
    output[$clog2(`CNT_EXCEPTION) - 1:0]    dispatch_excode1,
    output[$clog2(`ROB_SIZE) - 1:0]     dispatch_num1,    //指令1的ROB编号
    output                              dispatch_readyrs1,
    output                              dispatch_readyrt1,
    output[31:0]                        dispatch_rsval1,
    output[31:0]                        dispatch_rtval1,
    output[$clog2(`ROB_SIZE) - 1:0]     dispatch_rsnum1,
    output[$clog2(`ROB_SIZE) - 1:0]     dispatch_rtnum1,
    output[5:0]                         dispatch_cp0addr1
    );

    reg mask0,mask1;    //这两个reg标记用于部分取指，mask & valid才是真正的valid
    reg[31:0] random;
    //wire rand=random[0];           //用于随机分配ALU0/1

    //我们试验一下如果直接按保留站容量进行分配是否可行？
    wire[2:0] alucap0=({2'b0,station_alu0_valid[0]} + {2'b0,station_alu0_valid[1]}) + ({2'b0,station_alu0_valid[2]} + {2'b0,station_alu0_valid[3]});
    wire[2:0] alucap1=({2'b0,station_alu1_valid[0]} + {2'b0,station_alu1_valid[1]}) + ({2'b0,station_alu1_valid[2]} + {2'b0,station_alu1_valid[3]});
    wire rand=(alucap1 < alucap0);

    assign rob_raddr0=rename_rsnum0;
    assign rob_raddr1=rename_rtnum0;
    assign rob_raddr2=rename_rsnum1;
    assign rob_raddr3=rename_rtnum1;

    //直接使用Rename/Dispatch的信息输出
    assign dispatch_PC0=rename_PC0;
    assign dispatch_PC1=rename_PC1;
    assign dispatch_inst0=rename_inst0;
    assign dispatch_inst1=rename_inst1;
    assign dispatch_predict0=rename_predict0;
    assign dispatch_predict1=rename_predict1;
    assign dispatch_predict_target0=rename_predict_target0;
    assign dispatch_predict_target1=rename_predict_target1;
    assign dispatch_futype0=rename_futype0;
    assign dispatch_futype1=rename_futype1;
    assign dispatch_aluop0=rename_aluop0;
    assign dispatch_aluop1=rename_aluop1;
    assign dispatch_mduop0=rename_mduop0;
    assign dispatch_mduop1=rename_mduop1;
    assign dispatch_muop0=rename_muop0;
    assign dispatch_muop1=rename_muop1;
    assign dispatch_ctrl0=rename_ctrl0;
    assign dispatch_ctrl1=rename_ctrl1;
    assign dispatch_cmpop0=rename_cmpop0;
    assign dispatch_cmpop1=rename_cmpop1;
    assign dispatch_excode0=rename_excode0;
    assign dispatch_excode1=rename_excode1;
    assign dispatch_num0=rename_num0;
    assign dispatch_num1=rename_num1;
    assign dispatch_rsnum0=rename_rsnum0;
    assign dispatch_rsnum1=rename_rsnum1;
    assign dispatch_rtnum0=rename_rtnum0;
    assign dispatch_rtnum1=rename_rtnum1;
    assign dispatch_cp0addr0=rename_cp0addr0;
    assign dispatch_cp0addr1=rename_cp0addr1;

    wire alu0_valid=~(&station_alu0_valid);     //此【valid】非彼【valid】，表示保留站是否能接受，至少有一个valid=0
    wire alu1_valid=~(&station_alu1_valid);
    wire mdu_valid=~(&station_mdu_valid);
    wire mu_valid=~(&station_mu_valid);
    
    //判断阻塞，以下条件满足任一即可
    //1.两个都有效且都是ALU，但至少一个ALU保留站满
    //2.其中一个有效且是ALU，但两个ALU保留站都满
    //3.其中一个是MU，但MU保留站满
    //4.其中一个是MDU，但MDU保留站满
    //5.两个都是MU，或者两个都是MDU
    assign dispatch_busy=
        ((mask0 & rename_valid0 & rename_futype0[`FU_ALU]) & (mask1 & rename_valid1 & rename_futype1[`FU_ALU]) & ~(alu0_valid & alu1_valid)) |
        (((mask0 & rename_valid0 & rename_futype0[`FU_ALU]) | (mask1 & rename_valid1 & rename_futype1[`FU_ALU])) & ~(alu0_valid | alu1_valid)) |
        (((mask0 & rename_valid0 & rename_futype0[`FU_MU]) | (mask1 & rename_valid1 & rename_futype1[`FU_MU])) & ~mu_valid) |
        (((mask0 & rename_valid0 & rename_futype0[`FU_MDU]) | (mask1 & rename_valid1 & rename_futype1[`FU_MDU])) & ~mdu_valid) |
        (mask0 & rename_valid0 & mask1 & rename_valid1 & ((rename_futype0[`FU_MU] & rename_futype1[`FU_MU]) | (rename_futype0[`FU_MDU] & rename_futype1[`FU_MDU])));
    
    //生成操作数值
    assign dispatch_readyrs0=rename_readyrs0 | rob_ready0;
    assign dispatch_readyrt0=rename_readyrt0 | rob_ready1;
    assign dispatch_readyrs1=rename_readyrs1 | rob_ready2;
    assign dispatch_readyrt1=rename_readyrt1 | rob_ready3;
    assign dispatch_rsval0=rename_readyrs0 ? rename_rsval0 : rob_rdata0;
    assign dispatch_rtval0=rename_readyrt0 ? rename_rtval0 : rob_rdata1;
    assign dispatch_rsval1=rename_readyrs1 ? rename_rsval1 : rob_rdata2;
    assign dispatch_rtval1=rename_readyrt1 ? rename_rtval1 : rob_rdata3;

    //分发逻辑
    //对于ALU0，如果两者皆为ALU则仅输入0，若只有一个为ALU，若ALU1满则输入，否则仅当rand=0时输入
    //对于ALU1，如果两者皆为ALU则仅输入1，若只有一个为ALU，若ALU1满则输入，否则仅当rand=1时输入
    //对于MDU，如果两者皆为MDU则仅输入0，若只有一个则直接输入
    //对于MU，如果两者皆为MU则仅输入0，若只有一个则直接输入
    //这里我们不用宏定义了，直接按4,4,3,2的固定容量来……
    assign alu0_mask[0]=~station_alu0_valid[0];
    assign alu0_mask[1]=station_alu0_valid[0] & ~station_alu0_valid[1];
    assign alu0_mask[2]=station_alu0_valid[0] & station_alu0_valid[1] & ~station_alu0_valid[2];
    assign alu0_mask[3]=station_alu0_valid[0] & station_alu0_valid[1] & station_alu0_valid[2] & ~station_alu0_valid[3];
    assign alu1_mask[0]=~station_alu1_valid[0];
    assign alu1_mask[1]=station_alu1_valid[0] & ~station_alu1_valid[1];
    assign alu1_mask[2]=station_alu1_valid[0] & station_alu1_valid[1] & ~station_alu1_valid[2];
    assign alu1_mask[3]=station_alu1_valid[0] & station_alu1_valid[1] & station_alu1_valid[2] & ~station_alu1_valid[3];
    assign mu_mask[0]=~station_mu_valid[0];
    assign mu_mask[1]=station_mu_valid[0] & ~station_mu_valid[1];
    assign mu_mask[2]=station_mu_valid[0] & station_mu_valid[1] & ~station_mu_valid[2];
    assign mdu_mask[0]=~station_mdu_valid[0];
    assign mdu_mask[1]=station_mdu_valid[0] & ~station_mdu_valid[1];

    //注意，这里的使能信号并没有考虑该FU本身为满的情况，反正output出去的是mask过的
    wire alu0_inst0=(mask0 & rename_valid0 & rename_futype0[`FU_ALU]) & ((~rand) | (~alu1_valid) | (mask1 & rename_valid1 & rename_futype1[`FU_ALU] & alu1_valid));
    wire alu0_inst1=mask1 & rename_valid1 & rename_futype1[`FU_ALU] & ((~rand) | (~alu1_valid)) & ~(mask0 & rename_valid0 & rename_futype0[`FU_ALU]);
    wire alu1_inst0=mask0 & rename_valid0 & rename_futype0[`FU_ALU] & (rand | (~alu0_valid)) & ~(mask1 & rename_valid1 & rename_futype1[`FU_ALU]);
    wire alu1_inst1=(mask1 & rename_valid1 & rename_futype1[`FU_ALU]) & (rand | (~alu0_valid) | (mask0 & rename_valid0 & rename_futype0[`FU_ALU] & alu0_valid));
    wire mu_inst0=mask0 & rename_valid0 & rename_futype0[`FU_MU];
    wire mu_inst1=mask1 & rename_valid1 & rename_futype1[`FU_MU] & ~(mask0 & rename_valid0 & rename_futype0[`FU_MU]);
    wire mdu_inst0=mask0 & rename_valid0 & rename_futype0[`FU_MDU];
    wire mdu_inst1=mask1 & rename_valid1 & rename_futype1[`FU_MDU] & ~(mask0 & rename_valid0 & rename_futype0[`FU_MDU]);
    
    assign station_alu0_wen0={4{alu0_inst0}} & alu0_mask;
    assign station_alu0_wen1={4{alu0_inst1}} & alu0_mask;
    assign station_alu1_wen0={4{alu1_inst0}} & alu1_mask;
    assign station_alu1_wen1={4{alu1_inst1}} & alu1_mask;
    assign station_mu_wen0={3{mu_inst0}} & mu_mask;
    assign station_mu_wen1={3{mu_inst1}} & mu_mask;
    assign station_mdu_wen0={2{mdu_inst0}} & mdu_mask;
    assign station_mdu_wen1={2{mdu_inst1}} & mdu_mask;
    
    /*always@(posedge clk)
        if(~resetn)
            rand<=0;
        else
            rand<=~rand;*/
    always@(posedge clk) begin
        if(~resetn)
            random<=32'h19260817;
        else begin
            random[0]<=random[0] ^ random[17] ^ random[4];
            random[1]<=random[1] ^ random[18] ^ random[5];
            random[2]<=random[2] ^ random[19] ^ random[6];
            random[3]<=random[3] ^ random[20] ^ random[7];
            random[4]<=random[4] ^ random[21] ^ random[8];
            random[5]<=random[5] ^ random[22] ^ random[9] ^ random[0] ^ random[17] ^ random[4];
            random[6]<=random[6] ^ random[23] ^ random[10] ^ random[1] ^ random[18] ^ random[5];
            random[7]<=random[7] ^ random[24] ^ random[11] ^ random[2] ^ random[19] ^ random[6];
            random[8]<=random[8] ^ random[25] ^ random[12] ^ random[3] ^ random[20] ^ random[7];
            random[9]<=random[9] ^ random[26] ^ random[13] ^ random[4] ^ random[21] ^ random[8];
            random[10]<=random[10] ^ random[27] ^ random[14] ^ random[5] ^ random[22] ^ random[9];
            random[11]<=random[11] ^ random[28] ^ random[15] ^ random[6] ^ random[23] ^ random[10];
            random[12]<=random[12] ^ random[29] ^ random[16] ^ random[7] ^ random[24] ^ random[11];
            random[13]<=random[13] ^ random[0] ^ random[30] ^ random[17] ^ random[8] ^ random[25] ^ random[12];
            random[14]<=random[14] ^ random[1] ^ random[31] ^ random[18] ^ random[9] ^ random[26] ^ random[13];
            random[15]<=random[15] ^ random[2] ^ random[10] ^ random[27] ^ random[14];
            random[16]<=random[16] ^ random[3] ^ random[11] ^ random[28] ^ random[15];
            random[17]<=random[17] ^ random[4] ^ random[12] ^ random[29] ^ random[16];
            random[18]<=random[18] ^ random[5] ^ random[13] ^ random[0] ^ random[30] ^ random[17];
            random[19]<=random[19] ^ random[6] ^ random[14] ^ random[1] ^ random[31] ^ random[18];
            random[20]<=random[20] ^ random[7] ^ random[15] ^ random[2];
            random[21]<=random[21] ^ random[8] ^ random[16] ^ random[3];
            random[22]<=random[22] ^ random[9] ^ random[17] ^ random[4];
            random[23]<=random[23] ^ random[10] ^ random[18] ^ random[5];
            random[24]<=random[24] ^ random[11] ^ random[19] ^ random[6];
            random[25]<=random[25] ^ random[12] ^ random[20] ^ random[7];
            random[26]<=random[26] ^ random[13] ^ random[21] ^ random[8];
            random[27]<=random[27] ^ random[14] ^ random[22] ^ random[9];
            random[28]<=random[28] ^ random[15] ^ random[23] ^ random[10];
            random[29]<=random[29] ^ random[16] ^ random[24] ^ random[11];
            random[30]<=random[30] ^ random[17] ^ random[25] ^ random[12];
            random[31]<=random[31] ^ random[18] ^ random[26] ^ random[13];
        end
    end
    
    always@(posedge clk) begin
        if(~resetn) begin
            mask0<=1;
            mask1<=1;
        end
        else begin
            if(flush | ~dispatch_busy) begin
                mask0<=1;
                mask1<=1;
            end
            else begin
                //阻塞，且仅分发两条指令中的一条，修改内部标记
                //两条指令都有效，且两个不可能都是ALU
                //1.其中一条是ALU，另一条不是ALU，ALU至少一个为空，分发ALU指令
                //2.其中一条是MU/MDU，另一条的FU满了，这一条的FU为空
                //3.这两条都不是ALU且FU一致，FU为空，分发指令0

                //什么时候把指令0标记为已经取走？
                //1.指令0为ALU，仅当：指令1不为ALU，ALU至少一个为空
                //2.指令0为MU，仅当：MU为空
                //3.指令0为MDU，仅当：MDU为空
                //什么时候把指令1标记为已经取走？
                //1.指令1为ALU，仅当：指令0不为ALU，ALU至少一个为空
                //2.指令1为MU，仅当：MU为空，且指令0不为MU
                //3.指令1为MDU，仅当：MDU为空，且指令0不为MDU
                if((rename_futype0[`FU_ALU] & (alu0_valid | alu1_valid) & ~(rename_valid1 & mask1 & rename_futype1[`FU_ALU])) |
                    (rename_futype0[`FU_MU] & mu_valid) | (rename_futype0[`FU_MDU] & mdu_valid))
                    mask0<=0;
                if((rename_futype1[`FU_ALU] & (alu0_valid | alu1_valid) & ~(rename_valid0 & mask0 & rename_futype0[`FU_ALU])) |
                    (rename_futype1[`FU_MU] & mu_valid & ~(rename_valid0 & mask0 & rename_futype0[`FU_MU])) |
                    (rename_futype1[`FU_MDU] & mdu_valid & ~(rename_valid0 & mask0 & rename_futype0[`FU_MDU])))
                    mask1<=0;
            end
        end
    end

endmodule