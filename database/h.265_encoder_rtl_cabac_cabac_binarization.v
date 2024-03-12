//-----------------------------------------------------------------------------------------------------------------------------
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
// Filename       : cabac_binarization.v
// Author         : chewein
// Created        : 2014-9-9
// Description    : syntax element binarization
//               
// $Id$ 
//-----------------------------------------------------------------------------------------------------------------------------      
`include "enc_defines.v"

module	cabac_binarization(
				//input
				clk								,
				rst_n							,	
				cabac_start_i					,
				slice_type_i					,
				mb_x_total_i					,
				mb_y_total_i					,
				mb_x_i							,
				mb_y_i							,
                param_qp_i                      ,// QP 
				sao_i                           ,
				luma_mode_i  			        ,
				chroma_mode_i                   ,  
				
				inter_cu_part_size_i			,
				merge_flag_i                    ,
				merge_idx_i                     ,
				
				cu_split_flag_i					,
				cu_skip_flag_i                  ,
				
				luma_cbf_i						,
				cr_cbf_i						,
				cb_cbf_i						,
				
				lcu_qp_i						,
				cu_mvd_i						,	
//				mvd_idx_i                       ,
				coeff_data_i					,	
				
				table_build_end_i				,	
				no_bit_flag_i					,				

				//output                           
				slice_init_flag_o				,
				
				cu_luma_mode_ren_o              , 
				cu_luma_mode_raddr_o            , 
				cu_chroma_mode_ren_o            ,
				cu_chroma_mode_raddr_o          ,
				
				cu_mvd_ren_o                    ,
				cu_mvd_raddr_o					,
				cu_coeff_raddr_o				,
				cu_coeff_ren_o					,
				
				cabac_mb_done_o					,
                cabac_slice_done_o				,
				coeff_type_o                    ,
                
                binary_pair_0_o					,
                binary_pair_1_o					,
                binary_pair_2_o					,
                binary_pair_3_o					,
				binary_pair_valid_num_o         ,
                cabac_curr_state_o		
);

// -----------------------------------------------------------------------------------------------------------------------------
//
//		INPUT and OUTPUT DECLARATION
//
// -----------------------------------------------------------------------------------------------------------------------------
//ctrl info
input								     clk					; // clock signal
input								     rst_n					; // reset signal, low active
input								     cabac_start_i			; // cabac start signal, pulse signal
input								     slice_type_i			; // slice type, (`SLICE_TYPE_I):1, (`SLICE_TYPE_P):0
input	[(`PIC_X_WIDTH)-1:0]		     mb_x_total_i			; // mb_x_total_i
input	[(`PIC_Y_WIDTH)-1:0]		     mb_y_total_i			; // mb_y_total_i
input	[(`PIC_X_WIDTH)-1:0]		     mb_x_i					; // mb_x_i
input	[(`PIC_Y_WIDTH)-1:0]		     mb_y_i					; // mb_y_i
input   [5:0]						     param_qp_i    	       ; // QP 

// sao IF 
input [61:0]					    	 sao_i                  ; // {merge_top,merge_left,{sao_type,sao_subIdx,sao_offsetx4}{chroma,luma}}
//intra info				                         	          
input	[23:0]						     luma_mode_i            ; // intra luma mode  , 6 bits for each 8x8 cu in z-scan , 64x64 = [5:0]
input   [23:0]                           chroma_mode_i          ; // intra luma mode  , 6 bits for each 4x4 cu in z-scan , the first 4x4 cu is [1535:1531]
//inter info						     			                   
input	[(`INTER_CU_INFO_LEN)-1:0]       inter_cu_part_size_i	; // inter partition size ,INTER_CU_INFO_LEN = 170
input   [ 84:0]                          merge_flag_i           ; 
input   [255:0]                          merge_idx_i            ;  
// split and skip info							     		                   
input	[84:0]						     cu_split_flag_i		; // cu split flag,[0]:64x64, [1:4]:32x32, [5:20]:16x16,[6:84]:8x8 , if not split into 8x8 , should be equal zero , cu_luma_mode_left_0_w
input   [84:0]                           cu_skip_flag_i         ; // cu skip  flag,[0]:64x64, [1:4]:32x32, [5:20]:16x16,[6:84]:8x8
// cbf info                                                       
input	[`LCU_SIZE*`LCU_SIZE/16-1:0]	 luma_cbf_i				; // z-scan, reverse order , 256 bits , [0] is the last 4x4 cu ,[255] is the first 4x4 cu 
input	[`LCU_SIZE*`LCU_SIZE/16-1:0]	 cr_cbf_i				; // z-scan, reverse order , 64  bits , 
input	[`LCU_SIZE*`LCU_SIZE/16-1:0]	 cb_cbf_i				; // z-scan, reverse order , 64  bits , 

input	[ 5:0]						     lcu_qp_i				; // lcu of qp
// mvd and coeff                                                  
input	[(2*`MVD_WIDTH) :0]			     cu_mvd_i				; // // {mvd_idx,mvd_x & mvd_y} , FMV_WIDTH  = 10 
//input   [383:0]                          mvd_idx_i              ;
input	[255:0]						     coeff_data_i			; // coeff data of a 4x4 block,a coeff is 16 bits 

// controller signals                                             
input								     table_build_end_i		; // table build end flag
input								     no_bit_flag_i			; 

output  							     slice_init_flag_o	    ; // slice init flag

output                  				 cu_luma_mode_ren_o     ;
output   [  5:0]	         			 cu_luma_mode_raddr_o   ; 
output        			                 cu_chroma_mode_ren_o   ;
output   [  3:0]				         cu_chroma_mode_raddr_o ;

output                                   cu_mvd_ren_o           ; 
output	 [ 5:0]						     cu_mvd_raddr_o			; // address of inter mvd 
output								     cu_coeff_ren_o			; // read coefficient enable
output	 [ 8:0]						     cu_coeff_raddr_o		; // address of coefficient

output								     cabac_mb_done_o		; // LCU done flag
output				                     cabac_slice_done_o		; // slice done flag
output  [1:0]                            coeff_type_o           ; 

output	 [10:0]		                     binary_pair_0_o		; // binary pair {coding_mode , bin , ctx_idx(xxx_xxxxxx)}
output	 [10:0]		                     binary_pair_1_o		; // binary pair {coding_mode , bin , ctx_idx(xxx_xxxxxx)}
output	 [10:0]		                     binary_pair_2_o		; // binary pair {coding_mode , bin , ctx_idx(xxx_xxxxxx)}
output	 [10:0]		                     binary_pair_3_o		; // binary pair {coding_mode , bin , ctx_idx(xxx_xxxxxx)}

output	 [2:0]		                     binary_pair_valid_num_o;	
output	 [3:0]  					     cabac_curr_state_o		;	

reg      [10:0]                          binary_pair_0_o        ;  
reg      [10:0]                          binary_pair_1_o        ;  
reg      [10:0]                          binary_pair_2_o        ;  
reg      [10:0]                          binary_pair_3_o        ;  

reg	   	 [2:0]		                     binary_pair_valid_num_o;	

reg     							     slice_init_flag_o	    ; // slice init flag

reg                     				 cu_luma_mode_ren_o     ;
reg      [ 5:0]	         			     cu_luma_mode_raddr_o   ; 
reg           			                 cu_chroma_mode_ren_o   ;
reg      [ 3:0]				             cu_chroma_mode_raddr_o ;

// -----------------------------------------------------------------------------------------------------------------------------
//
//		parameter declaration 
//
// -----------------------------------------------------------------------------------------------------------------------------
parameter			                CU_64x64		= 	4'd0    ,
						            CU_32x32		=	4'd1    ,
						            CU_16x16		=	4'd2    ,
						            CU_8x8			=	4'd3    ,
						            LCU_IDLE		=	4'd4    ,
						            CU_SPLIT		=	4'd5    ,
						            LCU_END			=	4'd6    ,
						            LCU_INIT		=	4'd7    ,   
						            LCU_SAO  		=	4'd8    ;   
// -----------------------------------------------------------------------------------------------------------------------------
//
//		wire declaration  
//
// -----------------------------------------------------------------------------------------------------------------------------
wire                                cu_done_w                   ;
// for an cu                        
wire                                cu_start_w                  ;
wire      [6:0]                     cu_idx_w                    ;
wire      [1:0]                     cu_depth_w                  ; // 0:64x64  1:32x32  2:16x16 3:8x8
wire                                cu_sub_div_w                ; // 1 bit for a cu , 1: split but not encoding, 0: not split but encoding 
wire                                cu_slice_type_w             ; // 1 bit for a cu , 1: I    ,0:P 

wire                                cu_skip_flag_w              ;
wire      [ 1:0]                    cu_inter_part_mode_w        ; // 2 bit for a cu , 8x8 cu only support 2Nx2N 
wire      [ 3:0]                    cu_merge_flag_w             ; // 1 bit for a cu 
wire      [15:0]                    cu_merge_idx_w              ; // 4 bit for a cu 
wire      [23:0]                    cu_luma_pred_mode_w         ; // 6 bits for a 8x8 cu 
wire      [ 5:0]                    cu_chroma_pred_mode_w       ; // 6 bits for a 8x8 cu 

wire      [ 3:0]                    cu_cbf_y_w                  ; // z-scan for sub cu ,[3] is the first sub cu 
wire      [ 3:0]                    cu_cbf_u_w                  ; // z-scan for sub cu ,[3] is the first sub cu 
wire      [ 3:0]                    cu_cbf_v_w                  ; // z-scan for sub cu ,[3] is the first sub cu 

wire      [5:0]                     cu_qp_curr_w                ;         

wire                                last_cu_flag_w              ;

// top and left data 
wire      [1:0]                     cu_depth_left_w             ;
wire      [1:0]                     cu_depth_top_w              ;

wire                                cu_skip_top_flag_w          ;
wire                                cu_skip_left_flag_w         ; 

wire      [23:0]                    cu_luma_pred_top_mode_w     ;
wire      [23:0]                    cu_luma_pred_left_mode_w    ;
wire      [5:0]                     cu_qp_last_w                ;
wire                                cu_qp_nocoded_w             ;
// mvd data 
reg       [(4*`MVD_WIDTH+5):0]  	mb_mvd_rdata_r	            ; // Inter mvd read data 
// coeff data                                           
wire      [1:0]                     coeff_type_w                ;      
wire      [`COEFF_WIDTH*16-1:0]     tq_rdata_w		            ; // coeff data tq read data
wire  								tq_ren_w        			; // read coefficient enable
wire  	  [ 8:0]					tq_raddr_w          		; // address of coefficient

wire                                cu_qp_coded_flag_w          ;

wire    [10:0]                      cu_binary_pair_0_w		    ;
wire    [10:0]                      cu_binary_pair_1_w		    ;
wire    [10:0]                      cu_binary_pair_2_w		    ;
wire    [10:0]                      cu_binary_pair_3_w		    ;
wire    [ 2:0]                      cu_binary_pair_valid_num_w  ; 

// -----------------------------------------------------------------------------------------------------------------------------
//
//		reg declaration : calculation cu address 
//
// -----------------------------------------------------------------------------------------------------------------------------

reg        [3:0]                     lcu_curr_state_r           ;
reg        [3:0]                     lcu_next_state_r           ;
reg                                  cu_done_r                  ;

reg        [6:0]                     cu_idx_r                   ;

reg                                  cu_split_flag_r            ;
reg        [1:0]                     cu_depth_r                 ;

wire       [6:0]		             cu_idx_minus1_w		    ; //  cu index minus 1
wire       [6:0]		             cu_idx_minus5_w		    ; //  cu index minus 5
wire       [6:0]		             cu_idx_minus21_w	        ; //  cu index minus 21
wire       [6:0]		             cu_idx_plus1_w		        ; //  cu index plus 1
wire       [6:0]		             cu_idx_deep_plus1_w	    ; //  cu index of deep depth plus 1
wire       [6:0]		             cu_idx_shift1_w		    ; //  cu_idx_r << 1;
wire       [6:0]		             cu_idx_shift1_plus1_w      ; //  (cu_idx_r<<1)+1



assign	cu_idx_minus1_w  = cu_idx_r - 7'd1              ;
assign	cu_idx_minus5_w  = cu_idx_r - 7'd5              ;
assign	cu_idx_minus21_w = cu_idx_r - 7'd21             ;

assign	cu_idx_plus1_w      = cu_idx_r + 7'd1           ;
assign	cu_idx_deep_plus1_w = (cu_idx_r<<2) + 7'd1      ;

assign	cu_idx_shift1_w       = cu_idx_r << 1           ;
assign 	cu_idx_shift1_plus1_w = cu_idx_shift1_w + 7'd1  ;

//  cu_done_r
always @* begin
	case(lcu_curr_state_r)
		LCU_IDLE:	cu_done_r = 1'd0      ;
		CU_SPLIT:   cu_done_r = 1'd1      ;
		CU_64x64,
		CU_32x32,   
		CU_16x16,   
		CU_8x8	:	cu_done_r = cu_done_w ;
		LCU_END	:   cu_done_r = 1'd0      ;
		default :   cu_done_r = 1'd0      ;    
	endcase
end

// cu_idx_r 
always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
    	cu_idx_r <= 0;
    else if(cu_done_r) begin   
    	if(lcu_curr_state_r==CU_SPLIT) begin
    		if(cu_split_flag_r)
    			cu_idx_r <= cu_idx_deep_plus1_w;
    		else 
    			cu_idx_r <= cu_idx_r;
    	end
    	else begin
    		case(cu_depth_r)
    			2'b00:	begin
    						cu_idx_r <= 'd0;
    			end
    			
    			2'b01:	begin
    						if(cu_idx_minus1_w[1:0]==2'd3)
    							cu_idx_r <= 'd0;
    						else 
    							cu_idx_r <= cu_idx_plus1_w;				
	   			end
    			
    			2'b10:	begin
    						if(cu_idx_minus5_w[3:0]=='d15)                  
    							cu_idx_r <= 'd0;                          
    						else if(cu_idx_minus5_w[1:0]==2'd3) begin     
    							cu_idx_r <= (cu_idx_r >> 2);              
    						end                                           
    						else begin                                    
    							cu_idx_r <= cu_idx_plus1_w;	              
    						end                 
    			end
    			
    			2'b11:	begin
    						if(cu_idx_minus21_w[5:0]==6'd63)                                 
    				        	cu_idx_r <= 'd0;                               
    				        else if(cu_idx_minus21_w[3:0]==4'd15)              
    				        	cu_idx_r <= (cu_idx_minus21_w >> 4) + 'd2;     
    				        else if(cu_idx_minus21_w[1:0]==2'd3)               
    				        	cu_idx_r <= (cu_idx_minus21_w >> 2) + 'd6;     
    				        else                                               
    				        	cu_idx_r <= cu_idx_plus1_w;        
    			end
    		endcase
    	end
    end
    else begin 
    	cu_idx_r <= cu_idx_r;
    end
end

// cu_split_flag_r 
always @* begin 
    if(slice_type_i) begin 
        case(cu_idx_r)    
            7'd0  :  cu_split_flag_r   =   cu_split_flag_i[0 ];
            7'd1  :  cu_split_flag_r   =   cu_split_flag_i[1 ];
            7'd2  :  cu_split_flag_r   =   cu_split_flag_i[2 ];
            7'd3  :  cu_split_flag_r   =   cu_split_flag_i[3 ];
            7'd4  :  cu_split_flag_r   =   cu_split_flag_i[4 ];
            7'd5  :  cu_split_flag_r   =   cu_split_flag_i[5 ];
            7'd6  :  cu_split_flag_r   =   cu_split_flag_i[6 ];
            7'd7  :  cu_split_flag_r   =   cu_split_flag_i[7 ];
            7'd8  :  cu_split_flag_r   =   cu_split_flag_i[8 ];
            7'd9  :  cu_split_flag_r   =   cu_split_flag_i[9 ];
            7'd10 :  cu_split_flag_r   =   cu_split_flag_i[10];
            7'd11 :  cu_split_flag_r   =   cu_split_flag_i[11];
            7'd12 :  cu_split_flag_r   =   cu_split_flag_i[12];
            7'd13 :  cu_split_flag_r   =   cu_split_flag_i[13];
            7'd14 :  cu_split_flag_r   =   cu_split_flag_i[14];
            7'd15 :  cu_split_flag_r   =   cu_split_flag_i[15];
            7'd16 :  cu_split_flag_r   =   cu_split_flag_i[16];
            7'd17 :  cu_split_flag_r   =   cu_split_flag_i[17];
            7'd18 :  cu_split_flag_r   =   cu_split_flag_i[18];
            7'd19 :  cu_split_flag_r   =   cu_split_flag_i[19];
            7'd20 :  cu_split_flag_r   =   cu_split_flag_i[20];
            7'd21 :  cu_split_flag_r   =   cu_split_flag_i[21];
            7'd22 :  cu_split_flag_r   =   cu_split_flag_i[22];
            7'd23 :  cu_split_flag_r   =   cu_split_flag_i[23];
            7'd24 :  cu_split_flag_r   =   cu_split_flag_i[24];
            7'd25 :  cu_split_flag_r   =   cu_split_flag_i[25];
            7'd26 :  cu_split_flag_r   =   cu_split_flag_i[26];
            7'd27 :  cu_split_flag_r   =   cu_split_flag_i[27];
            7'd28 :  cu_split_flag_r   =   cu_split_flag_i[28];
            7'd29 :  cu_split_flag_r   =   cu_split_flag_i[29];
            7'd30 :  cu_split_flag_r   =   cu_split_flag_i[30];
            7'd31 :  cu_split_flag_r   =   cu_split_flag_i[31];
            7'd32 :  cu_split_flag_r   =   cu_split_flag_i[32];
            7'd33 :  cu_split_flag_r   =   cu_split_flag_i[33];
            7'd34 :  cu_split_flag_r   =   cu_split_flag_i[34];
            7'd35 :  cu_split_flag_r   =   cu_split_flag_i[35];
            7'd36 :  cu_split_flag_r   =   cu_split_flag_i[36];
            7'd37 :  cu_split_flag_r   =   cu_split_flag_i[37];
            7'd38 :  cu_split_flag_r   =   cu_split_flag_i[38];
            7'd39 :  cu_split_flag_r   =   cu_split_flag_i[39];
            7'd40 :  cu_split_flag_r   =   cu_split_flag_i[40];
            7'd41 :  cu_split_flag_r   =   cu_split_flag_i[41];
            7'd42 :  cu_split_flag_r   =   cu_split_flag_i[42];
            7'd43 :  cu_split_flag_r   =   cu_split_flag_i[43];
            7'd44 :  cu_split_flag_r   =   cu_split_flag_i[44];
            7'd45 :  cu_split_flag_r   =   cu_split_flag_i[45];
            7'd46 :  cu_split_flag_r   =   cu_split_flag_i[46];
            7'd47 :  cu_split_flag_r   =   cu_split_flag_i[47];
            7'd48 :  cu_split_flag_r   =   cu_split_flag_i[48];
            7'd49 :  cu_split_flag_r   =   cu_split_flag_i[49];
            7'd50 :  cu_split_flag_r   =   cu_split_flag_i[50];
            7'd51 :  cu_split_flag_r   =   cu_split_flag_i[51];
            7'd52 :  cu_split_flag_r   =   cu_split_flag_i[52];
            7'd53 :  cu_split_flag_r   =   cu_split_flag_i[53];
            7'd54 :  cu_split_flag_r   =   cu_split_flag_i[54];
            7'd55 :  cu_split_flag_r   =   cu_split_flag_i[55];
            7'd56 :  cu_split_flag_r   =   cu_split_flag_i[56];
            7'd57 :  cu_split_flag_r   =   cu_split_flag_i[57];
            7'd58 :  cu_split_flag_r   =   cu_split_flag_i[58];
            7'd59 :  cu_split_flag_r   =   cu_split_flag_i[59];
            7'd60 :  cu_split_flag_r   =   cu_split_flag_i[60];
            7'd61 :  cu_split_flag_r   =   cu_split_flag_i[61];
            7'd62 :  cu_split_flag_r   =   cu_split_flag_i[62];
            7'd63 :  cu_split_flag_r   =   cu_split_flag_i[63];
            7'd64 :  cu_split_flag_r   =   cu_split_flag_i[64];
            7'd65 :  cu_split_flag_r   =   cu_split_flag_i[65];
            7'd66 :  cu_split_flag_r   =   cu_split_flag_i[66];
            7'd67 :  cu_split_flag_r   =   cu_split_flag_i[67];
            7'd68 :  cu_split_flag_r   =   cu_split_flag_i[68];
            7'd69 :  cu_split_flag_r   =   cu_split_flag_i[69];
            7'd70 :  cu_split_flag_r   =   cu_split_flag_i[70];	
            7'd71 :  cu_split_flag_r   =   cu_split_flag_i[71];	
            7'd72 :  cu_split_flag_r   =   cu_split_flag_i[72];	
            7'd73 :  cu_split_flag_r   =   cu_split_flag_i[73];	
            7'd74 :  cu_split_flag_r   =   cu_split_flag_i[74];	
            7'd75 :  cu_split_flag_r   =   cu_split_flag_i[75];	
            7'd76 :  cu_split_flag_r   =   cu_split_flag_i[76];	
            7'd77 :  cu_split_flag_r   =   cu_split_flag_i[77];	
            7'd78 :  cu_split_flag_r   =   cu_split_flag_i[78];	
            7'd79 :  cu_split_flag_r   =   cu_split_flag_i[79];	
            7'd80 :  cu_split_flag_r   =   cu_split_flag_i[80];	
            7'd81 :  cu_split_flag_r   =   cu_split_flag_i[81];	
            7'd82 :  cu_split_flag_r   =   cu_split_flag_i[82];	
            7'd83 :  cu_split_flag_r   =   cu_split_flag_i[83];	
            7'd84 :  cu_split_flag_r   =   cu_split_flag_i[84];	
          default :  cu_split_flag_r   =   1'b0               ;	
	    endcase
    end 
	else begin 
	    case(cu_idx_r)    
		    7'd0  :  cu_split_flag_r   =  (inter_cu_part_size_i[  1:0  ]==2'd3 )  ;
		    7'd1  :  cu_split_flag_r   =  (inter_cu_part_size_i[  3:2  ]==2'd3 )  ;
		    7'd2  :  cu_split_flag_r   =  (inter_cu_part_size_i[  5:4  ]==2'd3 )  ;
		    7'd3  :  cu_split_flag_r   =  (inter_cu_part_size_i[  7:6  ]==2'd3 )  ;
		    7'd4  :  cu_split_flag_r   =  (inter_cu_part_size_i[  9:8  ]==2'd3 )  ;
		    7'd5  :  cu_split_flag_r   =  (inter_cu_part_size_i[ 11:10 ]==2'd3 )  ;
		    7'd6  :  cu_split_flag_r   =  (inter_cu_part_size_i[ 13:12 ]==2'd3 )  ;
		    7'd7  :  cu_split_flag_r   =  (inter_cu_part_size_i[ 15:14 ]==2'd3 )  ;
		    7'd8  :  cu_split_flag_r   =  (inter_cu_part_size_i[ 17:16 ]==2'd3 )  ;
		    7'd9  :  cu_split_flag_r   =  (inter_cu_part_size_i[ 19:18 ]==2'd3 )  ;
		    7'd10 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 21:20 ]==2'd3 )  ;
		    7'd11 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 23:22 ]==2'd3 )  ;
		    7'd12 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 25:24 ]==2'd3 )  ;
		    7'd13 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 27:26 ]==2'd3 )  ;
		    7'd14 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 29:28 ]==2'd3 )  ;
		    7'd15 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 31:30 ]==2'd3 )  ;
		    7'd16 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 33:32 ]==2'd3 )  ;
		    7'd17 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 35:34 ]==2'd3 )  ;
		    7'd18 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 37:36 ]==2'd3 )  ;
		    7'd19 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 39:38 ]==2'd3 )  ;
		    7'd20 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 41:40 ]==2'd3 )  ;
		    7'd21 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 43:42 ]==2'd3 )  ;
		    7'd22 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 45:44 ]==2'd3 )  ;
		    7'd23 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 47:46 ]==2'd3 )  ;
		    7'd24 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 49:48 ]==2'd3 )  ;
		    7'd25 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 51:50 ]==2'd3 )  ;
		    7'd26 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 53:52 ]==2'd3 )  ;
		    7'd27 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 55:54 ]==2'd3 )  ;
		    7'd28 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 57:56 ]==2'd3 )  ;
		    7'd29 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 59:58 ]==2'd3 )  ;
		    7'd30 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 61:60 ]==2'd3 )  ;
		    7'd31 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 63:62 ]==2'd3 )  ;
		    7'd32 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 65:64 ]==2'd3 )  ;
		    7'd33 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 67:66 ]==2'd3 )  ;
		    7'd34 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 69:68 ]==2'd3 )  ;
		    7'd35 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 71:70 ]==2'd3 )  ;
		    7'd36 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 73:72 ]==2'd3 )  ;
		    7'd37 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 75:74 ]==2'd3 )  ;
		    7'd38 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 77:76 ]==2'd3 )  ;
		    7'd39 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 79:78 ]==2'd3 )  ;
		    7'd40 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 81:80 ]==2'd3 )  ;
		    7'd41 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 83:82 ]==2'd3 )  ;
		    7'd42 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 85:84 ]==2'd3 )  ;
		    7'd43 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 87:86 ]==2'd3 )  ;
		    7'd44 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 89:88 ]==2'd3 )  ;
		    7'd45 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 91:90 ]==2'd3 )  ;
		    7'd46 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 93:92 ]==2'd3 )  ;
	        7'd47 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 95:94 ]==2'd3 )  ;
	        7'd48 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 97:96 ]==2'd3 )  ;
	        7'd49 :  cu_split_flag_r   =  (inter_cu_part_size_i[ 99:98 ]==2'd3 )  ;
	        7'd50 :  cu_split_flag_r   =  (inter_cu_part_size_i[101:100]==2'd3 )  ;
	        7'd51 :  cu_split_flag_r   =  (inter_cu_part_size_i[103:102]==2'd3 )  ;
	        7'd52 :  cu_split_flag_r   =  (inter_cu_part_size_i[105:104]==2'd3 )  ;
	        7'd53 :  cu_split_flag_r   =  (inter_cu_part_size_i[107:106]==2'd3 )  ;
	        7'd54 :  cu_split_flag_r   =  (inter_cu_part_size_i[109:108]==2'd3 )  ;
	        7'd55 :  cu_split_flag_r   =  (inter_cu_part_size_i[111:110]==2'd3 )  ;
	        7'd56 :  cu_split_flag_r   =  (inter_cu_part_size_i[113:112]==2'd3 )  ;
	        7'd57 :  cu_split_flag_r   =  (inter_cu_part_size_i[115:114]==2'd3 )  ;
	        7'd58 :  cu_split_flag_r   =  (inter_cu_part_size_i[117:116]==2'd3 )  ;
	        7'd59 :  cu_split_flag_r   =  (inter_cu_part_size_i[119:118]==2'd3 )  ;
	        7'd60 :  cu_split_flag_r   =  (inter_cu_part_size_i[121:120]==2'd3 )  ;
	        7'd61 :  cu_split_flag_r   =  (inter_cu_part_size_i[123:122]==2'd3 )  ;
	        7'd62 :  cu_split_flag_r   =  (inter_cu_part_size_i[125:124]==2'd3 )  ;
	        7'd63 :  cu_split_flag_r   =  (inter_cu_part_size_i[127:126]==2'd3 )  ;
	        7'd64 :  cu_split_flag_r   =  (inter_cu_part_size_i[129:128]==2'd3 )  ;
	        7'd65 :  cu_split_flag_r   =  (inter_cu_part_size_i[131:130]==2'd3 )  ;
	        7'd66 :  cu_split_flag_r   =  (inter_cu_part_size_i[133:132]==2'd3 )  ;
	        7'd67 :  cu_split_flag_r   =  (inter_cu_part_size_i[135:134]==2'd3 )  ;
	        7'd68 :  cu_split_flag_r   =  (inter_cu_part_size_i[137:136]==2'd3 )  ;
	        7'd69 :  cu_split_flag_r   =  (inter_cu_part_size_i[139:138]==2'd3 )  ;
	        7'd70 :  cu_split_flag_r   =  (inter_cu_part_size_i[141:140]==2'd3 )  ;
	        7'd71 :  cu_split_flag_r   =  (inter_cu_part_size_i[143:142]==2'd3 )  ;
	        7'd72 :  cu_split_flag_r   =  (inter_cu_part_size_i[145:144]==2'd3 )  ;
	        7'd73 :  cu_split_flag_r   =  (inter_cu_part_size_i[147:146]==2'd3 )  ;
	        7'd74 :  cu_split_flag_r   =  (inter_cu_part_size_i[149:148]==2'd3 )  ;
	        7'd75 :  cu_split_flag_r   =  (inter_cu_part_size_i[151:150]==2'd3 )  ;
	        7'd76 :  cu_split_flag_r   =  (inter_cu_part_size_i[153:152]==2'd3 )  ;
	        7'd77 :  cu_split_flag_r   =  (inter_cu_part_size_i[155:154]==2'd3 )  ;
	        7'd78 :  cu_split_flag_r   =  (inter_cu_part_size_i[157:156]==2'd3 )  ;
	        7'd79 :  cu_split_flag_r   =  (inter_cu_part_size_i[159:158]==2'd3 )  ;
	        7'd80 :  cu_split_flag_r   =  (inter_cu_part_size_i[161:160]==2'd3 )  ;
	        7'd81 :  cu_split_flag_r   =  (inter_cu_part_size_i[163:162]==2'd3 )  ;
	        7'd82 :  cu_split_flag_r   =  (inter_cu_part_size_i[165:164]==2'd3 )  ;
	        7'd83 :  cu_split_flag_r   =  (inter_cu_part_size_i[167:166]==2'd3 )  ;
	        7'd84 :  cu_split_flag_r   =  (inter_cu_part_size_i[169:168]==2'd3 )  ;
	      default :  cu_split_flag_r   =  1'b0                                    ;
		endcase 
	end 
end 

// cu_depth_r
always @* begin
    if(cu_idx_r=='d0)                      //   cu_idx_r = 0
		cu_depth_r = 2'd0;
    else if(cu_idx_minus1_w[6:2]=='d0)     //   cu_idx_r = 4 3 2 1
		cu_depth_r = 2'd1;
    else if(cu_idx_minus5_w[6:4]=='d0)     //   cu_idx_r = 20 ...5
		cu_depth_r = 2'd2;
	else 
		cu_depth_r = 2'd3;
end

// -----------------------------------------------------------------------------------------------------------------------------
//
//		       calculation fsm controller signals 
//
// -----------------------------------------------------------------------------------------------------------------------------
reg       [2:0]     lcu_cyc_cnt_r                       ;

reg                 lcu_done_r                          ;
reg                 cabac_slice_done_r                  ;

// lcu_cyc_cnt_r    delay 8 cycles 
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		lcu_cyc_cnt_r <= 3'd0                ;
	else if(lcu_curr_state_r==LCU_SAO)
		lcu_cyc_cnt_r <= lcu_cyc_cnt_r + 1'b1;
	else if (lcu_curr_state_r!=LCU_END)
		lcu_cyc_cnt_r <= 3'd0                ;	
	else if(lcu_cyc_cnt_r==3'd7)
		lcu_cyc_cnt_r <= 3'd0                ;
	else 
		lcu_cyc_cnt_r <= lcu_cyc_cnt_r + 1'd1;
end

// lcu_done_r
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
	    lcu_done_r  <=  1'b0  ;
	else if(lcu_curr_state_r==LCU_END && lcu_cyc_cnt_r==3'd7)
	 	lcu_done_r  <=  1'b1;
	else
		lcu_done_r  <=  1'b0;
end

// cabac_slice_done_r 
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cabac_slice_done_r   <=   1'b0 ;
	else if(mb_x_i == mb_x_total_i && mb_y_i == mb_y_total_i && lcu_done_r)
        cabac_slice_done_r   <=   1'b1 ;
    else 
	    cabac_slice_done_r   <=   1'b0 ;
end  

// -----------------------------------------------------------------------------------------------------------------------------
//
//		                             top  fsm 
//
// -----------------------------------------------------------------------------------------------------------------------------

always @(posedge clk or negedge rst_n) begin
    if(~rst_n)
		lcu_curr_state_r <= LCU_IDLE        ;	
    else
		lcu_curr_state_r <= lcu_next_state_r;
end

// LCU next state
always @* begin
	lcu_next_state_r = LCU_IDLE;
    case(lcu_curr_state_r)
    	LCU_IDLE:	begin
    					if(cabac_start_i&&mb_x_i==`PIC_X_WIDTH'd0 && mb_y_i==`PIC_X_WIDTH'd0)
    						lcu_next_state_r = LCU_INIT;
    					else if(cabac_start_i)begin 
						    if(`SAO_OPEN==1)
    	    		    	    lcu_next_state_r = LCU_SAO ;//CU_SPLIT;
    					    else 
    	    		    	    lcu_next_state_r = CU_SPLIT;//CU_SPLIT;
						end 
						else 
						    lcu_next_state_r = LCU_IDLE;
	    end
	    
	    LCU_INIT:	begin
	    				if(table_build_end_i)begin
						    if(`SAO_OPEN==1)
    	    		    	    lcu_next_state_r = LCU_SAO ;//CU_SPLIT;
    					    else 
    	    		    	    lcu_next_state_r = CU_SPLIT;//CU_SPLIT;
						end 
    	    			else 
    	    				lcu_next_state_r = LCU_INIT;
	    end
		
		LCU_SAO:begin 
                if(lcu_cyc_cnt_r==3'd6)
				    lcu_next_state_r  =  CU_SPLIT     ;
				else 
				    lcu_next_state_r  =  LCU_SAO      ;
        end 		

	    CU_SPLIT:   begin
	    				case(cu_depth_r)
	    					2'b00:	begin                                   //64x64
	    								if(cu_split_flag_r)
	    									lcu_next_state_r = CU_SPLIT;
	    								else 	
	    									lcu_next_state_r = CU_64x64;
	    					end
	    					
	    					2'b01:	begin                                   //32x32
	    								if(cu_split_flag_r)
	    									lcu_next_state_r = CU_SPLIT;	
	    								else 
	    									lcu_next_state_r = CU_32x32;
	    					end
	    					
	    					2'b10:	begin                                   //16x16
	    								if(cu_split_flag_r)
	    									lcu_next_state_r = CU_8x8  ;
	    								else 
	    									lcu_next_state_r = CU_16x16;	
	    					end
	    					
	    					2'b11:	begin                                    //8x8
	    								lcu_next_state_r = CU_8x8;
	    					end
	    				endcase
	    end

	    CU_64x64:   begin
	    				if(cu_done_r)
    	    				lcu_next_state_r = LCU_END;		   
    	    			else 
    	    				lcu_next_state_r = CU_64x64;
	    end
	    	
	    CU_32x32:   begin
	    				if(cu_done_r) begin
	    					if(cu_idx_r==7'd4)
	    						lcu_next_state_r = LCU_END;
	    					else 
	    						lcu_next_state_r = CU_SPLIT;   					
	    				end
	    				else 
	    					lcu_next_state_r = CU_32x32 ;
	    end

	    CU_16x16:   begin
	    				if(cu_done_r) begin
	    					if(cu_idx_r==7'd20)
	    				    	lcu_next_state_r = LCU_END;
	    					else
	    				    	lcu_next_state_r = CU_SPLIT;
	    				end
	    				else
	    					lcu_next_state_r = CU_16x16  ; 
	    end     		

	    CU_8x8:		begin
	    				if(cu_done_r) begin
	    					if(cu_idx_r==7'd84)
	    					    lcu_next_state_r = LCU_END;
	    					else if(cu_idx_minus21_w[1:0]==2'd3)
	    					    lcu_next_state_r = CU_SPLIT;
	    					else 
	    					    lcu_next_state_r = CU_8x8;
	    				end
	    				else 
	    					lcu_next_state_r = CU_8x8;
	    end     		
	    
	    LCU_END:    begin   
	    				if(lcu_cyc_cnt_r==3'd7)      
	    					lcu_next_state_r = LCU_IDLE;
	    				else
	    					lcu_next_state_r = LCU_END;
	    end

	endcase
end

// -----------------------------------------------------------------------------------------------------------------------------
//
//		                  calculation cu_depth 
//
// -----------------------------------------------------------------------------------------------------------------------------
reg    [1:0]        cu_depth_0_0_r  ,  cu_depth_0_2_r , cu_depth_0_4_r  ,  cu_depth_0_6_r  ;
reg    [1:0]        cu_depth_2_0_r  ,  cu_depth_2_2_r , cu_depth_2_4_r  ,  cu_depth_2_6_r  ;
reg    [1:0]        cu_depth_4_0_r  ,  cu_depth_4_2_r , cu_depth_4_4_r  ,  cu_depth_4_6_r  ;
reg    [1:0]        cu_depth_6_0_r  ,  cu_depth_6_2_r , cu_depth_6_4_r  ,  cu_depth_6_6_r  ;

// cu_depth_0_0_r
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])                   // 64x64 not split 
			cu_depth_0_0_r  =  2'd0  ;
		else if(~cu_split_flag_i[1])              // 32x32 not split 
			cu_depth_0_0_r  =  2'd1  ;
		else if(~cu_split_flag_i[5])              // 16x16 not split 
			cu_depth_0_0_r  =  2'd2  ;
		else                                      // 8x8  
			cu_depth_0_0_r  =  2'd3  ;			
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_0_0_r  = 2'd0   ;
		else if(inter_cu_part_size_i[3:2]!=(`PART_SPLIT))
			cu_depth_0_0_r  = 2'd1   ;
		else if(inter_cu_part_size_i[11:10]!=(`PART_SPLIT))
			cu_depth_0_0_r  = 2'd2   ;
		else 
			cu_depth_0_0_r  = 2'd3   ;
	end	
end

// cu_depth_0_2_r
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])                   // 64x64 not split 
			cu_depth_0_2_r  =  2'd0  ;
		else if(~cu_split_flag_i[1])              // 32x32 not split 
			cu_depth_0_2_r  =  2'd1  ;
		else if(~cu_split_flag_i[6])             // 16x16 not split 
			cu_depth_0_2_r  =  2'd2  ;
		else                                      // 8x8  
			cu_depth_0_2_r  =  2'd3  ;			
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_0_2_r  = 2'd0   ;
		else if(inter_cu_part_size_i[3:2]!=(`PART_SPLIT))
			cu_depth_0_2_r  = 2'd1   ;
		else if(inter_cu_part_size_i[13:12]!=(`PART_SPLIT))
			cu_depth_0_2_r  = 2'd2   ;
		else 
			cu_depth_0_2_r  = 2'd3   ;
	end	
end

// cu_depth_0_4_r 
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])                   // 64x64 not split 
			cu_depth_0_4_r  =  2'd0  ;
		else if(~cu_split_flag_i[2])              // 32x32 not split 
			cu_depth_0_4_r  =  2'd1  ;
		else if(~cu_split_flag_i[9])             // 16x16 not split 
			cu_depth_0_4_r  =  2'd2  ;
		else                                      // 8x8  
			cu_depth_0_4_r  =  2'd3  ;			
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_0_4_r  = 2'd0   ;
		else if(inter_cu_part_size_i[5:4]!=(`PART_SPLIT))
			cu_depth_0_4_r  = 2'd1   ;
		else if(inter_cu_part_size_i[19:18]!=(`PART_SPLIT))
			cu_depth_0_4_r  = 2'd2   ;
		else 
			cu_depth_0_4_r  = 2'd3   ;
	end	
end

// cu_depth_0_6_r 
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])                   // 64x64 not split 
			cu_depth_0_6_r  =  2'd0  ;
		else if(~cu_split_flag_i[2])              // 32x32 not split 
			cu_depth_0_6_r  =  2'd1  ;
		else if(~cu_split_flag_i[10])             // 16x16 not split 
			cu_depth_0_6_r  =  2'd2  ;
		else                                      // 8x8  
			cu_depth_0_6_r  =  2'd3  ;			
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_0_6_r  = 2'd0   ;
		else if(inter_cu_part_size_i[5:4]!=(`PART_SPLIT))
			cu_depth_0_6_r  = 2'd1   ;
		else if(inter_cu_part_size_i[21:20]!=(`PART_SPLIT))
			cu_depth_0_6_r  = 2'd2   ;
		else 
			cu_depth_0_6_r  = 2'd3   ;
	end	
end

// cu_depth_2_0_r
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])                   // 64x64 not split 
			cu_depth_2_0_r  =  2'd0  ;
		else if(~cu_split_flag_i[1])              // 32x32 not split 
			cu_depth_2_0_r  =  2'd1  ;
		else if(~cu_split_flag_i[7])             // 16x16 not split 
			cu_depth_2_0_r  =  2'd2  ;
		else                                      // 8x8  
			cu_depth_2_0_r  =  2'd3  ;			
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_2_0_r  = 2'd0   ;
		else if(inter_cu_part_size_i[3:2]!=(`PART_SPLIT))
			cu_depth_2_0_r  = 2'd1   ;
		else if(inter_cu_part_size_i[15:14]!=(`PART_SPLIT))
			cu_depth_2_0_r  = 2'd2   ;
		else 
			cu_depth_2_0_r  = 2'd3   ;
	end	
end

// cu_depth_2_2_r
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])                   // 64x64 not split 
			cu_depth_2_2_r  =  2'd0  ;
		else if(~cu_split_flag_i[1])              // 32x32 not split 
			cu_depth_2_2_r  =  2'd1  ;
		else if(~cu_split_flag_i[8])             // 16x16 not split 
			cu_depth_2_2_r  =  2'd2  ;
		else                                      // 8x8  
			cu_depth_2_2_r  =  2'd3  ;			
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_2_2_r  = 2'd0   ;
		else if(inter_cu_part_size_i[3:2]!=(`PART_SPLIT))
			cu_depth_2_2_r  = 2'd1   ;
		else if(inter_cu_part_size_i[17:16]!=(`PART_SPLIT))
			cu_depth_2_2_r  = 2'd2   ;
		else 
			cu_depth_2_2_r  = 2'd3   ;
	end	
end

// cu_depth_2_4_r
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])                   // 64x64 not split 
			cu_depth_2_4_r  =  2'd0  ;
		else if(~cu_split_flag_i[2])              // 32x32 not split 
			cu_depth_2_4_r  =  2'd1  ;
		else if(~cu_split_flag_i[11])             // 16x16 not split 
			cu_depth_2_4_r  =  2'd2  ;
		else                                      // 8x8  
			cu_depth_2_4_r  =  2'd3  ;			
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_2_4_r  = 2'd0   ;
		else if(inter_cu_part_size_i[5:4]!=(`PART_SPLIT))
			cu_depth_2_4_r  = 2'd1   ;
		else if(inter_cu_part_size_i[23:22]!=(`PART_SPLIT))
			cu_depth_2_4_r  = 2'd2   ;
		else 
			cu_depth_2_4_r  = 2'd3   ;
	end	
end

// cu_depth_2_6_r 
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])                    // 64x64 not split 
			cu_depth_2_6_r  =  2'd0  ;
		else if(~cu_split_flag_i[2])               // 32x32 not split 
			cu_depth_2_6_r  =  2'd1  ;
		else if(~cu_split_flag_i[12])              // 16x16 not split 
			cu_depth_2_6_r  =  2'd2  ;
		else                                       // 8x8  
			cu_depth_2_6_r  =  2'd3  ;			
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_2_6_r  = 2'd0   ;
		else if(inter_cu_part_size_i[5:4]!=(`PART_SPLIT))
			cu_depth_2_6_r  = 2'd1   ;
		else if(inter_cu_part_size_i[25:24]!=(`PART_SPLIT))
			cu_depth_2_6_r  = 2'd2   ;
		else 
			cu_depth_2_6_r  = 2'd3   ;
	end	
end

// cu_depth_4_0_r
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])                   // 64x64 not split 
			cu_depth_4_0_r  =  2'd0  ;
		else if(~cu_split_flag_i[3])              // 32x32 not split 
			cu_depth_4_0_r  =  2'd1  ;
		else if(~cu_split_flag_i[13])             // 16x16 not split 
			cu_depth_4_0_r  =  2'd2  ;
		else                                      // 8x8  
			cu_depth_4_0_r  =  2'd3  ;			
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_4_0_r  = 2'd0   ;
		else if(inter_cu_part_size_i[7:6]!=(`PART_SPLIT))
			cu_depth_4_0_r  = 2'd1   ;
		else if(inter_cu_part_size_i[27:26]!=(`PART_SPLIT))
			cu_depth_4_0_r  = 2'd2   ;
		else 
			cu_depth_4_0_r  = 2'd3   ;
	end	
end

// cu_depth_4_2_r
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])                   // 64x64 not split 
			cu_depth_4_2_r  =  2'd0  ;
		else if(~cu_split_flag_i[3])              // 32x32 not split 
			cu_depth_4_2_r  =  2'd1  ;
		else if(~cu_split_flag_i[14])             // 16x16 not split 
			cu_depth_4_2_r  =  2'd2  ;
		else                                      // 8x8  
			cu_depth_4_2_r  =  2'd3  ;			
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_4_2_r  = 2'd0   ;
		else if(inter_cu_part_size_i[7:6]!=(`PART_SPLIT))
			cu_depth_4_2_r  = 2'd1   ;
		else if(inter_cu_part_size_i[29:28]!=(`PART_SPLIT))
			cu_depth_4_2_r  = 2'd2   ;
		else 
			cu_depth_4_2_r  = 2'd3   ;
	end	
end

// cu_depth_4_4_r
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])                   // 64x64 not split 
			cu_depth_4_4_r  =  2'd0  ;
		else if(~cu_split_flag_i[4])              // 32x32 not split 
			cu_depth_4_4_r  =  2'd1  ;
		else if(~cu_split_flag_i[17])             // 16x16 not split 
			cu_depth_4_4_r  =  2'd2  ;
		else                                      // 8x8  
			cu_depth_4_4_r  =  2'd3  ;			
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_4_4_r  = 2'd0   ;
		else if(inter_cu_part_size_i[9:8]!=(`PART_SPLIT))
			cu_depth_4_4_r  = 2'd1   ;
		else if(inter_cu_part_size_i[35:34]!=(`PART_SPLIT))
			cu_depth_4_4_r  = 2'd2   ;
		else 
			cu_depth_4_4_r  = 2'd3   ;
	end	
end

// cu_depth_4_6_r 
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])                     // 64x64 not split 
			cu_depth_4_6_r  =  2'd0  ;
		else if(~cu_split_flag_i[4])                // 32x32 not split 
			cu_depth_4_6_r  =  2'd1  ;
		else if(~cu_split_flag_i[18])               // 16x16 not split 
			cu_depth_4_6_r  =  2'd2  ;
		else                                        // 8x8  
			cu_depth_4_6_r  =  2'd3  ;			
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_4_6_r  = 2'd0   ;
		else if(inter_cu_part_size_i[9:8]!=(`PART_SPLIT))
			cu_depth_4_6_r  = 2'd1   ;
		else if(inter_cu_part_size_i[37:36]!=(`PART_SPLIT))
			cu_depth_4_6_r  = 2'd2   ;
		else 
			cu_depth_4_6_r  = 2'd3   ;
	end	
end

// cu_depth_6_0_r 
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])                             // 64x64
			cu_depth_6_0_r = 2'd0    ;                    
		else if(~cu_split_flag_i[3])                        // 32x32
			cu_depth_6_0_r = 2'd1    ;                    
		else if(~cu_split_flag_i[15])                       // 16x16 
			cu_depth_6_0_r = 2'd2    ;                    
		else                                                // 8x8
			cu_depth_6_0_r = 2'd3    ;
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))         // 64x64
			cu_depth_6_0_r = 2'd0    ;                     
		else if(inter_cu_part_size_i[7:6]!=(`PART_SPLIT))    // 32x32
			cu_depth_6_0_r = 2'd1    ;                     
		else if(inter_cu_part_size_i[31:30]!=(`PART_SPLIT))  // 16x16 
			cu_depth_6_0_r = 2'd2    ;                     
		else                                                 // 8x8
			cu_depth_6_0_r = 2'd3    ;
	end
end

// cu_depth_6_2_r 
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])
			cu_depth_6_2_r = 2'd0;	
		else if(~cu_split_flag_i[3])
			cu_depth_6_2_r = 2'd1;
		else if(~cu_split_flag_i[16])
			cu_depth_6_2_r = 2'd2;
		else 
			cu_depth_6_2_r = 2'd3;
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_6_2_r = 2'd0;
		else if(inter_cu_part_size_i[7:6]!=(`PART_SPLIT))
			cu_depth_6_2_r = 2'd1;
		else if(inter_cu_part_size_i[33:32]!=(`PART_SPLIT))
			cu_depth_6_2_r = 2'd2;
		else
			cu_depth_6_2_r = 2'd3;
	end
end

// cu_depth_6_4_r 
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])
			cu_depth_6_4_r = 2'd0;	
		else if(~cu_split_flag_i[4])
			cu_depth_6_4_r = 2'd1;
		else if(~cu_split_flag_i[19])
			cu_depth_6_4_r = 2'd2;
		else 
			cu_depth_6_4_r = 2'd3;
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_6_4_r = 2'd0;
		else if(inter_cu_part_size_i[9:8]!=(`PART_SPLIT))
			cu_depth_6_4_r = 2'd1;
		else if(inter_cu_part_size_i[39:38]!=(`PART_SPLIT))
			cu_depth_6_4_r = 2'd2;
		else
			cu_depth_6_4_r = 2'd3;
	end
end

// cu_depth_6_6_r 
always @* begin
	if(slice_type_i==(`SLICE_TYPE_I)) begin
		if(~cu_split_flag_i[0])                      // 64x64 not split 
			cu_depth_6_6_r  =  2'd0  ;
		else if(~cu_split_flag_i[4])                 // 32x32 not split 
			cu_depth_6_6_r  =  2'd1  ;
		else if(~cu_split_flag_i[20])                // 16x16 not split 
			cu_depth_6_6_r  =  2'd2  ;
		else                                         // 8x8  
			cu_depth_6_6_r  =  2'd3  ;			
	end
	else begin
		if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))
			cu_depth_6_6_r  = 2'd0   ;
		else if(inter_cu_part_size_i[9:8]!=(`PART_SPLIT))
			cu_depth_6_6_r  = 2'd1   ;
		else if(inter_cu_part_size_i[41:40]!=(`PART_SPLIT))
			cu_depth_6_6_r  = 2'd2   ;
		else 
			cu_depth_6_6_r  = 2'd3   ;
	end	
end

// -----------------------------------------------------------------------------------------------------------------------------
//
//		                  calculation and store internal signals  for next lcu 
//
// -----------------------------------------------------------------------------------------------------------------------------
//   cu_skip_left_flag  
//   cu_depth_left 
//   cu_luma_pred_left_mode  

//   left data  
//   {cu_skip_flag,cu_luma_pred_mode_w[5:0],cu_depth_left[1:0]}
reg                 cu_skip_left_0_r      ,  cu_skip_left_1_r       ;
reg                 cu_skip_left_2_r      ,  cu_skip_left_3_r       ;
reg                 cu_skip_left_4_r      ,  cu_skip_left_5_r       ;
reg                 cu_skip_left_6_r      ,  cu_skip_left_7_r       ;

reg    [5:0]        cu_luma_mode_left_0_r , cu_luma_mode_left_1_r   ;
reg    [5:0]        cu_luma_mode_left_2_r , cu_luma_mode_left_3_r   ;
reg    [5:0]        cu_luma_mode_left_4_r , cu_luma_mode_left_5_r   ;
reg    [5:0]        cu_luma_mode_left_6_r , cu_luma_mode_left_7_r   ;
reg    [5:0]        cu_luma_mode_left_8_r , cu_luma_mode_left_9_r   ;
reg    [5:0]        cu_luma_mode_left_10_r, cu_luma_mode_left_11_r  ;
reg    [5:0]        cu_luma_mode_left_12_r, cu_luma_mode_left_13_r  ;
reg    [5:0]        cu_luma_mode_left_14_r, cu_luma_mode_left_15_r  ;

reg    [8:0]        cu_left_0_r           ,  cu_left_1_r            ;
reg    [8:0]        cu_left_2_r           ,  cu_left_3_r            ;
reg    [8:0]        cu_left_4_r           ,  cu_left_5_r            ;
reg    [8:0]        cu_left_6_r           ,  cu_left_7_r            ;
reg    [8:0]        cu_left_8_r           ,  cu_left_9_r            ;
reg    [8:0]        cu_left_10_r          ,  cu_left_11_r           ;
reg    [8:0]        cu_left_12_r          ,  cu_left_13_r           ;
reg    [8:0]        cu_left_14_r          ,  cu_left_15_r           ;

reg                                      cu_start_r                 ;
reg                                      cu_start_d1_r              ;
reg                                      cu_start_d2_r              ;
reg                                      cu_start_d3_r              ;
reg                                      cu_sub_div_r               ;
reg    [1:0 ]                            cu_inter_part_size_r       ;
reg    [3:0 ]                            cu_merge_flag_r            ;
reg    [15:0]                            cu_merge_idx_r             ;
reg    [3:0 ]                            cu_cbf_y_r                 ;
reg    [3:0 ]                            cu_cbf_u_r                 ;
reg    [3:0 ]                            cu_cbf_v_r                 ;
reg                                      cu_skip_top_flag_r         ;
reg                                      cu_skip_left_flag_r        ;

reg    [1:0 ]                            cu_depth_top_r             ;           
reg    [1:0 ]                            cu_depth_left_r            ;

reg                                      last_cu_flag_r             ; // the last cu in the current lcu 

reg                                      cu_mvd_ren_r               ; // read mvd enable 
reg    [6:0 ]						     cu_mvd_raddr_r			    ; // address of  mvd 

reg    [(4*`MVD_WIDTH)+1:0]              cu_mvd_data_r              ;
//reg    [ 8:0]                            cu_mvd_idx_r               ;

reg                                      cu_qp_nocoded_r            ;
reg    [5:0]                             cu_qp_last_r               ;

reg    [ 5:0]                            cu_luma_mode_raddr_r       ;
reg    [ 5:0]                            cu_luma_top_mode_raddr_r   ;
reg    [ 5:0]                            cu_luma_left_mode_raddr_r  ;
  
reg    [23:0]                            cu_luma_pred_mode_r        ;
reg    [23:0]                            cu_luma_pred_top_mode_r    ;
reg    [23:0]                            cu_luma_pred_left_mode_r   ;
reg    [ 5:0]                            cu_chroma_pred_mode_r      ;



// cu_skip_left_0_r  cu_skip_left_1_r
always @* begin
	if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))  begin         // 64x64
		cu_skip_left_0_r = cu_skip_flag_i[0]   ;     
		cu_skip_left_1_r = cu_skip_flag_i[0]   ;  
    end 		
	else if(inter_cu_part_size_i[5:4]!=(`PART_SPLIT)) begin     // 32x32
		cu_skip_left_0_r = cu_skip_flag_i[2]   ; 
   		cu_skip_left_1_r = cu_skip_flag_i[2]   ;  
    end 		
	else if(inter_cu_part_size_i[21:20]!=(`PART_SPLIT))begin    // 16x16 
		cu_skip_left_0_r = cu_skip_flag_i[10]  ;              
        cu_skip_left_1_r = cu_skip_flag_i[10]  ;  
    end 		
	else begin                                                 	// 8x8
		cu_skip_left_0_r = cu_skip_flag_i[42]  ;
	    cu_skip_left_1_r = cu_skip_flag_i[44]  ;  
	end 
end 

// cu_skip_left_2_r  cu_skip_left_3_r
always @* begin
	if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))  begin         // 64x64
		cu_skip_left_2_r = cu_skip_flag_i[0]   ;     
		cu_skip_left_3_r = cu_skip_flag_i[0]   ;  
    end 		
	else if(inter_cu_part_size_i[5:4]!=(`PART_SPLIT)) begin     // 32x32
		cu_skip_left_2_r = cu_skip_flag_i[2]   ; 
   		cu_skip_left_3_r = cu_skip_flag_i[2]   ;  
    end 		
	else if(inter_cu_part_size_i[25:24]!=(`PART_SPLIT))begin    // 16x16 
		cu_skip_left_2_r = cu_skip_flag_i[12]  ;              
        cu_skip_left_3_r = cu_skip_flag_i[12]   ;  
    end 		
	else begin                                                 	// 8x8
		cu_skip_left_2_r = cu_skip_flag_i[50]  ;
	    cu_skip_left_3_r = cu_skip_flag_i[52]  ;  
	end 
end 

// cu_skip_left_4_r  cu_skip_left_5_r
always @* begin
	if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))  begin         // 64x64
		cu_skip_left_4_r = cu_skip_flag_i[0]   ;     
		cu_skip_left_5_r = cu_skip_flag_i[0]   ;  
    end 		
	else if(inter_cu_part_size_i[9:8]!=(`PART_SPLIT)) begin     // 32x32
		cu_skip_left_4_r = cu_skip_flag_i[4]   ; 
   		cu_skip_left_5_r = cu_skip_flag_i[4]   ;  
    end 		
	else if(inter_cu_part_size_i[37:36]!=(`PART_SPLIT))begin    // 16x16 
		cu_skip_left_4_r = cu_skip_flag_i[18]  ;              
        cu_skip_left_5_r = cu_skip_flag_i[18]  ;  
    end 		
	else begin                                                 	// 8x8
		cu_skip_left_4_r = cu_skip_flag_i[74]  ;
	    cu_skip_left_5_r = cu_skip_flag_i[77]  ;  
	end 
end 

// cu_skip_left_6_r cu_skip_left_7_r
always @* begin
	if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))  begin         // 64x64
		cu_skip_left_6_r = cu_skip_flag_i[0]   ;     
		cu_skip_left_7_r = cu_skip_flag_i[0]   ;  
    end 		
	else if(inter_cu_part_size_i[9:8]!=(`PART_SPLIT)) begin     // 32x32
		cu_skip_left_6_r = cu_skip_flag_i[4]   ; 
   		cu_skip_left_7_r = cu_skip_flag_i[4]   ;  
    end 		
	else if(inter_cu_part_size_i[41:40]!=(`PART_SPLIT))begin    // 16x16 
		cu_skip_left_6_r = cu_skip_flag_i[20]  ;              
        cu_skip_left_7_r = cu_skip_flag_i[20]  ;  
    end 		
	else begin                                                 	// 8x8
		cu_skip_left_6_r = cu_skip_flag_i[82]  ;
	    cu_skip_left_7_r = cu_skip_flag_i[84]  ;  
	end 
end 

// cu_luma_mode_left_0_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_0_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_0_r   <=    6'd1      ;		
	else begin 
      	case(cu_depth_0_6_r )
            2'd0 : cu_luma_mode_left_0_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_0_r;
            2'd1 : cu_luma_mode_left_0_r <= (cu_idx_r==7'd2 &&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_0_r;
            2'd2 : cu_luma_mode_left_0_r <= (cu_idx_r==7'd10&&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_0_r;
            2'd3 : cu_luma_mode_left_0_r <= (cu_idx_r==7'd42&&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_0_r;
        endcase
	end 
end 

// cu_luma_mode_left_1_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_1_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_1_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_0_6_r )
            2'd0 : cu_luma_mode_left_1_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_1_r;
            2'd1 : cu_luma_mode_left_1_r <= (cu_idx_r==7'd2 &&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_1_r;
            2'd2 : cu_luma_mode_left_1_r <= (cu_idx_r==7'd10&&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_1_r;
            2'd3 : cu_luma_mode_left_1_r <= (cu_idx_r==7'd42&&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_1_r;
        endcase
	end 
end 

// cu_luma_mode_left_2_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_2_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_2_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_0_6_r )
            2'd0 : cu_luma_mode_left_2_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_2_r;
            2'd1 : cu_luma_mode_left_2_r <= (cu_idx_r==7'd2 &&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_2_r;
            2'd2 : cu_luma_mode_left_2_r <= (cu_idx_r==7'd10&&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_2_r;
            2'd3 : cu_luma_mode_left_2_r <= (cu_idx_r==7'd44&&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_2_r;
        endcase
	end 
end 

// cu_luma_mode_left_3_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_3_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_3_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_0_6_r )
            2'd0 : cu_luma_mode_left_3_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_3_r;
            2'd1 : cu_luma_mode_left_3_r <= (cu_idx_r==7'd2 &&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_3_r;
            2'd2 : cu_luma_mode_left_3_r <= (cu_idx_r==7'd10&&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_3_r;
            2'd3 : cu_luma_mode_left_3_r <= (cu_idx_r==7'd44&&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_3_r;
        endcase
	end 
end 

// cu_luma_mode_left_4_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_4_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_4_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_2_6_r )
            2'd0 : cu_luma_mode_left_4_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_4_r;
            2'd1 : cu_luma_mode_left_4_r <= (cu_idx_r==7'd2 &&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_4_r;
            2'd2 : cu_luma_mode_left_4_r <= (cu_idx_r==7'd12&&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_4_r;
            2'd3 : cu_luma_mode_left_4_r <= (cu_idx_r==7'd50&&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_4_r;
        endcase
	end 
end 

// cu_luma_mode_left_5_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_5_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_5_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_2_6_r )
            2'd0 : cu_luma_mode_left_5_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_5_r;
            2'd1 : cu_luma_mode_left_5_r <= (cu_idx_r==7'd2 &&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_5_r;
            2'd2 : cu_luma_mode_left_5_r <= (cu_idx_r==7'd12&&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_5_r;
            2'd3 : cu_luma_mode_left_5_r <= (cu_idx_r==7'd50&&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_5_r;
        endcase
	end 
end 

// cu_luma_mode_left_6_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_6_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_6_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_2_6_r )
            2'd0 : cu_luma_mode_left_6_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_6_r;
            2'd1 : cu_luma_mode_left_6_r <= (cu_idx_r==7'd2 &&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_6_r;
            2'd2 : cu_luma_mode_left_6_r <= (cu_idx_r==7'd12&&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_6_r;
            2'd3 : cu_luma_mode_left_6_r <= (cu_idx_r==7'd52&&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_6_r;
        endcase
	end 
end 

// cu_luma_mode_left_7_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_7_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_7_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_2_6_r )
            2'd0 : cu_luma_mode_left_7_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_7_r;
            2'd1 : cu_luma_mode_left_7_r <= (cu_idx_r==7'd2 &&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_7_r;
            2'd2 : cu_luma_mode_left_7_r <= (cu_idx_r==7'd12&&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_7_r;
            2'd3 : cu_luma_mode_left_7_r <= (cu_idx_r==7'd52&&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_7_r;
        endcase
	end 
end 

// cu_luma_mode_left_8_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_8_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_8_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_4_6_r )
            2'd0 : cu_luma_mode_left_8_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_8_r;
            2'd1 : cu_luma_mode_left_8_r <= (cu_idx_r==7'd4 &&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_8_r;
            2'd2 : cu_luma_mode_left_8_r <= (cu_idx_r==7'd18&&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_8_r;
            2'd3 : cu_luma_mode_left_8_r <= (cu_idx_r==7'd74&&cu_start_d2_r) ?  luma_mode_i[17:12] :cu_luma_mode_left_8_r;
        endcase
	end 
end 

// cu_luma_mode_left_9_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_9_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_9_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_4_6_r )
            2'd0 : cu_luma_mode_left_9_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_9_r;
            2'd1 : cu_luma_mode_left_9_r <= (cu_idx_r==7'd4 &&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_9_r;
            2'd2 : cu_luma_mode_left_9_r <= (cu_idx_r==7'd18&&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_9_r;
            2'd3 : cu_luma_mode_left_9_r <= (cu_idx_r==7'd74&&cu_start_d2_r) ?  luma_mode_i[ 5:0 ] :cu_luma_mode_left_9_r;
        endcase
	end 
end 

// cu_luma_mode_left_10_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_10_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_10_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_4_6_r )
            2'd0 : cu_luma_mode_left_10_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ? luma_mode_i[17:12]:cu_luma_mode_left_10_r;
            2'd1 : cu_luma_mode_left_10_r <= (cu_idx_r==7'd4 &&cu_start_d2_r) ? luma_mode_i[17:12]:cu_luma_mode_left_10_r;
            2'd2 : cu_luma_mode_left_10_r <= (cu_idx_r==7'd18&&cu_start_d2_r) ? luma_mode_i[17:12]:cu_luma_mode_left_10_r;
            2'd3 : cu_luma_mode_left_10_r <= (cu_idx_r==7'd76&&cu_start_d2_r) ? luma_mode_i[17:12]:cu_luma_mode_left_10_r;
        endcase
	end 
end 

// cu_luma_mode_left_11_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_11_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_11_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_4_6_r )
            2'd0 : cu_luma_mode_left_11_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ? luma_mode_i[ 5:0 ]:cu_luma_mode_left_11_r;
            2'd1 : cu_luma_mode_left_11_r <= (cu_idx_r==7'd4 &&cu_start_d2_r) ? luma_mode_i[ 5:0 ]:cu_luma_mode_left_11_r;
            2'd2 : cu_luma_mode_left_11_r <= (cu_idx_r==7'd18&&cu_start_d2_r) ? luma_mode_i[ 5:0 ]:cu_luma_mode_left_11_r;
            2'd3 : cu_luma_mode_left_11_r <= (cu_idx_r==7'd76&&cu_start_d2_r) ? luma_mode_i[ 5:0 ]:cu_luma_mode_left_11_r;
        endcase
	end 
end 

// cu_luma_mode_left_12_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_12_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_12_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_6_6_r )
            2'd0 : cu_luma_mode_left_12_r <= (cu_idx_r==7'd0 &&cu_start_d2_r)? luma_mode_i[17:12] :cu_luma_mode_left_12_r;
            2'd1 : cu_luma_mode_left_12_r <= (cu_idx_r==7'd4 &&cu_start_d2_r)? luma_mode_i[17:12] :cu_luma_mode_left_12_r;
            2'd2 : cu_luma_mode_left_12_r <= (cu_idx_r==7'd20&&cu_start_d2_r)? luma_mode_i[17:12] :cu_luma_mode_left_12_r;
            2'd3 : cu_luma_mode_left_12_r <= (cu_idx_r==7'd82&&cu_start_d2_r)? luma_mode_i[17:12] :cu_luma_mode_left_12_r;
        endcase
	end 
end 

// cu_luma_mode_left_13_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_13_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_13_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_6_6_r )
            2'd0 : cu_luma_mode_left_13_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ? luma_mode_i[ 5:0 ] :cu_luma_mode_left_13_r;
            2'd1 : cu_luma_mode_left_13_r <= (cu_idx_r==7'd4 &&cu_start_d2_r) ? luma_mode_i[ 5:0 ] :cu_luma_mode_left_13_r;
            2'd2 : cu_luma_mode_left_13_r <= (cu_idx_r==7'd20&&cu_start_d2_r) ? luma_mode_i[ 5:0 ] :cu_luma_mode_left_13_r;
            2'd3 : cu_luma_mode_left_13_r <= (cu_idx_r==7'd82&&cu_start_d2_r) ? luma_mode_i[ 5:0 ] :cu_luma_mode_left_13_r;
        endcase
	end 
end 

// cu_luma_mode_left_14_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_14_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_14_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_6_6_r )
            2'd0 : cu_luma_mode_left_14_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ? luma_mode_i[17:12]:cu_luma_mode_left_14_r;
            2'd1 : cu_luma_mode_left_14_r <= (cu_idx_r==7'd4 &&cu_start_d2_r) ? luma_mode_i[17:12]:cu_luma_mode_left_14_r;
            2'd2 : cu_luma_mode_left_14_r <= (cu_idx_r==7'd20&&cu_start_d2_r) ? luma_mode_i[17:12]:cu_luma_mode_left_14_r;
            2'd3 : cu_luma_mode_left_14_r <= (cu_idx_r==7'd84&&cu_start_d2_r) ? luma_mode_i[17:12]:cu_luma_mode_left_14_r;
        endcase
	end 
end 

// cu_luma_mode_left_15_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_mode_left_15_r   <=    6'd1      ;
	else if(mb_x_i==mb_x_total_i&&lcu_done_r)
        cu_luma_mode_left_15_r   <=    6'd1      ;
	else begin 
      	case(cu_depth_6_6_r )
            2'd0 : cu_luma_mode_left_15_r <= (cu_idx_r==7'd0 &&cu_start_d2_r) ? luma_mode_i[ 5:0 ]:cu_luma_mode_left_15_r;
            2'd1 : cu_luma_mode_left_15_r <= (cu_idx_r==7'd4 &&cu_start_d2_r) ? luma_mode_i[ 5:0 ]:cu_luma_mode_left_15_r;
            2'd2 : cu_luma_mode_left_15_r <= (cu_idx_r==7'd20&&cu_start_d2_r) ? luma_mode_i[ 5:0 ]:cu_luma_mode_left_15_r;
            2'd3 : cu_luma_mode_left_15_r <= (cu_idx_r==7'd84&&cu_start_d2_r) ? luma_mode_i[ 5:0 ]:cu_luma_mode_left_15_r;
        endcase                
	end 
end 

// cu_left_0_r , cu_left_1_r ,cu_left_2_r , cu_left_3_r , cu_left_4_r , cu_left_5_r ,cu_left_6_r , cu_left_7_r 
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        cu_left_0_r  <=   9'd1      ; cu_left_1_r  <=   9'd1      ;   
		cu_left_2_r  <=   9'd1      ; cu_left_3_r  <=   9'd1      ;   
		cu_left_4_r  <=   9'd1      ; cu_left_5_r  <=   9'd1      ;   
		cu_left_6_r  <=   9'd1      ; cu_left_7_r  <=   9'd1      ;   
        cu_left_8_r  <=   9'd1      ; cu_left_9_r  <=   9'd1      ; 		
		cu_left_10_r <=   9'd1      ; cu_left_11_r <=   9'd1      ; 		
		cu_left_12_r <=   9'd1      ; cu_left_13_r <=   9'd1      ; 		
		cu_left_14_r <=   9'd1      ; cu_left_15_r <=   9'd1      ; 		
	end 	
	else if(lcu_curr_state_r == LCU_END) begin
        cu_left_0_r  <=   {cu_skip_left_0_r,cu_luma_mode_left_0_r ,cu_depth_0_6_r};
		cu_left_1_r  <=   {cu_skip_left_0_r,cu_luma_mode_left_1_r ,cu_depth_0_6_r};
		cu_left_2_r  <=   {cu_skip_left_1_r,cu_luma_mode_left_2_r ,cu_depth_0_6_r};
		cu_left_3_r  <=   {cu_skip_left_1_r,cu_luma_mode_left_3_r ,cu_depth_0_6_r};
		cu_left_4_r  <=   {cu_skip_left_2_r,cu_luma_mode_left_4_r ,cu_depth_2_6_r};
		cu_left_5_r  <=   {cu_skip_left_2_r,cu_luma_mode_left_5_r ,cu_depth_2_6_r};
		cu_left_6_r  <=   {cu_skip_left_3_r,cu_luma_mode_left_6_r ,cu_depth_2_6_r};
		cu_left_7_r  <=   {cu_skip_left_3_r,cu_luma_mode_left_7_r ,cu_depth_2_6_r};	
        cu_left_8_r  <=   {cu_skip_left_4_r,cu_luma_mode_left_8_r ,cu_depth_4_6_r};
		cu_left_9_r  <=   {cu_skip_left_4_r,cu_luma_mode_left_9_r ,cu_depth_4_6_r};
		cu_left_10_r <=   {cu_skip_left_5_r,cu_luma_mode_left_10_r,cu_depth_4_6_r};
		cu_left_11_r <=   {cu_skip_left_5_r,cu_luma_mode_left_11_r,cu_depth_4_6_r};
		cu_left_12_r <=   {cu_skip_left_6_r,cu_luma_mode_left_12_r,cu_depth_6_6_r};
		cu_left_13_r <=   {cu_skip_left_6_r,cu_luma_mode_left_13_r,cu_depth_6_6_r};
		cu_left_14_r <=   {cu_skip_left_7_r,cu_luma_mode_left_14_r,cu_depth_6_6_r};
		cu_left_15_r <=   {cu_skip_left_7_r,cu_luma_mode_left_15_r,cu_depth_6_6_r};	
	end 
	else begin        
	    cu_left_0_r   <=   cu_left_0_r ; cu_left_1_r   <=   cu_left_1_r ;
	    cu_left_2_r   <=   cu_left_2_r ; cu_left_3_r   <=   cu_left_3_r ;
	    cu_left_4_r   <=   cu_left_4_r ; cu_left_5_r   <=   cu_left_5_r ;
	    cu_left_6_r   <=   cu_left_6_r ; cu_left_7_r   <=   cu_left_7_r ;	
	    cu_left_8_r   <=   cu_left_8_r ; cu_left_9_r   <=   cu_left_9_r ;
	    cu_left_10_r  <=   cu_left_10_r; cu_left_11_r  <=   cu_left_11_r;
	    cu_left_12_r  <=   cu_left_12_r; cu_left_13_r  <=   cu_left_13_r;
	    cu_left_14_r  <=   cu_left_14_r; cu_left_15_r  <=   cu_left_15_r;	
	end 
end 

// cu_skip_top_flag      
reg                 cu_skip_top_0_r    ,  cu_skip_top_1_r    ;
reg                 cu_skip_top_2_r    ,  cu_skip_top_3_r    ;
reg                 cu_skip_top_4_r    ,  cu_skip_top_5_r    ;
reg                 cu_skip_top_6_r    ,  cu_skip_top_7_r    ;

// cu_skip_top_0_r  cu_skip_top_1_r
always @* begin
	if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))  begin         // 64x64
		cu_skip_top_0_r = cu_skip_flag_i[0]   ;     
		cu_skip_top_1_r = cu_skip_flag_i[0]   ;  
    end 		
	else if(inter_cu_part_size_i[7:6]!=(`PART_SPLIT)) begin     // 32x32
		cu_skip_top_0_r = cu_skip_flag_i[3]   ; 
   		cu_skip_top_1_r = cu_skip_flag_i[3]   ;  
    end 		
	else if(inter_cu_part_size_i[31:30]!=(`PART_SPLIT))begin    // 16x16 
		cu_skip_top_0_r = cu_skip_flag_i[15]  ;              
        cu_skip_top_1_r = cu_skip_flag_i[15]   ;  
    end 		
	else begin                                                 	// 8x8
		cu_skip_top_0_r = cu_skip_flag_i[63]  ;
	    cu_skip_top_1_r = cu_skip_flag_i[64]  ;  
	end 
end 

// cu_skip_top_2_r  cu_skip_top_3_r
always @* begin
	if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))  begin         // 64x64
		cu_skip_top_2_r = cu_skip_flag_i[0]   ;     
		cu_skip_top_3_r = cu_skip_flag_i[0]   ;  
    end 		
	else if(inter_cu_part_size_i[7:6]!=(`PART_SPLIT)) begin     // 32x32
		cu_skip_top_2_r = cu_skip_flag_i[3]   ; 
   		cu_skip_top_3_r = cu_skip_flag_i[3]   ;  
    end 		
	else if(inter_cu_part_size_i[33:32]!=(`PART_SPLIT))begin    // 16x16 
		cu_skip_top_2_r = cu_skip_flag_i[16]  ;              
        cu_skip_top_3_r = cu_skip_flag_i[16]   ;  
    end 		
	else begin                                                 	// 8x8
		cu_skip_top_2_r = cu_skip_flag_i[67]  ;
	    cu_skip_top_3_r = cu_skip_flag_i[68]  ;  
	end 
end 

// cu_skip_top_4_r  cu_skip_top_5_r
always @* begin
	if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))  begin         // 64x64
		cu_skip_top_4_r = cu_skip_flag_i[0]   ;     
		cu_skip_top_5_r = cu_skip_flag_i[0]   ;  
    end 		
	else if(inter_cu_part_size_i[9:8]!=(`PART_SPLIT)) begin     // 32x32
		cu_skip_top_4_r = cu_skip_flag_i[4]   ; 
   		cu_skip_top_5_r = cu_skip_flag_i[4]   ;  
    end 		
	else if(inter_cu_part_size_i[39:38]!=(`PART_SPLIT))begin    // 16x16 
		cu_skip_top_4_r = cu_skip_flag_i[19]  ;              
        cu_skip_top_5_r = cu_skip_flag_i[19]  ;  
    end 		
	else begin                                                 	// 8x8
		cu_skip_top_4_r = cu_skip_flag_i[79]  ;
	    cu_skip_top_5_r = cu_skip_flag_i[80]  ;  
	end 
end 

// cu_skip_top_6_r  cu_skip_top_7_r
always @* begin
	if(inter_cu_part_size_i[1:0]!=(`PART_SPLIT))  begin         // 64x64
		cu_skip_top_6_r = cu_skip_flag_i[0]   ;     
		cu_skip_top_7_r = cu_skip_flag_i[0]   ;  
    end 		
	else if(inter_cu_part_size_i[9:8]!=(`PART_SPLIT)) begin     // 32x32
		cu_skip_top_6_r = cu_skip_flag_i[4]   ; 
   		cu_skip_top_7_r = cu_skip_flag_i[4]   ;  
    end 		
	else if(inter_cu_part_size_i[39:38]!=(`PART_SPLIT))begin    // 16x16 
		cu_skip_top_6_r = cu_skip_flag_i[20]  ;              
        cu_skip_top_7_r = cu_skip_flag_i[20]  ;  
    end 		
	else begin                                                 	// 8x8
		cu_skip_top_6_r = cu_skip_flag_i[83]  ;
	    cu_skip_top_7_r = cu_skip_flag_i[84]  ;  
	end 
end 
 
// -----------------------------------------------------------------------------------------------------------------------------
//
//		           store in memory 
//
// -----------------------------------------------------------------------------------------------------------------------------
reg 					r_en_neigh_r				;	//read  memory of neighbour info enable
reg 					w_en_neigh_r				;	//write memory of neighbour info enable

wire	[15:0]			r_data_neigh_mb_w			;	//read  data of top LCU 
wire	[15:0]			w_data_neigh_mb_w			;	//write data of top LCU
reg 	[15:0]			r_data_neigh_mb_r			;	//read  data of top LCU 
 
ram_1p #(.Addr_Width((`PIC_X_WIDTH)), .Word_Width(16))	
    cabac_neighbour_1p_8xMB_X_TOTAL_u0(  
		.clk				(  clk				 	), 
		.cen_i              (  1'b0                 ), // low active 
    	.oen_i				(  r_en_neigh_r			), // read  enable ,low active
    	.wen_i				(  w_en_neigh_r			), // write enable ,low active    	
		.addr_i				(  mb_x_i		    	), // address 
    	.data_i				(  w_data_neigh_mb_w	), // write data   
   		
    	.data_o				(  r_data_neigh_mb_w	)  // read  data         
); 

// r_en_neigh_r 
always @* begin
    if(cabac_start_i)
		r_en_neigh_r    =    !mb_y_i;
	else 
		r_en_neigh_r    =    1'b1   ;
end

// w_en_neigh_r
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
	    w_en_neigh_r <=    1'b1  ;
	else if(lcu_done_r)
		w_en_neigh_r <=    1'b0  ;
	else
		w_en_neigh_r <=    1'b1  ;
end 
   
// w_data_neigh_mb_w    
assign w_data_neigh_mb_w = {cu_depth_6_0_r  ,cu_depth_6_2_r   ,cu_depth_6_4_r   ,cu_depth_6_6_r    , 
                            cu_skip_top_0_r ,cu_skip_top_1_r  ,cu_skip_top_2_r  ,cu_skip_top_3_r   ,
							cu_skip_top_4_r ,cu_skip_top_5_r  ,cu_skip_top_6_r  ,cu_skip_top_7_r  };  

//r_data_neigh_mb_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        r_data_neigh_mb_r      <=   16'd0                  ;
    else if(!r_en_neigh_r)
        r_data_neigh_mb_r      <=   r_data_neigh_mb_w      ;				
end 							


// -----------------------------------------------------------------------------------------------------------------------------
//
//		                  calculation syntax elements values based on cu_idx_r 
//
// -----------------------------------------------------------------------------------------------------------------------------

// cu_start_r 
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_start_r     <=  1'b0   ;
    else if(lcu_curr_state_r==CU_SPLIT && !lcu_next_state_r[2]) // split --> cu 
        cu_start_r     <=  1'b1   ;
	else if(!lcu_curr_state_r[2]&&cu_done_r&&!lcu_next_state_r[2]) // cu-->cu 
        cu_start_r     <=  1'b1   ;
	else 
        cu_start_r     <=  1'b0   ;
end 

// cu_start_d1_r  cu_start_d2_r
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)  begin 
        cu_start_d1_r  <=   1'b0         ;
		cu_start_d2_r  <=   1'b0         ;
		cu_start_d3_r  <=   1'b0         ;
	end 
    else begin 
	    cu_start_d1_r  <=   cu_start_r   ;
        cu_start_d2_r  <=   cu_start_d1_r;
        cu_start_d3_r  <=   cu_start_d2_r;
	end 
end 

// cu_sub_div_r : 1 split not encoding ,0 not split but encoding 
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cu_sub_div_r   <=  1'b0   ;
    else begin 		
        case(cu_depth_r)
            2'd0:    cu_sub_div_r   <=  1'b1            ;   
	    	2'd1:    cu_sub_div_r   <=  1'b0            ;
	    	2'd2:    cu_sub_div_r   <=  1'b0            ;
	    	2'd3:    cu_sub_div_r   <=  cu_split_flag_r ;
	    endcase
	end 
end 

// cu_inter_part_size_r
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		cu_inter_part_size_r <= (`PART_2NX2N);
	else begin 
		case(cu_idx_r)
			7'd0  : cu_inter_part_size_r <= inter_cu_part_size_i[ 1: 0];
			7'd1  : cu_inter_part_size_r <= inter_cu_part_size_i[ 3: 2];
			7'd2  : cu_inter_part_size_r <= inter_cu_part_size_i[ 5: 4];
			7'd3  : cu_inter_part_size_r <= inter_cu_part_size_i[ 7: 6];
			7'd4  : cu_inter_part_size_r <= inter_cu_part_size_i[ 9: 8];
			7'd5  : cu_inter_part_size_r <= inter_cu_part_size_i[11:10];
			7'd6  : cu_inter_part_size_r <= inter_cu_part_size_i[13:12];
			7'd7  : cu_inter_part_size_r <= inter_cu_part_size_i[15:14];
			7'd8  : cu_inter_part_size_r <= inter_cu_part_size_i[17:16];
			7'd9  : cu_inter_part_size_r <= inter_cu_part_size_i[19:18];
			7'd10 : cu_inter_part_size_r <= inter_cu_part_size_i[21:20];
			7'd11 : cu_inter_part_size_r <= inter_cu_part_size_i[23:22];
			7'd12 : cu_inter_part_size_r <= inter_cu_part_size_i[25:24];
			7'd13 : cu_inter_part_size_r <= inter_cu_part_size_i[27:26];
			7'd14 : cu_inter_part_size_r <= inter_cu_part_size_i[29:28];
			7'd15 : cu_inter_part_size_r <= inter_cu_part_size_i[31:30];
			7'd16 : cu_inter_part_size_r <= inter_cu_part_size_i[33:32];
			7'd17 : cu_inter_part_size_r <= inter_cu_part_size_i[35:34];
			7'd18 : cu_inter_part_size_r <= inter_cu_part_size_i[37:36];
			7'd19 : cu_inter_part_size_r <= inter_cu_part_size_i[39:38];
			7'd20 : cu_inter_part_size_r <= inter_cu_part_size_i[41:40];
			7'd21 : cu_inter_part_size_r <= inter_cu_part_size_i[43:42];
			7'd22 : cu_inter_part_size_r <= inter_cu_part_size_i[45:44];
			7'd23 : cu_inter_part_size_r <= inter_cu_part_size_i[47:46];
			7'd24 : cu_inter_part_size_r <= inter_cu_part_size_i[49:48];
			7'd25 : cu_inter_part_size_r <= inter_cu_part_size_i[51:50];
			7'd26 : cu_inter_part_size_r <= inter_cu_part_size_i[53:52];
			7'd27 : cu_inter_part_size_r <= inter_cu_part_size_i[55:54];
			7'd28 : cu_inter_part_size_r <= inter_cu_part_size_i[57:56];
			7'd29 : cu_inter_part_size_r <= inter_cu_part_size_i[59:58];
			7'd30 : cu_inter_part_size_r <= inter_cu_part_size_i[61:60];
			7'd31 : cu_inter_part_size_r <= inter_cu_part_size_i[63:62];
			7'd32 : cu_inter_part_size_r <= inter_cu_part_size_i[65:64];
			7'd33 : cu_inter_part_size_r <= inter_cu_part_size_i[67:66];
			7'd34 : cu_inter_part_size_r <= inter_cu_part_size_i[69:68];
			7'd35 : cu_inter_part_size_r <= inter_cu_part_size_i[71:70];
			7'd36 : cu_inter_part_size_r <= inter_cu_part_size_i[73:72];
			7'd37 : cu_inter_part_size_r <= inter_cu_part_size_i[75:74];
			7'd38 : cu_inter_part_size_r <= inter_cu_part_size_i[77:76];
			7'd39 : cu_inter_part_size_r <= inter_cu_part_size_i[79:78];
			7'd40 : cu_inter_part_size_r <= inter_cu_part_size_i[81:80];
			7'd41 : cu_inter_part_size_r <= inter_cu_part_size_i[83:82];
			7'd42 : cu_inter_part_size_r <= inter_cu_part_size_i[85:84];
			7'd43 : cu_inter_part_size_r <= inter_cu_part_size_i[87:86];
			7'd44 : cu_inter_part_size_r <= inter_cu_part_size_i[89:88];
			7'd45 : cu_inter_part_size_r <= inter_cu_part_size_i[91:90];
			7'd46 : cu_inter_part_size_r <= inter_cu_part_size_i[93:92];
			7'd47 : cu_inter_part_size_r <= inter_cu_part_size_i[95:94];
			7'd48 : cu_inter_part_size_r <= inter_cu_part_size_i[97:96];
			7'd49 : cu_inter_part_size_r <= inter_cu_part_size_i[99:98];
			7'd50 : cu_inter_part_size_r <= inter_cu_part_size_i[101:100];
			7'd51 : cu_inter_part_size_r <= inter_cu_part_size_i[103:102];
			7'd52 : cu_inter_part_size_r <= inter_cu_part_size_i[105:104];
			7'd53 : cu_inter_part_size_r <= inter_cu_part_size_i[107:106];
			7'd54 : cu_inter_part_size_r <= inter_cu_part_size_i[109:108];
			7'd55 : cu_inter_part_size_r <= inter_cu_part_size_i[111:110];
			7'd56 : cu_inter_part_size_r <= inter_cu_part_size_i[113:112];
			7'd57 : cu_inter_part_size_r <= inter_cu_part_size_i[115:114];
			7'd58 : cu_inter_part_size_r <= inter_cu_part_size_i[117:116];
			7'd59 : cu_inter_part_size_r <= inter_cu_part_size_i[119:118];
			7'd60 : cu_inter_part_size_r <= inter_cu_part_size_i[121:120];
			7'd61 : cu_inter_part_size_r <= inter_cu_part_size_i[123:122];
			7'd62 : cu_inter_part_size_r <= inter_cu_part_size_i[125:124];
			7'd63 : cu_inter_part_size_r <= inter_cu_part_size_i[127:126];
			7'd64 : cu_inter_part_size_r <= inter_cu_part_size_i[129:128];
			7'd65 : cu_inter_part_size_r <= inter_cu_part_size_i[131:130];
			7'd66 : cu_inter_part_size_r <= inter_cu_part_size_i[133:132];
			7'd67 : cu_inter_part_size_r <= inter_cu_part_size_i[135:134];
			7'd68 : cu_inter_part_size_r <= inter_cu_part_size_i[137:136];
			7'd69 : cu_inter_part_size_r <= inter_cu_part_size_i[139:138];
			7'd70 : cu_inter_part_size_r <= inter_cu_part_size_i[141:140];
			7'd71 : cu_inter_part_size_r <= inter_cu_part_size_i[143:142];
			7'd72 : cu_inter_part_size_r <= inter_cu_part_size_i[145:144];
			7'd73 : cu_inter_part_size_r <= inter_cu_part_size_i[147:146];
			7'd74 : cu_inter_part_size_r <= inter_cu_part_size_i[149:148];
			7'd75 : cu_inter_part_size_r <= inter_cu_part_size_i[151:150];
			7'd76 : cu_inter_part_size_r <= inter_cu_part_size_i[153:152];
			7'd77 : cu_inter_part_size_r <= inter_cu_part_size_i[155:154];
			7'd78 : cu_inter_part_size_r <= inter_cu_part_size_i[157:156];
			7'd79 : cu_inter_part_size_r <= inter_cu_part_size_i[159:158];
			7'd80 : cu_inter_part_size_r <= inter_cu_part_size_i[161:160];
			7'd81 : cu_inter_part_size_r <= inter_cu_part_size_i[163:162];
			7'd82 : cu_inter_part_size_r <= inter_cu_part_size_i[165:164];
			7'd83 : cu_inter_part_size_r <= inter_cu_part_size_i[167:166];
			7'd84 : cu_inter_part_size_r <= inter_cu_part_size_i[169:168];
		   default: cu_inter_part_size_r <= (`PART_2NX2N)              ;
		endcase
	end
end

// cu_merge_flag_r , cu_merge_idx_r   
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
		cu_merge_flag_r           <=      4'b0    ;
		cu_merge_idx_r            <=      12'b0   ;
    end         
    else begin 
        case(cu_idx_r)
            7'd0  : begin  cu_merge_flag_r <= {4{merge_flag_i[84]}};cu_merge_idx_r <= {4{merge_idx_i[255:252]}}; end     
	        7'd1  : begin  cu_merge_flag_r <= {4{merge_flag_i[83]}};cu_merge_idx_r <= {4{merge_idx_i[255:252]}}; end    
	        7'd2  : begin  cu_merge_flag_r <= {4{merge_flag_i[82]}};cu_merge_idx_r <= {4{merge_idx_i[191:188]}}; end    
            7'd3  : begin  cu_merge_flag_r <= {4{merge_flag_i[81]}};cu_merge_idx_r <= {4{merge_idx_i[127:124]}}; end    		  
            7'd4  : begin  cu_merge_flag_r <= {4{merge_flag_i[80]}};cu_merge_idx_r <= {4{merge_idx_i[ 63: 60]}}; end    
            7'd5  : begin  cu_merge_flag_r <= {4{merge_flag_i[79]}};cu_merge_idx_r <= {4{merge_idx_i[255:252]}}; end    
            7'd6  : begin  cu_merge_flag_r <= {4{merge_flag_i[78]}};cu_merge_idx_r <= {4{merge_idx_i[239:236]}}; end    
            7'd7  : begin  cu_merge_flag_r <= {4{merge_flag_i[77]}};cu_merge_idx_r <= {4{merge_idx_i[219:216]}}; end    
            7'd8  : begin  cu_merge_flag_r <= {4{merge_flag_i[76]}};cu_merge_idx_r <= {4{merge_idx_i[207:204]}}; end    
            7'd9  : begin  cu_merge_flag_r <= {4{merge_flag_i[75]}};cu_merge_idx_r <= {4{merge_idx_i[191:188]}}; end    
	        7'd10 : begin  cu_merge_flag_r <= {4{merge_flag_i[74]}};cu_merge_idx_r <= {4{merge_idx_i[175:172]}}; end    
	        7'd11 : begin  cu_merge_flag_r <= {4{merge_flag_i[73]}};cu_merge_idx_r <= {4{merge_idx_i[159:156]}}; end    
	        7'd12 : begin  cu_merge_flag_r <= {4{merge_flag_i[72]}};cu_merge_idx_r <= {4{merge_idx_i[143:140]}}; end    
	        7'd13 : begin  cu_merge_flag_r <= {4{merge_flag_i[71]}};cu_merge_idx_r <= {4{merge_idx_i[127:124]}}; end    
	        7'd14 : begin  cu_merge_flag_r <= {4{merge_flag_i[70]}};cu_merge_idx_r <= {4{merge_idx_i[111:108]}}; end    
	        7'd15 : begin  cu_merge_flag_r <= {4{merge_flag_i[69]}};cu_merge_idx_r <= {4{merge_idx_i[ 95: 92]}}; end    
	        7'd16 : begin  cu_merge_flag_r <= {4{merge_flag_i[68]}};cu_merge_idx_r <= {4{merge_idx_i[ 79: 76]}}; end    
	        7'd17 : begin  cu_merge_flag_r <= {4{merge_flag_i[67]}};cu_merge_idx_r <= {4{merge_idx_i[ 63: 60]}}; end    
	        7'd18 : begin  cu_merge_flag_r <= {4{merge_flag_i[66]}};cu_merge_idx_r <= {4{merge_idx_i[ 47: 44]}}; end    
	        7'd19 : begin  cu_merge_flag_r <= {4{merge_flag_i[65]}};cu_merge_idx_r <= {4{merge_idx_i[ 31: 28]}}; end    
	        7'd20 : begin  cu_merge_flag_r <= {4{merge_flag_i[64]}};cu_merge_idx_r <= {4{merge_idx_i[ 15: 12]}}; end    
	        7'd21 : begin  cu_merge_flag_r <= {4{merge_flag_i[63]}};cu_merge_idx_r <= {4{merge_idx_i[255:252]}}; end    
	        7'd22 : begin  cu_merge_flag_r <= {4{merge_flag_i[62]}};cu_merge_idx_r <= {4{merge_idx_i[251:248]}}; end    
	        7'd23 : begin  cu_merge_flag_r <= {4{merge_flag_i[61]}};cu_merge_idx_r <= {4{merge_idx_i[247:244]}}; end    
	        7'd24 : begin  cu_merge_flag_r <= {4{merge_flag_i[60]}};cu_merge_idx_r <= {4{merge_idx_i[243:240]}}; end    
	        7'd25 : begin  cu_merge_flag_r <= {4{merge_flag_i[59]}};cu_merge_idx_r <= {4{merge_idx_i[239:236]}}; end    
	        7'd26 : begin  cu_merge_flag_r <= {4{merge_flag_i[58]}};cu_merge_idx_r <= {4{merge_idx_i[235:232]}}; end    
	        7'd27 : begin  cu_merge_flag_r <= {4{merge_flag_i[57]}};cu_merge_idx_r <= {4{merge_idx_i[231:228]}}; end    
	        7'd28 : begin  cu_merge_flag_r <= {4{merge_flag_i[56]}};cu_merge_idx_r <= {4{merge_idx_i[227:224]}}; end    
	        7'd29 : begin  cu_merge_flag_r <= {4{merge_flag_i[55]}};cu_merge_idx_r <= {4{merge_idx_i[223:220]}}; end    
	        7'd30 : begin  cu_merge_flag_r <= {4{merge_flag_i[54]}};cu_merge_idx_r <= {4{merge_idx_i[219:216]}}; end    
	        7'd31 : begin  cu_merge_flag_r <= {4{merge_flag_i[53]}};cu_merge_idx_r <= {4{merge_idx_i[215:212]}}; end    
	        7'd32 : begin  cu_merge_flag_r <= {4{merge_flag_i[52]}};cu_merge_idx_r <= {4{merge_idx_i[211:208]}}; end    
	        7'd33 : begin  cu_merge_flag_r <= {4{merge_flag_i[51]}};cu_merge_idx_r <= {4{merge_idx_i[207:204]}}; end    
	        7'd34 : begin  cu_merge_flag_r <= {4{merge_flag_i[50]}};cu_merge_idx_r <= {4{merge_idx_i[203:200]}}; end    
	        7'd35 : begin  cu_merge_flag_r <= {4{merge_flag_i[49]}};cu_merge_idx_r <= {4{merge_idx_i[199:196]}}; end    
	        7'd36 : begin  cu_merge_flag_r <= {4{merge_flag_i[48]}};cu_merge_idx_r <= {4{merge_idx_i[195:192]}}; end    
	        7'd37 : begin  cu_merge_flag_r <= {4{merge_flag_i[47]}};cu_merge_idx_r <= {4{merge_idx_i[191:188]}}; end    
	        7'd38 : begin  cu_merge_flag_r <= {4{merge_flag_i[46]}};cu_merge_idx_r <= {4{merge_idx_i[187:184]}}; end    
	        7'd39 : begin  cu_merge_flag_r <= {4{merge_flag_i[45]}};cu_merge_idx_r <= {4{merge_idx_i[183:180]}}; end    
	        7'd40 : begin  cu_merge_flag_r <= {4{merge_flag_i[44]}};cu_merge_idx_r <= {4{merge_idx_i[179:176]}}; end    
	        7'd41 : begin  cu_merge_flag_r <= {4{merge_flag_i[43]}};cu_merge_idx_r <= {4{merge_idx_i[175:172]}}; end    
	        7'd42 : begin  cu_merge_flag_r <= {4{merge_flag_i[42]}};cu_merge_idx_r <= {4{merge_idx_i[171:168]}}; end    
	        7'd43 : begin  cu_merge_flag_r <= {4{merge_flag_i[41]}};cu_merge_idx_r <= {4{merge_idx_i[167:164]}}; end    
	        7'd44 : begin  cu_merge_flag_r <= {4{merge_flag_i[40]}};cu_merge_idx_r <= {4{merge_idx_i[163:160]}}; end    
	        7'd45 : begin  cu_merge_flag_r <= {4{merge_flag_i[39]}};cu_merge_idx_r <= {4{merge_idx_i[159:156]}}; end    
	        7'd46 : begin  cu_merge_flag_r <= {4{merge_flag_i[38]}};cu_merge_idx_r <= {4{merge_idx_i[155:152]}}; end    
	        7'd47 : begin  cu_merge_flag_r <= {4{merge_flag_i[37]}};cu_merge_idx_r <= {4{merge_idx_i[151:148]}}; end    
	        7'd48 : begin  cu_merge_flag_r <= {4{merge_flag_i[36]}};cu_merge_idx_r <= {4{merge_idx_i[147:144]}}; end    
	        7'd49 : begin  cu_merge_flag_r <= {4{merge_flag_i[35]}};cu_merge_idx_r <= {4{merge_idx_i[143:140]}}; end    
	        7'd50 : begin  cu_merge_flag_r <= {4{merge_flag_i[34]}};cu_merge_idx_r <= {4{merge_idx_i[139:136]}}; end    
	        7'd51 : begin  cu_merge_flag_r <= {4{merge_flag_i[33]}};cu_merge_idx_r <= {4{merge_idx_i[135:132]}}; end    
	        7'd52 : begin  cu_merge_flag_r <= {4{merge_flag_i[32]}};cu_merge_idx_r <= {4{merge_idx_i[131:128]}}; end    
	        7'd53 : begin  cu_merge_flag_r <= {4{merge_flag_i[31]}};cu_merge_idx_r <= {4{merge_idx_i[127:124]}}; end    
	        7'd54 : begin  cu_merge_flag_r <= {4{merge_flag_i[30]}};cu_merge_idx_r <= {4{merge_idx_i[123:120]}}; end    
	        7'd55 : begin  cu_merge_flag_r <= {4{merge_flag_i[29]}};cu_merge_idx_r <= {4{merge_idx_i[119:116]}}; end    
	        7'd56 : begin  cu_merge_flag_r <= {4{merge_flag_i[28]}};cu_merge_idx_r <= {4{merge_idx_i[115:112]}}; end    
	        7'd57 : begin  cu_merge_flag_r <= {4{merge_flag_i[27]}};cu_merge_idx_r <= {4{merge_idx_i[111:108]}}; end    
	        7'd58 : begin  cu_merge_flag_r <= {4{merge_flag_i[26]}};cu_merge_idx_r <= {4{merge_idx_i[107:104]}}; end    
	        7'd59 : begin  cu_merge_flag_r <= {4{merge_flag_i[25]}};cu_merge_idx_r <= {4{merge_idx_i[103:100]}}; end    
	        7'd60 : begin  cu_merge_flag_r <= {4{merge_flag_i[24]}};cu_merge_idx_r <= {4{merge_idx_i[ 99: 96]}}; end    
	        7'd61 : begin  cu_merge_flag_r <= {4{merge_flag_i[23]}};cu_merge_idx_r <= {4{merge_idx_i[ 95: 92]}}; end    
	        7'd62 : begin  cu_merge_flag_r <= {4{merge_flag_i[22]}};cu_merge_idx_r <= {4{merge_idx_i[ 91: 88]}}; end    
	        7'd63 : begin  cu_merge_flag_r <= {4{merge_flag_i[21]}};cu_merge_idx_r <= {4{merge_idx_i[ 87: 84]}}; end    
	        7'd64 : begin  cu_merge_flag_r <= {4{merge_flag_i[20]}};cu_merge_idx_r <= {4{merge_idx_i[ 83: 80]}}; end    
	        7'd65 : begin  cu_merge_flag_r <= {4{merge_flag_i[19]}};cu_merge_idx_r <= {4{merge_idx_i[ 79: 76]}}; end    
	        7'd66 : begin  cu_merge_flag_r <= {4{merge_flag_i[18]}};cu_merge_idx_r <= {4{merge_idx_i[ 75: 72]}}; end    
	        7'd67 : begin  cu_merge_flag_r <= {4{merge_flag_i[17]}};cu_merge_idx_r <= {4{merge_idx_i[ 71: 68]}}; end    
	        7'd68 : begin  cu_merge_flag_r <= {4{merge_flag_i[16]}};cu_merge_idx_r <= {4{merge_idx_i[ 67: 64]}}; end    
	        7'd69 : begin  cu_merge_flag_r <= {4{merge_flag_i[15]}};cu_merge_idx_r <= {4{merge_idx_i[ 63: 60]}}; end    
	        7'd70 : begin  cu_merge_flag_r <= {4{merge_flag_i[14]}};cu_merge_idx_r <= {4{merge_idx_i[ 59: 56]}}; end    
	        7'd71 : begin  cu_merge_flag_r <= {4{merge_flag_i[13]}};cu_merge_idx_r <= {4{merge_idx_i[ 55: 52]}}; end    
	        7'd72 : begin  cu_merge_flag_r <= {4{merge_flag_i[12]}};cu_merge_idx_r <= {4{merge_idx_i[ 51: 48]}}; end    
	        7'd73 : begin  cu_merge_flag_r <= {4{merge_flag_i[11]}};cu_merge_idx_r <= {4{merge_idx_i[ 47: 44]}}; end    
	        7'd74 : begin  cu_merge_flag_r <= {4{merge_flag_i[10]}};cu_merge_idx_r <= {4{merge_idx_i[ 43: 40]}}; end    
	        7'd75 : begin  cu_merge_flag_r <= {4{merge_flag_i[ 9]}};cu_merge_idx_r <= {4{merge_idx_i[ 39: 36]}}; end    
	        7'd76 : begin  cu_merge_flag_r <= {4{merge_flag_i[ 8]}};cu_merge_idx_r <= {4{merge_idx_i[ 35: 32]}}; end    
	        7'd77 : begin  cu_merge_flag_r <= {4{merge_flag_i[ 7]}};cu_merge_idx_r <= {4{merge_idx_i[ 31: 28]}}; end    
	        7'd78 : begin  cu_merge_flag_r <= {4{merge_flag_i[ 6]}};cu_merge_idx_r <= {4{merge_idx_i[ 27: 24]}}; end    
	        7'd79 : begin  cu_merge_flag_r <= {4{merge_flag_i[ 5]}};cu_merge_idx_r <= {4{merge_idx_i[ 23: 20]}}; end    
	        7'd80 : begin  cu_merge_flag_r <= {4{merge_flag_i[ 4]}};cu_merge_idx_r <= {4{merge_idx_i[ 19: 16]}}; end    
	        7'd81 : begin  cu_merge_flag_r <= {4{merge_flag_i[ 3]}};cu_merge_idx_r <= {4{merge_idx_i[ 15: 12]}}; end    
	        7'd82 : begin  cu_merge_flag_r <= {4{merge_flag_i[ 2]}};cu_merge_idx_r <= {4{merge_idx_i[ 11:  8]}}; end    
	        7'd83 : begin  cu_merge_flag_r <= {4{merge_flag_i[ 1]}};cu_merge_idx_r <= {4{merge_idx_i[  7:  4]}}; end    
	        7'd84 : begin  cu_merge_flag_r <= {4{merge_flag_i[ 0]}};cu_merge_idx_r <= {4{merge_idx_i[  3:  0]}}; end    
          default : begin  cu_merge_flag_r <=  4'b0                ;cu_merge_idx_r <= 12'd0                    ; end     
        endcase                                                                                                                                                   
	end 
end  
 
// cu_cbf_y_r
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)	
	    cu_cbf_y_r   <=  4'b0   ;
	else begin 
        case(cu_idx_r[6:0])
            7'd0  : begin cu_cbf_y_r <= {!(!luma_cbf_i[255:192]),!(!luma_cbf_i[191:128]),!(!luma_cbf_i[127:64 ]),!(!luma_cbf_i[ 63:0  ])}; end // 64x64 
	        7'd1  : begin cu_cbf_y_r <= {!(!luma_cbf_i[255:240]),!(!luma_cbf_i[239:224]),!(!luma_cbf_i[223:208]),!(!luma_cbf_i[207:192])}; end // 32x32 
	        7'd2  : begin cu_cbf_y_r <= {!(!luma_cbf_i[191:176]),!(!luma_cbf_i[175:160]),!(!luma_cbf_i[159:144]),!(!luma_cbf_i[143:128])}; end 
            7'd3  : begin cu_cbf_y_r <= {!(!luma_cbf_i[127:112]),!(!luma_cbf_i[111:96 ]),!(!luma_cbf_i[ 95:80 ]),!(!luma_cbf_i[ 79:64 ])}; end 
            7'd4  : begin cu_cbf_y_r <= {!(!luma_cbf_i[ 63:48 ]),!(!luma_cbf_i[ 47:32 ]),!(!luma_cbf_i[ 31:16 ]),!(!luma_cbf_i[ 15:0  ])}; end 
            7'd5  : begin cu_cbf_y_r <= {!(!luma_cbf_i[255:252]),!(!luma_cbf_i[251:248]),!(!luma_cbf_i[247:244]),!(!luma_cbf_i[243:240])}; end // 16x16
            7'd6  : begin cu_cbf_y_r <= {!(!luma_cbf_i[239:236]),!(!luma_cbf_i[235:232]),!(!luma_cbf_i[231:228]),!(!luma_cbf_i[227:224])}; end 
            7'd7  : begin cu_cbf_y_r <= {!(!luma_cbf_i[223:220]),!(!luma_cbf_i[219:216]),!(!luma_cbf_i[215:212]),!(!luma_cbf_i[211:208])}; end 
            7'd8  : begin cu_cbf_y_r <= {!(!luma_cbf_i[207:204]),!(!luma_cbf_i[203:200]),!(!luma_cbf_i[199:196]),!(!luma_cbf_i[195:192])}; end 
            7'd9  : begin cu_cbf_y_r <= {!(!luma_cbf_i[191:188]),!(!luma_cbf_i[187:184]),!(!luma_cbf_i[183:180]),!(!luma_cbf_i[179:176])}; end 
	        7'd10 : begin cu_cbf_y_r <= {!(!luma_cbf_i[175:172]),!(!luma_cbf_i[171:168]),!(!luma_cbf_i[167:164]),!(!luma_cbf_i[163:160])}; end 
	        7'd11 : begin cu_cbf_y_r <= {!(!luma_cbf_i[159:156]),!(!luma_cbf_i[155:152]),!(!luma_cbf_i[151:148]),!(!luma_cbf_i[147:144])}; end 
	        7'd12 : begin cu_cbf_y_r <= {!(!luma_cbf_i[143:140]),!(!luma_cbf_i[139:136]),!(!luma_cbf_i[135:132]),!(!luma_cbf_i[131:128])}; end 
	        7'd13 : begin cu_cbf_y_r <= {!(!luma_cbf_i[127:124]),!(!luma_cbf_i[123:120]),!(!luma_cbf_i[119:116]),!(!luma_cbf_i[115:112])}; end 
	        7'd14 : begin cu_cbf_y_r <= {!(!luma_cbf_i[111:108]),!(!luma_cbf_i[107:104]),!(!luma_cbf_i[103:100]),!(!luma_cbf_i[ 99: 96])}; end 
	        7'd15 : begin cu_cbf_y_r <= {!(!luma_cbf_i[ 95: 92]),!(!luma_cbf_i[ 91: 88]),!(!luma_cbf_i[ 87: 84]),!(!luma_cbf_i[ 83: 80])}; end 
	        7'd16 : begin cu_cbf_y_r <= {!(!luma_cbf_i[ 79: 76]),!(!luma_cbf_i[ 75: 72]),!(!luma_cbf_i[ 71: 68]),!(!luma_cbf_i[ 67: 64])}; end 
	        7'd17 : begin cu_cbf_y_r <= {!(!luma_cbf_i[ 63: 60]),!(!luma_cbf_i[ 59: 56]),!(!luma_cbf_i[ 55: 52]),!(!luma_cbf_i[ 51: 48])}; end 
	        7'd18 : begin cu_cbf_y_r <= {!(!luma_cbf_i[ 47: 44]),!(!luma_cbf_i[ 43: 40]),!(!luma_cbf_i[ 39: 36]),!(!luma_cbf_i[ 35: 32])}; end 
	        7'd19 : begin cu_cbf_y_r <= {!(!luma_cbf_i[ 31: 28]),!(!luma_cbf_i[ 27: 24]),!(!luma_cbf_i[ 23: 20]),!(!luma_cbf_i[ 19: 16])}; end 
	        7'd20 : begin cu_cbf_y_r <= {!(!luma_cbf_i[ 15: 12]),!(!luma_cbf_i[ 11:  8]),!(!luma_cbf_i[  7:  4]),!(!luma_cbf_i[  3:  0])}; end 
	        7'd21 : begin cu_cbf_y_r <= {    luma_cbf_i[  255  ],    luma_cbf_i[  254  ],    luma_cbf_i[  253  ],    luma_cbf_i[  252  ]}; end // 8x8
	        7'd22 : begin cu_cbf_y_r <= {    luma_cbf_i[  251  ],    luma_cbf_i[  250  ],    luma_cbf_i[  249  ],    luma_cbf_i[  248  ]}; end 
	        7'd23 : begin cu_cbf_y_r <= {    luma_cbf_i[  247  ],    luma_cbf_i[  246  ],    luma_cbf_i[  245  ],    luma_cbf_i[  244  ]}; end 
	        7'd24 : begin cu_cbf_y_r <= {    luma_cbf_i[  243  ],    luma_cbf_i[  242  ],    luma_cbf_i[  241  ],    luma_cbf_i[  240  ]}; end 
	        7'd25 : begin cu_cbf_y_r <= {    luma_cbf_i[  239  ],    luma_cbf_i[  238  ],    luma_cbf_i[  237  ],    luma_cbf_i[  236  ]}; end 
	        7'd26 : begin cu_cbf_y_r <= {    luma_cbf_i[  235  ],    luma_cbf_i[  234  ],    luma_cbf_i[  233  ],    luma_cbf_i[  232  ]}; end 
	        7'd27 : begin cu_cbf_y_r <= {    luma_cbf_i[  231  ],    luma_cbf_i[  230  ],    luma_cbf_i[  229  ],    luma_cbf_i[  228  ]}; end 
	        7'd28 : begin cu_cbf_y_r <= {    luma_cbf_i[  227  ],    luma_cbf_i[  226  ],    luma_cbf_i[  225  ],    luma_cbf_i[  224  ]}; end 
	        7'd29 : begin cu_cbf_y_r <= {    luma_cbf_i[  223  ],    luma_cbf_i[  222  ],    luma_cbf_i[  221  ],    luma_cbf_i[  220  ]}; end 
	        7'd30 : begin cu_cbf_y_r <= {    luma_cbf_i[  219  ],    luma_cbf_i[  218  ],    luma_cbf_i[  217  ],    luma_cbf_i[  216  ]}; end 
	        7'd31 : begin cu_cbf_y_r <= {    luma_cbf_i[  215  ],    luma_cbf_i[  214  ],    luma_cbf_i[  213  ],    luma_cbf_i[  212  ]}; end 
	        7'd32 : begin cu_cbf_y_r <= {    luma_cbf_i[  211  ],    luma_cbf_i[  210  ],    luma_cbf_i[  209  ],    luma_cbf_i[  208  ]}; end 
	        7'd33 : begin cu_cbf_y_r <= {    luma_cbf_i[  207  ],    luma_cbf_i[  206  ],    luma_cbf_i[  205  ],    luma_cbf_i[  204  ]}; end 
	        7'd34 : begin cu_cbf_y_r <= {    luma_cbf_i[  203  ],    luma_cbf_i[  202  ],    luma_cbf_i[  201  ],    luma_cbf_i[  200  ]}; end 
	        7'd35 : begin cu_cbf_y_r <= {    luma_cbf_i[  199  ],    luma_cbf_i[  198  ],    luma_cbf_i[  197  ],    luma_cbf_i[  196  ]}; end 
	        7'd36 : begin cu_cbf_y_r <= {    luma_cbf_i[  195  ],    luma_cbf_i[  194  ],    luma_cbf_i[  193  ],    luma_cbf_i[  192  ]}; end 
	        7'd37 : begin cu_cbf_y_r <= {    luma_cbf_i[  191  ],    luma_cbf_i[  190  ],    luma_cbf_i[  189  ],    luma_cbf_i[  188  ]}; end 
	        7'd38 : begin cu_cbf_y_r <= {    luma_cbf_i[  187  ],    luma_cbf_i[  186  ],    luma_cbf_i[  185  ],    luma_cbf_i[  184  ]}; end 
	        7'd39 : begin cu_cbf_y_r <= {    luma_cbf_i[  183  ],    luma_cbf_i[  182  ],    luma_cbf_i[  181  ],    luma_cbf_i[  180  ]}; end 
	        7'd40 : begin cu_cbf_y_r <= {    luma_cbf_i[  179  ],    luma_cbf_i[  178  ],    luma_cbf_i[  177  ],    luma_cbf_i[  176  ]}; end 
	        7'd41 : begin cu_cbf_y_r <= {    luma_cbf_i[  175  ],    luma_cbf_i[  174  ],    luma_cbf_i[  173  ],    luma_cbf_i[  172  ]}; end 
	        7'd42 : begin cu_cbf_y_r <= {    luma_cbf_i[  171  ],    luma_cbf_i[  170  ],    luma_cbf_i[  169  ],    luma_cbf_i[  168  ]}; end 
	        7'd43 : begin cu_cbf_y_r <= {    luma_cbf_i[  167  ],    luma_cbf_i[  166  ],    luma_cbf_i[  165  ],    luma_cbf_i[  164  ]}; end 
	        7'd44 : begin cu_cbf_y_r <= {    luma_cbf_i[  163  ],    luma_cbf_i[  162  ],    luma_cbf_i[  161  ],    luma_cbf_i[  160  ]}; end 
	        7'd45 : begin cu_cbf_y_r <= {    luma_cbf_i[  159  ],    luma_cbf_i[  158  ],    luma_cbf_i[  157  ],    luma_cbf_i[  156  ]}; end 
	        7'd46 : begin cu_cbf_y_r <= {    luma_cbf_i[  155  ],    luma_cbf_i[  154  ],    luma_cbf_i[  153  ],    luma_cbf_i[  152  ]}; end 
	        7'd47 : begin cu_cbf_y_r <= {    luma_cbf_i[  151  ],    luma_cbf_i[  150  ],    luma_cbf_i[  149  ],    luma_cbf_i[  148  ]}; end 
	        7'd48 : begin cu_cbf_y_r <= {    luma_cbf_i[  147  ],    luma_cbf_i[  146  ],    luma_cbf_i[  145  ],    luma_cbf_i[  144  ]}; end 
	        7'd49 : begin cu_cbf_y_r <= {    luma_cbf_i[  143  ],    luma_cbf_i[  142  ],    luma_cbf_i[  141  ],    luma_cbf_i[  140  ]}; end 
	        7'd50 : begin cu_cbf_y_r <= {    luma_cbf_i[  139  ],    luma_cbf_i[  138  ],    luma_cbf_i[  137  ],    luma_cbf_i[  136  ]}; end 
	        7'd51 : begin cu_cbf_y_r <= {    luma_cbf_i[  135  ],    luma_cbf_i[  134  ],    luma_cbf_i[  133  ],    luma_cbf_i[  132  ]}; end 
	        7'd52 : begin cu_cbf_y_r <= {    luma_cbf_i[  131  ],    luma_cbf_i[  130  ],    luma_cbf_i[  129  ],    luma_cbf_i[  128  ]}; end 
	        7'd53 : begin cu_cbf_y_r <= {    luma_cbf_i[  127  ],    luma_cbf_i[  126  ],    luma_cbf_i[  125  ],    luma_cbf_i[  124  ]}; end 
	        7'd54 : begin cu_cbf_y_r <= {    luma_cbf_i[  123  ],    luma_cbf_i[  122  ],    luma_cbf_i[  121  ],    luma_cbf_i[  120  ]}; end 
	        7'd55 : begin cu_cbf_y_r <= {    luma_cbf_i[  119  ],    luma_cbf_i[  118  ],    luma_cbf_i[  117  ],    luma_cbf_i[  116  ]}; end 
	        7'd56 : begin cu_cbf_y_r <= {    luma_cbf_i[  115  ],    luma_cbf_i[  114  ],    luma_cbf_i[  113  ],    luma_cbf_i[  112  ]}; end 
	        7'd57 : begin cu_cbf_y_r <= {    luma_cbf_i[  111  ],    luma_cbf_i[  110  ],    luma_cbf_i[  109  ],    luma_cbf_i[  108  ]}; end 
	        7'd58 : begin cu_cbf_y_r <= {    luma_cbf_i[  107  ],    luma_cbf_i[  106  ],    luma_cbf_i[  105  ],    luma_cbf_i[  104  ]}; end 
	        7'd59 : begin cu_cbf_y_r <= {    luma_cbf_i[  103  ],    luma_cbf_i[  102  ],    luma_cbf_i[  101  ],    luma_cbf_i[  100  ]}; end 
	        7'd60 : begin cu_cbf_y_r <= {    luma_cbf_i[   99  ],    luma_cbf_i[   98  ],    luma_cbf_i[   97  ],    luma_cbf_i[   96  ]}; end 
	        7'd61 : begin cu_cbf_y_r <= {    luma_cbf_i[   95  ],    luma_cbf_i[   94  ],    luma_cbf_i[   93  ],    luma_cbf_i[   92  ]}; end 
	        7'd62 : begin cu_cbf_y_r <= {    luma_cbf_i[   91  ],    luma_cbf_i[   90  ],    luma_cbf_i[   89  ],    luma_cbf_i[   88  ]}; end 
	        7'd63 : begin cu_cbf_y_r <= {    luma_cbf_i[   87  ],    luma_cbf_i[   86  ],    luma_cbf_i[   85  ],    luma_cbf_i[   84  ]}; end 
	        7'd64 : begin cu_cbf_y_r <= {    luma_cbf_i[   83  ],    luma_cbf_i[   82  ],    luma_cbf_i[   81  ],    luma_cbf_i[   80  ]}; end 
	        7'd65 : begin cu_cbf_y_r <= {    luma_cbf_i[   79  ],    luma_cbf_i[   78  ],    luma_cbf_i[   77  ],    luma_cbf_i[   76  ]}; end 
	        7'd66 : begin cu_cbf_y_r <= {    luma_cbf_i[   75  ],    luma_cbf_i[   74  ],    luma_cbf_i[   73  ],    luma_cbf_i[   72  ]}; end 
	        7'd67 : begin cu_cbf_y_r <= {    luma_cbf_i[   71  ],    luma_cbf_i[   70  ],    luma_cbf_i[   69  ],    luma_cbf_i[   68  ]}; end 
	        7'd68 : begin cu_cbf_y_r <= {    luma_cbf_i[   67  ],    luma_cbf_i[   66  ],    luma_cbf_i[   65  ],    luma_cbf_i[   64  ]}; end 
	        7'd69 : begin cu_cbf_y_r <= {    luma_cbf_i[   63  ],    luma_cbf_i[   62  ],    luma_cbf_i[   61  ],    luma_cbf_i[   60  ]}; end 
	        7'd70 : begin cu_cbf_y_r <= {    luma_cbf_i[   59  ],    luma_cbf_i[   58  ],    luma_cbf_i[   57  ],    luma_cbf_i[   56  ]}; end 
	        7'd71 : begin cu_cbf_y_r <= {    luma_cbf_i[   55  ],    luma_cbf_i[   54  ],    luma_cbf_i[   53  ],    luma_cbf_i[   52  ]}; end 
	        7'd72 : begin cu_cbf_y_r <= {    luma_cbf_i[   51  ],    luma_cbf_i[   50  ],    luma_cbf_i[   49  ],    luma_cbf_i[   48  ]}; end 
	        7'd73 : begin cu_cbf_y_r <= {    luma_cbf_i[   47  ],    luma_cbf_i[   46  ],    luma_cbf_i[   45  ],    luma_cbf_i[   44  ]}; end 
	        7'd74 : begin cu_cbf_y_r <= {    luma_cbf_i[   43  ],    luma_cbf_i[   42  ],    luma_cbf_i[   41  ],    luma_cbf_i[   40  ]}; end 
	        7'd75 : begin cu_cbf_y_r <= {    luma_cbf_i[   39  ],    luma_cbf_i[   38  ],    luma_cbf_i[   37  ],    luma_cbf_i[   36  ]}; end 
	        7'd76 : begin cu_cbf_y_r <= {    luma_cbf_i[   35  ],    luma_cbf_i[   34  ],    luma_cbf_i[   33  ],    luma_cbf_i[   32  ]}; end 
	        7'd77 : begin cu_cbf_y_r <= {    luma_cbf_i[   31  ],    luma_cbf_i[   30  ],    luma_cbf_i[   29  ],    luma_cbf_i[   28  ]}; end 
	        7'd78 : begin cu_cbf_y_r <= {    luma_cbf_i[   27  ],    luma_cbf_i[   26  ],    luma_cbf_i[   25  ],    luma_cbf_i[   24  ]}; end 
	        7'd79 : begin cu_cbf_y_r <= {    luma_cbf_i[   23  ],    luma_cbf_i[   22  ],    luma_cbf_i[   21  ],    luma_cbf_i[   20  ]}; end 
	        7'd80 : begin cu_cbf_y_r <= {    luma_cbf_i[   19  ],    luma_cbf_i[   18  ],    luma_cbf_i[   17  ],    luma_cbf_i[   16  ]}; end 
	        7'd81 : begin cu_cbf_y_r <= {    luma_cbf_i[   15  ],    luma_cbf_i[   14  ],    luma_cbf_i[   13  ],    luma_cbf_i[   12  ]}; end 
	        7'd82 : begin cu_cbf_y_r <= {    luma_cbf_i[   11  ],    luma_cbf_i[   10  ],    luma_cbf_i[    9  ],    luma_cbf_i[    8  ]}; end 
	        7'd83 : begin cu_cbf_y_r <= {    luma_cbf_i[    7  ],    luma_cbf_i[    6  ],    luma_cbf_i[    5  ],    luma_cbf_i[    4  ]}; end 
	        7'd84 : begin cu_cbf_y_r <= {    luma_cbf_i[    3  ],    luma_cbf_i[    2  ],    luma_cbf_i[    1  ],    luma_cbf_i[    0  ]}; end 
          default : begin cu_cbf_y_r <= 4'b0                                                                                             ; end 
        endcase 
	end 
end  

// cu_cbf_u_r
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)	
	    cu_cbf_u_r   <=  4'b0   ;
	else begin 
        case(cu_idx_r[6:0])
            7'd0  : begin cu_cbf_u_r <= {!(!cb_cbf_i[255:192]),!(!cb_cbf_i[191:128]),!(!cb_cbf_i[127:64 ]),!(!cb_cbf_i[ 63:0  ])}; end // 64x64 
	        7'd1  : begin cu_cbf_u_r <= {!(!cb_cbf_i[255:240]),!(!cb_cbf_i[239:224]),!(!cb_cbf_i[223:208]),!(!cb_cbf_i[207:192])}; end // 32x32 
	        7'd2  : begin cu_cbf_u_r <= {!(!cb_cbf_i[191:176]),!(!cb_cbf_i[175:160]),!(!cb_cbf_i[159:144]),!(!cb_cbf_i[143:128])}; end 
            7'd3  : begin cu_cbf_u_r <= {!(!cb_cbf_i[127:112]),!(!cb_cbf_i[111:96 ]),!(!cb_cbf_i[ 95:80 ]),!(!cb_cbf_i[ 79:64 ])}; end 
            7'd4  : begin cu_cbf_u_r <= {!(!cb_cbf_i[ 63:48 ]),!(!cb_cbf_i[ 47:32 ]),!(!cb_cbf_i[ 31:16 ]),!(!cb_cbf_i[ 15:0  ])}; end 
            7'd5  : begin cu_cbf_u_r <= {!(!cb_cbf_i[255:252]),!(!cb_cbf_i[251:248]),!(!cb_cbf_i[247:244]),!(!cb_cbf_i[243:240])}; end // 16x16
            7'd6  : begin cu_cbf_u_r <= {!(!cb_cbf_i[239:236]),!(!cb_cbf_i[235:232]),!(!cb_cbf_i[231:228]),!(!cb_cbf_i[227:224])}; end 
            7'd7  : begin cu_cbf_u_r <= {!(!cb_cbf_i[223:220]),!(!cb_cbf_i[219:216]),!(!cb_cbf_i[215:212]),!(!cb_cbf_i[211:208])}; end 
            7'd8  : begin cu_cbf_u_r <= {!(!cb_cbf_i[207:204]),!(!cb_cbf_i[203:200]),!(!cb_cbf_i[199:196]),!(!cb_cbf_i[195:192])}; end 
            7'd9  : begin cu_cbf_u_r <= {!(!cb_cbf_i[191:188]),!(!cb_cbf_i[187:184]),!(!cb_cbf_i[183:180]),!(!cb_cbf_i[179:176])}; end 
	        7'd10 : begin cu_cbf_u_r <= {!(!cb_cbf_i[175:172]),!(!cb_cbf_i[171:168]),!(!cb_cbf_i[167:164]),!(!cb_cbf_i[163:160])}; end 
	        7'd11 : begin cu_cbf_u_r <= {!(!cb_cbf_i[159:156]),!(!cb_cbf_i[155:152]),!(!cb_cbf_i[151:148]),!(!cb_cbf_i[147:144])}; end 
	        7'd12 : begin cu_cbf_u_r <= {!(!cb_cbf_i[143:140]),!(!cb_cbf_i[139:136]),!(!cb_cbf_i[135:132]),!(!cb_cbf_i[131:128])}; end 
	        7'd13 : begin cu_cbf_u_r <= {!(!cb_cbf_i[127:124]),!(!cb_cbf_i[123:120]),!(!cb_cbf_i[119:116]),!(!cb_cbf_i[115:112])}; end 
	        7'd14 : begin cu_cbf_u_r <= {!(!cb_cbf_i[111:108]),!(!cb_cbf_i[107:104]),!(!cb_cbf_i[103:100]),!(!cb_cbf_i[ 99: 96])}; end 
	        7'd15 : begin cu_cbf_u_r <= {!(!cb_cbf_i[ 95: 92]),!(!cb_cbf_i[ 91: 88]),!(!cb_cbf_i[ 87: 84]),!(!cb_cbf_i[ 83: 80])}; end 
	        7'd16 : begin cu_cbf_u_r <= {!(!cb_cbf_i[ 79: 76]),!(!cb_cbf_i[ 75: 72]),!(!cb_cbf_i[ 71: 68]),!(!cb_cbf_i[ 67: 64])}; end 
	        7'd17 : begin cu_cbf_u_r <= {!(!cb_cbf_i[ 63: 60]),!(!cb_cbf_i[ 59: 56]),!(!cb_cbf_i[ 55: 52]),!(!cb_cbf_i[ 51: 48])}; end 
	        7'd18 : begin cu_cbf_u_r <= {!(!cb_cbf_i[ 47: 44]),!(!cb_cbf_i[ 43: 40]),!(!cb_cbf_i[ 39: 36]),!(!cb_cbf_i[ 35: 32])}; end 
	        7'd19 : begin cu_cbf_u_r <= {!(!cb_cbf_i[ 31: 28]),!(!cb_cbf_i[ 27: 24]),!(!cb_cbf_i[ 23: 20]),!(!cb_cbf_i[ 19: 16])}; end 
	        7'd20 : begin cu_cbf_u_r <= {!(!cb_cbf_i[ 15: 12]),!(!cb_cbf_i[ 11:  8]),!(!cb_cbf_i[  7:  4]),!(!cb_cbf_i[  3:  0])}; end 
	        7'd21 : begin cu_cbf_u_r <= {    cb_cbf_i[  255  ],    cb_cbf_i[  254  ],    cb_cbf_i[  253  ],    cb_cbf_i[  252  ]}; end // 8x8
	        7'd22 : begin cu_cbf_u_r <= {    cb_cbf_i[  251  ],    cb_cbf_i[  250  ],    cb_cbf_i[  249  ],    cb_cbf_i[  248  ]}; end 
	        7'd23 : begin cu_cbf_u_r <= {    cb_cbf_i[  247  ],    cb_cbf_i[  246  ],    cb_cbf_i[  245  ],    cb_cbf_i[  244  ]}; end 
	        7'd24 : begin cu_cbf_u_r <= {    cb_cbf_i[  243  ],    cb_cbf_i[  242  ],    cb_cbf_i[  241  ],    cb_cbf_i[  240  ]}; end 
	        7'd25 : begin cu_cbf_u_r <= {    cb_cbf_i[  239  ],    cb_cbf_i[  238  ],    cb_cbf_i[  237  ],    cb_cbf_i[  236  ]}; end 
	        7'd26 : begin cu_cbf_u_r <= {    cb_cbf_i[  235  ],    cb_cbf_i[  234  ],    cb_cbf_i[  233  ],    cb_cbf_i[  232  ]}; end 
	        7'd27 : begin cu_cbf_u_r <= {    cb_cbf_i[  231  ],    cb_cbf_i[  230  ],    cb_cbf_i[  229  ],    cb_cbf_i[  228  ]}; end 
	        7'd28 : begin cu_cbf_u_r <= {    cb_cbf_i[  227  ],    cb_cbf_i[  226  ],    cb_cbf_i[  225  ],    cb_cbf_i[  224  ]}; end 
	        7'd29 : begin cu_cbf_u_r <= {    cb_cbf_i[  223  ],    cb_cbf_i[  222  ],    cb_cbf_i[  221  ],    cb_cbf_i[  220  ]}; end 
	        7'd30 : begin cu_cbf_u_r <= {    cb_cbf_i[  219  ],    cb_cbf_i[  218  ],    cb_cbf_i[  217  ],    cb_cbf_i[  216  ]}; end 
	        7'd31 : begin cu_cbf_u_r <= {    cb_cbf_i[  215  ],    cb_cbf_i[  214  ],    cb_cbf_i[  213  ],    cb_cbf_i[  212  ]}; end 
	        7'd32 : begin cu_cbf_u_r <= {    cb_cbf_i[  211  ],    cb_cbf_i[  210  ],    cb_cbf_i[  209  ],    cb_cbf_i[  208  ]}; end 
	        7'd33 : begin cu_cbf_u_r <= {    cb_cbf_i[  207  ],    cb_cbf_i[  206  ],    cb_cbf_i[  205  ],    cb_cbf_i[  204  ]}; end 
	        7'd34 : begin cu_cbf_u_r <= {    cb_cbf_i[  203  ],    cb_cbf_i[  202  ],    cb_cbf_i[  201  ],    cb_cbf_i[  200  ]}; end 
	        7'd35 : begin cu_cbf_u_r <= {    cb_cbf_i[  199  ],    cb_cbf_i[  198  ],    cb_cbf_i[  197  ],    cb_cbf_i[  196  ]}; end 
	        7'd36 : begin cu_cbf_u_r <= {    cb_cbf_i[  195  ],    cb_cbf_i[  194  ],    cb_cbf_i[  193  ],    cb_cbf_i[  192  ]}; end 
	        7'd37 : begin cu_cbf_u_r <= {    cb_cbf_i[  191  ],    cb_cbf_i[  190  ],    cb_cbf_i[  189  ],    cb_cbf_i[  188  ]}; end 
	        7'd38 : begin cu_cbf_u_r <= {    cb_cbf_i[  187  ],    cb_cbf_i[  186  ],    cb_cbf_i[  185  ],    cb_cbf_i[  184  ]}; end 
	        7'd39 : begin cu_cbf_u_r <= {    cb_cbf_i[  183  ],    cb_cbf_i[  182  ],    cb_cbf_i[  181  ],    cb_cbf_i[  180  ]}; end 
	        7'd40 : begin cu_cbf_u_r <= {    cb_cbf_i[  179  ],    cb_cbf_i[  178  ],    cb_cbf_i[  177  ],    cb_cbf_i[  176  ]}; end 
	        7'd41 : begin cu_cbf_u_r <= {    cb_cbf_i[  175  ],    cb_cbf_i[  174  ],    cb_cbf_i[  173  ],    cb_cbf_i[  172  ]}; end 
	        7'd42 : begin cu_cbf_u_r <= {    cb_cbf_i[  171  ],    cb_cbf_i[  170  ],    cb_cbf_i[  169  ],    cb_cbf_i[  168  ]}; end 
	        7'd43 : begin cu_cbf_u_r <= {    cb_cbf_i[  167  ],    cb_cbf_i[  166  ],    cb_cbf_i[  165  ],    cb_cbf_i[  164  ]}; end 
	        7'd44 : begin cu_cbf_u_r <= {    cb_cbf_i[  163  ],    cb_cbf_i[  162  ],    cb_cbf_i[  161  ],    cb_cbf_i[  160  ]}; end 
	        7'd45 : begin cu_cbf_u_r <= {    cb_cbf_i[  159  ],    cb_cbf_i[  158  ],    cb_cbf_i[  157  ],    cb_cbf_i[  156  ]}; end 
	        7'd46 : begin cu_cbf_u_r <= {    cb_cbf_i[  155  ],    cb_cbf_i[  154  ],    cb_cbf_i[  153  ],    cb_cbf_i[  152  ]}; end 
	        7'd47 : begin cu_cbf_u_r <= {    cb_cbf_i[  151  ],    cb_cbf_i[  150  ],    cb_cbf_i[  149  ],    cb_cbf_i[  148  ]}; end 
	        7'd48 : begin cu_cbf_u_r <= {    cb_cbf_i[  147  ],    cb_cbf_i[  146  ],    cb_cbf_i[  145  ],    cb_cbf_i[  144  ]}; end 
	        7'd49 : begin cu_cbf_u_r <= {    cb_cbf_i[  143  ],    cb_cbf_i[  142  ],    cb_cbf_i[  141  ],    cb_cbf_i[  140  ]}; end 
	        7'd50 : begin cu_cbf_u_r <= {    cb_cbf_i[  139  ],    cb_cbf_i[  138  ],    cb_cbf_i[  137  ],    cb_cbf_i[  136  ]}; end 
	        7'd51 : begin cu_cbf_u_r <= {    cb_cbf_i[  135  ],    cb_cbf_i[  134  ],    cb_cbf_i[  133  ],    cb_cbf_i[  132  ]}; end 
	        7'd52 : begin cu_cbf_u_r <= {    cb_cbf_i[  131  ],    cb_cbf_i[  130  ],    cb_cbf_i[  129  ],    cb_cbf_i[  128  ]}; end 
	        7'd53 : begin cu_cbf_u_r <= {    cb_cbf_i[  127  ],    cb_cbf_i[  126  ],    cb_cbf_i[  125  ],    cb_cbf_i[  124  ]}; end 
	        7'd54 : begin cu_cbf_u_r <= {    cb_cbf_i[  123  ],    cb_cbf_i[  122  ],    cb_cbf_i[  121  ],    cb_cbf_i[  120  ]}; end 
	        7'd55 : begin cu_cbf_u_r <= {    cb_cbf_i[  119  ],    cb_cbf_i[  118  ],    cb_cbf_i[  117  ],    cb_cbf_i[  116  ]}; end 
	        7'd56 : begin cu_cbf_u_r <= {    cb_cbf_i[  115  ],    cb_cbf_i[  114  ],    cb_cbf_i[  113  ],    cb_cbf_i[  112  ]}; end 
	        7'd57 : begin cu_cbf_u_r <= {    cb_cbf_i[  111  ],    cb_cbf_i[  110  ],    cb_cbf_i[  109  ],    cb_cbf_i[  108  ]}; end 
	        7'd58 : begin cu_cbf_u_r <= {    cb_cbf_i[  107  ],    cb_cbf_i[  106  ],    cb_cbf_i[  105  ],    cb_cbf_i[  104  ]}; end 
	        7'd59 : begin cu_cbf_u_r <= {    cb_cbf_i[  103  ],    cb_cbf_i[  102  ],    cb_cbf_i[  101  ],    cb_cbf_i[  100  ]}; end 
	        7'd60 : begin cu_cbf_u_r <= {    cb_cbf_i[   99  ],    cb_cbf_i[   98  ],    cb_cbf_i[   97  ],    cb_cbf_i[   96  ]}; end 
	        7'd61 : begin cu_cbf_u_r <= {    cb_cbf_i[   95  ],    cb_cbf_i[   94  ],    cb_cbf_i[   93  ],    cb_cbf_i[   92  ]}; end 
	        7'd62 : begin cu_cbf_u_r <= {    cb_cbf_i[   91  ],    cb_cbf_i[   90  ],    cb_cbf_i[   89  ],    cb_cbf_i[   88  ]}; end 
	        7'd63 : begin cu_cbf_u_r <= {    cb_cbf_i[   87  ],    cb_cbf_i[   86  ],    cb_cbf_i[   85  ],    cb_cbf_i[   84  ]}; end 
	        7'd64 : begin cu_cbf_u_r <= {    cb_cbf_i[   83  ],    cb_cbf_i[   82  ],    cb_cbf_i[   81  ],    cb_cbf_i[   80  ]}; end 
	        7'd65 : begin cu_cbf_u_r <= {    cb_cbf_i[   79  ],    cb_cbf_i[   78  ],    cb_cbf_i[   77  ],    cb_cbf_i[   76  ]}; end 
	        7'd66 : begin cu_cbf_u_r <= {    cb_cbf_i[   75  ],    cb_cbf_i[   74  ],    cb_cbf_i[   73  ],    cb_cbf_i[   72  ]}; end 
	        7'd67 : begin cu_cbf_u_r <= {    cb_cbf_i[   71  ],    cb_cbf_i[   70  ],    cb_cbf_i[   69  ],    cb_cbf_i[   68  ]}; end 
	        7'd68 : begin cu_cbf_u_r <= {    cb_cbf_i[   67  ],    cb_cbf_i[   66  ],    cb_cbf_i[   65  ],    cb_cbf_i[   64  ]}; end 
	        7'd69 : begin cu_cbf_u_r <= {    cb_cbf_i[   63  ],    cb_cbf_i[   62  ],    cb_cbf_i[   61  ],    cb_cbf_i[   60  ]}; end 
	        7'd70 : begin cu_cbf_u_r <= {    cb_cbf_i[   59  ],    cb_cbf_i[   58  ],    cb_cbf_i[   57  ],    cb_cbf_i[   56  ]}; end 
	        7'd71 : begin cu_cbf_u_r <= {    cb_cbf_i[   55  ],    cb_cbf_i[   54  ],    cb_cbf_i[   53  ],    cb_cbf_i[   52  ]}; end 
	        7'd72 : begin cu_cbf_u_r <= {    cb_cbf_i[   51  ],    cb_cbf_i[   50  ],    cb_cbf_i[   49  ],    cb_cbf_i[   48  ]}; end 
	        7'd73 : begin cu_cbf_u_r <= {    cb_cbf_i[   47  ],    cb_cbf_i[   46  ],    cb_cbf_i[   45  ],    cb_cbf_i[   44  ]}; end 
	        7'd74 : begin cu_cbf_u_r <= {    cb_cbf_i[   43  ],    cb_cbf_i[   42  ],    cb_cbf_i[   41  ],    cb_cbf_i[   40  ]}; end 
	        7'd75 : begin cu_cbf_u_r <= {    cb_cbf_i[   39  ],    cb_cbf_i[   38  ],    cb_cbf_i[   37  ],    cb_cbf_i[   36  ]}; end 
	        7'd76 : begin cu_cbf_u_r <= {    cb_cbf_i[   35  ],    cb_cbf_i[   34  ],    cb_cbf_i[   33  ],    cb_cbf_i[   32  ]}; end 
	        7'd77 : begin cu_cbf_u_r <= {    cb_cbf_i[   31  ],    cb_cbf_i[   30  ],    cb_cbf_i[   29  ],    cb_cbf_i[   28  ]}; end 
	        7'd78 : begin cu_cbf_u_r <= {    cb_cbf_i[   27  ],    cb_cbf_i[   26  ],    cb_cbf_i[   25  ],    cb_cbf_i[   24  ]}; end 
	        7'd79 : begin cu_cbf_u_r <= {    cb_cbf_i[   23  ],    cb_cbf_i[   22  ],    cb_cbf_i[   21  ],    cb_cbf_i[   20  ]}; end 
	        7'd80 : begin cu_cbf_u_r <= {    cb_cbf_i[   19  ],    cb_cbf_i[   18  ],    cb_cbf_i[   17  ],    cb_cbf_i[   16  ]}; end 
	        7'd81 : begin cu_cbf_u_r <= {    cb_cbf_i[   15  ],    cb_cbf_i[   14  ],    cb_cbf_i[   13  ],    cb_cbf_i[   12  ]}; end 
	        7'd82 : begin cu_cbf_u_r <= {    cb_cbf_i[   11  ],    cb_cbf_i[   10  ],    cb_cbf_i[    9  ],    cb_cbf_i[    8  ]}; end 
	        7'd83 : begin cu_cbf_u_r <= {    cb_cbf_i[    7  ],    cb_cbf_i[    6  ],    cb_cbf_i[    5  ],    cb_cbf_i[    4  ]}; end 
	        7'd84 : begin cu_cbf_u_r <= {    cb_cbf_i[    3  ],    cb_cbf_i[    2  ],    cb_cbf_i[    1  ],    cb_cbf_i[    0  ]}; end 
          default : begin cu_cbf_u_r <= 4'b0                                                                                     ; end 
        endcase 
	end 
end  

// cu_cbf_v_r
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)	
	    cu_cbf_v_r   <=  4'b0   ;
	else begin 
        case(cu_idx_r[6:0])
            7'd0  : begin cu_cbf_v_r <= {!(!cr_cbf_i[255:192]),!(!cr_cbf_i[191:128]),!(!cr_cbf_i[127:64 ]),!(!cr_cbf_i[ 63:0  ])}; end // 64x64 
	        7'd1  : begin cu_cbf_v_r <= {!(!cr_cbf_i[255:240]),!(!cr_cbf_i[239:224]),!(!cr_cbf_i[223:208]),!(!cr_cbf_i[207:192])}; end // 32x32 
	        7'd2  : begin cu_cbf_v_r <= {!(!cr_cbf_i[191:176]),!(!cr_cbf_i[175:160]),!(!cr_cbf_i[159:144]),!(!cr_cbf_i[143:128])}; end 
            7'd3  : begin cu_cbf_v_r <= {!(!cr_cbf_i[127:112]),!(!cr_cbf_i[111:96 ]),!(!cr_cbf_i[ 95:80 ]),!(!cr_cbf_i[ 79:64 ])}; end 
            7'd4  : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 63:48 ]),!(!cr_cbf_i[ 47:32 ]),!(!cr_cbf_i[ 31:16 ]),!(!cr_cbf_i[ 15:0  ])}; end 
            7'd5  : begin cu_cbf_v_r <= {!(!cr_cbf_i[255:252]),!(!cr_cbf_i[251:248]),!(!cr_cbf_i[247:244]),!(!cr_cbf_i[243:240])}; end // 16x16
            7'd6  : begin cu_cbf_v_r <= {!(!cr_cbf_i[239:236]),!(!cr_cbf_i[235:232]),!(!cr_cbf_i[231:228]),!(!cr_cbf_i[227:224])}; end 
            7'd7  : begin cu_cbf_v_r <= {!(!cr_cbf_i[223:220]),!(!cr_cbf_i[219:216]),!(!cr_cbf_i[215:212]),!(!cr_cbf_i[211:208])}; end 
            7'd8  : begin cu_cbf_v_r <= {!(!cr_cbf_i[207:204]),!(!cr_cbf_i[203:200]),!(!cr_cbf_i[199:196]),!(!cr_cbf_i[195:192])}; end 
            7'd9  : begin cu_cbf_v_r <= {!(!cr_cbf_i[191:188]),!(!cr_cbf_i[187:184]),!(!cr_cbf_i[183:180]),!(!cr_cbf_i[179:176])}; end 
	        7'd10 : begin cu_cbf_v_r <= {!(!cr_cbf_i[175:172]),!(!cr_cbf_i[171:168]),!(!cr_cbf_i[167:164]),!(!cr_cbf_i[163:160])}; end 
	        7'd11 : begin cu_cbf_v_r <= {!(!cr_cbf_i[159:156]),!(!cr_cbf_i[155:152]),!(!cr_cbf_i[151:148]),!(!cr_cbf_i[147:144])}; end 
	        7'd12 : begin cu_cbf_v_r <= {!(!cr_cbf_i[143:140]),!(!cr_cbf_i[139:136]),!(!cr_cbf_i[135:132]),!(!cr_cbf_i[131:128])}; end 
	        7'd13 : begin cu_cbf_v_r <= {!(!cr_cbf_i[127:124]),!(!cr_cbf_i[123:120]),!(!cr_cbf_i[119:116]),!(!cr_cbf_i[115:112])}; end 
	        7'd14 : begin cu_cbf_v_r <= {!(!cr_cbf_i[111:108]),!(!cr_cbf_i[107:104]),!(!cr_cbf_i[103:100]),!(!cr_cbf_i[ 99: 96])}; end 
	        7'd15 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 95: 92]),!(!cr_cbf_i[ 91: 88]),!(!cr_cbf_i[ 87: 84]),!(!cr_cbf_i[ 83: 80])}; end 
	        7'd16 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 79: 76]),!(!cr_cbf_i[ 75: 72]),!(!cr_cbf_i[ 71: 68]),!(!cr_cbf_i[ 67: 64])}; end 
	        7'd17 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 63: 60]),!(!cr_cbf_i[ 59: 56]),!(!cr_cbf_i[ 55: 52]),!(!cr_cbf_i[ 51: 48])}; end 
	        7'd18 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 47: 44]),!(!cr_cbf_i[ 43: 40]),!(!cr_cbf_i[ 39: 36]),!(!cr_cbf_i[ 35: 32])}; end 
	        7'd19 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 31: 28]),!(!cr_cbf_i[ 27: 24]),!(!cr_cbf_i[ 23: 20]),!(!cr_cbf_i[ 19: 16])}; end 
	        7'd20 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 15: 12]),!(!cr_cbf_i[ 11:  8]),!(!cr_cbf_i[  7:  4]),!(!cr_cbf_i[  3:  0])}; end 
	        7'd21 : begin cu_cbf_v_r <= {    cr_cbf_i[  255  ],    cr_cbf_i[  254  ],    cr_cbf_i[  253  ],    cr_cbf_i[  252  ]}; end // 8x8
	        7'd22 : begin cu_cbf_v_r <= {    cr_cbf_i[  251  ],    cr_cbf_i[  250  ],    cr_cbf_i[  249  ],    cr_cbf_i[  248  ]}; end 
	        7'd23 : begin cu_cbf_v_r <= {    cr_cbf_i[  247  ],    cr_cbf_i[  246  ],    cr_cbf_i[  245  ],    cr_cbf_i[  244  ]}; end 
	        7'd24 : begin cu_cbf_v_r <= {    cr_cbf_i[  243  ],    cr_cbf_i[  242  ],    cr_cbf_i[  241  ],    cr_cbf_i[  240  ]}; end 
	        7'd25 : begin cu_cbf_v_r <= {    cr_cbf_i[  239  ],    cr_cbf_i[  238  ],    cr_cbf_i[  237  ],    cr_cbf_i[  236  ]}; end 
	        7'd26 : begin cu_cbf_v_r <= {    cr_cbf_i[  235  ],    cr_cbf_i[  234  ],    cr_cbf_i[  233  ],    cr_cbf_i[  232  ]}; end 
	        7'd27 : begin cu_cbf_v_r <= {    cr_cbf_i[  231  ],    cr_cbf_i[  230  ],    cr_cbf_i[  229  ],    cr_cbf_i[  228  ]}; end 
	        7'd28 : begin cu_cbf_v_r <= {    cr_cbf_i[  227  ],    cr_cbf_i[  226  ],    cr_cbf_i[  225  ],    cr_cbf_i[  224  ]}; end 
	        7'd29 : begin cu_cbf_v_r <= {    cr_cbf_i[  223  ],    cr_cbf_i[  222  ],    cr_cbf_i[  221  ],    cr_cbf_i[  220  ]}; end 
	        7'd30 : begin cu_cbf_v_r <= {    cr_cbf_i[  219  ],    cr_cbf_i[  218  ],    cr_cbf_i[  217  ],    cr_cbf_i[  216  ]}; end 
	        7'd31 : begin cu_cbf_v_r <= {    cr_cbf_i[  215  ],    cr_cbf_i[  214  ],    cr_cbf_i[  213  ],    cr_cbf_i[  212  ]}; end 
	        7'd32 : begin cu_cbf_v_r <= {    cr_cbf_i[  211  ],    cr_cbf_i[  210  ],    cr_cbf_i[  209  ],    cr_cbf_i[  208  ]}; end 
	        7'd33 : begin cu_cbf_v_r <= {    cr_cbf_i[  207  ],    cr_cbf_i[  206  ],    cr_cbf_i[  205  ],    cr_cbf_i[  204  ]}; end 
	        7'd34 : begin cu_cbf_v_r <= {    cr_cbf_i[  203  ],    cr_cbf_i[  202  ],    cr_cbf_i[  201  ],    cr_cbf_i[  200  ]}; end 
	        7'd35 : begin cu_cbf_v_r <= {    cr_cbf_i[  199  ],    cr_cbf_i[  198  ],    cr_cbf_i[  197  ],    cr_cbf_i[  196  ]}; end 
	        7'd36 : begin cu_cbf_v_r <= {    cr_cbf_i[  195  ],    cr_cbf_i[  194  ],    cr_cbf_i[  193  ],    cr_cbf_i[  192  ]}; end 
	        7'd37 : begin cu_cbf_v_r <= {    cr_cbf_i[  191  ],    cr_cbf_i[  190  ],    cr_cbf_i[  189  ],    cr_cbf_i[  188  ]}; end 
	        7'd38 : begin cu_cbf_v_r <= {    cr_cbf_i[  187  ],    cr_cbf_i[  186  ],    cr_cbf_i[  185  ],    cr_cbf_i[  184  ]}; end 
	        7'd39 : begin cu_cbf_v_r <= {    cr_cbf_i[  183  ],    cr_cbf_i[  182  ],    cr_cbf_i[  181  ],    cr_cbf_i[  180  ]}; end 
	        7'd40 : begin cu_cbf_v_r <= {    cr_cbf_i[  179  ],    cr_cbf_i[  178  ],    cr_cbf_i[  177  ],    cr_cbf_i[  176  ]}; end 
	        7'd41 : begin cu_cbf_v_r <= {    cr_cbf_i[  175  ],    cr_cbf_i[  174  ],    cr_cbf_i[  173  ],    cr_cbf_i[  172  ]}; end 
	        7'd42 : begin cu_cbf_v_r <= {    cr_cbf_i[  171  ],    cr_cbf_i[  170  ],    cr_cbf_i[  169  ],    cr_cbf_i[  168  ]}; end 
	        7'd43 : begin cu_cbf_v_r <= {    cr_cbf_i[  167  ],    cr_cbf_i[  166  ],    cr_cbf_i[  165  ],    cr_cbf_i[  164  ]}; end 
	        7'd44 : begin cu_cbf_v_r <= {    cr_cbf_i[  163  ],    cr_cbf_i[  162  ],    cr_cbf_i[  161  ],    cr_cbf_i[  160  ]}; end 
	        7'd45 : begin cu_cbf_v_r <= {    cr_cbf_i[  159  ],    cr_cbf_i[  158  ],    cr_cbf_i[  157  ],    cr_cbf_i[  156  ]}; end 
	        7'd46 : begin cu_cbf_v_r <= {    cr_cbf_i[  155  ],    cr_cbf_i[  154  ],    cr_cbf_i[  153  ],    cr_cbf_i[  152  ]}; end 
	        7'd47 : begin cu_cbf_v_r <= {    cr_cbf_i[  151  ],    cr_cbf_i[  150  ],    cr_cbf_i[  149  ],    cr_cbf_i[  148  ]}; end 
	        7'd48 : begin cu_cbf_v_r <= {    cr_cbf_i[  147  ],    cr_cbf_i[  146  ],    cr_cbf_i[  145  ],    cr_cbf_i[  144  ]}; end 
	        7'd49 : begin cu_cbf_v_r <= {    cr_cbf_i[  143  ],    cr_cbf_i[  142  ],    cr_cbf_i[  141  ],    cr_cbf_i[  140  ]}; end 
	        7'd50 : begin cu_cbf_v_r <= {    cr_cbf_i[  139  ],    cr_cbf_i[  138  ],    cr_cbf_i[  137  ],    cr_cbf_i[  136  ]}; end 
	        7'd51 : begin cu_cbf_v_r <= {    cr_cbf_i[  135  ],    cr_cbf_i[  134  ],    cr_cbf_i[  133  ],    cr_cbf_i[  132  ]}; end 
	        7'd52 : begin cu_cbf_v_r <= {    cr_cbf_i[  131  ],    cr_cbf_i[  130  ],    cr_cbf_i[  129  ],    cr_cbf_i[  128  ]}; end 
	        7'd53 : begin cu_cbf_v_r <= {    cr_cbf_i[  127  ],    cr_cbf_i[  126  ],    cr_cbf_i[  125  ],    cr_cbf_i[  124  ]}; end 
	        7'd54 : begin cu_cbf_v_r <= {    cr_cbf_i[  123  ],    cr_cbf_i[  122  ],    cr_cbf_i[  121  ],    cr_cbf_i[  120  ]}; end 
	        7'd55 : begin cu_cbf_v_r <= {    cr_cbf_i[  119  ],    cr_cbf_i[  118  ],    cr_cbf_i[  117  ],    cr_cbf_i[  116  ]}; end 
	        7'd56 : begin cu_cbf_v_r <= {    cr_cbf_i[  115  ],    cr_cbf_i[  114  ],    cr_cbf_i[  113  ],    cr_cbf_i[  112  ]}; end 
	        7'd57 : begin cu_cbf_v_r <= {    cr_cbf_i[  111  ],    cr_cbf_i[  110  ],    cr_cbf_i[  109  ],    cr_cbf_i[  108  ]}; end 
	        7'd58 : begin cu_cbf_v_r <= {    cr_cbf_i[  107  ],    cr_cbf_i[  106  ],    cr_cbf_i[  105  ],    cr_cbf_i[  104  ]}; end 
	        7'd59 : begin cu_cbf_v_r <= {    cr_cbf_i[  103  ],    cr_cbf_i[  102  ],    cr_cbf_i[  101  ],    cr_cbf_i[  100  ]}; end 
	        7'd60 : begin cu_cbf_v_r <= {    cr_cbf_i[   99  ],    cr_cbf_i[   98  ],    cr_cbf_i[   97  ],    cr_cbf_i[   96  ]}; end 
	        7'd61 : begin cu_cbf_v_r <= {    cr_cbf_i[   95  ],    cr_cbf_i[   94  ],    cr_cbf_i[   93  ],    cr_cbf_i[   92  ]}; end 
	        7'd62 : begin cu_cbf_v_r <= {    cr_cbf_i[   91  ],    cr_cbf_i[   90  ],    cr_cbf_i[   89  ],    cr_cbf_i[   88  ]}; end 
	        7'd63 : begin cu_cbf_v_r <= {    cr_cbf_i[   87  ],    cr_cbf_i[   86  ],    cr_cbf_i[   85  ],    cr_cbf_i[   84  ]}; end 
	        7'd64 : begin cu_cbf_v_r <= {    cr_cbf_i[   83  ],    cr_cbf_i[   82  ],    cr_cbf_i[   81  ],    cr_cbf_i[   80  ]}; end 
	        7'd65 : begin cu_cbf_v_r <= {    cr_cbf_i[   79  ],    cr_cbf_i[   78  ],    cr_cbf_i[   77  ],    cr_cbf_i[   76  ]}; end 
	        7'd66 : begin cu_cbf_v_r <= {    cr_cbf_i[   75  ],    cr_cbf_i[   74  ],    cr_cbf_i[   73  ],    cr_cbf_i[   72  ]}; end 
	        7'd67 : begin cu_cbf_v_r <= {    cr_cbf_i[   71  ],    cr_cbf_i[   70  ],    cr_cbf_i[   69  ],    cr_cbf_i[   68  ]}; end 
	        7'd68 : begin cu_cbf_v_r <= {    cr_cbf_i[   67  ],    cr_cbf_i[   66  ],    cr_cbf_i[   65  ],    cr_cbf_i[   64  ]}; end 
	        7'd69 : begin cu_cbf_v_r <= {    cr_cbf_i[   63  ],    cr_cbf_i[   62  ],    cr_cbf_i[   61  ],    cr_cbf_i[   60  ]}; end 
	        7'd70 : begin cu_cbf_v_r <= {    cr_cbf_i[   59  ],    cr_cbf_i[   58  ],    cr_cbf_i[   57  ],    cr_cbf_i[   56  ]}; end 
	        7'd71 : begin cu_cbf_v_r <= {    cr_cbf_i[   55  ],    cr_cbf_i[   54  ],    cr_cbf_i[   53  ],    cr_cbf_i[   52  ]}; end 
	        7'd72 : begin cu_cbf_v_r <= {    cr_cbf_i[   51  ],    cr_cbf_i[   50  ],    cr_cbf_i[   49  ],    cr_cbf_i[   48  ]}; end 
	        7'd73 : begin cu_cbf_v_r <= {    cr_cbf_i[   47  ],    cr_cbf_i[   46  ],    cr_cbf_i[   45  ],    cr_cbf_i[   44  ]}; end 
	        7'd74 : begin cu_cbf_v_r <= {    cr_cbf_i[   43  ],    cr_cbf_i[   42  ],    cr_cbf_i[   41  ],    cr_cbf_i[   40  ]}; end 
	        7'd75 : begin cu_cbf_v_r <= {    cr_cbf_i[   39  ],    cr_cbf_i[   38  ],    cr_cbf_i[   37  ],    cr_cbf_i[   36  ]}; end 
	        7'd76 : begin cu_cbf_v_r <= {    cr_cbf_i[   35  ],    cr_cbf_i[   34  ],    cr_cbf_i[   33  ],    cr_cbf_i[   32  ]}; end 
	        7'd77 : begin cu_cbf_v_r <= {    cr_cbf_i[   31  ],    cr_cbf_i[   30  ],    cr_cbf_i[   29  ],    cr_cbf_i[   28  ]}; end 
	        7'd78 : begin cu_cbf_v_r <= {    cr_cbf_i[   27  ],    cr_cbf_i[   26  ],    cr_cbf_i[   25  ],    cr_cbf_i[   24  ]}; end 
	        7'd79 : begin cu_cbf_v_r <= {    cr_cbf_i[   23  ],    cr_cbf_i[   22  ],    cr_cbf_i[   21  ],    cr_cbf_i[   20  ]}; end 
	        7'd80 : begin cu_cbf_v_r <= {    cr_cbf_i[   19  ],    cr_cbf_i[   18  ],    cr_cbf_i[   17  ],    cr_cbf_i[   16  ]}; end 
	        7'd81 : begin cu_cbf_v_r <= {    cr_cbf_i[   15  ],    cr_cbf_i[   14  ],    cr_cbf_i[   13  ],    cr_cbf_i[   12  ]}; end 
	        7'd82 : begin cu_cbf_v_r <= {    cr_cbf_i[   11  ],    cr_cbf_i[   10  ],    cr_cbf_i[    9  ],    cr_cbf_i[    8  ]}; end 
	        7'd83 : begin cu_cbf_v_r <= {    cr_cbf_i[    7  ],    cr_cbf_i[    6  ],    cr_cbf_i[    5  ],    cr_cbf_i[    4  ]}; end 
	        7'd84 : begin cu_cbf_v_r <= {    cr_cbf_i[    3  ],    cr_cbf_i[    2  ],    cr_cbf_i[    1  ],    cr_cbf_i[    0  ]}; end 
          default : begin cu_cbf_v_r <= 4'b0                                                                                     ; end 
        endcase 
	end 
end  

/*
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
	    cu_cbf_u_r    <=  4'b0  ;
	else begin 
        case(cu_idx_r)
            7'd0  : begin cu_cbf_u_r <= {!(!cu_cbf_i[63:48]),!(!cu_cbf_i[47:32]),!(!cu_cbf_i[31:16]),!(!cu_cbf_i[15: 0])}; end // 64x64 
		    7'd1  : begin cu_cbf_u_r <= {!(!cu_cbf_i[63:60]),!(!cu_cbf_i[59:56]),!(!cu_cbf_i[55:52]),!(!cu_cbf_i[51:48])}; end // 32x32
		    7'd2  : begin cu_cbf_u_r <= {!(!cu_cbf_i[47:44]),!(!cu_cbf_i[43:40]),!(!cu_cbf_i[39:36]),!(!cu_cbf_i[35:32])}; end 
            7'd3  : begin cu_cbf_u_r <= {!(!cu_cbf_i[31:28]),!(!cu_cbf_i[27:24]),!(!cu_cbf_i[23:20]),!(!cu_cbf_i[19:16])}; end 
            7'd4  : begin cu_cbf_u_r <= {!(!cu_cbf_i[15:12]),!(!cu_cbf_i[11:8 ]),!(!cu_cbf_i[ 7:4 ]),!(!cu_cbf_i[ 3:0 ])}; end 
            7'd5  : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 63  ]),!(!cu_cbf_i[ 62  ]),!(!cu_cbf_i[ 61  ]),!(!cu_cbf_i[ 60  ])}; end //16x16
            7'd6  : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 59  ]),!(!cu_cbf_i[ 58  ]),!(!cu_cbf_i[ 57  ]),!(!cu_cbf_i[ 56  ])}; end 
            7'd7  : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 55  ]),!(!cu_cbf_i[ 54  ]),!(!cu_cbf_i[ 53  ]),!(!cu_cbf_i[ 52  ])}; end 
            7'd8  : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 51  ]),!(!cu_cbf_i[ 50  ]),!(!cu_cbf_i[ 49  ]),!(!cu_cbf_i[ 48  ])}; end 
            7'd9  : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 47  ]),!(!cu_cbf_i[ 46  ]),!(!cu_cbf_i[ 45  ]),!(!cu_cbf_i[ 44  ])}; end        
		    7'd10 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 43  ]),!(!cu_cbf_i[ 42  ]),!(!cu_cbf_i[ 41  ]),!(!cu_cbf_i[ 40  ])}; end        
		    7'd11 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 39  ]),!(!cu_cbf_i[ 38  ]),!(!cu_cbf_i[ 37  ]),!(!cu_cbf_i[ 36  ])}; end        
		    7'd12 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 35  ]),!(!cu_cbf_i[ 34  ]),!(!cu_cbf_i[ 33  ]),!(!cu_cbf_i[ 32  ])}; end        
		    7'd13 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 31  ]),!(!cu_cbf_i[ 30  ]),!(!cu_cbf_i[ 29  ]),!(!cu_cbf_i[ 28  ])}; end        
		    7'd14 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 27  ]),!(!cu_cbf_i[ 26  ]),!(!cu_cbf_i[ 25  ]),!(!cu_cbf_i[ 24  ])}; end        
		    7'd15 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 23  ]),!(!cu_cbf_i[ 22  ]),!(!cu_cbf_i[ 21  ]),!(!cu_cbf_i[ 20  ])}; end        
		    7'd16 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 19  ]),!(!cu_cbf_i[ 18  ]),!(!cu_cbf_i[ 17  ]),!(!cu_cbf_i[ 16  ])}; end        
		    7'd17 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 15  ]),!(!cu_cbf_i[ 14  ]),!(!cu_cbf_i[ 13  ]),!(!cu_cbf_i[ 12  ])}; end        
		    7'd18 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 11  ]),!(!cu_cbf_i[ 10  ]),!(!cu_cbf_i[ 9   ]),!(!cu_cbf_i[ 8   ])}; end        
		    7'd19 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 7   ]),!(!cu_cbf_i[ 6   ]),!(!cu_cbf_i[ 5   ]),!(!cu_cbf_i[ 4   ])}; end        
		    7'd20 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 3   ]),!(!cu_cbf_i[ 2   ]),!(!cu_cbf_i[ 1   ]),!(!cu_cbf_i[ 0   ])}; end        
		    7'd21 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 63  ]),!(!cu_cbf_i[ 63  ]),!(!cu_cbf_i[ 63  ]),!(!cu_cbf_i[ 63  ])}; end  //8x8 
		    7'd22 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 62  ]),!(!cu_cbf_i[ 62  ]),!(!cu_cbf_i[ 62  ]),!(!cu_cbf_i[ 62  ])}; end 
		    7'd23 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 61  ]),!(!cu_cbf_i[ 61  ]),!(!cu_cbf_i[ 61  ]),!(!cu_cbf_i[ 61  ])}; end 
		    7'd24 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 60  ]),!(!cu_cbf_i[ 60  ]),!(!cu_cbf_i[ 60  ]),!(!cu_cbf_i[ 60  ])}; end 
		    7'd25 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 59  ]),!(!cu_cbf_i[ 59  ]),!(!cu_cbf_i[ 59  ]),!(!cu_cbf_i[ 59  ])}; end 
		    7'd26 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 58  ]),!(!cu_cbf_i[ 58  ]),!(!cu_cbf_i[ 58  ]),!(!cu_cbf_i[ 58  ])}; end 
		    7'd27 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 57  ]),!(!cu_cbf_i[ 57  ]),!(!cu_cbf_i[ 57  ]),!(!cu_cbf_i[ 57  ])}; end 
		    7'd28 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 56  ]),!(!cu_cbf_i[ 56  ]),!(!cu_cbf_i[ 56  ]),!(!cu_cbf_i[ 56  ])}; end 
		    7'd29 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 55  ]),!(!cu_cbf_i[ 55  ]),!(!cu_cbf_i[ 55  ]),!(!cu_cbf_i[ 55  ])}; end 
		    7'd30 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 54  ]),!(!cu_cbf_i[ 54  ]),!(!cu_cbf_i[ 54  ]),!(!cu_cbf_i[ 54  ])}; end 
		    7'd31 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 53  ]),!(!cu_cbf_i[ 53  ]),!(!cu_cbf_i[ 53  ]),!(!cu_cbf_i[ 53  ])}; end 
		    7'd32 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 52  ]),!(!cu_cbf_i[ 52  ]),!(!cu_cbf_i[ 52  ]),!(!cu_cbf_i[ 52  ])}; end 
		    7'd33 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 51  ]),!(!cu_cbf_i[ 51  ]),!(!cu_cbf_i[ 51  ]),!(!cu_cbf_i[ 51  ])}; end 
		    7'd34 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 50  ]),!(!cu_cbf_i[ 50  ]),!(!cu_cbf_i[ 50  ]),!(!cu_cbf_i[ 50  ])}; end 
		    7'd35 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 49  ]),!(!cu_cbf_i[ 49  ]),!(!cu_cbf_i[ 49  ]),!(!cu_cbf_i[ 49  ])}; end 
		    7'd36 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 48  ]),!(!cu_cbf_i[ 48  ]),!(!cu_cbf_i[ 48  ]),!(!cu_cbf_i[ 48  ])}; end 
		    7'd37 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 47  ]),!(!cu_cbf_i[ 47  ]),!(!cu_cbf_i[ 47  ]),!(!cu_cbf_i[ 47  ])}; end 
		    7'd38 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 46  ]),!(!cu_cbf_i[ 46  ]),!(!cu_cbf_i[ 46  ]),!(!cu_cbf_i[ 46  ])}; end 
		    7'd39 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 45  ]),!(!cu_cbf_i[ 45  ]),!(!cu_cbf_i[ 45  ]),!(!cu_cbf_i[ 45  ])}; end 
		    7'd40 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 44  ]),!(!cu_cbf_i[ 44  ]),!(!cu_cbf_i[ 44  ]),!(!cu_cbf_i[ 44  ])}; end 
		    7'd41 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 43  ]),!(!cu_cbf_i[ 43  ]),!(!cu_cbf_i[ 43  ]),!(!cu_cbf_i[ 43  ])}; end 
		    7'd42 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 42  ]),!(!cu_cbf_i[ 42  ]),!(!cu_cbf_i[ 42  ]),!(!cu_cbf_i[ 42  ])}; end 
		    7'd43 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 41  ]),!(!cu_cbf_i[ 41  ]),!(!cu_cbf_i[ 41  ]),!(!cu_cbf_i[ 41  ])}; end 
		    7'd44 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 40  ]),!(!cu_cbf_i[ 40  ]),!(!cu_cbf_i[ 40  ]),!(!cu_cbf_i[ 40  ])}; end 
		    7'd45 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 39  ]),!(!cu_cbf_i[ 39  ]),!(!cu_cbf_i[ 39  ]),!(!cu_cbf_i[ 39  ])}; end 
		    7'd46 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 38  ]),!(!cu_cbf_i[ 38  ]),!(!cu_cbf_i[ 38  ]),!(!cu_cbf_i[ 38  ])}; end 
		    7'd47 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 37  ]),!(!cu_cbf_i[ 37  ]),!(!cu_cbf_i[ 37  ]),!(!cu_cbf_i[ 37  ])}; end 
		    7'd48 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 36  ]),!(!cu_cbf_i[ 36  ]),!(!cu_cbf_i[ 36  ]),!(!cu_cbf_i[ 36  ])}; end  
		    7'd49 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 35  ]),!(!cu_cbf_i[ 35  ]),!(!cu_cbf_i[ 35  ]),!(!cu_cbf_i[ 35  ])}; end 
		    7'd50 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 34  ]),!(!cu_cbf_i[ 34  ]),!(!cu_cbf_i[ 34  ]),!(!cu_cbf_i[ 34  ])}; end 
		    7'd51 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 33  ]),!(!cu_cbf_i[ 33  ]),!(!cu_cbf_i[ 33  ]),!(!cu_cbf_i[ 33  ])}; end 
		    7'd52 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 32  ]),!(!cu_cbf_i[ 32  ]),!(!cu_cbf_i[ 32  ]),!(!cu_cbf_i[ 32  ])}; end 
		    7'd53 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 31  ]),!(!cu_cbf_i[ 31  ]),!(!cu_cbf_i[ 31  ]),!(!cu_cbf_i[ 31  ])}; end 
		    7'd54 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 30  ]),!(!cu_cbf_i[ 30  ]),!(!cu_cbf_i[ 30  ]),!(!cu_cbf_i[ 30  ])}; end 
		    7'd55 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 29  ]),!(!cu_cbf_i[ 29  ]),!(!cu_cbf_i[ 29  ]),!(!cu_cbf_i[ 29  ])}; end 
		    7'd56 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 28  ]),!(!cu_cbf_i[ 28  ]),!(!cu_cbf_i[ 28  ]),!(!cu_cbf_i[ 28  ])}; end 
		    7'd57 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 27  ]),!(!cu_cbf_i[ 27  ]),!(!cu_cbf_i[ 27  ]),!(!cu_cbf_i[ 27  ])}; end 
		    7'd58 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 26  ]),!(!cu_cbf_i[ 26  ]),!(!cu_cbf_i[ 26  ]),!(!cu_cbf_i[ 26  ])}; end 
		    7'd59 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 25  ]),!(!cu_cbf_i[ 25  ]),!(!cu_cbf_i[ 25  ]),!(!cu_cbf_i[ 25  ])}; end 
		    7'd60 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 24  ]),!(!cu_cbf_i[ 24  ]),!(!cu_cbf_i[ 24  ]),!(!cu_cbf_i[ 24  ])}; end 
		    7'd61 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 23  ]),!(!cu_cbf_i[ 23  ]),!(!cu_cbf_i[ 23  ]),!(!cu_cbf_i[ 23  ])}; end 
		    7'd62 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 22  ]),!(!cu_cbf_i[ 22  ]),!(!cu_cbf_i[ 22  ]),!(!cu_cbf_i[ 22  ])}; end 
		    7'd63 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 21  ]),!(!cu_cbf_i[ 21  ]),!(!cu_cbf_i[ 21  ]),!(!cu_cbf_i[ 21  ])}; end 
		    7'd64 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 20  ]),!(!cu_cbf_i[ 20  ]),!(!cu_cbf_i[ 20  ]),!(!cu_cbf_i[ 20  ])}; end 
		    7'd65 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 19  ]),!(!cu_cbf_i[ 19  ]),!(!cu_cbf_i[ 19  ]),!(!cu_cbf_i[ 19  ])}; end 
		    7'd66 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 18  ]),!(!cu_cbf_i[ 18  ]),!(!cu_cbf_i[ 18  ]),!(!cu_cbf_i[ 18  ])}; end 
		    7'd67 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 17  ]),!(!cu_cbf_i[ 17  ]),!(!cu_cbf_i[ 17  ]),!(!cu_cbf_i[ 17  ])}; end 
		    7'd68 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 16  ]),!(!cu_cbf_i[ 16  ]),!(!cu_cbf_i[ 16  ]),!(!cu_cbf_i[ 16  ])}; end 
		    7'd69 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 15  ]),!(!cu_cbf_i[ 15  ]),!(!cu_cbf_i[ 15  ]),!(!cu_cbf_i[ 15  ])}; end 
		    7'd70 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 14  ]),!(!cu_cbf_i[ 14  ]),!(!cu_cbf_i[ 14  ]),!(!cu_cbf_i[ 14  ])}; end 
		    7'd71 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 13  ]),!(!cu_cbf_i[ 13  ]),!(!cu_cbf_i[ 13  ]),!(!cu_cbf_i[ 13  ])}; end 
		    7'd72 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 12  ]),!(!cu_cbf_i[ 12  ]),!(!cu_cbf_i[ 12  ]),!(!cu_cbf_i[ 12  ])}; end 
		    7'd73 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 11  ]),!(!cu_cbf_i[ 11  ]),!(!cu_cbf_i[ 11  ]),!(!cu_cbf_i[ 11  ])}; end 
		    7'd74 : begin cu_cbf_u_r <= {!(!cu_cbf_i[ 10  ]),!(!cu_cbf_i[ 10  ]),!(!cu_cbf_i[ 10  ]),!(!cu_cbf_i[ 10  ])}; end 
		    7'd75 : begin cu_cbf_u_r <= {!(!cu_cbf_i[  9  ]),!(!cu_cbf_i[  9  ]),!(!cu_cbf_i[  9  ]),!(!cu_cbf_i[  9  ])}; end 
		    7'd76 : begin cu_cbf_u_r <= {!(!cu_cbf_i[  8  ]),!(!cu_cbf_i[  8  ]),!(!cu_cbf_i[  8  ]),!(!cu_cbf_i[  8  ])}; end 
		    7'd77 : begin cu_cbf_u_r <= {!(!cu_cbf_i[  7  ]),!(!cu_cbf_i[  7  ]),!(!cu_cbf_i[  7  ]),!(!cu_cbf_i[  7  ])}; end 
		    7'd78 : begin cu_cbf_u_r <= {!(!cu_cbf_i[  6  ]),!(!cu_cbf_i[  6  ]),!(!cu_cbf_i[  6  ]),!(!cu_cbf_i[  6  ])}; end 
		    7'd79 : begin cu_cbf_u_r <= {!(!cu_cbf_i[  5  ]),!(!cu_cbf_i[  5  ]),!(!cu_cbf_i[  5  ]),!(!cu_cbf_i[  5  ])}; end 
		    7'd80 : begin cu_cbf_u_r <= {!(!cu_cbf_i[  4  ]),!(!cu_cbf_i[  4  ]),!(!cu_cbf_i[  4  ]),!(!cu_cbf_i[  4  ])}; end 
		    7'd81 : begin cu_cbf_u_r <= {!(!cu_cbf_i[  3  ]),!(!cu_cbf_i[  3  ]),!(!cu_cbf_i[  3  ]),!(!cu_cbf_i[  3  ])}; end 
		    7'd82 : begin cu_cbf_u_r <= {!(!cu_cbf_i[  2  ]),!(!cu_cbf_i[  2  ]),!(!cu_cbf_i[  2  ]),!(!cu_cbf_i[  2  ])}; end 
		    7'd83 : begin cu_cbf_u_r <= {!(!cu_cbf_i[  1  ]),!(!cu_cbf_i[  1  ]),!(!cu_cbf_i[  1  ]),!(!cu_cbf_i[  1  ])}; end 
		    7'd84 : begin cu_cbf_u_r <= {!(!cu_cbf_i[  0  ]),!(!cu_cbf_i[  0  ]),!(!cu_cbf_i[  0  ]),!(!cu_cbf_i[  0  ])}; end 
	      default : begin cu_cbf_u_r <= 4'b0                                                                             ; end 
        endcase 
	end 
end  


always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
	    cu_cbf_v_r    <=  4'b0  ;
	else begin 
        case(cu_idx_r)
            7'd0  : begin cu_cbf_v_r <= {!(!cr_cbf_i[63:48]),!(!cr_cbf_i[47:32]),!(!cr_cbf_i[31:16]),!(!cr_cbf_i[15: 0])}; end // 64x64 
		    7'd1  : begin cu_cbf_v_r <= {!(!cr_cbf_i[63:60]),!(!cr_cbf_i[59:56]),!(!cr_cbf_i[55:52]),!(!cr_cbf_i[51:48])}; end // 32x32
		    7'd2  : begin cu_cbf_v_r <= {!(!cr_cbf_i[47:44]),!(!cr_cbf_i[43:40]),!(!cr_cbf_i[39:36]),!(!cr_cbf_i[35:32])}; end 
            7'd3  : begin cu_cbf_v_r <= {!(!cr_cbf_i[31:28]),!(!cr_cbf_i[27:24]),!(!cr_cbf_i[23:20]),!(!cr_cbf_i[19:16])}; end 
            7'd4  : begin cu_cbf_v_r <= {!(!cr_cbf_i[15:12]),!(!cr_cbf_i[11:8 ]),!(!cr_cbf_i[ 7:4 ]),!(!cr_cbf_i[ 3:0 ])}; end 
            7'd5  : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 63  ]),!(!cr_cbf_i[ 62  ]),!(!cr_cbf_i[ 61  ]),!(!cr_cbf_i[ 60  ])}; end //16x16
            7'd6  : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 59  ]),!(!cr_cbf_i[ 58  ]),!(!cr_cbf_i[ 57  ]),!(!cr_cbf_i[ 56  ])}; end 
            7'd7  : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 55  ]),!(!cr_cbf_i[ 54  ]),!(!cr_cbf_i[ 53  ]),!(!cr_cbf_i[ 52  ])}; end 
            7'd8  : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 51  ]),!(!cr_cbf_i[ 50  ]),!(!cr_cbf_i[ 49  ]),!(!cr_cbf_i[ 48  ])}; end 
            7'd9  : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 47  ]),!(!cr_cbf_i[ 46  ]),!(!cr_cbf_i[ 45  ]),!(!cr_cbf_i[ 44  ])}; end        
		    7'd10 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 43  ]),!(!cr_cbf_i[ 42  ]),!(!cr_cbf_i[ 41  ]),!(!cr_cbf_i[ 40  ])}; end        
		    7'd11 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 39  ]),!(!cr_cbf_i[ 38  ]),!(!cr_cbf_i[ 37  ]),!(!cr_cbf_i[ 36  ])}; end        
		    7'd12 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 35  ]),!(!cr_cbf_i[ 34  ]),!(!cr_cbf_i[ 33  ]),!(!cr_cbf_i[ 32  ])}; end        
		    7'd13 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 31  ]),!(!cr_cbf_i[ 30  ]),!(!cr_cbf_i[ 29  ]),!(!cr_cbf_i[ 28  ])}; end        
		    7'd14 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 27  ]),!(!cr_cbf_i[ 26  ]),!(!cr_cbf_i[ 25  ]),!(!cr_cbf_i[ 24  ])}; end        
		    7'd15 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 23  ]),!(!cr_cbf_i[ 22  ]),!(!cr_cbf_i[ 21  ]),!(!cr_cbf_i[ 20  ])}; end        
		    7'd16 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 19  ]),!(!cr_cbf_i[ 18  ]),!(!cr_cbf_i[ 17  ]),!(!cr_cbf_i[ 16  ])}; end        
		    7'd17 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 15  ]),!(!cr_cbf_i[ 14  ]),!(!cr_cbf_i[ 13  ]),!(!cr_cbf_i[ 12  ])}; end        
		    7'd18 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 11  ]),!(!cr_cbf_i[ 10  ]),!(!cr_cbf_i[ 9   ]),!(!cr_cbf_i[ 8   ])}; end        
		    7'd19 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 7   ]),!(!cr_cbf_i[ 6   ]),!(!cr_cbf_i[ 5   ]),!(!cr_cbf_i[ 4   ])}; end        
		    7'd20 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 3   ]),!(!cr_cbf_i[ 2   ]),!(!cr_cbf_i[ 1   ]),!(!cr_cbf_i[ 0   ])}; end        
		    7'd21 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 63  ]),!(!cr_cbf_i[ 63  ]),!(!cr_cbf_i[ 63  ]),!(!cr_cbf_i[ 63  ])}; end  //8x8 
		    7'd22 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 62  ]),!(!cr_cbf_i[ 62  ]),!(!cr_cbf_i[ 62  ]),!(!cr_cbf_i[ 62  ])}; end 
		    7'd23 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 61  ]),!(!cr_cbf_i[ 61  ]),!(!cr_cbf_i[ 61  ]),!(!cr_cbf_i[ 61  ])}; end 
		    7'd24 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 60  ]),!(!cr_cbf_i[ 60  ]),!(!cr_cbf_i[ 60  ]),!(!cr_cbf_i[ 60  ])}; end 
		    7'd25 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 59  ]),!(!cr_cbf_i[ 59  ]),!(!cr_cbf_i[ 59  ]),!(!cr_cbf_i[ 59  ])}; end 
		    7'd26 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 58  ]),!(!cr_cbf_i[ 58  ]),!(!cr_cbf_i[ 58  ]),!(!cr_cbf_i[ 58  ])}; end 
		    7'd27 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 57  ]),!(!cr_cbf_i[ 57  ]),!(!cr_cbf_i[ 57  ]),!(!cr_cbf_i[ 57  ])}; end 
		    7'd28 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 56  ]),!(!cr_cbf_i[ 56  ]),!(!cr_cbf_i[ 56  ]),!(!cr_cbf_i[ 56  ])}; end 
		    7'd29 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 55  ]),!(!cr_cbf_i[ 55  ]),!(!cr_cbf_i[ 55  ]),!(!cr_cbf_i[ 55  ])}; end 
		    7'd30 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 54  ]),!(!cr_cbf_i[ 54  ]),!(!cr_cbf_i[ 54  ]),!(!cr_cbf_i[ 54  ])}; end 
		    7'd31 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 53  ]),!(!cr_cbf_i[ 53  ]),!(!cr_cbf_i[ 53  ]),!(!cr_cbf_i[ 53  ])}; end 
		    7'd32 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 52  ]),!(!cr_cbf_i[ 52  ]),!(!cr_cbf_i[ 52  ]),!(!cr_cbf_i[ 52  ])}; end 
		    7'd33 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 51  ]),!(!cr_cbf_i[ 51  ]),!(!cr_cbf_i[ 51  ]),!(!cr_cbf_i[ 51  ])}; end 
		    7'd34 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 50  ]),!(!cr_cbf_i[ 50  ]),!(!cr_cbf_i[ 50  ]),!(!cr_cbf_i[ 50  ])}; end 
		    7'd35 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 49  ]),!(!cr_cbf_i[ 49  ]),!(!cr_cbf_i[ 49  ]),!(!cr_cbf_i[ 49  ])}; end 
		    7'd36 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 48  ]),!(!cr_cbf_i[ 48  ]),!(!cr_cbf_i[ 48  ]),!(!cr_cbf_i[ 48  ])}; end 
		    7'd37 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 47  ]),!(!cr_cbf_i[ 47  ]),!(!cr_cbf_i[ 47  ]),!(!cr_cbf_i[ 47  ])}; end 
		    7'd38 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 46  ]),!(!cr_cbf_i[ 46  ]),!(!cr_cbf_i[ 46  ]),!(!cr_cbf_i[ 46  ])}; end 
		    7'd39 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 45  ]),!(!cr_cbf_i[ 45  ]),!(!cr_cbf_i[ 45  ]),!(!cr_cbf_i[ 45  ])}; end 
		    7'd40 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 44  ]),!(!cr_cbf_i[ 44  ]),!(!cr_cbf_i[ 44  ]),!(!cr_cbf_i[ 44  ])}; end 
		    7'd41 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 43  ]),!(!cr_cbf_i[ 43  ]),!(!cr_cbf_i[ 43  ]),!(!cr_cbf_i[ 43  ])}; end 
		    7'd42 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 42  ]),!(!cr_cbf_i[ 42  ]),!(!cr_cbf_i[ 42  ]),!(!cr_cbf_i[ 42  ])}; end 
		    7'd43 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 41  ]),!(!cr_cbf_i[ 41  ]),!(!cr_cbf_i[ 41  ]),!(!cr_cbf_i[ 41  ])}; end 
		    7'd44 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 40  ]),!(!cr_cbf_i[ 40  ]),!(!cr_cbf_i[ 40  ]),!(!cr_cbf_i[ 40  ])}; end 
		    7'd45 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 39  ]),!(!cr_cbf_i[ 39  ]),!(!cr_cbf_i[ 39  ]),!(!cr_cbf_i[ 39  ])}; end 
		    7'd46 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 38  ]),!(!cr_cbf_i[ 38  ]),!(!cr_cbf_i[ 38  ]),!(!cr_cbf_i[ 38  ])}; end 
		    7'd47 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 37  ]),!(!cr_cbf_i[ 37  ]),!(!cr_cbf_i[ 37  ]),!(!cr_cbf_i[ 37  ])}; end 
		    7'd48 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 36  ]),!(!cr_cbf_i[ 36  ]),!(!cr_cbf_i[ 36  ]),!(!cr_cbf_i[ 36  ])}; end  
		    7'd49 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 35  ]),!(!cr_cbf_i[ 35  ]),!(!cr_cbf_i[ 35  ]),!(!cr_cbf_i[ 35  ])}; end 
		    7'd50 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 34  ]),!(!cr_cbf_i[ 34  ]),!(!cr_cbf_i[ 34  ]),!(!cr_cbf_i[ 34  ])}; end 
		    7'd51 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 33  ]),!(!cr_cbf_i[ 33  ]),!(!cr_cbf_i[ 33  ]),!(!cr_cbf_i[ 33  ])}; end 
		    7'd52 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 32  ]),!(!cr_cbf_i[ 32  ]),!(!cr_cbf_i[ 32  ]),!(!cr_cbf_i[ 32  ])}; end 
		    7'd53 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 31  ]),!(!cr_cbf_i[ 31  ]),!(!cr_cbf_i[ 31  ]),!(!cr_cbf_i[ 31  ])}; end 
		    7'd54 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 30  ]),!(!cr_cbf_i[ 30  ]),!(!cr_cbf_i[ 30  ]),!(!cr_cbf_i[ 30  ])}; end 
		    7'd55 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 29  ]),!(!cr_cbf_i[ 29  ]),!(!cr_cbf_i[ 29  ]),!(!cr_cbf_i[ 29  ])}; end 
		    7'd56 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 28  ]),!(!cr_cbf_i[ 28  ]),!(!cr_cbf_i[ 28  ]),!(!cr_cbf_i[ 28  ])}; end 
		    7'd57 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 27  ]),!(!cr_cbf_i[ 27  ]),!(!cr_cbf_i[ 27  ]),!(!cr_cbf_i[ 27  ])}; end 
		    7'd58 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 26  ]),!(!cr_cbf_i[ 26  ]),!(!cr_cbf_i[ 26  ]),!(!cr_cbf_i[ 26  ])}; end 
		    7'd59 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 25  ]),!(!cr_cbf_i[ 25  ]),!(!cr_cbf_i[ 25  ]),!(!cr_cbf_i[ 25  ])}; end 
		    7'd60 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 24  ]),!(!cr_cbf_i[ 24  ]),!(!cr_cbf_i[ 24  ]),!(!cr_cbf_i[ 24  ])}; end 
		    7'd61 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 23  ]),!(!cr_cbf_i[ 23  ]),!(!cr_cbf_i[ 23  ]),!(!cr_cbf_i[ 23  ])}; end 
		    7'd62 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 22  ]),!(!cr_cbf_i[ 22  ]),!(!cr_cbf_i[ 22  ]),!(!cr_cbf_i[ 22  ])}; end 
		    7'd63 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 21  ]),!(!cr_cbf_i[ 21  ]),!(!cr_cbf_i[ 21  ]),!(!cr_cbf_i[ 21  ])}; end 
		    7'd64 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 20  ]),!(!cr_cbf_i[ 20  ]),!(!cr_cbf_i[ 20  ]),!(!cr_cbf_i[ 20  ])}; end 
		    7'd65 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 19  ]),!(!cr_cbf_i[ 19  ]),!(!cr_cbf_i[ 19  ]),!(!cr_cbf_i[ 19  ])}; end 
		    7'd66 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 18  ]),!(!cr_cbf_i[ 18  ]),!(!cr_cbf_i[ 18  ]),!(!cr_cbf_i[ 18  ])}; end 
		    7'd67 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 17  ]),!(!cr_cbf_i[ 17  ]),!(!cr_cbf_i[ 17  ]),!(!cr_cbf_i[ 17  ])}; end 
		    7'd68 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 16  ]),!(!cr_cbf_i[ 16  ]),!(!cr_cbf_i[ 16  ]),!(!cr_cbf_i[ 16  ])}; end 
		    7'd69 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 15  ]),!(!cr_cbf_i[ 15  ]),!(!cr_cbf_i[ 15  ]),!(!cr_cbf_i[ 15  ])}; end 
		    7'd70 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 14  ]),!(!cr_cbf_i[ 14  ]),!(!cr_cbf_i[ 14  ]),!(!cr_cbf_i[ 14  ])}; end 
		    7'd71 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 13  ]),!(!cr_cbf_i[ 13  ]),!(!cr_cbf_i[ 13  ]),!(!cr_cbf_i[ 13  ])}; end 
		    7'd72 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 12  ]),!(!cr_cbf_i[ 12  ]),!(!cr_cbf_i[ 12  ]),!(!cr_cbf_i[ 12  ])}; end 
		    7'd73 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 11  ]),!(!cr_cbf_i[ 11  ]),!(!cr_cbf_i[ 11  ]),!(!cr_cbf_i[ 11  ])}; end 
		    7'd74 : begin cu_cbf_v_r <= {!(!cr_cbf_i[ 10  ]),!(!cr_cbf_i[ 10  ]),!(!cr_cbf_i[ 10  ]),!(!cr_cbf_i[ 10  ])}; end 
		    7'd75 : begin cu_cbf_v_r <= {!(!cr_cbf_i[  9  ]),!(!cr_cbf_i[  9  ]),!(!cr_cbf_i[  9  ]),!(!cr_cbf_i[  9  ])}; end 
		    7'd76 : begin cu_cbf_v_r <= {!(!cr_cbf_i[  8  ]),!(!cr_cbf_i[  8  ]),!(!cr_cbf_i[  8  ]),!(!cr_cbf_i[  8  ])}; end 
		    7'd77 : begin cu_cbf_v_r <= {!(!cr_cbf_i[  7  ]),!(!cr_cbf_i[  7  ]),!(!cr_cbf_i[  7  ]),!(!cr_cbf_i[  7  ])}; end 
		    7'd78 : begin cu_cbf_v_r <= {!(!cr_cbf_i[  6  ]),!(!cr_cbf_i[  6  ]),!(!cr_cbf_i[  6  ]),!(!cr_cbf_i[  6  ])}; end 
		    7'd79 : begin cu_cbf_v_r <= {!(!cr_cbf_i[  5  ]),!(!cr_cbf_i[  5  ]),!(!cr_cbf_i[  5  ]),!(!cr_cbf_i[  5  ])}; end 
		    7'd80 : begin cu_cbf_v_r <= {!(!cr_cbf_i[  4  ]),!(!cr_cbf_i[  4  ]),!(!cr_cbf_i[  4  ]),!(!cr_cbf_i[  4  ])}; end 
		    7'd81 : begin cu_cbf_v_r <= {!(!cr_cbf_i[  3  ]),!(!cr_cbf_i[  3  ]),!(!cr_cbf_i[  3  ]),!(!cr_cbf_i[  3  ])}; end 
		    7'd82 : begin cu_cbf_v_r <= {!(!cr_cbf_i[  2  ]),!(!cr_cbf_i[  2  ]),!(!cr_cbf_i[  2  ]),!(!cr_cbf_i[  2  ])}; end 
		    7'd83 : begin cu_cbf_v_r <= {!(!cr_cbf_i[  1  ]),!(!cr_cbf_i[  1  ]),!(!cr_cbf_i[  1  ]),!(!cr_cbf_i[  1  ])}; end 
		    7'd84 : begin cu_cbf_v_r <= {!(!cr_cbf_i[  0  ]),!(!cr_cbf_i[  0  ]),!(!cr_cbf_i[  0  ]),!(!cr_cbf_i[  0  ])}; end 
	      default : begin cu_cbf_v_r <= 4'b0                                                                             ; end 
        endcase 
	end 
end  
*/

// cu_depth_top_r 
always @* begin
    case(cu_idx_r)
		7'd0 : cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[15:14]: 2'd0; 
		7'd1 : cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[15:14]: 2'd0; 
		7'd2 : cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[11:10]: 2'd0; 
		7'd3 : cu_depth_top_r  =  cu_depth_0_0_r                         ; 
		7'd4 : cu_depth_top_r  =  cu_depth_0_4_r                         ; 
		7'd5 : cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[15:14]: 2'd0; 
		7'd6 : cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[13:12]: 2'd0; 
		7'd7 : cu_depth_top_r  =  cu_depth_0_0_r                         ; 
		7'd8 : cu_depth_top_r  =  cu_depth_0_2_r                         ; 
		7'd9 : cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[11:10]: 2'd0; 
		7'd10: cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[ 9:8 ]: 2'd0; 
		7'd11: cu_depth_top_r  =  cu_depth_0_4_r                         ; 
		7'd12: cu_depth_top_r  =  cu_depth_0_6_r                         ; 
		7'd13: cu_depth_top_r  =  cu_depth_2_0_r                         ; 
		7'd14: cu_depth_top_r  =  cu_depth_2_2_r                         ; 
		7'd15: cu_depth_top_r  =  cu_depth_4_0_r                         ; 
		7'd16: cu_depth_top_r  =  cu_depth_4_2_r                         ; 
		7'd17: cu_depth_top_r  =  cu_depth_2_4_r                         ; 
		7'd18: cu_depth_top_r  =  cu_depth_2_6_r                         ; 
		7'd19: cu_depth_top_r  =  cu_depth_4_4_r                         ; 
		7'd20: cu_depth_top_r  =  cu_depth_4_6_r                         ; 
		7'd21: cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[15:14]: 2'd0; 
		7'd22: cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[15:14]: 2'd0; 
		7'd23: cu_depth_top_r  =  r_data_neigh_mb_r[15:14]               ; 
		7'd24: cu_depth_top_r  =  r_data_neigh_mb_r[15:14]               ; 
		7'd25: cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[13:12]: 2'd0; 
		7'd26: cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[13:12]: 2'd0; 
		7'd27: cu_depth_top_r  =  r_data_neigh_mb_r[13:12]               ; 
		7'd28: cu_depth_top_r  =  r_data_neigh_mb_r[13:12]               ; 
		7'd29: cu_depth_top_r  =  cu_depth_0_0_r                         ; 
		7'd30: cu_depth_top_r  =  cu_depth_0_0_r                         ; 
		7'd31: cu_depth_top_r  =  cu_depth_0_0_r                         ; 
		7'd32: cu_depth_top_r  =  cu_depth_0_0_r                         ; 
		7'd33: cu_depth_top_r  =  cu_depth_0_2_r                         ; 
		7'd34: cu_depth_top_r  =  cu_depth_0_2_r                         ; 
		7'd35: cu_depth_top_r  =  cu_depth_0_2_r                         ; 
		7'd36: cu_depth_top_r  =  cu_depth_0_2_r                         ; 
		7'd37: cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[11:10]: 2'd0; 
		7'd38: cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[11:10]: 2'd0; 
		7'd39: cu_depth_top_r  =  r_data_neigh_mb_r[11:10]               ; 
		7'd40: cu_depth_top_r  =  r_data_neigh_mb_r[11:10]               ; 
		7'd41: cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[ 9:8 ]: 2'd0; 
		7'd42: cu_depth_top_r  =  mb_y_i ? r_data_neigh_mb_r[ 9:8 ]: 2'd0; 
		7'd43: cu_depth_top_r  =  r_data_neigh_mb_r[ 9:8 ]               ; 
		7'd44: cu_depth_top_r  =  r_data_neigh_mb_r[ 9:8 ]               ; 
		7'd45: cu_depth_top_r  =  cu_depth_0_4_r                         ; 
		7'd46: cu_depth_top_r  =  cu_depth_0_4_r                         ; 
		7'd47: cu_depth_top_r  =  cu_depth_0_4_r                         ; 
		7'd48: cu_depth_top_r  =  cu_depth_0_4_r                         ; 
		7'd49: cu_depth_top_r  =  cu_depth_0_6_r                         ; 
		7'd50: cu_depth_top_r  =  cu_depth_0_6_r                         ; 
		7'd51: cu_depth_top_r  =  cu_depth_0_6_r                         ; 
		7'd52: cu_depth_top_r  =  cu_depth_0_6_r                         ; 
		7'd53: cu_depth_top_r  =  cu_depth_2_0_r                         ; 
		7'd54: cu_depth_top_r  =  cu_depth_2_0_r                         ; 
		7'd55: cu_depth_top_r  =  cu_depth_2_0_r                         ; 
		7'd56: cu_depth_top_r  =  cu_depth_2_0_r                         ; 
		7'd57: cu_depth_top_r  =  cu_depth_2_2_r                         ; 
		7'd58: cu_depth_top_r  =  cu_depth_2_2_r                         ; 
		7'd59: cu_depth_top_r  =  cu_depth_2_2_r                         ; 
		7'd60: cu_depth_top_r  =  cu_depth_2_2_r                         ; 
		7'd61: cu_depth_top_r  =  cu_depth_4_0_r                         ; 
		7'd62: cu_depth_top_r  =  cu_depth_4_0_r                         ; 
		7'd63: cu_depth_top_r  =  cu_depth_4_0_r                         ; 
		7'd64: cu_depth_top_r  =  cu_depth_4_0_r                         ; 
		7'd65: cu_depth_top_r  =  cu_depth_4_2_r                         ; 
		7'd66: cu_depth_top_r  =  cu_depth_4_2_r                         ; 
		7'd67: cu_depth_top_r  =  cu_depth_4_2_r                         ; 
		7'd68: cu_depth_top_r  =  cu_depth_4_2_r                         ; 
		7'd69: cu_depth_top_r  =  cu_depth_2_4_r                         ; 
		7'd70: cu_depth_top_r  =  cu_depth_2_4_r                         ; 
		7'd71: cu_depth_top_r  =  cu_depth_2_4_r                         ; 
		7'd72: cu_depth_top_r  =  cu_depth_2_4_r                         ; 
		7'd73: cu_depth_top_r  =  cu_depth_2_6_r                         ; 
		7'd74: cu_depth_top_r  =  cu_depth_2_6_r                         ; 
		7'd75: cu_depth_top_r  =  cu_depth_2_6_r                         ; 
		7'd76: cu_depth_top_r  =  cu_depth_2_6_r                         ; 
		7'd77: cu_depth_top_r  =  cu_depth_4_4_r                         ; 
		7'd78: cu_depth_top_r  =  cu_depth_4_4_r                         ; 
		7'd79: cu_depth_top_r  =  cu_depth_4_4_r                         ; 
		7'd80: cu_depth_top_r  =  cu_depth_4_4_r                         ; 
		7'd81: cu_depth_top_r  =  cu_depth_4_6_r                         ; 
		7'd82: cu_depth_top_r  =  cu_depth_4_6_r                         ; 
		7'd83: cu_depth_top_r  =  cu_depth_4_6_r                         ; 
		7'd84: cu_depth_top_r  =  cu_depth_4_6_r                         ; 
      default: cu_depth_top_r  = 2'd0                                    ;                      
    endcase		  
end 

// cu_skip_top_flag_r
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin 
        cu_skip_top_flag_r       <=    1'b0     ;
    end 
    else  begin 
        case(cu_idx_r)
			7'd0 :cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[7]: 1'b0 ;  
			7'd1 :cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[7]: 1'b0 ;  
			7'd2 :cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[3]: 1'b0 ;  
			7'd3 :cu_skip_top_flag_r <= cu_skip_flag_i[1]                   ;  
			7'd4 :cu_skip_top_flag_r <= cu_skip_flag_i[2]                   ;  
			7'd5 :cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[7]: 1'b0 ;  
			7'd6 :cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[5]: 1'b0 ;  
			7'd7 :cu_skip_top_flag_r <= cu_skip_flag_i[5]                   ;  
			7'd8 :cu_skip_top_flag_r <= cu_skip_flag_i[6]                   ;  
			7'd9 :cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[3]: 1'b0 ;  
			7'd10:cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[1]: 1'b0 ;  
			7'd11:cu_skip_top_flag_r <= cu_skip_flag_i[9]                   ;  
			7'd12:cu_skip_top_flag_r <= cu_skip_flag_i[10]                  ;  
			7'd13:cu_skip_top_flag_r <= cu_skip_flag_i[7]                   ;  
			7'd14:cu_skip_top_flag_r <= cu_skip_flag_i[8]                   ;  
			7'd15:cu_skip_top_flag_r <= cu_skip_flag_i[13]                  ;  
			7'd16:cu_skip_top_flag_r <= cu_skip_flag_i[14]                  ;  
			7'd17:cu_skip_top_flag_r <= cu_skip_flag_i[11]                  ;  
			7'd18:cu_skip_top_flag_r <= cu_skip_flag_i[12]                  ;  
			7'd19:cu_skip_top_flag_r <= cu_skip_flag_i[17]                  ;  
			7'd20:cu_skip_top_flag_r <= cu_skip_flag_i[18]                  ;  
			7'd21:cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[7]: 1'b0 ;  
			7'd22:cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[6]: 1'b0 ;  
			7'd23:cu_skip_top_flag_r <= cu_skip_flag_i[21]                  ;  
			7'd24:cu_skip_top_flag_r <= cu_skip_flag_i[22]                  ;  
			7'd25:cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[5]: 1'b0 ;  
			7'd26:cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[4]: 1'b0 ;  
			7'd27:cu_skip_top_flag_r <= cu_skip_flag_i[25]                  ;  
			7'd28:cu_skip_top_flag_r <= cu_skip_flag_i[26]                  ;  
			7'd29:cu_skip_top_flag_r <= cu_skip_flag_i[23]                  ;  
			7'd30:cu_skip_top_flag_r <= cu_skip_flag_i[24]                  ;  
			7'd31:cu_skip_top_flag_r <= cu_skip_flag_i[29]                  ;  
			7'd32:cu_skip_top_flag_r <= cu_skip_flag_i[30]                  ;  
			7'd33:cu_skip_top_flag_r <= cu_skip_flag_i[27]                  ;  
			7'd34:cu_skip_top_flag_r <= cu_skip_flag_i[28]                  ;  
			7'd35:cu_skip_top_flag_r <= cu_skip_flag_i[33]                  ;  
			7'd36:cu_skip_top_flag_r <= cu_skip_flag_i[34]                  ;  
			7'd37:cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[3]: 1'b0 ;  
			7'd38:cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[2]: 1'b0 ;  
			7'd39:cu_skip_top_flag_r <= cu_skip_flag_i[37]                  ;  
			7'd40:cu_skip_top_flag_r <= cu_skip_flag_i[38]                  ;  
			7'd41:cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[1]: 1'b0 ;  
			7'd42:cu_skip_top_flag_r <= mb_y_i ? r_data_neigh_mb_r[0]: 1'b0 ;  
			7'd43:cu_skip_top_flag_r <= cu_skip_flag_i[41]                  ;  
			7'd44:cu_skip_top_flag_r <= cu_skip_flag_i[42]                  ;  
			7'd45:cu_skip_top_flag_r <= cu_skip_flag_i[39]                  ;  
			7'd46:cu_skip_top_flag_r <= cu_skip_flag_i[40]                  ;  
			7'd47:cu_skip_top_flag_r <= cu_skip_flag_i[45]                  ;  
			7'd48:cu_skip_top_flag_r <= cu_skip_flag_i[46]                  ;  
			7'd49:cu_skip_top_flag_r <= cu_skip_flag_i[43]                  ;  
			7'd50:cu_skip_top_flag_r <= cu_skip_flag_i[44]                  ;  
			7'd51:cu_skip_top_flag_r <= cu_skip_flag_i[49]                  ;  
			7'd52:cu_skip_top_flag_r <= cu_skip_flag_i[50]                  ;  
			7'd53:cu_skip_top_flag_r <= cu_skip_flag_i[31]                  ;  
			7'd54:cu_skip_top_flag_r <= cu_skip_flag_i[32]                  ;  
			7'd55:cu_skip_top_flag_r <= cu_skip_flag_i[53]                  ;  
			7'd56:cu_skip_top_flag_r <= cu_skip_flag_i[54]                  ;  
			7'd57:cu_skip_top_flag_r <= cu_skip_flag_i[56]                  ;  
			7'd58:cu_skip_top_flag_r <= cu_skip_flag_i[58]                  ;  
			7'd59:cu_skip_top_flag_r <= cu_skip_flag_i[57]                  ;  
			7'd60:cu_skip_top_flag_r <= cu_skip_flag_i[58]                  ;  
			7'd61:cu_skip_top_flag_r <= cu_skip_flag_i[55]                  ;  
			7'd62:cu_skip_top_flag_r <= cu_skip_flag_i[56]                  ;  
			7'd63:cu_skip_top_flag_r <= cu_skip_flag_i[61]                  ;  
			7'd64:cu_skip_top_flag_r <= cu_skip_flag_i[62]                  ;  
			7'd65:cu_skip_top_flag_r <= cu_skip_flag_i[59]                  ;  
			7'd66:cu_skip_top_flag_r <= cu_skip_flag_i[60]                  ;  
			7'd67:cu_skip_top_flag_r <= cu_skip_flag_i[65]                  ;  
			7'd68:cu_skip_top_flag_r <= cu_skip_flag_i[66]                  ;  
			7'd69:cu_skip_top_flag_r <= cu_skip_flag_i[47]                  ;  
			7'd70:cu_skip_top_flag_r <= cu_skip_flag_i[48]                  ;  
			7'd71:cu_skip_top_flag_r <= cu_skip_flag_i[69]                  ;  
			7'd72:cu_skip_top_flag_r <= cu_skip_flag_i[70]                  ;  
			7'd73:cu_skip_top_flag_r <= cu_skip_flag_i[51]                  ;  
			7'd74:cu_skip_top_flag_r <= cu_skip_flag_i[52]                  ;  
			7'd75:cu_skip_top_flag_r <= cu_skip_flag_i[73]                  ;  
			7'd76:cu_skip_top_flag_r <= cu_skip_flag_i[74]                  ;  
			7'd77:cu_skip_top_flag_r <= cu_skip_flag_i[71]                  ;  
			7'd78:cu_skip_top_flag_r <= cu_skip_flag_i[72]                  ;  
			7'd79:cu_skip_top_flag_r <= cu_skip_flag_i[77]                  ;  
			7'd80:cu_skip_top_flag_r <= cu_skip_flag_i[78]                  ;  
			7'd81:cu_skip_top_flag_r <= cu_skip_flag_i[75]                  ;  
			7'd82:cu_skip_top_flag_r <= cu_skip_flag_i[76]                  ;  
			7'd83:cu_skip_top_flag_r <= cu_skip_flag_i[81]                  ;  
			7'd84:cu_skip_top_flag_r <= cu_skip_flag_i[82]                  ;  
          default:cu_skip_top_flag_r <= 1'd0                                ;                       
        endcase		  
    end 
end 

// cu_depth_left_r 
always @* begin
    case(cu_idx_r)
        7'd0  :  cu_depth_left_r  =  mb_x_i ? cu_left_0_r[1:0] :2'd0;
        7'd1  :  cu_depth_left_r  =  mb_x_i ? cu_left_0_r[1:0] :2'd0;
        7'd2  :  cu_depth_left_r  =  cu_depth_0_2_r                 ;
        7'd3  :  cu_depth_left_r  =  mb_x_i ? cu_left_8_r[1:0] :2'd0;
        7'd4  :  cu_depth_left_r  =  cu_depth_4_2_r                 ;
        7'd5  :  cu_depth_left_r  =  mb_x_i ? cu_left_0_r[1:0] :2'd0;
        7'd6  :  cu_depth_left_r  =  cu_depth_0_0_r                 ;
        7'd7  :  cu_depth_left_r  =  mb_x_i ? cu_left_4_r[1:0] :2'd0;
        7'd8  :  cu_depth_left_r  =  cu_depth_2_0_r                 ;
        7'd9  :  cu_depth_left_r  =  cu_depth_0_2_r                 ;
        7'd10 :  cu_depth_left_r  =  cu_depth_0_4_r                 ;
	    7'd11 :  cu_depth_left_r  =  cu_depth_2_2_r                 ;
	    7'd12 :  cu_depth_left_r  =  cu_depth_2_4_r                 ;
	    7'd13 :  cu_depth_left_r  =  mb_x_i ? cu_left_8_r[1:0] :2'd0;
	    7'd14 :  cu_depth_left_r  =  cu_depth_4_0_r                 ;
	    7'd15 :  cu_depth_left_r  =  mb_x_i ? cu_left_12_r[1:0]:2'd0;
	    7'd16 :  cu_depth_left_r  =  cu_depth_6_0_r                 ;
	    7'd17 :  cu_depth_left_r  =  cu_depth_4_2_r                 ;
	    7'd18 :  cu_depth_left_r  =  cu_depth_4_4_r                 ;
	    7'd19 :  cu_depth_left_r  =  cu_depth_6_2_r                 ;
	    7'd20 :  cu_depth_left_r  =  cu_depth_6_4_r                 ;
	    7'd21 :  cu_depth_left_r  =  mb_x_i ? cu_left_0_r[1:0]:2'd0 ;
	    7'd22 :  cu_depth_left_r  =  cu_left_0_r[1:0]               ;
	    7'd23 :  cu_depth_left_r  =  mb_x_i ? cu_left_0_r[1:0]:2'd0 ;
	    7'd24 :  cu_depth_left_r  =  cu_left_0_r[1:0]               ;
	    7'd25 :  cu_depth_left_r  =  cu_depth_0_0_r                 ;
	    7'd26 :  cu_depth_left_r  =  cu_depth_0_0_r                 ;
	    7'd27 :  cu_depth_left_r  =  cu_depth_0_0_r                 ;
	    7'd28 :  cu_depth_left_r  =  cu_depth_0_0_r                 ;
	    7'd29 :  cu_depth_left_r  =  mb_x_i ? cu_left_2_r[1:0]:2'd0 ;
	    7'd30 :  cu_depth_left_r  =  cu_left_2_r[1:0]               ;
	    7'd31 :  cu_depth_left_r  =  mb_x_i ? cu_left_2_r[1:0]:2'd0 ;
	    7'd32 :  cu_depth_left_r  =  cu_left_2_r[1:0]               ;
	    7'd33 :  cu_depth_left_r  =  cu_depth_2_0_r                 ;
	    7'd34 :  cu_depth_left_r  =  cu_depth_2_0_r                 ;
	    7'd35 :  cu_depth_left_r  =  cu_depth_2_0_r                 ;
	    7'd36 :  cu_depth_left_r  =  cu_depth_2_0_r                 ;
	    7'd37 :  cu_depth_left_r  =  cu_depth_0_2_r                 ;
	    7'd38 :  cu_depth_left_r  =  cu_depth_0_2_r                 ;
	    7'd39 :  cu_depth_left_r  =  cu_depth_0_2_r                 ;
	    7'd40 :  cu_depth_left_r  =  cu_depth_0_2_r                 ;
	    7'd41 :  cu_depth_left_r  =  cu_depth_0_4_r                 ;
	    7'd42 :  cu_depth_left_r  =  cu_depth_0_4_r                 ;
        7'd43 :  cu_depth_left_r  =  cu_depth_0_4_r                 ;
        7'd44 :  cu_depth_left_r  =  cu_depth_0_4_r                 ;
	    7'd45 :  cu_depth_left_r  =  cu_depth_2_2_r                 ;
        7'd46 :  cu_depth_left_r  =  cu_depth_2_2_r                 ;
	    7'd47 :  cu_depth_left_r  =  cu_depth_2_2_r                 ;
	    7'd48 :  cu_depth_left_r  =  cu_depth_2_2_r                 ;
	    7'd49 :  cu_depth_left_r  =  cu_depth_2_4_r                 ;
	    7'd50 :  cu_depth_left_r  =  cu_depth_2_4_r                 ;
	    7'd51 :  cu_depth_left_r  =  cu_depth_2_4_r                 ;
	    7'd52 :  cu_depth_left_r  =  cu_depth_2_4_r                 ;
	    7'd53 :  cu_depth_left_r  =  mb_x_i ? cu_left_8_r[1:0]:2'd0 ;
	    7'd54 :  cu_depth_left_r  =  cu_left_8_r[1:0]               ;
	    7'd55 :  cu_depth_left_r  =  mb_x_i ? cu_left_8_r[1:0]:2'd0 ;
	    7'd56 :  cu_depth_left_r  =  cu_left_8_r[1:0]               ;
	    7'd57 :  cu_depth_left_r  =  cu_depth_4_0_r                 ;
	    7'd58 :  cu_depth_left_r  =  cu_depth_4_0_r                 ;
	    7'd59 :  cu_depth_left_r  =  cu_depth_4_0_r                 ;
	    7'd60 :  cu_depth_left_r  =  cu_depth_4_0_r                 ;
	    7'd61 :  cu_depth_left_r  =  mb_x_i ? cu_left_12_r[1:0]:2'd0;
	    7'd62 :  cu_depth_left_r  =  cu_left_12_r[1:0]              ;
	    7'd63 :  cu_depth_left_r  =  mb_x_i ? cu_left_12_r[1:0]:2'd0;
	    7'd64 :  cu_depth_left_r  =  cu_left_12_r[1:0]              ;
	    7'd65 :  cu_depth_left_r  =  cu_depth_6_0_r                 ;
	    7'd66 :  cu_depth_left_r  =  cu_depth_6_0_r                 ;
	    7'd67 :  cu_depth_left_r  =  cu_depth_6_0_r                 ;
	    7'd68 :  cu_depth_left_r  =  cu_depth_6_0_r                 ;
	    7'd69 :  cu_depth_left_r  =  cu_depth_4_2_r                 ;
	    7'd70 :  cu_depth_left_r  =  cu_depth_4_2_r                 ;
	    7'd71 :  cu_depth_left_r  =  cu_depth_4_2_r                 ;
	    7'd72 :  cu_depth_left_r  =  cu_depth_4_2_r                 ;
	    7'd73 :  cu_depth_left_r  =  cu_depth_4_4_r                 ;
	    7'd74 :  cu_depth_left_r  =  cu_depth_4_4_r                 ;
	    7'd75 :  cu_depth_left_r  =  cu_depth_4_4_r                 ;
	    7'd76 :  cu_depth_left_r  =  cu_depth_4_4_r                 ;
	    7'd77 :  cu_depth_left_r  =  cu_depth_6_2_r                 ;
	    7'd78 :  cu_depth_left_r  =  cu_depth_6_2_r                 ;
	    7'd79 :  cu_depth_left_r  =  cu_depth_6_2_r                 ;
	    7'd80 :  cu_depth_left_r  =  cu_depth_6_2_r                 ;
	    7'd81 :  cu_depth_left_r  =  cu_depth_6_4_r                 ;
	    7'd82 :  cu_depth_left_r  =  cu_depth_6_4_r                 ;
        7'd83 :  cu_depth_left_r  =  cu_depth_6_4_r                 ;
        7'd84 :  cu_depth_left_r  =  cu_depth_6_4_r                 ;
	   default:  cu_depth_left_r  =  2'd0                           ;
	endcase 
end 

// cu_skip_left_flag_r  
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin 
        cu_skip_left_flag_r       <=    1'b0     ;
    end 
    else  begin 
        case(cu_idx_r)
			7'd0 : cu_skip_left_flag_r <= mb_x_i ?  cu_left_0_r[8]:1'b0 ;  
			7'd1 : cu_skip_left_flag_r <= mb_x_i ?  cu_left_0_r[8]:1'b0 ;  
			7'd2 : cu_skip_left_flag_r <= cu_skip_flag_i[1]             ;
			7'd3 : cu_skip_left_flag_r <= mb_x_i ?  cu_left_4_r[8]:1'b0 ;  
			7'd4 : cu_skip_left_flag_r <= cu_skip_flag_i[3]             ;
			7'd5 : cu_skip_left_flag_r <= mb_x_i ?  cu_left_0_r[8]:1'b0 ;  
			7'd6 : cu_skip_left_flag_r <= cu_skip_flag_i[5]             ;
			7'd7 : cu_skip_left_flag_r <= mb_x_i ?  cu_left_2_r[8]:1'b0 ;  
			7'd8 : cu_skip_left_flag_r <= cu_skip_flag_i[7]             ;
			7'd9 : cu_skip_left_flag_r <= cu_skip_flag_i[6]             ;
			7'd10: cu_skip_left_flag_r <= cu_skip_flag_i[9]             ;
			7'd11: cu_skip_left_flag_r <= cu_skip_flag_i[8]             ;
			7'd12: cu_skip_left_flag_r <= cu_skip_flag_i[11]            ;
			7'd13: cu_skip_left_flag_r <= mb_x_i ?  cu_left_4_r[8]:1'b0 ;
			7'd14: cu_skip_left_flag_r <= cu_skip_flag_i[13]            ;
			7'd15: cu_skip_left_flag_r <= mb_x_i ?  cu_left_6_r[8]:1'b0 ;
			7'd16: cu_skip_left_flag_r <= cu_skip_flag_i[15]            ;
			7'd17: cu_skip_left_flag_r <= cu_skip_flag_i[14]            ;
			7'd18: cu_skip_left_flag_r <= cu_skip_flag_i[17]            ;
			7'd19: cu_skip_left_flag_r <= cu_skip_flag_i[16]            ;
			7'd20: cu_skip_left_flag_r <= cu_skip_flag_i[19]            ;
			7'd21: cu_skip_left_flag_r <= mb_x_i ? cu_left_0_r[8]:1'b0  ;
			7'd22: cu_skip_left_flag_r <= cu_skip_flag_i[0 ]            ;
			7'd23: cu_skip_left_flag_r <= mb_x_i ? cu_left_1_r[8]:1'b0  ;
			7'd24: cu_skip_left_flag_r <= cu_skip_flag_i[2 ]            ;
			7'd25: cu_skip_left_flag_r <= cu_skip_flag_i[3 ]            ;
			7'd26: cu_skip_left_flag_r <= cu_skip_flag_i[4 ]            ;
			7'd27: cu_skip_left_flag_r <= cu_skip_flag_i[5 ]            ;
			7'd28: cu_skip_left_flag_r <= cu_skip_flag_i[6 ]            ;
			7'd29: cu_skip_left_flag_r <= mb_x_i ? cu_left_2_r[8]:1'b0  ;
			7'd30: cu_skip_left_flag_r <= cu_skip_flag_i[8 ]            ;
			7'd31: cu_skip_left_flag_r <= mb_x_i ? cu_left_3_r[8]:1'b0  ;
			7'd32: cu_skip_left_flag_r <= cu_skip_flag_i[10]            ;
			7'd33: cu_skip_left_flag_r <= cu_skip_flag_i[9 ]            ;
			7'd34: cu_skip_left_flag_r <= cu_skip_flag_i[12]            ;
			7'd35: cu_skip_left_flag_r <= cu_skip_flag_i[11]            ;
			7'd36: cu_skip_left_flag_r <= cu_skip_flag_i[14]            ;
			7'd37: cu_skip_left_flag_r <= cu_skip_flag_i[5 ]            ;
			7'd38: cu_skip_left_flag_r <= cu_skip_flag_i[16]            ;
			7'd39: cu_skip_left_flag_r <= cu_skip_flag_i[7 ]            ;
			7'd40: cu_skip_left_flag_r <= cu_skip_flag_i[18]            ;
			7'd41: cu_skip_left_flag_r <= cu_skip_flag_i[17]            ;
			7'd42: cu_skip_left_flag_r <= cu_skip_flag_i[20]            ;
			7'd43: cu_skip_left_flag_r <= cu_skip_flag_i[19]            ;
			7'd44: cu_skip_left_flag_r <= cu_skip_flag_i[22]            ;
			7'd45: cu_skip_left_flag_r <= cu_skip_flag_i[13]            ;
			7'd46: cu_skip_left_flag_r <= cu_skip_flag_i[24]            ;
			7'd47: cu_skip_left_flag_r <= cu_skip_flag_i[15]            ;
			7'd48: cu_skip_left_flag_r <= cu_skip_flag_i[26]            ;
			7'd49: cu_skip_left_flag_r <= cu_skip_flag_i[25]            ;
			7'd50: cu_skip_left_flag_r <= cu_skip_flag_i[28]            ;
			7'd51: cu_skip_left_flag_r <= cu_skip_flag_i[27]            ;
			7'd52: cu_skip_left_flag_r <= cu_skip_flag_i[30]            ;
			7'd53: cu_skip_left_flag_r <= mb_x_i ? cu_left_4_r[8]:1'b0  ;
			7'd54: cu_skip_left_flag_r <= cu_skip_flag_i[32]            ;
			7'd55: cu_skip_left_flag_r <= mb_x_i ? cu_left_5_r[8]:1'b0  ;
			7'd56: cu_skip_left_flag_r <= cu_skip_flag_i[34]            ;
			7'd57: cu_skip_left_flag_r <= cu_skip_flag_i[33]            ;
			7'd58: cu_skip_left_flag_r <= cu_skip_flag_i[36]            ;
			7'd59: cu_skip_left_flag_r <= cu_skip_flag_i[35]            ;
			7'd60: cu_skip_left_flag_r <= cu_skip_flag_i[38]            ;
			7'd61: cu_skip_left_flag_r <= mb_x_i ? cu_left_6_r[8]:1'b0  ;
			7'd62: cu_skip_left_flag_r <= cu_skip_flag_i[40]            ;
			7'd63: cu_skip_left_flag_r <= mb_x_i ? cu_left_7_r[8]:1'b0  ;
			7'd64: cu_skip_left_flag_r <= cu_skip_flag_i[42]            ;
			7'd65: cu_skip_left_flag_r <= cu_skip_flag_i[41]            ;
			7'd66: cu_skip_left_flag_r <= cu_skip_flag_i[44]            ;
			7'd67: cu_skip_left_flag_r <= cu_skip_flag_i[43]            ;
			7'd68: cu_skip_left_flag_r <= cu_skip_flag_i[46]            ;
			7'd69: cu_skip_left_flag_r <= cu_skip_flag_i[37]            ;
			7'd70: cu_skip_left_flag_r <= cu_skip_flag_i[48]            ;
			7'd71: cu_skip_left_flag_r <= cu_skip_flag_i[39]            ;
			7'd72: cu_skip_left_flag_r <= cu_skip_flag_i[50]            ;
			7'd73: cu_skip_left_flag_r <= cu_skip_flag_i[49]            ;
			7'd74: cu_skip_left_flag_r <= cu_skip_flag_i[52]            ;
			7'd75: cu_skip_left_flag_r <= cu_skip_flag_i[51]            ;
			7'd76: cu_skip_left_flag_r <= cu_skip_flag_i[54]            ;
			7'd77: cu_skip_left_flag_r <= cu_skip_flag_i[45]            ;
			7'd78: cu_skip_left_flag_r <= cu_skip_flag_i[56]            ;
			7'd79: cu_skip_left_flag_r <= cu_skip_flag_i[47]            ;
			7'd80: cu_skip_left_flag_r <= cu_skip_flag_i[58]            ;
			7'd81: cu_skip_left_flag_r <= cu_skip_flag_i[57]            ;
			7'd82: cu_skip_left_flag_r <= cu_skip_flag_i[60]            ;
			7'd83: cu_skip_left_flag_r <= cu_skip_flag_i[59]            ;
			7'd84: cu_skip_left_flag_r <= cu_skip_flag_i[62]            ;
          default: cu_skip_left_flag_r <=1'b0                           ;
		endcase	
    end 
end 

// last_cu_flag_r
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
	    last_cu_flag_r    <=   1'b0    ;
	else if(cu_idx_r==7'd84)
		last_cu_flag_r    <=   1'b1    ;
	else if( (cu_idx_r==7'd0 || cu_idx_r==7'd4 || cu_idx_r==7'd20) && cu_split_flag_r==0 ) 
		last_cu_flag_r    <=   1'b1    ;
	else
		last_cu_flag_r    <=   1'b0    ;
end

// cu_mvd_ren_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_mvd_ren_r  <=  1'b1 ;
	else if(slice_type_i)
	    cu_mvd_ren_r  <=  1'b1 ;
	else if(cu_start_d1_r || cu_start_d2_r)
        cu_mvd_ren_r  <=  1'b0 ;	
	else 
        cu_mvd_ren_r  <=  1'b1 ;
end 

wire [1:0] cu_inter_part_size_temp_w = {cu_inter_part_size_r[0],cu_inter_part_size_r[1]} ;

// cu_mvd_raddr_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_mvd_raddr_r  <=  7'd0    ;
	else if(cu_start_r) begin 
        case(cu_depth_r) 
		    2'd0:  cu_mvd_raddr_r <= {2'd0,4'd0}                   ; // 64x64: 0000
			2'd1:  cu_mvd_raddr_r <= {cu_idx_minus1_w[1:0],4'b0000}; // 32x32: 000000 010000 100000 110000    
			2'd2:  cu_mvd_raddr_r <= {cu_idx_minus5_w[3:0],2'b00  }; // 16x16: 0 4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 
			2'd3:  cu_mvd_raddr_r <=  cu_idx_minus21_w             ; // 8x8
        endcase			
    end 	
	else if(cu_start_d1_r)begin 
        case(cu_depth_r) 
		    2'd0:  cu_mvd_raddr_r <= {cu_inter_part_size_temp_w,4'd0}                       ; // 64x64 2NxN:+32 Nx2N:+16
			2'd1:  cu_mvd_raddr_r <= {cu_idx_minus1_w[1:0],cu_inter_part_size_temp_w,2'b00} ; // 32x32 2NxN:+8  Nx2N:+4 2Nx2N:+0 
			2'd2:  cu_mvd_raddr_r <= {cu_idx_minus5_w[3:0],cu_inter_part_size_temp_w      } ; // 16x16 2NxN:+2  Nx2N:+1 2Nx2N:+0
			2'd3:  cu_mvd_raddr_r <=  cu_idx_minus21_w                                      ; // 8x8
        endcase			
    end 
end 

// cu_mvd_data_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_mvd_data_r    <=   46'd0                                  ;
    else if(cu_start_d2_r)
        cu_mvd_data_r    <=  {23'b0,cu_mvd_i}        ;
    else if(cu_start_d3_r)
        cu_mvd_data_r    <=  {cu_mvd_data_r[2*`MVD_WIDTH:0],cu_mvd_i};
end 

/*
// cu_mvd_idx_r 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_mvd_idx_r     <=  9'd0                                    ;
    else begin
        case(cu_idx_r)
            7'd0  :  cu_mvd_idx_r  <=     {mvd_idx_i[  2:0  ],mvd_idx_i[194:192],mvd_idx_i[ 98:96 ]};
		    7'd1  :  cu_mvd_idx_r  <=     {mvd_idx_i[  2:0  ],mvd_idx_i[ 50:48 ],mvd_idx_i[ 26:24 ]};
		    7'd2  :  cu_mvd_idx_r  <=     {mvd_idx_i[ 98:96 ],mvd_idx_i[146:144],mvd_idx_i[122:120]};
		    7'd3  :  cu_mvd_idx_r  <=     {mvd_idx_i[194:192],mvd_idx_i[242:240],mvd_idx_i[218:216]};
		    7'd4  :  cu_mvd_idx_r  <=     {mvd_idx_i[290:288],mvd_idx_i[338:336],mvd_idx_i[314:312]};
		    7'd5  :  cu_mvd_idx_r  <=     {mvd_idx_i[  2:0  ],mvd_idx_i[ 14:12 ],mvd_idx_i[  8:6  ]};
		    7'd6  :  cu_mvd_idx_r  <=     {mvd_idx_i[ 26:24 ],mvd_idx_i[ 38:36 ],mvd_idx_i[ 32:30 ]};
		    7'd7  :  cu_mvd_idx_r  <=     {mvd_idx_i[ 50:48 ],mvd_idx_i[ 62:60 ],mvd_idx_i[ 56:54 ]};
		    7'd8  :  cu_mvd_idx_r  <=     {mvd_idx_i[ 74:72 ],mvd_idx_i[ 86:84 ],mvd_idx_i[ 80:78 ]};
		    7'd9  :  cu_mvd_idx_r  <=     {mvd_idx_i[ 98:96 ],mvd_idx_i[110:108],mvd_idx_i[104:102]};
		    7'd10 :  cu_mvd_idx_r  <=     {mvd_idx_i[122:120],mvd_idx_i[134:132],mvd_idx_i[128:126]};
		    7'd11 :  cu_mvd_idx_r  <=     {mvd_idx_i[146:144],mvd_idx_i[158:156],mvd_idx_i[152:150]};
		    7'd12 :  cu_mvd_idx_r  <=     {mvd_idx_i[170:168],mvd_idx_i[182:180],mvd_idx_i[176:174]};
		    7'd13 :  cu_mvd_idx_r  <=     {mvd_idx_i[194:192],mvd_idx_i[206:204],mvd_idx_i[200:198]};
		    7'd14 :  cu_mvd_idx_r  <=     {mvd_idx_i[218:216],mvd_idx_i[230:228],mvd_idx_i[224:222]};
		    7'd15 :  cu_mvd_idx_r  <=     {mvd_idx_i[242:240],mvd_idx_i[254:252],mvd_idx_i[248:246]};
		    7'd16 :  cu_mvd_idx_r  <=     {mvd_idx_i[266:264],mvd_idx_i[278:276],mvd_idx_i[272:270]};
		    7'd17 :  cu_mvd_idx_r  <=     {mvd_idx_i[290:288],mvd_idx_i[302:300],mvd_idx_i[296:294]};
		    7'd18 :  cu_mvd_idx_r  <=     {mvd_idx_i[314:312],mvd_idx_i[326:324],mvd_idx_i[320:318]};
		    7'd19 :  cu_mvd_idx_r  <=     {mvd_idx_i[338:336],mvd_idx_i[350:348],mvd_idx_i[344:342]};
		    7'd20 :  cu_mvd_idx_r  <=     {mvd_idx_i[362:360],mvd_idx_i[374:372],mvd_idx_i[368:366]};
		    7'd21 :  cu_mvd_idx_r  <=     {mvd_idx_i[  2:0  ],mvd_idx_i[  5:3  ],mvd_idx_i[  5:3  ]};
		    7'd22 :  cu_mvd_idx_r  <=     {mvd_idx_i[  8:6  ],mvd_idx_i[ 11:9  ],mvd_idx_i[ 11:9  ]};
		    7'd23 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 14:12 ],mvd_idx_i[ 17:15 ],mvd_idx_i[ 17:15 ]};
		    7'd24 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 20:18 ],mvd_idx_i[ 23:21 ],mvd_idx_i[ 23:21 ]};
		    7'd25 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 26:24 ],mvd_idx_i[ 29:27 ],mvd_idx_i[ 29:27 ]};
		    7'd26 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 32:30 ],mvd_idx_i[ 35:33 ],mvd_idx_i[ 35:33 ]};
		    7'd27 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 38:36 ],mvd_idx_i[ 41:39 ],mvd_idx_i[ 41:39 ]};
		    7'd28 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 44:42 ],mvd_idx_i[ 47:45 ],mvd_idx_i[ 47:45 ]};
		    7'd29 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 50:48 ],mvd_idx_i[ 53:51 ],mvd_idx_i[ 53:51 ]};
		    7'd30 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 56:54 ],mvd_idx_i[ 59:57 ],mvd_idx_i[ 59:57 ]};
		    7'd31 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 62:60 ],mvd_idx_i[ 65:63 ],mvd_idx_i[ 65:63 ]};
		    7'd32 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 68:66 ],mvd_idx_i[ 71:69 ],mvd_idx_i[ 71:69 ]};
		    7'd33 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 74:72 ],mvd_idx_i[ 77:75 ],mvd_idx_i[ 77:75 ]};
		    7'd34 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 80:78 ],mvd_idx_i[ 83:81 ],mvd_idx_i[ 83:81 ]};
		    7'd35 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 86:84 ],mvd_idx_i[ 89:87 ],mvd_idx_i[ 89:87 ]};
		    7'd36 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 92:90 ],mvd_idx_i[ 95:93 ],mvd_idx_i[ 95:93 ]};
		    7'd37 :  cu_mvd_idx_r  <=     {mvd_idx_i[ 98:96 ],mvd_idx_i[101:99 ],mvd_idx_i[101:99 ]};
		    7'd38 :  cu_mvd_idx_r  <=     {mvd_idx_i[104:102],mvd_idx_i[107:105],mvd_idx_i[107:105]};
		    7'd39 :  cu_mvd_idx_r  <=     {mvd_idx_i[110:108],mvd_idx_i[113:111],mvd_idx_i[113:111]};
		    7'd40 :  cu_mvd_idx_r  <=     {mvd_idx_i[116:114],mvd_idx_i[119:117],mvd_idx_i[119:117]};
		    7'd41 :  cu_mvd_idx_r  <=     {mvd_idx_i[122:120],mvd_idx_i[125:123],mvd_idx_i[125:123]};
		    7'd42 :  cu_mvd_idx_r  <=     {mvd_idx_i[128:126],mvd_idx_i[131:129],mvd_idx_i[131:129]};
		    7'd43 :  cu_mvd_idx_r  <=     {mvd_idx_i[134:132],mvd_idx_i[137:135],mvd_idx_i[137:135]};
		    7'd44 :  cu_mvd_idx_r  <=     {mvd_idx_i[140:138],mvd_idx_i[143:141],mvd_idx_i[143:141]};
		    7'd45 :  cu_mvd_idx_r  <=     {mvd_idx_i[146:144],mvd_idx_i[149:147],mvd_idx_i[149:147]};
		    7'd46 :  cu_mvd_idx_r  <=     {mvd_idx_i[152:150],mvd_idx_i[155:153],mvd_idx_i[155:153]};
		    7'd47 :  cu_mvd_idx_r  <=     {mvd_idx_i[158:156],mvd_idx_i[161:159],mvd_idx_i[161:159]};
		    7'd48 :  cu_mvd_idx_r  <=     {mvd_idx_i[164:162],mvd_idx_i[167:165],mvd_idx_i[167:165]};
		    7'd49 :  cu_mvd_idx_r  <=     {mvd_idx_i[170:168],mvd_idx_i[173:171],mvd_idx_i[173:171]};
		    7'd50 :  cu_mvd_idx_r  <=     {mvd_idx_i[176:174],mvd_idx_i[179:177],mvd_idx_i[179:177]};
		    7'd51 :  cu_mvd_idx_r  <=     {mvd_idx_i[182:180],mvd_idx_i[185:183],mvd_idx_i[185:183]};
		    7'd52 :  cu_mvd_idx_r  <=     {mvd_idx_i[188:186],mvd_idx_i[191:189],mvd_idx_i[191:189]};
		    7'd53 :  cu_mvd_idx_r  <=     {mvd_idx_i[194:192],mvd_idx_i[197:195],mvd_idx_i[197:195]};
		    7'd54 :  cu_mvd_idx_r  <=     {mvd_idx_i[200:198],mvd_idx_i[203:201],mvd_idx_i[203:201]};
		    7'd55 :  cu_mvd_idx_r  <=     {mvd_idx_i[206:204],mvd_idx_i[209:207],mvd_idx_i[209:207]};
		    7'd56 :  cu_mvd_idx_r  <=     {mvd_idx_i[212:210],mvd_idx_i[215:213],mvd_idx_i[215:213]};
		    7'd57 :  cu_mvd_idx_r  <=     {mvd_idx_i[218:216],mvd_idx_i[221:219],mvd_idx_i[221:219]};
		    7'd58 :  cu_mvd_idx_r  <=     {mvd_idx_i[224:222],mvd_idx_i[227:225],mvd_idx_i[227:225]};
		    7'd59 :  cu_mvd_idx_r  <=     {mvd_idx_i[230:228],mvd_idx_i[233:231],mvd_idx_i[233:231]};
		    7'd60 :  cu_mvd_idx_r  <=     {mvd_idx_i[236:234],mvd_idx_i[239:237],mvd_idx_i[239:237]};
		    7'd61 :  cu_mvd_idx_r  <=     {mvd_idx_i[242:240],mvd_idx_i[245:243],mvd_idx_i[245:243]};
		    7'd62 :  cu_mvd_idx_r  <=     {mvd_idx_i[248:246],mvd_idx_i[251:249],mvd_idx_i[251:249]};
		    7'd63 :  cu_mvd_idx_r  <=     {mvd_idx_i[254:252],mvd_idx_i[257:255],mvd_idx_i[257:255]};
		    7'd64 :  cu_mvd_idx_r  <=     {mvd_idx_i[260:258],mvd_idx_i[263:261],mvd_idx_i[263:261]};
		    7'd65 :  cu_mvd_idx_r  <=     {mvd_idx_i[266:264],mvd_idx_i[269:267],mvd_idx_i[269:267]};
		    7'd66 :  cu_mvd_idx_r  <=     {mvd_idx_i[272:270],mvd_idx_i[275:273],mvd_idx_i[275:273]};
		    7'd67 :  cu_mvd_idx_r  <=     {mvd_idx_i[278:276],mvd_idx_i[281:279],mvd_idx_i[281:279]};
		    7'd68 :  cu_mvd_idx_r  <=     {mvd_idx_i[284:282],mvd_idx_i[287:285],mvd_idx_i[287:285]};
		    7'd69 :  cu_mvd_idx_r  <=     {mvd_idx_i[290:288],mvd_idx_i[293:291],mvd_idx_i[293:291]};
            7'd70 :  cu_mvd_idx_r  <=     {mvd_idx_i[296:294],mvd_idx_i[299:297],mvd_idx_i[299:297]};
            7'd71 :  cu_mvd_idx_r  <=     {mvd_idx_i[302:300],mvd_idx_i[305:303],mvd_idx_i[305:303]};
            7'd72 :  cu_mvd_idx_r  <=     {mvd_idx_i[308:306],mvd_idx_i[311:309],mvd_idx_i[311:309]};
            7'd73 :  cu_mvd_idx_r  <=     {mvd_idx_i[314:312],mvd_idx_i[317:315],mvd_idx_i[317:315]};
            7'd74 :  cu_mvd_idx_r  <=     {mvd_idx_i[320:318],mvd_idx_i[323:321],mvd_idx_i[323:321]};
            7'd75 :  cu_mvd_idx_r  <=     {mvd_idx_i[326:324],mvd_idx_i[329:327],mvd_idx_i[329:327]};
            7'd76 :  cu_mvd_idx_r  <=     {mvd_idx_i[332:330],mvd_idx_i[335:333],mvd_idx_i[335:333]};
            7'd77 :  cu_mvd_idx_r  <=     {mvd_idx_i[338:336],mvd_idx_i[341:339],mvd_idx_i[341:339]};
            7'd78 :  cu_mvd_idx_r  <=     {mvd_idx_i[344:342],mvd_idx_i[347:345],mvd_idx_i[347:345]};
            7'd79 :  cu_mvd_idx_r  <=     {mvd_idx_i[350:348],mvd_idx_i[353:351],mvd_idx_i[353:351]};
            7'd80 :  cu_mvd_idx_r  <=     {mvd_idx_i[356:354],mvd_idx_i[359:357],mvd_idx_i[359:357]};
            7'd81 :  cu_mvd_idx_r  <=     {mvd_idx_i[362:360],mvd_idx_i[365:363],mvd_idx_i[365:363]};
            7'd82 :  cu_mvd_idx_r  <=     {mvd_idx_i[368:366],mvd_idx_i[371:369],mvd_idx_i[371:369]};
            7'd83 :  cu_mvd_idx_r  <=     {mvd_idx_i[374:372],mvd_idx_i[377:375],mvd_idx_i[377:375]};
            7'd84 :  cu_mvd_idx_r  <=     {mvd_idx_i[380:378],mvd_idx_i[383:381],mvd_idx_i[383:381]};
          default :  cu_mvd_idx_r  <=      9'd0                                  ;
        endcase
    end 
end 
*/

// cu_qp_nocoded_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_qp_nocoded_r    <=  1'b1    ;
	else if(!cu_idx_r)
        cu_qp_nocoded_r    <=  1'b1    ;
	else
        cu_qp_nocoded_r    <=  cu_qp_coded_flag_w ;	
end 

// cu_qp_last_r  
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) 
	    cu_qp_last_r   <=   6'd0             ;
	else if(lcu_curr_state_r[2]&&(luma_cbf_i||cr_cbf_i||cb_cbf_i))	
        cu_qp_last_r   <=   lcu_qp_i         ;
    else if(mb_x_i==0 && mb_y_i ==0)
        cu_qp_last_r   <=   param_qp_i       ;
end 

// mode info 
// cu_luma_mode_ren_o 
always @* begin 
    if(cu_start_r || cu_start_d1_r || cu_start_d2_r)
        cu_luma_mode_ren_o  =  1'b0       ;
    else 
	    cu_luma_mode_ren_o  =  1'b1       ;
end 

// cu_luma_mode_raddr_o 
always @* begin 
    if(cu_start_r )
        cu_luma_mode_raddr_o  =  cu_luma_left_mode_raddr_r    ;
    else if(cu_start_d1_r)
	    cu_luma_mode_raddr_o  =  cu_luma_mode_raddr_r         ;
	else if(cu_start_d2_r)
	    cu_luma_mode_raddr_o  =  cu_luma_top_mode_raddr_r     ;
	else 
	    cu_luma_mode_raddr_o  =  6'd0                         ;
end 

// cu_luma_mode_raddr_r 
always @* begin 
    case(cu_idx_r) 
        7'd0 :  cu_luma_mode_raddr_r  =  6'd0             ;
		7'd1 :  cu_luma_mode_raddr_r  =  6'd0             ;
		7'd2 :  cu_luma_mode_raddr_r  =  6'd16            ;
		7'd3 :  cu_luma_mode_raddr_r  =  6'd32            ;
		7'd4 :  cu_luma_mode_raddr_r  =  6'd48            ;
		7'd5 :  cu_luma_mode_raddr_r  =  6'd0             ;
		7'd6 :  cu_luma_mode_raddr_r  =  6'd4             ;
		7'd7 :  cu_luma_mode_raddr_r  =  6'd8             ;
		7'd8 :  cu_luma_mode_raddr_r  =  6'd12            ;
		7'd9 :  cu_luma_mode_raddr_r  =  6'd16            ;
		7'd10:  cu_luma_mode_raddr_r  =  6'd20            ;
		7'd11:  cu_luma_mode_raddr_r  =  6'd24            ;
		7'd12:  cu_luma_mode_raddr_r  =  6'd28            ;
		7'd13:  cu_luma_mode_raddr_r  =  6'd32            ;
		7'd14:  cu_luma_mode_raddr_r  =  6'd36            ;
		7'd15:  cu_luma_mode_raddr_r  =  6'd40            ;
		7'd16:  cu_luma_mode_raddr_r  =  6'd44            ;
		7'd17:  cu_luma_mode_raddr_r  =  6'd48            ;
		7'd18:  cu_luma_mode_raddr_r  =  6'd52            ;
		7'd19:  cu_luma_mode_raddr_r  =  6'd56            ;
		7'd20:  cu_luma_mode_raddr_r  =  6'd60            ;
	  default:  cu_luma_mode_raddr_r  =  cu_idx_r - 5'd21 ;
      
    endcase 
end 

/* 
always @* begin 
    case(cu_idx_r) 
        7'd0 :  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd1 :  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd2 :  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd3 :  cu_luma_top_mode_raddr_r  =  6'd10            ;
		7'd4 :  cu_luma_top_mode_raddr_r  =  6'd26            ;
		7'd5 :  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd6 :  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd7 :  cu_luma_top_mode_raddr_r  =  6'd2             ;
		7'd8 :  cu_luma_top_mode_raddr_r  =  6'd6             ;
		7'd9 :  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd10:  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd11:  cu_luma_top_mode_raddr_r  =  6'd18            ;
		7'd12:  cu_luma_top_mode_raddr_r  =  6'd22            ;
		7'd13:  cu_luma_top_mode_raddr_r  =  6'd10            ;
		7'd14:  cu_luma_top_mode_raddr_r  =  6'd14            ;
		7'd15:  cu_luma_top_mode_raddr_r  =  6'd34            ;
		7'd16:  cu_luma_top_mode_raddr_r  =  6'd38            ;
		7'd17:  cu_luma_top_mode_raddr_r  =  6'd26            ;
		7'd18:  cu_luma_top_mode_raddr_r  =  6'd30            ;
		7'd19:  cu_luma_top_mode_raddr_r  =  6'd50            ;
		7'd20:  cu_luma_top_mode_raddr_r  =  6'd54            ;
		7'd21:  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd22:  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd23:  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd24:  cu_luma_top_mode_raddr_r  =  6'd1             ;
		7'd25:  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd26:  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd27:  cu_luma_top_mode_raddr_r  =  6'd4             ;
		7'd28:  cu_luma_top_mode_raddr_r  =  6'd5             ;
		7'd29:  cu_luma_top_mode_raddr_r  =  6'd2             ;
		7'd30:  cu_luma_top_mode_raddr_r  =  6'd3             ;
		7'd31:  cu_luma_top_mode_raddr_r  =  6'd8             ;
		7'd32:  cu_luma_top_mode_raddr_r  =  6'd9             ;
		7'd33:  cu_luma_top_mode_raddr_r  =  6'd6             ;
		7'd34:  cu_luma_top_mode_raddr_r  =  6'd7             ;
		7'd35:  cu_luma_top_mode_raddr_r  =  6'd12            ;
		7'd36:  cu_luma_top_mode_raddr_r  =  6'd13            ;
		7'd37:  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd38:  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd39:  cu_luma_top_mode_raddr_r  =  6'd16            ;
		7'd40:  cu_luma_top_mode_raddr_r  =  6'd17            ;
		7'd41:  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd42:  cu_luma_top_mode_raddr_r  =  6'd0             ;
		7'd43:  cu_luma_top_mode_raddr_r  =  6'd20            ;
		7'd44:  cu_luma_top_mode_raddr_r  =  6'd21            ;
		7'd45:  cu_luma_top_mode_raddr_r  =  6'd18            ;
		7'd46:  cu_luma_top_mode_raddr_r  =  6'd19            ;
		7'd47:  cu_luma_top_mode_raddr_r  =  6'd24            ;
		7'd48:  cu_luma_top_mode_raddr_r  =  6'd25            ;
		7'd49:  cu_luma_top_mode_raddr_r  =  6'd22            ;
		7'd50:  cu_luma_top_mode_raddr_r  =  6'd23            ;
		7'd51:  cu_luma_top_mode_raddr_r  =  6'd28            ;
		7'd52:  cu_luma_top_mode_raddr_r  =  6'd29            ;
		7'd53:  cu_luma_top_mode_raddr_r  =  6'd10            ;
		7'd54:  cu_luma_top_mode_raddr_r  =  6'd11            ;
		7'd55:  cu_luma_top_mode_raddr_r  =  6'd32            ;
		7'd56:  cu_luma_top_mode_raddr_r  =  6'd33            ;
		7'd57:  cu_luma_top_mode_raddr_r  =  6'd14            ;
		7'd58:  cu_luma_top_mode_raddr_r  =  6'd15            ;
		7'd59:  cu_luma_top_mode_raddr_r  =  6'd36            ;
		7'd60:  cu_luma_top_mode_raddr_r  =  6'd37            ;
		7'd61:  cu_luma_top_mode_raddr_r  =  6'd34            ;
		7'd62:  cu_luma_top_mode_raddr_r  =  6'd35            ;
		7'd63:  cu_luma_top_mode_raddr_r  =  6'd40            ;
		7'd64:  cu_luma_top_mode_raddr_r  =  6'd41            ;
		7'd65:  cu_luma_top_mode_raddr_r  =  6'd38            ;
		7'd66:  cu_luma_top_mode_raddr_r  =  6'd39            ;
		7'd67:  cu_luma_top_mode_raddr_r  =  6'd44            ;
		7'd68:  cu_luma_top_mode_raddr_r  =  6'd45            ;
		7'd69:  cu_luma_top_mode_raddr_r  =  6'd26            ;
		7'd70:  cu_luma_top_mode_raddr_r  =  6'd27            ;
		7'd71:  cu_luma_top_mode_raddr_r  =  6'd48            ;
		7'd72:  cu_luma_top_mode_raddr_r  =  6'd49            ;
		7'd73:  cu_luma_top_mode_raddr_r  =  6'd30            ;
		7'd74:  cu_luma_top_mode_raddr_r  =  6'd31            ;
		7'd75:  cu_luma_top_mode_raddr_r  =  6'd52            ;
		7'd76:  cu_luma_top_mode_raddr_r  =  6'd53            ;
		7'd77:  cu_luma_top_mode_raddr_r  =  6'd50            ;
		7'd78:  cu_luma_top_mode_raddr_r  =  6'd51            ;
		7'd79:  cu_luma_top_mode_raddr_r  =  6'd56            ;
		7'd80:  cu_luma_top_mode_raddr_r  =  6'd57            ;
		7'd81:  cu_luma_top_mode_raddr_r  =  6'd54            ;
		7'd82:  cu_luma_top_mode_raddr_r  =  6'd55            ;
		7'd83:  cu_luma_top_mode_raddr_r  =  6'd60            ;
		7'd84:  cu_luma_top_mode_raddr_r  =  6'd61            ;
	  default:  cu_luma_top_mode_raddr_r  =  6'd0             ;
    endcase 
end 

always @* begin 
    case(cu_idx_r) 
        7'd0 :  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd1 :  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd2 :  cu_luma_left_mode_raddr_r  =  6'd5           ;
		7'd3 :  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd4 :  cu_luma_left_mode_raddr_r  =  6'd37          ;
		7'd5 :  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd6 :  cu_luma_left_mode_raddr_r  =  6'd1           ;
		7'd7 :  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd8 :  cu_luma_left_mode_raddr_r  =  6'd9           ;
		7'd9 :  cu_luma_left_mode_raddr_r  =  6'd5           ;
		7'd10:  cu_luma_left_mode_raddr_r  =  6'd17          ;
		7'd11:  cu_luma_left_mode_raddr_r  =  6'd13          ;
		7'd12:  cu_luma_left_mode_raddr_r  =  6'd25          ;
		7'd13:  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd14:  cu_luma_left_mode_raddr_r  =  6'd33          ;
		7'd15:  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd16:  cu_luma_left_mode_raddr_r  =  6'd41          ;
		7'd17:  cu_luma_left_mode_raddr_r  =  6'd37          ;
		7'd18:  cu_luma_left_mode_raddr_r  =  6'd49          ;
		7'd19:  cu_luma_left_mode_raddr_r  =  6'd45          ;
		7'd20:  cu_luma_left_mode_raddr_r  =  6'd57          ;
		7'd21:  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd22:  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd23:  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd24:  cu_luma_left_mode_raddr_r  =  6'd2           ;
		7'd25:  cu_luma_left_mode_raddr_r  =  6'd1           ;
		7'd26:  cu_luma_left_mode_raddr_r  =  6'd4           ;
		7'd27:  cu_luma_left_mode_raddr_r  =  6'd3           ;
		7'd28:  cu_luma_left_mode_raddr_r  =  6'd6           ;
		7'd29:  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd30:  cu_luma_left_mode_raddr_r  =  6'd8           ;
		7'd31:  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd32:  cu_luma_left_mode_raddr_r  =  6'd10          ;
		7'd33:  cu_luma_left_mode_raddr_r  =  6'd9           ;
		7'd34:  cu_luma_left_mode_raddr_r  =  6'd12          ;
		7'd35:  cu_luma_left_mode_raddr_r  =  6'd11          ;
		7'd36:  cu_luma_left_mode_raddr_r  =  6'd14          ;
		7'd37:  cu_luma_left_mode_raddr_r  =  6'd5           ;
		7'd38:  cu_luma_left_mode_raddr_r  =  6'd16          ;
		7'd39:  cu_luma_left_mode_raddr_r  =  6'd7           ;
		7'd40:  cu_luma_left_mode_raddr_r  =  6'd18          ;
		7'd41:  cu_luma_left_mode_raddr_r  =  6'd17          ;
		7'd42:  cu_luma_left_mode_raddr_r  =  6'd20          ;
		7'd43:  cu_luma_left_mode_raddr_r  =  6'd19          ;
		7'd44:  cu_luma_left_mode_raddr_r  =  6'd22          ;
		7'd45:  cu_luma_left_mode_raddr_r  =  6'd13          ;
		7'd46:  cu_luma_left_mode_raddr_r  =  6'd24          ;
		7'd47:  cu_luma_left_mode_raddr_r  =  6'd15          ;
		7'd48:  cu_luma_left_mode_raddr_r  =  6'd26          ;
		7'd49:  cu_luma_left_mode_raddr_r  =  6'd25          ;
		7'd50:  cu_luma_left_mode_raddr_r  =  6'd28          ;
		7'd51:  cu_luma_left_mode_raddr_r  =  6'd27          ;
		7'd52:  cu_luma_left_mode_raddr_r  =  6'd30          ;
		7'd53:  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd54:  cu_luma_left_mode_raddr_r  =  6'd32          ;
		7'd55:  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd56:  cu_luma_left_mode_raddr_r  =  6'd34          ;
		7'd57:  cu_luma_left_mode_raddr_r  =  6'd33          ;
		7'd58:  cu_luma_left_mode_raddr_r  =  6'd36          ;
		7'd59:  cu_luma_left_mode_raddr_r  =  6'd35          ;
		7'd60:  cu_luma_left_mode_raddr_r  =  6'd38          ;
		7'd61:  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd62:  cu_luma_left_mode_raddr_r  =  6'd40          ;
		7'd63:  cu_luma_left_mode_raddr_r  =  6'd0           ;
		7'd64:  cu_luma_left_mode_raddr_r  =  6'd42          ;
		7'd65:  cu_luma_left_mode_raddr_r  =  6'd41          ;
		7'd66:  cu_luma_left_mode_raddr_r  =  6'd44          ;
		7'd67:  cu_luma_left_mode_raddr_r  =  6'd43          ;
		7'd68:  cu_luma_left_mode_raddr_r  =  6'd46          ;
		7'd69:  cu_luma_left_mode_raddr_r  =  6'd37          ;
		7'd70:  cu_luma_left_mode_raddr_r  =  6'd48          ;
		7'd71:  cu_luma_left_mode_raddr_r  =  6'd39          ;
		7'd72:  cu_luma_left_mode_raddr_r  =  6'd50          ;
		7'd73:  cu_luma_left_mode_raddr_r  =  6'd49          ;
		7'd74:  cu_luma_left_mode_raddr_r  =  6'd52          ;
		7'd75:  cu_luma_left_mode_raddr_r  =  6'd51          ;
		7'd76:  cu_luma_left_mode_raddr_r  =  6'd54          ;
		7'd77:  cu_luma_left_mode_raddr_r  =  6'd45          ;
		7'd78:  cu_luma_left_mode_raddr_r  =  6'd56          ;
		7'd79:  cu_luma_left_mode_raddr_r  =  6'd47          ;
		7'd80:  cu_luma_left_mode_raddr_r  =  6'd58          ;
		7'd81:  cu_luma_left_mode_raddr_r  =  6'd57          ;
		7'd82:  cu_luma_left_mode_raddr_r  =  6'd60          ;
		7'd83:  cu_luma_left_mode_raddr_r  =  6'd59          ;
		7'd84:  cu_luma_left_mode_raddr_r  =  6'd62          ;
	  default:  cu_luma_left_mode_raddr_r  =  6'd0           ;
    endcase 
end 
*/ 

// cu_luma_top_mode_raddr_r
always @* begin 
    case(cu_idx_r) 
		7'd3 :  cu_luma_top_mode_raddr_r  =  cu_depth_2_0_r==2'd3 ? 6'd10 :(cu_depth_2_0_r==2'd2 ? 6'd8 :6'd0 );
		7'd4 :  cu_luma_top_mode_raddr_r  =  cu_depth_2_4_r==2'd3 ? 6'd26 :(cu_depth_2_4_r==2'd2 ? 6'd24:6'd16);
		7'd7 :  cu_luma_top_mode_raddr_r  =  cu_depth_0_0_r==2'd3 ? 6'd2  :6'd0                                ;
		7'd8 :  cu_luma_top_mode_raddr_r  =  cu_depth_0_2_r==2'd3 ? 6'd6  :6'd4                                ;
		7'd11:  cu_luma_top_mode_raddr_r  =  cu_depth_0_4_r==2'd3 ? 6'd18 :6'd16                               ;
		7'd12:  cu_luma_top_mode_raddr_r  =  cu_depth_0_6_r==2'd3 ? 6'd22 :6'd20                               ;
		7'd13:  cu_luma_top_mode_raddr_r  =  cu_depth_2_0_r==2'd3 ? 6'd10 :(cu_depth_2_0_r==2'd2 ? 6'd8 :6'd0 );
		7'd14:  cu_luma_top_mode_raddr_r  =  cu_depth_2_2_r==2'd3 ? 6'd14 :(cu_depth_2_2_r==2'd2 ? 6'd12:6'd0 );
		7'd15:  cu_luma_top_mode_raddr_r  =  cu_depth_4_0_r==2'd3 ? 6'd34 :6'd32                               ;
		7'd16:  cu_luma_top_mode_raddr_r  =  cu_depth_4_2_r==2'd3 ? 6'd38 :6'd36                               ;
		7'd17:  cu_luma_top_mode_raddr_r  =  cu_depth_2_4_r==2'd3 ? 6'd26 :(cu_depth_2_4_r==2'd2 ? 6'd24:6'd16);
		7'd18:  cu_luma_top_mode_raddr_r  =  cu_depth_2_6_r==2'd3 ? 6'd30 :(cu_depth_2_6_r==2'd2 ? 6'd28:6'd16);
		7'd19:  cu_luma_top_mode_raddr_r  =  cu_depth_4_4_r==2'd3 ? 6'd50 :6'd48                               ;
		7'd20:  cu_luma_top_mode_raddr_r  =  cu_depth_4_6_r==2'd3 ? 6'd54 :6'd52                               ;
		7'd23:  cu_luma_top_mode_raddr_r  =  6'd0                                                              ;
		7'd24:  cu_luma_top_mode_raddr_r  =  6'd1                                                              ;
		7'd27:  cu_luma_top_mode_raddr_r  =  6'd4                                                              ;
		7'd28:  cu_luma_top_mode_raddr_r  =  6'd5                                                              ;
		7'd29:  cu_luma_top_mode_raddr_r  =  cu_depth_0_0_r==2'd3 ? 6'd2  :6'd0                                ;
		7'd30:  cu_luma_top_mode_raddr_r  =  cu_depth_0_0_r==2'd3 ? 6'd3  :6'd0                                ;
		7'd31:  cu_luma_top_mode_raddr_r  =  6'd8                                                              ;
		7'd32:  cu_luma_top_mode_raddr_r  =  6'd9                                                              ;
		7'd33:  cu_luma_top_mode_raddr_r  =  cu_depth_0_2_r==2'd3 ? 6'd6  :6'd4                                ;
		7'd34:  cu_luma_top_mode_raddr_r  =  cu_depth_0_2_r==2'd3 ? 6'd7  :6'd4                                ;
		7'd35:  cu_luma_top_mode_raddr_r  =  6'd12                                                             ;
		7'd36:  cu_luma_top_mode_raddr_r  =  6'd13                                                             ;
		7'd39:  cu_luma_top_mode_raddr_r  =  6'd16                                                             ;
		7'd40:  cu_luma_top_mode_raddr_r  =  6'd17                                                             ;
		7'd43:  cu_luma_top_mode_raddr_r  =  6'd20                                                             ;
		7'd44:  cu_luma_top_mode_raddr_r  =  6'd21                                                             ;
		7'd45:  cu_luma_top_mode_raddr_r  =  cu_depth_0_4_r==2'd3 ? 6'd18 :6'd16                               ;
		7'd46:  cu_luma_top_mode_raddr_r  =  cu_depth_0_4_r==2'd3 ? 6'd19 :6'd16                               ;
		7'd47:  cu_luma_top_mode_raddr_r  =  6'd24                                                             ;
		7'd48:  cu_luma_top_mode_raddr_r  =  6'd25                                                             ;
		7'd49:  cu_luma_top_mode_raddr_r  =  cu_depth_0_6_r==2'd3 ? 6'd22 :6'd20                               ;
		7'd50:  cu_luma_top_mode_raddr_r  =  cu_depth_0_6_r==2'd3 ? 6'd23 :6'd20                               ;
		7'd51:  cu_luma_top_mode_raddr_r  =  6'd28                                                             ;
		7'd52:  cu_luma_top_mode_raddr_r  =  6'd29                                                             ;
		7'd53:  cu_luma_top_mode_raddr_r  =  cu_depth_2_0_r==2'd3 ? 6'd10 :(cu_depth_2_0_r==2'd2 ? 6'd8 :6'd0 );
		7'd54:  cu_luma_top_mode_raddr_r  =  cu_depth_2_0_r==2'd3 ? 6'd11 :(cu_depth_2_0_r==2'd2 ? 6'd8 :6'd0 );
		7'd55:  cu_luma_top_mode_raddr_r  =  6'd32                                                             ;
		7'd56:  cu_luma_top_mode_raddr_r  =  6'd33                                                             ;
		7'd57:  cu_luma_top_mode_raddr_r  =  cu_depth_2_2_r==2'd3 ? 6'd14 :(cu_depth_2_2_r==2'd2 ? 6'd12:6'd0 );
		7'd58:  cu_luma_top_mode_raddr_r  =  cu_depth_2_2_r==2'd3 ? 6'd15 :(cu_depth_2_2_r==2'd2 ? 6'd12:6'd0 );
		7'd59:  cu_luma_top_mode_raddr_r  =  6'd36                                                             ;
		7'd60:  cu_luma_top_mode_raddr_r  =  6'd37                                                             ;
		7'd61:  cu_luma_top_mode_raddr_r  =  cu_depth_4_0_r==2'd3 ? 6'd34 :6'd32                               ;
		7'd62:  cu_luma_top_mode_raddr_r  =  cu_depth_4_0_r==2'd3 ? 6'd35 :6'd32                               ;
		7'd63:  cu_luma_top_mode_raddr_r  =  6'd40                                                             ;
		7'd64:  cu_luma_top_mode_raddr_r  =  6'd41                                                             ;
		7'd65:  cu_luma_top_mode_raddr_r  =  cu_depth_4_2_r==2'd3 ? 6'd38 :6'd36                               ;
		7'd66:  cu_luma_top_mode_raddr_r  =  cu_depth_4_2_r==2'd3 ? 6'd39 :6'd36                               ;
		7'd67:  cu_luma_top_mode_raddr_r  =  6'd44                                                             ;
		7'd68:  cu_luma_top_mode_raddr_r  =  6'd45                                                             ;
		7'd69:  cu_luma_top_mode_raddr_r  =  cu_depth_2_4_r==2'd3 ? 6'd26 :(cu_depth_2_4_r==2'd2 ? 6'd24:6'd16);
		7'd70:  cu_luma_top_mode_raddr_r  =  cu_depth_2_4_r==2'd3 ? 6'd27 :(cu_depth_2_4_r==2'd2 ? 6'd24:6'd16);
		7'd71:  cu_luma_top_mode_raddr_r  =  6'd48                                                             ;
		7'd72:  cu_luma_top_mode_raddr_r  =  6'd49                                                             ;
		7'd73:  cu_luma_top_mode_raddr_r  =  cu_depth_2_6_r==2'd3 ? 6'd30 :(cu_depth_2_6_r==2'd2 ? 6'd28:6'd16);
		7'd74:  cu_luma_top_mode_raddr_r  =  cu_depth_2_6_r==2'd3 ? 6'd31 :(cu_depth_2_6_r==2'd2 ? 6'd28:6'd16);
		7'd75:  cu_luma_top_mode_raddr_r  =  6'd52                                                             ;
		7'd76:  cu_luma_top_mode_raddr_r  =  6'd53                                                             ;
		7'd77:  cu_luma_top_mode_raddr_r  =  cu_depth_4_4_r==2'd3 ? 6'd50 :6'd48                               ;
		7'd78:  cu_luma_top_mode_raddr_r  =  cu_depth_4_4_r==2'd3 ? 6'd51 :6'd48                               ;
		7'd79:  cu_luma_top_mode_raddr_r  =  6'd56                                                             ;
		7'd80:  cu_luma_top_mode_raddr_r  =  6'd57                                                             ;
		7'd81:  cu_luma_top_mode_raddr_r  =  cu_depth_4_6_r==2'd3 ? 6'd54 :6'd52                               ;
		7'd82:  cu_luma_top_mode_raddr_r  =  cu_depth_4_6_r==2'd3 ? 6'd55 :6'd52                               ;
		7'd83:  cu_luma_top_mode_raddr_r  =  6'd60                                                             ;
		7'd84:  cu_luma_top_mode_raddr_r  =  6'd61                                                             ;
	  default:  cu_luma_top_mode_raddr_r  =  6'd0                                                              ;
    endcase 
end 

// cu_luma_left_mode_raddr_r
always @* begin 
    case(cu_idx_r) 
		7'd2 :  cu_luma_left_mode_raddr_r = cu_depth_0_2_r==2'd3 ? 6'd5 :(cu_depth_0_2_r==2'd2 ? 6'd4 :6'd0 );
		7'd4 :  cu_luma_left_mode_raddr_r = cu_depth_4_2_r==2'd3 ? 6'd37:(cu_depth_4_2_r==2'd2 ? 6'd36:6'd32);
		7'd6 :  cu_luma_left_mode_raddr_r = cu_depth_0_0_r==2'd3 ? 6'd1 :6'd0                                ;
		7'd8 :  cu_luma_left_mode_raddr_r = cu_depth_2_0_r==2'd3 ? 6'd9 :6'd8                                ;
		7'd9 :  cu_luma_left_mode_raddr_r = cu_depth_0_2_r==2'd3 ? 6'd5 :(cu_depth_0_2_r==2'd2 ? 6'd4 :6'd0 );
		7'd10:  cu_luma_left_mode_raddr_r = cu_depth_0_4_r==2'd3 ? 6'd17:6'd16                               ;
		7'd11:  cu_luma_left_mode_raddr_r = cu_depth_2_2_r==2'd3 ? 6'd13:(cu_depth_2_2_r==2'd2 ? 6'd12:6'd0 );
		7'd12:  cu_luma_left_mode_raddr_r = cu_depth_2_4_r==2'd3 ? 6'd25:6'd24                               ;
		7'd14:  cu_luma_left_mode_raddr_r = cu_depth_4_0_r==2'd3 ? 6'd33:6'd32                               ;
		7'd16:  cu_luma_left_mode_raddr_r = cu_depth_6_0_r==2'd3 ? 6'd41:6'd40                               ;
		7'd17:  cu_luma_left_mode_raddr_r = cu_depth_4_2_r==2'd3 ? 6'd37:(cu_depth_4_2_r==2'd2 ? 6'd36:6'd32);
		7'd18:  cu_luma_left_mode_raddr_r = cu_depth_4_4_r==2'd3 ? 6'd49:6'd48                               ;
		7'd19:  cu_luma_left_mode_raddr_r = cu_depth_6_2_r==2'd3 ? 6'd45:(cu_depth_6_2_r==2'd2 ? 6'd44:6'd32);
		7'd20:  cu_luma_left_mode_raddr_r = cu_depth_6_4_r==2'd3 ? 6'd57:6'd56                               ;
		7'd22:  cu_luma_left_mode_raddr_r = 6'd0                                                             ;
		7'd24:  cu_luma_left_mode_raddr_r = 6'd2                                                             ;
		7'd25:  cu_luma_left_mode_raddr_r = cu_depth_0_0_r==2'd3 ? 6'd1 :6'd0                                ;
		7'd26:  cu_luma_left_mode_raddr_r = 6'd4                                                             ;
		7'd27:  cu_luma_left_mode_raddr_r = cu_depth_0_0_r==2'd3 ? 6'd3 :6'd0                                ;
		7'd28:  cu_luma_left_mode_raddr_r = 6'd6                                                             ;
		7'd30:  cu_luma_left_mode_raddr_r = 6'd8                                                             ;
		7'd32:  cu_luma_left_mode_raddr_r = 6'd10                                                            ;
		7'd33:  cu_luma_left_mode_raddr_r = cu_depth_2_0_r==2'd3 ? 6'd9 :6'd8                                ;
		7'd34:  cu_luma_left_mode_raddr_r = 6'd12                                                            ;
		7'd35:  cu_luma_left_mode_raddr_r = cu_depth_2_0_r==2'd3 ? 6'd11:6'd8                                ;
		7'd36:  cu_luma_left_mode_raddr_r = 6'd14                                                            ;
		7'd37:  cu_luma_left_mode_raddr_r = cu_depth_0_2_r==2'd3 ? 6'd5 :(cu_depth_0_2_r==2'd2 ? 6'd4 :6'd0 );
		7'd38:  cu_luma_left_mode_raddr_r = 6'd16                                                            ;
		7'd39:  cu_luma_left_mode_raddr_r = cu_depth_0_2_r==2'd3 ? 6'd7 :(cu_depth_0_2_r==2'd2 ? 6'd4 :6'd0 );
		7'd40:  cu_luma_left_mode_raddr_r = 6'd18                                                            ;
		7'd41:  cu_luma_left_mode_raddr_r = cu_depth_0_4_r==2'd3 ? 6'd17:6'd16                               ;
		7'd42:  cu_luma_left_mode_raddr_r = 6'd20                                                            ;
		7'd43:  cu_luma_left_mode_raddr_r = cu_depth_0_4_r==2'd3 ? 6'd19:6'd16                               ;
		7'd44:  cu_luma_left_mode_raddr_r = 6'd22                                                            ;
		7'd45:  cu_luma_left_mode_raddr_r = cu_depth_2_2_r==2'd3 ? 6'd13:(cu_depth_2_2_r==2'd2 ? 6'd12:6'd0 );
		7'd46:  cu_luma_left_mode_raddr_r = 6'd24                                                            ;
		7'd47:  cu_luma_left_mode_raddr_r = cu_depth_2_2_r==2'd3 ? 6'd15:(cu_depth_2_2_r==2'd2 ? 6'd12:6'd0 );
		7'd48:  cu_luma_left_mode_raddr_r = 6'd26                                                            ;
		7'd49:  cu_luma_left_mode_raddr_r = cu_depth_2_4_r==2'd3 ? 6'd25:6'd24                               ;
		7'd50:  cu_luma_left_mode_raddr_r = 6'd28                                                            ;
		7'd51:  cu_luma_left_mode_raddr_r = cu_depth_2_4_r==2'd3 ? 6'd27:6'd24                               ;
		7'd52:  cu_luma_left_mode_raddr_r = 6'd30                                                            ;
		7'd54:  cu_luma_left_mode_raddr_r = 6'd32                                                            ;
		7'd56:  cu_luma_left_mode_raddr_r = 6'd34                                                            ;
		7'd57:  cu_luma_left_mode_raddr_r = cu_depth_4_0_r==2'd3 ? 6'd33:6'd32                               ;
		7'd58:  cu_luma_left_mode_raddr_r = 6'd36                                                            ;
		7'd59:  cu_luma_left_mode_raddr_r = cu_depth_4_0_r==2'd3 ? 6'd35:6'd32                               ;
		7'd60:  cu_luma_left_mode_raddr_r = 6'd38                                                            ;
		7'd62:  cu_luma_left_mode_raddr_r = 6'd40                                                            ;
		7'd64:  cu_luma_left_mode_raddr_r = 6'd42                                                            ;
		7'd65:  cu_luma_left_mode_raddr_r = cu_depth_6_0_r==2'd3 ? 6'd41:6'd40                               ;
		7'd66:  cu_luma_left_mode_raddr_r = 6'd44                                                            ;
		7'd67:  cu_luma_left_mode_raddr_r = cu_depth_6_0_r==2'd3 ? 6'd43:6'd40                               ;
		7'd68:  cu_luma_left_mode_raddr_r = 6'd46                                                            ;
		7'd69:  cu_luma_left_mode_raddr_r = cu_depth_4_2_r==2'd3 ? 6'd37:(cu_depth_4_2_r==2'd2 ? 6'd36:6'd32);
		7'd70:  cu_luma_left_mode_raddr_r = 6'd48                                                            ;
		7'd71:  cu_luma_left_mode_raddr_r = cu_depth_4_2_r==2'd3 ? 6'd39:(cu_depth_4_2_r==2'd2 ? 6'd36:6'd32);
		7'd72:  cu_luma_left_mode_raddr_r = 6'd50                                                            ;
		7'd73:  cu_luma_left_mode_raddr_r = cu_depth_4_4_r==2'd3 ? 6'd49:6'd48                               ;
		7'd74:  cu_luma_left_mode_raddr_r = 6'd52                                                            ;
		7'd75:  cu_luma_left_mode_raddr_r = cu_depth_4_4_r==2'd3 ? 6'd51:6'd48                               ;
		7'd76:  cu_luma_left_mode_raddr_r = 6'd54                                                            ;
		7'd77:  cu_luma_left_mode_raddr_r = cu_depth_6_2_r==2'd3 ? 6'd45:(cu_depth_6_2_r==2'd2 ? 6'd44:6'd32);
		7'd78:  cu_luma_left_mode_raddr_r = 6'd56                                                            ;
		7'd79:  cu_luma_left_mode_raddr_r = cu_depth_6_2_r==2'd3 ? 6'd47:(cu_depth_6_2_r==2'd2 ? 6'd44:6'd32);
		7'd80:  cu_luma_left_mode_raddr_r = 6'd58                                                            ;
		7'd81:  cu_luma_left_mode_raddr_r = cu_depth_6_4_r==2'd3 ? 6'd57:6'd56                               ;
		7'd82:  cu_luma_left_mode_raddr_r = 6'd60                                                            ;
		7'd83:  cu_luma_left_mode_raddr_r = cu_depth_6_4_r==2'd3 ? 6'd59:6'd56                               ;
		7'd84:  cu_luma_left_mode_raddr_r = 6'd62                                                            ;
	  default:  cu_luma_left_mode_raddr_r = 6'd0                                                             ;
    endcase 
end 

// cu_chroma_mode_ren_o 
always @* begin 
    if(cu_start_r)
        cu_chroma_mode_ren_o  =  1'b0       ;
    else 
	    cu_chroma_mode_ren_o  =  1'b1       ;
end 

// cu_chroma_mode_raddr_o 
always @* begin 
    case(cu_idx_r)
        7'd0 :   cu_chroma_mode_raddr_o =  4'd0  ;
	    7'd1 :   cu_chroma_mode_raddr_o =  4'd0  ;
	    7'd2 :   cu_chroma_mode_raddr_o =  4'd4  ;
	    7'd3 :   cu_chroma_mode_raddr_o =  4'd8  ;
	    7'd4 :   cu_chroma_mode_raddr_o =  4'd12 ;
	    7'd5 :   cu_chroma_mode_raddr_o =  4'd0  ;
	    7'd6 :   cu_chroma_mode_raddr_o =  4'd1  ;
	    7'd7 :   cu_chroma_mode_raddr_o =  4'd2  ;
	    7'd8 :   cu_chroma_mode_raddr_o =  4'd3  ;
	    7'd9 :   cu_chroma_mode_raddr_o =  4'd4  ;
	    7'd10:   cu_chroma_mode_raddr_o =  4'd5  ;
	    7'd11:   cu_chroma_mode_raddr_o =  4'd6  ;
	    7'd12:   cu_chroma_mode_raddr_o =  4'd7  ;
	    7'd13:   cu_chroma_mode_raddr_o =  4'd8  ;
	    7'd14:   cu_chroma_mode_raddr_o =  4'd9  ;
	    7'd15:   cu_chroma_mode_raddr_o =  4'd10 ;
	    7'd16:   cu_chroma_mode_raddr_o =  4'd11 ;
	    7'd17:   cu_chroma_mode_raddr_o =  4'd12 ;
	    7'd18:   cu_chroma_mode_raddr_o =  4'd13 ;
	    7'd19:   cu_chroma_mode_raddr_o =  4'd14 ;
	    7'd20:   cu_chroma_mode_raddr_o =  4'd15 ;
	    7'd21:   cu_chroma_mode_raddr_o =  4'd0  ;
	    7'd22:   cu_chroma_mode_raddr_o =  4'd0  ;
	    7'd23:   cu_chroma_mode_raddr_o =  4'd0  ;
	    7'd24:   cu_chroma_mode_raddr_o =  4'd0  ;
	    7'd25:   cu_chroma_mode_raddr_o =  4'd1  ;
	    7'd26:   cu_chroma_mode_raddr_o =  4'd1  ;
	    7'd27:   cu_chroma_mode_raddr_o =  4'd1  ;
	    7'd28:   cu_chroma_mode_raddr_o =  4'd1  ;
	    7'd29:   cu_chroma_mode_raddr_o =  4'd2  ;
	    7'd30:   cu_chroma_mode_raddr_o =  4'd2  ;
	    7'd31:   cu_chroma_mode_raddr_o =  4'd2  ;
	    7'd32:   cu_chroma_mode_raddr_o =  4'd2  ;
	    7'd33:   cu_chroma_mode_raddr_o =  4'd3  ;
	    7'd34:   cu_chroma_mode_raddr_o =  4'd3  ;
	    7'd35:   cu_chroma_mode_raddr_o =  4'd3  ;
	    7'd36:   cu_chroma_mode_raddr_o =  4'd3  ;
	    7'd37:   cu_chroma_mode_raddr_o =  4'd4  ;
	    7'd38:   cu_chroma_mode_raddr_o =  4'd4  ;
	    7'd39:   cu_chroma_mode_raddr_o =  4'd4  ;
	    7'd40:   cu_chroma_mode_raddr_o =  4'd4  ;
	    7'd41:   cu_chroma_mode_raddr_o =  4'd5  ;
	    7'd42:   cu_chroma_mode_raddr_o =  4'd5  ;
	    7'd43:   cu_chroma_mode_raddr_o =  4'd5  ;
	    7'd44:   cu_chroma_mode_raddr_o =  4'd5  ;
	    7'd45:   cu_chroma_mode_raddr_o =  4'd6  ;
	    7'd46:   cu_chroma_mode_raddr_o =  4'd6  ;
	    7'd47:   cu_chroma_mode_raddr_o =  4'd6  ;
	    7'd48:   cu_chroma_mode_raddr_o =  4'd6  ;
	    7'd49:   cu_chroma_mode_raddr_o =  4'd7  ;
	    7'd50:   cu_chroma_mode_raddr_o =  4'd7  ;
	    7'd51:   cu_chroma_mode_raddr_o =  4'd7  ;
	    7'd52:   cu_chroma_mode_raddr_o =  4'd7  ;
	    7'd53:   cu_chroma_mode_raddr_o =  4'd8  ;
	    7'd54:   cu_chroma_mode_raddr_o =  4'd8  ;
	    7'd55:   cu_chroma_mode_raddr_o =  4'd8  ;
	    7'd56:   cu_chroma_mode_raddr_o =  4'd8  ;
	    7'd57:   cu_chroma_mode_raddr_o =  4'd9  ;
	    7'd58:   cu_chroma_mode_raddr_o =  4'd9  ;
	    7'd59:   cu_chroma_mode_raddr_o =  4'd9  ;
	    7'd60:   cu_chroma_mode_raddr_o =  4'd9  ;
	    7'd61:   cu_chroma_mode_raddr_o =  4'd10 ;
	    7'd62:   cu_chroma_mode_raddr_o =  4'd10 ;
	    7'd63:   cu_chroma_mode_raddr_o =  4'd10 ;
	    7'd64:   cu_chroma_mode_raddr_o =  4'd10 ;
	    7'd65:   cu_chroma_mode_raddr_o =  4'd11 ;
	    7'd66:   cu_chroma_mode_raddr_o =  4'd11 ;
	    7'd67:   cu_chroma_mode_raddr_o =  4'd11 ;
	    7'd68:   cu_chroma_mode_raddr_o =  4'd11 ;
	    7'd69:   cu_chroma_mode_raddr_o =  4'd12 ;
	    7'd70:   cu_chroma_mode_raddr_o =  4'd12 ;
	    7'd71:   cu_chroma_mode_raddr_o =  4'd12 ;
	    7'd72:   cu_chroma_mode_raddr_o =  4'd12 ;
	    7'd73:   cu_chroma_mode_raddr_o =  4'd13 ;
	    7'd74:   cu_chroma_mode_raddr_o =  4'd13 ;
	    7'd75:   cu_chroma_mode_raddr_o =  4'd13 ;
	    7'd76:   cu_chroma_mode_raddr_o =  4'd13 ;
	    7'd77:   cu_chroma_mode_raddr_o =  4'd14 ;
	    7'd78:   cu_chroma_mode_raddr_o =  4'd14 ;
	    7'd79:   cu_chroma_mode_raddr_o =  4'd14 ;
	    7'd80:   cu_chroma_mode_raddr_o =  4'd14 ;
	    7'd81:   cu_chroma_mode_raddr_o =  4'd15 ;
	    7'd82:   cu_chroma_mode_raddr_o =  4'd15 ;
	    7'd83:   cu_chroma_mode_raddr_o =  4'd15 ;
	    7'd84:   cu_chroma_mode_raddr_o =  4'd15 ;
	  default:   cu_chroma_mode_raddr_o =  4'd0  ;
    endcase 
end 

//cu_luma_pred_mode_r  
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_pred_mode_r  <=   6'd0             ;
	else if(cu_start_d2_r)
        cu_luma_pred_mode_r  <=   luma_mode_i      ;
end 

//cu_luma_pred_top_mode_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_pred_top_mode_r    <=    6'd1           ;
	else if(cu_start_d3_r)begin 
        case(cu_idx_r)
            7'd0 , 7'd1 , 7'd2 , 7'd5 ,
            7'd6 , 7'd9 , 7'd10, 7'd21,
            7'd22, 7'd25, 7'd26, 7'd37, 
            7'd38, 7'd41, 7'd42       :		
                                        cu_luma_pred_top_mode_r <=   24'h041041  ;
	        default                   : cu_luma_pred_top_mode_r <=   luma_mode_i ;
	    endcase
    end 
end 

// cu_luma_pred_left_mode_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_luma_pred_left_mode_r  <=   6'd0           ;
	else if(cu_start_d1_r) begin 
        case(cu_idx_r)       
            7'd0  : cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_0_r ,6'd1,cu_luma_mode_left_8_r };
			7'd1  : cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_0_r ,6'd1,cu_luma_mode_left_4_r };
			7'd3  : cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_8_r ,6'd1,cu_luma_mode_left_12_r};
			7'd5  : cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_0_r ,6'd1,cu_luma_mode_left_2_r };
            7'd7  : cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_4_r ,6'd1,cu_luma_mode_left_6_r };
			7'd13 : cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_8_r ,6'd1,cu_luma_mode_left_10_r};
			7'd15 : cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_12_r,6'd1,cu_luma_mode_left_14_r};
			7'd21 : cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_0_r ,6'd1,cu_luma_mode_left_1_r };
	        7'd23 : cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_2_r ,6'd1,cu_luma_mode_left_3_r };
			7'd29 : cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_4_r ,6'd1,cu_luma_mode_left_5_r };
			7'd31 : cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_6_r ,6'd1,cu_luma_mode_left_7_r };
			7'd53 :	cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_8_r ,6'd1,cu_luma_mode_left_9_r };
	        7'd55 : cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_10_r,6'd1,cu_luma_mode_left_11_r};
			7'd61 : cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_12_r,6'd1,cu_luma_mode_left_13_r};
			7'd63 :	cu_luma_pred_left_mode_r  <= { 6'd1,cu_luma_mode_left_14_r,6'd1,cu_luma_mode_left_15_r};
		   default: cu_luma_pred_left_mode_r  <=  luma_mode_i                                              ;                        
        endcase                                                                          
    end                                                                                  
end 

// cu_chroma_pred_mode_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        cu_chroma_pred_mode_r  <=   6'd0             ;
	else if(cu_start_d1_r) begin 
	    if(cu_idx_r<7'd21)	
	        cu_chroma_pred_mode_r  <=  chroma_mode_i[23:18]            ;
	    else begin 
	        case(cu_idx_minus21_w[1:0])
                2'd0:cu_chroma_pred_mode_r  <=   chroma_mode_i[23:18]  ;
                2'd1:cu_chroma_pred_mode_r  <=   chroma_mode_i[17:12]  ;
                2'd2:cu_chroma_pred_mode_r  <=   chroma_mode_i[11:6 ]  ;
                2'd3:cu_chroma_pred_mode_r  <=   chroma_mode_i[ 5:0 ]  ;
            endcase
		end 
	end 
end 

// -----------------------------------------------------------------------------------------------------------------------------
//
//		                  binarization an cu 
//
// -----------------------------------------------------------------------------------------------------------------------------

assign        cu_start_w               =    cu_start_d3_r                ;
assign        cu_idx_w                 =    cu_idx_r                     ;
assign        cu_depth_w               =    cu_depth_r                   ;
assign        cu_sub_div_w             =    cu_sub_div_r                 ;
assign        cu_slice_type_w          =    slice_type_i                 ; 
assign        cu_inter_part_mode_w     =    cu_inter_part_size_r         ;    
assign        cu_merge_flag_w          =    cu_merge_flag_r              ;     
assign        cu_merge_idx_w           =    cu_merge_idx_r               ;
assign        cu_luma_pred_mode_w      =    cu_luma_pred_mode_r          ;
assign        cu_chroma_pred_mode_w    =    cu_chroma_pred_mode_r        ;   
assign        cu_cbf_y_w               =    cu_cbf_y_r                   ;
assign        cu_cbf_u_w               =    cu_cbf_u_r                   ;
assign        cu_cbf_v_w               =    cu_cbf_v_r                   ; 
assign        cu_qp_curr_w             =    lcu_qp_i                     ; 
assign        last_cu_flag_w           =    last_cu_flag_r               ;
assign        cu_depth_left_w          =    cu_depth_left_r              ;
assign        cu_depth_top_w           =    cu_depth_top_r               ;
assign        cu_skip_top_flag_w       =    cu_skip_top_flag_r           ;
assign        cu_skip_left_flag_w      =    cu_skip_left_flag_r          ;
assign        cu_luma_pred_top_mode_w  =    cu_luma_pred_top_mode_r      ;
assign        cu_luma_pred_left_mode_w =    cu_luma_pred_left_mode_r     ;

assign        cu_qp_last_w             =    cu_qp_last_r                 ;
assign        cu_qp_nocoded_w          =    cu_qp_nocoded_r              ;

assign        tq_rdata_w               =    coeff_data_i                 ;
/*
always @* begin 
    case(cu_inter_part_size_r)
        `PART_2NX2N : mb_mvd_rdata_r = {cu_mvd_data_r,cu_mvd_idx_r[8:6],cu_mvd_idx_r[8:6]};
		`PART_2NXN  : mb_mvd_rdata_r = {cu_mvd_data_r,cu_mvd_idx_r[8:6],cu_mvd_idx_r[5:3]};
		`PART_NX2N  : mb_mvd_rdata_r = {cu_mvd_data_r,cu_mvd_idx_r[8:6],cu_mvd_idx_r[2:0]};
        `PART_SPLIT : mb_mvd_rdata_r = 50'd0                                              ;
	endcase
end 
*/

always @* begin 
    case(cu_inter_part_size_r)
        `PART_2NX2N : mb_mvd_rdata_r = {cu_mvd_data_r[44:23],cu_mvd_data_r[21:0],2'b0,cu_mvd_data_r[45],2'b0,cu_mvd_data_r[22]};
		`PART_2NXN  : mb_mvd_rdata_r = {cu_mvd_data_r[44:23],cu_mvd_data_r[21:0],2'b0,cu_mvd_data_r[45],2'b0,cu_mvd_data_r[22]};
		`PART_NX2N  : mb_mvd_rdata_r = {cu_mvd_data_r[44:23],cu_mvd_data_r[21:0],2'b0,cu_mvd_data_r[45],2'b0,cu_mvd_data_r[22]};
        `PART_SPLIT : mb_mvd_rdata_r = 50'd0;
	endcase
end 



cabac_binari_cu  cabac_binari_cu_u0(
                                // input 
                                    .clk                       ( clk                         ),
                                    .rst_n                     ( rst_n                       ),
                                    .cu_start_i                ( cu_start_w                  ),
									.cu_idx_i                  ( cu_idx_w                    ),
									.cu_depth_i                ( cu_depth_w                  ),
									.cu_split_transform_i      ( cu_sub_div_w                ),
									.cu_slice_type_i           ( cu_slice_type_w             ),
									.cu_skip_flag_i            ( 1'b0                        ),//cu_skip_flag_w
									.cu_part_size_i            ( cu_inter_part_mode_w        ),
									.cu_merge_flag_i           ( cu_merge_flag_w             ),
									.cu_merge_idx_i            ( cu_merge_idx_w              ),
									.cu_luma_pred_mode_i       ( cu_luma_pred_mode_w         ),
									.cu_chroma_pred_mode_i     ( cu_chroma_pred_mode_w       ),
									.cu_cbf_y_i                ( cu_cbf_y_w                  ),
									.cu_cbf_u_i                ( cu_cbf_u_w                  ),
									.cu_cbf_v_i                ( cu_cbf_v_w                  ),
									.cu_qp_i                   ( cu_qp_curr_w                ),
									.last_cu_flag_i            ( last_cu_flag_w              ),
									.cu_skip_top_flag_i        ( cu_skip_top_flag_w          ),
									.cu_skip_left_flag_i       ( cu_skip_left_flag_w         ),													 
									.cu_luma_pred_top_mode_i   ( cu_luma_pred_top_mode_w     ),
									.cu_luma_pred_left_mode_i  ( cu_luma_pred_left_mode_w    ),
									.cu_qp_last_i              ( cu_qp_last_w                ),
                                    .tq_rdata_i		           ( tq_rdata_w		             ),
									.cu_mv_data_i	           ( mb_mvd_rdata_r 	         ),	
                                    .cu_qp_nocoded_i           ( cu_qp_nocoded_w             ),									
                                //  output                                                  
                                    .cu_done_o                 ( cu_done_w                   ),
									.coeff_type_o              ( coeff_type_w                ),
                                    .tq_ren_o		           ( tq_ren_w		             ),
                                    .tq_raddr_o		           ( tq_raddr_w		             ),
									.cu_qp_coded_flag_o        ( cu_qp_coded_flag_w          ),
									.cu_binary_pair_0_o		   ( cu_binary_pair_0_w		     ), 
									.cu_binary_pair_1_o		   ( cu_binary_pair_1_w		     ), 
									.cu_binary_pair_2_o		   ( cu_binary_pair_2_w		     ), 
									.cu_binary_pair_3_o		   ( cu_binary_pair_3_w		     ),
									.cu_binary_pair_valid_num_o(cu_binary_pair_valid_num_w   )
								);
								
// -----------------------------------------------------------------------------------------------------------------------------
//
//		                  binarization split_flag 
//
// -----------------------------------------------------------------------------------------------------------------------------	
reg                                      no_left_flag_r             ;
reg                                      no_top_flag_r              ;
reg    [1:0]                             ctx_idx_split_flag_r       ;
reg    [7:0]                             ctx_addr_split_flag_r      ;
wire   [10:0]                            ctx_pair_split_flag_w      ;

//no_left_flag_r
always @* begin
    if(mb_x_i=='d0) begin
		case(cu_idx_r)
			7'd0, 7'd1 , 7'd3 , 7'd5  , 
			7'd7, 7'd13, 7'd15, 7'd21 , 
			7'd23, 7'd29, 7'd31, 7'd53,
			7'd55, 7'd61, 7'd63       :		no_left_flag_r = 1'b1;
			default:		                no_left_flag_r = 1'b0;
		endcase
	end
	else 
	    no_left_flag_r    =   1'b0  ;
end

//no_top_flag_r
always @* begin
      if(mb_y_i=='d0) begin
		case(cu_idx_r)
			7'd0 , 7'd1 , 7'd2 , 7'd5 ,
			7'd6 , 7'd9 , 7'd10, 7'd21,
			7'd22, 7'd25, 7'd26, 7'd37, 
			7'd38, 7'd41, 7'd42:		no_top_flag_r  = 1'b1;
			default:		            no_top_flag_r  = 1'b0;
		endcase
	end
	else 
	    no_top_flag_r   =   1'b0 ;
end

// ctx_idx_split_flag_r
always @* begin
	if(no_left_flag_r && no_top_flag_r)
		ctx_idx_split_flag_r = 1'd0;
	else if(!no_left_flag_r && no_top_flag_r)
		ctx_idx_split_flag_r = cu_depth_left_r > cu_depth_r;
	else if(no_left_flag_r && ~no_top_flag_r)
		ctx_idx_split_flag_r = cu_depth_top_r  > cu_depth_r;
	else
		ctx_idx_split_flag_r = (cu_depth_left_r > cu_depth_r) + (cu_depth_top_r > cu_depth_r);	
end

always @* begin
	if(ctx_idx_split_flag_r=='d2)
		ctx_addr_split_flag_r = {3'd2, 5'd28};	//2
	else if(ctx_idx_split_flag_r=='d1)
		ctx_addr_split_flag_r = {3'd3, 5'd28};	//1
	else
		ctx_addr_split_flag_r = {3'd3, 5'd25};	//0	
end

assign	ctx_pair_split_flag_w = {2'b00, cu_split_flag_r, ctx_addr_split_flag_r};

// -----------------------------------------------------------------------------------------------------------------------------
//
//		                  binarization terminal after a lcu was done 
//
// -----------------------------------------------------------------------------------------------------------------------------

reg      [ 10:0 ]            ctx_pair_termianl_r                               ;

always @* begin 
    if( (mb_x_i==mb_x_total_i) && (mb_y_i==mb_y_total_i) )
        ctx_pair_termianl_r   =  {2'b11,1'b0,1'b1,2'd0,5'd0}                   ;
    else 
        ctx_pair_termianl_r   =  {2'b11,1'b0,1'b0,2'd0,5'd0}                   ;
end 

// -----------------------------------------------------------------------------------------------------------------------------
//
//		                 binarization sao 
//
// -----------------------------------------------------------------------------------------------------------------------------	
reg     [10:0]                      cu_binary_sao_mergeleft_r ;
reg     [10:0]                      cu_binary_sao_mergetop_r  ;

wire    [10:0]                      cu_binary_sao_0_w		  ;
wire    [10:0]                      cu_binary_sao_1_w		  ;
wire    [10:0]                      cu_binary_sao_2_w		  ;
wire    [10:0]                      cu_binary_sao_3_w		  ;
wire    [10:0]                      cu_binary_sao_4_w		  ;
wire    [10:0]                      cu_binary_sao_5_w		  ;
wire    [10:0]                      cu_binary_sao_6_w		  ;
wire    [10:0]                      cu_binary_sao_7_w		  ;

wire                                allow_merge_left_w        ;
wire                                allow_merge_top_w         ;

wire    [19:0]                      sao_luma_w                ;
wire    [19:0]                      sao_chromau_w             ;
wire    [19:0]                      sao_chromav_w             ;

reg                                 merge_left_r              ;
reg                                 merge_top_r               ;

wire                                sao_merge_w               ;

reg     [19:0]                      sao_data_r                ;    
reg     [ 1:0]                      sao_compidx_r             ;    

assign   allow_merge_left_w  = !(!mb_x_i)                     ;
assign   allow_merge_top_w   = !(!mb_y_i)                     ; 

always @* begin 
    if(allow_merge_left_w) begin 
        cu_binary_sao_mergeleft_r =  {2'b00,sao_i[60],3'd4,5'd19};
        merge_left_r              =  sao_i[60]                   ;
	end 
	else begin 
        cu_binary_sao_mergeleft_r =  {2'b01,1'b0,8'hff          };
        merge_left_r              =  1'b0                        ;
	end 
end 

always @*begin 
    if(merge_left_r==1'b0&&allow_merge_top_w) begin 
        cu_binary_sao_mergetop_r  =  {2'b00,sao_i[61],3'd4,5'd19};
        merge_top_r               =  sao_i[61]                   ;
    end 
	else begin  
        cu_binary_sao_mergetop_r  =  {2'b01,1'b0,8'hff          };
        merge_top_r               =  1'b0                        ;
	end 
end 

assign   sao_luma_w          = sao_i[19:0 ]                     ;
assign   sao_chromau_w       = sao_i[39:20]                     ;
assign   sao_chromav_w       = sao_i[59:40]                     ;

assign   sao_merge_w         = merge_left_r||merge_top_r        ;

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        sao_data_r     <=     20'd0                             ;
        sao_compidx_r  <=      2'd0                             ;
    end 
	else begin 
	    case(lcu_cyc_cnt_r)
            3'd0,3'd1:begin sao_data_r <=  sao_luma_w    ;sao_compidx_r <=  2'd0; end 
            3'd2,3'd3:begin sao_data_r <=  sao_chromau_w ;sao_compidx_r <=  2'd1; end 
		    3'd4,3'd5:begin sao_data_r <=  sao_chromav_w ;sao_compidx_r <=  2'd2; end 
			default  :begin sao_data_r <=  20'd0         ;sao_compidx_r <=  2'd0; end 
		endcase 
    end 
end 

cabac_binari_sao_offset  cabac_binari_sao_offset_u0(
                        .sao_data_i         (sao_data_r         ),
						.sao_compidx_i      (sao_compidx_r      ),
						.sao_merge_i        (sao_merge_w        ),
                        .cu_binary_sao_0_o  (cu_binary_sao_0_w  ),
                        .cu_binary_sao_1_o  (cu_binary_sao_1_w  ),
                        .cu_binary_sao_2_o  (cu_binary_sao_2_w  ),
                        .cu_binary_sao_3_o  (cu_binary_sao_3_w  ),
                        .cu_binary_sao_4_o  (cu_binary_sao_4_w  ),
                        .cu_binary_sao_5_o  (cu_binary_sao_5_w  ),
                        .cu_binary_sao_6_o  (cu_binary_sao_6_w  ),
                        .cu_binary_sao_7_o  (cu_binary_sao_7_w  )
                    );




// -----------------------------------------------------------------------------------------------------------------------------
//
//		                 output signals  
//
// -----------------------------------------------------------------------------------------------------------------------------	

assign        cu_mvd_ren_o             =    cu_mvd_ren_r            ;
assign        cu_mvd_raddr_o		   =    cu_mvd_raddr_r          ;
assign        cu_coeff_ren_o		   =    tq_ren_w                ;
assign        cu_coeff_raddr_o	       =    tq_raddr_w              ;
	
assign        cabac_mb_done_o	       =    lcu_done_r              ;
assign        cabac_slice_done_o       =    cabac_slice_done_r      ;	
assign        cabac_curr_state_o       =    lcu_curr_state_r        ;
assign        coeff_type_o             =    coeff_type_w            ;


// slice_init_flag_o
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		slice_init_flag_o <= 0;
	else if(table_build_end_i)
		slice_init_flag_o <= 0;
	else if(lcu_curr_state_r==LCU_INIT)
		slice_init_flag_o <= 1;
	else
		slice_init_flag_o <= 0;
end

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        binary_pair_0_o		   <= {2'b01,1'b0,8'hff}                           ; 
	    binary_pair_1_o		   <= {2'b01,1'b0,8'hff}                           ;
	    binary_pair_2_o		   <= {2'b01,1'b0,8'hff}                           ;
	    binary_pair_3_o		   <= {2'b01,1'b0,8'hff}                           ;
	    binary_pair_valid_num_o<= 3'd0                                         ;
    end 
	else begin 
	    case(lcu_curr_state_r)
            LCU_IDLE  :begin 
			    binary_pair_0_o		   <=  {2'b01,1'b0,8'hff}                  ;
			    binary_pair_1_o		   <=  {2'b01,1'b0,8'hff}                  ;
			    binary_pair_2_o		   <=  {2'b01,1'b0,8'hff}                  ;
			    binary_pair_3_o		   <=  {2'b01,1'b0,8'hff}                  ;
			    binary_pair_valid_num_o<=  3'd0                                ;
			end 
			LCU_SAO  :begin 
			    if(!lcu_cyc_cnt_r) begin 
			        binary_pair_0_o		   <=  cu_binary_sao_mergeleft_r       ;
			        binary_pair_1_o		   <=  cu_binary_sao_mergetop_r        ;
			        binary_pair_2_o		   <=  {2'b01,1'b0,8'hff}              ;
			        binary_pair_3_o		   <=  {2'b01,1'b0,8'hff}              ;
			        binary_pair_valid_num_o<=  3'd2                            ;
				end 
				else if(lcu_cyc_cnt_r[0]) begin 
				    binary_pair_0_o		   <=  cu_binary_sao_0_w               ;
				    binary_pair_1_o		   <=  cu_binary_sao_1_w               ;
				    binary_pair_2_o		   <=  cu_binary_sao_2_w               ;
				    binary_pair_3_o		   <=  cu_binary_sao_3_w               ;
				    binary_pair_valid_num_o<=  3'd4                            ;
				end 	
				else begin 
				    binary_pair_0_o		   <=  cu_binary_sao_4_w               ;
				    binary_pair_1_o		   <=  cu_binary_sao_5_w               ;
				    binary_pair_2_o		   <=  cu_binary_sao_6_w               ;
				    binary_pair_3_o		   <=  cu_binary_sao_7_w               ;
				    binary_pair_valid_num_o<=  3'd4                            ;
				end 
			end 
			
            CU_SPLIT  : begin 
			    binary_pair_0_o		   <=  ctx_pair_split_flag_w               ;
			    binary_pair_1_o		   <=  {2'b01,1'b0,8'hff}                  ;
			    binary_pair_2_o		   <=  {2'b01,1'b0,8'hff}                  ;
			    binary_pair_3_o		   <=  {2'b01,1'b0,8'hff}                  ;
			    binary_pair_valid_num_o<=  3'd1                                ;
			end 
            LCU_END	  : begin 
			    binary_pair_0_o		   <=  ctx_pair_termianl_r                 ;
			    binary_pair_1_o		   <=  {2'b01,1'b0,8'hff}                  ;
			    binary_pair_2_o		   <=  {2'b01,1'b0,8'hff}                  ;
			    binary_pair_3_o		   <=  {2'b01,1'b0,8'hff}                  ;
			    binary_pair_valid_num_o<=  lcu_cyc_cnt_r ? 3'd0 :3'd1          ;
			end 
			default   : begin 
                binary_pair_0_o		   <=  cu_binary_pair_0_w                  ;
			    binary_pair_1_o		   <=  cu_binary_pair_1_w                  ;
			    binary_pair_2_o		   <=  cu_binary_pair_2_w                  ;
			    binary_pair_3_o		   <=  cu_binary_pair_3_w                  ;
			    binary_pair_valid_num_o<=  cu_binary_pair_valid_num_w          ;
			end 
        endcase
    end 
end 


endmodule 



