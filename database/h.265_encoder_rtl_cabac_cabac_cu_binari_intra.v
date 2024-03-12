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
// Filename       : cabac_cu_binari_intra.v
// Author         : chewein
// Created        : 2014-9-11
// Description    : binarization intra part size , luma mode and chroma mode 
//-----------------------------------------------------------------------------------------------------------------------------
`include"enc_defines.v"

module cabac_cu_binari_intra(
                        // input 
                        cu_depth_i              ,
					    cu_sub_div_i            ,
                        cu_luma_pred_mode_i     ,
                        cu_chroma_pred_mode_i   ,
                        cu_luma_pred_left_mode_i,
                        cu_luma_pred_top_mode_i ,
						
						//  output	
				        ctx_pair_intra_0_o      , 
				        ctx_pair_intra_1_o      , 
				        ctx_pair_intra_2_o      , 
				        ctx_pair_intra_3_o      , 
				        ctx_pair_intra_4_o      , 
				        ctx_pair_intra_5_o      , 
				        ctx_pair_intra_6_o      , 
				        ctx_pair_intra_7_o      , 
				        ctx_pair_intra_8_o      , 
				        ctx_pair_intra_9_o      , 
				        ctx_pair_intra_10_o     ,   
                        ctx_valid_num_intra_o
                        ); 
//-----------------------------------------------------------------------------------------------------------------------------
//
//                                input signals and output signals 
//
//-----------------------------------------------------------------------------------------------------------------------------
input  [ 1:0]                      cu_depth_i               ; // cu_depth,0:64x64,1:32x32,2:16x16,3:8x8   					
input                              cu_sub_div_i             ; 						
input  [23:0]                      cu_luma_pred_mode_i      ;
input  [ 5:0]                      cu_chroma_pred_mode_i    ;
input  [23:0]                      cu_luma_pred_left_mode_i ;
input  [23:0]                      cu_luma_pred_top_mode_i  ;

// output                						
output [10:0]                      ctx_pair_intra_0_o       ;
output [10:0]                      ctx_pair_intra_1_o       ;
output [10:0]                      ctx_pair_intra_2_o       ;
output [10:0]                      ctx_pair_intra_3_o       ;
output [10:0]                      ctx_pair_intra_4_o       ;
output [10:0]                      ctx_pair_intra_5_o       ;
output [10:0]                      ctx_pair_intra_6_o       ;
output [10:0]                      ctx_pair_intra_7_o       ;
output [10:0]                      ctx_pair_intra_8_o       ;
output [10:0]                      ctx_pair_intra_9_o       ;
output [10:0]                      ctx_pair_intra_10_o      ;
output [ 4:0]                      ctx_valid_num_intra_o    ;

// -----------------------------------------------------------------------------------------------------------------------------
//
//		wire  and  reg declaration 
//
// -----------------------------------------------------------------------------------------------------------------------------

wire     [5:0]	  luma_curr_mode_3_w  =  cu_luma_pred_mode_i[ 5:0 ]     ;
wire     [5:0]	  luma_curr_mode_2_w  =  cu_luma_pred_mode_i[11:6 ]     ;
wire     [5:0]	  luma_curr_mode_1_w  =  cu_luma_pred_mode_i[17:12]     ;
wire     [5:0]	  luma_curr_mode_0_w  =  cu_luma_pred_mode_i[23:18]     ;

wire     [5:0]	  luma_left_mode_3_w  =  cu_luma_pred_mode_i[11:6 ]     ;
wire     [5:0]	  luma_left_mode_2_w  =  cu_luma_pred_left_mode_i[5:0 ] ;
wire     [5:0]	  luma_left_mode_1_w  =  cu_luma_pred_mode_i[23:18]     ;
wire     [5:0]	  luma_left_mode_0_w  =  cu_luma_pred_left_mode_i[17:12];

wire     [5:0]	  luma_top_mode_3_w   =  cu_luma_pred_mode_i[17:12]     ;
wire     [5:0]	  luma_top_mode_2_w   =  cu_luma_pred_mode_i[23:18]     ;
wire     [5:0]	  luma_top_mode_1_w   =  cu_luma_pred_top_mode_i[5:0]   ;
wire     [5:0]	  luma_top_mode_0_w   =  cu_luma_pred_top_mode_i[11:6]  ;					

wire     num_pu_w_flag  = ( (cu_depth_i==2'b11) ? (cu_sub_div_i ? 1'b1 : 1'b0) : 1'b0 );//1: 4 sub pu , 0 :1 sub pu 						

// -----------------------------------------------------------------------------------------------------------------------------
//
//		luma mode binarization 
//
// -----------------------------------------------------------------------------------------------------------------------------
wire     [10:0]  ctx_pair_luma_mode_00_w  ;
wire     [10:0]  ctx_pair_luma_mode_01_w  ;
wire     [10:0]  ctx_pair_luma_mode_10_w  ;
wire     [10:0]  ctx_pair_luma_mode_11_w  ;
wire     [10:0]  ctx_pair_luma_mode_20_w  ;
wire     [10:0]  ctx_pair_luma_mode_21_w  ;
wire     [10:0]  ctx_pair_luma_mode_30_w  ;
wire     [10:0]  ctx_pair_luma_mode_31_w  ;

cabac_cu_binari_intra_luma_mode   u_binari_intra_luma_mode_u0(
                            .luma_curr_mode_i      ( luma_curr_mode_0_w    ),
							.luma_left_mode_i      ( luma_left_mode_0_w    ),
                            .luma_top_mode_i       ( luma_top_mode_0_w     ),
      
	                        .ctx_pair_luma_mode_0_o( ctx_pair_luma_mode_00_w),
                            .ctx_pair_luma_mode_1_o( ctx_pair_luma_mode_01_w)
                            );					
						
cabac_cu_binari_intra_luma_mode   u_binari_intra_luma_mode_u1(
                            .luma_curr_mode_i      ( luma_curr_mode_1_w    ),
							.luma_left_mode_i      ( luma_left_mode_1_w    ),
                            .luma_top_mode_i       ( luma_top_mode_1_w     ),
      
	                        .ctx_pair_luma_mode_0_o( ctx_pair_luma_mode_10_w),
                            .ctx_pair_luma_mode_1_o( ctx_pair_luma_mode_11_w)
                            );							

cabac_cu_binari_intra_luma_mode   u_binari_intra_luma_mode_u2(
                            .luma_curr_mode_i      ( luma_curr_mode_2_w    ),
							.luma_left_mode_i      ( luma_left_mode_2_w    ),
                            .luma_top_mode_i       ( luma_top_mode_2_w     ),
      
	                        .ctx_pair_luma_mode_0_o( ctx_pair_luma_mode_20_w),
                            .ctx_pair_luma_mode_1_o( ctx_pair_luma_mode_21_w)
                            );								
						
cabac_cu_binari_intra_luma_mode   u_binari_intra_luma_mode_u3(
                            .luma_curr_mode_i      ( luma_curr_mode_3_w    ),
							.luma_left_mode_i      ( luma_left_mode_3_w    ),
                            .luma_top_mode_i       ( luma_top_mode_3_w     ),
      
	                        .ctx_pair_luma_mode_0_o( ctx_pair_luma_mode_30_w),
                            .ctx_pair_luma_mode_1_o( ctx_pair_luma_mode_31_w)
                            );							
						
						
// -----------------------------------------------------------------------------------------------------------------------------
//
//		chroma mode binarization 
//
// -----------------------------------------------------------------------------------------------------------------------------
wire    [10:0]   ctx_pair_chroma_mode_0_w   ;
wire    [10:0]   ctx_pair_chroma_mode_1_w   ;

reg     [4:0]    bin_string_chroma_mode_r   ;

wire    [5:0]   ui_luma_mode_w              ;
reg     [5:0]   chroma_candi_mode_0_w       ;
reg     [5:0]   chroma_candi_mode_1_w       ;
reg     [5:0]   chroma_candi_mode_2_w       ;
reg     [5:0]   chroma_candi_mode_3_w       ;
reg     [5:0]   chroma_candi_mode_4_w       ;

reg     [1:0]   chroma_dir_candi_r          ;

assign   ui_luma_mode_w         =      cu_luma_pred_mode_i[5:0]  ;
always @* begin 
    if(ui_luma_mode_w == 6'd0) begin 
        chroma_candi_mode_0_w  =  6'd34 ;
		chroma_candi_mode_1_w  =  6'd26 ;
		chroma_candi_mode_2_w  =  6'd10 ;
        chroma_candi_mode_3_w  =  6'd1  ;
	end 
    else if(ui_luma_mode_w == 6'd26) begin 
        chroma_candi_mode_0_w  =  6'd0  ;	
		chroma_candi_mode_1_w  =  6'd34 ;	
		chroma_candi_mode_2_w  =  6'd10 ;	
        chroma_candi_mode_3_w  =  6'd1  ;	
	end 
    else if(ui_luma_mode_w == 6'd10) begin
        chroma_candi_mode_0_w  =  6'd0  ;	
		chroma_candi_mode_1_w  =  6'd26 ;	
		chroma_candi_mode_2_w  =  6'd34 ;	
        chroma_candi_mode_3_w  =  6'd1  ;	
	end 
	else if(ui_luma_mode_w == 6'd1)begin 
        chroma_candi_mode_0_w  =  6'd0  ;	
		chroma_candi_mode_1_w  =  6'd26 ;	
		chroma_candi_mode_2_w  =  6'd10 ;	
        chroma_candi_mode_3_w  =  6'd34 ;	
	end 
	else begin 
        chroma_candi_mode_0_w  =  6'd0  ;
		chroma_candi_mode_1_w  =  6'd26 ;
		chroma_candi_mode_2_w  =  6'd10 ;
        chroma_candi_mode_3_w  =  6'd1  ;
	end 
end 

always @* begin 
    if(cu_chroma_pred_mode_i == chroma_candi_mode_0_w)
	    chroma_dir_candi_r  =  2'd0    ;
    else if(cu_chroma_pred_mode_i == chroma_candi_mode_1_w)
	    chroma_dir_candi_r  =  2'd1    ;	
    else if(cu_chroma_pred_mode_i == chroma_candi_mode_2_w)
	    chroma_dir_candi_r  =  2'd2    ;
    else if(cu_chroma_pred_mode_i == chroma_candi_mode_3_w)
	    chroma_dir_candi_r  =  2'd3    ;
	else 
	    chroma_dir_candi_r  =  cu_chroma_pred_mode_i[1:0] ;
end 

always @* begin 
    if(cu_chroma_pred_mode_i == 6'd36)   //1regualr + 0bypass
        bin_string_chroma_mode_r  =  {2'b00,1'b0,2'b00}             ;
	else                                 //1regualr + 2bypass 
        bin_string_chroma_mode_r  =  {2'b10,1'b1,chroma_dir_candi_r};
end 

// coding_mode:0:regular mode,1:invalid,2:bypass mode,3:terminal mode 
// regular:{2'b00, bin, bank_num,addr_idx} {2,1,3,5}  
// bypass :{2'b10,1resverd,bins_num,bin_string} {2,1resverd,3,5}


assign ctx_pair_chroma_mode_0_w = {2'b00,bin_string_chroma_mode_r[2],3'd1,5'd30};
assign ctx_pair_chroma_mode_1_w = {2'b10,1'b0,bin_string_chroma_mode_r[4:3],3'b000,bin_string_chroma_mode_r[1:0]};

// -----------------------------------------------------------------------------------------------------------------------------
//
//		intra part size binarization 
//
// -----------------------------------------------------------------------------------------------------------------------------
wire    [10:0]   ctx_pair_intra_part_size_w      ;
wire    [ 1:0]   intra_part_size_coding_mode_w   ;
wire             intra_part_size_coding_bin_w    ;


assign intra_part_size_coding_mode_w  =  (cu_depth_i == 2'b11) ? 2'b00 : 2'b01 ;
assign intra_part_size_coding_bin_w   =  !cu_sub_div_i                         ;
assign ctx_pair_intra_part_size_w     =  {intra_part_size_coding_mode_w,intra_part_size_coding_bin_w,3'd3, 5'd26};

// -----------------------------------------------------------------------------------------------------------------------------
//
//		output signals
//
// -----------------------------------------------------------------------------------------------------------------------------
wire [4:0] ctx_valid_num_intra_w = num_pu_w_flag ? 5'd11 : 5'd5           ;

assign  ctx_pair_intra_0_o   =  ctx_pair_intra_part_size_w                                            ;
assign  ctx_pair_intra_1_o   =  ctx_pair_luma_mode_00_w                                               ;
assign  ctx_pair_intra_2_o   =  num_pu_w_flag ?  ctx_pair_luma_mode_10_w : ctx_pair_luma_mode_01_w    ;
assign  ctx_pair_intra_3_o   =  num_pu_w_flag ?  ctx_pair_luma_mode_20_w : ctx_pair_chroma_mode_0_w   ; 
assign  ctx_pair_intra_4_o   =  num_pu_w_flag ?  ctx_pair_luma_mode_30_w : ctx_pair_chroma_mode_1_w   ; 
assign  ctx_pair_intra_5_o   =  num_pu_w_flag ?  ctx_pair_luma_mode_01_w : {2'b01,1'b0,8'hff}         ;
assign  ctx_pair_intra_6_o   =  num_pu_w_flag ?  ctx_pair_luma_mode_11_w : {2'b01,1'b0,8'hff}         ;
assign  ctx_pair_intra_7_o   =  num_pu_w_flag ?  ctx_pair_luma_mode_21_w : {2'b01,1'b0,8'hff}         ;
assign  ctx_pair_intra_8_o   =  num_pu_w_flag ?  ctx_pair_luma_mode_31_w : {2'b01,1'b0,8'hff}         ;
assign  ctx_pair_intra_9_o   =  num_pu_w_flag ?  ctx_pair_chroma_mode_0_w: {2'b01,1'b0,8'hff}         ;
assign  ctx_pair_intra_10_o  =  num_pu_w_flag ?  ctx_pair_chroma_mode_1_w: {2'b01,1'b0,8'hff}         ;

assign  ctx_valid_num_intra_o= ctx_valid_num_intra_w                     ;        



	

endmodule 

