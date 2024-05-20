// This program was cloned from: https://github.com/space789/BNN-Hardware-accelerator
// License: MIT License

module ALU_old (
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

    output wire [4:0] MAC_out,

    //control
    input wire load_ifmaps,
    input wire load_weight,

    input wire operation,
    input wire [4:0] kernel_size

);
    integer idx;

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
    reg [4:0] bitcount;

    wire pooling;
    assign pooling= ifmaps_reg_00|ifmaps_reg_01|ifmaps_reg_02|ifmaps_reg_03|ifmaps_reg_04|
                    ifmaps_reg_10|ifmaps_reg_11|ifmaps_reg_12|ifmaps_reg_13|ifmaps_reg_14|
                    ifmaps_reg_20|ifmaps_reg_21|ifmaps_reg_22|ifmaps_reg_23|ifmaps_reg_24|
                    ifmaps_reg_30|ifmaps_reg_31|ifmaps_reg_32|ifmaps_reg_33|ifmaps_reg_34|
                    ifmaps_reg_40|ifmaps_reg_41|ifmaps_reg_42|ifmaps_reg_43|ifmaps_reg_44;

    assign MAC_out = operation ? {4'd0,pooling}:bitcount;//pooling isnt implement

    wire kenel_2,kenel_3,kenel_4,kenel_5;
    assign kenel_2=(kernel_size[4]|kernel_size[3]|kernel_size[2]|kernel_size[1]);
    assign kenel_3=(kernel_size[4]|kernel_size[3]|kernel_size[2]);
    assign kenel_4=(kernel_size[4]|kernel_size[3]);
    assign kenel_5=(kernel_size[4]);

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

    always @(*) begin
        bitcount=0;
        for(idx=0;idx<25;idx=idx+1) begin
            bitcount=bitcount+xnor_op[idx];
        end
    end

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
                ifmaps_reg_00<=ifmaps_row0_in;
                ifmaps_reg_01<=kenel_2 & ifmaps_reg_00;
                ifmaps_reg_02<=kenel_3 & ifmaps_reg_01;
                ifmaps_reg_03<=kenel_4 & ifmaps_reg_02;
                ifmaps_reg_04<=kenel_5 & ifmaps_reg_03;
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
                ifmaps_reg_10<=kenel_2 & ifmaps_row1_in;
                ifmaps_reg_11<=kenel_2 & ifmaps_reg_10;
                ifmaps_reg_12<=kenel_3 & ifmaps_reg_11;
                ifmaps_reg_13<=kenel_4 & ifmaps_reg_12;
                ifmaps_reg_14<=kenel_5 & ifmaps_reg_13;
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
                ifmaps_reg_20<=kenel_3 & ifmaps_row2_in;
                ifmaps_reg_21<=kenel_3 & ifmaps_reg_20;
                ifmaps_reg_22<=kenel_3 & ifmaps_reg_21;
                ifmaps_reg_23<=kenel_4 & ifmaps_reg_22;
                ifmaps_reg_24<=kenel_5 & ifmaps_reg_23;
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
                ifmaps_reg_30<=kenel_4 & ifmaps_row3_in;
                ifmaps_reg_31<=kenel_4 & ifmaps_reg_30;
                ifmaps_reg_32<=kenel_4 & ifmaps_reg_31;
                ifmaps_reg_33<=kenel_4 & ifmaps_reg_32;
                ifmaps_reg_34<=kenel_5 & ifmaps_reg_33;
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
                ifmaps_reg_40<=kenel_5 & ifmaps_row4_in;
                ifmaps_reg_41<=kenel_5 & ifmaps_reg_40;
                ifmaps_reg_42<=kenel_5 & ifmaps_reg_41;
                ifmaps_reg_43<=kenel_5 & ifmaps_reg_42;
                ifmaps_reg_44<=kenel_5 & ifmaps_reg_43;
            end
        end
    end

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
                        weight_reg_00 <= weight_in[0];
                        weight_reg_01 <= 1;
                        weight_reg_02 <= 1;
                        weight_reg_03 <= 1;
                        weight_reg_04 <= 1;

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
                        weight_reg_00 <= weight_in[0];
                        weight_reg_01 <= weight_in[1];
                        weight_reg_02 <= 1;
                        weight_reg_03 <= 1;
                        weight_reg_04 <= 1;

                        weight_reg_10 <= weight_in[2];
                        weight_reg_11 <= weight_in[3];
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
                    5'b??1??:begin
                        weight_reg_00 <= weight_in[0];
                        weight_reg_01 <= weight_in[1];
                        weight_reg_02 <= weight_in[2];
                        weight_reg_03 <= 1;
                        weight_reg_04 <= 1;

                        weight_reg_10 <= weight_in[3];
                        weight_reg_11 <= weight_in[4];
                        weight_reg_12 <= weight_in[5];
                        weight_reg_13 <= 1;
                        weight_reg_14 <= 1;

                        weight_reg_20 <= weight_in[6];
                        weight_reg_21 <= weight_in[7];
                        weight_reg_22 <= weight_in[8];
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
                    5'b?1???:begin
                        weight_reg_00 <= weight_in[0];
                        weight_reg_01 <= weight_in[1];
                        weight_reg_02 <= weight_in[2];
                        weight_reg_03 <= weight_in[3];
                        weight_reg_04 <= 1;

                        weight_reg_10 <= weight_in[4];
                        weight_reg_11 <= weight_in[5];
                        weight_reg_12 <= weight_in[6];
                        weight_reg_13 <= weight_in[7];
                        weight_reg_14 <= 1;

                        weight_reg_20 <= weight_in[8];
                        weight_reg_21 <= weight_in[9];
                        weight_reg_22 <= weight_in[10];
                        weight_reg_23 <= weight_in[11];
                        weight_reg_24 <= 1;

                        weight_reg_30 <= weight_in[12];
                        weight_reg_31 <= weight_in[13];
                        weight_reg_32 <= weight_in[14];
                        weight_reg_33 <= weight_in[15];
                        weight_reg_34 <= 1;

                        weight_reg_40 <= 1;
                        weight_reg_41 <= 1;
                        weight_reg_42 <= 1;
                        weight_reg_43 <= 1;
                        weight_reg_44 <= 1;
                    end
                    5'b1????:begin
                        weight_reg_00 <= weight_in[0];
                        weight_reg_01 <= weight_in[1];
                        weight_reg_02 <= weight_in[2];
                        weight_reg_03 <= weight_in[3];
                        weight_reg_04 <= weight_in[4];

                        weight_reg_10 <= weight_in[5];
                        weight_reg_11 <= weight_in[6];
                        weight_reg_12 <= weight_in[7];
                        weight_reg_13 <= weight_in[8];
                        weight_reg_14 <= weight_in[9];

                        weight_reg_20 <= weight_in[10];
                        weight_reg_21 <= weight_in[11];
                        weight_reg_22 <= weight_in[12];
                        weight_reg_23 <= weight_in[13];
                        weight_reg_24 <= weight_in[14];

                        weight_reg_30 <= weight_in[15];
                        weight_reg_31 <= weight_in[16];
                        weight_reg_32 <= weight_in[17];
                        weight_reg_33 <= weight_in[18];
                        weight_reg_34 <= weight_in[19];

                        weight_reg_40 <= weight_in[20];
                        weight_reg_41 <= weight_in[21];
                        weight_reg_42 <= weight_in[22];
                        weight_reg_43 <= weight_in[23];
                        weight_reg_44 <= weight_in[24];
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



endmodule //MAC