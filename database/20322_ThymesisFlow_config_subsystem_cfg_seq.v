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
// Title    : cfg_seq.v
// Function : This file contains a logic to execute config_write and config_read commands. First it arbitrates between
//            multiple TLX instances to determine the next command (round robin arbitration). Then it executes the 
//            selected command in its entirety (i.e. one cmd at a time). It considers a configuration command as finished
//            after the response and response data (if present) is loaded into a response FIFO.
//
//            Current limitation of the implementation is 4 TLX instances. However the arbitration method was chosen 
//            to be easily extendable to more.
//
//  NOTE: Use `define variables to expose or internally tie off ports 1, 2, and 3. The `define can be included in this file
//        or applied externally in the environment when performing simulation or synthesis. If applied here, uncomment one or 
//        more of the lines below. Port 0 always exists, and while not a requirement, the intent is to add ports in increasing 
//        numerical order to make tracing and debug eaiser.
//        Important: Wherever it is applied, the define must apply to both cfg_func0.v and cfg_seq.v 
// `define EXPOSE_CFG_PORT_1
// `define EXPOSE_CFG_PORT_2
// `define EXPOSE_CFG_PORT_3
//
// -------------------------------------------------------------------
// Modification History :
//                               |Version    |     |Author     |Description of change
//                               |-----------|     |--------   |---------------------
  `define CFG_SEQ_VERSION         14_Feb_2019   //              Added unaligned checking on config_reads  
// -------------------------------------------------------------------


// ==============================================================================================================================
// @@@  Module Declaration
// ==============================================================================================================================
module cfg_seq (
    input         clock                       // Clock - samples & launches data on rising edge
  , input         reset                       // When 1, reset registers to an empty FIFO state
  
    // Information about instantiation
  , input   [4:0] device_num                  // Propagate down from Device input
  , input   [7:0] functions_attached          // For each Function attached, set the bit to 1 corresponding to its number (i.e. Func 0,1 = 8'h03)

    // Port 0: From CMD FIFO
  , input   [1:0] cfg0_portnum                // Hardcoded port number associated with this TLX instance (use vector for future expansion)
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input   [7:0] cfg0_cff_cmd_opcode
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input  [31:0] cfg0_cff_cmd_pa             // Per OpenCAPI TL spec, pa[63:32] are 'reserved' so don't use them to conserve FPGA resources
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input  [15:0] cfg0_cff_cmd_capptag
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input         cfg0_cff_cmd_t
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input   [2:0] cfg0_cff_cmd_pl
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input         cfg0_cff_data_bdi
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input  [31:0] cfg0_cff_data_bus
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input         cfg0_cff_cmd_valid          // Set to 1 when a command is pending at the FIFO output
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output        cfg0_cmd_dispatched         // Pulse to 1 to increment read FIFO pointer to present the next FIFO entry
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output  [7:0] cfg0_bus_num                // Propagate to anyone who may need to use it
  , output  [4:0] cfg0_device_num

`ifdef EXPOSE_CFG_PORT_1
   // Port 1: From CMD FIFO
  , input   [1:0] cfg1_portnum                // Hardcoded port number associated with this TLX instance (use vector for future expansion)
  , input   [7:0] cfg1_cff_cmd_opcode
  , input  [31:0] cfg1_cff_cmd_pa             // Per OpenCAPI TL spec, pa[63:32] are 'reserved' so don't use them to conserve FPGA resources
  , input  [15:0] cfg1_cff_cmd_capptag
  , input         cfg1_cff_cmd_t
  , input   [2:0] cfg1_cff_cmd_pl
  , input         cfg1_cff_data_bdi
  , input  [31:0] cfg1_cff_data_bus
  , input         cfg1_cff_cmd_valid          // Set to 1 when a command is pending at the FIFO output
  , output        cfg1_cmd_dispatched         // Pulse to 1 to increment read FIFO pointer to present the next FIFO entry
  , output  [7:0] cfg1_bus_num                // Propagate to anyone who may need to use it
  , output  [4:0] cfg1_device_num
`endif

`ifdef EXPOSE_CFG_PORT_2
   // Port 2: From CMD FIFO
  , input   [1:0] cfg2_portnum                // Hardcoded port number associated with this TLX instance (use vector for future expansion)
  , input   [7:0] cfg2_cff_cmd_opcode
  , input  [31:0] cfg2_cff_cmd_pa             // Per OpenCAPI TL spec, pa[63:32] are 'reserved' so don't use them to conserve FPGA resources
  , input  [15:0] cfg2_cff_cmd_capptag
  , input         cfg2_cff_cmd_t
  , input   [2:0] cfg2_cff_cmd_pl
  , input         cfg2_cff_data_bdi
  , input  [31:0] cfg2_cff_data_bus
  , input         cfg2_cff_cmd_valid          // Set to 1 when a command is pending at the FIFO output
  , output        cfg2_cmd_dispatched         // Pulse to 1 to increment read FIFO pointer to present the next FIFO entry
  , output  [7:0] cfg2_bus_num                // Propagate to anyone who may need to use it
  , output  [4:0] cfg2_device_num
`endif

`ifdef EXPOSE_CFG_PORT_3
   // Port 3: From CMD FIFO
  , input   [1:0] cfg3_portnum                // Hardcoded port number associated with this TLX instance (use vector for future expansion)
  , input   [7:0] cfg3_cff_cmd_opcode
  , input  [31:0] cfg3_cff_cmd_pa             // Per OpenCAPI TL spec, pa[63:32] are 'reserved' so don't use them to conserve FPGA resources
  , input  [15:0] cfg3_cff_cmd_capptag
  , input         cfg3_cff_cmd_t
  , input   [2:0] cfg3_cff_cmd_pl
  , input         cfg3_cff_data_bdi
  , input  [31:0] cfg3_cff_data_bus
  , input         cfg3_cff_cmd_valid          // Set to 1 when a command is pending at the FIFO output
  , output        cfg3_cmd_dispatched         // Pulse to 1 to increment read FIFO pointer to present the next FIFO entry
  , output  [7:0] cfg3_bus_num                // Propagate to anyone who may need to use it
  , output  [4:0] cfg3_device_num
`endif

   // Port 0: To RESP FIFO  
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output        cfg0_rff_resp_valid         // Pulse to 1 when response and/or resp data is available for loading into response FIFO
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output  [7:0] cfg0_rff_resp_opcode        // Info to load into response FIFO
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output  [3:0] cfg0_rff_resp_code 
//, output  [1:0] cfg0_rff_resp_dl            The TLX will fill in dL=01 and dP=00 as only 1 FLIT is ever used. Comment vs. remove lines here in case another TLX operates differently.
//, output  [1:0] cfg0_rff_resp_dp            The TLX will fill in dL=01 and dP=00 as only 1 FLIT is ever used. Comment vs. remove lines here in case another TLX operates differently.
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output [15:0] cfg0_rff_resp_capptag 
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output  [3:0] cfg0_rff_rdata_offset 
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output        cfg0_rff_rdata_bdi 
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output [31:0] cfg0_rff_rdata_bus 
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input   [3:0] cfg0_rff_buffers_available  // Used to determine when can send something to the response FIFO  

`ifdef EXPOSE_CFG_PORT_1
   // Port 1: To RESP FIFO
  , output        cfg1_rff_resp_valid         // Pulse to 1 when response and/or resp data is available for loading into response FIFO
  , output  [7:0] cfg1_rff_resp_opcode 
  , output  [3:0] cfg1_rff_resp_code 
//, output  [1:0] cfg1_rff_resp_dl 
//, output  [1:0] cfg1_rff_resp_dp 
  , output [15:0] cfg1_rff_resp_capptag 
  , output  [3:0] cfg1_rff_rdata_offset 
  , output        cfg1_rff_rdata_bdi 
  , output [31:0] cfg1_rff_rdata_bus 
  , input   [3:0] cfg1_rff_buffers_available  // Used to determine when can send something to the response FIFO    
`endif

`ifdef EXPOSE_CFG_PORT_2
   // Port 2: To RESP FIFO
  , output        cfg2_rff_resp_valid         // Pulse to 1 when response and/or resp data is available for loading into response FIFO
  , output  [7:0] cfg2_rff_resp_opcode 
  , output  [3:0] cfg2_rff_resp_code 
//, output  [1:0] cfg2_rff_resp_dl 
//, output  [1:0] cfg2_rff_resp_dp 
  , output [15:0] cfg2_rff_resp_capptag 
  , output  [3:0] cfg2_rff_rdata_offset 
  , output        cfg2_rff_rdata_bdi 
  , output [31:0] cfg2_rff_rdata_bus 
  , input   [3:0] cfg2_rff_buffers_available  // Used to determine when can send something to the response FIFO    
`endif

`ifdef EXPOSE_CFG_PORT_3
   // Port 3: To RESP FIFO
  , output        cfg3_rff_resp_valid         // Pulse to 1 when response and/or resp data is available for loading into response FIFO
  , output  [7:0] cfg3_rff_resp_opcode 
  , output  [3:0] cfg3_rff_resp_code 
//, output  [1:0] cfg3_rff_resp_dl 
//, output  [1:0] cfg3_rff_resp_dp 
  , output [15:0] cfg3_rff_resp_capptag 
  , output  [3:0] cfg3_rff_rdata_offset 
  , output        cfg3_rff_rdata_bdi 
  , output [31:0] cfg3_rff_rdata_bus 
  , input   [3:0] cfg3_rff_buffers_available  // Used to determine when can send something to the response FIFO    
`endif


   // CFG_SEQ -> CFG_F* Functional Interface
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output  [2:0] cfg_function
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output  [1:0] cfg_portnum                  
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output [11:0] cfg_addr                     
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output [31:0] cfg_wdata                    
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input  [31:0] cfg_rdata                 // OR together Function outputs
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input         cfg_rdata_vld             // OR together Function outputs             
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output        cfg_wr_1B                    
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output        cfg_wr_2B                    
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output        cfg_wr_4B                    
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output        cfg_rd                       
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input         cfg_bad_op_or_align       // OR together Function outputs 
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    input         cfg_addr_not_implemented  // OR together Function outputs   
    // Error conditions

    // Supplemental Error Information - The AFU may optionally provide a means for CFG errors & error information to be reported to the host
//, `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
//  output [127:0] cfg_cfw_errvec
//, `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
//  output         cfg_cfw_errvec_valid
//, `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
//  output [127:0] cfg_cfr_errvec
//, `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
//  output         cfg_cfr_errvec_valid
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output [127:0] cfg_errvec
  , `ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
    output         cfg_errvec_valid


) ;


// ==============================================================================================================================
// @@@  ARB: Arbitrate between command FIFOs to select the next command to execute
// ==============================================================================================================================
// Note: Design this as if there were 4 TLX instances to help show how it would expand.


// Declare and tie off Port if not configured
`ifdef EXPOSE_CFG_PORT_1
  // If exposed, signals are declared and assigned as module ports.
`else
  wire  [1:0] cfg1_portnum;               
  wire  [7:0] cfg1_cff_cmd_opcode;
  wire [31:0] cfg1_cff_cmd_pa;                   // Per OpenCAPI TL spec, pa[63:32] are 'reserved' so don't use them to conserve FPGA resources
  wire [15:0] cfg1_cff_cmd_capptag;
  wire        cfg1_cff_cmd_t;
  wire  [2:0] cfg1_cff_cmd_pl;
  wire        cfg1_cff_data_bdi;
  wire [31:0] cfg1_cff_data_bus;
  wire        cfg1_cff_cmd_valid;         
  wire        cfg1_cmd_dispatched; 
  wire  [3:0] cfg1_rff_buffers_available;       
  assign cfg1_portnum               = 2'b01;           // Assign proper port number
  assign cfg1_cff_cmd_opcode        = 8'h00;
  assign cfg1_cff_cmd_pa            = 32'h0000_0000;
  assign cfg1_cff_cmd_capptag       = 16'h0000;
  assign cfg1_cff_cmd_t             = 1'b0;
  assign cfg1_cff_cmd_pl            = 3'b000;
  assign cfg1_cff_data_bdi          = 1'b0;
  assign cfg1_cff_data_bus          = 32'h0000_0000;
  assign cfg1_cff_cmd_valid         = 1'b0;            // Tie inactive
  assign cfg1_rff_buffers_available = 4'b0000;         // No space in RESP FIFO since it doesn't exist
`endif


// Declare and tie off Port if not configured
`ifdef EXPOSE_CFG_PORT_2
  // If exposed, signals are declared and assigned as module ports.
`else
  wire  [1:0] cfg2_portnum;               
  wire  [7:0] cfg2_cff_cmd_opcode;
  wire [31:0] cfg2_cff_cmd_pa;                   // Per OpenCAPI TL spec, pa[63:32] are 'reserved' so don't use them to conserve FPGA resources
  wire [15:0] cfg2_cff_cmd_capptag;
  wire        cfg2_cff_cmd_t;
  wire  [2:0] cfg2_cff_cmd_pl;
  wire        cfg2_cff_data_bdi;
  wire [31:0] cfg2_cff_data_bus;
  wire        cfg2_cff_cmd_valid;         
  wire        cfg2_cmd_dispatched; 
  wire  [3:0] cfg2_rff_buffers_available;       
  assign cfg2_portnum               = 2'b10;           // Assign proper port number
  assign cfg2_cff_cmd_opcode        = 8'h00;
  assign cfg2_cff_cmd_pa            = 32'h0000_0000;
  assign cfg2_cff_cmd_capptag       = 16'h0000;
  assign cfg2_cff_cmd_t             = 1'b0;
  assign cfg2_cff_cmd_pl            = 3'b000;
  assign cfg2_cff_data_bdi          = 1'b0;
  assign cfg2_cff_data_bus          = 32'h0000_0000;
  assign cfg2_cff_cmd_valid         = 1'b0;            // Tie inactive
  assign cfg2_rff_buffers_available = 4'b0000;         // No space in RESP FIFO since it doesn't exist
`endif


// Declare and tie off Port if not configured
`ifdef EXPOSE_CFG_PORT_3
  // If exposed, signals are declared and assigned as module ports.
`else
  wire  [1:0] cfg3_portnum;               
  wire  [7:0] cfg3_cff_cmd_opcode;
  wire [31:0] cfg3_cff_cmd_pa;                   // Per OpenCAPI TL spec, pa[63:32] are 'reserved' so don't use them to conserve FPGA resources
  wire [15:0] cfg3_cff_cmd_capptag;
  wire        cfg3_cff_cmd_t;
  wire  [2:0] cfg3_cff_cmd_pl;
  wire        cfg3_cff_data_bdi;
  wire [31:0] cfg3_cff_data_bus;
  wire        cfg3_cff_cmd_valid;         
  wire        cfg3_cmd_dispatched; 
  wire  [3:0] cfg3_rff_buffers_available;       
  assign cfg3_portnum               = 2'b11;           // Assign proper port number
  assign cfg3_cff_cmd_opcode        = 8'h00;
  assign cfg3_cff_cmd_pa            = 32'h0000_0000;
  assign cfg3_cff_cmd_capptag       = 16'h0000;
  assign cfg3_cff_cmd_t             = 1'b0;
  assign cfg3_cff_cmd_pl            = 3'b000;
  assign cfg3_cff_data_bdi          = 1'b0;
  assign cfg3_cff_data_bus          = 32'h0000_0000;
  assign cfg3_cff_cmd_valid         = 1'b0;            // Tie inactive
  assign cfg3_rff_buffers_available = 4'b0000;         // No space in RESP FIFO since it doesn't exist
`endif


// Arbitrate between sources (round robin)
//
// Implementation Notes:
// Since there are only a few sources, this implementation uses a priority encoder to select the source. 
// If the number of sources was much higher, a different implementation may be needed to meet timing.
// The priority encoder chooses bits to the left over bits to the right.
// Into the priority encoder goes a vector of 'valid' (i.e. request) signals consisting of a masked copy 
// on the left, appended to a raw copy on the right. The previous choice of source determines the mask,
// forcing all the source valid's up to and including the last source to 0. This means sources to the right
// will have higher priority, allowing lower priority ports first access. If the lowest priority port
// was selected last time, the appending of an unmasked copy of the valid's to the right creates a 'wrap'
// in priority to circle back to the beginning. 

wire [3:0] valid_vector;    // Concatenate cmd valid sources
assign valid_vector  = {cfg0_cff_cmd_valid, cfg1_cff_cmd_valid, cfg2_cff_cmd_valid, cfg3_cff_cmd_valid};

reg  [3:0] select_mask;     // Carries history of last selected source
wire [7:0] masked_valids;   // Create masked copy appended to raw valid vector (note width is twice the number of sources)
assign masked_valids = {{valid_vector & select_mask}, valid_vector}; 

wire       cmd_dispatched;   // Pulsed to 1 when state machine has finished executing the selected command
reg    cfw_cmd_dispatched;   // From config_write state machine
reg    cfr_cmd_dispatched;   // From config_read  state machine
reg    bop_cmd_dispatched;   // From bad opcode   state machine
assign cmd_dispatched = cfw_cmd_dispatched | cfr_cmd_dispatched | bop_cmd_dispatched;   // combined 'dispatched' signal

wire   select_new_source;    
// (assign later after state machines are declared)

reg  [3:0] selected_config; // One-hot vector indicating which source is currently selected
always @(posedge(clock))
  if (reset == 1'b1)
    begin
      selected_config <= 4'b1000;   // Select TLX 0 as default, since there should always be at least 1 TLX port
      select_mask     <= 4'b1111;   // TLX 0 has highest priority
    end
  else if (select_new_source == 1'b1)  // State Machine is idle, make a new selection
    casez (masked_valids)              // Use 'casez' so ? can map to any bit value in lower priority positions
      8'b0000_0000: begin  selected_config <= 4'b1000;  select_mask <= 4'b1111;  end  // No command is valid, set to default conditions
      8'b1???_????: begin  selected_config <= 4'b1000;  select_mask <= 4'b0111;  end  // choose TLX 0, mask set so TLX 1-n have next priority
      8'b01??_????: begin  selected_config <= 4'b0100;  select_mask <= 4'b0011;  end  // choose TLX 1, mask set so TLX 2-n have next priority
      8'b001?_????: begin  selected_config <= 4'b0010;  select_mask <= 4'b0001;  end  // choose TLX 2, mask set so TLX 3-n have next priority
      8'b0001_????: begin  selected_config <= 4'b0001;  select_mask <= 4'b1111;  end  // choose TLX 3, mask set so TLX 0-n have next priority
      8'b0000_1???: begin  selected_config <= 4'b1000;  select_mask <= 4'b0111;  end  // choose TLX 0, mask set so TLX 1-n have next priority
      8'b0000_01??: begin  selected_config <= 4'b0100;  select_mask <= 4'b0011;  end  // choose TLX 1, mask set so TLX 2-n have next priority
      8'b0000_001?: begin  selected_config <= 4'b0010;  select_mask <= 4'b0001;  end  // choose TLX 2, mask set so TLX 3-n have next priority
      8'b0000_0001: begin  selected_config <= 4'b0001;  select_mask <= 4'b1111;  end  // choose TLX 3, mask set so TLX 0-n have next priority
    endcase
  else                                     // State machine is executing the selected command OR no config command is being presented
    begin
      selected_config <= selected_config;  // Hold in case State machine is executing the last selected command
      select_mask     <= select_mask;      // Preserve the last selection to enable fairness
    end  

// Arbitrator outputs contain the selected command to execute
reg   [1:0] arb_portnum;               
reg   [7:0] arb_cmd_opcode;
reg  [31:0] arb_cmd_pa;
reg  [15:0] arb_cmd_capptag;
reg         arb_cmd_t;
reg   [2:0] arb_cmd_pl;
reg         arb_data_bdi;
reg  [31:0] arb_data_bus;
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
reg         arb_cmd_valid;         
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
reg   [3:0] arb_rff_buffers_available;

always @(*)  // Combinational logic
  case (selected_config)
    4'b1000: begin
               arb_portnum               = cfg0_portnum;               // From CMD FIFO
               arb_cmd_opcode            = cfg0_cff_cmd_opcode;
               arb_cmd_pa                = cfg0_cff_cmd_pa;
               arb_cmd_capptag           = cfg0_cff_cmd_capptag;
               arb_cmd_t                 = cfg0_cff_cmd_t;
               arb_cmd_pl                = cfg0_cff_cmd_pl;
               arb_data_bdi              = cfg0_cff_data_bdi;
               arb_data_bus              = cfg0_cff_data_bus;
               arb_cmd_valid             = cfg0_cff_cmd_valid;   
               arb_rff_buffers_available = cfg0_rff_buffers_available; // From RESP FIFO       
             end
    4'b0100: begin
               arb_portnum               = cfg1_portnum;               // From CMD FIFO
               arb_cmd_opcode            = cfg1_cff_cmd_opcode;
               arb_cmd_pa                = cfg1_cff_cmd_pa;
               arb_cmd_capptag           = cfg1_cff_cmd_capptag;
               arb_cmd_t                 = cfg1_cff_cmd_t;
               arb_cmd_pl                = cfg1_cff_cmd_pl;
               arb_data_bdi              = cfg1_cff_data_bdi;
               arb_data_bus              = cfg1_cff_data_bus;
               arb_cmd_valid             = cfg1_cff_cmd_valid;   
               arb_rff_buffers_available = cfg1_rff_buffers_available; // From RESP FIFO       
             end
    4'b0010: begin
               arb_portnum               = cfg2_portnum;               // From CMD FIFO
               arb_cmd_opcode            = cfg2_cff_cmd_opcode;
               arb_cmd_pa                = cfg2_cff_cmd_pa;
               arb_cmd_capptag           = cfg2_cff_cmd_capptag;
               arb_cmd_t                 = cfg2_cff_cmd_t;
               arb_cmd_pl                = cfg2_cff_cmd_pl;
               arb_data_bdi              = cfg2_cff_data_bdi;
               arb_data_bus              = cfg2_cff_data_bus;
               arb_cmd_valid             = cfg2_cff_cmd_valid;   
               arb_rff_buffers_available = cfg2_rff_buffers_available; // From RESP FIFO       
             end
    4'b0001: begin
               arb_portnum               = cfg3_portnum;               // From CMD FIFO
               arb_cmd_opcode            = cfg3_cff_cmd_opcode;
               arb_cmd_pa                = cfg3_cff_cmd_pa;
               arb_cmd_capptag           = cfg3_cff_cmd_capptag;
               arb_cmd_t                 = cfg3_cff_cmd_t;
               arb_cmd_pl                = cfg3_cff_cmd_pl;
               arb_data_bdi              = cfg3_cff_data_bdi;
               arb_data_bus              = cfg3_cff_data_bus;
               arb_cmd_valid             = cfg3_cff_cmd_valid;   
               arb_rff_buffers_available = cfg3_rff_buffers_available; // From RESP FIFO       
             end
    default: begin   // Should never happen, but if it does choose TLX 0
               arb_portnum               = cfg0_portnum;               // From CMD FIFO
               arb_cmd_opcode            = cfg0_cff_cmd_opcode;
               arb_cmd_pa                = cfg0_cff_cmd_pa;
               arb_cmd_capptag           = cfg0_cff_cmd_capptag;
               arb_cmd_t                 = cfg0_cff_cmd_t;
               arb_cmd_pl                = cfg0_cff_cmd_pl;
               arb_data_bdi              = cfg0_cff_data_bdi;
               arb_data_bus              = cfg0_cff_data_bus;
               arb_cmd_valid             = cfg0_cff_cmd_valid;   
               arb_rff_buffers_available = cfg0_rff_buffers_available; // From RESP FIFO       
             end
  endcase

// After command is executed, tell selected FIFO to advance to the next command
assign cfg0_cmd_dispatched = (cmd_dispatched == 1'b1 && selected_config == 4'b1000) ? 1'b1 : 1'b0;
assign cfg1_cmd_dispatched = (cmd_dispatched == 1'b1 && selected_config == 4'b0100) ? 1'b1 : 1'b0;
assign cfg2_cmd_dispatched = (cmd_dispatched == 1'b1 && selected_config == 4'b0010) ? 1'b1 : 1'b0;
assign cfg3_cmd_dispatched = (cmd_dispatched == 1'b1 && selected_config == 4'b0001) ? 1'b1 : 1'b0;


// ==============================================================================================================================
// @@@  OPD: Operation Decode
// ==============================================================================================================================

wire [7:0] arb_cmd_bus;
wire [4:0] arb_cmd_device;
wire [2:0] arb_cmd_function;
assign arb_cmd_bus      = arb_cmd_pa[31:24];  // Extract values from config_write address field
assign arb_cmd_device   = arb_cmd_pa[23:19];
assign arb_cmd_function = arb_cmd_pa[18:16];

`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
wire   start_config_write;         
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
wire   start_config_read;
assign start_config_write = (arb_cmd_valid == 1'b1 && arb_cmd_opcode == 8'hE1);
assign start_config_read  = (arb_cmd_valid == 1'b1 && arb_cmd_opcode == 8'hE0);

// --- Error conditions ---
//
// Error conditions will log an error, which may be passed on to the AFU if it supports reporting errors on behalf of the 
// configuration sub-system. These should be treated as fatal errors even though CFG_SEQ may or may not stop processing commands.  

`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
wire   detect_bad_op;              // Opcode is not recognized (fatal error since CFG_SEQ will hang as no logic will generate 'cmd_dispatched')
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
wire   dev_func_mismatch;          // Device or Function number in the cmd does not match implemented values (recoverable error)
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
wire   tbit_is_1;                  // T bit in cmd is not 0 (recoverable error)
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
wire   pl_is_invalid;              // pL must be 1B (000), 2B (001), or 4B (010) on config_* commands
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
wire   data_is_bad;                // If BDI on write data is 1, suppress the write and consider it an error
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
wire   errors_detected_wr;         // Summary of all errors (for config_write)
`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
wire   errors_detected_rd;         // Summary of all errors (for config_read)

assign detect_bad_op      = (arb_cmd_valid == 1'b1 && !(start_config_write | start_config_read) ) ? 1'b1 : 1'b0;
assign dev_func_mismatch  = (arb_cmd_valid == 1'b1 && (arb_cmd_device != device_num || functions_attached[arb_cmd_function] != 1'b1) ) ? 1'b1 : 1'b0;
assign tbit_is_1          = (arb_cmd_valid == 1'b1 && arb_cmd_t == 1'b1) ? 1'b1 : 1'b0;
assign pl_is_invalid      = (arb_cmd_valid == 1'b1 && !(arb_cmd_pl == 3'b000 || arb_cmd_pl == 3'b001 || arb_cmd_pl == 3'b010)) ? 1'b1 : 1'b0;
assign data_is_bad        = (arb_cmd_valid == 1'b1 && arb_data_bdi == 1'b1) ? 1'b1 : 1'b0;
assign errors_detected_wr = detect_bad_op | dev_func_mismatch | tbit_is_1 | pl_is_invalid | data_is_bad ;
assign errors_detected_rd = detect_bad_op | dev_func_mismatch | tbit_is_1 | pl_is_invalid ; // Ignore incoming BDI on config_read



// ==============================================================================================================================
// @@@ BOP: Bad (a.k.a. unrecognized, invalid) Opcode state machine
// ==============================================================================================================================
// Since we don't know what the command is, return a fail response code and clear the bad opcode from the CMD FIFO to keep going.

reg         bop_resp_valid;
reg   [7:0] bop_resp_opcode;
reg   [3:0] bop_resp_code; 
//g   [1:0] bop_resp_dl;
//g   [1:0] bop_resp_dp;
reg  [15:0] bop_resp_capptag;
reg   [3:0] bop_rdata_offset;
reg         bop_rdata_bdi;
reg  [31:0] bop_rdata_bus;

reg [127:0] bop_errvec;          // Error information to save and (optionally) pass to the AFU
reg         bop_errvec_valid;

`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
reg [2:0]  SM_BOP;           
parameter  SM_BOP_IDLE          = 3'b000;
//rameter  SM_BOP_WAIT1         = 3'b001;    // Just skip these states. That way FORM_RESPONSE and WAIT2NEXT_CMD are always the same number.
//rameter  SM_BOP_WAIT2         = 3'b010;
parameter  SM_BOP_FORM_RESPONSE = 3'b011;    
parameter  SM_BOP_WAIT4NEXT_CMD = 3'b100;
parameter  SM_BOP_ERROR         = 3'b111;    // May not be necessary, but define for possible future use

always @(posedge(clock))
  if (SM_BOP == SM_BOP_IDLE) 
    begin
      // If opcode is unrecognized and space is available in the response buffer, form error response and errvec in next cycle
      if (detect_bad_op == 1'b1 && arb_rff_buffers_available >= 4'b0001)
        begin
          // Nothing to do, just wait for state machine to advance to FORM_RESPONSE
        end
      else      // No command is valid, it is a valid config_write or config_read, or no Response buffer entry is available
        begin
          // Nothing to do, state machine will just wait here
        end
    end
  else          // Not in this state
    begin
      // Nothing to do
    end

// FORM_RESPONSE: Since an error occurred, prepare a fail response. Also save error information and generate interrupt. 
//                Since a response buffer slot is known to be present (checked before command was started), 
//                indicate the command is complete and return to IDLE state.
// NOTE: The OpenCAPI TL architecture doesn't specify which response type to issue on a bad response, because it expects
//       the lower TLX layer to detect and report it as a malformed FLIT. So if it happens at this layer, the proper
//       response could be a mem_wr_fail or mem_rd_fail - either is as good as the other. This implementation chooses mem_wr_fail.
always @(posedge(clock))
  if (SM_BOP == SM_BOP_FORM_RESPONSE) 
    begin
      // These signals are independent of the response code
      bop_resp_valid      <= 1'b1;             // Load the generated response into the Response FIFO on the next cycle
//    bop_resp_dl         <= 2'b01;            // TL architecture specifies dL=64 Bytes on mem_wr_response to config_write
//    bop_resp_dp         <= 2'b00;            // TL architecture specifies all FLITs covered by response, so start at 0
      bop_resp_capptag    <= arb_cmd_capptag;  // Return 'capptag' from original command
      bop_rdata_offset    <= 4'b0000;          // No resp data on config_write
      bop_rdata_bdi       <= 1'b0;
      bop_rdata_bus       <= 32'h0000_0000;
      bop_cmd_dispatched  <= 1'b1;             // Remove this command from the selected CMD FIFO
      // Form fields for error vector, see documentation for desired field definition
      bop_errvec[127:112] <= 16'h0000;         // Reserve 'Error Source' field (AFU will overlay this)
      //        [111:108]                      // 'Response Code' filled in below
      bop_errvec[    107] <= arb_data_bdi;
      bop_errvec[106:104] <= 3'b001;           // [104] = bad opcode error
      bop_errvec[103: 99] <= arb_cmd_device;
      bop_errvec[ 98: 96] <= arb_cmd_function;
      bop_errvec[     95] <= dev_func_mismatch;
      bop_errvec[     94] <= detect_bad_op;
      bop_errvec[     93] <= tbit_is_1;
      bop_errvec[     92] <= data_is_bad;      
      bop_errvec[     91] <= pl_is_invalid;
      bop_errvec[     90] <= cfg_bad_op_or_align;
      bop_errvec[     89] <= cfg_addr_not_implemented;
      bop_errvec[     88] <= 1'b0;   // cfg_rdata_vld
      bop_errvec[     87] <= arb_cmd_t;
      bop_errvec[ 86: 84] <= arb_cmd_pl;
      bop_errvec[ 83: 82] <= arb_portnum;
      bop_errvec[ 81: 80] <= 2'b01;            // dL doesn't exist in config_write or config_read, so set to one 64B FLIT
      bop_errvec[ 79: 64] <= arb_cmd_capptag;
      bop_errvec[ 63:  0] <= { 32'b0, arb_cmd_pa };
      // Fill in fail response fields for detect_bad_op
      bop_resp_opcode     <= 8'h05;            // mem_wr_fail
      bop_resp_code       <= 4'hE;             // General failure 
      bop_errvec[111:108] <= 4'hE;
      bop_errvec_valid    <= 1'b1;
    end
  else          // Not in this state
    begin
      bop_resp_valid      <= 1'b0;                 // Set to 0 so doesn't interfere with OR gate 
//    bop_resp_dl         <= 2'b0;            
//    bop_resp_dp         <= 2'b0;            
      bop_resp_capptag    <= 16'b0; 
      bop_rdata_offset    <= 4'b0;          
      bop_rdata_bdi       <= 1'b0;
      bop_rdata_bus       <= 32'b0;
      bop_cmd_dispatched  <= 1'b0; 
      bop_resp_opcode     <= 8'h00;
     bop_resp_code       <= 4'h0;   
      bop_errvec          <= 128'b0;               // No error information saved
      bop_errvec_valid    <= 1'b0;                 // Error information is not valid
    end


// WAIT4NEXT_CMD: In this cycle, 'cmd_dispatched' appears at the CMD FIFO, so give it a cycle to move to the next command.
//                From a behavior standpoint, there is nothing to do. 


// Determine next state
always @(posedge(clock))
  if (reset == 1'b1)                             SM_BOP <= SM_BOP_IDLE;   
  else 
    case (SM_BOP)
      SM_BOP_IDLE:            
          if (detect_bad_op == 1'b1 && arb_rff_buffers_available >= 4'b0001)        // Proceed if errors exist, without write or read 
                                                 SM_BOP <= SM_BOP_FORM_RESPONSE;        
          else                                   SM_BOP <= SM_BOP_IDLE;
      SM_BOP_FORM_RESPONSE:                                                        // SEQ captures acknowledgement so can form response
                                                 SM_BOP <= SM_BOP_WAIT4NEXT_CMD;
      SM_BOP_WAIT4NEXT_CMD:                                                        // Wait for CMD FIFO to move to next CMD
                                                 SM_BOP <= SM_BOP_IDLE;
      SM_BOP_ERROR:
                                                 SM_BOP <= SM_BOP_ERROR;           // Once in ERROR state, stay there
      default:
                                                 SM_BOP <= SM_BOP_ERROR;           // Enter ERROR state if state decodes incorrectly
    endcase



// ==============================================================================================================================
// @@@ CFW: Configuration Write state machine
// ==============================================================================================================================

reg   [1:0] cfw_portnum;
reg   [2:0] cfw_function;
reg  [11:0] cfw_addr;                    
reg  [31:0] cfw_wdata;                   
reg         cfw_wr_1B;                   
reg         cfw_wr_2B;                   
reg         cfw_wr_4B;                   
reg         cfw_rd;                      

reg         cfw_resp_valid;
reg   [7:0] cfw_resp_opcode;
reg   [3:0] cfw_resp_code; 
//g   [1:0] cfw_resp_dl;
//g   [1:0] cfw_resp_dp;
reg  [15:0] cfw_resp_capptag;
reg   [3:0] cfw_rdata_offset;
reg         cfw_rdata_bdi;
reg  [31:0] cfw_rdata_bus;

reg [127:0] cfw_errvec;          // Error information to save and (optionally) pass to the AFU
reg         cfw_errvec_valid;

`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
reg [2:0]  SM_CFW;           
parameter  SM_CFW_IDLE          = 3'b000;
parameter  SM_CFW_WAIT1         = 3'b001;
parameter  SM_CFW_WAIT2         = 3'b010;
parameter  SM_CFW_FORM_RESPONSE = 3'b011;
parameter  SM_CFW_WAIT4NEXT_CMD = 3'b100;
parameter  SM_CFW_ERROR         = 3'b111;    // May not be necessary, but define for possible future use

always @(posedge(clock))
  if (SM_CFW == SM_CFW_IDLE) 
    begin
      // if cmd was config_write, no error was decoded, and space is available in the response buffer, begin send write info to targeted Function
      if (start_config_write == 1'b1 && errors_detected_wr == 1'b0 && arb_rff_buffers_available >= 4'b0001)
        begin
          cfw_portnum        <= arb_portnum;
          cfw_function       <= arb_cmd_function;
          cfw_addr           <= arb_cmd_pa[11:0];       
          cfw_wdata          <= arb_data_bus;
          cfw_wr_1B          <= (arb_cmd_pl == 3'b000) ? 1'b1 : 1'b0;                   
          cfw_wr_2B          <= (arb_cmd_pl == 3'b001) ? 1'b1 : 1'b0;                   
          cfw_wr_4B          <= (arb_cmd_pl == 3'b010) ? 1'b1 : 1'b0;                   
          cfw_rd             <= 1'b0;
        end
      else      // No command is valid, it is not config_write, an error was detected on the command, or no Response buffer entry is available
        begin
          cfw_portnum        <= 2'b0;          // Set to 0 so doesn't interfere with OR gate
          cfw_function       <= 3'b0;
          cfw_addr           <= 12'b0;       
          cfw_wdata          <= 32'b0;
          cfw_wr_1B          <= 1'b0;                   
          cfw_wr_2B          <= 1'b0;                   
          cfw_wr_4B          <= 1'b0;                   
          cfw_rd             <= 1'b0;
        end
    end
  else          // Not in this state
    begin
      cfw_portnum        <= 2'b0;             // Set to 0 so doesn't interfere with OR gate
      cfw_function       <= 3'b0;
      cfw_addr           <= 12'b0;       
      cfw_wdata          <= 32'b0;
      cfw_wr_1B          <= 1'b0;                   
      cfw_wr_2B          <= 1'b0;                   
      cfw_wr_4B          <= 1'b0;                   
      cfw_rd             <= 1'b0;
    end

// WAIT1: Write cmd driven to Function.
//                From a behavior standpoint, there is nothing to do. 

// WAIT2: Function captures it and writes target reg.
//                From a behavior standpoint, there is nothing to do. 

// FORM_RESPONSE: SEQ captures acknowledgement so can form response.
//                Prepare one of two responses to the TLX. 
//                - If no error is present, prepare mem_wr_response
//                - If    error is present, prepare mem_wr_fail. Also save error information and generate interrupt. 
//                Since a response buffer slot is known to be present (checked before command was started), 
//                indicate the command is complete and return to IDLE state.
always @(posedge(clock))
  if (SM_CFW == SM_CFW_FORM_RESPONSE) 
    begin
      // These signals are independent of the response code
      cfw_resp_valid      <= 1'b1;             // Load the generated response into the Response FIFO on the next cycle
//    cfw_resp_dl         <= 2'b01;            // TL architecture specifies dL=64 Bytes on mem_wr_response to config_write
//    cfw_resp_dp         <= 2'b00;            // TL architecture specifies all FLITs covered by response, so start at 0
      cfw_resp_capptag    <= arb_cmd_capptag;  // Return 'capptag' from original command
      cfw_rdata_offset    <= 4'b0000;          // No resp data on config_write
      cfw_rdata_bdi       <= 1'b0;
      cfw_rdata_bus       <= 32'h0000_0000;
      cfw_cmd_dispatched  <= 1'b1;             // Remove this command from the selected CMD FIFO
      // Form fields for error vector, see documentation for desired field definition
      cfw_errvec[127:112] <= 16'h0000;         // Reserve 'Error Source' field (AFU will overlay this)
      //        [111:108]                      // 'Response Code' filled in below
      cfw_errvec[    107] <= arb_data_bdi;
      cfw_errvec[106:104] <= 3'b100;           // [106] = config_write error
      cfw_errvec[103: 99] <= arb_cmd_device;
      cfw_errvec[ 98: 96] <= arb_cmd_function;
      cfw_errvec[     95] <= dev_func_mismatch;
      cfw_errvec[     94] <= detect_bad_op;
      cfw_errvec[     93] <= tbit_is_1;
      cfw_errvec[     92] <= data_is_bad;      
      cfw_errvec[     91] <= pl_is_invalid;
      cfw_errvec[     90] <= cfg_bad_op_or_align;
      cfw_errvec[     89] <= cfg_addr_not_implemented;
      cfw_errvec[     88] <= 1'b0;   // cfg_rdata_vld
      cfw_errvec[     87] <= arb_cmd_t;
      cfw_errvec[ 86: 84] <= arb_cmd_pl;
      cfw_errvec[ 83: 82] <= arb_portnum;
      cfw_errvec[ 81: 80] <= 2'b01;            // dL doesn't exist in config_write or config_read, so set to one 64B FLIT
      cfw_errvec[ 79: 64] <= arb_cmd_capptag;
      cfw_errvec[ 63:  0] <= { 32'b0, arb_cmd_pa };
      // Check for errors, determining proper response code for each type
      if (data_is_bad == 1'b1)
        begin
          cfw_resp_opcode     <= 8'h05;            // mem_wr_fail
          cfw_resp_code       <= 4'h8;             // Data Error
          cfw_errvec[111:108] <= 4'h8;             // Save RESP_CODE field
          cfw_errvec_valid    <= 1'b1;             // Pulse error valid
        end
      else if (pl_is_invalid == 1'b1)
        begin
          cfw_resp_opcode     <= 8'h05;            // mem_wr_fail
          cfw_resp_code       <= 4'h9;             // Unsupported Operand length
          cfw_errvec[111:108] <= 4'h9;
          cfw_errvec_valid    <= 1'b1;
        end
      else if (cfg_bad_op_or_align == 1'b1)       // Assume design used legal combination of strobes, so must be address alignment error
        begin
          cfw_resp_opcode     <= 8'h05;            // mem_wr_fail
          cfw_resp_code       <= 4'hB;             // Bad address
          cfw_errvec[111:108] <= 4'hB;
          cfw_errvec_valid    <= 1'b1;
        end
      else if (dev_func_mismatch == 1'b1        || 
               tbit_is_1 == 1'b1                || 
               cfg_addr_not_implemented == 1'b1 ) 
              // || ('access to register outside architected range')  <-- there is no check for this, since the address size used on
              //                                                          config ops ([11:0]) matches the address size of the configuration space
        begin
          cfw_resp_opcode     <= 8'h05;            // mem_wr_fail
          cfw_resp_code       <= 4'hE;             // General failure 
          cfw_errvec[111:108] <= 4'hE;
          cfw_errvec_valid    <= 1'b1;
       end
      else      // Command was successful
        begin
          cfw_resp_opcode     <= 8'h04;            // mem_wr_response
          cfw_resp_code       <= 4'h0;             // Not used with mem_wr_response
          cfw_errvec[111:108] <= 4'h0;             
          cfw_errvec_valid    <= 1'b0;             // No error to report
        end
    end
  else          // Not in this state
    begin
      cfw_resp_valid      <= 1'b0;                 // Set to 0 so doesn't interfere with OR gate 
//    cfw_resp_dl         <= 2'b0;            
//    cfw_resp_dp         <= 2'b0;            
      cfw_resp_capptag    <= 16'b0; 
      cfw_rdata_offset    <= 4'b0;          
      cfw_rdata_bdi       <= 1'b0;
      cfw_rdata_bus       <= 32'b0;
      cfw_cmd_dispatched  <= 1'b0; 
      cfw_resp_opcode     <= 8'h00;
      cfw_resp_code       <= 4'h0;   
      cfw_errvec          <= 128'b0;               // No error information saved
      cfw_errvec_valid    <= 1'b0;                 // Error information is not valid
    end


// WAIT4NEXT_CMD: In this cycle, 'cmd_dispatched' appears at the CMD FIFO, so give it a cycle to move to the next command.
//                From a behavior standpoint, there is nothing to do. 


// Determine next state
always @(posedge(clock))
  if (reset == 1'b1)                             SM_CFW <= SM_CFW_IDLE;   
  else 
    case (SM_CFW)
      SM_CFW_IDLE:            
          if (start_config_write == 1'b1 && arb_rff_buffers_available >= 4'b0001)   // Proceed if errors exist, but suppress write 
                                                 SM_CFW <= SM_CFW_WAIT1;        
          else                                   SM_CFW <= SM_CFW_IDLE;
      SM_CFW_WAIT1:                                                                // Write cmd driven to Function
                                                 SM_CFW <= SM_CFW_WAIT2;
      SM_CFW_WAIT2:                                                                // Function captures it and writes target reg
                                                 SM_CFW <= SM_CFW_FORM_RESPONSE;
      SM_CFW_FORM_RESPONSE:                                                        // SEQ captures acknowledgement so can form response
                                                 SM_CFW <= SM_CFW_WAIT4NEXT_CMD;
      SM_CFW_WAIT4NEXT_CMD:                                                        // Wait for CMD FIFO to move to next CMD
                                                 SM_CFW <= SM_CFW_IDLE;
      SM_CFW_ERROR:
                                                 SM_CFW <= SM_CFW_ERROR;           // Once in ERROR state, stay there
      default:
                                                 SM_CFW <= SM_CFW_ERROR;           // Enter ERROR state if state decodes incorrectly
    endcase


// ==============================================================================================================================
// @@@ BDF: Bus/Device/(Function) registers
// ==============================================================================================================================

// Bus/Device/Function Number:
//
// The Device and Function numbers are fixed based on implemention values. However the Bus number comes from the config_write
// command, so load it when receiving a valid config_write. Once saved, drive both the Bus and Device numbers out to the Functions
// and AFUs since AFUs need to put BDF on a signal to the TLX in some AFU initiated commands.

reg  [7:0] reg_cfg0_bus_num;   // Save one Bus number for each TLX port
`ifdef EXPOSE_CFG_PORT_1   reg  [7:0] reg_cfg1_bus_num;   `endif
`ifdef EXPOSE_CFG_PORT_2   reg  [7:0] reg_cfg2_bus_num;   `endif
`ifdef EXPOSE_CFG_PORT_3   reg  [7:0] reg_cfg3_bus_num;   `endif

always @(posedge(clock))
  if (reset == 1'b1)
    begin
      reg_cfg0_bus_num <= 8'h00;  // Not knowing the Bus number, make them the same as the port number just to keep them unique
      `ifdef EXPOSE_CFG_PORT_1   reg_cfg1_bus_num <= 8'h01;   `endif
      `ifdef EXPOSE_CFG_PORT_2   reg_cfg2_bus_num <= 8'h02;   `endif
      `ifdef EXPOSE_CFG_PORT_3   reg_cfg3_bus_num <= 8'h03;   `endif
    end
  else if (SM_CFW == SM_CFW_IDLE && (start_config_write == 1'b1 && errors_detected_wr == 1'b0 && arb_rff_buffers_available >= 4'b0001) )
    begin   // If starting a config_write, no error was decoded, and space is available in the response buffer, save the Bus number
      reg_cfg0_bus_num <= (arb_portnum == 2'b00) ? arb_cmd_bus : reg_cfg0_bus_num;   // Overlay if port number matches, else hold the value
      `ifdef EXPOSE_CFG_PORT_1   reg_cfg1_bus_num <= (arb_portnum == 2'b01) ? arb_cmd_bus : reg_cfg1_bus_num;   `endif
      `ifdef EXPOSE_CFG_PORT_2   reg_cfg2_bus_num <= (arb_portnum == 2'b10) ? arb_cmd_bus : reg_cfg2_bus_num;   `endif
      `ifdef EXPOSE_CFG_PORT_3   reg_cfg3_bus_num <= (arb_portnum == 2'b11) ? arb_cmd_bus : reg_cfg3_bus_num;   `endif
    end
  else
    begin
      reg_cfg0_bus_num <= reg_cfg0_bus_num;       // Hold the current value
      `ifdef EXPOSE_CFG_PORT_1   reg_cfg1_bus_num <= reg_cfg1_bus_num;    `endif  
      `ifdef EXPOSE_CFG_PORT_2   reg_cfg2_bus_num <= reg_cfg2_bus_num;    `endif   
      `ifdef EXPOSE_CFG_PORT_3   reg_cfg3_bus_num <= reg_cfg3_bus_num;    `endif
    end

// Drive Bus and Device number to Functions and AFUs (Function provides 'function' number)
assign cfg0_bus_num    = reg_cfg0_bus_num;
assign cfg0_device_num = device_num;

`ifdef EXPOSE_CFG_PORT_1   
  assign cfg1_bus_num    = reg_cfg1_bus_num;
  assign cfg1_device_num = device_num;
`endif

`ifdef EXPOSE_CFG_PORT_2   
  assign cfg2_bus_num    = reg_cfg2_bus_num;
  assign cfg2_device_num = device_num;
`endif

`ifdef EXPOSE_CFG_PORT_3   
  assign cfg3_bus_num    = reg_cfg3_bus_num;
  assign cfg3_device_num = device_num;
`endif


// ==============================================================================================================================
// @@@ CFR: Configuration Read state machine
// ==============================================================================================================================


reg   [1:0] cfr_portnum;
reg   [2:0] cfr_function;
reg  [11:0] cfr_addr;                    
reg  [31:0] cfr_wdata;                   
reg         cfr_wr_1B;                   
reg         cfr_wr_2B;                   
reg         cfr_wr_4B;                   
reg         cfr_rd;                      

reg         cfr_resp_valid;
reg   [7:0] cfr_resp_opcode;
reg   [3:0] cfr_resp_code; 
//g   [1:0] cfr_resp_dl;
//g   [1:0] cfr_resp_dp;
reg  [15:0] cfr_resp_capptag;
reg   [3:0] cfr_rdata_offset;
reg         cfr_rdata_bdi;
reg  [31:0] cfr_rdata_bus;

reg [127:0] cfr_errvec;          // Error information to save and (optionally) pass to the AFU
reg         cfr_errvec_valid;

reg cfg_rd_bad_align_d; 
reg cfg_rd_bad_align_q;
reg cfg_rd_bad_align;

`ifdef MARK_DEBUG_ACTIVE (* mark_debug = "TRUE" *) `endif
reg [2:0]  SM_CFR;           
parameter  SM_CFR_IDLE          = 3'b000;
parameter  SM_CFR_WAIT1         = 3'b001;
parameter  SM_CFR_WAIT2         = 3'b010;
parameter  SM_CFR_FORM_RESPONSE = 3'b011;
parameter  SM_CFR_WAIT4NEXT_CMD = 3'b100;
parameter  SM_CFR_ERROR         = 3'b111;    // May not be necessary, but define for possible future use


always @(posedge(clock))
  if (SM_CFR == SM_CFR_IDLE) 
    begin
      // if cmd was config_read, no error was decoded, and space is available in the response buffer, begin send write info to targeted Function
      if (start_config_read == 1'b1 && errors_detected_rd == 1'b0 && arb_rff_buffers_available >= 4'b0001)
        begin
          cfr_portnum        <= arb_portnum;
          cfr_function       <= arb_cmd_function;
          cfr_addr           <= arb_cmd_pa[11:0];       
          cfr_wdata          <= arb_data_bus;
          cfr_wr_1B          <= 1'b0;                   
          cfr_wr_2B          <= 1'b0;                   
          cfr_wr_4B          <= 1'b0;                   
          cfr_rd             <= 1'b1; 


         //Unaligned byte access case detection for reads to fail the read in cfg_seq
            if ( ((arb_cmd_pa[0] == 1'b1) && (arb_cmd_pl != 0)) || ((arb_cmd_pa[1:0] == 2'b10) && (arb_cmd_pl == 3'b010)) )
                  cfg_rd_bad_align_d <= 1'b1;
            else
                  cfg_rd_bad_align_d <= 1'b0;
        end
      else      // No command is valid, it is not config_reaed, an error was detected on the command, or no Response buffer entry is available
        begin
          cfr_portnum        <= 2'b0;          // Set to 0 so doesn't interfere with OR gate
          cfr_function       <= 3'b0;
          cfr_addr           <= 12'b0;       
          cfr_wdata          <= 32'b0;
          cfr_wr_1B          <= 1'b0;                   
          cfr_wr_2B          <= 1'b0;                   
          cfr_wr_4B          <= 1'b0;                   
          cfr_rd             <= 1'b0;
        end
    end
  else          // Not in this state
    begin
      cfr_portnum        <= 2'b0;             // Set to 0 so doesn't interfere with OR gate
      cfr_function       <= 3'b0;
      cfr_addr           <= 12'b0;       
      cfr_wdata          <= 32'b0;
      cfr_wr_1B          <= 1'b0;                   
      cfr_wr_2B          <= 1'b0;                   
      cfr_wr_4B          <= 1'b0;                   
      cfr_rd             <= 1'b0;
    end // else: !if(SM_CFR == SM_CFR_IDLE)

//Flop cfg_rd_bad_align to be cycle consistent with write fails indicated by bad_op_or_align
always@(posedge(clock))
  begin
   cfg_rd_bad_align_q <= cfg_rd_bad_align_d;
   cfg_rd_bad_align   <= cfg_rd_bad_align_q;
  end






// WAIT1: Write cmd driven to Function.
//                From a behavior standpoint, there is nothing to do. 

// WAIT2: Function captures it and reads target reg.
//                From a behavior standpoint, there is nothing to do. 

// FORM_RESPONSE: SEQ captures acknowledgement so can form response.
//                Prepare one of two responses to the TLX. 
//                - If no error is present, prepare mem_rd_response
//                - If    error is present, prepare mem_rd_fail. Also save error information and generate interrupt. 
//                Since a response buffer slot is known to be present (checked before command was started), 
//                indicate the command is complete and return to IDLE state.
always @(posedge(clock))
  if (SM_CFR == SM_CFR_FORM_RESPONSE) 
    begin
      // These signals are independent of the response code
      cfr_resp_valid      <= 1'b1;             // Load the generated response into the Response FIFO on the next cycle
//    cfr_resp_dl         <= 2'b01;            // TL architecture specifies dL=64 Bytes on mem_wr_response to config_write
//    cfr_resp_dp         <= 2'b00;            // TL architecture specifies all FLITs covered by response, so start at 0
      cfr_resp_capptag    <= arb_cmd_capptag;  // Return 'capptag' from original command
      cfr_rdata_offset    <= arb_cmd_pa[5:2];  // Provide address within the 64B FLIT for the 4B of read data to be aligned by TLX
      cfr_rdata_bdi       <= 1'b0;             // In FPGA, assume data from registers never has a soft error
      cfr_rdata_bus       <= cfg_rdata;        // Capture data returned from targeted Function
      cfr_cmd_dispatched  <= 1'b1;             // Remove this command from the selected CMD FIFO
      // Form fields for error vector, see documentation for desired field definition
      cfr_errvec[127:112] <= 16'h0000;         // Reserve 'Error Source' field (AFU will overlay this)
      //        [111:108]                      // 'Response Code' filled in below
      cfr_errvec[    107] <= 1'b0;             // In FPGA, assume data from registers never has a soft error
      cfr_errvec[106:104] <= 3'b010;           // [105] = config_read error
      cfr_errvec[103: 99] <= arb_cmd_device;
      cfr_errvec[ 98: 96] <= arb_cmd_function;
      cfr_errvec[     95] <= dev_func_mismatch;
      cfr_errvec[     94] <= detect_bad_op;
      cfr_errvec[     93] <= tbit_is_1;
      cfr_errvec[     92] <= 1'b0; // data_is_bad;      
      cfr_errvec[     91] <= pl_is_invalid;
      cfr_errvec[     90] <= cfg_rd_bad_align; 
      cfr_errvec[     89] <= cfg_addr_not_implemented;

   
    if (cfg_rd_bad_align)
      cfr_errvec[     88] <= 1'b0; //Read data is not valid since cmd tried misaligned byte access
    else
      cfr_errvec[     88] <= cfg_rdata_vld;
   
    
      cfr_errvec[     87] <= arb_cmd_t;
      cfr_errvec[ 86: 84] <= arb_cmd_pl;
      cfr_errvec[ 83: 82] <= arb_portnum;
      cfr_errvec[ 81: 80] <= 2'b01;            // dL doesn't exist in config_write or config_read, so set to one 64B FLIT
      cfr_errvec[ 79: 64] <= arb_cmd_capptag;
      cfr_errvec[ 63:  0] <= { 32'b0, arb_cmd_pa };
      // Check for errors, determining proper response code for each type
//    if ( <data read from config space is always considered uncorrupted> )
//      begin
//        cfr_resp_opcode     <= 8'h02;            // mem_rd_fail
//        cfr_resp_code       <= 4'h8;             // Data Error
//        cfr_errvec[111:108] <= 4'h8;             // Save RESP_CODE field
//        cfr_errvec_valid    <= 1'b1;             // Pulse error valid
//      end
//    else if (pl_is_invalid == 1'b1)
      if (pl_is_invalid == 1'b1)
        begin
          cfr_resp_opcode     <= 8'h02;            // mem_rd_fail
          cfr_resp_code       <= 4'h9;             // Unsupported Operand length
          cfr_errvec[111:108] <= 4'h9;
          cfr_errvec_valid    <= 1'b1;
        end

//Uncommented this part to make sure unaligned mem_rd is reflected in response
      else if (cfg_rd_bad_align == 1'b1)        // config_read is executed aligned to a 4B boundary, so this shouldn't happen
        begin
          cfr_resp_opcode     <= 8'h02;            // mem_rd_fail
          cfr_resp_code       <= 4'hB;             // Bad address
          cfr_errvec[111:108] <= 4'hB;
          cfr_errvec_valid    <= 1'b1;
        end

      else if (dev_func_mismatch == 1'b1        || 
               tbit_is_1 == 1'b1                || 
               cfg_addr_not_implemented == 1'b1 ||
               cfg_bad_op_or_align == 1'b1      || // Reads are always done on 4B boundary, so if this goes off on config_read it is an internal error
               cfg_rdata_vld == 1'b0            )  // Returned 'data valid' should be 1 if nothing went wrong with read
              // || ('access to register outside architected range')  <-- there is no check for this, since the address size used on
              //                                                          config ops ([11:0]) matches the address size of the configuration space
        begin
          cfr_resp_opcode     <= 8'h02;            // mem_rd_fail
          cfr_resp_code       <= 4'hE;             // General failure 
          cfr_errvec[111:108] <= 4'hE;
          cfr_errvec_valid    <= 1'b1;
       end
      else      // Command was successful
        begin
          cfr_resp_opcode     <= 8'h01;            // mem_rd_response
          cfr_resp_code       <= 4'h0;             // Not used with mem_rd_response
          cfr_errvec[111:108] <= 4'h0;             
          cfr_errvec_valid    <= 1'b0;             // No error to report
        end
    end
  else          // Not in this state
    begin
      cfr_resp_valid      <= 1'b0;                 // Set to 0 so doesn't interfere with OR gate 
//    cfr_resp_dl         <= 2'b0;            
//    cfr_resp_dp         <= 2'b0;            
      cfr_resp_capptag    <= 16'b0; 
      cfr_rdata_offset    <= 4'b0;          
      cfr_rdata_bdi       <= 1'b0;
      cfr_rdata_bus       <= 32'b0;
      cfr_cmd_dispatched  <= 1'b0;    
      cfr_resp_opcode     <= 8'h00;
      cfr_resp_code       <= 4'h0;   
      cfr_errvec          <= 128'b0;               // No error information saved
      cfr_errvec_valid    <= 1'b0;                 // Error information is not valid
    end


// WAIT4NEXT_CMD: In this cycle, 'cmd_dispatched' appears at the CMD FIFO, so give it a cycle to move to the next command.
//                From a behavior standpoint, there is nothing to do. 


// Determine next state
always @(posedge(clock))
  if (reset == 1'b1)                             SM_CFR <= SM_CFR_IDLE;   
  else 
    case (SM_CFR)
      SM_CFR_IDLE:            
          if (start_config_read == 1'b1 && arb_rff_buffers_available >= 4'b0001)    // Proceed if errors exist, but suppress read 
                                                 SM_CFR <= SM_CFR_WAIT1;        
          else                                   SM_CFR <= SM_CFR_IDLE;
      SM_CFR_WAIT1:                                                                // Write cmd driven to Function
                                                 SM_CFR <= SM_CFR_WAIT2;
      SM_CFR_WAIT2:                                                                // Function captures it and reads target reg
                                                 SM_CFR <= SM_CFR_FORM_RESPONSE;
      SM_CFR_FORM_RESPONSE:                                                        // SEQ captures acknowledgement so can form response
                                                 SM_CFR <= SM_CFR_WAIT4NEXT_CMD;
      SM_CFR_WAIT4NEXT_CMD:                                                        // Wait for CMD FIFO to move to next CMD
                                                 SM_CFR <= SM_CFR_IDLE;
      SM_CFR_ERROR:
                                                 SM_CFR <= SM_CFR_ERROR;           // Once in ERROR state, stay there
      default:
                                                 SM_CFR <= SM_CFR_ERROR;           // Enter ERROR state if state decodes incorrectly
    endcase


// ==============================================================================================================================
// @@@  SRC: Determine new source (do after SM_CFW and SM_CFR are declared)
// ==============================================================================================================================

// Select a new command from the various port CMD FIFOs when:
// - all state machines are IDLE and no commands are in progress, OR
// - a command has been dispatched (meaning it just completed executing), OR
//// - there are no response buffers available to execute the command currently selected by the arbiter

assign select_new_source = ( (SM_CFW == SM_CFW_IDLE && SM_CFR == SM_CFR_IDLE && SM_BOP == SM_BOP_IDLE &&
                              start_config_write == 1'b0 && start_config_read == 1'b0 && detect_bad_op == 1'b0) ||
                             (cmd_dispatched == 1'b1) ||
                             (arb_rff_buffers_available == 4'b0000)
                           ) ? 1'b1 : 1'b0;

// ==============================================================================================================================
// @@@  OR: Combine ports to Functions and Responses from CFW and CFR into single outputs
// ==============================================================================================================================
// Only cfw or cfr should be active, the other has a zero value on it. With this, use a simple OR of the two sources to combine them.

// Outputs to Functions
assign cfg_function = cfw_function | cfr_function;
assign cfg_portnum  = cfw_portnum  | cfr_portnum ;
assign cfg_addr     = cfw_addr     | cfr_addr    ;
assign cfg_wdata    = cfw_wdata    | cfr_wdata   ;
assign cfg_wr_1B    = cfw_wr_1B    | cfr_wr_1B   ;
assign cfg_wr_2B    = cfw_wr_2B    | cfr_wr_2B   ;
assign cfg_wr_4B    = cfw_wr_4B    | cfr_wr_4B   ;
assign cfg_rd       = cfw_rd       | cfr_rd      ;


// Outputs to Response FIFOs
// 'resp_valid' has an extra condition, where the port numbers need to be checked. The extra check is not needed on the other
// signals, as they can wiggle to non-zero values and be ignored by the RESP FIFO as long as 'resp_valid' remains inactive.

// --- Port 0 ---
assign cfg0_rff_resp_valid   = ( arb_portnum == 2'b00 ) ? (cfw_resp_valid | cfr_resp_valid | bop_resp_valid) : 1'b0;
assign cfg0_rff_resp_opcode  = cfw_resp_opcode  | cfr_resp_opcode  | bop_resp_opcode  ;
assign cfg0_rff_resp_code    = cfw_resp_code    | cfr_resp_code    | bop_resp_code    ; 
//sign cfg0_rff_resp_dl      = cfw_resp_dl      | cfr_resp_dl      | bop_resp_dl      ;
//sign cfg0_rff_resp_dp      = cfw_resp_dp      | cfr_resp_dp      | bop_resp_dp      ;
assign cfg0_rff_resp_capptag = cfw_resp_capptag | cfr_resp_capptag | bop_resp_capptag ;
assign cfg0_rff_rdata_offset = cfw_rdata_offset | cfr_rdata_offset | bop_rdata_offset ;
assign cfg0_rff_rdata_bdi    = cfw_rdata_bdi    | cfr_rdata_bdi    | bop_rdata_bdi    ;
assign cfg0_rff_rdata_bus    = cfw_rdata_bus    | cfr_rdata_bus    | bop_rdata_bus    ;

`ifdef EXPOSE_CFG_PORT_1
  // --- Port 1 ---
  assign cfg1_rff_resp_valid   = ( arb_portnum == 2'b01 ) ? (cfw_resp_valid | cfr_resp_valid | bop_resp_valid) : 1'b0;
  assign cfg1_rff_resp_opcode  = cfw_resp_opcode  | cfr_resp_opcode  | bop_resp_opcode  ;
  assign cfg1_rff_resp_code    = cfw_resp_code    | cfr_resp_code    | bop_resp_code    ; 
  //sign cfg1_rff_resp_dl      = cfw_resp_dl      | cfr_resp_dl      | bop_resp_dl      ;
  //sign cfg1_rff_resp_dp      = cfw_resp_dp      | cfr_resp_dp      | bop_resp_dp      ;
  assign cfg1_rff_resp_capptag = cfw_resp_capptag | cfr_resp_capptag | bop_resp_capptag ;
  assign cfg1_rff_rdata_offset = cfw_rdata_offset | cfr_rdata_offset | bop_rdata_offset ;
  assign cfg1_rff_rdata_bdi    = cfw_rdata_bdi    | cfr_rdata_bdi    | bop_rdata_bdi    ;
  assign cfg1_rff_rdata_bus    = cfw_rdata_bus    | cfr_rdata_bus    | bop_rdata_bus    ;
`endif

`ifdef EXPOSE_CFG_PORT_2
  // --- Port 2 ---
  assign cfg2_rff_resp_valid   = ( arb_portnum == 2'b10 ) ? (cfw_resp_valid | cfr_resp_valid | bop_resp_valid) : 1'b0;
  assign cfg2_rff_resp_opcode  = cfw_resp_opcode  | cfr_resp_opcode  | bop_resp_opcode  ;
  assign cfg2_rff_resp_code    = cfw_resp_code    | cfr_resp_code    | bop_resp_code    ; 
  //sign cfg2_rff_resp_dl      = cfw_resp_dl      | cfr_resp_dl      | bop_resp_dl      ;
  //sign cfg2_rff_resp_dp      = cfw_resp_dp      | cfr_resp_dp      | bop_resp_dp      ;
  assign cfg2_rff_resp_capptag = cfw_resp_capptag | cfr_resp_capptag | bop_resp_capptag ;
  assign cfg2_rff_rdata_offset = cfw_rdata_offset | cfr_rdata_offset | bop_rdata_offset ;
  assign cfg2_rff_rdata_bdi    = cfw_rdata_bdi    | cfr_rdata_bdi    | bop_rdata_bdi    ;
  assign cfg2_rff_rdata_bus    = cfw_rdata_bus    | cfr_rdata_bus    | bop_rdata_bus    ;
`endif

`ifdef EXPOSE_CFG_PORT_3
  // --- Port 3 ---
  assign cfg3_rff_resp_valid   = ( arb_portnum == 2'b11 ) ? (cfw_resp_valid | cfr_resp_valid | bop_resp_valid) : 1'b0;
  assign cfg3_rff_resp_opcode  = cfw_resp_opcode  | cfr_resp_opcode  | bop_resp_opcode  ;
  assign cfg3_rff_resp_code    = cfw_resp_code    | cfr_resp_code    | bop_resp_code    ; 
  //sign cfg3_rff_resp_dl      = cfw_resp_dl      | cfr_resp_dl      | bop_resp_dl      ;
  //sign cfg3_rff_resp_dp      = cfw_resp_dp      | cfr_resp_dp      | bop_resp_dp      ;
  assign cfg3_rff_resp_capptag = cfw_resp_capptag | cfr_resp_capptag | bop_resp_capptag ;
  assign cfg3_rff_rdata_offset = cfw_rdata_offset | cfr_rdata_offset | bop_rdata_offset ;
  assign cfg3_rff_rdata_bdi    = cfw_rdata_bdi    | cfr_rdata_bdi    | bop_rdata_bdi    ;
  assign cfg3_rff_rdata_bus    = cfw_rdata_bus    | cfr_rdata_bus    | bop_rdata_bus    ;
`endif

// Drive error signals to AFU
// NOTE: Output port has 1 OR gate after the register. If this creates a timing problem downstream, re-register it again before sending it out.
//       The extra cycle of delay won't really matter - the important thing is logging the reason behind the error.
assign cfg_errvec       = cfw_errvec       | cfr_errvec       | bop_errvec;
assign cfg_errvec_valid = cfw_errvec_valid | cfr_errvec_valid | bop_errvec_valid;


endmodule
