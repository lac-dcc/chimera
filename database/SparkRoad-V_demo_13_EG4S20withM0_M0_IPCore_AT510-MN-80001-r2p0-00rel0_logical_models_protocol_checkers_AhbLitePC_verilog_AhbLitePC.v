//------------------------------------------------------------------------------
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
//   Checked In : $Date: 2013-04-15 00:01:13 +0100 (Mon, 15 Apr 2013) $
//   Revision   : $Revision: 148668 $
//   Release    : Cortex-M System Design Kit-r1p0-00rel0
//
//------------------------------------------------------------------------------
// Verilog-2001 (IEEE Std 1364-2001)
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// AMBA 3 AHB-Lite Protocol v1.0 - Protocol Checker using OVL properties.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// CONTENTS
// ========
//
//  116. Module
//  120.   - Parameters
//  165.   - Ports
//
//  193. Local parameters
//  194.   - OVL
//  205.   - AHB-Lite
//
//  229. Unused inputs assignment - Facilitates linting
//  232.   - HRDATA
//
//  238. Configuration-dependent input generation
//  241.   - HADDR
//  250.   - HSEL
//  255.   - HREADYOUT
//
//  262. Interface signal registering
//
//  303. Auxiliary logic
//  306.   - selected_slave_dphase
//  333.   - selected_slave_dphase_D1
//  347.   - locked_dphase
//  361.   - trans_dphase
//  375.   - write_trans_dphase
//  392.   - selected_slave_trans_dphase
//  399.   - seq_beats_count
//
//  441. Master Rules - Requirements
//  444.   - ahb_errm_htrans_reset
//  462.   - ahb_errm_htrans_waited_idle
//  477.   - ahb_errm_htrans_waited_nseq_seq
//  498.   - ahb_errm_htrans_waited_busy
//  521.   - ahb_errm_busy_not_first
//  536.   - ahb_errm_busy_not_last
//  556.   - ahb_errm_busy_seq_not_single
//  575.   - ahb_errm_seq_not_first
//  590.   - ahb_errm_burst_len
//  606.   - ahb_errm_burst_term
//  630.   - ahb_errm_burst_bound_incr_undef
//  646.   - ahb_errm_burst_bound_incr_fixed
//  683.   - ahb_errm_burst_bound_wrap
//  701.   - ahb_errm_ctl_const_burst
//  725.   - ahb_errm_ctl_const_busy
//  747.   - ahb_errm_ctl_const_wait
//  774.   - ahb_errm_haddr_aligned
//  795.   - ahb_errm_haddr_incr
//  826.   - ahb_errm_haddr_wrap
//  874.   - ahb_errm_hsize_too_wide
//  888.   - ahb_errm_hwdata_wait
//
//  959. Master Rules - Recommendations
//  962.   - ahb_recm_unlock_idle
//
//  979. Slave Rules - Requirements
//  982.   - ahb_errs_hreadyout_reset
//  996.   - ahb_errs_hreadyout_hresp_idle
// 1011.   - ahb_errs_hreadyout_hresp_busy
// 1026.   - ahb_errs_hresp_cycle1
// 1045.   - ahb_errs_hresp_cycle2
//
// 1066. Slave Rules - Recommendations
// 1069.   - ahb_recs_hresp_reset
// 1082.   - ahb_recs_hreadyout_nonsel
// 1096.   - ahb_recs_hresp_nonsel
//
// 1112. Interconnect Rules - Requirements
// 1115.   - ahb_erri_hready_reset
// 1131.   - ahb_erri_hready_idle
// 1148.   - ahb_erri_hready_busy
// 1165.   - ahb_erri_hready_hreadyout_sel
// 1180.   - ahb_erri_hsel_haddr
// 1201.   - ahb_erri_hsel_burst
//
// 1220. Parameter Rules
// 1223.   - ahb_param_addr_width
// 1234.   - ahb_param_data_width
//
// 1256. X checks
//
// 1331. End of module
//
// 1337. End of File
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// INDEX:
// INDEX: Module
//------------------------------------------------------------------------------
module AhbLitePC #(
//------------------------------------------------------------------------------
// INDEX:   - Parameters
//------------------------------------------------------------------------------
      // Address bus width in bits.
      //  . 1-32
      parameter ADDR_WIDTH = 32,

      // Data bus width in bits.
      //  . 8, 16, 32, 64, 128, 256, 512, 1024
      parameter DATA_WIDTH = 32,

      // Data endianness.
      //  . 0: little endian
      //  . 1: big endian
      parameter BIG_ENDIAN = 0,

      // Where in the system the PC is instantiated.
      // Mostly specifies existence of functional HSEL and HREADYOUT.
      //  . 0: between interconnect master interface and AHB-Lite slave;
      //       HSEL and HREADYOUT functional
      //  . 1: between AHB-Lite master and interconnect slave interface;
      //       HSEL and HREADYOUT non-functional
      parameter MASTER_TO_INTERCONNECT = 0,

      // Interconnect master interface capable of early burst termination.
      //  . 0: no
      //  . 1: yes
      parameter EARLY_BURST_TERMINATION = 0,

      // Property types.
      //  . 0: assert
      //  . 1: assume
      //  . 2: ignore
      parameter MASTER_REQUIREMENT_PROPTYPE          = 0,
      parameter MASTER_RECOMMENDATION_PROPTYPE       = 0,
      parameter MASTER_XCHECK_PROPTYPE               = 0,

      parameter SLAVE_REQUIREMENT_PROPTYPE           = 0,
      parameter SLAVE_RECOMMENDATION_PROPTYPE        = 0,
      parameter SLAVE_XCHECK_PROPTYPE                = 0,

      parameter INTERCONNECT_REQUIREMENT_PROPTYPE    = 0,
      parameter INTERCONNECT_RECOMMENDATION_PROPTYPE = 0,
      parameter INTERCONNECT_XCHECK_PROPTYPE         = 0
   ) (
//------------------------------------------------------------------------------
// INDEX:   - Ports
//------------------------------------------------------------------------------
      // Clock and reset
      input  wire        HCLK,
      input  wire        HRESETn,

      // Master signals
      input  wire [ADDR_WIDTH-1:0] HADDR,
      input  wire [ 2:0] HBURST,
      input  wire        HMASTLOCK,
      input  wire [ 3:0] HPROT,
      input  wire [ 2:0] HSIZE,
      input  wire [ 1:0] HTRANS,
      input  wire [DATA_WIDTH-1:0] HWDATA,
      input  wire        HWRITE,

      // Slave signals
      input  wire [DATA_WIDTH-1:0] HRDATA,
      input  wire        HREADYOUT,
      input  wire        HRESP,

      // Interconnect (decoder/multiplexor) signals
      input  wire        HREADY,
      input  wire        HSELx
   );

//------------------------------------------------------------------------------
// INDEX:
// INDEX: Local parameters
// INDEX:   - OVL
//------------------------------------------------------------------------------

   // OVL Severity levels
   localparam OVL_SimFatal   = 0; // Simulation error + stop
   localparam OVL_SimError   = 1; // Simulation error (non-fatal)
   localparam OVL_SimWarning = 2; // Simulation warning
   localparam OVL_SimCover   = 3; // Simulation coverage-point
   localparam OVL_SimInfo    = 4; // Simulation info

//------------------------------------------------------------------------------
// INDEX:   - AHB-Lite
//------------------------------------------------------------------------------

   localparam [1:0] AHB_TRANS_IDLE   = 2'b00;
   localparam [1:0] AHB_TRANS_BUSY   = 2'b01;
   localparam [1:0] AHB_TRANS_NSEQ   = 2'b10;
   localparam [1:0] AHB_TRANS_SEQ    = 2'b11;

   localparam [2:0] AHB_BURST_SINGLE = 3'b000;
   localparam [2:0] AHB_BURST_INCR   = 3'b001;
   localparam [2:0] AHB_BURST_WRAP4  = 3'b010;
   localparam [2:0] AHB_BURST_INCR4  = 3'b011;
   localparam [2:0] AHB_BURST_WRAP8  = 3'b100;
   localparam [2:0] AHB_BURST_INCR8  = 3'b101;
   localparam [2:0] AHB_BURST_WRAP16 = 3'b110;
   localparam [2:0] AHB_BURST_INCR16 = 3'b111;

   localparam [0:0] AHB_RESP_OKAY    = 1'b0;
   localparam [0:0] AHB_RESP_ERROR   = 1'b1;

   localparam [2:0] AHB_SIZE_1024    = 3'b111;

//------------------------------------------------------------------------------
// INDEX:
// INDEX: Unused inputs assignment - Facilitates linting
//------------------------------------------------------------------------------

   // INDEX:   - HRDATA
   // =====
   wire [DATA_WIDTH-1:0] unused = HRDATA;

//------------------------------------------------------------------------------
// INDEX:
// INDEX: Configuration-dependent input generation
//------------------------------------------------------------------------------

   // INDEX:   - HADDR
   // =====
   // 32-bit internal version of HADDR for use in width-independent properties
   wire [32:0] haddr_ext  = { {32-ADDR_WIDTH+1{1'b0}}, HADDR };
   wire [31:0] HADDRi     = haddr_ext[31:0];

   // Masters don't have HSEL or HREADYOUT, so ignore them by setting their
   // internal version such that all properties work as intended.

   // INDEX:   - HSEL
   // =====
   // Tied off to 1'b1
   wire        HSELi      = (MASTER_TO_INTERCONNECT != 0) ?   1'b1 : HSELx;

   // INDEX:   - HREADYOUT
   // =====
   // Tied to HREADY
   wire        HREADYOUTi = (MASTER_TO_INTERCONNECT != 0) ? HREADY : HREADYOUT;

//------------------------------------------------------------------------------
// INDEX:
// INDEX: Interface signal registering
//------------------------------------------------------------------------------

   reg         HRESETn_D1;

   reg  [31:0] HADDR_D1;
   reg  [ 2:0] HBURST_D1;
   reg         HMASTLOCK_D1;
   reg  [ 3:0] HPROT_D1;
   reg  [ 2:0] HSIZE_D1;
   reg  [ 1:0] HTRANS_D1;
   reg  [DATA_WIDTH-1:0] HWDATA_D1;
   reg         HWRITE_D1;

   reg         HREADYOUT_D1;
   reg         HRESP_D1;

   reg         HREADY_D1;
   reg         HSEL_D1;

   always @(posedge HCLK) begin
      HRESETn_D1   <= HRESETn;

      HADDR_D1     <= HADDRi;
      HBURST_D1    <= HBURST;
      HMASTLOCK_D1 <= HMASTLOCK;
      HPROT_D1     <= HPROT;
      HSIZE_D1     <= HSIZE;
      HTRANS_D1    <= HTRANS;
      HWDATA_D1    <= HWDATA;
      HWRITE_D1    <= HWRITE;

      HREADYOUT_D1 <= HREADYOUTi;
      HRESP_D1     <= HRESP;

      HREADY_D1    <= HREADY;
      HSEL_D1      <= HSELi;
   end

//------------------------------------------------------------------------------
// INDEX:
// INDEX: Auxiliary logic
//------------------------------------------------------------------------------

   // INDEX:   - selected_slave_dphase
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.5, Page 3-10:
   // Usually the decoder also provides the multiplexor with the HSELx signals,
   // or a signal/bus derived from the HSELx signals, to enable the multiplexor
   // to route the appropriate signals, from the selected slave to the master.
   // It is important that these additional multiplexor control signals are
   // retimed to the data phase.
   //
   // When the AhbLitePC is attached on the MASTER_TO_INTERCONNECT side, there
   // is no selection signal, so behave as if the interface was always selected.
   //
   // When the AhbLitePC is attached on the InterconnectToSlave side, indicates
   // that the interface the AhbLitePC is attached to is the one selected by the
   // interconnect multiplexor.
   // Used to qualify HREADYOUT and HRESP.

   reg         selected_slave_dphase_q;

   always @(posedge HCLK or negedge HRESETn)
      if (~HRESETn)
         selected_slave_dphase_q <= 1'b0;
      else if (HREADY)
         selected_slave_dphase_q <= HSELi;

   wire        selected_slave_dphase = (MASTER_TO_INTERCONNECT != 0) ? 1'b1 : selected_slave_dphase_q;

   // INDEX:   - selected_slave_dphase_D1
   // =====
   // Used to qualify HREADYOUT_D1 and HRESP_D1.

   reg         selected_slave_dphase_D1_q;

   always @(posedge HCLK or negedge HRESETn)
      if (~HRESETn)
         selected_slave_dphase_D1_q <= 1'b0;
      else
         selected_slave_dphase_D1_q <= selected_slave_dphase;

   wire        selected_slave_dphase_D1 = (MASTER_TO_INTERCONNECT != 0) ? 1'b1 : selected_slave_dphase_D1_q;

   // INDEX:   - locked_dphase
   // =====
   // Indicates a data phase in a locked sequence

   reg         locked_dphase_q;

   always @(posedge HCLK or negedge HRESETn)
      if (~HRESETn)
         locked_dphase_q <= 1'b0;
      else if (HREADY)
         locked_dphase_q <= HMASTLOCK;

   wire        locked_dphase = locked_dphase_q;

   // INDEX:   - trans_dphase
   // =====
   // Indicates a non-IDLE transfer data phase

   reg         trans_dphase_q;

   always @(posedge HCLK or negedge HRESETn)
      if (~HRESETn)
         trans_dphase_q <= 1'b0;
      else if (HREADY)
         trans_dphase_q <= (HTRANS != AHB_TRANS_IDLE);

   wire        trans_dphase = trans_dphase_q;

   // INDEX:   - write_trans_dphase
   // =====
   // Indicates a non-IDLE write transfer data phase

   reg         write_dphase_q;
   reg  [ 2:0] hsize_dphase_q;
   reg  [ 6:0] haddr_6to0_dphase_q;

   always @(posedge HCLK)
      if (HREADY) begin
         write_dphase_q      <= HWRITE;
         hsize_dphase_q      <= HSIZE;
         haddr_6to0_dphase_q <= HADDRi[6:0];
      end

   wire        write_trans_dphase = trans_dphase & write_dphase_q;

   // INDEX:   - selected_slave_trans_dphase
   // =====
   // Indicates a non-IDLE transfer data phase targeting this slave
   // Not used in properties but useful for debugging

   wire        selected_slave_trans_dphase = selected_slave_dphase & trans_dphase;

   // INDEX:   - seq_beats_count
   // =====
   // Keeps track of the number of SEQ beats remaining in a fixed-length burst

   reg  [ 3:0] seq_beats_count_q;

   // Number of remaining SEQ beats in fixed-length burst when burst starts
   // All bursts are of fixed length except INCR
   reg  [ 3:0] seq_beats_init;
   always @(HBURST)
      case (HBURST)
         AHB_BURST_SINGLE: seq_beats_init = 4'b0000; // SINGLE
         AHB_BURST_INCR  : seq_beats_init = 4'bxxxx; // INCR (not fixed-length)
         AHB_BURST_WRAP4 : seq_beats_init = 4'b0011; // WRAP4
         AHB_BURST_INCR4 : seq_beats_init = 4'b0011; // INCR4
         AHB_BURST_WRAP8 : seq_beats_init = 4'b0111; // WRAP8
         AHB_BURST_INCR8 : seq_beats_init = 4'b0111; // INCR8
         AHB_BURST_WRAP16: seq_beats_init = 4'b1111; // WRAP16
         AHB_BURST_INCR16: seq_beats_init = 4'b1111; // INCR16
         default         : seq_beats_init = 4'bxxxx; // really a don't-care
      endcase // case (HBURST)

   wire        seq_beats_count_clear     = (HTRANS == AHB_TRANS_IDLE) |
                                           ((HTRANS == AHB_TRANS_NSEQ) & (HBURST == AHB_BURST_INCR));
   wire        seq_beats_count_load      = (HTRANS == AHB_TRANS_NSEQ) & (HBURST != AHB_BURST_INCR);
   wire        seq_beats_count_decrement = (HTRANS == AHB_TRANS_SEQ) & (HBURST != AHB_BURST_INCR);

   always @(posedge HCLK or negedge HRESETn)
      if (~HRESETn)
         seq_beats_count_q <= 4'b0000;
      else if (HREADY)
         if (seq_beats_count_clear)
            seq_beats_count_q <= 4'b0000;
         else if (seq_beats_count_load)
            seq_beats_count_q <= seq_beats_init;
         else if (seq_beats_count_decrement)
            seq_beats_count_q <= (seq_beats_count_q - 4'b0001);

   wire [ 3:0] seq_beats_count = seq_beats_count_q;

//------------------------------------------------------------------------------
// INDEX:
// INDEX: Master Rules - Requirements
//------------------------------------------------------------------------------

   // INDEX:   - ahb_errm_htrans_reset
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 7.1.2, Page 7-2:
   // During reset all masters must ensure the address and control signals are
   // at valid levels and that HTRANS[1:0] indicates IDLE.
   //
   // Note:
   // Valid level part covered later in X checking properties.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_htrans_reset: During reset a master must only attempt IDLE transfers."
   ) ahb_errm_htrans_reset (
      .clk             ( HCLK                     ),
      .reset_n         ( 1'b1                     ),
      .antecedent_expr ( ~HRESETn_D1              ),
      .consequent_expr ( HTRANS == AHB_TRANS_IDLE )
   );

   // INDEX:   - ahb_errm_htrans_waited_idle
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.6.1, Page 3-16:
   // During a waited transfer, the master is permitted to change the transfer
   // type from IDLE to NONSEQ.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_htrans_waited_idle: During a waited IDLE transfer, HTRANS must: remain IDLE OR become NONSEQ."
   ) ahb_errm_htrans_waited_idle (
      .clk             ( HCLK                                                    ),
      .reset_n         ( HRESETn                                                 ),
      .antecedent_expr ( (~HREADY_D1) & (HTRANS_D1 == AHB_TRANS_IDLE)            ),
      .consequent_expr ( (HTRANS == AHB_TRANS_IDLE) | (HTRANS == AHB_TRANS_NSEQ) )
   );

   // INDEX:   - ahb_errm_htrans_waited_nseq_seq
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.6.2, Page 3-20:
   // During a waited transfer, if the slave responds with an ERROR response
   // then the master is permitted to change the address when HREADY is LOW.
   //
   // Note:
   // The master must then drive HTRANS to IDLE.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      {"ahb_errm_htrans_waited_nseq_seq: During a waited NSEQ or SEQ transfer, HTRANS must: remain constant OR ",
       "become IDLE (only permitted if a fault occurs)."}
   ) ahb_errm_htrans_waited_nseq_seq (
      .clk             ( HCLK                                                                          ),
      .reset_n         ( HRESETn                                                                       ),
      .antecedent_expr ( (~HREADY_D1) & ((HTRANS_D1 == AHB_TRANS_NSEQ) | (HTRANS_D1 == AHB_TRANS_SEQ)) ),
      .consequent_expr ( (HTRANS == HTRANS_D1) |
                         ((HTRANS == AHB_TRANS_IDLE) & (~HREADY_D1) &
                          ((HRESP_D1 == AHB_RESP_ERROR) | (~selected_slave_dphase_D1 & HREADY)))       )
   );

   // INDEX:   - ahb_errm_htrans_waited_busy
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.6.1, Page 3-17:
   // During a waited transfer for a fixed length burst, the master is permitted
   // to change the transfer type from BUSY to SEQ.
   //
   // AHB-Lite Protocol Specification, v1.0, Section 5.1.3, Page 5-4:
   // If a slave provides an ERROR response then the master can cancel the
   // remaining transfers in the burst.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      {"ahb_errm_htrans_waited_busy: During a waited BUSY transfer, HTRANS must: remain BUSY OR become SEQ OR ",
       "become IDLE (only permitted if a fault occurs)."}
   ) ahb_errm_htrans_waited_busy (
      .clk             ( HCLK                                                                          ),
      .reset_n         ( HRESETn                                                                       ),
      .antecedent_expr ( (~HREADY_D1) & (HTRANS_D1 == AHB_TRANS_BUSY) & (HBURST_D1 != AHB_BURST_INCR)  ),
      .consequent_expr ( (HTRANS == AHB_TRANS_BUSY) |
                         (HTRANS == AHB_TRANS_SEQ ) |
                         ((HTRANS == AHB_TRANS_IDLE) & (~HREADY_D1) &
                          ((HRESP_D1 == AHB_RESP_ERROR) | (~selected_slave_dphase_D1 & HREADY)))       )
   );

   // INDEX:   - ahb_errm_busy_not_first
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.2, Page 3-5:
   // The BUSY transfer type enables masters to insert idle cycles in the
   // middle of a burst.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_busy_not_first: A BUSY transfer cannot be the first transfer in a burst."
   ) ahb_errm_busy_not_first (
      .clk             ( HCLK                        ),
      .reset_n         ( HRESETn                     ),
      .antecedent_expr ( HTRANS == AHB_TRANS_BUSY    ),
      .consequent_expr ( HTRANS_D1 != AHB_TRANS_IDLE )
   );

   // INDEX:   - ahb_errm_busy_not_last
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.5.1, Page 3-10:
   // The protocol does not permit a master to end a burst with a BUSY transfer
   // for fixed length bursts of type:
   //  . incrementing INCR4, INCR8, and INCR16
   //  . or wrapping WRAP4, WRAP8, and WRAP16.
   // [...]
   // The master is not permitted to perform a BUSY transfer immediately after
   // a SINGLE burst.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_busy_not_last: A fixed length burst must not end with a BUSY transfer."
   ) ahb_errm_busy_not_last (
      .clk             ( HCLK                                                      ),
      .reset_n         ( HRESETn                                                   ),
      .antecedent_expr ( (seq_beats_count == 4'b0000) & (HBURST != AHB_BURST_INCR) ),
      .consequent_expr ( HTRANS != AHB_TRANS_BUSY                                  )
   );

   // INDEX:   - ahb_errm_busy_seq_not_single
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.2, Page 3-5:
   // The BUSY transfer type enables masters to insert idle cycles in the
   // middle of a burst.
   //
   // AHB-Lite Protocol Specification, v1.0, Section 3.2, Page 3-5:
   // The remaining transfers in a burst are SEQUENTIAL and the address is
   // related to the previous transfer.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_busy_seq_not_single: A BUSY or SEQ transfer cannot have a burst type of SINGLE."
   ) ahb_errm_busy_seq_not_single (
      .clk             ( HCLK                                                   ),
      .reset_n         ( HRESETn                                                ),
      .antecedent_expr ( (HTRANS == AHB_TRANS_BUSY) | (HTRANS == AHB_TRANS_SEQ) ),
      .consequent_expr ( HBURST != AHB_BURST_SINGLE                             )
   );

   // INDEX:   - ahb_errm_seq_not_first
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.2, Page 3-5:
   // The remaining transfers in a burst are SEQUENTIAL and the address is
   // related to the previous transfer.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_seq_not_first: A SEQ transfer cannot be the first transfer in a burst."
   ) ahb_errm_seq_not_first (
      .clk             ( HCLK                        ),
      .reset_n         ( HRESETn                     ),
      .antecedent_expr ( HTRANS == AHB_TRANS_SEQ     ),
      .consequent_expr ( HTRANS_D1 != AHB_TRANS_IDLE )
   );

   // INDEX:   - ahb_errm_burst_len
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 2.2, Page 2-3:
   // The burst type indicates if the transfer is a single transfer or forms
   // part of a burst. Fixed length bursts of 4, 8, and 16 beats are supported.
   // [...] Incrementing bursts of undefined length are also supported.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_burst_len: A master must not perform more transfers than defined in a fixed-length burst."
   ) ahb_errm_burst_len (
      .clk             ( HCLK                                                      ),
      .reset_n         ( HRESETn                                                   ),
      .antecedent_expr ( (seq_beats_count == 4'b0000) & (HBURST != AHB_BURST_INCR) ),
      .consequent_expr ( HTRANS != AHB_TRANS_SEQ                                   )
   );

   // INDEX:   - ahb_errm_burst_term
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.5.2, Page 3-10:
   // If a slave provides an ERROR response then the master can cancel the
   // remaining transfers in the burst.
   // AHB-Lite Protocol Specification, v1.0, Section 3.5.2, Page 3-11:
   // Although masters are not permitted to terminate a burst request early...
   //
   // Note:
   // This properties must be ignored for interconnect master interfaces that
   // can terminate bursts early, as indicated by EARLY_BURST_TERMINATION.

   assert_implication #( OVL_SimError, (EARLY_BURST_TERMINATION != 0) ? 2 : MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_burst_term: All transfers in a fixed-length burst must finish."
   ) ahb_errm_burst_term (
      .clk             ( HCLK                                                                    ),
      .reset_n         ( HRESETn                                                                 ),
      .antecedent_expr ( seq_beats_count != 4'b0000                                              ),
      .consequent_expr ( (HTRANS == AHB_TRANS_BUSY) |
                         (HTRANS == AHB_TRANS_SEQ ) |
                         ((HTRANS == AHB_TRANS_IDLE) & (~HREADY_D1) &
                          ((HRESP_D1 == AHB_RESP_ERROR) | (~selected_slave_dphase_D1 & HREADY))) )
   );

   // INDEX:   - ahb_errm_burst_bound_incr_undef
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.5, Page 3-9:
   // Masters must not attempt to start an incrementing burst that crosses a 1KB
   // address boundary.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_burst_bound_incr_undef: Bursts must not cross a 1KB address boundary."
   ) ahb_errm_burst_bound_incr_undef (
      .clk             ( HCLK                                                     ),
      .reset_n         ( HRESETn                                                  ),
      .antecedent_expr ( (HBURST == AHB_BURST_INCR) &
                         ((HTRANS == AHB_TRANS_BUSY) | (HTRANS == AHB_TRANS_SEQ)) ),
      .consequent_expr ( HADDRi[9:0] != 10'h000                                   )
   );

   // INDEX:   - ahb_errm_burst_bound_incr_fixed
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.5, Page 3-9:
   // Masters must not attempt to start an incrementing burst that crosses a 1KB
   // address boundary.

   // The smallest amount of data transfered in a fixed-length incrementing
   // burst is 4 x 1 byte = 4 bytes. For that burst not to cross a 1KB address
   // boundary, the address of the first beat must be such that:
   // addr_first_beat + (4-1) < 1K, i.e.
   // addr_first_beat <= 1K - 4 = 1020
   //
   // This can be generalized for any fixed-length incrementing burst to:
   // addr_first_beat <= 1K - num_bytes_in_burst, i.e.
   // addr_first_beat <= (1K - 1) - (num_bytes_in_burst - 1), i.e.
   // addr_first_beat <= {10{1'b1}} - { {10-log2(num_bytes_in_burst){1'b0}},
   //                                   {   log2(num_bytes_in_burst){1'b1}} },
   // i.e.
   // addr_first_beat <= { {10-log2(num_bytes_in_burst){1'b1}},
   //                      {   log2(num_bytes_in_burst){1'b0}} }
   //
   // Starting at 4 bytes for a 4-beat burst of 8-bit transfers, the number of
   // bytes in a burst is multiplied by two for each subsequent burst length or
   // transfer size, therefore for any fixed-sized incrementing burst:
   // addr_first_beat <= 1020 << (1 for INCR8; 2 for INCR16; else 0) << HSIZE
   wire [ 1:0] hburst_shift = { HBURST == AHB_BURST_INCR16, HBURST == AHB_BURST_INCR8 };

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_burst_bound_incr_fixed: Bursts must not cross a 1KB address boundary."
   ) ahb_errm_burst_bound_incr_fixed (
      .clk             ( HCLK                                                                                       ),
      .reset_n         ( HRESETn                                                                                    ),
      .antecedent_expr ( (HTRANS == AHB_TRANS_NSEQ) &
                         ((HBURST == AHB_BURST_INCR4) | (HBURST == AHB_BURST_INCR8) | (HBURST == AHB_BURST_INCR16)) ),
      .consequent_expr ( HADDRi[9:0] <= ( (10'd1020 << hburst_shift) << HSIZE )                                     )
   );

   // INDEX:   - ahb_errm_burst_bound_wrap
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.5, Page 3-9:
   // Masters must not attempt to start an incrementing burst that crosses a 1KB
   // address boundary.
   //
   // Note:
   // Also applies to wrapping bursts.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_burst_bound_wrap: Bursts must not cross a 1KB address boundary."
   ) ahb_errm_burst_bound_wrap (
      .clk             ( HCLK                                                      ),
      .reset_n         ( HRESETn                                                   ),
      .antecedent_expr ( (HTRANS == AHB_TRANS_NSEQ) & (HBURST == AHB_BURST_WRAP16) ),
      .consequent_expr ( HSIZE != AHB_SIZE_1024                                    )
   );

   // INDEX:   - ahb_errm_ctl_const_burst
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.2, Page 3-5:
   // When a master uses the BUSY transfer type the address and control signals
   // must reflect the next transfer in the burst.
   // [...]
   // The remaining transfers in a burst are SEQUENTIAL and the address is
   // related to the previous transfer.
   // The control information is identical to the previous transfer.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_ctl_const_burst: During a burst, all control information must remain constant."
   ) ahb_errm_ctl_const_burst (
      .clk             ( HCLK                                                   ),
      .reset_n         ( HRESETn                                                ),
      .antecedent_expr ( (HTRANS == AHB_TRANS_BUSY) | (HTRANS == AHB_TRANS_SEQ) ),
      .consequent_expr ( (HADDRi[31:10] == HADDR_D1[31:10]) &
                         (HBURST        == HBURST_D1      ) &
                         (HMASTLOCK     == HMASTLOCK_D1   ) &
                         (HPROT         == HPROT_D1       ) &
                         (HSIZE         == HSIZE_D1       ) &
                         (HWRITE        == HWRITE_D1      )                     )
   );

   // INDEX:   - ahb_errm_ctl_const_busy
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.2, Page 3-5:
   // When a master uses the BUSY transfer type the address and control signals
   // must reflect the next transfer in the burst.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      {"ahb_errm_ctl_const_busy: During a BUSY transfer, all control information must reflect the next transfer in ",
       "the burst."}
   ) ahb_errm_ctl_const_busy (
      .clk             ( HCLK                                                     ),
      .reset_n         ( HRESETn                                                  ),
      .antecedent_expr ( (HTRANS_D1 == AHB_TRANS_BUSY) &
                         ((HTRANS == AHB_TRANS_BUSY) | (HTRANS == AHB_TRANS_SEQ)) ),
      .consequent_expr ( (HADDRi    == HADDR_D1    ) &
                         (HBURST    == HBURST_D1   ) &
                         (HMASTLOCK == HMASTLOCK_D1) &
                         (HPROT     == HPROT_D1    ) &
                         (HSIZE     == HSIZE_D1    ) &
                         (HWRITE    == HWRITE_D1   )                              )
   );

   // INDEX:   - ahb_errm_ctl_const_wait
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.6, Page 3-16:
   // During a waited transfer, the master is restricted to what changes it can
   // make to the transfer type and address.
   //
   // Note:
   // The specification documents exception cases.
   // This property covers the typical case.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      {"ahb_errm_ctl_const_wait: During a waited non-IDLE transfer where HTRANS remains constant, all control ",
       "information must remain constant."}
   ) ahb_errm_ctl_const_wait (
      .clk             ( HCLK                          ),
      .reset_n         ( HRESETn                       ),
      .antecedent_expr ( (~HREADY_D1) &
                         (HTRANS_D1 == HTRANS) &
                         (HTRANS_D1 != AHB_TRANS_IDLE) ), // ignore IDLE to IDLE
      .consequent_expr ( (HADDRi    == HADDR_D1    ) &
                         (HBURST    == HBURST_D1   ) &
                         (HMASTLOCK == HMASTLOCK_D1) &
                         (HPROT     == HPROT_D1    ) &
                         (HSIZE     == HSIZE_D1    ) &
                         (HWRITE    == HWRITE_D1   )   )
   );

   // INDEX:   - ahb_errm_haddr_aligned
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.5, Page 3-10:
   // All transfers in a burst must be aligned to the address boundary equal to
   // the size of the transfer. For example, you must align word transfers to
   // word address boundaries (HADDR[1:0] = b00), and halfword transfers to
   // halfword address boundaries (HADDR[0] = 0). The address for IDLE
   // transfers must also be aligned, otherwise during simulation it is likely
   // that bus monitors could report spurious warnings.

   wire [ 7:0] hsize_mask = 8'b1 << HSIZE;
   wire [ 7:0] haddr_mask = hsize_mask - 1'b1;

   assert_always #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_haddr_aligned: HADDR must be aligned according to HSIZE."
   ) ahb_errm_haddr_aligned (
      .clk       ( HCLK                                    ),
      .reset_n   ( HRESETn                                 ),
      .test_expr ( (HADDRi[6:0] & haddr_mask[6:0]) == 7'b0 )
   );

   // INDEX:   - ahb_errm_haddr_incr
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.2, Page 3-5:
   // When a master uses the BUSY transfer type the address and control signals
   // must reflect the next transfer in the burst.
   //
   // AHB-Lite Protocol Specification, v1.0, Section 3.2, Page 3-5:
   // (On SEQ transfers)
   // The address is equal to the address of the previous transfer plus the
   // transfer size, in bytes, with the transfer size being signaled by the
   // HSIZE[2:0] signals. In the case of a wrapping burst the address of the
   // transfer wraps at the address boundary.
   //
   // AHB-Lite Protocol Specification, v1.0, Section 3.5, Page 3-9:
   // Masters must not attempt to start an incrementing burst that crosses a
   // 1KB address boundary.

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      {"ahb_errm_haddr_incr: The address for a SEQ transfer in an incrementing burst is equal to the address of the ",
       "previous transfer plus the size, in bytes, of the transfer."}
   ) ahb_errm_haddr_incr (
      .clk             ( HCLK                                                                   ),
      .reset_n         ( HRESETn                                                                ),
      .antecedent_expr ( HREADY_D1 &
                         ( (HTRANS    == AHB_TRANS_BUSY ) | (HTRANS    == AHB_TRANS_SEQ   )  ) &
                         ( (HTRANS_D1 == AHB_TRANS_NSEQ ) | (HTRANS_D1 == AHB_TRANS_SEQ   )  ) &
                         ( (HBURST_D1 == AHB_BURST_INCR ) | (HBURST_D1 == AHB_BURST_INCR4 ) |
                           (HBURST_D1 == AHB_BURST_INCR8) | (HBURST_D1 == AHB_BURST_INCR16)  )  ),
      .consequent_expr ( HADDRi[9:0] == (HADDR_D1[9:0] + (10'b1 << HSIZE_D1))                   )
   );

   // INDEX:   - ahb_errm_haddr_wrap
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.2, Page 3-5:
   // When a master uses the BUSY transfer type the address and control signals
   // must reflect the next transfer in the burst.
   //
   // AHB-Lite Protocol Specification, v1.0, Section 3.2, Page 3-5:
   // (On SEQ transfers)
   // The address is equal to the address of the previous transfer plus the
   // transfer size, in bytes, with the transfer size being signaled by the
   // HSIZE[2:0] signals. In the case of a wrapping burst the address of the
   // transfer wraps at the address boundary.
   //
   // AHB-Lite Protocol Specification, v1.0, Section 3.5, Page 3-9:
   // Masters must not attempt to start an incrementing burst that crosses a
   // 1KB address boundary.

   // The smallest amount of data transfered in a wrapping burst is
   // 4 x 1 byte = 4 bytes, i.e. only the bottom 2 bits of address change.
   wire [ 9:0] haddr_d1_mask_min = { {8{1'b1}}, {2{1'b0}} };

   // For each subsequent number of beats or transfer size, that amount is
   // multiplied by 2.
   wire [ 1:0] hburst_d1_wrap_shift = { HBURST_D1 == AHB_BURST_WRAP16, HBURST_D1 == AHB_BURST_WRAP8 };
   wire [ 9:0] haddr_d1_mask = (haddr_d1_mask_min << hburst_d1_wrap_shift) << HSIZE_D1;

   wire [31:0] haddr_d1_incr = HADDR_D1 + (10'b1 << HSIZE_D1);

   wire [ 9:0] haddr_wrap_nxt_9to0 = (HADDR_D1     [9:0] &  haddr_d1_mask) |
                                     (haddr_d1_incr[9:0] & ~haddr_d1_mask);

   wire [31:0] haddr_wrap_nxt = { HADDR_D1[31:10], haddr_wrap_nxt_9to0 };

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      {"ahb_errm_haddr_wrap: The address for a SEQ transfer in a wrapping burst is equal to the address of the ",
       "previous transfer plus the size, in bytes, of the transfer, modulo the total number of bytes transfered in ",
       "the burst."}
   ) ahb_errm_haddr_wrap (
      .clk             ( HCLK                                                                    ),
      .reset_n         ( HRESETn                                                                 ),
      .antecedent_expr ( HREADY_D1 &
                         ( (HTRANS    == AHB_TRANS_BUSY  ) | (HTRANS    == AHB_TRANS_SEQ  )  ) &
                         ( (HTRANS_D1 == AHB_TRANS_NSEQ  ) | (HTRANS_D1 == AHB_TRANS_SEQ  )  ) &
                         ( (HBURST_D1 == AHB_BURST_WRAP4 ) | (HBURST_D1 == AHB_BURST_WRAP8) |
                           (HBURST_D1 == AHB_BURST_WRAP16)                                    )  ),
      .consequent_expr ( HADDRi == haddr_wrap_nxt                                                )
   );

   // INDEX:   - ahb_errm_hsize_too_wide
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.4, Page 3-8:
   // The transfer size set by HSIZE must be less than or equal to the width of
   // the data bus.

   assert_always #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_hsize_too_wide: Transfer is wider than data bus ports."
   ) ahb_errm_hsize_too_wide (
      .clk       ( HCLK                       ),
      .reset_n   ( HRESETn                    ),
      .test_expr ( (8 << HSIZE) <= DATA_WIDTH )
   );

   // INDEX:   - ahb_errm_hwdata_wait
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.1, Page 3-4:
   // For write operations the master holds the data stable throughout the
   // extended cycles.
   // For transfers that are narrower than the width of the bus, for example a
   // 16-bit transfer on a 32-bit bus, the master only has to drive the
   // appropriate byte lanes. The slave selects the write data from the correct
   // byte lanes.
   // [...]
   // The active byte lane is dependent on the endianness of the system.
   //
   // Note:
   // The stability check can't be done when the data is X, so give a warning.
   // This is handled in the X checks section.

   // Create write data valid bit mask based on bus width, transfer size and
   // transfer address.

   // Create byte mask based on bus width and access size only, assuming address
   // is 0.
   localparam DWB = DATA_WIDTH/8; // data bus width in bytes
   wire [7:0] hsize_dphase_q_shift = 8'b1 << hsize_dphase_q;
   wire [DWB-1:0] hwdata_byte_mask_inv_ali0 = {DWB{1'b1}} << hsize_dphase_q_shift;
   wire [DWB-1:0] hwdata_byte_mask_ali0     = ~hwdata_byte_mask_inv_ali0;

   // Factor in address and shift previously created mask accordingly.
   // The shift amount is the address masked based on the bus width.
   wire [2:0] data_width_shift = (DATA_WIDTH ==   8) ? 3'h7 :
                                 (DATA_WIDTH ==  16) ? 3'h6 :
                                 (DATA_WIDTH ==  32) ? 3'h5 :
                                 (DATA_WIDTH ==  64) ? 3'h4 :
                                 (DATA_WIDTH == 128) ? 3'h3 :
                                 (DATA_WIDTH == 256) ? 3'h2 :
                                 (DATA_WIDTH == 512) ? 3'h1 :
                                                       3'h0;
   wire [6:0] data_width_mask = {7{1'b1}} >> data_width_shift;
   wire [6:0] haddr_shift = haddr_6to0_dphase_q & data_width_mask;

   wire [DWB-1:0] hwdata_byte_mask = hwdata_byte_mask_ali0 << haddr_shift;

   // Factor in endianness.
   reg  [DATA_WIDTH-1:0] hwdata_mask_le;
   reg  [DATA_WIDTH-1:0] hwdata_mask_be;

   integer i; // byte index
   always @*
      for (i=0; i<DWB; i=i+1)
         hwdata_mask_le[8*i+:8] = {8{hwdata_byte_mask[i]}};

   integer j; // byte index
   always @*
      for (j=0; j<DWB; j=j+1)
         hwdata_mask_be[8*j+:8] = hwdata_mask_le[8*(DWB-1-j)+:8];

   wire [DATA_WIDTH-1:0] hwdata_mask = (BIG_ENDIAN != 0) ? hwdata_mask_be : hwdata_mask_le;

   wire [DATA_WIDTH-1:0] hwdata_masked = HWDATA & hwdata_mask;
   wire [DATA_WIDTH-1:0] hwdata_d1_masked = HWDATA_D1 & hwdata_mask;

   assert_implication #( OVL_SimError, MASTER_REQUIREMENT_PROPTYPE,
      "ahb_errm_hwdata_wait: HWDATA must remain stable if a write data phase is extended."
   ) ahb_errm_hwdata_wait (
      .clk             ( HCLK                                 ),
      .reset_n         ( HRESETn                              ),
      .antecedent_expr ( write_trans_dphase & (~HREADY_D1)    ),
      .consequent_expr ( (hwdata_masked === hwdata_d1_masked) )
   );

//------------------------------------------------------------------------------
// INDEX:
// INDEX: Master Rules - Recommendations
//------------------------------------------------------------------------------

   // INDEX:   - ahb_recm_unlock_idle
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.3, Page 3-7:
   // After a locked transfer, it is recommended that the master inserts an
   // IDLE transfer.

   assert_implication #( OVL_SimWarning, MASTER_RECOMMENDATION_PROPTYPE,
      "ahb_recm_unlock_idle: A master should insert an IDLE transfer after a locked (HMASTLOCK HIGH) sequence."
   ) ahb_recm_unlock_idle (
      .clk             ( HCLK                         ),
      .reset_n         ( HRESETn                      ),
      .antecedent_expr ( locked_dphase & (~HMASTLOCK) ),
      .consequent_expr ( HTRANS == AHB_TRANS_IDLE     )
   );

//------------------------------------------------------------------------------
// INDEX:
// INDEX: Slave Rules - Requirements
//------------------------------------------------------------------------------

   // INDEX:   - ahb_errs_hreadyout_reset
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 7.1.2, Page 7-2:
   // During reset all slaves must ensure that HREADYOUT is HIGH.

   assert_implication #( OVL_SimError, SLAVE_REQUIREMENT_PROPTYPE,
      "ahb_errs_hreadyout_reset: HREADYOUT must be HIGH during reset."
   ) ahb_errs_hreadyout_reset (
      .clk             ( HCLK        ),
      .reset_n         ( 1'b1        ),
      .antecedent_expr ( ~HRESETn_D1 ),
      .consequent_expr ( HREADYOUTi  )
   );

   // INDEX:   - ahb_errs_hreadyout_hresp_idle
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.2, Page 3-5:
   // Slaves must always provide a zero wait state OKAY response to IDLE
   // transfers and the transfer must be ignored by the slave.

   assert_implication #( OVL_SimError, SLAVE_REQUIREMENT_PROPTYPE,
      "ahb_errs_hreadyout_hresp_idle: Slaves must always provide a zero wait state OKAY response to IDLE transfers."
   ) ahb_errs_hreadyout_hresp_idle (
      .clk             ( HCLK                                                ),
      .reset_n         ( HRESETn                                             ),
      .antecedent_expr ( HSEL_D1 & (HTRANS_D1 == AHB_TRANS_IDLE) & HREADY_D1 ),
      .consequent_expr ( HREADYOUTi & (HRESP == AHB_RESP_OKAY)               )
   );

   // INDEX:   - ahb_errs_hreadyout_hresp_busy
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.2, Page 3-5:
   // Slaves must always provide a zero wait state OKAY response to BUSY
   // transfers and the transfer must be ignored by the slave.

   assert_implication #( OVL_SimError, SLAVE_REQUIREMENT_PROPTYPE,
      "ahb_errs_hreadyout_hresp_busy: Slaves must always provide a zero wait state OKAY response to BUSY transfers."
   ) ahb_errs_hreadyout_hresp_busy (
      .clk             ( HCLK                                                ),
      .reset_n         ( HRESETn                                             ),
      .antecedent_expr ( HSEL_D1 & (HTRANS_D1 == AHB_TRANS_BUSY) & HREADY_D1 ),
      .consequent_expr ( HREADYOUTi & (HRESP == AHB_RESP_OKAY)               )
   );

   // INDEX:   - ahb_errs_hresp_cycle1
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 5.1.3, Page 5-3:
   // [...] the ERROR response requires two cycles. To start the ERROR response,
   // the slave drives HRESP HIGH to indicate ERROR while driving HREADY LOW to
   // extend the transfer for one extra cycle. In the next cycle HREADY is
   // driven HIGH to end the transfer and HRESP remains driven HIGH to indicate
   // ERROR.

   assert_implication #( OVL_SimError, SLAVE_REQUIREMENT_PROPTYPE,
      {"ahb_errs_hresp_cycle1: If a slave responds with HREADYOUT LOW and HRESP as ERROR, then in the following ",
       "cycle it must respond with HREADYOUT HIGH and HRESP as ERROR."}
   ) ahb_errs_hresp_cycle1 (
      .clk             ( HCLK                                                                      ),
      .reset_n         ( HRESETn                                                                   ),
      .antecedent_expr ( selected_slave_dphase_D1 & (~HREADYOUT_D1) & (HRESP_D1 == AHB_RESP_ERROR) ),
      .consequent_expr ( HREADYOUTi & (HRESP == AHB_RESP_ERROR)                                    )
   );

   // INDEX:   - ahb_errs_hresp_cycle2
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 5.1.3, Page 5-3:
   // [...] the ERROR response requires two cycles. To start the ERROR response,
   // the slave drives HRESP HIGH to indicate ERROR while driving HREADY LOW to
   // extend the transfer for one extra cycle. In the next cycle HREADY is
   // driven HIGH to end the transfer and HRESP remains driven HIGH to indicate
   // ERROR.

   assert_implication #( OVL_SimError, SLAVE_REQUIREMENT_PROPTYPE,
      {"ahb_errs_hresp_cycle2: If a slave responds with HREADYOUT HIGH and HRESP as ERROR, then in the previous ",
       "cycle it must have responded with HREADYOUT LOW and HRESP as ERROR."}
   ) ahb_errs_hresp_cycle2 (
      .clk             ( HCLK                                                                      ),
      .reset_n         ( HRESETn                                                                   ),
      .antecedent_expr ( selected_slave_dphase    &   HREADYOUTi    & (HRESP    == AHB_RESP_ERROR) ),
      .consequent_expr ( selected_slave_dphase_D1 & (~HREADYOUT_D1) & (HRESP_D1 == AHB_RESP_ERROR) )
   );

//------------------------------------------------------------------------------
// INDEX:
// INDEX: Slave Rules - Recommendations
//------------------------------------------------------------------------------

   // INDEX:   - ahb_recs_hresp_reset
   // =====
   // Not part of the specification, but helps building systems.

   assert_implication #( OVL_SimWarning, SLAVE_RECOMMENDATION_PROPTYPE,
      "ahb_recs_hresp_reset: During reset, a slave should respond with HRESP as OKAY."
   ) ahb_recs_hresp_reset (
      .clk             ( HCLK                   ),
      .reset_n         ( 1'b1                   ),
      .antecedent_expr ( ~HRESETn_D1            ),
      .consequent_expr ( HRESP == AHB_RESP_OKAY )
   );

   // INDEX:   - ahb_recs_hreadyout_nonsel
   // =====
   // Not part of the specification, but helps building systems.
   // Ignored for MASTER_TO_INTERCONNECT, when this slave is always selected.

   assert_implication #( OVL_SimWarning, (MASTER_TO_INTERCONNECT != 0) ? 2 : SLAVE_RECOMMENDATION_PROPTYPE,
      "ahb_recs_hreadyout_nonsel: When a slave is not selected, it should respond with HREADYOUT HIGH."
   ) ahb_recs_hreadyout_nonsel (
      .clk             ( HCLK                   ),
      .reset_n         ( HRESETn                ),
      .antecedent_expr ( ~selected_slave_dphase ),
      .consequent_expr ( HREADYOUTi             )
   );

   // INDEX:   - ahb_recs_hresp_nonsel
   // =====
   // Not part of the specification, but helps building systems.
   // Ignored for MASTER_TO_INTERCONNECT, when this slave is always selected.

   assert_implication #( OVL_SimWarning, (MASTER_TO_INTERCONNECT != 0) ? 2 : SLAVE_RECOMMENDATION_PROPTYPE,
      "ahb_recs_hresp_nonsel: When a slave is not selected, it should respond with HRESP as OKAY."
   ) ahb_recs_hresp_nonsel (
      .clk             ( HCLK                   ),
      .reset_n         ( HRESETn                ),
      .antecedent_expr ( ~selected_slave_dphase ),
      .consequent_expr ( HRESP == AHB_RESP_OKAY )
   );

//------------------------------------------------------------------------------
// INDEX:
// INDEX: Interconnect Rules - Requirements
//------------------------------------------------------------------------------

   // INDEX:   - ahb_erri_hready_reset
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 7.1.2, Page 7-2:
   // During reset all slaves must ensure that HREADYOUT is HIGH.

   // Ignored for MASTER_TO_INTERCONNECT, when this slave is always selected.

   assert_implication #( OVL_SimError, (MASTER_TO_INTERCONNECT != 0) ? 2 : INTERCONNECT_REQUIREMENT_PROPTYPE,
      "ahb_erri_hready_reset: HREADY must be HIGH during reset."
   ) ahb_erri_hready_reset (
      .clk             ( HCLK                                 ),
      .reset_n         ( 1'b1                                 ),
      .antecedent_expr ( ~selected_slave_dphase & ~HRESETn_D1 ),
      .consequent_expr ( HREADY                               )
   );

   // INDEX:   - ahb_erri_hready_idle
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.2, Page 3-5:
   // Slaves must always provide a zero wait state OKAY response to IDLE
   // transfers and the transfer must be ignored by the slave.

   // Ignored for MASTER_TO_INTERCONNECT, when this slave is always selected.

   assert_implication #( OVL_SimError, (MASTER_TO_INTERCONNECT != 0) ? 2 : INTERCONNECT_REQUIREMENT_PROPTYPE,
      "ahb_erri_hready_idle: Slaves must always provide a zero wait state OKAY response to IDLE transfers."
   ) ahb_erri_hready_idle (
      .clk             ( HCLK                                                               ),
      .reset_n         ( HRESETn                                                            ),
      .antecedent_expr ( ~selected_slave_dphase & (HTRANS_D1 == AHB_TRANS_IDLE) & HREADY_D1 ),
      .consequent_expr ( HREADY                                                             )
   );

   // INDEX:   - ahb_erri_hready_busy
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 3.2, Page 3-5:
   // Slaves must always provide a zero wait state OKAY response to BUSY
   // transfers and the transfer must be ignored by the slave.

   // Ignored for MASTER_TO_INTERCONNECT, when this slave is always selected.

   assert_implication #( OVL_SimError, (MASTER_TO_INTERCONNECT != 0) ? 2 : INTERCONNECT_REQUIREMENT_PROPTYPE,
      "ahb_erri_hready_busy: Slaves must always provide a zero wait state OKAY response to BUSY transfers."
   ) ahb_erri_hready_busy (
      .clk             ( HCLK                                                               ),
      .reset_n         ( HRESETn                                                            ),
      .antecedent_expr ( ~selected_slave_dphase & (HTRANS_D1 == AHB_TRANS_BUSY) & HREADY_D1 ),
      .consequent_expr ( HREADY                                                             )
   );

   // INDEX:   - ahb_erri_hready_hreadyout_sel
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 4.2, Page 4-3:
   // Any response data from the selected slave, passes through the read data
   // multiplexor to the master.

   assert_implication #( OVL_SimError, INTERCONNECT_REQUIREMENT_PROPTYPE,
      "ahb_erri_hready_hreadyout_sel: HREADY and HREADYOUT must match when slave selected"
   ) ahb_erri_hready_hreadyout_sel (
      .clk             ( HCLK                  ),
      .reset_n         ( HRESETn               ),
      .antecedent_expr ( selected_slave_dphase ),
      .consequent_expr ( HREADY == HREADYOUTi  )
   );

   // INDEX:   - ahb_erri_hsel_haddr
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 4.1, Page 4-2:
   // The select signal is a combinatorial decode of the high-order address
   // signals.
   //
   // AHB-Lite Protocol Specification, v1.0, Section 4.1, Page 4-2:
   // The minimum address space that can be allocated to a single slave is 1KB.
   // All masters are designed so that they do not perform incrementing
   // transfers over a 1KB address boundary. This ensures that a burst never
   // crosses an address decode boundary.

   assert_implication #( OVL_SimError, INTERCONNECT_REQUIREMENT_PROPTYPE,
      "ahb_erri_hsel_haddr: HSEL must remain stable if HADDR[31:10] does not change."
   ) ahb_erri_hsel_haddr (
      .clk             ( HCLK                             ),
      .reset_n         ( HRESETn                          ),
      .antecedent_expr ( HADDRi[31:10] == HADDR_D1[31:10] ),
      .consequent_expr ( HSELi == HSEL_D1                 )
   );

   // INDEX:   - ahb_erri_hsel_burst
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 4.1, Page 4-2:
   // The minimum address space that can be allocated to a single slave is 1KB.
   // All masters are designed so that they do not perform incrementing
   // transfers over a 1KB address boundary. This ensures that a burst never
   // crosses an address decode boundary.

   assert_implication #( OVL_SimError, INTERCONNECT_REQUIREMENT_PROPTYPE,
      "ahb_erri_hsel_burst: HSEL must remain stable during a burst."
   ) ahb_erri_hsel_burst (
      .clk             ( HCLK                                                    ),
      .reset_n         ( HRESETn                                                 ),
      .antecedent_expr ( (HTRANS == AHB_TRANS_BUSY) | (HTRANS == AHB_TRANS_SEQ ) ),
      .consequent_expr ( HSELi == HSEL_D1                                        )
   );

//------------------------------------------------------------------------------
// INDEX:
// INDEX: Parameter Rules
//------------------------------------------------------------------------------

   // INDEX:   - ahb_param_addr_width
   // =====
   // Not part of the specification, protocol checker limitation.

   assert_proposition #( OVL_SimFatal, 0, // always assert
      "ahb_param_addr_width: Parameter ADDR_WIDTH must be between 1 and 32 inclusive."
   ) ahb_param_addr_width (
      .reset_n   ( HRESETn                                 ),
      .test_expr ( (ADDR_WIDTH >= 1) && (ADDR_WIDTH <= 32) )
   );

   // INDEX:   - ahb_param_data_width
   // =====
   // AHB-Lite Protocol Specification, v1.0, Section 6.2, Page 6-5:
   // The protocol allows the AHB-Lite data bus to be 8, 16, 32, 64, 128, 256,
   // 512, or 1024-bits wide.

   assert_proposition #( OVL_SimFatal, 0, // always assert
      "ahb_param_data_width: Parameter DATA_WIDTH must be 8, 16, 32, 64, 128, 256, 512 or 1024."
   ) ahb_param_data_width (
      .reset_n   ( HRESETn                 ),
      .test_expr ( (DATA_WIDTH ==    8) ||
                   (DATA_WIDTH ==   16) ||
                   (DATA_WIDTH ==   32) ||
                   (DATA_WIDTH ==   64) ||
                   (DATA_WIDTH ==  128) ||
                   (DATA_WIDTH ==  256) ||
                   (DATA_WIDTH ==  512) ||
                   (DATA_WIDTH == 1024)    )
   );

//------------------------------------------------------------------------------
// INDEX:
// INDEX: X checks
//------------------------------------------------------------------------------

   // AHB-Lite Protocol Specification, v1.0, Section 7.1.2, Page 7-2:
   // During reset all masters must ensure the address and control signals are
   // at valid levels [...]

   // The following logic assumes that the reset behaviour is asynchronous

   // This will start as x and become non-x as soon as HRESETn is asserted
   reg         hresetn_seen;
   always @*
      if (~HRESETn)
         hresetn_seen <= 1'b1;

   // This "kills" the x and transforms it into a 0; usable as enable
   wire        master_signals_valid = hresetn_seen !== 1'bx;

   // Master signals

   assert_never_unknown #( OVL_SimError, 32,       MASTER_XCHECK_PROPTYPE, "HADDR contains X"    )
   HADDR_X_check     (.clk(HCLK),.reset_n(1'b1   ),.qualifier(master_signals_valid),.test_expr(HADDRi    ));

   assert_never_unknown #( OVL_SimError,  3,       MASTER_XCHECK_PROPTYPE, "HBURST contains X"   )
   HBURST_X_check    (.clk(HCLK),.reset_n(1'b1   ),.qualifier(master_signals_valid),.test_expr(HBURST    ));

   assert_never_unknown #( OVL_SimError,  1,       MASTER_XCHECK_PROPTYPE, "HMASTLOCK contains X")
   HMASTLOCK_X_check (.clk(HCLK),.reset_n(1'b1   ),.qualifier(master_signals_valid),.test_expr(HMASTLOCK ));

   assert_never_unknown #( OVL_SimError,  4,       MASTER_XCHECK_PROPTYPE, "HPROT contains X"    )
   HPROT_X_check     (.clk(HCLK),.reset_n(1'b1   ),.qualifier(master_signals_valid),.test_expr(HPROT     ));

   assert_never_unknown #( OVL_SimError,  3,       MASTER_XCHECK_PROPTYPE, "HSIZE contains X"    )
   HSIZE_X_check     (.clk(HCLK),.reset_n(1'b1   ),.qualifier(master_signals_valid),.test_expr(HSIZE     ));

   assert_never_unknown #( OVL_SimError,  2,       MASTER_XCHECK_PROPTYPE, "HTRANS contains X"   )
   HTRANS_X_check    (.clk(HCLK),.reset_n(1'b1   ),.qualifier(master_signals_valid),.test_expr(HTRANS    ));

   // HWDATA special case below

   assert_never_unknown #( OVL_SimError,  1,       MASTER_XCHECK_PROPTYPE, "HWRITE contains X"   )
   HWRITE_X_check    (.clk(HCLK),.reset_n(1'b1   ),.qualifier(master_signals_valid),.test_expr(HWRITE    ));

   // Slave signals

   // HRDATA allowed to be X

   assert_never_unknown #( OVL_SimError,  1,        SLAVE_XCHECK_PROPTYPE, "HREADYOUT contains X")
   HREADYOUT_X_check (.clk(HCLK),.reset_n(HRESETn),.qualifier(1'b1                ),.test_expr(HREADYOUTi));

   assert_never_unknown #( OVL_SimError,  1,        SLAVE_XCHECK_PROPTYPE, "HRESP contains X"    )
   HRESP_X_check     (.clk(HCLK),.reset_n(HRESETn),.qualifier(1'b1                ),.test_expr(HRESP     ));

   // Interconnect signals

   assert_never_unknown #( OVL_SimError,  1, INTERCONNECT_XCHECK_PROPTYPE, "HREADY contains X"   )
   HREADY_X_check    (.clk(HCLK),.reset_n(HRESETn),.qualifier(1'b1                ),.test_expr(HREADY    ));

   assert_never_unknown #( OVL_SimError,  1, INTERCONNECT_XCHECK_PROPTYPE, "HSEL contains X"     )
   HSEL_X_check      (.clk(HCLK),.reset_n(HRESETn),.qualifier(1'b1                ),.test_expr(HSELi     ));

   // Special case for HWDATA

   // HWDATA stability can't be checked when it contains X, so give a warning
   // when HWDATA contains X and its stability should be checked.

   localparam HWDATA_X_CHECK_PROPTYPE = ((MASTER_REQUIREMENT_PROPTYPE == 0) && (MASTER_XCHECK_PROPTYPE == 0)) ? 0 : 2;

   assert_never_unknown #( OVL_SimWarning, DATA_WIDTH, HWDATA_X_CHECK_PROPTYPE, "HWDATA contains X: stability unknown")
   HWDATA_X_check (.clk(HCLK),.reset_n(1'b1),
                   .qualifier(master_signals_valid & write_trans_dphase & (~HREADY_D1)),
                   .test_expr(HWDATA & hwdata_mask));

//------------------------------------------------------------------------------
// INDEX:
// INDEX: End of module
//------------------------------------------------------------------------------
endmodule

//------------------------------------------------------------------------------
// INDEX:
// INDEX: End of File
//------------------------------------------------------------------------------
