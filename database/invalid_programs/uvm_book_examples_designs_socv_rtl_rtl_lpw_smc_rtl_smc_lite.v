// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : smc_lite.v
//Title       : SMC top level
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
module          smc_lite(
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
  input               hsel;          // chip selects
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
  output             smc_n_cs;      // EMI Chip Selects (Active LOW)
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
   
//----------------------------------------------------------------------
// Signal declarations
//----------------------------------------------------------------------

// Bus Interface
   
  wire  [31:0]   smc_hrdata;         //smc read data back to AHB master
  wire           smc_hready;         //smc ready signal
  wire  [1:0]    smc_hresp;          //AHB Response signal
  wire           smc_valid;          //Ack valid address

// MAC

  wire [31:0]    smc_data;           //Data to external bus via MUX

// Strobe Generation

  wire           smc_n_wr;           //EMI write enable (Active LOW)
  wire  [3:0]    smc_n_we;           //EMI write strobes (Active LOW)
  wire           smc_n_rd;           //EMI read stobe (Active LOW)
  wire           smc_busy;           //smc busy
  wire           smc_n_ext_oe;       //Enable External bus drivers.(CS & !RD)

// Address Generation

  wire [31:0]    smc_addr;           //External Memory Interface(EMI) address
  wire [3:0]     smc_n_be;   //EMI byte enables (Active LOW)
  wire      smc_n_cs;   //EMI Chip Selects (Active LOW)

// Bus Interface

  wire           new_access;         // New AHB access to smc detected
  wire [31:0]    addr;               // Copy of address
  wire [31:0]    write_data;         // Data to External Bus
  wire      cs;         // Chip(bank) Select Lines
  wire [1:0]     xfer_size;          // Width of current transfer
  wire           n_read;             // Active low read signal                   
  
// Configuration Block


// Counters

  wire [1:0]     r_csle_count;       // Chip select LE counter
  wire [1:0]     r_wele_count;       // Write counter
  wire [1:0]     r_cste_count;       // chip select TE counter
  wire [7:0]     r_ws_count; // Wait state select counter
  
// These strobes finish early so no counter is required. The stored value
// is compared with WS counter to determine when the strobe should end.

  wire [1:0]     r_wete_store;       // Write strobe TE end time before CS
  wire [1:0]     r_oete_store;       // Read strobe TE end time before CS
  
// The following four wireisrers are used to store the configuration during
// mulitple accesses. The counters are reloaded from these wireisters
//  before each cycle.

  wire [1:0]     r_csle_store;       // Chip select LE store
  wire [1:0]     r_wele_store;       // Write strobe LE store
  wire [7:0]     r_ws_store;         // Wait state store
  wire [1:0]     r_cste_store;       // Chip Select TE delay (Bus float time)


// Multiple access control

  wire           mac_done;           // Indicates last cycle of last access
  wire [1:0]     r_num_access;       // Access counter
  wire [1:0]     v_xfer_size;        // Store size for MAC 
  wire [1:0]     v_bus_size;         // Store size for MAC
  wire [31:0]    read_data;          // Data path to bus IF
  wire [31:0]    r_read_data;        // Internal data store

// smc state machine


  wire           valid_access;       // New acces can proceed
  wire   [4:0]   smc_nextstate;      // state machine (async encoding)
  wire   [4:0]   r_smc_currentstate; // Synchronised smc state machine
  wire           ws_enable;          // Wait state counter enable
  wire           cste_enable;        // Chip select counter enable
  wire           smc_done;           // Asserted during last cycle of
                                     //    an access
  wire           le_enable;          // Start counters after STORED 
                                     //    access
  wire           latch_data;         // latch_data is used by the MAC 
                                     //    block to store read data 
                                     //    if CSTE > 0
  wire           smc_idle;           // idle state

// Address Generation

  wire [3:0]     n_be;               // Full cycle write strobe

// Strobe Generation

  wire           r_full;             // Full cycle write strobe
  wire           n_r_read;           // Store RW srate for multiple accesses
  wire           n_r_wr;             // write strobe
  wire [3:0]     n_r_we;             // write enable  
  wire      r_cs;       // registered chip select 

   //apb
   

   wire n_sys_reset;                        //AHB system reset(active low)

// assign a default value to the signal if the bank has
// been disabled and the APB has been excluded (i.e. the config signals
// come from the top level
   
   smc_apb_lite_if i_apb_lite (
                     //Inputs
                     
                     .n_preset(n_preset),
                     .pclk(pclk),
                     .psel(psel),
                     .penable(penable),
                     .pwrite(pwrite),
                     .paddr(paddr),
                     .pwdata(pwdata),
                     
                    //Outputs
                     
                     .prdata(prdata)
                     
                     );
   
   smc_ahb_lite_if i_ahb_lite  (
                     //Inputs
                     
		     .hclk (hclk),
                     .n_sys_reset (n_sys_reset),
                     .haddr (haddr),
                     .hsel (hsel),                                                
                     .htrans (htrans),                    
                     .hwrite (hwrite),
                     .hsize (hsize),                
                     .hwdata (hwdata),
                     .hready (hready),
                     .read_data (read_data),
                     .mac_done (mac_done),
                     .smc_done (smc_done),
                     .smc_idle (smc_idle),
                     
                     // Outputs
                     
                     .xfer_size (xfer_size),
                     .n_read (n_read),
                     .new_access (new_access),
                     .addr (addr),
                     .smc_hrdata (smc_hrdata), 
                     .smc_hready (smc_hready),
                     .smc_hresp (smc_hresp),
                     .smc_valid (smc_valid),
                     .cs (cs),
                     .write_data (write_data)
                     );
   
   

   
   
   smc_counter_lite i_counter_lite (
                          
                          // Inputs
                          
                          .sys_clk (hclk),
                          .n_sys_reset (n_sys_reset),
                          .valid_access (valid_access),
                          .mac_done (mac_done),
                          .smc_done (smc_done),
                          .cste_enable (cste_enable),
                          .ws_enable (ws_enable),
                          .le_enable (le_enable),
                          
                          // Outputs
                          
                          .r_csle_store (r_csle_store),
                          .r_csle_count (r_csle_count),
                          .r_wele_count (r_wele_count),
                          .r_ws_count (r_ws_count),
                          .r_ws_store (r_ws_store),
                          .r_oete_store (r_oete_store),
                          .r_wete_store (r_wete_store),
                          .r_wele_store (r_wele_store),
                          .r_cste_count (r_cste_count));
   
   
   smc_mac_lite i_mac_lite         (
                          
                          // Inputs
                          
                          .sys_clk (hclk),
                          .n_sys_reset (n_sys_reset),
                          .valid_access (valid_access),
                          .xfer_size (xfer_size),
                          .smc_done (smc_done),
                          .data_smc (data_smc),
                          .write_data (write_data),
                          .smc_nextstate (smc_nextstate),
                          .latch_data (latch_data),
                          
                          // Outputs
                          
                          .r_num_access (r_num_access),
                          .mac_done (mac_done),
                          .v_bus_size (v_bus_size),
                          .v_xfer_size (v_xfer_size),
                          .read_data (read_data),
                          .smc_data (smc_data));
   
   
   smc_state_lite i_state_lite     (
                          
                          // Inputs
                          
                          .sys_clk (hclk),
                          .n_sys_reset (n_sys_reset),
                          .new_access (new_access),
                          .r_cste_count (r_cste_count),
                          .r_csle_count (r_csle_count),
                          .r_ws_count (r_ws_count),
                          .mac_done (mac_done),
                          .n_read (n_read),
                          .n_r_read (n_r_read),
                          .r_csle_store (r_csle_store),
                          .r_oete_store (r_oete_store),
                          .cs(cs),
                          .r_cs(r_cs),

                          // Outputs
                          
                          .r_smc_currentstate (r_smc_currentstate),
                          .smc_nextstate (smc_nextstate),
                          .cste_enable (cste_enable),
                          .ws_enable (ws_enable),
                          .smc_done (smc_done),
                          .valid_access (valid_access),
                          .le_enable (le_enable),
                          .latch_data (latch_data),
                          .smc_idle (smc_idle));
   
   smc_strobe_lite i_strobe_lite   (

                          //inputs

                          .sys_clk (hclk),
                          .n_sys_reset (n_sys_reset),
                          .valid_access (valid_access),
                          .n_read (n_read),
                          .cs(cs),
                          .r_smc_currentstate (r_smc_currentstate),
                          .smc_nextstate (smc_nextstate),
                          .n_be (n_be),
                          .r_wele_store (r_wele_store),
                          .r_wele_count (r_wele_count),
                          .r_wete_store (r_wete_store),
                          .r_oete_store (r_oete_store),
                          .r_ws_count (r_ws_count),
                          .r_ws_store (r_ws_store),
                          .smc_done (smc_done),
                          .mac_done (mac_done),
                          
                          //outputs

                          .smc_n_rd (smc_n_rd),
                          .smc_n_ext_oe (smc_n_ext_oe),
                          .smc_busy (smc_busy),
                          .n_r_read (n_r_read),
                          .r_cs(r_cs),
                          .r_full (r_full),
                          .n_r_we (n_r_we),
                          .n_r_wr (n_r_wr));
   
   smc_wr_enable_lite i_wr_enable_lite (

                            //inputs

                          .n_sys_reset (n_sys_reset),
                          .r_full(r_full),
                          .n_r_we(n_r_we),
                          .n_r_wr (n_r_wr),
                              
                          //output                

                          .smc_n_we(smc_n_we),
                          .smc_n_wr (smc_n_wr));
   
   
   
   smc_addr_lite i_add_lite        (
                          //inputs

                          .sys_clk (hclk),
                          .n_sys_reset (n_sys_reset),
                          .valid_access (valid_access),
                          .r_num_access (r_num_access),
                          .v_bus_size (v_bus_size),
                          .v_xfer_size (v_xfer_size),
                          .cs (cs),
                          .addr (addr),
                          .smc_done (smc_done),
                          .smc_nextstate (smc_nextstate),
                          
                          //outputs

                          .smc_addr (smc_addr),
                          .smc_n_be (smc_n_be),
                          .smc_n_cs (smc_n_cs),
                          .n_be (n_be));
   
   
endmodule
