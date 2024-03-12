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
// Filename       : md.v
// Author         : Yibo FAN
// Created        : 2013-12-24
// Description    : mode decision for intra
//               
// $Id$ 
//------------------------------------------------------------------- 
`include "enc_defines.v"

module md     (
				clk 				,
				rst_n 				,		
				                	
				ipre_bank_o			,
				ec_bank_o			,
				db_bank_o			,
				                	
				cef_wen_i    		,  
				cef_widx_i    		, 
				cef_data_i   		,  
  
				ec_mb_type_o		,	
				ec_mb_partition_o 	,
				ec_i_mode_o		    , 
				ec_p_mode_o		    ,
				db_non_zero_count_o	
);

// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION               
//                                             
// ********************************************
input							clk				; //clock
input							rst_n			; //reset signal 
// SYS IF
output [1:0]					ipre_bank_o 	; // mem bank sel for intra predicted pixels
output [1:0]				 	ec_bank_o		; // mem bank sel for cabac
output [1:0]					db_bank_o		; // mem bank sel for deblocking filter
// TQ IF
input 							cef_wen_i		; // tq coefficient write enable		  
input [4:0]						cef_widx_i		; // tq coefficient write row pixel number
input [`COEFF_WIDTH*32-1:0]		cef_data_i		; // tq coefficient values                
// EC IF
output							ec_mb_type_o	;
output [20:0]					ec_mb_partition_o; // intra cu partition
output [((2^`CU_DEPTH)^2)*6-1:0]ec_i_mode_o		; // intra mode 
output [169:0]					ec_p_mode_o   	; // Inter mode        
output							db_non_zero_count_o;

// ********************************************
//                                             
//    Register DECLARATION                         
//                                             
// ********************************************


// ********************************************
//                                             
//    Wire DECLARATION                         
//                                             
// ********************************************


// ********************************************
//                                             
//    Logic DECLARATION                         
//                                             
// ********************************************



endmodule