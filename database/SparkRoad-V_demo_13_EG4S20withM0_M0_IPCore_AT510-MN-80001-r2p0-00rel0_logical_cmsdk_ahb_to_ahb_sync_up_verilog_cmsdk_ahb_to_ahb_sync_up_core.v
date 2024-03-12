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
// Abstract : AHB to AHB sync up bridge without buffered write support
//           Signals from bridge slave side to bridge master side are not registered,
//           (such as HTRANSM, HADDRM etc)
//           Signals from bridge master side to bridge slave side are registered,
//           (such as HRDATAS)
//           This sync up bridge core can be configured to support or not support
//           burst transaction. buffered write is not supported in this bridge core
//           but a seperate write buffer module can be connected to this bridge to
//           support buffered write.
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Functional Overview
//-----------------------------------------------------------------------------
//             +--------------+
//    AHB1 +---+    Bridge    +---+ AHB2
//             | HCLKM/HCLKEN |
//             +--------------+
//   HCLKS                      HCLKM
//
// The Synchronous Step-Up (1:N) Bridge is used to connect AHB buses where the
// target bus (AHB2) is running at a clock frequency which is a multiple of that
// of the originating bus (AHB1). The clock of AHB1 is driven by HCLKS (S for
// slave side) and the clock of AHB2 is HCLKM (M for Master side). The clock
// ratio HCLKS:HCLKM is of the form 1:N where N is an integer.
//
// The bridge is driven by one clock, HCLK, at the higher
// frequency HCLKM. Co-incident rising edges on the two clocks are indicated
// with the HCLKEN input as shown below for a ratio of 1:3.
//          _   _   _   _   _   _   _   _   _   _   _   _   _   _   _
// HCLKM  _| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_| |_
//          _____       _____       _____       _____       _____
// HCLKS  _|     |_____|     |_____|     |_____|     |_____|     |_____
//        ___         ___         ___         ___         ___         _
// HCLKEN    |_______|   |_______|   |_______|   |_______|   |_______|
//
//------------------------------------------------------------------------------


module cmsdk_ahb_to_ahb_sync_up_core #(
// --------------------------------------------------------------------------------
// Parameters
// --------------------------------------------------------------------------------

  parameter       AW    = 32,  //Define the address width of AHB bridge
  parameter       DW    = 32,  //Define the data width of AHB bridge, only support 8/16/32/64 bits
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
 // Internal wires declarations
 // --------------------------------------------------------------------------------

 //Local parameters

   // HTRANSS transaction
  localparam TRN_IDLE   = 2'b00;             // idle transaction
  localparam TRN_BUSY   = 2'b01;             // busy transaction
  localparam TRN_NONSEQ = 2'b10;             // non-sequential transaction
  localparam TRN_SEQ    = 2'b11;             // sequential transaction
   // HSIZES transaction type signal encoding
  localparam  SZ_BYTE   = 3'b000;            //  8 bit transaction
  localparam  SZ_HALF   = 3'b001;            // 16 bit transaction
  localparam  SZ_WORD   = 3'b010;            // 32 bit transaction
  localparam  SZ_DWORD  = 3'b011;            // 64-bit transaction

   // HBURSTS transaction type signal encoding
  localparam BUR_SINGLE = 3'b000;            // single
  localparam BUR_INCR   = 3'b001;            // incrementing
  localparam BUR_WRAP4  = 3'b010;            // 4-beat wrap
  localparam BUR_INCR4  = 3'b011;            // 4-beat incr
  localparam BUR_WRAP8  = 3'b100;            // 8-beat wrap
  localparam BUR_INCR8  = 3'b101;            // 8-beat incr
  localparam BUR_WRAP16 = 3'b110;            // 16-beat wrap
  localparam BUR_INCR16 = 3'b111;            // 16-beat incr
  // HRESPS response
  localparam RESP_OKAY  = 1'b0;              // Response OKAY
  localparam RESP_ERR   = 1'b1;              // Response ERROR

  //Main control FSM local parameters
  localparam FSM_IDLE       = 3'b000;        // Idle state on bridge master side
  localparam FSM_WAIT_WDATA = 3'b001;        // For write transaction to wait the write data be ready
  localparam FSM_UNLOCK     = 3'b010;        // For read transaction to delay the transaction due to lock IDLE insertion
  localparam FSM_BUSY       = 3'b011;        // Wait until the bridge master side ready
  localparam FSM_ERR        = 3'b100;        // Error response from bridge master side
  localparam FSM_SYNC       = 3'b101;        // Wait the HCLKEN signal


 //register for holding the previous address and control signals
  reg [AW-1:0]  hold_haddr_reg;
  reg    [1:0]  hold_htrans_reg;
  reg           hold_hwrite_reg;
  reg    [1:0]  hold_hsize_reg;
  reg    [3:0]  hold_hprot_reg;
  reg [MW-1:0]  hold_hmaster_reg;
  reg           hold_hmastlock_reg;
  reg    [2:0]  hold_hburst_reg;

//Internal signals  for master side interface:
  wire[AW-1:0]  next_haddrm;
  wire          next_hwritem;
  wire   [1:0]  next_hsizem;
  wire   [3:0]  next_hprotm;
  wire[MW-1:0]  next_hmasterm;
  wire          next_hmastlockm;
  wire   [1:0]  next_htransm;                // master side transaction type signal

  wire   [1:0]  htransm_reg = next_htransm;  // In this design, the HTRANSM (and other control/address signals)
                                             // is not registered

// Response signals to AHB master
  wire          next_hresps;                 // next HRESPS signal generation
  reg           hresps_reg;                  // regisiter for HRESPS signal generation
  wire          next_hreadyouts;             // next HREADYOUTS signal generation
  reg           hreadyouts_reg;              // register for HREADYOUTS signal generation
  reg [DW-1:0]  hrdata_reg;                  // Read data register

// main control FSM signals
  reg    [2:0]  reg_fsm_state;
  reg    [2:0]  next_fsm_state;
  wire          trans_update;                // update control signal

//Bridge slave side signals
  wire          trans_req;                   //transaction request detected
  wire          rdtrans_req;                 //Read transaction
  wire          wrtrans_req;                 //write transaction
  wire          trans_finish_addr;           //address phase trans finish
  wire          wrtrans_finish_addr;         //write trans address phase finish
  wire          rdtrans_finish_addr;         //Read trans address phase finish

//Bridge master side signals
  wire          trans_req_m;                 //transaction request detected
  wire          rdtrans_req_m;               //read transaction request detected
  wire          wrtrans_req_m;               //write transaction request detected
  reg           rdtrans_req_m_data;          //read transaction request signal: data phase
  wire          trans_finish_m_addr;         //address phase trans finish
  wire          rdtrans_finish_m_data;       //data phase read trans finish
  wire          wrtrans_finish_m_addr;       //address phase write trans finish


// write data register control signals
  reg  [DW-1:0] hwdata_reg;                 //write data register
  wire          data_update_write;

// Address/Control signal
  reg           addr_hold_reg;              //indicate a valid address phase signal is stored in the hold register



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
  wire     unlockm_idle_valid;    //indicate bridge master side unlock idle transaction is valid


//delay version of HMASTLOCKS, when HSELS is valid.
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
       lock_trans_valid   <= 1'b0;
    end
    else if (HCLKEN) begin
       if (trans_finish_addr & HMASTLOCKS) begin
            //Locked transaction start with valid transaction
          lock_trans_valid   <= 1'b1;
       end
       else if (HREADYS &((HSELS & (~HMASTLOCKS)) | (~HSELS))) begin
            //unlock the transaction if master unlock it or current bridge is not selected any more
          lock_trans_valid   <= 1'b0;
       end
    end
  end

// bridge slave side unlock idle is valid if :
// 1: the bridge is selected and the master unlock the transaction
// 2: the bridge is not selected ( can be burst early termination)
  assign unlocks_idle_valid =  HREADYS & lock_trans_valid & (((~HMASTLOCKS) & HSELS)
                             | (~HSELS));


//an unlock idle transaction is valid and an IDLE transaction need to be inserted
  assign unlockm_idle_valid = (unlocks_idle_valid ) & HCLKEN ;


 // --------------------------------------------------------------------------------
 // Bridge slave side transaction control logic
 // --------------------------------------------------------------------------------

//Address phase control signals: slave side

// transaction request: indicate current bridge is selected for new transaction
  assign trans_req          = HSELS & HTRANSS[1];
  assign rdtrans_req        = trans_req & (~HWRITES );
  assign wrtrans_req        = trans_req & (HWRITES );

//Address phase transaction finish on bridge slave side
  assign trans_finish_addr  = trans_req & HREADYS;

//Address phase read or write transaction finish on bridge slave side
  assign rdtrans_finish_addr = rdtrans_req & HREADYS;
  assign wrtrans_finish_addr = wrtrans_req & HREADYS;



 // --------------------------------------------------------------------------------
 //  Bridge master side transaction control logic
 // --------------------------------------------------------------------------------
//Address phase control signals: bridge master side

// transaction request: indicate current bridge has new transaction
  assign trans_req_m   = htransm_reg[1];
  assign rdtrans_req_m = htransm_reg[1] & (~HWRITEM);
  assign wrtrans_req_m = htransm_reg[1] & HWRITEM;

//Address phase transaction finish on bridge master side
  assign trans_finish_m_addr   = trans_req_m & hreadyoutm_canc;
  assign wrtrans_finish_m_addr = wrtrans_req_m & hreadyoutm_canc;

//Data phase control signals: bridge master side
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
       rdtrans_req_m_data <= 1'b0;
    end
    else if (hreadyoutm_canc)  begin
       rdtrans_req_m_data <= rdtrans_req_m;
    end
  end

// data phase transaction finish: bridge master side
  assign rdtrans_finish_m_data = rdtrans_req_m_data & hreadyoutm_canc;


 // --------------------------------------------------------------------------------
 // Address and control signal hold flag,  indicate a valid address phase signal is stored in the
 // address and control hold register
 // --------------------------------------------------------------------------------
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
        addr_hold_reg <= 1'b0;
    end
    else if (HCLKEN) begin     //only sample bridge slave side signal when HCLKEN is valid
      if ((trans_finish_addr) & (~trans_finish_m_addr)) begin
        addr_hold_reg <= 1'b1; // Bridge slave side finish one transaction while master side doesn't
      end
      else if ((~trans_finish_addr) & (trans_finish_m_addr)) begin
        addr_hold_reg <= 1'b0;  // Bridge master side finish one transaction while slave side doesn't
      end
    end
    else if (trans_finish_m_addr) begin
        addr_hold_reg <= 1'b0;  // Bridge master side finish one transaction while HCLKEN is not valid
    end
  end



 // --------------------------------------------------------------------------------
 // Address and Control holding register
 // --------------------------------------------------------------------------------
 always @(posedge HCLK or negedge HRESETn) begin
   if (~HRESETn) begin
       hold_haddr_reg     <= {AW{1'b0}};
       hold_htrans_reg    <= TRN_IDLE;
       hold_hsize_reg     <= { 2{1'b0}};
       hold_hwrite_reg    <=     1'b0;
       hold_hprot_reg     <= { 4{1'b0}};
       hold_hmaster_reg   <= { MW{1'b0}};
       hold_hburst_reg    <= BUR_SINGLE;
       hold_hmastlock_reg <= 1'b0;
   end
   else if (trans_finish_addr & HCLKEN) begin
       hold_haddr_reg     <= HADDRS;
       hold_htrans_reg    <= HTRANSS;
       hold_hsize_reg     <= HSIZES[1:0];
       hold_hwrite_reg    <= HWRITES;
       hold_hprot_reg     <= HPROTS;
       hold_hmaster_reg   <= HMASTERS;
       hold_hburst_reg    <= HBURSTS;
       hold_hmastlock_reg <= HMASTLOCKS;
    end
  end




 // --------------------------------------------------------------------------------
 // data holding register
 // --------------------------------------------------------------------------------

  //Control the write data register update.
  // write data register update will only depends on the bridge master side transaction
  // the write data register will be update once the bridge master side finish address phase
  // write transaction

  assign data_update_write = (HCLKEN & wrtrans_finish_m_addr);

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
  always @* begin
    case (reg_fsm_state)
      FSM_IDLE:begin
                    next_fsm_state = ~ HCLKEN ? FSM_IDLE       ://Only sample the AHB1 side signal when HCLKEN is valid
                          wrtrans_finish_addr ? FSM_WAIT_WDATA :// write tranaction
                          ~rdtrans_finish_addr? FSM_IDLE       :// no transaction
                          unlockm_idle_valid  ? FSM_UNLOCK     :// read transaction, unlock
                                                FSM_BUSY;       // read transaction
               end
      FSM_UNLOCK:begin    // Read transaction unlock IDLE insertion, delay the read transaction
                          // to bridge master side one cycle, for write transaction, no extra
                          // delay, unlock IDLE will be inserted during FSM_WAIT_WDATA state
                     next_fsm_state = FSM_BUSY;
               end
      FSM_WAIT_WDATA:begin
                     next_fsm_state = HCLKEN ? FSM_BUSY : // wait until HCLKEN is valid ensure HWDATAS is available.
                                               FSM_WAIT_WDATA;

               end
      FSM_BUSY:begin      // write or read data phase transaction
                     next_fsm_state = hrespm_canc      ?  FSM_ERR  : //Error response from slave
                                      ~hreadyoutm_canc ?  FSM_BUSY : //stay in this state if slave is not ready
                                      //Data phase finish
                                      HCLKEN           ?  FSM_IDLE : //Wait for new transaction
                                                          FSM_SYNC;  //Wait for HCLKEN to be valid
               end
      FSM_SYNC:begin //only used to synchronous the clock edge, wait HCLKEN to be valid
                     next_fsm_state = HCLKEN ? FSM_IDLE : FSM_SYNC;
               end
      FSM_ERR:begin //Error response from slave received
                     next_fsm_state = ~HCLKEN ? FSM_ERR  ://This state will only change when HCLKEN is valid
                         (HRESPS == RESP_ERR) ? FSM_IDLE ://Error repnose has been propogated to bridge slave side (2nd cycle)
                                                FSM_ERR;  // Wait untill the error response propogate to bridge slave side

               end
      default : next_fsm_state = 3'bxxx;
    endcase
  end

  // Register state for FSM
  always @(posedge HCLK or negedge HRESETn) begin
    if (~HRESETn)
      reg_fsm_state <= FSM_IDLE;
    else
      reg_fsm_state <= next_fsm_state;
  end




generate
 // --------------------------------------------------------------------------------
 //Generate: Burst support: BURST == 1
 // --------------------------------------------------------------------------------
 if (BURST == 1) begin: gen_burst_support_addr


 //Burst control signals
  reg [3:0]     next_burst_beat;        // next burst counter
  reg [3:0]     burst_beat;             // burst counter register
  wire          busy_override;          // BUSY state insert control

  wire   [2:0]  next_hburstm;

//----------------------------------------------------------------------------
// Address Generation
//----------------------------------------------------------------------------
// The next transaction address is generated for BUSY state insertion.
// offset_addr indicates the address bits to be monitored when detecting a
// wrapping address. Depends upon the size of the transaction.

// Address Generation Signals
  reg  [6:0]    wrap_mask;              // WrapMask
  reg  [3:0]    add_value;              // Add Value
  wire [31:0]   calc_addr;              // Calculate address
  wire          wrapped;                // Wrapped signal
  reg  [3:0]    offset_addr;            // Offset Address
  reg  [3:0]    check_addr;             // Check current Address
  wire          addr_at_boundary;       // address is at 1kB boundary
  wire [10:0]   incr_addr;              // used to store the added address

  // Lower bits of calc_addr, this then drives the calc_addr wire bus.
  reg  [9:0]    next_calc_addr1k;       // Lower 10 bits address calculation
  reg  [9:0]    calc_addr1k_reg;        // lower 10 bits address register

  always @ (*) begin : p_offset_addrcomb
    case (HSIZEM)
      SZ_BYTE : offset_addr = HADDRM [3:0];
      SZ_HALF : offset_addr = HADDRM [4:1];
      SZ_WORD : offset_addr = HADDRM [5:2];
      SZ_DWORD: offset_addr = HADDRM [6:3];
      default : offset_addr = {4{1'b0}};
    endcase
  end // block: p_offset_addrcomb

  // check_addr indicates when the address will wrap, depending on burst type
  always @ (*) begin : p_check_addrcomb
    case (HBURSTM)

      BUR_WRAP4 : begin
        check_addr [1:0] = offset_addr [1:0];
        check_addr [3:2] = 2'b11;
      end

      BUR_WRAP8 : begin
        check_addr [2:0] = offset_addr [2:0];
        check_addr [3] = 1'b1;
      end

      BUR_WRAP16 :
        check_addr [3:0] = offset_addr [3:0];

      BUR_SINGLE, BUR_INCR, BUR_INCR4, BUR_INCR8, BUR_INCR16 :
          check_addr [3:0] = {4{1'b0}};

      default:
          check_addr [3:0] = {4{1'bx}};

    endcase // case(HBURSTM)

  end // block: p_check_addrcomb



  // The address of the next transaction should wrap on the next transaction if the
  // boundary is reached.
  assign wrapped = (check_addr == {4{1'b1}}) ? 1'b1 : 1'b0;


  // add_value is the value which should be added to the address for each
  // transaction, depending on the data size.
  always @ (*) begin : p_add_valuecomb
    case (HSIZEM)
      SZ_BYTE : add_value = 4'b0001;
      SZ_HALF : add_value = 4'b0010;
      SZ_WORD : add_value = 4'b0100;
      SZ_DWORD: add_value = 4'b1000;
      default : add_value = 4'b0000;
    endcase
  end // block: p_add_valuecomb

  // wrap_mask is applied to the address to make it wrap, when the wrapped
  // signal is high.
  always @ (*) begin : p_wrap_maskcomb
    case (HBURSTM)
      BUR_WRAP4 :
        case (HSIZEM)
          SZ_BYTE : wrap_mask = 7'b1111100;
          SZ_HALF : wrap_mask = 7'b1111000;
          SZ_WORD : wrap_mask = 7'b1110000;
          SZ_DWORD: wrap_mask = 7'b1100000;
          default : wrap_mask = 7'b0000000;
        endcase

      BUR_WRAP8 :
        case (HSIZEM)
          SZ_BYTE : wrap_mask = 7'b1111000;
          SZ_HALF : wrap_mask = 7'b1110000;
          SZ_WORD : wrap_mask = 7'b1100000;
          SZ_DWORD: wrap_mask = 7'b1000000;
          default : wrap_mask = 7'b0000000;
        endcase

      BUR_WRAP16 :
        case (HSIZEM)
          SZ_BYTE : wrap_mask = 7'b1110000;
          SZ_HALF : wrap_mask = 7'b1100000;
          SZ_WORD : wrap_mask = 7'b1000000;
          SZ_DWORD: wrap_mask = 7'b0000000;
          default : wrap_mask = 7'b0000000;
        endcase

      BUR_SINGLE ,BUR_INCR ,BUR_INCR4 ,BUR_INCR8 ,BUR_INCR16 :
        wrap_mask = 7'b0000000;

      default :
        wrap_mask = 7'bxxxxxxx;

    endcase // case(HBURSTM)

  end // block: p_wrap_maskcomb


  // Calculate new address value Bits 31 down to 10 are unchanged due to 1kb
  // burst boundary only bits 9 down to 0 should change.
  assign calc_addr [31:10] = hold_haddr_reg  [31:10];

  // Need to assign lower bits from reg type which is driven from
  // the always block below.
  assign calc_addr [9:0] = calc_addr1k_reg [9:0];
  assign incr_addr[10:0] = (HADDRM [9:0] + { {6{1'b0}}, add_value } );

  // Calculate new address value
  always @ * begin : p_calc_addrcomb
     if (htransm_reg[1] & hreadyoutm_canc) begin     // valid transaction completed
        if (wrapped)  begin  // new address should wrap
            next_calc_addr1k [9:7] = HADDRM [9:7];
            next_calc_addr1k [6:0] = (HADDRM [6:0] & wrap_mask);
        end
        else begin
            next_calc_addr1k [9:0] = incr_addr[9:0];
        end
     end
     else  // address should not change
          next_calc_addr1k [9:0] = HADDRM [9:0];
  end // block: p_calc_addrcomb

  // Register the lower 10bits address
  always @ (posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
        calc_addr1k_reg <= {10{1'b0}};
    end
    else begin
        calc_addr1k_reg <= next_calc_addr1k;
    end
  end

  // Detect when a burst reaches the 1kB boundary as there will be no more
  // transaction. Used to detect end of an INCR burst.
  assign addr_at_boundary = (
        ((HADDRM[9:0] == {10{1'b1}}) |
        ((HADDRM[9:1] ==  {9{1'b1}}) & (HSIZEM == SZ_HALF)) |
        ((HADDRM[9:2] ==  {8{1'b1}}) & (HSIZEM == SZ_WORD)) |
        ((HADDRM[9:3] ==  {7{1'b1}}) & (HSIZEM == SZ_DWORD)))) ;

//----------------------------------------------------------------------------
// Track Fixed Length Bursts
//----------------------------------------------------------------------------
// Bursts are tracked with the burst_beat counter. This is used to determine
// when to insert idle transaction instead of busy during a read or write burst.
// next_burst_beat is set at the beginning of a burst and is decremented for
// each SEQ transaction in the burst. For INCR bursts, burst_beat stays at 1.
// For SINGLEs or IDLE transaction, burst_beat is 0.

  always @ (*)  begin
      case (htransm_reg) //Here it must use the htransm before the error cancelation block override it

        TRN_IDLE : next_burst_beat = 4'b0000;

        TRN_BUSY : next_burst_beat = burst_beat;

        TRN_NONSEQ :  //Burst start, load new counter value
          case (HBURSTM)
            BUR_SINGLE             : next_burst_beat = 4'b0000;
            BUR_INCR4,  BUR_WRAP4  : next_burst_beat = 4'b0011;
            BUR_INCR8,  BUR_WRAP8  : next_burst_beat = 4'b0111;
            BUR_INCR16, BUR_WRAP16 : next_burst_beat = 4'b1111;
            BUR_INCR               :
                                     // address is at 1kB boundary so no more burst transaction
                                     next_burst_beat = addr_at_boundary ? 4'b0000 : 4'b0001;

            default                : next_burst_beat = 4'bxxxx;
          endcase // case(HBURSTM)


        TRN_SEQ :
          if (hreadyoutm_canc) // previous transaction complete
             if (HBURSTM != BUR_INCR)      // fixed length burst
                next_burst_beat = (burst_beat - 4'b0001);
             else                            // INCR burst
                // address is at 1kB boundary so no more burst transaction
                next_burst_beat = addr_at_boundary ? 4'b0000 : burst_beat;
          else
            next_burst_beat = burst_beat;

        default: next_burst_beat = 4'bxxxx;

      endcase // case(htransm_reg)
    end

  // burst_beat Register
  always @ (posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
        burst_beat <= 4'b0000;
    end
   else begin
        burst_beat <= next_burst_beat;
    end
  end


 //Busy override, insert busy state for burst transaction
   assign    busy_override = ( HCLKEN & ((~HSELS) | (HTRANSS == TRN_IDLE)| (HTRANSS == TRN_NONSEQ)))? 1'b0 :
                             //If bridge is not selected any more or bridge slave side burst has been terminated
                             ((|burst_beat) == 1'b1) ;    // in the burst beat state


 //transaction type and address generation
   assign    next_htransm =
                            unlockm_idle_valid ?  TRN_IDLE : //Unlock IDLE insertion
                            trans_update       ? (addr_hold_reg ? hold_htrans_reg :HTRANSS) :
                                                             //new valid transaction
                            busy_override      ?  TRN_BUSY : //BUSY insertion
                                                  TRN_IDLE;

   assign    next_haddrm  =
                            trans_update       ? (addr_hold_reg ? hold_haddr_reg : HADDRS ) :
                            busy_override      ?  calc_addr     :
                                                  hold_haddr_reg;

 //transaction control signal generation
   assign    next_hburstm =
                            trans_update       ? (addr_hold_reg ? hold_hburst_reg : HBURSTS) :
                                                 hold_hburst_reg;

 //transaction type assignment
   assign    HTRANSM      = htransm_canc;

 // Bridge master side output register Holding registers
   assign    HBURSTM      = next_hburstm;

 end
//---------------------------------------------------------------------------------
// Generate: doesn't support burst
//---------------------------------------------------------------------------------
 else  begin : gen_no_burst_support
// Address generation:
   assign     next_haddrm = trans_update ? (addr_hold_reg ? hold_haddr_reg : HADDRS) :
                                            hold_haddr_reg ;

//transaction type generation
   assign    next_htransm = unlockm_idle_valid ? TRN_IDLE : //Unlock IDLE insertion
                            trans_update       ? (addr_hold_reg ? ({hold_htrans_reg[1],1'b0}) :({HTRANSS[1],1'b0})) :
                                                            //new valid transaction
                                                  TRN_IDLE;


  //transaction type assignment
   assign     HTRANSM     = htransm_canc; // NSEQ or IDLE only

  //Burst type assignment
   assign     HBURSTM     = 3'b000;

 end  // BURST not support

endgenerate  //BURST configuration stop
//---------------------------------------------------------------------------------
// End Generate:
//---------------------------------------------------------------------------------


//transaction info update
assign   trans_update =
                       // for unlock idle inserstion state
                       (reg_fsm_state == FSM_UNLOCK) |
                       // for read transaction when bridge master is IDLE
                       (rdtrans_finish_addr & HCLKEN & (reg_fsm_state == FSM_IDLE )) |
                       // for write transaction
                       (HCLKEN & (reg_fsm_state == FSM_WAIT_WDATA));

 // --------------------------------------------------------------------------------
 // Output control signals
 // --------------------------------------------------------------------------------
  // Bridge master side output register Holding registers
 assign   next_hsizem    = ~trans_update ? hold_hsize_reg  :
                           addr_hold_reg ? hold_hsize_reg  :
                                           HSIZES[1:0] ;
 assign   next_hwritem   = ~trans_update ? hold_hwrite_reg :
                           addr_hold_reg ? hold_hwrite_reg :
                                           HWRITES;
 assign   next_hprotm    = ~trans_update ? hold_hprot_reg  :
                           addr_hold_reg ? hold_hprot_reg  :
                                           HPROTS;
 assign   next_hmasterm  = ~trans_update ? hold_hmaster_reg:
                           addr_hold_reg ? hold_hmaster_reg:
                                           HMASTERS;
 assign   next_hmastlockm= unlockm_idle_valid ? 1'b0               :
                           ~trans_update      ? hold_hmastlock_reg :
                           addr_hold_reg      ? hold_hmastlock_reg :
                                                HMASTLOCKS ;
 // --------------------------------------------------------------------------------
 // Output assign
 // --------------------------------------------------------------------------------

//HREADYOUTS signal generation
  assign  next_hreadyouts = (HCLKEN == 1'b0) ? hreadyouts_reg :    //Keep previous state if HCLKEN is not valid
                            ((next_fsm_state == FSM_BUSY)       |  //For read or write
                             (next_fsm_state == FSM_UNLOCK)     |  //For read only
                             (next_fsm_state == FSM_WAIT_WDATA) |  // for write only
                             ((next_fsm_state == FSM_ERR) & (HRESPS == RESP_OKAY))// for read or write error state
                            )                ? 1'b0           :
                                               1'b1;               //FSM_SYNC state or IDLE state

// HREADYOUTS register
  always @ (posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
       hreadyouts_reg        <= 1'b1;
    end
    else if (HCLKEN) begin
       hreadyouts_reg        <= next_hreadyouts;
    end
  end


// HRESPS generation
  assign  next_hresps = (reg_fsm_state == FSM_ERR)? RESP_ERR : RESP_OKAY;

  always @ (posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
       hresps_reg    <= RESP_OKAY;
    end
    else if (HCLKEN) begin
       hresps_reg    <= next_hresps;
    end
  end

//HRDATA generation
  always @ (posedge HCLK or negedge HRESETn) begin
    if (~HRESETn) begin
       hrdata_reg <= {DW{1'b0}};
    end
    else if (rdtrans_finish_m_data) begin
       hrdata_reg <= HRDATAM;
    end
  end


//Bridge slave side response signals.
  assign HREADYOUTS   = hreadyouts_reg;
  assign HRESPS       = hresps_reg;
  assign HRDATAS      = hrdata_reg;         //Read data feedback to master without register

//Bridge master side signals
  assign HADDRM       = next_haddrm ;
  assign HSIZEM       = {1'b0, next_hsizem[1:0]};
  assign HWRITEM      = next_hwritem;
  assign HPROTM       = next_hprotm;
  assign HMASTERM     = next_hmasterm;
  assign HMASTLOCKM   = next_hmastlockm;
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
  if (BURST == 1) begin: gen_with_error_canc
 // Since the bridge assume continues bursts by default then the ErrorCanc block
 // should be placed after it:
 //
 //   AHB1 --> Bridge --> ErrorCanc --> AHB2

 //Error cancellation block for burst transaction
   cmsdk_ahb_to_ahb_sync_error_canc
     u_ahb_to_ahb_sync_up_error_canc
     (
      // Inputs
      .HCLK      (HCLK),
      .HCLKEN    (1'b1),
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
`include "std_ovl_defines.h"
   // ------------------------------------------------------------
   // Assertions
   // ------------------------------------------------------------
   // These assertions are design specific, so if the design is changed,
   // the assertions may not be appropriate

   //Bridge slave side signals registers
   reg [1:0]     ovl_htranss_d;
   reg [AW-1:0]  ovl_haddrs_d;
   reg [2:0]     ovl_hsizes_d;
   reg [MW-1:0]  ovl_hmasters_d;
   reg           ovl_hmastlocks_d;
   reg [2:0]     ovl_hbursts_d;
   reg [3:0]     ovl_hprots_d;
   reg           ovl_hwrites_d;
   reg           ovl_hreadys_d;
   reg           ovl_hsels_d;

   //Delay version of control signals
   always @ (posedge HCLK or negedge HRESETn) begin
     if (~HRESETn) begin
        ovl_htranss_d    <= 2'b00;
        ovl_haddrs_d     <= {AW{1'b0}};
        ovl_hsizes_d     <= 3'b0;
        ovl_hmasters_d   <= {MW{1'b0}};
        ovl_hmastlocks_d <= 1'b0;
        ovl_hbursts_d    <= 3'b000;
        ovl_hprots_d     <= 4'b0000;
        ovl_hwrites_d    <= 1'b0;
        ovl_hreadys_d    <= 1'b1;
        ovl_hsels_d      <= 1'b0;
     end
     else if (HCLKEN) begin
        ovl_htranss_d    <= HTRANSS;
        ovl_haddrs_d     <= HADDRS;
        ovl_hsizes_d     <= HSIZES;
        ovl_hmasters_d   <= HMASTERS;
        ovl_hmastlocks_d <= HMASTLOCKS;
        ovl_hbursts_d    <= HBURSTS;
        ovl_hprots_d     <= HPROTS;
        ovl_hwrites_d    <= HWRITES;
        ovl_hreadys_d    <= HREADYS;
        ovl_hsels_d      <= HSELS;
     end
   end

   //OVL Error response flag:indicate bridge master side has error response
   reg           ovl_err_flag;
   reg           ovl_reg_s_data_phase;  // bridge slave side data phase
   reg           ovl_reg_m_data_phase;  // bridge master side data phase

   always @ (posedge HCLK or negedge HRESETn) begin
     if (~HRESETn) begin
        ovl_err_flag <= 1'b0;
     end
     else if ((HRESPM == RESP_ERR) & ovl_reg_m_data_phase) begin
        ovl_err_flag <= 1'b1;
     end
     else if (HCLKEN) begin
        ovl_err_flag <= 1'b0;
     end
   end


   // Bridge master side in data phase transaction
   always @(posedge HCLK or negedge HRESETn) begin
     if (~HRESETn) begin
       ovl_reg_s_data_phase <= 1'b0;
     end
     else if (HREADYOUTS & HCLKEN) begin
       ovl_reg_s_data_phase <= HTRANSS[1] & HSELS;
     end
   end

   // Bridge master side in data phase transaction
   always @(posedge HCLK or negedge HRESETn) begin
     if (~HRESETn) begin
       ovl_reg_m_data_phase <= 1'b0;
     end
     else if (HREADYM) begin
       ovl_reg_m_data_phase <= HTRANSM[1];
     end
   end


   // Ensure FSM state must not be 111 or 110
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "FSM in illegal state")
   u_ovl_ahb_syncup_fsm_state_illegal
     (.clk(HCLK), .reset_n(HRESETn),
      .test_expr((reg_fsm_state==3'b111) | (reg_fsm_state==3'b110))
      );

    //Check FSM never go to xxx state
    assert_never_unknown
    #(`OVL_ERROR, 3, `OVL_ASSERT, "FSM went to X")
    u_ovl_ahb_syncup_fsm_x (
    .clk       (HCLK),
    .reset_n   (HRESETn),
    .qualifier (1'b1),
    .test_expr (reg_fsm_state )
     );

   // unlock IDLE insertion check
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge master side should insert unlock IDLE when unlock signal is valid"
      )
    u_ovl_ahb_syncup_unlock_idle
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr ( HCLKEN & unlockm_idle_valid),
     .consequent_expr (HTRANSM == TRN_IDLE)
     );

   // IDLE transaction on the bridge master side if bridge is not selected
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge master side should have IDLE transaction when bridge is not selected"
      )
    u_ovl_ahb_syncup_idle_trans
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HREADYS & HCLKEN & (~HSELS)),
     .consequent_expr (HTRANSM == TRN_IDLE)
     );


   //Error response propogated to the bridge slave side
   assert_next
    #(`OVL_ERROR, 1,1,0,
      `OVL_ASSERT,
      "Error response should propogate to the bridge slave side"
      )
    u_ovl_ahb_syncup_err_propogate
    (.clk         ( HCLK ),
     .reset_n     (HRESETn),
     .start_event ( ovl_err_flag & HCLKEN),
     .test_expr   (HRESPS == RESP_ERR)
     );


   // When a transaction is on-going on bridge master side, there must be a transaction on bridge slave side
   assert_implication
     #(`OVL_ERROR,`OVL_ASSERT,
       "Bridge slave side transaction should wait for the bridge master side transaction finish")
   u_ovl_ahb_syncup_status_mismatch
     (.clk(HCLK), .reset_n(HRESETn),
      .antecedent_expr(ovl_reg_m_data_phase),
      .consequent_expr(ovl_reg_s_data_phase)
      );




    //******************************************************************
    // For read transaction
    //******************************************************************


    // The bridge slave side read transaction control signal release to the bridge master side at the same HCLKEN cycle
    // HADDRS
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge slave side write transaction control signal should release to the bridge master side at the next HCLKEN cycle: HADDRS"
      )
    u_ovl_ahb_syncup_read_haddr
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSS[1] & (~HWRITES) &
                        HREADYS & HSELS & HCLKEN ),
     .consequent_expr (HADDRM == HADDRS)
     );

    // The bridge slave side read transaction control signal release to the bridge master side at the same HCLKEN cycle
    // HSIZES
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge slave side write transaction control signal should release to the bridge master side at the next HCLKEN cycle: HSIZES"
      )
    u_ovl_ahb_syncup_read_hsize
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSS[1] & (~HWRITES) &
                        HREADYS & HSELS & HCLKEN ),
     .consequent_expr (HSIZEM[1:0] == HSIZES[1:0])
     );

    // The bridge slave side read transaction control signal release to the bridge master side at the same HCLKEN cycle
    // HMASTERS
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge slave side write transaction control signal should release to the bridge master side at the next HCLKEN cycle: HMASTERS"
      )
    u_ovl_ahb_syncup_read_hmaster
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSS[1] & (~HWRITES) &
                        HREADYS & HSELS & HCLKEN ),
     .consequent_expr (HMASTERM == HMASTERS)
     );


    // The bridge slave side read transaction control signal release to the bridge master side at the same HCLKEN cycle
    // HMASTLOCK
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge slave side write transaction control signal should release to the bridge master side at the next HCLKEN cycle: HMASTLOCKS"
      )
    u_ovl_ahb_syncup_read_hmastlock
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSS[1] & (~HWRITES) &
                        HREADYS & HSELS & HCLKEN ),
     .consequent_expr (HMASTLOCKM == HMASTLOCKS)
     );




    // The bridge slave side read transaction control signal release to the bridge master side at the same HCLKEN cycle
    // HPROTS
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge slave side write transaction control signal should release to the bridge master side at the next HCLKEN cycle: HPROTS"
      )
    u_ovl_ahb_syncup_read_hprot
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSS[1] & (~HWRITES) &
                        HREADYS & HSELS & HCLKEN ),
     .consequent_expr (HPROTM == HPROTS)
     );


    //******************************************************************
    // For write transaction
    //******************************************************************


    // The bridge master side write transaction control signal should match the bridge slave side control signal
    // HADDRS
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge master side write transaction control signal should match the bridge slave side control signal: HADDRS"
      )
    u_ovl_ahb_syncup_nonbuf_write_haddr
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSM[1] & hreadyoutm_canc & HWRITEM),
     .consequent_expr (HADDRM == ovl_haddrs_d)
     );



    // The bridge master side write transaction control signal should match the bridge slave side control signal
    // HSIZES
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge master side write transaction control signal should match the bridge slave side control signal: HSIZES"
      )
    u_ovl_ahb_syncup_nonbuf_write_hsize
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSM[1] & hreadyoutm_canc & HWRITEM),
     .consequent_expr (HSIZEM[1:0] == ovl_hsizes_d[1:0])
     );


    // The bridge master side write transaction control signal should match the bridge slave side control signal
    // HMASTERS
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge master side write transaction control signal should match the bridge slave side control signal: HMASTERS"
      )
    u_ovl_ahb_syncup_nonbuf_write_hmaster
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSM[1] & hreadyoutm_canc & HWRITEM),
     .consequent_expr (HMASTERM == ovl_hmasters_d)
     );


    // The bridge master side write transaction control signal should match the bridge slave side control signal
    // HMASTLOCKS
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge master side write transaction control signal should match the bridge slave side control signal: HMASTLOCKS"
      )
    u_ovl_ahb_syncup_nonbuf_write_hmastlock
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSM[1] & hreadyoutm_canc & HWRITEM),
     .consequent_expr (HMASTLOCKM == ovl_hmastlocks_d)
     );


    // The bridge master side write transaction control signal should match the bridge slave side control signal
    // HPROTS
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge master side write transaction control signal should match the bridge slave side control signal: HPROTS"
      )
    u_ovl_ahb_syncup_nonbuf_write_hprot
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSM[1] & hreadyoutm_canc & HWRITEM),
     .consequent_expr (HPROTM == ovl_hprots_d)
     );




  generate
   if (BURST == 1) begin: gen_ovl_burst_support  //Support burst transaction

   // If burst is supported, the bridge master side will override current burst BUSY/SEQ transaction with IDLE
   // if error response is received
   assert_next
    #(`OVL_ERROR, 1,1,0,
      `OVL_ASSERT,
      "In burst transaction, when the bridge receive error response, it should override current BUSY/SEQ transaction with IDLE"
      )
    u_ovl_ahb_syncup_err_burstm_terminate
    (.clk         ( HCLK ),
     .reset_n     (HRESETn),
     .start_event ((HRESPM == RESP_ERR) & (~HREADYM) &
                   (HBURSTM != BUR_SINGLE) & ((HTRANSM == TRN_SEQ)| (HTRANSM == TRN_BUSY))
                   ),
     .test_expr   (HTRANSM == TRN_IDLE
                   )
     );

    // The bridge slave side read transaction release to the bridge master side at the same HCLKEN cycle if
    // no unlock IDLE insertion
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge slave side read transaction should release to the bridge master side at the same HCLKEN cycle: no unlock IDLE insertion"
      )
    u_ovl_ahb_syncup_read_htrans1
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSS[1]  & (~HWRITES) &
                        HREADYS & HSELS & HCLKEN & (~unlocks_idle_valid)),
     .consequent_expr (htransm_reg == HTRANSS)
     );


    // The bridge slave side read transaction release to the bridge master side at next HCLK cycle after HCLKEN if
    // has unlock IDLE insertion
   assert_next
    #(`OVL_ERROR, 1,1,0,
      `OVL_ASSERT,
      "The bridge slave side read transaction should release to the bridge master side at the next HCLK cycle after HCLKEN: has unlock IDLE insertion"
      )
    u_ovl_ahb_syncup_read_htrans2
    (.clk         ( HCLK ),
     .reset_n     (HRESETn),
     .start_event (HTRANSS[1] & (~HWRITES) &
                     HREADYS & HSELS & HCLKEN & unlocks_idle_valid),
     .test_expr   (htransm_reg == ovl_htranss_d )
     );


   // The bridge slave side write transaction release to the bridge master side at the next HCLKEN cycle
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge slave side write transaction should release to the bridge master side at the next HCLKEN cycle"
      )
    u_ovl_ahb_syncup_nonbuf_write_htrans1
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (ovl_htranss_d[1] & ovl_hwrites_d &
                        ovl_hreadys_d & ovl_hsels_d & HCLKEN ),
     .consequent_expr (htransm_reg == ovl_htranss_d)
     );


    // The bridge master side write transaction control signal should match the bridge slave side control signal
    // HBURSTS
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge master side write transaction control signal should match the bridge slave side control signal: HBURSTS"
      )
    u_ovl_ahb_syncup_nonbuf_write_hburst
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSM[1] & hreadyoutm_canc & HWRITEM),
     .consequent_expr (HBURSTM == ovl_hbursts_d)
     );

    // The bridge slave side read transaction control signal release to the bridge master side at the same HCLKEN cycle
    // HBURSTS
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge slave side write transaction control signal should release to the bridge master side at the next HCLKEN cycle: HBURSTS"
      )
    u_ovl_ahb_syncup_read_hburst
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSS[1] & (~HWRITES) &
                        HREADYS & HSELS & HCLKEN ),
     .consequent_expr (HBURSTM == HBURSTS)
     );



   end
   else begin: gen_ovl_no_burst_support   //Doesn't support burst transaction
   // BUSY and SEQ transaction type never happen
   assert_never
     #(`OVL_ERROR,`OVL_ASSERT,
       "Illegal transaction type BUSY/SEQ if BURST is not supported ")
   u_ovl_ahb_syncup_htransm_state_illegal
     (.clk      (HCLK),
      .reset_n  (HRESETn),
      .test_expr( (HTRANSM == TRN_BUSY) |
                  (HTRANSM == TRN_SEQ)
                )
      );


    // The bridge slave side read transaction release to the bridge master side at the same HCLKEN cycle if
    // no unlock IDLE insertion
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge slave side read transaction should release to the bridge master side at the same HCLKEN cycle: no unlock IDLE insertion"
      )
    u_ovl_ahb_syncup_read_htrans1
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (HTRANSS[1]  & (~HWRITES) &
                        HREADYS & HSELS & HCLKEN & (~unlocks_idle_valid)),
     .consequent_expr (htransm_reg == {HTRANSS[1],1'b0})
     );


    // The bridge slave side read transaction release to the bridge master side at next HCLK cycle after HCLKEN if
    // has unlock IDLE insertion
   assert_next
    #(`OVL_ERROR, 1,1,0,
      `OVL_ASSERT,
      "The bridge slave side read transaction should release to the bridge master side at the next HCLK cycle after HCLKEN: has unlock IDLE insertion"
      )
    u_ovl_ahb_syncup_read_htrans2
    (.clk         ( HCLK ),
     .reset_n     (HRESETn),
     .start_event (HTRANSS[1] & (~HWRITES) &
                     HREADYS & HSELS & HCLKEN & unlocks_idle_valid),
     .test_expr   (htransm_reg == {ovl_htranss_d[1],1'b0} )
     );



  // The bridge slave side write transaction release to the bridge master side at the next HCLKEN cycle
   assert_implication
    #(`OVL_ERROR,
      `OVL_ASSERT,
      "The bridge slave side write transaction should release to the bridge master side at the next HCLKEN cycle"
      )
    u_ovl_ahb_syncup_nonbuf_write_htrans1
    (.clk             (HCLK),
     .reset_n         (HRESETn),
     .antecedent_expr (ovl_htranss_d[1] & ovl_hwrites_d &
                        ovl_hreadys_d & ovl_hsels_d & HCLKEN ),
     .consequent_expr (htransm_reg == {ovl_htranss_d[1],1'b0})
     );



   end
   endgenerate

`endif
endmodule  // End of module



