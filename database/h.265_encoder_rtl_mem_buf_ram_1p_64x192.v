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
// Filename       : buf_ram_1p_64x192.v                                               
// Author         : Yibo FAN                                         
// Created        : 2014-04-07                                      
// Description    : buf ram for coefficient                                    
// $Id$                                                              
//-------------------------------------------------------------------
`include "enc_defines.v"

module buf_ram_1p_64x192 (
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
input  [7:0]				addr		;	
input  [`PIXEL_WIDTH*8-1:0]	data_i		; 
output [`PIXEL_WIDTH*8-1:0]	data_o    	;

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
`ifndef FPGA_MODEL 
ram_1p #(.Addr_Width(8), .Word_Width(`PIXEL_WIDTH*8))	
 	u_ram_1p_64x192 (
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

ram_1p_64x192 u_ram_1p_64x192 (
 				.clock  	( clk		), 
 				.rden       ( ce&&~we	),
 	            .wren       ( we		),
 	            .address    ( addr		),
 	            .data       ( data_i	),
 	            .q          ( data_o	)
);

`endif 


`ifdef SMIC13_MODEL

`endif
endmodule
