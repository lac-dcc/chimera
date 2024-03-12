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
//  Abstract            : BusMatrix is the top-level which connects together
//                        the required Input Stages, MatrixDecodes, Output
//                        Stages and Output Arbitration blocks.
//
//                        Supports the following configured options:
//
//                         - Architecture type '<<architecture_type>>',
//                         - <<total_si>> slave ports (connecting to masters),
//                         - <<total_mi>> master ports (connecting to slaves),
//                         - Routing address width of <<addr_v>> bits,
//                         - Routing data width of <<data_v>> bits,
//----------------------------- << start user >> -------------------------------
//                         - xUSER signal width of <<user_v>> bits,
//------------------------------ << end user >> --------------------------------
//---------------------------- << start unalign >> -----------------------------
//                         - ARMv6 AMBA extensions for unaligned access,
//----------------------------- << end unalign >> ------------------------------
//----------------------------- << start excl >> -------------------------------
//                         - ARMv6 AMBA extensions for exclusive access,
//------------------------------ << end excl >> --------------------------------
//                         - Arbiter type '<<arbiter_type>>',
//                         - Connectivity mapping:
//                             <<mappings>>,
//                         - Connectivity type '<<connectivity>>'.
//
//------------------------------------------------------------------------------

<<timescale_directive>>

module <<bus_matrix_name>> (

    // Common AHB signals
    HCLK,
    HRESETn,

    // System address remapping control
    REMAP,

//------------------------------ << start in >> --------------------------------
    // Input port SI<<in>> (inputs from master <<in>>)
    HSEL<<si_name>>,
    HADDR<<si_name>>,
    HTRANS<<si_name>>,
    HWRITE<<si_name>>,
    HSIZE<<si_name>>,
    HBURST<<si_name>>,
    HPROT<<si_name>>,
//---------------------------- << start unalign >> -----------------------------
    HUNALIGN<<si_name>>,
    HBSTRB<<si_name>>,
//----------------------------- << end unalign >> ------------------------------
    HMASTER<<si_name>>,
    HWDATA<<si_name>>,
    HMASTLOCK<<si_name>>,
    HREADY<<si_name>>,
//---------------------------- << start user >> --------------------------------
    HAUSER<<si_name>>,
    HWUSER<<si_name>>,
//----------------------------- << end user >> ---------------------------------

//------------------------------- << end in >> ---------------------------------
//----------------------------- << start out >> --------------------------------
    // Output port MI<<out>> (inputs from slave <<out>>)
    HRDATA<<mi_name>>,
    HREADYOUT<<mi_name>>,
    HRESP<<mi_name>>,
//---------------------------- << start user >> ------------------------------
    HRUSER<<mi_name>>,
//----------------------------- << end user >> -------------------------------

//------------------------------ << end out >> ---------------------------------
    // Scan test dummy signals; not connected until scan insertion
    SCANENABLE,   // Scan Test Mode Enable
    SCANINHCLK,   // Scan Chain Input


//----------------------------- << start out >> --------------------------------
    // Output port MI<<out>> (outputs to slave <<out>>)
    HSEL<<mi_name>>,
    HADDR<<mi_name>>,
    HTRANS<<mi_name>>,
    HWRITE<<mi_name>>,
    HSIZE<<mi_name>>,
    HBURST<<mi_name>>,
    HPROT<<mi_name>>,
//---------------------------- << start unalign >> -----------------------------
    HUNALIGN<<mi_name>>,
    HBSTRB<<mi_name>>,
//----------------------------- << end unalign >> ------------------------------
    HMASTER<<mi_name>>,
    HWDATA<<mi_name>>,
    HMASTLOCK<<mi_name>>,
    HREADYMUX<<mi_name>>,
//---------------------------- << start user >> --------------------------------
    HAUSER<<mi_name>>,
    HWUSER<<mi_name>>,
//----------------------------- << end user >> ---------------------------------

//------------------------------ << end out >> ---------------------------------
//------------------------------ << start in >> --------------------------------
    // Input port SI<<in>> (outputs to master <<in>>)
    HRDATA<<si_name>>,
    HREADYOUT<<si_name>>,
    HRESP<<si_name>>,
//---------------------------- << start user >> ------------------------------
    HRUSER<<si_name>>,
//----------------------------- << end user >> -------------------------------

//------------------------------- << end in >> ---------------------------------
    // Scan test dummy signals; not connected until scan insertion
    SCANOUTHCLK   // Scan Chain Output

    );


// -----------------------------------------------------------------------------
// Input and Output declarations
// -----------------------------------------------------------------------------

    // Common AHB signals
    input         HCLK;            // AHB System Clock
    input         HRESETn;         // AHB System Reset

    // System address remapping control
    input   [3:0] REMAP;           // REMAP input

//------------------------------ << start in >> --------------------------------
    // Input port SI<<in>> (inputs from master <<in>>)
    input         HSEL<<si_name>>;          // Slave Select
    input  [<<addr>>:0] HADDR<<si_name>>;         // Address bus
    input   [1:0] HTRANS<<si_name>>;        // Transfer type
    input         HWRITE<<si_name>>;        // Transfer direction
    input   [2:0] HSIZE<<si_name>>;         // Transfer size
    input   [2:0] HBURST<<si_name>>;        // Burst type
    input   [<<prot>>:0] HPROT<<si_name>>;         // Protection control
//---------------------------- << start unalign >> -----------------------------
    input         HUNALIGN<<si_name>>;      // Unalign signal
    input   [<<bstrb>>:0] HBSTRB<<si_name>>;        // Byte strobes
//----------------------------- << end unalign >> ------------------------------
    input   [3:0] HMASTER<<si_name>>;       // Master select
    input  [<<data>>:0] HWDATA<<si_name>>;        // Write data
    input         HMASTLOCK<<si_name>>;     // Locked Sequence
    input         HREADY<<si_name>>;        // Transfer done
//---------------------------- << start user >> --------------------------------
    input  [<<user>>:0] HAUSER<<si_name>>;        // Address USER signals
    input  [<<user>>:0] HWUSER<<si_name>>;        // Write-data USER signals
//----------------------------- << end user >> ---------------------------------

//------------------------------- << end in >> ---------------------------------
//----------------------------- << start out >> --------------------------------
    // Output port MI<<out>> (inputs from slave <<out>>)
    input  [<<data>>:0] HRDATA<<mi_name>>;        // Read data bus
    input         HREADYOUT<<mi_name>>;     // HREADY feedback
    input   [<<resp>>:0] HRESP<<mi_name>>;         // Transfer response
//---------------------------- << start user >> --------------------------------
    input  [<<user>>:0] HRUSER<<mi_name>>;        // Read-data USER signals
//----------------------------- << end user >> ---------------------------------

//------------------------------ << end out >> ---------------------------------
    // Scan test dummy signals; not connected until scan insertion
    input         SCANENABLE;      // Scan enable signal
    input         SCANINHCLK;      // HCLK scan input


//----------------------------- << start out >> --------------------------------
    // Output port MI<<out>> (outputs to slave <<out>>)
    output        HSEL<<mi_name>>;          // Slave Select
    output [<<addr>>:0] HADDR<<mi_name>>;         // Address bus
    output  [1:0] HTRANS<<mi_name>>;        // Transfer type
    output        HWRITE<<mi_name>>;        // Transfer direction
    output  [2:0] HSIZE<<mi_name>>;         // Transfer size
    output  [2:0] HBURST<<mi_name>>;        // Burst type
    output  [<<prot>>:0] HPROT<<mi_name>>;         // Protection control
//---------------------------- << start unalign >> -----------------------------
    output        HUNALIGN<<mi_name>>;      // Unalign signal
    output  [<<bstrb>>:0] HBSTRB<<mi_name>>;        // Byte strobes
//----------------------------- << end unalign >> ------------------------------
    output  [3:0] HMASTER<<mi_name>>;       // Master select
    output [<<data>>:0] HWDATA<<mi_name>>;        // Write data
    output        HMASTLOCK<<mi_name>>;     // Locked Sequence
    output        HREADYMUX<<mi_name>>;     // Transfer done
//---------------------------- << start user >> --------------------------------
    output [<<user>>:0] HAUSER<<mi_name>>;        // Address USER signals
    output [<<user>>:0] HWUSER<<mi_name>>;        // Write-data USER signals
//----------------------------- << end user >> ---------------------------------

//------------------------------ << end out >> ---------------------------------
//------------------------------ << start in >> --------------------------------
    // Input port SI<<in>> (outputs to master <<in>>)
    output [<<data>>:0] HRDATA<<si_name>>;        // Read data bus
    output        HREADYOUT<<si_name>>;     // HREADY feedback
    output  [<<resp>>:0] HRESP<<si_name>>;         // Transfer response
//---------------------------- << start user >> --------------------------------
    output [<<user>>:0] HRUSER<<si_name>>;        // Read-data USER signals
//----------------------------- << end user >> ---------------------------------

//------------------------------- << end in >> ---------------------------------
    // Scan test dummy signals; not connected until scan insertion
    output        SCANOUTHCLK;     // Scan Chain Output


// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------

    // Common AHB signals
    wire         HCLK;            // AHB System Clock
    wire         HRESETn;         // AHB System Reset

    // System address remapping control
    wire   [3:0] REMAP;           // REMAP signal

//------------------------------ << start in >> --------------------------------
    // Input Port SI<<in>>
    wire         HSEL<<si_name>>;          // Slave Select
    wire  [<<addr>>:0] HADDR<<si_name>>;         // Address bus
    wire   [1:0] HTRANS<<si_name>>;        // Transfer type
    wire         HWRITE<<si_name>>;        // Transfer direction
    wire   [2:0] HSIZE<<si_name>>;         // Transfer size
    wire   [2:0] HBURST<<si_name>>;        // Burst type
    wire   [<<prot>>:0] HPROT<<si_name>>;         // Protection control
//---------------------------- << start unalign >> -----------------------------
    wire         HUNALIGN<<si_name>>;      // Unalign signal
    wire   [<<bstrb>>:0] HBSTRB<<si_name>>;        // Byte strobes
//----------------------------- << end unalign >> ------------------------------
    wire   [3:0] HMASTER<<si_name>>;       // Master select
    wire  [<<data>>:0] HWDATA<<si_name>>;        // Write data
    wire         HMASTLOCK<<si_name>>;     // Locked Sequence
    wire         HREADY<<si_name>>;        // Transfer done

    wire  [<<data>>:0] HRDATA<<si_name>>;        // Read data bus
    wire         HREADYOUT<<si_name>>;     // HREADY feedback
    wire   [<<resp>>:0] HRESP<<si_name>>;         // Transfer response
//---------------------------- << start user >> --------------------------------
    wire  [<<user>>:0] HAUSER<<si_name>>;        // Address USER signals
    wire  [<<user>>:0] HWUSER<<si_name>>;        // Write-data USER signals
    wire  [<<user>>:0] HRUSER<<si_name>>;        // Read-data USER signals
//----------------------------- << end user >> ---------------------------------

//------------------------------- << end in >> ---------------------------------
//----------------------------- << start out >> --------------------------------
    // Output Port MI<<out>>
    wire         HSEL<<mi_name>>;          // Slave Select
    wire  [<<addr>>:0] HADDR<<mi_name>>;         // Address bus
    wire   [1:0] HTRANS<<mi_name>>;        // Transfer type
    wire         HWRITE<<mi_name>>;        // Transfer direction
    wire   [2:0] HSIZE<<mi_name>>;         // Transfer size
    wire   [2:0] HBURST<<mi_name>>;        // Burst type
    wire   [<<prot>>:0] HPROT<<mi_name>>;         // Protection control
//---------------------------- << start unalign >> -----------------------------
    wire         HUNALIGN<<mi_name>>;      // Unalign signal
    wire   [<<bstrb>>:0] HBSTRB<<mi_name>>;        // Byte strobes
//----------------------------- << end unalign >> ------------------------------
    wire   [3:0] HMASTER<<mi_name>>;       // Master select
    wire  [<<data>>:0] HWDATA<<mi_name>>;        // Write data
    wire         HMASTLOCK<<mi_name>>;     // Locked Sequence
    wire         HREADYMUX<<mi_name>>;     // Transfer done

    wire  [<<data>>:0] HRDATA<<mi_name>>;        // Read data bus
    wire         HREADYOUT<<mi_name>>;     // HREADY feedback
    wire   [<<resp>>:0] HRESP<<mi_name>>;         // Transfer response
//---------------------------- << start user >> --------------------------------
    wire  [<<user>>:0] HAUSER<<mi_name>>;        // Address USER signals
    wire  [<<user>>:0] HWUSER<<mi_name>>;        // Write-data USER signals
    wire  [<<user>>:0] HRUSER<<mi_name>>;        // Read-data USER signals
//----------------------------- << end user >> ---------------------------------

//------------------------------ << end out >> ---------------------------------

// -----------------------------------------------------------------------------
// Signal declarations
// -----------------------------------------------------------------------------
//----------------------------- << start in >> ---------------------------------

    // Bus-switch input SI<<in>>
    wire         i_sel<<in>>;            // HSEL signal
    wire  [<<addr>>:0] i_addr<<in>>;           // HADDR signal
    wire   [1:0] i_trans<<in>>;          // HTRANS signal
    wire         i_write<<in>>;          // HWRITE signal
    wire   [2:0] i_size<<in>>;           // HSIZE signal
    wire   [2:0] i_burst<<in>>;          // HBURST signal
    wire   [<<prot>>:0] i_prot<<in>>;           // HPROTS signal
//---------------------------- << start unalign >> -----------------------------
    wire         i_unalign<<in>>;        // HUNALIGN signal
    wire   [<<bstrb>>:0] i_bstrb<<in>>;          // HBSTRB signal
//----------------------------- << end unalign >> ------------------------------
    wire   [3:0] i_master<<in>>;         // HMASTER signal
    wire         i_mastlock<<in>>;       // HMASTLOCK signal
    wire         i_active<<in>>;         // Active signal
    wire         i_held_tran<<in>>;       // HeldTran signal
    wire         i_readyout<<in>>;       // Readyout signal
    wire   [<<resp>>:0] i_resp<<in>>;           // Response signal
//---------------------------- << start user >> --------------------------------
    wire  [<<user>>:0] i_auser<<in>>;          // HAUSER signal
//----------------------------- << end user >> ---------------------------------
//------------------------------ << end in >> ----------------------------------

//----------------------------- << start in >> ---------------------------------
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
    // Bus-switch SI<<in>> to MI<<out>> signals
    wire         i_sel<<in>>to<<out>>;         // Routing selection signal
    wire         i_active<<in>>to<<out>>;      // Active signal

//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
//------------------------------ << end in >> ----------------------------------
//----------------------------- << start out >> --------------------------------
    wire         i_hready_mux_<<mi_name_lc>>;    // Internal HREADYMUXM for MI<<out>>
//------------------------------ << end out >> ---------------------------------


// -----------------------------------------------------------------------------
// Beginning of main code
// -----------------------------------------------------------------------------

//----------------------------- << start in >> ---------------------------------
  // Input stage for SI<<in>>
  <<input_stage_name>> u_<<input_stage_name>>_<<in>> (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

    // Input Port Address/Control Signals
    .HSELS      (HSEL<<si_name>>),
    .HADDRS     (HADDR<<si_name>>),
    .HTRANSS    (HTRANS<<si_name>>),
    .HWRITES    (HWRITE<<si_name>>),
    .HSIZES     (HSIZE<<si_name>>),
    .HBURSTS    (HBURST<<si_name>>),
    .HPROTS     (HPROT<<si_name>>),
//---------------------------- << start unalign >> -----------------------------
    .HUNALIGNS  (HUNALIGN<<si_name>>),
    .HBSTRBS    (HBSTRB<<si_name>>),
//----------------------------- << end unalign >> ------------------------------
    .HMASTERS   (HMASTER<<si_name>>),
    .HMASTLOCKS (HMASTLOCK<<si_name>>),
    .HREADYS    (HREADY<<si_name>>),
//---------------------------- << start user >> --------------------------------
    .HAUSERS    (HAUSER<<si_name>>),
//----------------------------- << end user >> ---------------------------------

    // Internal Response
    .active_ip     (i_active<<in>>),
    .readyout_ip   (i_readyout<<in>>),
    .resp_ip       (i_resp<<in>>),

    // Input Port Response
    .HREADYOUTS (HREADYOUT<<si_name>>),
    .HRESPS     (HRESP<<si_name>>),

    // Internal Address/Control Signals
    .sel_ip        (i_sel<<in>>),
    .addr_ip       (i_addr<<in>>),
//---------------------------- << start user >> --------------------------------
    .auser_ip      (i_auser<<in>>),
//----------------------------- << end user >> ---------------------------------
    .trans_ip      (i_trans<<in>>),
    .write_ip      (i_write<<in>>),
    .size_ip       (i_size<<in>>),
    .burst_ip      (i_burst<<in>>),
    .prot_ip       (i_prot<<in>>),
//---------------------------- << start unalign >> -----------------------------
    .unalign_ip    (i_unalign<<in>>),
    .bstrb_ip      (i_bstrb<<in>>),
//----------------------------- << end unalign >> ------------------------------
    .master_ip     (i_master<<in>>),
    .mastlock_ip   (i_mastlock<<in>>),
    .held_tran_ip   (i_held_tran<<in>>)

    );


//------------------------------ << end in >> ----------------------------------
//------------------------------ << start in >> --------------------------------
  // Matrix decoder for SI<<in>>
  <<matrix_decode_name>> u_<<matrix_decode_name_lc>> (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

//---------------------------- << start remap >> -------------------------------
    // Internal address remapping control
    .remapping_dec  ( <<remapping_vector>> ),

//----------------------------- << end remap >> --------------------------------
    // Signals from Input stage SI<<in>>
    .HREADYS    (HREADY<<si_name>>),
    .sel_dec        (i_sel<<in>>),
    .decode_addr_dec (i_addr<<in>>[<<addr>>:10]),   // HADDR[9:0] is not decoded
    .trans_dec      (i_trans<<in>>),

//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
    // Control/Response for Output Stage MI<<out>>
    .active_dec<<out>>    (i_active<<in>>to<<out>>),
    .readyout_dec<<out>>  (i_hready_mux_<<mi_name_lc>>),
    .resp_dec<<out>>      (HRESP<<mi_name>>),
    .rdata_dec<<out>>     (HRDATA<<mi_name>>),
//---------------------------- << start user >> --------------------------------
    .ruser_dec<<out>>     (HRUSER<<mi_name>>),
//----------------------------- << end user >> ---------------------------------

//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------
//----------------------------- << start out >> --------------------------------
//----------------------------- << start connection >> -------------------------
    .sel_dec<<out>>       (i_sel<<in>>to<<out>>),
//------------------------------ << end connection >> --------------------------
//------------------------------ << end out >> ---------------------------------

    .active_dec     (i_active<<in>>),
    .HREADYOUTS (i_readyout<<in>>),
    .HRESPS     (i_resp<<in>>),
//---------------------------- << start user >> --------------------------------
    .HRUSERS    (HRUSER<<si_name>>),
//----------------------------- << end user >> ---------------------------------
    .HRDATAS    (HRDATA<<si_name>>)

    );


//------------------------------ << end in >> ----------------------------------
//----------------------------- << start out >> --------------------------------
  // Output stage for MI<<out>>
  <<output_stage_name>> u_<<output_stage_name_lc>>_<<out>> (

    // Common AHB signals
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),

//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
    // Port <<in>> Signals
    .sel_op<<in>>       (i_sel<<in>>to<<out>>),
    .addr_op<<in>>      (i_addr<<in>>),
//---------------------------- << start user >> --------------------------------
    .auser_op<<in>>     (i_auser<<in>>),
//----------------------------- << end user >> ---------------------------------
    .trans_op<<in>>     (i_trans<<in>>),
    .write_op<<in>>     (i_write<<in>>),
    .size_op<<in>>      (i_size<<in>>),
    .burst_op<<in>>     (i_burst<<in>>),
    .prot_op<<in>>      (i_prot<<in>>),
//---------------------------- << start unalign >> -----------------------------
    .unalign_op<<in>>   (i_unalign<<in>>),
    .bstrb_op<<in>>     (i_bstrb<<in>>),
//----------------------------- << end unalign >> ------------------------------
    .master_op<<in>>    (i_master<<in>>),
    .mastlock_op<<in>>  (i_mastlock<<in>>),
    .wdata_op<<in>>     (HWDATA<<si_name>>),
//---------------------------- << start user >> --------------------------------
    .wuser_op<<in>>     (HWUSER<<si_name>>),
//----------------------------- << end user >> ---------------------------------
    .held_tran_op<<in>>  (i_held_tran<<in>>),

//------------------------------ << end connection >> --------------------------
//------------------------------ << end in >> ----------------------------------
    // Slave read data and response
    .HREADYOUTM (HREADYOUT<<mi_name>>),

//------------------------------ << start in >> --------------------------------
//----------------------------- << start connection >> -------------------------
    .active_op<<in>>    (i_active<<in>>to<<out>>),
//------------------------------ << end connection >> --------------------------
//------------------------------ << end in >> ----------------------------------

    // Slave Address/Control Signals
    .HSELM      (HSEL<<mi_name>>),
    .HADDRM     (HADDR<<mi_name>>),
//---------------------------- << start user >> --------------------------------
    .HAUSERM    (HAUSER<<mi_name>>),
//----------------------------- << end user >> ---------------------------------
    .HTRANSM    (HTRANS<<mi_name>>),
    .HWRITEM    (HWRITE<<mi_name>>),
    .HSIZEM     (HSIZE<<mi_name>>),
    .HBURSTM    (HBURST<<mi_name>>),
    .HPROTM     (HPROT<<mi_name>>),
//---------------------------- << start unalign >> -----------------------------
    .HUNALIGNM  (HUNALIGN<<mi_name>>),
    .HBSTRBM    (HBSTRB<<mi_name>>),
//----------------------------- << end unalign >> ------------------------------
    .HMASTERM   (HMASTER<<mi_name>>),
    .HMASTLOCKM (HMASTLOCK<<mi_name>>),
    .HREADYMUXM (i_hready_mux_<<mi_name_lc>>),
//---------------------------- << start user >> --------------------------------
    .HWUSERM    (HWUSER<<mi_name>>),
//----------------------------- << end user >> ---------------------------------
    .HWDATAM    (HWDATA<<mi_name>>)

    );

  // Drive output with internal version
  assign HREADYMUX<<mi_name>> = i_hready_mux_<<mi_name_lc>>;


//------------------------------ << end out >> ---------------------------------
endmodule

// --================================= End ===================================--
