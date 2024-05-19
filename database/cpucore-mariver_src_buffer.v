// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    指令Buffer
*/

module buffer(
    input           clk,
    input           resetn,
    //来自Fetch的以组合逻辑方式呈现的输入
    input[31:0]     fetch_inst0,        //指令0
    input[31:0]     fetch_inst1,        //指令1
    input           fetch_valid0,       //指令0是否有效
    input           fetch_valid1,       //指令1是否有效
    input[31:0]     fetch_PC0,          //指令0地址
    input[31:0]     fetch_PC1,          //指令1地址
    input           fetch_predict0,     //指令0是否预测转移
    input           fetch_predict1,     //指令1是否预测转移
    input[31:0]     fetch_predict_target0,  //指令0预测地址
    input[31:0]     fetch_predict_target1,  //指令1预测地址
    input[$clog2(`CNT_EXCEPTION) - 1:0]     fetch_excode0,  //取指时异常码
    input[$clog2(`CNT_EXCEPTION) - 1:0]     fetch_excode1,
    input[63:0]     fetch_RAS,          //取指前的RAS，指令0和1共用
    input           fetch_output_en,    //是否可以送出指令（等价于Buffer的push使能）
    //来自Commit
    input           flush,
    //传递给Fetch的反馈信号
    output          buffer_full,        //buffer是否满了
    //从Decode传递过来的反馈信号
    input           decode_busy,        //若这信号为0，且队列不空，则自动pop
    //传递给Decode的输出
    output[63:0]    buffer_RAS,         //指令0/1共用的RAS
    output          buffer_valid0,      //当Buffer为空时，将valid置0即可
    output[31:0]    buffer_PC0,
    output[31:0]    buffer_inst0,
    output          buffer_predict0,
    output[31:0]    buffer_predict_target0,
    output[$clog2(`CNT_EXCEPTION) - 1:0]    buffer_excode0,
    output          buffer_valid1,
    output[31:0]    buffer_PC1,
    output[31:0]    buffer_inst1,
    output          buffer_predict1,
    output[31:0]    buffer_predict_target1,
    output[$clog2(`CNT_EXCEPTION) - 1:0]    buffer_excode1
    );

    reg[$clog2(`BUFFER_SIZE) - 1:0] head,tail;
    //存储体
    reg[63:0] bufmem_RAS[0:`BUFFER_SIZE - 1];
    //valid[97:97],predict0[96:96],PC[95:64],inst[63:32],predtarget[31:0]
    //按照98位存储
    reg[97:0] bufmem_i0[0:`BUFFER_SIZE - 1];    
    reg[97:0] bufmem_i1[0:`BUFFER_SIZE - 1];
    reg[$clog2(`CNT_EXCEPTION) - 1:0] bufmem_excode0[0:`BUFFER_SIZE - 1];
    reg[$clog2(`CNT_EXCEPTION) - 1:0] bufmem_excode1[0:`BUFFER_SIZE - 1];

    genvar i;
    generate
        for(i=0; i < `BUFFER_SIZE; i=i + 1) begin
            initial begin
                bufmem_RAS[i]=0;
                bufmem_i0[i]=0;
                bufmem_i1[i]=0;
                bufmem_excode0[i]=0;
                bufmem_excode1[i]=0;
            end
        end
    endgenerate
    
    assign buffer_RAS=bufmem_RAS[head];
    assign buffer_excode0=bufmem_excode0[head];
    assign buffer_excode1=bufmem_excode1[head];
    wire[97:0] head_i0=bufmem_i0[head];
    wire[97:0] head_i1=bufmem_i1[head];
    assign buffer_valid0=head_i0[97] & ~(head == tail);
    assign buffer_valid1=head_i1[97] & ~(head == tail);
    assign buffer_predict0=head_i0[96];
    assign buffer_predict1=head_i1[96];
    assign buffer_PC0=head_i0[95:64];
    assign buffer_PC1=head_i1[95:64];
    assign buffer_inst0=head_i0[63:32];
    assign buffer_inst1=head_i1[63:32];
    assign buffer_predict_target0=head_i0[31:0];
    assign buffer_predict_target1=head_i1[31:0];

    wire[$clog2(`BUFFER_SIZE) - 1:0] nexttail=tail + 1;
    assign buffer_full=(nexttail == head);

    //Note: 当Buffer为空时，head=tail，这个时候Buffer存储体里是啥无所谓，反正valid=0

    always@(posedge clk) begin
        if(~resetn) begin
            head<=0;
            tail<=0;
        end
        else begin
            if(flush | (fetch_output_en & ~buffer_full))
                tail<=flush ? 0 : (tail + 1);
            if(flush | ((head != tail) & ~decode_busy))
                head<=flush ? 0 : (head + 1);
            if(fetch_output_en & ~buffer_full) begin
                //入队（即便flush也无所谓，反正指针空了）
                bufmem_RAS[tail]<=fetch_RAS;
                bufmem_i0[tail]<={fetch_valid0,fetch_predict0,fetch_PC0,fetch_inst0,fetch_predict_target0};
                bufmem_i1[tail]<={fetch_valid1,fetch_predict1,fetch_PC1,fetch_inst1,fetch_predict_target1};
                bufmem_excode0[tail]<=fetch_excode0;
                bufmem_excode1[tail]<=fetch_excode1;
            end
        end
    end

endmodule