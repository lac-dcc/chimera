//----------------------------------------------------------------------------- 
// The confidential and proprietary information contained in this file may 
// only be used by a person authorised under and to the extent permitted 
// by a subsisting licensing agreement from ARM Limited. 
// 
// (C) COPYRIGHT 2007-2013 ARM Limited. 
// ALL RIGHTS RESERVED 
// 
// This entire notice must be reproduced on all copies of this file 
// and copies of this file may only be made by a person if such person is 
// permitted to do so under the terms of a subsisting license agreement 
// from ARM Limited. // // Version and Release Control Information: 
// 
// File Revision : $Revision: 368444 $ 
// File Date : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $ 
// 
// Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//----------------------------------------------------------------------------- 
//----------------------------------------------------------------------------- 
// APB asynchronous bridge 
//----------------------------------------------------------------------------- 
module cxapbasyncbridge ( 
// Slave Interface 
//Clock and reset signals 
input pclkens, 
input pclks, 
input presetsn, 
//APB3 Bus 
input [31:0] paddrs, 
input [31:0] pwdatas, 
input pwrites, 
input penables, 
input psels, 
output [31:0] prdatas, 
output pslverrs, 
output preadys, 
// Master Interface 
//Clock and reset signals 
input pclkenm, 
input pclkm, 
input presetmn, 
//APB3 Bus 
output [31:0] paddrm, 
output [31:0] pwdatam, 
output pwritem, 
output penablem, 
output pselm, 
input [31:0] prdatam, 
input pslverrm, 
input preadym 
); 

//---------------------------------------------------------------------------- 
// Wire Declaration 
//---------------------------------------------------------------------------- 

wire apb_req_async; 
wire apb_ack_async; 
wire [64:0] apb_fwd_data_async; 
wire [32:0] apb_rev_data_async; 

//---------------------------------------------------------------------------- 
// Start of code 
//---------------------------------------------------------------------------- 

cxapbasyncbridge_master_domain u_mstr ( 
//APB3 Bus 
.paddrm (paddrm), 
.pwdatam (pwdatam), 
.pwritem (pwritem), 
.penablem (penablem), 
.pselm (pselm), 
.prdatam (prdatam), 
.pslverrm (pslverrm), 
.preadym (preadym), 
//Inter-domain APB bus 
.apbs_req_async (apb_req_async), 
.apbs_ack_async (apb_ack_async), 
.apbs_fwd_data_async (apb_fwd_data_async), 
.apbs_rev_data_async (apb_rev_data_async), 
//Clock and reset signals 
.pclkenm (pclkenm), 
.pclkm (pclkm), 
.presetmn (presetmn) 
); 

cxapbasyncbridge_slave_domain u_slave ( 
//APB3 Bus 
.paddrs (paddrs), 
.pwdatas (pwdatas), 
.pwrites (pwrites), 
.penables (penables), 
.psels (psels), 
.prdatas (prdatas), 
.pslverrs (pslverrs), 
.preadys (preadys), 
//Inter-domain APB bus 
.apbm_req_async (apb_req_async), 
.apbm_ack_async (apb_ack_async), 
.apbm_fwd_data_async (apb_fwd_data_async), 
.apbm_rev_data_async (apb_rev_data_async), 
//Clock and reset signals 
.pclkens (pclkens), 
.pclks (pclks), 
.presetsn (presetsn) 
); 
endmodule 
