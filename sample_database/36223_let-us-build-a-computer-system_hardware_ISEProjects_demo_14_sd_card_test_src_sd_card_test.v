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

//================================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------------
//  2017/6/19     meisq         1.0         Original
//*******************************************************************************/
module sd_card_test(
	input            clk,
	input            rst_n,
	input            key1,
	output           SD_nCS,
	output           SD_DCLK,
	output           SD_MOSI,
	input            SD_MISO,
	output [5:0]     seg_sel,
	output [7:0]     seg_data
);
parameter S_IDLE         = 0;
parameter S_READ         = 1;
parameter S_WRITE        = 2;
parameter S_END          = 3;

reg[3:0] state;
wire             sd_init_done;
reg              sd_sec_read;
wire[31:0]       sd_sec_read_addr;
wire[7:0]        sd_sec_read_data;
wire             sd_sec_read_data_valid;
wire             sd_sec_read_end;
reg              sd_sec_write;
wire[31:0]       sd_sec_write_addr;
reg [7:0]        sd_sec_write_data;
wire             sd_sec_write_data_req;
wire             sd_sec_write_end;
reg[9:0]         wr_cnt;
reg[9:0]         rd_cnt;
wire             button_negedge;
reg[7:0]         read_data;
ax_debounce ax_debounce_m0
(
	.clk             (clk),
	.rst             (~rst_n),
	.button_in       (key1),
	.button_posedge  (),
	.button_negedge  (button_negedge),
	.button_out      ()
);

wire[6:0] seg_data_0;
seg_decoder seg_decoder_m0(
    .bin_data  (read_data[3:0]),
    .seg_data  (seg_data_0)
);
wire[6:0] seg_data_1;
seg_decoder seg_decoder_m1(
    .bin_data  (read_data[7:4]),
    .seg_data  (seg_data_1)
);
seg_scan seg_scan_m0(
    .clk        (clk),
    .rst_n      (rst_n),
    .seg_sel    (seg_sel),
    .seg_data   (seg_data),
    .seg_data_0 ({1'b1,7'b1111_111}),
    .seg_data_1 ({1'b1,7'b1111_111}),
    .seg_data_2 ({1'b1,7'b1111_111}),
    .seg_data_3 ({1'b1,7'b1111_111}),
    .seg_data_4 ({1'b1,seg_data_1}),
    .seg_data_5 ({sd_init_done,seg_data_0})
);


always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		wr_cnt <= 10'd0;
	else if(state == S_WRITE)
	begin
		if(sd_sec_write_data_req == 1'b1)
			wr_cnt <= wr_cnt + 10'd1;
	end
	else
		wr_cnt <= 10'd0;
end

always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		rd_cnt <= 10'd0;
	else if(state == S_READ)
	begin
		if(sd_sec_read_data_valid == 1'b1)
			rd_cnt <= rd_cnt + 10'd1;
	end
	else
		rd_cnt <= 10'd0;
end

always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		read_data <= 8'd0;
	else if(state == S_READ)
	begin
		if(sd_sec_read_data_valid == 1'b1 && rd_cnt == 10'd0)
			read_data <= sd_sec_read_data;
	end
	else if(state == S_END && button_negedge == 1'b1)
		read_data <= read_data + 8'd1;
end

always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
		sd_sec_write_data <= 8'd0;
	else if(sd_sec_write_data_req)
		sd_sec_write_data <= read_data + wr_cnt[7:0];
end

always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
	begin
		state <= S_IDLE;
		sd_sec_read <= 1'b0;
		sd_sec_write <= 1'b0;
	end
	else if(sd_init_done == 1'b0)
	begin
		state <= S_IDLE;
	end
	else
		case(state)
			S_IDLE:
			begin
				state <= S_READ;
			end
			S_WRITE:
			begin
				if(sd_sec_write_end == 1'b1)
				begin
					sd_sec_write <= 1'b0;
					state <= S_READ;
				end
				else
					sd_sec_write <= 1'b1;
			end
			
			S_READ:
			begin
				if(sd_sec_read_end == 1'b1)
				begin
					state <= S_END;
					sd_sec_read <= 1'b0;
				end
				else
				begin
					sd_sec_read <= 1'b1;
				end                 
			end         
			S_END:
			begin
				if(button_negedge == 1'b1)
					state <= S_WRITE;
			end
			default:
				state <= S_IDLE;
		endcase
end

sd_card_top  sd_card_top_m0(
	.clk                       (clk                    ),
	.rst                       (~rst_n                 ),
	.SD_nCS                    (SD_nCS                 ),
	.SD_DCLK                   (SD_DCLK                ),
	.SD_MOSI                   (SD_MOSI                ),
	.SD_MISO                   (SD_MISO                ),
	.sd_init_done              (sd_init_done           ),
	.sd_sec_read               (sd_sec_read            ),
	.sd_sec_read_addr          (sd_sec_read_addr       ),
	.sd_sec_read_data          (sd_sec_read_data       ),
	.sd_sec_read_data_valid    (sd_sec_read_data_valid ),
	.sd_sec_read_end           (sd_sec_read_end        ),
	.sd_sec_write              (sd_sec_write           ),
	.sd_sec_write_addr         (sd_sec_write_addr      ),
	.sd_sec_write_data         (sd_sec_write_data      ),
	.sd_sec_write_data_req     (sd_sec_write_data_req  ),
	.sd_sec_write_end          (sd_sec_write_end       )
);
endmodule 