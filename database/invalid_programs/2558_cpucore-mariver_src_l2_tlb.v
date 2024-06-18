// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    二级TLB，仅1各模块，体系结构可见，64条目
*/

module l2_tlb(
    input           clk,
    input           resetn,
    //来自CP0的寄存器，任何时刻都将寄存器的值捕获到自身模块中
    input[31:0]     cp0_entryhi,
    input[31:0]     cp0_entrylo0,
    input[31:0]     cp0_entrylo1,
    input[5:0]      cp0_index,
    input[5:0]      cp0_random,
    input[15:0]     cp0_pagemask,
    //地址查询端口
    input           qry_en,
    input[31:0]     qry_vaddr,
    input           qry_useentryhi, //TLBP支持
    output[78:0]    qry_tlb,        //79位TLB表项，提供给L1 TLB
    output          qry_isexist,
    output[5:0]     qry_index,
    output          qry_done,
    //基于index的查询端口（当index被修改后即自动读出了）
    output[78:0]    qryind_tlb,     //提供给CP0令其修改Entry
    //修改端口
    input           tlbwi_en,
    input           tlbwr_en    //这俩使能是独立的，无需提供CP0，因为早已捕获在内了
    );

    /*
        cycle 0: qry_en=1
        cycle 1: ptr=0
        cycle 2: ptr=1, tlbs=col[0]
        ...
        cycle 8: ptr=7, tlbs=col[6], start=1
        cycle 9: ptr=7, tlbs=col[7], start=0, done0=1, done1=0;
        cycle 10:ptr=7, get result, done0=0, done1=1
        10拍后输出查询结果
    */

    reg[31:0] entryhi,entrylo0,entrylo1;
    reg[5:0] index,random;
    reg[19:0] pagemask;
    always@(posedge clk) begin
        entryhi<=cp0_entryhi;
        entrylo0<=cp0_entrylo0;
        entrylo1<=cp0_entrylo1;
        index<=cp0_index;
        random<=cp0_random;
        pagemask<={4'b1111,~cp0_pagemask};
    end

    /*
    entryhi[31:13]=vpn2, [7:0]=asid,
    entrylo[25:6]=pfn, [5:3]=c, [2]=d, [1]=v, [0]=g
    */

    wire[78:0] newtlb={entryhi[31:13],entryhi[7:0],entrylo1[25:0],entrylo0[25:0]};

    //物理TLB表项，8*8矩阵，仅用于按地址查询（而不是按index读）
    //每个TLB表项组织为26*2+8+19=79位
    //[0]=g0, [1]=v0, [2]=d0, [5:3]=c0, [25:6]=pfn0,
    //[26]=g1, [27]=v1, [28]=d1, [31:29]=c1, [51:32]=pfn1
    //[59:52]=asid, [78:60]=vpn2
    reg[78:0] tlb0[0:7];    //0~7
    reg[78:0] tlb1[0:7];    //8~15
    reg[78:0] tlb2[0:7];    //16~23
    reg[78:0] tlb3[0:7];    
    reg[78:0] tlb4[0:7];    
    reg[78:0] tlb5[0:7];    
    reg[78:0] tlb6[0:7];    
    reg[78:0] tlb7[0:7];  
    reg[78:0] tlbs[0:7];        //缓存读出来的8行TLB表项
    reg[78:0] tlb_phy[0:63];    //用于TLBR
    reg[78:0] tlbr_result;      //预先读取出的TLBR的结果  

    wire[5:0] windex=tlbwi_en ? index : random;

    assign qryind_tlb=tlbr_result;
    always@(posedge clk) begin
        tlbr_result<=tlb_phy[index];
    end
    always@(posedge clk)
        if(tlbwi_en | tlbwr_en)
            tlb_phy[windex]<=newtlb;
    genvar i;
    generate
        for(i=0; i < 64; i=i + 1) begin
            initial begin
                tlb_phy[i]=0;
            end
        end
    endgenerate
    
    reg[2:0] ptr;   //查询指针
    reg[2:0] oldptr;
    reg[5:0] findindex; //中途找到的TLB index
    reg[78:0] findtlb;  //中途找到的TLB表项
    reg isfind;
    reg[18:0] findvpn;
    reg start,done0,done1;
    assign qry_done=done1;

    assign qry_tlb=findtlb;
    assign qry_isexist=isfind;
    assign qry_index=findindex;

    always@(posedge clk) begin
        oldptr<=ptr;
        tlbs[0]<=tlb0[ptr];
        tlbs[1]<=tlb1[ptr];
        tlbs[2]<=tlb2[ptr];
        tlbs[3]<=tlb3[ptr];
        tlbs[4]<=tlb4[ptr];
        tlbs[5]<=tlb5[ptr];
        tlbs[6]<=tlb6[ptr];
        tlbs[7]<=tlb7[ptr];
    end

    wire[7:0] line_wen;
    wire[7:0] hit;

    generate
        for(i=0; i < 8; i=i + 1) begin
            assign line_wen[i]=(tlbwi_en | tlbwr_en) & (windex[5:3] == i);
            assign hit[i]=((tlbs[i][78:60] & pagemask[19:1]) == (findvpn & pagemask[19:1])) & ((tlbs[i][0] & tlbs[i][26]) | (tlbs[i][59:52] == entryhi[7:0]));
            initial begin
                tlb0[i]=0;
                tlb1[i]=0;
                tlb2[i]=0;
                tlb3[i]=0;
                tlb4[i]=0;
                tlb5[i]=0;
                tlb6[i]=0;
                tlb7[i]=0;
            end
        end
    endgenerate

    always@(posedge clk) begin
        if(line_wen[0])
            tlb0[windex[2:0]]<=newtlb;
        if(line_wen[1])
            tlb1[windex[2:0]]<=newtlb;
        if(line_wen[2])
            tlb2[windex[2:0]]<=newtlb;
        if(line_wen[3])
            tlb3[windex[2:0]]<=newtlb;
        if(line_wen[4])
            tlb4[windex[2:0]]<=newtlb;
        if(line_wen[5])
            tlb5[windex[2:0]]<=newtlb;
        if(line_wen[6])
            tlb6[windex[2:0]]<=newtlb;
        if(line_wen[7])
            tlb7[windex[2:0]]<=newtlb;
    end

    always@(posedge clk) begin
        if(~resetn) begin
            ptr<=7;
            findindex<=0;
            findtlb<=0;
            isfind<=0;
            findvpn<=0;
            start<=0;
            done0<=0;
            done1<=0;
        end
        else begin
            if(qry_en)
                ptr<=0;
            else if(ptr != 7)
                ptr<=ptr + 1;
            if(qry_en)
                isfind<=0;
            else
                isfind<=isfind | (|hit);
            if(qry_en)
                findvpn<=qry_useentryhi ? entryhi[31:13] : qry_vaddr[31:13];
            if(~isfind) begin
                findindex<={(|hit[3:0]) ? ((|hit[1:0]) ? (hit[0] ? 3'd0 : 3'd1) : (hit[2] ? 3'd2 : 3'd3)) : ((|hit[5:4]) ? (hit[4] ? 3'd4 : 3'd5) : (hit[6] ? 3'd6 : 3'd7)),oldptr};
                findtlb<=(|hit[3:0]) ? ((|hit[1:0]) ? (hit[0] ? tlbs[0] : tlbs[1]) : (hit[2] ? tlbs[2] : tlbs[3])) : ((|hit[5:4]) ? (hit[4] ? tlbs[4] : tlbs[5]) : (hit[6] ? tlbs[6] : tlbs[7]));
            end
            if(qry_en)
                start<=1;
            else if(ptr == 7)
                start<=0;
            if(qry_en | done0)
                done0<=0;
            else if((ptr == 7) & start)
                done0<=1;
            if(qry_en)
                done1<=0;
            else
                done1<=done0;
        end
    end

endmodule