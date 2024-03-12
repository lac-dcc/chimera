//----------------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//----------------------------------------------------------------------------
// Filename       : db_left_ram.v
// Author         : chewein
// Created        : 2014-04-18
// Description    : memory of current lcu left  pixels:(16 + 8 + 8 ) * 16 * 8 /2 bits
//                                                     Y   Cb  Cr        
//----------------------------------------------------------------------------
module db_left_ram(
				   clka    ,
				   
				   cena_i  ,
		           rena_i  ,
		           wena_i  ,
		           addra_i ,
		           dataa_o ,
		           dataa_i ,
				   
				   clkb    ,     
				   cenb_i  ,   
				   renb_i  ,   
				   wenb_i  ,   
				   addrb_i ,   
				   datab_o ,   
				   datab_i
							);

// ********************************************
//                                             
//    Parameter DECLARATION                    
//                                             
// ********************************************
parameter     		DATA_WIDTH	=	128	;
parameter	  		ADDR_WIDTH	=	4	;

// ********************************************
//                                             
//    Input/Output DECLARATION                    
//                                             
// ********************************************
// A port
input                     clka   ;  // clock input
input   		          cena_i ;  // chip enable, low active
input   		          rena_i ;  // data output enable, low active
input   		          wena_i ;  // write enable, low active
input   [ADDR_WIDTH-1:0]  addra_i;  // address input
input   [DATA_WIDTH-1:0]  dataa_i;  // data input
output	[DATA_WIDTH-1:0]  dataa_o;  // data output

// B Port
input                     clkb   ;  // clock input                     
input   		          cenb_i ;  // chip enable, low active         
input   		          renb_i ;  // data output enable, low active  
input   		          wenb_i ;  // write enable, low active        
input   [ADDR_WIDTH-1:0]  addrb_i;  // address input                   
input   [DATA_WIDTH-1:0]  datab_i;  // data input                      
output	[DATA_WIDTH-1:0]  datab_o;  // data output                     

// ********************************************
//                                             
//    Register DECLARATION                 
//                                             
// ********************************************
reg    [DATA_WIDTH-1:0]   mem_array[(1<<ADDR_WIDTH)-1:0];

// ********************************************
//                                             
//    Wire DECLARATION                 
//                                             
// ********************************************
reg	   [DATA_WIDTH-1:0]  dataa_r;
reg	   [DATA_WIDTH-1:0]  datab_r;

// ********************************************
//                                             
//    Logic DECLARATION                 
//                                             
// ********************************************
// -- A Port --//
always @(posedge clka) begin                
	if(!cena_i && !wena_i) 
		mem_array[addra_i] <= dataa_i;
end

always @(posedge clka) begin
	if (!cena_i && wena_i)
		dataa_r <= mem_array[addra_i];
	else
		dataa_r <= 'bx;
end

assign dataa_o = rena_i ? 'bz : dataa_r;

// -- B Port --//
always @(posedge clkb) begin                
	if(!cenb_i && !wenb_i) 
		mem_array[addrb_i] <= datab_i;
end

always @(posedge clkb) begin   
	if (!cenb_i && wenb_i)
		datab_r <= mem_array[addrb_i];
	else
		datab_r <= 'bx;
end

assign datab_o = renb_i ? 'bz : datab_r;

endmodule

