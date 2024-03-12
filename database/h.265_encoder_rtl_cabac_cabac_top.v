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
// Filename       : cabac_top.v
// Author         : Yibo FAN
// Created        : 2013-12-28
// Description    : CABAC TOP
//               
//-------------------------------------------------------------------
`include "enc_defines.v"

module cabac_top(
				clk					   ,
				rst_n				   ,
				mb_type_i			   ,				
				mb_x_total_i		   ,
				mb_y_total_i		   ,
				mb_x_i				   ,
				mb_y_i				   ,
				qp_i				   ,
				param_qp_i             ,
				start_i				   ,
                
				sao_i                  ,
				luma_mode_i            ,	
				chroma_mode_i          ,				
				
				mb_p_pu_mode_i         , // inter_cu_part_size
				merge_flag_i           ,
				merge_idx_i            ,	
				
				mb_partition_i	       , // cu_split_flag
                cu_skip_flag_i         ,		
				
				tq_cbf_luma_i		   ,
				tq_cbf_cb_i			   ,
				tq_cbf_cr_i			   ,
				
				cu_luma_mode_ren_o     ,
				cu_luma_mode_raddr_o   ,
				cu_chroma_mode_ren_o   ,
				cu_chroma_mode_raddr_o ,
				
				mb_mvd_rdata_i	       ,	
//				mvd_idx_i              ,
				tq_rdata_i			   ,				

				mb_mvd_ren_o	       ,
				mb_mvd_raddr_o	       ,
				coeff_type_o           ,
				tq_ren_o			   ,
				tq_raddr_o			   ,
				
				bs_val_o			   ,
				bs_data_o			   ,
				bs_wait_i		       ,
				
				done_o				   ,
				slice_done_o		   			
);

// ********************************************
//                                             
//    Parameter DECLARATION                     
//                                             
// ********************************************


// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION               
//                                             
// ********************************************
input								clk				      ; // clock
input								rst_n			      ; // reset signal 
// CTRL IF      
input								mb_type_i		      ; // 1: I, 0: P/B                   	                  
input [`PIC_X_WIDTH-1:0] 			mb_x_total_i 	      ; // Total LCU number-1 in X
input [`PIC_Y_WIDTH-1:0]  			mb_y_total_i 	      ; // Total LCU number-1 in y
input [`PIC_X_WIDTH-1:0] 			mb_x_i 			      ; // Current LCU in X
input [`PIC_Y_WIDTH-1:0]  			mb_y_i 			      ; // Current LCU in y
input [5:0]							qp_i 			      ; // QP 
input [5:0]							param_qp_i    	      ; // QP 
input								start_i			      ; // cabac start signal
// sao IF 
input [61:0]						sao_i                 ; // {merge_top,merge_left,{sao_type,sao_subIdx,sao_offsetx4}{chroma,luma}}
// intra IF                                               
input [23:0]						luma_mode_i           ; // luma prediction direction mode info
input [23:0]                        chroma_mode_i         ; // 4x4 block luma mode 
// inter IF                                               
input [(`INTER_CU_INFO_LEN)-1:0]    mb_p_pu_mode_i        ; // Inter PU partition mode for every CU size                
input [84:0]                        merge_flag_i          ;
input [4*64-1:0]                    merge_idx_i           ;
// split and skip IF                                      
input [84:0]						mb_partition_i	      ; // CU partition mode
input [84:0]                        cu_skip_flag_i        ;   //cu skip  flag,[0]:64x64, [1:4]:32x32, [5:20]:16x16,[6:84]:8x8
// cbf                                                    
input  [`LCU_SIZE*`LCU_SIZE/16-1:0] tq_cbf_luma_i	      ; // coeff data tq 4x4 cbf ,256 bits
input  [`LCU_SIZE*`LCU_SIZE/16-1:0]	tq_cbf_cb_i		      ; // coeff data tq 4x4 cbf ,64  bits
input  [`LCU_SIZE*`LCU_SIZE/16-1:0]	tq_cbf_cr_i		      ; // coeff data tq 4x4 cbf ,64  bits
// Intra mode 
output                  	        cu_luma_mode_ren_o    ;
output [  5:0]	         			cu_luma_mode_raddr_o  ; 
output        			            cu_chroma_mode_ren_o  ;
output [  3:0]				        cu_chroma_mode_raddr_o;
// coeff and mvd 
input  [(2*`MVD_WIDTH)   :0]		mb_mvd_rdata_i	      ; // {mvd_idx,mvd rdata}
//input  [383:0]                      mvd_idx_i             ;
input  [`COEFF_WIDTH*16-1:0] 		tq_rdata_i		      ; // coeff data tq read data
// TQ IF                        	                  
output								mb_mvd_ren_o	      ; // Inter Mvd read enable
output [2*`CU_DEPTH-1:0]			mb_mvd_raddr_o	      ; // Inter Mvd read address , zig-zag scan 
output [1:0]                        coeff_type_o          ; 
output 								tq_ren_o		      ; // coeff data tq read enable
output [8:0]						tq_raddr_o		      ; // coeff data tq read address
// BS IF                                                  
input 								bs_wait_i		      ; // bs outside buffer full, req to stop outputing bs
output 								bs_val_o		      ; // bs output  valid
output [7:0] 						bs_data_o		      ; // bs output  byte

output 								done_o 			      ; // cabac done  signal
output		                        slice_done_o	      ; // slice done  signal

//-----------------------------------------------------------------------------------------------------------------------------
//                                             
//    Wire DECLARATION                         
//                                             
//-----------------------------------------------------------------------------------------------------------------------------	
//binarization
wire    		                   table_build_end_w	    ;	
wire				               slice_init_flag_w	    ;	

wire                  			   cu_luma_mode_ren_w      ;
wire    [5:0]	         		   cu_luma_mode_raddr_w    ; 
wire        			           cu_chroma_mode_ren_w    ;
wire    [3:0]				       cu_chroma_mode_raddr_w  ;

wire	[5:0]		               cu_mvd_raddr_w		    ;	
wire                               cu_mvd_ren_w             ;
wire	[8:0]		               cu_coeff_raddr_w	        ;	
wire				               cu_coeff_ren_w		    ;
wire				               cabac_mb_done_w		    ;
wire				               cabac_slice_done_w	    ;	
wire    [ 1:0]                     coeff_type_w             ;

wire	[10:0]		               ctx_pair_0_w			    ;	
wire	[10:0]		               ctx_pair_1_w			    ;	
wire	[10:0]		               ctx_pair_2_w			    ;	
wire	[10:0]		               ctx_pair_3_w			    ;		
wire	[ 2:0]		               valid_num_bin_pair_w	    ;
//piso
wire	[ 3:0]		              cabac_curr_state_w	    ;	
wire	[ 2:0]		              valid_num_bin_modeling_w  ;        
wire	[10:0]		              ctx_pair_modeling_0_w	    ;        
wire	[10:0]		              ctx_pair_modeling_1_w	    ;        
wire	[10:0]		              ctx_pair_modeling_2_w	    ;        
wire	[10:0]		              ctx_pair_modeling_3_w	    ;	
    
// context modeling
wire				              w_en_ctx_state_0_w	    ; // write enable context state 0 
wire    [5:0]		              w_addr_ctx_state_0_w      ; // write address context state 0
wire    [6:0]		              w_data_ctx_state_0_w      ; // write data context state 0   
wire   				              w_en_ctx_state_1_w	    ; // wirte enable context state 1 
wire    [5:0]		              w_addr_ctx_state_1_w      ; // write address context state 1
wire    [6:0]		              w_data_ctx_state_1_w      ; // wirte data context state 1   
wire   				              w_en_ctx_state_2_w	    ; // write enable context state 2 
wire    [5:0]		              w_addr_ctx_state_2_w      ; // write address context state 2
wire    [6:0]		              w_data_ctx_state_2_w      ; // write data context state 2   
wire   				              w_en_ctx_state_3_w	    ; // write enable context state 3 
wire    [5:0]		              w_addr_ctx_state_3_w      ; // write address context state 3
wire    [6:0]		              w_data_ctx_state_3_w      ; // write data context state 3   
wire   				              w_en_ctx_state_4_w	    ; // write enable context state 4 
wire    [5:0]		              w_addr_ctx_state_4_w      ; // write address context state 4
wire    [6:0]		              w_data_ctx_state_4_w      ; // write data context state 4       

wire    [9:0]		              modeling_ctx_pair_0_w	    ;       
wire    [9:0]		              modeling_ctx_pair_1_w	    ;       
wire    [9:0]		              modeling_ctx_pair_2_w	    ;       
wire    [9:0]		              modeling_ctx_pair_3_w	    ;       
wire    [2:0]		              valid_num_bae_w			;	// valid number of bae bin              

//bae                                                 
wire				              output_byte_en_w		    ;
wire	[7:0]		              output_byte_w			    ;		                          
wire				              no_bit_flag_w			    ;	     

reg					              first_mb_flag_r			;
  
reg		[5:0]		              slice_qp_r				;


reg                               start_d1_r                ;

    
//-----------------------------------------------------------------------------------------------------------------------------
//                                             
//    Logic DECLARATION                         
//                                             
//-----------------------------------------------------------------------------------------------------------------------------

assign 	done_o 		            = cabac_mb_done_w          ;
assign 	slice_done_o            = cabac_slice_done_w       ;
assign 	tq_ren_o 	            = cu_coeff_ren_w           ;
assign 	tq_raddr_o 	            = cu_coeff_raddr_w         ;
assign 	mb_mvd_ren_o            = cu_mvd_ren_w             ;
assign 	mb_mvd_raddr_o          = {cu_mvd_raddr_w[5],cu_mvd_raddr_w[3],cu_mvd_raddr_w[1] ,
                                   cu_mvd_raddr_w[4],cu_mvd_raddr_w[2],cu_mvd_raddr_w[0]};

assign 	bs_val_o                = output_byte_en_w         ;
assign 	bs_data_o               = output_byte_w            ;
assign  coeff_type_o            = coeff_type_w             ;
assign  cu_luma_mode_ren_o      = cu_luma_mode_ren_w       ; 
assign  cu_luma_mode_raddr_o    = cu_luma_mode_raddr_w     ;
assign  cu_chroma_mode_ren_o    = cu_chroma_mode_ren_w     ;
assign  cu_chroma_mode_raddr_o  = cu_chroma_mode_raddr_w   ;

//first_mb_flag_r, mb_x=0, mb_y=0
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		first_mb_flag_r <= 'd0;
	else if(mb_x_i=='d0 && mb_y_i=='d0) 
		first_mb_flag_r <= 'd1;
	else 
		first_mb_flag_r <= 'd0;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		slice_qp_r <= 'd0;
	else if(mb_x_i=='d0 && mb_y_i=='d0 && start_d1_r)
		slice_qp_r <= param_qp_i;
	else 
		slice_qp_r <= param_qp_i;
end


always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		start_d1_r <= 1'd0;
	else  
		start_d1_r <= start_i;
end



wire    [255:0  ]       cbf_y_w                                      ;
wire    [255:0  ]       cbf_u_w                                      ;
wire    [255:0  ]       cbf_v_w                                      ;

assign  cbf_y_w[255:248] =  {tq_cbf_luma_i[0  ],tq_cbf_luma_i[ 1 ],tq_cbf_luma_i[2	],tq_cbf_luma_i[3  ],tq_cbf_luma_i[4  ],tq_cbf_luma_i[5	 ],tq_cbf_luma_i[6	],tq_cbf_luma_i[7  ]};
assign  cbf_y_w[247:240] =  {tq_cbf_luma_i[8  ],tq_cbf_luma_i[ 9 ],tq_cbf_luma_i[10	],tq_cbf_luma_i[11 ],tq_cbf_luma_i[12 ],tq_cbf_luma_i[13 ],tq_cbf_luma_i[14	],tq_cbf_luma_i[15 ]};
assign  cbf_y_w[239:232] =  {tq_cbf_luma_i[16 ],tq_cbf_luma_i[17 ],tq_cbf_luma_i[18	],tq_cbf_luma_i[19 ],tq_cbf_luma_i[20 ],tq_cbf_luma_i[21 ],tq_cbf_luma_i[22	],tq_cbf_luma_i[23 ]};
assign  cbf_y_w[231:224] =  {tq_cbf_luma_i[24 ],tq_cbf_luma_i[25 ],tq_cbf_luma_i[26	],tq_cbf_luma_i[27 ],tq_cbf_luma_i[28 ],tq_cbf_luma_i[29 ],tq_cbf_luma_i[30	],tq_cbf_luma_i[31 ]};
assign  cbf_y_w[223:216] =  {tq_cbf_luma_i[32 ],tq_cbf_luma_i[33 ],tq_cbf_luma_i[34	],tq_cbf_luma_i[35 ],tq_cbf_luma_i[36 ],tq_cbf_luma_i[37 ],tq_cbf_luma_i[38	],tq_cbf_luma_i[39 ]};
assign  cbf_y_w[215:208] =  {tq_cbf_luma_i[40 ],tq_cbf_luma_i[41 ],tq_cbf_luma_i[42	],tq_cbf_luma_i[43 ],tq_cbf_luma_i[44 ],tq_cbf_luma_i[45 ],tq_cbf_luma_i[46	],tq_cbf_luma_i[47 ]};
assign  cbf_y_w[207:200] =  {tq_cbf_luma_i[48 ],tq_cbf_luma_i[49 ],tq_cbf_luma_i[50	],tq_cbf_luma_i[51 ],tq_cbf_luma_i[52 ],tq_cbf_luma_i[53 ],tq_cbf_luma_i[54	],tq_cbf_luma_i[55 ]};
assign  cbf_y_w[199:192] =  {tq_cbf_luma_i[56 ],tq_cbf_luma_i[57 ],tq_cbf_luma_i[58	],tq_cbf_luma_i[59 ],tq_cbf_luma_i[60 ],tq_cbf_luma_i[61 ],tq_cbf_luma_i[62	],tq_cbf_luma_i[63 ]};
assign  cbf_y_w[191:184] =  {tq_cbf_luma_i[64 ],tq_cbf_luma_i[65 ],tq_cbf_luma_i[66	],tq_cbf_luma_i[67 ],tq_cbf_luma_i[68 ],tq_cbf_luma_i[69 ],tq_cbf_luma_i[70	],tq_cbf_luma_i[71 ]};
assign  cbf_y_w[183:176] =  {tq_cbf_luma_i[72 ],tq_cbf_luma_i[73 ],tq_cbf_luma_i[74	],tq_cbf_luma_i[75 ],tq_cbf_luma_i[76 ],tq_cbf_luma_i[77 ],tq_cbf_luma_i[78	],tq_cbf_luma_i[79 ]};
assign  cbf_y_w[175:168] =  {tq_cbf_luma_i[80 ],tq_cbf_luma_i[81 ],tq_cbf_luma_i[82	],tq_cbf_luma_i[83 ],tq_cbf_luma_i[84 ],tq_cbf_luma_i[85 ],tq_cbf_luma_i[86	],tq_cbf_luma_i[87 ]};
assign  cbf_y_w[167:160] =  {tq_cbf_luma_i[88 ],tq_cbf_luma_i[89 ],tq_cbf_luma_i[90	],tq_cbf_luma_i[91 ],tq_cbf_luma_i[92 ],tq_cbf_luma_i[93 ],tq_cbf_luma_i[94	],tq_cbf_luma_i[95 ]};
assign  cbf_y_w[159:152] =  {tq_cbf_luma_i[96 ],tq_cbf_luma_i[97 ],tq_cbf_luma_i[98	],tq_cbf_luma_i[99 ],tq_cbf_luma_i[100],tq_cbf_luma_i[101],tq_cbf_luma_i[102],tq_cbf_luma_i[103]};
assign  cbf_y_w[151:144] =  {tq_cbf_luma_i[104],tq_cbf_luma_i[105],tq_cbf_luma_i[106],tq_cbf_luma_i[107],tq_cbf_luma_i[108],tq_cbf_luma_i[109],tq_cbf_luma_i[110],tq_cbf_luma_i[111]};
assign  cbf_y_w[143:136] =  {tq_cbf_luma_i[112],tq_cbf_luma_i[113],tq_cbf_luma_i[114],tq_cbf_luma_i[115],tq_cbf_luma_i[116],tq_cbf_luma_i[117],tq_cbf_luma_i[118],tq_cbf_luma_i[119]};
assign  cbf_y_w[135:128] =  {tq_cbf_luma_i[120],tq_cbf_luma_i[121],tq_cbf_luma_i[122],tq_cbf_luma_i[123],tq_cbf_luma_i[124],tq_cbf_luma_i[125],tq_cbf_luma_i[126],tq_cbf_luma_i[127]};
assign  cbf_y_w[127:120] =  {tq_cbf_luma_i[128],tq_cbf_luma_i[129],tq_cbf_luma_i[130],tq_cbf_luma_i[131],tq_cbf_luma_i[132],tq_cbf_luma_i[133],tq_cbf_luma_i[134],tq_cbf_luma_i[135]};
assign  cbf_y_w[119:112] =  {tq_cbf_luma_i[136],tq_cbf_luma_i[137],tq_cbf_luma_i[138],tq_cbf_luma_i[139],tq_cbf_luma_i[140],tq_cbf_luma_i[141],tq_cbf_luma_i[142],tq_cbf_luma_i[143]};
assign  cbf_y_w[111:104] =  {tq_cbf_luma_i[144],tq_cbf_luma_i[145],tq_cbf_luma_i[146],tq_cbf_luma_i[147],tq_cbf_luma_i[148],tq_cbf_luma_i[149],tq_cbf_luma_i[150],tq_cbf_luma_i[151]};
assign  cbf_y_w[103:96 ] =  {tq_cbf_luma_i[152],tq_cbf_luma_i[153],tq_cbf_luma_i[154],tq_cbf_luma_i[155],tq_cbf_luma_i[156],tq_cbf_luma_i[157],tq_cbf_luma_i[158],tq_cbf_luma_i[159]};
assign  cbf_y_w[ 95:88 ] =  {tq_cbf_luma_i[160],tq_cbf_luma_i[161],tq_cbf_luma_i[162],tq_cbf_luma_i[163],tq_cbf_luma_i[164],tq_cbf_luma_i[165],tq_cbf_luma_i[166],tq_cbf_luma_i[167]};
assign  cbf_y_w[ 87:80 ] =  {tq_cbf_luma_i[168],tq_cbf_luma_i[169],tq_cbf_luma_i[170],tq_cbf_luma_i[171],tq_cbf_luma_i[172],tq_cbf_luma_i[173],tq_cbf_luma_i[174],tq_cbf_luma_i[175]};
assign  cbf_y_w[ 79:72 ] =  {tq_cbf_luma_i[176],tq_cbf_luma_i[177],tq_cbf_luma_i[178],tq_cbf_luma_i[179],tq_cbf_luma_i[180],tq_cbf_luma_i[181],tq_cbf_luma_i[182],tq_cbf_luma_i[183]};
assign  cbf_y_w[ 71:64 ] =  {tq_cbf_luma_i[184],tq_cbf_luma_i[185],tq_cbf_luma_i[186],tq_cbf_luma_i[187],tq_cbf_luma_i[188],tq_cbf_luma_i[189],tq_cbf_luma_i[190],tq_cbf_luma_i[191]};
assign  cbf_y_w[ 63:56 ] =  {tq_cbf_luma_i[192],tq_cbf_luma_i[193],tq_cbf_luma_i[194],tq_cbf_luma_i[195],tq_cbf_luma_i[196],tq_cbf_luma_i[197],tq_cbf_luma_i[198],tq_cbf_luma_i[199]};
assign  cbf_y_w[ 55:48 ] =  {tq_cbf_luma_i[200],tq_cbf_luma_i[201],tq_cbf_luma_i[202],tq_cbf_luma_i[203],tq_cbf_luma_i[204],tq_cbf_luma_i[205],tq_cbf_luma_i[206],tq_cbf_luma_i[207]};
assign  cbf_y_w[ 47:40 ] =  {tq_cbf_luma_i[208],tq_cbf_luma_i[209],tq_cbf_luma_i[210],tq_cbf_luma_i[211],tq_cbf_luma_i[212],tq_cbf_luma_i[213],tq_cbf_luma_i[214],tq_cbf_luma_i[215]};
assign  cbf_y_w[ 39:32 ] =  {tq_cbf_luma_i[216],tq_cbf_luma_i[217],tq_cbf_luma_i[218],tq_cbf_luma_i[219],tq_cbf_luma_i[220],tq_cbf_luma_i[221],tq_cbf_luma_i[222],tq_cbf_luma_i[223]};
assign  cbf_y_w[ 31:24 ] =  {tq_cbf_luma_i[224],tq_cbf_luma_i[225],tq_cbf_luma_i[226],tq_cbf_luma_i[227],tq_cbf_luma_i[228],tq_cbf_luma_i[229],tq_cbf_luma_i[230],tq_cbf_luma_i[231]};
assign  cbf_y_w[ 23:16 ] =  {tq_cbf_luma_i[232],tq_cbf_luma_i[233],tq_cbf_luma_i[234],tq_cbf_luma_i[235],tq_cbf_luma_i[236],tq_cbf_luma_i[237],tq_cbf_luma_i[238],tq_cbf_luma_i[239]};
assign  cbf_y_w[ 15:8  ] =  {tq_cbf_luma_i[240],tq_cbf_luma_i[241],tq_cbf_luma_i[242],tq_cbf_luma_i[243],tq_cbf_luma_i[244],tq_cbf_luma_i[245],tq_cbf_luma_i[246],tq_cbf_luma_i[247]};
assign  cbf_y_w[  7:0  ] =  {tq_cbf_luma_i[248],tq_cbf_luma_i[249],tq_cbf_luma_i[250],tq_cbf_luma_i[251],tq_cbf_luma_i[252],tq_cbf_luma_i[253],tq_cbf_luma_i[254],tq_cbf_luma_i[255]};

assign  cbf_u_w[255:248] =  {tq_cbf_cb_i[0  ],tq_cbf_cb_i[ 1 ],tq_cbf_cb_i[2  ],tq_cbf_cb_i[3  ],tq_cbf_cb_i[4  ],tq_cbf_cb_i[5	 ],tq_cbf_cb_i[6  ],tq_cbf_cb_i[7  ]};
assign  cbf_u_w[247:240] =  {tq_cbf_cb_i[8  ],tq_cbf_cb_i[ 9 ],tq_cbf_cb_i[10 ],tq_cbf_cb_i[11 ],tq_cbf_cb_i[12 ],tq_cbf_cb_i[13 ],tq_cbf_cb_i[14 ],tq_cbf_cb_i[15 ]};
assign  cbf_u_w[239:232] =  {tq_cbf_cb_i[16 ],tq_cbf_cb_i[17 ],tq_cbf_cb_i[18 ],tq_cbf_cb_i[19 ],tq_cbf_cb_i[20 ],tq_cbf_cb_i[21 ],tq_cbf_cb_i[22 ],tq_cbf_cb_i[23 ]};
assign  cbf_u_w[231:224] =  {tq_cbf_cb_i[24 ],tq_cbf_cb_i[25 ],tq_cbf_cb_i[26 ],tq_cbf_cb_i[27 ],tq_cbf_cb_i[28 ],tq_cbf_cb_i[29 ],tq_cbf_cb_i[30 ],tq_cbf_cb_i[31 ]};
assign  cbf_u_w[223:216] =  {tq_cbf_cb_i[32 ],tq_cbf_cb_i[33 ],tq_cbf_cb_i[34 ],tq_cbf_cb_i[35 ],tq_cbf_cb_i[36 ],tq_cbf_cb_i[37 ],tq_cbf_cb_i[38 ],tq_cbf_cb_i[39 ]};
assign  cbf_u_w[215:208] =  {tq_cbf_cb_i[40 ],tq_cbf_cb_i[41 ],tq_cbf_cb_i[42 ],tq_cbf_cb_i[43 ],tq_cbf_cb_i[44 ],tq_cbf_cb_i[45 ],tq_cbf_cb_i[46 ],tq_cbf_cb_i[47 ]};
assign  cbf_u_w[207:200] =  {tq_cbf_cb_i[48 ],tq_cbf_cb_i[49 ],tq_cbf_cb_i[50 ],tq_cbf_cb_i[51 ],tq_cbf_cb_i[52 ],tq_cbf_cb_i[53 ],tq_cbf_cb_i[54 ],tq_cbf_cb_i[55 ]};
assign  cbf_u_w[199:192] =  {tq_cbf_cb_i[56 ],tq_cbf_cb_i[57 ],tq_cbf_cb_i[58 ],tq_cbf_cb_i[59 ],tq_cbf_cb_i[60 ],tq_cbf_cb_i[61 ],tq_cbf_cb_i[62 ],tq_cbf_cb_i[63 ]};
assign  cbf_u_w[191:184] =  {tq_cbf_cb_i[64 ],tq_cbf_cb_i[65 ],tq_cbf_cb_i[66 ],tq_cbf_cb_i[67 ],tq_cbf_cb_i[68 ],tq_cbf_cb_i[69 ],tq_cbf_cb_i[70 ],tq_cbf_cb_i[71 ]};
assign  cbf_u_w[183:176] =  {tq_cbf_cb_i[72 ],tq_cbf_cb_i[73 ],tq_cbf_cb_i[74 ],tq_cbf_cb_i[75 ],tq_cbf_cb_i[76 ],tq_cbf_cb_i[77 ],tq_cbf_cb_i[78 ],tq_cbf_cb_i[79 ]};
assign  cbf_u_w[175:168] =  {tq_cbf_cb_i[80 ],tq_cbf_cb_i[81 ],tq_cbf_cb_i[82 ],tq_cbf_cb_i[83 ],tq_cbf_cb_i[84 ],tq_cbf_cb_i[85 ],tq_cbf_cb_i[86 ],tq_cbf_cb_i[87 ]};
assign  cbf_u_w[167:160] =  {tq_cbf_cb_i[88 ],tq_cbf_cb_i[89 ],tq_cbf_cb_i[90 ],tq_cbf_cb_i[91 ],tq_cbf_cb_i[92 ],tq_cbf_cb_i[93 ],tq_cbf_cb_i[94 ],tq_cbf_cb_i[95 ]};
assign  cbf_u_w[159:152] =  {tq_cbf_cb_i[96 ],tq_cbf_cb_i[97 ],tq_cbf_cb_i[98 ],tq_cbf_cb_i[99 ],tq_cbf_cb_i[100],tq_cbf_cb_i[101],tq_cbf_cb_i[102],tq_cbf_cb_i[103]};
assign  cbf_u_w[151:144] =  {tq_cbf_cb_i[104],tq_cbf_cb_i[105],tq_cbf_cb_i[106],tq_cbf_cb_i[107],tq_cbf_cb_i[108],tq_cbf_cb_i[109],tq_cbf_cb_i[110],tq_cbf_cb_i[111]};
assign  cbf_u_w[143:136] =  {tq_cbf_cb_i[112],tq_cbf_cb_i[113],tq_cbf_cb_i[114],tq_cbf_cb_i[115],tq_cbf_cb_i[116],tq_cbf_cb_i[117],tq_cbf_cb_i[118],tq_cbf_cb_i[119]};
assign  cbf_u_w[135:128] =  {tq_cbf_cb_i[120],tq_cbf_cb_i[121],tq_cbf_cb_i[122],tq_cbf_cb_i[123],tq_cbf_cb_i[124],tq_cbf_cb_i[125],tq_cbf_cb_i[126],tq_cbf_cb_i[127]};
assign  cbf_u_w[127:120] =  {tq_cbf_cb_i[128],tq_cbf_cb_i[129],tq_cbf_cb_i[130],tq_cbf_cb_i[131],tq_cbf_cb_i[132],tq_cbf_cb_i[133],tq_cbf_cb_i[134],tq_cbf_cb_i[135]};
assign  cbf_u_w[119:112] =  {tq_cbf_cb_i[136],tq_cbf_cb_i[137],tq_cbf_cb_i[138],tq_cbf_cb_i[139],tq_cbf_cb_i[140],tq_cbf_cb_i[141],tq_cbf_cb_i[142],tq_cbf_cb_i[143]};
assign  cbf_u_w[111:104] =  {tq_cbf_cb_i[144],tq_cbf_cb_i[145],tq_cbf_cb_i[146],tq_cbf_cb_i[147],tq_cbf_cb_i[148],tq_cbf_cb_i[149],tq_cbf_cb_i[150],tq_cbf_cb_i[151]};
assign  cbf_u_w[103:96 ] =  {tq_cbf_cb_i[152],tq_cbf_cb_i[153],tq_cbf_cb_i[154],tq_cbf_cb_i[155],tq_cbf_cb_i[156],tq_cbf_cb_i[157],tq_cbf_cb_i[158],tq_cbf_cb_i[159]};
assign  cbf_u_w[ 95:88 ] =  {tq_cbf_cb_i[160],tq_cbf_cb_i[161],tq_cbf_cb_i[162],tq_cbf_cb_i[163],tq_cbf_cb_i[164],tq_cbf_cb_i[165],tq_cbf_cb_i[166],tq_cbf_cb_i[167]};
assign  cbf_u_w[ 87:80 ] =  {tq_cbf_cb_i[168],tq_cbf_cb_i[169],tq_cbf_cb_i[170],tq_cbf_cb_i[171],tq_cbf_cb_i[172],tq_cbf_cb_i[173],tq_cbf_cb_i[174],tq_cbf_cb_i[175]};
assign  cbf_u_w[ 79:72 ] =  {tq_cbf_cb_i[176],tq_cbf_cb_i[177],tq_cbf_cb_i[178],tq_cbf_cb_i[179],tq_cbf_cb_i[180],tq_cbf_cb_i[181],tq_cbf_cb_i[182],tq_cbf_cb_i[183]};
assign  cbf_u_w[ 71:64 ] =  {tq_cbf_cb_i[184],tq_cbf_cb_i[185],tq_cbf_cb_i[186],tq_cbf_cb_i[187],tq_cbf_cb_i[188],tq_cbf_cb_i[189],tq_cbf_cb_i[190],tq_cbf_cb_i[191]};
assign  cbf_u_w[ 63:56 ] =  {tq_cbf_cb_i[192],tq_cbf_cb_i[193],tq_cbf_cb_i[194],tq_cbf_cb_i[195],tq_cbf_cb_i[196],tq_cbf_cb_i[197],tq_cbf_cb_i[198],tq_cbf_cb_i[199]};
assign  cbf_u_w[ 55:48 ] =  {tq_cbf_cb_i[200],tq_cbf_cb_i[201],tq_cbf_cb_i[202],tq_cbf_cb_i[203],tq_cbf_cb_i[204],tq_cbf_cb_i[205],tq_cbf_cb_i[206],tq_cbf_cb_i[207]};
assign  cbf_u_w[ 47:40 ] =  {tq_cbf_cb_i[208],tq_cbf_cb_i[209],tq_cbf_cb_i[210],tq_cbf_cb_i[211],tq_cbf_cb_i[212],tq_cbf_cb_i[213],tq_cbf_cb_i[214],tq_cbf_cb_i[215]};
assign  cbf_u_w[ 39:32 ] =  {tq_cbf_cb_i[216],tq_cbf_cb_i[217],tq_cbf_cb_i[218],tq_cbf_cb_i[219],tq_cbf_cb_i[220],tq_cbf_cb_i[221],tq_cbf_cb_i[222],tq_cbf_cb_i[223]};
assign  cbf_u_w[ 31:24 ] =  {tq_cbf_cb_i[224],tq_cbf_cb_i[225],tq_cbf_cb_i[226],tq_cbf_cb_i[227],tq_cbf_cb_i[228],tq_cbf_cb_i[229],tq_cbf_cb_i[230],tq_cbf_cb_i[231]};
assign  cbf_u_w[ 23:16 ] =  {tq_cbf_cb_i[232],tq_cbf_cb_i[233],tq_cbf_cb_i[234],tq_cbf_cb_i[235],tq_cbf_cb_i[236],tq_cbf_cb_i[237],tq_cbf_cb_i[238],tq_cbf_cb_i[239]};
assign  cbf_u_w[ 15:8  ] =  {tq_cbf_cb_i[240],tq_cbf_cb_i[241],tq_cbf_cb_i[242],tq_cbf_cb_i[243],tq_cbf_cb_i[244],tq_cbf_cb_i[245],tq_cbf_cb_i[246],tq_cbf_cb_i[247]};
assign  cbf_u_w[  7:0  ] =  {tq_cbf_cb_i[248],tq_cbf_cb_i[249],tq_cbf_cb_i[250],tq_cbf_cb_i[251],tq_cbf_cb_i[252],tq_cbf_cb_i[253],tq_cbf_cb_i[254],tq_cbf_cb_i[255]};

assign  cbf_v_w[255:248] =  {tq_cbf_cr_i[0  ],tq_cbf_cr_i[ 1 ],tq_cbf_cr_i[2  ],tq_cbf_cr_i[3  ],tq_cbf_cr_i[4  ],tq_cbf_cr_i[5	 ],tq_cbf_cr_i[6  ],tq_cbf_cr_i[7  ]};
assign  cbf_v_w[247:240] =  {tq_cbf_cr_i[8  ],tq_cbf_cr_i[ 9 ],tq_cbf_cr_i[10 ],tq_cbf_cr_i[11 ],tq_cbf_cr_i[12 ],tq_cbf_cr_i[13 ],tq_cbf_cr_i[14 ],tq_cbf_cr_i[15 ]};
assign  cbf_v_w[239:232] =  {tq_cbf_cr_i[16 ],tq_cbf_cr_i[17 ],tq_cbf_cr_i[18 ],tq_cbf_cr_i[19 ],tq_cbf_cr_i[20 ],tq_cbf_cr_i[21 ],tq_cbf_cr_i[22 ],tq_cbf_cr_i[23 ]};
assign  cbf_v_w[231:224] =  {tq_cbf_cr_i[24 ],tq_cbf_cr_i[25 ],tq_cbf_cr_i[26 ],tq_cbf_cr_i[27 ],tq_cbf_cr_i[28 ],tq_cbf_cr_i[29 ],tq_cbf_cr_i[30 ],tq_cbf_cr_i[31 ]};
assign  cbf_v_w[223:216] =  {tq_cbf_cr_i[32 ],tq_cbf_cr_i[33 ],tq_cbf_cr_i[34 ],tq_cbf_cr_i[35 ],tq_cbf_cr_i[36 ],tq_cbf_cr_i[37 ],tq_cbf_cr_i[38 ],tq_cbf_cr_i[39 ]};
assign  cbf_v_w[215:208] =  {tq_cbf_cr_i[40 ],tq_cbf_cr_i[41 ],tq_cbf_cr_i[42 ],tq_cbf_cr_i[43 ],tq_cbf_cr_i[44 ],tq_cbf_cr_i[45 ],tq_cbf_cr_i[46 ],tq_cbf_cr_i[47 ]};
assign  cbf_v_w[207:200] =  {tq_cbf_cr_i[48 ],tq_cbf_cr_i[49 ],tq_cbf_cr_i[50 ],tq_cbf_cr_i[51 ],tq_cbf_cr_i[52 ],tq_cbf_cr_i[53 ],tq_cbf_cr_i[54 ],tq_cbf_cr_i[55 ]};
assign  cbf_v_w[199:192] =  {tq_cbf_cr_i[56 ],tq_cbf_cr_i[57 ],tq_cbf_cr_i[58 ],tq_cbf_cr_i[59 ],tq_cbf_cr_i[60 ],tq_cbf_cr_i[61 ],tq_cbf_cr_i[62 ],tq_cbf_cr_i[63 ]};
assign  cbf_v_w[191:184] =  {tq_cbf_cr_i[64 ],tq_cbf_cr_i[65 ],tq_cbf_cr_i[66 ],tq_cbf_cr_i[67 ],tq_cbf_cr_i[68 ],tq_cbf_cr_i[69 ],tq_cbf_cr_i[70 ],tq_cbf_cr_i[71 ]};
assign  cbf_v_w[183:176] =  {tq_cbf_cr_i[72 ],tq_cbf_cr_i[73 ],tq_cbf_cr_i[74 ],tq_cbf_cr_i[75 ],tq_cbf_cr_i[76 ],tq_cbf_cr_i[77 ],tq_cbf_cr_i[78 ],tq_cbf_cr_i[79 ]};
assign  cbf_v_w[175:168] =  {tq_cbf_cr_i[80 ],tq_cbf_cr_i[81 ],tq_cbf_cr_i[82 ],tq_cbf_cr_i[83 ],tq_cbf_cr_i[84 ],tq_cbf_cr_i[85 ],tq_cbf_cr_i[86 ],tq_cbf_cr_i[87 ]};
assign  cbf_v_w[167:160] =  {tq_cbf_cr_i[88 ],tq_cbf_cr_i[89 ],tq_cbf_cr_i[90 ],tq_cbf_cr_i[91 ],tq_cbf_cr_i[92 ],tq_cbf_cr_i[93 ],tq_cbf_cr_i[94 ],tq_cbf_cr_i[95 ]};
assign  cbf_v_w[159:152] =  {tq_cbf_cr_i[96 ],tq_cbf_cr_i[97 ],tq_cbf_cr_i[98 ],tq_cbf_cr_i[99 ],tq_cbf_cr_i[100],tq_cbf_cr_i[101],tq_cbf_cr_i[102],tq_cbf_cr_i[103]};
assign  cbf_v_w[151:144] =  {tq_cbf_cr_i[104],tq_cbf_cr_i[105],tq_cbf_cr_i[106],tq_cbf_cr_i[107],tq_cbf_cr_i[108],tq_cbf_cr_i[109],tq_cbf_cr_i[110],tq_cbf_cr_i[111]};
assign  cbf_v_w[143:136] =  {tq_cbf_cr_i[112],tq_cbf_cr_i[113],tq_cbf_cr_i[114],tq_cbf_cr_i[115],tq_cbf_cr_i[116],tq_cbf_cr_i[117],tq_cbf_cr_i[118],tq_cbf_cr_i[119]};
assign  cbf_v_w[135:128] =  {tq_cbf_cr_i[120],tq_cbf_cr_i[121],tq_cbf_cr_i[122],tq_cbf_cr_i[123],tq_cbf_cr_i[124],tq_cbf_cr_i[125],tq_cbf_cr_i[126],tq_cbf_cr_i[127]};
assign  cbf_v_w[127:120] =  {tq_cbf_cr_i[128],tq_cbf_cr_i[129],tq_cbf_cr_i[130],tq_cbf_cr_i[131],tq_cbf_cr_i[132],tq_cbf_cr_i[133],tq_cbf_cr_i[134],tq_cbf_cr_i[135]};
assign  cbf_v_w[119:112] =  {tq_cbf_cr_i[136],tq_cbf_cr_i[137],tq_cbf_cr_i[138],tq_cbf_cr_i[139],tq_cbf_cr_i[140],tq_cbf_cr_i[141],tq_cbf_cr_i[142],tq_cbf_cr_i[143]};
assign  cbf_v_w[111:104] =  {tq_cbf_cr_i[144],tq_cbf_cr_i[145],tq_cbf_cr_i[146],tq_cbf_cr_i[147],tq_cbf_cr_i[148],tq_cbf_cr_i[149],tq_cbf_cr_i[150],tq_cbf_cr_i[151]};
assign  cbf_v_w[103:96 ] =  {tq_cbf_cr_i[152],tq_cbf_cr_i[153],tq_cbf_cr_i[154],tq_cbf_cr_i[155],tq_cbf_cr_i[156],tq_cbf_cr_i[157],tq_cbf_cr_i[158],tq_cbf_cr_i[159]};
assign  cbf_v_w[ 95:88 ] =  {tq_cbf_cr_i[160],tq_cbf_cr_i[161],tq_cbf_cr_i[162],tq_cbf_cr_i[163],tq_cbf_cr_i[164],tq_cbf_cr_i[165],tq_cbf_cr_i[166],tq_cbf_cr_i[167]};
assign  cbf_v_w[ 87:80 ] =  {tq_cbf_cr_i[168],tq_cbf_cr_i[169],tq_cbf_cr_i[170],tq_cbf_cr_i[171],tq_cbf_cr_i[172],tq_cbf_cr_i[173],tq_cbf_cr_i[174],tq_cbf_cr_i[175]};
assign  cbf_v_w[ 79:72 ] =  {tq_cbf_cr_i[176],tq_cbf_cr_i[177],tq_cbf_cr_i[178],tq_cbf_cr_i[179],tq_cbf_cr_i[180],tq_cbf_cr_i[181],tq_cbf_cr_i[182],tq_cbf_cr_i[183]};
assign  cbf_v_w[ 71:64 ] =  {tq_cbf_cr_i[184],tq_cbf_cr_i[185],tq_cbf_cr_i[186],tq_cbf_cr_i[187],tq_cbf_cr_i[188],tq_cbf_cr_i[189],tq_cbf_cr_i[190],tq_cbf_cr_i[191]};
assign  cbf_v_w[ 63:56 ] =  {tq_cbf_cr_i[192],tq_cbf_cr_i[193],tq_cbf_cr_i[194],tq_cbf_cr_i[195],tq_cbf_cr_i[196],tq_cbf_cr_i[197],tq_cbf_cr_i[198],tq_cbf_cr_i[199]};
assign  cbf_v_w[ 55:48 ] =  {tq_cbf_cr_i[200],tq_cbf_cr_i[201],tq_cbf_cr_i[202],tq_cbf_cr_i[203],tq_cbf_cr_i[204],tq_cbf_cr_i[205],tq_cbf_cr_i[206],tq_cbf_cr_i[207]};
assign  cbf_v_w[ 47:40 ] =  {tq_cbf_cr_i[208],tq_cbf_cr_i[209],tq_cbf_cr_i[210],tq_cbf_cr_i[211],tq_cbf_cr_i[212],tq_cbf_cr_i[213],tq_cbf_cr_i[214],tq_cbf_cr_i[215]};
assign  cbf_v_w[ 39:32 ] =  {tq_cbf_cr_i[216],tq_cbf_cr_i[217],tq_cbf_cr_i[218],tq_cbf_cr_i[219],tq_cbf_cr_i[220],tq_cbf_cr_i[221],tq_cbf_cr_i[222],tq_cbf_cr_i[223]};
assign  cbf_v_w[ 31:24 ] =  {tq_cbf_cr_i[224],tq_cbf_cr_i[225],tq_cbf_cr_i[226],tq_cbf_cr_i[227],tq_cbf_cr_i[228],tq_cbf_cr_i[229],tq_cbf_cr_i[230],tq_cbf_cr_i[231]};
assign  cbf_v_w[ 23:16 ] =  {tq_cbf_cr_i[232],tq_cbf_cr_i[233],tq_cbf_cr_i[234],tq_cbf_cr_i[235],tq_cbf_cr_i[236],tq_cbf_cr_i[237],tq_cbf_cr_i[238],tq_cbf_cr_i[239]};
assign  cbf_v_w[ 15:8  ] =  {tq_cbf_cr_i[240],tq_cbf_cr_i[241],tq_cbf_cr_i[242],tq_cbf_cr_i[243],tq_cbf_cr_i[244],tq_cbf_cr_i[245],tq_cbf_cr_i[246],tq_cbf_cr_i[247]};
assign  cbf_v_w[  7:0  ] =  {tq_cbf_cr_i[248],tq_cbf_cr_i[249],tq_cbf_cr_i[250],tq_cbf_cr_i[251],tq_cbf_cr_i[252],tq_cbf_cr_i[253],tq_cbf_cr_i[254],tq_cbf_cr_i[255]};


//-----------------------------------------------------------------------------------------------------------------------------
//                                             
//     binarization sub-module                           
//                                             
//-----------------------------------------------------------------------------------------------------------------------------

cabac_binarization cabac_binarization_u0(
				//input
				.clk							(clk						),
				.rst_n							(rst_n						),	
				.cabac_start_i					(start_d1_r					),
				.slice_type_i					(mb_type_i					),
				.mb_x_total_i					(mb_x_total_i				),
				.mb_y_total_i					(mb_y_total_i				),
				.mb_x_i							(mb_x_i						),
				.mb_y_i							(mb_y_i						),
			    .param_qp_i                     (param_qp_i                 ),

			    .sao_i                          (sao_i                      ),
				.luma_mode_i  			        (luma_mode_i  		        ),
				.chroma_mode_i                  (chroma_mode_i              ),   
			 
				.inter_cu_part_size_i			(mb_p_pu_mode_i				),
                .merge_flag_i                   (merge_flag_i               ),
                .merge_idx_i                    (merge_idx_i                ),
				
                .cu_skip_flag_i                 (cu_skip_flag_i             ),
            	.cu_split_flag_i				(mb_partition_i				),
			   	
				.luma_cbf_i						(cbf_y_w   				    ),		
				.cr_cbf_i						(cbf_v_w				    ),		
				.cb_cbf_i						(cbf_u_w				    ),		

				.lcu_qp_i						(qp_i						),		
				.coeff_data_i					(tq_rdata_i					),	
				.cu_mvd_i						(mb_mvd_rdata_i				),				
//                .mvd_idx_i                      (mvd_idx_i                  ),
				
				.table_build_end_i				(table_build_end_w			),				
				.no_bit_flag_i					(no_bit_flag_w				),                                                   		

				//output                                            		  
				.slice_init_flag_o				(slice_init_flag_w			),
  				.cu_luma_mode_ren_o             (cu_luma_mode_ren_w         ),
                .cu_luma_mode_raddr_o           (cu_luma_mode_raddr_w       ),
                .cu_chroma_mode_ren_o           (cu_chroma_mode_ren_w       ),
                .cu_chroma_mode_raddr_o         (cu_chroma_mode_raddr_w     ),
				.cu_mvd_ren_o                   (cu_mvd_ren_w               ),
				.cu_mvd_raddr_o					(cu_mvd_raddr_w				),
				.cu_coeff_raddr_o				(cu_coeff_raddr_w			),
				.cu_coeff_ren_o					(cu_coeff_ren_w				),	

				.cabac_mb_done_o				(cabac_mb_done_w			),
                .cabac_slice_done_o				(cabac_slice_done_w			),
				.coeff_type_o                   (coeff_type_w               ),

                .binary_pair_0_o				(ctx_pair_0_w				),
                .binary_pair_1_o				(ctx_pair_1_w				),
                .binary_pair_2_o				(ctx_pair_2_w				),
                .binary_pair_3_o				(ctx_pair_3_w				),
				.binary_pair_valid_num_o        (valid_num_bin_pair_w       ),

                .cabac_curr_state_o				(cabac_curr_state_w			)
);

//-----------------------------------------------------------------------------------------------------------------------------
//                                             
//      slice initial                       
//                                             
//-----------------------------------------------------------------------------------------------------------------------------

cabac_slice_init cabac_slice_init_u0(
				.clk							(clk					),
				.rst_n							(rst_n					),
				.start_slice_init_i				(slice_init_flag_w		),
				.slice_type_i					(mb_type_i				),
				.slice_qp_i						(slice_qp_r				),
           		
				.table_build_end_o				(table_build_end_w		),

				.w_en_ctx_state_0_o				(w_en_ctx_state_0_w		),
    			.w_addr_ctx_state_0_o			(w_addr_ctx_state_0_w	),
    			.w_data_ctx_state_0_o			(w_data_ctx_state_0_w	),
    			.w_en_ctx_state_1_o				(w_en_ctx_state_1_w		),
    			.w_addr_ctx_state_1_o			(w_addr_ctx_state_1_w	),
    			.w_data_ctx_state_1_o			(w_data_ctx_state_1_w	),
    			.w_en_ctx_state_2_o				(w_en_ctx_state_2_w		),
    			.w_addr_ctx_state_2_o			(w_addr_ctx_state_2_w	),
    			.w_data_ctx_state_2_o			(w_data_ctx_state_2_w	),
    			.w_en_ctx_state_3_o				(w_en_ctx_state_3_w		),
    			.w_addr_ctx_state_3_o			(w_addr_ctx_state_3_w	),
    			.w_data_ctx_state_3_o			(w_data_ctx_state_3_w	),
    			.w_en_ctx_state_4_o				(w_en_ctx_state_4_w		),
    			.w_addr_ctx_state_4_o			(w_addr_ctx_state_4_w	),
    			.w_data_ctx_state_4_o			(w_data_ctx_state_4_w	)
	
);

//-----------------------------------------------------------------------------------------------------------------------------
//                                             
//        modeling               
//                                             
//-----------------------------------------------------------------------------------------------------------------------------

cabac_modeling cabac_modeling_u0(
				//input
				.clk 							(clk						),
				.rst_n							(rst_n						),

                .modeling_pair_0_i				(ctx_pair_0_w				),
                .modeling_pair_1_i				(ctx_pair_1_w				),
                .modeling_pair_2_i				(ctx_pair_2_w				),
                .modeling_pair_3_i				(ctx_pair_3_w				),
                .valid_num_modeling_i			(valid_num_bin_pair_w       ),
                
                .cabac_start_i					(start_d1_r					),
                .slice_qp_i						(slice_qp_r					),
                .slice_type_i					(mb_type_i					),
                .first_mb_flag_i				(first_mb_flag_r			),

                .w_en_ctx_state_0_i				(w_en_ctx_state_0_w			),
    			.w_addr_ctx_state_0_i			(w_addr_ctx_state_0_w		),
    			.w_data_ctx_state_0_i			(w_data_ctx_state_0_w		),
    			.w_en_ctx_state_1_i				(w_en_ctx_state_1_w			),
    			.w_addr_ctx_state_1_i			(w_addr_ctx_state_1_w		),
    			.w_data_ctx_state_1_i			(w_data_ctx_state_1_w		),
    			.w_en_ctx_state_2_i				(w_en_ctx_state_2_w			),
    			.w_addr_ctx_state_2_i			(w_addr_ctx_state_2_w		),
    			.w_data_ctx_state_2_i			(w_data_ctx_state_2_w		),
    			.w_en_ctx_state_3_i				(w_en_ctx_state_3_w			),
    			.w_addr_ctx_state_3_i			(w_addr_ctx_state_3_w		),
    			.w_data_ctx_state_3_i			(w_data_ctx_state_3_w		),
    			.w_en_ctx_state_4_i				(w_en_ctx_state_4_w			),
    			.w_addr_ctx_state_4_i			(w_addr_ctx_state_4_w		),
    			.w_data_ctx_state_4_i			(w_data_ctx_state_4_w		),

                //output                		            
                .modeling_ctx_pair_0_o			(modeling_ctx_pair_0_w		),  
                .modeling_ctx_pair_1_o			(modeling_ctx_pair_1_w		),  
                .modeling_ctx_pair_2_o			(modeling_ctx_pair_2_w		),
                .modeling_ctx_pair_3_o			(modeling_ctx_pair_3_w		),
                .valid_num_modeling_o			(valid_num_bae_w			)
);

//-----------------------------------------------------------------------------------------------------------------------------
//                                             
//        bae             
//                                             
//-----------------------------------------------------------------------------------------------------------------------------
cabac_bae     cabac_bae_u0(
                .clk                            ( clk                       ),
                .rst_n                          ( rst_n                     ),
                .table_build_end_i 		        ( table_build_end_w         ),
                .bae_ctx_pair_0_i               ( modeling_ctx_pair_0_w     ),
                .bae_ctx_pair_1_i               ( modeling_ctx_pair_1_w     ),
                .bae_ctx_pair_2_i               ( modeling_ctx_pair_2_w     ),
                .bae_ctx_pair_3_i               ( modeling_ctx_pair_3_w     ),         
                .bae_output_byte_o              ( output_byte_w			    ),
                .output_byte_en_o               ( output_byte_en_w		    ),
                .no_bit_flag_o			        ( no_bit_flag_w             )
);





endmodule