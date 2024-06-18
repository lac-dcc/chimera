// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : smc_veneer.v
//Title       : 
//Created     : 1999
//Description : 
//Notes       : 
//----------------------------------------------------------------------
//   Copyright 1999-2010 Cadence Design Systems, Inc.
//   All Rights Reserved Worldwide
//
//   Licensed under the Apache License, Version 2.0 (the
//   "License"); you may not use this file except in
//   compliance with the License.  You may obtain a copy of
//   the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in
//   writing, software distributed under the License is
//   distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
//   CONDITIONS OF ANY KIND, either express or implied.  See
//   the License for the specific language governing
//   permissions and limitations under the License.
//----------------------------------------------------------------------

 `include "smc_defs_lite.v"

//static memory controller
module smc_veneer (
                    //apb inputs
                    n_preset, 
                    pclk, 
                    psel, 
                    penable, 
                    pwrite, 
                    paddr, 
                    pwdata,
                    //ahb inputs                    
                    hclk,
                    n_sys_reset,
                    haddr,
                    htrans,
                    hsel,
                    hwrite,
                    hsize,
                    hwdata,
                    hready,
                    data_smc,
                    
                    //test signal inputs

                    scan_in_1,
                    scan_in_2,
                    scan_in_3,
                    scan_en,

                    //apb outputs                    
                    prdata,

                    //design output
                    
                    smc_hrdata, 
                    smc_hready,
                    smc_valid,
                    smc_hresp,
                    smc_addr,
                    smc_data, 
                    smc_n_be,
                    smc_n_cs,
                    smc_n_wr,                    
                    smc_n_we,
                    smc_n_rd,
                    smc_n_ext_oe,
                    smc_busy,

                    //test signal output

                    scan_out_1,
                    scan_out_2,
                    scan_out_3
                   );
// define parameters
// change using defaparam statements

  // APB Inputs (use is optional on INCLUDE_APB)
  input        n_preset;           // APBreset 
  input        pclk;               // APB clock
  input        psel;               // APB select
  input        penable;            // APB enable 
  input        pwrite;             // APB write strobe 
  input [4:0]  paddr;              // APB address bus
  input [31:0] pwdata;             // APB write data 

  // APB Output (use is optional on INCLUDE_APB)

  output [31:0] prdata;        //APB output


//System I/O

  input                    hclk;          // AHB System clock
  input                    n_sys_reset;   // AHB System reset (Active LOW)

//AHB I/O

  input  [31:0]            haddr;         // AHB Address
  input  [1:0]             htrans;        // AHB transfer type
  input                    hsel;          // chip selects
  input                    hwrite;        // AHB read/write indication
  input  [2:0]             hsize;         // AHB transfer size
  input  [31:0]            hwdata;        // AHB write data
  input                    hready;        // AHB Muxed ready signal

  
  output [31:0]            smc_hrdata;    // smc read data back to AHB master
  output                   smc_hready;    // smc ready signal
  output [1:0]             smc_hresp;     // AHB Response signal
  output                   smc_valid;     // Ack valid address

//External memory interface (EMI)

  output [31:0]            smc_addr;      // External Memory (EMI) address
  output [31:0]            smc_data;      // EMI write data
  input  [31:0]            data_smc;      // EMI read data
  output [3:0]             smc_n_be;      // EMI byte enables (Active LOW)
  output                   smc_n_cs;      // EMI Chip Selects (Active LOW)
  output [3:0]             smc_n_we;      // EMI write strobes (Active LOW)
  output                   smc_n_wr;      // EMI write enable (Active LOW)
  output                   smc_n_rd;      // EMI read stobe (Active LOW)
  output 	           smc_n_ext_oe;  // EMI write data output enable

//AHB Memory Interface Control

   output                   smc_busy;      // smc busy



//scan signals

   input                  scan_in_1;        //scan input
   input                  scan_in_2;        //scan input
   input                  scan_en;         //scan enable
   output                 scan_out_1;       //scan output
   output                 scan_out_2;       //scan output
// third scan chain only used on INCLUDE_APB
   input                  scan_in_3;        //scan input
   output                 scan_out_3;       //scan output

smc_lite i_smc_lite(
   //inputs
   //apb inputs
   .n_preset(n_preset),
   .pclk(pclk),
   .psel(psel),
   .penable(penable),
   .pwrite(pwrite),
   .paddr(paddr),
   .pwdata(pwdata),
   //ahb inputs
   .hclk(hclk),
   .n_sys_reset(n_sys_reset),
   .haddr(haddr),
   .htrans(htrans),
   .hsel(hsel),
   .hwrite(hwrite),
   .hsize(hsize),
   .hwdata(hwdata),
   .hready(hready),
   .data_smc(data_smc),


         //test signal inputs

   .scan_in_1(),
   .scan_in_2(),
   .scan_in_3(),
   .scan_en(scan_en),

   //apb outputs
   .prdata(prdata),

   //design output

   .smc_hrdata(smc_hrdata),
   .smc_hready(smc_hready),
   .smc_hresp(smc_hresp),
   .smc_valid(smc_valid),
   .smc_addr(smc_addr),
   .smc_data(smc_data),
   .smc_n_be(smc_n_be),
   .smc_n_cs(smc_n_cs),
   .smc_n_wr(smc_n_wr),
   .smc_n_we(smc_n_we),
   .smc_n_rd(smc_n_rd),
   .smc_n_ext_oe(smc_n_ext_oe),
   .smc_busy(smc_busy),

   //test signal output
   .scan_out_1(),
   .scan_out_2(),
   .scan_out_3()
);



//------------------------------------------------------------------------------
// AHB formal verification monitor
//------------------------------------------------------------------------------
  `ifdef SMC_ABV_ON

// psl assume_hready_in : assume always (hready == smc_hready) @(posedge hclk);

    ahb_liteslave_monitor i_ahbSlaveMonitor (
        .hclk_i(hclk),
        .hresetn_i(n_preset),
        .hresp(smc_hresp),
        .hready(smc_hready),
        .hready_global_i(smc_hready),
        .hrdata(smc_hrdata),
        .hwdata_i(hwdata),
        .hburst_i(3'b0),
        .hsize_i(hsize),
        .hwrite_i(hwrite),
        .htrans_i(htrans),
        .haddr_i(haddr),
        .hsel_i(|hsel)
    );


  ahb_litemaster_monitor i_ahbMasterMonitor (
          .hclk_i(hclk),
          .hresetn_i(n_preset),
          .hresp_i(smc_hresp),
          .hready_i(smc_hready),
          .hrdata_i(smc_hrdata),
          .hlock(1'b0),
          .hwdata(hwdata),
          .hprot(4'b0),
          .hburst(3'b0),
          .hsize(hsize),
          .hwrite(hwrite),
          .htrans(htrans),
          .haddr(haddr)
          );



  `endif



endmodule
