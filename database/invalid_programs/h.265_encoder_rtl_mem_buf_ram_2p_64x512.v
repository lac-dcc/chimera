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
// Filename       : buf_ram_2p_64x512.v                                               
// Author         : Yibo FAN                                         
// Created        : 2014-04-07                                      
// Description    : buf ram for coefficient                                    
// $Id$                                                              
//-------------------------------------------------------------------
`include "enc_defines.v"

module buf_ram_2p_64x512 (
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
input  [8:0]				a_addr		;	
input  [`PIXEL_WIDTH*8-1:0]	a_data_i	; 
// PORT B	        		
input						b_re		;	
input  [8:0]				b_addr		;
output [`PIXEL_WIDTH*8-1:0]	b_data_o    ;

// ********************************************
//                                             
//    Signals DECLARATION                        
//                                             
// ********************************************
reg   [`PIXEL_WIDTH*8-1:0]	a_dataw		;
reg   [7:0]					a_wen		;

// ********************************************
//                                             
//    Logic DECLARATION                 
//                                             
// ********************************************
always @(*) begin
	case (a_we)
		2'b00: begin a_wen=8'hff		; a_dataw=a_data_i;  	end
		2'b01: begin a_wen={4'hf, 4'h0} ; a_dataw={a_data_i[`PIXEL_WIDTH*4-1:`PIXEL_WIDTH*0],    
		                                           a_data_i[`PIXEL_WIDTH*8-1:`PIXEL_WIDTH*4]}; end
		2'b10: begin a_wen={4'h0, 4'hf} ; a_dataw=a_data_i;  	end			  
		2'b11: begin a_wen=8'h00       	; a_dataw=a_data_i; 	end
	endcase
end

`ifndef FPGA_MODEL
rf_2p_be #(.Addr_Width(9), .Word_Width(`PIXEL_WIDTH*8))	
 	u_ram_2p_64x512 (
				.clka    	( clk		),  
				.cena_i  	( ~b_re		),
		        .addra_i 	( b_addr	),
		        .dataa_o 	( b_data_o	),		  
				.clkb    	( clk		),     
				.cenb_i  	( !(|a_we)	),   			  
				.wenb_i  	( a_wen		),  
				.addrb_i	( a_addr	),		  
				.datab_i    ( a_dataw   )
);

`endif

`ifdef FPGA_MODEL 

ram_2p_64x512 u_ram_2p_64x512(
	.byteena_a	( ~a_wen	),
	.clock		( clk		),
	.data		( a_dataw	),
	.rdaddress	( b_addr	),
	.wraddress	( a_addr	),
	.wren		( |a_we		),
	.q			( b_data_o	)
);

`endif 


`ifdef SMIC13_MODEL

`endif
endmodule
