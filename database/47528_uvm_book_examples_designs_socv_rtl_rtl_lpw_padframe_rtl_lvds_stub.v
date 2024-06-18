// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : lvds_stub.v
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
module lvds (hiss_rxi, hiss_rxien, hissrxip, hissrxin, hiss_clk, hiss_clken, hissclkp, hiss_rxq, hiss_rxqen, hissclkn, hissrxqp, hissrxqn, vdd_hiss, vss_hiss, vsub_hiss, hiss_biasen, hiss_replien, hiss_curr, hisstxip, hisstxin, hiss_txi, hiss_txien,hisstxqp, hisstxqn, hiss_txqen, hiss_txq);

output       	hiss_rxi; 
input       	hiss_rxien;
output 		hiss_clk;
input  		hiss_clken;
output 		hiss_rxq;
input  		hiss_rxqen;
input 		vdd_hiss;   // Connect to 1'b0
input 		vss_hiss;   // Connect to 1'b0
input 		vsub_hiss;   // Connect to 1'b0
input		hiss_biasen;   // Connect to 1'b1
input 		hiss_replien;   // Connect to 1'b1
input 		hiss_curr;   // Connect to 1'b1
output 		hisstxip;
output 		hisstxin;
input        	hiss_txien;
output        	hisstxqp;
output        	hisstxqn;
input       	hiss_txqen;
input		hissrxip; 
input		hissrxin; 
input		hissclkp; 
input		hissclkn; 
input		hissrxqp; 
input		hissrxqn; 
input   	hiss_txi; 
input        	hiss_txq; 

endmodule
