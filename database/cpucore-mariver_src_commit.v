// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    Commit模块
*/

module commit(
    input           clk,
    input           resetn,
    //ROB的head指针，用于得出指令destnum
    input[$clog2(`ROB_SIZE) - 2:0]  rob_head,
    input           rob_empty,              //ROB是否为空
    //来自ROB读端口的输入0-----------------------------------------------------
    input[63:0]     RAS,                    //指令0和1共用的RAS
    input[31:0]     PC0,
    input           valid0,                 //这个表项是否有效
    input[`CNT_FU - 1:0]    futype0,        //仅表示指令类型，无法区分出ALU0/1
    input[`CNT_CTRL - 1:0]  ctrl0,          //杂项控制信号
    input[4:0]      waddr0,                 //指令0的rd
    input[5:0]      cp0addr0,               //指令0里的cp0地址
    //以上输入皆仅与指令0本身有关，与FU的结果无关
    input           alu0_ready0,            //指令0是否被ALU0计算完成
    input           alu1_ready0,            //指令0是否被ALU1计算完成
    input           mu_ready0,              //指令0是否被MU计算完成

    input           mu_uncached0,

    input           mdu_ready0,             //指令0是否被MDU计算完成
    input           mumid_ready0,           //指令0是否直接由MEM计算完成（当其有效时，一定没有异常）           
    //注意，这5个done是独立的，只要其中一个有效，说明这个指令done，同时也能从4个体中选出结果
    input[31:0]     alu0_result0,
    input[31:0]     alu1_result0,
    input[31:0]     mu_result0,
    input[31:0]     mdu_result0,
    input[`WIDTH_other - 1:0]   alu0_result_other0,
    input[`WIDTH_other - 1:0]   alu1_result_other0,
    input[`WIDTH_other - 1:0]   mu_result_other0,
    input[31:0]     mdu_result_other0,
    input[$clog2(`CNT_EXCEPTION) - 1:0] alu0_excode0,   //指令0被ALU0计算出的excode
    input[$clog2(`CNT_EXCEPTION) - 1:0] alu1_excode0,
    input[$clog2(`CNT_EXCEPTION) - 1:0] mu_excode0,

    //来自ROB读端口的输入1-----------------------------------------------------
    input[31:0]     PC1,
    input           valid1,                 //这个表项是否有效（当empty时，输入0）
    input[`CNT_FU - 1:0]    futype1,        //仅表示指令类型，无法区分出ALU0/1
    input[`CNT_CTRL - 1:0]  ctrl1,          //杂项控制信号
    input[4:0]      waddr1,
    input[5:0]      cp0addr1,
    //input[$clog2(`CNT_EXCEPTION) - 1:0] inst_excode1,   //指令1在译码前检测出的异常，只要非0就可以算done
    //Note：我们还是不要设置“指令本身的excode”这种东西了，如果在Decode就发生异常，那么无论如何就把这条指令扔给ALU，并且声明为不需要操作数，在Commit看ALU的异常即可
    //以上输入皆仅与指令1本身有关，与FU的结果无关
    input           alu0_ready1,            //指令1是否被ALU0计算完成
    input           alu1_ready1,            //指令1是否被ALU1计算完成
    input           mu_ready1,              //指令1是否被MU计算完成

    input           mu_uncached1,

    input           mdu_ready1,             //指令1是否被MDU计算完成
    input           mumid_ready1,           //指令1是否直接由MEM计算完成（当其有效时，一定没有异常）           
    //注意，这5个ready是独立的，只要其中一个有效，说明这个指令ready，同时也能从4个体中选出结果
    input[31:0]     alu0_result1,
    input[31:0]     alu1_result1,
    input[31:0]     mu_result1,
    input[31:0]     mdu_result1,
    input[`WIDTH_other - 1:0]   alu0_result_other1,
    input[`WIDTH_other - 1:0]   alu1_result_other1,
    input[`WIDTH_other - 1:0]   mu_result_other1,
    input[31:0]     mdu_result_other1,
    input[$clog2(`CNT_EXCEPTION) - 1:0] alu0_excode1,   //指令1被ALU0计算出的excode
    input[$clog2(`CNT_EXCEPTION) - 1:0] alu1_excode1,
    input[$clog2(`CNT_EXCEPTION) - 1:0] mu_excode1,

    //来自FPU rob
    input           fpu_ready0,
    input           fpu_ready1,
    input[63:0]     fpu_result0,
    input[63:0]     fpu_result1,
    input[3:0]      fpu_waddr0,
    input[3:0]      fpu_waddr1,
    input[4:0]      fpu_wprf0_0,
    input[4:0]      fpu_wprf1_0,    //这都是第0路
    input[4:0]      fpu_wprf0_1,
    input[4:0]      fpu_wprf1_1,
    input[$clog2(`CNT_EXCEPTION) - 1:0] fpu_excode0,
    input[$clog2(`CNT_EXCEPTION) - 1:0] fpu_excode1,
    input[`FPU_GLOBAL_CNT - 1:0]        fpu_gctrl0,
    input[`FPU_GLOBAL_CNT - 1:0]        fpu_gctrl1,
    input[`FPECNT - 1:0]    fpu_fpeword0,
    input[`FPECNT - 1:0]    fpu_fpeword1,

    //来自L2 TLB交互信号
    input           l2_tlb_qry_done,
    input           l2_tlb_qry_isexist,

    //preCommit向ROB发出的反馈信号
    output          rob_pop,                //推移head指针
    output          rob_clear0,             //无论head是否推移，将之前队头0的valid置0，将done置1
    output          rob_clear1,

    //Commit后段真正生效的输出
    output reg      commit_en0,             //第0路Commit使能
    output reg      commit_en1,             //第1路Commit使能
    output reg[$clog2(`ROB_SIZE) - 1:0] commit_num0,    //第0路Commit的ROB编号
    output reg[$clog2(`ROB_SIZE) - 1:0] commit_num1,    //第1路Commit的ROB编号
    output reg[31:0]    commit_PC0,             //仅用于debug？
    output reg[31:0]    commit_PC1,
    output reg      flush,                  //清空流水线（注意，这并不影响其它生效信号的有效性，因为这条指令可能是正常的延迟槽指令），这个信号可以考虑冗余？
    output reg[31:0]    flush_target,           //修改PC
    //连接到ARF写端口以及GPR状态表释放端口以及debug接口
    output reg      arf_wen0,
    output reg[4:0] arf_waddr0,
    output reg[$clog2(`ROB_SIZE) - 1:0]     arf_wnum0,     //ROB编号，顺便给GPR状态表使用，用于释放
    output reg[31:0]    arf_wdata0,
    output reg      arf_wen1,
    output reg[4:0] arf_waddr1,
    output reg[$clog2(`ROB_SIZE) - 1:0]     arf_wnum1,
    output reg[31:0]    arf_wdata1,
    //写Hi/Lo
    output reg[31:0]    Hi_wdata,
    output reg      Hi_wen,
    output reg[31:0]    Lo_wdata,
    output reg      Lo_wen,
    //维护分支预测器
    output reg      predictor_wr_en,                    //写使能
    output reg[31:0]    predictor_wr_PC,                    //分支指令地址
    output reg[31:0]    predictor_wr_target,                //分支指令若真的成功跳转的目标（无论是不是真的跳转）
    output reg      predictor_wr_isret,                 //是否为ret指令
    output reg      predictor_wr_isjump,                //是否真的跳转
    output reg      predictor_RAS_flush,                //清空RAS（当ret的目标错误时），优先级最高
    output reg      predictor_RAS_reset_en,             //来自Commit的重置RAS，优先级次之
    output reg[63:0]    predictor_RAS_reset_data,           //来自Commit的重置RAS
    
    //FPU提交
    output reg      fpr_wen0,                   //提交奇FPR
    output reg      fpr_wen1,                   //提交偶FPR
    output reg[3:0] fpr_waddr,
    output reg[4:0] fpr_wprf0,
    output reg[4:0] fpr_wprf1,
    output reg      cp1_wen,
    output reg[4:0] cp1_waddr,
    output reg[31:0]cp1_wdata,
    output reg      updfcc_en,
    output reg[2:0] updfcc_addr,
    output reg      updfcc_cc,
    output reg      updfpe_en,
    output reg[`FPECNT - 1:0]   updfpe_fpeword,
    output reg      updfpe_exception,       //是否真的引发异常，用于修改Cause
    //仅debug时使用
    output reg[63:0]    fpr_wdata,
    
    //CP0相关
    output reg      cp0_wen,                //仅供mtc0使用
    output reg[5:0] cp0_waddr,
    output reg[31:0]    cp0_wdata,
    output reg[$clog2(`CNT_EXCEPTION) - 1:0]    excode, //最终的异常码，CP0寄存器组利用这个自我修改
    output reg[31:0]    exce_PC,                //引起异常的指令地址
    output reg      exce_isslot,            //异常指令是否在延迟槽中
    output reg[31:0]    exce_vaddr,             //可能引起异常的vaddr
    output reg      eret_en,
    input[31:0]     eretaddr,
    //TLB控制（也会修改CP0）
    output reg      tlb_wr_en,              //TLBWI/TLBWR引起的TLB写使能
    output reg      tlb_wr_useindex,        //写TLB是否使用CP0.index（否则random）
    output reg      tlbp_en,                //与TLB模块无关，告诉CP0用TLB模块原先计算出的基于EntryHi的index更新index，用于TLBP
    output reg      tlbr_en,                //与TLB模块无关，告诉CP0用TLB模块原先计算出的基于index的Entry更新，用于TLBR
    output reg      l2_tlb_qry_en,          //L2 TLB的启动查询使能，只可持续1 cycle
    output          l1_itlb_ld_en,          //当查询结束后给L1 i-TLB的载入信号（如果有的话）
    output          l1_dtlb_ld_en,
    //i-Cache控制
    output reg      icache_clear_en,        //icache维护信号，只要其有效，保证flush信号一定有效至少1拍
    output reg[31:0]    icache_addr,            //icache维护地址，【应该是paddr】
    output reg      icache_index,           //icache是否为index
    //ll/eret维护llbit
    output reg      llbit_wen,
    output reg      llbit_newval,
    //真正的软硬中断（由CP0寄存器组处理而来）
    input[7:0]      ext_int,
    input           exception_en,           //来自CP0，实际上是EXL（为了生成正确的中断地址）
    input[17:0]     CP0_EBase,              //来自CP0
    input           CP0_Status_BEV,         //来自CP0
    input           CP0_Cause_IV            //来自CP0
    );


    //wait的使能信号，锁住commit后端的flush
    reg wait_en;


    reg commit_lock;    //在查询L2 TLB期间锁存commit后端
    reg[$clog2(`CNT_EXCEPTION) - 1:0] tlb_miss_excode;
    reg[31:0] tlb_miss_target;
    reg tlb_miss_isdata;
    reg tlb_miss_istlbp;
    reg tlb_miss_lockslot;

    //Note: 一条【valid的】指令引发flush，当且仅当：
    //1.ctrl里表明了mustflush（它肯定要生效）
    //2.有效的excode不为0且允许异常
    //3.此时检测到ext_int（似乎还跟转移指令有关？先不要管）且允许异常。这个时候我们暂且一条指令都不发射？
    //4.这条指令是延迟槽指令且上一条转移指令失败（除非这条指令引发异常，否则它应该要生效）
    //注意：当指令0引发flush时，指令1不可流出

    //用于preCommit的转移指令标记，仅表示最后一条【发射到Commit后段】的指令
    //只要有指令发射到后面，就必须修改
    reg lasttag_isbranch;   //是否为转移指令（判断当前指令是否为延迟槽）
    reg lasttag_predfail;   //是否转移失败，若不为转移指令则直接置0
    reg[31:0] lasttag_target;   //表示真正的转移地址（若不转移则为PC+4）

    //Note: 若MU发生异常，就不用管FPU了
    wire cpu_ready0=alu0_ready0 | alu1_ready0 | mu_ready0 | mumid_ready0 | mdu_ready0;
    wire cpu_ready1=alu0_ready1 | alu1_ready1 | mu_ready1 | mumid_ready1 | mdu_ready1;
    wire ready0=(cpu_ready0 | ctrl0[`CTRL_nocpu]) & (fpu_ready0 | ~ctrl0[`CTRL_fpu]);
    wire ready1=(cpu_ready1 | ctrl1[`CTRL_nocpu]) & (fpu_ready1 | ~ctrl1[`CTRL_fpu]);


    wire can0=valid0 & ready0;  //是否可以处理指令0
    wire can1=(ready0 | ~valid0) & valid1 & ready1 & ~(valid0 & ctrl0[`CTRL_fpu] & ctrl1[`CTRL_fpu]);     //是否可以处理指令1（两个FPU指令不可同时提交）
    //在写回GPR时注意sc
    wire[31:0] result0=futype0[`FU_ALU] ? (alu0_ready0 ? alu0_result0 : alu1_result0) : (futype0[`FU_MU] ? (mumid_ready0 ? 32'd1 : mu_result0) : mdu_result0);
    wire[31:0] result1=futype1[`FU_ALU] ? (alu0_ready1 ? alu0_result1 : alu1_result1) : (futype1[`FU_MU] ? (mumid_ready1 ? 32'd1 : mu_result1) : mdu_result1);
    
    //对于excode，优先检查CPU部分的，如果CPU部分没出问题就检查FPU部分
    //因为双重指令一旦出问题，一定是访存指令的CPU部分
    wire[$clog2(`CNT_EXCEPTION) - 1:0] excode0=(alu0_ready0 | alu1_ready0) ? (alu0_ready0 ? alu0_excode0 : alu1_excode0) : ((mu_ready0 & (|mu_excode0)) ? mu_excode0 : (fpu_ready0 ? fpu_excode0 : 0));
    wire[$clog2(`CNT_EXCEPTION) - 1:0] excode1=(alu0_ready1 | alu1_ready1) ? (alu0_ready1 ? alu0_excode1 : alu1_excode1) : ((mu_ready1 & (|mu_excode1)) ? mu_excode1 : (fpu_ready1 ? fpu_excode1 : 0));
    
    //两条指令是否为可以在这周期提交的有效的uncached load
    wire uncached0=valid0 & mu_ready0 & mu_uncached0;
    wire uncached1=(ready0 | ~valid0) & valid1 & mu_ready1 & mu_uncached1;

    wire[7:0] real_ext_int=(uncached0 | uncached1) ? 0 : ext_int;

    //处理转移指令，可能是CPU的也可能是FPU的
    wire[`WIDTH_other - 1:0] aluother0=fpu_ready0 ? fpu_result0[`WIDTH_other - 1:0] : (alu0_ready0 ? alu0_result_other0 : alu1_result_other0);
    wire[`WIDTH_other - 1:0] aluother1=fpu_ready1 ? fpu_result1[`WIDTH_other - 1:0] : (alu0_ready1 ? alu0_result_other1 : alu1_result_other1);
    wire isbranch0=fpu_ready0 ? fpu_gctrl0[`FPU_G_JUMP] : (ctrl0[`CTRL_is_branch] | (ctrl0[`CTRL_likely] & aluother0[32]));
    wire isbranch1=fpu_ready1 ? fpu_gctrl1[`FPU_G_JUMP] : (ctrl1[`CTRL_is_branch] | (ctrl1[`CTRL_likely] & aluother1[32]));
    
    //flush判断逻辑
    wire flush0=can0 & (lasttag_predfail | (|excode0) | ctrl0[`CTRL_mustflush] | (ctrl0[`CTRL_likely] & ~aluother0[32]) | ((ctrl0[`CTRL_movn] | ctrl0[`CTRL_movz]) & ~aluother0[32]));
    wire fail0=can0 & isbranch0 & aluother0[33];
    wire flush1=can1 & ((lasttag_predfail & ~valid0) | fail0 | (|excode1) | ctrl1[`CTRL_mustflush] | (ctrl1[`CTRL_likely] & ~aluother1[32]) | ((ctrl1[`CTRL_movn] | ctrl1[`CTRL_movz]) & ~aluother1[32]));
    wire fail1=can1 & (~flush0) & isbranch1 & aluother1[33];

    //指令生效判断逻辑
    wire inst0_valid_en=can0 & ~(((|excode0) | (|real_ext_int)));
    wire inst1_valid_en=can1 & (~flush0) & ~(((|excode1) | (|real_ext_int)));

    //flush target生成逻辑
    wire[31:0] vectorbase=CP0_Status_BEV ? 32'hbfc00200 : {2'b10,CP0_EBase,12'b0};
    wire[31:0] vectoroffset_intr=CP0_Cause_IV ? 32'h200 : 32'h180;
    wire[31:0] vectoroffset0=(((excode0 == `E_read_tlb_miss) | (excode0 == `E_store_tlb_miss)) & ~exception_en) ? 0 : 32'h180;
    wire[31:0] vectoroffset1=(((excode1 == `E_read_tlb_miss) | (excode1 == `E_store_tlb_miss)) & ~exception_en) ? 0 : 32'h180;
    wire[31:0] exce_target0={vectorbase[31:30],vectorbase[29:0] + ((|real_ext_int) ? vectoroffset_intr[29:0] : vectoroffset0[29:0])};
    wire[31:0] exce_target1={vectorbase[31:30],vectorbase[29:0] + vectoroffset1[29:0]};
    
    //对于likely指令，在失败时强制flush，成功时视作普通分支并强制预测失败，若成功则跳到target，若失败则跳到PC+8
    wire[31:0] mustftgt0=ctrl0[`CTRL_likely] ? (PC0 + 8) : (PC0 + 4);
    wire[31:0] mustftgt1=ctrl1[`CTRL_likely] ? (PC1 + 8) : (PC1 + 4);
    
    //target有如下来源：exce_target0/1，eretaddr，lasttag_target，指令0的target，PC0+4，PC1+4
    wire[31:0] target=(((|real_ext_int) | (valid0 & |excode0))) ? exce_target0 :
        ((can1 & (~flush0) & |excode1) ? exce_target1 :
            (((can0 & ctrl0[`CTRL_eret]) | (can1 & (~flush0) & ctrl1[`CTRL_eret])) ? eretaddr :
                ((can0 & (lasttag_predfail | ctrl0[`CTRL_mustflush] | (ctrl0[`CTRL_likely] & ~aluother0[32]))) ? (lasttag_isbranch ? lasttag_target : mustftgt0) :
                    (valid0 ? ((isbranch0 & aluother0[32]) ? aluother0[31:0] : mustftgt1) : 
                        (lasttag_isbranch ? lasttag_target : mustftgt1)))));

    wire[$clog2(`BTB_SIZE) - 1:0] errindex=(valid0 & ctrl0[`CTRL_prederr]) ? PC0[$clog2(`BTB_SIZE) + 2:3] : PC1[$clog2(`BTB_SIZE) + 2:3];

    wire tlbp=(inst0_valid_en & ctrl0[`CTRL_tlbp]) | (inst1_valid_en & ctrl1[`CTRL_tlbp]);
    wire[$clog2(`CNT_EXCEPTION) - 1:0] real_excode=((can0 & |excode0) ? excode0 : ((can1 & (~flush0) & |excode1) ? excode1 : `E_noexception));
    wire real_intr=((|real_ext_int) & (can0 | can1));

    always@(posedge clk) begin
        if(~resetn) begin
            commit_en0<=0;
            commit_en1<=0;
            commit_num0<=0;
            commit_num1<=0;
            commit_PC0<=0;
            commit_PC1<=0;
            flush_target<=0;
            arf_wen0<=0;
            arf_waddr0<=0;
            arf_wdata0<=0;
            arf_wen1<=0;
            arf_waddr1<=0;
            arf_wdata1<=0;
            arf_wnum0<=0;
            arf_wnum1<=0;
            Hi_wen<=0;
            Hi_wdata<=0;
            Lo_wen<=0;
            Lo_wdata<=0;
            predictor_wr_en<=0;
            predictor_wr_PC<=0;
            predictor_wr_target<=0;
            predictor_wr_isret<=0;
            predictor_wr_isjump<=0;
            predictor_RAS_flush<=0;
            predictor_RAS_reset_en<=0;
            predictor_RAS_reset_data<=0;
            cp0_wen<=0;
            cp0_waddr<=0;
            cp0_wdata<=0;
            excode<=0;
            exce_PC<=0;
            exce_isslot<=0;
            exce_vaddr<=0;
            eret_en<=0;
            tlb_wr_en<=0;
            tlb_wr_useindex<=0;
            tlbp_en<=0;
            tlbr_en<=0;
            icache_clear_en<=0;
            icache_addr<=0;
            icache_index<=0;
            llbit_wen<=0;
            llbit_newval<=0;

            fpr_wen0<=0;
            fpr_wen1<=0;
            fpr_waddr<=0;
            fpr_wprf0<=0;
            fpr_wprf1<=0;
            fpr_wdata<=0;
            cp1_wen<=0;
            cp1_waddr<=0;
            cp1_wdata<=0;
            updfcc_en<=0;
            updfcc_addr<=0;
            updfcc_cc<=0;
            updfpe_en<=0;
            updfpe_fpeword<=0;
            updfpe_exception<=0;
        end
        else begin
            if(flush) begin
                commit_en0<=0;
                commit_en1<=0;
                arf_wen0<=0;
                arf_wen1<=0;
                Hi_wen<=0;
                Lo_wen<=0;
                predictor_wr_en<=0;
                predictor_RAS_flush<=0;
                predictor_RAS_reset_en<=0;
                cp0_wen<=0;
                //excode<=0;
                eret_en<=0;
                tlb_wr_en<=0;
                //tlbp_en<=0;
                tlbr_en<=0;
                icache_clear_en<=0;
                llbit_wen<=0;
                excode<=(l2_tlb_qry_done & ~l2_tlb_qry_isexist) ? tlb_miss_excode : `E_noexception;
                if(l2_tlb_qry_done & (~tlb_miss_istlbp) & l2_tlb_qry_isexist)
                    flush_target<=(lasttag_isbranch | exce_isslot) ? (exce_PC - 4) : exce_PC;

                fpr_wen0<=0;
                fpr_wen1<=0;
                cp1_wen<=0;
                updfcc_en<=0;
                updfpe_en<=0;
            end
            else if(~commit_lock) begin
                commit_en0<=inst0_valid_en;
                commit_en1<=inst1_valid_en;
                commit_num0<={1'b0,rob_head};
                commit_num1<={1'b1,rob_head};
                arf_wnum0<={1'b0,rob_head};
                arf_wnum1<={1'b1,rob_head};
                commit_PC0<=PC0;
                commit_PC1<=PC1;
                flush_target<=target;
                arf_wen0<=inst0_valid_en & ctrl0[`CTRL_wen] & ~((ctrl0[`CTRL_movn] | ctrl0[`CTRL_movz]) & ~(alu0_ready0 ? alu0_result_other0[32] : alu1_result_other0[32]));
                arf_waddr0<=waddr0;
                arf_wdata0<=result0;
                arf_wen1<=inst1_valid_en & ctrl1[`CTRL_wen] & ~((ctrl1[`CTRL_movn] | ctrl1[`CTRL_movz]) & ~(alu0_ready1 ? alu0_result_other1[32] : alu1_result_other1[32]));
                arf_waddr1<=waddr1;
                arf_wdata1<=result1;
                Hi_wen<=(inst0_valid_en & ctrl0[`CTRL_wrHi]) | (inst1_valid_en & ctrl1[`CTRL_wrHi]);
                Hi_wdata<=(inst1_valid_en & ctrl1[`CTRL_wrHi]) ? mdu_result_other1 : mdu_result_other0;
                Lo_wen<=(inst0_valid_en & ctrl0[`CTRL_wrLo]) | (inst1_valid_en & ctrl1[`CTRL_wrLo]);
                Lo_wdata<=(inst1_valid_en & ctrl1[`CTRL_wrLo]) ? mdu_result1 : mdu_result0;
                //增加对FPU转移指令的提交
                predictor_wr_en<=(inst0_valid_en & (isbranch0 | ctrl0[`CTRL_prederr])) | (inst1_valid_en & (isbranch1 | ctrl1[`CTRL_prederr]));
                predictor_wr_PC<=(valid0 & isbranch0) ? PC0 : ((inst1_valid_en & isbranch1) ? PC1 : {{(32 - $clog2(`BTB_SIZE) - 3){1'b1}},errindex,3'b111});
                predictor_wr_target<=(valid0 & isbranch0) ? aluother0[31:0] : aluother1[31:0];
                predictor_wr_isret<=(valid0 & ctrl0[`CTRL_is_ret]) | (valid1 & ctrl1[`CTRL_is_ret]);
                predictor_wr_isjump<=(valid0 & isbranch0) ? aluother0[32] : aluother1[32];
                
                predictor_RAS_flush<=
                    (inst0_valid_en & ctrl0[`CTRL_is_branch] & (alu0_ready0 ? alu0_result_other0[34] : alu1_result_other0[34])) |
                    (inst1_valid_en & ctrl1[`CTRL_is_branch] & (alu0_ready1 ? alu0_result_other1[34] : alu1_result_other1[34]));
                predictor_RAS_reset_en<=flush0 | flush1;
                predictor_RAS_reset_data<=RAS;
                cp0_wen<=(inst0_valid_en & ctrl0[`CTRL_mtc0]) | (inst1_valid_en & ctrl1[`CTRL_mtc0]);
                cp0_waddr<=(valid0 & ctrl0[`CTRL_mtc0]) ? cp0addr0 : cp0addr1;
                cp0_wdata<=(valid0 & ctrl0[`CTRL_mtc0]) ? (alu0_ready0 ? alu0_result0 : alu1_result0) : (alu0_ready1 ? alu0_result1 : alu1_result1);
                
                cp1_wen<=(inst0_valid_en & ctrl0[`CTRL_ctc1]) | (inst1_valid_en & ctrl1[`CTRL_ctc1]);
                cp1_waddr<=(valid0 & ctrl0[`CTRL_ctc1]) ? cp0addr0[4:0] : cp0addr1[4:0];
                cp1_wdata<=(valid0 & ctrl0[`CTRL_ctc1]) ? (alu0_ready0 ? alu0_result0 : alu1_result0) : (alu0_ready1 ? alu0_result1 : alu1_result1);
                
                excode<=real_intr ? `E_interrupt : (((real_excode == `E_read_tlb_miss) | (real_excode == `E_store_tlb_miss)) ? `E_noexception : real_excode);
                
                exce_PC<=/*(can0 & can1 & (|ext_int) & ctrl0[`CTRL_is_branch]) ? PC1 : */((can0 & ((|real_ext_int) | (|excode0))) ? PC0 : PC1);
                
                exce_isslot<=(can0 & ((|real_ext_int) | (|excode0))) ? lasttag_isbranch : (valid0 ? isbranch0 : lasttag_isbranch);
                exce_vaddr<=(can0 & ((|real_ext_int) | (|excode0))) ? (futype0[`FU_MU] ? mu_result_other0[31:0] : PC0) : (futype1[`FU_MU] ? mu_result_other1[31:0] : PC1);
                eret_en<=(inst0_valid_en & ctrl0[`CTRL_eret]) | (inst1_valid_en & ctrl1[`CTRL_eret]);
                tlb_wr_en<=(inst0_valid_en & (ctrl0[`CTRL_tlbwr] | ctrl0[`CTRL_tlbwi])) | (inst1_valid_en & (ctrl1[`CTRL_tlbwr] | ctrl1[`CTRL_tlbwi]));
                tlb_wr_useindex<=(valid0 & ctrl0[`CTRL_tlbwi]) | (inst1_valid_en & ctrl1[`CTRL_tlbwi]);
                tlbp_en<=tlbp;
                tlbr_en<=(inst0_valid_en & ctrl0[`CTRL_tlbr]) | (inst1_valid_en & ctrl1[`CTRL_tlbr]);
                
                llbit_wen<=(inst0_valid_en & (ctrl0[`CTRL_eret] | ctrl0[`CTRL_ll])) | (inst1_valid_en & (ctrl1[`CTRL_eret] | ctrl1[`CTRL_ll]));
                llbit_newval<=(inst0_valid_en & ctrl0[`CTRL_ll]) | (inst1_valid_en & ctrl1[`CTRL_ll]);
                
                icache_clear_en<=(inst0_valid_en & (ctrl0[`CTRL_icache_hit] | ctrl0[`CTRL_icache_index])) | (inst1_valid_en & (ctrl1[`CTRL_icache_hit] | ctrl1[`CTRL_icache_index]));
                icache_addr<=(valid0 & (ctrl0[`CTRL_icache_hit] | ctrl0[`CTRL_icache_index])) ? mu_result0[31:0] : mu_result1[31:0];
                icache_index<=(inst0_valid_en & ctrl0[`CTRL_icache_index]) | (inst1_valid_en & ctrl1[`CTRL_icache_index]);
            
                //FPU提交
                fpr_wen0<=(inst0_valid_en & ctrl0[`CTRL_fpu] & fpu_gctrl0[`FPU_G_WEN0]) | (inst1_valid_en & ctrl1[`CTRL_fpu] & fpu_gctrl1[`FPU_G_WEN0]);
                fpr_wen1<=(inst0_valid_en & ctrl0[`CTRL_fpu] & fpu_gctrl0[`FPU_G_WEN1]) | (inst1_valid_en & ctrl1[`CTRL_fpu] & fpu_gctrl1[`FPU_G_WEN1]);
                fpr_waddr<=(valid0 & ctrl0[`CTRL_fpu]) ? fpu_waddr0 : fpu_waddr1;
                fpr_wprf0<=(valid0 & ctrl0[`CTRL_fpu]) ? fpu_wprf0_0 : fpu_wprf0_1;
                fpr_wprf1<=(valid0 & ctrl0[`CTRL_fpu]) ? fpu_wprf1_0 : fpu_wprf1_1;
                fpr_wdata<=(valid0 & ctrl0[`CTRL_fpu]) ? fpu_result0 : fpu_result1;
                updfcc_en<=(inst0_valid_en & ctrl0[`CTRL_fpu] & fpu_gctrl0[`FPU_G_WRITECC]) | (inst1_valid_en & ctrl1[`CTRL_fpu] & fpu_gctrl1[`FPU_G_WRITECC]);
                updfcc_addr<=(valid0 & ctrl0[`CTRL_fpu]) ? fpu_result0[3:1] : fpu_result1[3:1];
                updfcc_cc<=(valid0 & ctrl0[`CTRL_fpu]) ? fpu_result0[0] : fpu_result1[0];
                updfpe_en<=(inst0_valid_en & ctrl0[`CTRL_fpu]) | (inst1_valid_en & ctrl1[`CTRL_fpu]);
                updfpe_fpeword<=(valid0 & ctrl0[`CTRL_fpu]) ? fpu_fpeword0 : fpu_fpeword1;
                updfpe_exception<=(inst0_valid_en & ctrl0[`CTRL_fpu] & |fpu_excode0) | (inst1_valid_en & ctrl1[`CTRL_fpu] & |fpu_excode1);
            end
        end
    end

    //维护wait_en和flush
    always@(posedge clk) begin
        if(~resetn) begin
            flush<=0;
            wait_en<=0;
        end
        else begin
            if(flush)
                flush<=commit_lock | wait_en;
            else if(~(commit_lock | wait_en))
                flush<=flush0 | flush1 | real_intr;
            if(~wait_en)
                wait_en<=((inst0_valid_en & ctrl0[`CTRL_wait]) | (inst1_valid_en & ctrl1[`CTRL_wait])) & ~flush;
            else
                wait_en<=~(|ext_int);
        end
    end

    //维护转移指令标记，注意，必须是两条指令中最后发射的那条
    //注意：需要注意这样的特殊情况，若i0是转移指令，i1是发生TLB miss的指令
    //那么i1如果需要重新执行，这个标记必须保持i0的
    always@(posedge clk) begin
        if(~resetn) begin
            lasttag_isbranch<=0;
            lasttag_predfail<=0;
            lasttag_target<=0;
        end
        else begin
            if(flush) begin
                if((~tlb_miss_lockslot) | (|excode) | l2_tlb_qry_done) begin
                    lasttag_isbranch<=0;
                    lasttag_predfail<=0;
                end
            end
            else begin
                if(inst0_valid_en | inst1_valid_en) begin
                    lasttag_isbranch<=(inst0_valid_en & isbranch0 & ~can1) | (inst1_valid_en & isbranch1);
                    lasttag_predfail<=
                        (inst0_valid_en & isbranch0 & (~can1) & aluother0[33]) |
                        (inst1_valid_en & isbranch1 & aluother1[33]);
                    lasttag_target<=(inst1_valid_en & isbranch1) ? (aluother1[32] ? aluother1[31:0] : (PC1 + 8)) : (aluother0[32] ? aluother0[31:0] : (PC0 + 8));
                end
            end
        end
    end

    assign rob_pop=(~rob_empty) & (~(valid0 & ~/*ready0*/can0)) & (~(valid1 & ~/*ready1*/can1));
    assign rob_clear0=can0;
    assign rob_clear1=can1;

    always@(posedge clk) begin
        if(~resetn) begin
            commit_lock<=0;
            tlb_miss_excode<=0;
            tlb_miss_isdata<=0;
            tlb_miss_istlbp<=0;
            l2_tlb_qry_en<=0;
            tlb_miss_lockslot<=0;
        end
        else begin
            if(commit_lock)
                commit_lock<=~l2_tlb_qry_done;
            else if(~flush)
                commit_lock<=tlbp | (((real_excode == `E_read_tlb_miss) | (real_excode == `E_store_tlb_miss)) & ~real_intr);
            
            if(~flush)
                tlb_miss_lockslot<=tlbp | (((real_excode == `E_read_tlb_miss) | (real_excode == `E_store_tlb_miss)) & ~real_intr);
            else
                tlb_miss_lockslot<=commit_lock;

            if(~commit_lock) begin
                tlb_miss_excode<=real_excode;
                tlb_miss_isdata<=(valid0 & |excode0) ? futype0[`FU_MU] : futype1[`FU_MU];
                tlb_miss_istlbp<=tlbp;
            end
            if(flush)
                l2_tlb_qry_en<=0;
            else
                l2_tlb_qry_en<=tlbp | (((real_excode == `E_read_tlb_miss) | (real_excode == `E_store_tlb_miss)) & ~real_intr);
        end
    end
    
    assign l1_dtlb_ld_en=l2_tlb_qry_done & (~tlb_miss_istlbp) & tlb_miss_isdata & l2_tlb_qry_isexist;
    assign l1_itlb_ld_en=l2_tlb_qry_done & (~tlb_miss_istlbp) & (~tlb_miss_isdata) & l2_tlb_qry_isexist;
    

endmodule