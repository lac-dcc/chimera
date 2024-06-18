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
module spi_flash_top
(
	input            sys_clk,
	input            rst,
	output           nCS,
	output           DCLK,
	output           MOSI,
	input            MISO,
	input[15:0]      clk_div,
	input            flash_read,
	input            flash_write,
	input            flash_bulk_erase,
	input            flash_sector_erase,
	output           flash_read_ack,
	output           flash_write_ack,
	output           flash_bulk_erase_ack,
	output           flash_sector_erase_ack,
	input[23:0]      flash_read_addr,
	input[23:0]      flash_write_addr,
	input[23:0]      flash_sector_addr,
	input[7:0]       flash_write_data_in,
	input[8:0]       flash_read_size,
	input[8:0]       flash_write_size,
	output           flash_write_data_req,
	output[7:0]      flash_read_data_out,
	output           flash_read_data_valid
);
wire[7:0]           cmd;
wire                cmd_valid;
wire                cmd_ack;
wire[23:0]          addr;
wire[7:0]           data_in;
wire[8:0]           size;
wire                data_req;
wire[7:0]           data_out;
wire                data_valid;
spi_flash_ctrl spi_flash_ctrl_m0(
	.sys_clk                 ( sys_clk                      ),
	.rst                     ( rst                          ),
	.flash_read              ( flash_read                   ),
	.flash_write             ( flash_write                  ),
	.flash_bulk_erase        ( flash_bulk_erase             ),
	.flash_sector_erase      ( flash_sector_erase           ),
	.flash_read_ack          ( flash_read_ack               ),
	.flash_write_ack         ( flash_write_ack              ),
	.flash_bulk_erase_ack    ( flash_bulk_erase_ack         ),
	.flash_sector_erase_ack  ( flash_sector_erase_ack       ),
	.flash_read_addr         ( flash_read_addr              ),
	.flash_write_addr        ( flash_write_addr             ),
	.flash_sector_addr       ( flash_sector_addr            ),
	.flash_write_data_in     ( flash_write_data_in          ),
	.flash_read_size         ( flash_read_size              ),
	.flash_write_size        ( flash_write_size             ),
	.flash_write_data_req    ( flash_write_data_req         ),
	.flash_read_data_out     ( flash_read_data_out          ),
	.flash_read_data_valid   ( flash_read_data_valid        ),
	.cmd                     ( cmd                          ),
	.cmd_valid               ( cmd_valid                    ),
	.cmd_ack                 ( cmd_ack                      ),
	.addr                    ( addr                         ),
	.data_in                 ( data_in                      ),
	.size                    ( size                         ),
	.data_req                ( data_req                     ),
	.data_out                ( data_out                     ),
	.data_valid              ( data_valid                   )
);

wire             CS_reg;
wire             wr_req;
wire             wr_ack;
wire[7:0]        send_data;
wire[7:0]        data_recv;
//
spi_flash_cmd spi_flash_cmd_m0
(
	.sys_clk(sys_clk),
	.rst(rst),
	.cmd(cmd),
	.cmd_valid(cmd_valid),
	.cmd_ack(cmd_ack),
	.addr(addr),
	.data_in(data_in),
	.size(size),
	.data_req(data_req),
	.data_out(data_out),
	.data_valid(data_valid),
	// to spi master
	.CS_reg(CS_reg),
	.wr_req(wr_req),
	.wr_ack(wr_ack),
	.send_data(send_data),
	.data_recv(data_recv)
);
//SPI master controller,send a byte and return one at the same time
spi_master spi_master_m0
(
	.sys_clk(sys_clk),
	.rst(rst),
	.nCS(nCS),
	.DCLK(DCLK),
	.MOSI(MOSI),
	.MISO(MISO),
	.clk_div(clk_div),
	.CPOL(1'b1),
	.CPHA(1'b1),
	.nCS_ctrl(CS_reg),
	.wr_req(wr_req),
	.wr_ack(wr_ack),
	.data_in(send_data),
	.data_out(data_recv)
);
endmodule

