// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

//////////////////////////////////////////////////////////////////////////////////
//  SDRAM controller with configurable parameters                               //
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
//  2017/6/28     meisq          1.0         Original
//*******************************************************************************/

`timescale 1ns/1ps
module sdram_core
#
(
	parameter T_RP                    =  2,
	parameter T_RC                    =  9,
	parameter T_MRD                   =  2,
	parameter T_RCD                   =  3,
	parameter T_WR                    =  2,
	parameter CASn                    =  3,
	parameter SDR_MODE_REG            =  {4'b0000, 3'b010, 1'b0, 3'b000},
	parameter SDR_BA_WIDTH            =  2,
	parameter SDR_ROW_WIDTH           =  13,
	parameter SDR_COL_WIDTH           =  9,
	parameter SDR_DQ_WIDTH            =  16,
	parameter SDR_DQM_WIDTH           =  SDR_DQ_WIDTH/8,
	parameter APP_ADDR_WIDTH          =  SDR_BA_WIDTH + SDR_ROW_WIDTH + SDR_COL_WIDTH,
	parameter APP_BURST_WIDTH         =  9
)               
(
	//  system
	input                             rst,                 //reset signal,high for reset
	input                             clk,
	//  write
	input                             wr_burst_req,        //  write request
	input  [SDR_DQ_WIDTH-1    : 0]    wr_burst_data,       //  write data
	input  [APP_BURST_WIDTH-1 : 0]    wr_burst_len,        //  write data length, ahead of wr_burst_req
	input  [APP_ADDR_WIDTH-1 : 0]     wr_burst_addr,       //  write base address of sdram write buffer
	output                            wr_burst_data_req,   //  wrtie data request, 1 clock ahead
	output                            wr_burst_finish,     //  write data is end
	//  read
	input                             rd_burst_req,        //  read request
	input  [APP_BURST_WIDTH-1 : 0]    rd_burst_len,        //  read data length, ahead of rd_burst_req
	input  [APP_ADDR_WIDTH-1 : 0]     rd_burst_addr,       //  read base address of sdram read buffer
	output [SDR_DQ_WIDTH-1    : 0]    rd_burst_data,       //  read data to internal
	output                            rd_burst_data_valid, //  read data enable (valid)
	output                            rd_burst_finish,     //  read data is end
	//  sdram interface
	output                            sdram_pad_clk,       //sdram chip clock
	output                            sdram_cke,           //clock enable
	output                            sdram_cs_n,          //chip select
	output                            sdram_ras_n,         //row select
	output                            sdram_cas_n,         //colum select
	output                            sdram_we_n,          //write enable 
	output [SDR_BA_WIDTH-1    : 0]    sdram_ba,            //bank address
	output [SDR_ROW_WIDTH-1     : 0]  sdram_addr,          //address
	output [SDR_ROW_WIDTH-1   : 0]    sdram_dqm,           //data mask
	inout  [SDR_DQ_WIDTH-1    : 0]    sdram_dq             //data
);

localparam ONE                        = 256'd1;
localparam ZERO                       = 256'd0;

//  SDRAM core state machine code
localparam S_IDLE                     = 5'd1;              //no operation
localparam S_INIT_PRE                 = 5'd2;              //prepare initial
localparam S_INIT_PRE_NOP             = 5'd3;              //nop time
localparam S_INIT_REF                 = 5'd4;              //init refesh operation
localparam S_INIT_REF_NOP             = 5'd5;              //nop after refesh
localparam S_MRS                      = 5'd6;              //mode register load
localparam S_MRS_NOP                  = 5'd7;              //nop after load
localparam S_IDLE_REF                 = 5'd8;              //IDLE after refresh
localparam S_IDLE_REF_NOP             = 5'd9;              //nop operation
localparam S_WR_ACT                   = 5'd10;             //write active bank
localparam S_WR_ACT_NOP               = 5'd11;             //nop after active
localparam S_RD_ACT                   = 5'd12;             //read active
localparam S_RD_ACT_NOP               = 5'd13;             //nop after read
localparam S_WR_COL                   = 5'd14;             //write colum address
localparam S_RD_COL                   = 5'd15;             //read colum address
localparam S_WR_END                   = 5'd16;             //write finish
localparam S_PRE                      = 5'd17;             //prepare
localparam S_PRE_NOP                  = 5'd18;             //nop after prepare

//  state machine delay, wr_data_rq is 1 clock ahead,
//  wr_data from outside shoule be valid 2 clock later
reg[4:0]                              state;
reg[4:0]                              state_d;
reg[4:0]                              state_d2;


reg[15:0]                             init_cnt;            //  counter 
//  WR/RD request latch
reg                                   wr_rd_i_latch;       //wirite request signal latch
reg                                   rd_rq_i_latch;       //read request signal latch
//  sdram initialization mode_reg
wire[SDR_ROW_WIDTH-1:0]               mode_reg;            //sdram initial peration code
//  sdram initialization time 200us                     
wire                                  init_wait;           //more 200us delay for initial
//  sdram initialization autorefresh 8 times
reg[3:0]                              init_ref_cnt;        //sdram refresh count
														
//  time gap for sdram operation                        
reg[2:0]                              time_tRP_cnt;        //prechard counter
reg[3:0]                              time_tRC_cnt;        //colum delay counter
reg[2:0]                              time_tMRD_cnt;       //mode register write counter
reg[2:0]                              time_tRCD_cnt;       //read colum delay counter                        
wire                                  time_is_tRP;         //T_RP arrive
wire                                  time_is_tRC;         //T_RP arrive
wire                                  time_is_tMRD;        //T_MRD arrive
wire                                  time_is_tRCD;        //T_RCD arrive                            
wire                                  ref_8_times;         //repeat 8 times                                                                                
reg[APP_BURST_WIDTH-1:0]              wr_bst_acu_len;      //  actural burst length  
reg[APP_BURST_WIDTH-1:0]              rd_bst_acu_len;      //  actural burst length                          
reg[APP_BURST_WIDTH-1:0]              wr_bst_len_cnt;      //  count burst length
reg[APP_BURST_WIDTH-1:0]              rd_bst_len_cnt;      //  count burst length
wire                                  wr_cnt_is_len;       //write counter
wire                                  rd_cnt_is_len;       //read counter
reg                                   wr_cnt_is_len_latch; //write counter latch
reg                                   rd_cnt_is_len_latch; //read counter latch
wire                                  page_end;            //sdram one page end
//  sdram if signals
reg[APP_ADDR_WIDTH-SDR_COL_WIDTH-1:0] sdr_row_addr;        //row address
reg[SDR_COL_WIDTH-1:0]                sdr_col_addr;        //colum address
reg[SDR_COL_WIDTH-1:0]                sdr_col_addr_d;      //colum address delay 1 clock
reg[SDR_COL_WIDTH-1:0]                sdr_col_addr_d2;     //colum address delay 2 clock
reg                                   sdr_a10;             //sdram A10 control
reg                                   sdr_ras_n;           //row select
reg                                   sdr_cas_n;           //colum select
reg                                   sdr_we_n;            //write enable
wire[SDR_BA_WIDTH-1:0]                sdr_ba;              //bank address
reg[SDR_ROW_WIDTH-1:0]                sdr_a;               //address
reg[SDR_DQ_WIDTH-1:0]                 sdr_dq;              //data
//  delay signal for SDRAM IF data
reg                                   sdr_wr_en_d;
reg                                   sdr_rd_en_d;
reg                                   sdr_rd_en_d2;
reg                                   sdr_rd_en_d3;
reg                                   sdr_rd_en_d4;
//  write/read frame end latch
reg                                   wr_data_end_latch;
reg                                   rd_data_end_latch;
//  delay of rd_burst_data_valid / wr_burst_data_req
reg                                   wr_data_rq_o_d;
reg                                   rd_data_en_o_d;

reg                                   wr_data_rq;
reg                                   rd_data_en;
reg [SDR_DQ_WIDTH-1: 0]               rd_data;
reg                                   wr_data_end;
reg                                   rd_data_end;

reg                                   last_is_write;
//  mode_reg
assign mode_reg                       = SDR_MODE_REG;      //operation code load to sdram mode register
assign sdram_pad_clk                  = clk;
assign #2 sdram_cke                   = 1'b1;
assign #2 sdram_cs_n                  = 1'b0;
assign #2 sdram_ras_n                 = sdr_ras_n;
assign #2 sdram_cas_n                 = sdr_cas_n;
assign #2 sdram_we_n                  = sdr_we_n;
assign #2 sdram_ba                    = sdr_ba;
`ifdef SDR_A_WIDTH_EQ11
assign #2 sdram_addr                  = {sdr_a10, sdr_a[9 : 0]};
`else
assign #2 sdram_addr                  = {sdr_a[SDR_ROW_WIDTH-1 : 11], sdr_a10, sdr_a[9 : 0]};
`endif
assign #2 sdram_dqm                   = {SDR_DQM_WIDTH{1'b0}};
assign #2 sdram_dq                    = (sdr_wr_en_d) ? sdr_dq : {SDR_DQ_WIDTH{1'bz}};
assign wr_cnt_is_len                  = (wr_bst_len_cnt == wr_bst_acu_len) & wr_rd_i_latch ;
assign rd_cnt_is_len                  = (rd_bst_len_cnt == rd_bst_acu_len) & rd_rq_i_latch ;
//  state
always @(posedge clk or posedge rst)
begin
	if (rst)//wait reset
	begin
		state <= S_IDLE;  //idle after power up
	end
	else
	begin
		case ( state )
			S_IDLE :
			begin
				if (init_wait)  //wait 200us
					state <= S_INIT_PRE;
				else
					state <= S_IDLE;
			end
			//  initialization precharge
			S_INIT_PRE :
			begin
				state <= S_INIT_PRE_NOP;
			end
			S_INIT_PRE_NOP :    //refresh some time
			begin
				if (time_is_tRP)
					state <= S_INIT_REF;
				else
					state <= S_INIT_PRE_NOP;
			end
			//  initialization autorefresh 8 times
			S_INIT_REF :
			begin
				state <= S_INIT_REF_NOP;
			end
			S_INIT_REF_NOP :
			begin
				if (time_is_tRC & ref_8_times)
					state <= S_MRS;
				else if (time_is_tRC)
					state <= S_INIT_REF;
				else
					state <= S_INIT_REF_NOP;
			end
			//  initialization mode register set
			S_MRS :
			begin
				state <= S_MRS_NOP;
			end
			S_MRS_NOP :
			begin
				if (time_is_tMRD)
					state <= S_IDLE_REF;
				else
					state <= S_MRS_NOP;
			end
			//  normal autorefresh
			S_IDLE_REF :
			begin
				state <= S_IDLE_REF_NOP;
			end
			S_IDLE_REF_NOP :    //idle for read and write
			begin
				if (time_is_tRC & wr_rd_i_latch  && !(last_is_write == 1'b1 && rd_rq_i_latch))
				begin
					state <= S_WR_ACT;
				end 
				else if (time_is_tRC & rd_rq_i_latch)
				begin
					state <= S_RD_ACT;
				end 
				else if (time_is_tRC)
					state <= S_IDLE_REF;
				else
				begin
					state <= S_IDLE_REF_NOP;
				end
			end
			//  write active
			S_WR_ACT :
			begin
				state <= S_WR_ACT_NOP;
			end
			//  read active
			S_RD_ACT :
			begin
				state <= S_RD_ACT_NOP;
			end
			S_WR_ACT_NOP :
			begin
				if (time_is_tRCD)
					state <= S_WR_COL;
				else
					state <= S_WR_ACT_NOP;
			end
			S_RD_ACT_NOP :
			begin
				if (time_is_tRCD)
					state <= S_RD_COL;
				else
					state <= S_RD_ACT_NOP;
			end
			//  write column address
			S_WR_COL :
			begin
				if (wr_cnt_is_len | page_end)
					state <= S_WR_END;
				else
					state <= S_WR_COL;
			end
			//  read column address
			S_RD_COL :
			begin
				if (rd_cnt_is_len | page_end)
					state <= S_PRE;
				else
					state <= S_RD_COL;
			end
			S_WR_END :
			begin
				state <= S_PRE;
			end
			//  page_end or w/r end precharge
			S_PRE :
			begin
				state <= S_PRE_NOP;
			end
			S_PRE_NOP :
			begin
				if (time_is_tRP & (rd_cnt_is_len_latch|wr_cnt_is_len_latch))
					state <= S_IDLE_REF;
				else if(wr_rd_i_latch  && !(last_is_write == 1'b1 && rd_rq_i_latch))
				begin
					state <= S_WR_ACT;
				end
				else if(rd_rq_i_latch )
				begin
					state  <= S_RD_ACT;
				end
				else
				begin
					state <= S_PRE_NOP;
				end
			end
			default :
				state <= S_IDLE;
			endcase
		end
end

//   delay state
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1) 
	begin
			state_d  <= S_IDLE;
			state_d2 <= S_IDLE;
	end
	else 
	begin
			state_d  <= state;
			state_d2 <= state_d;
	end
end

//  init_ref_cnt
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		init_ref_cnt <= 4'd0;
	else if (~ref_8_times & state == S_INIT_REF)
		init_ref_cnt <= init_ref_cnt + 4'd1;
end

always @(posedge clk or posedge rst) 
begin 
	if(rst == 1'b1) 
		init_cnt <= 16'd0; 
	else if (~init_cnt[15])    
		init_cnt <= init_cnt + 16'd1;
end 

//  init_wait
assign init_wait = init_cnt[15];

//  ref_8_times
assign ref_8_times   = init_ref_cnt[3];

//  wr_rd_i_latch
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		wr_rd_i_latch <= 1'b0;
	else
		if (wr_cnt_is_len_latch & state == S_PRE)
			wr_rd_i_latch <= 1'b0;
		else if (wr_burst_req && state == S_IDLE_REF)
			wr_rd_i_latch <= 1'b1;
end

//  rd_rq_i_latch
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		rd_rq_i_latch <= 1'b0;
	else
		if (rd_cnt_is_len_latch & state == S_PRE)
			rd_rq_i_latch <= 1'b0;
		else if (rd_burst_req && state == S_IDLE_REF)
			rd_rq_i_latch <= 1'b1;
end

/////////////////////////////////////////////////////////////////
//  time_tRP_cnt (precharge)
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		time_tRP_cnt <= 3'd0;
	else
		if (time_is_tRP)
			 time_tRP_cnt <= 3'd0;
		else if (state == S_INIT_PRE || state == S_INIT_PRE_NOP ||
				 state == S_PRE || state == S_PRE_NOP)
			time_tRP_cnt <= time_tRP_cnt + 3'd1;
end

assign time_is_tRP = (time_tRP_cnt == T_RP-1);

//  time_tRC_cnt (refresh)
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		time_tRC_cnt <= 4'd0;
	else
		if (time_is_tRC)
			time_tRC_cnt <= 4'd0;
		else if (state == S_INIT_REF || state == S_INIT_REF_NOP ||
				 state == S_IDLE_REF || state == S_IDLE_REF_NOP)
			time_tRC_cnt <= time_tRC_cnt + 4'd1;
end

assign time_is_tRC = (time_tRC_cnt == T_RC-1);

//  time_tMRD_cnt (mode set)
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		time_tMRD_cnt <= 3'd0;
	else
		if (time_is_tMRD)
			time_tMRD_cnt <= 3'd0;
		else if (state == S_MRS || state == S_MRS_NOP)
			time_tMRD_cnt <= time_tMRD_cnt + 3'd1;
end

assign time_is_tMRD = (time_tMRD_cnt == T_MRD-1);

//  time_tRCD_cnt (active)
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		time_tRCD_cnt <= 3'd0;
	else
		if (time_is_tRCD)
			time_tRCD_cnt <= 3'd0;
		else if (state == S_WR_ACT || state == S_WR_ACT_NOP ||
				 state == S_RD_ACT || state == S_RD_ACT_NOP)
			time_tRCD_cnt <= time_tRCD_cnt + 3'd1;
end

assign time_is_tRCD = (time_tRCD_cnt == T_RCD-1);

// wr_bst_len_cnt
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		wr_bst_len_cnt <= ZERO[APP_BURST_WIDTH-1:0];
	else
		if (wr_cnt_is_len)
			wr_bst_len_cnt <= ZERO[APP_BURST_WIDTH-1:0];
		else if (state == S_WR_COL)
			wr_bst_len_cnt <= wr_bst_len_cnt + ONE[APP_BURST_WIDTH-1:0];
end
//   rd_bst_len_cnt
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		rd_bst_len_cnt <= ZERO[APP_BURST_WIDTH-1:0];
	else
		if (rd_cnt_is_len)
			rd_bst_len_cnt <= ZERO[APP_BURST_WIDTH-1:0];
		else if (state == S_RD_COL)
			rd_bst_len_cnt <= rd_bst_len_cnt + ONE[APP_BURST_WIDTH-1:0];
end


always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		wr_bst_acu_len <= ZERO[APP_BURST_WIDTH-1:0];
	else
		if (state == S_WR_ACT)
			wr_bst_acu_len <= wr_burst_len - ONE[APP_BURST_WIDTH-1:0];
end

always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		rd_bst_acu_len <= ZERO[APP_BURST_WIDTH-1:0];
	else
		if (state == S_RD_ACT)
			rd_bst_acu_len <= rd_burst_len - ONE[APP_BURST_WIDTH-1:0];
end

// wr_cnt_is_len_latch
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		wr_cnt_is_len_latch <= 0;
	else
		if (state == S_PRE_NOP & wr_cnt_is_len_latch)
			wr_cnt_is_len_latch <= 0;
		else if (wr_cnt_is_len)
			wr_cnt_is_len_latch <= 1;
end
// rd_cnt_is_len_latch
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		rd_cnt_is_len_latch <= 0;
	else
		if (state == S_PRE_NOP & rd_cnt_is_len_latch)
			rd_cnt_is_len_latch <= 0;
		else if (rd_cnt_is_len)
			rd_cnt_is_len_latch <= 1;
end
/////////////////////////////////////////////////////////////////
//  sdr_col_addr
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		sdr_col_addr <= 0;
	else
		if (wr_burst_req && (state == S_WR_ACT))
			sdr_col_addr <= wr_burst_addr[SDR_COL_WIDTH-1 : 0];
		else if (rd_burst_req && (state == S_RD_ACT))
			sdr_col_addr <= rd_burst_addr[SDR_COL_WIDTH-1 : 0];
		else if (state == S_WR_COL | state == S_RD_COL)
			sdr_col_addr <= sdr_col_addr + ONE[SDR_COL_WIDTH-1 :0];
end

//  page_end
assign page_end = (sdr_col_addr == {SDR_COL_WIDTH{1'b1}});

//  sdr_col_addr_d
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1) 
	begin
			sdr_col_addr_d  <= 0;
			sdr_col_addr_d2 <= 0;
	end
	else 
	begin
			sdr_col_addr_d  <= sdr_col_addr;
			sdr_col_addr_d2 <= sdr_col_addr_d;
	end
end

//  sdr_row_addr
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		sdr_row_addr <= 0;
	else
		if (wr_burst_req & (state == S_WR_ACT))
			sdr_row_addr <= wr_burst_addr[APP_ADDR_WIDTH-1 : SDR_COL_WIDTH ];
		else if (rd_burst_req &(state == S_RD_ACT) )
			sdr_row_addr <= rd_burst_addr[APP_ADDR_WIDTH-1 : SDR_COL_WIDTH ];
		//else if (page_end)
		//  sdr_row_addr <= sdr_row_addr + 1;
end

//   sdr_ba
assign sdr_ba = sdr_row_addr[SDR_BA_WIDTH-1 : 0];

//   sdr_a
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		sdr_a <= 0;
	else
		case ({state_d2 == S_MRS, state_d2 == S_WR_COL | state_d2 == S_RD_COL})
			2'b10 : sdr_a <= mode_reg[SDR_ROW_WIDTH-1 : 0];
			2'b01 : sdr_a <= {{(SDR_ROW_WIDTH-SDR_COL_WIDTH){1'b0}}, sdr_col_addr_d2};
			2'b00 : sdr_a <= sdr_row_addr[SDR_ROW_WIDTH + 1 : SDR_BA_WIDTH];
			default : sdr_a <= 0;
		endcase
end

//   sdr_ras_n
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		sdr_ras_n <= 1;
	else
		if (state_d2 == S_MRS | state_d2 == S_WR_ACT | state_d2 == S_RD_ACT |
			state_d2 == S_INIT_PRE | state_d2 == S_PRE | state_d2 == S_INIT_REF |
			state_d2 == S_IDLE_REF)
			sdr_ras_n <= 0;
		else
			sdr_ras_n <= 1;
end

//   sdr_cas_n
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		sdr_cas_n <= 1;
	else
		if (state_d2 == S_MRS | state_d2 == S_WR_COL | state_d2 == S_RD_COL |
			state_d2 == S_INIT_REF | state_d2 == S_IDLE_REF)
			sdr_cas_n <= 0;
		else
			sdr_cas_n <= 1;
end

//   sdr_we_n
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		sdr_we_n <= 1;
	else
		if (state_d2 == S_MRS | state_d2 == S_WR_COL | state_d2 == S_INIT_PRE |
			state_d2 == S_PRE)
			sdr_we_n <= 0;
		else
			sdr_we_n <= 1;
end

//   sdr_a10
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		sdr_a10 <= 1'b0;
	else
		if (state_d2 == S_WR_COL | state_d2 == S_RD_COL)
			sdr_a10 <= 1'b0;
		else if (state_d2 == S_INIT_PRE | state_d2 == S_PRE)
			sdr_a10 <= 1'b1;
		else if (state_d2 == S_MRS)
			sdr_a10 <= mode_reg[10];
		else
			sdr_a10 <= sdr_row_addr[12];
end

//  sdr_dq
//assign sdr_dq     = wr_burst_data;
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		sdr_dq <= 'b0;
	else
		sdr_dq  <= wr_burst_data;
end

//   wr_burst_data_req
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		wr_data_rq <= 1'b0;
	else
		if (state == S_WR_COL)
			wr_data_rq <= 1'b1;
		else
			wr_data_rq <= 1'b0;
end

//  wr_burst_data_req
assign wr_burst_data_req = wr_data_rq;
//   delays
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1) 
	begin
		sdr_wr_en_d  <= 1'b0;
		sdr_rd_en_d  <= 1'b0;
		sdr_rd_en_d2 <= 1'b0;
		sdr_rd_en_d3 <= 1'b0;
		sdr_rd_en_d4 <= 1'b0;
	end
	else 
	begin
		sdr_wr_en_d  <= state_d2 == S_WR_COL;
		sdr_rd_en_d  <= state_d2 == S_RD_COL;
		sdr_rd_en_d2 <= sdr_rd_en_d;
		sdr_rd_en_d3 <= sdr_rd_en_d2;
		sdr_rd_en_d4 <= sdr_rd_en_d3;
	end
end

//   rd_burst_data_valid
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		rd_data_en <= 1'b0;
	else
		case (CASn)
			2 :
				if (sdr_rd_en_d3)
					rd_data_en <= 1'b1;
				else
					rd_data_en <= 1'b0;
			3 :
				if (sdr_rd_en_d4)
					rd_data_en <= 1'b1;
				else
					rd_data_en <= 1'b0;
			default :
				rd_data_en <= 1'b0;
		endcase
end

//  rd_burst_data_valid
assign rd_burst_data_valid = rd_data_en;


//   rd_data
always @(posedge clk or posedge rst)
begin
		if(rst == 1'b1)
			rd_data <= 1'b0;
		else
			rd_data <= sdram_dq;
end

//  rd_burst_data
assign rd_burst_data = rd_data;

//  wr_data_rq_o_d
always @(posedge clk or posedge rst)
begin
		if(rst == 1'b1)
			wr_data_rq_o_d <= 1'b0;
		else
			wr_data_rq_o_d <= wr_burst_data_req;
end

//  wr_data_end_latch
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		wr_data_end_latch <= 1'b0;
	else
		if (wr_burst_finish)
			wr_data_end_latch <= 1'b0;
		else if (wr_cnt_is_len & wr_rd_i_latch)
			wr_data_end_latch <= 1'b1;
end

//  wr_data_end
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		wr_data_end <= 1'b0;
	else
		wr_data_end <= wr_data_end_latch & ~wr_burst_data_req & wr_data_rq_o_d;
end

//  wr_burst_finish
assign wr_burst_finish = wr_data_end;

//  rd_data_en_o_d
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		rd_data_en_o_d <= 1'b0;
	else
		rd_data_en_o_d <= rd_burst_data_valid;
end

//  rd_data_end_latch
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		rd_data_end_latch <= 1'b0;
	else
		if (rd_burst_finish)
			rd_data_end_latch <= 1'b0;
		else if (rd_cnt_is_len & rd_rq_i_latch)
			rd_data_end_latch <= 1'b1;
end

//  rd_data_end
always @(posedge clk or posedge rst)
begin
	if(rst == 1'b1)
		rd_data_end <= 1'b0;
	else
		rd_data_end <= rd_data_end_latch & ~rd_burst_data_valid & rd_data_en_o_d;
end

//  rd_burst_finish
assign rd_burst_finish = rd_data_end;

//wr rd RR check
//last_is_write
	always @ (posedge rst or posedge clk) begin                        
	  if(rst == 1'b1) begin 
		 last_is_write <= 1'b0;                                     
	  end                                                               
	  else begin                                                        
		 if(state == S_WR_ACT)
			last_is_write <= 1'b1;
		 else if(state == S_RD_ACT)
			last_is_write <= 1'b0;
	  end                                                               
   end
endmodule
