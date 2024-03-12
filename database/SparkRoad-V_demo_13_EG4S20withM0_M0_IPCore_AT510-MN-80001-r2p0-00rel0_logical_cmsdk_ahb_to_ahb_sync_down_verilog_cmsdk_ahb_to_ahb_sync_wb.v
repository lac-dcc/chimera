//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2011-2013 ARM Limited.
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
// Abstract : AHB write buffer
//-----------------------------------------------------------------------------

module cmsdk_ahb_to_ahb_sync_wb
  #(
   // -------------------------------------------------------------------------
   // Parameters
   // -------------------------------------------------------------------------
   parameter       AW    = 32,  // Define the address width
   parameter       DW    = 32,  // Define the data width
   parameter       MW    = 4    // Define the master number width
   )
  (
  // --------------------------------------------------------------------------
  // I/O declaration
  // --------------------------------------------------------------------------
  input  wire           HCLK,       // Clock
  input  wire           HRESETn,    // Reset

  input  wire           HCLKEN,     // Clock enable signal to allow AHB operate at a divided clock speed

  input  wire           BUFFERABLE, // Indicate transfer is bufferable.
                                    // This can be abstracted from HPROT[2], or
                                    // alternatively this can be decode from memory address

  // AHB connection to master
  input  wire           HSELS,
  input  wire  [AW-1:0] HADDRS,
  input  wire     [1:0] HTRANSS,
  input  wire     [2:0] HSIZES,
  input  wire           HWRITES,
  input  wire           HREADYS,
  input  wire     [3:0] HPROTS,
  input  wire  [MW-1:0] HMASTERS,
  input  wire           HMASTLOCKS,
  input  wire  [DW-1:0] HWDATAS,
  input  wire     [2:0] HBURSTS,

  output wire           HREADYOUTS,
  output wire           HRESPS,
  output wire  [DW-1:0] HRDATAS,

  // AHB connection to slave
  output wire           HSELM,
  output wire  [AW-1:0] HADDRM,
  output wire     [1:0] HTRANSM,
  output wire     [2:0] HSIZEM,
  output wire           HWRITEM,
  output wire           HREADYM,
  output wire     [3:0] HPROTM,
  output wire  [MW-1:0] HMASTERM,
  output wire           HMASTLOCKM,
  output wire  [DW-1:0] HWDATAM,
  output wire     [2:0] HBURSTM,

  input  wire           HREADYOUTM,
  input  wire           HRESPM,
  input  wire  [DW-1:0] HRDATAM,

  output wire           BWERR);     // Bufferable write error signal, valid for one HCLK cycle

// Parameter to define behavior
localparam      AHB_COMPLIANT_LVL = 1; // Should be set to 1
// Level 0 - Not fully AHB compliant. Address phase signals appear on master port
//           might not follow AHB Lite protocol during switching of control path
//           when the write buffer is not selected.  It is not a problem provided
//           that the downstream AHB slaves ignore the address phase signals when
//           HSEL is low.
//           Also IDLE transfer do not get insert in unlocking.
// Level 1 - AHB Lite compliant. Transfers are masked if device is not selected.
//           This might affect timing (maximum frequency) and slightly increase the
//           area.
//           When changing from a locked transfer to an unlocked transfer, an
//           IDLE cycle will be inserted. (AMBA 3 recommendation)

  // --------------------------------------------------------------------------------
  // Derived parameters

  localparam       HSIZE_W   = (DW > 64) ? 3 : 2; // Width of HSIZE that need to be stored
  localparam       HSIZE_MAX = HSIZE_W - 1;       // MSB of HSIZE register

 // --------------------------------------------------------------------------------
 // Internal wires declarations
 // --------------------------------------------------------------------------------
  // Address phase buffer
  reg     [AW-1:0] reg_haddr;
  reg        [1:0] reg_htrans;
  reg              reg_hwrite;
  reg [HSIZE_MAX:0] reg_hsize;
  reg     [MW-1:0] reg_hmasters;
  reg              reg_hmastlocks;
  reg        [2:0] reg_hburst;
  reg        [3:0] reg_hprot;
  wire       [2:0] reg_hsize_padded;

  // write data buffer for buffered write
  reg     [DW-1:0] reg_hwdata;

  reg              reg_bufferable;    // Current transfer in buffer is a bufferable transfer
  wire             nxt_bufferable;    // next state of reg_bufferable
  wire             bufferable_m;      // Master side bufferable transfer (address phase)
  reg              reg_bufferable_m;  // Master side bufferable transfer (data phase)

  reg              reg_buf_pend;      // A transfer is held in address phase buffer
  wire             set_buf_pend;      // set reg_buf_pend
  wire             clr_buf_pend;      // clear reg_buf_pend

  reg              reg_bufwr_running; // Buffered write is running (data phase of buffered write)
  wire             nxt_bufwr_running; // next state for reg_bufwr_running

  reg              reg_locked_data_phase_s; // locked transfer on slave interface
  wire             nxt_locked_data_phase_s; // locked transfer on slave interface
  wire             unlock_s;                // unlock operation on slave interface

  reg              reg_unlock_idle_req;     // Unlock operation is required & downstream AHB have not seen the unlock yet
  wire             set_unlock_idle_req;     // Set control for reg_unlock_idle_req
  wire             clr_unlock_idle_req;     // Clear control for reg_unlock_idle_req

  reg              idle_injection_done;     // Data phase of idle injection
  wire             idle_injection_early;    // Suppress HTRANS when HMASTLOCK switch low when a locked transfer is running
  wire             idle_injection_now;      // Indicate idle injection is needed for unlocking
  wire             idle_injection_now_2;    // Indicate idle injection is needed delaying HTRANS going to downstream AHB

  wire             address_phase_output_sel; // Address phase signal output select.
                                             // 0 = bypass
                                             // 1 = from Address Phase buffer
  wire             trans_valid;       // Incoming Transfer valid
  wire             trans_valid_rdy;   // Incoming Transfer valid and HREADYS is 1 (accept)

  wire             hreadym_mux;       // Multiplexer for HREADYM sent back to downstream AHB slaves
  reg              hreadouts_mux;     // HREADYOUTS multiplexer feedback to master

  reg              reg_bwerr;         // Generate a one cycle pulse when a buffered write receive error
  wire             nxt_bwerr;

                                      // Signals to mask tansfers if AHB compliant is required
  wire             i_hsel;            // HSEL at output port
  wire       [1:0] i_htrans;          // internal version of HTRANS output before masking
  wire       [2:0] i_hburst;          // internal version of HBURST output before masking
  wire             i_hmastlock;       // internal version of HMASTLOCK output before masking
  // --------------------------------------------------------------------------------
  // Start of main code
  // --------------------------------------------------------------------------------

  assign    trans_valid     = HSELS & HTRANSS[1];
  assign    trans_valid_rdy = trans_valid & HREADYS;

  // Decide bufferable or non-bufferable
  // - Must be a valid write transfers
  // - Indicated as bufferable
  assign    nxt_bufferable  = trans_valid & HWRITES & BUFFERABLE;

  // Current transfer on AHB master interface (address phase) is bufferable
  assign    bufferable_m  = (address_phase_output_sel) ? reg_bufferable  : (nxt_bufferable & HREADYS);

  // Data phase on master interface is bufferable
  // (Valid only on the first cycle of the data phase)
  always @(posedge HCLK or negedge HRESETn)
    begin : p_reg_bufferable_m
    if (~HRESETn)
      reg_bufferable_m <= 1'b0;
    else if (HCLKEN)
      reg_bufferable_m <= bufferable_m & hreadym_mux;
    end

  // Bufferable write will not happen for transfer with zero wait state
  // or if the first cycle of the transfer got an error response.
  assign nxt_bufwr_running = (reg_bufferable_m  & (~HREADYOUTM) & (~HRESPM)) |
                             (reg_bufwr_running & (~HREADYOUTM));
                             // This signal is deasserted at the end of the transfer

  always @(posedge HCLK or negedge HRESETn)
    begin : p_reg_bufwr_running
    if (~HRESETn)
      reg_bufwr_running <= 1'b0;
    else if (HCLKEN)
      reg_bufwr_running <= nxt_bufwr_running;
    end

  //--------------------------------------------------------------------
  // Address phase buffer
  //   Store transfer in buffer if
  //    - device is selected and
  //    - HREADYS is high, and
  //    - downstream AHB slave has not accept the transfer
  always @(posedge HCLK or negedge HRESETn)
    begin : p_address_phase_buffers
     if (~HRESETn)
       begin
       reg_haddr       <= {AW{1'b0}};
       reg_htrans      <= {2{1'b0}};
       reg_hwrite      <= 1'b0;
       reg_hsize       <= {HSIZE_W{1'b0}};
       reg_hmasters    <= {MW{1'b0}};
       reg_hmastlocks  <= 1'b0;
       reg_hburst      <= {3{1'b0}};
       reg_hprot       <= {4{1'b0}};
       reg_bufferable  <= 1'b0;
       end
     else if (HCLKEN & set_buf_pend)
       begin
       reg_haddr       <= HADDRS;
       reg_htrans      <= HTRANSS;
       reg_hwrite      <= HWRITES;
       reg_hsize       <= HSIZES[HSIZE_MAX:0];
       reg_hmasters    <= HMASTERS;
       reg_hmastlocks  <= HMASTLOCKS;
       reg_hburst      <= HBURSTS;
       reg_hprot       <= HPROTS;
       reg_bufferable  <= nxt_bufferable;
       end
    end

  // Add padding to store HSIZE if needed
  assign reg_hsize_padded[2]   = (DW > 64) ? reg_hsize[HSIZE_MAX] : 1'b0;
  assign reg_hsize_padded[1:0] = reg_hsize[1:0];

  // Set reg_buf_pend when a transfer is loaded into the hold buffer
  //  which happen when a new transfer is being accepted (trans_valid_rdy=1), and
  //  if (1) there is wait state on the slave side (e.g. buffered write still on going),
  //     (2) idle is being injected
  assign set_buf_pend = (trans_valid_rdy & ((~hreadym_mux) | idle_injection_now | reg_bufwr_running));

  // Clear reg_buf_pend when a held transfer is output to the downstrem AHB slaves.
  // Note: If idle_injection_now is 1, then current output is idle, so not not clear the
  //       reg_buf_pend
  assign clr_buf_pend = hreadym_mux & (~idle_injection_now) & (~ (trans_valid_rdy & reg_bufwr_running));

  // Register buffer filled status
  always @(posedge HCLK or negedge HRESETn)
    begin : p_reg_buf_pend
    if (~HRESETn)
      reg_buf_pend <= 1'b0;
    else if (HCLKEN & (set_buf_pend | clr_buf_pend))
      reg_buf_pend <= ~clr_buf_pend;  // Clear has higher priority
    end

  assign address_phase_output_sel = reg_buf_pend;

  //--------------------------------------------------------------------
  // Unlock Idle insertion - enable when AHB_COMPLIANT_LVL localparam is non-zero

  wire idle_inject_enable = (AHB_COMPLIANT_LVL!= 0);

  // first - determine lock transfer sequence (Note: idle can be part of a locked transfers)
  assign nxt_locked_data_phase_s = HMASTLOCKS & HSELS & (HTRANSS[1] | reg_locked_data_phase_s) & idle_inject_enable;

  always @(posedge HCLK or negedge HRESETn)
    begin : p_reg_locked_data_phase_s
    if (~HRESETn)
      reg_locked_data_phase_s <= 1'b0;
    else if (HCLKEN & HREADYS)
      reg_locked_data_phase_s <= nxt_locked_data_phase_s;
    end

  // Detection of unlock operation from upstream AHB
  assign unlock_s = reg_locked_data_phase_s & HREADYS & (~HMASTLOCKS) & idle_inject_enable;

  // Detect if unlock idle transfer is required
  // - unlocking take place, but
  // - down stream AHB couldn't see it as buffered write still on going
  assign set_unlock_idle_req = unlock_s & (reg_bufferable_m|reg_bufwr_running) & (~HREADYOUTM);

  assign clr_unlock_idle_req = HREADYOUTM;

  // Registering unlock request - assert after transfer is commited.
  // When the unlocked transfer is in the holding buffer, this is set to 1
  always @(posedge HCLK or negedge HRESETn)
    begin : p_reg_unlock_idle_req
    if (~HRESETn)
      reg_unlock_idle_req <= 1'b0;
    else if (HCLKEN & (set_unlock_idle_req|clr_unlock_idle_req))
      reg_unlock_idle_req <= set_unlock_idle_req;
    end

  // If a valid unlocking transfer come up, they need to be
  // blocked so that we can carry out unlock IDLE operation first.
  // - locked transfer data phase is running (reg_locked_data_phase_s=1)
  // - new transfer is unlock
  // - Current output stage is not output transfer from stored buffer
  // - Idle injection is enabled
  assign idle_injection_early = reg_locked_data_phase_s & (~HMASTLOCKS) & (~reg_buf_pend) & idle_inject_enable;

  // When this is set, downstream AHB will see IDLE transfer
  // - unlocking transfer is in holding buffer, or
  // - unlocking transfer is from up stream AHB and there is nothing in holding buffer
  assign idle_injection_now = reg_unlock_idle_req | idle_injection_early  | idle_injection_done;
  // When buffered write is on going, bus master can have active transfer going to downstream AHB
  // At this stage, HREADYM (to downstream AHB slaves) will reflect HREADYOUTM (input).
  // However, HREADYS can be low due to a previous transfer to another AHB slave (parallel to the write buffer)
  // and therefore should not be transferred to downstream AHB until the transfer has been committed.
  // Therefore we block HTRANSM to IDLE/BUSY suring buffered write (unless reg_buf_pend is high
  // showing that the transfer is committed.
  assign idle_injection_now_2 = (reg_bufwr_running & (~reg_buf_pend));

  // Registering unlock request to data phase
  always @(posedge HCLK or negedge HRESETn)
    begin : p_idle_injection_done
    if (~HRESETn)
      idle_injection_done <= 1'b0;
    else if (HCLKEN & (idle_injection_now | idle_injection_done))
      idle_injection_done <= idle_injection_now & HREADYOUTM & idle_inject_enable;
    end

  //--------------------------------------------------------------------
  // Output transfer in buffer when buffer is filled

  // Output address phase signals
  assign HADDRM      = (address_phase_output_sel) ? reg_haddr       : HADDRS;
  assign i_htrans    = (idle_injection_now) ? 2'b00 :
         ( ((address_phase_output_sel) ? reg_htrans : HTRANSS) &
           {(~idle_injection_now_2), 1'b1} );
  assign HWRITEM     = (address_phase_output_sel) ? reg_hwrite      : HWRITES;
  assign HSIZEM      = (address_phase_output_sel) ? reg_hsize_padded: HSIZES;
  assign HMASTERM    = (address_phase_output_sel) ? reg_hmasters    : HMASTERS;
  assign i_hmastlock = (reg_unlock_idle_req)   ? 1'b0 :
                       (address_phase_output_sel) ? reg_hmastlocks  : HMASTLOCKS;
  assign i_hburst    = (address_phase_output_sel) ? reg_hburst      : HBURSTS;
  assign HPROTM      = (address_phase_output_sel) ? reg_hprot       : HPROTS;
  assign i_hsel      = (address_phase_output_sel) ? reg_htrans[1]   : HSELS;

  // Mask transfers if not selected if AHB_COMPLIANT_LVL is non-zero (require compliant).
  // When buffered write is on going, any transfer can appear on the slave interface
  // (driven by up stream AHB) because transfers to other device can start without
  // waiting for current transfer to finish. This will result in protocol violation
  // unless we mask out the transfers which are not selecting the write buffer (HSEL=0).
  assign HSELM       = i_hsel;
  assign HTRANSM     = (AHB_COMPLIANT_LVL==0) ? i_htrans : (({2{i_hsel}}) & i_htrans);
  assign HBURSTM     = (AHB_COMPLIANT_LVL==0) ? i_hburst : (({3{i_hsel}}) & i_hburst);
  assign HMASTLOCKM  = (AHB_COMPLIANT_LVL==0) ? i_hmastlock : (i_hsel & i_hmastlock);
  //--------------------------------------------------------------------
  // Response to master

  // Generate HREADYOUT back to the upstream AHB
  always @(reg_buf_pend or reg_bufferable_m or HRESPM or reg_bufwr_running or HREADYOUTM)
   begin : p_hreadouts_mux
   if (reg_buf_pend)
     hreadouts_mux = 1'b0;  // Wait if a transfer is held in buffer (also cover idle insert)
   else if (reg_bufferable_m & HRESPM)
     hreadouts_mux = 1'b0;  // First cycle of bufferable transfer got error
   else if ((~reg_bufferable_m) & (~reg_bufwr_running))
     hreadouts_mux = HREADYOUTM;  // Non-bufferable transfers
   else // reg_bufferable_m (first cycle) or reg_bufwr_running (remaining cycles) of
        // bufferable transfer
     hreadouts_mux = 1'b1;
   end

  assign HREADYOUTS  = hreadouts_mux; // See above
  assign HRDATAS     = HRDATAM;  // No change for read data
  assign HRESPS      = (~reg_bufwr_running) & HRESPM;  // Suppress error response during buffered write

  //--------------------------------------------------------------------
  // HREADYM seen by downstream AHB slaves
  // Use HREADYOUTM if
  // - during 1st cycle of bufferable write
  // - during rest of bufferable write
  // - data phase of idle inject (unlocking)
  // Otherwise route HREADYS
  assign hreadym_mux = (reg_bufferable_m | reg_bufwr_running  | idle_injection_done) ?
                        HREADYOUTM : HREADYS;

  // Connect to top level
  assign HREADYM     = hreadym_mux;

  //--------------------------------------------------------------------
  // Write data buffer - capture write data in the first cycle of bufferable write
  always @(posedge HCLK or negedge HRESETn)
    begin : p_reg_hwdata
    if (~HRESETn)
      reg_hwdata <= {DW{1'b0}};
    else if (HCLKEN & reg_bufferable_m)
      reg_hwdata <= HWDATAS;
    end

  // Output data in write data buffer during buffered write
  assign HWDATAM = (reg_bufwr_running) ? reg_hwdata : HWDATAS;

  //--------------------------------------------------------------------
  // Generate error pulse in buffered write
  //   - the nxt_bwerr is asserted in the first cycle of the error
  //   - the reg_bwerr is the registered output, which assert at the 2nd cycle
  //     of the error response
  assign nxt_bwerr = reg_bufwr_running & HRESPM & ~HREADYOUTM;

  always @(posedge HCLK or negedge HRESETn)
    begin : p_reg_bwerr
    if (~HRESETn)
      reg_bwerr <= 1'b0;
    else if (HCLKEN)
      reg_bwerr <= nxt_bwerr;
    end

  // Connect to top level
  assign BWERR = reg_bwerr;

 // --------------------------------------------------------------------------------
 // Assertion property
 // --------------------------------------------------------------------------------
`ifdef ARM_AHB_ASSERT_ON
`include "std_ovl_defines.h"

  // when reg_buf_pend is one, HREADYOUTS should be low and
  // therefore trans_valid_rdy should be low
  assert_never
    #(`OVL_ERROR,`OVL_ASSERT,
      "trans_valid_rdy should not be asserted when reg_buf_pend is 1")
  u_ovl_trans_valid_rdy
    (.clk(HCLK), .reset_n(HRESETn),
     .test_expr(trans_valid_rdy & reg_buf_pend & HCLKEN)
     );

  // Signal to indicate data phase on AHB master side
  reg   ovl_reg_data_phase_m;
  wire  ovl_nxt_data_phase_m;

  // OVL Status signals for upstream AHB slave side
  reg   ovl_reg_data_phase_s;
  wire  ovl_nxt_data_phase_s;
  reg   ovl_reg_data_phase_read;
  wire  ovl_nxt_data_phase_read;
  reg   ovl_reg_data_phase_write_bufferable;
  wire  ovl_nxt_data_phase_write_bufferable;
  reg   ovl_reg_data_phase_write_nonbufferable;
  wire  ovl_nxt_data_phase_write_nonbufferable;

  assign  ovl_nxt_data_phase_m      = HSELM & HTRANSM[1]; // master interface side (down stream)
  assign  ovl_nxt_data_phase_s      = trans_valid;        // slave  interface side (up stream)
  assign  ovl_nxt_data_phase_read   = trans_valid & (~HWRITES);
  assign  ovl_nxt_data_phase_write_bufferable    = trans_valid & HWRITES &   BUFFERABLE;
  assign  ovl_nxt_data_phase_write_nonbufferable = trans_valid & HWRITES & (~BUFFERABLE);

  // Indicate data phase in Up stream AHB (S)
  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      begin
      ovl_reg_data_phase_s                    <= 1'b0;
      ovl_reg_data_phase_read                 <= 1'b0;
      ovl_reg_data_phase_write_bufferable     <= 1'b0;
      ovl_reg_data_phase_write_nonbufferable  <= 1'b0;
      end
    else if (HCLKEN & HREADYS)
      begin
      ovl_reg_data_phase_s                    <= ovl_nxt_data_phase_s;
      ovl_reg_data_phase_read                 <= ovl_nxt_data_phase_read;
      ovl_reg_data_phase_write_bufferable     <= ovl_nxt_data_phase_write_bufferable;
      ovl_reg_data_phase_write_nonbufferable  <= ovl_nxt_data_phase_write_nonbufferable;
      end
    end

  // Indicate data phase in down stream AHB (M)
  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      ovl_reg_data_phase_m   <= 1'b0;
    else if (HCLKEN & HREADYM)
      ovl_reg_data_phase_m   <= ovl_nxt_data_phase_m;
    end

  reg   [3:0]  ovl_reg_outstanding_counter;
  reg   [3:0]  ovl_nxt_outstanding_counter;
  wire         ovl_outstanding_counter_up   = ovl_reg_data_phase_s & HREADYOUTS;
  wire         ovl_outstanding_counter_down = ovl_reg_data_phase_m & HREADYOUTM;

  // Check outstanding transfer
  always @(ovl_reg_outstanding_counter or ovl_outstanding_counter_up or
          ovl_outstanding_counter_down)
  begin
  case ({ovl_outstanding_counter_up, ovl_outstanding_counter_down})
    2'b00 : ovl_nxt_outstanding_counter = ovl_reg_outstanding_counter;
    2'b01 : if (ovl_reg_outstanding_counter != 4'h0) ovl_nxt_outstanding_counter = ovl_reg_outstanding_counter - 1'b1; else ovl_nxt_outstanding_counter = ovl_reg_outstanding_counter;
    2'b10 : if (ovl_reg_outstanding_counter != 4'hf) ovl_nxt_outstanding_counter = ovl_reg_outstanding_counter + 1'b1; else ovl_nxt_outstanding_counter = ovl_reg_outstanding_counter;
    2'b11 : ovl_nxt_outstanding_counter = ovl_reg_outstanding_counter;
    default : ovl_nxt_outstanding_counter = 4'hx;
  endcase
  end

  // Register outstanding counter
  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      ovl_reg_outstanding_counter   <= {4{1'b0}};
    else if (HCLKEN)
      ovl_reg_outstanding_counter   <= ovl_nxt_outstanding_counter;
    end

  // The buffer depth can only be 0 or 1
  assert_always
    #(`OVL_ERROR,`OVL_ASSERT,
      "Buffer depth error")
  u_ovl_buffer_depth_error
    (.clk(HCLK), .reset_n(HRESETn),
     .test_expr(ovl_reg_outstanding_counter < 4'h2)
     );

  // OVL signals to record last AHB-S address phase
  reg  [AW-1:0]  ovl_reg_haddrs;
  reg     [1:0]  ovl_reg_htranss;
  reg            ovl_reg_hwrites;
  reg     [2:0]  ovl_reg_hsizes;
  reg  [MW-1:0]  ovl_reg_hmasters;
  reg            ovl_reg_hmastlocks;
  reg     [2:0]  ovl_reg_hbursts;
  reg     [3:0]  ovl_reg_hprots;
  reg            ovl_reg_hsels;

  // Capture last AHB transfer on AHB slave interface
  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      begin
      ovl_reg_haddrs    <= {AW{1'b0}};
      ovl_reg_htranss   <= {2{1'b0}};
      ovl_reg_hwrites   <= 1'b0;
      ovl_reg_hsizes    <= {3{1'b0}};
      ovl_reg_hmasters  <= {MW{1'b0}};
      ovl_reg_hmastlocks<= 1'b0;
      ovl_reg_hbursts   <= {3{1'b0}};
      ovl_reg_hprots    <= {4{1'b0}};
      ovl_reg_hsels     <= 1'b0;
      end
    else if (HCLKEN & HREADYS)
      begin
      ovl_reg_haddrs    <= HADDRS;
      ovl_reg_htranss   <= HTRANSS;
      ovl_reg_hwrites   <= HWRITES;
      ovl_reg_hsizes    <= HSIZES;
      ovl_reg_hmasters  <= HMASTERS;
      ovl_reg_hmastlocks<= HMASTLOCKS;
      ovl_reg_hbursts   <= HBURSTS;
      ovl_reg_hprots    <= HPROTS;
      ovl_reg_hsels     <= HSELS;
      end
    end


  // OVL signals to record last AHB-M address phase
  reg  [AW-1:0]  ovl_reg_haddrm;
  reg     [1:0]  ovl_reg_htransm;
  reg            ovl_reg_hwritem;
  reg     [2:0]  ovl_reg_hsizem;
  reg  [MW-1:0]  ovl_reg_hmasterm;
  reg            ovl_reg_hmastlockm;
  reg     [2:0]  ovl_reg_hburstm;
  reg     [3:0]  ovl_reg_hprotm;
  reg            ovl_reg_hselm;

  // Capture last AHB transfer on AHB master interface
  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      begin
      ovl_reg_haddrm    <= {AW{1'b0}};
      ovl_reg_htransm   <= {2{1'b0}};
      ovl_reg_hwritem   <= 1'b0;
      ovl_reg_hsizem    <= {3{1'b0}};
      ovl_reg_hmasterm  <= {MW{1'b0}};
      ovl_reg_hmastlockm<= 1'b0;
      ovl_reg_hburstm   <= {3{1'b0}};
      ovl_reg_hprotm    <= {4{1'b0}};
      ovl_reg_hselm     <= 1'b0;
      end
    else if (HCLKEN & HREADYM)
      begin
      ovl_reg_haddrm    <= HADDRM;
      ovl_reg_htransm   <= HTRANSM;
      ovl_reg_hwritem   <= HWRITEM;
      ovl_reg_hsizem    <= HSIZEM;
      ovl_reg_hmasterm  <= HMASTERM;
      ovl_reg_hmastlockm<= HMASTLOCKM;
      ovl_reg_hburstm   <= HBURSTM;
      ovl_reg_hprotm    <= HPROTM;
      ovl_reg_hselm     <= HSELM;
      end
    end

  // Signal to indicate first cycle of data phase transfer in master interface
  wire           ovl_nxt_1st_cycle_m;
  reg            ovl_reg_1st_cycle_m;
  assign         ovl_nxt_1st_cycle_m = HSELM & HTRANSM[1] & HREADYM;

  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      ovl_reg_1st_cycle_m <= 1'b0;
    else if (HCLKEN)
      ovl_reg_1st_cycle_m <= ovl_nxt_1st_cycle_m;
    end


   // Check during a read or non-buffered write, or start of any transfer at master side, HADDR should match
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HADDR mismatch")
   u_ovl_haddr_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(((ovl_reg_data_phase_read|ovl_reg_data_phase_write_nonbufferable) & (HREADYS & HCLKEN))|ovl_reg_1st_cycle_m),
      .consequent_expr(ovl_reg_haddrs==ovl_reg_haddrm)
      );

   // Check during a read or non-buffered write, or start of any transfer at master side, HTRANS should match
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HTRANS mismatch")
   u_ovl_htrans_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr((((ovl_reg_data_phase_read|ovl_reg_data_phase_write_nonbufferable) & (HREADYS & HCLKEN))|ovl_reg_1st_cycle_m) &
      (~(idle_injection_now|idle_injection_now_2))),
      .consequent_expr(ovl_reg_htranss==ovl_reg_htransm)
      );

   // Check during a read or non-buffered write, or start of any transfer at master side, HWRITE should match
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HWRITE mismatch")
   u_ovl_hwrite_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(((ovl_reg_data_phase_read|ovl_reg_data_phase_write_nonbufferable) & (HREADYS & HCLKEN))|ovl_reg_1st_cycle_m),
      .consequent_expr(ovl_reg_hwrites==ovl_reg_hwritem)
      );

   // Check during a read or non-buffered write, or start of any transfer at master side,
   // or start of any transfer at master side, HMASTER should match
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HMASTER mismatch")
   u_ovl_hmaster_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(((ovl_reg_data_phase_read|ovl_reg_data_phase_write_nonbufferable) & (HREADYS & HCLKEN))|ovl_reg_1st_cycle_m),
      .consequent_expr(ovl_reg_hmasters==ovl_reg_hmasterm)
      );

   // Check during a read or non-buffered write, or start of any transfer at master side, HSIZE should match
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HSIZE mismatch")
   u_ovl_hsize_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(((ovl_reg_data_phase_read|ovl_reg_data_phase_write_nonbufferable) & (HREADYS & HCLKEN))|ovl_reg_1st_cycle_m),
      .consequent_expr(ovl_reg_hsizes==ovl_reg_hsizem)
      );

   // Check during a read or non-buffered write, or start of any transfer at master side, HMASTLOCK should match
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HMASTLOCK mismatch")
   u_ovl_hmastlock_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(((ovl_reg_data_phase_read|ovl_reg_data_phase_write_nonbufferable) & (HREADYS & HCLKEN))|ovl_reg_1st_cycle_m),
      .consequent_expr(ovl_reg_hmastlocks==ovl_reg_hmastlockm)
      );

   // Check during a read or non-buffered write, or start of any transfer at master side, HBURST should match
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HBURST mismatch")
   u_ovl_hburst_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(((ovl_reg_data_phase_read|ovl_reg_data_phase_write_nonbufferable) & (HREADYS & HCLKEN))|ovl_reg_1st_cycle_m),
      .consequent_expr(ovl_reg_hbursts==ovl_reg_hburstm)
      );

   // Check during a read or non-buffered write, or start of any transfer at master side, HPROT should match
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HPROT mismatch")
   u_ovl_hprot_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(((ovl_reg_data_phase_read|ovl_reg_data_phase_write_nonbufferable) & (HREADYS & HCLKEN))|ovl_reg_1st_cycle_m),
      .consequent_expr(ovl_reg_hprots==ovl_reg_hprotm)
      );

   // Check during a read or non-buffered write, or start of any transfer at master side, HSEL should match
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HSEL mismatch")
   u_ovl_hsel_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(((ovl_reg_data_phase_read|ovl_reg_data_phase_write_nonbufferable) & (HREADYS & HCLKEN))|ovl_reg_1st_cycle_m),
      .consequent_expr(ovl_reg_hsels==ovl_reg_hselm)
      );

   // Check during a read or non-buffered write, HRESP should match
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HRESP mismatch in read or non-bufferable write")
   u_ovl_hresp_mismatch_read_non_buffered_write
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(((ovl_reg_data_phase_read|ovl_reg_data_phase_write_nonbufferable) & HREADYS) & HCLKEN),
      .consequent_expr(HRESPS==HRESPM)
      );


  //  if it is a bufferable transfer, it should get no wait state unless
  //  - error response is received
  //  - another on going transfer is taken place
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "bufferable write should have no wait state if possible")
   u_ovl_no_wait_state_for_bufferable_write
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_data_phase_write_bufferable & (~HRESPS) & (~reg_buf_pend) & HCLKEN),
      .consequent_expr(HREADYOUTS==1'b1)
      );

  // reg_bufferable_m and reg_bufwr_running should not be asserted in the same cycle
  assert_never
    #(`OVL_ERROR,`OVL_ASSERT,
      "reg_bufferable_m and reg_bufwr_running should not be asserted in the same cycle")
  u_ovl_reg_bufwr_running_chk_1
    (.clk(HCLK), .reset_n(HRESETn),
     .test_expr(reg_bufferable_m & reg_bufwr_running)
     );

  // At the end of a non-bufferable transfer, HWDATA should be from bus master
  // Note : do not check data because data from CPU can be X
  assert_implication
    #(`OVL_ERROR,`OVL_ASSERT,
      "reg_bufferable_m and reg_bufwr_running should not be asserted in the same cycle")
  u_ovl_non_bufferable_write_data
    (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_data_phase_write_nonbufferable & HREADYOUTS & HCLKEN),
      .consequent_expr(reg_bufwr_running==1'b0)
     );

  // BWERR must be asserted when an error response is received, but is not
  // propagated to upstream AHB due to buffered write operation
  assert_next
    #(`OVL_ERROR, 1,1,0, `OVL_ASSERT, "Error response missing")
  u_ovl_bwerr_generation
    (.clk         (HCLK),
     .reset_n     (HRESETn),
     .start_event ((HRESPM & (~HREADYOUTM) & (~HRESPS) & HCLKEN)|  // Set to high when error response occurred
                   (BWERR & (~HCLKEN))),                           // Remain high when HCLKEN is low
     .test_expr   (BWERR)
     );

  // Constraint on HMASTLOCKS
  reg         ovl_reg_last_hmastlocks_d1;
  reg         ovl_reg_last_hreadys_d1;
  reg  [1:0]  ovl_reg_last_htranss_d1;

  always @(posedge HCLK or negedge HRESETn)
    begin
    if (~HRESETn)
      begin
      ovl_reg_last_hmastlocks_d1 <= 1'b0;
      ovl_reg_last_hreadys_d1    <= 1'b1;
      ovl_reg_last_htranss_d1    <= {2{1'b0}};
      end
    else if (HCLKEN)
      begin
      ovl_reg_last_hmastlocks_d1 <= HMASTLOCKS;
      ovl_reg_last_hreadys_d1    <= HREADYS;
      ovl_reg_last_htranss_d1    <= HTRANSS;
      end
    end

  // HMASTLOCKS should not change after there is an announced transfer
  assert_implication
    #(`OVL_ERROR,`OVL_ASSERT,
      "HMASTLOCKS should not change after there is an announced transfer")
  u_ovl_hmastlock_constraint
    (.clk(HCLK), .reset_n(HRESETn),
     .antecedent_expr(ovl_reg_last_htranss_d1[1] & HTRANSS[1] & (~ovl_reg_last_hreadys_d1) & HCLKEN),
     .consequent_expr(HMASTLOCKS == ovl_reg_last_hmastlocks_d1)
     );

 `endif

endmodule
