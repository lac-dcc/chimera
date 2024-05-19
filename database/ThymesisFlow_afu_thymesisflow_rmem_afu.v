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
// Module designer: Dimitris Syrivelis
// Backup: Christian Pinto, Michele Gazzetti

`timescale 1ns / 1ps
// -------------------------------------------------------------------
//
// Title    : rmem_afu.v -- heavily based on lpc_afu.v of the LPC AFU reference design.
// Function : This file is the top level wrapper for the RMEM AFU.
//
// -------------------------------------------------------------------
// Modification History :
//                               |Version    |     |Author   |Description of change
//                               |-----------|     |-------- |---------------------
//  Derived from 
// -------------------------------------------------------------------

// Update below as AFU snapshots change. Do not change the format of these lines else scripts to auto-update them will falter.
`define AFU_VERSION_MAJOR 8'h06  
`define AFU_VERSION_MINOR 8'h08


// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
module rmem_afu (

    // -----------------------------------
    // Miscellaneous Ports
    // -----------------------------------
    input          clock                        
  , input          reset                        // (positive active
  , input    [5:0] ro_afu_index                 // Each AFU instance under a common Function needs a unique index number
   
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
  , input  [  7:0] tlx_afu_resp_opcode        // (w/resp_valid) Resp Opcode     
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
  ,  input          tlx_afu_resp_data_credit          
  , output         afu_tlx_rdata_valid               
  , output [511:0] afu_tlx_rdata_bus                 
  , output         afu_tlx_rdata_bdi           // When 1, marks response data associated with AFU's reply to Host->AFU cmd as bad                

    // ------------------------------------
    // AFU <-> BDF Interface
    // ------------------------------------

  , input    [7:0] cfg_afu_bdf_bus               // Current BDF value held in CFG_SEQ
  , input    [4:0] cfg_afu_bdf_device 
  , input    [2:0] cfg_afu_bdf_function

    // ---------------------------------------
    // Configuration Space Outputs used by AFU
    // ---------------------------------------
 
   // MMIO
  , input         cfg_csh_memory_space
  , input  [63:0] cfg_csh_mmio_bar0 

    // 'assign_actag' generation controls
  , input  [11:0] cfg_octrl00_afu_actag_base          // This is the base acTag      this AFU can use (linear value)
  , input  [11:0] cfg_octrl00_afu_actag_len_enab      // This is the range of acTags this AFU can use (linear value)

    // Process termination controls
  , output        cfg_terminate_in_progress           // Unused by LPC since it doesn't make sense to terminate the general interrupt process
  , input         cfg_octrl00_terminate_valid         // Unused by LPC since it doesn't make sense to terminate the general interrupt process
  , input  [19:0] cfg_octrl00_terminate_pasid         // Unused by LPC since it doesn't make sense to terminate the general interrupt process 

    // PASID controls
  , input   [4:0] cfg_octrl00_pasid_length_enabled    // Should be >=0 for LPC to allow it to have at least 1 PASID for interrupts 
  , input  [19:0] cfg_octrl00_pasid_base              // Starting value of PASIDs, must be within 'Max PASID Width'
                                                      // Notes: 
                                                      // - 'PASID base' is for this AFU, used to keep PASID range within each AFU unique.
                                                      // - 'PASID Length Enabled' + 'PASID base' must be within range of 'Max PASID Width'
                                                      // More Notes:
                                                      // - 'Max PASID Width' and 'PASID Length Supported' are Read Only inputs to cfg_func.
                                                      // - 'Max PASID Width' is range of PASIDs across all AFUs controlled by this BDF.
                                                      // - 'PASID Length Supported' can be <, =, or > 'Max PASID Width' 
                                                      //   The case of 'PASID Length Supported' > 'Max PASID Width' may seem odd. However it 
                                                      //   is legal since an AFU may support more PASIDs than it advertizes, for instance
                                                      //   in the case where a more general purpose AFU is reused in an application that
                                                      //   has a restricted use.

    // Interrupt generation controls
  , input   [3:0] cfg_f0_otl0_long_backoff_timer      // TLX Configuration for the TLX port(s) connected to AFUs under this Function
  , input   [3:0] cfg_f0_otl0_short_backoff_timer
  , input         cfg_octrl00_enable_afu              // When 1, the AFU can initiate commands to the host
 
    // AFU Descriptor Table interface to AFU Configuration Space
  , input   [5:0] cfg_desc_afu_index
  , input  [30:0] cfg_desc_offset
  , input         cfg_desc_cmd_valid
  , output [31:0] desc_cfg_data
  , output        desc_cfg_data_valid
  , output        desc_cfg_echo_cmd_valid

    // Errors to record from Configuration Sub-system, Descriptor Table, and VPD
  , input         vpd_err_unimplemented_addr
  , input         cfg0_cff_fifo_overflow
  , input         cfg1_cff_fifo_overflow
  , input         cfg0_rff_fifo_overflow
  , input         cfg1_rff_fifo_overflow
  , input [127:0] cfg_errvec
  , input         cfg_errvec_valid
 
    // Resync credits control
  , input         cfg_f1_octrl00_resync_credits

   //AFU <-> RMEM Pipeline SIGNALS


  //Indicates that network pipeline is empty and thus guards the 
  // response OR gate that feeds TLX with responses from MMIO and MEM commands.
  , input network_pipeline_empty
   //Network interface control
   //Aurora status - not currently connected to aurora cores
  , input [8:0] aurora_core0_status
  , input [8:0] aurora_core1_status
  , input [8:0] aurora_core2_status
  , input [8:0] aurora_core3_status
  , input [8:0] aurora_core4_status
  , input [8:0] aurora_core5_status
  , input [8:0] aurora_core6_status
  //Aurora control - for software driven equalizer tuning - not yet connected to aurora cores
  , output [19:0] aurora_txpostcursorctrl
  , output [19:0] aurora_txprecursorctrl
  , output [19:0] aurora_txdiffctrl

  //GTY FPGA pins and reference clock coming from top and constraints file - FPGA transceiver Tx/RX differential pins from the QSFP cages for aurora cores
  , input              serdes_init_clock
  , input              qsfp0_ref_clk_n 
  , input              qsfp0_ref_clk_p 
  , input  [0:3]       qsfp0_rx_n
  , input  [0:3]       qsfp0_rx_p
  , output [0:3]       qsfp0_tx_n
  , output [0:3]       qsfp0_tx_p  
  , input              qsfp1_ref_clk_n 
  , input              qsfp1_ref_clk_p 
  , input  [0:3]       qsfp1_rx_n
  , input  [0:3]       qsfp1_rx_p
  , output [0:3]       qsfp1_tx_n
  , output [0:3]       qsfp1_tx_p  
 
 
) ;

// ==============================================================================================================================
// @@@  PARM: Parameters
// ==============================================================================================================================
//Defines the output response queue maximum allowed watermark before the push side needs to stall.
//used for tlx_afu responses
parameter FIFO_THRES = 11'h14;//20 resp flits threshold

//==============================================================================================================================
// @@ Connecting the TLX interface to AXI-S based Thymesisflow-P Remote memory pipeline
//==============================================================================================================================

wire           ncff_cmd_tready;// When 1, increment read FIFO pointer to present the next FIFO entry
wire  [162:0]  ncff_cmd_tdata;
wire           ncff_cmd_tvalid;  
wire           reset_n;
assign         reset_n = ~reset;

wire           cmddata_fifo_tready;
wire   [512:0] cmddata_fifo_tdata;     
wire           cmddata_fifo_tvalid;     
wire           aurora_start0;
wire           aurora_start1;

wire   [549:0] rff_resp_in_tdata;          
wire           rff_resp_in_tvalid; 
wire           rff_resp_in_tready;     
wire [1:0]     rff_dummy; 
 
wire [35:0]    rty_timeout;
wire [11:0]    act_actag;
wire           enable;

wire [39:0]    tl_resp_tdata;
wire           tl_resp_tvalid; 
wire           tl_resp_tready;   
wire [31:0]    tl_resp_early_fifo_cnt;
wire [519:0]   tl_resp_data_tdata;
wire           tl_resp_data_tvalid;
wire           tl_resp_data_tready; 
wire [199:0]   tlx_cmd_tdata;
wire           tlx_cmd_tvalid;
wire           tlx_cmd_tready;
wire [519:0]   tlx_data_tdata;
wire           tlx_data_tvalid;
wire           tlx_data_tready;
 
thymesisflow_top TF_TOP (

       .clock	                                (clock                           )
      ,.reset_n                                 (reset_n                         )
      ,.serdes_init_clock                       (serdes_init_clock               )
      ,.serdes_start0                           (aurora_start0                   ) 
      ,.serdes_start1                           (aurora_start1                   )    
//if TFMEMORY is not defined then build compute side
`ifndef TFMEMORY
      //OpenCAPI TLX command flit AXI-S channel
      ,.ocx_tlx_cmd_flit_in_tdata               (ncff_cmd_tdata                  )
      ,.ocx_tlx_cmd_flit_in_tvalid              (ncff_cmd_tvalid                 )
      ,.ocx_tlx_cmd_flit_in_tready              (ncff_cmd_tready                 )
     //OpenCAPI TLX cmddata flit AXI-S channel
      ,.ocx_tlx_cmddata_flit_in_tdata           (cmddata_fifo_tdata              )
      ,.ocx_tlx_cmddata_flit_in_tvalid          (cmddata_fifo_tvalid             )
      ,.ocx_tlx_cmddata_flit_in_tready          (cmddata_fifo_tready             )
     //OpenCAPI TLx Response (cmd/data combined channel) to issued commands
      ,.ocx_tlx_resp_tdata                      ({rff_dummy,rff_resp_in_tdata}   )
      ,.ocx_tlx_resp_tvalid                     (rff_resp_in_tvalid              )
      ,.ocx_tlx_resp_tready                     (rff_resp_in_tready              )
`endif

`ifndef TFCOMPUTE
      ,.ocx_tl_resp_tdata                       (tl_resp_tdata                   )
      ,.ocx_tl_resp_tvalid                      (tl_resp_tvalid                  )
      ,.ocx_tl_resp_tready                      (tl_resp_tready                  )
      //OpenCAPI TL Response data AXI-S channel
      ,.ocx_tl_resp_data_tdata                  (tl_resp_data_tdata              )             
      ,.ocx_tl_resp_data_tvalid                 (tl_resp_data_tvalid             )
      ,.ocx_tl_resp_data_tready                 (tl_resp_data_tready             )
      //OpenCAPI mem TLx cmd
      ,.ocx_tlx_cmd_tdata                       (tlx_cmd_tdata                   )                                
      ,.ocx_tlx_cmd_tvalid                      (tlx_cmd_tvalid                  )
      ,.ocx_tlx_cmd_tready                      (tlx_cmd_tready                  )
      //OpenCAPI mem TLx data
      ,.ocx_tlx_data_tdata                      (tlx_data_tdata                  )
      ,.ocx_tlx_data_tvalid                     (tlx_data_tvalid                 )
      ,.ocx_tlx_data_tready                     (tlx_data_tready                 )
      ,.tl_resp_fifo_axis_data_count            (tl_resp_early_fifo_cnt          )
      //mem mode enable by sending ACTAG
      ,.mem_mode_enable                         (enable                          )
      // Active ACTAG
      ,.active_actag                            (act_actag                       )
      //mem mode rty timeout in case of rty cmd responses
      ,.rty_timeout                             (rty_timeout                     )

`endif

     // QSFP0 external FPGA pins
      ,.qsfp0_ref_clk_n                         (qsfp0_ref_clk_n                 )
      ,.qsfp0_ref_clk_p                         (qsfp0_ref_clk_p                 ) 
      ,.qsfp0_rx_n                              (qsfp0_rx_n                      )
      ,.qsfp0_rx_p                              (qsfp0_rx_p                      )
      ,.qsfp0_tx_n                              (qsfp0_tx_n                      )
      ,.qsfp0_tx_p                              (qsfp0_tx_p                      )



      // QSFP1 external FPGA pins
      ,.qsfp1_ref_clk_n                         (qsfp1_ref_clk_n                 ) 
      ,.qsfp1_ref_clk_p                         (qsfp1_ref_clk_p                 )
      ,.qsfp1_rx_n                              (qsfp1_rx_n                      )
      ,.qsfp1_rx_p                              (qsfp1_rx_p                      )
      ,.qsfp1_tx_n                              (qsfp1_tx_n                      )
      ,.qsfp1_tx_p                              (qsfp1_tx_p                      )


     );
 

// ==============================================================================================================================
// @@@  SIG: Internal signals 
// ==============================================================================================================================

// Signals for managing BDF
wire [15:0] afu_tlx_cmd_bdf_int;


// Signals from MMIO Register space
wire  [19:0] mmio_addr;                 // Target address for the read or write access
reg   [63:0] mmio_wdata;                // Write data into selected config reg
wire  [63:0] mmio_rdata;                // Read  data from selected config reg
wire         mmio_rdata_vld;            // When observed in the proper cycle, indicates if rdata has valid information
reg          mmio_wr_1B;                // When 1, triggers a write operation of 1 byte      (addr[2:0] selects byte)
reg          mmio_wr_2B;                // When 1, triggers a write operation of 2 bytes     (addr[2:1] selects starting byte)
reg          mmio_wr_4B;                // When 1, triggers a write operation of all 4 bytes (addr[2]   selects starting byte)
reg          mmio_wr_8B;                // When 1, triggers a write operation of all 4 bytes
reg          mmio_rd;                   // When 1, triggers a read operation that returns all 4 bytes of data from the reg
wire         mmio_bad_op_or_align;      // Pulsed when multiple write/read strobes are active or writes are not naturally aligned
wire         mmio_addr_not_implemented; // Pulsed when address provided is not implemented as an MMIO register
wire  [63:0] mmio_in_captured_errors;   // When pulsed to 1, the associated MMIO reg bit is captured and held to 1. Write to 0 to clear. 
wire  [63:0] mmio_in_status;            // Provide a READ ONLY way for signals like status to be assigned an MMIO address
wire         mmio_in_intrp_is_pending;  // When 1, set interrupt pending bit in MSI-X PBA register
wire         mmio_out_ignore_nomatch_on_read;  // When 1, reading from uninitialized memory is not a read error
wire         mmio_out_enable_pipeline;  // When 1, enables bulk memory operations to be pipelined. When 0, they are processed one at a time.
wire  [63:0] mmio_out_intrp_ea;         // Effective Address to use in intrp_req
wire         mmio_out_intrp_vec_mask;   // Enable/disable indicator of intrp_ea

wire  [19:0] mmio_out_intrp_pasid;      // PASID value to use in assign_actag preceding intrp_req
wire   [3:0] mmio_out_intrp_cmd_flag;   // CMD_FLAG  value to use in intrp_req
wire   [3:0] mmio_out_intrp_stream_id;  // STREAM_ID value to use in intrp_req
wire  [15:0] mmio_out_intrp_afutag;     // AFUTAG    value to use in intrp_req
                                       
// Signals used by Error Array
reg   [15:0] ery_loadsrc;
wire [127:0] ery_src15; 
wire [127:0] ery_src14;  
wire [127:0] ery_src09;
reg  [127:0] ery_src08;
reg  [127:0] ery_src07;
reg  [127:0] ery_src06;
reg  [127:0] ery_src05;
reg  [127:0] ery_src04;
reg  [127:0] ery_src03;
reg  [127:0] ery_src02;
reg  [127:0] ery_src01;
reg  [127:0] ery_src00;
wire [127:0] ery_data_out;
wire         ery_data_valid;
wire         ery_data_done;
wire         ery_simultaneous_load;
wire         ery_overflow;
wire         ery_trigger_intrp;

// Capture error information on config_write and config_read for reporting through interrupts and MMIO registers
always @(posedge(clock))
  begin
    ery_loadsrc[0]     <= cfg_errvec_valid;
    ery_src00[127:112] <= 16'h0001;                // Mark source as coming from config_write
    ery_src00[111:0]   <= cfg_errvec[111:0];       // Rest of fields are already formatted

    ery_loadsrc[1]     <= 1'b0;                    // UNUSED AT THIS TIME
    ery_src01[127:112] <= 16'h0002;                // Mark source as coming from config_read
    ery_src01[111:0]   <= 112'b0;                  // Rest of fields are already formatted
  end

always @(posedge(clock))
  ery_loadsrc[13:9] <= 5'b0;
assign ery_src09   = 128'h00000009_00000000_00000000_00000000;   // Reserve one active location for future function


// Signals used by interrupt request logic 
reg [2:0] intrp_count;            // Counts 0-7 to match size of ERRARY. If that increases, this needs to also.
wire      irq_ok_to_send_intrp;   // Combine all the conditions necessary to enable sending an intrp_req
// Signals used by AFU->Host commands, Host->AFU responses
wire received_bad_op;               
wire err1_lock_afu_to_host_intf;   
wire err2_lock_afu_to_host_intf;


// Signals used by AFU Descriptor Table
wire desc_err_unimplemented_addr;



// ==============================================================================================================================
// @@@ ACS: AFU Configuration Signals (register configuration outputs before use)
// ==============================================================================================================================
// These signals can be registered since they should be relatively static during functional use. This may help with timing closure.
// Signals from the 'AFU Information DVSEC' (OINFO) and 'AFU Control DVSEC' (OCTRL) however must be captured and held, since 
// the same configuration space can target different AFUs. Each one has an 'AFU Index' field that identifies which AFU the 
// bits refer to at the current time.   


  reg          acs_memory_space
; reg   [63:0] acs_mmio_bar0 
; reg   [11:0] acs_actag_len_enabled         
; reg   [11:0] acs_actag_base                
; reg    [4:0] acs_pasid_length_enabled         
; reg   [19:0] acs_pasid_base                   
; reg          acs_enable_afu                  
; reg   [35:0] acs_long_backoff_timer      // Convert 2^n value to clock cycle count at 400 MHz (or close to it)    
;

always @(posedge(clock))
  begin
    acs_memory_space             <= cfg_csh_memory_space             ;
    acs_mmio_bar0                <= cfg_csh_mmio_bar0                ;
    acs_actag_len_enabled        <= cfg_octrl00_afu_actag_len_enab   ;
    acs_actag_base               <= cfg_octrl00_afu_actag_base       ;
    acs_pasid_length_enabled     <= cfg_octrl00_pasid_length_enabled ; 
    acs_pasid_base               <= cfg_octrl00_pasid_base           ; 
    acs_enable_afu               <= cfg_octrl00_enable_afu           ;
    case (cfg_f0_otl0_long_backoff_timer)                   // At 400 MHz, 40 clock cycles (x28) = 100 ns
      4'b0000: acs_long_backoff_timer  <= 36'h0_0000_0028;  //  2^(2*0)  =          1 * 100 ns  
      4'b0001: acs_long_backoff_timer  <= 36'h0_0000_00A0;  //  2^(2*1)  =          4 * 100 ns
      4'b0010: acs_long_backoff_timer  <= 36'h0_0000_0280;  //  2^(2*2)  =         16 * 100 ns   
      4'b0011: acs_long_backoff_timer  <= 36'h0_0000_0A00;  //  2^(2*3)  =         64 * 100 ns     
      4'b0100: acs_long_backoff_timer  <= 36'h0_0000_2800;  //  2^(2*4)  =        256 * 100 ns     
      4'b0101: acs_long_backoff_timer  <= 36'h0_0000_A000;  //  2^(2*5)  =       1024 * 100 ns     
      4'b0110: acs_long_backoff_timer  <= 36'h0_0002_8000;  //  2^(2*6)  =       4096 * 100 ns     
      4'b0111: acs_long_backoff_timer  <= 36'h0_000A_0000;  //  2^(2*7)  =      16384 * 100 ns     
      4'b1000: acs_long_backoff_timer  <= 36'h0_0028_0000;  //  2^(2*8)  =      65536 * 100 ns    
      4'b1001: acs_long_backoff_timer  <= 36'h0_00A0_0000;  //  2^(2*9)  =     262144 * 100 ns      
      4'b1010: acs_long_backoff_timer  <= 36'h0_0280_0000;  //  2^(2*10) =    1048576 * 100 ns     
      4'b1011: acs_long_backoff_timer  <= 36'h0_0A00_0000;  //  2^(2*11) =    4184304 * 100 ns    
      4'b1100: acs_long_backoff_timer  <= 36'h0_2800_0000;  //  2^(2*12) =   16777216 * 100 ns    
      4'b1101: acs_long_backoff_timer  <= 36'h0_A000_0000;  //  2^(2*13) =   67108864 * 100 ns    
      4'b1110: acs_long_backoff_timer  <= 36'h2_8000_0000;  //  2^(2*14) =  268435456 * 100 ns    
      4'b1111: acs_long_backoff_timer  <= 36'hA_0000_0000;  //  2^(2*15) = 1073741824 * 100 ns    
   endcase 
  end
//assign the retry_timemout for command re-issue in case of XLATE_PENDING
assign  rty_timeout =  acs_long_backoff_timer;

// ==============================================================================================================================
// @@@ COM: Common / Miscellanous Logic
// ==============================================================================================================================


// To prevent synthesis warnings about inputs that are unused because the function they are associated with is unsupported,
// create a dummy logic structure that has no real use. Make a 1 bit latch that OR's together all the unused inputs.
// Also OR in itself so nothing is dangling, even the latch output. 
// Use the Verilog OR-reduction operator on vectors (| vector_name[x:0]) to shorten the code.
reg unused_inputs_q;
always @(posedge(clock))    
  unused_inputs_q <= unused_inputs_q | tlx_afu_cmd_os ;


// ==============================================================================================================================
// @@@ OR: OR logic driving signals to TLX
// ==============================================================================================================================
// Implement OR gates to combine control signals driven by AFU to TLX from various command state machines.
// The idea here is since there is 1 physical interface back to the TLX and multiple command state machines need to
// share it, enforce the rule that each state machine must set its copy of the signal to all 0 when not in use.
// That way a simple OR just before driving the output will allow the state machine that is engaged to control 
// the output to the TLX.

// -------------------------------------------
// Host to AFU commands, AFU to Host responses
// -------------------------------------------


reg         afu_tlx_cmd_rd_req_mmw;  
reg         afu_tlx_cmd_rd_req_lpc_io;

assign afu_tlx_cmd_rd_req = afu_tlx_cmd_rd_req_mmw     // MMIO write
`ifndef TFMEMORY
                           | afu_tlx_cmd_rd_req_lpc_io     // lpc i/o
`endif 
                           ;
reg  [2:0] afu_tlx_cmd_rd_cnt_mmw;
reg  [2:0] afu_tlx_cmd_rd_cnt_lpc_io;

assign afu_tlx_cmd_rd_cnt = afu_tlx_cmd_rd_cnt_mmw     // MMIO write
`ifndef TFMEMORY
                          | afu_tlx_cmd_rd_cnt_lpc_io     // lpc i/o
`endif 
                          ;

reg         afu_tlx_resp_valid_mmw;
reg         afu_tlx_resp_valid_mmr;
reg         afu_tlx_resp_valid_lpc_io;
assign afu_tlx_resp_valid = afu_tlx_resp_valid_mmw |    // MMIO write
                            afu_tlx_resp_valid_mmr      // MMIO read
`ifndef TFMEMORY
                            | afu_tlx_resp_valid_lpc_io    // lpc i/o
`endif 
                          ;

reg   [7:0] afu_tlx_resp_opcode_mmw;
reg   [7:0] afu_tlx_resp_opcode_mmr;
reg   [7:0] afu_tlx_resp_opcode_lpc_io;
assign afu_tlx_resp_opcode = afu_tlx_resp_opcode_mmw |    // MMIO write
                             afu_tlx_resp_opcode_mmr      // MMIO read
`ifndef TFMEMORY
                             | afu_tlx_resp_opcode_lpc_io     // lpc i/o
`endif 
                             ;

reg   [1:0] afu_tlx_resp_dl_mmw;
reg   [1:0] afu_tlx_resp_dl_mmr;
reg   [1:0] afu_tlx_resp_dl_lpc_io;
assign afu_tlx_resp_dl = afu_tlx_resp_dl_mmw |    // MMIO write
                         afu_tlx_resp_dl_mmr      // MMIO read
`ifndef TFMEMORY                      
                         | afu_tlx_resp_dl_lpc_io    // lpc i/o
`endif                          
                         ;

reg  [15:0] afu_tlx_resp_capptag_mmw;
reg  [15:0] afu_tlx_resp_capptag_mmr;
reg  [15:0] afu_tlx_resp_capptag_lpc_io;
assign afu_tlx_resp_capptag = afu_tlx_resp_capptag_mmw |    // MMIO write
                              afu_tlx_resp_capptag_mmr     // MMIO read
`ifndef TFMEMORY
                              | afu_tlx_resp_capptag_lpc_io     // lpc i/o
`endif 
                              ;

reg   [1:0] afu_tlx_resp_dp_mmw;
reg   [1:0] afu_tlx_resp_dp_mmr;
reg   [1:0] afu_tlx_resp_dp_lpc_io;
assign afu_tlx_resp_dp = afu_tlx_resp_dp_mmw |    // MMIO write
                         afu_tlx_resp_dp_mmr      // MMIO read
`ifndef TFMEMORY
                         | afu_tlx_resp_dp_lpc_io   // lpc i/o
`endif 
                         ;

reg   [3:0] afu_tlx_resp_code_mmw;
reg   [3:0] afu_tlx_resp_code_mmr;
reg   [3:0] afu_tlx_resp_code_lpc_io;
assign afu_tlx_resp_code = afu_tlx_resp_code_mmw |     // MMIO write
                           afu_tlx_resp_code_mmr      // MMIO read
`ifndef TFMEMORY
                           | afu_tlx_resp_code_lpc_io     // lpc i/o
`endif 
                           ;

reg          afu_tlx_rdata_valid_mmr;
reg          afu_tlx_rdata_valid_lpc_io;
assign afu_tlx_rdata_valid = afu_tlx_rdata_valid_mmr    // MMIO read
`ifndef TFMEMORY
                           | afu_tlx_rdata_valid_lpc_io      // lpc i/o
`endif 
                           ;
                     


reg  [511:0] afu_tlx_rdata_bus_mmr;
reg  [511:0] afu_tlx_rdata_bus_lpc_io;
assign afu_tlx_rdata_bus = afu_tlx_rdata_bus_mmr       // MMIO read 
`ifndef TFMEMORY
                           | afu_tlx_rdata_bus_lpc_io       // lpc i/o
`endif
                           ;
reg          afu_tlx_rdata_bdi_mmr;
reg          afu_tlx_rdata_bdi_lpc_io;
assign afu_tlx_rdata_bdi = afu_tlx_rdata_bdi_mmr       // MMIO read   
`ifndef TFMEMORY                       
                           | afu_tlx_rdata_bdi_lpc_io       // lpc i/o
`endif 
                           ;

// Some inputs into MMIO space have multiple sources also
reg  [19:0] mmio_addr_mmw;
reg  [19:0] mmio_addr_mmr;
assign mmio_addr = mmio_addr_mmw   |   // MMIO write
                   mmio_addr_mmr;      // MMIO read


// -------------------------------------------
// AFU to Host commands, Host to AFU responses
// -------------------------------------------

reg         afu_tlx_resp_credit_irq1;
reg         afu_tlx_resp_credit_irq2;
reg         afu_tlx_resp_rd_req_mem_io;

`ifdef TFCOMPUTE
assign afu_tlx_resp_rd_req = 1'b0; 
`else
assign afu_tlx_resp_rd_req = afu_tlx_resp_rd_req_mem_io;
`endif 

reg   [2:0] afu_tlx_resp_rd_cnt_mem_io;
`ifdef TFCOMPUTE
assign afu_tlx_resp_rd_cnt = 3'b0; 
`else  
assign afu_tlx_resp_rd_cnt = afu_tlx_resp_rd_cnt_mem_io;
`endif 

reg          afu_tlx_cmd_valid_irq1;
reg          afu_tlx_cmd_valid_irq2;
reg          afu_tlx_cmd_valid_mem_io;

`ifdef TFCOMPUTE
assign afu_tlx_cmd_valid = 1'b0;
`else
assign afu_tlx_cmd_valid = afu_tlx_cmd_valid_mem_io;
`endif 


reg   [7:0] afu_tlx_cmd_opcode_irq1;
reg   [7:0] afu_tlx_cmd_opcode_irq2;
reg   [7:0] afu_tlx_cmd_opcode_mem_io;

`ifdef TFCOMPUTE
assign afu_tlx_cmd_opcode = 8'b0; 
`else
assign afu_tlx_cmd_opcode = afu_tlx_cmd_opcode_mem_io;
`endif 

reg   [11:0] afu_tlx_cmd_actag_irq1;
reg   [11:0] afu_tlx_cmd_actag_irq2;
reg   [11:0] afu_tlx_cmd_actag_mem_io;

`ifdef TFCOMPUTE
assign afu_tlx_cmd_actag = 12'b0; 
`else
assign afu_tlx_cmd_actag = afu_tlx_cmd_actag_mem_io;
`endif 

reg    [3:0] afu_tlx_cmd_stream_id_irq;
reg   [3:0] afu_tlx_cmd_stream_id_mem_io;

`ifdef TFCOMPUTE
assign afu_tlx_cmd_stream_id = 4'b0; 
`else
assign afu_tlx_cmd_stream_id = afu_tlx_cmd_stream_id_mem_io;  
`endif

reg   [67:0] afu_tlx_cmd_ea_or_obj_irq;
reg  [67:0] afu_tlx_cmd_ea_or_obj_mem_io;

`ifdef TFCOMPUTE
assign afu_tlx_cmd_ea_or_obj = 68'b0;
`else
assign afu_tlx_cmd_ea_or_obj = afu_tlx_cmd_ea_or_obj_mem_io;
`endif 

reg   [15:0] afu_tlx_cmd_afutag_irq;
reg  [15:0] afu_tlx_cmd_afutag_mem_io;
`ifdef TFCOMPUTE
assign afu_tlx_cmd_afutag = 16'b0;
`else
assign afu_tlx_cmd_afutag = afu_tlx_cmd_afutag_mem_io;
`endif 

reg   [1:0] afu_tlx_cmd_dl_mem_io;
`ifdef TFCOMPUTE
assign afu_tlx_cmd_dl = 2'b0;
`else
assign afu_tlx_cmd_dl = afu_tlx_cmd_dl_mem_io;
`endif 

reg   [2:0] afu_tlx_cmd_pl_mem_io;
`ifdef TFCOMPUTE
assign afu_tlx_cmd_pl = 3'b0;
`else
assign afu_tlx_cmd_pl = afu_tlx_cmd_pl_mem_io;
`endif 

wire       afu_tlx_cmd_os_mem_io;
`ifdef TFCOMPUTE
assign afu_tlx_cmd_os = 1'b0;
`else
assign afu_tlx_cmd_os =  afu_tlx_cmd_os_mem_io;
`endif 

reg  [63:0] afu_tlx_cmd_be_mem_io;

`ifdef TFCOMPUTE
assign afu_tlx_cmd_be = 64'b0;   
`else
assign afu_tlx_cmd_be =  afu_tlx_cmd_be_mem_io;
`endif 

reg   [3:0] afu_tlx_cmd_flag_irq;
wire  [3:0] afu_tlx_cmd_flag_mem_io;
`ifdef TFCOMPUTE
assign afu_tlx_cmd_flag = 4'b0;
`else
assign afu_tlx_cmd_flag =  afu_tlx_cmd_flag_mem_io;
`endif 

wire   afu_tlx_cmd_endian_mem_io;
`ifdef TFCOMPUTE
assign afu_tlx_cmd_endian = 1'b0;
`else
assign afu_tlx_cmd_endian = afu_tlx_cmd_endian_mem_io;
`endif 

// afu_tlx_cmd_bdf is set directly by config space values
assign afu_tlx_cmd_bdf = afu_tlx_cmd_bdf_int;                                          

reg   [19:0] afu_tlx_cmd_pasid_irq;
reg  [19:0] afu_tlx_cmd_pasid_mem_io;

`ifdef TFCOMPUTE
assign afu_tlx_cmd_pasid = 20'b0;
`else
assign afu_tlx_cmd_pasid = afu_tlx_cmd_pasid_mem_io;
`endif 

reg   [5:0] afu_tlx_cmd_pg_size_mem_io;

`ifdef TFCOMPUTE
assign afu_tlx_cmd_pg_size = 6'b0;
`else
assign afu_tlx_cmd_pg_size = afu_tlx_cmd_pg_size_mem_io;
`endif

reg         afu_tlx_cdata_valid_mem_io;

`ifdef TFCOMPUTE
assign afu_tlx_cdata_valid = 1'b0;
`else
assign afu_tlx_cdata_valid = afu_tlx_cdata_valid_mem_io;
`endif


reg [511:0] afu_tlx_cdata_bus_mem_io;
`ifdef TFCOMPUTE
assign afu_tlx_cdata_bus = 512'b0;  
`else
assign afu_tlx_cdata_bus =  afu_tlx_cdata_bus_mem_io;
`endif 

reg       afu_tlx_cdata_bdi_mem_io;
`ifdef TFCOMPUTE
assign afu_tlx_cdata_bdi =  1'b0;
`else
assign afu_tlx_cdata_bdi = afu_tlx_cdata_bdi_mem_io;
`endif 
	
// =====================================================================================
// Credit Management: Commands from Host to AFU and responses from AFU to Host
// =====================================================================================

// -------------------------------------------------------------------------------------
// @@@ ATCC: AFU to TLX Command Credit Manager, for commands from TLX to AFU
// -------------------------------------------------------------------------------------
// No credit manager is needed when the AFU operates on 1 command at a time.

assign afu_tlx_cmd_initial_credit = 7'b000_0000;    // Enable no commands to be presented to the AFU. CMDFIFO will manage initial credits.

// afu_tlx_cmd_credit -- AFU state machines pulse this signal when the current command is complete.

// -------------------------------------------------------------------------------------
// @@@ ATCDC: AFU to TLX Command Data Credit Manager, for command data from TLX to AFU
// -------------------------------------------------------------------------------------
// Signals do not exist, since AFU pulls FLITs from TLX using a Request+Count/Data Valid mechanism

// -------------------------------------------------------------------------------------
// @@@ TARC: TLX to AFU Response Credit manager, for responses from AFU to TLX
// -------------------------------------------------------------------------------------
reg  [3:0] tarc_consume_credit_mmw;
reg  [3:0] tarc_consume_credit_mmr;
reg  [3:0] tarc_consume_credit_opd;
wire [3:0] tarc_credits_available;
wire       tarc_credit_overflow;
wire       tarc_credit_underflow;

lpc_tlx_afu_credit_mgr #(.MSB(3)) TARC (
    .clock                ( clock                           )
  , .reset                ( reset                           )
  , .resync_credits       ( cfg_f1_octrl00_resync_credits   )
  , .tlx_initial_credit   ( tlx_afu_resp_initial_credit     )  // Number of starting credits from TLX for AFU->TLX resp
  , .tlx_credit           ( tlx_afu_resp_credit             )  // But credit return is an individual signal for each operation type
  , .afu_consume_credit_0 ( 4'b0                            )
  , .afu_consume_credit_1 ( 4'b0                            )
  , .afu_consume_credit_2 ( tarc_consume_credit_mmw         )
  , .afu_consume_credit_3 ( tarc_consume_credit_mmr         )
  , .afu_consume_credit_4 ( 4'b0                            )  
  , .afu_consume_credit_5 ( 4'b0                            )  
`ifndef TFMEMORY
  , .afu_consume_credit_6 ( tarc_consume_credit_opd         )
`else
  , .afu_consume_credit_6 ( 4'b0                            )
`endif 
  , .afu_consume_credit_7 ( 4'b0                            )
  , .afu_reclaim_credit_0 ( 4'b0                            )
  , .credits_available    ( tarc_credits_available          )
  , .credit_overflow      ( tarc_credit_overflow            )
  , .credit_underflow     ( tarc_credit_underflow           )
) ;

      
// -------------------------------------------------------------------------------------
// @@@ TARDC: TLX to AFU Response Data Credit manager, for response data from AFU to TLX
// -------------------------------------------------------------------------------------
reg  [5:0] tardc_consume_credit_mmr;
reg  [5:0] tardc_consume_credit_opd;
wire [5:0] tardc_credits_available;
wire       tardc_credit_overflow;
wire       tardc_credit_underflow;

lpc_tlx_afu_credit_mgr #(.MSB(5)) TARDC (
    .clock                ( clock                            )
  , .reset                ( reset                            )
  , .resync_credits       ( cfg_f1_octrl00_resync_credits    )
  , .tlx_initial_credit   ( tlx_afu_resp_data_initial_credit ) // Number of starting credits from TLX for AFU->TLX resp data
  , .tlx_credit           ( tlx_afu_resp_data_credit         ) // But credit return is an individual signal for each operation type
  , .afu_consume_credit_0 ( 6'b0                             )
  , .afu_consume_credit_1 ( tardc_consume_credit_mmr         )
`ifndef TFMEMORY
  , .afu_consume_credit_2 ( tardc_consume_credit_opd         )
`else
  , .afu_consume_credit_2 ( 6'b0                             )
`endif 
  , .afu_consume_credit_3 ( 6'b0                             )
  , .afu_consume_credit_4 ( 6'b0                             )
  , .afu_consume_credit_5 ( 6'b0                             )
  , .afu_consume_credit_6 ( 6'b0                             )
  , .afu_consume_credit_7 ( 6'b0                             )
  , .afu_reclaim_credit_0 ( 6'b0                             )
  , .credits_available    ( tardc_credits_available          )
  , .credit_overflow      ( tardc_credit_overflow            )
  , .credit_underflow     ( tardc_credit_underflow           )
) ;

// =====================================================================================
// Credit Management: Commands from AFU to Host and responses from Host to AFU
// =====================================================================================

// -------------------------------------------------------------------------------------
// @@@ TACC: TLX to AFU Command Credit manager, for commands from AFU to TLX
// -------------------------------------------------------------------------------------
reg  [3:0] tacc_consume_credit_irq1;   // Interrupt Request
reg  [3:0] tacc_consume_credit_irq2;   // Interrupt Request
reg  [3:0]  tacc_consume_credit_mem_io;   // memory cmd flit response credit
wire [3:0] tacc_credits_available;
wire       tacc_credit_overflow;
wire       tacc_credit_underflow;

lpc_tlx_afu_credit_mgr #(.MSB(3)) TACC (
    .clock                ( clock                           )
  , .reset                ( reset                           )
  , .resync_credits       ( cfg_f1_octrl00_resync_credits   )
  , .tlx_initial_credit   ( tlx_afu_cmd_initial_credit      ) // Number of starting credits from TLX for AFU->TLX cmd
  , .tlx_credit           ( tlx_afu_cmd_credit              ) // TLX pulses to tell the AFU it can send another command
  , .afu_consume_credit_0 ( tacc_consume_credit_irq1        )
  , .afu_consume_credit_1 ( tacc_consume_credit_irq2        )
`ifdef TFCOMPUTE
  , .afu_consume_credit_2 ( 4'b0                            )
`else
  , .afu_consume_credit_2 ( tacc_consume_credit_mem_io         )
`endif 
  , .afu_consume_credit_3 ( 4'b0                            )
  , .afu_consume_credit_4 ( 4'b0                            )
  , .afu_consume_credit_5 ( 4'b0                            )
  , .afu_consume_credit_6 ( 4'b0                            )
  , .afu_consume_credit_7 ( 4'b0                            )
  , .afu_reclaim_credit_0 ( 4'b0                            )
  , .credits_available    ( tacc_credits_available          )
  , .credit_overflow      ( tacc_credit_overflow            )
  , .credit_underflow     ( tacc_credit_underflow           )
) ;



// -------------------------------------------------------------------------------------
// @@@ TACDC: TLX to AFU Command Data Credit manager, for command data from AFU to TLX
// -------------------------------------------------------------------------------------
//wire [5:0] tacdc_consume_credit_irq;   // Interrupt Request -- not hooked in this design yet
wire [5:0] tacdc_credits_available;
wire       tacdc_credit_overflow;
wire       tacdc_credit_underflow;
reg [5:0]  tacdc_consume_credit_mem_io;

lpc_tlx_afu_credit_mgr #(.MSB(5)) TACDC (
    .clock                ( clock                           )
  , .reset                ( reset                           )
  , .resync_credits       ( cfg_f1_octrl00_resync_credits   )
  , .tlx_initial_credit   ( tlx_afu_cmd_data_initial_credit ) // Number of starting credits from TLX for both AFU->TLX cmd data
  , .tlx_credit           ( tlx_afu_cmd_data_credit         ) // But credit return is an individual signal for each operation type
`ifdef TFCOMPUTE
  , .afu_consume_credit_0 ( 6'b0                            )
`else
  , .afu_consume_credit_0 ( tacdc_consume_credit_mem_io        )
`endif 
  , .afu_consume_credit_1 ( 6'b0                            )
  , .afu_consume_credit_2 ( 6'b0                            )
  , .afu_consume_credit_3 ( 6'b0                            )
  , .afu_consume_credit_4 ( 6'b0                            )
  , .afu_consume_credit_5 ( 6'b0                            )
  , .afu_consume_credit_6 ( 6'b0                            )
  , .afu_consume_credit_7 ( 6'b0                            )
  , .afu_reclaim_credit_0 ( 6'b0                            )
  , .credits_available    ( tacdc_credits_available         )
  , .credit_overflow      ( tacdc_credit_overflow           )
  , .credit_underflow     ( tacdc_credit_underflow          )
) ;

// -------------------------------------------------------------------------------------
// @@@ ATRC: AFU to TLX Response Credit Manager, for responses from TLX to AFU
// -------------------------------------------------------------------------------------
assign afu_tlx_resp_initial_credit = 7'b000_0000;   //Zero as it will be hanlded by the respfifo

// afu_tlx_resp_credit  -- AFU state machines pulse this signal when the current response is complete.

// -------------------------------------------------------------------------------------
// @@@ ATRDC: AFU to TLX Response Data Credit Manager, for response data from TLX to AFU
// -------------------------------------------------------------------------------------
// Signals do not exist, since AFU pulls FLITs from TLX using a Request+Count/Data Valid mechanism

// ***************************************************************************************
// ***************************************************************************************
// @@@ Part 1: Host -> AFU Commands, AFU -> Host Responses
// ***************************************************************************************
// ***************************************************************************************

// ==============================================================================================================================
// @@@ OPD: Operation Decode - When see valid command from TLX, decode operation type as it enters the Command FIFO.
// ==============================================================================================================================
// Note: For timing reasons, decode the operation as it enters the Command FIFO rather than after it leaves. 
//       Trying to do both operation decode and dispatch in the same cycle takes too long.
// ==============================================================================================================================


// These signals are determined individually, based on the opcode
// Note: Per the OpenCAPI TL spec, NOP should be discarded at the TLX so the AFU should never see it as a valid command.
//         opd_start_nop           ; // Opcode x00                  (abbreviation NOP = NO Operation                  )
wire       opd_start_mmio_write    ; // Opcode x86 & match MMIO BAR (abbreviation MMW = MMio Write                    )
wire       opd_start_mmio_read     ; // Opcode x28 & match MMIO BAR (abbreviation MMR = MMio Read                     )
wire       opd_start_pr_wr_mem     ; // Opcode x86                  (abbreviation PWM = Partial Write Memory          )
wire       opd_start_write_mem     ; // Opcode x81                  (abbreviation FWM = Full    Write Memory          )
wire       opd_start_pr_rd_mem     ; // Opcode x28                  (abbreviation PRM = Partial Read  Memory          )
wire       opd_start_rd_mem        ; // Opcode x20                  (abbreviation FRM = Full    Read  Memory          )
wire       opd_start_write_mem_be  ; // Opcode x82                  (abbreviation WMB = Write Memory with Byte enables)  
wire [4:0] opd_start_pipe_type     ; // leftover from LPC AFU code just keeping it for lpc_cmdfifo alignment of the rest of the fields. Not used here.
                                     // Define as a vector to make it easier to pass from one pipeline stage to the next.
                                     // IMPORTANT: If these assignment change, change all 'case' statements in the pipeline logic also.

wire   opd_start_helper_mmio;        

assign opd_start_helper_mmio     = (tlx_afu_cmd_valid == 1'b1 )                                    ? 1'b1 : 1'b0;

// Note: BAR's are not valid until memory_space=1, so when =0 disable decoding as MMIO and send all partial operations to memory.
wire   opd_mmio_range_check;  // When 1, passes check so can treat the cmd as an MMIO. When 0, do not treat as MMIO regardless of other checks.
wire   opd_mem_range_check;   // When 1, passes check so can treat the cmd as a memory access. When 0, do not treat as memory access.       
assign opd_mmio_range_check = ( acs_memory_space == 1'b1 && acs_mmio_bar0[63:20] == tlx_afu_cmd_pa[63:20]  ) ? 1'b1 : 1'b0;  // 1MB MMIO space
assign opd_mem_range_check  = ( acs_memory_space == 1'b0 ||
                               (acs_memory_space == 1'b1 && acs_mmio_bar0[63:20] != tlx_afu_cmd_pa[63:20]) ) ? 1'b1 : 1'b0;

assign opd_start_mmio_write   = (opd_start_helper_mmio == 1'b1     && tlx_afu_cmd_opcode == 8'h86 && opd_mmio_range_check==1'b1) ? 1'b1 : 1'b0; 
assign opd_start_mmio_read    = (opd_start_helper_mmio == 1'b1     && tlx_afu_cmd_opcode == 8'h28 && opd_mmio_range_check==1'b1) ? 1'b1 : 1'b0; 

assign opd_start_pr_wr_mem    = ( tlx_afu_cmd_opcode == 8'h86 && opd_mem_range_check==1'b1 ) ? 1'b1 : 1'b0;
assign opd_start_write_mem    = ( tlx_afu_cmd_opcode == 8'h81 && opd_mem_range_check==1'b1 ) ? 1'b1 : 1'b0;
assign opd_start_pr_rd_mem    = ( tlx_afu_cmd_opcode == 8'h28 && opd_mem_range_check==1'b1 ) ? 1'b1 : 1'b0;
//test filter out spurious? read command.
assign opd_start_rd_mem       = ( tlx_afu_cmd_opcode == 8'h20 && opd_mem_range_check==1'b1 ) ? 1'b1 : 1'b0; 
assign opd_start_write_mem_be = ( tlx_afu_cmd_opcode == 8'h82 && opd_mem_range_check==1'b1 ) ? 1'b1 : 1'b0; 


// --- Detect fatal error conditions ---

// These conditions will log an internal error, and in turn an interrupt. They should be treated as fatal errors even though
// the AFU may or may not stop processing commands.  
// - 'detect_bad_op' will hang because there is no sequencer to issue 'cmd_complete' and move the CMD FIFO to the next command.
// - 'write_mem_DL_is_reserved' will hang because no data FLITs will be requested from the TLX, so the 'wait for data' state will hang.

wire detect_bad_op;              // Opcode is not recognized 
wire write_mem_DL_is_reserved;   // On write_mem command, DL field contains 00 which is a reserved

assign detect_bad_op = (tlx_afu_cmd_valid == 1'b1 &&  
                        !(opd_start_mmio_write | opd_start_mmio_read | opd_start_pr_wr_mem    | opd_start_write_mem | 
                          opd_start_pr_rd_mem  | opd_start_rd_mem    | opd_start_write_mem_be 
                         ) ) ? 1'b1 : 1'b0;

assign write_mem_DL_is_reserved = (opd_start_write_mem == 1'b1 && tlx_afu_cmd_dl == 2'b00) ? 1'b1 : 1'b0;

// While 'read_mem_DL_is_reserved' is an error, the read state machine will flag this with bad response code and continue.
// Since it is not a hang condition, do not include it in the MMIO 'fatal' error register
//assign read_mem_DL_is_reserved  = (opd_start_rd_mem == 1'b1 && tlx_afu_cmd_dl == 2'b00) ? 1'b1 : 1'b0;

/*
    Pipeline_locks for read and write requests. 
    These are used to protect the OR gates that push back MMIO and system memory responses.
*/
reg pipeline_lock_w;
reg pipeline_lock_r;


// #doc_1
// ==============================================================================================================================
// @@@ CFF: Command FiFo
// ==============================================================================================================================

wire [171:0] cff_cmd_in, cff_cmd_out;

assign cff_cmd_in = {   tlx_afu_cmd_opcode  //162 - 155 8 bits
                      , tlx_afu_cmd_dl 
                      , tlx_afu_cmd_pa
                      , tlx_afu_cmd_capptag  
                      , tlx_afu_cmd_pl
                      , tlx_afu_cmd_be 
                      , 3'b0                        // Pad to keep aligned hex chars, easier to debug
                      , opd_start_mmio_write 
                      , opd_start_mmio_read 
                      , opd_start_pr_wr_mem 
                      , opd_start_write_mem 
                      , opd_start_pr_rd_mem  
                      , opd_start_rd_mem      
                      , opd_start_write_mem_be  
                      , opd_start_pipe_type
                    };
  wire  [7:0] cff_cmd_opcode;
  wire  [1:0] cff_cmd_dl;
  wire [63:0] cff_cmd_pa;
  wire [15:0] cff_cmd_capptag;
  wire  [2:0] cff_cmd_pl;
  wire [63:0] cff_cmd_be;
  wire        cff_start_mmio_write  ; 
  wire        cff_start_mmio_read   ; 
  wire        cff_start_pr_wr_mem   ; 
  wire        cff_start_write_mem   ; 
  wire        cff_start_pr_rd_mem   ; 
  wire        cff_start_rd_mem      ; 
  wire        cff_start_write_mem_be;   
  wire  [4:0] cff_start_pipe_type   ; 
  wire  [2:0] cff_remove_pad        ;
  
assign {   cff_cmd_opcode
         , cff_cmd_dl
         , cff_cmd_pa
         , cff_cmd_capptag
         , cff_cmd_pl
         , cff_cmd_be 
         , cff_remove_pad
         , cff_start_mmio_write 
         , cff_start_mmio_read 
         , cff_start_pr_wr_mem 
         , cff_start_write_mem 
         , cff_start_pr_rd_mem  
         , cff_start_rd_mem      
         , cff_start_write_mem_be  
         , cff_start_pipe_type
       } = cff_cmd_out;


wire cff_cmd_valid;      // Internal version of tlx_afu_cmd_valid
wire cff_fifo_overflow;  // Added to internal error vector sent to MMIO logic
reg  cmd_dispatched;     // Pulsed to 1 when command is complete or sent into the pipeline

// Collect 'command completion' indicators from each state machine 
reg         cmd_complete_mmw;
reg         cmd_complete_mmr;
reg         cmd_complete_ldnf;

assign cmd_complete = cmd_complete_mmw |    // MMIO write
                      cmd_complete_mmr     // MMIO read
`ifndef TFMEMORY
                      | cmd_complete_ldnf    // LPC loads/stores towards the network egress fifo
`endif
                      ;
//Latch command
always @(*)
  begin
   cmd_dispatched = cmd_complete;
  end

lpc_cmdfifo #(.WIDTH(172)) CFF  (                         // Set WIDTH to combined number of TLX command interface signal that are used
    .clock             ( clock                           )   // Clock - samples & launches data on rising edge
  , .reset             ( reset                           )   // Reset - when 1 set control logic to default state
  , .resync_credits    ( cfg_f1_octrl00_resync_credits   )
  , .tlx_is_ready      ( tlx_afu_ready       )   // When 1, TLX is ready to exchange commands and responses 
  , .cmd_in            ( cff_cmd_in          )   // Vector of command signals
  , .cmd_in_valid      ( tlx_afu_cmd_valid   )   // When 1, load 'cmd_in' into the FIFO
  , .cmd_credit_to_TLX ( afu_tlx_cmd_credit  )   // When 1, there is space in the FIFO for another command
  , .cmd_dispatched    ( cmd_dispatched      )   // When 1, increment read FIFO pointer to present the next FIFO entry
  , .cmd_out           ( cff_cmd_out         )   // Command information at head of FIFO
  , .cmd_out_valid     ( cff_cmd_valid       )   // When 1, 'cmd_out' contains valid information
  , .fifo_overflow     ( cff_fifo_overflow   )   // When 1, FIFO was full when another 'cmd_valid' arrived
) ;


//adding old Data Fifo

wire ncff_cmd_in_valid;
wire ncff_cmd_in_full;

//Regs for network fifo input
reg [7:0]   ncff_cmd_opcode_in;
reg [1:0]   ncff_cmd_dl_in;
reg [15:0]  ncff_cmd_capptag_in;
reg [2:0]   ncff_cmd_pl_in;
reg [63:0]  ncff_cmd_be_in;
reg [63:0]  ncff_cmd_pa_in;
reg [156:0] ncff_cmd_in_in; 
reg         ncff_cmd_in_valid_in;


wire [7:0]   ncff_cmd_opcode;
wire [1:0]   ncff_cmd_dl;
wire [15:0]  ncff_cmd_capptag;
wire [2:0]   ncff_cmd_pl;
wire [63:0]  ncff_cmd_be;
wire [63:0]  ncff_cmd_pa;

wire [156:0] ncff_cmd_in;
wire ncff_cmd_full;

assign  ncff_cmd_opcode = ncff_cmd_opcode_in;
assign  ncff_cmd_dl = ncff_cmd_dl_in ;
assign  ncff_cmd_capptag = ncff_cmd_capptag_in ;
assign  ncff_cmd_pl = ncff_cmd_pl_in;
assign  ncff_cmd_be = ncff_cmd_be_in;
assign  ncff_cmd_pa = ncff_cmd_pa_in;
assign  ncff_cmd_in_valid = ncff_cmd_in_valid_in;

// ==============================================================================================================================
// @@@ NCFF:Network Command FiFo
// ==============================================================================================================================

//Data that need to go into the network.
assign ncff_cmd_in = {  ncff_cmd_opcode
                      , ncff_cmd_dl
                      , ncff_cmd_capptag
                      , ncff_cmd_pl
                      , ncff_cmd_be
                      , ncff_cmd_pa                   
                     };
//Signals to be sent to thymesisflow pipelines.
//wire  [5:0] nccf_net_id; 6
//wire  [7:0] ncff_cmd_opcode; 8
//wire  [1:0] ncff_cmd_dl; 2
//wire [15:0] ncff_cmd_capptag; 16
//wire  [2:0] ncff_cmd_pl; 3
//wire [63:0] ncff_cmd_be; 64
//wire [63:0] ncff_cmd_pa; 64  

// FIFO that feeds the network pipeline glue logic.
// It takes advantage of the push cycle to also convert local RA to EA based on the offset in the config registers.
`ifndef TFMEMORY
net_cmdfifo #(.WIDTH(163)) NCFF  (                
    .clock                   ( clock               )   // Clock - samples & launches data on rising edge
  , .reset                   ( reset               )   // Reset - when 1 set control logic to default state
  , .cmd_in                  ( ncff_cmd_in         )   // Vector of command signals
  , .cmd_in_valid            ( ncff_cmd_in_valid   )   // When 1, load 'cmd_in' into the FIFO
  , .cmd_full 	             ( ncff_cmd_full       )   // When 1, there is space in the FIFO to get another command
  , .cmd_dispatched          ( ncff_cmd_tready     )   // When 1, the data will be pushed in this cycle (tready)
  , .cmd_out                 ( ncff_cmd_tdata      )   // Command information at head of FIFO
  , .cmd_out_valid           ( ncff_cmd_tvalid     )   // When 1, 'cmd_out' contains valid information
  , .fifo_overflow           ( ncff_fifo_overflow  )   // When 1, FIFO was full when another 'cmd_valid' arrived
  , .thymesis_slot0_cfg_reg  ( thymesis_cfg0       )   // ThymesisFlow configuration register 0 in 
  , .thymesis_slot1_cfg_reg  ( thymesis_cfg1       )   // ThymesisFlow configuration register 1 in
  , .thymesis_slot2_cfg_reg  ( thymesis_cfg2       )   // ThymesisFlow configuration register 2 in
  , .thymesis_slot3_cfg_reg  ( thymesis_cfg3       )   // ThymesisFlow configuration register 3 in
  , .thymesis_slot4_cfg_reg  ( thymesis_cfg4       )   // ThymesisFlow configuration register 4 in
  , .thymesis_slot5_cfg_reg  ( thymesis_cfg5       )   // ThymesisFlow configuration register 5 in
  , .thymesis_slot6_cfg_reg  ( thymesis_cfg6       )   // ThymesisFlow configuration register 6 in
  , .thymesis_slot7_cfg_reg  ( thymesis_cfg7       )   // ThymesisFlow configuration register 7 in
  , .thymesis_slot8_cfg_reg  ( thymesis_cfg8       )   // ThymesisFlow configuration register 8 in
  , .thymesis_slot9_cfg_reg  ( thymesis_cfg9       )   // ThymesisFlow configuration register 9 in
  , .thymesis_slot10_cfg_reg ( thymesis_cfg10      )   // ThymesisFlow configuration register 10 in
  , .thymesis_slot11_cfg_reg ( thymesis_cfg11      )   // ThymesisFlow configuration register 11 in

);

//AXI-S output for data fifo.
//datafifo sent is like Tready
//Register this interface spending a cycle to meet timing.

assign cmddata_fifo_tvalid = tlx_afu_cmd_data_valid & ~pipeline_lock_w & cmddata_fifo_tready;
//Command data out
assign  cmddata_fifo_tdata =  {tlx_afu_cmd_data_bdi,tlx_afu_cmd_data_bus};
`endif

// ==============================================================================================================================
// @@@ DIS: Dispatch an operation - When see valid command from Command FIFO, start appropriate command state machine.
// ==============================================================================================================================

// These conditions must be met to start processing a command:
// a) The TLX must indicate it is ready (the CMD FIFO handles this condition)
// b) The TLX must present a valid command indicator
// c) The opcode must decode to a supported command, targeting the right BAR region where appropriate.
wire        start_mmio_write  ; 
wire        start_mmio_read   ; 
wire        start_pr_wr_mem   ; 
wire        start_write_mem   ; 
wire        start_pr_rd_mem   ; 
wire        start_rd_mem      ; 
wire        start_write_mem_be;   
wire  [4:0] start_pipe_type   ; 

`ifdef MARK_DEBUG_ACTIVE_NET (* mark_debug = "TRUE" *) `endif
reg       pipe_is_locked;     // When 1, no command is in the pipeline
assign start_mmio_write   = (cff_cmd_valid == 1'b1 ) ? cff_start_mmio_write   : 1'b0;
assign start_mmio_read    = (cff_cmd_valid == 1'b1 ) ? cff_start_mmio_read    : 1'b0;
assign start_pr_wr_mem    = (cff_cmd_valid == 1'b1 ) ? cff_start_pr_wr_mem    : 1'b0;
assign start_write_mem    = (cff_cmd_valid == 1'b1 ) ? cff_start_write_mem    : 1'b0;
assign start_pr_rd_mem    = (cff_cmd_valid == 1'b1 ) ? cff_start_pr_rd_mem    : 1'b0;
assign start_rd_mem       = (cff_cmd_valid == 1'b1 ) ? cff_start_rd_mem       : 1'b0;
assign start_write_mem_be = (cff_cmd_valid == 1'b1 ) ? cff_start_write_mem_be : 1'b0;
assign start_pipe_type    = (cff_cmd_valid == 1'b1 ) ? cff_start_pipe_type    : 5'b00000;

// Manage response buffer credits

reg        rff_resp_sent;      
reg  [5:0] rffcr_consume_credit;
wire [5:0] rffcr_buffers_available;
wire       rffcr_credit_overflow;
wire       rffcr_credit_underflow;

// ==============================================================================================================================
// @@@ RFF: Response FiFo for pipelined operations
// ==============================================================================================================================
wire [549:0] rff_resp_out;

wire   [7:0] rff_out_resp_opcode;
wire   [3:0] rff_out_resp_code;
wire   [1:0] rff_out_resp_dl;
wire   [1:0] rff_out_resp_dp;
wire  [15:0] rff_out_resp_capptag;
wire         rff_out_resp_valid;
wire [511:0] rff_out_rdata;
wire         rff_out_bdi;
wire         rff_out_rdata_valid;
wire   [1:0] rff_out_num_flits;
wire         rff_out_pad;

assign {
    rff_out_resp_valid 
  , rff_out_rdata_valid
  , rff_out_resp_opcode
  , rff_out_resp_code
  , rff_out_resp_dl
  , rff_out_resp_dp
  , rff_out_resp_capptag
  , rff_out_bdi
  , rff_out_pad                 // Pad bit to make simulation output easier to read
  , rff_out_num_flits
  , rff_out_rdata 
  } = rff_resp_out;

wire rff_fifo_overflow;  
wire [4:0] rff_buffers_available;   // For information only, rffcr_buffers_available is used to determine space available 
wire rff_resp_valid;
wire rff_resp_next_valid;

`ifndef TFMEMORY
rmem_respfifo #(.WIDTH(550)) RFF  (                      // Set WIDTH to combined number of response & response data signals that are used
    .clock                  ( clock                 )   // Clock - samples & launches data on rising edge
  , .reset                  ( reset                 )   // Reset - when 1 set control logic to default state
  , .resp_in                ( rff_resp_in_tdata     )   // Vector of response signals
  , .resp_in_valid          ( rff_resp_in_tvalid     )   // When 1, load 'resp_in' into the FIFO
  , .resp_buffers_available ( rff_buffers_available )   // When >0, there is space in the FIFO for another command
  , .resp_fifo_full         ( rff_resp_in_tready    )   // When 0, fifo is full  
  , .resp_sent              ( rff_resp_sent         )   // When 1, increment read FIFO pointer to present the next FIFO entry
  , .resp_out               ( rff_resp_out          )   // Response information at head of FIFO
  , .resp_out_valid         ( rff_resp_valid        )   // When 1, 'resp_out' contains valid information
  , .resp_out_next_valid    ( rff_resp_next_valid   )
  , .fifo_overflow          ( rff_fifo_overflow     )   // When 1, FIFO was full when another 'resp_valid' arrived
) ;


// As response and response data credits become available, flow queued information out to TLX.
// The assumption is the response at the head of the FIFO will be one of these formats:
// 1) Response only, no data                      (resp_valid = 1, rdata_valid = 0)
// 2) Response with 1 FLIT of data                (resp_valid = 1, rdata_valid = 1)
// 3) Continuing FLITs of a response in progress  (resp_valid = 0, rdata_valid = 1)
// 4) No response to send                         (resp_valid = 0, rdata_valid = 0)
wire [2:0] rff_converted_num_flits;   
assign rff_converted_num_flits = {1'b0,rff_out_num_flits};// + 3'b001;  // num_flits = 00 to 11, so add 1 before compare 

always @(*)  
  if ( rff_resp_valid     == 1'b1                  &&  // If the array hasn't been written yet, individual valids may be X so qualify with solid signal
       rff_out_resp_valid == 1'b1                  &&  // A response (with or without data) is waiting to be sent, and
       (tarc_credits_available  >= 4'h1)           &&  // 
       (pipe_is_locked     == 1'b0)                &&  // remote memory pipeline is not locked.
       ((rff_out_rdata_valid == 1'b0) ||                // There is no data with this response
       ((tardc_credits_available >= 6'h2) && (rff_resp_next_valid == 1'b1))) // OR there are enough data credits for the entire response and entire response is in fifo
     )
    begin    
      afu_tlx_resp_opcode_lpc_io  = rff_out_resp_opcode;      // Send Response                
      afu_tlx_resp_dl_lpc_io      = rff_out_resp_dl;      
      afu_tlx_resp_dp_lpc_io      = rff_out_resp_dp;       
      afu_tlx_resp_capptag_lpc_io = rff_out_resp_capptag; 
      afu_tlx_resp_code_lpc_io    = rff_out_resp_code; 
      afu_tlx_resp_valid_lpc_io   = rff_out_resp_valid;                
      tarc_consume_credit_opd     = 4'b0001;                   // Consume a response credit
      if (rff_out_rdata_valid == 1'b1)
        begin
          afu_tlx_rdata_bus_lpc_io    = rff_out_rdata;        // Send Response Data 
          afu_tlx_rdata_bdi_lpc_io    = rff_out_bdi;                            
          afu_tlx_rdata_valid_lpc_io  = rff_out_rdata_valid;  
          tardc_consume_credit_opd    = 6'b00001;             // Consume a response data credit for this data FLIT
        end
      else
        begin
          afu_tlx_rdata_bus_lpc_io    = 512'b0;               // No Response Data 
          afu_tlx_rdata_bdi_lpc_io    = 1'b0;                            
          afu_tlx_rdata_valid_lpc_io  = 1'b0;  
          tardc_consume_credit_opd    = 6'b00000;
        end
      rff_resp_sent            = 1'b1;                     // Advance the FIFO
    end
  else if (rff_resp_valid     == 1'b1             &&  // If the array hasn't been written yet, individual valids may be X so qualify with solid signal
           rff_out_resp_valid == 1'b0             &&  // There is no response waiting, 
           rff_out_rdata_valid == 1'b1            && 
           (tardc_credits_available >= 6'h1))   // There are credits to send the response initial
    begin
      afu_tlx_resp_opcode_lpc_io  = 8'b0;                // No Response (OR inputs must be 0)                
      afu_tlx_resp_dl_lpc_io      = 2'b0;      
      afu_tlx_resp_dp_lpc_io      = 2'b0;       
      afu_tlx_resp_capptag_lpc_io = 16'b0; 
      afu_tlx_resp_code_lpc_io    = 4'b0; 
      afu_tlx_resp_valid_lpc_io   = 1'b0;                
      tarc_consume_credit_opd     = 4'b0000;              // Do not consume a response credit
      afu_tlx_rdata_bus_lpc_io    = rff_out_rdata;       // Send Response Data 
      afu_tlx_rdata_bdi_lpc_io    = rff_out_bdi;
      afu_tlx_rdata_valid_lpc_io  = rff_out_rdata_valid;
      tardc_consume_credit_opd    = 6'b000001;            // Consume a response data credit for this data FLIT
      rff_resp_sent               = 1'b1;                // Advance the FIFO
    end 
  else                                                // RFF output is not valid, no resp is pending, or there are not enough credits from TLX to send it
    begin
      afu_tlx_resp_opcode_lpc_io  = 8'b0;                // No Response (OR inputs must be 0)                
      afu_tlx_resp_dl_lpc_io      = 2'b0;      
      afu_tlx_resp_dp_lpc_io      = 2'b0;       
      afu_tlx_resp_capptag_lpc_io = 16'b0; 
      afu_tlx_resp_code_lpc_io    = 4'b0; 
      afu_tlx_resp_valid_lpc_io   = 1'b0;                
      tarc_consume_credit_opd     = 4'b0;                // Do not consume a response credit
      afu_tlx_rdata_bus_lpc_io    = 512'b0;              // No Response Data 
      afu_tlx_rdata_bdi_lpc_io    = 1'b0;
      afu_tlx_rdata_valid_lpc_io  = 1'b0; 
      tardc_consume_credit_opd    = 6'b0;                // Do not consume a response data credit
      rff_resp_sent               = 1'b0;                // Hold the FIFO
    end                                         
`endif

// Indicate when the pipeline is completely empty
// Synchronizing MMIO and lpc memory  responses 

assign pipeline_lock = 1'b0; 

wire pipeline_lock_req;

assign pipeline_lock_req = (pipeline_lock_w | pipeline_lock_r);

always @(posedge(clock))
  if (reset == 1'b1) 
    begin
           pipe_is_locked <= 1'b0;
    end 
  else if ( rff_resp_valid     == 1'b1                  &&  // If the array hasn't been written yet, individual valids may be X so qualify with solid signal
            rff_out_resp_valid == 1'b1                  &&  // A response (with or without data) is waiting to be sent, and
            (tarc_credits_available  >= 4'h1)           &&  // 
            (pipe_is_locked == 1'b0)                    &&  // remote memory pipeline is not locked.
            ((rff_out_rdata_valid == 1'b0) ||                // There is no data with this response
            ((tardc_credits_available >= 6'h2) && (rff_resp_next_valid == 1'b1))) // OR there are enough data credits for the entire response and entire response is in fifo
          )
       begin
            //The combinational logic that unloads lpc_respfifo will feed the afu_tlx response bus with flits in this cycle. 
            //In case current response does not have data then we can stop the remote response flow in the next cycle.
            pipe_is_locked <= ~rff_out_rdata_valid & pipeline_lock_req;  
       end
  else 
       begin
            pipe_is_locked <= pipeline_lock_req; //if pipe_is_locked=0 in this cycle cmd data get pulled it will be the end of cmd in the next for 128B commands.
                                                 //if pipe_is_locked=0 no response on lpc_respfifo then next cycle we can lock
                                                 //if pipe_is_locked=1 then in the next cycle we will ultimately unlock when the _req is deasserted. 
       end 


// ==============================================================================================================================
// @@@ BDF: Bus / Device Function
// ==============================================================================================================================

assign afu_tlx_cmd_bdf_int = {cfg_afu_bdf_bus, cfg_afu_bdf_device, cfg_afu_bdf_function};   // Internal use version of BDF


// ==============================================================================================================================
// @@@ MMW: Command State Machine - MMIO Write (pr_wr_mem to MMIO BAR space)
// ==============================================================================================================================

// 1) Select the correct 8B of data to send to MMIO registers from the 64B flit

// To improve timing closure, select the data all the time and let the MMIO write state machine determine when to pass it to the MMIO regs.
// In a testbench, byte alignment can be done simplier using the shift operator, i.e. data << ({addr[5:3],3'b000}*8)
// But since this will be synthesized into hardware, use an explicit MUX structure. It is more verbose, but may synthesize & place better.
// The intent here is to extract the proper 8 Bytes, address bits [2:0] come into play within the MMIO regs to select the correct byte field(s).
reg  [63:0] mmw_data_to_mmio_regs;
always @(*)  // Combinational logic
  case ( cff_cmd_pa[5:3] )        
    3'b000:  mmw_data_to_mmio_regs = tlx_afu_cmd_data_bus[ 63:  0];
    3'b001:  mmw_data_to_mmio_regs = tlx_afu_cmd_data_bus[127: 64];
    3'b010:  mmw_data_to_mmio_regs = tlx_afu_cmd_data_bus[191:128];
    3'b011:  mmw_data_to_mmio_regs = tlx_afu_cmd_data_bus[255:192];
    3'b100:  mmw_data_to_mmio_regs = tlx_afu_cmd_data_bus[319:256];
    3'b101:  mmw_data_to_mmio_regs = tlx_afu_cmd_data_bus[383:320];
    3'b110:  mmw_data_to_mmio_regs = tlx_afu_cmd_data_bus[447:384];
    3'b111:  mmw_data_to_mmio_regs = tlx_afu_cmd_data_bus[511:448];
    default: mmw_data_to_mmio_regs = 64'hBADDBADD_BADDBADD;    // Short for 'BAD Data, BAD Data'
  endcase 

// 2) State Machine for MMio Write (MMW)

reg [2:0]  SM_MMW;                
parameter  SM_MMW_IDLE              = 3'b000;
parameter  SM_MMW_WAIT_FOR_DATA     = 3'b001;
parameter  SM_MMW_WAIT_FOR_MREG1    = 3'b010;
parameter  SM_MMW_WAIT_FOR_MREG2    = 3'b011;
parameter  SM_MMW_WAIT_FOR_MREG3    = 3'b100;
parameter  SM_MMW_WAIT_FOR_RESP_CR  = 3'b101;   // Wait for Response Credits to be available
parameter  SM_MMW_WAIT_FOR_NEXT_CMD = 3'b110;
parameter  SM_MMW_ERROR             = 3'b111;   

// Behavior to perform in each state

// IDLE: In this state, we're just waiting for a MMIO write (pr_wr_mem) command to appear from the TLX. 
//       When it does, request the write data from the TLX, which in this case will be a single 64B flit.
//       Note: For synthesis purposes, break this into a combinational and clocked section.
//
always @(*)    // Combinational  if (SM_MMW == SM_MMW_IDLE)  // Note: This qualifying condition is redundant until the LPC starts handling pipelined commands.
    if (SM_MMW == SM_MMW_IDLE)                         //       But use it as a precaution to prevent a second command from being started if one is being processed.
    begin                             
      if (start_mmio_write == 1'b1 && pipe_is_locked == 1'b1)                 // Request data in the same cycle as seeing cmd_valid to improve performance.
        begin
          afu_tlx_cmd_rd_req_mmw = 1'b1;           // Request single flit from TLX
          afu_tlx_cmd_rd_cnt_mmw = 3'b001;    
        end
      else                                          
        begin                                       // Execute this code block when in IDLE but no MMIO write command is going on 
          afu_tlx_cmd_rd_req_mmw = 1'b0;           // Always set to 0 when not in use to not influence OR gate driving to TLX
          afu_tlx_cmd_rd_cnt_mmw = 3'b000;     
        end
    end
  else                                              // In the middle of a MMIO write, but not in the IDLE state
    begin
      afu_tlx_cmd_rd_req_mmw = 1'b0;               // Set to 0 to not request any more data from TLX
      afu_tlx_cmd_rd_cnt_mmw = 3'b000;    
    end
// Above is equivalent to:
// assign afu_tlx_cmd_rd_req_mmw = (SM_MMW == SM_MMW_IDLE && start_mmio_write == 1'b1) ? 1'b1   : 1'b0  ;  // Request flit from TLX
// assign afu_tlx_cmd_rd_cnt_mmw = (SM_MMW == SM_MMW_IDLE && start_mmio_write == 1'b1) ? 3'b001 : 3'b000;  // Only 1 flit requested
//
reg   [2:0] mmw_pl;    
reg  [15:0] mmw_capptag;
reg  [63:0] mmw_addr; 
always @(posedge(clock))     // Use registers to hold command information while this command is being processed
  if (SM_MMW == SM_MMW_IDLE) 
    begin
      mmw_pl                 <= cff_cmd_pl;           // Latch copies for use later 
      mmw_capptag            <= cff_cmd_capptag;  
      mmw_addr               <= cff_cmd_pa;
    end
  else
    begin
      mmw_pl                 <= mmw_pl;               // Hold values so state machines below can use contents
      mmw_capptag            <= mmw_capptag;
      mmw_addr               <= mmw_addr;
    end


// WAIT_FOR_DATA: In this state, we're waiting for the TLX to present data. 
//                When it does, send the selected 8 Bytes to the MMIO regs, along with a write strobe of the correct size.
reg  mmw_data_bdi;
always @(posedge(clock))  
  if (SM_MMW == SM_MMW_WAIT_FOR_DATA)
    begin
      if (tlx_afu_cmd_data_valid == 1'b1)
        begin
          mmw_data_bdi     <= tlx_afu_cmd_data_bdi;  // Save Bad Data Indicator
          mmio_addr_mmw    <= mmw_addr[19:0];        // Send address, write strobe, and write data to MMIO regs
          mmio_wdata       <= mmw_data_to_mmio_regs;
          if (tlx_afu_cmd_data_bdi == 1'b0 && mmw_pl == 3'b000) mmio_wr_1B <= 1'b1; else mmio_wr_1B <= 1'b0;
          if (tlx_afu_cmd_data_bdi == 1'b0 && mmw_pl == 3'b001) mmio_wr_2B <= 1'b1; else mmio_wr_2B <= 1'b0;
          if (tlx_afu_cmd_data_bdi == 1'b0 && mmw_pl == 3'b010) mmio_wr_4B <= 1'b1; else mmio_wr_4B <= 1'b0;
          if (tlx_afu_cmd_data_bdi == 1'b0 && mmw_pl == 3'b011) mmio_wr_8B <= 1'b1; else mmio_wr_8B <= 1'b0;
          // if (mmw_pl <> 1,2,4,8), then no write strobe will be issued to MMIO regs. The check on legal pL is done in response generation.
        end
      else
        begin
          mmw_data_bdi  <= mmw_data_bdi;   // Keep for use in generating response
          mmio_addr_mmw <= 20'b0;   // To prevent unnecessary register switching in MMIO regs, tie write inputs to 0 while not in use
          mmio_wdata    <= 64'b0;  
          mmio_wr_1B    <= 1'b0;    // Set write controls inactive when not in use
          mmio_wr_2B    <= 1'b0;
          mmio_wr_4B    <= 1'b0;
          mmio_wr_8B    <= 1'b0;
        end
    end
  else
    begin
      mmw_data_bdi     <= mmw_data_bdi;
      mmio_addr_mmw    <= 20'b0;   // To prevent unnecessary register switching in ACS, tie write inputs to 0 while not in use
      mmio_wdata       <= 64'b0;
      mmio_wr_1B       <= 1'b0;    // Set write controls inactive when not in use
      mmio_wr_2B       <= 1'b0;
      mmio_wr_4B       <= 1'b0;
      mmio_wr_8B       <= 1'b0;
    end


// WAIT_FOR_MREG1: The MMIO regs take 2 cycles to process the write. This state absorbs the first cycle.
//                 From a behavior standpoint, there is nothing to do. 

// WAIT_FOR_MREG2: The MMIO regs take 2 cycles to process the write. This state absorbs the first cycle.
//                 From a behavior standpoint, there is nothing to do. 

// WAIT_FOR_MREG3: In this state, look for an error indicator from the MMIO regs. 
//                 In a high performance application where latency on MMIO operations is critical,
//                 it may be possible (timing closure permitting) to determine and present the response
//                 in the same cycle that the error indicator is present. In this case:
//                   If at least 1 response credit is available:
//                   - Present one of two responses to the TLX using resp_valid. 
//                   --- If no error is present, issue mem_wr_response
//                   --- If    error is present, issue mem_wr_fail
//                   - Issue command credit to the TLX in order to receive the next command. 
//                   - Operation is complete, jump to IDLE.
//                   If no response credits are available:
//                   - Enter state that waits for response credits.
//                   - Save the response from the MMIO regs so the wait state can use it later to determine the response type.
//                 However implemention of this could be messy. For this design which intends to be a reference
//                 model so should be as understandable as possible, and does not have critical latency requirements
//                 on MMIO operations, it was decided to spend another cycle and always use another state
//                 to manage the presence or absense of response credits. In this case:
//                   - Prepare one of two responses to the TLX. 
//                   --- If no error is present, prepare mem_wr_response
//                   --- If    error is present, prepare mem_wr_fail
//                   - Jump to WAIT_FOR_RESP_CR.
//                 The next state will check for the presense of response credits and wait for one if none are available.
//                 It will also issue the command credit before ending the operation and returning to IDLE.

// Helper signal: set mmw_legal_size to 1 if requested operation was 1, 2, 4, or 8 Bytes in size
wire   mmw_legal_size;
assign mmw_legal_size = (mmw_pl == 3'b000 || mmw_pl == 3'b001 || mmw_pl == 3'b010 || mmw_pl == 3'b011) ? 1'b1 : 1'b0;

reg  [7:0] mmw_resp_opcode;
reg  [1:0] mmw_resp_dl;
reg  [1:0] mmw_resp_dp;
reg  [3:0] mmw_resp_code;
always @(posedge(clock))  
  if (SM_MMW == SM_MMW_WAIT_FOR_MREG3)
    begin
      if (mmw_data_bdi == 1'b1 || mmio_addr_not_implemented == 1'b1 || mmw_legal_size == 1'b0 || mmio_bad_op_or_align == 1'b1)
        begin
          mmw_resp_opcode  <= 8'h05;     // mem_wr_fail
          mmw_resp_dl      <= 2'b01;     // dL doesn't exist in command, set to 1 FLIT
          mmw_resp_dp      <= 2'b00;     // All FLITs covered by response, so start at 0
          if (mmw_data_bdi == 1'b1)
            begin
              mmw_resp_code      <= 4'h8;      // Data received was marked bad
              ery_src02[111:108] <= 4'h8;
            end
          else if (mmio_addr_not_implemented == 1'b1)
            begin
              mmw_resp_code      <= 4'hE;      // Access to un-implemented address in BAR range, use general fail code
              ery_src02[111:108] <= 4'hE;
            end
          else if (mmw_legal_size == 1'b0)
            begin
              mmw_resp_code      <= 4'h9;      // Length is not legal, report unsupported size error
              ery_src02[111:108] <= 4'h9;
            end
          else
            begin
              mmw_resp_code      <= 4'hB;      // Length was legal, so must be address alignment error
              ery_src02[111:108] <= 4'hB;
            end
          // Save error information which triggers interrupt
          ery_loadsrc[2]     <= 1'b1;          // source 2 = config_read state machine
          ery_src02[127:112] <= 16'h0004;      // source 2 = config_read state machine
          ery_src02[    107] <= mmw_data_bdi;
          ery_src02[106: 87] <= 20'b0;
          ery_src02[ 86: 84] <= mmw_pl;
          ery_src02[ 83: 82] <= 2'b0;
          ery_src02[ 81: 80] <= 2'b01;         // dL doesn't exist in command, set to 1 FLIT
          ery_src02[ 79: 64] <= mmw_capptag;
          ery_src02[ 63:  0] <= mmw_addr;
        end
      else                               // Operation was a success
        begin
          mmw_resp_opcode  <= 8'h04;     // mem_wr_response
          mmw_resp_dl      <= 2'b01;     // dL doesn't exist in command, set to 1 FLIT
          mmw_resp_dp      <= 2'b00;     // All FLITs covered by response, so start at 0
          mmw_resp_code    <= 4'h0;      // Not used with mem_wr_response
          ery_loadsrc[2]   <= 1'b0;      // No error information saved
          ery_src02        <= 128'b0;
        end
    end  
  else
    begin
       mmw_resp_opcode  <= mmw_resp_opcode;   // Hold values so state machines below can use contents
       mmw_resp_dl      <= mmw_resp_dl;      
       mmw_resp_dp      <= mmw_resp_dp;       
       mmw_resp_code    <= mmw_resp_code;       
       ery_loadsrc[2]   <= 1'b0;              // If error load was set by this state, clear the strobe when leave it
       ery_src02        <= 128'b0;
    end


//WAIT_FOR_RESP_CR: This state checks that response credits are available to present the response to the TLX.
//                  If one is available, do the following right away. If none are present, wait for one to
//                  show up then do the following.
//                  - Present the saved response to the TLX using resp_valid. 
//                  - Issue command credit to the TLX in order to receive the next command. 
//                  - Operation is complete, jump to IDLE.
always @(posedge(clock))  
  if (SM_MMW == SM_MMW_WAIT_FOR_RESP_CR)
    begin
      afu_tlx_resp_opcode_mmw  <= mmw_resp_opcode; // Put response on TLX interface, but might not trigger with resp_valid yet   
      afu_tlx_resp_dl_mmw      <= mmw_resp_dl;       
      afu_tlx_resp_dp_mmw      <= mmw_resp_dp;       
      afu_tlx_resp_capptag_mmw <= mmw_capptag;     // Use saved tag from command
      afu_tlx_resp_code_mmw    <= mmw_resp_code;   
      if (tarc_credits_available >= 4'b0001 )
        begin
          afu_tlx_resp_valid_mmw  <= 1'b1;         // Present response to TLX
          cmd_complete_mmw        <= 1'b1;         // Issue credit to TLX to get next cmd
          tarc_consume_credit_mmw <= 4'b0001;      // TLX consumes a credit with resp_valid, so echo that in credit counter
        end
      else                                         // Wait for response credit to show up
        begin
          afu_tlx_resp_valid_mmw  <= 1'b0;         // Do not issue resp_valid yet
          cmd_complete_mmw        <= 1'b0;         // Do not issue credit to TLX to get next cmd yet
          tarc_consume_credit_mmw <= 4'b0;       // Do not consume TLX credit yet
        end
    end  
  else
    begin
       afu_tlx_resp_valid_mmw   <= 1'b0;   // Clear OR inputs when not in this state 
       afu_tlx_resp_opcode_mmw  <= 8'b0;        
       afu_tlx_resp_dl_mmw      <= 2'b0;      
       afu_tlx_resp_dp_mmw      <= 2'b0;       
       afu_tlx_resp_capptag_mmw <= 16'b0; 
       afu_tlx_resp_code_mmw    <= 4'b0;       
       cmd_complete_mmw         <= 1'b0;   
       tarc_consume_credit_mmw  <= 4'b0;
    end


// WAIT_FOR_NEXT_CMD: Nothing to do in this state. It is required to allow the CMD FIFO time to present the next command.
//                    It is needed because 'cmd_complete' doesn't appear until the cycle after WAIT_FOR_RESP_CR. 
//                    There is no way to predictively send 'cmd_complete' in the cycle before to eliminate the need
//                    for this state, because it could stay in WAIT_FOR_RESP_CR indefinitely depending on when the TLX
//                    returns response credits. 


// ERROR: If this state is entered, something went wrong. For instance, a soft error might put the state machine into
//        an illegal state. Because this is a test design, don't try to recover and proceed but instead
//        lock up in this state so the user knows there is an error to go find and fix.

// Introducing pipeline_lock handling that effectively quiesces thymesisflow pipelines 
//and prevents them from concurrently mastering responses back to TLX. 

// Determine next state
always @(posedge(clock))
  if (reset == 1'b1) 
   begin
      SM_MMW <= SM_MMW_IDLE;
      pipeline_lock_w <= 1'b0;
   end  
  else 
    case (SM_MMW)
      SM_MMW_IDLE:            
          if (start_mmio_write == 1'b1 && pipe_is_locked == 1'b1) 
           begin
             SM_MMW <= SM_MMW_WAIT_FOR_DATA;
             pipeline_lock_w <= 1'b1;
           end
          else if ((start_mmio_write == 1'b1) && (pipe_is_locked == 1'b0)) 
           begin
             SM_MMW <= SM_MMW_IDLE;
             pipeline_lock_w <= 1'b1;
           end
          else
           begin 
             SM_MMW <= SM_MMW_IDLE;
             pipeline_lock_w <= 1'b0;
           end             
      SM_MMW_WAIT_FOR_DATA:
          if (tlx_afu_cmd_data_valid == 1'b1)  
           begin
             SM_MMW <= SM_MMW_WAIT_FOR_MREG1;
             pipeline_lock_w <= 1'b1; 
           end
          else
            begin 
             SM_MMW <= SM_MMW_WAIT_FOR_DATA;
             pipeline_lock_w <= 1'b1;
            end 
      SM_MMW_WAIT_FOR_MREG1:
            begin
              SM_MMW <= SM_MMW_WAIT_FOR_MREG2;
              pipeline_lock_w <= 1'b1;             
            end 
      SM_MMW_WAIT_FOR_MREG2:
            begin
              SM_MMW <= SM_MMW_WAIT_FOR_MREG3;
              pipeline_lock_w <= 1'b1;
            end   
      SM_MMW_WAIT_FOR_MREG3:
            begin
              SM_MMW <= SM_MMW_WAIT_FOR_RESP_CR;
              pipeline_lock_w <= 1'b1; 
            end                                     
      SM_MMW_WAIT_FOR_RESP_CR:
          if (tarc_credits_available >= 4'b0001)
             begin 
               SM_MMW <= SM_MMW_WAIT_FOR_NEXT_CMD;
               pipeline_lock_w <= 1'b1; 
             end 
          else
             begin   
               SM_MMW <= SM_MMW_WAIT_FOR_RESP_CR;
               pipeline_lock_w <= 1'b1; 
             end 
      SM_MMW_WAIT_FOR_NEXT_CMD:
            begin 
              SM_MMW <= SM_MMW_IDLE;
              pipeline_lock_w <= 1'b1; 
            end 
      SM_MMW_ERROR:
            begin
              SM_MMW <= SM_MMW_ERROR;
              pipeline_lock_w <= 1'b0; 
            end 
      default:
           begin
             SM_MMW <= SM_MMW_ERROR;
             pipeline_lock_w <= 1'b0; 
           end 
    endcase
    
// ==============================================================================================================================
// @@@ MMR: Command State Machine - MMIO Read (pr_rd_mem from MMIO BAR space)
// ==============================================================================================================================

// State Machine for MMIO Read (MMR)
reg [2:0]  SM_MMR;                
parameter  SM_MMR_IDLE              = 3'b000;
parameter  SM_MMR_WAIT_FOR_MREG1    = 3'b001;
parameter  SM_MMR_WAIT_FOR_MREG2    = 3'b010;
parameter  SM_MMR_WAIT_FOR_RESP_CR  = 3'b011;   // Wait for Response Credits to be available
parameter  SM_MMR_WAIT_FOR_NEXT_CMD = 3'b100;
parameter  SM_MMR_ERROR             = 3'b111;   

// Behavior to perform in each state

// IDLE: In this state, we're just waiting for a MMIO read command to appear from the TLX. 
//       When it does, capture and hold some field values that need to be returned in the response.
//       Note: For synthesis purposes, break this into a combinational and clocked section.
//
// Because the TLX presents latched data and MMIO regs latch it upon receipt, it should make timing to present 
// the read address and strobe in the same cycle as the command is decoded.
always @(*)   // Combinational 
  if (SM_MMR == SM_MMR_IDLE && start_mmio_read == 1'b1 && pipe_is_locked == 1'b1)
    begin                                     
      mmio_addr_mmr = cff_cmd_pa[19:0];  // Send address, read strobe, and write data to MMIO regs
      mmio_rd       = 1'b1;
    end
  else
    begin
      mmio_addr_mmr = 20'b0;         // To prevent unnecessary register switching in MMIO regs, tie write inputs to 0 while not in use
      mmio_rd       = 1'b0;          // Set read controls inactive when not in use
    end
// Above is equivalent to:
//
reg   [2:0] mmr_pl; 
reg  [15:0] mmr_capptag; 
reg  [63:0] mmr_addr;
always @(posedge(clock))     // Use registers to hold command information while this command is being processed
  if (SM_MMR == SM_MMR_IDLE) 
    begin
      mmr_pl          <= cff_cmd_pl;                // Latch copies for use later 
      mmr_capptag     <= cff_cmd_capptag;  
      mmr_addr        <= cff_cmd_pa;
    end
  else
    begin
      mmr_pl          <= mmr_pl;                    // Hold values so state machines below can use contents
      mmr_capptag     <= mmr_capptag;
      mmr_addr        <= mmr_addr;
    end


// WAIT_FOR_MREG1: MMIO regs take 2 cycles to process the read. This state absorbs the first cycle.
//                 From a behavior standpoint, there is nothing to do. 


// WAIT_FOR_MREG2: In this state, look for data or an error indicator from the MMIO regs. 
//                 In a high performance application where latency on MMIO operations is critical,
//                 it may be possible (timing closure permitting) to determine and present the response and response data
//                 in the same cycle that the error indicator is present. In this case:
//                   If at least 1 response credit is available:
//                   - Present one of two responses to the TLX using resp_valid. 
//                   --- If no error is present, issue mem_rd_response
//                   --- If    error is present, issue mem_rd_fail
//                   - Issue command credit to the TLX in order to receive the next command. 
//                   - Operation is complete, jump to IDLE.
//                   If no response credits are available:
//                   - Enter state that waits for response credits.
//                   - Save the response from the MMIO regs so the wait state can use it later to determine the response type.
//                 However implemention of this could be messy. For this design which intends to be a reference
//                 model so should be as understandable as possible, and does not have critical latency requirements
//                 on MMIO operations, it was decided to spend another cycle and always use another state
//                 to manage the presence or absense of response credits. In this case:
//                   - Prepare one of two responses to the TLX. 
//                   --- If no error is present, prepare mem_rd_response
//                   --- If    error is present, prepare mem_rd_fail
//                   - Jump to WAIT_FOR_RESP_CR.
//                 The next state will check for the presense of response credits and wait for one if none are available.
//                 It will also issue the command credit before ending the operation and returning to IDLE.

// Helper signal: set mmr_legal_size to 1 if requested operation was 1, 2, 4, or 8 Bytes in size
wire   mmr_legal_size;
assign mmr_legal_size = (mmr_pl == 3'b000 || mmr_pl == 3'b001 || mmr_pl == 3'b010 || mmr_pl == 3'b011) ? 1'b1 : 1'b0;

reg [63:0] mmr_rdata;
reg  [7:0] mmr_resp_opcode;
reg  [1:0] mmr_resp_dl;
reg  [1:0] mmr_resp_dp;
reg  [3:0] mmr_resp_code;
reg        mmr_rdata_bdi;
reg        mmr_rdata_valid;
always @(posedge(clock))  
  if (SM_MMR == SM_MMR_WAIT_FOR_MREG2)
    begin
      mmr_rdata <= mmio_rdata;           // Capture data from MMIO regs
      if (mmio_addr_not_implemented == 1'b1 || mmr_legal_size == 1'b0 || mmio_bad_op_or_align == 1'b1 ||  
          (mmio_bad_op_or_align == 1'b0 && mmio_addr_not_implemented == 1'b0 && mmio_rdata_vld == 1'b0) )
        begin                            // Error if unimplemented addr, bad alignment, illegal size, or data is not valid while no error present
          mmr_resp_opcode  <= 8'h02;     // mem_rd_fail 
          mmr_resp_dl      <= 2'b01;     // dL doesn't exist in command, set to 1 FLIT
          mmr_resp_dp      <= 2'b00;     // All FLITs covered by response, so start at 0
          mmr_rdata_bdi    <= 1'b0;      // fail response has no data associated with it
          mmr_rdata_valid  <= 1'b0;      // Set to 0 so fail response will not have valid data with it
          if (mmio_addr_not_implemented == 1'b1)
            begin
              mmr_resp_code      <= 4'hE;  // Access to un-implemented address in BAR range, use general fail code
              ery_src03[111:108] <= 4'hE;
            end
          else if (mmr_legal_size == 1'b0)
            begin
              mmr_resp_code      <= 4'h9;  // Length is not legal, read happened but data was suppressed - report 'unsupported length' error
              ery_src03[111:108] <= 4'h9;
            end
          else if (mmio_bad_op_or_align == 1'b1)
            begin
              mmr_resp_code      <= 4'hE;  // Note: MMIO regs does not do an alignment check on a read, so this condition only occurs if the design
                                           // issued an illegal combination of strobes. If this happens, then use general fail code (xE).
                                           // If MMIO regs ever adds an alignment check on reads, separate the two cases (bad strobes vs. 
                                           // bad alignment) with a new signal and use 'bad address specification' code xB for the bad alignment.
              ery_src03[111:108] <= 4'hE;
            end
          else 
            mmr_resp_code  <= 4'h8;      // No problem with size or address, something else went wrong - report 'data error'
          // Save error information which triggers interrupt
          ery_loadsrc[3]     <= 1'b1;          // source 3 = config_read state machine
          ery_src03[127:112] <= 16'h0008;      // source 3 = config_read state machine
          ery_src03[    107] <= 1'b0;          
          ery_src03[106: 87] <= 20'b0;
          ery_src03[ 86: 84] <= mmr_pl;
          ery_src03[ 83: 82] <= 2'b0;
          ery_src03[ 81: 80] <= 2'b01;         // dL doesn't exist in command, set to 1 FLIT
          ery_src03[ 79: 64] <= mmr_capptag;
          ery_src03[ 63:  0] <= mmr_addr;

        end
      else                               // Operation was a success
        begin
          mmr_resp_opcode  <= 8'h01;     // mem_rd_response
          mmr_resp_dl      <= 2'b01;     // Return data is one 64B FLIT
          mmr_resp_dp      <= 2'b00;     // MMIO read uses 1 flit, so starting offset is 0
          mmr_resp_code    <= 4'h0;      // Not used with mem_wr_response
          mmr_rdata_bdi    <= 1'b0;      // Data is good
          mmr_rdata_valid  <= 1'b1;      // Response has valid data response with it       
          ery_loadsrc[3]   <= 1'b0;      // No error information saved
          ery_src03        <= 128'b0;
        end
    end  
  else
    begin
       mmr_rdata        <= mmr_rdata;    // Hold values so state machines below can use contents
       mmr_resp_opcode  <= mmr_resp_opcode;
       mmr_resp_dl      <= mmr_resp_dl;      
       mmr_resp_dp      <= mmr_resp_dp;       
       mmr_resp_code    <= mmr_resp_code;       
       mmr_rdata_bdi    <= mmr_rdata_bdi;
       mmr_rdata_valid  <= mmr_rdata_valid;
       ery_loadsrc[3]   <= 1'b0;              // If error load was set by this state, clear the strobe when leave it
       ery_src03        <= 128'b0;
    end


// Align the 8B of data from MMIO regs into the proper position in the 64B flit
// Form the return data at all times. The state machine will determine when to validate it.
wire [511:0] mmr_rdata_flit;
assign mmr_rdata_flit[ 63:  0] = (mmr_addr[5:3] == 3'b000) ? mmr_rdata : 64'b0;
assign mmr_rdata_flit[127: 64] = (mmr_addr[5:3] == 3'b001) ? mmr_rdata : 64'b0;
assign mmr_rdata_flit[191:128] = (mmr_addr[5:3] == 3'b010) ? mmr_rdata : 64'b0;
assign mmr_rdata_flit[255:192] = (mmr_addr[5:3] == 3'b011) ? mmr_rdata : 64'b0;
assign mmr_rdata_flit[319:256] = (mmr_addr[5:3] == 3'b100) ? mmr_rdata : 64'b0;
assign mmr_rdata_flit[383:320] = (mmr_addr[5:3] == 3'b101) ? mmr_rdata : 64'b0;
assign mmr_rdata_flit[447:384] = (mmr_addr[5:3] == 3'b110) ? mmr_rdata : 64'b0;
assign mmr_rdata_flit[511:448] = (mmr_addr[5:3] == 3'b111) ? mmr_rdata : 64'b0;


//WAIT_FOR_RESP_CR: This state checks that response credits are available to present the response to the TLX.
//                  If one is available, do the following right away. If none are present, wait for one to
//                  show up then do the following.
//                  - Present the saved response to the TLX using resp_valid. 
//                  - Issue command credit to the TLX in order to receive the next command. 
//                  - Operation is complete, jump to IDLE.
always @(posedge(clock))  
  if (SM_MMR == SM_MMR_WAIT_FOR_RESP_CR)
    begin 
      afu_tlx_resp_opcode_mmr  <= mmr_resp_opcode;     // Put response on TLX interface, but might not trigger with resp_valid yet   
      afu_tlx_resp_dl_mmr      <= mmr_resp_dl;       
      afu_tlx_resp_dp_mmr      <= mmr_resp_dp;       
      afu_tlx_resp_capptag_mmr <= mmr_capptag;         // Use saved tag from command
      afu_tlx_resp_code_mmr    <= mmr_resp_code;   
      afu_tlx_rdata_bus_mmr    <= mmr_rdata_flit;
      afu_tlx_rdata_bdi_mmr    <= mmr_rdata_bdi;
      if ((mmr_rdata_valid == 1'b1 && tarc_credits_available >= 4'b0001 && tardc_credits_available >= 6'b000001) || // need resp & resp data credits
          (mmr_rdata_valid == 1'b0 && tarc_credits_available >= 4'b0001) )                                          // need only resp credits
        begin
          afu_tlx_resp_valid_mmr   <= 1'b1;            // Present response to TLX
          afu_tlx_rdata_valid_mmr  <= mmr_rdata_valid; // Present response data to TLX, if it exists
          tarc_consume_credit_mmr  <= 4'b0001;          // TLX consumes a credit with resp_valid, so echo that in credit counter
          if (mmr_rdata_valid == 1'b1)
            tardc_consume_credit_mmr <= 6'b000001;      // TLX consumes a data credit with resp_valid, so echo that in credit counter
          else
            tardc_consume_credit_mmr <= 6'b0;      // No data credit consumption since there is no rdata_valid returned
          cmd_complete_mmr   <= 1'b1;                  // Issue credit to TLX to get next cmd
        end
      else                                             // Wait for response credit to show up
        begin
          afu_tlx_resp_valid_mmr   <= 1'b0;            // Do not issue response valid yet
          afu_tlx_rdata_valid_mmr  <= 1'b0;            // Do not issue reponse data valid yet
          tarc_consume_credit_mmr  <= 4'b0;          // Do not consume response credit yet
          tardc_consume_credit_mmr <= 6'b0;        // Do not consume response data credit yet
          cmd_complete_mmr         <= 1'b0;            // Do not issue credit to TLX to get next cmd yet
        end
    end  
  else
    begin
       afu_tlx_resp_opcode_mmr  <= 8'b0;               // Clear OR inputs when not in this state      
       afu_tlx_resp_dl_mmr      <= 2'b0;      
       afu_tlx_resp_dp_mmr      <= 2'b0;       
       afu_tlx_resp_capptag_mmr <= 16'b0; 
       afu_tlx_resp_code_mmr    <= 4'b0; 
       afu_tlx_rdata_bus_mmr    <= 512'b0;     
       afu_tlx_rdata_bdi_mmr    <= 1'b0;
       afu_tlx_resp_valid_mmr   <= 1'b0;   
       afu_tlx_rdata_valid_mmr  <= 1'b0;
       tarc_consume_credit_mmr  <= 4'b0;
       tardc_consume_credit_mmr <= 6'b0;
       cmd_complete_mmr         <= 1'b0;   
    end


// WAIT_FOR_NEXT_CMD: Nothing to do in this state. It is required to allow the CMD FIFO time to present the next command.
//                    It is needed because 'cmd_complete' doesn't appear until the cycle after WAIT_FOR_RESP_CR. 
//                    There is no way to predictively send 'cmd_complete' in the cycle before to eliminate the need
//                    for this state, because it could stay in WAIT_FOR_RESP_CR indefinitely depending on when the TLX
//                    returns response credits. 


// ERROR: If this state is entered, something went wrong. For instance, a soft error might put the state machine into
//        an illegal state. Because this is a test design, don't try to recover and proceed but instead
//        lock up in this state so the user knows there is an error to go find and fix.


// Determine next state
always @(posedge(clock))
  if (reset == 1'b1) begin
       SM_MMR <= SM_MMR_IDLE;
       pipeline_lock_r <= 1'b0;
  end      
  else 
    case (SM_MMR)
      SM_MMR_IDLE:            
          if (start_mmio_read == 1'b1 && pipe_is_locked == 1'b1)  
           begin
             SM_MMR <= SM_MMR_WAIT_FOR_MREG1;
             pipeline_lock_r <= 1'b1;
           end  
          else if (start_mmio_read == 1'b1 && pipe_is_locked == 1'b0)
           begin 
             SM_MMR <= SM_MMR_IDLE;
             pipeline_lock_r <= 1'b1;
           end  
          else 
           begin
             SM_MMR <= SM_MMR_IDLE;
             pipeline_lock_r <= 1'b0;
           end
      SM_MMR_WAIT_FOR_MREG1: 
          begin
              SM_MMR <= SM_MMR_WAIT_FOR_MREG2;
              pipeline_lock_r <= 1'b1;
          end                
      SM_MMR_WAIT_FOR_MREG2:
          begin
              SM_MMR <= SM_MMR_WAIT_FOR_RESP_CR;
              pipeline_lock_r <= 1'b1;
          end       
      SM_MMR_WAIT_FOR_RESP_CR:
          if ((mmr_rdata_valid == 1'b1 && tarc_credits_available >= 4'b0001 && tardc_credits_available >= 6'b000001) || // need resp & resp data credits
              (mmr_rdata_valid == 1'b0 && tarc_credits_available >= 4'b0001) ) 
                begin                                         // need only resp credits
                      SM_MMR <= SM_MMR_WAIT_FOR_NEXT_CMD;
                      pipeline_lock_r <= 1'b1;
                end                                   
          else begin             
                SM_MMR <= SM_MMR_WAIT_FOR_RESP_CR;
                pipeline_lock_r <= 1'b1;   
          end      
      SM_MMR_WAIT_FOR_NEXT_CMD:
          begin 
             SM_MMR <= SM_MMR_IDLE;
             pipeline_lock_r <= 1'b1;   
          end  
      SM_MMR_ERROR:
          begin
             SM_MMR <= SM_MMR_ERROR;
             pipeline_lock_r <= 1'b0;
          end   
      default:
          begin
             SM_MMR <= SM_MMR_ERROR;
             pipeline_lock_r <= 1'b0;
          end
    endcase

`ifndef TFMEMORY

// ==============================================================================================================================
// @@@ LPC_LOAD_NET: Command State Machine - LPC LOAD NETWORK FIFO 
// ==============================================================================================================================

// State Machine to load network fifo towards thymesisflow compute egress
reg [1:0]  LPC_LOAD_NET;
parameter  LPC_LOAD_NET_IDLE            = 2'b00;
parameter  LPC_LOAD_NET_WAIT_1CYCLE     = 2'b01;
parameter  LPC_LOAD_NET_ERROR           = 2'b11;

//To get a cmd into network fifo, it needs to be LPC read/write flavor + network fifo has room )

always @(posedge(clock))     // Use registers to hold command information while this command is being processed
  if (LPC_LOAD_NET == LPC_LOAD_NET_IDLE) 
    begin
      /*immediately trigger the process to get command data onto the network fifo if:
       1. there is room, 2) the data fifo has room to accept data (regardless if next cmd is read).
       According to TLX framer Reference design v0.3 document page 17,it is possible to ask dataflits
       as write cmd flavors arrive, without the need of synchronizing the operations (ie. wait for dataflits
       to arrive before proceeding with next command. 
        having been received.*/ 
      if ((start_write_mem == 1'b1 || start_pr_wr_mem == 1'b1 || start_write_mem_be == 1'b1 || start_rd_mem == 1'b1 || start_pr_rd_mem == 1'b1) 
           && (ncff_cmd_full == 1'b0))
        begin
          ncff_cmd_opcode_in   <= cff_cmd_opcode;
          ncff_cmd_dl_in       <= cff_cmd_dl;
          ncff_cmd_capptag_in  <= cff_cmd_capptag;
          ncff_cmd_pl_in       <= cff_cmd_pl;
          ncff_cmd_be_in       <= cff_cmd_be;
          ncff_cmd_pa_in       <= cff_cmd_pa;
          ncff_cmd_in_valid_in <= 1'b1;  //Trigger network FIFO to capture the value.
          cmd_complete_ldnf    <= 1'b1; 
        /* Command  flits enter transit mode by entering the network fifo,
          so another value may be presented by the TLX in the next cycle. In case 
          it is a read/pr_read it will immediately enter the network pipeline in 
          the next cycle. If it is a write, the state machine will move to the 
          capture data state and will come back here a number of cycles later.*/
          //if we have write requests, concurrently ask for the relevant dataflits
          if ( start_write_mem == 1'b1 )  
            begin
             //full write: ask in addition for the proper number of dataflits. 
             afu_tlx_cmd_rd_cnt_lpc_io <=  {1'b0, cff_cmd_dl};
             afu_tlx_cmd_rd_req_lpc_io  <= 1'b1;
            end
          else if (start_pr_wr_mem == 1'b1 || start_write_mem_be == 1'b1) 
            begin
             //one data flit for these
             afu_tlx_cmd_rd_cnt_lpc_io <=  3'b001;
             afu_tlx_cmd_rd_req_lpc_io  <= 1'b1;
            end  
        end
    end
  else
    begin
       ncff_cmd_in_valid_in       <= 1'b0;
       ncff_cmd_opcode_in         <= 8'b0;
       ncff_cmd_dl_in             <= 2'b0;
       ncff_cmd_capptag_in        <= 16'b0;
       ncff_cmd_pl_in             <= 3'b0;
       ncff_cmd_be_in             <= 64'b0;
       ncff_cmd_pa_in             <= 64'b0;
       afu_tlx_cmd_rd_cnt_lpc_io  <=  3'b000;
       afu_tlx_cmd_rd_req_lpc_io  <= 1'b0;
       cmd_complete_ldnf          <= 1'b0; 
    end

//State machine handling
always @(posedge(clock))
  if (reset == 1'b1) LPC_LOAD_NET <= LPC_LOAD_NET_IDLE;   
  else 
    case (LPC_LOAD_NET)
      LPC_LOAD_NET_IDLE:            
          if ((start_write_mem == 1'b1 || start_pr_wr_mem == 1'b1 || start_write_mem_be == 1'b1 || start_rd_mem == 1'b1 || start_pr_rd_mem == 1'b1) 
                 && (ncff_cmd_full == 1'b0)) 
                                LPC_LOAD_NET <= LPC_LOAD_NET_WAIT_1CYCLE;
          else                  LPC_LOAD_NET <= LPC_LOAD_NET_IDLE;
      LPC_LOAD_NET_WAIT_1CYCLE: 
            /* If it is a read commnand family we need to allow for a cycle 
               so that cmd_complete_ldnf that is presented in the previous cycle takes effect in the cmd fifo or we will be 
              sampling the same output again. */
             LPC_LOAD_NET <= LPC_LOAD_NET_IDLE;
             
    endcase
 
`endif
// ==============================================================================================================================
// @@@ ERY: Error vector array -- to be removed for the memory side.
// ==============================================================================================================================

lpc_errary ERY (
    .clock                 ( clock                 ) // Clock - samples & launches data on rising edge
  , .reset                 ( reset                 ) // When 1, clear all cross reference logic to the 'unallocated' state
  , .ery_loadsrc           ( ery_loadsrc           ) // When bit is 1, load the error information from the corresponding source into the array 
  , .ery_src15             ( ery_src15             ) // Vector of data to save from error source
  , .ery_src14             ( ery_src14             ) 
  , .ery_src09             ( ery_src09             ) 
  , .ery_src08             ( ery_src08             )  
  , .ery_src07             ( ery_src07             )
  , .ery_src06             ( ery_src06             )
  , .ery_src05             ( ery_src05             ) 
  , .ery_src04             ( ery_src04             ) 
  , .ery_src03             ( ery_src03             ) 
  , .ery_src02             ( ery_src02             ) 
  , .ery_src01             ( ery_src01             ) 
  , .ery_src00             ( ery_src00             ) 
  , .ery_data_out          ( ery_data_out          ) // Contents of oldest error vector in the FIFO
  , .ery_data_valid        ( ery_data_valid        ) // When 1, contents of ery_data_out are valid. This triggers an interrupt to the host.
  , .ery_data_done         ( ery_data_done         ) // Pulsed to 1 when the current valid error vector has been read by software
  , .ery_simultaneous_load ( ery_simultaneous_load ) // When 1, multiple loadsrc bits were on in the same cycle
  , .ery_overflow          ( ery_overflow          ) // When 1, error FIFO was full when another loadsrc arrived
  , .ery_trigger_intrp     ( ery_trigger_intrp     ) // When pulsed (0-1-0), send an interrupt to the host 
);


// ==============================================================================================================================
// @@@ MMIO: MMIO Registers
// ==============================================================================================================================

wire [63:0] mmio_out_captured_errors;      // Test benches can probe this vector to see if any errors occurred 
wire        mmio_ery_loadsrc15;            // For proper reg/wire conversion
wire        mmio_ery_loadsrc14;            // For proper reg/wire conversion

//Thymesis configuration register wires that feed net_cmdfifo instance
wire [63:0] thymesis_cfg0;
wire [63:0] thymesis_cfg1;
wire [63:0] thymesis_cfg2;
wire [63:0] thymesis_cfg3;
wire [63:0] thymesis_cfg4;
wire [63:0] thymesis_cfg5;
wire [63:0] thymesis_cfg6;
wire [63:0] thymesis_cfg7;
wire [63:0] thymesis_cfg8;
wire [63:0] thymesis_cfg9;
wire [63:0] thymesis_cfg10;
wire [63:0] thymesis_cfg11;
wire [63:0] aurora_control;
wire [63:0] aurora_status;
wire flit_tx_pulse; 
wire flit_rx_pulse_cmd; 
wire flit_rx_pulse_data;
wire latency_counter_reset;

reg  [63:0] mmio_in_captured_errors_q;     // Register incoming error signals to aid in timing closure
always @(posedge(clock))
  mmio_in_captured_errors_q <= mmio_in_captured_errors;

reg [15:0] outstanding_capptag;
reg [36:0] latency_cycle_counter_q;
reg [63:0] prev_latency_cycle_counter;

rmem_mmio_regs MMIO (
    .clock                               ( clock                            )
  , .reset                               ( reset                            )
    // Functional interface
  , .mmio_addr                           ( mmio_addr                        )
  , .mmio_wdata                          ( mmio_wdata                       )
  , .mmio_rdata                          ( mmio_rdata                       )
  , .mmio_rdata_vld                      ( mmio_rdata_vld                   )                                         
  , .mmio_wr_1B                          ( mmio_wr_1B                       )                                   
  , .mmio_wr_2B                          ( mmio_wr_2B                       )                                              
  , .mmio_wr_4B                          ( mmio_wr_4B                       )         
  , .mmio_wr_8B                          ( mmio_wr_8B                       )    
  , .mmio_rd                             ( mmio_rd                          )                                      
  , .mmio_bad_op_or_align                ( mmio_bad_op_or_align             )   
  , .mmio_addr_not_implemented           ( mmio_addr_not_implemented        )                                        
    // Inputs for readable MMIO fields
  , .mmio_in_captured_errors             ( mmio_in_captured_errors_q        )                                        
  , .mmio_in_status                      ( /*mmio_in_status*/ aurora_status )                                   
  , .mmio_ery_data_out                   ( ery_data_out                     )
  , .mmio_in_intrp_is_pending            ( mmio_in_intrp_is_pending         )
  , .aurora_status			 ( /*aurora_status*/ 64'b0                    )
    // Writable MMIO fields used within the design
  , .mmio_out_test_enable                ( enable                           )
  , .mmio_out_ignore_nomatch_on_read     ( mmio_out_ignore_nomatch_on_read  )
  , .mmio_out_enable_pipeline            ( mmio_out_enable_pipeline         )
  , .mmio_out_captured_errors            ( mmio_out_captured_errors         ) 
  /*, .mmio_out_intrp_ea                   ( memory_base_testing              )*/
  , .mmio_out_intrp_vec_mask             ( mmio_out_intrp_vec_mask          )
  , .mmio_out_intrp_pasid                ( mmio_out_intrp_pasid             )
  , .mmio_out_intrp_cmd_flag             ( mmio_out_intrp_cmd_flag          )
  , .mmio_out_intrp_stream_id            ( mmio_out_intrp_stream_id         )
  , .mmio_out_intrp_afutag               ( mmio_out_intrp_afutag            )
    // Control outputs
  , .mmio_ery_data_done                  ( ery_data_done                    )
  , .mmio_ery_loadsrc15                  ( mmio_ery_loadsrc15               )
  , .mmio_ery_src15                      ( ery_src15                        )
  , .mmio_ery_loadsrc14                  ( mmio_ery_loadsrc14               )
  , .mmio_ery_src14                      ( ery_src14                        )
  , .thymesis_out_slot0_reg              ( thymesis_cfg0                    )                                                
  , .thymesis_out_slot1_reg              ( thymesis_cfg1                    )             
  , .thymesis_out_slot2_reg              ( thymesis_cfg2                    )   
  , .thymesis_out_slot3_reg              ( thymesis_cfg3                    )
  , .thymesis_out_slot4_reg              ( thymesis_cfg4                    )
  , .thymesis_out_slot5_reg              ( thymesis_cfg5                    )
  , .thymesis_out_slot6_reg              ( thymesis_cfg6                    )
  , .thymesis_out_slot7_reg              ( thymesis_cfg7                    )
  , .thymesis_out_slot8_reg              ( thymesis_cfg8                    )
  , .thymesis_out_slot9_reg              ( thymesis_cfg9                    )
  , .thymesis_out_slot10_reg             ( thymesis_cfg10                   )
  , .thymesis_out_slot11_reg             ( thymesis_cfg11                   ) 
  , .aurora_control_reg                  ( aurora_control                   )
`ifndef TFMEMORY
  , .latency_cycle_counter               ( prev_latency_cycle_counter       )
  , .latency_counter_reset               ( latency_counter_reset            )
  , .flit_tx_pulse                       ( flit_tx_pulse                    )
  , .flit_rx_pulse_cmd                   ( flit_rx_pulse_cmd                )
  , .flit_rx_pulse_data                  ( flit_rx_pulse_data               )
`endif 
) ;

assign aurora_status[8:0]   = aurora_core0_status; 
assign aurora_status[17:9]  = aurora_core1_status;
assign aurora_status[26:18] = aurora_core2_status;
assign aurora_status[35:27] = aurora_core3_status;
assign aurora_status[44:36] = aurora_core4_status;
assign aurora_status[53:45] = aurora_core5_status;
assign aurora_status[62:54] = aurora_core6_status;


assign aurora_start0 = aurora_control[0];
assign aurora_start1 = aurora_control[1];
assign aurora_txpostcursorctrl = aurora_control[21:2];
assign aurora_txprecursorctrl  = aurora_control[41:22];
assign aurora_txdiffctrl       = aurora_control[61:42];

always @(*)
  begin
    ery_loadsrc[15] = mmio_ery_loadsrc15;    // For proper reg/wire conversion
    ery_loadsrc[14] = mmio_ery_loadsrc14;    
  end

`ifndef TFMEMORY
//Flit Rx,Tx pulses
reg flit_tx_pulse_q;
reg flit_rx_pulse_cmd_q;
reg flit_rx_pulse_data_q;

assign flit_tx_pulse      = flit_tx_pulse_q;
assign flit_rx_pulse_cmd  = flit_rx_pulse_cmd_q;
assign flit_rx_pulse_data = flit_rx_pulse_data_q;

reg cmdflit_counter_divider;  /* This counts cmd flits in pairs of two, because downsizer is 
                                 chopping 32B from each 64B flit when it is a cmd flit.  */

//divider process
always @(posedge(clock))
  if (reset == 1'b1) 
    begin
     cmdflit_counter_divider <= 1'b0;
    end else if ((start_write_mem == 1'b1 || start_rd_mem == 1'b1) && (ncff_cmd_full == 1'b0))
    begin 
     cmdflit_counter_divider <= ~cmdflit_counter_divider;
    end

//flit_tx_pulse_q process
always @(posedge(clock))
 if (reset == 1'b1) 
   begin
      flit_tx_pulse_q      <= 1'b0; 
   end  
  else if (((start_write_mem == 1'b1 || start_rd_mem == 1'b1) && (ncff_cmd_full == 1'b0) && (cmdflit_counter_divider == 1'b1)) ||  
            ((tlx_afu_cmd_data_valid == 1'b1) && (pipeline_lock_w == 1'b0) && (cmddata_fifo_tready == 1'b1)))
   begin
       flit_tx_pulse_q    <= 1'b1;     
   end
  else flit_tx_pulse_q    <= 1'b0;

reg respflit_counter_divider;  /* This counts resp flits in pairs of two, because downsizer is 
                                  chopping 32B from each 64B flit when it is a cmd flit. */

//divider process
always @(posedge(clock))
  if (reset == 1'b1) 
    begin
     respflit_counter_divider <= 1'b0;
    end else if ((rff_resp_valid == 1'b1) && (rff_resp_valid == 1'b1) && (tarc_credits_available  >= 4'h1) && ((rff_out_rdata_valid == 1'b0) || 
                    ((tardc_credits_available >= 6'h2) && (rff_resp_next_valid == 1'b1))))
    begin 
                respflit_counter_divider <= ~respflit_counter_divider;
    end

//flit_rx_pulse_cmd_q process
always @(posedge(clock))
 if (reset == 1'b1) 
   begin
      flit_rx_pulse_cmd_q      <= 1'b0; 
   end else if ((rff_resp_valid == 1'b1) && (respflit_counter_divider == 1'b1) && (rff_resp_valid == 1'b1) && (tarc_credits_available  >= 4'h1) && ((rff_out_rdata_valid == 1'b0) || 
                    ((tardc_credits_available >= 6'h2) && (rff_resp_next_valid == 1'b1))))
   begin
       flit_rx_pulse_cmd_q    <= 1'b1;     
   end
  else flit_rx_pulse_cmd_q    <= 1'b0;

//flit_rx_pulse_data_q process

always @(posedge(clock))
 if (reset == 1'b1) 
   begin
      flit_rx_pulse_data_q      <= 1'b0; 
   end else if (((rff_resp_valid == 1'b1) && (respflit_counter_divider == 1'b1) && (rff_resp_valid == 1'b1) && (tarc_credits_available  >= 4'h1) && (rff_out_rdata_valid == 1'b1)  &&  
                (tardc_credits_available >= 6'h2) && (rff_resp_next_valid == 1'b1)) || ((rff_resp_valid == 1'b1)  && (rff_out_resp_valid == 1'b0) && (rff_out_rdata_valid == 1'b1) &&
                (tardc_credits_available >= 6'h1))) 
   begin
       flit_rx_pulse_data_q    <= 1'b1;     
   end
  else flit_rx_pulse_data_q    <= 1'b0;



//*******************Latency counter state machine********************//
//  The state machine when in unlocked state, locks on the first read or write
//  cmd flit that will go remote by moving to lock state
//  It then counts the cycles that it remains in the locked state, which exits
//  when the response for the specific cmd is back (i.e. indicated by the capptag)
//  The prev_latency_cycle counter captures both the accumulated latency 
//  and the number of measurements in the same register so the software
//  can do the math and compute the average
//  If sampled every second, this counter split may result in overflow with line rates 
//  substantially above 100Gb/sec 
//  flit counter 63:37 (27 bits) : the number of measurements
//  flit accumulated latency 36:0: accumulated latency 
//*******************************************************************//

reg SM_LCOUNT;
parameter SM_LCOUNT_UNLOCKED = 1'b0;
parameter SM_LCOUNT_LOCKED   = 1'b1;


always @(posedge(clock))
  if (reset == 1'b1)
     begin
         SM_LCOUNT                    <= SM_LCOUNT_UNLOCKED;
         latency_cycle_counter_q      <= 37'b0;
         prev_latency_cycle_counter   <= 64'b0;
     end
   else
    case (SM_LCOUNT)
      SM_LCOUNT_UNLOCKED:
          if ((start_write_mem == 1'b1 || start_rd_mem == 1'b1) && (ncff_cmd_full == 1'b0)  && (latency_counter_reset == 1'b0))
            begin
               outstanding_capptag           <= cff_cmd_capptag;
               latency_cycle_counter_q       <= 37'b0;
               SM_LCOUNT                     <= SM_LCOUNT_LOCKED;
            end
          else if (latency_counter_reset == 1'b1) 
            begin
                SM_LCOUNT                    <= SM_LCOUNT_UNLOCKED;
                prev_latency_cycle_counter   <= 64'b0; //The value is read during this cycle - prepare for the next.
            end
         else 
            begin
                SM_LCOUNT                    <= SM_LCOUNT_UNLOCKED;
                prev_latency_cycle_counter   <= prev_latency_cycle_counter; //Hold the value              
            end
      SM_LCOUNT_LOCKED:
           if (rff_out_resp_capptag == outstanding_capptag) //as soon as the capptag is delivered register the value.
             begin
                prev_latency_cycle_counter[36:0]    <= prev_latency_cycle_counter[36:0] + latency_cycle_counter_q + 37'h1;
                prev_latency_cycle_counter[63:37]   <= prev_latency_cycle_counter[63:37] + 27'h1; 
                SM_LCOUNT                           <= SM_LCOUNT_UNLOCKED;
             end
           else begin //Actual cycle count takes place here
                latency_cycle_counter_q             <= latency_cycle_counter_q + 37'h1;
                SM_LCOUNT                           <= SM_LCOUNT_LOCKED;
             end

    endcase
`endif 

// ***************************************************************************************
// ***************************************************************************************
// @@@ Part 2: AFU -> Host Commands, Host -> AFU Responses
// ***************************************************************************************
// ***************************************************************************************


// ==============================================================================================================================
// @@@ RESPDEC: Response Decode - When see valid response from TLX, decode it 
// ==============================================================================================================================

// These signals are pulsed individually, based on the opcode
//   received_nop          ; // Opcode x00 (abbreviation RNO = Received NO operation )
wire received_intrp_resp   ; // Opcode x0C (abbreviation IRP = Interrupt ResPonse    )
wire received_intrp_rdy    ; // Opcode x1A (abbreviation IRY = Interrupt ReadY       )


// Three conditions must be met to start processing a response:
// a) The TLX must indicate it is ready (presumed to be true, if not AFU would not have issued the command waiting for a response)
// b) The TLX must present a valid response indicator
// c) The opcode must decode properly
// Notes:
// - This LPC version relies on the AFU sending only 1 cmd_credit back to the TLX at a time to prevent multiple commands from being started in parallel
// - The 'received' signals should be a single cycle pulse, because resp_valid is a pulse from the TLX (1 pulse per presented command)
assign received_intrp_resp   = (tlx_afu_resp_valid == 1'b1 && tlx_afu_resp_opcode == 8'h0C) ? 1'b1 : 1'b0;
assign received_intrp_rdy    = (tlx_afu_resp_valid == 1'b1 && tlx_afu_resp_opcode == 8'h1A) ? 1'b1 : 1'b0;

// --- Detect fatal error conditions ---

// These conditions will generate an interrupt and will stop the AFU from responding to further host commands.
// This is because no response credit will be returned, which means the TLX will not be permitted to present the next response to the AFU.
// In this version of the design, fatal error signals will pulse and be logged in the MMIO error register associated with fatal errors.
// - 'received_bad_op' will hang because there is no state machine started to return a response credit to the TLX

assign received_bad_op = (tlx_afu_resp_valid == 1'b1 &&  
                        !(  received_intrp_resp | received_intrp_rdy 
                       // | received_read_resp  | received_read_failed | received_write_resp | received_write_failed
                         ) ) ? 1'b1 : 1'b0;


// ==============================================================================================================================
// @@@ ACTAG: Manage 'acTag'
// ==============================================================================================================================


wire [11:0] actag_first;      // First legal actag value to use for this AFU
wire [11:0] actag_last;       // Last  legal actag value to use for this AFU
wire [12:0] actag_sum;
wire        actag_sum_err;    // When 1, combination of actag_base and length_enabled overflows 12 bits

assign actag_first   = acs_actag_base;                                         
assign actag_sum     = {1'b0,acs_actag_base} + {1'b0,acs_actag_len_enabled};   
assign actag_last    = actag_sum[11:0];
assign actag_sum_err = actag_sum[12];    // Only check when issuing an interrupt (fold into irq_acs_settings_err below)

// Detect if BDF or PASID changed value

// First, create copy of BDF and PASID of previous cycle to detect when it changes
reg  [15:0] afu_old_bdf;
reg  [19:0] afu_old_pasid; 
always @(posedge(clock))                 
  begin
    afu_old_bdf   <= afu_tlx_cmd_bdf_int;    
    afu_old_pasid <= mmio_out_intrp_pasid;
  end

// Then set a 'changed' bit when either changes. Clear it when an 'assign_actag' command is sent by a sequencer. 
// The state of this bit tells the AFU-Host command sequencer if it needs to preface the command with 'assign_actag'.
// Note: Setting takes precedence over clearing in case of collision.
reg         irq_assign_actag_sent;
reg         assign_actag_sent_mem_io;  // One 'sent' signal per AFU->Host command sequencer
reg         bdf_pasid_changed;
always @(posedge(clock))
  if (reset == 1'b1)
    bdf_pasid_changed <= 1'b0;   //syrivelis do not allow actag to be sent Cause assign_actag to be sent on first intrp_req, even if BDF or PASID did not change
  else if (afu_old_bdf != afu_tlx_cmd_bdf_int || afu_old_pasid != mmio_out_intrp_pasid) // set if BDF or PASID changed 
    bdf_pasid_changed <= 1'b1;
  else if (irq_assign_actag_sent == 1'b1 || assign_actag_sent_mem_io == 1'b1)              // clear if either sequencer sent assign_actag
    bdf_pasid_changed <= 1'b0;
  else
    bdf_pasid_changed <= bdf_pasid_changed;


// TODO: When BDF or PASID changes, select a new actag from the allowed range. This gives variability to the testing.
//       Initial thoughts are to use part of an LFSR to add an offset to actag_first, keeping the result at or below actag_last.

wire [11:0] actag_to_use;             // Selected actag value to use
assign actag_to_use = actag_first;    // Temporary?
assign act_actag = actag_to_use; //d syrivelis provide this actag to hls

// Configuration space checks on PASID settings
wire   pasid_acs_settings_err;
assign pasid_acs_settings_err = ( intrp_count > 3'b000 && irq_ok_to_send_intrp == 1'b1 &&  // Check when intrp is pending and other checks allow it
                                  !(acs_pasid_length_enabled >= 5'b0 &&     // Number of PASID's allowed by software must be >= 1 (2^0)
                                    acs_pasid_base <= mmio_out_intrp_pasid) // Starting PASID must be at or before the value set in MMIO space
                                ) ? 1'b1 : 1'b0;
                                

// ==============================================================================================================================
// @@@ TERM: Manage process ID terminate interface with config space
// ==============================================================================================================================
// Note:
//   The interrupt reporting mechanism in the LPC is more of a general resource, even though it consumes a PASID.
//   The ACS termination interface was intended to reset specific processes, so doesn't make sense to apply it to 
//   the general interrupt. There are several other ways software can prevent interrupts from being issued, so the
///  LPC doesn't support this feature.

assign cfg_terminate_in_progress = 1'b0;  // Tie to 0


      
// ==============================================================================================================================
// @@@ IRQ: Interrupt Request - Interrupt logic is currently disconnected in ThymesisFlow. Should be connected in the next revision
// ==============================================================================================================================


// 1) Determine if host has configured the configuration space and MMIOs to allow interrupts to be generated
//disabling interrupt logic..
assign irq_ok_to_send_intrp = 1'b0;
/*assign irq_ok_to_send_intrp  = ( acs_enable_afu == 1'b1 &&         // AFU must be enabled to initiate commands to the host, and
                                 mmio_out_intrp_vec_mask == 1'b0   // general error interrupt must be unmasked (enabled)
                               ) ? 1'b1 : 1'b0;*/

wire   irq_acs_settings_err;   // If enabled, check these other interrupt related fields when an interrupt needs to be sent
assign irq_acs_settings_err = ( intrp_count > 3'b000 && irq_ok_to_send_intrp == 1'b1 &&   // Check when intrp is pending and other checks allow it
                                actag_sum_err == 1'b1 // acTag field overflows when adding base and length_supported
                              ) ? 1'b1 : 1'b0;


// 2) Accumulate interrupt requests (i.e. more errors may happen while an interrupt is in progress)
wire   trigger_intrp;
assign trigger_intrp = (ery_trigger_intrp & irq_ok_to_send_intrp);   // An interrupt needs to be sent, but interrupts need to be enabled

reg    intrp_count_dec;  // When 1, decrement interrupt count (i.e. an interrupt has been sent)
always @(posedge(clock))
  if (reset == 1'b1)
    intrp_count <= 3'b000;
  else if (trigger_intrp == 1'b1 && intrp_count_dec == 1'b0)  // Increment 
    intrp_count <= intrp_count + 3'b001;
  else if (trigger_intrp == 1'b1 && intrp_count_dec == 1'b1)  // Decrement
    intrp_count <= intrp_count - 3'b001;
  else                                                        // Hold if both or neither Increment & Decrement are active
    intrp_count <= intrp_count;

// Use intrp_count to tell MMIO register that at least 1 interrupt is pending 
assign mmio_in_intrp_is_pending = (intrp_count > 3'b000) ? 1'b1 : 1'b0;  


// 3) Create lock on the AFU->Host interface, as interrupts can happen anytime
reg   lock_afu_to_host_intf;
reg   lock_afu_to_host_intf_set_irq;
reg   lock_afu_to_host_intf_set_tm1;
reg   lock_afu_to_host_intf_clr_irq;
wire  lock_afu_to_host_intf_clr_tm1;
always @(posedge(clock))
  if (reset == 1'b1)
    lock_afu_to_host_intf <= 1'b0;  // Clear lock on reset
  else if ( lock_afu_to_host_intf_set_irq == 1'b1 || lock_afu_to_host_intf_set_tm1 == 1'b1)
    lock_afu_to_host_intf <= 1'b1;  // Set the lock
  else if ( lock_afu_to_host_intf_clr_irq == 1'b1 ||  lock_afu_to_host_intf_clr_tm1 == 1'b1)
    lock_afu_to_host_intf <= 1'b0;  // Clear lock via functional means
  else
    lock_afu_to_host_intf <=  lock_afu_to_host_intf;  // Hold
// Flag an error if someone tries to set a lock when it is already in place, or tries to clear a lock that is not in place
assign err1_lock_afu_to_host_intf = ( (lock_afu_to_host_intf_set_irq == 1'b1 || lock_afu_to_host_intf_set_tm1 == 1'b1) &&  lock_afu_to_host_intf == 1'b1) ? 1'b1 : 1'b0;
assign err2_lock_afu_to_host_intf = ( (lock_afu_to_host_intf_clr_irq == 1'b1 || lock_afu_to_host_intf_clr_tm1 == 1'b1) &&  lock_afu_to_host_intf == 1'b0) ? 1'b1 : 1'b0;


// 4) Interrupt Generation state machine

reg  [3:0] SM_IRQ;
parameter  SM_IRQ_IDLE              = 4'b0000;
parameter  SM_IRQ_GET_LOCK          = 4'b0001;
parameter  SM_IRQ_SEND_INTRP        = 4'b0010;
parameter  SM_IRQ_WAIT_FOR_RESP     = 4'b0011;
parameter  SM_IRQ_RETRY_AFTER_DELAY = 4'b0100;
parameter  SM_IRQ_WAIT4_INTRP_RDY   = 4'b0101;
parameter  SM_IRQ_CLEAN_UP          = 4'b0110;
parameter  SM_IRQ_CLEAN_UP2         = 4'b0111;
parameter  SM_IRQ_ERROR             = 4'b1111;


// Behavior to perform in each state


// IDLE: No behavior to perform. When trigger comes along, jump to GET_LOCK state.


// GET_LOCK: Use to get the interface lock and send 'assign_actag' if it needs to be sent. 
// If it doesn't need to be, then just get the lock. If lock is unavailable, wait here until it becomes free.
// Also ensure the TLX can accept a command before proceeding.
always @(posedge(clock))
  if (SM_IRQ == SM_IRQ_GET_LOCK)
    begin
      if (irq_ok_to_send_intrp == 1'b1 && lock_afu_to_host_intf == 1'b0 && tacc_credits_available > 4'b0) // Interface is available and TLX can accept command
        begin
          lock_afu_to_host_intf_set_irq <= 1'b1;    // Lock interface for interrupt sequencer
          if (bdf_pasid_changed == 1'b1)            // Send 'assign_actag' if it needs to be sent
            begin
              // afu_tlx_cmd_bdf is always driven by BDF from LPC's config space
              afu_tlx_cmd_pasid_irq    <= mmio_out_intrp_pasid;
              afu_tlx_cmd_actag_irq1   <= actag_to_use;
              afu_tlx_cmd_opcode_irq1  <= 8'h50;
              afu_tlx_cmd_valid_irq1   <= 1'b1;
              irq_assign_actag_sent    <= 1'b1;     // Clear indicator that assign_actag needs to be sent
              tacc_consume_credit_irq1 <= 4'b0001;  // Consume 1 command credit when sending 'assign_actag'
            end
          else                                      // 'assign_actag' is not needed or need to wait for command credit
            begin
              afu_tlx_cmd_pasid_irq    <= 20'b0;
              afu_tlx_cmd_actag_irq1   <= 12'b0;
              afu_tlx_cmd_opcode_irq1  <= 8'h00;
              afu_tlx_cmd_valid_irq1   <= 1'b0;
              irq_assign_actag_sent    <= 1'b0;    
              tacc_consume_credit_irq1 <= 4'b000;
            end
        end
      else                                          // Wait for AFU to be enabled, lock to free, and at least 1 TLX command credit 
        begin
          lock_afu_to_host_intf_set_irq <= 1'b0;
          afu_tlx_cmd_pasid_irq         <= 20'b0;
          afu_tlx_cmd_actag_irq1        <= 12'b0;
          afu_tlx_cmd_opcode_irq1       <= 8'h00;
          afu_tlx_cmd_valid_irq1        <= 1'b0;
          irq_assign_actag_sent         <= 1'b0;    
          tacc_consume_credit_irq1      <= 4'b0;
        end
    end
  else                                              // not in this state
    begin
      lock_afu_to_host_intf_set_irq <= 1'b0;
      afu_tlx_cmd_pasid_irq         <= 20'b0;
      afu_tlx_cmd_actag_irq1        <= 12'b0;
      afu_tlx_cmd_opcode_irq1       <= 8'h00;
      afu_tlx_cmd_valid_irq1        <= 1'b0;
      irq_assign_actag_sent         <= 1'b0;    
      tacc_consume_credit_irq1      <= 4'b0;
    end


// SEND_INTRP: Once the TLX can accept it, send the 'intrp_req' command to the host.
always @(posedge(clock))
  if (SM_IRQ == SM_IRQ_SEND_INTRP)
    begin
      if (tacc_credits_available > 4'b0000)        // Wait for TLX to have a command credit available
        begin
          afu_tlx_cmd_stream_id_irq <= mmio_out_intrp_stream_id;
          afu_tlx_cmd_actag_irq2    <= actag_to_use;
          afu_tlx_cmd_flag_irq      <= mmio_out_intrp_cmd_flag;
          afu_tlx_cmd_ea_or_obj_irq <= { 4'b0000, mmio_out_intrp_ea };  // Extra upper bits not used on 'intrp_req'
          afu_tlx_cmd_afutag_irq    <= mmio_out_intrp_afutag;
          afu_tlx_cmd_opcode_irq2   <= 8'h58;
          afu_tlx_cmd_valid_irq2    <= 1'b1;
          tacc_consume_credit_irq2  <= 4'b0001;    // Consume 1 command credit when sending interrupt
        end
      else                                         // TLX is not ready to receive a command, so wait
        begin
          afu_tlx_cmd_stream_id_irq <= 4'b0;
          afu_tlx_cmd_actag_irq2    <= 12'b0;
          afu_tlx_cmd_flag_irq      <= 4'b0;
          afu_tlx_cmd_ea_or_obj_irq <= 68'b0;  
          afu_tlx_cmd_afutag_irq    <= 16'b0;
          afu_tlx_cmd_opcode_irq2   <= 8'h00;
          afu_tlx_cmd_valid_irq2    <= 1'b0;
          tacc_consume_credit_irq2  <= 4'b0;
        end
    end    
  else                                             // State machine is not in this state
    begin
      afu_tlx_cmd_stream_id_irq <= 4'b0;
      afu_tlx_cmd_actag_irq2    <= 12'b0;
      afu_tlx_cmd_flag_irq      <= 4'b0;
      afu_tlx_cmd_ea_or_obj_irq <= 68'b0;  
      afu_tlx_cmd_afutag_irq    <= 16'b0;
      afu_tlx_cmd_opcode_irq2   <= 8'h00;
      afu_tlx_cmd_valid_irq2    <= 1'b0;
      tacc_consume_credit_irq2  <= 4'b000;
    end


// WAIT_FOR_RESP: Wait for the TLX to present a response to the intrp_req. 
// Depending on the resp_code, take different actions.
//  resp_code = 0000  Interrupt was accepted.  Goto CLEAN_UP.
//  resp_code = 0010  Wait long delay, then resend intrp_req. Jump to RETRY_AFTER_DELAY.
//  resp_code = 0100  Wait for intrp_rdy to arrive. Jump to SEND_INTRP.
//  resp_code = 1000, 1001, 1011, 1110  Severe failure on host. Log error, jump to SM_IRQ_ERROR.
//  resp_code = anything else (i.e. reserved code)  Log error, jump to SM_IRQ_ERROR.
//  For all resp_codes, send response credit to TLX indicating AFU can accept another response.
always @(posedge(clock))
  if (SM_IRQ == SM_IRQ_WAIT_FOR_RESP)
    begin
      if (received_intrp_resp == 1'b1)
        begin
          afu_tlx_resp_credit_irq1 <= 1'b1;              // AFU got the response, tell TLX it can send another one
          // Check for these errors. If one occurs, capture error diagnosis information.
          // - AFUTag in response does not match AFUTag sent in request
          // - resp_code is error or reserved code
          if (tlx_afu_resp_afutag != mmio_out_intrp_afutag ||  // AFUTag didn't match OR
              !(tlx_afu_resp_code == 4'b0000 ||          // response code was not: Interrupt was accepted,
                tlx_afu_resp_code == 4'b0010 ||          //   Wait for long delay, or
                tlx_afu_resp_code == 4'b0100  )       )  //   Wait for intrp_rdy
            begin
              ery_loadsrc[6]     <= 1'b1;
              ery_src06[127:112] <= 16'h0040;
              ery_src06[111:108] <= tlx_afu_resp_code;
              ery_src06[107: 32] <= 76'b0;
              ery_src06[ 31: 16] <= tlx_afu_resp_afutag;
              ery_src06[ 15:  0] <= mmio_out_intrp_afutag;
            end
          else 
            begin
              ery_loadsrc[6]     <= 1'b0;
              ery_src06          <= 128'b0;
            end
        end
      else                                               // Waiting for response to show up
        begin
          afu_tlx_resp_credit_irq1 <= 1'b0;              // Do not give a credit back
          ery_loadsrc[6]           <= 1'b0;              // No error to report
          ery_src06                <= 128'b0;
        end
    end
  else                                                   // not in this state
    begin
      afu_tlx_resp_credit_irq1 <= 1'b0;                  // Do not give a credit back
      ery_loadsrc[6]           <= 1'b0;                  // No error to report
      ery_src06                <= 128'b0;
    end


// RETRY_AFTER_DELAY: Wait for "long" delay to expire, then reissue 'intrp_req'
reg [35:0] irq_delay_count;
always @(posedge(clock))
  if (SM_IRQ == SM_IRQ_RETRY_AFTER_DELAY)
    irq_delay_count <= irq_delay_count - 36'h0_0000_0001;       // Decrement each cycle. 'next state' section checks when = 0.
  else                                         
    irq_delay_count <= acs_long_backoff_timer;                   // Initialize counter to programmed delay



// WAIT4_INTRP_RDY: Wait for 'intrp_rdy' to arrive, then reissue 'intrp_req'
// Depending on the resp_code, take different actions.
//  resp_code = 0000  Host is ready to receive interrupt. Goto SEND_INTRP.
//  resp_code = 0010  Wait long delay, then resend intrp_req. Jump to RETRY_AFTER_DELAY.
//  resp_code = 1110  Severe failure on host. Log error, jump to SM_IRQ_ERROR.
//  resp_code = anything else (i.e. reserved code)  Log error, jump to SM_IRQ_ERROR.
//  For all resp_codes, send response credit to TLX indicating AFU can accept another response.
always @(posedge(clock))
  if (SM_IRQ == SM_IRQ_WAIT4_INTRP_RDY)
    begin
      if (received_intrp_rdy == 1'b1)
        begin
          afu_tlx_resp_credit_irq2 <= 1'b1;              // AFU got the response, tell TLX it can send another one
          // Check for these errors. If one occurs, capture error diagnosis information.
          // - AFUTag in response does not match AFUTag sent in request
          // - resp_code is error or reserved code
          if (tlx_afu_resp_afutag != mmio_out_intrp_afutag ||  // AFUTag didn't match OR
              !(tlx_afu_resp_code == 4'b0000 ||                // response code was not: Retry intrp_req, or
                tlx_afu_resp_code == 4'b0010 )              )  //   Wait for long delay
            begin
              ery_loadsrc[7]     <= 1'b1;
              ery_src07[127:112] <= 16'h0080;
              ery_src07[111:108] <= tlx_afu_resp_code;
              ery_src07[107: 32] <= 76'b0;
              ery_src07[ 31: 16] <= tlx_afu_resp_afutag;
              ery_src07[ 15:  0] <= mmio_out_intrp_afutag;
            end
          else 
            begin
              ery_loadsrc[7]     <= 1'b0;
              ery_src07          <= 128'b0;
            end
        end
      else                                               // Waiting for response to show up
        begin
          afu_tlx_resp_credit_irq2 <= 1'b0;              // Do not give a credit back
          ery_loadsrc[7]           <= 1'b0;              // No error to report
          ery_src07                <= 128'b0;
        end
    end
  else                                                   // not in this state
    begin
      afu_tlx_resp_credit_irq2 <= 1'b0;                  // Do not give a credit back
      ery_loadsrc[7]           <= 1'b0;                  // No error to report
      ery_src07                <= 128'b0;
    end


// CLEAN_UP: Interrupt has completed. Release lock on AFU->Host interface & decrement pending interrupt counter
always @(posedge(clock))
  if (SM_IRQ == SM_IRQ_CLEAN_UP)
    begin
      lock_afu_to_host_intf_clr_irq <= 1'b1;        // Release lock on AFU->Host interface
      intrp_count_dec               <= 1'b1;        // Decrement pending interrupt counter
    end
  else                                              // not in this state
    begin
      lock_afu_to_host_intf_clr_irq <= 1'b0;        // Set to inactive values
      intrp_count_dec               <= 1'b0;        
    end


// CLEAN_UP2: Nothing to do in this state except wait for intrp_count to get decremented and AFU->Host interface to free.
//            If this state is not included, SM_IRQ restarts too soon since it senses the value of intrp_count before it is decremented.


// Determine next state
always @(posedge(clock))
  if (reset == 1'b1) SM_IRQ <= SM_IRQ_IDLE;   
  else 
    case (SM_IRQ)
      SM_IRQ_IDLE:            
          if (intrp_count > 3'b000)            SM_IRQ <= SM_IRQ_GET_LOCK;
          else                                 SM_IRQ <= SM_IRQ_IDLE;
      SM_IRQ_GET_LOCK:
          if (irq_ok_to_send_intrp == 1'b1 && lock_afu_to_host_intf == 1'b0 && tacc_credits_available > 4'b0) 
                                               SM_IRQ <= SM_IRQ_SEND_INTRP;     // Proceed when lock is free and TLX has room for command
          else                                 SM_IRQ <= SM_IRQ_GET_LOCK;
      SM_IRQ_SEND_INTRP:
          if (tacc_credits_available > 4'b0)   SM_IRQ <= SM_IRQ_WAIT_FOR_RESP;  // If needed, wait for TLX to signal it can accept a command
          else                                 SM_IRQ <= SM_IRQ_SEND_INTRP;     
      SM_IRQ_WAIT_FOR_RESP:
          if (received_intrp_resp == 1'b0)                                      // Didn't receive intrp_resp yet, stay in state
                                               SM_IRQ <= SM_IRQ_WAIT_FOR_RESP;
          else if (tlx_afu_resp_afutag != mmio_out_intrp_afutag)                // AFUTag didn't match, treat as error
                                               SM_IRQ <= SM_IRQ_ERROR;          
          else if (tlx_afu_resp_code == 4'b0000)                                // Interrupt was accepted
                                               SM_IRQ <= SM_IRQ_CLEAN_UP;
          else if (tlx_afu_resp_code == 4'b0010)                                // Wait for long delay, then resent intrp_req
                                               SM_IRQ <= SM_IRQ_RETRY_AFTER_DELAY;
          else if (tlx_afu_resp_code == 4'b0100)                                // Wait for intrp_rdy
                                               SM_IRQ <= SM_IRQ_WAIT4_INTRP_RDY;
          else                                                                  // Received fatal or reserved resp_code, treat as error
                                               SM_IRQ <= SM_IRQ_ERROR;                                     
      SM_IRQ_RETRY_AFTER_DELAY:
          if (irq_delay_count == 36'h0_0000_0000) SM_IRQ <= SM_IRQ_SEND_INTRP;
          else                                    SM_IRQ <= SM_IRQ_RETRY_AFTER_DELAY;
      SM_IRQ_WAIT4_INTRP_RDY:
          if (received_intrp_rdy == 1'b0)                                       // Didn't receive intrp_resp yet, stay in state
                                               SM_IRQ <= SM_IRQ_WAIT4_INTRP_RDY;
          else if (tlx_afu_resp_afutag != mmio_out_intrp_afutag)                // AFUTag didn't match, treat as error
                                               SM_IRQ <= SM_IRQ_ERROR;          
          else if (tlx_afu_resp_code == 4'b0000)                                // Host is ready to receive interrupt
                                               SM_IRQ <= SM_IRQ_SEND_INTRP;
          else if (tlx_afu_resp_code == 4'b0010)                                // Wait for long delay, then resent intrp_req
                                               SM_IRQ <= SM_IRQ_RETRY_AFTER_DELAY;
          else                                                                  // Received fatal or reserved resp_code, treat as error
                                               SM_IRQ <= SM_IRQ_ERROR;                                     
      SM_IRQ_CLEAN_UP:
                                               SM_IRQ <= SM_IRQ_CLEAN_UP2;      // Wait for intrp_count to decrement
      SM_IRQ_CLEAN_UP2:
                                               SM_IRQ <= SM_IRQ_IDLE;           // Ready to issue next interrupt
      SM_IRQ_ERROR:
                                               SM_IRQ <= SM_IRQ_ERROR;          // Once in the error state, stay there
      default:
                                               SM_IRQ <= SM_IRQ_ERROR;
    endcase


`ifndef TFCOMPUTE

/************************************************************************
*  Tlx Command Header Flit AXI-S interface for commands and responses towards the Host. *
*************************************************************************/
 //TDATA signals
 wire dummy1;
 
 wire [199:0] mem_cmd_out;
 wire mem_cmd_out_valid;
 reg mem_cmd_sent;
 
 wire [7:0] afu_tlx_cmd_opcode_w;
 wire [67:0] afu_tlx_cmd_ea_or_obj_w;
 wire [15:0] afu_tlx_cmd_afutag_w;
 wire [1:0]  afu_tlx_cmd_dl_w;
 wire [2:0]  afu_tlx_cmd_pl_w;
 wire [63:0] afu_tlx_cmd_be_w;  
 wire [11:0] afu_tlx_cmd_actag_w;
 wire [3:0] afu_tlx_cmd_stream_id_w;
 wire [19:0] afu_tlx_cmd_pasid_w;
 wire [5:0] afu_tlx_cmd_pg_size_w;
 
  assign afu_tlx_cmd_ea_or_obj_w[67:64] = 4'b0000;
 
  assign {dummy1, //AXI-S 8 bit alignment
         afu_tlx_cmd_opcode_w,//opcode 198,191 - 8 bits 
         afu_tlx_cmd_ea_or_obj_w[63:0],//just using it as ea only - need to change in the future.         
         afu_tlx_cmd_afutag_w,// 126,111 -  16
         afu_tlx_cmd_dl_w,// 110,109 - 2 
         afu_tlx_cmd_pl_w,// 108,106 - 3              
         afu_tlx_cmd_be_w,// 105,32 - 64
         afu_tlx_cmd_actag_w,//41, 30 - 12
         afu_tlx_cmd_stream_id_w, // 29,26 - 4  
         afu_tlx_cmd_pasid_w, // 25,6  - 20
         afu_tlx_cmd_pg_size_w} = mem_cmd_out;  //5,0 - 6
        
  wire [3:0] cmff_buffers_available;      
  wire cmff_overflow;      
 
 
                       
   mem_cmd_fifo #(.WIDTH(200)) CMFF  (                      // Set WIDTH to combined number of response & response data signals that are used
           .clock                  ( clock                   )   // Clock - samples & launches data on rising edge
         , .reset                  ( reset                   )   // Reset - when 1 set control logic to default state
         , .data_in                ( tlx_cmd_tdata           )   // Vector of response signals
         , .data_in_valid          ( tlx_cmd_tvalid          )   // When 1, load 'resp_in' into the FIFO
         , .data_buffers_available ( cmff_buffers_available  )   // When >0, there is space in the FIFO for another command
         , .data_fifo_full         ( tlx_cmd_tready          )   // When 0, fifo is full  
         , .data_sent              ( mem_cmd_sent            )   // When 1, increment read FIFO pointer to present the next FIFO entry
         , .data_out               ( mem_cmd_out             )   // Response information at head of FIFO
         , .data_out_valid         ( mem_cmd_out_valid       )   // When 1, 'resp_out' contains valid information
         , .fifo_overflow          ( cmff_overflow           )   // When 1, FIFO was full when another 'resp_valid' arrived
   ); 
   

/*************************************************
 * AFU->Tlx Command Data with BDI AXI-S interface.    *
**************************************************/

//TDATA channel
wire [5:0] dummy2; //dummies pad bus widths to multiples of 8bits to conform to AXI4-S protocol spec
wire [5:0] dummy3;

wire [512:0] mem_data_out;
wire [512:0] mem_data_out_next;
wire mem_data_out_valid;
wire mem_data_out_next_valid;
reg mem_data_sent;

wire afu_tlx_cdata_bdi_w;
wire [511:0] afu_tlx_cdata_bus_w;

wire afu_tlx_cdata_bdi_w_next;
wire [511:0] afu_tlx_cdata_bus_w_next;

assign {dummy2,
        afu_tlx_cdata_bdi_w,
        afu_tlx_cdata_bus_w} = mem_data_out;

assign {dummy3,
        afu_tlx_cdata_bdi_w_next,
        afu_tlx_cdata_bus_w_next} = mem_data_out_next;
                
        
        
 wire [4:0] cdff_buffers_available;                 
 wire cmdf_overflow;
                
 mem_data_fifo #(.WIDTH(513)) CDFF  (                      // Set WIDTH to combined number of response & response data signals that are used
                  .clock                  ( clock                    )   // Clock - samples & launches data on rising edge
                , .reset                  ( reset                    )   // Reset - when 1 set control logic to default state
                , .data_in                ( tlx_data_tdata           )   // Vector of response signals
                , .data_in_valid          ( tlx_data_tvalid          )   // When 1, load 'resp_in' into the FIFO
                , .data_buffers_available ( cdff_buffers_available   )   // When >0, there is space in the FIFO for another command
                , .data_fifo_full         ( tlx_data_tready          )   // When 0, fifo is full  
                , .data_sent              ( mem_data_sent            )   // When 1, increment read FIFO pointer to present the next FIFO entry
                , .data_out               ( mem_data_out             )   // Response information at head of FIFO
                , .data_out_valid         ( mem_data_out_valid       )   // When 1, 'resp_out' contains valid information
                , .data_out_next          ( mem_data_out_next        )
                , .data_out_next_valid    ( mem_data_out_next_valid  )
                , .fifo_overflow          ( cmdf_overflow            )   // When 1, FIFO was full when another 'resp_valid' arrived
          ) ;        
           
reg[1:0]   SM_CMDFF;                
parameter  SM_CMDFF_IDLE              = 2'b01; //IDLE + command flit reception
parameter  SM_CMDFF_WAIT_FOR_DATA     = 2'b10; //DATA flit pull 
 
always @(*)
    if ((SM_CMDFF[0] == 1'b1) && 
        //the cmd fifo has valid data to send
        (mem_cmd_out_valid == 1'b1) && 
        //if write cmd then 2 flits of data have to be also available for b2b push - else
        //any other command (in this implementation we expect only readwintc or assign_actag) should get through
        (((mem_data_out_next_valid == 1'b1) && (mem_data_out_valid == 1'b1) && (afu_tlx_cmd_opcode_w == 8'h20) && (tacdc_credits_available >= 6'h2))  ||  
        (afu_tlx_cmd_opcode_w != 8'h20)) &&
        //last but not least command and data credits are available.
        (tacc_credits_available >= 4'h1) //the credit consumption is presented in the next cycle 
     )  
    begin
        afu_tlx_cmd_opcode_mem_io          = afu_tlx_cmd_opcode_w; //opcode 198,191 - 8 bits 
        afu_tlx_cmd_ea_or_obj_mem_io[63:0] = afu_tlx_cmd_ea_or_obj_w[63:0];//just using it as ea only - need to change in the future.         
        afu_tlx_cmd_afutag_mem_io          = afu_tlx_cmd_afutag_w;// 126,111 -  16
        afu_tlx_cmd_dl_mem_io              = afu_tlx_cmd_dl_w;// 110,109 - 2 
        afu_tlx_cmd_pl_mem_io              = afu_tlx_cmd_pl_w;// 108,106 - 3              
        afu_tlx_cmd_be_mem_io              = afu_tlx_cmd_be_w;// 105,32 - 64
        afu_tlx_cmd_actag_mem_io           = afu_tlx_cmd_actag_w;//41, 30 - 12
        afu_tlx_cmd_stream_id_mem_io       = afu_tlx_cmd_stream_id_w; // 29,26 - 4  
        afu_tlx_cmd_pasid_mem_io           = afu_tlx_cmd_pasid_w; // 25,6  - 20
        afu_tlx_cmd_pg_size_mem_io         = afu_tlx_cmd_pg_size_w;
        afu_tlx_cmd_valid_mem_io           = 1'b1;
        //If command is write we need to co-incident the first flit of data delivery
        if (afu_tlx_cmd_opcode_w == 8'h20)
           begin
             afu_tlx_cdata_bdi_mem_io      = afu_tlx_cdata_bdi_w;
             afu_tlx_cdata_bus_mem_io      = afu_tlx_cdata_bus_w;
             afu_tlx_cdata_valid_mem_io    = 1'b1;
             mem_data_sent                 = 1'b1;
             tacdc_consume_credit_mem_io   = 1'b1;      
           end
        else 
           begin //else hold these to zero
             afu_tlx_cdata_bdi_mem_io      = 1'b0;
             afu_tlx_cdata_bus_mem_io      = 512'b0;
             afu_tlx_cdata_valid_mem_io    = 1'b0;
             mem_data_sent                 = 1'b0; 
             tacdc_consume_credit_mem_io   = 1'b0;       
           end
        tacc_consume_credit_mem_io    = 1'b1;   
        mem_cmd_sent = 1'b1;
    end
   else if (SM_CMDFF[1] == 1'b1) //Here we are just presenting  mem_data_sent for the previous flit, so we need to pickup next flit from next.
     begin
         afu_tlx_cdata_bdi_mem_io    = afu_tlx_cdata_bdi_w; //afu_tlx_cdata_bdi_w_next;
         afu_tlx_cdata_bus_mem_io    = afu_tlx_cdata_bus_w; //afu_tlx_cdata_bus_w_next;
         afu_tlx_cdata_valid_mem_io  = 1'b1;
         //Hold command data to zero when sending solo flits
         afu_tlx_cmd_opcode_mem_io          = 8'b0; //opcode 198,191 - 8 bits 
         afu_tlx_cmd_ea_or_obj_mem_io[63:0] = 64'b0;//just using it as ea only - need to change in the future.         
         afu_tlx_cmd_afutag_mem_io          = 16'b0;// 126,111 -  16
         afu_tlx_cmd_dl_mem_io              =  2'b0;// 110,109 - 2 
         afu_tlx_cmd_pl_mem_io              = 3'b0;// 108,106 - 3              
         afu_tlx_cmd_be_mem_io              = 64'b0;// 105,32 - 64
         afu_tlx_cmd_actag_mem_io           = 12'b0;//41, 30 - 12
         afu_tlx_cmd_stream_id_mem_io       = 4'b0; // 29,26 - 4  
         afu_tlx_cmd_pasid_mem_io           = 20'b0; // 25,6  - 20
         afu_tlx_cmd_pg_size_mem_io         = 6'b0;
         afu_tlx_cmd_valid_mem_io           = 1'b0; 
         mem_cmd_sent                       = 1'b0;
         tacc_consume_credit_mem_io         = 1'b0;
         tacdc_consume_credit_mem_io        = 1'b1;
         mem_data_sent                      = 1'b1; //in the next cycle this will be presented so we need to stall 
     end
   else
     begin
        afu_tlx_cmd_opcode_mem_io          =  8'b0; //opcode 198,191 - 8 bits 
        afu_tlx_cmd_ea_or_obj_mem_io[63:0] = 64'b0;//just using it as ea only - need to change in the future.         
        afu_tlx_cmd_afutag_mem_io          = 16'b0;// 126,111 -  16
        afu_tlx_cmd_dl_mem_io              =  2'b0;// 110,109 - 2 
        afu_tlx_cmd_pl_mem_io              =  3'b0;// 108,106 - 3              
        afu_tlx_cmd_be_mem_io              = 64'b0;// 105,32 - 64
        afu_tlx_cmd_actag_mem_io           = 12'b0;//41, 30 - 12
        afu_tlx_cmd_stream_id_mem_io       = 4'b0; // 29,26 - 4  
        afu_tlx_cmd_pasid_mem_io           = 20'b0; // 25,6  - 20
        afu_tlx_cmd_pg_size_mem_io         = 6'b0;
        afu_tlx_cmd_valid_mem_io           = 1'b0;
        //Data signals hold to zero
        afu_tlx_cdata_bdi_mem_io           = 1'b0;
        afu_tlx_cdata_bus_mem_io           = 512'b0;
        afu_tlx_cdata_valid_mem_io         = 1'b0; 
        mem_cmd_sent                       = 1'b0;
        mem_data_sent                      = 1'b0;
        tacdc_consume_credit_mem_io        = 1'b0;
        tacc_consume_credit_mem_io         = 1'b0;               
    end
                       

//State machine to coordinate cmd and data fifos flit delivery
// above according to TLx version 0.3 rules (page 20 of manual - cmd flit should be delivered in the same cycle with first dataflit and the rest in consequtive cycles "brick-walled")

always @(posedge(clock))
  if (reset == 1'b1) SM_CMDFF <= SM_CMDFF_IDLE;   
  else 
    case (SM_CMDFF)
      SM_CMDFF_IDLE:            
         if ((mem_cmd_out_valid == 1'b1) && (tacc_credits_available >= 4'h1) ) //command in read or write 
           begin
              if ( (afu_tlx_cmd_opcode_w  ==  8'h20) && //if command is write then back2back write of data is required.
                   //... with enough dataflits in the fifo
                   (mem_data_out_next_valid == 1'b1) && (mem_data_out_valid == 1'b1)  && 
                   //Two credits for data flits for back2back push.
                   (tacdc_credits_available >= 6'h2)
                 )  //then go for data
                  SM_CMDFF <= SM_CMDFF_WAIT_FOR_DATA;
               else if (afu_tlx_cmd_opcode_w  !=  8'h20)
                  SM_CMDFF  <=  SM_CMDFF_IDLE; //spend one cycle to present sent signal in case of read req
              // else SM_CMDFF <= SM_CMDFF_IDLE;
           end
         else SM_CMDFF <= SM_CMDFF_IDLE;
             
      SM_CMDFF_WAIT_FOR_DATA: 
              SM_CMDFF <= SM_CMDFF_IDLE; //we need to stall to present the sent signal. 
    endcase
        
           
/*****************************************************************************************         
* TL RESPONSE Header flit AXI-STREAM interface for responses to AFU->TLx issued commands *
******************************************************************************************/

//TDATA signals assignment
wire [39:0] mem_resp_in;

//Register input as well

assign mem_resp_in = {
      2'b0, //This is due to AXI-S 8bit alignment requirements.
      tlx_afu_resp_opcode, //8      
      tlx_afu_resp_afutag, //16
      tlx_afu_resp_code, //4
      tlx_afu_resp_dl, //2
      tlx_afu_resp_dp, //2
      6'b0};


wire mrff_overflow;

wire network_resp_ready;

//backpressure check: push only if the maximum allowed watermark of the destination queue is not violated.
assign network_resp_ready = (tl_resp_early_fifo_cnt[10:0] > FIFO_THRES) ? 1'b0 : 1'b1;


mem_respfifo #(.WIDTH(40)) MRFF  (                 // Set WIDTH to combined number of TLX command interface signal that are used
    .clock             ( clock                           )   // Clock - samples & launches data on rising edge
  , .reset             ( reset                           )   // Reset - when 1 set control logic to default state
  , .resync_credits    ( cfg_f1_octrl00_resync_credits   )
  , .tlx_is_ready      ( tlx_afu_ready                   )   // When 1, TLX is ready to exchange commands and responses 
  , .network_ready     ( network_resp_ready              )
  , .cmd_in            ( mem_resp_in                     )   // Vector of command signals
  , .cmd_in_valid      ( tlx_afu_resp_valid              )   // When 1, load 'cmd_in' into the FIFO
  , .cmd_credit_to_TLX ( afu_tlx_resp_credit             )   // When 1, there is space in the FIFO for another command
  , .cmd_tready        ( tl_resp_tready                  )   // When 1, the will push next entry
  , .cmd_out           ( tl_resp_tdata                   )   // Command information at head of FIFO
  , .cmd_out_valid     ( tl_resp_tvalid                  )   // When 1, 'cmd_out' contains valid information
  , .fifo_overflow     ( mrff_overflow                   )   // When 1, FIFO was full when another 'cmd_valid' arrived
) ;



/*
   Send request to get dataflits below
*/
always @(posedge(clock))
  if (tlx_afu_resp_valid == 1'b1     && //Valid resp signal
      tlx_afu_resp_opcode[2] == 1'b1 && //is ReadResp family..
      tlx_afu_resp_opcode[0] == 1'b0)   //...and has not failed.(i.e READOK)
    begin
      afu_tlx_resp_rd_cnt_mem_io[2] <= tlx_afu_resp_dl[1] &  tlx_afu_resp_dl[0]; //dl is 2'b11 so rd_cnt is 4 flits 3'b100 
      afu_tlx_resp_rd_cnt_mem_io[1] <= tlx_afu_resp_dl[1] & !tlx_afu_resp_dl[0];//dl is 2'b10 so rd_cnt is 2 flits 3'b010 
      afu_tlx_resp_rd_cnt_mem_io[0] <= !tlx_afu_resp_dl[1];                     //dl us 2'b01 so rd_cnt is 1 flit  3'b001
                                                                       //resp flit can't have zero dl here.
      afu_tlx_resp_rd_req_mem_io <= 1'b1; //ask for the data flits, immediately, though they will be delivered a cycle later.   
    end
  else
    begin
     afu_tlx_resp_rd_cnt_mem_io <= 3'b000;
     afu_tlx_resp_rd_req_mem_io <= 1'b0;
    end
                                
/*
//////////////////////////////////////////////////////////////////////////////////////////////////
  TL DATA flit AXI-STREAM interface for response data ( responses to AFU->TLx issued commands)
//////////////////////////////////////////////////////////////////////////////////////////////////
*/

assign tl_resp_data_tdata = {7'b0000000, //padding  because AXI-s works with byte aligned data
                             tlx_afu_resp_data_bdi, //512
                             tlx_afu_resp_data_bus}; //511,0
                  
/*
  combinational logic to capture tvalid only because
  TREADY must be always asserted... 
  FIFO sizes should be configured appropriately
  or we will be losing flits here - as there is no 
  way to excert backpressure to the push.
*/
assign tl_resp_data_tvalid = tlx_afu_resp_data_valid;


`endif


assign afu_tlx_cmd_os_mem_io            = 1'b0;
assign afu_tlx_cmd_flag_mem_io          = 4'h0;
assign afu_tlx_cmd_endian_mem_io        = 1'b0;


// ==============================================================================================================================
// @@@ DESC: AFU Descriptor Table 0 - defines configuration space information about this AFU
// ==============================================================================================================================

cfg_descriptor DESC (
    .clock                                  ( clock                             )
  , .reset                                  ( reset                             )  // (positive active)
    // READ ONLY field inputs 
                                            // 222221111111111000000000
                                            // 432109876543210987654321   Keep string exactly 24 characters long
//, .ro_name_space                          ( "IBM,LPC00000000000000000"        ) // '.' is an illegal character in the name
  , .ro_name_space                          ({"IBM,RMEM", {16{8'h00}} }          ) // String must contain EXACTLY 24 characters, so pad accordingly with NULLs
  , .ro_afu_version_major                   (  `AFU_VERSION_MAJOR               ) 
  , .ro_afu_version_minor                   (  `AFU_VERSION_MINOR               ) 
  , .ro_afuc_type                           (   3'b001                          ) // Type C1 issues commands to the host but does not cache host data
  , .ro_afum_type                           (   3'b001                          ) // Type M1 contains host mapped addresses (i.e. MMIO or memory)
  , .ro_profile                             (   8'h01                           ) // Device Interface Class
  , .ro_global_mmio_offset                  (  48'h0000_0000_0000               ) // MMIO space start offset from BAR 0 addr ([15:0] assumed to be h0000)
  , .ro_global_mmio_bar                     (   3'b000                          ) // MMIO space is contained in BAR0
  , .ro_global_mmio_size                    (  32'h0008_0000                    ) // LPC MMIO size is 1 MB, but Global MMIO section is 512 KB
  , .ro_cmd_flag_x1_supported               (   1'b0                            ) // cmd_flag x1 is not supported
  , .ro_cmd_flag_x3_supported               (   1'b0                            ) // cmd_flag x3 is not supported
  , .ro_atc_2M_page_supported               (   1'b0                            ) // Address Translation Cache page size of 2MB is not supported
  , .ro_atc_64K_page_supported              (   1'b0                            ) // Address Translation Cache page size of 64KB is not supported
  , .ro_max_host_tag_size                   (   5'b00000                        ) // Caching is not supported
  , .ro_per_pasid_mmio_offset               (  48'h0000_0000_0008               ) // PASID space start at BAR 0+512KB address ([15:0] assumed to be h0000)
  , .ro_per_pasid_mmio_bar                  (   3'b000                          ) // PASID space is contained in BAR0
  , .ro_per_pasid_mmio_stride               (  16'h0001                         ) // Stride is 64KB per PASID entry ([15:0] assumed to be h0000)
//, .ro_mem_size                            (   8'h14                           ) // Default is 1 MB (2^2   0, x14 = 20 decimal) - SAM disabled
  , .ro_mem_size                            (   8'h2A                           ) // D2Aefault is 4 TB (2^42, x2A = 42 decimal) - SAM enabled
  , .ro_mem_start_addr                      (  64'h0000_0000_0000_0000          ) // LPC has only one Memory Space, starting at addr 0
  , .ro_naa_wwid                            ( 128'h0000_0000_0000_0000_0000_0000_0000_0000 ) // LPC has no WWID
    // Hardcoded 'AFU Index' number of this instance of descriptor table
  , .ro_afu_index                           ( ro_afu_index                      ) // Each AFU instance under a common Function needs a unique index number
    // Functional interface
  , .cfg_desc_afu_index                     ( cfg_desc_afu_index                )
  , .cfg_desc_offset                        ( cfg_desc_offset                   )
  , .cfg_desc_cmd_valid                     ( cfg_desc_cmd_valid                )
  , .desc_cfg_data                          ( desc_cfg_data                     )
  , .desc_cfg_data_valid                    ( desc_cfg_data_valid               )
  , .desc_cfg_echo_cmd_valid                ( desc_cfg_echo_cmd_valid           )
    // Error indicator
  , .err_unimplemented_addr                 ( desc_err_unimplemented_addr       )
);


// ==============================================================================================================================
// @@@ MMIO_INPUTS: Collect MMIO error and status input vectors as last thing in the file so everything is declared earlier.
// ==============================================================================================================================

// Miscellanous error checks
wire   err_incorrect_endianness;
assign err_incorrect_endianness = (tlx_afu_cmd_end == 1'b1 && tlx_afu_cmd_valid == 1'b1) ? 1'b1 : 1'b0;  // 1=Big, 0=Little Endian

//Dummy Wires
wire pip2_illegal_dl;
assign pip2_illegal_dl = 1'b0;
wire sam_overflow;
assign sam_overflow = 1'b0;
wire [4:0] sam_entries_open = 5'b00000;
// Collect error sources into a vector, then pass that into an MMIO register that will capture it
assign mmio_in_captured_errors = {         // When pulsed to 1, the MMIO reg bit is captured and held to 1. Write to 0 to clear.
    detect_bad_op                          // (   63) TLX presented a command that had an unrecognized opcode
  , write_mem_DL_is_reserved               // (   62) write_mem saw a DL value of 00, which is reserved
  , 1'b0 // read_mem_DL_is_reserved        // (   61) Reserved [was: read_mem saw a DL value of 00, which is reserved, but this is not a hang]
  , 1'b0 // afu_cfg_bad_op_or_align        // (   60) Reserved [was: AFU Config Space reported a bad address alignment or improper combination of strobes, but this is not a hang]
  , 1'b0 // mmio_bad_op_or_align           // (   59) Reserved [was: MMIO registers   reported a bad address alignment or improper combination of strobes, but this is not a hang]
  , received_bad_op                        // (   58) TLX presented a response that had an unrecognized opcode
  , err1_lock_afu_to_host_intf             // (   57) Someone tried to lock the AFU->Host interface when it was already in use
  , err2_lock_afu_to_host_intf             // (   56) Someone tried to free the AFU->Host interface when it was already available
  , cff_fifo_overflow                      // (   55) Command FIFO overrun
  , pip2_illegal_dl                        // (   54) Pipeline detected dL=00 on write_mem or rd_mem
  , 1'b0 //rff_fifo_overflow                      // (   53) Response FIFO overrun
  , err_incorrect_endianness               // (   52) TLX is saying interface is Big Endian
  , vpd_err_unimplemented_addr             // (   51) Access to VPD targeted an unimplemented address
  , desc_err_unimplemented_addr            // (   50) Access to AFU Descriptor Table targeted an unimplemented address
  , (SM_IRQ == SM_IRQ_ERROR) ? 1'b1 : 1'b0 // (   49) Interrupt    state machine entered an error state
  , 1'b0                                   // (   48) Reserved
  , tacc_credit_overflow                   // (   47) TLX->AFU Command       Credit overflow
  , tacc_credit_underflow                  // (   46) TLX->AFU Command       Credit underflow
  , tarc_credit_overflow                   // (   45) TLX->AFU Response      Credit overflow
  , tarc_credit_underflow                  // (   44) TLX->AFU Response      Credit underflow
  , tacdc_credit_overflow                  // (   43) TLX->AFU Command  Data Credit overflow
  , tacdc_credit_underflow                 // (   42) TLX->AFU Command  Data Credit underflow
  , tardc_credit_overflow                  // (   41) TLX->AFU Response Data Credit overflow
  , tardc_credit_underflow                 // (   40) TLX->AFU Response Data Credit underflow
  , rffcr_credit_overflow                  // (   39) Response Buffer        Credit overflow
  , rffcr_credit_underflow                 // (   38) Response Buffer        Credit underflow
  , cfg0_cff_fifo_overflow                 // (   37) TLX Port 0 CFG Command  FIFO Overflow
  , cfg1_cff_fifo_overflow                 // (   36) TLX Port 1 CFG Command  FIFO Overflow
  , cfg0_rff_fifo_overflow                 // (   35) TLX Port 0 CFG Response FIFO Overflow
  , cfg1_rff_fifo_overflow                 // (   34) TLX Port 1 CFG Response FIFO Overflow
  , 2'b0                                   // (33:32) Reserved
  , 1'b0 //mem_err_multiops                       // (   31) Bulk Memory error: read and write operations arrived in same cycle     
  , 1'b0 //mem_err_boundary                       // (   30) Bulk Memory error: on multi-FLIT read, start address and rdcnt crossed 256B boundary
  , 1'b0  //mem_err_internal                       // (   29) Bulk Memory error: internal condition that should never happen did
  , sam_overflow                           // (   28) SAM error: Mapping resources are exceeded
  , ery_simultaneous_load                  // (   27) ERY error: Multiple loadsrc bits on in the same cycle  
  , ery_overflow                           // (   26) ERY error: Excess error vector rows needed, array overflowed 
  , irq_acs_settings_err                   // (   25) IRQ error: Something isn't configured right to allow LPC to send an interrupt
  , pasid_acs_settings_err                 // (   24) PASID error: Something isn't configured right with the PASID settings
  , 24'b0                                  // (23: 0) Reserved
};

// Collect status signals that can be read via an MMIO read only address
assign mmio_in_status = {                  // Provide a READ ONLY way for signals like status to be assigned an MMIO address
    tlx_afu_ready                          // (63)    Ready from TLX (may be useless since can't use MMIO to read status if TLX isn't ready)
  , sam_entries_open                       // (62:58) Number of SAM mapping resources available
  , ery_data_valid                         // (57)    When 1, valid error information is available for software to read
  , 57'b0                                  // Reserved
}; 


endmodule 
