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
module oc_cfg (

    // -----------------------------------
    // Miscellaneous Ports
    // -----------------------------------
    input          clock                             
  , input          reset_n                            // (active low) Hardware reset

     // Hardcoded configuration inputs
  , input    [4:0] ro_device                          // Assigned to this Device instantiation at the next level
  , input   [31:0] ro_dlx0_version                    // Connect to DLX output at next level, or tie off to all 0s
  , input   [31:0] ro_tlx0_version                    // Connect to TLX output at next level, or tie off to all 0s

    // -----------------------------------
    // TLX0 Parser -> AFU Receive Interface
    // -----------------------------------

  , input          tlx_afu_ready                      // When 1, TLX is ready to receive both commands and responses from the AFU

    // Command interface to AFU
  , output [  6:0] afu_tlx_cmd_initial_credit         // (static) Number of cmd credits available for TLX to use in the AFU      
  , output         afu_tlx_cmd_credit                 // Returns a cmd credit to the TLX
  , input          tlx_afu_cmd_valid                  // Indicates TLX has a valid cmd for AFU to process
  , input  [  7:0] tlx_afu_cmd_opcode                 // (w/cmd_valid) Cmd Opcode
  , input  [  1:0] tlx_afu_cmd_dl                     // (w/cmd_valid) Cmd Data Length (00=rsvd, 01=64B, 10=128B, 11=256B) 
  , input          tlx_afu_cmd_end                    // (w/cmd_valid) Operand Endian-ess 
  , input  [ 63:0] tlx_afu_cmd_pa                     // (w/cmd_valid) Physical Address
  , input  [  3:0] tlx_afu_cmd_flag                   // (w/cmd_valid) Specifies atomic memory operation (unsupported) 
  , input          tlx_afu_cmd_os                     // (w/cmd_valid) Ordered Segment - 1 means ordering is guaranteed (unsupported) 
  , input  [ 15:0] tlx_afu_cmd_capptag                // (w/cmd_valid) Unique operation tag from CAPP unit     
  , input  [  2:0] tlx_afu_cmd_pl                     // (w/cmd_valid) Partial Length (000=1B,001=2B,010=4B,011=8B,100=16B,101=32B,110/111=rsvd)
  , input  [ 63:0] tlx_afu_cmd_be                     // (w/cmd_valid) Byte Enable   

    // Response interface to AFU
  , output [  6:0] afu_tlx_resp_initial_credit        // (static) Number of resp credits available for TLX to use in the AFU     
  , output         afu_tlx_resp_credit                // Returns a resp credit to the TLX     
  , input          tlx_afu_resp_valid                 // Indicates TLX has a valid resp for AFU to process  
  , input  [  7:0] tlx_afu_resp_opcode                // (w/resp_valid) Resp Opcode     
  , input  [ 15:0] tlx_afu_resp_afutag                // (w/resp_valid) Resp Tag    
  , input  [  3:0] tlx_afu_resp_code                  // (w/resp_valid) Describes the reason for a failed transaction     
  , input  [  5:0] tlx_afu_resp_pg_size               // (w/resp_valid) Page size     
  , input  [  1:0] tlx_afu_resp_dl                    // (w/resp_valid) Resp Data Length (00=rsvd, 01=64B, 10=128B, 11=256B)     
  , input  [  1:0] tlx_afu_resp_dp                    // (w/resp_valid) Data Part, indicates the data content of the current resp packet     
  , input  [ 23:0] tlx_afu_resp_host_tag              // (w/resp_valid) Tag for data held in AFU L1 (unsupported, CAPI 4.0 feature)     
  , input  [  3:0] tlx_afu_resp_cache_state           // (w/resp_valid) Gives cache state of cache line obtained     
  , input  [ 17:0] tlx_afu_resp_addr_tag              // (w/resp_valid) Address translation tag for use by AFU with dot-t format commands

    // Command data interface to AFU
  , output         afu_tlx_cmd_rd_req                 // Command Read Request     
  , output [  2:0] afu_tlx_cmd_rd_cnt                 // Command Read Count, number of 64B flits requested (000 is not useful)    
  , input          tlx_afu_cmd_data_valid             // Command Data Valid, when 1 valid data is present on cmd_data_bus
  , input          tlx_afu_cmd_data_bdi               // (w/cmd_data_valid) Bad Data Indicator, when 1 data FLIT is corrupted
  , input  [511:0] tlx_afu_cmd_data_bus               // (w/cmd_data_valid) Command Data Bus, contains the command for the AFU to process     

    // Response data interface to AFU
  , output         afu_tlx_resp_rd_req                // Response Read Request     
  , output [  2:0] afu_tlx_resp_rd_cnt                // Response Read Count, number of 64B flits requested (000 is not useful)      
  , input          tlx_afu_resp_data_valid            // Response Valid, when 1 valid data is present on resp_data     
  , input          tlx_afu_resp_data_bdi              // (w/resp_data_valid) Bad Data Indicator, when 1 data FLIT is corrupted
  , input  [511:0] tlx_afu_resp_data_bus              // (w/resp_data_valid) Response Data, contains data for a read request     

    // Configuration Ports: Drive Configuration (determined by software)
  , output         cfg0_tlx_xmit_tmpl_config_0        // When 1, TLX should support transmitting template 0
  , output         cfg0_tlx_xmit_tmpl_config_1        // When 1, TLX should support transmitting template 1
  , output         cfg0_tlx_xmit_tmpl_config_2        // When 1, TLX should support transmitting template 2
  , output         cfg0_tlx_xmit_tmpl_config_3        // When 1, TLX should support transmitting template 3
  , output [  3:0] cfg0_tlx_xmit_rate_config_0        // Value corresponds to the rate TLX can transmit template 0
  , output [  3:0] cfg0_tlx_xmit_rate_config_1        // Value corresponds to the rate TLX can transmit template 1
  , output [  3:0] cfg0_tlx_xmit_rate_config_2        // Value corresponds to the rate TLX can transmit template 2
  , output [  3:0] cfg0_tlx_xmit_rate_config_3        // Value corresponds to the rate TLX can transmit template 3

    // Configuration Ports: Receive Capabilities (determined by TLX design)
  , input          tlx_cfg0_in_rcv_tmpl_capability_0  // When 1, TLX supports receiving template 0
  , input          tlx_cfg0_in_rcv_tmpl_capability_1  // When 1, TLX supports receiving template 1
  , input          tlx_cfg0_in_rcv_tmpl_capability_2  // When 1, TLX supports receiving template 2
  , input          tlx_cfg0_in_rcv_tmpl_capability_3  // When 1, TLX supports receiving template 3
  , input  [  3:0] tlx_cfg0_in_rcv_rate_capability_0  // Value corresponds to the rate TLX can receive template 0
  , input  [  3:0] tlx_cfg0_in_rcv_rate_capability_1  // Value corresponds to the rate TLX can receive template 1
  , input  [  3:0] tlx_cfg0_in_rcv_rate_capability_2  // Value corresponds to the rate TLX can receive template 2
  , input  [  3:0] tlx_cfg0_in_rcv_rate_capability_3  // Value corresponds to the rate TLX can receive template 3

    // ------------------------------------
    // AFU -> TLX0 Framer Transmit Interface
    // ------------------------------------

    // Initial credit allocation
  , input  [  3:0] tlx_afu_cmd_initial_credit         // Number of starting credits from TLX for AFU->TLX cmd interface
  , input  [  3:0] tlx_afu_resp_initial_credit        // Number of starting credits from TLX for AFU->TLX resp interface
  , input  [  5:0] tlx_afu_cmd_data_initial_credit    // Number of starting credits from TLX for AFU->TLX cmd data interface
  , input  [  5:0] tlx_afu_resp_data_initial_credit   // Number of starting credits from TLX for AFU->TLX resp data interface

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
  , output [ 15:0] afu_tlx_cmd_bdf                    // BDF = Concatenation of 8 bit Bus Number, 5 bit Device Number, and 3 bit Function                  
  , output [ 19:0] afu_tlx_cmd_pasid                 
  , output [  5:0] afu_tlx_cmd_pg_size               

    // Command data from AFU
  , input          tlx_afu_cmd_data_credit           
  , output         afu_tlx_cdata_valid               
  , output [511:0] afu_tlx_cdata_bus                 
  , output         afu_tlx_cdata_bdi                  // When 1, marks command data associated with AFU->host command as bad        

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
  , output         afu_tlx_rdata_bdi                  // When 1, marks response data associated with AFU's reply to Host->AFU cmd as bad                


    // ---------------------------
    // Config_* command interfaces
    // ---------------------------

    // Port 0: config_write/read commands from host    
  , input          tlx_cfg0_valid
  , input    [7:0] tlx_cfg0_opcode
  , input   [63:0] tlx_cfg0_pa
  , input          tlx_cfg0_t
  , input    [2:0] tlx_cfg0_pl
  , input   [15:0] tlx_cfg0_capptag
  , input   [31:0] tlx_cfg0_data_bus
  , input          tlx_cfg0_data_bdi
  , output   [3:0] cfg0_tlx_initial_credit
  , output         cfg0_tlx_credit_return

    // Port 0: config_* responses back to host
  , output         cfg0_tlx_resp_valid
  , output   [7:0] cfg0_tlx_resp_opcode
//, output   [1:0] cfg0_tlx_resp_dl        The TLX will fill in dL=01 and dP=00 as only 1 FLIT is ever used. Comment vs. remove lines here in case another TLX operates differently.
  , output  [15:0] cfg0_tlx_resp_capptag
//, output   [1:0] cfg0_tlx_resp_dp        The TLX will fill in dL=01 and dP=00 as only 1 FLIT is ever used. Comment vs. remove lines here in case another TLX operates differently.
  , output   [3:0] cfg0_tlx_resp_code
  , output   [3:0] cfg0_tlx_rdata_offset
  , output  [31:0] cfg0_tlx_rdata_bus
  , output         cfg0_tlx_rdata_bdi
  , input          tlx_cfg0_resp_ack

    // ------------------------------------
    // Configuration Space to TLX and AFU 
    // ------------------------------------
  //, output         cfg_f1_octrl00_resync_credits   // Make available to TLX

    // ------------------------------------
    // Configuration Space to VPD Interface
    // ------------------------------------

    // Interface to VPD 
  , output [14:0] cfg_vpd_addr                 // VPD address for write or read
  , output        cfg_vpd_wren                 // Set to 1 to write a location, hold at 1 until see vpd_done = 1 then clear to 0
  , output [31:0] cfg_vpd_wdata                // Contains data to write to VPD register (valid while wren=1)
  , output        cfg_vpd_rden                 // Set to 1 to read  a location, hold at 1 until see vpd_done = 1 then clear to 0
  , input  [31:0] vpd_cfg_rdata                // Contains data read back from VPD register (valid when rden=1 and vpd_done=1)
  , input         vpd_cfg_done                 // VPD pulses to 1 for 1 cycle when write is complete, or when rdata contains valid results
    // Error signal
  //, input         vpd_err_unimplemented_addr   // When 1, VPD detected an invalid address

    // ------------------------------------
    // Configuration Space to FLASH Interface
    // ------------------------------------

   // Interface to FLASH control logic
  , output   [1:0] cfg_flsh_devsel        // Select AXI4-Lite device to target
  , output  [13:0] cfg_flsh_addr          // Read or write address to selected target
  , output         cfg_flsh_wren          // Set to 1 to write a location, hold at 1 until see 'flsh_done' = 1 then clear to 0
  , output  [31:0] cfg_flsh_wdata         // Contains data to write to FLASH register (valid while wren=1)
  , output         cfg_flsh_rden          // Set to 1 to read  a location, hold at 1 until see 'flsh_done' = 1 the clear to 0
  , input   [31:0] flsh_cfg_rdata         // Contains data read back from FLASH register (valid when rden=1 and 'flsh_done'=1)
  , input          flsh_cfg_done          // FLASH logic pulses to 1 for 1 cycle when write is complete, or when rdata contains valid results
  , input    [7:0] flsh_cfg_status        // Device Specific status information
  , input    [1:0] flsh_cfg_bresp         // Write response from selected AXI4-Lite device
  , input    [1:0] flsh_cfg_rresp         // Read  response from selected AXI4-Lite device
  , output         cfg_flsh_expand_enable // When 1, expand/collapse 4 bytes of data into four, 1 byte AXI operations
  , output         cfg_flsh_expand_dir    // When 0, expand bytes [3:0] in order 0,1,2,3 . When 1, expand in order 3,2,1,0 .
  
  
  
  , output  [7:0]   cfg0_bus_num
  , output  [4:0]   cfg0_device_num
  , output          fen_afu_ready
  , input   [6:0]   afu_fen_cmd_initial_credit
  , input           afu_fen_cmd_credit
                
  , output          fen_afu_cmd_valid                  
  , output  [7:0]   fen_afu_cmd_opcode                 
  , output  [1:0]   fen_afu_cmd_dl                     
  , output          fen_afu_cmd_end                    
  , output  [63:0]  fen_afu_cmd_pa                     
  , output  [3:0]   fen_afu_cmd_flag                   
  , output          fen_afu_cmd_os                     
  , output  [15:0]  fen_afu_cmd_capptag                
  , output  [2:0]   fen_afu_cmd_pl                     
  , output  [63:0]  fen_afu_cmd_be                     
                                      
  , input   [6:0]   afu_fen_resp_initial_credit        
  , input           afu_fen_resp_credit                
  , output          fen_afu_resp_valid                 
  , output  [7:0]   fen_afu_resp_opcode                
  , output  [15:0]  fen_afu_resp_afutag                
  , output  [3:0]   fen_afu_resp_code                  
  , output  [5:0]   fen_afu_resp_pg_size               
  , output  [1:0]   fen_afu_resp_dl                    
  , output  [1:0]   fen_afu_resp_dp                    
  , output  [23:0]  fen_afu_resp_host_tag              
  , output  [3:0]   fen_afu_resp_cache_state           
  , output  [17:0]  fen_afu_resp_addr_tag              
                                      
  , input           afu_fen_cmd_rd_req                 
  , input   [2:0]   afu_fen_cmd_rd_cnt                 
  , output          fen_afu_cmd_data_valid             
  , output          fen_afu_cmd_data_bdi               
  , output  [511:0] fen_afu_cmd_data_bus               
                                      
  , input           afu_fen_resp_rd_req                
  , input   [2:0]   afu_fen_resp_rd_cnt                
  , output          fen_afu_resp_data_valid            
  , output          fen_afu_resp_data_bdi              
  , output  [511:0] fen_afu_resp_data_bus              
                                                                                                                                              
  , output  [3:0]   fen_afu_cmd_initial_credit        
  , output  [3:0]   fen_afu_resp_initial_credit       
  , output  [5:0]   fen_afu_cmd_data_initial_credit   
  , output  [5:0]   fen_afu_resp_data_initial_credit  
                                                                       
  , output          fen_afu_cmd_credit                 
  , input           afu_fen_cmd_valid                  
  , input   [  7:0] afu_fen_cmd_opcode                 
  , input   [ 11:0] afu_fen_cmd_actag                  
  , input   [  3:0] afu_fen_cmd_stream_id              
  , input   [ 67:0] afu_fen_cmd_ea_or_obj              
  , input   [ 15:0] afu_fen_cmd_afutag                 
  , input   [  1:0] afu_fen_cmd_dl                     
  , input   [  2:0] afu_fen_cmd_pl                     
  , input           afu_fen_cmd_os                     
  , input   [ 63:0] afu_fen_cmd_be                     
  , input   [  3:0] afu_fen_cmd_flag                   
  , input           afu_fen_cmd_endian                 
  , input   [ 15:0] afu_fen_cmd_bdf                    
  , input   [ 19:0] afu_fen_cmd_pasid                  
  , input   [  5:0] afu_fen_cmd_pg_size                
                                      
  , output          fen_afu_cmd_data_credit            
  , input           afu_fen_cdata_valid                
  , input   [511:0] afu_fen_cdata_bus                  
  , input           afu_fen_cdata_bdi                  
                                      
  , output          fen_afu_resp_credit                
  , input           afu_fen_resp_valid                 
  , input   [  7:0] afu_fen_resp_opcode                
  , input   [  1:0] afu_fen_resp_dl                    
  , input   [ 15:0] afu_fen_resp_capptag               
  , input   [  1:0] afu_fen_resp_dp                    
  , input   [  3:0] afu_fen_resp_code                  
                                      
  , output          fen_afu_resp_data_credit           
  , input           afu_fen_rdata_valid                
  , input   [511:0] afu_fen_rdata_bus                  
  , input           afu_fen_rdata_bdi
  
  , output    [2:0] cfg_function
  , output    [1:0] cfg_portnum                  
  , output   [11:0] cfg_addr                     
  , output   [31:0] cfg_wdata                    
  , input    [31:0] cfg_f1_rdata               
  , input           cfg_f1_rdata_vld            
  , output          cfg_wr_1B                    
  , output          cfg_wr_2B                    
  , output          cfg_wr_4B                    
  , output          cfg_rd                       
  , input           cfg_f1_bad_op_or_align       
  , input           cfg_f1_addr_not_implemented  

    // ------------------------------------
    // Other signals
    // ------------------------------------

    // Fence control
  , input           cfg_f1_octrl00_fence_afu

    // TLX Configuration for the TLX port(s) connected to AFUs under this Function
  , output    [3:0] cfg_f0_otl0_long_backoff_timer
  , output    [3:0] cfg_f0_otl0_short_backoff_timer

    // Error signals into MMIO capture register
  //, output          vpd_err_unimplemented_addr
  , output          cfg0_cff_fifo_overflow
  //, output          cfg1_cff_fifo_overflow
  , output          cfg0_rff_fifo_overflow
  //, output          cfg1_rff_fifo_overflow
  , output  [127:0] cfg_errvec
  , output          cfg_errvec_valid

    // Resync credits control
 // , input           cfg_f1_octrl00_resync_credits
  
  //Tie values out to func1
  
  ,output [31:0] f1_csh_expansion_rom_bar       
  ,output [15:0] f1_csh_subsystem_id            
  ,output [15:0] f1_csh_subsystem_vendor_id     
  ,output [63:0] f1_csh_mmio_bar0_size          
  ,output [63:0] f1_csh_mmio_bar1_size          
  ,output [63:0] f1_csh_mmio_bar2_size          
  ,output        f1_csh_mmio_bar0_prefetchable  
  ,output        f1_csh_mmio_bar1_prefetchable  
  ,output        f1_csh_mmio_bar2_prefetchable  
  ,output  [4:0] f1_pasid_max_pasid_width       
  ,output  [7:0] f1_ofunc_reset_duration        
  ,output        f1_ofunc_afu_present           
  ,output  [4:0] f1_ofunc_max_afu_index         
  ,output  [7:0] f1_octrl00_reset_duration      
  ,output  [5:0] f1_octrl00_afu_control_index   
  ,output  [4:0] f1_octrl00_pasid_len_supported 
  ,output        f1_octrl00_metadata_supported  
  ,output [11:0] f1_octrl00_actag_len_supported 

  

);

// ==============================================================================================================================
// @@@  PARM: Parameters
// ==============================================================================================================================
// There are none on this design.


// ==============================================================================================================================
// @@@  SIG: Internal signals 
// ==============================================================================================================================
wire   reset;
assign reset = ~reset_n;  // Create positive active version of reset

// ****************************
// * CONFIGURATION SUB-SYSTEM *
// ****************************

// ==============================================================================================================================
// @@@ CFG_CMDFIFO: Buffer a number of config_* commands to remove them from the head of the TLX command queue
// ==============================================================================================================================

// --- Port 0 ---

assign cfg0_tlx_initial_credit = 4'b0000;   // Command FIFO manages initial credits via pulsed credit return signal

// Signals to connect CMD FIFO to CMD SEQ
  wire  [7:0] cfg0_cff_cmd_opcode
; wire [31:0] cfg0_cff_cmd_pa               // Per OpenCAPI TL spec, pa[63:32] are 'reserved' so don't use them to conserve FPGA resources
; wire [15:0] cfg0_cff_cmd_capptag
; wire        cfg0_cff_cmd_t
; wire  [2:0] cfg0_cff_cmd_pl
; wire        cfg0_cff_data_bdi
; wire [31:0] cfg0_cff_data_bus
; wire        cfg0_cff_cmd_valid            // Internal version of tlx_afu_cmd_valid
//; wire        cfg0_cff_fifo_overflow        // Added to internal error vector sent to MMIO logic 
; wire        cfg0_cmd_dispatched           // Pulsed to 1 when command is complete or sent into the pipeline
;

cfg_cmdfifo CFG0_CFF  (               
    .clock                ( clock                    )  // Clock - samples & launches data on rising edge
  , .reset                ( reset                    )  // Reset - when 1 set control logic to default state
  , .tlx_is_ready         ( tlx_afu_ready            )  // When 1, TLX is ready to exchange commands and responses 
     // Input into FIFO
  , .tlx_cfg_opcode       ( tlx_cfg0_opcode          )
  , .tlx_cfg_pa           ( tlx_cfg0_pa[31:0]        )  // Per OpenCAPI TL spec, pa[63:32] are 'reserved' so don't use them to conserve FPGA resources
  , .tlx_cfg_capptag      ( tlx_cfg0_capptag         )
  , .tlx_cfg_t            ( tlx_cfg0_t               )
  , .tlx_cfg_pl           ( tlx_cfg0_pl              )
  , .tlx_cfg_data_bdi     ( tlx_cfg0_data_bdi        )
  , .tlx_cfg_data_bus     ( tlx_cfg0_data_bus        )
  , .cmd_in_valid         ( tlx_cfg0_valid           )  // (in)  When 1, load 'cmd_in' into the FIFO
  , .cmd_credit_to_TLX    ( cfg0_tlx_credit_return   )  // (out) When 1, there is space in the FIFO for another command
     // Output from FIFO
  , .cmd_dispatched       ( cfg0_cmd_dispatched      )  // (in)  When 1, increment read FIFO pointer to present the next FIFO entry
  , .cfg_cff_cmd_opcode   ( cfg0_cff_cmd_opcode      )  // (out) Signals to CFG SEQ
  , .cfg_cff_cmd_pa       ( cfg0_cff_cmd_pa          )  // Per OpenCAPI TL spec, pa[63:32] are 'reserved' so don't use them to conserve FPGA resources
  , .cfg_cff_cmd_capptag  ( cfg0_cff_cmd_capptag     )
  , .cfg_cff_cmd_t        ( cfg0_cff_cmd_t           )
  , .cfg_cff_cmd_pl       ( cfg0_cff_cmd_pl          )
  , .cfg_cff_data_bdi     ( cfg0_cff_data_bdi        )
  , .cfg_cff_data_bus     ( cfg0_cff_data_bus        )
  , .cmd_out_valid        ( cfg0_cff_cmd_valid       )  // (out) When 1, 'cmd_out' contains valid information
     // Error
  , .fifo_overflow        ( cfg0_cff_fifo_overflow   )  // (out) When 1, FIFO was full when another 'cmd_valid' arrived
) ;


// ==============================================================================================================================
// @@@ CFG_SEQ: Choose a command and execute it
// ==============================================================================================================================

/*
// Signals distributing Bus / Device numbers
  wire  [7:0] cfg0_bus_num                
; wire  [4:0] cfg0_device_num
;
*/
// Signals from CFG SEQ to RESP FIFO port 0
  wire        cfg0_rff_resp_valid         // Pulse to 1 when response and/or resp data is available for loading into response FIFO
; wire  [7:0] cfg0_rff_resp_opcode
; wire  [3:0] cfg0_rff_resp_code
//wire  [1:0] cfg0_rff_resp_dl
//wire  [1:0] cfg0_rff_resp_dp
; wire [15:0] cfg0_rff_resp_capptag
; wire  [3:0] cfg0_rff_rdata_offset
; wire        cfg0_rff_rdata_bdi
; wire [31:0] cfg0_rff_rdata_bus
; wire [3:0]  cfg0_rff_buffers_available  // For information only, rffcr_buffers_available is used to determine space available 

// CFG_SEQ -> CFG_F* Functional Interface
/*; wire   [2:0] cfg_function
; wire   [1:0] cfg_portnum                  
; wire  [11:0] cfg_addr                     
; wire  [31:0] cfg_wdata  */                  
; wire  [31:0] cfg_f0_rdata                 // CFG_F0 outputs                              
; wire         cfg_f0_rdata_vld             
/*; wire  [31:0] cfg_f1_rdata                 // CFG_F1 outputs                              
; wire         cfg_f1_rdata_vld             
; wire         cfg_wr_1B                    
; wire         cfg_wr_2B                    
; wire         cfg_wr_4B                    
; wire         cfg_rd   */                    
; wire         cfg_f0_bad_op_or_align       // CFG_F0 outputs 
; wire         cfg_f0_addr_not_implemented
;  
/*; wire         cfg_f1_bad_op_or_align       // CFG_F1 outputs 
; wire         cfg_f1_addr_not_implemented  
; wire [127:0] cfg_errvec
; wire         cfg_errvec_valid
;*/


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


//CFG ties
wire [63:0] f0_ro_csh_mmio_bar0_size          ;
wire [63:0] f0_ro_csh_mmio_bar1_size          ;
wire [63:0] f0_ro_csh_mmio_bar2_size          ;
wire        f0_ro_csh_mmio_bar0_prefetchable  ;
wire        f0_ro_csh_mmio_bar1_prefetchable  ;
wire        f0_ro_csh_mmio_bar2_prefetchable  ;
wire [31:0] f0_ro_csh_expansion_rom_bar       ;
wire  [7:0] f0_ro_otl0_tl_major_vers_capbl    ;
wire  [7:0] f0_ro_otl0_tl_minor_vers_capbl    ;
wire [15:0] f0_ro_csh_subsystem_id            ;
wire [15:0] f0_ro_csh_subsystem_vendor_id     ;
wire [63:0] f0_ro_dsn_serial_number           ;
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


assign f1_csh_expansion_rom_bar       = f1_ro_csh_expansion_rom_bar      ;
assign f1_csh_subsystem_id            = f1_ro_csh_subsystem_id           ;
assign f1_csh_subsystem_vendor_id     = f1_ro_csh_subsystem_vendor_id    ;
assign f1_csh_mmio_bar0_size          = f1_ro_csh_mmio_bar0_size         ;
assign f1_csh_mmio_bar1_size          = f1_ro_csh_mmio_bar1_size         ;
assign f1_csh_mmio_bar2_size          = f1_ro_csh_mmio_bar2_size         ;
assign f1_csh_mmio_bar0_prefetchable  = f1_ro_csh_mmio_bar0_prefetchable ;
assign f1_csh_mmio_bar1_prefetchable  = f1_ro_csh_mmio_bar1_prefetchable ;
assign f1_csh_mmio_bar2_prefetchable  = f1_ro_csh_mmio_bar2_prefetchable ;
assign f1_pasid_max_pasid_width       = f1_ro_pasid_max_pasid_width      ;
assign f1_ofunc_reset_duration        = f1_ro_ofunc_reset_duration       ;
assign f1_ofunc_afu_present           = f1_ro_ofunc_afu_present          ;
assign f1_ofunc_max_afu_index         = f1_ro_ofunc_max_afu_index        ;
assign f1_octrl00_reset_duration      = f1_ro_octrl00_reset_duration     ;
assign f1_octrl00_afu_control_index   = f1_ro_octrl00_afu_control_index  ;
assign f1_octrl00_pasid_len_supported = f1_ro_octrl00_pasid_len_supported;
assign f1_octrl00_metadata_supported  = f1_ro_octrl00_metadata_supported ;
assign f1_octrl00_actag_len_supported = f1_ro_octrl00_actag_len_supported;





cfg_tieoffs cfg_tieoffs(

.f0_ro_csh_mmio_bar0_size                (f0_ro_csh_mmio_bar0_size         )
,.f0_ro_csh_mmio_bar1_size               (f0_ro_csh_mmio_bar1_size         )
,.f0_ro_csh_mmio_bar2_size               (f0_ro_csh_mmio_bar2_size         )
,.f0_ro_csh_mmio_bar0_prefetchable       (f0_ro_csh_mmio_bar0_prefetchable )
,.f0_ro_csh_mmio_bar1_prefetchable       (f0_ro_csh_mmio_bar1_prefetchable )
,.f0_ro_csh_mmio_bar2_prefetchable       (f0_ro_csh_mmio_bar2_prefetchable )
,.f0_ro_csh_expansion_rom_bar            (f0_ro_csh_expansion_rom_bar      )
,.f0_ro_otl0_tl_major_vers_capbl         (f0_ro_otl0_tl_major_vers_capbl   )
,.f0_ro_otl0_tl_minor_vers_capbl         (f0_ro_otl0_tl_minor_vers_capbl   )
,.f0_ro_csh_subsystem_id                 (f0_ro_csh_subsystem_id           )
,.f0_ro_csh_subsystem_vendor_id          (f0_ro_csh_subsystem_vendor_id    )
,.f0_ro_dsn_serial_number                (f0_ro_dsn_serial_number          )
,.f1_ro_csh_expansion_rom_bar            (f1_ro_csh_expansion_rom_bar      )
,.f1_ro_csh_subsystem_id                 (f1_ro_csh_subsystem_id           )
,.f1_ro_csh_subsystem_vendor_id          (f1_ro_csh_subsystem_vendor_id    )
,.f1_ro_csh_mmio_bar0_size               (f1_ro_csh_mmio_bar0_size         )
,.f1_ro_csh_mmio_bar1_size               (f1_ro_csh_mmio_bar1_size         )
,.f1_ro_csh_mmio_bar2_size               (f1_ro_csh_mmio_bar2_size         )
,.f1_ro_csh_mmio_bar0_prefetchable       (f1_ro_csh_mmio_bar0_prefetchable )
,.f1_ro_csh_mmio_bar1_prefetchable       (f1_ro_csh_mmio_bar1_prefetchable )
,.f1_ro_csh_mmio_bar2_prefetchable       (f1_ro_csh_mmio_bar2_prefetchable )
,.f1_ro_pasid_max_pasid_width            (f1_ro_pasid_max_pasid_width      )
,.f1_ro_ofunc_reset_duration             (f1_ro_ofunc_reset_duration       )
,.f1_ro_ofunc_afu_present                (f1_ro_ofunc_afu_present          )
,.f1_ro_ofunc_max_afu_index              (f1_ro_ofunc_max_afu_index        )
,.f1_ro_octrl00_reset_duration           (f1_ro_octrl00_reset_duration     )
,.f1_ro_octrl00_afu_control_index        (f1_ro_octrl00_afu_control_index  )
,.f1_ro_octrl00_pasid_len_supported      (f1_ro_octrl00_pasid_len_supported)
,.f1_ro_octrl00_metadata_supported       (f1_ro_octrl00_metadata_supported )
,.f1_ro_octrl00_actag_len_supported      (f1_ro_octrl00_actag_len_supported)

);



cfg_seq CFG_SEQ (
    .clock                      ( clock                      )   // Clock - samples & launches data on rising edge
  , .reset                      ( reset                      )   // Reset - when 1 set control logic to default state
  , .device_num                 ( ro_device                  )   // Propagate Device number into BDF registers
  , .functions_attached         ( 8'b0000_0011               )   // Set bit=1 for each Function attached, corresponding to its number (i.e. Func 0,1 = 8'h03)
    // Port 0: From CMD FIFO
  , .cfg0_portnum               ( 2'b00                      )   // (in)  Hardcoded port number associated with this TLX instance (use vector for future expansion)
  , .cfg0_cff_cmd_opcode        ( cfg0_cff_cmd_opcode        )   // (in)  Signals from CMD FIFO on this port
  , .cfg0_cff_cmd_pa            ( cfg0_cff_cmd_pa            )
  , .cfg0_cff_cmd_capptag       ( cfg0_cff_cmd_capptag       )
  , .cfg0_cff_cmd_t             ( cfg0_cff_cmd_t             )
  , .cfg0_cff_cmd_pl            ( cfg0_cff_cmd_pl            )
  , .cfg0_cff_data_bdi          ( cfg0_cff_data_bdi          )
  , .cfg0_cff_data_bus          ( cfg0_cff_data_bus          )
  , .cfg0_cff_cmd_valid         ( cfg0_cff_cmd_valid         )   // (in)  Set to 1 when a command is pending at the FIFO output
  , .cfg0_cmd_dispatched        ( cfg0_cmd_dispatched        )   // (out) Pulse to 1 to increment read FIFO pointer to present the next FIFO entry
  , .cfg0_bus_num               ( cfg0_bus_num               )   // (out) Propagate to anyone who may need to use it
  , .cfg0_device_num            ( cfg0_device_num            )   // (out) Propagate to anyone who may need to use it 
   // Port 1: Not implemented to conserve FPGA resources
   // Port 2: Not implemented to conserve FPGA resources
   // Port 3: Not implemented to conserve FPGA resources
   // Port 0: To RESP FIFO  
  , .cfg0_rff_resp_valid        ( cfg0_rff_resp_valid        ) // (out) Pulse to 1 when response and/or resp data is available for loading into response FIFO
  , .cfg0_rff_resp_opcode       ( cfg0_rff_resp_opcode       ) // (out) Info to load into response FIFO
  , .cfg0_rff_resp_code         ( cfg0_rff_resp_code         )
//, .cfg0_rff_resp_dl           ( cfg0_rff_resp_dl           )
//, .cfg0_rff_resp_dp           ( cfg0_rff_resp_dp           )
  , .cfg0_rff_resp_capptag      ( cfg0_rff_resp_capptag      )
  , .cfg0_rff_rdata_offset      ( cfg0_rff_rdata_offset      )
  , .cfg0_rff_rdata_bdi         ( cfg0_rff_rdata_bdi         )
  , .cfg0_rff_rdata_bus         ( cfg0_rff_rdata_bus         )
  , .cfg0_rff_buffers_available ( cfg0_rff_buffers_available ) // (in)  Used to determine when can send something to the response FIFO  
   // Port 1: Not implemented to conserve FPGA resources
   // Port 2: Not implemented to conserve FPGA resources
   // Port 3: Not implemented to conserve FPGA resources
   // Error conditions
   // CFG_SEQ -> CFG_F* Functional Interface
  , .cfg_function               ( cfg_function               )
  , .cfg_portnum                ( cfg_portnum                )
  , .cfg_addr                   ( cfg_addr                   )
  , .cfg_wdata                  ( cfg_wdata                  )
  , .cfg_rdata                  ( cfg_rdata                  )
  , .cfg_rdata_vld              ( cfg_rdata_vld              )
  , .cfg_wr_1B                  ( cfg_wr_1B                  )
  , .cfg_wr_2B                  ( cfg_wr_2B                  )
  , .cfg_wr_4B                  ( cfg_wr_4B                  )
  , .cfg_rd                     ( cfg_rd                     )
  , .cfg_bad_op_or_align        ( cfg_bad_op_or_align        )
  , .cfg_addr_not_implemented   ( cfg_addr_not_implemented   )
    // Supplemental Error Information - The AFU may optionally provide a means for CFG errors & error information to be reported to the host
  , .cfg_errvec                 ( cfg_errvec                 )
  , .cfg_errvec_valid           ( cfg_errvec_valid           )

) ;


// ==============================================================================================================================
// @@@ CFG_RESPFIFO: Buffer a number of config_* responses allowing config_* ops to occur as fast as possible
// ==============================================================================================================================

// --- Port 0 ---

//wire cfg0_rff_fifo_overflow;       // Added to internal error vector sent to MMIO logic 
cfg_respfifo CFG0_RFF  (                       
    .clock                  ( clock                      )   // Clock - samples & launches data on rising edge
  , .reset                  ( reset                      )   // Reset - when 1 set control logic to default state
     // Input into FIFO
  , .cfg_rff_resp_opcode    ( cfg0_rff_resp_opcode       )
  , .cfg_rff_resp_code      ( cfg0_rff_resp_code         )
//, .cfg_rff_resp_dl        ( cfg0_rff_resp_dl           )
//, .cfg_rff_resp_dp        ( cfg0_rff_resp_dp           )
  , .cfg_rff_resp_capptag   ( cfg0_rff_resp_capptag      )
  , .cfg_rff_rdata_offset   ( cfg0_rff_rdata_offset      )
  , .cfg_rff_rdata_bdi      ( cfg0_rff_rdata_bdi         )
  , .cfg_rff_rdata_bus      ( cfg0_rff_rdata_bus         )
  , .cfg_rff_resp_in_valid  ( cfg0_rff_resp_valid        )   // When 1, load 'resp_in' into the FIFO
  , .resp_buffers_available ( cfg0_rff_buffers_available )   // When >0, there is space in the FIFO for another command
     // Output from FIFO
  , .cfg_tlx_resp_opcode    ( cfg0_tlx_resp_opcode       )
//, .cfg_tlx_resp_dl        ( cfg0_tlx_resp_dl           )
  , .cfg_tlx_resp_capptag   ( cfg0_tlx_resp_capptag      )
//, .cfg_tlx_resp_dp        ( cfg0_tlx_resp_dp           )
  , .cfg_tlx_resp_code      ( cfg0_tlx_resp_code         )
  , .cfg_tlx_rdata_offset   ( cfg0_tlx_rdata_offset      )
  , .cfg_tlx_rdata_bus      ( cfg0_tlx_rdata_bus         )
  , .cfg_tlx_rdata_bdi      ( cfg0_tlx_rdata_bdi         )
     // Valid-Ack handshake with TLX 
  , .cfg_tlx_resp_valid     ( cfg0_tlx_resp_valid        )   // Tell TLX when a response is ready for it to send
  , .tlx_cfg_resp_ack       ( tlx_cfg0_resp_ack          )   // TLX indicates current valid response has been sent
     // Error
  , .fifo_overflow          ( cfg0_rff_fifo_overflow     )   // When 1, FIFO was full when another 'resp_valid' arrived
) ;


// ==============================================================================================================================
// @@@ CFG_0: Function 0 Capability Structures (contains no AFUs)
// ==============================================================================================================================

// Declare F0 outputs
  wire         cfg_f0_csh_memory_space
; wire  [63:0] cfg_f0_csh_mmio_bar0
; wire  [63:0] cfg_f0_csh_mmio_bar1
; wire  [63:0] cfg_f0_csh_mmio_bar2
; wire  [31:0] cfg_f0_csh_expansion_ROM_bar 
; wire         cfg_f0_csh_expansion_ROM_enable
; wire   [7:0] cfg_f0_otl0_tl_major_vers_config 
; wire   [7:0] cfg_f0_otl0_tl_minor_vers_config
; wire   [3:0] cfg_f0_otl0_long_backoff_timer
; wire   [3:0] cfg_f0_otl0_short_backoff_timer
; wire  [63:0] cfg_f0_otl0_xmt_tmpl_config
; wire [255:0] cfg_f0_otl0_xmt_rate_tmpl_config  
; wire         cfg_f0_ofunc_function_reset      
; wire  [11:0] cfg_f0_ofunc_func_actag_base
; wire  [11:0] cfg_f0_ofunc_func_actag_len_enab
;

wire   cfg_f0_reset;
assign cfg_f0_reset = reset | cfg_f0_ofunc_function_reset;   // Apply on hardware reset OR software cmd (Function Reset)

cfg_func0 CFG_F0  (               
    .clock                               ( clock                                )  
  , .reset                               ( cfg_f0_reset                         )  
  , .device_reset                        ( reset                                )  
    // READ ONLY field inputs 
    // Configuration Space Header
  , .cfg_ro_csh_device_id                ( 16'h062B                             )
  , .cfg_ro_csh_vendor_id                ( 16'h1014                             )
  , .cfg_ro_csh_class_code               ( 24'h120000                           )
  , .cfg_ro_csh_revision_id              (  8'h00                               )
  , .cfg_ro_csh_multi_function           (  1'b1                                ) // Should be 1 if using IBM's CFG implementation
  , .cfg_ro_csh_mmio_bar0_size           ( f0_ro_csh_mmio_bar0_size             ) // [63:n+1]=1, [n:0]=0 to indicate MMIO region size (default 0 MB)
  , .cfg_ro_csh_mmio_bar1_size           ( f0_ro_csh_mmio_bar1_size             ) // [63:n+1]=1, [n:0]=0 to indicate MMIO region size (default 0 MB)
  , .cfg_ro_csh_mmio_bar2_size           ( f0_ro_csh_mmio_bar2_size             ) // [63:n+1]=1, [n:0]=0 to indicate MMIO region size (default 0 MB)
  , .cfg_ro_csh_mmio_bar0_prefetchable   ( f0_ro_csh_mmio_bar0_prefetchable     ) 
  , .cfg_ro_csh_mmio_bar1_prefetchable   ( f0_ro_csh_mmio_bar1_prefetchable     )
  , .cfg_ro_csh_mmio_bar2_prefetchable   ( f0_ro_csh_mmio_bar2_prefetchable     )
  , .cfg_ro_csh_subsystem_id             ( f0_ro_csh_subsystem_id               )
  , .cfg_ro_csh_subsystem_vendor_id      ( f0_ro_csh_subsystem_vendor_id        )
  , .cfg_ro_csh_expansion_rom_bar        ( f0_ro_csh_expansion_rom_bar          ) // Only [31:11] are used
    // Device Serial Number
  , .cfg_ro_dsn_serial_number            ( f0_ro_dsn_serial_number              ) // TODO: Need real value
    // OpenCAPI TL - port 0
  , .cfg_ro_otl0_tl_major_vers_capbl     (f0_ro_otl0_tl_major_vers_capbl        )
  , .cfg_ro_otl0_tl_minor_vers_capbl     (f0_ro_otl0_tl_minor_vers_capbl        )
  , .cfg_ro_otl0_rcv_tmpl_capbl          ( { 60'h0000_0000_0000_000,          
                                             tlx_cfg0_in_rcv_tmpl_capability_3,
                                             tlx_cfg0_in_rcv_tmpl_capability_2,
                                             tlx_cfg0_in_rcv_tmpl_capability_1,
                                             tlx_cfg0_in_rcv_tmpl_capability_0   
                                                                              } ) // Get capabilities from TLX itself
  , .cfg_ro_otl0_rcv_rate_tmpl_capbl     ( { {60{4'b0000}},
                                             tlx_cfg0_in_rcv_rate_capability_3,
                                             tlx_cfg0_in_rcv_rate_capability_2,
                                             tlx_cfg0_in_rcv_rate_capability_1,
                                             tlx_cfg0_in_rcv_rate_capability_0
                                                                              } ) // Get capabilities from TLX itself
    // Function
  , .cfg_ro_ofunc_reset_duration         (  8'h10                               ) // Number of cycles Function reset is active (00=255 cycles)
  , .cfg_ro_ofunc_afu_present            (  1'b0                                ) // Function 0 has no AFUs
  , .cfg_ro_ofunc_max_afu_index          (  6'b00_0000                          ) // Default is AFU number 0
    // Vendor DVSEC
  , .cfg_ro_ovsec_tlx0_version           ( ro_tlx0_version                      ) 
  , .cfg_ro_ovsec_tlx1_version           ( 32'h00000000                         ) // TLX port is not used
  , .cfg_ro_ovsec_tlx2_version           ( 32'h00000000                         ) // TLX port is not used   
  , .cfg_ro_ovsec_tlx3_version           ( 32'h00000000                         ) // TLX port is not used
  , .cfg_ro_ovsec_dlx0_version           ( ro_dlx0_version                      )
  , .cfg_ro_ovsec_dlx1_version           ( 32'h00000000                         ) // DLX port is not used
  , .cfg_ro_ovsec_dlx2_version           ( 32'h00000000                         ) // DLX port is not used
  , .cfg_ro_ovsec_dlx3_version           ( 32'h00000000                         ) // DLX port is not used
    // Assigned configuration values 
  , .cfg_ro_function                     ( 3'b000                               ) // This is Function 0
    // Functional interface
  , .cfg_function                        ( cfg_function                         )                       
  , .cfg_portnum                         ( cfg_portnum                          ) 
  , .cfg_addr                            ( cfg_addr                             ) 
  , .cfg_wdata                           ( cfg_wdata                            ) 
  , .cfg_rdata                           ( cfg_f0_rdata                         ) 
  , .cfg_rdata_vld                       ( cfg_f0_rdata_vld                     ) 
  , .cfg_wr_1B                           ( cfg_wr_1B                            ) 
  , .cfg_wr_2B                           ( cfg_wr_2B                            ) 
  , .cfg_wr_4B                           ( cfg_wr_4B                            ) 
  , .cfg_rd                              ( cfg_rd                               ) 
  , .cfg_bad_op_or_align                 ( cfg_f0_bad_op_or_align               )
  , .cfg_addr_not_implemented            ( cfg_f0_addr_not_implemented          )
    // Individual fields from configuration registers
    // CSH
  , .cfg_csh_memory_space                ( cfg_f0_csh_memory_space              )
  , .cfg_csh_mmio_bar0                   ( cfg_f0_csh_mmio_bar0                 )
  , .cfg_csh_mmio_bar1                   ( cfg_f0_csh_mmio_bar1                 )
  , .cfg_csh_mmio_bar2                   ( cfg_f0_csh_mmio_bar2                 )
  , .cfg_csh_expansion_ROM_bar           ( cfg_f0_csh_expansion_ROM_bar         )
  , .cfg_csh_expansion_ROM_enable        ( cfg_f0_csh_expansion_ROM_enable      )
    // OTL Port 0
  , .cfg_otl0_tl_major_vers_config       ( cfg_f0_otl0_tl_major_vers_config     )
  , .cfg_otl0_tl_minor_vers_config       ( cfg_f0_otl0_tl_minor_vers_config     )
  , .cfg_otl0_long_backoff_timer         ( cfg_f0_otl0_long_backoff_timer       )
  , .cfg_otl0_short_backoff_timer        ( cfg_f0_otl0_short_backoff_timer      )
  , .cfg_otl0_xmt_tmpl_config            ( cfg_f0_otl0_xmt_tmpl_config          )
  , .cfg_otl0_xmt_rate_tmpl_config       ( cfg_f0_otl0_xmt_rate_tmpl_config     )
    // OFUNC
  , .cfg_ofunc_function_reset            ( cfg_f0_ofunc_function_reset          )
  , .cfg_ofunc_func_actag_base           ( cfg_f0_ofunc_func_actag_base         )
  , .cfg_ofunc_func_actag_len_enab       ( cfg_f0_ofunc_func_actag_len_enab     )
   // Interface to VPD 
  , .cfg_vpd_addr                        ( cfg_vpd_addr                         )
  , .cfg_vpd_wren                        ( cfg_vpd_wren                         )
  , .cfg_vpd_wdata                       ( cfg_vpd_wdata                        )
  , .cfg_vpd_rden                        ( cfg_vpd_rden                         )
  , .vpd_cfg_rdata                       ( vpd_cfg_rdata                        )
  , .vpd_cfg_done                        ( vpd_cfg_done                         )
   // Interface to FLASH control logic
  , .cfg_flsh_devsel                     ( cfg_flsh_devsel                      )
  , .cfg_flsh_addr                       ( cfg_flsh_addr                        )
  , .cfg_flsh_wren                       ( cfg_flsh_wren                        )
  , .cfg_flsh_wdata                      ( cfg_flsh_wdata                       )
  , .cfg_flsh_rden                       ( cfg_flsh_rden                        )
  , .flsh_cfg_rdata                      ( flsh_cfg_rdata                       )
  , .flsh_cfg_done                       ( flsh_cfg_done                        )
  , .flsh_cfg_status                     ( flsh_cfg_status                      )
  , .flsh_cfg_bresp                      ( flsh_cfg_bresp                       )
  , .flsh_cfg_rresp                      ( flsh_cfg_rresp                       )
  , .cfg_flsh_expand_enable              ( cfg_flsh_expand_enable               )
  , .cfg_flsh_expand_dir                 ( cfg_flsh_expand_dir                  )

);

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



wire [2612:0] fen_trace_vector;   // Bring signals to to preserve registers during Vivado synthesis
reg  [2612:0] fen_trace_vector_q; // TODO: Replace with trace buffer
always @(posedge(clock))
  fen_trace_vector_q <= fen_trace_vector;


// ==============================================================================================================================
// @@@ FENCE: Fence logic between TLX and AFU
// ==============================================================================================================================


cfg_fence FENCE (
    // Miscellaneous Ports
    .clock                                  ( clock                              )                           
  , .reset                                  ( reset                              )
  , .fence                                  ( cfg_f1_octrl00_fence_afu           )
    // *************************************
    // Interface between TLX and Fence logic
    // *************************************
    //   TLX Parser -> Fence Receive Interface
  , .tlx_afu_ready                          ( tlx_afu_ready                      )
    // Command interface to AFU
  , .afu_tlx_cmd_initial_credit             ( afu_tlx_cmd_initial_credit         )    
  , .afu_tlx_cmd_credit                     ( afu_tlx_cmd_credit                 )
  , .tlx_afu_cmd_valid                      ( tlx_afu_cmd_valid                  )
  , .tlx_afu_cmd_opcode                     ( tlx_afu_cmd_opcode                 )
  , .tlx_afu_cmd_dl                         ( tlx_afu_cmd_dl                     )
  , .tlx_afu_cmd_end                        ( tlx_afu_cmd_end                    )
  , .tlx_afu_cmd_pa                         ( tlx_afu_cmd_pa                     )
  , .tlx_afu_cmd_flag                       ( tlx_afu_cmd_flag                   )
  , .tlx_afu_cmd_os                         ( tlx_afu_cmd_os                     )
  , .tlx_afu_cmd_capptag                    ( tlx_afu_cmd_capptag                )    
  , .tlx_afu_cmd_pl                         ( tlx_afu_cmd_pl                     )
  , .tlx_afu_cmd_be                         ( tlx_afu_cmd_be                     )
    // Response interface to AFU
  , .afu_tlx_resp_initial_credit            ( afu_tlx_resp_initial_credit        )    
  , .afu_tlx_resp_credit                    ( afu_tlx_resp_credit                )  
  , .tlx_afu_resp_valid                     ( tlx_afu_resp_valid                 ) 
  , .tlx_afu_resp_opcode                    ( tlx_afu_resp_opcode                )    
  , .tlx_afu_resp_afutag                    ( tlx_afu_resp_afutag                )    
  , .tlx_afu_resp_code                      ( tlx_afu_resp_code                  )    
  , .tlx_afu_resp_pg_size                   ( tlx_afu_resp_pg_size               )     
  , .tlx_afu_resp_dl                        ( tlx_afu_resp_dl                    )
  , .tlx_afu_resp_dp                        ( tlx_afu_resp_dp                    )
  , .tlx_afu_resp_host_tag                  ( tlx_afu_resp_host_tag              )     
  , .tlx_afu_resp_cache_state               ( tlx_afu_resp_cache_state           )     
  , .tlx_afu_resp_addr_tag                  ( tlx_afu_resp_addr_tag              )
    // Command data interface to AFU
  , .afu_tlx_cmd_rd_req                     ( afu_tlx_cmd_rd_req                 )   
  , .afu_tlx_cmd_rd_cnt                     ( afu_tlx_cmd_rd_cnt                 )   
  , .tlx_afu_cmd_data_valid                 ( tlx_afu_cmd_data_valid             )
  , .tlx_afu_cmd_data_bdi                   ( tlx_afu_cmd_data_bdi               )
  , .tlx_afu_cmd_data_bus                   ( tlx_afu_cmd_data_bus               )    
    // Response data interface to AFU
  , .afu_tlx_resp_rd_req                    ( afu_tlx_resp_rd_req                )
  , .afu_tlx_resp_rd_cnt                    ( afu_tlx_resp_rd_cnt                )     
  , .tlx_afu_resp_data_valid                ( tlx_afu_resp_data_valid            )     
  , .tlx_afu_resp_data_bdi                  ( tlx_afu_resp_data_bdi              )
  , .tlx_afu_resp_data_bus                  ( tlx_afu_resp_data_bus              )      
    //   Fence -> TLX Framer Transmit Interface
    // Initial credit allocation
  , .tlx_afu_cmd_initial_credit             ( tlx_afu_cmd_initial_credit        )
  , .tlx_afu_resp_initial_credit            ( tlx_afu_resp_initial_credit       )
  , .tlx_afu_cmd_data_initial_credit        ( tlx_afu_cmd_data_initial_credit   )
  , .tlx_afu_resp_data_initial_credit       ( tlx_afu_resp_data_initial_credit  )

    // Commands from AFU
  , .tlx_afu_cmd_credit                     ( tlx_afu_cmd_credit                 ) 
  , .afu_tlx_cmd_valid                      ( afu_tlx_cmd_valid                  ) 
  , .afu_tlx_cmd_opcode                     ( afu_tlx_cmd_opcode                 ) 
  , .afu_tlx_cmd_actag                      ( afu_tlx_cmd_actag                  )
  , .afu_tlx_cmd_stream_id                  ( afu_tlx_cmd_stream_id              ) 
  , .afu_tlx_cmd_ea_or_obj                  ( afu_tlx_cmd_ea_or_obj              ) 
  , .afu_tlx_cmd_afutag                     ( afu_tlx_cmd_afutag                 ) 
  , .afu_tlx_cmd_dl                         ( afu_tlx_cmd_dl                     ) 
  , .afu_tlx_cmd_pl                         ( afu_tlx_cmd_pl                     ) 
  , .afu_tlx_cmd_os                         ( afu_tlx_cmd_os                     ) 
  , .afu_tlx_cmd_be                         ( afu_tlx_cmd_be                     ) 
  , .afu_tlx_cmd_flag                       ( afu_tlx_cmd_flag                   ) 
  , .afu_tlx_cmd_endian                     ( afu_tlx_cmd_endian                 ) 
  , .afu_tlx_cmd_bdf                        ( afu_tlx_cmd_bdf                    )              
  , .afu_tlx_cmd_pasid                      ( afu_tlx_cmd_pasid                  ) 
  , .afu_tlx_cmd_pg_size                    ( afu_tlx_cmd_pg_size                ) 
    // Command data from AFU
  , .tlx_afu_cmd_data_credit                ( tlx_afu_cmd_data_credit            )          
  , .afu_tlx_cdata_valid                    ( afu_tlx_cdata_valid                )         
  , .afu_tlx_cdata_bus                      ( afu_tlx_cdata_bus                  )        
  , .afu_tlx_cdata_bdi                      ( afu_tlx_cdata_bdi                  )   
    // Responses from AFU
  , .tlx_afu_resp_credit                    ( tlx_afu_resp_credit                )         
  , .afu_tlx_resp_valid                     ( afu_tlx_resp_valid                 )        
  , .afu_tlx_resp_opcode                    ( afu_tlx_resp_opcode                )          
  , .afu_tlx_resp_dl                        ( afu_tlx_resp_dl                    )
  , .afu_tlx_resp_capptag                   ( afu_tlx_resp_capptag               )       
  , .afu_tlx_resp_dp                        ( afu_tlx_resp_dp                    )       
  , .afu_tlx_resp_code                      ( afu_tlx_resp_code                  )         
    // Response data from AFU
  , .tlx_afu_resp_data_credit               ( tlx_afu_resp_data_credit           )        
  , .afu_tlx_rdata_valid                    ( afu_tlx_rdata_valid                )          
  , .afu_tlx_rdata_bus                      ( afu_tlx_rdata_bus                  )         
  , .afu_tlx_rdata_bdi                      ( afu_tlx_rdata_bdi                  )               
    // *******************************
    // Interface between Fence and AFU 
    // *******************************
    //   Fenc -> AFU Receive Interface
  , .fen_afu_ready                          ( fen_afu_ready                      )
    // Command interface to AFU
  , .afu_fen_cmd_initial_credit             ( afu_fen_cmd_initial_credit         )    
  , .afu_fen_cmd_credit                     ( afu_fen_cmd_credit                 )
  , .fen_afu_cmd_valid                      ( fen_afu_cmd_valid                  )
  , .fen_afu_cmd_opcode                     ( fen_afu_cmd_opcode                 )
  , .fen_afu_cmd_dl                         ( fen_afu_cmd_dl                     ) 
  , .fen_afu_cmd_end                        ( fen_afu_cmd_end                    )
  , .fen_afu_cmd_pa                         ( fen_afu_cmd_pa                     )
  , .fen_afu_cmd_flag                       ( fen_afu_cmd_flag                   ) 
  , .fen_afu_cmd_os                         ( fen_afu_cmd_os                     )
  , .fen_afu_cmd_capptag                    ( fen_afu_cmd_capptag                )     
  , .fen_afu_cmd_pl                         ( fen_afu_cmd_pl                     )
  , .fen_afu_cmd_be                         ( fen_afu_cmd_be                     ) 
    // Response interface to AFU
  , .afu_fen_resp_initial_credit            ( afu_fen_resp_initial_credit        )    
  , .afu_fen_resp_credit                    ( afu_fen_resp_credit                )   
  , .fen_afu_resp_valid                     ( fen_afu_resp_valid                 )
  , .fen_afu_resp_opcode                    ( fen_afu_resp_opcode                )   
  , .fen_afu_resp_afutag                    ( fen_afu_resp_afutag                )  
  , .fen_afu_resp_code                      ( fen_afu_resp_code                  )  
  , .fen_afu_resp_pg_size                   ( fen_afu_resp_pg_size               )     
  , .fen_afu_resp_dl                        ( fen_afu_resp_dl                    )
  , .fen_afu_resp_dp                        ( fen_afu_resp_dp                    )
  , .fen_afu_resp_host_tag                  ( fen_afu_resp_host_tag              )    
  , .fen_afu_resp_cache_state               ( fen_afu_resp_cache_state           )   
  , .fen_afu_resp_addr_tag                  ( fen_afu_resp_addr_tag              )
    // Command data interface to AFU
  , .afu_fen_cmd_rd_req                     ( afu_fen_cmd_rd_req                 ) 
  , .afu_fen_cmd_rd_cnt                     ( afu_fen_cmd_rd_cnt                 )
  , .fen_afu_cmd_data_valid                 ( fen_afu_cmd_data_valid             )
  , .fen_afu_cmd_data_bdi                   ( fen_afu_cmd_data_bdi               )
  , .fen_afu_cmd_data_bus                   ( fen_afu_cmd_data_bus               )   
    // Response data interface to AFU
  , .afu_fen_resp_rd_req                    ( afu_fen_resp_rd_req                )  
  , .afu_fen_resp_rd_cnt                    ( afu_fen_resp_rd_cnt                )  
  , .fen_afu_resp_data_valid                ( fen_afu_resp_data_valid            )    
  , .fen_afu_resp_data_bdi                  ( fen_afu_resp_data_bdi              )
  , .fen_afu_resp_data_bus                  ( fen_afu_resp_data_bus              )     
    //   AFU -> Fence Transmit Interface
    // Initial credit allocation
  , .fen_afu_cmd_initial_credit             ( fen_afu_cmd_initial_credit         )
  , .fen_afu_resp_initial_credit            ( fen_afu_resp_initial_credit        )
  , .fen_afu_cmd_data_initial_credit        ( fen_afu_cmd_data_initial_credit    )
  , .fen_afu_resp_data_initial_credit       ( fen_afu_resp_data_initial_credit   )
    // Commands from AFU
  , .fen_afu_cmd_credit                     ( fen_afu_cmd_credit                 )      
  , .afu_fen_cmd_valid                      ( afu_fen_cmd_valid                  )     
  , .afu_fen_cmd_opcode                     ( afu_fen_cmd_opcode                 )       
  , .afu_fen_cmd_actag                      ( afu_fen_cmd_actag                  )       
  , .afu_fen_cmd_stream_id                  ( afu_fen_cmd_stream_id              )      
  , .afu_fen_cmd_ea_or_obj                  ( afu_fen_cmd_ea_or_obj              )        
  , .afu_fen_cmd_afutag                     ( afu_fen_cmd_afutag                 )      
  , .afu_fen_cmd_dl                         ( afu_fen_cmd_dl                     )      
  , .afu_fen_cmd_pl                         ( afu_fen_cmd_pl                     )     
  , .afu_fen_cmd_os                         ( afu_fen_cmd_os                     )     
  , .afu_fen_cmd_be                         ( afu_fen_cmd_be                     )     
  , .afu_fen_cmd_flag                       ( afu_fen_cmd_flag                   )       
  , .afu_fen_cmd_endian                     ( afu_fen_cmd_endian                 )        
  , .afu_fen_cmd_bdf                        ( afu_fen_cmd_bdf                    )                
  , .afu_fen_cmd_pasid                      ( afu_fen_cmd_pasid                  )       
  , .afu_fen_cmd_pg_size                    ( afu_fen_cmd_pg_size                )         
    // Command data from AFU
  , .fen_afu_cmd_data_credit                ( fen_afu_cmd_data_credit            )           
  , .afu_fen_cdata_valid                    ( afu_fen_cdata_valid                )              
  , .afu_fen_cdata_bus                      ( afu_fen_cdata_bus                  )              
  , .afu_fen_cdata_bdi                      ( afu_fen_cdata_bdi                  )      
    // Responses from AFU
  , .fen_afu_resp_credit                    ( fen_afu_resp_credit                )              
  , .afu_fen_resp_valid                     ( afu_fen_resp_valid                 )              
  , .afu_fen_resp_opcode                    ( afu_fen_resp_opcode                )              
  , .afu_fen_resp_dl                        ( afu_fen_resp_dl                    )
  , .afu_fen_resp_capptag                   ( afu_fen_resp_capptag               )         
  , .afu_fen_resp_dp                        ( afu_fen_resp_dp                    )              
  , .afu_fen_resp_code                      ( afu_fen_resp_code                  )              
    // Response data from AFU
  , .fen_afu_resp_data_credit               ( fen_afu_resp_data_credit           )         
  , .afu_fen_rdata_valid                    ( afu_fen_rdata_valid                )             
  , .afu_fen_rdata_bus                      ( afu_fen_rdata_bus                  )             
  , .afu_fen_rdata_bdi                      ( afu_fen_rdata_bdi                  )               

    // Interface taps for Trace Array 
  , .fen_trace_vector                       ( fen_trace_vector                    )

);



endmodule //-- oc_cfg