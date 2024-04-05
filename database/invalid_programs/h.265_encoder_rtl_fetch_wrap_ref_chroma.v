//-------------------------------------------------------------------
//
//  COPYRIGHT (C) 2014, VIPcore Group, Fudan University
//
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//
//  VIPcore       : http://soc.fudan.edu.cn/vip
//  IP Owner      : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn
//
//-------------------------------------------------------------------
//
//  Filename      : wrap_ref_chroma.v
//  Author        : Yufeng Bai
//  Email         : byfchina@gmail.com    
//
//  $Id$
//
//-------------------------------------------------------------------

`include "enc_defines.v"

module wrap_ref_chroma (
    clk            ,
    rstn           ,

    wrif_en_i      ,
    wrif_addr_i    ,
    wrif_data_i   ,

    rdif_en_i      ,
    rdif_addr_i   ,
    rdif_pdata_o        
);

// ********************************************
//
//    INPUT / OUTPUT DECLARATION
//
// ********************************************

input      [1-1:0]                  clk               ; // clk signal 
input      [1-1:0]                  rstn              ; // asynchronous reset 

input      [1-1:0]                  wrif_en_i         ; // write enabel signal 
input      [6-1:0]                  wrif_addr_i       ; // mem addr (0 - 95) 
input      [48*`PIXEL_WIDTH-1:0]    wrif_data_i       ; // write pixel data (8 pixels) 

input      [1-1:0]                  rdif_en_i         ; // read referrence pixels enable signale 
input      [6-1:0]                  rdif_addr_i       ; // search window x position (0 - 32 )
output     [48*`PIXEL_WIDTH-1:0]    rdif_pdata_o      ; // referrence pixles data 

// ********************************************
//
//    Wire DECLARATION
//
// ********************************************

wire       [6-1:0]                  ref_addr;

assign ref_addr = (wrif_en_i) ? wrif_addr_i : rdif_addr_i;

// ********************************************
//
//   MEM INSTANCE DECLARATION
//
// ********************************************

rf_1p #(.Addr_Width(6),.Word_Width(`PIXEL_WIDTH*48))
	wrap (
	.clk (clk),
	.cen_i(1'b0),
	.wen_i(~wrif_en_i),
	.addr_i(ref_addr),
	.data_i(wrif_data_i),
	.data_o(rdif_pdata_o)
);


endmodule

