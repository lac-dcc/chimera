// This program was cloned from: https://github.com/yuravg/uvm_book_examples
// License: Apache License 2.0

//File name   : lvds_tb.v
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

input       	hiss_rxi; 
input       	hiss_rxien;
input 		hiss_clk;
input  		hiss_clken;
input 		hiss_rxq;
input  		hiss_rxqen;
input 		vdd_hiss;   // Connect to 1'b0
input 		vss_hiss;   // Connect to 1'b0
input 		vsub_hiss;   // Connect to 1'b0
input		hiss_biasen;   // Connect to 1'b1
input 		hiss_replien;   // Connect to 1'b1
input 		hiss_curr;   // Connect to 1'b1
input 		hisstxip;
input 		hisstxin;
input        	hiss_txien;
input        	hisstxqp;
input        	hisstxqn;
input       	hiss_txqen;
output		hissrxip; 
output		hissrxin; 
output		hissclkp; 
output		hissclkn; 
output		hissrxqp; 
output		hissrxqn; 
output   	hiss_txi; 
output        	hiss_txq; 

reg	hiss_txq_output, hiss_txi_output, hiss_rxi_output, hiss_rxq_output,hiss_clk_output,hiss_txi,hiss_txq;
//######Receivers##############
always @(hisstxqp or hisstxqn)
begin
	if (hisstxqp > hisstxqn)
		hiss_txq_output <= 1'b1;
	else if (hisstxqn > hisstxqp)
		hiss_txq_output <= 1'b0;
	else
	     	hiss_txq_output <= 1'b0;
end

always @(hisstxip or hisstxin)
begin
	if (hisstxip > hisstxin)
		hiss_txi_output <= 1'b1;
	else if (hisstxin > hisstxip)
		hiss_txi_output <= 1'b0;
	else
	     	hiss_txi_output <= 1'b0;
end

always @(hiss_rxi)
begin
	if (hiss_rxi == 1'b1)
		hiss_rxi_output <= 1'b1;
	else
		hiss_rxi_output <= 1'b0;

end
always @(hiss_rxq)
begin
	if (hiss_rxq == 1'b1)
		hiss_rxq_output <= 1'b1;
	else
		hiss_rxq_output <= 1'b0;
end

always @(hiss_clk)
begin
	if (hiss_clk == 1'b1)
		hiss_clk_output <= 1'b1;
	else
		hiss_clk_output <= 1'b0;
end

always @(hiss_txien or hiss_txi_output )
if (hiss_txien & hiss_txi_output)
	hiss_txi <= 1'b1;
else
	hiss_txi <= 1'b0;

always @(hiss_txqen or hiss_txq_output )
if (hiss_txqen & hiss_txq_output)
	hiss_txq <= 1'b1;
else
	hiss_txq <= 1'b0;

assign vhigh_driver = hiss_curr;
assign vlow_driver  = ~hiss_curr;
assign hissrxip = hiss_replien & hiss_rxien & (vhigh_driver*hiss_rxi_output);
assign hissrxin = hiss_replien & hiss_rxien & (vhigh_driver*(1'b1-hiss_rxi_output));
assign hissrxqp = hiss_replien & hiss_rxqen & (vhigh_driver*hiss_rxq_output);
assign hissrxqn = hiss_replien & hiss_rxqen & (vhigh_driver*(1'b1-hiss_rxq_output));
assign hissclkp = hiss_replien & hiss_clken & (vhigh_driver*hiss_clk_output);
assign hissclkq = hiss_replien & hiss_clken & (vhigh_driver*(1'b1-hiss_clk_output));

endmodule
