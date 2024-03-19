//
// Copyright (c) 2015 University of Cambridge
// All rights reserved.
//
// This software was developed by
// Stanford University and the University of Cambridge Computer Laboratory
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme.
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

`timescale 1ps / 1ps

(* dont_touch = "yes" *)
module data_sync_block #(
  parameter   C_NUM_SYNC_REGS = 5
  )
  (
    input   wire  clk,
    input   wire  data_in,
    output  wire  data_out
  );
  
(* shreg_extract = "no", ASYNC_REG = "TRUE" *) reg  [C_NUM_SYNC_REGS-1:0]    sync1_r = {C_NUM_SYNC_REGS{1'b1}};

  //----------------------------------------------------------------------------
  // Synchronizer
  //----------------------------------------------------------------------------
  always @(posedge clk) begin
    sync1_r <= {sync1_r[C_NUM_SYNC_REGS-2:0], data_in};
  end    
  
  assign data_out = sync1_r[C_NUM_SYNC_REGS-1];
endmodule
