//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2001-2013-<<copyright_year>> ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2012-10-15 18:01:36 +0100 (Mon, 15 Oct 2012) $
//
//      Revision            : $Revision: 225465 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
//
//------------------------------------------------------------------------------
//  Abstract            : The Input Stage is used to hold a pending transfer
//                        when the required output stage is not available.
//---------------------------- << start unalign >> -----------------------------
//                        Supports ARMv6 AMBA extensions for unaligned access.
//----------------------------- << end unalign >> ------------------------------
//----------------------------- << start excl >> -------------------------------
//                        Supports ARMv6 AMBA extensions for exclusive access.
//------------------------------ << end excl >> --------------------------------
//
//-----------------------------------------------------------------------------

<<timescale_directive>>

module <<input_stage_name>> (

    // Common AHB signals
    HCLK,
    HRESETn,

    // Input Port Address/Control Signals
    HSELS,
    HADDRS,
//---------------------------- << start user >> --------------------------------
    HAUSERS,
//----------------------------- << end user >> ---------------------------------
    HTRANSS,
    HWRITES,
    HSIZES,
    HBURSTS,
    HPROTS,
//---------------------------- << start unalign >> -----------------------------
    HUNALIGNS,
    HBSTRBS,
//----------------------------- << end unalign >> ------------------------------
    HMASTERS,
    HMASTLOCKS,
    HREADYS,

    // Internal Response
    active_ip,
    readyout_ip,
    resp_ip,

    // Input Port Response
    HREADYOUTS,
    HRESPS,

    // Internal Address/Control Signals
    sel_ip,
    addr_ip,
//---------------------------- << start user >> --------------------------------
    auser_ip,
//----------------------------- << end user >> ---------------------------------
    trans_ip,
    write_ip,
    size_ip,
    burst_ip,
    prot_ip,
//---------------------------- << start unalign >> -----------------------------
    unalign_ip,
    bstrb_ip,
//----------------------------- << end unalign >> ------------------------------
    master_ip,
    mastlock_ip,
    held_tran_ip

    );


// -----------------------------------------------------------------------------
// Input and Output declarations
// -----------------------------------------------------------------------------

    input         HCLK;            // AHB System Clock
    input         HRESETn;         // AHB System Reset
    input         HSELS;           // Slave Select from AHB
    input  [<<addr>>:0] HADDRS;          // Address bus from AHB
//---------------------------- << start user >> --------------------------------
    input  [<<user>>:0] HAUSERS;         // Additional user adress bus
//----------------------------- << end user >> ---------------------------------
    input   [1:0] HTRANSS;         // Transfer type from AHB
    input         HWRITES;         // Transfer direction from AHB
    input   [2:0] HSIZES;          // Transfer size from AHB
    input   [2:0] HBURSTS;         // Burst type from AHB
    input   [<<prot>>:0] HPROTS;          // Protection control from AHB
//---------------------------- << start unalign >> -----------------------------
    input         HUNALIGNS;       // Unalign signal from AHB
    input   [<<bstrb>>:0] HBSTRBS;         // Active Byte Lane strobes
//----------------------------- << end unalign >> ------------------------------
    input   [3:0] HMASTERS;        // Master number from AHB
    input         HMASTLOCKS;      // Locked Sequence  from AHB
    input         HREADYS;         // Transfer done from AHB
    input         active_ip;          // active_ip signal
    input         readyout_ip;        // HREADYOUT input
    input   [<<resp>>:0] resp_ip;            // HRESP input

    output        HREADYOUTS;      // HREADY feedback to AHB
    output  [<<resp>>:0] HRESPS;          // Transfer response to AHB
    output        sel_ip;             // HSEL output
    output [<<addr>>:0] addr_ip;            // HADDR output
//---------------------------- << start user >> --------------------------------
    output [<<user>>:0] auser_ip;           // HAUSER output
//----------------------------- << end user >> ---------------------------------
    output  [1:0] trans_ip;           // HTRANS output
    output        write_ip;           // HWRITE output
    output  [2:0] size_ip;            // HSIZE output
    output  [2:0] burst_ip;           // HBURST output
    output  [<<prot>>:0] prot_ip;            // HPROT output
//---------------------------- << start unalign >> -----------------------------
    output        unalign_ip;         // HUNALIGN output
    output  [<<bstrb>>:0] bstrb_ip;           // HBSTRB output
//----------------------------- << end unalign >> ------------------------------
    output [3:0]  master_ip;          // HMASTER output
    output        mastlock_ip;        // HMASTLOCK output
    output        held_tran_ip;        // Holding register active flag


// -----------------------------------------------------------------------------
// Constant declarations
// -----------------------------------------------------------------------------

// HTRANS transfer type signal encoding
`define TRN_IDLE    2'b00     // Idle Transfer
`define TRN_BUSY    2'b01     // Busy Transfer
`define TRN_NONSEQ  2'b10     // Nonsequential transfer
`define TRN_SEQ     2'b11     // Sequential transfer

// HBURST transfer type signal encoding
`define BUR_SINGLE  3'b000    // Single BURST
`define BUR_INCR    3'b001    // Incremental BURSTS
`define BUR_WRAP4   3'b010    // 4-beat wrap
`define BUR_INCR4   3'b011    // 4-beat incr
`define BUR_WRAP8   3'b100    // 8-beat wrap
`define BUR_INCR8   3'b101    // 8-beat incr
`define BUR_WRAP16  3'b110    // 16-beat wrap
`define BUR_INCR16  3'b111    // 16-beat incr

// HRESP signal encoding
`define RSP_OKAY    <<resp_v>>'b<<bin_resp_okay>>      // OKAY response
`define RSP_ERROR   <<resp_v>>'b<<bin_resp_error>>     // ERROR response
`define RSP_RETRY   <<resp_v>>'b<<bin_resp_retry>>     // RETRY response
`define RSP_SPLIT   <<resp_v>>'b<<bin_resp_split>>     // SPLIT response
//----------------------------- << start excl >> -------------------------------
`define RSP_XFAIL   <<resp_v>>'b<<bin_resp_xfail>>;    // XFAIL response
//------------------------------ << end excl >> --------------------------------


// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------

    wire        HCLK;            // AHB System Clock
    wire        HRESETn;         // AHB System Reset
    wire        HSELS;           // Slave Select from AHB
    wire [<<addr>>:0] HADDRS;          // Address bus from AHB
//---------------------------- << start user >> --------------------------------
    wire [<<user>>:0] HAUSERS;         // Additional user adress bus
//----------------------------- << end user >> ---------------------------------
    wire  [1:0] HTRANSS;         // Transfer type from AHB
    wire        HWRITES;         // Transfer direction from AHB
    wire  [2:0] HSIZES;          // Transfer size from AHB
    wire  [2:0] HBURSTS;         // Burst type from AHB
    wire  [<<prot>>:0] HPROTS;          // Protection control from AHB
//---------------------------- << start unalign >> -----------------------------
    wire        HUNALIGNS;       // Unalign signal from AHB
    wire  [<<bstrb>>:0] HBSTRBS;         // Active Byte Lane strobes
//----------------------------- << end unalign >> ------------------------------
    wire  [3:0] HMASTERS;        // Master number from AHB
    wire        HMASTLOCKS;      // Locked Sequence  from AHB
    wire        HREADYS;         // Transfer done from AHB
    reg         HREADYOUTS;      // HREADY feedback to AHB
    reg   [<<resp>>:0] HRESPS;          // Transfer response to AHB
    reg         sel_ip;             // HSEL output
    reg  [<<addr>>:0] addr_ip;            // HADDR output
//---------------------------- << start user >> --------------------------------
    reg  [<<user>>:0] auser_ip;           // HAUSER output
//----------------------------- << end user >> ---------------------------------
    wire  [1:0] trans_ip;           // HTRANS output
    reg         write_ip;           // HWRITE output
    reg   [2:0] size_ip;            // HSIZE output
    wire  [2:0] burst_ip;           // HBURST output
    reg   [<<prot>>:0] prot_ip;            // HPROT output
//---------------------------- << start unalign >> -----------------------------
    wire        unalign_ip;         // HUNALIGN output
    wire  [<<bstrb>>:0] bstrb_ip;           // HBSTRB output
//----------------------------- << end unalign >> ------------------------------
    reg   [3:0] master_ip;          // HMASTER output
    reg         mastlock_ip;        // HMASTLOCK output
    wire        held_tran_ip;        // Holding register active flag
    wire        active_ip;          // active_ip signal
    wire        readyout_ip;        // HREADYOUT input
    wire  [<<resp>>:0] resp_ip;            // HRESP input


// -----------------------------------------------------------------------------
// Signal declarations
// -----------------------------------------------------------------------------

    wire        load_reg;             // Holding register load flag
    wire        pend_tran;            // An active transfer cannot complete
    reg         pend_tran_reg;         // Registered version of pend_tran
    wire        addr_valid;           // Indicates address phase of
                                     // valid transfer
    reg         data_valid;           // Indicates data phase of
                                     // valid transfer
    reg   [1:0] reg_trans;            // Registered HTRANSS
    reg  [<<addr>>:0] reg_addr;             // Registered HADDRS
//---------------------------- << start user >> --------------------------------
    reg  [<<user>>:0] reg_auser;
//----------------------------- << end user >> ---------------------------------
    reg         reg_write;            // Registered HWRITES
    reg   [2:0] reg_size;             // Registered HSIZES
    reg   [2:0] reg_burst;            // Registered HBURSTS
    reg   [<<prot>>:0] reg_prot;             // Registered HPROTS
//---------------------------- << start unalign >> -----------------------------
    reg         reg_unalign;          // Registered HUNALIGNS
    reg   [<<bstrb>>:0] reg_bstrb;            // Registered HBSTRBS
//----------------------------- << end unalign >> ------------------------------
    reg   [3:0] reg_master;           // Registerd HMASTERS
    reg         reg_mastlock;         // Registered HMASTLOCKS
    reg   [1:0] transb;               // HTRANS output used for burst information
    reg   [1:0] trans_int;            // HTRANS output
    reg   [2:0] burst_int;            // HBURST output
    reg   [3:0] offset_addr;          // Address offset for boundary logic
    reg   [3:0] check_addr;           // Address check for wrapped bursts
    reg         burst_override;       // Registered burst_override_next
    wire        burst_override_next;  // Indicates burst has been over-ridden
    reg         bound;                // Registered version of bound_next
    wire        bound_next;           // Indicates boundary wrapping
    wire        bound_en;             // Clock-enable for bound register


// -----------------------------------------------------------------------------
// Beginning of main code
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Holding Registers
// -----------------------------------------------------------------------------
// Each input port has a holding register associated with it and a mux to
//  select between the register and the direct input path. The control of
//  the mux is done simply by selecting the holding register when it is loaded
//  with a pending transfer, otherwise the straight through path is used.

  always @ (negedge HRESETn or posedge HCLK)
    begin : p_holding_reg_seq1
      if (~HRESETn)
        begin
          reg_trans    <= 2'b00;
          reg_addr     <= {<<addr_v>>{1'b0}};
//---------------------------- << start user >> --------------------------------
          reg_auser    <= {<<user_v>>{1'b0}};
//----------------------------- << end user >> ---------------------------------
          reg_write    <= 1'b0 ;
          reg_size     <= 3'b000;
          reg_burst    <= 3'b000;
          reg_prot     <= {<<prot_v>>{1'b0}};
//---------------------------- << start unalign >> -----------------------------
          reg_unalign  <= 1'b0;
          reg_bstrb    <= {<<bstrb_v>>{1'b0}};
//----------------------------- << end unalign >> ------------------------------
          reg_master   <= 4'b0000;
          reg_mastlock <= 1'b0 ;
        end
      else
        if (load_reg)
          begin
            reg_trans    <= HTRANSS;
            reg_addr     <= HADDRS;
//---------------------------- << start user >> --------------------------------
            reg_auser    <= HAUSERS;
//----------------------------- << end user >> ---------------------------------
            reg_write    <= HWRITES;
            reg_size     <= HSIZES;
            reg_burst    <= HBURSTS;
            reg_prot     <= HPROTS;
//---------------------------- << start unalign >> -----------------------------
            reg_unalign  <= HUNALIGNS;
            reg_bstrb    <= HBSTRBS;
//----------------------------- << end unalign >> ------------------------------
            reg_master   <= HMASTERS;
            reg_mastlock <= HMASTLOCKS;
          end
    end

  // addr_valid indicates the address phase of an active (non-BUSY/IDLE)
  // transfer to this slave port
  assign addr_valid = ( HSELS & HTRANSS[1] );

  // The holding register is loaded whenever there is a transfer on the input
  // port which is validated by active HREADYS
  assign load_reg = ( addr_valid & HREADYS );

  // data_valid register
  // addr_valid indicates the data phase of an active (non-BUSY/IDLE)
  // transfer to this slave port. A valid response (HREADY, HRESP) must be
  // generated
  always @ (negedge HRESETn or posedge HCLK)
    begin : p_data_valid
      if (~HRESETn)
        data_valid <= 1'b0;
      else
       if (HREADYS)
        data_valid  <= addr_valid;
    end

// -----------------------------------------------------------------------------
// Generate HeldTran
// -----------------------------------------------------------------------------
// The HeldTran signal is used to indicate when there is an active transfer
// being presented to the output stage, either passing straight through or from
// the holding register.

  // pend_tran indicates that an active transfer presented to this
  // slave cannot complete immediately.  It is always set after the
  // load_reg signal has been active. When set, it is cleared when the
  // transfer is being driven onto the selected slave (as indicated by
  // active_ip being high) and HREADY from the selected slave is high.
  assign pend_tran = (load_reg & (~active_ip)) ? 1'b1 :
                    (active_ip & readyout_ip) ? 1'b0 : pend_tran_reg;

  // pend_tran_reg indicates that an active transfer was accepted by the input
  // stage,but not by the output stage, and so the holding registers should be
  // used
  always @ (negedge HRESETn or posedge HCLK)
    begin : p_pend_tran_reg
      if (~HRESETn)
        pend_tran_reg <= 1'b0;
      else
        pend_tran_reg <= pend_tran;
    end

  // held_tran_ip indicates an active transfer, and is held whilst that transfer is
  // in the holding registers.  It passes to the output stage where it acts as
  // a request line to the arbitration scheme
  assign  held_tran_ip  = (load_reg | pend_tran_reg);

  // The output from this stage is selected from the holding register when
  //  there is a held transfer. Otherwise the direct path is used.

  always @ ( pend_tran_reg or HSELS or HTRANSS or HADDRS or HWRITES or
             HSIZES or HBURSTS or HPROTS or HMASTERS or HMASTLOCKS or
//---------------------------- << start user >> --------------------------------
             HAUSERS or reg_auser or
//----------------------------- << end user >> ---------------------------------
             reg_addr or reg_write or reg_size or reg_burst or reg_prot or
             reg_master or reg_mastlock
           )
    begin : p_mux_comb
      if (~pend_tran_reg)
        begin
          sel_ip      = HSELS;
          trans_int   = HTRANSS;
          addr_ip     = HADDRS;
//---------------------------- << start user >> --------------------------------
          auser_ip    = HAUSERS;
//----------------------------- << end user >> ---------------------------------
          write_ip    = HWRITES;
          size_ip     = HSIZES;
          burst_int   = HBURSTS;
          prot_ip     = HPROTS;
          master_ip   = HMASTERS;
          mastlock_ip = HMASTLOCKS;
        end
      else
        begin
          sel_ip      = 1'b1;
          trans_int   = `TRN_NONSEQ;
          addr_ip     = reg_addr;
//---------------------------- << start user >> --------------------------------
          auser_ip    = reg_auser;
//----------------------------- << end user >> ---------------------------------
          write_ip    = reg_write;
          size_ip     = reg_size;
          burst_int   = reg_burst;
          prot_ip     = reg_prot;
          master_ip   = reg_master;
          mastlock_ip = reg_mastlock;
        end
    end

  // The transb output is used to select the correct Burst value when completing
  // an interrupted defined-lenght burst.

  always @ (pend_tran_reg or HTRANSS or reg_trans)
    begin : p_transb_comb
      if (~pend_tran_reg)
        transb = HTRANSS;
      else
        transb = reg_trans;
    end // block: p_transb_comb

//---------------------------- << start unalign >> -----------------------------
  assign unalign_ip = (pend_tran_reg) ? reg_unalign : HUNALIGNS ;
  assign bstrb_ip   = (pend_tran_reg) ? reg_bstrb : HBSTRBS ;
//----------------------------- << end unalign >> ------------------------------

  // Convert SEQ->NONSEQ and BUSY->IDLE when an address boundary is crossed
  // whilst the burst type is being over-ridden, i.e. when completing an
  // interrupted wrapping burst.
  assign trans_ip = (burst_override & bound) ? {trans_int[1], 1'b0}
               : trans_int;

  assign burst_ip = (burst_override & (transb != `TRN_NONSEQ)) ? `BUR_INCR
               : burst_int;

// -----------------------------------------------------------------------------
// HREADYOUT Generation
// -----------------------------------------------------------------------------
// There are three possible sources for the HREADYOUT signal.
//  - It is driven LOW when there is a held transfer.
//  - It is driven HIGH when not Selected or for Idle/Busy transfers.
//  - At all other times it is driven from the appropriate shared
//    slave.

  always @ (data_valid or pend_tran_reg or readyout_ip or resp_ip)
    begin : p_ready_comb
      if (~data_valid)
        begin
          HREADYOUTS = 1'b1;
          HRESPS     = `RSP_OKAY;
        end
      else if (pend_tran_reg)
        begin
          HREADYOUTS = 1'b0;
          HRESPS     = `RSP_OKAY;
        end
      else
        begin
          HREADYOUTS = readyout_ip;
          HRESPS     = resp_ip;
        end
    end // block: p_ready_comb

// -----------------------------------------------------------------------------
// Early Burst Termination
// -----------------------------------------------------------------------------
// There are times when the output stage will switch to another input port
//  without allowing the current burst to complete. In these cases the HTRANS
//  and HBURST signals need to be overriden to ensure that the transfers
//  reaching the output port meet the AHB specification.

  assign burst_override_next  = ( (HTRANSS == `TRN_NONSEQ) |
                                (HTRANSS == `TRN_IDLE) ) ? 1'b0
                              : ( (HTRANSS ==`TRN_SEQ) &
                                   load_reg &
                                   (~active_ip) ) ? 1'b1
                                  : burst_override;

  // burst_override register
  always @ (negedge HRESETn or posedge HCLK)
    begin : p_burst_overrideseq
      if (~HRESETn)
        burst_override <= 1'b0;
      else
        if (HREADYS)
          burst_override <= burst_override_next;
    end // block: p_burst_overrideseq

// -----------------------------------------------------------------------------
// Boundary Checking Logic
// -----------------------------------------------------------------------------
  // offset_addr
  always @ (HADDRS or HSIZES)
    begin : p_offset_addr_comb
      case (HSIZES)
        3'b000 : offset_addr = HADDRS[3:0];
        3'b001 : offset_addr = HADDRS[4:1];
        3'b010 : offset_addr = HADDRS[5:2];
        3'b011 : offset_addr = HADDRS[6:3];

        3'b100, 3'b101, 3'b110, 3'b111 :
          offset_addr = HADDRS[3:0];      // Sizes >= 128-bits are not supported

        default : offset_addr = 4'bxxxx;
      endcase
    end

  // check_addr
  always @ (offset_addr or HBURSTS)
    begin : p_check_addr_comb
      case (HBURSTS)
        `BUR_WRAP4 : begin
          check_addr[1:0] = offset_addr[1:0];
          check_addr[3:2] = 2'b11;
        end

        `BUR_WRAP8 : begin
          check_addr[2:0] = offset_addr[2:0];
          check_addr[3]   = 1'b1;
        end

        `BUR_WRAP16 :
          check_addr[3:0] = offset_addr[3:0];

        `BUR_SINGLE, `BUR_INCR, `BUR_INCR4, `BUR_INCR8, `BUR_INCR16 :
          check_addr[3:0] = 4'b0000;

        default : check_addr[3:0] = 4'bxxxx;
      endcase
    end

  assign bound_next = ( check_addr == 4'b1111 );

  assign bound_en = ( HTRANSS[1] & HREADYS );

  // bound register
  always @ (negedge HRESETn or posedge HCLK)
    begin : p_bound_seq
      if (~HRESETn)
        bound <= 1'b0;
      else
        if (bound_en)
          bound <= bound_next;
    end


endmodule

// --================================= End ===================================--
