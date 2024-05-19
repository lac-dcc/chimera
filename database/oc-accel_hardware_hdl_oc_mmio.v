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
`timescale 1ns/1ps

`include "snap_global_vars.v"

module mmio (
             input                clk                        ,
             input                rst_n                      ,

             //---- SNAP debug -----------------------------
             output               debug_cnt_clear            ,
             input         [63:0] debug_tlx_cnt_cmd          ,
             input         [63:0] debug_tlx_cnt_rsp          ,
             input         [63:0] debug_tlx_cnt_retry        ,
             input         [63:0] debug_tlx_cnt_fail         ,
             input         [63:0] debug_tlx_cnt_xlt_pd       ,
             input         [63:0] debug_tlx_cnt_xlt_done     ,
             input         [63:0] debug_tlx_cnt_xlt_retry    ,
             input         [63:0] debug_axi_cnt_cmd          , 
             input         [63:0] debug_axi_cnt_rsp          , 
             input         [63:0] debug_buf_cnt              , 
             input         [63:0] debug_traffic_idle         ,
             output        [63:0] debug_tlx_idle_lim         , // higher 32b: response idle counter limit; lower 32b: command idle counter limit
             output        [63:0] debug_axi_idle_lim         , // higher 32b: response idle counter limit; lower 32b: command idle counter limit

             //---- FIR -------------------------------------
             input         [63:0] fir_fifo_overflow          ,
             input         [63:0] fir_tlx_interface          ,

             //---- local control output -------------------
             output reg           soft_reset_brdg_odma       , // soft reset SNAP logic
             output reg           soft_reset_action          , // soft reset action logic

             //---- MMIO side interface --------------------
             input                mmio_wr                    ,
             input                mmio_rd                    ,
             input                mmio_dw                    ,
             input         [31:0] mmio_addr                  ,
             input         [63:0] mmio_din                   ,
             output reg    [63:0] mmio_dout                  ,
             output reg           mmio_done                  ,
             output reg           mmio_failed                ,

             //---- AXI Lite interface for action ----------
             output reg           lcl_wr                     , // write enable
             output reg           lcl_rd                     , // read enable
             output reg    [31:0] lcl_addr                   , // write/read address
             output reg    [31:0] lcl_din                    , // write data
             input                lcl_ack                    , // write data acknowledgement
             input                lcl_rsp                    , // write/read response: 1: good; 0: bad
             input         [31:0] lcl_dout                   , // read data
             input                lcl_dv                       // read data valid
             );



// local status 
 reg snap_idle       ;  // SNAP data buffers empty
 reg snap_tlx_busy   ;  // SNAP TLX command all responded
 reg snap_axi_busy   ;  // SNAP AXI command all responded
 reg snap_fatal_error;  // SNAP FIFO overflow or TLX command over-commit

`ifdef ENABLE_NVME
 parameter  NVME_ENABLED    = 1'b1; // NVMe host logic enabled for connecting to NVMe Flash drives
`else
 parameter  NVME_ENABLED    = 1'b0; // NVMe host logic disabled for connecting to NVMe Flash drives
`endif


//=================================================================================================================
//              MMIO SPACE ALLOCATION
//=================================================================================================================
// +-----------------------------------------------------------------------------------------------+
// |31|30|29|28|27|26|25|24|23|22|21|20|19|18|17|16|15|14|13|12|11|10|09|08|07|06|05|04|03|02|01|00|
// +-----------------------------------------------------------------------------------------------+
 parameter GLOBAL_PP_MMIO_BIT    = 31; //0: Global space; 1: PerPASID space
 parameter ACTION_ACCESS_BIT     = 31; //0: Snap registers 1: Action registers
 //Global space is for SNAP Core registers
 //PerPASID space is for Action registers
 //Now they have the same meanings

 //PASID: 512 (9bits)
 parameter PASID_START_BIT       = 30;
 parameter PASID_END_BIT         = 22;

 //SNAP core registers are grouped
 //Decided by base_address + offset
 parameter SNAP_BASE_START_BIT   = 21;
 parameter SNAP_BASE_END_BIT     = 8;
 parameter SNAP_OFFSET_START_BIT = 7;
 parameter SNAP_OFFSET_END_BIT   = 0;


//=================================================================================================================
//              SNAP REGISTERS DECLARATION
//=================================================================================================================

//------------ REG_SNAP_BASE_ADDR ---------------
 reg [63:00] REG_implementation_vertion;
 reg [63:00] REG_build_date            ;
 reg [63:00] REG_command               ;
 reg [63:00] REG_status                ;
 reg [63:00] REG_capability            ;
 reg [63:00] REG_freeruntime           ;
 reg [63:00] REG_usercode              ;
 reg [63:00] REG_prcode                ;

//------------ REG_DEBUG_BASE_ADDR --------------
 reg [63:00] REG_debug_clear            ; // clear out all debug registers
 reg [63:00] REG_debug_tlx_cnt_cmd      ; // (higher 32b: R, lower 32b: W) number of total TLX command 
 reg [63:00] REG_debug_tlx_cnt_rsp      ; // (higher 32b: R, lower 32b: W) number of total TLX responses 
 reg [63:00] REG_debug_tlx_cnt_retry    ; // (higher 32b: R, lower 32b: W) number of TLX retry responses 
 reg [63:00] REG_debug_tlx_cnt_fail     ; // (higher 32b: R, lower 32b: W) number of TLX fail responses
 reg [63:00] REG_debug_tlx_cnt_xlt_pd   ; // (higher 32b: R, lower 32b: W) number of TLX xlate pending responses
 reg [63:00] REG_debug_tlx_cnt_xlt_done ; // (higher 32b: R, lower 32b: W) number of TLX xlate done responses
 reg [63:00] REG_debug_tlx_cnt_xlt_retry; // (higher 32b: R, lower 32b: W) number of TLX xlate retry responses 
 reg [63:00] REG_debug_axi_cnt_cmd      ; // (higher 32b: R, lower 32b: W) number of total AXI commands 
 reg [63:00] REG_debug_axi_cnt_rsp      ; // (higher 32b: R, lower 32b: W) number of total AXI responses 
 reg [63:00] REG_debug_buf_cnt          ; // (higher 32b: R, lower 32b: W) number of available tags 
 reg [63:00] REG_debug_traffic_idle     ; // no activity over a period (b0: AXIwrsp; b1: AXIwcmd; b2: AXIrrsp; b3: AXIrcmd; b4: TLXrsp; b5: TLXcmd)
 reg [63:00] REG_debug_tlx_idle_lim     ; // length of the period during which no signal is active on TLX
 reg [63:00] REG_debug_axi_idle_lim     ; // length of the period during which no signal is active on AXI

//------------ REG_FIR_BASE_ADDR ----------------
 reg [63:00] REG_fir_fifo_overflow      ; // collection of FIFO overflow indicators
 reg [63:00] REG_fir_tlx_interface      ; // submit more commands than credits to TLX


//=================================================================================================================
//              SNAP REGISTERS ADDRESSES
//=================================================================================================================
 parameter REG_SNAP_BASE_ADDR   = 13'h0000,
                REG_SNAP_OFFSET_ADDR_IVR            = 8'h0 , //RO
                REG_SNAP_OFFSET_ADDR_BDR            = 8'h8 , //RO
                REG_SNAP_OFFSET_ADDR_SCR            = 8'h10, //WO
                REG_SNAP_OFFSET_ADDR_SSR            = 8'h18, //RO
                REG_SNAP_OFFSET_ADDR_CAP            = 8'h30, //RO
                REG_SNAP_OFFSET_ADDR_FRT            = 8'h40, //RO
                REG_SNAP_OFFSET_ADDR_USR            = 8'h50, //RO
                REG_SNAP_OFFSET_ADDR_PRC            = 8'h60, //RO

           REG_DEBUG_BASE_ADDR  = 13'h01A0,
                REG_DEBUG_OFFSET_ADDR_DBG_CLR       = 8'h00, //WO, self-clear
                REG_DEBUG_OFFSET_ADDR_CNT_TLX_CMD   = 8'h08, //RO
                REG_DEBUG_OFFSET_ADDR_CNT_TLX_RSP   = 8'h10, //RO
                REG_DEBUG_OFFSET_ADDR_CNT_TLX_RTY   = 8'h18, //RO
                REG_DEBUG_OFFSET_ADDR_CNT_TLX_FAIL  = 8'h20, //RO
                REG_DEBUG_OFFSET_ADDR_CNT_TLX_XLP   = 8'h28, //RO
                REG_DEBUG_OFFSET_ADDR_CNT_TLX_XLD   = 8'h30, //RO
                REG_DEBUG_OFFSET_ADDR_CNT_TLX_XLR   = 8'h38, //RO
                REG_DEBUG_OFFSET_ADDR_CNT_AXI_CMD   = 8'h40, //RO
                REG_DEBUG_OFFSET_ADDR_CNT_AXI_RSP   = 8'h48, //RO
                REG_DEBUG_OFFSET_ADDR_BUF_CNT       = 8'h50, //RO
                REG_DEBUG_OFFSET_ADDR_TRAFFIC_IDLE  = 8'h58, //RO
                REG_DEBUG_OFFSET_ADDR_TLX_IDLE_LIM  = 8'h60,
                REG_DEBUG_OFFSET_ADDR_AXI_IDLE_LIM  = 8'h68,

           REG_FIR_BASE_ADDR    = 13'h01C0,
                REG_SNAP_OFFSET_ADDR_FIFO_OVFL      = 8'h0 , //RO
                REG_SNAP_OFFSET_ADDR_TLX_INTRFC     = 8'h8 ; //RO



//---- action access: 4B; SNAP access: 8B ----
 wire data_width_incompatible = (mmio_rd || mmio_wr) && ((mmio_addr[ACTION_ACCESS_BIT] && mmio_dw) || (~mmio_addr[ACTION_ACCESS_BIT] && ~mmio_dw));

//---- validated action and SNAP access ----
 wire action_access = mmio_addr[ACTION_ACCESS_BIT];
 wire snap_access = ~mmio_addr[ACTION_ACCESS_BIT];

//---- extract base and offset addresses for SNAP register set ----
 wire[SNAP_BASE_START_BIT   - SNAP_BASE_END_BIT   : 0] snap_base_addr;
 wire[SNAP_OFFSET_START_BIT - SNAP_OFFSET_END_BIT : 0] snap_offset_addr;
 assign snap_base_addr   = mmio_addr[SNAP_BASE_START_BIT  : SNAP_BASE_END_BIT];
 assign snap_offset_addr = mmio_addr[SNAP_OFFSET_START_BIT: SNAP_OFFSET_END_BIT];


 reg waddr_decode_error, raddr_decode_error;
 reg snap_wr_ack, snap_rd_ack;

//---- action write/read valid pulse ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       lcl_wr <= 1'b0;
       lcl_rd <= 1'b0;
     end
   else if(action_access)
     begin
       lcl_wr <= mmio_wr;
       lcl_rd <= mmio_rd;
     end

//---- action register address ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     lcl_addr <= 32'd0;
   else
     lcl_addr <= {1'b0,mmio_addr[30:0]}; //Lower 31bits are transfered to Action. 

//---- action write data ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     lcl_din <= 32'd0;
   else
     lcl_din <= mmio_addr[2]? mmio_din[63:32] : mmio_din[31:0];

//---- return failure when... ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     mmio_failed <= 1'b0;
   else
     mmio_failed <= (data_width_incompatible )                        ||  // 1. access with unwarrented data widths
                    ((lcl_ack || lcl_dv) && (lcl_rsp == 1'b0))        ||  // 2. receive bad response from action
                    (snap_wr_ack && waddr_decode_error)               ||  // 3. not able to locate defined SNAP register, or access illegally
                    (snap_rd_ack && raddr_decode_error);

//---- return done when... ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     mmio_done <= 1'b0;
   else
     mmio_done <= ((lcl_ack || lcl_dv) && (lcl_rsp == 1'b1)) || // 1. receive good response from action
                  (snap_wr_ack && ~waddr_decode_error)       || // 2. done with SNAP register access
                  (snap_rd_ack && ~raddr_decode_error);


//---- READ ONLY registers configuration ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       // REG_SNAP_BASE_ADDR
       REG_implementation_vertion  <= 64'd0;
       REG_build_date              <= 64'd0;
       REG_status                  <= 64'd0;
       REG_capability              <= 64'd0;
       REG_freeruntime             <= 64'd0;
       REG_usercode                <= 64'd0;
       REG_prcode                  <= 64'd0;

       // REG_DEBUG_BASE_ADDR
       REG_debug_tlx_cnt_cmd       <= 64'd0; 
       REG_debug_tlx_cnt_rsp       <= 64'd0;
       REG_debug_tlx_cnt_retry     <= 64'd0;
       REG_debug_tlx_cnt_fail      <= 64'd0;
       REG_debug_tlx_cnt_xlt_pd    <= 64'd0;
       REG_debug_tlx_cnt_xlt_done  <= 64'd0;
       REG_debug_tlx_cnt_xlt_retry <= 64'd0;
       REG_debug_axi_cnt_cmd       <= 64'd0;
       REG_debug_axi_cnt_rsp       <= 64'd0;
       REG_debug_buf_cnt           <= 64'd0;
       REG_debug_traffic_idle      <= 64'd0;

       // REG_FIR_BASE_ADDR
       REG_fir_fifo_overflow       <= 64'd0;
       REG_fir_tlx_interface       <= 64'd0;
     end
   else
     begin
       // REG_SNAP_BASE_ADDR
       REG_implementation_vertion  <= `IMP_VERSION_DAT;
       REG_build_date              <= `BUILD_DATE_DAT;
       REG_status                  <= {60'd0, snap_fatal_error, snap_axi_busy, snap_tlx_busy, snap_idle};
       REG_capability [39:36]      <= `DMA_XFER_SIZE;
       REG_capability [35:32]      <= `DMA_ALIGNMENT;
       REG_capability [31:16]      <= `SDRAM_SIZE;
       REG_capability [8]          <= NVME_ENABLED;
       REG_capability [7:0]        <= `CARD_TYPE;
       REG_freeruntime             <= REG_freeruntime+1;
       REG_usercode                <= `USERCODE;
       REG_prcode                  <= `PRCODE;



       // REG_DEBUG_BASE_ADDR
       REG_debug_tlx_cnt_cmd       <= debug_tlx_cnt_cmd      ; 
       REG_debug_tlx_cnt_rsp       <= debug_tlx_cnt_rsp      ;
       REG_debug_tlx_cnt_retry     <= debug_tlx_cnt_retry    ;
       REG_debug_tlx_cnt_fail      <= debug_tlx_cnt_fail     ;
       REG_debug_tlx_cnt_xlt_pd    <= debug_tlx_cnt_xlt_pd   ;
       REG_debug_tlx_cnt_xlt_done  <= debug_tlx_cnt_xlt_done ;
       REG_debug_tlx_cnt_xlt_retry <= debug_tlx_cnt_xlt_retry;
       REG_debug_axi_cnt_cmd       <= debug_axi_cnt_cmd      ;
       REG_debug_axi_cnt_rsp       <= debug_axi_cnt_rsp      ;
       REG_debug_buf_cnt           <= debug_buf_cnt          ;
       REG_debug_traffic_idle      <= debug_traffic_idle     ;

       // REG_FIR_BASE_ADDR
       REG_fir_fifo_overflow       <= fir_fifo_overflow      ;
       REG_fir_tlx_interface       <= fir_tlx_interface      ;
     end


//---- SNAP write only/write read REGISTER writing ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       REG_command            <= 64'd0;
       REG_debug_clear        <= 64'd0;
       REG_debug_tlx_idle_lim <= 64'd0;
       REG_debug_axi_idle_lim <= 64'd0;

       waddr_decode_error <= 1'b0;
     end

   else if(snap_access && mmio_wr)
     case(snap_base_addr)

       REG_SNAP_BASE_ADDR :
          case(snap_offset_addr)
            REG_SNAP_OFFSET_ADDR_SCR           : REG_command <= mmio_din;
            default                            : waddr_decode_error <= 1'b1;
          endcase

       REG_DEBUG_BASE_ADDR :
          case(snap_offset_addr)
            REG_DEBUG_OFFSET_ADDR_DBG_CLR      : REG_debug_clear        <= mmio_din;
            REG_DEBUG_OFFSET_ADDR_TLX_IDLE_LIM : REG_debug_tlx_idle_lim <= mmio_din;
            REG_DEBUG_OFFSET_ADDR_AXI_IDLE_LIM : REG_debug_axi_idle_lim <= mmio_din;
            default                            : waddr_decode_error <= 1'b1;
          endcase

       default                                 : waddr_decode_error <= 1'b1;
     endcase
   else
     begin
       REG_debug_clear <= 64'd0;
       REG_command     <= 64'd0;

       waddr_decode_error <= 1'b0;
     end

 always@(posedge clk)
   begin
   end


//---- SNAP/ACTION REGISTER reading ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       mmio_dout <= 64'd0;
       raddr_decode_error <= 1'b0;
     end

   // read value from action registers and place it in correct half for TLX
   else if(lcl_dv)
     begin
       mmio_dout <= mmio_addr[2]? {lcl_dout, 32'd0} : {32'd0, lcl_dout};
       raddr_decode_error <= 1'b0;
     end

   // read from SNAP registers
   else if (snap_access) begin
     case(snap_base_addr)

       REG_SNAP_BASE_ADDR :
          case(snap_offset_addr)
            REG_SNAP_OFFSET_ADDR_IVR             : mmio_dout <= REG_implementation_vertion;
            REG_SNAP_OFFSET_ADDR_SCR             : mmio_dout <= REG_command;
            REG_SNAP_OFFSET_ADDR_BDR             : mmio_dout <= REG_build_date            ;
            REG_SNAP_OFFSET_ADDR_SSR             : mmio_dout <= REG_status                ;
            REG_SNAP_OFFSET_ADDR_CAP             : mmio_dout <= REG_capability            ;
            REG_SNAP_OFFSET_ADDR_FRT             : mmio_dout <= REG_freeruntime           ;
            REG_SNAP_OFFSET_ADDR_USR             : mmio_dout <= REG_usercode              ;
            REG_SNAP_OFFSET_ADDR_PRC             : mmio_dout <= REG_prcode                ;
            default                              : raddr_decode_error <= 1'b1;
          endcase

       REG_DEBUG_BASE_ADDR :
          case(snap_offset_addr)
            REG_DEBUG_OFFSET_ADDR_CNT_TLX_CMD   : mmio_dout <= REG_debug_tlx_cnt_cmd      ;
            REG_DEBUG_OFFSET_ADDR_CNT_TLX_RSP   : mmio_dout <= REG_debug_tlx_cnt_rsp      ;
            REG_DEBUG_OFFSET_ADDR_CNT_TLX_RTY   : mmio_dout <= REG_debug_tlx_cnt_retry    ;
            REG_DEBUG_OFFSET_ADDR_CNT_TLX_FAIL  : mmio_dout <= REG_debug_tlx_cnt_fail     ;
            REG_DEBUG_OFFSET_ADDR_CNT_TLX_XLP   : mmio_dout <= REG_debug_tlx_cnt_xlt_pd   ;
            REG_DEBUG_OFFSET_ADDR_CNT_TLX_XLD   : mmio_dout <= REG_debug_tlx_cnt_xlt_done ;
            REG_DEBUG_OFFSET_ADDR_CNT_TLX_XLR   : mmio_dout <= REG_debug_tlx_cnt_xlt_retry;
            REG_DEBUG_OFFSET_ADDR_CNT_AXI_CMD   : mmio_dout <= REG_debug_axi_cnt_cmd      ;
            REG_DEBUG_OFFSET_ADDR_CNT_AXI_RSP   : mmio_dout <= REG_debug_axi_cnt_rsp      ;
            REG_DEBUG_OFFSET_ADDR_BUF_CNT       : mmio_dout <= REG_debug_buf_cnt          ;
            REG_DEBUG_OFFSET_ADDR_TRAFFIC_IDLE  : mmio_dout <= REG_debug_traffic_idle     ;
            REG_DEBUG_OFFSET_ADDR_TLX_IDLE_LIM  : mmio_dout <= REG_debug_tlx_idle_lim     ;
            REG_DEBUG_OFFSET_ADDR_AXI_IDLE_LIM  : mmio_dout <= REG_debug_axi_idle_lim     ;
            default                             : raddr_decode_error <= 1'b1;
          endcase

       REG_FIR_BASE_ADDR :
          case(snap_offset_addr)
            REG_SNAP_OFFSET_ADDR_FIFO_OVFL      : mmio_dout <= REG_fir_fifo_overflow       ;
            REG_SNAP_OFFSET_ADDR_TLX_INTRFC     : mmio_dout <= REG_fir_tlx_interface       ;
            default                             : raddr_decode_error <= 1'b1;
          endcase

       default                                  : raddr_decode_error <= 1'b1;
     endcase
   end

//---- SNAP registers acknowledgement ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       snap_wr_ack <= 1'b0;
       snap_rd_ack <= 1'b0;
     end
   else
     begin
       snap_wr_ack <= mmio_wr && snap_access;
       snap_rd_ack <= mmio_rd && snap_access;
     end

//---- local control signals output ----
 reg [3:0] snap_reset_cnt;
 reg [3:0] action_reset_cnt;
 always@(posedge clk or negedge rst_n)   // soft reset lasts 16 cycles
   if(~rst_n)
     soft_reset_brdg_odma <= 1'b0;
   else if(&snap_reset_cnt)
     soft_reset_brdg_odma <= 1'b0;
   else if(REG_command[0])
     soft_reset_brdg_odma <= 1'b1;

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     snap_reset_cnt <= 4'd0;
   else if(soft_reset_brdg_odma)
     snap_reset_cnt <= snap_reset_cnt + 4'd1;

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     soft_reset_action <= 1'b0;
   else if(&action_reset_cnt)
     soft_reset_action <= 1'b0;
   else if(REG_command[0])
     soft_reset_action <= 1'b1;

 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     action_reset_cnt <= 4'd0;
   else if(soft_reset_action)
     action_reset_cnt <= action_reset_cnt + 4'd1;

 assign debug_cnt_clear    = REG_debug_clear[0];
 assign debug_tlx_idle_lim = REG_debug_tlx_idle_lim;
 assign debug_axi_idle_lim = REG_debug_axi_idle_lim;

//---- local status signals generation ----
 always@(posedge clk or negedge rst_n)
   if(~rst_n)
     begin
       snap_idle        <= 1'b0;
       snap_tlx_busy    <= 1'b0;
       snap_axi_busy    <= 1'b0;
       snap_fatal_error <= 1'b0;
     end
   else
     begin
       snap_idle        <= (debug_buf_cnt == 64'd0); // SNAP considered in IDLE when both data BUF are empty
       snap_tlx_busy    <= (debug_tlx_cnt_cmd != debug_tlx_cnt_rsp); // only count read and write command/response pair, not viable for split responses
       snap_axi_busy    <= (debug_axi_cnt_cmd != debug_axi_cnt_rsp);
       snap_fatal_error <= |{fir_fifo_overflow, fir_tlx_interface};
     end


endmodule
