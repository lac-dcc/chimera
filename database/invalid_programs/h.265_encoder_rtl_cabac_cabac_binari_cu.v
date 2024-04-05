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
// Filename       : cabac_binari_cu.v
// Author         : chewein
// Created        : 2014-9-11
// Description    : binarization an cu , cu size is 8x8 , 16x16 , 32x32 64x64
//-----------------------------------------------------------------------------------------------------------------------------
`include"enc_defines.v" 

module cabac_binari_cu(
                        // input  
                            clk                      ,   
                            rst_n                    ,
                            cu_start_i               ,
                            cu_idx_i                 ,
                            cu_depth_i               ,
                            cu_split_transform_i     ,
                            cu_slice_type_i          ,
                            cu_skip_flag_i           ,
                            cu_part_size_i           ,
                            cu_merge_flag_i          ,
                            cu_merge_idx_i           ,
                            cu_luma_pred_mode_i      ,
                            cu_chroma_pred_mode_i    ,
                            cu_cbf_y_i               ,
                            cu_cbf_u_i               ,
                            cu_cbf_v_i               ,
							cu_qp_i                  ,
							last_cu_flag_i           ,
                            cu_skip_top_flag_i       ,
                            cu_skip_left_flag_i      ,
                            cu_luma_pred_top_mode_i  ,
                            cu_luma_pred_left_mode_i ,
                            cu_qp_last_i             ,
                            tq_rdata_i		         ,
                            cu_mv_data_i	         ,
							cu_qp_nocoded_i          ,
							
                        // output                
                            cu_done_o                ,
							coeff_type_o             ,
							tq_ren_o		         ,
                            tq_raddr_o		         ,
							cu_qp_coded_flag_o       ,
							
							cu_binary_pair_0_o		 ,
                            cu_binary_pair_1_o		 ,
                            cu_binary_pair_2_o		 ,
                            cu_binary_pair_3_o		 ,
				            cu_binary_pair_valid_num_o 
);  
//-----------------------------------------------------------------------------------------------------------------------------
//
//                                input signals and output signals 
//
//-----------------------------------------------------------------------------------------------------------------------------
input				                clk					    ; // clock signal
input				                rst_n					; // reset signal, low active
input				                cu_start_i   			; // cabac start signal, pulse signal
input  [ 6:0]                       cu_idx_i                ;
input  [ 1:0]                       cu_depth_i              ; // cu_depth,0:64x64,1:32x32,2:16x16,3:8x8        
input                               cu_split_transform_i    ;           
input                               cu_slice_type_i         ; // slice type, (`SLICE_TYPE_I):1, (`SLICE_TYPE_P):0     
input                               cu_skip_flag_i          ;      
input  [ 1:0]                       cu_part_size_i          ; // inter part size        
input  [ 3:0]                       cu_merge_flag_i         ;   
input  [15:0]                       cu_merge_idx_i          ;     
input  [23:0]                       cu_luma_pred_mode_i     ;  
input  [ 5:0]                       cu_chroma_pred_mode_i   ; 
input  [ 3:0]                       cu_cbf_y_i              ; 
input  [ 3:0]                       cu_cbf_u_i              ; 
input  [ 3:0]                       cu_cbf_v_i              ;  
input  [ 5:0]                       cu_qp_i                 ; // ==6'd63 : coded already 
input                               last_cu_flag_i          ; // the last cu in the current lcu 
input                               cu_skip_top_flag_i      ; 
input                               cu_skip_left_flag_i     ;    
input  [23:0]                       cu_luma_pred_top_mode_i ; 
input  [23:0]                       cu_luma_pred_left_mode_i; 
input  [5:0]                        cu_qp_last_i            ;
input  [`COEFF_WIDTH*16-1:0] 		tq_rdata_i		        ; // coeff data tq read data
input  [(4*`MVD_WIDTH+5):0]         cu_mv_data_i	        ; // Inter mvd read data 
input                               cu_qp_nocoded_i         ;

output                              cu_done_o               ;
output  [1:0]                       coeff_type_o            ;
output  							tq_ren_o		        ;// coeff data tq read enable
output [8:0]	                    tq_raddr_o		        ;// coeff data tq read address
output                              cu_qp_coded_flag_o      ;

output  [10:0]                      cu_binary_pair_0_o		;
output  [10:0]                      cu_binary_pair_1_o		;
output  [10:0]                      cu_binary_pair_2_o		;
output  [10:0]                      cu_binary_pair_3_o		;
output  [2:0]                       cu_binary_pair_valid_num_o; 

reg     [10:0]                      cu_binary_pair_0_o		;
reg     [10:0]                      cu_binary_pair_1_o		;
reg     [10:0]                      cu_binary_pair_2_o		;
reg     [10:0]                      cu_binary_pair_3_o		;
reg     [2:0]                       cu_binary_pair_valid_num_o; 

//-----------------------------------------------------------------------------------------------------------------------------
//
//             controller signals   wire declaration 
//
//-----------------------------------------------------------------------------------------------------------------------------
wire                                state_intra_w                              ;
wire                                state_skip_w                               ;
wire                                state_merge_w                              ;
wire                                state_inter_tree_w                         ;
wire                                cu_tree_done_w                             ;
wire       [1:0]                    coeff_type_w                               ;
wire                                rqt_root_cbf_w                             ;
wire                                cu_tree_done_flag_w                        ;
reg        [3:0]                    cu_cnt_r                                   ;
reg                                 tree_start_r                               ;// (intra || state_inter_tree_w )&&cu_start_i
reg                                 num_pu_flag_r                              ;//1: 2 sub pu , 0 :1 sub pu 		

assign          state_intra_w       =   cu_slice_type_i  ==  `SLICE_TYPE_I     ;
assign          state_skip_w        =   cu_skip_flag_i                         ;
assign          state_merge_w       =   cu_merge_flag_i                        ;
assign          state_inter_tree_w  =   !(cu_merge_flag_i[0] && cu_part_size_i);
assign          state_tree_w        =   (state_intra_w||state_inter_tree_w)    ;

always @* begin 
    if(cu_slice_type_i)  // I frame 
        num_pu_flag_r    = (cu_depth_i==2'b11) ? cu_split_transform_i  : 1'b0   ;
    else // P frame 
        num_pu_flag_r    = (cu_part_size_i[0] ^ cu_part_size_i[1]   )           ;             
end 

//-----------------------------------------------------------------------------------------------------------------------------
//
//            a cnt to controller the output 
//
//-----------------------------------------------------------------------------------------------------------------------------


assign    rqt_root_cbf_w      = cu_cbf_y_i||cu_cbf_u_i||cu_cbf_v_i             ;
assign    cu_tree_done_flag_w = cu_tree_done_w || !(cu_slice_type_i || rqt_root_cbf_w) ;
  
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_cnt_r       <=        4'd0                                          ;
	else if(cu_start_i)
        cu_cnt_r       <=        4'd1                                          ;
	else if((cu_tree_done_flag_w || !state_tree_w)&&cu_cnt_r==4'd13)
	    cu_cnt_r      <=         4'd15                                         ;
    else if ( ((state_intra_w||state_skip_w )&& cu_cnt_r==4'd4 )||(state_merge_w&&cu_cnt_r==4'd5) )
        cu_cnt_r      <=         4'd12                                         ; // tree_start_r 
	else if( (num_pu_flag_r&&cu_cnt_r==4'd11)||(!num_pu_flag_r&&cu_cnt_r==4'd7) )
	    cu_cnt_r      <=         4'd12                                         ;
    else if(cu_cnt_r!=4'd13&&cu_cnt_r)                                                           
	    cu_cnt_r      <=        cu_cnt_r + 1'd1                               ; // tree out 
end 



//-----------------------------------------------------------------------------------------------------------------------------
//
//            wire signals declaration
//
//-----------------------------------------------------------------------------------------------------------------------------
//  signal declaration 
// CU_INTRA 
wire [10:0]                      ctx_pair_intra_0_w        ; 
wire [10:0]                      ctx_pair_intra_1_w        ;
wire [10:0]                      ctx_pair_intra_2_w        ;
wire [10:0]                      ctx_pair_intra_3_w        ;
wire [10:0]                      ctx_pair_intra_4_w        ;
wire [10:0]                      ctx_pair_intra_5_w        ;
wire [10:0]                      ctx_pair_intra_6_w        ;
wire [10:0]                      ctx_pair_intra_7_w        ;
wire [10:0]                      ctx_pair_intra_8_w        ;
wire [10:0]                      ctx_pair_intra_9_w        ;
wire [10:0]                      ctx_pair_intra_10_w       ;
wire [ 4:0]                      ctx_valid_num_intra_w     ;
// CU_SKIP
wire [10:0]                      ctx_pair_skip_w           ;
//pred_mode_flag
wire [10:0]                      ctx_pair_pred_mode_flag_w ;
//inter part_size 
reg  [10:0]                      ctx_pair_part_size_0_r    ; 
reg  [10:0]                      ctx_pair_part_size_1_r    ; 
reg  [10:0]                      ctx_pair_part_size_2_r    ; 

reg  [4:0]                       ctx_valid_num_inter_r     ;
// 4 groups :merge flag , merge idx or mvd  
// merge flag 
wire [10:0]                      ctx_pair_merge_flag_0_w   ;
wire [10:0]                      ctx_pair_merge_flag_1_w   ;
wire [10:0]                      ctx_pair_merge_flag_2_w   ;
wire [10:0]                      ctx_pair_merge_flag_3_w   ;

// merge idx 
wire [10:0]                      ctx_pair_merge_idx_00_w   ;                    
wire [10:0]                      ctx_pair_merge_idx_01_w   ;                    
wire [10:0]                      ctx_pair_merge_idx_10_w   ;                    
wire [10:0]                      ctx_pair_merge_idx_11_w   ;                    
wire [10:0]                      ctx_pair_merge_idx_20_w   ;                    
wire [10:0]                      ctx_pair_merge_idx_21_w   ;                    
wire [10:0]                      ctx_pair_merge_idx_30_w   ;                    
wire [10:0]                      ctx_pair_merge_idx_31_w   ;                    

// CU_MVD 
wire [10:0]                      ctx_pair_mv_0_0_w         ;
wire [10:0]                      ctx_pair_mv_0_1_w         ;
wire [10:0]                      ctx_pair_mv_0_2_w         ;
wire [10:0]                      ctx_pair_mv_0_3_w         ;
wire [10:0]                      ctx_pair_mv_0_4_w         ;
wire [10:0]                      ctx_pair_mv_0_5_w         ;
wire [10:0]                      ctx_pair_mv_0_6_w         ;
wire [10:0]                      ctx_pair_mv_0_7_w         ;
wire [10:0]                      ctx_pair_mv_0_8_w         ;
wire [10:0]                      ctx_pair_mv_0_9_w         ;
wire [10:0]                      ctx_pair_mv_0_10_w        ;
wire [10:0]                      ctx_pair_mv_0_11_w        ;
wire [10:0]                      ctx_pair_mv_0_12_w        ;
wire [10:0]                      ctx_pair_mv_0_13_w        ;
wire [10:0]                      ctx_pair_mv_0_14_w        ;

wire [10:0]                      ctx_pair_mv_1_0_w         ;
wire [10:0]                      ctx_pair_mv_1_1_w         ;
wire [10:0]                      ctx_pair_mv_1_2_w         ;
wire [10:0]                      ctx_pair_mv_1_3_w         ;
wire [10:0]                      ctx_pair_mv_1_4_w         ;
wire [10:0]                      ctx_pair_mv_1_5_w         ;
wire [10:0]                      ctx_pair_mv_1_6_w         ;
wire [10:0]                      ctx_pair_mv_1_7_w         ;
wire [10:0]                      ctx_pair_mv_1_8_w         ;
wire [10:0]                      ctx_pair_mv_1_9_w         ;
wire [10:0]                      ctx_pair_mv_1_10_w        ;
wire [10:0]                      ctx_pair_mv_1_11_w        ;
wire [10:0]                      ctx_pair_mv_1_12_w        ;
wire [10:0]                      ctx_pair_mv_1_13_w        ;
wire [10:0]                      ctx_pair_mv_1_14_w        ; 

// RQT_ROOT_CBF
reg  [10:0]                      ctx_pair_rqt_root_cbf_r   ;

// CU_TREE	
wire [10:0]                      ctx_pair_tree_0_w         ;
wire [10:0]                      ctx_pair_tree_1_w         ;
wire [10:0]                      ctx_pair_tree_2_w         ;
wire [10:0]                      ctx_pair_tree_3_w         ;
wire [2:0]                       ctx_valid_num_tree_w      ;

//-----------------------------------------------------------------------------------------------------------------------------
//
//               syntax  elements  binarization 
//
//-----------------------------------------------------------------------------------------------------------------------------

// ------------------------------------
// CU_INTRA 
cabac_cu_binari_intra  cu_binari_intra_u0(
                            // input 
                                .cu_depth_i              (cu_depth_i              ),
								.cu_sub_div_i            (cu_split_transform_i    ),
                                .cu_luma_pred_mode_i     (cu_luma_pred_mode_i     ),
                                .cu_chroma_pred_mode_i   (cu_chroma_pred_mode_i   ),
                                .cu_luma_pred_left_mode_i(cu_luma_pred_left_mode_i),
                                .cu_luma_pred_top_mode_i (cu_luma_pred_top_mode_i ),
							//  output	
								.ctx_pair_intra_0_o      (ctx_pair_intra_0_w      ),
								.ctx_pair_intra_1_o      (ctx_pair_intra_1_w      ),
								.ctx_pair_intra_2_o      (ctx_pair_intra_2_w      ),
								.ctx_pair_intra_3_o      (ctx_pair_intra_3_w      ),
								.ctx_pair_intra_4_o      (ctx_pair_intra_4_w      ),
								.ctx_pair_intra_5_o      (ctx_pair_intra_5_w      ),
								.ctx_pair_intra_6_o      (ctx_pair_intra_6_w      ),
								.ctx_pair_intra_7_o      (ctx_pair_intra_7_w      ),
								.ctx_pair_intra_8_o      (ctx_pair_intra_8_w      ),
								.ctx_pair_intra_9_o      (ctx_pair_intra_9_w      ),
								.ctx_pair_intra_10_o     (ctx_pair_intra_10_w     ),
								.ctx_valid_num_intra_o   (ctx_valid_num_intra_w   )								
                            ); 
   
// ------------------------------------
// CU_SKIP
wire [ 1:0]                      ctx_cu_skip_idx_w        ;
reg  [ 7:0]                      ctx_cu_skip_addr_r       ;

assign  ctx_cu_skip_idx_w   =    cu_skip_left_flag_i  +  cu_skip_top_flag_i ;

always @* begin 
    case(ctx_cu_skip_idx_w)
	    2'd0:  ctx_cu_skip_addr_r = {3'd0,5'd30};
		2'd1:  ctx_cu_skip_addr_r = {3'd3,5'd27};
        2'd2:  ctx_cu_skip_addr_r = {3'd2,5'd30};
     default:  ctx_cu_skip_addr_r = 8'd0        ;
	endcase
end 

// coding_mode:0:regular mode,1:invalid,2:bypass mode,3:terminal mode 
// regular:{2'b01, bin, bank_num,addr_idx} {2,1,3,5}  
// bypass :{2'b10,1resverd,bins_num,bin_string} {2,1resverd,3,5}
assign  ctx_pair_skip_w  =  {2'b00,cu_skip_flag_i,ctx_cu_skip_addr_r};

//-------------------------------------
//pred_mode_flag

assign ctx_pair_pred_mode_flag_w = {2'b00,cu_slice_type_i,3'd1,5'd29};

//-------------------------------------
//inter part_size 
always @* begin 
    case(cu_part_size_i) //0:2Nx2N 1:2NxN  2:Nx2N
        `PART_2NX2N:  ctx_pair_part_size_0_r = {2'b00,1'b1,3'd3,5'd26}; 
        `PART_2NXN :  ctx_pair_part_size_0_r = {2'b00,1'b0,3'd3,5'd26};
        `PART_NX2N :  ctx_pair_part_size_0_r = {2'b00,1'b0,3'd3,5'd26};
        `PART_SPLIT:  ctx_pair_part_size_0_r = {2'b01,1'b0,8'hff     };
    endcase 
end

always @* begin 
    case(cu_part_size_i)
        `PART_2NX2N:  ctx_pair_part_size_1_r = {2'b01,1'b1,8'hff     }; 
        `PART_2NXN :  ctx_pair_part_size_1_r = {2'b00,1'b1,3'd1,5'd30};
        `PART_NX2N :  ctx_pair_part_size_1_r = {2'b00,1'b0,3'd1,5'd30};
        `PART_SPLIT:  ctx_pair_part_size_1_r = {2'b01,1'b0,8'hff     };
    endcase  
end

always @* begin 
    if(cu_depth_i[1]&cu_depth_i[0]) begin // cu_depth_i=3 
        ctx_pair_part_size_2_r =	{2'b01,1'b1,8'hff     };
	end 
	else begin 
        case(cu_part_size_i)
            `PART_2NX2N:  ctx_pair_part_size_2_r = {2'b01,1'b1,8'hff     }; 
            `PART_2NXN :  ctx_pair_part_size_2_r = {2'b00,1'b1,3'd4,5'd18};
            `PART_NX2N :  ctx_pair_part_size_2_r = {2'b00,1'b1,3'd4,5'd18};
            `PART_SPLIT:  ctx_pair_part_size_2_r = {2'b01,1'b0,8'hff     };
        endcase 
    end 
end

always @* begin 
    case(cu_part_size_i)
        `PART_2NX2N:  ctx_valid_num_inter_r = 4'd3; 
        `PART_2NXN :  ctx_valid_num_inter_r = 4'd4;
        `PART_NX2N :  ctx_valid_num_inter_r = 4'd5;
        `PART_SPLIT:  ctx_valid_num_inter_r = 4'd2;
    endcase 
end

//------------------------------------
// merge flag 
assign   ctx_pair_merge_flag_0_w  = {2'b00,cu_merge_flag_i[0],3'd3,5'd29};
assign   ctx_pair_merge_flag_1_w  = {2'b00,cu_merge_flag_i[1],3'd3,5'd29};
assign   ctx_pair_merge_flag_2_w  = {2'b00,cu_merge_flag_i[2],3'd3,5'd29};
assign   ctx_pair_merge_flag_3_w  = {2'b00,cu_merge_flag_i[3],3'd3,5'd29};

//------------------------------------
// merge idx 
wire   [3:0]    merge_idx_0_w  =   cu_merge_idx_i[ 3:0 ]  ;
wire   [3:0]    merge_idx_1_w  =   cu_merge_idx_i[ 7:4 ]  ;
wire   [3:0]    merge_idx_2_w  =   cu_merge_idx_i[11:8 ]  ;
wire   [3:0]    merge_idx_3_w  =   cu_merge_idx_i[15:12]  ;

wire      merge_idx_symbol_0_w =   !(!(merge_idx_0_w))    ;
wire      merge_idx_symbol_1_w =   !(!(merge_idx_1_w))    ;
wire      merge_idx_symbol_2_w =   !(!(merge_idx_2_w))    ;
wire      merge_idx_symbol_3_w =   !(!(merge_idx_3_w))    ;

assign    ctx_pair_merge_idx_00_w  =  {2'b00,merge_idx_symbol_0_w,8'hff}                 ; // regular mode 
assign    ctx_pair_merge_idx_01_w  =  {2'b10,1'b0,3'd3,{2'b00,{3{merge_idx_symbol_0_w}}}}; // bypass mode 

assign    ctx_pair_merge_idx_10_w  =  {2'b00,merge_idx_symbol_1_w,8'hff}                 ; // regular mode
assign    ctx_pair_merge_idx_11_w  =  {2'b10,1'b0,3'd3,{2'b00,{3{merge_idx_symbol_1_w}}}}; // bypass mode 

assign    ctx_pair_merge_idx_20_w  =  {2'b00,merge_idx_symbol_2_w,8'hff}                 ; // regular mode
assign    ctx_pair_merge_idx_21_w  =  {2'b10,1'b0,3'd3,{2'b00,{3{merge_idx_symbol_2_w}}}}; // bypass mode 

assign    ctx_pair_merge_idx_30_w  =  {2'b00,merge_idx_symbol_3_w,8'hff}                 ; // regular mode
assign    ctx_pair_merge_idx_31_w  =  {2'b10,1'b0,3'd3,{2'b00,{3{merge_idx_symbol_3_w}}}}; // bypass mode 

// ------------------------------------
// CU_MVD 

cabac_cu_binari_mv   cu_binari_mv_u0(
                                    .cu_mv_data_i        (  cu_mv_data_i       ),
									.ctx_pair_mv_0_0_o   ( ctx_pair_mv_0_0_w   ),
									.ctx_pair_mv_0_1_o   ( ctx_pair_mv_0_1_w   ),
									.ctx_pair_mv_0_2_o   ( ctx_pair_mv_0_2_w   ),
									.ctx_pair_mv_0_3_o   ( ctx_pair_mv_0_3_w   ),
									.ctx_pair_mv_0_4_o   ( ctx_pair_mv_0_4_w   ),
									.ctx_pair_mv_0_5_o   ( ctx_pair_mv_0_5_w   ),
									.ctx_pair_mv_0_6_o   ( ctx_pair_mv_0_6_w   ),
									.ctx_pair_mv_0_7_o   ( ctx_pair_mv_0_7_w   ),
									.ctx_pair_mv_0_8_o   ( ctx_pair_mv_0_8_w   ),
									.ctx_pair_mv_0_9_o   ( ctx_pair_mv_0_9_w   ),
									.ctx_pair_mv_0_10_o  ( ctx_pair_mv_0_10_w  ),
									.ctx_pair_mv_0_11_o  ( ctx_pair_mv_0_11_w  ),
									.ctx_pair_mv_0_12_o  ( ctx_pair_mv_0_12_w  ),
									.ctx_pair_mv_0_13_o  ( ctx_pair_mv_0_13_w  ),
									.ctx_pair_mv_0_14_o  ( ctx_pair_mv_0_14_w  ),

									.ctx_pair_mv_1_0_o   ( ctx_pair_mv_1_0_w   ),
									.ctx_pair_mv_1_1_o   ( ctx_pair_mv_1_1_w   ),
									.ctx_pair_mv_1_2_o   ( ctx_pair_mv_1_2_w   ),
									.ctx_pair_mv_1_3_o   ( ctx_pair_mv_1_3_w   ),
									.ctx_pair_mv_1_4_o   ( ctx_pair_mv_1_4_w   ),
									.ctx_pair_mv_1_5_o   ( ctx_pair_mv_1_5_w   ),
									.ctx_pair_mv_1_6_o   ( ctx_pair_mv_1_6_w   ),
									.ctx_pair_mv_1_7_o   ( ctx_pair_mv_1_7_w   ),
									.ctx_pair_mv_1_8_o   ( ctx_pair_mv_1_8_w   ),
									.ctx_pair_mv_1_9_o   ( ctx_pair_mv_1_9_w   ),
									.ctx_pair_mv_1_10_o  ( ctx_pair_mv_1_10_w  ),
									.ctx_pair_mv_1_11_o  ( ctx_pair_mv_1_11_w  ),
									.ctx_pair_mv_1_12_o  ( ctx_pair_mv_1_12_w  ),
									.ctx_pair_mv_1_13_o  ( ctx_pair_mv_1_13_w  ),
									.ctx_pair_mv_1_14_o  ( ctx_pair_mv_1_14_w  )
				                );

//-------------------------------------								
//  RQT_ROOT_CBF							
always @* begin 
    if(state_inter_tree_w) 
	    ctx_pair_rqt_root_cbf_r =      {2'b00,rqt_root_cbf_w,3'd3,5'd0}        ;
	else 
	    ctx_pair_rqt_root_cbf_r =      {2'b01,1'b0,8'hff}                      ;
end 
	
// -----------------------------------
// CU_TREE	
//assign    tree_start_r  =  cu_curr_state_r == CU_TREE &&(cu_slice_type_i || rqt_root_cbf_w);
//assign    tree_start_w  =  cu_start_i&&(cu_slice_type_i || rqt_root_cbf_w); 
//wire      tree_start_w  =  cu_curr_state_r == CU_TREE &&(cu_slice_type_i || rqt_root_cbf_w);

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        tree_start_r   <=   1'b0                                               ;
	else if( (cu_cnt_r==4'd12)&&(cu_slice_type_i || rqt_root_cbf_w))            // intra ||(inter && rqt_root_cbf_w)
        tree_start_r   <=   1'b1                                               ;
    else if(tree_start_r)
        tree_start_r   <=   1'b0                                               ;
end 

cabac_cu_binari_tree   cu_binari_tree_u0(
                   .clk                          ( clk                        ),
                   .rst_n                        ( rst_n                      ),
                   .cu_idx_i                     ( cu_idx_i                   ),
				   .tree_start_i                 ( tree_start_r               ),
                   .cu_depth_i                   ( cu_depth_i                 ),
                   .cu_split_transform_i         ( cu_split_transform_i       ),
                   .cu_slice_type_i              ( cu_slice_type_i            ),
                   .cu_qp_i                      ( cu_qp_i                    ),
                   .cu_qp_last_i                 ( cu_qp_last_i               ),
				   .cu_cbf_y_i                   ( cu_cbf_y_i                 ),             
				   .cu_cbf_u_i                   ( cu_cbf_u_i                 ),
				   .cu_cbf_v_i                   ( cu_cbf_v_i                 ),
                   .tq_rdata_i                   ( tq_rdata_i                 ),
				   .cu_luma_pred_mode_i          ( cu_luma_pred_mode_i        ),
				   .cu_chroma_pred_mode_i        ( cu_chroma_pred_mode_i      ),
				   .cu_qp_nocoded_i              ( cu_qp_nocoded_i            ),
 
                   .cu_tree_done_o               ( cu_tree_done_w             ),
				   .coeff_type_o                 ( coeff_type_w               ),
                   .tq_ren_o	                 ( tq_ren_o                   ),
                   .tq_raddr_o	                 ( tq_raddr_o                 ),
				   .cu_qp_coded_flag_o           ( cu_qp_coded_flag_o         ),
				   .ctx_pair_tree_0_o            ( ctx_pair_tree_0_w          ),
				   .ctx_pair_tree_1_o            ( ctx_pair_tree_1_w          ),
				   .ctx_pair_tree_2_o            ( ctx_pair_tree_2_w          ),
				   .ctx_pair_tree_3_o            ( ctx_pair_tree_3_w          ),
				   .ctx_valid_num_tree_o         ( ctx_valid_num_tree_w       )
				);
//-----------------------------------------------------------------------------------------------------------------------------
//
//               output signals 
//
//-----------------------------------------------------------------------------------------------------------------------------

reg     [10:0]                      ctx_pair_bism_0_r		                   ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_1_r		                   ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_2_r		                   ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_3_r		                   ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_4_r		                   ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_5_r                          ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_6_r                          ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_7_r                          ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_8_r                          ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_9_r                          ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_10_r                         ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_11_r                         ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_12_r                         ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_13_r                         ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_14_r                         ; // binarization intra&skip&merge 
reg     [10:0]                      ctx_pair_bism_15_r                         ; // binarization intra&skip&merge 
reg     [ 2:0]                      ctx_pair_bism_valid_0_num_r                ; // binarization intra&skip&merge 
reg     [ 2:0]                      ctx_pair_bism_valid_1_num_r                ; // binarization intra&skip&merge 
reg     [ 2:0]                      ctx_pair_bism_valid_2_num_r                ; // binarization intra&skip&merge 
reg     [ 2:0]                      ctx_pair_bism_valid_3_num_r                ; // binarization intra&skip&merge 

always @* begin 
    if(state_intra_w) begin 
        ctx_pair_bism_0_r		    =    ctx_pair_intra_0_w                    ;
		ctx_pair_bism_1_r		    =    ctx_pair_intra_1_w                    ; 
		ctx_pair_bism_2_r		    =    {2'b01,1'b0,8'hff}                    ;
		ctx_pair_bism_3_r		    =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_valid_0_num_r =    3'd2                                  ;
		
        ctx_pair_bism_4_r		    =    ctx_pair_intra_2_w                    ;
        ctx_pair_bism_5_r		    =    ctx_pair_intra_3_w                    ;
        ctx_pair_bism_6_r		    =    ctx_pair_intra_4_w                    ;
		ctx_pair_bism_7_r		    =    {2'b01,1'b0,8'hff}                    ;
        ctx_pair_bism_valid_1_num_r =    3'd3                                  ;  
		
        ctx_pair_bism_8_r		    =    ctx_pair_intra_5_w                    ;
        ctx_pair_bism_9_r           =    ctx_pair_intra_6_w                    ;
        ctx_pair_bism_10_r          =    ctx_pair_intra_7_w                    ;
        ctx_pair_bism_11_r          =    ctx_pair_intra_8_w                    ;
		ctx_pair_bism_valid_2_num_r =    num_pu_flag_r ? 3'd4 : 3'd0           ; 
		
        ctx_pair_bism_12_r          =    ctx_pair_intra_9_w                    ;
        ctx_pair_bism_13_r          =    ctx_pair_intra_10_w                   ;
        ctx_pair_bism_14_r          =    {2'b01,1'b0,8'hff}                    ;
        ctx_pair_bism_15_r          =    {2'b01,1'b0,8'hff}                    ;
        ctx_pair_bism_valid_3_num_r   =   num_pu_flag_r ? 3'd2 : 3'd0          ;
		
	end 
	else if(state_skip_w) begin 
        ctx_pair_bism_0_r		    =    ctx_pair_skip_w                       ; // skip flag 
	    ctx_pair_bism_1_r           =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_2_r           =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_3_r           =    {2'b01,1'b0,8'hff}                    ;
		ctx_pair_bism_valid_0_num_r =    3'd1                                  ;
		
	    ctx_pair_bism_4_r		    =    ctx_pair_merge_idx_00_w               ; // merge_idx
	    ctx_pair_bism_5_r		    =    ctx_pair_merge_idx_01_w               ;
	    ctx_pair_bism_6_r		    =    ctx_pair_merge_idx_10_w               ; // merge_idx 
	    ctx_pair_bism_7_r		    =    ctx_pair_merge_idx_11_w               ;
		ctx_pair_bism_valid_1_num_r =    num_pu_flag_r ? 3'd4 : 3'd2           ;
		
	    ctx_pair_bism_8_r           =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_9_r           =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_10_r          =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_11_r          =    {2'b01,1'b0,8'hff}                    ;
		ctx_pair_bism_valid_2_num_r =    3'd0                                  ;
		
	    ctx_pair_bism_12_r          =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_13_r          =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_14_r          =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_15_r          =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_valid_3_num_r =    3'd0                                  ;
    end 
	else if(state_merge_w) begin 
	    ctx_pair_bism_0_r		    =    ctx_pair_skip_w                       ;
	    ctx_pair_bism_1_r           =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_2_r           =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_3_r           =    {2'b01,1'b0,8'hff}                    ;
		ctx_pair_bism_valid_0_num_r =    3'd1                                  ;
		
	    ctx_pair_bism_4_r		    =    ctx_pair_pred_mode_flag_w             ;
	    ctx_pair_bism_5_r           =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_6_r           =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_7_r           =    {2'b01,1'b0,8'hff}                    ;
		ctx_pair_bism_valid_1_num_r =    3'd1                                  ;		
		
		
	    ctx_pair_bism_8_r		    =    ctx_pair_part_size_0_r                ;
	    ctx_pair_bism_9_r		    =    ctx_pair_part_size_1_r                ;
	    ctx_pair_bism_10_r		    =    ctx_pair_part_size_2_r                ;
	    ctx_pair_bism_11_r          =    {2'b01,1'b0,8'hff}                    ;
		ctx_pair_bism_valid_2_num_r =    3'd3                                  ;			
		
	    ctx_pair_bism_12_r          =    ctx_pair_merge_flag_0_w               ;
	    ctx_pair_bism_13_r          =    ctx_pair_merge_idx_00_w               ;
	    ctx_pair_bism_14_r          =    ctx_pair_merge_idx_01_w               ;
	    ctx_pair_bism_15_r          =    {2'b01,1'b0,8'hff}                    ;
		ctx_pair_bism_valid_3_num_r =    3'd3                                  ;
		

	end 
	else begin
	    ctx_pair_bism_0_r		    =    ctx_pair_skip_w                       ;
	    ctx_pair_bism_1_r           =    ctx_pair_pred_mode_flag_w             ;
	    ctx_pair_bism_2_r           =    {2'b01,1'b0,8'hff}                    ;
	    ctx_pair_bism_3_r           =    {2'b01,1'b0,8'hff}                    ;
		ctx_pair_bism_valid_0_num_r =    3'd2                                  ;
		
	    ctx_pair_bism_4_r		    =    ctx_pair_part_size_0_r                ;
	    ctx_pair_bism_5_r           =    ctx_pair_part_size_1_r                ;
	    ctx_pair_bism_6_r           =    ctx_pair_part_size_2_r                ;
	    ctx_pair_bism_7_r           =    {2'b01,1'b0,8'hff}                    ;
		ctx_pair_bism_valid_1_num_r =    3'd3                                  ;		
		
		
	    ctx_pair_bism_8_r		    =   ctx_pair_merge_flag_0_w                ;
	    ctx_pair_bism_9_r		    =   ctx_pair_mv_0_0_w                      ;
	    ctx_pair_bism_10_r		    =   {2'b01,1'b0,8'hff}                     ;
	    ctx_pair_bism_11_r          =   {2'b01,1'b0,8'hff}                     ;
		ctx_pair_bism_valid_2_num_r =   3'd2                                   ;
		
        ctx_pair_bism_12_r          = 	ctx_pair_mv_0_1_w                      ;
        ctx_pair_bism_13_r          = 	ctx_pair_mv_0_2_w                      ;
        ctx_pair_bism_14_r          = 	ctx_pair_mv_0_3_w                      ;
        ctx_pair_bism_15_r          = 	ctx_pair_mv_0_4_w                      ;
		ctx_pair_bism_valid_3_num_r =   3'd4                                   ;		
		
	end 
end 

assign cu_done_o             =  cu_cnt_r==4'd15                                ; 
assign coeff_type_o          =  coeff_type_w                                   ; 

always @(posedge clk or negedge rst_n)begin 
    if(!rst_n) begin 
        cu_binary_pair_0_o		   <=  {2'b01,1'b0,8'hff}                      ;  
        cu_binary_pair_1_o		   <=  {2'b01,1'b0,8'hff}                      ;
        cu_binary_pair_2_o		   <=  {2'b01,1'b0,8'hff}                      ;
        cu_binary_pair_3_o		   <=  {2'b01,1'b0,8'hff}                      ;
        cu_binary_pair_valid_num_o <=  3'd0                                    ;    
    end 
    else begin 
        case(cu_cnt_r)
            4'd1: begin 
                cu_binary_pair_0_o		   <=  ctx_pair_bism_0_r	           ;    
                cu_binary_pair_1_o		   <=  ctx_pair_bism_1_r		       ;  
                cu_binary_pair_2_o		   <=  ctx_pair_bism_2_r		       ;  
                cu_binary_pair_3_o		   <=  ctx_pair_bism_3_r		       ;  
                cu_binary_pair_valid_num_o <=  ctx_pair_bism_valid_0_num_r     ;
            end 
			4'd2: begin
			    cu_binary_pair_0_o		   <=  ctx_pair_bism_4_r	           ;    
                cu_binary_pair_1_o		   <=  ctx_pair_bism_5_r		       ;  
                cu_binary_pair_2_o		   <=  ctx_pair_bism_6_r		       ;  
                cu_binary_pair_3_o		   <=  ctx_pair_bism_7_r		       ;  
                cu_binary_pair_valid_num_o <=  ctx_pair_bism_valid_1_num_r     ;
			end 
			4'd3: begin
			    cu_binary_pair_0_o		   <=  ctx_pair_bism_8_r	           ;    
                cu_binary_pair_1_o		   <=  ctx_pair_bism_9_r		       ;  
                cu_binary_pair_2_o		   <=  ctx_pair_bism_10_r		       ;  
                cu_binary_pair_3_o		   <=  ctx_pair_bism_11_r		       ;  
                cu_binary_pair_valid_num_o <=  ctx_pair_bism_valid_2_num_r     ;
			end 
			4'd4: begin
			    cu_binary_pair_0_o		   <=  ctx_pair_bism_12_r	           ;    
                cu_binary_pair_1_o		   <=  ctx_pair_bism_13_r		       ;  
                cu_binary_pair_2_o		   <=  ctx_pair_bism_14_r		       ;  
                cu_binary_pair_3_o		   <=  ctx_pair_bism_15_r		       ;  
                cu_binary_pair_valid_num_o <=  ctx_pair_bism_valid_3_num_r     ;
			end 
			4'd5: begin
			    cu_binary_pair_0_o		   <=  state_merge_w ? ctx_pair_merge_flag_0_w  : ctx_pair_mv_0_5_w;    
                cu_binary_pair_1_o		   <=  state_merge_w ? ctx_pair_merge_idx_10_w  : ctx_pair_mv_0_6_w;  
                cu_binary_pair_2_o		   <=  state_merge_w ? ctx_pair_merge_idx_11_w  : ctx_pair_mv_0_7_w;  
                cu_binary_pair_3_o		   <=  state_merge_w ? {2'b01,1'b0,8'hff}       : ctx_pair_mv_0_8_w;  
                cu_binary_pair_valid_num_o <=  state_merge_w ? (num_pu_flag_r?3'd3:3'd0): 5'd4             ;
			end 
			4'd6: begin
			    cu_binary_pair_0_o		   <=  ctx_pair_mv_0_9_w              ;    
                cu_binary_pair_1_o		   <=  ctx_pair_mv_0_10_w             ;  
                cu_binary_pair_2_o		   <=  ctx_pair_mv_0_11_w             ;  
                cu_binary_pair_3_o		   <=  ctx_pair_mv_0_12_w             ;  
                cu_binary_pair_valid_num_o <=  3'd4                           ;
			end 
			4'd7: begin
			    cu_binary_pair_0_o		   <=  ctx_pair_mv_0_13_w             ;    
                cu_binary_pair_1_o		   <=  ctx_pair_mv_0_14_w             ;  
                cu_binary_pair_2_o		   <=  num_pu_flag_r ? ctx_pair_merge_flag_0_w  :  ctx_pair_rqt_root_cbf_r     ;  
                cu_binary_pair_3_o		   <=  {2'b01,1'b0,8'hff}             ;  
                cu_binary_pair_valid_num_o <=  3'd3                           ;
			end 
			4'd8: begin 
			    cu_binary_pair_0_o		   <=  ctx_pair_mv_1_0_w              ;
			    cu_binary_pair_1_o		   <=  ctx_pair_mv_1_1_w              ;
			    cu_binary_pair_2_o		   <=  ctx_pair_mv_1_2_w              ;
			    cu_binary_pair_3_o		   <=  ctx_pair_mv_1_3_w              ;
				cu_binary_pair_valid_num_o <=  3'd4                           ;
			end 
			4'd9: begin 
			    cu_binary_pair_0_o		   <=  ctx_pair_mv_1_4_w              ;
			    cu_binary_pair_1_o         <=  ctx_pair_mv_1_5_w              ;
			    cu_binary_pair_2_o         <=  ctx_pair_mv_1_6_w              ;
			    cu_binary_pair_3_o         <=  ctx_pair_mv_1_7_w              ;
				cu_binary_pair_valid_num_o <=  3'd4                           ;
			end 
			4'd10:begin 
			    cu_binary_pair_0_o         <=  ctx_pair_mv_1_8_w              ;
			    cu_binary_pair_1_o         <=  ctx_pair_mv_1_9_w              ;
			    cu_binary_pair_2_o         <=  ctx_pair_mv_1_10_w             ;
			    cu_binary_pair_3_o         <=  ctx_pair_mv_1_11_w             ;
				cu_binary_pair_valid_num_o <=  3'd4                           ;
			end 
			4'd11:begin 
			    cu_binary_pair_0_o         <=  ctx_pair_mv_1_12_w             ;
			    cu_binary_pair_1_o         <=  ctx_pair_mv_1_13_w             ;
			    cu_binary_pair_2_o         <=  ctx_pair_mv_1_14_w             ;
			    cu_binary_pair_3_o         <=  ctx_pair_rqt_root_cbf_r        ;
			    cu_binary_pair_valid_num_o <=  num_pu_flag_r ? 3'd4 : 3'd3    ;
			end 
			4'd13:begin 
			    cu_binary_pair_0_o		   <=  ctx_pair_tree_0_w              ;
			    cu_binary_pair_1_o		   <=  ctx_pair_tree_1_w              ;
			    cu_binary_pair_2_o		   <=  ctx_pair_tree_2_w              ;
			    cu_binary_pair_3_o		   <=  ctx_pair_tree_3_w              ;
			    cu_binary_pair_valid_num_o <=  ctx_valid_num_tree_w           ;
			end 
		 default:begin 
		        cu_binary_pair_0_o		   <=   {2'b01,1'b0,8'hff}            ;
		        cu_binary_pair_1_o		   <=   {2'b01,1'b0,8'hff}            ;
		        cu_binary_pair_2_o		   <=   {2'b01,1'b0,8'hff}            ;
		        cu_binary_pair_3_o		   <=   {2'b01,1'b0,8'hff}            ;
		        cu_binary_pair_valid_num_o <=   3'd0                          ;
		    end 		 
		endcase
    end 
end 

endmodule 





