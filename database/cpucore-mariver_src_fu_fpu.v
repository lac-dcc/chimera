// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    浮点主运算单元，执行除涉及FCC以外的所有FPU指令
*/

module fu_fpu
    #(parameter info_width = 1)
    (
    input           clk,
    input           resetn,
    input           flush,
    input           a_wait,
    input[1:0]      fcsr_round_mode,    //来自FCSR
    input           fcsr_fs,
    //组合逻辑输入，自带输入reg
    input[info_width - 1:0]     info_in,
    //输入的64位数据保证做过了调整，不用考虑高位移到低位的情况
    input[63:0]     op_a,           //若为single/fixed则仅低32位有效（若只有1个操作数则仅a有效）
    input[63:0]     op_b,
    input[63:0]     op_from_mu,
    input[31:0]     op_from_mdu,
    input[`FPUCTRL_CNT - 1:0]   fpu_ctrl,
    input[1:0]      round_mode,     //指令自己指定的
    input           valid,
    //输出采取组合逻辑，不要设置输出reg，直接使用f_round等的输出
    //因为要和另外两个FU共用输出端
    output          busy,           //若有效则无法接受输入
    output          ready,          //若有效则输出结果
    output[63:0]    result,         //输出的64位数据在FPU内部进行调整，将低位移到高位
    output[info_width - 1:0]    info_out,
    output          invalid,
    output          overflow,
    output          underflow,
    output          dividebyzero
    );

    wire                    input_wait;         //TODO
    reg[info_width - 1:0]   input_info;
    reg[63:0]               input_op_a;
    reg[63:0]               input_op_b;
    //reg[63:0]               input_op_from_mu;
    //reg[31:0]               input_op_from_mdu;
    reg[`FPUCTRL_CNT - 1:0] input_fpu_ctrl;
    reg[1:0]                input_round_mode;
    reg                     input_valid;
    wire[31:0]              input_op_from_mdu=op_from_mdu;
    wire[63:0]              input_op_from_mu=op_from_mu;

    //initial begin
      //  input_op_from_mdu=0;
        //input_op_from_mu=0;
    //end
    always@(posedge clk) begin
        if(~resetn) begin
            input_info<=0;
            input_op_a<=0;
            input_op_b<=0;
            input_fpu_ctrl<=0;
            input_round_mode<=0;
            input_valid<=0;
            //input_op_from_mdu<=0;
            //input_op_from_mu<=0;
        end
        else begin
            if(flush)
                input_valid<=0;
            else if(~input_wait)
                input_valid<=valid;
            if(~input_wait) begin
                input_info<=info_in;
                input_op_a<=op_a;
                input_op_b<=op_b;
                input_fpu_ctrl<=fpu_ctrl;
                input_round_mode<=round_mode;
            end
        end
        //if(~input_wait) begin
          //  input_op_from_mdu<=op_from_mdu;
            //input_op_from_mu<=op_from_mu;
        //end
    end

    //除非op是定点数，或者是abs/mov/neg
    //否则操作一定要先输入到float_prepare中
    wire        prep_a_sign;
    wire[11:0]  prep_a_exp;
    wire[52:0]  prep_a_frac;
    wire[`SPEF_CNT - 1:0]   prep_a_spef;
    wire        prep_b_sign;
    wire[11:0]  prep_b_exp;
    wire[52:0]  prep_b_frac;
    wire[`SPEF_CNT - 1:0]   prep_b_spef;
    float_prepare prep_a(.num(input_op_a),.single_en(input_fpu_ctrl[`FPUCTRL_OPSNG]),
        .sign(prep_a_sign),.exp(prep_a_exp),.frac(prep_a_frac),.spef(prep_a_spef));
    float_prepare prep_b(.num(input_op_b),.single_en(input_fpu_ctrl[`FPUCTRL_OPSNG]),
        .sign(prep_b_sign),.exp(prep_b_exp),.frac(prep_b_frac),.spef(prep_b_spef));
    
    wire        prepare_wait;       //TODO
    reg         prepare_a_sign;
    reg[11:0]   prepare_a_exp;
    reg[52:0]   prepare_a_frac;
    reg[`SPEF_CNT - 1:0]    prepare_a_spef;
    reg         prepare_b_sign;
    reg[11:0]   prepare_b_exp;
    reg[52:0]   prepare_b_frac;
    reg[`SPEF_CNT - 1:0]    prepare_b_spef;
    reg         prepare_valid;
    reg[info_width - 1:0]   prepare_info;
    reg[`FPUCTRL_CNT - 1:0] prepare_fpu_ctrl;
    reg[1:0]    prepare_round_mode;

    always@(posedge clk) begin
        if(~resetn) begin
            prepare_a_sign<=0;
            prepare_a_exp<=0;
            prepare_a_frac<=0;
            prepare_a_spef<=0;
            prepare_b_sign<=0;
            prepare_b_exp<=0;
            prepare_b_frac<=0;
            prepare_b_spef<=0;
            prepare_valid<=0;
            prepare_info<=0;
            prepare_fpu_ctrl<=0;
            prepare_round_mode<=0;
        end
        else begin
            if(flush)
                prepare_valid<=0;
            else if(~prepare_wait)
                prepare_valid<=input_valid & ~(input_fpu_ctrl[`FPUCTRL_DIRECT] | input_fpu_ctrl[`FPUCTRL_CFNUM]);
            if(~prepare_wait) begin
                prepare_a_sign<=prep_a_sign;
                prepare_a_exp<=prep_a_exp;
                prepare_a_frac<=prep_a_frac;
                prepare_a_spef<=prep_a_spef;
                prepare_b_sign<=input_fpu_ctrl[`FPUCTRL_CAST] ? 0 : prep_b_sign;
                prepare_b_exp<=input_fpu_ctrl[`FPUCTRL_CAST] ? 0 : prep_b_exp;
                prepare_b_frac<=input_fpu_ctrl[`FPUCTRL_CAST] ? 0 : prep_b_frac;
                prepare_b_spef<=input_fpu_ctrl[`FPUCTRL_CAST] ? ((1 << `SPEF_DENORM) | (1 << `SPEF_ZERO)) : prep_b_spef;
                prepare_info<=input_info;
                prepare_fpu_ctrl<=input_fpu_ctrl;
                prepare_round_mode<=input_round_mode;
            end
        end
    end

    //对于加/乘/除/(开根)的前端部件，它们的info格式：
    //[0]=valid, [fpuctrl_cnt:1]=ctrlword
    //[fpuctrl+info_width:fpuctrl_cnt+1]=extra info
    wire            adder_busy;
    wire[12:0]      adder_result_exp;
    wire[107:0]     adder_result_frac;
    wire            adder_invalid;
    wire            adder_info_valid;
    wire[`FPUCTRL_CNT - 1:0]    adder_info_fpu_ctrl;
    wire[info_width - 1:0]      adder_info_ext;
    wire            adder_wait;             //TODO
    wire            adder_en=prepare_valid & prepare_fpu_ctrl[`FPUCTRL_ADD];
    f_adder_front #(.info_width(`FPUCTRL_CNT + info_width + 1)) adder(
        .clk(clk),.resetn(resetn),.flush(flush),.a_wait(adder_wait),.busy(adder_busy),
        .op_a_sign(prepare_a_sign),.op_a_exp(prepare_a_exp),.op_a_frac(prepare_a_frac),.op_a_spef(prepare_a_spef),
        .op_b_sign(prepare_b_sign ^ prepare_fpu_ctrl[`FPUCTRL_SUB]),.op_b_exp(prepare_b_exp),.op_b_frac(prepare_b_frac),.op_b_spef(prepare_b_spef),
        .info_in({prepare_info,prepare_fpu_ctrl,adder_en}),
        .result_exp(adder_result_exp),.result_frac(adder_result_frac),.invalid(adder_invalid),
        .info_out({adder_info_ext,adder_info_fpu_ctrl,adder_info_valid})
    );

    wire            muler_busy;
    wire[12:0]      muler_result_exp;
    wire[107:0]     muler_result_frac;
    wire            muler_result_sign;
    wire            muler_invalid;
    wire            muler_info_valid;
    wire[`FPUCTRL_CNT - 1:0]    muler_info_fpu_ctrl;
    wire[info_width - 1:0]      muler_info_ext;
    wire            muler_wait;             //TODO
    wire            muler_en=prepare_valid & prepare_fpu_ctrl[`FPUCTRL_MUL];
    f_muler_front #(.info_width(`FPUCTRL_CNT + info_width + 1)) muler(
        .clk(clk),.resetn(resetn),.flush(flush),.a_wait(muler_wait),.busy(muler_busy),
        .op_a_sign(prepare_a_sign),.op_a_exp(prepare_a_exp),.op_a_frac(prepare_a_frac),.op_a_spef(prepare_a_spef),
        .op_b_sign(prepare_b_sign),.op_b_exp(prepare_b_exp),.op_b_frac(prepare_b_frac),.op_b_spef(prepare_b_spef),
        .info_in({prepare_info,prepare_fpu_ctrl,muler_en}),
        .result_exp(muler_result_exp),.result_frac(muler_result_frac),.result_sign(muler_result_sign),.invalid(muler_invalid),
        .info_out({muler_info_ext,muler_info_fpu_ctrl,muler_info_valid})
    );

    wire            divider_busy;
    wire[12:0]      divider_result_exp;
    wire[107:0]     divider_result_frac;
    wire            divider_result_sign;
    wire            divider_invalid;
    wire            divider_dividebyzero;
    wire            divider_info_valid;
    wire[`FPUCTRL_CNT - 1:0]    divider_info_fpu_ctrl;
    wire[info_width - 1:0]      divider_info_ext;
    wire            divider_wait;             //TODO
    wire            divider_en=prepare_valid & prepare_fpu_ctrl[`FPUCTRL_DIV];
    f_divider_front #(.info_width(`FPUCTRL_CNT + info_width + 1)) divider(
        .clk(clk),.resetn(resetn),.flush(flush),.a_wait(divider_wait),.busy(divider_busy),
        .op_a_sign(prepare_a_sign),.op_a_exp(prepare_a_exp),.op_a_frac(prepare_a_frac),.op_a_spef(prepare_a_spef),
        .op_b_sign(prepare_b_sign),.op_b_exp(prepare_b_exp),.op_b_frac(prepare_b_frac),.op_b_spef(prepare_b_spef),
        .info_in({prepare_info,prepare_fpu_ctrl,divider_en}),
        .result_exp(divider_result_exp),.result_frac(divider_result_frac),.result_sign(divider_result_sign),.invalid(divider_invalid),.dividebyzero(divider_dividebyzero),
        .info_out({divider_info_ext,divider_info_fpu_ctrl,divider_info_valid})
    );


    //[0]=valid, [fpuctrl_cnt:1]=ctrlword
    //[fpuctrl+info_width:fpuctrl_cnt+1]=extra info
    wire            sqrter_busy;
    wire[12:0]      sqrter_result_exp;
    wire[107:0]     sqrter_result_frac;
    wire            sqrter_invalid;
    wire            sqrter_info_valid;
    wire[`FPUCTRL_CNT - 1:0]    sqrter_info_fpu_ctrl;
    wire[info_width - 1:0]      sqrter_info_ext;
    wire            sqrter_wait;             //TODO
    wire            sqrter_en=prepare_valid & prepare_fpu_ctrl[`FPUCTRL_SQRT];
    f_sqrter_front #(.info_width(`FPUCTRL_CNT + info_width + 1)) sqrter(
        .clk(clk),.resetn(resetn),.flush(flush),.a_wait(sqrter_wait),.busy(sqrter_busy),
        .op_a_sign(prepare_a_sign),.op_a_exp(prepare_a_exp),.op_a_frac(prepare_a_frac),
        .info_in({prepare_info,prepare_fpu_ctrl,sqrter_en}),
        .result_exp(sqrter_result_exp),.result_frac(sqrter_result_frac),.invalid(sqrter_invalid),
        .info_out({sqrter_info_ext,sqrter_info_fpu_ctrl,sqrter_info_valid})
    );



    //对于取整部件，它的info格式：
    //[0]=valid, [fpuctrl_cnt:1]=ctrlword
    //[fpuctrl+info_width:fpuctrl_cnt+1]=extra info
    wire            tofixed_wait;   //TODO
    wire            tofixed_busy;
    wire[`FPUCTRL_CNT - 1:0]    tofixed_info_fpu_ctrl;
    wire            tofixed_info_valid;
    wire[info_width - 1:0]      tofixed_info_ext;
    wire            tofixed_invalid;
    wire[31:0]      tofixed_result;
    wire            tofixed_en=prepare_valid & prepare_fpu_ctrl[`FPUCTRL_CINT];
    float_to_fixed #(.info_width(`FPUCTRL_CNT + info_width + 1)) tofixed(
        .clk(clk),.resetn(resetn),.flush(flush),.a_wait(tofixed_wait),.busy(tofixed_busy),
        .float_sign(prepare_a_sign),.float_exp(prepare_a_exp),.float_frac(prepare_a_frac),.float_spef(prepare_a_spef),
        .round_mode(prepare_fpu_ctrl[`FPUCTRL_CVTW] ? fcsr_round_mode : prepare_round_mode),
        .info_in({prepare_info,prepare_fpu_ctrl,tofixed_en}),
        .info_out({tofixed_info_ext,tofixed_info_fpu_ctrl,tofixed_info_valid}),
        .result(tofixed_result),.invalid(tofixed_invalid)
    );

    //定点转浮点，输入不经prepare，输出连到normal上
    wire            tofloat_wait;   //TODO
    wire            tofloat_busy;
    wire            tofloat_info_valid;
    wire[info_width - 1:0]      tofloat_info_ext;
    wire[`FPUCTRL_CNT - 1:0]    tofloat_info_fpu_ctrl;
    wire            tofloat_result_sign;
    wire[12:0]      tofloat_result_exp;
    wire[107:0]     tofloat_result_frac;
    wire            tofloat_en=input_valid & input_fpu_ctrl[`FPUCTRL_CFNUM];
    fixed_to_float #(.info_width(`FPUCTRL_CNT + info_width + 1)) tofloat(
        .clk(clk),.resetn(resetn),.flush(flush),.a_wait(tofloat_wait),.busy(tofloat_busy),
        .fixed_num(input_op_a[31:0]),
        .info_in({input_info,input_fpu_ctrl,tofloat_en}),
        .info_out({tofloat_info_ext,tofloat_info_fpu_ctrl,tofloat_info_valid}),
        .result_sign(tofloat_result_sign),.result_exp(tofloat_result_exp),.result_frac(tofloat_result_frac)
    );

    //加乘除开根转换这几个部件的输出端都要连到normal上
    //我们最好还是加一级流水段仲裁它们，5个部件……
    //优先级：开根>除法>乘法>加法>取整
    reg             innormal_valid;
    reg[info_width - 1:0]   innormal_info;
    reg[`FPUCTRL_CNT - 1:0] innormal_fpu_ctrl;
    reg             innormal_sign;
    reg             innormal_signed;
    reg             innormal_invalid;
    reg             innormal_dividebyzero;
    reg[12:0]       innormal_exp;
    reg[107:0]      innormal_frac;
    wire            normal_busy;

    always@(posedge clk) begin
        if(~resetn) begin
            innormal_valid<=0;
            innormal_info<=0;
            innormal_fpu_ctrl<=0;
            innormal_sign<=0;
            innormal_signed<=0;
            innormal_invalid<=0;
            innormal_dividebyzero<=0;
            innormal_exp<=0;
            innormal_frac<=0;
        end
        else begin
            if(flush)
                innormal_valid<=0;
            else if(~normal_busy)
                innormal_valid<=adder_info_valid | muler_info_valid | divider_info_valid | tofloat_info_valid | sqrter_info_valid;
            if(~normal_busy) begin
                innormal_info<=(sqrter_info_valid | divider_info_valid | muler_info_valid) ? 
                    ((sqrter_info_valid | divider_info_valid) ? (sqrter_info_valid ? sqrter_info_ext : divider_info_ext) : muler_info_ext) :
                    (adder_info_valid ? adder_info_ext : tofloat_info_ext);
                innormal_fpu_ctrl<=(sqrter_info_valid | divider_info_valid | muler_info_valid) ? 
                    ((sqrter_info_valid | divider_info_valid) ? (sqrter_info_valid ? sqrter_info_fpu_ctrl : divider_info_fpu_ctrl) : muler_info_fpu_ctrl) :
                    (adder_info_valid ? adder_info_fpu_ctrl : tofloat_info_fpu_ctrl);
                innormal_sign<=(sqrter_info_valid | divider_info_valid | muler_info_valid) ? 
                    ((sqrter_info_valid | divider_info_valid) ? (sqrter_info_valid ? 1'b0 : divider_result_sign) : muler_result_sign) :
                    (adder_info_valid ? 1'b0 : tofloat_result_sign);
                innormal_signed<=adder_info_valid & (~sqrter_info_valid) & (~divider_info_valid) & (~muler_info_valid);
                innormal_invalid<=(sqrter_info_valid | divider_info_valid | muler_info_valid) ? 
                    ((sqrter_info_valid | divider_info_valid) ? (sqrter_info_valid ? sqrter_invalid : divider_invalid) : muler_invalid) :
                    (adder_info_valid ? adder_invalid : 1'b0);
                innormal_dividebyzero<=divider_info_valid & (~sqrter_info_valid) & divider_dividebyzero;
                innormal_exp<=(sqrter_info_valid | divider_info_valid | muler_info_valid) ? 
                    ((sqrter_info_valid | divider_info_valid) ? (sqrter_info_valid ? sqrter_result_exp : divider_result_exp) : muler_result_exp) :
                    (adder_info_valid ? adder_result_exp : tofloat_result_exp);
                innormal_frac<=(sqrter_info_valid | divider_info_valid | muler_info_valid) ? 
                    ((sqrter_info_valid | divider_info_valid) ? (sqrter_info_valid ? sqrter_result_frac : divider_result_frac) : muler_result_frac) :
                    (adder_info_valid ? adder_result_frac : tofloat_result_frac);
            end
        end
    end

    //f_normal的info格式：
    //[0]=valid, [fpuctrl_cnt:1]=ctrlword, [fpuctrl_cnt+1]=dividebyzero
    //[fpuctrl+info_width+1:fpuctrl_cnt+2]=extra info
    wire            normal_wait;        //TODO
    wire            normal_invalid;
    wire            normal_dividebyzero;
    wire            normal_info_valid;
    wire[info_width - 1:0]      normal_info_ext;
    wire[`FPUCTRL_CNT - 1:0]    normal_info_fpu_ctrl;
    wire            normal_result_sign;
    wire[12:0]      normal_result_exp;
    wire[107:0]     normal_result_frac;
    f_normal #(.info_width(`FPUCTRL_CNT + info_width + 2)) normal(
        .clk(clk),.resetn(resetn),.flush(flush),.a_wait(normal_wait),.busy(normal_busy),
        .exp(innormal_exp),.frac_sign(innormal_sign),.frac_signed(innormal_signed),
        .frac(innormal_frac),.op_invalid(innormal_invalid),
        .info_in({innormal_info,innormal_dividebyzero,innormal_fpu_ctrl,innormal_valid}),
        .info_out({normal_info_ext,normal_dividebyzero,normal_info_fpu_ctrl,normal_info_valid}),
        .invalid(normal_invalid),.result_frac(normal_result_frac),.result_exp(normal_result_exp),.result_sign(normal_result_sign)
    );

    //f_round的info格式：
    //[0]=valid, [fpuctrl_cnt:1]=ctrlword
    //[fpuctrl+info_width:fpuctrl_cnt+1]=extra info
    //目前来看，只有normal连到round输入端，无需仲裁？
    wire            round_info_valid;
    wire[info_width - 1:0]      round_info_ext;
    wire[`FPUCTRL_CNT - 1:0]    round_info_fpu_ctrl;
    wire[63:0]      round_result_double;
    wire[31:0]      round_result_single;
    wire            round_overflow_double;
    wire            round_overflow_single;
    wire            round_underflow_double;
    wire            round_underflow_single;
    wire            round_invalid;
    wire            round_dividebyzero;
    wire            round_busy;
    wire            round_wait;     //TODO
    f_round #(.info_width(`FPUCTRL_CNT + info_width + 1)) round(
        .clk(clk),.resetn(resetn),.flush(flush),.a_wait(round_wait),.busy(round_busy),
        .info_in({normal_info_ext,normal_info_fpu_ctrl,normal_info_valid}),
        .frac(normal_result_frac),.exp(normal_result_exp),.sign(normal_result_sign),
        .in_invalid(normal_invalid),.in_dividebyzero(normal_dividebyzero),
        .round_mode(fcsr_round_mode),.fs(fcsr_fs),
        .info_out({round_info_ext,round_info_fpu_ctrl,round_info_valid}),
        .result_double(round_result_double),.result_single(round_result_single),
        .overflow_double(round_overflow_double),.overflow_single(round_overflow_single),
        .underflow_double(round_underflow_double),.underflow_single(round_underflow_single),
        .invalid(round_invalid),.dividebyzero(round_dividebyzero)
    );

    //处理CPU数据
    wire[63:0] nzresult=((input_op_from_mdu == 0) ^ input_fpu_ctrl[`FPUCTRL_MOVN]) ? input_op_a : input_op_b;
    wire[63:0] cpu_result=(input_fpu_ctrl[`FPUCTRL_MOVMDU] | input_fpu_ctrl[`FPUCTRL_MOVMU]) ? (input_fpu_ctrl[`FPUCTRL_MOVMU] ? input_op_from_mu : {32'b0,input_op_from_mdu}) : nzresult;

    //输出端需要在round和tofixed和input三选一，round>tofixed>input
    wire dirvalid=input_fpu_ctrl[`FPUCTRL_DIRECT] & input_valid;
    wire[63:0] dr=(input_fpu_ctrl[`FPUCTRL_MOVMDU] | input_fpu_ctrl[`FPUCTRL_MOVMU] | input_fpu_ctrl[`FPUCTRL_MOVN] | input_fpu_ctrl[`FPUCTRL_MOVZ]) ? cpu_result :
        (input_fpu_ctrl[`FPUCTRL_OPSNG] ?
        {32'b0,(~input_fpu_ctrl[`FPUCTRL_ABS]) & (input_fpu_ctrl[`FPUCTRL_NEG] ^ input_op_a[31]),input_op_a[30:0]} :
        {(~input_fpu_ctrl[`FPUCTRL_ABS]) & (input_fpu_ctrl[`FPUCTRL_NEG] ^ input_op_a[63]),input_op_a[62:0]});
    wire[63:0] dirresult={input_fpu_ctrl[`FPUCTRL_TOHIGH] ? dr[31:0] : dr[63:32],dr[31:0]};
    
    assign ready=round_info_valid | tofixed_info_valid | dirvalid;
    assign result=round_info_valid ? (round_info_fpu_ctrl[`FPUCTRL_RESSNG] ? {round_result_single,round_result_single} : round_result_double) : (tofixed_info_valid ? {tofixed_result,tofixed_result} : dirresult);
    assign info_out=round_info_valid ? round_info_ext : (tofixed_info_valid ? tofixed_info_ext : input_info);
    assign invalid=round_info_valid ? round_invalid : (tofixed_invalid & tofixed_info_valid);
    //这里注意：我们埋了个坑，abs和neg并不检测NaN……应该也没有什么大问题
    assign overflow=round_info_valid & (round_info_fpu_ctrl[`FPUCTRL_RESSNG] ? round_overflow_single : round_overflow_double);
    assign underflow=round_info_valid & (round_info_fpu_ctrl[`FPUCTRL_RESSNG] ? round_underflow_single : round_underflow_double);
    assign dividebyzero=round_info_valid & round_dividebyzero;

    //阻塞信号
    assign round_wait=a_wait & round_info_valid;
    assign tofixed_wait=(a_wait | round_info_valid) & tofixed_info_valid;
    assign normal_wait=round_busy;
    assign sqrter_wait=normal_busy & sqrter_info_valid;
    assign divider_wait=(normal_busy | sqrter_info_valid) & divider_info_valid;
    assign muler_wait=(normal_busy | sqrter_info_valid | divider_info_valid) & muler_info_valid;
    assign adder_wait=(normal_busy | sqrter_info_valid | divider_info_valid | muler_info_valid) & adder_info_valid;
    assign tofloat_wait=(normal_busy | sqrter_info_valid | divider_info_valid | muler_info_valid | adder_info_valid) & tofloat_info_valid;
    assign prepare_wait=prepare_valid & (
        (sqrter_busy & prepare_fpu_ctrl[`FPUCTRL_SQRT]) |
        (divider_busy & prepare_fpu_ctrl[`FPUCTRL_DIV]) |
        (muler_busy & prepare_fpu_ctrl[`FPUCTRL_MUL]) |
        (adder_busy & prepare_fpu_ctrl[`FPUCTRL_ADD]) |
        (tofixed_busy & prepare_fpu_ctrl[`FPUCTRL_CINT]));
    assign input_wait=input_valid & (
        (tofloat_busy & input_fpu_ctrl[`FPUCTRL_CFNUM]) |
        ((a_wait | round_info_valid | tofixed_info_valid) & input_fpu_ctrl[`FPUCTRL_DIRECT]) |
        (prepare_wait & ~(input_fpu_ctrl[`FPUCTRL_CFNUM] | input_fpu_ctrl[`FPUCTRL_DIRECT])));
    assign busy=input_wait;

endmodule