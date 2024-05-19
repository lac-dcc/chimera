// This program was cloned from: https://github.com/xiaoerlang0359/E203plus
// License: Apache License 2.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/27 14:29:36
// Design Name: 
// Module Name: accelerator
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


module accelerator(
input i_icb_cmd_valid,
output i_icb_cmd_ready,
input [31:0] i_icb_cmd_addr,
input i_icb_cmd_read,
input [31:0] i_icb_cmd_wdata ,
input [3:0] i_icb_cmd_wmask,
output i_icb_rsp_valid,
input i_icb_rsp_ready,
output reg [31:0] i_icb_rsp_rdata,
output i_icb_rsp_err,
input clk,
input rst_n);

localparam IDLE_S = 6'b000000;
localparam RUN_S = 6'b000001;
localparam COUNT_S = 6'b000010;
localparam SUM1_S = 6'b000100;
localparam SUM2_S = 6'b001000;
localparam RSP_S = 6'b100000;

reg [31:0] test_reg[36:0];
reg [31:0] train_reg[36:0];
reg [31:0] calc_reg[36:0];
reg [15:0] count_reg[9:0];
reg [15:0] sum_reg[2:0];

reg [31:0] status_reg;
reg [5:0] state,next_state;
reg [31:0] result_reg;
reg [5:0] cnt;


always @(posedge clk or negedge rst_n)begin
    if (rst_n==1'b0)
        cnt<=6'd0;
    else
        if (state==COUNT_S)
            cnt<=cnt+1;
        else cnt<=6'd0;
end
always @(posedge clk or negedge rst_n)begin
    if (rst_n==1'b0)
        state<=IDLE_S;
    else state<=next_state;
end
always @(*)begin
    case(state)
        IDLE_S:
            if (status_reg[0]==1'b1) next_state<=RUN_S;
            else next_state<=IDLE_S;
        RUN_S: next_state<=COUNT_S;
        COUNT_S: 
            if (cnt==6'd31) next_state<=SUM1_S;
            else next_state<=COUNT_S;
        SUM1_S: next_state<=SUM2_S;
        SUM2_S: next_state<=RSP_S;
        RSP_S: next_state<=IDLE_S;
        default: next_state<=IDLE_S;
    endcase
end
           
genvar i;
generate
    for (i=0;i<37;i=i+1)
    begin: write_test
        always @(posedge clk) begin
            if ((state==IDLE_S) && (i_icb_cmd_valid==1'b1) && (i_icb_cmd_read==1'b0) && (i_icb_cmd_addr[11:2]==i))
                test_reg[i] <= i_icb_cmd_wdata;
            else
                test_reg[i] <= test_reg[i];
        end
    end
endgenerate
generate
    for (i=0;i<37;i=i+1)
    begin: write_train
        always @(posedge clk) begin
            if ((state==IDLE_S) && (i_icb_cmd_valid==1'b1) && (i_icb_cmd_read==1'b0) && (i_icb_cmd_addr[11:8]==4'd1) && (i_icb_cmd_addr[7:2]==i))
                train_reg[i] <= i_icb_cmd_wdata;
            else
                train_reg[i] <= train_reg[i];
        end
    end
endgenerate

generate
    for (i=0;i<37;i=i+1)
    begin: xor_task
        always @(posedge clk) begin
            if (state==RUN_S)
                calc_reg[i]<=test_reg[i] ^ train_reg[i];
            else if (state==COUNT_S)
                calc_reg[i]<=calc_reg[i]>>1;
            else calc_reg[i]<=calc_reg[i];   
        end
    end
endgenerate

generate
    for (i=0;i<9;i=i+1)
    begin: count_tesk
        always @(posedge clk)begin
            if (state==RUN_S)
                count_reg[i]<=16'd0;
            else if (state==COUNT_S)
                count_reg[i]<=count_reg[i]+calc_reg[4*i][0]+calc_reg[4*i+1][0]+calc_reg[4*i+2][0]+calc_reg[4*i+3][0];
            else
                count_reg[i]<=count_reg[i];
        end
     end
endgenerate
always @(posedge clk)begin
    if (state==RUN_S)
        count_reg[9]<=16'd0;
    else if (state==COUNT_S)
        count_reg[9]<=count_reg[9]+calc_reg[36][0];
    else
        count_reg[9]<=count_reg[9];
end

always @(posedge clk)begin
    if (state==SUM1_S)
        sum_reg[0]<=count_reg[0]+count_reg[1]+count_reg[2]+count_reg[3];
    else
        sum_reg[0]<=sum_reg[0];
end

always @(posedge clk)begin
    if (state==SUM1_S)
        sum_reg[1]<=count_reg[4]+count_reg[5]+count_reg[6]+count_reg[7];
    else
        sum_reg[1]<=sum_reg[1];
end

always @(posedge clk)begin
    if (state==SUM1_S)
        sum_reg[2]<=count_reg[8]+count_reg[9];
    else
        sum_reg[2]<=sum_reg[2];
end  
    
always @(posedge clk)begin
    if (state==SUM2_S)
        result_reg<=sum_reg[0]+sum_reg[1]+sum_reg[2];
    else
        result_reg<=result_reg;
end

always @(posedge clk or negedge rst_n) begin
if (rst_n==1'b0)
    status_reg<=32'd0;
else
    if ((state==IDLE_S) && (i_icb_cmd_valid==1'b1) && (i_icb_cmd_read==1'b0) && (i_icb_cmd_addr[11:2]==10'h3ff))
        status_reg<=i_icb_cmd_wdata;
    else if (next_state==RSP_S)
        status_reg<=32'd0;
    else
        status_reg<=status_reg;
end
always @(posedge clk or negedge rst_n)begin
    if (rst_n==1'b0)
        i_icb_rsp_rdata<=32'd0;
    else
        if (i_icb_cmd_valid && i_icb_cmd_addr[11:2]==10'h3fe && i_icb_cmd_read)
            i_icb_rsp_rdata<=result_reg;
        else if (i_icb_cmd_valid && i_icb_cmd_addr[11:2]==10'h3ff && i_icb_cmd_read)
            i_icb_rsp_rdata<=status_reg;
        else i_icb_rsp_rdata<=i_icb_rsp_rdata;
end
/*
assign i_icb_rsp_rdata = (i_icb_cmd_valid && i_icb_cmd_addr[11:0]==12'hffe && i_icb_cmd_read)?
                          result_reg:
                          (i_icb_cmd_valid && i_icb_cmd_addr[11:0]==12'hfff && i_icb_cmd_read)?
                          status_reg: 32'd0;
assign i_icb_rsp_err = 1'b0;
*/
assign i_icb_rsp_err = 1'b0;
/*
always @(posedge clk or negedge rst_n)begin
if (rst_n==1'b0)
    i_icb_rsp_valid<=1'b0;
else
    if (i_icb_cmd_valid==1'b1)
        i_icb_rsp_valid<=1'b1;
    else if (i_icb_rsp_ready==1'b1)
        i_icb_rsp_valid<=1'b0;
    else i_icb_rsp_valid<=i_icb_rsp_valid;
end
*/

  sirv_gnrl_pipe_stage # (
 .CUT_READY(0),
 .DP(1),
 .DW(0)
) u_e1_stage (
  .i_vld(i_icb_cmd_valid), 
  .i_rdy(i_icb_cmd_ready), 
  .i_dat(1'b0),
  .o_vld(i_icb_rsp_valid), 
  .o_rdy(i_icb_rsp_ready), 
  .o_dat(),

  .clk  (clk  ),
  .rst_n(rst_n)  
 );
 
endmodule
