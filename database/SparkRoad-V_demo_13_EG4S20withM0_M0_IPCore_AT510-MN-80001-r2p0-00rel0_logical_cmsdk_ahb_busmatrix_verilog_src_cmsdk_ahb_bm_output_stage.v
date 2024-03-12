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
//-----------------------------------------------------------------------------
//  Abstract            : The Output Stage is used to route the required input
//                        stage to the shared slave output.
//
//  Notes               : The bus matrix has <<connectivity>> connectivity,
//                         and has a <<arbiter_type>> arbiter scheme.
//
//-----------------------------------------------------------------------------

<<timescale_directive>>

module <<output_stage_name>> (

    // Common AHB signals
    HCLK,
    HRESETn,

//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
    // Port <<in>> Signals
    sel_op<<in>>,
    addr_op<<in>>,
//---------------------------- << start user >> --------------------------------
    auser_op<<in>>,
//----------------------------- << end user >> ---------------------------------
    trans_op<<in>>,
    write_op<<in>>,
    size_op<<in>>,
    burst_op<<in>>,
    prot_op<<in>>,
//---------------------------- << start unalign >> -----------------------------
    unalign_op<<in>>,
    bstrb_op<<in>>,
//----------------------------- << end unalign >> ------------------------------
    master_op<<in>>,
    mastlock_op<<in>>,
    wdata_op<<in>>,
//---------------------------- << start user >> --------------------------------
    wuser_op<<in>>,
//----------------------------- << end user >> ---------------------------------
    held_tran_op<<in>>,

//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
    // Slave read data and response
    HREADYOUTM,

//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
    active_op<<in>>,
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------

    // Slave Address/Control Signals
    HSELM,
    HADDRM,
//---------------------------- << start user >> --------------------------------
    HAUSERM,
//----------------------------- << end user >> ---------------------------------
    HTRANSM,
    HWRITEM,
    HSIZEM,
    HBURSTM,
    HPROTM,
//---------------------------- << start unalign >> -----------------------------
    HUNALIGNM,
    HBSTRBM,
//----------------------------- << end unalign >> ------------------------------
    HMASTERM,
    HMASTLOCKM,
    HREADYMUXM,
//---------------------------- << start user >> --------------------------------
    HWUSERM,
//----------------------------- << end user >> ---------------------------------
    HWDATAM

    );


// -----------------------------------------------------------------------------
// Input and Output declarations
// -----------------------------------------------------------------------------

    // Common AHB signals
    input         HCLK;       // AHB system clock
    input         HRESETn;    // AHB system reset

//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
    // Bus-switch input <<in>>
    input         sel_op<<in>>;       // Port <<in>> HSEL signal
    input [<<addr>>:0]  addr_op<<in>>;      // Port <<in>> HADDR signal
//---------------------------- << start user >> --------------------------------
    input [<<user>>:0]  auser_op<<in>>;     // Port <<in>> HAUSER signal
//----------------------------- << end user >> ---------------------------------
    input  [1:0]  trans_op<<in>>;     // Port <<in>> HTRANS signal
    input         write_op<<in>>;     // Port <<in>> HWRITE signal
    input  [2:0]  size_op<<in>>;      // Port <<in>> HSIZE signal
    input  [2:0]  burst_op<<in>>;     // Port <<in>> HBURST signal
    input  [<<prot>>:0]  prot_op<<in>>;      // Port <<in>> HPROT signal
//---------------------------- << start unalign >> -----------------------------
    input         unalign_op<<in>>;   // Port <<in>> HUNALIGN signal
    input  [<<bstrb>>:0]  bstrb_op<<in>>;     // Port <<in>> HBSTRB signal
//----------------------------- << end unalign >> ------------------------------
    input  [3:0]  master_op<<in>>;    // Port <<in>> HMASTER signal
    input         mastlock_op<<in>>;  // Port <<in>> HMASTLOCK signal
    input [<<data>>:0]  wdata_op<<in>>;     // Port <<in>> HWDATA signal
//---------------------------- << start user >> --------------------------------
    input [<<user>>:0]  wuser_op<<in>>;     // Port <<in>> HWUSER signal
//----------------------------- << end user >> ---------------------------------
    input         held_tran_op<<in>>;  // Port <<in>> HeldTran signal

//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
    input         HREADYOUTM; // HREADY feedback

//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
    output        active_op<<in>>;    // Port <<in>> Active signal
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------

    // Slave Address/Control Signals
    output        HSELM;      // Slave select line
    output [<<addr>>:0] HADDRM;     // Address
//---------------------------- << start user >> --------------------------------
    output [<<user>>:0] HAUSERM;    // User Address bus
//----------------------------- << end user >> ---------------------------------
    output  [1:0] HTRANSM;    // Transfer type
    output        HWRITEM;    // Transfer direction
    output  [2:0] HSIZEM;     // Transfer size
    output  [2:0] HBURSTM;    // Burst type
    output  [<<prot>>:0] HPROTM;     // Protection control
//---------------------------- << start unalign >> -----------------------------
    output        HUNALIGNM;  // Unaligned transfer
    output [<<bstrb>>:0]  HBSTRBM;    // Byte Lane strobe signal
//----------------------------- << end unalign >> ------------------------------
    output  [3:0] HMASTERM;   // Master ID
    output        HMASTLOCKM; // Locked transfer
    output        HREADYMUXM; // Transfer done
//---------------------------- << start user >> --------------------------------
    output [<<user>>:0] HWUSERM;    // User data bus
//----------------------------- << end user >> ---------------------------------
    output [<<data>>:0] HWDATAM;    // Write data


// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------
    wire        HCLK;       // AHB system clock
    wire        HRESETn;    // AHB system reset

//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
    // Bus-switch input <<in>>
    wire        sel_op<<in>>;       // Port <<in>> HSEL signal
    wire [<<addr>>:0] addr_op<<in>>;      // Port <<in>> HADDR signal
//---------------------------- << start user >> --------------------------------
    wire [<<user>>:0] auser_op<<in>>;     // Port <<in>> HAUSER signal
//----------------------------- << end user >> ---------------------------------
    wire  [1:0] trans_op<<in>>;     // Port <<in>> HTRANS signal
    wire        write_op<<in>>;     // Port <<in>> HWRITE signal
    wire  [2:0] size_op<<in>>;      // Port <<in>> HSIZE signal
    wire  [2:0] burst_op<<in>>;     // Port <<in>> HBURST signal
    wire  [<<prot>>:0] prot_op<<in>>;      // Port <<in>> HPROT signal
//---------------------------- << start unalign >> -----------------------------
    wire        unalign_op<<in>>;   // Port <<in>> HUNALIGN signal
    wire  [<<bstrb>>:0] bstrb_op<<in>>;     // Port <<in>> HBSTRB signal
//----------------------------- << end unalign >> ------------------------------
    wire  [3:0] master_op<<in>>;    // Port <<in>> HMASTER signal
    wire        mastlock_op<<in>>;  // Port <<in>> HMASTLOCK signal
    wire [<<data>>:0] wdata_op<<in>>;     // Port <<in>> HWDATA signal
//---------------------------- << start user >> --------------------------------
    wire [<<user>>:0] wuser_op<<in>>;     // Port <<in>> HWUSER signal
//----------------------------- << end user >> ---------------------------------
    wire        held_tran_op<<in>>;  // Port <<in>> HeldTran signal
    reg         active_op<<in>>;    // Port <<in>> Active signal

//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
    // Slave Address/Control Signals
    wire        HSELM;      // Slave select line
    reg  [<<addr>>:0] HADDRM;     // Address
//---------------------------- << start user >> --------------------------------
    reg  [<<user>>:0] HAUSERM;    // User Address bus
//----------------------------- << end user >> ---------------------------------
    wire  [1:0] HTRANSM;    // Transfer type
    reg         HWRITEM;    // Transfer direction
    reg   [2:0] HSIZEM;     // Transfer size
    wire  [2:0] HBURSTM;    // Burst type
    reg   [<<prot>>:0] HPROTM;     // Protection control
//---------------------------- << start unalign >> -----------------------------
    reg         HUNALIGNM;  // Unaligned transfer
    reg  [<<bstrb>>:0]  HBSTRBM;    // Byte Lane strobe signal
//----------------------------- << end unalign >> ------------------------------
    reg   [3:0] HMASTERM;   // Master ID
    wire        HMASTLOCKM; // Locked transfer
    wire        HREADYMUXM; // Transfer done
//---------------------------- << start user >> --------------------------------
    reg  [<<user>>:0] HWUSERM;    // User data bus
//----------------------------- << end user >> ---------------------------------
    reg  [<<data>>:0] HWDATAM;    // Write data
    wire        HREADYOUTM; // HREADY feedback


// -----------------------------------------------------------------------------
// Signal declarations
// -----------------------------------------------------------------------------
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
    wire        req_port<<in>>;     // Port <<in>> request signal
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------

    wire  [<<idw_si>>:0] addr_in_port;   // Address input port
    reg   [<<idw_si>>:0] data_in_port;   // Data input port
    wire        no_port;       // No port selected signal
    reg         slave_sel;     // Slave select signal

    reg         hsel_lock;     // Held HSELS during locked sequence
    wire        next_hsel_lock; // Pre-registered hsel_lock
    wire        hlock_arb;     // HMASTLOCK modified by HSEL for arbitration

    reg         i_hselm;       // Internal HSELM
    reg   [1:0] i_htransm;     // Internal HTRANSM
    reg   [2:0] i_hburstm;     // Internal HBURSTM
    wire        i_hreadymuxm;  // Internal HREADYMUXM
    reg         i_hmastlockm;  // Internal HMASTLOCKM


// -----------------------------------------------------------------------------
// Beginning of main code
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Port Selection
// -----------------------------------------------------------------------------

//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
  assign req_port<<in>> = held_tran_op<<in>> & sel_op<<in>>;
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------

  // Arbiter instance for resolving requests to this output stage
  <<output_arb_name>> u_output_arb (

    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
    .req_port<<in>>   (req_port<<in>>),
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------

    .HREADYM    (i_hreadymuxm),
    .HSELM      (i_hselm),
    .HTRANSM    (i_htransm),
    .HBURSTM    (i_hburstm),
    .HMASTLOCKM (hlock_arb),

    .addr_in_port (addr_in_port),
    .no_port     (no_port)

    );


  // Active signal combinatorial decode
  always @ (addr_in_port or no_port)
    begin : p_active_comb
      // Default value(s)
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
      active_op<<in>> = 1'b0;
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------

      // Decode selection when enabled
      if (~no_port)
        case (addr_in_port)
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
          <<idw_si_v>>'b<<bin_in>> : active_op<<in>> = 1'b1;
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
          default : begin
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
            active_op<<in>> = 1'bx;
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
          end
        endcase // case(addr_in_port)
    end // block: p_active_comb


  //  Address/control output decode
  always @ (
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
             sel_op<<in>> or addr_op<<in>> or trans_op<<in>> or write_op<<in>> or
             size_op<<in>> or burst_op<<in>> or prot_op<<in>> or
//---------------------------- << start unalign >> -----------------------------
             unalign_op<<in>> or bstrb_op<<in>> or
//----------------------------- << end unalign >> ------------------------------
//---------------------------- << start user >> --------------------------------
             auser_op<<in>> or
//----------------------------- << end user >> ---------------------------------
             master_op<<in>> or mastlock_op<<in>> or
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
             addr_in_port or no_port
           )
    begin : p_addr_mux
      // Default values
      i_hselm     = 1'b0;
      HADDRM      = {<<addr_v>>{1'b0}};
//---------------------------- << start user >> --------------------------------
      HAUSERM     = {<<user_v>>{1'b0}};
//----------------------------- << end user >> ---------------------------------
      i_htransm   = 2'b00;
      HWRITEM     = 1'b0;
      HSIZEM      = 3'b000;
      i_hburstm   = 3'b000;
      HPROTM      = {<<prot_v>>{1'b0}};
//---------------------------- << start unalign >> -----------------------------
      HUNALIGNM   = 1'b0;
      HBSTRBM     = {<<bstrb_v>>{1'b0}};
//----------------------------- << end unalign >> ------------------------------
      HMASTERM    = 4'b0000;
      i_hmastlockm= 1'b0;

      // Decode selection when enabled
      if (~no_port)
        case (addr_in_port)
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
          // Bus-switch input <<in>>
          <<idw_si_v>>'b<<bin_in>> :
            begin
              i_hselm     = sel_op<<in>>;
              HADDRM      = addr_op<<in>>;
//---------------------------- << start user >> --------------------------------
              HAUSERM     = auser_op<<in>>;
//----------------------------- << end user >> ---------------------------------
              i_htransm   = trans_op<<in>>;
              HWRITEM     = write_op<<in>>;
              HSIZEM      = size_op<<in>>;
              i_hburstm   = burst_op<<in>>;
              HPROTM      = prot_op<<in>>;
//---------------------------- << start unalign >> -----------------------------
              HUNALIGNM   = unalign_op<<in>>;
              HBSTRBM     = bstrb_op<<in>>;
//----------------------------- << end unalign >> ------------------------------
              HMASTERM    = master_op<<in>>;
              i_hmastlockm= mastlock_op<<in>>;
            end // case: 4'b<<bin_in>>

//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
          default :
            begin
              i_hselm     = 1'bx;
              HADDRM      = {<<addr_v>>{1'bx}};
//---------------------------- << start user >> --------------------------------
              HAUSERM     = {<<user_v>>{1'bx}};
//----------------------------- << end user >> ---------------------------------
              i_htransm   = 2'bxx;
              HWRITEM     = 1'bx;
              HSIZEM      = 3'bxxx;
              i_hburstm   = 3'bxxx;
              HPROTM      = {<<prot_v>>{1'bx}};
//---------------------------- << start unalign >> -----------------------------
              HUNALIGNM   = 1'bx;
              HBSTRBM     = {<<bstrb_v>>{1'bx}};
//----------------------------- << end unalign >> ------------------------------
              HMASTERM    = 4'bxxxx;
              i_hmastlockm= 1'bx;
            end // case: default
        endcase // case(addr_in_port)
    end // block: p_addr_mux

  // hsel_lock provides support for AHB masters that address other
  // slave regions in the middle of a locked sequence (i.e. HSEL is
  // de-asserted during the locked sequence).  Unless HMASTLOCK is
  // held during these intermediate cycles, the OutputArb scheme will
  // lose track of the locked sequence and may allow another input
  // port to access the output port which should be locked
  assign next_hsel_lock = (i_hselm & i_htransm[1] & i_hmastlockm) ? 1'b1 :
                         (i_hmastlockm == 1'b0) ? 1'b0 :
                          hsel_lock;

  // Register hsel_lock
  always @ (negedge HRESETn or posedge HCLK)
    begin : p_hsel_lock
      if (~HRESETn)
        hsel_lock <= 1'b0;
      else
        if (i_hreadymuxm)
          hsel_lock <= next_hsel_lock;
    end

  // Version of HMASTLOCK which is masked when not selected, unless a
  // locked sequence has already begun through this port
  assign hlock_arb = i_hmastlockm & (hsel_lock | i_hselm);

  assign HTRANSM    = i_htransm;
  assign HBURSTM    = i_hburstm;
  assign HSELM      = i_hselm;
  assign HMASTLOCKM = i_hmastlockm;

  // Dataport register
  always @ (negedge HRESETn or posedge HCLK)
    begin : p_data_in_port_reg
      if (~HRESETn)
        data_in_port <= {<<idw_si_v>>{1'b0}};
      else
        if (i_hreadymuxm)
          data_in_port <= addr_in_port;
    end

  // HWDATAM output decode
  always @ (
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
             wdata_op<<in>> or
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
             data_in_port
           )
    begin : p_data_mux
      // Default value
      HWDATAM = {<<data_v>>{1'b0}};

      // Decode selection
      case (data_in_port)
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
        <<idw_si_v>>'b<<bin_in>> : HWDATAM  = wdata_op<<in>>;
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
        default : HWDATAM = {<<data_v>>{1'bx}};
      endcase // case(data_in_port)
    end // block: p_data_mux

//---------------------------- << start user >> --------------------------------
  // HWUSERM output decode
  always @ (
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
             wuser_op<<in>> or
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
             data_in_port
           )
    begin : p_wuser_mux
      // Default value
      HWUSERM  = {<<user_v>>{1'b0}};

      // Decode selection
      case (data_in_port)
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
        <<idw_si_v>>'b<<bin_in>> : HWUSERM  = wuser_op<<in>>;
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
        default : HWUSERM  = {<<user_v>>{1'bx}};
      endcase // case(data_in_port)
    end // block: p_wuser_mux
//----------------------------- << end user >> ---------------------------------

  // ---------------------------------------------------------------------------
  // HREADYMUXM generation
  // ---------------------------------------------------------------------------
  // The HREADY signal on the shared slave is generated directly from
  //  the shared slave HREADYOUTS if the slave is selected, otherwise
  //  it mirrors the HREADY signal of the appropriate input port
  always @ (negedge HRESETn or posedge HCLK)
    begin : p_slave_sel_reg
      if (~HRESETn)
        slave_sel <= 1'b0;
      else
        if (i_hreadymuxm)
          slave_sel  <= i_hselm;
    end

  // HREADYMUXM output selection
  assign i_hreadymuxm = (slave_sel) ? HREADYOUTM : 1'b1;

  // Drive output with internal version of the signal
  assign HREADYMUXM = i_hreadymuxm;


endmodule

// --================================= End ===================================--
