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
//  Abstract            : BusMatrixLite is a wrapper module that wraps around
//                        the BusMatrix module to give AHB Lite compliant
//                        slave and master interfaces.
//
//-----------------------------------------------------------------------------

<<timescale_directive>>

module <<component_name>> (

    // Common AHB signals
    HCLK,
    HRESETn,

    // System Address Remap control
    REMAP,

//------------------------------ << start in >> --------------------------------
    // Input port SI<<in>> (inputs from master <<in>>)
    HADDR<<si_name>>,
    HTRANS<<si_name>>,
    HWRITE<<si_name>>,
    HSIZE<<si_name>>,
    HBURST<<si_name>>,
    HPROT<<si_name>>,
    HWDATA<<si_name>>,
    HMASTLOCK<<si_name>>,
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
    HREADY<<si_name>>,
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

    // System Address Remap control
    input   [3:0] REMAP;           // System Address REMAP control

//------------------------------ << start in >> --------------------------------
    // Input port SI<<in>> (inputs from master <<in>>)
    input  [<<addr>>:0] HADDR<<si_name>>;         // Address bus
    input   [1:0] HTRANS<<si_name>>;        // Transfer type
    input         HWRITE<<si_name>>;        // Transfer direction
    input   [2:0] HSIZE<<si_name>>;         // Transfer size
    input   [2:0] HBURST<<si_name>>;        // Burst type
    input   [<<prot>>:0] HPROT<<si_name>>;         // Protection control
    input  [<<data>>:0] HWDATA<<si_name>>;        // Write data
    input         HMASTLOCK<<si_name>>;     // Locked Sequence
//---------------------------- << start user >> --------------------------------
    input  [<<user>>:0] HAUSER<<si_name>>;        // Address USER signals
    input  [<<user>>:0] HWUSER<<si_name>>;        // Write-data USER signals
//----------------------------- << end user >> ---------------------------------

//------------------------------- << end in >> ---------------------------------
//----------------------------- << start out >> --------------------------------
    // Output port MI<<out>> (inputs from slave <<out>>)
    input  [<<data>>:0] HRDATA<<mi_name>>;        // Read data bus
    input         HREADYOUT<<mi_name>>;     // HREADY feedback
    input         HRESP<<mi_name>>;         // Transfer response
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
    output        HREADY<<si_name>>;     // HREADY feedback
    output        HRESP<<si_name>>;         // Transfer response
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

    // System Address Remap control
    wire   [3:0] REMAP;           // System REMAP signal

//------------------------------ << start in >> --------------------------------
    // Input Port SI<<in>>
    wire  [<<addr>>:0] HADDR<<si_name>>;         // Address bus
    wire   [1:0] HTRANS<<si_name>>;        // Transfer type
    wire         HWRITE<<si_name>>;        // Transfer direction
    wire   [2:0] HSIZE<<si_name>>;         // Transfer size
    wire   [2:0] HBURST<<si_name>>;        // Burst type
    wire   [<<prot>>:0] HPROT<<si_name>>;         // Protection control
    wire  [<<data>>:0] HWDATA<<si_name>>;        // Write data
    wire         HMASTLOCK<<si_name>>;     // Locked Sequence

    wire  [<<data>>:0] HRDATA<<si_name>>;        // Read data bus
    wire         HREADY<<si_name>>;     // HREADY feedback
    wire         HRESP<<si_name>>;         // Transfer response
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
    wire  [<<data>>:0] HWDATA<<mi_name>>;        // Write data
    wire         HMASTLOCK<<mi_name>>;     // Locked Sequence
    wire         HREADYMUX<<mi_name>>;     // Transfer done

    wire  [<<data>>:0] HRDATA<<mi_name>>;        // Read data bus
    wire         HREADYOUT<<mi_name>>;     // HREADY feedback
    wire         HRESP<<mi_name>>;         // Transfer response
//---------------------------- << start user >> --------------------------------
    wire  [<<user>>:0] HAUSER<<mi_name>>;        // Address USER signals
    wire  [<<user>>:0] HWUSER<<mi_name>>;        // Write-data USER signals
    wire  [<<user>>:0] HRUSER<<mi_name>>;        // Read-data USER signals
//----------------------------- << end user >> ---------------------------------

//------------------------------ << end out >> ---------------------------------

// -----------------------------------------------------------------------------
// Signal declarations
// -----------------------------------------------------------------------------
    wire   [3:0] tie_hi_4;
    wire         tie_hi;
    wire         tie_low;
//------------------------------ << start in >> --------------------------------
    wire   [<<resp>>:0] i_hresp<<si_name>>;
//------------------------------- << end in >> ---------------------------------

//----------------------------- << start out >> --------------------------------
    wire   [3:0]        i_hmaster<<mi_name>>;
    wire   [<<resp>>:0] i_hresp<<mi_name>>;
//------------------------------ << end out >> ---------------------------------

// -----------------------------------------------------------------------------
// Beginning of main code
// -----------------------------------------------------------------------------

    assign tie_hi   = 1'b1;
    assign tie_hi_4 = 4'b1111;
    assign tie_low  = 1'b0;

//------------------------------ << start in >> --------------------------------

    assign HRESP<<si_name>>  = i_hresp<<si_name>>[0];
//------------------------------- << end in >> ---------------------------------

//----------------------------- << start out >> --------------------------------
    assign i_hresp<<mi_name>> = {tie_low, HRESP<<mi_name>>};
//------------------------------ << end out >> ---------------------------------

// BusMatrix instance
  <<bus_matrix_name>> u<<bus_matrix_name>> (
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),
    .REMAP      (REMAP),

//------------------------------ << start in >> --------------------------------
    // Input port SI<<in>> signals
    .HSEL<<si_name>>       (tie_hi),
    .HADDR<<si_name>>      (HADDR<<si_name>>),
    .HTRANS<<si_name>>     (HTRANS<<si_name>>),
    .HWRITE<<si_name>>     (HWRITE<<si_name>>),
    .HSIZE<<si_name>>      (HSIZE<<si_name>>),
    .HBURST<<si_name>>     (HBURST<<si_name>>),
    .HPROT<<si_name>>      (HPROT<<si_name>>),
    .HWDATA<<si_name>>     (HWDATA<<si_name>>),
    .HMASTLOCK<<si_name>>  (HMASTLOCK<<si_name>>),
    .HMASTER<<si_name>>    (tie_hi_4),
    .HREADY<<si_name>>     (HREADY<<si_name>>),
//---------------------------- << start user >> --------------------------------
    .HAUSER<<si_name>>     (HAUSER<<si_name>>),
    .HWUSER<<si_name>>     (HWUSER<<si_name>>),
//----------------------------- << end user >> ---------------------------------
    .HRDATA<<si_name>>     (HRDATA<<si_name>>),
    .HREADYOUT<<si_name>>  (HREADY<<si_name>>),
    .HRESP<<si_name>>      (i_hresp<<si_name>>),
//---------------------------- << start user >> ------------------------------
    .HRUSER<<si_name>>     (HRUSER<<si_name>>),
//----------------------------- << end user >> -------------------------------

//------------------------------- << end in >> ---------------------------------

//----------------------------- << start out >> --------------------------------
    // Output port MI<<out>> signals
    .HSEL<<mi_name>>       (HSEL<<mi_name>>),
    .HADDR<<mi_name>>      (HADDR<<mi_name>>),
    .HTRANS<<mi_name>>     (HTRANS<<mi_name>>),
    .HWRITE<<mi_name>>     (HWRITE<<mi_name>>),
    .HSIZE<<mi_name>>      (HSIZE<<mi_name>>),
    .HBURST<<mi_name>>     (HBURST<<mi_name>>),
    .HPROT<<mi_name>>      (HPROT<<mi_name>>),
    .HWDATA<<mi_name>>     (HWDATA<<mi_name>>),
    .HMASTER<<mi_name>>    (i_hmaster<<mi_name>>),
    .HMASTLOCK<<mi_name>>  (HMASTLOCK<<mi_name>>),
    .HREADYMUX<<mi_name>>  (HREADYMUX<<mi_name>>),
//---------------------------- << start user >> --------------------------------
    .HAUSER<<mi_name>>     (HAUSER<<mi_name>>),
    .HWUSER<<mi_name>>     (HWUSER<<mi_name>>),
//----------------------------- << end user >> ---------------------------------
    .HRDATA<<mi_name>>     (HRDATA<<mi_name>>),
    .HREADYOUT<<mi_name>>  (HREADYOUT<<mi_name>>),
    .HRESP<<mi_name>>      (i_hresp<<mi_name>>),
//---------------------------- << start user >> ------------------------------
    .HRUSER<<mi_name>>     (HRUSER<<mi_name>>),
//----------------------------- << end user >> -------------------------------

//------------------------------ << end out >> ---------------------------------

    // Scan test dummy signals; not connected until scan insertion
    .SCANENABLE            (SCANENABLE),
    .SCANINHCLK            (SCANINHCLK),
    .SCANOUTHCLK           (SCANOUTHCLK)
  );


endmodule
