// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

/*
    module ： ALU

    input  ： ifmaps、weight、control signal

    output ： Convolution、Pooling結果

    ALU在接收到load_ifmaps、load_weight時將ifmaps、weight左移進入ALU，並根據operation進行運算Convolution或是Pooling
    Convolution->先以XNOR計算ifmaps與weight是否相同後計算1的數量，在減去Kernal size constant，計算0的-1
                 舉例：kernal size(K) = 3 而1的個數(1_n)為3，0的個數(0_n)為6則Convolution結果為-3(ANS)
                       1_n - 0_n = ANS
                       1_n + 0_n = K^2
                     =>2(1_n) = ANS + K^2
                     =>ANS = 2(1_n) - K^2
                     ->-3  = 2(3) - 9  
    
    Pooling    -> 將ifmaps的25個reg以OR運算即可算出pooling
*/
`timescale  10ns / 10ns
module ALU (
    //global
    input clk,
    input rst_n,

    //data
    input wire ifmaps_row0_in,
    input wire ifmaps_row1_in,
    input wire ifmaps_row2_in,
    input wire ifmaps_row3_in,
    input wire ifmaps_row4_in,

    input wire [24:0] weight_in,

    output wire [5:0] MAC_out,

    //control in
    input wire enable,
    input wire load_ifmaps,
    input wire load_weight,

    input wire [1:0] operation,
    input wire [4:0] kernel_size //one hot vector

);

    // integer idx;
    //ifmaps和weight皆從右邊idx=4進入往左推，這樣在看波型時才不會鏡像相反
    //用不到的reg會有預設值ifmaps=0 weight=1，目的是為了xnor才會=0不會引響bitcount結果
    reg ifmaps_reg_00,ifmaps_reg_01,ifmaps_reg_02,ifmaps_reg_03,ifmaps_reg_04;
    reg ifmaps_reg_10,ifmaps_reg_11,ifmaps_reg_12,ifmaps_reg_13,ifmaps_reg_14;
    reg ifmaps_reg_20,ifmaps_reg_21,ifmaps_reg_22,ifmaps_reg_23,ifmaps_reg_24;
    reg ifmaps_reg_30,ifmaps_reg_31,ifmaps_reg_32,ifmaps_reg_33,ifmaps_reg_34;
    reg ifmaps_reg_40,ifmaps_reg_41,ifmaps_reg_42,ifmaps_reg_43,ifmaps_reg_44;

    reg weight_reg_00,weight_reg_01,weight_reg_02,weight_reg_03,weight_reg_04;
    reg weight_reg_10,weight_reg_11,weight_reg_12,weight_reg_13,weight_reg_14;
    reg weight_reg_20,weight_reg_21,weight_reg_22,weight_reg_23,weight_reg_24;
    reg weight_reg_30,weight_reg_31,weight_reg_32,weight_reg_33,weight_reg_34;
    reg weight_reg_40,weight_reg_41,weight_reg_42,weight_reg_43,weight_reg_44;

    wire [24:0] xnor_op;
    reg [5:0] summation;

    reg [1:0] summation_layer1 [0:11];
    reg [2:0] summation_layer2 [0:5];
    reg [3:0] summation_layer3 [0:2];
    reg [4:0] summation_layer4 [0:1];
    reg [4:0] summation_layer5 ;

    reg [4:0] kenel_constant;

    wire enable_n;//for weight reg to OR it. If enable is 1 then OR 0 ,else OR 1 
    assign enable_n=~enable;

    //operation decode
    wire op_convolution;
    wire op_pooling;
    wire op_linear;
    assign op_convolution=(operation==0);
    assign op_pooling=(operation==1);
    assign op_linear=(operation==2);

    wire pooling;
    assign pooling= ifmaps_reg_00|ifmaps_reg_01|ifmaps_reg_02|ifmaps_reg_03|ifmaps_reg_04|
                    ifmaps_reg_10|ifmaps_reg_11|ifmaps_reg_12|ifmaps_reg_13|ifmaps_reg_14|
                    ifmaps_reg_20|ifmaps_reg_21|ifmaps_reg_22|ifmaps_reg_23|ifmaps_reg_24|
                    ifmaps_reg_30|ifmaps_reg_31|ifmaps_reg_32|ifmaps_reg_33|ifmaps_reg_34|
                    ifmaps_reg_40|ifmaps_reg_41|ifmaps_reg_42|ifmaps_reg_43|ifmaps_reg_44;

    //operation  ->  1: Do Pooling  0: Do MUL
    assign MAC_out = (!enable) ? 6'd0 :
                     op_pooling ? {5'd0,pooling}:
                     op_convolution ? summation:6'd0; 
    
    //kernel後的數字代表設定的kernel_size
    wire kenel_2,kenel_3,kenel_4,kenel_5;
    assign kenel_2=(kernel_size[4]|kernel_size[3]|kernel_size[2]|kernel_size[1]);
    assign kenel_3=(kernel_size[4]|kernel_size[3]|kernel_size[2]);
    assign kenel_4=(kernel_size[4]|kernel_size[3]);
    assign kenel_5=(kernel_size[4]);

    //XNOR 陣列用於判斷是否相等
    assign xnor_op[0] = ifmaps_reg_00 ^~ weight_reg_00;
    assign xnor_op[1] = ifmaps_reg_01 ^~ weight_reg_01;
    assign xnor_op[2] = ifmaps_reg_02 ^~ weight_reg_02;
    assign xnor_op[3] = ifmaps_reg_03 ^~ weight_reg_03;
    assign xnor_op[4] = ifmaps_reg_04 ^~ weight_reg_04;

    assign xnor_op[5] = ifmaps_reg_10 ^~ weight_reg_10;
    assign xnor_op[6] = ifmaps_reg_11 ^~ weight_reg_11;
    assign xnor_op[7] = ifmaps_reg_12 ^~ weight_reg_12;
    assign xnor_op[8] = ifmaps_reg_13 ^~ weight_reg_13;
    assign xnor_op[9] = ifmaps_reg_14 ^~ weight_reg_14;

    assign xnor_op[10] = ifmaps_reg_20 ^~ weight_reg_20;
    assign xnor_op[11] = ifmaps_reg_21 ^~ weight_reg_21;
    assign xnor_op[12] = ifmaps_reg_22 ^~ weight_reg_22;
    assign xnor_op[13] = ifmaps_reg_23 ^~ weight_reg_23;
    assign xnor_op[14] = ifmaps_reg_24 ^~ weight_reg_24;

    assign xnor_op[15] = ifmaps_reg_30 ^~ weight_reg_30;
    assign xnor_op[16] = ifmaps_reg_31 ^~ weight_reg_31;
    assign xnor_op[17] = ifmaps_reg_32 ^~ weight_reg_32;
    assign xnor_op[18] = ifmaps_reg_33 ^~ weight_reg_33;
    assign xnor_op[19] = ifmaps_reg_34 ^~ weight_reg_34;

    assign xnor_op[20] = ifmaps_reg_40 ^~ weight_reg_40;
    assign xnor_op[21] = ifmaps_reg_41 ^~ weight_reg_41;
    assign xnor_op[22] = ifmaps_reg_42 ^~ weight_reg_42;
    assign xnor_op[23] = ifmaps_reg_43 ^~ weight_reg_43;
    assign xnor_op[24] = ifmaps_reg_44 ^~ weight_reg_44;

    //ifmaps陣列當load_ifmaps == 1就左移 
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            ifmaps_reg_00<=0;
            ifmaps_reg_01<=0;
            ifmaps_reg_02<=0;
            ifmaps_reg_03<=0;
            ifmaps_reg_04<=0;
        end
        else begin
            if(load_ifmaps) begin
                ifmaps_reg_00<=kenel_5 & ifmaps_reg_01;
                ifmaps_reg_01<=kenel_4 & ifmaps_reg_02;
                ifmaps_reg_02<=kenel_3 & ifmaps_reg_03;
                ifmaps_reg_03<=kenel_2 & ifmaps_reg_04;
                ifmaps_reg_04<=ifmaps_row0_in & enable;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            ifmaps_reg_10<=0;
            ifmaps_reg_11<=0;
            ifmaps_reg_12<=0;
            ifmaps_reg_13<=0;
            ifmaps_reg_14<=0;
        end
        else begin
            if(load_ifmaps) begin
                ifmaps_reg_10<=kenel_5 & ifmaps_reg_11;
                ifmaps_reg_11<=kenel_4 & ifmaps_reg_12;
                ifmaps_reg_12<=kenel_3 & ifmaps_reg_13;
                ifmaps_reg_13<=kenel_2 & ifmaps_reg_14;
                ifmaps_reg_14<=kenel_2 & enable & ifmaps_row1_in;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            ifmaps_reg_20<=0;
            ifmaps_reg_21<=0;
            ifmaps_reg_22<=0;
            ifmaps_reg_23<=0;
            ifmaps_reg_24<=0;
        end
        else begin
            if(load_ifmaps) begin
                ifmaps_reg_20<=kenel_5 & ifmaps_reg_21;
                ifmaps_reg_21<=kenel_4 & ifmaps_reg_22;
                ifmaps_reg_22<=kenel_3 & ifmaps_reg_23;
                ifmaps_reg_23<=kenel_3 & ifmaps_reg_24;
                ifmaps_reg_24<=kenel_3 & enable & ifmaps_row2_in;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            ifmaps_reg_30<=0;
            ifmaps_reg_31<=0;
            ifmaps_reg_32<=0;
            ifmaps_reg_33<=0;
            ifmaps_reg_34<=0;
        end
        else begin
            if(load_ifmaps) begin
                ifmaps_reg_30<=kenel_5 & ifmaps_reg_31;
                ifmaps_reg_31<=kenel_4 & ifmaps_reg_32;
                ifmaps_reg_32<=kenel_4 & ifmaps_reg_33;
                ifmaps_reg_33<=kenel_4 & ifmaps_reg_34;
                ifmaps_reg_34<=kenel_4 & enable & ifmaps_row3_in;
            end
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            ifmaps_reg_40<=0;
            ifmaps_reg_41<=0;
            ifmaps_reg_42<=0;
            ifmaps_reg_43<=0;
            ifmaps_reg_44<=0;
        end
        else begin
            if(load_ifmaps) begin
                ifmaps_reg_40<=kenel_5 & ifmaps_reg_41;
                ifmaps_reg_41<=kenel_5 & ifmaps_reg_42;
                ifmaps_reg_42<=kenel_5 & ifmaps_reg_43;
                ifmaps_reg_43<=kenel_5 & ifmaps_reg_44;
                ifmaps_reg_44<=kenel_5 & enable & ifmaps_row4_in;
            end
        end
    end

    //weight 陣列會檢查kernel size去填入該填入的位置並讚load weight時左移
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
            weight_reg_00<=1;
            weight_reg_01<=1;
            weight_reg_02<=1;
            weight_reg_03<=1;
            weight_reg_04<=1;
            weight_reg_10<=1;
            weight_reg_11<=1;
            weight_reg_12<=1;
            weight_reg_13<=1;
            weight_reg_14<=1;
            weight_reg_20<=1;
            weight_reg_21<=1;
            weight_reg_22<=1;
            weight_reg_23<=1;
            weight_reg_24<=1;
            weight_reg_30<=1;
            weight_reg_31<=1;
            weight_reg_32<=1;
            weight_reg_33<=1;
            weight_reg_34<=1;
            weight_reg_40<=1;
            weight_reg_41<=1;
            weight_reg_42<=1;
            weight_reg_43<=1;
            weight_reg_44<=1;
        end
        else begin
            if(load_weight & ~operation) begin
                casez (kernel_size)
                    5'b????1:begin
                        weight_reg_00 <= 1;
                        weight_reg_01 <= 1;
                        weight_reg_02 <= 1;
                        weight_reg_03 <= 1;
                        weight_reg_04 <= weight_in[4] | enable_n;

                        weight_reg_10 <= 1;
                        weight_reg_11 <= 1;
                        weight_reg_12 <= 1;
                        weight_reg_13 <= 1;
                        weight_reg_14 <= 1;

                        weight_reg_20 <= 1;
                        weight_reg_21 <= 1;
                        weight_reg_22 <= 1;
                        weight_reg_23 <= 1;
                        weight_reg_24 <= 1;

                        weight_reg_30 <= 1;
                        weight_reg_31 <= 1;
                        weight_reg_32 <= 1;
                        weight_reg_33 <= 1;
                        weight_reg_34 <= 1;

                        weight_reg_40 <= 1;
                        weight_reg_41 <= 1;
                        weight_reg_42 <= 1;
                        weight_reg_43 <= 1;
                        weight_reg_44 <= 1;
                    end 
                    5'b???1?:begin
                        weight_reg_00 <= 1;
                        weight_reg_01 <= 1;
                        weight_reg_02 <= 1;
                        weight_reg_03 <= weight_in[3] | enable_n;
                        weight_reg_04 <= weight_in[4] | enable_n;

                        weight_reg_10 <= 1;
                        weight_reg_11 <= 1;
                        weight_reg_12 <= 1;
                        weight_reg_13 <= weight_in[8] | enable_n;
                        weight_reg_14 <= weight_in[9] | enable_n;

                        weight_reg_20 <= 1;
                        weight_reg_21 <= 1;
                        weight_reg_22 <= 1;
                        weight_reg_23 <= 1;
                        weight_reg_24 <= 1;

                        weight_reg_30 <= 1;
                        weight_reg_31 <= 1;
                        weight_reg_32 <= 1;
                        weight_reg_33 <= 1;
                        weight_reg_34 <= 1;

                        weight_reg_40 <= 1;
                        weight_reg_41 <= 1;
                        weight_reg_42 <= 1;
                        weight_reg_43 <= 1;
                        weight_reg_44 <= 1;
                    end
                    5'b??1??:begin
                        weight_reg_00 <= 1;
                        weight_reg_01 <= 1;
                        weight_reg_02 <= weight_in[2]  | enable_n;
                        weight_reg_03 <= weight_in[3]  | enable_n;
                        weight_reg_04 <= weight_in[4]  | enable_n;

                        weight_reg_10 <= 1;
                        weight_reg_11 <= 1;
                        weight_reg_12 <= weight_in[7]  | enable_n;
                        weight_reg_13 <= weight_in[8]  | enable_n;
                        weight_reg_14 <= weight_in[9]  | enable_n;

                        weight_reg_20 <= 1;
                        weight_reg_21 <= 1;
                        weight_reg_22 <= weight_in[12] | enable_n;
                        weight_reg_23 <= weight_in[13] | enable_n;
                        weight_reg_24 <= weight_in[14] | enable_n;

                        weight_reg_30 <= 1;
                        weight_reg_31 <= 1;
                        weight_reg_32 <= 1;
                        weight_reg_33 <= 1;
                        weight_reg_34 <= 1;

                        weight_reg_40 <= 1;
                        weight_reg_41 <= 1;
                        weight_reg_42 <= 1;
                        weight_reg_43 <= 1;
                        weight_reg_44 <= 1;
                    end
                    5'b?1???:begin
                        weight_reg_00 <= 1;
                        weight_reg_01 <= weight_in[1]  | enable_n;
                        weight_reg_02 <= weight_in[2]  | enable_n;
                        weight_reg_03 <= weight_in[3]  | enable_n;
                        weight_reg_04 <= weight_in[4]  | enable_n;

                        weight_reg_10 <= 1;
                        weight_reg_11 <= weight_in[6]  | enable_n;
                        weight_reg_12 <= weight_in[7]  | enable_n;
                        weight_reg_13 <= weight_in[8]  | enable_n;
                        weight_reg_14 <= weight_in[9]  | enable_n;

                        weight_reg_20 <= 1;
                        weight_reg_21 <= weight_in[11] | enable_n;
                        weight_reg_22 <= weight_in[12] | enable_n;
                        weight_reg_23 <= weight_in[13] | enable_n;
                        weight_reg_24 <= weight_in[14] | enable_n;

                        weight_reg_30 <= 1;
                        weight_reg_31 <= weight_in[16] | enable_n;
                        weight_reg_32 <= weight_in[17] | enable_n;
                        weight_reg_33 <= weight_in[18] | enable_n;
                        weight_reg_34 <= weight_in[19] | enable_n;

                        weight_reg_40 <= 1;
                        weight_reg_41 <= 1;
                        weight_reg_42 <= 1;
                        weight_reg_43 <= 1;
                        weight_reg_44 <= 1;
                    end
                    5'b1????:begin
                        weight_reg_00 <= weight_in[0] | enable_n;
                        weight_reg_01 <= weight_in[1] | enable_n;
                        weight_reg_02 <= weight_in[2] | enable_n;
                        weight_reg_03 <= weight_in[3] | enable_n;
                        weight_reg_04 <= weight_in[4] | enable_n;

                        weight_reg_10 <= weight_in[5] | enable_n;
                        weight_reg_11 <= weight_in[6] | enable_n;
                        weight_reg_12 <= weight_in[7] | enable_n;
                        weight_reg_13 <= weight_in[8] | enable_n;
                        weight_reg_14 <= weight_in[9] | enable_n;

                        weight_reg_20 <= weight_in[10] | enable_n;
                        weight_reg_21 <= weight_in[11] | enable_n;
                        weight_reg_22 <= weight_in[12] | enable_n;
                        weight_reg_23 <= weight_in[13] | enable_n;
                        weight_reg_24 <= weight_in[14] | enable_n;

                        weight_reg_30 <= weight_in[15] | enable_n;
                        weight_reg_31 <= weight_in[16] | enable_n;
                        weight_reg_32 <= weight_in[17] | enable_n;
                        weight_reg_33 <= weight_in[18] | enable_n;
                        weight_reg_34 <= weight_in[19] | enable_n;

                        weight_reg_40 <= weight_in[20] | enable_n;
                        weight_reg_41 <= weight_in[21] | enable_n;
                        weight_reg_42 <= weight_in[22] | enable_n;
                        weight_reg_43 <= weight_in[23] | enable_n;
                        weight_reg_44 <= weight_in[24] | enable_n;
                    end
                    default: begin
                        weight_reg_00 <= weight_reg_00;
                        weight_reg_01 <= weight_reg_01;
                        weight_reg_02 <= weight_reg_02;
                        weight_reg_03 <= weight_reg_03;
                        weight_reg_04 <= weight_reg_04;

                        weight_reg_10 <= weight_reg_10;
                        weight_reg_11 <= weight_reg_11;
                        weight_reg_12 <= weight_reg_12;
                        weight_reg_13 <= weight_reg_13;
                        weight_reg_14 <= weight_reg_14;

                        weight_reg_20 <= weight_reg_20;
                        weight_reg_21 <= weight_reg_21;
                        weight_reg_22 <= weight_reg_22;
                        weight_reg_23 <= weight_reg_23;
                        weight_reg_24 <= weight_reg_24;

                        weight_reg_30 <= weight_reg_30;
                        weight_reg_31 <= weight_reg_31;
                        weight_reg_32 <= weight_reg_32;
                        weight_reg_33 <= weight_reg_33;
                        weight_reg_34 <= weight_reg_34;

                        weight_reg_40 <= weight_reg_40;
                        weight_reg_41 <= weight_reg_41;
                        weight_reg_42 <= weight_reg_42;
                        weight_reg_43 <= weight_reg_43;
                        weight_reg_44 <= weight_reg_44;

                    end
                endcase
            end
        end
    end

    
    //將25個運算結果以adder tree相加
    integer i;
    always @(*) begin
        for(i=0;i<12;i=i+1) begin
            summation_layer1[i] = xnor_op[i*2] + xnor_op[i*2+1];
        end
    end 

    always @(*) begin
        for(i=0;i<6;i=i+1) begin
            summation_layer2[i] = summation_layer1[i*2] + summation_layer1[i*2+1];
        end
    end 

    always @(*) begin
        for(i=0;i<3;i=i+1) begin
            summation_layer3[i] = summation_layer2[i*2] + summation_layer2[i*2+1];
        end
    end 

    always @(*) begin
        summation_layer4[0] = summation_layer3[0] + summation_layer3[1];
        summation_layer4[1] = summation_layer3[2] + xnor_op[24];
    end

    always @(*) begin
        summation_layer5 = summation_layer4[0] + summation_layer4[1];
    end
    
    //因為僅只有算一的數量故需補上一個constant把零的數量補回來
    always @(*) begin
        kenel_constant = kernel_size[4] ? 5'd25 :
                         kernel_size[3] ? 5'd16 :
                         kernel_size[2] ? 5'd9  :
                         kernel_size[1] ? 5'd4  : 5'd1;
    end
    
    always @(*) begin
        summation = {summation_layer5,1'd0} - kenel_constant;
    end

endmodule //MAC