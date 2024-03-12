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
// Abstract : AHB to AHB synchronous bridge for timing isolation. signals
//           transfered between bridge slave side and bridge master side are
//           registered
//-----------------------------------------------------------------------------


module cmsdk_ahb_to_ahb_sync #(
  // --------------------------------------------------------------------------------
  // Parameters
  // --------------------------------------------------------------------------------

  parameter       AW    = 32,  //Define the address width of AHB bridge
  parameter       DW    = 32,  //Define the data width of AHB bridge
  parameter       MW    = 4,   //Define the master number width of AHB bridge
  parameter       BURST = 0)   //Indicate whether support burst transaction:
                               //0: no support, 1: support
 (
  // --------------------------------------------------------------------------------
  // I/O declarations
  // --------------------------------------------------------------------------------
  input  wire          HCLK,       // Clock
  input  wire          HRESETn,    // Reset

  // AHB connection to master
  input  wire          HSELS,
  input  wire [AW-1:0] HADDRS,
  input  wire    [1:0] HTRANSS,
  input  wire    [2:0] HSIZES,
  input  wire          HWRITES,
  input  wire          HREADYS,
  input  wire    [3:0] HPROTS,
  input  wire [MW-1:0] HMASTERS,
  input  wire          HMASTLOCKS,
  input  wire [DW-1:0] HWDATAS,
  input  wire    [2:0] HBURSTS,

  output wire          HREADYOUTS,
  output wire          HRESPS,
  output wire [DW-1:0] HRDATAS,

  // AHB connection to slave
  output wire [AW-1:0] HADDRM,
  output wire   [1:0]  HTRANSM,
  output wire   [2:0]  HSIZEM,
  output wire          HWRITEM,
  output wire   [3:0]  HPROTM,
  output wire [MW-1:0] HMASTERM,
  output wire          HMASTLOCKM,
  output wire [DW-1:0] HWDATAM,
  output wire   [2:0]  HBURSTM,

  input  wire          HREADYM,
  input  wire          HRESPM,
  input  wire [DW-1:0] HRDATAM);

  // --------------------------------------------------------------------------------
  // Derived parameters

  localparam      HSIZE_W   = (DW > 64) ? 3 : 2; // Width of HSIZE that need to be stored
  localparam      HSIZE_MAX = HSIZE_W - 1;       // MSB of HSIZE register

  // --------------------------------------------------------------------------------
  // Internal wires declarations
  // --------------------------------------------------------------------------------

  // Local parameters

  // HTRANSS transaction definitions
  localparam TRN_IDLE   = 2'b00;             // idle transaction
  localparam TRN_BUSY   = 2'b01;             // busy transaction
  localparam TRN_NONSEQ = 2'b10;             // non-sequential
  localparam TRN_SEQ    = 2'b11;             // sequential

  // Slave response status definitions
  localparam RESP_OKAY  = 1'b0;              // Response OKAY
  localparam RESP_ERR   = 1'b1;              // Response ERROR

  // HBURSTS transaction type signal encoding
  localparam BUR_SINGLE = 3'b000;            // single
  localparam BUR_INCR   = 3'b001;            // incrementing
  localparam BUR_WRAP4  = 3'b010;            // 4-beat wrap
  localparam BUR_INCR4  = 3'b011;            // 4-beat incr
  localparam BUR_WRAP8  = 3'b100;            // 8-beat wrap
  localparam BUR_INCR8  = 3'b101;            // 8-beat incr
  localparam BUR_WRAP16 = 3'b110;            // 16-beat wrap
  localparam BUR_INCR16 = 3'b111;            // 16-beat incr

  // Main control FSM local parameters
  localparam FSM_IDLE  = 4'b0100;            // Idle on both side
  localparam FSM_ADDR  = 4'b0001;            // address phase on master side
  localparam FSM_UNLOCK= 4'b0000;            // unlock idle insertion on master side
  localparam FSM_WAIT  = 4'b0010;            // data phase on master side
  localparam FSM_DONE  = 4'b0110;            // end of data phase on slave side
  localparam FSM_ERR1  = 4'b1000;            // error response on slave side #1
  localparam FSM_ERR2  = 4'b1100;            // error response on slave side #2

  // registers for holding the previous values
  reg [AW-1:0]  haddr_reg;
  reg           hwrite_reg;
  reg [HSIZE_MAX:0]  hsize_reg;
  reg    [3:0]  hprot_reg;
  reg [MW-1:0]  hmaster_reg;
  reg           hmastlock_reg;
  reg    [2:0]  hburst_reg;
  reg    [1:0]  hold_htrans_reg;            // used to hold the previous valid HTRANSS
                                            // for unlock IDLE insertion

  // main control FSM signals
  reg    [3:0]  reg_fsm_state;
  reg    [3:0]  nxt_fsm_state;

  wire          trans_finish_addr;           // Indicate bridge slave side valid address phase transaction

  // lock and data register control signals
  reg  [DW-1:0] hdata_reg;                   // Shared between read and write
  wire [DW-1:0] nxt_hdata_reg;               // Shared between read and write

  wire          data_update_read;            // Read data update
  wire          data_update_write;           // Write data update
  wire          data_update_both;            // Read or Write data update


  //transaction type control signals
  wire [1:0]    next_htransm;                // transaction type
  reg [1:0]     htransm_reg;                 // transaction type
  wire          trans_update;                // update the output transaction type

  // Error cancelation module interface signals
  wire  [1:0]   htransm_canc;                // transaction type
  wire          hreadyoutm_canc;             // transaction ready
  wire          hrespm_canc;                 // transaction response

  // --------------------------------------------------------------------------------
  // Unlocking transaction IDLE insertion control
  // --------------------------------------------------------------------------------
  // The bridge will insert IDLE transaction if the master unlock the previous transaction
  // or the bridge is not selected anymore.
  // regardless whether the master insert unlock idle transaction.

  reg      lock_trans_valid;      // Indicate current AHB data phase hmastlocks singal is valid
  wire     unlock_idle_valid;     // Indicate bridge unlock idle transaction is valid

  // delay version of HMASTLOCKS, when HSELS is valid.
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
       lock_trans_valid   <= 1'b0;
    end
    else if (trans_finish_addr & HMASTLOCKS)
           begin
           // Locked transaction start with valid transaction
           lock_trans_valid   <= 1'b1;
           end
         else if (HREADYS &((HSELS & (~HMASTLOCKS)) | (~HSELS)))
           begin
           // unlock the transaction if master unlock it or current bridge is not selected any more
           lock_trans_valid   <= 1'b0;
           end
    end

  // bridge slave side unlock idle is valid if :
  // 1: the bridge is selected and the master unlock the transaction
  // 2: the bridge is not selected ( can be burst early termination)
  assign   unlock_idle_valid =  HREADYS & lock_trans_valid & (((~HMASTLOCKS) & HSELS)
                              | (~HSELS));

  // --------------------------------------------------------------------------------
  // Main control FSM
  // --------------------------------------------------------------------------------

  assign trans_finish_addr = HSELS & HTRANSS[1] & HREADYS;

  // Main control FSM: next state generation
  always @(*) begin
    case (reg_fsm_state)
      FSM_IDLE: begin //Bridge slave side address phase
                   nxt_fsm_state = ~trans_finish_addr ? FSM_IDLE   :
                                   unlock_idle_valid  ? FSM_UNLOCK :
                                                        FSM_ADDR;
                end
      FSM_UNLOCK: begin //Bridge master side unlock IDLE insertion
                   nxt_fsm_state = FSM_ADDR;
                end
      FSM_ADDR: begin // Bridge master side address phase
                   nxt_fsm_state = FSM_WAIT;
                end
      FSM_WAIT: begin //Bridge master side data phase
                   nxt_fsm_state = hrespm_canc     ? FSM_ERR1 :
                                   hreadyoutm_canc ? FSM_DONE :
                                                     FSM_WAIT;
                end
      FSM_DONE: begin //Bridge slave side data phase
                   nxt_fsm_state = ~trans_finish_addr ? FSM_IDLE   :
                                   unlock_idle_valid  ? FSM_UNLOCK :
                                                        FSM_ADDR;
                end
      FSM_ERR1: begin //Bridge slave side error response: state 1
                   nxt_fsm_state = FSM_ERR2;
                end
      FSM_ERR2: begin  //Bridge slave side error response: state 2
                   nxt_fsm_state = ~trans_finish_addr ? FSM_IDLE   :
                                   unlock_idle_valid  ? FSM_UNLOCK :
                                                        FSM_ADDR;
                end
      default : begin
                   nxt_fsm_state = 4'bxxxx; //for X propogation
                end
    endcase
  end

  // Register state for FSM
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn)
      reg_fsm_state <= FSM_IDLE;
    else
      reg_fsm_state <= nxt_fsm_state;
  end

  // --------------------------------------------------------------------------------
  // Signal holding logic
  // --------------------------------------------------------------------------------
  // register the address phase control signals which only need to update after a
  // bridge slave side valid transaction
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
      hsize_reg       <= { HSIZE_W{1'b0}};
      hwrite_reg      <=     1'b0;
      hprot_reg       <= { 4{1'b0}};
      hmaster_reg     <= { MW{1'b0}};
      hold_htrans_reg <= TRN_IDLE;
    end
    else if (trans_finish_addr ) begin
      hsize_reg       <= HSIZES[HSIZE_MAX:0];
      hwrite_reg      <= HWRITES;
      hprot_reg       <= HPROTS;
      hmaster_reg     <= HMASTERS;
      hold_htrans_reg <= HTRANSS;
    end
  end

  // Data holding register control
  assign data_update_read  = (reg_fsm_state == FSM_WAIT) & (hwrite_reg==1'b0) & (hreadyoutm_canc==1'b1);
  assign data_update_write = (reg_fsm_state == FSM_ADDR) & (hwrite_reg==1'b1);
  assign data_update_both  = data_update_read | data_update_write;
  assign nxt_hdata_reg     = (data_update_write) ? HWDATAS : HRDATAM ;

  // Data holding register
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn)
      hdata_reg <= {DW{1'b0}};
    else if (data_update_both)
      hdata_reg <= nxt_hdata_reg;
  end

  // Master Lock register
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn)
      hmastlock_reg <=  1'b0;
    else if (trans_finish_addr|unlock_idle_valid)
      hmastlock_reg <= HMASTLOCKS;
  end

  //transaction info update for bridge master side signals
  assign   trans_update = (nxt_fsm_state == FSM_ADDR);

  // --------------------------------------------------------------------------------
  // Burst support logic, can be enabled by set BURST parameter to 1
  // --------------------------------------------------------------------------------
  generate
  //----------------------------------------------------------------------------
  // Generate: burst support present
  //----------------------------------------------------------------------------
  if (BURST == 1)
    begin: gen_burst_support

    // Error cancellation block:
    // When the ErrorCanc block receives an ERROR response from the slave on AHB
    // it responds with an ERROR to each further transaction in the burst and drives
    // IDLE on HTRANSM until the burst on AHB1 is complete.
    //
    // Since the bridge assume continues bursts by default then the error_canc block
    // should be placed after it:
    //
    //   AHB1 --> Bridge --> ErrorCanc --> AHB2

    cmsdk_ahb_to_ahb_sync_error_canc
     u_ahb_error_canc
     (
      // Inputs
      .HCLK      (HCLK),
      .HCLKEN    (1'b1),
      .HRESETn   (HRESETn),

      // AHB slave interface
      .HTRANSS   (htransm_reg),

      .HREADYOUTS(hreadyoutm_canc),
      .HRESPS    (hrespm_canc),

      // AHB master interface
      .HTRANSM   (htransm_canc),

      .HREADYM   (HREADYM),
      .HRESPM    (HRESPM)
     );

  wire     busy_override;              // BUSY state insertion control
  wire     transm_addr_update;         // Bridge master side address update signal

  assign   busy_override = HTRANSS[0] & HSELS; //bridge slave side has ongoing burst transaction

  //transaction type generation
  assign   next_htransm  = unlock_idle_valid  ? TRN_IDLE : // Unlock IDLE insertion
                           trans_update       ? ((reg_fsm_state == FSM_UNLOCK)? hold_htrans_reg :HTRANSS):
                                // if previous transaction is unlock IDLE insertion, update from hold register,
                                // else from the bridge slave input
                           busy_override      ? TRN_BUSY://busy override transaction
                                                TRN_IDLE;//default IDLE state

  // transaction type register
  always @ (posedge HCLK or negedge HRESETn) begin
    if (~HRESETn)
        htransm_reg  <= TRN_IDLE;
    else if (hreadyoutm_canc)
        htransm_reg  <= next_htransm;
  end

   // transaction type assignment
   assign HTRANSM        = htransm_canc;

   // transaction address assignment
   assign transm_addr_update = (trans_finish_addr | //bridge slave side valid transaction
                                ((reg_fsm_state == FSM_ADDR) & busy_override)
                                         // BUSY state address update from bridge slave side
                               );

   // Address register update
   always @(posedge HCLK or negedge HRESETn) begin
     if (~HRESETn) begin
       haddr_reg     <= {AW{1'b0}};
       end
     else if (transm_addr_update) begin
       haddr_reg     <= HADDRS;
       end
   end

   // transaction burst assignment
   always @(posedge HCLK or negedge HRESETn) begin
     if (~HRESETn) begin
        hburst_reg    <= BUR_SINGLE;
        end
     else if (trans_finish_addr) begin
        hburst_reg    <= HBURSTS;
        end
   end

  assign HBURSTM = hburst_reg;

  end

 // --------------------------------------------------------------------------------
 // Burst support not present
 // --------------------------------------------------------------------------------
  else begin: gen_no_burst_support
   // transaction type assignment
  assign  next_htransm  =  unlock_idle_valid  ? TRN_IDLE : // Unlock IDLE insertion
                           trans_update       ? ((reg_fsm_state == FSM_UNLOCK)? {hold_htrans_reg[1],1'b0} :{HTRANSS[1],1'b0}):
                                // if previous transaction is unlock IDLE insertion, update from hold register,
                                // else from the bridge slave input
                                                TRN_IDLE;//default IDLE state

  // transaction type register
  always @ (posedge HCLK or negedge HRESETn) begin
    if (~HRESETn)
        htransm_reg  <= TRN_IDLE;
    else if (HREADYM)
        htransm_reg  <= next_htransm;
  end

  // transaction type assignment
  assign HTRANSM         = {htransm_reg[1], 1'b0}; // IDLE or NSEQ only
  assign htransm_canc    = TRN_IDLE; // Signal not used when BURST=0

  // error cancel logic not present, feedback path connected directly
  assign hrespm_canc     = HRESPM;
  assign hreadyoutm_canc = HREADYM;

  // Address register update
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn)
      begin
       haddr_reg     <= {AW{1'b0}};
      end
    else if (trans_finish_addr) // Capture HADDR when device is selected and have an active transfer
      begin
       haddr_reg     <= HADDRS;
      end
  end

   // transaction burst assignment
   assign  HBURSTM    = BUR_SINGLE; // Always Single

  end // end of gen_no_burst_support
  endgenerate

 // --------------------------------------------------------------------------------
 // Output assignments
 // --------------------------------------------------------------------------------
  assign HREADYOUTS   = reg_fsm_state[2];
  assign HRESPS       = reg_fsm_state[3];
  assign HRDATAS      = hdata_reg;

  assign HADDRM       = haddr_reg;
  assign HSIZEM[2]    = (DW > 64) ? hsize_reg[HSIZE_MAX] : 1'b0;
  assign HSIZEM[1:0]  = hsize_reg[1:0];
  assign HWRITEM      = hwrite_reg;
  assign HPROTM       = hprot_reg;
  assign HMASTERM     = hmaster_reg;
  assign HMASTLOCKM   = hmastlock_reg;
  assign HWDATAM      = hdata_reg;

  // --------------------------------------------------------------------------------
  // Assertion property
  // --------------------------------------------------------------------------------
`ifdef ARM_AHB_ASSERT_ON
`include "std_ovl_defines.h"
   reg        ovl_reg_s_data_phase;  // AHB-S port data phase
   reg        ovl_reg_s_write;       // AHB-S port data phase write
   reg [2:0]  ovl_reg_s_hsize;       // AHB-S port sampled hsize
   reg [2:0]  ovl_reg_s_hburst;      // AHB-S port sampled hburst
   reg [3:0]  ovl_reg_s_hprot;       // AHB-S port sampled hprot
   reg        ovl_reg_s_hmastlock;   // AHB-S port sampled hmastlock
   reg        ovl_reg_m_data_phase;  // AHB-M port data phase
   reg        ovl_reg_m_write;       // AHB-M port data phase write

   always @(posedge HCLK or negedge HRESETn)
   begin
     if (~HRESETn)
       begin
       ovl_reg_s_data_phase <= 1'b0;
       ovl_reg_s_write      <= 1'b0;
       ovl_reg_s_hsize      <= {3{1'b0}};
       ovl_reg_s_hprot      <= {4{1'b0}};
       ovl_reg_s_hburst     <= {3{1'b0}};
       ovl_reg_s_hmastlock  <= 1'b0;
       end
     else if (HREADYS)
       begin
       ovl_reg_s_data_phase <= HSELS & HTRANSS[1];
       ovl_reg_s_write      <= HWRITES;
       ovl_reg_s_hsize      <= HSIZES;
       ovl_reg_s_hprot      <= HPROTS;
       ovl_reg_s_hburst     <= HBURSTS;
       ovl_reg_s_hmastlock  <= HMASTLOCKS;
       end
   end

   always @(posedge HCLK or negedge HRESETn)
   begin
     if (~HRESETn)
       begin
       ovl_reg_m_data_phase <= 1'b0;
       ovl_reg_m_write      <= 1'b0;
       end
     else if (HREADYM)
       begin
       ovl_reg_m_data_phase <= HTRANSM[1];
       ovl_reg_m_write      <= HWRITEM;
       end
   end


   // Ensure FSM state must not be in invalid state
   // FSM use 4 bits because highest 2-bit are mapped to HRESP and HREADYOUT
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "FSM in illegal state")
   u_ovl_ahb_sync_fsm_state_illegal
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((reg_fsm_state==4'b0011)|
                 (reg_fsm_state==4'b0101)|(reg_fsm_state==4'b0111)|
                 (reg_fsm_state==4'b1001)|(reg_fsm_state==4'b1010)|
                 (reg_fsm_state==4'b1011)|(reg_fsm_state==4'b1101)|
                 (reg_fsm_state==4'b1110)|(reg_fsm_state==4'b1111)
                 ));


    // Check FSM never go to xxxx state
    assert_never_unknown
    #(`OVL_ERROR, 4, `OVL_ASSERT, "FSM went to X")
    u_ovl_ahb_sync_fsm_x (
    .clk       (HCLK),
    .reset_n   (HRESETn),
    .qualifier (1'b1),
    .test_expr (reg_fsm_state)
     );


   // The bridge slave side transaction release to the bridge master side after one cycle delay if not in unlock
   // idle insertion state
   assert_next
    #(`OVL_ERROR, 1,1,0,
      `OVL_ASSERT,
      "The bridge slave side transaction should release to the bridge master side after one cycle delay if no unlock idle insertion"
      )
    u_ovl_ahb_sync_trans_delay
    (.clk         ( HCLK ),
     .reset_n     (HRESETn),
     .start_event ((HTRANSS == TRN_NONSEQ) & (nxt_fsm_state != FSM_UNLOCK) &
                   HREADYS & HSELS & (HRESPS ==RESP_OKAY)),
     .test_expr   (HTRANSM == TRN_NONSEQ
                   )
     );

   // If downstream AHB slave return error response, upstream AHB will get error response
   assert_next
    #(`OVL_ERROR, 1,1,0,
      `OVL_ASSERT,
      "AHB error response transfer failure"
      )
   u_ovl_ahb_error_from_slave(
     .clk         ( HCLK ),
     .reset_n     (HRESETn),
     .start_event (HREADYM & HRESPM & ovl_reg_m_data_phase),
     .test_expr   (HREADYOUTS & HRESPS)
     );

   // When a transfer is on-going on AHB-M interface, there must be a transfer on AHB-S
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Transfer appear on AHB-M without transfer on AHB-S")
   u_ovl_ahb_status_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_m_data_phase),
      .consequent_expr(ovl_reg_s_data_phase)
      );

   // Sampling of HWDATAS (data_update_write) take place at first cycle of write transfer
   // before data phase start on AHB-M
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Write data sampling control timing incorrect")
   u_ovl_write_data_sampling
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(data_update_write),
      .consequent_expr(ovl_reg_s_data_phase & ovl_reg_s_write & (~ovl_reg_m_data_phase))
      );

   // Sampling of HRDATAM (data_update_read) take place at last cycle of read transfer
   // on AHB-M
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Read data sampling control timing incorrect")
   u_ovl_read_data_sampling
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(data_update_read),
      .consequent_expr(ovl_reg_m_data_phase & HREADYM & (~ovl_reg_m_write))
      );

   // During transfer on AHB-M, HWRITE information must match transfer announced on AHB-S
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Read/Write information mismatch")
   u_ovl_hwrite_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_m_data_phase),
      .consequent_expr(ovl_reg_m_write == ovl_reg_s_write) // ovl_reg_m_write is derived from HWRITEM
      );                                                   // ovl_reg_s_write is derived from HWRITES

   // During transfer on AHB-M, HSIZEM information must match transfer announced on AHB-S
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HSIZE information mismatch")
   u_ovl_hsize_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(HTRANSM[1] & HREADYM),
      .consequent_expr(HSIZEM == ovl_reg_s_hsize)
      );

   // During transfer on AHB-M, HPROTM information must match transfer announced on AHB-S
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HSIZE information mismatch")
   u_ovl_hprot_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(HTRANSM[1] & HREADYM),
      .consequent_expr(HPROTM == ovl_reg_s_hprot)
      );

   // During transfer on AHB-M, HMASTLOCKM information must match transfer announced on AHB-S
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HMASTLOCKM information mismatch")
   u_ovl_hmastlock_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(HTRANSM[1] & HREADYM),
      .consequent_expr(HMASTLOCKM == ovl_reg_s_hmastlock)
      );

 generate
   if (BURST == 1) begin : gen_ovl_burst_support  // Support burst transaction

   // If burst is supported, the bridge master side will override next transaction with IDLE
   // if error response is received
   assert_next
    #(`OVL_ERROR, 1,1,0,
      `OVL_ASSERT,
      "In burst transaction, when the bridge receive error response, it will override next transaction with IDLE "
      )
    u_ovl_ahb_sync_err_burstm_terminate
    (.clk         ( HCLK ),
     .reset_n     (HRESETn),
     .start_event ((HRESPM == RESP_ERR) & (~HREADYM) &
                   (HBURSTM != BUR_SINGLE)
                   ),
     .test_expr   (HTRANSM == TRN_IDLE
                   )
     );

   // During transfer on AHB-M, HBURSTM information must match transfer announced on AHB-S
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "HBURST information mismatch")
   u_ovl_hburst_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(HTRANSM[1] & HREADYM),
      .consequent_expr(HBURSTM == ovl_reg_s_hburst)
      );



   end
   else begin : gen_ovl_no_burst_support   // Does not support burst transaction
   // BUSY and SEQ transaction type never happen
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "Illegal transaction type BUSY/SEQ if BURST is not supported ")
   u_ovl_ahb_sync_htransm_state_illegal
     (.clk      (HCLK),
      .reset_n  (HRESETn),
      .test_expr( (HTRANSM == TRN_BUSY) |
                  (HTRANSM == TRN_SEQ)
                )
      );

   end
 endgenerate

 `endif

 // --------------------------------------------------------------------------------
 // End of module
 // --------------------------------------------------------------------------------


endmodule
