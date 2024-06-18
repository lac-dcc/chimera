// This program was cloned from: https://github.com/raymondrc/FPGA_SM4
// License: GNU General Public License v3.0

`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Raymond Rui Chen, raymond.rui.chen@qq.com
// 
// Create Date: 2018/03/10 10:37:43
// Design Name: 
// Module Name: sm4_encdec
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module sm4_encdec(
    clk                 ,
    reset_n             ,
    sm4_enable_in       ,
    encdec_enable_in    ,
    key_exp_ready_in    ,
    valid_in            ,
    data_in             ,
    rk_00_in            ,
    rk_01_in            ,
    rk_02_in            ,
    rk_03_in            ,
    rk_04_in            ,
    rk_05_in            ,
    rk_06_in            ,
    rk_07_in            ,
    rk_08_in            ,
    rk_09_in            ,
    rk_10_in            ,
    rk_11_in            ,
    rk_12_in            ,
    rk_13_in            ,
    rk_14_in            ,
    rk_15_in            ,
    rk_16_in            ,
    rk_17_in            ,
    rk_18_in            ,
    rk_19_in            ,
    rk_20_in            ,
    rk_21_in            ,
    rk_22_in            ,
    rk_23_in            ,
    rk_24_in            ,
    rk_25_in            ,
    rk_26_in            ,
    rk_27_in            ,
    rk_28_in            ,
    rk_29_in            ,
    rk_30_in            ,
    rk_31_in            ,
    ready_out           ,
    result_out      
);
    input			 clk		        ;
    input			 reset_n	        ;
    input            sm4_enable_in      ;
    input            encdec_enable_in   ;
    input            key_exp_ready_in   ;
    input            valid_in           ;
    input   [127: 0] data_in            ;
    input   [31 : 0] rk_00_in           ;
    input   [31 : 0] rk_01_in           ;
    input   [31 : 0] rk_02_in           ;
    input   [31 : 0] rk_03_in           ;
    input   [31 : 0] rk_04_in           ;
    input   [31 : 0] rk_05_in           ;
    input   [31 : 0] rk_06_in           ;
    input   [31 : 0] rk_07_in           ;
    input   [31 : 0] rk_08_in           ;
    input   [31 : 0] rk_09_in           ;
    input   [31 : 0] rk_10_in           ;
    input   [31 : 0] rk_11_in           ;
    input   [31 : 0] rk_12_in           ;
    input   [31 : 0] rk_13_in           ;
    input   [31 : 0] rk_14_in           ;
    input   [31 : 0] rk_15_in           ;
    input   [31 : 0] rk_16_in           ;
    input   [31 : 0] rk_17_in           ;
    input   [31 : 0] rk_18_in           ;
    input   [31 : 0] rk_19_in           ;
    input   [31 : 0] rk_20_in           ;
    input   [31 : 0] rk_21_in           ;
    input   [31 : 0] rk_22_in           ;
    input   [31 : 0] rk_23_in           ;
    input   [31 : 0] rk_24_in           ;
    input   [31 : 0] rk_25_in           ;
    input   [31 : 0] rk_26_in           ;
    input   [31 : 0] rk_27_in           ;
    input   [31 : 0] rk_28_in           ;
    input   [31 : 0] rk_29_in           ;
    input   [31 : 0] rk_30_in           ;
    input   [31 : 0] rk_31_in           ;
    output  [127: 0] result_out         ;   
    output           ready_out          ;
    
    reg     [127 : 0] reg_result_00     ;
    reg     [127 : 0] reg_result_01     ;
    reg     [127 : 0] reg_result_02     ;
    reg     [127 : 0] reg_result_03     ;
    reg     [127 : 0] reg_result_04     ;
    reg     [127 : 0] reg_result_05     ;
    reg     [127 : 0] reg_result_06     ;
    reg     [127 : 0] reg_result_07     ;
    reg     [127 : 0] reg_result_08     ;
    reg     [127 : 0] reg_result_09     ;
    reg     [127 : 0] reg_result_10     ;
    reg     [127 : 0] reg_result_11     ;
    reg     [127 : 0] reg_result_12     ;
    reg     [127 : 0] reg_result_13     ;
    reg     [127 : 0] reg_result_14     ;
    reg     [127 : 0] reg_result_15     ;
    reg     [127 : 0] reg_result_16     ;
    reg     [127 : 0] reg_result_17     ;
    reg     [127 : 0] reg_result_18     ;
    reg     [127 : 0] reg_result_19     ;
    reg     [127 : 0] reg_result_20     ;
    reg     [127 : 0] reg_result_21     ;
    reg     [127 : 0] reg_result_22     ;
    reg     [127 : 0] reg_result_23     ;
    reg     [127 : 0] reg_result_24     ;
    reg     [127 : 0] reg_result_25     ;
    reg     [127 : 0] reg_result_26     ;
    reg     [127 : 0] reg_result_27     ;
    reg     [127 : 0] reg_result_28     ;
    reg     [127 : 0] reg_result_29     ;
    reg     [127 : 0] reg_result_30     ;
    reg     [127 : 0] result_out        ;
    reg     [31  : 0] reg_tmp           ;
    wire    [31  : 0] word_0            ;
    wire    [31  : 0] word_1            ;
    wire    [31  : 0] word_2            ;
    wire    [31  : 0] word_3            ;
    wire    [127 : 0] reversed_result_31;
    wire    [127 : 0] result_00         ;
    wire    [127 : 0] result_01         ;
    wire    [127 : 0] result_02         ;
    wire    [127 : 0] result_03         ;
    wire    [127 : 0] result_04         ;
    wire    [127 : 0] result_05         ;
    wire    [127 : 0] result_06         ;
    wire    [127 : 0] result_07         ;
    wire    [127 : 0] result_08         ;
    wire    [127 : 0] result_09         ;
    wire    [127 : 0] result_10         ;
    wire    [127 : 0] result_11         ;
    wire    [127 : 0] result_12         ;
    wire    [127 : 0] result_13         ;
    wire    [127 : 0] result_14         ;
    wire    [127 : 0] result_15         ;
    wire    [127 : 0] result_16         ;
    wire    [127 : 0] result_17         ;
    wire    [127 : 0] result_18         ;
    wire    [127 : 0] result_19         ;
    wire    [127 : 0] result_20         ;
    wire    [127 : 0] result_21         ;
    wire    [127 : 0] result_22         ;
    wire    [127 : 0] result_23         ;
    wire    [127 : 0] result_24         ;
    wire    [127 : 0] result_25         ;
    wire    [127 : 0] result_26         ;
    wire    [127 : 0] result_27         ;
    wire    [127 : 0] result_28         ;
    wire    [127 : 0] result_29         ;
    wire    [127 : 0] result_30         ;
    wire    [127 : 0] result_31         ;
    reg     [1   : 0] current           ;
    reg     [1   : 0] next              ;
    
    `define IDLE                2'b00
    `define WAITING_FOR_KEY     2'b01
    `define ENCRYPTION          2'b10
    
    always@(posedge clk or negedge reset_n)
    if(!reset_n)
        current <= `IDLE;
    else if(sm4_enable_in)
        current <= next;
        
    always@(*)        
        begin
            next = `IDLE;
            case(current)
                `IDLE :
                        if(sm4_enable_in && encdec_enable_in)
                            next = `WAITING_FOR_KEY;
                        else
                            next = `IDLE;
                `WAITING_FOR_KEY :
                        if(key_exp_ready_in)
                            next = `ENCRYPTION;
                        else
                            next = `WAITING_FOR_KEY;
                `ENCRYPTION :
                        if(!encdec_enable_in || !sm4_enable_in)
                            next = `IDLE;
                        else 
                            next = `ENCRYPTION;
                default :
                        next = `IDLE;
            endcase
        end
                
    always@(posedge clk or negedge reset_n)
    if(!reset_n)
        reg_tmp <= 32'b0;
    else if(current == `ENCRYPTION && valid_in)
        reg_tmp <= {reg_tmp[30 : 0], 1'b1};
    else
        reg_tmp <= {reg_tmp[30 : 0], 1'b0};


    assign ready_out = reg_tmp[31];
    
    one_round_for_encdec u_00 ( .data_in(data_in      ), .round_key_in(rk_00_in), .result_out(result_00) );
    one_round_for_encdec u_01 ( .data_in(reg_result_00), .round_key_in(rk_01_in), .result_out(result_01) );
    one_round_for_encdec u_02 ( .data_in(reg_result_01), .round_key_in(rk_02_in), .result_out(result_02) );
    one_round_for_encdec u_03 ( .data_in(reg_result_02), .round_key_in(rk_03_in), .result_out(result_03) );
    one_round_for_encdec u_04 ( .data_in(reg_result_03), .round_key_in(rk_04_in), .result_out(result_04) );
    one_round_for_encdec u_05 ( .data_in(reg_result_04), .round_key_in(rk_05_in), .result_out(result_05) );
    one_round_for_encdec u_06 ( .data_in(reg_result_05), .round_key_in(rk_06_in), .result_out(result_06) );
    one_round_for_encdec u_07 ( .data_in(reg_result_06), .round_key_in(rk_07_in), .result_out(result_07) );
    one_round_for_encdec u_08 ( .data_in(reg_result_07), .round_key_in(rk_08_in), .result_out(result_08) );
    one_round_for_encdec u_09 ( .data_in(reg_result_08), .round_key_in(rk_09_in), .result_out(result_09) );
    one_round_for_encdec u_10 ( .data_in(reg_result_09), .round_key_in(rk_10_in), .result_out(result_10) );
    one_round_for_encdec u_11 ( .data_in(reg_result_10), .round_key_in(rk_11_in), .result_out(result_11) );
    one_round_for_encdec u_12 ( .data_in(reg_result_11), .round_key_in(rk_12_in), .result_out(result_12) );
    one_round_for_encdec u_13 ( .data_in(reg_result_12), .round_key_in(rk_13_in), .result_out(result_13) );
    one_round_for_encdec u_14 ( .data_in(reg_result_13), .round_key_in(rk_14_in), .result_out(result_14) );
    one_round_for_encdec u_15 ( .data_in(reg_result_14), .round_key_in(rk_15_in), .result_out(result_15) );
    one_round_for_encdec u_16 ( .data_in(reg_result_15), .round_key_in(rk_16_in), .result_out(result_16) );
    one_round_for_encdec u_17 ( .data_in(reg_result_16), .round_key_in(rk_17_in), .result_out(result_17) );
    one_round_for_encdec u_18 ( .data_in(reg_result_17), .round_key_in(rk_18_in), .result_out(result_18) );
    one_round_for_encdec u_19 ( .data_in(reg_result_18), .round_key_in(rk_19_in), .result_out(result_19) );
    one_round_for_encdec u_20 ( .data_in(reg_result_19), .round_key_in(rk_20_in), .result_out(result_20) );
    one_round_for_encdec u_21 ( .data_in(reg_result_20), .round_key_in(rk_21_in), .result_out(result_21) );
    one_round_for_encdec u_22 ( .data_in(reg_result_21), .round_key_in(rk_22_in), .result_out(result_22) );
    one_round_for_encdec u_23 ( .data_in(reg_result_22), .round_key_in(rk_23_in), .result_out(result_23) );
    one_round_for_encdec u_24 ( .data_in(reg_result_23), .round_key_in(rk_24_in), .result_out(result_24) );
    one_round_for_encdec u_25 ( .data_in(reg_result_24), .round_key_in(rk_25_in), .result_out(result_25) );
    one_round_for_encdec u_26 ( .data_in(reg_result_25), .round_key_in(rk_26_in), .result_out(result_26) );
    one_round_for_encdec u_27 ( .data_in(reg_result_26), .round_key_in(rk_27_in), .result_out(result_27) );
    one_round_for_encdec u_28 ( .data_in(reg_result_27), .round_key_in(rk_28_in), .result_out(result_28) );
    one_round_for_encdec u_29 ( .data_in(reg_result_28), .round_key_in(rk_29_in), .result_out(result_29) );
    one_round_for_encdec u_30 ( .data_in(reg_result_29), .round_key_in(rk_30_in), .result_out(result_30) );
    one_round_for_encdec u_31 ( .data_in(reg_result_30), .round_key_in(rk_31_in), .result_out(result_31) );
    
    assign { word_0, word_1, word_2, word_3} = result_31;
    assign reversed_result_31 = {word_3, word_2, word_1, word_0};
    
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_00 <= 128'h0; else reg_result_00 <= result_00;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_01 <= 128'h0; else reg_result_01 <= result_01;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_02 <= 128'h0; else reg_result_02 <= result_02;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_03 <= 128'h0; else reg_result_03 <= result_03;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_04 <= 128'h0; else reg_result_04 <= result_04;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_05 <= 128'h0; else reg_result_05 <= result_05;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_06 <= 128'h0; else reg_result_06 <= result_06;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_07 <= 128'h0; else reg_result_07 <= result_07;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_08 <= 128'h0; else reg_result_08 <= result_08;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_09 <= 128'h0; else reg_result_09 <= result_09;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_10 <= 128'h0; else reg_result_10 <= result_10;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_11 <= 128'h0; else reg_result_11 <= result_11;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_12 <= 128'h0; else reg_result_12 <= result_12;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_13 <= 128'h0; else reg_result_13 <= result_13;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_14 <= 128'h0; else reg_result_14 <= result_14;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_15 <= 128'h0; else reg_result_15 <= result_15;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_16 <= 128'h0; else reg_result_16 <= result_16;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_17 <= 128'h0; else reg_result_17 <= result_17;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_18 <= 128'h0; else reg_result_18 <= result_18;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_19 <= 128'h0; else reg_result_19 <= result_19;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_20 <= 128'h0; else reg_result_20 <= result_20;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_21 <= 128'h0; else reg_result_21 <= result_21;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_22 <= 128'h0; else reg_result_22 <= result_22;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_23 <= 128'h0; else reg_result_23 <= result_23;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_24 <= 128'h0; else reg_result_24 <= result_24;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_25 <= 128'h0; else reg_result_25 <= result_25;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_26 <= 128'h0; else reg_result_26 <= result_26;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_27 <= 128'h0; else reg_result_27 <= result_27;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_28 <= 128'h0; else reg_result_28 <= result_28;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_29 <= 128'h0; else reg_result_29 <= result_29;
    always@(posedge clk or negedge reset_n) if(!reset_n) reg_result_30 <= 128'h0; else reg_result_30 <= result_30;
    always@(posedge clk or negedge reset_n) if(!reset_n) result_out    <= 128'h0; else result_out    <= reversed_result_31;
        
                                                    
endmodule
