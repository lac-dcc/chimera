// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : rom_response_gen.v
//Title       : 
//Created     : 1999
//Description : Generates Hready and Hresp signals for AHB read requests
//              and cen for the ROM core.
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

module rom_response_gen(
	//Inputs
    		hclk,         // AHB Clock
    		n_hreset,     // AHB reset - Active low
    		// AHB interface
    		hsel,         // AHB2APB select
    		htrans,       // Transfer type
    		hsize,        // AHB Access type - byte, half-word, word
    		hwrite,       // Write signal
                hready_in,    // Combined hready across all slaves

    	// Outputs
    		// AHB interface
    		hready,       // Ready for new bus cycle from target slave
    		hresp,        // Response from the bridge
		cen	      // Chip Enable for ROM
);

    // Inputs     
    // system signals
    input        hclk;     // AHB Clock
    input        n_hreset;  // AHB reset - Active low
    // AHB interface 
    input        hsel;     // select from AHB bus
    input [1:0]  htrans;   // Transfer type
    input [2:0]  hsize;    // AHB Access type - byte, half-word, word
    input        hwrite;   // Write signal
    input        hready_in; // Combined hready across all slaves
 
    // Outputs
    // AHB interface
    output        hready;       // Ready for new bus cycle from target slave
    output [1:0]  hresp;        // Response from the bridge
    output        cen;		// Chip Enable for ROM

     
    wire          hready_next;
    wire          cen  ;
    wire          size_error;
    wire          hresp_0_next;
    reg		  r_hresp_0;
    reg		  r_hready;

 
	// Flag error if acess size is 64 bits or more
	assign size_error = ( hsize[2] | (hsize[1] & hsize[0]) ) ?
                            1'b1 : 1'b0;

	// Generate chip enable for read accesses of size =< 32 bits. 
	//    Ignore accesses when hready low.
	assign cen = ( (htrans[1] & hsel & ~hwrite) & (~size_error) & (hready_in) ) ?
                     1'b0 : 1'b1;

	// Pull hready low only if there is an access that's a write or has a size error 
	assign hready_next = ( ( hsel & htrans[1] & hready_in ) & ( size_error | hwrite )) ?
                             1'b0 : 1'b1;

	// Provide a two cycle error response on a write or a size error
        // Else signal OK ; hresp= 01 -> error , 00 -> OK
        assign hresp_0_next = ( ~hready_next | ~hready ) ?
                              1'b1 : 1'b0;

        
                              

   	always @(posedge hclk or negedge n_hreset)
    		begin
        	if (~n_hreset)
        		begin
            		r_hready  <= 1'b1;
            		r_hresp_0 <= 1'b0;
        	end // if (!n_hreset)
        	else
        		begin
            		r_hready  <= hready_next;
            		r_hresp_0 <= hresp_0_next;
        	end
    	end // always @(posedge hclk ..



	assign hready   = r_hready;
	assign hresp[0] = r_hresp_0;
        // Tie hresp[1] to '0' as it is common to both error and OK responses
        assign hresp[1] = 1'b0;



endmodule // module rom_response_gen


