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
// Abstract : AHB to AHB sync down bridge without buffered write support
//           Signals from bridge slave side to bridge master side are registered,
//           (such as HTRANSM, HADDRM etc)
//           Signals from bridge master side to bridge slave side are directly
//           connected (such as HRDATAS)
//           This sync down bridge core can be configured to support or not support
//           burst transaction. buffered write is not supported in this bridge core
//           but a seperate write buffer module can be connected to this bridge to
//           support buffered write.
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Functional Overview
//-----------------------------------------------------------------------------
//
//           +------------+
//  AHB1 +---+S  Bridge  M+--+ AHB2
//           +------------+
//   HCLKS                      HCLKM
//
// The Synchronous Step-Dn (N:1) Bridge is used to connect AHB buses where the
// originating bus (AHB1) is running at a clock frequency which is a multiple
// of the target bus (AHB2). The clock of AHB1 is driven by HCLKS (S for
// slave side) and the clock of AHB2 is HCLKM (M for Master side). The clock
// ratio HCLKS:HCLKM is of the form N:1 where N is an integer.
//
// This block is driven by one clock, HCLK, at the higher
// frequency HCLKS. Co-incident rising edges on the two clocks are indicated
// with the HCLKEN input as shown below for a ratio of 3:1.
//
//          _   _   _   _   _   _   _   _   _   _   _   _   _   _   _
// HCLKS  _| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_
//          _____       _____       _____       _____       _____
// HCLKM  _|     |_____|     |_____|     |_____|     |_____|     |_____
//        _          __          __          __          __          __
// HCLKEN  |________|  |________|  |________|  |________|  |________|  |
//
//------------------------------------------------------------------------------



module cmsdk_ahb_to_ahb_sync_down_core #(
// --------------------------------------------------------------------------------
// Parameters
// --------------------------------------------------------------------------------

  parameter       AW    = 32,  //Define the address width of AHB bridge
  parameter       DW    = 32,  //Define the data width of AHB bridge, 8/16/32/64 etc.
  parameter       MW    = 1,   //Define the master number width of AHB bridge
  parameter       BURST = 0)   //Indicate whether support burst transaction:
                             //0: no support, 1: support
 (
// --------------------------------------------------------------------------------
// IO declaration
// --------------------------------------------------------------------------------
  input  wire          HCLK,       // Clock
  input  wire          HRESETn,    // Reset
  input  wire          HCLKEN,     // Clock enable signal

  // AHB bridge slave side signals: connect to master
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

  // AHB bridge master side signals: connect to slave
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

 //Local parameters

  // HTRANSS transaction
  localparam TRN_IDLE   = 2'b00;             // idle transaction
  localparam TRN_BUSY   = 2'b01;             // busy transaction
  localparam TRN_NONSEQ = 2'b10;             // non-sequential transaction
  localparam TRN_SEQ    = 2'b11;             // sequential transaction

  //response
  localparam RESP_OKAY  = 1'b0;              // Response OKAY
  localparam RESP_ERR   = 1'b1;              // Response ERROR

  //Main control FSM local parameters
  localparam FSM_IDLE  = 3'b000;            // Idle on both side
  localparam FSM_SYNC  = 3'b001;            // Synchronize to low clock domain
  localparam FSM_ADDR  = 3'b010;            // address phase on master side
  localparam FSM_WAIT  = 3'b011;            // data phase on master side
  localparam FSM_ERR1  = 3'b100;            // error response on slave side #1
  localparam FSM_ERR2  = 3'b101;            // error response on slave side #2
  localparam FSM_UNLOCK  = 3'b110;          // state for locked idle state insertion

 //register for holding the previous address and control signals
  reg [AW-1:0]       hold_haddr_reg;
  reg [1:0]          hold_htrans_reg;
  reg                hold_hwrite_reg;
  reg [HSIZE_MAX:0]  hold_hsize_reg;
  reg [3:0]          hold_hprot_reg;
  reg [MW-1:0]       hold_hmaster_reg;
  reg                hold_hmastlock_reg;

//Bridge timing isolation register for master side interface: register input
  wire[AW-1:0]       next_haddrm_reg;
  wire               next_hwritem_reg;
  wire[HSIZE_MAX:0]  next_hsizem_reg;
  wire[3:0]          next_hprotm_reg;
  wire[MW-1:0]       next_hmasterm_reg;
  wire               next_hmastlockm_reg;
  wire[1:0]          next_htransm_reg;       //master side transaction type signal

//Bridge timing isolation register for master side interface: register output
  reg [AW-1:0]       haddrm_reg;
  reg                hwritem_reg;
  reg [HSIZE_MAX:0]  hsizem_reg;
  reg [3:0]          hprotm_reg;
  reg [MW-1:0]       hmasterm_reg;
  reg                hmastlockm_reg;
  reg [1:0]          htransm_reg;            //master side transaction type register



// Response signals to AHB master
  wire          hreadyouts_comb;

// main control FSM signals
  reg    [2:0]  reg_fsm_state;               // FSM state register: current state
  reg    [2:0]  nxt_fsm_state;               // FSM state register: next state
  wire          trans_update;                // transaction info update control signal

//Bridge slave side signals
  wire          trans_req;                   //transaction request detected
  wire          trans_finish_addr;           //address phase trans finish



//Bridge master side signals

// write data register control signals
  reg  [DW-1:0] hwdata_reg;                 //write data register
  wire          data_update_write;

// Address/Control signals
  reg           addr_hold_reg;              //indicate a valid address phase signal is stored in the hold register



//Address and control signal change control signal
  wire          addr_m_changeable;          // Indicate change of the control signal on bridge master side is permitted

// Error cancelation module interface signals
  wire  [1:0]   htransm_canc;               //transaction type
  wire          hreadyoutm_canc;            //transaction ready
  wire          hrespm_canc;                //transaction response

// --------------------------------------------------------------------------------
//locked transaction IDLE insertion control
// --------------------------------------------------------------------------------
//The bridge will insert IDLE transaction if the master unlock the previous transaction
//or the bridge is not selected anymore.
//regardless whether the master insert unlock idle transaction.

  reg      lock_trans_valid;      //Indicate current AHB data phase hmastlocks singal is valid
  wire     unlocks_idle_valid;    //indicate bridge slave side unlock idle transaction is valid
  reg      unlockm_idle_pending;  //indicate unlocks_idle_valid signal is still waiting for the bridge
                                  // master side to insert the unlock idle transaction
  wire     unlockm_idle_valid;    //indicate bridge master side lock idle transaction is valid


//delay version of HMASTLOCKS, when HSELS is valid.
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
       lock_trans_valid   <= 1'b0;
    end
    else if (trans_finish_addr & HMASTLOCKS) begin
          //Locked transaction start with valid transaction
       lock_trans_valid   <= 1'b1;
    end
    else if (HREADYS &((HSELS & (~HMASTLOCKS)) | (~HSELS))) begin
          //unlock the transaction if master unlock it or current bridge is not selected any more
       lock_trans_valid   <= 1'b0;
    end
  end

// bridge slave side unlock idle is valid if :
// 1: the bridge is selected and the master unlock the transaction
// 2: the bridge is not selected ( can be burst early termination)
  assign   unlocks_idle_valid =  HREADYS & lock_trans_valid & (((~HMASTLOCKS) & HSELS)
                                 | (~HSELS));

//Pending the unlock idle signal until the master side acknowledge the unlock idle transaction
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
       unlockm_idle_pending  <= 1'b0;
    end
    else if (HCLKEN) begin
            //unlock idle will be directed to the bridge slave side
       unlockm_idle_pending  <= 1'b0;
    end
    else if (unlocks_idle_valid) begin
       unlockm_idle_pending  <= 1'b1;
    end
  end

//an unlock idle transaction is valid and an IDLE transaction need to be inserted
  assign unlockm_idle_valid = (unlocks_idle_valid | unlockm_idle_pending) ;

 // --------------------------------------------------------------------------------
 // Bridge slave side transaction control logic
 // --------------------------------------------------------------------------------

//Address phase control signals: slave side

// transaction request: indicate current bridge is selected for new transaction
  assign trans_req          = HSELS & HTRANSS[1];

//Address phase signals transaction finish on bridge slave side
  assign trans_finish_addr  = trans_req & HREADYS;



 // --------------------------------------------------------------------------------
 // Address and control signal hold flag,  indicate a valid address phase signal is stored in the
 // address and control hold register
 // this flag will only be set when:
 // (1): the bridge slave side has a valid address phase transaction when HCLKEN is not valid
 // or
 // (2): the bridge slave side has a valid address phase transaction when HCLKEN is valid and the master side
 //      needs to insert an unlock IDLE transaction
 // This flag will be cleared when:
 // HCLKEN is valid and the bridge slave side doesn't have a valid address phase transaction while bridge master
 // side permit to change the address and control signals
 // --------------------------------------------------------------------------------
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
        addr_hold_reg <= 1'b0;
    end
    else if (HCLKEN) begin     //only sample master side signal when HCLKEN is valid
      if ((~trans_finish_addr) & (~unlockm_idle_valid)) begin
        addr_hold_reg <= 1'b0;
      end
      else if ((trans_finish_addr) & (unlockm_idle_valid)) begin
        addr_hold_reg <= 1'b1;
      end
    end
    else if (trans_finish_addr) begin
        addr_hold_reg <= 1'b1;
    end
  end

 // --------------------------------------------------------------------------------
 // Indicate the address and control signal on the master side are changeable, so that
 // a new transaction can be present on bridge master side AHB2
 // --------------------------------------------------------------------------------
  assign  addr_m_changeable = (HCLKEN & ((htransm_reg == TRN_IDLE) | (htransm_reg == TRN_BUSY) | hreadyoutm_canc));



 // --------------------------------------------------------------------------------
 // Address and Control holding register
 // --------------------------------------------------------------------------------

  // Holding registers: holding the address phase control signals
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
       hold_haddr_reg     <= {AW{1'b0}};
       hold_htrans_reg    <= TRN_IDLE;
       hold_hsize_reg     <= { HSIZE_W{1'b0}};
       hold_hwrite_reg    <=     1'b0;
       hold_hprot_reg     <= { 4{1'b0}};
       hold_hmaster_reg   <= { MW{1'b0}};
       hold_hmastlock_reg <= 1'b0;
    end
    else if (trans_finish_addr) begin
       hold_haddr_reg     <= HADDRS;
       hold_htrans_reg    <= HTRANSS;
       hold_hsize_reg     <= HSIZES[HSIZE_MAX:0];
       hold_hwrite_reg    <= HWRITES;
       hold_hprot_reg     <= HPROTS;
       hold_hmaster_reg   <= HMASTERS;
       hold_hmastlock_reg <= HMASTLOCKS;
    end
  end




 // --------------------------------------------------------------------------------
 // data holding register
 // --------------------------------------------------------------------------------

  //Control the write data register update. write data register can be updated
  // if current state is in ADDR state and next state will be FSM_WAIT
  //
  assign data_update_write = (reg_fsm_state == FSM_ADDR) & (HCLKEN & hreadyoutm_canc);

  // write data holding register
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn)
      hwdata_reg <= {DW{1'b0}};
    else if (data_update_write )
      hwdata_reg <= HWDATAS;
  end


 // --------------------------------------------------------------------------------
 // Main control FSM:
 // --------------------------------------------------------------------------------

  // Main control FSM: next state generation
  always @ * begin
    case (reg_fsm_state)
      FSM_IDLE:begin
                 nxt_fsm_state = ~trans_finish_addr ? FSM_IDLE   :
                                 unlockm_idle_valid ? FSM_UNLOCK : // unlock idle insertion
                                 (HCLKEN)           ? FSM_ADDR   :
                                                      FSM_SYNC;   //If not in HCLKEN cycle, go to SYNC state directly
               end
      FSM_UNLOCK:begin      //Stay in this state until unlock idle has been inserted
                 nxt_fsm_state = (HCLKEN & hreadyoutm_canc & (~hmastlockm_reg)) ? FSM_ADDR :
                                                                                  FSM_UNLOCK;
               end
      FSM_SYNC:begin
                 nxt_fsm_state = HCLKEN ? FSM_ADDR : //wait for valid HCLKEN
                                          FSM_SYNC;
               end
      FSM_ADDR:begin        //Bridge master side address phase transaction
                 nxt_fsm_state = HCLKEN ? FSM_WAIT :
                                          FSM_ADDR;
               end
      FSM_WAIT:begin       // Bridge master side data phase transaction
                 nxt_fsm_state = ~HCLKEN            ? FSM_WAIT   :
                                 hrespm_canc        ? FSM_ERR1   :
                                 ~hreadyoutm_canc   ? FSM_WAIT   :
                                 ~trans_finish_addr ? FSM_IDLE   :
                                 unlockm_idle_valid ? FSM_UNLOCK :
                                                      FSM_ADDR;
                end
      FSM_ERR1:begin      //1st cycle error response
                 nxt_fsm_state = FSM_ERR2;
               end
      FSM_ERR2:begin      //2nd cycle error response
                 nxt_fsm_state = ~trans_finish_addr  ? FSM_IDLE   :
                                  unlockm_idle_valid ? FSM_UNLOCK :
                                  HCLKEN             ? FSM_ADDR   :
                                                       FSM_SYNC   ;
               end
      default : nxt_fsm_state = 3'bxxx;
    endcase
  end

  // Register state for FSM
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn)
      reg_fsm_state <= FSM_IDLE;
    else
      reg_fsm_state <= nxt_fsm_state;
  end




generate
 // --------------------------------------------------------------------------------
 //Generate: Burst support: BURST == 1
 // --------------------------------------------------------------------------------
 if (BURST == 1) begin:gen_burst_support

//Burst control signals
  wire          busy_override;              // BUSY state insert control
  wire   [2:0]  next_hburstm_reg;
  reg    [2:0]  hburstm_reg;
  reg    [2:0]  hold_hburst_reg;

// Holding registers: holding the address phase control signals
 always @(posedge HCLK or negedge HRESETn) begin
   if (~HRESETn) begin
     hold_hburst_reg    <= {3{1'b0}};
   end
   else if (trans_finish_addr) begin
     hold_hburst_reg    <= HBURSTS;
   end
 end


//Busy override
// busy state need to be inserted during a burst transaction
  assign   busy_override      = ( HSELS & ((HTRANSS== TRN_BUSY) | (HTRANSS== TRN_SEQ))) ;
                                //Busy override only when bridge is selected and bridge slave side
                                //continue a burst transaction


  //transaction type and address generation
  assign   next_htransm_reg    =
                               unlockm_idle_valid ? TRN_IDLE :
                               trans_update       ? (addr_hold_reg ? hold_htrans_reg :HTRANSS) :
                               busy_override      ? TRN_BUSY :
                                                    TRN_IDLE;

  assign   next_haddrm_reg     =
                               trans_update       ? (addr_hold_reg ? hold_haddr_reg : HADDRS) :
                               busy_override      ? HADDRS    :
                                                    haddrm_reg;

//transaction control signal generation
  assign   next_hmastlockm_reg =
                               unlockm_idle_valid ? 1'b0               :
                               ~trans_update      ? hmastlockm_reg     :
                               addr_hold_reg      ? hold_hmastlock_reg :
                                                     HMASTLOCKS;

  assign   next_hburstm_reg    =
                               ~trans_update      ? hburstm_reg     :
                               addr_hold_reg      ? hold_hburst_reg :
                                                     HBURSTS;

 //transaction type assignment
  assign HTRANSM     = htransm_canc;


 // Bridge master side output register Holding registers
  always @(posedge HCLK or negedge HRESETn)  begin
    if (~HRESETn)  begin
      hburstm_reg    <= {3{1'b0}};
    end
    else if (addr_m_changeable) begin
      hburstm_reg    <= next_hburstm_reg;
    end
  end

  assign HBURSTM      = hburstm_reg;

 end
//---------------------------------------------------------------------------------
// Generate: doesn't support burst
//---------------------------------------------------------------------------------
 else  begin: gen_burst_not_support
// Address generation:
   assign      next_haddrm_reg     =
                                     ~trans_update ? haddrm_reg     :
                                     addr_hold_reg ? hold_haddr_reg :
                                                     HADDRS;

// hmastlockm generation
   assign      next_hmastlockm_reg =
                                     unlockm_idle_valid ? 1'b0               :
                                     ~trans_update      ? hmastlockm_reg     :
                                     addr_hold_reg      ? hold_hmastlock_reg :
                                                          HMASTLOCKS;

//transaction type generation
   assign      next_htransm_reg    =
                                     unlockm_idle_valid ? TRN_IDLE :
                                     ~trans_update      ? TRN_IDLE ://default IDLE state
                                     addr_hold_reg      ? {hold_htrans_reg[1],1'b0} :
                                                          {HTRANSS[1],1'b0};//update from the input transaction type


//transaction type assignment
   assign HTRANSM      = htransm_canc; // NSEQ or IDLE only

//Burst type assignment
   assign HBURSTM      = 3'b000;
 end
endgenerate  //BURST configuration stop
//---------------------------------------------------------------------------------
// End Generate:
//---------------------------------------------------------------------------------


//transaction info update
  assign   trans_update     =  (trans_finish_addr | addr_hold_reg);

 // --------------------------------------------------------------------------------
 // Output control signals
 // --------------------------------------------------------------------------------
  // Bridge master side output register Holding registers
  assign   next_hsizem_reg  =  addr_hold_reg     ? hold_hsize_reg      :
                               trans_finish_addr ? HSIZES[HSIZE_MAX:0] :
                                                   hsizem_reg;

  assign   next_hwritem_reg =  addr_hold_reg     ? hold_hwrite_reg :
                               trans_finish_addr ? HWRITES         :
                                                   hwritem_reg;

  assign   next_hprotm_reg  =  addr_hold_reg     ? hold_hprot_reg :
                               trans_finish_addr ? HPROTS         :
                                                   hprotm_reg;

  assign   next_hmasterm_reg=  addr_hold_reg     ? hold_hmaster_reg :
                               trans_finish_addr ? HMASTERS         :
                                                   hmasterm_reg;

 // control signal register for bridge master side
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
      hsizem_reg     <= { HSIZE_W{1'b0}};
      hwritem_reg    <=     1'b0;
      hprotm_reg     <= { 4{1'b0}};
      hmasterm_reg   <= { MW{1'b0}};
      htransm_reg    <= 2'b00;
      haddrm_reg     <= {AW{1'b0}};
    end
    else if (addr_m_changeable) begin
      hsizem_reg     <= next_hsizem_reg ;
      hwritem_reg    <= next_hwritem_reg;
      hprotm_reg     <= next_hprotm_reg ;
      hmasterm_reg   <= next_hmasterm_reg;
      htransm_reg    <= next_htransm_reg;
      haddrm_reg     <= next_haddrm_reg;
    end
  end



  // Master Lock register
   always @(posedge HCLK or negedge HRESETn) begin
     if (~HRESETn) begin
        hmastlockm_reg <= 1'b0;
     end
     else if (addr_m_changeable) begin
        hmastlockm_reg <= next_hmastlockm_reg;
     end
   end


 // --------------------------------------------------------------------------------
 // Output assignment
 // --------------------------------------------------------------------------------

//HREADYOUTS signal generation
  assign  hreadyouts_comb = ~(((reg_fsm_state == FSM_SYNC)  |
                               (reg_fsm_state == FSM_UNLOCK)|
                               (reg_fsm_state == FSM_ADDR)  |
                               (reg_fsm_state == FSM_ERR1))
                               //propagating address to bridge master side
                               | ((reg_fsm_state == FSM_WAIT) & (~(HCLKEN & hreadyoutm_canc))));
                              //wait for bridge master side response


//Bridge slave side response signals.
//Bridge master side signals can go directly to bridge slave side,
//no timing isolation register
  assign HREADYOUTS   = hreadyouts_comb;
  assign HRESPS       = ((reg_fsm_state == FSM_ERR1) | (reg_fsm_state == FSM_ERR2)) ? RESP_ERR : RESP_OKAY;
  assign HRDATAS      = HRDATAM;                 //Read data feedback to master without register

//Bridge master side signals
//Bridge slave side signals are registered to bridge master side,
  assign HADDRM       = haddrm_reg ;
  assign HSIZEM[2]    = (DW > 64) ? hsizem_reg[HSIZE_MAX] : 1'b0;
  assign HSIZEM[1:0]  = hsizem_reg[1:0];
  assign HWRITEM      = hwritem_reg;
  assign HPROTM       = hprotm_reg;
  assign HMASTERM     = hmasterm_reg;
  assign HMASTLOCKM   = hmastlockm_reg;
  assign HWDATAM      = hwdata_reg;


 // --------------------------------------------------------------------------------
 // Error cancellation block
 // --------------------------------------------------------------------------------
 // When the ErrorCanc block recieves an ERROR response from the slave on AHB2
 // it responds with an ERROR to each further transaction in the burst and drives
 // IDLE on HTRANSM until the burst on AHB1 is complete.

generate
 // --------------------------------------------------------------------------------
 // Support burst mode
 // --------------------------------------------------------------------------------
   if (BURST == 1)  begin: gen_with_error_canc
 // Since the bridge assume continues bursts by default then the ErrorCanc block
 // should be placed after it:
 //
 //   AHB1 --> Bridge --> ErrorCanc --> AHB2


//Error cancellation block for burst transaction
    cmsdk_ahb_to_ahb_sync_error_canc
     u_ahb_to_ahb_sync_down_error_canc
     (
      // Inputs
      .HCLK      (HCLK),
      .HCLKEN    (HCLKEN),
      .HRESETn   (HRESETn),
      .HTRANSS   (htransm_reg),
      .HREADYM   (HREADYM),
      .HRESPM    (HRESPM),
    // Outputs
      .HREADYOUTS(hreadyoutm_canc),
      .HRESPS    (hrespm_canc),
      .HTRANSM   (htransm_canc)
     );
   end
 // --------------------------------------------------------------------------------
 // Doesn't support burst mode
 // --------------------------------------------------------------------------------
   else begin: gen_no_error_canc
     assign  hrespm_canc    = HRESPM;
     assign  hreadyoutm_canc= HREADYM;
     assign  htransm_canc   = htransm_reg;
   end
endgenerate  // End of generate

`ifdef ARM_AHB_ASSERT_ON
   // ------------------------------------------------------------
   // Assertions
   // ------------------------------------------------------------
   // These assertions are design specific, so if the design is changed,
   // the assertions may not be appropriate

`include "std_ovl_defines.h"

   //Bridge slave side signals registers
   reg [1:0]     ovl_htranss_d;
   reg [AW-1:0]  ovl_haddrs_d;
   reg [2:0]     ovl_hsizes_d;
   reg [MW-1:0]  ovl_hmasters_d;
   reg           ovl_hmastlocks_d;
   reg [2:0]     ovl_hbursts_d;
   reg [3:0]     ovl_hprots_d;

   //Delay version of control signals: bridge slave side
   always @ (posedge HCLK or negedge HRESETn) begin
     if (~HRESETn) begin
        ovl_htranss_d    <= 2'b00;
        ovl_haddrs_d     <= {AW{1'b0}};
        ovl_hsizes_d     <= 3'b0;
        ovl_hmasters_d   <= {MW{1'b0}};
        ovl_hmastlocks_d <= 1'b0;
        ovl_hbursts_d    <= 3'b000;
        ovl_hprots_d     <= 4'b0000;
     end
     else if (HREADYS) begin
        ovl_htranss_d    <= HTRANSS;
        ovl_haddrs_d     <= HADDRS;
        ovl_hsizes_d     <= HSIZES;
        ovl_hmasters_d   <= HMASTERS;
        ovl_hmastlocks_d <= HMASTLOCKS;
        ovl_hbursts_d    <= HBURSTS;
        ovl_hprots_d     <= HPROTS;
     end
   end

   reg           ovl_reg_s_data_phase;  // bridge slave side data phase
   reg           ovl_reg_m_data_phase;  // bridge master side data phase

   // Bridge master side in data phase transaction
   always @(posedge HCLK or negedge HRESETn) begin
     if (~HRESETn) begin
       ovl_reg_s_data_phase <= 1'b0;
     end
     else if (HREADYOUTS) begin
       ovl_reg_s_data_phase <= HTRANSS[1] & HSELS;
     end
   end

   // Bridge master side in data phase transaction
   always @(posedge HCLK or negedge HRESETn) begin
     if (~HRESETn) begin
       ovl_reg_m_data_phase <= 1'b0;
     end
     else if (hreadyoutm_canc & HCLKEN) begin
       ovl_reg_m_data_phase <= HTRANSM[1];
     end
   end


   // Ensure FSM state must not be 111
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "FSM in illegal state")
    u_ovl_ahb_syncdown_fsm_state_illegal
     (.clk       (HCLK),
      .reset_n   (HRESETn),
      .test_expr ((reg_fsm_state==3'b111))
     );


   //Check FSM never go to xxx state
   assert_never_unknown
    #(`OVL_ERROR, 3, `OVL_ASSERT, "FSM went to X")
    u_ovl_ahb_syncdown_fsm_x (
     .clk       (HCLK),
     .reset_n   (HRESETn),
     .qualifier (1'b1),
     .test_expr (reg_fsm_state )
     );


   // unlock IDLE insertion check
   assert_next
    #(`OVL_ERROR, 1,1,0,
      `OVL_ASSERT,
      "The bridge master side should insert unlock IDLE when unlock signal is valid"
      )
    u_ovl_ahb_syncdown_unlock_idle
    (.clk         ( HCLK ),
     .reset_n     (HRESETn),
     .start_event ( unlockm_idle_valid & HCLKEN ),
     .test_expr   (htransm_reg == TRN_IDLE )
     );

   // IDLE transaction on the bridge master side if bridge is not selected
   assert_next
    #(`OVL_ERROR, 1,1,0,
      `OVL_ASSERT,
      "The bridge master side should have IDLE transaction when bridge is not selected"
      )
    u_ovl_ahb_syncdown_idle_trans
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .start_event     (HREADYS & HCLKEN & (~HSELS)),
     .test_expr       (HTRANSM == TRN_IDLE)
     );


   //Error response propagated to the bridge slave side
   assert_next
    #(`OVL_ERROR, 1,1,0,
      `OVL_ASSERT,
      "Error response should propagate to the bridge slave side"
      )
    u_ovl_ahb_syncdown_err_propagate
    (.clk         (HCLK),
     .reset_n     (HRESETn),
     .start_event ((HRESPM == RESP_ERR) & HCLKEN & (~hreadyoutm_canc)),
     .test_expr   (HRESPS == RESP_ERR)
     );




    //******************************************************************
    // For control signal consistency check
    //******************************************************************

  // When a transaction is on-going on bridge master side, there must be a transaction on bridge slave side
  // except bridge master side has error response
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Bridge slave side transaction should wait for the bridge master side transaction finish")
    u_ovl_ahb_syncdown_status_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_m_data_phase & (HRESPM != RESP_ERR) & HCLKEN),
      .consequent_expr(ovl_reg_s_data_phase)
      );



    // The bridge master side control signal should match the bridge slave side control signal
    // HADDRS
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge master side control signal should match the bridge slave side control signal: HADDRS"
      )
    u_ovl_ahb_syncdown_haddr
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSM[1] & hreadyoutm_canc & HCLKEN),
     .consequent_expr (HADDRM == ovl_haddrs_d)
     );



    // The bridge master side write transaction control signal should match the bridge slave side control signal
    // HSIZES
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge master side control signal should match the bridge slave side control signal: HSIZES"
      )
    u_ovl_ahb_syncdown_hsize
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSM[1] & hreadyoutm_canc & HCLKEN),
     .consequent_expr (HSIZEM == ovl_hsizes_d)
     );


    // The bridge master side control signal should match the bridge slave side control signal
    // HMASTERS
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge master side control signal should match the bridge slave side control signal: HMASTERS"
      )
    u_ovl_ahb_syncdown_hmaster
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSM[1] & hreadyoutm_canc & HCLKEN),
     .consequent_expr (HMASTERM == ovl_hmasters_d)
     );


    // The bridge master side control signal should match the bridge slave side control signal
    // HMASTLOCKS
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge master side control signal should match the bridge slave side control signal: HMASTLOCKS"
      )
    u_ovl_ahb_syncdown_hmastlock
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSM[1] & hreadyoutm_canc & HCLKEN),
     .consequent_expr (HMASTLOCKM == ovl_hmastlocks_d)
     );


    // The bridge master side control signal should match the bridge slave side control signal
    // HPROTS
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge master side control signal should match the bridge slave side control signal: HPROTS"
      )
    u_ovl_ahb_syncdown_hprot
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSM[1] & hreadyoutm_canc & HCLKEN),
     .consequent_expr (HPROTM == ovl_hprots_d)
     );




 generate
   if (BURST == 1) begin: gen_ovl_burst_support  //Support burst transaction

   // The transaction control signals should be released to the bridge master side after HCLKEN is valid if
   // no unlock IDLE insertion
   // HTRANSS
   assert_next
    #(`OVL_ERROR, 1,1,0,
      `OVL_ASSERT,
      "The bridge slave side transaction should release to the bridge master side after HCLKEN is valid"
      )
    u_ovl_ahb_syncdown_read_htrans
    (.clk         ( HCLK ),
     .reset_n     (HRESETn),
     .start_event ( ((reg_fsm_state == FSM_SYNC) | (HTRANSS[1] & HREADYS & HSELS & (~unlockm_idle_valid))) &
                    HCLKEN ),
     .test_expr   (htransm_reg == ovl_htranss_d)
     );


    // The bridge master side control signal should match the bridge slave side control signal
    // HBURSTS
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge master side control signal should match the bridge slave side control signal: HBURSTS"
      )
    u_ovl_ahb_syncdown_hburst
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSM[1] & hreadyoutm_canc & HCLKEN),
     .consequent_expr (HBURSTM == ovl_hbursts_d)
     );

   end
   else begin: gen_ovl_no_burst_support   //Doesn't support burst transaction
   // BUSY and SEQ transaction type never happen
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
        "Illegal transaction type BUSY/SEQ if BURST is not supported ")
   u_ovl_ahb_syncdown_htransm_state_illegal
       (.clk      (HCLK),
        .reset_n  (HRESETn),
        .test_expr( ((HTRANSM == TRN_BUSY) |
                  (HTRANSM == TRN_SEQ)) & HCLKEN)
       );


   // The transaction control signals should be released to the bridge master side after HCLKEN is valid if
   // no unlock IDLE insertion
   // HTRANSS
   assert_next
    #(`OVL_ERROR, 1,1,0,
      `OVL_ASSERT,
      "The bridge slave side transaction should release to the bridge master side after HCLKEN is valid"
      )
    u_ovl_ahb_syncdown_read_htrans
    (.clk         ( HCLK ),
     .reset_n     (HRESETn),
     .start_event ( ((reg_fsm_state == FSM_SYNC) | (HTRANSS[1] & HREADYS & HSELS & (~unlockm_idle_valid))) &
                    HCLKEN ),
     .test_expr   (htransm_reg == {ovl_htranss_d[1],1'b0})
     );



   end
 endgenerate


`endif
endmodule  // End of module


