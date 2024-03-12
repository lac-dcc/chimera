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
// Filename       : db_sao_cal_offset.v
// Author         : Chewein
// Created        : 2015-03-19
// Description    : calculation the offset dependent on the band 
//                  number and state  
//-------------------------------------------------------------------
module db_sao_cal_offset(
                   b_state_i                   ,
                   b_num_i                     ,
				   data_valid_i                ,
				   b_offset_o                  ,
                   b_distortion_o          				   
				   
				);
//---------------------------------------------------------------------------
//
//                        INPUT/OUTPUT DECLARATION 
//
//----------------------------------------------------------------------------
parameter DATA_WIDTH	=	 128	                    ;
parameter PIXEL_WIDTH   =    8                          ;
parameter DIFF_WIDTH    =    20                         ;
parameter DIS_WIDTH     =    25                         ;

input  signed    [DIFF_WIDTH-1:0]    b_state_i          ;
input            [     12     :0]    b_num_i            ;
input                                data_valid_i       ;
output signed    [      2     :0]    b_offset_o         ;
output signed    [ DIS_WIDTH-1:0]    b_distortion_o     ;


reg    signed    [DIFF_WIDTH-1:0]    b_state_r          ;
reg              [     12     :0]    b_num_r            ;

reg              [DIFF_WIDTH-1:0]    b_state_unsigned_r ;
wire             [      14    :0]    b_num_m2_w         ;
wire             [      14    :0]    b_num_m3_w         ;
reg              [      1     :0]    b_offset_unsigned_r;
reg    signed    [      2     :0]    b_offset_r         ;

always @* begin 
    case(data_valid_i)
        1'b0 :begin b_state_r = 'd0      ; b_num_r = 13'd0  ;end
	    1'b1 :begin b_state_r = b_state_i; b_num_r = b_num_i;end	
    endcase 
end



always @* begin 
    case(b_state_r[DIFF_WIDTH-1])
        1'b0 : b_state_unsigned_r  = {1'b0,b_state_r}   ;
	    1'b1 : b_state_unsigned_r  = (~b_state_r)+1'b1  ;	
    endcase 
end

assign    b_num_m2_w  =  {b_num_r,1'b0}                 ; 
assign    b_num_m3_w  =  {b_num_r,1'b0} +  b_num_r      ; 

always @* begin 
    if(!b_num_r)
        b_offset_unsigned_r   =    2'd0                 ;
	else if(b_state_unsigned_r<b_num_r)	
		b_offset_unsigned_r   =    2'd0                 ;
	else if(b_state_unsigned_r<b_num_m2_w)	
		b_offset_unsigned_r   =    2'd1                 ;
	else if(b_state_unsigned_r<b_num_m3_w)	
		b_offset_unsigned_r   =    2'd2                 ;
	else 	
		b_offset_unsigned_r   =    2'd3                 ;
end 

always @* begin 
    case(b_state_r[DIFF_WIDTH-1])
        1'b0 : b_offset_r = {1'b0,b_offset_unsigned_r}  ;
        1'b1 : b_offset_r = ~(b_offset_unsigned_r)+1'b1 ;
	endcase
end 

wire signed   [ 5:0] temp1= b_offset_r * b_offset_r;
wire signed   [18:0] temp2= b_num_r    * temp1     ;
wire signed   [DIS_WIDTH-1:0] temp3= b_state_r*b_offset_r   ;


assign   b_offset_o   =     b_offset_r                  ;
assign   b_distortion_o =   temp2  - {temp3,1'b0}       ;


endmodule

 