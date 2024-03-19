`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/28 16:00:57
// Design Name: 
// Module Name: icb_bridge
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

module icb_bridge(
    //cmd channel
    input cmd_valid,
    output cmd_ready, //
    input cmd_read,
    input [31:0] cmd_addr,
    input [31:0] cmd_wdata,
    input [3:0] cmd_wmask,
    // rsp channel
    output rsp_valid, //
    input  rsp_ready,
    output reg [31:0] rsp_rdata_r, //
//    output reg rsp_usr2,
    //usr interface
    output [27:0] app_addr,
    output [2:0] app_cmd,
    output app_en,
    output [127:0] app_wdf_data,
    output app_wdf_end,
    output app_wdf_wren,
    input [127:0] app_rd_data,
    input app_rd_data_end,
    input app_rd_data_valid,
    input app_rdy,
    input app_wdf_rdy,
    output [15:0] app_wdf_mask,
    //clk and rst
    input ui_clk,
    input cmd_clk,
    output [3:0] mystate,
    input myrst
);

localparam IDLE_S=4'd0;
localparam WRITE_S=4'd1;
localparam READ_S=4'd2;
localparam WRITE1_S=4'd3;
localparam READ1_S=4'd4;
localparam WRSP_S=4'd5;
localparam RRSP_S=4'd7;
localparam WAIT_S=4'd8;
localparam STORE_S=4'd9;

reg cmd_clk_reg1;
reg cmd_clk_reg2;
wire cmd_clk_neg_edge;
always @(posedge ui_clk or negedge myrst) begin
    if (myrst==1'b0)
        {cmd_clk_reg1,cmd_clk_reg2}<=2'b00;
    else
        {cmd_clk_reg1,cmd_clk_reg2}<={cmd_clk,cmd_clk_reg1};
end
assign cmd_clk_neg_edge = (cmd_clk_reg1 ^ cmd_clk_reg2) & (~cmd_clk_reg1); //set hign at forth cycle


reg r_ptr_cmd;
reg w_ptr_cmd;
reg w_ptr_rsp;
reg r_ptr_rsp;
reg [64:0] cmd_info_r;
reg [31:0] rsp_rdata;
reg [3:0] state,next_state;
wire rsp_fifo_full;
wire [27:0] offset;
wire [127:0] app_wdf_data0;
wire [15:0] app_wdf_mask0;
wire [127:0] app_rd_data0;
wire [64:0] cmd_info;
assign mystate = state;
assign  app_en = (state==READ_S)|(state==WRITE_S)&(app_rdy & app_wdf_rdy);
assign  app_cmd = cmd_info_r[64];
assign  app_wdf_data0[127:32]=96'd0;
assign  app_wdf_data0[31:0] = cmd_info_r[31:0];
assign  app_wdf_data = app_wdf_data0 << (offset<<3);
assign  offset = cmd_info_r[59:32] & 28'h000000c;
assign  app_addr = (cmd_info_r[59:32] & 28'hffffff0)>>1;
assign  app_wdf_wren = app_en & (~cmd_info_r[64]);
assign  app_wdf_end = app_wdf_wren;
assign  app_wdf_mask0[15:4] = 12'h000;
assign  app_wdf_mask0[3:0] = cmd_info_r[63:60];
assign  app_wdf_mask = ~(app_wdf_mask0<<offset) ;
assign  app_rd_data0 = app_rd_data>>(offset<<3);

assign cmd_ready = ~(r_ptr_cmd ^ w_ptr_cmd);
assign cmd_info = { cmd_read, cmd_wmask, cmd_addr[27:0], cmd_wdata};

always @(posedge cmd_clk or negedge myrst)begin
    if (myrst==1'b0) begin
        w_ptr_cmd <= 1'b0;
        cmd_info_r <= 65'd0;
    end
    else
        if (cmd_ready && cmd_valid) begin
            w_ptr_cmd <= w_ptr_cmd+1;
            cmd_info_r <= cmd_info;
        end
        else begin
            w_ptr_cmd <= w_ptr_cmd;
            cmd_info_r <= cmd_info_r;
        end
end

always @(posedge cmd_clk or negedge myrst)begin
    if (myrst==1'b0)
        r_ptr_cmd <= 1'b0;
    else
        if (rsp_valid && rsp_ready && cmd_ready==1'b0)
            r_ptr_cmd <= r_ptr_cmd+1;
        else
            r_ptr_cmd <= r_ptr_cmd;
end

assign rsp_fifo_full = (next_state==WRSP_S) | (state==WRSP_S);
assign rsp_valid = w_ptr_rsp ^ r_ptr_rsp;

always @(posedge cmd_clk or negedge myrst)begin
    if (myrst==1'b0) begin
        w_ptr_rsp <= 1'b0;
        rsp_rdata_r <= 32'd0;
    end
    else
        if (rsp_fifo_full==1'b1 && rsp_valid==1'b0) begin
            w_ptr_rsp <= w_ptr_rsp+1;
            rsp_rdata_r <= rsp_rdata;
        end
        else begin
            w_ptr_rsp <= w_ptr_rsp;
            rsp_rdata_r <= rsp_rdata_r;
        end
end

always @(posedge ui_clk or negedge myrst)begin
    if (myrst==1'b0)
        rsp_rdata<=32'd0;
    else
        if (app_rd_data_valid==1'b1)
            rsp_rdata<=app_rd_data0[31:0];
        else
            rsp_rdata<=rsp_rdata;
end

always @(posedge cmd_clk or negedge myrst)begin
    if (myrst==1'b0) begin
        r_ptr_rsp <= 1'b0;
    end
    else
        if (rsp_ready && rsp_valid) begin
            r_ptr_rsp <= r_ptr_rsp+1;
        end
        else begin
            r_ptr_rsp <= r_ptr_rsp;
        end
end

always @(posedge ui_clk or negedge myrst) begin
    if (myrst==1'b0)
        state<=IDLE_S;
    else
        state<=next_state;
end


always @(*) begin
    case (state)
    IDLE_S:
        if ((~cmd_ready) && cmd_info_r[64]==1'b1 && app_rdy==1'b1 && app_wdf_rdy==1'b1)
            next_state<=READ_S;
        else if ((~cmd_ready) && cmd_info_r[64]==1'b0 && app_rdy==1'b1 && app_wdf_rdy==1'b1)
            next_state<=WRITE_S;
        else next_state<=IDLE_S;
    WRITE_S: 
        if (app_rdy & app_wdf_rdy)
            next_state<=WRITE1_S;
        else next_state<=IDLE_S;
    READ_S: 
        if (app_rdy & app_wdf_rdy)
            next_state<=WAIT_S;
        else next_state<=IDLE_S;
    WRITE1_S: 
        if (cmd_clk_neg_edge==1'b1 && rsp_valid==1'b0)
            next_state<=WRSP_S;
        else next_state<=WRITE1_S;
    WRSP_S: 
        if (cmd_ready)
            next_state<=IDLE_S;
        else
            next_state<=WRSP_S;
    WAIT_S: 
        if (app_rd_data_valid==1'b1)
            next_state<=WRITE1_S;
        else next_state<=WAIT_S;
    default: next_state<=IDLE_S;
    endcase
end

endmodule

