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
//      Checked In          : $Date: 2013-01-09 18:19:45 +0000 (Wed, 09 Jan 2013) $
//
//      Revision            : $Revision: 233164 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : AHB state machine for AHB to external memory interface
//-----------------------------------------------------------------------------
// This module divides each 32-bit AHB transfer or 16-bit AHB transfer
// to multiple transfers if needed.
// This module also handles data routing.

module cmsdk_ahb_to_extmem16_ahb_fsm #(
  // Parameter to define address width
  // 16 = 64KByte memory
  parameter  AW = 16)
 (
// --------------------------------------------------------------------------
// Port Definitions
// --------------------------------------------------------------------------
  input  wire          HCLK,
  input  wire          HRESETn, // Reset

  input  wire          HSEL,    // Device select
  input  wire [AW-1:0] HADDR,   // Address
  input  wire    [1:0] HTRANS,  // Transfer control
  input  wire    [2:0] HSIZE,   // Transfer size
  input  wire          HWRITE,  // Write control
  input  wire   [31:0] HWDATA,  // Write data
  input  wire          HREADY,  // Transfer phase done
  output wire          HREADYOUT, // Device ready
  output wire   [31:0] HRDATA,  // Read data output
  output wire          HRESP,   // Device response (always OKAY)

  input  wire          CFGSIZE,

  output wire [AW-1:0] ADDR,    // Address output
  output reg    [15:0] DATAOUT, // Data output
  input  wire   [15:0] DATAIN,  // Data input

  // Interface to MEM i/f FSM
  output reg           RDREQ,         // Read request
  output reg           WRREQ,         // Write request
  output reg     [1:0] NXTBYTEMASK,   // Byte Mask (unregistered)
  input  wire          DONE,          // Transfer done

  // For OVL
  output wire    [2:0] BUSFSMSTATE);

  // --------------------------------------------------------------------------
  // Internal wires
  // --------------------------------------------------------------------------
  reg       [2:0] reg_bstate; // AHB bus FSM state
  reg       [2:0] nxt_bstate;

  localparam BUSCNV_FSM_DEF      = 3'b000;
  localparam BUSCNV_FSM_32BIT_8A = 3'b001;
  localparam BUSCNV_FSM_32BIT_8B = 3'b011;
  localparam BUSCNV_FSM_32BIT_8C = 3'b010;
  localparam BUSCNV_FSM_32BIT_16 = 3'b100;
  localparam BUSCNV_FSM_16BIT_8  = 3'b101;

// State machine operation:
//
// Default (idle / first part of transfer)
// BUSCNV_FSM_DEF
//   |-> Transfers that can be handled in one go -> BUSCNV_FSM_DEF
//   |-> 16-bit transfers on  8-bit memory -> BUSCNV_FSM_16BIT_8 -> BUSCNV_FSM_DEF
//   |-> 32-bit transfers on 16-bit memory -> BUSCNV_FSM_32BIT_16 -> BUSCNV_FSM_DEF
//   \-> 32-bit transfers on  8-bit memory -> BUSCNV_FSM_32BIT_8A
//                                            \-> BUSCNV_FSM_32BIT_8B
//                                                \-> BUSCNV_FSM_32BIT_8C
//                                                    \-> BUSCNV_FSM_DEF

  wire            trans_valid;    // Transfer valid
  reg             reg_write;      // HWRITE in data phase
  reg             reg_active;     // Active transfer
  reg       [1:0] reg_size;       // HSIZE in data phase

  reg       [1:0] reg_addr_low;   // Address bit [1:0] output
  reg       [1:0] nxt_addr_low;
  reg    [AW-3:0] reg_addr_high;  // Higher address bits output
  reg    [AW-3:0] nxt_addr_high;
  reg       [1:0] reg_lb_mux;     // Lower byte output multiplexer control
  reg       [1:0] nxt_lb_mux;
  reg       [1:0] reg_ub_mux;     // Upper byte output multiplexer control
  reg       [1:0] nxt_ub_mux;
  reg       [1:0] reg_byte_mask;  // Registered  NXTBYTEMASK (byte strobe)
  reg             reg_rd_req;     // Registered RDREQ
  reg             reg_wr_req;     // Registered WRREQ
  wire      [2:0] merged_cfgsize_hsize;  // Merged CFGSIZE and HSIZE information (for case statement)
  wire      [2:0] merged_cfgsize_reg_size; // Merged CFGSIZE and HSIZE (data phase) information (for case statement)
  wire     [15:0] i_dataout;      // Write data output mux
  reg       [7:0] read_buffer_0;  // Data buffer to hold read data
  reg       [7:0] read_buffer_1;  // Data buffer to hold read data
  reg       [7:0] read_buffer_2;  // Data buffer to hold read data

  reg      [31:0] i_hrdata;       // Read data mux

  // Detect if there is an active transfer
  assign trans_valid = HSEL & HREADY & HTRANS[1];

  // Registering transfer information for data phase
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    begin
    reg_write <= 1'b0;
    reg_active<= 1'b0;
    reg_size  <= 2'b00;
    end
  else if (HREADY)
    begin
    reg_write <= HWRITE;
    reg_active<= trans_valid;
    reg_size  <= HSIZE[1:0];
    end
  end

  // Merge size information for case statement
  assign merged_cfgsize_hsize = {CFGSIZE, HSIZE[1:0]};

  // FSM
  always @(reg_bstate or  trans_valid or reg_write or
    HWRITE or HADDR or reg_addr_low or reg_addr_high or
    reg_lb_mux or reg_ub_mux or reg_byte_mask or DONE or
    reg_rd_req or reg_wr_req or merged_cfgsize_hsize)
  begin
  case (reg_bstate)
    BUSCNV_FSM_DEF : // Default state
                     // Idle or single memory transfer
    begin
    if (trans_valid) // Note : trans_valid cannot be high until current
      begin          //        transfer is completed because of HREADY
      case (merged_cfgsize_hsize)
        3'b0_00 : begin  // Byte transfer on 8-bit memory
          nxt_bstate   = BUSCNV_FSM_DEF;
          nxt_addr_low = HADDR[1:0];
          nxt_addr_high= HADDR[AW-1:2];
          RDREQ        = ~HWRITE;
          WRREQ        =  HWRITE;
          nxt_lb_mux   = HADDR[1:0]; // Lower byte port - byte 0/1/2/3
          nxt_ub_mux   = 2'b01;      // Upper byte port - Not used
          NXTBYTEMASK  = 2'b01;
          end
        3'b0_01 : begin  // halfword transfer on 8-bit memory
          nxt_bstate   = BUSCNV_FSM_16BIT_8;
          nxt_addr_low = HADDR[1:0];
          nxt_addr_high= HADDR[AW-1:2];
          RDREQ        = ~HWRITE;
          WRREQ        =  HWRITE;
          nxt_lb_mux   = HADDR[1:0]; // Lower byte port - byte 0 / byte 2
          nxt_ub_mux   = 2'b01;      // Upper byte port - Not used
          NXTBYTEMASK  = 2'b01;
          end
        3'b0_10 : begin  // word transfer on 8-bit memory
          nxt_bstate   = BUSCNV_FSM_32BIT_8A;
          nxt_addr_low = HADDR[1:0];
          nxt_addr_high= HADDR[AW-1:2];
          RDREQ        = ~HWRITE;
          WRREQ        =  HWRITE;
          nxt_lb_mux   = HADDR[1:0]; // Lower byte port - byte 0
          nxt_ub_mux   = 2'b01;      // Upper byte port - Not used
          NXTBYTEMASK  = 2'b01;
          end
        3'b1_00 : begin  // Byte transfer on 16-bit memory
          nxt_bstate   = BUSCNV_FSM_DEF;
          nxt_addr_low = HADDR[1:0];
          nxt_addr_high= HADDR[AW-1:2];
          RDREQ        = ~HWRITE;
          WRREQ        =  HWRITE;
          nxt_lb_mux   = {HADDR[1], 1'b0}; // Lower byte port - byte 0/2
          nxt_ub_mux   = {HADDR[1], 1'b1}; // Upper byte port - byte 1/3
          NXTBYTEMASK  = {HADDR[0], ~HADDR[0]};
          end
        3'b1_01 : begin  // halfword transfer on 16-bit memory
          nxt_bstate   = BUSCNV_FSM_DEF;
          nxt_addr_low = HADDR[1:0];
          nxt_addr_high= HADDR[AW-1:2];
          RDREQ        = ~HWRITE;
          WRREQ        =  HWRITE;
          nxt_lb_mux   = {HADDR[1], 1'b0}; // Lower byte port - byte 0/2
          nxt_ub_mux   = {HADDR[1], 1'b1}; // Upper byte port - byte 1/3
          NXTBYTEMASK  = 2'b11;
          end
        3'b1_10 : begin  // word transfer on 16-bit memory
          nxt_bstate   = BUSCNV_FSM_32BIT_16;
          nxt_addr_low = HADDR[1:0];
          nxt_addr_high= HADDR[AW-1:2];
          RDREQ        = ~HWRITE;
          WRREQ        =  HWRITE;
          nxt_lb_mux   = {HADDR[1], 1'b0}; // Lower byte port - byte 0/2
          nxt_ub_mux   = {HADDR[1], 1'b1}; // Upper byte port - byte 1/3
          NXTBYTEMASK  = 2'b11;
          end
        default : begin // X propagation
          nxt_bstate   = 3'bxxx;
          nxt_addr_low = 2'bxx;
          nxt_addr_high= {(AW-2){1'bx}};
          RDREQ        = 1'bx;
          WRREQ        = 1'bx;
          nxt_lb_mux   = 2'bxx; // Lower byte port - byte 0/2
          nxt_ub_mux   = 2'bxx; // Upper byte port - byte 1/3
          NXTBYTEMASK  = 2'bxx;
          end
      endcase
      end
    else    // trans_valid==0, previous transfer can still be ongoing
      begin // therefore hold the output stable
      nxt_bstate   = BUSCNV_FSM_DEF;
      nxt_addr_low = reg_addr_low;
      nxt_addr_high= reg_addr_high;
      RDREQ        = reg_rd_req & (~DONE);
      WRREQ        = reg_wr_req & (~DONE);
      nxt_lb_mux   = reg_lb_mux; // Lower byte port - byte 0/2
      nxt_ub_mux   = reg_ub_mux; // Upper byte port - byte 1/3
      NXTBYTEMASK  = reg_byte_mask; // Byte strobe output unchanged
      end
    end
    BUSCNV_FSM_32BIT_16 : // 32-bit transfer on 16-bit memory
    begin
    if (~DONE) // First half of the transfer still on going
      begin    // therefore hold the output stable
      nxt_bstate   = reg_bstate;
      nxt_addr_low = reg_addr_low;
      nxt_addr_high= reg_addr_high;
      RDREQ        = ~reg_write;
      WRREQ        =  reg_write;
      nxt_lb_mux   = reg_lb_mux; // Lower byte port - byte 0
      nxt_ub_mux   = {reg_ub_mux[1], 1'b1}; // Upper byte port - byte 1
      NXTBYTEMASK  = reg_byte_mask; // Byte strobe output unchanged
      end
    else    // First half of the transfer is done
      begin // therefore update the output
      nxt_bstate   = BUSCNV_FSM_DEF;
      nxt_addr_low = 2'b10;
      nxt_addr_high= reg_addr_high;
      RDREQ        = ~reg_write;
      WRREQ        =  reg_write;
      nxt_lb_mux   = 2'b10; // Lower byte port - byte 2
      nxt_ub_mux   = 2'b11; // Upper byte port - byte 3
      NXTBYTEMASK  = reg_byte_mask;
      end
    end
    BUSCNV_FSM_32BIT_8A : // 32-bit transfer on 8-bit memory
    begin
    if (~DONE)  // First part of the transfer still on going
      begin     // therefore hold the output stable
      nxt_bstate   = reg_bstate;
      nxt_addr_low = reg_addr_low;
      nxt_addr_high= reg_addr_high;
      RDREQ        = ~reg_write;
      WRREQ        =  reg_write;
      nxt_lb_mux   = reg_lb_mux; // Lower byte port - byte 0
      nxt_ub_mux   = {reg_ub_mux[1], 1'b1}; // Upper byte port - Not used
      NXTBYTEMASK  = reg_byte_mask; // Byte strobe output unchanged
      end
    else    // First part of the transfer is done
      begin // therefore update the output
      nxt_bstate   = BUSCNV_FSM_32BIT_8B;
      nxt_addr_low = 2'b01;
      nxt_addr_high= reg_addr_high;
      RDREQ        = ~reg_write;
      WRREQ        =  reg_write;
      nxt_lb_mux   = 2'b01;    // Lower byte port - byte 1
      nxt_ub_mux   = {reg_ub_mux[1], 1'b1}; // Upper byte port - Not used
      NXTBYTEMASK  = reg_byte_mask; // Byte strobe output unchanged
      end
    end
    BUSCNV_FSM_32BIT_8B : // 32-bit transfer on 8-bit memory
    begin
    if (~DONE)  // second part of the transfer still on going
      begin     // therefore hold the output stable
      nxt_bstate   = reg_bstate;
      nxt_addr_low = reg_addr_low;
      nxt_addr_high= reg_addr_high;
      RDREQ        = ~reg_write;
      WRREQ        =  reg_write;
      nxt_lb_mux   = reg_lb_mux; // Lower byte port - byte 1
      nxt_ub_mux   = {reg_ub_mux[1], 1'b1}; // Upper byte port - Not used
      NXTBYTEMASK  = reg_byte_mask; // Byte strobe output unchanged
      end
    else    // second part of the transfer is done
      begin // therefore update the output
      nxt_bstate   = BUSCNV_FSM_32BIT_8C;
      nxt_addr_low = 2'b10;
      nxt_addr_high= reg_addr_high;
      RDREQ        = ~reg_write;
      WRREQ        =  reg_write;
      nxt_lb_mux   = 2'b10;    // Lower byte port - byte 2
      nxt_ub_mux   = {reg_ub_mux[1], 1'b1}; // Upper byte port - Not used
      NXTBYTEMASK  = reg_byte_mask; // Byte strobe output unchanged
      end
    end
    BUSCNV_FSM_32BIT_8C : // 32-bit transfer on 8-bit memory
    begin
    if (~DONE)  // third part of the transfer still on going
      begin     // therefore hold the output stable
      nxt_bstate   = reg_bstate;
      nxt_addr_low = reg_addr_low;
      nxt_addr_high= reg_addr_high;
      RDREQ        = ~reg_write;
      WRREQ        =  reg_write;
      nxt_lb_mux   = reg_lb_mux; // Lower byte port - byte 2
      nxt_ub_mux   = {reg_ub_mux[1], 1'b1}; // Upper byte port - Not used
      NXTBYTEMASK  = reg_byte_mask; // Byte strobe output unchanged
      end
    else    // third part of the transfer is done
      begin // therefore update the output
      nxt_bstate   = BUSCNV_FSM_DEF;
      nxt_addr_low = 2'b11;
      nxt_addr_high= reg_addr_high;
      RDREQ        = ~reg_write;
      WRREQ        =  reg_write;
      nxt_lb_mux   = 2'b11;    // Lower byte port - byte 3
      nxt_ub_mux   = {reg_ub_mux[1], 1'b1}; // Upper byte port - Not used
      NXTBYTEMASK  = reg_byte_mask; // Byte strobe output unchanged
      end
    end
    BUSCNV_FSM_16BIT_8 : // 16-bit transfer on 8-bit memory
    begin
    if (~DONE)  // first part of the transfer still on going
      begin     // therefore hold the output stable
      nxt_bstate   = reg_bstate;
      nxt_addr_low = reg_addr_low;
      nxt_addr_high= reg_addr_high;
      RDREQ        = ~reg_write;
      WRREQ        =  reg_write;
      nxt_lb_mux   = reg_lb_mux; // Lower byte port - byte 0
      nxt_ub_mux   = {reg_ub_mux[1], 1'b1}; // Upper byte port - Not used
      NXTBYTEMASK  = reg_byte_mask; // Byte strobe output unchanged
      end
    else    // first part of the transfer is done
      begin // therefore update the output
      nxt_bstate   = BUSCNV_FSM_DEF;
      nxt_addr_low = {reg_addr_low[1], 1'b1};
      nxt_addr_high= reg_addr_high;
      RDREQ        = ~reg_write;
      WRREQ        =  reg_write;
      nxt_lb_mux   = {reg_addr_low[1], 1'b1}; // Lower byte port - byte 1/3
      nxt_ub_mux   = {reg_ub_mux[1], 1'b1};   // Upper byte port - Not used
      NXTBYTEMASK  = reg_byte_mask; // Byte strobe output unchanged
      end
    end
    default : // X propagation
      begin
      nxt_bstate   = 3'bxxx;
      nxt_addr_low = 2'bxx;
      nxt_addr_high= {(AW-2){1'bx}};
      RDREQ        = 1'bx;
      WRREQ        = 1'bx;
      nxt_lb_mux   = 2'bxx; // Lower byte port
      nxt_ub_mux   = 2'bxx; // Upper byte port
      NXTBYTEMASK  = 2'bxx;
      end
  endcase
  end

  // Registering state machine signals
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    begin
    reg_bstate    <= BUSCNV_FSM_DEF;
    reg_addr_low  <= 2'b00;
    reg_addr_high <= {(AW-2){1'b0}};
    reg_rd_req    <= 1'b0;
    reg_wr_req    <= 1'b0;
    reg_lb_mux    <= 2'b00;
    reg_ub_mux    <= 2'b00;
    reg_byte_mask <= 2'b00;
    end
  else
    begin
    reg_bstate    <= nxt_bstate;
    reg_addr_low  <= nxt_addr_low;
    reg_addr_high <= nxt_addr_high;
    reg_rd_req    <= RDREQ;
    reg_wr_req    <= WRREQ;
    reg_lb_mux    <= nxt_lb_mux;
    reg_ub_mux    <= nxt_ub_mux;
    reg_byte_mask <= NXTBYTEMASK;
    end
  end

  // Address to SRAM
  assign ADDR = {reg_addr_high, reg_addr_low};
  // Lower byte routing
  assign i_dataout[ 7:0] = (reg_lb_mux[1]) ? ((reg_lb_mux[0]) ? HWDATA[31:24] :  HWDATA[23:16]) :
                                          ((reg_lb_mux[0]) ? HWDATA[15: 8] :  HWDATA[ 7: 0]) ;
  // Upper byte routing
  assign i_dataout[15:8] = (reg_ub_mux[1]) ? HWDATA[31:24] : HWDATA[15: 8];
       // Note : reg_ub_mux[0] always 1

  // Register routed data out
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    begin
    DATAOUT <= {16{1'b0}};
    end
  else if (reg_active)
    begin
    DATAOUT <= i_dataout;
    end
  end

  // Read data buffer byte 0
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    read_buffer_0 <= {8{1'b0}};
  else if (reg_active & (~reg_write))
    begin
    if (DONE & (reg_lb_mux[1:0] == 2'b00))
        read_buffer_0 <= DATAIN[7:0];
    end
  end

  // Read data buffer byte 1
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    read_buffer_1 <= {8{1'b0}};
  else if (reg_active & (~reg_write))
    begin
    if (DONE & (reg_bstate == BUSCNV_FSM_32BIT_16)) // 32-bit transfer on 16-bit memory
        read_buffer_1 <= DATAIN[15:8];
    else if (DONE & (reg_bstate == BUSCNV_FSM_32BIT_8B)) // 32-bit transfer on 8-bit memory
        read_buffer_1 <= DATAIN[ 7:0];
    end
  end

  // Read data buffer byte 2
  always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    read_buffer_2 <= {8{1'b0}};
  else if (reg_active & (~reg_write))
    begin
    if (DONE & (reg_bstate == BUSCNV_FSM_16BIT_8)) // 16-bit transfer on 8-bit memory
        read_buffer_2 <= DATAIN[7:0];
    else if (DONE & (reg_bstate == BUSCNV_FSM_32BIT_8C)) // 32-bit transfer on 8-bit memory
        read_buffer_2 <= DATAIN[ 7:0];
    end
  end


  assign merged_cfgsize_reg_size = {CFGSIZE , reg_size[1:0]};

  // Routing of read data
  always @(merged_cfgsize_reg_size or DATAIN or read_buffer_0 or read_buffer_1 or read_buffer_2)
  begin
  case (merged_cfgsize_reg_size)
    3'b0_00 : i_hrdata = { DATAIN[ 7:0],   DATAIN[7:0],   DATAIN[7:0],   DATAIN[7:0]}; // Byte  read on 8-bit memory
    3'b0_01 : i_hrdata = { DATAIN[ 7:0], read_buffer_2,   DATAIN[7:0], read_buffer_0}; // HWord read on 8-bit memory
    3'b0_10 : i_hrdata = { DATAIN[ 7:0], read_buffer_2, read_buffer_1, read_buffer_0}; // Word  read on 8-bit memory
    3'b0_11 : i_hrdata = { DATAIN[ 7:0], read_buffer_2, read_buffer_1, read_buffer_0}; // Invalid
    3'b1_00 : i_hrdata = { DATAIN[15:8],   DATAIN[7:0],  DATAIN[15:8],   DATAIN[7:0]}; // Byte  read on 16-bit memory
    3'b1_01 : i_hrdata = { DATAIN[15:8],   DATAIN[7:0],  DATAIN[15:8],   DATAIN[7:0]}; // HWord read on 16-bit memory
    3'b1_10 : i_hrdata = { DATAIN[15:8],   DATAIN[7:0], read_buffer_1, read_buffer_0}; // Word  read on 16-bit memory
    3'b1_11 : i_hrdata = { DATAIN[15:8],   DATAIN[7:0], read_buffer_1, read_buffer_0}; // Invalid
    default : i_hrdata = {32{1'bx}};
  endcase
  end

  // Ready if there is no active transfers, or
  // A transfer is completed
  assign HREADYOUT   = (~reg_active) | ((reg_bstate==BUSCNV_FSM_DEF) & DONE);

  // Generate error response
  assign HRESP       = 1'b0;

  // Connect read data to AHB
  assign HRDATA      = i_hrdata;

  // Connection to top for OVL checking in top level
  assign BUSFSMSTATE = reg_bstate;

`ifdef ARM_AHB_ASSERT_ON
   // ------------------------------------------------------------
   // Assertions
   // ------------------------------------------------------------
`include "std_ovl_defines.h"

   // FSM state must be valid
   assert_always
     #(`OVL_ERROR,`OVL_ASSERT,
       "Invalid FSM state")
   u_ovl_state_invalid
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr( (reg_bstate == BUSCNV_FSM_DEF     ) |
                  (reg_bstate == BUSCNV_FSM_32BIT_8A) |
                  (reg_bstate == BUSCNV_FSM_32BIT_8B) |
                  (reg_bstate == BUSCNV_FSM_32BIT_8C) |
                  (reg_bstate == BUSCNV_FSM_32BIT_16) |
                  (reg_bstate == BUSCNV_FSM_16BIT_8 )  ));

   // Read request and write request cannot be asserted at the same time
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "Both RDREQ and WRREQ are asserted")
   u_ovl_request_illegal
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr(RDREQ & WRREQ));

   // If there is a falling edge of Read request (RDREQ), DONE must be high
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Read request dropped without DONE")
   u_ovl_rdreq_drop
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((~RDREQ) & reg_rd_req),
      .consequent_expr(DONE)
      );

   // If there is a falling edge of Write request (WRREQ), DONE must be high
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Write request dropped without DONE")
   u_ovl_wrreq_drop
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((~WRREQ) & reg_wr_req),
      .consequent_expr(DONE)
      );

   // If Done is 1, either WRREQ or RDREQ should be 1 in the last cycle
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "DONE asserted with no request")
   u_ovl_done_assoicate_with_request
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(DONE),
      .consequent_expr(reg_rd_req | reg_wr_req )
      );


   // If the transfer is 8-bit, 16-bit or 32-bit, generate Read Request or Write request
   assert_implication
     #(`OVL_ERROR, `OVL_ASSERT, "Supported read transfers must result in RDREQ")
   u_ovl_read_request_generation
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(trans_valid & (HSIZE[1:0]!=2'b11) & (~HWRITE)),
      .consequent_expr(RDREQ) );  //

   assert_implication
     #(`OVL_ERROR, `OVL_ASSERT, "Supported write transfers must result in WRREQ")
   u_ovl_write_request_generation
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(trans_valid & (HSIZE[1:0]!=2'b11) & HWRITE),
      .consequent_expr(WRREQ) );  //

   // Parameterisable configuration check
   assert_never_unknown
     #(`OVL_FATAL,1,`OVL_ASSERT,"CFGSIZE unknown")
   u_ovl_cfg_cfgsize
     ( .clk(HCLK), .reset_n(HRESETn), .qualifier(1'b1),
       .test_expr(CFGSIZE) );

   // When doing multi-part transfers, HREADYOUT should not be asserted
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HREADYOUT asserted too early")
   u_ovl_hreadyout_asserted_too_early
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(
         (reg_bstate==BUSCNV_FSM_32BIT_8A)|
         (reg_bstate==BUSCNV_FSM_32BIT_8B)|
         (reg_bstate==BUSCNV_FSM_32BIT_8C)|
         (reg_bstate==BUSCNV_FSM_16BIT_8) |
         (reg_bstate==BUSCNV_FSM_32BIT_16)
         ),
      .consequent_expr(~HREADYOUT)
      );

`endif

endmodule

