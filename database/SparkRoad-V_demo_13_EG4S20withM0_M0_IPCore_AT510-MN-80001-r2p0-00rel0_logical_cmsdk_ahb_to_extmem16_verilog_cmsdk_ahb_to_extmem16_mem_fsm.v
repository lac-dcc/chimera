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
// Abstract : Memory interface state machine for AHB to external memory interface
//-----------------------------------------------------------------------------
// This module generates memory control for each memory access.

module cmsdk_ahb_to_extmem16_mem_fsm(
// --------------------------------------------------------------------------
// Port Definitions
// --------------------------------------------------------------------------
  input  wire        HCLK,
  input  wire        HRESETn,       // Reset

  // Interface to AHB FSM
  input  wire        RDREQ,         // Read request
  input  wire        WRREQ,         // Write request
  input  wire  [1:0] NXTBYTEMASK,   // Byte Mask (unregistered)
  output wire        DONE,          // Transfer done

  // Static configuration
  input  wire  [2:0] CFGREADCYCLE,  // Read cycles
  input  wire  [2:0] CFGWRITECYCLE, // Write cycles
  input  wire  [2:0] CFGTURNAROUNDCYCLE, // Turn around cycles

  // Memory control signals
  output wire        DATAOEn,       // Data Output (tristate) enable (write) - active low
  output wire        WEn,           // Write Control - active low
  output wire        OEn,           // SRAM output enable (read)  - active low
  output wire        CEn,           // Chip enable - active low
  output wire        LBn,           // Lower byte strobe - active low
  output wire        UBn,           // Upper byte strobe - active low

  // For OVL
  output wire  [2:0] MEMFSMSTATE);

  // --------------------------------------------------------------------------
  // Internal wires
  // --------------------------------------------------------------------------
  reg  [2:0]    reg_mstate;
  reg  [2:0]    nxt_mstate;

  localparam EXTMEM_FSM_IDLE   = 3'b000;
  localparam EXTMEM_FSM_WRITE1 = 3'b001;
  localparam EXTMEM_FSM_WRITE2 = 3'b011;
  localparam EXTMEM_FSM_WRITE3 = 3'b010;
  localparam EXTMEM_FSM_READ1  = 3'b100;

  reg           reg_dataoe_n;
  reg           nxt_dataoe_n;
  reg           reg_we_n;
  reg           nxt_we_n;
  reg           reg_oe_n;
  reg           nxt_oe_n;
  reg           reg_ce_n;
  reg           nxt_ce_n;
  reg  [1:0]    reg_bs_n;
  reg  [1:0]    nxt_bs_n;

  reg  [2:0]    reg_mcount;     // Counter for wait state
  reg  [2:0]    nxt_mcount;
  reg           last_operation; // Record last operation (1=write, 0=read)
  wire          nxt_last_operation;
  wire [2:0]    dec_mcount;     // Decrement of reg_mcount

  assign        dec_mcount = reg_mcount - 1'b1; // Decrement wait state counter

// Memory interface FSM
always @(reg_mstate or RDREQ or WRREQ or reg_mcount or CFGREADCYCLE or
   CFGWRITECYCLE or CFGTURNAROUNDCYCLE or last_operation or dec_mcount)
begin
  case (reg_mstate)
    EXTMEM_FSM_IDLE :
      begin
      if (RDREQ)
        begin
        if ((reg_mcount!= {3{1'b0}}) & (last_operation))
          begin  // Wait for turn around
          nxt_mstate   = EXTMEM_FSM_IDLE;
          nxt_mcount   = dec_mcount;
          end
        else
          begin  // Goto read operation
          nxt_mstate   = EXTMEM_FSM_READ1;
          nxt_mcount   = CFGREADCYCLE;
          end
        end
      else if (WRREQ)
        begin
        if ((reg_mcount!= {3{1'b0}}) & (~last_operation))
          begin  // Wait for turn around
          nxt_mstate   = EXTMEM_FSM_IDLE;
          nxt_mcount   = dec_mcount;
          end
        else
          begin  // Goto write operation
          nxt_mstate   = EXTMEM_FSM_WRITE1;
          nxt_mcount   = CFGWRITECYCLE;
          end
        end
      else if ((reg_mcount!= {3{1'b0}}))
        begin
        nxt_mstate   = EXTMEM_FSM_IDLE;
        nxt_mcount   = dec_mcount;
        end
      else
        begin
        nxt_mstate   = EXTMEM_FSM_IDLE;
        nxt_mcount   = {3{1'b0}};
        end
      end
    EXTMEM_FSM_READ1:
      begin
      if (reg_mcount!= {3{1'b0}})
        begin
        nxt_mstate   = EXTMEM_FSM_READ1;
        nxt_mcount   = dec_mcount;
        end
      else if (RDREQ) // Read after read - no turn around cycle
        begin
        nxt_mstate   = EXTMEM_FSM_READ1;
        nxt_mcount   = CFGREADCYCLE;
        end
      else
        begin
        nxt_mstate   = EXTMEM_FSM_IDLE;
        nxt_mcount   = CFGTURNAROUNDCYCLE;
        end
      end
    EXTMEM_FSM_WRITE1: // Address setup
      begin
      nxt_mstate   = EXTMEM_FSM_WRITE2;
      nxt_mcount   = CFGWRITECYCLE;
      end
    EXTMEM_FSM_WRITE2:
      if (reg_mcount!= {3{1'b0}})
        begin
        nxt_mstate   = EXTMEM_FSM_WRITE2;
        nxt_mcount   = dec_mcount;
        end
      else
        begin
        nxt_mstate   = EXTMEM_FSM_WRITE3;
        nxt_mcount   = {3{1'b0}};
        end
    EXTMEM_FSM_WRITE3: begin
      if (WRREQ)
        begin
        nxt_mstate   = EXTMEM_FSM_WRITE1;
        nxt_mcount   = CFGWRITECYCLE;
        end
      else
        begin
        nxt_mstate   = EXTMEM_FSM_IDLE;
        nxt_mcount   = CFGTURNAROUNDCYCLE;
        end
      end
    default: // X propagation
      begin
      nxt_mstate   = 3'bxxx;
      nxt_mcount   = 3'bxxx;
      end
  endcase
end

// Generate DONE signal to indicate the memory interface is
// read for another transfer
assign DONE = ((reg_mstate==EXTMEM_FSM_READ1) & (reg_mcount==3'b000)) |
              (reg_mstate==EXTMEM_FSM_WRITE3);

// Record last operation
assign nxt_last_operation = (reg_mstate == EXTMEM_FSM_WRITE3);

// Registering last operation information
always @(posedge HCLK or negedge HRESETn)
  begin
  if (~HRESETn)
    last_operation <= 1'b0;
  else if (DONE)
    last_operation <= nxt_last_operation;
  end

// Generate memory interface outputs
always @(nxt_mstate or NXTBYTEMASK)
begin
  case (nxt_mstate)
    EXTMEM_FSM_IDLE :
        begin
        nxt_dataoe_n = 1'b1;
        nxt_ce_n     = 1'b1;
        nxt_oe_n     = 1'b1;
        nxt_we_n     = 1'b1;
        nxt_bs_n     = 2'b11;
        end
    EXTMEM_FSM_READ1 :
        begin
        nxt_dataoe_n = 1'b1;
        nxt_ce_n     = 1'b0;
        nxt_oe_n     = 1'b0;
        nxt_we_n     = 1'b1;
        nxt_bs_n     = ~NXTBYTEMASK;
        end
    EXTMEM_FSM_WRITE1, EXTMEM_FSM_WRITE3 :
        begin
        nxt_dataoe_n = 1'b0; // active
        nxt_ce_n     = 1'b0;
        nxt_oe_n     = 1'b1;
        nxt_we_n     = 1'b1;
        nxt_bs_n     = ~NXTBYTEMASK;
        end
    EXTMEM_FSM_WRITE2 :
        begin
        nxt_dataoe_n = 1'b0; // active
        nxt_ce_n     = 1'b0;
        nxt_oe_n     = 1'b1;
        nxt_we_n     = 1'b0;
        nxt_bs_n     = ~NXTBYTEMASK;
        end
    default:
        begin  // X propagation
        nxt_dataoe_n = 1'bx;
        nxt_ce_n     = 1'bx;
        nxt_oe_n     = 1'bx;
        nxt_we_n     = 1'bx;
        nxt_bs_n     = 2'bxx;
        end
  endcase
end

// Registering state and outputs
always @(posedge HCLK or negedge HRESETn)
begin
  if (~HRESETn)
    begin
    reg_mstate    <= EXTMEM_FSM_IDLE;
    reg_mcount    <= 3'b000;
    reg_dataoe_n  <= 1'b1;
    reg_ce_n      <= 1'b1;
    reg_oe_n      <= 1'b1;
    reg_we_n      <= 1'b1;
    reg_bs_n      <= 2'b11;
    end
  else
    begin
    reg_mstate    <= nxt_mstate;
    reg_mcount    <= nxt_mcount;
    reg_dataoe_n  <= nxt_dataoe_n;
    reg_ce_n      <= nxt_ce_n;
    reg_oe_n      <= nxt_oe_n;
    reg_we_n      <= nxt_we_n;
    reg_bs_n      <= nxt_bs_n;
    end
end

// Connect to top level
assign DATAOEn  = reg_dataoe_n;
assign CEn      = reg_ce_n;
assign WEn      = reg_we_n;
assign OEn      = reg_oe_n;
assign LBn      = reg_bs_n[0];
assign UBn      = reg_bs_n[1];


assign MEMFSMSTATE = reg_mstate;

`ifdef ARM_AHB_ASSERT_ON
   // ------------------------------------------------------------
   // Assertions
   // ------------------------------------------------------------
`include "std_ovl_defines.h"
   // Ensure reg_mstate must be valid
   assert_always
     #(`OVL_ERROR,`OVL_ASSERT,
       "FSM in an illegal state")
   u_ovl_curr_state_illegal
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((reg_mstate == EXTMEM_FSM_IDLE  ) |
                 (reg_mstate == EXTMEM_FSM_WRITE1) |
                 (reg_mstate == EXTMEM_FSM_WRITE2) |
                 (reg_mstate == EXTMEM_FSM_WRITE3) |
                 (reg_mstate == EXTMEM_FSM_READ1 )  ));


  // Store last state of control signals
  reg     ovl_last_dataoe_n;
  reg     ovl_last_we_n;
  reg     ovl_last_oe_n;
  reg     ovl_last_ce_n;
  reg     ovl_last_lb_n;
  reg     ovl_last_ub_n;

  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      begin
      ovl_last_dataoe_n    <= 1'b1;
      ovl_last_we_n        <= 1'b1;
      ovl_last_oe_n        <= 1'b1;
      ovl_last_ce_n        <= 1'b1;
      ovl_last_lb_n        <= 1'b1;
      ovl_last_ub_n        <= 1'b1;
      end
    else
      begin
      ovl_last_dataoe_n    <= DATAOEn;
      ovl_last_we_n        <= WEn;
      ovl_last_oe_n        <= OEn;
      ovl_last_ce_n        <= CEn;
      ovl_last_lb_n        <= LBn;
      ovl_last_ub_n        <= UBn;
      end
    end

  // Detect end of read
  wire ovl_rising_oe_n = OEn & (~ovl_last_oe_n);
  // Detect end of write
  wire ovl_rising_we_n = WEn & (~ovl_last_we_n);

  // Counters for measuring read, write and turnaround cycle width
  reg  [7:0]  ovl_reg_read_width_counter;
  reg  [7:0]  ovl_reg_write_width_counter;
  reg  [7:0]  ovl_reg_tn_rd_width_counter;
  reg         ovl_reg_ignore_tn_asrt;
  wire [7:0]  ovl_nxt_read_width_counter;
  wire [7:0]  ovl_nxt_write_width_counter;
  wire [7:0]  ovl_nxt_tn_rd_width_counter;
  wire        ovl_nxt_ignore_tn_asrt;

  // Counters to measure the width of read and write
  assign ovl_nxt_read_width_counter  = ((OEn==1'b0)&(ovl_reg_read_width_counter==8'hFF)) ? 8'hff :
                                       ((OEn==1'b0)&(ovl_reg_read_width_counter!=8'hFF)) ?
                                       (ovl_reg_read_width_counter+8'h1):8'h01;
  assign ovl_nxt_write_width_counter = ((WEn==1'b0)&(ovl_reg_write_width_counter==8'hFF)) ? 8'hff :
                                       ((WEn==1'b0)&(ovl_reg_write_width_counter!=8'hFF)) ?
                                       (ovl_reg_write_width_counter+8'h1):8'h01;
  assign ovl_nxt_tn_rd_width_counter = ((DATAOEn==1'b1)&(OEn==1'b1)&(ovl_reg_tn_rd_width_counter==8'hFF)) ? 8'hff :
                                       ((DATAOEn==1'b1)&(OEn==1'b1)&(ovl_reg_tn_rd_width_counter!=8'hFF)) ?
                                       (ovl_reg_tn_rd_width_counter+8'h1):8'h01;

  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      begin
      ovl_reg_ignore_tn_asrt      <= 1'b1;
      ovl_reg_write_width_counter <= 8'h01;
      ovl_reg_read_width_counter  <= 8'h01;
      ovl_reg_tn_rd_width_counter <= 8'h01;
      end
    else
      begin
      ovl_reg_ignore_tn_asrt      <= ovl_nxt_ignore_tn_asrt;
      ovl_reg_write_width_counter <= ovl_nxt_write_width_counter;
      ovl_reg_read_width_counter  <= ovl_nxt_read_width_counter;
      ovl_reg_tn_rd_width_counter <= ovl_nxt_tn_rd_width_counter;
      end
   end

  // Width of OEn (Output Enable) should be at least 1+CFGREADCYCLE
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Width of OEn should be at least 1+CFGREADCYCLE")
   u_ovl_read_width
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_rising_oe_n),
      .consequent_expr(ovl_reg_read_width_counter > (8'h01+CFGREADCYCLE))
      );

  // Width of WEn (Write Enable) should be 1+CFGWRITECYCLE
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Width of write should be 1+CFGWRITECYCLE")
   u_ovl_write_width
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_rising_we_n),
      .consequent_expr(ovl_reg_write_width_counter > (8'h01+CFGWRITECYCLE))
      );

  // Gap between DATAOEn and OEn must be at least 1+CFGTURNAROUNDCYCLE or more
  reg    ovl_reg_last_read_write_op; // Store information about if last operation is read (0) or write (1)
  wire   ovl_nxt_last_read_write_op = (DATAOEn==1'b0) ? 1'b1 : ((OEn==1'b0) ? 1'b0 : ovl_reg_last_read_write_op);
  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      ovl_reg_last_read_write_op <= 1'b0;
    else
      ovl_reg_last_read_write_op <= ovl_nxt_last_read_write_op;
   end

  wire   ovl_read_start = (~OEn)     & ovl_last_oe_n;
  wire   ovl_write_start= (~DATAOEn) & ovl_last_dataoe_n;

  // Check for turnaround cycle check disabled on first transaction post-reset
  assign ovl_nxt_ignore_tn_asrt = ~(ovl_read_start | ovl_write_start) & ovl_reg_ignore_tn_asrt;

     // If last operation is read, and new operation is write, or
     // If last operation is write, and new operation is read
     assert_implication
       #(`OVL_ERROR,`OVL_ASSERT,
         "Width of turn around gap should be > CFGTURNAROUNDCYCLE+1")
     u_ovl_turn_around_width_1
       (.clk(HCLK), .reset_n(HRESETn),
        .antecedent_expr(((ovl_write_start & (~ovl_reg_last_read_write_op))|
                          (ovl_read_start  &   ovl_reg_last_read_write_op)) & (~ovl_reg_ignore_tn_asrt)),
        .consequent_expr(ovl_reg_tn_rd_width_counter > (8'h01+CFGTURNAROUNDCYCLE))
        );

  // Memory interface FSM stuck

   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "Memory interface FSM seems to be stuck")
   u_ovl_memory_interface_fsm_stucked
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((CFGREADCYCLE>8'hF0)|(CFGWRITECYCLE>8'hF0))
      );


  // When OEn is active, DATAOEn must not be active
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "OEn and DATAOEn must not be active at the same time")
   u_ovl_bus_conflict
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((OEn==1'b0)&(DATAOEn==1'b0)));

  // When write is active, either LBn or UBn should be active, or both
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Either LBn or UBn should be active during write")
   u_ovl_byte_strobe_write
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(reg_mstate==EXTMEM_FSM_WRITE2),
      .consequent_expr((LBn==1'b0)|(UBn==1'b0))
      );

  // when WEn is active, DATAOEn must be active
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "DATAOEn must be active when WEn is active")
   u_ovl_byte_write_waveform
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(WEn==1'b0),
      .consequent_expr(DATAOEn==1'b0)
      );

  // DATAOEn should be active one cycle before WEn active
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "DATAOEn must be active before WEn is active")
   u_ovl_byte_write_waveform_2
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(WEn==1'b0),
      .consequent_expr(ovl_last_dataoe_n==1'b0)
      );

  // DATAOEn should be active one cycle after WEn if transfer is write
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "DATAOEn must be active for 1 cycle after WEn is active")
   u_ovl_byte_write_waveform_3
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_last_we_n==1'b0),
      .consequent_expr(DATAOEn==1'b0)
      );

  // Chip Enable (CEn) must be active during read or write
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "CEn must be active during read or write")
   u_ovl_ce_n_active
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((OEn==1'b0)|(DATAOEn==1'b0)),
      .consequent_expr(CEn==1'b0)
      );


`endif
endmodule

