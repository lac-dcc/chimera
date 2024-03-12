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
// Filename       : cabac_ctx_state_2p_7x64.v
// Author         : guo yong
// Created        : 2013-07
// Description    : cabac memory for modules
//               
//-------------------------------------------------------------------


module cabac_ctx_state_2p_7x64(
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
input	[5:0]		r_addr					;	//read address of memory
input				w_en					;	//write enable signal
input	[5:0]		w_addr					;	//write address of memory
input	[6:0]		w_data					;	//write data of memory
                                    		
output	[6:0]		r_data					;	//read data from memory		





// ********************************************
//                                             
//    Logic DECLARATION                 
//                                             
// ********************************************

rf_2p #(.Addr_Width(6), .Word_Width(7))	
	   rf_2p_ctx_state_7x64 (
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









