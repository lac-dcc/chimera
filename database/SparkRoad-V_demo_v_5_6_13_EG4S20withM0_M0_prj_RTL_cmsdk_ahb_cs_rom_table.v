//------------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2010-2015 ARM Limited or its affiliates.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited or its affiliates.
//
//  Version and Release Control Information:
//
//  File Revision       : $Revision: 368442 $
//  File Date           : $Date: 2017-07-25 15:07:59 +0100 (Tue, 25 Jul 2017) $
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//------------------------------------------------------------------------------
// Verilog-2001 (IEEE Std 1364-2001)
//------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------
//     This block implements a Generic 4-entry AHB CoreSight ROM Table
//-----------------------------------------------------------------------------
//
// This example block occupies an 4kB space on the AHB bus at the address
// specified by the BASE[31:0] parameter.
//
//  BASE[31:0] + 0x1000 +--------------------------------------+
//                      | CID: CoreSight ROM Table             |
//                      |--------------------------------------|
//                      | PID: Manufacturer and Partnumber     |
//                      |--------------------------------------|
//                      .                                      .
//                      .                                      .
//                      .                                      .
//                      |--------------------------------------|
//                      | Fourth Entry                         |
//  BASE[31:0] + 0xC    |--------------------------------------|
//                      | Third Entry                          |
//  BASE[31:0] + 0x8    |--------------------------------------|
//                      | Second Entry                         |
//  BASE[31:0] + 0x4    |--------------------------------------|
//                      | First Entry                          |
//  BASE[31:0]          +--------------------------------------+
//
//
// The ROM table allows debug tools to identify the CoreSight components in
// a SoC or subsystem, and to identify the manufacturer and part and revision
// information for the SoC or subsystem.
// The PID fields include the manufacturer's JEDEC JEP106 identity code and
// manufacturer-defined partnumber and revision values.
//
// Considerations:
//
// To allow debug tools to discover the ROM table, it must be pointed to by
// another ROM table in the system, or by the BASEADDR pointer in the DAP.
//
// The ROM table contents must contain correct ID values. To allow for late
// changes (e.g. metal fixes) to be identified from the ID values, the
// ECOREVNUM bus should be easily identifiable and modifiable.
//-----------------------------------------------------------------------------

module cmsdk_ahb_cs_rom_table
  #(
    // ------------------------------------------------------------
    // ROM Table BASE Address
    // ------------------------------------------------------------
    parameter [31:0]   BASE = 32'h00000000,

    // ------------------------------------------------------------
    // ROM Table Manufacturer, Part Number and Revision
    // ------------------------------------------------------------
    parameter [6:0]    JEPID           = 7'b0000000, // JEP106 identity code
    parameter [3:0]    JEPCONTINUATION = 4'h0,       // number of JEP106
                                                     // continuation codes
    parameter [11:0]   PARTNUMBER      = 12'h000,    // part number
    parameter [3:0]    REVISION        = 4'h0,       // part revision

    // ------------------------------------------------------------
    // ROM Table entries: (Base Address | Present)
    // ------------------------------------------------------------
    parameter [31:0]   ENTRY0BASEADDR = 32'h00000000,
    parameter          ENTRY0PRESENT  = 1'b0,

    parameter [31:0]   ENTRY1BASEADDR = 32'h00000000,
    parameter          ENTRY1PRESENT  = 1'b0,

    parameter [31:0]   ENTRY2BASEADDR = 32'h00000000,
    parameter          ENTRY2PRESENT  = 1'b0,

    parameter [31:0]   ENTRY3BASEADDR = 32'h00000000,
    parameter          ENTRY3PRESENT  = 1'b0
    )
   (
    input wire         HCLK,                 // AHB clock
    input wire         HSEL,                 // AHB select
    input wire  [31:0] HADDR,                // AHB address
    input wire  [ 2:0] HBURST,               // AHB burst
    input wire         HMASTLOCK,            // AHB lock
    input wire  [ 3:0] HPROT,                // AHB prot
    input wire  [ 2:0] HSIZE,                // AHB size
    input wire  [ 1:0] HTRANS,               // AHB transfer
    input wire  [31:0] HWDATA,               // AHB write data
    input wire         HWRITE,               // AHB write
    input wire         HREADY,               // AHB ready
    input wire  [ 3:0] ECOREVNUM,            // part minor revision (metal fix)
    output wire [31:0] HRDATA,               // AHB read-data
    output wire        HRESP,                // AHB response
    output wire        HREADYOUT);           // AHB ready out

   // ------------------------------------------------------------
   // Local wires
   // ------------------------------------------------------------
   reg  [ 9:0] haddr_reg;
   wire [31:0] rdata;


   // ------------------------------------------------------------
   // ROM Tables
   // ------------------------------------------------------------

   //
   // ROM Table Entry Calculation:
   //
   // Ref: ARM IHI0029B CoreSight Architecture Specification
   //
   // ROM table entry format:
   // [31:12] Address Offset. Base address of highest 4KB block relative to ROM
   //         table address.
   // [11: 2] RESERVED, RAZ
   //     [1] Format. 1=32-bit format
   //     [0] Entry Present.
   //
   // ComponentAddress = ROMAddress + (AddressOffset SHL 12)
   //

   // Calculate address offset values
   localparam [19:0] ENTRY0OFFSET = ENTRY0BASEADDR[31:12] - BASE[31:12];
   localparam [19:0] ENTRY1OFFSET = ENTRY1BASEADDR[31:12] - BASE[31:12];
   localparam [19:0] ENTRY2OFFSET = ENTRY2BASEADDR[31:12] - BASE[31:12];
   localparam [19:0] ENTRY3OFFSET = ENTRY3BASEADDR[31:12] - BASE[31:12];

   // Construct entries
   localparam [31:0] ENTRY0 = { ENTRY0OFFSET, 10'b0, 1'b1, ENTRY0PRESENT!=0 };
   localparam [31:0] ENTRY1 = { ENTRY1OFFSET, 10'b0, 1'b1, ENTRY1PRESENT!=0 };
   localparam [31:0] ENTRY2 = { ENTRY2OFFSET, 10'b0, 1'b1, ENTRY2PRESENT!=0 };
   localparam [31:0] ENTRY3 = { ENTRY3OFFSET, 10'b0, 1'b1, ENTRY3PRESENT!=0 };


   // ------------------------------------------------------------
   // AHB Interface
   // ------------------------------------------------------------
   wire       trans_valid = HSEL & HTRANS[1] & HREADY;

   always @(posedge HCLK)
     if (trans_valid)
       haddr_reg[9:0] <= HADDR[11:2];

   assign     HREADYOUT = 1'b1;
   assign     HRDATA    = rdata;
   assign     HRESP     = 1'b0;

   wire [11:0] word_addr = {haddr_reg, 2'b00};

   // Make unused AHB-Lite signals obvious for Lint purposes
   wire [66:0] unused = { HADDR[31:12], HADDR[1:0], HBURST[2:0], HMASTLOCK,
                          HPROT[3:0], HSIZE[2:0], HTRANS[0], HWDATA[31:0],
                          HWRITE };


   // ------------------------------------------------------------
   // ROM Table Content
   // ------------------------------------------------------------

   wire       cid3_en         = (word_addr[11:0] == 12'hFFC);
   wire       cid2_en         = (word_addr[11:0] == 12'hFF8);
   wire       cid1_en         = (word_addr[11:0] == 12'hFF4);
   wire       cid0_en         = (word_addr[11:0] == 12'hFF0);

   wire       pid7_en         = (word_addr[11:0] == 12'hFDC);
   wire       pid6_en         = (word_addr[11:0] == 12'hFD8);
   wire       pid5_en         = (word_addr[11:0] == 12'hFD4);
   wire       pid4_en         = (word_addr[11:0] == 12'hFD0);
   wire       pid3_en         = (word_addr[11:0] == 12'hFEC);
   wire       pid2_en         = (word_addr[11:0] == 12'hFE8);
   wire       pid1_en         = (word_addr[11:0] == 12'hFE4);
   wire       pid0_en         = (word_addr[11:0] == 12'hFE0);

   wire       systemaccess_en = (word_addr[11:0] == 12'hFCC);

   wire       entry0_en       = (word_addr[11:0] == 12'h000);
   wire       entry1_en       = (word_addr[11:0] == 12'h004);
   wire       entry2_en       = (word_addr[11:0] == 12'h008);
   wire       entry3_en       = (word_addr[11:0] == 12'h00C);

   wire [7:0] ids =
              ( ( {8{cid3_en}} & 8'hB1 ) | // CID3 : Rom Table
                ( {8{cid2_en}} & 8'h05 ) | // CID2 : Rom Table
                ( {8{cid1_en}} & 8'h10 ) | // CID1 : Rom Table
                ( {8{cid0_en}} & 8'h0D ) | // CID0 : Rom Table

                ( {8{pid7_en}} & 8'h00 ) | // PID7 : RESERVED
                ( {8{pid6_en}} & 8'h00 ) | // PID6 : RESERVED
                ( {8{pid5_en}} & 8'h00 ) | // PID5 : RESERVED
                ( {8{pid4_en}} & { {4{1'b0}}, JEPCONTINUATION[3:0] } ) |
                ( {8{pid3_en}} & { ECOREVNUM[3:0], {4{1'b0}} } ) |
                ( {8{pid2_en}} & { REVISION[3:0], 1'b1, JEPID[6:4] } ) |
                ( {8{pid1_en}} & { JEPID[3:0], PARTNUMBER[11:8] } ) |
                ( {8{pid0_en}} &   PARTNUMBER[7:0] )
                );

   //
   // Assign Read Data. Default value of 32'h00000000
   // corresponds to the End Of Table marker.
   //
   assign     rdata[31:0] =
              ( ( {{24{1'b0}}, ids[7:0] } )              |
                ( {32{systemaccess_en}} & 32'h00000001 ) |
                // Pointers to CoreSight Components
                ( {32{entry0_en}} & ENTRY0[31:0] )       |
                ( {32{entry1_en}} & ENTRY1[31:0] )       |
                ( {32{entry2_en}} & ENTRY2[31:0] )       |
                ( {32{entry3_en}} & ENTRY3[31:0] )
                );

   // -------------------------------------------------------------------------

`ifdef ARM_ASSERT_ON

   // -------------------------------------------------------------------------
   // Assertions
   // -------------------------------------------------------------------------

   `include "std_ovl_defines.h"


   // Addresses must always be 4KB aligned
   assert_never
     #(`OVL_FATAL,`OVL_ASSERT,"Rom Table BASE must be 4K aligned")
   u_asrt_rom_table_base_alignment
     (.clk(HCLK), .reset_n(1'b1), .test_expr(|BASE[11:0]));

   // Addresses must always be 4KB aligned
   assert_never
     #(`OVL_FATAL,`OVL_ASSERT,"Rom Table ENTRY0BASEADDR must be 4K aligned")
   u_asrt_rom_table_entry0_alignment
     (.clk(HCLK), .reset_n(1'b1), .test_expr(|ENTRY0BASEADDR[11:0]));

   // Addresses must always be 4KB aligned
   assert_never
     #(`OVL_FATAL,`OVL_ASSERT,"Rom Table ENTRY1BASEADDR must be 4K aligned")
   u_asrt_rom_table_entry1_alignment
     (.clk(HCLK), .reset_n(1'b1), .test_expr(|ENTRY1BASEADDR[11:0]));

   // Addresses must always be 4KB aligned
   assert_never
     #(`OVL_FATAL,`OVL_ASSERT,"Rom Table ENTRY2BASEADDR must be 4K aligned")
   u_asrt_rom_table_entry2_alignment
     (.clk(HCLK), .reset_n(1'b1), .test_expr(|ENTRY2BASEADDR[11:0]));

   // Addresses must always be 4KB aligned
   assert_never
     #(`OVL_FATAL,`OVL_ASSERT,"Rom Table ENTRY3BASEADDR must be 4K aligned")
   u_asrt_rom_table_entry3_alignment
     (.clk(HCLK), .reset_n(1'b1), .test_expr(|ENTRY3BASEADDR[11:0]));

`endif

endmodule
