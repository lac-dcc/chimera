// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
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

//==========================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------
//  2017/7/14    meisq         1.0         Original
//*************************************************************************/
module wav_read(
	input                   clk,
	input                   rst,
	output                  ready,
	input                   find,
	input                   sd_init_done,                //SD card initialization completed
	output reg[3:0]         state_code,                  //state indication coding,
														 // 0:SD card is initializing,
														 // 1:wait for the button to press
														 // 2:looking for the WAV file
														 // 3:playing
	output reg              sd_sec_read,                 //SD card sector read
	output reg[31:0]        sd_sec_read_addr,            //SD card sector read address
	input[7:0]              sd_sec_read_data,            //SD card sector read data
	input                   sd_sec_read_data_valid,      //SD card sector read data valid
	input                   sd_sec_read_end,             //SD card sector read end
	input[15:0]             fifo_wr_cnt,                 //fifo write used words
	output reg              wav_data_wr_en,              //wav audio data write enable
	output reg[7:0]         wav_data                     //wav audio data
);
parameter  FIFO_DEPTH     = 1024;
localparam S_IDLE         = 0;
localparam S_FIND         = 1;
localparam S_PLAY_WAIT    = 2;
localparam S_PLAY         = 3;
localparam S_END          = 4;

localparam HEADER_SIZE    = 88;

reg[3:0]         state;               //state machine
reg[9:0]         rd_cnt;              //sector read counter
reg[7:0]         header_0;            //first byte of the SD card sector
reg[7:0]         header_1;            //second byte of the SD card sector
reg[7:0]         header_2;            //third byte of the SD card sector
reg[7:0]         header_3;            //fourth byte of the SD card sector
reg[31:0]        file_len;            //wav file length
reg[31:0]        play_cnt;            //play counter
reg              found;               //find a wav file

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
		header_2 <= 8'd0;
		header_3 <= 8'd0;
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
		if(rd_cnt == 10'd2)
			header_2 <= sd_sec_read_data;
		if(rd_cnt == 10'd3)
			header_3 <= sd_sec_read_data;
		//file length
		if(rd_cnt == 10'd4)
			file_len[7:0] <= sd_sec_read_data;
		if(rd_cnt == 10'd5)
			file_len[15:8] <= sd_sec_read_data;
		if(rd_cnt == 10'd6)
			file_len[23:16] <= sd_sec_read_data;
		if(rd_cnt == 10'd7)
			file_len[31:24] <= sd_sec_read_data;
		//wav file header is 'RIFF',in a sector  the first 4 bytes are "RIFF"
		if(rd_cnt == 10'd5 && header_0 == "R" && header_1 == "I" && header_2 == "F" && header_3 == "F")
			found <= 1'b1;
	end
	else if(state != S_FIND)
		found <= 1'b0;
end
//play length counter
always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		play_cnt <= 32'd0;
	else if(state == S_PLAY)
	begin
		if(sd_sec_read_data_valid == 1'b1)
			play_cnt <= play_cnt + 32'd1;
	end
	else if(state == S_END)
		play_cnt <= 32'd0;
end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
	begin
		wav_data_wr_en <= 1'b0;
		wav_data <= 8'd0;
	end
	else if(state == S_PLAY)
	begin
		//wav file header 88 bytes remove
		if(sd_sec_read_data_valid == 1'b1 && play_cnt > 32'd87 && play_cnt < file_len)
			wav_data_wr_en <= 1'b1;
		else
			wav_data_wr_en <= 1'b0;
		wav_data <= sd_sec_read_data;
	end
	else
		wav_data_wr_en <= 1'b0;

end

always@(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
	begin
		state <= S_IDLE;
		sd_sec_read <= 1'b0;
		//search start address
		sd_sec_read_addr <= 32'd32000;
		state_code <= 4'd0;
	end else if(sd_init_done == 1'b0)
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
					//if you find a wav file, play it
					if(found == 1'b1)
					begin
						state <= S_PLAY_WAIT;
						sd_sec_read <= 1'b0;
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
			S_PLAY_WAIT:
			begin
				if(fifo_wr_cnt <= (FIFO_DEPTH - 512))
					state <= S_PLAY;
			end
			S_PLAY:
			begin
				state_code <= 4'd3;
				if(sd_sec_read_end == 1'b1)
				begin
					sd_sec_read_addr <= sd_sec_read_addr + 32'd1;
					sd_sec_read <= 1'b0;
					if(play_cnt >= file_len)
						state <= S_END;
					else
						state <= S_PLAY_WAIT;
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