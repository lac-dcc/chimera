//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2013-04-10 15:07:36 +0100 (Wed, 10 Apr 2013) $
//
//      Revision            : $Revision: 243494 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : AHB domain logic for asynchronous AHB to APB bridge
//-----------------------------------------------------------------------------
//
module cmsdk_ahb_to_apb_async_h #(
  // Parameter to define address width
  // 16 = 2^16 = 64KB APB address space
  parameter     ADDRWIDTH = 16)
 (
// --------------------------------------------------------------------------
// Port Definitions
// --------------------------------------------------------------------------
  input  wire                 HCLK,      // Clock
  input  wire                 HRESETn,   // Reset

  input  wire                 HSEL,      // Device select
  input  wire [ADDRWIDTH-1:0] HADDR,     // Address
  input  wire           [1:0] HTRANS,    // Transfer control
  input  wire                 HWRITE,    // Write control
  input  wire          [2:0]  HSIZE,     // Transfer size
  input  wire          [3:0]  HPROT,     // Protection control
  input  wire                 HREADY,    // Transfer phase done
  input  wire          [31:0] HWDATA,    // Write data

  output wire                 HREADYOUT, // Device ready
  output wire          [31:0] HRDATA,    // Read data output
  output wire                 HRESP,     // Device response to bus master

  output reg  [ADDRWIDTH-3:0] s_addr,     // Address
  output reg                  s_trans_valid, // Transfer valid
  output reg                  s_write,
  output wire           [1:0] s_prot,     // PROT information
  output wire           [3:0] s_strb,     // Byte strobe information

  output reg           [31:0] s_wdata,

  input  wire          [31:0] s_rdata,
  input  wire                 s_resp,

  output wire                 s_req_h,
  input  wire                 s_ack_h);


  // --------------------------------------------------------------------------
  // Internal wires
  // --------------------------------------------------------------------------

  reg            [3:0]   pstrb_reg;   // Byte lane strobe register
  wire           [3:0]   pstrb_nxt;   // Byte lane strobe next state
  reg            [1:0]   pprot_reg;   // PPROT register
  wire           [1:0]   pprot_nxt;   // PPROT register next state

  wire                   sample_addr_phase;
  wire                   sample_wdata_phase;
  wire                   nxt_trans_valid;

  // State machine
  reg              [1:0] curr_state;
  reg              [1:0] next_state;
  localparam fsm_idle = 2'b00; // Idle
  localparam fsm_done = 2'b01; // transfer is done
  localparam fsm_wr1  = 2'b10; // first write cycle
  localparam fsm_wait = 2'b11; // active transfer and waiting

  // Register for handshaking signal
  reg                    reg_s_req_h;
  reg                    s_resp_reg;

  wire                   toggle_req; // Request signal need toggling
  wire                   trans_done; // Handshaking done

  reg                    reg_hresp;  // Register for HRESP generation
  wire                   err_detect; // APB slave return error

  // -------------------------------------------------------
  // Start of main code

  // Detect if a new transfer is needed, for sampling
  // address phase signal
  assign  sample_addr_phase = HSEL & HTRANS[1] & HREADY;

  // Sampling of address phase signals - address
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    s_addr <= {(ADDRWIDTH-2){1'b0}};
  else if (sample_addr_phase)
    s_addr <= HADDR[ADDRWIDTH-1:2];
  end

  // Sampling of address phase signals - write
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    s_write <= 1'b0;
  else if (sample_addr_phase)
    s_write <= HWRITE;
  end

  assign pprot_nxt[0] =  HPROT[1];  // (0) Normal, (1) Privileged
  assign pprot_nxt[1] = ~HPROT[0];  // (0) Data, (1) Instruction

  // Byte strobe generation
  assign pstrb_nxt[0] = HWRITE & (HSIZE[1]|((HSIZE[0])&(~HADDR[1]))|(HADDR[1:0]==2'b00));
  assign pstrb_nxt[1] = HWRITE & (HSIZE[1]|((HSIZE[0])&(~HADDR[1]))|(HADDR[1:0]==2'b01));
  assign pstrb_nxt[2] = HWRITE & (HSIZE[1]|((HSIZE[0])&( HADDR[1]))|(HADDR[1:0]==2'b10));
  assign pstrb_nxt[3] = HWRITE & (HSIZE[1]|((HSIZE[0])&( HADDR[1]))|(HADDR[1:0]==2'b11));

  // Sample control signals
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    begin
    pprot_reg <= {2{1'b0}};
    pstrb_reg <= {4{1'b0}};
    end
  else if (sample_addr_phase) // Only change at beginning of each APB transfer
    begin
    pprot_reg <= pprot_nxt;
    pstrb_reg <= pstrb_nxt;
    end
  end

  assign  s_prot = pprot_reg;
  assign  s_strb = pstrb_reg;

  // Sampling of address phase signals - s_trans_valid
  // Indicate transfer is valid - prevent invalid transfer
  // being generated during reset
  assign nxt_trans_valid = HSEL & HTRANS[1];

  // Sample transfer valid control
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    s_trans_valid <= 1'b0;
  else if (HREADY)
    s_trans_valid <= nxt_trans_valid;
  end

  // Sampling of data phase signals - s_wdata
  // Write data from CPU might contains glitch and might not be
  // availble in early stage of first data phase cycle
  assign  sample_wdata_phase = (curr_state == fsm_wr1) ? 1'b1 : 1'b0;

  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    s_wdata <= {32{1'b0}};
  else if (sample_wdata_phase)
    s_wdata <= HWDATA;
  end

  // Finite state machine
  always @(curr_state or sample_addr_phase or HWRITE or trans_done)
  begin
    case (curr_state)
      fsm_idle, fsm_done : // Idle or complete
        begin
        if  (sample_addr_phase)
          begin
          if (HWRITE)
            next_state = fsm_wr1;  // First cycle of write
          else
            next_state = fsm_wait;  // First cycle of read / other cycles for write
          end
        else
          next_state = fsm_idle;  // remain idle
        end
      fsm_wr1 : // First cycle of write
        next_state = fsm_wait;  // go to other cycles for write
      fsm_wait : // Rest of the transfer cycles
        next_state = (trans_done) ? fsm_done : fsm_wait;
      default:
        next_state = 2'bxx;  // Should not be here
    endcase
  end

  // Sequential part of the state machine
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    curr_state <= fsm_idle;
  else
    curr_state <= next_state;
  end

  // Register response
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    s_resp_reg <= 1'b0;
  else if (trans_done)
    s_resp_reg <= s_resp;
  end

  // Toggle request signal for read-start, write-start, or
  // mismatch between Req and Ack (can be caused by reset in APB side)
  assign toggle_req = (sample_addr_phase & (~HWRITE)) | sample_wdata_phase |
                     ((curr_state==fsm_idle) & (~sample_addr_phase) & reg_s_req_h & (~s_ack_h));

  // Request signal
  // Sequential part of the state machine
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    reg_s_req_h <= 1'b0;
  else if (toggle_req)
    reg_s_req_h <= ~reg_s_req_h;
  end

  // Transfer is completed (ack received)
  assign trans_done = (reg_s_req_h == s_ack_h);

  // Connect request signal to top level
  assign s_req_h = reg_s_req_h;
  // Read data
  assign HRDATA = s_rdata;
  // Ready output
  assign HREADYOUT = ((curr_state==fsm_idle) | ((curr_state==fsm_done) & (s_resp_reg==1'b0))) ? 1'b1 : 1'b0;

  // PSLVERR is set on APB transfer completion
  assign err_detect =  (curr_state==fsm_done) & s_resp_reg;

  // Register for HREPS generation - this register is asserted in the 2nd cycle of error response
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    reg_hresp <= 1'b0;
  else if ((curr_state == fsm_idle) | (err_detect))
    reg_hresp <= err_detect; // Set to 1 at clock edge if err_detect is high (curr_state=fsm_wait)
                             // Clear to 0 after FSM return to idle
  end

  // Connect error response to top level
  assign HRESP = reg_hresp | err_detect ;

  // Okay generation:
  //   curr_state     fsm_wait    fsm_done   fsm_idle   fsm_idle
  //   trans_done         1          0           0         0
  //   err_detect         0          0           0         0
  //   reg_hresp          0          0           0         0
  //   HREADYOUT          0          1           1         1
  //   HRESP              0          0           0         0
  //
  // Error generation:
  //   curr_state     fsm_wait    fsm_done   fsm_idle   fsm_idle
  //   trans_done         1          0           0         0
  //   err_detect         0          1           0         0
  //   reg_hresp          0          0           1         0
  //   HREADYOUT          0          0           1         1
  //   HRESP              0          1           1         0

endmodule


