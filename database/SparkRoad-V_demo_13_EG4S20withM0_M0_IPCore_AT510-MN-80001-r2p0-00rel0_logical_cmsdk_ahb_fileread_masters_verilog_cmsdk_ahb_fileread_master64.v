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
//      Checked In          : $Date: 2012-08-02 16:13:05 +0100 (Thu, 02 Aug 2012) $
//
//      Revision            : $Revision: 217495 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : 64-bit AHB File Reader Bus Master
//-----------------------------------------------------------------------------
// ----------------------------------------------------------------------------
//  Purpose             : This module ties together the sub blocks that
//                        form the 64-bit File Reader Bus Master, namely an
//                        AHB-Lite File Reader Core and a wrapper logic.
// --========================================================================--
//  Note
//                        This top level file converts AHB Lite extension
//                        signals in ARM1136 to sideband signals used in
//                        Cortex-M3/M4
// --========================================================================--

`timescale 1ns/1ps

module cmsdk_ahb_fileread_master64 #(

  parameter  InputFileName = "filestim.m2d",  // stimulus data file name
  parameter  MessageTag    = "FileReader:",   // tag on each FileReader message
  parameter  StimArraySize = 5000)            // stimulus data array size:
                                              //  should be large enough to hold
                                              //  entire stimulus data file
 (
  // system ports
  input  wire         HCLK,          //  system clock
  input  wire         HRESETn,       //  system reset

  // AHB ports
  input  wire         HREADY,        //  slave ready signal
  input  wire         HRESP,         //  slave response bus
  input  wire [63:0]  HRDATA,        //  data, slave to master
  input  wire         EXRESP,        //  Exclusive response (tie low if not used)

  output wire [1:0]   HTRANS,        //  transfer type
  output wire [2:0]   HBURST,        //  burst type
  output wire [3:0]   HPROT,         //  transfer protection
  output wire         EXREQ,         //  Exclusive access request
  output wire [1:0]   MEMATTR,       //  Memory attribute
  output wire [2:0]   HSIZE,         //  transfer size
  output wire         HWRITE,        //  transfer direction
  output wire         HMASTLOCK,     //  transfer is locked
  output wire [31:0]  HADDR,         //  transfer address
  output wire [63:0]  HWDATA,        //  data, master to slave

  output wire [31:0]  LINENUM);      //  line number in stimulus file

  // Internal AHB-Lite Bus Signals
  wire   [2:0]   hresp_core;    //  slave response
  wire   [5:0]   hprot_core;    //  transfer protection

//------------------------------------------------------------------------------
// structural
//------------------------------------------------------------------------------

  // Instance of AHB-Lite File Reader connected to internal AHB-Lite system
  cmsdk_ahb_filereadcore
    #(.input_filename(InputFileName), .message_tag(MessageTag), .stim_array_size(StimArraySize))
    u_ahb_filereadcore    (

    .HCLK           (HCLK),
    .HRESETn        (HRESETn),

    .HREADY         (HREADY),
    .HRESP          (hresp_core),
    .HRDATA         (HRDATA),

    .HTRANS         (HTRANS),
    .HBURST         (HBURST),
    .HPROT          (hprot_core),
    .HSIZE          (HSIZE),
    .HWRITE         (HWRITE),
    .HMASTLOCK      (HMASTLOCK),
    .HADDR          (HADDR),
    .HWDATA         (HWDATA),
    .HUNALIGN       (),
    .HBSTRB         (),
    .LINENUM        (LINENUM)
    );

  // Convert internal versions of port signals
  assign HPROT          = hprot_core[3:0];
  assign EXREQ          = hprot_core[5];
  assign MEMATTR        = {1'b0, hprot_core[4]};

  assign hresp_core     = {EXRESP, 1'b0,HRESP};       // Drive unused bit of hresp_core

endmodule

// --================================ End ==================================--

