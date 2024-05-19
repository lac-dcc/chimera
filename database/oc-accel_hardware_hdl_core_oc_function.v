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

module oc_function (

    // -----------------------------------
    // Miscellaneous Ports
    // -----------------------------------
    input          clock_tlx
  , input          clock_afu                               
  , input          reset                        
  , input          decouple
  , input          ocde                         //connected from top-level port
  , output         ocde_to_bsp_dcpl

    // Bus number comes from CFG_SEQ
  , input    [7:0] cfg_bus                      // Extracted from config_write command

    // Hardcoded configuration inputs
  , input    [4:0] ro_device                    // Passed down from *_device.v
  , input    [2:0] ro_function                  // Assigned in *_device.v for this function instantiation
    
    // -----------------------------------
    // TLX Parser -> AFU Receive Interface
    // -----------------------------------

  , input          tlx_afu_ready                // When 1, TLX is ready to receive both commands and responses from the AFU

    // Command interface to AFU
  , output [  6:0] afu_tlx_cmd_initial_credit   // (static) Number of cmd credits available for TLX to use in the AFU      
  , output         afu_tlx_cmd_credit           // Returns a cmd credit to the TLX
  , input          tlx_afu_cmd_valid            // Indicates TLX has a valid cmd for AFU to process
  , input  [  7:0] tlx_afu_cmd_opcode           // (w/cmd_valid) Cmd Opcode
  , input  [  1:0] tlx_afu_cmd_dl               // (w/cmd_valid) Cmd Data Length (00=rsvd, 01=64B, 10=128B, 11=256B) 
  , input          tlx_afu_cmd_end              // (w/cmd_valid) Operand Endian-ess 
  , input  [ 63:0] tlx_afu_cmd_pa               // (w/cmd_valid) Physical Address
  , input  [  3:0] tlx_afu_cmd_flag             // (w/cmd_valid) Specifies atomic memory operation (unsupported) 
  , input          tlx_afu_cmd_os               // (w/cmd_valid) Ordered Segment - 1 means ordering is guaranteed (unsupported) 
  , input  [ 15:0] tlx_afu_cmd_capptag          // (w/cmd_valid) Unique operation tag from CAPP unit     
  , input  [  2:0] tlx_afu_cmd_pl               // (w/cmd_valid) Partial Length (000=1B,001=2B,010=4B,011=8B,100=16B,101=32B,110/111=rsvd)
  , input  [ 63:0] tlx_afu_cmd_be               // (w/cmd_valid) Byte Enable   

    // Response interface to AFU
  , output [  6:0] afu_tlx_resp_initial_credit  // (static) Number of resp credits available for TLX to use in the AFU     
  , output         afu_tlx_resp_credit          // Returns a resp credit to the TLX     
  , input          tlx_afu_resp_valid           // Indicates TLX has a valid resp for AFU to process  
  , input  [  7:0] tlx_afu_resp_opcode          // (w/resp_valid) Resp Opcode     
  , input  [ 15:0] tlx_afu_resp_afutag          // (w/resp_valid) Resp Tag    
  , input  [  3:0] tlx_afu_resp_code            // (w/resp_valid) Describes the reason for a failed transaction     
  , input  [  5:0] tlx_afu_resp_pg_size         // (w/resp_valid) Page size     
  , input  [  1:0] tlx_afu_resp_dl              // (w/resp_valid) Resp Data Length (00=rsvd, 01=64B, 10=128B, 11=256B)     
  , input  [  1:0] tlx_afu_resp_dp              // (w/resp_valid) Data Part, indicates the data content of the current resp packet     
  , input  [ 23:0] tlx_afu_resp_host_tag        // (w/resp_valid) Tag for data held in AFU L1 (unsupported, CAPI 4.0 feature)     
  , input  [  3:0] tlx_afu_resp_cache_state     // (w/resp_valid) Gives cache state of cache line obtained     
  , input  [ 17:0] tlx_afu_resp_addr_tag        // (w/resp_valid) Address translation tag for use by AFU with dot-t format commands

    // Command data interface to AFU
  , output         afu_tlx_cmd_rd_req           // Command Read Request     
  , output [  2:0] afu_tlx_cmd_rd_cnt           // Command Read Count, number of 64B flits requested (000 is not useful)    
  , input          tlx_afu_cmd_data_valid       // Command Data Valid, when 1 valid data is present on cmd_data_bus
  , input          tlx_afu_cmd_data_bdi         // (w/cmd_data_valid) Bad Data Indicator, when 1 data FLIT is corrupted
  , input  [511:0] tlx_afu_cmd_data_bus         // (w/cmd_data_valid) Command Data Bus, contains the command for the AFU to process     

    // Response data interface to AFU
  , output         afu_tlx_resp_rd_req          // Response Read Request     
  , output [  2:0] afu_tlx_resp_rd_cnt          // Response Read Count, number of 64B flits requested (000 is not useful)      
  , input          tlx_afu_resp_data_valid      // Response Valid, when 1 valid data is present on resp_data     
  , input          tlx_afu_resp_data_bdi        // (w/resp_data_valid) Bad Data Indicator, when 1 data FLIT is corrupted
  , input  [511:0] tlx_afu_resp_data_bus        // (w/resp_data_valid) Response Data, contains data for a read request     


    // ------------------------------------
    // AFU -> TLX Framer Transmit Interface
    // ------------------------------------

    // Initial credit allocation
//  , input  [  2:0] tlx_afu_cmd_resp_initial_credit   // Number of starting credits from TLX for both AFU->TLX cmd and resp interfaces
//  , input  [  4:0] tlx_afu_data_initial_credit       // Number of starting credits from TLX for both AFU->TLX cmd and resp data interfaces
  , input  [  3:0] tlx_afu_cmd_initial_credit           // Number of starting credits from TLX for AFU->TLX cmd interface
  , input  [  3:0] tlx_afu_resp_initial_credit          // Number of starting credits from TLX for AFU->TLX resp interface
  , input  [  5:0] tlx_afu_cmd_data_initial_credit      // Number of starting credits from TLX for both AFU->TLX cmd data interface
  , input  [  5:0] tlx_afu_resp_data_initial_credit     // Number of starting credits from TLX for both AFU->TLX resp data interface


    // Commands from AFU
  , input          tlx_afu_cmd_credit                
  , output         afu_tlx_cmd_valid                 
  , output [  7:0] afu_tlx_cmd_opcode                
  , output [ 11:0] afu_tlx_cmd_actag                 
  , output [  3:0] afu_tlx_cmd_stream_id             
  , output [ 67:0] afu_tlx_cmd_ea_or_obj             
  , output [ 15:0] afu_tlx_cmd_afutag               
  , output [  1:0] afu_tlx_cmd_dl                    
  , output [  2:0] afu_tlx_cmd_pl                    
  , output         afu_tlx_cmd_os                    
  , output [ 63:0] afu_tlx_cmd_be                    
  , output [  3:0] afu_tlx_cmd_flag                  
  , output         afu_tlx_cmd_endian                
  , output [ 15:0] afu_tlx_cmd_bdf              // BDF = Concatenation of 8 bit Bus Number, 5 bit Device Number, and 3 bit Function                  
  , output [ 19:0] afu_tlx_cmd_pasid                 
  , output [  5:0] afu_tlx_cmd_pg_size               

    // Command data from AFU
  , input          tlx_afu_cmd_data_credit           
  , output         afu_tlx_cdata_valid               
  , output [511:0] afu_tlx_cdata_bus                 
  , output         afu_tlx_cdata_bdi           // When 1, marks command data associated with AFU->host command as bad        

    // Responses from AFU
  , input          tlx_afu_resp_credit               
  , output         afu_tlx_resp_valid                
  , output [  7:0] afu_tlx_resp_opcode               
  , output [  1:0] afu_tlx_resp_dl   
  , output [ 15:0] afu_tlx_resp_capptag          
  , output [  1:0] afu_tlx_resp_dp                   
  , output [  3:0] afu_tlx_resp_code                 

    // Response data from AFU
  , input          tlx_afu_resp_data_credit          
  , output         afu_tlx_rdata_valid               
  , output [511:0] afu_tlx_rdata_bus                 
  , output         afu_tlx_rdata_bdi           // When 1, marks response data associated with AFU's reply to Host->AFU cmd as bad                

    // -------------------------------------------------------------
    // Configuration Sequencer Interface [CFG_SEQ -> CFG_Fn (n=1-7)]
    // -------------------------------------------------------------

  , input    [2:0] cfg_function
  , input    [1:0] cfg_portnum                  
  , input   [11:0] cfg_addr                     
  , input   [31:0] cfg_wdata                    
  , output  [31:0] cfg_f1_rdata               
  , output         cfg_f1_rdata_vld            
  , input          cfg_wr_1B                    
  , input          cfg_wr_2B                    
  , input          cfg_wr_4B                    
  , input          cfg_rd                       
  , output         cfg_f1_bad_op_or_align       
  , output         cfg_f1_addr_not_implemented  

    // ------------------------------------
    // Other signals
    // ------------------------------------

    // Fence control
  , output         cfg_f1_octrl00_fence_afu

    // TLX Configuration for the TLX port(s) connected to AFUs under this Function
  , input    [3:0] cfg_f0_otl0_long_backoff_timer
  , input    [3:0] cfg_f0_otl0_short_backoff_timer

    // Error signals into MMIO capture register
  , input          vpd_err_unimplemented_addr
  , input          cfg0_cff_fifo_overflow
  , input          cfg1_cff_fifo_overflow
  , input          cfg0_rff_fifo_overflow
  , input          cfg1_rff_fifo_overflow
  , input  [127:0] cfg_errvec
  , input          cfg_errvec_valid

    // Resync credits control
  , output         cfg_f1_octrl00_resync_credits
  
  
    //cfg tieoff files
    ,input [31:0] f1_csh_expansion_rom_bar       
    ,input [15:0] f1_csh_subsystem_id            
    ,input [15:0] f1_csh_subsystem_vendor_id     
    ,input [63:0] f1_csh_mmio_bar0_size          
    ,input [63:0] f1_csh_mmio_bar1_size          
    ,input [63:0] f1_csh_mmio_bar2_size          
    ,input        f1_csh_mmio_bar0_prefetchable  
    ,input        f1_csh_mmio_bar1_prefetchable  
    ,input        f1_csh_mmio_bar2_prefetchable  
    ,input  [4:0] f1_pasid_max_pasid_width       
    ,input  [7:0] f1_ofunc_reset_duration        
    ,input        f1_ofunc_afu_present           
    ,input  [4:0] f1_ofunc_max_afu_index         
    ,input  [7:0] f1_octrl00_reset_duration      
    ,input  [5:0] f1_octrl00_afu_control_index   
    ,input  [4:0] f1_octrl00_pasid_len_supported 
    ,input        f1_octrl00_metadata_supported  
    ,input [11:0] f1_octrl00_actag_len_supported 

  `ifdef ENABLE_DDR 
  `ifdef AD9V3
  
   // DDR4 SDRAM Interface
 // , output [511:0]       dbg_bus //Unused
    , input                  c0_sys_clk_p
    , input                  c0_sys_clk_n
    , output  [16 : 0]       c0_ddr4_adr
    , output  [1 : 0]        c0_ddr4_ba
    , output  [0 : 0]        c0_ddr4_cke
    , output  [0 : 0]        c0_ddr4_cs_n
    , inout   [8 : 0]        c0_ddr4_dm_dbi_n
    , inout   [71 : 0]       c0_ddr4_dq
    , inout   [8 : 0]        c0_ddr4_dqs_c
    , inout   [8 : 0]        c0_ddr4_dqs_t
    , output  [0 : 0]        c0_ddr4_odt
    , output  [1 : 0]        c0_ddr4_bg
    , output                 c0_ddr4_reset_n
    , output                 c0_ddr4_act_n
    , output  [0 : 0]        c0_ddr4_ck_c
    , output  [0 : 0]        c0_ddr4_ck_t
   `endif
   `ifdef BW250SOC
   // DDR4 SDRAM Interface
 // , output [511:0]       dbg_bus //Unused
    , input                  c0_sys_clk_p
    , input                  c0_sys_clk_n
    , output  [16 : 0]       c0_ddr4_adr
    , output  [1 : 0]        c0_ddr4_ba
    , output  [0 : 0]        c0_ddr4_cke
    , output  [0 : 0]        c0_ddr4_cs_n
    , inout   [8 : 0]        c0_ddr4_dm_dbi_n
    , inout   [71 : 0]       c0_ddr4_dq
    , inout   [8 : 0]        c0_ddr4_dqs_c
    , inout   [8 : 0]        c0_ddr4_dqs_t
    , output  [0 : 0]        c0_ddr4_odt
    , output  [0 : 0]        c0_ddr4_bg
    , output                 c0_ddr4_reset_n
    , output                 c0_ddr4_act_n
    , output  [0 : 0]        c0_ddr4_ck_c
    , output  [0 : 0]        c0_ddr4_ck_t
   `endif
   `endif

`ifdef ENABLE_ETHERNET
`ifndef ENABLE_ETH_LOOP_BACK
    , input                  gt_ref_clk_n
    , input                  gt_ref_clk_p
    , input                  gt_rx_gt_port_0_n
    , input                  gt_rx_gt_port_0_p
    , input                  gt_rx_gt_port_1_n
    , input                  gt_rx_gt_port_1_p
    , input                  gt_rx_gt_port_2_n
    , input                  gt_rx_gt_port_2_p
    , input                  gt_rx_gt_port_3_n
    , input                  gt_rx_gt_port_3_p
    , output                 gt_tx_gt_port_0_n
    , output                 gt_tx_gt_port_0_p
    , output                 gt_tx_gt_port_1_n
    , output                 gt_tx_gt_port_1_p
    , output                 gt_tx_gt_port_2_n
    , output                 gt_tx_gt_port_2_p
    , output                 gt_tx_gt_port_3_n
    , output                 gt_tx_gt_port_3_p
`endif
`endif

`ifdef ENABLE_9H3_LED
     , output                 user_led_a0
     , output                 user_led_a1
     , output                 user_led_g0
     , output                 user_led_g1
`endif
`ifdef ENABLE_9H3_EEPROM
     , inout                  eeprom_scl
     , inout                  eeprom_sda
     , output                 eeprom_wp
`endif
`ifdef ENABLE_9H3_AVR
    , input                  avr_rx
    , output                 avr_tx
    , input                  avr_ck
`endif
);

// ==============================================================================================================================
// @@@  SIG: Internal signals 
// ==============================================================================================================================

// Interface to AFU Descriptor table (interface is Read Only)
  wire  [5:0] cfg_desc_afu_index
; wire [30:0] cfg_desc_offset
; wire        cfg_desc_cmd_valid
; wire [31:0] desc_cfg_data
; wire        desc_cfg_data_valid
; wire        desc_cfg_echo_cmd_valid
; wire [31:0] desc0_cfg_data
; wire        desc0_cfg_data_valid
; wire        desc0_cfg_echo_cmd_valid
 
// Between other modules in the file
; wire        reset_afu00
; wire        resync_credits_afu00
; 

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


assign f1_ro_csh_expansion_rom_bar       = f1_csh_expansion_rom_bar      ;
assign f1_ro_csh_subsystem_id            = f1_csh_subsystem_id           ;
assign f1_ro_csh_subsystem_vendor_id     = f1_csh_subsystem_vendor_id    ;
assign f1_ro_csh_mmio_bar0_size          = f1_csh_mmio_bar0_size         ;
assign f1_ro_csh_mmio_bar1_size          = f1_csh_mmio_bar1_size         ;
assign f1_ro_csh_mmio_bar2_size          = f1_csh_mmio_bar2_size         ;
assign f1_ro_csh_mmio_bar0_prefetchable  = f1_csh_mmio_bar0_prefetchable ;
assign f1_ro_csh_mmio_bar1_prefetchable  = f1_csh_mmio_bar1_prefetchable ;
assign f1_ro_csh_mmio_bar2_prefetchable  = f1_csh_mmio_bar2_prefetchable ;
assign f1_ro_pasid_max_pasid_width       = f1_pasid_max_pasid_width      ;
assign f1_ro_ofunc_reset_duration        = f1_ofunc_reset_duration       ;
assign f1_ro_ofunc_afu_present           = f1_ofunc_afu_present          ;
assign f1_ro_ofunc_max_afu_index         = f1_ofunc_max_afu_index        ;
assign f1_ro_octrl00_reset_duration      = f1_octrl00_reset_duration     ;
assign f1_ro_octrl00_afu_control_index   = f1_octrl00_afu_control_index  ;
assign f1_ro_octrl00_pasid_len_supported = f1_octrl00_pasid_len_supported;
assign f1_ro_octrl00_metadata_supported  = f1_octrl00_metadata_supported ;
assign f1_ro_octrl00_actag_len_supported = f1_octrl00_actag_len_supported;


// ==============================================================================================================================
// @@@ CFG_F1: Function 1 Capability Structures (controls AFU)
// ==============================================================================================================================

// Signals from AFU
  wire         afu_f1_cfg_terminate_in_progress  // CFG_F1 input

// Declare F1 outputs
; wire         cfg_f1_csh_memory_space
; wire  [63:0] cfg_f1_csh_mmio_bar0
; wire  [63:0] cfg_f1_csh_mmio_bar1
; wire  [63:0] cfg_f1_csh_mmio_bar2
; wire  [31:0] cfg_f1_csh_expansion_ROM_bar
; wire         cfg_f1_csh_expansion_ROM_enable
; wire         cfg_f1_ofunc_function_reset      
; wire  [11:0] cfg_f1_ofunc_func_actag_base
; wire  [11:0] cfg_f1_ofunc_func_actag_len_enab
; wire   [5:0] cfg_f1_octrl00_afu_control_index 
; wire   [3:0] cfg_f1_octrl00_afu_unique              
//; wire         cfg_f1_octrl00_fence_afu            Move to 'output'
; wire         cfg_f1_octrl00_enable_afu           
; wire         cfg_f1_octrl00_reset_afu            
; wire         cfg_f1_octrl00_terminate_valid      
; wire  [19:0] cfg_f1_octrl00_terminate_pasid      
; wire   [4:0] cfg_f1_octrl00_pasid_length_enabled
; wire         cfg_f1_octrl00_metadata_enabled
; wire   [2:0] cfg_f1_octrl00_host_tag_run_length
; wire  [19:0] cfg_f1_octrl00_pasid_base
; wire  [11:0] cfg_f1_octrl00_afu_actag_len_enab
; wire  [11:0] cfg_f1_octrl00_afu_actag_base
;

wire   cfg_f1_reset;
assign cfg_f1_reset = (reset == 1'b1 || cfg_f1_ofunc_function_reset == 1'b1) ? 1'b1 : 1'b0;   // Apply on hardware reset OR software cmd (Function Reset)

cfg_func1 cfg_f1
    (
      // -- Clocks & Reset
      .clock                               ( clock_tlx ),                                     // -- input     
      .reset                               ( cfg_f1_reset ),                              // -- input     
      .device_reset                        ( reset ),                                     // -- input     
                                                                                        
      // -- READ ONLY field inputs                                                      
      // -- Configuration Space Header                                                  
      .cfg_ro_csh_device_id                ( 16'h062B ),                                  // -- input
      .cfg_ro_csh_vendor_id                ( 16'h1014 ),                                  // -- input
      .cfg_ro_csh_class_code               ( 24'h120000 ),                                // -- input
      .cfg_ro_csh_revision_id              (  8'h00 ),                                    // -- input
      .cfg_ro_csh_multi_function           (  1'b1 ),                                     // -- input
      .cfg_ro_csh_mmio_bar0_size           ( f1_ro_csh_mmio_bar0_size         ),          // -- input    // -- [63:n+1]=1, [n:0]=0 to indicate MMIO region size (default 64 MB)
      .cfg_ro_csh_mmio_bar1_size           ( f1_ro_csh_mmio_bar1_size         ),          // -- input    // -- [63:n+1]=1, [n:0]=0 to indicate MMIO region size (default 0 MB)
      .cfg_ro_csh_mmio_bar2_size           ( f1_ro_csh_mmio_bar2_size         ),          // -- input    // -- [63:n+1]=1, [n:0]=0 to indicate MMIO region size (default 0 MB)
      .cfg_ro_csh_mmio_bar0_prefetchable   ( f1_ro_csh_mmio_bar0_prefetchable ),          // -- input    
      .cfg_ro_csh_mmio_bar1_prefetchable   ( f1_ro_csh_mmio_bar1_prefetchable ),          // -- input
      .cfg_ro_csh_mmio_bar2_prefetchable   ( f1_ro_csh_mmio_bar2_prefetchable ),          // -- input
      .cfg_ro_csh_subsystem_id             ( f1_ro_csh_subsystem_id           ),          // -- input
      .cfg_ro_csh_subsystem_vendor_id      ( f1_ro_csh_subsystem_vendor_id    ),          // -- input
      .cfg_ro_csh_expansion_rom_bar        ( f1_ro_csh_expansion_rom_bar      ),          // -- input    // -- Only [31:11] are used
                                                                                        
      // -- PASID                                                                       
      .cfg_ro_pasid_max_pasid_width        ( f1_ro_pasid_max_pasid_width ),               // -- input    // -- Default is 512 PASIDs
                                                                                        
      // -- Function                                                                    
      .cfg_ro_ofunc_reset_duration         ( f1_ro_ofunc_reset_duration ),                // -- input    // -- Number of cycles Function reset is active (00=256 cycles)
      .cfg_ro_ofunc_afu_present            ( f1_ro_ofunc_afu_present    ),                                     // -- input    // -- Func0=0, FuncN=1 (likely)
      .cfg_ro_ofunc_max_afu_index          ( f1_ro_ofunc_max_afu_index  ),                // -- input    // -- Default is AFU number 0
                                                                                        
      // -- AFU 0 Control                                                               
      .cfg_ro_octrl00_reset_duration       ( f1_ro_octrl00_reset_duration      ),         // -- input    // -- Number of cycles AFU reset is active (00=256 cycles)
      .cfg_ro_octrl00_afu_control_index    ( f1_ro_octrl00_afu_control_index   ),         // -- input    // -- Control structure for AFU Index 0
      .cfg_ro_octrl00_pasid_len_supported  ( f1_ro_octrl00_pasid_len_supported ),         // -- input    // -- Default is 512 PASID
      .cfg_ro_octrl00_metadata_supported   ( f1_ro_octrl00_metadata_supported  ),         // -- input    // -- MetaData is not supported
      .cfg_ro_octrl00_actag_len_supported  ( f1_ro_octrl00_actag_len_supported ),         // -- input    // -- Default is 32 acTags
                                                                                        
      // -- Assigned configuration values                                               
      .cfg_ro_function                     ( ro_function ),                               // -- input
                                                                                        
      // -- Functional interface                                                        
      .cfg_function                        ( cfg_function[2:0] ),                         // -- input    // -- Targeted Function                                                                     
      .cfg_portnum                         ( cfg_portnum[1:0] ),                          // -- input    // -- Targeted TLX port                                                                     
      .cfg_addr                            ( cfg_addr[11:0] ),                            // -- input    // -- Target address for the read or write access                                           
      .cfg_wdata                           ( cfg_wdata[31:0] ),                           // -- input    // -- Write data into selected config reg                                                   
      .cfg_rdata                           ( cfg_f1_rdata[31:0] ),                        // -- output   // -- Read  data from selected config reg                                                   
      .cfg_rdata_vld                       ( cfg_f1_rdata_vld ),                          // -- output   // -- When observed in the proper cycle, indicates if cfg_rdata has valid information       
      .cfg_wr_1B                           ( cfg_wr_1B ),                                 // -- input    // -- When 1, triggers a write operation of 1 byte  (cfg_addr[1:0] selects byte)            
      .cfg_wr_2B                           ( cfg_wr_2B ),                                 // -- input    // -- When 1, triggers a write operation of 2 bytes (cfg_addr[1]   selects starting byte)   
      .cfg_wr_4B                           ( cfg_wr_4B ),                                 // -- input    // -- When 1, triggers a write operation of all 4 bytes                                     
      .cfg_rd                              ( cfg_rd ),                                    // -- input    // -- When 1, triggers a read operation that returns all 4 bytes of data from the reg       
      .cfg_bad_op_or_align                 ( cfg_f1_bad_op_or_align ),                    // -- output   // -- Pulsed when multiple write/read strobes are active or writes are not naturally aligned
      .cfg_addr_not_implemented            ( cfg_f1_addr_not_implemented ),               // -- output   // -- Pulsed when address provided is not implemented within the ACS space
                                                                                        
      // -- Inputs defined by active AFU logic                                          
      .cfg_octrl00_terminate_in_progress   ( afu_f1_cfg_terminate_in_progress ),          // -- input    // -- When 1, a PASID is in the process of being terminated (set to 1 immediately after 'terminate valid')
                                                                                        
      // -- Individual fields from configuration registers                              
      // -- CSH                                                                         
      .cfg_csh_memory_space                ( cfg_f1_csh_memory_space ),                   // -- output
      .cfg_csh_mmio_bar0                   ( cfg_f1_csh_mmio_bar0[63:0] ),                // -- output
      .cfg_csh_mmio_bar1                   ( cfg_f1_csh_mmio_bar1[63:0] ),                // -- output   // -- Unused 
      .cfg_csh_mmio_bar2                   ( cfg_f1_csh_mmio_bar2[63:0] ),                // -- output   // -- Unused 
      .cfg_csh_expansion_ROM_bar           ( cfg_f1_csh_expansion_ROM_bar[31:0] ),        // -- output   // -- Unused
      .cfg_csh_expansion_ROM_enable        ( cfg_f1_csh_expansion_ROM_enable ),           // -- output   // -- Unused
                                                                                        
      // -- OFUNC                                                                       
      .cfg_ofunc_function_reset            ( cfg_f1_ofunc_function_reset ),               // -- output   // -- When 1, reset this Function
      .cfg_ofunc_func_actag_base           ( cfg_f1_ofunc_func_actag_base[11:0] ),        // -- output
      .cfg_ofunc_func_actag_len_enab       ( cfg_f1_ofunc_func_actag_len_enab[11:0] ),    // -- output
                                                                                        
      // -- OCTRL                                                                       
      .cfg_octrl00_afu_control_index       ( cfg_f1_octrl00_afu_control_index[5:0] ),     // -- output   // -- AFU number that other octrl signals refer to (control 1 AFU at a time)
      .cfg_octrl00_afu_unique              ( cfg_f1_octrl00_afu_unique[3:0] ),            // -- output   // -- Each AFU can assign a use to this (OCTRL, h0C, bit [31:28])
      .cfg_octrl00_fence_afu               ( cfg_f1_octrl00_fence_afu ),                  // -- output   // -- When 1, isolate the selected AFU from all other units (likely in preparation for re-configuring it)
      .cfg_octrl00_enable_afu              ( cfg_f1_octrl00_enable_afu ),                 // -- output   // -- When 1, the selected AFU can initiate commands to the host
      .cfg_octrl00_reset_afu               ( cfg_f1_octrl00_reset_afu ),                  // -- output   // -- When 1, reset the selected AFU
      .cfg_octrl00_terminate_valid         ( cfg_f1_octrl00_terminate_valid ),            // -- output   // -- When 1, terminate the specified PASID process
      .cfg_octrl00_terminate_pasid         ( cfg_f1_octrl00_terminate_pasid[19:0] ),      // -- output   // -- Which PASID 'terminate valid' applies to
      .cfg_octrl00_pasid_length_enabled    ( cfg_f1_octrl00_pasid_length_enabled[4:0] ),  // -- output
      .cfg_octrl00_metadata_enabled        ( cfg_f1_octrl00_metadata_enabled ),           // -- output
      .cfg_octrl00_host_tag_run_length     ( cfg_f1_octrl00_host_tag_run_length[2:0] ),   // -- output
      .cfg_octrl00_pasid_base              ( cfg_f1_octrl00_pasid_base[19:0] ),           // -- output
      .cfg_octrl00_afu_actag_base          ( cfg_f1_octrl00_afu_actag_base[11:0] ),       // -- output
      .cfg_octrl00_afu_actag_len_enab      ( cfg_f1_octrl00_afu_actag_len_enab[11:0] ),   // -- output

      // -- Interface to AFU Descriptor table (interface is Read Only)
      .cfg_desc_afu_index                  ( cfg_desc_afu_index[5:0] ),                   // -- output
      .cfg_desc_offset                     ( cfg_desc_offset[30:0] ),                     // -- output
      .cfg_desc_cmd_valid                  ( cfg_desc_cmd_valid ),                        // -- output
      .desc_cfg_data                       ( desc_cfg_data[31:0] ),                       // -- input
      .desc_cfg_data_valid                 ( desc_cfg_data_valid ),                       // -- input
      .desc_cfg_echo_cmd_valid             ( desc_cfg_echo_cmd_valid )                    // -- input

    );


// Combine Descriptor outputs before sending into Config Space 
// When used with multiple descriptors representing multiple AFUs, connect the inputs thusly at the next level up:
//    (into afu_config_space.v) = (out of DESC0 instance)          (out of DESC1 instance)    (out of other DESC instances)
assign desc_cfg_echo_cmd_valid  = desc0_cfg_echo_cmd_valid ; // &  desc1_cfg_echo_cmd_valid & ... ;
assign desc_cfg_data_valid      = desc0_cfg_data_valid     ; // |  desc1_cfg_data_valid     | ... ;
assign desc_cfg_data            = desc0_cfg_data           ; // |  desc1_cfg_data           | ... ;

// Resync credits control
assign cfg_f1_octrl00_resync_credits = cfg_f1_octrl00_afu_unique[0];   // Assign AFU Unique[0] as resync_credits signal 
assign resync_credits_afu00          = cfg_f1_octrl00_afu_unique[0];   // Make a copy for internal use, as get Warning when an output as an input




// Set AFU reset on either: card reset OR function reset OR software reset to AFU 0
assign reset_afu00 = ( reset == 1'b1        || 
                       cfg_f1_reset == 1'b1 ||
                      (cfg_f1_octrl00_reset_afu == 1'b1 && cfg_f1_octrl00_afu_control_index == 6'b000000) ) ? 1'b1 : 1'b0; 

wire afu_tlx_fatal_error; //MF currently unconnected

framework_afu  fw_afu 
    (
      // -- Clocks & Reset
      .clock_tlx                           ( clock_tlx),                                 // -- input
      .clock_afu                           ( clock_afu ),                                 // -- input
      .reset                               ( reset_afu00 ),                               // -- input
      .decouple                            ( decouple ),                                  // -- input
      .ocde                                ( ocde ),                                     //connected from top-level port
      .ocde_to_bsp_dcpl                    ( ocde_to_bsp_dcpl ),
                                                                                         
  `ifdef ENABLE_DDR 
  `ifdef AD9V3
  
   // DDR4 SDRAM Interface
      .c0_sys_clk_p     ( c0_sys_clk_p     ) ,
      .c0_sys_clk_n     ( c0_sys_clk_n     ) ,
      .c0_ddr4_adr      ( c0_ddr4_adr      ) ,
      .c0_ddr4_ba       ( c0_ddr4_ba       ) ,
      .c0_ddr4_cke      ( c0_ddr4_cke      ) ,
      .c0_ddr4_cs_n     ( c0_ddr4_cs_n     ) ,
      .c0_ddr4_dm_dbi_n ( c0_ddr4_dm_dbi_n ) ,
      .c0_ddr4_dq       ( c0_ddr4_dq       ) ,
      .c0_ddr4_dqs_c    ( c0_ddr4_dqs_c    ) ,
      .c0_ddr4_dqs_t    ( c0_ddr4_dqs_t    ) ,
      .c0_ddr4_odt      ( c0_ddr4_odt      ) ,
      .c0_ddr4_bg       ( c0_ddr4_bg       ) ,
      .c0_ddr4_reset_n  ( c0_ddr4_reset_n  ) ,
      .c0_ddr4_act_n    ( c0_ddr4_act_n    ) ,
      .c0_ddr4_ck_c     ( c0_ddr4_ck_c     ) ,
      .c0_ddr4_ck_t     ( c0_ddr4_ck_t     ) ,
   `endif
   `ifdef BW250SOC
  
   // DDR4 SDRAM Interface
      .c0_sys_clk_p     ( c0_sys_clk_p     ) ,
      .c0_sys_clk_n     ( c0_sys_clk_n     ) ,
      .c0_ddr4_adr      ( c0_ddr4_adr      ) ,
      .c0_ddr4_ba       ( c0_ddr4_ba       ) ,
      .c0_ddr4_cke      ( c0_ddr4_cke      ) ,
      .c0_ddr4_cs_n     ( c0_ddr4_cs_n     ) ,
      .c0_ddr4_dm_dbi_n ( c0_ddr4_dm_dbi_n ) ,
      .c0_ddr4_dq       ( c0_ddr4_dq       ) ,
      .c0_ddr4_dqs_c    ( c0_ddr4_dqs_c    ) ,
      .c0_ddr4_dqs_t    ( c0_ddr4_dqs_t    ) ,
      .c0_ddr4_odt      ( c0_ddr4_odt      ) ,
      .c0_ddr4_bg       ( c0_ddr4_bg       ) ,
      .c0_ddr4_reset_n  ( c0_ddr4_reset_n  ) ,
      .c0_ddr4_act_n    ( c0_ddr4_act_n    ) ,
      .c0_ddr4_ck_c     ( c0_ddr4_ck_c     ) ,
      .c0_ddr4_ck_t     ( c0_ddr4_ck_t     ) ,
   `endif

   `endif
  `ifdef ENABLE_ETHERNET
  `ifndef ENABLE_ETH_LOOP_BACK
      .gt_ref_clk_n      ( gt_ref_clk_n       ),
      .gt_ref_clk_p      ( gt_ref_clk_p       ),
      .gt_rx_gt_port_0_n ( gt_rx_gt_port_0_n  ),
      .gt_rx_gt_port_0_p ( gt_rx_gt_port_0_p  ),
      .gt_rx_gt_port_1_n ( gt_rx_gt_port_1_n  ),
      .gt_rx_gt_port_1_p ( gt_rx_gt_port_1_p  ),
      .gt_rx_gt_port_2_n ( gt_rx_gt_port_2_n  ),
      .gt_rx_gt_port_2_p ( gt_rx_gt_port_2_p  ),
      .gt_rx_gt_port_3_n ( gt_rx_gt_port_3_n  ),
      .gt_rx_gt_port_3_p ( gt_rx_gt_port_3_p  ),
      .gt_tx_gt_port_0_n ( gt_tx_gt_port_0_n  ),
      .gt_tx_gt_port_0_p ( gt_tx_gt_port_0_p  ),
      .gt_tx_gt_port_1_n ( gt_tx_gt_port_1_n  ),
      .gt_tx_gt_port_1_p ( gt_tx_gt_port_1_p  ),
      .gt_tx_gt_port_2_n ( gt_tx_gt_port_2_n  ),
      .gt_tx_gt_port_2_p ( gt_tx_gt_port_2_p  ),
      .gt_tx_gt_port_3_n ( gt_tx_gt_port_3_n  ),
      .gt_tx_gt_port_3_p ( gt_tx_gt_port_3_p  ),
   `endif
   `endif

   `ifdef ENABLE_9H3_LED
      .user_led_a0     ( user_led_a0        ),
      .user_led_a1     ( user_led_a1        ),
      .user_led_g0     ( user_led_g0        ),
      .user_led_g1     ( user_led_g1        ),
   `endif
   `ifdef ENABLE_9H3_EEPROM
      .eeprom_scl      (eeprom_scl          ),
      .eeprom_sda      (eeprom_sda          ),
      .eeprom_wp       (eeprom_wp           ),
   `endif
   `ifdef ENABLE_9H3_AVR
      .avr_rx          (avr_rx              ),
      .avr_tx          (avr_tx              ),
      .avr_ck          (avr_ck              ),
    `endif

      // -- AFU Index
      .afu_index                           ( 6'b000000 ),                                 // -- input   // -- This AFU is number 0                                                      
                                                                                         
      // -- TLX_AFU command receive interface                                            
      .tlx_afu_ready                       ( tlx_afu_ready ),                             // -- input
      .tlx_afu_cmd_valid                   ( tlx_afu_cmd_valid ),                         // -- input
      .tlx_afu_cmd_opcode                  ( tlx_afu_cmd_opcode[7:0] ),                   // -- input
      .tlx_afu_cmd_capptag                 ( tlx_afu_cmd_capptag[15:0] ),                 // -- input
      .tlx_afu_cmd_dl                      ( tlx_afu_cmd_dl[1:0] ),                       // -- input
      .tlx_afu_cmd_pl                      ( tlx_afu_cmd_pl[2:0] ),                       // -- input
      .tlx_afu_cmd_be                      ( tlx_afu_cmd_be[63:0] ),                      // -- input
      .tlx_afu_cmd_end                     ( tlx_afu_cmd_end ),                           // -- input
      .tlx_afu_cmd_pa                      ( tlx_afu_cmd_pa[63:0] ),                      // -- input
      .tlx_afu_cmd_flag                    ( tlx_afu_cmd_flag[3:0] ),                     // -- input
      .tlx_afu_cmd_os                      ( tlx_afu_cmd_os ),                            // -- input
                                                                                         
      .afu_tlx_cmd_rd_req                  ( afu_tlx_cmd_rd_req ),                        // -- output
      .afu_tlx_cmd_rd_cnt                  ( afu_tlx_cmd_rd_cnt[2:0] ),                   // -- output
                                                                                         
      .tlx_afu_cmd_data_valid              ( tlx_afu_cmd_data_valid ),                    // -- input
      .tlx_afu_cmd_data_bdi                ( tlx_afu_cmd_data_bdi ),                      // -- input
      .tlx_afu_cmd_data_bus                ( tlx_afu_cmd_data_bus[511:0] ),               // -- input
                                                                                         
      .afu_tlx_cmd_credit                  ( afu_tlx_cmd_credit ),                        // -- output
      .afu_tlx_cmd_initial_credit          ( afu_tlx_cmd_initial_credit[6:0] ),           // -- output
                                                                                         
      // -- AFU_TLX response transmit interface                                          
      .afu_tlx_resp_valid                  ( afu_tlx_resp_valid ),                        // -- output
      .afu_tlx_resp_opcode                 ( afu_tlx_resp_opcode[7:0] ),                  // -- output
      .afu_tlx_resp_dl                     ( afu_tlx_resp_dl[1:0] ),                      // -- output
      .afu_tlx_resp_capptag                ( afu_tlx_resp_capptag[15:0] ),                // -- output
      .afu_tlx_resp_dp                     ( afu_tlx_resp_dp[1:0] ),                      // -- output
      .afu_tlx_resp_code                   ( afu_tlx_resp_code[3:0] ),                    // -- output
                                                                                         
      .afu_tlx_rdata_valid                 ( afu_tlx_rdata_valid ),                       // -- output
      .afu_tlx_rdata_bdi                   ( afu_tlx_rdata_bdi ),                         // -- output
      .afu_tlx_rdata_bus                   ( afu_tlx_rdata_bus[511:0] ),                  // -- output
                                                                                         
      .tlx_afu_resp_credit                 ( tlx_afu_resp_credit ),                       // -- input
      .tlx_afu_resp_data_credit            ( tlx_afu_resp_data_credit ),                  // -- input
                                                                                         
      // -- AFU_TLX command transmit interface                                           
      .afu_tlx_cmd_valid                   ( afu_tlx_cmd_valid ),                         // -- output
      .afu_tlx_cmd_opcode                  ( afu_tlx_cmd_opcode[7:0] ),                   // -- output
      .afu_tlx_cmd_actag                   ( afu_tlx_cmd_actag[11:0] ),                   // -- output
      .afu_tlx_cmd_stream_id               ( afu_tlx_cmd_stream_id[3:0] ),                // -- output
      .afu_tlx_cmd_ea_or_obj               ( afu_tlx_cmd_ea_or_obj[67:0] ),               // -- output
      .afu_tlx_cmd_afutag                  ( afu_tlx_cmd_afutag[15:0] ),                  // -- output
      .afu_tlx_cmd_dl                      ( afu_tlx_cmd_dl[1:0] ),                       // -- output
      .afu_tlx_cmd_pl                      ( afu_tlx_cmd_pl[2:0] ),                       // -- output
      .afu_tlx_cmd_os                      ( afu_tlx_cmd_os ),                            // -- output
      .afu_tlx_cmd_be                      ( afu_tlx_cmd_be[63:0] ),                      // -- output
      .afu_tlx_cmd_flag                    ( afu_tlx_cmd_flag[3:0] ),                     // -- output
      .afu_tlx_cmd_endian                  ( afu_tlx_cmd_endian ),                        // -- output
      .afu_tlx_cmd_bdf                     ( afu_tlx_cmd_bdf[15:0] ),                     // -- output
      .afu_tlx_cmd_pasid                   ( afu_tlx_cmd_pasid[19:0] ),                   // -- output
      .afu_tlx_cmd_pg_size                 ( afu_tlx_cmd_pg_size[5:0] ),                  // -- output
                                                                                         
      .afu_tlx_cdata_valid                 ( afu_tlx_cdata_valid ),                       // -- output
      .afu_tlx_cdata_bdi                   ( afu_tlx_cdata_bdi ),                         // -- output
      .afu_tlx_cdata_bus                   ( afu_tlx_cdata_bus[511:0] ),                  // -- output
                                                                                         
      .tlx_afu_cmd_credit                  ( tlx_afu_cmd_credit ),                        // -- input
      .tlx_afu_cmd_data_credit             ( tlx_afu_cmd_data_credit ),                   // -- input
                                                                                         
//GFP            .tlx_afu_cmd_resp_initial_credit_x   ( tlx_afu_cmd_resp_initial_credit_x[4:3] ),    // -- input
      .tlx_afu_cmd_initial_credit_x        ( 1'b0 ),         // -- input
//GFP            .tlx_afu_cmd_resp_initial_credit     ( tlx_afu_cmd_resp_initial_credit[2:0] ),      // -- input
      .tlx_afu_cmd_initial_credit          ( tlx_afu_cmd_initial_credit ),           // -- input
      .tlx_afu_resp_initial_credit         ( tlx_afu_resp_initial_credit ),          // -- input
//GFP            .tlx_afu_data_initial_credit_x       ( tlx_afu_data_initial_credit_x[6:5] ),        // -- input
      .tlx_afu_cmd_data_initial_credit_x   ( 1'b0 ),    // -- input
//GFP            .tlx_afu_data_initial_credit         ( tlx_afu_data_initial_credit[4:0] ),          // -- input
      .tlx_afu_cmd_data_initial_credit     ( tlx_afu_cmd_data_initial_credit ),      // -- input
      .tlx_afu_resp_data_initial_credit    ( tlx_afu_resp_data_initial_credit ),     // -- input
                                                                                         
      // -- TLX_AFU response receive interface                                           
      .tlx_afu_resp_valid                  ( tlx_afu_resp_valid ),                        // -- input
      .tlx_afu_resp_opcode                 ( tlx_afu_resp_opcode[7:0] ),                  // -- input
      .tlx_afu_resp_afutag                 ( tlx_afu_resp_afutag[15:0] ),                 // -- input
      .tlx_afu_resp_code                   ( tlx_afu_resp_code[3:0] ),                    // -- input
      .tlx_afu_resp_dl                     ( tlx_afu_resp_dl[1:0] ),                      // -- input
      .tlx_afu_resp_dp                     ( tlx_afu_resp_dp[1:0] ),                      // -- input
      .tlx_afu_resp_pg_size                ( tlx_afu_resp_pg_size[5:0] ),                 // -- input
      .tlx_afu_resp_addr_tag               ( tlx_afu_resp_addr_tag[17:0] ),               // -- input
// -- .tlx_afu_resp_host_tag               ( tlx_afu_resp_host_tag[23:0] ),               // -- input   // -- Reserved for CAPI 4.0
// -- .tlx_afu_resp_cache_state            ( tlx_afu_resp_cache_state[3:0] ),             // -- input   // -- Reserved for CAPI 4.0
                                                                                         
      .afu_tlx_resp_rd_req                 ( afu_tlx_resp_rd_req ),                       // -- output
      .afu_tlx_resp_rd_cnt                 ( afu_tlx_resp_rd_cnt[2:0] ),                  // -- output
                                                                                         
      .tlx_afu_resp_data_valid             ( tlx_afu_resp_data_valid ),                   // -- input
      .tlx_afu_resp_data_bdi               ( tlx_afu_resp_data_bdi ),                     // -- input
      .tlx_afu_resp_data_bus               ( tlx_afu_resp_data_bus[511:0] ),              // -- input
                                                                                         
      .afu_tlx_resp_credit                 ( afu_tlx_resp_credit ),                       // -- output
      .afu_tlx_resp_initial_credit         ( afu_tlx_resp_initial_credit[6:0] ),          // -- output

      .afu_tlx_fatal_error                 ( afu_tlx_fatal_error ),                       // -- output

      // -- BDF Interface                                                                
      .cfg_afu_bdf_bus                     ( cfg_bus[7:0] ),                              // -- input
      .cfg_afu_bdf_device                  ( ro_device[4:0] ),                            // -- input
      .cfg_afu_bdf_function                ( ro_function[2:0] ),                          // -- input

      // -- Configuration Space Outputs used by AFU
      // -- MMIO
      .cfg_csh_memory_space                ( cfg_f1_csh_memory_space ),                   // -- input
      .cfg_csh_mmio_bar0                   ( cfg_f1_csh_mmio_bar0[63:0] ),                // -- input

      // -- 'assign_actag' generation controls
      .cfg_octrl00_afu_actag_len_enab      ( cfg_f1_octrl00_afu_actag_len_enab[11:0] ),   // -- input
      .cfg_octrl00_afu_actag_base          ( cfg_f1_octrl00_afu_actag_base[11:0] ),       // -- input

      // -- Process termination controls
      .cfg_octrl00_terminate_in_progress   ( afu_f1_cfg_terminate_in_progress ),          // -- output
      .cfg_octrl00_terminate_valid         ( cfg_f1_octrl00_terminate_valid ),            // -- input
      .cfg_octrl00_terminate_pasid         ( cfg_f1_octrl00_terminate_pasid[19:0] ),      // -- input

      //--  PASID controls
      .cfg_octrl00_pasid_length_enabled    ( cfg_f1_octrl00_pasid_length_enabled[4:0] ),  // -- input
      .cfg_octrl00_pasid_base              ( cfg_f1_octrl00_pasid_base[19:0] ),           // -- input

      // -- Interrupt generation controls
      .cfg_f0_otl0_long_backoff_timer      ( cfg_f0_otl0_long_backoff_timer[3:0] ),       // -- input
      .cfg_f0_otl0_short_backoff_timer     ( cfg_f0_otl0_short_backoff_timer[3:0] ),      // -- input
      .cfg_octrl00_enable_afu              ( cfg_f1_octrl00_enable_afu ),                 // -- input   // -- When 1, the AFU can initiate commands to the host

      // -- Interface to AFU Descriptor table (interface is Read Only
      .cfg_desc_afu_index                  ( cfg_desc_afu_index[5:0] ),                   // -- input
      .cfg_desc_offset                     ( cfg_desc_offset[30:0] ),                     // -- input
      .cfg_desc_cmd_valid                  ( cfg_desc_cmd_valid ),                        // -- input
      .desc_cfg_data                       ( desc0_cfg_data[31:0] ),                      // -- output
      .desc_cfg_data_valid                 ( desc0_cfg_data_valid ),                      // -- output
      .desc_cfg_echo_cmd_valid             ( desc0_cfg_echo_cmd_valid ),                  // -- output

      // -- Errors to record from CFG Sub-System, Descriptor Table, and VPD
      .vpd_err_unimplemented_addr          ( vpd_err_unimplemented_addr ),                // -- input
      .cfg0_cff_fifo_overflow              ( cfg0_cff_fifo_overflow ),                    // -- input
// -- .cfg1_cff_fifo_overflow              ( cfg1_cff_fifo_overflow ),                    // -- input
      .cfg0_rff_fifo_overflow              ( cfg0_rff_fifo_overflow ),                    // -- input
// -- .cfg1_rff_fifo_overflow              ( cfg1_rff_fifo_overflow ),                    // -- input
      .cfg_errvec                          ( cfg_errvec ),                                // -- input
      .cfg_errvec_valid                    ( cfg_errvec_valid )                           // -- input

    );





endmodule //-- oc_cfg
