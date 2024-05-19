// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    ROB模块
*/

module rob(
    input           clk,
    input           resetn,
    //呈现给外部的状态信号
    output          rob_full,       //ROB是否满了
    output          rob_empty,      //ROB是否为空
    output[$clog2(`ROB_SIZE) - 2:0] rob_head,   //head指针(< size / 2)
    output[$clog2(`ROB_SIZE) - 2:0] rob_tail,   //tail指针
    //来自Commit
    input           flush,
    input           rob_pop,                    //推移head指针
    input           rob_clear0,                 //无论head是否推移，将之前队头0的valid置0
    input           rob_clear1,
    //来自Rename的push指令信息
    //Note：当push使能有效时，仅修改指令相关部分，其余result、excode并不清空，留给FU的输出端处理
    input           rename_push_en,                //rename写使能，注意，必须当指令能流到Dispatch时才可生效一个周期
    input[63:0]     rename_RAS,
    input           rename_valid0,     
    input[31:0]     rename_PC0,
    input[`CNT_FU - 1:0]    rename_futype0,        //仅表示指令类型，无法区分出ALU0/1
    input[`CNT_CTRL - 1:0]  rename_ctrl0,          //杂项控制信号
    input[4:0]      rename_waddr0,                 //指令0的rd
    input[5:0]      rename_cp0addr0,
    input           rename_valid1,     
    input[31:0]     rename_PC1,
    input[`CNT_FU - 1:0]    rename_futype1,        //仅表示指令类型，无法区分出ALU0/1
    input[`CNT_CTRL - 1:0]  rename_ctrl1,          //杂项控制信号
    input[4:0]      rename_waddr1,                 //指令0的rd
    input[5:0]      rename_cp0addr1,
    input rename_nop0,
    input rename_nop1,
    //来自Dispatch的读端口
    //Note：若这个被读的表项现在正在被写，则取正在写入的result
    input[$clog2(`ROB_SIZE) - 1:0]      rob_raddr0,
    input[$clog2(`ROB_SIZE) - 1:0]      rob_raddr1,
    input[$clog2(`ROB_SIZE) - 1:0]      rob_raddr2,
    input[$clog2(`ROB_SIZE) - 1:0]      rob_raddr3,
    output[31:0]    rob_rdata0,
    output[31:0]    rob_rdata1,
    output[31:0]    rob_rdata2,
    output[31:0]    rob_rdata3,     //这几个rdata来自result，需要从4个体里选出正确的那个
    output          rob_ready0,
    output          rob_ready1,
    output          rob_ready2,
    output          rob_ready3,     //这4个ready决定了操作数在保留站里是否ready
    //来自4个FU的写端口（标记为ready，写入result、other、excode）
    input           fu_alu0_wen,    //写使能（注意，这个和写GPR的wen不是一个东西）
    input[31:0]     fu_alu0_wresult,
    input[`WIDTH_other - 1:0]   fu_alu0_wother,
    input[$clog2(`ROB_SIZE) - 1:0]  fu_alu0_wnum,
    input[$clog2(`CNT_EXCEPTION) - 1:0] fu_alu0_excode,
    input           fu_alu1_wen,    //写使能
    input[31:0]     fu_alu1_wresult,
    input[`WIDTH_other - 1:0]   fu_alu1_wother,
    input[$clog2(`ROB_SIZE) - 1:0]  fu_alu1_wnum,
    input[$clog2(`CNT_EXCEPTION) - 1:0] fu_alu1_excode,
    input           fu_mu_wen,    //写使能
    input[31:0]     fu_mu_wresult,
    input[`WIDTH_other - 1:0]   fu_mu_wother,
    input[$clog2(`ROB_SIZE) - 1:0]  fu_mu_wnum,
    input[$clog2(`CNT_EXCEPTION) - 1:0] fu_mu_excode,
    input           fu_mu_tofpu_notlast,

    input           fu_mu_uncached,

    input           fu_mdu_wen,    //写使能
    input[31:0]     fu_mdu_wresult,
    input[31:0]     fu_mdu_wother,
    input[$clog2(`ROB_SIZE) - 1:0]  fu_mdu_wnum,
    //来自MU.MEM的简单写端口（仅标记为ready）
    input           fu_mumid_wen,
    input[$clog2(`ROB_SIZE) - 1:0]  fu_mumid_wnum,
    //来自Commit的队头读端口
    //第0路
    output[63:0]    RAS,                    //指令0和1共用的RAS
    output[31:0]    PC0,
    output          valid0,                 //这个表项是否有效
    output[`CNT_FU - 1:0]    futype0,        //仅表示指令类型，无法区分出ALU0/1
    output[`CNT_CTRL - 1:0]  ctrl0,          //杂项控制信号
    output[4:0]     waddr0,                 //指令0的rd
    output[5:0]     cp0addr0,
    output          alu0_ready0,            //指令0是否被ALU0计算完成
    output          alu1_ready0,            //指令0是否被ALU1计算完成
    output          mu_ready0,              //指令0是否被MU计算完成

    output          mu_uncached0,

    output          mdu_ready0,             //指令0是否被MDU计算完成
    output          mumid_ready0,           //指令0是否直接由MEM计算完成（当其有效时，一定没有异常）           
    output[31:0]    alu0_result0,
    output[31:0]    alu1_result0,
    output[31:0]    mu_result0,
    output[31:0]    mdu_result0,
    output[`WIDTH_other - 1:0]  alu0_result_other0,
    output[`WIDTH_other - 1:0]  alu1_result_other0,
    output[`WIDTH_other - 1:0]  mu_result_other0,
    output[31:0]    mdu_result_other0,
    output[$clog2(`CNT_EXCEPTION) - 1:0] alu0_excode0,   //指令0被ALU0计算出的excode
    output[$clog2(`CNT_EXCEPTION) - 1:0] alu1_excode0,
    output[$clog2(`CNT_EXCEPTION) - 1:0] mu_excode0,
    //第1路
    output[31:0]    PC1,
    output          valid1,                 //这个表项是否有效
    output[`CNT_FU - 1:0]    futype1,        //仅表示指令类型，无法区分出ALU0/1
    output[`CNT_CTRL - 1:0]  ctrl1,          //杂项控制信号
    output[4:0]     waddr1,                 //指令0的rd
    output[5:0]     cp0addr1,
    output          alu0_ready1,            //指令0是否被ALU0计算完成
    output          alu1_ready1,            //指令0是否被ALU1计算完成
    output          mu_ready1,              //指令0是否被MU计算完成

    output          mu_uncached1,

    output          mdu_ready1,             //指令0是否被MDU计算完成
    output          mumid_ready1,           //指令0是否直接由MEM计算完成（当其有效时，一定没有异常）           
    output[31:0]    alu0_result1,
    output[31:0]    alu1_result1,
    output[31:0]    mu_result1,
    output[31:0]    mdu_result1,
    output[`WIDTH_other - 1:0]  alu0_result_other1,
    output[`WIDTH_other - 1:0]  alu1_result_other1,
    output[`WIDTH_other - 1:0]  mu_result_other1,
    output[31:0]    mdu_result_other1,
    output[$clog2(`CNT_EXCEPTION) - 1:0] alu0_excode1,   //指令0被ALU0计算出的excode
    output[$clog2(`CNT_EXCEPTION) - 1:0] alu1_excode1,
    output[$clog2(`CNT_EXCEPTION) - 1:0] mu_excode1
    );

    reg[$clog2(`ROB_SIZE) - 2:0] head,tail;
    wire[$clog2(`ROB_SIZE) - 2:0] nxttail=tail + 5;
    assign rob_full=(head == nxttail);
    assign rob_empty=(head == tail);
    assign rob_head=head;
    assign rob_tail=tail;

    //ROB的存储体
    //基于寄存器的标记位，这个干脆不分体了（反正也没有“体”），0/1路在地址最高位选择
    reg[`ROB_SIZE - 1:0] robtag_valid;
    reg[`ROB_SIZE - 1:0] robtag_alu0_ready;
    reg[`ROB_SIZE - 1:0] robtag_alu1_ready;
    reg[`ROB_SIZE - 1:0] robtag_mu_ready;
    reg[`ROB_SIZE - 1:0] robtag_mumid_ready;
    reg[`ROB_SIZE - 1:0] robtag_mdu_ready;
    reg[`ROB_SIZE - 1:0] robtag_ready;

    //供uncached load使用
    //Commit时需要知道提交的指令里面是否有uncached load
    //store不用管，因为store会等提交后才开始
    //如果存在，那么这对（新坑？）指令不能处理中断！
    reg[`ROB_SIZE - 1:0] robtag_uncached_load;  //跟随mu_ready

    //两路的指令信息
    reg[63:0] robmem_RAS[0:`ROB_SIZE / 2 - 1];  //两路共用
    reg[31:0] robmem_PC0[0:`ROB_SIZE / 2 - 1];
    reg[31:0] robmem_PC1[0:`ROB_SIZE / 2 - 1];
    reg[`CNT_FU - 1:0] robmem_futype0[0:`ROB_SIZE / 2 - 1];
    reg[`CNT_FU - 1:0] robmem_futype1[0:`ROB_SIZE / 2 - 1];
    reg[`CNT_CTRL - 1:0] robmem_ctrl0[0:`ROB_SIZE / 2 - 1];
    reg[`CNT_CTRL - 1:0] robmem_ctrl1[0:`ROB_SIZE / 2 - 1];
    reg[4:0] robmem_waddr0[0:`ROB_SIZE / 2 - 1];
    reg[4:0] robmem_waddr1[0:`ROB_SIZE / 2 - 1];
    reg[5:0] robmem_cp0addr0[0:`ROB_SIZE / 2 - 1];
    reg[5:0] robmem_cp0addr1[0:`ROB_SIZE / 2 - 1];

    genvar i;
    generate
        for(i=0; i < `ROB_SIZE / 2; i=i + 1) begin
            initial begin
                robmem_RAS[i]=0;
                robmem_PC0[i]=0;
                robmem_PC1[i]=0;
                robmem_futype0[i]=0;
                robmem_futype1[i]=0;
                robmem_ctrl0[i]=0;
                robmem_ctrl1[i]=0;
                robmem_waddr0[i]=0;
                robmem_waddr1[i]=0;
                robmem_cp0addr0[i]=0;
                robmem_cp0addr1[i]=0;
            end
        end
    endgenerate

    //FU写回的结果（不分体！反正两个读端口）
    reg[31:0] robmem_alu0_result[0:`ROB_SIZE - 1];
    reg[31:0] robmem_alu1_result[0:`ROB_SIZE - 1];
    reg[31:0] robmem_mu_result[0:`ROB_SIZE - 1];
    reg[31:0] robmem_mdu_result[0:`ROB_SIZE - 1];
    reg[`WIDTH_other - 1:0] robmem_alu0_result_other[0:`ROB_SIZE - 1];
    reg[`WIDTH_other - 1:0] robmem_alu1_result_other[0:`ROB_SIZE - 1];
    reg[`WIDTH_other - 1:0] robmem_mu_result_other[0:`ROB_SIZE - 1];
    reg[31:0] robmem_mdu_result_other[0:`ROB_SIZE - 1];
    reg[$clog2(`CNT_EXCEPTION) - 1:0] robmem_alu0_excode[0:`ROB_SIZE - 1];
    reg[$clog2(`CNT_EXCEPTION) - 1:0] robmem_alu1_excode[0:`ROB_SIZE - 1];
    reg[$clog2(`CNT_EXCEPTION) - 1:0] robmem_mu_excode[0:`ROB_SIZE - 1];

    generate
        for(i=0; i < `ROB_SIZE; i=i + 1) begin
            initial begin
                robmem_alu0_result[i]=0;
                robmem_alu1_result[i]=0;
                robmem_mu_result[i]=0;
                robmem_mdu_result[i]=0;
                robmem_alu0_result_other[i]=0;
                robmem_alu1_result_other[i]=0;
                robmem_mu_result_other[i]=0;
                robmem_mdu_result_other[i]=0;
                robmem_alu0_excode[i]=0;
                robmem_alu1_excode[i]=0;
                robmem_mu_excode[i]=0;
            end
        end
    endgenerate

    assign rob_ready0=robtag_ready[rob_raddr0] | (fu_alu0_wen & (fu_alu0_wnum == rob_raddr0)) |
        (fu_alu1_wen & (fu_alu1_wnum == rob_raddr0)) | (fu_mdu_wen & (fu_mdu_wnum == rob_raddr0)) |
        (fu_mu_wen & (fu_mu_wnum == rob_raddr0));
    assign rob_ready1=robtag_ready[rob_raddr1] | (fu_alu0_wen & (fu_alu0_wnum == rob_raddr1)) |
        (fu_alu1_wen & (fu_alu1_wnum == rob_raddr1)) | (fu_mdu_wen & (fu_mdu_wnum == rob_raddr1)) |
        (fu_mu_wen & (fu_mu_wnum == rob_raddr1));
    assign rob_ready2=robtag_ready[rob_raddr2] | (fu_alu0_wen & (fu_alu0_wnum == rob_raddr2)) |
        (fu_alu1_wen & (fu_alu1_wnum == rob_raddr2)) | (fu_mdu_wen & (fu_mdu_wnum == rob_raddr2)) |
        (fu_mu_wen & (fu_mu_wnum == rob_raddr2));
    assign rob_ready3=robtag_ready[rob_raddr3] | (fu_alu0_wen & (fu_alu0_wnum == rob_raddr3)) |
        (fu_alu1_wen & (fu_alu1_wnum == rob_raddr3)) | (fu_mdu_wen & (fu_mdu_wnum == rob_raddr3)) |
        (fu_mu_wen & (fu_mu_wnum == rob_raddr3));
    
    assign rob_rdata0=robtag_ready[rob_raddr0] ? ((robtag_alu0_ready[rob_raddr0] | robtag_alu1_ready[rob_raddr0]) ? 
        (robtag_alu0_ready[rob_raddr0] ? robmem_alu0_result[rob_raddr0] : robmem_alu1_result[rob_raddr0]) :
        (robtag_mdu_ready[rob_raddr0] ? robmem_mdu_result[rob_raddr0] : robmem_mu_result[rob_raddr0])) :
        (((fu_alu0_wen & (fu_alu0_wnum == rob_raddr0)) | (fu_alu1_wen & (fu_alu1_wnum == rob_raddr0))) ?
            ((fu_alu0_wen & (fu_alu0_wnum == rob_raddr0)) ? fu_alu0_wresult : fu_alu1_wresult) :
            ((fu_mdu_wen & (fu_mdu_wnum == rob_raddr0)) ? fu_mdu_wresult : fu_mu_wresult));
    assign rob_rdata1=robtag_ready[rob_raddr1] ? ((robtag_alu0_ready[rob_raddr1] | robtag_alu1_ready[rob_raddr1]) ? 
        (robtag_alu0_ready[rob_raddr1] ? robmem_alu0_result[rob_raddr1] : robmem_alu1_result[rob_raddr1]) :
        (robtag_mdu_ready[rob_raddr1] ? robmem_mdu_result[rob_raddr1] : robmem_mu_result[rob_raddr1])) :
        (((fu_alu0_wen & (fu_alu0_wnum == rob_raddr1)) | (fu_alu1_wen & (fu_alu1_wnum == rob_raddr1))) ?
            ((fu_alu0_wen & (fu_alu0_wnum == rob_raddr1)) ? fu_alu0_wresult : fu_alu1_wresult) :
            ((fu_mdu_wen & (fu_mdu_wnum == rob_raddr1)) ? fu_mdu_wresult : fu_mu_wresult));
    assign rob_rdata2=robtag_ready[rob_raddr2] ? ((robtag_alu0_ready[rob_raddr2] | robtag_alu1_ready[rob_raddr2]) ? 
        (robtag_alu0_ready[rob_raddr2] ? robmem_alu0_result[rob_raddr2] : robmem_alu1_result[rob_raddr2]) :
        (robtag_mdu_ready[rob_raddr2] ? robmem_mdu_result[rob_raddr2] : robmem_mu_result[rob_raddr2])) :
        (((fu_alu0_wen & (fu_alu0_wnum == rob_raddr2)) | (fu_alu1_wen & (fu_alu1_wnum == rob_raddr2))) ?
            ((fu_alu0_wen & (fu_alu0_wnum == rob_raddr2)) ? fu_alu0_wresult : fu_alu1_wresult) :
            ((fu_mdu_wen & (fu_mdu_wnum == rob_raddr2)) ? fu_mdu_wresult : fu_mu_wresult));
    assign rob_rdata3=robtag_ready[rob_raddr3] ? ((robtag_alu0_ready[rob_raddr3] | robtag_alu1_ready[rob_raddr3]) ? 
        (robtag_alu0_ready[rob_raddr3] ? robmem_alu0_result[rob_raddr3] : robmem_alu1_result[rob_raddr3]) :
        (robtag_mdu_ready[rob_raddr3] ? robmem_mdu_result[rob_raddr3] : robmem_mu_result[rob_raddr3])) :
        (((fu_alu0_wen & (fu_alu0_wnum == rob_raddr3)) | (fu_alu1_wen & (fu_alu1_wnum == rob_raddr3))) ?
            ((fu_alu0_wen & (fu_alu0_wnum == rob_raddr3)) ? fu_alu0_wresult : fu_alu1_wresult) :
            ((fu_mdu_wen & (fu_mdu_wnum == rob_raddr3)) ? fu_mdu_wresult : fu_mu_wresult));
    
    //呈现队头
    assign RAS=robmem_RAS[head];
    assign PC0=robmem_PC0[head];
    assign PC1=robmem_PC1[head];
    assign valid0=robtag_valid[{1'b0,head}] & ~rob_empty;
    assign valid1=robtag_valid[{1'b1,head}] & ~rob_empty;
    assign futype0=robmem_futype0[head];
    assign futype1=robmem_futype1[head];
    assign ctrl0=robmem_ctrl0[head];
    assign ctrl1=robmem_ctrl1[head];
    assign waddr0=robmem_waddr0[head];
    assign waddr1=robmem_waddr1[head];
    assign cp0addr0=robmem_cp0addr0[head];
    assign cp0addr1=robmem_cp0addr1[head];
    assign alu0_ready0=robtag_alu0_ready[{1'b0,head}];
    assign alu0_ready1=robtag_alu0_ready[{1'b1,head}];
    assign alu1_ready0=robtag_alu1_ready[{1'b0,head}];
    assign alu1_ready1=robtag_alu1_ready[{1'b1,head}];
    assign mu_ready0=robtag_mu_ready[{1'b0,head}];
    assign mu_ready1=robtag_mu_ready[{1'b1,head}];
    assign mu_uncached0=robtag_uncached_load[{1'b0,head}];
    assign mu_uncached1=robtag_uncached_load[{1'b1,head}];
    assign mdu_ready0=robtag_mdu_ready[{1'b0,head}];
    assign mdu_ready1=robtag_mdu_ready[{1'b1,head}];
    assign mumid_ready0=robtag_mumid_ready[{1'b0,head}];
    assign mumid_ready1=robtag_mumid_ready[{1'b1,head}];
    assign alu0_result0=robmem_alu0_result[{1'b0,head}];
    assign alu0_result1=robmem_alu0_result[{1'b1,head}];
    assign alu1_result0=robmem_alu1_result[{1'b0,head}];
    assign alu1_result1=robmem_alu1_result[{1'b1,head}];
    assign mu_result0=robmem_mu_result[{1'b0,head}];
    assign mu_result1=robmem_mu_result[{1'b1,head}];
    assign mdu_result0=robmem_mdu_result[{1'b0,head}];
    assign mdu_result1=robmem_mdu_result[{1'b1,head}];
    assign alu0_result_other0=robmem_alu0_result_other[{1'b0,head}];
    assign alu0_result_other1=robmem_alu0_result_other[{1'b1,head}];
    assign alu1_result_other0=robmem_alu1_result_other[{1'b0,head}];
    assign alu1_result_other1=robmem_alu1_result_other[{1'b1,head}];
    assign mu_result_other0=robmem_mu_result_other[{1'b0,head}];
    assign mu_result_other1=robmem_mu_result_other[{1'b1,head}];
    assign mdu_result_other0=robmem_mdu_result_other[{1'b0,head}];
    assign mdu_result_other1=robmem_mdu_result_other[{1'b1,head}];
    assign alu0_excode0=robmem_alu0_excode[{1'b0,head}];
    assign alu0_excode1=robmem_alu0_excode[{1'b1,head}];
    assign alu1_excode0=robmem_alu1_excode[{1'b0,head}];
    assign alu1_excode1=robmem_alu1_excode[{1'b1,head}];
    assign mu_excode0=robmem_mu_excode[{1'b0,head}];
    assign mu_excode1=robmem_mu_excode[{1'b1,head}];
    
    always@(posedge clk) begin
        if(~resetn) begin
            head<=0;
            tail<=0;
        end
        else begin
            //维护DRAM写端口
            if(rename_push_en) begin
                robmem_RAS[tail]<=rename_RAS;
                robmem_PC0[tail]<=rename_PC0;
                robmem_PC1[tail]<=rename_PC1;
                robmem_futype0[tail]<=rename_futype0;
                robmem_futype1[tail]<=rename_futype1;
                robmem_ctrl0[tail]<=rename_ctrl0;
                robmem_ctrl1[tail]<=rename_ctrl1;
                robmem_waddr0[tail]<=rename_waddr0;
                robmem_waddr1[tail]<=rename_waddr1;
                robmem_cp0addr0[tail]<=rename_cp0addr0;
                robmem_cp0addr1[tail]<=rename_cp0addr1;
            end
            if(fu_alu0_wen) begin
                robmem_alu0_result[fu_alu0_wnum]<=fu_alu0_wresult;
                robmem_alu0_result_other[fu_alu0_wnum]<=fu_alu0_wother;
                robmem_alu0_excode[fu_alu0_wnum]<=fu_alu0_excode;
            end
            if(fu_alu1_wen) begin
                robmem_alu1_result[fu_alu1_wnum]<=fu_alu1_wresult;
                robmem_alu1_result_other[fu_alu1_wnum]<=fu_alu1_wother;
                robmem_alu1_excode[fu_alu1_wnum]<=fu_alu1_excode;         
            end
            if(fu_mu_wen) begin
                robmem_mu_result[fu_mu_wnum]<=fu_mu_wresult;
                robmem_mu_result_other[fu_mu_wnum]<=fu_mu_wother;
                robmem_mu_excode[fu_mu_wnum]<=fu_mu_excode;
            end
            if(fu_mdu_wen) begin
                robmem_mdu_result[fu_mdu_wnum]<=fu_mdu_wresult;
                robmem_mdu_result_other[fu_mdu_wnum]<=fu_mdu_wother;
            end
            if(flush | rename_push_en)
                tail<=flush ? 0 : (tail + 1);
            if(flush | rob_pop)
                head<=flush ? 0 : (head + 1);
        end
    end

    generate
        for(i=0; i < `ROB_SIZE; i=i + 1) begin
            //维护标记位
            always@(posedge clk) begin
                if(~resetn) begin
                    robtag_valid[i]<=0;
                    robtag_ready[i]<=0;
                    robtag_alu0_ready[i]<=0;
                    robtag_alu1_ready[i]<=0;
                    robtag_mdu_ready[i]<=0;
                    robtag_mu_ready[i]<=0;
                    robtag_mumid_ready[i]<=0;

                    robtag_uncached_load[i]<=0;
                end
                else begin
                    if(flush | (rename_push_en & (tail == (i & ((`ROB_SIZE / 2) - 1)))) | 
                        (rob_clear0 & ({1'b0,head} == i)) | (rob_clear1 & ({1'b1,head} == i)))
                        robtag_valid[i]<=(rename_push_en & (tail == (i & ((`ROB_SIZE / 2) - 1)))) & ((i >= `ROB_SIZE / 2) ? rename_valid1 : rename_valid0) & ~flush;
                    if(flush | (rename_push_en & (tail == (i & ((`ROB_SIZE / 2) - 1)))) |
                        (fu_alu0_wen & (fu_alu0_wnum == i)))
                        robtag_alu0_ready[i]<=(fu_alu0_wen & (fu_alu0_wnum == i)) & ~flush;
                    if(flush | (rename_push_en & (tail == (i & ((`ROB_SIZE / 2) - 1)))) |
                        (fu_alu1_wen & (fu_alu1_wnum == i)))
                        robtag_alu1_ready[i]<=(fu_alu1_wen & (fu_alu1_wnum == i)) & ~flush;
                    
                    if(flush | (rename_push_en & (tail == (i & ((`ROB_SIZE / 2) - 1)))) |
                        (fu_mu_wen & (~fu_mu_tofpu_notlast) & (fu_mu_wnum == i))) begin
                        robtag_mu_ready[i]<=(fu_mu_wen & (~fu_mu_tofpu_notlast) & (fu_mu_wnum == i)) & ~flush;
                        robtag_uncached_load[i]<=(fu_mu_wen & (~fu_mu_tofpu_notlast) & (fu_mu_wnum == i) & fu_mu_uncached) & ~flush;
                    end
                    
                    if(flush | (rename_push_en & (tail == (i & ((`ROB_SIZE / 2) - 1)))) |
                        (fu_mdu_wen & (fu_mdu_wnum == i)))
                        robtag_mdu_ready[i]<=(fu_mdu_wen & (fu_mdu_wnum == i)) & ~flush;
                    
                    if(flush | (rename_push_en & (tail == (i & ((`ROB_SIZE / 2) - 1)))) |
                        (fu_mumid_wen & (fu_mumid_wnum == i)))
                        robtag_mumid_ready[i]<=((fu_mumid_wen & (fu_mumid_wnum == i)) | ((rename_push_en & (tail == (i & ((`ROB_SIZE / 2) - 1)))) & ((i >= `ROB_SIZE / 2) ? rename_nop1 : rename_nop0))) & ~flush;
                    
                    if(flush | (rename_push_en & (tail == (i & ((`ROB_SIZE / 2) - 1)))) |
                        (fu_alu0_wen & (fu_alu0_wnum == i)) | (fu_alu1_wen & (fu_alu1_wnum == i)) | 
                        (fu_mu_wen & (~fu_mu_tofpu_notlast) & (fu_mu_wnum == i)) | (fu_mdu_wen & (fu_mdu_wnum == i)) | (fu_mumid_wen & (fu_mumid_wnum == i)))
                        robtag_ready[i]<=~(flush | (rename_push_en & (tail == (i & ((`ROB_SIZE / 2) - 1)))));  
                end
            end
        end
    endgenerate

endmodule