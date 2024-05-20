// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

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
//  2017/6/21    meisq         1.0         Original
//*******************************************************************************/
module top(
	input                       clk,
	input                       rst_n,
	output                      vga_out_hs,        //vga horizontal synchronization
	output                      vga_out_vs,        //vga vertical synchronization
	output[4:0]                 vga_out_r,         //vga red
	output[5:0]                 vga_out_g,         //vga green
	output[4:0]                 vga_out_b,         //vga blue
	output                      sdram_clk,         //sdram clock
	output                      sdram_cke,         //sdram clock enable
	output                      sdram_cs_n,        //sdram chip select
	output                      sdram_we_n,        //sdram write enable
	output                      sdram_cas_n,       //sdram column address strobe
	output                      sdram_ras_n,       //sdram row address strobe
	output[1:0]                 sdram_dqm,         //sdram data enable
	output[1:0]                 sdram_ba,          //sdram bank address
	output[12:0]                sdram_addr,        //sdram address
	inout[15:0]                 sdram_dq           //sdram data
);

parameter MEM_DATA_BITS         = 16  ;            //external memory user interface data width
parameter ADDR_BITS             = 24  ;            //external memory user interface address width
parameter BUSRT_BITS            = 10  ;            //external memory user interface burst width
parameter BURST_SIZE            = 128 ;

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
wire[15:0]                      read_data;
wire                            write_en;
wire[15:0]                      write_data;
wire                            write_req;
wire                            write_req_ack;
wire                            ext_mem_clk;       //external memory clock
wire                            video_clk;         //video pixel clock
wire                            hs;
wire                            vs;
wire[15:0]                      vout_data;

wire                            clk_bufg;

assign vga_out_hs = hs;
assign vga_out_vs = vs;
assign vga_out_r  = vout_data[15:11];
assign vga_out_g  = vout_data[10:5];
assign vga_out_b  = vout_data[4:0];
assign sdram_clk = ext_mem_clk;

IBUFG  IBUFG_INST
(
  .O(clk_bufg),
  .I(clk)
);

//generate SD card controller clock and  SDRAM controller clock
sys_pll sys_pll_m0(
	.CLK_IN1                    (clk_bufg   ),
	.CLK_OUT1                   (),
	.CLK_OUT2                   (ext_mem_clk),
	.CLK_OUT3                   (mem_ref_clk),	
	.RESET                      (~rst_n     ),
	.LOCKED                     (           )
	);
//generate video pixel clock	
video_pll video_pll_m0
(
	.clk_video                  (clk_bufg  ),
	.clk_out1                   (video_clk  ),
	.RESET                      (~rst_n     ),
	.LOCKED                     (           )
);
	
video_timing_data video_timing_data_m0
(
	.video_clk                  (video_clk                ),
	.rst                        (~rst_n                   ),
	.read_req                   (read_req                 ),
	.read_req_ack               (read_req_ack             ),
	.read_en                    (read_en                  ),
	.read_data                  (read_data                ),
	.hs                         (hs                       ),
	.vs                         (vs                       ),
	.de                         (                         ),
	.vout_data                  (vout_data                )
);

//instantiate an asynchronous FIFO 
wire[15:0]                      wr_data_count;              // write used words
wire                            read_fifo_aclr;             // fifo Asynchronous clear
afifo_16_256 read_buf
	(
	.rd_clk                     (video_clk                  ),          // Read side clock
	.wr_clk                     (mem_ref_clk                ),          // Write side clock
	.rst                        (read_fifo_aclr             ),          // Asynchronous clear
	.wr_en                      (rd_burst_data_valid        ),          // Write Request
	.rd_en                      (read_en                    ),          // Read Request
	.din                        (rd_burst_data              ),          // Input Data
	.empty                      (                           ),          // Read side Empty flag
	.full                       (                           ),          // Write side Full flag
	.rd_data_count              (                           ),          // Read Used Words
	.wr_data_count              (wr_data_count              ),          // Write Used Words
	.dout                       (read_data                  )
);

frame_fifo_read
#
(
	.MEM_DATA_BITS              (MEM_DATA_BITS            ),
	.ADDR_BITS                  (ADDR_BITS                ),
	.BUSRT_BITS                 (BUSRT_BITS               ),
	.BURST_SIZE                 (BURST_SIZE               )
)
frame_fifo_read_m0
(
	.rst                        (~rst_n                   ),
	.mem_clk                    (mem_ref_clk              ),
	.rd_burst_req               (rd_burst_req             ),   
	.rd_burst_len               (rd_burst_len             ),  
	.rd_burst_addr              (rd_burst_addr            ),
	.rd_burst_data_valid        (rd_burst_data_valid      ),    
	.rd_burst_finish            (rd_burst_finish          ),
	.read_req                   (read_req                 ),
	.read_req_ack               (read_req_ack             ),
	.read_finish                (                         ),
	.read_addr_0                (24'd0                    ),
	.read_addr_1                (24'd0                    ),
	.read_addr_2                (24'd0                    ),
	.read_addr_3                (24'd0                    ),
	.read_addr_index            (2'd0                     ),    
	.read_len                   (24'd786432               ),
	.fifo_aclr                  (read_fifo_aclr           ),
	.wr_data_count              (wr_data_count            )
);

test_write tw0(
	.clk(mem_ref_clk),
	.rst_n(rst_n),

	.wr_burst_req(wr_burst_req),
	.wr_burst_len(wr_burst_len),
	.wr_burst_addr(wr_burst_addr),
	.wr_burst_data(wr_burst_data),

	.wr_burst_data_req(wr_burst_data_req),
	.wr_burst_finish(wr_burst_finish)
);

//sdram controller
sdram_core sdram_core_m0
(
	.rst                        (~rst_n                   ),
	.clk                        (mem_ref_clk              ),
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