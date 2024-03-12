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


module cabac_neighbour_1p_MB_X_TOTAL(
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
input	[6:0]		r_addr					;	//read address of memory
input				w_en					;	//write enable signal
input	[6:0]		w_addr					;	//write address of memory
input	[11:0]		w_data					;	//write data of memory, {mb_type_top, chroma_mode_top, cbp_top} = {4, 4, 9}
                                    		
output	[11:0]		r_data					;	//read data from memory	





// ********************************************
//                                             
//    Logic DECLARATION                 
//                                             
// ********************************************

rf_2p #(.Addr_Width(7), .Word_Width(12))	
	   rf_2p_cabac_neigh_12x128 (
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














