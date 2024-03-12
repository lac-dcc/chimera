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
// Filename       : cabac_residual.v
// Author         : guo yong
// Created        : 2013-12
// Description    : H.265 encode residual
//               
//-------------------------------------------------------------------
`include "enc_defines.v"

module cabac_residual(
					//input
                   	clk								,
                   	rst_n							,
                   	residual_en_i					,
                   	                        		
                   	mb_x_i							,
                   	mb_y_i							,
                   	slice_type_i					,
                   	
                   	intra_luma_mode_i				,
                   	intra_chroma_mode_i				,
                   	
                   	cu_idx_i						,
                   	cu_depth_i						,
                   	cu_idx_minus1_i					,
                   	cu_idx_minus5_i					,
                   	cu_idx_minus21_i				,	
                  
                  	cu_qp_i							,
                   	luma_cbf_i						,
                   	cr_cbf_i						,
                   	cb_cbf_i						,
                   	
                   	                        		
					data_coeff_i					,
                   	                        		
                   	//output                		
					addr_coeff_o					,
					rd_en_coeff_o					,
                   	residual_done_o					,
                   	                        		
                   	ctx_pair_residual0_o			, 
                   	ctx_pair_residual1_o			, 
                   	ctx_pair_residual2_o			, 
                   	ctx_pair_residual3_o			, 
                   	ctx_pair_residual4_o			, 
                   	ctx_pair_residual5_o			, 
                   	ctx_pair_residual6_o			, 
                   	ctx_pair_residual7_o			, 
                   	ctx_pair_residual8_o			, 
                   	ctx_pair_residual9_o			, 
                   	ctx_pair_residual10_o			,
                   	ctx_pair_residual11_o			,
                   	ctx_pair_residual12_o			,
                   	ctx_pair_residual13_o			,
                   	ctx_pair_residual14_o			,
                   	ctx_pair_residual15_o			,
                   	valid_num_residual_o    		           
);



// **************************************************
// 
//			INPUT DECLARATION
//
// **************************************************

input           						clk								;   //clock 
input           						rst_n							;	//reset, low active 
input           						residual_en_i					;	//residual enable
input	[`PIC_X_WIDTH-1:0]      		mb_x_i							;	//mb_x
input	[`PIC_Y_WIDTH-1:0]      		mb_y_i							;	//mb_y
                                    	        		
input									slice_type_i					;	//slice_type_i 
     	           	                
input	[5:0]							intra_luma_mode_i				;	//intra_luma_mode_i
input	[5:0]							intra_chroma_mode_i				;	//intra chroma mode     	           	                
					
																			//have reversed in the upper story, 0: split, 1: unsplit
input	[6:0]							cu_idx_i						;	//cu index 
input	[6:0]							cu_idx_minus1_i					;	//cu index minus 1
input	[6:0]							cu_idx_minus5_i					;	//cu index minus 5
input	[6:0]							cu_idx_minus21_i				;	//cu index minus 21
input	[1:0]							cu_depth_i						;	//cu depth: 0~3 
     	       
input	[5:0]							cu_qp_i							;	//cu qp      	           	         
input	[`LCU_SIZE*`LCU_SIZE/16-1:0]	luma_cbf_i						;	//z-scan, reverse order 
input	[`LCU_SIZE*`LCU_SIZE/64-1:0]	cr_cbf_i						;	//z-scan, reverse order
input	[`LCU_SIZE*`LCU_SIZE/64-1:0]	cb_cbf_i						;	//z-scan, reverse order
														    	           	                    			
input	[255:0]							data_coeff_i					;	//residual data of current block
                                    	    		


// **************************************************
//
// 			OUTPUT DECLARATION
//
// **************************************************               	    		
output	[8:0]		addr_coeff_o					;	//residual address of next block
output				rd_en_coeff_o					;	//read residual enable signal

output	          	residual_done_o					;	//residual encode done flag
                	                        		
output	[4:0]     	valid_num_residual_o			;	//valid number of residual      
output	[10:0]		ctx_pair_residual0_o			;   //ctx pair of residual bin 0    
output	[10:0]		ctx_pair_residual1_o			;   //ctx pair of residual bin 1    
output	[10:0]		ctx_pair_residual2_o			;   //ctx pair of residual bin 2    
output	[10:0]		ctx_pair_residual3_o			;   //ctx pair of residual bin 3    
output	[10:0]		ctx_pair_residual4_o			;   //ctx pair of residual bin 4    
output	[10:0]		ctx_pair_residual5_o			;   //ctx pair of residual bin 5    
output	[10:0]		ctx_pair_residual6_o			;   //ctx pair of residual bin 6    
output	[10:0]		ctx_pair_residual7_o			;   //ctx pair of residual bin 7    
output	[10:0]		ctx_pair_residual8_o			;   //ctx pair of residual bin 8    
output	[10:0]		ctx_pair_residual9_o			;   //ctx pair of residual bin 9    
output	[10:0]		ctx_pair_residual10_o			;   //ctx pair of residual bin 10   
output	[10:0]		ctx_pair_residual11_o			;   //ctx pair of residual bin 11   
output	[10:0]		ctx_pair_residual12_o			;   //ctx pair of residual bin 12   
output	[10:0]		ctx_pair_residual13_o			;   //ctx pair of residual bin 13   
output	[10:0]		ctx_pair_residual14_o			;   //ctx pair of residual bin 14   
output	[10:0]		ctx_pair_residual15_o			;   //ctx pair of residual bin 15  







// **************************************************
//
//		PARAMETER DECLARATION
//
// **************************************************
parameter			RESIDUAL_IDLE					= 4'd0,
					RESIDUAL_ROOT_CBF				= 4'd1,
					RESIDUAL_CHROMA_CBF_ROOT		= 4'd2,
					RESIDUAL_SUB_DIV				= 4'd3,
					RESIDUAL_CHROMA_CBF				= 4'd4,
					RESIDUAL_LUMA_CBF				= 4'd5,
					RESIDUAL_DQP					= 4'd6,
					RESIDUAL_LUMA_COEFF				= 4'd7,
					RESIDUAL_CR_COEFF				= 4'd8,
					RESIDUAL_CB_COEFF				= 4'd9,
					RESIDUAL_END					= 4'd10;
					
			
			
			
					
parameter			TU_IDLE							= 4'd0,			
					TU_SKIP_LAST_SIG				= 4'd1,
					TU_LAST_SIG_05					= 4'd2,
					TU_LAST_SIG_0					= 4'd3,
					TU_LAST_SIG						= 4'd4,
					TU_BLK_IDLE						= 4'd5,
					TU_BLK_CBF						= 4'd6,
					TU_SIG_FLAG						= 4'd7,
					TU_GE12							= 4'd8,
					TU_RES_SIGN						= 4'd9,
					TU_RES_REMAIN					= 4'd10,
					TU_END							= 4'd11;











// **************************************************
//
//			REG DECLARATION
// 
// **************************************************



reg		[8:0]		addr_coeff_o					;	//residual address of next block
reg					rd_en_coeff_o					;	//read residual enable signal
reg		          	residual_done_o					;	//residual encode done flag
	          	                        		
reg		[4:0]     	valid_num_residual_o			;	//valid number of residual      
reg		[10:0]		ctx_pair_residual0_o			;   //ctx pair of residual bin 0    
reg		[10:0]		ctx_pair_residual1_o			;   //ctx pair of residual bin 1    
reg		[10:0]		ctx_pair_residual2_o			;   //ctx pair of residual bin 2    
reg		[10:0]		ctx_pair_residual3_o			;   //ctx pair of residual bin 3    
reg		[10:0]		ctx_pair_residual4_o			;   //ctx pair of residual bin 4    
reg		[10:0]		ctx_pair_residual5_o			;   //ctx pair of residual bin 5    
reg		[10:0]		ctx_pair_residual6_o			;   //ctx pair of residual bin 6    
reg		[10:0]		ctx_pair_residual7_o			;   //ctx pair of residual bin 7    
reg		[10:0]		ctx_pair_residual8_o			;   //ctx pair of residual bin 8    
reg		[10:0]		ctx_pair_residual9_o			;   //ctx pair of residual bin 9    
reg		[10:0]		ctx_pair_residual10_o			;   //ctx pair of residual bin 10   
reg		[10:0]		ctx_pair_residual11_o			;   //ctx pair of residual bin 11   
reg		[10:0]		ctx_pair_residual12_o			;   //ctx pair of residual bin 12   
reg		[10:0]		ctx_pair_residual13_o			;   //ctx pair of residual bin 13   
reg		[10:0]		ctx_pair_residual14_o			;   //ctx pair of residual bin 14   
reg		[10:0]		ctx_pair_residual15_o			;   //ctx pair of residual bin 15  


reg		[3:0]		res_curr_state_r				;	//residual encode current state
reg		[3:0]		res_next_state_r				;	//residual encode next state

reg		[3:0]		tu_curr_state_r					;	//tu encode current state
reg		[3:0]		tu_next_state_r					;	//tu encode next state

reg		[1:0]		tu_cnt_r						;	//tu count reg
reg		[1:0]		tu_tot_r						;	//tu total reg
                                                                          
reg					qp_done_r						;	//qp encode done flag
reg					tu_done_r						;	//tu encode done flag                                                                          
                                                                          
                                                                         
                                                                         
                                                                         
reg					residual_done_r					;	//residual encode done flag
reg					rd_e_done_r						;	//read done of 4x4 block    
reg					scan_e_done_r					;	//scan done of 4x4 block                                                                  
reg					enc_e_done_r					;	//encoding done of 4x4 block 
reg					blk_e_done_r					;	//block encoding done       

wire				rd_done_w						;	//read one tu block
wire				enc_done_w 						;	//encode one tu block                                                                  
                                                                         
wire				rd_bin_cbf_w					;	//cbf of read blk coefficient
reg					enc_bin_cbf_r					;	//cbf of coding blk coefficient                                                                         
                                 
reg		[2:0]		rd_cyc_cnt_r					;	//read cycle count                                                                 
reg		[2:0]		scan_cyc_cnt_r					;	//scan cycle count                                                                          
                                                                          
reg		[1:0]		enc_sig_cyc_cnt_r				;	//sig cycle count
reg		[1:0]		enc_sig_cyc_tot_r				;	//sig cycle total

reg		[3:0]		enc_sign_cyc_cnt_r				;	//sign cycle count
reg		[3:0]		enc_sign_cyc_tot_r				;	//sign cycle total

reg		[3:0]		enc_ge12_cyc_cnt_r				;	//ge12 cycle count
reg		[3:0]		enc_ge12_cyc_tot_r				;	//ge12 cycle total

reg		[4:0]		enc_remain_cnt_r				;	//remain count
reg		[4:0]		enc_remain_tot_r				;	//remain total

reg		[3:0]		enc_remain_cyc_cnt_r			;	//remain cycle count
reg		[3:0]		enc_remain_cyc_tot_r			;	//remain cycle total

wire				enc_sign_done_w					;	//sign encode done flag
wire				enc_remain_done_w				;	//remain encode done flag

reg		[1:0]		c1_r							;	//c1_r


reg		[5:0]		blk_tot_r						;	//block total number
reg		[5:0]		blk_cbf_idx_r					;	//(4/16/64)-blk_tot_r, increase by on block
reg		[5:0]		rd_blk_cnt_r					;	//read block count
reg		[5:0]		rd_blk_cnt_level_r				;	//read block count level signal
reg		[5:0]		scan_blk_cnt_r					;	//scan block count
reg		[5:0]		enc_blk_cnt_r					;	//coding block count
reg		[5:0]		rd_blk_map_r					;	//


reg		[3:0]		cu_luma_cbf_r					;	//0: the first tu cbf, 1: the second tu cbf	      
                                                        //2: the third tu cbf, 3: the fourth tu cbf    
reg		[3:0]		cu_cr_cbf_r						;	//ditto                                        
reg		[3:0]		cu_cb_cbf_r						;	//ditto     

reg		[63:0]		tu_luma_cbf_r					;	//tu luma cbf
reg		[15:0]		tu_cr_cbf_r						;	//tu cr cbf
reg		[15:0]		tu_cb_cbf_r						;	//tu cb cbf     

reg		[63:0]		tu_32x32_luma_cbf_r				;	//tu 32x32 luma cbf
reg		[15:0]		tu_16x16_cr_cbf_r				;	//tu 16x16 cr cbf
reg		[15:0]		tu_16x16_cb_cbf_r				;	//tu 16x16 cb cbf

reg		[15:0]		tu_16x16_luma_cbf_r				;	//tu 16x16 luma cbf
reg		[3:0]		tu_8x8_cr_cbf_r					;	//tu 8x8 cr cbf
reg		[3:0]		tu_8x8_cb_cbf_r					;	//tu 8x8 cb cbf                              

reg		[3:0]		tu_8x8_luma_cbf_r				;	//tu 8x8 luma cbf
reg					tu_4x4_cr_cbf_r					;	//tu 4x4 cr cbf
reg					tu_4x4_cb_cbf_r					;	//tu 4x4 cb cbf    



// **************************************************
//
//			WIRE DECLARATION
// 
// **************************************************
wire 				cbf_ne_zero_flag_w				;	//cbf not equal zero
wire				cbf_chroma_ne_zero_flag_w		;	//cu_cr_cbf_r!=0 || cu_cb_cbf_r!=0
				
wire				tu_en_w							;	//tu enable flag
														//res_curr_state_r==RESIDUAL_LUMA_COEFF ||
														//res_curr_state_r==RESIDUAL_CR_COEFF ||
														//res_curr_state_r==RESIDUAL_CB_COEFF ||

wire	[7:0]		cu_idx_minus1_shift6_minus1_w	;














// *********************************************************					
// root_cbf
wire	[10:0]		ctx_pair_root_cbf_w						;	//context pair of root cbf
reg					valid_num_bin_root_cbf_r				;	//valid number of root cbf
wire				bin_string_root_cbf_w					;	//bin_string of root cbf
wire	[7:0]		ctx_idx_root_cbf_w						;	//context index of root cbf


// *********************************************************
// luma_cbf
wire	[10:0]		ctx_pair_luma_cbf_w						;	//context pair of luma cbf
reg					valid_num_bin_luma_cbf_r				;	//valid number bin of luma cbf
reg					bin_string_luma_cbf_r					;	//bin string of luma cbf
reg		[7:0]		ctx_idx_luma_cbf_r						;	//context index of luma cbf


// *********************************************************
// chroma_cbf
wire	[10:0]		ctx_pair_chroma_cbf_0_w					;	//context pair of chroma_root_cbf
wire	[10:0]		ctx_pair_chroma_cbf_1_w					;	//context pair of chroma_root_cbf
reg		[1:0]		valid_num_bin_chroma_cbf_r				;	//valid number of chroma root cbf
wire	[1:0]		bin_string_chroma_cbf_w					;	//bin string of chroma root cbf
wire	[7:0]		ctx_idx_chroma_cbf_0_w					;	//context index of chroma root cbf
wire	[7:0]		ctx_idx_chroma_cbf_1_w					;	//context index of chroma root cbf



// *********************************************************
// sub_div
wire	[10:0]		ctx_pair_sub_div_w						;	//context pair of sub div
reg					valid_num_bin_sub_div_r					;	//valid number bin of sub div
reg					bin_string_sub_div_r					;	//bin string of sub div
reg		[7:0]		ctx_idx_sub_div_r						;	//context index of sub div



// *********************************************************
// chroma_root_cbf
wire	[10:0]		ctx_pair_chroma_root_cbf_0_w			;	//context pair of chroma_root_cbf
wire	[10:0]		ctx_pair_chroma_root_cbf_1_w			;	//context pair of chroma_root_cbf
wire	[1:0]		valid_num_bin_chroma_root_cbf_w			;	//valid number of chroma root cbf
wire	[1:0]		bin_string_chroma_root_cbf_w			;	//bin string of chroma root cbf
wire	[7:0]		ctx_idx_chroma_root_cbf_0_w				;	//context index of chroma root cbf
wire	[7:0]		ctx_idx_chroma_root_cbf_1_w				;	//context index of chroma root cbf



// *********************************************************
// qp_delta
reg		[10:0]		ctx_pair_qp_delta_0_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_1_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_2_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_3_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_4_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_5_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_6_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_7_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_8_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_9_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_10_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_11_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_12_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_13_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_14_w					;	//context pair of qp_delta
reg		[10:0]		ctx_pair_qp_delta_15_w					;	//context pair of qp_delta


reg		[3:0]		valid_num_bin_qp_delta_r				;	//valid number bin of qp_delta
reg		[2:0]		valid_num_bin_qp_delta_pre_r			;	//valid number bin of qp_delta prefix
reg		[3:0]		valid_num_bin_qp_delta_suf_r			;	//valid number bin of qp_delta suffix
reg		[1:0]		qp_delta_pre_cyc_tot_r					;	//prefix cycle total
reg		[2:0]		qp_delta_suf_cyc_tot_r					;	//suffix cycle total
reg		[2:0]		qp_delta_cyc_tot_r						;	//total cycle
reg		[2:0]		qp_delta_cyc_cnt_r						;	//total cycle count
reg		[15:0]		bin_string_qp_delta_r					;	//bin string of qp_delta


reg		[5:0]		cu_qp_r									;	//current cu qp
reg		[5:0]		cu_qp_left_r							;	//left cu qp
reg		[5:0]		cu_qp_top_r								;	//top cu qp
reg		[5:0]		cu_qp_last_r							;	//last cu qp
reg		[5:0]		ref_qp_r								;	//reference cu qp
reg	signed [5:0]	qp_delta_r								;	//qp delta
reg		[5:0]		qp_delta_abs_r							;	//qp delta abs
wire	[5:0]		qp_delta_abs_m5_w						;	//qp delta abs minus 5
reg		[2:0]		tu_value_r								;	//min(qp_delta_abs_r, 5)
reg					qp_suffix_r								;	//suffix flag
wire				qp_delta_sign_w							;	//qp delta sign


wire	[5:0]		qp_delta_abs_m5m1_w						;
wire	[5:0]		qp_delta_abs_m5m3_w						;
wire	[5:0]		qp_delta_abs_m5m7_w						;
wire	[5:0]		qp_delta_abs_m5m15_w					;





// ******************************************************
// transform_skip
wire	[10:0]		ctx_pair_transform_skip_w			;	//context pair of transform_skip
wire	[7:0]		ctx_idx_transform_skip_w			;	//context index of transform_skip  




// *******************************************************
// last_significant_xy
wire	[10:0]		ctx_pair_last_x_prefix_0_w			;	//context pair of last x prefix
wire	[10:0]		ctx_pair_last_x_prefix_1_w			;	//context pair of last x prefix
wire	[10:0]		ctx_pair_last_x_prefix_2_w			;	//context pair of last x prefix
wire	[10:0]		ctx_pair_last_x_prefix_3_w			;	//context pair of last x prefix
wire	[10:0]		ctx_pair_last_x_prefix_4_w			;	//context pair of last x prefix
wire	[10:0]		ctx_pair_last_x_prefix_5_w			;	//context pair of last x prefix
wire	[10:0]		ctx_pair_last_x_prefix_6_w			;	//context pair of last x prefix
wire	[10:0]		ctx_pair_last_x_prefix_7_w			;	//context pair of last x prefix
wire	[10:0]		ctx_pair_last_x_prefix_8_w			;	//context pair of last x prefix
wire	[10:0]		ctx_pair_last_x_prefix_9_w			;	//context pair of last x prefix

wire	[10:0]		ctx_pair_last_x_suffix_0_w			;	//context pair of last x suffix
wire	[10:0]		ctx_pair_last_x_suffix_1_w			;	//context pair of last x suffix
wire	[10:0]		ctx_pair_last_x_suffix_2_w			;	//context pair of last x suffix


wire	[10:0]		ctx_pair_last_y_prefix_0_w			;	//context pair of last y prefix
wire	[10:0]		ctx_pair_last_y_prefix_1_w			;	//context pair of last y prefix
wire	[10:0]		ctx_pair_last_y_prefix_2_w			;	//context pair of last y prefix
wire	[10:0]		ctx_pair_last_y_prefix_3_w			;	//context pair of last y prefix
wire	[10:0]		ctx_pair_last_y_prefix_4_w			;	//context pair of last y prefix
wire	[10:0]		ctx_pair_last_y_prefix_5_w			;	//context pair of last y prefix
wire	[10:0]		ctx_pair_last_y_prefix_6_w			;	//context pair of last y prefix
wire	[10:0]		ctx_pair_last_y_prefix_7_w			;	//context pair of last y prefix
wire	[10:0]		ctx_pair_last_y_prefix_8_w			;	//context pair of last y prefix
wire	[10:0]		ctx_pair_last_y_prefix_9_w			;	//context pair of last y prefix
                               
wire	[10:0]		ctx_pair_last_y_suffix_0_w			;	//context pair of last y suffix
wire	[10:0]		ctx_pair_last_y_suffix_1_w			;	//context pair of last y suffix
wire	[10:0]		ctx_pair_last_y_suffix_2_w			;	//context pair of last y suffix

reg		[9:0]		bin_string_last_x_prefix_r			;	//bin string of last x prefix	
reg		[9:0]		bin_string_last_y_prefix_r			;	//bin string of last y prefix
reg		[2:0]		bin_string_last_x_suffix_r			;	//bin string of last x suffix
reg		[2:0]		bin_string_last_y_suffix_r			;	//bin string of last y prefix

wire	[3:0]		valid_num_bin_last_x_prefix_w		;	//valid number of bin of last x prefix
wire	[3:0]		valid_num_bin_last_y_prefix_w		;	//valid number of bin of last y prefix
reg		[1:0]		valid_num_bin_last_x_suffix_r		;	//valid number of bin of last x suffix
reg		[1:0]		valid_num_bin_last_y_suffix_r		;	//valid number of bin of last y suffix



reg		[7:0]		ctx_idx_last_x_prefix_0_r			;	//context index of last x prefix
reg		[7:0]		ctx_idx_last_x_prefix_1_r			;	//context index of last x prefix
reg		[7:0]		ctx_idx_last_x_prefix_2_r			;	//context index of last x prefix
reg		[7:0]		ctx_idx_last_x_prefix_3_r			;	//context index of last x prefix
reg		[7:0]		ctx_idx_last_x_prefix_4_r			;	//context index of last x prefix
reg		[7:0]		ctx_idx_last_x_prefix_5_r			;	//context index of last x prefix
reg		[7:0]		ctx_idx_last_x_prefix_6_r			;	//context index of last x prefix
reg		[7:0]		ctx_idx_last_x_prefix_7_r			;	//context index of last x prefix
reg		[7:0]		ctx_idx_last_x_prefix_8_r			;	//context index of last x prefix
reg		[7:0]		ctx_idx_last_x_prefix_9_r			;	//context index of last x prefix

reg		[7:0]		ctx_idx_last_y_prefix_0_r			;	//context index of last y prefix
reg		[7:0]		ctx_idx_last_y_prefix_1_r			;	//context index of last y prefix
reg		[7:0]		ctx_idx_last_y_prefix_2_r			;	//context index of last y prefix
reg		[7:0]		ctx_idx_last_y_prefix_3_r			;	//context index of last y prefix
reg		[7:0]		ctx_idx_last_y_prefix_4_r			;	//context index of last y prefix
reg		[7:0]		ctx_idx_last_y_prefix_5_r			;	//context index of last y prefix
reg		[7:0]		ctx_idx_last_y_prefix_6_r			;	//context index of last y prefix
reg		[7:0]		ctx_idx_last_y_prefix_7_r			;	//context index of last y prefix
reg		[7:0]		ctx_idx_last_y_prefix_8_r			;	//context index of last y prefix
reg		[7:0]		ctx_idx_last_y_prefix_9_r			;	//context index of last y prefix

reg					last_sig_enc_done_r					;	//last sig encode done flag, next cycle is TU_BLK_IDLE
reg		[3:0]		last_x_prefix_cyc_tot_r				;	
reg		[3:0]		last_y_prefix_cyc_tot_r				;	
reg					last_x_suffix_cyc_tot_r				;	
reg					last_y_suffix_cyc_tot_r				;
wire	[3:0]		last_xy_cyc_tot_w					;
reg		[2:0]		last_xy_cyc_cnt_r					;
reg		[2:0]		last_xy_r							;	//00: last_x_prefix, 01: last_y_prefix
															//10: last_x_suffix, 11: last_y_suffix

reg		[4:0]		pos_x_base_r						;	//group index base of x
reg		[4:0]		pos_y_base_r						;	//group index base of y
reg		[3:0]		pos_x_inc_r							;	//group index increament of x
reg		[3:0]		pos_y_inc_r							;	//group index increament of y	
wire	[4:0]		pos_x_w								;	//last coefficient x position
wire	[4:0]		pos_y_w								;	//last coefficient y position
reg		[2:0]		pos_x_mar_r							;	//pos_x_w-min_in_group[group_idx_x]
reg		[2:0]		pos_y_mar_r							;	//pos_y_w-min_in_group[group_idx_y]
reg		[3:0]		group_idx_x_r						;	//group index of x
reg		[3:0]		group_idx_y_r						;	//group index of y
reg					group_idx_x_1_r						;	//group_idx_x_r < group_idx[width]?
reg					group_idx_y_1_r						;	//group_idx_y_r < group_idx[height]?
wire	[255:0]		last_blk_res_r						;	//last blk residual flow the scan index, 
															//to find the last coeff position

// *********************************************************
// sub_blk_sig_flag
wire	[10:0]		ctx_pair_sub_blk_sig_w					;	//context pair of sub block sig flag
wire				bin_string_sub_blk_sig_r				;	//bin of sub block sig flag
reg		[7:0]		ctx_idx_sub_blk_sig_r					;	//context index of sub block sig flag
reg					valid_num_bin_sub_blk_sig_r				;	//valid number of bin of sub block sig flag
reg		[1:0]		ctx_sub_blk_sig_r						;	//cbf_right | cbf_lower



// **********************************************************
// sig_flag
reg		[10:0]		ctx_pair_sig_flag_0_r					;	//context pair of sig flag 0, final data
reg		[10:0]		ctx_pair_sig_flag_1_r					;	//context pair of sig flag 1
reg		[10:0]		ctx_pair_sig_flag_2_r					;	//context pair of sig flag 2
reg		[10:0]		ctx_pair_sig_flag_3_r					;	//context pair of sig flag 3
reg		[10:0]		ctx_pair_sig_flag_4_r					;	//context pair of sig flag 4
reg		[10:0]		ctx_pair_sig_flag_5_r					;	//context pair of sig flag 5
reg		[10:0]		ctx_pair_sig_flag_6_r					;	//context pair of sig flag 6
reg		[10:0]		ctx_pair_sig_flag_7_r					;	//context pair of sig flag 7
reg		[10:0]		ctx_pair_sig_flag_8_r					;	//context pair of sig flag 8
reg		[10:0]		ctx_pair_sig_flag_9_r					;	//context pair of sig flag 9
reg		[10:0]		ctx_pair_sig_flag_10_r					;	//context pair of sig flag 10
reg		[10:0]		ctx_pair_sig_flag_11_r					;	//context pair of sig flag 11
reg		[10:0]		ctx_pair_sig_flag_12_r					;	//context pair of sig flag 12
reg		[10:0]		ctx_pair_sig_flag_13_r					;	//context pair of sig flag 13
reg		[10:0]		ctx_pair_sig_flag_14_r					;	//context pair of sig flag 14
reg		[10:0]		ctx_pair_sig_flag_15_r					;	//context pair of sig flag 15

wire	[10:0]		ctx_pair_sig_flag_0_w					;	//context pair of sig flag 0
wire	[10:0]		ctx_pair_sig_flag_1_w					;	//context pair of sig flag 1
wire	[10:0]		ctx_pair_sig_flag_2_w					;	//context pair of sig flag 2
wire	[10:0]		ctx_pair_sig_flag_3_w					;	//context pair of sig flag 3
wire	[10:0]		ctx_pair_sig_flag_4_w					;	//context pair of sig flag 4
wire	[10:0]		ctx_pair_sig_flag_5_w					;	//context pair of sig flag 5
wire	[10:0]		ctx_pair_sig_flag_6_w					;	//context pair of sig flag 6
wire	[10:0]		ctx_pair_sig_flag_7_w					;	//context pair of sig flag 7
wire	[10:0]		ctx_pair_sig_flag_8_w					;	//context pair of sig flag 8
wire	[10:0]		ctx_pair_sig_flag_9_w					;	//context pair of sig flag 9
wire	[10:0]		ctx_pair_sig_flag_10_w					;	//context pair of sig flag 10
wire	[10:0]		ctx_pair_sig_flag_11_w					;	//context pair of sig flag 11
wire	[10:0]		ctx_pair_sig_flag_12_w					;	//context pair of sig flag 12
wire	[10:0]		ctx_pair_sig_flag_13_w					;	//context pair of sig flag 13
wire	[10:0]		ctx_pair_sig_flag_14_w					;	//context pair of sig flag 14
wire	[10:0]		ctx_pair_sig_flag_15_w					;	//context pair of sig flag 15

reg		[15:0]		bin_string_sig_flag_r					;	//bin string of sig flag
reg		[4:0]		valid_num_bin_sig_flag_r				;	//valid number bin of sig flag


reg		[7:0]		ctx_idx_sig_flag_0_r					;	//context index of sig flag 0
reg		[7:0]		ctx_idx_sig_flag_1_r					;	//context index of sig flag 1
reg		[7:0]		ctx_idx_sig_flag_2_r					;	//context index of sig flag 2
reg		[7:0]		ctx_idx_sig_flag_3_r					;	//context index of sig flag 3
reg		[7:0]		ctx_idx_sig_flag_4_r					;	//context index of sig flag 4
reg		[7:0]		ctx_idx_sig_flag_5_r					;	//context index of sig flag 5
reg		[7:0]		ctx_idx_sig_flag_6_r					;	//context index of sig flag 6
reg		[7:0]		ctx_idx_sig_flag_7_r					;	//context index of sig flag 7
reg		[7:0]		ctx_idx_sig_flag_8_r					;	//context index of sig flag 8
reg		[7:0]		ctx_idx_sig_flag_9_r					;	//context index of sig flag 9
reg		[7:0]		ctx_idx_sig_flag_10_r					;	//context index of sig flag 10
reg		[7:0]		ctx_idx_sig_flag_11_r					;	//context index of sig flag 11
reg		[7:0]		ctx_idx_sig_flag_12_r					;	//context index of sig flag 12
reg		[7:0]		ctx_idx_sig_flag_13_r					;	//context index of sig flag 13
reg		[7:0]		ctx_idx_sig_flag_14_r					;	//context index of sig flag 14
reg		[7:0]		ctx_idx_sig_flag_15_r					;	//context index of sig flag 15	








// **********************************************************
// ge12
wire	[10:0]		ctx_pair_ge12_0_w						;	//context pair of coefficient ge12
wire	[10:0]		ctx_pair_ge12_1_w						;	//context pair of coefficient ge12
wire	[10:0]		ctx_pair_ge12_2_w						;	//context pair of coefficient ge12
wire	[10:0]		ctx_pair_ge12_3_w						;	//context pair of coefficient ge12
wire	[10:0]		ctx_pair_ge12_4_w						;	//context pair of coefficient ge12
wire	[10:0]		ctx_pair_ge12_5_w						;	//context pair of coefficient ge12
wire	[10:0]		ctx_pair_ge12_6_w						;	//context pair of coefficient ge12
wire	[10:0]		ctx_pair_ge12_7_w						;	//context pair of coefficient ge12
wire	[10:0]		ctx_pair_ge12_8_w						;	//context pair of coefficient ge12

reg		[8:0]		bin_string_ge12_r						;	//bin string of coefficients ge12
wire	[3:0]		valid_num_bin_ge12_r					;	//valid number of coefficients ge12

reg		[7:0]		ctx_idx_ge12_0_r						;	//context index of coefficient ge12
reg		[7:0]		ctx_idx_ge12_1_r						;	//context index of coefficient ge12
reg		[7:0]		ctx_idx_ge12_2_r						;	//context index of coefficient ge12
reg		[7:0]		ctx_idx_ge12_3_r						;	//context index of coefficient ge12
reg		[7:0]		ctx_idx_ge12_4_r						;	//context index of coefficient ge12
reg		[7:0]		ctx_idx_ge12_5_r						;	//context index of coefficient ge12
reg		[7:0]		ctx_idx_ge12_6_r						;	//context index of coefficient ge12
reg		[7:0]		ctx_idx_ge12_7_r						;	//context index of coefficient ge12
reg		[7:0]		ctx_idx_ge12_8_r						;	//context index of coefficient ge12

reg					coeff_ge1_r								;	//some coefficients greater 1
reg					coeff_ge2_r								;	//some coefficients greater 2
reg		[1:0]		i_ctx_set_r								;	//i_ctx_set_r	



// *********************************************************
// coefficient signs
wire	[10:0]		ctx_pair_sign_0_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_1_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_2_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_3_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_4_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_5_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_6_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_7_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_8_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_9_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_10_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_11_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_12_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_13_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_14_w						;	//context pair of coefficient sign
wire	[10:0]		ctx_pair_sign_15_w						;	//context pair of coefficient sign

wire	[4:0]		valid_num_bin_sign_r					;	//valid number of sign bin
wire	[15:0]		bin_string_sign_flag_r					;	//bin string of sign



// **********************************************************
// coefficient remains
wire	[10:0]		ctx_pair_remain_0_w						;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_1_w						;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_2_w						;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_3_w						;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_4_w						;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_5_w						;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_6_w						;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_7_w						;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_8_w						;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_9_w						;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_10_w					;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_11_w					;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_12_w					;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_13_w					;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_14_w					;	//ctx_pair_remain_0_w
wire	[10:0]		ctx_pair_remain_15_w					;	//ctx_pair_remain_0_w

reg		[4:0]		valid_num_remain_r						;	//valid_num_remain_r
reg		[15:0]		bin_string_remain_r						;	//bin string of remains
reg		[31:0]		bin_string_remain_all_r					;	//bin string of remain all bins
reg		[4:0]		valid_num_remain_all_r					;	//valid num of remain all bins

reg		[3:0]		first_non_one_coeff_idx_r				;	//first greater-one coeff_abs

reg		[1:0]		base_level_r							;	//base_level_r
reg		[2:0]		i_go_rice_param_r						;	//i_go_rice_param_r

reg		[15:0]		encoding_coeff_abs_r					;	//coefficient abs 
reg		[15:0]		encoding_coeff_abs_remain_r				;	//coefficient abs remain


reg		[1:0]		scan_idx_r								;	//scan mode, 0: SCAN_DIAG, 1: SCAN_HOR, 2: SCAN_VER;
                                            				
wire	[63:0]		tu_cbf_z2s_luma32x32_w					;	//zcan-to-scan mode cbf, scan mode based on intra mode
wire	[15:0]		tu_cbf_z2s_luma16x16_w					;	
reg		[3:0]		tu_cbf_z2s_luma8x8_r					;
                                                			
wire	[63:0]		tu_cbf_z2s_luma32x32_rer_w				;	//righter
wire	[15:0]		tu_cbf_z2s_luma16x16_rer_w				;	//righter
reg		[3:0]		tu_cbf_z2s_luma8x8_rer_r				;	//righter
wire	[63:0]		tu_cbf_z2s_luma32x32_ler_w				;	//lower
wire	[15:0]		tu_cbf_z2s_luma16x16_ler_w				;	//lower
reg		[3:0]		tu_cbf_z2s_luma8x8_ler_r				;	//lower
                                                			
wire	[15:0]		tu_cbf_z2s_cr16x16_w					;	//zcan-to-scan mode cbf, scan mode based on intra mode
wire	[3:0]		tu_cbf_z2s_cr8x8_w						;	
wire				tu_cbf_z2s_cr4x4_w						;
                                                			
wire	[15:0]		tu_cbf_z2s_cr16x16_rer_w				;	//righter
wire	[3:0]		tu_cbf_z2s_cr8x8_rer_w					;	//righter
wire				tu_cbf_z2s_cr4x4_rer_w					;	//righter
wire	[15:0]		tu_cbf_z2s_cr16x16_ler_w				;	//lower
wire	[3:0]		tu_cbf_z2s_cr8x8_ler_w					;	//lower
wire				tu_cbf_z2s_cr4x4_ler_w					;	//lower
                                                			
wire	[15:0]		tu_cbf_z2s_cb16x16_w					;	//zcan-to-scan mode cbf, scan mode based on intra mode
wire	[3:0]		tu_cbf_z2s_cb8x8_w						;	
wire				tu_cbf_z2s_cb4x4_w						;
                                                			
wire	[15:0]		tu_cbf_z2s_cb16x16_rer_w				;	//righter
wire	[3:0]		tu_cbf_z2s_cb8x8_rer_w					;	//righter
wire				tu_cbf_z2s_cb4x4_rer_w					;	//righter
wire	[15:0]		tu_cbf_z2s_cb16x16_ler_w				;	//lower
wire	[3:0]		tu_cbf_z2s_cb8x8_ler_w					;	//lower
wire				tu_cbf_z2s_cb4x4_ler_w					;	//lower
                                                			
reg		[5:0]		last_cbf_idx_r							;	//last non_zero cbf idx
                                            				
reg 	[7:0]		last_cbf_0_r							; 	//cbf split into sub
reg 	[7:0]		last_cbf_1_r							; 	//cbf split into sub
reg 	[7:0]		last_cbf_2_r							; 	//cbf split into sub
reg 	[7:0]		last_cbf_3_r							; 	//cbf split into sub
reg 	[7:0]		last_cbf_4_r							; 	//cbf split into sub
reg 	[7:0]		last_cbf_5_r							; 	//cbf split into sub
reg 	[7:0]		last_cbf_6_r							; 	//cbf split into sub
reg 	[7:0]		last_cbf_7_r							; 	//cbf split into sub
                                            				
reg		[5:0]		last_blk_idx_0_r						;	//last non zero block idx in sub
reg		[5:0]		last_blk_idx_1_r						;	//last non zero block idx in sub
reg		[5:0]		last_blk_idx_2_r						;	//last non zero block idx in sub
reg		[5:0]		last_blk_idx_3_r						;	//last non zero block idx in sub
reg		[5:0]		last_blk_idx_4_r						;	//last non zero block idx in sub
reg		[5:0]		last_blk_idx_5_r						;	//last non zero block idx in sub
reg		[5:0]		last_blk_idx_6_r						;	//last non zero block idx in sub
reg		[5:0]		last_blk_idx_7_r						;	//last non zero block idx in sub
reg		[5:0]		last_blk_idx_r							;	//last non zero block idx
                                            				
reg		[1:0]		tu_width_flag_r							;	//0: 32, 1: 16, 2: 8, 3: 4
                                                			







//read & encode
reg		[4:0]		rd_non_zero_num_r						;	//read non_zero number
reg		[4:0]		enc_coeff_tot_r							;	//encode non_zero_number

reg		[3:0]		rd_res_idx_r			[15:0]			;	//non-zero residual data index when Scanning
reg		[3:0]		enc_res_idx_r			[15:0]			;	//non-zero residual data index when encoding

reg		[255:0]		scan_res_data_r							;	//residual data when scaning
reg		[15:0]		enc_res_data_r			[15:0]			;	//residual data when encoding

wire	[15:0]		enc_non_zero_0_w						;	//non_zero_coefficient 0
wire	[15:0]		enc_non_zero_1_w						;	//non_zero_coefficient 1
wire	[15:0]		enc_non_zero_2_w						;	//non_zero_coefficient 2
wire	[15:0]		enc_non_zero_3_w						;	//non_zero_coefficient 3
wire	[15:0]		enc_non_zero_4_w						;	//non_zero_coefficient 4
wire	[15:0]		enc_non_zero_5_w						;	//non_zero_coefficient 5
wire	[15:0]		enc_non_zero_6_w						;	//non_zero_coefficient 6
wire	[15:0]		enc_non_zero_7_w						;	//non_zero_coefficient 7
wire	[15:0]		enc_non_zero_8_w						;	//non_zero_coefficient 8
wire	[15:0]		enc_non_zero_9_w						;	//non_zero_coefficient 9
wire	[15:0]		enc_non_zero_10_w						;	//non_zero_coefficient 10
wire	[15:0]		enc_non_zero_11_w						;	//non_zero_coefficient 11
wire	[15:0]		enc_non_zero_12_w						;	//non_zero_coefficient 12
wire	[15:0]		enc_non_zero_13_w						;	//non_zero_coefficient 13
wire	[15:0]		enc_non_zero_14_w						;	//non_zero_coefficient 14
wire	[15:0]		enc_non_zero_15_w						;	//non_zero_coefficient 15

wire	[15:0]		enc_non_zero_abs_0_r					;	//non_zero_coefficient 0
wire	[15:0]		enc_non_zero_abs_1_r					;	//non_zero_coefficient 1
wire	[15:0]		enc_non_zero_abs_2_r					;	//non_zero_coefficient 2
wire	[15:0]		enc_non_zero_abs_3_r					;	//non_zero_coefficient 3
wire	[15:0]		enc_non_zero_abs_4_r					;	//non_zero_coefficient 4
wire	[15:0]		enc_non_zero_abs_5_r					;	//non_zero_coefficient 5
wire	[15:0]		enc_non_zero_abs_6_r					;	//non_zero_coefficient 6
wire	[15:0]		enc_non_zero_abs_7_r					;	//non_zero_coefficient 7
wire	[15:0]		enc_non_zero_abs_8_r					;	//non_zero_coefficient 8
wire	[15:0]		enc_non_zero_abs_9_r					;	//non_zero_coefficient 9
wire	[15:0]		enc_non_zero_abs_10_r					;	//non_zero_coefficient 10
wire	[15:0]		enc_non_zero_abs_11_r					;	//non_zero_coefficient 11
wire	[15:0]		enc_non_zero_abs_12_r					;	//non_zero_coefficient 12
wire	[15:0]		enc_non_zero_abs_13_r					;	//non_zero_coefficient 13
wire	[15:0]		enc_non_zero_abs_14_r					;	//non_zero_coefficient 14
wire	[15:0]		enc_non_zero_abs_15_r					;	//non_zero_coefficient 15     

wire				enc_non_zero_abs_0_ge1_r				;	//non_zero_coefficient 0 > 1
wire				enc_non_zero_abs_1_ge1_r				;	//non_zero_coefficient 1 > 1
wire				enc_non_zero_abs_2_ge1_r				;	//non_zero_coefficient 2 > 1
wire				enc_non_zero_abs_3_ge1_r				;	//non_zero_coefficient 3 > 1
wire				enc_non_zero_abs_4_ge1_r				;	//non_zero_coefficient 4 > 1
wire				enc_non_zero_abs_5_ge1_r				;	//non_zero_coefficient 5 > 1
wire				enc_non_zero_abs_6_ge1_r				;	//non_zero_coefficient 6 > 1
wire				enc_non_zero_abs_7_ge1_r				;	//non_zero_coefficient 7 > 1

wire				enc_non_zero_abs_0_ge2_r				;	//non_zero_coefficient 0 > 2
wire				enc_non_zero_abs_1_ge2_r				;	//non_zero_coefficient 1 > 2
wire				enc_non_zero_abs_2_ge2_r				;	//non_zero_coefficient 2 > 2
wire				enc_non_zero_abs_3_ge2_r				;	//non_zero_coefficient 3 > 2
wire				enc_non_zero_abs_4_ge2_r				;	//non_zero_coefficient 4 > 2
wire				enc_non_zero_abs_5_ge2_r				;	//non_zero_coefficient 5 > 2
wire				enc_non_zero_abs_6_ge2_r				;	//non_zero_coefficient 6 > 2
wire				enc_non_zero_abs_7_ge2_r				;	//non_zero_coefficient 7 > 2

reg		[15:0]		coeff_a_r								;	//coeff_a_r
reg		[15:0]		coeff_b_r								;	//coeff_b_r
reg		[1:0]		coeff_a_b_r								;	//00: coeff_a_r==0, coeff_b_r==0;
																//01: coeff_a_r==0, coeff_b_r!=0;													//10: coeff_a_r!=0, coeff_b_r==0;
																//11: coeff_a_r!=0, coeff_b_r!=0;												//10: coeff_a_r!=0, coeff_b_r==0;
reg					rd_last_find_flag_r						;	//find the last non_zero coefficient																//11: coeff_a_r!=0, coeff_b_r!=0;
reg		[3:0]		rd_last_coeff_idx_r						;	//last non-zero coefficient index
reg		[3:0]		enc_last_coeff_idx_r					;	//last non-zero coefficient index

wire	[15:0]		rd_coeff_sig_w							;	//rd 16 sig of coefficients
reg		[15:0]		enc_coeff_sig_r							;	//enc 16 sig of coefficients

reg		[1:0]		enc_pattern_sig_ctx_r					;	//sig_right + (sig_lower<<1)	
reg					sig_right_blk_r							;	//sig_right
reg					sig_lower_blk_r							;	//sig_lower
























//cbf!=0 flag
assign	cbf_ne_zero_flag_w 		  = (cu_luma_cbf_r!='d0 || cu_cr_cbf_r!='d0 || cu_cb_cbf_r!='d0); 
assign	cbf_chroma_ne_zero_flag_w = (cu_cr_cbf_r!='d0 || cu_cb_cbf_r!='d0);

//tu_en_w
assign	tu_en_w = (res_curr_state_r==RESIDUAL_LUMA_COEFF 
				|| res_curr_state_r==RESIDUAL_CR_COEFF 
				|| res_curr_state_r==RESIDUAL_CB_COEFF);


wire	[8:0]		base_01_w				;
wire	[8:0]		base_02_w				;
wire	[8:0]		base_03_w				;
wire	[8:0]		base_04_w				;
wire	[8:0]		base_11_w				;
wire	[8:0]		base_12_w				;
wire	[8:0]		base_13_w				;
wire	[8:0]		base_14_w				;	

wire	[8:0]		base_chroma_w			;
wire	[8:0]		base_cr_w				;
wire	[8:0]		base_cb_w				;	
wire	[8:0]		base_21_w				;
wire	[8:0]		base_22_w				;
wire	[8:0]		base_23_w				;
wire	[8:0]		base_24_w				;


assign	base_01_w = tu_cnt_r;
assign 	base_02_w = cu_idx_minus1_i;
assign	base_03_w = cu_idx_minus5_i;  
assign	base_04_w = cu_idx_minus21_i;
assign	base_11_w = base_01_w << 6;
assign	base_12_w = base_02_w << 6;
assign	base_13_w = base_03_w << 4;
assign	base_14_w = base_04_w << 2;
assign	base_chroma_w = rd_blk_map_r;
assign	base_cr_w = base_chroma_w + 'd256;
assign	base_cb_w = base_chroma_w + 'd320;
assign	base_21_w = base_01_w << 4;
assign	base_22_w = base_02_w << 4;
assign	base_23_w = base_03_w << 2;
assign	base_24_w = base_04_w ;




//addr_coeff_o
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		addr_coeff_o <= 'd0;
	else if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0:	addr_coeff_o <= rd_blk_map_r + base_11_w;
			'd1:	addr_coeff_o <= rd_blk_map_r + base_12_w;
			'd2:	addr_coeff_o <= rd_blk_map_r + base_13_w;
			'd3:	addr_coeff_o <= rd_blk_map_r + base_14_w;
			default:addr_coeff_o <= 'd0;
		endcase
	end
	else if(res_curr_state_r==RESIDUAL_CR_COEFF) begin
		case(cu_depth_i)
			'd0:	addr_coeff_o <= base_cr_w + base_21_w;
			'd1:    addr_coeff_o <= base_cr_w + base_22_w;
			'd2:    addr_coeff_o <= base_cr_w + base_23_w;
			'd3:    addr_coeff_o <= base_cr_w + base_24_w;
			default:addr_coeff_o <= 'd0;
		endcase
	end
	else if(res_curr_state_r==RESIDUAL_CB_COEFF) begin
		case(cu_depth_i)
			'd0:	addr_coeff_o <= base_cb_w + base_21_w;
			'd1:    addr_coeff_o <= base_cb_w + base_22_w;
			'd2:    addr_coeff_o <= base_cb_w + base_23_w;
			'd3:    addr_coeff_o <= base_cb_w + base_24_w;
			default:addr_coeff_o <= 'd0;
		endcase
	end
	else begin
		addr_coeff_o <= 'd0;
	end
end

//rd_en_coeff_o
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		rd_en_coeff_o <= 'd0;
	else if(blk_e_done_r || tu_curr_state_r==TU_LAST_SIG_05)
		rd_en_coeff_o <= 'd1;
	else
		rd_en_coeff_o <= 'd0;
end









	


//state machine
//res_curr_state_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		res_curr_state_r <= RESIDUAL_IDLE;
	else 
		res_curr_state_r <= res_next_state_r;
end


//res_next_state_r
always @* begin
	if(~residual_en_i)
		res_next_state_r = RESIDUAL_IDLE;
	else begin
		case(res_curr_state_r)
			RESIDUAL_IDLE:				begin
											if(slice_type_i==(`SLICE_TYPE_P))
												res_next_state_r = RESIDUAL_ROOT_CBF;
											else if(cu_depth_i!='d0) 
												res_next_state_r = RESIDUAL_SUB_DIV;
											else if(cbf_chroma_ne_zero_flag_w)
												res_next_state_r = RESIDUAL_CHROMA_CBF_ROOT;
											else 
												res_next_state_r = RESIDUAL_SUB_DIV;	
			end                     	
								    	
			RESIDUAL_ROOT_CBF:			begin
											if(~cbf_ne_zero_flag_w)   
												res_next_state_r = RESIDUAL_END;
											else if(cu_depth_i!='d0) 
												res_next_state_r = RESIDUAL_SUB_DIV;												
											else if(cbf_chroma_ne_zero_flag_w)
												res_next_state_r = RESIDUAL_CHROMA_CBF_ROOT;
											else
												res_next_state_r = RESIDUAL_SUB_DIV;
			end                     	
						            	
			RESIDUAL_CHROMA_CBF_ROOT:	begin
											if(cu_depth_i=='d0)
												res_next_state_r = RESIDUAL_SUB_DIV;
											else if(slice_type_i==(`SLICE_TYPE_P) && cu_depth_i!='d0 && 
												    cu_cr_cbf_r=='d0 && cu_cb_cbf_r=='d0 && tu_cnt_r=='d0)
												res_next_state_r = RESIDUAL_DQP;
											else 
												res_next_state_r = RESIDUAL_LUMA_CBF;
			end
						
			RESIDUAL_SUB_DIV:			begin
											if((cu_depth_i!='d0))
												res_next_state_r = RESIDUAL_CHROMA_CBF_ROOT;
											else if(cu_depth_i=='d0 &&
													(cu_cr_cbf_r!='d0 || cu_cb_cbf_r!='d0))
												res_next_state_r = RESIDUAL_CHROMA_CBF;
											else if((slice_type_i==(`SLICE_TYPE_I)) ||
													(cu_depth_i=='d0) ||
													(cbf_chroma_ne_zero_flag_w))
												res_next_state_r = RESIDUAL_LUMA_CBF;
											else if(cbf_ne_zero_flag_w && tu_cnt_r=='d0)
 												res_next_state_r = RESIDUAL_DQP;
											else if(cu_luma_cbf_r[tu_cnt_r])
												res_next_state_r = RESIDUAL_LUMA_COEFF;
											else if(cu_cr_cbf_r[tu_cnt_r])
												res_next_state_r = RESIDUAL_CR_COEFF;
											else if(cu_cb_cbf_r[tu_cnt_r])
												res_next_state_r = RESIDUAL_CB_COEFF;
											else
												res_next_state_r = RESIDUAL_END;
			end
								
			RESIDUAL_CHROMA_CBF:		begin
											if((slice_type_i==(`SLICE_TYPE_I)) ||
											   (cu_depth_i=='d0) ||
											   (cbf_chroma_ne_zero_flag_w))
												res_next_state_r = RESIDUAL_LUMA_CBF;
											else if(cbf_ne_zero_flag_w && tu_cnt_r=='d0)
												res_next_state_r = RESIDUAL_DQP;
											else if(cu_luma_cbf_r[tu_cnt_r])
												res_next_state_r = RESIDUAL_LUMA_COEFF;
											else if(cu_cr_cbf_r[tu_cnt_r])
												res_next_state_r = RESIDUAL_CR_COEFF;
											else if(cu_cb_cbf_r[tu_cnt_r])
												res_next_state_r = RESIDUAL_CB_COEFF;
											else
												res_next_state_r = RESIDUAL_END;
			end
								
			RESIDUAL_LUMA_CBF:			begin
											if(cbf_ne_zero_flag_w && tu_cnt_r=='d0)
												res_next_state_r = RESIDUAL_DQP;
											else if(cu_luma_cbf_r[tu_cnt_r])
												res_next_state_r = RESIDUAL_LUMA_COEFF;
											else if(cu_cr_cbf_r[tu_cnt_r])
												res_next_state_r = RESIDUAL_CR_COEFF;
											else if(cu_cb_cbf_r[tu_cnt_r])
												res_next_state_r = RESIDUAL_CB_COEFF;
											else
												res_next_state_r = RESIDUAL_END;
			end
								
			RESIDUAL_DQP:				begin
											if(qp_done_r) begin
												if(cu_luma_cbf_r[tu_cnt_r])						
													res_next_state_r = RESIDUAL_LUMA_COEFF;
												else if(cu_cr_cbf_r[tu_cnt_r])
													res_next_state_r = RESIDUAL_CR_COEFF;
												else if(cu_cb_cbf_r[tu_cnt_r])
													res_next_state_r = RESIDUAL_CB_COEFF;
												else
													res_next_state_r = RESIDUAL_END;
											end
											else 
												res_next_state_r = res_curr_state_r;
			end
									
			RESIDUAL_LUMA_COEFF:		begin												 
											if(tu_done_r) begin
												if(cu_cr_cbf_r[tu_cnt_r])
													res_next_state_r = RESIDUAL_CR_COEFF;
												else if(cu_cb_cbf_r[tu_cnt_r])
													res_next_state_r = RESIDUAL_CB_COEFF;
												else
													res_next_state_r = RESIDUAL_END;
											end
											else 
												res_next_state_r = res_curr_state_r;
			end
			
			RESIDUAL_CR_COEFF:			begin												
											if(tu_done_r) begin
												if(cu_cb_cbf_r[tu_cnt_r])
													res_next_state_r = RESIDUAL_CB_COEFF;
												else
													res_next_state_r = RESIDUAL_END;
											end
											else 
												res_next_state_r = res_curr_state_r;
			end
			
			RESIDUAL_CB_COEFF:			begin												
											if(tu_done_r)
												res_next_state_r = RESIDUAL_END;
											else 
												res_next_state_r = res_curr_state_r;
			end
								
			RESIDUAL_END:				begin
											if(tu_cnt_r==tu_tot_r)
												res_next_state_r = RESIDUAL_IDLE;
											else 
												res_next_state_r = RESIDUAL_SUB_DIV;
			end							
			                        	
			default:					begin
											res_next_state_r = RESIDUAL_IDLE;
			end					
		endcase
	end
end



//tu_curr_state_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		tu_curr_state_r <= TU_IDLE;
	else 	
		tu_curr_state_r <= tu_next_state_r;
end

//tu_next_state_r
always @* begin
	if(~tu_en_w)
		tu_next_state_r = TU_IDLE;
	else begin
		case(tu_curr_state_r)
			TU_IDLE:			begin
									if(tu_en_w) begin
										if((res_curr_state_r==RESIDUAL_CR_COEFF || res_curr_state_r==RESIDUAL_CB_COEFF)
				                    		&& cu_depth_i==3)
				                    		tu_next_state_r = TU_SKIP_LAST_SIG;
				                    	else 
				                    		tu_next_state_r = TU_LAST_SIG_05;  	
				                    end
					                else 
					                	tu_next_state_r = tu_curr_state_r;			
			end
			
			TU_SKIP_LAST_SIG:	begin
									tu_next_state_r = TU_LAST_SIG_05;						
			end
			
			TU_LAST_SIG_05:		begin
									tu_next_state_r = TU_LAST_SIG_0;
			end
						
			TU_LAST_SIG_0:		begin
									if(rd_cyc_cnt_r=='d7)
										tu_next_state_r = TU_LAST_SIG;
									else
										tu_next_state_r = tu_curr_state_r;
			end			
						
			TU_LAST_SIG:		begin
									if(blk_e_done_r)
										tu_next_state_r = TU_BLK_IDLE;
									else 
										tu_next_state_r = tu_curr_state_r;
			end
			
			TU_BLK_IDLE:		begin
									if(enc_e_done_r)
										tu_next_state_r = tu_curr_state_r;
									else
										tu_next_state_r = TU_BLK_CBF;				
			end
							
			TU_BLK_CBF:			begin
									if(enc_bin_cbf_r || enc_blk_cnt_r==blk_tot_r)
										tu_next_state_r = TU_SIG_FLAG;
									else if(enc_done_w)
										tu_next_state_r = TU_END;
									else
										tu_next_state_r = TU_BLK_IDLE;
			end
							
			TU_SIG_FLAG:		begin
									if(enc_sig_cyc_cnt_r==enc_sig_cyc_tot_r)
										tu_next_state_r = TU_GE12;
									else 
										tu_next_state_r = tu_curr_state_r;
			end
							
			TU_GE12:			begin
									if(enc_ge12_cyc_cnt_r==enc_ge12_cyc_tot_r) begin
										tu_next_state_r = TU_RES_SIGN;
									end
									else 
										tu_next_state_r = tu_curr_state_r;										
			end
								
			TU_RES_SIGN:		begin
									if(enc_sign_done_w) begin
										if(coeff_ge1_r=='d1 || enc_coeff_tot_r>'d8)
											tu_next_state_r = TU_RES_REMAIN;
										else if(enc_done_w)
											tu_next_state_r = TU_END;
										else
											tu_next_state_r = TU_BLK_IDLE;
									end
									else
										tu_next_state_r = tu_curr_state_r;
			end
							
			TU_RES_REMAIN:		begin
									if(enc_remain_done_w) begin
										if(enc_done_w)
											tu_next_state_r = TU_END;
										else
											tu_next_state_r = TU_BLK_IDLE;
									end
									else 
										tu_next_state_r = tu_curr_state_r;
			end
							
			TU_END:				begin
									tu_next_state_r = TU_IDLE;
			end
								
			default:			begin
									tu_next_state_r = TU_IDLE;
			end		
		endcase
	end	
end








//tu_tot_r
always @* begin
	if(cu_depth_i=='d0)
		tu_tot_r = 'd3;
	else 
		tu_tot_r = 'd0;
end


//tu_cnt_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		tu_cnt_r <= 'd0;
	else if(res_curr_state_r==RESIDUAL_END) begin
		if(tu_cnt_r==tu_tot_r)
			tu_cnt_r <= 'd0;
		else 
			tu_cnt_r <= tu_cnt_r + 'd1;
	end
	else 
		tu_cnt_r <= tu_cnt_r;
end

//tu_done_r
always @* begin
	if(tu_curr_state_r==TU_END)
		tu_done_r = 'd1;
	else 
		tu_done_r = 'd0;
end

//rd_done_w
assign	rd_done_w = (rd_blk_cnt_r==blk_tot_r && blk_e_done_r=='d1) ? 1 : 0;
//enc_done_w
assign	enc_done_w = (enc_blk_cnt_r==blk_tot_r && enc_e_done_r=='d1) ? 1 : 0;


//rd_cyc_cnt_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		rd_cyc_cnt_r <= 'd0;
	else if(~tu_en_w)
		rd_cyc_cnt_r <= 'd0;
	else if(tu_curr_state_r==TU_LAST_SIG_05 || tu_done_r || blk_e_done_r)
		rd_cyc_cnt_r <= 'd0;
	else if(rd_cyc_cnt_r=='d7)
		rd_cyc_cnt_r <= rd_cyc_cnt_r;
	else
		rd_cyc_cnt_r <= rd_cyc_cnt_r + 'd1;
end

//scan_cyc_cnt_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		scan_cyc_cnt_r <= 'd0;
	else if(~tu_en_w)
		scan_cyc_cnt_r <= 'd0;
	else if(tu_curr_state_r==TU_LAST_SIG_0 || tu_done_r)
		scan_cyc_cnt_r <= 'd0;
	else if(~rd_bin_cbf_w)
		scan_cyc_cnt_r <= 'd0;
	else if(blk_e_done_r)
		scan_cyc_cnt_r <= 'd0;
	else if(scan_cyc_cnt_r=='d7 && (~blk_e_done_r))
		scan_cyc_cnt_r <= scan_cyc_cnt_r;
	else 
		scan_cyc_cnt_r <= scan_cyc_cnt_r + 'd1;
end

//rd_e_done_r
always @* begin
	if(~tu_en_w)
		rd_e_done_r = 'd0;
	else if(tu_curr_state_r==TU_IDLE || 
			tu_curr_state_r==TU_SKIP_LAST_SIG ||
			tu_curr_state_r==TU_LAST_SIG_05 ||
			tu_curr_state_r==TU_END)
		rd_e_done_r = 'd0;     
	else if(rd_cyc_cnt_r=='d7)      
		rd_e_done_r = 'd1;
	else if(scan_blk_cnt_r==blk_tot_r &&
			rd_blk_cnt_r=='d0 &&
			tu_curr_state_r!=TU_LAST_SIG_0)
		rd_e_done_r = 'd1;
	else 
		rd_e_done_r = 'd0;
end

//scan_e_done_r
always @* begin
	if(~tu_en_w)
		scan_e_done_r = 'd0;
	else if(tu_curr_state_r==TU_IDLE || 
			tu_curr_state_r==TU_SKIP_LAST_SIG ||
			tu_curr_state_r==TU_LAST_SIG_05 ||
//			tu_curr_state_r==TU_LAST_SIG_0 ||
			tu_curr_state_r==TU_END)
		scan_e_done_r = 'd0;  
	else if(tu_curr_state_r==TU_LAST_SIG_0 && rd_cyc_cnt_r=='d7)
		scan_e_done_r = 'd1;
	else if(~rd_bin_cbf_w || scan_cyc_cnt_r=='d7)
		scan_e_done_r = 'd1;
	else if(enc_blk_cnt_r==blk_tot_r &&
			scan_blk_cnt_r=='d0 &&
			tu_curr_state_r!=TU_LAST_SIG_0 &&
			tu_curr_state_r!=TU_LAST_SIG)
		scan_e_done_r = 'd1;
	else 
		scan_e_done_r = 'd0;   
end

reg		enc_e_done_0_r			;
reg		enc_e_done_1_r			;

//enc_e_done_0_r
always @* begin
	if(~tu_en_w)
		enc_e_done_0_r = 0;
	else if(tu_curr_state_r==TU_IDLE 
		 || tu_curr_state_r==TU_SKIP_LAST_SIG 
		 || tu_curr_state_r==TU_LAST_SIG_05
//		 || tu_curr_state_r==TU_LAST_SIG_0
		 || tu_curr_state_r==TU_END
		 || tu_curr_state_r==TU_BLK_IDLE)
		enc_e_done_0_r = 0;
	else if(tu_curr_state_r==TU_LAST_SIG_0 && rd_cyc_cnt_r=='d7)
		enc_e_done_0_r = 'd1;
	else if(~enc_bin_cbf_r && enc_blk_cnt_r!=blk_tot_r)
		enc_e_done_0_r = 1;
	else if((tu_curr_state_r==TU_LAST_SIG && last_sig_enc_done_r)
		|| (tu_curr_state_r==TU_RES_SIGN && enc_sign_done_w && (~(coeff_ge1_r=='d1 || enc_coeff_tot_r>'d8)))
		|| (tu_curr_state_r==TU_RES_REMAIN && enc_remain_done_w)) 
		enc_e_done_0_r = 1;
	else 
		enc_e_done_0_r = 0;
end

//enc_e_done_1_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		enc_e_done_1_r <= 'd0;
	else if(enc_e_done_r && ((~rd_e_done_r) || (~scan_e_done_r)))
		enc_e_done_1_r <= 'd1;
	else 
		enc_e_done_1_r <= 'd0;
end

//enc_e_done_r
always @* begin
	if(tu_en_w)
		enc_e_done_r = enc_e_done_0_r | enc_e_done_1_r;
	else
		enc_e_done_r = 'd0;
end





//blk_e_done_r
always @* begin
	if(rd_e_done_r && enc_e_done_r && scan_e_done_r)
		blk_e_done_r = 'd1;
	else
		blk_e_done_r = 'd0;
end

//rd_bin_cbf_w
assign	rd_bin_cbf_w = (scan_res_data_r=='d0) ? 'd0 : 'd1;

//enc_bin_cbf_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		enc_bin_cbf_r <= 'd0;
	else if(blk_e_done_r)
		enc_bin_cbf_r <= rd_bin_cbf_w;
	else 
		enc_bin_cbf_r <= enc_bin_cbf_r;
end




//residual_done_o
always @* begin
	if(residual_en_i)
		residual_done_o = residual_done_r;
	else
		residual_done_o = 'd0;
end

//residual_done_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		residual_done_r <= 'd0;
	else if(res_curr_state_r==RESIDUAL_END 
		&& tu_cnt_r==tu_tot_r)
		residual_done_r <= 'd1;
	else 
		residual_done_r <= 'd0;
end



//rd_blk_cnt_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		rd_blk_cnt_r <= 'd0;
	else if(tu_curr_state_r==TU_IDLE)
		rd_blk_cnt_r <= 'd0;
	else if(blk_e_done_r) begin
		if(rd_blk_cnt_r==blk_tot_r || scan_blk_cnt_r==blk_tot_r)
			rd_blk_cnt_r <= 'd0;
		else 
			rd_blk_cnt_r <= rd_blk_cnt_r + 'd1;   
	end
	else
		rd_blk_cnt_r <= rd_blk_cnt_r;
end

//scan_blk_cnt_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		scan_blk_cnt_r <= 'd0;
	else if(tu_curr_state_r==TU_IDLE)
		scan_blk_cnt_r <= 'd0;
	else if(blk_e_done_r) begin
		if(scan_blk_cnt_r==blk_tot_r)
			scan_blk_cnt_r <= 'd0;
		else
			scan_blk_cnt_r <= rd_blk_cnt_r;
	end
	else 
		scan_blk_cnt_r <= scan_blk_cnt_r;
end

//enc_blk_cnt_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		enc_blk_cnt_r <= 'd0;
	else if(tu_curr_state_r==TU_IDLE)
		enc_blk_cnt_r <= 'd0;
	else if(blk_e_done_r)
		enc_blk_cnt_r <= scan_blk_cnt_r;
	else
		enc_blk_cnt_r <= enc_blk_cnt_r;
end

//rd_blk_cnt_level_r
always @* begin
	if(~tu_en_w)
		rd_blk_cnt_level_r = 'd0;
	else if(tu_curr_state_r==TU_END)
		rd_blk_cnt_level_r = 'd0;
	else if(blk_e_done_r)
		rd_blk_cnt_level_r = rd_blk_cnt_r + 'd1;
	else 
		rd_blk_cnt_level_r = rd_blk_cnt_r;
end

wire	[5:0]		rd_blk_cnt_rev_w				;
assign	rd_blk_cnt_rev_w = blk_tot_r - (blk_e_done_r ? rd_blk_cnt_level_r : rd_blk_cnt_r);

//rd_blk_map_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:begin
						case(rd_blk_cnt_rev_w)
							'd0:	rd_blk_map_r = 'd0 ;
							'd1:	rd_blk_map_r = 'd2 ;
							'd2:	rd_blk_map_r = 'd1 ;
							'd3:	rd_blk_map_r = 'd8 ;
							'd4:	rd_blk_map_r = 'd3 ;
							'd5:	rd_blk_map_r = 'd4 ;
							'd6:	rd_blk_map_r = 'd10;
							'd7:	rd_blk_map_r = 'd9 ;
							'd8:	rd_blk_map_r = 'd6 ;
							'd9:	rd_blk_map_r = 'd5 ;
							'd10:	rd_blk_map_r = 'd32;
							'd11:	rd_blk_map_r = 'd11;
							'd12:	rd_blk_map_r = 'd12;
							'd13:	rd_blk_map_r = 'd7 ;
							'd14:	rd_blk_map_r = 'd16;
							'd15:	rd_blk_map_r = 'd34;
							'd16:	rd_blk_map_r = 'd33;
							'd17:	rd_blk_map_r = 'd14;
							'd18:	rd_blk_map_r = 'd13;
							'd19:	rd_blk_map_r = 'd18;
							'd20:	rd_blk_map_r = 'd17;
							'd21:	rd_blk_map_r = 'd40;
							'd22:	rd_blk_map_r = 'd35;
							'd23:	rd_blk_map_r = 'd36;
							'd24:	rd_blk_map_r = 'd15;
							'd25:	rd_blk_map_r = 'd24;
							'd26:	rd_blk_map_r = 'd19;
							'd27:	rd_blk_map_r = 'd20;
							'd28:	rd_blk_map_r = 'd42;
							'd29:	rd_blk_map_r = 'd41;
							'd30:	rd_blk_map_r = 'd38;
							'd31:	rd_blk_map_r = 'd37;
							'd32:	rd_blk_map_r = 'd26;
							'd33:	rd_blk_map_r = 'd25;
							'd34:	rd_blk_map_r = 'd22;
							'd35:	rd_blk_map_r = 'd21;
							'd36:	rd_blk_map_r = 'd43;
							'd37:	rd_blk_map_r = 'd44;
							'd38:	rd_blk_map_r = 'd39;
							'd39:	rd_blk_map_r = 'd48;
							'd40:	rd_blk_map_r = 'd27;
							'd41:	rd_blk_map_r = 'd28;
							'd42:	rd_blk_map_r = 'd23;
							'd43:	rd_blk_map_r = 'd46;
							'd44:	rd_blk_map_r = 'd45;
							'd45:	rd_blk_map_r = 'd50;
							'd46:	rd_blk_map_r = 'd49;
							'd47:	rd_blk_map_r = 'd30;
							'd48:	rd_blk_map_r = 'd29;
							'd49:	rd_blk_map_r = 'd47;
							'd50:	rd_blk_map_r = 'd56;
							'd51:	rd_blk_map_r = 'd51;
							'd52:	rd_blk_map_r = 'd52;
							'd53:	rd_blk_map_r = 'd31;
							'd54:	rd_blk_map_r = 'd58;
							'd55:	rd_blk_map_r = 'd57;
							'd56:	rd_blk_map_r = 'd54;
							'd57:	rd_blk_map_r = 'd53;
							'd58:	rd_blk_map_r = 'd59;
							'd59:	rd_blk_map_r = 'd60;
							'd60:	rd_blk_map_r = 'd55;
							'd61:	rd_blk_map_r = 'd62;
							'd62:	rd_blk_map_r = 'd61;
							'd63:	rd_blk_map_r = 'd63;
                            default:rd_blk_map_r = 'd0 ;							
						endcase
			end
			
			'd2:	begin
						case(rd_blk_cnt_rev_w)
							'd0:	rd_blk_map_r = 'd0 ;
							'd1:	rd_blk_map_r = 'd2 ;
							'd2:	rd_blk_map_r = 'd1 ;
							'd3:	rd_blk_map_r = 'd8 ;
							'd4:	rd_blk_map_r = 'd3 ;
							'd5:	rd_blk_map_r = 'd4 ;
							'd6:	rd_blk_map_r = 'd10;
							'd7:	rd_blk_map_r = 'd9 ;
							'd8:	rd_blk_map_r = 'd6 ;
							'd9:	rd_blk_map_r = 'd5 ;
							'd10:	rd_blk_map_r = 'd11;
							'd11:	rd_blk_map_r = 'd12;
							'd12:	rd_blk_map_r = 'd7 ;
							'd13:	rd_blk_map_r = 'd14;
							'd14:	rd_blk_map_r = 'd13;
							'd15:	rd_blk_map_r = 'd15;
							default:rd_blk_map_r = 'd0 ;
						endcase
			end
			
			'd3:	begin
						case(rd_blk_cnt_rev_w)
							'd0:	rd_blk_map_r = 'd0 ;
							'd1:    rd_blk_map_r = scan_idx_r!=(`SCAN_HOR) ? 2 : 1;
							'd2:    rd_blk_map_r = scan_idx_r!=(`SCAN_HOR) ? 1 : 2;
							'd3:    rd_blk_map_r = 'd3 ;
							default:rd_blk_map_r = 'd0 ;
						endcase
			end
			
			default:begin
						rd_blk_map_r = 'd0;
			end
		endcase
	end
	else if(res_curr_state_r==RESIDUAL_CR_COEFF || res_curr_state_r==RESIDUAL_CB_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							case(rd_blk_cnt_rev_w)
							'd0:	rd_blk_map_r = 'd0 ;
							'd1:	rd_blk_map_r = 'd2 ;
							'd2:	rd_blk_map_r = 'd1 ;
							'd3:	rd_blk_map_r = 'd8 ;
							'd4:	rd_blk_map_r = 'd3 ;
							'd5:	rd_blk_map_r = 'd4 ;
							'd6:	rd_blk_map_r = 'd10;
							'd7:	rd_blk_map_r = 'd9 ;
							'd8:	rd_blk_map_r = 'd6 ;
							'd9:	rd_blk_map_r = 'd5 ;
							'd10:	rd_blk_map_r = 'd11;
							'd11:	rd_blk_map_r = 'd12;
							'd12:	rd_blk_map_r = 'd7 ;
							'd13:	rd_blk_map_r = 'd14;
							'd14:	rd_blk_map_r = 'd13;
							'd15:	rd_blk_map_r = 'd15;
							default:rd_blk_map_r = 'd0 ;
						endcase
			end
			
			'd2:	begin
						case(rd_blk_cnt_rev_w)
							'd0:	rd_blk_map_r = 'd0;
							'd1:	rd_blk_map_r = 'd2;
							'd2:	rd_blk_map_r = 'd1;
							'd3:	rd_blk_map_r = 'd3;
							default:rd_blk_map_r = 'd0;
						endcase
			end	
			
			'd3:	begin
						rd_blk_map_r = 'd0;
			end
			
			default:begin
						rd_blk_map_r = 'd0;
			end
		endcase
	end
	else begin
		rd_blk_map_r = 'd0;
	end	
end








//cu_luma_cbf_r, cu_cr_cbf_r, cu_cb_cbf_r
always @* begin
	case(cu_depth_i)
		'd0:	begin
					cu_luma_cbf_r = {luma_cbf_i[255:192]!='d0, luma_cbf_i[191:128]!='d0, luma_cbf_i[127:64]!='d0, luma_cbf_i[63:0]!='d0};
					cu_cr_cbf_r   = {cr_cbf_i[63:48]!='d0, cr_cbf_i[47:32]!='d0, cr_cbf_i[31:16]!='d0, cr_cbf_i[15:0]!='d0};
					cu_cb_cbf_r   = {cb_cbf_i[63:48]!='d0, cb_cbf_i[47:32]!='d0, cb_cbf_i[31:16]!='d0, cb_cbf_i[15:0]!='d0};		
		end
		
		'd1:	begin
					cu_luma_cbf_r = tu_32x32_luma_cbf_r!='d0;
					cu_cr_cbf_r   = tu_16x16_cr_cbf_r!='d0;
					cu_cb_cbf_r   = tu_16x16_cb_cbf_r!='d0;
		end
		
		'd2:	begin
					cu_luma_cbf_r = tu_16x16_luma_cbf_r!='d0;
					cu_cr_cbf_r   = tu_8x8_cr_cbf_r!='d0;
					cu_cb_cbf_r   = tu_8x8_cb_cbf_r!='d0;
		end
		
		'd3:	begin
					cu_luma_cbf_r = tu_8x8_luma_cbf_r!='d0;
					cu_cr_cbf_r   = tu_4x4_cr_cbf_r!='d0;
					cu_cb_cbf_r   = tu_4x4_cb_cbf_r!='d0;
		end
		
		default:begin
					cu_luma_cbf_r = 'd0;
					cu_cr_cbf_r   = 'd0;
					cu_cb_cbf_r   = 'd0;
		end
	endcase
end



// tu_32x32_luma_cbf_r, tu_16x16_cr_cbf_r, tu_16x16_cb_cbf_r
always @* begin
	if(cu_depth_i=='d0) begin
		case(tu_cnt_r)
			'd0:	begin
						tu_32x32_luma_cbf_r = luma_cbf_i[63:0];
						tu_16x16_cr_cbf_r   = cr_cbf_i[15:0];
						tu_16x16_cb_cbf_r   = cb_cbf_i[15:0];
			end
			
			'd1:	begin
						tu_32x32_luma_cbf_r = luma_cbf_i[127:64];
						tu_16x16_cr_cbf_r   = cr_cbf_i[31:16];
						tu_16x16_cb_cbf_r   = cb_cbf_i[31:16];
			end
			
			'd2:	begin
						tu_32x32_luma_cbf_r = luma_cbf_i[191:128];
						tu_16x16_cr_cbf_r   = cr_cbf_i[47:32];
						tu_16x16_cb_cbf_r   = cb_cbf_i[47:32];
			end
			
			'd3:	begin
						tu_32x32_luma_cbf_r = luma_cbf_i[255:192];
						tu_16x16_cr_cbf_r   = cr_cbf_i[63:48];
						tu_16x16_cb_cbf_r   = cb_cbf_i[63:48];
			end
			
			default:begin
						tu_32x32_luma_cbf_r = luma_cbf_i[63:0];
						tu_16x16_cr_cbf_r   = cr_cbf_i[15:0];
						tu_16x16_cb_cbf_r   = cb_cbf_i[15:0];
			end						
		endcase
	end
	else begin
		case(cu_idx_i)
			'd1:	begin
						tu_32x32_luma_cbf_r = luma_cbf_i[63:0];
						tu_16x16_cr_cbf_r   = cr_cbf_i[15:0];
						tu_16x16_cb_cbf_r   = cb_cbf_i[15:0];
			end
			
			'd2:	begin
						tu_32x32_luma_cbf_r = luma_cbf_i[127:64];
						tu_16x16_cr_cbf_r   = cr_cbf_i[31:16];
						tu_16x16_cb_cbf_r   = cb_cbf_i[31:16];
			end
			
			'd3:	begin
						tu_32x32_luma_cbf_r = luma_cbf_i[191:128];
						tu_16x16_cr_cbf_r   = cr_cbf_i[47:32];
						tu_16x16_cb_cbf_r   = cb_cbf_i[47:32];
			end
			
			'd4:	begin
						tu_32x32_luma_cbf_r = luma_cbf_i[255:192];
						tu_16x16_cr_cbf_r   = cr_cbf_i[63:48];
						tu_16x16_cb_cbf_r   = cb_cbf_i[63:48];
			end
			
			default:begin
						tu_32x32_luma_cbf_r = 'd0;
						tu_16x16_cr_cbf_r   = 'd0;
						tu_16x16_cb_cbf_r   = 'd0;
			end			
		endcase	
	end	
end

//tu_16x16_luma_cbf_r, tu_8x8_cr_cbf_r, tu_8x8_cb_cbf_r
always @* begin
	case(cu_idx_i)
		'd5:	begin
					tu_16x16_luma_cbf_r = luma_cbf_i[15:0];
					tu_8x8_cr_cbf_r     = cr_cbf_i[3:0];
					tu_8x8_cb_cbf_r     = cb_cbf_i[3:0];	
		end                        
		                           
		'd6:	begin              
					tu_16x16_luma_cbf_r = luma_cbf_i[31:16];
					tu_8x8_cr_cbf_r     = cr_cbf_i[7:4];
					tu_8x8_cb_cbf_r     = cb_cbf_i[7:4];
		end                        
		                           
		'd7:	begin              
					tu_16x16_luma_cbf_r = luma_cbf_i[47:32];
					tu_8x8_cr_cbf_r     = cr_cbf_i[11:8];
					tu_8x8_cb_cbf_r     = cb_cbf_i[11:8];
		end                        
		                           
		'd8:	begin              
					tu_16x16_luma_cbf_r = luma_cbf_i[63:48];
					tu_8x8_cr_cbf_r     = cr_cbf_i[15:12];
					tu_8x8_cb_cbf_r     = cb_cbf_i[15:12];
		end                      
		                         
		'd9:	begin            
					tu_16x16_luma_cbf_r = luma_cbf_i[79:64];
					tu_8x8_cr_cbf_r     = cr_cbf_i[19:16];
					tu_8x8_cb_cbf_r     = cb_cbf_i[19:16];
		end                         
		                            
		'd10:	begin               
					tu_16x16_luma_cbf_r = luma_cbf_i[95:80];
					tu_8x8_cr_cbf_r     = cr_cbf_i[23:20];
					tu_8x8_cb_cbf_r     = cb_cbf_i[23:20];
		end                        
		                           
		'd11:	begin              
					tu_16x16_luma_cbf_r = luma_cbf_i[111:96];
					tu_8x8_cr_cbf_r     = cr_cbf_i[27:24];
					tu_8x8_cb_cbf_r     = cb_cbf_i[27:24];
		end                        
		                           
		'd12:	begin              
					tu_16x16_luma_cbf_r = luma_cbf_i[127:112];
					tu_8x8_cr_cbf_r     = cr_cbf_i[31:28];
					tu_8x8_cb_cbf_r     = cb_cbf_i[31:28];
		end                         
		                            
		'd13:	begin               
					tu_16x16_luma_cbf_r = luma_cbf_i[143:128];
					tu_8x8_cr_cbf_r     = cr_cbf_i[35:32];
					tu_8x8_cb_cbf_r     = cb_cbf_i[35:32];
		end                         
		                            
		'd14:	begin               
					tu_16x16_luma_cbf_r = luma_cbf_i[159:144];
					tu_8x8_cr_cbf_r     = cr_cbf_i[39:36];
					tu_8x8_cb_cbf_r     = cb_cbf_i[39:36];
		end                          
		                             
		'd15:	begin                
					tu_16x16_luma_cbf_r = luma_cbf_i[175:160];
					tu_8x8_cr_cbf_r     = cr_cbf_i[43:40];
					tu_8x8_cb_cbf_r     = cb_cbf_i[43:40];
		end                        
		                           
		'd16:	begin              
					tu_16x16_luma_cbf_r = luma_cbf_i[191:176];
					tu_8x8_cr_cbf_r     = cr_cbf_i[47:44];
					tu_8x8_cb_cbf_r     = cb_cbf_i[47:44];
		end                         
		                            
		'd17:	begin               
					tu_16x16_luma_cbf_r = luma_cbf_i[207:192];
					tu_8x8_cr_cbf_r     = cr_cbf_i[51:48];
					tu_8x8_cb_cbf_r     = cb_cbf_i[51:48];
		end                       
		                          
		'd18:	begin             
					tu_16x16_luma_cbf_r = luma_cbf_i[223:208];
					tu_8x8_cr_cbf_r     = cr_cbf_i[55:52];
					tu_8x8_cb_cbf_r     = cb_cbf_i[55:52];
		end                      
		                         
		'd19:	begin            
					tu_16x16_luma_cbf_r = luma_cbf_i[239:224];
					tu_8x8_cr_cbf_r     = cr_cbf_i[59:56];
					tu_8x8_cb_cbf_r     = cb_cbf_i[59:56];
		end                      
		                         
		'd20:	begin            
					tu_16x16_luma_cbf_r = luma_cbf_i[255:240];
					tu_8x8_cr_cbf_r     = cr_cbf_i[63:60];
					tu_8x8_cb_cbf_r     = cb_cbf_i[63:60];
		end                       
		
		default:begin
					tu_16x16_luma_cbf_r = 'd0;
					tu_8x8_cr_cbf_r     = 'd0;
					tu_8x8_cb_cbf_r     = 'd0;
		end
	endcase
end

// tu_8x8_luma_cbf_r, tu_4x4_cr_cbf_r, tu_4x4_cb_cbf_r
always @* begin
	if(cu_depth_i=='d3) begin
//		tu_8x8_luma_cbf_r = luma_cbf_i[((cu_idx_minus21_i<<2)+3) : (cu_idx_minus21_i<<2)];
		tu_4x4_cr_cbf_r   = cr_cbf_i[cu_idx_minus21_i];
		tu_4x4_cb_cbf_r   = cb_cbf_i[cu_idx_minus21_i];
	end
	else begin
//		tu_8x8_luma_cbf_r = 'd0;
		tu_4x4_cr_cbf_r   = 'd0;
		tu_4x4_cb_cbf_r   = 'd0;
	end	
end

always @* begin
	if(cu_depth_i=='d3) begin
		case(cu_idx_i)
			'd21:   tu_8x8_luma_cbf_r = luma_cbf_i[  3:  0];
			'd22:   tu_8x8_luma_cbf_r = luma_cbf_i[  7:  4];
			'd23:   tu_8x8_luma_cbf_r = luma_cbf_i[ 11:  8];
			'd24:   tu_8x8_luma_cbf_r = luma_cbf_i[ 15: 12];
			'd25:   tu_8x8_luma_cbf_r = luma_cbf_i[ 19: 16];
			'd26:   tu_8x8_luma_cbf_r = luma_cbf_i[ 23: 20];
			'd27:   tu_8x8_luma_cbf_r = luma_cbf_i[ 27: 24];
			'd28:   tu_8x8_luma_cbf_r = luma_cbf_i[ 31: 28];
			'd29:   tu_8x8_luma_cbf_r = luma_cbf_i[ 35: 32];
			'd30:   tu_8x8_luma_cbf_r = luma_cbf_i[ 39: 36];
			'd31:   tu_8x8_luma_cbf_r = luma_cbf_i[ 43: 40];
			'd32:   tu_8x8_luma_cbf_r = luma_cbf_i[ 47: 44];
			'd33:   tu_8x8_luma_cbf_r = luma_cbf_i[ 51: 48];
			'd34:   tu_8x8_luma_cbf_r = luma_cbf_i[ 55: 52];
			'd35:   tu_8x8_luma_cbf_r = luma_cbf_i[ 59: 56];
			'd36:   tu_8x8_luma_cbf_r = luma_cbf_i[ 63: 60];
			'd37:   tu_8x8_luma_cbf_r = luma_cbf_i[ 67: 64];
			'd38:   tu_8x8_luma_cbf_r = luma_cbf_i[ 71: 68];
			'd39:   tu_8x8_luma_cbf_r = luma_cbf_i[ 75: 72];
			'd40:   tu_8x8_luma_cbf_r = luma_cbf_i[ 79: 76];
			'd41:   tu_8x8_luma_cbf_r = luma_cbf_i[ 83: 80];
			'd42:   tu_8x8_luma_cbf_r = luma_cbf_i[ 87: 84];
			'd43:   tu_8x8_luma_cbf_r = luma_cbf_i[ 91: 88];
			'd44:   tu_8x8_luma_cbf_r = luma_cbf_i[ 95: 92];
			'd45:   tu_8x8_luma_cbf_r = luma_cbf_i[ 99: 96];
			'd46:   tu_8x8_luma_cbf_r = luma_cbf_i[103:100];
			'd47:   tu_8x8_luma_cbf_r = luma_cbf_i[107:104];
			'd48:   tu_8x8_luma_cbf_r = luma_cbf_i[111:108];
			'd49:   tu_8x8_luma_cbf_r = luma_cbf_i[115:112];
			'd50:   tu_8x8_luma_cbf_r = luma_cbf_i[119:116];
			'd51:   tu_8x8_luma_cbf_r = luma_cbf_i[123:120];
			'd52:   tu_8x8_luma_cbf_r = luma_cbf_i[127:124];
			'd53:   tu_8x8_luma_cbf_r = luma_cbf_i[131:128];
			'd54:   tu_8x8_luma_cbf_r = luma_cbf_i[135:132];
			'd55:   tu_8x8_luma_cbf_r = luma_cbf_i[139:136];
			'd56:   tu_8x8_luma_cbf_r = luma_cbf_i[143:140];
			'd57:   tu_8x8_luma_cbf_r = luma_cbf_i[147:144];
			'd58:   tu_8x8_luma_cbf_r = luma_cbf_i[151:148];
			'd59:   tu_8x8_luma_cbf_r = luma_cbf_i[155:152];
			'd60:   tu_8x8_luma_cbf_r = luma_cbf_i[159:156];
			'd61:   tu_8x8_luma_cbf_r = luma_cbf_i[163:160];
			'd62:   tu_8x8_luma_cbf_r = luma_cbf_i[167:164];
			'd63:   tu_8x8_luma_cbf_r = luma_cbf_i[171:168];
			'd64:   tu_8x8_luma_cbf_r = luma_cbf_i[175:172];
			'd65:   tu_8x8_luma_cbf_r = luma_cbf_i[179:176];
			'd66:   tu_8x8_luma_cbf_r = luma_cbf_i[183:180];
			'd67:   tu_8x8_luma_cbf_r = luma_cbf_i[187:184];
			'd68:   tu_8x8_luma_cbf_r = luma_cbf_i[191:188];
			'd69:   tu_8x8_luma_cbf_r = luma_cbf_i[195:192];
			'd70:   tu_8x8_luma_cbf_r = luma_cbf_i[199:196];
			'd71:   tu_8x8_luma_cbf_r = luma_cbf_i[203:200];
			'd72:   tu_8x8_luma_cbf_r = luma_cbf_i[207:204];
			'd73:   tu_8x8_luma_cbf_r = luma_cbf_i[211:208];
			'd74:   tu_8x8_luma_cbf_r = luma_cbf_i[215:212];
			'd75:   tu_8x8_luma_cbf_r = luma_cbf_i[219:216];
			'd76:   tu_8x8_luma_cbf_r = luma_cbf_i[223:220];
			'd77:   tu_8x8_luma_cbf_r = luma_cbf_i[227:224];
			'd78:   tu_8x8_luma_cbf_r = luma_cbf_i[231:228];
			'd79:   tu_8x8_luma_cbf_r = luma_cbf_i[235:232];
			'd80:   tu_8x8_luma_cbf_r = luma_cbf_i[239:236];
			'd81:   tu_8x8_luma_cbf_r = luma_cbf_i[243:240];
			'd82:   tu_8x8_luma_cbf_r = luma_cbf_i[247:244];
			'd83:   tu_8x8_luma_cbf_r = luma_cbf_i[251:248];
			'd84:   tu_8x8_luma_cbf_r = luma_cbf_i[255:252];
			default:tu_8x8_luma_cbf_r = 'd0;
		endcase
	end
	else begin
		tu_8x8_luma_cbf_r = 'd0;
	end	
end




always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i) 
			'd0:	tu_width_flag_r = 'd0;	//32x32
			'd1:	tu_width_flag_r = 'd0;	//32x32
			'd2:	tu_width_flag_r = 'd1;	//16x16
			'd3:	tu_width_flag_r = 'd2;	//8x8
			default:tu_width_flag_r = 'd2;	//8x8
		endcase	
	end
	else if(res_curr_state_r==RESIDUAL_CR_COEFF || res_curr_state_r==RESIDUAL_CB_COEFF) begin
		case(cu_depth_i)
			'd0:	tu_width_flag_r = 'd1;	//16x16
			'd1:	tu_width_flag_r = 'd1;	//16x16
			'd2:	tu_width_flag_r = 'd2;	//8x8
			'd3:	tu_width_flag_r = 'd3;	//4x4
			default:tu_width_flag_r = 'd3;	//4x4
		endcase
	end
	else begin
		tu_width_flag_r = 'd3;
	end
end


wire	[7:0]	a0_w;
wire	[7:0]	a1_w;
wire	[7:0]	a2_w;
wire	[7:0]	a3_w;
wire	[7:0]	a4_w;
wire	[7:0]	a5_w;
wire	[7:0]	a6_w;
wire	[7:0]	a7_w;

wire	[7:0]	b0_w;
wire	[7:0]	b1_w;

wire	[7:0]	c0_w;

wire	[7:0]	cr0_w;
wire	[7:0]	cr1_w;

wire	[7:0]	cb0_w;
wire	[7:0]	cb1_w;


assign	a0_w = {tu_cbf_z2s_luma32x32_w[56], tu_cbf_z2s_luma32x32_w[57], tu_cbf_z2s_luma32x32_w[58], tu_cbf_z2s_luma32x32_w[59], 
			    tu_cbf_z2s_luma32x32_w[60], tu_cbf_z2s_luma32x32_w[61], tu_cbf_z2s_luma32x32_w[62], tu_cbf_z2s_luma32x32_w[63]}; // tu_cbf_z2s_luma32x32_w[56:63];
assign	a1_w = {tu_cbf_z2s_luma32x32_w[48], tu_cbf_z2s_luma32x32_w[49], tu_cbf_z2s_luma32x32_w[50], tu_cbf_z2s_luma32x32_w[51], 
			    tu_cbf_z2s_luma32x32_w[52], tu_cbf_z2s_luma32x32_w[53], tu_cbf_z2s_luma32x32_w[54], tu_cbf_z2s_luma32x32_w[55]}; // tu_cbf_z2s_luma32x32_w[48:55];
assign	a2_w = {tu_cbf_z2s_luma32x32_w[40], tu_cbf_z2s_luma32x32_w[41], tu_cbf_z2s_luma32x32_w[42], tu_cbf_z2s_luma32x32_w[43], 
			    tu_cbf_z2s_luma32x32_w[44], tu_cbf_z2s_luma32x32_w[45], tu_cbf_z2s_luma32x32_w[46], tu_cbf_z2s_luma32x32_w[47]};// tu_cbf_z2s_luma32x32_w[40:47];
assign	a3_w = {tu_cbf_z2s_luma32x32_w[32], tu_cbf_z2s_luma32x32_w[33], tu_cbf_z2s_luma32x32_w[34], tu_cbf_z2s_luma32x32_w[35], 
			    tu_cbf_z2s_luma32x32_w[36], tu_cbf_z2s_luma32x32_w[37], tu_cbf_z2s_luma32x32_w[38], tu_cbf_z2s_luma32x32_w[39]};// tu_cbf_z2s_luma32x32_w[32:39];
assign	a4_w = {tu_cbf_z2s_luma32x32_w[24], tu_cbf_z2s_luma32x32_w[25], tu_cbf_z2s_luma32x32_w[26], tu_cbf_z2s_luma32x32_w[27], 
			    tu_cbf_z2s_luma32x32_w[28], tu_cbf_z2s_luma32x32_w[29], tu_cbf_z2s_luma32x32_w[30], tu_cbf_z2s_luma32x32_w[31]};// tu_cbf_z2s_luma32x32_w[24:31];
assign	a5_w = {tu_cbf_z2s_luma32x32_w[16], tu_cbf_z2s_luma32x32_w[17], tu_cbf_z2s_luma32x32_w[18], tu_cbf_z2s_luma32x32_w[19], 
			    tu_cbf_z2s_luma32x32_w[20], tu_cbf_z2s_luma32x32_w[21], tu_cbf_z2s_luma32x32_w[22], tu_cbf_z2s_luma32x32_w[23]};// tu_cbf_z2s_luma32x32_w[16:23];
assign	a6_w = {tu_cbf_z2s_luma32x32_w[ 8], tu_cbf_z2s_luma32x32_w[ 9], tu_cbf_z2s_luma32x32_w[10], tu_cbf_z2s_luma32x32_w[11], 
			    tu_cbf_z2s_luma32x32_w[12], tu_cbf_z2s_luma32x32_w[13], tu_cbf_z2s_luma32x32_w[14], tu_cbf_z2s_luma32x32_w[15]};// tu_cbf_z2s_luma32x32_w[ 8:15];
assign	a7_w = {tu_cbf_z2s_luma32x32_w[ 0], tu_cbf_z2s_luma32x32_w[ 1], tu_cbf_z2s_luma32x32_w[ 2], tu_cbf_z2s_luma32x32_w[ 3], 
			    tu_cbf_z2s_luma32x32_w[ 4], tu_cbf_z2s_luma32x32_w[ 5], tu_cbf_z2s_luma32x32_w[ 6], tu_cbf_z2s_luma32x32_w[ 7]};// tu_cbf_z2s_luma32x32_w[ 0: 7];

assign	b0_w = {tu_cbf_z2s_luma16x16_w[ 8], tu_cbf_z2s_luma16x16_w[ 9], tu_cbf_z2s_luma16x16_w[10], tu_cbf_z2s_luma16x16_w[11], 
			    tu_cbf_z2s_luma16x16_w[12], tu_cbf_z2s_luma16x16_w[13], tu_cbf_z2s_luma16x16_w[14], tu_cbf_z2s_luma16x16_w[15]};//tu_cbf_z2s_luma16x16_w[ 8:15];
assign	b1_w = {tu_cbf_z2s_luma16x16_w[ 0], tu_cbf_z2s_luma16x16_w[ 1], tu_cbf_z2s_luma16x16_w[ 2], tu_cbf_z2s_luma16x16_w[ 3], 
			    tu_cbf_z2s_luma16x16_w[ 4], tu_cbf_z2s_luma16x16_w[ 5], tu_cbf_z2s_luma16x16_w[ 6], tu_cbf_z2s_luma16x16_w[ 7]};//tu_cbf_z2s_luma16x16_w[ 0: 7];

assign	c0_w = {4'd0,
				tu_cbf_z2s_luma8x8_r[ 0], tu_cbf_z2s_luma8x8_r[ 1], tu_cbf_z2s_luma8x8_r[ 2], tu_cbf_z2s_luma8x8_r[ 3]};//{4'd0, tu_cbf_z2s_luma8x8_r[0:3]};

assign	cr0_w = {tu_cbf_z2s_cr16x16_w[ 8], tu_cbf_z2s_cr16x16_w[ 9], tu_cbf_z2s_cr16x16_w[10], tu_cbf_z2s_cr16x16_w[11], 
			     tu_cbf_z2s_cr16x16_w[12], tu_cbf_z2s_cr16x16_w[13], tu_cbf_z2s_cr16x16_w[14], tu_cbf_z2s_cr16x16_w[15]};//tu_cbf_z2s_cr16x16_w[ 8:15];
assign  cr1_w = {tu_cbf_z2s_cr16x16_w[ 0], tu_cbf_z2s_cr16x16_w[ 1], tu_cbf_z2s_cr16x16_w[ 2], tu_cbf_z2s_cr16x16_w[ 3], 
			     tu_cbf_z2s_cr16x16_w[ 4], tu_cbf_z2s_cr16x16_w[ 5], tu_cbf_z2s_cr16x16_w[ 6], tu_cbf_z2s_cr16x16_w[ 7]};//tu_cbf_z2s_cr16x16_w[ 0: 7];


assign	cb0_w = {tu_cbf_z2s_cb16x16_w[ 8], tu_cbf_z2s_cb16x16_w[ 9], tu_cbf_z2s_cb16x16_w[10], tu_cbf_z2s_cb16x16_w[11], 
			     tu_cbf_z2s_cb16x16_w[12], tu_cbf_z2s_cb16x16_w[13], tu_cbf_z2s_cb16x16_w[14], tu_cbf_z2s_cb16x16_w[15]};//tu_cbf_z2s_cb16x16_w[ 8:15];
assign  cb1_w = {tu_cbf_z2s_cb16x16_w[ 0], tu_cbf_z2s_cb16x16_w[ 1], tu_cbf_z2s_cb16x16_w[ 2], tu_cbf_z2s_cb16x16_w[ 3], 
			     tu_cbf_z2s_cb16x16_w[ 4], tu_cbf_z2s_cb16x16_w[ 5], tu_cbf_z2s_cb16x16_w[ 6], tu_cbf_z2s_cb16x16_w[ 7]};//tu_cbf_z2s_cb16x16_w[ 0: 7];


//last_cbf_0_r~last_cbf_7_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
						last_cbf_0_r = a0_w;//tu_cbf_z2s_luma32x32_w[56:63];	//right-down
						last_cbf_1_r = a1_w;//tu_cbf_z2s_luma32x32_w[48:55];
						last_cbf_2_r = a2_w;//tu_cbf_z2s_luma32x32_w[40:47];
						last_cbf_3_r = a3_w;//tu_cbf_z2s_luma32x32_w[32:39];
						last_cbf_4_r = a4_w;//tu_cbf_z2s_luma32x32_w[24:31];
						last_cbf_5_r = a5_w;//tu_cbf_z2s_luma32x32_w[16:23];
						last_cbf_6_r = a6_w;//tu_cbf_z2s_luma32x32_w[ 8:15];
						last_cbf_7_r = a7_w;//tu_cbf_z2s_luma32x32_w[ 0: 7];	//left-top
			end
			
			'd2:	begin
						last_cbf_0_r = b0_w;//tu_cbf_z2s_luma16x16_w[ 8:15];
						last_cbf_1_r = b1_w;//tu_cbf_z2s_luma16x16_w[ 0: 7];
						last_cbf_2_r = 'd0;
						last_cbf_3_r = 'd0;
						last_cbf_4_r = 'd0;
						last_cbf_5_r = 'd0;
						last_cbf_6_r = 'd0;
						last_cbf_7_r = 'd0;
			end
			
			'd3:	begin
				        last_cbf_0_r = c0_w;
						last_cbf_1_r = 'd0;
						last_cbf_2_r = 'd0;
						last_cbf_3_r = 'd0;
						last_cbf_4_r = 'd0;
						last_cbf_5_r = 'd0;
						last_cbf_6_r = 'd0;
						last_cbf_7_r = 'd0;
			end
			
			default:begin
				        last_cbf_0_r = 'd0;
						last_cbf_1_r = 'd0;
						last_cbf_2_r = 'd0;
						last_cbf_3_r = 'd0;
						last_cbf_4_r = 'd0;
						last_cbf_5_r = 'd0;
						last_cbf_6_r = 'd0;
						last_cbf_7_r = 'd0;
			end			
		endcase
	end            
	else if(res_curr_state_r==RESIDUAL_CR_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
						last_cbf_0_r = cr0_w;//tu_cbf_z2s_cr16x16_w[ 8:15];
						last_cbf_1_r = cr1_w;//tu_cbf_z2s_cr16x16_w[ 0: 7];
						last_cbf_2_r = 'd0; 
						last_cbf_3_r = 'd0;
						last_cbf_4_r = 'd0;
						last_cbf_5_r = 'd0;
						last_cbf_6_r = 'd0;
						last_cbf_7_r = 'd0;
			end
			
			'd2:	begin
						last_cbf_0_r = {4'd0, tu_cbf_z2s_cr8x8_w[0], tu_cbf_z2s_cr8x8_w[1], 
											  tu_cbf_z2s_cr8x8_w[2], tu_cbf_z2s_cr8x8_w[3]};//{4'd0, tu_cbf_z2s_cr8x8_w};
						last_cbf_1_r = 'd0;
						last_cbf_2_r = 'd0; 
						last_cbf_3_r = 'd0;
						last_cbf_4_r = 'd0;
						last_cbf_5_r = 'd0;
						last_cbf_6_r = 'd0;
						last_cbf_7_r = 'd0;
			end
			
			'd3:	begin
						last_cbf_0_r = {7'd0, tu_cbf_z2s_cr4x4_w};
						last_cbf_1_r = 'd0;
						last_cbf_2_r = 'd0; 
						last_cbf_3_r = 'd0;
						last_cbf_4_r = 'd0;
						last_cbf_5_r = 'd0;
						last_cbf_6_r = 'd0;
						last_cbf_7_r = 'd0;
			end
			
			default:begin
						last_cbf_0_r = 'd0;
						last_cbf_1_r = 'd0;
						last_cbf_2_r = 'd0; 
						last_cbf_3_r = 'd0;
						last_cbf_4_r = 'd0;
						last_cbf_5_r = 'd0;
						last_cbf_6_r = 'd0;
						last_cbf_7_r = 'd0;
			end			
		endcase		
	end
	else if(res_curr_state_r==RESIDUAL_CB_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
						last_cbf_0_r = cb0_w;// tu_cbf_z2s_cb16x16_w[ 8:15];
						last_cbf_1_r = cb1_w;// tu_cbf_z2s_cb16x16_w[ 0: 7];
						last_cbf_2_r = 'd0; 
						last_cbf_3_r = 'd0;
						last_cbf_4_r = 'd0;
						last_cbf_5_r = 'd0;
						last_cbf_6_r = 'd0;
						last_cbf_7_r = 'd0;
			end
			
			'd2:	begin
						last_cbf_0_r = {4'd0, tu_cbf_z2s_cb8x8_w[0], tu_cbf_z2s_cb8x8_w[1], 
											  tu_cbf_z2s_cb8x8_w[2], tu_cbf_z2s_cb8x8_w[3]};
						last_cbf_1_r = 'd0;
						last_cbf_2_r = 'd0; 
						last_cbf_3_r = 'd0;
						last_cbf_4_r = 'd0;
						last_cbf_5_r = 'd0;
						last_cbf_6_r = 'd0;
						last_cbf_7_r = 'd0;
			end
			
			'd3:	begin
						last_cbf_0_r = {7'd0, tu_cbf_z2s_cb4x4_w};
						last_cbf_1_r = 'd0;
						last_cbf_2_r = 'd0; 
						last_cbf_3_r = 'd0;
						last_cbf_4_r = 'd0;
						last_cbf_5_r = 'd0;
						last_cbf_6_r = 'd0;
						last_cbf_7_r = 'd0;
			end
			
			default:begin
						last_cbf_0_r = 'd0;
						last_cbf_1_r = 'd0;
						last_cbf_2_r = 'd0; 
						last_cbf_3_r = 'd0;
						last_cbf_4_r = 'd0;
						last_cbf_5_r = 'd0;
						last_cbf_6_r = 'd0;
						last_cbf_7_r = 'd0;
			end			
		endcase		
	end
	else begin
		last_cbf_0_r = 'd0;
		last_cbf_1_r = 'd0;
		last_cbf_2_r = 'd0;
		last_cbf_3_r = 'd0;
		last_cbf_4_r = 'd0;
		last_cbf_5_r = 'd0;
		last_cbf_6_r = 'd0;
		last_cbf_7_r = 'd0;
	end
end





always @* begin
	if(last_cbf_0_r[7:0]!='d0) begin					//right_down
		if(last_cbf_0_r[3:0]!='d0) begin
			if(last_cbf_0_r[1:0]!='d0) begin
				if(last_cbf_0_r[0]!='d0) begin
					last_blk_idx_0_r = 'd0;
				end
				else begin
					last_blk_idx_0_r = 'd1;
				end	
			end
			else begin
				if(last_cbf_0_r[2]!='d0) begin
					last_blk_idx_0_r = 'd2; 	
				end
				else begin
					last_blk_idx_0_r = 'd3;
				end 
			end	
		end
		else begin
			if(last_cbf_0_r[5:4]!='d0) begin
				if(last_cbf_0_r[4]!='d0)
					last_blk_idx_0_r = 'd4;
				else 
					last_blk_idx_0_r = 'd5;	
			end
			else begin	
				if(last_cbf_0_r[6]!='d0)
					last_blk_idx_0_r = 'd6;
				else 
					last_blk_idx_0_r = 'd7;
			end
		end
	end
	else
		last_blk_idx_0_r = 'hff;
end


always @* begin
	if(last_cbf_1_r[7:0]!='d0) begin
		if(last_cbf_1_r[3:0]!='d0) begin
			if(last_cbf_1_r[1:0]!='d0) begin
				if(last_cbf_1_r[0]!='d0) begin
					last_blk_idx_1_r = 'd0;
				end
				else begin
					last_blk_idx_1_r = 'd1;
				end	
			end
			else begin
				if(last_cbf_1_r[2]!='d0) begin
					last_blk_idx_1_r = 'd2; 	
				end
				else begin
					last_blk_idx_1_r = 'd3;
				end 
			end	
		end
		else begin
			if(last_cbf_1_r[5:4]!='d0) begin
				if(last_cbf_1_r[4]!='d0)
					last_blk_idx_1_r = 'd4;
				else 
					last_blk_idx_1_r = 'd5;	
			end
			else begin	
				if(last_cbf_1_r[6]!='d0)
					last_blk_idx_1_r = 'd6;
				else 
					last_blk_idx_1_r = 'd7;
			end
		end
	end
	else	
		last_blk_idx_1_r = 'hff;
end


always @* begin
	if(last_cbf_2_r[7:0]!='d0) begin
		if(last_cbf_2_r[3:0]!='d0) begin
			if(last_cbf_2_r[1:0]!='d0) begin
				if(last_cbf_2_r[0]!='d0) begin
					last_blk_idx_2_r = 'd0;
				end
				else begin
					last_blk_idx_2_r = 'd1;
				end	
			end
			else begin
				if(last_cbf_2_r[2]!='d0) begin
					last_blk_idx_2_r = 'd2; 	
				end
				else begin
					last_blk_idx_2_r = 'd3;
				end 
			end	
		end
		else begin
			if(last_cbf_2_r[5:4]!='d0) begin
				if(last_cbf_2_r[4]!='d0)
					last_blk_idx_2_r = 'd4;
				else 
					last_blk_idx_2_r = 'd5;	
			end
			else begin	
				if(last_cbf_2_r[6]!='d0)
					last_blk_idx_2_r = 'd6;
				else 
					last_blk_idx_2_r = 'd7;
			end
		end
	end
	else 
		last_blk_idx_2_r = 'hff;
end



always @* begin
	if(last_cbf_3_r[7:0]!='d0) begin
		if(last_cbf_3_r[3:0]!='d0) begin
			if(last_cbf_3_r[1:0]!='d0) begin
				if(last_cbf_3_r[0]!='d0) begin
					last_blk_idx_3_r = 'd0;
				end
				else begin
					last_blk_idx_3_r = 'd1;
				end	
			end
			else begin
				if(last_cbf_3_r[2]!='d0) begin
					last_blk_idx_3_r = 'd2; 	
				end
				else begin
					last_blk_idx_3_r = 'd3;
				end 
			end	
		end
		else begin
			if(last_cbf_3_r[5:4]!='d0) begin
				if(last_cbf_3_r[4]!='d0)
					last_blk_idx_3_r = 'd4;
				else 
					last_blk_idx_3_r = 'd5;	
			end
			else begin	
				if(last_cbf_3_r[6]!='d0)
					last_blk_idx_3_r = 'd6;
				else 
					last_blk_idx_3_r = 'd7;
			end
		end
	end
	else 
		last_blk_idx_3_r = 'hff;
end


always @* begin
	if(last_cbf_4_r[7:0]!='d0) begin
		if(last_cbf_4_r[3:0]!='d0) begin
			if(last_cbf_4_r[1:0]!='d0) begin
				if(last_cbf_4_r[0]!='d0) begin
					last_blk_idx_4_r = 'd0;
				end
				else begin
					last_blk_idx_4_r = 'd1;
				end	
			end
			else begin
				if(last_cbf_4_r[2]!='d0) begin
					last_blk_idx_4_r = 'd2; 	
				end
				else begin
					last_blk_idx_4_r = 'd3;
				end 
			end	
		end
		else begin
			if(last_cbf_4_r[5:4]!='d0) begin
				if(last_cbf_4_r[4]!='d0)
					last_blk_idx_4_r = 'd4;
				else 
					last_blk_idx_4_r = 'd5;	
			end
			else begin	
				if(last_cbf_4_r[6]!='d0)
					last_blk_idx_4_r = 'd6;
				else 
					last_blk_idx_4_r = 'd7;
			end
		end
	end
	else
		last_blk_idx_4_r = 'hff;
end


always @* begin
	if(last_cbf_5_r[7:0]!='d0) begin
		if(last_cbf_5_r[3:0]!='d0) begin
			if(last_cbf_5_r[1:0]!='d0) begin
				if(last_cbf_5_r[0]!='d0) begin
					last_blk_idx_5_r = 'd0;
				end
				else begin
					last_blk_idx_5_r = 'd1;
				end	
			end
			else begin
				if(last_cbf_5_r[2]!='d0) begin
					last_blk_idx_5_r = 'd2; 	
				end
				else begin
					last_blk_idx_5_r = 'd3;
				end 
			end	
		end
		else begin
			if(last_cbf_5_r[5:4]!='d0) begin
				if(last_cbf_5_r[4]!='d0)
					last_blk_idx_5_r = 'd4;
				else 
					last_blk_idx_5_r = 'd5;	
			end
			else begin	
				if(last_cbf_5_r[6]!='d0)
					last_blk_idx_5_r = 'd6;
				else 
					last_blk_idx_5_r = 'd7;
			end
		end
	end
	else 	
		last_blk_idx_5_r = 'hff;
end



always @* begin
	if(last_cbf_6_r[7:0]!='d0) begin
		if(last_cbf_6_r[3:0]!='d0) begin
			if(last_cbf_6_r[1:0]!='d0) begin
				if(last_cbf_6_r[0]!='d0) begin
					last_blk_idx_6_r = 'd0;
				end
				else begin
					last_blk_idx_6_r = 'd1;
				end	
			end
			else begin
				if(last_cbf_6_r[2]!='d0) begin
					last_blk_idx_6_r = 'd2; 	
				end
				else begin
					last_blk_idx_6_r = 'd3;
				end 
			end	
		end
		else begin
			if(last_cbf_6_r[5:4]!='d0) begin
				if(last_cbf_6_r[4]!='d0)
					last_blk_idx_6_r = 'd4;
				else 
					last_blk_idx_6_r = 'd5;	
			end
			else begin	
				if(last_cbf_6_r[6]!='d0)
					last_blk_idx_6_r = 'd6;
				else 
					last_blk_idx_6_r = 'd7;
			end
		end
	end
	else
		last_blk_idx_6_r = 'hff;
end


always @* begin
	if(last_cbf_7_r[7:0]!='d0) begin					//left_top
		if(last_cbf_7_r[3:0]!='d0) begin
			if(last_cbf_7_r[1:0]!='d0) begin
				if(last_cbf_7_r[0]!='d0) begin
					last_blk_idx_7_r = 'd0;
				end
				else begin
					last_blk_idx_7_r = 'd1;
				end	
			end
			else begin
				if(last_cbf_7_r[2]!='d0) begin
					last_blk_idx_7_r = 'd2; 	
				end
				else begin
					last_blk_idx_7_r = 'd3;
				end 
			end	
		end
		else begin
			if(last_cbf_7_r[5:4]!='d0) begin
				if(last_cbf_7_r[4]!='d0)
					last_blk_idx_7_r = 'd4;
				else 
					last_blk_idx_7_r = 'd5;	
			end
			else begin	
				if(last_cbf_7_r[6]!='d0)
					last_blk_idx_7_r = 'd6;
				else 
					last_blk_idx_7_r = 'd7;
			end
		end
	end
	else
		last_blk_idx_7_r = 'hff;
end



//last_blk_idx_r, 0-->left_top, 64-->right_down
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		last_blk_idx_r <= 'd0;
	else if(tu_curr_state_r==TU_IDLE) begin
		if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
			case(cu_depth_i)
				'd0, 'd1:	begin		//32x32
							if(last_blk_idx_0_r!='h3f)							
								last_blk_idx_r <= 'd63 - last_blk_idx_0_r;
							else if(last_blk_idx_1_r!='h3f)
								last_blk_idx_r <= 'd55 - last_blk_idx_1_r;
							else if(last_blk_idx_2_r!='h3f)						
								last_blk_idx_r <= 'd47 - last_blk_idx_2_r;
							else if(last_blk_idx_3_r!='h3f)
								last_blk_idx_r <= 'd39 - last_blk_idx_3_r;
							else if(last_blk_idx_4_r!='h3f)
								last_blk_idx_r <= 'd31 - last_blk_idx_4_r;
							else if(last_blk_idx_5_r!='h3f)
								last_blk_idx_r <= 'd23 - last_blk_idx_5_r;
							else if(last_blk_idx_6_r!='h3f)
								last_blk_idx_r <= 'd15 - last_blk_idx_6_r;
							else if(last_blk_idx_7_r!='h3f)
								last_blk_idx_r <= 'd7 - last_blk_idx_7_r;
							else 
								last_blk_idx_r <= 'd0;   
				end
				
				'd2:	begin			//16x16
							if(last_blk_idx_0_r!='h3f)
								last_blk_idx_r <= 'd15 - last_blk_idx_0_r;
							else if(last_blk_idx_1_r!='h3f)
								last_blk_idx_r <= 'd7 - last_blk_idx_1_r;
							else 
								last_blk_idx_r <= 'd0;
				end
				
				'd3:	begin			//8x8
							if(last_blk_idx_0_r!='h3f)
								last_blk_idx_r <= 'd3 - last_blk_idx_0_r;
							else 
								last_blk_idx_r <= 'd0;
				end
				
				default:begin
							last_blk_idx_r <= 'd0;
				end
			endcase	
		end
		else begin
			case(cu_depth_i)
				'd0, 'd1:	begin		//16x16
							if(last_blk_idx_0_r!='h3f)
								last_blk_idx_r <= 'd15 - last_blk_idx_0_r;
							else if(last_blk_idx_1_r!='h3f)
								last_blk_idx_r <= 'd7 - last_blk_idx_1_r;
							else 
								last_blk_idx_r <= 'd0;
				end
				
				'd2:	begin			//8x8
							if(last_blk_idx_0_r!='h3f)
								last_blk_idx_r <= 'd3 - last_blk_idx_0_r;
							else 
								last_blk_idx_r <= 'd0;
				end
				
				'd3:	begin			//4x4
							last_blk_idx_r <= 'd0;
				end
				
				default:begin
							last_blk_idx_r <= 'd0;
				end
			endcase	
		end
	end
	else 
		last_blk_idx_r <= last_blk_idx_r;
end

//blk_tot_r
always @* begin
	if(~tu_en_w)
		blk_tot_r = 'd0;
	else
		blk_tot_r = last_blk_idx_r;
end


//blk_cbf_idx_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		blk_cbf_idx_r <= 'd0;
	else if(tu_curr_state_r==TU_LAST_SIG_0) begin        
		blk_cbf_idx_r <= last_blk_idx_r + 'd1;
	end
	else if(blk_e_done_r) begin            
		blk_cbf_idx_r <= blk_cbf_idx_r - 'd1;    
	end
	else 
		blk_cbf_idx_r <= blk_cbf_idx_r;
end

always @* begin
	if(slice_type_i==(`SLICE_TYPE_P))
		scan_idx_r = `SCAN_DIAG;
	else begin
		if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
			if(cu_depth_i=='d3)
				scan_idx_r = (intra_luma_mode_i>='d22 && intra_luma_mode_i<='d30) ? (`SCAN_HOR) : 
							 ((intra_luma_mode_i>='d6 && intra_luma_mode_i<='d14) ? (`SCAN_VER) : (`SCAN_DIAG));	
			else 
				scan_idx_r = `SCAN_DIAG;			
		end
		else begin
			if(cu_depth_i=='d3) begin
				if(intra_chroma_mode_i=='d36)
					scan_idx_r = (intra_luma_mode_i>='d22 && intra_luma_mode_i<='d30) ? (`SCAN_HOR) : 
							     ((intra_luma_mode_i>='d6 && intra_luma_mode_i<='d14) ? (`SCAN_VER) : (`SCAN_DIAG));	
				else
					scan_idx_r = (intra_chroma_mode_i>='d22 && intra_chroma_mode_i<='d30) ? (`SCAN_HOR) : 
							 	 ((intra_chroma_mode_i>='d6 && intra_chroma_mode_i<='d14) ? (`SCAN_VER) : (`SCAN_DIAG));	
			end
			else 
				scan_idx_r = `SCAN_DIAG;
		end
	end	
end



//luma cbf 32x32, zcan to diag scan
assign	tu_cbf_z2s_luma32x32_w[ 0] = tu_32x32_luma_cbf_r[ 0];
assign	tu_cbf_z2s_luma32x32_w[ 1] = tu_32x32_luma_cbf_r[ 2];
assign	tu_cbf_z2s_luma32x32_w[ 2] = tu_32x32_luma_cbf_r[ 1];
assign	tu_cbf_z2s_luma32x32_w[ 3] = tu_32x32_luma_cbf_r[ 8];
assign	tu_cbf_z2s_luma32x32_w[ 4] = tu_32x32_luma_cbf_r[ 3];
assign	tu_cbf_z2s_luma32x32_w[ 5] = tu_32x32_luma_cbf_r[ 4];
assign	tu_cbf_z2s_luma32x32_w[ 6] = tu_32x32_luma_cbf_r[10];
assign	tu_cbf_z2s_luma32x32_w[ 7] = tu_32x32_luma_cbf_r[ 9];
assign	tu_cbf_z2s_luma32x32_w[ 8] = tu_32x32_luma_cbf_r[ 6];
assign	tu_cbf_z2s_luma32x32_w[ 9] = tu_32x32_luma_cbf_r[ 5];
assign	tu_cbf_z2s_luma32x32_w[10] = tu_32x32_luma_cbf_r[32];
assign	tu_cbf_z2s_luma32x32_w[11] = tu_32x32_luma_cbf_r[11];
assign	tu_cbf_z2s_luma32x32_w[12] = tu_32x32_luma_cbf_r[12];
assign	tu_cbf_z2s_luma32x32_w[13] = tu_32x32_luma_cbf_r[ 7];
assign	tu_cbf_z2s_luma32x32_w[14] = tu_32x32_luma_cbf_r[16];
assign	tu_cbf_z2s_luma32x32_w[15] = tu_32x32_luma_cbf_r[34];
assign	tu_cbf_z2s_luma32x32_w[16] = tu_32x32_luma_cbf_r[33];
assign	tu_cbf_z2s_luma32x32_w[17] = tu_32x32_luma_cbf_r[14];
assign	tu_cbf_z2s_luma32x32_w[18] = tu_32x32_luma_cbf_r[13];
assign	tu_cbf_z2s_luma32x32_w[19] = tu_32x32_luma_cbf_r[18];
assign	tu_cbf_z2s_luma32x32_w[20] = tu_32x32_luma_cbf_r[17];
assign	tu_cbf_z2s_luma32x32_w[21] = tu_32x32_luma_cbf_r[40];
assign	tu_cbf_z2s_luma32x32_w[22] = tu_32x32_luma_cbf_r[35];
assign	tu_cbf_z2s_luma32x32_w[23] = tu_32x32_luma_cbf_r[36];
assign	tu_cbf_z2s_luma32x32_w[24] = tu_32x32_luma_cbf_r[15];
assign	tu_cbf_z2s_luma32x32_w[25] = tu_32x32_luma_cbf_r[24];
assign	tu_cbf_z2s_luma32x32_w[26] = tu_32x32_luma_cbf_r[19];
assign	tu_cbf_z2s_luma32x32_w[27] = tu_32x32_luma_cbf_r[20];
assign	tu_cbf_z2s_luma32x32_w[28] = tu_32x32_luma_cbf_r[42];
assign	tu_cbf_z2s_luma32x32_w[29] = tu_32x32_luma_cbf_r[41];
assign	tu_cbf_z2s_luma32x32_w[30] = tu_32x32_luma_cbf_r[38];
assign	tu_cbf_z2s_luma32x32_w[31] = tu_32x32_luma_cbf_r[37];
assign	tu_cbf_z2s_luma32x32_w[32] = tu_32x32_luma_cbf_r[26];
assign	tu_cbf_z2s_luma32x32_w[33] = tu_32x32_luma_cbf_r[25];
assign	tu_cbf_z2s_luma32x32_w[34] = tu_32x32_luma_cbf_r[22];
assign	tu_cbf_z2s_luma32x32_w[35] = tu_32x32_luma_cbf_r[21];
assign	tu_cbf_z2s_luma32x32_w[36] = tu_32x32_luma_cbf_r[43];
assign	tu_cbf_z2s_luma32x32_w[37] = tu_32x32_luma_cbf_r[44];
assign	tu_cbf_z2s_luma32x32_w[38] = tu_32x32_luma_cbf_r[39];
assign	tu_cbf_z2s_luma32x32_w[39] = tu_32x32_luma_cbf_r[48];
assign	tu_cbf_z2s_luma32x32_w[40] = tu_32x32_luma_cbf_r[27];
assign	tu_cbf_z2s_luma32x32_w[41] = tu_32x32_luma_cbf_r[28];
assign	tu_cbf_z2s_luma32x32_w[42] = tu_32x32_luma_cbf_r[23];
assign	tu_cbf_z2s_luma32x32_w[43] = tu_32x32_luma_cbf_r[46];
assign	tu_cbf_z2s_luma32x32_w[44] = tu_32x32_luma_cbf_r[45];
assign	tu_cbf_z2s_luma32x32_w[45] = tu_32x32_luma_cbf_r[50];
assign	tu_cbf_z2s_luma32x32_w[46] = tu_32x32_luma_cbf_r[49];
assign	tu_cbf_z2s_luma32x32_w[47] = tu_32x32_luma_cbf_r[30];
assign	tu_cbf_z2s_luma32x32_w[48] = tu_32x32_luma_cbf_r[29];
assign	tu_cbf_z2s_luma32x32_w[49] = tu_32x32_luma_cbf_r[47];
assign	tu_cbf_z2s_luma32x32_w[50] = tu_32x32_luma_cbf_r[56];
assign	tu_cbf_z2s_luma32x32_w[51] = tu_32x32_luma_cbf_r[51];
assign	tu_cbf_z2s_luma32x32_w[52] = tu_32x32_luma_cbf_r[52];
assign	tu_cbf_z2s_luma32x32_w[53] = tu_32x32_luma_cbf_r[31];
assign	tu_cbf_z2s_luma32x32_w[54] = tu_32x32_luma_cbf_r[58];
assign	tu_cbf_z2s_luma32x32_w[55] = tu_32x32_luma_cbf_r[57];
assign	tu_cbf_z2s_luma32x32_w[56] = tu_32x32_luma_cbf_r[54];
assign	tu_cbf_z2s_luma32x32_w[57] = tu_32x32_luma_cbf_r[53];
assign	tu_cbf_z2s_luma32x32_w[58] = tu_32x32_luma_cbf_r[59];
assign	tu_cbf_z2s_luma32x32_w[59] = tu_32x32_luma_cbf_r[60];
assign	tu_cbf_z2s_luma32x32_w[60] = tu_32x32_luma_cbf_r[55];
assign	tu_cbf_z2s_luma32x32_w[61] = tu_32x32_luma_cbf_r[62];
assign	tu_cbf_z2s_luma32x32_w[62] = tu_32x32_luma_cbf_r[61];
assign	tu_cbf_z2s_luma32x32_w[63] = tu_32x32_luma_cbf_r[63];


//luma cbf 16x16, zcan to diag scan
assign	tu_cbf_z2s_luma16x16_w[ 0] = tu_16x16_luma_cbf_r[ 0];
assign	tu_cbf_z2s_luma16x16_w[ 1] = tu_16x16_luma_cbf_r[ 2];
assign	tu_cbf_z2s_luma16x16_w[ 2] = tu_16x16_luma_cbf_r[ 1];
assign	tu_cbf_z2s_luma16x16_w[ 3] = tu_16x16_luma_cbf_r[ 8];
assign	tu_cbf_z2s_luma16x16_w[ 4] = tu_16x16_luma_cbf_r[ 3];
assign	tu_cbf_z2s_luma16x16_w[ 5] = tu_16x16_luma_cbf_r[ 4];
assign	tu_cbf_z2s_luma16x16_w[ 6] = tu_16x16_luma_cbf_r[10];
assign	tu_cbf_z2s_luma16x16_w[ 7] = tu_16x16_luma_cbf_r[ 9];
assign	tu_cbf_z2s_luma16x16_w[ 8] = tu_16x16_luma_cbf_r[ 6];
assign	tu_cbf_z2s_luma16x16_w[ 9] = tu_16x16_luma_cbf_r[ 5];
assign	tu_cbf_z2s_luma16x16_w[10] = tu_16x16_luma_cbf_r[11];
assign	tu_cbf_z2s_luma16x16_w[11] = tu_16x16_luma_cbf_r[12];
assign	tu_cbf_z2s_luma16x16_w[12] = tu_16x16_luma_cbf_r[ 7];
assign	tu_cbf_z2s_luma16x16_w[13] = tu_16x16_luma_cbf_r[14];
assign	tu_cbf_z2s_luma16x16_w[14] = tu_16x16_luma_cbf_r[13];
assign	tu_cbf_z2s_luma16x16_w[15] = tu_16x16_luma_cbf_r[15];


//luma cbf 8x8, zcan to scan_idx scan
always @* begin
	case(scan_idx_r)
		(`SCAN_HOR):	begin
							tu_cbf_z2s_luma8x8_r[0] = tu_8x8_luma_cbf_r[0];
							tu_cbf_z2s_luma8x8_r[1] = tu_8x8_luma_cbf_r[1];
							tu_cbf_z2s_luma8x8_r[2] = tu_8x8_luma_cbf_r[2];
							tu_cbf_z2s_luma8x8_r[3] = tu_8x8_luma_cbf_r[3];
		end
		
		(`SCAN_VER):	begin
							tu_cbf_z2s_luma8x8_r[0] = tu_8x8_luma_cbf_r[0];
							tu_cbf_z2s_luma8x8_r[1] = tu_8x8_luma_cbf_r[2];
							tu_cbf_z2s_luma8x8_r[2] = tu_8x8_luma_cbf_r[1];
							tu_cbf_z2s_luma8x8_r[3] = tu_8x8_luma_cbf_r[3];
		end
		
		default:		begin
							tu_cbf_z2s_luma8x8_r[0] = tu_8x8_luma_cbf_r[0];
							tu_cbf_z2s_luma8x8_r[1] = tu_8x8_luma_cbf_r[2];
							tu_cbf_z2s_luma8x8_r[2] = tu_8x8_luma_cbf_r[1];
							tu_cbf_z2s_luma8x8_r[3] = tu_8x8_luma_cbf_r[3];
		end
	endcase	
end

//tu_cbf_luma righter
assign	tu_cbf_z2s_luma32x32_rer_w[ 0] = tu_32x32_luma_cbf_r[ 1];
assign	tu_cbf_z2s_luma32x32_rer_w[ 1] = tu_32x32_luma_cbf_r[ 3];
assign	tu_cbf_z2s_luma32x32_rer_w[ 2] = tu_32x32_luma_cbf_r[ 4];
assign	tu_cbf_z2s_luma32x32_rer_w[ 3] = tu_32x32_luma_cbf_r[ 9];
assign	tu_cbf_z2s_luma32x32_rer_w[ 4] = tu_32x32_luma_cbf_r[ 6];
assign	tu_cbf_z2s_luma32x32_rer_w[ 5] = tu_32x32_luma_cbf_r[ 5];
assign	tu_cbf_z2s_luma32x32_rer_w[ 6] = tu_32x32_luma_cbf_r[11];
assign	tu_cbf_z2s_luma32x32_rer_w[ 7] = tu_32x32_luma_cbf_r[12];
assign	tu_cbf_z2s_luma32x32_rer_w[ 8] = tu_32x32_luma_cbf_r[ 7];
assign	tu_cbf_z2s_luma32x32_rer_w[ 9] = tu_32x32_luma_cbf_r[16];
assign	tu_cbf_z2s_luma32x32_rer_w[10] = tu_32x32_luma_cbf_r[33];
assign	tu_cbf_z2s_luma32x32_rer_w[11] = tu_32x32_luma_cbf_r[14];
assign	tu_cbf_z2s_luma32x32_rer_w[12] = tu_32x32_luma_cbf_r[13];
assign	tu_cbf_z2s_luma32x32_rer_w[13] = tu_32x32_luma_cbf_r[18];
assign	tu_cbf_z2s_luma32x32_rer_w[14] = tu_32x32_luma_cbf_r[17];
assign	tu_cbf_z2s_luma32x32_rer_w[15] = tu_32x32_luma_cbf_r[35];
assign	tu_cbf_z2s_luma32x32_rer_w[16] = tu_32x32_luma_cbf_r[36];
assign	tu_cbf_z2s_luma32x32_rer_w[17] = tu_32x32_luma_cbf_r[15];
assign	tu_cbf_z2s_luma32x32_rer_w[18] = tu_32x32_luma_cbf_r[24];
assign	tu_cbf_z2s_luma32x32_rer_w[19] = tu_32x32_luma_cbf_r[19];
assign	tu_cbf_z2s_luma32x32_rer_w[20] = tu_32x32_luma_cbf_r[20];
assign	tu_cbf_z2s_luma32x32_rer_w[21] = tu_32x32_luma_cbf_r[41];
assign	tu_cbf_z2s_luma32x32_rer_w[22] = tu_32x32_luma_cbf_r[38];
assign	tu_cbf_z2s_luma32x32_rer_w[23] = tu_32x32_luma_cbf_r[37];
assign	tu_cbf_z2s_luma32x32_rer_w[24] = tu_32x32_luma_cbf_r[26];
assign	tu_cbf_z2s_luma32x32_rer_w[25] = tu_32x32_luma_cbf_r[25];
assign	tu_cbf_z2s_luma32x32_rer_w[26] = tu_32x32_luma_cbf_r[22];
assign	tu_cbf_z2s_luma32x32_rer_w[27] = tu_32x32_luma_cbf_r[21];
assign	tu_cbf_z2s_luma32x32_rer_w[28] = tu_32x32_luma_cbf_r[43];
assign	tu_cbf_z2s_luma32x32_rer_w[29] = tu_32x32_luma_cbf_r[44];
assign	tu_cbf_z2s_luma32x32_rer_w[30] = tu_32x32_luma_cbf_r[39];
assign	tu_cbf_z2s_luma32x32_rer_w[31] = tu_32x32_luma_cbf_r[48];
assign	tu_cbf_z2s_luma32x32_rer_w[32] = tu_32x32_luma_cbf_r[27];
assign	tu_cbf_z2s_luma32x32_rer_w[33] = tu_32x32_luma_cbf_r[28];
assign	tu_cbf_z2s_luma32x32_rer_w[34] = tu_32x32_luma_cbf_r[23];
assign	tu_cbf_z2s_luma32x32_rer_w[35] = 'd0;//tu_32x32_luma_cbf_r[];
assign	tu_cbf_z2s_luma32x32_rer_w[36] = tu_32x32_luma_cbf_r[46];
assign	tu_cbf_z2s_luma32x32_rer_w[37] = tu_32x32_luma_cbf_r[45];
assign	tu_cbf_z2s_luma32x32_rer_w[38] = tu_32x32_luma_cbf_r[50];
assign	tu_cbf_z2s_luma32x32_rer_w[39] = tu_32x32_luma_cbf_r[49];
assign	tu_cbf_z2s_luma32x32_rer_w[40] = tu_32x32_luma_cbf_r[30];
assign	tu_cbf_z2s_luma32x32_rer_w[41] = tu_32x32_luma_cbf_r[29];
assign	tu_cbf_z2s_luma32x32_rer_w[42] = 'd0;//tu_32x32_luma_cbf_r[50];  
assign	tu_cbf_z2s_luma32x32_rer_w[43] = tu_32x32_luma_cbf_r[47];        
assign	tu_cbf_z2s_luma32x32_rer_w[44] = tu_32x32_luma_cbf_r[56];        
assign	tu_cbf_z2s_luma32x32_rer_w[45] = tu_32x32_luma_cbf_r[51];        
assign	tu_cbf_z2s_luma32x32_rer_w[46] = tu_32x32_luma_cbf_r[52];        
assign	tu_cbf_z2s_luma32x32_rer_w[47] = tu_32x32_luma_cbf_r[31];        
assign	tu_cbf_z2s_luma32x32_rer_w[48] = 'd0;//tu_32x32_luma_cbf_r[];    
assign	tu_cbf_z2s_luma32x32_rer_w[49] = tu_32x32_luma_cbf_r[58];        
assign	tu_cbf_z2s_luma32x32_rer_w[50] = tu_32x32_luma_cbf_r[57];        
assign	tu_cbf_z2s_luma32x32_rer_w[51] = tu_32x32_luma_cbf_r[54];        
assign	tu_cbf_z2s_luma32x32_rer_w[52] = tu_32x32_luma_cbf_r[53];        
assign	tu_cbf_z2s_luma32x32_rer_w[53] = 'd0;//tu_32x32_luma_cbf_r[];    
assign	tu_cbf_z2s_luma32x32_rer_w[54] = tu_32x32_luma_cbf_r[59];        
assign	tu_cbf_z2s_luma32x32_rer_w[55] = tu_32x32_luma_cbf_r[60];        
assign	tu_cbf_z2s_luma32x32_rer_w[56] = tu_32x32_luma_cbf_r[55];        
assign	tu_cbf_z2s_luma32x32_rer_w[57] = 'd0;//tu_32x32_luma_cbf_r[59];  
assign	tu_cbf_z2s_luma32x32_rer_w[58] = tu_32x32_luma_cbf_r[62];        
assign	tu_cbf_z2s_luma32x32_rer_w[59] = tu_32x32_luma_cbf_r[61];        
assign	tu_cbf_z2s_luma32x32_rer_w[60] = 'd0;//tu_32x32_luma_cbf_r[62];  
assign	tu_cbf_z2s_luma32x32_rer_w[61] = tu_32x32_luma_cbf_r[63];        
assign	tu_cbf_z2s_luma32x32_rer_w[62] = 'd0;//tu_32x32_luma_cbf_r[63];    
assign	tu_cbf_z2s_luma32x32_rer_w[63] = 'd0;



assign	tu_cbf_z2s_luma16x16_rer_w[ 0] = tu_16x16_luma_cbf_r[ 1];
assign	tu_cbf_z2s_luma16x16_rer_w[ 1] = tu_16x16_luma_cbf_r[ 3];
assign	tu_cbf_z2s_luma16x16_rer_w[ 2] = tu_16x16_luma_cbf_r[ 4];
assign	tu_cbf_z2s_luma16x16_rer_w[ 3] = tu_16x16_luma_cbf_r[ 9];
assign	tu_cbf_z2s_luma16x16_rer_w[ 4] = tu_16x16_luma_cbf_r[ 6];
assign	tu_cbf_z2s_luma16x16_rer_w[ 5] = tu_16x16_luma_cbf_r[ 5];
assign	tu_cbf_z2s_luma16x16_rer_w[ 6] = tu_16x16_luma_cbf_r[11];
assign	tu_cbf_z2s_luma16x16_rer_w[ 7] = tu_16x16_luma_cbf_r[12];
assign	tu_cbf_z2s_luma16x16_rer_w[ 8] = tu_16x16_luma_cbf_r[ 7];
assign	tu_cbf_z2s_luma16x16_rer_w[ 9] = 'd0;//tu_16x16_luma_cbf_r[];
assign	tu_cbf_z2s_luma16x16_rer_w[10] = tu_16x16_luma_cbf_r[14];
assign	tu_cbf_z2s_luma16x16_rer_w[11] = tu_16x16_luma_cbf_r[13];
assign	tu_cbf_z2s_luma16x16_rer_w[12] = 'd0;//tu_16x16_luma_cbf_r[];
assign	tu_cbf_z2s_luma16x16_rer_w[13] = tu_16x16_luma_cbf_r[15];
assign	tu_cbf_z2s_luma16x16_rer_w[14] = 'd0;//tu_16x16_luma_cbf_r[];
assign	tu_cbf_z2s_luma16x16_rer_w[15] = 'd0;//tu_16x16_luma_cbf_r[15];


always @* begin
	case(scan_idx_r) 
		(`SCAN_HOR):	begin
							tu_cbf_z2s_luma8x8_rer_r[ 0] = tu_8x8_luma_cbf_r[ 1];
							tu_cbf_z2s_luma8x8_rer_r[ 1] = 'd0;//tu_8x8_luma_cbf_r[ 3];
							tu_cbf_z2s_luma8x8_rer_r[ 2] = tu_8x8_luma_cbf_r[ 3];
							tu_cbf_z2s_luma8x8_rer_r[ 3] = 'd0;//tu_8x8_luma_cbf_r[  ];
		end
		
		default:		begin
							tu_cbf_z2s_luma8x8_rer_r[ 0] = tu_8x8_luma_cbf_r[ 1];
							tu_cbf_z2s_luma8x8_rer_r[ 1] = tu_8x8_luma_cbf_r[ 3];
							tu_cbf_z2s_luma8x8_rer_r[ 2] = 'd0;//tu_8x8_luma_cbf_r[ 3];
							tu_cbf_z2s_luma8x8_rer_r[ 3] = 'd0;//tu_8x8_luma_cbf_r[  ];
		end
	endcase
end

//tu_cbf_luma lower

assign	tu_cbf_z2s_luma32x32_ler_w[ 0] = tu_32x32_luma_cbf_r[ 2];
assign	tu_cbf_z2s_luma32x32_ler_w[ 1] = tu_32x32_luma_cbf_r[ 8];
assign	tu_cbf_z2s_luma32x32_ler_w[ 2] = tu_32x32_luma_cbf_r[ 3];
assign	tu_cbf_z2s_luma32x32_ler_w[ 3] = tu_32x32_luma_cbf_r[10];
assign	tu_cbf_z2s_luma32x32_ler_w[ 4] = tu_32x32_luma_cbf_r[ 9];
assign	tu_cbf_z2s_luma32x32_ler_w[ 5] = tu_32x32_luma_cbf_r[ 6];
assign	tu_cbf_z2s_luma32x32_ler_w[ 6] = tu_32x32_luma_cbf_r[32];
assign	tu_cbf_z2s_luma32x32_ler_w[ 7] = tu_32x32_luma_cbf_r[11];
assign	tu_cbf_z2s_luma32x32_ler_w[ 8] = tu_32x32_luma_cbf_r[12];
assign	tu_cbf_z2s_luma32x32_ler_w[ 9] = tu_32x32_luma_cbf_r[ 7];
assign	tu_cbf_z2s_luma32x32_ler_w[10] = tu_32x32_luma_cbf_r[34];
assign	tu_cbf_z2s_luma32x32_ler_w[11] = tu_32x32_luma_cbf_r[33];
assign	tu_cbf_z2s_luma32x32_ler_w[12] = tu_32x32_luma_cbf_r[14];
assign	tu_cbf_z2s_luma32x32_ler_w[13] = tu_32x32_luma_cbf_r[13];
assign	tu_cbf_z2s_luma32x32_ler_w[14] = tu_32x32_luma_cbf_r[18];
assign	tu_cbf_z2s_luma32x32_ler_w[15] = tu_32x32_luma_cbf_r[40];
assign	tu_cbf_z2s_luma32x32_ler_w[16] = tu_32x32_luma_cbf_r[35];
assign	tu_cbf_z2s_luma32x32_ler_w[17] = tu_32x32_luma_cbf_r[36];
assign	tu_cbf_z2s_luma32x32_ler_w[18] = tu_32x32_luma_cbf_r[15];
assign	tu_cbf_z2s_luma32x32_ler_w[19] = tu_32x32_luma_cbf_r[24];
assign	tu_cbf_z2s_luma32x32_ler_w[20] = tu_32x32_luma_cbf_r[19];
assign	tu_cbf_z2s_luma32x32_ler_w[21] = tu_32x32_luma_cbf_r[42];
assign	tu_cbf_z2s_luma32x32_ler_w[22] = tu_32x32_luma_cbf_r[41];
assign	tu_cbf_z2s_luma32x32_ler_w[23] = tu_32x32_luma_cbf_r[38];
assign	tu_cbf_z2s_luma32x32_ler_w[24] = tu_32x32_luma_cbf_r[37];
assign	tu_cbf_z2s_luma32x32_ler_w[25] = tu_32x32_luma_cbf_r[26];
assign	tu_cbf_z2s_luma32x32_ler_w[26] = tu_32x32_luma_cbf_r[25];
assign	tu_cbf_z2s_luma32x32_ler_w[27] = tu_32x32_luma_cbf_r[22];
assign	tu_cbf_z2s_luma32x32_ler_w[28] = 'd0;//tu_32x32_luma_cbf_r[];
assign	tu_cbf_z2s_luma32x32_ler_w[29] = tu_32x32_luma_cbf_r[43];
assign	tu_cbf_z2s_luma32x32_ler_w[30] = tu_32x32_luma_cbf_r[44];
assign	tu_cbf_z2s_luma32x32_ler_w[31] = tu_32x32_luma_cbf_r[39];
assign	tu_cbf_z2s_luma32x32_ler_w[32] = tu_32x32_luma_cbf_r[48];
assign	tu_cbf_z2s_luma32x32_ler_w[33] = tu_32x32_luma_cbf_r[27];
assign	tu_cbf_z2s_luma32x32_ler_w[34] = tu_32x32_luma_cbf_r[28];
assign	tu_cbf_z2s_luma32x32_ler_w[35] = tu_32x32_luma_cbf_r[23];
assign	tu_cbf_z2s_luma32x32_ler_w[36] = 'd0;//tu_32x32_luma_cbf_r[];
assign	tu_cbf_z2s_luma32x32_ler_w[37] = tu_32x32_luma_cbf_r[46];
assign	tu_cbf_z2s_luma32x32_ler_w[38] = tu_32x32_luma_cbf_r[45];
assign	tu_cbf_z2s_luma32x32_ler_w[39] = tu_32x32_luma_cbf_r[50];
assign	tu_cbf_z2s_luma32x32_ler_w[40] = tu_32x32_luma_cbf_r[49];
assign	tu_cbf_z2s_luma32x32_ler_w[41] = tu_32x32_luma_cbf_r[30];
assign	tu_cbf_z2s_luma32x32_ler_w[42] = tu_32x32_luma_cbf_r[29];  
assign	tu_cbf_z2s_luma32x32_ler_w[43] = 'd0;//tu_32x32_luma_cbf_r[];        
assign	tu_cbf_z2s_luma32x32_ler_w[44] = tu_32x32_luma_cbf_r[47];        
assign	tu_cbf_z2s_luma32x32_ler_w[45] = tu_32x32_luma_cbf_r[56];        
assign	tu_cbf_z2s_luma32x32_ler_w[46] = tu_32x32_luma_cbf_r[51];        
assign	tu_cbf_z2s_luma32x32_ler_w[47] = tu_32x32_luma_cbf_r[52];        
assign	tu_cbf_z2s_luma32x32_ler_w[48] = tu_32x32_luma_cbf_r[31];    
assign	tu_cbf_z2s_luma32x32_ler_w[49] = 'd0;//tu_32x32_luma_cbf_r[58];        
assign	tu_cbf_z2s_luma32x32_ler_w[50] = tu_32x32_luma_cbf_r[58];        
assign	tu_cbf_z2s_luma32x32_ler_w[51] = tu_32x32_luma_cbf_r[57];        
assign	tu_cbf_z2s_luma32x32_ler_w[52] = tu_32x32_luma_cbf_r[54];        
assign	tu_cbf_z2s_luma32x32_ler_w[53] = tu_32x32_luma_cbf_r[53];    
assign	tu_cbf_z2s_luma32x32_ler_w[54] = 'd0;//tu_32x32_luma_cbf_r[59];        
assign	tu_cbf_z2s_luma32x32_ler_w[55] = tu_32x32_luma_cbf_r[59];        
assign	tu_cbf_z2s_luma32x32_ler_w[56] = tu_32x32_luma_cbf_r[60];        
assign	tu_cbf_z2s_luma32x32_ler_w[57] = tu_32x32_luma_cbf_r[55];  
assign	tu_cbf_z2s_luma32x32_ler_w[58] = 'd0;//tu_32x32_luma_cbf_r[62];        
assign	tu_cbf_z2s_luma32x32_ler_w[59] = tu_32x32_luma_cbf_r[62];        
assign	tu_cbf_z2s_luma32x32_ler_w[60] = tu_32x32_luma_cbf_r[61];  
assign	tu_cbf_z2s_luma32x32_ler_w[61] = 'd0;//tu_32x32_luma_cbf_r[63];        
assign	tu_cbf_z2s_luma32x32_ler_w[62] = tu_32x32_luma_cbf_r[63];    
assign	tu_cbf_z2s_luma32x32_ler_w[63] = 'd0;



assign	tu_cbf_z2s_luma16x16_ler_w[ 0] = tu_16x16_luma_cbf_r[ 2];
assign	tu_cbf_z2s_luma16x16_ler_w[ 1] = tu_16x16_luma_cbf_r[ 8];
assign	tu_cbf_z2s_luma16x16_ler_w[ 2] = tu_16x16_luma_cbf_r[ 3];
assign	tu_cbf_z2s_luma16x16_ler_w[ 3] = tu_16x16_luma_cbf_r[10];
assign	tu_cbf_z2s_luma16x16_ler_w[ 4] = tu_16x16_luma_cbf_r[ 9];
assign	tu_cbf_z2s_luma16x16_ler_w[ 5] = tu_16x16_luma_cbf_r[ 6];
assign	tu_cbf_z2s_luma16x16_ler_w[ 6] = 'd0;//tu_16x16_luma_cbf_r[11];
assign	tu_cbf_z2s_luma16x16_ler_w[ 7] = tu_16x16_luma_cbf_r[11];
assign	tu_cbf_z2s_luma16x16_ler_w[ 8] = tu_16x16_luma_cbf_r[12];
assign	tu_cbf_z2s_luma16x16_ler_w[ 9] = tu_16x16_luma_cbf_r[ 7];
assign	tu_cbf_z2s_luma16x16_ler_w[10] = 'd0;//tu_16x16_luma_cbf_r[14];
assign	tu_cbf_z2s_luma16x16_ler_w[11] = tu_16x16_luma_cbf_r[14];
assign	tu_cbf_z2s_luma16x16_ler_w[12] = tu_16x16_luma_cbf_r[13];
assign	tu_cbf_z2s_luma16x16_ler_w[13] = 'd0;//tu_16x16_luma_cbf_r[15];
assign	tu_cbf_z2s_luma16x16_ler_w[14] = tu_16x16_luma_cbf_r[15];
assign	tu_cbf_z2s_luma16x16_ler_w[15] = 'd0;//tu_16x16_luma_cbf_r[15];


always @* begin
	case(scan_idx_r) 
		(`SCAN_HOR):	begin
							tu_cbf_z2s_luma8x8_ler_r[ 0] = tu_8x8_luma_cbf_r[ 2];
							tu_cbf_z2s_luma8x8_ler_r[ 1] = tu_8x8_luma_cbf_r[ 3];
							tu_cbf_z2s_luma8x8_ler_r[ 2] = 'd0;//tu_8x8_luma_cbf_r[ 3];
							tu_cbf_z2s_luma8x8_ler_r[ 3] = 'd0;//tu_8x8_luma_cbf_r[  ];
		end
		
		default:		begin
							tu_cbf_z2s_luma8x8_ler_r[ 0] = tu_8x8_luma_cbf_r[ 2];
							tu_cbf_z2s_luma8x8_ler_r[ 1] = 'd0;//tu_8x8_luma_cbf_r[ 3];
							tu_cbf_z2s_luma8x8_ler_r[ 2] = tu_8x8_luma_cbf_r[ 3];
							tu_cbf_z2s_luma8x8_ler_r[ 3] = 'd0;//tu_8x8_luma_cbf_r[  ];
		end
	endcase
end


//cr cbf 16x16, zscan to scan_idx scan
assign	tu_cbf_z2s_cr16x16_w[ 0] = tu_16x16_cr_cbf_r[ 0];
assign	tu_cbf_z2s_cr16x16_w[ 1] = tu_16x16_cr_cbf_r[ 2];
assign	tu_cbf_z2s_cr16x16_w[ 2] = tu_16x16_cr_cbf_r[ 1];
assign	tu_cbf_z2s_cr16x16_w[ 3] = tu_16x16_cr_cbf_r[ 8];
assign	tu_cbf_z2s_cr16x16_w[ 4] = tu_16x16_cr_cbf_r[ 3];
assign	tu_cbf_z2s_cr16x16_w[ 5] = tu_16x16_cr_cbf_r[ 4];
assign	tu_cbf_z2s_cr16x16_w[ 6] = tu_16x16_cr_cbf_r[10];
assign	tu_cbf_z2s_cr16x16_w[ 7] = tu_16x16_cr_cbf_r[ 9];
assign	tu_cbf_z2s_cr16x16_w[ 8] = tu_16x16_cr_cbf_r[ 6];
assign	tu_cbf_z2s_cr16x16_w[ 9] = tu_16x16_cr_cbf_r[ 5];
assign	tu_cbf_z2s_cr16x16_w[10] = tu_16x16_cr_cbf_r[11];
assign	tu_cbf_z2s_cr16x16_w[11] = tu_16x16_cr_cbf_r[12];
assign	tu_cbf_z2s_cr16x16_w[12] = tu_16x16_cr_cbf_r[ 7];
assign	tu_cbf_z2s_cr16x16_w[13] = tu_16x16_cr_cbf_r[14];
assign	tu_cbf_z2s_cr16x16_w[14] = tu_16x16_cr_cbf_r[13];
assign	tu_cbf_z2s_cr16x16_w[15] = tu_16x16_cr_cbf_r[15];


//cr cbf 8x8, zscan to scan_idx scan
assign	tu_cbf_z2s_cr8x8_w[0] = tu_8x8_cr_cbf_r[0];
assign	tu_cbf_z2s_cr8x8_w[1] = tu_8x8_cr_cbf_r[2];
assign	tu_cbf_z2s_cr8x8_w[2] = tu_8x8_cr_cbf_r[1];
assign	tu_cbf_z2s_cr8x8_w[3] = tu_8x8_cr_cbf_r[3];


//cr cbf 4x4
assign	tu_cbf_z2s_cr4x4_w = tu_4x4_cr_cbf_r;


//cr cbf righter
assign	tu_cbf_z2s_cr16x16_rer_w[ 0] = tu_16x16_cr_cbf_r[ 1];        
assign	tu_cbf_z2s_cr16x16_rer_w[ 1] = tu_16x16_cr_cbf_r[ 3];        
assign	tu_cbf_z2s_cr16x16_rer_w[ 2] = tu_16x16_cr_cbf_r[ 4];        
assign	tu_cbf_z2s_cr16x16_rer_w[ 3] = tu_16x16_cr_cbf_r[ 9];        
assign	tu_cbf_z2s_cr16x16_rer_w[ 4] = tu_16x16_cr_cbf_r[ 6];        
assign	tu_cbf_z2s_cr16x16_rer_w[ 5] = tu_16x16_cr_cbf_r[ 5];        
assign	tu_cbf_z2s_cr16x16_rer_w[ 6] = tu_16x16_cr_cbf_r[11];        
assign	tu_cbf_z2s_cr16x16_rer_w[ 7] = tu_16x16_cr_cbf_r[12];        
assign	tu_cbf_z2s_cr16x16_rer_w[ 8] = tu_16x16_cr_cbf_r[ 7];        
assign	tu_cbf_z2s_cr16x16_rer_w[ 9] = 'd0;//tu_16x16_cr_cbf_r[];    
assign	tu_cbf_z2s_cr16x16_rer_w[10] = tu_16x16_cr_cbf_r[14];        
assign	tu_cbf_z2s_cr16x16_rer_w[11] = tu_16x16_cr_cbf_r[13];        
assign	tu_cbf_z2s_cr16x16_rer_w[12] = 'd0;//tu_16x16_cr_cbf_r[];    
assign	tu_cbf_z2s_cr16x16_rer_w[13] = tu_16x16_cr_cbf_r[15];        
assign	tu_cbf_z2s_cr16x16_rer_w[14] = 'd0;//tu_16x16_cr_cbf_r[];    
assign	tu_cbf_z2s_cr16x16_rer_w[15] = 'd0;//tu_16x16_cr_cbf_r[15];  


assign	tu_cbf_z2s_cr8x8_rer_w[ 0] = tu_8x8_cr_cbf_r[ 1];
assign	tu_cbf_z2s_cr8x8_rer_w[ 1] = tu_8x8_cr_cbf_r[ 3];
assign	tu_cbf_z2s_cr8x8_rer_w[ 2] = 'd0;//tu_8x8_cr_cbf_r[  ];
assign	tu_cbf_z2s_cr8x8_rer_w[ 3] = 'd0;//tu_8x8_cr_cbf_r[  ];


assign	tu_cbf_z2s_cr4x4_rer_w = 'd0;	


//cr cbf lower
assign	tu_cbf_z2s_cr16x16_ler_w[ 0] = tu_16x16_cr_cbf_r[ 2];        
assign	tu_cbf_z2s_cr16x16_ler_w[ 1] = tu_16x16_cr_cbf_r[ 8];        
assign	tu_cbf_z2s_cr16x16_ler_w[ 2] = tu_16x16_cr_cbf_r[ 3];        
assign	tu_cbf_z2s_cr16x16_ler_w[ 3] = tu_16x16_cr_cbf_r[10];        
assign	tu_cbf_z2s_cr16x16_ler_w[ 4] = tu_16x16_cr_cbf_r[ 9];        
assign	tu_cbf_z2s_cr16x16_ler_w[ 5] = tu_16x16_cr_cbf_r[ 6];        
assign	tu_cbf_z2s_cr16x16_ler_w[ 6] = 'd0;//tu_16x16_cr_cbf_r[ ];        
assign	tu_cbf_z2s_cr16x16_ler_w[ 7] = tu_16x16_cr_cbf_r[11];        
assign	tu_cbf_z2s_cr16x16_ler_w[ 8] = tu_16x16_cr_cbf_r[12];        
assign	tu_cbf_z2s_cr16x16_ler_w[ 9] = tu_16x16_cr_cbf_r[ 7];    
assign	tu_cbf_z2s_cr16x16_ler_w[10] = 'd0;//tu_16x16_cr_cbf_r[14];        
assign	tu_cbf_z2s_cr16x16_ler_w[11] = tu_16x16_cr_cbf_r[14];        
assign	tu_cbf_z2s_cr16x16_ler_w[12] = tu_16x16_cr_cbf_r[13];    
assign	tu_cbf_z2s_cr16x16_ler_w[13] = 'd0;//tu_16x16_cr_cbf_r[15];        
assign	tu_cbf_z2s_cr16x16_ler_w[14] = tu_16x16_cr_cbf_r[15];    
assign	tu_cbf_z2s_cr16x16_ler_w[15] = 'd0;//tu_16x16_cr_cbf_r[15];  


assign	tu_cbf_z2s_cr8x8_ler_w[ 0] = tu_8x8_cr_cbf_r[ 2];
assign	tu_cbf_z2s_cr8x8_ler_w[ 1] = 'd0;//tu_8x8_cr_cbf_r[ ];
assign	tu_cbf_z2s_cr8x8_ler_w[ 2] = tu_8x8_cr_cbf_r[ 3];
assign	tu_cbf_z2s_cr8x8_ler_w[ 3] = 'd0;//tu_8x8_cr_cbf_r[ ];


assign	tu_cbf_z2s_cr4x4_ler_w = 'd0;




//cb cbf 16x16, zscan to scan_idx scan
assign	tu_cbf_z2s_cb16x16_w[ 0] = tu_16x16_cb_cbf_r[ 0];
assign	tu_cbf_z2s_cb16x16_w[ 1] = tu_16x16_cb_cbf_r[ 2];
assign	tu_cbf_z2s_cb16x16_w[ 2] = tu_16x16_cb_cbf_r[ 1];
assign	tu_cbf_z2s_cb16x16_w[ 3] = tu_16x16_cb_cbf_r[ 8];
assign	tu_cbf_z2s_cb16x16_w[ 4] = tu_16x16_cb_cbf_r[ 3];
assign	tu_cbf_z2s_cb16x16_w[ 5] = tu_16x16_cb_cbf_r[ 4];
assign	tu_cbf_z2s_cb16x16_w[ 6] = tu_16x16_cb_cbf_r[10];
assign	tu_cbf_z2s_cb16x16_w[ 7] = tu_16x16_cb_cbf_r[ 9];
assign	tu_cbf_z2s_cb16x16_w[ 8] = tu_16x16_cb_cbf_r[ 6];
assign	tu_cbf_z2s_cb16x16_w[ 9] = tu_16x16_cb_cbf_r[ 5];
assign	tu_cbf_z2s_cb16x16_w[10] = tu_16x16_cb_cbf_r[11];
assign	tu_cbf_z2s_cb16x16_w[11] = tu_16x16_cb_cbf_r[12];
assign	tu_cbf_z2s_cb16x16_w[12] = tu_16x16_cb_cbf_r[ 7];
assign	tu_cbf_z2s_cb16x16_w[13] = tu_16x16_cb_cbf_r[14];
assign	tu_cbf_z2s_cb16x16_w[14] = tu_16x16_cb_cbf_r[13];
assign	tu_cbf_z2s_cb16x16_w[15] = tu_16x16_cb_cbf_r[15];


//cb cbf 8x8, zscan to scan_idx scan
assign	tu_cbf_z2s_cb8x8_w[0] = tu_8x8_cb_cbf_r[0];
assign	tu_cbf_z2s_cb8x8_w[1] = tu_8x8_cb_cbf_r[2];
assign	tu_cbf_z2s_cb8x8_w[2] = tu_8x8_cb_cbf_r[1];
assign	tu_cbf_z2s_cb8x8_w[3] = tu_8x8_cb_cbf_r[3];


//cb cbf 4x4
assign	tu_cbf_z2s_cb4x4_w = tu_4x4_cb_cbf_r;


//cr cbf righter
assign	tu_cbf_z2s_cb16x16_rer_w[ 0] = tu_16x16_cb_cbf_r[ 1];        
assign	tu_cbf_z2s_cb16x16_rer_w[ 1] = tu_16x16_cb_cbf_r[ 3];        
assign	tu_cbf_z2s_cb16x16_rer_w[ 2] = tu_16x16_cb_cbf_r[ 4];        
assign	tu_cbf_z2s_cb16x16_rer_w[ 3] = tu_16x16_cb_cbf_r[ 9];        
assign	tu_cbf_z2s_cb16x16_rer_w[ 4] = tu_16x16_cb_cbf_r[ 6];        
assign	tu_cbf_z2s_cb16x16_rer_w[ 5] = tu_16x16_cb_cbf_r[ 5];        
assign	tu_cbf_z2s_cb16x16_rer_w[ 6] = tu_16x16_cb_cbf_r[11];        
assign	tu_cbf_z2s_cb16x16_rer_w[ 7] = tu_16x16_cb_cbf_r[12];        
assign	tu_cbf_z2s_cb16x16_rer_w[ 8] = tu_16x16_cb_cbf_r[ 7];        
assign	tu_cbf_z2s_cb16x16_rer_w[ 9] = 'd0;//tu_16x16_cb_cbf_r[];    
assign	tu_cbf_z2s_cb16x16_rer_w[10] = tu_16x16_cb_cbf_r[14];        
assign	tu_cbf_z2s_cb16x16_rer_w[11] = tu_16x16_cb_cbf_r[13];        
assign	tu_cbf_z2s_cb16x16_rer_w[12] = 'd0;//tu_16x16_cb_cbf_r[];    
assign	tu_cbf_z2s_cb16x16_rer_w[13] = tu_16x16_cb_cbf_r[15];        
assign	tu_cbf_z2s_cb16x16_rer_w[14] = 'd0;//tu_16x16_cb_cbf_r[];    
assign	tu_cbf_z2s_cb16x16_rer_w[15] = 'd0;//tu_16x16_cb_cbf_r[15];  


assign	tu_cbf_z2s_cb8x8_rer_w[ 0] = tu_8x8_cb_cbf_r[ 1];
assign	tu_cbf_z2s_cb8x8_rer_w[ 1] = tu_8x8_cb_cbf_r[ 3];
assign	tu_cbf_z2s_cb8x8_rer_w[ 2] = 'd0;//tu_8x8_cb_cbf_r[  ];
assign	tu_cbf_z2s_cb8x8_rer_w[ 3] = 'd0;//tu_8x8_cb_cbf_r[  ];


assign	tu_cbf_z2s_cb4x4_rer_w = 'd0;	


//cr cbf lower
assign	tu_cbf_z2s_cb16x16_ler_w[ 0] = tu_16x16_cb_cbf_r[ 2];        
assign	tu_cbf_z2s_cb16x16_ler_w[ 1] = tu_16x16_cb_cbf_r[ 8];        
assign	tu_cbf_z2s_cb16x16_ler_w[ 2] = tu_16x16_cb_cbf_r[ 3];        
assign	tu_cbf_z2s_cb16x16_ler_w[ 3] = tu_16x16_cb_cbf_r[10];        
assign	tu_cbf_z2s_cb16x16_ler_w[ 4] = tu_16x16_cb_cbf_r[ 9];        
assign	tu_cbf_z2s_cb16x16_ler_w[ 5] = tu_16x16_cb_cbf_r[ 6];        
assign	tu_cbf_z2s_cb16x16_ler_w[ 6] = 'd0;//tu_16x16_cb_cbf_r[ ];        
assign	tu_cbf_z2s_cb16x16_ler_w[ 7] = tu_16x16_cb_cbf_r[11];        
assign	tu_cbf_z2s_cb16x16_ler_w[ 8] = tu_16x16_cb_cbf_r[12];        
assign	tu_cbf_z2s_cb16x16_ler_w[ 9] = tu_16x16_cb_cbf_r[ 7];    
assign	tu_cbf_z2s_cb16x16_ler_w[10] = 'd0;//tu_16x16_cb_cbf_r[14];        
assign	tu_cbf_z2s_cb16x16_ler_w[11] = tu_16x16_cb_cbf_r[14];        
assign	tu_cbf_z2s_cb16x16_ler_w[12] = tu_16x16_cb_cbf_r[13];    
assign	tu_cbf_z2s_cb16x16_ler_w[13] = 'd0;//tu_16x16_cb_cbf_r[15];        
assign	tu_cbf_z2s_cb16x16_ler_w[14] = tu_16x16_cb_cbf_r[15];    
assign	tu_cbf_z2s_cb16x16_ler_w[15] = 'd0;//tu_16x16_cb_cbf_r[15];  


assign	tu_cbf_z2s_cb8x8_ler_w[ 0] = tu_8x8_cb_cbf_r[ 2];
assign	tu_cbf_z2s_cb8x8_ler_w[ 1] = 'd0;//tu_8x8_cb_cbf_r[ ];
assign	tu_cbf_z2s_cb8x8_ler_w[ 2] = tu_8x8_cb_cbf_r[ 3];
assign	tu_cbf_z2s_cb8x8_ler_w[ 3] = 'd0;//tu_8x8_cb_cbf_r[ ];


assign	tu_cbf_z2s_cb4x4_ler_w = 'd0;



reg		[255:0]		last_blk_data_w			;
//last_blk_data_w
always @* begin
	case(scan_idx_r)
		(`SCAN_DIAG):	begin
						last_blk_data_w = {data_coeff_i[255:240], data_coeff_i[223:208], data_coeff_i[239:224], data_coeff_i[127:112], 
										 	data_coeff_i[207:192], data_coeff_i[191:176], data_coeff_i[ 95: 80], data_coeff_i[111: 96], 
										 	data_coeff_i[159:144], data_coeff_i[175:160], data_coeff_i[ 79: 64], data_coeff_i[ 63: 48], 
										 	data_coeff_i[143:128], data_coeff_i[ 31: 16], data_coeff_i[ 47: 32], data_coeff_i[ 15:  0]};
		end
		
		(`SCAN_HOR):	begin
						last_blk_data_w = {data_coeff_i[255:240], data_coeff_i[239:224], data_coeff_i[191:176], data_coeff_i[175:160],  
										 	data_coeff_i[223:208], data_coeff_i[207:192], data_coeff_i[159:144], data_coeff_i[143:128], 
										 	data_coeff_i[127:112], data_coeff_i[111: 96], data_coeff_i[ 63: 48], data_coeff_i[ 47: 32], 
										 	data_coeff_i[ 95: 80], data_coeff_i[ 79: 64], data_coeff_i[ 31: 16], data_coeff_i[ 15:  0]};
		end
		
		(`SCAN_VER):	begin
						last_blk_data_w = {data_coeff_i[255:240], data_coeff_i[223:208], data_coeff_i[127:112], data_coeff_i[ 95: 80], 
										 	data_coeff_i[239:224], data_coeff_i[207:192], data_coeff_i[111: 96], data_coeff_i[ 79: 64], 
										 	data_coeff_i[191:176], data_coeff_i[159:144], data_coeff_i[ 63: 48], data_coeff_i[ 31: 16], 
										 	data_coeff_i[175:160], data_coeff_i[143:128], data_coeff_i[ 47: 32], data_coeff_i[ 15:  0]};
		end
		
		default:		begin
						last_blk_data_w = 'd0;
		end
	endcase
end




//scan_res_data_r                               
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		scan_res_data_r <= 'd0;
	else if(blk_e_done_r)
		scan_res_data_r <= last_blk_data_w;
	else
		scan_res_data_r <= scan_res_data_r;
end


//always @(posedge clk or negedge rst_n) begin
//	if(~rst_n)
//		scan_res_data_r <= 'd0;
//	else if(blk_e_done_r) begin
//		case(scan_idx_r)
//			(`SCAN_DIAG):	begin
//							scan_res_data_r <= {data_coeff_i[255:240], data_coeff_i[223:208], data_coeff_i[239:224], data_coeff_i[127:112], 
//											 	data_coeff_i[207:192], data_coeff_i[191:176], data_coeff_i[ 95: 80], data_coeff_i[111: 96], 
//											 	data_coeff_i[159:144], data_coeff_i[175:160], data_coeff_i[ 79: 64], data_coeff_i[ 63: 48], 
//											 	data_coeff_i[143:128], data_coeff_i[ 31: 16], data_coeff_i[ 47: 32], data_coeff_i[ 15:  0]};
//			end
//			
//			(`SCAN_HOR):	begin
//							scan_res_data_r <= {data_coeff_i[255:240], data_coeff_i[239:224], data_coeff_i[191:176], data_coeff_i[175:160],  
//											 	data_coeff_i[223:208], data_coeff_i[207:192], data_coeff_i[159:144], data_coeff_i[143:128], 
//											 	data_coeff_i[127:112], data_coeff_i[111: 96], data_coeff_i[ 63: 48], data_coeff_i[ 47: 32], 
//											 	data_coeff_i[ 95: 80], data_coeff_i[ 79: 64], data_coeff_i[ 31: 16], data_coeff_i[ 15:  0]};
//			end
//			
//			(`SCAN_VER):	begin
//							scan_res_data_r <= {data_coeff_i[255:240], data_coeff_i[223:208], data_coeff_i[127:112], data_coeff_i[ 95: 80], 
//											 	data_coeff_i[239:224], data_coeff_i[207:192], data_coeff_i[111: 96], data_coeff_i[ 79: 64], 
//											 	data_coeff_i[191:176], data_coeff_i[159:144], data_coeff_i[ 63: 48], data_coeff_i[ 31: 16], 
//											 	data_coeff_i[175:160], data_coeff_i[143:128], data_coeff_i[ 47: 32], data_coeff_i[ 15:  0]};
//			end
//			
//			default:		begin
//							scan_res_data_r <= 'd0;
//			end
//		endcase
//	end
//end

//rd_coeff_sig_w
assign	rd_coeff_sig_w[15] = (scan_res_data_r[ 15:  0]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[14] = (scan_res_data_r[ 31: 16]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[13] = (scan_res_data_r[ 47: 32]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[12] = (scan_res_data_r[ 63: 48]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[11] = (scan_res_data_r[ 79: 64]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[10] = (scan_res_data_r[ 95: 80]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[ 9] = (scan_res_data_r[111: 96]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[ 8] = (scan_res_data_r[127:112]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[ 7] = (scan_res_data_r[143:128]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[ 6] = (scan_res_data_r[159:144]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[ 5] = (scan_res_data_r[175:160]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[ 4] = (scan_res_data_r[191:176]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[ 3] = (scan_res_data_r[207:192]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[ 2] = (scan_res_data_r[223:208]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[ 1] = (scan_res_data_r[239:224]=='d0) ? 'd0 : 'd1;
assign	rd_coeff_sig_w[ 0] = (scan_res_data_r[255:240]=='d0) ? 'd0 : 'd1;



//enc_coeff_sig_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		enc_coeff_sig_r <= 'd0;
	else if(blk_e_done_r)
		enc_coeff_sig_r <= rd_coeff_sig_w;
	else
		enc_coeff_sig_r <= enc_coeff_sig_r;
end

//rd_last_find_flag_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		rd_last_find_flag_r <= 0;
	else if(tu_curr_state_r==TU_LAST_SIG_0)
		rd_last_find_flag_r <= 0;
	else if(tu_done_r)
		rd_last_find_flag_r <= 0;
	else if(scan_cyc_cnt_r==7)
		rd_last_find_flag_r <= rd_last_find_flag_r;
	else if(scan_cyc_cnt_r=='d0) begin
		if(coeff_a_b_r=='d0)
			rd_last_find_flag_r <= 'd0;
		else
			rd_last_find_flag_r <= 'd1;
	end
	else if(coeff_a_b_r!=2'b00)
		rd_last_find_flag_r <= 1;
	else 
		rd_last_find_flag_r <= rd_last_find_flag_r;
end

//rd_last_coeff_idx_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		rd_last_coeff_idx_r <= 'd0;
	else if(~tu_en_w)
		rd_last_coeff_idx_r <= 'd0;
	else if(~rd_bin_cbf_w)
		rd_last_coeff_idx_r <= 'd15;
	else if(tu_curr_state_r==TU_LAST_SIG_0)
		rd_last_coeff_idx_r <= 'd15;
	else if(blk_e_done_r)
		rd_last_coeff_idx_r <= 'd15;
	else if(rd_last_find_flag_r && (scan_cyc_cnt_r!='d0))
		rd_last_coeff_idx_r <= rd_last_coeff_idx_r;
	else begin
		case(coeff_a_b_r)
			2'b00:	rd_last_coeff_idx_r <= rd_last_coeff_idx_r - 2;			
			2'b01:	rd_last_coeff_idx_r <= rd_last_coeff_idx_r - 1;
			2'b10,
			2'b11:	rd_last_coeff_idx_r <= rd_last_coeff_idx_r;
			default:rd_last_coeff_idx_r <= rd_last_coeff_idx_r;
		endcase  
	end
end

//enc_last_coeff_idx_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		enc_last_coeff_idx_r <= 'd0;
	else if(blk_e_done_r) begin
		if(rd_last_find_flag_r)	
			enc_last_coeff_idx_r <= rd_last_coeff_idx_r;
		else begin
			case(coeff_a_b_r[1])
				1'b0:	enc_last_coeff_idx_r <= 'd0;
				1'b1:	enc_last_coeff_idx_r <= 'd1;
				default:enc_last_coeff_idx_r <= enc_last_coeff_idx_r;
			endcase
		end
	end
	else 
		enc_last_coeff_idx_r <= enc_last_coeff_idx_r;
end

//rd_non_zero_num_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		rd_non_zero_num_r <= 'd0;
	else if((~residual_en_i) || tu_done_r 
		     || blk_e_done_r || (tu_curr_state_r==TU_LAST_SIG_0))
		rd_non_zero_num_r <= 'd0;
	else if(scan_e_done_r)
		rd_non_zero_num_r <= rd_non_zero_num_r;
	else begin
		case(coeff_a_b_r)
			2'b00:	rd_non_zero_num_r <= rd_non_zero_num_r;
			2'b10,
			2'b01:	rd_non_zero_num_r <= rd_non_zero_num_r + 'd1;
			2'b11:	rd_non_zero_num_r <= rd_non_zero_num_r + 'd2;
			default:rd_non_zero_num_r <= rd_non_zero_num_r;
		endcase	                                               
	end	
end

//enc_coeff_tot_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		enc_coeff_tot_r <= 0;
	else if(~tu_en_w)
		enc_coeff_tot_r <= 0;
	else if(blk_e_done_r) begin
		case(coeff_a_b_r)
			2'b00:	enc_coeff_tot_r <= rd_non_zero_num_r;
			2'b01,
			2'b10:	enc_coeff_tot_r <= rd_non_zero_num_r + 'd1;    	
			2'b11:	enc_coeff_tot_r <= rd_non_zero_num_r + 'd2;
			default:enc_coeff_tot_r <= rd_non_zero_num_r;
		endcase
	end
	else
		enc_coeff_tot_r <= enc_coeff_tot_r;
end



//rd_res_idx_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		rd_res_idx_r[0 ] <= 'd0; 
		rd_res_idx_r[1 ] <= 'd0; 
		rd_res_idx_r[2 ] <= 'd0; 
		rd_res_idx_r[3 ] <= 'd0; 
		rd_res_idx_r[4 ] <= 'd0; 
		rd_res_idx_r[5 ] <= 'd0; 
		rd_res_idx_r[6 ] <= 'd0; 
		rd_res_idx_r[7 ] <= 'd0; 
		rd_res_idx_r[8 ] <= 'd0; 
		rd_res_idx_r[9 ] <= 'd0; 
		rd_res_idx_r[10] <= 'd0; 
		rd_res_idx_r[11] <= 'd0; 
		rd_res_idx_r[12] <= 'd0; 
		rd_res_idx_r[13] <= 'd0; 
		rd_res_idx_r[14] <= 'd0; 
		rd_res_idx_r[15] <= 'd0; 
	end
	else begin
		case(coeff_a_b_r)
			2'b01:	rd_res_idx_r[rd_non_zero_num_r] <= (scan_cyc_cnt_r << 1) + 1;
			2'b10:	rd_res_idx_r[rd_non_zero_num_r] <= (scan_cyc_cnt_r << 1);
			2'b11:	begin
					rd_res_idx_r[rd_non_zero_num_r] <= (scan_cyc_cnt_r << 1);
					rd_res_idx_r[rd_non_zero_num_r+1] <= (scan_cyc_cnt_r << 1) + 1;
			end
		endcase
	end
end



//-->test
wire	[3:0]		rd_res_idx_0_w		;
wire	[3:0]		rd_res_idx_1_w		;
wire	[3:0]		rd_res_idx_2_w		;
wire	[3:0]		rd_res_idx_3_w		;
wire	[3:0]		rd_res_idx_4_w		;
wire	[3:0]		rd_res_idx_5_w		;
wire	[3:0]		rd_res_idx_6_w		;
wire	[3:0]		rd_res_idx_7_w		;
wire	[3:0]		rd_res_idx_8_w		;
wire	[3:0]		rd_res_idx_9_w		;
wire	[3:0]		rd_res_idx_10_w		;
wire	[3:0]		rd_res_idx_11_w		;
wire	[3:0]		rd_res_idx_12_w		;
wire	[3:0]		rd_res_idx_13_w		;
wire	[3:0]		rd_res_idx_14_w		;
wire	[3:0]		rd_res_idx_15_w		;


wire	[3:0]		enc_res_idx_0_w		;
wire	[3:0]		enc_res_idx_1_w		;
wire	[3:0]		enc_res_idx_2_w		;
wire	[3:0]		enc_res_idx_3_w		;
wire	[3:0]		enc_res_idx_4_w		;
wire	[3:0]		enc_res_idx_5_w		;
wire	[3:0]		enc_res_idx_6_w		;
wire	[3:0]		enc_res_idx_7_w		;
wire	[3:0]		enc_res_idx_8_w		;
wire	[3:0]		enc_res_idx_9_w		;
wire	[3:0]		enc_res_idx_10_w	;
wire	[3:0]		enc_res_idx_11_w	;
wire	[3:0]		enc_res_idx_12_w	;
wire	[3:0]		enc_res_idx_13_w	;
wire	[3:0]		enc_res_idx_14_w	;
wire	[3:0]		enc_res_idx_15_w	;   



assign	rd_res_idx_0_w  = rd_res_idx_r[0 ];
assign	rd_res_idx_1_w  = rd_res_idx_r[1 ];
assign	rd_res_idx_2_w  = rd_res_idx_r[2 ];
assign	rd_res_idx_3_w  = rd_res_idx_r[3 ];
assign	rd_res_idx_4_w  = rd_res_idx_r[4 ];
assign	rd_res_idx_5_w  = rd_res_idx_r[5 ];
assign	rd_res_idx_6_w  = rd_res_idx_r[6 ];
assign	rd_res_idx_7_w  = rd_res_idx_r[7 ];
assign	rd_res_idx_8_w  = rd_res_idx_r[8 ];
assign	rd_res_idx_9_w  = rd_res_idx_r[9 ];
assign	rd_res_idx_10_w = rd_res_idx_r[10];
assign	rd_res_idx_11_w = rd_res_idx_r[11];
assign	rd_res_idx_12_w = rd_res_idx_r[12];
assign	rd_res_idx_13_w = rd_res_idx_r[13];
assign	rd_res_idx_14_w = rd_res_idx_r[14];
assign	rd_res_idx_15_w = rd_res_idx_r[15];

assign	enc_res_idx_0_w  = enc_res_idx_r[0 ];
assign	enc_res_idx_1_w  = enc_res_idx_r[1 ];
assign	enc_res_idx_2_w  = enc_res_idx_r[2 ];
assign	enc_res_idx_3_w  = enc_res_idx_r[3 ];
assign	enc_res_idx_4_w  = enc_res_idx_r[4 ];
assign	enc_res_idx_5_w  = enc_res_idx_r[5 ];
assign	enc_res_idx_6_w  = enc_res_idx_r[6 ];
assign	enc_res_idx_7_w  = enc_res_idx_r[7 ];
assign	enc_res_idx_8_w  = enc_res_idx_r[8 ];
assign	enc_res_idx_9_w  = enc_res_idx_r[9 ];
assign	enc_res_idx_10_w = enc_res_idx_r[10];
assign	enc_res_idx_11_w = enc_res_idx_r[11];
assign	enc_res_idx_12_w = enc_res_idx_r[12];
assign	enc_res_idx_13_w = enc_res_idx_r[13];
assign	enc_res_idx_14_w = enc_res_idx_r[14];
assign	enc_res_idx_15_w = enc_res_idx_r[15];
//<--test









//enc_res_idx_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		enc_res_idx_r[0 ] <= 0; 
		enc_res_idx_r[1 ] <= 0; 
		enc_res_idx_r[2 ] <= 0; 
		enc_res_idx_r[3 ] <= 0; 
		enc_res_idx_r[4 ] <= 0; 
		enc_res_idx_r[5 ] <= 0; 
		enc_res_idx_r[6 ] <= 0; 
		enc_res_idx_r[7 ] <= 0; 
		enc_res_idx_r[8 ] <= 0; 
		enc_res_idx_r[9 ] <= 0; 
		enc_res_idx_r[10] <= 0; 
		enc_res_idx_r[11] <= 0; 
		enc_res_idx_r[12] <= 0; 
		enc_res_idx_r[13] <= 0; 
		enc_res_idx_r[14] <= 0; 
		enc_res_idx_r[15] <= 0; 
	end
	else if(scan_cyc_cnt_r=='d0) begin
		enc_res_idx_r[0 ] <= rd_res_idx_r[0 ]; 
		enc_res_idx_r[1 ] <= rd_res_idx_r[1 ]; 
		enc_res_idx_r[2 ] <= rd_res_idx_r[2 ]; 
		enc_res_idx_r[3 ] <= rd_res_idx_r[3 ]; 
		enc_res_idx_r[4 ] <= rd_res_idx_r[4 ]; 
		enc_res_idx_r[5 ] <= rd_res_idx_r[5 ]; 
		enc_res_idx_r[6 ] <= rd_res_idx_r[6 ]; 
		enc_res_idx_r[7 ] <= rd_res_idx_r[7 ]; 
		enc_res_idx_r[8 ] <= rd_res_idx_r[8 ]; 
		enc_res_idx_r[9 ] <= rd_res_idx_r[9 ]; 
		enc_res_idx_r[10] <= rd_res_idx_r[10]; 
		enc_res_idx_r[11] <= rd_res_idx_r[11]; 
		enc_res_idx_r[12] <= rd_res_idx_r[12]; 
		enc_res_idx_r[13] <= rd_res_idx_r[13]; 
		enc_res_idx_r[14] <= rd_res_idx_r[14]; 
		enc_res_idx_r[15] <= rd_res_idx_r[15];
	end
	else begin
		enc_res_idx_r[0 ] <= enc_res_idx_r[0 ]; 
		enc_res_idx_r[1 ] <= enc_res_idx_r[1 ]; 
		enc_res_idx_r[2 ] <= enc_res_idx_r[2 ]; 
		enc_res_idx_r[3 ] <= enc_res_idx_r[3 ]; 
		enc_res_idx_r[4 ] <= enc_res_idx_r[4 ]; 
		enc_res_idx_r[5 ] <= enc_res_idx_r[5 ]; 
		enc_res_idx_r[6 ] <= enc_res_idx_r[6 ]; 
		enc_res_idx_r[7 ] <= enc_res_idx_r[7 ]; 
		enc_res_idx_r[8 ] <= enc_res_idx_r[8 ]; 
		enc_res_idx_r[9 ] <= enc_res_idx_r[9 ]; 
		enc_res_idx_r[10] <= enc_res_idx_r[10]; 
		enc_res_idx_r[11] <= enc_res_idx_r[11]; 
		enc_res_idx_r[12] <= enc_res_idx_r[12]; 
		enc_res_idx_r[13] <= enc_res_idx_r[13]; 
		enc_res_idx_r[14] <= enc_res_idx_r[14]; 
		enc_res_idx_r[15] <= enc_res_idx_r[15];
	end	
end

//enc_res_data_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		enc_res_data_r[0 ] <= 'd0;
		enc_res_data_r[1 ] <= 'd0;
		enc_res_data_r[2 ] <= 'd0;
		enc_res_data_r[3 ] <= 'd0;
		enc_res_data_r[4 ] <= 'd0;
		enc_res_data_r[5 ] <= 'd0;
		enc_res_data_r[6 ] <= 'd0;
		enc_res_data_r[7 ] <= 'd0;
		enc_res_data_r[8 ] <= 'd0;
		enc_res_data_r[9 ] <= 'd0;
		enc_res_data_r[10] <= 'd0;
		enc_res_data_r[11] <= 'd0;
		enc_res_data_r[12] <= 'd0;
		enc_res_data_r[13] <= 'd0;
		enc_res_data_r[14] <= 'd0;
		enc_res_data_r[15] <= 'd0;
	end
	else if(blk_e_done_r) begin
		enc_res_data_r[0 ] <= scan_res_data_r[15:0];
		enc_res_data_r[1 ] <= scan_res_data_r[31:16];
		enc_res_data_r[2 ] <= scan_res_data_r[47:32];
		enc_res_data_r[3 ] <= scan_res_data_r[63:48];
		enc_res_data_r[4 ] <= scan_res_data_r[79:64];
		enc_res_data_r[5 ] <= scan_res_data_r[95:80];
		enc_res_data_r[6 ] <= scan_res_data_r[111:96];
		enc_res_data_r[7 ] <= scan_res_data_r[127:112];
		enc_res_data_r[8 ] <= scan_res_data_r[143:128];
		enc_res_data_r[9 ] <= scan_res_data_r[159:144];
		enc_res_data_r[10] <= scan_res_data_r[175:160];
		enc_res_data_r[11] <= scan_res_data_r[191:176];
		enc_res_data_r[12] <= scan_res_data_r[207:192];
		enc_res_data_r[13] <= scan_res_data_r[223:208];
		enc_res_data_r[14] <= scan_res_data_r[239:224];
		enc_res_data_r[15] <= scan_res_data_r[255:240];
	end
	else begin
		enc_res_data_r[0 ] <= enc_res_data_r[0 ];
		enc_res_data_r[1 ] <= enc_res_data_r[1 ];
		enc_res_data_r[2 ] <= enc_res_data_r[2 ];
		enc_res_data_r[3 ] <= enc_res_data_r[3 ];
		enc_res_data_r[4 ] <= enc_res_data_r[4 ];
		enc_res_data_r[5 ] <= enc_res_data_r[5 ];
		enc_res_data_r[6 ] <= enc_res_data_r[6 ];
		enc_res_data_r[7 ] <= enc_res_data_r[7 ];
		enc_res_data_r[8 ] <= enc_res_data_r[8 ];
		enc_res_data_r[9 ] <= enc_res_data_r[9 ];
		enc_res_data_r[10] <= enc_res_data_r[10];
		enc_res_data_r[11] <= enc_res_data_r[11];
		enc_res_data_r[12] <= enc_res_data_r[12];
		enc_res_data_r[13] <= enc_res_data_r[13];
		enc_res_data_r[14] <= enc_res_data_r[14];
		enc_res_data_r[15] <= enc_res_data_r[15];
	
	end
end

assign	enc_non_zero_0_w  = enc_res_data_r[enc_res_idx_r[0 ]];
assign	enc_non_zero_1_w  = enc_res_data_r[enc_res_idx_r[1 ]];
assign	enc_non_zero_2_w  = enc_res_data_r[enc_res_idx_r[2 ]];
assign	enc_non_zero_3_w  = enc_res_data_r[enc_res_idx_r[3 ]];
assign	enc_non_zero_4_w  = enc_res_data_r[enc_res_idx_r[4 ]];
assign	enc_non_zero_5_w  = enc_res_data_r[enc_res_idx_r[5 ]];
assign	enc_non_zero_6_w  = enc_res_data_r[enc_res_idx_r[6 ]];
assign	enc_non_zero_7_w  = enc_res_data_r[enc_res_idx_r[7 ]];
assign	enc_non_zero_8_w  = enc_res_data_r[enc_res_idx_r[8 ]];
assign	enc_non_zero_9_w  = enc_res_data_r[enc_res_idx_r[9 ]];
assign	enc_non_zero_10_w = enc_res_data_r[enc_res_idx_r[10]];
assign	enc_non_zero_11_w = enc_res_data_r[enc_res_idx_r[11]];
assign	enc_non_zero_12_w = enc_res_data_r[enc_res_idx_r[12]];
assign	enc_non_zero_13_w = enc_res_data_r[enc_res_idx_r[13]];
assign	enc_non_zero_14_w = enc_res_data_r[enc_res_idx_r[14]];
assign	enc_non_zero_15_w = enc_res_data_r[enc_res_idx_r[15]];

//always @* begin
//	if(tu_en_w) begin
assign	enc_non_zero_abs_0_r  = enc_non_zero_0_w[15]  ? ((~enc_non_zero_0_w )+'d1) : enc_non_zero_0_w ;
assign	enc_non_zero_abs_1_r  = enc_non_zero_1_w[15]  ? ((~enc_non_zero_1_w )+'d1) : enc_non_zero_1_w ;
assign	enc_non_zero_abs_2_r  = enc_non_zero_2_w[15]  ? ((~enc_non_zero_2_w )+'d1) : enc_non_zero_2_w ;
assign	enc_non_zero_abs_3_r  = enc_non_zero_3_w[15]  ? ((~enc_non_zero_3_w )+'d1) : enc_non_zero_3_w ;
assign	enc_non_zero_abs_4_r  = enc_non_zero_4_w[15]  ? ((~enc_non_zero_4_w )+'d1) : enc_non_zero_4_w ;
assign	enc_non_zero_abs_5_r  = enc_non_zero_5_w[15]  ? ((~enc_non_zero_5_w )+'d1) : enc_non_zero_5_w ;
assign	enc_non_zero_abs_6_r  = enc_non_zero_6_w[15]  ? ((~enc_non_zero_6_w )+'d1) : enc_non_zero_6_w ;
assign	enc_non_zero_abs_7_r  = enc_non_zero_7_w[15]  ? ((~enc_non_zero_7_w )+'d1) : enc_non_zero_7_w ;
assign	enc_non_zero_abs_8_r  = enc_non_zero_8_w[15]  ? ((~enc_non_zero_8_w )+'d1) : enc_non_zero_8_w ;
assign	enc_non_zero_abs_9_r  = enc_non_zero_9_w[15]  ? ((~enc_non_zero_9_w )+'d1) : enc_non_zero_9_w ;
assign	enc_non_zero_abs_10_r = enc_non_zero_10_w[15] ? ((~enc_non_zero_10_w)+'d1) : enc_non_zero_10_w;
assign	enc_non_zero_abs_11_r = enc_non_zero_11_w[15] ? ((~enc_non_zero_11_w)+'d1) : enc_non_zero_11_w;
assign	enc_non_zero_abs_12_r = enc_non_zero_12_w[15] ? ((~enc_non_zero_12_w)+'d1) : enc_non_zero_12_w;
assign	enc_non_zero_abs_13_r = enc_non_zero_13_w[15] ? ((~enc_non_zero_13_w)+'d1) : enc_non_zero_13_w;
assign	enc_non_zero_abs_14_r = enc_non_zero_14_w[15] ? ((~enc_non_zero_14_w)+'d1) : enc_non_zero_14_w;
assign	enc_non_zero_abs_15_r = enc_non_zero_15_w[15] ? ((~enc_non_zero_15_w)+'d1) : enc_non_zero_15_w;    
//	end
//	else begin
//		enc_non_zero_abs_0_r  = 'd0;
//		enc_non_zero_abs_1_r  = 'd0;
//		enc_non_zero_abs_2_r  = 'd0;
//		enc_non_zero_abs_3_r  = 'd0;
//		enc_non_zero_abs_4_r  = 'd0;
//		enc_non_zero_abs_5_r  = 'd0;
//		enc_non_zero_abs_6_r  = 'd0;
//		enc_non_zero_abs_7_r  = 'd0;
//		enc_non_zero_abs_8_r  = 'd0;
//		enc_non_zero_abs_9_r  = 'd0;
//		enc_non_zero_abs_10_r = 'd0;
//		enc_non_zero_abs_11_r = 'd0;
//		enc_non_zero_abs_12_r = 'd0;
//		enc_non_zero_abs_13_r = 'd0;
//		enc_non_zero_abs_14_r = 'd0;
//		enc_non_zero_abs_15_r = 'd0;
//	end
//end   
   
//always @* begin
//	if(tu_en_w) begin
assign	enc_non_zero_abs_0_ge1_r = enc_non_zero_abs_0_r>'d1 ? 1 : 0;
assign	enc_non_zero_abs_1_ge1_r = enc_non_zero_abs_1_r>'d1 ? 1 : 0;
assign	enc_non_zero_abs_2_ge1_r = enc_non_zero_abs_2_r>'d1 ? 1 : 0;
assign	enc_non_zero_abs_3_ge1_r = enc_non_zero_abs_3_r>'d1 ? 1 : 0;
assign	enc_non_zero_abs_4_ge1_r = enc_non_zero_abs_4_r>'d1 ? 1 : 0;
assign	enc_non_zero_abs_5_ge1_r = enc_non_zero_abs_5_r>'d1 ? 1 : 0;
assign	enc_non_zero_abs_6_ge1_r = enc_non_zero_abs_6_r>'d1 ? 1 : 0;
assign	enc_non_zero_abs_7_ge1_r = enc_non_zero_abs_7_r>'d1 ? 1 : 0;     
//	end
//	else begin
//		enc_non_zero_abs_0_ge1_r = 'd0;
//		enc_non_zero_abs_1_ge1_r = 'd0;
//		enc_non_zero_abs_2_ge1_r = 'd0;
//		enc_non_zero_abs_3_ge1_r = 'd0;
//		enc_non_zero_abs_4_ge1_r = 'd0;
//		enc_non_zero_abs_5_ge1_r = 'd0;
//		enc_non_zero_abs_6_ge1_r = 'd0;
//		enc_non_zero_abs_7_ge1_r = 'd0;  
//	end
//end   
   
//always @* begin
//	if(tu_en_w) begin
assign	enc_non_zero_abs_0_ge2_r = enc_non_zero_abs_0_r>'d2 ? 1 : 0;
assign	enc_non_zero_abs_1_ge2_r = enc_non_zero_abs_1_r>'d2 ? 1 : 0;
assign	enc_non_zero_abs_2_ge2_r = enc_non_zero_abs_2_r>'d2 ? 1 : 0;
assign	enc_non_zero_abs_3_ge2_r = enc_non_zero_abs_3_r>'d2 ? 1 : 0;
assign	enc_non_zero_abs_4_ge2_r = enc_non_zero_abs_4_r>'d2 ? 1 : 0;
assign	enc_non_zero_abs_5_ge2_r = enc_non_zero_abs_5_r>'d2 ? 1 : 0;
assign	enc_non_zero_abs_6_ge2_r = enc_non_zero_abs_6_r>'d2 ? 1 : 0;
assign	enc_non_zero_abs_7_ge2_r = enc_non_zero_abs_7_r>'d2 ? 1 : 0;     
//	end
//	else begin
//		enc_non_zero_abs_0_ge2_r = 'd0;
//		enc_non_zero_abs_1_ge2_r = 'd0;
//		enc_non_zero_abs_2_ge2_r = 'd0;
//		enc_non_zero_abs_3_ge2_r = 'd0;
//		enc_non_zero_abs_4_ge2_r = 'd0;
//		enc_non_zero_abs_5_ge2_r = 'd0;
//		enc_non_zero_abs_6_ge2_r = 'd0;
//		enc_non_zero_abs_7_ge2_r = 'd0;   
//	end
//end      
   

//coeff_a_b_r
always @* begin
	if(coeff_a_r!=0 && coeff_b_r!=0)
		coeff_a_b_r = 2'b11;
	else if(coeff_a_r!=0 && coeff_b_r==0)
		coeff_a_b_r = 2'b10;
	else if(coeff_a_r==0 && coeff_b_r!=0)
		coeff_a_b_r = 2'b01;
	else
		coeff_a_b_r = 2'b00;
end


//coeff_a_r & coeff_b_r
always @* begin
	case(scan_cyc_cnt_r)
		0: 	begin coeff_a_r = scan_res_data_r[15  : 0  ]; coeff_b_r = scan_res_data_r[31  : 16 ]; 	end
		1:  begin coeff_a_r = scan_res_data_r[47  : 32 ]; coeff_b_r = scan_res_data_r[63  : 48 ];   end
		2:  begin coeff_a_r = scan_res_data_r[79  : 64 ]; coeff_b_r = scan_res_data_r[95  : 80 ];   end
		3:  begin coeff_a_r = scan_res_data_r[111 : 96 ]; coeff_b_r = scan_res_data_r[127 : 112];   end
		4:  begin coeff_a_r = scan_res_data_r[143 : 128]; coeff_b_r = scan_res_data_r[159 : 144];   end
		5:  begin coeff_a_r = scan_res_data_r[175 : 160]; coeff_b_r = scan_res_data_r[191 : 176];   end
		6:  begin coeff_a_r = scan_res_data_r[207 : 192]; coeff_b_r = scan_res_data_r[223 : 208];   end
		7:  begin coeff_a_r = scan_res_data_r[239 : 224]; coeff_b_r = scan_res_data_r[255 : 240];   end   
		default: 
		    begin coeff_a_r = 0;                        coeff_b_r = 0;                        	end
	endcase    
end


//enc_pattern_sig_ctx_r
always @* begin
	if(sig_right_blk_r=='d0 && sig_lower_blk_r=='d0)
		enc_pattern_sig_ctx_r = 'd0;
	else if(sig_right_blk_r=='d0 && sig_lower_blk_r=='d1)
		enc_pattern_sig_ctx_r = 'd2;
	else if(sig_right_blk_r=='d1 && sig_lower_blk_r=='d0)
		enc_pattern_sig_ctx_r = 'd1;
	else
		enc_pattern_sig_ctx_r = 'd3;
end

//sig_right_blk_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	sig_right_blk_r = tu_cbf_z2s_luma32x32_rer_w[blk_cbf_idx_r];
			'd2:		sig_right_blk_r = tu_cbf_z2s_luma16x16_rer_w[blk_cbf_idx_r];
			'd3:		sig_right_blk_r = tu_cbf_z2s_luma8x8_rer_r[blk_cbf_idx_r];
			default:	sig_right_blk_r = 'd0;
		endcase
	end
	else if(res_curr_state_r==RESIDUAL_CR_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	sig_right_blk_r = tu_cbf_z2s_cr16x16_rer_w[blk_cbf_idx_r];
			'd2:		sig_right_blk_r = tu_cbf_z2s_cr8x8_rer_w[blk_cbf_idx_r];
			'd3:		sig_right_blk_r = tu_cbf_z2s_cr4x4_rer_w;//[blk_cbf_idx_r];
			default:	sig_right_blk_r = 'd0;
		endcase
	end
	else if(res_curr_state_r==RESIDUAL_CB_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	sig_right_blk_r = tu_cbf_z2s_cb16x16_rer_w[blk_cbf_idx_r];
			'd2:		sig_right_blk_r = tu_cbf_z2s_cb8x8_rer_w[blk_cbf_idx_r];
			'd3:		sig_right_blk_r = tu_cbf_z2s_cb4x4_rer_w;//[blk_cbf_idx_r];
			default:	sig_right_blk_r = 'd0;
		endcase
	end
	else
		sig_right_blk_r = 'd0;
end

//sig_lower_blk_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	sig_lower_blk_r = tu_cbf_z2s_luma32x32_ler_w[blk_cbf_idx_r];
			'd2:		sig_lower_blk_r = tu_cbf_z2s_luma16x16_ler_w[blk_cbf_idx_r];
			'd3:		sig_lower_blk_r = tu_cbf_z2s_luma8x8_ler_r[blk_cbf_idx_r];
			default:	sig_lower_blk_r = 'd0;
		endcase
	end
	else if(res_curr_state_r==RESIDUAL_CR_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	sig_lower_blk_r = tu_cbf_z2s_cr16x16_ler_w[blk_cbf_idx_r];
			'd2:		sig_lower_blk_r = tu_cbf_z2s_cr8x8_ler_w[blk_cbf_idx_r];
			'd3:		sig_lower_blk_r = tu_cbf_z2s_cr4x4_ler_w;//[blk_cbf_idx_r];
			default:	sig_lower_blk_r = 'd0;
		endcase
	end
	else if(res_curr_state_r==RESIDUAL_CB_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	sig_lower_blk_r = tu_cbf_z2s_cb16x16_ler_w[blk_cbf_idx_r];
			'd2:		sig_lower_blk_r = tu_cbf_z2s_cb8x8_ler_w[blk_cbf_idx_r];
			'd3:		sig_lower_blk_r = tu_cbf_z2s_cb4x4_ler_w;//[blk_cbf_idx_r];
			default:	sig_lower_blk_r = 'd0;
		endcase
	end
	else
		sig_lower_blk_r = 'd0;
end















					
// *********************************************************					
// root_cbf



assign	ctx_pair_root_cbf_w = {2'b00, bin_string_root_cbf_w, ctx_idx_root_cbf_w};		

//valid_num_bin_root_cbf_r
always @* begin
	if(res_curr_state_r==RESIDUAL_ROOT_CBF && slice_type_i==(`SLICE_TYPE_P)) begin
		valid_num_bin_root_cbf_r = 'd1;		
	end
	else begin
		valid_num_bin_root_cbf_r = 'd0;
	end
end

//bin_string_root_cbf_w
assign	bin_string_root_cbf_w = cbf_ne_zero_flag_w;


//ctx_idx_root_cbf_w
assign	ctx_idx_root_cbf_w = {3'd3, 5'd0};	













// *********************************************************
// chroma_root_cbf



assign 	ctx_pair_chroma_root_cbf_0_w = {2'b00, bin_string_chroma_root_cbf_w[1], ctx_idx_chroma_root_cbf_0_w};
assign	ctx_pair_chroma_root_cbf_1_w = {2'b00, bin_string_chroma_root_cbf_w[0], ctx_idx_chroma_root_cbf_1_w};

//valid_num_bin_chroma_root_cbf_w
assign	valid_num_bin_chroma_root_cbf_w = 'd2;

//bin_string_chroma_root_cbf_r
assign	bin_string_chroma_root_cbf_w = {(cu_cr_cbf_r!='d0 ? 1'b1 : 1'b0), (cu_cb_cbf_r!='d0 ? 1'b1 : 1'b0)};

//ctx_idx_chroma_root_cbf_0_r
assign	ctx_idx_chroma_root_cbf_0_w = {3'd2, 5'd1};//
assign	ctx_idx_chroma_root_cbf_1_w = {3'd2, 5'd1};










// *********************************************************
// sub_div
assign	ctx_pair_sub_div_w = {2'b00, bin_string_sub_div_r, ctx_idx_sub_div_r};

//valid_num_bin_sub_div_r
always @* begin
	if(res_curr_state_r==RESIDUAL_SUB_DIV)
		valid_num_bin_sub_div_r = 'd1;
	else
		valid_num_bin_sub_div_r = 'd0;
end

//bin_string_sub_div_r
always @* begin
	if(res_curr_state_r==RESIDUAL_SUB_DIV)
		bin_string_sub_div_r = 'd0;
	else
		bin_string_sub_div_r = 'd0;
end

//ctx_idx_sub_div_r
always @* begin
	case(cu_depth_i)
		'd0, 'd1:	ctx_idx_sub_div_r = {3'd3, 5'd1};	
		'd2:		ctx_idx_sub_div_r = {3'd1, 5'd0};
		'd3:		ctx_idx_sub_div_r = {3'd2, 5'd0};
		default:	ctx_idx_sub_div_r = {3'd3, 5'd1};
	endcase
end











// *********************************************************
// chroma_cbf



assign 	ctx_pair_chroma_cbf_0_w = {2'b00, bin_string_chroma_cbf_w[1], ctx_idx_chroma_cbf_0_w};
assign	ctx_pair_chroma_cbf_1_w = {2'b00, bin_string_chroma_cbf_w[0], ctx_idx_chroma_cbf_1_w};

//valid_num_bin_chroma_cbf_r
always @* begin
	if(res_curr_state_r==RESIDUAL_CHROMA_CBF) begin
		if(cu_cb_cbf_r!='d0 && cu_cr_cbf_r!='d0) 
			valid_num_bin_chroma_cbf_r = 'd2;
		else if(cu_cr_cbf_r=='d0 && cu_cb_cbf_r=='d0)
			valid_num_bin_chroma_cbf_r = 'd0;
		else 
			valid_num_bin_chroma_cbf_r = 'd1;
	end
	else begin
		valid_num_bin_chroma_cbf_r = 'd0;
	end	
end

//bin_string_chroma_cbf_r

assign	bin_string_chroma_cbf_w = {(cu_cr_cbf_r!=0 ? (cu_cr_cbf_r[tu_cnt_r]!=0) : (cu_cb_cbf_r[tu_cnt_r]!=0)), (cu_cb_cbf_r[tu_cnt_r]!=0) };
		// {(cu_cr_cbf_r[tu_cnt_r]!='d0 ? 1'b1 : 1'b0), (cu_cb_cbf_r[tu_cnt_r]!='d0 ? 1'b1 : 1'b0)};



//ctx_idx_chroma_cbf_0_r
assign	ctx_idx_chroma_cbf_0_w = {3'd3, 5'd2};
assign	ctx_idx_chroma_cbf_1_w = {3'd3, 5'd2};
                                       
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            
                                                            


// *********************************************************
// luma_cbf
assign	ctx_pair_luma_cbf_w ={2'b00, bin_string_luma_cbf_r, ctx_idx_luma_cbf_r};

//valid_num_bin_luma_cbf_r
always @* begin
	if(slice_type_i==(`SLICE_TYPE_P) && cu_depth_i>'d0 && cu_cb_cbf_r=='d0 && cu_cr_cbf_r=='d0)
		valid_num_bin_luma_cbf_r = 'd0;
	else
		valid_num_bin_luma_cbf_r = 'd1;
end

//bin_string_luma_cbf_r
always @* begin
	if(cu_depth_i=='d0)
		bin_string_luma_cbf_r = cu_luma_cbf_r[tu_cnt_r];
	else 
		bin_string_luma_cbf_r = cu_luma_cbf_r!='d0;
end

//ctx_idx_luma_cbf_r
always @* begin
	if(cu_depth_i=='d0)
		ctx_idx_luma_cbf_r = {3'd0, 5'd0};
	else
		ctx_idx_luma_cbf_r = {3'd1, 5'd1};
end






// *********************************************************
// qp_delta




//reg		[10:0]		ctx_pair_qp_delta_0_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_1_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_2_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_3_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_4_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_5_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_6_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_7_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_8_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_9_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_10_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_11_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_12_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_13_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_14_w					;	//context pair of qp_delta
//reg		[10:0]		ctx_pair_qp_delta_15_w					;	//context pair of qp_delta
//
//
//reg		[3:0]		valid_num_bin_qp_delta_r				;	//valid number bin of qp_delta
//reg		[2:0]		valid_num_bin_qp_delta_pre_r			;	//valid number bin of qp_delta prefix
//reg		[3:0]		valid_num_bin_qp_delta_suf_r			;	//valid number bin of qp_delta suffix
//reg		[1:0]		qp_delta_pre_cyc_tot_r					;	//prefix cycle total
//reg		[2:0]		qp_delta_suf_cyc_tot_r					;	//suffix cycle total
//reg		[2:0]		qp_delta_cyc_tot_r						;	//total cycle
//reg		[2:0]		qp_delta_cyc_cnt_r						;	//total cycle count
//reg		[15:0]		bin_string_qp_delta_r					;	//bin string of qp_delta
//
//
//reg		[5:0]		cu_qp_r									;	//current cu qp
//reg		[5:0]		cu_qp_left_r							;	//left cu qp
//reg		[5:0]		cu_qp_top_r								;	//top cu qp
//reg		[5:0]		cu_qp_last_r							;	//last cu qp
//reg		[5:0]		ref_qp_r								;	//reference cu qp
//reg	signed [5:0]	qp_delta_r								;	//qp delta
//reg		[5:0]		qp_delta_abs_r							;	//qp delta abs
//wire		[5:0]		qp_delta_abs_m5_w						;	//qp delta abs minus 5
//reg		[2:0]		tu_value_r								;	//min(qp_delta_abs_r, 5)
//reg					qp_suffix_r								;	//suffix flag
//wire					qp_delta_sign_w							;	//qp delta sign
//
//
//wire	[5:0]		qp_delta_abs_m5m1_w						;
//wire	[5:0]		qp_delta_abs_m5m3_w						;
//wire	[5:0]		qp_delta_abs_m5m7_w						;
//wire	[5:0]		qp_delta_abs_m5m15_w					;


reg		[5:0]		slice_qp_r			;
reg		[5:0]		qp_of_cu_r	[63:0]	;




assign	qp_delta_sign_w = qp_delta_r[5];
assign	qp_delta_abs_m5_w = qp_delta_abs_r - 'd5;

//cu_qp_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		cu_qp_r <= 'd0;
	else if(residual_en_i) begin
		cu_qp_r <= cu_qp_i;
	end
	else 
		cu_qp_r <= 'd0;
end

//cu_qp_left_r
always @* begin
	case(cu_idx_i)
		'd0, 'd1, 'd3, 'd5, 'd7,
		'd13, 'd15, 'd21, 'd23, 
		'd29, 'd31, 'd53, 'd55, 
		'd61, 'd63:
			cu_qp_left_r = 'h3f;
		
		default:
			cu_qp_left_r = cu_qp_r;
	endcase
end

//cu_qp_top_r
always @* begin
	case(cu_idx_i)
		'd0, 'd1, 'd2, 'd5, 'd6,
		'd9, 'd10, 'd21, 'd22, 
		'd25, 'd26, 'd37, 'd38,
		'd41, 'd42:
			cu_qp_top_r = 'h3f;
			
		default:
			cu_qp_top_r = cu_qp_r;
	endcase
end

//cu_qp_last_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		cu_qp_last_r <= 'd0;
	else if(~residual_en_i)
		cu_qp_last_r <= cu_qp_last_r;
	else if(residual_done_r) begin
		if(~cbf_ne_zero_flag_w)
			cu_qp_last_r <= cu_qp_last_r;
		else 
			cu_qp_last_r <= cu_qp_r;
	end
	else if(mb_x_i=='d0 && mb_y_i=='d0 &&
			(cu_idx_i==0 || cu_idx_i==1 || cu_idx_i==5 || cu_idx_i==21))
		cu_qp_last_r <= cu_qp_i;// (`INIT_QP);
	else 
		cu_qp_last_r <= cu_qp_last_r;
end

//ref_qp_r
always @* begin
	if(res_curr_state_r==RESIDUAL_DQP)
		ref_qp_r = ((cu_qp_left_r=='h3f ? cu_qp_last_r : cu_qp_left_r) +
					(cu_qp_top_r=='h3f ? cu_qp_last_r : cu_qp_top_r) + 'd1) >> 1;
	else					
		ref_qp_r = 'd0;
end


//qp_delta_r
always @* begin
	if(res_curr_state_r==RESIDUAL_DQP)
		qp_delta_r = cu_qp_r - ref_qp_r;
	else 
		qp_delta_r = 'd0;
end

//qp_delta_abs_r
always @* begin
	if(res_curr_state_r==RESIDUAL_DQP)
		qp_delta_abs_r = qp_delta_r[5] ? ((~qp_delta_r)+1) : qp_delta_r;
	else
		qp_delta_abs_r = 'd0;
end

//tu_value_r
always @* begin
	if(res_curr_state_r==RESIDUAL_DQP)
		tu_value_r = qp_delta_abs_r<'d5 ? qp_delta_abs_r : 'd5;
	else
		tu_value_r = 'd0;
end


// qp_delta
always @* begin
	if(qp_suffix_r) begin
		ctx_pair_qp_delta_0_w  = {2'b01, bin_string_qp_delta_r[15], 8'd0};
		ctx_pair_qp_delta_1_w  = {2'b01, bin_string_qp_delta_r[14], 8'd0};
		ctx_pair_qp_delta_2_w  = {2'b01, bin_string_qp_delta_r[13], 8'd0};
		ctx_pair_qp_delta_3_w  = {2'b01, bin_string_qp_delta_r[12], 8'd0};
		ctx_pair_qp_delta_4_w  = {2'b01, bin_string_qp_delta_r[11], 8'd0};
		ctx_pair_qp_delta_5_w  = {2'b01, bin_string_qp_delta_r[10], 8'd0};
		ctx_pair_qp_delta_6_w  = {2'b01, bin_string_qp_delta_r[ 9], 8'd0};
		ctx_pair_qp_delta_7_w  = {2'b01, bin_string_qp_delta_r[ 8], 8'd0};
		ctx_pair_qp_delta_8_w  = {2'b01, bin_string_qp_delta_r[ 7], 8'd0};
		ctx_pair_qp_delta_9_w  = {2'b01, bin_string_qp_delta_r[ 6], 8'd0};
		ctx_pair_qp_delta_10_w = {2'b01, bin_string_qp_delta_r[ 5], 8'd0};
		ctx_pair_qp_delta_11_w = {2'b01, bin_string_qp_delta_r[ 4], 8'd0};
		ctx_pair_qp_delta_12_w = {2'b01, bin_string_qp_delta_r[ 3], 8'd0};
		ctx_pair_qp_delta_13_w = {2'b01, bin_string_qp_delta_r[ 2], 8'd0};
		ctx_pair_qp_delta_14_w = {2'b01, bin_string_qp_delta_r[ 1], 8'd0};
		ctx_pair_qp_delta_15_w = {2'b01, bin_string_qp_delta_r[ 0], 8'd0};
	end
	else begin
		ctx_pair_qp_delta_0_w  = {2'b00, bin_string_qp_delta_r[15], 3'd3, 5'd3};	//0
		ctx_pair_qp_delta_1_w  = {2'b00, bin_string_qp_delta_r[14], 3'd1, 5'd2};	//1
		ctx_pair_qp_delta_2_w  = {2'b00, bin_string_qp_delta_r[13], 3'd1, 5'd2};	//1
		ctx_pair_qp_delta_3_w  = {2'b00, bin_string_qp_delta_r[12], 3'd1, 5'd2};	//1
		ctx_pair_qp_delta_4_w  = {2'b00, bin_string_qp_delta_r[11], 3'd1, 5'd2};
		ctx_pair_qp_delta_5_w  = {2'b00, bin_string_qp_delta_r[10], 3'd1, 5'd2};
		ctx_pair_qp_delta_6_w  = {2'b00, bin_string_qp_delta_r[ 9], 3'd1, 5'd2};
		ctx_pair_qp_delta_7_w  = {2'b00, bin_string_qp_delta_r[ 8], 3'd1, 5'd2};
		ctx_pair_qp_delta_8_w  = {2'b00, bin_string_qp_delta_r[ 7], 3'd1, 5'd2};
		ctx_pair_qp_delta_9_w  = {2'b00, bin_string_qp_delta_r[ 6], 3'd1, 5'd2};
		ctx_pair_qp_delta_10_w = {2'b00, bin_string_qp_delta_r[ 5], 3'd1, 5'd2};
		ctx_pair_qp_delta_11_w = {2'b00, bin_string_qp_delta_r[ 4], 3'd1, 5'd2};
		ctx_pair_qp_delta_12_w = {2'b00, bin_string_qp_delta_r[ 3], 3'd1, 5'd2};
		ctx_pair_qp_delta_13_w = {2'b00, bin_string_qp_delta_r[ 2], 3'd1, 5'd2};
		ctx_pair_qp_delta_14_w = {2'b00, bin_string_qp_delta_r[ 1], 3'd1, 5'd2};
		ctx_pair_qp_delta_15_w = {2'b00, bin_string_qp_delta_r[ 0], 3'd1, 5'd2};
	end
end






//valid_num_bin_qp_delta_pre_r
always @* begin
	if(res_curr_state_r!=RESIDUAL_DQP)
		valid_num_bin_qp_delta_pre_r = 'd0;
	else if(qp_delta_abs_r=='d0)
		valid_num_bin_qp_delta_pre_r = 'd1;
	else if(qp_delta_abs_r<'d5)
		valid_num_bin_qp_delta_pre_r = 'd1 + tu_value_r;
	else
		valid_num_bin_qp_delta_pre_r = 'd5;
end

//valid_num_bin_qp_delta_suf_r
always @* begin
	if(res_curr_state_r!=RESIDUAL_DQP)
		valid_num_bin_qp_delta_suf_r = 'd0;  
	else if(qp_delta_abs_r=='d0)
		valid_num_bin_qp_delta_suf_r = 'd0;
	else if(qp_delta_abs_r<'d5)
		valid_num_bin_qp_delta_suf_r = 'd1;
	else begin
		case(qp_delta_abs_m5_w)
			'd0:					valid_num_bin_qp_delta_suf_r = 'd2;
			'd1, 'd2:				valid_num_bin_qp_delta_suf_r = 'd4;
			'd3, 'd4, 'd5, 'd6:		valid_num_bin_qp_delta_suf_r = 'd6;
			'd7, 'd8, 'd9, 'd10,
			'd11, 'd12, 'd13, 'd14:	valid_num_bin_qp_delta_suf_r = 'd8;
			default:				valid_num_bin_qp_delta_suf_r = 'd10;
		endcase	
	end
end

//qp_delta_pre_cyc_tot_r
always @* begin
	case(valid_num_bin_qp_delta_pre_r)
		'd0:				qp_delta_pre_cyc_tot_r = 'd0;
		'd1, 'd2, 'd3, 'd4:	qp_delta_pre_cyc_tot_r = 'd1;
		'd5, 'd6, 'd7, 'd8:	qp_delta_pre_cyc_tot_r = 'd2;
		default:			qp_delta_pre_cyc_tot_r = 'd0;
	endcase
end

//qp_delta_suf_cyc_tot_r
always @* begin
	case(valid_num_bin_qp_delta_suf_r)
		'd0:				qp_delta_suf_cyc_tot_r = 'd0;
		'd1, 'd2, 'd3, 'd4:	qp_delta_suf_cyc_tot_r = 'd1;
		'd5, 'd6, 'd7, 'd8:	qp_delta_suf_cyc_tot_r = 'd2;
		'd9, 'd10, 'd11, 'd12:qp_delta_suf_cyc_tot_r = 'd3;
		default:			qp_delta_suf_cyc_tot_r = 'd0;
	endcase
end

//qp_delta_cyc_tot_r
always @* begin
	if(res_curr_state_r!=RESIDUAL_DQP)
		qp_delta_cyc_tot_r = 'd0;
	else 
		qp_delta_cyc_tot_r = qp_delta_pre_cyc_tot_r + qp_delta_suf_cyc_tot_r;
end

//qp_delta_cyc_cnt_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		qp_delta_cyc_cnt_r <= 'd0;
	else if(res_curr_state_r!=RESIDUAL_DQP)
		qp_delta_cyc_cnt_r <= 'd0;
	else if(qp_delta_cyc_cnt_r==(qp_delta_cyc_tot_r-1))
		qp_delta_cyc_cnt_r <= 'd0;
	else 
		qp_delta_cyc_cnt_r <= qp_delta_cyc_cnt_r + 'd1;
end

//qp_suffix_r
always @* begin
	if(res_curr_state_r!=RESIDUAL_DQP)
		qp_suffix_r = 'd0;
	else if(qp_delta_cyc_cnt_r<qp_delta_pre_cyc_tot_r)
		qp_suffix_r = 'd0;
	else 
		qp_suffix_r = 'd1;
end

//valid_num_bin_qp_delta_r
always @* begin
	if(res_curr_state_r!=RESIDUAL_DQP)
		valid_num_bin_qp_delta_r = 'd0;
	else if(qp_suffix_r) begin
		if(cu_depth_i=='d0 && tu_cnt_r!='d0) 
			valid_num_bin_qp_delta_r = 'd0;
		else
			valid_num_bin_qp_delta_r = valid_num_bin_qp_delta_suf_r;
	end
	else begin
		if(cu_depth_i=='d0 && tu_cnt_r!='d0)
			valid_num_bin_qp_delta_r = 'd0;
		else 
			valid_num_bin_qp_delta_r = valid_num_bin_qp_delta_pre_r;
	end
end


assign	qp_delta_abs_m5m1_w = qp_delta_abs_r - 'd6;
assign	qp_delta_abs_m5m3_w = qp_delta_abs_r - 'd8;
assign 	qp_delta_abs_m5m7_w = qp_delta_abs_r - 'd12;
assign	qp_delta_abs_m5m15_w = qp_delta_abs_r - 'd20;


//bin_string_qp_delta_r
always @* begin
	if(res_curr_state_r!=RESIDUAL_DQP)
		bin_string_qp_delta_r = 'd0;
	else if(qp_suffix_r) begin
		if(qp_delta_abs_r<5)
			bin_string_qp_delta_r = {qp_delta_sign_w, 15'd0};
		else begin
			case(qp_delta_abs_m5_w)
				'd0:					bin_string_qp_delta_r = {1'b0, qp_delta_sign_w, 14'd0};	
				'd1, 'd2:				bin_string_qp_delta_r = {2'b10, qp_delta_abs_m5m1_w[0], qp_delta_sign_w, 12'd0};
				'd3, 'd4, 'd5, 'd6:		bin_string_qp_delta_r = {3'b110, qp_delta_abs_m5m3_w[1:0], qp_delta_sign_w, 10'd0};
				'd7, 'd8, 'd9, 'd10,
				'd11, 'd12, 'd13, 'd14:	bin_string_qp_delta_r = {4'b1110, qp_delta_abs_m5m7_w[2:0], qp_delta_sign_w, 8'd0};
				default:				bin_string_qp_delta_r = {5'b11110, qp_delta_abs_m5m15_w[3:0], qp_delta_sign_w, 6'd0};
			endcase
		end
	end	
	else begin
		case(tu_value_r)
			'd0:	bin_string_qp_delta_r = 'd0;
			'd1:	bin_string_qp_delta_r = {1'b1, 15'd0};
			'd2:	bin_string_qp_delta_r = {1'b1, 1'b1, 14'd0};
			'd3:	bin_string_qp_delta_r = {1'b1, 2'b11, 13'd0};
			'd4:	bin_string_qp_delta_r = {1'b1, 3'b111, 12'd0};
			default:bin_string_qp_delta_r = {1'b1, 4'b1111, 11'd0};
		endcase
	end
end


//qp_done_r
always @* begin
	if(res_curr_state_r!=RESIDUAL_DQP)
		qp_done_r = 'd0;
	else if(qp_delta_cyc_cnt_r==(qp_delta_cyc_tot_r-1))
		qp_done_r = 'd1;
	else 
		qp_done_r = 'd0;
end






// ******************************************************
// transform_skip
assign	ctx_pair_transform_skip_w = {2'b00, 1'b0, ctx_idx_transform_skip_w};
assign	ctx_idx_transform_skip_w = (res_curr_state_r==RESIDUAL_LUMA_COEFF) ? {3'd3, 5'd4} : {3'd2, 5'd2};



// *******************************************************
// last_significant_xy

assign	ctx_pair_last_x_prefix_0_w = {2'b00, bin_string_last_x_prefix_r[9], ctx_idx_last_x_prefix_0_r};
assign	ctx_pair_last_x_prefix_1_w = {2'b00, bin_string_last_x_prefix_r[8], ctx_idx_last_x_prefix_1_r};
assign	ctx_pair_last_x_prefix_2_w = {2'b00, bin_string_last_x_prefix_r[7], ctx_idx_last_x_prefix_2_r};
assign	ctx_pair_last_x_prefix_3_w = {2'b00, bin_string_last_x_prefix_r[6], ctx_idx_last_x_prefix_3_r};
assign	ctx_pair_last_x_prefix_4_w = {2'b00, bin_string_last_x_prefix_r[5], ctx_idx_last_x_prefix_4_r};
assign	ctx_pair_last_x_prefix_5_w = {2'b00, bin_string_last_x_prefix_r[4], ctx_idx_last_x_prefix_5_r};
assign	ctx_pair_last_x_prefix_6_w = {2'b00, bin_string_last_x_prefix_r[3], ctx_idx_last_x_prefix_6_r};
assign	ctx_pair_last_x_prefix_7_w = {2'b00, bin_string_last_x_prefix_r[2], ctx_idx_last_x_prefix_7_r};
assign	ctx_pair_last_x_prefix_8_w = {2'b00, bin_string_last_x_prefix_r[1], ctx_idx_last_x_prefix_8_r};
assign	ctx_pair_last_x_prefix_9_w = {2'b00, bin_string_last_x_prefix_r[0], ctx_idx_last_x_prefix_9_r};

assign	ctx_pair_last_y_prefix_0_w = {2'b00, bin_string_last_y_prefix_r[9], ctx_idx_last_y_prefix_0_r};
assign	ctx_pair_last_y_prefix_1_w = {2'b00, bin_string_last_y_prefix_r[8], ctx_idx_last_y_prefix_1_r};
assign	ctx_pair_last_y_prefix_2_w = {2'b00, bin_string_last_y_prefix_r[7], ctx_idx_last_y_prefix_2_r};
assign	ctx_pair_last_y_prefix_3_w = {2'b00, bin_string_last_y_prefix_r[6], ctx_idx_last_y_prefix_3_r};
assign	ctx_pair_last_y_prefix_4_w = {2'b00, bin_string_last_y_prefix_r[5], ctx_idx_last_y_prefix_4_r};
assign	ctx_pair_last_y_prefix_5_w = {2'b00, bin_string_last_y_prefix_r[4], ctx_idx_last_y_prefix_5_r};
assign	ctx_pair_last_y_prefix_6_w = {2'b00, bin_string_last_y_prefix_r[3], ctx_idx_last_y_prefix_6_r};
assign	ctx_pair_last_y_prefix_7_w = {2'b00, bin_string_last_y_prefix_r[2], ctx_idx_last_y_prefix_7_r};
assign	ctx_pair_last_y_prefix_8_w = {2'b00, bin_string_last_y_prefix_r[1], ctx_idx_last_y_prefix_8_r};
assign	ctx_pair_last_y_prefix_9_w = {2'b00, bin_string_last_y_prefix_r[0], ctx_idx_last_y_prefix_9_r};

assign	ctx_pair_last_x_suffix_0_w = {2'b01, bin_string_last_x_suffix_r[2], 8'd0};
assign	ctx_pair_last_x_suffix_1_w = {2'b01, bin_string_last_x_suffix_r[1], 8'd0};
assign	ctx_pair_last_x_suffix_2_w = {2'b01, bin_string_last_x_suffix_r[0], 8'd0};

assign	ctx_pair_last_y_suffix_0_w = {2'b01, bin_string_last_y_suffix_r[2], 8'd0};
assign	ctx_pair_last_y_suffix_1_w = {2'b01, bin_string_last_y_suffix_r[1], 8'd0};
assign	ctx_pair_last_y_suffix_2_w = {2'b01, bin_string_last_y_suffix_r[0], 8'd0};


//last_sig_enc_done_r
always @* begin
	if(last_xy_cyc_cnt_r==(last_xy_cyc_tot_w-1))
		last_sig_enc_done_r = 'd1;
	else
		last_sig_enc_done_r = 'd0;
end


  
//last_x_prefix_cyc_tot_r	
always @* begin
	case(valid_num_bin_last_x_prefix_w)
		'd0:				last_x_prefix_cyc_tot_r = 'd0;
		'd1, 'd2, 'd3, 'd4:	last_x_prefix_cyc_tot_r = 'd1;
		'd5, 'd6, 'd7, 'd8:	last_x_prefix_cyc_tot_r = 'd2;
		'd9, 'd10:			last_x_prefix_cyc_tot_r = 'd3;
		default:			last_x_prefix_cyc_tot_r = 'd0;
	endcase
end  


//last_y_prefix_cyc_tot_r	
always @* begin
	case(valid_num_bin_last_y_prefix_w)
		'd0:				last_y_prefix_cyc_tot_r = 'd0;
		'd1, 'd2, 'd3, 'd4:	last_y_prefix_cyc_tot_r = 'd1;
		'd5, 'd6, 'd7, 'd8:	last_y_prefix_cyc_tot_r = 'd2;
		'd9, 'd10:			last_y_prefix_cyc_tot_r = 'd3;
		default:			last_y_prefix_cyc_tot_r = 'd0;
	endcase
end  
  
//last_x_suffix_cyc_tot_r	  
always @* begin
	if(valid_num_bin_last_x_suffix_r!='d0)
		last_x_suffix_cyc_tot_r = 'd1;
	else
		last_x_suffix_cyc_tot_r = 'd0;	
end

//last_y_suffix_cyc_tot_r	
always @* begin
	if(valid_num_bin_last_y_suffix_r!='d0)
		last_y_suffix_cyc_tot_r = 'd1;
	else
		last_y_suffix_cyc_tot_r = 'd0;	
end
  
//last_xy_cyc_tot_w	
assign	last_xy_cyc_tot_w = last_x_prefix_cyc_tot_r + last_x_suffix_cyc_tot_r 
					  	  + last_y_prefix_cyc_tot_r + last_y_suffix_cyc_tot_r;

	  
//last_xy_cyc_cnt_r		  
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		last_xy_cyc_cnt_r <= 'd0;
	else if(tu_curr_state_r!=TU_LAST_SIG)
		last_xy_cyc_cnt_r <= 'd0;
	else if(last_xy_cyc_cnt_r==last_xy_cyc_tot_w)
		last_xy_cyc_cnt_r <= last_xy_cyc_tot_w;
	else 
		last_xy_cyc_cnt_r <= last_xy_cyc_cnt_r + 'd1;
end  

//last_xy_r
always @* begin
	if(last_xy_cyc_cnt_r<last_x_prefix_cyc_tot_r)
		last_xy_r = 'd0;
	else if(last_xy_cyc_cnt_r>=last_x_prefix_cyc_tot_r 
		 && last_xy_cyc_cnt_r<(last_x_prefix_cyc_tot_r+last_y_prefix_cyc_tot_r))
		last_xy_r = 'd1;
	else if(last_x_suffix_cyc_tot_r && last_xy_cyc_cnt_r==(last_x_prefix_cyc_tot_r+last_y_prefix_cyc_tot_r))
		last_xy_r = 'd2;
	else if(last_xy_cyc_cnt_r<last_xy_cyc_tot_w)
		last_xy_r = 'd3;
	else
		last_xy_r = 'd7;
end



//valid_num_bin_last_x_prefix_w
assign	valid_num_bin_last_x_prefix_w = group_idx_x_r + group_idx_x_1_r;

//valid_num_bin_last_y_prefix_w
assign	valid_num_bin_last_y_prefix_w = group_idx_y_r + group_idx_y_1_r;	


//valid_num_bin_last_x_suffix_r
always @* begin
	if(group_idx_x_r>3) begin
		case(group_idx_x_r) 
			4, 5:	valid_num_bin_last_x_suffix_r = 'd1;
			6, 7:	valid_num_bin_last_x_suffix_r = 'd2;
			8, 9:	valid_num_bin_last_x_suffix_r = 'd3;
			default:valid_num_bin_last_x_suffix_r = 'd0;
		endcase
	end
	else
		valid_num_bin_last_x_suffix_r = 'd0;	
end

//valid_num_bin_last_y_suffix_r
always @* begin
	if(group_idx_y_r>3) begin
		case(group_idx_y_r) 
			4, 5:	valid_num_bin_last_y_suffix_r = 'd1;
			6, 7:	valid_num_bin_last_y_suffix_r = 'd2;
			8, 9:	valid_num_bin_last_y_suffix_r = 'd3;
			default:valid_num_bin_last_y_suffix_r = 'd0;
		endcase
	end
	else
		valid_num_bin_last_y_suffix_r = 'd0;	
end

//bin_string_last_x_prefix_r
always @* begin
	case(group_idx_x_r)
		0:		bin_string_last_x_prefix_r = 'b00_0000_0000;
		1:      bin_string_last_x_prefix_r = 'b10_0000_0000;
		2:      bin_string_last_x_prefix_r = 'b11_0000_0000;
		3:      bin_string_last_x_prefix_r = 'b11_1000_0000;
		4:      bin_string_last_x_prefix_r = 'b11_1100_0000;
		5:      bin_string_last_x_prefix_r = 'b11_1110_0000;
		6:      bin_string_last_x_prefix_r = 'b11_1111_0000;
		7:      bin_string_last_x_prefix_r = 'b11_1111_1000;
		8:      bin_string_last_x_prefix_r = 'b11_1111_1100;
		9:      bin_string_last_x_prefix_r = 'b11_1111_1110;
		default:bin_string_last_x_prefix_r = 'b00_0000_0000;
	endcase	
end

//bin_string_last_y_prefix_r
always @* begin
	case(group_idx_y_r)
		0:		bin_string_last_y_prefix_r = 'b00_0000_0000;
		1:      bin_string_last_y_prefix_r = 'b10_0000_0000;
		2:      bin_string_last_y_prefix_r = 'b11_0000_0000;
		3:      bin_string_last_y_prefix_r = 'b11_1000_0000;
		4:      bin_string_last_y_prefix_r = 'b11_1100_0000;
		5:      bin_string_last_y_prefix_r = 'b11_1110_0000;
		6:      bin_string_last_y_prefix_r = 'b11_1111_0000;
		7:      bin_string_last_y_prefix_r = 'b11_1111_1000;
		8:      bin_string_last_y_prefix_r = 'b11_1111_1100;
		9:      bin_string_last_y_prefix_r = 'b11_1111_1110;
		default:bin_string_last_y_prefix_r = 'b00_0000_0000;
	endcase	
end

//bin_string_last_x_suffix_r
always @* begin
	case(valid_num_bin_last_x_suffix_r)
		'd0:	bin_string_last_x_suffix_r = 3'b000;
		'd1:    bin_string_last_x_suffix_r = {pos_x_mar_r[0], 2'b00};
		'd2:    bin_string_last_x_suffix_r = {pos_x_mar_r[1:0], 1'b0};
		'd3:    bin_string_last_x_suffix_r = pos_x_mar_r[2:0];
		default:bin_string_last_x_suffix_r = 3'b000;
	endcase
end

//bin_string_last_y_suffix_r
always @* begin
	case(valid_num_bin_last_y_suffix_r)
		'd0:	bin_string_last_y_suffix_r = 3'b000;
		'd1:    bin_string_last_y_suffix_r = {pos_y_mar_r[0], 2'b00};
		'd2:    bin_string_last_y_suffix_r = {pos_y_mar_r[1:0], 1'b0};
		'd3:    bin_string_last_y_suffix_r = pos_y_mar_r[2:0];
		default:bin_string_last_y_suffix_r = 3'b000;
	endcase
end

//ctx_idx_last_x_prefix_0_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
						ctx_idx_last_x_prefix_0_r = {3'd0, 5'd4};//'d10;		//10+(0>>1) luma
			end
			
			'd2:		begin
						ctx_idx_last_x_prefix_0_r = {3'd0, 5'd3};//'d6;		//6+(0>>1)	luma
			end
			
			'd3:		begin
						ctx_idx_last_x_prefix_0_r = {3'd0, 5'd2};//'d3;		//3+(0>>1)	luma
			end
			
			default:	begin	
						ctx_idx_last_x_prefix_0_r = 'd0;
			end
		endcase 
	end
	else begin
		ctx_idx_last_x_prefix_0_r = {3'd0, 5'd6};//'d15;						//15+0+(0>>1) chroma
	end
end

// ctx_idx_last_x_prefix_1_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_x_prefix_1_r = {3'd0, 5'd4};//'d10;	//10+(1>>1) luma
			end
			
			'd2:		begin
							ctx_idx_last_x_prefix_1_r = {3'd0, 5'd3};//'d6;	//6+(1>>1) luma
			end
			
			'd3:		begin
							ctx_idx_last_x_prefix_1_r = {3'd0, 5'd2};//'d3;	//3+(1>>1) luma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_1_r = 'd0;
			end
		endcase 	
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1, 'd2:	begin
							ctx_idx_last_x_prefix_1_r = {3'd0, 5'd6};//'d15;	//15+0+(1>>2) chroma
			end
			
			'd3:		begin
							ctx_idx_last_x_prefix_1_r = {3'd1, 5'd8};//'d16;	//15+0+(1>>0) chroma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_1_r = 'd0;
			end
		endcase
	end	
end

// ctx_idx_last_x_prefix_2_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_x_prefix_2_r = {3'd1, 5'd6};//'d11;	//10+(2>>1) luma
			end
			
			'd2:		begin
							ctx_idx_last_x_prefix_2_r = {3'd1, 5'd5}; //'d7;	//6+(2>>1) luma
			end
			
			'd3:		begin
							ctx_idx_last_x_prefix_2_r = {3'd1, 5'd4};//'d4;	//3+(2>>1) luma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_2_r = 'd0;
			end
		endcase
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_x_prefix_2_r = {3'd0, 5'd6};//'d15;	//15+0+(2>>2) chroma
			end 
			
			'd2:		begin
							ctx_idx_last_x_prefix_2_r = {3'd1, 5'd8};//'d16;	//15+0+(2>>1) chroma
			end
			
			'd3:		begin
							ctx_idx_last_x_prefix_2_r = {3'd2, 5'd4};//'d17;	//15+0+(2>>0) chroma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_2_r = 'd0;
			end
		endcase
	end
end

// ctx_idx_last_x_prefix_3_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_x_prefix_3_r = {3'd1, 5'd6};//'d11;	//10+(3>>1) luma
			end
			
			'd2:		begin
							ctx_idx_last_x_prefix_3_r = {3'd1, 5'd5};//'d7;	//6+(3>>1) luma
			end
			
			'd3:		begin
							ctx_idx_last_x_prefix_3_r = {3'd1, 5'd4};//'d4;	//3+(3>>1) luma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_3_r = 'd0;
			end
		endcase
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_x_prefix_3_r = {3'd0, 5'd6};//'d15;	//15+0+(3>>2) chroma
			end 
			
			'd2:		begin
							ctx_idx_last_x_prefix_3_r = {3'd1, 5'd8};//'d16;	//15+0+(3>>1) chroma
			end
			
			'd3:		begin
							ctx_idx_last_x_prefix_3_r = {3'd3, 5'd9};//'d18;	//15+0+(3>>0) chroma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_3_r = 'd0;
			end
		endcase
	end
end

// ctx_idx_last_x_prefix_4_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_x_prefix_4_r = {3'd3, 5'd8};//'d12;	//10+(4>>1) luma
			end
			
			'd2:		begin
							ctx_idx_last_x_prefix_4_r = {3'd2, 5'd3};//'d8;	//6+(4>>1) luma
			end
			
			'd3:		begin
							ctx_idx_last_x_prefix_4_r = {3'd3, 5'd6};//'d5;	//3+(4>>1) luma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_4_r = 'd0;
			end
		endcase
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_x_prefix_4_r = {3'd1, 5'd8};//'d1;	//0+(4>>2) chroma
			end 
			
			'd2:		begin
							ctx_idx_last_x_prefix_4_r = {3'd2, 5'd4};//'d2;	//0+(4>>1) chroma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_4_r = 'd0;
			end
		endcase
	end
end

// ctx_idx_last_x_prefix_5_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_x_prefix_5_r = {3'd3, 5'd8};//'d12;	//10+(5>>1) luma
			end
			
			'd2:		begin
							ctx_idx_last_x_prefix_5_r = {3'd2, 5'd3};//'d8;	//6+(5>>1) luma
			end
			
			'd3:		begin
							ctx_idx_last_x_prefix_5_r = {3'd1, 5'd7};//'d5;	//3+(5>>1) luma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_5_r = 'd0;
			end
		endcase
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_x_prefix_5_r = {3'd1, 5'd8};//'d1;	//0+(5>>2) chroma
			end 
			
			'd2:		begin
							ctx_idx_last_x_prefix_5_r = {3'd2, 5'd4};//'d2;	//0+(5>>1) chroma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_5_r = 'd0;
			end
		endcase
	end
end

// ctx_idx_last_x_prefix_6_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_x_prefix_6_r = {3'd0, 5'd5};//'d13;	//10+(6>>1) luma
			end
			
			'd2:		begin
							ctx_idx_last_x_prefix_6_r = {3'd3, 5'd7};//'d9;	//6+(6>>1) luma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_6_r = 'd0;
			end
		endcase
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_x_prefix_6_r = {3'd1, 5'd8};//'d1;	//15+0+(6>>2) chroma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_6_r = 'd0;
			end
		endcase
	end
end

// ctx_idx_last_x_prefix_7_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_x_prefix_7_r = {3'd0, 5'd5};//'d13;	//10+(7>>1) luma
			end
			
			'd2:		begin
							ctx_idx_last_x_prefix_7_r = {3'd3, 5'd7};//'d9;	//6+(7>>1) luma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_7_r = 'd0;
			end
		endcase
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_x_prefix_7_r = {3'd0, 5'd6};//'d1;	//0+(7>>2) chroma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_7_r = 'd0;
			end
		endcase
	end
end

// ctx_idx_last_x_prefix_8_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_x_prefix_8_r = {3'd1, 5'd7};//'d14;	//10+(8>>1) luma
			end
			
			default:	begin
							ctx_idx_last_x_prefix_8_r = 'd0;
			end
		endcase
	end
	else begin
		ctx_idx_last_x_prefix_8_r = 'd0;
	end
end

// ctx_idx_last_x_prefix_9_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF)
		ctx_idx_last_x_prefix_9_r = {3'd1, 5'd7};//'d14;	//10+(9>>1) luma ;
	else 
		ctx_idx_last_x_prefix_9_r = 'd0;
end

//ctx_idx_last_y_prefix_0_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
						ctx_idx_last_y_prefix_0_r = {3'd0, 5'd10};//'d10;		//10+(0>>1) luma
			end
			
			'd2:		begin
						ctx_idx_last_y_prefix_0_r = {3'd0, 5'd9};//'d6;		//6+(0>>1)	luma
			end
			
			'd3:		begin
						ctx_idx_last_y_prefix_0_r = {3'd0, 5'd8};//'d3;		//3+(0>>1)	luma
			end
			
			default:	begin	
						ctx_idx_last_y_prefix_0_r = 'd0;
			end
		endcase 
	end
	else begin
		ctx_idx_last_y_prefix_0_r = {3'd0, 5'd12};//'d0;						//0+(0>>1) chroma
	end
end

// ctx_idx_last_y_prefix_1_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_y_prefix_1_r = {3'd0, 5'd10};//'d10;	//10+(1>>1) luma
			end
			
			'd2:		begin
							ctx_idx_last_y_prefix_1_r = {3'd0, 5'd9};//'d6;	//6+(1>>1) luma
			end
			
			'd3:		begin
							ctx_idx_last_y_prefix_1_r = {3'd0, 5'd8};//'d3;	//3+(1>>1) luma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_1_r = 'd0;
			end
		endcase 	
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1, 'd2:	begin
							ctx_idx_last_y_prefix_1_r = {3'd0, 5'd12};//'d0;	//0+(1>>1) chroma
			end
			
			'd3:		begin
							ctx_idx_last_y_prefix_1_r = {3'd1, 5'd14};//'d1;	//0+(1>>0) chroma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_1_r = 'd0;
			end
		endcase
	end	
end

// ctx_idx_last_y_prefix_2_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_y_prefix_2_r = {3'd1, 5'd12};//'d11;	//10+(2>>1) luma
			end
			
			'd2:		begin
							ctx_idx_last_y_prefix_2_r = {3'd1, 5'd11};//'d7;	//6+(2>>1) luma
			end
			
			'd3:		begin
							ctx_idx_last_y_prefix_2_r = {3'd1, 5'd10};//'d4;	//3+(2>>1) luma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_2_r = 'd0;
			end
		endcase
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_y_prefix_2_r = {3'd0, 5'd12};//'d0;	//0+(2>>2) chroma
			end
			
			'd2:		begin
							ctx_idx_last_y_prefix_2_r = {3'd1, 5'd14};//'d1;	//0+(2>>1) chroma
			end
			
			'd3:		begin
							ctx_idx_last_y_prefix_2_r = {3'd2, 5'd6};//'d2;	//0+(2>>0) chroma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_2_r = 'd0;
			end
		endcase
	end
end

// ctx_idx_last_y_prefix_3_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_y_prefix_3_r = {3'd1, 5'd12};//'d11;	//10+(3>>1) luma
			end
			
			'd2:		begin
							ctx_idx_last_y_prefix_3_r = {3'd1, 5'd11};//'d7;	//6+(3>>1) luma
			end
			
			'd3:		begin
							ctx_idx_last_y_prefix_3_r = {3'd1, 5'd10};//'d4;	//3+(3>>1) luma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_3_r = 'd0;
			end
		endcase
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_y_prefix_3_r = {3'd0, 5'd12};//'d0;	//0+(3>>2) chroma
			end 
			
			'd2:		begin
							ctx_idx_last_y_prefix_3_r = {3'd1, 5'd14};//'d1;	//0+(3>>1) chroma
			end
			
			'd3:		begin
							ctx_idx_last_y_prefix_3_r = {3'd3, 5'd14};//'d3;	//0+(3>>0) chroma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_3_r = 'd0;
			end
		endcase
	end
end

// ctx_idx_last_y_prefix_4_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_y_prefix_4_r = {3'd3, 5'd13};//'d12;	//10+(4>>1) luma
			end
			
			'd2:		begin
							ctx_idx_last_y_prefix_4_r = {3'd2, 5'd5};//'d8;	//6+(4>>1) luma
			end
			
			'd3:		begin
							ctx_idx_last_y_prefix_4_r = {3'd3, 5'd11};//'d5;	//3+(4>>1) luma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_4_r = 'd0;
			end
		endcase
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_y_prefix_4_r = {3'd1, 5'd14};//'d1;	//0+(4>>2) chroma
			end
			
			'd2:		begin
							ctx_idx_last_y_prefix_4_r = {3'd2, 5'd6};//'d2;	//0+(4>>1) chroma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_4_r = 'd0;
			end
		endcase
	end
end

// ctx_idx_last_y_prefix_5_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_y_prefix_5_r = {3'd3, 5'd13};//'d12;	//10+(5>>1) luma
			end
			
			'd2:		begin
							ctx_idx_last_y_prefix_5_r = {3'd2, 5'd5};//'d8;	//6+(5>>1) luma
			end
			
			'd3:		begin
							ctx_idx_last_y_prefix_5_r = {3'd3, 5'd11};//'d5;	//3+(5>>1) luma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_5_r = 'd0;
			end
		endcase
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_y_prefix_5_r = {3'd1, 5'd14};//'d1;	//0+(5>>2) chroma
			end
			
			'd2:		begin
							ctx_idx_last_y_prefix_5_r = {3'd2, 5'd6};//'d2;	//0+(5>>1) chroma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_5_r = 'd0;
			end
		endcase
	end
end

// ctx_idx_last_y_prefix_6_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_y_prefix_6_r = {3'd0, 5'd11};//'d13;	//10+(6>>1) luma
			end
			
			'd2:		begin
							ctx_idx_last_y_prefix_6_r = {3'd3, 5'd12};//'d9;	//6+(6>>1) luma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_6_r = 'd0;
			end
		endcase
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_y_prefix_6_r = {3'd1, 5'd14};//'d1;	//0+(6>>2) chroma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_6_r = 'd0;
			end
		endcase
	end
end

// ctx_idx_last_y_prefix_7_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_y_prefix_7_r = {3'd0, 5'd11};//'d13;	//10+(7>>1) luma
			end
			
			'd2:		begin
							ctx_idx_last_y_prefix_7_r = {3'd3, 5'd12};//'d9;	//6+(7>>1) luma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_7_r = 'd0;
			end
		endcase
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_y_prefix_7_r = {3'd1, 5'd14};//'d1;	//0+(7>>2) chroma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_7_r = 'd0;
			end
		endcase
	end
end

// ctx_idx_last_y_prefix_8_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_idx_last_y_prefix_8_r = {3'd1, 5'd13};//'d14;	//10+(8>>1) luma
			end
			
			default:	begin
							ctx_idx_last_y_prefix_8_r = 'd0;
			end
		endcase
	end
	else begin
		ctx_idx_last_y_prefix_8_r = 'd0;
	end
end

// ctx_idx_last_y_prefix_9_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF)
		ctx_idx_last_y_prefix_9_r = {3'd1, 5'd13};//'d14;	//10+(9>>1) luma 
	else
		ctx_idx_last_y_prefix_9_r = 'd0;
end




//pos_x_w
assign	pos_x_w = (scan_idx_r!=(`SCAN_VER)) ? (pos_x_base_r + pos_x_inc_r) : (pos_y_base_r + pos_y_inc_r);


//pos_y_w
assign	pos_y_w = (scan_idx_r!=(`SCAN_VER)) ? (pos_y_base_r + pos_y_inc_r) : (pos_x_base_r + pos_x_inc_r);

//pos_x_mar_r
always @* begin
	case(group_idx_x_r)
		'd0:	pos_x_mar_r = pos_x_w - 'd0;
		'd1:	pos_x_mar_r = pos_x_w - 'd1;
		'd2:    pos_x_mar_r = pos_x_w - 'd2;
		'd3:    pos_x_mar_r = pos_x_w - 'd3;
		'd4:    pos_x_mar_r = pos_x_w - 'd4;
		'd5:    pos_x_mar_r = pos_x_w - 'd6;
		'd6:    pos_x_mar_r = pos_x_w - 'd8;
		'd7:    pos_x_mar_r = pos_x_w - 'd12;
		'd8:    pos_x_mar_r = pos_x_w - 'd16;
		'd9:    pos_x_mar_r = pos_x_w - 'd24;
		default:pos_x_mar_r = 'd0;
	endcase
end

//pos_x_mar_r
always @* begin
	case(group_idx_y_r)
		'd0:	pos_y_mar_r = pos_y_w - 'd0;
		'd1:	pos_y_mar_r = pos_y_w - 'd1;
		'd2:    pos_y_mar_r = pos_y_w - 'd2;
		'd3:    pos_y_mar_r = pos_y_w - 'd3;
		'd4:    pos_y_mar_r = pos_y_w - 'd4;
		'd5:    pos_y_mar_r = pos_y_w - 'd6;
		'd6:    pos_y_mar_r = pos_y_w - 'd8;
		'd7:    pos_y_mar_r = pos_y_w - 'd12;
		'd8:    pos_y_mar_r = pos_y_w - 'd16;
		'd9:    pos_y_mar_r = pos_y_w - 'd24;
		default:pos_y_mar_r = 'd0;
	endcase
end


//group_idx_x_r
always @* begin
	case(pos_x_w)
		0:	group_idx_x_r = 'd0;
		1:	group_idx_x_r = 'd1;
		2:	group_idx_x_r = 'd2;
		3:	group_idx_x_r = 'd3;
		4, 5:
			group_idx_x_r = 'd4;
		6, 7:
			group_idx_x_r = 'd5;
		8, 9, 10, 11:
			group_idx_x_r = 'd6;
		12, 13, 14, 15:
			group_idx_x_r = 'd7;
		16, 17, 18, 19, 20, 21, 22, 23:
			group_idx_x_r = 'd8;
		default:
			group_idx_x_r = 'd9;
	endcase
end

//group_idx_y_r 
always @* begin
	case(pos_y_w)
		0:	group_idx_y_r = 'd0;
		1:	group_idx_y_r = 'd1;
		2:	group_idx_y_r = 'd2;
		3:	group_idx_y_r = 'd3;
		4, 5:
			group_idx_y_r = 'd4;
		6, 7:
			group_idx_y_r = 'd5;
		8, 9, 10, 11:
			group_idx_y_r = 'd6;
		12, 13, 14, 15:
			group_idx_y_r = 'd7;
		16, 17, 18, 19, 20, 21, 22, 23:
			group_idx_y_r = 'd8;
		default:
			group_idx_y_r = 'd9;
	endcase
end

//group_idx_x_1_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			0, 1:	begin
						if(pos_x_w<'d24)
							group_idx_x_1_r = 'd1;
						else
							group_idx_x_1_r = 'd0;
			end
			
			2:		begin
						if(pos_x_w<'d12)
							group_idx_x_1_r = 'd1;
						else
							group_idx_x_1_r = 'd0;
			end
			
			3:		begin
						if(pos_x_w<'d6)
							group_idx_x_1_r = 'd1;
						else
							group_idx_x_1_r = 'd0;
			end
			
			default:begin
							group_idx_x_1_r = 'd0;
			end			
		endcase	
	end
	else begin
		case(cu_depth_i)
			0, 1:	begin
						if(pos_x_w<'d12)
							group_idx_x_1_r = 'd1;
						else
							group_idx_x_1_r = 'd0;
			end
			
			2:		begin
						if(pos_x_w<'d6)
							group_idx_x_1_r = 'd1;
						else
							group_idx_x_1_r = 'd0;
			end
			
			3:		begin
						if(pos_x_w<'d3)
							group_idx_x_1_r = 'd1;
						else
							group_idx_x_1_r = 'd0;
			end
			
			default:begin
							group_idx_x_1_r = 'd0;
			end			
		endcase	
	end
end


//group_idx_y_1_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			0, 1:	begin
						if(pos_y_w<'d24)
							group_idx_y_1_r = 'd1;
						else
							group_idx_y_1_r = 'd0;
			end
			
			2:		begin
						if(pos_y_w<'d12)
							group_idx_y_1_r = 'd1;
						else
							group_idx_y_1_r = 'd0;
			end
			
			3:		begin
						if(pos_y_w<'d6)
							group_idx_y_1_r = 'd1;
						else
							group_idx_y_1_r = 'd0;
			end
			
			default:begin
							group_idx_y_1_r = 'd0;
			end			
		endcase	
	end
	else begin
		case(cu_depth_i)
			0, 1:	begin
						if(pos_y_w<'d12)
							group_idx_y_1_r = 'd1;
						else
							group_idx_y_1_r = 'd0;
			end
			
			2:		begin
						if(pos_y_w<'d6)
							group_idx_y_1_r = 'd1;
						else
							group_idx_y_1_r = 'd0;
			end
			
			3:		begin
						if(pos_y_w<'d3)
							group_idx_y_1_r = 'd1;
						else
							group_idx_y_1_r = 'd0;
			end
			
			default:begin
							group_idx_y_1_r = 'd0;
			end			
		endcase	
	end
end



//pos_x_base_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		pos_x_base_r <= 'd0;
	else if(tu_curr_state_r==TU_LAST_SIG_0) begin
		if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
			case(cu_depth_i)
				0, 1:	begin
							case(last_blk_idx_r)
								0, 1, 3, 6, 10, 15, 21, 28:	begin
									pos_x_base_r <= 'd0;
								end
								
								2, 4, 7, 11, 16, 22, 29, 36:	begin
									pos_x_base_r <= 'd4;
								end
								
								5, 8, 12, 17, 23, 30, 37, 43:	begin
									pos_x_base_r <= 'd8;
								end
								
								9, 13, 18, 24, 31, 38, 44, 49:	begin
									pos_x_base_r <= 'd12;
								end
								
								14, 19, 25, 32, 39, 45, 50, 54:	begin
									pos_x_base_r <= 'd16;
								end
								
								20, 26, 33, 40, 46, 51, 55, 58:	begin
									pos_x_base_r <= 'd20;
								end
								
								27, 34, 41, 47, 52, 56, 59, 61:	begin
									pos_x_base_r <= 'd24;
								end
								
								default:	begin
									pos_x_base_r <= 'd28;
								end							
							endcase
				end
				
				2:		begin
							case(last_blk_idx_r)
								0, 1, 3, 6:	begin
									pos_x_base_r <= 'd0;
								end
								
								2, 4, 7, 10:	begin
									pos_x_base_r <= 'd4;
								end
								
								5, 8, 11, 13:	begin
									pos_x_base_r <= 'd8;
								end
								
								default:	begin
									pos_x_base_r <= 'd12;
								end
							endcase
				end
				
				3:		begin
							if(scan_idx_r!=(`SCAN_HOR)) begin
								if(~last_blk_idx_r[1])
									pos_x_base_r <= 'd0;
								else 
									pos_x_base_r <= 'd4;
							end
							else begin
								if(~last_blk_idx_r[0])
									pos_x_base_r <= 'd0;
								else
									pos_x_base_r <= 'd4;
							end
				end
				
				default:begin
							pos_x_base_r <= 'd0;
				end
			endcase
		end
		else if(res_curr_state_r==RESIDUAL_CR_COEFF || res_curr_state_r==RESIDUAL_CB_COEFF) begin
			case(cu_depth_i)
				0, 1:	begin
							case(last_blk_idx_r)
								0, 1, 3, 6:	begin
									pos_x_base_r <= 'd0;
								end
								
								2, 4, 7, 10:	begin
									pos_x_base_r <= 'd4;
								end
								
								5, 8, 11, 13:	begin
									pos_x_base_r <= 'd8;
								end
								
								default:	begin
									pos_x_base_r <= 'd12;
								end
							endcase
				end
				
				2:		begin
							if(~last_blk_idx_r[1])
								pos_x_base_r <= 'd0;
							else
								pos_x_base_r <= 'd4;
				end
				
				3:		begin
							pos_x_base_r <= 'd0;
				end
				
				default:begin
							pos_x_base_r <= 'd0;
				end
			endcase
		end
		else begin
			pos_x_base_r <= 'd0;
		end        
	end
	else begin
		pos_x_base_r <= pos_x_base_r;
	end
end


//pos_y_base_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		pos_y_base_r <= 'd0;
	else if(tu_curr_state_r==TU_LAST_SIG_0) begin
		if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
			case(cu_depth_i)
				0, 1:	begin
							case(last_blk_idx_r)
								0, 2, 5, 9, 14, 20, 27, 35:	begin
									pos_y_base_r <= 'd0;
								end
								
								1, 4, 8, 13, 19, 26, 34, 42:	begin
									pos_y_base_r <= 'd4;
								end
								
								3, 7, 12, 18, 25, 33, 41, 48:	begin
									pos_y_base_r <= 'd8;
								end
								
								6, 11, 17, 24, 32, 40, 47, 53:	begin
									pos_y_base_r <= 'd12;
								end
								
								10, 16, 23, 31, 39, 46, 52, 57:	begin
									pos_y_base_r <= 'd16;
								end
								
								15, 22, 30, 38, 45, 51, 56, 60:	begin
									pos_y_base_r <= 'd20;
								end
								
								21, 29, 37, 44, 50, 55, 59, 62:	begin
									pos_y_base_r <= 'd24;
								end
								
								default:	begin
									pos_y_base_r <= 'd28;
								end							
							endcase
				end
				
				2:		begin
							case(last_blk_idx_r)
								0, 2, 5, 9:	begin
									pos_y_base_r <= 'd0;
								end
								
								1, 4, 8, 12:	begin
									pos_y_base_r <= 'd4;
								end
								
								3, 7, 11, 14:	begin
									pos_y_base_r <= 'd8;
								end
								
								default:	begin
									pos_y_base_r <= 'd12;
								end
							endcase
				end
				
				3:		begin
							if(scan_idx_r!=(`SCAN_HOR)) begin
								if(~last_blk_idx_r[0])
									pos_y_base_r <= 'd0;
								else 
									pos_y_base_r <= 'd4;
							end
							else begin
								if(~last_blk_idx_r[1])
									pos_y_base_r <= 'd0;
								else
									pos_y_base_r <= 'd4;
							end
				end
				
				default:begin
							pos_y_base_r <= 'd0;
				end
			endcase
		end
		else if(res_curr_state_r==RESIDUAL_CR_COEFF || res_curr_state_r==RESIDUAL_CB_COEFF) begin
			case(cu_depth_i)
				0, 1:	begin
							case(last_blk_idx_r)
								0, 2, 5, 9:	begin
									pos_y_base_r <= 'd0;
								end
								
								1, 4, 8, 12:	begin
									pos_y_base_r <= 'd4;
								end
								
								3, 7, 11, 14:	begin
									pos_y_base_r <= 'd8;
								end
								
								default:	begin
									pos_y_base_r <= 'd12;
								end
							endcase
				end
				
				2:		begin
							if(~last_blk_idx_r[0])
								pos_y_base_r <= 'd0;
							else
								pos_y_base_r <= 'd4;
				end
				
				3:		begin
							pos_y_base_r <= 'd0;
				end
				
				default:begin
							pos_y_base_r <= 'd0;
				end
			endcase
		end
		else begin
			pos_y_base_r <= 'd0;
		end        
	end
	else begin
		pos_y_base_r <= pos_y_base_r;
	end
end

//last_blk_res_r
assign	last_blk_res_r = tu_curr_state_r==TU_LAST_SIG_0 ? last_blk_data_w : scan_res_data_r;

//pos_x_inc_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		pos_x_inc_r <= 'd0;
	else if(tu_curr_state_r==TU_LAST_SIG_0) begin
		case(scan_idx_r)
			(`SCAN_DIAG):	begin
								if(last_blk_res_r[127:0]=='d0) begin
									if(last_blk_res_r[191:128]=='d0) begin
										if(last_blk_res_r[223:192]=='d0) begin
											if(last_blk_res_r[239:224]=='d0) begin
												pos_x_inc_r <= 'd0;			//0
											end
											else begin								//1
												pos_x_inc_r <= 'd0;
											end	
										end
										else begin
											if(last_blk_res_r[207:192]=='d0) begin
												pos_x_inc_r <= 'd1;			//2
											end
											else begin
												pos_x_inc_r <= 'd0;			//3
											end
										end	
									end
									else begin
										if(last_blk_res_r[159:128]=='d0) begin
											if(last_blk_res_r[175:160]=='d0) begin
												pos_x_inc_r <= 'd1;			//4	
											end
											else begin
												pos_x_inc_r <= 'd2;			//5
											end	
										end
										else begin
											if(last_blk_res_r[143:128]=='d0) begin
												pos_x_inc_r <= 'd0;			//6	
											end
											else begin
												pos_x_inc_r <= 'd1;			//7
											end
										end
									end
								end
								else begin
									if(last_blk_res_r[63:0]=='d0) begin
										if(last_blk_res_r[95:64]=='d0) begin
											if(last_blk_res_r[111:96]=='d0) begin
												pos_x_inc_r <= 'd2;			//8	
											end
											else begin
												pos_x_inc_r <= 'd3;			//9
											end	
										end
										else begin
											if(last_blk_res_r[79:64]=='d0) begin
												pos_x_inc_r <= 'd1;			//10	
											end
											else begin
												pos_x_inc_r <= 'd2;			//11
											end
										end	
									end
									else begin
										if(last_blk_res_r[31:0]=='d0) begin
											if(last_blk_res_r[47:32]=='d0) begin
												pos_x_inc_r <= 'd3;			//12	
											end
											else begin
												pos_x_inc_r <= 'd2;			//13
											end		
										end
										else begin
											if(last_blk_res_r[15:0]=='d0) begin
												pos_x_inc_r <= 'd3;			//14	
											end
											else begin
												pos_x_inc_r <= 'd3;			//15
											end
										end
									end
								end
			end
			
			(`SCAN_VER):	begin
								if(last_blk_res_r[127:0]=='d0) begin
									if(last_blk_res_r[191:128]=='d0) begin
										pos_x_inc_r <= 'd0;	//0-3
									end
									else begin
										pos_x_inc_r <= 'd1;	//4-7
									end			
								end
								else begin
									if(last_blk_res_r[63:0]=='d0) begin
										pos_x_inc_r <= 'd2;	//8-11	
									end
									else begin
										pos_x_inc_r <= 'd3;	//12-15
									end
								end
			end
			
			(`SCAN_HOR):	begin
								if(last_blk_res_r[127:0]=='d0) begin
									if(last_blk_res_r[191:128]=='d0) begin
										if(last_blk_res_r[223:192]=='d0) begin
											if(last_blk_res_r[239:224]=='d0) begin
												pos_x_inc_r <= 'd0;			//0
											end
											else begin								//1
												pos_x_inc_r <= 'd1;
											end	
										end
										else begin
											if(last_blk_res_r[207:192]=='d0) begin
												pos_x_inc_r <= 'd2;			//2
											end
											else begin
												pos_x_inc_r <= 'd3;			//3
											end
										end	
									end
									else begin
										if(last_blk_res_r[159:128]=='d0) begin
											if(last_blk_res_r[175:160]=='d0) begin
												pos_x_inc_r <= 'd0;			//4	
											end
											else begin
												pos_x_inc_r <= 'd1;			//5
											end	
										end
										else begin
											if(last_blk_res_r[143:128]=='d0) begin
												pos_x_inc_r <= 'd2;			//6	
											end
											else begin
												pos_x_inc_r <= 'd3;			//7
											end
										end
									end
								end
								else begin
									if(last_blk_res_r[63:0]=='d0) begin
										if(last_blk_res_r[95:64]=='d0) begin
											if(last_blk_res_r[111:96]=='d0) begin
												pos_x_inc_r <= 'd0;			//8	
											end
											else begin
												pos_x_inc_r <= 'd1;			//9
											end	
										end
										else begin
											if(last_blk_res_r[79:64]=='d0) begin
												pos_x_inc_r <= 'd2;			//10	
											end
											else begin
												pos_x_inc_r <= 'd3;			//11
											end
										end	
									end
									else begin
										if(last_blk_res_r[31:0]=='d0) begin
											if(last_blk_res_r[47:32]=='d0) begin
												pos_x_inc_r <= 'd0;			//12	
											end
											else begin
												pos_x_inc_r <= 'd1;			//13
											end		
										end
										else begin
											if(last_blk_res_r[15:0]=='d0) begin
												pos_x_inc_r <= 'd2;			//14	
											end
											else begin
												pos_x_inc_r <= 'd3;			//15
											end
										end
									end
								end
			end
			
			default:		begin
								pos_x_inc_r <= 'd0;
			end	
		endcase
	end
	else 
		pos_x_inc_r <= pos_x_inc_r;
end

//pos_y_inc_r
//pos_y_inc_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		pos_y_inc_r <= 'd0;
	else if(tu_curr_state_r==TU_LAST_SIG_0) begin
		case(scan_idx_r)
			(`SCAN_DIAG):	begin
								if(last_blk_res_r[127:0]=='d0) begin
									if(last_blk_res_r[191:128]=='d0) begin
										if(last_blk_res_r[223:192]=='d0) begin
											if(last_blk_res_r[239:224]=='d0) begin
												pos_y_inc_r <= 'd0;			//0
											end
											else begin								//1
												pos_y_inc_r <= 'd1;
											end	
										end
										else begin
											if(last_blk_res_r[207:192]=='d0) begin
												pos_y_inc_r <= 'd0;			//2
											end
											else begin
												pos_y_inc_r <= 'd2;			//3
											end
										end	
									end
									else begin
										if(last_blk_res_r[159:128]=='d0) begin
											if(last_blk_res_r[175:160]=='d0) begin
												pos_y_inc_r <= 'd1;			//4	
											end
											else begin
												pos_y_inc_r <= 'd0;			//5
											end	
										end
										else begin
											if(last_blk_res_r[143:128]=='d0) begin
												pos_y_inc_r <= 'd3;			//6	
											end
											else begin
												pos_y_inc_r <= 'd2;			//7
											end
										end
									end
								end
								else begin
									if(last_blk_res_r[63:0]=='d0) begin
										if(last_blk_res_r[95:64]=='d0) begin
											if(last_blk_res_r[111:96]=='d0) begin
												pos_y_inc_r <= 'd1;			//8	
											end
											else begin
												pos_y_inc_r <= 'd0;			//9
											end	
										end
										else begin
											if(last_blk_res_r[79:64]=='d0) begin
												pos_y_inc_r <= 'd3;			//10	
											end
											else begin
												pos_y_inc_r <= 'd2;			//11
											end
										end	
									end
									else begin
										if(last_blk_res_r[31:0]=='d0) begin
											if(last_blk_res_r[47:32]=='d0) begin
												pos_y_inc_r <= 'd1;			//12	
											end
											else begin
												pos_y_inc_r <= 'd3;			//13
											end		
										end
										else begin
											if(last_blk_res_r[15:0]=='d0) begin
												pos_y_inc_r <= 'd2;			//14	
											end
											else begin
												pos_y_inc_r <= 'd3;			//15
											end
										end
									end
								end
			end
			
			(`SCAN_VER):	begin
								if(last_blk_res_r[127:0]=='d0) begin
									if(last_blk_res_r[191:128]=='d0) begin
										if(last_blk_res_r[223:192]=='d0) begin
											if(last_blk_res_r[239:224]=='d0) begin
												pos_y_inc_r <= 'd0;			//0
											end
											else begin								//1
												pos_y_inc_r <= 'd1;
											end	
										end
										else begin
											if(last_blk_res_r[207:192]=='d0) begin
												pos_y_inc_r <= 'd2;			//2
											end
											else begin
												pos_y_inc_r <= 'd3;			//3
											end
										end	
									end
									else begin
										if(last_blk_res_r[159:128]=='d0) begin
											if(last_blk_res_r[175:160]=='d0) begin
												pos_y_inc_r <= 'd0;			//4	
											end
											else begin
												pos_y_inc_r <= 'd1;			//5
											end	
										end
										else begin
											if(last_blk_res_r[143:128]=='d0) begin
												pos_y_inc_r <= 'd2;			//6	
											end
											else begin
												pos_y_inc_r <= 'd3;			//7
											end
										end
									end
								end
								else begin
									if(last_blk_res_r[63:0]=='d0) begin
										if(last_blk_res_r[95:64]=='d0) begin
											if(last_blk_res_r[111:96]=='d0) begin
												pos_y_inc_r <= 'd0;			//8	
											end
											else begin
												pos_y_inc_r <= 'd1;			//9
											end	
										end
										else begin
											if(last_blk_res_r[79:64]=='d0) begin
												pos_y_inc_r <= 'd2;			//10	
											end
											else begin
												pos_y_inc_r <= 'd3;			//11
											end
										end	
									end
									else begin
										if(last_blk_res_r[31:0]=='d0) begin
											if(last_blk_res_r[47:32]=='d0) begin
												pos_y_inc_r <= 'd0;			//12	
											end
											else begin
												pos_y_inc_r <= 'd1;			//13
											end		
										end
										else begin
											if(last_blk_res_r[15:0]=='d0) begin
												pos_y_inc_r <= 'd2;			//14	
											end
											else begin
												pos_y_inc_r <= 'd3;			//15
											end
										end
									end
								end
			end
			
			(`SCAN_HOR):	begin
								if(last_blk_res_r[127:0]=='d0) begin
									if(last_blk_res_r[191:128]=='d0) begin
										pos_y_inc_r <= 'd0;	//0-3
									end
									else begin
										pos_y_inc_r <= 'd1;	//4-7
									end			
								end
								else begin
									if(last_blk_res_r[63:0]=='d0) begin
										pos_y_inc_r <= 'd2;	//8-11	
									end
									else begin
										pos_y_inc_r <= 'd3;	//12-15
									end
								end	
			end
			
			default:		begin
								pos_y_inc_r <= 'd0;
			end	
		endcase  
	end
	else 
		pos_y_inc_r <= pos_y_inc_r;
end


















// *********************************************************
// sub_blk_sig_flag


assign	ctx_pair_sub_blk_sig_w = {2'b00, bin_string_sub_blk_sig_r, ctx_idx_sub_blk_sig_r};


assign	bin_string_sub_blk_sig_r = enc_bin_cbf_r;


always @* begin
	if(enc_blk_cnt_r>'d0 && enc_blk_cnt_r<blk_tot_r)
		valid_num_bin_sub_blk_sig_r = 'd1;
	else
		valid_num_bin_sub_blk_sig_r = 'd0;
end

//ctx_idx_sub_blk_sig_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		if(ctx_sub_blk_sig_r[0])
			ctx_idx_sub_blk_sig_r = {3'd1, 5'd15};//1
		else
			ctx_idx_sub_blk_sig_r = {3'd0, 5'd13};//0
	end
	else begin
		if(ctx_sub_blk_sig_r[0])
			ctx_idx_sub_blk_sig_r = {3'd3, 5'd15};//3
		else
			ctx_idx_sub_blk_sig_r = {3'd2, 5'd7};//2
	end
end

//ctx_sub_blk_sig_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_sub_blk_sig_r = tu_cbf_z2s_luma32x32_ler_w[blk_cbf_idx_r] | tu_cbf_z2s_luma32x32_rer_w[blk_cbf_idx_r];
			end
			
			'd2:		begin
							ctx_sub_blk_sig_r = tu_cbf_z2s_luma16x16_ler_w[blk_cbf_idx_r] | tu_cbf_z2s_luma16x16_rer_w[blk_cbf_idx_r];
			end
			
			'd3:		begin
							ctx_sub_blk_sig_r = tu_cbf_z2s_luma8x8_ler_r[blk_cbf_idx_r] | tu_cbf_z2s_luma8x8_rer_r[blk_cbf_idx_r];
			end
			
			default:	begin
							ctx_sub_blk_sig_r = 'd0;
			end
		endcase	
	end
	else if(res_curr_state_r==RESIDUAL_CR_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_sub_blk_sig_r = tu_cbf_z2s_cr16x16_ler_w[blk_cbf_idx_r] | tu_cbf_z2s_cr16x16_rer_w[blk_cbf_idx_r];
			end
			
			'd2:		begin
							ctx_sub_blk_sig_r = tu_cbf_z2s_cr8x8_ler_w[blk_cbf_idx_r] | tu_cbf_z2s_cr8x8_rer_w[blk_cbf_idx_r];
			end
			
			'd3:		begin
							ctx_sub_blk_sig_r = tu_cbf_z2s_cr4x4_ler_w | tu_cbf_z2s_cr4x4_rer_w;
			end
			
			default:	begin
				
			end
		endcase
	end	
	else if(res_curr_state_r==RESIDUAL_CB_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							ctx_sub_blk_sig_r = tu_cbf_z2s_cb16x16_ler_w[blk_cbf_idx_r] | tu_cbf_z2s_cb16x16_rer_w[blk_cbf_idx_r];
			end
			
			'd2:		begin
							ctx_sub_blk_sig_r = tu_cbf_z2s_cb8x8_ler_w[blk_cbf_idx_r] | tu_cbf_z2s_cb8x8_rer_w[blk_cbf_idx_r];
			end
			
			'd3:		begin
							ctx_sub_blk_sig_r = tu_cbf_z2s_cb4x4_ler_w | tu_cbf_z2s_cb4x4_rer_w;
			end
			
			default:	begin
				
			end
		endcase
	end	
	else begin
		ctx_sub_blk_sig_r = 'd0;
	end
end



// **********************************************************
// sig_flag

//ctx_pair_sig_flag_0_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_0_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_0_r = 'd0;
			'd1:	ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_15_w;
			'd2:    ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_14_w;
			'd3:    ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_13_w;
			'd4:    ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_12_w;
			'd5:    ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_11_w;
			'd6:    ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_10_w;
			'd7:    ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_9_w;
			'd8:    ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_8_w;
			'd9:    ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_7_w;
			'd10:   ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_6_w;
			'd11:   ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_5_w;
			'd12:   ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_4_w;
			'd13:   ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_3_w;
			'd14:   ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_2_w;
			'd15:   ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_1_w;
			default:ctx_pair_sig_flag_0_r = ctx_pair_sig_flag_1_w;
		endcase
	end
end

//ctx_pair_sig_flag_1_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_1_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_1_r = 'd0;
			'd1:	ctx_pair_sig_flag_1_r = 'd0;
			'd2:    ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_15_w;
			'd3:    ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_14_w;
			'd4:    ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_13_w;
			'd5:    ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_12_w;
			'd6:    ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_11_w;
			'd7:    ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_10_w;
			'd8:    ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_9_w;
			'd9:    ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_8_w;
			'd10:   ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_7_w;
			'd11:   ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_6_w;
			'd12:   ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_5_w;
			'd13:   ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_4_w;
			'd14:   ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_3_w;
			'd15:   ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_2_w;
			default:ctx_pair_sig_flag_1_r = ctx_pair_sig_flag_2_w;
		endcase                                             
	end
end

//ctx_pair_sig_flag_2_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_2_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_2_r = 'd0;
			'd1:	ctx_pair_sig_flag_2_r = 'd0;
			'd2:    ctx_pair_sig_flag_2_r = 'd0;
			'd3:    ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_15_w;
			'd4:    ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_14_w;
			'd5:    ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_13_w;
			'd6:    ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_12_w;
			'd7:    ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_11_w;
			'd8:    ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_10_w;
			'd9:    ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_9_w;
			'd10:   ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_8_w;
			'd11:   ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_7_w;
			'd12:   ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_6_w;
			'd13:   ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_5_w;
			'd14:   ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_4_w;
			'd15:   ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_3_w;
			default:ctx_pair_sig_flag_2_r = ctx_pair_sig_flag_3_w;
		endcase                                             
	end
end

//ctx_pair_sig_flag_3_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_3_r = ctx_pair_sig_flag_3_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_3_r = 'd0;
			'd1:	ctx_pair_sig_flag_3_r = 'd0;
			'd2:    ctx_pair_sig_flag_3_r = 'd0;
			'd3:    ctx_pair_sig_flag_3_r = 'd0;
			'd4:    ctx_pair_sig_flag_3_r = ctx_pair_sig_flag_15_w;
			'd5:    ctx_pair_sig_flag_3_r = ctx_pair_sig_flag_14_w;
			'd6:    ctx_pair_sig_flag_3_r = ctx_pair_sig_flag_13_w;
			'd7:    ctx_pair_sig_flag_3_r = ctx_pair_sig_flag_12_w;
			'd8:    ctx_pair_sig_flag_3_r = ctx_pair_sig_flag_11_w;
			'd9:    ctx_pair_sig_flag_3_r = ctx_pair_sig_flag_10_w;
			'd10:   ctx_pair_sig_flag_3_r = ctx_pair_sig_flag_9_w;
			'd11:   ctx_pair_sig_flag_3_r = ctx_pair_sig_flag_8_w;
			'd12:   ctx_pair_sig_flag_3_r = ctx_pair_sig_flag_7_w;
			'd13:   ctx_pair_sig_flag_3_r = ctx_pair_sig_flag_6_w;
			'd14:   ctx_pair_sig_flag_3_r = ctx_pair_sig_flag_5_w;
			'd15:   ctx_pair_sig_flag_3_r = ctx_pair_sig_flag_4_w;
			default:ctx_pair_sig_flag_3_r = ctx_pair_sig_flag_4_w;
		endcase                                             
	end
end

//ctx_pair_sig_flag_4_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_4_r = ctx_pair_sig_flag_4_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_4_r = 'd0;
			'd1:	ctx_pair_sig_flag_4_r = 'd0;
			'd2:    ctx_pair_sig_flag_4_r = 'd0;
			'd3:    ctx_pair_sig_flag_4_r = 'd0;
			'd4:    ctx_pair_sig_flag_4_r = 'd0;
			'd5:    ctx_pair_sig_flag_4_r = ctx_pair_sig_flag_15_w;
			'd6:    ctx_pair_sig_flag_4_r = ctx_pair_sig_flag_14_w;
			'd7:    ctx_pair_sig_flag_4_r = ctx_pair_sig_flag_13_w;
			'd8:    ctx_pair_sig_flag_4_r = ctx_pair_sig_flag_12_w;
			'd9:    ctx_pair_sig_flag_4_r = ctx_pair_sig_flag_11_w;
			'd10:   ctx_pair_sig_flag_4_r = ctx_pair_sig_flag_10_w;
			'd11:   ctx_pair_sig_flag_4_r = ctx_pair_sig_flag_9_w;
			'd12:   ctx_pair_sig_flag_4_r = ctx_pair_sig_flag_8_w;
			'd13:   ctx_pair_sig_flag_4_r = ctx_pair_sig_flag_7_w;
			'd14:   ctx_pair_sig_flag_4_r = ctx_pair_sig_flag_6_w;
			'd15:   ctx_pair_sig_flag_4_r = ctx_pair_sig_flag_5_w;
			default:ctx_pair_sig_flag_4_r = ctx_pair_sig_flag_5_w;
		endcase                                              
	end
end

//ctx_pair_sig_flag_5_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_5_r = ctx_pair_sig_flag_5_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_5_r = 'd0;
			'd1:	ctx_pair_sig_flag_5_r = 'd0;
			'd2:    ctx_pair_sig_flag_5_r = 'd0;
			'd3:    ctx_pair_sig_flag_5_r = 'd0;
			'd4:    ctx_pair_sig_flag_5_r = 'd0;
			'd5:    ctx_pair_sig_flag_5_r = 'd0;
			'd6:    ctx_pair_sig_flag_5_r = ctx_pair_sig_flag_15_w;
			'd7:    ctx_pair_sig_flag_5_r = ctx_pair_sig_flag_14_w;
			'd8:    ctx_pair_sig_flag_5_r = ctx_pair_sig_flag_13_w;
			'd9:    ctx_pair_sig_flag_5_r = ctx_pair_sig_flag_12_w;
			'd10:   ctx_pair_sig_flag_5_r = ctx_pair_sig_flag_11_w;
			'd11:   ctx_pair_sig_flag_5_r = ctx_pair_sig_flag_10_w;
			'd12:   ctx_pair_sig_flag_5_r = ctx_pair_sig_flag_9_w;
			'd13:   ctx_pair_sig_flag_5_r = ctx_pair_sig_flag_8_w;
			'd14:   ctx_pair_sig_flag_5_r = ctx_pair_sig_flag_7_w;
			'd15:   ctx_pair_sig_flag_5_r = ctx_pair_sig_flag_6_w;
			default:ctx_pair_sig_flag_5_r = ctx_pair_sig_flag_6_w;
		endcase                                            
	end
end

//ctx_pair_sig_flag_6_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_6_r = ctx_pair_sig_flag_6_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_6_r = 'd0;
			'd1:	ctx_pair_sig_flag_6_r = 'd0;
			'd2:    ctx_pair_sig_flag_6_r = 'd0;
			'd3:    ctx_pair_sig_flag_6_r = 'd0;
			'd4:    ctx_pair_sig_flag_6_r = 'd0;
			'd5:    ctx_pair_sig_flag_6_r = 'd0;
			'd6:    ctx_pair_sig_flag_6_r = 'd0;
			'd7:    ctx_pair_sig_flag_6_r = ctx_pair_sig_flag_15_w;
			'd8:    ctx_pair_sig_flag_6_r = ctx_pair_sig_flag_14_w;
			'd9:    ctx_pair_sig_flag_6_r = ctx_pair_sig_flag_13_w;
			'd10:   ctx_pair_sig_flag_6_r = ctx_pair_sig_flag_12_w;
			'd11:   ctx_pair_sig_flag_6_r = ctx_pair_sig_flag_11_w;
			'd12:   ctx_pair_sig_flag_6_r = ctx_pair_sig_flag_10_w;
			'd13:   ctx_pair_sig_flag_6_r = ctx_pair_sig_flag_9_w;
			'd14:   ctx_pair_sig_flag_6_r = ctx_pair_sig_flag_8_w;
			'd15:   ctx_pair_sig_flag_6_r = ctx_pair_sig_flag_7_w;
			default:ctx_pair_sig_flag_6_r = ctx_pair_sig_flag_7_w;
		endcase                                             
	end
end

//ctx_pair_sig_flag_7_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_7_r = ctx_pair_sig_flag_7_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_7_r = 'd0;
			'd1:	ctx_pair_sig_flag_7_r = 'd0;
			'd2:    ctx_pair_sig_flag_7_r = 'd0;
			'd3:    ctx_pair_sig_flag_7_r = 'd0;
			'd4:    ctx_pair_sig_flag_7_r = 'd0;
			'd5:    ctx_pair_sig_flag_7_r = 'd0;
			'd6:    ctx_pair_sig_flag_7_r = 'd0;
			'd7:    ctx_pair_sig_flag_7_r = 'd0;
			'd8:    ctx_pair_sig_flag_7_r = ctx_pair_sig_flag_15_w;
			'd9:    ctx_pair_sig_flag_7_r = ctx_pair_sig_flag_14_w;
			'd10:   ctx_pair_sig_flag_7_r = ctx_pair_sig_flag_13_w;
			'd11:   ctx_pair_sig_flag_7_r = ctx_pair_sig_flag_12_w;
			'd12:   ctx_pair_sig_flag_7_r = ctx_pair_sig_flag_11_w;
			'd13:   ctx_pair_sig_flag_7_r = ctx_pair_sig_flag_10_w;
			'd14:   ctx_pair_sig_flag_7_r = ctx_pair_sig_flag_9_w;
			'd15:   ctx_pair_sig_flag_7_r = ctx_pair_sig_flag_8_w;
			default:ctx_pair_sig_flag_7_r = ctx_pair_sig_flag_8_w;
		endcase                                              
	end
end

//ctx_pair_sig_flag_8_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_8_r = ctx_pair_sig_flag_8_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_8_r = 'd0;
			'd1:	ctx_pair_sig_flag_8_r = 'd0;
			'd2:    ctx_pair_sig_flag_8_r = 'd0;
			'd3:    ctx_pair_sig_flag_8_r = 'd0;
			'd4:    ctx_pair_sig_flag_8_r = 'd0;
			'd5:    ctx_pair_sig_flag_8_r = 'd0;
			'd6:    ctx_pair_sig_flag_8_r = 'd0;
			'd7:    ctx_pair_sig_flag_8_r = 'd0;
			'd8:    ctx_pair_sig_flag_8_r = 'd0;
			'd9:    ctx_pair_sig_flag_8_r = ctx_pair_sig_flag_15_w;
			'd10:   ctx_pair_sig_flag_8_r = ctx_pair_sig_flag_14_w;
			'd11:   ctx_pair_sig_flag_8_r = ctx_pair_sig_flag_13_w;
			'd12:   ctx_pair_sig_flag_8_r = ctx_pair_sig_flag_12_w;
			'd13:   ctx_pair_sig_flag_8_r = ctx_pair_sig_flag_11_w;
			'd14:   ctx_pair_sig_flag_8_r = ctx_pair_sig_flag_10_w;
			'd15:   ctx_pair_sig_flag_8_r = ctx_pair_sig_flag_9_w;
			default:ctx_pair_sig_flag_8_r = ctx_pair_sig_flag_9_w;
		endcase                                          
	end
end

//ctx_pair_sig_flag_9_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_9_r = ctx_pair_sig_flag_9_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_9_r = 'd0;
			'd1:	ctx_pair_sig_flag_9_r = 'd0;
			'd2:    ctx_pair_sig_flag_9_r = 'd0;
			'd3:    ctx_pair_sig_flag_9_r = 'd0;
			'd4:    ctx_pair_sig_flag_9_r = 'd0;
			'd5:    ctx_pair_sig_flag_9_r = 'd0;
			'd6:    ctx_pair_sig_flag_9_r = 'd0;
			'd7:    ctx_pair_sig_flag_9_r = 'd0;
			'd8:    ctx_pair_sig_flag_9_r = 'd0;
			'd9:    ctx_pair_sig_flag_9_r = 'd0;
			'd10:   ctx_pair_sig_flag_9_r = ctx_pair_sig_flag_15_w;
			'd11:   ctx_pair_sig_flag_9_r = ctx_pair_sig_flag_14_w;
			'd12:   ctx_pair_sig_flag_9_r = ctx_pair_sig_flag_13_w;
			'd13:   ctx_pair_sig_flag_9_r = ctx_pair_sig_flag_12_w;
			'd14:   ctx_pair_sig_flag_9_r = ctx_pair_sig_flag_11_w;
			'd15:   ctx_pair_sig_flag_9_r = ctx_pair_sig_flag_10_w;
			default:ctx_pair_sig_flag_9_r = ctx_pair_sig_flag_10_w;
		endcase                                        
	end
end

//ctx_pair_sig_flag_10_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_10_r = ctx_pair_sig_flag_10_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_10_r = 'd0;
			'd1:	ctx_pair_sig_flag_10_r = 'd0;
			'd2:    ctx_pair_sig_flag_10_r = 'd0;
			'd3:    ctx_pair_sig_flag_10_r = 'd0;
			'd4:    ctx_pair_sig_flag_10_r = 'd0;
			'd5:    ctx_pair_sig_flag_10_r = 'd0;
			'd6:    ctx_pair_sig_flag_10_r = 'd0;
			'd7:    ctx_pair_sig_flag_10_r = 'd0;
			'd8:    ctx_pair_sig_flag_10_r = 'd0;
			'd9:    ctx_pair_sig_flag_10_r = 'd0;
			'd10:   ctx_pair_sig_flag_10_r = 'd0;
			'd11:   ctx_pair_sig_flag_10_r = ctx_pair_sig_flag_15_w;
			'd12:   ctx_pair_sig_flag_10_r = ctx_pair_sig_flag_14_w;
			'd13:   ctx_pair_sig_flag_10_r = ctx_pair_sig_flag_13_w;
			'd14:   ctx_pair_sig_flag_10_r = ctx_pair_sig_flag_12_w;
			'd15:   ctx_pair_sig_flag_10_r = ctx_pair_sig_flag_11_w;
			default:ctx_pair_sig_flag_10_r = ctx_pair_sig_flag_11_w;
		endcase                                              
	end
end

//ctx_pair_sig_flag_11_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_11_r = ctx_pair_sig_flag_11_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_11_r = 'd0;
			'd1:	ctx_pair_sig_flag_11_r = 'd0;
			'd2:    ctx_pair_sig_flag_11_r = 'd0;
			'd3:    ctx_pair_sig_flag_11_r = 'd0;
			'd4:    ctx_pair_sig_flag_11_r = 'd0;
			'd5:    ctx_pair_sig_flag_11_r = 'd0;
			'd6:    ctx_pair_sig_flag_11_r = 'd0;
			'd7:    ctx_pair_sig_flag_11_r = 'd0;
			'd8:    ctx_pair_sig_flag_11_r = 'd0;
			'd9:    ctx_pair_sig_flag_11_r = 'd0;
			'd10:   ctx_pair_sig_flag_11_r = 'd0;
			'd11:   ctx_pair_sig_flag_11_r = 'd0;
			'd12:   ctx_pair_sig_flag_11_r = ctx_pair_sig_flag_15_w;
			'd13:   ctx_pair_sig_flag_11_r = ctx_pair_sig_flag_14_w;
			'd14:   ctx_pair_sig_flag_11_r = ctx_pair_sig_flag_13_w;
			'd15:   ctx_pair_sig_flag_11_r = ctx_pair_sig_flag_12_w;
			default:ctx_pair_sig_flag_11_r = ctx_pair_sig_flag_12_w;
		endcase                                             
	end
end

//ctx_pair_sig_flag_12_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_12_r = ctx_pair_sig_flag_12_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_12_r = 'd0;
			'd1:	ctx_pair_sig_flag_12_r = 'd0;
			'd2:    ctx_pair_sig_flag_12_r = 'd0;
			'd3:    ctx_pair_sig_flag_12_r = 'd0;
			'd4:    ctx_pair_sig_flag_12_r = 'd0;
			'd5:    ctx_pair_sig_flag_12_r = 'd0;
			'd6:    ctx_pair_sig_flag_12_r = 'd0;
			'd7:    ctx_pair_sig_flag_12_r = 'd0;
			'd8:    ctx_pair_sig_flag_12_r = 'd0;
			'd9:    ctx_pair_sig_flag_12_r = 'd0;
			'd10:   ctx_pair_sig_flag_12_r = 'd0;
			'd11:   ctx_pair_sig_flag_12_r = 'd0;
			'd12:   ctx_pair_sig_flag_12_r = 'd0;
			'd13:   ctx_pair_sig_flag_12_r = ctx_pair_sig_flag_15_w;
			'd14:   ctx_pair_sig_flag_12_r = ctx_pair_sig_flag_14_w;
			'd15:   ctx_pair_sig_flag_12_r = ctx_pair_sig_flag_13_w;
			default:ctx_pair_sig_flag_12_r = ctx_pair_sig_flag_13_w;
		endcase                                             
	end
end

//ctx_pair_sig_flag_13_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_13_r = ctx_pair_sig_flag_13_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_13_r = 'd0;
			'd1:	ctx_pair_sig_flag_13_r = 'd0;
			'd2:    ctx_pair_sig_flag_13_r = 'd0;
			'd3:    ctx_pair_sig_flag_13_r = 'd0;
			'd4:    ctx_pair_sig_flag_13_r = 'd0;
			'd5:    ctx_pair_sig_flag_13_r = 'd0;
			'd6:    ctx_pair_sig_flag_13_r = 'd0;
			'd7:    ctx_pair_sig_flag_13_r = 'd0;
			'd8:    ctx_pair_sig_flag_13_r = 'd0;
			'd9:    ctx_pair_sig_flag_13_r = 'd0;
			'd10:   ctx_pair_sig_flag_13_r = 'd0;
			'd11:   ctx_pair_sig_flag_13_r = 'd0;
			'd12:   ctx_pair_sig_flag_13_r = 'd0;
			'd13:   ctx_pair_sig_flag_13_r = 'd0;
			'd14:   ctx_pair_sig_flag_13_r = ctx_pair_sig_flag_15_w;
			'd15:   ctx_pair_sig_flag_13_r = ctx_pair_sig_flag_14_w;
			default:ctx_pair_sig_flag_13_r = ctx_pair_sig_flag_14_w;
		endcase                                             
	end
end

//ctx_pair_sig_flag_14_r
always @* begin
	if(enc_blk_cnt_r!='d0 && blk_tot_r!='d0)
		ctx_pair_sig_flag_14_r = ctx_pair_sig_flag_14_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_14_r = 'd0;
			'd1:	ctx_pair_sig_flag_14_r = 'd0;
			'd2:    ctx_pair_sig_flag_14_r = 'd0;
			'd3:    ctx_pair_sig_flag_14_r = 'd0;
			'd4:    ctx_pair_sig_flag_14_r = 'd0;
			'd5:    ctx_pair_sig_flag_14_r = 'd0;
			'd6:    ctx_pair_sig_flag_14_r = 'd0;
			'd7:    ctx_pair_sig_flag_14_r = 'd0;
			'd8:    ctx_pair_sig_flag_14_r = 'd0;
			'd9:    ctx_pair_sig_flag_14_r = 'd0;
			'd10:   ctx_pair_sig_flag_14_r = 'd0;
			'd11:   ctx_pair_sig_flag_14_r = 'd0;
			'd12:   ctx_pair_sig_flag_14_r = 'd0;
			'd13:   ctx_pair_sig_flag_14_r = 'd0;
			'd14:   ctx_pair_sig_flag_14_r = 'd0;
			'd15:   ctx_pair_sig_flag_14_r = ctx_pair_sig_flag_15_w;
			default:ctx_pair_sig_flag_14_r = ctx_pair_sig_flag_15_w;
		endcase                                               
	end
end

//ctx_pair_sig_flag_15_r
always @* begin
	if(enc_blk_cnt_r!='d0)
		ctx_pair_sig_flag_15_r = ctx_pair_sig_flag_15_w;
	else begin
		case(enc_last_coeff_idx_r)
			'd0:	ctx_pair_sig_flag_15_r = 'd0;
			'd1:	ctx_pair_sig_flag_15_r = 'd0;
			'd2:    ctx_pair_sig_flag_15_r = 'd0;
			'd3:    ctx_pair_sig_flag_15_r = 'd0;
			'd4:    ctx_pair_sig_flag_15_r = 'd0;
			'd5:    ctx_pair_sig_flag_15_r = 'd0;
			'd6:    ctx_pair_sig_flag_15_r = 'd0;
			'd7:    ctx_pair_sig_flag_15_r = 'd0;
			'd8:    ctx_pair_sig_flag_15_r = 'd0;
			'd9:    ctx_pair_sig_flag_15_r = 'd0;
			'd10:   ctx_pair_sig_flag_15_r = 'd0;
			'd11:   ctx_pair_sig_flag_15_r = 'd0;
			'd12:   ctx_pair_sig_flag_15_r = 'd0;
			'd13:   ctx_pair_sig_flag_15_r = 'd0;
			'd14:   ctx_pair_sig_flag_15_r = 'd0;
			'd15:   ctx_pair_sig_flag_15_r = 'd0;
			default:ctx_pair_sig_flag_15_r = ctx_pair_sig_flag_15_w;
		endcase                                               
	end
end



assign	ctx_pair_sig_flag_0_w  = {2'b00, bin_string_sig_flag_r[15],  ctx_idx_sig_flag_0_r };
assign	ctx_pair_sig_flag_1_w  = {2'b00, bin_string_sig_flag_r[14],  ctx_idx_sig_flag_1_r };
assign	ctx_pair_sig_flag_2_w  = {2'b00, bin_string_sig_flag_r[13],  ctx_idx_sig_flag_2_r };
assign	ctx_pair_sig_flag_3_w  = {2'b00, bin_string_sig_flag_r[12],  ctx_idx_sig_flag_3_r };
assign	ctx_pair_sig_flag_4_w  = {2'b00, bin_string_sig_flag_r[11],  ctx_idx_sig_flag_4_r };
assign	ctx_pair_sig_flag_5_w  = {2'b00, bin_string_sig_flag_r[10],  ctx_idx_sig_flag_5_r };
assign	ctx_pair_sig_flag_6_w  = {2'b00, bin_string_sig_flag_r[ 9],  ctx_idx_sig_flag_6_r };
assign	ctx_pair_sig_flag_7_w  = {2'b00, bin_string_sig_flag_r[ 8],  ctx_idx_sig_flag_7_r };
assign	ctx_pair_sig_flag_8_w  = {2'b00, bin_string_sig_flag_r[ 7],  ctx_idx_sig_flag_8_r };
assign	ctx_pair_sig_flag_9_w  = {2'b00, bin_string_sig_flag_r[ 6],  ctx_idx_sig_flag_9_r };
assign	ctx_pair_sig_flag_10_w = {2'b00, bin_string_sig_flag_r[ 5],  ctx_idx_sig_flag_10_r};
assign	ctx_pair_sig_flag_11_w = {2'b00, bin_string_sig_flag_r[ 4],  ctx_idx_sig_flag_11_r};
assign	ctx_pair_sig_flag_12_w = {2'b00, bin_string_sig_flag_r[ 3],  ctx_idx_sig_flag_12_r};
assign	ctx_pair_sig_flag_13_w = {2'b00, bin_string_sig_flag_r[ 2],  ctx_idx_sig_flag_13_r};
assign	ctx_pair_sig_flag_14_w = {2'b00, bin_string_sig_flag_r[ 1],  ctx_idx_sig_flag_14_r};
assign	ctx_pair_sig_flag_15_w = {2'b00, bin_string_sig_flag_r[ 0],  ctx_idx_sig_flag_15_r};


//enc_sig_cyc_cnt_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		enc_sig_cyc_cnt_r <= 'd0;
	else if(tu_curr_state_r!=TU_SIG_FLAG)
		enc_sig_cyc_cnt_r <= 'd0;
	else if(enc_sig_cyc_cnt_r==enc_sig_cyc_tot_r)
		enc_sig_cyc_cnt_r <= 'd0;
	else 
		enc_sig_cyc_cnt_r <= enc_sig_cyc_cnt_r + 'd1;
end

//enc_sig_cyc_tot_r
always @* begin
	case(valid_num_bin_sig_flag_r)
		'd0, 'd1, 'd2, 'd3, 'd4:	enc_sig_cyc_tot_r = 'd0;	
		'd5, 'd6, 'd7, 'd8:			enc_sig_cyc_tot_r = 'd1;
		'd9, 'd10, 'd11, 'd12:		enc_sig_cyc_tot_r = 'd2;
		'd13, 'd14, 'd15, 'd16:		enc_sig_cyc_tot_r = 'd3;
		default:					enc_sig_cyc_tot_r = 'd0;
	endcase
end


//valid_num_bin_sig_flag_r
always @* begin
	if(enc_blk_cnt_r=='d0) begin
		//if(enc_last_coeff_idx_r=='d0)
		//	valid_num_bin_sig_flag_r = 'd0;
		//else 
			valid_num_bin_sig_flag_r = enc_last_coeff_idx_r;
	end
	else if(enc_blk_cnt_r<blk_tot_r) begin
		if(enc_last_coeff_idx_r=='d0)
			valid_num_bin_sig_flag_r = 'd15;
		else
			valid_num_bin_sig_flag_r = 'd16;
	end
	else begin
		valid_num_bin_sig_flag_r = 'd16;
	end
end

//bin_string_sig_flag_r
always @* begin
	if(enc_blk_cnt_r=='d0)
		bin_string_sig_flag_r = enc_coeff_sig_r;// << (5'd16-enc_last_coeff_idx_r);
	else
		bin_string_sig_flag_r = enc_coeff_sig_r;
end



//ctx_idx_sig_flag
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(cu_depth_i)
			'd0, 'd1, 'd2:	begin
								if(enc_blk_cnt_r<blk_tot_r) begin
									case(enc_pattern_sig_ctx_r)
										'd0:	begin
													ctx_idx_sig_flag_15_r = {3'd2, 5'd15};//'d26; 
													ctx_idx_sig_flag_14_r = {3'd4, 5'd6 };//'d25;	
													ctx_idx_sig_flag_13_r = {3'd4, 5'd6 };//'d25;   
													ctx_idx_sig_flag_12_r = {3'd4, 5'd6 };//'d25;   
													ctx_idx_sig_flag_11_r = {3'd4, 5'd6 };//'d25;   
													ctx_idx_sig_flag_10_r = {3'd4, 5'd6 };//'d25;   
													ctx_idx_sig_flag_9_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_8_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_7_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_6_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_5_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_4_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_3_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_2_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_1_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_0_r  = {3'd0, 5'd21};//'d24;   
										end
										
										'd1:	begin
													ctx_idx_sig_flag_15_r = {3'd2, 5'd15};//'d26; 	
													ctx_idx_sig_flag_14_r = {3'd4, 5'd6 };//'d25;	
													ctx_idx_sig_flag_13_r = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_12_r = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_11_r = {3'd4, 5'd6 };//'d25;   
													ctx_idx_sig_flag_10_r = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_9_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_8_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_7_r  = {3'd4, 5'd6 };//'d25;   
													ctx_idx_sig_flag_6_r  = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_5_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_4_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_3_r  = {3'd4, 5'd6 };//'d25;   
													ctx_idx_sig_flag_2_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_1_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_0_r  = {3'd0, 5'd21};//'d24;   
										end
										
										'd2:	begin
											        ctx_idx_sig_flag_15_r = {3'd2, 5'd15};//'d26; 	
													ctx_idx_sig_flag_14_r = {3'd2, 5'd15};//'d26;	
													ctx_idx_sig_flag_13_r = {3'd4, 5'd6 };//'d25;   
													ctx_idx_sig_flag_12_r = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_11_r = {3'd4, 5'd6 };//'d25;   
													ctx_idx_sig_flag_10_r = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_9_r  = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_8_r  = {3'd4, 5'd6 };//'d25;   
													ctx_idx_sig_flag_7_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_6_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_5_r  = {3'd4, 5'd6 };//'d25;   
													ctx_idx_sig_flag_4_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_3_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_2_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_1_r  = {3'd0, 5'd21};//'d24;   
													ctx_idx_sig_flag_0_r  = {3'd0, 5'd21};//'d24;   
										end
										
										default:begin
													ctx_idx_sig_flag_15_r = {3'd2, 5'd15};//'d26; 	
													ctx_idx_sig_flag_14_r = {3'd2, 5'd15};//'d26;	
													ctx_idx_sig_flag_13_r = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_12_r = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_11_r = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_10_r = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_9_r  = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_8_r  = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_7_r  = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_6_r  = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_5_r  = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_4_r  = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_3_r  = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_2_r  = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_1_r  = {3'd2, 5'd15};//'d26;   
													ctx_idx_sig_flag_0_r  = {3'd2, 5'd15};//'d26; 
										end										
									endcase	
								end
								else begin
									case(enc_pattern_sig_ctx_r) 
										'd0:	begin
													ctx_idx_sig_flag_15_r = {3'd3, 5'd31};//'d0; 
													ctx_idx_sig_flag_14_r = {3'd4, 5'd5 };//'d22;	
													ctx_idx_sig_flag_13_r = {3'd4, 5'd5 };//'d22;   
													ctx_idx_sig_flag_12_r = {3'd4, 5'd5 };//'d22;   
													ctx_idx_sig_flag_11_r = {3'd4, 5'd5 };//'d22;   
													ctx_idx_sig_flag_10_r = {3'd4, 5'd5 };//'d22;   
													ctx_idx_sig_flag_9_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_8_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_7_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_6_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_5_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_4_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_3_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_2_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_1_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_0_r  = {3'd0, 5'd20};//'d21;   
										end
										
										'd1:	begin
													ctx_idx_sig_flag_15_r = {3'd3, 5'd31 };//'d0; 	
													ctx_idx_sig_flag_14_r = {3'd4, 5'd5 };//'d22;	
													ctx_idx_sig_flag_13_r = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_12_r = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_11_r = {3'd4, 5'd5 };//'d22;   
													ctx_idx_sig_flag_10_r = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_9_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_8_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_7_r  = {3'd4, 5'd5 };//'d22;   
													ctx_idx_sig_flag_6_r  = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_5_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_4_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_3_r  = {3'd4, 5'd5 };//'d22;   
													ctx_idx_sig_flag_2_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_1_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_0_r  = {3'd0, 5'd20};//'d21;   
										end
										
										'd2:	begin
											        ctx_idx_sig_flag_15_r = {3'd3, 5'd31 };//'d0; 	
													ctx_idx_sig_flag_14_r = {3'd2, 5'd14};//'d23;	
													ctx_idx_sig_flag_13_r = {3'd4, 5'd5 };//'d22;   
													ctx_idx_sig_flag_12_r = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_11_r = {3'd4, 5'd5 };//'d22;   
													ctx_idx_sig_flag_10_r = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_9_r  = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_8_r  = {3'd4, 5'd5 };//'d22;   
													ctx_idx_sig_flag_7_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_6_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_5_r  = {3'd4, 5'd5 };//'d22;   
													ctx_idx_sig_flag_4_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_3_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_2_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_1_r  = {3'd0, 5'd20};//'d21;   
													ctx_idx_sig_flag_0_r  = {3'd0, 5'd20};//'d21;   
										end
										
										default:begin
													ctx_idx_sig_flag_15_r = {3'd3, 5'd31};//'d0; 	
													ctx_idx_sig_flag_14_r = {3'd2, 5'd14};//'d23;	
													ctx_idx_sig_flag_13_r = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_12_r = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_11_r = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_10_r = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_9_r  = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_8_r  = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_7_r  = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_6_r  = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_5_r  = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_4_r  = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_3_r  = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_2_r  = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_1_r  = {3'd2, 5'd14};//'d23;   
													ctx_idx_sig_flag_0_r  = {3'd2, 5'd14};//'d23; 
										end										
									endcase	
								end
			end
			
			'd3:	begin
						case(scan_idx_r)
							(`SCAN_DIAG):	begin
												if(enc_blk_cnt_r<blk_tot_r) begin
													case(enc_pattern_sig_ctx_r)
														'd0:	begin
																	ctx_idx_sig_flag_15_r = {3'd2, 5'd11};//'d14; 	
																	ctx_idx_sig_flag_14_r = {3'd4, 5'd2 };//'d13;	
																	ctx_idx_sig_flag_13_r = {3'd4, 5'd2 };//'d13;   
																	ctx_idx_sig_flag_12_r = {3'd4, 5'd2 };//'d13;   
																	ctx_idx_sig_flag_11_r = {3'd4, 5'd2 };//'d13;   
																	ctx_idx_sig_flag_10_r = {3'd4, 5'd2 };//'d13;   
																	ctx_idx_sig_flag_9_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_8_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_7_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_6_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_3_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd17};//'d12;   
														end
														
														'd1:	begin
																	ctx_idx_sig_flag_15_r = {3'd2, 5'd11};//'d14;		 	
																	ctx_idx_sig_flag_14_r = {3'd4, 5'd2 };//'d13;	
																	ctx_idx_sig_flag_13_r = {3'd2, 5'd11};//'d14;   
																	ctx_idx_sig_flag_12_r = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_11_r = {3'd4, 5'd2 };//'d13;   
																	ctx_idx_sig_flag_10_r = {3'd2, 5'd11};//'d14;   
																	ctx_idx_sig_flag_9_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_8_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_7_r  = {3'd4, 5'd2 };//'d13;   
																	ctx_idx_sig_flag_6_r  = {3'd2, 5'd11};//'d14;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_3_r  = {3'd4, 5'd2 };//'d13;   
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd17};//'d12;   
														end
														
														'd2:	begin
															        ctx_idx_sig_flag_15_r = {3'd2, 5'd11};//'d14; 	
																	ctx_idx_sig_flag_14_r = {3'd2, 5'd11};//'d14;	
																	ctx_idx_sig_flag_13_r = {3'd4, 5'd2 };//'d13;   
																	ctx_idx_sig_flag_12_r = {3'd2, 5'd11};//'d14;   
																	ctx_idx_sig_flag_11_r = {3'd4, 5'd2 };//'d13;   
																	ctx_idx_sig_flag_10_r = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_9_r  = {3'd2, 5'd11};//'d14;   
																	ctx_idx_sig_flag_8_r  = {3'd4, 5'd2 };//'d13;   
																	ctx_idx_sig_flag_7_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_6_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_5_r  = {3'd4, 5'd2 };//'d13;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_3_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd17};//'d12;   
														end
														
														default:begin
																	ctx_idx_sig_flag_15_r = {3'd0, 5'd17};//'d12; 	
																	ctx_idx_sig_flag_14_r = {3'd0, 5'd17};//'d12;	
																	ctx_idx_sig_flag_13_r = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_12_r = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_11_r = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_10_r = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_9_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_8_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_7_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_6_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_3_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd17};//'d12;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd17};//'d12; 
														end										
													endcase	
												end
												else begin
													case(enc_pattern_sig_ctx_r)
														'd0:	begin
																	ctx_idx_sig_flag_15_r = {3'd3, 5'd31};//'d0; 	
																	ctx_idx_sig_flag_14_r = {3'd4, 5'd1 };//'d10;	
																	ctx_idx_sig_flag_13_r = {3'd4, 5'd1 };//'d10;   
																	ctx_idx_sig_flag_12_r = {3'd4, 5'd1 };//'d10;   
																	ctx_idx_sig_flag_11_r = {3'd4, 5'd1 };//'d10;   
																	ctx_idx_sig_flag_10_r = {3'd4, 5'd1 };//'d10;   
																	ctx_idx_sig_flag_9_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_8_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_7_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_6_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_3_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd16};//'d9;   
														end
														
														'd1:	begin
																	ctx_idx_sig_flag_15_r = {3'd3, 5'd31};//'d0;		 	
																	ctx_idx_sig_flag_14_r = {3'd4, 5'd1 };//'d10;	
																	ctx_idx_sig_flag_13_r = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_12_r = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_11_r = {3'd4, 5'd1 };//'d10;   
																	ctx_idx_sig_flag_10_r = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_9_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_8_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_7_r  = {3'd4, 5'd1 };//'d10;   
																	ctx_idx_sig_flag_6_r  = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_3_r  = {3'd4, 5'd1 };//'d10;   
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd16};//'d9;   
														end
														
														'd2:	begin
															        ctx_idx_sig_flag_15_r = {3'd3, 5'd31};//'d0; 	
																	ctx_idx_sig_flag_14_r = {3'd2, 5'd10};//'d11;	
																	ctx_idx_sig_flag_13_r = {3'd4, 5'd1 };//'d10;   
																	ctx_idx_sig_flag_12_r = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_11_r = {3'd4, 5'd1 };//'d10;   
																	ctx_idx_sig_flag_10_r = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_9_r  = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_8_r  = {3'd4, 5'd1 };//'d10;   
																	ctx_idx_sig_flag_7_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_6_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_5_r  = {3'd4, 5'd1 };//'d10;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_3_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd16};//'d9;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd16};//'d9;   
														end
														
														default:begin
																	ctx_idx_sig_flag_15_r = {3'd3, 5'd31};//'d0; 	
																	ctx_idx_sig_flag_14_r = {3'd2, 5'd10};//'d11;	
																	ctx_idx_sig_flag_13_r = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_12_r = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_11_r = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_10_r = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_9_r  = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_8_r  = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_7_r  = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_6_r  = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_5_r  = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_4_r  = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_3_r  = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_2_r  = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_1_r  = {3'd2, 5'd10};//'d11;   
																	ctx_idx_sig_flag_0_r  = {3'd2, 5'd10};//'d11; 
														end										
													endcase	
												end
							end
							
							(`SCAN_HOR):	begin
												if(enc_blk_cnt_r<blk_tot_r) begin
													case(enc_pattern_sig_ctx_r)
														'd0:	begin
																	ctx_idx_sig_flag_15_r = {3'd2, 5'd13};//'d20; 
																	ctx_idx_sig_flag_14_r = {3'd4, 5'd4 };//'d19;	
																	ctx_idx_sig_flag_13_r = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_12_r = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_11_r = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_10_r = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_9_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_8_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_7_r  = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_6_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_3_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd19};//'d18;   
														end
														
														'd1:	begin
																	ctx_idx_sig_flag_15_r = {3'd2, 5'd13};//'d20; 	
																	ctx_idx_sig_flag_14_r = {3'd2, 5'd13};//'d20;	
																	ctx_idx_sig_flag_13_r = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_12_r = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_11_r = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_10_r = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_9_r  = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_8_r  = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_7_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_6_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_3_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd19};//'d18;   
														end
														
														'd2:	begin
															        ctx_idx_sig_flag_15_r = {3'd2, 5'd13};//'d20; 	
																	ctx_idx_sig_flag_14_r = {3'd4, 5'd4 };//'d19;	
																	ctx_idx_sig_flag_13_r = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_12_r = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_11_r = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_10_r = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_9_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_8_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_7_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_6_r  = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_3_r  = {3'd2, 5'd13};//'d19;   
																	ctx_idx_sig_flag_2_r  = {3'd4, 5'd4 };//'d20;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd19};//'d18;   
														end
														
														default:begin
																	ctx_idx_sig_flag_15_r = {3'd2, 5'd13};//'d20; 	
																	ctx_idx_sig_flag_14_r = {3'd2, 5'd13};//'d20;	
																	ctx_idx_sig_flag_13_r = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_12_r = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_11_r = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_10_r = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_9_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_8_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_7_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_6_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_5_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_4_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_3_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_2_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_1_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_0_r  = {3'd2, 5'd13};//'d20; 
														end										
													endcase	
												end
												else begin
													case(enc_pattern_sig_ctx_r)
														'd0:	begin
																	ctx_idx_sig_flag_15_r = {3'd3, 5'd31 };//'d0; 
																	ctx_idx_sig_flag_14_r = {3'd4, 5'd3 };//'d16;	
																	ctx_idx_sig_flag_13_r = {3'd4, 5'd3 };//'d16;  
																	ctx_idx_sig_flag_12_r = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_11_r = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_10_r = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_9_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_8_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_7_r  = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_6_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_3_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd18};//'d15;   
														end
														
														'd1:	begin
																	ctx_idx_sig_flag_15_r = {3'd3, 5'd31};//'d0; 	
																	ctx_idx_sig_flag_14_r = {3'd2, 5'd12};//'d17;	
																	ctx_idx_sig_flag_13_r = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_12_r = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_11_r = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_10_r = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_9_r  = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_8_r  = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_7_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_6_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_3_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd18};//'d15;   
														end
														
														'd2:	begin
															        ctx_idx_sig_flag_15_r = {3'd3, 5'd31};//'d0; 	
																	ctx_idx_sig_flag_14_r = {3'd4, 5'd3 };//'d16;	
																	ctx_idx_sig_flag_13_r = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_12_r = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_11_r = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_10_r = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_9_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_8_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_7_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_6_r  = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_3_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_2_r  = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd18};//'d15;   
														end
														
														default:begin
																	ctx_idx_sig_flag_15_r = {3'd3, 5'd31};//'d0; 	
																	ctx_idx_sig_flag_14_r = {3'd2, 5'd12};//'d17;	
																	ctx_idx_sig_flag_13_r = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_12_r = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_11_r = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_10_r = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_9_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_8_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_7_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_6_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_5_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_4_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_3_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_2_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_1_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_0_r  = {3'd2, 5'd12};//'d17; 
														end										
													endcase	
												end
							end
							
							(`SCAN_VER):	begin
												if(enc_blk_cnt_r<blk_tot_r) begin
													case(enc_pattern_sig_ctx_r)
														'd0:	begin
																	ctx_idx_sig_flag_15_r = {3'd2, 5'd13};//'d20; 
																	ctx_idx_sig_flag_14_r = {3'd4, 5'd4 };//'d19;	
																	ctx_idx_sig_flag_13_r = {3'd4, 5'd4 };//'d19;  
																	ctx_idx_sig_flag_12_r = {3'd0, 5'd19};//'d18;  
																	ctx_idx_sig_flag_11_r = {3'd4, 5'd4 };//'d19;  
																	ctx_idx_sig_flag_10_r = {3'd4, 5'd4 };//'d19;  
																	ctx_idx_sig_flag_9_r  = {3'd0, 5'd19};//'d18;  
																	ctx_idx_sig_flag_8_r  = {3'd0, 5'd19};//'d18;  
																	ctx_idx_sig_flag_7_r  = {3'd4, 5'd4 };//'d19;  
																	ctx_idx_sig_flag_6_r  = {3'd0, 5'd19};//'d18;  
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd19};//'d18;  
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd19};//'d18;  
																	ctx_idx_sig_flag_3_r  = {3'd0, 5'd19};//'d18;  
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd19};//'d18;  
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd19};//'d18;  
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd19};//'d18;  
														end                                
														                                   
														'd1:	begin                      
																	ctx_idx_sig_flag_15_r = {3'd2, 5'd13};//'d20; 	
																	ctx_idx_sig_flag_14_r = {3'd4, 5'd4 };//'d19;	
																	ctx_idx_sig_flag_13_r = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_12_r = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_11_r = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_10_r = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_9_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_8_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_7_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_6_r  = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_3_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_2_r  = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd19};//'d18;   
														end                              
														                                 
														'd2:	begin                    
															        ctx_idx_sig_flag_15_r = {3'd2, 5'd13};//'d20; 	
																	ctx_idx_sig_flag_14_r = {3'd2, 5'd13};//'d20;	
																	ctx_idx_sig_flag_13_r = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_12_r = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_11_r = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_10_r = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_9_r  = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_8_r  = {3'd4, 5'd4 };//'d19;   
																	ctx_idx_sig_flag_7_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_6_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_3_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd19};//'d18;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd19};//'d18;   
														end                                
														                                   
														default:begin                      
																	ctx_idx_sig_flag_15_r = {3'd2, 5'd13};//'d20; 	
																	ctx_idx_sig_flag_14_r = {3'd2, 5'd13};//'d20;	
																	ctx_idx_sig_flag_13_r = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_12_r = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_11_r = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_10_r = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_9_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_8_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_7_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_6_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_5_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_4_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_3_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_2_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_1_r  = {3'd2, 5'd13};//'d20;   
																	ctx_idx_sig_flag_0_r  = {3'd2, 5'd13};//'d20; 
														end									
													endcase	                                
												end                                         
												else begin                                  
													case(enc_pattern_sig_ctx_r)             
														'd0:	begin                       
																	ctx_idx_sig_flag_15_r = {3'd3, 5'd31};//'d0; 
																	ctx_idx_sig_flag_14_r = {3'd4, 5'd3 };//'d16;	
																	ctx_idx_sig_flag_13_r = {3'd4, 5'd3 };//'d16;  
																	ctx_idx_sig_flag_12_r = {3'd0, 5'd18};//'d15;  
																	ctx_idx_sig_flag_11_r = {3'd4, 5'd3 };//'d16;  
																	ctx_idx_sig_flag_10_r = {3'd4, 5'd3 };//'d16;  
																	ctx_idx_sig_flag_9_r  = {3'd0, 5'd18};//'d15;  
																	ctx_idx_sig_flag_8_r  = {3'd0, 5'd18};//'d15;  
																	ctx_idx_sig_flag_7_r  = {3'd4, 5'd3 };//'d16;  
																	ctx_idx_sig_flag_6_r  = {3'd0, 5'd18};//'d15;  
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd18};//'d15;  
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd18};//'d15;  
																	ctx_idx_sig_flag_3_r  = {3'd0, 5'd18};//'d15;  
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd18};//'d15;  
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd18};//'d15;  
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd18};//'d15;  
														end                                
														                                   
														'd1:	begin                      
																	ctx_idx_sig_flag_15_r = {3'd3, 5'd31};//'d0; 	
																	ctx_idx_sig_flag_14_r = {3'd4, 5'd3 };//'d16;	
																	ctx_idx_sig_flag_13_r = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_12_r = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_11_r = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_10_r = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_9_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_8_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_7_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_6_r  = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_3_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_2_r  = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd18};//'d15;   
														end                                 
														                                    
														'd2:	begin                       
															        ctx_idx_sig_flag_15_r = {3'd3, 5'd31};//'d0; 	
																	ctx_idx_sig_flag_14_r = {3'd2, 5'd12};//'d17;	
																	ctx_idx_sig_flag_13_r = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_12_r = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_11_r = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_10_r = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_9_r  = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_8_r  = {3'd4, 5'd3 };//'d16;   
																	ctx_idx_sig_flag_7_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_6_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_5_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_4_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_3_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_2_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_1_r  = {3'd0, 5'd18};//'d15;   
																	ctx_idx_sig_flag_0_r  = {3'd0, 5'd18};//'d15;   
														end                               
														                                  
														default:begin                     
																	ctx_idx_sig_flag_15_r = {3'd3, 5'd31};//'d0; 	
																	ctx_idx_sig_flag_14_r = {3'd2, 5'd12};//'d17;	
																	ctx_idx_sig_flag_13_r = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_12_r = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_11_r = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_10_r = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_9_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_8_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_7_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_6_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_5_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_4_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_3_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_2_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_1_r  = {3'd2, 5'd12};//'d17;   
																	ctx_idx_sig_flag_0_r  = {3'd2, 5'd12};//'d17; 
														end										
													endcase	
												end
							end
							
							default:	begin
											ctx_idx_sig_flag_15_r = 'd0; 	
											ctx_idx_sig_flag_14_r = 'd0;	
											ctx_idx_sig_flag_13_r = 'd0;   
											ctx_idx_sig_flag_12_r = 'd0;   
											ctx_idx_sig_flag_11_r = 'd0;   
											ctx_idx_sig_flag_10_r = 'd0;   
											ctx_idx_sig_flag_9_r  = 'd0;   
											ctx_idx_sig_flag_8_r  = 'd0;   
											ctx_idx_sig_flag_7_r  = 'd0;   
											ctx_idx_sig_flag_6_r  = 'd0;   
											ctx_idx_sig_flag_5_r  = 'd0;   
											ctx_idx_sig_flag_4_r  = 'd0;   
											ctx_idx_sig_flag_3_r  = 'd0;   
											ctx_idx_sig_flag_2_r  = 'd0;   
											ctx_idx_sig_flag_1_r  = 'd0;   
											ctx_idx_sig_flag_0_r  = 'd0;
							end							
						endcase
			end
			
			default:begin
						ctx_idx_sig_flag_15_r = 'd0; 	
						ctx_idx_sig_flag_14_r = 'd0;	
						ctx_idx_sig_flag_13_r = 'd0;   
						ctx_idx_sig_flag_12_r = 'd0;   
						ctx_idx_sig_flag_11_r = 'd0;   
						ctx_idx_sig_flag_10_r = 'd0;   
						ctx_idx_sig_flag_9_r  = 'd0;   
						ctx_idx_sig_flag_8_r  = 'd0;   
						ctx_idx_sig_flag_7_r  = 'd0;   
						ctx_idx_sig_flag_6_r  = 'd0;   
						ctx_idx_sig_flag_5_r  = 'd0;   
						ctx_idx_sig_flag_4_r  = 'd0;   
						ctx_idx_sig_flag_3_r  = 'd0;   
						ctx_idx_sig_flag_2_r  = 'd0;   
						ctx_idx_sig_flag_1_r  = 'd0;   
						ctx_idx_sig_flag_0_r  = 'd0;
			end
		endcase	
	end
	else begin
		case(cu_depth_i)
			'd0, 'd1:	begin
							case(enc_pattern_sig_ctx_r)
								'd0:	begin
											ctx_idx_sig_flag_15_r = enc_blk_cnt_r==blk_tot_r ? {3'd3, 5'd16} : {3'd2, 5'd20};//'d27 : 'd41; 	
											ctx_idx_sig_flag_14_r = {3'd1, 5'd20};//'d40; //'d13;	
											ctx_idx_sig_flag_13_r = {3'd1, 5'd20};//'d40; //'d13;   
											ctx_idx_sig_flag_12_r = {3'd1, 5'd20};//'d40; //'d13;   
											ctx_idx_sig_flag_11_r = {3'd1, 5'd20};//'d40; //'d13;   
											ctx_idx_sig_flag_10_r = {3'd1, 5'd20};//'d40; //'d13;   
											ctx_idx_sig_flag_9_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_8_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_7_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_6_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_5_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_4_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_3_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_2_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_1_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_0_r  = {3'd4, 5'd11};//'d39; //'d12;   
								end
								
								'd1:	begin
											ctx_idx_sig_flag_15_r = enc_blk_cnt_r==blk_tot_r ? {3'd3, 5'd16} : {3'd2, 5'd20};//'d27 : 'd41;
											ctx_idx_sig_flag_14_r = {3'd1, 5'd20};//'d40; //'d13; 
											ctx_idx_sig_flag_13_r = {3'd2, 5'd20};//'d41; //'d14; 
											ctx_idx_sig_flag_12_r = {3'd4, 5'd11};//'d39; //'d12; 
											ctx_idx_sig_flag_11_r = {3'd1, 5'd20};//'d40; //'d13; 
											ctx_idx_sig_flag_10_r = {3'd2, 5'd20};//'d41; //'d14; 
											ctx_idx_sig_flag_9_r  = {3'd4, 5'd11};//'d39; //'d12; 
											ctx_idx_sig_flag_8_r  = {3'd4, 5'd11};//'d39; //'d12; 
											ctx_idx_sig_flag_7_r  = {3'd1, 5'd20};//'d40; //'d13; 
											ctx_idx_sig_flag_6_r  = {3'd2, 5'd20};//'d41; //'d14; 
											ctx_idx_sig_flag_5_r  = {3'd4, 5'd11};//'d39; //'d12; 
											ctx_idx_sig_flag_4_r  = {3'd4, 5'd11};//'d39; //'d12; 
											ctx_idx_sig_flag_3_r  = {3'd1, 5'd20};//'d40; //'d13; 
											ctx_idx_sig_flag_2_r  = {3'd4, 5'd11};//'d39; //'d12; 
											ctx_idx_sig_flag_1_r  = {3'd4, 5'd11};//'d39; //'d12; 
											ctx_idx_sig_flag_0_r  = {3'd4, 5'd11};//'d39; //'d12; 
								end
								
								'd2:	begin
											ctx_idx_sig_flag_15_r = enc_blk_cnt_r==blk_tot_r ? {3'd3, 5'd16} : {3'd2, 5'd20};//'d27 : 'd41;
											ctx_idx_sig_flag_14_r = {3'd2, 5'd20};//'d41; //'d14;	
											ctx_idx_sig_flag_13_r = {3'd1, 5'd20};//'d40; //'d13;   
											ctx_idx_sig_flag_12_r = {3'd2, 5'd20};//'d41; //'d14;   
											ctx_idx_sig_flag_11_r = {3'd1, 5'd20};//'d40; //'d13;   
											ctx_idx_sig_flag_10_r = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_9_r  = {3'd2, 5'd20};//'d41; //'d14;   
											ctx_idx_sig_flag_8_r  = {3'd1, 5'd20};//'d40; //'d13;   
											ctx_idx_sig_flag_7_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_6_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_5_r  = {3'd1, 5'd20};//'d40; //'d13;   
											ctx_idx_sig_flag_4_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_3_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_2_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_1_r  = {3'd4, 5'd11};//'d39; //'d12;   
											ctx_idx_sig_flag_0_r  = {3'd4, 5'd11};//'d39; //'d12;   
								end
								
								default:begin
											ctx_idx_sig_flag_15_r = enc_blk_cnt_r==blk_tot_r ? {3'd3, 5'd16} : {3'd2, 5'd20};//'d27 : 'd41;
											ctx_idx_sig_flag_14_r = {3'd2, 5'd20};//'d41; //'d14;	 	
											ctx_idx_sig_flag_13_r = {3'd2, 5'd20};//'d41; //'d14;    
											ctx_idx_sig_flag_12_r = {3'd2, 5'd20};//'d41; //'d14;    
											ctx_idx_sig_flag_11_r = {3'd2, 5'd20};//'d41; //'d14;    
											ctx_idx_sig_flag_10_r = {3'd2, 5'd20};//'d41; //'d14;    
											ctx_idx_sig_flag_9_r  = {3'd2, 5'd20};//'d41; //'d14;    
											ctx_idx_sig_flag_8_r  = {3'd2, 5'd20};//'d41; //'d14;    
											ctx_idx_sig_flag_7_r  = {3'd2, 5'd20};//'d41; //'d14;    
											ctx_idx_sig_flag_6_r  = {3'd2, 5'd20};//'d41; //'d14;    
											ctx_idx_sig_flag_5_r  = {3'd2, 5'd20};//'d41; //'d14;    
											ctx_idx_sig_flag_4_r  = {3'd2, 5'd20};//'d41; //'d14;    
											ctx_idx_sig_flag_3_r  = {3'd2, 5'd20};//'d41; //'d14;    
											ctx_idx_sig_flag_2_r  = {3'd2, 5'd20};//'d41; //'d14;    
											ctx_idx_sig_flag_1_r  = {3'd2, 5'd20};//'d41; //'d14;    
											ctx_idx_sig_flag_0_r  = {3'd2, 5'd20};//'d41; //'d14;    
								end
							endcase
			end
			
			'd2:	begin
						case(enc_pattern_sig_ctx_r)
								'd0:	begin
											ctx_idx_sig_flag_15_r = enc_blk_cnt_r==blk_tot_r ? {3'd3, 5'd16} : {3'd2, 5'd19};//'d27 : 'd38; 	
											ctx_idx_sig_flag_14_r = {3'd1, 5'd19};//'d37; //'d10;	 	
											ctx_idx_sig_flag_13_r = {3'd1, 5'd19};//'d37; //'d10;      
											ctx_idx_sig_flag_12_r = {3'd1, 5'd19};//'d37; //'d10;      
											ctx_idx_sig_flag_11_r = {3'd1, 5'd19};//'d37; //'d10;      
											ctx_idx_sig_flag_10_r = {3'd1, 5'd19};//'d37; //'d10;      
											ctx_idx_sig_flag_9_r  = {3'd4, 5'd10};//'d36; //'d9;       
											ctx_idx_sig_flag_8_r  = {3'd4, 5'd10};//'d36; //'d9;       
											ctx_idx_sig_flag_7_r  = {3'd4, 5'd10};//'d36; //'d9;       
											ctx_idx_sig_flag_6_r  = {3'd4, 5'd10};//'d36; //'d9;       
											ctx_idx_sig_flag_5_r  = {3'd4, 5'd10};//'d36; //'d9;       
											ctx_idx_sig_flag_4_r  = {3'd4, 5'd10};//'d36; //'d9;       
											ctx_idx_sig_flag_3_r  = {3'd4, 5'd10};//'d36; //'d9;       
											ctx_idx_sig_flag_2_r  = {3'd4, 5'd10};//'d36; //'d9;       
											ctx_idx_sig_flag_1_r  = {3'd4, 5'd10};//'d36; //'d9;       
											ctx_idx_sig_flag_0_r  = {3'd4, 5'd10};//'d36; //'d9;       
								end
								
								'd1:	begin
											ctx_idx_sig_flag_15_r = enc_blk_cnt_r==blk_tot_r ? {3'd3, 5'd16} : {3'd2, 5'd19};//'d27 : 'd38; 
											ctx_idx_sig_flag_14_r = {3'd1, 5'd19};//'d37; //'d10;  
											ctx_idx_sig_flag_13_r = {3'd2, 5'd19};//'d38; //'d11;  
											ctx_idx_sig_flag_12_r = {3'd4, 5'd10};//'d36; //'d9;   
											ctx_idx_sig_flag_11_r = {3'd1, 5'd19};//'d37; //'d10;  
											ctx_idx_sig_flag_10_r = {3'd2, 5'd19};//'d38; //'d11;  
											ctx_idx_sig_flag_9_r  = {3'd4, 5'd10};//'d36; //'d9;   
											ctx_idx_sig_flag_8_r  = {3'd4, 5'd10};//'d36; //'d9;   
											ctx_idx_sig_flag_7_r  = {3'd1, 5'd19};//'d37; //'d10;  
											ctx_idx_sig_flag_6_r  = {3'd2, 5'd19};//'d38; //'d11;  
											ctx_idx_sig_flag_5_r  = {3'd4, 5'd10};//'d36; //'d9;   
											ctx_idx_sig_flag_4_r  = {3'd4, 5'd10};//'d36; //'d9;   
											ctx_idx_sig_flag_3_r  = {3'd1, 5'd19};//'d37; //'d10;  
											ctx_idx_sig_flag_2_r  = {3'd4, 5'd10};//'d36; //'d9;   
											ctx_idx_sig_flag_1_r  = {3'd4, 5'd10};//'d36; //'d9;   
											ctx_idx_sig_flag_0_r  = {3'd4, 5'd10};//'d36; //'d9;   
								end
								
								'd2:	begin
											ctx_idx_sig_flag_15_r = enc_blk_cnt_r==blk_tot_r ? {3'd3, 5'd16} : {3'd2, 5'd19};//'d27 : 'd38; 
											ctx_idx_sig_flag_14_r = {3'd2, 5'd19};//'d38; //'d11;		
											ctx_idx_sig_flag_13_r = {3'd1, 5'd19};//'d37; //'d10;     
											ctx_idx_sig_flag_12_r = {3'd2, 5'd19};//'d38; //'d11;     
											ctx_idx_sig_flag_11_r = {3'd1, 5'd19};//'d37; //'d10;     
											ctx_idx_sig_flag_10_r = {3'd4, 5'd10};//'d36; //'d9;      
											ctx_idx_sig_flag_9_r  = {3'd2, 5'd19};//'d38; //'d11;     
											ctx_idx_sig_flag_8_r  = {3'd1, 5'd19};//'d37; //'d10;     
											ctx_idx_sig_flag_7_r  = {3'd4, 5'd10};//'d36; //'d9;      
											ctx_idx_sig_flag_6_r  = {3'd4, 5'd10};//'d36; //'d9;      
											ctx_idx_sig_flag_5_r  = {3'd1, 5'd19};//'d37; //'d10;     
											ctx_idx_sig_flag_4_r  = {3'd4, 5'd10};//'d36; //'d9;      
											ctx_idx_sig_flag_3_r  = {3'd4, 5'd10};//'d36; //'d9;      
											ctx_idx_sig_flag_2_r  = {3'd4, 5'd10};//'d36; //'d9;      
											ctx_idx_sig_flag_1_r  = {3'd4, 5'd10};//'d36; //'d9;      
											ctx_idx_sig_flag_0_r  = {3'd4, 5'd10};//'d36; //'d9;      
								end
								
								default:begin
											ctx_idx_sig_flag_15_r = enc_blk_cnt_r==blk_tot_r ? {3'd3, 5'd16} : {3'd2, 5'd19};//'d27 : 'd38; 
											ctx_idx_sig_flag_14_r = {3'd2, 5'd19};//'d38; //'d11;		
											ctx_idx_sig_flag_13_r = {3'd2, 5'd19};//'d38; //'d11;   
											ctx_idx_sig_flag_12_r = {3'd2, 5'd19};//'d38; //'d11;   
											ctx_idx_sig_flag_11_r = {3'd2, 5'd19};//'d38; //'d11;   
											ctx_idx_sig_flag_10_r = {3'd2, 5'd19};//'d38; //'d11;   
											ctx_idx_sig_flag_9_r  = {3'd2, 5'd19};//'d38; //'d11;   
											ctx_idx_sig_flag_8_r  = {3'd2, 5'd19};//'d38; //'d11;   
											ctx_idx_sig_flag_7_r  = {3'd2, 5'd19};//'d38; //'d11;   
											ctx_idx_sig_flag_6_r  = {3'd2, 5'd19};//'d38; //'d11;   
											ctx_idx_sig_flag_5_r  = {3'd2, 5'd19};//'d38; //'d11;   
											ctx_idx_sig_flag_4_r  = {3'd2, 5'd19};//'d38; //'d11;   
											ctx_idx_sig_flag_3_r  = {3'd2, 5'd19};//'d38; //'d11;   
											ctx_idx_sig_flag_2_r  = {3'd2, 5'd19};//'d38; //'d11;   
											ctx_idx_sig_flag_1_r  = {3'd2, 5'd19};//'d38; //'d11;   
											ctx_idx_sig_flag_0_r  = {3'd2, 5'd19};//'d38; //'d11;   
								end
							endcase
			end
			
			'd3:	begin
						case(scan_idx_r)
							(`SCAN_DIAG):	begin
												ctx_idx_sig_flag_15_r = {3'd3, 5'd16};//27 //'d0; 	
												ctx_idx_sig_flag_14_r = {3'd0, 5'd14};//29 //'d2;	
												ctx_idx_sig_flag_13_r = {3'd2, 5'd8 };//28 //'d1;
												ctx_idx_sig_flag_12_r = {3'd5, 5'd0 };//33 //'d6;
												ctx_idx_sig_flag_11_r = {3'd3, 5'd30};//30 //'d3;
												ctx_idx_sig_flag_10_r = {3'd1, 5'd16};//31 //'d4;
												ctx_idx_sig_flag_9_r  = {3'd5, 5'd1 };//34 //'d7;
												ctx_idx_sig_flag_8_r  = {3'd5, 5'd0 };//33 //'d6;
												ctx_idx_sig_flag_7_r  = {3'd1, 5'd16};//31 //'d4;
												ctx_idx_sig_flag_6_r  = {3'd4, 5'd0 };//32 //'d5;
												ctx_idx_sig_flag_5_r  = {3'd5, 5'd1 };//34 //'d7;
												ctx_idx_sig_flag_4_r  = {3'd2, 5'd9 };//35 //'d8;
												ctx_idx_sig_flag_3_r  = {3'd4, 5'd0 };//32 //'d5;
												ctx_idx_sig_flag_2_r  = {3'd2, 5'd9 };//35 //'d8;
												ctx_idx_sig_flag_1_r  = {3'd2, 5'd9 };//35 //'d8;
												ctx_idx_sig_flag_0_r  = {3'd2, 5'd9 };//35 //'d8;
							end
							
							(`SCAN_HOR):	begin 
												ctx_idx_sig_flag_15_r = {3'd3, 5'd16};//27 //'d0; 	
												ctx_idx_sig_flag_14_r = {3'd2, 5'd8 };//28 //'d1;	
												ctx_idx_sig_flag_13_r = {3'd1, 5'd16};//31 //'d4;
												ctx_idx_sig_flag_12_r = {3'd4, 5'd0 };//32 //'d5;
												ctx_idx_sig_flag_11_r = {3'd0, 5'd14};//29 //'d2;
												ctx_idx_sig_flag_10_r = {3'd3, 5'd30};//30 //'d3;
												ctx_idx_sig_flag_9_r  = {3'd1, 5'd16};//31 //'d4;
												ctx_idx_sig_flag_8_r  = {3'd4, 5'd0 };//32 //'d5;
												ctx_idx_sig_flag_7_r  = {3'd5, 5'd0 };//33 //'d6;
												ctx_idx_sig_flag_6_r  = {3'd5, 5'd0 };//33 //'d6;
												ctx_idx_sig_flag_5_r  = {3'd2, 5'd9 };//35 //'d8;
												ctx_idx_sig_flag_4_r  = {3'd2, 5'd9 };//35 //'d8;
												ctx_idx_sig_flag_3_r  = {3'd5, 5'd1 };//34 //'d7;
												ctx_idx_sig_flag_2_r  = {3'd5, 5'd1 };//34 //'d7;
												ctx_idx_sig_flag_1_r  = {3'd2, 5'd9 };//35 //'d8;
												ctx_idx_sig_flag_0_r  = {3'd2, 5'd9 };//35 //'d8;
							end                                        
							                                           
							(`SCAN_VER):	begin                      
												ctx_idx_sig_flag_15_r = {3'd3, 5'd16};//27 //'d0; 	
												ctx_idx_sig_flag_14_r = {3'd0, 5'd14};//29 //'d2;	
												ctx_idx_sig_flag_13_r = {3'd5, 5'd0 };//33 //'d6;
												ctx_idx_sig_flag_12_r = {3'd5, 5'd1 };//34 //'d7;
												ctx_idx_sig_flag_11_r = {3'd2, 5'd8 };//28 //'d1;
												ctx_idx_sig_flag_10_r = {3'd3, 5'd30};//30 //'d3;
												ctx_idx_sig_flag_9_r  = {3'd5, 5'd0 };//33 //'d6;
												ctx_idx_sig_flag_8_r  = {3'd5, 5'd1 };//34 //'d7;
												ctx_idx_sig_flag_7_r  = {3'd1, 5'd16};//31 //'d4;
												ctx_idx_sig_flag_6_r  = {3'd1, 5'd16};//31 //'d4;
												ctx_idx_sig_flag_5_r  = {3'd2, 5'd9 };//35 //'d8;
												ctx_idx_sig_flag_4_r  = {3'd2, 5'd9 };//35 //'d8;
												ctx_idx_sig_flag_3_r  = {3'd4, 5'd0 };//32 //'d5;
												ctx_idx_sig_flag_2_r  = {3'd4, 5'd0 };//32 //'d5;
												ctx_idx_sig_flag_1_r  = {3'd2, 5'd9 };//35 //'d8;
												ctx_idx_sig_flag_0_r  = {3'd2, 5'd9 };//35 //'d8;
							end                                 
							                                         
							default:		begin                    
												ctx_idx_sig_flag_15_r = 'd0; 	
												ctx_idx_sig_flag_14_r = 'd0;	
												ctx_idx_sig_flag_13_r = 'd0;
												ctx_idx_sig_flag_12_r = 'd0;
												ctx_idx_sig_flag_11_r = 'd0;
												ctx_idx_sig_flag_10_r = 'd0;
												ctx_idx_sig_flag_9_r  = 'd0;
												ctx_idx_sig_flag_8_r  = 'd0;
												ctx_idx_sig_flag_7_r  = 'd0;
												ctx_idx_sig_flag_6_r  = 'd0;
												ctx_idx_sig_flag_5_r  = 'd0;
												ctx_idx_sig_flag_4_r  = 'd0;
												ctx_idx_sig_flag_3_r  = 'd0;
												ctx_idx_sig_flag_2_r  = 'd0;
												ctx_idx_sig_flag_1_r  = 'd0;
												ctx_idx_sig_flag_0_r  = 'd0;
							end
						endcase
			end
			
			default:begin
						ctx_idx_sig_flag_15_r = 'd0; 	
						ctx_idx_sig_flag_14_r = 'd0;	
						ctx_idx_sig_flag_13_r = 'd0;
						ctx_idx_sig_flag_12_r = 'd0;
						ctx_idx_sig_flag_11_r = 'd0;
						ctx_idx_sig_flag_10_r = 'd0;
						ctx_idx_sig_flag_9_r  = 'd0;
						ctx_idx_sig_flag_8_r  = 'd0;
						ctx_idx_sig_flag_7_r  = 'd0;
						ctx_idx_sig_flag_6_r  = 'd0;
						ctx_idx_sig_flag_5_r  = 'd0;
						ctx_idx_sig_flag_4_r  = 'd0;
						ctx_idx_sig_flag_3_r  = 'd0;
						ctx_idx_sig_flag_2_r  = 'd0;
						ctx_idx_sig_flag_1_r  = 'd0;
						ctx_idx_sig_flag_0_r  = 'd0;
			end			
		endcase
	end	
end







// **********************************************************
// ge12
wire	[3:0]		num_c1_flag_w			;
assign	num_c1_flag_w = enc_coeff_tot_r>=8 ? 8 : enc_coeff_tot_r;
assign	valid_num_bin_ge12_r = num_c1_flag_w + coeff_ge1_r;


assign	ctx_pair_ge12_0_w = {2'b00, bin_string_ge12_r[8], ctx_idx_ge12_0_r};
assign	ctx_pair_ge12_1_w = {2'b00, bin_string_ge12_r[7], ctx_idx_ge12_1_r};
assign	ctx_pair_ge12_2_w = {2'b00, bin_string_ge12_r[6], ctx_idx_ge12_2_r};
assign	ctx_pair_ge12_3_w = {2'b00, bin_string_ge12_r[5], ctx_idx_ge12_3_r};
assign	ctx_pair_ge12_4_w = {2'b00, bin_string_ge12_r[4], ctx_idx_ge12_4_r};
assign	ctx_pair_ge12_5_w = {2'b00, bin_string_ge12_r[3], ctx_idx_ge12_5_r};
assign	ctx_pair_ge12_6_w = {2'b00, bin_string_ge12_r[2], ctx_idx_ge12_6_r};
assign	ctx_pair_ge12_7_w = {2'b00, bin_string_ge12_r[1], ctx_idx_ge12_7_r};
assign	ctx_pair_ge12_8_w = {2'b00, bin_string_ge12_r[0], ctx_idx_ge12_8_r};

//coeff_ge1_r
always @* begin
	case(num_c1_flag_w)
		'd1:	coeff_ge1_r = enc_non_zero_abs_0_ge1_r;
		'd2:	coeff_ge1_r = enc_non_zero_abs_0_ge1_r | enc_non_zero_abs_1_ge1_r;
		'd3:	coeff_ge1_r = enc_non_zero_abs_0_ge1_r | enc_non_zero_abs_1_ge1_r | enc_non_zero_abs_2_ge1_r;
		'd4:	coeff_ge1_r = enc_non_zero_abs_0_ge1_r | enc_non_zero_abs_1_ge1_r | enc_non_zero_abs_2_ge1_r | enc_non_zero_abs_3_ge1_r;
		'd5:	coeff_ge1_r = enc_non_zero_abs_0_ge1_r | enc_non_zero_abs_1_ge1_r | enc_non_zero_abs_2_ge1_r | enc_non_zero_abs_3_ge1_r
							| enc_non_zero_abs_4_ge1_r;
		'd6:	coeff_ge1_r = enc_non_zero_abs_0_ge1_r | enc_non_zero_abs_1_ge1_r | enc_non_zero_abs_2_ge1_r | enc_non_zero_abs_3_ge1_r
							| enc_non_zero_abs_4_ge1_r | enc_non_zero_abs_5_ge1_r;
		'd7:	coeff_ge1_r = enc_non_zero_abs_0_ge1_r | enc_non_zero_abs_1_ge1_r | enc_non_zero_abs_2_ge1_r | enc_non_zero_abs_3_ge1_r
							| enc_non_zero_abs_4_ge1_r | enc_non_zero_abs_5_ge1_r | enc_non_zero_abs_6_ge1_r;
		'd8:	coeff_ge1_r = enc_non_zero_abs_0_ge1_r | enc_non_zero_abs_1_ge1_r | enc_non_zero_abs_2_ge1_r | enc_non_zero_abs_3_ge1_r
							| enc_non_zero_abs_4_ge1_r | enc_non_zero_abs_5_ge1_r | enc_non_zero_abs_6_ge1_r | enc_non_zero_abs_7_ge1_r;
		default:coeff_ge1_r = 'd0;		
	endcase
end

//coeff_ge2_r
always @* begin
	if(enc_non_zero_abs_0_ge1_r)
		coeff_ge2_r = enc_non_zero_abs_0_ge2_r;
	else if(enc_non_zero_abs_1_ge1_r)
		coeff_ge2_r = enc_non_zero_abs_1_ge2_r;
	else if(enc_non_zero_abs_2_ge1_r)
		coeff_ge2_r = enc_non_zero_abs_2_ge2_r;
	else if(enc_non_zero_abs_3_ge1_r)
		coeff_ge2_r = enc_non_zero_abs_3_ge2_r;
	else if(enc_non_zero_abs_4_ge1_r)
		coeff_ge2_r = enc_non_zero_abs_4_ge2_r;
	else if(enc_non_zero_abs_5_ge1_r)
		coeff_ge2_r = enc_non_zero_abs_5_ge2_r;
	else if(enc_non_zero_abs_6_ge1_r)
		coeff_ge2_r = enc_non_zero_abs_6_ge2_r;
	else if(enc_non_zero_abs_7_ge1_r)
		coeff_ge2_r = enc_non_zero_abs_7_ge2_r;
	else coeff_ge2_r = 'd0;	
end





//enc_ge12_cyc_cnt_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		enc_ge12_cyc_cnt_r <= 'd0;
	else if(tu_curr_state_r!=TU_GE12)
		enc_ge12_cyc_cnt_r <= 'd0;
	else if(enc_ge12_cyc_cnt_r==enc_ge12_cyc_tot_r)
		enc_ge12_cyc_cnt_r <= 'd0;
	else
		enc_ge12_cyc_cnt_r <= enc_ge12_cyc_cnt_r + 'd1;
end

//enc_ge12_cyc_tot_r
always @* begin
	case(valid_num_bin_ge12_r)
		'd0, 'd1, 'd2, 'd3, 'd4:	enc_ge12_cyc_tot_r = 'd0;
		'd5, 'd6, 'd7, 'd8:			enc_ge12_cyc_tot_r = 'd1;
		'd9:						enc_ge12_cyc_tot_r = 'd2;
		default:					enc_ge12_cyc_tot_r = 'd0;
	endcase
end


always @* begin
	case(num_c1_flag_w)
		'd1:	bin_string_ge12_r = {enc_non_zero_abs_0_ge1_r, coeff_ge2_r, 7'd0};
		'd2:	bin_string_ge12_r = {enc_non_zero_abs_0_ge1_r, enc_non_zero_abs_1_ge1_r, coeff_ge2_r, 6'd0};
		'd3:	bin_string_ge12_r = {enc_non_zero_abs_0_ge1_r, enc_non_zero_abs_1_ge1_r, enc_non_zero_abs_2_ge1_r, coeff_ge2_r, 5'd0};
		'd4:	bin_string_ge12_r = {enc_non_zero_abs_0_ge1_r, enc_non_zero_abs_1_ge1_r, enc_non_zero_abs_2_ge1_r, 
									 enc_non_zero_abs_3_ge1_r, coeff_ge2_r, 4'd0};
		'd5:	bin_string_ge12_r = {enc_non_zero_abs_0_ge1_r, enc_non_zero_abs_1_ge1_r, enc_non_zero_abs_2_ge1_r, 
									 enc_non_zero_abs_3_ge1_r, enc_non_zero_abs_4_ge1_r, coeff_ge2_r, 3'd0};
		'd6:	bin_string_ge12_r = {enc_non_zero_abs_0_ge1_r, enc_non_zero_abs_1_ge1_r, enc_non_zero_abs_2_ge1_r, 
									 enc_non_zero_abs_3_ge1_r, enc_non_zero_abs_4_ge1_r, enc_non_zero_abs_5_ge1_r, coeff_ge2_r, 2'd0};
		'd7:	bin_string_ge12_r = {enc_non_zero_abs_0_ge1_r, enc_non_zero_abs_1_ge1_r, enc_non_zero_abs_2_ge1_r, 
									 enc_non_zero_abs_3_ge1_r, enc_non_zero_abs_4_ge1_r, enc_non_zero_abs_5_ge1_r, 
									 enc_non_zero_abs_6_ge1_r, coeff_ge2_r, 1'd0};
		'd8:	bin_string_ge12_r = {enc_non_zero_abs_0_ge1_r, enc_non_zero_abs_1_ge1_r, enc_non_zero_abs_2_ge1_r, 
									 enc_non_zero_abs_3_ge1_r, enc_non_zero_abs_4_ge1_r, enc_non_zero_abs_5_ge1_r, 
									 enc_non_zero_abs_6_ge1_r, enc_non_zero_abs_7_ge1_r, coeff_ge2_r};
		default:bin_string_ge12_r = 'd0;
	endcase
end

//c1_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		c1_r <= 'd0;
	else if(tu_curr_state_r==TU_LAST_SIG)
		c1_r <= 'd1;
	else if(blk_e_done_r) begin
		if(enc_bin_cbf_r=='d0)
			c1_r <= c1_r;
		else if(coeff_ge1_r)
			c1_r <= 'd0;
		else
			c1_r <= 'd1;
	end
	else 
		c1_r <= c1_r;
end

//i_ctx_set_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF && enc_blk_cnt_r!=blk_tot_r) begin
		if(c1_r=='d0)
			i_ctx_set_r = 'd3;
		else 
			i_ctx_set_r = 'd2;
	end 
	else begin
		if(c1_r=='d0)
			i_ctx_set_r = 'd1;
		else 
			i_ctx_set_r = 'd0;
	end	
end


reg		[7:0]		ctx_idx_ge12_00_w					;
always @* begin
	case(i_ctx_set_r)
		'd0:	ctx_idx_ge12_00_w = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd0, 5'd23} : {3'd0, 5'd27};//'d0  : 'd16;
		'd1:	ctx_idx_ge12_00_w = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd0, 5'd24} : {3'd0, 5'd28};//'d4  : 'd20;
		'd2:	ctx_idx_ge12_00_w = {3'd0, 5'd25};//'d8;
		'd3:	ctx_idx_ge12_00_w = {3'd0, 5'd26};//'d12;
		default:ctx_idx_ge12_00_w = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd0, 5'd23} : {3'd0, 5'd27};//'d0  : 'd16;
	endcase
end


//ctx_idx_ge12_0_r
always @* begin
	if(res_curr_state_r==RESIDUAL_LUMA_COEFF) begin
		case(i_ctx_set_r)
			'd0:	ctx_idx_ge12_0_r = {3'd1, 5'd21};//'d1;		
			'd1:	ctx_idx_ge12_0_r = {3'd1, 5'd22};//'d5;
			'd2:	ctx_idx_ge12_0_r = {3'd1, 5'd23};//'d9;
			'd3:	ctx_idx_ge12_0_r = {3'd1, 5'd24};//'d13;
			default:ctx_idx_ge12_0_r = {3'd1, 5'd21};//'d1;
		endcase
	end
	else begin
		case(i_ctx_set_r)
			'd0:	ctx_idx_ge12_0_r = {3'd1, 5'd25};//'d17;
			'd1:	ctx_idx_ge12_0_r = {3'd1, 5'd26};//'d21;
			default:ctx_idx_ge12_0_r = {3'd1, 5'd25};//'d17;
		endcase
	end
end

//ctx_idx_ge12_1_r
always @* begin
	if(num_c1_flag_w=='d1) begin 	//ge2
		if(coeff_ge1_r) begin
			case(i_ctx_set_r)
				'd0:	ctx_idx_ge12_1_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd12} : {3'd4, 5'd16};//'d0 : 'd4		
				'd1:	ctx_idx_ge12_1_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd13} : {3'd4, 5'd17};//'d1 : 'd5		
				'd2:	ctx_idx_ge12_1_r = {3'd4, 5'd14};//'d2;		
				'd3:	ctx_idx_ge12_1_r = {3'd4, 5'd15};//'d3;		
				default:ctx_idx_ge12_1_r = {3'd4, 5'd12};//'d0;			
			endcase
		end  
		else begin
			ctx_idx_ge12_1_r = 'd0;// {3'd4, 5'd12};//'d0;
		end
	end
	else begin
		if(~enc_non_zero_abs_0_ge1_r) begin
			case(i_ctx_set_r)
				'd0:	ctx_idx_ge12_1_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd2, 5'd21} : {3'd2, 5'd25};//'d2  : 'd18;
				'd1:	ctx_idx_ge12_1_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd2, 5'd22} : {3'd2, 5'd26};//'d6  : 'd22;
				'd2:	ctx_idx_ge12_1_r = {3'd2, 5'd23};//'d10;
				'd3:	ctx_idx_ge12_1_r = {3'd2, 5'd24};//'d14;
				default:ctx_idx_ge12_1_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd2, 5'd21} : {3'd2, 5'd25};//'d2  : 'd18;
			endcase
		end
		else begin
			ctx_idx_ge12_1_r = ctx_idx_ge12_00_w;
		end
	end
end

//ctx_idx_ge12_2_r
always @* begin
	if(num_c1_flag_w=='d2) begin 	//ge2
		if(coeff_ge1_r) begin
			case(i_ctx_set_r)
				'd0:	ctx_idx_ge12_2_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd12} : {3'd4, 5'd16};//'d0 : 4;		
				'd1:	ctx_idx_ge12_2_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd13} : {3'd4, 5'd17};//'d1 : 5;		
				'd2:	ctx_idx_ge12_2_r = {3'd4, 5'd14};//'d2;		
				'd3:	ctx_idx_ge12_2_r = {3'd4, 5'd15};//'d3;		
				default:ctx_idx_ge12_2_r = {3'd4, 5'd12};//'d0;			
			endcase
		end  
		else begin
			ctx_idx_ge12_2_r = 'd0;// {3'd4, 5'd12};//'d0;
		end
	end
	else begin
		if(~(enc_non_zero_abs_0_ge1_r | enc_non_zero_abs_1_ge1_r)) begin
			case(i_ctx_set_r)
				'd0:	ctx_idx_ge12_2_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd3, 5'd17} : {3'd3, 5'd21};//'d3  : 'd19;
				'd1:	ctx_idx_ge12_2_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd3, 5'd18} : {3'd3, 5'd22};//'d7  : 'd23;
				'd2:	ctx_idx_ge12_2_r = {3'd3, 5'd19};//'d11;
				'd3:	ctx_idx_ge12_2_r = {3'd3, 5'd20};//'d15;
				default:ctx_idx_ge12_2_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd3, 5'd17} : {3'd3, 5'd21};//'d3  : 'd19;
			endcase
		end
		else begin  
			ctx_idx_ge12_2_r = ctx_idx_ge12_00_w;
		end
	end
end

//ctx_idx_ge12_3_r
always @* begin
	if(num_c1_flag_w=='d3) begin 	//ge2
		if(coeff_ge1_r) begin
			case(i_ctx_set_r)
				'd0:	ctx_idx_ge12_3_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd12} : {3'd4, 5'd16};//'d0 : 4;	 	
				'd1:	ctx_idx_ge12_3_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd13} : {3'd4, 5'd17};//'d1 : 5;	 	
				'd2:	ctx_idx_ge12_3_r = {3'd4, 5'd14};//'d2;		
				'd3:	ctx_idx_ge12_3_r = {3'd4, 5'd15};//'d3;		
				default:ctx_idx_ge12_3_r = {3'd4, 5'd12};//'d0;			
			endcase
		end  
		else begin
			ctx_idx_ge12_3_r = 'd0;// {3'd4, 5'd12};//'d0;
		end
	end
	else begin
		ctx_idx_ge12_3_r = bin_string_ge12_r[8:6]!='d0 ?  ctx_idx_ge12_00_w : ctx_idx_ge12_2_r;
	end
end

//ctx_idx_ge12_4_r
always @* begin
	if(num_c1_flag_w=='d4) begin 	//ge2
		if(coeff_ge1_r) begin
			case(i_ctx_set_r)
				'd0:	ctx_idx_ge12_4_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd12} : {3'd4, 5'd16};//'d0 : 4;	 	 	
				'd1:	ctx_idx_ge12_4_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd13} : {3'd4, 5'd17};//'d1 : 5;	 	 	
				'd2:	ctx_idx_ge12_4_r = {3'd4, 5'd14};//'d2;		
				'd3:	ctx_idx_ge12_4_r = {3'd4, 5'd15};//'d3;		
				default:ctx_idx_ge12_4_r = {3'd4, 5'd12};//'d0;			
			endcase
		end  
		else begin
			ctx_idx_ge12_4_r = 'd0;// {3'd4, 5'd12};//'d0;
		end
	end
	else begin
		ctx_idx_ge12_4_r = bin_string_ge12_r[8:5]!='d0 ?  ctx_idx_ge12_00_w : ctx_idx_ge12_3_r;
	end
end

//ctx_idx_ge12_5_r
always @* begin
	if(num_c1_flag_w=='d5) begin 	//ge2
		if(coeff_ge1_r) begin
			case(i_ctx_set_r)
				'd0:	ctx_idx_ge12_5_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd12} : {3'd4, 5'd16};//'d0 : 4;	  
				'd1:	ctx_idx_ge12_5_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd13} : {3'd4, 5'd17};//'d1 : 5;	  
				'd2:	ctx_idx_ge12_5_r = {3'd4, 5'd14};//'d2;		
				'd3:	ctx_idx_ge12_5_r = {3'd4, 5'd15};//'d3;		
				default:ctx_idx_ge12_5_r = {3'd4, 5'd12};//'d0;			
			endcase
		end  
		else begin
			ctx_idx_ge12_5_r = 'd0;// {3'd4, 5'd12};//'d0;         
		end
	end
	else begin
		ctx_idx_ge12_5_r = bin_string_ge12_r[8:4]!='d0 ?  ctx_idx_ge12_00_w : ctx_idx_ge12_4_r;
	end
end

//ctx_idx_ge12_6_r
always @* begin
	if(num_c1_flag_w=='d6) begin 	//ge2
		if(coeff_ge1_r) begin
			case(i_ctx_set_r)
				'd0:	ctx_idx_ge12_6_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd12} : {3'd4, 5'd16};//'d0 : 4;	 	
				'd1:	ctx_idx_ge12_6_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd13} : {3'd4, 5'd17};//'d1 : 5;	 	
				'd2:	ctx_idx_ge12_6_r = {3'd4, 5'd14};//'d2;		
				'd3:	ctx_idx_ge12_6_r = {3'd4, 5'd15};//'d3;		
				default:ctx_idx_ge12_6_r = {3'd4, 5'd12};//'d0;			
			endcase
		end  
		else begin
			ctx_idx_ge12_6_r = 'd0;// {3'd4, 5'd12};//'d0;         
		end
	end
	else begin
		ctx_idx_ge12_6_r = bin_string_ge12_r[8:3]!='d0 ?  ctx_idx_ge12_00_w : ctx_idx_ge12_5_r;
	end
end

//ctx_idx_ge12_7_r
always @* begin
	if(num_c1_flag_w=='d7) begin 	//ge2
		if(coeff_ge1_r) begin
			case(i_ctx_set_r)
				'd0:	ctx_idx_ge12_7_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd12} : {3'd4, 5'd16};//'d0 : 4;	
				'd1:	ctx_idx_ge12_7_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd13} : {3'd4, 5'd17};//'d1 : 5;	
				'd2:	ctx_idx_ge12_7_r = {3'd4, 5'd14};//'d2;		
				'd3:	ctx_idx_ge12_7_r = {3'd4, 5'd15};//'d3;		
				default:ctx_idx_ge12_7_r = {3'd4, 5'd12};//'d0;			
			endcase
		end  
		else begin
			ctx_idx_ge12_7_r = 'd0;// {3'd4, 5'd12};//'d0;
		end
	end
	else begin
		ctx_idx_ge12_7_r = bin_string_ge12_r[8:2]!='d0 ?  ctx_idx_ge12_00_w : ctx_idx_ge12_6_r;
	end
end

//ctx_idx_ge12_8_r
always @* begin
	if(num_c1_flag_w=='d8) begin 	//ge2
		if(coeff_ge1_r) begin
			case(i_ctx_set_r)
				'd0:	ctx_idx_ge12_8_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd12} : {3'd4, 5'd16};//'d0 : 4;	 	
				'd1:	ctx_idx_ge12_8_r = res_curr_state_r==RESIDUAL_LUMA_COEFF ? {3'd4, 5'd13} : {3'd4, 5'd17};//'d1 : 5;	 	
				'd2:	ctx_idx_ge12_8_r = {3'd4, 5'd14};//'d2;			
				'd3:	ctx_idx_ge12_8_r = {3'd4, 5'd15};//'d3;			
				default:ctx_idx_ge12_8_r = {3'd4, 5'd12};//'d0;				
			endcase
		end  
		else begin
			ctx_idx_ge12_8_r = 'd0;// {3'd4, 5'd12};//'d0;
		end
	end
	else begin
		ctx_idx_ge12_8_r = {3'd4, 5'd12};//'d0;
	end
end












// *********************************************************
// coefficient signs

assign	ctx_pair_sign_0_w  = {2'b01, bin_string_sign_flag_r[15], 8'd0};
assign	ctx_pair_sign_1_w  = {2'b01, bin_string_sign_flag_r[14], 8'd0};
assign	ctx_pair_sign_2_w  = {2'b01, bin_string_sign_flag_r[13], 8'd0};
assign	ctx_pair_sign_3_w  = {2'b01, bin_string_sign_flag_r[12], 8'd0};
assign	ctx_pair_sign_4_w  = {2'b01, bin_string_sign_flag_r[11], 8'd0};
assign	ctx_pair_sign_5_w  = {2'b01, bin_string_sign_flag_r[10], 8'd0};
assign	ctx_pair_sign_6_w  = {2'b01, bin_string_sign_flag_r[ 9], 8'd0};
assign	ctx_pair_sign_7_w  = {2'b01, bin_string_sign_flag_r[ 8], 8'd0};
assign	ctx_pair_sign_8_w  = {2'b01, bin_string_sign_flag_r[ 7], 8'd0};
assign	ctx_pair_sign_9_w  = {2'b01, bin_string_sign_flag_r[ 6], 8'd0};
assign	ctx_pair_sign_10_w = {2'b01, bin_string_sign_flag_r[ 5], 8'd0};
assign	ctx_pair_sign_11_w = {2'b01, bin_string_sign_flag_r[ 4], 8'd0};
assign	ctx_pair_sign_12_w = {2'b01, bin_string_sign_flag_r[ 3], 8'd0};
assign	ctx_pair_sign_13_w = {2'b01, bin_string_sign_flag_r[ 2], 8'd0};
assign	ctx_pair_sign_14_w = {2'b01, bin_string_sign_flag_r[ 1], 8'd0};
assign	ctx_pair_sign_15_w = {2'b01, bin_string_sign_flag_r[ 0], 8'd0};

assign	valid_num_bin_sign_r = enc_coeff_tot_r;



assign	bin_string_sign_flag_r = {enc_non_zero_0_w[15],  enc_non_zero_1_w[15],  enc_non_zero_2_w[15],  enc_non_zero_3_w[15],
							  	  enc_non_zero_4_w[15],  enc_non_zero_5_w[15],  enc_non_zero_6_w[15],  enc_non_zero_7_w[15],
							  	  enc_non_zero_8_w[15],  enc_non_zero_9_w[15],  enc_non_zero_10_w[15], enc_non_zero_11_w[15],
							  	  enc_non_zero_12_w[15], enc_non_zero_13_w[15], enc_non_zero_14_w[15], enc_non_zero_15_w[15]};


//enc_sign_cyc_cnt_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		enc_sign_cyc_cnt_r <= 'd0;
	else if(tu_curr_state_r!=TU_RES_SIGN)
		enc_sign_cyc_cnt_r <= 'd0;
	else if(enc_sign_done_w)
		enc_sign_cyc_cnt_r <= 'd0;
	else 
		enc_sign_cyc_cnt_r <= enc_sign_cyc_cnt_r + 'd1;
end



//enc_sign_cyc_tot_r
always @* begin
	case(enc_coeff_tot_r)
		'd0, 'd1, 'd2, 'd3, 'd4:	enc_sign_cyc_tot_r = 'd0;
		'd5, 'd6, 'd7, 'd8:			enc_sign_cyc_tot_r = 'd1;
		'd9, 'd10, 'd11, 'd12:		enc_sign_cyc_tot_r = 'd2;
		'd13, 'd14, 'd15, 'd16:		enc_sign_cyc_tot_r = 'd3;
		default:					enc_sign_cyc_tot_r = 'd0;
	endcase
end


assign	enc_sign_done_w = (enc_sign_cyc_cnt_r==enc_sign_cyc_tot_r) ? 'd1 : 'd0;





// **********************************************************
// coefficient remains

assign	ctx_pair_remain_0_w  = {2'b01, bin_string_remain_r[15], 8'd0};
assign	ctx_pair_remain_1_w  = {2'b01, bin_string_remain_r[14], 8'd0};
assign	ctx_pair_remain_2_w  = {2'b01, bin_string_remain_r[13], 8'd0};
assign	ctx_pair_remain_3_w  = {2'b01, bin_string_remain_r[12], 8'd0};
assign	ctx_pair_remain_4_w  = {2'b01, bin_string_remain_r[11], 8'd0};
assign	ctx_pair_remain_5_w  = {2'b01, bin_string_remain_r[10], 8'd0};
assign	ctx_pair_remain_6_w  = {2'b01, bin_string_remain_r[ 9], 8'd0};
assign	ctx_pair_remain_7_w  = {2'b01, bin_string_remain_r[ 8], 8'd0};
assign	ctx_pair_remain_8_w  = {2'b01, bin_string_remain_r[ 7], 8'd0};
assign	ctx_pair_remain_9_w  = {2'b01, bin_string_remain_r[ 6], 8'd0};
assign	ctx_pair_remain_10_w = {2'b01, bin_string_remain_r[ 5], 8'd0};
assign	ctx_pair_remain_11_w = {2'b01, bin_string_remain_r[ 4], 8'd0};
assign	ctx_pair_remain_12_w = {2'b01, bin_string_remain_r[ 3], 8'd0};
assign	ctx_pair_remain_13_w = {2'b01, bin_string_remain_r[ 2], 8'd0};
assign	ctx_pair_remain_14_w = {2'b01, bin_string_remain_r[ 1], 8'd0};
assign	ctx_pair_remain_15_w = {2'b01, bin_string_remain_r[ 0], 8'd0};

//first_non_one_coeff_idx_r
always @* begin
	if(enc_non_zero_abs_0_r!='d1)
		first_non_one_coeff_idx_r = 'd0;
	else if(enc_non_zero_abs_1_r!='d1)
		first_non_one_coeff_idx_r = 'd1;
	else if(enc_non_zero_abs_2_r!='d1)
		first_non_one_coeff_idx_r = 'd2;
	else if(enc_non_zero_abs_3_r!='d1)
		first_non_one_coeff_idx_r = 'd3;
	else if(enc_non_zero_abs_4_r!='d1)
		first_non_one_coeff_idx_r = 'd4;
	else if(enc_non_zero_abs_5_r!='d1)
		first_non_one_coeff_idx_r = 'd5;
	else if(enc_non_zero_abs_6_r!='d1)
		first_non_one_coeff_idx_r = 'd6;
	else if(enc_non_zero_abs_7_r!='d1)
		first_non_one_coeff_idx_r = 'd7;
	else 
		first_non_one_coeff_idx_r = 'd15;
end

assign	enc_remain_done_w = ((enc_remain_cnt_r==(enc_remain_tot_r-1))
						  && (enc_remain_cyc_cnt_r==(enc_remain_cyc_tot_r-1))) ? 'd1 : 'd0;

//enc_remain_tot_r
always @* begin
	if(tu_curr_state_r==TU_RES_REMAIN)
		enc_remain_tot_r = enc_coeff_tot_r;
	else
		enc_remain_tot_r = 'd0;
end

//enc_remain_cnt_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		enc_remain_cnt_r <= 'd0;
	else if(tu_curr_state_r!=TU_RES_REMAIN)
		enc_remain_cnt_r <= 'd0;
	else if(enc_remain_cyc_cnt_r==(enc_remain_cyc_tot_r-1)) begin
		if(enc_remain_cnt_r==(enc_remain_tot_r-1))
			enc_remain_cnt_r <= 'd0;
		else
			enc_remain_cnt_r <= enc_remain_cnt_r + 'd1;
	end
	else 
		enc_remain_cnt_r <= enc_remain_cnt_r;
end

//enc_remain_cyc_tot_r
always @* begin
	case(valid_num_remain_all_r)
		'd0, 'd1, 'd2, 'd3, 'd4	:	enc_remain_cyc_tot_r = 'd1;
		'd5, 'd6, 'd7, 'd8		:	enc_remain_cyc_tot_r = 'd2;
		'd9, 'd10, 'd11, 'd12	:	enc_remain_cyc_tot_r = 'd3;
		'd13, 'd14, 'd15, 'd16	:	enc_remain_cyc_tot_r = 'd4;
		'd17, 'd18, 'd19, 'd20	:	enc_remain_cyc_tot_r = 'd5;
		'd21, 'd22, 'd23, 'd24	:	enc_remain_cyc_tot_r = 'd6;
		'd25, 'd26, 'd27, 'd28	:	enc_remain_cyc_tot_r = 'd7;
		'd29, 'd30, 'd31		:	enc_remain_cyc_tot_r = 'd8;
		default:	enc_remain_cyc_tot_r = 'd1;
	endcase	
end

//enc_remain_cyc_cnt_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		enc_remain_cyc_cnt_r <= 'd0;
	else if(tu_curr_state_r!=TU_RES_REMAIN)
		enc_remain_cyc_cnt_r <= 'd0;
	else if(enc_remain_cyc_cnt_r==(enc_remain_cyc_tot_r-1))
		enc_remain_cyc_cnt_r <= 'd0;
	else 
		enc_remain_cyc_cnt_r <= enc_remain_cyc_cnt_r + 'd1;
end


//base_level_r
always @* begin
	if(tu_curr_state_r==TU_RES_REMAIN) begin
		case(first_non_one_coeff_idx_r)        
			'd0:	begin
						if(enc_remain_cnt_r>'d0)
							base_level_r = 'd2;
						else 
							base_level_r = 'd3;
			end
			
			'd1:	begin
						if(enc_remain_cnt_r>'d1)
							base_level_r = 'd2;
						else 
							base_level_r = 'd3;
			end
			
			'd2:	begin
						if(enc_remain_cnt_r>'d2)
							base_level_r = 'd2;
						else 
							base_level_r = 'd3;
			end
			
			'd3:	begin
						if(enc_remain_cnt_r>'d3)
							base_level_r = 'd2;
						else 
							base_level_r = 'd3;
			end
			
			'd4:	begin
						if(enc_remain_cnt_r>'d4)
							base_level_r = 'd2;
						else 
							base_level_r = 'd3;
			end
			
			'd5:	begin
						if(enc_remain_cnt_r>'d5)
							base_level_r = 'd2;
						else 
							base_level_r = 'd3;
			end
			
			'd6:	begin
						if(enc_remain_cnt_r>'d6)
							base_level_r = 'd2;
						else 
							base_level_r = 'd3;
			end
			
			'd7:	begin
						if(enc_remain_cnt_r>'d7)
							base_level_r = 'd2;
						else 
							base_level_r = 'd3;
			end
			
			default:begin
						if(enc_remain_cnt_r[3])
							base_level_r = 'd1;
						else
							base_level_r = 'd3;
			end
		endcase		
	end
	else 
		base_level_r = 'd0;
end


//encoding_coeff_abs_r
always @* begin
	case(enc_remain_cnt_r)
		'd0:	encoding_coeff_abs_r = enc_non_zero_abs_0_r  ;
		'd1:	encoding_coeff_abs_r = enc_non_zero_abs_1_r  ;
		'd2:    encoding_coeff_abs_r = enc_non_zero_abs_2_r  ;
		'd3:    encoding_coeff_abs_r = enc_non_zero_abs_3_r  ;
		'd4:    encoding_coeff_abs_r = enc_non_zero_abs_4_r  ;
		'd5:    encoding_coeff_abs_r = enc_non_zero_abs_5_r  ;
		'd6:    encoding_coeff_abs_r = enc_non_zero_abs_6_r  ;
		'd7:    encoding_coeff_abs_r = enc_non_zero_abs_7_r  ;
		'd8:    encoding_coeff_abs_r = enc_non_zero_abs_8_r  ;
		'd9:    encoding_coeff_abs_r = enc_non_zero_abs_9_r  ;
		'd10:   encoding_coeff_abs_r = enc_non_zero_abs_10_r ;
		'd11:   encoding_coeff_abs_r = enc_non_zero_abs_11_r ;
		'd12:   encoding_coeff_abs_r = enc_non_zero_abs_12_r ;
		'd13:   encoding_coeff_abs_r = enc_non_zero_abs_13_r ;
		'd14:   encoding_coeff_abs_r = enc_non_zero_abs_14_r ;
		'd15:   encoding_coeff_abs_r = enc_non_zero_abs_15_r ;
		default:encoding_coeff_abs_r = 'd0;
	endcase	
end



//encoding_coeff_abs_remain_r
always @* begin
	if(enc_remain_cnt_r[3])
		encoding_coeff_abs_remain_r = encoding_coeff_abs_r - 'd1;
	else 
		encoding_coeff_abs_remain_r = encoding_coeff_abs_r - base_level_r;
end



//i_go_rice_param_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		i_go_rice_param_r <= 'd0;
	else if(blk_e_done_r)
		i_go_rice_param_r <= 'd0;
	else begin
		if(enc_remain_cyc_cnt_r==(enc_remain_cyc_tot_r-1)) begin
			case(i_go_rice_param_r)
				'd0:	if(encoding_coeff_abs_r>3)
							i_go_rice_param_r <= 'd1;
						else
							i_go_rice_param_r <= 'd0;
							
				'd1:	if(encoding_coeff_abs_r>6)
							i_go_rice_param_r <= 'd2;
						else
							i_go_rice_param_r <= 'd1;
							
				'd2:	if(encoding_coeff_abs_r>12)
							i_go_rice_param_r <= 'd3;
						else
							i_go_rice_param_r <= 'd2;
							
				'd3:	if(encoding_coeff_abs_r>24)
							i_go_rice_param_r <= 'd4;
						else
							i_go_rice_param_r <= 'd3;
							
				'd4:		i_go_rice_param_r <= i_go_rice_param_r;
				
				default:i_go_rice_param_r <= i_go_rice_param_r;
			endcase
		end
		else begin
			i_go_rice_param_r <= i_go_rice_param_r;
		end	
	end	
end



//valid_num_remain_all_r
always @* begin
	if(encoding_coeff_abs_remain_r[15])
		valid_num_remain_all_r = 'd0;
	else begin
		case(i_go_rice_param_r)
			'd0:	begin
						if(encoding_coeff_abs_remain_r<'d4)
							valid_num_remain_all_r = encoding_coeff_abs_remain_r + 'd1;
						else if(encoding_coeff_abs_remain_r>='d4 && encoding_coeff_abs_remain_r<='d5)
							valid_num_remain_all_r = 'd6;
						else if(encoding_coeff_abs_remain_r>='d6 && encoding_coeff_abs_remain_r<='d9)
							valid_num_remain_all_r = 'd8;
						else if(encoding_coeff_abs_remain_r>='d10 && encoding_coeff_abs_remain_r<='d17)
							valid_num_remain_all_r = 'd10;
						else if(encoding_coeff_abs_remain_r>='d18 && encoding_coeff_abs_remain_r<='d33)
							valid_num_remain_all_r = 'd12;
						else if(encoding_coeff_abs_remain_r>='d34 && encoding_coeff_abs_remain_r<='d65)
							valid_num_remain_all_r = 'd14;	
						else if(encoding_coeff_abs_remain_r>='d66 && encoding_coeff_abs_remain_r<='d129)
							valid_num_remain_all_r = 'd16;
						else if(encoding_coeff_abs_remain_r>='d130 && encoding_coeff_abs_remain_r<='d257)
							valid_num_remain_all_r = 'd18;		
						else if(encoding_coeff_abs_remain_r>='d258 && encoding_coeff_abs_remain_r<='d513)
							valid_num_remain_all_r = 'd20;
						else if(encoding_coeff_abs_remain_r>='d514 && encoding_coeff_abs_remain_r<='d1025)
							valid_num_remain_all_r = 'd22;
						else if(encoding_coeff_abs_remain_r>='d1026 && encoding_coeff_abs_remain_r<='d2049)
							valid_num_remain_all_r = 'd24;					
						else 
							valid_num_remain_all_r = 'd26;
			end
			
			'd1:	begin
						if(encoding_coeff_abs_remain_r>='d0 && encoding_coeff_abs_remain_r<='d1)
							valid_num_remain_all_r = 'd2;
						else if(encoding_coeff_abs_remain_r>='d2 && encoding_coeff_abs_remain_r<='d3)
							valid_num_remain_all_r = 'd3;
						else if(encoding_coeff_abs_remain_r>='d4 && encoding_coeff_abs_remain_r<='d5)
							valid_num_remain_all_r = 'd4;	
						else if(encoding_coeff_abs_remain_r>='d6 && encoding_coeff_abs_remain_r<='d7)
							valid_num_remain_all_r = 'd5;
						else if(encoding_coeff_abs_remain_r>='d8 && encoding_coeff_abs_remain_r<='d11)
							valid_num_remain_all_r = 'd7;
						else if(encoding_coeff_abs_remain_r>='d12 && encoding_coeff_abs_remain_r<='d19)
							valid_num_remain_all_r = 'd9;
						else if(encoding_coeff_abs_remain_r>='d20 && encoding_coeff_abs_remain_r<='d35)
							valid_num_remain_all_r = 'd11;
						else if(encoding_coeff_abs_remain_r>='d36 && encoding_coeff_abs_remain_r<='d67)
							valid_num_remain_all_r = 'd13;	
						else if(encoding_coeff_abs_remain_r>='d68 && encoding_coeff_abs_remain_r<='d131)
							valid_num_remain_all_r = 'd15;
						else if(encoding_coeff_abs_remain_r>='d132 && encoding_coeff_abs_remain_r<='d259)
							valid_num_remain_all_r = 'd17;		
						else if(encoding_coeff_abs_remain_r>='d260 && encoding_coeff_abs_remain_r<='d515)
							valid_num_remain_all_r = 'd19;
						else if(encoding_coeff_abs_remain_r>='d516 && encoding_coeff_abs_remain_r<='d1027)
							valid_num_remain_all_r = 'd21;
						else if(encoding_coeff_abs_remain_r>='d1028 && encoding_coeff_abs_remain_r<='d2051)
							valid_num_remain_all_r = 'd23;					
						else 
							valid_num_remain_all_r = 'd25;
			end
			
			'd2:	begin
						if(encoding_coeff_abs_remain_r>='d0 && encoding_coeff_abs_remain_r<='d3)
							valid_num_remain_all_r = 'd3;
						else if(encoding_coeff_abs_remain_r>='d4 && encoding_coeff_abs_remain_r<='d7)
							valid_num_remain_all_r = 'd4;
						else if(encoding_coeff_abs_remain_r>='d8 && encoding_coeff_abs_remain_r<='d11)
							valid_num_remain_all_r = 'd5;	
						else if(encoding_coeff_abs_remain_r>='d12 && encoding_coeff_abs_remain_r<='d15)
							valid_num_remain_all_r = 'd6;
						else if(encoding_coeff_abs_remain_r>='d16 && encoding_coeff_abs_remain_r<='d23)
							valid_num_remain_all_r = 'd8;
						else if(encoding_coeff_abs_remain_r>='d24 && encoding_coeff_abs_remain_r<='d39)
							valid_num_remain_all_r = 'd10;
						else if(encoding_coeff_abs_remain_r>='d40 && encoding_coeff_abs_remain_r<='d71)
							valid_num_remain_all_r = 'd12;
						else if(encoding_coeff_abs_remain_r>='d72 && encoding_coeff_abs_remain_r<='d135)
							valid_num_remain_all_r = 'd14;	
						else if(encoding_coeff_abs_remain_r>='d136 && encoding_coeff_abs_remain_r<='d263)
							valid_num_remain_all_r = 'd16;
						else if(encoding_coeff_abs_remain_r>='d264 && encoding_coeff_abs_remain_r<='d519)
							valid_num_remain_all_r = 'd18;		
						else if(encoding_coeff_abs_remain_r>='d520 && encoding_coeff_abs_remain_r<='d1031)
							valid_num_remain_all_r = 'd20;
						else if(encoding_coeff_abs_remain_r>='d1032 && encoding_coeff_abs_remain_r<='d2055)
							valid_num_remain_all_r = 'd22;
						else if(encoding_coeff_abs_remain_r>='d2056 && encoding_coeff_abs_remain_r<='d4103)
							valid_num_remain_all_r = 'd24;					
						else 
							valid_num_remain_all_r = 'd26;
			end
			
			'd3:	begin
						if(encoding_coeff_abs_remain_r>='d0 && encoding_coeff_abs_remain_r<='d7)
							valid_num_remain_all_r = 'd4;
						else if(encoding_coeff_abs_remain_r>='d8 && encoding_coeff_abs_remain_r<='d15)
							valid_num_remain_all_r = 'd5;
						else if(encoding_coeff_abs_remain_r>='d16 && encoding_coeff_abs_remain_r<='d23)
							valid_num_remain_all_r = 'd6;	
						else if(encoding_coeff_abs_remain_r>='d24 && encoding_coeff_abs_remain_r<='d31)
							valid_num_remain_all_r = 'd7;
						else if(encoding_coeff_abs_remain_r>='d32&& encoding_coeff_abs_remain_r<='d47)
							valid_num_remain_all_r = 'd9;
						else if(encoding_coeff_abs_remain_r>='d48 && encoding_coeff_abs_remain_r<='d79)
							valid_num_remain_all_r = 'd11;
						else if(encoding_coeff_abs_remain_r>='d80 && encoding_coeff_abs_remain_r<='d143)
							valid_num_remain_all_r = 'd13;
						else if(encoding_coeff_abs_remain_r>='d144 && encoding_coeff_abs_remain_r<='d271)
							valid_num_remain_all_r = 'd15;	
						else if(encoding_coeff_abs_remain_r>='d272 && encoding_coeff_abs_remain_r<='d527)
							valid_num_remain_all_r = 'd17;
						else if(encoding_coeff_abs_remain_r>='d528 && encoding_coeff_abs_remain_r<='d1039)
							valid_num_remain_all_r = 'd19;		
						else if(encoding_coeff_abs_remain_r>='d1040 && encoding_coeff_abs_remain_r<='d2063)
							valid_num_remain_all_r = 'd21;
						else if(encoding_coeff_abs_remain_r>='d2064 && encoding_coeff_abs_remain_r<='d4111)
							valid_num_remain_all_r = 'd23;
						else if(encoding_coeff_abs_remain_r>='d4112 && encoding_coeff_abs_remain_r<='d8207)
							valid_num_remain_all_r = 'd25;					
						else 
							valid_num_remain_all_r = 'd27;
			end
			
			'd4:	begin
						if(encoding_coeff_abs_remain_r>='d0 && encoding_coeff_abs_remain_r<='d15)
							valid_num_remain_all_r = 'd5;
						else if(encoding_coeff_abs_remain_r>='d16 && encoding_coeff_abs_remain_r<='d31)
							valid_num_remain_all_r = 'd6;
						else if(encoding_coeff_abs_remain_r>='d32 && encoding_coeff_abs_remain_r<='d47)
							valid_num_remain_all_r = 'd7;	
						else if(encoding_coeff_abs_remain_r>='d48 && encoding_coeff_abs_remain_r<='d63)
							valid_num_remain_all_r = 'd8;
						else if(encoding_coeff_abs_remain_r>='d64 && encoding_coeff_abs_remain_r<='d95)
							valid_num_remain_all_r = 'd10;
						else if(encoding_coeff_abs_remain_r>='d96 && encoding_coeff_abs_remain_r<='d159)
							valid_num_remain_all_r = 'd12;
						else if(encoding_coeff_abs_remain_r>='d160 && encoding_coeff_abs_remain_r<='d287)
							valid_num_remain_all_r = 'd14;
						else if(encoding_coeff_abs_remain_r>='d288 && encoding_coeff_abs_remain_r<='d543)
							valid_num_remain_all_r = 'd16;	
						else if(encoding_coeff_abs_remain_r>='d544 && encoding_coeff_abs_remain_r<='d1055)
							valid_num_remain_all_r = 'd18;
						else if(encoding_coeff_abs_remain_r>='d1056 && encoding_coeff_abs_remain_r<='d2079)
							valid_num_remain_all_r = 'd20;		
						else if(encoding_coeff_abs_remain_r>='d2080 && encoding_coeff_abs_remain_r<='d4127)
							valid_num_remain_all_r = 'd22;
						else if(encoding_coeff_abs_remain_r>='d4128 && encoding_coeff_abs_remain_r<='d8223)
							valid_num_remain_all_r = 'd24;		
						else 
							valid_num_remain_all_r = 'd26;
			end
			
			default:begin
						valid_num_remain_all_r = 'd0;
			end
		endcase
	end
end



reg		[15:0]			encoding_coeff_abs_remain_trun_w;

always @* begin
	case(i_go_rice_param_r)
		'd0:	begin
					if(encoding_coeff_abs_remain_r>='d4 && encoding_coeff_abs_remain_r<='d5)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd4;
					else if(encoding_coeff_abs_remain_r>='d6 && encoding_coeff_abs_remain_r<='d9)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd6;
					else if(encoding_coeff_abs_remain_r>='d10 && encoding_coeff_abs_remain_r<='d17)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd10;
					else if(encoding_coeff_abs_remain_r>='d18 && encoding_coeff_abs_remain_r<='d33)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd18;
					else if(encoding_coeff_abs_remain_r>='d34 && encoding_coeff_abs_remain_r<='d65)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd34;	
					else if(encoding_coeff_abs_remain_r>='d66 && encoding_coeff_abs_remain_r<='d129)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd66;
					else if(encoding_coeff_abs_remain_r>='d130 && encoding_coeff_abs_remain_r<='d257)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd130;	
					else if(encoding_coeff_abs_remain_r>='d258 && encoding_coeff_abs_remain_r<='d513)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd258;
					else if(encoding_coeff_abs_remain_r>='d514 && encoding_coeff_abs_remain_r<='d1025)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd514;
					else if(encoding_coeff_abs_remain_r>='d1026 && encoding_coeff_abs_remain_r<='d2049)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd1026;
					else 
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd2050;
		end
		
		'd1:	begin
					if(encoding_coeff_abs_remain_r>='d12 && encoding_coeff_abs_remain_r<='d19)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd12;
					else if(encoding_coeff_abs_remain_r>='d20 && encoding_coeff_abs_remain_r<='d35)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd20;
					else if(encoding_coeff_abs_remain_r>='d36 && encoding_coeff_abs_remain_r<='d67)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd36;
					else if(encoding_coeff_abs_remain_r>='d68 && encoding_coeff_abs_remain_r<='d131)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd68;
					else if(encoding_coeff_abs_remain_r>='d132 && encoding_coeff_abs_remain_r<='d259)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd132;
					else if(encoding_coeff_abs_remain_r>='d260 && encoding_coeff_abs_remain_r<='d515)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd260;
					else if(encoding_coeff_abs_remain_r>='d516 && encoding_coeff_abs_remain_r<='d1027)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd516;
					else if(encoding_coeff_abs_remain_r>='d1028 && encoding_coeff_abs_remain_r<='d2051)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd1028;				
					else 
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd2052;
		end
		
		'd2:	begin
					if(encoding_coeff_abs_remain_r>='d24 && encoding_coeff_abs_remain_r<='d39)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd24;
					else if(encoding_coeff_abs_remain_r>='d40 && encoding_coeff_abs_remain_r<='d71)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd40;
					else if(encoding_coeff_abs_remain_r>='d72 && encoding_coeff_abs_remain_r<='d135)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd72;
					else if(encoding_coeff_abs_remain_r>='d136 && encoding_coeff_abs_remain_r<='d263)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd136;
					else if(encoding_coeff_abs_remain_r>='d264 && encoding_coeff_abs_remain_r<='d519)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd264;
					else if(encoding_coeff_abs_remain_r>='d520 && encoding_coeff_abs_remain_r<='d1031)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd520;
					else if(encoding_coeff_abs_remain_r>='d1032 && encoding_coeff_abs_remain_r<='d2055)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd1032;
					else if(encoding_coeff_abs_remain_r>='d2056 && encoding_coeff_abs_remain_r<='d4103)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd2056;				
					else 
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd4104;
		end
		
		'd3:	begin
					if(encoding_coeff_abs_remain_r>='d48 && encoding_coeff_abs_remain_r<='d79)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd48;
					else if(encoding_coeff_abs_remain_r>='d80 && encoding_coeff_abs_remain_r<='d143)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd80;
					else if(encoding_coeff_abs_remain_r>='d144 && encoding_coeff_abs_remain_r<='d271)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd144;
					else if(encoding_coeff_abs_remain_r>='d272 && encoding_coeff_abs_remain_r<='d527)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd272;
					else if(encoding_coeff_abs_remain_r>='d528 && encoding_coeff_abs_remain_r<='d1039)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd528;
					else if(encoding_coeff_abs_remain_r>='d1040 && encoding_coeff_abs_remain_r<='d2063)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd1040;
					else if(encoding_coeff_abs_remain_r>='d2064 && encoding_coeff_abs_remain_r<='d4111)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd2064;
					else if(encoding_coeff_abs_remain_r>='d4112 && encoding_coeff_abs_remain_r<='d8207)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd4112;
					else 
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd8208;
		end
	
		'd4:	begin
					if(encoding_coeff_abs_remain_r>='d96 && encoding_coeff_abs_remain_r<='d159)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd96;
					else if(encoding_coeff_abs_remain_r>='d160 && encoding_coeff_abs_remain_r<='d287)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd160;
					else if(encoding_coeff_abs_remain_r>='d288 && encoding_coeff_abs_remain_r<='d543)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd288;
					else if(encoding_coeff_abs_remain_r>='d544 && encoding_coeff_abs_remain_r<='d1055)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd544;
					else if(encoding_coeff_abs_remain_r>='d1056 && encoding_coeff_abs_remain_r<='d2079)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd1056;
					else if(encoding_coeff_abs_remain_r>='d2080 && encoding_coeff_abs_remain_r<='d4127)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd2080;
					else if(encoding_coeff_abs_remain_r>='d4128 && encoding_coeff_abs_remain_r<='d8223)
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd4128;
					else 
						encoding_coeff_abs_remain_trun_w = encoding_coeff_abs_remain_r - 'd8224;
		end
		
		default:begin
					encoding_coeff_abs_remain_trun_w = 'd0;
		end
	endcase
end




//bin_string_remain_all_r
always @* begin
	case(i_go_rice_param_r)
		'd0:	begin
					if(encoding_coeff_abs_remain_r=='d0)
						bin_string_remain_all_r = 'd0;
					else if(encoding_coeff_abs_remain_r=='d1)
						bin_string_remain_all_r = 32'h8000_0000;
					else if(encoding_coeff_abs_remain_r=='d2)
						bin_string_remain_all_r = 32'hc000_0000;
					else if(encoding_coeff_abs_remain_r=='d3)
						bin_string_remain_all_r = 32'he000_0000;
					else if(encoding_coeff_abs_remain_r>='d4 && encoding_coeff_abs_remain_r<='d5)
						bin_string_remain_all_r = {5'b11110, encoding_coeff_abs_remain_trun_w[0], 26'd0};
					else if(encoding_coeff_abs_remain_r>='d6 && encoding_coeff_abs_remain_r<='d9)
						bin_string_remain_all_r = {6'b111110, encoding_coeff_abs_remain_trun_w[1:0], 24'd0};
					else if(encoding_coeff_abs_remain_r>='d10 && encoding_coeff_abs_remain_r<='d17)
						bin_string_remain_all_r = {7'b1111110, encoding_coeff_abs_remain_trun_w[2:0], 22'd0};
					else if(encoding_coeff_abs_remain_r>='d18 && encoding_coeff_abs_remain_r<='d33)
						bin_string_remain_all_r = {8'b11111110, encoding_coeff_abs_remain_trun_w[3:0], 20'd0};
					else if(encoding_coeff_abs_remain_r>='d34 && encoding_coeff_abs_remain_r<='d65)
						bin_string_remain_all_r = {9'b111111110, encoding_coeff_abs_remain_trun_w[4:0], 18'd0};	
					else if(encoding_coeff_abs_remain_r>='d66 && encoding_coeff_abs_remain_r<='d129)
						bin_string_remain_all_r = {10'b1111111110, encoding_coeff_abs_remain_trun_w[5:0], 16'd0};
					else if(encoding_coeff_abs_remain_r>='d130 && encoding_coeff_abs_remain_r<='d257)
						bin_string_remain_all_r = {11'b11111111110, encoding_coeff_abs_remain_trun_w[6:0], 14'd0};		
					else if(encoding_coeff_abs_remain_r>='d258 && encoding_coeff_abs_remain_r<='d513)
						bin_string_remain_all_r = {12'b111111111110, encoding_coeff_abs_remain_trun_w[7:0], 12'd0};
					else if(encoding_coeff_abs_remain_r>='d514 && encoding_coeff_abs_remain_r<='d1025)
						bin_string_remain_all_r = {13'b1111111111110, encoding_coeff_abs_remain_trun_w[8:0], 10'd0};
					else if(encoding_coeff_abs_remain_r>='d1026 && encoding_coeff_abs_remain_r<='d2049)
						bin_string_remain_all_r = {14'b11111111111110, encoding_coeff_abs_remain_trun_w[9:0], 8'd0};					
					else 
						bin_string_remain_all_r = {15'b111111111111110, encoding_coeff_abs_remain_trun_w[10:0], 6'd0};
		end
		
		'd1:	begin
					if(encoding_coeff_abs_remain_r>='d0 && encoding_coeff_abs_remain_r<='d1)
						bin_string_remain_all_r = {1'b0, encoding_coeff_abs_remain_r[0], 30'd0};
					else if(encoding_coeff_abs_remain_r>='d2 && encoding_coeff_abs_remain_r<='d3)
						bin_string_remain_all_r = {2'b10, encoding_coeff_abs_remain_r[0], 29'd0};
					else if(encoding_coeff_abs_remain_r>='d4 && encoding_coeff_abs_remain_r<='d5)
						bin_string_remain_all_r = {3'b110, encoding_coeff_abs_remain_r[0], 28'd0};
					else if(encoding_coeff_abs_remain_r>='d6 && encoding_coeff_abs_remain_r<='d7)
						bin_string_remain_all_r = {4'b1110, encoding_coeff_abs_remain_r[0], 27'd0};
					else if(encoding_coeff_abs_remain_r>='d8 && encoding_coeff_abs_remain_r<='d11)
						bin_string_remain_all_r = {5'b11110, encoding_coeff_abs_remain_r[1:0], 25'd0};
					else if(encoding_coeff_abs_remain_r>='d12 && encoding_coeff_abs_remain_r<='d19)
						bin_string_remain_all_r = {6'b111110, encoding_coeff_abs_remain_trun_w[2:0], 23'd0};
					else if(encoding_coeff_abs_remain_r>='d20 && encoding_coeff_abs_remain_r<='d35)
						bin_string_remain_all_r = {7'b1111110, encoding_coeff_abs_remain_trun_w[3:0], 21'd0};
					else if(encoding_coeff_abs_remain_r>='d36 && encoding_coeff_abs_remain_r<='d67)
						bin_string_remain_all_r = {8'b11111110, encoding_coeff_abs_remain_trun_w[4:0], 19'd0};
					else if(encoding_coeff_abs_remain_r>='d68 && encoding_coeff_abs_remain_r<='d131)
						bin_string_remain_all_r = {9'b111111110, encoding_coeff_abs_remain_trun_w[5:0], 17'd0};
					else if(encoding_coeff_abs_remain_r>='d132 && encoding_coeff_abs_remain_r<='d259)
						bin_string_remain_all_r = {10'b1111111110, encoding_coeff_abs_remain_trun_w[6:0], 15'd0};
					else if(encoding_coeff_abs_remain_r>='d260 && encoding_coeff_abs_remain_r<='d515)
						bin_string_remain_all_r = {11'b11111111110, encoding_coeff_abs_remain_trun_w[7:0], 13'd0};
					else if(encoding_coeff_abs_remain_r>='d516 && encoding_coeff_abs_remain_r<='d1027)
						bin_string_remain_all_r = {12'b111111111110, encoding_coeff_abs_remain_trun_w[8:0], 11'd0};
					else if(encoding_coeff_abs_remain_r>='d1028 && encoding_coeff_abs_remain_r<='d2051)
						bin_string_remain_all_r = {13'b1111111111110, encoding_coeff_abs_remain_trun_w[9:0], 9'd0};					
					else 
						bin_string_remain_all_r = {14'b11111111111110, encoding_coeff_abs_remain_trun_w[10:0], 7'd0};
		end
		
		'd2:	begin
					if(encoding_coeff_abs_remain_r>='d0 && encoding_coeff_abs_remain_r<='d3)
						bin_string_remain_all_r = {1'b0, encoding_coeff_abs_remain_r[1:0], 29'd0};
					else if(encoding_coeff_abs_remain_r>='d4 && encoding_coeff_abs_remain_r<='d7)
						bin_string_remain_all_r = {2'b10, encoding_coeff_abs_remain_r[1:0], 28'd0};
					else if(encoding_coeff_abs_remain_r>='d8 && encoding_coeff_abs_remain_r<='d11)
						bin_string_remain_all_r = {3'b110, encoding_coeff_abs_remain_r[1:0], 27'd0};
					else if(encoding_coeff_abs_remain_r>='d12 && encoding_coeff_abs_remain_r<='d15)
						bin_string_remain_all_r = {4'b1110, encoding_coeff_abs_remain_r[1:0], 26'd0};
					else if(encoding_coeff_abs_remain_r>='d16 && encoding_coeff_abs_remain_r<='d23)
						bin_string_remain_all_r = {5'b11110, encoding_coeff_abs_remain_r[2:0], 24'd0};
					else if(encoding_coeff_abs_remain_r>='d24 && encoding_coeff_abs_remain_r<='d39)
						bin_string_remain_all_r = {6'b111110, encoding_coeff_abs_remain_trun_w[3:0], 22'd0};
					else if(encoding_coeff_abs_remain_r>='d40 && encoding_coeff_abs_remain_r<='d71)
						bin_string_remain_all_r = {7'b1111110, encoding_coeff_abs_remain_trun_w[4:0], 20'd0};
					else if(encoding_coeff_abs_remain_r>='d72 && encoding_coeff_abs_remain_r<='d135)
						bin_string_remain_all_r = {8'b11111110, encoding_coeff_abs_remain_trun_w[5:0], 18'd0};
					else if(encoding_coeff_abs_remain_r>='d136 && encoding_coeff_abs_remain_r<='d263)
						bin_string_remain_all_r = {9'b111111110, encoding_coeff_abs_remain_trun_w[6:0], 16'd0};
					else if(encoding_coeff_abs_remain_r>='d264 && encoding_coeff_abs_remain_r<='d519)
						bin_string_remain_all_r = {10'b1111111110, encoding_coeff_abs_remain_trun_w[7:0], 14'd0};
					else if(encoding_coeff_abs_remain_r>='d520 && encoding_coeff_abs_remain_r<='d1031)
						bin_string_remain_all_r = {11'b11111111110, encoding_coeff_abs_remain_trun_w[8:0], 12'd0};
					else if(encoding_coeff_abs_remain_r>='d1032 && encoding_coeff_abs_remain_r<='d2055)
						bin_string_remain_all_r = {12'b111111111110, encoding_coeff_abs_remain_trun_w[9:0], 10'd0};
					else if(encoding_coeff_abs_remain_r>='d2056 && encoding_coeff_abs_remain_r<='d4103)
						bin_string_remain_all_r = {13'b1111111111110, encoding_coeff_abs_remain_trun_w[10:0], 8'd0};					
					else 
						bin_string_remain_all_r = {14'b11111111111110, encoding_coeff_abs_remain_trun_w[11:0], 6'd0};
		end
		
		'd3:	begin
					if(encoding_coeff_abs_remain_r>='d0 && encoding_coeff_abs_remain_r<='d7)
						bin_string_remain_all_r = {1'b0, encoding_coeff_abs_remain_r[2:0], 28'd0};
					else if(encoding_coeff_abs_remain_r>='d8 && encoding_coeff_abs_remain_r<='d15)
						bin_string_remain_all_r = {2'b10, encoding_coeff_abs_remain_r[2:0], 27'd0};
					else if(encoding_coeff_abs_remain_r>='d16 && encoding_coeff_abs_remain_r<='d23)
						bin_string_remain_all_r = {3'b110, encoding_coeff_abs_remain_r[2:0], 26'd0};
					else if(encoding_coeff_abs_remain_r>='d24 && encoding_coeff_abs_remain_r<='d31)
						bin_string_remain_all_r = {4'b1110, encoding_coeff_abs_remain_r[2:0], 25'd0};
					else if(encoding_coeff_abs_remain_r>='d32&& encoding_coeff_abs_remain_r<='d47)
						bin_string_remain_all_r = {5'b11110, encoding_coeff_abs_remain_r[3:0], 23'd0};
					else if(encoding_coeff_abs_remain_r>='d48 && encoding_coeff_abs_remain_r<='d79)
						bin_string_remain_all_r = {6'b111110, encoding_coeff_abs_remain_trun_w[4:0], 21'd0};
					else if(encoding_coeff_abs_remain_r>='d80 && encoding_coeff_abs_remain_r<='d143)
						bin_string_remain_all_r = {7'b1111110, encoding_coeff_abs_remain_trun_w[5:0], 19'd0};
					else if(encoding_coeff_abs_remain_r>='d144 && encoding_coeff_abs_remain_r<='d271)
						bin_string_remain_all_r = {8'b11111110, encoding_coeff_abs_remain_trun_w[6:0], 17'd0};
					else if(encoding_coeff_abs_remain_r>='d272 && encoding_coeff_abs_remain_r<='d527)
						bin_string_remain_all_r = {9'b111111110, encoding_coeff_abs_remain_trun_w[7:0], 15'd0};
					else if(encoding_coeff_abs_remain_r>='d528 && encoding_coeff_abs_remain_r<='d1039)
						bin_string_remain_all_r = {10'b1111111110, encoding_coeff_abs_remain_trun_w[8:0], 13'd0};
					else if(encoding_coeff_abs_remain_r>='d1040 && encoding_coeff_abs_remain_r<='d2063)
						bin_string_remain_all_r = {11'b11111111110, encoding_coeff_abs_remain_trun_w[9:0], 11'd0};
					else if(encoding_coeff_abs_remain_r>='d2064 && encoding_coeff_abs_remain_r<='d4111)
						bin_string_remain_all_r = {12'b111111111110, encoding_coeff_abs_remain_trun_w[10:0], 9'd0};
					else if(encoding_coeff_abs_remain_r>='d4112 && encoding_coeff_abs_remain_r<='d8207)
						bin_string_remain_all_r = {13'b1111111111110, encoding_coeff_abs_remain_trun_w[11:0], 7'd0};
					else 
						bin_string_remain_all_r = {14'b11111111111110, encoding_coeff_abs_remain_trun_w[12:0], 5'd0};
		end
		
		'd4:	begin
					if(encoding_coeff_abs_remain_r>='d0 && encoding_coeff_abs_remain_r<='d15)
						bin_string_remain_all_r = {1'b0, encoding_coeff_abs_remain_r[3:0], 27'd0};
					else if(encoding_coeff_abs_remain_r>='d16 && encoding_coeff_abs_remain_r<='d31)
						bin_string_remain_all_r = {2'b10, encoding_coeff_abs_remain_r[3:0], 26'd0};
					else if(encoding_coeff_abs_remain_r>='d32 && encoding_coeff_abs_remain_r<='d47)
						bin_string_remain_all_r = {3'b110, encoding_coeff_abs_remain_r[3:0], 25'd0};
					else if(encoding_coeff_abs_remain_r>='d48 && encoding_coeff_abs_remain_r<='d63)
						bin_string_remain_all_r = {4'b1110, encoding_coeff_abs_remain_r[3:0], 24'd0};
					else if(encoding_coeff_abs_remain_r>='d64 && encoding_coeff_abs_remain_r<='d95)
						bin_string_remain_all_r = {5'b11110, encoding_coeff_abs_remain_r[4:0], 22'd0};
					else if(encoding_coeff_abs_remain_r>='d96 && encoding_coeff_abs_remain_r<='d159)
						bin_string_remain_all_r = {6'b111110, encoding_coeff_abs_remain_trun_w[5:0], 20'd0};
					else if(encoding_coeff_abs_remain_r>='d160 && encoding_coeff_abs_remain_r<='d287)
						bin_string_remain_all_r = {7'b1111110, encoding_coeff_abs_remain_trun_w[6:0], 18'd0};
					else if(encoding_coeff_abs_remain_r>='d288 && encoding_coeff_abs_remain_r<='d543)
						bin_string_remain_all_r = {8'b11111110, encoding_coeff_abs_remain_trun_w[7:0], 16'd0};
					else if(encoding_coeff_abs_remain_r>='d544 && encoding_coeff_abs_remain_r<='d1055)
						bin_string_remain_all_r = {9'b111111110, encoding_coeff_abs_remain_trun_w[8:0], 14'd0};
					else if(encoding_coeff_abs_remain_r>='d1056 && encoding_coeff_abs_remain_r<='d2079)
						bin_string_remain_all_r = {10'b1111111110, encoding_coeff_abs_remain_trun_w[9:0], 12'd0};
					else if(encoding_coeff_abs_remain_r>='d2080 && encoding_coeff_abs_remain_r<='d4127)
						bin_string_remain_all_r = {11'b11111111110, encoding_coeff_abs_remain_trun_w[10:0], 10'd0};
					else if(encoding_coeff_abs_remain_r>='d4128 && encoding_coeff_abs_remain_r<='d8223)
						bin_string_remain_all_r = {12'b111111111110, encoding_coeff_abs_remain_trun_w[11:0], 8'd0};		
					else 
						bin_string_remain_all_r = {13'b1111111111110, encoding_coeff_abs_remain_trun_w[12:0], 6'd0};
		end
		
		default:begin
					bin_string_remain_all_r = 'd0;
		end
	endcase
end



//bin_string_remain_r
always @* begin
	if(tu_curr_state_r!=TU_RES_REMAIN)
		bin_string_remain_r = 'd0;
	else if(enc_remain_cyc_cnt_r<'d4)
		bin_string_remain_r = bin_string_remain_all_r[31:16];
	else
		bin_string_remain_r = bin_string_remain_all_r[15:0];	
end



//valid_num_remain_r
always @* begin
	if(tu_curr_state_r!=TU_RES_REMAIN)
		valid_num_remain_r = 'd0;
	else if(enc_remain_cyc_cnt_r<'d4) begin
		if(valid_num_remain_all_r>='d16)
			valid_num_remain_r = 'd16;
		else
			valid_num_remain_r = valid_num_remain_all_r;
	end
	else 
		valid_num_remain_r = valid_num_remain_all_r - 'd16;
end























//output
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		ctx_pair_residual0_o  <= 'd0; 			
		ctx_pair_residual1_o  <= 'd0;		
		ctx_pair_residual2_o  <= 'd0;	
		ctx_pair_residual3_o  <= 'd0;	
		ctx_pair_residual4_o  <= 'd0;    	
		ctx_pair_residual5_o  <= 'd0;			
		ctx_pair_residual6_o  <= 'd0;			
		ctx_pair_residual7_o  <= 'd0;			
		ctx_pair_residual8_o  <= 'd0;		
		ctx_pair_residual9_o  <= 'd0;		
		ctx_pair_residual10_o <= 'd0; 		
		ctx_pair_residual11_o <= 'd0;		
		ctx_pair_residual12_o <= 'd0;		
		ctx_pair_residual13_o <= 'd0;		
		ctx_pair_residual14_o <= 'd0;		
		ctx_pair_residual15_o <= 'd0;		
		valid_num_residual_o  <= 'd0; 
	end
	else begin
		case(res_curr_state_r)
			RESIDUAL_ROOT_CBF:			begin
											ctx_pair_residual0_o  <= ctx_pair_root_cbf_w; 			
											ctx_pair_residual1_o  <= 'd0;		
											ctx_pair_residual2_o  <= 'd0;	
											ctx_pair_residual3_o  <= 'd0;	
											ctx_pair_residual4_o  <= 'd0;    	
											ctx_pair_residual5_o  <= 'd0;			
											ctx_pair_residual6_o  <= 'd0;			
											ctx_pair_residual7_o  <= 'd0;			
											ctx_pair_residual8_o  <= 'd0;		
											ctx_pair_residual9_o  <= 'd0;		
											ctx_pair_residual10_o <= 'd0; 		
											ctx_pair_residual11_o <= 'd0;		
											ctx_pair_residual12_o <= 'd0;		
											ctx_pair_residual13_o <= 'd0;		
											ctx_pair_residual14_o <= 'd0;		
											ctx_pair_residual15_o <= 'd0;		
											valid_num_residual_o  <= valid_num_bin_root_cbf_r; 
			end
			           
			
			RESIDUAL_CHROMA_CBF_ROOT:	begin
											ctx_pair_residual0_o  <= ctx_pair_chroma_root_cbf_0_w; 			
											ctx_pair_residual1_o  <= ctx_pair_chroma_root_cbf_1_w;		
											ctx_pair_residual2_o  <= 'd0;	
											ctx_pair_residual3_o  <= 'd0;	
											ctx_pair_residual4_o  <= 'd0;    	
											ctx_pair_residual5_o  <= 'd0;			
											ctx_pair_residual6_o  <= 'd0;			
											ctx_pair_residual7_o  <= 'd0;			
											ctx_pair_residual8_o  <= 'd0;		
											ctx_pair_residual9_o  <= 'd0;		
											ctx_pair_residual10_o <= 'd0; 		
											ctx_pair_residual11_o <= 'd0;		
											ctx_pair_residual12_o <= 'd0;		
											ctx_pair_residual13_o <= 'd0;		
											ctx_pair_residual14_o <= 'd0;		
											ctx_pair_residual15_o <= 'd0;		
											valid_num_residual_o  <= valid_num_bin_chroma_root_cbf_w; 
			end
					           
			RESIDUAL_SUB_DIV:			begin
											ctx_pair_residual0_o  <= ctx_pair_sub_div_w; 			
											ctx_pair_residual1_o  <= 'd0;		
											ctx_pair_residual2_o  <= 'd0;	
											ctx_pair_residual3_o  <= 'd0;	
											ctx_pair_residual4_o  <= 'd0;    	
											ctx_pair_residual5_o  <= 'd0;			
											ctx_pair_residual6_o  <= 'd0;			
											ctx_pair_residual7_o  <= 'd0;			
											ctx_pair_residual8_o  <= 'd0;		
											ctx_pair_residual9_o  <= 'd0;		
											ctx_pair_residual10_o <= 'd0; 		
											ctx_pair_residual11_o <= 'd0;		
											ctx_pair_residual12_o <= 'd0;		
											ctx_pair_residual13_o <= 'd0;		
											ctx_pair_residual14_o <= 'd0;		
											ctx_pair_residual15_o <= 'd0;		
											valid_num_residual_o  <= valid_num_bin_sub_div_r; 
			end
							           
			RESIDUAL_CHROMA_CBF:		begin
											ctx_pair_residual0_o  <= ctx_pair_chroma_cbf_0_w; 			
											ctx_pair_residual1_o  <= ctx_pair_chroma_cbf_1_w;		
											ctx_pair_residual2_o  <= 'd0;	
											ctx_pair_residual3_o  <= 'd0;	
											ctx_pair_residual4_o  <= 'd0;    	
											ctx_pair_residual5_o  <= 'd0;			
											ctx_pair_residual6_o  <= 'd0;			
											ctx_pair_residual7_o  <= 'd0;			
											ctx_pair_residual8_o  <= 'd0;		
											ctx_pair_residual9_o  <= 'd0;		
											ctx_pair_residual10_o <= 'd0; 		
											ctx_pair_residual11_o <= 'd0;		
											ctx_pair_residual12_o <= 'd0;		
											ctx_pair_residual13_o <= 'd0;		
											ctx_pair_residual14_o <= 'd0;		
											ctx_pair_residual15_o <= 'd0;		
											valid_num_residual_o  <= valid_num_bin_chroma_cbf_r; 
			end
							           
			RESIDUAL_LUMA_CBF:			begin
											ctx_pair_residual0_o  <= ctx_pair_luma_cbf_w; 			
											ctx_pair_residual1_o  <= 'd0;		
											ctx_pair_residual2_o  <= 'd0;	
											ctx_pair_residual3_o  <= 'd0;	
											ctx_pair_residual4_o  <= 'd0;    	
											ctx_pair_residual5_o  <= 'd0;			
											ctx_pair_residual6_o  <= 'd0;			
											ctx_pair_residual7_o  <= 'd0;			
											ctx_pair_residual8_o  <= 'd0;		
											ctx_pair_residual9_o  <= 'd0;		
											ctx_pair_residual10_o <= 'd0; 		
											ctx_pair_residual11_o <= 'd0;		
											ctx_pair_residual12_o <= 'd0;		
											ctx_pair_residual13_o <= 'd0;		
											ctx_pair_residual14_o <= 'd0;		
											ctx_pair_residual15_o <= 'd0;		
											valid_num_residual_o  <= valid_num_bin_luma_cbf_r; 
			end
							           
			RESIDUAL_DQP:				begin
											ctx_pair_residual0_o  <= ctx_pair_qp_delta_0_w; 			
											ctx_pair_residual1_o  <= ctx_pair_qp_delta_1_w;		
											ctx_pair_residual2_o  <= ctx_pair_qp_delta_2_w;	
											ctx_pair_residual3_o  <= ctx_pair_qp_delta_3_w;	
											ctx_pair_residual4_o  <= ctx_pair_qp_delta_4_w;    	
											ctx_pair_residual5_o  <= ctx_pair_qp_delta_5_w;			
											ctx_pair_residual6_o  <= ctx_pair_qp_delta_6_w;			
											ctx_pair_residual7_o  <= ctx_pair_qp_delta_7_w;			
											ctx_pair_residual8_o  <= ctx_pair_qp_delta_8_w;		
											ctx_pair_residual9_o  <= ctx_pair_qp_delta_9_w;		
											ctx_pair_residual10_o <= ctx_pair_qp_delta_10_w; 		
											ctx_pair_residual11_o <= ctx_pair_qp_delta_11_w;		
											ctx_pair_residual12_o <= ctx_pair_qp_delta_12_w;		
											ctx_pair_residual13_o <= ctx_pair_qp_delta_13_w;		
											ctx_pair_residual14_o <= ctx_pair_qp_delta_14_w;		
											ctx_pair_residual15_o <= ctx_pair_qp_delta_15_w;		
											valid_num_residual_o  <= valid_num_bin_qp_delta_r; 
			end
								           
			RESIDUAL_LUMA_COEFF,				           
			RESIDUAL_CR_COEFF,				           
			RESIDUAL_CB_COEFF:			begin
				case(tu_curr_state_r)
					TU_SKIP_LAST_SIG:		begin
												ctx_pair_residual0_o  <= ctx_pair_transform_skip_w; 			
												ctx_pair_residual1_o  <= 'd0;		
												ctx_pair_residual2_o  <= 'd0;	
												ctx_pair_residual3_o  <= 'd0;	
												ctx_pair_residual4_o  <= 'd0;    	
												ctx_pair_residual5_o  <= 'd0;			
												ctx_pair_residual6_o  <= 'd0;			
												ctx_pair_residual7_o  <= 'd0;			
												ctx_pair_residual8_o  <= 'd0;		
												ctx_pair_residual9_o  <= 'd0;		
												ctx_pair_residual10_o <= 'd0; 		
												ctx_pair_residual11_o <= 'd0;		
												ctx_pair_residual12_o <= 'd0;		
												ctx_pair_residual13_o <= 'd0;		
												ctx_pair_residual14_o <= 'd0;		
												ctx_pair_residual15_o <= 'd0;		
												valid_num_residual_o  <= 'd1; 
					end
						
					TU_LAST_SIG:			begin              
												case(last_xy_r) 
													'd0:	begin
																//x_prefix
																ctx_pair_residual0_o  <= ctx_pair_last_x_prefix_0_w; 			
																ctx_pair_residual1_o  <= ctx_pair_last_x_prefix_1_w;		
																ctx_pair_residual2_o  <= ctx_pair_last_x_prefix_2_w;	
																ctx_pair_residual3_o  <= ctx_pair_last_x_prefix_3_w;	
																ctx_pair_residual4_o  <= ctx_pair_last_x_prefix_4_w;    	
																ctx_pair_residual5_o  <= ctx_pair_last_x_prefix_5_w;			
																ctx_pair_residual6_o  <= ctx_pair_last_x_prefix_6_w;			
																ctx_pair_residual7_o  <= ctx_pair_last_x_prefix_7_w;			
																ctx_pair_residual8_o  <= ctx_pair_last_x_prefix_8_w;		
																ctx_pair_residual9_o  <= 'd0;		
																ctx_pair_residual10_o <= 'd0; 		
																ctx_pair_residual11_o <= 'd0;		
																ctx_pair_residual12_o <= 'd0;		
																ctx_pair_residual13_o <= 'd0;		
																ctx_pair_residual14_o <= 'd0;		
																ctx_pair_residual15_o <= 'd0;		
																valid_num_residual_o  <= valid_num_bin_last_x_prefix_w; 
													end
												
													'd2:	begin
																//x_suffix
																ctx_pair_residual0_o  <= ctx_pair_last_x_suffix_0_w; 			
																ctx_pair_residual1_o  <= ctx_pair_last_x_suffix_1_w;		
																ctx_pair_residual2_o  <= ctx_pair_last_x_suffix_2_w;	
																ctx_pair_residual3_o  <= 'd0;	
																ctx_pair_residual4_o  <= 'd0;    	
																ctx_pair_residual5_o  <= 'd0;			
																ctx_pair_residual6_o  <= 'd0;			
																ctx_pair_residual7_o  <= 'd0;			
																ctx_pair_residual8_o  <= 'd0;		
																ctx_pair_residual9_o  <= 'd0;		
																ctx_pair_residual10_o <= 'd0; 		
																ctx_pair_residual11_o <= 'd0;		
																ctx_pair_residual12_o <= 'd0;		
																ctx_pair_residual13_o <= 'd0;		
																ctx_pair_residual14_o <= 'd0;		
																ctx_pair_residual15_o <= 'd0;		
																valid_num_residual_o  <= valid_num_bin_last_x_suffix_r; 
													end
												
												    'd1:	begin
																//y_prefix
																ctx_pair_residual0_o  <= ctx_pair_last_y_prefix_0_w; 			
																ctx_pair_residual1_o  <= ctx_pair_last_y_prefix_1_w;		
																ctx_pair_residual2_o  <= ctx_pair_last_y_prefix_2_w;	
																ctx_pair_residual3_o  <= ctx_pair_last_y_prefix_3_w;	
																ctx_pair_residual4_o  <= ctx_pair_last_y_prefix_4_w;    	
																ctx_pair_residual5_o  <= ctx_pair_last_y_prefix_5_w;			
																ctx_pair_residual6_o  <= ctx_pair_last_y_prefix_6_w;			
																ctx_pair_residual7_o  <= ctx_pair_last_y_prefix_7_w;			
																ctx_pair_residual8_o  <= ctx_pair_last_y_prefix_8_w;		
																ctx_pair_residual9_o  <= 'd0;		
																ctx_pair_residual10_o <= 'd0; 		
																ctx_pair_residual11_o <= 'd0;		
																ctx_pair_residual12_o <= 'd0;		
																ctx_pair_residual13_o <= 'd0;		
																ctx_pair_residual14_o <= 'd0;		
																ctx_pair_residual15_o <= 'd0;		
																valid_num_residual_o  <= valid_num_bin_last_y_prefix_w; 
												    end
												    
												    'd3:	begin
																//y_suffix
																ctx_pair_residual0_o  <= ctx_pair_last_y_suffix_0_w; 			
																ctx_pair_residual1_o  <= ctx_pair_last_y_suffix_1_w;		
																ctx_pair_residual2_o  <= ctx_pair_last_y_suffix_2_w;	
																ctx_pair_residual3_o  <= 'd0;	
																ctx_pair_residual4_o  <= 'd0;    	
																ctx_pair_residual5_o  <= 'd0;			
																ctx_pair_residual6_o  <= 'd0;			
																ctx_pair_residual7_o  <= 'd0;			
																ctx_pair_residual8_o  <= 'd0;		
																ctx_pair_residual9_o  <= 'd0;		
																ctx_pair_residual10_o <= 'd0; 		
																ctx_pair_residual11_o <= 'd0;		
																ctx_pair_residual12_o <= 'd0;		
																ctx_pair_residual13_o <= 'd0;		
																ctx_pair_residual14_o <= 'd0;		
																ctx_pair_residual15_o <= 'd0;		
																valid_num_residual_o  <= valid_num_bin_last_y_suffix_r; 
													end
													
													default:begin
																ctx_pair_residual0_o  <= 'd0; 			
																ctx_pair_residual1_o  <= 'd0;		
																ctx_pair_residual2_o  <= 'd0;	
																ctx_pair_residual3_o  <= 'd0;	
																ctx_pair_residual4_o  <= 'd0;    	
																ctx_pair_residual5_o  <= 'd0;			
																ctx_pair_residual6_o  <= 'd0;			
																ctx_pair_residual7_o  <= 'd0;			
																ctx_pair_residual8_o  <= 'd0;		
																ctx_pair_residual9_o  <= 'd0;		
																ctx_pair_residual10_o <= 'd0; 		
																ctx_pair_residual11_o <= 'd0;		
																ctx_pair_residual12_o <= 'd0;		
																ctx_pair_residual13_o <= 'd0;		
																ctx_pair_residual14_o <= 'd0;		
																ctx_pair_residual15_o <= 'd0;		
																valid_num_residual_o  <= 'd0; 
													end
												endcase
					end
								
					TU_BLK_CBF:				begin
												ctx_pair_residual0_o  <= ctx_pair_sub_blk_sig_w; 			
												ctx_pair_residual1_o  <= 'd0;		
												ctx_pair_residual2_o  <= 'd0;	
												ctx_pair_residual3_o  <= 'd0;	
												ctx_pair_residual4_o  <= 'd0;    	
												ctx_pair_residual5_o  <= 'd0;			
												ctx_pair_residual6_o  <= 'd0;			
												ctx_pair_residual7_o  <= 'd0;			
												ctx_pair_residual8_o  <= 'd0;		
												ctx_pair_residual9_o  <= 'd0;		
												ctx_pair_residual10_o <= 'd0; 		
												ctx_pair_residual11_o <= 'd0;		
												ctx_pair_residual12_o <= 'd0;		
												ctx_pair_residual13_o <= 'd0;		
												ctx_pair_residual14_o <= 'd0;		
												ctx_pair_residual15_o <= 'd0;		
												valid_num_residual_o  <= valid_num_bin_sub_blk_sig_r;
					end
								
					TU_SIG_FLAG:			begin
												ctx_pair_residual0_o  <= ctx_pair_sig_flag_0_r; 			
												ctx_pair_residual1_o  <= ctx_pair_sig_flag_1_r;		
												ctx_pair_residual2_o  <= ctx_pair_sig_flag_2_r;	
												ctx_pair_residual3_o  <= ctx_pair_sig_flag_3_r;	
												ctx_pair_residual4_o  <= ctx_pair_sig_flag_4_r;    	
												ctx_pair_residual5_o  <= ctx_pair_sig_flag_5_r;			
												ctx_pair_residual6_o  <= ctx_pair_sig_flag_6_r;			
												ctx_pair_residual7_o  <= ctx_pair_sig_flag_7_r;			
												ctx_pair_residual8_o  <= ctx_pair_sig_flag_8_r;		
												ctx_pair_residual9_o  <= ctx_pair_sig_flag_9_r;		
												ctx_pair_residual10_o <= ctx_pair_sig_flag_10_r; 		
												ctx_pair_residual11_o <= ctx_pair_sig_flag_11_r;		
												ctx_pair_residual12_o <= ctx_pair_sig_flag_12_r;		
												ctx_pair_residual13_o <= ctx_pair_sig_flag_13_r;		
												ctx_pair_residual14_o <= ctx_pair_sig_flag_14_r;		
												ctx_pair_residual15_o <= ctx_pair_sig_flag_15_r;		
												valid_num_residual_o  <= valid_num_bin_sig_flag_r; 
					end
								
					TU_GE12:				begin
												ctx_pair_residual0_o  <= ctx_pair_ge12_0_w; 			
												ctx_pair_residual1_o  <= ctx_pair_ge12_1_w;		
												ctx_pair_residual2_o  <= ctx_pair_ge12_2_w;	
												ctx_pair_residual3_o  <= ctx_pair_ge12_3_w;	
												ctx_pair_residual4_o  <= ctx_pair_ge12_4_w;    	
												ctx_pair_residual5_o  <= ctx_pair_ge12_5_w;			
												ctx_pair_residual6_o  <= ctx_pair_ge12_6_w;			
												ctx_pair_residual7_o  <= ctx_pair_ge12_7_w;			
												ctx_pair_residual8_o  <= ctx_pair_ge12_8_w;		
												ctx_pair_residual9_o  <= 'd0;		
												ctx_pair_residual10_o <= 'd0; 		
												ctx_pair_residual11_o <= 'd0;		
												ctx_pair_residual12_o <= 'd0;		
												ctx_pair_residual13_o <= 'd0;		
												ctx_pair_residual14_o <= 'd0;		
												ctx_pair_residual15_o <= 'd0;		
												valid_num_residual_o  <= valid_num_bin_ge12_r;
					end
									
					TU_RES_SIGN:			begin
												ctx_pair_residual0_o  <= ctx_pair_sign_0_w; 			
												ctx_pair_residual1_o  <= ctx_pair_sign_1_w;		
												ctx_pair_residual2_o  <= ctx_pair_sign_2_w;	
												ctx_pair_residual3_o  <= ctx_pair_sign_3_w;	
												ctx_pair_residual4_o  <= ctx_pair_sign_4_w;    	
												ctx_pair_residual5_o  <= ctx_pair_sign_5_w;			
												ctx_pair_residual6_o  <= ctx_pair_sign_6_w;			
												ctx_pair_residual7_o  <= ctx_pair_sign_7_w;			
												ctx_pair_residual8_o  <= ctx_pair_sign_8_w;		
												ctx_pair_residual9_o  <= ctx_pair_sign_9_w;		
												ctx_pair_residual10_o <= ctx_pair_sign_10_w; 		
												ctx_pair_residual11_o <= ctx_pair_sign_11_w;		
												ctx_pair_residual12_o <= ctx_pair_sign_12_w;		
												ctx_pair_residual13_o <= ctx_pair_sign_13_w;		
												ctx_pair_residual14_o <= ctx_pair_sign_14_w;		
												ctx_pair_residual15_o <= ctx_pair_sign_15_w;		
												valid_num_residual_o  <= valid_num_bin_sign_r;
					end
								
					TU_RES_REMAIN:			begin
												ctx_pair_residual0_o  <= ctx_pair_remain_0_w; 			
												ctx_pair_residual1_o  <= ctx_pair_remain_1_w;		
												ctx_pair_residual2_o  <= ctx_pair_remain_2_w;	
												ctx_pair_residual3_o  <= ctx_pair_remain_3_w;	
												ctx_pair_residual4_o  <= ctx_pair_remain_4_w;    	
												ctx_pair_residual5_o  <= ctx_pair_remain_5_w;			
												ctx_pair_residual6_o  <= ctx_pair_remain_6_w;			
												ctx_pair_residual7_o  <= ctx_pair_remain_7_w;			
												ctx_pair_residual8_o  <= ctx_pair_remain_8_w;		
												ctx_pair_residual9_o  <= ctx_pair_remain_9_w;		
												ctx_pair_residual10_o <= ctx_pair_remain_10_w; 		
												ctx_pair_residual11_o <= ctx_pair_remain_11_w;		
												ctx_pair_residual12_o <= ctx_pair_remain_12_w;		
												ctx_pair_residual13_o <= ctx_pair_remain_13_w;		
												ctx_pair_residual14_o <= ctx_pair_remain_14_w;		
												ctx_pair_residual15_o <= ctx_pair_remain_15_w;		
												valid_num_residual_o  <= valid_num_remain_r;
					end
							
					default:				begin
												ctx_pair_residual0_o  <= 'd0; 			
												ctx_pair_residual1_o  <= 'd0;		
												ctx_pair_residual2_o  <= 'd0;	
												ctx_pair_residual3_o  <= 'd0;	
												ctx_pair_residual4_o  <= 'd0;    	
												ctx_pair_residual5_o  <= 'd0;			
												ctx_pair_residual6_o  <= 'd0;			
												ctx_pair_residual7_o  <= 'd0;			
												ctx_pair_residual8_o  <= 'd0;		
												ctx_pair_residual9_o  <= 'd0;		
												ctx_pair_residual10_o <= 'd0; 		
												ctx_pair_residual11_o <= 'd0;		
												ctx_pair_residual12_o <= 'd0;		
												ctx_pair_residual13_o <= 'd0;		
												ctx_pair_residual14_o <= 'd0;		
												ctx_pair_residual15_o <= 'd0;		
												valid_num_residual_o  <= 'd0;
					end
				endcase
			end	
			
			default:					begin
												ctx_pair_residual0_o  <= 'd0; 			
												ctx_pair_residual1_o  <= 'd0;		
												ctx_pair_residual2_o  <= 'd0;	
												ctx_pair_residual3_o  <= 'd0;	
												ctx_pair_residual4_o  <= 'd0;    	
												ctx_pair_residual5_o  <= 'd0;			
												ctx_pair_residual6_o  <= 'd0;			
												ctx_pair_residual7_o  <= 'd0;			
												ctx_pair_residual8_o  <= 'd0;		
												ctx_pair_residual9_o  <= 'd0;		
												ctx_pair_residual10_o <= 'd0; 		
												ctx_pair_residual11_o <= 'd0;		
												ctx_pair_residual12_o <= 'd0;		
												ctx_pair_residual13_o <= 'd0;		
												ctx_pair_residual14_o <= 'd0;		
												ctx_pair_residual15_o <= 'd0;		
												valid_num_residual_o  <= 'd0;
			end				
		endcase    
	end
end





















endmodule                  


