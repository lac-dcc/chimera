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
// Filename       : buf_ram_2p_64x32.v                                               
// Author         : Yibo FAN                                         
// Created        : 2014-04-07                                      
// Description    : buf ram for coefficient                                    
// $Id$                                                              
//-------------------------------------------------------------------
`include "enc_defines.v"

module buf_ram_2p_64x32 (
    				clk  		,
    				a_we        ,
    				a_addr		,
    				a_data_i    , 
    				b_re		,
    				b_addr		,
    				b_data_o    
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
// PORT A           		      
input  [1:0]				a_we		;	   
input  [4:0]				a_addr		;	
input  [`PIXEL_WIDTH*8-1:0]	a_data_i	; 
// PORT B	        		
input						b_re		;	
input  [4:0]				b_addr		;
output [`PIXEL_WIDTH*8-1:0]	b_data_o    ;

// ********************************************
//                                             
//    Signals DECLARATION                        
//                                             
// ********************************************
reg   [7:0]					a_wen		;

// ********************************************
//                                             
//    Logic DECLARATION                 
//                                             
// ********************************************
always @(*) begin
	case (a_we)
		2'b00: begin a_wen=8'hff		; end
		2'b01: begin a_wen={4'hf, 4'h0} ; end
		2'b10: begin a_wen={4'b0, 4'hf} ; end			  
		2'b11: begin a_wen=8'h00       	; end
	endcase
end

`ifndef FPGA_MODEL
rf_2p_be #(.Addr_Width(5), .Word_Width(`PIXEL_WIDTH*8))	
 	u_ram_2p_64x32 (
				.clka    	( clk		),  
				.cena_i  	( ~b_re		),
		        .addra_i 	( b_addr	),
		        .dataa_o 	( b_data_o	),		  
				.clkb    	( clk		),     
				.cenb_i  	( !(|a_we)	),   			  
				.wenb_i  	( a_wen		),  
				.addrb_i	( a_addr	),		  
				.datab_i    ( a_data_i  )
);

`endif

`ifdef FPGA_MODEL 

ram_2p_64x32 u_ram_2p_64x32(
	.byteena_a	( ~a_wen	),
	.clock		( clk		),
	.data		( a_data_i	),
	.rdaddress	( b_addr	),
	.wraddress	( a_addr	),
	.wren		( |a_we		),
	.q			( b_data_o	)
);

`endif 


`ifdef SMIC13_MODEL

`endif
endmodule
