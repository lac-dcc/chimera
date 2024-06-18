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
//  2017/5/3     meisq          1.0         Original
//*******************************************************************************/
`include "spi_flash_defines.v"
module spi_flash_test(
	input            clk,
	input            rst_n,
	input            key1,
	output           ncs,
	output           dclk, // clock
	output           mosi, // master output
	input            miso, // master input
	output [5:0]     seg_sel,
	output [7:0]     seg_data
);
localparam S_IDLE       = 0;
localparam S_READ_ID    = 1;
localparam S_SE         = 2;//Sector Erase
localparam S_PP         = 3;
localparam S_READ       = 4;
localparam S_WAIT       = 5;
reg[3:0] state;

wire      button_negedge;
reg[7:0]  read_data;
reg[31:0] timer;

reg            flash_read;
reg            flash_write;
reg            flash_bulk_erase;
reg            flash_sector_erase;
wire           flash_read_ack;
wire           flash_write_ack;
wire           flash_bulk_erase_ack;
wire           flash_sector_erase_ack;
reg[23:0]      flash_read_addr;
reg[23:0]      flash_write_addr;
reg[23:0]      flash_sector_addr;
reg[7:0]       flash_write_data_in;
wire[8:0]      flash_read_size;
wire[8:0]      flash_write_size;
wire           flash_write_data_req;
wire[7:0]      flash_read_data_out;
wire           flash_read_data_valid;

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
	.seg_data_5 ({1'b1,seg_data_0})
);
assign flash_read_size = 9'd1;
assign flash_write_size = 9'd1;
always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
	begin
		state <= S_IDLE;

		flash_read <= 1'b0;
		flash_write <= 1'b0;
		flash_bulk_erase <= 1'b0;
		flash_sector_erase <= 1'b0;
		flash_read_addr <= 24'd0;
		flash_write_addr <= 24'd0;
		flash_sector_addr <= 24'd0;
		flash_write_data_in <= 8'd0;
		timer <= 32'd0;
	end
	else
		case(state)
			S_IDLE:
			begin
				if(timer >= 32'd12_499_999)
					state <= S_READ;
				else
					timer <= timer + 32'd1;
			end
			S_WAIT:
				if(button_negedge == 1'b1)
				begin
					state <= S_SE;
					read_data <= read_data + 8'd1;
				end
			S_SE:
			begin
				if(flash_sector_erase_ack == 1'b1)
				begin
					flash_sector_erase <= 1'b0;
					state <= S_PP;
				end
				else
				begin
					flash_sector_erase <= 1'b1;
					flash_sector_addr <= 24'd0;
				end
			end
			S_PP:
			begin
				if(flash_write_data_req == 1'b1)
					flash_write_data_in <= read_data;

				if(flash_write_ack == 1'b1)
				begin
					flash_write <= 1'b0;
					state <= S_READ;
				end
				else
				begin
					flash_write <= 1'b1;
					flash_write_addr <= 24'd0;
				end
			end
			S_READ:
			begin
				if(flash_read_data_valid == 1'b1)
					read_data <= flash_read_data_out;

				if(flash_read_ack == 1'b1)
				begin
					flash_read <= 1'd0;
					state <= S_WAIT;
				end
				else
				begin
					flash_read <= 1'd1;
					flash_read_addr <= 24'd0;
				end
			end
			default:
				state <= S_IDLE;
		endcase
end

spi_flash_top spi_flash_top_m0(
	.sys_clk                     (clk                      ),
	.rst                         (~rst_n                   ),
	.nCS                         (ncs                      ),
	.DCLK                        (dclk                     ),
	.MOSI                        (mosi                     ),
	.MISO                        (miso                     ),
	.clk_div                     (16'd0                    ), // 50Mhz / 4
	.flash_read                  (flash_read               ),
	.flash_write                 (flash_write              ),
	.flash_bulk_erase            (flash_bulk_erase         ),
	.flash_sector_erase          (flash_sector_erase       ),
	.flash_read_ack              (flash_read_ack           ),
	.flash_write_ack             (flash_write_ack          ),
	.flash_bulk_erase_ack        (flash_bulk_erase_ack     ),
	.flash_sector_erase_ack      (flash_sector_erase_ack   ),
	.flash_read_addr             (flash_read_addr          ),
	.flash_write_addr            (flash_write_addr         ),
	.flash_sector_addr           (flash_sector_addr        ),
	.flash_write_data_in         (flash_write_data_in      ),
	.flash_read_size             (flash_read_size          ),
	.flash_write_size            (flash_write_size         ),
	.flash_write_data_req        (flash_write_data_req     ),
	.flash_read_data_out         (flash_read_data_out      ),
	.flash_read_data_valid       (flash_read_data_valid    )
);
endmodule 