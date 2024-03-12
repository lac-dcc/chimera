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
// Filename       : db_sao_compare_cost.v                            
// Author         : Chewein                                           
// Created        : 2015-03-23                                        
// Description    : calculation the final offset                      
//------------------------------------------------------------------- 
module db_sao_compare_cost(
                            b_cost_0_i     ,
                            b_cost_1_i     ,
                            b_cost_2_i     ,
                            b_cost_3_i     ,
                            b_cost_4_i     ,
                            b_cost_o       ,
                            b_band_o  	   
						);
//---------------------------------------------------------------------------
//                                                                           
//                        INPUT/OUTPUT DECLARATION                           
//                                                                           
//---------------------------------------------------------------------------
parameter DIS_WIDTH     =    25                         ;

input   signed [DIS_WIDTH+2:0 ] b_cost_0_i              ;
input   signed [DIS_WIDTH+2:0 ] b_cost_1_i              ;
input   signed [DIS_WIDTH+2:0 ] b_cost_2_i              ;
input   signed [DIS_WIDTH+2:0 ] b_cost_3_i              ;
input   signed [DIS_WIDTH+2:0 ] b_cost_4_i              ;
output  signed [DIS_WIDTH+2:0 ] b_cost_o                ;
output         [          2:0 ] b_band_o                ;

reg     signed [DIS_WIDTH+2:0 ] b_cost_r                ;
reg            [          2:0 ] b_band_r                ;

wire          b_cost_0lt1_w                             ;
wire          b_cost_0lt2_w                             ;
wire          b_cost_0lt3_w                             ;
wire          b_cost_0lt4_w                             ;

wire          b_cost_1lt2_w                             ;
wire          b_cost_1lt3_w                             ;
wire          b_cost_1lt4_w                             ;

wire          b_cost_2lt3_w                             ;
wire          b_cost_2lt4_w                             ;

wire          b_cost_3lt4_w                             ;


assign        b_cost_0lt1_w =  b_cost_0_i <= b_cost_1_i ;
assign        b_cost_0lt2_w =  b_cost_0_i <= b_cost_2_i ;
assign        b_cost_0lt3_w =  b_cost_0_i <= b_cost_3_i ;
assign        b_cost_0lt4_w =  b_cost_0_i <= b_cost_4_i ;

assign        b_cost_1lt2_w =  b_cost_1_i <= b_cost_2_i ;
assign        b_cost_1lt3_w =  b_cost_1_i <= b_cost_3_i ;
assign        b_cost_1lt4_w =  b_cost_1_i <= b_cost_4_i ;

assign        b_cost_2lt3_w =  b_cost_2_i <= b_cost_3_i ;
assign        b_cost_2lt4_w =  b_cost_2_i <= b_cost_4_i ;

assign        b_cost_3lt4_w =  b_cost_3_i <= b_cost_4_i ;


always @* begin 
    if(b_cost_0lt1_w && b_cost_0lt2_w && b_cost_0lt3_w && b_cost_0lt4_w) begin 
        b_cost_r  =   b_cost_0_i  ;
		b_band_r  =   3'd0        ;   
    end 
    else if(b_cost_1lt2_w && b_cost_1lt3_w && b_cost_1lt4_w ) begin 
        b_cost_r  =   b_cost_1_i  ;
		b_band_r  =   3'd1        ;   
    end 
    else if(b_cost_2lt3_w && b_cost_2lt4_w ) begin
        b_cost_r  =   b_cost_2_i  ;
		b_band_r  =   3'd2        ;   
    end 
    else if(b_cost_3lt4_w) begin 
        b_cost_r  =   b_cost_3_i  ;
		b_band_r  =   3'd3        ;   
    end 
    else begin 
        b_cost_r  =   b_cost_4_i  ;
		b_band_r  =   3'd4        ; 
    end 
end 

assign      b_cost_o   =   b_cost_r   ;
assign      b_band_o   =   b_band_r   ;


endmodule 
