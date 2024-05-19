// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    作为FU的MU模块，包括Issue/Execute和Execute/WriteBack流水线寄存器和旁路处理
    Upd at 6.24: 为FPU指令ldc1/lwc1/swc1/sdc1增加FPU数据发送端及相关状态位
        并且，不再接受inst字输入，改为输入17位offset
*/

module fu_mu(
    input           clk,
    input           resetn,
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
    //反馈信号
    output          preMEM_busy,    //告知不要修改Issue/preMEM的值（如果inst_valid=0则无意义）
    //TLB接口
    output[31:0]    tlb_vaddr,
    input[31:0]     tlb_paddr,
    input           tlb_isexist,
    input           tlb_isvalid,
    input           tlb_isdirty,
    input           tlb_uncached,
    input           tlb_error,
    //来自Commit的信号
    input           commit_en0,     //第0路Commit使能（无论Commit什么指令）
    input[$clog2(`ROB_SIZE) - 1:0]  commit_num0,    //第0路Commit的ROB编号
    input           commit_en1,     //第1路Commit使能
    input[$clog2(`ROB_SIZE) - 1:0]  commit_num1,    //第1路Commit的ROB编号
    input           flush,          //来自Commit的flush
    //来自MEM，送到保留站的命中load提前唤醒信号
    output          wakeup_en,      //唤醒使能
    output[$clog2(`ROB_SIZE) - 1:0] wakeup_num, //该指令的ROB编号
    //来自premem的提前唤醒
    output          premem_wakeup_en,
    output[$clog2(`ROB_SIZE) - 1:0] premem_wakeup_num,
    //来自MEM，送到ROB的done信号（为store使用）
    output          done_en,        //写ROB.done使能
    output[$clog2(`ROB_SIZE) - 1:0] done_num,   //该store指令的ROB编号
    //来自保留站的输入
    input                               sel_valid,
    //input[31:0]                         sel_inst,
    input[16:0]                         sel_offset,
    input[$clog2(`CNT_MUOP) - 1:0]      sel_muop,
    input                               sel_isload,
    input                               sel_isstore,              //在保留站里不需要完整的ctrl信号，给MU这俩就行
    input                               sel_cachewb,
    input                               sel_wen,
    input[$clog2(`ROB_SIZE) - 1:0]      sel_rsnum,
    input[$clog2(`ROB_SIZE) - 1:0]      sel_rtnum,
    input[31:0]                         sel_rsval,                //自动与ALU的WB旁路处理
    input[31:0]                         sel_rtval,
    input[$clog2(`ROB_SIZE) - 1:0]      sel_destnum,
    input                               sel_rsval_ready,
    input                               sel_rtval_ready,
    //FPU支持
    input               sel_tofpu,
    input               sel_tofpu_notlast,
    output reg          mu_tofpu_valid,
    output reg          mu_tofpu_notlast,
    output reg[31:0]    mu_tofpu_data,
    output reg[$clog2(`ROB_SIZE) - 1:0] mu_tofpu_num,
    //MEM/WriteBack流水线寄存器输出
    output reg                          mu_wb_valid,
    output reg                          mu_wb_wen,
    output reg[$clog2(`ROB_SIZE) - 1:0] mu_wb_num,
    output reg[31:0]                    mu_wb_result,
    output reg[`WIDTH_other - 1:0]      mu_wb_result_other,
    output reg[$clog2(`CNT_EXCEPTION) - 1:0]    mu_wb_excode,
    output reg                          mu_wb_uncached,
    //Note: 对于ldc1，需要告知ROB这条指令不是最后一条，不要标记为ready
    output reg                          mu_wb_tofpu_notlast,

    //ALU的旁路输入
    input           bypass0_en,
    input[$clog2(`ROB_SIZE) - 1:0]  bypass0_num,
    input[31:0]     bypass0_data,
    input           bypass1_en,
    input[$clog2(`ROB_SIZE) - 1:0]  bypass1_num,
    input[31:0]     bypass1_data,
    //ROB队头
    input[$clog2(`ROB_SIZE) - 2:0]  rob_head,
    input                           rob_head_valid0,
    input                           rob_head_valid1
    );

    reg mu_wb_tofpu;

    //上次的两个cached地址
    reg[31:0] last_cached_addr[0:1];
    reg[1:0] last_cached_addr_valid;



    reg isex_valid;
    //reg[31:0] isex_inst;
    reg[16:0] isex_offset;
    reg[$clog2(`CNT_MUOP) - 1:0] isex_muop;
    reg isex_isload;
    reg isex_isstore;
    reg[$clog2(`ROB_SIZE) - 1:0] isex_rsnum;
    reg[$clog2(`ROB_SIZE) - 1:0] isex_rtnum;
    reg[31:0] isex_rsval;
    reg[31:0] isex_rtval;
    reg[$clog2(`ROB_SIZE) - 1:0] isex_destnum;
    reg isex_rsval_ready;
    reg isex_rtval_ready;
    reg isex_cachewb;
    reg isex_wen;
    reg isex_tofpu;
    reg isex_tofpu_notlast;

    //d-Cache
    reg[`DCache_index_SIZE - 1:0] dcache_valid0;
    reg[`DCache_index_SIZE - 1:0] dcache_valid1;
    reg[`DCache_index_SIZE - 1:0] dcache_valid2;
    reg[1:0] dcache_lru0[0:`DCache_index_SIZE - 1];
    reg[1:0] dcache_lru1[0:`DCache_index_SIZE - 1];
    reg[1:0] dcache_lru2[0:`DCache_index_SIZE - 1];
    reg dcache_dirty0[0:`DCache_index_SIZE - 1];
    reg dcache_dirty1[0:`DCache_index_SIZE - 1];
    reg dcache_dirty2[0:`DCache_index_SIZE - 1];
    reg[19:0] dcache_tag0[0:`DCache_index_SIZE - 1];
    reg[19:0] dcache_tag1[0:`DCache_index_SIZE - 1];
    reg[19:0] dcache_tag2[0:`DCache_index_SIZE - 1];

    wire[$clog2(`DCache_index_SIZE) - 1:0] dcache_valid_windex;
    wire[$clog2(`DCache_index_SIZE) - 1:0] dcache_lru_windex;
    wire[$clog2(`DCache_index_SIZE) - 1:0] dcache_dirty_windex;
    wire[$clog2(`DCache_index_SIZE) - 1:0] dcache_tag_windex;
    wire dcache_valid_wen;
    wire dcache_lru_wen;
    wire dcache_dirty_wen;
    wire dcache_tag_wen;
    wire[2:0] dcache_dirty_wsel;
    wire[2:0] dcache_valid_wsel;
    wire[2:0] dcache_tag_wsel;
    wire[2:0] dcache_lru_wsel;
    wire dcache_valid_wdata;
    wire dcache_dirty_wdata;
    wire[19:0] dcache_tag_wdata;
    always@(posedge clk) begin
        if(~resetn) begin
            dcache_valid0<=0;
            dcache_valid1<=0;
            dcache_valid2<=0;
        end
        else begin
            if(dcache_valid_wen & dcache_valid_wsel[0])
                dcache_valid0[dcache_valid_windex]<=dcache_valid_wdata;
            if(dcache_valid_wen & dcache_valid_wsel[1])
                dcache_valid1[dcache_valid_windex]<=dcache_valid_wdata;
            if(dcache_valid_wen & dcache_valid_wsel[2])
                dcache_valid2[dcache_valid_windex]<=dcache_valid_wdata;
            if(dcache_dirty_wen & dcache_dirty_wsel[0])
                dcache_dirty0[dcache_dirty_windex]<=dcache_dirty_wdata;
            if(dcache_dirty_wen & dcache_dirty_wsel[1])
                dcache_dirty1[dcache_dirty_windex]<=dcache_dirty_wdata;
            if(dcache_dirty_wen & dcache_dirty_wsel[2])
                dcache_dirty2[dcache_dirty_windex]<=dcache_dirty_wdata;
            if(dcache_tag_wen & dcache_tag_wsel[0])
                dcache_tag0[dcache_tag_windex]<=dcache_tag_wdata;
            if(dcache_tag_wen & dcache_tag_wsel[1])
                dcache_tag1[dcache_tag_windex]<=dcache_tag_wdata;
            if(dcache_tag_wen & dcache_tag_wsel[2])
                dcache_tag2[dcache_tag_windex]<=dcache_tag_wdata;
            if(dcache_lru_wen & (((|dcache_lru_wsel[1:0]) ? (dcache_lru_wsel[0] ? dcache_lru0[dcache_lru_windex] : dcache_lru1[dcache_lru_windex]) : dcache_lru2[dcache_lru_windex]) != 2'b10)) begin
                dcache_lru0[dcache_lru_windex]<=dcache_lru_wsel[0] ? 2'b10 : {&dcache_lru0[dcache_lru_windex],dcache_lru0[dcache_lru_windex][1] & ~dcache_lru0[dcache_lru_windex][0]};
                dcache_lru1[dcache_lru_windex]<=dcache_lru_wsel[1] ? 2'b10 : {&dcache_lru1[dcache_lru_windex],dcache_lru1[dcache_lru_windex][1] & ~dcache_lru1[dcache_lru_windex][0]};
                dcache_lru2[dcache_lru_windex]<=dcache_lru_wsel[2] ? 2'b10 : {&dcache_lru2[dcache_lru_windex],dcache_lru2[dcache_lru_windex][1] & ~dcache_lru2[dcache_lru_windex][0]};
            end
        end
    end
    
    
    //BRAM的端口注意阻塞处理竞争
    wire[9:0] dcache_data_addr0;
    wire[2:0] dcache_data_sel0;
    wire[3:0] dcache_data_wen0;
    wire dcache_data_rden0;
    wire[31:0] dcache_data_wdata0;
    wire[31:0] dcache_data_rdata0[0:2];
    wire[2:0] dcache_data_sel1;
    wire[3:0] dcache_data_wen1;
    wire[31:0] dcache_data_wdata1;
    wire[31:0] dcache_data_rdata1[0:2];
    wire[9:0] dcache_data_addr1;
    genvar i;
    generate
        for(i=0; i < 3; i=i + 1) begin
            bram_32_1024_td dcache_data(.clk(clk),.resetn(resetn),
                .addr0(dcache_data_addr0),.wen0(dcache_data_wen0 & {4{dcache_data_sel0[i]}}),
                .wdata0(dcache_data_wdata0),.rdata0(dcache_data_rdata0[i]),.rden0(dcache_data_rden0),
                .addr1(dcache_data_addr1),.wen1(dcache_data_wen1 & {4{dcache_data_sel1[i]}}),
                .wdata1(dcache_data_wdata1),.rdata1(dcache_data_rdata1[i]));
        end
        for(i=0; i < `DCache_index_SIZE; i=i + 1) begin
            initial begin
                dcache_valid0[i]=0;
                dcache_valid1[i]=0;
                dcache_valid2[i]=0;
                dcache_lru0[i]=0;
                dcache_lru1[i]=0;
                dcache_lru2[i]=0;
                dcache_dirty0[i]=0;
                dcache_dirty1[i]=0;
                dcache_dirty2[i]=0;
                dcache_tag0[i]=0;
                dcache_tag1[i]=0;
                dcache_tag2[i]=0;
            end
        end
    endgenerate
    
    reg MemMid_tofpu;
    reg MemMid_tofpu_notlast;
    reg MemMid_valid;
    reg[31:0] MemMid_vaddr;
    reg MemMid_uncached;
    reg[31:0] MemMid_paddr;
    reg MemMid_isload;
    reg MemMid_isstore;
    reg MemMid_cachewb;
    reg MemMid_wen;
    reg[$clog2(`CNT_MUOP) - 1:0] MemMid_muop;
    reg[31:0] MemMid_rtval;
    reg[$clog2(`ROB_SIZE) - 1:0] MemMid_destnum;
    reg[3:0] MemMid_wstrb;
    reg[2:0] MemMid_replace;
    reg[19:0] MemMid_tag[0:2];
    reg[2:0] MemMid_cachevalid;
    reg MemMid_addrerror;
    reg MemMid_tlbmiss;
    reg MemMid_tlbinvalid;
    reg MemMid_tlbmodified;
    reg[2:0] MemMid_rsize;  //用于uncached load arsize
    wire MemMid_hasexception=MemMid_addrerror | MemMid_tlbmiss | MemMid_tlbinvalid | MemMid_tlbmodified;
    //wire MemMid_uncached=(MemMid_vaddr[31:29] == 3'b101);
    wire[2:0] hit;
    reg[31:0] calcresult;

    //Note: 我们禁用MemMid->preMem的旁路
    wire usemem=0;//(MemMid_valid & MemMid_wen & (|hit) & (MemMid_destnum == isex_rtnum));
    wire usewb=(mu_wb_wen & (mu_wb_num == isex_rtnum));

    wire preMEM_wait;   //TODO
    assign preMEM_busy=preMEM_wait & isex_valid;

    wire[31:0] real_rs=isex_rsval_ready ? isex_rsval : ((bypass0_en & (bypass0_num == isex_rsnum)) ? bypass0_data : bypass1_data);
    wire[31:0] real_rt=isex_rtval_ready ? isex_rtval : (/*usemem ? calcresult : */((bypass0_en & (bypass0_num == isex_rtnum)) ? bypass0_data : (usewb ? mu_wb_result : bypass1_data)));
    wire[31:0] addr=real_rs + {{15{isex_offset[16]}},isex_offset[16:0]};
    wire[$clog2(`DCache_index_SIZE) - 1:0] preMEM_index=addr[11:(12 - $clog2(`DCache_index_SIZE))];
    assign tlb_vaddr=addr;
    wire real_rt_ready=isex_rtval_ready | (bypass0_en & (bypass0_num == isex_rtnum)) | (bypass1_en & (bypass1_num == isex_rtnum)) | usewb | usemem;

    always@(posedge clk) begin
        if(~resetn) begin
            isex_valid<=0;
            //isex_inst<=0;
            isex_offset<=0;
            isex_muop<=0;
            isex_isload<=0;
            isex_isstore<=0;
            isex_rsnum<=0;
            isex_rtnum<=0;
            isex_rsval<=0;
            isex_rtval<=0;
            isex_destnum<=0;
            isex_rsval_ready<=0;
            isex_rtval_ready<=0;
            isex_cachewb<=0;
            isex_wen<=0;
            isex_tofpu<=0;
            isex_tofpu_notlast<=0;
        end
        else begin
            if(flush | ~preMEM_busy) begin
                isex_valid<=sel_valid & ~flush;
            end
            if(~preMEM_busy) begin
                //isex_inst<=sel_inst;
                isex_offset<=sel_offset;
                isex_muop<=sel_muop;
                isex_isload<=sel_isload;
                isex_isstore<=sel_isstore;
                isex_rsnum<=sel_rsnum;
                isex_rtnum<=sel_rtnum;
                isex_rsval<=sel_rsval;
                isex_rtval<=sel_rtval;
                isex_destnum<=sel_destnum;
                isex_rsval_ready<=sel_rsval_ready;
                isex_rtval_ready<=sel_rtval_ready;
                isex_cachewb<=sel_cachewb;
                isex_wen<=sel_wen;
                isex_tofpu<=sel_tofpu;
                isex_tofpu_notlast<=sel_tofpu_notlast;
            end
            else begin
                isex_rsval<=real_rs;
                isex_rtval<=real_rt;
                isex_rsval_ready<=isex_rsval_ready | (bypass0_en & (bypass0_num == isex_rsnum)) | (bypass1_en & (bypass1_num == isex_rsnum));
                isex_rtval_ready<=real_rt_ready;
            end
        end
    end
    
    
    
    wire MEM_busy;  //TODO
    assign dcache_data_rden0=~MEM_busy;

    
    wire v0=dcache_valid0[preMEM_index];
    wire v1=dcache_valid1[preMEM_index];
    wire v2=dcache_valid2[preMEM_index];
    wire[2:0] vrp;
    assign vrp[0]=~v0;
    assign vrp[1]=v0 & ~v1;
    assign vrp[2]=v0 & v1 & ~v2;
    wire[2:0] rep;
    assign rep[0]=(dcache_lru0[preMEM_index] == 2'b00);
    assign rep[1]=(dcache_lru1[preMEM_index] == 2'b00) & (~rep[0]);
    assign rep[2]=(dcache_lru2[preMEM_index] == 2'b00) & (~rep[0]) & (~rep[1]);

    reg[31:0] sbword,swlword,swrword;
    reg[3:0] sbwstrb,swlwstrb,swrwstrb;
    always@(*) begin
        case(addr[1:0])
        2'b00: begin
            sbword=real_rt;
            swlword={24'b0,real_rt[31:24]};
            swrword=real_rt;
            sbwstrb=4'b0001;
            swlwstrb=4'b0001;
            swrwstrb=4'b1111;
        end
        2'b01: begin
            sbword={real_rt[23:0],8'b0};
            swlword={16'b0,real_rt[31:16]};
            swrword={real_rt[23:0],8'b0};
            sbwstrb=4'b0010;
            swlwstrb=4'b0011;
            swrwstrb=4'b1110;
        end
        2'b10: begin
            sbword={real_rt[15:0],16'b0};
            swlword={8'b0,real_rt[31:8]};
            swrword={real_rt[15:0],16'b0};
            sbwstrb=4'b0100;
            swlwstrb=4'b0111;
            swrwstrb=4'b1100;
        end
        2'b11: begin
            sbword={real_rt[7:0],24'b0};
            swlword=real_rt;
            swrword={real_rt[7:0],24'b0};
            sbwstrb=4'b1000;
            swlwstrb=4'b1111;
            swrwstrb=4'b1000;
        end
        default:;
        endcase
    end

    always@(posedge clk) begin
        if(~resetn) begin
            MemMid_valid<=0;
            MemMid_vaddr<=0;
            MemMid_paddr<=0;
            MemMid_isload<=0;
            MemMid_isstore<=0;
            MemMid_muop<=0;
            MemMid_rtval<=0;
            MemMid_destnum<=0;
            MemMid_wstrb<=0;
            MemMid_replace<=0;
            MemMid_tag[0]<=0;
            MemMid_tag[1]<=0;
            MemMid_tag[2]<=0;
            MemMid_cachevalid<=0;
            MemMid_addrerror<=0;
            MemMid_tlbinvalid<=0;
            MemMid_tlbmiss<=0;
            MemMid_tlbmodified<=0;
            MemMid_cachewb<=0;
            MemMid_wen<=0;
            MemMid_rsize<=0;
            MemMid_uncached<=0;
            MemMid_tofpu<=0;
            MemMid_tofpu_notlast<=0;
        end
        else begin
            if(flush | ~MEM_busy)
                MemMid_valid<=(~flush) & isex_valid & (~preMEM_wait);
            if(~MEM_busy) begin
                MemMid_vaddr<=addr;
                MemMid_paddr<=tlb_paddr;
                MemMid_isload<=isex_isload;
                MemMid_isstore<=isex_isstore;
                MemMid_muop<=isex_muop;
                MemMid_uncached<=tlb_uncached;
                case(isex_muop)
                `MUOP_sb: begin
                    MemMid_rtval<=sbword;
                    MemMid_wstrb<=sbwstrb;
                end
                `MUOP_sh: begin
                    MemMid_rtval<=addr[1] ? {real_rt[15:0],16'b0} : real_rt;
                    MemMid_wstrb<=addr[1] ? 4'b1100 : 4'b0011;
                end
                `MUOP_swl: begin
                    MemMid_rtval<=swlword;
                    MemMid_wstrb<=swlwstrb;
                end
                `MUOP_swr: begin
                    MemMid_rtval<=swrword;
                    MemMid_wstrb<=swrwstrb;
                end
                `MUOP_sw: begin
                    MemMid_rtval<=real_rt;
                    MemMid_wstrb<=4'b1111;
                end
                default: begin
                    MemMid_rtval<=real_rt;
                    MemMid_wstrb<=0;
                end
                endcase
                MemMid_rsize<=((isex_muop == `MUOP_lb) | (isex_muop == `MUOP_lbu)) ? 0 : (((isex_muop == `MUOP_lh) | (isex_muop == `MUOP_lhu)) ? 1 : 2);
                MemMid_destnum<=isex_destnum;
                MemMid_replace<=(v0 & v1 & v2) ? rep : vrp;
                MemMid_tag[0]<=dcache_tag0[preMEM_index];
                MemMid_tag[1]<=dcache_tag1[preMEM_index];
                MemMid_tag[2]<=dcache_tag2[preMEM_index];
                MemMid_cachevalid<={v2,v1,v0};
                MemMid_addrerror<=(((isex_muop == `MUOP_lh) | (isex_muop == `MUOP_lhu) | (isex_muop == `MUOP_sh)) & addr[0]) | (((isex_muop == `MUOP_lw) | (isex_muop == `MUOP_sw)) & |addr[1:0]) | tlb_error;
                MemMid_tlbinvalid<=~tlb_isvalid;
                MemMid_tlbmiss<=~tlb_isexist;
                MemMid_tlbmodified<=isex_isstore & ~tlb_isdirty;
                MemMid_cachewb<=isex_cachewb;
                MemMid_wen<=isex_wen;
                MemMid_tofpu<=isex_tofpu;
                MemMid_tofpu_notlast<=isex_tofpu_notlast;
            end
        end
    end

    wire overlay_busy;
    wire overlay_handling_cache;
    wire[$clog2(`DCache_index_SIZE) - 1:0] overlay_missindex;
    wire overlay_req;  //TODO
    wire[2:0] overlay_req_sel;  //TODO
    wire overlay_req_dirty; //TODO
    wire[4:0] overlay_req_op;   //TODO
    wire[19:0] overlay_req_oldtag;  //TODO
    wire overlay_output_en;
    wire[31:0] overlay_output_result;
    wire overlay_output_uncached;
    wire[$clog2(`ROB_SIZE) - 1:0] overlay_output_num;
    wire overlay_output_tofpu;
    wire overlay_output_tofpu_notlast;
    wire          que_full;
    wire          que_push_en;  //TODO
    wire[31:0]    que_push_data;    //TODO
    wire[9:0]     que_push_addr;    //TODO
    wire[$clog2(`ROB_SIZE) - 1:0]  que_push_num;    //TODO
    wire[2:0]     que_push_sel; //TODO
    wire[9:0]     overlay_icache_data_addr;
    wire          overlay_icache_data_en;   //注意：这个接口需要通过en与MEM竞争BRAM的同一个端口，具有高优先级
    wire[2:0]     overlay_icache_data_sel;
    wire          overlay_icache_data_wen;
    wire[31:0]    overlay_icache_data_wdata;
    wire[9:0]     overlay_back_data_addr;
    wire          overlay_back_data_wen;
    wire[2:0]     overlay_back_data_sel;
    wire[31:0]    overlay_back_data_wdata;
    wire[$clog2(`DCache_index_SIZE) - 1:0]    overlay_info_waddr;
    wire[2:0]     overlay_info_sel;
    wire          overlay_info_lru_wen;
    wire          overlay_info_dirty_wen;
    wire          overlay_info_dirty_wdata;
    assign dcache_valid_windex=overlay_info_waddr;
    assign dcache_tag_windex=overlay_info_waddr;
    assign dcache_valid_wsel=overlay_info_sel;
    assign dcache_tag_wsel=overlay_info_sel;

    mem_ctrl mc(
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
        .bready(bready),
        .flush(flush),
        .commit_en0(commit_en0),
        .commit_num0(commit_num0),
        .commit_en1(commit_en1),
        .commit_num1(commit_num1),
        .busy(overlay_busy),
        .handling_cache(overlay_handling_cache),
        .missindex(overlay_missindex),
        .req_valid(overlay_req),
        .req_paddr(MemMid_paddr),
        .req_sel(overlay_req_sel),
        .req_dirty(overlay_req_dirty),
        .req_op(overlay_req_op),
        .req_store_data(MemMid_rtval),
        .req_store_wstrb(MemMid_wstrb),
        .req_muop(MemMid_muop),
        .req_destnum(MemMid_destnum),
        .req_oldtag(overlay_req_oldtag),
        .req_rsize(MemMid_rsize),
        .req_tofpu(MemMid_tofpu),
        .req_tofpu_notlast(MemMid_tofpu_notlast),
        .output_en(overlay_output_en),
        .output_result(overlay_output_result),
        .output_num(overlay_output_num),
        .output_uncached(overlay_output_uncached),
        .output_tofpu(overlay_output_tofpu),
        .output_tofpu_notlast(overlay_output_tofpu_notlast),
        .que_full(que_full),
        .que_push_en(que_push_en),
        .que_push_data(que_push_data),
        .que_push_addr(que_push_addr),
        .que_push_num(que_push_num),
        .que_push_sel(que_push_sel),
        .icache_data_addr(overlay_icache_data_addr),
        .icache_data_en(overlay_icache_data_en),
        .icache_data_sel(overlay_icache_data_sel),
        .icache_data_wen(overlay_icache_data_wen),
        .icache_data_wdata(overlay_icache_data_wdata),
        .icache_data_rdata(overlay_icache_data_sel[0] ? dcache_data_rdata1[0] : (overlay_icache_data_sel[1] ? dcache_data_rdata1[1] : dcache_data_rdata1[2])),
        .back_data_addr(overlay_back_data_addr),
        .back_data_wen(overlay_back_data_wen),
        .back_data_sel(overlay_back_data_sel),
        .back_data_wdata(overlay_back_data_wdata),
        .info_waddr(overlay_info_waddr),
        .info_sel(overlay_info_sel),
        .info_tag_wen(dcache_tag_wen),
        .info_lru_wen(overlay_info_lru_wen),
        .info_dirty_wen(overlay_info_dirty_wen),
        .info_valid_wen(dcache_valid_wen),
        .info_tag_wdata(dcache_tag_wdata),
        .info_valid_wdata(dcache_valid_wdata),
        .info_dirty_wdata(overlay_info_dirty_wdata),
        .rob_head(rob_head),
        .rob_head_valid0(rob_head_valid0),
        .rob_head_valid1(rob_head_valid1)
    );

    
    assign hit[0]=MemMid_cachevalid[0] & (MemMid_paddr[31:12] == MemMid_tag[0]) & ~MemMid_uncached;
    assign hit[1]=MemMid_cachevalid[1] & (MemMid_paddr[31:12] == MemMid_tag[1]) & ~MemMid_uncached;
    assign hit[2]=MemMid_cachevalid[2] & (MemMid_paddr[31:12] == MemMid_tag[2]) & ~MemMid_uncached;
    wire[31:0] selword=hit[0] ? dcache_data_rdata0[0] : (hit[1] ? dcache_data_rdata0[1] : dcache_data_rdata0[2]);

    reg[31:0] lb_result;
    reg[31:0] lbu_result;
    reg[31:0] lwl_result;
    reg[31:0] lwr_result;
    
    always@(*) begin
        case(MemMid_vaddr[1:0])
        2'b00: begin
            lb_result={{24{selword[7]}},selword[7:0]};
            lbu_result={24'b0,selword[7:0]};
            lwl_result={selword[7:0],MemMid_rtval[23:0]};
            lwr_result=selword;
        end
        2'b01: begin
            lb_result={{24{selword[15]}},selword[15:8]};
            lbu_result={24'b0,selword[15:8]};
            lwl_result={selword[15:0],MemMid_rtval[15:0]};
            lwr_result={MemMid_rtval[31:24],selword[31:8]};
        end
        2'b10: begin
            lb_result={{24{selword[23]}},selword[23:16]};
            lbu_result={24'b0,selword[23:16]};
            lwl_result={selword[23:0],MemMid_rtval[7:0]};
            lwr_result={MemMid_rtval[31:16],selword[31:16]};
        end
        2'b11: begin
            lb_result={{24{selword[31]}},selword[31:24]};
            lbu_result={24'b0,selword[31:24]};
            lwl_result=selword;
            lwr_result={MemMid_rtval[31:8],selword[31:24]};
        end
        default:;
        endcase
        case(MemMid_muop)
        `MUOP_lb:   calcresult=lb_result;
        `MUOP_lbu:  calcresult=lbu_result;
        `MUOP_lh:   calcresult=MemMid_vaddr[1] ? {{16{selword[31]}},selword[31:16]} : {{16{selword[15]}},selword[15:0]};
        `MUOP_lhu:  calcresult={16'b0,MemMid_vaddr[1] ? selword[31:16] : selword[15:0]};
        `MUOP_lw:   calcresult=selword;
        `MUOP_lwl:  calcresult=lwl_result;
        `MUOP_lwr:  calcresult=lwr_result;
        `MUOP_calcaddr: calcresult=MemMid_paddr;
        default:    calcresult=0;
        endcase
    end

    //阻塞MemMid，当MEM_busy有效时，MemMid的所有行为都不可生效
    //1.命中的store，但是回退队列满
    //2.需要进入重叠态，但是重叠态忙
    //3.命中的load或有异常，重叠态正在输出
    //4.命中的store，但是BRAM端口1正在被占用
    assign MEM_busy=MemMid_valid & ((MemMid_isstore & (~MemMid_hasexception) & (|hit) & (que_full | overlay_icache_data_en | overlay_info_dirty_wen)) | (overlay_busy & (~MemMid_hasexception) & ((MemMid_muop == `MUOP_cachehit) | (MemMid_muop == `MUOP_cacheindex) | ~(|hit))) | (((MemMid_isload & |hit) | MemMid_hasexception) & overlay_output_en));
    //MEM_busy对于有效无异常命中store的版本
    wire MEM_busy_hitstore=que_full | overlay_icache_data_en | overlay_info_dirty_wen;
    //若无阻塞，是否可以执行
    wire MEM_able=MemMid_valid & ~MemMid_hasexception;

    //阻塞preMEM
    //要么MemMid阻塞，要么preMEM与overlay的cache操作撞index，要么PreMEM与MemMid的miss撞index
    wire preMem_wait_load=MEM_busy | ((addr[11:(12 - $clog2(`DCache_index_SIZE))] == overlay_missindex) & overlay_handling_cache) | ((addr[11:(12 - $clog2(`DCache_index_SIZE))] == MemMid_vaddr[11:(12 - $clog2(`DCache_index_SIZE))]) & MemMid_valid & (((~MemMid_uncached) & ~(|hit)))) | (((MemMid_muop == `MUOP_cachehit) | (MemMid_muop == `MUOP_cacheindex)) & MemMid_valid);
    assign preMEM_wait=preMem_wait_load | (isex_valid & ~real_rt_ready);
    

    //BRAM端口0分配
    assign dcache_data_addr0=overlay_back_data_wen ? overlay_back_data_addr : addr[11:2];
    assign dcache_data_sel0=overlay_back_data_sel;
    assign dcache_data_wdata0=overlay_back_data_wdata;
    assign dcache_data_wen0={4{overlay_back_data_wen}};
    //BRAM端口1分配
    assign dcache_data_addr1=overlay_icache_data_en ? overlay_icache_data_addr : MemMid_vaddr[11:2];
    assign dcache_data_sel1=overlay_icache_data_en ? overlay_icache_data_sel : (hit & {3{MEM_able & ~MEM_busy_hitstore}});
    assign dcache_data_wen1=overlay_icache_data_en ? {4{overlay_icache_data_wen}} : MemMid_wstrb;
    assign dcache_data_wdata1=overlay_icache_data_en ? overlay_icache_data_wdata : MemMid_rtval;
    //元数据写端口（dirty、lru）分配
    assign dcache_dirty_wen=overlay_info_dirty_wen | (MEM_able & MemMid_isstore & (|hit) & ~MEM_busy_hitstore);
    assign dcache_dirty_windex=overlay_info_dirty_wen ? overlay_info_waddr : MemMid_paddr[11:(12 - $clog2(`DCache_index_SIZE))];
    assign dcache_dirty_wsel=overlay_info_dirty_wen ? overlay_info_sel : hit;
    assign dcache_dirty_wdata=overlay_info_dirty_wen ? overlay_info_dirty_wdata : 1'b1;
    assign dcache_lru_wen=overlay_info_lru_wen | (MEM_able & |hit);
    assign dcache_lru_wsel=overlay_info_lru_wen ? overlay_info_sel : hit;
    assign dcache_lru_windex=overlay_info_lru_wen ? overlay_info_waddr : MemMid_paddr[11:(12 - $clog2(`DCache_index_SIZE))];
    //输出
    always@(posedge clk) begin
        if(~resetn) begin
            mu_wb_valid<=0;
            mu_wb_wen<=0;
            mu_wb_num<=0;
            mu_wb_result<=0;
            mu_wb_result_other<=0;
            mu_wb_excode<=0;
            mu_wb_uncached<=0;
            mu_wb_tofpu<=0;
            mu_wb_tofpu_notlast<=0;
            last_cached_addr[0]<=0;
            last_cached_addr[1]<=0;
            last_cached_addr_valid<=0;
        end
        else begin
            //Note: 如果overlay没有在输出，那么要写回的操作一定不会阻塞
            mu_wb_valid<=(~flush) & (overlay_output_en | (MemMid_valid & (MemMid_hasexception | (MemMid_isload & (|hit)) | (MemMid_muop == `MUOP_calcaddr))));
            mu_wb_wen<=(~flush) & ((overlay_output_en & ~overlay_output_tofpu) | (MemMid_wen & (~MemMid_tofpu) & MEM_able & |hit));
            mu_wb_result<=overlay_output_en ? overlay_output_result : calcresult;
            mu_wb_num<=overlay_output_en ? overlay_output_num : MemMid_destnum;
            mu_wb_result_other<=MemMid_vaddr;
            mu_wb_excode<=(overlay_output_en | ~MemMid_hasexception) ? 0 : ((MemMid_addrerror | MemMid_tlbmiss) ? (MemMid_addrerror ? (MemMid_isstore ? `E_store_addr_error : `E_read_addr_error) : (MemMid_isstore ? `E_store_tlb_miss : `E_read_tlb_miss)) : (MemMid_tlbinvalid ? (MemMid_isstore ? `E_store_tlb_invalid : `E_read_tlb_invalid) : `E_tlb_modified));
            mu_wb_uncached<=overlay_output_en ? overlay_output_uncached : 0;
            mu_wb_tofpu<=overlay_output_en ? overlay_output_tofpu : MemMid_tofpu;
            mu_wb_tofpu_notlast<=overlay_output_en ? overlay_output_tofpu_notlast : MemMid_tofpu_notlast;
            if(overlay_busy)
                last_cached_addr_valid<=0;
            else begin
                if(MemMid_isload & MEM_able & |hit) begin
                    last_cached_addr_valid[0]<=last_cached_addr_valid[0];
                    last_cached_addr_valid[1]<=1;
                    last_cached_addr[0]<=last_cached_addr[1];
                    last_cached_addr[1]<=MemMid_vaddr;
                end
            end
        end
    end
    //命中的load提前激活（它被阻塞当且仅当overlay正在输出）
    assign wakeup_en=MEM_able & MemMid_wen & (|hit) & ~overlay_output_en;
    assign wakeup_num=MemMid_destnum;
    //store/cache维护/uncached load 提前Commit
    assign done_num=MemMid_destnum;
    //Note: 对于连续两发射的64位store，只能在第二条处标记ready
    assign done_en=MEM_able & (~MemMid_tofpu_notlast) & ((MemMid_isstore & (|hit) & ~MEM_busy_hitstore) | (((MemMid_isstore & ~(|hit)) | (MemMid_muop == `MUOP_cachehit) | (MemMid_muop == `MUOP_cacheindex)) & ~overlay_busy));
    //回退队列接口
    assign que_push_en=MEM_able & MemMid_isstore & (|hit) & (~MEM_busy_hitstore);
    assign que_push_sel=hit;
    assign que_push_addr=MemMid_vaddr[11:2];
    assign que_push_data=selword;
    assign que_push_num=MemMid_destnum;
    //输入overlay的操作
    assign overlay_req=MEM_able & (((MemMid_isload | MemMid_isstore) & ~(|hit)) | (MemMid_muop == `MUOP_cachehit) | (MemMid_muop == `MUOP_cacheindex)) & ~overlay_busy;
    wire[2:0] ind_sel;
    assign ind_sel[0]=(MemMid_vaddr[13:12] == 2'b00);
    assign ind_sel[1]=(MemMid_vaddr[13:12] == 2'b01);
    assign ind_sel[2]=(MemMid_vaddr[13:12] == 2'b10);
    assign overlay_req_sel=(MemMid_muop == `MUOP_cacheindex) ? ind_sel : ((MemMid_muop == `MUOP_cachehit) ? hit : MemMid_replace);
    wire[2:0] dr;
    assign dr[0]=dcache_dirty0[MemMid_paddr[11:(12 - $clog2(`DCache_index_SIZE))]];
    assign dr[1]=dcache_dirty1[MemMid_paddr[11:(12 - $clog2(`DCache_index_SIZE))]];
    assign dr[2]=dcache_dirty2[MemMid_paddr[11:(12 - $clog2(`DCache_index_SIZE))]];
    assign overlay_req_dirty=(MemMid_muop == `MUOP_cacheindex) ? (MemMid_cachewb & |(ind_sel & dr)) : (
            (MemMid_muop == `MUOP_cachehit) ? (MemMid_cachewb & |(hit & dr)) : |(MemMid_replace & dr));
    assign overlay_req_op[0]=MemMid_isload & ~MemMid_uncached;
    assign overlay_req_op[1]=MemMid_isstore & ~MemMid_uncached;
    assign overlay_req_op[2]=MemMid_isload & MemMid_uncached;
    assign overlay_req_op[3]=MemMid_isstore & MemMid_uncached;
    assign overlay_req_op[4]=(MemMid_muop == `MUOP_cachehit) | (MemMid_muop == `MUOP_cacheindex);
    assign overlay_req_oldtag=overlay_req_sel[0] ? MemMid_tag[0] : (overlay_req_sel[1] ? MemMid_tag[1] : MemMid_tag[2]);
    

    assign premem_wakeup_en=(~preMem_wait_load) & (~overlay_busy) & ((~MemMid_valid) | (|hit)) & isex_valid & isex_wen & (
        ((addr[31:($clog2(`DCache_block_WORDS) + 2)] == last_cached_addr[0][31:($clog2(`DCache_block_WORDS) + 2)]) & last_cached_addr_valid[0]) |
        ((addr[31:($clog2(`DCache_block_WORDS) + 2)] == last_cached_addr[1][31:($clog2(`DCache_block_WORDS) + 2)]) & last_cached_addr_valid[1])
    );
    assign premem_wakeup_num=isex_destnum;

    always@(posedge clk) begin
        if(~resetn) begin
            mu_tofpu_data<=0;
            mu_tofpu_notlast<=0;
            mu_tofpu_num<=0;
            mu_tofpu_valid<=0;
        end
        else begin
            if(flush)
                mu_tofpu_valid<=0;
            else
                mu_tofpu_valid<=mu_wb_valid & mu_wb_tofpu;
            mu_tofpu_notlast<=mu_wb_tofpu_notlast;
            mu_tofpu_num<=mu_wb_num;
            mu_tofpu_data<=mu_wb_result;
        end
    end
        

endmodule