// This program was cloned from: https://github.com/OpenCAPI/ThymesisFlow
// License: Apache License 2.0

// *!***************************************************************************
// *! Copyright 2019 International Business Machines
// *!
// *! Licensed under the Apache License, Version 2.0 (the "License");
// *! you may not use this file except in compliance with the License.
// *! You may obtain a copy of the License at
// *! http://www.apache.org/licenses/LICENSE-2.0 
// *!
// *! The patent license granted to you in Section 3 of the License, as applied
// *! to the "Work," hereby includes implementations of the Work in physical form.  
// *!
// *! Unless required by applicable law or agreed to in writing, the reference design
// *! distributed under the License is distributed on an "AS IS" BASIS,
// *! WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// *! See the License for the specific language governing permissions and
// *! limitations under the License.
// *! 
// *! The background Specification upon which this is based is managed by and available from
// *! the OpenCAPI Consortium.  More information can be found at https://opencapi.org. 
// *!***************************************************************************
`timescale 1ns / 1ps

module oc_fpga_top (

  // -- Reset
    input                 ocde
   ,input                 freerun_clk_p
   ,input                 freerun_clk_n

  // -- Phy Interface
   ,output                ch0_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch0_gtytxp_out     // -- XLX PHY transmit channels
   ,output                ch1_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch1_gtytxp_out     // -- XLX PHY transmit channels
   ,output                ch2_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch2_gtytxp_out     // -- XLX PHY transmit channels
   ,output                ch3_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch3_gtytxp_out     // -- XLX PHY transmit channels
   ,output                ch4_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch4_gtytxp_out     // -- XLX PHY transmit channels
   ,output                ch5_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch5_gtytxp_out     // -- XLX PHY transmit channels
   ,output                ch6_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch6_gtytxp_out     // -- XLX PHY transmit channels
   ,output                ch7_gtytxn_out     // -- XLX PHY transmit channels
   ,output                ch7_gtytxp_out     // -- XLX PHY transmit channels

   ,input                 ch0_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch0_gtyrxp_in      // -- XLX PHY receive channels
   ,input                 ch1_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch1_gtyrxp_in      // -- XLX PHY receive channels
   ,input                 ch2_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch2_gtyrxp_in      // -- XLX PHY receive channels
   ,input                 ch3_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch3_gtyrxp_in      // -- XLX PHY receive channels
   ,input                 ch4_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch4_gtyrxp_in      // -- XLX PHY receive channels
   ,input                 ch5_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch5_gtyrxp_in      // -- XLX PHY receive channels
   ,input                 ch6_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch6_gtyrxp_in      // -- XLX PHY receive channels
   ,input                 ch7_gtyrxn_in      // -- XLX PHY receive channels
   ,input                 ch7_gtyrxp_in      // -- XLX PHY receive channels

   ,input                 mgtrefclk1_x0y0_p  // -- XLX PHY transcieve clocks 156.25 MHz
   ,input                 mgtrefclk1_x0y0_n  // -- XLX PHY transcieve clocks 156.25 MHz
   ,input                 mgtrefclk1_x0y1_p  // -- XLX PHY transcieve clocks 156.25 MHz
   ,input                 mgtrefclk1_x0y1_n  // -- XLX PHY transcieve clocks 156.25 MHz

`ifdef FLASH
   ,inout  FPGA_FLASH_CE2_L       // To/From FLASH of flash_sub_system.v
   ,inout  FPGA_FLASH_DQ4         // To/From FLASH of flash_sub_system.v
   ,inout  FPGA_FLASH_DQ5         // To/From FLASH of flash_sub_system.v
   ,inout  FPGA_FLASH_DQ6         // To/From FLASH of flash_sub_system.v
   ,inout  FPGA_FLASH_DQ7         // To/From FLASH of flash_sub_system.v
`endif
  // -- Interface between VPD Stub to external VPD EEPROM

   //QSFP GTY FPGA pins and reference clock coming from top and constraints file
   ,input              QSFP0_REF_CLK_N
   ,input              QSFP0_REF_CLK_P
   ,input  [0:3]       QSFP0_RX_N
   ,input  [0:3]       QSFP0_RX_P
   ,output [0:3]       QSFP0_TX_N
   ,output [0:3]       QSFP0_TX_P
   ,input              QSFP1_REF_CLK_N
   ,input              QSFP1_REF_CLK_P
   ,input  [0:3]       QSFP1_RX_N
   ,input  [0:3]       QSFP1_RX_P
   ,output [0:3]       QSFP1_TX_N
   ,output [0:3]       QSFP1_TX_P

  );

wire           clock_afu; //-- Frequency = clock_tlx/2
wire           clock_tlx;
wire           reset_n;
wire   [4:0]   ro_device;
wire   [31:0]  ro_dlx0_version;
wire   [31:0]  ro_tlx0_version;
wire           tlx_afu_ready;
wire   [6:0]   afu_tlx_cmd_initial_credit;
wire           afu_tlx_cmd_credit;
wire           tlx_afu_cmd_valid;
wire   [7:0]   tlx_afu_cmd_opcode;
wire   [1:0]   tlx_afu_cmd_dl;
wire           tlx_afu_cmd_end;
wire   [63:0]  tlx_afu_cmd_pa;
wire   [3:0]   tlx_afu_cmd_flag;
wire           tlx_afu_cmd_os;
wire   [15:0]  tlx_afu_cmd_capptag;
wire   [2:0]   tlx_afu_cmd_pl;
wire   [63:0]  tlx_afu_cmd_be;
wire   [6:0]   afu_tlx_resp_initial_credit;
wire           afu_tlx_resp_credit;
wire           tlx_afu_resp_valid;
wire   [7:0]   tlx_afu_resp_opcode;
wire   [15:0]  tlx_afu_resp_afutag;
wire   [3:0]   tlx_afu_resp_code;
wire   [5:0]   tlx_afu_resp_pg_size;
wire   [1:0]   tlx_afu_resp_dl;
wire   [1:0]   tlx_afu_resp_dp;
wire   [23:0]  tlx_afu_resp_host_tag;
wire   [3:0]   tlx_afu_resp_cache_state;
wire   [17:0]  tlx_afu_resp_addr_tag;
wire           afu_tlx_cmd_rd_req;
wire   [2:0]   afu_tlx_cmd_rd_cnt;
wire           tlx_afu_cmd_data_valid;
wire           tlx_afu_cmd_data_bdi;
wire   [511:0] tlx_afu_cmd_data_bus;
wire           afu_tlx_resp_rd_req;
wire   [2:0]   afu_tlx_resp_rd_cnt;
wire           tlx_afu_resp_data_valid;
wire           tlx_afu_resp_data_bdi;
wire   [511:0] tlx_afu_resp_data_bus;
wire           cfg0_tlx_xmit_tmpl_config_0;
wire           cfg0_tlx_xmit_tmpl_config_1;
wire           cfg0_tlx_xmit_tmpl_config_2;
wire           cfg0_tlx_xmit_tmpl_config_3;
wire   [3:0]   cfg0_tlx_xmit_rate_config_0;
wire   [3:0]   cfg0_tlx_xmit_rate_config_1;
wire   [3:0]   cfg0_tlx_xmit_rate_config_2;
wire   [3:0]   cfg0_tlx_xmit_rate_config_3;
wire           tlx_cfg0_in_rcv_tmpl_capability_0;
wire           tlx_cfg0_in_rcv_tmpl_capability_1;
wire           tlx_cfg0_in_rcv_tmpl_capability_2;
wire           tlx_cfg0_in_rcv_tmpl_capability_3;
wire   [3:0]   tlx_cfg0_in_rcv_rate_capability_0;
wire   [3:0]   tlx_cfg0_in_rcv_rate_capability_1;
wire   [3:0]   tlx_cfg0_in_rcv_rate_capability_2;
wire   [3:0]   tlx_cfg0_in_rcv_rate_capability_3;
wire   [3:0]   tlx_afu_cmd_initial_credit;
wire   [3:0]   tlx_afu_resp_initial_credit;
wire   [5:0]   tlx_afu_cmd_data_initial_credit;
wire   [5:0]   tlx_afu_resp_data_initial_credit;
wire           tlx_afu_cmd_credit;
wire           afu_tlx_cmd_valid;
wire   [7:0]   afu_tlx_cmd_opcode;
wire   [11:0]  afu_tlx_cmd_actag;
wire   [3:0]   afu_tlx_cmd_stream_id;
wire   [67:0]  afu_tlx_cmd_ea_or_obj;
wire   [15:0]  afu_tlx_cmd_afutag;
wire   [1:0]   afu_tlx_cmd_dl;
wire   [2:0]   afu_tlx_cmd_pl;
wire           afu_tlx_cmd_os;
wire   [63:0]  afu_tlx_cmd_be;
wire   [3:0]   afu_tlx_cmd_flag;
wire           afu_tlx_cmd_endian;
wire   [15:0]  afu_tlx_cmd_bdf;
wire   [19:0]  afu_tlx_cmd_pasid;
wire   [5:0]   afu_tlx_cmd_pg_size;
wire           tlx_afu_cmd_data_credit;
wire           afu_tlx_cdata_valid;
wire   [511:0] afu_tlx_cdata_bus;
wire           afu_tlx_cdata_bdi;
wire           tlx_afu_resp_credit;
wire           afu_tlx_resp_valid;
wire   [7:0]   afu_tlx_resp_opcode;
wire   [1:0]   afu_tlx_resp_dl;
wire   [15:0]  afu_tlx_resp_capptag;
wire   [1:0]   afu_tlx_resp_dp;
wire   [3:0]   afu_tlx_resp_code;
wire           tlx_afu_resp_data_credit;
wire           afu_tlx_rdata_valid;
wire   [511:0] afu_tlx_rdata_bus;
wire           afu_tlx_rdata_bdi;
wire           tlx_cfg0_valid;
wire   [7:0]   tlx_cfg0_opcode;
wire   [63:0]  tlx_cfg0_pa;
wire           tlx_cfg0_t;
wire   [2:0]   tlx_cfg0_pl;
wire   [15:0]  tlx_cfg0_capptag;
wire   [31:0]  tlx_cfg0_data_bus;
wire           tlx_cfg0_data_bdi;
wire   [3:0]   cfg0_tlx_initial_credit;
wire           cfg0_tlx_credit_return;
wire           cfg0_tlx_resp_valid;
wire   [7:0]   cfg0_tlx_resp_opcode;
wire   [15:0]  cfg0_tlx_resp_capptag;
wire   [3:0]   cfg0_tlx_resp_code;
wire   [3:0]   cfg0_tlx_rdata_offset;
wire   [31:0]  cfg0_tlx_rdata_bus;
wire           cfg0_tlx_rdata_bdi;
wire           tlx_cfg0_resp_ack;
wire           cfg_f1_octrl00_resync_credits;
wire   [14:0]  cfg_vpd_addr;
wire           cfg_vpd_wren;
wire   [31:0]  cfg_vpd_wdata;
wire           cfg_vpd_rden;
wire   [31:0]  vpd_cfg_rdata;
wire           vpd_cfg_done;
wire           vpd_err_unimplemented_addr;
wire   [1:0]   cfg_flsh_devsel;
wire   [13:0]  cfg_flsh_addr;
wire           cfg_flsh_wren;
wire   [31:0]  cfg_flsh_wdata;
wire           cfg_flsh_rden;
wire   [31:0]  flsh_cfg_rdata;
wire           flsh_cfg_done;
wire   [7:0]   flsh_cfg_status;
wire   [1:0]   flsh_cfg_bresp;
wire   [1:0]   flsh_cfg_rresp;
wire           cfg_flsh_expand_enable;
wire           cfg_flsh_expand_dir;


//oc_function wires

// ==============================================================================================================================
// @@@  PARM: Parameters
// ==============================================================================================================================
// There are none on this design.


// ==============================================================================================================================
// @@@  SIG: Internal signals 
// ==============================================================================================================================
wire   reset;
assign reset = ~reset_n;  // Create positive active version of reset

//free running clock to kick start the network facing transceivers.
wire clock_free_running_100;
// ****************************
// * CONFIGURATION SUB-SYSTEM *
// ****************************

// ==============================================================================================================================
// @@@ CFG_CMDFIFO: Buffer a number of config_* commands to remove them from the head of the TLX command queue
// ==============================================================================================================================

// --- Port 0 ---

//assign cfg0_tlx_initial_credit = 4'b0000;   // Command FIFO manages initial credits via pulsed credit return signal

// Signals to connect CMD FIFO to CMD SEQ
  //wire  [7:0] cfg0_cff_cmd_opcode;
  //wire [31:0] cfg0_cff_cmd_pa;               // Per OpenCAPI TL spec, pa[63:32] are 'reserved' so don't use them to conserve FPGA resources
  //wire [15:0] cfg0_cff_cmd_capptag;
  //wire        cfg0_cff_cmd_t;
  //wire  [2:0] cfg0_cff_cmd_pl;
  //wire        cfg0_cff_data_bdi;
  //wire [31:0] cfg0_cff_data_bus;
  //wire        cfg0_cff_cmd_valid;           // Internal version of tlx_afu_cmd_valid
  wire        cfg0_cff_fifo_overflow;        // Added to internal error vector sent to MMIO logic 
  //wire        cfg0_cmd_dispatched;           // Pulsed to 1 when command is complete or sent into the pipeline
// ==============================================================================================================================
// @@@ CFG_SEQ: Choose a command and execute it
// ==============================================================================================================================

// Signals distributing Bus / Device numbers
  wire  [7:0] cfg0_bus_num;                
  wire  [4:0] cfg0_device_num;


// Signals from CFG SEQ to RESP FIFO port 0
//  wire        cfg0_rff_resp_valid         // Pulse to 1 when response and/or resp data is available for loading into response FIFO
//;  wire  [7:0] cfg0_rff_resp_opcode
//; wire  [3:0] cfg0_rff_resp_code
//wire  [1:0] cfg0_rff_resp_dl
//wire  [1:0] cfg0_rff_resp_dp
//; wire [15:0] cfg0_rff_resp_capptag
//; wire  [3:0] cfg0_rff_rdata_offset
//; wire        cfg0_rff_rdata_bdi
//; wire [31:0] cfg0_rff_rdata_bus
//; wire [3:0]  cfg0_rff_buffers_available  // For information only, rffcr_buffers_available is used to determine space available 

// CFG_SEQ -> CFG_F* Functional Interface
  wire   [2:0] cfg_function
; wire   [1:0] cfg_portnum                  
; wire  [11:0] cfg_addr                     
; wire  [31:0] cfg_wdata                    
//; wire  [31:0] cfg_f0_rdata                 // CFG_F0 outputs                              
//; wire         cfg_f0_rdata_vld             
; wire  [31:0] cfg_f1_rdata                 // CFG_F1 outputs                              
; wire         cfg_f1_rdata_vld             
; wire         cfg_wr_1B                    
; wire         cfg_wr_2B                    
; wire         cfg_wr_4B                    
; wire         cfg_rd                       
//; wire         cfg_f0_bad_op_or_align       // CFG_F0 outputs 
//; wire         cfg_f0_addr_not_implemented  
; wire         cfg_f1_bad_op_or_align       // CFG_F1 outputs 
; wire         cfg_f1_addr_not_implemented  
; wire [127:0] cfg_errvec
; wire         cfg_errvec_valid
;

/*
// Combine sources from multiple Functions
  wire  [31:0] cfg_rdata
; wire         cfg_rdata_vld
; wire         cfg_bad_op_or_align
; wire         cfg_addr_not_implemented
;
assign cfg_rdata                = cfg_f0_rdata                | cfg_f1_rdata;                  // Functions not targeted return 0
assign cfg_rdata_vld            = cfg_f0_rdata_vld            | cfg_f1_rdata_vld;              // Functions not targeted return 0
assign cfg_bad_op_or_align      = cfg_f0_bad_op_or_align      | cfg_f1_bad_op_or_align;        // Functions not targeted return 0
assign cfg_addr_not_implemented = cfg_f0_addr_not_implemented & cfg_f1_addr_not_implemented;   // Not implemented if ALL functions say so
*/

// ==============================================================================================================================
// @@@ CFG_RESPFIFO: Buffer a number of config_* responses allowing config_* ops to occur as fast as possible
// ==============================================================================================================================

// --- Port 0 ---

wire cfg0_rff_fifo_overflow;       // Added to internal error vector sent to MMIO logic 
// ==============================================================================================================================
// @@@ CFG_0: Function 0 Capability Structures (contains no AFUs)
// ==============================================================================================================================

// Declare F0 outputs
//  wire         cfg_f0_csh_memory_space
//; wire  [63:0] cfg_f0_csh_mmio_bar0
//; wire  [63:0] cfg_f0_csh_mmio_bar1
//; wire  [63:0] cfg_f0_csh_mmio_bar2
//; wire  [31:0] cfg_f0_csh_expansion_ROM_bar 
//; wire         cfg_f0_csh_expansion_ROM_enable
//; wire   [7:0] cfg_f0_otl0_tl_major_vers_config 
//; wire   [7:0] cfg_f0_otl0_tl_minor_vers_config
  wire   [3:0] cfg_f0_otl0_long_backoff_timer
; wire   [3:0] cfg_f0_otl0_short_backoff_timer
; wire  [63:0] cfg_f0_otl0_xmt_tmpl_config
; wire [255:0] cfg_f0_otl0_xmt_rate_tmpl_config  
//; wire         cfg_f0_ofunc_function_reset      
//; wire  [11:0] cfg_f0_ofunc_func_actag_base
//; wire  [11:0] cfg_f0_ofunc_func_actag_len_enab
;

/*wire   cfg_f0_reset;
assign cfg_f0_reset = reset | cfg_f0_ofunc_function_reset;   // Apply on hardware reset OR software cmd (Function Reset)*/
// Drive template and rate configuration information back into TLX
assign cfg0_tlx_xmit_tmpl_config_3 = cfg_f0_otl0_xmt_tmpl_config[3];
assign cfg0_tlx_xmit_tmpl_config_2 = cfg_f0_otl0_xmt_tmpl_config[2];
assign cfg0_tlx_xmit_tmpl_config_1 = cfg_f0_otl0_xmt_tmpl_config[1];
assign cfg0_tlx_xmit_tmpl_config_0 = cfg_f0_otl0_xmt_tmpl_config[0];

assign cfg0_tlx_xmit_rate_config_3 = cfg_f0_otl0_xmt_rate_tmpl_config[3*4+3 : 3*4];
assign cfg0_tlx_xmit_rate_config_2 = cfg_f0_otl0_xmt_rate_tmpl_config[2*4+3 : 2*4];
assign cfg0_tlx_xmit_rate_config_1 = cfg_f0_otl0_xmt_rate_tmpl_config[1*4+3 : 1*4];
assign cfg0_tlx_xmit_rate_config_0 = cfg_f0_otl0_xmt_rate_tmpl_config[0*4+3 : 0*4];
// ***************************
// * NON-CONFIGURATION LOGIC *
// ***************************

  wire           cfg_f1_octrl00_fence_afu    // Driven by FUNC1 inside lpc_func

; wire           fen_afu_ready               
; wire   [  6:0] afu_fen_cmd_initial_credit       
; wire           afu_fen_cmd_credit           
; wire           fen_afu_cmd_valid             
; wire   [  7:0] fen_afu_cmd_opcode                
; wire   [  1:0] fen_afu_cmd_dl                      
; wire           fen_afu_cmd_end                     
; wire   [ 63:0] fen_afu_cmd_pa                    
; wire   [  3:0] fen_afu_cmd_flag                   
; wire           fen_afu_cmd_os                    
; wire   [ 15:0] fen_afu_cmd_capptag                    
; wire   [  2:0] fen_afu_cmd_pl                     
; wire   [ 63:0] fen_afu_cmd_be                        
; wire   [  6:0] afu_fen_resp_initial_credit           
; wire           afu_fen_resp_credit               
; wire           fen_afu_resp_valid                
; wire   [  7:0] fen_afu_resp_opcode                
; wire   [ 15:0] fen_afu_resp_afutag                 
; wire   [  3:0] fen_afu_resp_code                    
; wire   [  5:0] fen_afu_resp_pg_size            
; wire   [  1:0] fen_afu_resp_dl                       
; wire   [  1:0] fen_afu_resp_dp                       
; wire   [ 23:0] fen_afu_resp_host_tag                 
; wire   [  3:0] fen_afu_resp_cache_state        
; wire   [ 17:0] fen_afu_resp_addr_tag           
; wire           afu_fen_cmd_rd_req                   
; wire   [  2:0] afu_fen_cmd_rd_cnt                    
; wire           fen_afu_cmd_data_valid          
; wire           fen_afu_cmd_data_bdi            
; wire   [511:0] fen_afu_cmd_data_bus                 
; wire           afu_fen_resp_rd_req                   
; wire   [  2:0] afu_fen_resp_rd_cnt                  
; wire           fen_afu_resp_data_valid             
; wire           fen_afu_resp_data_bdi          
; wire   [511:0] fen_afu_resp_data_bus              
; wire   [  3:0] fen_afu_cmd_initial_credit    
; wire   [  3:0] fen_afu_resp_initial_credit    
; wire   [  5:0] fen_afu_cmd_data_initial_credit        
; wire   [  5:0] fen_afu_resp_data_initial_credit        
; wire           fen_afu_cmd_credit                
; wire           afu_fen_cmd_valid                 
; wire   [  7:0] afu_fen_cmd_opcode                
; wire   [ 11:0] afu_fen_cmd_actag                 
; wire   [  3:0] afu_fen_cmd_stream_id             
; wire   [ 67:0] afu_fen_cmd_ea_or_obj             
; wire   [ 15:0] afu_fen_cmd_afutag               
; wire   [  1:0] afu_fen_cmd_dl                    
; wire   [  2:0] afu_fen_cmd_pl                    
; wire           afu_fen_cmd_os                    
; wire   [ 63:0] afu_fen_cmd_be                    
; wire   [  3:0] afu_fen_cmd_flag                  
; wire           afu_fen_cmd_endian                
; wire   [ 15:0] afu_fen_cmd_bdf                                      
; wire   [ 19:0] afu_fen_cmd_pasid                 
; wire   [  5:0] afu_fen_cmd_pg_size               
; wire           fen_afu_cmd_data_credit           
; wire           afu_fen_cdata_valid               
; wire   [511:0] afu_fen_cdata_bus                 
; wire           afu_fen_cdata_bdi                          
; wire           fen_afu_resp_credit               
; wire           afu_fen_resp_valid                
; wire   [  7:0] afu_fen_resp_opcode               
; wire   [  1:0] afu_fen_resp_dl   
; wire   [ 15:0] afu_fen_resp_capptag          
; wire   [  1:0] afu_fen_resp_dp                   
; wire   [  3:0] afu_fen_resp_code                 
; wire           fen_afu_resp_data_credit          
; wire           afu_fen_rdata_valid               
; wire   [511:0] afu_fen_rdata_bus                 
; wire           afu_fen_rdata_bdi                                  
;

/*wire [2612:0] fen_trace_vector;   // Bring signals to to preserve registers during Vivado synthesis
reg  [2612:0] fen_trace_vector_q; // TODO: Replace with trace buffer
always @(posedge(clock_tlx))
  fen_trace_vector_q <= fen_trace_vector;*/


// ==============================================================================================================================
// @@@ FENCE: Fence logic between TLX and AFU
// ==============================================================================================================================


oc_bsp bsp(
//-------------
//-- FPGA I/O
//-------------
  .ocde                                        (ocde                             ) //-- oc_bsp:  input  
 ,.freerun_clk_p                               (freerun_clk_p                    ) //-- oc_bsp:  input  
 ,.freerun_clk_n                               (freerun_clk_n                    ) //-- oc_bsp:  input  
 ,.ch0_gtytxn_out                              (ch0_gtytxn_out                   ) //-- oc_bsp:  output 
 ,.ch0_gtytxp_out                              (ch0_gtytxp_out                   ) //-- oc_bsp:  output 
 ,.ch1_gtytxn_out                              (ch1_gtytxn_out                   ) //-- oc_bsp:  output 
 ,.ch1_gtytxp_out                              (ch1_gtytxp_out                   ) //-- oc_bsp:  output 
 ,.ch2_gtytxn_out                              (ch2_gtytxn_out                   ) //-- oc_bsp:  output 
 ,.ch2_gtytxp_out                              (ch2_gtytxp_out                   ) //-- oc_bsp:  output 
 ,.ch3_gtytxn_out                              (ch3_gtytxn_out                   ) //-- oc_bsp:  output 
 ,.ch3_gtytxp_out                              (ch3_gtytxp_out                   ) //-- oc_bsp:  output 
 ,.ch4_gtytxn_out                              (ch4_gtytxn_out                   ) //-- oc_bsp:  output 
 ,.ch4_gtytxp_out                              (ch4_gtytxp_out                   ) //-- oc_bsp:  output 
 ,.ch5_gtytxn_out                              (ch5_gtytxn_out                   ) //-- oc_bsp:  output 
 ,.ch5_gtytxp_out                              (ch5_gtytxp_out                   ) //-- oc_bsp:  output 
 ,.ch6_gtytxn_out                              (ch6_gtytxn_out                   ) //-- oc_bsp:  output 
 ,.ch6_gtytxp_out                              (ch6_gtytxp_out                   ) //-- oc_bsp:  output 
 ,.ch7_gtytxn_out                              (ch7_gtytxn_out                   ) //-- oc_bsp:  output 
 ,.ch7_gtytxp_out                              (ch7_gtytxp_out                   ) //-- oc_bsp:  output 
 ,.ch0_gtyrxn_in                               (ch0_gtyrxn_in                    ) //-- oc_bsp:  input  
 ,.ch0_gtyrxp_in                               (ch0_gtyrxp_in                    ) //-- oc_bsp:  input  
 ,.ch1_gtyrxn_in                               (ch1_gtyrxn_in                    ) //-- oc_bsp:  input  
 ,.ch1_gtyrxp_in                               (ch1_gtyrxp_in                    ) //-- oc_bsp:  input  
 ,.ch2_gtyrxn_in                               (ch2_gtyrxn_in                    ) //-- oc_bsp:  input  
 ,.ch2_gtyrxp_in                               (ch2_gtyrxp_in                    ) //-- oc_bsp:  input  
 ,.ch3_gtyrxn_in                               (ch3_gtyrxn_in                    ) //-- oc_bsp:  input  
 ,.ch3_gtyrxp_in                               (ch3_gtyrxp_in                    ) //-- oc_bsp:  input  
 ,.ch4_gtyrxn_in                               (ch4_gtyrxn_in                    ) //-- oc_bsp:  input  
 ,.ch4_gtyrxp_in                               (ch4_gtyrxp_in                    ) //-- oc_bsp:  input  
 ,.ch5_gtyrxn_in                               (ch5_gtyrxn_in                    ) //-- oc_bsp:  input  
 ,.ch5_gtyrxp_in                               (ch5_gtyrxp_in                    ) //-- oc_bsp:  input  
 ,.ch6_gtyrxn_in                               (ch6_gtyrxn_in                    ) //-- oc_bsp:  input  
 ,.ch6_gtyrxp_in                               (ch6_gtyrxp_in                    ) //-- oc_bsp:  input  
 ,.ch7_gtyrxn_in                               (ch7_gtyrxn_in                    ) //-- oc_bsp:  input  
 ,.ch7_gtyrxp_in                               (ch7_gtyrxp_in                    ) //-- oc_bsp:  input  
 ,.mgtrefclk1_x0y0_p                           (mgtrefclk1_x0y0_p                ) //-- oc_bsp:  input  
 ,.mgtrefclk1_x0y0_n                           (mgtrefclk1_x0y0_n                ) //-- oc_bsp:  input  
 ,.mgtrefclk1_x0y1_p                           (mgtrefclk1_x0y1_p                ) //-- oc_bsp:  input  
 ,.mgtrefclk1_x0y1_n                           (mgtrefclk1_x0y1_n                ) //-- oc_bsp:  input  
`ifdef FLASH   
 ,.FPGA_FLASH_CE2_L                            (FPGA_FLASH_CE2_L                 ) //-- oc_bsp:  inout
 ,.FPGA_FLASH_DQ4                              (FPGA_FLASH_DQ4                   ) //-- oc_bsp:  inout
 ,.FPGA_FLASH_DQ5                              (FPGA_FLASH_DQ5                   ) //-- oc_bsp:  inout
 ,.FPGA_FLASH_DQ6                              (FPGA_FLASH_DQ6                   ) //-- oc_bsp:  inout
 ,.FPGA_FLASH_DQ7                              (FPGA_FLASH_DQ7                   ) //-- oc_bsp:  inout
`endif

`ifdef THYMESISFLOW
 ,.clock_free_running_100                      (clock_free_running_100           )
`endif 

//-------------
//-- AFU Ports
//-------------
 ,.clock_afu                                   (clock_afu                        )  // -- oc_bsp:  output
 ,.clock_tlx                                   (clock_tlx                        )  // -- oc_bsp:  output
 ,.reset_n                                     (reset_n                          )  // -- oc_bsp:  output                
 ,.ro_device                                   (ro_device                        )  // -- oc_bsp:  output  [4:0]         
 ,.ro_dlx_version                              (ro_dlx0_version                  )  // -- oc_bsp:  output  [31:0]        
 ,.ro_tlx_version                              (ro_tlx0_version                  )  // -- oc_bsp:  output  [31:0]        
 ,.tlx_afu_ready                               (tlx_afu_ready                    )  // -- oc_bsp:  output                
 ,.afu_tlx_cmd_initial_credit                  (afu_tlx_cmd_initial_credit       )  // -- oc_bsp:  input   [6:0]         
 ,.afu_tlx_cmd_credit                          (afu_tlx_cmd_credit               )  // -- oc_bsp:  input                 
 ,.tlx_afu_cmd_valid                           (tlx_afu_cmd_valid                )  // -- oc_bsp:  output                
 ,.tlx_afu_cmd_opcode                          (tlx_afu_cmd_opcode               )  // -- oc_bsp:  output  [7:0]         
 ,.tlx_afu_cmd_dl                              (tlx_afu_cmd_dl                   )  // -- oc_bsp:  output  [1:0]         
 ,.tlx_afu_cmd_end                             (tlx_afu_cmd_end                  )  // -- oc_bsp:  output                
 ,.tlx_afu_cmd_pa                              (tlx_afu_cmd_pa                   )  // -- oc_bsp:  output  [63:0]        
 ,.tlx_afu_cmd_flag                            (tlx_afu_cmd_flag                 )  // -- oc_bsp:  output  [3:0]         
 ,.tlx_afu_cmd_os                              (tlx_afu_cmd_os                   )  // -- oc_bsp:  output                
 ,.tlx_afu_cmd_capptag                         (tlx_afu_cmd_capptag              )  // -- oc_bsp:  output  [15:0]        
 ,.tlx_afu_cmd_pl                              (tlx_afu_cmd_pl                   )  // -- oc_bsp:  output  [2:0]         
 ,.tlx_afu_cmd_be                              (tlx_afu_cmd_be                   )  // -- oc_bsp:  output  [63:0]        
 ,.afu_tlx_resp_initial_credit                 (afu_tlx_resp_initial_credit      )  // -- oc_bsp:  input   [6:0]         
 ,.afu_tlx_resp_credit                         (afu_tlx_resp_credit              )  // -- oc_bsp:  input                 
 ,.tlx_afu_resp_valid                          (tlx_afu_resp_valid               )  // -- oc_bsp:  output                
 ,.tlx_afu_resp_opcode                         (tlx_afu_resp_opcode              )  // -- oc_bsp:  output  [7:0]         
 ,.tlx_afu_resp_afutag                         (tlx_afu_resp_afutag              )  // -- oc_bsp:  output  [15:0]        
 ,.tlx_afu_resp_code                           (tlx_afu_resp_code                )  // -- oc_bsp:  output  [3:0]         
 ,.tlx_afu_resp_pg_size                        (tlx_afu_resp_pg_size             )  // -- oc_bsp:  output  [5:0]         
 ,.tlx_afu_resp_dl                             (tlx_afu_resp_dl                  )  // -- oc_bsp:  output  [1:0]         
 ,.tlx_afu_resp_dp                             (tlx_afu_resp_dp                  )  // -- oc_bsp:  output  [1:0]         
 ,.tlx_afu_resp_host_tag                       (tlx_afu_resp_host_tag            )  // -- oc_bsp:  output  [23:0]        
 ,.tlx_afu_resp_cache_state                    (tlx_afu_resp_cache_state         )  // -- oc_bsp:  output  [3:0]         
 ,.tlx_afu_resp_addr_tag                       (tlx_afu_resp_addr_tag            )  // -- oc_bsp:  output  [17:0]        
 ,.afu_tlx_cmd_rd_req                          (afu_tlx_cmd_rd_req               )  // -- oc_bsp:  input                 
 ,.afu_tlx_cmd_rd_cnt                          (afu_tlx_cmd_rd_cnt               )  // -- oc_bsp:  input   [2:0]         
 ,.tlx_afu_cmd_data_valid                      (tlx_afu_cmd_data_valid           )  // -- oc_bsp:  output                
 ,.tlx_afu_cmd_data_bdi                        (tlx_afu_cmd_data_bdi             )  // -- oc_bsp:  output                
 ,.tlx_afu_cmd_data_bus                        (tlx_afu_cmd_data_bus             )  // -- oc_bsp:  output  [511:0]       
 ,.afu_tlx_resp_rd_req                         (afu_tlx_resp_rd_req              )  // -- oc_bsp:  input                 
 ,.afu_tlx_resp_rd_cnt                         (afu_tlx_resp_rd_cnt              )  // -- oc_bsp:  input   [2:0]         
 ,.tlx_afu_resp_data_valid                     (tlx_afu_resp_data_valid          )  // -- oc_bsp:  output                
 ,.tlx_afu_resp_data_bdi                       (tlx_afu_resp_data_bdi            )  // -- oc_bsp:  output                
 ,.tlx_afu_resp_data_bus                       (tlx_afu_resp_data_bus            )  // -- oc_bsp:  output  [511:0]       
 ,.cfg_tlx_xmit_tmpl_config_0                  (cfg0_tlx_xmit_tmpl_config_0      )  // -- oc_bsp:  input                 
 ,.cfg_tlx_xmit_tmpl_config_1                  (cfg0_tlx_xmit_tmpl_config_1      )  // -- oc_bsp:  input                 
 ,.cfg_tlx_xmit_tmpl_config_2                  (cfg0_tlx_xmit_tmpl_config_2      )  // -- oc_bsp:  input                 
 ,.cfg_tlx_xmit_tmpl_config_3                  (cfg0_tlx_xmit_tmpl_config_3      )  // -- oc_bsp:  input                 
 ,.cfg_tlx_xmit_rate_config_0                  (cfg0_tlx_xmit_rate_config_0      )  // -- oc_bsp:  input   [3:0]         
 ,.cfg_tlx_xmit_rate_config_1                  (cfg0_tlx_xmit_rate_config_1      )  // -- oc_bsp:  input   [3:0]         
 ,.cfg_tlx_xmit_rate_config_2                  (cfg0_tlx_xmit_rate_config_2      )  // -- oc_bsp:  input   [3:0]         
 ,.cfg_tlx_xmit_rate_config_3                  (cfg0_tlx_xmit_rate_config_3      )  // -- oc_bsp:  input   [3:0]         
 ,.tlx_cfg_in_rcv_tmpl_capability_0            (tlx_cfg0_in_rcv_tmpl_capability_0)  // -- oc_bsp:  output                
 ,.tlx_cfg_in_rcv_tmpl_capability_1            (tlx_cfg0_in_rcv_tmpl_capability_1)  // -- oc_bsp:  output                
 ,.tlx_cfg_in_rcv_tmpl_capability_2            (tlx_cfg0_in_rcv_tmpl_capability_2)  // -- oc_bsp:  output                
 ,.tlx_cfg_in_rcv_tmpl_capability_3            (tlx_cfg0_in_rcv_tmpl_capability_3)  // -- oc_bsp:  output                
 ,.tlx_cfg_in_rcv_rate_capability_0            (tlx_cfg0_in_rcv_rate_capability_0)  // -- oc_bsp:  output  [3:0]         
 ,.tlx_cfg_in_rcv_rate_capability_1            (tlx_cfg0_in_rcv_rate_capability_1)  // -- oc_bsp:  output  [3:0]         
 ,.tlx_cfg_in_rcv_rate_capability_2            (tlx_cfg0_in_rcv_rate_capability_2)  // -- oc_bsp:  output  [3:0]         
 ,.tlx_cfg_in_rcv_rate_capability_3            (tlx_cfg0_in_rcv_rate_capability_3)  // -- oc_bsp:  output  [3:0]         
 ,.tlx_afu_cmd_initial_credit                  (tlx_afu_cmd_initial_credit       )  // -- oc_bsp:  output  [3:0]         
 ,.tlx_afu_resp_initial_credit                 (tlx_afu_resp_initial_credit      )  // -- oc_bsp:  output  [3:0]         
 ,.tlx_afu_cmd_data_initial_credit             (tlx_afu_cmd_data_initial_credit  )  // -- oc_bsp:  output  [5:0]         
 ,.tlx_afu_resp_data_initial_credit            (tlx_afu_resp_data_initial_credit )  // -- oc_bsp:  output  [5:0]         
 ,.tlx_afu_cmd_credit                          (tlx_afu_cmd_credit               )  // -- oc_bsp:  output                
 ,.afu_tlx_cmd_valid                           (afu_tlx_cmd_valid                )  // -- oc_bsp:  input                 
 ,.afu_tlx_cmd_opcode                          (afu_tlx_cmd_opcode               )  // -- oc_bsp:  input   [7:0]         
 ,.afu_tlx_cmd_actag                           (afu_tlx_cmd_actag                )  // -- oc_bsp:  input   [11:0]        
 ,.afu_tlx_cmd_stream_id                       (afu_tlx_cmd_stream_id            )  // -- oc_bsp:  input   [3:0]         
 ,.afu_tlx_cmd_ea_or_obj                       (afu_tlx_cmd_ea_or_obj            )  // -- oc_bsp:  input   [67:0]        
 ,.afu_tlx_cmd_afutag                          (afu_tlx_cmd_afutag               )  // -- oc_bsp:  input   [15:0]        
 ,.afu_tlx_cmd_dl                              (afu_tlx_cmd_dl                   )  // -- oc_bsp:  input   [1:0]         
 ,.afu_tlx_cmd_pl                              (afu_tlx_cmd_pl                   )  // -- oc_bsp:  input   [2:0]         
 ,.afu_tlx_cmd_os                              (afu_tlx_cmd_os                   )  // -- oc_bsp:  input                 
 ,.afu_tlx_cmd_be                              (afu_tlx_cmd_be                   )  // -- oc_bsp:  input   [63:0]        
 ,.afu_tlx_cmd_flag                            (afu_tlx_cmd_flag                 )  // -- oc_bsp:  input   [3:0]         
 ,.afu_tlx_cmd_endian                          (afu_tlx_cmd_endian               )  // -- oc_bsp:  input                 
 ,.afu_tlx_cmd_bdf                             (afu_tlx_cmd_bdf                  )  // -- oc_bsp:  input   [15:0]        
 ,.afu_tlx_cmd_pasid                           (afu_tlx_cmd_pasid                )  // -- oc_bsp:  input   [19:0]        
 ,.afu_tlx_cmd_pg_size                         (afu_tlx_cmd_pg_size              )  // -- oc_bsp:  input   [5:0]         
 ,.tlx_afu_cmd_data_credit                     (tlx_afu_cmd_data_credit          )  // -- oc_bsp:  output                
 ,.afu_tlx_cdata_valid                         (afu_tlx_cdata_valid              )  // -- oc_bsp:  input                 
 ,.afu_tlx_cdata_bus                           (afu_tlx_cdata_bus                )  // -- oc_bsp:  input   [511:0]       
 ,.afu_tlx_cdata_bdi                           (afu_tlx_cdata_bdi                )  // -- oc_bsp:  input                 
 ,.tlx_afu_resp_credit                         (tlx_afu_resp_credit              )  // -- oc_bsp:  output                
 ,.afu_tlx_resp_valid                          (afu_tlx_resp_valid               )  // -- oc_bsp:  input                 
 ,.afu_tlx_resp_opcode                         (afu_tlx_resp_opcode              )  // -- oc_bsp:  input   [7:0]         
 ,.afu_tlx_resp_dl                             (afu_tlx_resp_dl                  )  // -- oc_bsp:  input   [1:0]         
 ,.afu_tlx_resp_capptag                        (afu_tlx_resp_capptag             )  // -- oc_bsp:  input   [15:0]        
 ,.afu_tlx_resp_dp                             (afu_tlx_resp_dp                  )  // -- oc_bsp:  input   [1:0]         
 ,.afu_tlx_resp_code                           (afu_tlx_resp_code                )  // -- oc_bsp:  input   [3:0]         
 ,.tlx_afu_resp_data_credit                    (tlx_afu_resp_data_credit         )  // -- oc_bsp:  output                
 ,.afu_tlx_rdata_valid                         (afu_tlx_rdata_valid              )  // -- oc_bsp:  input                 
 ,.afu_tlx_rdata_bus                           (afu_tlx_rdata_bus                )  // -- oc_bsp:  input   [511:0]       
 ,.afu_tlx_rdata_bdi                           (afu_tlx_rdata_bdi                )  // -- oc_bsp:  input                 
 ,.tlx_cfg_valid                               (tlx_cfg0_valid                   )  // -- oc_bsp:  output                
 ,.tlx_cfg_opcode                              (tlx_cfg0_opcode                  )  // -- oc_bsp:  output  [7:0]         
 ,.tlx_cfg_pa                                  (tlx_cfg0_pa                      )  // -- oc_bsp:  output  [63:0]        
 ,.tlx_cfg_t                                   (tlx_cfg0_t                       )  // -- oc_bsp:  output                
 ,.tlx_cfg_pl                                  (tlx_cfg0_pl                      )  // -- oc_bsp:  output  [2:0]         
 ,.tlx_cfg_capptag                             (tlx_cfg0_capptag                 )  // -- oc_bsp:  output  [15:0]        
 ,.tlx_cfg_data_bus                            (tlx_cfg0_data_bus                )  // -- oc_bsp:  output  [31:0]        
 ,.tlx_cfg_data_bdi                            (tlx_cfg0_data_bdi                )  // -- oc_bsp:  output                
 ,.cfg_tlx_initial_credit                      (cfg0_tlx_initial_credit          )  // -- oc_bsp:  input   [3:0]         
 ,.cfg_tlx_credit_return                       (cfg0_tlx_credit_return           )  // -- oc_bsp:  input                 
 ,.cfg_tlx_resp_valid                          (cfg0_tlx_resp_valid              )  // -- oc_bsp:  input                 
 ,.cfg_tlx_resp_opcode                         (cfg0_tlx_resp_opcode             )  // -- oc_bsp:  input   [7:0]         
 ,.cfg_tlx_resp_capptag                        (cfg0_tlx_resp_capptag            )  // -- oc_bsp:  input   [15:0]        
 ,.cfg_tlx_resp_code                           (cfg0_tlx_resp_code               )  // -- oc_bsp:  input   [3:0]         
 ,.cfg_tlx_rdata_offset                        (cfg0_tlx_rdata_offset            )  // -- oc_bsp:  input   [3:0]         
 ,.cfg_tlx_rdata_bus                           (cfg0_tlx_rdata_bus               )  // -- oc_bsp:  input   [31:0]        
 ,.cfg_tlx_rdata_bdi                           (cfg0_tlx_rdata_bdi               )  // -- oc_bsp:  input                 
 ,.tlx_cfg_resp_ack                            (tlx_cfg0_resp_ack                )  // -- oc_bsp:  output                
 ,.cfg_f1_octrl00_resync_credits               (cfg_f1_octrl00_resync_credits    )  // -- oc_bsp:  input                 
 ,.cfg_vpd_addr                                (cfg_vpd_addr                     )  // -- oc_bsp:  input   [14:0]        
 ,.cfg_vpd_wren                                (cfg_vpd_wren                     )  // -- oc_bsp:  input                 
 ,.cfg_vpd_wdata                               (cfg_vpd_wdata                    )  // -- oc_bsp:  input   [31:0]        
 ,.cfg_vpd_rden                                (cfg_vpd_rden                     )  // -- oc_bsp:  input                 
 ,.vpd_cfg_rdata                               (vpd_cfg_rdata                    )  // -- oc_bsp:  output  [31:0]        
 ,.vpd_cfg_done                                (vpd_cfg_done                     )  // -- oc_bsp:  output                
 ,.vpd_err_unimplemented_addr                  (vpd_err_unimplemented_addr       )  // -- oc_bsp:  output                
 ,.cfg_flsh_devsel                             (cfg_flsh_devsel                  )  // -- oc_bsp:  input   [1:0]         
 ,.cfg_flsh_addr                               (cfg_flsh_addr                    )  // -- oc_bsp:  input   [13:0]        
 ,.cfg_flsh_wren                               (cfg_flsh_wren                    )  // -- oc_bsp:  input                 
 ,.cfg_flsh_wdata                              (cfg_flsh_wdata                   )  // -- oc_bsp:  input   [31:0]        
 ,.cfg_flsh_rden                               (cfg_flsh_rden                    )  // -- oc_bsp:  input                 
 ,.flsh_cfg_rdata                              (flsh_cfg_rdata                   )  // -- oc_bsp:  output  [31:0]        
 ,.flsh_cfg_done                               (flsh_cfg_done                    )  // -- oc_bsp:  output                
 ,.flsh_cfg_status                             (flsh_cfg_status                  )  // -- oc_bsp:  output  [7:0]         
 ,.flsh_cfg_bresp                              (flsh_cfg_bresp                   )  // -- oc_bsp:  output  [1:0]         
 ,.flsh_cfg_rresp                              (flsh_cfg_rresp                   )  // -- oc_bsp:  output  [1:0]         
 ,.cfg_flsh_expand_enable                      (cfg_flsh_expand_enable           )  // -- oc_bsp:  input
 ,.cfg_flsh_expand_dir                         (cfg_flsh_expand_dir              )  // -- oc_bsp:  input            
);

//-- Future hierarchy implementation
//--oc_cfg cfg ();

//Cfg tieoffs
wire [31:0] f1_ro_csh_expansion_rom_bar       ;
wire [15:0] f1_ro_csh_subsystem_id            ;
wire [15:0] f1_ro_csh_subsystem_vendor_id     ;
wire [63:0] f1_ro_csh_mmio_bar0_size          ;
wire [63:0] f1_ro_csh_mmio_bar1_size          ;
wire [63:0] f1_ro_csh_mmio_bar2_size          ;
wire        f1_ro_csh_mmio_bar0_prefetchable  ;
wire        f1_ro_csh_mmio_bar1_prefetchable  ;
wire        f1_ro_csh_mmio_bar2_prefetchable  ;
wire  [4:0] f1_ro_pasid_max_pasid_width       ;
wire  [7:0] f1_ro_ofunc_reset_duration        ;
wire        f1_ro_ofunc_afu_present           ;
wire  [4:0] f1_ro_ofunc_max_afu_index         ;
wire  [7:0] f1_ro_octrl00_reset_duration      ;
wire  [5:0] f1_ro_octrl00_afu_control_index   ;
wire  [4:0] f1_ro_octrl00_pasid_len_supported ;
wire        f1_ro_octrl00_metadata_supported  ;
wire [11:0] f1_ro_octrl00_actag_len_supported ;

oc_cfg cfg (
  .clock                             (clock_tlx                        ) // -- lpc_device:  input  
 ,.reset_n                           (reset_n                          ) // -- lpc_device:  input  
 ,.ro_device                         (ro_device                        ) // -- lpc_device:  input  [4:0]
 ,.ro_dlx0_version                   (ro_dlx0_version                  ) // -- lpc_device:  input  [31:0]
 ,.ro_tlx0_version                   (ro_tlx0_version                  ) // -- lpc_device:  input  [31:0]
 ,.tlx_afu_ready                     (tlx_afu_ready                    ) // -- lpc_device:  input  
 ,.afu_tlx_cmd_initial_credit        (afu_tlx_cmd_initial_credit       ) // -- lpc_device:  output [6:0]
 ,.afu_tlx_cmd_credit                (afu_tlx_cmd_credit               ) // -- lpc_device:  output 
 ,.tlx_afu_cmd_valid                 (tlx_afu_cmd_valid                ) // -- lpc_device:  input  
 ,.tlx_afu_cmd_opcode                (tlx_afu_cmd_opcode               ) // -- lpc_device:  input  [7:0]
 ,.tlx_afu_cmd_dl                    (tlx_afu_cmd_dl                   ) // -- lpc_device:  input  [1:0]
 ,.tlx_afu_cmd_end                   (tlx_afu_cmd_end                  ) // -- lpc_device:  input  
 ,.tlx_afu_cmd_pa                    (tlx_afu_cmd_pa                   ) // -- lpc_device:  input  [63:0]
 ,.tlx_afu_cmd_flag                  (tlx_afu_cmd_flag                 ) // -- lpc_device:  input  [3:0]
 ,.tlx_afu_cmd_os                    (tlx_afu_cmd_os                   ) // -- lpc_device:  input  
 ,.tlx_afu_cmd_capptag               (tlx_afu_cmd_capptag              ) // -- lpc_device:  input  [15:0]
 ,.tlx_afu_cmd_pl                    (tlx_afu_cmd_pl                   ) // -- lpc_device:  input  [2:0]
 ,.tlx_afu_cmd_be                    (tlx_afu_cmd_be                   ) // -- lpc_device:  input  [63:0]
 ,.afu_tlx_resp_initial_credit       (afu_tlx_resp_initial_credit      ) // -- lpc_device:  output [6:0]
 ,.afu_tlx_resp_credit               (afu_tlx_resp_credit              ) // -- lpc_device:  output 
 ,.tlx_afu_resp_valid                (tlx_afu_resp_valid               ) // -- lpc_device:  input  
 ,.tlx_afu_resp_opcode               (tlx_afu_resp_opcode              ) // -- lpc_device:  input  [7:0]
 ,.tlx_afu_resp_afutag               (tlx_afu_resp_afutag              ) // -- lpc_device:  input  [15:0]
 ,.tlx_afu_resp_code                 (tlx_afu_resp_code                ) // -- lpc_device:  input  [3:0]
 ,.tlx_afu_resp_pg_size              (tlx_afu_resp_pg_size             ) // -- lpc_device:  input  [5:0]
 ,.tlx_afu_resp_dl                   (tlx_afu_resp_dl                  ) // -- lpc_device:  input  [1:0]
 ,.tlx_afu_resp_dp                   (tlx_afu_resp_dp                  ) // -- lpc_device:  input  [1:0]
 ,.tlx_afu_resp_host_tag             (tlx_afu_resp_host_tag            ) // -- lpc_device:  input  [23:0]
 ,.tlx_afu_resp_cache_state          (tlx_afu_resp_cache_state         ) // -- lpc_device:  input  [3:0]
 ,.tlx_afu_resp_addr_tag             (tlx_afu_resp_addr_tag            ) // -- lpc_device:  input  [17:0]
 ,.afu_tlx_cmd_rd_req                (afu_tlx_cmd_rd_req               ) // -- lpc_device:  output 
 ,.afu_tlx_cmd_rd_cnt                (afu_tlx_cmd_rd_cnt               ) // -- lpc_device:  output [2:0]
 ,.tlx_afu_cmd_data_valid            (tlx_afu_cmd_data_valid           ) // -- lpc_device:  input  
 ,.tlx_afu_cmd_data_bdi              (tlx_afu_cmd_data_bdi             ) // -- lpc_device:  input  
 ,.tlx_afu_cmd_data_bus              (tlx_afu_cmd_data_bus             ) // -- lpc_device:  input  [511:0]
 ,.afu_tlx_resp_rd_req               (afu_tlx_resp_rd_req              ) // -- lpc_device:  output 
 ,.afu_tlx_resp_rd_cnt               (afu_tlx_resp_rd_cnt              ) // -- lpc_device:  output [2:0]
 ,.tlx_afu_resp_data_valid           (tlx_afu_resp_data_valid          ) // -- lpc_device:  input  
 ,.tlx_afu_resp_data_bdi             (tlx_afu_resp_data_bdi            ) // -- lpc_device:  input  
 ,.tlx_afu_resp_data_bus             (tlx_afu_resp_data_bus            ) // -- lpc_device:  input  [511:0]
 ,.cfg0_tlx_xmit_tmpl_config_0       (cfg0_tlx_xmit_tmpl_config_0      ) // -- lpc_device:  output 
 ,.cfg0_tlx_xmit_tmpl_config_1       (cfg0_tlx_xmit_tmpl_config_1      ) // -- lpc_device:  output 
 ,.cfg0_tlx_xmit_tmpl_config_2       (cfg0_tlx_xmit_tmpl_config_2      ) // -- lpc_device:  output 
 ,.cfg0_tlx_xmit_tmpl_config_3       (cfg0_tlx_xmit_tmpl_config_3      ) // -- lpc_device:  output 
 ,.cfg0_tlx_xmit_rate_config_0       (cfg0_tlx_xmit_rate_config_0      ) // -- lpc_device:  output [3:0]
 ,.cfg0_tlx_xmit_rate_config_1       (cfg0_tlx_xmit_rate_config_1      ) // -- lpc_device:  output [3:0]
 ,.cfg0_tlx_xmit_rate_config_2       (cfg0_tlx_xmit_rate_config_2      ) // -- lpc_device:  output [3:0]
 ,.cfg0_tlx_xmit_rate_config_3       (cfg0_tlx_xmit_rate_config_3      ) // -- lpc_device:  output [3:0]
 ,.tlx_cfg0_in_rcv_tmpl_capability_0 (tlx_cfg0_in_rcv_tmpl_capability_0) // -- lpc_device:  input  
 ,.tlx_cfg0_in_rcv_tmpl_capability_1 (tlx_cfg0_in_rcv_tmpl_capability_1) // -- lpc_device:  input  
 ,.tlx_cfg0_in_rcv_tmpl_capability_2 (tlx_cfg0_in_rcv_tmpl_capability_2) // -- lpc_device:  input  
 ,.tlx_cfg0_in_rcv_tmpl_capability_3 (tlx_cfg0_in_rcv_tmpl_capability_3) // -- lpc_device:  input  
 ,.tlx_cfg0_in_rcv_rate_capability_0 (tlx_cfg0_in_rcv_rate_capability_0) // -- lpc_device:  input  [3:0]
 ,.tlx_cfg0_in_rcv_rate_capability_1 (tlx_cfg0_in_rcv_rate_capability_1) // -- lpc_device:  input  [3:0]
 ,.tlx_cfg0_in_rcv_rate_capability_2 (tlx_cfg0_in_rcv_rate_capability_2) // -- lpc_device:  input  [3:0]
 ,.tlx_cfg0_in_rcv_rate_capability_3 (tlx_cfg0_in_rcv_rate_capability_3) // -- lpc_device:  input  [3:0]
 ,.tlx_afu_cmd_initial_credit        (tlx_afu_cmd_initial_credit       ) // -- lpc_device:  input  [3:0]
 ,.tlx_afu_resp_initial_credit       (tlx_afu_resp_initial_credit      ) // -- lpc_device:  input  [3:0]
 ,.tlx_afu_cmd_data_initial_credit   (tlx_afu_cmd_data_initial_credit  ) // -- lpc_device:  input  [5:0]
 ,.tlx_afu_resp_data_initial_credit  (tlx_afu_resp_data_initial_credit ) // -- lpc_device:  input  [5:0]
 ,.tlx_afu_cmd_credit                (tlx_afu_cmd_credit               ) // -- lpc_device:  input  
 ,.afu_tlx_cmd_valid                 (afu_tlx_cmd_valid                ) // -- lpc_device:  output 
 ,.afu_tlx_cmd_opcode                (afu_tlx_cmd_opcode               ) // -- lpc_device:  output [7:0]
 ,.afu_tlx_cmd_actag                 (afu_tlx_cmd_actag                ) // -- lpc_device:  output [11:0]
 ,.afu_tlx_cmd_stream_id             (afu_tlx_cmd_stream_id            ) // -- lpc_device:  output [3:0]
 ,.afu_tlx_cmd_ea_or_obj             (afu_tlx_cmd_ea_or_obj            ) // -- lpc_device:  output [67:0]
 ,.afu_tlx_cmd_afutag                (afu_tlx_cmd_afutag               ) // -- lpc_device:  output [15:0]
 ,.afu_tlx_cmd_dl                    (afu_tlx_cmd_dl                   ) // -- lpc_device:  output [1:0]
 ,.afu_tlx_cmd_pl                    (afu_tlx_cmd_pl                   ) // -- lpc_device:  output [2:0]
 ,.afu_tlx_cmd_os                    (afu_tlx_cmd_os                   ) // -- lpc_device:  output 
 ,.afu_tlx_cmd_be                    (afu_tlx_cmd_be                   ) // -- lpc_device:  output [63:0]
 ,.afu_tlx_cmd_flag                  (afu_tlx_cmd_flag                 ) // -- lpc_device:  output [3:0]
 ,.afu_tlx_cmd_endian                (afu_tlx_cmd_endian               ) // -- lpc_device:  output 
 ,.afu_tlx_cmd_bdf                   (afu_tlx_cmd_bdf                  ) // -- lpc_device:  output [15:0]
 ,.afu_tlx_cmd_pasid                 (afu_tlx_cmd_pasid                ) // -- lpc_device:  output [19:0]
 ,.afu_tlx_cmd_pg_size               (afu_tlx_cmd_pg_size              ) // -- lpc_device:  output [5:0]
 ,.tlx_afu_cmd_data_credit           (tlx_afu_cmd_data_credit          ) // -- lpc_device:  input  
 ,.afu_tlx_cdata_valid               (afu_tlx_cdata_valid              ) // -- lpc_device:  output 
 ,.afu_tlx_cdata_bus                 (afu_tlx_cdata_bus                ) // -- lpc_device:  output [511:0]
 ,.afu_tlx_cdata_bdi                 (afu_tlx_cdata_bdi                ) // -- lpc_device:  output 
 ,.tlx_afu_resp_credit               (tlx_afu_resp_credit              ) // -- lpc_device:  input  
 ,.afu_tlx_resp_valid                (afu_tlx_resp_valid               ) // -- lpc_device:  output 
 ,.afu_tlx_resp_opcode               (afu_tlx_resp_opcode              ) // -- lpc_device:  output [7:0]
 ,.afu_tlx_resp_dl                   (afu_tlx_resp_dl                  ) // -- lpc_device:  output [1:0]
 ,.afu_tlx_resp_capptag              (afu_tlx_resp_capptag             ) // -- lpc_device:  output [15:0]
 ,.afu_tlx_resp_dp                   (afu_tlx_resp_dp                  ) // -- lpc_device:  output [1:0]
 ,.afu_tlx_resp_code                 (afu_tlx_resp_code                ) // -- lpc_device:  output [3:0]
 ,.tlx_afu_resp_data_credit          (tlx_afu_resp_data_credit         ) // -- lpc_device:  input  
 ,.afu_tlx_rdata_valid               (afu_tlx_rdata_valid              ) // -- lpc_device:  output 
 ,.afu_tlx_rdata_bus                 (afu_tlx_rdata_bus                ) // -- lpc_device:  output [511:0]
 ,.afu_tlx_rdata_bdi                 (afu_tlx_rdata_bdi                ) // -- lpc_device:  output 
 ,.tlx_cfg0_valid                    (tlx_cfg0_valid                   ) // -- lpc_device:  input  
 ,.tlx_cfg0_opcode                   (tlx_cfg0_opcode                  ) // -- lpc_device:  input  [7:0]
 ,.tlx_cfg0_pa                       (tlx_cfg0_pa                      ) // -- lpc_device:  input  [63:0]
 ,.tlx_cfg0_t                        (tlx_cfg0_t                       ) // -- lpc_device:  input  
 ,.tlx_cfg0_pl                       (tlx_cfg0_pl                      ) // -- lpc_device:  input  [2:0]
 ,.tlx_cfg0_capptag                  (tlx_cfg0_capptag                 ) // -- lpc_device:  input  [15:0]
 ,.tlx_cfg0_data_bus                 (tlx_cfg0_data_bus                ) // -- lpc_device:  input  [31:0]
 ,.tlx_cfg0_data_bdi                 (tlx_cfg0_data_bdi                ) // -- lpc_device:  input  
 ,.cfg0_tlx_initial_credit           (cfg0_tlx_initial_credit          ) // -- lpc_device:  output [3:0]
 ,.cfg0_tlx_credit_return            (cfg0_tlx_credit_return           ) // -- lpc_device:  output 
 ,.cfg0_tlx_resp_valid               (cfg0_tlx_resp_valid              ) // -- lpc_device:  output 
 ,.cfg0_tlx_resp_opcode              (cfg0_tlx_resp_opcode             ) // -- lpc_device:  output [7:0]
 ,.cfg0_tlx_resp_capptag             (cfg0_tlx_resp_capptag            ) // -- lpc_device:  output [15:0]
 ,.cfg0_tlx_resp_code                (cfg0_tlx_resp_code               ) // -- lpc_device:  output [3:0]
 ,.cfg0_tlx_rdata_offset             (cfg0_tlx_rdata_offset            ) // -- lpc_device:  output [3:0]
 ,.cfg0_tlx_rdata_bus                (cfg0_tlx_rdata_bus               ) // -- lpc_device:  output [31:0]
 ,.cfg0_tlx_rdata_bdi                (cfg0_tlx_rdata_bdi               ) // -- lpc_device:  output 
 ,.tlx_cfg0_resp_ack                 (tlx_cfg0_resp_ack                ) // -- lpc_device:  input  
 //,.cfg_f1_octrl00_resync_credits     (cfg_f1_octrl00_resync_credits    ) // -- lpc_device:  output 
 ,.cfg_vpd_addr                      (cfg_vpd_addr                     ) // -- lpc_device:  output [14:0]
 ,.cfg_vpd_wren                      (cfg_vpd_wren                     ) // -- lpc_device:  output 
 ,.cfg_vpd_wdata                     (cfg_vpd_wdata                    ) // -- lpc_device:  output [31:0]
 ,.cfg_vpd_rden                      (cfg_vpd_rden                     ) // -- lpc_device:  output 
 ,.vpd_cfg_rdata                     (vpd_cfg_rdata                    ) // -- lpc_device:  input  [31:0]
 ,.vpd_cfg_done                      (vpd_cfg_done                     ) // -- lpc_device:  input  
 //,.vpd_err_unimplemented_addr        (vpd_err_unimplemented_addr       ) // -- lpc_device:  input  
 ,.cfg_flsh_devsel                   (cfg_flsh_devsel                  ) // -- lpc_device:  output [1:0]
 ,.cfg_flsh_addr                     (cfg_flsh_addr                    ) // -- lpc_device:  output [13:0]
 ,.cfg_flsh_wren                     (cfg_flsh_wren                    ) // -- lpc_device:  output 
 ,.cfg_flsh_wdata                    (cfg_flsh_wdata                   ) // -- lpc_device:  output [31:0]
 ,.cfg_flsh_rden                     (cfg_flsh_rden                    ) // -- lpc_device:  output 
 ,.flsh_cfg_rdata                    (flsh_cfg_rdata                   ) // -- lpc_device:  input  [31:0]
 ,.flsh_cfg_done                     (flsh_cfg_done                    ) // -- lpc_device:  input  
 ,.flsh_cfg_status                   (flsh_cfg_status                  ) // -- lpc_device:  input  [7:0]
 ,.flsh_cfg_bresp                    (flsh_cfg_bresp                   ) // -- lpc_device:  input  [1:0]
 ,.flsh_cfg_rresp                    (flsh_cfg_rresp                   ) // -- lpc_device:  input  [1:0]
 ,.cfg_flsh_expand_enable            (cfg_flsh_expand_enable           ) // -- lpc_device:  output 
 ,.cfg_flsh_expand_dir               (cfg_flsh_expand_dir              ) // -- lpc_device:  output
 
 ,.cfg0_bus_num                      (cfg0_bus_num                    )            
 ,.cfg0_device_num                   (cfg0_device_num                 )            
 ,.fen_afu_ready                     (fen_afu_ready                   )            
 ,.afu_fen_cmd_initial_credit        (afu_fen_cmd_initial_credit      )            
 ,.afu_fen_cmd_credit                (afu_fen_cmd_credit              )            
                                                                    
 ,.fen_afu_cmd_valid                 (fen_afu_cmd_valid               )            
 ,.fen_afu_cmd_opcode                (fen_afu_cmd_opcode              )            
 ,.fen_afu_cmd_dl                    (fen_afu_cmd_dl                  )            
 ,.fen_afu_cmd_end                   (fen_afu_cmd_end                 )            
 ,.fen_afu_cmd_pa                    (fen_afu_cmd_pa                  )            
 ,.fen_afu_cmd_flag                  (fen_afu_cmd_flag                )            
 ,.fen_afu_cmd_os                    (fen_afu_cmd_os                  )            
 ,.fen_afu_cmd_capptag               (fen_afu_cmd_capptag             )            
 ,.fen_afu_cmd_pl                    (fen_afu_cmd_pl                  )            
 ,.fen_afu_cmd_be                    (fen_afu_cmd_be                  )            
                                                                              
 ,.afu_fen_resp_initial_credit       (afu_fen_resp_initial_credit     )            
 ,.afu_fen_resp_credit               (afu_fen_resp_credit             )            
 ,.fen_afu_resp_valid                (fen_afu_resp_valid              )            
 ,.fen_afu_resp_opcode               (fen_afu_resp_opcode             )            
 ,.fen_afu_resp_afutag               (fen_afu_resp_afutag             )            
 ,.fen_afu_resp_code                 (fen_afu_resp_code               )            
 ,.fen_afu_resp_pg_size              (fen_afu_resp_pg_size            )            
 ,.fen_afu_resp_dl                   (fen_afu_resp_dl                 )            
 ,.fen_afu_resp_dp                   (fen_afu_resp_dp                 )            
 ,.fen_afu_resp_host_tag             (fen_afu_resp_host_tag           )            
 ,.fen_afu_resp_cache_state          (fen_afu_resp_cache_state        )            
 ,.fen_afu_resp_addr_tag             (fen_afu_resp_addr_tag           )            
                                                                           
 ,.afu_fen_cmd_rd_req                (afu_fen_cmd_rd_req              )            
 ,.afu_fen_cmd_rd_cnt                (afu_fen_cmd_rd_cnt              )            
 ,.fen_afu_cmd_data_valid            (fen_afu_cmd_data_valid          )            
 ,.fen_afu_cmd_data_bdi              (fen_afu_cmd_data_bdi            )            
 ,.fen_afu_cmd_data_bus              (fen_afu_cmd_data_bus            )            
                                                                              
 ,.afu_fen_resp_rd_req               (afu_fen_resp_rd_req             )            
 ,.afu_fen_resp_rd_cnt               (afu_fen_resp_rd_cnt             )            
 ,.fen_afu_resp_data_valid           (fen_afu_resp_data_valid         )            
 ,.fen_afu_resp_data_bdi             (fen_afu_resp_data_bdi           )            
 ,.fen_afu_resp_data_bus             (fen_afu_resp_data_bus           )            
                                                                              
 ,.fen_afu_cmd_initial_credit        (fen_afu_cmd_initial_credit      )            
 ,.fen_afu_resp_initial_credit       (fen_afu_resp_initial_credit     )            
 ,.fen_afu_cmd_data_initial_credit   (fen_afu_cmd_data_initial_credit )            
 ,.fen_afu_resp_data_initial_credit  (fen_afu_resp_data_initial_credit)            
                                                                              
 ,.fen_afu_cmd_credit                (fen_afu_cmd_credit              )            
 ,.afu_fen_cmd_valid                 (afu_fen_cmd_valid               )            
 ,.afu_fen_cmd_opcode                (afu_fen_cmd_opcode              )            
 ,.afu_fen_cmd_actag                 (afu_fen_cmd_actag               )            
 ,.afu_fen_cmd_stream_id             (afu_fen_cmd_stream_id           )            
 ,.afu_fen_cmd_ea_or_obj             (afu_fen_cmd_ea_or_obj           )            
 ,.afu_fen_cmd_afutag                (afu_fen_cmd_afutag              )            
 ,.afu_fen_cmd_dl                    (afu_fen_cmd_dl                  )            
 ,.afu_fen_cmd_pl                    (afu_fen_cmd_pl                  )            
 ,.afu_fen_cmd_os                    (afu_fen_cmd_os                  )            
 ,.afu_fen_cmd_be                    (afu_fen_cmd_be                  )            
 ,.afu_fen_cmd_flag                  (afu_fen_cmd_flag                )            
 ,.afu_fen_cmd_endian                (afu_fen_cmd_endian              )            
 ,.afu_fen_cmd_bdf                   (afu_fen_cmd_bdf                 )            
 ,.afu_fen_cmd_pasid                 (afu_fen_cmd_pasid               )            
 ,.afu_fen_cmd_pg_size               (afu_fen_cmd_pg_size             )            
                                                                            
 ,.fen_afu_cmd_data_credit           (fen_afu_cmd_data_credit         )            
 ,.afu_fen_cdata_valid               (afu_fen_cdata_valid             )            
 ,.afu_fen_cdata_bus                 (afu_fen_cdata_bus               )            
 ,.afu_fen_cdata_bdi                 (afu_fen_cdata_bdi               )            
                                                                             
 ,.fen_afu_resp_credit               (fen_afu_resp_credit             )            
 ,.afu_fen_resp_valid                (afu_fen_resp_valid              )            
 ,.afu_fen_resp_opcode               (afu_fen_resp_opcode             )            
 ,.afu_fen_resp_dl                   (afu_fen_resp_dl                 )            
 ,.afu_fen_resp_capptag              (afu_fen_resp_capptag            )            
 ,.afu_fen_resp_dp                   (afu_fen_resp_dp                 )            
 ,.afu_fen_resp_code                 (afu_fen_resp_code               )            
                                                                              
 ,.fen_afu_resp_data_credit          (fen_afu_resp_data_credit        )            
 ,.afu_fen_rdata_valid               (afu_fen_rdata_valid             )            
 ,.afu_fen_rdata_bus                 (afu_fen_rdata_bus               )            
 ,.afu_fen_rdata_bdi                 (afu_fen_rdata_bdi               )            
                                                                            
 
 ,.cfg_function                      (cfg_function               )
 ,.cfg_portnum                       (cfg_portnum                )
 ,.cfg_addr                          (cfg_addr                   )
 ,.cfg_wdata                         (cfg_wdata                  )
 ,.cfg_f1_rdata                      (cfg_f1_rdata               )
 ,.cfg_f1_rdata_vld                  (cfg_f1_rdata_vld           )
 ,.cfg_wr_1B                         (cfg_wr_1B                  )
 ,.cfg_wr_2B                         (cfg_wr_2B                  )
 ,.cfg_wr_4B                         (cfg_wr_4B                  )
 ,.cfg_rd                            (cfg_rd                     )
 ,.cfg_f1_bad_op_or_align            (cfg_f1_bad_op_or_align     )
 ,.cfg_f1_addr_not_implemented       (cfg_f1_addr_not_implemented)
 
 ,.cfg_f1_octrl00_fence_afu          (cfg_f1_octrl00_fence_afu   )
 
 ,.cfg0_cff_fifo_overflow            (cfg0_cff_fifo_overflow )
 //,.cfg1_cff_fifo_overflow            (cfg1_cff_fifo_overflow )
 ,.cfg0_rff_fifo_overflow            (cfg0_rff_fifo_overflow )
 //,.cfg1_rff_fifo_overflow            (cfg1_rff_fifo_overflow )
 ,.cfg_errvec                        (cfg_errvec             )
 ,.cfg_errvec_valid                  (cfg_errvec_valid       )
 ,.cfg_f0_otl0_long_backoff_timer    (cfg_f0_otl0_long_backoff_timer)
 ,.cfg_f0_otl0_short_backoff_timer   (cfg_f0_otl0_short_backoff_timer)
 
 ,.f1_csh_expansion_rom_bar           (f1_ro_csh_expansion_rom_bar      )
 ,.f1_csh_subsystem_id                (f1_ro_csh_subsystem_id           )
 ,.f1_csh_subsystem_vendor_id         (f1_ro_csh_subsystem_vendor_id    )
 ,.f1_csh_mmio_bar0_size              (f1_ro_csh_mmio_bar0_size         )
 ,.f1_csh_mmio_bar1_size              (f1_ro_csh_mmio_bar1_size         )
 ,.f1_csh_mmio_bar2_size              (f1_ro_csh_mmio_bar2_size         )
 ,.f1_csh_mmio_bar0_prefetchable      (f1_ro_csh_mmio_bar0_prefetchable )
 ,.f1_csh_mmio_bar1_prefetchable      (f1_ro_csh_mmio_bar1_prefetchable )
 ,.f1_csh_mmio_bar2_prefetchable      (f1_ro_csh_mmio_bar2_prefetchable )
 ,.f1_pasid_max_pasid_width           (f1_ro_pasid_max_pasid_width      )
 ,.f1_ofunc_reset_duration            (f1_ro_ofunc_reset_duration       )
 ,.f1_ofunc_afu_present               (f1_ro_ofunc_afu_present          )
 ,.f1_ofunc_max_afu_index             (f1_ro_ofunc_max_afu_index        )
 ,.f1_octrl00_reset_duration          (f1_ro_octrl00_reset_duration     )
 ,.f1_octrl00_afu_control_index       (f1_ro_octrl00_afu_control_index  )
 ,.f1_octrl00_pasid_len_supported     (f1_ro_octrl00_pasid_len_supported)
 ,.f1_octrl00_metadata_supported      (f1_ro_octrl00_metadata_supported )
 ,.f1_octrl00_actag_len_supported     (f1_ro_octrl00_actag_len_supported)
 

);




oc_function oc_func(
    .clock_tlx                              ( clock_tlx                          )
  , .clock_afu                              ( clock_afu                          )
  , .reset                                  ( reset                              )  // (positive active)
    // Bus number comes from CFG_SEQ
  , .cfg_bus                                ( cfg0_bus_num                       )  // Attached to TLX Port 0, so use cfg0_ instance
    // Hardcoded configuration inputs
  , .ro_device                              ( cfg0_device_num                    )  // Passed down from *_device.v
  , .ro_function                            ( 3'b001                             )  // This function instance is number 1
    // -----------------------------------
    // TLX Parser -> AFU Receive Interface
    // -----------------------------------
  , .tlx_afu_ready                          ( fen_afu_ready                      )
    // Command interface to AFU
  , .afu_tlx_cmd_initial_credit             ( afu_fen_cmd_initial_credit         )    
  , .afu_tlx_cmd_credit                     ( afu_fen_cmd_credit                 )
  , .tlx_afu_cmd_valid                      ( fen_afu_cmd_valid                  )
  , .tlx_afu_cmd_opcode                     ( fen_afu_cmd_opcode                 )
  , .tlx_afu_cmd_dl                         ( fen_afu_cmd_dl                     )
  , .tlx_afu_cmd_end                        ( fen_afu_cmd_end                    )
  , .tlx_afu_cmd_pa                         ( fen_afu_cmd_pa                     )
  , .tlx_afu_cmd_flag                       ( fen_afu_cmd_flag                   )
  , .tlx_afu_cmd_os                         ( fen_afu_cmd_os                     )
  , .tlx_afu_cmd_capptag                    ( fen_afu_cmd_capptag                )
  , .tlx_afu_cmd_pl                         ( fen_afu_cmd_pl                     )
  , .tlx_afu_cmd_be                         ( fen_afu_cmd_be                     )
    // Response interface to AFU
  , .afu_tlx_resp_initial_credit            ( afu_fen_resp_initial_credit        )
  , .afu_tlx_resp_credit                    ( afu_fen_resp_credit                )
  , .tlx_afu_resp_valid                     ( fen_afu_resp_valid                 )
  , .tlx_afu_resp_opcode                    ( fen_afu_resp_opcode                )  
  , .tlx_afu_resp_afutag                    ( fen_afu_resp_afutag                )
  , .tlx_afu_resp_code                      ( fen_afu_resp_code                  )
  , .tlx_afu_resp_pg_size                   ( fen_afu_resp_pg_size               )     
  , .tlx_afu_resp_dl                        ( fen_afu_resp_dl                    )
  , .tlx_afu_resp_dp                        ( fen_afu_resp_dp                    )
  , .tlx_afu_resp_host_tag                  ( fen_afu_resp_host_tag              )
  , .tlx_afu_resp_cache_state               ( fen_afu_resp_cache_state           )
  , .tlx_afu_resp_addr_tag                  ( fen_afu_resp_addr_tag              )
    // Command data interface to AFU
  , .afu_tlx_cmd_rd_req                     ( afu_fen_cmd_rd_req                 )
  , .afu_tlx_cmd_rd_cnt                     ( afu_fen_cmd_rd_cnt                 )
  , .tlx_afu_cmd_data_valid                 ( fen_afu_cmd_data_valid             )
  , .tlx_afu_cmd_data_bdi                   ( fen_afu_cmd_data_bdi               )
  , .tlx_afu_cmd_data_bus                   ( fen_afu_cmd_data_bus               )    
    // Response data interface to AFU
  , .afu_tlx_resp_rd_req                    ( afu_fen_resp_rd_req                )
  , .afu_tlx_resp_rd_cnt                    ( afu_fen_resp_rd_cnt                )
  , .tlx_afu_resp_data_valid                ( fen_afu_resp_data_valid            )
  , .tlx_afu_resp_data_bdi                  ( fen_afu_resp_data_bdi              )
  , .tlx_afu_resp_data_bus                  ( fen_afu_resp_data_bus              )
    // ------------------------------------
    // AFU -> TLX Framer Transmit Interface
    // ------------------------------------
    // Initial credit allocation
  , .tlx_afu_cmd_initial_credit             ( fen_afu_cmd_initial_credit        )
  , .tlx_afu_resp_initial_credit            ( fen_afu_resp_initial_credit       )
  , .tlx_afu_cmd_data_initial_credit        ( fen_afu_cmd_data_initial_credit   )
  , .tlx_afu_resp_data_initial_credit       ( fen_afu_resp_data_initial_credit  )

    // Commands from AFU
  , .tlx_afu_cmd_credit                     ( fen_afu_cmd_credit                 )               
  , .afu_tlx_cmd_valid                      ( afu_fen_cmd_valid                  )             
  , .afu_tlx_cmd_opcode                     ( afu_fen_cmd_opcode                 )              
  , .afu_tlx_cmd_actag                      ( afu_fen_cmd_actag                  )             
  , .afu_tlx_cmd_stream_id                  ( afu_fen_cmd_stream_id              )             
  , .afu_tlx_cmd_ea_or_obj                  ( afu_fen_cmd_ea_or_obj              )             
  , .afu_tlx_cmd_afutag                     ( afu_fen_cmd_afutag                 )               
  , .afu_tlx_cmd_dl                         ( afu_fen_cmd_dl                     )            
  , .afu_tlx_cmd_pl                         ( afu_fen_cmd_pl                     )           
  , .afu_tlx_cmd_os                         ( afu_fen_cmd_os                     )            
  , .afu_tlx_cmd_be                         ( afu_fen_cmd_be                     )            
  , .afu_tlx_cmd_flag                       ( afu_fen_cmd_flag                   )              
  , .afu_tlx_cmd_endian                     ( afu_fen_cmd_endian                 )               
  , .afu_tlx_cmd_bdf                        ( afu_fen_cmd_bdf                    )                   
  , .afu_tlx_cmd_pasid                      ( afu_fen_cmd_pasid                  )              
  , .afu_tlx_cmd_pg_size                    ( afu_fen_cmd_pg_size                )               
    // Command data from AFU
  , .tlx_afu_cmd_data_credit                ( fen_afu_cmd_data_credit            )         
  , .afu_tlx_cdata_valid                    ( afu_fen_cdata_valid                )        
  , .afu_tlx_cdata_bus                      ( afu_fen_cdata_bus                  )      
  , .afu_tlx_cdata_bdi                      ( afu_fen_cdata_bdi                  ) 
    // Responses from AFU
  , .tlx_afu_resp_credit                    ( fen_afu_resp_credit                )
  , .afu_tlx_resp_valid                     ( afu_fen_resp_valid                 )             
  , .afu_tlx_resp_opcode                    ( afu_fen_resp_opcode                )              
  , .afu_tlx_resp_dl                        ( afu_fen_resp_dl                    )
  , .afu_tlx_resp_capptag                   ( afu_fen_resp_capptag               )         
  , .afu_tlx_resp_dp                        ( afu_fen_resp_dp                    )            
  , .afu_tlx_resp_code                      ( afu_fen_resp_code                  )              
    // Response data from AFU
  , .tlx_afu_resp_data_credit               ( fen_afu_resp_data_credit           )       
  , .afu_tlx_rdata_valid                    ( afu_fen_rdata_valid                )              
  , .afu_tlx_rdata_bus                      ( afu_fen_rdata_bus                  )             
  , .afu_tlx_rdata_bdi                      ( afu_fen_rdata_bdi                  )               
    // ------------------------------------------------------------- 
    // Configuration Sequencer Interface [CFG_SEQ -> CFG_Fn (n=1-7)]
    // -------------------------------------------------------------
  , .cfg_function                           ( cfg_function                       )                       
  , .cfg_portnum                            ( cfg_portnum                        ) 
  , .cfg_addr                               ( cfg_addr                           ) 
  , .cfg_wdata                              ( cfg_wdata                          ) 
  , .cfg_f1_rdata                           ( cfg_f1_rdata                       ) 
  , .cfg_f1_rdata_vld                       ( cfg_f1_rdata_vld                   ) 
  , .cfg_wr_1B                              ( cfg_wr_1B                          ) 
  , .cfg_wr_2B                              ( cfg_wr_2B                          ) 
  , .cfg_wr_4B                              ( cfg_wr_4B                          ) 
  , .cfg_rd                                 ( cfg_rd                             ) 
  , .cfg_f1_bad_op_or_align                 ( cfg_f1_bad_op_or_align             )
  , .cfg_f1_addr_not_implemented            ( cfg_f1_addr_not_implemented        )
    // ------------------------------------
    // Other signals
    // ------------------------------------
    // Fence control
  , .cfg_f1_octrl00_fence_afu               ( cfg_f1_octrl00_fence_afu           )
    // TLX Configuration for the TLX port(s) connected to AFUs under this Function
  , .cfg_f0_otl0_long_backoff_timer         ( cfg_f0_otl0_long_backoff_timer     )
  , .cfg_f0_otl0_short_backoff_timer        ( cfg_f0_otl0_short_backoff_timer    )
    // Error signals into MMIO capture register
  , .vpd_err_unimplemented_addr             ( vpd_err_unimplemented_addr         )
  , .cfg0_cff_fifo_overflow                 ( cfg0_cff_fifo_overflow             )
  , .cfg1_cff_fifo_overflow                 ( 1'b0                               )  // Residual signal left in, tie off
  , .cfg0_rff_fifo_overflow                 ( cfg0_rff_fifo_overflow             )
  , .cfg1_rff_fifo_overflow                 ( 1'b0                               )  // Residual signal left in, tie off
  , .cfg_errvec                             ( cfg_errvec                         )
  , .cfg_errvec_valid                       ( cfg_errvec_valid                   )
    // Resync credits control
  , .cfg_f1_octrl00_resync_credits          ( cfg_f1_octrl00_resync_credits      )

  ,.f1_csh_expansion_rom_bar                 (f1_ro_csh_expansion_rom_bar      )
  ,.f1_csh_subsystem_id                      (f1_ro_csh_subsystem_id           )
  ,.f1_csh_subsystem_vendor_id               (f1_ro_csh_subsystem_vendor_id    )
  ,.f1_csh_mmio_bar0_size                    (f1_ro_csh_mmio_bar0_size         )
  ,.f1_csh_mmio_bar1_size                    (f1_ro_csh_mmio_bar1_size         )
  ,.f1_csh_mmio_bar2_size                    (f1_ro_csh_mmio_bar2_size         )
  ,.f1_csh_mmio_bar0_prefetchable            (f1_ro_csh_mmio_bar0_prefetchable )
  ,.f1_csh_mmio_bar1_prefetchable            (f1_ro_csh_mmio_bar1_prefetchable )
  ,.f1_csh_mmio_bar2_prefetchable            (f1_ro_csh_mmio_bar2_prefetchable )
  ,.f1_pasid_max_pasid_width                 (f1_ro_pasid_max_pasid_width      )
  ,.f1_ofunc_reset_duration                  (f1_ro_ofunc_reset_duration       )
  ,.f1_ofunc_afu_present                     (f1_ro_ofunc_afu_present          )
  ,.f1_ofunc_max_afu_index                   (f1_ro_ofunc_max_afu_index        )
  ,.f1_octrl00_reset_duration                (f1_ro_octrl00_reset_duration     )
  ,.f1_octrl00_afu_control_index             (f1_ro_octrl00_afu_control_index  )
  ,.f1_octrl00_pasid_len_supported           (f1_ro_octrl00_pasid_len_supported)
  ,.f1_octrl00_metadata_supported            (f1_ro_octrl00_metadata_supported )
  ,.f1_octrl00_actag_len_supported           (f1_ro_octrl00_actag_len_supported)
   //network facing QSFP GTYs for 9v3
`ifdef THYMESISFLOW
  ,.serdes_init_clock                        (clock_free_running_100           )

  ,.qsfp0_ref_clk_n                          (QSFP0_REF_CLK_N                  )
  ,.qsfp0_ref_clk_p                          (QSFP0_REF_CLK_P                  )
  ,.qsfp0_rx_n                               (QSFP0_RX_N                       )
  ,.qsfp0_rx_p                               (QSFP0_RX_P                       )
  ,.qsfp0_tx_n                               (QSFP0_TX_N                       )
  ,.qsfp0_tx_p                               (QSFP0_TX_P                       )
  ,.qsfp1_ref_clk_n                          (QSFP1_REF_CLK_N                  )
  ,.qsfp1_ref_clk_p                          (QSFP1_REF_CLK_P                  )
  ,.qsfp1_rx_n                               (QSFP1_RX_N                       )
  ,.qsfp1_rx_p                               (QSFP1_RX_P                       )
  ,.qsfp1_tx_n                               (QSFP1_TX_N                       )
  ,.qsfp1_tx_p                               (QSFP1_TX_P                       )
  
`endif

);


endmodule //-- oc_fpga_top
