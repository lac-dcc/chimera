//
// Copyright (c) 2015 University of Cambridge
// All rights reserved.
//
// This software was developed by SRI International and the University of
// Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1,
// National Science Foundation under Grant No. CNS-0855268, and Defense
// Advanced Research Projects Agency (DARPA) and Air Force Research Laboratory
// (AFRL), under contract FA8750-11-C-0249.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@

`timescale 1ns/1ps

module tcam 
#(
   parameter C_TCAM_ADDR_WIDTH		= 5, 
   parameter C_TCAM_DATA_WIDTH		= 32,
   parameter C_TCAM_ADDR_TYPE		= 0,
   parameter C_TCAM_MATCH_ADDR_WIDTH	= 5
)
(
   input					CLK,
   input					WE,
   input          [C_TCAM_ADDR_WIDTH-1:0]	ADDR_WR,
   input          [C_TCAM_DATA_WIDTH-1:0]	DIN,
   input          [C_TCAM_DATA_WIDTH-1:0]	DATA_MASK,
   output					BUSY,

   input          [C_TCAM_DATA_WIDTH-1:0]	CMP_DIN,
   input          [C_TCAM_DATA_WIDTH-1:0]	CMP_DATA_MASK,
   output					MATCH,
   output         [C_TCAM_MATCH_ADDR_WIDTH-1:0]	MATCH_ADDR
);


tcam_wrapper
#(
   .C_TCAM_ADDR_WIDTH		(  C_TCAM_ADDR_WIDTH    ),
   .C_TCAM_DATA_WIDTH		(  C_TCAM_DATA_WIDTH    ),
   .C_TCAM_ADDR_TYPE		(  C_TCAM_ADDR_TYPE     ),
   .C_TCAM_MATCH_ADDR_WIDTH	(  C_TCAM_MATCH_ADDR_WIDTH   )
)
tcam_wrapper
(
   .CLK                 (  CLK                  ),
   .WE                  (  WE                   ), 
   .WR_ADDR             (  ADDR_WR              ),
   .DIN                 (  DIN                  ), 
   .DATA_MASK           (  DATA_MASK            ),
   .BUSY                (  BUSY                 ),

   .MATCH               (  MATCH                ), 
   .MATCH_ADDR          (  MATCH_ADDR           ),
   .CMP_DIN             (  CMP_DIN              ),
   .CMP_DATA_MASK       (  CMP_DATA_MASK        )
);

endmodule
