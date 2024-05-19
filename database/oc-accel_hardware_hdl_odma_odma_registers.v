// This program was cloned from: https://github.com/OpenCAPI/oc-accel
// License: Apache License 2.0

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

`include "odma_defines.v"

module odma_registers #(
    parameter DATA_WIDTH = 32,
    parameter ADDR_WIDTH = 32
)
(
    input                           clk,
    input                           rst_n,
    //----- Host AXI lite slave interface -----
    input                           h_s_axi_arvalid,        //AXI read address valid
    input  [ADDR_WIDTH-1 : 0]       h_s_axi_araddr,         //AXI read address
    output reg                      h_s_axi_arready,        //AXI read address ready
    output                          h_s_axi_rvalid,         //AXI read valid
    output [DATA_WIDTH-1 : 0 ]      h_s_axi_rdata,          //AXI read data
    output [1 : 0 ]                 h_s_axi_rresp,          //AXI read response
    input                           h_s_axi_rready,         //AXI read ready
    input                           h_s_axi_awvalid,        //AXI write address valid
    input  [ADDR_WIDTH-1 : 0]       h_s_axi_awaddr,         //AXI write address
    output reg                      h_s_axi_awready,        //AXI write address ready
    input                           h_s_axi_wvalid,         //AXI write valid
    input  [DATA_WIDTH-1 : 0 ]      h_s_axi_wdata,          //AXI write data
    input  [(DATA_WIDTH/8)-1 : 0 ]  h_s_axi_wstrb,          //AXI write strobes
    output reg                      h_s_axi_wready,         //AXI write ready
    output                          h_s_axi_bvalid,         //AXI write resp valid
    output [1 : 0 ]                 h_s_axi_bresp,          //AXI write resp response
    input                           h_s_axi_bready,         //AXI write resp ready
    //----- Action AXI lite slave interface -----
    input                           a_s_axi_arvalid,        //AXI read address valid
    input  [ADDR_WIDTH-1 : 0]       a_s_axi_araddr,         //AXI read address
    output                          a_s_axi_arready,        //AXI read address ready
    output                          a_s_axi_rvalid,         //AXI read valid
    output [DATA_WIDTH-1 : 0 ]      a_s_axi_rdata,          //AXI read data
    output [1 : 0 ]                 a_s_axi_rresp,          //AXI read response
    input                           a_s_axi_rready,         //AXI read ready
    input                           a_s_axi_awvalid,        //AXI write address valid
    input  [ADDR_WIDTH-1 : 0]       a_s_axi_awaddr,         //AXI write address
    output                          a_s_axi_awready,        //AXI write address ready
    input                           a_s_axi_wvalid,         //AXI write valid
    input  [DATA_WIDTH-1 : 0 ]      a_s_axi_wdata,          //AXI write data
    input  [(DATA_WIDTH/8)-1 : 0 ]  a_s_axi_wstrb,          //AXI write strobes
    output                          a_s_axi_wready,         //AXI write ready
    output                          a_s_axi_bvalid,         //AXI write resp valid
    output [1 : 0 ]                 a_s_axi_bresp,          //AXI write resp response
    input                           a_s_axi_bready,         //AXI write resp ready
    //----- Action AXI lite master interface -----
    output                          a_m_axi_arvalid,        //AXI read address valid
    output [ADDR_WIDTH-1 : 0]       a_m_axi_araddr,         //AXI read address
    input                           a_m_axi_arready,        //AXI read address ready
    input                           a_m_axi_rvalid,         //AXI read valid
    input  [DATA_WIDTH-1 : 0 ]      a_m_axi_rdata,          //AXI read data
    input  [1 : 0 ]                 a_m_axi_rresp,          //AXI read response
    output reg                      a_m_axi_rready,         //AXI read ready
    output                          a_m_axi_awvalid,        //AXI write address valid
    output [ADDR_WIDTH-1 : 0]       a_m_axi_awaddr,         //AXI write address
    input                           a_m_axi_awready,        //AXI write address ready
    output                          a_m_axi_wvalid,         //AXI write valid
    output [DATA_WIDTH-1 : 0 ]      a_m_axi_wdata,          //AXI write data
    output [(DATA_WIDTH/8)-1 : 0 ]  a_m_axi_wstrb,          //AXI write strobes
    input                           a_m_axi_wready,         //AXI write ready
    input                           a_m_axi_bvalid,         //AXI write resp valid
    input  [1 : 0 ]                 a_m_axi_bresp,          //AXI write resp response
    output reg                      a_m_axi_bready,         //AXI write resp ready
    //----- dsc engine interface -----
    output                          dsc_ch0_run,            //channel0 start run
    output                          dsc_ch1_run,            //channel1 start run
    output                          dsc_ch2_run,            //channel2 start run
    output                          dsc_ch3_run,            //channel3 start run
    output                          dsc_ch0_h2a,            //1:channel0 is h2a, 0:channel0 is a2h 
    output                          dsc_ch1_h2a,            //1:channel1 is h2a, 0:channel1 is a2h 
    output                          dsc_ch2_h2a,            //1:channel2 is h2a, 0:channel2 is a2h 
    output                          dsc_ch3_h2a,            //1:channel3 is h2a, 0:channel3 is a2h 
    output                          dsc_ch0_axi_st,         //1:channel0 is AXI-ST, 0:channel0 is AXI-MM 
    output                          dsc_ch1_axi_st,         //1:channel1 is AXI-ST, 0:channel1 is AXI-MM
    output                          dsc_ch2_axi_st,         //1:channel2 is AXI-ST, 0:channel2 is AXI-MM
    output                          dsc_ch3_axi_st,         //1:channel3 is AXI-ST, 0:channel3 is AXI-MM
    output [63: 0 ]                 dsc_ch0_dsc_addr,       //channel0 start descriptor addr
    output [63: 0 ]                 dsc_ch1_dsc_addr,       //channel1 start descriptor addr
    output [63: 0 ]                 dsc_ch2_dsc_addr,       //channel2 start descriptor addr
    output [63: 0 ]                 dsc_ch3_dsc_addr,       //channel3 start descriptor addr
    output [5 : 0 ]                 dsc_ch0_dsc_adj,        //channel0 number of adjacent descriptors
    output [5 : 0 ]                 dsc_ch1_dsc_adj,        //channel1 number of adjacent descriptors
    output [5 : 0 ]                 dsc_ch2_dsc_adj,        //channel2 number of adjacent descriptors
    output [5 : 0 ]                 dsc_ch3_dsc_adj,        //channel3 number of adjacent descriptors
    input  [4 : 0 ]                 dsc_ch0_dsc_err,        //channel0 descriptor fetch error
    input  [4 : 0 ]                 dsc_ch1_dsc_err,        //channel1 descriptor fetch error
    input  [4 : 0 ]                 dsc_ch2_dsc_err,        //channel2 descriptor fetch error
    input  [4 : 0 ]                 dsc_ch3_dsc_err,        //channel3 descriptor fetch error
    //----- cmp engine interface -----
    output                          cmp_ch0_poll_wb_en,     //channel0 poll mode writeback enable
    output                          cmp_ch1_poll_wb_en,     //channel1 poll mode writeback enable
    output                          cmp_ch2_poll_wb_en,     //channel2 poll mode writeback enable
    output                          cmp_ch3_poll_wb_en,     //channel3 poll mode writeback enable
    output [63: 0 ]                 cmp_ch0_poll_wb_addr,   //channel0 poll mode writeback addr
    output [63: 0 ]                 cmp_ch1_poll_wb_addr,   //channel1 poll mode writeback addr
    output [63: 0 ]                 cmp_ch2_poll_wb_addr,   //channel2 poll mode writeback addr
    output [63: 0 ]                 cmp_ch3_poll_wb_addr,   //channel3 poll mode writeback addr
    output [31: 0 ]                 cmp_ch0_poll_wb_size,   //channel0 poll mode writeback size
    output [31: 0 ]                 cmp_ch1_poll_wb_size,   //channel1 poll mode writeback size
    output [31: 0 ]                 cmp_ch2_poll_wb_size,   //channel2 poll mode writeback size
    output [31: 0 ]                 cmp_ch3_poll_wb_size,   //channel3 poll mode writeback size
    input  [4 : 0 ]                 cmp_ch0_wr_err,         //channel0 DMA write error
    input  [4 : 0 ]                 cmp_ch1_wr_err,         //channel1 DMA write error
    input  [4 : 0 ]                 cmp_ch2_wr_err,         //channel2 DMA write error
    input  [4 : 0 ]                 cmp_ch3_wr_err,         //channel3 DMA write error
    input  [4 : 0 ]                 cmp_ch0_rd_err,         //channel0 DMA read error
    input  [4 : 0 ]                 cmp_ch1_rd_err,         //channel1 DMA read error
    input  [4 : 0 ]                 cmp_ch2_rd_err,         //channel2 DMA read error
    input  [4 : 0 ]                 cmp_ch3_rd_err,         //channel3 DMA read error
    input  [31: 0 ]                 cmp_ch0_dsc_cnt,        //channel0 completed descriptor count
    input  [31: 0 ]                 cmp_ch1_dsc_cnt,        //channel1 completed descriptor count
    input  [31: 0 ]                 cmp_ch2_dsc_cnt,        //channel2 completed descriptor count
    input  [31: 0 ]                 cmp_ch3_dsc_cnt,        //channel3 completed descriptor count
    output [63: 0 ]                 cmp_ch0_obj_handle,     //channel0 interrupt object handler
    output [63: 0 ]                 cmp_ch1_obj_handle,     //channel1 interrupt object handler
    output [63: 0 ]                 cmp_ch2_obj_handle,     //channel2 interrupt object handler
    output [63: 0 ]                 cmp_ch3_obj_handle      //channel3 interrupt object handler
);
//------------------------------------------------------------------------------
// Internal signals
//------------------------------------------------------------------------------
parameter   STRB_WIDTH  =   DATA_WIDTH/8;
//--- Bypass READ REQ FSM ---
parameter   READ_IDLE   =   4'b0001,
            READ_REQ    =   4'b0010,    //bypass read req to action
            WAIT_RD_RSP =   4'b0100,    //wait action read resp
            SEND_RD_RSP =   4'b1000;    //bypass read resp to host

//--- Bypass WRITE REQ FSM ---
parameter   WRITE_IDLE  =   6'b000001,
            WRITE_REQ   =   6'b000010,   //bypass write req to action
            GET_DATA    =   6'b000100,   //get write data from host
            WRITE_DATA  =   6'b001000,   //bypass write data to action
            WAIT_WR_RSP =   6'b010000,   //wait action write resp
            SEND_WR_RSP =   6'b100000;   //bypass write resp to host

reg  [3:0]                 rd_fsm_cur_state;            //read FSM current state
reg  [3:0]                 rd_fsm_nxt_state;            //read FSM next state
wire                       rd_fsm_state_read_idle;      //read FSM state idle
wire                       rd_fsm_state_read_req;       //read FSM state read req
wire                       rd_fsm_state_wait_rd_rsp;    //read FSM state wait read resp
wire                       rd_fsm_state_send_rd_rsp;    //read FSM state send read resp
reg  [5:0]                 wr_fsm_cur_state;            //write FSM current state
reg  [5:0]                 wr_fsm_nxt_state;            //write FSM next state
wire                       wr_fsm_state_write_idle;     //write FSM state idle
wire                       wr_fsm_state_write_req;      //write FSM state write req
wire                       wr_fsm_state_get_data;       //write FSM state get data
wire                       wr_fsm_state_write_data;     //write FSM state write data
wire                       wr_fsm_state_wait_wr_rsp;    //write FSM state wait read resp
wire                       wr_fsm_state_send_wr_rsp;    //write FSM state send read resp
reg  [ADDR_WIDTH-1: 0]     byp_axi_araddr;              //bypass axi read addr
reg  [DATA_WIDTH-1: 0]     byp_axi_rdata;               //bypass axi read data
reg  [1:0]                 byp_axi_rresp;               //bypass axi read resp
reg  [ADDR_WIDTH-1: 0]     byp_axi_awaddr;              //bypass axi write addr
reg  [DATA_WIDTH-1: 0]     byp_axi_wdata;               //bypass axi write data
reg  [STRB_WIDTH-1: 0]     byp_axi_wstrb;               //bypass axi write strobes
reg  [1:0]                 byp_axi_bresp;               //bypass axi write resp
wire                       byp_rd_req_valid;            //indicate read req bypass valid
wire                       host_rd_req_valid;           //indicate host read odma req valid
wire                       byp_wr_req_valid;            //indicate write req bypass valid
wire                       host_wr_req_valid;           //indicate host write odma req valid
reg                        host_wr_req_valid_l;         //latch for host_wr_req_valid
wire                       is_odma_araddr;              //read addr is odma space
wire                       is_odma_awaddr;              //write addr is odma space
wire                       is_odma_rd_req;              //indicate odma read req
wire                       is_odma_wr_req;              //indicate odma write req
wire                       is_action_rd_req;            //indicate action read req
wire                       is_action_wr_req;            //indicate action write req
reg  [ADDR_WIDTH-1: 0]     host_axi_awaddr;             //host axi write addr
wire [DATA_WIDTH-1: 0]     host_axi_wr_mask;            //host axi write mask
wire [DATA_WIDTH-1: 0]     host_axi_wdata_mask;         //host axi write data after mask
reg                        host_axi_bvalid;             //host write odma resp valid
reg                        host_axi_rvalid;             //host read odma data valid
reg  [DATA_WIDTH-1: 0]     host_axi_rdata;              //host read odma data
reg                        h2a_ch0_run_bit_set;         //indicate h2a channel0 control run bit set
reg                        h2a_ch1_run_bit_set;         //indicate h2a channel1 control run bit set
reg                        h2a_ch2_run_bit_set;         //indicate h2a channel2 control run bit set
reg                        h2a_ch3_run_bit_set;         //indicate h2a channel3 control run bit set
reg                        a2h_ch0_run_bit_set;         //indicate a2h channel0 control run bit set
reg                        a2h_ch1_run_bit_set;         //indicate a2h channel1 control run bit set
reg                        a2h_ch2_run_bit_set;         //indicate a2h channel2 control run bit set
reg                        a2h_ch3_run_bit_set;         //indicate a2h channel3 control run bit set
wire                       h2a_ch0_run;                 //h2a channel0 control register rub bit
wire                       h2a_ch1_run;                 //h2a channel1 control register rub bit
wire                       h2a_ch2_run;                 //h2a channel2 control register rub bit
wire                       h2a_ch3_run;                 //h2a channel3 control register rub bit
wire                       a2h_ch0_run;                 //a2h channel0 control register rub bit
wire                       a2h_ch1_run;                 //a2h channel1 control register rub bit
wire                       a2h_ch2_run;                 //a2h channel2 control register rub bit
wire                       a2h_ch3_run;                 //a2h channel3 control register rub bit

//H2A channel0 registers
reg  [31:0] reg_h2a_ch0_id;
reg  [31:0] reg_h2a_ch0_ctrl;
reg  [31:0] reg_h2a_ch0_stat;
reg  [31:0] reg_h2a_ch0_cmp_dsc_cnt;
reg  [31:0] reg_h2a_ch0_align;
reg  [31:0] reg_h2a_ch0_wb_size;
reg  [31:0] reg_h2a_ch0_wb_addr_lo;
reg  [31:0] reg_h2a_ch0_wb_addr_hi;
reg  [31:0] reg_h2a_ch0_intr_en_mask;
reg  [31:0] reg_h2a_ch0_perf_mon_ctrl;
reg  [31:0] reg_h2a_ch0_perf_cyc_cnt_lo;
reg  [31:0] reg_h2a_ch0_perf_cyc_cnt_hi;
reg  [31:0] reg_h2a_ch0_perf_data_cnt_lo;
reg  [31:0] reg_h2a_ch0_perf_data_cnt_hi;
//H2A channel1 registers
reg  [31:0] reg_h2a_ch1_id;
reg  [31:0] reg_h2a_ch1_ctrl;
reg  [31:0] reg_h2a_ch1_stat;
reg  [31:0] reg_h2a_ch1_cmp_dsc_cnt;
reg  [31:0] reg_h2a_ch1_align;
reg  [31:0] reg_h2a_ch1_wb_size;
reg  [31:0] reg_h2a_ch1_wb_addr_lo;
reg  [31:0] reg_h2a_ch1_wb_addr_hi;
reg  [31:0] reg_h2a_ch1_intr_en_mask;
reg  [31:0] reg_h2a_ch1_perf_mon_ctrl;
reg  [31:0] reg_h2a_ch1_perf_cyc_cnt_lo;
reg  [31:0] reg_h2a_ch1_perf_cyc_cnt_hi;
reg  [31:0] reg_h2a_ch1_perf_data_cnt_lo;
reg  [31:0] reg_h2a_ch1_perf_data_cnt_hi;
//H2A channel2 registers
reg  [31:0] reg_h2a_ch2_id;
reg  [31:0] reg_h2a_ch2_ctrl;
reg  [31:0] reg_h2a_ch2_stat;
reg  [31:0] reg_h2a_ch2_cmp_dsc_cnt;
reg  [31:0] reg_h2a_ch2_align;
reg  [31:0] reg_h2a_ch2_wb_size;
reg  [31:0] reg_h2a_ch2_wb_addr_lo;
reg  [31:0] reg_h2a_ch2_wb_addr_hi;
reg  [31:0] reg_h2a_ch2_intr_en_mask;
reg  [31:0] reg_h2a_ch2_perf_mon_ctrl;
reg  [31:0] reg_h2a_ch2_perf_cyc_cnt_lo;
reg  [31:0] reg_h2a_ch2_perf_cyc_cnt_hi;
reg  [31:0] reg_h2a_ch2_perf_data_cnt_lo;
reg  [31:0] reg_h2a_ch2_perf_data_cnt_hi;
//H2A channel3 registers
reg  [31:0] reg_h2a_ch3_id;
reg  [31:0] reg_h2a_ch3_ctrl;
reg  [31:0] reg_h2a_ch3_stat;
reg  [31:0] reg_h2a_ch3_cmp_dsc_cnt;
reg  [31:0] reg_h2a_ch3_align;
reg  [31:0] reg_h2a_ch3_wb_size;
reg  [31:0] reg_h2a_ch3_wb_addr_lo;
reg  [31:0] reg_h2a_ch3_wb_addr_hi;
reg  [31:0] reg_h2a_ch3_intr_en_mask;
reg  [31:0] reg_h2a_ch3_perf_mon_ctrl;
reg  [31:0] reg_h2a_ch3_perf_cyc_cnt_lo;
reg  [31:0] reg_h2a_ch3_perf_cyc_cnt_hi;
reg  [31:0] reg_h2a_ch3_perf_data_cnt_lo;
reg  [31:0] reg_h2a_ch3_perf_data_cnt_hi;
//A2H channel0 registers
reg  [31:0] reg_a2h_ch0_id;
reg  [31:0] reg_a2h_ch0_ctrl;
reg  [31:0] reg_a2h_ch0_stat;
reg  [31:0] reg_a2h_ch0_cmp_dsc_cnt;
reg  [31:0] reg_a2h_ch0_align;
reg  [31:0] reg_a2h_ch0_wb_size;
reg  [31:0] reg_a2h_ch0_wb_addr_lo;
reg  [31:0] reg_a2h_ch0_wb_addr_hi;
reg  [31:0] reg_a2h_ch0_intr_en_mask;
reg  [31:0] reg_a2h_ch0_perf_mon_ctrl;
reg  [31:0] reg_a2h_ch0_perf_cyc_cnt_lo;
reg  [31:0] reg_a2h_ch0_perf_cyc_cnt_hi;
reg  [31:0] reg_a2h_ch0_perf_data_cnt_lo;
reg  [31:0] reg_a2h_ch0_perf_data_cnt_hi;
//A2H channel1 registers
reg  [31:0] reg_a2h_ch1_id;
reg  [31:0] reg_a2h_ch1_ctrl;
reg  [31:0] reg_a2h_ch1_stat;
reg  [31:0] reg_a2h_ch1_cmp_dsc_cnt;
reg  [31:0] reg_a2h_ch1_align;
reg  [31:0] reg_a2h_ch1_wb_size;
reg  [31:0] reg_a2h_ch1_wb_addr_lo;
reg  [31:0] reg_a2h_ch1_wb_addr_hi;
reg  [31:0] reg_a2h_ch1_intr_en_mask;
reg  [31:0] reg_a2h_ch1_perf_mon_ctrl;
reg  [31:0] reg_a2h_ch1_perf_cyc_cnt_lo;
reg  [31:0] reg_a2h_ch1_perf_cyc_cnt_hi;
reg  [31:0] reg_a2h_ch1_perf_data_cnt_lo;
reg  [31:0] reg_a2h_ch1_perf_data_cnt_hi;
//A2H channel2 registers
reg  [31:0] reg_a2h_ch2_id;
reg  [31:0] reg_a2h_ch2_ctrl;
reg  [31:0] reg_a2h_ch2_stat;
reg  [31:0] reg_a2h_ch2_cmp_dsc_cnt;
reg  [31:0] reg_a2h_ch2_align;
reg  [31:0] reg_a2h_ch2_wb_size;
reg  [31:0] reg_a2h_ch2_wb_addr_lo;
reg  [31:0] reg_a2h_ch2_wb_addr_hi;
reg  [31:0] reg_a2h_ch2_intr_en_mask;
reg  [31:0] reg_a2h_ch2_perf_mon_ctrl;
reg  [31:0] reg_a2h_ch2_perf_cyc_cnt_lo;
reg  [31:0] reg_a2h_ch2_perf_cyc_cnt_hi;
reg  [31:0] reg_a2h_ch2_perf_data_cnt_lo;
reg  [31:0] reg_a2h_ch2_perf_data_cnt_hi;
//A2H channel3 registers
reg  [31:0] reg_a2h_ch3_id;
reg  [31:0] reg_a2h_ch3_ctrl;
reg  [31:0] reg_a2h_ch3_stat;
reg  [31:0] reg_a2h_ch3_cmp_dsc_cnt;
reg  [31:0] reg_a2h_ch3_align;
reg  [31:0] reg_a2h_ch3_wb_size;
reg  [31:0] reg_a2h_ch3_wb_addr_lo;
reg  [31:0] reg_a2h_ch3_wb_addr_hi;
reg  [31:0] reg_a2h_ch3_intr_en_mask;
reg  [31:0] reg_a2h_ch3_perf_mon_ctrl;
reg  [31:0] reg_a2h_ch3_perf_cyc_cnt_lo;
reg  [31:0] reg_a2h_ch3_perf_cyc_cnt_hi;
reg  [31:0] reg_a2h_ch3_perf_data_cnt_lo;
reg  [31:0] reg_a2h_ch3_perf_data_cnt_hi;
//Interrupt block registers
reg  [31:0] reg_intr_id;
reg  [31:0] reg_intr_user_en_mask;
reg  [31:0] reg_intr_chnl_en_mask;
reg  [31:0] reg_intr_user_req;
reg  [31:0] reg_intr_chnl_req;
reg  [31:0] reg_intr_user_pending;
reg  [31:0] reg_intr_chnl_pending;
reg  [31:0] reg_intr_ch0_obj_handle_lo;
reg  [31:0] reg_intr_ch0_obj_handle_hi;
reg  [31:0] reg_intr_ch1_obj_handle_lo;
reg  [31:0] reg_intr_ch1_obj_handle_hi;
reg  [31:0] reg_intr_ch2_obj_handle_lo;
reg  [31:0] reg_intr_ch2_obj_handle_hi;
reg  [31:0] reg_intr_ch3_obj_handle_lo;
reg  [31:0] reg_intr_ch3_obj_handle_hi;
//Config registers
reg  [31:0] reg_cfg_id;
reg  [31:0] reg_cfg_axi_max_wr_size;
reg  [31:0] reg_cfg_axi_max_rd_size;
reg  [31:0] reg_cfg_axi_wr_flush_timeout;
//H2A channel0 DMA registers
reg  [31:0] reg_h2a_ch0_dma_id;
reg  [31:0] reg_h2a_ch0_dma_dsc_addr_lo;
reg  [31:0] reg_h2a_ch0_dma_dsc_addr_hi;
reg  [31:0] reg_h2a_ch0_dma_dsc_adj;
reg  [31:0] reg_h2a_ch0_dma_dsc_credit;
//H2A channel1 DMA registers
reg  [31:0] reg_h2a_ch1_dma_id;
reg  [31:0] reg_h2a_ch1_dma_dsc_addr_lo;
reg  [31:0] reg_h2a_ch1_dma_dsc_addr_hi;
reg  [31:0] reg_h2a_ch1_dma_dsc_adj;
reg  [31:0] reg_h2a_ch1_dma_dsc_credit;
//H2A channel2 DMA registers
reg  [31:0] reg_h2a_ch2_dma_id;
reg  [31:0] reg_h2a_ch2_dma_dsc_addr_lo;
reg  [31:0] reg_h2a_ch2_dma_dsc_addr_hi;
reg  [31:0] reg_h2a_ch2_dma_dsc_adj;
reg  [31:0] reg_h2a_ch2_dma_dsc_credit;
//H2A channel3 DMA registers
reg  [31:0] reg_h2a_ch3_dma_id;
reg  [31:0] reg_h2a_ch3_dma_dsc_addr_lo;
reg  [31:0] reg_h2a_ch3_dma_dsc_addr_hi;
reg  [31:0] reg_h2a_ch3_dma_dsc_adj;
reg  [31:0] reg_h2a_ch3_dma_dsc_credit;
//A2H channel0 DMA registers
reg  [31:0] reg_a2h_ch0_dma_id;
reg  [31:0] reg_a2h_ch0_dma_dsc_addr_lo;
reg  [31:0] reg_a2h_ch0_dma_dsc_addr_hi;
reg  [31:0] reg_a2h_ch0_dma_dsc_adj;
reg  [31:0] reg_a2h_ch0_dma_dsc_credit;
//A2H channel1 DMA registers
reg  [31:0] reg_a2h_ch1_dma_id;
reg  [31:0] reg_a2h_ch1_dma_dsc_addr_lo;
reg  [31:0] reg_a2h_ch1_dma_dsc_addr_hi;
reg  [31:0] reg_a2h_ch1_dma_dsc_adj;
reg  [31:0] reg_a2h_ch1_dma_dsc_credit;
//A2H channel2 DMA registers
reg  [31:0] reg_a2h_ch2_dma_id;
reg  [31:0] reg_a2h_ch2_dma_dsc_addr_lo;
reg  [31:0] reg_a2h_ch2_dma_dsc_addr_hi;
reg  [31:0] reg_a2h_ch2_dma_dsc_adj;
reg  [31:0] reg_a2h_ch2_dma_dsc_credit;
//A2H channel3 DMA registers
reg  [31:0] reg_a2h_ch3_dma_id;
reg  [31:0] reg_a2h_ch3_dma_dsc_addr_lo;
reg  [31:0] reg_a2h_ch3_dma_dsc_addr_hi;
reg  [31:0] reg_a2h_ch3_dma_dsc_adj;
reg  [31:0] reg_a2h_ch3_dma_dsc_credit;
//DMA common registers
reg  [31:0] reg_dma_common_id;
reg  [31:0] reg_dma_common_dsc_ctrl;
reg  [31:0] reg_dma_common_dsc_credit_en;

//------------------------------------------------------------------------------
// Bypass request to action
//------------------------------------------------------------------------------
// Read command
//--------------------------------
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    rd_fsm_cur_state <= READ_IDLE;
  else
    rd_fsm_cur_state <= rd_fsm_nxt_state;
end

// if read req addr is not in ODMA space
// latch this read req and bypass to action
// latch action read resp when valid
// send resp back to host
always@(*) begin
  case(rd_fsm_cur_state)
    READ_IDLE:
      if(byp_rd_req_valid)
        rd_fsm_nxt_state = READ_REQ;
      else
        rd_fsm_nxt_state = READ_IDLE;
    READ_REQ:
      if(a_m_axi_arready)
        rd_fsm_nxt_state = WAIT_RD_RSP;
      else
        rd_fsm_nxt_state = READ_REQ;
    WAIT_RD_RSP:
      if(a_m_axi_rvalid & a_m_axi_rready)
        rd_fsm_nxt_state = SEND_RD_RSP;
      else
        rd_fsm_nxt_state = WAIT_RD_RSP;
    SEND_RD_RSP:
      if(h_s_axi_rready)
        rd_fsm_nxt_state = READ_IDLE;
      else
        rd_fsm_nxt_state = SEND_RD_RSP;
    default:
      rd_fsm_nxt_state = READ_IDLE;
  endcase
end

assign rd_fsm_state_read_idle   = rd_fsm_cur_state[0];
assign rd_fsm_state_read_req    = rd_fsm_cur_state[1];
assign rd_fsm_state_wait_rd_rsp = rd_fsm_cur_state[2];
assign rd_fsm_state_send_rd_rsp = rd_fsm_cur_state[3];

// find read addr is in odma space or not
assign is_odma_araddr    = ((h_s_axi_araddr > `ODMA_MMIO_ADDR_START) | (h_s_axi_araddr == `ODMA_MMIO_ADDR_START)) & (h_s_axi_araddr < `ODMA_MMIO_ADDR_END);
assign is_odma_rd_req    = h_s_axi_arvalid & is_odma_araddr; 
assign is_action_rd_req  = h_s_axi_arvalid & ~is_odma_araddr; 
assign byp_rd_req_valid  = is_action_rd_req & h_s_axi_arready;
assign host_rd_req_valid = is_odma_rd_req & h_s_axi_arready;

// latch bypassing read request/data
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    byp_axi_araddr <= {ADDR_WIDTH{1'b0}};
  else if(byp_rd_req_valid)
    byp_axi_araddr <= h_s_axi_araddr;
  else
    byp_axi_araddr <= byp_axi_araddr;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    byp_axi_rdata <= {DATA_WIDTH{1'b0}};
    byp_axi_rresp <= 2'b0;
  end
  else if(rd_fsm_state_wait_rd_rsp & a_m_axi_rvalid) begin
    byp_axi_rdata <= a_m_axi_rdata;
    byp_axi_rresp <= a_m_axi_rresp;
  end
  else begin
    byp_axi_rdata <= byp_axi_rdata;
    byp_axi_rresp <= byp_axi_rresp;
  end
end

// bypass read addr to action
assign a_m_axi_arvalid = rd_fsm_state_read_req;
assign a_m_axi_araddr  = byp_axi_araddr;

// data ready to action
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    a_m_axi_rready <= 1'b0;
  else if(rd_fsm_state_wait_rd_rsp & a_m_axi_rvalid)
    a_m_axi_rready <= 1'b1;
  else if(a_m_axi_rvalid & a_m_axi_rready)
    a_m_axi_rready <= 1'b0;
  else
    a_m_axi_rready <= a_m_axi_rready;
end

//--------------------------------
// Write command
//--------------------------------
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    wr_fsm_cur_state <= WRITE_IDLE;
  else
    wr_fsm_cur_state <= wr_fsm_nxt_state;
end

// if write req addr is not in ODMA space
// latch this write req and bypass to action
// then bypass write data to action
// latch action write resp when valid
// send resp back to host
always@(*) begin
  case(wr_fsm_cur_state)
    WRITE_IDLE:
      if(byp_wr_req_valid)
        wr_fsm_nxt_state = WRITE_REQ;
      else
        wr_fsm_nxt_state = WRITE_IDLE;
    WRITE_REQ:
      if(a_m_axi_awready)
        wr_fsm_nxt_state = GET_DATA;
      else
        wr_fsm_nxt_state = WRITE_REQ;
    GET_DATA:
      if(h_s_axi_wvalid)
        wr_fsm_nxt_state = WRITE_DATA;
      else
        wr_fsm_nxt_state = GET_DATA;
    WRITE_DATA:
      if(a_m_axi_wready)
        wr_fsm_nxt_state = WAIT_WR_RSP;
      else
        wr_fsm_nxt_state = WRITE_DATA;
    WAIT_WR_RSP:
      if(a_m_axi_bvalid & a_m_axi_bready)
        wr_fsm_nxt_state = SEND_WR_RSP;
      else
        wr_fsm_nxt_state = WAIT_WR_RSP;
    SEND_WR_RSP:
      if(h_s_axi_bready)
        wr_fsm_nxt_state = WRITE_IDLE;
      else
        wr_fsm_nxt_state = SEND_WR_RSP;
    default:
      wr_fsm_nxt_state = WRITE_IDLE;
  endcase
end

assign wr_fsm_state_write_idle   = wr_fsm_cur_state[0];
assign wr_fsm_state_write_req    = wr_fsm_cur_state[1];
assign wr_fsm_state_get_data     = wr_fsm_cur_state[2];
assign wr_fsm_state_write_data   = wr_fsm_cur_state[3];
assign wr_fsm_state_wait_wr_rsp  = wr_fsm_cur_state[4];
assign wr_fsm_state_send_wr_rsp  = wr_fsm_cur_state[5];

// find write addr is in odma space or not
assign is_odma_awaddr    = ((h_s_axi_awaddr > `ODMA_MMIO_ADDR_START) | (h_s_axi_awaddr == `ODMA_MMIO_ADDR_START)) & (h_s_axi_awaddr < `ODMA_MMIO_ADDR_END);
assign is_odma_wr_req    = h_s_axi_awvalid & is_odma_awaddr;
assign is_action_wr_req  = h_s_axi_awvalid & ~is_odma_awaddr;
assign byp_wr_req_valid  = is_action_wr_req & h_s_axi_awready;
assign host_wr_req_valid = is_odma_wr_req & h_s_axi_awready;

// latch odma write valid for resp valid generate
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    host_wr_req_valid_l <= 1'b0;
  else if(host_wr_req_valid)
    host_wr_req_valid_l <= 1'b1;
  else if(h_s_axi_wvalid & h_s_axi_wready)
    host_wr_req_valid_l <= 1'b0;
  else
    host_wr_req_valid_l <= host_wr_req_valid_l;
end

// latch bypassing write request/data
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    byp_axi_awaddr <= {ADDR_WIDTH{1'b0}};
  else if(byp_wr_req_valid)
    byp_axi_awaddr <= h_s_axi_awaddr;
  else
    byp_axi_awaddr <= byp_axi_awaddr;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
    byp_axi_wdata <= {DATA_WIDTH{1'b0}};
    byp_axi_wstrb <= {STRB_WIDTH{1'b0}};
  end
  else if(wr_fsm_state_get_data & h_s_axi_wvalid) begin
    byp_axi_wdata <= h_s_axi_wdata;
    byp_axi_wstrb <= h_s_axi_wstrb;
  end
  else begin
    byp_axi_wdata <= byp_axi_wdata;
    byp_axi_wstrb <= byp_axi_wstrb;
  end
end

// bypass write addr & data to action
assign a_m_axi_awvalid = wr_fsm_state_write_req;
assign a_m_axi_awaddr  = byp_axi_awaddr;
assign a_m_axi_wvalid  = wr_fsm_state_write_data;
assign a_m_axi_wdata   = byp_axi_wdata;
assign a_m_axi_wstrb   = byp_axi_wstrb;

// resp ready to action
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    a_m_axi_bready <= 1'b0;
  else if(wr_fsm_state_wait_wr_rsp & a_m_axi_bvalid)
    a_m_axi_bready <= 1'b1;
  else if(a_m_axi_bvalid & a_m_axi_bready)
    a_m_axi_bready <= 1'b0;
  else
    a_m_axi_bready <= a_m_axi_bready;
end

// latch write resp from action
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    byp_axi_bresp <= 2'b0;
  else if(wr_fsm_state_wait_wr_rsp & a_m_axi_bvalid)
    byp_axi_bresp <= a_m_axi_bresp;
  else
    byp_axi_bresp <= byp_axi_bresp;
end

//------------------------------------------------------------------------------
// Host Write Registers
//------------------------------------------------------------------------------
// write address capture
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    host_axi_awaddr <= {ADDR_WIDTH{1'b0}};
  else if(host_wr_req_valid)
    host_axi_awaddr <= h_s_axi_awaddr;
  else
    host_axi_awaddr <= host_axi_awaddr;
end

// write address ready
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    h_s_axi_awready <= 1'b0;
  else if(wr_fsm_state_write_idle & h_s_axi_awvalid)
    h_s_axi_awready <= 1'b1;
  else if(h_s_axi_awvalid & h_s_axi_awready)
    h_s_axi_awready <= 1'b0;
  else
    h_s_axi_awready <= h_s_axi_awready;
end

// write data ready
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    h_s_axi_wready <= 1'b0;
  else if(h_s_axi_awvalid & h_s_axi_awready)
    h_s_axi_wready <= 1'b1;
  else if(h_s_axi_wvalid)
    h_s_axi_wready <= 1'b0;
  else
    h_s_axi_wready <= h_s_axi_wready;
end

// write data strobes
assign host_axi_wr_mask    = {{8{h_s_axi_wstrb[3]}},{8{h_s_axi_wstrb[2]}},{8{h_s_axi_wstrb[1]}},{8{h_s_axi_wstrb[0]}}};
assign host_axi_wdata_mask = h_s_axi_wdata & host_axi_wr_mask;

always@(posedge clk or negedge rst_n) begin
  if(~rst_n) begin
`ifndef ENABLE_ODMA_ST_MODE
    reg_h2a_ch0_id                  <= 32'h1FC00004; 
    reg_h2a_ch1_id                  <= 32'h1FC00104;                             
    reg_h2a_ch2_id                  <= 32'h1FC00204;
    reg_h2a_ch3_id                  <= 32'h1FC00304;
    reg_a2h_ch0_id                  <= 32'h1FC10004;
    reg_a2h_ch1_id                  <= 32'h1FC10104;
    reg_a2h_ch2_id                  <= 32'h1FC10204;
    reg_a2h_ch3_id                  <= 32'h1FC10304;
`else
    reg_h2a_ch0_id                  <= 32'h1FC08004; 
    reg_h2a_ch1_id                  <= 32'h1FC08104;                             
    reg_h2a_ch2_id                  <= 32'h1FC08204;
    reg_h2a_ch3_id                  <= 32'h1FC08304;
    reg_a2h_ch0_id                  <= 32'h1FC18004;
    reg_a2h_ch1_id                  <= 32'h1FC18104;
    reg_a2h_ch2_id                  <= 32'h1FC18204;
    reg_a2h_ch3_id                  <= 32'h1FC18304;
`endif
    reg_h2a_ch0_ctrl                <= 32'h04000000;
    reg_h2a_ch0_align               <= 32'b0; 
    reg_h2a_ch0_wb_size             <= 32'b0; 
    reg_h2a_ch0_wb_addr_lo          <= 32'b0;     
    reg_h2a_ch0_wb_addr_hi          <= 32'b0;     
    reg_h2a_ch0_intr_en_mask        <= 32'b0;     
    reg_h2a_ch0_perf_mon_ctrl       <= 32'b0;     
    reg_h2a_ch0_perf_cyc_cnt_lo     <= 32'b0;     
    reg_h2a_ch0_perf_cyc_cnt_hi     <= 32'b0;     
    reg_h2a_ch0_perf_data_cnt_lo    <= 32'b0;     
    reg_h2a_ch0_perf_data_cnt_hi    <= 32'b0;     
    reg_h2a_ch1_ctrl                <= 32'h04000000;
    reg_h2a_ch1_align               <= 32'b0;
    reg_h2a_ch1_wb_size             <= 32'b0;
    reg_h2a_ch1_wb_addr_lo          <= 32'b0;
    reg_h2a_ch1_wb_addr_hi          <= 32'b0;
    reg_h2a_ch1_intr_en_mask        <= 32'b0;
    reg_h2a_ch1_perf_mon_ctrl       <= 32'b0;
    reg_h2a_ch1_perf_cyc_cnt_lo     <= 32'b0;
    reg_h2a_ch1_perf_cyc_cnt_hi     <= 32'b0;
    reg_h2a_ch1_perf_data_cnt_lo    <= 32'b0;
    reg_h2a_ch1_perf_data_cnt_hi    <= 32'b0;
    reg_h2a_ch2_ctrl                <= 32'h04000000;
    reg_h2a_ch2_align               <= 32'b0;
    reg_h2a_ch2_wb_size             <= 32'b0;
    reg_h2a_ch2_wb_addr_lo          <= 32'b0;
    reg_h2a_ch2_wb_addr_hi          <= 32'b0;
    reg_h2a_ch2_intr_en_mask        <= 32'b0;
    reg_h2a_ch2_perf_mon_ctrl       <= 32'b0;
    reg_h2a_ch2_perf_cyc_cnt_lo     <= 32'b0;
    reg_h2a_ch2_perf_cyc_cnt_hi     <= 32'b0;
    reg_h2a_ch2_perf_data_cnt_lo    <= 32'b0;
    reg_h2a_ch2_perf_data_cnt_hi    <= 32'b0;
    reg_h2a_ch3_ctrl                <= 32'h04000000;
    reg_h2a_ch3_align               <= 32'b0;
    reg_h2a_ch3_wb_size             <= 32'b0;
    reg_h2a_ch3_wb_addr_lo          <= 32'b0;
    reg_h2a_ch3_wb_addr_hi          <= 32'b0;
    reg_h2a_ch3_intr_en_mask        <= 32'b0;
    reg_h2a_ch3_perf_mon_ctrl       <= 32'b0;
    reg_h2a_ch3_perf_cyc_cnt_lo     <= 32'b0;
    reg_h2a_ch3_perf_cyc_cnt_hi     <= 32'b0;
    reg_h2a_ch3_perf_data_cnt_lo    <= 32'b0;
    reg_h2a_ch3_perf_data_cnt_hi    <= 32'b0;
    reg_a2h_ch0_ctrl                <= 32'h04000000;
    reg_a2h_ch0_align               <= 32'b0;
    reg_a2h_ch0_wb_size             <= 32'b0;
    reg_a2h_ch0_wb_addr_lo          <= 32'b0;
    reg_a2h_ch0_wb_addr_hi          <= 32'b0;
    reg_a2h_ch0_intr_en_mask        <= 32'b0;
    reg_a2h_ch0_perf_mon_ctrl       <= 32'b0;
    reg_a2h_ch0_perf_cyc_cnt_lo     <= 32'b0;
    reg_a2h_ch0_perf_cyc_cnt_hi     <= 32'b0;
    reg_a2h_ch0_perf_data_cnt_lo    <= 32'b0;
    reg_a2h_ch0_perf_data_cnt_hi    <= 32'b0;
    reg_a2h_ch1_ctrl                <= 32'h04000000;
    reg_a2h_ch1_align               <= 32'b0;
    reg_a2h_ch1_wb_size             <= 32'b0;
    reg_a2h_ch1_wb_addr_lo          <= 32'b0;
    reg_a2h_ch1_wb_addr_hi          <= 32'b0;
    reg_a2h_ch1_intr_en_mask        <= 32'b0;
    reg_a2h_ch1_perf_mon_ctrl       <= 32'b0;
    reg_a2h_ch1_perf_cyc_cnt_lo     <= 32'b0;
    reg_a2h_ch1_perf_cyc_cnt_hi     <= 32'b0;
    reg_a2h_ch1_perf_data_cnt_lo    <= 32'b0;
    reg_a2h_ch1_perf_data_cnt_hi    <= 32'b0;
    reg_a2h_ch2_ctrl                <= 32'h04000000;
    reg_a2h_ch2_align               <= 32'b0;
    reg_a2h_ch2_wb_size             <= 32'b0;
    reg_a2h_ch2_wb_addr_lo          <= 32'b0;
    reg_a2h_ch2_wb_addr_hi          <= 32'b0;
    reg_a2h_ch2_intr_en_mask        <= 32'b0;
    reg_a2h_ch2_perf_mon_ctrl       <= 32'b0;
    reg_a2h_ch2_perf_cyc_cnt_lo     <= 32'b0;
    reg_a2h_ch2_perf_cyc_cnt_hi     <= 32'b0;
    reg_a2h_ch2_perf_data_cnt_lo    <= 32'b0;
    reg_a2h_ch2_perf_data_cnt_hi    <= 32'b0;
    reg_a2h_ch3_ctrl                <= 32'h04000000;
    reg_a2h_ch3_align               <= 32'b0;
    reg_a2h_ch3_wb_size             <= 32'b0;
    reg_a2h_ch3_wb_addr_lo          <= 32'b0;
    reg_a2h_ch3_wb_addr_hi          <= 32'b0;
    reg_a2h_ch3_intr_en_mask        <= 32'b0;
    reg_a2h_ch3_perf_mon_ctrl       <= 32'b0;
    reg_a2h_ch3_perf_cyc_cnt_lo     <= 32'b0;
    reg_a2h_ch3_perf_cyc_cnt_hi     <= 32'b0;
    reg_a2h_ch3_perf_data_cnt_lo    <= 32'b0;
    reg_a2h_ch3_perf_data_cnt_hi    <= 32'b0;
    reg_intr_id                     <= 32'h1FC20004;
    reg_intr_user_en_mask           <= 32'b0;
    reg_intr_chnl_en_mask           <= 32'b0;
    reg_intr_user_req               <= 32'b0;
    reg_intr_chnl_req               <= 32'b0;
    reg_intr_user_pending           <= 32'b0;
    reg_intr_chnl_pending           <= 32'b0;
    reg_intr_ch0_obj_handle_lo      <= 32'b0;
    reg_intr_ch0_obj_handle_hi      <= 32'b0;
    reg_intr_ch1_obj_handle_lo      <= 32'b0;
    reg_intr_ch1_obj_handle_hi      <= 32'b0;
    reg_intr_ch2_obj_handle_lo      <= 32'b0;
    reg_intr_ch2_obj_handle_hi      <= 32'b0;
    reg_intr_ch3_obj_handle_lo      <= 32'b0;
    reg_intr_ch3_obj_handle_hi      <= 32'b0;
    reg_cfg_id                      <= 32'h1FC30004;
    reg_cfg_axi_max_wr_size         <= 32'b0;
    reg_cfg_axi_max_rd_size         <= 32'b0;
    reg_cfg_axi_wr_flush_timeout    <= 32'b0;
    reg_h2a_ch0_dma_id              <= 32'h1FC40004;
    reg_h2a_ch0_dma_dsc_addr_lo     <= 32'b0;
    reg_h2a_ch0_dma_dsc_addr_hi     <= 32'b0;
    reg_h2a_ch0_dma_dsc_adj         <= 32'b0;
    reg_h2a_ch0_dma_dsc_credit      <= 32'b0;
    reg_h2a_ch1_dma_id              <= 32'h1FC40104;
    reg_h2a_ch1_dma_dsc_addr_lo     <= 32'b0;
    reg_h2a_ch1_dma_dsc_addr_hi     <= 32'b0;
    reg_h2a_ch1_dma_dsc_adj         <= 32'b0;
    reg_h2a_ch1_dma_dsc_credit      <= 32'b0;
    reg_h2a_ch2_dma_id              <= 32'h1FC40204;
    reg_h2a_ch2_dma_dsc_addr_lo     <= 32'b0;
    reg_h2a_ch2_dma_dsc_addr_hi     <= 32'b0;
    reg_h2a_ch2_dma_dsc_adj         <= 32'b0;
    reg_h2a_ch2_dma_dsc_credit      <= 32'b0;
    reg_h2a_ch3_dma_id              <= 32'h1FC40304;
    reg_h2a_ch3_dma_dsc_addr_lo     <= 32'b0;
    reg_h2a_ch3_dma_dsc_addr_hi     <= 32'b0;
    reg_h2a_ch3_dma_dsc_adj         <= 32'b0;
    reg_h2a_ch3_dma_dsc_credit      <= 32'b0;
    reg_a2h_ch0_dma_id              <= 32'h1FC50004;
    reg_a2h_ch0_dma_dsc_addr_lo     <= 32'b0;
    reg_a2h_ch0_dma_dsc_addr_hi     <= 32'b0;
    reg_a2h_ch0_dma_dsc_adj         <= 32'b0;
    reg_a2h_ch0_dma_dsc_credit      <= 32'b0;
    reg_a2h_ch1_dma_id              <= 32'h1FC50104;
    reg_a2h_ch1_dma_dsc_addr_lo     <= 32'b0;
    reg_a2h_ch1_dma_dsc_addr_hi     <= 32'b0;
    reg_a2h_ch1_dma_dsc_adj         <= 32'b0;
    reg_a2h_ch1_dma_dsc_credit      <= 32'b0;
    reg_a2h_ch2_dma_id              <= 32'h1FC50204;
    reg_a2h_ch2_dma_dsc_addr_lo     <= 32'b0;
    reg_a2h_ch2_dma_dsc_addr_hi     <= 32'b0;
    reg_a2h_ch2_dma_dsc_adj         <= 32'b0;
    reg_a2h_ch2_dma_dsc_credit      <= 32'b0;
    reg_a2h_ch3_dma_id              <= 32'h1FC50304;
    reg_a2h_ch3_dma_dsc_addr_lo     <= 32'b0;
    reg_a2h_ch3_dma_dsc_addr_hi     <= 32'b0;
    reg_a2h_ch3_dma_dsc_adj         <= 32'b0;
    reg_a2h_ch3_dma_dsc_credit      <= 32'b0;
    reg_dma_common_id               <= 32'h1FC60004;
    reg_dma_common_dsc_ctrl         <= 32'b0;
    reg_dma_common_dsc_credit_en    <= 32'b0;
  end
  //write registers
  else if(h_s_axi_wvalid & h_s_axi_wready) begin
    case(host_axi_awaddr)
      `H2A_CH0_CTRL                : reg_h2a_ch0_ctrl            <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch0_ctrl);
      `H2A_CH0_CTRL_W1S            : reg_h2a_ch0_ctrl            <= host_axi_wdata_mask | reg_h2a_ch0_ctrl;
      `H2A_CH0_CTRL_W1C            : reg_h2a_ch0_ctrl            <= ~host_axi_wdata_mask & reg_h2a_ch0_ctrl;
      `H2A_CH0_WB_SIZE             : reg_h2a_ch0_wb_size         <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch0_wb_size);
      `H2A_CH0_WB_ADDR_LO          : reg_h2a_ch0_wb_addr_lo      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch0_wb_addr_lo);
      `H2A_CH0_WB_ADDR_HI          : reg_h2a_ch0_wb_addr_hi      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch0_wb_addr_hi);
      `H2A_CH0_INTR_EN_MASK        : reg_h2a_ch0_intr_en_mask    <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch0_intr_en_mask);
      `H2A_CH0_INTR_EN_MASK_W1S    : reg_h2a_ch0_intr_en_mask    <= host_axi_wdata_mask | reg_h2a_ch0_intr_en_mask;
      `H2A_CH0_INTR_EN_MASK_W1C    : reg_h2a_ch0_intr_en_mask    <= ~host_axi_wdata_mask & reg_h2a_ch0_intr_en_mask;
      `H2A_CH0_PERF_MON_CTRL       : reg_h2a_ch0_perf_mon_ctrl   <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch1_perf_mon_ctrl);
      `H2A_CH1_CTRL                : reg_h2a_ch1_ctrl            <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch1_ctrl);
      `H2A_CH1_CTRL_W1S            : reg_h2a_ch1_ctrl            <= host_axi_wdata_mask | reg_h2a_ch1_ctrl;
      `H2A_CH1_CTRL_W1C            : reg_h2a_ch1_ctrl            <= ~host_axi_wdata_mask & reg_h2a_ch1_ctrl;
      `H2A_CH1_WB_SIZE             : reg_h2a_ch1_wb_size         <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch1_wb_size);
      `H2A_CH1_WB_ADDR_LO          : reg_h2a_ch1_wb_addr_lo      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch1_wb_addr_lo);
      `H2A_CH1_WB_ADDR_HI          : reg_h2a_ch1_wb_addr_hi      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch1_wb_addr_hi);
      `H2A_CH1_INTR_EN_MASK        : reg_h2a_ch1_intr_en_mask    <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch1_intr_en_mask);
      `H2A_CH1_INTR_EN_MASK_W1S    : reg_h2a_ch1_intr_en_mask    <= host_axi_wdata_mask | reg_h2a_ch1_intr_en_mask;
      `H2A_CH1_INTR_EN_MASK_W1C    : reg_h2a_ch1_intr_en_mask    <= ~host_axi_wdata_mask & reg_h2a_ch1_intr_en_mask;
      `H2A_CH1_PERF_MON_CTRL       : reg_h2a_ch1_perf_mon_ctrl   <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch1_perf_mon_ctrl);
      `H2A_CH2_CTRL                : reg_h2a_ch2_ctrl            <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch2_ctrl);
      `H2A_CH2_CTRL_W1S            : reg_h2a_ch2_ctrl            <= host_axi_wdata_mask | reg_h2a_ch2_ctrl;
      `H2A_CH2_CTRL_W1C            : reg_h2a_ch2_ctrl            <= ~host_axi_wdata_mask & reg_h2a_ch2_ctrl;
      `H2A_CH2_WB_SIZE             : reg_h2a_ch2_wb_size         <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch2_wb_size);
      `H2A_CH2_WB_ADDR_LO          : reg_h2a_ch2_wb_addr_lo      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch2_wb_addr_lo);
      `H2A_CH2_WB_ADDR_HI          : reg_h2a_ch2_wb_addr_hi      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch2_wb_addr_hi);
      `H2A_CH2_INTR_EN_MASK        : reg_h2a_ch2_intr_en_mask    <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch2_intr_en_mask);
      `H2A_CH2_INTR_EN_MASK_W1S    : reg_h2a_ch2_intr_en_mask    <= host_axi_wdata_mask | reg_h2a_ch2_intr_en_mask;
      `H2A_CH2_INTR_EN_MASK_W1C    : reg_h2a_ch2_intr_en_mask    <= ~host_axi_wdata_mask & reg_h2a_ch2_intr_en_mask;
      `H2A_CH2_PERF_MON_CTRL       : reg_h2a_ch2_perf_mon_ctrl   <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch1_perf_mon_ctrl);
      `H2A_CH3_CTRL                : reg_h2a_ch3_ctrl            <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch3_ctrl);
      `H2A_CH3_CTRL_W1S            : reg_h2a_ch3_ctrl            <= host_axi_wdata_mask | reg_h2a_ch3_ctrl;
      `H2A_CH3_CTRL_W1C            : reg_h2a_ch3_ctrl            <= ~host_axi_wdata_mask & reg_h2a_ch3_ctrl;
      `H2A_CH3_WB_SIZE             : reg_h2a_ch3_wb_size         <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch3_wb_size);
      `H2A_CH3_WB_ADDR_LO          : reg_h2a_ch3_wb_addr_lo      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch3_wb_addr_lo);
      `H2A_CH3_WB_ADDR_HI          : reg_h2a_ch3_wb_addr_hi      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch3_wb_addr_hi);
      `H2A_CH3_INTR_EN_MASK        : reg_h2a_ch3_intr_en_mask    <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch3_intr_en_mask);
      `H2A_CH3_INTR_EN_MASK_W1S    : reg_h2a_ch3_intr_en_mask    <= host_axi_wdata_mask | reg_h2a_ch3_intr_en_mask;
      `H2A_CH3_INTR_EN_MASK_W1C    : reg_h2a_ch3_intr_en_mask    <= ~host_axi_wdata_mask & reg_h2a_ch3_intr_en_mask;
      `H2A_CH3_PERF_MON_CTRL       : reg_h2a_ch3_perf_mon_ctrl   <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch1_perf_mon_ctrl);
      `A2H_CH0_CTRL                : reg_a2h_ch0_ctrl            <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch0_ctrl);
      `A2H_CH0_CTRL_W1S            : reg_a2h_ch0_ctrl            <= host_axi_wdata_mask | reg_a2h_ch0_ctrl;
      `A2H_CH0_CTRL_W1C            : reg_a2h_ch0_ctrl            <= ~host_axi_wdata_mask & reg_a2h_ch0_ctrl;
      `A2H_CH0_WB_SIZE             : reg_a2h_ch0_wb_size         <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch0_wb_size);
      `A2H_CH0_WB_ADDR_LO          : reg_a2h_ch0_wb_addr_lo      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch0_wb_addr_lo);
      `A2H_CH0_WB_ADDR_HI          : reg_a2h_ch0_wb_addr_hi      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch0_wb_addr_hi);
      `A2H_CH0_INTR_EN_MASK        : reg_a2h_ch0_intr_en_mask    <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch0_intr_en_mask);
      `A2H_CH0_INTR_EN_MASK_W1S    : reg_a2h_ch0_intr_en_mask    <= host_axi_wdata_mask | reg_a2h_ch0_intr_en_mask;
      `A2H_CH0_INTR_EN_MASK_W1C    : reg_a2h_ch0_intr_en_mask    <= ~host_axi_wdata_mask & reg_a2h_ch0_intr_en_mask;
      `A2H_CH0_PERF_MON_CTRL       : reg_a2h_ch0_perf_mon_ctrl   <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch1_perf_mon_ctrl);
      `A2H_CH1_CTRL                : reg_a2h_ch1_ctrl            <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch1_ctrl);
      `A2H_CH1_CTRL_W1S            : reg_a2h_ch1_ctrl            <= host_axi_wdata_mask | reg_a2h_ch1_ctrl;
      `A2H_CH1_CTRL_W1C            : reg_a2h_ch1_ctrl            <= ~host_axi_wdata_mask & reg_a2h_ch1_ctrl;
      `A2H_CH1_WB_SIZE             : reg_a2h_ch1_wb_size         <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch1_wb_size);
      `A2H_CH1_WB_ADDR_LO          : reg_a2h_ch1_wb_addr_lo      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch1_wb_addr_lo);
      `A2H_CH1_WB_ADDR_HI          : reg_a2h_ch1_wb_addr_hi      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch1_wb_addr_hi);
      `A2H_CH1_INTR_EN_MASK        : reg_a2h_ch1_intr_en_mask    <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch1_intr_en_mask);
      `A2H_CH1_INTR_EN_MASK_W1S    : reg_a2h_ch1_intr_en_mask    <= host_axi_wdata_mask | reg_a2h_ch1_intr_en_mask;
      `A2H_CH1_INTR_EN_MASK_W1C    : reg_a2h_ch1_intr_en_mask    <= ~host_axi_wdata_mask & reg_a2h_ch1_intr_en_mask;
      `A2H_CH1_PERF_MON_CTRL       : reg_a2h_ch1_perf_mon_ctrl   <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch1_perf_mon_ctrl);
      `A2H_CH2_CTRL                : reg_a2h_ch2_ctrl            <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch2_ctrl);
      `A2H_CH2_CTRL_W1S            : reg_a2h_ch2_ctrl            <= host_axi_wdata_mask | reg_a2h_ch2_ctrl;
      `A2H_CH2_CTRL_W1C            : reg_a2h_ch2_ctrl            <= ~host_axi_wdata_mask & reg_a2h_ch2_ctrl;
      `A2H_CH2_WB_SIZE             : reg_a2h_ch2_wb_size         <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch2_wb_size);
      `A2H_CH2_WB_ADDR_LO          : reg_a2h_ch2_wb_addr_lo      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch2_wb_addr_lo);
      `A2H_CH2_WB_ADDR_HI          : reg_a2h_ch2_wb_addr_hi      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch2_wb_addr_hi);
      `A2H_CH2_INTR_EN_MASK        : reg_a2h_ch2_intr_en_mask    <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch2_intr_en_mask);
      `A2H_CH2_INTR_EN_MASK_W1S    : reg_a2h_ch2_intr_en_mask    <= host_axi_wdata_mask | reg_a2h_ch2_intr_en_mask;
      `A2H_CH2_INTR_EN_MASK_W1C    : reg_a2h_ch2_intr_en_mask    <= ~host_axi_wdata_mask & reg_a2h_ch2_intr_en_mask;
      `A2H_CH2_PERF_MON_CTRL       : reg_a2h_ch2_perf_mon_ctrl   <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch1_perf_mon_ctrl);
      `A2H_CH3_CTRL                : reg_a2h_ch3_ctrl            <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch3_ctrl);
      `A2H_CH3_CTRL_W1S            : reg_a2h_ch3_ctrl            <= host_axi_wdata_mask | reg_a2h_ch3_ctrl;
      `A2H_CH3_CTRL_W1C            : reg_a2h_ch3_ctrl            <= ~host_axi_wdata_mask & reg_a2h_ch3_ctrl;
      `A2H_CH3_WB_SIZE             : reg_a2h_ch3_wb_size         <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch3_wb_size);
      `A2H_CH3_WB_ADDR_LO          : reg_a2h_ch3_wb_addr_lo      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch3_wb_addr_lo);
      `A2H_CH3_WB_ADDR_HI          : reg_a2h_ch3_wb_addr_hi      <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch3_wb_addr_hi);
      `A2H_CH3_INTR_EN_MASK        : reg_a2h_ch3_intr_en_mask    <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch3_intr_en_mask);
      `A2H_CH3_INTR_EN_MASK_W1S    : reg_a2h_ch3_intr_en_mask    <= host_axi_wdata_mask | reg_a2h_ch3_intr_en_mask;
      `A2H_CH3_INTR_EN_MASK_W1C    : reg_a2h_ch3_intr_en_mask    <= ~host_axi_wdata_mask & reg_a2h_ch3_intr_en_mask;
      `A2H_CH3_PERF_MON_CTRL       : reg_a2h_ch3_perf_mon_ctrl   <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch1_perf_mon_ctrl);
      `INTR_USER_EN_MASK           : reg_intr_user_en_mask       <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_intr_user_en_mask);
      `INTR_USER_EN_MASK_W1S       : reg_intr_user_en_mask       <= host_axi_wdata_mask | reg_intr_user_en_mask;
      `INTR_USER_EN_MASK_W1C       : reg_intr_user_en_mask       <= ~host_axi_wdata_mask & reg_intr_user_en_mask;
      `INTR_CHNL_EN_MASK           : reg_intr_chnl_en_mask       <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_intr_chnl_en_mask);
      `INTR_CHNL_EN_MASK_W1S       : reg_intr_chnl_en_mask       <= host_axi_wdata_mask | reg_intr_chnl_en_mask;
      `INTR_CHNL_EN_MASK_W1C       : reg_intr_chnl_en_mask       <= ~host_axi_wdata_mask & reg_intr_chnl_en_mask;
      `INTR_CH0_OBJ_HANDLE_LO      : reg_intr_ch0_obj_handle_lo  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_intr_ch0_obj_handle_lo);
      `INTR_CH0_OBJ_HANDLE_HI      : reg_intr_ch0_obj_handle_hi  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_intr_ch0_obj_handle_hi);
      `INTR_CH1_OBJ_HANDLE_LO      : reg_intr_ch1_obj_handle_lo  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_intr_ch1_obj_handle_lo);
      `INTR_CH1_OBJ_HANDLE_HI      : reg_intr_ch1_obj_handle_hi  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_intr_ch1_obj_handle_hi);
      `INTR_CH2_OBJ_HANDLE_LO      : reg_intr_ch2_obj_handle_lo  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_intr_ch2_obj_handle_lo);
      `INTR_CH2_OBJ_HANDLE_HI      : reg_intr_ch2_obj_handle_hi  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_intr_ch2_obj_handle_hi);
      `INTR_CH3_OBJ_HANDLE_LO      : reg_intr_ch3_obj_handle_lo  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_intr_ch3_obj_handle_lo);
      `INTR_CH3_OBJ_HANDLE_HI      : reg_intr_ch3_obj_handle_hi  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_intr_ch3_obj_handle_hi);
      `CFG_AXI_MAX_WR_SIZE         : reg_cfg_axi_max_wr_size     <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_cfg_axi_max_wr_size);
      `CFG_AXI_MAX_RD_SIZE         : reg_cfg_axi_max_rd_size     <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_cfg_axi_max_rd_size);
      `CFG_AXI_WR_FLUSH_TIMEOUT    : reg_cfg_axi_wr_flush_timeout<= host_axi_wdata_mask | (~host_axi_wr_mask & reg_cfg_axi_wr_flush_timeout);
      `H2A_CH0_DMA_DSC_ADDR_LO     : reg_h2a_ch0_dma_dsc_addr_lo <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch0_dma_dsc_addr_lo);
      `H2A_CH0_DMA_DSC_ADDR_HI     : reg_h2a_ch0_dma_dsc_addr_hi <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch0_dma_dsc_addr_hi);
      `H2A_CH0_DMA_DSC_ADJ         : reg_h2a_ch0_dma_dsc_adj     <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch0_dma_dsc_adj);
      `H2A_CH0_DMA_DSC_CREDIT      : reg_h2a_ch0_dma_dsc_credit  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch0_dma_dsc_credit);
      `H2A_CH1_DMA_DSC_ADDR_LO     : reg_h2a_ch1_dma_dsc_addr_lo <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch1_dma_dsc_addr_lo);
      `H2A_CH1_DMA_DSC_ADDR_HI     : reg_h2a_ch1_dma_dsc_addr_hi <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch1_dma_dsc_addr_hi);
      `H2A_CH1_DMA_DSC_ADJ         : reg_h2a_ch1_dma_dsc_adj     <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch1_dma_dsc_adj);
      `H2A_CH1_DMA_DSC_CREDIT      : reg_h2a_ch1_dma_dsc_credit  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch1_dma_dsc_credit);
      `H2A_CH2_DMA_DSC_ADDR_LO     : reg_h2a_ch2_dma_dsc_addr_lo <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch2_dma_dsc_addr_lo);
      `H2A_CH2_DMA_DSC_ADDR_HI     : reg_h2a_ch2_dma_dsc_addr_hi <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch2_dma_dsc_addr_hi);
      `H2A_CH2_DMA_DSC_ADJ         : reg_h2a_ch2_dma_dsc_adj     <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch2_dma_dsc_adj);
      `H2A_CH2_DMA_DSC_CREDIT      : reg_h2a_ch2_dma_dsc_credit  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch2_dma_dsc_credit);
      `H2A_CH3_DMA_DSC_ADDR_LO     : reg_h2a_ch3_dma_dsc_addr_lo <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch3_dma_dsc_addr_lo);
      `H2A_CH3_DMA_DSC_ADDR_HI     : reg_h2a_ch3_dma_dsc_addr_hi <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch3_dma_dsc_addr_hi);
      `H2A_CH3_DMA_DSC_ADJ         : reg_h2a_ch3_dma_dsc_adj     <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch3_dma_dsc_adj);
      `H2A_CH3_DMA_DSC_CREDIT      : reg_h2a_ch3_dma_dsc_credit  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_h2a_ch3_dma_dsc_credit);
      `A2H_CH0_DMA_DSC_ADDR_LO     : reg_a2h_ch0_dma_dsc_addr_lo <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch0_dma_dsc_addr_lo);
      `A2H_CH0_DMA_DSC_ADDR_HI     : reg_a2h_ch0_dma_dsc_addr_hi <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch0_dma_dsc_addr_hi);
      `A2H_CH0_DMA_DSC_ADJ         : reg_a2h_ch0_dma_dsc_adj     <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch0_dma_dsc_adj);
      `A2H_CH0_DMA_DSC_CREDIT      : reg_a2h_ch0_dma_dsc_credit  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch0_dma_dsc_credit);
      `A2H_CH1_DMA_DSC_ADDR_LO     : reg_a2h_ch1_dma_dsc_addr_lo <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch1_dma_dsc_addr_lo);
      `A2H_CH1_DMA_DSC_ADDR_HI     : reg_a2h_ch1_dma_dsc_addr_hi <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch1_dma_dsc_addr_hi);
      `A2H_CH1_DMA_DSC_ADJ         : reg_a2h_ch1_dma_dsc_adj     <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch1_dma_dsc_adj);
      `A2H_CH1_DMA_DSC_CREDIT      : reg_a2h_ch1_dma_dsc_credit  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch1_dma_dsc_credit);
      `A2H_CH2_DMA_DSC_ADDR_LO     : reg_a2h_ch2_dma_dsc_addr_lo <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch2_dma_dsc_addr_lo);
      `A2H_CH2_DMA_DSC_ADDR_HI     : reg_a2h_ch2_dma_dsc_addr_hi <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch2_dma_dsc_addr_hi);
      `A2H_CH2_DMA_DSC_ADJ         : reg_a2h_ch2_dma_dsc_adj     <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch2_dma_dsc_adj);
      `A2H_CH2_DMA_DSC_CREDIT      : reg_a2h_ch2_dma_dsc_credit  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch2_dma_dsc_credit);
      `A2H_CH3_DMA_DSC_ADDR_LO     : reg_a2h_ch3_dma_dsc_addr_lo <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch3_dma_dsc_addr_lo);
      `A2H_CH3_DMA_DSC_ADDR_HI     : reg_a2h_ch3_dma_dsc_addr_hi <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch3_dma_dsc_addr_hi);
      `A2H_CH3_DMA_DSC_ADJ         : reg_a2h_ch3_dma_dsc_adj     <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch3_dma_dsc_adj);
      `A2H_CH3_DMA_DSC_CREDIT      : reg_a2h_ch3_dma_dsc_credit  <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_a2h_ch3_dma_dsc_credit);
      `DMA_COMMON_DSC_CTRL         : reg_dma_common_dsc_ctrl     <= host_axi_wdata_mask | (~host_axi_wr_mask & reg_dma_common_dsc_ctrl);
      `DMA_COMMON_DSC_CTRL_W1S     : reg_dma_common_dsc_ctrl     <= host_axi_wdata_mask | reg_dma_common_dsc_ctrl;
      `DMA_COMMON_DSC_CTRL_W1C     : reg_dma_common_dsc_ctrl     <= ~host_axi_wdata_mask & reg_dma_common_dsc_ctrl;
      `DMA_COMMON_DSC_CREDIT_EN    : reg_dma_common_dsc_credit_en<= host_axi_wdata_mask | (~host_axi_wr_mask & reg_dma_common_dsc_credit_en);
      `DMA_COMMON_DSC_CREDIT_EN_W1S: reg_dma_common_dsc_credit_en<= host_axi_wdata_mask | reg_dma_common_dsc_credit_en;
      `DMA_COMMON_DSC_CREDIT_EN_W1C: reg_dma_common_dsc_credit_en<= ~host_axi_wdata_mask & reg_dma_common_dsc_credit_en;
      default:;
    endcase
  end
end

//--------------------------------
//generate pulse of control register run bit setting
//--------------------------------
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    h2a_ch0_run_bit_set <= 1'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & host_axi_wdata_mask[0]
        & ((host_axi_awaddr == `H2A_CH0_CTRL) | (host_axi_awaddr == `H2A_CH0_CTRL_W1S)))
    h2a_ch0_run_bit_set <= 1'b1;
  else if(h2a_ch0_run_bit_set)
    h2a_ch0_run_bit_set <= 1'b0;
  else
    h2a_ch0_run_bit_set <= h2a_ch0_run_bit_set;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    h2a_ch1_run_bit_set <= 1'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & host_axi_wdata_mask[0]
        & ((host_axi_awaddr == `H2A_CH1_CTRL) | (host_axi_awaddr == `H2A_CH1_CTRL_W1S)))
    h2a_ch1_run_bit_set <= 1'b1;
  else if(h2a_ch1_run_bit_set)
    h2a_ch1_run_bit_set <= 1'b0;
  else
    h2a_ch1_run_bit_set <= h2a_ch1_run_bit_set;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    h2a_ch2_run_bit_set <= 1'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & host_axi_wdata_mask[0]
        & ((host_axi_awaddr == `H2A_CH2_CTRL) | (host_axi_awaddr == `H2A_CH2_CTRL_W1S)))
    h2a_ch2_run_bit_set <= 1'b1;
  else if(h2a_ch2_run_bit_set)
    h2a_ch2_run_bit_set <= 1'b0;
  else
    h2a_ch2_run_bit_set <= h2a_ch2_run_bit_set;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    h2a_ch3_run_bit_set <= 1'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & host_axi_wdata_mask[0]
        & ((host_axi_awaddr == `H2A_CH3_CTRL) | (host_axi_awaddr == `H2A_CH3_CTRL_W1S)))
    h2a_ch3_run_bit_set <= 1'b1;
  else if(h2a_ch3_run_bit_set)
    h2a_ch3_run_bit_set <= 1'b0;
  else
    h2a_ch3_run_bit_set <= h2a_ch3_run_bit_set;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    a2h_ch0_run_bit_set <= 1'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & host_axi_wdata_mask[0]
        & ((host_axi_awaddr == `A2H_CH0_CTRL) | (host_axi_awaddr == `A2H_CH0_CTRL_W1S)))
    a2h_ch0_run_bit_set <= 1'b1;
  else if(a2h_ch0_run_bit_set)
    a2h_ch0_run_bit_set <= 1'b0;
  else
    a2h_ch0_run_bit_set <= a2h_ch0_run_bit_set;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    a2h_ch1_run_bit_set <= 1'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & host_axi_wdata_mask[0]
        & ((host_axi_awaddr == `A2H_CH1_CTRL) | (host_axi_awaddr == `A2H_CH1_CTRL_W1S)))
    a2h_ch1_run_bit_set <= 1'b1;
  else if(a2h_ch1_run_bit_set)
    a2h_ch1_run_bit_set <= 1'b0;
  else
    a2h_ch1_run_bit_set <= a2h_ch1_run_bit_set;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    a2h_ch2_run_bit_set <= 1'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & host_axi_wdata_mask[0]
        & ((host_axi_awaddr == `A2H_CH2_CTRL) | (host_axi_awaddr == `A2H_CH2_CTRL_W1S)))
    a2h_ch2_run_bit_set <= 1'b1;
  else if(a2h_ch2_run_bit_set)
    a2h_ch2_run_bit_set <= 1'b0;
  else
    a2h_ch2_run_bit_set <= a2h_ch2_run_bit_set;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    a2h_ch3_run_bit_set <= 1'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & host_axi_wdata_mask[0]
        & ((host_axi_awaddr == `A2H_CH3_CTRL) | (host_axi_awaddr == `A2H_CH3_CTRL_W1S)))
    a2h_ch3_run_bit_set <= 1'b1;
  else if(a2h_ch3_run_bit_set)
    a2h_ch3_run_bit_set <= 1'b0;
  else
    a2h_ch3_run_bit_set <= a2h_ch3_run_bit_set;
end

//--------------------------------
//channel status register
//--------------------------------
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_h2a_ch0_stat <= 32'b0;
  //reset on control register run bit setting
  else if(h2a_ch0_run_bit_set)
    reg_h2a_ch0_stat <= 32'b0;
  //write 1 clear, bit0 (busy bit RO) is not implemented
  else if(h_s_axi_wvalid & h_s_axi_wready & (host_axi_awaddr == `H2A_CH0_STAT))
    reg_h2a_ch0_stat <= ~host_axi_wdata_mask & reg_h2a_ch0_stat;
  //read clear
  else if(host_rd_req_valid & (h_s_axi_araddr == `H2A_CH0_STAT_RC))
    reg_h2a_ch0_stat <= 32'b0;
  //hw update
  else if(h2a_ch0_run)
    reg_h2a_ch0_stat <= {8'b0, dsc_ch0_dsc_err, cmp_ch0_wr_err, cmp_ch0_rd_err, 9'b0};
  else
    reg_h2a_ch0_stat <= reg_h2a_ch0_stat;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_h2a_ch1_stat <= 32'b0;
  else if(h2a_ch1_run_bit_set)
    reg_h2a_ch1_stat <= 32'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & (host_axi_awaddr == `H2A_CH1_STAT))
    reg_h2a_ch1_stat <= ~host_axi_wdata_mask & reg_h2a_ch1_stat;
  else if(host_rd_req_valid & (h_s_axi_araddr == `H2A_CH1_STAT_RC))
    reg_h2a_ch1_stat <= 32'b0;
  else if(h2a_ch1_run)
    reg_h2a_ch1_stat <= {8'b0, dsc_ch1_dsc_err, cmp_ch1_wr_err, cmp_ch1_rd_err, 9'b0};
  else
    reg_h2a_ch1_stat <= reg_h2a_ch1_stat;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_h2a_ch2_stat <= 32'b0;
  else if(h2a_ch2_run_bit_set)
    reg_h2a_ch2_stat <= 32'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & (host_axi_awaddr == `H2A_CH2_STAT))
    reg_h2a_ch2_stat <= ~host_axi_wdata_mask & reg_h2a_ch2_stat;
  else if(host_rd_req_valid & (h_s_axi_araddr == `H2A_CH2_STAT_RC))
    reg_h2a_ch2_stat <= 32'b0;
  else if(h2a_ch2_run)
    reg_h2a_ch2_stat <= {8'b0, dsc_ch2_dsc_err, cmp_ch2_wr_err, cmp_ch2_rd_err, 9'b0};
  else
    reg_h2a_ch2_stat <= reg_h2a_ch2_stat;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_h2a_ch3_stat <= 32'b0;
  else if(h2a_ch3_run_bit_set)
    reg_h2a_ch3_stat <= 32'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & (host_axi_awaddr == `H2A_CH3_STAT))
    reg_h2a_ch3_stat <= ~host_axi_wdata_mask & reg_h2a_ch3_stat;
  else if(host_rd_req_valid & (h_s_axi_araddr == `H2A_CH3_STAT_RC))
    reg_h2a_ch3_stat <= 32'b0;
  else if(h2a_ch3_run)
    reg_h2a_ch3_stat <= {8'b0, dsc_ch3_dsc_err, cmp_ch3_wr_err, cmp_ch3_rd_err, 9'b0};
  else
    reg_h2a_ch3_stat <= reg_h2a_ch3_stat;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_a2h_ch0_stat <= 32'b0;
  else if(a2h_ch0_run_bit_set)
    reg_a2h_ch0_stat <= 32'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & (host_axi_awaddr == `A2H_CH0_STAT))
    reg_a2h_ch0_stat <= ~host_axi_wdata_mask & reg_a2h_ch0_stat;
  else if(host_rd_req_valid & (h_s_axi_araddr == `A2H_CH0_STAT_RC))
    reg_a2h_ch0_stat <= 32'b0;
  else if(a2h_ch0_run)
    reg_a2h_ch0_stat <= {8'b0, dsc_ch0_dsc_err, cmp_ch0_wr_err, cmp_ch0_rd_err, 9'b0};
  else
    reg_a2h_ch0_stat <= reg_a2h_ch0_stat;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_a2h_ch1_stat <= 32'b0;
  else if(a2h_ch1_run_bit_set)
    reg_a2h_ch1_stat <= 32'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & (host_axi_awaddr == `A2H_CH1_STAT))
    reg_a2h_ch1_stat <= ~host_axi_wdata_mask & reg_a2h_ch1_stat;
  else if(host_rd_req_valid & (h_s_axi_araddr == `A2H_CH1_STAT_RC))
    reg_a2h_ch1_stat <= 32'b0;
  else if(a2h_ch1_run)
    reg_a2h_ch1_stat <= {8'b0, dsc_ch1_dsc_err, cmp_ch1_wr_err, cmp_ch1_rd_err, 9'b0};
  else
    reg_a2h_ch1_stat <= reg_a2h_ch1_stat;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_a2h_ch2_stat <= 32'b0;
  else if(a2h_ch2_run_bit_set)
    reg_a2h_ch2_stat <= 32'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & (host_axi_awaddr == `A2H_CH2_STAT))
    reg_a2h_ch2_stat <= ~host_axi_wdata_mask & reg_a2h_ch2_stat;
  else if(host_rd_req_valid & (h_s_axi_araddr == `A2H_CH2_STAT_RC))
    reg_a2h_ch2_stat <= 32'b0;
  else if(a2h_ch2_run)
    reg_a2h_ch2_stat <= {8'b0, dsc_ch2_dsc_err, cmp_ch2_wr_err, cmp_ch2_rd_err, 9'b0};
  else
    reg_a2h_ch2_stat <= reg_a2h_ch2_stat;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_a2h_ch3_stat <= 32'b0;
  else if(a2h_ch3_run_bit_set)
    reg_a2h_ch3_stat <= 32'b0;
  else if(h_s_axi_wvalid & h_s_axi_wready & (host_axi_awaddr == `A2H_CH3_STAT))
    reg_a2h_ch3_stat <= ~host_axi_wdata_mask & reg_a2h_ch3_stat;
  else if(host_rd_req_valid & (h_s_axi_araddr == `A2H_CH3_STAT_RC))
    reg_a2h_ch3_stat <= 32'b0;
  else if(a2h_ch3_run)
    reg_a2h_ch3_stat <= {8'b0, dsc_ch3_dsc_err, cmp_ch3_wr_err, cmp_ch3_rd_err, 9'b0};
  else
    reg_a2h_ch3_stat <= reg_a2h_ch3_stat;
end

//--------------------------------
//completed descriptor count register
//--------------------------------
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_h2a_ch0_cmp_dsc_cnt <= 32'b0;
  //reset on control register run bit setting
  else if(h2a_ch0_run_bit_set)
    reg_h2a_ch0_cmp_dsc_cnt <= 32'b0;
  //hw update
  else if(h2a_ch0_run)
    reg_h2a_ch0_cmp_dsc_cnt <= cmp_ch0_dsc_cnt;
  else
    reg_h2a_ch0_cmp_dsc_cnt <= reg_h2a_ch0_cmp_dsc_cnt;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_h2a_ch1_cmp_dsc_cnt <= 32'b0;
  else if(h2a_ch1_run_bit_set)
    reg_h2a_ch1_cmp_dsc_cnt <= 32'b0;
  else if(h2a_ch1_run)
    reg_h2a_ch1_cmp_dsc_cnt <= cmp_ch1_dsc_cnt;
  else
    reg_h2a_ch1_cmp_dsc_cnt <= reg_h2a_ch1_cmp_dsc_cnt;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_h2a_ch2_cmp_dsc_cnt <= 32'b0;
  else if(h2a_ch2_run_bit_set)
    reg_h2a_ch2_cmp_dsc_cnt <= 32'b0;
  else if(h2a_ch2_run)
    reg_h2a_ch2_cmp_dsc_cnt <= cmp_ch2_dsc_cnt;
  else
    reg_h2a_ch2_cmp_dsc_cnt <= reg_h2a_ch2_cmp_dsc_cnt;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_h2a_ch3_cmp_dsc_cnt <= 32'b0;
  else if(h2a_ch3_run_bit_set)
    reg_h2a_ch3_cmp_dsc_cnt <= 32'b0;
  else if(h2a_ch3_run)
    reg_h2a_ch3_cmp_dsc_cnt <= cmp_ch3_dsc_cnt;
  else
    reg_h2a_ch3_cmp_dsc_cnt <= reg_h2a_ch3_cmp_dsc_cnt;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_a2h_ch0_cmp_dsc_cnt <= 32'b0;
  else if(a2h_ch0_run_bit_set)
    reg_a2h_ch0_cmp_dsc_cnt <= 32'b0;
  else if(a2h_ch0_run)
    reg_a2h_ch0_cmp_dsc_cnt <= cmp_ch0_dsc_cnt;
  else
    reg_a2h_ch0_cmp_dsc_cnt <= reg_a2h_ch0_cmp_dsc_cnt;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_a2h_ch1_cmp_dsc_cnt <= 32'b0;
  else if(a2h_ch1_run_bit_set)
    reg_a2h_ch1_cmp_dsc_cnt <= 32'b0;
  else if(a2h_ch1_run)
    reg_a2h_ch1_cmp_dsc_cnt <= cmp_ch1_dsc_cnt;
  else
    reg_a2h_ch1_cmp_dsc_cnt <= reg_a2h_ch1_cmp_dsc_cnt;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_a2h_ch2_cmp_dsc_cnt <= 32'b0;
  else if(a2h_ch2_run_bit_set)
    reg_a2h_ch2_cmp_dsc_cnt <= 32'b0;
  else if(a2h_ch2_run)
    reg_a2h_ch2_cmp_dsc_cnt <= cmp_ch2_dsc_cnt;
  else
    reg_a2h_ch2_cmp_dsc_cnt <= reg_a2h_ch2_cmp_dsc_cnt;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    reg_a2h_ch3_cmp_dsc_cnt <= 32'b0;
  else if(a2h_ch3_run_bit_set)
    reg_a2h_ch3_cmp_dsc_cnt <= 32'b0;
  else if(a2h_ch3_run)
    reg_a2h_ch3_cmp_dsc_cnt <= cmp_ch3_dsc_cnt;
  else
    reg_a2h_ch3_cmp_dsc_cnt <= reg_a2h_ch3_cmp_dsc_cnt;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    host_axi_bvalid <= 1'b0;
  else if(host_wr_req_valid_l & h_s_axi_wvalid & h_s_axi_wready)
    host_axi_bvalid <= 1'b1;
  else if(h_s_axi_bready)
    host_axi_bvalid <= 1'b0;
  else
    host_axi_bvalid <= host_axi_bvalid;
end

// write resp valid
assign h_s_axi_bvalid = host_axi_bvalid | wr_fsm_state_send_wr_rsp;
assign h_s_axi_bresp  = wr_fsm_state_send_wr_rsp ? byp_axi_bresp : 2'd0;

//------------------------------------------------------------------------------
// Host Read Registers
//------------------------------------------------------------------------------
// read address ready
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    h_s_axi_arready <= 1'b0;
  else if(rd_fsm_state_read_idle & h_s_axi_arvalid)
    h_s_axi_arready <= 1'b1;
  else if(h_s_axi_arvalid & h_s_axi_arready)
    h_s_axi_arready <= 1'b0;
  else
    h_s_axi_arready <= h_s_axi_arready;
end

// odma read data valid
always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    host_axi_rvalid <= 1'b0;
  else if(host_rd_req_valid)
    host_axi_rvalid <= 1'b1;
  else if(h_s_axi_rready)
    host_axi_rvalid <= 1'b0;
  else
    host_axi_rvalid <= host_axi_rvalid;
end

always@(posedge clk or negedge rst_n) begin
  if(~rst_n)
    host_axi_rdata <= 32'd0;
  else if(host_rd_req_valid)
    case(h_s_axi_araddr)
      `H2A_CH0_ID                : host_axi_rdata <= reg_h2a_ch0_id;
      `H2A_CH0_CTRL              : host_axi_rdata <= reg_h2a_ch0_ctrl;
      `H2A_CH0_STAT              : host_axi_rdata <= reg_h2a_ch0_stat;
      `H2A_CH0_STAT_RC           : host_axi_rdata <= reg_h2a_ch0_stat;
      `H2A_CH0_CMP_DSC_CNT       : host_axi_rdata <= reg_h2a_ch0_cmp_dsc_cnt;
      `H2A_CH0_ALIGN             : host_axi_rdata <= reg_h2a_ch0_align;
      `H2A_CH0_WB_SIZE           : host_axi_rdata <= reg_h2a_ch0_wb_size;
      `H2A_CH0_WB_ADDR_LO        : host_axi_rdata <= reg_h2a_ch0_wb_addr_lo;
      `H2A_CH0_WB_ADDR_HI        : host_axi_rdata <= reg_h2a_ch0_wb_addr_hi;
      `H2A_CH0_INTR_EN_MASK      : host_axi_rdata <= reg_h2a_ch0_intr_en_mask;
      `H2A_CH0_PERF_MON_CTRL     : host_axi_rdata <= reg_h2a_ch0_perf_mon_ctrl;
      `H2A_CH0_PERF_CYC_CNT_LO   : host_axi_rdata <= reg_h2a_ch0_perf_cyc_cnt_lo;
      `H2A_CH0_PERF_CYC_CNT_HI   : host_axi_rdata <= reg_h2a_ch0_perf_cyc_cnt_hi;
      `H2A_CH0_PERF_DATA_CNT_LO  : host_axi_rdata <= reg_h2a_ch0_perf_data_cnt_lo;
      `H2A_CH0_PERF_DATA_CNT_HI  : host_axi_rdata <= reg_h2a_ch0_perf_data_cnt_hi;
      `H2A_CH1_ID                : host_axi_rdata <= reg_h2a_ch1_id;
      `H2A_CH1_CTRL              : host_axi_rdata <= reg_h2a_ch1_ctrl;
      `H2A_CH1_STAT              : host_axi_rdata <= reg_h2a_ch1_stat;
      `H2A_CH1_STAT_RC           : host_axi_rdata <= reg_h2a_ch1_stat;
      `H2A_CH1_CMP_DSC_CNT       : host_axi_rdata <= reg_h2a_ch1_cmp_dsc_cnt;
      `H2A_CH1_ALIGN             : host_axi_rdata <= reg_h2a_ch1_align;
      `H2A_CH1_WB_SIZE           : host_axi_rdata <= reg_h2a_ch1_wb_size;
      `H2A_CH1_WB_ADDR_LO        : host_axi_rdata <= reg_h2a_ch1_wb_addr_lo;
      `H2A_CH1_WB_ADDR_HI        : host_axi_rdata <= reg_h2a_ch1_wb_addr_hi;
      `H2A_CH1_INTR_EN_MASK      : host_axi_rdata <= reg_h2a_ch1_intr_en_mask;
      `H2A_CH1_PERF_MON_CTRL     : host_axi_rdata <= reg_h2a_ch1_perf_mon_ctrl;
      `H2A_CH1_PERF_CYC_CNT_LO   : host_axi_rdata <= reg_h2a_ch1_perf_cyc_cnt_lo;
      `H2A_CH1_PERF_CYC_CNT_HI   : host_axi_rdata <= reg_h2a_ch1_perf_cyc_cnt_hi;
      `H2A_CH1_PERF_DATA_CNT_LO  : host_axi_rdata <= reg_h2a_ch1_perf_data_cnt_lo;
      `H2A_CH1_PERF_DATA_CNT_HI  : host_axi_rdata <= reg_h2a_ch1_perf_data_cnt_hi;
      `H2A_CH2_ID                : host_axi_rdata <= reg_h2a_ch2_id;
      `H2A_CH2_CTRL              : host_axi_rdata <= reg_h2a_ch2_ctrl;
      `H2A_CH2_STAT              : host_axi_rdata <= reg_h2a_ch2_stat;
      `H2A_CH2_STAT_RC           : host_axi_rdata <= reg_h2a_ch2_stat;
      `H2A_CH2_CMP_DSC_CNT       : host_axi_rdata <= reg_h2a_ch2_cmp_dsc_cnt;
      `H2A_CH2_ALIGN             : host_axi_rdata <= reg_h2a_ch2_align;
      `H2A_CH2_WB_SIZE           : host_axi_rdata <= reg_h2a_ch2_wb_size;
      `H2A_CH2_WB_ADDR_LO        : host_axi_rdata <= reg_h2a_ch2_wb_addr_lo;
      `H2A_CH2_WB_ADDR_HI        : host_axi_rdata <= reg_h2a_ch2_wb_addr_hi;
      `H2A_CH2_INTR_EN_MASK      : host_axi_rdata <= reg_h2a_ch2_intr_en_mask;
      `H2A_CH2_PERF_MON_CTRL     : host_axi_rdata <= reg_h2a_ch2_perf_mon_ctrl;
      `H2A_CH2_PERF_CYC_CNT_LO   : host_axi_rdata <= reg_h2a_ch2_perf_cyc_cnt_lo;
      `H2A_CH2_PERF_CYC_CNT_HI   : host_axi_rdata <= reg_h2a_ch2_perf_cyc_cnt_hi;
      `H2A_CH2_PERF_DATA_CNT_LO  : host_axi_rdata <= reg_h2a_ch2_perf_data_cnt_lo;
      `H2A_CH2_PERF_DATA_CNT_HI  : host_axi_rdata <= reg_h2a_ch2_perf_data_cnt_hi;
      `H2A_CH3_ID                : host_axi_rdata <= reg_h2a_ch3_id;
      `H2A_CH3_CTRL              : host_axi_rdata <= reg_h2a_ch3_ctrl;
      `H2A_CH3_STAT              : host_axi_rdata <= reg_h2a_ch3_stat;
      `H2A_CH3_STAT_RC           : host_axi_rdata <= reg_h2a_ch3_stat;
      `H2A_CH3_CMP_DSC_CNT       : host_axi_rdata <= reg_h2a_ch3_cmp_dsc_cnt;
      `H2A_CH3_ALIGN             : host_axi_rdata <= reg_h2a_ch3_align;
      `H2A_CH3_WB_SIZE           : host_axi_rdata <= reg_h2a_ch3_wb_size;
      `H2A_CH3_WB_ADDR_LO        : host_axi_rdata <= reg_h2a_ch3_wb_addr_lo;
      `H2A_CH3_WB_ADDR_HI        : host_axi_rdata <= reg_h2a_ch3_wb_addr_hi;
      `H2A_CH3_INTR_EN_MASK      : host_axi_rdata <= reg_h2a_ch3_intr_en_mask;
      `H2A_CH3_PERF_MON_CTRL     : host_axi_rdata <= reg_h2a_ch3_perf_mon_ctrl;
      `H2A_CH3_PERF_CYC_CNT_LO   : host_axi_rdata <= reg_h2a_ch3_perf_cyc_cnt_lo;
      `H2A_CH3_PERF_CYC_CNT_HI   : host_axi_rdata <= reg_h2a_ch3_perf_cyc_cnt_hi;
      `H2A_CH3_PERF_DATA_CNT_LO  : host_axi_rdata <= reg_h2a_ch3_perf_data_cnt_lo;
      `H2A_CH3_PERF_DATA_CNT_HI  : host_axi_rdata <= reg_h2a_ch3_perf_data_cnt_hi;
      `A2H_CH0_ID                : host_axi_rdata <= reg_a2h_ch0_id;
      `A2H_CH0_CTRL              : host_axi_rdata <= reg_a2h_ch0_ctrl;
      `A2H_CH0_STAT              : host_axi_rdata <= reg_a2h_ch0_stat;
      `A2H_CH0_STAT_RC           : host_axi_rdata <= reg_a2h_ch0_stat;
      `A2H_CH0_CMP_DSC_CNT       : host_axi_rdata <= reg_a2h_ch0_cmp_dsc_cnt;
      `A2H_CH0_ALIGN             : host_axi_rdata <= reg_a2h_ch0_align;
      `A2H_CH0_WB_SIZE           : host_axi_rdata <= reg_a2h_ch0_wb_size;
      `A2H_CH0_WB_ADDR_LO        : host_axi_rdata <= reg_a2h_ch0_wb_addr_lo;
      `A2H_CH0_WB_ADDR_HI        : host_axi_rdata <= reg_a2h_ch0_wb_addr_hi;
      `A2H_CH0_INTR_EN_MASK      : host_axi_rdata <= reg_a2h_ch0_intr_en_mask;
      `A2H_CH0_PERF_MON_CTRL     : host_axi_rdata <= reg_a2h_ch0_perf_mon_ctrl;
      `A2H_CH0_PERF_CYC_CNT_LO   : host_axi_rdata <= reg_a2h_ch0_perf_cyc_cnt_lo;
      `A2H_CH0_PERF_CYC_CNT_HI   : host_axi_rdata <= reg_a2h_ch0_perf_cyc_cnt_hi;
      `A2H_CH0_PERF_DATA_CNT_LO  : host_axi_rdata <= reg_a2h_ch0_perf_data_cnt_lo;
      `A2H_CH0_PERF_DATA_CNT_HI  : host_axi_rdata <= reg_a2h_ch0_perf_data_cnt_hi;
      `A2H_CH1_ID                : host_axi_rdata <= reg_a2h_ch1_id;
      `A2H_CH1_CTRL              : host_axi_rdata <= reg_a2h_ch1_ctrl;
      `A2H_CH1_STAT              : host_axi_rdata <= reg_a2h_ch1_stat;
      `A2H_CH1_STAT_RC           : host_axi_rdata <= reg_a2h_ch1_stat;
      `A2H_CH1_CMP_DSC_CNT       : host_axi_rdata <= reg_a2h_ch1_cmp_dsc_cnt;
      `A2H_CH1_ALIGN             : host_axi_rdata <= reg_a2h_ch1_align;
      `A2H_CH1_WB_SIZE           : host_axi_rdata <= reg_a2h_ch1_wb_size;
      `A2H_CH1_WB_ADDR_LO        : host_axi_rdata <= reg_a2h_ch1_wb_addr_lo;
      `A2H_CH1_WB_ADDR_HI        : host_axi_rdata <= reg_a2h_ch1_wb_addr_hi;
      `A2H_CH1_INTR_EN_MASK      : host_axi_rdata <= reg_a2h_ch1_intr_en_mask;
      `A2H_CH1_PERF_MON_CTRL     : host_axi_rdata <= reg_a2h_ch1_perf_mon_ctrl;
      `A2H_CH1_PERF_CYC_CNT_LO   : host_axi_rdata <= reg_a2h_ch1_perf_cyc_cnt_lo;
      `A2H_CH1_PERF_CYC_CNT_HI   : host_axi_rdata <= reg_a2h_ch1_perf_cyc_cnt_hi;
      `A2H_CH1_PERF_DATA_CNT_LO  : host_axi_rdata <= reg_a2h_ch1_perf_data_cnt_lo;
      `A2H_CH1_PERF_DATA_CNT_HI  : host_axi_rdata <= reg_a2h_ch1_perf_data_cnt_hi;
      `A2H_CH2_ID                : host_axi_rdata <= reg_a2h_ch2_id;
      `A2H_CH2_CTRL              : host_axi_rdata <= reg_a2h_ch2_ctrl;
      `A2H_CH2_STAT              : host_axi_rdata <= reg_a2h_ch2_stat;
      `A2H_CH2_STAT_RC           : host_axi_rdata <= reg_a2h_ch2_stat;
      `A2H_CH2_CMP_DSC_CNT       : host_axi_rdata <= reg_a2h_ch2_cmp_dsc_cnt;
      `A2H_CH2_ALIGN             : host_axi_rdata <= reg_a2h_ch2_align;
      `A2H_CH2_WB_SIZE           : host_axi_rdata <= reg_a2h_ch2_wb_size;
      `A2H_CH2_WB_ADDR_LO        : host_axi_rdata <= reg_a2h_ch2_wb_addr_lo;
      `A2H_CH2_WB_ADDR_HI        : host_axi_rdata <= reg_a2h_ch2_wb_addr_hi;
      `A2H_CH2_INTR_EN_MASK      : host_axi_rdata <= reg_a2h_ch2_intr_en_mask;
      `A2H_CH2_PERF_MON_CTRL     : host_axi_rdata <= reg_a2h_ch2_perf_mon_ctrl;
      `A2H_CH2_PERF_CYC_CNT_LO   : host_axi_rdata <= reg_a2h_ch2_perf_cyc_cnt_lo;
      `A2H_CH2_PERF_CYC_CNT_HI   : host_axi_rdata <= reg_a2h_ch2_perf_cyc_cnt_hi;
      `A2H_CH2_PERF_DATA_CNT_LO  : host_axi_rdata <= reg_a2h_ch2_perf_data_cnt_lo;
      `A2H_CH2_PERF_DATA_CNT_HI  : host_axi_rdata <= reg_a2h_ch2_perf_data_cnt_hi;
      `A2H_CH3_ID                : host_axi_rdata <= reg_a2h_ch3_id;
      `A2H_CH3_CTRL              : host_axi_rdata <= reg_a2h_ch3_ctrl;
      `A2H_CH3_STAT              : host_axi_rdata <= reg_a2h_ch3_stat;
      `A2H_CH3_STAT_RC           : host_axi_rdata <= reg_a2h_ch3_stat;
      `A2H_CH3_CMP_DSC_CNT       : host_axi_rdata <= reg_a2h_ch3_cmp_dsc_cnt;
      `A2H_CH3_ALIGN             : host_axi_rdata <= reg_a2h_ch3_align;
      `A2H_CH3_WB_SIZE           : host_axi_rdata <= reg_a2h_ch3_wb_size;
      `A2H_CH3_WB_ADDR_LO        : host_axi_rdata <= reg_a2h_ch3_wb_addr_lo;
      `A2H_CH3_WB_ADDR_HI        : host_axi_rdata <= reg_a2h_ch3_wb_addr_hi;
      `A2H_CH3_INTR_EN_MASK      : host_axi_rdata <= reg_a2h_ch3_intr_en_mask;
      `A2H_CH3_PERF_MON_CTRL     : host_axi_rdata <= reg_a2h_ch3_perf_mon_ctrl;
      `A2H_CH3_PERF_CYC_CNT_LO   : host_axi_rdata <= reg_a2h_ch3_perf_cyc_cnt_lo;
      `A2H_CH3_PERF_CYC_CNT_HI   : host_axi_rdata <= reg_a2h_ch3_perf_cyc_cnt_hi;
      `A2H_CH3_PERF_DATA_CNT_LO  : host_axi_rdata <= reg_a2h_ch3_perf_data_cnt_lo;
      `A2H_CH3_PERF_DATA_CNT_HI  : host_axi_rdata <= reg_a2h_ch3_perf_data_cnt_hi;
      `INTR_ID                   : host_axi_rdata <= reg_intr_id;
      `INTR_USER_EN_MASK         : host_axi_rdata <= reg_intr_user_en_mask;
      `INTR_CHNL_EN_MASK         : host_axi_rdata <= reg_intr_chnl_en_mask;
      `INTR_USER_REQ             : host_axi_rdata <= reg_intr_user_req;
      `INTR_CHNL_REQ             : host_axi_rdata <= reg_intr_chnl_req;
      `INTR_USER_PENDING         : host_axi_rdata <= reg_intr_user_pending;
      `INTR_CHNL_PENDING         : host_axi_rdata <= reg_intr_chnl_pending;
      `INTR_CH0_OBJ_HANDLE_LO    : host_axi_rdata <= reg_intr_ch0_obj_handle_lo;
      `INTR_CH0_OBJ_HANDLE_HI    : host_axi_rdata <= reg_intr_ch0_obj_handle_hi;
      `INTR_CH1_OBJ_HANDLE_LO    : host_axi_rdata <= reg_intr_ch1_obj_handle_lo;
      `INTR_CH1_OBJ_HANDLE_HI    : host_axi_rdata <= reg_intr_ch1_obj_handle_hi;
      `INTR_CH2_OBJ_HANDLE_LO    : host_axi_rdata <= reg_intr_ch2_obj_handle_lo;
      `INTR_CH2_OBJ_HANDLE_HI    : host_axi_rdata <= reg_intr_ch2_obj_handle_hi;
      `INTR_CH3_OBJ_HANDLE_LO    : host_axi_rdata <= reg_intr_ch3_obj_handle_lo;
      `INTR_CH3_OBJ_HANDLE_HI    : host_axi_rdata <= reg_intr_ch3_obj_handle_hi;
      `CFG_ID                    : host_axi_rdata <= reg_cfg_id;
      `CFG_AXI_MAX_WR_SIZE       : host_axi_rdata <= reg_cfg_axi_max_wr_size;
      `CFG_AXI_MAX_RD_SIZE       : host_axi_rdata <= reg_cfg_axi_max_rd_size;
      `CFG_AXI_WR_FLUSH_TIMEOUT  : host_axi_rdata <= reg_cfg_axi_wr_flush_timeout;
      `H2A_CH0_DMA_ID            : host_axi_rdata <= reg_h2a_ch0_dma_id;
      `H2A_CH0_DMA_DSC_ADDR_LO   : host_axi_rdata <= reg_h2a_ch0_dma_dsc_addr_lo;
      `H2A_CH0_DMA_DSC_ADDR_HI   : host_axi_rdata <= reg_h2a_ch0_dma_dsc_addr_hi;
      `H2A_CH0_DMA_DSC_ADJ       : host_axi_rdata <= reg_h2a_ch0_dma_dsc_adj;
      `H2A_CH0_DMA_DSC_CREDIT    : host_axi_rdata <= reg_h2a_ch0_dma_dsc_credit;
      `H2A_CH1_DMA_ID            : host_axi_rdata <= reg_h2a_ch1_dma_id;
      `H2A_CH1_DMA_DSC_ADDR_LO   : host_axi_rdata <= reg_h2a_ch1_dma_dsc_addr_lo;
      `H2A_CH1_DMA_DSC_ADDR_HI   : host_axi_rdata <= reg_h2a_ch1_dma_dsc_addr_hi;
      `H2A_CH1_DMA_DSC_ADJ       : host_axi_rdata <= reg_h2a_ch1_dma_dsc_adj;
      `H2A_CH1_DMA_DSC_CREDIT    : host_axi_rdata <= reg_h2a_ch1_dma_dsc_credit;
      `H2A_CH2_DMA_ID            : host_axi_rdata <= reg_h2a_ch2_dma_id;
      `H2A_CH2_DMA_DSC_ADDR_LO   : host_axi_rdata <= reg_h2a_ch2_dma_dsc_addr_lo;
      `H2A_CH2_DMA_DSC_ADDR_HI   : host_axi_rdata <= reg_h2a_ch2_dma_dsc_addr_hi;
      `H2A_CH2_DMA_DSC_ADJ       : host_axi_rdata <= reg_h2a_ch2_dma_dsc_adj;
      `H2A_CH2_DMA_DSC_CREDIT    : host_axi_rdata <= reg_h2a_ch2_dma_dsc_credit;
      `H2A_CH3_DMA_ID            : host_axi_rdata <= reg_h2a_ch3_dma_id;
      `H2A_CH3_DMA_DSC_ADDR_LO   : host_axi_rdata <= reg_h2a_ch3_dma_dsc_addr_lo;
      `H2A_CH3_DMA_DSC_ADDR_HI   : host_axi_rdata <= reg_h2a_ch3_dma_dsc_addr_hi;
      `H2A_CH3_DMA_DSC_ADJ       : host_axi_rdata <= reg_h2a_ch3_dma_dsc_adj;
      `H2A_CH3_DMA_DSC_CREDIT    : host_axi_rdata <= reg_h2a_ch3_dma_dsc_credit;
      `A2H_CH0_DMA_ID            : host_axi_rdata <= reg_a2h_ch0_dma_id;
      `A2H_CH0_DMA_DSC_ADDR_LO   : host_axi_rdata <= reg_a2h_ch0_dma_dsc_addr_lo;
      `A2H_CH0_DMA_DSC_ADDR_HI   : host_axi_rdata <= reg_a2h_ch0_dma_dsc_addr_hi;
      `A2H_CH0_DMA_DSC_ADJ       : host_axi_rdata <= reg_a2h_ch0_dma_dsc_adj;
      `A2H_CH0_DMA_DSC_CREDIT    : host_axi_rdata <= reg_a2h_ch0_dma_dsc_credit;
      `A2H_CH1_DMA_ID            : host_axi_rdata <= reg_a2h_ch1_dma_id;
      `A2H_CH1_DMA_DSC_ADDR_LO   : host_axi_rdata <= reg_a2h_ch1_dma_dsc_addr_lo;
      `A2H_CH1_DMA_DSC_ADDR_HI   : host_axi_rdata <= reg_a2h_ch1_dma_dsc_addr_hi;
      `A2H_CH1_DMA_DSC_ADJ       : host_axi_rdata <= reg_a2h_ch1_dma_dsc_adj;
      `A2H_CH1_DMA_DSC_CREDIT    : host_axi_rdata <= reg_a2h_ch1_dma_dsc_credit;
      `A2H_CH2_DMA_ID            : host_axi_rdata <= reg_a2h_ch2_dma_id;
      `A2H_CH2_DMA_DSC_ADDR_LO   : host_axi_rdata <= reg_a2h_ch2_dma_dsc_addr_lo;
      `A2H_CH2_DMA_DSC_ADDR_HI   : host_axi_rdata <= reg_a2h_ch2_dma_dsc_addr_hi;
      `A2H_CH2_DMA_DSC_ADJ       : host_axi_rdata <= reg_a2h_ch2_dma_dsc_adj;
      `A2H_CH2_DMA_DSC_CREDIT    : host_axi_rdata <= reg_a2h_ch2_dma_dsc_credit;
      `A2H_CH3_DMA_ID            : host_axi_rdata <= reg_a2h_ch3_dma_id;
      `A2H_CH3_DMA_DSC_ADDR_LO   : host_axi_rdata <= reg_a2h_ch3_dma_dsc_addr_lo;
      `A2H_CH3_DMA_DSC_ADDR_HI   : host_axi_rdata <= reg_a2h_ch3_dma_dsc_addr_hi;
      `A2H_CH3_DMA_DSC_ADJ       : host_axi_rdata <= reg_a2h_ch3_dma_dsc_adj;
      `A2H_CH3_DMA_DSC_CREDIT    : host_axi_rdata <= reg_a2h_ch3_dma_dsc_credit;
      `DMA_COMMON_ID             : host_axi_rdata <= reg_dma_common_id;
      `DMA_COMMON_DSC_CTRL       : host_axi_rdata <= reg_dma_common_dsc_ctrl;
      `DMA_COMMON_DSC_CREDIT_EN  : host_axi_rdata <= reg_dma_common_dsc_credit_en;
      default                   : host_axi_rdata <= 32'hdeadbeef;
    endcase
end

// read data valid
assign h_s_axi_rvalid = host_axi_rvalid | rd_fsm_state_send_rd_rsp;
assign h_s_axi_rdata  = rd_fsm_state_send_rd_rsp ? byp_axi_rdata : host_axi_rdata;
assign h_s_axi_rresp  = rd_fsm_state_send_rd_rsp ? byp_axi_rresp : 2'd0;

//------------------------------------------------------------------------------
// Action Read Registers (Hold-off)
//------------------------------------------------------------------------------
assign a_s_axi_arready = 1'b0;
assign a_s_axi_rvalid  = 1'b0;
assign a_s_axi_rdata   = 32'b0;
assign a_s_axi_rresp   = 2'b0;
//------------------------------------------------------------------------------
// Action Write Registers (Hold-off)
//------------------------------------------------------------------------------
assign a_s_axi_awready = 1'b0;
assign a_s_axi_wready  = 1'b0;
assign a_s_axi_bvalid  = 1'b0;
assign a_s_axi_bresp   = 2'b0;
//------------------------------------------------------------------------------
// Registers outputs
//------------------------------------------------------------------------------
assign h2a_ch0_run = reg_h2a_ch0_ctrl[0];
assign h2a_ch1_run = reg_h2a_ch1_ctrl[0];
assign h2a_ch2_run = reg_h2a_ch2_ctrl[0];
assign h2a_ch3_run = reg_h2a_ch3_ctrl[0];
assign a2h_ch0_run = reg_a2h_ch0_ctrl[0];
assign a2h_ch1_run = reg_a2h_ch1_ctrl[0];
assign a2h_ch2_run = reg_a2h_ch2_ctrl[0];
assign a2h_ch3_run = reg_a2h_ch3_ctrl[0];

assign dsc_ch0_run = h2a_ch0_run | a2h_ch0_run;
assign dsc_ch1_run = h2a_ch1_run | a2h_ch1_run;
assign dsc_ch2_run = h2a_ch2_run | a2h_ch2_run;
assign dsc_ch3_run = h2a_ch3_run | a2h_ch3_run;

assign dsc_ch0_h2a = h2a_ch0_run;
assign dsc_ch1_h2a = h2a_ch1_run;
assign dsc_ch2_h2a = h2a_ch2_run;
assign dsc_ch3_h2a = h2a_ch3_run;

assign dsc_ch0_axi_st = h2a_ch0_run ? reg_h2a_ch0_id[15] : reg_a2h_ch0_id[15];
assign dsc_ch1_axi_st = h2a_ch1_run ? reg_h2a_ch1_id[15] : reg_a2h_ch1_id[15];
assign dsc_ch2_axi_st = h2a_ch2_run ? reg_h2a_ch2_id[15] : reg_a2h_ch2_id[15];
assign dsc_ch3_axi_st = h2a_ch3_run ? reg_h2a_ch3_id[15] : reg_a2h_ch3_id[15];

assign dsc_ch0_dsc_addr = h2a_ch0_run ? {reg_h2a_ch0_dma_dsc_addr_hi,reg_h2a_ch0_dma_dsc_addr_lo} : {reg_a2h_ch0_dma_dsc_addr_hi,reg_a2h_ch0_dma_dsc_addr_lo};
assign dsc_ch1_dsc_addr = h2a_ch1_run ? {reg_h2a_ch1_dma_dsc_addr_hi,reg_h2a_ch1_dma_dsc_addr_lo} : {reg_a2h_ch1_dma_dsc_addr_hi,reg_a2h_ch1_dma_dsc_addr_lo};
assign dsc_ch2_dsc_addr = h2a_ch2_run ? {reg_h2a_ch2_dma_dsc_addr_hi,reg_h2a_ch2_dma_dsc_addr_lo} : {reg_a2h_ch2_dma_dsc_addr_hi,reg_a2h_ch2_dma_dsc_addr_lo};
assign dsc_ch3_dsc_addr = h2a_ch3_run ? {reg_h2a_ch3_dma_dsc_addr_hi,reg_h2a_ch3_dma_dsc_addr_lo} : {reg_a2h_ch3_dma_dsc_addr_hi,reg_a2h_ch3_dma_dsc_addr_lo};

assign dsc_ch0_dsc_adj = h2a_ch0_run ? reg_h2a_ch0_dma_dsc_adj : reg_a2h_ch0_dma_dsc_adj;
assign dsc_ch1_dsc_adj = h2a_ch1_run ? reg_h2a_ch1_dma_dsc_adj : reg_a2h_ch1_dma_dsc_adj;
assign dsc_ch2_dsc_adj = h2a_ch2_run ? reg_h2a_ch2_dma_dsc_adj : reg_a2h_ch2_dma_dsc_adj;
assign dsc_ch3_dsc_adj = h2a_ch3_run ? reg_h2a_ch3_dma_dsc_adj : reg_a2h_ch3_dma_dsc_adj;

assign cmp_ch0_poll_wb_en = h2a_ch0_run ? reg_h2a_ch0_ctrl[26] : reg_a2h_ch0_ctrl[26];
assign cmp_ch1_poll_wb_en = h2a_ch1_run ? reg_h2a_ch1_ctrl[26] : reg_a2h_ch1_ctrl[26];
assign cmp_ch2_poll_wb_en = h2a_ch2_run ? reg_h2a_ch2_ctrl[26] : reg_a2h_ch2_ctrl[26];
assign cmp_ch3_poll_wb_en = h2a_ch3_run ? reg_h2a_ch3_ctrl[26] : reg_a2h_ch3_ctrl[26];

assign cmp_ch0_poll_wb_addr = h2a_ch0_run ? {reg_h2a_ch0_wb_addr_hi,reg_h2a_ch0_wb_addr_lo} : {reg_a2h_ch0_wb_addr_hi,reg_a2h_ch0_wb_addr_lo};
assign cmp_ch1_poll_wb_addr = h2a_ch1_run ? {reg_h2a_ch1_wb_addr_hi,reg_h2a_ch1_wb_addr_lo} : {reg_a2h_ch1_wb_addr_hi,reg_a2h_ch1_wb_addr_lo};
assign cmp_ch2_poll_wb_addr = h2a_ch2_run ? {reg_h2a_ch2_wb_addr_hi,reg_h2a_ch2_wb_addr_lo} : {reg_a2h_ch2_wb_addr_hi,reg_a2h_ch2_wb_addr_lo};
assign cmp_ch3_poll_wb_addr = h2a_ch3_run ? {reg_h2a_ch3_wb_addr_hi,reg_h2a_ch3_wb_addr_lo} : {reg_a2h_ch3_wb_addr_hi,reg_a2h_ch3_wb_addr_lo};

assign cmp_ch0_poll_wb_size = h2a_ch0_run ? reg_h2a_ch0_wb_size : reg_a2h_ch0_wb_size;
assign cmp_ch1_poll_wb_size = h2a_ch1_run ? reg_h2a_ch1_wb_size : reg_a2h_ch1_wb_size;
assign cmp_ch2_poll_wb_size = h2a_ch2_run ? reg_h2a_ch2_wb_size : reg_a2h_ch2_wb_size;
assign cmp_ch3_poll_wb_size = h2a_ch3_run ? reg_h2a_ch3_wb_size : reg_a2h_ch3_wb_size;

assign cmp_ch0_obj_handle = {reg_intr_ch0_obj_handle_hi, reg_intr_ch0_obj_handle_lo};
assign cmp_ch1_obj_handle = {reg_intr_ch1_obj_handle_hi, reg_intr_ch1_obj_handle_lo};
assign cmp_ch2_obj_handle = {reg_intr_ch2_obj_handle_hi, reg_intr_ch2_obj_handle_lo};
assign cmp_ch3_obj_handle = {reg_intr_ch3_obj_handle_hi, reg_intr_ch3_obj_handle_lo};

endmodule
