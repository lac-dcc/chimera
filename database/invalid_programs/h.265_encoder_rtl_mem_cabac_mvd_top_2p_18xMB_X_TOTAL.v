//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//-------------------------------------------------------------------
// Filename       : cabac_mvd_neigh_2p_18x8.v
// Author         : guo yong
// Created        : 2013-07
// Description    : cabac memory for top macroblock mvd
//               
//-------------------------------------------------------------------

`include "enc_defines.v"
`define MEM_TOP_DEPTH		9

module cabac_mvd_top_2p_18xMB_X_TOTAL(
					//input
					clk				,
					r_en			,
					r_addr			,
					w_en			,
					w_addr			,
					w_data			,
					
					//output
					r_data
);




// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION                            
//                                             
// ********************************************
input							clk							;	//clock signal
input							r_en						;	//read enable signal
input	[`MEM_TOP_DEPTH-1:0]	r_addr						;	//read address of memory
input							w_en						;	//write enable signal
input	[`MEM_TOP_DEPTH-1:0]	w_addr						;	//write address of memory
input	[2*(`FMV_WIDTH+1)-1:0]	w_data						;	//write data of memory, {mb_type_top, chroma_mode_top, cbp_top} = {4, 4, 9}
                                		    				
output	[2*(`FMV_WIDTH+1)-1:0]	r_data						;	//read data from memory	




// ********************************************
//                                             
//    Logic DECLARATION                 
//                                             
// ********************************************

rf_2p #(.Addr_Width(`MEM_TOP_DEPTH), .Word_Width(18))	
	   rf_2p_mvd_top_18xMB_X_TOTAL (
				.clka    ( clk        ),  
				.cena_i  ( ~r_en      ),
		        .addra_i ( r_addr     ),
		        .dataa_o ( r_data     ),
				.clkb    ( clk        ),     
				.cenb_i  ( ~w_en      ),  
				.wenb_i  ( ~w_en      ),   
				.addrb_i ( w_addr     ),
				.datab_i ( w_data     )
);












endmodule














