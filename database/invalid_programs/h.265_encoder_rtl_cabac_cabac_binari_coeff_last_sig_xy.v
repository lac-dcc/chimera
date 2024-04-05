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
// Filename       : cabac_binari_coeff_last_sig_xy.v
// Author         : chewein
// Created        : 2014-10-7
// Description    : binarization coeff_last_sig_xy in a tu block 
//-----------------------------------------------------------------------------------------------------------------------------
`include"enc_defines.v" 

module cabac_binari_coeff_last_sig_xy(
                                        last_sig_x_i                           ,
                                        last_sig_y_i                           ,
                                        tu_depth_i                             ,
										cu_slice_type_i                        ,
                                        e_type_i                               ,
                                        scan_idx_i                             ,
                                        ctx_pair_last_x_prefix_0_o             ,  
										ctx_pair_last_x_prefix_1_o             ,
										ctx_pair_last_x_prefix_2_o             ,
										ctx_pair_last_x_prefix_3_o             ,
										ctx_pair_last_x_prefix_4_o             ,
										ctx_pair_last_x_prefix_5_o             ,
										ctx_pair_last_x_prefix_6_o             ,
										ctx_pair_last_x_prefix_7_o             ,
										ctx_pair_last_x_prefix_8_o             ,
										ctx_pair_last_x_prefix_9_o             ,
										ctx_pair_last_x_suffix_o               ,
										ctx_pair_last_y_prefix_0_o             ,
										ctx_pair_last_y_prefix_1_o             ,
										ctx_pair_last_y_prefix_2_o             ,
										ctx_pair_last_y_prefix_3_o             ,
										ctx_pair_last_y_prefix_4_o             ,
										ctx_pair_last_y_prefix_5_o             ,
										ctx_pair_last_y_prefix_6_o             ,
										ctx_pair_last_y_prefix_7_o             ,
										ctx_pair_last_y_prefix_8_o             ,
										ctx_pair_last_y_prefix_9_o             ,
										ctx_pair_last_y_suffix_o  						
							        );
//-----------------------------------------------------------------------------------------------------------------------------
//
//            input and output signals declaration 
//
//-----------------------------------------------------------------------------------------------------------------------------
input         [ 4:0 ]                  last_sig_x_i                            ;
input         [ 4:0 ]                  last_sig_y_i                            ;

input         [ 1:0 ]                  tu_depth_i                              ; // 0:32x32 , 1:16x16 , 2:8x8 , 3:4x4
input                                  cu_slice_type_i                         ; // 1: I, 0: P/B  
input         [ 1:0 ]                  e_type_i                                ; // 2:luma , 1 :chroma u ,0 : chroma v 
input         [ 1:0 ]                  scan_idx_i                              ;

output        [10:0]                   ctx_pair_last_x_prefix_0_o              ;
output        [10:0]                   ctx_pair_last_x_prefix_1_o              ;
output        [10:0]                   ctx_pair_last_x_prefix_2_o              ;
output        [10:0]                   ctx_pair_last_x_prefix_3_o              ;
output        [10:0]                   ctx_pair_last_x_prefix_4_o              ;
output        [10:0]                   ctx_pair_last_x_prefix_5_o              ;
output        [10:0]                   ctx_pair_last_x_prefix_6_o              ;
output        [10:0]                   ctx_pair_last_x_prefix_7_o              ;
output        [10:0]                   ctx_pair_last_x_prefix_8_o              ;
output        [10:0]                   ctx_pair_last_x_prefix_9_o              ;
output        [10:0]                   ctx_pair_last_x_suffix_o                ;
output        [10:0]                   ctx_pair_last_y_prefix_0_o              ;
output        [10:0]                   ctx_pair_last_y_prefix_1_o              ;
output        [10:0]                   ctx_pair_last_y_prefix_2_o              ;
output        [10:0]                   ctx_pair_last_y_prefix_3_o              ;
output        [10:0]                   ctx_pair_last_y_prefix_4_o              ;
output        [10:0]                   ctx_pair_last_y_prefix_5_o              ;
output        [10:0]                   ctx_pair_last_y_prefix_6_o              ;
output        [10:0]                   ctx_pair_last_y_prefix_7_o              ;
output        [10:0]                   ctx_pair_last_y_prefix_8_o              ;
output        [10:0]                   ctx_pair_last_y_prefix_9_o              ;
output        [10:0]                   ctx_pair_last_y_suffix_o                ;

//-----------------------------------------------------------------------------------------------------------------------------
//
//            reg and wire signals declaration 
//
//-----------------------------------------------------------------------------------------------------------------------------

reg           [ 4:0 ]                  pos_x_r                                 ;        
reg           [ 4:0 ]                  pos_y_r                                 ;        

reg           [ 3:0 ]                 group_idx_x_r                            ; // 0..9
reg           [ 3:0 ]                 group_idx_y_r                            ; // 0..9
reg           [ 3:0 ]                 group_width_minus1_r                     ;

// pos_x_r
always @* begin 
    if(scan_idx_i == 2'd2 )
        pos_x_r              =         last_sig_y_i                            ;       
    else 
	    pos_x_r              =         last_sig_x_i                            ;
end
 
// pos_y_r 
always @* begin 
    if(scan_idx_i == 2'd2 )
        pos_y_r              =         last_sig_x_i                            ;       
    else 
	    pos_y_r              =         last_sig_y_i                            ;
end 
 
// group_idx_x_r 
always @* begin 
     case(pos_x_r)     
	 	5'd0                        :	group_idx_x_r   =   4'd0               ;
	 	5'd1                        :	group_idx_x_r   =   4'd1               ;
	 	5'd2                        :	group_idx_x_r   =   4'd2               ;
	 	5'd3                        :	group_idx_x_r   =   4'd3               ;
	 	5'd4 , 5'd5                 :   group_idx_x_r   =   4'd4               ;
	 	5'd6 , 5'd7                 :   group_idx_x_r   =   4'd5               ;
	 	5'd8 , 5'd9 , 5'd10, 5'd11  :   group_idx_x_r   =   4'd6               ;
	 	5'd12, 5'd13, 5'd14, 5'd15  :   group_idx_x_r   =   4'd7               ;
	 	5'd16, 5'd17, 5'd18, 5'd19  ,                                          
		5'd20, 5'd21, 5'd22, 5'd23  :   group_idx_x_r   =   4'd8               ;
	 	default                     :   group_idx_x_r   =   4'd9               ;
	endcase
end
 
// group_idx_y_r  
always @* begin 
     case(pos_y_r)     
	 	5'd0                        :	group_idx_y_r   =   4'd0               ;
	 	5'd1                        :	group_idx_y_r   =   4'd1               ;
	 	5'd2                        :	group_idx_y_r   =   4'd2               ;
	 	5'd3                        :	group_idx_y_r   =   4'd3               ;
	 	5'd4 , 5'd5                 :   group_idx_y_r   =   4'd4               ;
	 	5'd6 , 5'd7                 :   group_idx_y_r   =   4'd5               ;
	 	5'd8 , 5'd9 , 5'd10, 5'd11  :   group_idx_y_r   =   4'd6               ;
	 	5'd12, 5'd13, 5'd14, 5'd15  :   group_idx_y_r   =   4'd7               ;
	 	5'd16, 5'd17, 5'd18, 5'd19  ,                                      
		5'd20, 5'd21, 5'd22, 5'd23  :   group_idx_y_r   =   4'd8               ;
	 	default                     :   group_idx_y_r   =   4'd9               ;
	endcase
end

// group_width_minus1_r
always @* begin 
    case(tu_depth_i)                           
        2'd0 :  group_width_minus1_r     =     4'd9                            ; // 32x32 
        2'd1 :  group_width_minus1_r     =     4'd7                            ; // 16x16 
        2'd2 :  group_width_minus1_r     =     4'd5                            ; // 8x8   
        2'd3 :  group_width_minus1_r     =     4'd3                            ; // 4x4   
    endcase 
end  
 
//-----------------------------------------------------------------------------------------------------------------------------
//
//            binarization for last_sig_x 
//
//-----------------------------------------------------------------------------------------------------------------------------
wire	      [10:0 ]		           ctx_pair_last_x_prefix_0_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_x_prefix_1_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_x_prefix_2_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_x_prefix_3_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_x_prefix_4_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_x_prefix_5_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_x_prefix_6_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_x_prefix_7_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_x_prefix_8_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_x_prefix_9_w			   ; // context pair of last x prefix

reg 	      [10:0 ]		           ctx_pair_last_x_suffix_r			       ; // context pair of last x suffix

reg           [19:0 ]                  ctx_pair_last_x_coding_mode_r           ; // coding mode ,0:regular , 1:invalid ,2:bypsss,3:termianl
reg           [ 9:0 ]                  ctx_pair_last_x_prefix_bins_r           ;

reg		      [ 7:0 ]		           ctx_idx_last_x_prefix_0_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_x_prefix_1_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_x_prefix_2_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_x_prefix_3_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_x_prefix_4_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_x_prefix_5_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_x_prefix_6_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_x_prefix_7_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_x_prefix_8_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_x_prefix_9_r			   ; // context address of last x prefix



assign   ctx_pair_last_x_prefix_0_w =  {ctx_pair_last_x_coding_mode_r[ 1:0 ],ctx_pair_last_x_prefix_bins_r[0],ctx_idx_last_x_prefix_0_r}; 
assign   ctx_pair_last_x_prefix_1_w =  {ctx_pair_last_x_coding_mode_r[ 3:2 ],ctx_pair_last_x_prefix_bins_r[1],ctx_idx_last_x_prefix_1_r};
assign   ctx_pair_last_x_prefix_2_w =  {ctx_pair_last_x_coding_mode_r[ 5:4 ],ctx_pair_last_x_prefix_bins_r[2],ctx_idx_last_x_prefix_2_r};
assign   ctx_pair_last_x_prefix_3_w =  {ctx_pair_last_x_coding_mode_r[ 7:6 ],ctx_pair_last_x_prefix_bins_r[3],ctx_idx_last_x_prefix_3_r};
assign   ctx_pair_last_x_prefix_4_w =  {ctx_pair_last_x_coding_mode_r[ 9:8 ],ctx_pair_last_x_prefix_bins_r[4],ctx_idx_last_x_prefix_4_r};
assign   ctx_pair_last_x_prefix_5_w =  {ctx_pair_last_x_coding_mode_r[11:10],ctx_pair_last_x_prefix_bins_r[5],ctx_idx_last_x_prefix_5_r};
assign   ctx_pair_last_x_prefix_6_w =  {ctx_pair_last_x_coding_mode_r[13:12],ctx_pair_last_x_prefix_bins_r[6],ctx_idx_last_x_prefix_6_r};
assign   ctx_pair_last_x_prefix_7_w =  {ctx_pair_last_x_coding_mode_r[15:14],ctx_pair_last_x_prefix_bins_r[7],ctx_idx_last_x_prefix_7_r};
assign   ctx_pair_last_x_prefix_8_w =  {ctx_pair_last_x_coding_mode_r[17:16],ctx_pair_last_x_prefix_bins_r[8],ctx_idx_last_x_prefix_8_r};
assign   ctx_pair_last_x_prefix_9_w =  {ctx_pair_last_x_coding_mode_r[19:18],ctx_pair_last_x_prefix_bins_r[9],ctx_idx_last_x_prefix_9_r};


// ctx_pair_last_x_coding_mode_r
 
always @* begin 
    case(pos_x_r)
        5'd0                   :ctx_pair_last_x_coding_mode_r=20'b0101_0101_0101_0101_0100              ; // group_idx_x_r = 0 , group_idx_x_r[width-1] = 3 5 7 9
        5'd1                   :ctx_pair_last_x_coding_mode_r=20'b0101_0101_0101_0101_0000              ; // group_idx_x_r = 1 , group_idx_x_r[width-1] = 3 5 7 9 
        5'd2                   :ctx_pair_last_x_coding_mode_r=20'b0101_0101_0101_0100_0000              ; // group_idx_x_r = 2 , group_idx_x_r[width-1] = 3 5 7 9 
        5'd3                   :begin                                                                     // group_idx_x_r = 3 , group_idx_x_r[width-1] = 3 5 7 9 
		                            case(tu_depth_i)                                                    
		                                2'd0:ctx_pair_last_x_coding_mode_r=20'b0101_0101_0101_0000_0000 ; // 32x32 : 9
		                                2'd1:ctx_pair_last_x_coding_mode_r=20'b0101_0101_0101_0000_0000 ; // 16x16 : 7
		                                2'd2:ctx_pair_last_x_coding_mode_r=20'b0101_0101_0101_0000_0000 ; // 8x8   : 5
		                                2'd3:ctx_pair_last_x_coding_mode_r=20'b0101_0101_0101_0100_0000 ; // 4x4   : 3 
		                            endcase 		
		end 
        5'd4 ,5'd5             :begin                                                                     // group_idx_x_r = 4 , group_idx_x_r[width-1] = 3 5 7 9 
				                    case(tu_depth_i)                                                    
		                                2'd0:ctx_pair_last_x_coding_mode_r=20'b0101_0101_0100_0000_0000 ; // 32x32 : 9
		                                2'd1:ctx_pair_last_x_coding_mode_r=20'b0101_0101_0100_0000_0000 ; // 16x16 : 7
		                                2'd2:ctx_pair_last_x_coding_mode_r=20'b0101_0101_0100_0000_0000 ; // 8x8   : 5
		                                2'd3:ctx_pair_last_x_coding_mode_r=20'b0101_0101_0101_0000_0000 ; // 4x4   : 3 
		                            endcase 
		end 
        5'd6 ,5'd7             :begin                                                                     // group_idx_x_r = 5 , group_idx_x_r[width-1] = 3 5 7 9 
		                            case(tu_depth_i)                                                    
		                                2'd0:ctx_pair_last_x_coding_mode_r=20'b0101_0101_0000_0000_0000 ; // 32x32 : 9
		                                2'd1:ctx_pair_last_x_coding_mode_r=20'b0101_0101_0000_0000_0000 ; // 16x16 : 7
		                                2'd2:ctx_pair_last_x_coding_mode_r=20'b0101_0101_0100_0000_0000 ; // 8x8   : 5
		                                2'd3:ctx_pair_last_x_coding_mode_r=20'b0101_0101_0100_0000_0000 ; // 4x4   : 3 
		                            endcase 
		end
        5'd8 ,5'd9 ,5'd10,5'd11:begin                                                                     // group_idx_x_r = 6 , group_idx_x_r[width-1] = 3 5 7 9 
		                            case(tu_depth_i)                                                    
		                                2'd0:ctx_pair_last_x_coding_mode_r=20'b0101_0100_0000_0000_0000 ; // 32x32 : 9
		                                2'd1:ctx_pair_last_x_coding_mode_r=20'b0101_0100_0000_0000_0000 ; // 16x16 : 7
		                                2'd2:ctx_pair_last_x_coding_mode_r=20'b0101_0101_0000_0000_0000 ; // 8x8   : 5
		                                2'd3:ctx_pair_last_x_coding_mode_r=20'b0101_0101_0000_0000_0000 ; // 4x4   : 3 
		                            endcase 
		end 
        5'd12,5'd13,5'd14,5'd15:begin                                                                     // group_idx_x_r = 7 , group_idx_x_r[width-1] = 3 5 7 9 
		                            case(tu_depth_i)                                                    
		                                2'd0:ctx_pair_last_x_coding_mode_r=20'b0101_0000_0000_0000_0000 ; // 32x32 : 9
		                                2'd1:ctx_pair_last_x_coding_mode_r=20'b0101_0100_0000_0000_0000 ; // 16x16 : 7
		                                2'd2:ctx_pair_last_x_coding_mode_r=20'b0101_0100_0000_0000_0000 ; // 8x8   : 5
		                                2'd3:ctx_pair_last_x_coding_mode_r=20'b0101_0100_0000_0000_0000 ; // 4x4   : 3 
		                            endcase 
		end 
        5'd16,5'd17,5'd18,5'd19,                                                                                          
        5'd20,5'd21,5'd22,5'd23:begin                                                                     // group_idx_x_r = 8 , group_idx_x_r[width-1] = 3 5 7 9
		                            case(tu_depth_i)                                                    
		                                2'd0:ctx_pair_last_x_coding_mode_r=20'b0100_0000_0000_0000_0000 ; // 32x32 : 9
		                                2'd1:ctx_pair_last_x_coding_mode_r=20'b0101_0000_0000_0000_0000 ; // 16x16 : 7
		                                2'd2:ctx_pair_last_x_coding_mode_r=20'b0101_0000_0000_0000_0000 ; // 8x8   : 5
		                                2'd3:ctx_pair_last_x_coding_mode_r=20'b0101_0000_0000_0000_0000 ; // 4x4   : 3 
		                            endcase 
		end 
        default                :ctx_pair_last_x_coding_mode_r= 20'b0100_0000_0000_0000_0000             ; // group_idx_x_r = 9 , group_idx_x_r[width-1] = 3 5 7 9 
    endcase
end 

// ctx_pair_last_x_prefix_bins_r
always @* begin 
    case(pos_x_r)
        5'd0                   :ctx_pair_last_x_prefix_bins_r = 10'b00_0000_0000; // group_idx_x_r = 0 
        5'd1                   :ctx_pair_last_x_prefix_bins_r = 10'b00_0000_0001; // group_idx_x_r = 1
        5'd2                   :ctx_pair_last_x_prefix_bins_r = 10'b00_0000_0011; // group_idx_x_r = 2
        5'd3                   :ctx_pair_last_x_prefix_bins_r = 10'b00_0000_0111; // group_idx_x_r = 3
        5'd4 ,5'd5             :ctx_pair_last_x_prefix_bins_r = 10'b00_0000_1111; // group_idx_x_r = 4
        5'd6 ,5'd7             :ctx_pair_last_x_prefix_bins_r = 10'b00_0001_1111; // group_idx_x_r = 5
        5'd8 ,5'd9 ,5'd10,5'd11:ctx_pair_last_x_prefix_bins_r = 10'b00_0011_1111; // group_idx_x_r = 6
        5'd12,5'd13,5'd14,5'd15:ctx_pair_last_x_prefix_bins_r = 10'b00_0111_1111; // group_idx_x_r = 7
        5'd16,5'd17,5'd18,5'd19,
        5'd20,5'd21,5'd22,5'd23:ctx_pair_last_x_prefix_bins_r = 10'b00_1111_1111; // group_idx_x_r = 8
        default                :ctx_pair_last_x_prefix_bins_r = 10'b01_1111_1111; // group_idx_x_r = 9
	endcase                               
end 

// ctx_idx_last_x_prefix_0_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_x_prefix_0_r  =  8'hff       ; // chroma  32x32 , 15  + 0>>3  = 15 xx  
	    3'd1 :  ctx_idx_last_x_prefix_0_r  = {3'd0, 5'd6} ; // chroma  16x16 , 15  + 0>>2  = 15 
	    3'd2 :  ctx_idx_last_x_prefix_0_r  = {3'd0, 5'd6} ; // chroma  8x8   , 15  + 0>>1  = 15 
	    3'd3 :  ctx_idx_last_x_prefix_0_r  = {3'd0, 5'd6} ; // chroma  4x4   , 15  + 0>>0  = 15 
		3'd4 :  ctx_idx_last_x_prefix_0_r  = {3'd0, 5'd4} ; // luma    32x32 , 10  + 0>>1  = 10  
		3'd5 :  ctx_idx_last_x_prefix_0_r  = {3'd0, 5'd3} ; // luma    16x16 , 6   + 0>>1  = 6  
		3'd6 :  ctx_idx_last_x_prefix_0_r  = {3'd0, 5'd2} ; // luma    8x8   , 3   + 0>>1  = 3  
		3'd7 :  ctx_idx_last_x_prefix_0_r  = {3'd0, 5'd1} ; // luma    4x4   , 0   + 0>>0  = 0  
	endcase  
end 

// ctx_idx_last_x_prefix_1_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_x_prefix_1_r  =  8'hff       ; // chroma  32x32 , 15  + 1>>3  = 15 xx
	    3'd1 :  ctx_idx_last_x_prefix_1_r  = {3'd0, 5'd6} ; // chroma  16x16 , 15  + 1>>2  = 15
	    3'd2 :  ctx_idx_last_x_prefix_1_r  = {3'd0, 5'd6} ; // chroma  8x8   , 15  + 1>>1  = 15
	    3'd3 :  ctx_idx_last_x_prefix_1_r  = {3'd1, 5'd8} ; // chroma  4x4   , 15  + 1>>0  = 16
		3'd4 :  ctx_idx_last_x_prefix_1_r  = {3'd0, 5'd4} ; // luma    32x32 , 10  + 1>>1  = 10
		3'd5 :  ctx_idx_last_x_prefix_1_r  = {3'd0, 5'd3} ; // luma    16x16 , 6   + 1>>1  = 6 
		3'd6 :  ctx_idx_last_x_prefix_1_r  = {3'd0, 5'd2} ; // luma    8x8   , 3   + 1>>1  = 3 
		3'd7 :  ctx_idx_last_x_prefix_1_r  = {3'd1, 5'd3} ; // luma    4x4   , 0   + 1>>0  = 1 
	endcase  
end 

// ctx_idx_last_x_prefix_2_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_x_prefix_2_r  =  8'hff       ; // chroma  32x32 ,  15  + 2>>3  = 15 xx 
	    3'd1 :  ctx_idx_last_x_prefix_2_r  = {3'd0, 5'd6} ; // chroma  16x16 ,  15  + 2>>2  = 15
	    3'd2 :  ctx_idx_last_x_prefix_2_r  = {3'd1, 5'd8} ; // chroma  8x8   ,  15  + 2>>1  = 16
	    3'd3 :  ctx_idx_last_x_prefix_2_r  = {3'd2, 5'd4} ; // chroma  4x4   ,  15  + 2>>0  = 17
		3'd4 :  ctx_idx_last_x_prefix_2_r  = {3'd1, 5'd6} ; // luma    32x32 ,  10  + 2>>1  = 11
		3'd5 :  ctx_idx_last_x_prefix_2_r  = {3'd1, 5'd5} ; // luma    16x16 ,  6   + 2>>1  = 7 
		3'd6 :  ctx_idx_last_x_prefix_2_r  = {3'd1, 5'd4} ; // luma    8x8   ,  3   + 2>>1  = 4 
		3'd7 :  ctx_idx_last_x_prefix_2_r  = {3'd3, 5'd5} ; // luma    4x4   ,  0   + 2>>0  = 2 
	endcase  
end 

// ctx_idx_last_x_prefix_3_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_x_prefix_3_r  =  8'hff       ; // chroma  32x32 ,  15  + 3>>3  = 15 xx  
	    3'd1 :  ctx_idx_last_x_prefix_3_r  = {3'd0, 5'd6} ; // chroma  16x16 ,  15  + 3>>2  = 15     
	    3'd2 :  ctx_idx_last_x_prefix_3_r  = {3'd1, 5'd8} ; // chroma  8x8   ,  15  + 3>>1  = 16     
	    3'd3 :  ctx_idx_last_x_prefix_3_r  = {3'd3, 5'd9} ; // chroma  4x4   ,  15  + 3>>0  = 18     
		3'd4 :  ctx_idx_last_x_prefix_3_r  = {3'd1, 5'd6} ; // luma    32x32 ,  10  + 3>>1  = 11 
		3'd5 :  ctx_idx_last_x_prefix_3_r  = {3'd1, 5'd5} ; // luma    16x16 ,  6   + 3>>1  = 7  
		3'd6 :  ctx_idx_last_x_prefix_3_r  = {3'd1, 5'd4} ; // luma    8x8   ,  3   + 3>>1  = 4  
		3'd7 :  ctx_idx_last_x_prefix_3_r  = {3'd0, 5'd2} ; // luma    4x4   ,  0   + 3>>0  = 3  
	endcase  
end 

// ctx_idx_last_x_prefix_4_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_x_prefix_4_r  =  8'hff       ; // chroma  32x32 ,  15  + 4>>3  = 15 xx 
	    3'd1 :  ctx_idx_last_x_prefix_4_r  = {3'd1, 5'd8} ; // chroma  16x16 ,  15  + 4>>2  = 16
	    3'd2 :  ctx_idx_last_x_prefix_4_r  = {3'd2, 5'd4} ; // chroma  8x8   ,  15  + 4>>1  = 17
	    3'd3 :  ctx_idx_last_x_prefix_4_r  =  8'hff       ; // chroma  4x4   ,  15  + 4>>0  = 19 xx
		3'd4 :  ctx_idx_last_x_prefix_4_r  = {3'd3, 5'd8} ; // luma    32x32 ,  10  + 4>>1  = 12
		3'd5 :  ctx_idx_last_x_prefix_4_r  = {3'd2, 5'd3} ; // luma    16x16 ,  6   + 4>>1  = 8 
		3'd6 :  ctx_idx_last_x_prefix_4_r  = {3'd3, 5'd6} ; // luma    8x8   ,  3   + 4>>1  = 5 
		3'd7 :  ctx_idx_last_x_prefix_4_r  =  8'hff       ; // luma    4x4   ,  0   + 4>>0  = 4  xx
	endcase                           
end 

// ctx_idx_last_x_prefix_5_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_x_prefix_5_r  =  8'hff       ; // chroma  32x32 ,  15  + 5>>3  =  15 xx 
	    3'd1 :  ctx_idx_last_x_prefix_5_r  = {3'd1, 5'd8} ; // chroma  16x16 ,  15  + 5>>2  =  16 
	    3'd2 :  ctx_idx_last_x_prefix_5_r  = {3'd2, 5'd4} ; // chroma  8x8   ,  15  + 5>>1  =  17 
	    3'd3 :  ctx_idx_last_x_prefix_5_r  =  8'hff       ; // chroma  4x4   ,  15  + 5>>0  =  20 xx
		3'd4 :  ctx_idx_last_x_prefix_5_r  = {3'd3, 5'd8} ; // luma    32x32 ,  10  + 5>>1  = 12
		3'd5 :  ctx_idx_last_x_prefix_5_r  = {3'd2, 5'd3} ; // luma    16x16 ,  6   + 5>>1  =  8  
		3'd6 :  ctx_idx_last_x_prefix_5_r  = {3'd3, 5'd6} ; // luma    8x8   ,  3   + 5>>1  =  5  
		3'd7 :  ctx_idx_last_x_prefix_5_r  =  8'hff       ; // luma    4x4   ,  0   + 5>>0  =  5  xx
	endcase  
end 

// ctx_idx_last_x_prefix_6_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_x_prefix_6_r  =  8'hff       ; // chroma  32x32 ,  15  + 6>>3  = 15 xx 
	    3'd1 :  ctx_idx_last_x_prefix_6_r  = {3'd1 ,5'd8} ; // chroma  16x16 ,  15  + 6>>2  = 16
	    3'd2 :  ctx_idx_last_x_prefix_6_r  =  8'hff       ; // chroma  8x8   ,  15  + 6>>1  = 18 xx 
	    3'd3 :  ctx_idx_last_x_prefix_6_r  =  8'hff       ; // chroma  4x4   ,  15  + 6>>0  = 21 xx
		3'd4 :  ctx_idx_last_x_prefix_6_r  = {3'd0, 5'd5} ; // luma    32x32 ,  10  + 6>>1  = 13
		3'd5 :  ctx_idx_last_x_prefix_6_r  = {3'd3, 5'd7} ; // luma    16x16 ,  6   + 6>>1  = 9 
		3'd6 :  ctx_idx_last_x_prefix_6_r  =  8'hff       ; // luma    8x8   ,  3   + 6>>1  = 6  xx
		3'd7 :  ctx_idx_last_x_prefix_6_r  =  8'hff       ; // luma    4x4   ,  0   + 6>>0  = 6  xx
	endcase  
end 

// ctx_idx_last_x_prefix_7_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_x_prefix_7_r  =  8'hff       ; // chroma  32x32 ,  15  + 7>>3  = 15 xx 
	    3'd1 :  ctx_idx_last_x_prefix_7_r  = {3'd1, 5'd8} ; // chroma  16x16 ,  15  + 7>>2  = 16 
	    3'd2 :  ctx_idx_last_x_prefix_7_r  =  8'hff       ; // chroma  8x8   ,  15  + 7>>1  = 18 xx
	    3'd3 :  ctx_idx_last_x_prefix_7_r  =  8'hff       ; // chroma  4x4   ,  15  + 7>>0  = 21 xx
		3'd4 :  ctx_idx_last_x_prefix_7_r  = {3'd0, 5'd5} ; // luma    32x32 ,  10  + 7>>1  = 13
		3'd5 :  ctx_idx_last_x_prefix_7_r  = {3'd3, 5'd7} ; // luma    16x16 ,  6   + 7>>1  = 9 
		3'd6 :  ctx_idx_last_x_prefix_7_r  =  8'hff       ; // luma    8x8   ,  3   + 7>>1  = 6  xx
		3'd7 :  ctx_idx_last_x_prefix_7_r  =  8'hff       ; // luma    4x4   ,  0   + 7>>0  = 7  xx
	endcase  
end 

// ctx_idx_last_x_prefix_8_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_x_prefix_8_r  =  8'hff       ; // chroma  32x32 ,  15  + 8>>3  = 16 xx 
	    3'd1 :  ctx_idx_last_x_prefix_8_r  =  8'hff       ; // chroma  16x16 ,  15  + 8>>2  = 17 xx 
	    3'd2 :  ctx_idx_last_x_prefix_8_r  =  8'hff       ; // chroma  8x8   ,  15  + 8>>1  = 19 xx 
	    3'd3 :  ctx_idx_last_x_prefix_8_r  =  8'hff       ; // chroma  4x4   ,  15  + 8>>0  = 23 xx
		3'd4 :  ctx_idx_last_x_prefix_8_r  = {3'd1, 5'd7}; // luma    32x32 ,  10  + 8>>1  = 14
		3'd5 :  ctx_idx_last_x_prefix_8_r  =  8'hff       ; // luma    16x16 ,  6   + 8>>1  = 10 xx
		3'd6 :  ctx_idx_last_x_prefix_8_r  =  8'hff       ; // luma    8x8   ,  3   + 8>>1  = 7  xx
		3'd7 :  ctx_idx_last_x_prefix_8_r  =  8'hff       ; // luma    4x4   ,  0   + 8>>0  = 8  xx
	endcase  
end 

// ctx_idx_last_x_prefix_9_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_x_prefix_9_r  =  8'hff       ; // chroma  32x32 ,  15  + 9>>3  = 16 xx 
	    3'd1 :  ctx_idx_last_x_prefix_9_r  =  8'hff       ; // chroma  16x16 ,  15  + 9>>2  = 17 xx
	    3'd2 :  ctx_idx_last_x_prefix_9_r  =  8'hff       ; // chroma  8x8   ,  15  + 9>>1  = 19 xx
	    3'd3 :  ctx_idx_last_x_prefix_9_r  =  8'hff       ; // chroma  4x4   ,  15  + 9>>0  = 23 xx 
		3'd4 :  ctx_idx_last_x_prefix_9_r  = {3'd1, 5'd7}; // luma    32x32 ,  10  + 9>>1  = 14
		3'd5 :  ctx_idx_last_x_prefix_9_r  =  8'hff       ; // luma    16x16 ,  6   + 9>>1  = 10 xx
		3'd6 :  ctx_idx_last_x_prefix_9_r  =  8'hff       ; // luma    8x8   ,  3   + 9>>1  = 7  xx
		3'd7 :  ctx_idx_last_x_prefix_9_r  =  8'hff       ; // luma    4x4   ,  0   + 9>>0  = 9  xx
	endcase  
end 

// ctx_pair_last_x_suffix_r
// 0:regular , 1:invalid ,2:bypsss,3:termianl
// bypass:{2'10,1'b0,bins_number[2:0],bins[4:0]}
always @* begin 
    case(pos_x_r)
        5'd0  :     ctx_pair_last_x_suffix_r   =   {2'b01,1'b0,3'd0,5'b00000 } ; //  i_count=  0  
		5'd1  :     ctx_pair_last_x_suffix_r   =   {2'b01,1'b0,3'd0,5'b00000 } ; //  i_count=  0
		5'd2  :     ctx_pair_last_x_suffix_r   =   {2'b01,1'b0,3'd0,5'b00000 } ; //  i_count=  0
		5'd3  :     ctx_pair_last_x_suffix_r   =   {2'b01,1'b0,3'd0,5'b00000 } ; //  i_count=  0
		5'd4  :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd1,5'b0000_0} ; //  i_count=  1		0
		5'd5  :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd1,5'b0000_1} ; //  i_count=  1		1
		5'd6  :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd1,5'b0000_0} ; //  i_count=  1		0
		5'd7  :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd1,5'b0000_1} ; //  i_count=  1		1
		5'd8  :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_00} ; //  i_count=  2		00
		5'd9  :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_01} ; //  i_count=  2		01
		5'd10 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_10} ; //  i_count=  2		10
		5'd11 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_11} ; //  i_count=  2		11
		5'd12 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_00} ; //  i_count=  2		00
		5'd13 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_01} ; //  i_count=  2		01
		5'd14 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_10} ; //  i_count=  2		10
		5'd15 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_11} ; //  i_count=  2		11
		5'd16 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_000} ; //  i_count=  3		000
		5'd17 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_001} ; //  i_count=  3		001
		5'd18 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_010} ; //  i_count=  3		010
		5'd19 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_011} ; //  i_count=  3		011
		5'd20 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_100} ; //  i_count=  3		100
		5'd21 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_101} ; //  i_count=  3		101
		5'd22 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_110} ; //  i_count=  3		110
		5'd23 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_111} ; //  i_count=  3		111
		5'd24 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_000} ; //  i_count=  3		000
		5'd25 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_001} ; //  i_count=  3		001
		5'd26 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_010} ; //  i_count=  3		010
		5'd27 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_011} ; //  i_count=  3		011
		5'd28 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_100} ; //  i_count=  3		100
		5'd29 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_101} ; //  i_count=  3		101
		5'd30 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_110} ; //  i_count=  3		110
        5'd31 :     ctx_pair_last_x_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_111} ; //  i_count=  3		111
	endcase
end 	
	
//-----------------------------------------------------------------------------------------------------------------------------
//
//            binarization for last_sig_y 
//
//-----------------------------------------------------------------------------------------------------------------------------

wire	      [10:0 ]		           ctx_pair_last_y_prefix_0_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_y_prefix_1_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_y_prefix_2_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_y_prefix_3_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_y_prefix_4_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_y_prefix_5_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_y_prefix_6_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_y_prefix_7_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_y_prefix_8_w			   ; // context pair of last x prefix
wire	      [10:0 ]		           ctx_pair_last_y_prefix_9_w			   ; // context pair of last x prefix

reg 	      [10:0 ]		           ctx_pair_last_y_suffix_r			       ; // context pair of last x suffix

reg           [19:0 ]                  ctx_pair_last_y_coding_mode_r           ; // coding mode ,0:regular , 1:invalid ,2:bypsss,3:termianl
reg           [ 9:0 ]                  ctx_pair_last_y_prefix_bins_r           ;

reg		      [ 7:0 ]		           ctx_idx_last_y_prefix_0_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_y_prefix_1_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_y_prefix_2_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_y_prefix_3_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_y_prefix_4_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_y_prefix_5_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_y_prefix_6_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_y_prefix_7_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_y_prefix_8_r			   ; // context address of last x prefix
reg		      [ 7:0 ]		           ctx_idx_last_y_prefix_9_r			   ; // context address of last x prefix



assign   ctx_pair_last_y_prefix_0_w =  {ctx_pair_last_y_coding_mode_r[ 1:0 ],ctx_pair_last_y_prefix_bins_r[0],ctx_idx_last_y_prefix_0_r}; 
assign   ctx_pair_last_y_prefix_1_w =  {ctx_pair_last_y_coding_mode_r[ 3:2 ],ctx_pair_last_y_prefix_bins_r[1],ctx_idx_last_y_prefix_1_r};
assign   ctx_pair_last_y_prefix_2_w =  {ctx_pair_last_y_coding_mode_r[ 5:4 ],ctx_pair_last_y_prefix_bins_r[2],ctx_idx_last_y_prefix_2_r};
assign   ctx_pair_last_y_prefix_3_w =  {ctx_pair_last_y_coding_mode_r[ 7:6 ],ctx_pair_last_y_prefix_bins_r[3],ctx_idx_last_y_prefix_3_r};
assign   ctx_pair_last_y_prefix_4_w =  {ctx_pair_last_y_coding_mode_r[ 9:8 ],ctx_pair_last_y_prefix_bins_r[4],ctx_idx_last_y_prefix_4_r};
assign   ctx_pair_last_y_prefix_5_w =  {ctx_pair_last_y_coding_mode_r[11:10],ctx_pair_last_y_prefix_bins_r[5],ctx_idx_last_y_prefix_5_r};
assign   ctx_pair_last_y_prefix_6_w =  {ctx_pair_last_y_coding_mode_r[13:12],ctx_pair_last_y_prefix_bins_r[6],ctx_idx_last_y_prefix_6_r};
assign   ctx_pair_last_y_prefix_7_w =  {ctx_pair_last_y_coding_mode_r[15:14],ctx_pair_last_y_prefix_bins_r[7],ctx_idx_last_y_prefix_7_r};
assign   ctx_pair_last_y_prefix_8_w =  {ctx_pair_last_y_coding_mode_r[17:16],ctx_pair_last_y_prefix_bins_r[8],ctx_idx_last_y_prefix_8_r};
assign   ctx_pair_last_y_prefix_9_w =  {ctx_pair_last_y_coding_mode_r[19:18],ctx_pair_last_y_prefix_bins_r[9],ctx_idx_last_y_prefix_9_r};


// ctx_pair_last_y_coding_mode_r

always @* begin 
    case(pos_y_r)
        5'd0                   :ctx_pair_last_y_coding_mode_r=20'b0101_0101_0101_0101_0100              ; // group_idx_y_r = 0 , group_idx_y_r[width-1] = 3 5 7 9
        5'd1                   :ctx_pair_last_y_coding_mode_r=20'b0101_0101_0101_0101_0000              ; // group_idx_y_r = 1 , group_idx_y_r[width-1] = 3 5 7 9 
        5'd2                   :ctx_pair_last_y_coding_mode_r=20'b0101_0101_0101_0100_0000              ; // group_idx_y_r = 2 , group_idx_y_r[width-1] = 3 5 7 9 
        5'd3                   :                                                                          // group_idx_y_r = 3 , group_idx_y_r[width-1] = 3 5 7 9 
		                        case(tu_depth_i)                                                    
		                                2'd0:ctx_pair_last_y_coding_mode_r=20'b0101_0101_0101_0000_0000 ; // 32x32 : 9
		                                2'd1:ctx_pair_last_y_coding_mode_r=20'b0101_0101_0101_0000_0000 ; // 16x16 : 7
		                                2'd2:ctx_pair_last_y_coding_mode_r=20'b0101_0101_0101_0000_0000 ; // 8x8   : 5
		                                2'd3:ctx_pair_last_y_coding_mode_r=20'b0101_0101_0101_0100_0000 ; // 4x4   : 3 
		                        endcase 		
        5'd4 ,5'd5             :begin                                                                     // group_idx_y_r = 4 , group_idx_y_r[width-1] = 3 5 7 9 
				                    case(tu_depth_i)                                                    
		                                2'd0:ctx_pair_last_y_coding_mode_r=20'b0101_0101_0100_0000_0000 ; // 32x32 : 9
		                                2'd1:ctx_pair_last_y_coding_mode_r=20'b0101_0101_0100_0000_0000 ; // 16x16 : 7
		                                2'd2:ctx_pair_last_y_coding_mode_r=20'b0101_0101_0100_0000_0000 ; // 8x8   : 5
		                                2'd3:ctx_pair_last_y_coding_mode_r=20'b0101_0101_0101_0000_0000 ; // 4x4   : 3 
		                            endcase 
		end 
        5'd6 ,5'd7             :begin                                                                     // group_idx_y_r = 5 , group_idx_y_r[width-1] = 3 5 7 9 
		                            case(tu_depth_i)                                                    
		                                2'd0:ctx_pair_last_y_coding_mode_r=20'b0101_0101_0000_0000_0000 ; // 32x32 : 9
		                                2'd1:ctx_pair_last_y_coding_mode_r=20'b0101_0101_0000_0000_0000 ; // 16x16 : 7
		                                2'd2:ctx_pair_last_y_coding_mode_r=20'b0101_0101_0100_0000_0000 ; // 8x8   : 5
		                                2'd3:ctx_pair_last_y_coding_mode_r=20'b0101_0101_0100_0000_0000 ; // 4x4   : 3 
		                            endcase 
		end
        5'd8 ,5'd9 ,5'd10,5'd11:begin                                                                     // group_idx_y_r = 6 , group_idx_y_r[width-1] = 3 5 7 9 
		                            case(tu_depth_i)                                                    
		                                2'd0:ctx_pair_last_y_coding_mode_r=20'b0101_0100_0000_0000_0000 ; // 32x32 : 9
		                                2'd1:ctx_pair_last_y_coding_mode_r=20'b0101_0100_0000_0000_0000 ; // 16x16 : 7
		                                2'd2:ctx_pair_last_y_coding_mode_r=20'b0101_0101_0000_0000_0000 ; // 8x8   : 5
		                                2'd3:ctx_pair_last_y_coding_mode_r=20'b0101_0101_0000_0000_0000 ; // 4x4   : 3 
		                            endcase 
		end 
        5'd12,5'd13,5'd14,5'd15:begin                                                                     // group_idx_y_r = 7 , group_idx_y_r[width-1] = 3 5 7 9 
		                            case(tu_depth_i)                                                    
		                                2'd0:ctx_pair_last_y_coding_mode_r=20'b0101_0000_0000_0000_0000 ; // 32x32 : 9
		                                2'd1:ctx_pair_last_y_coding_mode_r=20'b0101_0100_0000_0000_0000 ; // 16x16 : 7
		                                2'd2:ctx_pair_last_y_coding_mode_r=20'b0101_0100_0000_0000_0000 ; // 8x8   : 5
		                                2'd3:ctx_pair_last_y_coding_mode_r=20'b0101_0100_0000_0000_0000 ; // 4x4   : 3 
		                            endcase 
		end 
        5'd16,5'd17,5'd18,5'd19,                                                                                          
        5'd20,5'd21,5'd22,5'd23:begin                                                                     // group_idx_y_r = 8 , group_idx_y_r[width-1] = 3 5 7 9
		                            case(tu_depth_i)                                                    
		                                2'd0:ctx_pair_last_y_coding_mode_r=20'b0100_0000_0000_0000_0000 ; // 32x32 : 9
		                                2'd1:ctx_pair_last_y_coding_mode_r=20'b0101_0000_0000_0000_0000 ; // 16x16 : 7
		                                2'd2:ctx_pair_last_y_coding_mode_r=20'b0101_0000_0000_0000_0000 ; // 8x8   : 5
		                                2'd3:ctx_pair_last_y_coding_mode_r=20'b0101_0000_0000_0000_0000 ; // 4x4   : 3 
		                            endcase 
		end 
        default                :ctx_pair_last_y_coding_mode_r= 20'b0100_0000_0000_0000_0000             ; // group_idx_y_r = 9 , group_idx_y_r[width-1] = 3 5 7 9 
    endcase
end 

// ctx_pair_last_y_prefix_bins_r
always @* begin 
    case(pos_y_r)
        5'd0                   :ctx_pair_last_y_prefix_bins_r = 10'b00_0000_0000; // group_idx_y_r = 0 
        5'd1                   :ctx_pair_last_y_prefix_bins_r = 10'b00_0000_0001; // group_idx_y_r = 1
        5'd2                   :ctx_pair_last_y_prefix_bins_r = 10'b00_0000_0011; // group_idx_y_r = 2
        5'd3                   :ctx_pair_last_y_prefix_bins_r = 10'b00_0000_0111; // group_idx_y_r = 3
        5'd4 ,5'd5             :ctx_pair_last_y_prefix_bins_r = 10'b00_0000_1111; // group_idx_y_r = 4
        5'd6 ,5'd7             :ctx_pair_last_y_prefix_bins_r = 10'b00_0001_1111; // group_idx_y_r = 5
        5'd8 ,5'd9 ,5'd10,5'd11:ctx_pair_last_y_prefix_bins_r = 10'b00_0011_1111; // group_idx_y_r = 6
        5'd12,5'd13,5'd14,5'd15:ctx_pair_last_y_prefix_bins_r = 10'b00_0111_1111; // group_idx_y_r = 7
        5'd16,5'd17,5'd18,5'd19,
        5'd20,5'd21,5'd22,5'd23:ctx_pair_last_y_prefix_bins_r = 10'b00_1111_1111; // group_idx_y_r = 8
        default                :ctx_pair_last_y_prefix_bins_r = 10'b01_1111_1111; // group_idx_y_r = 9
	endcase                               
end 

// ctx_idx_last_y_prefix_0_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_y_prefix_0_r  = 8'hff        ; // chroma  32x32 , 15  + 0>>3  = 15 xx    
	    3'd1 :  ctx_idx_last_y_prefix_0_r  = {3'd0, 5'd12}; // chroma  16x16 , 15  + 0>>2  = 15       
	    3'd2 :  ctx_idx_last_y_prefix_0_r  = {3'd0, 5'd12}; // chroma  8x8   , 15  + 0>>1  = 15       
	    3'd3 :  ctx_idx_last_y_prefix_0_r  = {3'd0, 5'd12}; // chroma  4x4   , 15  + 0>>0  = 15       
		3'd4 :  ctx_idx_last_y_prefix_0_r  = {3'd0, 5'd10}; // luma    32x32 , 10  + 0>>1  = 10       
		3'd5 :  ctx_idx_last_y_prefix_0_r  = {3'd0, 5'd9 }; // luma    16x16 , 6   + 0>>1  = 6        
		3'd6 :  ctx_idx_last_y_prefix_0_r  = {3'd0, 5'd8 }; // luma    8x8   , 3   + 0>>1  = 3        
		3'd7 :  ctx_idx_last_y_prefix_0_r  = {3'd0, 5'd7 }; // luma    4x4   , 0   + 0>>0  = 0        
	endcase  
end 

// ctx_idx_last_y_prefix_1_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_y_prefix_1_r  =  8'hff       ; // chroma  32x32 , 15  + 1>>3  = 15 xx
	    3'd1 :  ctx_idx_last_y_prefix_1_r  = {3'd0, 5'd12}; // chroma  16x16 , 15  + 1>>2  = 15
	    3'd2 :  ctx_idx_last_y_prefix_1_r  = {3'd0, 5'd12}; // chroma  8x8   , 15  + 1>>1  = 15
	    3'd3 :  ctx_idx_last_y_prefix_1_r  = {3'd1, 5'd14}; // chroma  4x4   , 15  + 1>>0  = 16
		3'd4 :  ctx_idx_last_y_prefix_1_r  = {3'd0, 5'd10}; // luma    32x32 , 10  + 1>>1  = 10
		3'd5 :  ctx_idx_last_y_prefix_1_r  = {3'd0, 5'd9 }; // luma    16x16 , 6   + 1>>1  = 6 
		3'd6 :  ctx_idx_last_y_prefix_1_r  = {3'd0, 5'd8 }; // luma    8x8   , 3   + 1>>1  = 3 
		3'd7 :  ctx_idx_last_y_prefix_1_r  = {3'd1, 5'd9 }; // luma    4x4   , 0   + 1>>0  = 1 
	endcase  
end 

// ctx_idx_last_y_prefix_2_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_y_prefix_2_r  =  8'hff       ; // chroma  32x32 ,  15  + 2>>3  = 15 xx 
	    3'd1 :  ctx_idx_last_y_prefix_2_r  = {3'd0, 5'd12}; // chroma  16x16 ,  15  + 2>>2  = 15
	    3'd2 :  ctx_idx_last_y_prefix_2_r  = {3'd1, 5'd14}; // chroma  8x8   ,  15  + 2>>1  = 16
	    3'd3 :  ctx_idx_last_y_prefix_2_r  = {3'd2, 5'd6}; // chroma  4x4   ,  15  + 2>>0  = 17
		3'd4 :  ctx_idx_last_y_prefix_2_r  = {3'd1, 5'd12}; // luma    32x32 ,  10  + 2>>1  = 11
		3'd5 :  ctx_idx_last_y_prefix_2_r  = {3'd1, 5'd11}; // luma    16x16 ,  6   + 2>>1  = 7 
		3'd6 :  ctx_idx_last_y_prefix_2_r  = {3'd1, 5'd10}; // luma    8x8   ,  3   + 2>>1  = 4 
		3'd7 :  ctx_idx_last_y_prefix_2_r  = {3'd3, 5'd10}; // luma    4x4   ,  0   + 2>>0  = 2 
	endcase  
end 

// ctx_idx_last_y_prefix_3_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_y_prefix_3_r  =  8'hff       ; // chroma  32x32 ,  15  + 3>>3  = 15 xx 
	    3'd1 :  ctx_idx_last_y_prefix_3_r  = {3'd0, 5'd12}; // chroma  16x16 ,  15  + 3>>2  = 15
	    3'd2 :  ctx_idx_last_y_prefix_3_r  = {3'd1, 5'd14}; // chroma  8x8   ,  15  + 3>>1  = 16
	    3'd3 :  ctx_idx_last_y_prefix_3_r  = {3'd3, 5'd14}; // chroma  4x4   ,  15  + 3>>0  = 18
		3'd4 :  ctx_idx_last_y_prefix_3_r  = {3'd1, 5'd12}; // luma    32x32 ,  10  + 3>>1  = 11
		3'd5 :  ctx_idx_last_y_prefix_3_r  = {3'd1, 5'd11}; // luma    16x16 ,  6   + 3>>1  = 7 
		3'd6 :  ctx_idx_last_y_prefix_3_r  = {3'd1, 5'd10}; // luma    8x8   ,  3   + 3>>1  = 4 
		3'd7 :  ctx_idx_last_y_prefix_3_r  = {3'd0, 5'd8 }; // luma    4x4   ,  0   + 3>>0  = 3 
	endcase  
end 

// ctx_idx_last_y_prefix_4_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_y_prefix_4_r  =  8'hff       ; // chroma  32x32 ,  15  + 4>>3  = 15 xx 
	    3'd1 :  ctx_idx_last_y_prefix_4_r  = {3'd1, 5'd14}; // chroma  16x16 ,  15  + 4>>2  = 16
	    3'd2 :  ctx_idx_last_y_prefix_4_r  = {3'd2, 5'd6 }; // chroma  8x8   ,  15  + 4>>1  = 17
	    3'd3 :  ctx_idx_last_y_prefix_4_r  =  8'hff       ; // chroma  4x4   ,  15  + 4>>0  = 19 xx
		3'd4 :  ctx_idx_last_y_prefix_4_r  = {3'd3, 5'd13}; // luma    32x32 ,  10  + 4>>1  = 12
		3'd5 :  ctx_idx_last_y_prefix_4_r  = {3'd2, 5'd5 }; // luma    16x16 ,  6   + 4>>1  = 8 
		3'd6 :  ctx_idx_last_y_prefix_4_r  = {3'd3, 5'd11}; // luma    8x8   ,  3   + 4>>1  = 5 
		3'd7 :  ctx_idx_last_y_prefix_4_r  =  8'hff       ; // luma    4x4   ,  0   + 4>>0  = 4  xx
	endcase                           
end 

// ctx_idx_last_y_prefix_5_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_y_prefix_5_r  =  8'hff       ; // chroma  32x32 ,  15  + 5>>3  =  15 xx 
	    3'd1 :  ctx_idx_last_y_prefix_5_r  = {3'd1, 5'd14}; // chroma  16x16 ,  15  + 5>>2  =  16 
	    3'd2 :  ctx_idx_last_y_prefix_5_r  = {3'd2, 5'd6 }; // chroma  8x8   ,  15  + 5>>1  =  17 
	    3'd3 :  ctx_idx_last_y_prefix_5_r  =  8'hff       ; // chroma  4x4   ,  15  + 5>>0  =  20 xx
		3'd4 :  ctx_idx_last_y_prefix_5_r  = {3'd3, 5'd13}; // luma    32x32 ,  10  + 5>>1  = 12
		3'd5 :  ctx_idx_last_y_prefix_5_r  = {3'd2, 5'd5 }; // luma    16x16 ,  6   + 5>>1  =  8  
		3'd6 :  ctx_idx_last_y_prefix_5_r  = {3'd3, 5'd11}; // luma    8x8   ,  3   + 5>>1  =  5  
		3'd7 :  ctx_idx_last_y_prefix_5_r  =  8'hff       ; // luma    4x4   ,  0   + 5>>0  =  5  xx
	endcase  
end 

// ctx_idx_last_y_prefix_6_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_y_prefix_6_r  =  8'hff       ; // chroma  32x32 ,  15  + 6>>3  = 15 xx 
	    3'd1 :  ctx_idx_last_y_prefix_6_r  = {3'd1 ,5'd14}; // chroma  16x16 ,  15  + 6>>2  = 16
	    3'd2 :  ctx_idx_last_y_prefix_6_r  =  8'hff       ; // chroma  8x8   ,  15  + 6>>1  = 18 xx 
	    3'd3 :  ctx_idx_last_y_prefix_6_r  =  8'hff       ; // chroma  4x4   ,  15  + 6>>0  = 21 xx
		3'd4 :  ctx_idx_last_y_prefix_6_r  = {3'd0, 5'd11}; // luma    32x32 ,  10  + 6>>1  = 13
		3'd5 :  ctx_idx_last_y_prefix_6_r  = {3'd3, 5'd12}; // luma    16x16 ,  6   + 6>>1  = 9 
		3'd6 :  ctx_idx_last_y_prefix_6_r  =  8'hff       ; // luma    8x8   ,  3   + 6>>1  = 6  xx
		3'd7 :  ctx_idx_last_y_prefix_6_r  =  8'hff       ; // luma    4x4   ,  0   + 6>>0  = 6  xx
	endcase  
end 

// ctx_idx_last_y_prefix_7_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_y_prefix_7_r  =  8'hff       ; // chroma  32x32 ,  15  + 7>>3  = 15 xx 
	    3'd1 :  ctx_idx_last_y_prefix_7_r  = {3'd1, 5'd14}; // chroma  16x16 ,  15  + 7>>2  = 16 
	    3'd2 :  ctx_idx_last_y_prefix_7_r  =  8'hff       ; // chroma  8x8   ,  15  + 7>>1  = 18 xx
	    3'd3 :  ctx_idx_last_y_prefix_7_r  =  8'hff       ; // chroma  4x4   ,  15  + 7>>0  = 21 xx
		3'd4 :  ctx_idx_last_y_prefix_7_r  = {3'd0, 5'd11}; // luma    32x32 ,  10  + 7>>1  = 13
		3'd5 :  ctx_idx_last_y_prefix_7_r  = {3'd3, 5'd12}; // luma    16x16 ,  6   + 7>>1  = 9 
		3'd6 :  ctx_idx_last_y_prefix_7_r  =  8'hff       ; // luma    8x8   ,  3   + 7>>1  = 6  xx
		3'd7 :  ctx_idx_last_y_prefix_7_r  =  8'hff       ; // luma    4x4   ,  0   + 7>>0  = 7  xx
	endcase  
end 

// ctx_idx_last_y_prefix_8_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_y_prefix_8_r  =  8'hff       ; // chroma  32x32 ,  15  + 8>>3  = 16 xx 
	    3'd1 :  ctx_idx_last_y_prefix_8_r  =  8'hff       ; // chroma  16x16 ,  15  + 8>>2  = 17 xx 
	    3'd2 :  ctx_idx_last_y_prefix_8_r  =  8'hff       ; // chroma  8x8   ,  15  + 8>>1  = 19 xx 
	    3'd3 :  ctx_idx_last_y_prefix_8_r  =  8'hff       ; // chroma  4x4   ,  15  + 8>>0  = 23 xx
		3'd4 :  ctx_idx_last_y_prefix_8_r  = {3'd1, 5'd13}; // luma    32x32 ,  10  + 8>>1  = 14
		3'd5 :  ctx_idx_last_y_prefix_8_r  =  8'hff       ; // luma    16x16 ,  6   + 8>>1  = 10 xx
		3'd6 :  ctx_idx_last_y_prefix_8_r  =  8'hff       ; // luma    8x8   ,  3   + 8>>1  = 7  xx
		3'd7 :  ctx_idx_last_y_prefix_8_r  =  8'hff       ; // luma    4x4   ,  0   + 8>>0  = 8  xx
	endcase  
end 

// ctx_idx_last_y_prefix_9_r	
always @* begin 
	case( {e_type_i[1],tu_depth_i} )                
        3'd0 :  ctx_idx_last_y_prefix_9_r  =  8'hff       ; // chroma  32x32 ,  15  + 9>>3  = 16 xx
	    3'd1 :  ctx_idx_last_y_prefix_9_r  =  8'hff       ; // chroma  16x16 ,  15  + 9>>2  = 17 xx
	    3'd2 :  ctx_idx_last_y_prefix_9_r  =  8'hff       ; // chroma  8x8   ,  15  + 9>>1  = 19 xx
	    3'd3 :  ctx_idx_last_y_prefix_9_r  =  8'hff       ; // chroma  4x4   ,  15  + 9>>0  = 23 xx
		3'd4 :  ctx_idx_last_y_prefix_9_r  = {3'd1, 5'd13}; // luma    32x32 ,  10  + 9>>1  = 14
		3'd5 :  ctx_idx_last_y_prefix_9_r  =  8'hff       ; // luma    16x16 ,  6   + 9>>1  = 10 xx
		3'd6 :  ctx_idx_last_y_prefix_9_r  =  8'hff       ; // luma    8x8   ,  3   + 9>>1  = 7  xx
		3'd7 :  ctx_idx_last_y_prefix_9_r  =  8'hff       ; // luma    4x4   ,  0   + 9>>0  = 9  xx
	endcase  
end 

// ctx_pair_last_y_suffix_r
// 0:regular , 1:invalid ,2:bypsss,3:termianl
// bypass:{2'10,1'b0,bins_number[2:0],bins[4:0]}
always @* begin 
    case(pos_y_r)
        5'd0  :     ctx_pair_last_y_suffix_r   =   {2'b01,1'b0,3'd0,5'b00000 } ; //  i_count=  0  
		5'd1  :     ctx_pair_last_y_suffix_r   =   {2'b01,1'b0,3'd0,5'b00000 } ; //  i_count=  0
		5'd2  :     ctx_pair_last_y_suffix_r   =   {2'b01,1'b0,3'd0,5'b00000 } ; //  i_count=  0
		5'd3  :     ctx_pair_last_y_suffix_r   =   {2'b01,1'b0,3'd0,5'b00000 } ; //  i_count=  0
		5'd4  :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd1,5'b0000_0} ; //  i_count=  1		0
		5'd5  :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd1,5'b0000_1} ; //  i_count=  1		1
		5'd6  :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd1,5'b0000_0} ; //  i_count=  1		0
		5'd7  :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd1,5'b0000_1} ; //  i_count=  1		1
		5'd8  :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_00} ; //  i_count=  2		00
		5'd9  :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_01} ; //  i_count=  2		01
		5'd10 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_10} ; //  i_count=  2		10
		5'd11 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_11} ; //  i_count=  2		11
		5'd12 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_00} ; //  i_count=  2		00
		5'd13 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_01} ; //  i_count=  2		01
		5'd14 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_10} ; //  i_count=  2		10
		5'd15 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd2,5'b000_11} ; //  i_count=  2		11
		5'd16 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_000} ; //  i_count=  3		000
		5'd17 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_001} ; //  i_count=  3		001
		5'd18 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_010} ; //  i_count=  3		010
		5'd19 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_011} ; //  i_count=  3		011
		5'd20 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_100} ; //  i_count=  3		100
		5'd21 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_101} ; //  i_count=  3		101
		5'd22 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_110} ; //  i_count=  3		110
		5'd23 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_111} ; //  i_count=  3		111
		5'd24 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_000} ; //  i_count=  3		000
		5'd25 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_001} ; //  i_count=  3		001
		5'd26 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_010} ; //  i_count=  3		010
		5'd27 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_011} ; //  i_count=  3		011
		5'd28 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_100} ; //  i_count=  3		100
		5'd29 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_101} ; //  i_count=  3		101
		5'd30 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_110} ; //  i_count=  3		110
        5'd31 :     ctx_pair_last_y_suffix_r   =   {2'b10,1'b0,3'd3,5'b00_111} ; //  i_count=  3		111
	endcase
end 

//-----------------------------------------------------------------------------------------------------------------------------
//
//            output signals 
//
//-----------------------------------------------------------------------------------------------------------------------------

assign   ctx_pair_last_x_prefix_0_o    =   ctx_pair_last_x_prefix_0_w          ;  	
assign   ctx_pair_last_x_prefix_1_o    =   ctx_pair_last_x_prefix_1_w          ;  	
assign   ctx_pair_last_x_prefix_2_o    =   ctx_pair_last_x_prefix_2_w          ;  	
assign   ctx_pair_last_x_prefix_3_o    =   ctx_pair_last_x_prefix_3_w          ;  	
assign   ctx_pair_last_x_prefix_4_o    =   ctx_pair_last_x_prefix_4_w          ;  	
assign   ctx_pair_last_x_prefix_5_o    =   ctx_pair_last_x_prefix_5_w          ;  	
assign   ctx_pair_last_x_prefix_6_o    =   ctx_pair_last_x_prefix_6_w          ;  	
assign   ctx_pair_last_x_prefix_7_o    =   ctx_pair_last_x_prefix_7_w          ;  	
assign   ctx_pair_last_x_prefix_8_o    =   ctx_pair_last_x_prefix_8_w          ;  	
assign   ctx_pair_last_x_prefix_9_o    =   ctx_pair_last_x_prefix_9_w          ;  	
assign   ctx_pair_last_x_suffix_o      =   ctx_pair_last_x_suffix_r            ;  
assign   ctx_pair_last_y_prefix_0_o    =   ctx_pair_last_y_prefix_0_w          ;  		
assign   ctx_pair_last_y_prefix_1_o    =   ctx_pair_last_y_prefix_1_w          ;
assign   ctx_pair_last_y_prefix_2_o    =   ctx_pair_last_y_prefix_2_w          ;
assign   ctx_pair_last_y_prefix_3_o    =   ctx_pair_last_y_prefix_3_w          ;
assign   ctx_pair_last_y_prefix_4_o    =   ctx_pair_last_y_prefix_4_w          ;
assign   ctx_pair_last_y_prefix_5_o    =   ctx_pair_last_y_prefix_5_w          ;
assign   ctx_pair_last_y_prefix_6_o    =   ctx_pair_last_y_prefix_6_w          ;
assign   ctx_pair_last_y_prefix_7_o    =   ctx_pair_last_y_prefix_7_w          ;
assign   ctx_pair_last_y_prefix_8_o    =   ctx_pair_last_y_prefix_8_w          ;
assign   ctx_pair_last_y_prefix_9_o    =   ctx_pair_last_y_prefix_9_w          ;
assign   ctx_pair_last_y_suffix_o      =   ctx_pair_last_y_suffix_r            ;


endmodule 


