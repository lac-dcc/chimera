// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
//   The external memory test module writes the address as data and compares    //
//   it to the address                                                          //
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
//2017/6/28                    1.0          Original
//*******************************************************************************/
`timescale 1ps/1ps
module top
(
	input                        clk,
	input                        rst_n,
	output[1:0]                  led,
	output                       sdram_clk,     //sdram clock
	output                       sdram_cke,     //sdram clock enable
	output                       sdram_cs_n,    //sdram chip select
	output                       sdram_we_n,    //sdram write enable
	output                       sdram_cas_n,   //sdram column address strobe
	output                       sdram_ras_n,   //sdram row address strobe
	output[1:0]                  sdram_dqm,     //sdram data enable 
	output[1:0]                  sdram_ba,      //sdram bank address
	output[12:0]                 sdram_addr,    //sdram address
	inout[15:0]                  sdram_dq       //sdram data
);
parameter MEM_DATA_BITS          = 16  ;        //external memory user interface data width
parameter ADDR_BITS              = 24  ;        //external memory user interface address width
parameter BUSRT_BITS             = 10  ;        //external memory user interface burst width
parameter BURST_SIZE             = 128 ;        //burst size

wire                             wr_burst_data_req;       // from external memory controller,write data request ,before data 1 clock
wire                             wr_burst_finish;         // from external memory controller,burst write finish
wire                             rd_burst_finish;         // from external memory controller,burst read finish
wire                             rd_burst_req;            // to external memory controller,send out a burst read request
wire                             wr_burst_req;            // to external memory controller,send out a burst write request
wire[BUSRT_BITS - 1:0]           rd_burst_len;            // to external memory controller,data length of the burst read request, not bytes
wire[BUSRT_BITS - 1:0]           wr_burst_len;            // to external memory controller,data length of the burst write request, not bytes
wire[ADDR_BITS - 1:0]            rd_burst_addr;           // to external memory controller,base address of the burst read request 
wire[ADDR_BITS - 1:0]            wr_burst_addr;           // to external memory controller,base address of the burst write request
wire                             rd_burst_data_valid;     // from external memory controller,read data valid 
wire[MEM_DATA_BITS - 1 : 0]      rd_burst_data;           // from external memory controller,read request data
wire[MEM_DATA_BITS - 1 : 0]      wr_burst_data;           // to external memory controller,write data
wire                             error;
wire                             heartbeat;
wire                             sdram_clk_ref;
assign led[0] = heartbeat;  //The led[0] flash indicates that the test is going
assign led[1] = error;      //if the data is error, led [1] is bright

//generate the SDRAM controller clock
sdram_pll sdram_pll_m0(
	.clk_in(clk),
	.clk_out(sdram_clk),	
	.CLK_OUT2(sdram_clk_ref));	

//sdram controller	
sdram_core sdram_core_m0
(
	.rst                        (~rst_n                   ),
	.clk                        (sdram_clk_ref                ),
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
//external memory test module
mem_test
#(
	.MEM_DATA_BITS             (MEM_DATA_BITS),
	.ADDR_BITS                 (ADDR_BITS    ),
	.BUSRT_BITS                (BUSRT_BITS   ),
	.BURST_SIZE                (BURST_SIZE   )
)
mem_test_m0
(
	.rst                       (~rst_n                   ),                               
	.mem_clk                   (sdram_clk_ref                ),                            
	.rd_burst_req              (rd_burst_req             ),                    
	.wr_burst_req              (wr_burst_req             ),
	.rd_burst_len              (rd_burst_len             ),            
	.wr_burst_len              (wr_burst_len             ),              
	.rd_burst_addr             (rd_burst_addr            ),
	.wr_burst_addr             (wr_burst_addr            ),
	.rd_burst_data_valid       (rd_burst_data_valid      ),                
	.wr_burst_data_req         (wr_burst_data_req        ),                 
	.rd_burst_data             (rd_burst_data            ),
	.wr_burst_data             (wr_burst_data            ),   
	.rd_burst_finish           (rd_burst_finish          ),                 
	.wr_burst_finish           (wr_burst_finish          ),                    
	.error                     (error                    ),
	.heartbeat                 (heartbeat                )
);


wire [35:0]   CONTROL0;
wire [255:0]  TRIG0;
chipscope_icon icon_debug (
    .CONTROL0(CONTROL0) // INOUT BUS [35:0]
);

chipscope_ila ila_filter_debug (
    .CONTROL(CONTROL0), // INOUT BUS [35:0]
   // .CLK(dma_clk),      // IN
    .CLK(sdram_clk_ref),      // IN
    .TRIG0(TRIG0)      // IN BUS [255:0]
    //.TRIG_OUT(TRIG_OUT0)
);                                                     

assign  TRIG0[0]=wr_burst_req;                                               
assign  TRIG0[1]=rd_burst_req;
assign  TRIG0[25:2]=wr_burst_addr;                                               
assign  TRIG0[49:26]=rd_burst_addr;
assign  TRIG0[50]=rd_burst_data_valid;
assign  TRIG0[51]=wr_burst_data_req;
assign  TRIG0[67:52]=wr_burst_data;
assign  TRIG0[83:68]=rd_burst_data;
assign  TRIG0[84]=error;


endmodule
