// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    浮点乘法器前端
*/

module fCSA
    #(parameter width = 106)
    (
    input[width - 1:0]  A,
    input[width - 1:0]  B,
    input[width - 1:0]  C,
    output[width - 1:0] S0,
    output[width - 1:0] S1
    );
    genvar i;
    generate
        for(i=0; i < width - 1; i=i + 1) begin
            assign S0[i]=A[i] ^ B[i] ^ C[i];
            assign S1[i + 1]=(A[i] & B[i]) | (B[i] & C[i]) | (A[i] & C[i]); 
        end
    endgenerate
    assign S1[0]=0;
    assign S0[width - 1]=A[width - 1] ^ B[width - 1] ^ C[width - 1];
endmodule


module double_frac_mul      //53*53无符号乘法
    #(parameter info_width = 1)
    (
    input           clk,
    input           resetn,
    input           a_wait,
    input           flush,
    input[52:0]     a,
    input[52:0]     b,
    input[info_width - 1:0] info_in,
    output reg[info_width - 1:0]    info_out,
    output reg[105:0]       result      //[105:104].[103:0]
    );

`ifdef FMUL_USE_DSP

    //DSP based mul
    reg[23:0] A0,A1;
    reg[4:0] A2;
    reg[16:0] B0,B1,B2;
    reg[1:0] B3;
    reg[info_width - 1:0] st0_info;

    reg[info_width - 1:0] st1_info;
    wire[40:0] A0B0,A0B1,A0B2;
    wire[25:0] A0B3;
    wire[40:0] A1B0,A1B1,A1B2;
    wire[25:0] A1B3;
    wire[21:0] A2B0,A2B1,A2B2;
    wire[6:0] A2B3;
    dsp_mul a0mb0(
        .clk(clk),.resetn(resetn),.a_wait(a_wait),.A(A0),.B(B0),.result(A0B0)
    );
    dsp_mul a0mb1(
        .clk(clk),.resetn(resetn),.a_wait(a_wait),.A(A0),.B(B1),.result(A0B1)
    );
    dsp_mul a0mb2(
        .clk(clk),.resetn(resetn),.a_wait(a_wait),.A(A0),.B(B2),.result(A0B2)
    );
    dsp_mul a0mb3(
        .clk(clk),.resetn(resetn),.a_wait(a_wait),.A(A0),.B({15'b0,B3}),.result(A0B3)
    );
    dsp_mul a1mb0(
        .clk(clk),.resetn(resetn),.a_wait(a_wait),.A(A1),.B(B0),.result(A1B0)
    );
    dsp_mul a1mb1(
        .clk(clk),.resetn(resetn),.a_wait(a_wait),.A(A1),.B(B1),.result(A1B1)
    );
    dsp_mul a1mb2(
        .clk(clk),.resetn(resetn),.a_wait(a_wait),.A(A1),.B(B2),.result(A1B2)
    );
    dsp_mul a1mb3(
        .clk(clk),.resetn(resetn),.a_wait(a_wait),.A(A1),.B({15'b0,B3}),.result(A1B3)
    );
    dsp_mul a2mb0(
        .clk(clk),.resetn(resetn),.a_wait(a_wait),.A({19'b0,A2}),.B(B0),.result(A2B0)
    );
    dsp_mul a2mb1(
        .clk(clk),.resetn(resetn),.a_wait(a_wait),.A({19'b0,A2}),.B(B1),.result(A2B1)
    );
    dsp_mul a2mb2(
        .clk(clk),.resetn(resetn),.a_wait(a_wait),.A({19'b0,A2}),.B(B2),.result(A2B2)
    );
    dsp_mul a2mb3(
        .clk(clk),.resetn(resetn),.a_wait(a_wait),.A({19'b0,A2}),.B({15'b0,B3}),.result(A2B3)
    );
    
    reg[info_width - 1:0] st2_info;
    reg[105:0] st2_a,st2_b;

    wire[105:0] op1={2'b0,A2B2,A1B1,A0B0};
    wire[105:0] op2={A2B3,A1B2,A0B1,17'b0};
    wire[105:0] op3={A2B1,A1B0,24'b0};
    wire[105:0] op4={5'b0,A1B3,A0B2,34'b0};
    wire[105:0] op5={17'b0,A2B0,48'b0};
    wire[105:0] op6={29'b0,A0B3,51'b0};

    wire[105:0] r0,r1,r2,r3;
    wire[105:0] s0,s1,s2;
    wire[105:0] t0,t1;
    fCSA op123(
        .A(op1),.B(op2),.C(op3),.S0(r0),.S1(r1)
    );
    fCSA op456(
        .A(op4),.B(op5),.C(op6),.S0(r2),.S1(r3)
    );
    fCSA r012(
        .A(r0),.B(r1),.C(r2),.S0(s0),.S1(s1)
    );
    assign s2=r3;
    fCSA s012(
        .A(s0),.B(s1),.C(s2),.S0(t0),.S1(t1)
    );
    
    //st0
    always@(posedge clk) begin
        if(~resetn) begin
            A0<=0; A1<=0; A2<=0;
            B0<=0; B1<=0; B2<=0; B3<=0;
            st0_info<=0;
        end
        else begin
            if(flush)
                st0_info[0]<=0;
            else if(~a_wait)
                st0_info[0]<=info_in[0];
            if(~a_wait) begin
                if(info_width > 1)
                    st0_info[info_width - 1:1]<=info_in[info_width - 1:1];
                A0<=a[23:0];
                A1<=a[47:24];
                A2<=a[52:48];
                B0<=b[16:0];
                B1<=b[33:17];
                B2<=b[50:34];
                B3<=b[52:51];
            end
        end
    end

    //st1
    always@(posedge clk) begin
        if(~resetn)
            st1_info<=0;
        else begin
             if(flush)
                st1_info[0]<=0;
            else if(~a_wait)
                st1_info[0]<=st0_info[0];
            if(~a_wait)
                if(info_width > 1)
                    st1_info[info_width - 1:1]<=st0_info[info_width - 1:1];
        end
    end

    //st2
    always@(posedge clk) begin
        if(~resetn) begin
            st2_info<=0;
            st2_a<=0;
            st2_b<=0;
        end
        else begin
             if(flush)
                st2_info[0]<=0;
            else if(~a_wait)
                st2_info[0]<=st1_info[0];
            if(~a_wait) begin
                if(info_width > 1)
                    st2_info[info_width - 1:1]<=st1_info[info_width - 1:1];
                st2_a<=t0;
                st2_b<=t1;
            end
        end
    end

    //output
    always@(posedge clk) begin
        if(~resetn) begin
            info_out<=0;
            result<=0;
        end
        else begin
            if(flush)
                info_out[0]<=0;
            else if(~a_wait)
                info_out[0]<=st2_info[0];
            if(~a_wait) begin
                if(info_width > 1)
                    info_out[info_width - 1:1]<=st2_info[info_width - 1:1];
                result<=st2_a + st2_b;
            end
        end
    end

`else
    wire[105:0]     level0[0:52];
    wire[105:0]     level1[0:35];       //level1[34:35]=level0[51:52]
    wire[105:0]     level2_pre[0:23];
    reg[105:0]      level2[0:23];
    reg[info_width - 1:0]   level2_info;
    wire[105:0]     level3[0:15];
    wire[105:0]     level4_pre[0:10];
    reg[105:0]      level4[0:10];       //level4[10]=level3[15]
    reg[info_width - 1:0]   level4_info;
    wire[105:0]     level5[0:7];        //level5[6:7]=level4[9:10]
    wire[105:0]     level6_pre[0:5];
    reg[105:0]      level6[0:5];        //level6[4:5]=level5[6:7]
    reg[info_width - 1:0]   level6_info;
    wire[105:0]     level7[0:3];
    wire[105:0]     level8[0:2];        //level8[2]=level7[3]
    wire[105:0]     level9_pre[0:1];
    reg[105:0]      level9[0:1];
    reg[info_width - 1:0]   level9_info;

    genvar i;
    generate
        //level0
        for(i=0; i <= 52; i=i + 1) begin
            assign level0[i][i + 52:i]=b[i] ? a : 0;
            assign level0[i][105:i + 53]=0;
            if(i != 0)
                assign level0[i][i - 1:0]=0;
        end
        //level1
        assign level1[34]=level0[51];
        assign level1[35]=level0[52];
        for(i=0; i <= 16; i=i + 1) begin
            fCSA #(.width(106)) cl1(
                .A(level0[i * 3]),
                .B(level0[i * 3 + 1]),
                .C(level0[i * 3 + 2]),
                .S0(level1[i * 2]),
                .S1(level1[i * 2 + 1])
            );
        end
        //level2
        for(i=0; i <= 11; i=i + 1) begin
            fCSA #(.width(106)) cl2(
                .A(level1[i * 3]),
                .B(level1[i * 3 + 1]),
                .C(level1[i * 3 + 2]),
                .S0(level2_pre[i * 2]),
                .S1(level2_pre[i * 2 + 1])
            );
        end
        for(i=0; i <= 23; i=i + 1) begin
            initial level2[i]=0;
            always@(posedge clk)
                if(~a_wait)
                    level2[i]<=level2_pre[i];
        end
        //level3
        for(i=0; i <= 7; i=i + 1) begin
            fCSA #(.width(106)) cl3(
                .A(level2[i * 3]),
                .B(level2[i * 3 + 1]),
                .C(level2[i * 3 + 2]),
                .S0(level3[i * 2]),
                .S1(level3[i * 2 + 1])
            );
        end
        //level4
        assign level4_pre[10]=level3[15];
        for(i=0; i <= 4; i=i + 1) begin
            fCSA #(.width(106)) cl4(
                .A(level3[i * 3]),
                .B(level3[i * 3 + 1]),
                .C(level3[i * 3 + 2]),
                .S0(level4_pre[i * 2]),
                .S1(level4_pre[i * 2 + 1])
            );
        end
        for(i=0; i <= 10; i=i + 1) begin
            initial level4[i]=0;
            always@(posedge clk)
                if(~a_wait)
                    level4[i]<=level4_pre[i];
        end
        //level5
        assign level5[6]=level4[9];
        assign level5[7]=level4[10];
        for(i=0; i <= 2; i=i + 1) begin
            fCSA #(.width(106)) cl5(
                .A(level4[i * 3]),
                .B(level4[i * 3 + 1]),
                .C(level4[i * 3 + 2]),
                .S0(level5[i * 2]),
                .S1(level5[i * 2 + 1])
            );
        end
        //level6
        assign level6_pre[4]=level5[6];
        assign level6_pre[5]=level5[7];
        for(i=0; i <= 1; i=i + 1) begin
            fCSA #(.width(106)) cl6(
                .A(level5[i * 3]),
                .B(level5[i * 3 + 1]),
                .C(level5[i * 3 + 2]),
                .S0(level6_pre[i * 2]),
                .S1(level6_pre[i * 2 + 1])
            );
        end
        for(i=0; i <= 5; i=i + 1) begin
            initial level6[i]=0;
            always@(posedge clk)
                if(~a_wait)
                    level6[i]<=level6_pre[i];
        end
        //level7
        for(i=0; i <= 1; i=i + 1) begin
            fCSA #(.width(106)) cl7(
                .A(level6[i * 3]),
                .B(level6[i * 3 + 1]),
                .C(level6[i * 3 + 2]),
                .S0(level7[i * 2]),
                .S1(level7[i * 2 + 1])
            );
        end
        //level8
        assign level8[2]=level7[3];
        fCSA #(.width(106)) cl8(
            .A(level7[0]),
            .B(level7[1]),
            .C(level7[2]),
            .S0(level8[0]),
            .S1(level8[1])
        );
        //level9
        fCSA #(.width(106)) cl9(
            .A(level8[0]),
            .B(level8[1]),
            .C(level8[2]),
            .S0(level9_pre[0]),
            .S1(level9_pre[1])
        );
        for(i=0; i <= 1; i=i + 1) begin
            initial level9[i]=0;
            always@(posedge clk)
                if(~a_wait)
                    level9[i]<=level9_pre[i];
        end
    endgenerate

    initial result=0;
    always@(posedge clk) begin
        if(~resetn) begin
            level2_info<=0;
            level4_info<=0;
            level6_info<=0;
            level9_info<=0;
            info_out<=0;
        end
        else begin
            if(flush) begin
                level2_info[0]<=0;
                level4_info[0]<=0;
                level6_info[0]<=0;
                level9_info[0]<=0;
                info_out[0]<=0;
            end
            else if(~a_wait) begin
                level2_info[0]<=info_in[0];
                level4_info[0]<=level2_info[0];
                level6_info[0]<=level4_info[0];
                level9_info[0]<=level6_info[0];
                info_out[0]<=level9_info[0];
            end
            if(~a_wait) begin
                if(info_width > 1) begin
                    level2_info[info_width - 1:1]<=info_in[info_width - 1:1];
                    level4_info[info_width - 1:1]<=level2_info[info_width - 1:1];
                    level6_info[info_width - 1:1]<=level4_info[info_width - 1:1];
                    level9_info[info_width - 1:1]<=level6_info[info_width - 1:1];
                    info_out[info_width - 1:1]<=level9_info[info_width - 1:1];
                end
                result<=level9[0] + level9[1];
            end
        end
    end
`endif

endmodule





module f_muler_front
    #(  parameter info_width = 1,
        parameter exp_width = 11,
        parameter frac_width = 52)
    (
    input           clk,
    input           resetn,
    input           a_wait,             //阻塞信号
    input           flush,              //flush有效时仅清除info[0]
    output          busy,
    //输入数据必定为double
    //input[exp_width + frac_width:0] op_a,
    //input[exp_width + frac_width:0] op_b,
    input                   op_a_sign,
    input[exp_width:0]      op_a_exp,
    input[frac_width:0]     op_a_frac,
    input[`SPEF_CNT - 1:0]  op_a_spef,
    input                   op_b_sign,
    input[exp_width:0]      op_b_exp,
    input[frac_width:0]     op_b_frac,
    input[`SPEF_CNT - 1:0]  op_b_spef,
    
    input[info_width - 1:0] info_in,    //指令附加信息，与运算无关，随流水线流动
    //输出的是未经规格化的指数+长尾数
    output[exp_width + 1:0]         result_exp, //结果指数多取2位（注意：这个输出的是加过bias的机器数）
    output[frac_width * 2 + 3:0]    result_frac,    //结果尾数取52+3+52+1=108位，未舍入，unsigned
                                        //小数点前是[107:105]3位，这结果一定不会溢出
    output      result_sign,
    output[info_width - 1:0]    info_out,
    output          invalid         //是否引发无效运算（若invalid=1则result无意义）
    );


    //Input/MulStage0流水线寄存器
    reg[info_width - 1:0]   im_info;
    reg[exp_width + 1:0]    im_exp;     //经过加法后的
    reg                     im_sign;
    reg[`SPEF_CNT - 1:0]    im_a_spef;
    reg[`SPEF_CNT - 1:0]    im_b_spef;
    reg[frac_width:0]       im_a_frac;  //小数点后的，小数点前1位由spef决定
    reg[frac_width:0]       im_b_frac; 
    wire    im_invalid=im_a_spef[`SPEF_NAN] | im_b_spef[`SPEF_NAN] | (im_a_spef[`SPEF_ZERO] & im_b_spef[`SPEF_INF]) | (im_b_spef[`SPEF_ZERO] & im_a_spef[`SPEF_INF]);

    //Note：在输入的第一个流水段我们算出结果的exp
    //直接计算出来的可能是<=0的
    //这其实无所谓，最后的round阶段会搞定<=0的中间exp
    //一般来说这样得到的结果都应该是非规格化数，但是存在一种极特殊情况
    //那就是由于乘法结果是xx.xx...x，可能右移1后就变成了规格化数
    //但这无所谓，我们带着小数点前的内容传递到后面的normal部分，它会帮我们解决的~

    //乘法器输出端
    wire[info_width - 1:0]  ms_info;
    wire[exp_width + 1:0]   ms_exp;
    wire[exp_width + 1:0]   ms_negexp;
    wire                    ms_sign;
    wire[frac_width * 2 + 1:0]  ms_frac;
    wire                    ms_invalid;
    
    //Input
    wire[exp_width + 1:0] expbias=((1 << (exp_width - 1)) - 1);
    wire[exp_width + 1:0] nnnexp={op_a_exp[exp_width],op_a_exp} + {op_b_exp[exp_width],op_b_exp};
    wire[exp_width + 1:0] nexp=nnnexp + expbias;
    always@(posedge clk) begin
        if(~resetn) begin
            im_info<=0;
            im_exp<=0;
            im_sign<=0;
            im_a_spef<=0;
            im_b_spef<=0;
            im_a_frac<=0;
            im_b_frac<=0;
        end
        else begin
            if(flush)
                im_info[0]<=0;
            else if(~a_wait)
                im_info[0]<=info_in[0];
            if(~a_wait) begin
                if(info_width > 1)
                    im_info[info_width - 1:1]<=info_in[info_width - 1:1];
                im_exp<=(op_a_spef[`SPEF_INF] | op_b_spef[`SPEF_INF]) ? 3000 : nexp;
                im_sign<=op_a_sign ^ op_b_sign;
                im_a_spef<=op_a_spef;
                im_b_spef<=op_b_spef;
                im_a_frac<=op_a_frac;
                im_b_frac<=op_b_frac;
            end
        end
    end

    //MulStages
    wire[exp_width + 1:0]   negexp=0 - im_exp;
    generate
        if(frac_width == 52) begin  //double
            double_frac_mul #(.info_width(info_width + (exp_width + 2) * 2 + 1 + 1)) dmul(
                .clk(clk),
                .resetn(resetn),
                .flush(flush),
                .a_wait(a_wait),
                .a(im_a_frac),
                .b(im_b_frac),
                .info_in({im_invalid,im_sign,negexp,im_exp,im_info}),
                .info_out({ms_invalid,ms_sign,ms_negexp,ms_exp,ms_info}),
                .result(ms_frac)
            );
        end
        else begin                  //single
            //?????
        end
    endgenerate
    
    /*
    //Shift
    //若exp>0，则直接取(frac,exp)
    //若exp<0，若negexp高几位非0，直接取(0,0)
    //          否则取(frac >> negexp低位,0)
    wire[frac_width * 2 + 1:0] frac_shifted=ms_frac >> ms_negexp[$clog2(frac_width * 2 + 2) - 1:0];
    always@(posedge clk) begin
        if(~resetn) begin
            result_exp<=0;
            result_frac<=0;
            result_sign<=0;
            info_out<=0;
            invalid<=0;
        end
        else begin
            if(flush)
                info_out[0]<=0;
            else if(~a_wait)
                info_out[0]<=ms_info[0];
            if(~a_wait) begin
                if(info_width > 1)
                    info_out[info_width - 1:1]<=ms_info[info_width - 1:1];
                invalid<=ms_invalid;
                result_sign<=ms_sign;
                result_exp<=ms_exp[exp_width + 1] ? 0 : ms_exp;
                result_frac<=ms_exp[exp_width + 1] ? ((|ms_negexp[exp_width + 1:$clog2(frac_width * 2 + 2)]) ? 0 : {1'b0,frac_shifted,1'b0}) : {1'b0,ms_frac,1'b0};
            end
        end
    end
    */
    //Note: 我们的早期版本要求乘法器手动解决exp<=0的问题
    //现在不要这样，我们把这个问题推到round阶段解决

    assign info_out=ms_info;
    assign invalid=ms_invalid;
    assign result_sign=ms_sign;
    assign result_exp=ms_exp;
    assign result_frac={1'b0,ms_frac,1'b0};
    
    
    assign busy=a_wait;         //TODO?
    

endmodule