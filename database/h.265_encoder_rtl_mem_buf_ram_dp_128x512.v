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
// Filename       : buf_ram_dp_128x512.v                                               
// Author         : Yibo FAN                                         
// Created        : 2014-04-07                                      
// Description    : buf ram for coefficient                                    
// $Id$                                                              
//-------------------------------------------------------------------
`include "enc_defines.v"

module buf_ram_dp_128x512 (
    				clk  		,
    				a_ce        ,
    				a_we		,
    				a_addr		,
    				a_data_i    ,
    				a_data_o  	,  
    				b_ce		,
    				b_we		,
    				b_addr		,
    				b_data_i    ,
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
input						a_ce 		;       
input  [1:0]				a_we		;	   
input  [8:0]				a_addr		;	
input  [`COEFF_WIDTH*8-1:0]	a_data_i	;
output [`COEFF_WIDTH*8-1:0]	a_data_o	;  
// PORT B	        		
input						b_ce		;	
input  [1:0]				b_we		;
input  [8:0]				b_addr		;
input  [`COEFF_WIDTH*8-1:0]	b_data_i    ;
output [`COEFF_WIDTH*8-1:0]	b_data_o    ;

// ********************************************
//                                             
//    Signals DECLARATION                        
//                                             
// ********************************************
reg   [`COEFF_WIDTH*8-1:0]	a_dataw		;
reg   [15:0]				a_wen		;

// ********************************************
//                                             
//    Logic DECLARATION                 
//                                             
// ********************************************
always @(*) begin
	case (a_we)
		2'b00: begin a_wen=16'hffff		; a_dataw=a_data_i;  	end
		2'b01: begin a_wen={8'hff, 8'h0}; a_dataw={a_data_i[`COEFF_WIDTH*4-1:`COEFF_WIDTH*0],    
		                                           a_data_i[`COEFF_WIDTH*8-1:`COEFF_WIDTH*4]};	 end
		2'b10: begin a_wen={8'h0, 8'hff}; a_dataw=a_data_i;  	end
		2'b11: begin a_wen=16'h0        ; a_dataw=a_data_i; 	end
	endcase
end

`ifndef FPGA_MODEL
ram_dp_be #(.Addr_Width(9), .Word_Width(`COEFF_WIDTH*8))	
 	u_ram_dp_128x512 (
				.clka    	( clk		),  
				.cena_i  	( ~a_ce		),
		        .oena_i  	( 1'b0		),
		        .wena_i  	( a_wen		),
		        .addra_i 	( a_addr	),
		        .dataa_o 	( a_data_o	),
		        .dataa_i 	( a_dataw	),
				.clkb    	( clk		),     
				.cenb_i  	( ~b_ce		),   
				.oenb_i  	( 1'b0		),   
				.wenb_i  	( {16{1'b1}}		),  
				.addrb_i	( b_addr	),
				.datab_o 	( b_data_o	),   
				.datab_i    ( b_data_i  )
);

`endif

`ifdef FPGA_MODEL 
wire wren_a;
wire wren_b;

assign wren_a = &a_wen;

ram_dp_512x128 u_ram_dp_512x128(
	.address_a	( a_addr	),
	.address_b	( b_addr	),
	.byteena_a	( ~a_wen	),
	.clock		( clk		),
	.data_a		( a_dataw	),
	.data_b		( b_data_i	),
	.rden_a		( a_ce&&wren_a	),
	.rden_b		( b_ce		),
	.wren_a		( ~wren_a	),
	.wren_b		( 1'b0		),
	.q_a		( a_data_o	),
	.q_b		( b_data_o	)
);

`endif 


`ifdef SMIC13_MODEL

`endif
endmodule
