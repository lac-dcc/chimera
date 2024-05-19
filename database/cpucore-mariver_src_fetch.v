// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    取指模块
    Upd at 2023.4.8：增加一级流水段，专门进行分支预测
*/

module fetch(
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
    //flush端口
    input           flush,              //flush使能
    input[31:0]     flush_target,       //flush后目标地址
    //指令输出端口（以组合逻辑方式呈现）
    output[31:0]    fetch_inst0,        //指令0
    output[31:0]    fetch_inst1,        //指令1
    output          fetch_valid0,       //指令0是否有效
    output          fetch_valid1,       //指令1是否有效
    output[31:0]    fetch_PC0,          //指令0地址
    output[31:0]    fetch_PC1,          //指令1地址
    output          fetch_predict0,     //指令0是否预测转移
    output          fetch_predict1,     //指令1是否预测转移
    output[31:0]    fetch_predict_target0,  //指令0预测地址
    output[31:0]    fetch_predict_target1,  //指令1预测地址
    output[$clog2(`CNT_EXCEPTION) - 1:0]    fetch_excode0,  //取指时异常码
    output[$clog2(`CNT_EXCEPTION) - 1:0]    fetch_excode1,
    output[63:0]    fetch_RAS,          //取指前的RAS，指令0和1共用
    output          fetch_output_en,    //是否可以送出指令
    //TLB端口
    output[31:0]    tlb_vaddr,          //送出去查询的虚拟地址（只需要查1个即可）
    input[31:0]     tlb_paddr,          //物理地址
    input           tlb_isexist,        //是否存在
    input           tlb_isvalid,        //是否有效
    input           tlb_uncached,       //该地址是否uncached
    input           tlb_error,          //该地址是否访问权限错误
    //i-Cache维护端口
    input           icache_clear_en,    //icache维护信号，只要其有效，保证flush信号一定有效至少1拍
    input[31:0]     icache_addr,        //icache维护地址，【应该是paddr】
    input           icache_index,       //icache是否为index
    //来自Buffer的阻塞信号
    input           buffer_full,        //Buffer是否已满
    //分支预测器读端口
    output          predict_rden,       //读使能，用于ret修改RAS，当preFetch被阻塞时为0
    output[31:0]    predict_PC0,
    output[31:0]    predict_PC1,
    output          predict_PC1_valid,  //指令1地址是否有效
    input           predict_jump,       //是否预测转移（显然只会有一条指令）
    input[31:0]     predict_jump_target,//预测转移目标
    input           predict_isinst1,    //若预测转移，是否为地址1预测的
    input[31:0]     predict_target0,
    input[31:0]     predict_target1,
    input[63:0]     predict_oldRAS      //旧的RAS
    );

    //Predict/preFetch流水线寄存器
    reg[31:0] preFetch_PC0;
    reg[31:0] preFetch_PC1;
    reg preFetch_valid0;
    reg preFetch_valid1;
    reg[63:0] preFetch_RAS;
    reg preFetch_predict0;
    reg preFetch_predict1;
    reg[31:0] preFetch_predict_target0;
    reg[31:0] preFetch_predict_target1;



    wire[31:0] vaddr0,vaddr1;           //取指的两路PC

    wire[9:0] icache_waddr;             //处理miss时写的icache字地址
    wire[31:0] icache_wdata;
    wire[3:0] icache_wen;
    wire icache_rden;
    wire[31:0] icache_rdata[0:3][0:1];
    genvar i;
    generate
        for(i=0; i < 4; i=i + 1) begin
            bram_32_1024_sd icdat0(
                .clk(clk),
                .resetn(resetn),
                .rden(icache_rden),
                .raddr(vaddr0[11:2]),
                .waddr(icache_waddr),
                .wen(icache_wen[i]),
                .wdata(icache_wdata),
                .rdata(icache_rdata[i][0])
            );
            bram_32_1024_sd icdat1(
                .clk(clk),
                .resetn(resetn),
                .rden(icache_rden),
                .raddr(vaddr1[11:2]),
                .waddr(icache_waddr),
                .wen(icache_wen[i]),
                .wdata(icache_wdata),
                .rdata(icache_rdata[i][1])
            );
        end
    endgenerate

    reg[`ICache_index_SIZE - 1:0] icache_valid0;
    reg[1:0] icache_lru0[0:`ICache_index_SIZE - 1];
    reg[19:0] icache_tag0[0:`ICache_index_SIZE - 1]; //高20位物理地址
    reg[`ICache_index_SIZE - 1:0] icache_valid1;
    reg[1:0] icache_lru1[0:`ICache_index_SIZE - 1];
    reg[19:0] icache_tag1[0:`ICache_index_SIZE - 1]; //高20位物理地址
    reg[`ICache_index_SIZE - 1:0] icache_valid2;
    reg[1:0] icache_lru2[0:`ICache_index_SIZE - 1];
    reg[19:0] icache_tag2[0:`ICache_index_SIZE - 1]; //高20位物理地址
    reg[`ICache_index_SIZE - 1:0] icache_valid3;
    reg[1:0] icache_lru3[0:`ICache_index_SIZE - 1];
    reg[19:0] icache_tag3[0:`ICache_index_SIZE - 1]; //高20位物理地址

    generate
        for(i=0; i < `ICache_index_SIZE; i=i + 1) begin
            initial begin
                icache_valid0[i]=0;
                icache_valid1[i]=0;
                icache_valid2[i]=0;
                icache_valid3[i]=0;
                icache_lru0[i]=0;
                icache_lru1[i]=0;
                icache_lru2[i]=0;
                icache_lru3[i]=0;
                icache_tag0[i]=0;
                icache_tag1[i]=0;
                icache_tag2[i]=0;
                icache_tag3[i]=0;
            end
        end
    endgenerate

    wire icache_tag_wen;
    wire[3:0] icache_tag_wsel;
    wire[19:0] icache_tag_wtag;
    wire[$clog2(`ICache_index_SIZE) - 1:0] icache_tag_windex;
    wire icache_valid_wen;
    wire icache_valid_wdata;
    wire[3:0] icache_valid_wsel;
    wire[$clog2(`ICache_index_SIZE) - 1:0] icache_valid_windex;
    wire icache_lru_wen;
    wire[3:0] icache_lru_wsel;
    wire[$clog2(`ICache_index_SIZE) - 1:0] icache_lru_windex;
    always@(posedge clk) begin
        if(~resetn) begin
            icache_valid0<=0;
            icache_valid1<=0;
            icache_valid2<=0;
            icache_valid3<=0;
        end
        else begin
            if(icache_valid_wen) begin
                if(icache_valid_wsel[0])
                    icache_valid0[icache_valid_windex]<=icache_valid_wdata;
                if(icache_valid_wsel[1])
                    icache_valid1[icache_valid_windex]<=icache_valid_wdata;
                if(icache_valid_wsel[2])
                    icache_valid2[icache_valid_windex]<=icache_valid_wdata;
                if(icache_valid_wsel[3])
                    icache_valid3[icache_valid_windex]<=icache_valid_wdata;
            end
            if(icache_tag_wen) begin
                if(icache_tag_wsel[0])
                    icache_tag0[icache_tag_windex]<=icache_tag_wtag;
                if(icache_tag_wsel[1])
                    icache_tag1[icache_tag_windex]<=icache_tag_wtag;
                if(icache_tag_wsel[2])
                    icache_tag2[icache_tag_windex]<=icache_tag_wtag;
                if(icache_tag_wsel[3])
                    icache_tag3[icache_tag_windex]<=icache_tag_wtag;
            end
            if(icache_lru_wen & (((icache_lru_wsel[0] | icache_lru_wsel[1]) ? (icache_lru_wsel[0] ? icache_lru0[icache_lru_windex] : icache_lru1[icache_lru_windex]) : (icache_lru_wsel[2] ? icache_lru2[icache_lru_windex] : icache_lru3[icache_lru_windex])) != 2'b11)) begin
                icache_lru0[icache_lru_windex]<=icache_lru_wsel[0] ? 2'b11 : {&icache_lru0[icache_lru_windex],icache_lru0[icache_lru_windex][1] & ~icache_lru0[icache_lru_windex][0]};
                icache_lru1[icache_lru_windex]<=icache_lru_wsel[1] ? 2'b11 : {&icache_lru1[icache_lru_windex],icache_lru1[icache_lru_windex][1] & ~icache_lru1[icache_lru_windex][0]};
                icache_lru2[icache_lru_windex]<=icache_lru_wsel[2] ? 2'b11 : {&icache_lru2[icache_lru_windex],icache_lru2[icache_lru_windex][1] & ~icache_lru2[icache_lru_windex][0]};
                icache_lru3[icache_lru_windex]<=icache_lru_wsel[3] ? 2'b11 : {&icache_lru3[icache_lru_windex],icache_lru3[icache_lru_windex][1] & ~icache_lru3[icache_lru_windex][0]};
            end
        end
    end



    //preFetch/Fetch流水线寄存器
    //当其改变时，可能还在处理其它块的miss，此时需要等待
    //当两个都读取到时，且此时buffer未满，立刻流出
    //icache_rdata视作其一部分
    reg[31:0] FetchMid_PC0;
    reg[31:0] FetchMid_PC1;
    reg FetchMid_valid0;        //这是地址的valid，不是cache的
    reg FetchMid_valid1;        
    reg[31:0] FetchMid_paddr;   //第0路，用于比较tag
    reg[19:0] FetchMid_tag0[0:3];
    reg[19:0] FetchMid_tag1[0:3];
    reg[3:0] FetchMid_cachevalid0;
    reg[3:0] FetchMid_cachevalid1;
    reg[3:0] FetchMid_replace0;  //提前计算好若miss则替换哪个
    reg[3:0] FetchMid_replace1;  //提前计算好若miss则替换哪个
    reg[63:0] FetchMid_RAS;
    reg FetchMid_predict0;
    reg FetchMid_predict1;
    reg[31:0] FetchMid_predict_target0;
    reg[31:0] FetchMid_predict_target1;
    //icache维护，当flush时设置，平常直接置0
    reg FetchMid_icache_clear_en;
    reg FetchMid_icache_index;
    reg[31:0] FetchMid_icache_addr; //物理地址
    //异常检测，当其中之一出问题直接流出
    reg FetchMid_tlbmiss;
    reg FetchMid_tlbinvalid;
    reg FetchMid_addrerror;
    wire FetchMid_hasexception=FetchMid_addrerror | FetchMid_tlbinvalid | FetchMid_tlbmiss;
    //数据捕获支持：当此时axi总线上正好是PC0/PC1的数据，那么就直接捕获
    //注意：在进入miss处理状态时，如果其中一个hit，那么在这个上升沿捕获它！
    reg[31:0] FetchMid_catch0;
    reg[31:0] FetchMid_catch1;
    reg FetchMid_iscatched0;
    reg FetchMid_iscatched1;    //当流水线寄存器更新时，一定要清0
    reg FetchMid_canceled;
    reg FetchMid_uncached;

    //处理miss块时，一定先处理地址0的miss
    //若FetchMid的地址恰好就是当前正在处理的miss块，满足以下几个条件之一可以流出：
    //1.仅地址0有效且块偏移0<当前读地址
    //2.地址1有效且块偏移1<当前读地址且当前正在处理地址1的miss
    //输出的数据若iscatched有效则使用catch数据，否则一定可以选路（因为在数据读取之前已经改了元数据）
    //对于uncached地址，一定要采取数据捕获，并且arlen可以取2

    wire Fetch_busy;    //传递给preFetch的阻塞信号（但优先级比flush低），不可更新PC和FetchMid
    
    //访存所需reg
    reg[2:0] miss_state;
    wire[2:0] state=miss_state;
    reg[31:0] miss_vaddr;   //仅对cached地址有效，正在处理miss的虚拟地址，用于确认cache块
    reg[31:0] miss_paddr;   //用于更新tag
    reg[31:0] miss_vaddr1;
    reg[31:0] miss_paddr1;
    reg miss_uncached1;
    reg miss_uncached;
    reg miss_valid1;        //无论如何，地址1都要缓存到vaddr1，但它不一定miss
    //当处理完地址0的miss时，将地址1移至miss_vaddr
    //这样所有的miss操作都以miss_vaddr为准

    reg[9:0] miss_ptr;      //块偏移
    reg[3:0] miss_sel;      //选路（对于uncached要置0）
    reg[3:0] miss_sel1;
    //注意：对于icache维护，也要复用它们
    assign icache_wen=miss_sel & {4{rvalid & rready}};
    assign icache_rden=~Fetch_busy;
    assign icache_wdata=rdata;
    assign icache_waddr=miss_ptr;

    wire[$clog2(`ICache_index_SIZE) - 1:0] Fetch_index0=FetchMid_PC0[11:(12 - $clog2(`ICache_index_SIZE))];
    wire[$clog2(`ICache_index_SIZE) - 1:0] Fetch_index1=FetchMid_PC1[11:(12 - $clog2(`ICache_index_SIZE))];
    
    wire Fetch_uncached=FetchMid_uncached;//(FetchMid_PC0[31:29] == 3'b101);    //若地址0为uncached，则地址1一定uncached

    //state: 0(idle), 1(改信息)，2(arvalid=1, wait for arready)，3(rready=1, wait for rvalid & rlast, read data)
    //state: 4(改信息), 5(arvalid=1, wait for arready), 6(rready=1, wait for rvalid & rlast, read data)
    assign arvalid=(miss_state == 2) | (miss_state == 5);
    assign rready=(miss_state == 3) | (miss_state == 6);
    assign arid=0;
    assign arsize=2;
    assign arburst=2'b01;
    assign arlock=0;
    assign arcache=0;
    assign arprot=0;
    assign arlen=Fetch_uncached ? ((miss_valid1 | ~FetchMid_valid1) ? 0 : 1) : (`ICache_block_WORDS - 1);
    assign araddr={miss_paddr[31:($clog2(`ICache_block_WORDS) + 2)],Fetch_uncached ? miss_paddr[$clog2(`ICache_block_WORDS) + 1:0] : {($clog2(`ICache_block_WORDS) + 2){1'b0}}};
    
    //命中判断逻辑
    wire[3:0] hit0;
    assign hit0[0]=(FetchMid_paddr[31:12] == FetchMid_tag0[0]) & FetchMid_cachevalid0[0] & ~Fetch_uncached;
    assign hit0[1]=(FetchMid_paddr[31:12] == FetchMid_tag0[1]) & FetchMid_cachevalid0[1] & ~Fetch_uncached;
    assign hit0[2]=(FetchMid_paddr[31:12] == FetchMid_tag0[2]) & FetchMid_cachevalid0[2] & ~Fetch_uncached;
    assign hit0[3]=(FetchMid_paddr[31:12] == FetchMid_tag0[3]) & FetchMid_cachevalid0[3] & ~Fetch_uncached;
    wire[3:0] hit1;
    assign hit1[0]=(FetchMid_paddr[31:12] == FetchMid_tag1[0]) & FetchMid_cachevalid1[0] & ~Fetch_uncached;
    assign hit1[1]=(FetchMid_paddr[31:12] == FetchMid_tag1[1]) & FetchMid_cachevalid1[1] & ~Fetch_uncached;
    assign hit1[2]=(FetchMid_paddr[31:12] == FetchMid_tag1[2]) & FetchMid_cachevalid1[2] & ~Fetch_uncached;
    assign hit1[3]=(FetchMid_paddr[31:12] == FetchMid_tag1[3]) & FetchMid_cachevalid1[3] & ~Fetch_uncached;
    
    wire real_hit=(|hit0) & ((|hit1) | ~FetchMid_valid1);   //两路都命中
    
    wire[31:0] icache_inst0=(hit0[0] | hit0[1]) ? (hit0[0] ? icache_rdata[0][0] : icache_rdata[1][0]) : (hit0[2] ? icache_rdata[2][0] : icache_rdata[3][0]);
    wire[31:0] icache_inst1=(hit1[0] | hit1[1]) ? (hit1[0] ? icache_rdata[0][1] : icache_rdata[1][1]) : (hit1[2] ? icache_rdata[2][1] : icache_rdata[3][1]);
    
    assign Fetch_busy=buffer_full | ((|state) & ~((state == 1) & FetchMid_icache_clear_en)) | ((state == 0) & (~FetchMid_hasexception) & (FetchMid_icache_clear_en | ((~FetchMid_canceled) & (FetchMid_valid0 & (~(FetchMid_iscatched0 & (FetchMid_iscatched1 | ~FetchMid_valid1))) & ~real_hit))));

    //icache-hit指令选路
    wire[3:0] ichit;
    wire[$clog2(`ICache_index_SIZE) - 1:0] icindex=FetchMid_icache_addr[11:(12 - $clog2(`ICache_index_SIZE))];
    assign ichit[0]=(FetchMid_icache_index ? (FetchMid_icache_addr[13:12] == 0) : (icache_tag0[icindex] == FetchMid_icache_addr[31:12]));
    assign ichit[1]=(FetchMid_icache_index ? (FetchMid_icache_addr[13:12] == 1) : (icache_tag1[icindex] == FetchMid_icache_addr[31:12]));
    assign ichit[2]=(FetchMid_icache_index ? (FetchMid_icache_addr[13:12] == 2) : (icache_tag2[icindex] == FetchMid_icache_addr[31:12]));
    assign ichit[3]=(FetchMid_icache_index ? (FetchMid_icache_addr[13:12] == 3) : (icache_tag3[icindex] == FetchMid_icache_addr[31:12]));
    
    wire entermiss1=rlast & rvalid & (state == 3) & miss_valid1; //是否要进入miss1
    //访存
    always@(posedge clk) begin
        if(~resetn) begin
            miss_state<=0;
            miss_sel<=0;
            miss_sel1<=0;
            miss_vaddr<=0;
            miss_paddr<=0;
            miss_vaddr1<=0;
            miss_paddr1<=0;
            miss_valid1<=0;
            miss_ptr<=0;
            miss_uncached<=0;
            miss_uncached1<=0;
        end
        else begin
            if(rready & rvalid)
                miss_ptr<=miss_ptr + 1;
            else if((state == 1) | (state == 4))
                miss_ptr<=Fetch_uncached ? miss_vaddr[11:2] : {miss_vaddr[11:(2 + $clog2(`ICache_block_WORDS))],{$clog2(`ICache_block_WORDS){1'b0}}};
            
            if((state == 0) | entermiss1) begin
                miss_vaddr<=(state == 3) ? miss_vaddr1 : ((~(|hit0)) ? FetchMid_PC0 : FetchMid_PC1);
                miss_uncached<=(state == 3) ? miss_uncached1 : FetchMid_uncached;
                miss_sel<=(state == 3) ? miss_sel1 : (FetchMid_icache_clear_en ? ichit : ((~(|hit0)) ? FetchMid_replace0 : FetchMid_replace1));
                miss_paddr<=(state == 3) ? miss_paddr1 : ((~(|hit0)) ? FetchMid_paddr : {FetchMid_paddr[31:12],FetchMid_PC1[11:0]});
            end
            if(state == 0) begin
                miss_vaddr1<=FetchMid_PC1;
                miss_uncached1<=FetchMid_uncached;
                miss_sel1<=FetchMid_replace1;
                miss_paddr1<={FetchMid_paddr[31:12],FetchMid_PC1[11:0]};
                miss_valid1<=FetchMid_valid1 & (Fetch_uncached ? ((FetchMid_PC0 + 4) != FetchMid_PC1) :((FetchMid_PC0[11:($clog2(`ICache_block_WORDS) + 2)] != FetchMid_PC1[11:($clog2(`ICache_block_WORDS) + 2)]) & (~(|hit0)) & (~(|hit1))));
            end

            case(miss_state)
            0:  miss_state<=((~FetchMid_hasexception) & (FetchMid_icache_clear_en | (~FetchMid_canceled) & (FetchMid_valid0 & (~(FetchMid_iscatched0 & (FetchMid_iscatched1 | ~FetchMid_valid1))) & ~real_hit)) & ~flush) ? 1 : 0;
            1:  miss_state<=FetchMid_icache_clear_en ? 0 : 2;
            2:  miss_state<=arready ? 3 : 2;
            3:  miss_state<=(rvalid & rlast) ? (miss_valid1 ? 4 : 0) : 3;
            4:  miss_state<=5;
            5:  miss_state<=arready ? 6 : 5;
            6:  miss_state<=(rvalid & rlast) ? 0 : 6;
            default: miss_state<=0;
            endcase
        end
    end
    

    //修改信息
    //wire miss_uncached=(miss_vaddr[31:29] == 3'b101);
    wire[$clog2(`ICache_index_SIZE) - 1:0] miss_index=miss_vaddr[11:(12 - $clog2(`ICache_index_SIZE))];
    assign icache_valid_wen=((state == 1) | (state == 4)) & (FetchMid_icache_clear_en | ~miss_uncached);
    assign icache_valid_wdata=~FetchMid_icache_clear_en;
    assign icache_valid_windex=FetchMid_icache_clear_en ? icindex : miss_index;
    assign icache_valid_wsel=miss_sel;
    assign icache_tag_wen=((state == 1) | (state == 4)) & (~FetchMid_icache_clear_en) & ~miss_uncached;
    assign icache_tag_windex=miss_index;
    assign icache_tag_wsel=miss_sel;
    assign icache_tag_wtag=miss_paddr[31:12];
    assign icache_lru_wen=((state == 0) & |hit0) | (((state == 1) | (state == 4)) & ~miss_uncached);
    assign icache_lru_windex=(state == 0) ? Fetch_index0 : miss_index;
    assign icache_lru_wsel=(state == 0) ? hit0 : miss_sel;

    //数据捕获
    always@(posedge clk) begin
        if(~resetn) begin
            FetchMid_catch0<=0;
            FetchMid_catch1<=0;
            FetchMid_iscatched0<=0;
            FetchMid_iscatched1<=0;
        end
        else begin
            //注意：记得在state从0变1时捕获自己的BRAM输出端
            if(flush | (~Fetch_busy) | (state == 0) | (rready & rvalid & (FetchMid_PC0[31:12] == miss_vaddr[31:12]) & (FetchMid_PC0[11:2] == miss_ptr)))
                FetchMid_iscatched0<=(((state == 0) & |hit0) | (|state)) & ~(flush | ~Fetch_busy);
            if(flush | (~Fetch_busy) | (state == 0) | (rready & rvalid & (FetchMid_PC1[31:12] == miss_vaddr[31:12]) & (FetchMid_PC1[11:2] == miss_ptr)))
                FetchMid_iscatched1<=(((state == 0) & FetchMid_valid1 & |hit1) | (|state)) & ~(flush | ~Fetch_busy);
            if((rready & rvalid & (FetchMid_PC0[31:12] == miss_vaddr[31:12]) & (FetchMid_PC0[11:2] == miss_ptr)) | (state == 0))
                FetchMid_catch0<=(state == 0) ? icache_inst0 : rdata;
            if((rready & rvalid & (FetchMid_PC1[31:12] == miss_vaddr[31:12]) & (FetchMid_PC1[11:2] == miss_ptr)) | (state == 0))
                FetchMid_catch1<=(state == 0) ? icache_inst1 : rdata;
        end
    end

    //preFetch
    reg[31:0] PC0,PC1;   //真正的PC
    wire valid1=(PC0[31:12] == PC1[31:12]); //第1路有效当且仅当两路位于同一页
    assign vaddr0=preFetch_PC0;
    assign vaddr1=preFetch_PC1;
    wire[$clog2(`ICache_index_SIZE) - 1:0] preFetch_index0=vaddr0[11:(12 - $clog2(`ICache_index_SIZE))];
    wire[$clog2(`ICache_index_SIZE) - 1:0] preFetch_index1=vaddr1[11:(12 - $clog2(`ICache_index_SIZE))];
    wire v0=icache_valid0[preFetch_index0];
    wire v1=icache_valid1[preFetch_index0];
    wire v2=icache_valid2[preFetch_index0];
    wire v3=icache_valid3[preFetch_index0];
    wire[3:0] i0_rep;
    assign i0_rep[0]=~v0;
    assign i0_rep[1]=v0 & (~v1);
    assign i0_rep[2]=v0 & v1 & (~v2);
    assign i0_rep[3]=v0 & v1 & v2 & (~v3);
    wire w0=icache_valid0[preFetch_index1];
    wire w1=icache_valid1[preFetch_index1];
    wire w2=icache_valid2[preFetch_index1];
    wire w3=icache_valid3[preFetch_index1];
    wire[3:0] i1_rep;
    assign i1_rep[0]=~w0;
    assign i1_rep[1]=w0 & (~w1);
    assign i1_rep[2]=w0 & w1 & (~w2);
    assign i1_rep[3]=w0 & w1 & w2 & (~w3);
    wire[3:0] i0_rep1;
    assign i0_rep1[0]=~(|icache_lru0[preFetch_index0]);
    assign i0_rep1[1]=(|icache_lru0[preFetch_index0]) & ~(|icache_lru1[preFetch_index0]);
    assign i0_rep1[2]=(|icache_lru0[preFetch_index0]) & (|icache_lru1[preFetch_index0]) & ~(|icache_lru2[preFetch_index0]);
    assign i0_rep1[3]=(|icache_lru0[preFetch_index0]) & (|icache_lru1[preFetch_index0]) & (|icache_lru2[preFetch_index0]);
    wire[3:0] i1_rep1;
    assign i1_rep1[0]=~(|icache_lru0[preFetch_index1]);
    assign i1_rep1[1]=(|icache_lru0[preFetch_index1]) & ~(|icache_lru1[preFetch_index1]);
    assign i1_rep1[2]=(|icache_lru0[preFetch_index1]) & (|icache_lru1[preFetch_index1]) & ~(|icache_lru2[preFetch_index1]);
    assign i1_rep1[3]=(|icache_lru0[preFetch_index1]) & (|icache_lru1[preFetch_index1]) & (|icache_lru2[preFetch_index1]);
    

    always@(posedge clk) begin
        if(~resetn) begin
            preFetch_PC0<=0;
            preFetch_PC1<=0;
            preFetch_valid0<=0;
            preFetch_valid1<=0;
            preFetch_RAS<=0;
            preFetch_predict_target0<=0;
            preFetch_predict_target1<=0;
            preFetch_predict0<=0;
            preFetch_predict1<=0;
            PC0<=32'hBFC00000;
            PC1<=32'hBFC00004;
            FetchMid_PC0<=0;
            FetchMid_PC1<=0;
            FetchMid_addrerror<=0;
            FetchMid_cachevalid0<=0;
            FetchMid_cachevalid1<=0;
            FetchMid_valid0<=0;
            FetchMid_valid1<=0;
            FetchMid_paddr<=0;
            FetchMid_tag0[0]<=0;
            FetchMid_tag0[1]<=0;
            FetchMid_tag0[2]<=0;
            FetchMid_tag0[3]<=0;
            FetchMid_tag1[0]<=0;
            FetchMid_tag1[1]<=0;
            FetchMid_tag1[2]<=0;
            FetchMid_tag1[3]<=0;
            FetchMid_replace0<=0;
            FetchMid_replace1<=0;
            FetchMid_RAS<=0;
            FetchMid_predict0<=0;
            FetchMid_predict1<=0;
            FetchMid_predict_target0<=0;
            FetchMid_predict_target1<=0;
            FetchMid_icache_clear_en<=0;
            FetchMid_icache_index<=0;
            FetchMid_icache_addr<=0;
            FetchMid_tlbinvalid<=0;
            FetchMid_tlbmiss<=0;
            FetchMid_canceled<=0;
            FetchMid_uncached<=0;
        end
        else begin
            if(flush | (~Fetch_busy)) begin
                //PC<=flush ? flush_target : (predict_jump ? predict_jump_target : (vaddr + (valid1 ? 8 : 4)));
                PC0<=flush ? flush_target : ((~valid1) ? PC1 : ((predict_jump & ~predict_isinst1) ? predict_target0 : (PC1 + 4)));
                PC1<=flush ? (flush_target + 4) : (predict_jump ? ((predict_isinst1 | ~valid1) ? predict_jump_target : (predict_target0 + 4)) : (PC1 + (valid1 ? 8 : 4)));
            end
            if(flush | (~Fetch_busy)) begin
                FetchMid_addrerror<=(~flush) & ((|preFetch_PC0[1:0]) | tlb_error);
                FetchMid_tlbinvalid<=~tlb_isvalid;
                FetchMid_tlbmiss<=~tlb_isexist;
                FetchMid_valid0<=(~flush) & preFetch_valid0;
                FetchMid_valid1<=(~flush) & preFetch_valid1;
                preFetch_valid0<=(~flush);
                preFetch_valid1<=(~flush) & valid1;
                FetchMid_canceled<=flush & Fetch_busy;
            end
            if(icache_clear_en | (~Fetch_busy)) begin
                FetchMid_icache_clear_en<=icache_clear_en;
                FetchMid_icache_addr<=icache_addr;
                FetchMid_icache_index<=icache_index;
            end
            if(~Fetch_busy) begin
                preFetch_PC0<=PC0;
                preFetch_PC1<=PC1;
                FetchMid_PC0<=vaddr0;
                FetchMid_PC1<=vaddr1;
                FetchMid_paddr<=tlb_paddr;
                FetchMid_uncached<=tlb_uncached;
                FetchMid_tag0[0]<=icache_tag0[preFetch_index0];
                FetchMid_tag0[1]<=icache_tag1[preFetch_index0];
                FetchMid_tag0[2]<=icache_tag2[preFetch_index0];
                FetchMid_tag0[3]<=icache_tag3[preFetch_index0];
                FetchMid_tag1[0]<=icache_tag0[preFetch_index1];
                FetchMid_tag1[1]<=icache_tag1[preFetch_index1];
                FetchMid_tag1[2]<=icache_tag2[preFetch_index1];
                FetchMid_tag1[3]<=icache_tag3[preFetch_index1];
                FetchMid_cachevalid0<={v3,v2,v1,v0};
                FetchMid_cachevalid1<={w3,w2,w1,w0};
                FetchMid_replace0<=/*(vaddr0[31:29] == 3'b101)*/tlb_uncached ? 0 : ((v0 & v1 & v2 & v3) ? i0_rep1 : i0_rep);
                FetchMid_replace1<=/*(vaddr1[31:29] == 3'b101)*/tlb_uncached ? 0 : ((w0 & w1 & w2 & w3) ? i1_rep1 : i1_rep);
                preFetch_RAS<=predict_oldRAS;
                preFetch_predict0<=predict_jump & ~predict_isinst1;
                preFetch_predict1<=predict_jump & predict_isinst1;
                preFetch_predict_target0<=predict_jump_target;
                preFetch_predict_target1<=predict_jump_target;
                FetchMid_RAS<=preFetch_RAS;
                FetchMid_predict0<=preFetch_predict0;
                FetchMid_predict1<=preFetch_predict1;
                FetchMid_predict_target0<=preFetch_predict_target0;
                FetchMid_predict_target1<=preFetch_predict_target1;
            end
        end
    end
    
    //输出
    assign fetch_inst0=FetchMid_iscatched0 ? FetchMid_catch0 : icache_inst0;
    assign fetch_inst1=FetchMid_iscatched1 ? FetchMid_catch1 : icache_inst1;
    assign fetch_valid0=FetchMid_valid0;
    assign fetch_valid1=FetchMid_valid1;
    assign fetch_PC0=FetchMid_PC0;
    assign fetch_PC1=FetchMid_PC1;
    assign fetch_predict0=FetchMid_predict0;
    assign fetch_predict1=FetchMid_predict1;
    assign fetch_predict_target0=FetchMid_predict_target0;
    assign fetch_predict_target1=FetchMid_predict_target1;
    assign fetch_excode0=(FetchMid_valid0 & FetchMid_hasexception) ? (FetchMid_addrerror ? `E_read_addr_error : (FetchMid_tlbmiss ? `E_read_tlb_miss : `E_read_tlb_invalid)) : 0;
    assign fetch_excode1=0;
    assign fetch_RAS=FetchMid_RAS;
    assign fetch_output_en=FetchMid_valid0 & ~Fetch_busy;
    
    assign tlb_vaddr=preFetch_PC0;

    assign predict_rden=(~Fetch_busy);
    assign predict_PC0=PC0;
    assign predict_PC1=PC1;
    assign predict_PC1_valid=valid1;

endmodule