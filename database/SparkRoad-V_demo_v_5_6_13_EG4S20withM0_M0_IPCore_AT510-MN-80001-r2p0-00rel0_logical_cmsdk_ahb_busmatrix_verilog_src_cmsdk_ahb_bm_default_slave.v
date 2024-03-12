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
//      Checked In          : $Date: 2013-01-23 11:45:45 +0000 (Wed, 23 Jan 2013) $
//
//      Revision            : $Revision: 234562 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-01rel0
//
//-----------------------------------------------------------------------------
//
// -----------------------------------------------------------------------------
// Abstract            : Default slave used to drive the slave response signals
//                       when there are no other slaves selected.
//-----------------------------------------------------------------------------

<<timescale_directive>>

module <<default_slave_name>> (

    // Common AHB signals
    HCLK,
    HRESETn,

    // AHB control input signals
    HSEL,
    HTRANS,
    HREADY,

    // AHB control output signals
    HREADYOUT,
    HRESP

    );


// -----------------------------------------------------------------------------
// Input and Output declarations
// -----------------------------------------------------------------------------

    // Common AHB signals
    input         HCLK;           // AHB System Clock
    input         HRESETn;        // AHB System Reset

    // AHB control input signals
    input         HSEL;           // Slave Select
    input  [1:0]  HTRANS;         // Transfer type
    input         HREADY;         // Transfer done

    // AHB control output signals
    output        HREADYOUT;      // HREADY feedback
    output  [<<resp>>:0] HRESP;          // Transfer response


// -----------------------------------------------------------------------------
// Constant declarations
// -----------------------------------------------------------------------------

// HRESP transfer response signal encoding
`define RSP_OKAY    <<resp_v>>'b<<bin_resp_okay>>      // OKAY response
`define RSP_ERROR   <<resp_v>>'b<<bin_resp_error>>     // ERROR response
`define RSP_RETRY   <<resp_v>>'b<<bin_resp_retry>>     // RETRY response
`define RSP_SPLIT   <<resp_v>>'b<<bin_resp_split>>     // SPLIT response
//----------------------------- << start excl >> -------------------------------
`define RSP_XFAIL   <<resp_v>>'b<<bin_resp_xfail>>;    // XFAIL response
//------------------------------ << end excl >> --------------------------------


// -----------------------------------------------------------------------------
// Input and Output declarations
// -----------------------------------------------------------------------------

    // Common AHB signals
    wire          HCLK;           // AHB System Clock
    wire          HRESETn;        // AHB System Reset

    // AHB control input signals
    wire          HSEL;           // Slave Select
    wire    [1:0] HTRANS;         // Transfer type
    wire          HREADY;         // Transfer done

    // AHB control output signals
    wire          HREADYOUT;      // HREADY feedback
    wire    [<<resp>>:0] HRESP;          // Transfer response


// -----------------------------------------------------------------------------
// Signal declarations
// -----------------------------------------------------------------------------

    wire          invalid;    // Set during invalid transfer
    wire          hready_next; // Controls generation of HREADYOUT output
    reg           i_hreadyout; // HREADYOUT register
    wire    [<<resp>>:0] hresp_next;  // Generated response
    reg     [<<resp>>:0] i_hresp;     // HRESP register


// -----------------------------------------------------------------------------
// Beginning of main code
// -----------------------------------------------------------------------------

  assign invalid = ( HREADY & HSEL & HTRANS[1] );
  assign hready_next = i_hreadyout ?  ~invalid : 1'b1 ;
  assign hresp_next = invalid ? `RSP_ERROR : `RSP_OKAY;

  always @(negedge HRESETn or posedge HCLK)
    begin : p_resp_seq
      if (~HRESETn)
        begin
          i_hreadyout <= 1'b1;
          i_hresp     <= `RSP_OKAY;
        end
      else
        begin
          i_hreadyout <= hready_next;

          if (i_hreadyout)
            i_hresp <= hresp_next;
        end
    end

  // Drive outputs with internal versions
  assign HREADYOUT = i_hreadyout;
  assign HRESP     = i_hresp;


endmodule

// --================================= End ===================================--
