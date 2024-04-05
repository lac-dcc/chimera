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
// Filename       : buf_ram_1p_6x85.v                                               
// Author         : Yibo FAN                                         
// Created        : 2014-04-07                                      
// Description    : buf ram for coefficient                                    
// $Id$                                                              
//-------------------------------------------------------------------
`include "enc_defines.v"

module buf_ram_1p_6x85 (
    				clk  		,
    				ce	        ,  
    				we			,
    				addr		,
    				data_i    	, 
    				data_o	
);

// ********************************************
//                                             
//    Parameters DECLARATION                 
//                                             
// ********************************************


// ********************************************
//                                             
//    Input/Output DECLARATION                    
//                                             
// ********************************************
input               		clk      	;           		      
input  						ce			;	
input						we			;   
input  [9:0]				addr		;	
input  [5:0]				data_i		; 
output [5:0]				data_o    	;

// ********************************************
//                                             
//    Signals DECLARATION                        
//                                             
// ********************************************


// ********************************************
//                                             
//    Logic DECLARATION                 
//                                             
// ********************************************
`ifdef RTL_MODEL
ram_1p #(.Addr_Width(10), .Word_Width(6))	
 	u_ram_1p_6x85 (
 				.clk  		( clk		), 
 				.cen_i      ( ~ce		),
 				.oen_i      ( 1'b0		),
 	            .wen_i      ( ~we		),
 	            .addr_i     ( addr		),
 	            .data_i     ( data_i	),
 	            .data_o     ( data_o	)
);

`endif 


`ifdef FPGA_MODEL 

`endif 


`ifdef SMIC13_MODEL

`endif
endmodule
