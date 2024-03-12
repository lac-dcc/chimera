//-------------------------------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//-------------------------------------------------------------------------------------------
// Filename       : cabac_bae_stage2.v
// Author         : chewein
// Created        : 2014-09-03
// Description    : range update 
//-------------------------------------------------------------------------------------------
`include "enc_defines.v"

module cabac_bae_stage2(
                        range_lps_lut_i         ,
                        shift_lut_i             ,
                        range_i                 ,
						bin_eq_lps_i            ,
                        bin_mode_i              ,
			            range_lps_update_lut_i  , 
						
						range_update_o          ,
                        t_rang_o                ,
						bin_neq_mps_o           ,
						shift_o           
                        );
//-------------------------------------------------------------------------------------------
//
//-------------------------------------------------------------------------------------------

input       [31:0]       range_lps_lut_i                    ;  
input       [15:0]       shift_lut_i                        ;   
input       [ 8:0]       range_i                            ;
input                    bin_eq_lps_i                       ; // regular bin == lps 
input       [2:0]        bin_mode_i                         ; // [2:1] 0:input unvalid, 1: regular mode,2:bypass mode ,3:terminal mode 
                                                              //  [0]  :bin 
input       [35:0]       range_lps_update_lut_i             ;

output      [ 8:0]       range_update_o                     ;    
output      [ 8:0]       t_rang_o                           ;      
output                   bin_neq_mps_o                      ;   
output      [ 3:0]       shift_o                            ;

reg         [ 8:0]       range_update_o                     ; 
reg         [ 8:0]       t_rang_o                           ; 

//-------------------------------------------------------------------------------------------
//             first: calculation range_lps_r and shift_r and range_lps_update_r
//-------------------------------------------------------------------------------------------
wire        [1:0]        range_lut_index_w                  ;
reg         [7:0]        range_lps_r                        ;
reg         [3:0]        shift_r                            ;
reg         [8:0]        range_lps_update_r                 ;
 
assign      range_lut_index_w  =  range_i[7:6]              ; // i_range_lps >> 3

always @* begin
	case(range_lut_index_w)
	    2'd0: range_lps_r  =  range_lps_lut_i[31:24] ;
		2'd1: range_lps_r  =  range_lps_lut_i[23:16] ;
		2'd2: range_lps_r  =  range_lps_lut_i[15:8 ] ;
		2'd3: range_lps_r  =  range_lps_lut_i[7 :0 ] ; 
	endcase
end

always @* begin
	case(range_lut_index_w)
	    2'd0: shift_r  = shift_lut_i[15:12 ] ;
		2'd1: shift_r  = shift_lut_i[ 11:8 ] ;
		2'd2: shift_r  = shift_lut_i[  7:4 ] ;
		2'd3: shift_r  = shift_lut_i[  3:0 ] ;
	endcase
end

always @* begin
	case(range_lut_index_w)
	    2'd0: range_lps_update_r  = range_lps_update_lut_i[35:27] ;
		2'd1: range_lps_update_r  = range_lps_update_lut_i[26:18] ;
		2'd2: range_lps_update_r  = range_lps_update_lut_i[17:9 ] ;
		2'd3: range_lps_update_r  = range_lps_update_lut_i[8 :0 ] ; 
	endcase
end


//-------------------------------------------------------------------------------------------
//                        second: calculation t_rang_o 
//-------------------------------------------------------------------------------------------
wire        [8:0]        t_rang_w                            ;

assign      t_rang_w  =   range_i -  range_lps_r             ; // cb->i_range-i_range_lps

//-------------------------------------------------------------------------------------------
//           third: regular mode calculation range_mps_w  and range_regular_w
//-------------------------------------------------------------------------------------------

wire        [8:0]        range_mps_w                          ;     
reg         [8:0]        range_regular_r                      ;

assign      range_mps_w  = t_rang_w[8] ? t_rang_w: t_rang_w<<1;

always @* begin
    if(bin_eq_lps_i)
        range_regular_r    =  range_lps_update_r     ;
    else 
        range_regular_r    =  range_mps_w            ; 
end

//-------------------------------------------------------------------------------------------
//           third: terminal  mode calculation range_terminal_r  
//-------------------------------------------------------------------------------------------
reg         [8:0]        range_terminal_r                     ;

wire        [8:0]   range_minus_2_w    =  range_i - 2'd2      ;
wire                bin_to_be_coded_w  =  bin_mode_i[0]       ;

always @* begin 
	if(bin_to_be_coded_w)
        range_terminal_r  =  9'd256             ;
	else if(range_minus_2_w[8])
        range_terminal_r  =  range_minus_2_w    ;
	else
	    range_terminal_r  =  range_minus_2_w<<1 ;
end  


//-------------------------------------------------------------------------------------------
//                       output
//-------------------------------------------------------------------------------------------
   
always @* begin
    case(bin_mode_i[2:1])
	    2'b01:  range_update_o   =  range_i          ;  // 1 : input unvalid 
		2'b00:  range_update_o   =  range_regular_r  ;  // 0 : regular  mode 
	    2'b10:  range_update_o   =  range_i          ;  // 2 : bypass   mode 
	    2'b11:	range_update_o   =  range_terminal_r ;  // 3 : terminal mode 
	endcase
end

always @* begin
    case(bin_mode_i[2:1])
	    2'b01:  t_rang_o   =  9'd0                   ;  // 1 : input unvalid 
		2'b00:  t_rang_o   =  t_rang_w               ;  // 0 : regular  mode 
	    2'b10:  t_rang_o   =  9'd0                   ;  // 2 : bypass   mode 
	    2'b11:	t_rang_o   =  range_minus_2_w        ;  // 3 : terminal mode 
	endcase
end

assign     bin_neq_mps_o  =  t_rang_w[8]         ;  // cb->i_range >= 256
assign     shift_o        =  shift_r             ;   


endmodule

