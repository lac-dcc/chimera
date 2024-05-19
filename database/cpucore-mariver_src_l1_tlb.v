// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    一级TLB，指令和数据各一个模块，4条目
*/

module l1_tlb
    #(parameter isdata = 0)
    (
    input           clk,
    input           resetn,
    //指令/数据的MMU交互端口
    input[31:0]     mmu_vaddr,
    output[31:0]    mmu_paddr,
    output          mmu_isexist,
    output          mmu_isvalid,
    output          mmu_isdirty,
    output          mmu_uncached,   //注意！！这个是针对所有地址的，不管其是否mapped
    output          mmu_error,      //注意！！这个是针对所有地址的，并且仅进行访问权限检测
    //载入L1 TLB的写端口
    input[78:0]     ld_tlb,     //79位TLB表项
    input[5:0]      ld_index,
    input           ld_en,
    //TLBWI/TLBWR时的更新端口
    input[31:0]     cp0_entryhi,
    input[31:0]     cp0_entrylo0,
    input[31:0]     cp0_entrylo1, 
    input[5:0]      cp0_random,   
    input[5:0]      cp0_index,       //直接来自CP0，但自己一直捕获
    input[2:0]      cp0_config0_k0,
    input[15:0]     cp0_pagemask,
    input[1:0]      cp0_status_ksu,
    input           tlbwi_en,
    input           tlbwr_en
    );

    reg[78:0] tlb[0:`L1_TLB_SIZE - 1];
    reg[5:0] srcindex[0:`L1_TLB_SIZE - 1];         //对应L2 TLB中的原始地址
    reg[1:0] fifobit[0:`L1_TLB_SIZE - 1];          //用于FIFO替换
    reg[`L1_TLB_SIZE - 1:0] asid_valid;            //根据G位和ASID查询的结果

    reg[31:0] entryhi,entrylo0,entrylo1;
    reg[5:0] random,index;
    reg[2:0] config0_k0;
    reg[19:0] pagemask;             //这个是将CP0.PageMask处理后的！
    reg[2:0] page_mode;
    reg[1:0] status_ksu;
    always@(posedge clk) begin
        entryhi<=cp0_entryhi;
        entrylo0<=cp0_entrylo0;
        entrylo1<=cp0_entrylo1;
        index<=cp0_index;
        random<=cp0_random;
        config0_k0<=cp0_config0_k0;
        pagemask<={4'b1111,~cp0_pagemask};
        page_mode<=cp0_pagemask[7] ? (cp0_pagemask[11] ? (cp0_pagemask[13] ? 7 : 6) : (cp0_pagemask[9] ? 5 : 4)) : (cp0_pagemask[3] ? (cp0_pagemask[5] ? 3 : 2) : (cp0_pagemask[1] ? 1 : 0));
        status_ksu<=cp0_status_ksu;
    end
    wire[78:0] newtlb={entryhi[31:13],entryhi[7:0],entrylo1[25:0],entrylo0[25:0]};

    /*
    entryhi[31:13]=vpn2, [7:0]=asid,
    entrylo[25:6]=pfn, [5:3]=c, [2]=d, [1]=v, [0]=g
    */
    //[0]=g0, [1]=v0, [2]=d0, [5:3]=c0, [25:6]=pfn0,
    //[26]=g1, [27]=v1, [28]=d1, [31:29]=c1, [51:32]=pfn1
    //[59:52]=asid, [78:60]=vpn2

    reg pabit;
    always@(*) begin
        case(page_mode)
        0:  pabit=mmu_vaddr[12];
        1:  pabit=mmu_vaddr[14];
        2:  pabit=mmu_vaddr[16];
        3:  pabit=mmu_vaddr[18];
        4:  pabit=mmu_vaddr[20];
        5:  pabit=mmu_vaddr[22];
        6:  pabit=mmu_vaddr[24];
        7:  pabit=mmu_vaddr[26];
        default:    pabit=0;
        endcase
    end

    wire unmapped=mmu_vaddr[31] & ~mmu_vaddr[30];
    wire[`L1_TLB_SIZE - 1:0] hit;
    assign mmu_isexist=unmapped | (|hit);
    wire[19:0] sel_ppn;
    wire[2:0] sel_c0,sel_c1;

    generate
        if(`L1_TLB_SIZE == 3) begin
            assign mmu_isdirty=unmapped | (|(hit & (pabit ? {tlb[2][28],tlb[1][28],tlb[0][28]} : {tlb[2][2],tlb[1][2],tlb[0][2]})));
            assign mmu_isvalid=unmapped | (|(hit & (pabit ? {tlb[2][27],tlb[1][27],tlb[0][27]} : {tlb[2][1],tlb[1][1],tlb[0][1]})));
            assign sel_ppn=(pabit ? ((~hit[2]) ? (hit[0] ? tlb[0][51:32] : tlb[1][51:32]) : tlb[2][51:32]) :
                ((~hit[2]) ? (hit[0] ? tlb[0][25:6] : tlb[1][25:6]) : tlb[2][25:6]));
            assign sel_c0=(~hit[2]) ? (hit[0] ? tlb[0][5:3] : tlb[1][5:3]) : tlb[2][5:3];
            assign sel_c1=(~hit[2]) ? (hit[0] ? tlb[0][31:29] : tlb[1][31:29]) : tlb[2][31:29];
        end
        else if(`L1_TLB_SIZE == 4) begin
            assign mmu_isdirty=unmapped | (|(hit & (pabit ? {tlb[3][28],tlb[2][28],tlb[1][28],tlb[0][28]} : {tlb[3][2],tlb[2][2],tlb[1][2],tlb[0][2]})));
            assign mmu_isvalid=unmapped | (|(hit & (pabit ? {tlb[3][27],tlb[2][27],tlb[1][27],tlb[0][27]} : {tlb[3][1],tlb[2][1],tlb[1][1],tlb[0][1]})));
            assign sel_ppn=(pabit ? ((|hit[1:0]) ? (hit[0] ? tlb[0][51:32] : tlb[1][51:32]) : (hit[2] ? tlb[2][51:32] : tlb[3][51:32])) :
                ((|hit[1:0]) ? (hit[0] ? tlb[0][25:6] : tlb[1][25:6]) : (hit[2] ? tlb[2][25:6] : tlb[3][25:6])));
            assign sel_c0=(|hit[1:0]) ? (hit[0] ? tlb[0][5:3] : tlb[1][5:3]) : (hit[2] ? tlb[2][5:3] : tlb[3][5:3]);
            assign sel_c1=(|hit[1:0]) ? (hit[0] ? tlb[0][31:29] : tlb[1][31:29]) : (hit[2] ? tlb[2][31:29] : tlb[3][31:29]);
        end
    endgenerate
    

    
    wire[19:0] sel_pa=(sel_ppn & pagemask) | (mmu_vaddr[31:12] & ~pagemask);
    
    assign mmu_paddr={unmapped ? {3'b0,mmu_vaddr[28:12]} : sel_pa,mmu_vaddr[11:0]};
    
    assign mmu_uncached=(isdata ? `DCACHE_ENABLE : `ICACHE_ENABLE) ? (unmapped ? (mmu_vaddr[29] | (config0_k0 == 2)) : ((pabit ? sel_c1 : sel_c0) == 2)) : 1'b1;

    assign mmu_error=(status_ksu[1] & ~status_ksu[0]) & mmu_vaddr[31];

    wire[`L1_TLB_SIZE - 1:0] ld_sel;

    genvar i;
    generate
        for(i=0; i < `L1_TLB_SIZE; i=i + 1) begin
            assign hit[i]=((mmu_vaddr[31:13] & pagemask[19:1]) == (tlb[i][78:60] & pagemask[19:1])) & asid_valid[i];
            assign ld_sel[i]=(fifobit[i] == 2'b00);
            always@(posedge clk) begin
                if(~resetn) begin
                    asid_valid[i]<=0;
                    fifobit[i]<=i;
                    srcindex[i]<=0;
                    tlb[i]<=0;
                end
                else begin
                    if(ld_en)
                        fifobit[i]<=ld_sel[i] ? (`L1_TLB_SIZE - 1) : {&fifobit[i],fifobit[i][1] & ~fifobit[i][0]};
                    if(ld_en & ld_sel[i])
                        asid_valid[i]<=(ld_tlb[0] & ld_tlb[26]) | (ld_tlb[59:52] == entryhi[7:0]);
                    else
                        asid_valid[i]<=(tlb[i][0] & tlb[i][26]) | (tlb[i][59:52] == entryhi[7:0]);
                    if(ld_en & ld_sel[i])
                        srcindex[i]<=ld_index;
                    if((ld_en & ld_sel[i]) | (tlbwi_en & (index == srcindex[i])) | (tlbwr_en & (random == srcindex[i])))
                        tlb[i]<=(ld_en & ld_sel[i]) ? ld_tlb : newtlb;
                end
            end
        end
    endgenerate

endmodule