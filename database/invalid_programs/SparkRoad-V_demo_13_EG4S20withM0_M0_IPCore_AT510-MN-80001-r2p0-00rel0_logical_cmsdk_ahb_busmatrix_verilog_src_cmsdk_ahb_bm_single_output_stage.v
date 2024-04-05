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
//  Abstract             : The Output Stage is used to route the required input
//                         stage to the shared slave output. However, for this
//                         output port, only one sparse connection is declared
//                         and muxing is simplified.
//
//  Notes               : The bus matrix has <<connectivity>> connectivity and the
//                         standard output stage has been overridden for this
//                         instance only.
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

    // Slave addr_opess/Control Signals
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
    input         held_tran_op<<in>>;  // Port <<in>> held_tran_op signal

//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
    input         HREADYOUTM; // HREADY feedback

//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
    output        active_op<<in>>;    // Port <<in>> active_op signal
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------

    // Slave addr_opess/Control Signals
    output        HSELM;      // Slave select line
    output [<<addr>>:0] HADDRM;     // addr_opess
//---------------------------- << start user >> --------------------------------
    output [<<user>>:0] HAUSERM;    // User addr_opess bus
//----------------------------- << end user >> ---------------------------------
    output  [1:0] HTRANSM;    // trans_opfer type
    output        HWRITEM;    // trans_opfer direction
    output  [2:0] HSIZEM;     // trans_opfer size
    output  [2:0] HBURSTM;    // burst_op type
    output  [<<prot>>:0] HPROTM;     // prot_opection control
//---------------------------- << start unalign >> -----------------------------
    output        HUNALIGNM;  // unalign_oped transfer
    output [<<bstrb>>:0]  HBSTRBM;    // Byte Lane strobe signal
//----------------------------- << end unalign >> ------------------------------
    output  [3:0] HMASTERM;   // master_op ID
    output        HMASTLOCKM; // Locked transfer
    output        HREADYMUXM; // trans_opfer done
//---------------------------- << start user >> --------------------------------
    output [<<user>>:0] HWUSERM;    // User data bus
//----------------------------- << end user >> ---------------------------------
    output [<<data>>:0] HWDATAM;    // write_op data


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
    wire        held_tran_op<<in>>;  // Port <<in>> held_tran_op signal
    wire        active_op<<in>>;    // Port <<in>> active_op signal

//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
    // Slave addr_opess/Control Signals
    wire        HSELM;      // Slave select line
    wire [<<addr>>:0] HADDRM;     // addr_opess
//---------------------------- << start user >> --------------------------------
    wire [<<user>>:0] HAUSERM;    // User addr_opess bus
//----------------------------- << end user >> ---------------------------------
    wire  [1:0] HTRANSM;    // trans_opfer type
    wire        HWRITEM;    // trans_opfer direction
    wire  [2:0] HSIZEM;     // trans_opfer size
    wire  [2:0] HBURSTM;    // burst_op type
    wire  [<<prot>>:0] HPROTM;     // prot_opection control
//---------------------------- << start unalign >> -----------------------------
    wire        HUNALIGNM;  // unalign_oped transfer
    wire [<<bstrb>>:0]  HBSTRBM;    // Byte Lane strobe signal
//----------------------------- << end unalign >> ------------------------------
    wire  [3:0] HMASTERM;   // master_op ID
    wire        HMASTLOCKM; // Locked transfer
    wire        HREADYMUXM; // trans_opfer done
//---------------------------- << start user >> --------------------------------
    wire [<<user>>:0] HWUSERM;    // User data bus
//----------------------------- << end user >> ---------------------------------
    wire [<<data>>:0] HWDATAM;    // write_op data
    wire        HREADYOUTM; // HREADY feedback


// -----------------------------------------------------------------------------
// Signal declarations
// -----------------------------------------------------------------------------
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
    wire        req_port<<in>>;     // Port <<in>> request signal
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------

    wire  [<<idw_si>>:0] addr_in_port;   // addr_opess input port
    reg   [<<idw_si>>:0] data_in_port;   // Data input port
    wire        no_port;       // No port selected signal
    reg         slave_sel;     // Slave select signal

    reg         hsel_lock;     // Held HSELS during locked sequence
    wire        next_hsel_lock; // Pre-registered hsel_lock
    wire        hlock_arb;     // HMASTLOCK modified by HSEL for arbitration

    wire        i_hselm;       // Internal HSELM
    wire  [1:0] i_htransm;     // Internal HTRANSM
    wire  [2:0] i_hburstm;     // Internal HBURSTM
    wire        i_hreadymuxm;  // Internal HREADYMUXM
    wire        i_hmastlockm;  // Internal HMASTLOCKM


// -----------------------------------------------------------------------------
// Beginning of main code
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Port sel_opection
// -----------------------------------------------------------------------------

//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
  assign req_port<<in>> = held_tran_op<<in>> & sel_op<<in>>;
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------

  // Dummy arbiter instance for granting requests to this output stage
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


  // active_op signal combinatorial decode
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
  assign active_op<<in>> = (addr_in_port == <<idw_si_v>>'b<<bin_in>>) & !no_port;
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------

  // addr_opess/control output decode
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
  assign i_hselm     = (addr_in_port == <<idw_si_v>>'b<<bin_in>>) & sel_op<<in>> & !no_port;
  assign HADDRM      = ( (addr_in_port == <<idw_si_v>>'b<<bin_in>>) & !no_port ) ? addr_op<<in>> : {<<addr_v>>{1'b0}};
//---------------------------- << start user >> --------------------------------
  assign HAUSERM     = ( (addr_in_port == <<idw_si_v>>'b<<bin_in>>) & !no_port ) ? auser_op<<in>> : {<<user_v>>{1'b0}};
//----------------------------- << end user >> ---------------------------------
  assign i_htransm   = ( (addr_in_port == <<idw_si_v>>'b<<bin_in>>) & !no_port ) ? trans_op<<in>> : 2'b00;
  assign HWRITEM     = (addr_in_port == <<idw_si_v>>'b<<bin_in>>) & write_op<<in>> & !no_port;
  assign HSIZEM      = ( (addr_in_port == <<idw_si_v>>'b<<bin_in>>) & !no_port ) ? size_op<<in>> : 3'b000;
  assign i_hburstm    = ( (addr_in_port == <<idw_si_v>>'b<<bin_in>>) & !no_port ) ? burst_op<<in>> : 3'b000;
  assign HPROTM      = ( (addr_in_port == <<idw_si_v>>'b<<bin_in>>) & !no_port ) ? prot_op<<in>>  : {<<prot_v>>{1'b0}};
//---------------------------- << start unalign >> -----------------------------
  assign HUNALIGNM   = (addr_in_port == <<idw_si_v>>'b<<bin_in>>) & unalign_op<<in>> & !no_port;
  assign HBSTRBM     = ( (addr_in_port == <<idw_si_v>>'b<<bin_in>>) & !no_port ) ? bstrb_op<<in>> : {<<bstrb_v>>{1'b0}};
//----------------------------- << end unalign >> ------------------------------
  assign HMASTERM    = ( (addr_in_port == <<idw_si_v>>'b<<bin_in>>) & !no_port ) ? master_op<<in>> : 4'b0000;
  assign i_hmastlockm = (addr_in_port == <<idw_si_v>>'b<<bin_in>>) & mastlock_op<<in>> & !no_port;
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------

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
      if (!HRESETn)
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
      if (!HRESETn)
        data_in_port <= {<<idw_si_v>>{1'b0}};
      else
        if (i_hreadymuxm)
          data_in_port <= addr_in_port;
    end

  // HWDATAM output decode
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
  assign HWDATAM = ( data_in_port == <<idw_si_v>>'b<<bin_in>> ) ? wdata_op<<in>> : {<<data_v>>{1'b0}};
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------

//---------------------------- << start user >> --------------------------------
  // HWUSERM output decode
//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
  assign HWUSERM = ( data_in_port == <<idw_si_v>>'b<<bin_in>> ) ? wuser_op<<in>> : {<<user_v>>{1'b0}};
//------------------------------ << end connection >> --------------------------
//------------------------------- << end in >> ---------------------------------
//----------------------------- << end user >> ---------------------------------

  // ---------------------------------------------------------------------------
  // HREADYMUXM generation
  // ---------------------------------------------------------------------------
  // The HREADY signal on the shared slave is generated directly from
  //  the shared slave HREADYOUTS if the slave is selected, otherwise
  //  it mirrors the HREADY signal of the appropriate input port
  always @ (negedge HRESETn or posedge HCLK)
    begin : p_slave_sel_reg
      if (!HRESETn)
        slave_sel <= 1'b0;
      else
        if (i_hreadymuxm)
          slave_sel <= i_hselm;
    end

  // HREADYMUXM output selection
  assign i_hreadymuxm = (slave_sel) ? HREADYOUTM : 1'b1;

  // Drive output with internal version of the signal
  assign HREADYMUXM = i_hreadymuxm;


endmodule

// --================================= End ===================================--
