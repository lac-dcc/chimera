// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  accreg.v
// Module  name  :  accreg
// Created Time  :  2018/5/16 17:22:46
// Last Modified :  2018/5/25 11:51:46
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/16  chenhaoc
//
// ********************************************************

`define DLY 1
`timescale 1ns/10ps

module accreg(
    input  wire             clk,
    input  wire             rst,
    //config read/write
    input  wire             wen,
    input  wire  [2:0]      w_acc_id,
    input  wire  [3:0]      w_pe_id,
    input  wire  [31:0]     w_wd,
    input  wire             ren,
    input  wire  [2:0]      r_acc_id,
    input  wire  [3:0]      r_pe_id,
    output wire  [31:0]     r_rd,
    //mac
    input  wire             mac_out_en,
    input  wire  [2:0]      mac_acc_id,
    input  wire  [319:0]    mul_out_dat,
    //relu
    input  wire             relu_ren,
    input  wire             relu_ren_st,
    input  wire  [2:0]      relu_acc_id,
    output wire  [31:0]     relu_accreg_0,
    output wire  [31:0]     relu_accreg_1,
    output wire  [31:0]     relu_accreg_2,
    output wire  [31:0]     relu_accreg_3,
    output reg              relu_accreg_en,

    input  wire             relu_out_continue,
    output reg              relu_done,
    input  wire             eai_rsp_valid,
    input  wire             eai_rsp_ready
);

reg [31:0] AccReg[0:7][0:15];



//===============================================================
//          M A C
//===============================================================
wire [19:0] mul_out_0;
wire [19:0] mul_out_1;
wire [19:0] mul_out_2;
wire [19:0] mul_out_3;
wire [19:0] mul_out_4;
wire [19:0] mul_out_5;
wire [19:0] mul_out_6;
wire [19:0] mul_out_7;
wire [19:0] mul_out_8;
wire [19:0] mul_out_9;
wire [19:0] mul_out_10;
wire [19:0] mul_out_11;
wire [19:0] mul_out_12;
wire [19:0] mul_out_13;
wire [19:0] mul_out_14;
wire [19:0] mul_out_15;
wire [32:0] add0 ;
wire [32:0] add1 ;
wire [32:0] add2 ;
wire [32:0] add3 ;
wire [32:0] add4 ;
wire [32:0] add5 ;
wire [32:0] add6 ;
wire [32:0] add7 ;
wire [32:0] add8 ;
wire [32:0] add9 ;
wire [32:0] add10;
wire [32:0] add11;
wire [32:0] add12;
wire [32:0] add13;
wire [32:0] add14;
wire [32:0] add15;
wire [31:0] add0_s ;
wire [31:0] add1_s ;
wire [31:0] add2_s ;
wire [31:0] add3_s ;
wire [31:0] add4_s ;
wire [31:0] add5_s ;
wire [31:0] add6_s ;
wire [31:0] add7_s ;
wire [31:0] add8_s ;
wire [31:0] add9_s ;
wire [31:0] add10_s;
wire [31:0] add11_s;
wire [31:0] add12_s;
wire [31:0] add13_s;
wire [31:0] add14_s;
wire [31:0] add15_s;

wire [31:0] add_src0 ;
wire [31:0] add_src1 ;
wire [31:0] add_src2 ;
wire [31:0] add_src3 ;
wire [31:0] add_src4 ;
wire [31:0] add_src5 ;
wire [31:0] add_src6 ;
wire [31:0] add_src7 ;
wire [31:0] add_src8 ;
wire [31:0] add_src9 ;
wire [31:0] add_src10;
wire [31:0] add_src11;
wire [31:0] add_src12;
wire [31:0] add_src13;
wire [31:0] add_src14;
wire [31:0] add_src15;

assign {mul_out_15, mul_out_14, mul_out_13, mul_out_12,
        mul_out_11, mul_out_10, mul_out_9,  mul_out_8,
        mul_out_7,  mul_out_6,  mul_out_5,  mul_out_4,
        mul_out_3,  mul_out_2,  mul_out_1,  mul_out_0} = mul_out_dat ;

assign add_src0  = AccReg[mac_acc_id][0 ];
assign add_src1  = AccReg[mac_acc_id][1 ];
assign add_src2  = AccReg[mac_acc_id][2 ];
assign add_src3  = AccReg[mac_acc_id][3 ];
assign add_src4  = AccReg[mac_acc_id][4 ];
assign add_src5  = AccReg[mac_acc_id][5 ];
assign add_src6  = AccReg[mac_acc_id][6 ];
assign add_src7  = AccReg[mac_acc_id][7 ];
assign add_src8  = AccReg[mac_acc_id][8 ];
assign add_src9  = AccReg[mac_acc_id][9 ];
assign add_src10 = AccReg[mac_acc_id][10];
assign add_src11 = AccReg[mac_acc_id][11];
assign add_src12 = AccReg[mac_acc_id][12];
assign add_src13 = AccReg[mac_acc_id][13];
assign add_src14 = AccReg[mac_acc_id][14];
assign add_src15 = AccReg[mac_acc_id][15];

assign add0  = {add_src0[31], add_src0 } + {{13{ mul_out_0[19]}}, mul_out_0};
assign add1  = {add_src1[31], add_src1 } + {{13{ mul_out_1[19]}}, mul_out_1};
assign add2  = {add_src2[31], add_src2 } + {{13{ mul_out_2[19]}}, mul_out_2};
assign add3  = {add_src3[31], add_src3 } + {{13{ mul_out_3[19]}}, mul_out_3};
assign add4  = {add_src4[31], add_src4 } + {{13{ mul_out_4[19]}}, mul_out_4};
assign add5  = {add_src5[31], add_src5 } + {{13{ mul_out_5[19]}}, mul_out_5};
assign add6  = {add_src6[31], add_src6 } + {{13{ mul_out_6[19]}}, mul_out_6};
assign add7  = {add_src7[31], add_src7 } + {{13{ mul_out_7[19]}}, mul_out_7};
assign add8  = {add_src8[31], add_src8 } + {{13{ mul_out_8[19]}}, mul_out_8};
assign add9  = {add_src9[31], add_src9 } + {{13{ mul_out_9[19]}}, mul_out_9};
assign add10 = {add_src10[31],add_src10} + {{13{mul_out_10[19]}},mul_out_10};
assign add11 = {add_src11[31],add_src11} + {{13{mul_out_11[19]}},mul_out_11};
assign add12 = {add_src12[31],add_src12} + {{13{mul_out_12[19]}},mul_out_12};
assign add13 = {add_src13[31],add_src13} + {{13{mul_out_13[19]}},mul_out_13};
assign add14 = {add_src14[31],add_src14} + {{13{mul_out_14[19]}},mul_out_14};
assign add15 = {add_src15[31],add_src15} + {{13{mul_out_15[19]}},mul_out_15};
// saturation addition
assign add0_s = add0[32:31]==2'b01 ? 32'h7FFF_FFFF : add0[32:31]==2'b10 ? 32'h8000_0000 : add0[31:0];
assign add1_s = add1[32:31]==2'b01 ? 32'h7FFF_FFFF : add1[32:31]==2'b10 ? 32'h8000_0000 : add1[31:0];
assign add2_s = add2[32:31]==2'b01 ? 32'h7FFF_FFFF : add2[32:31]==2'b10 ? 32'h8000_0000 : add2[31:0];
assign add3_s = add3[32:31]==2'b01 ? 32'h7FFF_FFFF : add3[32:31]==2'b10 ? 32'h8000_0000 : add3[31:0];
assign add4_s = add4[32:31]==2'b01 ? 32'h7FFF_FFFF : add4[32:31]==2'b10 ? 32'h8000_0000 : add4[31:0];
assign add5_s = add5[32:31]==2'b01 ? 32'h7FFF_FFFF : add5[32:31]==2'b10 ? 32'h8000_0000 : add5[31:0];
assign add6_s = add6[32:31]==2'b01 ? 32'h7FFF_FFFF : add6[32:31]==2'b10 ? 32'h8000_0000 : add6[31:0];
assign add7_s = add7[32:31]==2'b01 ? 32'h7FFF_FFFF : add7[32:31]==2'b10 ? 32'h8000_0000 : add7[31:0];
assign add8_s = add8[32:31]==2'b01 ? 32'h7FFF_FFFF : add8[32:31]==2'b10 ? 32'h8000_0000 : add8[31:0];
assign add9_s = add9[32:31]==2'b01 ? 32'h7FFF_FFFF : add9[32:31]==2'b10 ? 32'h8000_0000 : add9[31:0];
assign add10_s = add10[32:31]==2'b01 ? 32'h7FFF_FFFF : add10[32:31]==2'b10 ? 32'h8000_0000 : add10[31:0];
assign add11_s = add11[32:31]==2'b01 ? 32'h7FFF_FFFF : add11[32:31]==2'b10 ? 32'h8000_0000 : add11[31:0];
assign add12_s = add12[32:31]==2'b01 ? 32'h7FFF_FFFF : add12[32:31]==2'b10 ? 32'h8000_0000 : add12[31:0];
assign add13_s = add13[32:31]==2'b01 ? 32'h7FFF_FFFF : add13[32:31]==2'b10 ? 32'h8000_0000 : add13[31:0];
assign add14_s = add14[32:31]==2'b01 ? 32'h7FFF_FFFF : add14[32:31]==2'b10 ? 32'h8000_0000 : add14[31:0];
assign add15_s = add15[32:31]==2'b01 ? 32'h7FFF_FFFF : add15[32:31]==2'b10 ? 32'h8000_0000 : add15[31:0];

//===============================================================
//           Write / Read  AccReg
//===============================================================

reg [1:0] relu_cnt;
always @(posedge clk) begin
    if(mac_out_en) begin
        AccReg[mac_acc_id][0 ] <= #`DLY  add0_s;
        AccReg[mac_acc_id][1 ] <= #`DLY  add1_s;
        AccReg[mac_acc_id][2 ] <= #`DLY  add2_s;
        AccReg[mac_acc_id][3 ] <= #`DLY  add3_s;
        AccReg[mac_acc_id][4 ] <= #`DLY  add4_s;
        AccReg[mac_acc_id][5 ] <= #`DLY  add5_s;
        AccReg[mac_acc_id][6 ] <= #`DLY  add6_s;
        AccReg[mac_acc_id][7 ] <= #`DLY  add7_s;
        AccReg[mac_acc_id][8 ] <= #`DLY  add8_s;
        AccReg[mac_acc_id][9 ] <= #`DLY  add9_s;
        AccReg[mac_acc_id][10] <= #`DLY add10_s;
        AccReg[mac_acc_id][11] <= #`DLY add11_s;
        AccReg[mac_acc_id][12] <= #`DLY add12_s;
        AccReg[mac_acc_id][13] <= #`DLY add13_s;
        AccReg[mac_acc_id][14] <= #`DLY add14_s;
        AccReg[mac_acc_id][15] <= #`DLY add15_s;
    end
    else if(wen) begin
        AccReg[w_acc_id][w_pe_id] <= #`DLY w_wd;
    end

    //////////////    C L E A R    ////////////////////
    //reset to 0 when read out by HWPEReadAccReg
    if(ren&eai_rsp_valid&eai_rsp_ready) begin
        AccReg[r_acc_id][r_pe_id] <= #`DLY {32{1'b0}};
    end
    //reset to 0 when read out by HWPEReLuMemWriteAccReg
    if(relu_cnt==2'b00 & relu_out_continue) begin
        AccReg[relu_acc_id][0] <= #`DLY {32{1'b0}};
        AccReg[relu_acc_id][1] <= #`DLY {32{1'b0}};
        AccReg[relu_acc_id][2] <= #`DLY {32{1'b0}};
        AccReg[relu_acc_id][3] <= #`DLY {32{1'b0}};
    end
    if(relu_cnt==2'b01 & relu_out_continue) begin
        AccReg[relu_acc_id][4] <= #`DLY {32{1'b0}};
        AccReg[relu_acc_id][5] <= #`DLY {32{1'b0}};
        AccReg[relu_acc_id][6] <= #`DLY {32{1'b0}};
        AccReg[relu_acc_id][7] <= #`DLY {32{1'b0}};
    end
    if(relu_cnt==2'b10 & relu_out_continue) begin
        AccReg[relu_acc_id][8] <= #`DLY {32{1'b0}};
        AccReg[relu_acc_id][9] <= #`DLY {32{1'b0}};
        AccReg[relu_acc_id][10] <= #`DLY {32{1'b0}};
        AccReg[relu_acc_id][11] <= #`DLY {32{1'b0}};
    end
    if(relu_cnt==2'b11 & relu_out_continue) begin
        AccReg[relu_acc_id][12] <= #`DLY {32{1'b0}};
        AccReg[relu_acc_id][13] <= #`DLY {32{1'b0}};
        AccReg[relu_acc_id][14] <= #`DLY {32{1'b0}};
        AccReg[relu_acc_id][15] <= #`DLY {32{1'b0}};
    end
end

reg [31:0] r_rd_reg;
assign r_rd = eai_rsp_valid ? AccReg[r_acc_id][r_pe_id] : r_rd_reg;
always @(posedge clk) begin
    if(rst) begin
        r_rd_reg <= #`DLY 32'b0;
    end else begin
        r_rd_reg <= #`DLY eai_rsp_valid&eai_rsp_ready ? AccReg[r_acc_id][r_pe_id] : r_rd_reg;
    end
end
//===============================================================
//          R E L U
//===============================================================
wire [1:0] relu_cnt_w;
wire relu_ren_4cycle;

assign relu_cnt_w = relu_out_continue ? relu_cnt+1'b1 : relu_cnt;
assign relu_accreg_en_w = relu_ren_st ? 1'b1 : (relu_cnt==2'b11 & relu_out_continue) ? 1'b0 : relu_accreg_en;

always @(posedge clk) begin
    if(rst) begin
        relu_cnt <= #`DLY 2'b00;
        relu_accreg_en <= #`DLY 1'b0;
        relu_done <= #`DLY 1'b0;
    end
    else begin
        relu_cnt <= #`DLY relu_cnt_w;
        relu_accreg_en <= #`DLY relu_accreg_en_w;
        relu_done <= #`DLY relu_cnt==2'b11 & relu_out_continue;
    end
end

assign relu_accreg_0 = relu_ren ?
                       relu_cnt_w==2'b00 ? AccReg[relu_acc_id][0] :
                       relu_cnt_w==2'b01 ? AccReg[relu_acc_id][4] :
                       relu_cnt_w==2'b10 ? AccReg[relu_acc_id][8] :
                       relu_cnt_w==2'b11 ? AccReg[relu_acc_id][12] : {32{1'b0}}
                       : {32{1'b0}};
assign relu_accreg_1 = relu_ren ?
                       relu_cnt_w==2'b00 ? AccReg[relu_acc_id][1] :
                       relu_cnt_w==2'b01 ? AccReg[relu_acc_id][5] :
                       relu_cnt_w==2'b10 ? AccReg[relu_acc_id][9] :
                       relu_cnt_w==2'b11 ? AccReg[relu_acc_id][13] : {32{1'b0}}
                       : {32{1'b0}};
assign relu_accreg_2 = relu_ren ?
                       relu_cnt_w==2'b00 ? AccReg[relu_acc_id][2] :
                       relu_cnt_w==2'b01 ? AccReg[relu_acc_id][6] :
                       relu_cnt_w==2'b10 ? AccReg[relu_acc_id][10]:
                       relu_cnt_w==2'b11 ? AccReg[relu_acc_id][14] : {32{1'b0}}
                       : {32{1'b0}};
assign relu_accreg_3 = relu_ren ?
                       relu_cnt_w==2'b00 ? AccReg[relu_acc_id][3] :
                       relu_cnt_w==2'b01 ? AccReg[relu_acc_id][7] :
                       relu_cnt_w==2'b10 ? AccReg[relu_acc_id][11]:
                       relu_cnt_w==2'b11 ? AccReg[relu_acc_id][15] : {32{1'b0}}
                       : {32{1'b0}};


endmodule

