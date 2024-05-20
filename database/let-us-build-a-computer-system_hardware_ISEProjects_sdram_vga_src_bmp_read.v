// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  sd bmp vga display                                                          //
//                                                                              //
//  Author: meisq                                                               //
//          msq@qq.com                                                          //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//================================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------------
//  2017/7/14    meisq         1.0         Original
//*******************************************************************************/
module bmp_read(
	input                       clk,
	input                       rst,
	output                      ready,
	input                       find,
	input                       sd_init_done,                //SD card initialization completed
	output reg[3:0]             state_code,                  //state indication coding,
															 // 0:SD card is initializing,
															 // 1:wait for the button to press
															 // 2:looking for the bmp file
															 // 3:reading
	input[15:0]                 bmp_width,                   //search the width of bmp
	output reg                  write_req,                   //start writing request
	input                       write_req_ack,               //write request response
	output reg                  sd_sec_read,                 //SD card sector read
	output reg[31:0]            sd_sec_read_addr,            //SD card sector read address
	input[7:0]                  sd_sec_read_data,            //SD card sector read data
	input                       sd_sec_read_data_valid,      //SD card sector read data valid
	input                       sd_sec_read_end,             //SD card sector read end
	output reg                  bmp_data_wr_en,              //bmp image data write enable
	output reg[23:0]            bmp_data                     //bmp image data
);
localparam S_IDLE         = 0;
localparam S_FIND         = 1;
localparam S_READ_WAIT    = 2;
localparam S_READ         = 3;
localparam S_END          = 4;

localparam HEADER_SIZE    = 54;

reg[3:0]         state;
reg[9:0]         rd_cnt;                     //sector read length counter
reg[7:0]         header_0;
reg[7:0]         header_1;
reg[31:0]        file_len;
reg[31:0]        width;
reg[31:0]        bmp_len_cnt;                //bmp file length counter
reg              found;
wire             bmp_data_valid;             //bmp image data valid
reg[1:0]         bmp_len_cnt_tmp;            //bmp RGB counter 0 1 2

//remove the first 54 bytes of the bmp
assign bmp_data_valid = (sd_sec_read_data_valid == 1'b1 && bmp_len_cnt > 32'd53 && bmp_len_cnt < file_len);
assign ready = (state == S_IDLE);
always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		rd_cnt <= 10'd0;
	else if(state == S_FIND)
	begin
		if(sd_sec_read_data_valid == 1'b1)
			rd_cnt <= rd_cnt + 10'd1;
		else if(sd_sec_read_end == 1'b1)
			rd_cnt <= 10'd0;
	end
	else
		rd_cnt <= 10'd0;
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
	begin
		header_0 <= 8'd0;
		header_1 <= 8'd0;
		file_len <= 32'd0;
		found <= 1'b0;
	end
	else if(state == S_FIND && sd_sec_read_data_valid == 1'b1)
	begin
		//file header
		if(rd_cnt == 10'd0)
			header_0 <= sd_sec_read_data;
		if(rd_cnt == 10'd1)
			header_1 <= sd_sec_read_data;
        //file length
		if(rd_cnt == 10'd2)
			file_len[7:0] <= sd_sec_read_data;
		if(rd_cnt == 10'd3)
			file_len[15:8] <= sd_sec_read_data;
		if(rd_cnt == 10'd4)
			file_len[23:16] <= sd_sec_read_data;
		if(rd_cnt == 10'd5)
			file_len[31:24] <= sd_sec_read_data;
        //image width
		if(rd_cnt == 10'd18)
			width[7:0] <= sd_sec_read_data;
		if(rd_cnt == 10'd19)
			width[15:8] <= sd_sec_read_data;
		if(rd_cnt == 10'd20)
			width[23:16] <= sd_sec_read_data;
		if(rd_cnt == 10'd21)
			width[31:24] <= sd_sec_read_data;
        //check the width of the image and file header  after the end of the file header
		if(rd_cnt == 10'd54 && header_0 == "B" && header_1 == "M" && width[15:0] == bmp_width)
			found <= 1'b1;
	end
	else if(state != S_FIND)
		found <= 1'b0;
end

//bmp file length counter
always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		bmp_len_cnt <= 32'd0;
	else if(state == S_READ)
	begin
		if(sd_sec_read_data_valid == 1'b1)
			bmp_len_cnt <= bmp_len_cnt + 32'd1;
	end
	else if(state == S_END)
		bmp_len_cnt <= 32'd0;
end
//bmp RGB counter
always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		bmp_len_cnt_tmp <= 2'd0;
	else if(state == S_READ)
	begin
		if(bmp_data_valid == 1'b1)
			bmp_len_cnt_tmp <= bmp_len_cnt_tmp == 2'd2 ? 2'd0 : bmp_len_cnt_tmp + 2'd1;
	end
	else if(state == S_END)
		bmp_len_cnt_tmp <= 2'd0;
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
	begin
		bmp_data_wr_en <= 1'b0;
		bmp_data <= 24'd0;
	end
	else if(state == S_READ)
	begin
		if(bmp_len_cnt_tmp == 2'd2 && bmp_data_valid == 1'b1)
		begin
			bmp_data_wr_en <= 1'b1;
			bmp_data[23:16] <= sd_sec_read_data;
		end
		else if(bmp_len_cnt_tmp == 2'd1 && bmp_data_valid == 1'b1)
		begin
			bmp_data_wr_en <= 1'b0;
			bmp_data[15:8] <= sd_sec_read_data;
		end
		else if(bmp_len_cnt_tmp == 2'd0 && bmp_data_valid == 1'b1)
		begin
			bmp_data_wr_en <= 1'b0;
			bmp_data[7:0] <= sd_sec_read_data;
		end
		else
			bmp_data_wr_en <= 1'b0;

	end
	else
		bmp_data_wr_en <= 1'b0;

end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
	begin
		state <= S_IDLE;
		sd_sec_read <= 1'b0;
		sd_sec_read_addr <= 32'd32000;
		write_req <= 1'b0;
		state_code <= 4'd0;
	end
	else if(sd_init_done == 1'b0)
	begin
		state <= S_IDLE;
	end
	else
		case(state)
			S_IDLE:
			begin
				state_code <= 4'd1;
				if(find == 1'b1)
					state <= S_FIND;
				sd_sec_read_addr <= {sd_sec_read_addr[31:3],3'd0};//address 8 aligned
			end
			S_FIND:
			begin
				state_code <= 4'd2;
				if(sd_sec_read_end == 1'b1)
				begin
					if(found == 1'b1)
					begin
						state <= S_READ_WAIT;
						sd_sec_read <= 1'b0;
						write_req <= 1'b1;//start writing data
					end
					else
					begin
						//search every 8 sectors(4K)
						sd_sec_read_addr <= sd_sec_read_addr + 32'd8;
					end
				end
				else
				begin
					sd_sec_read <= 1'b1;
				end
			end
			S_READ_WAIT:
			begin
				if(write_req_ack == 1'b1)//write data response
				begin
					state <= S_READ;//read SD card data
					write_req <= 1'b0;
				end
			end
			S_READ:
			begin
				state_code <= 4'd3;
				if(sd_sec_read_end == 1'b1)
				begin
					sd_sec_read_addr <= sd_sec_read_addr + 32'd1;
					sd_sec_read <= 1'b0;
					if(bmp_len_cnt >= file_len)
					begin
						state <= S_END;
						sd_sec_read <= 1'b0;
					end
				end
				else
				begin
					sd_sec_read <= 1'b1;
				end
			end
			S_END:
				state <= S_IDLE;
			default:
				state <= S_IDLE;
		endcase
end
endmodule