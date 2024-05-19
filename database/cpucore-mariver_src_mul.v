// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    乘法器
*/

module CSA(
    input[63:0]     A,
    input[63:0]     B,
    input[63:0]     C,
    output[63:0]    S0,
    output[63:0]    S1
    );
    genvar i;
    generate
        for(i=0; i < 63; i=i + 1) begin
            assign S0[i]=A[i] ^ B[i] ^ C[i];
            assign S1[i + 1]=(A[i] & B[i]) | (B[i] & C[i]) | (A[i] & C[i]); 
        end
    endgenerate
    assign S1[0]=0;
    assign S0[63]=A[63] ^ B[63] ^ C[63];
endmodule



module mul(
    input           clk,
    input           resetn,
    input[31:0]     A,
    input[31:0]     B,
    input           signed_en,
    output[63:0]    result
    );

`ifdef IMUL_USE_DSP

    reg[15:0]   A00,B00,A10,B10;
    reg[15:0]   A01,B01,A11,B11;
    wire[31:0] rA=(signed_en & A[31]) ? (0 - A) : A;
    wire[31:0] rB=(signed_en & B[31]) ? (0 - B) : B;
    reg sign;
    reg sign1;
    always@(posedge clk) begin
        if(~resetn) begin
            A00<=0; B00<=0; A10<=0; B10<=0;
            A01<=0; B01<=0; A11<=0; B11<=0;
            sign<=0;
            sign1<=0;
        end
        else begin
            A00<=rA[15:0]; A01<=rA[15:0];
            B00<=rB[15:0]; B01<=rB[15:0];
            A10<=rA[31:16]; A11<=rA[31:16];
            B10<=rB[31:16]; B11<=rB[31:16];
            sign<=signed_en & (A[31] ^ B[31]);
            sign1<=sign;
        end
    end

    wire[31:0]  A0_B0;
    wire[31:0]  A0_B1;
    wire[31:0]  A1_B0;
    wire[31:0]  A1_B1;
    dsp_mul a0b0(
        .clk(clk),.resetn(resetn),.A({8'b0,A00}),.B({1'b0,B00}),.a_wait(0),.result(A0_B0)
    );
    dsp_mul a0b1(
        .clk(clk),.resetn(resetn),.A({8'b0,A01}),.B({1'b0,B10}),.a_wait(0),.result(A0_B1)
    );
    dsp_mul a1b0(
        .clk(clk),.resetn(resetn),.A({8'b0,A10}),.B({1'b0,B01}),.a_wait(0),.result(A1_B0)
    );
    dsp_mul a1b1(
        .clk(clk),.resetn(resetn),.A({8'b0,A11}),.B({1'b0,B11}),.a_wait(0),.result(A1_B1)
    );

    wire[63:0] res={A1_B1,A0_B0} + {15'b0,{1'b0,A1_B0} + {1'b0,A0_B1},16'b0};
    assign result=sign1 ? (0 - res) : res;

`else
    wire[63:0] level0[0:31];
    wire[63:0] level1[0:21];
    wire[63:0] level2[0:14];
    wire[63:0] level3[0:9];
    reg[63:0]  level3_stage[0:9];
    wire[63:0] level4[0:6];
    wire[63:0] level5[0:4];
    wire[63:0] level6[0:3];
    wire[63:0] level7[0:2];
    reg[63:0] level7_stage[0:2];
    wire[63:0] level8[0:1];
    genvar i;
    wire[32:0] a32={A[31],A};
    wire[32:0] neg_A=-a32;
    generate
        for(i=0; i < 32; i=i + 1) begin
            if(i != 0)
                assign level0[i][i - 1:0]=0;
            if(i != 31) begin
                assign level0[i][i + 31:i]=B[i] ? A : 0;
                assign level0[i][63:i + 32]=(signed_en & B[i]) ? {(32 - i){A[31]}} : 0;
            end
            else begin
                assign level0[i][i + 31:i]=B[i] ? (signed_en ? (-A) : A) : 0;
                assign level0[i][63:i + 32]=(signed_en & B[i]) ? neg_A[32] : 0;
            end
        end
        assign level1[20]=level0[30];
        assign level1[21]=level0[31];
        for(i=0; i < 10; i=i + 1) begin
            CSA cl0(.A(level0[i * 3]),.B(level0[i * 3 + 1]),.C(level0[i * 3 + 2]),
                .S0(level1[i * 2]),.S1(level1[i * 2 + 1]));
        end
        assign level2[14]=level1[21];
        for(i=0; i < 7; i=i + 1) begin
            CSA cl1(.A(level1[i * 3]),.B(level1[i * 3 + 1]),.C(level1[i * 3 + 2]),
                .S0(level2[i * 2]),.S1(level2[i * 2 + 1]));
        end
        for(i=0; i < 5; i=i + 1) begin
            CSA cl2(.A(level2[i * 3]),.B(level2[i * 3 + 1]),.C(level2[i * 3 + 2]),
                .S0(level3[i * 2]),.S1(level3[i * 2 + 1]));
        end
        for(i=0; i <= 9; i=i + 1) begin
            always@(posedge clk) begin
                if(~resetn)
                    level3_stage[i]<=0;
                else
                    level3_stage[i]<=level3[i];
            end
        end
        assign level4[6]=level3_stage[9];
        for(i=0; i < 3; i=i + 1) begin
            CSA cl3(.A(level3_stage[i * 3]),.B(level3_stage[i * 3 + 1]),.C(level3_stage[i * 3 + 2]),
                .S0(level4[i * 2]),.S1(level4[i * 2 + 1]));
        end
        assign level5[4]=level4[6];
        for(i=0; i < 2; i=i + 1) begin
            CSA cl4(.A(level4[i * 3]),.B(level4[i * 3 + 1]),.C(level4[i * 3 + 2]),
                .S0(level5[i * 2]),.S1(level5[i * 2 + 1]));
        end
        assign level6[2]=level5[3];
        assign level6[3]=level5[4];
        CSA cl5(.A(level5[0]),.B(level5[1]),.C(level5[2]),.S0(level6[0]),.S1(level6[1]));
        assign level7[2]=level6[3];
        CSA cl6(.A(level6[0]),.B(level6[1]),.C(level6[2]),.S0(level7[0]),.S1(level7[1]));
        for(i=0; i <= 2; i=i + 1) begin
            always@(posedge clk) begin
                if(~resetn)
                    level7_stage[i]<=0;
                else
                    level7_stage[i]<=level7[i];
            end
        end
        CSA cl7(.A(level7_stage[0]),.B(level7_stage[1]),.C(level7_stage[2]),.S0(level8[0]),.S1(level8[1]));
    endgenerate

    assign result=level8[0] + level8[1];

`endif

endmodule