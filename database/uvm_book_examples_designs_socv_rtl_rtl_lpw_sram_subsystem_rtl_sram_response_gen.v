// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : sram_response_gen.v
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

module sram_response_gen(
	//Inputs
    		hclk,         // AHB Clock
    		n_hreset,     // AHB reset - Active low
    		// AHB interface
    		hsel,         // AHB2APB select
    		htrans,       // Transfer type
    		hsize,        // AHB Access type - byte, half-word, word
                hready_in,    // Combined hready across all slaves
                RWconflict,   // Read coinciding with 2nd stage of write
    	// Outputs
    		// AHB interface
    		hready,       // Ready for new bus cycle from target slave
    		hresp,        // Response from the bridge
                valid_access
);

    // Inputs     
    // system signals
    input        hclk;     // AHB Clock
    input        n_hreset;  // AHB reset - Active low
    // AHB interface 
    input        hsel;     // select from AHB bus
    input [1:0]  htrans;   // Transfer type
    input [2:0]  hsize;    // AHB Access type - byte, half-word, word
    input        hready_in; // Combined hready across all slaves
    input        RWconflict;
    // Outputs
    // AHB interface
    output        hready;       // Ready for new bus cycle from target slave
    output [1:0]  hresp;        // Response from the bridge
    output        valid_access;

    wire          size_error;
    //wire          hresp_0_next;
    wire          valid_access;
    wire          hready_RWconflict;    
    wire sram_subs_access;
    wire hready_error;
    reg		  r_hresp_0;
    reg		  r_hready;


	// Lower hready for one cycle of there is a Read's address phase coinciding 
	// with a write's data phase for the same mem group
	// -------------------------------------------------------------------------

	assign hready_RWconflict = RWconflict ?  1'b0 : 1'b1;
 

        // Flag error if access size is 64 bits or more
        // hsize [2:0]
        // 000 - 8 bit
        // 001 - 16 bit
        // 010 - 32 bit
        // 011 - 64 bit
        // 1xx > 64 bit
        // htrans [1:0]
        // 00 = idle
        // 01 = busy
        // 10 = non-seq
        // 11 = seq
        // hresp
        // 00 = OK
        // 01 = Error
        // 10 = Retry
        // 11 = Split

       // Access > 32 bit is error
	assign size_error = ( hsize[2] | (hsize[1] & hsize[0]) ) ?
                            1'b1 : 1'b0;

        //assign valid_access= ( (htrans[1] & hsel) & (~size_error) & (hready_in))?
        //                     1'b1 : 1'b0;

        // Sram subsystem access, 
        assign sram_subs_access = ( (htrans[1] & hsel) & (hready_in))? 1'b1 : 1'b0;
      
        // valid access: sram sub system is access and there is not size error
        assign valid_access = sram_subs_access & ~size_error;
         
      // Pull hready low only if there is an access has a size error 
	//assign hready_error = ( ( hsel & htrans[1] & hready_in) & (size_error)) ?
        //                     1'b0 : 1'b1;        
        assign hready_error = sram_subs_access & size_error;
 
     // Flag error or ignore access that occurs when hready output is low
        //assign hresp_0_next = ((hready_error) | hready_in) ? 
         //                    1'b0 :1'b1;   
   	always @(posedge hclk or negedge n_hreset)
    		begin
        	if (~n_hreset)
        		begin
            		r_hready  <= 1'b1;
            		r_hresp_0 <= 1'b0;
        	end // if (!n_hreset)
        	else
        		begin
            		r_hready  <= (~hready_error & hready_RWconflict);

                        if(hready_error) 
            	          r_hresp_0 <= 1'b1;
                        else if (hready_in)
            	          r_hresp_0 <= 1'b0;
        	end
    	end // always @(posedge hclk ..



	assign hready   = r_hready;
	assign hresp[0] = r_hresp_0;
        // Tie hresp[1] to '0' as it is common to both error and OK responses
        assign hresp[1] = 1'b0;

endmodule // module sram_response_gen

