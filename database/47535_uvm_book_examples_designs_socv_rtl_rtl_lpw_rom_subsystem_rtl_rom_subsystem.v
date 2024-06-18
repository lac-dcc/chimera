// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : rom_subsystem.v
//Title       : 
//Created     : 1999
//Description : 2KByte ROM and a wrapper for interfacing it as an AHB slave
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
//                   

module rom_subsystem (
	//Inputs
    		hclk,         // AHB Clock
    		n_hreset,      // AHB reset - Active low
    		// AHB interface
    		hsel,         // AHB2APB select
    		haddr,        // Address bus
    		htrans,       // Transfer type
    		hsize,        // AHB Access type - byte, half-word, word
    		hwrite,       // Write signal
         hwdata,       // Write Data bus
         hready_in,    // Combined hready across all slaves
         hburst,     // Burst type
         hprot,      // Protection control
         hmaster,    // Master select
         hmastlock,  // Locked transfer
         
    		// Scan inputs
		scan_mode,    // Scan mode	

    	// Outputs
    		// AHB interface
    		hrdata,       // Read data provided from target slave
    		hready,       // Ready for new bus cycle from target slave
    		hresp        // Response from the bridge
);

    // Inputs     
    // system signals
    input        hclk;     // AHB Clock
    input        n_hreset;  // AHB reset - Active low
    // AHB interface 
    input        hsel;     // select from AHB bus
    input [31:0] haddr;    // Address bus
    input [1:0]  htrans;   // Transfer type
    input [2:0]  hsize;    // AHB Access type - byte, half-word, word
    input        hwrite;   // Write signal
    input [31:0] hwdata;
    input        hready_in; // Combined hready across all slaves
    input [2:0]  hburst;     // Burst type
    input [3:0]  hprot;      // Protection control
    input [3:0]  hmaster;    // Master select
    input        hmastlock;  // Locked transfer
  
    // Scan inputs
    input        scan_mode;  // Scan mode    

    // Outputs
    // AHB interface
    output [31:0] hrdata;       // Read data provided from target slave
    output        hready;       // Ready for new bus cycle from target slave
    output [1:0]  hresp;        // Response from the bridge
    // Scan outputs

//------------------------------------------------------------------------------
// if the ROM subsystem is NOT black boxed 
//------------------------------------------------------------------------------
`ifndef FV_KIT_BLACK_BOX_ROM_SUBSYSTEM 
    
    wire 	  cen;

 
    // Module response_gen :
    // Provides response to the AHB request and generates chip enable for the ROM instance
    rom_response_gen i_rom_response_gen (
                        // Inputs
                        .hclk(hclk),
                        .n_hreset(n_hreset),
                        .hsel(hsel),
                        .htrans(htrans),
                        .hsize(hsize),
                        .hwrite(hwrite),
			.hready_in(hready_in),
                        // Outputs
                        .hready(hready),
			.hresp(hresp),
			.cen(cen)
                       	);

    // Module ROM
    // This is the ROM instance
    ROM_SP_512x32_wrap i_rom_wrap (
                 	.Q(hrdata),
                	.CLK(hclk),
                	.ME(~cen),
                	.ADR(haddr[10:2]),
			.reset_n(n_hreset),
			.scan_mode(scan_mode)
                 	);

`else 
//------------------------------------------------------------------------------
// if the ROM subsystem is black boxed 
//------------------------------------------------------------------------------
   
   // Inputs     
   // system signals
   wire         hclk;      // AHB Clock
   wire         n_hreset;  // AHB reset - Active low
   // AHB interface 
   wire         hsel;      // select from AHB bus
   wire  [31:0] haddr;     // Address bus
   wire  [1:0]  htrans;    // Transfer type
   wire  [2:0]  hsize;     // AHB Access type - byte, half-word, word
   wire         hwrite;    // Write signal
   wire [31:0]  hwdata;    // Write Data
   wire         hready_in; // Combined hready across all slaves
   wire  [2:0]  hburst;    // Burst type
   wire  [3:0]  hprot;     // Protection control
   wire  [3:0]  hmaster;   // Master select
   wire         hmastlock; // Locked transfer

   // Scan wire s
   wire         scan_mode; // Scan mode    

   // Outputs
   // AHB interface
   reg    [31:0] hrdata;   // Read data provided from target slave
   reg           hready;   // Ready for new bus cycle from target slave
   reg    [1:0]  hresp;    // Response from the bridge

`endif
//------------------------------------------------------------------------------
// black boxed defines 
//------------------------------------------------------------------------------

endmodule  // module rom_subsystem
 
