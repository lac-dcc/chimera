/*******************************************************************************
*
* Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
*                          Junior University
* Copyright (C) 2010, 2011 Muhammad Shahbaz
* Copyright (C) 2015 Noa Zilberman
* All rights reserved.
*
* This software was developed by
* Stanford University and the University of Cambridge Computer Laboratory
* under National Science Foundation under Grant No. CNS-0855268,
* the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
* by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
* as part of the DARPA MRC research programme.
*
* @NETFPGA_LICENSE_HEADER_START@
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*  http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*
* @NETFPGA_LICENSE_HEADER_END@
*/
/******************************************************************************
*
*  File:
* 	mac_cam_lut.v
*
*  Module:
*        mac_cam_lut
*
*  Author:
*        Muhammad Shahbaz
*        Modified by Noa Zilberman
*
*  Description:
* 	learning CAM switch core functionality
*
*/

 `timescale 1ns/1ps
 
 module mac_cam_lut
 #(
   parameter NUM_OUTPUT_QUEUES = 8,
   parameter LUT_DEPTH_BITS    = 4,
   parameter LUT_DEPTH         = 2**LUT_DEPTH_BITS,
   parameter DEFAULT_MISS_OUTPUT_PORTS = 8'h05     // only send to the MAC txfifos not the cpu
 )
 (
   // --- core functionality signals
   input  [47:0]                       dst_mac,
   input  [47:0]                       src_mac,
   input  [NUM_OUTPUT_QUEUES-1:0]      src_port,
   input                               lookup_req,
   output reg [NUM_OUTPUT_QUEUES-1:0]  dst_ports,
   
   // --- lookup done signal
   output reg                          lookup_done,   // pulses high on lookup done
   output reg                          lut_miss,
   output reg                          lut_hit,
   
   // --- Misc
   input                               clk,
   input                               reset
 );
 
  function integer log2;
    input integer number;
    begin
      log2=0;
      while(2**log2<number) begin
      log2=log2+1;
      end
    end
  endfunction // log2
 
  //--------------------- Internal Parameter-------------------------
 
  //---------------------- Wires and regs----------------------------
  
  genvar i;
   
  reg [NUM_OUTPUT_QUEUES+48-1:0]    lut [0:LUT_DEPTH-1];
  reg [LUT_DEPTH_BITS-1:0]		    lut_wr_addr;
  
  //------------------------- Logic --------------------------------
  
      wire [NUM_OUTPUT_QUEUES-1:0]    rd_oq[0:LUT_DEPTH-1];
      wire [0:LUT_DEPTH-1]            lut_lookup_hit;

  generate
    // LUT Lookup
    for (i=0; i<LUT_DEPTH; i=i+1)
	begin: LUT_LOOKUP
	  
  
	  if (i == 0) begin: _0
	    assign rd_oq[i][NUM_OUTPUT_QUEUES-1:0] = (lut[i][47:0] == dst_mac) ? lut[i][NUM_OUTPUT_QUEUES+48-1:48] 
		                                                       : {(NUM_OUTPUT_QUEUES){1'b0}};
		assign lut_lookup_hit[i]   = (lut[i][47:0] == dst_mac) ? 1                                 
		                                                       : 0;
      end
	  else begin: _N
	    assign rd_oq[i][NUM_OUTPUT_QUEUES-1:0] = (lut[i][47:0] == dst_mac) ? lut[i][NUM_OUTPUT_QUEUES+48-1:48] 
		                                                       : rd_oq[i-1][NUM_OUTPUT_QUEUES-1:0];
		assign lut_lookup_hit[i]   = (lut[i][47:0] == dst_mac) ? 1                                 
		                                                       : lut_lookup_hit[i-1];
	  end
	end
	
	// LUT Learn
      wire [0:LUT_DEPTH-1]            lut_learn_hit;
	for (i=0; i<LUT_DEPTH; i=i+1)
	begin: LUT_LEARN

	  
	  if (i == 0) begin: _0
		assign lut_learn_hit[i]     = (lut[i][47:0] == src_mac) ? 1      
		                                                        : 0;
      end
	  else begin: _N
		assign lut_learn_hit[i]     = (lut[i][47:0] == src_mac) ? 1      
		                                                        : lut_learn_hit[i-1];
	  end
	  
	  always @ (posedge clk) begin: _A
	    if (reset)
		  lut[i] <= {(NUM_OUTPUT_QUEUES+48-1){1'b0}};
		else if (lookup_req) begin
		  if ((lut[i][47:0] == src_mac) ||                         // if src_mac         matches in the LUT
		      (~lut_learn_hit[LUT_DEPTH-1] && (lut_wr_addr == i))) // if src_mac doesn't matches in the LUT 
	        lut[i] <= {src_port, src_mac};
		end
	  end
	end
  endgenerate
  
  always @ (posedge clk) begin
    if(reset) begin
      lut_hit  <= 0;
	  lut_miss <= 0;
	  
	  lookup_done <= 0;
	  dst_ports   <= {NUM_OUTPUT_QUEUES{1'b0}};
	  
	  lut_wr_addr <= {LUT_DEPTH_BITS{1'b0}};
	end
	else begin
	  lut_hit     <= 0;
	  lut_miss    <= 0;
	  lookup_done <= 0;
	  
	  if (lookup_req) begin
	    lut_hit  <= lut_lookup_hit[LUT_DEPTH-1];
		lut_miss <= ~lut_lookup_hit[LUT_DEPTH-1];
		
	    /* if we get a miss then set the dst port to the default ports
         * without the source */
        dst_ports <= (lut_lookup_hit[LUT_DEPTH-1]) ? (rd_oq[LUT_DEPTH-1][NUM_OUTPUT_QUEUES-1:0] & ~src_port)
                                                   : (DEFAULT_MISS_OUTPUT_PORTS     & ~src_port);
	    lookup_done <= 1;
		
		if (~lut_learn_hit[LUT_DEPTH-1])
		  lut_wr_addr <= lut_wr_addr + 1;
	  end
	end
  end
  
endmodule  
