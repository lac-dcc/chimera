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
module oc_function (

    // -----------------------------------
    // Miscellaneous Ports
    // -----------------------------------
    input          clock_tlx
  , input          clock_afu                         
  , input          reset                        

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

   //QSFP GTY FPGA pins and reference clock coming from top and constraints file
  ,input              serdes_init_clock
  ,input              qsfp0_ref_clk_n
  ,input              qsfp0_ref_clk_p
  ,input  [0:3]       qsfp0_rx_n
  ,input  [0:3]       qsfp0_rx_p
  ,output [0:3]       qsfp0_tx_n
  ,output [0:3]       qsfp0_tx_p
  ,input              qsfp1_ref_clk_n
  ,input              qsfp1_ref_clk_p
  ,input  [0:3]       qsfp1_rx_n
  ,input  [0:3]       qsfp1_rx_p
  ,output [0:3]       qsfp1_tx_n
  ,output [0:3]       qsfp1_tx_p

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

cfg_func1 cfg_f1  (               
    .clock                               ( clock_tlx                                )  
  , .reset                               ( cfg_f1_reset                         )  
  , .device_reset                        ( reset                                )  
    // READ ONLY field inputs 
    // Configuration Space Header
  , .cfg_ro_csh_device_id                ( 16'h062B                             )
  , .cfg_ro_csh_vendor_id                ( 16'h1014                             )
  , .cfg_ro_csh_class_code               ( 24'h120000                           )
  , .cfg_ro_csh_revision_id              (  8'h00                               )
  , .cfg_ro_csh_multi_function           (  1'b1                                ) // Should be 1 if using IBM's CFG implementation
  , .cfg_ro_csh_mmio_bar0_size           ( 64'hFFFF_FFFF_FFF0_0000              ) // [63:n+1]=1, [n:0]=0 to indicate MMIO region size (default 1 MB)
  , .cfg_ro_csh_mmio_bar1_size           ( 64'hFFFF_FFFF_FFFF_FFFF              ) // [63:n+1]=1, [n:0]=0 to indicate MMIO region size (default 0 MB)
  , .cfg_ro_csh_mmio_bar2_size           ( 64'hFFFF_FFFF_FFFF_FFFF              ) // [63:n+1]=1, [n:0]=0 to indicate MMIO region size (default 0 MB)
  , .cfg_ro_csh_mmio_bar0_prefetchable   (  1'b0                                ) 
  , .cfg_ro_csh_mmio_bar1_prefetchable   (  1'b0                                )
  , .cfg_ro_csh_mmio_bar2_prefetchable   (  1'b0                                )
  , .cfg_ro_csh_subsystem_id             ( 16'h060F                             )
  , .cfg_ro_csh_subsystem_vendor_id      ( 16'h1014                             )
  , .cfg_ro_csh_expansion_rom_bar        ( 32'hFFFF_F800                        ) // Only [31:11] are used
    // PASID
  , .cfg_ro_pasid_max_pasid_width        (  5'b00001                            ) // Default is 2 PASIDs
    // Function
  , .cfg_ro_ofunc_reset_duration         (  8'h10                               ) // Number of cycles Function reset is active (00=255 cycles)
  , .cfg_ro_ofunc_afu_present            (  1'b1                                ) // Func0=0, FuncN=1 (likely)
  , .cfg_ro_ofunc_max_afu_index          (  6'b00_0000                          ) // Default is AFU number 0
    // AFU 0 Control
  , .cfg_ro_octrl00_reset_duration       (  8'h10                               ) // Number of cycles AFU reset is active (00=255 cycles)
  , .cfg_ro_octrl00_afu_control_index    (  6'b000000                           ) // Control structure for AFU Index 0
  , .cfg_ro_octrl00_pasid_len_supported  (  5'b00000                            ) // Default is 1 PASID
  , .cfg_ro_octrl00_metadata_supported   (  1'b0                                ) // MetaData is not supported
  , .cfg_ro_octrl00_actag_len_supported  ( 12'h001                              ) // Default is 1 acTag
    // Assigned configuration values 
  , .cfg_ro_function                     ( ro_function                          ) 
    // Functional interface
  , .cfg_function                        ( cfg_function                         )                       
  , .cfg_portnum                         ( cfg_portnum                          ) 
  , .cfg_addr                            ( cfg_addr                             ) 
  , .cfg_wdata                           ( cfg_wdata                            ) 
  , .cfg_rdata                           ( cfg_f1_rdata                         ) 
  , .cfg_rdata_vld                       ( cfg_f1_rdata_vld                     ) 
  , .cfg_wr_1B                           ( cfg_wr_1B                            ) 
  , .cfg_wr_2B                           ( cfg_wr_2B                            ) 
  , .cfg_wr_4B                           ( cfg_wr_4B                            ) 
  , .cfg_rd                              ( cfg_rd                               ) 
  , .cfg_bad_op_or_align                 ( cfg_f1_bad_op_or_align               )
  , .cfg_addr_not_implemented            ( cfg_f1_addr_not_implemented          )
    // Inputs defined by active AFU logic
  , .cfg_octrl00_terminate_in_progress   ( afu_f1_cfg_terminate_in_progress     ) // Function 1 contains one AFU
    // Individual fields from configuration registers
    // CSH
  , .cfg_csh_memory_space                ( cfg_f1_csh_memory_space              )
  , .cfg_csh_mmio_bar0                   ( cfg_f1_csh_mmio_bar0                 )
  , .cfg_csh_mmio_bar1                   ( cfg_f1_csh_mmio_bar1                 )
  , .cfg_csh_mmio_bar2                   ( cfg_f1_csh_mmio_bar2                 )
  , .cfg_csh_expansion_ROM_bar           ( cfg_f1_csh_expansion_ROM_bar         )
  , .cfg_csh_expansion_ROM_enable        ( cfg_f1_csh_expansion_ROM_enable      )
    // OFUNC
  , .cfg_ofunc_function_reset            ( cfg_f1_ofunc_function_reset          )
  , .cfg_ofunc_func_actag_base           ( cfg_f1_ofunc_func_actag_base         ) // These aren't needed in a single AFU device
  , .cfg_ofunc_func_actag_len_enab       ( cfg_f1_ofunc_func_actag_len_enab     ) // These aren't needed in a single AFU device
    // OCTRL
  , .cfg_octrl00_afu_control_index       ( cfg_f1_octrl00_afu_control_index     )
  , .cfg_octrl00_afu_unique              ( cfg_f1_octrl00_afu_unique            )
  , .cfg_octrl00_fence_afu               ( cfg_f1_octrl00_fence_afu             )  
  , .cfg_octrl00_enable_afu              ( cfg_f1_octrl00_enable_afu            )  
  , .cfg_octrl00_reset_afu               ( cfg_f1_octrl00_reset_afu             )
  , .cfg_octrl00_terminate_valid         ( cfg_f1_octrl00_terminate_valid       )
  , .cfg_octrl00_terminate_pasid         ( cfg_f1_octrl00_terminate_pasid       )
  , .cfg_octrl00_pasid_length_enabled    ( cfg_f1_octrl00_pasid_length_enabled  )
  , .cfg_octrl00_metadata_enabled        ( cfg_f1_octrl00_metadata_enabled      )
  , .cfg_octrl00_host_tag_run_length     ( cfg_f1_octrl00_host_tag_run_length   )
  , .cfg_octrl00_pasid_base              ( cfg_f1_octrl00_pasid_base            )
  , .cfg_octrl00_afu_actag_base          ( cfg_f1_octrl00_afu_actag_base        )
  , .cfg_octrl00_afu_actag_len_enab      ( cfg_f1_octrl00_afu_actag_len_enab    )
    // Interface to AFU Descriptor table (interface is Read Only)
  , .cfg_desc_afu_index                  ( cfg_desc_afu_index                   )
  , .cfg_desc_offset                     ( cfg_desc_offset                      )
  , .cfg_desc_cmd_valid                  ( cfg_desc_cmd_valid                   )
  , .desc_cfg_data                       ( desc_cfg_data                        )
  , .desc_cfg_data_valid                 ( desc_cfg_data_valid                  )
  , .desc_cfg_echo_cmd_valid             ( desc_cfg_echo_cmd_valid              )
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



// ==============================================================================================================================
// @@@ LPC: LPC top level
// ==============================================================================================================================

// Set AFU reset on either: card reset OR function reset OR software reset to AFU 0
assign reset_afu00 = ( reset == 1'b1        || 
                       cfg_f1_reset == 1'b1 ||
                      (cfg_f1_octrl00_reset_afu == 1'b1 && cfg_f1_octrl00_afu_control_index == 6'b000000) ) ? 1'b1 : 1'b0; 

rmem_afu AFU00 (
    .clock                                  ( clock_tlx                               )
  , .reset                                  ( reset_afu00                         )  // (positive active)
  , .ro_afu_index                           ( 6'b000000                           )  // This AFU is number 0
   // -----------------------------------
    // TLX Parser -> AFU Receive Interface
    // -----------------------------------
  , .tlx_afu_ready                          ( tlx_afu_ready                       )
    // Command interface to AFU
  , .afu_tlx_cmd_initial_credit             ( afu_tlx_cmd_initial_credit          )    
  , .afu_tlx_cmd_credit                     ( afu_tlx_cmd_credit                  )
  , .tlx_afu_cmd_valid                      ( tlx_afu_cmd_valid                   )
  , .tlx_afu_cmd_opcode                     ( tlx_afu_cmd_opcode                  )
  , .tlx_afu_cmd_dl                         ( tlx_afu_cmd_dl                      )
  , .tlx_afu_cmd_end                        ( tlx_afu_cmd_end                     )
  , .tlx_afu_cmd_pa                         ( tlx_afu_cmd_pa                      )
  , .tlx_afu_cmd_flag                       ( tlx_afu_cmd_flag                    )
  , .tlx_afu_cmd_os                         ( tlx_afu_cmd_os                      )
  , .tlx_afu_cmd_capptag                    ( tlx_afu_cmd_capptag                 )
  , .tlx_afu_cmd_pl                         ( tlx_afu_cmd_pl                      )
  , .tlx_afu_cmd_be                         ( tlx_afu_cmd_be                      )
    // Response interface to AFU
  , .afu_tlx_resp_initial_credit            ( afu_tlx_resp_initial_credit         )
  , .afu_tlx_resp_credit                    ( afu_tlx_resp_credit                 )
  , .tlx_afu_resp_valid                     ( tlx_afu_resp_valid                  )
  , .tlx_afu_resp_opcode                    ( tlx_afu_resp_opcode                 )  
  , .tlx_afu_resp_afutag                    ( tlx_afu_resp_afutag                 )
  , .tlx_afu_resp_code                      ( tlx_afu_resp_code                   )
  , .tlx_afu_resp_pg_size                   ( tlx_afu_resp_pg_size                )     
  , .tlx_afu_resp_dl                        ( tlx_afu_resp_dl                     )
  , .tlx_afu_resp_dp                        ( tlx_afu_resp_dp                     )
  , .tlx_afu_resp_host_tag                  ( tlx_afu_resp_host_tag               )
  , .tlx_afu_resp_cache_state               ( tlx_afu_resp_cache_state            )
  , .tlx_afu_resp_addr_tag                  ( tlx_afu_resp_addr_tag               )
    // Command data interface to AFU
  , .afu_tlx_cmd_rd_req                     ( afu_tlx_cmd_rd_req                  )
  , .afu_tlx_cmd_rd_cnt                     ( afu_tlx_cmd_rd_cnt                  )
  , .tlx_afu_cmd_data_valid                 ( tlx_afu_cmd_data_valid              )
  , .tlx_afu_cmd_data_bdi                   ( tlx_afu_cmd_data_bdi                )
  , .tlx_afu_cmd_data_bus                   ( tlx_afu_cmd_data_bus                )    
    // Response data interface to AFU
  , .afu_tlx_resp_rd_req                    ( afu_tlx_resp_rd_req                 )
  , .afu_tlx_resp_rd_cnt                    ( afu_tlx_resp_rd_cnt                 )
  , .tlx_afu_resp_data_valid                ( tlx_afu_resp_data_valid             )
  , .tlx_afu_resp_data_bdi                  ( tlx_afu_resp_data_bdi               )
  , .tlx_afu_resp_data_bus                  ( tlx_afu_resp_data_bus               )
    // ------------------------------------
    // AFU -> TLX Framer Transmit Interface
    // ------------------------------------
    // Initial credit allocation
//  , .tlx_afu_cmd_resp_initial_credit        ( tlx_afu_cmd_resp_initial_credit     )
//  , .tlx_afu_data_initial_credit            ( tlx_afu_data_initial_credit         )
  , .tlx_afu_cmd_initial_credit             ( tlx_afu_cmd_initial_credit        )
  , .tlx_afu_resp_initial_credit            ( tlx_afu_resp_initial_credit       )
  , .tlx_afu_cmd_data_initial_credit        ( tlx_afu_cmd_data_initial_credit   )
  , .tlx_afu_resp_data_initial_credit       ( tlx_afu_resp_data_initial_credit  )

    // Commands from AFU
  , .tlx_afu_cmd_credit                     ( tlx_afu_cmd_credit                  )               
  , .afu_tlx_cmd_valid                      ( afu_tlx_cmd_valid                   )             
  , .afu_tlx_cmd_opcode                     ( afu_tlx_cmd_opcode                  )              
  , .afu_tlx_cmd_actag                      ( afu_tlx_cmd_actag                   )             
  , .afu_tlx_cmd_stream_id                  ( afu_tlx_cmd_stream_id               )             
  , .afu_tlx_cmd_ea_or_obj                  ( afu_tlx_cmd_ea_or_obj               )             
  , .afu_tlx_cmd_afutag                     ( afu_tlx_cmd_afutag                  )               
  , .afu_tlx_cmd_dl                         ( afu_tlx_cmd_dl                      )            
  , .afu_tlx_cmd_pl                         ( afu_tlx_cmd_pl                      )           
  , .afu_tlx_cmd_os                         ( afu_tlx_cmd_os                      )            
  , .afu_tlx_cmd_be                         ( afu_tlx_cmd_be                      )            
  , .afu_tlx_cmd_flag                       ( afu_tlx_cmd_flag                    )
  , .afu_tlx_cmd_endian                     ( afu_tlx_cmd_endian                  )
  , .afu_tlx_cmd_bdf                        ( afu_tlx_cmd_bdf                     )                   
  , .afu_tlx_cmd_pasid                      ( afu_tlx_cmd_pasid                   )              
  , .afu_tlx_cmd_pg_size                    ( afu_tlx_cmd_pg_size                 )               
    // Command data from AFU
  , .tlx_afu_cmd_data_credit                ( tlx_afu_cmd_data_credit             )         
  , .afu_tlx_cdata_valid                    ( afu_tlx_cdata_valid                 )        
  , .afu_tlx_cdata_bus                      ( afu_tlx_cdata_bus                   )      
  , .afu_tlx_cdata_bdi                      ( afu_tlx_cdata_bdi                   ) 
    // Responses from AFU
  , .tlx_afu_resp_credit                    ( tlx_afu_resp_credit                 )
  , .afu_tlx_resp_valid                     ( afu_tlx_resp_valid                  )             
  , .afu_tlx_resp_opcode                    ( afu_tlx_resp_opcode                 )              
  , .afu_tlx_resp_dl                        ( afu_tlx_resp_dl                     )
  , .afu_tlx_resp_capptag                   ( afu_tlx_resp_capptag                )         
  , .afu_tlx_resp_dp                        ( afu_tlx_resp_dp                     )            
  , .afu_tlx_resp_code                      ( afu_tlx_resp_code                   )              
    // Response data from AFU
  , .tlx_afu_resp_data_credit               ( tlx_afu_resp_data_credit            )       
  , .afu_tlx_rdata_valid                    ( afu_tlx_rdata_valid                 )              
  , .afu_tlx_rdata_bus                      ( afu_tlx_rdata_bus                   )             
  , .afu_tlx_rdata_bdi                      ( afu_tlx_rdata_bdi                   )               
    // ------------------------------------
    // AFU <-> BDF Interface
    // ------------------------------------  
  , .cfg_afu_bdf_bus                        ( cfg_bus                             )
  , .cfg_afu_bdf_device                     ( ro_device                           )
  , .cfg_afu_bdf_function                   ( ro_function                         )
    // ---------------------------------------
    // Configuration Space Outputs used by AFU
    // ---------------------------------------
    // MMIO
  , .cfg_csh_memory_space                   ( cfg_f1_csh_memory_space             )
  , .cfg_csh_mmio_bar0                      ( cfg_f1_csh_mmio_bar0                )
    // 'assign_actag' generation controls
  , .cfg_octrl00_afu_actag_len_enab         ( cfg_f1_octrl00_afu_actag_len_enab   )
  , .cfg_octrl00_afu_actag_base             ( cfg_f1_octrl00_afu_actag_base       )
    // Process termination controls
  , .cfg_terminate_in_progress              ( afu_f1_cfg_terminate_in_progress    )   
  , .cfg_octrl00_terminate_valid            ( cfg_f1_octrl00_terminate_valid      )   
  , .cfg_octrl00_terminate_pasid            ( cfg_f1_octrl00_terminate_pasid      )   
    // PASID controls
  , .cfg_octrl00_pasid_length_enabled       ( cfg_f1_octrl00_pasid_length_enabled )   
  , .cfg_octrl00_pasid_base                 ( cfg_f1_octrl00_pasid_base           )   
    // Interrupt generation controls
  , .cfg_f0_otl0_long_backoff_timer         ( cfg_f0_otl0_long_backoff_timer      )
  , .cfg_f0_otl0_short_backoff_timer        ( cfg_f0_otl0_short_backoff_timer     )
  , .cfg_octrl00_enable_afu                 ( cfg_f1_octrl00_enable_afu           )   
    // Interface to AFU Descriptor table (interface is Read Only)
  , .cfg_desc_afu_index                     ( cfg_desc_afu_index                  )  
  , .cfg_desc_offset                        ( cfg_desc_offset                     )
  , .cfg_desc_cmd_valid                     ( cfg_desc_cmd_valid                  )
  , .desc_cfg_data                          ( desc0_cfg_data                      )
  , .desc_cfg_data_valid                    ( desc0_cfg_data_valid                )
  , .desc_cfg_echo_cmd_valid                ( desc0_cfg_echo_cmd_valid            )
    // Errors to record from CFG Sub-System, Descriptor Table, and VPD
  , .vpd_err_unimplemented_addr             ( vpd_err_unimplemented_addr          )
  , .cfg0_cff_fifo_overflow                 ( cfg0_cff_fifo_overflow              )
  , .cfg1_cff_fifo_overflow                 ( cfg1_cff_fifo_overflow              )
  , .cfg0_rff_fifo_overflow                 ( cfg0_rff_fifo_overflow              )
  , .cfg1_rff_fifo_overflow                 ( cfg1_rff_fifo_overflow              )
  , .cfg_errvec                             ( cfg_errvec                          )
  , .cfg_errvec_valid                       ( cfg_errvec_valid                    )
    // Resync credits control
  , .cfg_f1_octrl00_resync_credits          ( resync_credits_afu00                )
  , .serdes_init_clock                      ( serdes_init_clock                   )
  , .qsfp0_ref_clk_n                        ( qsfp0_ref_clk_n                     )
  , .qsfp0_ref_clk_p                        ( qsfp0_ref_clk_p                     )
  , .qsfp0_rx_n                             ( qsfp0_rx_n                          )
  , .qsfp0_rx_p                             ( qsfp0_rx_p                          )
  , .qsfp0_tx_n                             ( qsfp0_tx_n                          )
  , .qsfp0_tx_p                             ( qsfp0_tx_p                          )
  , .qsfp1_ref_clk_n                        ( qsfp1_ref_clk_n                     )
  , .qsfp1_ref_clk_p                        ( qsfp1_ref_clk_p                     )
  , .qsfp1_rx_n                             ( qsfp1_rx_n                          )
  , .qsfp1_rx_p                             ( qsfp1_rx_p                          )
  , .qsfp1_tx_n                             ( qsfp1_tx_n                          )
  , .qsfp1_tx_p                             ( qsfp1_tx_p                          )

);


endmodule //-- oc_cfg
