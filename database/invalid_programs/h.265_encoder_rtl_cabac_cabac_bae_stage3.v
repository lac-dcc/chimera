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
// Filename       : cabac_bae.v
// Author         : chewein
// Created        : 2014-09-03
// Description    : HEVC binary arithmetic encoding
//-------------------------------------------------------------------------------------------
`include "enc_defines.v"

module cabac_bae_stage3(
                        low_i                , 
						shift_i              ,
						t_range_i            ,
						bin_eq_lps_i         ,
                        bin_neq_mps_i        ,
						range_i              ,
						bae_ctx_pair_i       ,
						
						low_update_o         ,
                        overflow_bits_num_o  ,
						overflow_bits_o      ,
						outstanding_flag_o   
                    );
//-------------------------------------------------------------------------------------------
//
//-------------------------------------------------------------------------------------------

input       [ 9:0]       low_i                              ; 
input       [ 3:0]       shift_i                            ; // regular mode : shift_i if bin==lps
input       [ 8:0]       t_range_i                          ; // regular mode : t_range calculated in stage 2 
input                    bin_eq_lps_i                       ; // regular mode : bin == lps
input                    bin_neq_mps_i                      ; // regular mode : t_range >=256 
input       [ 8:0]       range_i                            ;
input       [ 9:0]       bae_ctx_pair_i                     ;    

output      [ 9:0]       low_update_o                       ;
output      [ 2:0]       overflow_bits_num_o                ;
output      [ 5:0]       overflow_bits_o                    ;
output                   outstanding_flag_o                 ;

reg         [ 9:0]       low_update_o                       ;
reg         [ 2:0]       overflow_bits_num_o                ;
reg         [ 5:0]       overflow_bits_o                    ;
reg                      outstanding_flag_o                 ;

//-------------------------------------------------------------------------------------------
//             calculation low and bits_left: bypass mode 
//-------------------------------------------------------------------------------------------	
wire        [15:0]      low_bypass_update_w                 ;
wire        [ 2:0]      bypass_overflow_bits_num_w          ;// numbers of bins 

wire        [15:0]      low_bypass_w                        ; 


wire        [14:0]      low_shift_bins_num_w                ; // low_shift_bins_num_w = low_i << bins_num
reg         [14:0]      low_addr_r                          ; // low_addr_r  =  range * bins
reg                     outstanding_bypass_flag_r           ;

assign low_shift_bins_num_w      = (low_i   << bae_ctx_pair_i[7:5])       ;
assign low_bypass_update_w       = low_shift_bins_num_w + low_addr_r      ;
assign bypass_overflow_bits_num_w= bae_ctx_pair_i[7:5]                    ;

always @* begin 
    case(bae_ctx_pair_i[7:5]) 
        3'd1 : outstanding_bypass_flag_r = !(!low_bypass_update_w[15:11]) ;
        3'd2 : outstanding_bypass_flag_r = !(!low_bypass_update_w[15:12]) ;
        3'd3 : outstanding_bypass_flag_r = !(!low_bypass_update_w[15:13]) ;
        3'd4 : outstanding_bypass_flag_r = !(!low_bypass_update_w[15:14]) ; 
        3'd5 : outstanding_bypass_flag_r =    low_bypass_update_w[15   ]  ;
      default: outstanding_bypass_flag_r =  1'b0                          ;
    endcase
end 

// calculation low_addr_r 
always @* begin
    case(bae_ctx_pair_i[4:0])
		5'd0 : low_addr_r  =   11'd0       ;  
		5'd1 : low_addr_r  =   (range_i   );   
		5'd2 : low_addr_r  =   (range_i<<1);  
		5'd3 : low_addr_r  =   (range_i<<1) + (range_i)   ;  
		5'd4 : low_addr_r  =   (range_i<<2)               ;  
		5'd5 : low_addr_r  =   (range_i<<2) + (range_i)   ;  
		5'd6 : low_addr_r  =   (range_i<<2) + (range_i<<1)             ;  
		5'd7 : low_addr_r  =   (range_i<<2) + (range_i<<1)+ range_i    ;  
		5'd8 : low_addr_r  =   (range_i<<3)               ;  
		5'd9 : low_addr_r  =   (range_i<<3) +  range_i    ;  
		5'd10: low_addr_r  =   (range_i<<3) + (range_i<<1);  
		5'd11: low_addr_r  =   (range_i<<3) + (range_i<<1) + range_i   ;  
		5'd12: low_addr_r  =   (range_i<<3) + (range_i<<2)             ;  
		5'd13: low_addr_r  =   (range_i<<3) + (range_i<<2) + range_i   ;  
		5'd14: low_addr_r  =   (range_i<<3) + (range_i<<2) +(range_i<<1)          ;  
		5'd15: low_addr_r  =   (range_i<<3) + (range_i<<2) +(range_i<<1) + range_i;  
		5'd16: low_addr_r  =   (range_i<<4)               ;  
		5'd17: low_addr_r  =   (range_i<<4) + (range_i   );  
		5'd18: low_addr_r  =   (range_i<<4) + (range_i<<1);  
		5'd19: low_addr_r  =   (range_i<<4) + (range_i<<1)+  range_i   ;
		5'd20: low_addr_r  =   (range_i<<4) + (range_i<<2)             ;  
		5'd21: low_addr_r  =   (range_i<<4) + (range_i<<2)+  range_i   ;  
        5'd22: low_addr_r  =   (range_i<<4) + (range_i<<2)+ (range_i<<1)                            ;  
        5'd23: low_addr_r  =   (range_i<<4) + (range_i<<2)+ (range_i<<1) + range_i                  ;  
	    5'd24: low_addr_r  =   (range_i<<4) + (range_i<<3)                                          ;  
		5'd25: low_addr_r  =   (range_i<<4) + (range_i<<3)+ (range_i   )                            ;  
		5'd26: low_addr_r  =   (range_i<<4) + (range_i<<3)+ (range_i<<1)                            ;  
		5'd27: low_addr_r  =   (range_i<<4) + (range_i<<3)+ (range_i<<1) + range_i                  ;  
		5'd28: low_addr_r  =   (range_i<<4) + (range_i<<3)+ (range_i<<2)                            ;  
		5'd29: low_addr_r  =   (range_i<<4) + (range_i<<3)+ (range_i<<2) + range_i                  ;  
		5'd30: low_addr_r  =   (range_i<<4) + (range_i<<3)+ (range_i<<2) +(range_i<<1)              ;
		5'd31: low_addr_r  =   (range_i<<4) + (range_i<<3)+ (range_i<<2) +(range_i<<1) + range_i    ;
    endcase 
end 


//-------------------------------------------------------------------------------------------
//             calculation low and bits_left :  terminal mode 
//-------------------------------------------------------------------------------------------	
//  calculation low 
reg         [15:0]      low_terminal_update_r                 ;
reg         [ 2:0]      terminal_overflow_bits_num_r          ;
// calculation bits_left
always @* begin
    if(bae_ctx_pair_i[7]) begin  // bin 
        low_terminal_update_r  = (low_i  + t_range_i)         ; 
		terminal_overflow_bits_num_r   = 3'd0                 ;
	end 
	else if(t_range_i[8]) begin  // >=256 
        low_terminal_update_r  =  {6'b00_0000,low_i}          ;
		terminal_overflow_bits_num_r   =  3'd0                ;
	end 
	else begin  
	    low_terminal_update_r  =  {5'b0_0000,low_i,1'b0}      ;
        terminal_overflow_bits_num_r   =  3'd1                ;		
	end
end 

//-------------------------------------------------------------------------------------------
//             calculation low and bits_left:  regular mode  
//-------------------------------------------------------------------------------------------	

// calculation low 
reg         [15:0]      low_regular_update_r                   ;
reg         [ 2:0]      regular_overflow_bits_num_r            ;

wire        [10:0]      low_m_w = low_i + t_range_i            ;

always @* begin
	if(bin_eq_lps_i) begin 
        low_regular_update_r    =(low_m_w<<shift_i)            ; 
		regular_overflow_bits_num_r = shift_i[2:0]             ;
	end 
	else if(bin_neq_mps_i) begin         
        low_regular_update_r    = {6'b0,low_i}                 ;
        regular_overflow_bits_num_r	= 3'd0	                   ;
	end 
	else begin  
        low_regular_update_r   = {5'b0000_0,low_i,1'b0}        ;  
		regular_overflow_bits_num_r= 3'd1                      ;
    end 
end 

//-------------------------------------------------------------------------------------------
//                           output  
//-------------------------------------------------------------------------------------------

always @* begin 
    case(bae_ctx_pair_i[9:8])
        2'b01:  low_update_o    =  low_i                       ;  // 1 : input unvalid 
		2'b00:  low_update_o    =  low_regular_update_r[9:0]   ;  // 0 : regular  mode 
	    2'b10:  low_update_o    =  low_bypass_update_w[9:0]    ;  // 2 : bypass   mode 
	    2'b11:	low_update_o    =  low_terminal_update_r[9:0]  ;  // 3 : terminal mode 
    endcase                                                    
end                                                            

always @* begin                                                
    case(bae_ctx_pair_i[9:8])                                  
        2'b01:  overflow_bits_num_o =  3'd0                        ;  // 1 : input unvalid 
		2'b00:  overflow_bits_num_o =  regular_overflow_bits_num_r ;  // 0 : regular  mode 
	    2'b10:  overflow_bits_num_o =  bypass_overflow_bits_num_w  ;  // 2 : bypass   mode 
	    2'b11:	overflow_bits_num_o =  terminal_overflow_bits_num_r;  // 3 : terminal mode 
    endcase 
end  

always @* begin 
   case(bae_ctx_pair_i[9:8])
        2'b01: outstanding_flag_o = 1'b0                           ;  // 1 : input unvalid 
		2'b00: outstanding_flag_o = bin_eq_lps_i? low_m_w[10]:1'b0 ;  // 0 : regular  mode 
		2'b10: outstanding_flag_o = outstanding_bypass_flag_r      ;  // 2 : bypass   mode 
        2'b11: outstanding_flag_o = bin_eq_lps_i ? !(!low_terminal_update_r[15:10]):1'b0;  // 3 : terminal mode 
	endcase        
end 

always @* begin 
   case(bae_ctx_pair_i[9:8])
        2'b01: overflow_bits_o = 6'b00_0000                        ;  // 1 : input unvalid 
		2'b00: overflow_bits_o = low_regular_update_r[15:10]       ;  // 0 : regular  mode 
		2'b10: overflow_bits_o = low_bypass_update_w[15:10]        ;  // 2 : bypass   mode 
        2'b11: overflow_bits_o = low_terminal_update_r[15:10]      ;  // 3 : terminal mode 
	endcase        
end 



endmodule 