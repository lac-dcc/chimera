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
// Filename       : cabac_neighbour_2p_17x128.v
// Author         : guo yong
// Created        : 2013-07
// Description    : cabac memory for top macroblock 
//               
//-------------------------------------------------------------------

`include "enc_defines.v"
module cabac_neighbour_1p_8xMB_X_TOTAL(
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
input				clk						;	//clock signal
input				r_en					;	//read enable signal
input	[(`PIC_X_WIDTH)-1:0]		r_addr					;	//read address of memory
input				w_en					;	//write enable signal
input	[(`PIC_X_WIDTH)-1:0]		w_addr					;	//write address of memory
input	[7:0]		w_data					;	//write data of memory, {mb_type_top, chroma_mode_top, cbp_top} = {4, 4, 9}
                                    		
output	[7:0]		r_data					;	//read data from memory	





// ********************************************
//                                             
//    Logic DECLARATION                 
//                                             
// ********************************************

rf_1p #(.Addr_Width((`PIC_X_WIDTH)), .Word_Width(8))	 
		rf_1p_cabac_neigh_8xMB_X_TOTAL_u0(
				.clk    ( clk	 ),
		        .cen_i  ( 1'b0	 ),
		        .wen_i  ( ~w_en	 ),
		        .addr_i ( w_en ? w_addr : r_addr ),
		        .data_i ( w_data ),		
		        .data_o	( r_data )
		
);		
		




//	   	rf_1p_cabac_neigh_8xMB_X_TOTAL_u0 (
//				.clka    ( clk        ),  
//				.cena_i  ( ~r_en      ),
//		        .addra_i ( r_addr     ),
//		        .dataa_o ( r_data     ),
//				.clkb    ( clk        ),     
//				.cenb_i  ( ~w_en      ),  
//				.wenb_i  ( ~w_en      ),   
//				.addrb_i ( w_addr     ),
//				.datab_i ( w_data     )
//);
















endmodule














