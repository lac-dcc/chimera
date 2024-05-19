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
`timescale 1ps / 1ps
// -------------------------------------------------------------------
//
// Title    : cfg_fence.v
// Function : This file sits between the TLX and AFU, providing stable, inactive values to the TLX while the AFU is 
//            fenced off. Fence control comes from Function DVSEC(s), and may be activated when the AFU is going to
//            be reconfigured while the rest of the chip is not.
//
//            This module handles one TLX - AFU interface. When multiple TLX interfaces are used, replicate this file
//            one per interface. The TLX - Configuration interface is not part of this file, since that is not part 
//            of the AFU.
// 
//            Since the TLX-AFU signals pass through the Fence block, a registered copy of the signals is made for
//            passing to a trace block.
//
// -------------------------------------------------------------------
// Modification History :
//                               |Version    |     |Author   |Description of change
//                               |-----------|     |-------- |---------------------
  `define CFG_FENCE_VERSION       21_Nov_2017   //            Changed ports for tlx_afu initial credits; now consistent with TLX 3.0.
// -------------------------------------------------------------------


// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================

module cfg_fence (

    // -----------------------------------
    // Miscellaneous Ports
    // -----------------------------------
    input          clock                             
  , input          reset                              // (active high) Hardware reset
  , input          fence                              // When 1, isolate AFU from TLX. When 0, pass signals through between them.

    // *************************************
    // Interface between TLX and Fence logic
    // *************************************
  
    // -------------------------------------
    // TLX Parser -> Fence Receive Interface
    // -------------------------------------

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
//x  , input          tlx_afu_cmd_t                      // (w/cmd_valid) Type of configuration read or write (0=type 0, 1=type 1)      

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

    // --------------------------------------
    // Fence -> TLX Framer Transmit Interface
    // --------------------------------------

    // Initial credit allocation
//  , input  [  2:0] tlx_afu_cmd_resp_initial_credit    // Number of starting credits from TLX for both AFU->TLX cmd and resp interfaces
//  , input  [  4:0] tlx_afu_data_initial_credit        // Number of starting credits from TLX for both AFU->TLX cmd and resp data interfaces
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

 
    // *******************************
    // Interface between Fence and AFU 
    // *******************************

    // -----------------------------
    // Fenc -> AFU Receive Interface
    // -----------------------------

  , output         fen_afu_ready                      // When 1, TLX is ready to receive both commands and responses from the AFU

    // Command interface to AFU
  , input  [  6:0] afu_fen_cmd_initial_credit         // (static) Number of cmd credits available for TLX to use in the AFU      
  , input          afu_fen_cmd_credit                 // Returns a cmd credit to the TLX
  , output         fen_afu_cmd_valid                  // Indicates TLX has a valid cmd for AFU to process
  , output [  7:0] fen_afu_cmd_opcode                 // (w/cmd_valid) Cmd Opcode
  , output [  1:0] fen_afu_cmd_dl                     // (w/cmd_valid) Cmd Data Length (00=rsvd, 01=64B, 10=128B, 11=256B) 
  , output         fen_afu_cmd_end                    // (w/cmd_valid) Operand Endian-ess 
  , output [ 63:0] fen_afu_cmd_pa                     // (w/cmd_valid) Physical Address
  , output [  3:0] fen_afu_cmd_flag                   // (w/cmd_valid) Specifies atomic memory operation (unsupported) 
  , output         fen_afu_cmd_os                     // (w/cmd_valid) Ordered Segment - 1 means ordering is guaranteed (unsupported) 
  , output [ 15:0] fen_afu_cmd_capptag                // (w/cmd_valid) Unique operation tag from CAPP unit     
  , output [  2:0] fen_afu_cmd_pl                     // (w/cmd_valid) Partial Length (000=1B,001=2B,010=4B,011=8B,100=16B,101=32B,110/111=rsvd)
  , output [ 63:0] fen_afu_cmd_be                     // (w/cmd_valid) Byte Enable   
//x  , output         fen_afu_cmd_t                      // (w/cmd_valid) Type of configuration read or write (0=type 0, 1=type 1)      

    // Response interface to AFU
  , input  [  6:0] afu_fen_resp_initial_credit        // (static) Number of resp credits available for TLX to use in the AFU     
  , input          afu_fen_resp_credit                // Returns a resp credit to the TLX     
  , output         fen_afu_resp_valid                 // Indicates TLX has a valid resp for AFU to process  
  , output [  7:0] fen_afu_resp_opcode                // (w/resp_valid) Resp Opcode     
  , output [ 15:0] fen_afu_resp_afutag                // (w/resp_valid) Resp Tag    
  , output [  3:0] fen_afu_resp_code                  // (w/resp_valid) Describes the reason for a failed transaction     
  , output [  5:0] fen_afu_resp_pg_size               // (w/resp_valid) Page size     
  , output [  1:0] fen_afu_resp_dl                    // (w/resp_valid) Resp Data Length (00=rsvd, 01=64B, 10=128B, 11=256B)     
  , output [  1:0] fen_afu_resp_dp                    // (w/resp_valid) Data Part, indicates the data content of the current resp packet     
  , output [ 23:0] fen_afu_resp_host_tag              // (w/resp_valid) Tag for data held in AFU L1 (unsupported, CAPI 4.0 feature)     
  , output [  3:0] fen_afu_resp_cache_state           // (w/resp_valid) Gives cache state of cache line obtained     
  , output [ 17:0] fen_afu_resp_addr_tag              // (w/resp_valid) Address translation tag for use by AFU with dot-t format commands

    // Command data interface to AFU
  , input          afu_fen_cmd_rd_req                 // Command Read Request     
  , input  [  2:0] afu_fen_cmd_rd_cnt                 // Command Read Count, number of 64B flits requested (000 is not useful)    
  , output         fen_afu_cmd_data_valid             // Command Data Valid, when 1 valid data is present on cmd_data_bus
  , output         fen_afu_cmd_data_bdi               // (w/cmd_data_valid) Bad Data Indicator, when 1 data FLIT is corrupted
  , output [511:0] fen_afu_cmd_data_bus               // (w/cmd_data_valid) Command Data Bus, contains the command for the AFU to process     

    // Response data interface to AFU
  , input          afu_fen_resp_rd_req                // Response Read Request     
  , input  [  2:0] afu_fen_resp_rd_cnt                // Response Read Count, number of 64B flits requested (000 is not useful)      
  , output         fen_afu_resp_data_valid            // Response Valid, when 1 valid data is present on resp_data     
  , output         fen_afu_resp_data_bdi              // (w/resp_data_valid) Bad Data Indicator, when 1 data FLIT is corrupted
  , output [511:0] fen_afu_resp_data_bus              // (w/resp_data_valid) Response Data, contains data for a read request     

    // -------------------------------
    // AFU -> Fence Transmit Interface
    // -------------------------------

    // Initial credit allocation
//  , output [  2:0] fen_afu_cmd_resp_initial_credit    // Number of starting credits from TLX for both AFU->TLX cmd and resp interfaces
  , output [  3:0] fen_afu_cmd_initial_credit           // Number of starting credits from TLX for both AFU->TLX cmd and resp interfaces
  , output [  3:0] fen_afu_resp_initial_credit          // Number of starting credits from TLX for both AFU->TLX cmd and resp interfaces
//  , output [  4:0] fen_afu_data_initial_credit        // Number of starting credits from TLX for both AFU->TLX cmd and resp data interfaces
  , output [  5:0] fen_afu_cmd_data_initial_credit      // Number of starting credits from TLX for AFU->TLX cmd data interface
  , output [  5:0] fen_afu_resp_data_initial_credit     // Number of starting credits from TLX for AFU->TLX resp data interface

    // Commands from AFU
  , output         fen_afu_cmd_credit                
  , input          afu_fen_cmd_valid                 
  , input  [  7:0] afu_fen_cmd_opcode                
  , input  [ 11:0] afu_fen_cmd_actag                 
  , input  [  3:0] afu_fen_cmd_stream_id             
  , input  [ 67:0] afu_fen_cmd_ea_or_obj             
  , input  [ 15:0] afu_fen_cmd_afutag               
  , input  [  1:0] afu_fen_cmd_dl                    
  , input  [  2:0] afu_fen_cmd_pl                    
  , input          afu_fen_cmd_os                    
  , input  [ 63:0] afu_fen_cmd_be                    
  , input  [  3:0] afu_fen_cmd_flag                  
  , input          afu_fen_cmd_endian                
  , input  [ 15:0] afu_fen_cmd_bdf                    // BDF = Concatenation of 8 bit Bus Number, 5 bit Device Number, and 3 bit Function                  
  , input  [ 19:0] afu_fen_cmd_pasid                 
  , input  [  5:0] afu_fen_cmd_pg_size               

    // Command data from AFU
  , output         fen_afu_cmd_data_credit           
  , input          afu_fen_cdata_valid               
  , input  [511:0] afu_fen_cdata_bus                 
  , input          afu_fen_cdata_bdi                  // When 1, marks command data associated with AFU->host command as bad        

    // Responses from AFU
  , output         fen_afu_resp_credit               
  , input          afu_fen_resp_valid                
  , input  [  7:0] afu_fen_resp_opcode               
  , input  [  1:0] afu_fen_resp_dl   
  , input  [ 15:0] afu_fen_resp_capptag          
  , input  [  1:0] afu_fen_resp_dp                   
  , input  [  3:0] afu_fen_resp_code                 

    // Response data from AFU
  , output         fen_afu_resp_data_credit          
  , input          afu_fen_rdata_valid               
  , input  [511:0] afu_fen_rdata_bus                 
  , input          afu_fen_rdata_bdi                  // When 1, marks response data associated with AFU's reply to Host->AFU cmd as bad                


    // ******************************
    // Interface taps for Trace Array 
    // ******************************
//  , output [2600:0] fen_trace_vector
  , output [2612:0] fen_trace_vector

) ;


// Register input to help with timing closure
reg fence_q;
always @(posedge(clock))
  fence_q <= fence;

// ==============================================================================================================================
// @@@  F2T: (Fence to TLX MUX) When Fence is active, drive inactive, stable values to TLX.  
// ==============================================================================================================================

assign afu_tlx_cmd_initial_credit      = (fence_q == 1'b0) ? afu_fen_cmd_initial_credit      : 7'b0;
assign afu_tlx_cmd_credit              = (fence_q == 1'b0) ? afu_fen_cmd_credit              : 1'b0;
assign afu_tlx_resp_initial_credit     = (fence_q == 1'b0) ? afu_fen_resp_initial_credit     : 7'b0;  
assign afu_tlx_resp_credit             = (fence_q == 1'b0) ? afu_fen_resp_credit             : 1'b0;
assign afu_tlx_cmd_rd_req              = (fence_q == 1'b0) ? afu_fen_cmd_rd_req              : 1'b0;
assign afu_tlx_cmd_rd_cnt              = (fence_q == 1'b0) ? afu_fen_cmd_rd_cnt              : 3'b0;    
assign afu_tlx_resp_rd_req             = (fence_q == 1'b0) ? afu_fen_resp_rd_req             : 1'b0; 
assign afu_tlx_resp_rd_cnt             = (fence_q == 1'b0) ? afu_fen_resp_rd_cnt             : 3'b0;   
assign afu_tlx_cmd_valid               = (fence_q == 1'b0) ? afu_fen_cmd_valid               : 1'b0;  
assign afu_tlx_cmd_opcode              = (fence_q == 1'b0) ? afu_fen_cmd_opcode              : 8'b0;  
assign afu_tlx_cmd_actag               = (fence_q == 1'b0) ? afu_fen_cmd_actag               : 12'b0;  
assign afu_tlx_cmd_stream_id           = (fence_q == 1'b0) ? afu_fen_cmd_stream_id           : 4'b0;  
assign afu_tlx_cmd_ea_or_obj           = (fence_q == 1'b0) ? afu_fen_cmd_ea_or_obj           : 68'b0;  
assign afu_tlx_cmd_afutag              = (fence_q == 1'b0) ? afu_fen_cmd_afutag              : 16'b0; 
assign afu_tlx_cmd_dl                  = (fence_q == 1'b0) ? afu_fen_cmd_dl                  : 2'b0;  
assign afu_tlx_cmd_pl                  = (fence_q == 1'b0) ? afu_fen_cmd_pl                  : 3'b0;  
assign afu_tlx_cmd_os                  = (fence_q == 1'b0) ? afu_fen_cmd_os                  : 1'b0;  
assign afu_tlx_cmd_be                  = (fence_q == 1'b0) ? afu_fen_cmd_be                  : 64'b0;  
assign afu_tlx_cmd_flag                = (fence_q == 1'b0) ? afu_fen_cmd_flag                : 4'b0;  
assign afu_tlx_cmd_endian              = (fence_q == 1'b0) ? afu_fen_cmd_endian              : 1'b0;  
assign afu_tlx_cmd_bdf                 = (fence_q == 1'b0) ? afu_fen_cmd_bdf                 : 16'b0;
assign afu_tlx_cmd_pasid               = (fence_q == 1'b0) ? afu_fen_cmd_pasid               : 20'b0;  
assign afu_tlx_cmd_pg_size             = (fence_q == 1'b0) ? afu_fen_cmd_pg_size             : 6'b0;  
assign afu_tlx_cdata_valid             = (fence_q == 1'b0) ? afu_fen_cdata_valid             : 1'b0;  
assign afu_tlx_cdata_bus               = (fence_q == 1'b0) ? afu_fen_cdata_bus               : 512'b0;  
assign afu_tlx_cdata_bdi               = (fence_q == 1'b0) ? afu_fen_cdata_bdi               : 1'b0;        
assign afu_tlx_resp_valid              = (fence_q == 1'b0) ? afu_fen_resp_valid              : 1'b0;  
assign afu_tlx_resp_opcode             = (fence_q == 1'b0) ? afu_fen_resp_opcode             : 8'b0;  
assign afu_tlx_resp_dl                 = (fence_q == 1'b0) ? afu_fen_resp_dl                 : 2'b0;
assign afu_tlx_resp_capptag            = (fence_q == 1'b0) ? afu_fen_resp_capptag            : 16'b0;
assign afu_tlx_resp_dp                 = (fence_q == 1'b0) ? afu_fen_resp_dp                 : 2'b0; 
assign afu_tlx_resp_code               = (fence_q == 1'b0) ? afu_fen_resp_code               : 4'b0; 
assign afu_tlx_rdata_valid             = (fence_q == 1'b0) ? afu_fen_rdata_valid             : 1'b0;  
assign afu_tlx_rdata_bus               = (fence_q == 1'b0) ? afu_fen_rdata_bus               : 512'b0;  
assign afu_tlx_rdata_bdi               = (fence_q == 1'b0) ? afu_fen_rdata_bdi               : 1'b0;               



// ==============================================================================================================================
// @@@  F2A: (Fence to AFU MUX) When Fence is active, drive inactive, stable values to AFU.  
//           Note: This might not be necessary if the AFU is going off-line, but it may be important during the time when
//                 the AFU is still configured and going to be reprogrammed, or just after it has been reprogrammed.
// ==============================================================================================================================

assign fen_afu_ready                   = (fence_q == 1'b0) ? tlx_afu_ready                   : 1'b0;
assign fen_afu_cmd_valid               = (fence_q == 1'b0) ? tlx_afu_cmd_valid               : 1'b0;
assign fen_afu_cmd_opcode              = (fence_q == 1'b0) ? tlx_afu_cmd_opcode              : 8'b0;
assign fen_afu_cmd_dl                  = (fence_q == 1'b0) ? tlx_afu_cmd_dl                  : 2'b0;
assign fen_afu_cmd_end                 = (fence_q == 1'b0) ? tlx_afu_cmd_end                 : 1'b0;
assign fen_afu_cmd_pa                  = (fence_q == 1'b0) ? tlx_afu_cmd_pa                  : 64'b0;
assign fen_afu_cmd_flag                = (fence_q == 1'b0) ? tlx_afu_cmd_flag                : 4'b0;
assign fen_afu_cmd_os                  = (fence_q == 1'b0) ? tlx_afu_cmd_os                  : 1'b0;
assign fen_afu_cmd_capptag             = (fence_q == 1'b0) ? tlx_afu_cmd_capptag             : 16'b0;     
assign fen_afu_cmd_pl                  = (fence_q == 1'b0) ? tlx_afu_cmd_pl                  : 3'b0;
assign fen_afu_cmd_be                  = (fence_q == 1'b0) ? tlx_afu_cmd_be                  : 64'b0;  
//x assign fen_afu_cmd_t                   = (fence_q == 1'b0) ? tlx_afu_cmd_t                   : 1'b0;     
assign fen_afu_resp_valid              = (fence_q == 1'b0) ? tlx_afu_resp_valid              : 1'b0;
assign fen_afu_resp_opcode             = (fence_q == 1'b0) ? tlx_afu_resp_opcode             : 8'b0;
assign fen_afu_resp_afutag             = (fence_q == 1'b0) ? tlx_afu_resp_afutag             : 16'b0;    
assign fen_afu_resp_code               = (fence_q == 1'b0) ? tlx_afu_resp_code               : 4'b0;     
assign fen_afu_resp_pg_size            = (fence_q == 1'b0) ? tlx_afu_resp_pg_size            : 6'b0;     
assign fen_afu_resp_dl                 = (fence_q == 1'b0) ? tlx_afu_resp_dl                 : 2'b0;     
assign fen_afu_resp_dp                 = (fence_q == 1'b0) ? tlx_afu_resp_dp                 : 2'b0;    
assign fen_afu_resp_host_tag           = (fence_q == 1'b0) ? tlx_afu_resp_host_tag           : 24'b0;     
assign fen_afu_resp_cache_state        = (fence_q == 1'b0) ? tlx_afu_resp_cache_state        : 4'b0;   
assign fen_afu_resp_addr_tag           = (fence_q == 1'b0) ? tlx_afu_resp_addr_tag           : 18'b0;
assign fen_afu_cmd_data_valid          = (fence_q == 1'b0) ? tlx_afu_cmd_data_valid          : 1'b0;
assign fen_afu_cmd_data_bdi            = (fence_q == 1'b0) ? tlx_afu_cmd_data_bdi            : 1'b0;
assign fen_afu_cmd_data_bus            = (fence_q == 1'b0) ? tlx_afu_cmd_data_bus            : 512'b0;     
assign fen_afu_resp_data_valid         = (fence_q == 1'b0) ? tlx_afu_resp_data_valid         : 1'b0;     
assign fen_afu_resp_data_bdi           = (fence_q == 1'b0) ? tlx_afu_resp_data_bdi           : 1'b0;
assign fen_afu_resp_data_bus           = (fence_q == 1'b0) ? tlx_afu_resp_data_bus           : 512'b0;     
//assign fen_afu_cmd_resp_initial_credit = (fence_q == 1'b0) ? tlx_afu_cmd_resp_initial_credit : 3'b0;
assign fen_afu_cmd_initial_credit      = (fence_q == 1'b0) ? tlx_afu_cmd_initial_credit      : 4'b0;
assign fen_afu_resp_initial_credit     = (fence_q == 1'b0) ? tlx_afu_resp_initial_credit     : 4'b0; 
//assign fen_afu_data_initial_credit     = (fence_q == 1'b0) ? tlx_afu_data_initial_credit     : 5'b0;
assign fen_afu_cmd_data_initial_credit  = (fence_q == 1'b0) ? tlx_afu_cmd_data_initial_credit  : 6'b0;
assign fen_afu_resp_data_initial_credit = (fence_q == 1'b0) ? tlx_afu_resp_data_initial_credit : 6'b0;
assign fen_afu_cmd_credit              = (fence_q == 1'b0) ? tlx_afu_cmd_credit              : 1'b0;            
assign fen_afu_cmd_data_credit         = (fence_q == 1'b0) ? tlx_afu_cmd_data_credit         : 1'b0;  
assign fen_afu_resp_credit             = (fence_q == 1'b0) ? tlx_afu_resp_credit             : 1'b0;
assign fen_afu_resp_data_credit        = (fence_q == 1'b0) ? tlx_afu_resp_data_credit        : 1'b0;
  



// ==============================================================================================================================
// @@@  TCP: Copy of signals for trace purposes
// ==============================================================================================================================

  // -------------------------------------
  // TLX Parser -> Fence Receive Interface
  // -------------------------------------
  reg            reg_tlx_afu_ready                      // When 1, TLX is ready to receive both commands and responses from the AFU
   // Command interface to AFU
; reg    [  6:0] reg_afu_tlx_cmd_initial_credit         // (static) Number of cmd credits available for TLX to use in the AFU      
; reg            reg_afu_tlx_cmd_credit                 // Returns a cmd credit to the TLX
; reg            reg_tlx_afu_cmd_valid                  // Indicates TLX has a valid cmd for AFU to process
; reg    [  7:0] reg_tlx_afu_cmd_opcode                 // (w/cmd_valid) Cmd Opcode
; reg    [  1:0] reg_tlx_afu_cmd_dl                     // (w/cmd_valid) Cmd Data Length (00=rsvd, 01=64B, 10=128B, 11=256B) 
; reg            reg_tlx_afu_cmd_end                    // (w/cmd_valid) Operand Endian-ess 
; reg    [ 63:0] reg_tlx_afu_cmd_pa                     // (w/cmd_valid) Physical Address
; reg    [  3:0] reg_tlx_afu_cmd_flag                   // (w/cmd_valid) Specifies atomic memory operation (unsupported) 
; reg            reg_tlx_afu_cmd_os                     // (w/cmd_valid) Ordered Segment - 1 means ordering is guaranteed (unsupported) 
; reg    [ 15:0] reg_tlx_afu_cmd_capptag                // (w/cmd_valid) Unique operation tag from CAPP unit     
; reg    [  2:0] reg_tlx_afu_cmd_pl                     // (w/cmd_valid) Partial Length (000=1B,001=2B,010=4B,011=8B,100=16B,101=32B,110/111=rsvd)
; reg    [ 63:0] reg_tlx_afu_cmd_be                     // (w/cmd_valid) Byte Enable   
//x ; reg            reg_tlx_afu_cmd_t                      // (w/cmd_valid) Type of configuration read or write (0=type 0, 1=type 1)      
   // Response interface to AFU
; reg    [  6:0] reg_afu_tlx_resp_initial_credit        // (static) Number of resp credits available for TLX to use in the AFU     
; reg            reg_afu_tlx_resp_credit                // Returns a resp credit to the TLX     
; reg            reg_tlx_afu_resp_valid                 // Indicates TLX has a valid resp for AFU to process  
; reg    [  7:0] reg_tlx_afu_resp_opcode                // (w/resp_valid) Resp Opcode     
; reg    [ 15:0] reg_tlx_afu_resp_afutag                // (w/resp_valid) Resp Tag    
; reg    [  3:0] reg_tlx_afu_resp_code                  // (w/resp_valid) Describes the reason for a failed transaction     
; reg    [  5:0] reg_tlx_afu_resp_pg_size               // (w/resp_valid) Page size     
; reg    [  1:0] reg_tlx_afu_resp_dl                    // (w/resp_valid) Resp Data Length (00=rsvd, 01=64B, 10=128B, 11=256B)     
; reg    [  1:0] reg_tlx_afu_resp_dp                    // (w/resp_valid) Data Part, indicates the data content of the current resp packet     
; reg    [ 23:0] reg_tlx_afu_resp_host_tag              // (w/resp_valid) Tag for data held in AFU L1 (unsupported, CAPI 4.0 feature)     
; reg    [  3:0] reg_tlx_afu_resp_cache_state           // (w/resp_valid) Gives cache state of cache line obtained     
; reg    [ 17:0] reg_tlx_afu_resp_addr_tag              // (w/resp_valid) Address translation tag for use by AFU with dot-t format commands
   // Command data interface to AFU
; reg            reg_afu_tlx_cmd_rd_req                 // Command Read Request     
; reg    [  2:0] reg_afu_tlx_cmd_rd_cnt                 // Command Read Count, number of 64B flits requested (000 is not useful)    
; reg            reg_tlx_afu_cmd_data_valid             // Command Data Valid, when 1 valid data is present on cmd_data_bus
; reg            reg_tlx_afu_cmd_data_bdi               // (w/cmd_data_valid) Bad Data Indicator, when 1 data FLIT is corrupted
; reg    [511:0] reg_tlx_afu_cmd_data_bus               // (w/cmd_data_valid) Command Data Bus, contains the command for the AFU to process     
   // Response data interface to AFU
; reg            reg_afu_tlx_resp_rd_req                // Response Read Request     
; reg    [  2:0] reg_afu_tlx_resp_rd_cnt                // Response Read Count, number of 64B flits requested (000 is not useful)      
; reg            reg_tlx_afu_resp_data_valid            // Response Valid, when 1 valid data is present on resp_data     
; reg            reg_tlx_afu_resp_data_bdi              // (w/resp_data_valid) Bad Data Indicator, when 1 data FLIT is corrupted
; reg    [511:0] reg_tlx_afu_resp_data_bus              // (w/resp_data_valid) Response Data, contains data for a read request     
  // --------------------------------------
  // Fence -> TLX Framer Transmit Interface
  // --------------------------------------
  // Initial credit allocation
//; reg    [  2:0] reg_tlx_afu_cmd_resp_initial_credit    // Number of starting credits from TLX for both AFU->TLX cmd and resp interfaces
; reg    [  3:0] reg_tlx_afu_cmd_initial_credit         // Number of starting credits from TLX for AFU->TLX cmd interface
; reg    [  3:0] reg_tlx_afu_resp_initial_credit        // Number of starting credits from TLX for AFU->TLX resp interface
//; reg    [  4:0] reg_tlx_afu_data_initial_credit        // Number of starting credits from TLX for both AFU->TLX cmd and resp data interfaces
; reg    [  5:0] reg_tlx_afu_cmd_data_initial_credit     // Number of starting credits from TLX for AFU->TLX cmd data interface
; reg    [  5:0] reg_tlx_afu_resp_data_initial_credit    // Number of starting credits from TLX for AFU->TLX resp data interface
   // Commands from AFU
; reg            reg_tlx_afu_cmd_credit                
; reg            reg_afu_tlx_cmd_valid                 
; reg    [  7:0] reg_afu_tlx_cmd_opcode                
; reg    [ 11:0] reg_afu_tlx_cmd_actag                 
; reg    [  3:0] reg_afu_tlx_cmd_stream_id             
; reg    [ 67:0] reg_afu_tlx_cmd_ea_or_obj             
; reg    [ 15:0] reg_afu_tlx_cmd_afutag               
; reg    [  1:0] reg_afu_tlx_cmd_dl                    
; reg    [  2:0] reg_afu_tlx_cmd_pl                    
; reg            reg_afu_tlx_cmd_os                    
; reg    [ 63:0] reg_afu_tlx_cmd_be                    
; reg    [  3:0] reg_afu_tlx_cmd_flag                  
; reg            reg_afu_tlx_cmd_endian                
; reg    [ 15:0] reg_afu_tlx_cmd_bdf                    // BDF = Concatenation of 8 bit Bus Number, 5 bit Device Number, and 3 bit Function                  
; reg    [ 19:0] reg_afu_tlx_cmd_pasid                 
; reg    [  5:0] reg_afu_tlx_cmd_pg_size               
   // Command data from AFU
; reg            reg_tlx_afu_cmd_data_credit           
; reg            reg_afu_tlx_cdata_valid               
; reg    [511:0] reg_afu_tlx_cdata_bus                 
; reg            reg_afu_tlx_cdata_bdi                  // When 1, marks command data associated with AFU->host command as bad        
   // Responses from AFU
; reg            reg_tlx_afu_resp_credit               
; reg            reg_afu_tlx_resp_valid                
; reg    [  7:0] reg_afu_tlx_resp_opcode               
; reg    [  1:0] reg_afu_tlx_resp_dl   
; reg    [ 15:0] reg_afu_tlx_resp_capptag          
; reg    [  1:0] reg_afu_tlx_resp_dp                   
; reg    [  3:0] reg_afu_tlx_resp_code                 
   // Response data from AFU
; reg            reg_tlx_afu_resp_data_credit          
; reg            reg_afu_tlx_rdata_valid               
; reg    [511:0] reg_afu_tlx_rdata_bus                 
; reg            reg_afu_tlx_rdata_bdi                  // When 1, marks response data associated with AFU's reply to Host->AFU cmd as bad                
;

always @(posedge(clock))
  begin
      // --------------------------------------
      // TLX Parser -> Fence Receive Interface
      // --------------------------------------
      reg_tlx_afu_ready                    <= tlx_afu_ready
      // Command interface to AFU
    ; reg_afu_tlx_cmd_initial_credit       <= afu_fen_cmd_initial_credit     
    ; reg_afu_tlx_cmd_credit               <= afu_fen_cmd_credit
    ; reg_tlx_afu_cmd_valid                <= tlx_afu_cmd_valid
    ; reg_tlx_afu_cmd_opcode               <= tlx_afu_cmd_opcode
    ; reg_tlx_afu_cmd_dl                   <= tlx_afu_cmd_dl 
    ; reg_tlx_afu_cmd_end                  <= tlx_afu_cmd_end
    ; reg_tlx_afu_cmd_pa                   <= tlx_afu_cmd_pa
    ; reg_tlx_afu_cmd_flag                 <= tlx_afu_cmd_flag 
    ; reg_tlx_afu_cmd_os                   <= tlx_afu_cmd_os 
    ; reg_tlx_afu_cmd_capptag              <= tlx_afu_cmd_capptag     
    ; reg_tlx_afu_cmd_pl                   <= tlx_afu_cmd_pl
    ; reg_tlx_afu_cmd_be                   <= tlx_afu_cmd_be   
//x     ; reg_tlx_afu_cmd_t                    <= tlx_afu_cmd_t     
      // Response interface to AFU
    ; reg_afu_tlx_resp_initial_credit      <= afu_fen_resp_initial_credit     
    ; reg_afu_tlx_resp_credit              <= afu_fen_resp_credit     
    ; reg_tlx_afu_resp_valid               <= tlx_afu_resp_valid  
    ; reg_tlx_afu_resp_opcode              <= tlx_afu_resp_opcode     
    ; reg_tlx_afu_resp_afutag              <= tlx_afu_resp_afutag    
    ; reg_tlx_afu_resp_code                <= tlx_afu_resp_code     
    ; reg_tlx_afu_resp_pg_size             <= tlx_afu_resp_pg_size     
    ; reg_tlx_afu_resp_dl                  <= tlx_afu_resp_dl    
    ; reg_tlx_afu_resp_dp                  <= tlx_afu_resp_dp     
    ; reg_tlx_afu_resp_host_tag            <= tlx_afu_resp_host_tag     
    ; reg_tlx_afu_resp_cache_state         <= tlx_afu_resp_cache_state     
    ; reg_tlx_afu_resp_addr_tag            <= tlx_afu_resp_addr_tag
      // Command data interface to AFU
    ; reg_afu_tlx_cmd_rd_req               <= afu_fen_cmd_rd_req     
    ; reg_afu_tlx_cmd_rd_cnt               <= afu_fen_cmd_rd_cnt    
    ; reg_tlx_afu_cmd_data_valid           <= tlx_afu_cmd_data_valid
    ; reg_tlx_afu_cmd_data_bdi             <= tlx_afu_cmd_data_bdi
    ; reg_tlx_afu_cmd_data_bus             <= tlx_afu_cmd_data_bus     
      // Response data interface to AFU
    ; reg_afu_tlx_resp_rd_req              <= afu_fen_resp_rd_req    
    ; reg_afu_tlx_resp_rd_cnt              <= afu_fen_resp_rd_cnt     
    ; reg_tlx_afu_resp_data_valid          <= tlx_afu_resp_data_valid    
    ; reg_tlx_afu_resp_data_bdi            <= tlx_afu_resp_data_bdi
    ; reg_tlx_afu_resp_data_bus            <= tlx_afu_resp_data_bus   
      // --------------------------------------
      // Fence -> TLX Framer Transmit Interface
      // --------------------------------------
      // Initial credit allocation
//    ; reg_tlx_afu_cmd_resp_initial_credit  <= tlx_afu_cmd_resp_initial_credit
    ; reg_tlx_afu_cmd_initial_credit       <= tlx_afu_cmd_initial_credit
    ; reg_tlx_afu_resp_initial_credit      <= tlx_afu_resp_initial_credit
//    ; reg_tlx_afu_data_initial_credit      <= tlx_afu_data_initial_credit
    ; reg_tlx_afu_cmd_data_initial_credit  <= tlx_afu_cmd_data_initial_credit
    ; reg_tlx_afu_resp_data_initial_credit <= tlx_afu_resp_data_initial_credit
      // Commands from AFU
    ; reg_tlx_afu_cmd_credit               <= tlx_afu_cmd_credit 
    ; reg_afu_tlx_cmd_valid                <= afu_fen_cmd_valid 
    ; reg_afu_tlx_cmd_opcode               <= afu_fen_cmd_opcode 
    ; reg_afu_tlx_cmd_actag                <= afu_fen_cmd_actag 
    ; reg_afu_tlx_cmd_stream_id            <= afu_fen_cmd_stream_id 
    ; reg_afu_tlx_cmd_ea_or_obj            <= afu_fen_cmd_ea_or_obj 
    ; reg_afu_tlx_cmd_afutag               <= afu_fen_cmd_afutag
    ; reg_afu_tlx_cmd_dl                   <= afu_fen_cmd_dl 
    ; reg_afu_tlx_cmd_pl                   <= afu_fen_cmd_pl 
    ; reg_afu_tlx_cmd_os                   <= afu_fen_cmd_os 
    ; reg_afu_tlx_cmd_be                   <= afu_fen_cmd_be 
    ; reg_afu_tlx_cmd_flag                 <= afu_fen_cmd_flag 
    ; reg_afu_tlx_cmd_endian               <= afu_fen_cmd_endian 
    ; reg_afu_tlx_cmd_bdf                  <= afu_fen_cmd_bdf                  
    ; reg_afu_tlx_cmd_pasid                <= afu_fen_cmd_pasid 
    ; reg_afu_tlx_cmd_pg_size              <= afu_fen_cmd_pg_size  
      // Command data from AFU
    ; reg_tlx_afu_cmd_data_credit          <= tlx_afu_cmd_data_credit 
    ; reg_afu_tlx_cdata_valid              <= afu_fen_cdata_valid 
    ; reg_afu_tlx_cdata_bus                <= afu_fen_cdata_bus 
    ; reg_afu_tlx_cdata_bdi                <= afu_fen_cdata_bdi        
      // Responses from AFU
    ; reg_tlx_afu_resp_credit              <= tlx_afu_resp_credit 
    ; reg_afu_tlx_resp_valid               <= afu_fen_resp_valid 
    ; reg_afu_tlx_resp_opcode              <= afu_fen_resp_opcode 
    ; reg_afu_tlx_resp_dl                  <= afu_fen_resp_dl
    ; reg_afu_tlx_resp_capptag             <= afu_fen_resp_capptag
    ; reg_afu_tlx_resp_dp                  <= afu_fen_resp_dp 
    ; reg_afu_tlx_resp_code                <= afu_fen_resp_code 
      // Response data from AFU
    ; reg_tlx_afu_resp_data_credit         <= tlx_afu_resp_data_credit 
    ; reg_afu_tlx_rdata_valid              <= afu_fen_rdata_valid 
    ; reg_afu_tlx_rdata_bus                <= afu_fen_rdata_bus 
    ; reg_afu_tlx_rdata_bdi                <= afu_fen_rdata_bdi                
    ;
  end

// Assign groups of register outputs to trace output vectors
assign fen_trace_vector = {
    reg_tlx_afu_ready                      
    // Command interface to AFU
  , reg_afu_tlx_cmd_initial_credit               
  , reg_afu_tlx_cmd_credit                 
  , reg_tlx_afu_cmd_valid                  
  , reg_tlx_afu_cmd_opcode                 
  , reg_tlx_afu_cmd_dl                     
  , reg_tlx_afu_cmd_end                    
  , reg_tlx_afu_cmd_pa                    
  , reg_tlx_afu_cmd_flag                   
  , reg_tlx_afu_cmd_os                     
  , reg_tlx_afu_cmd_capptag                
  , reg_tlx_afu_cmd_pl                     
  , reg_tlx_afu_cmd_be                       
//x  , reg_tlx_afu_cmd_t                           
   // Response interface to AFU
  , reg_afu_tlx_resp_initial_credit             
  , reg_afu_tlx_resp_credit                    
  , reg_tlx_afu_resp_valid                  
  , reg_tlx_afu_resp_opcode                    
  , reg_tlx_afu_resp_afutag                    
  , reg_tlx_afu_resp_code                     
  , reg_tlx_afu_resp_pg_size                   
  , reg_tlx_afu_resp_dl                         
  , reg_tlx_afu_resp_dp                         
  , reg_tlx_afu_resp_host_tag                 
  , reg_tlx_afu_resp_cache_state               
  , reg_tlx_afu_resp_addr_tag              
   // Command data interface to AFU
  , reg_afu_tlx_cmd_rd_req                      
  , reg_afu_tlx_cmd_rd_cnt                     
  , reg_tlx_afu_cmd_data_valid             
  , reg_tlx_afu_cmd_data_bdi               
  , reg_tlx_afu_cmd_data_bus                    
   // Response data interface to AFU
  , reg_afu_tlx_resp_rd_req                    
  , reg_afu_tlx_resp_rd_cnt                      
  , reg_tlx_afu_resp_data_valid                
  , reg_tlx_afu_resp_data_bdi             
  , reg_tlx_afu_resp_data_bus                   
  // --------------------------------------
  // Fence -> TLX Framer Transmit Interface
  // --------------------------------------
  // Initial credit allocation
// , reg_tlx_afu_cmd_resp_initial_credit   
  , reg_tlx_afu_cmd_initial_credit   
  , reg_tlx_afu_resp_initial_credit   
//  , reg_tlx_afu_data_initial_credit        
  , reg_tlx_afu_cmd_data_initial_credit        
  , reg_tlx_afu_resp_data_initial_credit        
   // Commands from AFU
  , reg_tlx_afu_cmd_credit                
  , reg_afu_tlx_cmd_valid                 
  , reg_afu_tlx_cmd_opcode                
  , reg_afu_tlx_cmd_actag                 
  , reg_afu_tlx_cmd_stream_id             
  , reg_afu_tlx_cmd_ea_or_obj             
  , reg_afu_tlx_cmd_afutag               
  , reg_afu_tlx_cmd_dl                    
  , reg_afu_tlx_cmd_pl                    
  , reg_afu_tlx_cmd_os                    
  , reg_afu_tlx_cmd_be                    
  , reg_afu_tlx_cmd_flag                  
  , reg_afu_tlx_cmd_endian                
  , reg_afu_tlx_cmd_bdf                                     
  , reg_afu_tlx_cmd_pasid                 
  , reg_afu_tlx_cmd_pg_size               
   // Command data from AFU
  , reg_tlx_afu_cmd_data_credit           
  , reg_afu_tlx_cdata_valid               
  , reg_afu_tlx_cdata_bus                 
  , reg_afu_tlx_cdata_bdi                          
   // Responses from AFU
  , reg_tlx_afu_resp_credit               
  , reg_afu_tlx_resp_valid                
  , reg_afu_tlx_resp_opcode               
  , reg_afu_tlx_resp_dl   
  , reg_afu_tlx_resp_capptag          
  , reg_afu_tlx_resp_dp                   
  , reg_afu_tlx_resp_code                 
   // Response data from AFU
  , reg_tlx_afu_resp_data_credit          
  , reg_afu_tlx_rdata_valid               
  , reg_afu_tlx_rdata_bus                 
  , reg_afu_tlx_rdata_bdi                                 
  };

endmodule 
