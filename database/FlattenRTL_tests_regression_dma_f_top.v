// This program was cloned from: https://github.com/HKUSTGZ-MICS-LYU/FlattenRTL
// License: MIT License

module dma_axi64_core0_top #(
parameter dma_axi64_core0_dma_axi64_core0_arbiter_rd_CH_LAST=1-1,
parameter dma_axi64_core0_dma_axi64_core0_arbiter_wr_CH_LAST=1-1,
parameter dma_axi64_core0_dma_axi64_core0_ctrl_rd_IDLE=3'd0,
parameter dma_axi64_core0_dma_axi64_core0_ctrl_rd_CMD=3'd1,
parameter dma_axi64_core0_dma_axi64_core0_ctrl_rd_WAIT_CLR=3'd2,
parameter dma_axi64_core0_dma_axi64_core0_ctrl_rd_WAIT_DELAY=3'd3,
parameter dma_axi64_core0_dma_axi64_core0_ctrl_rd_STALL=3'd4,
parameter dma_axi64_core0_dma_axi64_core0_ctrl_wr_IDLE=3'd0,
parameter dma_axi64_core0_dma_axi64_core0_ctrl_wr_CMD=3'd1,
parameter dma_axi64_core0_dma_axi64_core0_ctrl_wr_WAIT_CLR=3'd2,
parameter dma_axi64_core0_dma_axi64_core0_ctrl_wr_WAIT_DELAY=3'd3,
parameter dma_axi64_core0_dma_axi64_core0_ctrl_wr_STALL=3'd4,
parameter dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_DELAY=1,
parameter dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AXI_WORD_SIZE=0?2'b10:2'b11,
parameter dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AXI_3=0?2:3,
parameter dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_DELAY=1,
parameter dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_DELAY=1,
parameter dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_DELAY=1,
parameter dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_SIZE_BITS=4,
parameter dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_DELAY=2,
parameter dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_DELAY=1,
parameter dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_DELAY=1,
parameter dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_DELAY=1,
parameter dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_DELAY=1,
parameter dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_DELAY=1,
parameter dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_DELAY=2) (
  input clk,
  input reset,
  input scan_en,
  output idle,
  output [8*1-1:0] ch_int_all_proc,
  input [7:0] ch_start,
  input [3:0] clkdiv,
  input [31:1] periph_tx_req,
  output [31:1] periph_tx_clr,
  input [31:1] periph_rx_req,
  output [31:1] periph_rx_clr,
  input pclken,
  input psel,
  input penable,
  input [10:0] paddr,
  input pwrite,
  input [31:0] pwdata,
  output [31:0] prdata,
  output pslverr,
  output pready,
  output rd_port_num,
  output wr_port_num,
  input joint_mode,
  input joint_remote,
  input rd_prio_top,
  input rd_prio_high,
  input [2:0] rd_prio_top_num,
  input [2:0] rd_prio_high_num,
  input wr_prio_top,
  input wr_prio_high,
  input [2:0] wr_prio_top_num,
  input [2:0] wr_prio_high_num,
  output [31:0] AWADDR,
  output [4-1:0] AWLEN,
  output [2-1:0] AWSIZE,
  output AWVALID,
  input AWREADY,
  output [63:0] WDATA,
  output [64/8-1:0] WSTRB,
  output WLAST,
  output WVALID,
  input WREADY,
  input [1:0] BRESP,
  input BVALID,
  output BREADY,
  output [31:0] ARADDR,
  output [4-1:0] ARLEN,
  output [2-1:0] ARSIZE,
  output ARVALID,
  input ARREADY,
  input [63:0] RDATA,
  input [1:0] RRESP,
  input RLAST,
  input RVALID,
  output RREADY) ; 
   wire [31:0] slow_AWADDR ;  
   wire [4-1:0] slow_AWLEN ;  
   wire [2-1:0] slow_AWSIZE ;  
   wire slow_AWVALID ;  
   wire slow_AWREADY ;  
   wire [63:0] slow_WDATA ;  
   wire [64/8-1:0] slow_WSTRB ;  
   wire slow_WLAST ;  
   wire slow_WVALID ;  
   wire slow_WREADY ;  
   wire [1:0] slow_BRESP ;  
   wire slow_BVALID ;  
   wire slow_BREADY ;  
   wire [31:0] slow_ARADDR ;  
   wire [4-1:0] slow_ARLEN ;  
   wire [2-1:0] slow_ARSIZE ;  
   wire slow_ARVALID ;  
   wire slow_ARREADY ;  
   wire [63:0] slow_RDATA ;  
   wire [1:0] slow_RRESP ;  
   wire slow_RLAST ;  
   wire slow_RVALID ;  
   wire slow_RREADY ;  
   wire clk_out ;  
   wire clken ;  
   wire bypass ;  
  assign clk_out=clk; 
  assign clken=1'b1; 
  assign AWADDR=slow_AWADDR; 
  assign AWLEN=slow_AWLEN; 
  assign AWSIZE=slow_AWSIZE; 
  assign AWVALID=slow_AWVALID; 
  assign WDATA=slow_WDATA; 
  assign WSTRB=slow_WSTRB; 
  assign WLAST=slow_WLAST; 
  assign WVALID=slow_WVALID; 
  assign BREADY=slow_BREADY; 
  assign ARADDR=slow_ARADDR; 
  assign ARLEN=slow_ARLEN; 
  assign ARSIZE=slow_ARSIZE; 
  assign ARVALID=slow_ARVALID; 
  assign RREADY=slow_RREADY; 
  assign slow_AWREADY=AWREADY; 
  assign slow_WREADY=WREADY; 
  assign slow_BRESP=BRESP; 
  assign slow_BVALID=BVALID; 
  assign slow_ARREADY=ARREADY; 
  assign slow_RDATA=RDATA; 
  assign slow_RRESP=RRESP; 
  assign slow_RLAST=RLAST; 
  assign slow_RVALID=RVALID; 
  
wire  dma_axi64_core0_clk;
wire  dma_axi64_core0_reset;
wire  dma_axi64_core0_scan_en;
wire  dma_axi64_core0_idle;
wire [8*1-1:0] dma_axi64_core0_ch_int_all_proc;
wire [7:0] dma_axi64_core0_ch_start;
wire [31:1] dma_axi64_core0_periph_tx_req;
wire [31:1] dma_axi64_core0_periph_tx_clr;
wire [31:1] dma_axi64_core0_periph_rx_req;
wire [31:1] dma_axi64_core0_periph_rx_clr;
wire  dma_axi64_core0_pclk;
wire  dma_axi64_core0_clken;
wire  dma_axi64_core0_pclken;
wire  dma_axi64_core0_psel;
wire  dma_axi64_core0_penable;
wire [10:0] dma_axi64_core0_paddr;
wire  dma_axi64_core0_pwrite;
wire [31:0] dma_axi64_core0_pwdata;
wire [31:0] dma_axi64_core0_prdata;
wire  dma_axi64_core0_pslverr;
wire  dma_axi64_core0_rd_port_num;
wire  dma_axi64_core0_wr_port_num;
wire  dma_axi64_core0_joint_mode_in;
wire  dma_axi64_core0_joint_remote;
wire  dma_axi64_core0_rd_prio_top;
wire  dma_axi64_core0_rd_prio_high;
wire [2:0] dma_axi64_core0_rd_prio_top_num;
wire [2:0] dma_axi64_core0_rd_prio_high_num;
wire  dma_axi64_core0_wr_prio_top;
wire  dma_axi64_core0_wr_prio_high;
wire [2:0] dma_axi64_core0_wr_prio_top_num;
wire [2:0] dma_axi64_core0_wr_prio_high_num;
wire [31:0] dma_axi64_core0_AWADDR;
wire [4-1:0] dma_axi64_core0_AWLEN;
wire [2-1:0] dma_axi64_core0_AWSIZE;
wire  dma_axi64_core0_AWVALID;
wire  dma_axi64_core0_AWREADY;
wire [63:0] dma_axi64_core0_WDATA;
wire [64/8-1:0] dma_axi64_core0_WSTRB;
wire  dma_axi64_core0_WLAST;
wire  dma_axi64_core0_WVALID;
wire  dma_axi64_core0_WREADY;
wire [1:0] dma_axi64_core0_BRESP;
wire  dma_axi64_core0_BVALID;
wire  dma_axi64_core0_BREADY;
wire [31:0] dma_axi64_core0_ARADDR;
wire [4-1:0] dma_axi64_core0_ARLEN;
wire [2-1:0] dma_axi64_core0_ARSIZE;
wire  dma_axi64_core0_ARVALID;
wire  dma_axi64_core0_ARREADY;
wire [63:0] dma_axi64_core0_RDATA;
wire [1:0] dma_axi64_core0_RRESP;
wire  dma_axi64_core0_RLAST;
wire  dma_axi64_core0_RVALID;
wire  dma_axi64_core0_RREADY;
 
   wire  dma_axi64_core0_wdt_timeout  ; 
   wire[2:0]  dma_axi64_core0_wdt_ch_num  ; 
   wire  dma_axi64_core0_rd_ch_go_joint  ; 
   wire  dma_axi64_core0_rd_ch_go_null  ; 
   wire  dma_axi64_core0_rd_ch_go  ; 
   wire[2:0]  dma_axi64_core0_rd_ch_num  ; 
   wire  dma_axi64_core0_rd_ch_last  ; 
   wire  dma_axi64_core0_wr_ch_go_joint  ; 
   wire  dma_axi64_core0_wr_ch_go  ; 
   wire[2:0]  dma_axi64_core0_wr_ch_num_joint  ; 
   wire[2:0]  dma_axi64_core0_wr_ch_num  ; 
   wire  dma_axi64_core0_wr_ch_last  ; 
   wire  dma_axi64_core0_wr_ch_last_joint  ; 
   wire  dma_axi64_core0_load_req_in_prog  ; 
   wire[7:0]  dma_axi64_core0_ch_idle  ; 
   wire[7:0]  dma_axi64_core0_ch_active  ; 
   wire[7:0]  dma_axi64_core0_ch_active_joint  ; 
   wire[7:0]  dma_axi64_core0_ch_rd_active  ; 
   wire[7:0]  dma_axi64_core0_ch_wr_active  ; 
   wire  dma_axi64_core0_wr_last_cmd  ; 
   wire  dma_axi64_core0_rd_line_cmd  ; 
   wire  dma_axi64_core0_wr_line_cmd  ; 
   wire  dma_axi64_core0_rd_go_next_line  ; 
   wire  dma_axi64_core0_wr_go_next_line  ; 
   wire[7:0]  dma_axi64_core0_ch_rd_ready_joint  ; 
   wire[7:0]  dma_axi64_core0_ch_rd_ready  ; 
   wire  dma_axi64_core0_rd_ready  ; 
   wire  dma_axi64_core0_rd_ready_joint  ; 
   wire[32-1:0]  dma_axi64_core0_rd_burst_addr  ; 
   wire[8-1:0]  dma_axi64_core0_rd_burst_size  ; 
   wire[6-1:0]  dma_axi64_core0_rd_tokens  ; 
   wire[3-1:0]  dma_axi64_core0_rd_periph_delay  ; 
   wire  dma_axi64_core0_rd_clr_valid  ; 
   wire[2:0]  dma_axi64_core0_rd_transfer_num  ; 
   wire  dma_axi64_core0_rd_transfer  ; 
   wire[4-1:0]  dma_axi64_core0_rd_transfer_size  ; 
   wire  dma_axi64_core0_rd_clr_stall  ; 
   wire[7:0]  dma_axi64_core0_ch_wr_ready  ; 
   wire  dma_axi64_core0_wr_ready  ; 
   wire  dma_axi64_core0_wr_ready_joint  ; 
   wire[32-1:0]  dma_axi64_core0_wr_burst_addr  ; 
   wire[8-1:0]  dma_axi64_core0_wr_burst_size  ; 
   wire[6-1:0]  dma_axi64_core0_wr_tokens  ; 
   wire[3-1:0]  dma_axi64_core0_wr_periph_delay  ; 
   wire  dma_axi64_core0_wr_clr_valid  ; 
   wire  dma_axi64_core0_wr_clr_stall  ; 
   wire[7:0]  dma_axi64_core0_ch_joint_req  ; 
   wire  dma_axi64_core0_joint_req  ; 
   wire  dma_axi64_core0_joint_mode  ; 
   wire  dma_axi64_core0_joint_ch_go  ; 
   wire  dma_axi64_core0_joint_stall  ; 
   wire  dma_axi64_core0_rd_burst_start  ; 
   wire  dma_axi64_core0_rd_finish_joint  ; 
   wire  dma_axi64_core0_rd_finish  ; 
   wire  dma_axi64_core0_rd_ctrl_busy  ; 
   wire  dma_axi64_core0_wr_burst_start_joint  ; 
   wire  dma_axi64_core0_wr_burst_start  ; 
   wire  dma_axi64_core0_wr_finish  ; 
   wire  dma_axi64_core0_wr_ctrl_busy  ; 
   wire  dma_axi64_core0_wr_cmd_split  ; 
   wire[2:0]  dma_axi64_core0_wr_cmd_num  ; 
   wire  dma_axi64_core0_wr_cmd_pending_joint  ; 
   wire  dma_axi64_core0_wr_cmd_pending  ; 
   wire  dma_axi64_core0_wr_cmd_full_joint  ; 
   wire  dma_axi64_core0_ch_fifo_rd  ; 
   wire[4-1:0]  dma_axi64_core0_ch_fifo_rsize  ; 
   wire[2:0]  dma_axi64_core0_ch_fifo_rd_num  ; 
   wire[2:0]  dma_axi64_core0_wr_transfer_num  ; 
   wire  dma_axi64_core0_wr_transfer  ; 
   wire[4-1:0]  dma_axi64_core0_wr_transfer_size  ; 
   wire[4-1:0]  dma_axi64_core0_wr_next_size  ; 
   wire  dma_axi64_core0_wr_clr_line  ; 
   wire[2:0]  dma_axi64_core0_wr_clr_line_num  ; 
   wire  dma_axi64_core0_wr_cmd_full  ; 
   wire  dma_axi64_core0_wr_slverr  ; 
   wire  dma_axi64_core0_wr_decerr  ; 
   wire  dma_axi64_core0_wr_clr  ; 
   wire  dma_axi64_core0_wr_clr_last  ; 
   wire[2:0]  dma_axi64_core0_wr_ch_num_resp  ; 
   wire  dma_axi64_core0_timeout_aw  ; 
   wire  dma_axi64_core0_timeout_w  ; 
   wire[2:0]  dma_axi64_core0_timeout_num_aw  ; 
   wire[2:0]  dma_axi64_core0_timeout_num_w  ; 
   wire  dma_axi64_core0_wr_hold_ctrl  ; 
   wire  dma_axi64_core0_wr_hold  ; 
   wire  dma_axi64_core0_joint_in_prog  ; 
   wire  dma_axi64_core0_joint_not_in_prog  ; 
   wire  dma_axi64_core0_joint_mux_in_prog  ; 
   wire  dma_axi64_core0_wr_page_cross  ; 
   wire  dma_axi64_core0_load_wr  ; 
   wire[2:0]  dma_axi64_core0_load_wr_num  ; 
   wire[1:0]  dma_axi64_core0_load_wr_cycle  ; 
   wire[64-1:0]  dma_axi64_core0_load_wdata  ; 
   wire  dma_axi64_core0_rd_cmd_split  ; 
   wire  dma_axi64_core0_rd_cmd_line  ; 
   wire[2:0]  dma_axi64_core0_rd_cmd_num  ; 
   wire  dma_axi64_core0_rd_cmd_pending_joint  ; 
   wire  dma_axi64_core0_rd_cmd_pending  ; 
   wire  dma_axi64_core0_rd_cmd_full_joint  ; 
   wire  dma_axi64_core0_ch_fifo_wr  ; 
   wire[64-1:0]  dma_axi64_core0_ch_fifo_wdata  ; 
   wire[4-1:0]  dma_axi64_core0_ch_fifo_wsize  ; 
   wire[2:0]  dma_axi64_core0_ch_fifo_wr_num  ; 
   wire  dma_axi64_core0_rd_clr_line  ; 
   wire[2:0]  dma_axi64_core0_rd_clr_line_num  ; 
   wire  dma_axi64_core0_rd_burst_cmd  ; 
   wire  dma_axi64_core0_rd_cmd_full  ; 
   wire  dma_axi64_core0_rd_slverr  ; 
   wire  dma_axi64_core0_rd_decerr  ; 
   wire  dma_axi64_core0_rd_clr  ; 
   wire  dma_axi64_core0_rd_clr_last  ; 
   wire  dma_axi64_core0_rd_clr_load  ; 
   wire[2:0]  dma_axi64_core0_rd_ch_num_resp  ; 
   wire  dma_axi64_core0_timeout_ar  ; 
   wire[2:0]  dma_axi64_core0_timeout_num_ar  ; 
   wire  dma_axi64_core0_rd_hold_joint  ; 
   wire  dma_axi64_core0_rd_hold_ctrl  ; 
   wire  dma_axi64_core0_rd_hold  ; 
   wire  dma_axi64_core0_joint_hold  ; 
   wire  dma_axi64_core0_rd_page_cross  ; 
   wire  dma_axi64_core0_joint_page_cross  ; 
   wire  dma_axi64_core0_rd_arbiter_en  ; 
   wire  dma_axi64_core0_wr_arbiter_en  ; 
   wire  dma_axi64_core0_rd_cmd_port  ; 
   wire  dma_axi64_core0_wr_cmd_port  ; 
   wire[64-1:0]  dma_axi64_core0_ch_fifo_rdata  ; 
   wire  dma_axi64_core0_ch_fifo_rd_valid  ; 
   wire  dma_axi64_core0_ch_fifo_wr_ready  ; 
   wire  dma_axi64_core0_FIFO_WR  ; 
   wire  dma_axi64_core0_FIFO_RD  ; 
   wire[3+5-3-1:0]  dma_axi64_core0_FIFO_WR_ADDR  ; 
   wire[3+5-3-1:0]  dma_axi64_core0_FIFO_RD_ADDR  ; 
   wire[64-1:0]  dma_axi64_core0_FIFO_DIN  ; 
   wire[8-1:0]  dma_axi64_core0_FIFO_BSEL  ; 
   wire[64-1:0]  dma_axi64_core0_FIFO_DOUT  ; 
   wire  dma_axi64_core0_clk_en  ; 
   wire  dma_axi64_core0_gclk  ; 
  assign   dma_axi64_core0_joint_mode  =  dma_axi64_core0_joint_mode_in  &1'b1; 
  assign   dma_axi64_core0_rd_arbiter_en  =1'b1; 
  assign   dma_axi64_core0_wr_arbiter_en  =!  dma_axi64_core0_joint_mode  ; 
  assign   dma_axi64_core0_rd_ready  =  dma_axi64_core0_ch_rd_ready  [  dma_axi64_core0_rd_ch_num  ]; 
  assign   dma_axi64_core0_wr_ready  =  dma_axi64_core0_ch_wr_ready  [  dma_axi64_core0_wr_ch_num_joint  ]; 
  assign   dma_axi64_core0_rd_ready_joint  =  dma_axi64_core0_joint_mode  &  dma_axi64_core0_joint_req   ?   dma_axi64_core0_rd_ready  &  dma_axi64_core0_wr_ready  :  dma_axi64_core0_rd_ready  ; 
  assign   dma_axi64_core0_wr_ready_joint  =  dma_axi64_core0_joint_mode  &  dma_axi64_core0_joint_req   ?   dma_axi64_core0_rd_ready  &  dma_axi64_core0_wr_ready  :  dma_axi64_core0_wr_ready  ; 
  assign   dma_axi64_core0_ch_active_joint  =  dma_axi64_core0_joint_mode   ?   dma_axi64_core0_ch_rd_active  |  dma_axi64_core0_ch_wr_active  :  dma_axi64_core0_ch_rd_active  ; 
  assign   dma_axi64_core0_joint_page_cross  =(  dma_axi64_core0_rd_page_cross  &  dma_axi64_core0_rd_ready  )|(  dma_axi64_core0_wr_page_cross  &  dma_axi64_core0_wr_ready  ); 
  assign   dma_axi64_core0_joint_req  =  dma_axi64_core0_ch_joint_req  [  dma_axi64_core0_rd_ch_num  ]; 
  assign   dma_axi64_core0_ch_rd_ready_joint  =  dma_axi64_core0_joint_mode   ? (  dma_axi64_core0_ch_joint_req  &  dma_axi64_core0_ch_rd_ready  &  dma_axi64_core0_ch_wr_ready  )|((~  dma_axi64_core0_ch_joint_req  )&(  dma_axi64_core0_ch_rd_ready  |  dma_axi64_core0_ch_wr_ready  )):  dma_axi64_core0_ch_rd_ready  ; 
  assign   dma_axi64_core0_wr_burst_start_joint  =  dma_axi64_core0_joint_mode  &  dma_axi64_core0_joint_req   ?   dma_axi64_core0_rd_burst_start  :  dma_axi64_core0_wr_burst_start  ; 
  assign   dma_axi64_core0_joint_hold  =  dma_axi64_core0_joint_mux_in_prog  |(  dma_axi64_core0_joint_in_prog  &(~  dma_axi64_core0_joint_req  ))|(  dma_axi64_core0_joint_not_in_prog  &  dma_axi64_core0_joint_req  )|  dma_axi64_core0_joint_stall  |(  dma_axi64_core0_joint_req  &  dma_axi64_core0_joint_page_cross  ); 
  assign   dma_axi64_core0_rd_hold_ctrl  =  dma_axi64_core0_joint_mode   ?   dma_axi64_core0_rd_hold  |  dma_axi64_core0_joint_hold  |(  dma_axi64_core0_joint_in_prog  &  dma_axi64_core0_wr_hold  ):  dma_axi64_core0_rd_hold  ; 
  assign   dma_axi64_core0_rd_hold_joint  =  dma_axi64_core0_joint_mode  &(  dma_axi64_core0_rd_hold_ctrl  |  dma_axi64_core0_rd_ctrl_busy  |  dma_axi64_core0_wr_ctrl_busy  ); 
  assign   dma_axi64_core0_wr_hold_ctrl  =  dma_axi64_core0_joint_mode  &(  dma_axi64_core0_joint_req  |  dma_axi64_core0_joint_in_prog  ) ?   dma_axi64_core0_wr_hold  |  dma_axi64_core0_joint_hold  :  dma_axi64_core0_wr_hold  ; 
  assign   dma_axi64_core0_rd_ch_go_joint  =  dma_axi64_core0_rd_ch_go  &  dma_axi64_core0_ch_rd_ready  [  dma_axi64_core0_rd_ch_num  ]&(~  dma_axi64_core0_rd_ctrl_busy  ); 
  assign   dma_axi64_core0_wr_ch_go_joint  =  dma_axi64_core0_joint_mode   ? (  dma_axi64_core0_wr_ready  &(~  dma_axi64_core0_wr_ctrl_busy  )&(  dma_axi64_core0_joint_req   ?   dma_axi64_core0_rd_ch_go_joint  :  dma_axi64_core0_rd_ch_go  &(~  dma_axi64_core0_rd_ch_go_joint  ))):  dma_axi64_core0_wr_ch_go  ; 
  assign   dma_axi64_core0_rd_ch_go_null  =  dma_axi64_core0_rd_ch_go  &(~  dma_axi64_core0_rd_ch_go_joint  )&(  dma_axi64_core0_joint_mode   ? (~  dma_axi64_core0_wr_ch_go_joint  ):1'b1); 
  assign   dma_axi64_core0_wr_ch_num_joint  =  dma_axi64_core0_joint_mode   ?   dma_axi64_core0_rd_ch_num  :  dma_axi64_core0_wr_ch_num  ; 
  assign   dma_axi64_core0_wr_ch_last_joint  =  dma_axi64_core0_joint_mode   ?   dma_axi64_core0_rd_ch_last  :  dma_axi64_core0_wr_ch_last  ; 
  assign   dma_axi64_core0_rd_finish_joint  =  dma_axi64_core0_joint_mode   ?   dma_axi64_core0_rd_finish  |  dma_axi64_core0_wr_finish  |  dma_axi64_core0_rd_ch_go_null  :  dma_axi64_core0_rd_finish  |  dma_axi64_core0_rd_ch_go_null  ; 
  assign   dma_axi64_core0_rd_cmd_full_joint  =  dma_axi64_core0_joint_mode  &  dma_axi64_core0_joint_req   ?   dma_axi64_core0_wr_cmd_full  |  dma_axi64_core0_rd_cmd_full  :  dma_axi64_core0_rd_cmd_full  ; 
  assign   dma_axi64_core0_wr_cmd_full_joint  =  dma_axi64_core0_joint_mode  &  dma_axi64_core0_joint_req   ?   dma_axi64_core0_wr_cmd_full  |  dma_axi64_core0_rd_cmd_full  :  dma_axi64_core0_wr_cmd_full  ; 
  assign   dma_axi64_core0_rd_cmd_pending_joint  =  dma_axi64_core0_joint_mode   ?   dma_axi64_core0_rd_cmd_pending  |  dma_axi64_core0_wr_cmd_pending  :  dma_axi64_core0_rd_cmd_pending  ; 
  assign   dma_axi64_core0_wr_cmd_pending_joint  =  dma_axi64_core0_joint_mode  &  dma_axi64_core0_joint_req   ?   dma_axi64_core0_rd_cmd_pending  |  dma_axi64_core0_wr_cmd_pending  :  dma_axi64_core0_wr_cmd_pending  ; 
  assign   dma_axi64_core0_idle  =&  dma_axi64_core0_ch_idle  ; 
  assign   dma_axi64_core0_gclk  =  dma_axi64_core0_clk  ;  
  
wire  dma_axi64_core0_dma_axi64_core0_wdt_clk;
wire  dma_axi64_core0_dma_axi64_core0_wdt_reset;
wire [7:0] dma_axi64_core0_dma_axi64_core0_wdt_ch_active;
wire  dma_axi64_core0_dma_axi64_core0_wdt_rd_burst_start;
wire [2:0] dma_axi64_core0_dma_axi64_core0_wdt_rd_ch_num;
wire  dma_axi64_core0_dma_axi64_core0_wdt_wr_burst_start;
wire [2:0] dma_axi64_core0_dma_axi64_core0_wdt_wr_ch_num;
wire  dma_axi64_core0_dma_axi64_core0_wdt_wdt_timeout;
reg [2:0] dma_axi64_core0_dma_axi64_core0_wdt_wdt_ch_num;
 
   reg[11-1:0]  dma_axi64_core0_dma_axi64_core0_wdt_counter  ; 
   wire  dma_axi64_core0_dma_axi64_core0_wdt_current_ch_active  ; 
   wire  dma_axi64_core0_dma_axi64_core0_wdt_current_burst_start  ; 
   wire  dma_axi64_core0_dma_axi64_core0_wdt_advance  ; 
   wire  dma_axi64_core0_dma_axi64_core0_wdt_idle  ; 
  assign   dma_axi64_core0_dma_axi64_core0_wdt_idle  =  dma_axi64_core0_dma_axi64_core0_wdt_ch_active  ==8'd0; 
  assign   dma_axi64_core0_dma_axi64_core0_wdt_current_ch_active  =  dma_axi64_core0_dma_axi64_core0_wdt_ch_active  [  dma_axi64_core0_dma_axi64_core0_wdt_wdt_ch_num  ]; 
  assign   dma_axi64_core0_dma_axi64_core0_wdt_current_burst_start  =(  dma_axi64_core0_dma_axi64_core0_wdt_rd_burst_start  &(  dma_axi64_core0_dma_axi64_core0_wdt_rd_ch_num  ==  dma_axi64_core0_dma_axi64_core0_wdt_wdt_ch_num  ))|(  dma_axi64_core0_dma_axi64_core0_wdt_wr_burst_start  &(  dma_axi64_core0_dma_axi64_core0_wdt_wr_ch_num  ==  dma_axi64_core0_dma_axi64_core0_wdt_wdt_ch_num  )); 
  assign   dma_axi64_core0_dma_axi64_core0_wdt_advance  =(!  dma_axi64_core0_dma_axi64_core0_wdt_current_ch_active  )|  dma_axi64_core0_dma_axi64_core0_wdt_current_burst_start  |  dma_axi64_core0_dma_axi64_core0_wdt_wdt_timeout  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_wdt_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_wdt_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_wdt_reset  ) 
           dma_axi64_core0_dma_axi64_core0_wdt_wdt_ch_num   <=3'd0;
        else 
          if (  dma_axi64_core0_dma_axi64_core0_wdt_advance  ) 
              dma_axi64_core0_dma_axi64_core0_wdt_wdt_ch_num   <=  dma_axi64_core0_dma_axi64_core0_wdt_wdt_ch_num  +1'b1;
 
  assign   dma_axi64_core0_dma_axi64_core0_wdt_wdt_timeout  =(  dma_axi64_core0_dma_axi64_core0_wdt_counter  =='d0); 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_wdt_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_wdt_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_wdt_reset  ) 
           dma_axi64_core0_dma_axi64_core0_wdt_counter   <={11{1'b1}};
        else 
          if (  dma_axi64_core0_dma_axi64_core0_wdt_advance  |  dma_axi64_core0_dma_axi64_core0_wdt_idle  ) 
              dma_axi64_core0_dma_axi64_core0_wdt_counter   <={11{1'b1}};
           else  
              dma_axi64_core0_dma_axi64_core0_wdt_counter   <=  dma_axi64_core0_dma_axi64_core0_wdt_counter  -1'b1;

assign dma_axi64_core0_dma_axi64_core0_wdt_clk = dma_axi64_core0_gclk;
assign dma_axi64_core0_dma_axi64_core0_wdt_reset = dma_axi64_core0_reset;
assign dma_axi64_core0_dma_axi64_core0_wdt_ch_active = dma_axi64_core0_ch_active;
assign dma_axi64_core0_dma_axi64_core0_wdt_rd_burst_start = dma_axi64_core0_rd_burst_start;
assign dma_axi64_core0_dma_axi64_core0_wdt_rd_ch_num = dma_axi64_core0_rd_ch_num;
assign dma_axi64_core0_dma_axi64_core0_wdt_wr_burst_start = dma_axi64_core0_wr_burst_start_joint;
assign dma_axi64_core0_dma_axi64_core0_wdt_wr_ch_num = dma_axi64_core0_wr_ch_num_joint;
assign dma_axi64_core0_wdt_timeout = dma_axi64_core0_dma_axi64_core0_wdt_wdt_timeout;
assign dma_axi64_core0_wdt_ch_num = dma_axi64_core0_dma_axi64_core0_wdt_wdt_ch_num;
  
  
wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_clk;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_reset;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_enable;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_joint_mode;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_page_cross;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_joint_req;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_prio_top;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_prio_high;
wire [2:0] dma_axi64_core0_dma_axi64_core0_arbiter_rd_prio_top_num;
wire [2:0] dma_axi64_core0_dma_axi64_core0_arbiter_rd_prio_high_num;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_hold;
wire [7:0] dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_ready;
wire [7:0] dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_active;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_finish;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_go_out;
wire [2:0] dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_num;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_last;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_clk;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_reset;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_enable;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_joint_mode;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_page_cross;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_joint_req;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_prio_top;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_prio_high;
wire [2:0] dma_axi64_core0_dma_axi64_core0_arbiter_wr_prio_top_num;
wire [2:0] dma_axi64_core0_dma_axi64_core0_arbiter_wr_prio_high_num;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_hold;
wire [7:0] dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_ready;
wire [7:0] dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_active;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_finish;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_go_out;
wire [2:0] dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_num;
wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_last;
 
   reg[7:0]  dma_axi64_core0_dma_axi64_core0_arbiter_rd_current_active  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_current_ready_only  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_last_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_ready  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_next_ready  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_next_ready0  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_next_ready1  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_prio_top_ready  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_prio_high_ready  ; 
   reg  dma_axi64_core0_dma_axi64_core0_arbiter_rd_in_prog  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_go_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_go_pre_d  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_go_top_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_go_high_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_go  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_go_d  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_go_top  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_go_high  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_go_next  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_hold_d  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_rd_advance_next  ; 
   wire[2:0]  dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_num_pre  ; 
   wire[3:0]  dma_axi64_core0_dma_axi64_core0_arbiter_rd_next_ch_num0_pre  ; 
   wire[3:0]  dma_axi64_core0_dma_axi64_core0_arbiter_rd_next_ch_num0_pre2  ; 
   wire[2:0]  dma_axi64_core0_dma_axi64_core0_arbiter_rd_next_ch_num0  ; 
   wire[3:0]  dma_axi64_core0_dma_axi64_core0_arbiter_rd_next_ch_num1_pre  ; 
   wire[3:0]  dma_axi64_core0_dma_axi64_core0_arbiter_rd_next_ch_num1_pre2  ; 
   wire[2:0]  dma_axi64_core0_dma_axi64_core0_arbiter_rd_next_ch_num1  ; 
   wire[2:0]  dma_axi64_core0_dma_axi64_core0_arbiter_rd_next_ch_num_pre  ; 
  assign   dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_go_out  ='d1; 
  assign   dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_num  ='d0; 
  assign   dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_last  ='d1;
  
  
 
   reg[7:0]  dma_axi64_core0_dma_axi64_core0_arbiter_wr_current_active  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_current_ready_only  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_last_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_ready  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_next_ready  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_next_ready0  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_next_ready1  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_prio_top_ready  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_prio_high_ready  ; 
   reg  dma_axi64_core0_dma_axi64_core0_arbiter_wr_in_prog  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_go_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_go_pre_d  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_go_top_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_go_high_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_go  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_go_d  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_go_top  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_go_high  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_go_next  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_hold_d  ; 
   wire  dma_axi64_core0_dma_axi64_core0_arbiter_wr_advance_next  ; 
   wire[2:0]  dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_num_pre  ; 
   wire[3:0]  dma_axi64_core0_dma_axi64_core0_arbiter_wr_next_ch_num0_pre  ; 
   wire[3:0]  dma_axi64_core0_dma_axi64_core0_arbiter_wr_next_ch_num0_pre2  ; 
   wire[2:0]  dma_axi64_core0_dma_axi64_core0_arbiter_wr_next_ch_num0  ; 
   wire[3:0]  dma_axi64_core0_dma_axi64_core0_arbiter_wr_next_ch_num1_pre  ; 
   wire[3:0]  dma_axi64_core0_dma_axi64_core0_arbiter_wr_next_ch_num1_pre2  ; 
   wire[2:0]  dma_axi64_core0_dma_axi64_core0_arbiter_wr_next_ch_num1  ; 
   wire[2:0]  dma_axi64_core0_dma_axi64_core0_arbiter_wr_next_ch_num_pre  ; 
  assign   dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_go_out  ='d1; 
  assign   dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_num  ='d0; 
  assign   dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_last  ='d1;
assign dma_axi64_core0_dma_axi64_core0_arbiter_rd_clk = dma_axi64_core0_gclk;
assign dma_axi64_core0_dma_axi64_core0_arbiter_rd_reset = dma_axi64_core0_reset;
assign dma_axi64_core0_dma_axi64_core0_arbiter_rd_enable = dma_axi64_core0_rd_arbiter_en;
assign dma_axi64_core0_dma_axi64_core0_arbiter_rd_joint_mode = dma_axi64_core0_joint_mode;
assign dma_axi64_core0_dma_axi64_core0_arbiter_rd_page_cross = dma_axi64_core0_joint_page_cross;
assign dma_axi64_core0_dma_axi64_core0_arbiter_rd_joint_req = dma_axi64_core0_joint_req;
assign dma_axi64_core0_dma_axi64_core0_arbiter_rd_prio_top = dma_axi64_core0_rd_prio_top;
assign dma_axi64_core0_dma_axi64_core0_arbiter_rd_prio_high = dma_axi64_core0_rd_prio_high;
assign dma_axi64_core0_dma_axi64_core0_arbiter_rd_prio_top_num = dma_axi64_core0_rd_prio_top_num;
assign dma_axi64_core0_dma_axi64_core0_arbiter_rd_prio_high_num = dma_axi64_core0_rd_prio_high_num;
assign dma_axi64_core0_dma_axi64_core0_arbiter_rd_hold = dma_axi64_core0_rd_hold_joint;
assign dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_ready = dma_axi64_core0_ch_rd_ready_joint;
assign dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_active = dma_axi64_core0_ch_active_joint;
assign dma_axi64_core0_dma_axi64_core0_arbiter_rd_finish = dma_axi64_core0_rd_finish_joint;
assign dma_axi64_core0_rd_ch_go = dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_go_out;
assign dma_axi64_core0_rd_ch_num = dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_num;
assign dma_axi64_core0_rd_ch_last = dma_axi64_core0_dma_axi64_core0_arbiter_rd_ch_last;
assign dma_axi64_core0_dma_axi64_core0_arbiter_wr_clk = dma_axi64_core0_gclk;
assign dma_axi64_core0_dma_axi64_core0_arbiter_wr_reset = dma_axi64_core0_reset;
assign dma_axi64_core0_dma_axi64_core0_arbiter_wr_enable = dma_axi64_core0_wr_arbiter_en;
assign dma_axi64_core0_dma_axi64_core0_arbiter_wr_joint_mode = dma_axi64_core0_joint_mode;
assign dma_axi64_core0_dma_axi64_core0_arbiter_wr_page_cross = 1'b0;
assign dma_axi64_core0_dma_axi64_core0_arbiter_wr_joint_req = dma_axi64_core0_joint_req;
assign dma_axi64_core0_dma_axi64_core0_arbiter_wr_prio_top = dma_axi64_core0_wr_prio_top;
assign dma_axi64_core0_dma_axi64_core0_arbiter_wr_prio_high = dma_axi64_core0_wr_prio_high;
assign dma_axi64_core0_dma_axi64_core0_arbiter_wr_prio_top_num = dma_axi64_core0_wr_prio_top_num;
assign dma_axi64_core0_dma_axi64_core0_arbiter_wr_prio_high_num = dma_axi64_core0_wr_prio_high_num;
assign dma_axi64_core0_dma_axi64_core0_arbiter_wr_hold = 1'b0;
assign dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_ready = dma_axi64_core0_ch_wr_ready;
assign dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_active = dma_axi64_core0_ch_wr_active;
assign dma_axi64_core0_dma_axi64_core0_arbiter_wr_finish = dma_axi64_core0_wr_finish;
assign dma_axi64_core0_wr_ch_go = dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_go_out;
assign dma_axi64_core0_wr_ch_num = dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_num;
assign dma_axi64_core0_wr_ch_last = dma_axi64_core0_dma_axi64_core0_arbiter_wr_ch_last;
  
  
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_clk;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_reset;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_go;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_cmd_full;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_cmd_pending;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_joint_req;
wire [2:0] dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_num;
wire [2:0] dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_num_resp;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_go_next_line;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_valid;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_last;
wire [3-1:0] dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_delay;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_clr_stall;
wire [6-1:0] dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_ready;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_last;
reg  dma_axi64_core0_dma_axi64_core0_ctrl_rd_burst_start;
reg  dma_axi64_core0_dma_axi64_core0_ctrl_rd_finish;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_busy;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_hold;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_clk;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_reset;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_go;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_cmd_full;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_cmd_pending;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_joint_req;
wire [2:0] dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_num;
wire [2:0] dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_num_resp;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_go_next_line;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_valid;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_last;
wire [3-1:0] dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_delay;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_clr_stall;
wire [6-1:0] dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_ready;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_last;
reg  dma_axi64_core0_dma_axi64_core0_ctrl_wr_burst_start;
reg  dma_axi64_core0_dma_axi64_core0_ctrl_wr_finish;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_busy;
wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_hold;
 
   wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_remain  ; 
   reg  dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_remain_reg  ; 
   reg[6-1:0]  dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_counter  ; 
   wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_stall  ; 
   reg  dma_axi64_core0_dma_axi64_core0_ctrl_rd_joint_ctrl_reg  ; 
   wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_joint_ctrl  ; 
   reg[3-1:0]  dma_axi64_core0_dma_axi64_core0_ctrl_rd_delay_counter  ; 
   wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_ch  ; 
   wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_last_ch  ; 
   wire  dma_axi64_core0_dma_axi64_core0_ctrl_rd_go_next_line_d  ; 
   reg[2:0]  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ps  ; 
   reg[2:0]  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns  ; 
  assign   dma_axi64_core0_dma_axi64_core0_ctrl_rd_busy  =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ps  !=  dma_axi64_core0_dma_axi64_core0_ctrl_rd_IDLE  ; 
  assign   dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_ch  =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_valid  &  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr  &(  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_num  ==  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_num_resp  ); 
  assign   dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_last_ch  =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_valid  &  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_last  &(  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_num  ==  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_num_resp  ); 
  assign   dma_axi64_core0_dma_axi64_core0_ctrl_rd_go_next_line_d  =1'b0; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_ctrl_rd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_ctrl_rd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_ctrl_rd_joint_ctrl_reg   <=1'b0;
        else 
          if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_finish  ) 
              dma_axi64_core0_dma_axi64_core0_ctrl_rd_joint_ctrl_reg   <=1'b0;
           else 
             if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_go  ) 
                 dma_axi64_core0_dma_axi64_core0_ctrl_rd_joint_ctrl_reg   <=  dma_axi64_core0_dma_axi64_core0_ctrl_rd_joint_req  ;
 
  assign   dma_axi64_core0_dma_axi64_core0_ctrl_rd_joint_ctrl  =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_joint_ctrl_reg  ; 
  assign   dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_remain  =(|  dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_counter  )|  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_last  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_ctrl_rd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_ctrl_rd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_counter   <={6{1'b0}};
        else 
          if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_go  ) 
              dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_counter   <=  dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens  ;
           else 
             if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_burst_start  &(|  dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_counter  )) 
                 dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_counter   <=  dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_counter  -1'b1;
 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_ctrl_rd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_ctrl_rd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_ctrl_rd_delay_counter   <={3{1'b0}};
        else 
          if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_ch  ) 
              dma_axi64_core0_dma_axi64_core0_ctrl_rd_delay_counter   <=  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_delay  ;
           else 
             if (|  dma_axi64_core0_dma_axi64_core0_ctrl_rd_delay_counter  ) 
                 dma_axi64_core0_dma_axi64_core0_ctrl_rd_delay_counter   <=  dma_axi64_core0_dma_axi64_core0_ctrl_rd_delay_counter  -1'b1;
 
  assign   dma_axi64_core0_dma_axi64_core0_ctrl_rd_stall  =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_cmd_pending  |  dma_axi64_core0_dma_axi64_core0_ctrl_rd_cmd_full  |  dma_axi64_core0_dma_axi64_core0_ctrl_rd_go_next_line_d  ; 
  always @(                  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_go                                        or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_last                        or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_ready                       or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_clr_stall                      or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_delay_counter                     or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_go_next_line_d                    or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_hold                   or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_joint_ctrl                  or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_joint_req                 or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_ch                or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_last_ch               or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_valid              or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_delay             or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_ps            or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_stall           or    dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_remain   )
       begin  
          dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_IDLE  ; 
          dma_axi64_core0_dma_axi64_core0_ctrl_rd_burst_start   =1'b0; 
          dma_axi64_core0_dma_axi64_core0_ctrl_rd_finish   =1'b0;
         case (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ps  ) 
           dma_axi64_core0_dma_axi64_core0_ctrl_rd_IDLE   :
             begin 
               if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_go  )
                  begin 
                    if (!  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_ready  )
                       begin  
                          dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_IDLE  ; 
                          dma_axi64_core0_dma_axi64_core0_ctrl_rd_finish   =1'b1;
                       end 
                     else 
                       if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_stall  ) 
                           dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_STALL  ;
                        else  
                           dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_CMD  ;
                  end 
                else  
                   dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_IDLE  ;
             end  
           dma_axi64_core0_dma_axi64_core0_ctrl_rd_CMD   :
             begin 
               if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_joint_req  ^  dma_axi64_core0_dma_axi64_core0_ctrl_rd_joint_ctrl  )
                  begin  
                     dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_IDLE  ; 
                     dma_axi64_core0_dma_axi64_core0_ctrl_rd_finish   =1'b1;
                  end 
                else 
                  if ((  dma_axi64_core0_dma_axi64_core0_ctrl_rd_clr_stall  |  dma_axi64_core0_dma_axi64_core0_ctrl_rd_hold  )&  dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_remain  ) 
                      dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_CMD  ;
                   else 
                     if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_ready  &  dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_remain  )
                        begin 
                          if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_stall  ) 
                              dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_STALL  ;
                           else 
                             begin  
                                dma_axi64_core0_dma_axi64_core0_ctrl_rd_burst_start   =1'b1; 
                                dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_WAIT_CLR  ;
                             end 
                        end 
                      else 
                        if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_last  &(~  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_ready  )) 
                            dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_CMD  ;
                         else 
                           begin  
                              dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_IDLE  ; 
                              dma_axi64_core0_dma_axi64_core0_ctrl_rd_finish   =1'b1;
                           end 
             end  
           dma_axi64_core0_dma_axi64_core0_ctrl_rd_WAIT_CLR   :
             begin 
               if ((|  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_delay  )&  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_valid  )
                  begin 
                    if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_last_ch  )
                       begin  
                          dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_IDLE  ; 
                          dma_axi64_core0_dma_axi64_core0_ctrl_rd_finish   =1'b1;
                       end 
                     else 
                       if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_ch  ) 
                           dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_WAIT_DELAY  ;
                        else  
                           dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_WAIT_CLR  ;
                  end 
                else 
                  if (!  dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_remain  )
                     begin  
                        dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_IDLE  ; 
                        dma_axi64_core0_dma_axi64_core0_ctrl_rd_finish   =1'b1;
                     end 
                   else  
                      dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_WAIT_DELAY  ;
             end  
           dma_axi64_core0_dma_axi64_core0_ctrl_rd_WAIT_DELAY   :
             begin 
               if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_go_next_line_d  ) 
                   dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_WAIT_DELAY  ;
                else 
                  if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_delay_counter  =='d0) 
                      dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_STALL  ;
                   else  
                      dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_WAIT_DELAY  ;
             end  
           dma_axi64_core0_dma_axi64_core0_ctrl_rd_STALL   :
             begin 
               if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_ready  &  dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens_remain  )
                  begin 
                    if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_stall  ) 
                        dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_STALL  ;
                     else  
                        dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_CMD  ;
                  end 
                else 
                  if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_last  &(~  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_ready  )) 
                      dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_CMD  ;
                   else 
                     begin  
                        dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_IDLE  ; 
                        dma_axi64_core0_dma_axi64_core0_ctrl_rd_finish   =1'b1;
                     end 
             end 
          default :
             begin  
                dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_rd_IDLE  ;
             end 
         endcase 
       end
  
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_ctrl_rd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_ctrl_rd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_ctrl_rd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_ctrl_rd_ps   <=  dma_axi64_core0_dma_axi64_core0_ctrl_rd_IDLE  ;
        else  
           dma_axi64_core0_dma_axi64_core0_ctrl_rd_ps   <=  dma_axi64_core0_dma_axi64_core0_ctrl_rd_ns  ;

  
  
 
   wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_remain  ; 
   reg  dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_remain_reg  ; 
   reg[6-1:0]  dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_counter  ; 
   wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_stall  ; 
   reg  dma_axi64_core0_dma_axi64_core0_ctrl_wr_joint_ctrl_reg  ; 
   wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_joint_ctrl  ; 
   reg[3-1:0]  dma_axi64_core0_dma_axi64_core0_ctrl_wr_delay_counter  ; 
   wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_ch  ; 
   wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_last_ch  ; 
   wire  dma_axi64_core0_dma_axi64_core0_ctrl_wr_go_next_line_d  ; 
   reg[2:0]  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ps  ; 
   reg[2:0]  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns  ; 
  assign   dma_axi64_core0_dma_axi64_core0_ctrl_wr_busy  =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ps  !=  dma_axi64_core0_dma_axi64_core0_ctrl_wr_IDLE  ; 
  assign   dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_ch  =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_valid  &  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr  &(  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_num  ==  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_num_resp  ); 
  assign   dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_last_ch  =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_valid  &  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_last  &(  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_num  ==  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_num_resp  ); 
  assign   dma_axi64_core0_dma_axi64_core0_ctrl_wr_go_next_line_d  =1'b0; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_ctrl_wr_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_ctrl_wr_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_reset  ) 
           dma_axi64_core0_dma_axi64_core0_ctrl_wr_joint_ctrl_reg   <=1'b0;
        else 
          if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_finish  ) 
              dma_axi64_core0_dma_axi64_core0_ctrl_wr_joint_ctrl_reg   <=1'b0;
           else 
             if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_go  ) 
                 dma_axi64_core0_dma_axi64_core0_ctrl_wr_joint_ctrl_reg   <=  dma_axi64_core0_dma_axi64_core0_ctrl_wr_joint_req  ;
 
  assign   dma_axi64_core0_dma_axi64_core0_ctrl_wr_joint_ctrl  =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_joint_ctrl_reg  ; 
  assign   dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_remain  =(|  dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_counter  )|  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_last  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_ctrl_wr_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_ctrl_wr_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_reset  ) 
           dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_counter   <={6{1'b0}};
        else 
          if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_go  ) 
              dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_counter   <=  dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens  ;
           else 
             if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_burst_start  &(|  dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_counter  )) 
                 dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_counter   <=  dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_counter  -1'b1;
 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_ctrl_wr_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_ctrl_wr_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_reset  ) 
           dma_axi64_core0_dma_axi64_core0_ctrl_wr_delay_counter   <={3{1'b0}};
        else 
          if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_ch  ) 
              dma_axi64_core0_dma_axi64_core0_ctrl_wr_delay_counter   <=  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_delay  ;
           else 
             if (|  dma_axi64_core0_dma_axi64_core0_ctrl_wr_delay_counter  ) 
                 dma_axi64_core0_dma_axi64_core0_ctrl_wr_delay_counter   <=  dma_axi64_core0_dma_axi64_core0_ctrl_wr_delay_counter  -1'b1;
 
  assign   dma_axi64_core0_dma_axi64_core0_ctrl_wr_stall  =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_cmd_pending  |  dma_axi64_core0_dma_axi64_core0_ctrl_wr_cmd_full  |  dma_axi64_core0_dma_axi64_core0_ctrl_wr_go_next_line_d  ; 
  always @(                  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_go                                        or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_last                        or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_ready                       or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_clr_stall                      or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_delay_counter                     or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_go_next_line_d                    or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_hold                   or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_joint_ctrl                  or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_joint_req                 or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_ch                or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_last_ch               or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_valid              or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_delay             or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_ps            or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_stall           or    dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_remain   )
       begin  
          dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_IDLE  ; 
          dma_axi64_core0_dma_axi64_core0_ctrl_wr_burst_start   =1'b0; 
          dma_axi64_core0_dma_axi64_core0_ctrl_wr_finish   =1'b0;
         case (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ps  ) 
           dma_axi64_core0_dma_axi64_core0_ctrl_wr_IDLE   :
             begin 
               if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_go  )
                  begin 
                    if (!  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_ready  )
                       begin  
                          dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_IDLE  ; 
                          dma_axi64_core0_dma_axi64_core0_ctrl_wr_finish   =1'b1;
                       end 
                     else 
                       if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_stall  ) 
                           dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_STALL  ;
                        else  
                           dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_CMD  ;
                  end 
                else  
                   dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_IDLE  ;
             end  
           dma_axi64_core0_dma_axi64_core0_ctrl_wr_CMD   :
             begin 
               if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_joint_req  ^  dma_axi64_core0_dma_axi64_core0_ctrl_wr_joint_ctrl  )
                  begin  
                     dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_IDLE  ; 
                     dma_axi64_core0_dma_axi64_core0_ctrl_wr_finish   =1'b1;
                  end 
                else 
                  if ((  dma_axi64_core0_dma_axi64_core0_ctrl_wr_clr_stall  |  dma_axi64_core0_dma_axi64_core0_ctrl_wr_hold  )&  dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_remain  ) 
                      dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_CMD  ;
                   else 
                     if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_ready  &  dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_remain  )
                        begin 
                          if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_stall  ) 
                              dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_STALL  ;
                           else 
                             begin  
                                dma_axi64_core0_dma_axi64_core0_ctrl_wr_burst_start   =1'b1; 
                                dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_WAIT_CLR  ;
                             end 
                        end 
                      else 
                        if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_last  &(~  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_ready  )) 
                            dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_CMD  ;
                         else 
                           begin  
                              dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_IDLE  ; 
                              dma_axi64_core0_dma_axi64_core0_ctrl_wr_finish   =1'b1;
                           end 
             end  
           dma_axi64_core0_dma_axi64_core0_ctrl_wr_WAIT_CLR   :
             begin 
               if ((|  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_delay  )&  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_valid  )
                  begin 
                    if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_last_ch  )
                       begin  
                          dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_IDLE  ; 
                          dma_axi64_core0_dma_axi64_core0_ctrl_wr_finish   =1'b1;
                       end 
                     else 
                       if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_ch  ) 
                           dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_WAIT_DELAY  ;
                        else  
                           dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_WAIT_CLR  ;
                  end 
                else 
                  if (!  dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_remain  )
                     begin  
                        dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_IDLE  ; 
                        dma_axi64_core0_dma_axi64_core0_ctrl_wr_finish   =1'b1;
                     end 
                   else  
                      dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_WAIT_DELAY  ;
             end  
           dma_axi64_core0_dma_axi64_core0_ctrl_wr_WAIT_DELAY   :
             begin 
               if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_go_next_line_d  ) 
                   dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_WAIT_DELAY  ;
                else 
                  if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_delay_counter  =='d0) 
                      dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_STALL  ;
                   else  
                      dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_WAIT_DELAY  ;
             end  
           dma_axi64_core0_dma_axi64_core0_ctrl_wr_STALL   :
             begin 
               if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_ready  &  dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens_remain  )
                  begin 
                    if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_stall  ) 
                        dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_STALL  ;
                     else  
                        dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_CMD  ;
                  end 
                else 
                  if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_last  &(~  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_ready  )) 
                      dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_CMD  ;
                   else 
                     begin  
                        dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_IDLE  ; 
                        dma_axi64_core0_dma_axi64_core0_ctrl_wr_finish   =1'b1;
                     end 
             end 
          default :
             begin  
                dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns   =  dma_axi64_core0_dma_axi64_core0_ctrl_wr_IDLE  ;
             end 
         endcase 
       end
  
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_ctrl_wr_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_ctrl_wr_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_ctrl_wr_reset  ) 
           dma_axi64_core0_dma_axi64_core0_ctrl_wr_ps   <=  dma_axi64_core0_dma_axi64_core0_ctrl_wr_IDLE  ;
        else  
           dma_axi64_core0_dma_axi64_core0_ctrl_wr_ps   <=  dma_axi64_core0_dma_axi64_core0_ctrl_wr_ns  ;

assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_clk = dma_axi64_core0_gclk;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_reset = dma_axi64_core0_reset;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_go = dma_axi64_core0_rd_ch_go_joint;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_cmd_full = dma_axi64_core0_rd_cmd_full_joint;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_cmd_pending = dma_axi64_core0_rd_cmd_pending_joint;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_joint_req = dma_axi64_core0_joint_req;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_num = dma_axi64_core0_rd_ch_num;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_num_resp = dma_axi64_core0_rd_ch_num_resp;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_go_next_line = dma_axi64_core0_rd_go_next_line;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_valid = dma_axi64_core0_rd_clr_valid;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr = dma_axi64_core0_rd_clr;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_clr_last = dma_axi64_core0_rd_clr_last;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_periph_delay = dma_axi64_core0_rd_periph_delay;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_clr_stall = dma_axi64_core0_rd_clr_stall;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_tokens = dma_axi64_core0_rd_tokens;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_ready = dma_axi64_core0_rd_ready_joint;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_ch_last = dma_axi64_core0_rd_ch_last;
assign dma_axi64_core0_rd_burst_start = dma_axi64_core0_dma_axi64_core0_ctrl_rd_burst_start;
assign dma_axi64_core0_rd_finish = dma_axi64_core0_dma_axi64_core0_ctrl_rd_finish;
assign dma_axi64_core0_rd_ctrl_busy = dma_axi64_core0_dma_axi64_core0_ctrl_rd_busy;
assign dma_axi64_core0_dma_axi64_core0_ctrl_rd_hold = dma_axi64_core0_rd_hold_ctrl;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_clk = dma_axi64_core0_gclk;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_reset = dma_axi64_core0_reset;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_go = dma_axi64_core0_wr_ch_go_joint;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_cmd_full = dma_axi64_core0_wr_cmd_full_joint;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_cmd_pending = dma_axi64_core0_wr_cmd_pending_joint;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_joint_req = dma_axi64_core0_joint_req;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_num = dma_axi64_core0_wr_ch_num_joint;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_num_resp = dma_axi64_core0_wr_ch_num_resp;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_go_next_line = dma_axi64_core0_wr_go_next_line;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_valid = dma_axi64_core0_wr_clr_valid;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr = dma_axi64_core0_wr_clr;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_clr_last = dma_axi64_core0_wr_clr_last;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_periph_delay = dma_axi64_core0_wr_periph_delay;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_clr_stall = dma_axi64_core0_wr_clr_stall;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_tokens = dma_axi64_core0_wr_tokens;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_ready = dma_axi64_core0_wr_ready_joint;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_ch_last = dma_axi64_core0_wr_ch_last_joint;
assign dma_axi64_core0_wr_burst_start = dma_axi64_core0_dma_axi64_core0_ctrl_wr_burst_start;
assign dma_axi64_core0_wr_finish = dma_axi64_core0_dma_axi64_core0_ctrl_wr_finish;
assign dma_axi64_core0_wr_ctrl_busy = dma_axi64_core0_dma_axi64_core0_ctrl_wr_busy;
assign dma_axi64_core0_dma_axi64_core0_ctrl_wr_hold = dma_axi64_core0_wr_hold_ctrl;
  
  
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_port;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_last_cmd;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_line_cmd;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_wr_ch_num;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_burst_start;
wire [32-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_wr_burst_addr;
wire [8-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_wr_burst_size;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_pending;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_split;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_num;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_rd_transfer;
wire [4-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_rd_transfer_size;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rd;
wire [64-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rdata;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rd_valid;
wire [4-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rsize;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_wr_ready;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rd_num;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_wr_transfer_num;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_transfer;
wire [4-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_wr_transfer_size;
wire [4-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_wr_next_size;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_full;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_clr_line;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_wr_clr_line_num;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_slverr;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_decerr;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_clr;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_clr_last;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_wr_ch_num_resp;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_page_cross;
wire [32-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_AWADDR;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_AWPORT;
wire [4-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_AWLEN;
wire [1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_AWSIZE;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_AWVALID;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_AWREADY;
wire [64-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_WDATA;
wire [8-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_WSTRB;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_WLAST;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_WVALID;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_WREADY;
wire [1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_BRESP;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_BVALID;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_BREADY;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_joint_req;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_joint_stall;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_axim_timeout_aw;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_axim_timeout_w;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_axim_timeout_num_aw;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_axim_timeout_num_w;
 
   wire[7-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_AWID  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_AJOINT  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_BVALID_d  ; 
   wire[7-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_BID  ; 
   reg[1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_BRESP_d  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_resp_full  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_BREADY  =1'b1;  
  
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_din;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_dout;
 
   reg[  dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_DELAY  :0]  dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_shift_reg  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_DELAY  +1{1'b0}};
        else  
           dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_DELAY  -1:0],  dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_din  };
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_dout  =  dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_DELAY  -1];
assign dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_din = dma_axi64_core0_dma_axi64_core0_axim_wr_BVALID;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_BVALID_d = dma_axi64_core0_dma_axi64_core0_axim_wr_delay_bvalid_dout;
 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_reset  )
          begin  
             dma_axi64_core0_dma_axi64_core0_axim_wr_BRESP_d   <=2'b00;
          end 
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_BVALID  )
             begin  
                dma_axi64_core0_dma_axi64_core0_axim_wr_BRESP_d   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_BRESP  ;
             end
   
  
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ch_num;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_start;
wire [32-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_addr;
wire [8-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_size;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_end_line_cmd;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_extra_bit;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_port;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_joint_req;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_joint_pending;
reg  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_pending;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_full;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_split;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_num;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_line;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_page_cross;
reg [7-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID;
reg [32-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AADDR;
reg  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_APORT;
reg [4-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ALEN;
reg [1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ASIZE;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AVALID;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AREADY;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AWVALID;
reg  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AJOINT;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_axim_timeout_num;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_axim_timeout;
 
   reg[7-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID_reg  ; 
   reg  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AVALID_reg  ; 
   wire[7-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID_pre  ; 
   wire[32-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AADDR_pre  ; 
   wire[1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ASIZE_pre  ; 
   wire[4-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ALEN_pre  ; 
   wire[8-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_length  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_line_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_high_addr_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_high_addr  ; 
   wire[8:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_reach_pre  ; 
   reg[8:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_reach  ; 
   reg  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_joint_cross  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_page_cross_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cross_start  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cross_start_d  ; 
   wire[8:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_max_burst  ; 
   reg[8:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_max_burst_d  ; 
   reg  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst  ; 
   reg[8-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst_size  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst_start  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_high_addr_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_addr  [11:8]==4'hf; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_reach_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_addr  [7:0]+  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_size  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_page_cross  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_high_addr  &(  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_reach  >{1'b1,{8{1'b0}}}); 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_max_burst  ={1'b1,{8{1'b0}}}-  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_addr  [7:0]; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst_start  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst  &(~  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AVALID_reg  )&(~  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_full  ); 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cross_start  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_start  &  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_page_cross  ;  
  
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_din;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_dout;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_din;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_dout;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_din;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_dout;
 
   reg[  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_DELAY  :0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_shift_reg  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_DELAY  +1{1'b0}};
        else  
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_DELAY  -1:0],  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_din  };
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_dout  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_DELAY  -1];
  
  
 
   reg[  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_DELAY  :0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_shift_reg  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_DELAY  +1{1'b0}};
        else  
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_DELAY  -1:0],  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_din  };
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_dout  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_DELAY  -1];
 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_reach   <={9{1'b0}};
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_high_addr_pre  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_reach   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_reach_pre  ;
 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst   <=1'b0;
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst_start  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst   <=1'b0;
           else 
             if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cross_start  ) 
                 dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst   <=1'b1;
 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_max_burst_d   <={9{1'b0}};
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cross_start  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_max_burst_d   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_max_burst  ;
 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst_size   <={8{1'b0}};
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cross_start  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst_size   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_size  ;
           else 
             if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cross_start_d  ) 
                 dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst_size   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst_size  -  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_max_burst_d  ;
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_split  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cross_start_d  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AVALID  &  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AREADY  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_num  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID  [2:0]; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_line_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd  &  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID  [6]; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_joint_pending  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AVALID  &(~  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AREADY  )&  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AJOINT  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_pending   <=1'b0;
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_start  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_pending   <=1'b1;
           else 
             if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd  &(~  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst  )) 
                 dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_pending   <=1'b0;
  
  
 
   reg[  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_DELAY  :0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_shift_reg  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_DELAY  +1{1'b0}};
        else  
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_DELAY  -1:0],  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_din  };
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_dout  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_DELAY  -1];
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_din = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_high_addr_pre;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_high_addr = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_high_addr_dout;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_din = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cross_start;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cross_start_d = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cross_start_dout;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_din = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_line_pre;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_line = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_delay_cmd_line_dout;
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID_pre  ={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_end_line_cmd  ,  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ASIZE_pre  [1:0],  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_extra_bit  ,  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ch_num  [2:0]}; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AADDR_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_addr  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ASIZE_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_size  =='d1 ? 2'b00:  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_size  =='d2 ? 2'b01:  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_size  =='d4 ? 2'b10:  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AXI_WORD_SIZE  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_length  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst   ?   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst_size  :  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_page_cross   ?   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_max_burst  :  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_size  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ALEN_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_length  [8-1:  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AXI_3  ]=='d0 ? {4{1'b0}}:  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_length  [8-1:  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AXI_3  ]-1'b1; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  )
          begin  
             dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ASIZE   <={2{1'b0}}; 
             dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AJOINT   <=1'b0;
          end 
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_start  )
             begin  
                dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ASIZE   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ASIZE_pre  ; 
                dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AJOINT   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_joint_req  ;
             end
  
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID_reg   <={7{1'b0}};
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_start  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID_reg   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID_pre  ;
 
  always @(    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID_reg            or    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst   )
       begin  
          dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID   =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID_reg  ; 
          dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID   [6]=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID_reg  [6]&(~  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst  ); 
          dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID   [3]=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID_reg  [3]&(~  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst  );
       end
  
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AADDR   <={32{1'b0}};
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst_start  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AADDR   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AADDR  [32-1:12],{12{1'b1}}}+1'b1;
           else 
             if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_start  ) 
                 dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AADDR   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AADDR_pre  ;
 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_APORT   <=1'b0;
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_start  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_APORT   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_port  ;
 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ALEN   <={4{1'b0}};
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_start  |  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst_start  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ALEN   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ALEN_pre  ;
 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AVALID_reg   <=1'b0;
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AVALID  &  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AREADY  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AVALID_reg   <=1'b0;
           else 
             if ((  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_start  &(  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_size  >'d0))|  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_next_burst_start  ) 
                 dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AVALID_reg   <=1'b1;
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AVALID  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AJOINT   ?   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AVALID_reg  &(~  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AWVALID  ):  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AVALID_reg  ;  
  
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_VALID;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_READY;
wire [7-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_ID;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_axim_timeout_num;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_axim_timeout;
 
   reg[10-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_counter  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_axim_timeout_num  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_ID  [2:0]; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_axim_timeout  =(  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_counter  =='d0); 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_counter   <={10{1'b1}};
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_VALID  &  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_READY  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_counter   <={10{1'b1}};
           else 
             if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_VALID  ) 
                 dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_counter   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_counter  -1'b1;

assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_VALID = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AVALID;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_READY = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AREADY;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_ID = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_axim_timeout_num = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_axim_timeout_num;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_axim_timeout = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_dma_axi64_axim_timeout_axim_timeout;

assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ch_num = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_ch_num;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_start = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_burst_start;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_addr = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_burst_addr;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_burst_size = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_burst_size;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_end_line_cmd = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_line_cmd;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_extra_bit = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_last_cmd;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_port = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_port;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_joint_req = dma_axi64_core0_dma_axi64_core0_axim_wr_joint_req;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_pending = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_pending;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_full = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_full;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_split = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_split;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_num = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_cmd_num;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_page_cross = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_page_cross;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_AWID = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AID;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_AWADDR = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AADDR;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_AWPORT = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_APORT;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_AWLEN = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ALEN;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_AWSIZE = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_ASIZE;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_AWVALID = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AVALID;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AREADY = dma_axi64_core0_dma_axi64_core0_axim_wr_AWREADY;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AWVALID = 1'b0;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_AJOINT = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_AJOINT;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_axim_timeout_num_aw = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_axim_timeout_num;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_axim_timeout_aw = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wcmd_axim_timeout;
  
  
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_transfer;
wire [4-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_transfer_size;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rd;
wire [4-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rsize;
wire [64-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rdata;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rd_valid;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_wr_ready;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rd_num;
reg [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_num;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer;
reg [4-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_size;
reg [4-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_next_size;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_resp_full;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_cmd_full;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line;
reg [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_num;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_joint_stall;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_axim_timeout_num;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_axim_timeout;
wire [7-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWID;
wire [32-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWADDR;
wire [4-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWLEN;
wire [1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWSIZE;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWVALID;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWREADY;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AJOINT;
wire [64-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WDATA;
wire [8-1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WLAST;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WVALID;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WREADY;
 
   wire[7-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID  ; 
   wire[7-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_pre  ; 
   reg[8-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre  ; 
   wire[1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSIZE_pre  ; 
   wire[4-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WLEN_pre  ; 
   wire[7-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_data  ; 
   wire[8-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_data  ; 
   wire[1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSIZE_data  ; 
   wire[4-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WLEN_data  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_valid_last  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_stall_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_stall  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_pre  ; 
   wire[2:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_num_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_pre  ; 
   wire[4-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_size_pre  ; 
   reg[2:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_last_channel  ; 
   wire[7-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_cmd  ; 
   wire[1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSIZE_cmd  ; 
   wire[4-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WLEN_cmd  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_ready  ; 
   wire[2:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_fullness_pre  ; 
   reg[2:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_fullness  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_joint_fifo_rd_valid  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_joint_req_out  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_transfer_joint  ; 
   wire[4-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_transfer_size_joint  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_transfer_full  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_push  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_pop  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_pop_d  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_empty  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_full  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_data_push  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_data_pop  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_data_empty  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_data_full  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_push  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_pop  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_empty  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_full  ; 
   reg[4-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_out_count  ; 
   reg[4-1:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_in_count  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_pending_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_pending  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_line_end  ; 
   wire[2:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_line_end_num  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_ready  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rd_valid  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_fullness_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_fullness  +  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_ready  -  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_pre  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_fullness   <=3'd0;
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_ready  |  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_pre  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_fullness   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_fullness_pre  ;
  
  
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_req_out;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer;
wire [ dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_SIZE_BITS -1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_size;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_ch_fifo_rd;
wire [2:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_data_fullness_pre;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_HOLD;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_fifo_rd_valid;
wire [ dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_SIZE_BITS -1:0] dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_size_joint;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_full;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_stall;
 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_joint  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_fifo_rd  ; 
   wire[2:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_count_ch_fifo_pre  ; 
   reg[2:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_count_ch_fifo  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_stall_pre  ; 
   reg  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_stall_reg  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_not_ready_pre  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_not_ready  ; 
   reg[2:0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_rd_stall_num  ; 
   wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_rd_stall  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_joint  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_req_out  &  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer  ;  
  
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_din;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_dout;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_din;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_dout;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_din;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_dout;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_din;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_dout;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_din;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_dout;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_din;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_dout;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_clk;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_reset;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_din;
wire  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_dout;
 
   reg[  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_DELAY  :0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_shift_reg  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_DELAY  +1{1'b0}};
        else  
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_DELAY  -1:0],  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_din  };
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_dout  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_DELAY  -1];
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_count_ch_fifo_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_count_ch_fifo  +  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_joint  -  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_ch_fifo_rd  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_count_ch_fifo   <=3'd0;
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_req_out  &(  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_joint  |  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_ch_fifo_rd  )) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_count_ch_fifo   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_count_ch_fifo_pre  ;
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_stall_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_req_out  &((  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_count_ch_fifo_pre  >'d2)|((  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_count_ch_fifo_pre  =='d2)&(  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_data_fullness_pre  >'d1))|  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_HOLD  ); 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_not_ready_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_req_out  &(  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_data_fullness_pre  >'d1)&(~(  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_joint  &  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_stall_pre  )); 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_stall_reg   <=1'b0;
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_stall_pre  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_stall_reg   <=1'b1;
           else 
             if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_count_ch_fifo_pre  =='d0) 
                 dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_stall_reg   <=1'b0;
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_stall  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_stall_reg  |(  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_req_out  &  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_HOLD  );  
  
 
   reg[  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_DELAY  :0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_shift_reg  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_DELAY  +1{1'b0}};
        else  
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_DELAY  -1:0],  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_din  };
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_dout  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_DELAY  -1];
  
  prgen_fifo  #(  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_SIZE_BITS  ,2)  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_fifo  (. clk (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_clk  ),. reset (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_reset  ),. push (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_joint  ),. pop (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_fifo_rd_valid  ),. din (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_size  ),. dout (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_size_joint  ),. empty (),. full (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_full  ));  
  prgen_stall  #(3)  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_stall_joint_fifo_rd  (. clk (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_clk  ),. reset (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_reset  ),. din (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_fifo_rd  ),. stall (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_not_ready  ),. dout (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_fifo_rd_valid  ));
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_req_out = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_joint_req_out;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_transfer;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_size = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_transfer_size;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_ch_fifo_rd = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rd;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_data_fullness_pre = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_fullness_pre;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_HOLD = 1'b0;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_joint_fifo_rd_valid = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_fifo_rd_valid;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_transfer_size_joint = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_size_joint;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_transfer_full = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_full;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_joint_stall = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_stall;
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_pending_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WVALID  &(~  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WREADY  );  
  
 
   reg[  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_DELAY  :0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_shift_reg  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_DELAY  +1{1'b0}};
        else  
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_DELAY  -1:0],  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_din  };
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_dout  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_DELAY  -1];
 
  always @(   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSIZE_cmd   )
       begin 
         case (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSIZE_cmd  )
          2 'b00: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_next_size   =4'd1;
          2 'b01: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_next_size   =4'd2;
          2 'b10: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_next_size   =4'd4;
          2 'b11: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_next_size   =4'd8;
         endcase 
       end
  
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rd  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_joint_fifo_rd_valid  |((~  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_empty  )&(~  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_pending  )&(~  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_stall  )&  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_wr_ready  ); 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rsize  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_joint_fifo_rd_valid   ?   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_transfer_size_joint  :  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_cmd  [5:4]==2'b00 ? 4'd1:  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_cmd  [5:4]==2'b01 ? 4'd2:  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_cmd  [5:4]==2'b10 ? 4'd4:4'd8; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rd_num  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_cmd  [2:0];  
  
 
   reg[  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_DELAY  :0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_shift_reg  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_DELAY  +1{1'b0}};
        else  
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_DELAY  -1:0],  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_din  };
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_dout  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_DELAY  -1];
 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_last_channel   <=3'b000;
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_push  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_last_channel   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_pre  [2:0];
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_num_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_data  [2:0]; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WVALID  &  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WREADY  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_size_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_data  [5:4]==2'b00 ? 4'd1:  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_data  [5:4]==2'b01 ? 4'd2:  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_data  [5:4]==2'b10 ? 4'd4:4'd8;  
  
 
   reg[  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_DELAY  :0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_shift_reg  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_DELAY  +1{1'b0}};
        else  
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_DELAY  -1:0],  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_din  };
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_dout  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_DELAY  -1];
 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  )
          begin  
             dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_num   <=3'd0; 
             dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_size   <=3'd0;
          end 
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_pre  )
             begin  
                dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_num   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_num_pre  ; 
                dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_size   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_size_pre  ;
             end
  
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_valid_last  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rd  &(  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_out_count  ==  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WLEN_cmd  )&(~  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_empty  ); 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_valid_last  &  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_line_end  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_num   <=3'd0;
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_pre  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_num   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_line_end_num  ;
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_stall_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_pre  &(  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rd_num  ==  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_line_end_num  );  
  
 
   reg[  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_DELAY  :0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_shift_reg  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_DELAY  +1{1'b0}};
        else  
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_DELAY  -1:0],  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_din  };
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_dout  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_DELAY  -1];
  
  
 
   reg[  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_DELAY  :0]  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_shift_reg  ; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_DELAY  +1{1'b0}};
        else  
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_shift_reg   <={  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_DELAY  -1:0],  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_din  };
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_dout  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_shift_reg  [  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_DELAY  -1];
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_din = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_rd_transfer_joint;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_fifo_rd = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_fifo_rd_dout;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_din = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_not_ready_pre;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_joint_not_ready = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_gen_joint_stall_delay_joint_not_ready_dout;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_din = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_pending_pre;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_pending = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_pending_dout;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_din = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_pop;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_pop_d = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_cmd_pop_dout;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_din = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_pre;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_wr_transfer_dout;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_din = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_stall_pre;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_stall = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_stall_dout;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_din = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_pre;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_delay_clr_line_dout;
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_cmd_full  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_full  |  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_data_full  |  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_resp_full  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_push  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWVALID  &  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWREADY  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_pop  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_valid_last  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWID  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WLEN_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWLEN  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSIZE_pre  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWSIZE  ; 
  always @(    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWADDR            or    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWSIZE   )
       begin 
         case ({  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWSIZE  [1:0],  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWADDR  [2:0]})
          { 2'b00,3'b000}: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b0000_0001;
          { 2'b00,3'b001}: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b0000_0010;
          { 2'b00,3'b010}: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b0000_0100;
          { 2'b00,3'b011}: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b0000_1000;
          { 2'b00,3'b100}: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b0001_0000;
          { 2'b00,3'b101}: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b0010_0000;
          { 2'b00,3'b110}: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b0100_0000;
          { 2'b00,3'b111}: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b1000_0000;
          { 2'b01,3'b000}: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b0000_0011;
          { 2'b01,3'b010}: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b0000_1100;
          { 2'b01,3'b100}: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b0011_0000;
          { 2'b01,3'b110}: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b1100_0000;
          { 2'b10,3'b000}: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b0000_1111;
          { 2'b10,3'b100}: 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b1111_0000;
          default : 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre   =8'b1111_1111;
         endcase 
       end
   
  prgen_fifo  #(7+4+2+1,4)  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_fifo  (. clk (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk  ),. reset (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  ),. push (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_push  ),. pop (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_pop  ),. din ({  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_pre  ,  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSIZE_pre  ,  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WLEN_pre  ,  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AJOINT  }),. dout ({  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_cmd  ,  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSIZE_cmd  ,  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WLEN_cmd  ,  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_joint_req_out  }),. empty (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_empty  ),. full (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_full  )); 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_line_end  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_cmd  [6]; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_line_end_num  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_cmd  [2:0]; 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_out_count   <={4{1'b0}};
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_pop  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_out_count   <={4{1'b0}};
           else 
             if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rd  ) 
                 dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_out_count   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_out_count  +1'b1;
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_data_push  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_push  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_data_pop  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WVALID  &  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WREADY  &  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WLAST  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB  =(  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_in_count  [0] ? {  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_data  [3:0],  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_data  [7:4]}:  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_data  )&{8{  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WVALID  }}; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_data  ;  
  prgen_fifo  #(8+4+7+2,4)  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_data_fifo  (. clk (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk  ),. reset (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  ),. push (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_data_push  ),. pop (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_data_pop  ),. din ({  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WLEN_pre  ,  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSIZE_pre  ,  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_pre  ,  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_pre  }),. dout ({  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WLEN_data  ,  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSIZE_data  ,  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB_data  ,  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID_data  }),. empty (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_data_empty  ),. full (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_data_full  )); 
  always @(  posedge    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk          or  posedge   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  )
       if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  ) 
           dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_in_count   <={4{1'b0}};
        else 
          if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_data_pop  ) 
              dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_in_count   <={4{1'b0}};
           else 
             if (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_pre  ) 
                 dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_in_count   <=  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_in_count  +1'b1;
 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_push  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rd_valid  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_pop  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_pre  ;  
  prgen_fifo  #(64,5+2)  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_fifo  (. clk (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk  ),. reset (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  ),. push (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_push  ),. pop (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_pop  ),. din (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rdata  ),. dout (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WDATA  ),. empty (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_empty  ),. full (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_full  )); 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WVALID  =~  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_data_empty  ; 
  assign   dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WLAST  =  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WVALID  &(  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_in_count  ==  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WLEN_data  )&(~  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_cmd_data_empty  );  
  dma_axi64_core0_axim_timeout    dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_dma_axi64_axim_timeout  (. clk (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk  ),. reset (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset  ),. VALID (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WVALID  ),. READY (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WREADY  ),. ID (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WID  ),. axim_timeout_num (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_axim_timeout_num  ),. axim_timeout (  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_axim_timeout  ));
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_clk = dma_axi64_core0_dma_axi64_core0_axim_wr_clk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_reset = dma_axi64_core0_dma_axi64_core0_axim_wr_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_transfer = dma_axi64_core0_dma_axi64_core0_axim_wr_rd_transfer;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_rd_transfer_size = dma_axi64_core0_dma_axi64_core0_axim_wr_rd_transfer_size;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rd = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rd;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rsize = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rsize;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rdata = dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rdata;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rd_valid = dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rd_valid;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_wr_ready = dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_wr_ready;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rd_num = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_ch_fifo_rd_num;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_transfer_num = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_num;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_transfer = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_transfer_size = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_transfer_size;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_next_size = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_next_size;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_resp_full = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_resp_full;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_full = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_cmd_full;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_clr_line = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_clr_line_num = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_wr_clr_line_num;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_joint_stall = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_joint_stall;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_axim_timeout_num_w = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_axim_timeout_num;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_axim_timeout_w = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_axim_timeout;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWID = dma_axi64_core0_dma_axi64_core0_axim_wr_AWID;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWADDR = dma_axi64_core0_dma_axi64_core0_axim_wr_AWADDR;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWLEN = dma_axi64_core0_dma_axi64_core0_axim_wr_AWLEN;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWSIZE = dma_axi64_core0_dma_axi64_core0_axim_wr_AWSIZE;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWVALID = dma_axi64_core0_dma_axi64_core0_axim_wr_AWVALID;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AWREADY = dma_axi64_core0_dma_axi64_core0_axim_wr_AWREADY;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_AJOINT = dma_axi64_core0_dma_axi64_core0_axim_wr_AJOINT;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_WDATA = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WDATA;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_WSTRB = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WSTRB;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_WLAST = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WLAST;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_WVALID = dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WVALID;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wdata_WREADY = dma_axi64_core0_dma_axi64_core0_axim_wr_WREADY;
  
  dma_axi64_core0_axim_resp  #(. CMD_DEPTH (4))  dma_axi64_core0_dma_axi64_core0_axim_wr_dma_axi64_axim_wresp  (. clk (  dma_axi64_core0_dma_axi64_core0_axim_wr_clk  ),. reset (  dma_axi64_core0_dma_axi64_core0_axim_wr_reset  ),. slverr (  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_slverr  ),. decerr (  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_decerr  ),. clr (  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_clr  ),. clr_last (  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_clr_last  ),. ch_num_resp (  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_ch_num_resp  ),. resp_full (  dma_axi64_core0_dma_axi64_core0_axim_wr_wr_resp_full  ),. AID (  dma_axi64_core0_dma_axi64_core0_axim_wr_AWID  ),. AVALID (  dma_axi64_core0_dma_axi64_core0_axim_wr_AWVALID  ),. AREADY (  dma_axi64_core0_dma_axi64_core0_axim_wr_AWREADY  ),. ID (  dma_axi64_core0_dma_axi64_core0_axim_wr_BID  ),. RESP (  dma_axi64_core0_dma_axi64_core0_axim_wr_BRESP_d  ),. VALID (  dma_axi64_core0_dma_axi64_core0_axim_wr_BVALID_d  ),. READY (  dma_axi64_core0_dma_axi64_core0_axim_wr_BREADY  ),. LAST (1'b1));
assign dma_axi64_core0_dma_axi64_core0_axim_wr_clk = dma_axi64_core0_gclk;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_reset = dma_axi64_core0_reset;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_port = dma_axi64_core0_wr_cmd_port;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_last_cmd = dma_axi64_core0_wr_last_cmd;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_line_cmd = dma_axi64_core0_wr_line_cmd;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_ch_num = dma_axi64_core0_wr_ch_num_joint;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_burst_start = dma_axi64_core0_wr_burst_start_joint;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_burst_addr = dma_axi64_core0_wr_burst_addr;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_wr_burst_size = dma_axi64_core0_wr_burst_size;
assign dma_axi64_core0_wr_cmd_pending = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_pending;
assign dma_axi64_core0_wr_cmd_split = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_split;
assign dma_axi64_core0_wr_cmd_num = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_num;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_rd_transfer = dma_axi64_core0_rd_transfer;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_rd_transfer_size = dma_axi64_core0_rd_transfer_size;
assign dma_axi64_core0_ch_fifo_rd = dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rd;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rdata = dma_axi64_core0_ch_fifo_rdata;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rd_valid = dma_axi64_core0_ch_fifo_rd_valid;
assign dma_axi64_core0_ch_fifo_rsize = dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rsize;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_wr_ready = dma_axi64_core0_ch_fifo_wr_ready;
assign dma_axi64_core0_ch_fifo_rd_num = dma_axi64_core0_dma_axi64_core0_axim_wr_ch_fifo_rd_num;
assign dma_axi64_core0_wr_transfer_num = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_transfer_num;
assign dma_axi64_core0_wr_transfer = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_transfer;
assign dma_axi64_core0_wr_transfer_size = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_transfer_size;
assign dma_axi64_core0_wr_next_size = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_next_size;
assign dma_axi64_core0_wr_cmd_full = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_cmd_full;
assign dma_axi64_core0_wr_clr_line = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_clr_line;
assign dma_axi64_core0_wr_clr_line_num = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_clr_line_num;
assign dma_axi64_core0_wr_slverr = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_slverr;
assign dma_axi64_core0_wr_decerr = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_decerr;
assign dma_axi64_core0_wr_clr = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_clr;
assign dma_axi64_core0_wr_clr_last = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_clr_last;
assign dma_axi64_core0_wr_ch_num_resp = dma_axi64_core0_dma_axi64_core0_axim_wr_wr_ch_num_resp;
assign dma_axi64_core0_wr_page_cross = dma_axi64_core0_dma_axi64_core0_axim_wr_page_cross;
assign dma_axi64_core0_AWADDR = dma_axi64_core0_dma_axi64_core0_axim_wr_AWADDR;
assign dma_axi64_core0_wr_port_num = dma_axi64_core0_dma_axi64_core0_axim_wr_AWPORT;
assign dma_axi64_core0_AWLEN = dma_axi64_core0_dma_axi64_core0_axim_wr_AWLEN;
assign dma_axi64_core0_AWSIZE = dma_axi64_core0_dma_axi64_core0_axim_wr_AWSIZE;
assign dma_axi64_core0_AWVALID = dma_axi64_core0_dma_axi64_core0_axim_wr_AWVALID;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_AWREADY = dma_axi64_core0_AWREADY;
assign dma_axi64_core0_WDATA = dma_axi64_core0_dma_axi64_core0_axim_wr_WDATA;
assign dma_axi64_core0_WSTRB = dma_axi64_core0_dma_axi64_core0_axim_wr_WSTRB;
assign dma_axi64_core0_WLAST = dma_axi64_core0_dma_axi64_core0_axim_wr_WLAST;
assign dma_axi64_core0_WVALID = dma_axi64_core0_dma_axi64_core0_axim_wr_WVALID;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_WREADY = dma_axi64_core0_WREADY;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_BRESP = dma_axi64_core0_BRESP;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_BVALID = dma_axi64_core0_BVALID;
assign dma_axi64_core0_BREADY = dma_axi64_core0_dma_axi64_core0_axim_wr_BREADY;
assign dma_axi64_core0_dma_axi64_core0_axim_wr_joint_req = dma_axi64_core0_joint_req;
assign dma_axi64_core0_joint_stall = dma_axi64_core0_dma_axi64_core0_axim_wr_joint_stall;
assign dma_axi64_core0_timeout_aw = dma_axi64_core0_dma_axi64_core0_axim_wr_axim_timeout_aw;
assign dma_axi64_core0_timeout_w = dma_axi64_core0_dma_axi64_core0_axim_wr_axim_timeout_w;
assign dma_axi64_core0_timeout_num_aw = dma_axi64_core0_dma_axi64_core0_axim_wr_axim_timeout_num_aw;
assign dma_axi64_core0_timeout_num_w = dma_axi64_core0_dma_axi64_core0_axim_wr_axim_timeout_num_w;
  
  dma_axi64_core0_axim_rd    dma_axi64_core0_dma_axi64_core0_axim_rd  (. clk (  dma_axi64_core0_gclk  ),. reset (  dma_axi64_core0_reset  ),. load_wr (  dma_axi64_core0_load_wr  ),. load_wr_num (  dma_axi64_core0_load_wr_num  ),. load_wr_cycle (  dma_axi64_core0_load_wr_cycle  ),. load_wdata (  dma_axi64_core0_load_wdata  ),. load_req_in_prog (  dma_axi64_core0_load_req_in_prog  ),. joint_stall (  dma_axi64_core0_joint_stall  ),. joint_req (  dma_axi64_core0_joint_req  ),. rd_cmd_port (  dma_axi64_core0_rd_cmd_port  ),. rd_ch_num (  dma_axi64_core0_rd_ch_num  ),. rd_burst_start (  dma_axi64_core0_rd_burst_start  ),. rd_burst_addr (  dma_axi64_core0_rd_burst_addr  ),. rd_burst_size (  dma_axi64_core0_rd_burst_size  ),. rd_cmd_split (  dma_axi64_core0_rd_cmd_split  ),. rd_cmd_line (  dma_axi64_core0_rd_cmd_line  ),. rd_cmd_num (  dma_axi64_core0_rd_cmd_num  ),. rd_cmd_pending (  dma_axi64_core0_rd_cmd_pending  ),. ch_fifo_wr (  dma_axi64_core0_ch_fifo_wr  ),. ch_fifo_wdata (  dma_axi64_core0_ch_fifo_wdata  ),. ch_fifo_wsize (  dma_axi64_core0_ch_fifo_wsize  ),. ch_fifo_wr_num (  dma_axi64_core0_ch_fifo_wr_num  ),. rd_clr_line (  dma_axi64_core0_rd_clr_line  ),. rd_clr_line_num (  dma_axi64_core0_rd_clr_line_num  ),. rd_line_cmd (  dma_axi64_core0_rd_line_cmd  ),. rd_transfer (  dma_axi64_core0_rd_transfer  ),. rd_transfer_size (  dma_axi64_core0_rd_transfer_size  ),. rd_transfer_num (  dma_axi64_core0_rd_transfer_num  ),. rd_burst_cmd (  dma_axi64_core0_rd_burst_cmd  ),. rd_cmd_full (  dma_axi64_core0_rd_cmd_full  ),. rd_slverr (  dma_axi64_core0_rd_slverr  ),. rd_decerr (  dma_axi64_core0_rd_decerr  ),. rd_clr (  dma_axi64_core0_rd_clr  ),. rd_clr_load (  dma_axi64_core0_rd_clr_load  ),. rd_clr_last (  dma_axi64_core0_rd_clr_last  ),. rd_ch_num_resp (  dma_axi64_core0_rd_ch_num_resp  ),. page_cross (  dma_axi64_core0_rd_page_cross  ),. ARADDR (  dma_axi64_core0_ARADDR  ),. ARPORT (  dma_axi64_core0_rd_port_num  ),. ARLEN (  dma_axi64_core0_ARLEN  ),. ARSIZE (  dma_axi64_core0_ARSIZE  ),. ARVALID (  dma_axi64_core0_ARVALID  ),. ARREADY (  dma_axi64_core0_ARREADY  ),. AWVALID (  dma_axi64_core0_AWVALID  ),. RDATA (  dma_axi64_core0_RDATA  ),. RRESP (  dma_axi64_core0_RRESP  ),. RLAST (  dma_axi64_core0_RLAST  ),. RVALID (  dma_axi64_core0_RVALID  ),. RREADY_out (  dma_axi64_core0_RREADY  ),. axim_timeout_ar (  dma_axi64_core0_timeout_ar  ),. axim_timeout_num_ar (  dma_axi64_core0_timeout_num_ar  )); 
  assign   dma_axi64_core0_rd_hold  =1'b0; 
  assign   dma_axi64_core0_wr_hold  =1'b0;  
  dma_axi64_core0_channels    dma_axi64_core0_dma_axi64_core0_channels  (. clk (  dma_axi64_core0_clk  ),. reset (  dma_axi64_core0_reset  ),. scan_en (  dma_axi64_core0_scan_en  ),. pclk (  dma_axi64_core0_pclk  ),. clken (  dma_axi64_core0_clken  ),. pclken (  dma_axi64_core0_pclken  ),. psel (  dma_axi64_core0_psel  ),. penable (  dma_axi64_core0_penable  ),. paddr (  dma_axi64_core0_paddr  [10:0]),. pwrite (  dma_axi64_core0_pwrite  ),. pwdata (  dma_axi64_core0_pwdata  ),. prdata (  dma_axi64_core0_prdata  ),. pslverr (  dma_axi64_core0_pslverr  ),. periph_tx_req (  dma_axi64_core0_periph_tx_req  ),. periph_tx_clr (  dma_axi64_core0_periph_tx_clr  ),. periph_rx_req (  dma_axi64_core0_periph_rx_req  ),. periph_rx_clr (  dma_axi64_core0_periph_rx_clr  ),. rd_cmd_split (  dma_axi64_core0_rd_cmd_split  ),. rd_cmd_line (  dma_axi64_core0_rd_cmd_line  ),. rd_cmd_num (  dma_axi64_core0_rd_cmd_num  ),. wr_cmd_split (  dma_axi64_core0_wr_cmd_split  ),. wr_cmd_pending (  dma_axi64_core0_wr_cmd_pending  ),. wr_cmd_num (  dma_axi64_core0_wr_cmd_num  ),. rd_clr_valid (  dma_axi64_core0_rd_clr_valid  ),. wr_clr_valid (  dma_axi64_core0_wr_clr_valid  ),. rd_clr (  dma_axi64_core0_rd_clr  ),. rd_clr_load (  dma_axi64_core0_rd_clr_load  ),. wr_clr (  dma_axi64_core0_wr_clr  ),. rd_clr_stall (  dma_axi64_core0_rd_clr_stall  ),. wr_clr_stall (  dma_axi64_core0_wr_clr_stall  ),. load_wr (  dma_axi64_core0_load_wr  ),. load_wr_num (  dma_axi64_core0_load_wr_num  ),. load_wr_cycle (  dma_axi64_core0_load_wr_cycle  ),. rd_ch_num (  dma_axi64_core0_rd_ch_num  ),. load_req_in_prog (  dma_axi64_core0_load_req_in_prog  ),. wr_ch_num (  dma_axi64_core0_wr_ch_num_joint  ),. wr_last_cmd (  dma_axi64_core0_wr_last_cmd  ),. load_wdata (  dma_axi64_core0_load_wdata  ),. wr_slverr (  dma_axi64_core0_wr_slverr  ),. wr_decerr (  dma_axi64_core0_wr_decerr  ),. wr_ch_num_resp (  dma_axi64_core0_wr_ch_num_resp  ),. rd_slverr (  dma_axi64_core0_rd_slverr  ),. rd_decerr (  dma_axi64_core0_rd_decerr  ),. rd_ch_num_resp (  dma_axi64_core0_rd_ch_num_resp  ),. wr_clr_last (  dma_axi64_core0_wr_clr_last  ),. ch_int_all_proc (  dma_axi64_core0_ch_int_all_proc  ),. ch_start (  dma_axi64_core0_ch_start  ),. ch_idle (  dma_axi64_core0_ch_idle  ),. ch_active (  dma_axi64_core0_ch_active  ),. ch_rd_active (  dma_axi64_core0_ch_rd_active  ),. ch_wr_active (  dma_axi64_core0_ch_wr_active  ),. rd_line_cmd (  dma_axi64_core0_rd_line_cmd  ),. wr_line_cmd (  dma_axi64_core0_wr_line_cmd  ),. rd_go_next_line (  dma_axi64_core0_rd_go_next_line  ),. wr_go_next_line (  dma_axi64_core0_wr_go_next_line  ),. timeout_aw (  dma_axi64_core0_timeout_aw  ),. timeout_w (  dma_axi64_core0_timeout_w  ),. timeout_ar (  dma_axi64_core0_timeout_ar  ),. timeout_num_aw (  dma_axi64_core0_timeout_num_aw  ),. timeout_num_w (  dma_axi64_core0_timeout_num_w  ),. timeout_num_ar (  dma_axi64_core0_timeout_num_ar  ),. wdt_timeout (  dma_axi64_core0_wdt_timeout  ),. wdt_ch_num (  dma_axi64_core0_wdt_ch_num  ),. ch_fifo_wr_num (  dma_axi64_core0_ch_fifo_wr_num  ),. rd_transfer_num (  dma_axi64_core0_rd_transfer_num  ),. rd_burst_start (  dma_axi64_core0_rd_burst_start  ),. ch_rd_ready (  dma_axi64_core0_ch_rd_ready  ),. rd_burst_addr (  dma_axi64_core0_rd_burst_addr  ),. rd_burst_size (  dma_axi64_core0_rd_burst_size  ),. rd_tokens (  dma_axi64_core0_rd_tokens  ),. rd_cmd_port (  dma_axi64_core0_rd_cmd_port  ),. rd_periph_delay (  dma_axi64_core0_rd_periph_delay  ),. rd_transfer (  dma_axi64_core0_rd_transfer  ),. rd_transfer_size (  dma_axi64_core0_rd_transfer_size  ),. rd_clr_line (  dma_axi64_core0_rd_clr_line  ),. rd_clr_line_num (  dma_axi64_core0_rd_clr_line_num  ),. fifo_rd (  dma_axi64_core0_ch_fifo_rd  ),. fifo_rsize (  dma_axi64_core0_ch_fifo_rsize  ),. fifo_rd_valid (  dma_axi64_core0_ch_fifo_rd_valid  ),. fifo_rdata (  dma_axi64_core0_ch_fifo_rdata  ),. fifo_wr_ready (  dma_axi64_core0_ch_fifo_wr_ready  ),. ch_fifo_rd_num (  dma_axi64_core0_ch_fifo_rd_num  ),. wr_burst_start (  dma_axi64_core0_wr_burst_start_joint  ),. ch_wr_ready (  dma_axi64_core0_ch_wr_ready  ),. wr_burst_addr (  dma_axi64_core0_wr_burst_addr  ),. wr_burst_size (  dma_axi64_core0_wr_burst_size  ),. wr_tokens (  dma_axi64_core0_wr_tokens  ),. wr_cmd_port (  dma_axi64_core0_wr_cmd_port  ),. wr_periph_delay (  dma_axi64_core0_wr_periph_delay  ),. wr_transfer_num (  dma_axi64_core0_wr_transfer_num  ),. wr_transfer (  dma_axi64_core0_wr_transfer  ),. wr_transfer_size (  dma_axi64_core0_wr_transfer_size  ),. wr_next_size (  dma_axi64_core0_wr_next_size  ),. wr_clr_line (  dma_axi64_core0_wr_clr_line  ),. wr_clr_line_num (  dma_axi64_core0_wr_clr_line_num  ),. fifo_wr (  dma_axi64_core0_ch_fifo_wr  ),. fifo_wdata (  dma_axi64_core0_ch_fifo_wdata  ),. fifo_wsize (  dma_axi64_core0_ch_fifo_wsize  ),. joint_mode (  dma_axi64_core0_joint_mode  ),. joint_remote (  dma_axi64_core0_joint_remote  ),. rd_page_cross (  dma_axi64_core0_rd_page_cross  ),. wr_page_cross (  dma_axi64_core0_wr_page_cross  ),. joint_in_prog (  dma_axi64_core0_joint_in_prog  ),. joint_not_in_prog (  dma_axi64_core0_joint_not_in_prog  ),. joint_mux_in_prog (  dma_axi64_core0_joint_mux_in_prog  ),. ch_joint_req (  dma_axi64_core0_ch_joint_req  ));
assign dma_axi64_core0_clk = clk_out;
assign dma_axi64_core0_reset = reset;
assign dma_axi64_core0_scan_en = scan_en;
assign idle = dma_axi64_core0_idle;
assign ch_int_all_proc = dma_axi64_core0_ch_int_all_proc;
assign dma_axi64_core0_ch_start = ch_start;
assign dma_axi64_core0_periph_tx_req = periph_tx_req;
assign periph_tx_clr = dma_axi64_core0_periph_tx_clr;
assign dma_axi64_core0_periph_rx_req = periph_rx_req;
assign periph_rx_clr = dma_axi64_core0_periph_rx_clr;
assign dma_axi64_core0_pclk = clk;
assign dma_axi64_core0_clken = clken;
assign dma_axi64_core0_pclken = pclken;
assign dma_axi64_core0_psel = psel;
assign dma_axi64_core0_penable = penable;
assign dma_axi64_core0_paddr = paddr[10:0];
assign dma_axi64_core0_pwrite = pwrite;
assign dma_axi64_core0_pwdata = pwdata;
assign prdata = dma_axi64_core0_prdata;
assign pslverr = dma_axi64_core0_pslverr;
assign rd_port_num = dma_axi64_core0_rd_port_num;
assign wr_port_num = dma_axi64_core0_wr_port_num;
assign dma_axi64_core0_joint_mode_in = joint_mode;
assign dma_axi64_core0_joint_remote = joint_remote;
assign dma_axi64_core0_rd_prio_top = rd_prio_top;
assign dma_axi64_core0_rd_prio_high = rd_prio_high;
assign dma_axi64_core0_rd_prio_top_num = rd_prio_top_num;
assign dma_axi64_core0_rd_prio_high_num = rd_prio_high_num;
assign dma_axi64_core0_wr_prio_top = wr_prio_top;
assign dma_axi64_core0_wr_prio_high = wr_prio_high;
assign dma_axi64_core0_wr_prio_top_num = wr_prio_top_num;
assign dma_axi64_core0_wr_prio_high_num = wr_prio_high_num;
assign slow_AWADDR = dma_axi64_core0_AWADDR;
assign slow_AWLEN = dma_axi64_core0_AWLEN;
assign slow_AWSIZE = dma_axi64_core0_AWSIZE;
assign slow_AWVALID = dma_axi64_core0_AWVALID;
assign dma_axi64_core0_AWREADY = slow_AWREADY;
assign slow_WDATA = dma_axi64_core0_WDATA;
assign slow_WSTRB = dma_axi64_core0_WSTRB;
assign slow_WLAST = dma_axi64_core0_WLAST;
assign slow_WVALID = dma_axi64_core0_WVALID;
assign dma_axi64_core0_WREADY = slow_WREADY;
assign dma_axi64_core0_BRESP = slow_BRESP;
assign dma_axi64_core0_BVALID = slow_BVALID;
assign slow_BREADY = dma_axi64_core0_BREADY;
assign slow_ARADDR = dma_axi64_core0_ARADDR;
assign slow_ARLEN = dma_axi64_core0_ARLEN;
assign slow_ARSIZE = dma_axi64_core0_ARSIZE;
assign slow_ARVALID = dma_axi64_core0_ARVALID;
assign dma_axi64_core0_ARREADY = slow_ARREADY;
assign dma_axi64_core0_RDATA = slow_RDATA;
assign dma_axi64_core0_RRESP = slow_RRESP;
assign dma_axi64_core0_RLAST = slow_RLAST;
assign dma_axi64_core0_RVALID = slow_RVALID;
assign slow_RREADY = dma_axi64_core0_RREADY;
 
endmodule
 
module prgen_fifo #(
 parameter WIDTH =8,
 parameter DEPTH_FULL =8,
 parameter SINGLE =DEPTH_FULL==1,
 parameter DEPTH =SINGLE ? 1:DEPTH_FULL-1,
 parameter DEPTH_BITS =(DEPTH<=2) ? 1:(DEPTH<=4) ? 2:(DEPTH<=8) ? 3:(DEPTH<=16) ? 4:(DEPTH<=32) ? 5:(DEPTH<=64) ? 6:(DEPTH<=128) ? 7:(DEPTH<=256) ? 8:0,
 parameter LAST_LINE =DEPTH-1) (
  input clk,
  input reset,
  input push,
  input pop,
  input [WIDTH-1:0] din,
  output reg  [WIDTH-1:0] dout,
  output empty,
  output full) ; 
    
    
    
    
    
    
   wire reg_push ;  
   wire reg_pop ;  
   wire fifo_push ;  
   wire fifo_pop ;  
   reg [DEPTH-1:0] fullness_in ;  
   reg [DEPTH-1:0] fullness_out ;  
   reg [DEPTH-1:0] fullness ;  
   reg [WIDTH-1:0] fifo[DEPTH-1:0] ;  
   wire fifo_empty ;  
   wire next ;  
   reg dout_empty ;  
   reg [DEPTH_BITS-1:0] ptr_in ;  
   reg [DEPTH_BITS-1:0] ptr_out ;  
  assign reg_push=push&fifo_empty&(dout_empty|pop); 
  assign reg_pop=pop&fifo_empty; 
  assign fifo_push=!SINGLE&push&(~reg_push); 
  assign fifo_pop=!SINGLE&pop&(~reg_pop); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            dout <={WIDTH{1'b0}};
            dout_empty <=1'b1;
          end 
        else 
          if (reg_push)
             begin 
               dout <=din;
               dout_empty <=1'b0;
             end 
           else 
             if (reg_pop)
                begin 
                  dout <={WIDTH{1'b0}};
                  dout_empty <=1'b1;
                end 
              else 
                if (fifo_pop)
                   begin 
                     dout <=fifo[ptr_out];
                     dout_empty <=1'b0;
                   end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          ptr_in <={DEPTH_BITS{1'b0}};
        else 
          if (fifo_push)
             ptr_in <=ptr_in==LAST_LINE ? 0:ptr_in+1'b1;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          ptr_out <={DEPTH_BITS{1'b0}};
        else 
          if (fifo_pop)
             ptr_out <=ptr_out==LAST_LINE ? 0:ptr_out+1'b1;
 
  always @( posedge clk)
       if (fifo_push)
          fifo [ptr_in]<=din;
 
  always @(  fifo_push or  ptr_in)
       begin 
         fullness_in ={DEPTH{1'b0}};
         fullness_in [ptr_in]=fifo_push;
       end
  
  always @(  fifo_pop or  ptr_out)
       begin 
         fullness_out ={DEPTH{1'b0}};
         fullness_out [ptr_out]=fifo_pop;
       end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          fullness <={DEPTH{1'b0}};
        else 
          if (fifo_push|fifo_pop)
             fullness <=(fullness&(~fullness_out))|fullness_in;
 
  assign next=|fullness; 
  assign fifo_empty=~next; 
  assign empty=fifo_empty&dout_empty; 
  assign full=SINGLE ? !dout_empty:&fullness; 
endmodule
 
module prgen_scatter8_1 #(
 parameter CH_NUM =0) (
  input [8*1-1:0] ch_x,
  output [8-1:0] x) ; 
    
  assign x={ch_x[CH_NUM+7],ch_x[CH_NUM+6],ch_x[CH_NUM+5],ch_x[CH_NUM+4],ch_x[CH_NUM+3],ch_x[CH_NUM+2],ch_x[CH_NUM+1],ch_x[CH_NUM+0]}; 
endmodule
 
module dma_axi64_core0_ch_offsets (
  input clk,
  input reset,
  input ch_update,
  input burst_start,
  input burst_last,
  input [8-1:0] burst_size,
  input load_req_in_prog,
  input [10-1:0] x_size,
  input [10-8-1:0] y_size,
  output [10-1:0] x_offset,
  output [10-8-1:0] y_offset,
  output reg  [10-1:0] x_remain,
  output [10-8-1:0] clr_remain,
  output reg  ch_end,
  output go_next_line,
  input incr,
  input clr_line,
  output line_empty,
  output empty,
  input [3-1:0] start_align,
  input [3-1:0] width_align,
  output [3-1:0] align) ; 
   wire update_line ;  
   //wire go_next_line ;  
   wire line_end_pre ;  
   //wire line_empty ;  
   wire ch_end_pre ;  
   wire ch_update_d ;  
  assign ch_end_pre=burst_start&burst_last; 
  assign go_next_line=1'b0; 
  assign line_empty=1'b0; 
  assign empty=ch_end_pre|ch_end; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          ch_end <=1'b0;
        else 
          if (ch_update)
             ch_end <=1'b0;
           else 
             if (ch_end_pre)
                ch_end <=1'b1;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          x_remain <={10{1'b0}};
        else 
          if (ch_update|go_next_line)
             x_remain <=x_size;
           else 
             if (burst_start&(~load_req_in_prog))
                x_remain <=x_remain-burst_size;
 
  assign x_offset={10{1'b0}}; 
  assign y_offset={10-8{1'b0}}; 
  assign clr_remain={10-8{1'b0}}; 
  assign align=start_align; 
endmodule
 
module prgen_stall #(
 parameter DEPTH =1) (
  input clk,
  input reset,
  input din,
  input stall,
  output dout) ; 
    
   reg [DEPTH-1:0] count ;  
   wire pend ;  
  always @(  posedge clk or  posedge reset)
       if (reset)
          count <={DEPTH{1'b0}};
        else 
          if (pend&(~stall))
             count <=count-1'b1;
           else 
             if (din&stall)
                count <=count+1'b1;
 
  assign pend=(|count); 
  assign dout=(din|pend)&(~stall); 
endmodule
 
module dma_axi64_reg #(
 parameter PROC0_STATUS =8'h00,
 parameter PROC1_STATUS =8'h04,
 parameter PROC2_STATUS =8'h08,
 parameter PROC3_STATUS =8'h0C,
 parameter PROC4_STATUS =8'h10,
 parameter PROC5_STATUS =8'h14,
 parameter PROC6_STATUS =8'h18,
 parameter PROC7_STATUS =8'h1C,
 parameter CORE0_JOINT =8'h30,
 parameter CORE1_JOINT =8'h34,
 parameter CORE0_PRIO =8'h38,
 parameter CORE1_PRIO =8'h3C,
 parameter CORE0_CLKDIV =8'h40,
 parameter CORE1_CLKDIV =8'h44,
 parameter CORE0_START =8'h48,
 parameter CORE1_START =8'h4C,
 parameter PERIPH_RX_CTRL =8'h50,
 parameter PERIPH_TX_CTRL =8'h54,
 parameter IDLE =8'hD0,
 parameter USER_DEF_STAT =8'hE0,
 parameter USER_DEF0_STAT0 =8'hF0,
 parameter USER_DEF0_STAT1 =8'hF4,
 parameter USER_DEF1_STAT0 =8'hF8,
 parameter USER_DEF1_STAT1 =8'hFC) (
  input clk,
  input reset,
  input pclken,
  input psel,
  input penable,
  input [7:0] paddr,
  input pwrite,
  input [31:0] pwdata,
  output reg  [31:0] prdata,
  output reg  pslverr,
  input core0_idle,
  input [8*1-1:0] ch_int_all_proc0,
  output reg  [1-1:0] int_all_proc,
  output [3:0] core0_clkdiv,
  output [7:0] core0_ch_start,
  output joint_mode0,
  output rd_prio_top0,
  output rd_prio_high0,
  output [2:0] rd_prio_top_num0,
  output [2:0] rd_prio_high_num0,
  output wr_prio_top0,
  output wr_prio_high0,
  output [2:0] wr_prio_top_num0,
  output [2:0] wr_prio_high_num0,
  output reg  [31:1] periph_rx_req_reg,
  output reg  [31:1] periph_tx_req_reg,
  input [31:1] periph_rx_clr,
  input [31:1] periph_tx_clr) ; 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   wire [31:0] user_def_stat ;  
   wire [31:0] user_def0_stat0 ;  
   wire [31:0] user_def0_stat1 ;  
   wire user_def_proj ;  
   wire [3:0] user_def_proc_num ;  
   wire user_def_dual_core ;  
   wire user_def_ic ;  
   wire user_def_ic_dual_port ;  
   wire user_def_clkgate ;  
   wire user_def_port0_mux ;  
   wire user_def_port1_mux ;  
   wire wr_joint0 ;  
   wire wr_clkdiv0 ;  
   wire wr_start0 ;  
   wire wr_prio0 ;  
   wire [7:0] proc0_int_stat0 ;  
   wire [15:0] proc0_int_stat ;  
   wire proc0_int ;  
   wire [1-1:0] int_all_proc_pre ;  
   wire wr_periph_rx ;  
   wire wr_periph_tx ;  
   wire [7:0] gpaddr ;  
   wire gpwrite ;  
   wire gpread ;  
   reg [31:0] prdata_pre ;  
   reg pslverr_pre ;  
  assign wr_joint0=gpwrite&gpaddr==CORE0_JOINT; 
  assign wr_clkdiv0=gpwrite&gpaddr==CORE0_CLKDIV; 
  assign wr_start0=gpwrite&gpaddr==CORE0_START; 
  assign wr_prio0=gpwrite&gpaddr==CORE0_PRIO; 
  dma_axi64_reg_core0 dma_axi64_reg_core0(.clk(clk),.reset(reset),.wr_joint(wr_joint0),.wr_clkdiv(wr_clkdiv0),.wr_start(wr_start0),.wr_prio(wr_prio0),.pwdata(pwdata),.clkdiv(core0_clkdiv),.ch_start(core0_ch_start),.joint_mode(joint_mode0),.rd_prio_top(rd_prio_top0),.rd_prio_high(rd_prio_high0),.rd_prio_top_num(rd_prio_top_num0),.rd_prio_high_num(rd_prio_high_num0),.wr_prio_top(wr_prio_top0),.wr_prio_high(wr_prio_high0),.wr_prio_top_num(wr_prio_top_num0),.wr_prio_high_num(wr_prio_high_num0),.user_def_stat0(user_def0_stat0),.user_def_stat1(user_def0_stat1),.ch_int_all_proc(ch_int_all_proc0),.proc0_int_stat(proc0_int_stat0)); 
  assign user_def_proj=0; 
  assign user_def_proc_num=1; 
  assign user_def_dual_core=0; 
  assign user_def_ic=0; 
  assign user_def_ic_dual_port=0; 
  assign user_def_clkgate=0; 
  assign user_def_port0_mux=0; 
  assign user_def_port1_mux=0; 
  assign user_def_stat={user_def_proj,{20{1'b0}},user_def_port1_mux,user_def_port0_mux,user_def_clkgate,user_def_ic_dual_port,user_def_ic,user_def_dual_core,1'b0,user_def_proc_num}; 
  assign gpaddr={8{psel}}&paddr; 
  assign gpwrite=psel&(~penable)&pwrite; 
  assign gpread=psel&(~penable)&(~pwrite); 
  assign wr_periph_rx=gpwrite&gpaddr==PERIPH_RX_CTRL; 
  assign wr_periph_tx=gpwrite&gpaddr==PERIPH_TX_CTRL; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          periph_rx_req_reg <={31{1'b0}};
        else 
          if (wr_periph_rx|(|periph_rx_clr))
             periph_rx_req_reg <=({31{wr_periph_rx}}&pwdata[31:1])&(~periph_rx_clr);
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          periph_tx_req_reg <={31{1'b0}};
        else 
          if (wr_periph_tx|(|periph_tx_clr))
             periph_tx_req_reg <=({31{wr_periph_tx}}&pwdata[31:1])&(~periph_tx_clr);
 
  assign proc0_int_stat={proc0_int_stat0}; 
  assign proc0_int=|proc0_int_stat; 
  assign int_all_proc_pre={proc0_int}; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          int_all_proc <={1{1'b0}};
        else 
          int_all_proc <=int_all_proc_pre;
 
  always @(*)
       begin 
         prdata_pre ={32{1'b0}};
         case (gpaddr)
          PROC0_STATUS :
             prdata_pre ={{16{1'b0}},proc0_int_stat0};
          CORE0_JOINT :
             prdata_pre ={{31{1'b0}},joint_mode0};
          CORE0_PRIO :
             prdata_pre ={{16{1'b0}},wr_prio_high0,wr_prio_high_num0,wr_prio_top0,wr_prio_top_num0,rd_prio_high0,rd_prio_high_num0,rd_prio_top0,rd_prio_top_num0};
          CORE0_CLKDIV :
             prdata_pre ={{28{1'b0}},core0_clkdiv};
          CORE0_START :
             prdata_pre ={32{1'b0}};
          PERIPH_RX_CTRL :
             prdata_pre ={periph_rx_req_reg,1'b0};
          PERIPH_TX_CTRL :
             prdata_pre ={periph_tx_req_reg,1'b0};
          IDLE :
             prdata_pre ={{30{1'b0}},core0_idle};
          USER_DEF_STAT :
             prdata_pre =user_def_stat;
          USER_DEF0_STAT0 :
             prdata_pre =user_def0_stat0;
          USER_DEF0_STAT1 :
             prdata_pre =user_def0_stat1;
          default :
             prdata_pre ={32{1'b0}};
         endcase 
       end
  
  always @(    gpaddr or  gpread or  gpwrite or  psel)
       begin 
         pslverr_pre =1'b0;
         case (gpaddr)
          PROC0_STATUS :
             pslverr_pre =gpwrite;
          CORE0_JOINT :
             pslverr_pre =1'b0;
          CORE0_PRIO :
             pslverr_pre =1'b0;
          CORE0_CLKDIV :
             pslverr_pre =1'b0;
          CORE0_START :
             pslverr_pre =gpread;
          PERIPH_RX_CTRL :
             pslverr_pre =1'b0;
          PERIPH_TX_CTRL :
             pslverr_pre =1'b0;
          IDLE :
             pslverr_pre =gpwrite;
          USER_DEF_STAT :
             pslverr_pre =gpwrite;
          USER_DEF0_STAT0 :
             pslverr_pre =gpwrite;
          USER_DEF0_STAT1 :
             pslverr_pre =gpwrite;
          default :
             pslverr_pre =psel;
         endcase 
       end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          prdata <={32{1'b0}};
        else 
          if (gpread&pclken)
             prdata <=prdata_pre;
           else 
             if (pclken)
                prdata <={32{1'b0}};
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          pslverr <=1'b0;
        else 
          if ((gpread|gpwrite)&pclken)
             pslverr <=pslverr_pre;
           else 
             if (pclken)
                pslverr <=1'b0;
 
endmodule
 
module dma_axi64_core0_ch (
  input clk,
  input reset,
  input scan_en,
  input pclk,
  input clken,
  input pclken,
  input psel,
  input penable,
  input [7:0] paddr,
  input pwrite,
  input [31:0] pwdata,
  output [31:0] prdata,
  output pslverr,
  input [31:1] periph_tx_req,
  output [31:1] periph_tx_clr,
  input [31:1] periph_rx_req,
  output [31:1] periph_rx_clr,
  input rd_cmd_split,
  input rd_cmd_line,
  input rd_clr_line,
  input rd_clr,
  input rd_clr_load,
  input rd_slverr,
  input rd_decerr,
  input wr_cmd_split,
  input wr_cmd_pending,
  input wr_clr_line,
  input wr_clr,
  input wr_clr_last,
  input wr_slverr,
  input wr_decerr,
  input load_wr,
  input [1:0] load_wr_cycle,
  input [64-1:0] load_wdata,
  output load_req_in_prog,
  output [1-1:0] int_all_proc,
  input ch_start,
  output idle,
  output ch_active,
  output ch_rd_active,
  output ch_wr_active,
  output wr_last_cmd,
  output rd_line_cmd,
  output wr_line_cmd,
  output rd_go_next_line,
  output wr_go_next_line,
  output rd_ready,
  input rd_burst_start,
  output [32-1:0] rd_burst_addr,
  output [8-1:0] rd_burst_size,
  output [6-1:0] rd_tokens,
  output rd_port_num,
  output [3-1:0] rd_periph_delay,
  output rd_clr_valid,
  input rd_transfer,
  input [4-1:0] rd_transfer_size,
  output rd_clr_stall,
  output wr_ready,
  input wr_burst_start,
  output [32-1:0] wr_burst_addr,
  output [8-1:0] wr_burst_size,
  output [6-1:0] wr_tokens,
  output wr_port_num,
  output [3-1:0] wr_periph_delay,
  output wr_clr_valid,
  input wr_transfer,
  input [4-1:0] wr_transfer_size,
  input [4-1:0] wr_next_size,
  output wr_clr_stall,
  output wr_incr,
  input timeout_aw,
  input timeout_w,
  input timeout_ar,
  input wdt_timeout,
  input fifo_wr,
  input [64-1:0] fifo_wdata,
  input [4-1:0] fifo_wsize,
  input fifo_rd,
  input [4-1:0] fifo_rsize,
  output fifo_rd_valid,
  output [64-1:0] fifo_rdata,
  output fifo_wr_ready,
  input joint_mode,
  input joint_remote,
  input rd_page_cross,
  input wr_page_cross,
  output joint_in_prog,
  output joint_not_in_prog,
  output joint_mux_in_prog,
  output joint_req) ; 
   wire [32-1:0] load_addr ;  
   wire load_in_prog ;  
   //wire load_req_in_prog ;  
   wire ch_update ;  
   wire [32-1:0] rd_start_addr ;  
   wire [32-1:0] wr_start_addr ;  
   wire [10-1:0] x_size ;  
   wire [10-8-1:0] y_size ;  
   wire block ;  
   wire joint ;  
   wire [12-1:0] frame_width ;  
   wire [3-1:0] width_align ;  
   //wire [3-1:0] rd_periph_delay ;  
   //wire [3-1:0] wr_periph_delay ;  
   wire rd_periph_block ;  
   wire wr_periph_block ;  
   //wire [6-1:0] rd_tokens ;  
   //wire [6-1:0] wr_tokens ;  
   //wire rd_port_num ;  
   //wire wr_port_num ;  
   wire [4-1:0] rd_outs_max ;  
   wire [4-1:0] wr_outs_max ;  
   wire [12-1:0] rd_wait_limit ;  
   wire [12-1:0] wr_wait_limit ;  
   wire rd_incr ;  
   //wire wr_incr ;  
   wire [8-1:0] rd_burst_max_size ;  
   wire [8-1:0] wr_burst_max_size ;  
   wire [4:0] rd_periph_num ;  
   wire [4:0] wr_periph_num ;  
   wire wr_outstanding ;  
   wire rd_outstanding ;  
   wire ch_retry_wait ;  
   //wire ch_rd_active ;  
   //wire ch_wr_active ;  
   wire ch_in_prog ;  
   wire [1:0] end_swap ;  
   wire [10-1:0] rd_x_offset ;  
   wire [10-8-1:0] rd_y_offset ;  
   wire [10-1:0] rd_x_remain ;  
   wire [10-8-1:0] rd_clr_remain ;  
   wire rd_ch_end ;  
   //wire rd_go_next_line ;  
   wire rd_line_empty ;  
   wire rd_empty ;  
   wire [3-1:0] rd_align ;  
   wire [10-1:0] wr_x_offset ;  
   wire [10-8-1:0] wr_y_offset ;  
   wire [10-1:0] wr_x_remain ;  
   wire [10-8-1:0] wr_clr_remain ;  
   wire wr_ch_end ;  
   //wire wr_go_next_line ;  
   wire wr_line_empty ;  
   wire wr_empty ;  
   wire [3-1:0] wr_align ;  
   wire wr_ch_end_pre ;  
   reg wr_ch_end_reg ;  
   wire [5:0] rd_gap ;  
   wire [5:0] wr_fullness ;  
   wire rd_cmd_outs ;  
   wire rd_clr_outs ;  
   wire [4-1:0] rd_outs ;  
   wire rd_outs_empty ;  
   wire outs_empty ;  
   wire rd_stall ;  
   wire timeout_rresp ;  
   wire wr_cmd_outs ;  
   wire wr_clr_outs ;  
   wire [4-1:0] wr_outs ;  
   wire wr_outs_empty ;  
   wire wr_stall ;  
   wire wr_stall_pre ;  
   wire timeout_wresp ;  
   wire rd_burst_last ;  
   //wire [32-1:0] rd_burst_addr ;  
   //wire [8-1:0] rd_burst_size ;  
   wire rd_burst_ready ;  
   wire rd_joint_ready ;  
   wire rd_joint_flush ;  
   wire joint_burst_req ;  
   wire wr_burst_last ;  
   //wire [32-1:0] wr_burst_addr ;  
   //wire [8-1:0] wr_burst_size ;  
   wire wr_burst_ready ;  
   wire wr_single ;  
   wire wr_joint_ready ;  
   wire wr_joint_flush ;  
   wire joint_line_req ;  
   //wire [31:1] periph_rx_clr ;  
   wire rd_periph_ready ;  
   //wire [31:1] periph_tx_clr ;  
   wire wr_periph_ready ;  
   wire rd_wait_ready ;  
   wire wr_wait_ready ;  
   //wire fifo_wr_ready ;  
   wire fifo_overflow ;  
   wire fifo_underflow ;  
   wire rd_clr_block_pre ;  
   wire rd_clr_block ;  
   //wire rd_clr_valid ;  
   wire wr_clr_block_pre ;  
   wire wr_clr_block ;  
   //wire wr_clr_valid ;  
   wire wr_clr_mux ;  
   wire rd_cmd_line_d ;  
   //wire rd_clr_stall ;  
   //wire wr_clr_stall ;  
   wire allow_line_cmd ;  
   wire load_cmd ;  
   wire [4:0] timeout_bus ;  
   wire joint_flush ;  
   wire page_cross ;  
   reg joint_cross_reg ;  
   wire joint_cross ;  
   reg rd_joint_not_in_prog ;  
   reg wr_joint_not_in_prog ;  
   //wire joint_not_in_prog ;  
   reg rd_joint_in_prog ;  
   reg wr_joint_in_prog ;  
   //wire joint_in_prog ;  
   wire rd_clr_outs_d_pre ;  
   wire rd_clr_outs_d ;  
   wire wr_clr_outs_d_pre ;  
   wire wr_clr_outs_d ;  
   wire rd_clr_d ;  
   wire wr_clr_d ;  
   wire access_port0_mux ;  
   wire access_port1_mux ;  
   wire idle_pre ;  
   wire clk_en ;  
   wire gclk ;  
  assign ch_active=ch_in_prog|load_in_prog; 
  assign outs_empty=rd_outs_empty&wr_outs_empty; 
  assign rd_clr_outs_d_pre=rd_clr_outs&(~rd_burst_start); 
  assign wr_clr_outs_d_pre=wr_clr_outs&(~wr_burst_start); 
  prgen_delay #(1)delay_rd_clr_outs(.clk(clk),.reset(reset),.din(rd_clr_outs_d_pre),.dout(rd_clr_outs_d)); 
  prgen_delay #(1)delay_wr_clr_outs(.clk(clk),.reset(reset),.din(wr_clr_outs_d_pre),.dout(wr_clr_outs_d)); 
  prgen_delay #(1)delay_rd_clr(.clk(clk),.reset(reset),.din(rd_clr),.dout(rd_clr_d)); 
  prgen_delay #(1)delay_wr_clr(.clk(clk),.reset(reset),.din(wr_clr),.dout(wr_clr_d)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          rd_joint_not_in_prog <=1'b0;
        else 
          if (ch_update)
             rd_joint_not_in_prog <=1'b0;
           else 
             if (rd_burst_start)
                rd_joint_not_in_prog <=(~joint_req);
              else 
                if (rd_outs_empty&rd_clr_outs_d)
                   rd_joint_not_in_prog <=1'b0;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          wr_joint_not_in_prog <=1'b0;
        else 
          if (ch_update)
             wr_joint_not_in_prog <=1'b0;
           else 
             if (wr_burst_start)
                wr_joint_not_in_prog <=(~joint_req);
              else 
                if (wr_outs_empty&wr_clr_outs_d)
                   wr_joint_not_in_prog <=1'b0;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          rd_joint_in_prog <=1'b0;
        else 
          if (ch_update)
             rd_joint_in_prog <=1'b0;
           else 
             if (rd_burst_start)
                rd_joint_in_prog <=joint_req;
              else 
                if (rd_outs_empty&rd_clr_outs_d)
                   rd_joint_in_prog <=1'b0;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          wr_joint_in_prog <=1'b0;
        else 
          if (ch_update)
             wr_joint_in_prog <=1'b0;
           else 
             if (wr_burst_start)
                wr_joint_in_prog <=joint_req;
              else 
                if (wr_outs_empty&wr_clr_outs_d)
                   wr_joint_in_prog <=1'b0;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          joint_cross_reg <=1'b0;
        else 
          if (ch_update)
             joint_cross_reg <=1'b0;
           else 
             if (page_cross&joint)
                joint_cross_reg <=1'b1;
              else 
                if (joint_not_in_prog&outs_empty)
                   joint_cross_reg <=1'b0;
 
  assign joint_cross=joint_cross_reg; 
  assign page_cross=rd_page_cross|wr_page_cross; 
  assign joint_in_prog=rd_joint_in_prog|wr_joint_in_prog; 
  assign joint_not_in_prog=rd_joint_not_in_prog|wr_joint_not_in_prog; 
  assign access_port0_mux=((rd_port_num==1'b0)|((wr_port_num==1'b0)))&0; 
  assign access_port1_mux=((rd_port_num==1'b1)|((wr_port_num==1'b1)))&0; 
  assign joint_mux_in_prog=joint_in_prog&(access_port0_mux|access_port1_mux); 
  assign joint_req=joint&rd_joint_ready&wr_joint_ready&(~joint_cross)&(~load_req_in_prog); 
  assign joint_flush=rd_joint_flush|wr_joint_flush; 
  assign rd_clr_block=1'b1; 
  assign wr_clr_block=1'b1; 
  assign wr_clr_mux=wr_clr; 
  assign rd_clr_stall=1'b0; 
  assign wr_clr_stall=1'b0; 
  assign allow_line_cmd=1'b0; 
  assign rd_line_cmd=1'b0; 
  assign wr_line_cmd=1'b0; 
  assign rd_clr_valid=rd_clr_block&(~ch_retry_wait); 
  assign wr_clr_valid=wr_clr_block&(~ch_retry_wait); 
  assign rd_ready=(~rd_stall)&(~rd_clr_stall)&ch_rd_active&(rd_periph_ready|load_req_in_prog)&rd_wait_ready&rd_burst_ready; 
  assign wr_ready=(~wr_stall)&(~wr_clr_stall)&ch_wr_active&wr_periph_ready&wr_wait_ready&wr_burst_ready; 
  assign wr_last_cmd=wr_empty; 
  assign load_cmd=load_req_in_prog&rd_burst_start; 
  assign rd_cmd_outs=rd_burst_start|rd_cmd_split; 
  assign wr_cmd_outs=wr_burst_start|wr_cmd_split; 
  assign rd_clr_outs=rd_clr|rd_clr_load; 
  assign wr_clr_outs=wr_clr; 
  assign timeout_bus={timeout_aw,timeout_w,{timeout_wresp&(~timeout_aw)},timeout_ar,{timeout_rresp&(~timeout_ar)}}; 
  assign clk_en=ch_active|ch_update|(~outs_empty)|(~rd_wait_ready)|(~wr_wait_ready); 
  assign idle_pre=!clk_en; 
  prgen_delay #(1)delay_idle(.clk(clk),.reset(reset),.din(idle_pre),.dout(idle)); 
  assign gclk=clk; 
  dma_axi64_core0_ch_reg dma_axi64_ch_reg(.clk(pclk),.clken(clken),.pclken(pclken),.reset(reset),.psel(psel),.penable(penable),.paddr(paddr),.pwrite(pwrite),.pwdata(pwdata),.prdata(prdata),.pslverr(pslverr),.timeout_bus(timeout_bus),.wdt_timeout(wdt_timeout),.ch_start(ch_start),.load_wr(load_wr),.load_wr_cycle(load_wr_cycle),.load_wdata(load_wdata),.load_in_prog(load_in_prog),.load_req_in_prog(load_req_in_prog),.rd_ch_end(rd_ch_end),.wr_ch_end(wr_ch_end),.wr_clr_last(wr_clr_last),.rd_slverr(rd_slverr),.rd_decerr(rd_decerr),.wr_slverr(wr_slverr),.wr_decerr(wr_decerr),.int_all_proc(int_all_proc),.ch_rd_active(ch_rd_active),.ch_wr_active(ch_wr_active),.ch_in_prog(ch_in_prog),.wr_outstanding(wr_outstanding),.rd_outstanding(rd_outstanding),.ch_retry_wait(ch_retry_wait),.joint_mode(joint_mode),.joint_remote(joint_remote),.joint(joint),.joint_cross(joint_cross),.page_cross(page_cross),.joint_flush(joint_flush),.rd_x_offset(rd_x_offset),.rd_y_offset(rd_y_offset),.wr_x_offset(wr_x_offset),.wr_y_offset(wr_y_offset),.rd_gap(rd_gap),.wr_fullness(wr_fullness),.fifo_overflow(fifo_overflow),.fifo_underflow(fifo_underflow),.load_cmd(load_cmd),.load_addr(load_addr),.ch_update(ch_update),.rd_start_addr(rd_start_addr),.wr_start_addr(wr_start_addr),.x_size(x_size),.y_size(y_size),.rd_burst_max_size(rd_burst_max_size),.wr_burst_max_size(wr_burst_max_size),.rd_periph_delay(rd_periph_delay),.wr_periph_delay(wr_periph_delay),.rd_periph_block(rd_periph_block),.wr_periph_block(wr_periph_block),.rd_tokens(rd_tokens),.wr_tokens(wr_tokens),.end_swap(end_swap),.rd_port_num(rd_port_num),.wr_port_num(wr_port_num),.rd_outs_max(rd_outs_max),.wr_outs_max(wr_outs_max),.rd_outs(rd_outs),.wr_outs(wr_outs),.outs_empty(outs_empty),.rd_wait_limit(rd_wait_limit),.wr_wait_limit(wr_wait_limit),.rd_periph_num(rd_periph_num),.wr_periph_num(wr_periph_num),.rd_incr(rd_incr),.wr_incr(wr_incr),.block(block),.allow_line_cmd(allow_line_cmd),.frame_width(frame_width),.width_align(width_align)); 
  dma_axi64_core0_ch_offsets dma_axi64_ch_offsets_rd(.clk(gclk),.reset(reset),.ch_update(ch_update),.burst_start(rd_burst_start),.burst_last(rd_burst_last),.burst_size(rd_burst_size),.load_req_in_prog(load_req_in_prog),.x_size(x_size),.y_size(y_size),.x_offset(rd_x_offset),.y_offset(rd_y_offset),.x_remain(rd_x_remain),.clr_remain(rd_clr_remain),.ch_end(rd_ch_end),.go_next_line(rd_go_next_line),.incr(rd_incr),.clr_line(rd_clr_line),.line_empty(rd_line_empty),.empty(rd_empty),.start_align(rd_start_addr[3-1:0]),.width_align(width_align),.align(wr_align)); 
  dma_axi64_core0_ch_offsets dma_axi64_ch_offsets_wr(.clk(gclk),.reset(reset),.ch_update(ch_update),.burst_start(wr_burst_start),.burst_last(wr_burst_last),.burst_size(wr_burst_size),.load_req_in_prog(1'b0),.x_size(x_size),.y_size(y_size),.x_offset(wr_x_offset),.y_offset(wr_y_offset),.x_remain(wr_x_remain),.clr_remain(wr_clr_remain),.ch_end(wr_ch_end),.go_next_line(wr_go_next_line),.incr(wr_incr),.clr_line(wr_clr_line),.line_empty(wr_line_empty),.empty(wr_empty),.start_align(wr_start_addr[3-1:0]),.width_align(width_align),.align(rd_align)); 
  dma_axi64_core0_ch_remain dma_axi64_ch_remain(.clk(gclk),.reset(reset),.ch_update(ch_update),.wr_outstanding(wr_outstanding),.rd_outstanding(rd_outstanding),.load_req_in_prog(load_req_in_prog),.rd_line_cmd(rd_line_cmd),.rd_burst_start(rd_burst_start),.rd_burst_size(rd_burst_size),.rd_transfer(rd_transfer),.rd_transfer_size(rd_transfer_size),.wr_clr_line(wr_clr_line),.wr_burst_start(wr_burst_start),.wr_burst_size(wr_burst_size),.wr_transfer(wr_transfer),.wr_transfer_size(wr_transfer_size),.rd_gap(rd_gap),.wr_fullness(wr_fullness)); 
  dma_axi64_core0_ch_outs dma_axi64_ch_outs_rd(.clk(gclk),.reset(reset),.cmd(rd_cmd_outs),.clr(rd_clr_outs),.outs_max(rd_outs_max),.outs(rd_outs),.outs_empty(rd_outs_empty),.stall(rd_stall),.timeout(timeout_rresp)); 
  dma_axi64_core0_ch_outs dma_axi64_ch_outs_wr(.clk(gclk),.reset(reset),.cmd(wr_cmd_outs),.clr(wr_clr_outs),.outs_max(wr_outs_max),.outs(wr_outs),.outs_empty(wr_outs_empty),.stall(wr_stall_pre),.timeout(timeout_wresp)); 
  assign wr_stall=wr_stall_pre&(~joint_req); 
  dma_axi64_core0_ch_calc #(.READ(1))dma_axi64_ch_calc_rd(.clk(gclk),.reset(reset),.wr_cmd_pending(1'b0),.outs_empty(outs_empty),.load_in_prog(load_in_prog),.load_req_in_prog(load_req_in_prog),.load_addr(load_addr),.ch_update(ch_update),.ch_end(rd_ch_end),.ch_end_flush(1'b0),.go_next_line(rd_go_next_line),.burst_start(rd_burst_start),.burst_last(rd_burst_last),.burst_max_size(rd_burst_max_size),.start_addr(rd_start_addr),.incr(rd_incr),.frame_width(frame_width),.x_size(x_size[8-1:0]),.x_remain(rd_x_remain),.fifo_remain(rd_gap),.fifo_wr_ready(fifo_wr_ready),.burst_addr(rd_burst_addr),.burst_size(rd_burst_size),.burst_ready(rd_burst_ready),.single(),.joint_ready_out(rd_joint_ready),.joint_ready_in(wr_joint_ready),.joint_line_req_in(joint_line_req),.joint_line_req_out(),.joint_burst_req_in(1'b0),.joint_burst_req_out(joint_burst_req),.joint_line_req_clr(wr_clr_d),.joint(joint),.page_cross(rd_page_cross),.joint_cross(joint_cross),.joint_flush(rd_joint_flush),.joint_flush_in(joint_flush)); 
  dma_axi64_core0_ch_calc #(.READ(0))dma_axi64_ch_calc_wr(.clk(gclk),.reset(reset),.wr_cmd_pending(wr_cmd_pending),.outs_empty(outs_empty),.load_in_prog(load_in_prog),.load_req_in_prog(1'b0),.load_addr({32{1'b0}}),.ch_update(ch_update),.ch_end(wr_ch_end),.ch_end_flush(rd_ch_end),.go_next_line(wr_go_next_line),.burst_start(wr_burst_start),.burst_last(wr_burst_last),.burst_max_size(wr_burst_max_size),.start_addr(wr_start_addr),.incr(wr_incr),.frame_width(frame_width),.x_size(x_size[8-1:0]),.x_remain(wr_x_remain),.fifo_wr_ready(1'b0),.fifo_remain(wr_fullness),.burst_addr(wr_burst_addr),.burst_size(wr_burst_size),.burst_ready(wr_burst_ready),.single(wr_single),.joint_ready_out(wr_joint_ready),.joint_ready_in(rd_joint_ready),.joint_line_req_in(1'b0),.joint_line_req_out(joint_line_req),.joint_burst_req_in(joint_burst_req),.joint_burst_req_out(),.joint_line_req_clr(rd_clr_d),.joint(joint),.page_cross(wr_page_cross),.joint_cross(joint_cross),.joint_flush(wr_joint_flush),.joint_flush_in(joint_flush)); 
  assign rd_wait_ready=1'b1; 
  assign wr_wait_ready=1'b1; 
  dma_axi64_core0_ch_periph_mux dma_axi64_ch_periph_mux_rd(.clk(gclk),.reset(reset),.clken(clken),.periph_req(periph_rx_req),.periph_clr(periph_rx_clr),.periph_ready(rd_periph_ready),.periph_num(rd_periph_num),.clr_valid(rd_clr_valid),.clr(rd_clr)); 
  dma_axi64_core0_ch_periph_mux dma_axi64_ch_periph_mux_wr(.clk(gclk),.reset(reset),.clken(clken),.periph_req(periph_tx_req),.periph_clr(periph_tx_clr),.periph_ready(wr_periph_ready),.periph_num(wr_periph_num),.clr_valid(wr_clr_valid),.clr(wr_clr_mux)); 
  dma_axi64_core0_ch_fifo_ctrl dma_axi64_ch_fifo_ctrl(.clk(clk),.reset(reset),.end_swap(end_swap),.joint_in_prog(joint_in_prog),.wr_outstanding(wr_outstanding),.ch_update(ch_update),.fifo_wr(fifo_wr),.fifo_wdata(fifo_wdata),.fifo_wsize(fifo_wsize),.wr_align(wr_align),.wr_single(wr_single),.rd_incr(rd_incr),.fifo_rd(fifo_rd),.fifo_rsize(fifo_rsize),.rd_align(rd_align),.wr_incr(wr_incr),.wr_burst_size(wr_burst_size),.rd_clr_line(rd_clr_line),.wr_clr_line(wr_clr_line),.wr_next_size(wr_next_size),.fifo_rd_valid(fifo_rd_valid),.fifo_rdata(fifo_rdata),.fifo_wr_ready(fifo_wr_ready),.fifo_overflow(fifo_overflow),.fifo_underflow(fifo_underflow)); 
endmodule
 
module dma_axi64_core0_ch_fifo_ctrl (
  input clk,
  input reset,
  input [1:0] end_swap,
  input joint_in_prog,
  input wr_outstanding,
  input ch_update,
  input fifo_wr,
  input [64-1:0] fifo_wdata,
  input [4-1:0] fifo_wsize,
  input [3-1:0] wr_align,
  input rd_incr,
  input fifo_rd,
  input [4-1:0] fifo_rsize,
  input [3-1:0] rd_align,
  input wr_incr,
  input wr_single,
  input [8-1:0] wr_burst_size,
  input rd_clr_line,
  input wr_clr_line,
  input [4-1:0] wr_next_size,
  output fifo_rd_valid,
  output [64-1:0] fifo_rdata,
  output fifo_wr_ready,
  output fifo_overflow,
  output fifo_underflow) ; 
   wire slice_wr ;  
   wire slice_wr_fifo ;  
   wire [5-1:0] slice_wr_ptr ;  
   wire [8-1:0] slice_bsel ;  
   wire [64-1:0] slice_wdata ;  
   wire [4-1:0] slice_wsize ;  
   wire slice_rd ;  
   wire [64-1:0] slice_rdata ;  
   wire [4-1:0] slice_rsize ;  
   wire [5-1:0] slice_rd_ptr ;  
   wire slice_rd_valid ;  
   wire [5-1:0] rd_ptr ;  
   wire [5-1:0] wr_ptr ;  
   wire [4-1:0] rd_line_remain ;  
   wire joint_delay ;  
   //wire fifo_wr_ready ;  
   //wire fifo_overflow ;  
   //wire fifo_underflow ;  
   wire [64-1:0] DOUT ;  
   wire fifo_wr_d ;  
   reg [64-1:0] fifo_wdata_d ;  
   wire fifo_wr_valid ;  
   wire [64-1:0] fifo_wdata_valid ;  
  assign fifo_wr_valid=fifo_wr; 
  assign fifo_wdata_valid=fifo_wdata; 
  assign fifo_rdata=slice_rdata&{64{slice_rd_valid}}; 
  assign fifo_rd_valid=slice_rd_valid; 
  dma_axi64_core0_ch_wr_slicer dma_axi64_ch_wr_slicer(.clk(clk),.reset(reset),.ch_update(ch_update),.rd_clr_line(rd_clr_line),.fifo_wr(fifo_wr_valid),.fifo_wdata(fifo_wdata_valid),.fifo_wsize(fifo_wsize),.wr_align(wr_align),.wr_ptr(wr_ptr),.rd_incr(rd_incr),.end_swap(end_swap),.slice_wr(slice_wr),.slice_wr_fifo(slice_wr_fifo),.slice_wr_ptr(slice_wr_ptr),.slice_bsel(slice_bsel),.slice_wdata(slice_wdata),.slice_wsize(slice_wsize)); 
  dma_axi64_core0_ch_rd_slicer dma_axi64_ch_rd_slicer(.clk(clk),.reset(reset),.fifo_rd(fifo_rd),.fifo_rdata(DOUT),.fifo_rsize(fifo_rsize),.rd_align(rd_align),.rd_ptr(rd_ptr),.rd_line_remain(rd_line_remain),.wr_incr(wr_incr),.wr_single(wr_single),.slice_rd(slice_rd),.slice_rdata(slice_rdata),.slice_rd_valid(slice_rd_valid),.slice_rsize(slice_rsize),.slice_rd_ptr(slice_rd_ptr)); 
  dma_axi64_core0_ch_fifo_ptr dma_axi64_ch_fifo_ptr(.clk(clk),.reset(reset),.joint_in_prog(joint_in_prog),.wr_outstanding(wr_outstanding),.ch_update(ch_update),.fifo_rd(fifo_rd),.fifo_rsize(fifo_rsize),.slice_wr(slice_wr),.slice_wr_fifo(slice_wr_fifo),.slice_wsize(slice_wsize),.slice_rd(slice_rd),.slice_rsize(slice_rsize),.rd_clr_line(rd_clr_line),.wr_clr_line(wr_clr_line),.rd_ptr(rd_ptr),.wr_ptr(wr_ptr),.rd_line_remain(rd_line_remain),.joint_delay(joint_delay),.wr_next_size(wr_next_size),.wr_burst_size(wr_burst_size),.fifo_wr_ready(fifo_wr_ready),.fifo_overflow(fifo_overflow),.fifo_underflow(fifo_underflow)); 
  dma_axi64_core0_ch_fifo dma_axi64_ch_fifo(.CLK(clk),.WR(slice_wr_fifo),.RD(slice_rd),.WR_ADDR(slice_wr_ptr[5-1:3]),.RD_ADDR(slice_rd_ptr[5-1:3]),.DIN(slice_wdata),.BSEL(slice_bsel),.DOUT(DOUT)); 
endmodule
 
module dma_axi64_core0_ch_fifo_ptr (
  input clk,
  input reset,
  input joint_in_prog,
  input wr_outstanding,
  input ch_update,
  input fifo_rd,
  input [4-1:0] fifo_rsize,
  input slice_wr,
  input slice_wr_fifo,
  input [4-1:0] slice_wsize,
  input slice_rd,
  input [4-1:0] slice_rsize,
  input rd_clr_line,
  input wr_clr_line,
  input [4-1:0] wr_next_size,
  input [8-1:0] wr_burst_size,
  output reg  [5-1:0] rd_ptr,
  output reg  [5-1:0] wr_ptr,
  output reg  [4-1:0] rd_line_remain,
  output joint_delay,
  output reg  fifo_wr_ready,
  output reg  fifo_overflow,
  output reg  fifo_underflow) ; 
   wire [5-1:0] rd_ptr_pre ;  
   wire [5-1:0] wr_ptr_pre ;  
   wire [5+1:0] fullness_pre ;  
   reg [5+1:0] fullness ;  
   wire joint_in_prog_d ;  
   reg joint_delay_reg ;  
   wire fifo_overflow_pre ;  
   wire fifo_underflow_pre ;  
  assign wr_ptr_pre=wr_ptr+({4{slice_wr}}&slice_wsize); 
  assign rd_ptr_pre=rd_ptr+({4{slice_rd}}&slice_rsize); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          wr_ptr <={5{1'b0}};
        else 
          if (ch_update)
             wr_ptr <={5{1'b0}};
           else 
             if (slice_wr)
                wr_ptr <=wr_ptr_pre;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          rd_ptr <={5{1'b0}};
        else 
          if (ch_update)
             rd_ptr <={5{1'b0}};
           else 
             if (slice_rd)
                rd_ptr <=rd_ptr_pre;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          rd_line_remain <=4'd8;
        else 
          if (ch_update|wr_clr_line)
             rd_line_remain <=4'd8;
           else 
             if (slice_rd&(rd_line_remain==slice_rsize))
                rd_line_remain <=4'd8;
              else 
                if (slice_rd)
                   rd_line_remain <=rd_line_remain-slice_rsize;
 
  assign fullness_pre=fullness+({4{slice_wr}}&slice_wsize)-({4{fifo_rd}}&fifo_rsize); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          fullness <={5+2{1'b0}};
        else 
          if (ch_update)
             fullness <={5+2{1'b0}};
           else 
             if (fifo_rd|slice_wr)
                fullness <=fullness_pre;
 
  prgen_delay #(1)delay_joint_in_prog(.clk(clk),.reset(reset),.din(joint_in_prog),.dout(joint_in_prog_d)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          joint_delay_reg <=1'b0;
        else 
          if (joint_in_prog&(~joint_in_prog_d))
             joint_delay_reg <=fullness>32-4'd8;
           else 
             if (~joint_in_prog)
                joint_delay_reg <=1'b0;
 
  assign joint_delay=joint_delay_reg; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          fifo_wr_ready <=1'b0;
        else 
          if (joint_in_prog)
             fifo_wr_ready <=1'b0;
           else 
             if (|wr_next_size)
                fifo_wr_ready <=fullness_pre>=wr_next_size;
 
  assign fifo_underflow_pre=fullness[5+1]; 
  assign fifo_overflow_pre=(~fullness[5+1])&(fullness[5:0]>32); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            fifo_overflow <=1'b0;
            fifo_underflow <=1'b0;
          end 
        else 
          if (ch_update)
             begin 
               fifo_overflow <=1'b0;
               fifo_underflow <=1'b0;
             end 
           else 
             if ((!fifo_overflow)&(!fifo_underflow))
                begin 
                  fifo_overflow <=fifo_overflow_pre;
                  fifo_underflow <=fifo_underflow_pre;
                end
  
endmodule
 
module dma_axi64_core0_ch_empty (
  input clk,
  input reset,
  input scan_en,
  input pclk,
  input clken,
  input pclken,
  input psel,
  input penable,
  input [7:0] paddr,
  input pwrite,
  input [31:0] pwdata,
  output [31:0] prdata,
  output pslverr,
  input [31:1] periph_tx_req,
  output [31:1] periph_tx_clr,
  input [31:1] periph_rx_req,
  output [31:1] periph_rx_clr,
  input rd_cmd_split,
  input rd_cmd_line,
  input rd_clr_line,
  input rd_clr,
  input rd_clr_load,
  input rd_slverr,
  input rd_decerr,
  input wr_cmd_split,
  input wr_cmd_pending,
  input wr_clr_line,
  input wr_clr,
  input wr_clr_last,
  input wr_slverr,
  input wr_decerr,
  input load_wr,
  input [1:0] load_wr_cycle,
  input [64-1:0] load_wdata,
  output load_req_in_prog,
  output [1-1:0] int_all_proc,
  input ch_start,
  output idle,
  output ch_active,
  output ch_rd_active,
  output ch_wr_active,
  output wr_last_cmd,
  output rd_line_cmd,
  output wr_line_cmd,
  output rd_go_next_line,
  output wr_go_next_line,
  output rd_ready,
  input rd_burst_start,
  output [32-1:0] rd_burst_addr,
  output [8-1:0] rd_burst_size,
  output [6-1:0] rd_tokens,
  output rd_port_num,
  output [3-1:0] rd_periph_delay,
  output rd_clr_valid,
  input rd_transfer,
  input [4-1:0] rd_transfer_size,
  output rd_clr_stall,
  output wr_ready,
  input wr_burst_start,
  output [32-1:0] wr_burst_addr,
  output [8-1:0] wr_burst_size,
  output [6-1:0] wr_tokens,
  output wr_port_num,
  output [3-1:0] wr_periph_delay,
  output wr_clr_valid,
  input wr_transfer,
  input [4-1:0] wr_transfer_size,
  input [4-1:0] wr_next_size,
  output wr_clr_stall,
  output wr_incr,
  input timeout_aw,
  input timeout_w,
  input timeout_ar,
  input wdt_timeout,
  input fifo_wr,
  input [64-1:0] fifo_wdata,
  input [4-1:0] fifo_wsize,
  input fifo_rd,
  input [4-1:0] fifo_rsize,
  output fifo_rd_valid,
  output [64-1:0] fifo_rdata,
  output fifo_wr_ready,
  input joint_mode,
  input joint_remote,
  input rd_page_cross,
  input wr_page_cross,
  output joint_in_prog,
  output joint_not_in_prog,
  output joint_mux_in_prog,
  output joint_req) ; 
  assign prdata='d0; 
  assign pslverr='d1; 
  assign periph_tx_clr='d0; 
  assign periph_rx_clr='d0; 
  assign load_req_in_prog='d0; 
  assign int_all_proc='d0; 
  assign idle='d1; 
  assign ch_active='d0; 
  assign ch_rd_active='d0; 
  assign ch_wr_active='d0; 
  assign wr_last_cmd='d0; 
  assign rd_line_cmd='d0; 
  assign wr_line_cmd='d0; 
  assign rd_go_next_line='d0; 
  assign wr_go_next_line='d0; 
  assign rd_ready='d0; 
  assign rd_burst_addr='d0; 
  assign rd_burst_size='d0; 
  assign rd_tokens='d0; 
  assign rd_port_num='d0; 
  assign rd_periph_delay='d0; 
  assign rd_clr_valid='d0; 
  assign rd_clr_stall='d0; 
  assign wr_ready='d0; 
  assign wr_burst_addr='d0; 
  assign wr_burst_size='d0; 
  assign wr_tokens='d0; 
  assign wr_port_num='d0; 
  assign wr_periph_delay='d0; 
  assign wr_clr_valid='d0; 
  assign wr_clr_stall='d0; 
  assign wr_incr='d0; 
  assign fifo_rd_valid='d0; 
  assign fifo_rdata='d0; 
  assign fifo_wr_ready='d0; 
  assign joint_in_prog='d0; 
  assign joint_not_in_prog='d0; 
  assign joint_mux_in_prog='d0; 
  assign joint_req='d0; 
endmodule
 
module prgen_swap64 (
  input [1:0] end_swap,
  input [63:0] data_in,
  output [63:0] data_out,
  input [7:0] bsel_in,
  output [7:0] bsel_out) ; 
   wire [31:0] data_in_low ;  
   wire [31:0] data_in_high ;  
   wire [31:0] data_out_low ;  
   wire [31:0] data_out_high ;  
   wire [3:0] bsel_in_low ;  
   wire [3:0] bsel_in_high ;  
   wire [3:0] bsel_out_low ;  
   wire [3:0] bsel_out_high ;  
  assign data_in_low=end_swap==2'b11 ? data_in[63:32]:data_in[31:0]; 
  assign data_in_high=end_swap==2'b11 ? data_in[31:0]:data_in[63:32]; 
  assign bsel_in_low=end_swap==2'b11 ? bsel_in[7:4]:bsel_in[3:0]; 
  assign bsel_in_high=end_swap==2'b11 ? bsel_in[3:0]:bsel_in[7:4]; 
  prgen_swap32 swap32_low(.end_swap(end_swap),.data_in(data_in_low),.data_out(data_out_low),.bsel_in(bsel_in_low),.bsel_out(bsel_out_low)); 
  prgen_swap32 swap32_high(.end_swap(end_swap),.data_in(data_in_high),.data_out(data_out_high),.bsel_in(bsel_in_high),.bsel_out(bsel_out_high)); 
  assign data_out={data_out_high,data_out_low}; 
  assign bsel_out={bsel_out_high,bsel_out_low}; 
endmodule
 
module dma_axi64_core0_ch_reg_size #(
 parameter MAX_BURST =0 ? 64:128,
 parameter HALF_BYTES =32/2,
 parameter LARGE_FIFO =32>MAX_BURST,
 parameter SMALL_FIFO =32==16) (
  input clk,
  input reset,
  input update,
  input [32-1:0] start_addr,
  input [8-1:0] burst_max_size_reg,
  input [8-1:0] burst_max_size_other,
  input allow_full_burst,
  input allow_full_fifo,
  input joint_flush,
  output reg  [8-1:0] burst_max_size) ; 
    
    
    
    
   wire [8-1:0] burst_max_size_fifo ;  
   wire [8-1:0] burst_max_size_pre ;  
  assign burst_max_size_fifo=allow_full_burst|LARGE_FIFO ? MAX_BURST:joint_flush&SMALL_FIFO ? HALF_BYTES:(burst_max_size_other>HALF_BYTES)&(burst_max_size_reg>HALF_BYTES)&(burst_max_size_other!=burst_max_size_reg) ? HALF_BYTES:allow_full_fifo ? 32:HALF_BYTES; 
  prgen_min2 #(8)min2_max(.a(burst_max_size_reg),.b(burst_max_size_fifo),.min(burst_max_size_pre)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          burst_max_size <={8{1'b0}};
        else 
          if (update)
             burst_max_size <=burst_max_size_pre>MAX_BURST ? MAX_BURST:burst_max_size_pre;
 
endmodule
 
module dma_axi64_core0_channels_apb_mux (
  input clk,
  input reset,
  input pclken,
  input psel,
  input penable,
  input [10:8] paddr,
  output [31:0] prdata,
  output pslverr,
  output [7:0] ch_psel,
  input [32*8-1:0] ch_prdata,
  input [7:0] ch_pslverr) ; 
   wire [2:0] paddr_sel ;  
   reg [2:0] paddr_sel_d ;  
  always @(  posedge clk or  posedge reset)
       if (reset)
          paddr_sel_d <=3'b000;
        else 
          if (psel&(~penable))
             paddr_sel_d <=paddr_sel;
           else 
             if ((~psel)&pclken)
                paddr_sel_d <=3'b000;
 
  assign paddr_sel=paddr[10:8]; 
  prgen_demux8 #(1)mux_psel(.sel(paddr_sel),.x(psel),.ch_x(ch_psel)); 
  prgen_mux8 #(32)mux_prdata(.sel(paddr_sel_d),.ch_x(ch_prdata),.x(prdata)); 
  assign pslverr=ch_pslverr[paddr_sel_d]; 
endmodule
 
module dma_axi64_core0_ctrl #(
 parameter IDLE =3'd0,
 parameter CMD =3'd1,
 parameter WAIT_CLR =3'd2,
 parameter WAIT_DELAY =3'd3,
 parameter STALL =3'd4) (
  input clk,
  input reset,
  input ch_go,
  input cmd_full,
  input cmd_pending,
  input joint_req,
  input [2:0] ch_num,
  input [2:0] ch_num_resp,
  input go_next_line,
  input periph_clr_valid,
  input periph_clr,
  input periph_clr_last,
  input [3-1:0] periph_delay,
  input clr_stall,
  input [6-1:0] tokens,
  input ch_ready,
  input ch_last,
  output reg  burst_start,
  output reg  finish,
  output busy,
  input hold) ; 
   wire tokens_remain ;  
   reg tokens_remain_reg ;  
   reg [6-1:0] tokens_counter ;  
   wire stall ;  
   reg joint_ctrl_reg ;  
   wire joint_ctrl ;  
   reg [3-1:0] delay_counter ;  
   wire periph_clr_ch ;  
   wire periph_clr_last_ch ;  
   wire go_next_line_d ;  
   reg [2:0] ps ;  
   reg [2:0] ns ;  
    
    
    
    
    
  assign busy=ps!=IDLE; 
  assign periph_clr_ch=periph_clr_valid&periph_clr&(ch_num==ch_num_resp); 
  assign periph_clr_last_ch=periph_clr_valid&periph_clr_last&(ch_num==ch_num_resp); 
  assign go_next_line_d=1'b0; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          joint_ctrl_reg <=1'b0;
        else 
          if (finish)
             joint_ctrl_reg <=1'b0;
           else 
             if (ch_go)
                joint_ctrl_reg <=joint_req;
 
  assign joint_ctrl=joint_ctrl_reg; 
  assign tokens_remain=(|tokens_counter)|ch_last; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          tokens_counter <={6{1'b0}};
        else 
          if (ch_go)
             tokens_counter <=tokens;
           else 
             if (burst_start&(|tokens_counter))
                tokens_counter <=tokens_counter-1'b1;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          delay_counter <={3{1'b0}};
        else 
          if (periph_clr_ch)
             delay_counter <=periph_delay;
           else 
             if (|delay_counter)
                delay_counter <=delay_counter-1'b1;
 
  assign stall=cmd_pending|cmd_full|go_next_line_d; 
  always @(                ch_go or  ch_last or  ch_ready or  clr_stall or  delay_counter or  go_next_line_d or  hold or  joint_ctrl or  joint_req or  periph_clr_ch or  periph_clr_last_ch or  periph_clr_valid or  periph_delay or  ps or  stall or  tokens_remain)
       begin 
         ns =IDLE;
         burst_start =1'b0;
         finish =1'b0;
         case (ps)
          IDLE :
             begin 
               if (ch_go)
                  begin 
                    if (!ch_ready)
                       begin 
                         ns =IDLE;
                         finish =1'b1;
                       end 
                     else 
                       if (stall)
                          ns =STALL;
                        else 
                          ns =CMD;
                  end 
                else 
                  ns =IDLE;
             end 
          CMD :
             begin 
               if (joint_req^joint_ctrl)
                  begin 
                    ns =IDLE;
                    finish =1'b1;
                  end 
                else 
                  if ((clr_stall|hold)&tokens_remain)
                     ns =CMD;
                   else 
                     if (ch_ready&tokens_remain)
                        begin 
                          if (stall)
                             ns =STALL;
                           else 
                             begin 
                               burst_start =1'b1;
                               ns =WAIT_CLR;
                             end 
                        end 
                      else 
                        if (ch_last&(~ch_ready))
                           ns =CMD;
                         else 
                           begin 
                             ns =IDLE;
                             finish =1'b1;
                           end 
             end 
          WAIT_CLR :
             begin 
               if ((|periph_delay)&periph_clr_valid)
                  begin 
                    if (periph_clr_last_ch)
                       begin 
                         ns =IDLE;
                         finish =1'b1;
                       end 
                     else 
                       if (periph_clr_ch)
                          ns =WAIT_DELAY;
                        else 
                          ns =WAIT_CLR;
                  end 
                else 
                  if (!tokens_remain)
                     begin 
                       ns =IDLE;
                       finish =1'b1;
                     end 
                   else 
                     ns =WAIT_DELAY;
             end 
          WAIT_DELAY :
             begin 
               if (go_next_line_d)
                  ns =WAIT_DELAY;
                else 
                  if (delay_counter=='d0)
                     ns =STALL;
                   else 
                     ns =WAIT_DELAY;
             end 
          STALL :
             begin 
               if (ch_ready&tokens_remain)
                  begin 
                    if (stall)
                       ns =STALL;
                     else 
                       ns =CMD;
                  end 
                else 
                  if (ch_last&(~ch_ready))
                     ns =CMD;
                   else 
                     begin 
                       ns =IDLE;
                       finish =1'b1;
                     end 
             end 
          default :
             begin 
               ns =IDLE;
             end 
         endcase 
       end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          ps <=IDLE;
        else 
          ps <=ns;
 
endmodule
 
module dma_axi64_core0_ch_wr_slicer (
  input clk,
  input reset,
  input ch_update,
  input rd_clr_line,
  input fifo_wr,
  input [64-1:0] fifo_wdata,
  input [4-1:0] fifo_wsize,
  input [3-1:0] wr_align,
  input [5-1:0] wr_ptr,
  input rd_incr,
  input [1:0] end_swap,
  output slice_wr,
  output slice_wr_fifo,
  output reg  [5-1:0] slice_wr_ptr,
  output reg  [8-1:0] slice_bsel,
  output reg  [64-1:0] slice_wdata,
  output reg  [4-1:0] slice_wsize) ; 
   reg [4-1:0] line_remain ;  
   wire [4-1:0] join_wsize ;  
   wire [4-1:0] append_wsize ;  
   wire [4-1:0] direct_wsize ;  
   reg append ;  
   reg [4-1:0] next_size ;  
   reg [64-1:0] align_wdata ;  
   reg [64-1:0] align_wdata_d ;  
   wire [3-1:0] wr_align_valid ;  
   reg [64-1:0] next_wdata ;  
   wire [8-1:0] bsel_dec ;  
   reg [8-1:0] bsel_shift ;  
   wire next_wr ;  
   wire slice_wr_pre ;  
   wire [5-1:0] slice_wr_ptr_pre ;  
   wire [8-1:0] slice_bsel_pre ;  
   wire [8-1:0] slice_bsel_swap ;  
   wire [64-1:0] slice_wdata_pre ;  
   reg [64-1:0] slice_wdata_pre_d ;  
   wire [64-1:0] slice_wdata_swap ;  
   wire [4-1:0] slice_wsize_pre ;  
   //wire slice_wr ;  
   //wire slice_wr_fifo ;  
  always @(  posedge clk or  posedge reset)
       if (reset)
          line_remain <=4'd8;
        else 
          if (ch_update|rd_clr_line)
             line_remain <=4'd8;
           else 
             if (slice_wr_pre&(line_remain==slice_wsize_pre))
                line_remain <=4'd8;
              else 
                if (slice_wr_pre)
                   line_remain <=line_remain-slice_wsize_pre;
 
  assign join_wsize=next_size+fifo_wsize; 
  prgen_min2 #(4)min2_append(.a(join_wsize),.b(4'd8),.min(append_wsize)); 
  prgen_min2 #(4)min2_direct(.a(line_remain),.b(fifo_wsize),.min(direct_wsize)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          append <=1'b0;
        else 
          if (next_wr)
             append <=1'b0;
           else 
             if (fifo_wr&(slice_wsize_pre==join_wsize))
                append <=1'b0;
              else 
                if (fifo_wr)
                   append <=1'b1;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          next_size <={4{1'b0}};
        else 
          if (next_wr)
             next_size <={4{1'b0}};
           else 
             if (fifo_wr&append)
                next_size <=join_wsize-append_wsize;
              else 
                if (fifo_wr)
                   next_size <=join_wsize-direct_wsize;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          align_wdata_d <={64{1'b0}};
        else 
          if (fifo_wr)
             align_wdata_d <=align_wdata;
 
  assign wr_align_valid=rd_incr ? wr_align:wr_align-wr_ptr[3-1:0]; 
  always @(   fifo_wdata or  wr_align_valid or  fifo_wr)
       begin 
         case (wr_align_valid[3-1:0])
          3 'd0:
             align_wdata =fifo_wdata;
          3 'd1:
             align_wdata ={fifo_wdata[7:0],fifo_wdata[63:8]};
          3 'd2:
             align_wdata ={fifo_wdata[15:0],fifo_wdata[63:16]};
          3 'd3:
             align_wdata ={fifo_wdata[23:0],fifo_wdata[63:24]};
          3 'd4:
             align_wdata ={fifo_wdata[31:0],fifo_wdata[63:32]};
          3 'd5:
             align_wdata ={fifo_wdata[39:0],fifo_wdata[63:40]};
          3 'd6:
             align_wdata ={fifo_wdata[47:0],fifo_wdata[63:48]};
          3 'd7:
             align_wdata ={fifo_wdata[55:0],fifo_wdata[63:56]};
         endcase 
       end
  
  always @(   align_wdata or  align_wdata_d or  next_size)
       begin 
         case (next_size[3-1:0])
          3 'd0:
             next_wdata =align_wdata_d;
          3 'd1:
             next_wdata ={align_wdata[63:8],align_wdata_d[7:0]};
          3 'd2:
             next_wdata ={align_wdata[63:16],align_wdata_d[15:0]};
          3 'd3:
             next_wdata ={align_wdata[63:24],align_wdata_d[23:0]};
          3 'd4:
             next_wdata ={align_wdata[63:32],align_wdata_d[31:0]};
          3 'd5:
             next_wdata ={align_wdata[63:40],align_wdata_d[39:0]};
          3 'd6:
             next_wdata ={align_wdata[63:48],align_wdata_d[47:0]};
          3 'd7:
             next_wdata ={align_wdata[63:56],align_wdata_d[55:0]};
         endcase 
       end
  
  assign bsel_dec=slice_wsize==4'd1 ? 8'b00000001:slice_wsize==4'd2 ? 8'b00000011:slice_wsize==4'd3 ? 8'b00000111:slice_wsize==4'd4 ? 8'b00001111:slice_wsize==4'd5 ? 8'b00011111:slice_wsize==4'd6 ? 8'b00111111:slice_wsize==4'd7 ? 8'b01111111:slice_wsize==4'd8 ? 8'b11111111:{8{1'b0}}; 
  always @(  bsel_dec or  wr_ptr)
       begin 
         case (wr_ptr[3-1:0])
          3 'd0:
             bsel_shift =bsel_dec;
          3 'd1:
             bsel_shift ={bsel_dec[6:0],1'b0};
          3 'd2:
             bsel_shift ={bsel_dec[5:0],2'b0};
          3 'd3:
             bsel_shift ={bsel_dec[4:0],3'b0};
          3 'd4:
             bsel_shift ={bsel_dec[3:0],4'b0};
          3 'd5:
             bsel_shift ={bsel_dec[2:0],5'b0};
          3 'd6:
             bsel_shift ={bsel_dec[1:0],6'b0};
          3 'd7:
             bsel_shift ={bsel_dec[0],7'b0};
         endcase 
       end
  
  assign next_wr=(~fifo_wr)&(|next_size); 
  assign slice_wr_pre=fifo_wr|next_wr; 
  assign slice_wsize_pre=next_wr ? next_size:append ? append_wsize:direct_wsize; 
  assign slice_wr_ptr_pre=wr_ptr; 
  assign slice_wdata_pre=append ? next_wdata:align_wdata; 
  assign slice_bsel_pre=bsel_shift; 
  prgen_delay #(1)delay_wr0(.clk(clk),.reset(reset),.din(slice_wr_pre),.dout(slice_wr)); 
  prgen_delay #(1)delay_wr(.clk(clk),.reset(reset),.din(slice_wr),.dout(slice_wr_fifo)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            slice_wsize <={4{1'b0}};
            slice_wdata_pre_d <={64{1'b0}};
          end 
        else 
          if (slice_wr_pre)
             begin 
               slice_wsize <=slice_wsize_pre;
               slice_wdata_pre_d <=slice_wdata_pre;
             end
  
  prgen_swap64 swap64(.end_swap(end_swap),.data_in(slice_wdata_pre_d),.data_out(slice_wdata_swap),.bsel_in(slice_bsel_pre),.bsel_out(slice_bsel_swap)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            slice_wdata <={64{1'b0}};
            slice_wr_ptr <={5{1'b0}};
            slice_bsel <={8{1'b0}};
          end 
        else 
          if (slice_wr)
             begin 
               slice_wdata <=slice_wdata_swap;
               slice_wr_ptr <=slice_wr_ptr_pre;
               slice_bsel <=slice_bsel_swap;
             end
  
endmodule
 
module dma_axi64_core0_axim_cmd #(
 parameter AXI_WORD_SIZE =0 ? 2'b10:2'b11,
 parameter AXI_3 =0 ? 2:3) (
  input clk,
  input reset,
  input [2:0] ch_num,
  input burst_start,
  input [32-1:0] burst_addr,
  input [8-1:0] burst_size,
  input end_line_cmd,
  input extra_bit,
  input cmd_port,
  input joint_req,
  output joint_pending,
  output reg  cmd_pending,
  input cmd_full,
  output cmd_split,
  output [2:0] cmd_num,
  output cmd_line,
  output page_cross,
  output reg  [7-1:0] AID,
  output reg  [32-1:0] AADDR,
  output reg  APORT,
  output reg  [4-1:0] ALEN,
  output reg  [1:0] ASIZE,
  output AVALID,
  input AREADY,
  input AWVALID,
  output reg  AJOINT,
  output [2:0] axim_timeout_num,
  output axim_timeout) ; 
    
    
   reg [7-1:0] AID_reg ;  
   reg AVALID_reg ;  
   wire [7-1:0] AID_pre ;  
   wire [32-1:0] AADDR_pre ;  
   wire [1:0] ASIZE_pre ;  
   wire [4-1:0] ALEN_pre ;  
   wire [8-1:0] burst_length ;  
   wire cmd ;  
   wire cmd_line_pre ;  
   //wire cmd_line ;  
   wire high_addr_pre ;  
   wire high_addr ;  
   wire [8:0] burst_reach_pre ;  
   reg [8:0] burst_reach ;  
   reg joint_cross ;  
   wire page_cross_pre ;  
   //wire page_cross ;  
   wire cross_start ;  
   wire cross_start_d ;  
   wire [8:0] max_burst ;  
   reg [8:0] max_burst_d ;  
   reg next_burst ;  
   reg [8-1:0] next_burst_size ;  
   wire next_burst_start ;  
  assign high_addr_pre=burst_addr[11:8]==4'hf; 
  assign burst_reach_pre=burst_addr[7:0]+burst_size; 
  assign page_cross=high_addr&(burst_reach>{1'b1,{8{1'b0}}}); 
  assign max_burst={1'b1,{8{1'b0}}}-burst_addr[7:0]; 
  assign next_burst_start=next_burst&(~AVALID_reg)&(~cmd_full); 
  assign cross_start=burst_start&page_cross; 
  prgen_delay #(1)delay_high_addr(.clk(clk),.reset(reset),.din(high_addr_pre),.dout(high_addr)); 
  prgen_delay #(1)delay_cross_start(.clk(clk),.reset(reset),.din(cross_start),.dout(cross_start_d)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          burst_reach <={9{1'b0}};
        else 
          if (high_addr_pre)
             burst_reach <=burst_reach_pre;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          next_burst <=1'b0;
        else 
          if (next_burst_start)
             next_burst <=1'b0;
           else 
             if (cross_start)
                next_burst <=1'b1;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          max_burst_d <={9{1'b0}};
        else 
          if (cross_start)
             max_burst_d <=max_burst;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          next_burst_size <={8{1'b0}};
        else 
          if (cross_start)
             next_burst_size <=burst_size;
           else 
             if (cross_start_d)
                next_burst_size <=next_burst_size-max_burst_d;
 
  assign cmd_split=cross_start_d; 
  assign cmd=AVALID&AREADY; 
  assign cmd_num=AID[2:0]; 
  assign cmd_line_pre=cmd&AID[6]; 
  assign joint_pending=AVALID&(~AREADY)&AJOINT; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          cmd_pending <=1'b0;
        else 
          if (burst_start)
             cmd_pending <=1'b1;
           else 
             if (cmd&(~next_burst))
                cmd_pending <=1'b0;
 
  prgen_delay #(1)delay_cmd_line(.clk(clk),.reset(reset),.din(cmd_line_pre),.dout(cmd_line)); 
  assign AID_pre={end_line_cmd,ASIZE_pre[1:0],extra_bit,ch_num[2:0]}; 
  assign AADDR_pre=burst_addr; 
  assign ASIZE_pre=burst_size=='d1 ? 2'b00:burst_size=='d2 ? 2'b01:burst_size=='d4 ? 2'b10:AXI_WORD_SIZE; 
  assign burst_length=next_burst ? next_burst_size:page_cross ? max_burst:burst_size; 
  assign ALEN_pre=burst_length[8-1:AXI_3]=='d0 ? {4{1'b0}}:burst_length[8-1:AXI_3]-1'b1; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            ASIZE <={2{1'b0}};
            AJOINT <=1'b0;
          end 
        else 
          if (burst_start)
             begin 
               ASIZE <=ASIZE_pre;
               AJOINT <=joint_req;
             end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          AID_reg <={7{1'b0}};
        else 
          if (burst_start)
             AID_reg <=AID_pre;
 
  always @(  AID_reg or  next_burst)
       begin 
         AID =AID_reg;
         AID [6]=AID_reg[6]&(~next_burst);
         AID [3]=AID_reg[3]&(~next_burst);
       end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          AADDR <={32{1'b0}};
        else 
          if (next_burst_start)
             AADDR <={AADDR[32-1:12],{12{1'b1}}}+1'b1;
           else 
             if (burst_start)
                AADDR <=AADDR_pre;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          APORT <=1'b0;
        else 
          if (burst_start)
             APORT <=cmd_port;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          ALEN <={4{1'b0}};
        else 
          if (burst_start|next_burst_start)
             ALEN <=ALEN_pre;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          AVALID_reg <=1'b0;
        else 
          if (AVALID&AREADY)
             AVALID_reg <=1'b0;
           else 
             if ((burst_start&(burst_size>'d0))|next_burst_start)
                AVALID_reg <=1'b1;
 
  assign AVALID=AJOINT ? AVALID_reg&(~AWVALID):AVALID_reg; 
  dma_axi64_core0_axim_timeout dma_axi64_axim_timeout(.clk(clk),.reset(reset),.VALID(AVALID),.READY(AREADY),.ID(AID),.axim_timeout_num(axim_timeout_num),.axim_timeout(axim_timeout)); 
endmodule
 
module dma_axi64_core0_ch_remain (
  input clk,
  input reset,
  input ch_update,
  input wr_outstanding,
  input rd_outstanding,
  input load_req_in_prog,
  input rd_line_cmd,
  input rd_burst_start,
  input [8-1:0] rd_burst_size,
  input rd_transfer,
  input [4-1:0] rd_transfer_size,
  input wr_clr_line,
  input wr_burst_start,
  input [8-1:0] wr_burst_size,
  input wr_transfer,
  input [4-1:0] wr_transfer_size,
  output [5:0] rd_gap,
  output [5:0] wr_fullness) ; 
   wire rd_line_cmd_valid ;  
   reg [5+1:0] rd_gap_reg ;  
   reg [5+1:0] wr_fullness_reg ;  
   wire rd_burst_qual ;  
   wire wr_burst_qual ;  
   reg [8-1:0] rd_burst_size_valid ;  
   wire [4-1:0] rd_transfer_size_valid ;  
   wire [4-1:0] wr_transfer_size_valid ;  
   reg [8-1:0] wr_burst_size_valid ;  
  assign rd_line_cmd_valid=rd_line_cmd&rd_burst_start; 
  assign rd_burst_qual=rd_burst_start&(~load_req_in_prog); 
  assign wr_burst_qual=wr_burst_start; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          rd_burst_size_valid <={8{1'b0}};
        else 
          if (rd_burst_qual)
             rd_burst_size_valid <=rd_burst_size;
           else 
             rd_burst_size_valid <={8{1'b0}};
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          wr_burst_size_valid <={8{1'b0}};
        else 
          if (wr_burst_qual)
             wr_burst_size_valid <=wr_burst_size;
           else 
             wr_burst_size_valid <={8{1'b0}};
 
  assign rd_transfer_size_valid={4{rd_transfer}}&rd_transfer_size; 
  assign wr_transfer_size_valid={4{wr_transfer}}&wr_transfer_size; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          rd_gap_reg <={1'b0,1'b1,{5{1'b0}}};
        else 
          if (ch_update)
             rd_gap_reg <={1'b0,1'b1,{5{1'b0}}};
           else 
             rd_gap_reg <=rd_gap_reg-rd_burst_size_valid+wr_transfer_size_valid;
 
  assign rd_gap=rd_gap_reg[5+1] ? 'd0:rd_gap_reg[5:0]; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          wr_fullness_reg <={5+1{1'b0}};
        else 
          if (ch_update)
             wr_fullness_reg <={5+1{1'b0}};
           else 
             wr_fullness_reg <=wr_fullness_reg-wr_burst_size_valid+rd_transfer_size_valid;
 
  assign wr_fullness=wr_fullness_reg[5+1] ? 'd0:wr_fullness_reg[5:0]; 
endmodule
 
module prgen_demux8 #(
 parameter WIDTH =8) (
  input [3-1:0] sel,
  input [WIDTH-1:0] x,
  output reg  [8*WIDTH-1:0] ch_x) ; 
    
  always @(  sel or  x)
       begin 
         ch_x ={8*WIDTH{1'b0}};
         case (sel)
          3 'd0:
             ch_x [WIDTH-1+WIDTH*0:WIDTH*0]=x;
          3 'd1:
             ch_x [WIDTH-1+WIDTH*1:WIDTH*1]=x;
          3 'd2:
             ch_x [WIDTH-1+WIDTH*2:WIDTH*2]=x;
          3 'd3:
             ch_x [WIDTH-1+WIDTH*3:WIDTH*3]=x;
          3 'd4:
             ch_x [WIDTH-1+WIDTH*4:WIDTH*4]=x;
          3 'd5:
             ch_x [WIDTH-1+WIDTH*5:WIDTH*5]=x;
          3 'd6:
             ch_x [WIDTH-1+WIDTH*6:WIDTH*6]=x;
          3 'd7:
             ch_x [WIDTH-1+WIDTH*7:WIDTH*7]=x;
          default :
             ch_x [WIDTH-1:0]=x;
         endcase 
       end
  
endmodule
 
module dma_axi64_core0_ch_calc_size #(
 parameter READ =0,
 parameter CMD_SIZE =16) (
  input clk,
  input reset,
  input ch_update,
  input ch_update_d,
  input ch_update_d2,
  input ch_update_d3,
  input ch_end,
  input ch_end_flush,
  input load_in_prog,
  input load_req_in_prog,
  input joint_line_req_clr,
  input wr_cmd_pending,
  input outs_empty,
  input burst_start,
  input [32-1:0] burst_addr,
  input [8-1:0] burst_max_size,
  input [10-1:0] x_remain,
  input fifo_wr_ready,
  input [5:0] fifo_remain,
  output burst_last,
  output reg  [8-1:0] burst_size,
  output reg  burst_ready,
  input joint_ready_in,
  output joint_ready_out,
  input joint,
  input joint_line_req_in,
  output joint_line_req_out,
  input joint_burst_req_in,
  output joint_burst_req_out,
  input page_cross,
  input joint_cross,
  output joint_flush,
  input joint_flush_in) ; 
    
    
   wire [8-1:0] burst_size_pre ;  
   wire [8-1:0] x_remain_fifo ;  
   wire [8-1:0] max_burst_align ;  
   wire [8-1:0] burst_size_pre2 ;  
   wire fifo_not_ready_pre ;  
   wire fifo_not_ready ;  
   wire joint_update ;  
   //wire joint_ready_out ;  
   //wire joint_line_req_out ;  
   //wire joint_burst_req_out ;  
   wire joint_wait ;  
   reg [1:0] joint_burst_req_reg ;  
   wire [1:0] joint_burst_req ;  
   wire [8-1:0] joint_burst_req_size ;  
   reg joint_line_req_reg ;  
   wire joint_line_req ;  
   wire [8-1:0] joint_line_req_size ;  
   wire joint_buffer_small ;  
   wire release_fifo ;  
  assign x_remain_fifo=|x_remain[10-1:8] ? {1'b1,{8-1{1'b0}}}:x_remain[8-1:0]; 
  prgen_min3 #(8)min3(.clk(clk),.reset(reset),.a(max_burst_align),.b(burst_max_size),.c(x_remain_fifo),.min(burst_size_pre)); 
  assign max_burst_align=burst_addr[0] ? 'd1:burst_addr[1] ? 'd2:burst_addr[2] ? 'd4:{1'b1,{8-1{1'b0}}}; 
  assign burst_size_pre2=|burst_size_pre[8-1:3] ? {burst_size_pre[8-1:3],3'b000}:burst_size_pre[2] ? 'd4:burst_size_pre[1] ? 'd2:burst_size_pre[0] ? 'd1:'d0; 
  assign fifo_not_ready_pre=(fifo_remain<burst_size_pre2)&(~release_fifo); 
  prgen_delay #(1)delay_fifo_not_ready(.clk(clk),.reset(reset),.din(fifo_not_ready_pre),.dout(fifo_not_ready)); 
  assign burst_last=burst_size==x_remain; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          burst_ready <=1'b0;
        else 
          if (ch_update|ch_update_d|ch_update_d2|ch_update_d3)
             burst_ready <=1'b0;
           else 
             if (load_req_in_prog)
                burst_ready <=1'b1;
              else 
                if (|joint_burst_req)
                   burst_ready <=1'b1;
                 else 
                   if (joint_line_req&(~joint_buffer_small))
                      burst_ready <=1'b1;
                    else 
                      if (load_in_prog|fifo_not_ready_pre|joint_wait|(page_cross&(burst_size!=burst_size_pre2)))
                         burst_ready <=1'b0;
                       else 
                         burst_ready <=|burst_size_pre2;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          burst_size <={8{1'b0}};
        else 
          if (load_req_in_prog)
             burst_size <=CMD_SIZE;
           else 
             if (|joint_burst_req)
                burst_size <=joint_burst_req_size;
              else 
                if (joint_line_req&(~joint_buffer_small))
                   burst_size <=joint_line_req_size;
                 else 
                   burst_size <=burst_size_pre2;
 
  assign joint_update=ch_update|ch_update_d|ch_update_d2; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          joint_burst_req_reg <=2'b00;
        else 
          if (joint_update|joint_flush|joint_flush_in)
             joint_burst_req_reg <=2'b00;
           else 
             if (joint_burst_req_reg&burst_start)
                joint_burst_req_reg <=2'b00;
              else 
                if (joint_burst_req_in)
                   joint_burst_req_reg <=joint_burst_req_reg[0] ? 2'b11:2'b01;
 
  assign joint_burst_req=joint_burst_req_reg; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          joint_line_req_reg <=1'b0;
        else 
          if (joint_update|joint_flush|joint_flush_in)
             joint_line_req_reg <=1'b0;
           else 
             if (joint_line_req_reg&burst_start)
                joint_line_req_reg <=1'b0;
              else 
                if (joint_line_req_in)
                   joint_line_req_reg <=1'b1;
 
  assign joint_line_req=joint_line_req_reg; 
  assign joint_line_req_size=burst_addr[2:0]==3'd0 ? 4'd8:burst_addr[1:0]==2'd0 ? 'd4:burst_addr[0]==1'd0 ? 'd2:'d1; 
  assign joint_burst_req_size=burst_addr[0] ? 'd1:burst_addr[1] ? 'd2:burst_addr[2]&(!0) ? 'd4:joint_burst_req[1] ? 'd32:'d16; 
  dma_axi64_core0_ch_calc_joint #(READ)dma_axi64_core0_ch_calc_joint(.clk(clk),.reset(reset),.joint_update(joint_update),.ch_end(ch_end),.ch_end_flush(ch_end_flush),.joint_line_req_clr(joint_line_req_clr),.burst_size_pre2(burst_size_pre2),.burst_max_size(burst_max_size),.fifo_not_ready(fifo_not_ready),.wr_cmd_pending(wr_cmd_pending),.outs_empty(outs_empty),.x_remain(x_remain),.fifo_wr_ready(fifo_wr_ready),.fifo_remain(fifo_remain),.joint(joint),.joint_ready_in(joint_ready_in),.joint_ready_out(joint_ready_out),.joint_line_req(joint_line_req_out),.joint_burst_req(joint_burst_req_out),.joint_wait(joint_wait),.page_cross(page_cross),.joint_cross(joint_cross),.joint_flush(joint_flush),.joint_flush_in(joint_flush_in),.joint_buffer_small(joint_buffer_small)); 
  assign release_fifo=joint_ready_in&joint_ready_out&(~joint_cross); 
endmodule
 
module prgen_swap32 (
  input [1:0] end_swap,
  input [31:0] data_in,
  output reg  [31:0] data_out,
  input [3:0] bsel_in,
  output reg  [3:0] bsel_out) ; 
  always @(  data_in or  end_swap)
       begin 
         case (end_swap[1:0])
          2 'b00:
             data_out =data_in;
          2 'b01:
             data_out ={data_in[23:16],data_in[31:24],data_in[7:0],data_in[15:8]};
          2 'b10:
             data_out ={data_in[7:0],data_in[15:8],data_in[23:16],data_in[31:24]};
          2 'b11:
             data_out ={data_in[7:0],data_in[15:8],data_in[23:16],data_in[31:24]};
         endcase 
       end
  
  always @(  bsel_in or  end_swap)
       begin 
         case (end_swap[1:0])
          2 'b00:
             bsel_out =bsel_in;
          2 'b01:
             bsel_out ={bsel_in[2],bsel_in[3],bsel_in[0],bsel_in[1]};
          2 'b10:
             bsel_out ={bsel_in[0],bsel_in[1],bsel_in[2],bsel_in[3]};
          2 'b11:
             bsel_out ={bsel_in[0],bsel_in[1],bsel_in[2],bsel_in[3]};
         endcase 
       end
  
endmodule
 
module dma_axi64_dual_core (
  input clk,
  input reset,
  input scan_en,
  output idle,
  output [1-1:0] INT,
  input [31:1] periph_tx_req,
  output [31:1] periph_tx_clr,
  input [31:1] periph_rx_req,
  output [31:1] periph_rx_clr,
  input pclken,
  input psel,
  input penable,
  input [12:0] paddr,
  input pwrite,
  input [31:0] pwdata,
  output [31:0] prdata,
  output pslverr,
  output pready,
  output rd_port_num0,
  output wr_port_num0,
  output rd_port_num1,
  output wr_port_num1,
  output [1-1:0] M0_AWID,
  output [32-1:0] M0_AWADDR,
  output [4-1:0] M0_AWLEN,
  output [2-1:0] M0_AWSIZE,
  output M0_AWVALID,
  input M0_AWREADY,
  output [1-1:0] M0_WID,
  output [64-1:0] M0_WDATA,
  output [64/8-1:0] M0_WSTRB,
  output M0_WLAST,
  output M0_WVALID,
  input M0_WREADY,
  input [1-1:0] M0_BID,
  input [1:0] M0_BRESP,
  input M0_BVALID,
  output M0_BREADY,
  output [1-1:0] M0_ARID,
  output [32-1:0] M0_ARADDR,
  output [4-1:0] M0_ARLEN,
  output [2-1:0] M0_ARSIZE,
  output M0_ARVALID,
  input M0_ARREADY,
  input [1-1:0] M0_RID,
  input [64-1:0] M0_RDATA,
  input [1:0] M0_RRESP,
  input M0_RLAST,
  input M0_RVALID,
  output M0_RREADY) ; 
   wire psel0 ;  
   wire [31:0] prdata0 ;  
   wire pslverr0 ;  
   wire psel1 ;  
   wire [31:0] prdata1 ;  
   wire pslverr1 ;  
   wire psel_reg ;  
   wire [31:0] prdata_reg ;  
   wire pslverr_reg ;  
   wire [8*1-1:0] ch_int_all_proc0 ;  
   wire [1-1:0] int_all_proc ;  
   wire [3:0] core0_clkdiv ;  
   wire [7:0] core0_ch_start ;  
   wire joint_mode0 ;  
   wire joint_remote0 ;  
   wire rd_prio_top0 ;  
   wire rd_prio_high0 ;  
   wire [2:0] rd_prio_top_num0 ;  
   wire [2:0] rd_prio_high_num0 ;  
   wire wr_prio_top0 ;  
   wire wr_prio_high0 ;  
   wire [2:0] wr_prio_top_num0 ;  
   wire [2:0] wr_prio_high_num0 ;  
   wire [31:1] periph_rx_req_reg ;  
   wire [31:1] periph_tx_req_reg ;  
   wire [31:1] periph_rx_req0 ;  
   wire [31:1] periph_tx_req0 ;  
   wire [31:1] periph_rx_req1 ;  
   wire [31:1] periph_tx_req1 ;  
   wire [31:1] periph_rx_clr0 ;  
   wire [31:1] periph_tx_clr0 ;  
   wire [31:1] periph_rx_clr1 ;  
   wire [31:1] periph_tx_clr1 ;  
   wire core0_idle ;  
  assign idle=core0_idle; 
  assign INT=int_all_proc; 
  assign periph_rx_req0=periph_rx_req|periph_rx_req_reg; 
  assign periph_tx_req0=periph_tx_req|periph_tx_req_reg; 
  assign periph_rx_req1=periph_rx_req0; 
  assign periph_tx_req1=periph_tx_req0; 
  assign periph_rx_clr=periph_rx_clr0|periph_rx_clr1; 
  assign periph_tx_clr=periph_tx_clr0|periph_tx_clr1; 
  assign joint_remote0=joint_mode0&0&0; 
  dma_axi64_apb_mux dma_axi64_apb_mux(.clk(clk),.reset(reset),.pclken(pclken),.psel(psel),.penable(penable),.pwrite(pwrite),.paddr(paddr[12:11]),.prdata(prdata),.pslverr(pslverr),.pready(pready),.psel0(psel0),.prdata0(prdata0),.pslverr0(pslverr0),.psel1(psel1),.prdata1(prdata1),.pslverr1(pslverr1),.psel_reg(psel_reg),.prdata_reg(prdata_reg),.pslverr_reg(pslverr_reg)); 
  dma_axi64_reg dma_axi64_reg(.clk(clk),.reset(reset),.pclken(pclken),.psel(psel_reg),.penable(penable),.paddr(paddr[7:0]),.pwrite(pwrite),.pwdata(pwdata),.prdata(prdata_reg),.pslverr(pslverr_reg),.core0_idle(core0_idle),.ch_int_all_proc0(ch_int_all_proc0),.int_all_proc(int_all_proc),.core0_clkdiv(core0_clkdiv),.core0_ch_start(core0_ch_start),.joint_mode0(joint_mode0),.rd_prio_top0(rd_prio_top0),.rd_prio_high0(rd_prio_high0),.rd_prio_top_num0(rd_prio_top_num0),.rd_prio_high_num0(rd_prio_high_num0),.wr_prio_top0(wr_prio_top0),.wr_prio_high0(wr_prio_high0),.wr_prio_top_num0(wr_prio_top_num0),.wr_prio_high_num0(wr_prio_high_num0),.periph_rx_req_reg(periph_rx_req_reg),.periph_tx_req_reg(periph_tx_req_reg),.periph_rx_clr(periph_rx_clr),.periph_tx_clr(periph_tx_clr)); 
  dma_axi64_core0_top dma_axi64_core0_top(.clk(clk),.reset(reset),.scan_en(scan_en),.idle(core0_idle),.ch_int_all_proc(ch_int_all_proc0),.ch_start(core0_ch_start),.clkdiv(core0_clkdiv),.periph_tx_req(periph_tx_req0),.periph_tx_clr(periph_tx_clr0),.periph_rx_req(periph_rx_req0),.periph_rx_clr(periph_rx_clr0),.pclken(pclken),.psel(psel0),.penable(penable),.paddr(paddr[10:0]),.pwrite(pwrite),.pwdata(pwdata),.prdata(prdata0),.pslverr(pslverr0),.rd_port_num(rd_port_num0),.wr_port_num(wr_port_num0),.joint_mode(joint_mode0),.joint_remote(joint_remote0),.rd_prio_top(rd_prio_top0),.rd_prio_high(rd_prio_high0),.rd_prio_top_num(rd_prio_top_num0),.rd_prio_high_num(rd_prio_high_num0),.wr_prio_top(wr_prio_top0),.wr_prio_high(wr_prio_high0),.wr_prio_top_num(wr_prio_top_num0),.wr_prio_high_num(wr_prio_high_num0),.AWADDR(M0_AWADDR),.AWLEN(M0_AWLEN),.AWSIZE(M0_AWSIZE),.AWVALID(M0_AWVALID),.AWREADY(M0_AWREADY),.WDATA(M0_WDATA),.WSTRB(M0_WSTRB),.WLAST(M0_WLAST),.WVALID(M0_WVALID),.WREADY(M0_WREADY),.BRESP(M0_BRESP),.BVALID(M0_BVALID),.BREADY(M0_BREADY),.ARADDR(M0_ARADDR),.ARLEN(M0_ARLEN),.ARSIZE(M0_ARSIZE),.ARVALID(M0_ARVALID),.ARREADY(M0_ARREADY),.RDATA(M0_RDATA),.RRESP(M0_RRESP),.RLAST(M0_RLAST),.RVALID(M0_RVALID),.RREADY(M0_RREADY)); 
  prgen_delay #(1)delay_pslverr1(.clk(clk),.reset(reset),.din(psel1),.dout(pslverr1)); 
  assign prdata1={32{1'b0}}; 
  assign periph_rx_clr1={31{1'b0}}; 
  assign periph_tx_clr1={31{1'b0}}; 
  assign rd_port_num1=1'b0; 
  assign wr_port_num1=1'b0; 
endmodule
 
module dma_axi64_core0_ch_periph_mux (
  input clk,
  input reset,
  input clken,
  input [31:1] periph_req,
  output reg  [31:1] periph_clr,
  output periph_ready,
  input [4:0] periph_num,
  input clr_valid,
  input clr) ; 
   wire [31:0] periph_req_full ;  
   wire periph_ready_pre ;  
  always @(    clken or  clr or  clr_valid or  periph_num)
       begin 
         periph_clr ={31{1'b0}};
         periph_clr [periph_num]=clr&clr_valid&clken;
       end
  
  assign periph_req_full={periph_req,1'b1}; 
  assign periph_ready_pre=periph_req_full[periph_num]; 
  prgen_delay #(1)delay_ready(.clk(clk),.reset(reset),.din(periph_ready_pre),.dout(periph_ready)); 
endmodule
 
module prgen_min3 #(
 parameter WIDTH =8) (
  input clk,
  input reset,
  input [WIDTH-1:0] a,
  input [WIDTH-1:0] b,
  input [WIDTH-1:0] c,
  output [WIDTH-1:0] min) ; 
    
   wire [WIDTH-1:0] min_ab_pre ;  
   reg [WIDTH-1:0] min_ab ;  
   reg [WIDTH-1:0] min_c ;  
  prgen_min2 #(WIDTH)min2_ab(.a(a),.b(b),.min(min_ab_pre)); 
  prgen_min2 #(WIDTH)min2_abc(.a(min_ab),.b(min_c),.min(min)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            min_ab <={WIDTH{1'b0}};
            min_c <={WIDTH{1'b0}};
          end 
        else 
          begin 
            min_ab <=min_ab_pre;
            min_c <=c;
          end
  
endmodule
 
module dma_axi64_core0_ch_calc_joint #(
 parameter READ =0,
 parameter WRITE =!READ,
 parameter IDLE =3'd0,
 parameter REQ_LINE =3'd1,
 parameter READY_OUT =3'd2,
 parameter READY =3'd3,
 parameter CROSS =3'd4,
 parameter BURST_REQ =3'd5,
 parameter RECHK =3'd6,
 parameter FLUSH =3'd7) (
  input clk,
  input reset,
  input joint_update,
  input ch_end,
  input ch_end_flush,
  input joint_line_req_clr,
  input wr_cmd_pending,
  input [8-1:0] burst_size_pre2,
  input [8-1:0] burst_max_size,
  input fifo_not_ready,
  input outs_empty,
  input [10-1:0] x_remain,
  input fifo_wr_ready,
  input [5:0] fifo_remain,
  input joint,
  input page_cross,
  input joint_cross,
  input joint_ready_in,
  output reg  joint_ready_out,
  output reg  joint_line_req,
  output reg  joint_burst_req,
  output reg  joint_wait,
  output reg  joint_flush,
  input joint_flush_in,
  output joint_buffer_small) ; 
    
    
    
    
    
    
    
    
    
    
   reg [2:0] ps ;  
   reg [2:0] ns ;  
   wire joint_ready_out_pre ;  
   //wire joint_buffer_small ;  
  assign joint_ready_out_pre=joint&(burst_size_pre2==burst_max_size)&(|burst_max_size)&(~joint_line_req)&(~joint_burst_req); 
  assign joint_buffer_small=(burst_max_size>x_remain)|(x_remain<'d8); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          joint_ready_out <=1'b0;
        else 
          if ((page_cross|ch_end_flush|joint_flush|joint_wait)&(~ch_end))
             joint_ready_out <=1'b0;
           else 
             if ((~ch_end)&(~wr_cmd_pending))
                joint_ready_out <=joint_ready_out_pre;
 
  always @(             ch_end_flush or  fifo_not_ready or  fifo_remain or  fifo_wr_ready or  joint_buffer_small or  joint_cross or  joint_flush_in or  joint_line_req_clr or  joint_ready_in or  joint_ready_out or  outs_empty or  page_cross or  ps)
       begin 
         ns =IDLE;
         joint_line_req =1'b0;
         joint_burst_req =1'b0;
         joint_flush =1'b0;
         joint_wait =1'b0;
         case (ps)
          IDLE :
             begin 
               if (joint_flush_in|joint_buffer_small)
                  ns =FLUSH;
                else 
                  if (joint_ready_out&joint_ready_in&outs_empty)
                     ns =READY;
                   else 
                     if (joint_ready_out)
                        begin 
                          joint_wait =1'b1;
                          ns =READY_OUT;
                        end 
                      else 
                        if (fifo_not_ready&joint_ready_in&outs_empty)
                           if (WRITE)
                              begin 
                                joint_line_req =1'b1;
                                ns =REQ_LINE;
                              end 
                            else 
                              begin 
                                joint_burst_req =1'b1;
                                ns =REQ_LINE;
                              end 
                         else 
                           ns =IDLE;
             end 
          REQ_LINE :
             begin 
               if (joint_flush_in)
                  ns =FLUSH;
                else 
                  if (joint_line_req_clr)
                     begin 
                       ns =IDLE;
                       joint_wait =1'b0;
                     end 
                   else 
                     begin 
                       ns =REQ_LINE;
                       joint_wait =1'b1;
                     end 
             end 
          READY_OUT :
             begin 
               joint_wait =1'b1;
               if (joint_cross|page_cross)
                  ns =CROSS;
                else 
                  if ((~joint_ready_out)|joint_flush_in|joint_buffer_small)
                     ns =FLUSH;
                   else 
                     if (joint_ready_in&outs_empty)
                        begin 
                          joint_wait =1'b0;
                          ns =RECHK;
                        end 
                      else 
                        ns =READY_OUT;
             end 
          RECHK :
             begin 
               if (joint_flush_in|joint_buffer_small)
                  ns =FLUSH;
                else 
                  if (joint_ready_in&joint_ready_out)
                     ns =READY;
                   else 
                     if (WRITE)
                        begin 
                          joint_line_req =1'b1;
                          ns =REQ_LINE;
                        end 
                      else 
                        if (READ)
                           ns =RECHK;
             end 
          READY :
             begin 
               if (joint_cross)
                  begin 
                    joint_wait =1'b1;
                    ns =READY_OUT;
                  end 
                else 
                  if ((~joint_ready_out)|(~joint_ready_in)|ch_end_flush)
                     ns =FLUSH;
                   else 
                     ns =READY;
             end 
          CROSS :
             begin 
               if (joint_buffer_small)
                  ns =FLUSH;
                else 
                  if (joint_ready_out&(~joint_cross)&outs_empty)
                     begin 
                       if (fifo_wr_ready&(fifo_remain<='d16))
                          begin 
                            joint_burst_req =1'b1;
                            if (fifo_remain=='d0)
                               ns =BURST_REQ;
                             else 
                               ns =REQ_LINE;
                          end 
                        else 
                          ns =IDLE;
                     end 
                   else 
                     ns =CROSS;
             end 
          BURST_REQ :
             begin 
               joint_burst_req =1'b1;
               ns =REQ_LINE;
             end 
          FLUSH :
             begin 
               joint_flush =1'b1;
               ns =FLUSH;
             end 
          default :
             ns =IDLE;
         endcase 
       end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          ps <=IDLE;
        else 
          if (joint_update)
             ps <=IDLE;
           else 
             ps <=ns;
 
endmodule
 
module prgen_delay #(
 parameter DELAY =2) (
  input clk,
  input reset,
  input din,
  output dout) ; 
    
   reg [DELAY:0] shift_reg ;  
  always @(  posedge clk or  posedge reset)
       if (reset)
          shift_reg <={DELAY+1{1'b0}};
        else 
          shift_reg <={shift_reg[DELAY-1:0],din};
 
  assign dout=shift_reg[DELAY-1]; 
endmodule
 
module dma_axi64_core0_ch_outs (
  input clk,
  input reset,
  input cmd,
  input clr,
  input [4-1:0] outs_max,
  output reg  [4-1:0] outs,
  output outs_empty,
  output reg  stall,
  output timeout) ; 
   wire [4-1:0] outs_pre ;  
   reg [10-1:0] counter ;  
  assign outs_empty=outs=='d0; 
  assign outs_pre=outs+cmd-clr; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          outs <='d0;
        else 
          if (cmd|clr)
             outs <=outs_pre;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          stall <=1'b0;
        else 
          if (|outs_max)
             stall <=outs>=outs_max;
 
  assign timeout=(counter=='d0); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          counter <={10{1'b1}};
        else 
          if (clr)
             counter <={10{1'b1}};
           else 
             if (|outs)
                counter <=counter-1'b1;
 
endmodule
 
module prgen_min2 #(
 parameter WIDTH =8) (
  input [WIDTH-1:0] a,
  input [WIDTH-1:0] b,
  output [WIDTH-1:0] min) ; 
    
  assign min=a<b ? a:b; 
endmodule
 
module dma_axi64_core0_axim_rd (
  input clk,
  input reset,
  output load_wr,
  output [2:0] load_wr_num,
  output [1:0] load_wr_cycle,
  output [64-1:0] load_wdata,
  input joint_stall,
  input joint_req,
  input rd_line_cmd,
  input load_req_in_prog,
  input rd_cmd_port,
  input [2:0] rd_ch_num,
  input rd_burst_start,
  input [32-1:0] rd_burst_addr,
  input [8-1:0] rd_burst_size,
  output rd_cmd_pending,
  output rd_cmd_split,
  output rd_cmd_line,
  output [2:0] rd_cmd_num,
  output rd_cmd_full,
  output ch_fifo_wr,
  output [64-1:0] ch_fifo_wdata,
  output [4-1:0] ch_fifo_wsize,
  output [2:0] ch_fifo_wr_num,
  output [2:0] rd_transfer_num,
  output rd_transfer,
  output reg  [4-1:0] rd_transfer_size,
  output rd_burst_cmd,
  output rd_clr_line,
  output [2:0] rd_clr_line_num,
  output rd_slverr,
  output rd_decerr,
  output rd_clr,
  output rd_clr_load,
  output rd_clr_last,
  output [2:0] rd_ch_num_resp,
  output page_cross,
  output [32-1:0] ARADDR,
  output ARPORT,
  output [4-1:0] ARLEN,
  output [1:0] ARSIZE,
  output ARVALID,
  input ARREADY,
  input AWVALID,
  input [64-1:0] RDATA,
  input [1:0] RRESP,
  input RLAST,
  input RVALID,
  output RREADY_out,
  output axim_timeout_ar,
  output [2:0] axim_timeout_num_ar) ; 
   wire [7-1:0] ARID ;  
   wire RVALID_d ;  
   wire [7-1:0] RID ;  
   reg [64-1:0] RDATA_d ;  
   reg [1:0] RRESP_d ;  
   reg RLAST_d ;  
   wire rd_clr_pre ;  
   wire RREADY ;  
  assign rd_clr=rd_clr_pre&(~rd_clr_last); 
  assign rd_clr_load=rd_clr_pre&rd_clr_last; 
  prgen_delay #(1)delay_ready(.clk(clk),.reset(reset),.din(RREADY_out),.dout(RREADY)); 
  prgen_delay #(1)delay_rvalid(.clk(clk),.reset(reset),.din(RVALID),.dout(RVALID_d)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            RRESP_d <=2'b00;
            RDATA_d <={64{1'b0}};
            RLAST_d <=1'b0;
          end 
        else 
          if (RVALID)
             begin 
               RRESP_d <=RRESP;
               RDATA_d <=RDATA;
               RLAST_d <=RLAST;
             end
  
  always @( RID)
       begin 
         case (RID[5:4])
          2 'b00:
             rd_transfer_size =4'd1;
          2 'b01:
             rd_transfer_size =4'd2;
          2 'b10:
             rd_transfer_size =4'd4;
          2 'b11:
             rd_transfer_size =4'd8;
         endcase 
       end
  
  dma_axi64_core0_axim_cmd dma_axi64_axim_rcmd(.clk(clk),.reset(reset),.end_line_cmd(rd_line_cmd),.extra_bit(load_req_in_prog),.cmd_port(rd_cmd_port),.ch_num(rd_ch_num),.joint_pending(),.joint_req(joint_req),.burst_start(rd_burst_start),.burst_addr(rd_burst_addr),.burst_size(rd_burst_size),.cmd_pending(rd_cmd_pending),.cmd_full(rd_cmd_full),.cmd_split(rd_cmd_split),.cmd_num(rd_cmd_num),.cmd_line(rd_cmd_line),.page_cross(page_cross),.AID(ARID),.AADDR(ARADDR),.APORT(ARPORT),.ALEN(ARLEN),.ASIZE(ARSIZE),.AVALID(ARVALID),.AREADY(ARREADY),.AWVALID(AWVALID),.AJOINT(),.axim_timeout_num(axim_timeout_num_ar),.axim_timeout(axim_timeout_ar)); 
  dma_axi64_core0_axim_rdata dma_axi64_axim_rdata(.clk(clk),.reset(reset),.load_wr(load_wr),.load_wr_num(load_wr_num),.load_wr_cycle(load_wr_cycle),.load_wdata(load_wdata),.joint_stall(joint_stall),.ch_fifo_wr(ch_fifo_wr),.ch_fifo_wdata(ch_fifo_wdata),.ch_fifo_wsize(ch_fifo_wsize),.ch_fifo_wr_num(ch_fifo_wr_num),.rd_transfer_num(rd_transfer_num),.rd_transfer(rd_transfer),.rd_transfer_size(rd_transfer_size),.rd_clr_line(rd_clr_line),.rd_clr_line_num(rd_clr_line_num),.rd_burst_cmd(rd_burst_cmd),.ARVALID(ARVALID),.ARREADY(ARREADY),.ARID(ARID),.RID(RID),.RDATA(RDATA_d),.RLAST(RLAST_d),.RVALID(RVALID_d),.RREADY(RREADY),.RREADY_out(RREADY_out)); 
  dma_axi64_core0_axim_resp #(.CMD_DEPTH(4))dma_axi64_axim_rresp(.clk(clk),.reset(reset),.slverr(rd_slverr),.decerr(rd_decerr),.clr(rd_clr_pre),.clr_last(rd_clr_last),.ch_num_resp(rd_ch_num_resp),.resp_full(rd_cmd_full),.AID(ARID),.AVALID(ARVALID),.AREADY(ARREADY),.ID(RID),.RESP(RRESP_d),.VALID(RVALID_d),.READY(RREADY),.LAST(RLAST_d)); 
endmodule
 
module dma_axi64_core0_channels (
  input clk,
  input reset,
  input scan_en,
  input pclk,
  input clken,
  input pclken,
  input psel,
  input penable,
  input [10:0] paddr,
  input pwrite,
  input [31:0] pwdata,
  output [31:0] prdata,
  output pslverr,
  input [31:1] periph_tx_req,
  output [31:1] periph_tx_clr,
  input [31:1] periph_rx_req,
  output [31:1] periph_rx_clr,
  output rd_clr_valid,
  output wr_clr_valid,
  input rd_clr,
  input rd_clr_load,
  input wr_clr,
  input rd_cmd_split,
  input rd_cmd_line,
  input [2:0] rd_cmd_num,
  input wr_cmd_split,
  input wr_cmd_pending,
  input [2:0] wr_cmd_num,
  output rd_clr_stall,
  output wr_clr_stall,
  input load_wr,
  input [2:0] load_wr_num,
  input [1:0] load_wr_cycle,
  input [64-1:0] load_wdata,
  input [2:0] rd_ch_num,
  output load_req_in_prog,
  input [2:0] wr_ch_num,
  output wr_last_cmd,
  input rd_slverr,
  input rd_decerr,
  input wr_slverr,
  input wr_decerr,
  input [2:0] rd_ch_num_resp,
  input [2:0] wr_ch_num_resp,
  input wr_clr_last,
  output [8*1-1:0] ch_int_all_proc,
  input [7:0] ch_start,
  output [7:0] ch_idle,
  output [7:0] ch_active,
  output [7:0] ch_rd_active,
  output [7:0] ch_wr_active,
  output rd_line_cmd,
  output wr_line_cmd,
  output rd_go_next_line,
  output wr_go_next_line,
  input timeout_aw,
  input timeout_w,
  input timeout_ar,
  input [2:0] timeout_num_aw,
  input [2:0] timeout_num_w,
  input [2:0] timeout_num_ar,
  input wdt_timeout,
  input [2:0] wdt_ch_num,
  input [2:0] ch_fifo_wr_num,
  input [2:0] rd_transfer_num,
  input rd_burst_start,
  input rd_transfer,
  input [4-1:0] rd_transfer_size,
  input rd_clr_line,
  input [2:0] rd_clr_line_num,
  input fifo_rd,
  input [4-1:0] fifo_rsize,
  output fifo_rd_valid,
  output [64-1:0] fifo_rdata,
  output fifo_wr_ready,
  output [7:0] ch_rd_ready,
  output [32-1:0] rd_burst_addr,
  output [8-1:0] rd_burst_size,
  output [6-1:0] rd_tokens,
  output rd_cmd_port,
  output [3-1:0] rd_periph_delay,
  input [2:0] ch_fifo_rd_num,
  input [2:0] wr_transfer_num,
  input wr_burst_start,
  input wr_transfer,
  input [4-1:0] wr_transfer_size,
  input [4-1:0] wr_next_size,
  input wr_clr_line,
  input [2:0] wr_clr_line_num,
  input fifo_wr,
  input [64-1:0] fifo_wdata,
  input [4-1:0] fifo_wsize,
  output [7:0] ch_wr_ready,
  output [32-1:0] wr_burst_addr,
  output [8-1:0] wr_burst_size,
  output [6-1:0] wr_tokens,
  output wr_cmd_port,
  output [3-1:0] wr_periph_delay,
  input joint_mode,
  input joint_remote,
  input rd_page_cross,
  input wr_page_cross,
  output joint_in_prog,
  output joint_not_in_prog,
  output joint_mux_in_prog,
  output [7:0] ch_joint_req) ; 
   wire [7:0] ch_psel ;  
   wire [7:0] ch_pslverr ;  
   wire [32*8-1:0] ch_prdata ;  
   wire [7:0] ch_joint_end ;  
   wire [7:0] ch_joint_in_prog ;  
   wire [7:0] ch_joint_not_in_prog ;  
   wire [7:0] ch_joint_mux_in_prog ;  
   wire [7:0] ch_rd_page_cross ;  
   wire [7:0] ch_wr_page_cross ;  
   wire [7:0] ch_load_wr ;  
   wire [7:0] ch_rd_clr_line ;  
   wire [7:0] ch_rd_slverr ;  
   wire [7:0] ch_rd_decerr ;  
   wire [7:0] ch_rd_clr ;  
   wire [7:0] ch_rd_clr_load ;  
   wire [7:0] ch_rd_transfer ;  
   wire [7:0] ch_rd_clr_stall ;  
   wire [7:0] ch_rd_cmd_split ;  
   wire [7:0] ch_rd_cmd_line ;  
   wire [7:0] ch_wr_clr_line ;  
   wire [7:0] ch_wr_slverr ;  
   wire [7:0] ch_wr_decerr ;  
   wire [7:0] ch_wr_clr_last ;  
   wire [7:0] ch_wr_clr ;  
   wire [7:0] ch_load_req_in_prog ;  
   wire [7:0] ch_wr_last_cmd ;  
   wire [7:0] ch_rd_line_cmd ;  
   wire [7:0] ch_wr_line_cmd ;  
   wire [7:0] ch_rd_go_next_line ;  
   wire [7:0] ch_wr_go_next_line ;  
   wire [7:0] ch_wr_transfer ;  
   wire [7:0] ch_wr_clr_stall ;  
   wire [7:0] ch_wr_cmd_split ;  
   wire [7:0] ch_timeout_aw ;  
   wire [7:0] ch_timeout_w ;  
   wire [7:0] ch_timeout_ar ;  
   wire [7:0] ch_wdt_timeout ;  
   wire [7:0] ch_rd_burst_start ;  
   wire [8*32-1:0] ch_rd_burst_addr ;  
   wire [8*8-1:0] ch_rd_burst_size ;  
   wire [8*6-1:0] ch_rd_tokens ;  
   wire [7:0] ch_rd_port_num ;  
   wire [8*3-1:0] ch_rd_periph_delay ;  
   wire [7:0] ch_rd_clr_valid ;  
   wire [7:0] ch_wr_burst_start ;  
   wire [8*32-1:0] ch_wr_burst_addr ;  
   wire [8*8-1:0] ch_wr_burst_size ;  
   wire [8*6-1:0] ch_wr_tokens ;  
   wire [7:0] ch_wr_port_num ;  
   wire [8*3-1:0] ch_wr_periph_delay ;  
   wire [7:0] ch_wr_clr_valid ;  
   wire [8*31-1:0] ch_periph_rx_clr ;  
   wire [8*31-1:0] ch_periph_tx_clr ;  
   wire [7:0] ch_fifo_wr ;  
   wire [7:0] ch_fifo_rd ;  
   wire [7:0] ch_fifo_rd_valid ;  
   wire [8*64-1:0] ch_fifo_rdata ;  
   wire [7:0] ch_fifo_wr_ready ;  
   wire [7:0] ch_wr_cmd_pending ;  
  dma_axi64_core0_channels_apb_mux dma_axi64_channels_apb_mux(.clk(pclk),.reset(reset),.pclken(pclken),.psel(psel),.penable(penable),.paddr(paddr[10:8]),.prdata(prdata),.pslverr(pslverr),.ch_psel(ch_psel),.ch_prdata(ch_prdata),.ch_pslverr(ch_pslverr)); 
  dma_axi64_core0_channels_mux dma_axi64_channels_mux(.ch_joint_in_prog(ch_joint_in_prog),.ch_joint_not_in_prog(ch_joint_not_in_prog),.ch_joint_mux_in_prog(ch_joint_mux_in_prog),.joint_in_prog(joint_in_prog),.joint_not_in_prog(joint_not_in_prog),.joint_mux_in_prog(joint_mux_in_prog),.ch_rd_page_cross(ch_rd_page_cross),.ch_wr_page_cross(ch_wr_page_cross),.rd_page_cross(rd_page_cross),.wr_page_cross(wr_page_cross),.ch_wr_cmd_pending(ch_wr_cmd_pending),.wr_cmd_pending(wr_cmd_pending),.fifo_rdata(fifo_rdata),.ch_fifo_rdata(ch_fifo_rdata),.fifo_rd_valid(fifo_rd_valid),.ch_fifo_rd_valid(ch_fifo_rd_valid),.periph_rx_clr(periph_rx_clr),.ch_periph_rx_clr(ch_periph_rx_clr),.periph_tx_clr(periph_tx_clr),.ch_periph_tx_clr(ch_periph_tx_clr),.timeout_aw(timeout_aw),.timeout_w(timeout_w),.timeout_ar(timeout_ar),.timeout_num_aw(timeout_num_aw),.timeout_num_w(timeout_num_w),.timeout_num_ar(timeout_num_ar),.wdt_timeout(wdt_timeout),.wdt_ch_num(wdt_ch_num),.ch_timeout_aw(ch_timeout_aw),.ch_timeout_w(ch_timeout_w),.ch_timeout_ar(ch_timeout_ar),.ch_wdt_timeout(ch_wdt_timeout),.rd_ch_num(rd_ch_num),.rd_cmd_num(rd_cmd_num),.load_req_in_prog(load_req_in_prog),.rd_line_cmd(rd_line_cmd),.rd_go_next_line(rd_go_next_line),.rd_burst_start(rd_burst_start),.rd_burst_addr(rd_burst_addr),.rd_burst_size(rd_burst_size),.rd_tokens(rd_tokens),.rd_cmd_port(rd_cmd_port),.rd_periph_delay(rd_periph_delay),.rd_clr_valid(rd_clr_valid),.rd_cmd_split(rd_cmd_split),.rd_cmd_line(rd_cmd_line),.rd_clr_stall(rd_clr_stall),.ch_load_req_in_prog(ch_load_req_in_prog),.ch_rd_line_cmd(ch_rd_line_cmd),.ch_rd_go_next_line(ch_rd_go_next_line),.ch_rd_burst_start(ch_rd_burst_start),.ch_rd_burst_addr(ch_rd_burst_addr),.ch_rd_burst_size(ch_rd_burst_size),.ch_rd_tokens(ch_rd_tokens),.ch_rd_port_num(ch_rd_port_num),.ch_rd_periph_delay(ch_rd_periph_delay),.ch_rd_clr_valid(ch_rd_clr_valid),.ch_rd_cmd_split(ch_rd_cmd_split),.ch_rd_cmd_line(ch_rd_cmd_line),.ch_rd_clr_stall(ch_rd_clr_stall),.load_wr_num(load_wr_num),.load_wr(load_wr),.ch_load_wr(ch_load_wr),.ch_fifo_wr_num(ch_fifo_wr_num),.rd_transfer_num(rd_transfer_num),.rd_clr_line_num(rd_clr_line_num),.rd_transfer(rd_transfer),.rd_clr_line(rd_clr_line),.fifo_wr(fifo_wr),.ch_rd_clr_line(ch_rd_clr_line),.ch_rd_transfer(ch_rd_transfer),.ch_fifo_wr(ch_fifo_wr),.rd_ch_num_resp(rd_ch_num_resp),.rd_slverr(rd_slverr),.rd_decerr(rd_decerr),.rd_clr(rd_clr),.rd_clr_load(rd_clr_load),.ch_rd_slverr(ch_rd_slverr),.ch_rd_decerr(ch_rd_decerr),.ch_rd_clr(ch_rd_clr),.ch_rd_clr_load(ch_rd_clr_load),.wr_ch_num(wr_ch_num),.wr_cmd_num(wr_cmd_num),.wr_last_cmd(wr_last_cmd),.wr_line_cmd(wr_line_cmd),.wr_go_next_line(wr_go_next_line),.wr_burst_start(wr_burst_start),.wr_burst_addr(wr_burst_addr),.wr_burst_size(wr_burst_size),.wr_tokens(wr_tokens),.wr_cmd_port(wr_cmd_port),.wr_periph_delay(wr_periph_delay),.wr_clr_valid(wr_clr_valid),.wr_cmd_split(wr_cmd_split),.wr_clr_stall(wr_clr_stall),.ch_wr_last_cmd(ch_wr_last_cmd),.ch_wr_line_cmd(ch_wr_line_cmd),.ch_wr_go_next_line(ch_wr_go_next_line),.ch_wr_burst_start(ch_wr_burst_start),.ch_wr_burst_addr(ch_wr_burst_addr),.ch_wr_burst_size(ch_wr_burst_size),.ch_wr_tokens(ch_wr_tokens),.ch_wr_port_num(ch_wr_port_num),.ch_wr_periph_delay(ch_wr_periph_delay),.ch_wr_clr_valid(ch_wr_clr_valid),.ch_wr_cmd_split(ch_wr_cmd_split),.ch_wr_clr_stall(ch_wr_clr_stall),.ch_fifo_rd_num(ch_fifo_rd_num),.wr_transfer_num(wr_transfer_num),.wr_clr_line_num(wr_clr_line_num),.wr_transfer(wr_transfer),.wr_clr_line(wr_clr_line),.fifo_rd(fifo_rd),.fifo_wr_ready(fifo_wr_ready),.ch_wr_transfer(ch_wr_transfer),.ch_wr_clr_line(ch_wr_clr_line),.ch_fifo_rd(ch_fifo_rd),.ch_fifo_wr_ready(ch_fifo_wr_ready),.wr_ch_num_resp(wr_ch_num_resp),.wr_slverr(wr_slverr),.wr_decerr(wr_decerr),.wr_clr(wr_clr),.wr_clr_last(wr_clr_last),.ch_wr_slverr(ch_wr_slverr),.ch_wr_decerr(ch_wr_decerr),.ch_wr_clr_last(ch_wr_clr_last),.ch_wr_clr(ch_wr_clr)); 
  dma_axi64_core0_ch dma_axi64_core0_ch0(.clk(clk),.reset(reset),.scan_en(scan_en),.idle(ch_idle[0]),.pclk(pclk),.clken(clken),.pclken(pclken),.psel(ch_psel[0]),.penable(penable),.paddr(paddr[7:0]),.pwrite(pwrite),.pwdata(pwdata),.prdata(ch_prdata[31+32*0:32*0]),.pslverr(ch_pslverr[0]),.periph_tx_req(periph_tx_req),.periph_tx_clr(ch_periph_tx_clr[31*0+31-1:31*0]),.periph_rx_req(periph_rx_req),.periph_rx_clr(ch_periph_rx_clr[31*0+31-1:31*0]),.rd_cmd_split(ch_rd_cmd_split[0]),.rd_cmd_line(ch_rd_cmd_line[0]),.rd_clr_line(ch_rd_clr_line[0]),.rd_clr(ch_rd_clr[0]),.rd_clr_load(ch_rd_clr_load[0]),.rd_slverr(ch_rd_slverr[0]),.rd_decerr(ch_rd_decerr[0]),.rd_line_cmd(ch_rd_line_cmd[0]),.rd_go_next_line(ch_rd_go_next_line[0]),.rd_transfer(ch_rd_transfer[0]),.rd_transfer_size(rd_transfer_size),.rd_clr_stall(ch_rd_clr_stall[0]),.wr_cmd_split(ch_wr_cmd_split[0]),.wr_cmd_pending(ch_wr_cmd_pending[0]),.wr_clr_line(ch_wr_clr_line[0]),.wr_clr(ch_wr_clr[0]),.wr_clr_last(ch_wr_clr_last[0]),.wr_slverr(ch_wr_slverr[0]),.wr_decerr(ch_wr_decerr[0]),.wr_last_cmd(ch_wr_last_cmd[0]),.wr_line_cmd(ch_wr_line_cmd[0]),.wr_go_next_line(ch_wr_go_next_line[0]),.wr_transfer(ch_wr_transfer[0]),.wr_transfer_size(wr_transfer_size),.wr_next_size(wr_next_size),.wr_clr_stall(ch_wr_clr_stall[0]),.wr_incr(),.timeout_aw(ch_timeout_aw[0]),.timeout_w(ch_timeout_w[0]),.timeout_ar(ch_timeout_ar[0]),.wdt_timeout(ch_wdt_timeout[0]),.load_wr(ch_load_wr[0]),.load_wr_cycle(load_wr_cycle),.load_wdata(load_wdata),.load_req_in_prog(ch_load_req_in_prog[0]),.ch_active(ch_active[0]),.ch_rd_active(ch_rd_active[0]),.ch_wr_active(ch_wr_active[0]),.rd_burst_start(ch_rd_burst_start[0]),.rd_ready(ch_rd_ready[0]),.rd_burst_addr(ch_rd_burst_addr[32-1+32*0:32*0]),.rd_burst_size(ch_rd_burst_size[8-1+8*0:8*0]),.rd_tokens(ch_rd_tokens[6-1+6*0:6*0]),.rd_port_num(ch_rd_port_num[0]),.rd_periph_delay(ch_rd_periph_delay[3-1+3*0:3*0]),.rd_clr_valid(ch_rd_clr_valid[0]),.wr_burst_start(ch_wr_burst_start[0]),.wr_ready(ch_wr_ready[0]),.wr_burst_addr(ch_wr_burst_addr[32-1+32*0:32*0]),.wr_burst_size(ch_wr_burst_size[8-1+8*0:8*0]),.wr_tokens(ch_wr_tokens[6-1+6*0:6*0]),.wr_port_num(ch_wr_port_num[0]),.wr_periph_delay(ch_wr_periph_delay[3-1+3*0:3*0]),.wr_clr_valid(ch_wr_clr_valid[0]),.fifo_wr(ch_fifo_wr[0]),.fifo_wdata(fifo_wdata),.fifo_wsize(fifo_wsize),.fifo_rd(ch_fifo_rd[0]),.fifo_rsize(fifo_rsize),.fifo_rd_valid(ch_fifo_rd_valid[0]),.fifo_rdata(ch_fifo_rdata[(64-1)+64*0:64*0]),.fifo_wr_ready(ch_fifo_wr_ready[0]),.joint_mode(joint_mode),.joint_remote(joint_remote),.rd_page_cross(ch_rd_page_cross[0]),.wr_page_cross(ch_wr_page_cross[0]),.joint_in_prog(ch_joint_in_prog[0]),.joint_not_in_prog(ch_joint_not_in_prog[0]),.joint_mux_in_prog(ch_joint_mux_in_prog[0]),.joint_req(ch_joint_req[0]),.ch_start(ch_start[0]),.int_all_proc(ch_int_all_proc[1-1+(1*0):1*0])); 
  dma_axi64_core0_ch_empty dma_axi64_core0_ch_empty1(.clk(clk),.reset(reset),.scan_en(scan_en),.idle(ch_idle[1]),.pclk(pclk),.clken(clken),.pclken(pclken),.psel(ch_psel[1]),.penable(penable),.paddr(paddr[7:0]),.pwrite(pwrite),.pwdata(pwdata),.prdata(ch_prdata[31+32*1:32*1]),.pslverr(ch_pslverr[1]),.periph_tx_req(periph_tx_req),.periph_tx_clr(ch_periph_tx_clr[31*1+31-1:31*1]),.periph_rx_req(periph_rx_req),.periph_rx_clr(ch_periph_rx_clr[31*1+31-1:31*1]),.rd_cmd_split(ch_rd_cmd_split[1]),.rd_cmd_line(ch_rd_cmd_line[1]),.rd_clr_line(ch_rd_clr_line[1]),.rd_clr(ch_rd_clr[1]),.rd_clr_load(ch_rd_clr_load[1]),.rd_slverr(ch_rd_slverr[1]),.rd_decerr(ch_rd_decerr[1]),.rd_line_cmd(ch_rd_line_cmd[1]),.rd_go_next_line(ch_rd_go_next_line[1]),.rd_transfer(ch_rd_transfer[1]),.rd_transfer_size(rd_transfer_size),.rd_clr_stall(ch_rd_clr_stall[1]),.wr_cmd_split(ch_wr_cmd_split[1]),.wr_cmd_pending(ch_wr_cmd_pending[1]),.wr_clr_line(ch_wr_clr_line[1]),.wr_clr(ch_wr_clr[1]),.wr_clr_last(ch_wr_clr_last[1]),.wr_slverr(ch_wr_slverr[1]),.wr_decerr(ch_wr_decerr[1]),.wr_last_cmd(ch_wr_last_cmd[1]),.wr_line_cmd(ch_wr_line_cmd[1]),.wr_go_next_line(ch_wr_go_next_line[1]),.wr_transfer(ch_wr_transfer[1]),.wr_transfer_size(wr_transfer_size),.wr_next_size(wr_next_size),.wr_clr_stall(ch_wr_clr_stall[1]),.wr_incr(),.timeout_aw(ch_timeout_aw[1]),.timeout_w(ch_timeout_w[1]),.timeout_ar(ch_timeout_ar[1]),.wdt_timeout(ch_wdt_timeout[1]),.load_wr(ch_load_wr[1]),.load_wr_cycle(load_wr_cycle),.load_wdata(load_wdata),.load_req_in_prog(ch_load_req_in_prog[1]),.ch_active(ch_active[1]),.ch_rd_active(ch_rd_active[1]),.ch_wr_active(ch_wr_active[1]),.rd_burst_start(ch_rd_burst_start[1]),.rd_ready(ch_rd_ready[1]),.rd_burst_addr(ch_rd_burst_addr[32-1+32*1:32*1]),.rd_burst_size(ch_rd_burst_size[8-1+8*1:8*1]),.rd_tokens(ch_rd_tokens[6-1+6*1:6*1]),.rd_port_num(ch_rd_port_num[1]),.rd_periph_delay(ch_rd_periph_delay[3-1+3*1:3*1]),.rd_clr_valid(ch_rd_clr_valid[1]),.wr_burst_start(ch_wr_burst_start[1]),.wr_ready(ch_wr_ready[1]),.wr_burst_addr(ch_wr_burst_addr[32-1+32*1:32*1]),.wr_burst_size(ch_wr_burst_size[8-1+8*1:8*1]),.wr_tokens(ch_wr_tokens[6-1+6*1:6*1]),.wr_port_num(ch_wr_port_num[1]),.wr_periph_delay(ch_wr_periph_delay[3-1+3*1:3*1]),.wr_clr_valid(ch_wr_clr_valid[1]),.fifo_wr(ch_fifo_wr[1]),.fifo_wdata(fifo_wdata),.fifo_wsize(fifo_wsize),.fifo_rd(ch_fifo_rd[1]),.fifo_rsize(fifo_rsize),.fifo_rd_valid(ch_fifo_rd_valid[1]),.fifo_rdata(ch_fifo_rdata[(64-1)+64*1:64*1]),.fifo_wr_ready(ch_fifo_wr_ready[1]),.joint_mode(joint_mode),.joint_remote(joint_remote),.rd_page_cross(ch_rd_page_cross[1]),.wr_page_cross(ch_wr_page_cross[1]),.joint_in_prog(ch_joint_in_prog[1]),.joint_not_in_prog(ch_joint_not_in_prog[1]),.joint_mux_in_prog(ch_joint_mux_in_prog[1]),.joint_req(ch_joint_req[1]),.ch_start(ch_start[1]),.int_all_proc(ch_int_all_proc[1-1+(1*1):1*1])); 
  dma_axi64_core0_ch_empty dma_axi64_core0_ch_empty2(.clk(clk),.reset(reset),.scan_en(scan_en),.idle(ch_idle[2]),.pclk(pclk),.clken(clken),.pclken(pclken),.psel(ch_psel[2]),.penable(penable),.paddr(paddr[7:0]),.pwrite(pwrite),.pwdata(pwdata),.prdata(ch_prdata[31+32*2:32*2]),.pslverr(ch_pslverr[2]),.periph_tx_req(periph_tx_req),.periph_tx_clr(ch_periph_tx_clr[31*2+31-1:31*2]),.periph_rx_req(periph_rx_req),.periph_rx_clr(ch_periph_rx_clr[31*2+31-1:31*2]),.rd_cmd_split(ch_rd_cmd_split[2]),.rd_cmd_line(ch_rd_cmd_line[2]),.rd_clr_line(ch_rd_clr_line[2]),.rd_clr(ch_rd_clr[2]),.rd_clr_load(ch_rd_clr_load[2]),.rd_slverr(ch_rd_slverr[2]),.rd_decerr(ch_rd_decerr[2]),.rd_line_cmd(ch_rd_line_cmd[2]),.rd_go_next_line(ch_rd_go_next_line[2]),.rd_transfer(ch_rd_transfer[2]),.rd_transfer_size(rd_transfer_size),.rd_clr_stall(ch_rd_clr_stall[2]),.wr_cmd_split(ch_wr_cmd_split[2]),.wr_cmd_pending(ch_wr_cmd_pending[2]),.wr_clr_line(ch_wr_clr_line[2]),.wr_clr(ch_wr_clr[2]),.wr_clr_last(ch_wr_clr_last[2]),.wr_slverr(ch_wr_slverr[2]),.wr_decerr(ch_wr_decerr[2]),.wr_last_cmd(ch_wr_last_cmd[2]),.wr_line_cmd(ch_wr_line_cmd[2]),.wr_go_next_line(ch_wr_go_next_line[2]),.wr_transfer(ch_wr_transfer[2]),.wr_transfer_size(wr_transfer_size),.wr_next_size(wr_next_size),.wr_clr_stall(ch_wr_clr_stall[2]),.wr_incr(),.timeout_aw(ch_timeout_aw[2]),.timeout_w(ch_timeout_w[2]),.timeout_ar(ch_timeout_ar[2]),.wdt_timeout(ch_wdt_timeout[2]),.load_wr(ch_load_wr[2]),.load_wr_cycle(load_wr_cycle),.load_wdata(load_wdata),.load_req_in_prog(ch_load_req_in_prog[2]),.ch_active(ch_active[2]),.ch_rd_active(ch_rd_active[2]),.ch_wr_active(ch_wr_active[2]),.rd_burst_start(ch_rd_burst_start[2]),.rd_ready(ch_rd_ready[2]),.rd_burst_addr(ch_rd_burst_addr[32-1+32*2:32*2]),.rd_burst_size(ch_rd_burst_size[8-1+8*2:8*2]),.rd_tokens(ch_rd_tokens[6-1+6*2:6*2]),.rd_port_num(ch_rd_port_num[2]),.rd_periph_delay(ch_rd_periph_delay[3-1+3*2:3*2]),.rd_clr_valid(ch_rd_clr_valid[2]),.wr_burst_start(ch_wr_burst_start[2]),.wr_ready(ch_wr_ready[2]),.wr_burst_addr(ch_wr_burst_addr[32-1+32*2:32*2]),.wr_burst_size(ch_wr_burst_size[8-1+8*2:8*2]),.wr_tokens(ch_wr_tokens[6-1+6*2:6*2]),.wr_port_num(ch_wr_port_num[2]),.wr_periph_delay(ch_wr_periph_delay[3-1+3*2:3*2]),.wr_clr_valid(ch_wr_clr_valid[2]),.fifo_wr(ch_fifo_wr[2]),.fifo_wdata(fifo_wdata),.fifo_wsize(fifo_wsize),.fifo_rd(ch_fifo_rd[2]),.fifo_rsize(fifo_rsize),.fifo_rd_valid(ch_fifo_rd_valid[2]),.fifo_rdata(ch_fifo_rdata[(64-1)+64*2:64*2]),.fifo_wr_ready(ch_fifo_wr_ready[2]),.joint_mode(joint_mode),.joint_remote(joint_remote),.rd_page_cross(ch_rd_page_cross[2]),.wr_page_cross(ch_wr_page_cross[2]),.joint_in_prog(ch_joint_in_prog[2]),.joint_not_in_prog(ch_joint_not_in_prog[2]),.joint_mux_in_prog(ch_joint_mux_in_prog[2]),.joint_req(ch_joint_req[2]),.ch_start(ch_start[2]),.int_all_proc(ch_int_all_proc[1-1+(1*2):1*2])); 
  dma_axi64_core0_ch_empty dma_axi64_core0_ch_empty3(.clk(clk),.reset(reset),.scan_en(scan_en),.idle(ch_idle[3]),.pclk(pclk),.clken(clken),.pclken(pclken),.psel(ch_psel[3]),.penable(penable),.paddr(paddr[7:0]),.pwrite(pwrite),.pwdata(pwdata),.prdata(ch_prdata[31+32*3:32*3]),.pslverr(ch_pslverr[3]),.periph_tx_req(periph_tx_req),.periph_tx_clr(ch_periph_tx_clr[31*3+31-1:31*3]),.periph_rx_req(periph_rx_req),.periph_rx_clr(ch_periph_rx_clr[31*3+31-1:31*3]),.rd_cmd_split(ch_rd_cmd_split[3]),.rd_cmd_line(ch_rd_cmd_line[3]),.rd_clr_line(ch_rd_clr_line[3]),.rd_clr(ch_rd_clr[3]),.rd_clr_load(ch_rd_clr_load[3]),.rd_slverr(ch_rd_slverr[3]),.rd_decerr(ch_rd_decerr[3]),.rd_line_cmd(ch_rd_line_cmd[3]),.rd_go_next_line(ch_rd_go_next_line[3]),.rd_transfer(ch_rd_transfer[3]),.rd_transfer_size(rd_transfer_size),.rd_clr_stall(ch_rd_clr_stall[3]),.wr_cmd_split(ch_wr_cmd_split[3]),.wr_cmd_pending(ch_wr_cmd_pending[3]),.wr_clr_line(ch_wr_clr_line[3]),.wr_clr(ch_wr_clr[3]),.wr_clr_last(ch_wr_clr_last[3]),.wr_slverr(ch_wr_slverr[3]),.wr_decerr(ch_wr_decerr[3]),.wr_last_cmd(ch_wr_last_cmd[3]),.wr_line_cmd(ch_wr_line_cmd[3]),.wr_go_next_line(ch_wr_go_next_line[3]),.wr_transfer(ch_wr_transfer[3]),.wr_transfer_size(wr_transfer_size),.wr_next_size(wr_next_size),.wr_clr_stall(ch_wr_clr_stall[3]),.wr_incr(),.timeout_aw(ch_timeout_aw[3]),.timeout_w(ch_timeout_w[3]),.timeout_ar(ch_timeout_ar[3]),.wdt_timeout(ch_wdt_timeout[3]),.load_wr(ch_load_wr[3]),.load_wr_cycle(load_wr_cycle),.load_wdata(load_wdata),.load_req_in_prog(ch_load_req_in_prog[3]),.ch_active(ch_active[3]),.ch_rd_active(ch_rd_active[3]),.ch_wr_active(ch_wr_active[3]),.rd_burst_start(ch_rd_burst_start[3]),.rd_ready(ch_rd_ready[3]),.rd_burst_addr(ch_rd_burst_addr[32-1+32*3:32*3]),.rd_burst_size(ch_rd_burst_size[8-1+8*3:8*3]),.rd_tokens(ch_rd_tokens[6-1+6*3:6*3]),.rd_port_num(ch_rd_port_num[3]),.rd_periph_delay(ch_rd_periph_delay[3-1+3*3:3*3]),.rd_clr_valid(ch_rd_clr_valid[3]),.wr_burst_start(ch_wr_burst_start[3]),.wr_ready(ch_wr_ready[3]),.wr_burst_addr(ch_wr_burst_addr[32-1+32*3:32*3]),.wr_burst_size(ch_wr_burst_size[8-1+8*3:8*3]),.wr_tokens(ch_wr_tokens[6-1+6*3:6*3]),.wr_port_num(ch_wr_port_num[3]),.wr_periph_delay(ch_wr_periph_delay[3-1+3*3:3*3]),.wr_clr_valid(ch_wr_clr_valid[3]),.fifo_wr(ch_fifo_wr[3]),.fifo_wdata(fifo_wdata),.fifo_wsize(fifo_wsize),.fifo_rd(ch_fifo_rd[3]),.fifo_rsize(fifo_rsize),.fifo_rd_valid(ch_fifo_rd_valid[3]),.fifo_rdata(ch_fifo_rdata[(64-1)+64*3:64*3]),.fifo_wr_ready(ch_fifo_wr_ready[3]),.joint_mode(joint_mode),.joint_remote(joint_remote),.rd_page_cross(ch_rd_page_cross[3]),.wr_page_cross(ch_wr_page_cross[3]),.joint_in_prog(ch_joint_in_prog[3]),.joint_not_in_prog(ch_joint_not_in_prog[3]),.joint_mux_in_prog(ch_joint_mux_in_prog[3]),.joint_req(ch_joint_req[3]),.ch_start(ch_start[3]),.int_all_proc(ch_int_all_proc[1-1+(1*3):1*3])); 
  dma_axi64_core0_ch_empty dma_axi64_core0_ch_empty4(.clk(clk),.reset(reset),.scan_en(scan_en),.idle(ch_idle[4]),.pclk(pclk),.clken(clken),.pclken(pclken),.psel(ch_psel[4]),.penable(penable),.paddr(paddr[7:0]),.pwrite(pwrite),.pwdata(pwdata),.prdata(ch_prdata[31+32*4:32*4]),.pslverr(ch_pslverr[4]),.periph_tx_req(periph_tx_req),.periph_tx_clr(ch_periph_tx_clr[31*4+31-1:31*4]),.periph_rx_req(periph_rx_req),.periph_rx_clr(ch_periph_rx_clr[31*4+31-1:31*4]),.rd_cmd_split(ch_rd_cmd_split[4]),.rd_cmd_line(ch_rd_cmd_line[4]),.rd_clr_line(ch_rd_clr_line[4]),.rd_clr(ch_rd_clr[4]),.rd_clr_load(ch_rd_clr_load[4]),.rd_slverr(ch_rd_slverr[4]),.rd_decerr(ch_rd_decerr[4]),.rd_line_cmd(ch_rd_line_cmd[4]),.rd_go_next_line(ch_rd_go_next_line[4]),.rd_transfer(ch_rd_transfer[4]),.rd_transfer_size(rd_transfer_size),.rd_clr_stall(ch_rd_clr_stall[4]),.wr_cmd_split(ch_wr_cmd_split[4]),.wr_cmd_pending(ch_wr_cmd_pending[4]),.wr_clr_line(ch_wr_clr_line[4]),.wr_clr(ch_wr_clr[4]),.wr_clr_last(ch_wr_clr_last[4]),.wr_slverr(ch_wr_slverr[4]),.wr_decerr(ch_wr_decerr[4]),.wr_last_cmd(ch_wr_last_cmd[4]),.wr_line_cmd(ch_wr_line_cmd[4]),.wr_go_next_line(ch_wr_go_next_line[4]),.wr_transfer(ch_wr_transfer[4]),.wr_transfer_size(wr_transfer_size),.wr_next_size(wr_next_size),.wr_clr_stall(ch_wr_clr_stall[4]),.wr_incr(),.timeout_aw(ch_timeout_aw[4]),.timeout_w(ch_timeout_w[4]),.timeout_ar(ch_timeout_ar[4]),.wdt_timeout(ch_wdt_timeout[4]),.load_wr(ch_load_wr[4]),.load_wr_cycle(load_wr_cycle),.load_wdata(load_wdata),.load_req_in_prog(ch_load_req_in_prog[4]),.ch_active(ch_active[4]),.ch_rd_active(ch_rd_active[4]),.ch_wr_active(ch_wr_active[4]),.rd_burst_start(ch_rd_burst_start[4]),.rd_ready(ch_rd_ready[4]),.rd_burst_addr(ch_rd_burst_addr[32-1+32*4:32*4]),.rd_burst_size(ch_rd_burst_size[8-1+8*4:8*4]),.rd_tokens(ch_rd_tokens[6-1+6*4:6*4]),.rd_port_num(ch_rd_port_num[4]),.rd_periph_delay(ch_rd_periph_delay[3-1+3*4:3*4]),.rd_clr_valid(ch_rd_clr_valid[4]),.wr_burst_start(ch_wr_burst_start[4]),.wr_ready(ch_wr_ready[4]),.wr_burst_addr(ch_wr_burst_addr[32-1+32*4:32*4]),.wr_burst_size(ch_wr_burst_size[8-1+8*4:8*4]),.wr_tokens(ch_wr_tokens[6-1+6*4:6*4]),.wr_port_num(ch_wr_port_num[4]),.wr_periph_delay(ch_wr_periph_delay[3-1+3*4:3*4]),.wr_clr_valid(ch_wr_clr_valid[4]),.fifo_wr(ch_fifo_wr[4]),.fifo_wdata(fifo_wdata),.fifo_wsize(fifo_wsize),.fifo_rd(ch_fifo_rd[4]),.fifo_rsize(fifo_rsize),.fifo_rd_valid(ch_fifo_rd_valid[4]),.fifo_rdata(ch_fifo_rdata[(64-1)+64*4:64*4]),.fifo_wr_ready(ch_fifo_wr_ready[4]),.joint_mode(joint_mode),.joint_remote(joint_remote),.rd_page_cross(ch_rd_page_cross[4]),.wr_page_cross(ch_wr_page_cross[4]),.joint_in_prog(ch_joint_in_prog[4]),.joint_not_in_prog(ch_joint_not_in_prog[4]),.joint_mux_in_prog(ch_joint_mux_in_prog[4]),.joint_req(ch_joint_req[4]),.ch_start(ch_start[4]),.int_all_proc(ch_int_all_proc[1-1+(1*4):1*4])); 
  dma_axi64_core0_ch_empty dma_axi64_core0_ch_empty5(.clk(clk),.reset(reset),.scan_en(scan_en),.idle(ch_idle[5]),.pclk(pclk),.clken(clken),.pclken(pclken),.psel(ch_psel[5]),.penable(penable),.paddr(paddr[7:0]),.pwrite(pwrite),.pwdata(pwdata),.prdata(ch_prdata[31+32*5:32*5]),.pslverr(ch_pslverr[5]),.periph_tx_req(periph_tx_req),.periph_tx_clr(ch_periph_tx_clr[31*5+31-1:31*5]),.periph_rx_req(periph_rx_req),.periph_rx_clr(ch_periph_rx_clr[31*5+31-1:31*5]),.rd_cmd_split(ch_rd_cmd_split[5]),.rd_cmd_line(ch_rd_cmd_line[5]),.rd_clr_line(ch_rd_clr_line[5]),.rd_clr(ch_rd_clr[5]),.rd_clr_load(ch_rd_clr_load[5]),.rd_slverr(ch_rd_slverr[5]),.rd_decerr(ch_rd_decerr[5]),.rd_line_cmd(ch_rd_line_cmd[5]),.rd_go_next_line(ch_rd_go_next_line[5]),.rd_transfer(ch_rd_transfer[5]),.rd_transfer_size(rd_transfer_size),.rd_clr_stall(ch_rd_clr_stall[5]),.wr_cmd_split(ch_wr_cmd_split[5]),.wr_cmd_pending(ch_wr_cmd_pending[5]),.wr_clr_line(ch_wr_clr_line[5]),.wr_clr(ch_wr_clr[5]),.wr_clr_last(ch_wr_clr_last[5]),.wr_slverr(ch_wr_slverr[5]),.wr_decerr(ch_wr_decerr[5]),.wr_last_cmd(ch_wr_last_cmd[5]),.wr_line_cmd(ch_wr_line_cmd[5]),.wr_go_next_line(ch_wr_go_next_line[5]),.wr_transfer(ch_wr_transfer[5]),.wr_transfer_size(wr_transfer_size),.wr_next_size(wr_next_size),.wr_clr_stall(ch_wr_clr_stall[5]),.wr_incr(),.timeout_aw(ch_timeout_aw[5]),.timeout_w(ch_timeout_w[5]),.timeout_ar(ch_timeout_ar[5]),.wdt_timeout(ch_wdt_timeout[5]),.load_wr(ch_load_wr[5]),.load_wr_cycle(load_wr_cycle),.load_wdata(load_wdata),.load_req_in_prog(ch_load_req_in_prog[5]),.ch_active(ch_active[5]),.ch_rd_active(ch_rd_active[5]),.ch_wr_active(ch_wr_active[5]),.rd_burst_start(ch_rd_burst_start[5]),.rd_ready(ch_rd_ready[5]),.rd_burst_addr(ch_rd_burst_addr[32-1+32*5:32*5]),.rd_burst_size(ch_rd_burst_size[8-1+8*5:8*5]),.rd_tokens(ch_rd_tokens[6-1+6*5:6*5]),.rd_port_num(ch_rd_port_num[5]),.rd_periph_delay(ch_rd_periph_delay[3-1+3*5:3*5]),.rd_clr_valid(ch_rd_clr_valid[5]),.wr_burst_start(ch_wr_burst_start[5]),.wr_ready(ch_wr_ready[5]),.wr_burst_addr(ch_wr_burst_addr[32-1+32*5:32*5]),.wr_burst_size(ch_wr_burst_size[8-1+8*5:8*5]),.wr_tokens(ch_wr_tokens[6-1+6*5:6*5]),.wr_port_num(ch_wr_port_num[5]),.wr_periph_delay(ch_wr_periph_delay[3-1+3*5:3*5]),.wr_clr_valid(ch_wr_clr_valid[5]),.fifo_wr(ch_fifo_wr[5]),.fifo_wdata(fifo_wdata),.fifo_wsize(fifo_wsize),.fifo_rd(ch_fifo_rd[5]),.fifo_rsize(fifo_rsize),.fifo_rd_valid(ch_fifo_rd_valid[5]),.fifo_rdata(ch_fifo_rdata[(64-1)+64*5:64*5]),.fifo_wr_ready(ch_fifo_wr_ready[5]),.joint_mode(joint_mode),.joint_remote(joint_remote),.rd_page_cross(ch_rd_page_cross[5]),.wr_page_cross(ch_wr_page_cross[5]),.joint_in_prog(ch_joint_in_prog[5]),.joint_not_in_prog(ch_joint_not_in_prog[5]),.joint_mux_in_prog(ch_joint_mux_in_prog[5]),.joint_req(ch_joint_req[5]),.ch_start(ch_start[5]),.int_all_proc(ch_int_all_proc[1-1+(1*5):1*5])); 
  dma_axi64_core0_ch_empty dma_axi64_core0_ch_empty6(.clk(clk),.reset(reset),.scan_en(scan_en),.idle(ch_idle[6]),.pclk(pclk),.clken(clken),.pclken(pclken),.psel(ch_psel[6]),.penable(penable),.paddr(paddr[7:0]),.pwrite(pwrite),.pwdata(pwdata),.prdata(ch_prdata[31+32*6:32*6]),.pslverr(ch_pslverr[6]),.periph_tx_req(periph_tx_req),.periph_tx_clr(ch_periph_tx_clr[31*6+31-1:31*6]),.periph_rx_req(periph_rx_req),.periph_rx_clr(ch_periph_rx_clr[31*6+31-1:31*6]),.rd_cmd_split(ch_rd_cmd_split[6]),.rd_cmd_line(ch_rd_cmd_line[6]),.rd_clr_line(ch_rd_clr_line[6]),.rd_clr(ch_rd_clr[6]),.rd_clr_load(ch_rd_clr_load[6]),.rd_slverr(ch_rd_slverr[6]),.rd_decerr(ch_rd_decerr[6]),.rd_line_cmd(ch_rd_line_cmd[6]),.rd_go_next_line(ch_rd_go_next_line[6]),.rd_transfer(ch_rd_transfer[6]),.rd_transfer_size(rd_transfer_size),.rd_clr_stall(ch_rd_clr_stall[6]),.wr_cmd_split(ch_wr_cmd_split[6]),.wr_cmd_pending(ch_wr_cmd_pending[6]),.wr_clr_line(ch_wr_clr_line[6]),.wr_clr(ch_wr_clr[6]),.wr_clr_last(ch_wr_clr_last[6]),.wr_slverr(ch_wr_slverr[6]),.wr_decerr(ch_wr_decerr[6]),.wr_last_cmd(ch_wr_last_cmd[6]),.wr_line_cmd(ch_wr_line_cmd[6]),.wr_go_next_line(ch_wr_go_next_line[6]),.wr_transfer(ch_wr_transfer[6]),.wr_transfer_size(wr_transfer_size),.wr_next_size(wr_next_size),.wr_clr_stall(ch_wr_clr_stall[6]),.wr_incr(),.timeout_aw(ch_timeout_aw[6]),.timeout_w(ch_timeout_w[6]),.timeout_ar(ch_timeout_ar[6]),.wdt_timeout(ch_wdt_timeout[6]),.load_wr(ch_load_wr[6]),.load_wr_cycle(load_wr_cycle),.load_wdata(load_wdata),.load_req_in_prog(ch_load_req_in_prog[6]),.ch_active(ch_active[6]),.ch_rd_active(ch_rd_active[6]),.ch_wr_active(ch_wr_active[6]),.rd_burst_start(ch_rd_burst_start[6]),.rd_ready(ch_rd_ready[6]),.rd_burst_addr(ch_rd_burst_addr[32-1+32*6:32*6]),.rd_burst_size(ch_rd_burst_size[8-1+8*6:8*6]),.rd_tokens(ch_rd_tokens[6-1+6*6:6*6]),.rd_port_num(ch_rd_port_num[6]),.rd_periph_delay(ch_rd_periph_delay[3-1+3*6:3*6]),.rd_clr_valid(ch_rd_clr_valid[6]),.wr_burst_start(ch_wr_burst_start[6]),.wr_ready(ch_wr_ready[6]),.wr_burst_addr(ch_wr_burst_addr[32-1+32*6:32*6]),.wr_burst_size(ch_wr_burst_size[8-1+8*6:8*6]),.wr_tokens(ch_wr_tokens[6-1+6*6:6*6]),.wr_port_num(ch_wr_port_num[6]),.wr_periph_delay(ch_wr_periph_delay[3-1+3*6:3*6]),.wr_clr_valid(ch_wr_clr_valid[6]),.fifo_wr(ch_fifo_wr[6]),.fifo_wdata(fifo_wdata),.fifo_wsize(fifo_wsize),.fifo_rd(ch_fifo_rd[6]),.fifo_rsize(fifo_rsize),.fifo_rd_valid(ch_fifo_rd_valid[6]),.fifo_rdata(ch_fifo_rdata[(64-1)+64*6:64*6]),.fifo_wr_ready(ch_fifo_wr_ready[6]),.joint_mode(joint_mode),.joint_remote(joint_remote),.rd_page_cross(ch_rd_page_cross[6]),.wr_page_cross(ch_wr_page_cross[6]),.joint_in_prog(ch_joint_in_prog[6]),.joint_not_in_prog(ch_joint_not_in_prog[6]),.joint_mux_in_prog(ch_joint_mux_in_prog[6]),.joint_req(ch_joint_req[6]),.ch_start(ch_start[6]),.int_all_proc(ch_int_all_proc[1-1+(1*6):1*6])); 
  dma_axi64_core0_ch_empty dma_axi64_core0_ch_empty7(.clk(clk),.reset(reset),.scan_en(scan_en),.idle(ch_idle[7]),.pclk(pclk),.clken(clken),.pclken(pclken),.psel(ch_psel[7]),.penable(penable),.paddr(paddr[7:0]),.pwrite(pwrite),.pwdata(pwdata),.prdata(ch_prdata[31+32*7:32*7]),.pslverr(ch_pslverr[7]),.periph_tx_req(periph_tx_req),.periph_tx_clr(ch_periph_tx_clr[31*7+31-1:31*7]),.periph_rx_req(periph_rx_req),.periph_rx_clr(ch_periph_rx_clr[31*7+31-1:31*7]),.rd_cmd_split(ch_rd_cmd_split[7]),.rd_cmd_line(ch_rd_cmd_line[7]),.rd_clr_line(ch_rd_clr_line[7]),.rd_clr(ch_rd_clr[7]),.rd_clr_load(ch_rd_clr_load[7]),.rd_slverr(ch_rd_slverr[7]),.rd_decerr(ch_rd_decerr[7]),.rd_line_cmd(ch_rd_line_cmd[7]),.rd_go_next_line(ch_rd_go_next_line[7]),.rd_transfer(ch_rd_transfer[7]),.rd_transfer_size(rd_transfer_size),.rd_clr_stall(ch_rd_clr_stall[7]),.wr_cmd_split(ch_wr_cmd_split[7]),.wr_cmd_pending(ch_wr_cmd_pending[7]),.wr_clr_line(ch_wr_clr_line[7]),.wr_clr(ch_wr_clr[7]),.wr_clr_last(ch_wr_clr_last[7]),.wr_slverr(ch_wr_slverr[7]),.wr_decerr(ch_wr_decerr[7]),.wr_last_cmd(ch_wr_last_cmd[7]),.wr_line_cmd(ch_wr_line_cmd[7]),.wr_go_next_line(ch_wr_go_next_line[7]),.wr_transfer(ch_wr_transfer[7]),.wr_transfer_size(wr_transfer_size),.wr_next_size(wr_next_size),.wr_clr_stall(ch_wr_clr_stall[7]),.wr_incr(),.timeout_aw(ch_timeout_aw[7]),.timeout_w(ch_timeout_w[7]),.timeout_ar(ch_timeout_ar[7]),.wdt_timeout(ch_wdt_timeout[7]),.load_wr(ch_load_wr[7]),.load_wr_cycle(load_wr_cycle),.load_wdata(load_wdata),.load_req_in_prog(ch_load_req_in_prog[7]),.ch_active(ch_active[7]),.ch_rd_active(ch_rd_active[7]),.ch_wr_active(ch_wr_active[7]),.rd_burst_start(ch_rd_burst_start[7]),.rd_ready(ch_rd_ready[7]),.rd_burst_addr(ch_rd_burst_addr[32-1+32*7:32*7]),.rd_burst_size(ch_rd_burst_size[8-1+8*7:8*7]),.rd_tokens(ch_rd_tokens[6-1+6*7:6*7]),.rd_port_num(ch_rd_port_num[7]),.rd_periph_delay(ch_rd_periph_delay[3-1+3*7:3*7]),.rd_clr_valid(ch_rd_clr_valid[7]),.wr_burst_start(ch_wr_burst_start[7]),.wr_ready(ch_wr_ready[7]),.wr_burst_addr(ch_wr_burst_addr[32-1+32*7:32*7]),.wr_burst_size(ch_wr_burst_size[8-1+8*7:8*7]),.wr_tokens(ch_wr_tokens[6-1+6*7:6*7]),.wr_port_num(ch_wr_port_num[7]),.wr_periph_delay(ch_wr_periph_delay[3-1+3*7:3*7]),.wr_clr_valid(ch_wr_clr_valid[7]),.fifo_wr(ch_fifo_wr[7]),.fifo_wdata(fifo_wdata),.fifo_wsize(fifo_wsize),.fifo_rd(ch_fifo_rd[7]),.fifo_rsize(fifo_rsize),.fifo_rd_valid(ch_fifo_rd_valid[7]),.fifo_rdata(ch_fifo_rdata[(64-1)+64*7:64*7]),.fifo_wr_ready(ch_fifo_wr_ready[7]),.joint_mode(joint_mode),.joint_remote(joint_remote),.rd_page_cross(ch_rd_page_cross[7]),.wr_page_cross(ch_wr_page_cross[7]),.joint_in_prog(ch_joint_in_prog[7]),.joint_not_in_prog(ch_joint_not_in_prog[7]),.joint_mux_in_prog(ch_joint_mux_in_prog[7]),.joint_req(ch_joint_req[7]),.ch_start(ch_start[7]),.int_all_proc(ch_int_all_proc[1-1+(1*7):1*7])); 
endmodule
 
module dma_axi64_core0_ch_reg #(
 parameter DATA_SHIFT =0 ? 32:0,
 parameter CMD_LINE0 =8'h00,
 parameter CMD_LINE1 =8'h04,
 parameter CMD_LINE2 =8'h08,
 parameter CMD_LINE3 =8'h0C,
 parameter STATIC_LINE0 =8'h10,
 parameter STATIC_LINE1 =8'h14,
 parameter STATIC_LINE2 =8'h18,
 parameter STATIC_LINE3 =8'h1C,
 parameter STATIC_LINE4 =8'h20,
 parameter RESTRICT =8'h2C,
 parameter RD_OFFSETS =8'h30,
 parameter WR_OFFSETS =8'h34,
 parameter FIFO_FULLNESS =8'h38,
 parameter CMD_OUTS =8'h3C,
 parameter CH_ENABLE =8'h40,
 parameter CH_START =8'h44,
 parameter CH_ACTIVE =8'h48,
 parameter CH_CMD_COUNTER =8'h50,
 parameter INT_RAWSTAT =8'hA0,
 parameter INT_CLEAR =8'hA4,
 parameter INT_ENABLE =8'hA8,
 parameter INT_STATUS =8'hAC) (
  input clk,
  input clken,
  input pclken,
  input reset,
  input psel,
  input penable,
  input [7:0] paddr,
  input pwrite,
  input [31:0] pwdata,
  output reg  [31:0] prdata,
  output reg  pslverr,
  input [4:0] timeout_bus,
  input wdt_timeout,
  input ch_start,
  output [32-1:0] load_addr,
  output load_in_prog,
  output load_req_in_prog,
  input load_wr,
  input [1:0] load_wr_cycle,
  input [64-1:0] load_wdata,
  input load_cmd,
  input rd_ch_end,
  input wr_ch_end,
  input wr_clr_last,
  input rd_slverr,
  input rd_decerr,
  input wr_slverr,
  input wr_decerr,
  output [1-1:0] int_all_proc,
  output ch_rd_active,
  output ch_wr_active,
  output reg  ch_in_prog,
  input [10-1:0] rd_x_offset,
  input [10-8-1:0] rd_y_offset,
  input [10-1:0] wr_x_offset,
  input [10-8-1:0] wr_y_offset,
  input [5:0] wr_fullness,
  input [5:0] rd_gap,
  input fifo_overflow,
  input fifo_underflow,
  output reg  ch_update,
  output reg  [32-1:0] rd_start_addr,
  output reg  [32-1:0] wr_start_addr,
  output [10-1:0] x_size,
  output [10-8-1:0] y_size,
  output [8-1:0] rd_burst_max_size,
  output [8-1:0] wr_burst_max_size,
  output block,
  input allow_line_cmd,
  output [12-1:0] frame_width,
  output [3-1:0] width_align,
  output [3-1:0] rd_periph_delay,
  output rd_periph_block,
  output [3-1:0] wr_periph_delay,
  output wr_periph_block,
  output [6-1:0] rd_tokens,
  output [6-1:0] wr_tokens,
  output rd_port_num,
  output wr_port_num,
  output [4-1:0] rd_outs_max,
  output [4-1:0] wr_outs_max,
  input [4-1:0] rd_outs,
  input [4-1:0] wr_outs,
  input outs_empty,
  output [12-1:0] rd_wait_limit,
  output [12-1:0] wr_wait_limit,
  output rd_incr,
  output wr_incr,
  output [4:0] rd_periph_num,
  output [4:0] wr_periph_num,
  output wr_outstanding,
  output rd_outstanding,
  output ch_retry_wait,
  input joint_mode,
  input joint_remote,
  input joint_cross,
  input page_cross,
  output joint,
  input joint_flush,
  output [1:0] end_swap) ; 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   wire [7:0] gpaddr ;  
   wire gpwrite ;  
   wire gpread ;  
   reg [31:0] prdata_pre ;  
   reg pslverr_pre ;  
   reg ch_enable ;  
   reg rd_ch_in_prog ;  
   reg wr_ch_in_prog ;  
   reg load_in_prog_reg ;  
   reg load_req_in_prog_reg ;  
   reg [10-1:0] buff_size ;  
   //wire [10-1:0] x_size ;  
   //wire [10-8-1:0] y_size ;  
   reg [12-1:0] frame_width_reg ;  
   reg block_reg ;  
   reg joint_reg ;  
   reg simple_mem ;  
   //wire joint ;  
   wire joint_mux ;  
   reg auto_retry_reg ;  
   wire auto_retry ;  
   reg [1:0] end_swap_reg ;  
   wire [8-1:0] rd_burst_max_size_rd ;  
   wire [8-1:0] rd_burst_max_size_pre ;  
   reg [8-1:0] rd_burst_max_size_reg ;  
   reg [3-1:0] rd_periph_delay_reg ;  
   reg rd_periph_block_reg ;  
   reg [6-1:0] rd_tokens_reg ;  
   reg [4-1:0] rd_outs_max_reg ;  
   reg rd_port_num_reg ;  
   reg cmd_port_num_reg ;  
   wire rd_port_num_cfg ;  
   wire cmd_port_num ;  
   reg rd_outstanding_reg ;  
   wire rd_outstanding_cfg ;  
   reg rd_incr_reg ;  
   reg [4:0] rd_periph_num_reg ;  
   reg [12-1:4] rd_wait_limit_reg ;  
   wire [8-1:0] wr_burst_max_size_rd ;  
   wire [8-1:0] wr_burst_max_size_pre ;  
   reg [8-1:0] wr_burst_max_size_reg ;  
   reg [3-1:0] wr_periph_delay_reg ;  
   reg wr_periph_block_reg ;  
   reg [6-1:0] wr_tokens_reg ;  
   reg [4-1:0] wr_outs_max_reg ;  
   reg wr_port_num_reg ;  
   reg wr_outstanding_reg ;  
   wire wr_outstanding_cfg ;  
   reg wr_incr_reg ;  
   reg [4:0] wr_periph_num_reg ;  
   reg [12-1:4] wr_wait_limit_reg ;  
   wire rd_allow_full_fifo ;  
   wire wr_allow_full_fifo ;  
   wire allow_full_fifo ;  
   wire allow_full_burst ;  
   wire allow_joint_burst ;  
   wire burst_max_size_update_pre ;  
   wire burst_max_size_update ;  
   reg cmd_set_int_reg ;  
   reg cmd_last_reg ;  
   reg [32-1:2] cmd_next_addr_reg ;  
   reg [12-1:0] cmd_counter_reg ;  
   reg [4-1:0] int_counter_reg ;  
   wire cmd_set_int ;  
   wire cmd_last ;  
   wire [32-1:2] cmd_next_addr ;  
   wire [12-1:0] cmd_counter ;  
   wire [4-1:0] int_counter ;  
   wire ch_end ;  
   wire ch_end_set ;  
   wire ch_end_clear ;  
   wire ch_end_int ;  
   wire [2:0] int_proc_num ;  
   reg [2:0] int_proc_num_reg ;  
   wire [13-1:0] int_bus ;  
   wire [13-1:0] int_rawstat ;  
   reg [13-1:0] int_enable ;  
   wire [13-1:0] int_status ;  
   wire [7:0] int_all_proc_bus ;  
   wire wr_cmd_line0 ;  
   wire wr_cmd_line1 ;  
   wire wr_cmd_line2 ;  
   wire wr_cmd_line3 ;  
   wire wr_static_line0 ;  
   wire wr_static_line1 ;  
   wire wr_static_line2 ;  
   wire wr_static_line3 ;  
   wire wr_static_line4 ;  
   wire wr_ch_enable ;  
   wire wr_ch_start ;  
   wire wr_int_rawstat ;  
   wire wr_int_clear ;  
   wire wr_int_enable ;  
   wire wr_frame_width ;  
   reg [31:0] rd_cmd_line0 ;  
   reg [31:0] rd_cmd_line1 ;  
   reg [31:0] rd_cmd_line2 ;  
   reg [31:0] rd_cmd_line3 ;  
   reg [31:0] rd_static_line0 ;  
   reg [31:0] rd_static_line1 ;  
   reg [31:0] rd_static_line2 ;  
   reg [31:0] rd_static_line3 ;  
   reg [31:0] rd_static_line4 ;  
   reg [31:0] rd_restrict ;  
   reg [31:0] rd_rd_offsets ;  
   reg [31:0] rd_wr_offsets ;  
   reg [31:0] rd_fifo_fullness ;  
   reg [31:0] rd_cmd_outs ;  
   reg [31:0] rd_ch_enable ;  
   reg [31:0] rd_ch_active ;  
   reg [31:0] rd_cmd_counter ;  
   reg [31:0] rd_int_rawstat ;  
   reg [31:0] rd_int_enable ;  
   reg [31:0] rd_int_status ;  
   wire load_wr_cycle0 ;  
   wire load_wr_cycle1 ;  
   wire load_wr_cycle2 ;  
   wire load_wr_cycle3 ;  
   wire load_wr0 ;  
   wire load_wr1 ;  
   wire load_wr2 ;  
   wire load_wr3 ;  
   wire load_wr_last ;  
   wire load_req ;  
   wire timeout_aw ;  
   wire timeout_w ;  
   wire timeout_b ;  
   wire timeout_ar ;  
   wire timeout_r ;  
   wire ch_retry_wait_pre ;  
   reg ch_retry_wait_reg ;  
   //wire ch_retry_wait ;  
   wire ch_retry ;  
   wire ch_update_pre ;  
   wire ch_update_d ;  
   wire ch_int ;  
  assign gpaddr=paddr; 
  assign gpwrite=psel&(~penable)&pwrite; 
  assign gpread=psel&(~penable)&(~pwrite); 
  assign wr_cmd_line0=gpwrite&gpaddr==CMD_LINE0; 
  assign wr_cmd_line1=gpwrite&gpaddr==CMD_LINE1; 
  assign wr_cmd_line2=gpwrite&gpaddr==CMD_LINE2; 
  assign wr_cmd_line3=gpwrite&gpaddr==CMD_LINE3; 
  assign wr_static_line0=gpwrite&gpaddr==STATIC_LINE0; 
  assign wr_static_line1=gpwrite&gpaddr==STATIC_LINE1; 
  assign wr_static_line2=gpwrite&gpaddr==STATIC_LINE2; 
  assign wr_static_line3=gpwrite&gpaddr==STATIC_LINE3; 
  assign wr_static_line4=gpwrite&gpaddr==STATIC_LINE4; 
  assign wr_ch_enable=gpwrite&gpaddr==CH_ENABLE; 
  assign wr_ch_start=(gpwrite&gpaddr==CH_START)|ch_start; 
  assign wr_int_rawstat=gpwrite&gpaddr==INT_RAWSTAT; 
  assign wr_int_clear=gpwrite&gpaddr==INT_CLEAR; 
  assign wr_int_enable=gpwrite&gpaddr==INT_ENABLE; 
  assign load_wr_cycle0=load_wr&load_wr_cycle==2'd0; 
  assign load_wr_cycle1=load_wr&load_wr_cycle==2'd1; 
  assign load_wr_cycle2=load_wr&load_wr_cycle==2'd2; 
  assign load_wr_cycle3=load_wr&load_wr_cycle==2'd3; 
  assign load_wr0=0 ? load_wr_cycle0:load_wr_cycle0; 
  assign load_wr1=0 ? load_wr_cycle1:load_wr_cycle0; 
  assign load_wr2=0 ? load_wr_cycle2:load_wr_cycle1; 
  assign load_wr3=0 ? load_wr_cycle3:load_wr_cycle1; 
  assign load_wr_last=load_wr3; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            rd_start_addr <={32{1'b0}};
          end 
        else 
          if (wr_cmd_line0)
             begin 
               rd_start_addr <=pwdata[32-1:0];
             end 
           else 
             if (load_wr0)
                begin 
                  rd_start_addr <=load_wdata[32-1:0];
                end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            wr_start_addr <={32{1'b0}};
          end 
        else 
          if (wr_cmd_line1)
             begin 
               wr_start_addr <=pwdata[32-1:0];
             end 
           else 
             if (load_wr1)
                begin 
                  wr_start_addr <=load_wdata[32+32-DATA_SHIFT-1:32-DATA_SHIFT];
                end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            buff_size <={10{1'b0}};
          end 
        else 
          if (wr_cmd_line2)
             begin 
               buff_size <=pwdata[10-1:0];
             end 
           else 
             if (load_wr2)
                begin 
                  buff_size <=load_wdata[10-1:0];
                end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            cmd_set_int_reg <=1'b0;
            cmd_last_reg <=1'b0;
            cmd_next_addr_reg <={30{1'b0}};
          end 
        else 
          if (wr_cmd_line3)
             begin 
               cmd_set_int_reg <=pwdata[0];
               cmd_last_reg <=pwdata[1];
               cmd_next_addr_reg <=pwdata[32-1:2];
             end 
           else 
             if (load_wr3)
                begin 
                  cmd_set_int_reg <=load_wdata[32-DATA_SHIFT];
                  cmd_last_reg <=load_wdata[33-DATA_SHIFT];
                  cmd_next_addr_reg <=load_wdata[32+32-DATA_SHIFT-1:34-DATA_SHIFT];
                end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          cmd_counter_reg <={12{1'b0}};
        else 
          if (wr_ch_start)
             cmd_counter_reg <={12{1'b0}};
           else 
             if (ch_end&clken)
                cmd_counter_reg <=cmd_counter_reg+1'b1;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          int_counter_reg <={4{1'b0}};
        else 
          if (wr_ch_start)
             int_counter_reg <={4{1'b0}};
           else 
             if ((ch_end_int&clken)|ch_end_clear)
                int_counter_reg <=int_counter_reg+(ch_end_int&clken)-ch_end_clear;
 
  assign cmd_set_int=cmd_set_int_reg; 
  assign cmd_last=cmd_last_reg; 
  assign cmd_next_addr=cmd_next_addr_reg; 
  assign cmd_counter=cmd_counter_reg; 
  assign int_counter=int_counter_reg; 
  assign x_size=block ? {{10-8{1'b0}},buff_size[8-1:0]}:buff_size; 
  assign y_size=block ? buff_size[10-1:8]:'d1; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            rd_burst_max_size_reg <='d0;
            rd_tokens_reg <='d1;
            rd_outs_max_reg <={4{1'b0}};
            rd_incr_reg <='d1;
          end 
        else 
          if (wr_static_line0)
             begin 
               rd_burst_max_size_reg <=pwdata[8-1:0];
               rd_tokens_reg <=pwdata[6+16-1:16];
               rd_outs_max_reg <=pwdata[4+24-1:24];
               rd_incr_reg <=pwdata[31];
             end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            wr_burst_max_size_reg <='d0;
            wr_tokens_reg <='d1;
            wr_outs_max_reg <={4{1'b0}};
            wr_incr_reg <='d1;
          end 
        else 
          if (wr_static_line1)
             begin 
               wr_burst_max_size_reg <=pwdata[8-1:0];
               wr_tokens_reg <=pwdata[6+16-1:16];
               wr_outs_max_reg <=pwdata[4+24-1:24];
               wr_incr_reg <=pwdata[31];
             end
  
  assign rd_incr=rd_incr_reg; 
  assign wr_incr=wr_incr_reg; 
  assign rd_outstanding_cfg=1'b0; 
  assign wr_outstanding_cfg=1'b0; 
  assign rd_outstanding=1'b0; 
  assign wr_outstanding=1'b0; 
  assign rd_tokens=rd_tokens_reg; 
  assign wr_tokens=joint_mux ? rd_tokens_reg:wr_tokens_reg; 
  assign rd_outs_max=rd_outs_max_reg; 
  assign wr_outs_max=joint_mux ? rd_outs_max_reg:wr_outs_max_reg; 
  assign rd_allow_full_fifo=rd_start_addr[5-1:0]=='d0; 
  assign wr_allow_full_fifo=wr_start_addr[5-1:0]=='d0; 
  assign allow_full_fifo=rd_allow_full_fifo&wr_allow_full_fifo; 
  assign rd_burst_max_size=rd_burst_max_size_pre; 
  assign wr_burst_max_size=joint_mux ? rd_burst_max_size_pre:wr_burst_max_size_pre; 
  assign allow_joint_burst=joint&(~joint_flush)&(~page_cross)&(~joint_cross); 
  assign allow_full_burst=allow_joint_burst; 
  assign burst_max_size_update_pre=ch_update|ch_update_d|joint; 
  prgen_delay #(1)delay_max_size_update(.clk(clk),.reset(reset),.din(burst_max_size_update_pre),.dout(burst_max_size_update)); 
  dma_axi64_core0_ch_reg_size dma_axi64_core0_ch_reg_size_rd(.clk(clk),.reset(reset),.update(burst_max_size_update),.start_addr(rd_start_addr),.burst_max_size_reg(rd_burst_max_size_reg),.burst_max_size_other(wr_burst_max_size_rd),.allow_full_burst(allow_full_burst),.allow_full_fifo(allow_full_fifo),.joint_flush(joint_flush),.burst_max_size(rd_burst_max_size_pre)); 
  dma_axi64_core0_ch_reg_size dma_axi64_core0_ch_reg_size_wr(.clk(clk),.reset(reset),.update(burst_max_size_update),.start_addr(wr_start_addr),.burst_max_size_reg(wr_burst_max_size_reg),.burst_max_size_other(rd_burst_max_size_reg),.allow_full_burst(1'b0),.allow_full_fifo(allow_full_fifo),.joint_flush(joint_flush),.burst_max_size(wr_burst_max_size_pre)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            joint_reg <=1'b1;
            end_swap_reg <=2'b00;
          end 
        else 
          if (wr_static_line2)
             begin 
               joint_reg <=pwdata[16];
               end_swap_reg <=pwdata[29:28];
             end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          simple_mem <=1'b0;
        else 
          if (ch_update)
             simple_mem <=(rd_periph_num=='d0)&(wr_periph_num=='d0)&(~allow_line_cmd);
 
  assign joint=joint_mode&joint_reg&simple_mem&1'b1; 
  assign joint_mux=joint; 
  assign cmd_port_num=1'b0; 
  assign rd_port_num_cfg=1'b0; 
  assign wr_port_num=1'b0; 
  assign rd_port_num=1'b0; 
  assign frame_width={12{1'b0}}; 
  assign block=1'b0; 
  assign width_align=frame_width[3-1:0]; 
  assign rd_wait_limit={12-4{1'b0}}; 
  assign wr_wait_limit={12-4{1'b0}}; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            rd_periph_num_reg <='d0;
            rd_periph_delay_reg <='d0;
            wr_periph_num_reg <='d0;
            wr_periph_delay_reg <='d0;
          end 
        else 
          if (wr_static_line4)
             begin 
               rd_periph_num_reg <=pwdata[4:0];
               rd_periph_delay_reg <=pwdata[3+8-1:8];
               wr_periph_num_reg <=pwdata[20:16];
               wr_periph_delay_reg <=pwdata[3+24-1:24];
             end
  
  assign rd_periph_num=rd_periph_num_reg; 
  assign wr_periph_num=wr_periph_num_reg; 
  assign rd_periph_delay=rd_periph_delay_reg; 
  assign wr_periph_delay=wr_periph_delay_reg; 
  assign rd_periph_block=1'b0; 
  assign wr_periph_block=1'b0; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            ch_enable <=1'b1;
          end 
        else 
          if (wr_ch_enable)
             begin 
               ch_enable <=pwdata[0];
             end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          ch_in_prog <=1'b0;
        else 
          if (ch_update)
             ch_in_prog <=1'b1;
           else 
             if (ch_end&clken)
                ch_in_prog <=1'b0;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          rd_ch_in_prog <=1'b0;
        else 
          if (ch_update)
             rd_ch_in_prog <=1'b1;
           else 
             if (fifo_underflow|fifo_overflow)
                rd_ch_in_prog <=1'b0;
              else 
                if (rd_ch_end&clken)
                   rd_ch_in_prog <=1'b0;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          wr_ch_in_prog <=1'b0;
        else 
          if (ch_update)
             wr_ch_in_prog <=1'b1;
           else 
             if (fifo_underflow|fifo_overflow)
                wr_ch_in_prog <=1'b0;
              else 
                if (wr_ch_end&clken)
                   wr_ch_in_prog <=1'b0;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          load_in_prog_reg <=1'b0;
        else 
          if (load_req&clken)
             load_in_prog_reg <=1'b1;
           else 
             if (ch_update&clken)
                load_in_prog_reg <=1'b0;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          load_req_in_prog_reg <=1'b0;
        else 
          if (load_req&clken)
             load_req_in_prog_reg <=1'b1;
           else 
             if (load_cmd&clken)
                load_req_in_prog_reg <=1'b0;
 
  assign load_in_prog=load_in_prog_reg; 
  assign load_req_in_prog=load_req_in_prog_reg; 
  assign auto_retry=1'b0; 
  assign ch_retry_wait=1'b0; 
  assign ch_retry=1'b0; 
  assign ch_update_pre=wr_ch_start|load_wr_last|ch_retry; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          ch_update <=1'b0;
        else 
          if (ch_update_pre)
             ch_update <=1'b1;
           else 
             if (clken)
                ch_update <=1'b0;
 
  prgen_delay #(1)delay_ch_update(.clk(clk),.reset(reset),.din(ch_update),.dout(ch_update_d)); 
  assign load_req=(ch_enable&ch_end&(~cmd_last))|(ch_update&(x_size=='d0)); 
  assign load_addr={cmd_next_addr[32-1:2],2'b00}; 
  assign ch_end=rd_ch_end&wr_ch_end&wr_clr_last&(~ch_retry_wait); 
  assign ch_end_int=ch_enable&ch_end&cmd_set_int; 
  assign ch_rd_active=ch_enable&(rd_ch_in_prog|load_req_in_prog); 
  assign ch_wr_active=ch_enable&wr_ch_in_prog; 
  assign ch_end_set=|int_counter; 
  assign ch_end_clear=wr_int_clear&pwdata[0]; 
  assign {timeout_aw,timeout_w,timeout_b,timeout_ar,timeout_r}=timeout_bus[4:0]; 
  assign int_bus={13{clken}}&{wdt_timeout,timeout_aw,timeout_w,timeout_b,timeout_ar,timeout_r,fifo_underflow,fifo_overflow,wr_decerr,rd_decerr,wr_slverr,rd_slverr,ch_end_set}; 
  prgen_rawstat #(13)rawstat(.clk(clk),.reset(reset),.clear(wr_int_clear),.write(wr_int_rawstat),.pwdata(pwdata[13-1:0]),.int_bus(int_bus),.rawstat(int_rawstat)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          int_enable <={13{1'b1}};
        else 
          if (wr_int_enable)
             int_enable <=pwdata[13-1:0];
 
  assign int_status=int_rawstat&int_enable; 
  assign ch_int=|int_status; 
  assign int_proc_num=3'd0; 
  assign int_all_proc=ch_int; 
  assign end_swap=end_swap_reg; 
  assign rd_burst_max_size_rd=rd_burst_max_size_reg; 
  assign wr_burst_max_size_rd=wr_burst_max_size_reg; 
  always @(                                                          allow_full_burst or  allow_full_fifo or  allow_joint_burst or  allow_line_cmd or  auto_retry or  block or  buff_size or  ch_enable or  ch_rd_active or  ch_wr_active or  cmd_counter or  cmd_last or  cmd_next_addr or  cmd_port_num or  cmd_set_int or  end_swap or  frame_width or  int_counter or  int_enable or  int_proc_num or  int_rawstat or  int_status or  joint_reg or  rd_allow_full_fifo or  rd_burst_max_size_rd or  rd_gap or  rd_incr or  rd_outs or  rd_outs_max or  rd_outstanding or  rd_outstanding_cfg or  rd_periph_block_reg or  rd_periph_delay or  rd_periph_num or  rd_port_num_cfg or  rd_start_addr or  rd_tokens or  rd_wait_limit or  rd_x_offset or  rd_y_offset or  simple_mem or  wr_allow_full_fifo or  wr_burst_max_size_rd or  wr_fullness or  wr_incr or  wr_outs or  wr_outs_max or  wr_outstanding or  wr_outstanding_cfg or  wr_periph_block_reg or  wr_periph_delay or  wr_periph_num or  wr_port_num or  wr_start_addr or  wr_tokens or  wr_wait_limit or  wr_x_offset or  wr_y_offset)
       begin 
         rd_cmd_line0 ={32{1'b0}};
         rd_cmd_line1 ={32{1'b0}};
         rd_cmd_line2 ={32{1'b0}};
         rd_cmd_line3 ={32{1'b0}};
         rd_static_line0 ={32{1'b0}};
         rd_static_line1 ={32{1'b0}};
         rd_static_line2 ={32{1'b0}};
         rd_static_line3 ={32{1'b0}};
         rd_static_line4 ={32{1'b0}};
         rd_restrict ={32{1'b0}};
         rd_rd_offsets ={32{1'b0}};
         rd_wr_offsets ={32{1'b0}};
         rd_fifo_fullness ={32{1'b0}};
         rd_cmd_outs ={32{1'b0}};
         rd_ch_enable ={32{1'b0}};
         rd_ch_active ={32{1'b0}};
         rd_cmd_counter ={32{1'b0}};
         rd_int_rawstat ={32{1'b0}};
         rd_int_enable ={32{1'b0}};
         rd_int_status ={32{1'b0}};
         rd_cmd_line0 [32-1:0]=rd_start_addr;
         rd_cmd_line1 [32-1:0]=wr_start_addr;
         rd_cmd_line2 [10-1:0]=buff_size;
         rd_cmd_line3 [0]=cmd_set_int;
         rd_cmd_line3 [1]=cmd_last;
         rd_cmd_line3 [32-1:2]=cmd_next_addr;
         rd_static_line0 [8-1:0]=rd_burst_max_size_rd;
         rd_static_line0 [6+16-1:16]=rd_tokens;
         rd_static_line0 [4+24-1:24]=rd_outs_max;
         rd_static_line0 [30]=rd_outstanding_cfg;
         rd_static_line0 [31]=rd_incr;
         rd_static_line1 [8-1:0]=wr_burst_max_size_rd;
         rd_static_line1 [6+16-1:16]=wr_tokens;
         rd_static_line1 [4+24-1:24]=wr_outs_max;
         rd_static_line1 [30]=wr_outstanding_cfg;
         rd_static_line1 [31]=wr_incr;
         rd_static_line2 [12-1:0]=frame_width;
         rd_static_line2 [15]=block;
         rd_static_line2 [16]=joint_reg;
         rd_static_line2 [17]=auto_retry;
         rd_static_line2 [20]=cmd_port_num;
         rd_static_line2 [21]=rd_port_num_cfg;
         rd_static_line2 [22]=wr_port_num;
         rd_static_line2 [26:24]=int_proc_num;
         rd_static_line2 [29:28]=end_swap;
         rd_static_line4 [4:0]=rd_periph_num;
         rd_static_line4 [3+8-1:8]=rd_periph_delay;
         rd_static_line4 [20:16]=wr_periph_num;
         rd_static_line4 [3+24-1:24]=wr_periph_delay;
         rd_restrict [0]=rd_allow_full_fifo;
         rd_restrict [1]=wr_allow_full_fifo;
         rd_restrict [2]=allow_full_fifo;
         rd_restrict [3]=allow_full_burst;
         rd_restrict [4]=allow_joint_burst;
         rd_restrict [5]=rd_outstanding;
         rd_restrict [6]=wr_outstanding;
         rd_restrict [7]=allow_line_cmd;
         rd_restrict [8]=simple_mem;
         rd_rd_offsets [10-1:0]=rd_x_offset;
         rd_rd_offsets [10-8+16-1:16]=rd_y_offset;
         rd_wr_offsets [10-1:0]=wr_x_offset;
         rd_wr_offsets [10-8+16-1:16]=wr_y_offset;
         rd_fifo_fullness [5:0]=rd_gap;
         rd_fifo_fullness [5+16:16]=wr_fullness;
         rd_cmd_outs [4-1:0]=rd_outs;
         rd_cmd_outs [4-1+8:8]=wr_outs;
         rd_ch_enable [0]=ch_enable;
         rd_ch_active [0]=ch_rd_active;
         rd_ch_active [1]=ch_wr_active;
         rd_cmd_counter [12-1:0]=cmd_counter;
         rd_cmd_counter [4-1+16:16]=int_counter;
         rd_int_rawstat [13-1:0]=int_rawstat;
         rd_int_enable [13-1:0]=int_enable;
         rd_int_status [13-1:0]=int_status;
       end
  
  always @(                     gpaddr or  rd_ch_active or  rd_ch_enable or  rd_cmd_counter or  rd_cmd_line0 or  rd_cmd_line1 or  rd_cmd_line2 or  rd_cmd_line3 or  rd_cmd_outs or  rd_fifo_fullness or  rd_int_enable or  rd_int_rawstat or  rd_int_status or  rd_rd_offsets or  rd_restrict or  rd_static_line0 or  rd_static_line1 or  rd_static_line2 or  rd_static_line3 or  rd_static_line4 or  rd_wr_offsets)
       begin 
         prdata_pre ={32{1'b0}};
         case (gpaddr)
          CMD_LINE0 :
             prdata_pre =rd_cmd_line0;
          CMD_LINE1 :
             prdata_pre =rd_cmd_line1;
          CMD_LINE2 :
             prdata_pre =rd_cmd_line2;
          CMD_LINE3 :
             prdata_pre =rd_cmd_line3;
          STATIC_LINE0 :
             prdata_pre =rd_static_line0;
          STATIC_LINE1 :
             prdata_pre =rd_static_line1;
          STATIC_LINE2 :
             prdata_pre =rd_static_line2;
          STATIC_LINE3 :
             prdata_pre =rd_static_line3;
          STATIC_LINE4 :
             prdata_pre =rd_static_line4;
          RESTRICT :
             prdata_pre =rd_restrict;
          RD_OFFSETS :
             prdata_pre =rd_rd_offsets;
          WR_OFFSETS :
             prdata_pre =rd_wr_offsets;
          FIFO_FULLNESS :
             prdata_pre =rd_fifo_fullness;
          CMD_OUTS :
             prdata_pre =rd_cmd_outs;
          CH_ENABLE :
             prdata_pre =rd_ch_enable;
          CH_START :
             prdata_pre ={32{1'b0}};
          CH_ACTIVE :
             prdata_pre =rd_ch_active;
          CH_CMD_COUNTER :
             prdata_pre =rd_cmd_counter;
          INT_RAWSTAT :
             prdata_pre =rd_int_rawstat;
          INT_CLEAR :
             prdata_pre ={32{1'b0}};
          INT_ENABLE :
             prdata_pre =rd_int_enable;
          INT_STATUS :
             prdata_pre =rd_int_status;
          default :
             prdata_pre ={32{1'b0}};
         endcase 
       end
  
  always @(    gpaddr or  gpread or  gpwrite or  psel)
       begin 
         pslverr_pre =1'b0;
         case (gpaddr)
          CMD_LINE0 :
             pslverr_pre =1'b0;
          CMD_LINE1 :
             pslverr_pre =1'b0;
          CMD_LINE2 :
             pslverr_pre =1'b0;
          CMD_LINE3 :
             pslverr_pre =1'b0;
          STATIC_LINE0 :
             pslverr_pre =1'b0;
          STATIC_LINE1 :
             pslverr_pre =1'b0;
          STATIC_LINE2 :
             pslverr_pre =1'b0;
          STATIC_LINE3 :
             pslverr_pre =1'b0;
          STATIC_LINE4 :
             pslverr_pre =1'b0;
          RESTRICT :
             pslverr_pre =gpwrite;
          RD_OFFSETS :
             pslverr_pre =gpwrite;
          WR_OFFSETS :
             pslverr_pre =gpwrite;
          FIFO_FULLNESS :
             pslverr_pre =gpwrite;
          CMD_OUTS :
             pslverr_pre =gpwrite;
          CH_ENABLE :
             pslverr_pre =1'b0;
          CH_START :
             pslverr_pre =gpread;
          CH_ACTIVE :
             pslverr_pre =gpwrite;
          CH_CMD_COUNTER :
             pslverr_pre =gpwrite;
          INT_RAWSTAT :
             pslverr_pre =1'b0;
          INT_CLEAR :
             pslverr_pre =gpread;
          INT_ENABLE :
             pslverr_pre =1'b0;
          INT_STATUS :
             pslverr_pre =gpwrite;
          default :
             pslverr_pre =psel;
         endcase 
       end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          prdata <={32{1'b0}};
        else 
          if (gpread&pclken)
             prdata <=prdata_pre;
           else 
             if (pclken)
                prdata <={32{1'b0}};
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          pslverr <=1'b0;
        else 
          if ((gpread|gpwrite)&pclken)
             pslverr <=pslverr_pre;
           else 
             if (pclken)
                pslverr <=1'b0;
 
endmodule
 
module dma_axi64_apb_mux (
  input clk,
  input reset,
  input pclken,
  input psel,
  input penable,
  input pwrite,
  input [12:11] paddr,
  output [31:0] prdata,
  output pslverr,
  output reg  pready,
  output psel0,
  input [31:0] prdata0,
  input pslverr0,
  output psel1,
  input [31:0] prdata1,
  input pslverr1,
  output psel_reg,
  input [31:0] prdata_reg,
  input pslverr_reg) ; 
   wire [31:0] prdata_pre ;  
   wire pslverr_pre ;  
  assign psel0=pclken&psel&(paddr[12:11]==2'b00); 
  assign psel1=pclken&psel&(paddr[12:11]==2'b01); 
  assign psel_reg=pclken&psel&(paddr[12]==1'b1); 
  assign prdata_pre=prdata0|prdata1|prdata_reg; 
  assign pslverr_pre=pslverr0|pslverr1|pslverr_reg; 
  assign prdata=prdata_pre; 
  assign pslverr=pslverr_pre; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          pready <=1'b0;
        else 
          if (pclken)
             pready <=psel&(~penable);
 
endmodule
 
module dma_axi64_core0_arbiter #(
 parameter CH_LAST =1-1) (
  input clk,
  input reset,
  input enable,
  input joint_mode,
  input page_cross,
  input joint_req,
  input prio_top,
  input prio_high,
  input [2:0] prio_top_num,
  input [2:0] prio_high_num,
  input hold,
  input [7:0] ch_ready,
  input [7:0] ch_active,
  input finish,
  output ch_go_out,
  output [2:0] ch_num,
  output ch_last) ; 
    
   reg [7:0] current_active ;  
   wire current_ready_only ;  
   wire ch_last_pre ;  
   //wire ch_last ;  
   wire ready ;  
   wire next_ready ;  
   wire next_ready0 ;  
   wire next_ready1 ;  
   wire prio_top_ready ;  
   wire prio_high_ready ;  
   reg in_prog ;  
   wire ch_go_pre ;  
   wire ch_go_pre_d ;  
   wire ch_go_top_pre ;  
   wire ch_go_high_pre ;  
   wire ch_go ;  
   wire ch_go_d ;  
   wire ch_go_top ;  
   wire ch_go_high ;  
   wire ch_go_next ;  
   wire hold_d ;  
   wire advance_next ;  
   wire [2:0] ch_num_pre ;  
   wire [3:0] next_ch_num0_pre ;  
   wire [3:0] next_ch_num0_pre2 ;  
   wire [2:0] next_ch_num0 ;  
   wire [3:0] next_ch_num1_pre ;  
   wire [3:0] next_ch_num1_pre2 ;  
   wire [2:0] next_ch_num1 ;  
   wire [2:0] next_ch_num_pre ;  
  assign ch_go_out='d1; 
  assign ch_num='d0; 
  assign ch_last='d1; 
endmodule
 
module dma_axi64_core0_axim_resp #(
 parameter CMD_DEPTH =8,
 parameter RESP_SLVERR =2'b10,
 parameter RESP_DECERR =2'b11) (
  input clk,
  input reset,
  output slverr,
  output decerr,
  output clr,
  output clr_last,
  output reg  [2:0] ch_num_resp,
  output resp_full,
  input [7-1:0] AID,
  input AVALID,
  input AREADY,
  input [1:0] RESP,
  output [7-1:0] ID,
  input VALID,
  input READY,
  input LAST) ; 
    
    
    
   wire clr_pre ;  
   wire [2:0] ch_num_resp_pre ;  
   wire clr_last_pre ;  
   wire slverr_pre ;  
   wire decerr_pre ;  
   wire resp_push ;  
   wire resp_pop ;  
   wire resp_empty ;  
   //wire resp_full ;  
   //wire [7-1:0] ID ;  
  assign resp_push=AVALID&AREADY; 
  assign resp_pop=VALID&READY&LAST; 
  assign clr_pre=resp_pop; 
  assign ch_num_resp_pre=ID[2:0]; 
  assign slverr_pre=clr_pre&RESP==RESP_SLVERR; 
  assign decerr_pre=clr_pre&RESP==RESP_DECERR; 
  assign clr_last_pre=clr_pre&ID[3]; 
  prgen_delay #(1)delay_clr(.clk(clk),.reset(reset),.din(clr_pre),.dout(clr)); 
  prgen_delay #(1)delay_clr_last(.clk(clk),.reset(reset),.din(clr_last_pre),.dout(clr_last)); 
  prgen_delay #(1)delay_slverr(.clk(clk),.reset(reset),.din(slverr_pre),.dout(slverr)); 
  prgen_delay #(1)delay_decerr(.clk(clk),.reset(reset),.din(decerr_pre),.dout(decerr)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          ch_num_resp <=3'b000;
        else 
          if (clr_pre)
             ch_num_resp <=ch_num_resp_pre;
 
  prgen_fifo #(7,CMD_DEPTH)resp_fifo(.clk(clk),.reset(reset),.push(resp_push),.pop(resp_pop),.din(AID),.dout(ID),.empty(resp_empty),.full(resp_full)); 
endmodule
 
module dma_axi64 (
  input clk,
  input reset,
  input scan_en,
  output idle,
  output [1-1:0] INT,
  input [31:1] periph_tx_req,
  output [31:1] periph_tx_clr,
  input [31:1] periph_rx_req,
  output [31:1] periph_rx_clr,
  input pclken,
  input psel,
  input penable,
  input [12:0] paddr,
  input pwrite,
  input [31:0] pwdata,
  output [31:0] prdata,
  output pslverr,
  output pready,
  output [1-1:0] AWID0,
  output [32-1:0] AWADDR0,
  output [4-1:0] AWLEN0,
  output [2-1:0] AWSIZE0,
  output AWVALID0,
  input AWREADY0,
  output [1-1:0] WID0,
  output [64-1:0] WDATA0,
  output [64/8-1:0] WSTRB0,
  output WLAST0,
  output WVALID0,
  input WREADY0,
  input [1-1:0] BID0,
  input [1:0] BRESP0,
  input BVALID0,
  output BREADY0,
  output [1-1:0] ARID0,
  output [32-1:0] ARADDR0,
  output [4-1:0] ARLEN0,
  output [2-1:0] ARSIZE0,
  output ARVALID0,
  input ARREADY0,
  input [1-1:0] RID0,
  input [64-1:0] RDATA0,
  input [1:0] RRESP0,
  input RLAST0,
  input RVALID0,
  output RREADY0) ; 
   wire rd_port_num0 ;  
   wire wr_port_num0 ;  
   wire rd_port_num1 ;  
   wire wr_port_num1 ;  
   wire slv_rd_port_num0 ;  
   wire slv_wr_port_num0 ;  
   wire slv_rd_port_num1 ;  
   wire slv_wr_port_num1 ;  
   wire [1-1:0] M0_AWID ;  
   wire [32-1:0] M0_AWADDR ;  
   wire [4-1:0] M0_AWLEN ;  
   wire [2-1:0] M0_AWSIZE ;  
   wire M0_AWVALID ;  
   wire M0_AWREADY ;  
   wire [1-1:0] M0_WID ;  
   wire [64-1:0] M0_WDATA ;  
   wire [64/8-1:0] M0_WSTRB ;  
   wire M0_WLAST ;  
   wire M0_WVALID ;  
   wire M0_WREADY ;  
   wire [1-1:0] M0_BID ;  
   wire [1:0] M0_BRESP ;  
   wire M0_BVALID ;  
   wire M0_BREADY ;  
   wire [1-1:0] M0_ARID ;  
   wire [32-1:0] M0_ARADDR ;  
   wire [4-1:0] M0_ARLEN ;  
   wire [2-1:0] M0_ARSIZE ;  
   wire M0_ARVALID ;  
   wire M0_ARREADY ;  
   wire [1-1:0] M0_RID ;  
   wire [64-1:0] M0_RDATA ;  
   wire [1:0] M0_RRESP ;  
   wire M0_RLAST ;  
   wire M0_RVALID ;  
   wire M0_RREADY ;  
   //wire [31:1] periph_tx_req ;  
   //wire [31:1] periph_rx_req ;  
   //wire [31:1] periph_tx_clr ;  
   //wire [31:1] periph_rx_clr ;  
  assign M0_AWID=1'b0; 
  assign M0_WID=1'b0; 
  assign M0_ARID=1'b0; 
  assign AWID0=M0_AWID; 
  assign AWADDR0=M0_AWADDR; 
  assign AWLEN0=M0_AWLEN; 
  assign AWSIZE0=M0_AWSIZE; 
  assign AWVALID0=M0_AWVALID; 
  assign WID0=M0_WID; 
  assign WDATA0=M0_WDATA; 
  assign WSTRB0=M0_WSTRB; 
  assign WLAST0=M0_WLAST; 
  assign WVALID0=M0_WVALID; 
  assign BREADY0=M0_BREADY; 
  assign ARID0=M0_ARID; 
  assign ARADDR0=M0_ARADDR; 
  assign ARLEN0=M0_ARLEN; 
  assign ARSIZE0=M0_ARSIZE; 
  assign ARVALID0=M0_ARVALID; 
  assign RREADY0=M0_RREADY; 
  assign M0_AWREADY=AWREADY0; 
  assign M0_WREADY=WREADY0; 
  assign M0_BID=BID0; 
  assign M0_BRESP=BRESP0; 
  assign M0_BVALID=BVALID0; 
  assign M0_ARREADY=ARREADY0; 
  assign M0_RID=RID0; 
  assign M0_RDATA=RDATA0; 
  assign M0_RRESP=RRESP0; 
  assign M0_RLAST=RLAST0; 
  assign M0_RVALID=RVALID0; 
  dma_axi64_dual_core dma_axi64_dual_core(.clk(clk),.reset(reset),.scan_en(scan_en),.idle(idle),.INT(INT),.periph_tx_req(periph_tx_req),.periph_tx_clr(periph_tx_clr),.periph_rx_req(periph_rx_req),.periph_rx_clr(periph_rx_clr),.pclken(pclken),.psel(psel),.penable(penable),.paddr(paddr),.pwrite(pwrite),.pwdata(pwdata),.prdata(prdata),.pslverr(pslverr),.pready(pready),.rd_port_num0(rd_port_num0),.wr_port_num0(wr_port_num0),.rd_port_num1(rd_port_num1),.wr_port_num1(wr_port_num1),.M0_AWID(M0_AWID),.M0_AWADDR(M0_AWADDR),.M0_AWLEN(M0_AWLEN),.M0_AWSIZE(M0_AWSIZE),.M0_AWVALID(M0_AWVALID),.M0_AWREADY(M0_AWREADY),.M0_WID(M0_WID),.M0_WDATA(M0_WDATA),.M0_WSTRB(M0_WSTRB),.M0_WLAST(M0_WLAST),.M0_WVALID(M0_WVALID),.M0_WREADY(M0_WREADY),.M0_BID(M0_BID),.M0_BRESP(M0_BRESP),.M0_BVALID(M0_BVALID),.M0_BREADY(M0_BREADY),.M0_ARID(M0_ARID),.M0_ARADDR(M0_ARADDR),.M0_ARLEN(M0_ARLEN),.M0_ARSIZE(M0_ARSIZE),.M0_ARVALID(M0_ARVALID),.M0_ARREADY(M0_ARREADY),.M0_RID(M0_RID),.M0_RDATA(M0_RDATA),.M0_RRESP(M0_RRESP),.M0_RLAST(M0_RLAST),.M0_RVALID(M0_RVALID),.M0_RREADY(M0_RREADY)); 
endmodule
 
module dma_axi64_core0_ch_calc_addr (
  input clk,
  input reset,
  input ch_update_d,
  input load_in_prog,
  input [32-1:0] load_addr,
  input go_next_line,
  input burst_start,
  input incr,
  input [32-1:0] start_addr,
  input [12-1:0] frame_width,
  input [8-1:0] x_size,
  input [8-1:0] burst_size,
  output reg  [32-1:0] burst_addr) ; 
   wire go_next_line_d ;  
   reg [12-1:0] frame_width_diff_reg ;  
   wire [12-1:0] frame_width_diff ;  
  assign frame_width_diff={12{1'b0}}; 
  assign go_next_line_d=1'b0; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          burst_addr <={32{1'b0}};
        else 
          if (load_in_prog)
             burst_addr <=load_addr;
           else 
             if (ch_update_d)
                burst_addr <=start_addr;
              else 
                if (burst_start&incr)
                   burst_addr <=burst_addr+burst_size;
                 else 
                   if (go_next_line_d&incr)
                      burst_addr <=burst_addr+frame_width_diff;
 
endmodule
 
module prgen_joint_stall #(
 parameter SIZE_BITS =1) (
  input clk,
  input reset,
  input joint_req_out,
  input rd_transfer,
  input [SIZE_BITS-1:0] rd_transfer_size,
  input ch_fifo_rd,
  input [2:0] data_fullness_pre,
  input HOLD,
  output joint_fifo_rd_valid,
  output [SIZE_BITS-1:0] rd_transfer_size_joint,
  output rd_transfer_full,
  output joint_stall) ; 
    
   wire rd_transfer_joint ;  
   wire joint_fifo_rd ;  
   //wire joint_fifo_rd_valid ;  
   wire [2:0] count_ch_fifo_pre ;  
   reg [2:0] count_ch_fifo ;  
   wire joint_stall_pre ;  
   reg joint_stall_reg ;  
   wire joint_not_ready_pre ;  
   wire joint_not_ready ;  
   //wire [SIZE_BITS-1:0] rd_transfer_size_joint ;  
   //wire rd_transfer_full ;  
   reg [2:0] joint_rd_stall_num ;  
   wire joint_rd_stall ;  
  assign rd_transfer_joint=joint_req_out&rd_transfer; 
  prgen_delay #(2)delay_joint_fifo_rd(.clk(clk),.reset(reset),.din(rd_transfer_joint),.dout(joint_fifo_rd)); 
  assign count_ch_fifo_pre=count_ch_fifo+rd_transfer_joint-ch_fifo_rd; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          count_ch_fifo <=3'd0;
        else 
          if (joint_req_out&(rd_transfer_joint|ch_fifo_rd))
             count_ch_fifo <=count_ch_fifo_pre;
 
  assign joint_stall_pre=joint_req_out&((count_ch_fifo_pre>'d2)|((count_ch_fifo_pre=='d2)&(data_fullness_pre>'d1))|HOLD); 
  assign joint_not_ready_pre=joint_req_out&(data_fullness_pre>'d1)&(~(rd_transfer_joint&joint_stall_pre)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          joint_stall_reg <=1'b0;
        else 
          if (joint_stall_pre)
             joint_stall_reg <=1'b1;
           else 
             if (count_ch_fifo_pre=='d0)
                joint_stall_reg <=1'b0;
 
  assign joint_stall=joint_stall_reg|(joint_req_out&HOLD); 
  prgen_delay #(1)delay_joint_not_ready(.clk(clk),.reset(reset),.din(joint_not_ready_pre),.dout(joint_not_ready)); 
  prgen_fifo #(SIZE_BITS,2)rd_transfer_fifo(.clk(clk),.reset(reset),.push(rd_transfer_joint),.pop(joint_fifo_rd_valid),.din(rd_transfer_size),.dout(rd_transfer_size_joint),.empty(),.full(rd_transfer_full)); 
  prgen_stall #(3)stall_joint_fifo_rd(.clk(clk),.reset(reset),.din(joint_fifo_rd),.stall(joint_not_ready),.dout(joint_fifo_rd_valid)); 
endmodule
 
module prgen_rawstat #(
 parameter SIZE =32) (
  input clk,
  input reset,
  input clear,
  input write,
  input [SIZE-1:0] pwdata,
  input [SIZE-1:0] int_bus,
  output reg  [SIZE-1:0] rawstat) ; 
    
   wire [SIZE-1:0] write_bus ;  
   wire [SIZE-1:0] clear_bus ;  
  assign write_bus={SIZE{write}}&pwdata; 
  assign clear_bus={SIZE{clear}}&pwdata; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          rawstat <={SIZE{1'b0}};
        else 
          rawstat <=(rawstat|int_bus|write_bus)&(~clear_bus);
 
endmodule
 
module dma_axi64_core0_channels_mux (
  input [7:0] ch_fifo_rd_valid,
  output fifo_rd_valid,
  input [8*64-1:0] ch_fifo_rdata,
  output [64-1:0] fifo_rdata,
  input [8*31-1:0] ch_periph_rx_clr,
  output [30:0] periph_rx_clr,
  input [8*31-1:0] ch_periph_tx_clr,
  output [30:0] periph_tx_clr,
  output [7:0] ch_rd_page_cross,
  output [7:0] ch_wr_page_cross,
  input rd_page_cross,
  input wr_page_cross,
  input timeout_aw,
  input timeout_w,
  input timeout_ar,
  input [2:0] timeout_num_aw,
  input [2:0] timeout_num_w,
  input [2:0] timeout_num_ar,
  input wdt_timeout,
  input [2:0] wdt_ch_num,
  output [7:0] ch_timeout_aw,
  output [7:0] ch_timeout_w,
  output [7:0] ch_timeout_ar,
  output [7:0] ch_wdt_timeout,
  output joint_in_prog,
  output joint_not_in_prog,
  output joint_mux_in_prog,
  input [7:0] ch_joint_in_prog,
  input [7:0] ch_joint_not_in_prog,
  input [7:0] ch_joint_mux_in_prog,
  input wr_cmd_pending,
  output [7:0] ch_wr_cmd_pending,
  input [2:0] rd_ch_num,
  input [2:0] rd_cmd_num,
  output load_req_in_prog,
  output rd_line_cmd,
  output rd_go_next_line,
  input rd_burst_start,
  output [32-1:0] rd_burst_addr,
  output [8-1:0] rd_burst_size,
  output [6-1:0] rd_tokens,
  output rd_cmd_port,
  output [3-1:0] rd_periph_delay,
  output rd_clr_valid,
  input rd_cmd_split,
  input rd_cmd_line,
  output rd_clr_stall,
  input [7:0] ch_load_req_in_prog,
  input [7:0] ch_rd_line_cmd,
  input [7:0] ch_rd_go_next_line,
  output [7:0] ch_rd_burst_start,
  input [8*32-1:0] ch_rd_burst_addr,
  input [8*8-1:0] ch_rd_burst_size,
  input [8*6-1:0] ch_rd_tokens,
  input [7:0] ch_rd_port_num,
  input [8*3-1:0] ch_rd_periph_delay,
  input [7:0] ch_rd_clr_valid,
  output [7:0] ch_rd_cmd_split,
  output [7:0] ch_rd_cmd_line,
  input [7:0] ch_rd_clr_stall,
  input [2:0] load_wr_num,
  input load_wr,
  output [7:0] ch_load_wr,
  input [2:0] ch_fifo_wr_num,
  input [2:0] rd_transfer_num,
  input [2:0] rd_clr_line_num,
  input rd_transfer,
  input rd_clr_line,
  input fifo_wr,
  output [7:0] ch_rd_transfer,
  output [7:0] ch_rd_clr_line,
  output [7:0] ch_fifo_wr,
  input [2:0] rd_ch_num_resp,
  input rd_slverr,
  input rd_decerr,
  input rd_clr,
  input rd_clr_load,
  output [7:0] ch_rd_slverr,
  output [7:0] ch_rd_decerr,
  output [7:0] ch_rd_clr,
  output [7:0] ch_rd_clr_load,
  input [2:0] wr_ch_num,
  input [2:0] wr_cmd_num,
  output wr_last_cmd,
  output wr_line_cmd,
  output wr_go_next_line,
  input wr_burst_start,
  output [32-1:0] wr_burst_addr,
  output [8-1:0] wr_burst_size,
  output [6-1:0] wr_tokens,
  output wr_cmd_port,
  output [3-1:0] wr_periph_delay,
  output wr_clr_valid,
  input wr_cmd_split,
  output wr_clr_stall,
  input [7:0] ch_wr_last_cmd,
  input [7:0] ch_wr_line_cmd,
  input [7:0] ch_wr_go_next_line,
  output [7:0] ch_wr_burst_start,
  input [8*32-1:0] ch_wr_burst_addr,
  input [8*8-1:0] ch_wr_burst_size,
  input [8*6-1:0] ch_wr_tokens,
  input [7:0] ch_wr_port_num,
  input [8*3-1:0] ch_wr_periph_delay,
  input [7:0] ch_wr_clr_valid,
  output [7:0] ch_wr_cmd_split,
  input [7:0] ch_wr_clr_stall,
  input [2:0] ch_fifo_rd_num,
  input [2:0] wr_transfer_num,
  input [2:0] wr_clr_line_num,
  input wr_transfer,
  input wr_clr_line,
  input fifo_rd,
  input [7:0] ch_fifo_wr_ready,
  output [7:0] ch_wr_transfer,
  output [7:0] ch_wr_clr_line,
  output [7:0] ch_fifo_rd,
  output fifo_wr_ready,
  input [2:0] wr_ch_num_resp,
  input wr_slverr,
  input wr_decerr,
  input wr_clr,
  input wr_clr_last,
  output [7:0] ch_wr_slverr,
  output [7:0] ch_wr_decerr,
  output [7:0] ch_wr_clr_last,
  output [7:0] ch_wr_clr) ; 
  prgen_or8 #(1)mux_2(.ch_x(ch_fifo_rd_valid),.x(fifo_rd_valid)); 
  prgen_or8 #(64)mux_3(.ch_x(ch_fifo_rdata),.x(fifo_rdata)); 
  prgen_or8 #(31)mux_4(.ch_x(ch_periph_rx_clr),.x(periph_rx_clr)); 
  prgen_or8 #(31)mux_5(.ch_x(ch_periph_tx_clr),.x(periph_tx_clr)); 
  prgen_mux8 #(3)mux_30(.sel(rd_ch_num),.ch_x(ch_rd_periph_delay),.x(rd_periph_delay)); 
  prgen_mux8 #(3)mux_51(.sel(wr_ch_num),.ch_x(ch_wr_periph_delay),.x(wr_periph_delay)); 
  prgen_demux8 #(1)mux_6(.sel(timeout_num_aw),.x(timeout_aw),.ch_x(ch_timeout_aw)); 
  prgen_demux8 #(1)mux_7(.sel(timeout_num_w),.x(timeout_w),.ch_x(ch_timeout_w)); 
  prgen_demux8 #(1)mux_8(.sel(timeout_num_ar),.x(timeout_ar),.ch_x(ch_timeout_ar)); 
  prgen_demux8 #(1)mux_9(.sel(wdt_ch_num),.x(wdt_timeout),.ch_x(ch_wdt_timeout)); 
  prgen_or8 #(1)mux_55(.ch_x(ch_joint_in_prog),.x(joint_in_prog)); 
  prgen_or8 #(1)mux_56(.ch_x(ch_joint_not_in_prog),.x(joint_not_in_prog)); 
  prgen_or8 #(1)mux_57(.ch_x(ch_joint_mux_in_prog),.x(joint_mux_in_prog)); 
  prgen_demux8 #(1)mux_60(.sel(wr_ch_num),.x(wr_cmd_pending),.ch_x(ch_wr_cmd_pending)); 
  prgen_demux8 #(1)mux_11(.sel(rd_ch_num),.x(rd_burst_start),.ch_x(ch_rd_burst_start)); 
  prgen_demux8 #(1)mux_13(.sel(load_wr_num),.x(load_wr),.ch_x(ch_load_wr)); 
  assign ch_rd_clr_line='d0; 
  assign ch_rd_cmd_line='d0; 
  assign rd_line_cmd='d0; 
  assign rd_go_next_line='d0; 
  assign rd_clr_stall='d0; 
  assign wr_clr_stall='d0; 
  assign ch_wr_clr_line='d0; 
  assign wr_line_cmd='d0; 
  assign wr_go_next_line='d0; 
  prgen_mux8 #(1)mux_33(.sel(rd_ch_num),.ch_x(ch_rd_clr_valid),.x(rd_clr_valid)); 
  prgen_mux8 #(1)mux_53(.sel(wr_ch_num),.ch_x(ch_wr_clr_valid),.x(wr_clr_valid)); 
  prgen_demux8 #(1)mux_15(.sel(rd_transfer_num),.x(rd_transfer),.ch_x(ch_rd_transfer)); 
  prgen_demux8 #(1)mux_16(.sel(rd_ch_num_resp),.x(rd_slverr),.ch_x(ch_rd_slverr)); 
  prgen_demux8 #(1)mux_17(.sel(rd_ch_num_resp),.x(rd_decerr),.ch_x(ch_rd_decerr)); 
  prgen_demux8 #(1)mux_39(.sel(wr_ch_num_resp),.x(wr_decerr),.ch_x(ch_wr_decerr)); 
  prgen_demux8 #(1)mux_20(.sel(rd_cmd_num),.x(rd_cmd_split),.ch_x(ch_rd_cmd_split)); 
  prgen_demux8 #(1)mux_42(.sel(wr_cmd_num),.x(wr_cmd_split),.ch_x(ch_wr_cmd_split)); 
  prgen_demux8 #(1)mux_58(.sel(rd_ch_num),.x(rd_page_cross),.ch_x(ch_rd_page_cross)); 
  prgen_demux8 #(1)mux_59(.sel(wr_ch_num),.x(wr_page_cross),.ch_x(ch_wr_page_cross)); 
  prgen_demux8 #(1)mux_18(.sel(rd_ch_num_resp),.x(rd_clr),.ch_x(ch_rd_clr)); 
  prgen_demux8 #(1)mux_19(.sel(rd_ch_num_resp),.x(rd_clr_load),.ch_x(ch_rd_clr_load)); 
  prgen_demux8 #(1)mux_21(.sel(ch_fifo_rd_num),.x(fifo_rd),.ch_x(ch_fifo_rd)); 
  prgen_mux8 #(1)mux_23(.sel(rd_ch_num),.ch_x(ch_load_req_in_prog),.x(load_req_in_prog)); 
  prgen_mux8 #(32)mux_26(.sel(rd_ch_num),.ch_x(ch_rd_burst_addr),.x(rd_burst_addr)); 
  prgen_mux8 #(8)mux_27(.sel(rd_ch_num),.ch_x(ch_rd_burst_size),.x(rd_burst_size)); 
  prgen_mux8 #(6)mux_28(.sel(rd_ch_num),.ch_x(ch_rd_tokens),.x(rd_tokens)); 
  prgen_mux8 #(6)mux_49(.sel(wr_ch_num),.ch_x(ch_wr_tokens),.x(wr_tokens)); 
  assign rd_cmd_port='d0; 
  assign wr_cmd_port='d0; 
  prgen_mux8 #(1)mux_31(.sel(ch_fifo_rd_num),.ch_x(ch_fifo_wr_ready),.x(fifo_wr_ready)); 
  prgen_demux8 #(1)mux_34(.sel(wr_ch_num),.x(wr_burst_start),.ch_x(ch_wr_burst_start)); 
  prgen_demux8 #(1)mux_37(.sel(wr_transfer_num),.x(wr_transfer),.ch_x(ch_wr_transfer)); 
  prgen_demux8 #(1)mux_38(.sel(wr_ch_num_resp),.x(wr_slverr),.ch_x(ch_wr_slverr)); 
  prgen_demux8 #(1)mux_40(.sel(wr_ch_num_resp),.x(wr_clr),.ch_x(ch_wr_clr)); 
  prgen_demux8 #(1)mux_41(.sel(wr_ch_num_resp),.x(wr_clr_last),.ch_x(ch_wr_clr_last)); 
  prgen_demux8 #(1)mux_43(.sel(ch_fifo_wr_num),.x(fifo_wr),.ch_x(ch_fifo_wr)); 
  prgen_mux8 #(1)mux_44(.sel(wr_ch_num),.ch_x(ch_wr_last_cmd),.x(wr_last_cmd)); 
  prgen_mux8 #(32)mux_47(.sel(wr_ch_num),.ch_x(ch_wr_burst_addr),.x(wr_burst_addr)); 
  prgen_mux8 #(8)mux_48(.sel(wr_ch_num),.ch_x(ch_wr_burst_size),.x(wr_burst_size)); 
endmodule
 
module dma_axi64_core0 (
  input clk,
  input reset,
  input scan_en,
  output idle,
  output [8*1-1:0] ch_int_all_proc,
  input [7:0] ch_start,
  input [31:1] periph_tx_req,
  output [31:1] periph_tx_clr,
  input [31:1] periph_rx_req,
  output [31:1] periph_rx_clr,
  input pclk,
  input clken,
  input pclken,
  input psel,
  input penable,
  input [10:0] paddr,
  input pwrite,
  input [31:0] pwdata,
  output [31:0] prdata,
  output pslverr,
  output rd_port_num,
  output wr_port_num,
  input joint_mode_in,
  input joint_remote,
  input rd_prio_top,
  input rd_prio_high,
  input [2:0] rd_prio_top_num,
  input [2:0] rd_prio_high_num,
  input wr_prio_top,
  input wr_prio_high,
  input [2:0] wr_prio_top_num,
  input [2:0] wr_prio_high_num,
  output [31:0] AWADDR,
  output [4-1:0] AWLEN,
  output [2-1:0] AWSIZE,
  output AWVALID,
  input AWREADY,
  output [63:0] WDATA,
  output [64/8-1:0] WSTRB,
  output WLAST,
  output WVALID,
  input WREADY,
  input [1:0] BRESP,
  input BVALID,
  output BREADY,
  output [31:0] ARADDR,
  output [4-1:0] ARLEN,
  output [2-1:0] ARSIZE,
  output ARVALID,
  input ARREADY,
  input [63:0] RDATA,
  input [1:0] RRESP,
  input RLAST,
  input RVALID,
  output RREADY) ; 
   wire wdt_timeout ;  
   wire [2:0] wdt_ch_num ;  
   wire rd_ch_go_joint ;  
   wire rd_ch_go_null ;  
   wire rd_ch_go ;  
   wire [2:0] rd_ch_num ;  
   wire rd_ch_last ;  
   wire wr_ch_go_joint ;  
   wire wr_ch_go ;  
   wire [2:0] wr_ch_num_joint ;  
   wire [2:0] wr_ch_num ;  
   wire wr_ch_last ;  
   wire wr_ch_last_joint ;  
   //wire [31:0] prdata ;  
   //wire pslverr ;  
   wire load_req_in_prog ;  
   wire [7:0] ch_idle ;  
   wire [7:0] ch_active ;  
   wire [7:0] ch_active_joint ;  
   wire [7:0] ch_rd_active ;  
   wire [7:0] ch_wr_active ;  
   wire wr_last_cmd ;  
   wire rd_line_cmd ;  
   wire wr_line_cmd ;  
   wire rd_go_next_line ;  
   wire wr_go_next_line ;  
   wire [7:0] ch_rd_ready_joint ;  
   wire [7:0] ch_rd_ready ;  
   wire rd_ready ;  
   wire rd_ready_joint ;  
   wire [32-1:0] rd_burst_addr ;  
   wire [8-1:0] rd_burst_size ;  
   wire [6-1:0] rd_tokens ;  
   //wire rd_port_num ;  
   wire [3-1:0] rd_periph_delay ;  
   wire rd_clr_valid ;  
   wire [2:0] rd_transfer_num ;  
   wire rd_transfer ;  
   wire [4-1:0] rd_transfer_size ;  
   wire rd_clr_stall ;  
   wire [7:0] ch_wr_ready ;  
   wire wr_ready ;  
   wire wr_ready_joint ;  
   wire [32-1:0] wr_burst_addr ;  
   wire [8-1:0] wr_burst_size ;  
   wire [6-1:0] wr_tokens ;  
   //wire wr_port_num ;  
   wire [3-1:0] wr_periph_delay ;  
   wire wr_clr_valid ;  
   wire wr_clr_stall ;  
   wire [7:0] ch_joint_req ;  
   wire joint_req ;  
   wire joint_mode ;  
   wire joint_ch_go ;  
   wire joint_stall ;  
   wire rd_burst_start ;  
   wire rd_finish_joint ;  
   wire rd_finish ;  
   wire rd_ctrl_busy ;  
   wire wr_burst_start_joint ;  
   wire wr_burst_start ;  
   wire wr_finish ;  
   wire wr_ctrl_busy ;  
   wire wr_cmd_split ;  
   wire [2:0] wr_cmd_num ;  
   wire wr_cmd_pending_joint ;  
   wire wr_cmd_pending ;  
   wire wr_cmd_full_joint ;  
   wire ch_fifo_rd ;  
   wire [4-1:0] ch_fifo_rsize ;  
   wire [2:0] ch_fifo_rd_num ;  
   wire [2:0] wr_transfer_num ;  
   wire wr_transfer ;  
   wire [4-1:0] wr_transfer_size ;  
   wire [4-1:0] wr_next_size ;  
   wire wr_clr_line ;  
   wire [2:0] wr_clr_line_num ;  
   wire wr_cmd_full ;  
   wire wr_slverr ;  
   wire wr_decerr ;  
   wire wr_clr ;  
   wire wr_clr_last ;  
   wire [2:0] wr_ch_num_resp ;  
   wire timeout_aw ;  
   wire timeout_w ;  
   wire [2:0] timeout_num_aw ;  
   wire [2:0] timeout_num_w ;  
   wire wr_hold_ctrl ;  
   wire wr_hold ;  
   wire joint_in_prog ;  
   wire joint_not_in_prog ;  
   wire joint_mux_in_prog ;  
   wire wr_page_cross ;  
   wire load_wr ;  
   wire [2:0] load_wr_num ;  
   wire [1:0] load_wr_cycle ;  
   wire [64-1:0] load_wdata ;  
   wire rd_cmd_split ;  
   wire rd_cmd_line ;  
   wire [2:0] rd_cmd_num ;  
   wire rd_cmd_pending_joint ;  
   wire rd_cmd_pending ;  
   wire rd_cmd_full_joint ;  
   wire ch_fifo_wr ;  
   wire [64-1:0] ch_fifo_wdata ;  
   wire [4-1:0] ch_fifo_wsize ;  
   wire [2:0] ch_fifo_wr_num ;  
   wire rd_clr_line ;  
   wire [2:0] rd_clr_line_num ;  
   wire rd_burst_cmd ;  
   wire rd_cmd_full ;  
   wire rd_slverr ;  
   wire rd_decerr ;  
   wire rd_clr ;  
   wire rd_clr_last ;  
   wire rd_clr_load ;  
   wire [2:0] rd_ch_num_resp ;  
   wire timeout_ar ;  
   wire [2:0] timeout_num_ar ;  
   wire rd_hold_joint ;  
   wire rd_hold_ctrl ;  
   wire rd_hold ;  
   wire joint_hold ;  
   wire rd_page_cross ;  
   wire joint_page_cross ;  
   wire rd_arbiter_en ;  
   wire wr_arbiter_en ;  
   wire rd_cmd_port ;  
   wire wr_cmd_port ;  
   wire [64-1:0] ch_fifo_rdata ;  
   wire ch_fifo_rd_valid ;  
   wire ch_fifo_wr_ready ;  
   wire FIFO_WR ;  
   wire FIFO_RD ;  
   wire [3+5-3-1:0] FIFO_WR_ADDR ;  
   wire [3+5-3-1:0] FIFO_RD_ADDR ;  
   wire [64-1:0] FIFO_DIN ;  
   wire [8-1:0] FIFO_BSEL ;  
   wire [64-1:0] FIFO_DOUT ;  
   wire clk_en ;  
   wire gclk ;  
  assign joint_mode=joint_mode_in&1'b1; 
  assign rd_arbiter_en=1'b1; 
  assign wr_arbiter_en=!joint_mode; 
  assign rd_ready=ch_rd_ready[rd_ch_num]; 
  assign wr_ready=ch_wr_ready[wr_ch_num_joint]; 
  assign rd_ready_joint=joint_mode&joint_req ? rd_ready&wr_ready:rd_ready; 
  assign wr_ready_joint=joint_mode&joint_req ? rd_ready&wr_ready:wr_ready; 
  assign ch_active_joint=joint_mode ? ch_rd_active|ch_wr_active:ch_rd_active; 
  assign joint_page_cross=(rd_page_cross&rd_ready)|(wr_page_cross&wr_ready); 
  assign joint_req=ch_joint_req[rd_ch_num]; 
  assign ch_rd_ready_joint=joint_mode ? (ch_joint_req&ch_rd_ready&ch_wr_ready)|((~ch_joint_req)&(ch_rd_ready|ch_wr_ready)):ch_rd_ready; 
  assign wr_burst_start_joint=joint_mode&joint_req ? rd_burst_start:wr_burst_start; 
  assign joint_hold=joint_mux_in_prog|(joint_in_prog&(~joint_req))|(joint_not_in_prog&joint_req)|joint_stall|(joint_req&joint_page_cross); 
  assign rd_hold_ctrl=joint_mode ? rd_hold|joint_hold|(joint_in_prog&wr_hold):rd_hold; 
  assign rd_hold_joint=joint_mode&(rd_hold_ctrl|rd_ctrl_busy|wr_ctrl_busy); 
  assign wr_hold_ctrl=joint_mode&(joint_req|joint_in_prog) ? wr_hold|joint_hold:wr_hold; 
  assign rd_ch_go_joint=rd_ch_go&ch_rd_ready[rd_ch_num]&(~rd_ctrl_busy); 
  assign wr_ch_go_joint=joint_mode ? (wr_ready&(~wr_ctrl_busy)&(joint_req ? rd_ch_go_joint:rd_ch_go&(~rd_ch_go_joint))):wr_ch_go; 
  assign rd_ch_go_null=rd_ch_go&(~rd_ch_go_joint)&(joint_mode ? (~wr_ch_go_joint):1'b1); 
  assign wr_ch_num_joint=joint_mode ? rd_ch_num:wr_ch_num; 
  assign wr_ch_last_joint=joint_mode ? rd_ch_last:wr_ch_last; 
  assign rd_finish_joint=joint_mode ? rd_finish|wr_finish|rd_ch_go_null:rd_finish|rd_ch_go_null; 
  assign rd_cmd_full_joint=joint_mode&joint_req ? wr_cmd_full|rd_cmd_full:rd_cmd_full; 
  assign wr_cmd_full_joint=joint_mode&joint_req ? wr_cmd_full|rd_cmd_full:wr_cmd_full; 
  assign rd_cmd_pending_joint=joint_mode ? rd_cmd_pending|wr_cmd_pending:rd_cmd_pending; 
  assign wr_cmd_pending_joint=joint_mode&joint_req ? rd_cmd_pending|wr_cmd_pending:wr_cmd_pending; 
  assign idle=&ch_idle; 
  assign gclk=clk; 
  dma_axi64_core0_wdt dma_axi64_core0_wdt(.clk(gclk),.reset(reset),.ch_active(ch_active),.rd_burst_start(rd_burst_start),.rd_ch_num(rd_ch_num),.wr_burst_start(wr_burst_start_joint),.wr_ch_num(wr_ch_num_joint),.wdt_timeout(wdt_timeout),.wdt_ch_num(wdt_ch_num)); 
  dma_axi64_core0_arbiter dma_axi64_core0_arbiter_rd(.clk(gclk),.reset(reset),.enable(rd_arbiter_en),.joint_mode(joint_mode),.page_cross(joint_page_cross),.joint_req(joint_req),.prio_top(rd_prio_top),.prio_high(rd_prio_high),.prio_top_num(rd_prio_top_num),.prio_high_num(rd_prio_high_num),.hold(rd_hold_joint),.ch_ready(ch_rd_ready_joint),.ch_active(ch_active_joint),.finish(rd_finish_joint),.ch_go_out(rd_ch_go),.ch_num(rd_ch_num),.ch_last(rd_ch_last)); 
  dma_axi64_core0_arbiter dma_axi64_core0_arbiter_wr(.clk(gclk),.reset(reset),.enable(wr_arbiter_en),.joint_mode(joint_mode),.page_cross(1'b0),.joint_req(joint_req),.prio_top(wr_prio_top),.prio_high(wr_prio_high),.prio_top_num(wr_prio_top_num),.prio_high_num(wr_prio_high_num),.hold(1'b0),.ch_ready(ch_wr_ready),.ch_active(ch_wr_active),.finish(wr_finish),.ch_go_out(wr_ch_go),.ch_num(wr_ch_num),.ch_last(wr_ch_last)); 
  dma_axi64_core0_ctrl dma_axi64_core0_ctrl_rd(.clk(gclk),.reset(reset),.ch_go(rd_ch_go_joint),.cmd_full(rd_cmd_full_joint),.cmd_pending(rd_cmd_pending_joint),.joint_req(joint_req),.ch_num(rd_ch_num),.ch_num_resp(rd_ch_num_resp),.go_next_line(rd_go_next_line),.periph_clr_valid(rd_clr_valid),.periph_clr(rd_clr),.periph_clr_last(rd_clr_last),.periph_delay(rd_periph_delay),.clr_stall(rd_clr_stall),.tokens(rd_tokens),.ch_ready(rd_ready_joint),.ch_last(rd_ch_last),.burst_start(rd_burst_start),.finish(rd_finish),.busy(rd_ctrl_busy),.hold(rd_hold_ctrl)); 
  dma_axi64_core0_ctrl dma_axi64_core0_ctrl_wr(.clk(gclk),.reset(reset),.ch_go(wr_ch_go_joint),.cmd_full(wr_cmd_full_joint),.cmd_pending(wr_cmd_pending_joint),.joint_req(joint_req),.ch_num(wr_ch_num_joint),.ch_num_resp(wr_ch_num_resp),.go_next_line(wr_go_next_line),.periph_clr_valid(wr_clr_valid),.periph_clr(wr_clr),.periph_clr_last(wr_clr_last),.periph_delay(wr_periph_delay),.clr_stall(wr_clr_stall),.tokens(wr_tokens),.ch_ready(wr_ready_joint),.ch_last(wr_ch_last_joint),.burst_start(wr_burst_start),.finish(wr_finish),.busy(wr_ctrl_busy),.hold(wr_hold_ctrl)); 
  dma_axi64_core0_axim_wr dma_axi64_core0_axim_wr(.clk(gclk),.reset(reset),.wr_ch_num(wr_ch_num_joint),.wr_burst_start(wr_burst_start_joint),.wr_burst_addr(wr_burst_addr),.wr_burst_size(wr_burst_size),.wr_cmd_split(wr_cmd_split),.wr_cmd_num(wr_cmd_num),.wr_cmd_pending(wr_cmd_pending),.joint_req(joint_req),.joint_stall(joint_stall),.rd_transfer(rd_transfer),.rd_transfer_size(rd_transfer_size),.ch_fifo_rd(ch_fifo_rd),.ch_fifo_rdata(ch_fifo_rdata),.ch_fifo_rd_valid(ch_fifo_rd_valid),.ch_fifo_rsize(ch_fifo_rsize),.ch_fifo_rd_num(ch_fifo_rd_num),.ch_fifo_wr_ready(ch_fifo_wr_ready),.wr_cmd_port(wr_cmd_port),.wr_last_cmd(wr_last_cmd),.wr_line_cmd(wr_line_cmd),.wr_transfer_num(wr_transfer_num),.wr_transfer(wr_transfer),.wr_transfer_size(wr_transfer_size),.wr_next_size(wr_next_size),.wr_clr_line(wr_clr_line),.wr_clr_line_num(wr_clr_line_num),.wr_cmd_full(wr_cmd_full),.wr_slverr(wr_slverr),.wr_decerr(wr_decerr),.wr_clr(wr_clr),.wr_clr_last(wr_clr_last),.wr_ch_num_resp(wr_ch_num_resp),.page_cross(wr_page_cross),.AWADDR(AWADDR),.AWPORT(wr_port_num),.AWLEN(AWLEN),.AWSIZE(AWSIZE),.AWVALID(AWVALID),.AWREADY(AWREADY),.WDATA(WDATA),.WSTRB(WSTRB),.WLAST(WLAST),.WVALID(WVALID),.WREADY(WREADY),.BRESP(BRESP),.BVALID(BVALID),.BREADY(BREADY),.axim_timeout_aw(timeout_aw),.axim_timeout_w(timeout_w),.axim_timeout_num_aw(timeout_num_aw),.axim_timeout_num_w(timeout_num_w)); 
  dma_axi64_core0_axim_rd dma_axi64_core0_axim_rd(.clk(gclk),.reset(reset),.load_wr(load_wr),.load_wr_num(load_wr_num),.load_wr_cycle(load_wr_cycle),.load_wdata(load_wdata),.load_req_in_prog(load_req_in_prog),.joint_stall(joint_stall),.joint_req(joint_req),.rd_cmd_port(rd_cmd_port),.rd_ch_num(rd_ch_num),.rd_burst_start(rd_burst_start),.rd_burst_addr(rd_burst_addr),.rd_burst_size(rd_burst_size),.rd_cmd_split(rd_cmd_split),.rd_cmd_line(rd_cmd_line),.rd_cmd_num(rd_cmd_num),.rd_cmd_pending(rd_cmd_pending),.ch_fifo_wr(ch_fifo_wr),.ch_fifo_wdata(ch_fifo_wdata),.ch_fifo_wsize(ch_fifo_wsize),.ch_fifo_wr_num(ch_fifo_wr_num),.rd_clr_line(rd_clr_line),.rd_clr_line_num(rd_clr_line_num),.rd_line_cmd(rd_line_cmd),.rd_transfer(rd_transfer),.rd_transfer_size(rd_transfer_size),.rd_transfer_num(rd_transfer_num),.rd_burst_cmd(rd_burst_cmd),.rd_cmd_full(rd_cmd_full),.rd_slverr(rd_slverr),.rd_decerr(rd_decerr),.rd_clr(rd_clr),.rd_clr_load(rd_clr_load),.rd_clr_last(rd_clr_last),.rd_ch_num_resp(rd_ch_num_resp),.page_cross(rd_page_cross),.ARADDR(ARADDR),.ARPORT(rd_port_num),.ARLEN(ARLEN),.ARSIZE(ARSIZE),.ARVALID(ARVALID),.ARREADY(ARREADY),.AWVALID(AWVALID),.RDATA(RDATA),.RRESP(RRESP),.RLAST(RLAST),.RVALID(RVALID),.RREADY_out(RREADY),.axim_timeout_ar(timeout_ar),.axim_timeout_num_ar(timeout_num_ar)); 
  assign rd_hold=1'b0; 
  assign wr_hold=1'b0; 
  dma_axi64_core0_channels dma_axi64_core0_channels(.clk(clk),.reset(reset),.scan_en(scan_en),.pclk(pclk),.clken(clken),.pclken(pclken),.psel(psel),.penable(penable),.paddr(paddr[10:0]),.pwrite(pwrite),.pwdata(pwdata),.prdata(prdata),.pslverr(pslverr),.periph_tx_req(periph_tx_req),.periph_tx_clr(periph_tx_clr),.periph_rx_req(periph_rx_req),.periph_rx_clr(periph_rx_clr),.rd_cmd_split(rd_cmd_split),.rd_cmd_line(rd_cmd_line),.rd_cmd_num(rd_cmd_num),.wr_cmd_split(wr_cmd_split),.wr_cmd_pending(wr_cmd_pending),.wr_cmd_num(wr_cmd_num),.rd_clr_valid(rd_clr_valid),.wr_clr_valid(wr_clr_valid),.rd_clr(rd_clr),.rd_clr_load(rd_clr_load),.wr_clr(wr_clr),.rd_clr_stall(rd_clr_stall),.wr_clr_stall(wr_clr_stall),.load_wr(load_wr),.load_wr_num(load_wr_num),.load_wr_cycle(load_wr_cycle),.rd_ch_num(rd_ch_num),.load_req_in_prog(load_req_in_prog),.wr_ch_num(wr_ch_num_joint),.wr_last_cmd(wr_last_cmd),.load_wdata(load_wdata),.wr_slverr(wr_slverr),.wr_decerr(wr_decerr),.wr_ch_num_resp(wr_ch_num_resp),.rd_slverr(rd_slverr),.rd_decerr(rd_decerr),.rd_ch_num_resp(rd_ch_num_resp),.wr_clr_last(wr_clr_last),.ch_int_all_proc(ch_int_all_proc),.ch_start(ch_start),.ch_idle(ch_idle),.ch_active(ch_active),.ch_rd_active(ch_rd_active),.ch_wr_active(ch_wr_active),.rd_line_cmd(rd_line_cmd),.wr_line_cmd(wr_line_cmd),.rd_go_next_line(rd_go_next_line),.wr_go_next_line(wr_go_next_line),.timeout_aw(timeout_aw),.timeout_w(timeout_w),.timeout_ar(timeout_ar),.timeout_num_aw(timeout_num_aw),.timeout_num_w(timeout_num_w),.timeout_num_ar(timeout_num_ar),.wdt_timeout(wdt_timeout),.wdt_ch_num(wdt_ch_num),.ch_fifo_wr_num(ch_fifo_wr_num),.rd_transfer_num(rd_transfer_num),.rd_burst_start(rd_burst_start),.ch_rd_ready(ch_rd_ready),.rd_burst_addr(rd_burst_addr),.rd_burst_size(rd_burst_size),.rd_tokens(rd_tokens),.rd_cmd_port(rd_cmd_port),.rd_periph_delay(rd_periph_delay),.rd_transfer(rd_transfer),.rd_transfer_size(rd_transfer_size),.rd_clr_line(rd_clr_line),.rd_clr_line_num(rd_clr_line_num),.fifo_rd(ch_fifo_rd),.fifo_rsize(ch_fifo_rsize),.fifo_rd_valid(ch_fifo_rd_valid),.fifo_rdata(ch_fifo_rdata),.fifo_wr_ready(ch_fifo_wr_ready),.ch_fifo_rd_num(ch_fifo_rd_num),.wr_burst_start(wr_burst_start_joint),.ch_wr_ready(ch_wr_ready),.wr_burst_addr(wr_burst_addr),.wr_burst_size(wr_burst_size),.wr_tokens(wr_tokens),.wr_cmd_port(wr_cmd_port),.wr_periph_delay(wr_periph_delay),.wr_transfer_num(wr_transfer_num),.wr_transfer(wr_transfer),.wr_transfer_size(wr_transfer_size),.wr_next_size(wr_next_size),.wr_clr_line(wr_clr_line),.wr_clr_line_num(wr_clr_line_num),.fifo_wr(ch_fifo_wr),.fifo_wdata(ch_fifo_wdata),.fifo_wsize(ch_fifo_wsize),.joint_mode(joint_mode),.joint_remote(joint_remote),.rd_page_cross(rd_page_cross),.wr_page_cross(wr_page_cross),.joint_in_prog(joint_in_prog),.joint_not_in_prog(joint_not_in_prog),.joint_mux_in_prog(joint_mux_in_prog),.ch_joint_req(ch_joint_req)); 
endmodule
 
module dma_axi64_core0_axim_timeout (
  input clk,
  input reset,
  input VALID,
  input READY,
  input [7-1:0] ID,
  output [2:0] axim_timeout_num,
  output axim_timeout) ; 
   reg [10-1:0] counter ;  
  assign axim_timeout_num=ID[2:0]; 
  assign axim_timeout=(counter=='d0); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          counter <={10{1'b1}};
        else 
          if (VALID&READY)
             counter <={10{1'b1}};
           else 
             if (VALID)
                counter <=counter-1'b1;
 
endmodule
 
module dma_axi64_core0_axim_wr (
  input clk,
  input reset,
  input wr_cmd_port,
  input wr_last_cmd,
  input wr_line_cmd,
  input [2:0] wr_ch_num,
  input wr_burst_start,
  input [32-1:0] wr_burst_addr,
  input [8-1:0] wr_burst_size,
  output wr_cmd_pending,
  output wr_cmd_split,
  output [2:0] wr_cmd_num,
  input rd_transfer,
  input [4-1:0] rd_transfer_size,
  output ch_fifo_rd,
  input [64-1:0] ch_fifo_rdata,
  input ch_fifo_rd_valid,
  output [4-1:0] ch_fifo_rsize,
  input ch_fifo_wr_ready,
  output [2:0] ch_fifo_rd_num,
  output [2:0] wr_transfer_num,
  output wr_transfer,
  output [4-1:0] wr_transfer_size,
  output [4-1:0] wr_next_size,
  output wr_cmd_full,
  output wr_clr_line,
  output [2:0] wr_clr_line_num,
  output wr_slverr,
  output wr_decerr,
  output wr_clr,
  output wr_clr_last,
  output [2:0] wr_ch_num_resp,
  output page_cross,
  output [32-1:0] AWADDR,
  output AWPORT,
  output [4-1:0] AWLEN,
  output [1:0] AWSIZE,
  output AWVALID,
  input AWREADY,
  output [64-1:0] WDATA,
  output [8-1:0] WSTRB,
  output WLAST,
  output WVALID,
  input WREADY,
  input [1:0] BRESP,
  input BVALID,
  output BREADY,
  input joint_req,
  output joint_stall,
  output axim_timeout_aw,
  output axim_timeout_w,
  output [2:0] axim_timeout_num_aw,
  output [2:0] axim_timeout_num_w) ; 
   wire [7-1:0] AWID ;  
   wire AJOINT ;  
   wire BVALID_d ;  
   wire [7-1:0] BID ;  
   reg [1:0] BRESP_d ;  
   wire wr_resp_full ;  
  assign BREADY=1'b1; 
  prgen_delay #(1)delay_bvalid(.clk(clk),.reset(reset),.din(BVALID),.dout(BVALID_d)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            BRESP_d <=2'b00;
          end 
        else 
          if (BVALID)
             begin 
               BRESP_d <=BRESP;
             end
  
  dma_axi64_core0_axim_cmd dma_axi64_axim_wcmd(.clk(clk),.reset(reset),.end_line_cmd(wr_line_cmd),.extra_bit(wr_last_cmd),.cmd_port(wr_cmd_port),.joint_req(joint_req),.joint_pending(),.ch_num(wr_ch_num),.burst_start(wr_burst_start),.burst_addr(wr_burst_addr),.burst_size(wr_burst_size),.cmd_pending(wr_cmd_pending),.cmd_full(wr_cmd_full),.cmd_split(wr_cmd_split),.cmd_num(wr_cmd_num),.cmd_line(),.page_cross(page_cross),.AID(AWID),.AADDR(AWADDR),.APORT(AWPORT),.ALEN(AWLEN),.ASIZE(AWSIZE),.AVALID(AWVALID),.AREADY(AWREADY),.AWVALID(1'b0),.AJOINT(AJOINT),.axim_timeout_num(axim_timeout_num_aw),.axim_timeout(axim_timeout_aw)); 
  dma_axi64_core0_axim_wdata dma_axi64_axim_wdata(.clk(clk),.reset(reset),.joint_stall(joint_stall),.rd_transfer(rd_transfer),.rd_transfer_size(rd_transfer_size),.ch_fifo_rd(ch_fifo_rd),.ch_fifo_rdata(ch_fifo_rdata),.ch_fifo_rd_valid(ch_fifo_rd_valid),.ch_fifo_rsize(ch_fifo_rsize),.ch_fifo_rd_num(ch_fifo_rd_num),.ch_fifo_wr_ready(ch_fifo_wr_ready),.wr_transfer_num(wr_transfer_num),.wr_transfer(wr_transfer),.wr_transfer_size(wr_transfer_size),.wr_next_size(wr_next_size),.wr_resp_full(wr_resp_full),.wr_cmd_full(wr_cmd_full),.wr_clr_line(wr_clr_line),.wr_clr_line_num(wr_clr_line_num),.AWID(AWID),.AWADDR(AWADDR),.AWLEN(AWLEN),.AWSIZE(AWSIZE),.AWVALID(AWVALID),.AWREADY(AWREADY),.AJOINT(AJOINT),.WDATA(WDATA),.WSTRB(WSTRB),.WLAST(WLAST),.WVALID(WVALID),.WREADY(WREADY),.axim_timeout_num(axim_timeout_num_w),.axim_timeout(axim_timeout_w)); 
  dma_axi64_core0_axim_resp #(.CMD_DEPTH(4))dma_axi64_axim_wresp(.clk(clk),.reset(reset),.slverr(wr_slverr),.decerr(wr_decerr),.clr(wr_clr),.clr_last(wr_clr_last),.ch_num_resp(wr_ch_num_resp),.resp_full(wr_resp_full),.AID(AWID),.AVALID(AWVALID),.AREADY(AWREADY),.ID(BID),.RESP(BRESP_d),.VALID(BVALID_d),.READY(BREADY),.LAST(1'b1)); 
endmodule
 
module prgen_or8 #(
 parameter WIDTH =8) (
  input [8*WIDTH-1:0] ch_x,
  output [WIDTH-1:0] x) ; 
    
  assign x=ch_x[WIDTH-1+WIDTH*0:WIDTH*0]|ch_x[WIDTH-1+WIDTH*1:WIDTH*1]|ch_x[WIDTH-1+WIDTH*2:WIDTH*2]|ch_x[WIDTH-1+WIDTH*3:WIDTH*3]|ch_x[WIDTH-1+WIDTH*4:WIDTH*4]|ch_x[WIDTH-1+WIDTH*5:WIDTH*5]|ch_x[WIDTH-1+WIDTH*6:WIDTH*6]|ch_x[WIDTH-1+WIDTH*7:WIDTH*7]; 
endmodule
 
module dma_axi64_core0_ch_rd_slicer (
  input clk,
  input reset,
  input fifo_rd,
  input [64-1:0] fifo_rdata,
  input [4-1:0] fifo_rsize,
  input [3-1:0] rd_align,
  input [5-1:0] rd_ptr,
  input [4-1:0] rd_line_remain,
  input wr_incr,
  input wr_single,
  output slice_rd,
  output reg  [64-1:0] slice_rdata,
  output [4-1:0] slice_rsize,
  output [5-1:0] slice_rd_ptr,
  output slice_rd_valid) ; 
   wire slice_rd_pre ;  
   //wire slice_rd ;  
   //wire [5-1:0] slice_rd_ptr ;  
   //wire [4-1:0] slice_rsize ;  
   wire fifo_rd_d ;  
   wire slice_rd_d ;  
   wire [3-1:0] rd_align_valid_pre ;  
   reg [3-1:0] rd_align_valid ;  
   reg [3-1:0] rd_align_d ;  
   reg [64-1:0] next_rdata_pre ;  
   reg [64-1:0] next_rdata ;  
   reg [4-1:0] actual_rsize ;  
   wire [4-1:0] actual_rsize_pre ;  
   reg [4-1:0] next_rsize_reg ;  
   wire [4-1:0] next_rsize ;  
   wire next_rd ;  
  prgen_delay #(1)delay_fifo_rd0(.clk(clk),.reset(reset),.din(fifo_rd),.dout(fifo_rd_d)); 
  prgen_delay #(2)delay_fifo_rd_valid(.clk(clk),.reset(reset),.din(fifo_rd_d),.dout(slice_rd_valid)); 
  prgen_delay #(1)delay_fifo_rd1(.clk(clk),.reset(reset),.din(slice_rd_pre),.dout(slice_rd)); 
  prgen_delay #(1)delay_fifo_rd2(.clk(clk),.reset(reset),.din(slice_rd),.dout(slice_rd_d)); 
  assign rd_align_valid_pre=(~wr_incr)&wr_single ? rd_align-rd_ptr[3-1:0]:rd_align; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            rd_align_valid <={3{1'b0}};
            rd_align_d <={3{1'b0}};
          end 
        else 
          begin 
            rd_align_valid <=rd_align_valid_pre;
            rd_align_d <=rd_align_valid;
          end
  
  always @(   fifo_rdata or  next_rdata or  rd_align_d)
       begin 
         case (rd_align_d[3-1:0])
          3 'd0:
             slice_rdata =next_rdata[63:0];
          3 'd1:
             slice_rdata ={fifo_rdata[55:0],next_rdata[7:0]};
          3 'd2:
             slice_rdata ={fifo_rdata[47:0],next_rdata[15:0]};
          3 'd3:
             slice_rdata ={fifo_rdata[39:0],next_rdata[23:0]};
          3 'd4:
             slice_rdata ={fifo_rdata[31:0],next_rdata[31:0]};
          3 'd5:
             slice_rdata ={fifo_rdata[23:0],next_rdata[39:0]};
          3 'd6:
             slice_rdata ={fifo_rdata[15:0],next_rdata[47:0]};
          3 'd7:
             slice_rdata ={fifo_rdata[7:0],next_rdata[55:0]};
         endcase 
       end
  
  always @(  fifo_rdata or  rd_align_valid)
       begin 
         case (rd_align_valid[3-1:0])
          3 'd0:
             next_rdata_pre =fifo_rdata[63:0];
          3 'd1:
             next_rdata_pre ={{56{1'b0}},fifo_rdata[63:56]};
          3 'd2:
             next_rdata_pre ={{48{1'b0}},fifo_rdata[63:48]};
          3 'd3:
             next_rdata_pre ={{40{1'b0}},fifo_rdata[63:40]};
          3 'd4:
             next_rdata_pre ={{32{1'b0}},fifo_rdata[63:32]};
          3 'd5:
             next_rdata_pre ={{24{1'b0}},fifo_rdata[63:24]};
          3 'd6:
             next_rdata_pre ={{16{1'b0}},fifo_rdata[63:16]};
          3 'd7:
             next_rdata_pre ={{8{1'b0}},fifo_rdata[63:8]};
         endcase 
       end
  
  always @(  posedge clk or  posedge reset)
       if (reset)
          next_rdata <={64{1'b0}};
        else 
          if (slice_rd_d)
             next_rdata <=next_rdata_pre;
 
  assign actual_rsize_pre=next_rsize+({4{fifo_rd}}&fifo_rsize); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          actual_rsize <={4{1'b0}};
        else 
          if (fifo_rd|(|next_rsize))
             actual_rsize <=actual_rsize_pre;
 
  prgen_min2 #(4)min_rsize(.a(rd_line_remain),.b(actual_rsize),.min(slice_rsize)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          next_rsize_reg <={4{1'b0}};
        else 
          if (next_rd)
             next_rsize_reg <={4{1'b0}};
           else 
             if (fifo_rd|slice_rd)
                next_rsize_reg <=next_rsize+({4{fifo_rd}}&fifo_rsize);
 
  assign next_rsize=next_rsize_reg-({4{fifo_rd_d}}&slice_rsize); 
  assign next_rd=(~fifo_rd)&(|next_rsize); 
  assign slice_rd_pre=fifo_rd|next_rd; 
  assign slice_rd_ptr=rd_ptr; 
endmodule
 
module dma_axi64_core0_ch_calc #(
 parameter READ =0,
 parameter SINGLE_SIZE =8) (
  input clk,
  input reset,
  input load_in_prog,
  input load_req_in_prog,
  input [32-1:0] load_addr,
  input ch_update,
  input ch_end,
  input ch_end_flush,
  input go_next_line,
  input burst_start,
  input incr,
  input wr_cmd_pending,
  input outs_empty,
  input [8-1:0] burst_max_size,
  input [32-1:0] start_addr,
  input [12-1:0] frame_width,
  input [8-1:0] x_size,
  input [10-1:0] x_remain,
  input fifo_wr_ready,
  input [5:0] fifo_remain,
  output burst_last,
  output [32-1:0] burst_addr,
  output [8-1:0] burst_size,
  output burst_ready,
  output reg  single,
  output joint_ready_out,
  input joint_ready_in,
  input joint_line_req_in,
  output joint_line_req_out,
  input joint_burst_req_in,
  output joint_burst_req_out,
  input joint_line_req_clr,
  input joint,
  input page_cross,
  input joint_cross,
  output joint_flush,
  input joint_flush_in) ; 
    
    
   wire ch_update_d ;  
   wire ch_update_d2 ;  
   wire ch_update_d3 ;  
   //wire [32-1:0] burst_addr ;  
   //wire [8-1:0] burst_size ;  
  prgen_delay #(1)delay_calc0(.clk(clk),.reset(reset),.din(ch_update),.dout(ch_update_d)); 
  prgen_delay #(1)delay_calc1(.clk(clk),.reset(reset),.din(ch_update_d),.dout(ch_update_d2)); 
  prgen_delay #(1)delay_calc2(.clk(clk),.reset(reset),.din(ch_update_d2),.dout(ch_update_d3)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          single <=1'b0;
        else 
          if (burst_start)
             single <=(burst_size<=SINGLE_SIZE);
 
  dma_axi64_core0_ch_calc_addr dma_axi64_ch_calc_addr(.clk(clk),.reset(reset),.ch_update_d(ch_update_d),.load_in_prog(load_in_prog),.load_addr(load_addr),.go_next_line(go_next_line),.burst_start(burst_start),.incr(incr),.start_addr(start_addr),.frame_width(frame_width),.x_size(x_size),.burst_size(burst_size),.burst_addr(burst_addr)); 
  dma_axi64_core0_ch_calc_size #(.READ(READ))dma_axi64_ch_calc_size(.clk(clk),.reset(reset),.ch_update(ch_update),.ch_update_d(ch_update_d),.ch_update_d2(ch_update_d2),.ch_update_d3(ch_update_d3),.ch_end(ch_end),.ch_end_flush(ch_end_flush),.joint_line_req_clr(joint_line_req_clr),.wr_cmd_pending(wr_cmd_pending),.outs_empty(outs_empty),.load_in_prog(load_in_prog),.load_req_in_prog(load_req_in_prog),.burst_start(burst_start),.burst_addr(burst_addr),.burst_max_size(burst_max_size),.x_remain(x_remain),.fifo_wr_ready(fifo_wr_ready),.fifo_remain(fifo_remain),.burst_size(burst_size),.burst_ready(burst_ready),.burst_last(burst_last),.joint_ready_out(joint_ready_out),.joint_ready_in(joint_ready_in),.joint_line_req_in(joint_line_req_in),.joint_line_req_out(joint_line_req_out),.joint_burst_req_in(joint_burst_req_in),.joint_burst_req_out(joint_burst_req_out),.joint(joint),.page_cross(page_cross),.joint_cross(joint_cross),.joint_flush(joint_flush),.joint_flush_in(joint_flush_in)); 
endmodule
 
module dma_axi64_core0_wdt (
  input clk,
  input reset,
  input [7:0] ch_active,
  input rd_burst_start,
  input [2:0] rd_ch_num,
  input wr_burst_start,
  input [2:0] wr_ch_num,
  output wdt_timeout,
  output reg  [2:0] wdt_ch_num) ; 
   reg [11-1:0] counter ;  
   wire current_ch_active ;  
   wire current_burst_start ;  
   wire advance ;  
   wire idle ;  
  assign idle=ch_active==8'd0; 
  assign current_ch_active=ch_active[wdt_ch_num]; 
  assign current_burst_start=(rd_burst_start&(rd_ch_num==wdt_ch_num))|(wr_burst_start&(wr_ch_num==wdt_ch_num)); 
  assign advance=(!current_ch_active)|current_burst_start|wdt_timeout; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          wdt_ch_num <=3'd0;
        else 
          if (advance)
             wdt_ch_num <=wdt_ch_num+1'b1;
 
  assign wdt_timeout=(counter=='d0); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          counter <={11{1'b1}};
        else 
          if (advance|idle)
             counter <={11{1'b1}};
           else 
             counter <=counter-1'b1;
 
endmodule
 
module dma_axi64_core0_ch_fifo (
  input CLK,
  input WR,
  input RD,
  input [5-3-1:0] WR_ADDR,
  input [5-3-1:0] RD_ADDR,
  input [64-1:0] DIN,
  input [8-1:0] BSEL,
  output reg  [64-1:0] DOUT) ; 
   reg [64-1:0] Mem[4-1:0] ;  
   wire [64-1:0] BitSEL ;  
   wire [64-1:0] DIN_BitSEL ;  
  assign BitSEL={{8{BSEL[7]}},{8{BSEL[6]}},{8{BSEL[5]}},{8{BSEL[4]}},{8{BSEL[3]}},{8{BSEL[2]}},{8{BSEL[1]}},{8{BSEL[0]}}}; 
  assign DIN_BitSEL=(Mem[WR_ADDR]&~BitSEL)|(DIN&BitSEL); 
  always @( posedge CLK)
       if (WR)
          Mem [WR_ADDR]<=DIN_BitSEL;
 
  always @( posedge CLK)
       if (RD)
          DOUT <=Mem[RD_ADDR];
 
endmodule
 
module dma_axi64_core0_axim_wdata (
  input clk,
  input reset,
  input rd_transfer,
  input [4-1:0] rd_transfer_size,
  output ch_fifo_rd,
  output [4-1:0] ch_fifo_rsize,
  input [64-1:0] ch_fifo_rdata,
  input ch_fifo_rd_valid,
  input ch_fifo_wr_ready,
  output [2:0] ch_fifo_rd_num,
  output reg  [2:0] wr_transfer_num,
  output wr_transfer,
  output reg  [4-1:0] wr_transfer_size,
  output reg  [4-1:0] wr_next_size,
  input wr_resp_full,
  output wr_cmd_full,
  output wr_clr_line,
  output reg  [2:0] wr_clr_line_num,
  output joint_stall,
  output [2:0] axim_timeout_num,
  output axim_timeout,
  input [7-1:0] AWID,
  input [32-1:0] AWADDR,
  input [4-1:0] AWLEN,
  input [1:0] AWSIZE,
  input AWVALID,
  input AWREADY,
  input AJOINT,
  output [64-1:0] WDATA,
  output [8-1:0] WSTRB,
  output WLAST,
  output WVALID,
  input WREADY) ; 
   wire [7-1:0] WID ;  
   wire [7-1:0] WID_pre ;  
   reg [8-1:0] WSTRB_pre ;  
   wire [1:0] WSIZE_pre ;  
   wire [4-1:0] WLEN_pre ;  
   wire [7-1:0] WID_data ;  
   wire [8-1:0] WSTRB_data ;  
   wire [1:0] WSIZE_data ;  
   wire [4-1:0] WLEN_data ;  
   //wire WVALID ;  
   //wire WLAST ;  
   wire valid_last ;  
   wire wr_clr_line_stall_pre ;  
   wire wr_clr_line_stall ;  
   wire wr_clr_line_pre ;  
   wire [2:0] wr_transfer_num_pre ;  
   wire wr_transfer_pre ;  
   wire [4-1:0] wr_transfer_size_pre ;  
   //wire wr_transfer ;  
   reg [2:0] last_channel ;  
   wire [7-1:0] WID_cmd ;  
   wire [1:0] WSIZE_cmd ;  
   wire [4-1:0] WLEN_cmd ;  
   wire data_ready ;  
   wire [2:0] data_fullness_pre ;  
   reg [2:0] data_fullness ;  
   wire joint_fifo_rd_valid ;  
   wire joint_req_out ;  
   //wire joint_stall ;  
   wire rd_transfer_joint ;  
   wire [4-1:0] rd_transfer_size_joint ;  
   wire rd_transfer_full ;  
   wire cmd_push ;  
   wire cmd_pop ;  
   wire cmd_pop_d ;  
   wire cmd_empty ;  
   wire cmd_full ;  
   wire cmd_data_push ;  
   wire cmd_data_pop ;  
   wire cmd_data_empty ;  
   wire cmd_data_full ;  
   wire data_push ;  
   wire data_pop ;  
   wire data_empty ;  
   wire data_full ;  
   reg [4-1:0] rd_out_count ;  
   reg [4-1:0] rd_in_count ;  
   wire data_pending_pre ;  
   wire data_pending ;  
   wire line_end ;  
   wire [2:0] line_end_num ;  
  assign data_ready=ch_fifo_rd_valid; 
  assign data_fullness_pre=data_fullness+data_ready-wr_transfer_pre; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          data_fullness <=3'd0;
        else 
          if (data_ready|wr_transfer_pre)
             data_fullness <=data_fullness_pre;
 
  prgen_joint_stall #(4)gen_joint_stall(.clk(clk),.reset(reset),.joint_req_out(joint_req_out),.rd_transfer(rd_transfer),.rd_transfer_size(rd_transfer_size),.ch_fifo_rd(ch_fifo_rd),.data_fullness_pre(data_fullness_pre),.HOLD(1'b0),.joint_fifo_rd_valid(joint_fifo_rd_valid),.rd_transfer_size_joint(rd_transfer_size_joint),.rd_transfer_full(rd_transfer_full),.joint_stall(joint_stall)); 
  assign data_pending_pre=WVALID&(~WREADY); 
  prgen_delay #(1)delay_pending(.clk(clk),.reset(reset),.din(data_pending_pre),.dout(data_pending)); 
  always @( WSIZE_cmd)
       begin 
         case (WSIZE_cmd)
          2 'b00:
             wr_next_size =4'd1;
          2 'b01:
             wr_next_size =4'd2;
          2 'b10:
             wr_next_size =4'd4;
          2 'b11:
             wr_next_size =4'd8;
         endcase 
       end
  
  assign ch_fifo_rd=joint_fifo_rd_valid|((~cmd_empty)&(~data_pending)&(~wr_clr_line_stall)&ch_fifo_wr_ready); 
  assign ch_fifo_rsize=joint_fifo_rd_valid ? rd_transfer_size_joint:WID_cmd[5:4]==2'b00 ? 4'd1:WID_cmd[5:4]==2'b01 ? 4'd2:WID_cmd[5:4]==2'b10 ? 4'd4:4'd8; 
  assign ch_fifo_rd_num=WID_cmd[2:0]; 
  prgen_delay #(1)delay_cmd_pop(.clk(clk),.reset(reset),.din(cmd_pop),.dout(cmd_pop_d)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          last_channel <=3'b000;
        else 
          if (cmd_push)
             last_channel <=WID_pre[2:0];
 
  assign wr_transfer_num_pre=WID_data[2:0]; 
  assign wr_transfer_pre=WVALID&WREADY; 
  assign wr_transfer_size_pre=WID_data[5:4]==2'b00 ? 4'd1:WID_data[5:4]==2'b01 ? 4'd2:WID_data[5:4]==2'b10 ? 4'd4:4'd8; 
  prgen_delay #(1)delay_wr_transfer(.clk(clk),.reset(reset),.din(wr_transfer_pre),.dout(wr_transfer)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            wr_transfer_num <=3'd0;
            wr_transfer_size <=3'd0;
          end 
        else 
          if (wr_transfer_pre)
             begin 
               wr_transfer_num <=wr_transfer_num_pre;
               wr_transfer_size <=wr_transfer_size_pre;
             end
  
  assign valid_last=ch_fifo_rd&(rd_out_count==WLEN_cmd)&(~cmd_empty); 
  assign wr_clr_line_pre=valid_last&line_end; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          wr_clr_line_num <=3'd0;
        else 
          if (wr_clr_line_pre)
             wr_clr_line_num <=line_end_num;
 
  assign wr_clr_line_stall_pre=wr_clr_line_pre&(ch_fifo_rd_num==line_end_num); 
  prgen_delay #(1)delay_stall(.clk(clk),.reset(reset),.din(wr_clr_line_stall_pre),.dout(wr_clr_line_stall)); 
  prgen_delay #(2)delay_clr_line(.clk(clk),.reset(reset),.din(wr_clr_line_pre),.dout(wr_clr_line)); 
  assign wr_cmd_full=cmd_full|cmd_data_full|wr_resp_full; 
  assign cmd_push=AWVALID&AWREADY; 
  assign cmd_pop=valid_last; 
  assign WID_pre=AWID; 
  assign WLEN_pre=AWLEN; 
  assign WSIZE_pre=AWSIZE; 
  always @(  AWADDR or  AWSIZE)
       begin 
         case ({AWSIZE[1:0],AWADDR[2:0]})
          { 2'b00,3'b000}:
             WSTRB_pre =8'b0000_0001;
          { 2'b00,3'b001}:
             WSTRB_pre =8'b0000_0010;
          { 2'b00,3'b010}:
             WSTRB_pre =8'b0000_0100;
          { 2'b00,3'b011}:
             WSTRB_pre =8'b0000_1000;
          { 2'b00,3'b100}:
             WSTRB_pre =8'b0001_0000;
          { 2'b00,3'b101}:
             WSTRB_pre =8'b0010_0000;
          { 2'b00,3'b110}:
             WSTRB_pre =8'b0100_0000;
          { 2'b00,3'b111}:
             WSTRB_pre =8'b1000_0000;
          { 2'b01,3'b000}:
             WSTRB_pre =8'b0000_0011;
          { 2'b01,3'b010}:
             WSTRB_pre =8'b0000_1100;
          { 2'b01,3'b100}:
             WSTRB_pre =8'b0011_0000;
          { 2'b01,3'b110}:
             WSTRB_pre =8'b1100_0000;
          { 2'b10,3'b000}:
             WSTRB_pre =8'b0000_1111;
          { 2'b10,3'b100}:
             WSTRB_pre =8'b1111_0000;
          default :
             WSTRB_pre =8'b1111_1111;
         endcase 
       end
  
  prgen_fifo #(7+4+2+1,4)cmd_fifo(.clk(clk),.reset(reset),.push(cmd_push),.pop(cmd_pop),.din({WID_pre,WSIZE_pre,WLEN_pre,AJOINT}),.dout({WID_cmd,WSIZE_cmd,WLEN_cmd,joint_req_out}),.empty(cmd_empty),.full(cmd_full)); 
  assign line_end=WID_cmd[6]; 
  assign line_end_num=WID_cmd[2:0]; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          rd_out_count <={4{1'b0}};
        else 
          if (cmd_pop)
             rd_out_count <={4{1'b0}};
           else 
             if (ch_fifo_rd)
                rd_out_count <=rd_out_count+1'b1;
 
  assign cmd_data_push=cmd_push; 
  assign cmd_data_pop=WVALID&WREADY&WLAST; 
  assign WSTRB=(rd_in_count[0] ? {WSTRB_data[3:0],WSTRB_data[7:4]}:WSTRB_data)&{8{WVALID}}; 
  assign WID=WID_data; 
  prgen_fifo #(8+4+7+2,4)cmd_data_fifo(.clk(clk),.reset(reset),.push(cmd_data_push),.pop(cmd_data_pop),.din({WLEN_pre,WSIZE_pre,WSTRB_pre,WID_pre}),.dout({WLEN_data,WSIZE_data,WSTRB_data,WID_data}),.empty(cmd_data_empty),.full(cmd_data_full)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          rd_in_count <={4{1'b0}};
        else 
          if (cmd_data_pop)
             rd_in_count <={4{1'b0}};
           else 
             if (wr_transfer_pre)
                rd_in_count <=rd_in_count+1'b1;
 
  assign data_push=ch_fifo_rd_valid; 
  assign data_pop=wr_transfer_pre; 
  prgen_fifo #(64,5+2)data_fifo(.clk(clk),.reset(reset),.push(data_push),.pop(data_pop),.din(ch_fifo_rdata),.dout(WDATA),.empty(data_empty),.full(data_full)); 
  assign WVALID=~data_empty; 
  assign WLAST=WVALID&(rd_in_count==WLEN_data)&(~cmd_data_empty); 
  dma_axi64_core0_axim_timeout dma_axi64_axim_timeout(.clk(clk),.reset(reset),.VALID(WVALID),.READY(WREADY),.ID(WID),.axim_timeout_num(axim_timeout_num),.axim_timeout(axim_timeout)); 
endmodule
 
module dma_axi64_reg_core0 (
  input clk,
  input reset,
  input wr_joint,
  input wr_clkdiv,
  input wr_start,
  input wr_prio,
  input [31:0] pwdata,
  output [3:0] clkdiv,
  output [7:0] ch_start,
  output reg  joint_mode,
  output rd_prio_top,
  output rd_prio_high,
  output [2:0] rd_prio_top_num,
  output [2:0] rd_prio_high_num,
  output wr_prio_top,
  output wr_prio_high,
  output [2:0] wr_prio_top_num,
  output [2:0] wr_prio_high_num,
  output [31:0] user_def_stat0,
  output [31:0] user_def_stat1,
  input [8*1-1:0] ch_int_all_proc,
  output [7:0] proc0_int_stat) ; 
   wire user_def_clkdiv ;  
   wire user_def_bus_32 ;  
   wire [3:0] user_def_ch_num ;  
   wire [3:0] user_def_fifo_size ;  
   wire [3:0] user_def_wcmd_depth ;  
   wire [3:0] user_def_rcmd_depth ;  
   wire user_def_block ;  
   wire user_def_wait ;  
   wire user_def_outs ;  
   wire user_def_prio ;  
   wire user_def_tokens ;  
   wire user_def_timeout ;  
   wire user_def_wdt ;  
   wire user_def_joint ;  
   wire user_def_simul ;  
   wire user_def_periph ;  
   wire user_def_lists ;  
   wire user_def_end ;  
   wire [5:0] user_def_addr_bits ;  
   wire [4:0] user_def_buff_bits ;  
  assign user_def_clkdiv=0; 
  assign user_def_bus_32=0; 
  assign user_def_ch_num=1; 
  assign user_def_fifo_size=5; 
  assign user_def_wcmd_depth=2; 
  assign user_def_rcmd_depth=2; 
  assign user_def_block=0; 
  assign user_def_wait=0; 
  assign user_def_outs=0; 
  assign user_def_prio=0; 
  assign user_def_tokens=1; 
  assign user_def_timeout=1; 
  assign user_def_wdt=1; 
  assign user_def_joint=1; 
  assign user_def_simul=1; 
  assign user_def_periph=1; 
  assign user_def_lists=1; 
  assign user_def_end=1; 
  assign user_def_addr_bits=32; 
  assign user_def_buff_bits=10; 
  assign user_def_stat0={3'b000,user_def_buff_bits,1'b0,user_def_bus_32,user_def_addr_bits,user_def_rcmd_depth,user_def_wcmd_depth,user_def_fifo_size,user_def_ch_num}; 
  assign user_def_stat1={{21{1'b0}},user_def_clkdiv,user_def_end,user_def_lists,user_def_periph,user_def_simul,user_def_joint,user_def_block,user_def_wait,user_def_outs,user_def_prio,user_def_tokens,user_def_timeout,user_def_wdt}; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          begin 
            joint_mode <=1'b0;
          end 
        else 
          if (wr_joint)
             begin 
               joint_mode <=pwdata[0];
             end
  
  assign rd_prio_top='d0; 
  assign rd_prio_high='d0; 
  assign rd_prio_top_num='d0; 
  assign rd_prio_high_num='d0; 
  assign wr_prio_top='d0; 
  assign wr_prio_high='d0; 
  assign wr_prio_top_num='d0; 
  assign wr_prio_high_num='d0; 
  assign clkdiv=4'd0; 
  assign ch_start={8{wr_start}}&pwdata[7:0]; 
  prgen_scatter8_1 #(0)scatter_proc0(.ch_x(ch_int_all_proc),.x(proc0_int_stat)); 
endmodule
 
module dma_axi64_core0_axim_rdata (
  input clk,
  input reset,
  input joint_stall,
  output ch_fifo_wr,
  output [64-1:0] ch_fifo_wdata,
  output [4-1:0] ch_fifo_wsize,
  output [2:0] ch_fifo_wr_num,
  output [2:0] rd_transfer_num,
  output rd_transfer,
  input [4-1:0] rd_transfer_size,
  output rd_burst_cmd,
  output load_wr,
  output [2:0] load_wr_num,
  output reg  [1:0] load_wr_cycle,
  output [64-1:0] load_wdata,
  output rd_clr_line,
  output reg  [2:0] rd_clr_line_num,
  input ARVALID,
  input ARREADY,
  input [7-1:0] ARID,
  input [7-1:0] RID,
  input [64-1:0] RDATA,
  input RLAST,
  input RVALID,
  input RREADY,
  output RREADY_out) ; 
   wire load_cmd_id ;  
   wire rd_clr_line_pre ;  
   wire rd_clr_line_pre_d ;  
   reg [2:0] ch_fifo_wr_num_d ;  
  assign load_cmd_id=RID[3]; 
  assign RREADY_out=(~rd_clr_line_pre)&(~rd_clr_line_pre_d)&(~joint_stall); 
  assign rd_transfer_num=RID[2:0]; 
  assign rd_transfer=RVALID&RREADY&(~load_cmd_id); 
  assign rd_burst_cmd=rd_transfer&RID[5]; 
  assign ch_fifo_wr=rd_transfer; 
  assign ch_fifo_wdata=RDATA; 
  assign ch_fifo_wsize=rd_transfer_size; 
  assign ch_fifo_wr_num=RID[2:0]; 
  assign rd_clr_line_pre=RVALID&RREADY&RLAST&RID[6]&(~RID[3]); 
  prgen_delay #(1)delay_clr(.clk(clk),.reset(reset),.din(rd_clr_line_pre),.dout(rd_clr_line_pre_d)); 
  prgen_delay #(1)delay_clr2(.clk(clk),.reset(reset),.din(rd_clr_line_pre_d),.dout(rd_clr_line)); 
  always @(  posedge clk or  posedge reset)
       if (reset)
          ch_fifo_wr_num_d <=3'b000;
        else 
          if (rd_clr_line_pre)
             ch_fifo_wr_num_d <=ch_fifo_wr_num;
 
  always @(  posedge clk or  posedge reset)
       if (reset)
          rd_clr_line_num <=3'b000;
        else 
          if (rd_clr_line_pre_d)
             rd_clr_line_num <=ch_fifo_wr_num_d;
 
  assign load_wr=RVALID&RREADY&load_cmd_id; 
  assign load_wr_num=RID[2:0]; 
  assign load_wdata=RDATA; 
  always @(  posedge clk or  posedge reset)
       if (reset)
          load_wr_cycle <=2'b00;
        else 
          if (load_wr&load_wr_cycle[0]&1'b1)
             load_wr_cycle <=2'b00;
           else 
             if (load_wr)
                load_wr_cycle <=load_wr_cycle+1'b1;
 
endmodule
 
module prgen_mux8 #(
 parameter WIDTH =8) (
  input [3-1:0] sel,
  input [8*WIDTH-1:0] ch_x,
  output reg  [WIDTH-1:0] x) ; 
    
  always @(  ch_x or  sel)
       begin 
         case (sel)
          3 'd0:
             x =ch_x[WIDTH-1+WIDTH*0:WIDTH*0];
          3 'd1:
             x =ch_x[WIDTH-1+WIDTH*1:WIDTH*1];
          3 'd2:
             x =ch_x[WIDTH-1+WIDTH*2:WIDTH*2];
          3 'd3:
             x =ch_x[WIDTH-1+WIDTH*3:WIDTH*3];
          3 'd4:
             x =ch_x[WIDTH-1+WIDTH*4:WIDTH*4];
          3 'd5:
             x =ch_x[WIDTH-1+WIDTH*5:WIDTH*5];
          3 'd6:
             x =ch_x[WIDTH-1+WIDTH*6:WIDTH*6];
          3 'd7:
             x =ch_x[WIDTH-1+WIDTH*7:WIDTH*7];
          default :
             x =ch_x[WIDTH-1:0];
         endcase 
       end
  
endmodule
 












