// This program was cloned from: https://github.com/wtiandong/Hardware_circular_buffer_controller
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:16:53 07/09/2014 
// Design Name:
// Module Name:    circular_buffer_controller 
// Project Name:   
// Target Devices: 
// Tool versions: 
// Description: This is a circular buffer controller, or multiple buffers
// controller.
// 
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module circular_buffer_controller
#(

	parameter WRITE_DATA_WIDTH = 8,
	parameter WRITE_DATA_DEPTH = 256,
	parameter READ_DATA_WIDTH = 8,
	parameter READ_DATA_DEPTH = 256,
	parameter BUFFER_NUM = 2,

	parameter WRITE_ADDR_WIDTH = log2(WRITE_DATA_DEPTH - 1),
	parameter READ_ADDR_WIDTH = log2(READ_DATA_DEPTH  - 1),
	parameter BUFFER_ADDR_WIDTH = log2(BUFFER_NUM  - 1)

)
(
	input wr_clk_i,
	input rd_clk_i,
	input rst_i, //active high
	//-------Wr interface----------
	input wr_req_i,
	output wr_req_ack_o,
	output wr_req_result_o,
	input wr_finish_i,
	output wr_finish_ack_o,
	input wr_en_i,
	input [WRITE_DATA_WIDTH - 1:0] wr_data_i,
	input [WRITE_ADDR_WIDTH - 1:0] wr_addr_i,
	//------Rd interface----------
	input rd_req_i,
	output rd_req_ack_o,
	output rd_req_result_o,
	input rd_finish_i,
	output rd_finish_ack_o,
	output [READ_DATA_WIDTH - 1:0] rd_data_o,
	input [READ_ADDR_WIDTH - 1:0] rd_addr_i,
	//-----RAM interface---------
	output ram_wr_clk_o,
	output ram_rd_clk_o,
	output ram_rst_o,
	output ram_wr_en_o,
	output [WRITE_DATA_WIDTH - 1:0] ram_wr_data_o,
	output [WRITE_ADDR_WIDTH + BUFFER_ADDR_WIDTH - 1:0] ram_wr_addr_o,
	input [READ_DATA_WIDTH - 1:0] ram_rd_data_i,
	output [READ_ADDR_WIDTH + BUFFER_ADDR_WIDTH - 1:0] ram_rd_addr_o

);
function integer log2 (input integer bd);
	integer bit_depth;
	begin
		bit_depth = bd;
		for(log2=0; bit_depth>0; log2=log2 + 1)
			bit_depth = bit_depth >> 1;
	end
endfunction

reg [BUFFER_ADDR_WIDTH - 1:0] wr_cnt = {BUFFER_ADDR_WIDTH{1'b0}};
reg [BUFFER_ADDR_WIDTH - 1:0] rd_cnt = {BUFFER_ADDR_WIDTH{1'b0}};

//-----------reset------------------
reg wr_rst0 = 1'b1;
reg wr_rst1 = 1'b1;
reg rd_rst0 = 1'b1;
reg rd_rst1 = 1'b1;

always@(posedge wr_clk_i or posedge rst_i)
begin
	if(rst_i)
	begin
		wr_rst0 <= 1'b1;
		wr_rst1 <= 1'b1;
	end
	else
	begin
		wr_rst0 <= 1'b0;
		wr_rst1 <= wr_rst0;
	end
end

always@(posedge rd_clk_i or posedge rst_i)
begin
	if(rst_i)
	begin
		rd_rst0 <= 1'b1;
		rd_rst1 <= 1'b1;
	end
	else
	begin
		rd_rst0 <= 1'b0;
		rd_rst1 <= rd_rst0;
	end
end
//------------------temp signals-------------------
reg tmp_wr_req_ack     = 1'b0;
reg tmp_rd_req_ack     = 1'b0;
reg tmp_wr_req_result  = 1'b1;  //有空的码流buffer；
reg tmp_rd_req_result  = 1'b0;    //没有满的码流buffer；
reg tmp_wr_finish_ack  = 1'b0;
reg tmp_rd_finish_ack  = 1'b0;


//------------for rd clk synchronizing-----------------
reg [1:0]rd_req;
reg [3:0]rd_req_ack;
reg [1:0]rd_req_result;
reg [1:0]rd_finish;
reg [1:0]rd_finish_ack;
reg [BUFFER_ADDR_WIDTH - 1:0] rd_addr_buf0;
reg [BUFFER_ADDR_WIDTH - 1:0] rd_addr_buf1;

//-------------------requst_fsm--------------------
localparam REQ_IDLE         = 3'd0;
localparam REQ_WR_BUF_JUDGE = 3'd1;
localparam REQ_RD_BUF_JUDGE = 3'd2;
localparam REQ_WR_BUF       = 3'd3;
localparam REQ_RD_BUF       = 3'd4;

reg[2:0] req_state = REQ_IDLE;
localparam BUF_IDLE                = 3'd0;
localparam BUF_WR_JUDGE            = 3'd1;
localparam BUF_RD_JUDGE            = 3'd2;
localparam BUF_WR_WAIT_FINISH_ZERO = 3'd3;
localparam BUF_RD_WAIT_FINISH_ZERO = 3'd4;


reg [2:0] buf_state = BUF_IDLE;
localparam RD = 1'b0,
		   WR = 1'b1;

reg priority = WR;

reg [BUFFER_ADDR_WIDTH+1:0] full_buf_cnt = 'd0;
always@(posedge wr_clk_i)
begin
	if(wr_rst1)
	begin
		req_state <= REQ_IDLE;
		tmp_wr_req_ack     <= 1'b0;
		tmp_rd_req_ack     <= 1'b0;
		tmp_wr_req_result  <= 1'b1;
		tmp_rd_req_result  <= 1'b0;
		priority           <= WR;

	end
	else
	begin
		case(req_state)
			REQ_IDLE:begin
				case(priority)
					WR:begin
						priority <= RD;
						if(wr_req_i) //有写buffer的请求；
							req_state <= REQ_WR_BUF_JUDGE;
					end
					RD:begin
						priority <= WR;
						if(rd_req[1]) //有写buffer的请求；
							req_state <= REQ_RD_BUF_JUDGE;
					end
				endcase
			end
			REQ_WR_BUF_JUDGE:begin
				tmp_wr_req_ack <= 1'b1;
				req_state <= REQ_WR_BUF;
				if(full_buf_cnt < BUFFER_NUM) //没有空的buffer了；
					tmp_wr_req_result  <= 1'b1;  //没有空的buffer了；
				else
				begin
					tmp_wr_req_result  <= 1'b0;  //有空的buffer了；

				end
			end
			REQ_RD_BUF_JUDGE:begin
				tmp_rd_req_ack <= 1'b1;
				req_state <= REQ_RD_BUF;
				if(full_buf_cnt >  'd0)   //没有满的buffer
					tmp_rd_req_result  <= 1'b1; //没有满的buffer了；
				else
				begin
					tmp_rd_req_result  <= 1'b0; //有满的buffer了；

				end
			end
			REQ_WR_BUF:begin
				if(!wr_req_i)
				begin
					tmp_wr_req_ack <= 1'b0;
					req_state <= REQ_IDLE;
					tmp_wr_req_result <= 1'b0;
				end
			end
			REQ_RD_BUF:begin
				if(!rd_req[1])
				begin
					tmp_rd_req_ack <= 1'b0;
					req_state <= REQ_IDLE;
					tmp_rd_req_result <= 1'b0;
				end
			end
		endcase
	end
end


reg buf_priority = WR;
always @(posedge wr_clk_i)
begin
	if(wr_rst1)
	begin
		full_buf_cnt       <= 'd0;
		buf_state         <= BUF_IDLE;
		tmp_wr_finish_ack <= 1'b0;
		tmp_rd_finish_ack <= 1'b0;
		buf_priority <= WR;
	end
	else
	begin
		case(buf_state)
			BUF_IDLE:begin
				case(buf_priority)
					WR:begin
						buf_priority <= RD;
						if(wr_finish_i)
						begin //写完一个buffer
							buf_state          <= BUF_WR_JUDGE;
						end
					end
					RD:begin
						buf_priority <= WR;
						if(rd_finish[1])
						begin //读完一个buffer
							buf_state          <= BUF_RD_JUDGE;
						end
					end
				endcase
			end
			BUF_WR_JUDGE: begin
				tmp_wr_finish_ack <= 1'b1;
				buf_state         <= BUF_WR_WAIT_FINISH_ZERO;
				full_buf_cnt     <= full_buf_cnt + 'd1; //写完一个buffer，
				//空buffer数目减1；
				if(wr_cnt == BUFFER_NUM)
					wr_cnt <= 'd0;
				else
					wr_cnt <= wr_cnt + 'd1;
			end
			BUF_RD_JUDGE: begin
				tmp_rd_finish_ack <= 1'b1;
				buf_state         <= BUF_RD_WAIT_FINISH_ZERO;
				full_buf_cnt     <= full_buf_cnt - 'd1; //读完一个buffer，
				//空buffer数目加1；
				if(rd_cnt == BUFFER_NUM)
					rd_cnt <= 'd0;
				else
					rd_cnt <= rd_cnt + 'd1;
			end
			BUF_WR_WAIT_FINISH_ZERO: begin
				if(!wr_finish_i)
				begin
					tmp_wr_finish_ack <= 1'b0;
					buf_state         <= BUF_IDLE;
				end
			end
			BUF_RD_WAIT_FINISH_ZERO: begin
				if(!rd_finish[1])
				begin
					tmp_rd_finish_ack <= 1'b0;
					buf_state         <= BUF_IDLE;
				end
			end
		endcase
	end
end

//---------------------rd clk domain synchronizer--------------

always@(posedge wr_clk_i)
begin
	rd_req[0] <= rd_req_i;
	rd_req[1] <= rd_req[0];
	rd_finish[0] <= rd_finish_i;
	rd_finish[1] <= rd_finish[0];
end

always@(posedge rd_clk_i)
begin
	rd_req_ack[0] <= tmp_rd_req_ack;
	rd_req_ack[1] <= rd_req_ack[0];
	rd_req_ack[2] <= rd_req_ack[1];
	rd_req_ack[3] <= rd_req_ack[2];

	rd_req_result[0] <= tmp_rd_req_result;
	rd_req_result[1] <= rd_req_result[0];

	rd_finish_ack[0] <= tmp_rd_finish_ack;
	rd_finish_ack[1] <= rd_finish_ack[0];

	rd_addr_buf0 <= rd_cnt;
	rd_addr_buf1 <= rd_addr_buf0;
end


assign wr_req_ack_o = tmp_wr_req_ack;
assign wr_req_result_o = tmp_wr_req_result;
assign wr_finish_ack_o = tmp_wr_finish_ack;

assign rd_req_ack_o = rd_req_ack[3];
assign rd_req_result_o = rd_req_result[1];
assign rd_finish_ack_o = rd_finish_ack[1];

assign ram_wr_clk_o = wr_clk_i;
assign ram_rd_clk_o = rd_clk_i;
assign ram_rst_o = rst_i;

assign ram_wr_en_o = wr_en_i;
assign ram_wr_data_o = wr_data_i;
assign ram_wr_addr_o = {wr_cnt, wr_addr_i};

assign rd_data_o = ram_rd_data_i;
assign ram_rd_addr_o = {rd_addr_buf1, rd_addr_i};
endmodule
