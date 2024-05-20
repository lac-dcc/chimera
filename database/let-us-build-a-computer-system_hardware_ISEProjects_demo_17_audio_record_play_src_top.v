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
//  2017/7/24    meisq         1.0         Original
//*************************************************************************/
`timescale 1ps/1ps
module top
(
	input                       clk,                    //clock input
	input                       rst_n,	                //reset input
	input                       key,                   //record play button
	input                       wm8731_bclk,            //audio bit clock
	input                       wm8731_daclrc,          //DAC sample rate left right clock
	output                      wm8731_dacdat,          //DAC audio data output 
	input                       wm8731_adclrc,          //ADC sample rate left right clock
	input                       wm8731_adcdat,          //ADC audio data input
	inout                       wm8731_scl,             //I2C clock
	inout                       wm8731_sda,             //I2C data
	output                      sdram_clk,              //sdram clock
	output                      sdram_cke,              //sdram clock enable
	output                      sdram_cs_n,             //sdram chip select
	output                      sdram_we_n,             //sdram write enable
	output                      sdram_cas_n,            //sdram column address strobe
	output                      sdram_ras_n,            //sdram row address strobe
	output[1:0]                 sdram_dqm,              //sdram data enable 
	output[1:0]                 sdram_ba,               //sdram bank address
	output[12:0]                sdram_addr,             //sdram address
	inout[15:0]                 sdram_dq                //sdram data
);
parameter MEM_DATA_BITS         = 16  ;                 //external memory user interface data width
parameter ADDR_BITS             = 24  ;                 //external memory user interface address width
parameter BUSRT_BITS            = 10  ;                 //external memory user interface burst width
wire                            wr_burst_data_req;
wire                            wr_burst_finish;
wire                            rd_burst_finish;
wire                            rd_burst_req;
wire                            wr_burst_req;
wire[BUSRT_BITS - 1:0]          rd_burst_len;
wire[BUSRT_BITS - 1:0]          wr_burst_len;
wire[ADDR_BITS - 1:0]           rd_burst_addr;
wire[ADDR_BITS - 1:0]           wr_burst_addr;
wire                            rd_burst_data_valid;
wire[MEM_DATA_BITS - 1 : 0]     rd_burst_data;
wire[MEM_DATA_BITS - 1 : 0]     wr_burst_data;
wire                            read_req;
wire                            read_req_ack;  
wire                            read_en;
wire[63:0]                      read_data;
wire                            write_en;
wire[63:0]                      write_data;
wire                            write_req;
wire                            write_req_ack;
wire[9:0]                       lut_index;
wire[31:0]                      lut_data;
wire                            sdram_refclk;
wire                            clk_bufg;
//generate SDRAM controller clock
IBUFG IBUFGP_INST
(
  .O(clk_bufg),
  .I(clk)
);

sdram_pll sdram_pll_m0
   ( .CLK_IN1(clk_bufg),      

    .CLK_OUT1(sdram_clk),    
    .CLK_OUT2(sdram_refclk),    
    .RESET(~rst_n),
    .LOCKED()
);   

//I2C master controller
i2c_config i2c_config_m0(
	.rst                        (~rst_n                   ),
	.clk                        (clk_bufg                 ),
	.clk_div_cnt                (16'd500                  ),
	.i2c_addr_2byte             (1'b0                     ),
	.lut_index                  (lut_index                ),
	.lut_dev_addr               (lut_data[31:24]          ),
	.lut_reg_addr               (lut_data[23:8]           ),
	.lut_reg_data               (lut_data[7:0]            ),
	.error                      (                         ),
	.done                       (                         ),
	.i2c_scl                    (wm8731_scl               ),
	.i2c_sda                    (wm8731_sda               )
);
//configure look-up table
lut_wm8731 lut_wm8731_m0(
	.lut_index                  (lut_index                ),
	.lut_data                   (lut_data                 )
);

audio_record_play_ctrl audio_record_play_ctrl_m0
(
	.rst                        (~rst_n                   ),
	.clk                        (clk_bufg                 ),
	.key                        (key                      ),
	.bclk                       (wm8731_bclk              ),
	.daclrc                     (wm8731_daclrc            ),
	.dacdat                     (wm8731_dacdat            ),
	.adclrc                     (wm8731_adclrc            ),
	.adcdat                     (wm8731_adcdat            ),
	.write_req                  (write_req                ),
	.write_req_ack              (write_req_ack            ),
	.write_en                   (write_en                 ),
	.write_data                 (write_data               ),
	.read_req                   (read_req                 ),
	.read_req_ack               (read_req_ack             ),
	.read_en                    (read_en                  ),
	.read_data                  (read_data                )
);

//audio frame data read-write control
frame_read_write frame_read_write_m0
(
	.rst                        (~rst_n                   ),
	.mem_clk                    (sdram_refclk             ),
	.rd_burst_req               (rd_burst_req             ),
	.rd_burst_len               (rd_burst_len             ),
	.rd_burst_addr              (rd_burst_addr            ),
	.rd_burst_data_valid        (rd_burst_data_valid      ),
	.rd_burst_data              (rd_burst_data            ),
	.rd_burst_finish            (rd_burst_finish          ),
	.read_clk                   (clk_bufg                 ),
	.read_req                   (read_req                 ),
	.read_req_ack               (read_req_ack             ),
	.read_finish                (                         ),
	.read_addr_0                (24'd0                    ), //The first frame address is 0
	.read_addr_1                (24'd0                    ), //The second frame address is 24'd2073600 ,large enough address space for one frame of video
	.read_addr_2                (24'd0                    ),
	.read_addr_3                (24'd0                    ),
	.read_addr_index            (2'd0                     ),
	.read_len                   (24'd786432               ), //frame size, as large as possible storage space
	.read_en                    (read_en                  ),
	.read_data                  (read_data                ),

	.wr_burst_req               (wr_burst_req             ),
	.wr_burst_len               (wr_burst_len             ),
	.wr_burst_addr              (wr_burst_addr            ),
	.wr_burst_data_req          (wr_burst_data_req        ),
	.wr_burst_data              (wr_burst_data            ),
	.wr_burst_finish            (wr_burst_finish          ),
	.write_clk                  (clk_bufg                 ),
	.write_req                  (write_req                ),
	.write_req_ack              (write_req_ack            ),
	.write_finish               (                         ),
	.write_addr_0               (24'd0                    ),
	.write_addr_1               (24'd0                    ),
	.write_addr_2               (24'd0                    ),
	.write_addr_3               (24'd0                    ),
	.write_addr_index           (2'd0                     ),
	.write_len                  (24'd786432               ), //frame size, as large as possible storage space
	.write_en                   (write_en                 ),
	.write_data                 (write_data               )
);
//sdram controller
sdram_core sdram_core_m0
(
	.rst                        (~rst_n                   ),
	.clk                        (sdram_refclk                ),
	.rd_burst_req               (rd_burst_req             ),
	.rd_burst_len               (rd_burst_len             ),
	.rd_burst_addr              (rd_burst_addr            ),
	.rd_burst_data_valid        (rd_burst_data_valid      ),
	.rd_burst_data              (rd_burst_data            ),
	.rd_burst_finish            (rd_burst_finish          ),
	.wr_burst_req               (wr_burst_req             ),
	.wr_burst_len               (wr_burst_len             ),
	.wr_burst_addr              (wr_burst_addr            ),
	.wr_burst_data_req          (wr_burst_data_req        ),
	.wr_burst_data              (wr_burst_data            ),
	.wr_burst_finish            (wr_burst_finish          ),
	.sdram_cke                  (sdram_cke                ),
	.sdram_cs_n                 (sdram_cs_n               ),
	.sdram_ras_n                (sdram_ras_n              ),
	.sdram_cas_n                (sdram_cas_n              ),
	.sdram_we_n                 (sdram_we_n               ),
	.sdram_dqm                  (sdram_dqm                ),
	.sdram_ba                   (sdram_ba                 ),
	.sdram_addr                 (sdram_addr               ),
	.sdram_dq                   (sdram_dq                 )
);



endmodule
