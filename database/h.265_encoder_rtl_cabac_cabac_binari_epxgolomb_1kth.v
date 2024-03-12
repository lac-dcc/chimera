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
//-----------------------------------------------------------------------------------------------------------------------------
// Filename       : cabac_binari_epxgolomb_1kth.v
// Author         : chewein
// Created        : 2014-9-11
// Description    : binarization process of 1kth epxgolomb 
//-----------------------------------------------------------------------------------------------------------------------------
`include"enc_defines.v"

module cabac_binari_epxgolomb_1kth(
                                    symbol_i       ,
									mv_sign_i      ,
									
									num_bins_2_o   ,
									num_bins_1_o   ,
									num_bins_0_o   ,
									mv_bins_o    
                            );
//-----------------------------------------------------------------------------------------------------------------------------
//
//              inputs and outputs declaration 
//
//-----------------------------------------------------------------------------------------------------------------------------							
input         [ 7:0 ]   		       symbol_i                      ;
input                   		       mv_sign_i                     ;

output        [ 2:0 ]   		       num_bins_2_o                  ;
output        [ 2:0 ]   		       num_bins_1_o                  ;
output        [ 2:0 ]   		       num_bins_0_o                  ;							
output        [14:0 ]   		       mv_bins_o                     ;							

//-----------------------------------------------------------------------------------------------------------------------------
//
//             reg  signals declaration 
//
//-----------------------------------------------------------------------------------------------------------------------------		

reg           [ 2:0 ]   		       num_bins_2_r                  ;
reg           [ 2:0 ]   		       num_bins_1_r                  ;
reg           [ 2:0 ]   		       num_bins_0_r                  ;	


//-----------------------------------------------------------------------------------------------------------------------------
//
//            binarization process of 1kth epxgolomb 
//
//-----------------------------------------------------------------------------------------------------------------------------		
/* 
always @* begin  
    case(symbol_i)
         6'd0: begin num_group_r = 3'd1;bins_group_2_r=4'd0 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd0 ;num_bins_1_r =3'd0;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	     6'd1: begin num_group_r = 3'd1;bins_group_2_r=4'd1 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd0 ;num_bins_1_r =3'd0;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	     6'd2: begin num_group_r = 3'd1;bins_group_2_r=4'd8 ;num_bins_2_r= 3'd4;bins_group_1_r=4'd0 ;num_bins_1_r =3'd0;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	     6'd3: begin num_group_r = 3'd1;bins_group_2_r=4'd9 ;num_bins_2_r= 3'd4;bins_group_1_r=4'd0 ;num_bins_1_r =3'd0;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	     6'd4: begin num_group_r = 3'd1;bins_group_2_r=4'd10;num_bins_2_r= 3'd4;bins_group_1_r=4'd0 ;num_bins_1_r =3'd0;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	     6'd5: begin num_group_r = 3'd1;bins_group_2_r=4'd11;num_bins_2_r= 3'd4;bins_group_1_r=4'd0 ;num_bins_1_r =3'd0;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	     6'd6: begin num_group_r = 3'd2;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd0 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	     6'd7: begin num_group_r = 3'd2;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd1 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	     6'd8: begin num_group_r = 3'd2;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd2 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	     6'd9: begin num_group_r = 3'd2;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd3 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd10: begin num_group_r = 3'd2;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd4 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd11: begin num_group_r = 3'd2;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd5 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd12: begin num_group_r = 3'd2;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd6 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd13: begin num_group_r = 3'd2;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd7 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd14: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd0 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd15: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd1 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd16: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd2 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd17: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd3 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd18: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd4 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd19: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd5 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd20: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd6 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd21: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd7 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd22: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd8 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd23: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd9 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd24: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd10;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd25: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd11;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd26: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd27: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd28: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd14;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd29: begin num_group_r = 3'd2;bins_group_2_r=4'd14;num_bins_2_r= 3'd4;bins_group_1_r=4'd15;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd0;end
	    6'd30: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd5;end // include i_hor<0 and i_ver<0
	    6'd31: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd1 ;num_bins_0_r =3'd5;end
	    6'd32: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd2 ;num_bins_0_r =3'd5;end
	    6'd33: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd3 ;num_bins_0_r =3'd5;end
	    6'd34: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd4 ;num_bins_0_r =3'd5;end
	    6'd35: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd5 ;num_bins_0_r =3'd5;end
	    6'd36: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd6 ;num_bins_0_r =3'd5;end
	    6'd37: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd7 ;num_bins_0_r =3'd5;end
	    6'd38: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd8 ;num_bins_0_r =3'd5;end
	    6'd39: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd9 ;num_bins_0_r =3'd5;end
	    6'd40: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd10;num_bins_0_r =3'd5;end
	    6'd41: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd11;num_bins_0_r =3'd5;end
	    6'd42: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd12;num_bins_0_r =3'd5;end
	    6'd43: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd13;num_bins_0_r =3'd5;end
	    6'd44: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd14;num_bins_0_r =3'd5;end
	    6'd45: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd12;num_bins_1_r =3'd4;bins_group_0_r=4'd15;num_bins_0_r =3'd5;end
	    6'd46: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd5;end
	    6'd47: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd1 ;num_bins_0_r =3'd5;end
	    6'd48: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd2 ;num_bins_0_r =3'd5;end
	    6'd49: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd3 ;num_bins_0_r =3'd5;end
	    6'd50: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd4 ;num_bins_0_r =3'd5;end
	    6'd51: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd5 ;num_bins_0_r =3'd5;end
	    6'd52: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd6 ;num_bins_0_r =3'd5;end
	    6'd53: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd7 ;num_bins_0_r =3'd5;end
	    6'd54: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd8 ;num_bins_0_r =3'd5;end
	    6'd55: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd9 ;num_bins_0_r =3'd5;end
	    6'd56: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd10;num_bins_0_r =3'd5;end
	    6'd57: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd11;num_bins_0_r =3'd5;end
	    6'd58: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd12;num_bins_0_r =3'd5;end
	    6'd59: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd13;num_bins_0_r =3'd5;end
	    6'd60: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd14;num_bins_0_r =3'd5;end
	    6'd61: begin num_group_r = 3'd3;bins_group_2_r=4'd3 ;num_bins_2_r= 3'd2;bins_group_1_r=4'd13;num_bins_1_r =3'd4;bins_group_0_r=4'd15;num_bins_0_r =3'd5;end
	    6'd62: begin num_group_r = 3'd3;bins_group_2_r=4'd15;num_bins_2_r= 3'd2;bins_group_1_r=4'd8 ;num_bins_1_r =3'd4;bins_group_0_r=4'd0 ;num_bins_0_r =3'd5;end
	    6'd63: begin num_group_r = 3'd3;bins_group_2_r=4'd15;num_bins_2_r= 3'd4;bins_group_1_r=4'd8 ;num_bins_1_r =3'd4;bins_group_0_r=4'd1 ;num_bins_0_r =3'd5;end
      default: begin num_group_r = 3'd3;bins_group_2_r=4'd15;num_bins_2_r= 3'd4;bins_group_1_r=4'd8 ;num_bins_1_r =3'd4;bins_group_0_r=4'd1 ;num_bins_0_r =3'd5;end
	endcase 	
end 					
*/
wire          [ 7:0 ]                  mv_x_abs_minus128_w           ;
wire          [ 7:0 ]                  mv_x_abs_minus64_w            ;
wire          [ 7:0 ]                  mv_x_abs_minus32_w            ;
wire          [ 7:0 ]                  mv_x_abs_minus16_w            ;
wire          [ 7:0 ]                  mv_x_abs_minus8_w             ;
wire          [ 7:0 ]                  mv_x_abs_minus4_w             ;
wire          [ 7:0 ]                  mv_x_abs_minus2_w             ;

reg           [14:0 ]                  mv_x_bins_r                   ;

assign        mv_x_abs_minus128_w      =   symbol_i - 8'd128         ;
assign        mv_x_abs_minus64_w       =   symbol_i - 8'd64          ;
assign        mv_x_abs_minus32_w       =   symbol_i - 8'd32          ;
assign        mv_x_abs_minus16_w       =   symbol_i - 8'd16          ;
assign        mv_x_abs_minus8_w        =   symbol_i - 8'd8           ;
assign        mv_x_abs_minus4_w        =   symbol_i - 8'd4           ;
assign        mv_x_abs_minus2_w        =   symbol_i - 8'd2           ;


always @* begin 
	if(symbol_i[7])      begin  //128--
         mv_x_bins_r     =   {     7'b1111110,mv_x_abs_minus128_w[6:0],mv_sign_i} ;
         num_bins_2_r    =    3'd5                                                ;
         num_bins_1_r    =    3'd5                                                ;
         num_bins_0_r    =    3'd5                                                ;
    end 
	else if(symbol_i[6]) begin  //64--
         mv_x_bins_r     =   {2'b0,6'b111110 ,mv_x_abs_minus64_w[5:0] ,mv_sign_i} ;
         num_bins_2_r    =    3'd3                                                ;
         num_bins_1_r    =    3'd5                                                ;
         num_bins_0_r    =    3'd5                                                ;
    end 
	else if(symbol_i[5]) begin  //32--
         mv_x_bins_r     =   {4'b0,5'b11110  ,mv_x_abs_minus32_w[4:0] ,mv_sign_i} ;
         num_bins_2_r    =    3'd1                                                ;
         num_bins_1_r    =    3'd5                                                ;
         num_bins_0_r    =    3'd5                                                ;
    end 
	else if(symbol_i[4]) begin  //16--
         mv_x_bins_r     =   {6'b0,4'b1110   ,mv_x_abs_minus16_w[3:0] ,mv_sign_i} ;
         num_bins_2_r    =    3'd0                                                ;
         num_bins_1_r    =    3'd4                                                ;
         num_bins_0_r    =    3'd5                                                ;
    end 
	else if(symbol_i[3]) begin  //8--
         mv_x_bins_r     =   {8'b0,3'b110    ,mv_x_abs_minus8_w[2:0]  ,mv_sign_i} ;
         num_bins_2_r    =    3'd0                                                ;
         num_bins_1_r    =    3'd2                                                ;
         num_bins_0_r    =    3'd5                                                ;
    end 
	else if(symbol_i[2]) begin  //4--
         mv_x_bins_r     =   {10'b0,2'b10    ,mv_x_abs_minus4_w[1:0]  ,mv_sign_i} ;
         num_bins_2_r    =    3'd0                                                ;
         num_bins_1_r    =    3'd0                                                ;
         num_bins_0_r    =    3'd5                                                ;
    end 
	else if(symbol_i[1]) begin  //2--
         mv_x_bins_r     =   {12'b0,1'b0     ,mv_x_abs_minus2_w[0]    ,mv_sign_i} ;
         num_bins_2_r    =    3'd0                                                ;
         num_bins_1_r    =    3'd0                                                ;
         num_bins_0_r    =    3'd3                                                ;
    end 
	else if(symbol_i[0]) begin  //1--
         mv_x_bins_r     =   {14'b0,                                   mv_sign_i} ;
         num_bins_2_r    =    3'd0                                                ;
         num_bins_1_r    =    3'd0                                                ;
         num_bins_0_r    =    3'd1                                                ;
    end
	else                begin  //0--
         mv_x_bins_r     =    15'b0                                               ;
         num_bins_2_r    =    3'd0                                                ;
         num_bins_1_r    =    3'd0                                                ;
         num_bins_0_r    =    3'd0                                                ;
    end 	
end

//-----------------------------------------------------------------------------------------------------------------------------
//
//            output 
//
//-----------------------------------------------------------------------------------------------------------------------------								
  
assign       mv_bins_o       =  mv_x_bins_r                          ;
assign 		 num_bins_2_o    =	num_bins_2_r                         ;
assign 		 num_bins_1_o    =	num_bins_1_r  	                     ;
assign       num_bins_0_o    =  num_bins_0_r                         ;

endmodule 

