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
//
`timescale 1ns/1ps

module cam_wrapper
#(
   parameter  C_TCAM_ADDR_WIDTH 	= 4,
   parameter  C_TCAM_DATA_WIDTH 	= 16,
   parameter  C_TCAM_ADDR_TYPE  	= 0,
   parameter  C_TCAM_MATCH_ADDR_WIDTH	= 4
)
(
   input					CLK,
   input					WE,
   input          [C_TCAM_ADDR_WIDTH-1:0]	WR_ADDR,
   input          [C_TCAM_DATA_WIDTH-1:0]	DIN,
   output					BUSY,

   input          [C_TCAM_DATA_WIDTH-1:0]	CMP_DIN,
   output					MATCH,
   output         [C_TCAM_MATCH_ADDR_WIDTH-1:0]	MATCH_ADDR
);

localparam  C_TCAM_DATA_DEPTH = 2**C_TCAM_ADDR_WIDTH;

cam_top 
#(
   .C_ADDR_TYPE               (  C_TCAM_ADDR_TYPE           ),
   .C_DEPTH                   (  C_TCAM_DATA_DEPTH          ),
   .C_FAMILY                  (  "virtex5"                  ),
   .C_HAS_CMP_DIN             (  1                          ),
   .C_HAS_EN                  (  0                          ),
   .C_HAS_MULTIPLE_MATCH      (  0                          ),
   .C_HAS_READ_WARNING        (  0                          ),
   .C_HAS_SINGLE_MATCH        (  0                          ),
   .C_HAS_WE                  (  1                          ),
   .C_MATCH_RESOLUTION_TYPE   (  0                          ),
   .C_MEM_INIT                (  0                          ),
   .C_MEM_TYPE                (  1                          ),
   .C_REG_OUTPUTS             (  0                          ),
   .C_TERNARY_MODE            (  0                          ),
   .C_WIDTH                   (  C_TCAM_DATA_WIDTH          )
)
cam_top (
   .CLK                       (  CLK                        ),
   .CMP_DATA_MASK             (  {C_TCAM_DATA_WIDTH{1'b0}}  ),
   .CMP_DIN                   (  CMP_DIN                    ),
   .DATA_MASK                 (  {C_TCAM_DATA_WIDTH{1'b0}}  ),
   .DIN                       (  DIN                        ),
   .EN                        (  1'b1                       ),
   .WE                        (  WE                         ),
   .WR_ADDR                   (  WR_ADDR                    ),
   .BUSY                      (  BUSY                       ),
   .MATCH                     (  MATCH                      ),
   .MATCH_ADDR                (  MATCH_ADDR                 ),
   .MULTIPLE_MATCH            (                             ),
   .READ_WARNING              (                             ),
   .SINGLE_MATCH              (                             )
);

endmodule
