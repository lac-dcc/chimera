// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  mul.v
// Module  name  :  mul
// Created Time  :  2018/5/15 11:18:33
// Last Modified :  2018/5/20 9:45:40
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/15  chenhaoc
//
// ********************************************************

`define DLY 1
`timescale 1ns/10ps

module mul(
    input  wire        clk,
    input  wire        rst,
    input  wire [63:0] lm,
    input  wire [63:0] rm,
    // input  wire        lm_is_int8, //lm is int or uint
    input  wire [1:0]  Data_type,
    output reg  [19:0] mul_out

);

wire is_8;
wire is_exp4;
wire is_ternary;
assign is_8 = Data_type==2'b11 || Data_type==2'b00;//11->int8; 00->uint8
assign lm_is_int8 = Data_type==2'b11;
assign is_exp4 = Data_type==2'b10;
assign is_ternary = Data_type==2'b01;

// =====================================================================
//                 I N T 8 : mul
// =====================================================================
wire [8:0] lms_0;
wire [8:0] lms_1;
wire [8:0] lms_2;
wire [8:0] lms_3;
wire [8:0] lms_4;
wire [8:0] lms_5;
wire [8:0] lms_6;
wire [8:0] lms_7;
wire [7:0] rm8_0;
wire [7:0] rm8_1;
wire [7:0] rm8_2;
wire [7:0] rm8_3;
wire [7:0] rm8_4;
wire [7:0] rm8_5;
wire [7:0] rm8_6;
wire [7:0] rm8_7;
wire [16:0] mul_int8_0;
wire [16:0] mul_int8_1;
wire [16:0] mul_int8_2;
wire [16:0] mul_int8_3;
wire [16:0] mul_int8_4;
wire [16:0] mul_int8_5;
wire [16:0] mul_int8_6;
wire [16:0] mul_int8_7;

assign lms_0 = !is_8 ? 9'd0 : lm_is_int8 ? {lm[7 ],lm[7 :0 ]} : {1'b0,lm[7 :0 ]};
assign lms_1 = !is_8 ? 9'd0 : lm_is_int8 ? {lm[15],lm[15:8 ]} : {1'b0,lm[15:8 ]};
assign lms_2 = !is_8 ? 9'd0 : lm_is_int8 ? {lm[23],lm[23:16]} : {1'b0,lm[23:16]};
assign lms_3 = !is_8 ? 9'd0 : lm_is_int8 ? {lm[31],lm[31:24]} : {1'b0,lm[31:24]};
assign lms_4 = !is_8 ? 9'd0 : lm_is_int8 ? {lm[39],lm[39:32]} : {1'b0,lm[39:32]};
assign lms_5 = !is_8 ? 9'd0 : lm_is_int8 ? {lm[47],lm[47:40]} : {1'b0,lm[47:40]};
assign lms_6 = !is_8 ? 9'd0 : lm_is_int8 ? {lm[55],lm[55:48]} : {1'b0,lm[55:48]};
assign lms_7 = !is_8 ? 9'd0 : lm_is_int8 ? {lm[63],lm[63:56]} : {1'b0,lm[63:56]};

assign {rm8_7,rm8_6,rm8_5,rm8_4,rm8_3,rm8_2,rm8_1,rm8_0} = rm;

mul_int8     u_mul_int8_0(
     .rs1   (lms_0     )
    ,.rs2   (rm8_0     )
    ,.mul   (mul_int8_0)
);

mul_int8     u_mul_int8_1(
     .rs1   (lms_1     )
    ,.rs2   (rm8_1     )
    ,.mul   (mul_int8_1)
);

mul_int8     u_mul_int8_2(
     .rs1   (lms_2     )
    ,.rs2   (rm8_2     )
    ,.mul   (mul_int8_2)
);

mul_int8     u_mul_int8_3(
     .rs1   (lms_3     )
    ,.rs2   (rm8_3     )
    ,.mul   (mul_int8_3)
);

mul_int8     u_mul_int8_4(
     .rs1   (lms_4     )
    ,.rs2   (rm8_4     )
    ,.mul   (mul_int8_4)
);

mul_int8     u_mul_int8_5(
     .rs1   (lms_5     )
    ,.rs2   (rm8_5     )
    ,.mul   (mul_int8_5)
);

mul_int8     u_mul_int8_6(
     .rs1   (lms_6     )
    ,.rs2   (rm8_6     )
    ,.mul   (mul_int8_6)
);

mul_int8     u_mul_int8_7(
     .rs1   (lms_7     )
    ,.rs2   (rm8_7     )
    ,.mul   (mul_int8_7)
);


// =====================================================================
//                 E X P 4 : mul
// =====================================================================
function [13:0] exp4mul;
    input [3:0] a;
    input [3:0] b;
    reg [3:0] exp;
    reg zero_f;
    reg sign;
    reg [12:0] exp_decode;
    begin
        zero_f = (~|a[2:0]) | (~|b[2:0]);
        sign = a[3]^b[3];
        exp = zero_f ? 4'b0000 : a[2:0] + b[2:0] - 2'b10;
        exp_decode = 13'd1 << exp;
        // exp4mul = zero_f ? 14'd0 :
            // sign ? {1'b1,~exp_decode+1'b1} :
            // {1'b0, exp_decode};
        exp4mul = zero_f ? 14'h2000 :
            sign ? {1'b0,~exp_decode+1'b1} :
            {1'b1, exp_decode}; //need sub 14'h2000

    end
endfunction

wire [13:0] mul_exp4_0;
wire [13:0] mul_exp4_1;
wire [13:0] mul_exp4_2;
wire [13:0] mul_exp4_3;
wire [13:0] mul_exp4_4;
wire [13:0] mul_exp4_5;
wire [13:0] mul_exp4_6;
wire [13:0] mul_exp4_7;
wire [13:0] mul_exp4_8;
wire [13:0] mul_exp4_9;
wire [13:0] mul_exp4_10;
wire [13:0] mul_exp4_11;
wire [13:0] mul_exp4_12;
wire [13:0] mul_exp4_13;
wire [13:0] mul_exp4_14;
wire [13:0] mul_exp4_15;
assign mul_exp4_0  = is_exp4 ? exp4mul(lm[ 3:0 ], rm[ 3:0 ]) : 14'd0;
assign mul_exp4_1  = is_exp4 ? exp4mul(lm[ 7:4 ], rm[ 7:4 ]) : 14'd0;
assign mul_exp4_2  = is_exp4 ? exp4mul(lm[11:8 ], rm[11:8 ]) : 14'd0;
assign mul_exp4_3  = is_exp4 ? exp4mul(lm[15:12], rm[15:12]) : 14'd0;
assign mul_exp4_4  = is_exp4 ? exp4mul(lm[19:16], rm[19:16]) : 14'd0;
assign mul_exp4_5  = is_exp4 ? exp4mul(lm[23:20], rm[23:20]) : 14'd0;
assign mul_exp4_6  = is_exp4 ? exp4mul(lm[27:24], rm[27:24]) : 14'd0;
assign mul_exp4_7  = is_exp4 ? exp4mul(lm[31:28], rm[31:28]) : 14'd0;
assign mul_exp4_8  = is_exp4 ? exp4mul(lm[35:32], rm[35:32]) : 14'd0;
assign mul_exp4_9  = is_exp4 ? exp4mul(lm[39:36], rm[39:36]) : 14'd0;
assign mul_exp4_10 = is_exp4 ? exp4mul(lm[43:40], rm[43:40]) : 14'd0;
assign mul_exp4_11 = is_exp4 ? exp4mul(lm[47:44], rm[47:44]) : 14'd0;
assign mul_exp4_12 = is_exp4 ? exp4mul(lm[51:48], rm[51:48]) : 14'd0;
assign mul_exp4_13 = is_exp4 ? exp4mul(lm[55:52], rm[55:52]) : 14'd0;
assign mul_exp4_14 = is_exp4 ? exp4mul(lm[59:56], rm[59:56]) : 14'd0;
assign mul_exp4_15 = is_exp4 ? exp4mul(lm[63:60], rm[63:60]) : 14'd0;
wire [14:0] mul_exp4_l0;
wire [14:0] mul_exp4_l1;
wire [14:0] mul_exp4_l2;
wire [14:0] mul_exp4_l3;
wire [14:0] mul_exp4_l4;
wire [14:0] mul_exp4_l5;
wire [14:0] mul_exp4_l6;
wire [14:0] mul_exp4_l7;
assign mul_exp4_l0 = mul_exp4_0 + mul_exp4_1;
assign mul_exp4_l1 = mul_exp4_2 + mul_exp4_3;
assign mul_exp4_l2 = mul_exp4_4 + mul_exp4_5;
assign mul_exp4_l3 = mul_exp4_6 + mul_exp4_7;
assign mul_exp4_l4 = mul_exp4_8 + mul_exp4_9;
assign mul_exp4_l5 = mul_exp4_10 + mul_exp4_11;
assign mul_exp4_l6 = mul_exp4_12 + mul_exp4_13;
assign mul_exp4_l7 = mul_exp4_14 + mul_exp4_15;

// =====================================================================
//                 T e r n a r y : mul
// =====================================================================
function [1:0] ternary2mul;
    input [1:0] a;
    input [1:0] b;
    begin
        // ternary2mul = ((~|a) | (~|b)) ? 2'b00 : {a[1]^b[1],1'b1};
        ternary2mul = ((~|a) | (~|b)) ? 2'b10 : {a[1]~^b[1],1'b1};//need sub 2'b10
    end
endfunction

wire [1:0] mul_ter2_0;
wire [1:0] mul_ter2_1;
wire [1:0] mul_ter2_2;
wire [1:0] mul_ter2_3;
wire [1:0] mul_ter2_4;
wire [1:0] mul_ter2_5;
wire [1:0] mul_ter2_6;
wire [1:0] mul_ter2_7;
wire [1:0] mul_ter2_8;
wire [1:0] mul_ter2_9;
wire [1:0] mul_ter2_10;
wire [1:0] mul_ter2_11;
wire [1:0] mul_ter2_12;
wire [1:0] mul_ter2_13;
wire [1:0] mul_ter2_14;
wire [1:0] mul_ter2_15;
wire [1:0] mul_ter2_16;
wire [1:0] mul_ter2_17;
wire [1:0] mul_ter2_18;
wire [1:0] mul_ter2_19;
wire [1:0] mul_ter2_20;
wire [1:0] mul_ter2_21;
wire [1:0] mul_ter2_22;
wire [1:0] mul_ter2_23;
wire [1:0] mul_ter2_24;
wire [1:0] mul_ter2_25;
wire [1:0] mul_ter2_26;
wire [1:0] mul_ter2_27;
wire [1:0] mul_ter2_28;
wire [1:0] mul_ter2_29;
wire [1:0] mul_ter2_30;
wire [1:0] mul_ter2_31;
assign mul_ter2_0  = is_ternary ? ternary2mul(lm[ 1:0 ],rm[ 1:0 ]) : 2'b00;
assign mul_ter2_1  = is_ternary ? ternary2mul(lm[ 3:2 ],rm[ 3:2 ]) : 2'b00;
assign mul_ter2_2  = is_ternary ? ternary2mul(lm[ 5:4 ],rm[ 5:4 ]) : 2'b00;
assign mul_ter2_3  = is_ternary ? ternary2mul(lm[ 7:6 ],rm[ 7:6 ]) : 2'b00;
assign mul_ter2_4  = is_ternary ? ternary2mul(lm[ 9:8 ],rm[ 9:8 ]) : 2'b00;
assign mul_ter2_5  = is_ternary ? ternary2mul(lm[11:10],rm[11:10]) : 2'b00;
assign mul_ter2_6  = is_ternary ? ternary2mul(lm[13:12],rm[13:12]) : 2'b00;
assign mul_ter2_7  = is_ternary ? ternary2mul(lm[15:14],rm[15:14]) : 2'b00;
assign mul_ter2_8  = is_ternary ? ternary2mul(lm[17:16],rm[17:16]) : 2'b00;
assign mul_ter2_9  = is_ternary ? ternary2mul(lm[19:18],rm[19:18]) : 2'b00;
assign mul_ter2_10 = is_ternary ? ternary2mul(lm[21:20],rm[21:20]) : 2'b00;
assign mul_ter2_11 = is_ternary ? ternary2mul(lm[23:22],rm[23:22]) : 2'b00;
assign mul_ter2_12 = is_ternary ? ternary2mul(lm[25:24],rm[25:24]) : 2'b00;
assign mul_ter2_13 = is_ternary ? ternary2mul(lm[27:26],rm[27:26]) : 2'b00;
assign mul_ter2_14 = is_ternary ? ternary2mul(lm[29:28],rm[29:28]) : 2'b00;
assign mul_ter2_15 = is_ternary ? ternary2mul(lm[31:30],rm[31:30]) : 2'b00;
assign mul_ter2_16 = is_ternary ? ternary2mul(lm[33:32],rm[33:32]) : 2'b00;
assign mul_ter2_17 = is_ternary ? ternary2mul(lm[35:34],rm[35:34]) : 2'b00;
assign mul_ter2_18 = is_ternary ? ternary2mul(lm[37:36],rm[37:36]) : 2'b00;
assign mul_ter2_19 = is_ternary ? ternary2mul(lm[39:38],rm[39:38]) : 2'b00;
assign mul_ter2_20 = is_ternary ? ternary2mul(lm[41:40],rm[41:40]) : 2'b00;
assign mul_ter2_21 = is_ternary ? ternary2mul(lm[43:42],rm[43:42]) : 2'b00;
assign mul_ter2_22 = is_ternary ? ternary2mul(lm[45:44],rm[45:44]) : 2'b00;
assign mul_ter2_23 = is_ternary ? ternary2mul(lm[47:46],rm[47:46]) : 2'b00;
assign mul_ter2_24 = is_ternary ? ternary2mul(lm[49:48],rm[49:48]) : 2'b00;
assign mul_ter2_25 = is_ternary ? ternary2mul(lm[51:50],rm[51:50]) : 2'b00;
assign mul_ter2_26 = is_ternary ? ternary2mul(lm[53:52],rm[53:52]) : 2'b00;
assign mul_ter2_27 = is_ternary ? ternary2mul(lm[55:54],rm[55:54]) : 2'b00;
assign mul_ter2_28 = is_ternary ? ternary2mul(lm[57:56],rm[57:56]) : 2'b00;
assign mul_ter2_29 = is_ternary ? ternary2mul(lm[59:58],rm[59:58]) : 2'b00;
assign mul_ter2_30 = is_ternary ? ternary2mul(lm[61:60],rm[61:60]) : 2'b00;
assign mul_ter2_31 = is_ternary ? ternary2mul(lm[63:62],rm[63:62]) : 2'b00;

wire [39:0] pp_ter2_in_3;
wire [39:0] pp_ter2_in_2;
wire [39:0] pp_ter2_in_1;
wire [39:0] pp_ter2_in_0;
wire [4:0] pp_ter2_out_0;
wire [4:0] pp_ter2_out_1;
wire [4:0] pp_ter2_out_2;
wire [4:0] pp_ter2_out_3;
wire [4:0] pp_ter2_out_4;
wire [4:0] pp_ter2_out_5;
wire [4:0] pp_ter2_out_6;
wire [4:0] pp_ter2_out_7;
assign pp_ter2_in_3 = {3'b000,mul_ter2_31, 3'b000,mul_ter2_30, 3'b000,mul_ter2_29, 3'b000,mul_ter2_28,
                       3'b000,mul_ter2_27, 3'b000,mul_ter2_26, 3'b000,mul_ter2_25, 3'b000,mul_ter2_24};
assign pp_ter2_in_2 = {3'b000,mul_ter2_23, 3'b000,mul_ter2_22, 3'b000,mul_ter2_21, 3'b000,mul_ter2_20,
                       3'b000,mul_ter2_19, 3'b000,mul_ter2_18, 3'b000,mul_ter2_17, 3'b000,mul_ter2_16};
assign pp_ter2_in_1 = {3'b000,mul_ter2_15, 3'b000,mul_ter2_14, 3'b000,mul_ter2_13, 3'b000,mul_ter2_12,
                       3'b000,mul_ter2_11, 3'b000,mul_ter2_10, 3'b000,mul_ter2_9,  3'b000,mul_ter2_8};
assign pp_ter2_in_0 = {3'b000,mul_ter2_7,  3'b000,mul_ter2_6,  3'b000,mul_ter2_5,  3'b000,mul_ter2_4,
                       3'b000,mul_ter2_3,  3'b000,mul_ter2_2,  3'b000,mul_ter2_1,  3'b000,mul_ter2_0};

DW02_tree #(8, 5) u_tree_ter0 (
   .INPUT    (pp_ter2_in_0[39:0])
  ,.OUT0     (pp_ter2_out_0[4:0])
  ,.OUT1     (pp_ter2_out_1[4:0])
);
DW02_tree #(8, 5) u_tree_ter1 (
   .INPUT    (pp_ter2_in_1[39:0])
  ,.OUT0     (pp_ter2_out_2[4:0])
  ,.OUT1     (pp_ter2_out_3[4:0])
);
DW02_tree #(8, 5) u_tree_ter2 (
   .INPUT    (pp_ter2_in_2[39:0])
  ,.OUT0     (pp_ter2_out_4[4:0])
  ,.OUT1     (pp_ter2_out_5[4:0])
);
DW02_tree #(8, 5) u_tree_ter3 (
   .INPUT    (pp_ter2_in_3[39:0])
  ,.OUT0     (pp_ter2_out_6[4:0])
  ,.OUT1     (pp_ter2_out_7[4:0])
);

// =====================================================================
//                 P a r t i a l     R E G
// =====================================================================
reg [16:0] pp_reg[0:7];
wire [16:0] pp_reg_w[0:7];
assign pp_reg_w[0] = is_8 ? mul_int8_0[16:0] : is_exp4 ? {2'b00, mul_exp4_l0} : {{12{1'b0}}, pp_ter2_out_0};
assign pp_reg_w[1] = is_8 ? mul_int8_1[16:0] : is_exp4 ? {2'b00, mul_exp4_l1} : {{12{1'b0}}, pp_ter2_out_1};
assign pp_reg_w[2] = is_8 ? mul_int8_2[16:0] : is_exp4 ? {2'b00, mul_exp4_l2} : {{12{1'b0}}, pp_ter2_out_2};
assign pp_reg_w[3] = is_8 ? mul_int8_3[16:0] : is_exp4 ? {2'b00, mul_exp4_l3} : {{12{1'b0}}, pp_ter2_out_3};
assign pp_reg_w[4] = is_8 ? mul_int8_4[16:0] : is_exp4 ? {2'b00, mul_exp4_l4} : {{12{1'b0}}, pp_ter2_out_4};
assign pp_reg_w[5] = is_8 ? mul_int8_5[16:0] : is_exp4 ? {2'b00, mul_exp4_l5} : {{12{1'b0}}, pp_ter2_out_5};
assign pp_reg_w[6] = is_8 ? mul_int8_6[16:0] : is_exp4 ? {2'b00, mul_exp4_l6} : {{12{1'b0}}, pp_ter2_out_6};
assign pp_reg_w[7] = is_8 ? mul_int8_7[16:0] : is_exp4 ? {2'b00, mul_exp4_l7} : {{12{1'b0}}, pp_ter2_out_7};

always @(posedge clk) begin
    if(rst) begin
        pp_reg[0] <= #`DLY {17{1'b0}};
        pp_reg[1] <= #`DLY {17{1'b0}};
        pp_reg[2] <= #`DLY {17{1'b0}};
        pp_reg[3] <= #`DLY {17{1'b0}};
        pp_reg[4] <= #`DLY {17{1'b0}};
        pp_reg[5] <= #`DLY {17{1'b0}};
        pp_reg[6] <= #`DLY {17{1'b0}};
        pp_reg[7] <= #`DLY {17{1'b0}};
    end else begin
        pp_reg[0] <= #`DLY pp_reg_w[0];
        pp_reg[1] <= #`DLY pp_reg_w[1];
        pp_reg[2] <= #`DLY pp_reg_w[2];
        pp_reg[3] <= #`DLY pp_reg_w[3];
        pp_reg[4] <= #`DLY pp_reg_w[4];
        pp_reg[5] <= #`DLY pp_reg_w[5];
        pp_reg[6] <= #`DLY pp_reg_w[6];
        pp_reg[7] <= #`DLY pp_reg_w[7];
    end
end

// =====================================================================
//                 M A C   T R E E
// =====================================================================
wire [19:0] res_sub;
assign res_sub = is_8 ? 20'hAB000 :  //int8:  -8*'hAA00 = 8*'hF5600 ='hAB000
                 is_exp4 ? 20'hE0000 :  //exp4: -16*'h2000 =16*'hFE000 ='hE000
                 20'hFFFC0;             //ter2: -32*'b10   = -64 = 'hFFFC0

wire [179:0] mul_src;
assign mul_src = {3'b000,pp_reg[7], 3'b000,pp_reg[6], 3'b000,pp_reg[5], 3'b000,pp_reg[4],
                  3'b000,pp_reg[3], 3'b000,pp_reg[2], 3'b000,pp_reg[1], 3'b000,pp_reg[0],
                  res_sub[19:0] };

wire [19:0] mul_out0,mul_out1;
DW02_tree #(9, 20) u_tree_mul (
   .INPUT    (mul_src[179:0])
  ,.OUT0     (mul_out0[19:0])
  ,.OUT1     (mul_out1[19:0])
);

wire [19:0] mul_out_w;
assign mul_out_w = mul_out0 + mul_out1;

always @(posedge clk) begin
    if(rst)
        mul_out <= #`DLY {20{1'b0}};
    else
        mul_out <= #`DLY mul_out_w;
end

endmodule

