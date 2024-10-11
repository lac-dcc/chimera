// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : smc_cfreg_lite.v
//Title       : 
//Created     : 1999
//Description : Single instance of a config register
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



module smc_cfreg_lite (
  // inputs
  selreg,

  // outputs
  rdata
);


// Inputs
input         selreg;               // select the register for read/write access

// Outputs
output [31:0] rdata;                 // Read data

wire   [31:0] smc_config;
wire   [31:0] rdata;


assign rdata = ( selreg ) ? smc_config : 32'b0;
assign smc_config =  {1'b1,1'b1,8'h00, 2'b00, 2'b00, 2'b00, 2'b00,2'b00,2'b00,2'b00,8'h01};




endmodule // smc_cfreg
