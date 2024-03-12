/*
 * Copyright 2019 International Business Machines
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
`timescale 1ns/1ps

module axi_lite_slave #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32
)(
                      input                            clk              ,
                      input                            rst_n            ,

                      //---- AXI Lite bus----
                        // AXI write address channel
                      output reg                       s_axi_awready    ,
                      input      [ADDR_WIDTH - 1:0]    s_axi_awaddr     ,
                      input                            s_axi_awvalid    ,
                        // axi write data channel
                      output reg                       s_axi_wready     ,
                      input      [DATA_WIDTH - 1:0]    s_axi_wdata      ,
                      input      [(DATA_WIDTH/8) - 1:0]s_axi_wstrb      ,
                      input                            s_axi_wvalid     ,
                        // AXI response channel
                      output     [01:0]                s_axi_bresp      ,
                      output reg                       s_axi_bvalid     ,
                      input                            s_axi_bready     ,
                        // AXI read address channel
                      output reg                       s_axi_arready    ,
                      input                            s_axi_arvalid    ,
                      input      [ADDR_WIDTH - 1:0]    s_axi_araddr     ,
                        // AXI read data channel
                      output reg [DATA_WIDTH - 1:0]    s_axi_rdata      ,
                      output     [01:0]                s_axi_rresp      ,
                      input                            s_axi_rready     ,
                      output reg                       s_axi_rvalid     ,

                      //---- local control ----
                      output wire                      engine_start_pulse,
                      output wire                      wrap_mode        , // 1 for wrap, 0 for incr
                      output wire [03:0]               wrap_len         ,
                      output     [63:0]                source_address   ,
                      output     [63:0]                target_address   ,
                      output     [31:0]                rd_init_data     ,
                      output     [31:0]                wr_init_data     ,
                      output     [31:0]                rd_pattern       ,
                      output     [31:0]                rd_number        ,
                      output     [31:0]                wr_pattern       ,
                      output     [31:0]                wr_number        ,

                      //---- local status ----
                      input                            rd_done_pulse    ,
                      input                            wr_done_pulse    ,
                      input      [01:0]                rd_error         , //bit 0 means response error, bit 1 means data error
                      input      [63:0]                rd_error_info    ,
                      input                            wr_error         , //write response error
                      input                            tt_arvalid       , //arvalid & arready
                      input                            tt_rlast         , //rlast & rvalid & rready
                      input                            tt_awvalid       , //awvalid & awready
                      input                            tt_bvalid        , //bvalid & bready

                      input      [4:0]                 tt_arid       ,
                      input      [4:0]                 tt_awid       ,
                      input      [4:0]                 tt_rid       ,
                      input      [4:0]                 tt_bid       ,

                      //---- snap status ----
                      input      [31:0]                i_action_type    ,
                      input      [31:0]                i_action_version ,
                      output     [31:0]                o_snap_context
                      );
            

//---- declarations ----
 wire[31:0] REG_snap_control_rd;
 wire[31:0] REG_user_status;  /*RO*/

 wire[31:0] regw_snap_status;
 wire[31:0] regw_snap_int_enable;
 wire[31:0] regw_snap_context;

 wire[31:0] regw_control;
 wire[31:0] regw_mode;
 wire[31:0] regw_init_rdata;
 wire[31:0] regw_init_wdata;
 wire[31:0] regw_rd_pattern;
 wire[31:0] regw_rd_number;
 wire[31:0] regw_wr_pattern;
 wire[31:0] regw_wr_number;
 wire[63:0] regw_source_address;
 wire[63:0] regw_target_address;
 wire [31:0] regw_soft_reset;

 reg [31:0] write_address;
 wire[31:0] wr_mask;
 reg [31:0] current_cycle_L;
 reg [15:0] current_cycle_H;

 wire       soft_reset;
 

 ///////////////////////////////////////////////////
 //***********************************************//
 //>                REGISTERS                    <//
 //***********************************************//
 //                                               //
 /**/   reg [31:0] REG_snap_control          ;  /**/
 /**/   reg [31:0] REG_snap_int_enable       ;  /**/
 /**/   reg [31:0] REG_snap_context          ;  /**/
 /*-----------------------------------------------*/
 /**/   reg [63:0] REG_error_info            ;  /*RO*/

 /**/   reg [31:0] REG_user_control          ;  /*RW*/
 /**/   reg [31:0] REG_user_mode             ;  /*RW*/
 /**/   reg [31:0] REG_init_rdata            ;  /*RW*/
 /**/   reg [31:0] REG_init_wdata            ;  /*RW*/
 /**/   wire [31:0] cyc_tt_rd_cmd            ;  /*RO, from RAM data_out*/
 /**/   wire [31:0] cyc_tt_rd_rsp            ;  /*RO, from RAM data_out*/
 /**/   wire [31:0] cyc_tt_wr_cmd            ;  /*RO, from RAM data_out*/
 /**/   wire [31:0] cyc_tt_wr_rsp            ;  /*RO, from RAM data_out*/
 /**/   wire [4:0] dout_arid                 ;  /*RO, from RAM data_out*/
 /**/   wire [4:0] dout_awid                 ;  /*RO, from RAM data_out*/
 /**/   wire [4:0] dout_rid                  ;  /*RO, from RAM data_out*/
 /**/   wire [4:0] dout_bid                  ;  /*RO, from RAM data_out*/

 /**/   reg [31:0] REG_rd_pattern            ;  /*RW*/
 /**/   reg [31:0] REG_rd_number             ;  /*RW*/
 /**/   reg [31:0] REG_wr_pattern            ;  /*RW*/
 /**/   reg [31:0] REG_wr_number             ;  /*RW*/
 /**/   reg [63:0] REG_source_address        ;  /*RW*/
 /**/   reg [63:0] REG_target_address        ;  /*RW*/
 /**/   reg [31:0] REG_soft_reset            ;  /*RW*/
 //                                               //
 //-----------------------------------------------//
 //                                               //
 ///////////////////////////////////////////////////


//---- parameters ----
 // Register addresses arrangement
 parameter ADDR_SNAP_CONTROL        = 32'h00,
           ADDR_SNAP_INT_ENABLE     = 32'h04,
           ADDR_SNAP_ACTION_TYPE    = 32'h10,
           ADDR_SNAP_ACTION_VERSION = 32'h14,
           ADDR_SNAP_CONTEXT        = 32'h20,
           // User defined below
           ADDR_USER_STATUS         = 32'h30,
           ADDR_USER_CONTROL        = 32'h34,
           ADDR_USER_MODE           = 32'h38,
           ADDR_INIT_RDATA          = 32'h3C, //Non-zero init Read Data 
           ADDR_INIT_WDATA          = 32'h40, //Non-zero init Write Data

           //Following four Time Trace RAMs, when read the MMIO port, the RAM
           //address is increased by 1 automatically
           ADDR_TT_RD_CMD           = 32'h44, //Time Trace RAM, when ARVALID is sent
           ADDR_TT_RD_RSP           = 32'h48, //Time Trace RAM, when RLAST is received
           ADDR_TT_WR_CMD           = 32'h4C, //Time Trace RAM, when AWVALID is sent
           ADDR_TT_WR_RSP           = 32'h50, //Time Trace RAM, when BVALID is received

           ADDR_TT_ARID             = 32'h54, //ID Trace RAM, 
           ADDR_TT_AWID             = 32'h58, //ID Trace RAM, 
           ADDR_TT_RID              = 32'h5C, //ID Trace RAM, 
           ADDR_TT_BID              = 32'h60, //ID Trace RAM, 

           ADDR_RD_PATTERN          = 32'h64, //AXI Read pattern
           ADDR_RD_NUMBER           = 32'h68, //how many AXI Read transactions
           ADDR_WR_PATTERN          = 32'h6C, //AXI Write Pattern
           ADDR_WR_NUMBER           = 32'h70, //how many AXI Write trasactions

           ADDR_SOURCE_ADDRESS_L    = 32'h74,
           ADDR_SOURCE_ADDRESS_H    = 32'h78,
           ADDR_TARGET_ADDRESS_L    = 32'h7C,
           ADDR_TARGET_ADDRESS_H    = 32'h80,

           ADDR_ERROR_INFO_L        = 32'h84,
           ADDR_ERROR_INFO_H        = 32'h88,
           ADDR_SOFT_RESET          = 32'h8C;

 

//---- local controlling signals assignments ----
 assign rd_init_data   = REG_init_rdata;
 assign wr_init_data   = REG_init_wdata;
 assign rd_pattern     = REG_rd_pattern;
 assign rd_number      = REG_rd_number;
 assign wr_pattern     = REG_wr_pattern;
 assign wr_number      = REG_wr_number;
 assign source_address = REG_source_address;
 assign target_address = REG_target_address;
 assign o_snap_context = REG_snap_context;
 assign soft_reset     = REG_soft_reset[0];
 assign wrap_mode      = REG_user_mode[0];
 assign wrap_len       = REG_user_mode[11:8];

/***********************************************************************
*                          writing registers                           *
***********************************************************************/

//---- write address capture ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     write_address <= 32'd0;
   else if(s_axi_awvalid & s_axi_awready)
     write_address <= s_axi_awaddr;

//---- write address ready ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_awready <= 1'b0;
   else if(s_axi_awvalid)
     s_axi_awready <= 1'b1;
   else if(s_axi_wvalid & s_axi_wready)
     s_axi_awready <= 1'b0;

//---- write data ready ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_wready <= 1'b0;
   else if(s_axi_awvalid & s_axi_awready)
     s_axi_wready <= 1'b1;
   else if(s_axi_wvalid)
     s_axi_wready <= 1'b0;

//---- handle write data strobe ----
 assign wr_mask = {{8{s_axi_wstrb[3]}},{8{s_axi_wstrb[2]}},{8{s_axi_wstrb[1]}},{8{s_axi_wstrb[0]}}};

 assign regw_snap_status     = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_snap_control)};
 assign regw_snap_int_enable = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_snap_int_enable)};
 assign regw_snap_context    = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_snap_context)};
 assign regw_control         = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_user_control)};
 assign regw_mode            = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_user_mode)};
 assign regw_init_rdata      = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_init_rdata)};
 assign regw_init_wdata      = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_init_wdata)};
 assign regw_rd_pattern      = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_rd_pattern)};
 assign regw_rd_number       = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_rd_number)};
 assign regw_wr_pattern      = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_wr_pattern)};
 assign regw_wr_number       = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_wr_number)};
 assign regw_source_address  = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_source_address)};
 assign regw_target_address  = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_target_address)};
 assign regw_soft_reset      = {(s_axi_wdata&wr_mask)|(~wr_mask&REG_soft_reset)};

//---- write registers ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       REG_snap_control    <= 32'd0;
       REG_snap_int_enable <= 32'd0;
       REG_snap_context    <= 32'd0;
       REG_user_control    <= 32'd0;
       REG_user_mode       <= 32'd0;
       REG_init_rdata      <= 32'd0;
       REG_init_wdata      <= 32'd0;
       REG_rd_pattern      <= 32'd0;
       REG_rd_number       <= 32'd0;
       REG_wr_pattern      <= 32'd0;
       REG_wr_number       <= 32'd0;
       REG_source_address  <= 64'd0;
       REG_target_address  <= 64'd0;
       REG_soft_reset      <= 32'd0;
     end
    else if(soft_reset)
    begin
       REG_snap_control    <= 32'd0;
       REG_snap_int_enable <= 32'd0;
       REG_snap_context    <= 32'd0;
       REG_user_control    <= 32'd0;
       REG_user_mode       <= 32'd0;
       REG_init_rdata      <= 32'd0;
       REG_init_wdata      <= 32'd0;
       REG_rd_pattern      <= 32'd0;
       REG_rd_number       <= 32'd0;
       REG_wr_pattern      <= 32'd0;
       REG_wr_number       <= 32'd0;
       REG_source_address  <= 64'd0;
       REG_target_address  <= 64'd0;
       REG_soft_reset      <= 32'd0;
    end
   else if(s_axi_wvalid & s_axi_wready)
     case(write_address)
       ADDR_SNAP_CONTROL    : REG_snap_control    <= regw_snap_status;
       ADDR_SNAP_INT_ENABLE : REG_snap_int_enable <= regw_snap_int_enable;
       ADDR_SNAP_CONTEXT    : REG_snap_context    <= regw_snap_context;

       ADDR_USER_CONTROL    : REG_user_control    <= regw_control;
       ADDR_USER_MODE       : REG_user_mode       <= regw_mode;
       ADDR_INIT_RDATA      : REG_init_rdata      <= regw_init_rdata;
       ADDR_INIT_WDATA      : REG_init_wdata      <= regw_init_wdata;
       ADDR_RD_PATTERN      : REG_rd_pattern      <= regw_rd_pattern;
       ADDR_RD_NUMBER       : REG_rd_number       <= regw_rd_number;
       ADDR_WR_PATTERN      : REG_wr_pattern      <= regw_wr_pattern;
       ADDR_WR_NUMBER       : REG_wr_number       <= regw_wr_number;


       ADDR_SOURCE_ADDRESS_H : REG_source_address  <= {regw_source_address,REG_source_address[31:00]};
       ADDR_SOURCE_ADDRESS_L : REG_source_address  <= {REG_source_address[63:32],regw_source_address};

       ADDR_TARGET_ADDRESS_H : REG_target_address  <= {regw_target_address,REG_target_address[31:00]};
       ADDR_TARGET_ADDRESS_L : REG_target_address  <= {REG_target_address[63:32],regw_target_address};
       ADDR_SOFT_RESET       : REG_soft_reset      <= regw_soft_reset;


       default :;
     endcase

/***********************************************************************
*                          Control Flow                                *
***********************************************************************/
// The build-in snap_action_start() and snap_action_completed functions 
// sets REG_snap_control bit "start" and reads bit "idle"
// The other things are managed by REG_user_control (user defined control register)
// Flow:
// ---------------------------------------------------------------------------------------------
// Software                                  Hardware REG                               Hardware signal & action
// ---------------------------------------------------------------------------------------------
// snap_action_start()                      |                                          |
//                                          | SNAP_CONTROL[snap_start]=1               |
// mmio_write(USER_CONTROL[address...])     |                                          | snap_start_pulse
// mmio_write(USER_CONTROL[pattern...])     |                                          | Spend 4096 cycles to clear tt_RAM
// mmio_write(USER_CONTROL[number...])      |                                          |
// wait(USER_CONTROL[engine_ready])==1      |                                          |
//                                          | USER_STATUS[engine_ready]=1              |
// mmio_write(USER_CONTROL[engine_start])=1 |                                          |
//                                          | CONTROL[engine_start]=1                  |
//                                          |                                          | engine_start_pulse
//                                          |                                          | Run Read requests and Write requests
//                                          |                                          | .
//                                          |                                          | .
//                                          |                                          | .
//                                          |                                          | rd_done or wr_done or rd_error
//                                          | USER_STATUS[rd_done/wr_done/rd_error]= 1 |
// wait(USER_STATUS)                        |                                          |
// Send 4096 MMIO reads for TT ...          |                                          |
// mmio_write(USER_CONTROL[finish_dump])=1  |                                          |
//                                          | USER_CONTROL[finish_dump]=1              |
//                                          | SNAP_CONTROL[snap_idle]=1                |
// snap_action_completed()                  |                                          |
//

wire snap_start_pulse;

reg snap_start_q;
reg snap_idle_q;
reg engine_start_q;
reg engine_ready_q;
reg [11:0] tt_counter_q;


reg [01:0] rd_error_q;
reg        wr_error_q;
reg rd_done_q;
reg wr_done_q;
wire both_done;


always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        snap_start_q <= 0;
        engine_start_q <= 0;
    end
    else if(soft_reset) begin
        snap_start_q <= 0;
        engine_start_q <= 0;
    end
    else begin
        snap_start_q <= REG_snap_control[0];
        engine_start_q <= REG_user_control[0];
    end
end

assign snap_start_pulse = REG_snap_control[0] & ~snap_start_q;
assign engine_start_pulse = REG_user_control[0] & ~engine_start_q;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
       snap_idle_q <= 0;
    end
    else if(soft_reset) begin
       snap_idle_q <= 0;
    end
    else if (REG_user_control[1]) begin   //finish_dump
       snap_idle_q <= 1;
    end
end
       
always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        tt_counter_q <= 12'hFFF;
        engine_ready_q <= 0;
    end
    else if(soft_reset) begin
        tt_counter_q <= 12'hFFF;
        engine_ready_q <= 0;
    end
    else if (REG_snap_control[0]) begin
        if (tt_counter_q != 0)
            tt_counter_q <= tt_counter_q - 1;
        else 
            engine_ready_q <= 1;
    end
end

always@(posedge clk or negedge rst_n)
   if (~rst_n) begin
     REG_error_info  <= 64'd0;
   end
   else if(rd_error[1] && (!rd_error_q[1])) begin
     REG_error_info  <= rd_error_info;
   end

always@(posedge clk or negedge rst_n)
   if (~rst_n) begin
     rd_error_q      <= 0;
   end
   else if(soft_reset) begin
     rd_error_q      <= 0;
   end
   else if(|rd_error) begin
     rd_error_q      <= rd_error;
   end

always@(posedge clk or negedge rst_n)
   if (~rst_n) begin
     wr_error_q      <= 0;
   end
   else if(soft_reset) begin
     wr_error_q      <= 0;
   end
   else if(wr_error) begin
     wr_error_q      <= 1;
   end

always@(posedge clk or negedge rst_n)
   if (~rst_n)
     rd_done_q <= 0;
   else if(soft_reset)
     rd_done_q <= 0;
   else if (rd_done_pulse || (engine_start_pulse && (rd_number == 0)))
     rd_done_q <= 1;

 always@(posedge clk or negedge rst_n)
   if (~rst_n)
     wr_done_q <= 0;
   else if(soft_reset)
     wr_done_q <= 0;
   else if (wr_done_pulse || (engine_start_pulse && (wr_number == 0)))
     wr_done_q <= 1;

assign both_done           = rd_done_q & wr_done_q;
assign REG_user_status     = {current_cycle_H, 10'd0, engine_ready_q, rd_error_q, wr_error_q, rd_done_q, wr_done_q};
assign REG_snap_control_rd = {REG_snap_control[31:4], 1'b1, snap_idle_q, 1'b0, snap_start_q};
//Address: 0x000
//  31..8  RO: Reserved
//      7  RW: auto restart
//   6..4  RO: Reserved
//      3  RO: Ready     (not used)
//      2  RO: Idle      (in use)
//      1  RC: Done      (not used)
//      0  RW: Start     (in use)
/***********************************************************************
*                       reading registers                              *
***********************************************************************/


//---- read registers ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_rdata <= 32'd0;
   else if(s_axi_arvalid & s_axi_arready)
     case(s_axi_araddr)
       ADDR_SNAP_CONTROL        : s_axi_rdata <= REG_snap_control_rd;
       ADDR_SNAP_INT_ENABLE     : s_axi_rdata <= REG_snap_int_enable[31 : 0];
       ADDR_SNAP_ACTION_TYPE    : s_axi_rdata <= i_action_type;
       ADDR_SNAP_ACTION_VERSION : s_axi_rdata <= i_action_version;
       ADDR_SNAP_CONTEXT        : s_axi_rdata <= REG_snap_context[31    : 0];

       ADDR_USER_STATUS         : s_axi_rdata <= REG_user_status;
       ADDR_USER_CONTROL        : s_axi_rdata <= REG_user_control;
       ADDR_USER_MODE           : s_axi_rdata <= REG_user_mode;
       ADDR_INIT_RDATA          : s_axi_rdata <= REG_init_rdata;
       ADDR_INIT_WDATA          : s_axi_rdata <= REG_init_wdata;
       ADDR_TT_RD_CMD           : s_axi_rdata <= cyc_tt_rd_cmd;
       ADDR_TT_RD_RSP           : s_axi_rdata <= cyc_tt_rd_rsp;
       ADDR_TT_WR_CMD           : s_axi_rdata <= cyc_tt_wr_cmd;
       ADDR_TT_WR_RSP           : s_axi_rdata <= cyc_tt_wr_rsp;
       ADDR_TT_ARID             : s_axi_rdata <= {27'd0, dout_arid};
       ADDR_TT_AWID             : s_axi_rdata <= {27'd0, dout_awid};
       ADDR_TT_RID              : s_axi_rdata <= {27'd0, dout_rid};
       ADDR_TT_BID              : s_axi_rdata <= {27'd0, dout_bid};
       ADDR_RD_PATTERN          : s_axi_rdata <= REG_rd_pattern;
       ADDR_RD_NUMBER           : s_axi_rdata <= REG_rd_number;
       ADDR_WR_PATTERN          : s_axi_rdata <= REG_wr_pattern;
       ADDR_WR_NUMBER           : s_axi_rdata <= REG_wr_number;
       ADDR_SOURCE_ADDRESS_L    : s_axi_rdata <= REG_source_address[31  : 0];
       ADDR_SOURCE_ADDRESS_H    : s_axi_rdata <= REG_source_address[63  : 32];
       ADDR_TARGET_ADDRESS_L    : s_axi_rdata <= REG_target_address[31  : 0];
       ADDR_TARGET_ADDRESS_H    : s_axi_rdata <= REG_target_address[63  : 32];
       ADDR_ERROR_INFO_L        : s_axi_rdata <= REG_error_info[31  : 0];
       ADDR_ERROR_INFO_H        : s_axi_rdata <= REG_error_info[63  : 32];
       ADDR_SOFT_RESET          : s_axi_rdata <= REG_soft_reset;
       default                  : s_axi_rdata <= 32'h5a5aa5a5;
     endcase

//---- address ready: deasserts once arvalid is seen; reasserts when current read is done ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_arready <= 1'b1;
   else if(s_axi_arvalid)
     s_axi_arready <= 1'b0;
   else if(s_axi_rvalid & s_axi_rready)
     s_axi_arready <= 1'b1;

//---- data ready: deasserts once rvalid is seen; reasserts when new address has come ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     s_axi_rvalid <= 1'b0;
   else if (s_axi_arvalid & s_axi_arready)
     s_axi_rvalid <= 1'b1;
   else if (s_axi_rready)
     s_axi_rvalid <= 1'b0;




/***********************************************************************
*                        status reporting                              *
***********************************************************************/

//---- axi write response ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n) 
     s_axi_bvalid <= 1'b0;
   else if(s_axi_wvalid & s_axi_wready)
     s_axi_bvalid <= 1'b1;
   else if(s_axi_bready)
     s_axi_bvalid <= 1'b0;

 assign s_axi_bresp = 2'd0;

//---- axi read response ----
 assign s_axi_rresp = 2'd0;


/***********************************************************************
*                        Four time trace RAMs                          *
***********************************************************************/
always@(posedge clk or negedge rst_n)
   if(~rst_n) begin
        current_cycle_L <= 32'd0;
        current_cycle_H <= 16'd0;
   end
   else if(soft_reset) begin
        current_cycle_L <= 32'd0;
        current_cycle_H <= 16'd0;
   end
   else if (REG_user_control[0] & ~both_done) begin //Only count after engine_start and before both_done
        if (current_cycle_L == 32'hFFFFFFFF) begin
            current_cycle_H <= current_cycle_H + 1;
            current_cycle_L <= 32'd0;
        end
        else
            current_cycle_L <= current_cycle_L + 1;
   end

//Generate RAM address
//wr_done_pulse and rd_done_pulse are 1-cycle pulses. They are Used to reset the RAM address. 
reg [11:0] tt_addr_rd_cmd;
reg [11:0] tt_addr_rd_rsp;
reg [11:0] tt_addr_wr_cmd;
reg [11:0] tt_addr_wr_rsp;
wire clear_RAM;

//We spend 4096 cycles to clear the RAMs. At this moment data_in
//(current_cycle_L) is zero.
assign clear_RAM = REG_snap_control[0] & ~engine_ready_q;

always@(posedge clk or negedge rst_n)
    if(~rst_n)
        tt_addr_rd_cmd <= 0;
    else if(soft_reset)
        tt_addr_rd_cmd <= 0;
    else if(rd_done_pulse || (|rd_error))
        tt_addr_rd_cmd <= 0;
    else if (tt_arvalid || //Transactions write RAM, repeatedly flush the old data
             clear_RAM  || //Clear RAM in the beginning
            ((s_axi_arvalid & s_axi_arready) && (s_axi_araddr == ADDR_TT_RD_CMD))) //MMIO read tt RAM
        tt_addr_rd_cmd <= tt_addr_rd_cmd + 1;

always@(posedge clk or negedge rst_n)
    if(~rst_n)
        tt_addr_rd_rsp <= 0;
    else if(soft_reset)
        tt_addr_rd_rsp <= 0;
    else if(rd_done_pulse || (|rd_error) )
        tt_addr_rd_rsp <= 0;
    else if (tt_rlast || //Transactions write RAM, repeatedly flush the old data
             clear_RAM  || //Clear RAM in the beginning
            ((s_axi_arvalid & s_axi_arready) && (s_axi_araddr == ADDR_TT_RD_RSP))) //MMIO read tt RAM
        tt_addr_rd_rsp <= tt_addr_rd_rsp + 1;

always@(posedge clk or negedge rst_n)
    if(~rst_n)
        tt_addr_wr_cmd <= 0;
    else if(soft_reset)
        tt_addr_wr_cmd <= 0;
    else if(wr_done_pulse || wr_error)
        tt_addr_wr_cmd <= 0;
    else if (tt_awvalid || //Transactions write RAM, repeatedly flush the old data
             clear_RAM  || //Clear RAM in the beginning
            ((s_axi_arvalid & s_axi_arready) && (s_axi_araddr == ADDR_TT_WR_CMD))) //MMIO read tt RAM
        tt_addr_wr_cmd <= tt_addr_wr_cmd + 1;

always@(posedge clk or negedge rst_n)
    if(~rst_n)
        tt_addr_wr_rsp <= 0;
    else if(soft_reset)
        tt_addr_wr_rsp <= 0;
    else if(wr_done_pulse || wr_error)
        tt_addr_wr_rsp <= 0;
    else if (tt_bvalid || //Transactions write RAM, repeatedly flush the old data
             clear_RAM  || //Clear RAM in the beginning
            ((s_axi_arvalid & s_axi_arready) && (s_axi_araddr == ADDR_TT_WR_RSP))) //MMIO read tt RAM
        tt_addr_wr_rsp <= tt_addr_wr_rsp + 1;




ram_single_port #(.DATA_WIDTH(37), .ADDR_WIDTH(12)) RAM_tt_rd_cmd(
                .clk      ( clk                        ) ,
                .we       ( tt_arvalid || clear_RAM    ) ,
                .addr     ( tt_addr_rd_cmd             ) ,
                .data_in  ( {tt_arid,current_cycle_L}  ) ,
                .data_out ( {dout_arid, cyc_tt_rd_cmd} )
                );
ram_single_port #(.DATA_WIDTH(37), .ADDR_WIDTH(12)) RAM_tt_rd_rsp(
                .clk      ( clk                        ) ,
                .we       ( tt_rlast  || clear_RAM     ) ,
                .addr     ( tt_addr_rd_rsp             ) ,
                .data_in  ( {tt_rid,current_cycle_L}  ) ,
                .data_out ( {dout_rid, cyc_tt_rd_rsp} )
                );

ram_single_port #(.DATA_WIDTH(37), .ADDR_WIDTH(12)) RAM_tt_wr_cmd(
                .clk      ( clk                        ) ,
                .we       ( tt_awvalid || clear_RAM    ) ,
                .addr     ( tt_addr_wr_cmd             ) ,
                .data_in  ( {tt_awid, current_cycle_L}  ) ,
                .data_out ( {dout_awid, cyc_tt_wr_cmd } )
                );
ram_single_port #(.DATA_WIDTH(37), .ADDR_WIDTH(12)) RAM_tt_wr_rsp(
                .clk      ( clk                       ) ,
                .we       ( tt_bvalid  || clear_RAM   ) ,
                .addr     ( tt_addr_wr_rsp            ) ,
                .data_in  ( {tt_bid, current_cycle_L} ) ,
                .data_out ( {dout_bid, cyc_tt_wr_rsp} )
                );
endmodule

