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
// Filename       : cabac_binari_4x4_coeff.v
// Author         : chewein
// Created        : 2014-10-15
// Description    : binarization a 4x4 block coeff 
//-----------------------------------------------------------------------------------------------------------------------------
`include"enc_defines.v" 

module cabac_binari_4x4_coeff(
                                clk                        ,
                                rst_n                      ,
								last_4x4_block_flag_i      ,
								first_4x4_block_flag_i     ,
								pattern_sig_ctx_i          ,								
                                coeff_enable_i             ,
                                coeff_type_i               ,
                                cu_slice_type_i            ,
								coeff_data_vaid_i          ,
                                coeff_data_i               ,
                                tu_depth_i                 ,
                                scan_idx_i                 ,
                                pos_prefix_x_i             ,
                                pos_prefix_y_i             ,
								c1_inner_i                 ,
								coeff_cnt_i                ,
								
                                ctx_pair_coeff_0_o         ,
                                ctx_pair_coeff_1_o         ,
                                ctx_pair_coeff_2_o         ,
                                ctx_pair_coeff_3_o         ,
								ctx_pair_valid_num_o       ,
								c1_inner_o                 ,
								coeff_4x4_done_o          
                            );
//-----------------------------------------------------------------------------------------------------------------------------
//
//               input and output signals declaration 
//
//-----------------------------------------------------------------------------------------------------------------------------
input                                  clk                                     ;
input                                  rst_n                                   ;
input                                  last_4x4_block_flag_i                   ;
input                                  first_4x4_block_flag_i                  ;
input    [  1:0 ]                      pattern_sig_ctx_i                       ;
input                                  coeff_enable_i                          ;                
input    [  1:0 ]                      coeff_type_i                            ; // 2:luma , 1 : chroma u ,0 : chroma v
input                                  cu_slice_type_i                         ; // 1: I   , 0 : P/B  
input                                  coeff_data_vaid_i                       ;
input    [255:0 ]                      coeff_data_i                            ;
input    [ 1 :0 ]                      tu_depth_i                              ;
input    [ 1 :0 ]                      scan_idx_i                              ;
input    [ 2 :0 ]                      pos_prefix_x_i                          ; // coeff_cnt_i = 5'd2 
input    [ 2 :0 ]                      pos_prefix_y_i                          ; // coeff_cnt_i = 5'd2 
input    [ 1 :0 ]                      c1_inner_i                              ;
input    [ 4 :0 ]                      coeff_cnt_i                             ;           

output   [ 10:0 ]                      ctx_pair_coeff_0_o                      ;
output   [ 10:0 ]                      ctx_pair_coeff_1_o                      ;
output   [ 10:0 ]                      ctx_pair_coeff_2_o                      ;
output   [ 10:0 ]                      ctx_pair_coeff_3_o                      ;
output   [ 2:0  ]                      ctx_pair_valid_num_o                    ;
output   [ 1:0  ]                      c1_inner_o                              ;
output                                 coeff_4x4_done_o                        ;

reg      [ 10:0 ]                      ctx_pair_coeff_0_o                      ;
reg      [ 10:0 ]                      ctx_pair_coeff_1_o                      ;
reg      [ 10:0 ]                      ctx_pair_coeff_2_o                      ;
reg      [ 10:0 ]                      ctx_pair_coeff_3_o                      ;
reg      [  2:0 ]                      ctx_pair_valid_num_o                    ;
//-----------------------------------------------------------------------------------------------------------------------------
//
//               binarization results  
//
//-----------------------------------------------------------------------------------------------------------------------------
reg      [ 10:0 ]                      ctx_pair_scf_0_r                        ;
reg      [ 10:0 ]                      ctx_pair_scf_1_r                        ;

wire     [ 10:0 ]                      ctx_pair_coeff_gt1_0_w                  ;
wire     [ 10:0 ]                      ctx_pair_coeff_gt1_1_w                  ;
wire     [ 10:0 ]                      ctx_pair_coeff_gt1_2_w                  ;
wire     [ 10:0 ]                      ctx_pair_coeff_gt1_3_w                  ;
wire     [ 10:0 ]                      ctx_pair_coeff_gt1_4_w                  ;
wire     [ 10:0 ]                      ctx_pair_coeff_gt1_5_w                  ;
wire     [ 10:0 ]                      ctx_pair_coeff_gt1_6_w                  ;
wire     [ 10:0 ]                      ctx_pair_coeff_gt1_7_w                  ;

reg      [ 10:0 ]                      ctx_pair_coeff_gt2_r                    ;

reg      [ 10:0 ]                      ctx_pair_coeff_signs_0_r                ;
reg      [ 10:0 ]                      ctx_pair_coeff_signs_1_r                ;
reg      [ 10:0 ]                      ctx_pair_coeff_signs_2_r                ;
reg      [ 10:0 ]                      ctx_pair_coeff_signs_3_r                ;

wire     [ 10:0 ]                      ctx_pair_cre_0_w                        ; // coeff_remain_exgolomb 
wire     [ 10:0 ]                      ctx_pair_cre_1_w                        ; // coeff_remain_exgolomb 
wire     [ 10:0 ]                      ctx_pair_cre_2_w                        ; // coeff_remain_exgolomb 
wire     [ 10:0 ]                      ctx_pair_cre_3_w                        ; // coeff_remain_exgolomb 

//-----------------------------------------------------------------------------------------------------------------------------
//
//               sig_coeff_flag 
//
//-----------------------------------------------------------------------------------------------------------------------------
reg      [255:0 ]       coeff_data_r                                           ; // coeff_cnt_i > 1 : data valid 

wire  signed  [15:0 ]   coeff_0_w  , coeff_1_w  , coeff_2_w  , coeff_3_w       ; // according to the scan order  
wire  signed  [15:0 ]   coeff_4_w  , coeff_5_w  , coeff_6_w  , coeff_7_w       ; // according to the scan order 
wire  signed  [15:0 ]   coeff_8_w  , coeff_9_w  , coeff_10_w , coeff_11_w      ; // according to the scan order 
wire  signed  [15:0 ]   coeff_12_w , coeff_13_w , coeff_14_w , coeff_15_w      ; // according to the scan order

// coeff_data_r
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
	    coeff_data_r   <=  256'd0                                              ;
    else if(!coeff_data_vaid_i)  
	    coeff_data_r   <=  coeff_data_i                                         ;
end

assign {coeff_0_w  , coeff_1_w  , coeff_2_w  , coeff_3_w } = {coeff_data_r[255:192]}; 
assign {coeff_4_w  , coeff_5_w  , coeff_6_w  , coeff_7_w } = {coeff_data_r[191:128]}; 
assign {coeff_8_w  , coeff_9_w  , coeff_10_w , coeff_11_w} = {coeff_data_r[127: 64]}; 
assign {coeff_12_w , coeff_13_w , coeff_14_w , coeff_15_w} = {coeff_data_r[ 63:  0]}; 

//-----------------------------------------------------------------------------------------------------------------------------
//
//               sig_coeff_flag : 4 cycles , binarization coeff_cnt_i = 5'd3 , 5'd4 , 5'd5 , 5'd6 
//                                           output       coeff_cnt_i = 5'd3 , 5'd4 , 5'd5 , 5'd6 
//-----------------------------------------------------------------------------------------------------------------------------
reg      [  7:0 ]       pos_x_suffix_x_0_r     , pos_x_suffix_x_1_r            ; 
reg      [  7:0 ]       pos_x_suffix_x_2_r     , pos_x_suffix_x_3_r            ; 

reg      [  7:0 ]       pos_x_suffix_y_0_r     , pos_x_suffix_y_1_r            ; 
reg      [  7:0 ]       pos_x_suffix_y_2_r     , pos_x_suffix_y_3_r            ; 


reg      [  4:0 ]       pos_x_0_r              , pos_x_1_r                     ;
reg      [  4:0 ]       pos_y_0_r              , pos_y_1_r                     ;

wire     [  7:0 ]       ctx_pair_scf_addr_0_w  , ctx_pair_scf_addr_1_w         ;   

reg                     non_zero_0_flag_r      , non_zero_1_flag_r             ;

reg      [  1:0 ]       ctx_pair_scf_bins_r                                    ;
  
always @* begin 
    case(scan_idx_i)
        `SCAN_DIAG : begin 
            pos_x_suffix_x_0_r  =   8'b00_00_01_00;
            pos_x_suffix_x_1_r  =   8'b01_10_00_01;
            pos_x_suffix_x_2_r  =   8'b10_11_01_10;
            pos_x_suffix_x_3_r  =   8'b11_10_11_11;
            pos_x_suffix_y_0_r  =   8'b00_01_00_10;
            pos_x_suffix_y_1_r  =   8'b01_00_11_10;
            pos_x_suffix_y_2_r  =   8'b01_00_11_10;
            pos_x_suffix_y_3_r  =   8'b01_11_10_11;			
        end 
		`SCAN_HOR  : begin 
            pos_x_suffix_x_0_r  =   8'b00_01_10_11;
            pos_x_suffix_x_1_r  =   8'b00_01_10_11;
            pos_x_suffix_x_2_r  =   8'b00_01_10_11;
            pos_x_suffix_x_3_r  =   8'b00_01_10_11;
            pos_x_suffix_y_0_r  =   8'b00_00_00_00;
            pos_x_suffix_y_1_r  =   8'b01_01_01_01;
            pos_x_suffix_y_2_r  =   8'b10_10_10_10;
            pos_x_suffix_y_3_r  =   8'b11_11_11_11;
        end 
		`SCAN_VER  : begin 
            pos_x_suffix_x_0_r  =   8'b00_00_00_00;
            pos_x_suffix_x_1_r  =   8'b01_01_01_01;
            pos_x_suffix_x_2_r  =   8'b10_10_10_10;
            pos_x_suffix_x_3_r  =   8'b11_11_11_11;
            pos_x_suffix_y_0_r  =   8'b00_01_10_11;
            pos_x_suffix_y_1_r  =   8'b00_01_10_11;
            pos_x_suffix_y_2_r  =   8'b00_01_10_11;
            pos_x_suffix_y_3_r  =   8'b00_01_10_11;			
		end
		default  : begin 
            pos_x_suffix_x_0_r  =   8'b00_00_00_00;
            pos_x_suffix_x_1_r  =   8'b00_00_00_00;
            pos_x_suffix_x_2_r  =   8'b00_00_00_00;
            pos_x_suffix_x_3_r  =   8'b00_00_00_00;
            pos_x_suffix_y_0_r  =   8'b00_00_00_00;
            pos_x_suffix_y_1_r  =   8'b00_00_00_00;
            pos_x_suffix_y_2_r  =   8'b00_00_00_00;
            pos_x_suffix_y_3_r  =   8'b00_00_00_00;				
		end  
	endcase 
end 

// 
always @* begin 	
    case(coeff_cnt_i[3:0])
        4'd2: begin 
            pos_x_0_r  =  { pos_prefix_x_i , pos_x_suffix_x_3_r[1:0] }    ;   
			pos_x_1_r  =  { pos_prefix_x_i , pos_x_suffix_x_3_r[3:2] }    ; 
            pos_y_0_r  =  { pos_prefix_y_i , pos_x_suffix_y_3_r[1:0] }    ; 
			pos_y_1_r  =  { pos_prefix_y_i , pos_x_suffix_y_3_r[3:2] }    ; 

        end 
		4'd3:begin 
		    pos_x_0_r  =  { pos_prefix_x_i , pos_x_suffix_x_3_r[5:4] }    ;  
			pos_x_1_r  =  { pos_prefix_x_i , pos_x_suffix_x_3_r[7:6] }    ; 
            pos_y_0_r  =  { pos_prefix_y_i , pos_x_suffix_y_3_r[5:4] }    ; 
			pos_y_1_r  =  { pos_prefix_y_i , pos_x_suffix_y_3_r[7:6] }    ; 		
		end 
        4'd4: begin 
            pos_x_0_r  =  { pos_prefix_x_i , pos_x_suffix_x_2_r[1:0] }    ;   
			pos_x_1_r  =  { pos_prefix_x_i , pos_x_suffix_x_2_r[3:2] }    ; 
            pos_y_0_r  =  { pos_prefix_y_i , pos_x_suffix_y_2_r[1:0] }    ; 
			pos_y_1_r  =  { pos_prefix_y_i , pos_x_suffix_y_2_r[3:2] }    ; 

        end 
		4'd5:begin 
		    pos_x_0_r  =  { pos_prefix_x_i , pos_x_suffix_x_2_r[5:4] }    ;  
			pos_x_1_r  =  { pos_prefix_x_i , pos_x_suffix_x_2_r[7:6] }    ; 		
            pos_y_0_r  =  { pos_prefix_y_i , pos_x_suffix_y_2_r[5:4] }    ; 
			pos_y_1_r  =  { pos_prefix_y_i , pos_x_suffix_y_2_r[7:6] }    ; 		
		end 
        4'd6: begin 
            pos_x_0_r  =  { pos_prefix_x_i , pos_x_suffix_x_1_r[1:0] }    ;   
			pos_x_1_r  =  { pos_prefix_x_i , pos_x_suffix_x_1_r[3:2] }    ; 
            pos_y_0_r  =  { pos_prefix_y_i , pos_x_suffix_y_1_r[1:0] }    ; 
			pos_y_1_r  =  { pos_prefix_y_i , pos_x_suffix_y_1_r[3:2] }    ; 
        end 
		4'd7:begin 
		    pos_x_0_r  =  { pos_prefix_x_i , pos_x_suffix_x_1_r[5:4] }    ;  
			pos_x_1_r  =  { pos_prefix_x_i , pos_x_suffix_x_1_r[7:6] }    ;  		
            pos_y_0_r  =  { pos_prefix_y_i , pos_x_suffix_y_1_r[5:4] }    ; 
			pos_y_1_r  =  { pos_prefix_y_i , pos_x_suffix_y_1_r[7:6] }    ; 	
		end 
        4'd8: begin 
            pos_x_0_r  =  { pos_prefix_x_i , pos_x_suffix_x_0_r[1:0] }    ;   
			pos_x_1_r  =  { pos_prefix_x_i , pos_x_suffix_x_0_r[3:2] }    ; 
            pos_y_0_r  =  { pos_prefix_y_i , pos_x_suffix_y_0_r[1:0] }    ; 
			pos_y_1_r  =  { pos_prefix_y_i , pos_x_suffix_y_0_r[3:2] }    ; 
		end 
		4'd9: begin 
		    pos_x_0_r  =  { pos_prefix_x_i , pos_x_suffix_x_0_r[5:4] }    ;  
			pos_x_1_r  =  { pos_prefix_x_i , pos_x_suffix_x_0_r[7:6] }    ; 		
            pos_y_0_r  =  { pos_prefix_y_i , pos_x_suffix_y_0_r[5:4] }    ; 
			pos_y_1_r  =  { pos_prefix_y_i , pos_x_suffix_y_0_r[7:6] }    ; 		
		end 
        default: begin 
            pos_x_0_r  =  4'd0    ;   
			pos_x_1_r  =  4'd0    ;   
            pos_y_0_r  =  4'd0    ; 
			pos_y_1_r  =  4'd0    ;   
        end                 
    endcase 
end 

// ctx_pair_scf_addr_0_w
cabac_binari_get_sig_ctx  cabac_binari_get_sig_ctx_u0
                (
                    .pattern_sig_ctx_i          ( pattern_sig_ctx_i           ),
                    .scan_idx_i                 ( scan_idx_i                  ),
                    .pos_x_i                    ( pos_x_0_r                   ),
                    .pos_y_i                    ( pos_y_0_r                   ),
                    .tu_depth_i                 ( tu_depth_i                  ),
                    .coeff_type_i               ( coeff_type_i                ),
                    .ctx_pair_scf_addr_o        ( ctx_pair_scf_addr_0_w       )
			    );

// ctx_pair_scf_addr_1_w
cabac_binari_get_sig_ctx  cabac_binari_get_sig_ctx_u1
                (
                    .pattern_sig_ctx_i          ( pattern_sig_ctx_i           ),
                    .scan_idx_i                 ( scan_idx_i                  ),
                    .pos_x_i                    ( pos_x_1_r                   ),
                    .pos_y_i                    ( pos_y_1_r                   ),
                    .tu_depth_i                 ( tu_depth_i                  ),
                    .coeff_type_i               ( coeff_type_i                ),
                    .ctx_pair_scf_addr_o        ( ctx_pair_scf_addr_1_w       )
			    );
				
// non_zero_0_flag_r
always @*  begin 
    case(coeff_cnt_i[3:0])
        4'd2 : non_zero_0_flag_r  =   1'd0                                     ; // coeff_cnt_i = 5'd2 
		4'd3 : non_zero_0_flag_r  =   ! (! coeff_data_r[ 31:0 ] )              ; // coeff_cnt_i = 5'd3 
		4'd4 : non_zero_0_flag_r  =   ! (! coeff_data_r[ 63:0 ] )              ; // coeff_cnt_i = 5'd4 
		4'd5 : non_zero_0_flag_r  =   ! (! coeff_data_r[ 95:0 ] )              ; // coeff_cnt_i = 5'd5 
		4'd6 : non_zero_0_flag_r  =   ! (! coeff_data_r[127:0 ] )              ; // coeff_cnt_i = 5'd6 
		4'd7 : non_zero_0_flag_r  =   ! (! coeff_data_r[159:0 ] )              ; // coeff_cnt_i = 5'd7 
		4'd8 : non_zero_0_flag_r  =   ! (! coeff_data_r[191:0 ] )              ; // coeff_cnt_i = 5'd8 
		4'd9 : non_zero_0_flag_r  =   ! (! coeff_data_r[223:0 ] )              ; // coeff_cnt_i = 5'd9 		
	  default: non_zero_0_flag_r  =   1'b0                                     ;
	endcase
end 

// non_zero_1_flag_r
always @*  begin 
    case(coeff_cnt_i[3:0])
        4'd2 : non_zero_1_flag_r  =   ! (! coeff_data_r[ 15:0 ] )              ; // coeff_cnt_i = 5'd2 
        4'd3 : non_zero_1_flag_r  =   ! (! coeff_data_r[ 47:0 ] )              ; // coeff_cnt_i = 5'd3 
		4'd4 : non_zero_1_flag_r  =   ! (! coeff_data_r[ 79:0 ] )              ; // coeff_cnt_i = 5'd4 
		4'd5 : non_zero_1_flag_r  =   ! (! coeff_data_r[111:0 ] )              ; // coeff_cnt_i = 5'd5 
		4'd6 : non_zero_1_flag_r  =   ! (! coeff_data_r[143:0 ] )              ; // coeff_cnt_i = 5'd6 
		4'd7 : non_zero_1_flag_r  =   ! (! coeff_data_r[175:0 ] )              ; // coeff_cnt_i = 5'd7 
		4'd8 : non_zero_1_flag_r  =   ! (! coeff_data_r[207:0 ] )              ; // coeff_cnt_i = 5'd8 
		4'd9 : non_zero_1_flag_r  =   ! (! coeff_data_r[239:0 ] )              ; // coeff_cnt_i = 5'd9
      default: non_zero_1_flag_r  =   1'b0                                     ;
	endcase
end 

// ctx_pair_scf_bins_r
always @* begin 
    case(coeff_cnt_i[3:0])
        4'd2 : ctx_pair_scf_bins_r={!(!coeff_14_w),!(!coeff_15_w)}; // coeff_cnt_i = 5'd2 
		4'd3 : ctx_pair_scf_bins_r={!(!coeff_12_w),!(!coeff_13_w)}; // coeff_cnt_i = 5'd3 
		4'd4 : ctx_pair_scf_bins_r={!(!coeff_10_w),!(!coeff_11_w)}; // coeff_cnt_i = 5'd4 
		4'd5 : ctx_pair_scf_bins_r={!(!coeff_8_w ),!(!coeff_9_w )}; // coeff_cnt_i = 5'd5 
		4'd6 : ctx_pair_scf_bins_r={!(!coeff_6_w ),!(!coeff_7_w )}; // coeff_cnt_i = 5'd6
		4'd7 : ctx_pair_scf_bins_r={!(!coeff_4_w ),!(!coeff_5_w )}; // coeff_cnt_i = 5'd7
		4'd8 : ctx_pair_scf_bins_r={!(!coeff_2_w ),!(!coeff_3_w )}; // coeff_cnt_i = 5'd8
		4'd9 : ctx_pair_scf_bins_r={!(!coeff_0_w ),!(!coeff_1_w )}; // coeff_cnt_i = 5'd9
	  default: ctx_pair_scf_bins_r=4'b0000                        ;
	endcase    
end 

// ctx_pair_scf_0_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
	    ctx_pair_scf_0_r    <=   11'b0                                         ;
    else if(last_4x4_block_flag_i && non_zero_0_flag_r==1'b0)
        ctx_pair_scf_0_r    <=   {2'b01 , 1'b0 , 8'hff }                       ;
    else 
        ctx_pair_scf_0_r    <=   {2'b00 ,ctx_pair_scf_bins_r[0],ctx_pair_scf_addr_0_w};
end 


// ctx_pair_scf_1_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
	    ctx_pair_scf_1_r    <=   11'b0                                         ;
    else if(last_4x4_block_flag_i && non_zero_1_flag_r==1'b0)
        ctx_pair_scf_1_r    <=   {2'b01 , 1'b0 , 8'hff }                       ;
    else if((first_4x4_block_flag_i || non_zero_1_flag_r)||coeff_cnt_i !=5'd9) 
        ctx_pair_scf_1_r    <=   {2'b00 ,ctx_pair_scf_bins_r[1],ctx_pair_scf_addr_1_w};
	else 
        ctx_pair_scf_1_r    <=   {2'b01 , 1'b0 , 8'hff }                       ;
end 


//-----------------------------------------------------------------------------------------------------------------------------
//   
//               calculation sign_hidden_flag_r : 1 cycles  , no use 
//               calculation coeff_signs_w      : 1 cycles  , coeff_cnt_i = 5'd2  
//               calculation non_zero_num_r     : 1 cycles  , coeff_cnt_i = 5'd3 
//               calculation abs_coeff          : 4 cycles  , coeff_cnt_i = 5'd4 , only the last non_zero_num_r valid 
//               calculation first_c2_idx_r     : 2 cycles  , coeff_cnt_i =5'd6 
//               
//-----------------------------------------------------------------------------------------------------------------------------
wire     [ 15:0 ]       coeff_signs_w                                                    ; // coeff_cnt_i = 5'd2
reg      [  4:0 ]       non_zero_num_r                                                   ; // coeff_cnt_i = 5'd3
reg      [  3:0 ]       first_c2_idx_r                                                   ;

wire      [ 15:0 ]      abs_coeff_0_w , abs_coeff_1_w , abs_coeff_2_w , abs_coeff_3_w    ; // coeff_cnt_i = 5'd4
wire      [ 15:0 ]      abs_coeff_4_w , abs_coeff_5_w , abs_coeff_6_w , abs_coeff_7_w    ; // coeff_cnt_i = 5'd4
wire      [ 15:0 ]      abs_coeff_8_w , abs_coeff_9_w , abs_coeff_10_w, abs_coeff_11_w   ; // coeff_cnt_i = 5'd4
wire      [ 15:0 ]      abs_coeff_12_w, abs_coeff_13_w, abs_coeff_14_w, abs_coeff_15_w   ; // coeff_cnt_i = 5'd4

wire     [  2:0 ]       non_zero_num_l0_0_w   , non_zero_num_l0_1_w                      ;
wire     [  2:0 ]       non_zero_num_l0_2_w   , non_zero_num_l0_3_w                      ;

wire     [  3:0 ]       non_zero_num_l1_0_w   , non_zero_num_l1_1_w                      ;

reg      [ 15:0 ]       coeff_l1_0_r          , coeff_l1_1_r                             ; // coeff_cnt_i = 5'd2
reg      [ 15:0 ]       coeff_l1_2_r          , coeff_l1_3_r                             ; // coeff_cnt_i = 5'd2
reg      [ 15:0 ]       coeff_l1_4_r          , coeff_l1_5_r                             ; // coeff_cnt_i = 5'd2
reg      [ 15:0 ]       coeff_l1_6_r          , coeff_l1_7_r                             ; // coeff_cnt_i = 5'd2
reg      [ 15:0 ]       coeff_l1_8_r          , coeff_l1_9_r                             ; // coeff_cnt_i = 5'd2
reg      [ 15:0 ]       coeff_l1_10_r         , coeff_l1_11_r                            ; // coeff_cnt_i = 5'd2
reg      [ 15:0 ]       coeff_l1_12_r         , coeff_l1_13_r                            ; // coeff_cnt_i = 5'd2
reg      [ 15:0 ]       coeff_l1_14_r         , coeff_l1_15_r                            ; // coeff_cnt_i = 5'd2

reg      [ 15:0 ]       coeff_l2_0_r          , coeff_l2_1_r                             ; // coeff_cnt_i = 5'd3
reg      [ 15:0 ]       coeff_l2_2_r          , coeff_l2_3_r                             ; // coeff_cnt_i = 5'd3
reg      [ 15:0 ]       coeff_l2_4_r          , coeff_l2_5_r                             ; // coeff_cnt_i = 5'd3
reg      [ 15:0 ]       coeff_l2_6_r          , coeff_l2_7_r                             ; // coeff_cnt_i = 5'd3
reg      [ 15:0 ]       coeff_l2_8_r          , coeff_l2_9_r                             ; // coeff_cnt_i = 5'd3
reg      [ 15:0 ]       coeff_l2_10_r         , coeff_l2_11_r                            ; // coeff_cnt_i = 5'd3
reg      [ 15:0 ]       coeff_l2_12_r         , coeff_l2_13_r                            ; // coeff_cnt_i = 5'd3
reg      [ 15:0 ]       coeff_l2_14_r         , coeff_l2_15_r                            ; // coeff_cnt_i = 5'd3

reg      [ 15:0 ]       coeff_l3_0_r          , coeff_l3_1_r                             ; // coeff_cnt_i = 5'd3
reg      [ 15:0 ]       coeff_l3_2_r          , coeff_l3_3_r                             ; // coeff_cnt_i = 5'd3
reg      [ 15:0 ]       coeff_l3_4_r          , coeff_l3_5_r                             ; // coeff_cnt_i = 5'd3
reg      [ 15:0 ]       coeff_l3_6_r          , coeff_l3_7_r                             ; // coeff_cnt_i = 5'd3


reg      [ 15:0 ]       coeff_0_r   ,  coeff_1_r    , coeff_2_r    ,  coeff_3_r          ; // coeff_cnt_i = 5'd4
reg      [ 15:0 ]       coeff_4_r   ,  coeff_5_r    , coeff_6_r    ,  coeff_7_r          ; // coeff_cnt_i = 5'd4
reg      [ 15:0 ]       coeff_8_r   ,  coeff_9_r    , coeff_10_r   ,  coeff_11_r         ; // coeff_cnt_i = 5'd4
reg      [ 15:0 ]       coeff_12_r  ,  coeff_13_r   , coeff_14_r   ,  coeff_15_r         ; // coeff_cnt_i = 5'd4

reg      [  4:0 ]       first_c2_0_idx_r      , first_c2_1_idx_r                         ;

assign  abs_coeff_15_w  =  coeff_15_r[15] ? (~coeff_15_r + 1'b1) : coeff_15_r         ;
assign  abs_coeff_14_w  =  coeff_14_r[15] ? (~coeff_14_r + 1'b1) : coeff_14_r         ;
assign  abs_coeff_13_w  =  coeff_13_r[15] ? (~coeff_13_r + 1'b1) : coeff_13_r         ;
assign  abs_coeff_12_w  =  coeff_12_r[15] ? (~coeff_12_r + 1'b1) : coeff_12_r         ;
assign  abs_coeff_11_w  =  coeff_11_r[15] ? (~coeff_11_r + 1'b1) : coeff_11_r         ;
assign  abs_coeff_10_w  =  coeff_10_r[15] ? (~coeff_10_r + 1'b1) : coeff_10_r         ;
assign  abs_coeff_9_w   =   coeff_9_r[15] ? (~ coeff_9_r + 1'b1) :  coeff_9_r         ;
assign  abs_coeff_8_w   =   coeff_8_r[15] ? (~ coeff_8_r + 1'b1) :  coeff_8_r         ;
assign  abs_coeff_7_w   =   coeff_7_r[15] ? (~ coeff_7_r + 1'b1) :  coeff_7_r         ;
assign  abs_coeff_6_w   =   coeff_6_r[15] ? (~ coeff_6_r + 1'b1) :  coeff_6_r         ;
assign  abs_coeff_5_w   =   coeff_5_r[15] ? (~ coeff_5_r + 1'b1) :  coeff_5_r         ;
assign  abs_coeff_4_w   =   coeff_4_r[15] ? (~ coeff_4_r + 1'b1) :  coeff_4_r         ;
assign  abs_coeff_3_w   =   coeff_3_r[15] ? (~ coeff_3_r + 1'b1) :  coeff_3_r         ;
assign  abs_coeff_2_w   =   coeff_2_r[15] ? (~ coeff_2_r + 1'b1) :  coeff_2_r         ;
assign  abs_coeff_1_w   =   coeff_1_r[15] ? (~ coeff_1_r + 1'b1) :  coeff_1_r         ;
assign  abs_coeff_0_w   =   coeff_0_r[15] ? (~ coeff_0_r + 1'b1) :  coeff_0_r         ;


// coeff_l1_15_r
always @* begin 
    if(coeff_15_w)
        coeff_l1_15_r  =  coeff_15_w                                              ;                   
    else if(coeff_14_w)                                                                  
        coeff_l1_15_r  =  coeff_14_w                                              ;  
    else if(coeff_13_w)                                                                  
        coeff_l1_15_r  =  coeff_13_w                                              ;
    else                                                                        
        coeff_l1_15_r  =  coeff_12_w                                              ;
end 

// coeff_l1_14_r
always @* begin 
    if(coeff_15_w && coeff_14_w)
        coeff_l1_14_r  =  coeff_14_w                                              ;                   
    else if(( coeff_15_w ||coeff_14_w ) && coeff_13_w )
        coeff_l1_14_r  =  coeff_13_w                                              ;  
    else 
        coeff_l1_14_r  =  coeff_12_w                                              ;
end 

// coeff_l1_13_r
always @* begin 
    if(coeff_15_w && coeff_14_w&&coeff_13_w)
        coeff_l1_13_r  =  coeff_13_w                                              ;
	else 
        coeff_l1_13_r  =  coeff_12_w                                              ;
end 

// coeff_l1_12_r
always @* begin 
    if(coeff_12_w)
        coeff_l1_12_r  =  coeff_12_w                                              ;
    else 
        coeff_l1_12_r  =  16'd0                                                   ;
end 

// coeff_l1_11_r
always @* begin 
    if(coeff_11_w)
        coeff_l1_11_r  =  coeff_11_w                                              ;                   
    else if(coeff_10_w)
        coeff_l1_11_r  =  coeff_10_w                                              ;  
    else if(coeff_9_w)
        coeff_l1_11_r  =  coeff_9_w                                               ;
    else
        coeff_l1_11_r  =  coeff_8_w                                               ;
end 

// coeff_l1_10_r
always @* begin 
    if(coeff_11_w && coeff_10_w)
        coeff_l1_10_r  =  coeff_10_w                                              ;                   
    else if(( coeff_11_w ||coeff_10_w ) && coeff_9_w )
        coeff_l1_10_r  =  coeff_9_w                                               ;  
    else 
        coeff_l1_10_r  =  coeff_8_w                                               ;
end 

// coeff_l1_9_r
always @* begin 
    if(coeff_11_w && coeff_10_w&&coeff_9_w)
        coeff_l1_9_r  =  coeff_9_w                                                ;
	else 
        coeff_l1_9_r  =  coeff_8_w                                                ;
end 

// coeff_l1_8_r
always @* begin 
    if(coeff_8_w)
        coeff_l1_8_r  =  coeff_8_w                                                ;
    else 
        coeff_l1_8_r  =  16'd0                                                    ;
end 

// coeff_l1_7_r
always @* begin 
    if(coeff_7_w)
        coeff_l1_7_r  =  coeff_7_w                                                ;                   
    else if(coeff_6_w)
        coeff_l1_7_r  =  coeff_6_w                                                ;  
    else if(coeff_5_w)
        coeff_l1_7_r  =  coeff_5_w                                                ;
    else 
        coeff_l1_7_r  =  coeff_4_w                                                ;
end 

// coeff_l1_6_r
always @* begin 
    if(coeff_7_w && coeff_6_w)
        coeff_l1_6_r  =  coeff_6_w                                                ;                   
    else if(( coeff_7_w ||coeff_6_w ) && coeff_5_w )
        coeff_l1_6_r  =  coeff_5_w                                                ;  
    else 
        coeff_l1_6_r  =  coeff_4_w                                                ;
end 

// coeff_l1_5_r
always @* begin 
    if(coeff_7_w && coeff_6_w&&coeff_5_w)
        coeff_l1_5_r  =  coeff_5_w                                                ;
	else 
        coeff_l1_5_r  =  coeff_4_w                                                ;
end 

// coeff_l1_4_r
always @* begin 
    if(coeff_4_w)
        coeff_l1_4_r  =  coeff_4_w                                                ;
    else 
        coeff_l1_4_r  =  16'd0                                                    ;
end 

// coeff_l1_3_r
always @* begin 
    if(coeff_3_w)
        coeff_l1_3_r  =  coeff_3_w                                                ;                   
    else if(coeff_2_w)
        coeff_l1_3_r  =  coeff_2_w                                                ;  
    else if(coeff_1_w)
        coeff_l1_3_r  =  coeff_1_w                                                ;
    else 
        coeff_l1_3_r  =  coeff_0_w                                                ;
end 

// coeff_l1_2_r
always @* begin 
    if(coeff_3_w && coeff_2_w)
        coeff_l1_2_r  =  coeff_2_w                                                ;                   
    else if(( coeff_3_w ||coeff_2_w ) && coeff_1_w )
        coeff_l1_2_r  =  coeff_1_w                                                ;  
    else 
        coeff_l1_2_r  =  coeff_0_w                                                ;
end 

// coeff_l1_1_r
always @* begin 
    if(coeff_3_w && coeff_2_w&&coeff_1_w)
        coeff_l1_1_r  =  coeff_1_w                                                ;
	else 
        coeff_l1_1_r  =  coeff_0_w                                                ;
end 

// coeff_l1_0_r
always @* begin 
    if(coeff_0_w)
        coeff_l1_0_r  =  coeff_0_w                                                ;
    else 
        coeff_l1_0_r  =  12'd0                                                    ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        coeff_l2_8_r     <=    16'd0    ;    coeff_l2_9_r     <=     16'd0       ;
        coeff_l2_10_r    <=    16'd0    ;    coeff_l2_11_r    <=     16'd0       ;
        coeff_l2_12_r    <=    16'd0    ;    coeff_l2_13_r    <=     16'd0       ;
        coeff_l2_14_r    <=    16'd0    ;    coeff_l2_15_r    <=     16'd0       ;
    end 
	else 
	    case(non_zero_num_l0_0_w)
	        3'd0 : begin          
                coeff_l2_15_r<=coeff_l1_11_r;coeff_l2_14_r<=coeff_l1_10_r;
                coeff_l2_13_r<=coeff_l1_9_r ;coeff_l2_12_r<=coeff_l1_8_r ;
                coeff_l2_11_r<=16'd0            ;coeff_l2_10_r<=16'd0            ;
                coeff_l2_9_r <=16'd0            ;coeff_l2_8_r <=16'd0            ;			
	    	end 
	    	3'd1 : begin          
                coeff_l2_15_r<=coeff_l1_15_r;coeff_l2_14_r<=coeff_l1_11_r;
                coeff_l2_13_r<=coeff_l1_10_r;coeff_l2_12_r<=coeff_l1_9_r ;
                coeff_l2_11_r<=coeff_l1_8_r ;coeff_l2_10_r<=16'd0            ;
                coeff_l2_9_r <=16'd0            ;coeff_l2_8_r <=16'd0            ;	   	
	    	end 
	    	3'd2 : begin          
                coeff_l2_15_r<=coeff_l1_15_r;coeff_l2_14_r<=coeff_l1_14_r;
                coeff_l2_13_r<=coeff_l1_11_r;coeff_l2_12_r<=coeff_l1_10_r;
                coeff_l2_11_r<=coeff_l1_9_r ;coeff_l2_10_r<=coeff_l1_8_r ;
                coeff_l2_9_r <=16'd0            ;coeff_l2_8_r <=16'd0            ;		    	
	    	end 
	    	3'd3 : begin         
                coeff_l2_15_r<=coeff_l1_15_r;coeff_l2_14_r<=coeff_l1_14_r;
                coeff_l2_13_r<=coeff_l1_13_r;coeff_l2_12_r<=coeff_l1_11_r;
                coeff_l2_11_r<=coeff_l1_10_r;coeff_l2_10_r<=coeff_l1_9_r ;
                coeff_l2_9_r <=coeff_l1_8_r ;coeff_l2_8_r <=16'd0            ;	       
	    	end 
	    	3'd4 : begin         
                coeff_l2_15_r<=coeff_l1_15_r;coeff_l2_14_r<=coeff_l1_14_r;
                coeff_l2_13_r<=coeff_l1_13_r;coeff_l2_12_r<=coeff_l1_12_r;
                coeff_l2_11_r<=coeff_l1_11_r;coeff_l2_10_r<=coeff_l1_10_r;
                coeff_l2_9_r <=coeff_l1_9_r ;coeff_l2_8_r <=coeff_l1_8_r ;	              
	    	end 
	      default: begin 
                coeff_l2_15_r<=16'd0            ;coeff_l2_14_r<=16'd0            ;
                coeff_l2_13_r<=16'd0            ;coeff_l2_12_r<=16'd0            ;
                coeff_l2_11_r<=16'd0            ;coeff_l2_10_r<=16'd0            ;
                coeff_l2_9_r <=16'd0            ;coeff_l2_8_r <=16'd0            ;		      
	      end 
        endcase
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        coeff_l2_0_r     <=    16'd0    ;    coeff_l2_1_r     <=     16'd0       ;
        coeff_l2_2_r     <=    16'd0    ;    coeff_l2_3_r     <=     16'd0       ;
        coeff_l2_4_r     <=    16'd0    ;    coeff_l2_5_r     <=     16'd0       ;
        coeff_l2_6_r     <=    16'd0    ;    coeff_l2_7_r     <=     16'd0       ;
    end 
	else 
	    case(non_zero_num_l0_2_w)
	        3'd0 : begin          
                coeff_l2_7_r <=coeff_l1_3_r ;coeff_l2_6_r <=coeff_l1_2_r ;
                coeff_l2_5_r <=coeff_l1_1_r ;coeff_l2_4_r <=coeff_l1_0_r ;
                coeff_l2_3_r <=16'd0        ;coeff_l2_2_r <=16'd0        ;
                coeff_l2_1_r <=16'd0        ;coeff_l2_0_r <=16'd0        ;			
	    	end 
	    	3'd1 : begin          
                coeff_l2_7_r <=coeff_l1_7_r ;coeff_l2_6_r <=coeff_l1_3_r ;
                coeff_l2_5_r <=coeff_l1_2_r ;coeff_l2_4_r <=coeff_l1_1_r ;
                coeff_l2_3_r <=coeff_l1_0_r ;coeff_l2_2_r <=16'd0        ;
                coeff_l2_1_r <=16'd0        ;coeff_l2_0_r <=16'd0        ;	   	
	    	end 
	    	3'd2 : begin          
                coeff_l2_7_r <=coeff_l1_7_r ;coeff_l2_6_r <=coeff_l1_6_r ;
                coeff_l2_5_r <=coeff_l1_3_r ;coeff_l2_4_r <=coeff_l1_2_r ;
                coeff_l2_3_r <=coeff_l1_1_r ;coeff_l2_2_r <=coeff_l1_0_r ;
                coeff_l2_1_r <=16'd0        ;coeff_l2_0_r <=16'd0        ;		    	
	    	end 
	    	3'd3 : begin         
                coeff_l2_7_r <=coeff_l1_7_r ;coeff_l2_6_r <=coeff_l1_6_r ;
                coeff_l2_5_r <=coeff_l1_5_r ;coeff_l2_4_r <=coeff_l1_3_r ;
                coeff_l2_3_r <=coeff_l1_2_r ;coeff_l2_2_r <=coeff_l1_1_r ;
                coeff_l2_1_r <=coeff_l1_0_r ;coeff_l2_0_r <=16'd0        ;	       
	    	end 
	    	3'd4 : begin         
                coeff_l2_7_r <=coeff_l1_7_r ;coeff_l2_6_r <=coeff_l1_6_r ;
                coeff_l2_5_r <=coeff_l1_5_r ;coeff_l2_4_r <=coeff_l1_4_r ;
                coeff_l2_3_r <=coeff_l1_3_r ;coeff_l2_2_r <=coeff_l1_2_r ;
                coeff_l2_1_r <=coeff_l1_1_r ;coeff_l2_0_r <=coeff_l1_0_r ;	              
	    	end 
	      default: begin 
                coeff_l2_7_r <=16'd0        ;coeff_l2_6_r <=16'd0         ;
                coeff_l2_5_r <=16'd0        ;coeff_l2_4_r <=16'd0         ;
                coeff_l2_3_r <=16'd0        ;coeff_l2_2_r <=16'd0         ;
                coeff_l2_1_r <=16'd0        ;coeff_l2_0_r <=16'd0         ;		      
	      end 
        endcase
end 

always @* begin 
	    case(non_zero_num_l1_1_w)
	        4'd0 : begin          	
                coeff_l3_7_r = 16'd0            ; coeff_l3_6_r = 16'd0              ;
                coeff_l3_5_r = 16'd0            ; coeff_l3_4_r = 16'd0              ;
                coeff_l3_3_r = 16'd0            ; coeff_l3_2_r = 16'd0              ;
                coeff_l3_1_r = 16'd0            ; coeff_l3_0_r = 16'd0              ;
	    	end 
	    	4'd1 : begin          
                coeff_l3_7_r = coeff_l2_7_r  ; coeff_l3_6_r = 16'd0             ;
                coeff_l3_5_r = 16'd0             ; coeff_l3_4_r = 16'd0             ;
                coeff_l3_3_r = 16'd0             ; coeff_l3_2_r = 16'd0             ;
                coeff_l3_1_r = 16'd0             ; coeff_l3_0_r = 16'd0             ;
			end 
	    	4'd2 : begin          
                coeff_l3_7_r = coeff_l2_7_r  ; coeff_l3_6_r = coeff_l2_6_r  ;
                coeff_l3_5_r = 16'd0             ; coeff_l3_4_r = 16'd0             ;
                coeff_l3_3_r = 16'd0             ; coeff_l3_2_r = 16'd0             ;
                coeff_l3_1_r = 16'd0             ; coeff_l3_0_r = 16'd0             ;		
	    	end 
	    	4'd3 : begin         
                coeff_l3_7_r = coeff_l2_7_r  ; coeff_l3_6_r = coeff_l2_6_r  ;
                coeff_l3_5_r = coeff_l2_5_r  ; coeff_l3_4_r = 16'd0             ;
                coeff_l3_3_r = 16'd0             ; coeff_l3_2_r = 16'd0             ;
                coeff_l3_1_r = 16'd0             ; coeff_l3_0_r = 16'd0             ;
	    	end 
	    	4'd4 : begin         
                coeff_l3_7_r = coeff_l2_7_r  ; coeff_l3_6_r = coeff_l2_6_r  ;
                coeff_l3_5_r = coeff_l2_5_r  ; coeff_l3_4_r = coeff_l2_4_r  ;
                coeff_l3_3_r = 16'd0             ; coeff_l3_2_r = 16'd0             ;
                coeff_l3_1_r = 16'd0             ; coeff_l3_0_r = 16'd0             ;
	    	end 
	        4'd5 : begin          
                coeff_l3_7_r = coeff_l2_7_r  ; coeff_l3_6_r = coeff_l2_6_r  ;
                coeff_l3_5_r = coeff_l2_5_r  ; coeff_l3_4_r = coeff_l2_4_r  ;
                coeff_l3_3_r = coeff_l2_3_r  ; coeff_l3_2_r = 16'd0             ;
                coeff_l3_1_r = 16'd0             ; coeff_l3_0_r = 16'd0             ;
	    	end 
	    	4'd6 : begin          
                coeff_l3_7_r = coeff_l2_7_r  ; coeff_l3_6_r = coeff_l2_6_r  ;
                coeff_l3_5_r = coeff_l2_5_r  ; coeff_l3_4_r = coeff_l2_4_r  ;
                coeff_l3_3_r = coeff_l2_3_r  ; coeff_l3_2_r = coeff_l2_2_r  ;
                coeff_l3_1_r = 16'd0             ; coeff_l3_0_r = 16'd0             ;
	    	end 
	    	4'd7 : begin          
                coeff_l3_7_r = coeff_l2_7_r  ; coeff_l3_6_r = coeff_l2_6_r  ;
                coeff_l3_5_r = coeff_l2_5_r  ; coeff_l3_4_r = coeff_l2_4_r  ;
                coeff_l3_3_r = coeff_l2_3_r  ; coeff_l3_2_r = coeff_l2_2_r  ;
                coeff_l3_1_r = coeff_l2_1_r  ; coeff_l3_0_r = 16'd0             ;		
	    	end 
	    	4'd8 : begin         
                coeff_l3_7_r = coeff_l2_7_r  ; coeff_l3_6_r = coeff_l2_6_r  ;
                coeff_l3_5_r = coeff_l2_5_r  ; coeff_l3_4_r = coeff_l2_4_r  ;
                coeff_l3_3_r = coeff_l2_3_r  ; coeff_l3_2_r = coeff_l2_2_r  ;
                coeff_l3_1_r = coeff_l2_1_r  ; coeff_l3_0_r = coeff_l2_0_r  ;
	    	end 
	      default: begin 
                coeff_l3_7_r = coeff_l2_7_r  ; coeff_l3_6_r = coeff_l2_6_r  ;
                coeff_l3_5_r = coeff_l2_5_r  ; coeff_l3_4_r = coeff_l2_4_r  ;
                coeff_l3_3_r = coeff_l2_3_r  ; coeff_l3_2_r = coeff_l2_2_r  ;
                coeff_l3_1_r = coeff_l2_1_r  ; coeff_l3_0_r = coeff_l2_0_r  ; 
	      end 
        endcase
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        coeff_0_r     <=    16'd0    ;    coeff_1_r     <=     16'd0       ;
        coeff_2_r     <=    16'd0    ;    coeff_3_r     <=     16'd0       ;
        coeff_4_r     <=    16'd0    ;    coeff_5_r     <=     16'd0       ;
        coeff_6_r     <=    16'd0    ;    coeff_7_r     <=     16'd0       ;	
        coeff_8_r     <=    16'd0    ;    coeff_9_r     <=     16'd0       ;
        coeff_10_r    <=    16'd0    ;    coeff_11_r    <=     16'd0       ;
        coeff_12_r    <=    16'd0    ;    coeff_13_r    <=     16'd0       ;
        coeff_14_r    <=    16'd0    ;    coeff_15_r    <=     16'd0       ;
    end 
	else 
	    case(non_zero_num_l1_0_w)
	        4'd0 : begin          
                coeff_15_r<=coeff_l3_7_r     ;coeff_14_r<=coeff_l3_6_r     ;
                coeff_13_r<=coeff_l3_5_r     ;coeff_12_r<=coeff_l3_4_r     ;
                coeff_11_r<=coeff_l3_3_r     ;coeff_10_r<=coeff_l3_2_r     ;
                coeff_9_r <=coeff_l3_1_r     ;coeff_8_r <=coeff_l3_0_r     ;	
                coeff_7_r <=16'd0            ;coeff_6_r <=16'd0            ;
                coeff_5_r <=16'd0            ;coeff_4_r <=16'd0            ;
                coeff_3_r <=16'd0            ;coeff_2_r <=16'd0            ;
                coeff_1_r <=16'd0            ;coeff_0_r <=16'd0            ;
	    	end 
	    	4'd1 : begin          
                coeff_15_r<=coeff_l2_15_r    ;coeff_14_r<=coeff_l2_7_r     ;
                coeff_13_r<=coeff_l3_6_r     ;coeff_12_r<=coeff_l3_5_r     ;
                coeff_11_r<=coeff_l3_4_r     ;coeff_10_r<=coeff_l3_3_r     ;
                coeff_9_r <=coeff_l3_2_r     ;coeff_8_r <=coeff_l3_1_r     ;	
                coeff_7_r <=coeff_l3_0_r     ;coeff_6_r <=16'd0            ;
                coeff_5_r <=16'd0            ;coeff_4_r <=16'd0            ;
                coeff_3_r <=16'd0            ;coeff_2_r <=16'd0            ;
                coeff_1_r <=16'd0            ;coeff_0_r <=16'd0            ;
			end 
	    	4'd2 : begin          
                coeff_15_r<=coeff_l2_15_r    ;coeff_14_r<=coeff_l2_14_r    ;
                coeff_13_r<=coeff_l3_7_r     ;coeff_12_r<=coeff_l3_6_r     ;
                coeff_11_r<=coeff_l3_5_r     ;coeff_10_r<=coeff_l3_4_r     ;
                coeff_9_r <=coeff_l3_3_r     ;coeff_8_r <=coeff_l3_2_r     ;	
                coeff_7_r <=coeff_l3_1_r     ;coeff_6_r <=coeff_l3_0_r     ;
                coeff_5_r <=16'd0            ;coeff_4_r <=16'd0            ;
                coeff_3_r <=16'd0            ;coeff_2_r <=16'd0            ;
                coeff_1_r <=16'd0            ;coeff_0_r <=16'd0            ;			
	    	end 
	    	4'd3 : begin         
                coeff_15_r<=coeff_l2_15_r    ;coeff_14_r<=coeff_l2_14_r    ;
                coeff_13_r<=coeff_l2_13_r    ;coeff_12_r<=coeff_l3_7_r     ;
                coeff_11_r<=coeff_l3_6_r     ;coeff_10_r<=coeff_l3_5_r     ;
                coeff_9_r <=coeff_l3_4_r     ;coeff_8_r <=coeff_l3_3_r     ;	
                coeff_7_r <=coeff_l3_2_r     ;coeff_6_r <=coeff_l3_1_r     ;
                coeff_5_r <=coeff_l3_0_r     ;coeff_4_r <=16'd0            ;
                coeff_3_r <=16'd0            ;coeff_2_r <=16'd0            ;
                coeff_1_r <=16'd0            ;coeff_0_r <=16'd0            ;	
	    	end 
	    	4'd4 : begin         
                coeff_15_r<=coeff_l2_15_r    ;coeff_14_r<=coeff_l2_14_r    ;
                coeff_13_r<=coeff_l2_13_r    ;coeff_12_r<=coeff_l2_12_r    ;
                coeff_11_r<=coeff_l3_7_r     ;coeff_10_r<=coeff_l3_6_r     ;
                coeff_9_r <=coeff_l3_5_r     ;coeff_8_r <=coeff_l3_4_r     ;	
                coeff_7_r <=coeff_l3_3_r     ;coeff_6_r <=coeff_l3_2_r     ;
                coeff_5_r <=coeff_l3_1_r     ;coeff_4_r <=coeff_l3_0_r     ;
                coeff_3_r <=16'd0            ;coeff_2_r <=16'd0            ;
                coeff_1_r <=16'd0            ;coeff_0_r <=16'd0            ;
	    	end 
	        4'd5 : begin          
                coeff_15_r<=coeff_l2_15_r    ;coeff_14_r<=coeff_l2_14_r    ;
                coeff_13_r<=coeff_l2_13_r    ;coeff_12_r<=coeff_l2_12_r    ;
                coeff_11_r<=coeff_l2_11_r    ;coeff_10_r<=coeff_l3_7_r     ;
                coeff_9_r <=coeff_l3_6_r     ;coeff_8_r <=coeff_l3_5_r     ;	
                coeff_7_r <=coeff_l3_4_r     ;coeff_6_r <=coeff_l3_3_r     ;
                coeff_5_r <=coeff_l3_2_r     ;coeff_4_r <=coeff_l3_1_r     ;
                coeff_3_r <=coeff_l3_0_r     ;coeff_2_r <=16'd0            ;
                coeff_1_r <=16'd0            ;coeff_0_r <=16'd0            ;
	    	end 
	    	4'd6 : begin          
                coeff_15_r<=coeff_l2_15_r    ;coeff_14_r<=coeff_l2_14_r    ;
                coeff_13_r<=coeff_l2_13_r    ;coeff_12_r<=coeff_l2_12_r    ;
                coeff_11_r<=coeff_l2_11_r    ;coeff_10_r<=coeff_l2_10_r    ;
                coeff_9_r <=coeff_l3_7_r     ;coeff_8_r <=coeff_l3_6_r     ;	
                coeff_7_r <=coeff_l3_5_r     ;coeff_6_r <=coeff_l3_4_r     ;
                coeff_5_r <=coeff_l3_3_r     ;coeff_4_r <=coeff_l3_2_r     ;
                coeff_3_r <=coeff_l3_1_r     ;coeff_2_r <=coeff_l3_0_r     ;
                coeff_1_r <=16'd0            ;coeff_0_r <=16'd0            ;
	    	end 
	    	4'd7 : begin          
                coeff_15_r<=coeff_l2_15_r    ;coeff_14_r<=coeff_l2_14_r    ;
                coeff_13_r<=coeff_l2_13_r    ;coeff_12_r<=coeff_l2_12_r    ;
                coeff_11_r<=coeff_l2_11_r    ;coeff_10_r<=coeff_l2_10_r    ;
                coeff_9_r <=coeff_l2_9_r     ;coeff_8_r <=coeff_l3_7_r     ;	
                coeff_7_r <=coeff_l3_6_r     ;coeff_6_r <=coeff_l3_5_r     ;
                coeff_5_r <=coeff_l3_4_r     ;coeff_4_r <=coeff_l3_3_r     ;
                coeff_3_r <=coeff_l3_2_r     ;coeff_2_r <=coeff_l3_1_r     ;
                coeff_1_r <=coeff_l3_0_r     ;coeff_0_r <=16'd0            ;			
	    	end 
	    	4'd8 : begin         
                coeff_15_r<=coeff_l2_15_r    ;coeff_14_r<=coeff_l2_14_r    ;
                coeff_13_r<=coeff_l2_13_r    ;coeff_12_r<=coeff_l2_12_r    ;
                coeff_11_r<=coeff_l2_11_r    ;coeff_10_r<=coeff_l2_10_r    ;
                coeff_9_r <=coeff_l2_9_r     ;coeff_8_r <=coeff_l2_8_r     ;	
                coeff_7_r <=coeff_l3_7_r     ;coeff_6_r <=coeff_l3_6_r     ;
                coeff_5_r <=coeff_l3_5_r     ;coeff_4_r <=coeff_l3_4_r     ;
                coeff_3_r <=coeff_l3_3_r     ;coeff_2_r <=coeff_l3_2_r     ;
                coeff_1_r <=coeff_l3_1_r     ;coeff_0_r <=coeff_l3_0_r     ;	
	    	end 
	      default: begin 
                coeff_15_r<=16'd0            ;coeff_14_r<=16'd0            ;
                coeff_13_r<=16'd0            ;coeff_12_r<=16'd0            ;
                coeff_11_r<=16'd0            ;coeff_10_r<=16'd0            ;
                coeff_9_r <=16'd0            ;coeff_8_r <=16'd0            ;	
                coeff_7_r <=16'd0            ;coeff_6_r <=16'd0            ;
                coeff_5_r <=16'd0            ;coeff_4_r <=16'd0            ;
                coeff_3_r <=16'd0            ;coeff_2_r <=16'd0            ;
                coeff_1_r <=16'd0            ;coeff_0_r <=16'd0            ;
	      end 
        endcase
end 


assign   coeff_signs_w  = {coeff_15_r[15] ,coeff_14_r[15] ,coeff_13_r[15],coeff_12_r[15] ,
                           coeff_11_r[15] ,coeff_10_r[15] ,coeff_9_r[15] ,coeff_8_r[15]  ,
                           coeff_7_r[15]  ,coeff_6_r[15]  ,coeff_5_r[15] ,coeff_4_r[15]  ,
	                       coeff_3_r[15]  ,coeff_2_r[15]  ,coeff_1_r[15] ,coeff_0_r[15]} ;

// non_zero_num_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        non_zero_num_r       <=  5'd0                                                    ;
    else 
        non_zero_num_r       <=  non_zero_num_l1_0_w  +  non_zero_num_l1_1_w             ;
end 						   

assign  non_zero_num_l0_0_w = !(!coeff_15_w)+!(!coeff_14_w)+!(!coeff_13_w)+!(!coeff_12_w);			   
assign  non_zero_num_l0_1_w = !(!coeff_11_w)+!(!coeff_10_w)+!(!coeff_9_w )+!(!coeff_8_w );			   
assign  non_zero_num_l0_2_w = !(!coeff_7_w )+!(!coeff_6_w )+!(!coeff_5_w )+!(!coeff_4_w );			   
assign  non_zero_num_l0_3_w = !(!coeff_3_w )+!(!coeff_2_w )+!(!coeff_1_w )+!(!coeff_0_w );			   
						   
assign  non_zero_num_l1_0_w	= non_zero_num_l0_0_w +  non_zero_num_l0_1_w                 ;					   
assign  non_zero_num_l1_1_w	= non_zero_num_l0_2_w +  non_zero_num_l0_3_w                 ;	

// first_c2_0_idx_r
always @* begin 
    if( abs_coeff_15_w[15:1] )
        first_c2_0_idx_r     =     4'd0                                                  ;
    else if( abs_coeff_14_w[15:1] )
        first_c2_0_idx_r     =     4'd1                                                  ;
    else if( abs_coeff_13_w[15:1] )
        first_c2_0_idx_r     =     4'd2                                                  ;
	else if( abs_coeff_12_w[15:1] )
        first_c2_0_idx_r     =     4'd3                                                  ;
	else 
	    first_c2_0_idx_r     =     4'd8                                                  ;
end 

// first_c2_1_idx_r
always @* begin 
    if( abs_coeff_11_w[15:1] )
        first_c2_1_idx_r     =     4'd4                                                  ;
    else if( abs_coeff_10_w[15:1] )
        first_c2_1_idx_r     =     4'd5                                                  ;
    else if( abs_coeff_9_w[15:1] )
        first_c2_1_idx_r     =     4'd6                                                  ;
	else if( abs_coeff_8_w[15:1] )
        first_c2_1_idx_r     =     4'd7                                                  ;
	else 
	    first_c2_1_idx_r     =     4'd8                                                  ;
end 

always @* begin 
    if( first_c2_0_idx_r[3])  // 8
        first_c2_idx_r       =      first_c2_1_idx_r                                     ;
    else 
        first_c2_idx_r       =      first_c2_0_idx_r                                     ;
end 

//-----------------------------------------------------------------------------------------------------------------------------
//
//               coeff_gt1_flag : 2 cycles , coeff_cnt_i = 5'd6 , 5'd7
//
//-----------------------------------------------------------------------------------------------------------------------------
reg      [  7:0 ]       ctx_pair_coeff_gt1_addr_0_r , ctx_pair_coeff_gt1_addr_1_r        ; 
reg      [  7:0 ]       ctx_pair_coeff_gt1_addr_2_r , ctx_pair_coeff_gt1_addr_3_r        ; 
reg      [  7:0 ]       ctx_pair_coeff_gt1_addr_4_r , ctx_pair_coeff_gt1_addr_5_r        ; 
reg      [  7:0 ]       ctx_pair_coeff_gt1_addr_6_r , ctx_pair_coeff_gt1_addr_7_r        ; 
reg      [ 15:0 ]       ctx_pair_coeff_gt1_coding_mode_r                                 ;
wire     [  7:0 ]       ctx_pair_coeff_gt1_bins_w                                        ;

reg      [ 31:0 ]       ctx_pair_coeff_gt1_base_addr                                     ;


reg      [  1:0 ]       c1_0_0_r      , c1_0_1_r      , c1_0_2_r    , c1_0_3_r           ; // coeff_cnt_i = 5'd4
reg      [  1:0 ]       c1_1_0_r      , c1_1_1_r      , c1_1_2_r    , c1_1_3_r           ; // coeff_cnt_i = 5'd5 
reg      [  1:0 ]       c1_final_r                                                       ; // coeff_cnt_i = 5'd6 

// delay 1 cycles 
reg      [  1:0 ]       c1_0_0_d1_r   , c1_0_1_d1_r   , c1_0_2_d1_r  , c1_0_3_d1_r       ; // coeff_cnt_i = 5'd4
reg      [  1:0 ]       c1_1_0_d1_r   , c1_1_1_d1_r   , c1_1_2_d1_r  , c1_1_3_d1_r       ; // coeff_cnt_i = 5'd5 


wire     [  1:0 ]       i_ctx_set_flag_w                                                 ;
reg      [  2:0 ]       i_ctx_set_r                                                      ; // coeff_cnt_i = 5'd3 

always @* begin 
    if(!abs_coeff_15_w)
        c1_0_0_r            =   c1_inner_i                                               ;
    else 
        c1_0_0_r            =   2'b1                                                     ;
end 

// c1_0_1_r
always @* begin 
    if(abs_coeff_15_w[15:1]) //>1 
        c1_0_1_r            =   2'd0                                                     ;
	else if (abs_coeff_15_w)
        c1_0_1_r            =   2'd2                                                     ;
	else 
        c1_0_1_r            =   c1_0_0_r                                                 ;
end 

// c1_0_2_r
always @* begin 
    if(abs_coeff_14_w[15:1])
        c1_0_2_r            =   2'b0                                                     ;
	else if (abs_coeff_14_w && ( c1_0_1_r[0]^c1_0_1_r[1]) )
        c1_0_2_r            =  c1_0_1_r  + 1'b1                                          ;
	else 
        c1_0_2_r            =  c1_0_1_r                                                  ;
end 

// c1_0_3_r
always @* begin 
    if(abs_coeff_13_w[15:1])
        c1_0_3_r            =   2'b0                                                     ;
	else if (abs_coeff_13_w && ( c1_0_2_r[0]^c1_0_2_r[1]) )
        c1_0_3_r            =  c1_0_2_r  + 1'b1                                          ;
	else 
        c1_0_3_r            =  c1_0_2_r                                                  ;
end 

// c1_1_0_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        c1_1_0_r           <=   2'd0                                                     ;
    else if( abs_coeff_12_w[15:1] )
        c1_1_0_r           <=   2'd0                                                     ;
	else if (abs_coeff_12_w && ( c1_0_3_r[0]^c1_0_3_r[1]) )
        c1_1_0_r           <=  c1_0_3_r  + 1'b1                                          ;
	else 
        c1_1_0_r           <=  c1_0_3_r                                                  ;
end 

// c1_1_1_r
always @* begin 
    if(abs_coeff_11_w[15:1])
        c1_1_1_r            =   2'b0                                                     ;
	else if (abs_coeff_11_w && ( c1_1_0_r[0]^c1_1_0_r[1]) )
        c1_1_1_r            =  c1_1_0_r  + 1'b1                                          ;
	else 
        c1_1_1_r            =  c1_1_0_r                                                  ;
end 

// c1_1_2_r
always @* begin 
    if(abs_coeff_10_w[15:1])
        c1_1_2_r            =   2'b0                                                     ;
	else if (abs_coeff_10_w && ( c1_1_1_r[0]^c1_1_1_r[1]) )
        c1_1_2_r            =  c1_1_1_r  + 1'b1                                          ;
	else 
        c1_1_2_r            =  c1_1_1_r                                                  ;
end 

// c1_1_3_r
always @* begin 
    if(abs_coeff_9_w[15:1])
        c1_1_3_r            =   2'b0                                                     ;
	else if (abs_coeff_9_w && ( c1_1_2_r[0]^c1_1_2_r[1]) )
        c1_1_3_r            =  c1_1_2_r  + 1'b1                                          ;
	else 
        c1_1_3_r            =  c1_1_2_r                                                  ;
end 

// c1_final_r 
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
	    c1_final_r       <=   2'd0                                                        ;  
	else if(abs_coeff_8_w[15:1])
        c1_final_r       <=   2'b0                                                        ;
	else if (abs_coeff_8_w && ( c1_1_3_r[0]^c1_1_3_r[1]) )
        c1_final_r       <=  c1_1_3_r  + 1'b1                                             ;
	else 
        c1_final_r       <=  c1_1_3_r                                                     ;
end 

// i_ctx_set_flag_w

assign i_ctx_set_flag_w  = {(!first_4x4_block_flag_i && coeff_type_i[1]), (!c1_inner_i)} ;

// i_ctx_set_r
always @* begin 
    if(coeff_type_i[1]) begin    // luma 
        case(i_ctx_set_flag_w)
            2'd0   :   i_ctx_set_r  =    3'd0                                            ;
            2'd1   :   i_ctx_set_r  =    3'd1                                            ;
            2'd2   :   i_ctx_set_r  =    3'd2                                            ;
            2'd3   :   i_ctx_set_r  =    3'd3                                            ;
        endcase
	end 
	else begin                   // chroma 
        case(i_ctx_set_flag_w)
            2'd0   :   i_ctx_set_r  =    3'd4                                            ;
            2'd1   :   i_ctx_set_r  =    3'd5                                            ;
            2'd2   :   i_ctx_set_r  =    3'd6                                            ;
            2'd3   :   i_ctx_set_r  =    3'd7                                            ;
        endcase	
	end 
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        c1_0_0_d1_r   <=  2'd0          ;   c1_0_1_d1_r   <=   2'd0                      ;
        c1_0_2_d1_r   <=  2'd0          ;   c1_0_3_d1_r   <=   2'd0                      ;
        c1_1_0_d1_r   <=  2'd0          ;   c1_1_1_d1_r   <=   2'd0                      ;
        c1_1_2_d1_r   <=  2'd0          ;   c1_1_3_d1_r   <=   2'd0                      ;
    end 
	else begin 
        c1_0_0_d1_r   <=  c1_0_0_r      ;   c1_0_1_d1_r   <=   c1_0_1_r                  ;
        c1_0_2_d1_r   <=  c1_0_2_r      ;   c1_0_3_d1_r   <=   c1_0_3_r                  ;
        c1_1_0_d1_r   <=  c1_1_0_r      ;   c1_1_1_d1_r   <=   c1_1_1_r                  ;
        c1_1_2_d1_r   <=  c1_1_2_r      ;   c1_1_3_d1_r   <=   c1_1_3_r                  ;		
	end 
end 

// ctx_pair_coeff_gt1_base_addr
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        ctx_pair_coeff_gt1_base_addr      <= 28'd0                                         ;
    else begin 		
        case(i_ctx_set_r)
            3'd0:ctx_pair_coeff_gt1_base_addr<={3'd0,5'd23,3'd1,5'd21,3'd2,5'd21,3'd3,5'd17}; //  0  1  2  3 :  
            3'd1:ctx_pair_coeff_gt1_base_addr<={3'd0,5'd24,3'd1,5'd22,3'd2,5'd22,3'd3,5'd18}; //  4  5  6  7 :  
            3'd2:ctx_pair_coeff_gt1_base_addr<={3'd0,5'd25,3'd1,5'd23,3'd2,5'd23,3'd3,5'd19}; //  8  9 10 11 :  
            3'd3:ctx_pair_coeff_gt1_base_addr<={3'd0,5'd26,3'd1,5'd24,3'd2,5'd24,3'd3,5'd20}; // 12 13 14 15 :  
            3'd4:ctx_pair_coeff_gt1_base_addr<={3'd0,5'd27,3'd1,5'd25,3'd2,5'd25,3'd3,5'd21}; // 16 17 18 19 :  
            3'd5:ctx_pair_coeff_gt1_base_addr<={3'd0,5'd28,3'd1,5'd26,3'd2,5'd26,3'd3,5'd22}; // 20 21 22 23 :  
	     default:ctx_pair_coeff_gt1_base_addr<=28'd0                                        ;  
	    endcase 
	end 
end 

// ctx_pair_coeff_gt1_addr_0_r
always @* begin 
    case(c1_0_0_d1_r)
        2'd0  :  ctx_pair_coeff_gt1_addr_0_r  =  ctx_pair_coeff_gt1_base_addr[31:24];
        2'd1  :  ctx_pair_coeff_gt1_addr_0_r  =  ctx_pair_coeff_gt1_base_addr[23:16];
        2'd2  :  ctx_pair_coeff_gt1_addr_0_r  =  ctx_pair_coeff_gt1_base_addr[15:8 ];
        2'd3  :  ctx_pair_coeff_gt1_addr_0_r  =  ctx_pair_coeff_gt1_base_addr[ 7:0 ];
    endcase
end 

// ctx_pair_coeff_gt1_addr_1_r
always @* begin 
    case(c1_0_1_d1_r)
        2'd0  :  ctx_pair_coeff_gt1_addr_1_r  =  ctx_pair_coeff_gt1_base_addr[31:24];
        2'd1  :  ctx_pair_coeff_gt1_addr_1_r  =  ctx_pair_coeff_gt1_base_addr[23:16];
        2'd2  :  ctx_pair_coeff_gt1_addr_1_r  =  ctx_pair_coeff_gt1_base_addr[15:8 ];
        2'd3  :  ctx_pair_coeff_gt1_addr_1_r  =  ctx_pair_coeff_gt1_base_addr[ 7:0 ];
    endcase
end 

// ctx_pair_coeff_gt1_addr_2_r
always @* begin 
    case(c1_0_2_d1_r)
        2'd0  :  ctx_pair_coeff_gt1_addr_2_r  =  ctx_pair_coeff_gt1_base_addr[31:24];
        2'd1  :  ctx_pair_coeff_gt1_addr_2_r  =  ctx_pair_coeff_gt1_base_addr[23:16];
        2'd2  :  ctx_pair_coeff_gt1_addr_2_r  =  ctx_pair_coeff_gt1_base_addr[15:8 ];
        2'd3  :  ctx_pair_coeff_gt1_addr_2_r  =  ctx_pair_coeff_gt1_base_addr[ 7:0 ];
    endcase
end 

//ctx_pair_coeff_gt1_addr_3_r
always @* begin 
    case(c1_0_3_d1_r)
        2'd0  :  ctx_pair_coeff_gt1_addr_3_r  =  ctx_pair_coeff_gt1_base_addr[31:24];
        2'd1  :  ctx_pair_coeff_gt1_addr_3_r  =  ctx_pair_coeff_gt1_base_addr[23:16];
        2'd2  :  ctx_pair_coeff_gt1_addr_3_r  =  ctx_pair_coeff_gt1_base_addr[15:8 ];
        2'd3  :  ctx_pair_coeff_gt1_addr_3_r  =  ctx_pair_coeff_gt1_base_addr[ 7:0 ];
    endcase
end 

// ctx_pair_coeff_gt1_addr_4_r
always @* begin 
    case(c1_1_0_d1_r)
        2'd0  :  ctx_pair_coeff_gt1_addr_4_r  =  ctx_pair_coeff_gt1_base_addr[31:24];
        2'd1  :  ctx_pair_coeff_gt1_addr_4_r  =  ctx_pair_coeff_gt1_base_addr[23:16];
        2'd2  :  ctx_pair_coeff_gt1_addr_4_r  =  ctx_pair_coeff_gt1_base_addr[15:8 ];
        2'd3  :  ctx_pair_coeff_gt1_addr_4_r  =  ctx_pair_coeff_gt1_base_addr[ 7:0 ];
    endcase
end 

// ctx_pair_coeff_gt1_addr_5_r
always @* begin 
    case(c1_1_1_d1_r)
        2'd0  :  ctx_pair_coeff_gt1_addr_5_r  =  ctx_pair_coeff_gt1_base_addr[31:24];
        2'd1  :  ctx_pair_coeff_gt1_addr_5_r  =  ctx_pair_coeff_gt1_base_addr[23:16];
        2'd2  :  ctx_pair_coeff_gt1_addr_5_r  =  ctx_pair_coeff_gt1_base_addr[15:8 ];
        2'd3  :  ctx_pair_coeff_gt1_addr_5_r  =  ctx_pair_coeff_gt1_base_addr[ 7:0 ];
    endcase
end 

// ctx_pair_coeff_gt1_addr_6_r
always @* begin 
    case(c1_1_2_d1_r)
        2'd0  :  ctx_pair_coeff_gt1_addr_6_r  =  ctx_pair_coeff_gt1_base_addr[31:24];
        2'd1  :  ctx_pair_coeff_gt1_addr_6_r  =  ctx_pair_coeff_gt1_base_addr[23:16];
        2'd2  :  ctx_pair_coeff_gt1_addr_6_r  =  ctx_pair_coeff_gt1_base_addr[15:8 ];
        2'd3  :  ctx_pair_coeff_gt1_addr_6_r  =  ctx_pair_coeff_gt1_base_addr[ 7:0 ];
    endcase
end 

// ctx_pair_coeff_gt1_addr_7_r
always @* begin 
    case(c1_1_3_d1_r)
        2'd0  :  ctx_pair_coeff_gt1_addr_7_r  =  ctx_pair_coeff_gt1_base_addr[31:24];
        2'd1  :  ctx_pair_coeff_gt1_addr_7_r  =  ctx_pair_coeff_gt1_base_addr[23:16];
        2'd2  :  ctx_pair_coeff_gt1_addr_7_r  =  ctx_pair_coeff_gt1_base_addr[15:8 ];
        2'd3  :  ctx_pair_coeff_gt1_addr_7_r  =  ctx_pair_coeff_gt1_base_addr[ 7:0 ];
    endcase
end 

// ctx_pair_coeff_gt1_coding_mode_r
always @* begin 
    case( non_zero_num_r )
        5'd0 :  ctx_pair_coeff_gt1_coding_mode_r = {2'b01,2'b01,2'b01,2'b01,2'b01,2'b01,2'b01,2'b01};
        5'd1 :  ctx_pair_coeff_gt1_coding_mode_r = {2'b00,2'b01,2'b01,2'b01,2'b01,2'b01,2'b01,2'b01};
        5'd2 :  ctx_pair_coeff_gt1_coding_mode_r = {2'b00,2'b00,2'b01,2'b01,2'b01,2'b01,2'b01,2'b01};
        5'd3 :  ctx_pair_coeff_gt1_coding_mode_r = {2'b00,2'b00,2'b00,2'b01,2'b01,2'b01,2'b01,2'b01};
        5'd4 :  ctx_pair_coeff_gt1_coding_mode_r = {2'b00,2'b00,2'b00,2'b00,2'b01,2'b01,2'b01,2'b01};
        5'd5 :  ctx_pair_coeff_gt1_coding_mode_r = {2'b00,2'b00,2'b00,2'b00,2'b00,2'b01,2'b01,2'b01};
        5'd6 :  ctx_pair_coeff_gt1_coding_mode_r = {2'b00,2'b00,2'b00,2'b00,2'b00,2'b00,2'b01,2'b01};
        5'd7 :  ctx_pair_coeff_gt1_coding_mode_r = {2'b00,2'b00,2'b00,2'b00,2'b00,2'b00,2'b00,2'b01};
      default:  ctx_pair_coeff_gt1_coding_mode_r = {2'b00,2'b00,2'b00,2'b00,2'b00,2'b00,2'b00,2'b00};
    endcase
end 

assign  ctx_pair_coeff_gt1_0_w  = {ctx_pair_coeff_gt1_coding_mode_r[15:14],!(!abs_coeff_15_w[15:1]),ctx_pair_coeff_gt1_addr_0_r};
assign  ctx_pair_coeff_gt1_1_w  = {ctx_pair_coeff_gt1_coding_mode_r[13:12],!(!abs_coeff_14_w[15:1]),ctx_pair_coeff_gt1_addr_1_r};
assign  ctx_pair_coeff_gt1_2_w  = {ctx_pair_coeff_gt1_coding_mode_r[11:10],!(!abs_coeff_13_w[15:1]),ctx_pair_coeff_gt1_addr_2_r};
assign  ctx_pair_coeff_gt1_3_w  = {ctx_pair_coeff_gt1_coding_mode_r[ 9:8 ],!(!abs_coeff_12_w[15:1]),ctx_pair_coeff_gt1_addr_3_r};
assign  ctx_pair_coeff_gt1_4_w  = {ctx_pair_coeff_gt1_coding_mode_r[ 7:6 ],!(!abs_coeff_11_w[15:1]),ctx_pair_coeff_gt1_addr_4_r};
assign  ctx_pair_coeff_gt1_5_w  = {ctx_pair_coeff_gt1_coding_mode_r[ 5:4 ],!(!abs_coeff_10_w[15:1]),ctx_pair_coeff_gt1_addr_5_r};
assign  ctx_pair_coeff_gt1_6_w  = {ctx_pair_coeff_gt1_coding_mode_r[ 3:2 ],!(!abs_coeff_9_w [15:1]),ctx_pair_coeff_gt1_addr_6_r};
assign  ctx_pair_coeff_gt1_7_w  = {ctx_pair_coeff_gt1_coding_mode_r[ 1:0 ],!(!abs_coeff_8_w [15:1]),ctx_pair_coeff_gt1_addr_7_r};

//-----------------------------------------------------------------------------------------------------------------------------
//
//               coeff_gt2_flag  :  1 cycles , coeff_cnt_i = 5'd9 
//
//-----------------------------------------------------------------------------------------------------------------------------

reg                     ctx_pair_coeff_gt2_bin_r                                                         ;
reg      [  7:0 ]       ctx_pair_coeff_gt2_addr_r                                                        ;

always @(posedge clk or negedge rst_n) begin                                                            
    if(!rst_n)                                                                                          
        ctx_pair_coeff_gt2_bin_r           <=       1'b0                                                 ;
	else  begin 
        case(first_c2_idx_r)
	        4'd0:  ctx_pair_coeff_gt2_bin_r <=abs_coeff_15_w[15:2]||(abs_coeff_15_w[0]&abs_coeff_15_w[1]);
	        4'd1:  ctx_pair_coeff_gt2_bin_r <=abs_coeff_14_w[15:2]||(abs_coeff_14_w[0]&abs_coeff_14_w[1]);
	        4'd2:  ctx_pair_coeff_gt2_bin_r <=abs_coeff_13_w[15:2]||(abs_coeff_13_w[0]&abs_coeff_13_w[1]);
	        4'd3:  ctx_pair_coeff_gt2_bin_r <=abs_coeff_12_w[15:2]||(abs_coeff_12_w[0]&abs_coeff_12_w[1]);
            4'd4:  ctx_pair_coeff_gt2_bin_r <=abs_coeff_11_w[15:2]||(abs_coeff_11_w[0]&abs_coeff_11_w[1]);
            4'd5:  ctx_pair_coeff_gt2_bin_r <=abs_coeff_10_w[15:2]||(abs_coeff_10_w[0]&abs_coeff_10_w[1]);
            4'd6:  ctx_pair_coeff_gt2_bin_r <=abs_coeff_9_w[15:2] ||( abs_coeff_9_w[0]&abs_coeff_9_w [1]);
            4'd7:  ctx_pair_coeff_gt2_bin_r <=abs_coeff_8_w[15:2] ||( abs_coeff_8_w[0]&abs_coeff_8_w [1]); 
         default:  ctx_pair_coeff_gt2_bin_r <=1'b0                                                       ;
        endcase
    end 
end 

always @* begin 
    case(i_ctx_set_r)
        3'd0   :   ctx_pair_coeff_gt2_addr_r    =   {3'd4   ,   5'd12   }                                ;
        3'd1   :   ctx_pair_coeff_gt2_addr_r    =   {3'd4   ,   5'd13   }                                ;
        3'd2   :   ctx_pair_coeff_gt2_addr_r    =   {3'd4   ,   5'd14   }                                ;
        3'd3   :   ctx_pair_coeff_gt2_addr_r    =   {3'd4   ,   5'd15   }                                ;
        3'd4   :   ctx_pair_coeff_gt2_addr_r    =   {3'd4   ,   5'd16   }                                ;
        3'd5   :   ctx_pair_coeff_gt2_addr_r    =   {3'd4   ,   5'd17   }                                ;
	  default  :   ctx_pair_coeff_gt2_addr_r    =   11'd0                                                ;
	endcase  
end 

always @* begin 
    if(c1_final_r==0&& first_c2_idx_r!=4'd8)
        ctx_pair_coeff_gt2_r  =  {2'b00,ctx_pair_coeff_gt2_bin_r,ctx_pair_coeff_gt2_addr_r}              ;
    else
        ctx_pair_coeff_gt2_r  =  {2'b01,1'b0,8'hff}                                                      ;
end 


//-----------------------------------------------------------------------------------------------------------------------------
//
//               coeff_signs : 1 cycles , coeff_cnt_i = 5'd9 
//
//-----------------------------------------------------------------------------------------------------------------------------

wire [2:0] ctx_pair_coeff_signs_nums_0    =   { non_zero_num_r[3],non_zero_num_r[1:0] }                  ; // -4  
wire [2:0] ctx_pair_coeff_signs_nums_1    =    non_zero_num_r[2:0]                                       ; // -8  
wire [2:0] ctx_pair_coeff_signs_nums_2    =   { non_zero_num_r[4],non_zero_num_r[1:0] }                  ; // -12  

/*
always @* begin 
    case(non_zero_num_r)
        5'd0  ,
        5'd1  ,
        5'd2  ,
        5'd3  ,
        5'd4  : begin 
		        ctx_pair_coeff_signs_0_r   = {2'b10,1'b0,non_zero_num_r[2:0],1'b0,coeff_signs_w[15:12]       }; 
		        ctx_pair_coeff_signs_1_r   = {2'b01,1'b0,8'hff                                               }; 
		        ctx_pair_coeff_signs_2_r   = {2'b01,1'b0,8'hff                                               }; 
		        ctx_pair_coeff_signs_3_r   = {2'b01,1'b0,8'hff                                               }; 
		end                                                                                                              
        5'd5  ,                                                                                                          
        5'd6  ,                                                                                                          
        5'd7  ,                                                                                                          
        5'd8  : begin                                                                                                    
		        ctx_pair_coeff_signs_0_r  = {2'b10,1'b0,ctx_pair_coeff_signs_nums_0,1'b0,coeff_signs_w[15:12]}; 		  
		        ctx_pair_coeff_signs_1_r  =	{2'b10,1'b0,3'd4                       ,1'b0,coeff_signs_w[11:8 ]}; 
		        ctx_pair_coeff_signs_2_r  = {2'b01,1'b0,8'hff                                                };  
		        ctx_pair_coeff_signs_3_r  =	{2'b01,1'b0,8'hff                                                }; 
	    end 
        5'd9  ,
        5'd10 ,
        5'd11 ,
        5'd12 : begin 
		        ctx_pair_coeff_signs_0_r  = {2'b10,1'b0,ctx_pair_coeff_signs_nums_1,1'b0,coeff_signs_w[15:12]}; 
		        ctx_pair_coeff_signs_1_r  = {2'b10,1'b0,3'd4                       ,1'b0,coeff_signs_w[11:8 ]}; 
		        ctx_pair_coeff_signs_2_r  = {2'b10,1'b0,3'd4                       ,1'b0,coeff_signs_w[7 :4 ]}; 
		        ctx_pair_coeff_signs_3_r  = {2'b01,1'b0,8'hff}                                                ; 
		end                                                                        
		5'd13 ,                                                                    
		5'd14 ,                                                                    
		5'd15 ,                                                                    
        5'd16 : begin                                                              
                ctx_pair_coeff_signs_0_r = {2'b10,1'b0,ctx_pair_coeff_signs_nums_2,1'b0,coeff_signs_w[15:12] };  
                ctx_pair_coeff_signs_1_r = {2'b10,1'b0,3'd4                       ,1'b0,coeff_signs_w[11:8 ] };
                ctx_pair_coeff_signs_2_r = {2'b10,1'b0,3'd4                       ,1'b0,coeff_signs_w[7 :4 ] };
                ctx_pair_coeff_signs_3_r = {2'b10,1'b0,3'd4                       ,1'b0,coeff_signs_w[3:0  ] };
        end 		
	  default : begin 
		        ctx_pair_coeff_signs_0_r = {2'b01,1'b0,8'hff                                                 }; 
		        ctx_pair_coeff_signs_1_r = {2'b01,1'b0,8'hff                                                 }; 
		        ctx_pair_coeff_signs_2_r = {2'b01,1'b0,8'hff                                                 }; 
		        ctx_pair_coeff_signs_3_r = {2'b01,1'b0,8'hff                                                 }; 	  
	  end 
    endcase
end 
*/

always @* begin 
    case(non_zero_num_r)
        5'd0  : begin 
		        ctx_pair_coeff_signs_0_r   = {2'b01,1'b0,8'hff                           }; 
		        ctx_pair_coeff_signs_1_r   = {2'b01,1'b0,8'hff                           }; 
		        ctx_pair_coeff_signs_2_r   = {2'b01,1'b0,8'hff                           }; 
		        ctx_pair_coeff_signs_3_r   = {2'b01,1'b0,8'hff                           }; 
		end 
        5'd1  : begin 
		        ctx_pair_coeff_signs_0_r   = {2'b10,1'b0,3'd1,4'd0,coeff_signs_w[15   ]  }; 
		        ctx_pair_coeff_signs_1_r   = {2'b01,1'b0,8'hff                           }; 
		        ctx_pair_coeff_signs_2_r   = {2'b01,1'b0,8'hff                           }; 
		        ctx_pair_coeff_signs_3_r   = {2'b01,1'b0,8'hff                           }; 
		end 
        5'd2  : begin 
		        ctx_pair_coeff_signs_0_r   = {2'b10,1'b0,3'd2,3'd0,coeff_signs_w[15:14]  }; 
		        ctx_pair_coeff_signs_1_r   = {2'b01,1'b0,8'hff                           }; 
		        ctx_pair_coeff_signs_2_r   = {2'b01,1'b0,8'hff                           }; 
		        ctx_pair_coeff_signs_3_r   = {2'b01,1'b0,8'hff                           }; 
		end 
        5'd3  : begin 
		        ctx_pair_coeff_signs_0_r   = {2'b10,1'b0,3'd3,2'd0,coeff_signs_w[15:13]  }; 
		        ctx_pair_coeff_signs_1_r   = {2'b01,1'b0,8'hff                           }; 
		        ctx_pair_coeff_signs_2_r   = {2'b01,1'b0,8'hff                           }; 
		        ctx_pair_coeff_signs_3_r   = {2'b01,1'b0,8'hff                           }; 
		end 
        5'd4  : begin 
		        ctx_pair_coeff_signs_0_r   = {2'b10,1'b0,3'd4,1'd0,coeff_signs_w[15:12]  }; 
		        ctx_pair_coeff_signs_1_r   = {2'b01,1'b0,8'hff                           }; 
		        ctx_pair_coeff_signs_2_r   = {2'b01,1'b0,8'hff                           }; 
		        ctx_pair_coeff_signs_3_r   = {2'b01,1'b0,8'hff                           }; 
		end                                                                                          
        5'd5  : begin                                                                                
		        ctx_pair_coeff_signs_0_r  = {2'b10,1'b0,3'd1,4'd0,coeff_signs_w[15    ]  }; 		  
		        ctx_pair_coeff_signs_1_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[14:11 ]  }; 
		        ctx_pair_coeff_signs_2_r  = {2'b01,1'b0,8'hff                            };  
		        ctx_pair_coeff_signs_3_r  =	{2'b01,1'b0,8'hff                            }; 
	    end                                                                                       
        5'd6  : begin                                                                                
		        ctx_pair_coeff_signs_0_r  = {2'b10,1'b0,3'd2,3'd0,coeff_signs_w[15:14]   }; 		  
		        ctx_pair_coeff_signs_1_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[13:10]   }; 
		        ctx_pair_coeff_signs_2_r  = {2'b01,1'b0,8'hff                            };  
		        ctx_pair_coeff_signs_3_r  =	{2'b01,1'b0,8'hff                            }; 
	    end                                                                                       
        5'd7  : begin                                                                                
		        ctx_pair_coeff_signs_0_r  = {2'b10,1'b0,3'd3,2'd0,coeff_signs_w[15:13]   }; 		  
		        ctx_pair_coeff_signs_1_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[12:9 ]   }; 
		        ctx_pair_coeff_signs_2_r  = {2'b01,1'b0,8'hff                            };  
		        ctx_pair_coeff_signs_3_r  =	{2'b01,1'b0,8'hff                            }; 
	    end                                                                                        
        5'd8  : begin                                                                                
		        ctx_pair_coeff_signs_0_r  = {2'b10,1'b0,3'd4,1'd0,coeff_signs_w[15:12]   }; 		  
		        ctx_pair_coeff_signs_1_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[11:8 ]   }; 
		        ctx_pair_coeff_signs_2_r  = {2'b01,1'b0,8'hff                            };  
		        ctx_pair_coeff_signs_3_r  =	{2'b01,1'b0,8'hff                            }; 
	    end                                                                              
        5'd9  : begin                                                                                
		        ctx_pair_coeff_signs_0_r  = {2'b10,1'b0,3'd1,4'd0,coeff_signs_w[15   ]   }; 		  
		        ctx_pair_coeff_signs_1_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[14:11]   }; 
		        ctx_pair_coeff_signs_2_r  = {2'b10,1'b0,3'd4,1'd0,coeff_signs_w[10:7 ]   };  
		        ctx_pair_coeff_signs_3_r  =	{2'b01,1'b0,8'hff                            }; 
	    end  
        5'd10 : begin                                                                               
		        ctx_pair_coeff_signs_0_r  = {2'b10,1'b0,3'd2,3'd0,coeff_signs_w[15:14]   }; 		  
		        ctx_pair_coeff_signs_1_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[13:10]   }; 
		        ctx_pair_coeff_signs_2_r  = {2'b10,1'b0,3'd4,1'd0,coeff_signs_w[9:6  ]   };  
		        ctx_pair_coeff_signs_3_r  =	{2'b01,1'b0,8'hff                            }; 
	    end  
        5'd11 : begin                                                                               
		        ctx_pair_coeff_signs_0_r  = {2'b10,1'b0,3'd3,2'd0,coeff_signs_w[15:13]   }; 		  
		        ctx_pair_coeff_signs_1_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[12:9 ]   }; 
		        ctx_pair_coeff_signs_2_r  = {2'b10,1'b0,3'd4,1'd0,coeff_signs_w[8:5  ]   };  
		        ctx_pair_coeff_signs_3_r  =	{2'b01,1'b0,8'hff                            }; 
	    end  
        5'd12 : begin                                                                               
		        ctx_pair_coeff_signs_0_r  = {2'b10,1'b0,3'd4,1'd0,coeff_signs_w[15:12]   }; 		  
		        ctx_pair_coeff_signs_1_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[11:8 ]   }; 
		        ctx_pair_coeff_signs_2_r  = {2'b10,1'b0,3'd4,1'd0,coeff_signs_w[ 7:4 ]   };  
		        ctx_pair_coeff_signs_3_r  =	{2'b01,1'b0,8'hff                            }; 
	    end                                                                         
		5'd13 : begin                                                                                                 
		        ctx_pair_coeff_signs_0_r  = {2'b10,1'b0,3'd1,4'd0,coeff_signs_w[15   ]   }; 		  
		        ctx_pair_coeff_signs_1_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[14:11]   }; 
		        ctx_pair_coeff_signs_2_r  = {2'b10,1'b0,3'd4,1'd0,coeff_signs_w[10:7 ]   };  
		        ctx_pair_coeff_signs_3_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[6:3  ]   }; 
	    end                                                                     
		5'd14 : begin                                                                               
		        ctx_pair_coeff_signs_0_r  = {2'b10,1'b0,3'd2,3'd0,coeff_signs_w[15:14]   }; 		  
		        ctx_pair_coeff_signs_1_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[13:10]   }; 
		        ctx_pair_coeff_signs_2_r  = {2'b10,1'b0,3'd4,1'd0,coeff_signs_w[ 9:6 ]   };  
		        ctx_pair_coeff_signs_3_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[ 5:2 ]   }; 
	    end                                                                     
		5'd15 : begin                                                                               
		        ctx_pair_coeff_signs_0_r  = {2'b10,1'b0,3'd3,2'd0,coeff_signs_w[15:13]   }; 		  
		        ctx_pair_coeff_signs_1_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[12:9 ]   }; 
		        ctx_pair_coeff_signs_2_r  = {2'b10,1'b0,3'd4,1'd0,coeff_signs_w[ 8:5 ]   };  
		        ctx_pair_coeff_signs_3_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[ 4:1 ]   }; 
	    end                                                                      
        5'd16 : begin                                                                               
		        ctx_pair_coeff_signs_0_r  = {2'b10,1'b0,3'd4,1'd0,coeff_signs_w[15:12]   }; 		  
		        ctx_pair_coeff_signs_1_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[11:8 ]   }; 
		        ctx_pair_coeff_signs_2_r  = {2'b10,1'b0,3'd4,1'd0,coeff_signs_w[ 7:4 ]   };  
		        ctx_pair_coeff_signs_3_r  =	{2'b10,1'b0,3'd4,1'd0,coeff_signs_w[ 3:0 ]   }; 
	    end  		
	  default : begin 
		        ctx_pair_coeff_signs_0_r = {2'b01,1'b0,8'hff                             }; 
		        ctx_pair_coeff_signs_1_r = {2'b01,1'b0,8'hff                             }; 
		        ctx_pair_coeff_signs_2_r = {2'b01,1'b0,8'hff                             }; 
		        ctx_pair_coeff_signs_3_r = {2'b01,1'b0,8'hff                             }; 	  
	  end 
    endcase
end 

//-----------------------------------------------------------------------------------------------------------------------------
//
//              coeff_remain_exgolomb:  cycles , coeff_cnt_i = 5'd11 + non_zero_num_r, max is 11+16=26 
//
//-----------------------------------------------------------------------------------------------------------------------------     
wire  [ 2:0  ]          ctx_pair_valid_num_w                                                             ;                                         

reg   [ 15:0 ]          coded_symbol_r                                                                   ;
reg   [  2:0 ]          go_rice_param_r                                                                  ;
reg                     coded_flag_r                                                                     ;

wire  [  1:0 ]          base_level_0_w    , base_level_1_w    , base_level_2_w    ,  base_level_3_w      ; // coeff_cnt_i = 5'd4 
wire  [  1:0 ]          base_level_4_w    , base_level_5_w    , base_level_6_w    ,  base_level_7_w      ; // coeff_cnt_i = 5'd4 
reg   [  1:0 ]          base_level_8_r    , base_level_9_r    , base_level_10_r   ,  base_level_11_r     ; // coeff_cnt_i = 5'd5 
reg   [  1:0 ]          base_level_12_r   , base_level_13_r   , base_level_14_r   ,  base_level_15_r     ; // coeff_cnt_i = 5'd4   

wire  [  1:0 ]          coded_flag_0_w    , coded_flag_1_w    , coded_flag_2_w    ,  coded_flag_3_w      ; 
wire  [  1:0 ]          coded_flag_4_w    , coded_flag_5_w    , coded_flag_6_w    ,  coded_flag_7_w      ; 
wire  [  1:0 ]          coded_flag_8_w    , coded_flag_9_w    , coded_flag_10_w   ,  coded_flag_11_w     ; 
wire  [  1:0 ]          coded_flag_12_w   , coded_flag_13_w   , coded_flag_14_w   ,  coded_flag_15_w     ; 

wire  [ 15:0 ]          coded_symbol_0_w  , coded_symbol_1_w  , coded_symbol_2_w  ,  coded_symbol_3_w    ; 
wire  [ 15:0 ]          coded_symbol_4_w  , coded_symbol_5_w  , coded_symbol_6_w  ,  coded_symbol_7_w    ; 
wire  [ 15:0 ]          coded_symbol_8_w  , coded_symbol_9_w  , coded_symbol_10_w ,  coded_symbol_11_w   ; 
wire  [ 15:0 ]          coded_symbol_12_w , coded_symbol_13_w , coded_symbol_14_w ,  coded_symbol_15_w   ; 

reg   [  2:0 ]          go_rice_param_0_r , go_rice_param_1_r , go_rice_param_2_r ,  go_rice_param_3_r   ; // coeff_cnt_i = 5'd7 
reg   [  2:0 ]          go_rice_param_4_r , go_rice_param_5_r , go_rice_param_6_r ,  go_rice_param_7_r   ; // coeff_cnt_i = 5'd6 
reg   [  2:0 ]          go_rice_param_8_r , go_rice_param_9_r , go_rice_param_10_r,  go_rice_param_11_r  ; // coeff_cnt_i = 5'd5 
reg   [  2:0 ]          go_rice_param_12_r, go_rice_param_13_r, go_rice_param_14_r,  go_rice_param_15_r  ; // coeff_cnt_i = 5'd4

reg                                         first_coeff_1_r   , first_coeff_2_r   ,  first_coeff_3_r     ; // coeff_cnt_i = 5'd7 
reg                     first_coeff_4_r   , first_coeff_5_r   , first_coeff_6_r   ,  first_coeff_7_r     ; // coeff_cnt_i = 5'd8 


// base_level_15_r 
always @* begin 
    if(abs_coeff_15_w && !abs_coeff_15_w)
        base_level_15_r  =  2'd0                                                                         ;
    else 
        base_level_15_r  =  2'd3                                                                         ;
end 

// base_level_14_r 
always @* begin 
    if(abs_coeff_15_w[15:1])
        base_level_14_r  =  2'd2                                                                         ;
    else 
        base_level_14_r  =  2'd3                                                                         ;
end 

// base_level_13_r
always @* begin 
    if(abs_coeff_14_w[15:1])
        base_level_13_r  = 2'd2                                                                          ;
    else 
        base_level_13_r  = 2'd2  +  base_level_14_r[0]                                                   ;
end 

// base_level_12_r
always @* begin 
    if(abs_coeff_13_w[15:1])
        base_level_12_r  = 2'd2                                                                          ;
    else 
        base_level_12_r  = 2'd2  +  base_level_13_r[0]                                                   ;
end 

// base_level_11_r
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
 	    base_level_11_r  <=   2'd0                                                                      ;
    else if(abs_coeff_12_w[15:1])
        base_level_11_r  <=   2'd2                                                                      ;
    else 
        base_level_11_r  <= 2'd2  +  base_level_12_r[0]                                                 ;
end 

// base_level_10_r
always @* begin 
    if(abs_coeff_11_w[15:1])
        base_level_10_r  = 2'd2                                                                          ;
    else 
        base_level_10_r  = 2'd2  +  base_level_11_r[0]                                                   ;
end 

// base_level_9_r
always @* begin 
    if(abs_coeff_10_w[15:1])
        base_level_9_r  = 2'd2                                                                          ;
    else 
        base_level_9_r  = 2'd2  +  base_level_10_r[0]                                                   ;
end 

// base_level_8_r
always @* begin 
    if(abs_coeff_9_w[15:1])
        base_level_8_r  = 2'd2                                                                          ;
    else 
        base_level_8_r  = 2'd2  +  base_level_9_r[0]                                                    ;
end 

assign    base_level_7_w     =     2'd1                                                                  ;
assign    base_level_6_w     =     2'd1                                                                  ;
assign    base_level_5_w     =     2'd1                                                                  ;
assign    base_level_4_w     =     2'd1                                                                  ;
assign    base_level_3_w     =     2'd1                                                                  ;
assign    base_level_2_w     =     2'd1                                                                  ;
assign    base_level_1_w     =     2'd1                                                                  ;
assign    base_level_0_w     =     2'd1                                                                  ;

assign    coded_flag_15_w    =(abs_coeff_15_w>=base_level_15_r)&&(non_zero_num_r      ); // >0
assign    coded_flag_14_w    =(abs_coeff_14_w>=base_level_14_r)&&(non_zero_num_r>4'd1 ); // >1 
assign    coded_flag_13_w    =(abs_coeff_13_w>=base_level_13_r)&&(non_zero_num_r[4:1] ); // >2
assign    coded_flag_12_w    =(abs_coeff_12_w>=base_level_12_r)&&(non_zero_num_r>5'd3 ); // >3
assign    coded_flag_11_w    =(abs_coeff_11_w>=base_level_11_r)&&(non_zero_num_r[4:2] ); // >4
assign    coded_flag_10_w    =(abs_coeff_10_w>=base_level_10_r)&&(non_zero_num_r>5'd5 ); // >5
assign    coded_flag_9_w     =(abs_coeff_9_w >=base_level_9_r )&&(non_zero_num_r>5'd6 ); // >6
assign    coded_flag_8_w     =(abs_coeff_8_w >=base_level_8_r )&&(non_zero_num_r>5'd7 ); // >7
assign    coded_flag_7_w     =(abs_coeff_7_w >=base_level_7_w )&&(non_zero_num_r[4:3] ); // >8
assign    coded_flag_6_w     =(abs_coeff_6_w >=base_level_6_w )&&(non_zero_num_r>5'd9 ); // >9
assign    coded_flag_5_w     =(abs_coeff_5_w >=base_level_5_w )&&(non_zero_num_r>5'd10); // >10
assign    coded_flag_4_w     =(abs_coeff_4_w >=base_level_4_w )&&(non_zero_num_r>5'd11); // >11
assign    coded_flag_3_w     =(abs_coeff_3_w >=base_level_3_w )&&(non_zero_num_r>5'd12); // >12
assign    coded_flag_2_w     =(abs_coeff_2_w >=base_level_2_w )&&(non_zero_num_r>5'd13); // >13
assign    coded_flag_1_w     =(abs_coeff_1_w >=base_level_1_w )&&(non_zero_num_r>5'd14); // >14
assign    coded_flag_0_w     =(abs_coeff_0_w >=base_level_0_w )&&(non_zero_num_r>5'd15); // >15 

assign    coded_symbol_15_w  =     abs_coeff_15_w   -   base_level_15_r                                  ;                       
assign    coded_symbol_14_w  =     abs_coeff_14_w   -   base_level_14_r                                  ; 
assign    coded_symbol_13_w  =     abs_coeff_13_w   -   base_level_13_r                                  ; 
assign    coded_symbol_12_w  =     abs_coeff_12_w   -   base_level_12_r                                  ; 
assign    coded_symbol_11_w  =     abs_coeff_11_w   -   base_level_11_r                                  ; 
assign    coded_symbol_10_w  =     abs_coeff_10_w   -   base_level_10_r                                  ; 
assign    coded_symbol_9_w   =     abs_coeff_9_w    -   base_level_9_r                                   ; 
assign    coded_symbol_8_w   =     abs_coeff_8_w    -   base_level_8_r                                   ; 
assign    coded_symbol_7_w   =     abs_coeff_7_w    -   base_level_7_w                                   ; 
assign    coded_symbol_6_w   =     abs_coeff_6_w    -   base_level_6_w                                   ; 
assign    coded_symbol_5_w   =     abs_coeff_5_w    -   base_level_5_w                                   ; 
assign    coded_symbol_4_w   =     abs_coeff_4_w    -   base_level_4_w                                   ; 
assign    coded_symbol_3_w   =     abs_coeff_3_w    -   base_level_3_w                                   ; 
assign    coded_symbol_2_w   =     abs_coeff_2_w    -   base_level_2_w                                   ; 
assign    coded_symbol_1_w   =     abs_coeff_1_w    -   base_level_1_w                                   ; 
assign    coded_symbol_0_w   =     abs_coeff_0_w    -   base_level_0_w                                   ; 
   
// go_rice_param_15_r   
always @* begin 
    if(abs_coeff_15_w && !abs_coeff_15_w)
        go_rice_param_15_r   =    3'd1                                                                   ;
	else 
        go_rice_param_15_r   =    3'd0                                                                   ;
end 

// go_rice_param_14_r
always @* begin 
    if(abs_coeff_15_w>8'b00000011 && coded_flag_15_w) 
		    go_rice_param_14_r  =   3'b001                                                               ;
	else 
	    go_rice_param_14_r      =   3'b000                                                               ;
end 

// go_rice_param_13_r
always @* begin 
    if(( abs_coeff_14_w>( ( (8'b00000001<<go_rice_param_14_r)<<1 )+(8'b00000001<<go_rice_param_14_r)) ) && coded_flag_14_w) begin 
        if(go_rice_param_14_r==3'b100)
            go_rice_param_13_r  =   3'b100                                                               ;
		else 
		    go_rice_param_13_r  =   go_rice_param_14_r  +  3'b001                                        ;
    end 
	else 
	    go_rice_param_13_r      =   go_rice_param_14_r                                                   ;
end 

// go_rice_param_12_r
always @* begin 
    if((abs_coeff_13_w>( ((8'b00000001<<go_rice_param_13_r)<<1 )+ (8'b00000001<<go_rice_param_13_r)))&&coded_flag_13_w ) begin 
        if(go_rice_param_13_r==3'b100)
            go_rice_param_12_r  =   3'b100                                                               ;
		else 
		    go_rice_param_12_r  =   go_rice_param_13_r  +  3'b001                                        ;
    end 
	else 
	    go_rice_param_12_r      =   go_rice_param_13_r                                                   ;
end 

// go_rice_param_11_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
	    go_rice_param_11_r     <=   3'd0                                                                 ; 
    else if((abs_coeff_12_w>( ((8'b00000001<<go_rice_param_12_r)<<1)+(8'b00000001<<go_rice_param_12_r)))&&coded_flag_12_w) begin 
        if(go_rice_param_12_r==3'b100)
            go_rice_param_11_r <=   3'b100                                                               ;
		else 
		    go_rice_param_11_r <=   go_rice_param_12_r  +  3'b001                                        ;
    end 
	else 
	    go_rice_param_11_r     <=   go_rice_param_12_r                                                   ;
end 

// go_rice_param_10_r
always @* begin 
    if(( abs_coeff_11_w>(((8'b00000001<<go_rice_param_11_r)<<1) + (8'b00000001<<go_rice_param_11_r))) && coded_flag_11_w) begin 
        if(go_rice_param_11_r==3'b100)
            go_rice_param_10_r  =   3'b100                                                               ;
		else 
		    go_rice_param_10_r  =   go_rice_param_11_r  +  3'b001                                        ;
    end 
	else 
	    go_rice_param_10_r      =   go_rice_param_11_r                                                   ;
end 

// go_rice_param_9_r
always @* begin 
    if( (abs_coeff_10_w>(((8'b00000001<<go_rice_param_10_r)<<1) + (8'b00000001<<go_rice_param_10_r)))&&coded_flag_10_w ) begin 
        if(go_rice_param_10_r==3'b100)
            go_rice_param_9_r   =   3'b100                                                               ;
		else 
		    go_rice_param_9_r   =   go_rice_param_10_r  +  3'b001                                        ;
    end 
	else 
	    go_rice_param_9_r       =   go_rice_param_10_r                                                   ;
end 

// go_rice_param_8_r
always @* begin 
    if( (abs_coeff_9_w>(((8'b00000001<<go_rice_param_9_r)<<1) + (8'b00000001<<go_rice_param_9_r)))&& coded_flag_9_w) begin 
        if(go_rice_param_9_r==3'b100)
            go_rice_param_8_r   =   3'b100                                                               ;
		else 
		    go_rice_param_8_r   =   go_rice_param_9_r  +  3'b001                                         ;
    end 
	else 
	    go_rice_param_8_r       =   go_rice_param_9_r                                                    ;
end 

// go_rice_param_7_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
	    go_rice_param_7_r      <=   3'd0                                                                 ; 
    else if( (abs_coeff_8_w>(((8'b00000001<<go_rice_param_8_r)<<1)+ (8'b00000001<<go_rice_param_8_r))) &&coded_flag_8_w) begin 
        if(go_rice_param_8_r==3'b100)
            go_rice_param_7_r  <=   3'b100                                                               ;
		else 
		    go_rice_param_7_r  <=   go_rice_param_8_r  +  3'b001                                         ;
    end 
	else 
	    go_rice_param_7_r      <=   go_rice_param_8_r                                                    ;
end 

// go_rice_param_6_r
always @* begin 
    if( (abs_coeff_7_w>(((8'b00000001<<go_rice_param_7_r)<<1) + (8'b00000001<<go_rice_param_7_r))) && coded_flag_7_w) begin 
        if(go_rice_param_7_r==3'b100)
            go_rice_param_6_r   =   3'b100                                                               ;
		else 
		    go_rice_param_6_r   =   go_rice_param_7_r  +  3'b001                                         ;
    end 
	else 
	    go_rice_param_6_r       =   go_rice_param_7_r                                                    ;
end 

// go_rice_param_5_r
always @* begin 
    if( (abs_coeff_6_w>(((8'b00000001<<go_rice_param_6_r)<<1) + (8'b00000001<<go_rice_param_6_r))) && coded_flag_6_w) begin 
        if(go_rice_param_6_r==3'b100)
            go_rice_param_5_r   =   3'b100                                                               ;
		else 
		    go_rice_param_5_r   =   go_rice_param_6_r  +  3'b001                                         ;
    end 
	else 
	    go_rice_param_5_r       =   go_rice_param_6_r                                                    ;
end 

// go_rice_param_4_r
always @* begin 
    if( (abs_coeff_5_w>(((8'b00000001<<go_rice_param_5_r)<<1) + (8'b00000001<<go_rice_param_5_r)) ) && coded_flag_5_w) begin 
        if(go_rice_param_5_r==3'b100)
            go_rice_param_4_r   =   3'b100                                                               ;
		else 
		    go_rice_param_4_r   =   go_rice_param_5_r  +  3'b001                                         ;
    end 
	else 
	    go_rice_param_4_r       =   go_rice_param_5_r                                                    ;
end 

// go_rice_param_3_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
	    go_rice_param_3_r      <=   3'd0                                                                 ; 
    else if( (abs_coeff_4_w>(((8'b00000001<<go_rice_param_4_r)<<1) + (8'b00000001<<go_rice_param_4_r)))&&coded_flag_4_w) begin 
        if(go_rice_param_4_r==3'b100)
            go_rice_param_3_r  <=   3'b100                                                               ;
		else 
		    go_rice_param_3_r  <=   go_rice_param_4_r  +  3'b001                                         ;
    end 
	else 
	    go_rice_param_3_r      <=   go_rice_param_4_r                                                    ;
end 

// go_rice_param_2_r
always @* begin 
    if( (abs_coeff_3_w>(((8'b00000001<<go_rice_param_3_r)<<1) + (8'b00000001<<go_rice_param_3_r))) && coded_flag_3_w) begin 
        if(go_rice_param_3_r==3'b100)
            go_rice_param_2_r   =   3'b100                                                               ;
		else 
		    go_rice_param_2_r   =   go_rice_param_3_r  +  3'b001                                         ;
    end 
	else 
	    go_rice_param_2_r       =   go_rice_param_3_r                                                    ;
end 

// go_rice_param_1_r
always @* begin 
    if( (abs_coeff_2_w>(((8'b00000001<<go_rice_param_2_r)<<1) + (8'b00000001<<go_rice_param_2_r))) && coded_flag_2_w) begin 
        if(go_rice_param_2_r==3'b100)
            go_rice_param_1_r   =   3'b100                                                               ;
		else 
		    go_rice_param_1_r   =   go_rice_param_2_r  +  3'b001                                         ;
    end 
	else 
	    go_rice_param_1_r       =   go_rice_param_2_r                                                    ;
end 

// go_rice_param_0_r
always @* begin 
    if( (abs_coeff_1_w>(((8'b00000001<<go_rice_param_1_r)<<1) + (8'b00000001<<go_rice_param_1_r))) && coded_flag_1_w) begin 
        if(go_rice_param_1_r==3'b100)
            go_rice_param_0_r   =   3'b100                                                               ;
		else 
		    go_rice_param_0_r   =   go_rice_param_1_r  +  3'b001                                         ;
    end 
	else 
	    go_rice_param_0_r       =   go_rice_param_1_r                                                    ;
end 

// first_coeff_1_r 
always @* begin 
    if(abs_coeff_15_w[15:1])
        first_coeff_1_r  =      0                                              ;
	else 
	    first_coeff_1_r  =      2'd3                                           ;
end  


// coded_symbol_r   go_rice_param_r 
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
	    coded_flag_r         <=       1'b0                                                               ;
        coded_symbol_r       <=       16'd0                                                              ;
        go_rice_param_r      <=       3'd0                                                               ;
    end 
    else begin 
        case(coeff_cnt_i)
            5'd12 : begin 
			        coded_flag_r         <=       coded_flag_15_w                                        ;
                    coded_symbol_r       <=       coded_symbol_15_w                                      ;
					go_rice_param_r      <=       go_rice_param_15_r                                     ; 
            end 
            5'd13 : begin 
			        coded_flag_r         <=       coded_flag_14_w                                        ;
                    coded_symbol_r       <=       coded_symbol_14_w                                      ;
					go_rice_param_r      <=       go_rice_param_14_r                                     ; 
            end   
            5'd14: begin 
			        coded_flag_r         <=       coded_flag_13_w                                        ;
                    coded_symbol_r       <=       coded_symbol_13_w                                      ;
					go_rice_param_r      <=       go_rice_param_13_r                                     ; 
            end 
            5'd15: begin 
			        coded_flag_r         <=       coded_flag_12_w                                        ;
                    coded_symbol_r       <=       coded_symbol_12_w                                      ;
					go_rice_param_r      <=       go_rice_param_12_r                                     ; 
            end   
            5'd16: begin 
			        coded_flag_r         <=       coded_flag_11_w                                        ;
                    coded_symbol_r       <=       coded_symbol_11_w                                      ;
					go_rice_param_r      <=       go_rice_param_11_r                                     ; 
            end 
            5'd17: begin 
			        coded_flag_r         <=       coded_flag_10_w                                        ;
                    coded_symbol_r       <=       coded_symbol_10_w                                      ;
					go_rice_param_r      <=       go_rice_param_10_r                                     ; 
            end   
            5'd18: begin 
			        coded_flag_r         <=       coded_flag_9_w                                         ;
                    coded_symbol_r       <=       coded_symbol_9_w                                       ;
					go_rice_param_r      <=       go_rice_param_9_r                                      ; 
            end 
            5'd19: begin 
			        coded_flag_r         <=       coded_flag_8_w                                         ;
                    coded_symbol_r       <=       coded_symbol_8_w                                       ;
					go_rice_param_r      <=       go_rice_param_8_r                                      ; 
            end   
            5'd20: begin 
			        coded_flag_r         <=       coded_flag_7_w                                         ;
                    coded_symbol_r       <=       coded_symbol_7_w                                       ;
					go_rice_param_r      <=       go_rice_param_7_r                                      ; 
            end 
            5'd21: begin 
			        coded_flag_r         <=       coded_flag_6_w                                         ;
                    coded_symbol_r       <=       coded_symbol_6_w                                       ;
					go_rice_param_r      <=       go_rice_param_6_r                                      ; 
            end   
            5'd22 : begin 
			        coded_flag_r         <=       coded_flag_5_w                                         ;
                    coded_symbol_r       <=       coded_symbol_5_w                                       ;
					go_rice_param_r      <=       go_rice_param_5_r                                      ; 
            end 
            5'd23: begin 
			        coded_flag_r         <=       coded_flag_4_w                                         ;
                    coded_symbol_r       <=       coded_symbol_4_w                                       ;
					go_rice_param_r      <=       go_rice_param_4_r                                      ; 
            end   
            5'd24: begin 
			        coded_flag_r         <=       coded_flag_3_w                                         ;
                    coded_symbol_r       <=       coded_symbol_3_w                                       ;
					go_rice_param_r      <=       go_rice_param_3_r                                      ; 
            end 
            5'd25: begin 
			        coded_flag_r         <=       coded_flag_2_w                                         ;
                    coded_symbol_r       <=       coded_symbol_2_w                                       ;
					go_rice_param_r      <=       go_rice_param_2_r                                      ; 
            end   
            5'd26: begin 
			        coded_flag_r         <=       coded_flag_1_w                                         ;
                    coded_symbol_r       <=       coded_symbol_1_w                                       ;
					go_rice_param_r      <=       go_rice_param_1_r                                      ; 
            end 
            5'd27: begin 
			        coded_flag_r         <=       coded_flag_0_w                                         ;
                    coded_symbol_r       <=       coded_symbol_0_w                                       ;
					go_rice_param_r      <=       go_rice_param_0_r                                      ; 
            end   
         default : begin 
		            coded_flag_r         <=       1'b0                                                   ;
                    coded_symbol_r       <=       16'd0                                                  ;
					go_rice_param_r      <=       3'd0                                                   ; 
            end  
        endcase 
    end 
end 

cabac_binari_cre  cabac_binari_cre_u0(
                    .clk                        ( clk                         ),
                    .rst_n                      ( rst_n                       ),
					.coded_flag_i               ( coded_flag_r                ),
                    .coded_symbol_i             ( coded_symbol_r              ),
                    .go_param_i                 ( go_rice_param_r             ),
                    .ctx_pair_cre_0_o           ( ctx_pair_cre_0_w            ),
                    .ctx_pair_cre_1_o           ( ctx_pair_cre_1_w            ),
                    .ctx_pair_cre_2_o           ( ctx_pair_cre_2_w            ),
                    .ctx_pair_cre_3_o           ( ctx_pair_cre_3_w            ),
                    .ctx_pair_valid_num_o       ( ctx_pair_valid_num_w        )				
                );

//-----------------------------------------------------------------------------------------------------------------------------
//
//              coeff_remain_exgolomb:  cycles , coeff_cnt_i = 5'd11... 
//
//-----------------------------------------------------------------------------------------------------------------------------
reg  coeff_4x4_done_r                                             ;

always @* begin 
    if( (c1_final_r!=0)&& (non_zero_num_r<5'd9) && (coeff_cnt_i==5'd14) )
	    coeff_4x4_done_r  =   1'b1                                ;
    else if( (coeff_cnt_i== (5'd14+non_zero_num_r) )||(coeff_cnt_i==5'd31) )
        coeff_4x4_done_r  =   1'b1                                ; 
    else 
        coeff_4x4_done_r  =   1'b0                                ;
end 		


assign c1_inner_o            =  c1_final_r                        ; 
assign coeff_4x4_done_o      =  coeff_4x4_done_r                  ;

always @* begin 
    case(coeff_cnt_i)
        5'd3    ,
        5'd4    ,
        5'd5    ,
        5'd6    ,
        5'd7    ,
        5'd8    ,
        5'd9    ,
		5'd10   : begin 
                ctx_pair_coeff_0_o  = ctx_pair_scf_0_r            ;
                ctx_pair_coeff_1_o  = ctx_pair_scf_1_r            ;
                ctx_pair_coeff_2_o  = {2'b01,1'b0,8'hff}          ;
                ctx_pair_coeff_3_o  = {2'b01,1'b0,8'hff}          ;  
                ctx_pair_valid_num_o= 3'd2                        ;				
  	    end 
		5'd11   : begin 
		        ctx_pair_coeff_0_o  = ctx_pair_coeff_gt1_0_w      ;
		        ctx_pair_coeff_1_o  = ctx_pair_coeff_gt1_1_w      ;
		        ctx_pair_coeff_2_o  = ctx_pair_coeff_gt1_2_w      ;
		        ctx_pair_coeff_3_o  = ctx_pair_coeff_gt1_3_w      ;
                ctx_pair_valid_num_o= 3'd4                        ;		
		end 
		5'd12   : begin 
		        ctx_pair_coeff_0_o  = ctx_pair_coeff_gt1_4_w      ;
		        ctx_pair_coeff_1_o  = ctx_pair_coeff_gt1_5_w      ;
		        ctx_pair_coeff_2_o  = ctx_pair_coeff_gt1_6_w      ;
		        ctx_pair_coeff_3_o  = ctx_pair_coeff_gt1_7_w      ;		
                ctx_pair_valid_num_o= 3'd4                        ;						
		end 
		5'd13   : begin 
		        ctx_pair_coeff_0_o  = ctx_pair_coeff_gt2_r        ;
		        ctx_pair_coeff_1_o  = {2'b01,1'b0,8'hff}          ;
		        ctx_pair_coeff_2_o  = {2'b01,1'b0,8'hff}          ;
		        ctx_pair_coeff_3_o  = {2'b01,1'b0,8'hff}          ;		
                ctx_pair_valid_num_o= 3'd1                        ;				
		end 
		5'd14  :begin 
		        ctx_pair_coeff_0_o  = ctx_pair_coeff_signs_0_r    ;
		        ctx_pair_coeff_1_o  = ctx_pair_coeff_signs_1_r    ;
		        ctx_pair_coeff_2_o  = ctx_pair_coeff_signs_2_r    ;
		        ctx_pair_coeff_3_o  = ctx_pair_coeff_signs_3_r    ;		
                ctx_pair_valid_num_o= 3'd4                        ;			        
		end 
		5'd15,5'd16,5'd17,5'd18,
		5'd19,5'd20,5'd21,5'd22,
		5'd23,5'd24,5'd25,5'd26,
		5'd27,5'd28,5'd29,5'd30: begin 
                ctx_pair_coeff_0_o  =  ctx_pair_cre_0_w           ;
                ctx_pair_coeff_1_o  =  ctx_pair_cre_1_w           ;
                ctx_pair_coeff_2_o  =  ctx_pair_cre_2_w           ;
                ctx_pair_coeff_3_o  =  ctx_pair_cre_3_w           ;  
                ctx_pair_valid_num_o=  ctx_pair_valid_num_w       ;						
        end
		default : begin 
		        ctx_pair_coeff_0_o  =  {2'b01,1'b0,8'hff}         ;
		        ctx_pair_coeff_1_o  =  {2'b01,1'b0,8'hff}         ;
		        ctx_pair_coeff_2_o  =  {2'b01,1'b0,8'hff}         ;
		        ctx_pair_coeff_3_o  =  {2'b01,1'b0,8'hff}         ;
		        ctx_pair_valid_num_o=  3'd0                       ;
		end 
	endcase
end 



endmodule  

