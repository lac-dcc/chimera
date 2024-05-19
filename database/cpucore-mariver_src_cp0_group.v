// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    CP0寄存器组模块，负责CP0的正确维护
    Update at 2023.5.15: 实现PageMask
    Update at 2023.6.24: 修改Config和Status，启用FPU
*/

module cp0_group(
    input           clk,
    input           resetn,
    //来自MDU的读端口
    input[5:0]      raddr,
    output[31:0]    rdata,
    //来自Commit的mtc0专用写端口
    input           mtc0_wen,
    input[5:0]      mtc0_waddr,
    input[31:0]     mtc0_wdata,
    //中断控制
    input[5:0]      ext_int,    //直接外中断请求
    output[7:0]     real_intr,  //经屏蔽处理后真正的中断请求
    output          exception_en,   //提供给Commit（实际上是EXL）
    //来自Commit的异常处理
    input[$clog2(`CNT_EXCEPTION) - 1:0]   excode, //最终的异常码，CP0寄存器组利用这个自我修改
    input[31:0]     exce_PC,                //引起异常的指令地址
    input           exce_isslot,            //异常指令是否在延迟槽中
    input[31:0]     exce_vaddr,             //可能引起异常的vaddr
    //eret支持
    input           eret_en,
    output[31:0]    eretaddr,               //根据EPC与标记得出的返回地址
    //TLBP/TLBR更新的新的CP0
    /*input[31:0]     EntryHi_new,
    input[31:0]     EntryLo0_new,
    input[31:0]     EntryLo1_new,
    input[31:0]     index_new, */
    input[78:0]     tlb_new,                //由L2 TLB查询后呈现(TLBR用的，qryind_tlb)
    input[5:0]      index_new,  
    input           l2_tlb_qry_isexist,
    input           tlbp_en,                //由commit提供（这个信号必须保持，直至L2 TLB查询结束）
    input           l2_tlb_qry_done,        //由L2 TLB提供，与tlbp_en一同作为使能信号        
    input           tlbr_en,
    //提供给Commit的CP0
    output[17:0]    out_cp0_ebase,
    output          out_cp0_status_bev,
    output          out_cp0_cause_iv,
    output[1:0]     status_ksu,     //检查访问权限（若EXL=1则一定为0，不管KSU是啥）
    output          cp0_en,
    output          cp1_en,
    //提供给TLB模块的CP0
    output[5:0]  tlb_index,
    output[5:0]  tlb_random,
    output[31:0]    tlb_EntryHi,    //包含了ASID
    output[31:0]    tlb_EntryLo0,
    output[31:0]    tlb_EntryLo1,
    output[2:0]     tlb_config0_k0,
    output[15:0]    tlb_pagemask    //注意：这里直接提供PageMask的原值    
    );
    //注意：这里直接默认TLB是64条目
    reg CP0_Index_P;
    reg[5:0] CP0_Index_index;
    reg[5:0] CP0_Random;
    reg[25:0] CP0_EntryLo0;
    reg[25:0] CP0_EntryLo1;
    reg[8:0] CP0_Context_PTEBase;
    reg[18:0] CP0_Context_BadVPN2;
    reg[5:0] CP0_Wired;
    reg[31:0] CP0_BadVaddr;
    reg[31:0] CP0_Count;
    reg[18:0] CP0_EntryHi_VPN2;
    reg[7:0] CP0_EntryHi_ASID;
    reg[31:0] CP0_Compare;
    reg CP0_Status_CU0;
    //Note: 这里我们挖个坑，令CU1不可取消，强制为1，是否会在linux下出奇怪的锅？
    //wire CP0_Status_CU1=1'b1;
    reg CP0_Status_CU1;

    reg CP0_Status_BEV;
    reg[5:0] CP0_Status_IM_H;
    reg[1:0] CP0_Status_IM_S;
    reg[1:0] CP0_Status_KSU;
    reg CP0_Status_EXL;
    reg CP0_Status_IE;
    reg CP0_Cause_BD;
    reg CP0_Cause_TI;
    reg CP0_Cause_IV;
    reg[5:0] CP0_Cause_IR_H;
    reg[1:0] CP0_Cause_IR_S;
    reg[4:0] CP0_Cause_ExcCode;
    reg[1:0] CP0_Cause_CE;
    reg[31:0] CP0_EPC;
    reg CP0_EPC_shouldnext;
    reg[17:0] CP0_EBase;
    reg[2:0] CP0_Config0_K0;
    reg[15:0] CP0_PageMask;

    assign out_cp0_ebase=CP0_EBase;
    assign out_cp0_status_bev=CP0_Status_BEV;
    assign out_cp0_cause_iv=CP0_Cause_IV;

    assign cp0_en=CP0_Status_EXL | (CP0_Status_KSU == 2'b00) | CP0_Status_CU0;
    assign cp1_en=CP0_Status_CU1;

    wire fpu_enabled;
`ifdef FPU_ENABLED
    assign fpu_enabled=1;
`else
    assign fpu_enabled=0;
`endif

    wire[31:0] real_cp0_index={CP0_Index_P,25'b0,CP0_Index_index};
    wire[31:0] real_cp0_random={26'b0,CP0_Random};
    wire[31:0] real_cp0_entrylo0={6'b0,CP0_EntryLo0};
    wire[31:0] real_cp0_entrylo1={6'b0,CP0_EntryLo1};
    wire[31:0] real_cp0_context={CP0_Context_PTEBase,CP0_Context_BadVPN2,4'b0};
    wire[31:0] real_cp0_pagemask={3'b0,CP0_PageMask,13'b0};
    wire[31:0] real_cp0_wired={26'b0,CP0_Wired};
    wire[31:0] real_cp0_badvaddr=CP0_BadVaddr;
    wire[31:0] real_cp0_count=CP0_Count;
    wire[31:0] real_cp0_entryhi={CP0_EntryHi_VPN2,5'b0,CP0_EntryHi_ASID};
    wire[31:0] real_cp0_compare=CP0_Compare;
    wire[31:0] real_cp0_status={/*9'b0*/2'b0,CP0_Status_CU1,CP0_Status_CU0,5'b0,CP0_Status_BEV,6'b0,CP0_Status_IM_H,CP0_Status_IM_S,3'b0,CP0_Status_KSU,1'b0,CP0_Status_EXL,CP0_Status_IE};
    wire[31:0] real_cp0_cause={CP0_Cause_BD,CP0_Cause_TI,CP0_Cause_CE,4'b0,CP0_Cause_IV,7'b0,CP0_Cause_IR_H,CP0_Cause_IR_S,1'b0,CP0_Cause_ExcCode,2'b0};
    wire[31:0] real_cp0_epc=CP0_EPC;
    wire[31:0] real_cp0_prid=/* 32'h4220 */ 32'h00018000;   //MIPS 4KC???
    wire[31:0] real_cp0_ebase={2'b10,CP0_EBase,12'b0};
    wire[31:0] real_cp0_config0={1'b1,20'b0,/* Release 2 not enabled ? */1'b0,3'b001,4'b0,CP0_Config0_K0};
    wire[31:0] real_cp0_config1={1'b0,6'd63,3'd0,3'd5,3'd3,3'd0,3'd5,3'd2,/*7'b0*/6'b0,fpu_enabled /* FPU enable */};

    reg[31:0] CP0_rdata;
    assign rdata=CP0_rdata;
    always@(*) begin
        case(raddr[4:0])
        0:  CP0_rdata=real_cp0_index;
        1:  CP0_rdata=real_cp0_random;
        2:  CP0_rdata=real_cp0_entrylo0;
        3:  CP0_rdata=real_cp0_entrylo1;
        4:  CP0_rdata=real_cp0_context;
        5:  CP0_rdata=real_cp0_pagemask;
        6:  CP0_rdata=real_cp0_wired;
        8:  CP0_rdata=real_cp0_badvaddr;
        9:  CP0_rdata=real_cp0_count;
        10: CP0_rdata=real_cp0_entryhi;
        11: CP0_rdata=real_cp0_compare;
        12: CP0_rdata=real_cp0_status;
        13: CP0_rdata=real_cp0_cause;
        14: CP0_rdata=real_cp0_epc;
        15: CP0_rdata=raddr[5] ? real_cp0_ebase : real_cp0_prid;
        16: CP0_rdata=raddr[5] ? real_cp0_config1 : real_cp0_config0;
        default: CP0_rdata=0;
        endcase
    end

    assign exception_en=CP0_Status_EXL;
    assign real_intr=(CP0_Status_IE & ~CP0_Status_EXL) ? ({{CP0_Cause_IR_H[5] | CP0_Cause_TI,CP0_Cause_IR_H[4:0]} & CP0_Status_IM_H,CP0_Cause_IR_S & CP0_Status_IM_S}) : 0;
    assign eretaddr=CP0_EPC + {CP0_EPC_shouldnext,2'b00};
    assign tlb_EntryHi={CP0_EntryHi_VPN2,5'b0,CP0_EntryHi_ASID};
    assign tlb_EntryLo0={6'b0,CP0_EntryLo0};
    assign tlb_EntryLo1={6'b0,CP0_EntryLo1};
    assign tlb_random=CP0_Random;
    assign tlb_index=CP0_Index_index;
    assign tlb_config0_k0=CP0_Config0_K0;
    assign tlb_pagemask=CP0_PageMask;
    assign status_ksu=CP0_Status_EXL ? 0 : CP0_Status_KSU;

    reg half_clk;

    wire tlbfault=(excode == `E_read_tlb_miss) | (excode == `E_read_tlb_invalid) | (excode == `E_store_tlb_miss) | (excode == `E_store_tlb_invalid) | (excode == `E_tlb_modified);

    always@(posedge clk) begin
        if(~resetn) begin
            half_clk<=0;
            CP0_Index_P<=0;
            CP0_Index_index<=0;
            CP0_Wired<=0;
            CP0_Compare<=0;
            CP0_EntryLo0<=0;
            CP0_EntryLo1<=0;
            CP0_EntryHi_ASID<=0;
            CP0_EntryHi_VPN2<=0;
            CP0_Status_BEV<=1;
            CP0_Status_IM_H<=0;
            CP0_Status_IM_S<=0;
            CP0_Status_IE<=0;
            CP0_Status_KSU<=0;
            CP0_Cause_IV<=0;
            CP0_Context_PTEBase<=0;
            CP0_EBase<=0;
            CP0_Count<=0;
            CP0_Random<=0;
            CP0_EPC<=0;
            CP0_EPC_shouldnext<=0;
            CP0_BadVaddr<=0;
            CP0_Cause_ExcCode<=0;
            CP0_Status_EXL<=0;
            CP0_Status_CU0<=1;
            CP0_Status_CU1<=1;
            CP0_Cause_BD<=0;
            CP0_Cause_TI<=0;
            CP0_Cause_IR_H<=0;
            CP0_Cause_IR_S<=0;
            CP0_Cause_CE<=0;
            CP0_Config0_K0<=3;
            CP0_PageMask<=0;
        end
        else begin
            half_clk<=~half_clk;

            //CP0_Cause_IR_H<={ext_int[5] | CP0_Cause_TI,ext_int[4:0]};
            
            //ucore貌似只检测Cause，这导致如果某个中断被Status屏蔽，但是它还在Cause里置位
            //ucore就会错误的认为发生了这个中断，因此Cause在更新时考虑Status？
            //但是MIPS手册里并没有这样规定？
            //此外，由于把TI给ban掉了，因此ext_int[5]需要自己判断时钟中断
            CP0_Cause_IR_H<={ext_int[5] | /*(CP0_Compare == CP0_Count)*/CP0_Cause_TI,ext_int[4:0]}; //& CP0_Status_IM_H;


            if(mtc0_wen & (mtc0_waddr == 16))
                CP0_Config0_K0<=mtc0_wdata[2:0];

            if(mtc0_wen & ((mtc0_waddr == 6) | (mtc0_waddr == 1)))
                CP0_Random<=(mtc0_waddr == 1) ? mtc0_wdata[5:0] : 63;
            else if(CP0_Random == CP0_Wired)
                CP0_Random<=63;
            else 
                CP0_Random<=CP0_Random - 1;
            if(mtc0_wen & (mtc0_waddr == 9))
                CP0_Count<=mtc0_wdata;
            else if(half_clk)
                CP0_Count<=CP0_Count + 1;
            if((tlbp_en & l2_tlb_qry_done) | (mtc0_wen & (mtc0_waddr == 0))) begin
                CP0_Index_P<=tlbp_en ? (~l2_tlb_qry_isexist) : 0;
                CP0_Index_index<=tlbp_en ? (l2_tlb_qry_isexist ? index_new : 0) : mtc0_wdata[5:0];
            end
            if(mtc0_wen & (mtc0_waddr == 6))
                CP0_Wired<=mtc0_wdata[5:0];
            if(mtc0_wen & (mtc0_waddr == 11))
                CP0_Compare<=mtc0_wdata;
            if(tlbr_en | (mtc0_wen & (mtc0_waddr == 2)))
                CP0_EntryLo0<=mtc0_wen ? mtc0_wdata[25:0] : tlb_new[25:0];
            if(tlbr_en | (mtc0_wen & (mtc0_waddr == 3)))
                CP0_EntryLo1<=mtc0_wen ? mtc0_wdata[25:0] : tlb_new[51:26];
            if(tlbr_en | (mtc0_wen & (mtc0_waddr == 10)) | tlbfault)
                CP0_EntryHi_VPN2<=tlbfault ? exce_vaddr[31:13] : (tlbr_en ? tlb_new[78:60] : mtc0_wdata[31:13]);
            if(tlbr_en | (mtc0_wen & (mtc0_waddr == 10)))
                CP0_EntryHi_ASID<=mtc0_wen ? mtc0_wdata[7:0] : tlb_new[59:52];
            if(mtc0_wen & (mtc0_waddr == 12)) begin
                CP0_Status_BEV<=mtc0_wdata[22];
                CP0_Status_IM_H<=mtc0_wdata[15:10];
                CP0_Status_IM_S<=mtc0_wdata[9:8];
                CP0_Status_IE<=mtc0_wdata[0];
            end
            if(mtc0_wen & (mtc0_waddr == 13))
                CP0_Cause_IV<=mtc0_wdata[23];
            if(mtc0_wen & (mtc0_waddr == 4))
                CP0_Context_PTEBase<=mtc0_wdata[31:23];
            if(mtc0_wen & (mtc0_waddr == 47))
                CP0_EBase<=mtc0_wdata[29:12];
            if(((|excode) & ~CP0_Status_EXL) | (mtc0_wen & (mtc0_waddr == 14))) begin
                CP0_EPC<=(|excode) ? (exce_PC - {29'b0,exce_isslot,2'b0}) : mtc0_wdata;
                CP0_EPC_shouldnext<=(|excode) & ((excode == `E_break) | (excode == `E_copunusable) | (excode == `E_copunusable0) |
                    (excode == `E_read_addr_error) | (excode == `E_overflow) |
                        (excode == `E_reserved) | (excode == `E_store_addr_error) | (excode == `E_syscall));
            end
            if((excode == `E_read_addr_error) | (excode == `E_read_tlb_invalid) | (excode == `E_read_tlb_miss) |
                (excode == `E_store_addr_error) | (excode == `E_store_tlb_invalid) | (excode == `E_store_tlb_miss) | (excode == `E_tlb_modified))
                CP0_BadVaddr<=exce_vaddr;
            if(|excode)
                CP0_Cause_ExcCode<=
                    (5'd1 & {5{excode == `E_tlb_modified}}) |
                    (5'd2 & {5{(excode == `E_read_tlb_invalid) | (excode == `E_read_tlb_miss)}}) |
                    (5'd3 & {5{(excode == `E_store_tlb_invalid) | (excode == `E_store_tlb_miss)}}) |
                    (5'd4 & {5{excode == `E_read_addr_error}}) |
                    (5'd5 & {5{excode == `E_store_addr_error}}) |
                    (5'd8 & {5{excode == `E_syscall}}) |
                    (5'd9 & {5{excode == `E_break}}) |
                    (5'd10 & {5{excode == `E_reserved}}) |
                    (5'd11 & {5{((excode == `E_copunusable) & ~CP0_Status_CU1) | (excode == `E_copunusable0)}}) |
                    (5'd12 & {5{excode == `E_overflow}}) |
                    (5'd13 & {5{excode == `E_trap}}) |
                    (5'd15 & {5{(excode == `E_fpe) & CP0_Status_CU1}});
            if((|excode) | (mtc0_wen & (mtc0_waddr == 12)) | eret_en)
                CP0_Status_EXL<=(|excode) | (mtc0_wen & mtc0_wdata[1]);
            if((mtc0_wen & (mtc0_waddr == 12))) begin
                //CP0_Status_KSU<=mtc0_wdata[4:3];
                CP0_Status_KSU<={mtc0_wdata[4],1'b0};   //only support kernel/user mode, not supervisor?
                CP0_Status_CU0<=mtc0_wdata[28];
                CP0_Status_CU1<=mtc0_wdata[29];
            end
                
            if((|excode) & ~CP0_Status_EXL)
                CP0_Cause_BD<=exce_isslot;
            
            //MIPS32 Release1 不使用TI？？？？
            if((CP0_Compare == CP0_Count) | (mtc0_wen & (mtc0_waddr == 11)))
                CP0_Cause_TI<=~(mtc0_wen & (mtc0_waddr == 11));
            
            if(mtc0_wen & (mtc0_waddr == 13))
                CP0_Cause_IR_S<=mtc0_wdata[9:8];
            if(tlbfault)
                CP0_Context_BadVPN2<=exce_vaddr[31:13];
            if(|excode)
                CP0_Cause_CE<=(excode == `E_copunusable) ? 1 : 0;

            if(mtc0_wen & (mtc0_waddr == 5))
                CP0_PageMask<=mtc0_wdata[28:13];
        
        end
    end


endmodule