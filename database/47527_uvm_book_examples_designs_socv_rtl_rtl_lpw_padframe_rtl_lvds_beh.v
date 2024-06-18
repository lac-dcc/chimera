// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : lvds_beh.v
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

input  		hiss_rxqen;
input		hissrxip; 
input		hissrxin; 
input		hissclkp; 
input		hissclkn; 
input		hissrxqp; 
input		hissrxqn; 
input   	hiss_txi; 
input        	hiss_txq; 
input        	hiss_txien;
input       	hiss_txqen;
input 		vdd_hiss;   // Connect to 1'b0
input 		vss_hiss;   // Connect to 1'b0
input 		vsub_hiss;   // Connect to 1'b0
input		hiss_biasen;   // Connect to 1'b1
input 		hiss_replien;   // Connect to 1'b1
input 		hiss_curr;   // Connect to 1'b1
input  		hiss_clken;
input       	hiss_rxien;
output       	hiss_rxi; 
output 		hiss_clk;
output 		hiss_rxq;
output 		hisstxip;
output 		hisstxin;
output        	hisstxqp;
output        	hisstxqn;

reg	hiss_txq_output, hiss_txi_output, hiss_rxi_output, hiss_rxq_output,hiss_clk_output, hiss_clk, hiss_rxq, hiss_rxi;

always @(hissrxqp or hissrxqn)
begin
	if (hissrxqp > hissrxqn)
		hiss_rxq_output <= 1'b1;
	else if (hissrxqn > hissrxqp)
		hiss_rxq_output <= 1'b0;
	else
	     	hiss_rxq_output <= 1'b0;
end

always @(hissrxip or hissrxin)
begin
	if (hissrxip > hissrxin)
		hiss_rxi_output <= 1'b1;
	else if (hissrxin > hissrxip)
		hiss_rxi_output <= 1'b0;
	else
	     	hiss_rxi_output <= 1'b0;
end

always @(hiss_txi)
begin
	if (hiss_txi == 1'b1)
		hiss_txi_output <= 1'b1;
	else
		hiss_txi_output <= 1'b0;

end

always @(hiss_txq)
begin
	if (hiss_txq == 1'b1)
		hiss_txq_output <= 1'b1;
	else
		hiss_txq_output <= 1'b0;
end

always @(hissclkp or hissclkn)
begin
	if (hissclkp > hissclkn)
		hiss_clk_output <= 1'b1;
	else if (hissclkn > hissclkp)
		hiss_clk_output <= 1'b0;
	else
	     	hiss_clk_output <= 1'b0;
end

always @(hiss_clk_output or hiss_clken)
if (hiss_clken & hiss_clk_output)
	hiss_clk <= 1'b1;
else
	hiss_clk <= 1'b0;

always @(hiss_rxq_output or hiss_rxqen)
if (hiss_rxq_output & hiss_rxqen)
	hiss_rxq <= 1'b1;
else
	hiss_rxq <= 1'b0;

always @(hiss_rxi_output or hiss_rxien)
if (hiss_rxi_output & hiss_rxien)
	hiss_rxi <= 1'b1;
else
	hiss_rxi <= 1'b0;

assign vhigh_driver = hiss_curr;
assign vlow_driver  = ~vhigh_driver;
assign hisstxip = hiss_replien & hiss_txien & (vhigh_driver*hiss_txi_output);
assign hisstxin = hiss_replien & hiss_txien & (vhigh_driver*(1'b1-hiss_txi_output));
assign hisstxqp = hiss_replien & hiss_txqen & (vhigh_driver*hiss_txq_output);
assign hisstxqn = hiss_replien & hiss_txqen & (vhigh_driver*(1'b1-hiss_txq_output));

endmodule
