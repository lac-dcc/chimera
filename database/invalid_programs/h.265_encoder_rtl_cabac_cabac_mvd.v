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
// Filename       : cabac_mvd.v
// Author         : guo yong
// Created        : 2013-06
// Description    : H.264 encode mvd, modified
//               
//-------------------------------------------------------------------

`define MEM_TOP_DEPTH	9
`include "enc_defines.v"

module cabac_mvd(
				//input
				clk   							,
				rst_n                           ,
				mb_x_i							,
				mb_y_i							,
				curr_state_i                 	,
				mb_partition_i			        ,
                mb_sub_partition_i		        ,
				mvd_curr_i                      ,
							
				//output
				r_addr_mvd_o  					,
				mvd_done_o                      ,
				ctx_pair_mvd_0_o	            ,
				ctx_pair_mvd_1_o	            ,
				ctx_pair_mvd_2_o	            ,
				ctx_pair_mvd_3_o	            ,
				ctx_pair_mvd_4_o	            ,
				ctx_pair_mvd_5_o	            ,
				ctx_pair_mvd_6_o	            ,
				ctx_pair_mvd_7_o	            ,
				ctx_pair_mvd_8_o	            ,
				ctx_pair_mvd_9_o	            ,
				ctx_pair_mvd_10_o               ,
				ctx_pair_mvd_11_o               ,
				ctx_pair_mvd_12_o               ,
				ctx_pair_mvd_13_o               ,
				ctx_pair_mvd_14_o               ,
				ctx_pair_mvd_15_o               ,
				valid_num_bin_mvd_o             

);

// ********************************************
//                                             
//    Parameter DECLARATION               
//                                             
// ********************************************    

parameter       	CABAC_mvd               =	  	5'd11 	;			                                  

//mb_sub_partition                 	 
parameter			D_L0_4x4				 =		2'd3  ,
					D_L0_8x4				 =		2'd1  ,
					D_L0_4x8				 =		2'd2  ,
					D_L0_8x8				 = 		2'd0  ;

//mb_partition
parameter			D_8x8					 =		2'd3  ,
					D_16x8					 =		2'd1  ,
					D_8x16					 = 		2'd2  ,
					D_16x16					 = 		2'd0  ;		

//mvd_encode_state
parameter			MVD_IDLE				=		2'd0	,
					MVD_ENCODE 				=		2'd1	,
					MVD_DONE                = 		2'd2	;	



// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION               
//                                             
// ********************************************
//input                 
input				clk   									;	//clock signal	
input				rst_n                                   ;	//reset signal
input	[`PIC_X_WIDTH-1:0]		mb_x_i									;	//mb_x  
input	[`PIC_Y_WIDTH-1:0]		mb_y_i									;	//mb_y
input	[4:0]		curr_state_i                         	;	//binarization machine state
input	[1:0]		mb_partition_i			                ;	//mb_partition
input	[7:0]		mb_sub_partition_i		                ;	//mb sub_partition
input	[2*(`FMV_WIDTH+1)-1:0]	mvd_curr_i                  ;	//mvd of a 4x4 block in one macroblock from memory
			                                              
//output                                      
output	[3:0]		r_addr_mvd_o  			                ;	//mvd address of mvd memory for read mvd
output				mvd_done_o                              ;	//coding mvd done signal
output	[11:0]		ctx_pair_mvd_0_o	                    ;	//context pair of mvd 0	
output	[11:0]		ctx_pair_mvd_1_o	                    ;	//context pair of mvd 1	
output	[11:0]		ctx_pair_mvd_2_o	                    ;	//context pair of mvd 2	
output	[11:0]		ctx_pair_mvd_3_o	                    ;	//context pair of mvd 3	
output	[11:0]		ctx_pair_mvd_4_o	                    ;	//context pair of mvd 4	
output	[11:0]		ctx_pair_mvd_5_o	                    ;	//context pair of mvd 5	
output	[11:0]		ctx_pair_mvd_6_o	                    ;	//context pair of mvd 6	
output	[11:0]		ctx_pair_mvd_7_o	                    ;	//context pair of mvd 7	
output	[11:0]		ctx_pair_mvd_8_o	                    ;	//context pair of mvd 8	
output	[11:0]		ctx_pair_mvd_9_o	                    ;	//context pair of mvd 9	
output	[11:0]		ctx_pair_mvd_10_o                       ;	//context pair of mvd 10  
output	[11:0]		ctx_pair_mvd_11_o                       ;	//context pair of mvd 11  
output	[11:0]		ctx_pair_mvd_12_o                       ;	//context pair of mvd 12  
output	[11:0]		ctx_pair_mvd_13_o                       ;	//context pair of mvd 13  
output	[11:0]		ctx_pair_mvd_14_o                       ;	//context pair of mvd 14  
output	[11:0]		ctx_pair_mvd_15_o                       ;	//context pair of mvd 15  
output	[3:0]		valid_num_bin_mvd_o                     ;	//valid number bin of mvd




// ********************************************
//                                             
//    Reg / Wire DECLARATION               
//                                             
// ********************************************
reg					mvd_done_o                              ;	//coding mvd done signal
reg		[11:0]		ctx_pair_mvd_0_o	                    ;	//context pair of mvd 0	
reg		[11:0]		ctx_pair_mvd_1_o	                    ;	//context pair of mvd 1	
reg		[11:0]		ctx_pair_mvd_2_o	                    ;	//context pair of mvd 2	
reg		[11:0]		ctx_pair_mvd_3_o	                    ;	//context pair of mvd 3	
reg		[11:0]		ctx_pair_mvd_4_o	                    ;	//context pair of mvd 4	
reg		[11:0]		ctx_pair_mvd_5_o	                    ;	//context pair of mvd 5	
reg		[11:0]		ctx_pair_mvd_6_o	                    ;	//context pair of mvd 6	
reg		[11:0]		ctx_pair_mvd_7_o	                    ;	//context pair of mvd 7	
reg		[11:0]		ctx_pair_mvd_8_o	                    ;	//context pair of mvd 8	
reg		[11:0]		ctx_pair_mvd_9_o	                    ;	//context pair of mvd 9	
reg		[11:0]		ctx_pair_mvd_10_o                       ;	//context pair of mvd 10  
reg		[11:0]		ctx_pair_mvd_11_o                       ;	//context pair of mvd 11  
reg		[11:0]		ctx_pair_mvd_12_o                       ;	//context pair of mvd 12  
reg		[11:0]		ctx_pair_mvd_13_o                       ;	//context pair of mvd 13  
reg		[11:0]		ctx_pair_mvd_14_o                       ;	//context pair of mvd 14  
reg		[11:0]		ctx_pair_mvd_15_o                       ;	//context pair of mvd 15  
reg		[3:0]		valid_num_bin_mvd_o                     ;	//valid number bin of mvd
reg		[3:0]		valid_num_bin_mvd_r						;	//valid number bin of mvd reg
	
wire	[11:0]		ctx_pair_mvd_bypass_w					;	//last bin of mvd sign

reg		[1:0]		mb_sub_part_r							;	//sub partition read in a macroblock
reg		[1:0]		mb_sub_part_encode_r					;	//sub partition encode
reg		[3:0]		mvd_idx_r								;	//mvd_idx:0~15, when read
reg		[3:0]		mvd_idx_0_r								;	//
reg		[3:0]		mvd_idx_encode_r						;	//mvd_idx:0~15, when encode
reg		[1:0]		mvd_8x8_idx_r							;	//mvd index of sub block reading
reg		[1:0]		mvd_8x8_idx_encode_r					;	//mvd index of sub block encoding
reg		[1:0]		mvd_8x8_sub_idx_r						;	//mvd sub_idx of 4x4 block
reg					mvd_8x8_done_r							;	//mvd of sub 8x8 block done flag
reg					mvd_encode_done_r						;	//mvd encode done flag, and then write neighbour info
																//to corresponding sram

reg					mvd_e_done_r							;	//one mvd encode finish
reg					mvd_e_done_delay_r						;	//e_done delay signal

reg		[2*(`FMV_WIDTH+1)-1:0]	mvd_curr_r                  ;	//mvd of a 4x4 block in one macroblock from memory
																//sign_abs_x, sign_abs_y
wire							sign_x_w					;
wire							sign_y_w					;



reg		[2*(`FMV_WIDTH+1)-1:0]	mvd_encode_r				;	//current encode mvd
reg		[2*(`FMV_WIDTH+1)-1:0]	mvd_left_r					;	//current encode mvd
reg		[2*(`FMV_WIDTH+1)-1:0]	mvd_top_r					;	//current encode mvd

reg		[`FMV_WIDTH:0]			abs_ref_mvd_r				;	//left abs mvd add top abs mvd
reg		[`FMV_WIDTH-1:0]			abs_mvd_r					;	//mvd absolution
reg		[`FMV_WIDTH-1:0]			abs_mvd_bypass_r			;	//abs_mvd-9
                  
wire	[`FMV_WIDTH:0]			mvd_x_curr_w				;	//current block mvd_x
wire	[`FMV_WIDTH:0]			mvd_y_curr_w				;	//current block mvd_y
wire	[`FMV_WIDTH:0]			mvd_x_left_w				;	//left block mvd_x
wire	[`FMV_WIDTH:0]			mvd_y_left_w				;	//left block mvd_y
wire	[`FMV_WIDTH:0]			mvd_x_top_w					;	//top block mvd_x
wire	[`FMV_WIDTH:0]			mvd_y_top_w					;	//top block mvd_y

reg		[8:0]		ctx_idx_mvd_0_r							;	//context index of mvd 0	
reg		[8:0]		ctx_idx_mvd_1_r							;	//context index of mvd 1	
reg		[8:0]		ctx_idx_mvd_2_r							;	//context index of mvd 2	
reg		[8:0]		ctx_idx_mvd_3_r							;	//context index of mvd 3	
reg		[8:0]		ctx_idx_mvd_4_r							;	//context index of mvd 4	
reg		[8:0]		ctx_idx_mvd_5_r							;	//context index of mvd 5	
reg		[8:0]		ctx_idx_mvd_6_r							;	//context index of mvd 6	
reg		[8:0]		ctx_idx_mvd_7_r							;	//context index of mvd 7	
reg		[8:0]		ctx_idx_mvd_8_r							;	//context index of mvd 8	

reg		[8:0]		bin_string_mvd_prefix_r					;	//bin string of mvd_x/mvd_y prefix after binarization  
reg		[3:0]		valid_num_bin_mvd_prefix_r				;	//valid number of bin of mvd prefix
wire	[11:0]		ctx_pair_mvd_prefix_0_w					;	//context pair of mvd_x/mvd_y prefix 0     
wire	[11:0]		ctx_pair_mvd_prefix_1_w					;	//context pair of mvd_x/mvd_y prefix 1
wire	[11:0]		ctx_pair_mvd_prefix_2_w					;	//context pair of mvd_x/mvd_y prefix 2
wire	[11:0]		ctx_pair_mvd_prefix_3_w					;	//context pair of mvd_x/mvd_y prefix 3
wire	[11:0]		ctx_pair_mvd_prefix_4_w					;	//context pair of mvd_x/mvd_y prefix 4
wire	[11:0]		ctx_pair_mvd_prefix_5_w					;	//context pair of mvd_x/mvd_y prefix 5
wire	[11:0]		ctx_pair_mvd_prefix_6_w					;	//context pair of mvd_x/mvd_y prefix 6
wire	[11:0]		ctx_pair_mvd_prefix_7_w					;	//context pair of mvd_x/mvd_y prefix 7
wire	[11:0]		ctx_pair_mvd_prefix_8_w					;	//context pair of mvd_x/mvd_y prefix 8

reg		[15:0]		bin_string_mvd_suffix_r					;	//bin string of mvd_x/mvd_y suffix after binarization 
reg		[3:0]		mvd_suffix_length_r						;	//mvd suffix length
reg		[3:0]		mvd_bypass_length_r						;	//mvd bypass length

//neighbour memory signal
wire							r_mvd_left_en_w				;	//read  left memory enable signal
wire							w_mvd_left_en_w				;	//write left memory enable signal
wire	[1				  :0]	r_addr_mvd_left_w			;	//read  left memory address signal
wire	[1				  :0]	w_addr_mvd_left_w			;	//write left memory address signal
wire	[2*(`FMV_WIDTH+1)-1:0]	r_data_mvd_left_w			;	//read data from left memory
wire	[2*(`FMV_WIDTH+1)-1:0]	w_data_mvd_left_w			;	//write data to  left memory
                                                    		
wire							r_mvd_top_en_w				;	//read  top memory enable signal
wire							w_mvd_top_en_w				;	//write top memory enable signal
wire	[(`MEM_TOP_DEPTH-1):0]	r_addr_mvd_top_w			;	//read  top memory address signal
wire	[(`MEM_TOP_DEPTH-1):0]	w_addr_mvd_top_w			;	//write top memory address signal
wire	[2*(`FMV_WIDTH+1)-1:0]	r_data_mvd_top_w			;	//read data from top memory
wire	[2*(`FMV_WIDTH+1)-1:0]	w_data_mvd_top_w			;	//write data to  top memory
                                                    		
reg								r_mvd_left_en_r				;	//read  left memory enable signal
reg								w_mvd_left_en_r				;	//write left memory enable signal
reg		[1				  :0]	r_addr_mvd_left_r			;	//read  left memory address signal
reg		[1				  :0]	w_addr_mvd_left_r			;	//write left memory address signal
reg		[2*(`FMV_WIDTH+1)-1:0]	r_data_mvd_left_r			;	//read data from left memory
reg		[2*(`FMV_WIDTH+1)-1:0]	w_data_mvd_left_r			;	//write data to  left memory
                                                    		
reg								r_mvd_top_en_r				;	//read  top memory enable signal
reg								w_mvd_top_en_r				;	//write top memory enable signal
reg		[(`MEM_TOP_DEPTH-1):0]	r_addr_mvd_top_r			;	//read  top memory address signal
reg		[(`MEM_TOP_DEPTH-1):0]	w_addr_mvd_top_r			;	//write top memory address signal
reg		[2*(`FMV_WIDTH+1)-1:0]	r_data_mvd_top_r			;	//read data from top memory
reg		[2*(`FMV_WIDTH+1)-1:0]	w_data_mvd_top_r			;	//write data to  top memory
                                                    		
reg		[3				  :0]	write_cyc_num_r				;	//write data cycle number
reg								y_encode_flag_r				;	//encode mvd_y after encode mvd_x
reg								prefix_encode_flag_r		;	//encode prefix of mvd_x or mvd_y

reg		[2				  :0]	mvd_encode_total_num_r		;	//total cycle number of encode one mvd
reg		[2				  :0]	mvd_encode_count_r			;	//count cycle number of encode one mvd, 2 or 3 or 4   

wire							mvd_x_less9_w				;	//mvd_x less than 9
wire							mvd_y_less9_w				;	//mvd_y less than 9

reg		[2*(`FMV_WIDTH+1)-1:0]	cache_left_r				;	//cache left data
reg		[2*(`FMV_WIDTH+1)-1:0]	cache_top_r 				;	//cache top  data
reg		[2*(`FMV_WIDTH+1)-1:0]	cache0_r					;	//cache0
reg		[2*(`FMV_WIDTH+1)-1:0]	cache1_r					;	//cache1

reg		[1				  :0]	mvd_curr_state_r			;	//curr_state
reg		[1				  :0]	mvd_next_state_r			;	//next_state
          				  
reg		[3				  :0]	valid_num_bin_minus1_r		;	//valid_num_bin_mvd_r - 1
reg		[2				  :0]	output_cyc_cnt_r			;	//output cycle count
reg		[2				  :0]	output_cyc_tot_r			;	//output_cycle total
wire							trans_en_w					;	//transform to next block enable


//valid_num_bin_minus1_r
always @* begin
	if(valid_num_bin_mvd_r>1)
		valid_num_bin_minus1_r = valid_num_bin_mvd_r - 1;
	else
		valid_num_bin_minus1_r = valid_num_bin_mvd_r;
end

//sign_x_w, sign_y_w
assign	sign_x_w = mvd_curr_i[(2*`FMV_WIDTH)+1];
assign	sign_y_w = mvd_curr_i[`FMV_WIDTH];




reg		[`FMV_WIDTH:0]		abs_x_w;
reg		[`FMV_WIDTH:0]		abs_y_w;

always @* begin
	if(mvd_curr_i[2*`FMV_WIDTH+1])
		abs_x_w = {1'b1, (~mvd_curr_i[(2*`FMV_WIDTH):(`FMV_WIDTH+1)])+1};
	else
		abs_x_w = mvd_curr_i[2*`FMV_WIDTH+1:`FMV_WIDTH+1];
end

always @* begin
	if(mvd_curr_i[`FMV_WIDTH])
		abs_y_w = {1'b1, (~mvd_curr_i[(`FMV_WIDTH-1):0]+1)};
	else 
		abs_y_w = mvd_curr_i[`FMV_WIDTH:0];
end

//mvd_curr_r
always @* begin
	mvd_curr_r = {abs_x_w, abs_y_w};
end




//output_cyc_cnt_r 
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		output_cyc_cnt_r <= 0;
	else if(mvd_curr_state_r!=MVD_ENCODE)
		output_cyc_cnt_r <= 0;
	else if(output_cyc_cnt_r==(output_cyc_tot_r-1))
		output_cyc_cnt_r <= 0;
	else 
		output_cyc_cnt_r <= output_cyc_cnt_r + 1;
end

//output_cyc_tot_r
always @* begin
	case(valid_num_bin_minus1_r[3:2])
		2'b00:	output_cyc_tot_r = 1;
		2'b01:	output_cyc_tot_r = 2;
		2'b10:	output_cyc_tot_r = 3;
		2'b11:	output_cyc_tot_r = 4;
		default:output_cyc_tot_r = 0;
	endcase
end

//transform to next block
assign	trans_en_w = (output_cyc_cnt_r==(output_cyc_tot_r-1) ? 1 : 0);



assign	mvd_y_curr_w = mvd_encode_r	[`FMV_WIDTH:0];
assign	mvd_x_curr_w = mvd_encode_r	[2*(`FMV_WIDTH)+1:(`FMV_WIDTH+1)];
assign	mvd_y_left_w = mvd_left_r	[`FMV_WIDTH:0]; 
assign	mvd_x_left_w = mvd_left_r	[2*(`FMV_WIDTH)+1:(`FMV_WIDTH+1)];     
assign  mvd_y_top_w  = mvd_top_r	[`FMV_WIDTH:0]; 
assign  mvd_x_top_w	 = mvd_top_r	[2*(`FMV_WIDTH)+1:(`FMV_WIDTH+1)];     

assign	ctx_pair_mvd_prefix_0_w	= {2'b00, bin_string_mvd_prefix_r[8], ctx_idx_mvd_0_r};
assign	ctx_pair_mvd_prefix_1_w	= {2'b00, bin_string_mvd_prefix_r[7], ctx_idx_mvd_1_r};
assign	ctx_pair_mvd_prefix_2_w	= {2'b00, bin_string_mvd_prefix_r[6], ctx_idx_mvd_2_r};
assign	ctx_pair_mvd_prefix_3_w	= {2'b00, bin_string_mvd_prefix_r[5], ctx_idx_mvd_3_r};
assign	ctx_pair_mvd_prefix_4_w	= {2'b00, bin_string_mvd_prefix_r[4], ctx_idx_mvd_4_r};
assign	ctx_pair_mvd_prefix_5_w	= {2'b00, bin_string_mvd_prefix_r[3], ctx_idx_mvd_5_r};
assign	ctx_pair_mvd_prefix_6_w	= {2'b00, bin_string_mvd_prefix_r[2], ctx_idx_mvd_6_r};
assign	ctx_pair_mvd_prefix_7_w	= {2'b00, bin_string_mvd_prefix_r[1], ctx_idx_mvd_7_r};
assign	ctx_pair_mvd_prefix_8_w	= {2'b00, bin_string_mvd_prefix_r[0], ctx_idx_mvd_8_r};

assign 	ctx_pair_mvd_bypass_w	= {2'b01, (y_encode_flag_r ? mvd_y_curr_w[`FMV_WIDTH] : mvd_x_curr_w[`FMV_WIDTH]), 9'd511};
assign	r_addr_mvd_o = mvd_idx_r;


// ********************************************
//                                             
//    Combinational Logic               
//                                             
// ********************************************

//mvd_curr_state_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		mvd_curr_state_r <= MVD_IDLE;
	else 
		mvd_curr_state_r <= mvd_next_state_r;
end

//mvd_next_state_r 
always @* begin
	if(curr_state_i!=CABAC_mvd)
		mvd_next_state_r = MVD_IDLE;
	else begin
		case(mvd_curr_state_r)
			MVD_IDLE:	mvd_next_state_r = MVD_ENCODE;
			MVD_ENCODE:	if(write_cyc_num_r==8)
							mvd_next_state_r = MVD_DONE;
						else 
							mvd_next_state_r = MVD_ENCODE;
			MVD_DONE:	mvd_next_state_r = MVD_IDLE;
			default:	mvd_next_state_r = MVD_IDLE;
		endcase
	end
end





assign	mvd_x_less9_w = (mvd_x_curr_w[(`FMV_WIDTH-1):0]<9);
assign	mvd_y_less9_w = (mvd_y_curr_w[(`FMV_WIDTH-1):0]<9);

always @* begin
	if(curr_state_i!=CABAC_mvd)
		mvd_encode_total_num_r = 0;
	else if(mvd_x_less9_w && mvd_y_less9_w)
		mvd_encode_total_num_r = 2;
	else if(mvd_x_less9_w)
		mvd_encode_total_num_r = 3;
	else if(mvd_y_less9_w)
		mvd_encode_total_num_r = 3;
	else 
		mvd_encode_total_num_r = 4;
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		mvd_encode_count_r <= 0;
	else if(curr_state_i!=CABAC_mvd)
		mvd_encode_count_r <= 0;
	else if(mvd_curr_state_r==MVD_IDLE)
		mvd_encode_count_r <= 0;
	else if(mvd_encode_count_r==(mvd_encode_total_num_r-1) && trans_en_w)
		mvd_encode_count_r <= 0;
	else if(trans_en_w)
		mvd_encode_count_r <= mvd_encode_count_r + 1;
	else
		mvd_encode_count_r <= mvd_encode_count_r;
end           

always @* begin
	if(mvd_x_less9_w && mvd_encode_count_r>=1)
		y_encode_flag_r = 1;
	else if(~mvd_x_less9_w && mvd_encode_count_r>=2)
		y_encode_flag_r = 1;
	else
		y_encode_flag_r = 0;
end

always @* begin
	if(curr_state_i!=CABAC_mvd)
		prefix_encode_flag_r = 0;
	else if(mvd_idx_r>0 || mvd_idx_encode_r>0) begin
		case(mvd_encode_count_r)
			0:	begin
				prefix_encode_flag_r = 1;
			end
			1:	begin
				if(mvd_x_less9_w)
					prefix_encode_flag_r = 1;
				else
					prefix_encode_flag_r = 0;
			end
			2:	begin
				if(~mvd_x_less9_w)
					prefix_encode_flag_r = 1;
				else
					prefix_encode_flag_r = 0;
			end
			default:
					prefix_encode_flag_r = 0;		
		endcase
	end
	else
		prefix_encode_flag_r = 0;
end

//one mvd encode finish 
always @* begin
	if(mvd_encode_done_r)
		mvd_e_done_r = 0;
	else if(mvd_curr_state_r==MVD_IDLE)
		mvd_e_done_r = 1;
	else if(mvd_encode_count_r==(mvd_encode_total_num_r-1) && trans_en_w)     
		mvd_e_done_r = 1;
	else 
		mvd_e_done_r = 0;
end

//mvd_e_done_delay_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		mvd_e_done_delay_r <= 0;
	else
		mvd_e_done_delay_r <= mvd_e_done_r;
end



//cache_left_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)	
		cache_left_r <= 0;
	else if(mvd_e_done_r) begin
		if(mb_partition_i!=D_8x8)
			cache_left_r <= mvd_encode_r;
		else begin
			case(mvd_idx_encode_r)
				0, 1, 8, 9, 14: begin
								cache_left_r <= mvd_encode_r;
				end
				
				2:			begin
								if(mb_sub_part_encode_r==D_L0_4x4)
									cache_left_r <= mvd_encode_r;
								else
									cache_left_r <= cache_left_r;
				end
				
				3:			begin
								cache_left_r <= cache_top_r;
				end
				
				4, 12:		begin
								case(mb_sub_part_encode_r)
									D_L0_4x4, D_L0_4x8:	cache_left_r <= mvd_encode_r;
									D_L0_8x4, D_L0_8x8: cache_left_r <= cache0_r;
									default:			cache_left_r <= cache_left_r;
								endcase
				end
				
				5, 13:			begin
								if(mb_sub_part_encode_r==D_L0_4x4)
									cache_left_r <= cache0_r;
								else 
									cache_left_r <= cache_left_r;
				end
				
				6, 10:			begin
								if(mb_sub_part_encode_r==D_L0_4x4)
									cache_left_r <= mvd_encode_r;
								else
									cache_left_r <= cache_left_r;
				end
				
				7:			begin
								cache_left_r <= cache0_r;
				end
				
				11:			begin
								cache_left_r <= mvd_top_r;
				end
				
				default:	cache_left_r <= cache_left_r;	
			endcase  
		end
	end
	else
		cache_left_r <= cache_left_r;
end


//cache_top_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		cache_top_r <= 0;
	end    
	else if(mvd_e_done_r) begin
		if(mb_partition_i!=D_8x8)
			cache_top_r <= mvd_encode_r;
		else begin
			case(mvd_idx_encode_r)
				0:	begin
						cache_top_r <= mvd_encode_r;
				end
				
				1:	begin
						cache_top_r <= cache_top_r;
				end
				
				2:	begin
						if(mb_sub_part_encode_r==D_L0_4x4)
							cache_top_r <= cache_left_r;
						else
							cache_top_r <= mvd_encode_r;
				end
				
				3:	begin
						cache_top_r <= cache_left_r;
				end
				
				4:	begin
						if(mb_sub_part_encode_r==D_L0_8x8)
							cache_top_r <= cache_top_r;
						else
							cache_top_r <= mvd_encode_r;
				end
				
				5:	begin
						if(mb_sub_part_encode_r==D_L0_4x4)
							cache_top_r <= cache_top_r;
						else
							cache_top_r <= cache1_r;
				end
				
				6, 7:	begin
						cache_top_r <= cache1_r;
				end
				
				8:	begin
						if(mb_sub_part_encode_r==D_L0_4x4 || mb_sub_part_encode_r==D_L0_4x8) begin
							if(mb_sub_partition_i[3:2]==D_L0_4x8)
								cache_top_r <= cache1_r;
							else
								cache_top_r <= cache_left_r;
						end	
						else if(mb_sub_part_encode_r==D_L0_8x4) begin
							cache_top_r <= mvd_encode_r;
						end
						else begin
							if(mb_sub_partition_i[3:2]==D_L0_4x8)
								cache_top_r <= cache_left_r;
							else
								cache_top_r <= cache0_r;
						end
				end
				
				9, 10:	begin
						if(mb_sub_part_encode_r==D_L0_4x4)
							cache_top_r <= cache_left_r;
						else
							cache_top_r <= cache0_r;
				end
				
				11:		begin
							cache_top_r <= cache0_r;
				end
				
				12:		begin
							case(mb_sub_part_encode_r)
								D_L0_4x4, D_L0_4x8:	cache_top_r <= cache1_r;
								default:			cache_top_r <= mvd_encode_r;								
							endcase
				end
				
				13:		begin
							if(mb_sub_part_encode_r==D_L0_4x4)
								cache_top_r <= cache_left_r;
							else
								cache_top_r <= cache_top_r;
				end
				
				14:		begin
							if(mb_sub_part_encode_r==D_L0_4x4)
								cache_top_r <= cache0_r;
							else
								cache_top_r <= cache_top_r;
				end
					
				default:
						cache_top_r <= cache_top_r;
			endcase
		end
	end
	else
		cache_top_r <= cache_top_r;
end

//cache0_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		cache0_r 	<= 0;
	end    
	else if(mvd_e_done_r) begin
		if(mb_partition_i!=D_8x8)
			cache0_r <= mvd_encode_r;
		else begin
			case(mvd_idx_encode_r) 
				0, 1, 2, 3, 11, 13:	begin
							cache0_r <= mvd_encode_r;
				end
				
				4:		begin
							case(mb_sub_part_encode_r)
								D_L0_4x4, D_L0_4x8:	cache0_r <= cache0_r;
								default:			cache0_r <= mvd_encode_r;
							endcase	
				end
				
				5:		begin
							if(mb_sub_part_encode_r==D_L0_4x4)
								cache0_r <= cache1_r;
							else
								cache0_r <= mvd_encode_r;
				end
				
				6:		begin
							if(mb_sub_part_encode_r==D_L0_4x4)
								cache0_r <= cache_left_r;
							else
								cache0_r <= mvd_encode_r;
				end
				
				7:		begin
							cache0_r <= cache_left_r;
				end
				
				8:		begin
							if(mb_sub_part_encode_r==D_L0_8x8)
								cache0_r <= mvd_encode_r;
							else begin
								if(mb_sub_partition_i[3:2]==D_L0_4x8)
									cache0_r <= cache_left_r;
								else
									cache0_r <= cache0_r;
							end
				end
				
				9, 10, 12:	begin
							if(mb_sub_part_encode_r==D_L0_4x4)
								cache0_r <= cache0_r;
							else 
								cache0_r <= mvd_encode_r;
				end
				
				default:	
							cache0_r <= cache0_r;
			endcase
		end
	end
	else 
		cache0_r <= cache0_r;
end

//cache1_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		cache1_r <= 0;
	end    
	else if(mvd_e_done_r) begin
		if(mb_partition_i!=D_8x8) 
			cache1_r <= mvd_encode_r;
		else begin
			case(mvd_idx_encode_r)
				0, 1, 2, 3, 7, 12, 13: begin
						cache1_r <= mvd_encode_r;
				end
				
				4:		begin
							if(mb_sub_part_encode_r==D_L0_8x8)
								cache1_r <= mvd_encode_r;
							else
								cache1_r <= cache_top_r;
				end
						
				5:		begin
							if(mb_sub_part_encode_r==D_L0_4x4)
								cache1_r <= mvd_encode_r;
							else
								cache1_r <= cache0_r;
				end
				
				6:		begin
							if(mb_sub_part_encode_r==D_L0_4x4)
								cache1_r <= cache0_r;
							else 
								cache1_r <= mvd_encode_r;
				end
				
				8:		begin
							case(mb_sub_partition_i[3:2])
								D_L0_4x4, D_L0_8x4:	cache1_r <= cache1_r;
								default:			cache1_r <= cache0_r;
							endcase
				end
			
			
				9, 10, 11:	begin
							cache1_r <= cache1_r;
				end
				
				default:	
						cache1_r <= cache1_r;				
			endcase
		end
	end
	else
		cache1_r <= cache1_r;
end

			                  











//encode mvd data when mvd_idx_encode_r is range from 0 to 15
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		mvd_encode_r <= 0;
	else if(mvd_encode_done_r)
		mvd_encode_r <= 0;
	else if(mvd_e_done_r)
		mvd_encode_r <= mvd_curr_r;
	else 
		mvd_encode_r <= mvd_encode_r;
end

//left mvd
always @* begin
	case(mvd_idx_encode_r)
		0, 2, 8, 10: begin
			if(mb_x_i==0)
				mvd_left_r = 0;
			else if(mvd_e_done_delay_r)
				mvd_left_r = r_data_mvd_left_w;
			else 
				mvd_left_r = r_data_mvd_left_r;
		end
		default: begin
			mvd_left_r = cache_left_r;
		end
	endcase
end



//top  mvd
always @* begin
	case(mvd_idx_encode_r)
		0, 1, 4, 5:	begin
			if(mb_y_i==0)
				mvd_top_r = 0;
			else if(mvd_e_done_delay_r)
				mvd_top_r = r_data_mvd_top_w;
			else 
				mvd_top_r = r_data_mvd_top_r; 
		end	
		default: begin
			mvd_top_r = cache_top_r;
		end	
	endcase
end






//one sub 8x8 block mvd done flag 
always @* begin
	if(mvd_e_done_r && 
		 ( ((mb_sub_part_r==D_L0_8x8) && (mvd_8x8_sub_idx_r==0))
	    || ((mb_sub_part_r==D_L0_8x4) && (mvd_8x8_sub_idx_r==2))
	    || ((mb_sub_part_r==D_L0_4x8) && (mvd_8x8_sub_idx_r==1))
	    || ((mb_sub_part_r==D_L0_4x4) && (mvd_8x8_sub_idx_r==3)) ) ) begin  	
	    mvd_8x8_done_r = 1'b1;
	end
	else begin
		mvd_8x8_done_r = 1'b0;
	end
end


//mb sub partition
always @* begin
	case(mvd_8x8_idx_r)
		0:	mb_sub_part_r = mb_sub_partition_i[1:0];
		1:	mb_sub_part_r = mb_sub_partition_i[3:2];
		2:	mb_sub_part_r = mb_sub_partition_i[5:4];
		3:	mb_sub_part_r = mb_sub_partition_i[7:6];
		default:	
			mb_sub_part_r = mb_sub_partition_i[1:0];
	endcase
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		mb_sub_part_encode_r <= 0;
	else if(mvd_e_done_r)
		mb_sub_part_encode_r <= mb_sub_part_r;
	else
		mb_sub_part_encode_r <= mb_sub_part_encode_r;
end


//sum of abs mvd_left and abs mvd_top
always @* begin
	if(~y_encode_flag_r)
		abs_ref_mvd_r = mvd_x_left_w[(`FMV_WIDTH-1):0] + mvd_x_top_w[(`FMV_WIDTH-1):0];
	else
		abs_ref_mvd_r = mvd_y_left_w[(`FMV_WIDTH-1):0] + mvd_y_top_w[(`FMV_WIDTH-1):0];
end

//abs of mvd_x or mvd_y
always @* begin
	if(~y_encode_flag_r)
		abs_mvd_r = mvd_x_curr_w[(`FMV_WIDTH-1):0];
	else
		abs_mvd_r = mvd_y_curr_w[(`FMV_WIDTH-1):0];	
end

wire	[1:0]	abs_ref_mvd_dec_w			;	//decide the range of abs_ref_mvd_r
assign	abs_ref_mvd_dec_w = (abs_ref_mvd_r>2) + (abs_ref_mvd_r>32);

reg		[8:0]	ctx_base					;	//mvd_x : 40, mvd_y :47
reg		[8:0]	ctx_addr_mvd_r				;	//real address of ctx addr mvd in memory

always @* begin
	if(curr_state_i!=CABAC_mvd)
		ctx_addr_mvd_r = 0;
	if(~y_encode_flag_r) begin								//mvd_x
		ctx_addr_mvd_r = {3'd0, (5+abs_ref_mvd_dec_w)}; 	//40~42
	end
	else if(y_encode_flag_r) begin 							//mvd_y
		ctx_addr_mvd_r = {3'd0, (8+abs_ref_mvd_dec_w)};		//47~49
	end
	else 
		ctx_addr_mvd_r = 0;
end


//context index of prefix
always @* begin
	if(curr_state_i!=CABAC_mvd) begin
		valid_num_bin_mvd_prefix_r 	= 0;
		ctx_idx_mvd_0_r				= 0;
		ctx_idx_mvd_1_r				= 0;
		ctx_idx_mvd_2_r				= 0;
		ctx_idx_mvd_3_r				= 0;
		ctx_idx_mvd_4_r				= 0;
		ctx_idx_mvd_5_r				= 0;
		ctx_idx_mvd_6_r				= 0;
		ctx_idx_mvd_7_r				= 0;
		ctx_idx_mvd_8_r				= 0;
		bin_string_mvd_prefix_r 	= 0;
	end
	else if(prefix_encode_flag_r) begin
		if(abs_mvd_r<9) begin
			case(abs_mvd_r) 
				0:	begin
						bin_string_mvd_prefix_r     = 9'b000000000;
						ctx_idx_mvd_0_r				= ctx_addr_mvd_r;
						ctx_idx_mvd_1_r				= 0;
						ctx_idx_mvd_2_r				= 0;
						ctx_idx_mvd_3_r				= 0;
						ctx_idx_mvd_4_r				= 0;
						ctx_idx_mvd_5_r				= 0;
						ctx_idx_mvd_6_r				= 0;
						ctx_idx_mvd_7_r				= 0;
						ctx_idx_mvd_8_r				= 0;
						valid_num_bin_mvd_prefix_r  = 1;
				end
				1:	begin 
						bin_string_mvd_prefix_r 	= 9'b10_0000000; 
						ctx_idx_mvd_0_r				= ctx_addr_mvd_r; 
						ctx_idx_mvd_1_r				= y_encode_flag_r ? {3'd1, 6'd8} : {3'd1, 6'd7};		//47+3 : 40 + 3;
						ctx_idx_mvd_2_r				= 0;
						ctx_idx_mvd_3_r				= 0;
						ctx_idx_mvd_4_r				= 0;
						ctx_idx_mvd_5_r				= 0;
						ctx_idx_mvd_6_r				= 0;
						ctx_idx_mvd_7_r				= 0;
						ctx_idx_mvd_8_r				= 0;
						valid_num_bin_mvd_prefix_r 	= (abs_mvd_r + 2); 
					end
				2:	begin 
						bin_string_mvd_prefix_r 	= 9'b110_000000;
						ctx_idx_mvd_0_r 			= ctx_addr_mvd_r; 
						ctx_idx_mvd_1_r				= y_encode_flag_r ? {3'd1, 6'd8} : {3'd1, 6'd7};		//47+3 : 40 + 3;
						ctx_idx_mvd_2_r				= y_encode_flag_r ? {3'd2, 6'd8} : {3'd2, 6'd6};		//47+4 : 40 + 4;
						ctx_idx_mvd_3_r				= 0;
						ctx_idx_mvd_4_r				= 0;
						ctx_idx_mvd_5_r				= 0;
						ctx_idx_mvd_6_r				= 0;
						ctx_idx_mvd_7_r				= 0;
						ctx_idx_mvd_8_r				= 0;
						valid_num_bin_mvd_prefix_r	= (abs_mvd_r + 2);
					end                         	
				3:  begin                       	
						bin_string_mvd_prefix_r 	= 9'b1110_00000;
						ctx_idx_mvd_0_r				= ctx_addr_mvd_r; 
						ctx_idx_mvd_1_r				= y_encode_flag_r ? {3'd1, 6'd8}  : {3'd1, 6'd7};		//47+3 : 40 + 3;
						ctx_idx_mvd_2_r				= y_encode_flag_r ? {3'd2, 6'd8}  : {3'd2, 6'd6};		//47+4 : 40 + 4;
						ctx_idx_mvd_3_r				= y_encode_flag_r ? {3'd3, 6'd11} : {3'd3, 6'd10};		//47+5 : 40 + 5;
						ctx_idx_mvd_4_r				= 0;
						ctx_idx_mvd_5_r				= 0;
						ctx_idx_mvd_6_r				= 0;
						ctx_idx_mvd_7_r				= 0;
						ctx_idx_mvd_8_r				= 0;
						valid_num_bin_mvd_prefix_r	= (abs_mvd_r + 2);                                  	
					end                         	                                                    	
				4:  begin                       	                                                    	
						bin_string_mvd_prefix_r 	= 9'b11110_0000;                                    	
						ctx_idx_mvd_0_r				= ctx_addr_mvd_r;                                   	
						ctx_idx_mvd_1_r				= y_encode_flag_r ? {3'd1, 6'd8}  : {3'd1, 6'd7}; 		//47+3 : 40 + 3;
						ctx_idx_mvd_2_r				= y_encode_flag_r ? {3'd2, 6'd8}  : {3'd2, 6'd6}; 		//47+4 : 40 + 4;
						ctx_idx_mvd_3_r				= y_encode_flag_r ? {3'd3, 6'd11} : {3'd3, 6'd10};		//47+5 : 40 + 5;
						ctx_idx_mvd_4_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 		//47+6 : 40 + 6;
						ctx_idx_mvd_5_r				= 0;
						ctx_idx_mvd_6_r				= 0;
						ctx_idx_mvd_7_r				= 0;
						ctx_idx_mvd_8_r				= 0;
						valid_num_bin_mvd_prefix_r	= (abs_mvd_r + 2);                                  	
					end                         	                                                    	
				5:  begin                       	                                                    	
						bin_string_mvd_prefix_r 	= 9'b111110_000;                                    	
						ctx_idx_mvd_0_r				= ctx_addr_mvd_r;                                   	
						ctx_idx_mvd_1_r				= y_encode_flag_r ? {3'd1, 6'd8}  : {3'd1, 6'd7}; 		//47+3 : 40 + 3; 
						ctx_idx_mvd_2_r				= y_encode_flag_r ? {3'd2, 6'd8}  : {3'd2, 6'd6}; 		//47+4 : 40 + 4; 
						ctx_idx_mvd_3_r				= y_encode_flag_r ? {3'd3, 6'd11} : {3'd3, 6'd10};		//47+5 : 40 + 5; 
						ctx_idx_mvd_4_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 		//47+6 : 40 + 6; 
						ctx_idx_mvd_5_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 		//47+6 : 40 + 6;
						ctx_idx_mvd_6_r				= 0;
						ctx_idx_mvd_7_r				= 0;
						ctx_idx_mvd_8_r				= 0;
						valid_num_bin_mvd_prefix_r	= (abs_mvd_r + 2);                                  	
					end                         	                                                    	
				6:  begin                       	                                                    	
						bin_string_mvd_prefix_r 	= 9'b1111110_00;                                    	
						ctx_idx_mvd_0_r				= ctx_addr_mvd_r;                                   	
						ctx_idx_mvd_1_r				= y_encode_flag_r ? {3'd1, 6'd8}  : {3'd1, 6'd7}; 		//47+3 : 40 + 3;
						ctx_idx_mvd_2_r				= y_encode_flag_r ? {3'd2, 6'd8}  : {3'd2, 6'd6}; 		//47+4 : 40 + 4;
						ctx_idx_mvd_3_r				= y_encode_flag_r ? {3'd3, 6'd11} : {3'd3, 6'd10};		//47+5 : 40 + 5;
						ctx_idx_mvd_4_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 		//47+6 : 40 + 6;
						ctx_idx_mvd_5_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 		//47+6 : 40 + 6;
						ctx_idx_mvd_6_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 		//47+6 : 40 + 6;   
						ctx_idx_mvd_7_r				= 0;
						ctx_idx_mvd_8_r				= 0;
						valid_num_bin_mvd_prefix_r	= (abs_mvd_r + 2);
					end                         	
				7:  begin                       	
						bin_string_mvd_prefix_r 	= 9'b11111110_0;
						ctx_idx_mvd_0_r				= ctx_addr_mvd_r; 
						ctx_idx_mvd_1_r				= y_encode_flag_r ? {3'd1, 6'd8}  : {3'd1, 6'd7}; 	//47+3 : 40 + 3;  
						ctx_idx_mvd_2_r				= y_encode_flag_r ? {3'd2, 6'd8}  : {3'd2, 6'd6}; 	//47+4 : 40 + 4;  
						ctx_idx_mvd_3_r				= y_encode_flag_r ? {3'd3, 6'd11} : {3'd3, 6'd10};	//47+5 : 40 + 5;  
						ctx_idx_mvd_4_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 	//47+6 : 40 + 6;  
						ctx_idx_mvd_5_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 	//47+6 : 40 + 6;  
						ctx_idx_mvd_6_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 	//47+6 : 40 + 6;  
						ctx_idx_mvd_7_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 	//47+6 : 40 + 6;   
						ctx_idx_mvd_8_r				= 0;
						valid_num_bin_mvd_prefix_r	= (abs_mvd_r + 2);
					end                         	
				8:	begin                       	
						bin_string_mvd_prefix_r 	= 9'b111111110;
						ctx_idx_mvd_0_r				= ctx_addr_mvd_r; 
						ctx_idx_mvd_1_r				= y_encode_flag_r ? {3'd1, 6'd8}  : {3'd1, 6'd7}; 	//47+3 : 40 + 3;      
						ctx_idx_mvd_2_r				= y_encode_flag_r ? {3'd2, 6'd8}  : {3'd2, 6'd6}; 	//47+4 : 40 + 4;      
						ctx_idx_mvd_3_r				= y_encode_flag_r ? {3'd3, 6'd11} : {3'd3, 6'd10};	//47+5 : 40 + 5;      
						ctx_idx_mvd_4_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 	//47+6 : 40 + 6;      
						ctx_idx_mvd_5_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 	//47+6 : 40 + 6;      
						ctx_idx_mvd_6_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 	//47+6 : 40 + 6;      
						ctx_idx_mvd_7_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 	//47+6 : 40 + 6;      
						ctx_idx_mvd_8_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 	//47+6 : 40 + 6;    
						valid_num_bin_mvd_prefix_r	= (abs_mvd_r + 2);
					end		                    	
				default:                        	
					begin                       	
						bin_string_mvd_prefix_r 	= 0;
						ctx_idx_mvd_0_r				= 0;
						ctx_idx_mvd_1_r				= 0;
						ctx_idx_mvd_2_r				= 0;
						ctx_idx_mvd_3_r				= 0;
						ctx_idx_mvd_4_r				= 0;
						ctx_idx_mvd_5_r				= 0;
						ctx_idx_mvd_6_r				= 0;
						ctx_idx_mvd_7_r				= 0;
						ctx_idx_mvd_8_r				= 0;
						valid_num_bin_mvd_prefix_r	= 0;
					end
			endcase
		end
		else begin
			bin_string_mvd_prefix_r 	= 9'b111111111;
			ctx_idx_mvd_0_r				= ctx_addr_mvd_r; 
			ctx_idx_mvd_1_r				= y_encode_flag_r ? {3'd1, 6'd8}  : {3'd1, 6'd7}; 				//47+3 : 40 + 3;
			ctx_idx_mvd_2_r				= y_encode_flag_r ? {3'd2, 6'd8}  : {3'd2, 6'd6}; 				//47+4 : 40 + 4;
			ctx_idx_mvd_3_r				= y_encode_flag_r ? {3'd3, 6'd11} : {3'd3, 6'd10};				//47+5 : 40 + 5;
			ctx_idx_mvd_4_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 				//47+6 : 40 + 6;
			ctx_idx_mvd_5_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 				//47+6 : 40 + 6;
			ctx_idx_mvd_6_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 				//47+6 : 40 + 6;
			ctx_idx_mvd_7_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 				//47+6 : 40 + 6;
			ctx_idx_mvd_8_r				= y_encode_flag_r ? {3'd2, 6'd9}  : {3'd2, 6'd7}; 				//47+6 : 40 + 6;
			valid_num_bin_mvd_prefix_r	= 9;
		end
	end
	else begin
		bin_string_mvd_prefix_r 		= 0;
		ctx_idx_mvd_0_r					= 0;
		ctx_idx_mvd_1_r					= 0;
		ctx_idx_mvd_2_r					= 0;
		ctx_idx_mvd_3_r					= 0;
		ctx_idx_mvd_4_r					= 0;
		ctx_idx_mvd_5_r					= 0;
		ctx_idx_mvd_6_r					= 0;
		ctx_idx_mvd_7_r					= 0;
		ctx_idx_mvd_8_r					= 0;
		valid_num_bin_mvd_prefix_r      = 0;
	end
end

always @* begin
	mvd_bypass_length_r = (mvd_suffix_length_r + mvd_suffix_length_r + 4);
end

wire	[`FMV_WIDTH:0]	abs_mvd_minus1_w			;
wire	[`FMV_WIDTH:0]	abs_mvd_bypass_minus8_w		;
wire	[`FMV_WIDTH:0]	abs_mvd_bypass_minus24_w	;
wire	[`FMV_WIDTH:0]	abs_mvd_bypass_minus56_w	;
wire	[`FMV_WIDTH:0]	abs_mvd_bypass_minus120_w	;
wire	[`FMV_WIDTH:0]	abs_mvd_bypass_minus248_w	;


always @* begin
	if(abs_mvd_minus1_w[7]) begin
		mvd_suffix_length_r = 4;
	end
	else if(abs_mvd_minus1_w[6]) begin
		mvd_suffix_length_r = 3;
	end
	else if(abs_mvd_minus1_w[5]) begin
		mvd_suffix_length_r = 2;
	end
	else if(abs_mvd_minus1_w[4]) begin
		mvd_suffix_length_r = 1;
	end
	else begin
		mvd_suffix_length_r = 0;
	end
end



assign	abs_mvd_minus1_w  		  = abs_mvd_r - 1;
assign	abs_mvd_bypass_minus8_w   = abs_mvd_r - 17;
assign	abs_mvd_bypass_minus24_w  = abs_mvd_r - 33;
assign	abs_mvd_bypass_minus56_w  = abs_mvd_r - 65;
assign	abs_mvd_bypass_minus120_w = abs_mvd_r - 129;
assign	abs_mvd_bypass_minus248_w = abs_mvd_r - 257;

always @* begin
	case(mvd_bypass_length_r)
		0:	bin_string_mvd_suffix_r = 16'd0;
		4:  bin_string_mvd_suffix_r = {1'b0, 	  abs_mvd_minus1_w[2:0],          12'd0};
		6:  bin_string_mvd_suffix_r = {2'b10,     abs_mvd_bypass_minus8_w[3:0],   10'd0};
		8:  bin_string_mvd_suffix_r = {3'b110,    abs_mvd_bypass_minus24_w[4:0],  8'd0 };
		10: bin_string_mvd_suffix_r = {4'b1110,   abs_mvd_bypass_minus56_w[5:0],  6'd0 };
		12: bin_string_mvd_suffix_r = {5'b11110,  abs_mvd_bypass_minus120_w[6:0], 4'd0 };
		14: bin_string_mvd_suffix_r = {6'b111110, abs_mvd_bypass_minus248_w[7:0], 2'd0 };
		default:
			bin_string_mvd_suffix_r = 16'd0;
	
	endcase
end




//valid_num_bin_mvd_r
always @* begin
	if(curr_state_i!=CABAC_mvd)
		valid_num_bin_mvd_r = 0;
	else if(mvd_curr_state_r==MVD_IDLE)
		valid_num_bin_mvd_r = 0;
	else if(prefix_encode_flag_r) begin
		if(abs_mvd_r>=9) begin
			valid_num_bin_mvd_r = 9;
		end
		else begin
			valid_num_bin_mvd_r = valid_num_bin_mvd_prefix_r;
		end
	end
	else begin
		if(abs_mvd_r<9)
			valid_num_bin_mvd_r = 0;
		else begin
			case(mvd_bypass_length_r)
				4:	valid_num_bin_mvd_r = 5;
				6:	valid_num_bin_mvd_r = 7;
				8:	valid_num_bin_mvd_r = 9;
				10:	valid_num_bin_mvd_r = 11;
				12:	valid_num_bin_mvd_r = 13;				
				default:valid_num_bin_mvd_r = 0;
			endcase
		end
	end
end








always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		ctx_pair_mvd_0_o  	<= 0;
		ctx_pair_mvd_1_o  	<= 0;
		ctx_pair_mvd_2_o  	<= 0;
		ctx_pair_mvd_3_o  	<= 0;
		ctx_pair_mvd_4_o  	<= 0;
		ctx_pair_mvd_5_o  	<= 0;
		ctx_pair_mvd_6_o  	<= 0;
		ctx_pair_mvd_7_o  	<= 0;
		ctx_pair_mvd_8_o  	<= 0;
		ctx_pair_mvd_8_o  	<= 0;
		ctx_pair_mvd_10_o 	<= 0;
		ctx_pair_mvd_11_o 	<= 0;
		ctx_pair_mvd_12_o 	<= 0;
		ctx_pair_mvd_13_o 	<= 0;
		ctx_pair_mvd_14_o 	<= 0;
		ctx_pair_mvd_15_o 	<= 0;
		valid_num_bin_mvd_o <= 0;
	end
	else if(curr_state_i!=CABAC_mvd)
		valid_num_bin_mvd_o <= 0;
	else if(mvd_curr_state_r==MVD_IDLE)
		valid_num_bin_mvd_o <= 0;
	else if(mvd_encode_done_r)
		valid_num_bin_mvd_o <= 0;
	else if(prefix_encode_flag_r) begin
		if(abs_mvd_r>=9) begin
			ctx_pair_mvd_0_o  	<= ctx_pair_mvd_prefix_0_w;
			ctx_pair_mvd_1_o  	<= ctx_pair_mvd_prefix_1_w;
			ctx_pair_mvd_2_o  	<= ctx_pair_mvd_prefix_2_w;
			ctx_pair_mvd_3_o  	<= ctx_pair_mvd_prefix_3_w;
			ctx_pair_mvd_4_o  	<= ctx_pair_mvd_prefix_4_w;
			ctx_pair_mvd_5_o  	<= ctx_pair_mvd_prefix_5_w;
			ctx_pair_mvd_6_o  	<= ctx_pair_mvd_prefix_6_w;
			ctx_pair_mvd_7_o  	<= ctx_pair_mvd_prefix_7_w;
			ctx_pair_mvd_8_o  	<= ctx_pair_mvd_prefix_8_w;
			ctx_pair_mvd_9_o  	<= 0;
			ctx_pair_mvd_10_o 	<= 0;
			ctx_pair_mvd_11_o 	<= 0;
			ctx_pair_mvd_12_o 	<= 0;
			ctx_pair_mvd_13_o 	<= 0;
			ctx_pair_mvd_14_o 	<= 0;
			ctx_pair_mvd_15_o 	<= 0;
			valid_num_bin_mvd_o <= 9;			
		end
		else begin
			case(abs_mvd_r)
				0:	begin
						ctx_pair_mvd_0_o  	<= ctx_pair_mvd_prefix_0_w;
						ctx_pair_mvd_1_o  	<= 0;
						ctx_pair_mvd_2_o  	<= 0;
						ctx_pair_mvd_3_o  	<= 0;
						ctx_pair_mvd_4_o  	<= 0;
						ctx_pair_mvd_5_o  	<= 0;
						ctx_pair_mvd_6_o  	<= 0;
						ctx_pair_mvd_7_o  	<= 0;
						ctx_pair_mvd_8_o  	<= 0;
						ctx_pair_mvd_9_o  	<= 0;
						ctx_pair_mvd_10_o 	<= 0;
						ctx_pair_mvd_11_o 	<= 0;
						ctx_pair_mvd_12_o 	<= 0;
						ctx_pair_mvd_13_o 	<= 0;
						ctx_pair_mvd_14_o 	<= 0;
						ctx_pair_mvd_15_o 	<= 0;
						valid_num_bin_mvd_o <= valid_num_bin_mvd_prefix_r;	
					end
				1:	begin
						ctx_pair_mvd_0_o  	<= ctx_pair_mvd_prefix_0_w;
						ctx_pair_mvd_1_o  	<= ctx_pair_mvd_prefix_1_w;
						ctx_pair_mvd_2_o  	<= ctx_pair_mvd_bypass_w;
						ctx_pair_mvd_3_o  	<= 0;
						ctx_pair_mvd_4_o  	<= 0;
						ctx_pair_mvd_5_o  	<= 0;
						ctx_pair_mvd_6_o  	<= 0;
						ctx_pair_mvd_7_o  	<= 0;
						ctx_pair_mvd_8_o  	<= 0;
						ctx_pair_mvd_9_o  	<= 0;
						ctx_pair_mvd_10_o 	<= 0;
						ctx_pair_mvd_11_o 	<= 0;
						ctx_pair_mvd_12_o 	<= 0;
						ctx_pair_mvd_13_o 	<= 0;
						ctx_pair_mvd_14_o 	<= 0;
						ctx_pair_mvd_15_o 	<= 0;
						valid_num_bin_mvd_o <= valid_num_bin_mvd_prefix_r;
					end
				2:	begin
						ctx_pair_mvd_0_o  	<= ctx_pair_mvd_prefix_0_w;
						ctx_pair_mvd_1_o  	<= ctx_pair_mvd_prefix_1_w;
						ctx_pair_mvd_2_o  	<= ctx_pair_mvd_prefix_2_w;
						ctx_pair_mvd_3_o  	<= ctx_pair_mvd_bypass_w;
						ctx_pair_mvd_4_o  	<= 0;
						ctx_pair_mvd_5_o  	<= 0;
						ctx_pair_mvd_6_o  	<= 0;
						ctx_pair_mvd_7_o  	<= 0;
						ctx_pair_mvd_8_o  	<= 0;
						ctx_pair_mvd_9_o  	<= 0;
						ctx_pair_mvd_10_o 	<= 0;
						ctx_pair_mvd_11_o 	<= 0;
						ctx_pair_mvd_12_o 	<= 0;
						ctx_pair_mvd_13_o 	<= 0;
						ctx_pair_mvd_14_o 	<= 0;
						ctx_pair_mvd_15_o 	<= 0;
						valid_num_bin_mvd_o <= valid_num_bin_mvd_prefix_r;
					end
				3: 	begin
						ctx_pair_mvd_0_o  	<= ctx_pair_mvd_prefix_0_w;
						ctx_pair_mvd_1_o  	<= ctx_pair_mvd_prefix_1_w;
						ctx_pair_mvd_2_o  	<= ctx_pair_mvd_prefix_2_w;
						ctx_pair_mvd_3_o  	<= ctx_pair_mvd_prefix_3_w;
						ctx_pair_mvd_4_o  	<= ctx_pair_mvd_bypass_w;
						ctx_pair_mvd_5_o  	<= 0;
						ctx_pair_mvd_6_o  	<= 0;
						ctx_pair_mvd_7_o  	<= 0;
						ctx_pair_mvd_8_o  	<= 0;
						ctx_pair_mvd_9_o  	<= 0;
						ctx_pair_mvd_10_o 	<= 0;
						ctx_pair_mvd_11_o 	<= 0;
						ctx_pair_mvd_12_o 	<= 0;
						ctx_pair_mvd_13_o 	<= 0;
						ctx_pair_mvd_14_o 	<= 0;
						ctx_pair_mvd_15_o 	<= 0;
						valid_num_bin_mvd_o <= valid_num_bin_mvd_prefix_r;
					end
				4:	begin
						ctx_pair_mvd_0_o  	<= ctx_pair_mvd_prefix_0_w;
						ctx_pair_mvd_1_o  	<= ctx_pair_mvd_prefix_1_w;
						ctx_pair_mvd_2_o  	<= ctx_pair_mvd_prefix_2_w;
						ctx_pair_mvd_3_o  	<= ctx_pair_mvd_prefix_3_w;
						ctx_pair_mvd_4_o  	<= ctx_pair_mvd_prefix_4_w;
						ctx_pair_mvd_5_o  	<= ctx_pair_mvd_bypass_w;
						ctx_pair_mvd_6_o  	<= 0;
						ctx_pair_mvd_7_o  	<= 0;
						ctx_pair_mvd_8_o  	<= 0;
						ctx_pair_mvd_9_o  	<= 0;
						ctx_pair_mvd_10_o 	<= 0;
						ctx_pair_mvd_11_o 	<= 0;
						ctx_pair_mvd_12_o 	<= 0;
						ctx_pair_mvd_13_o 	<= 0;
						ctx_pair_mvd_14_o 	<= 0;
						ctx_pair_mvd_15_o 	<= 0;
						valid_num_bin_mvd_o <= valid_num_bin_mvd_prefix_r;
					end
				5:	begin
						ctx_pair_mvd_0_o  	<= ctx_pair_mvd_prefix_0_w;
						ctx_pair_mvd_1_o  	<= ctx_pair_mvd_prefix_1_w;
						ctx_pair_mvd_2_o  	<= ctx_pair_mvd_prefix_2_w;
						ctx_pair_mvd_3_o  	<= ctx_pair_mvd_prefix_3_w;
						ctx_pair_mvd_4_o  	<= ctx_pair_mvd_prefix_4_w;
						ctx_pair_mvd_5_o  	<= ctx_pair_mvd_prefix_5_w;
						ctx_pair_mvd_6_o  	<= ctx_pair_mvd_bypass_w;
						ctx_pair_mvd_7_o  	<= 0;
						ctx_pair_mvd_8_o  	<= 0;
						ctx_pair_mvd_9_o  	<= 0;
						ctx_pair_mvd_10_o 	<= 0;
						ctx_pair_mvd_11_o 	<= 0;
						ctx_pair_mvd_12_o 	<= 0;
						ctx_pair_mvd_13_o 	<= 0;
						ctx_pair_mvd_14_o 	<= 0;
						ctx_pair_mvd_15_o 	<= 0;
						valid_num_bin_mvd_o <= valid_num_bin_mvd_prefix_r;
					end
				6:	begin
						ctx_pair_mvd_0_o  	<= ctx_pair_mvd_prefix_0_w;
						ctx_pair_mvd_1_o  	<= ctx_pair_mvd_prefix_1_w;
						ctx_pair_mvd_2_o  	<= ctx_pair_mvd_prefix_2_w;
						ctx_pair_mvd_3_o  	<= ctx_pair_mvd_prefix_3_w;
						ctx_pair_mvd_4_o  	<= ctx_pair_mvd_prefix_4_w;
						ctx_pair_mvd_5_o  	<= ctx_pair_mvd_prefix_5_w;
						ctx_pair_mvd_6_o  	<= ctx_pair_mvd_prefix_6_w;
						ctx_pair_mvd_7_o  	<= ctx_pair_mvd_bypass_w;
						ctx_pair_mvd_8_o  	<= 0;
						ctx_pair_mvd_9_o  	<= 0;
						ctx_pair_mvd_10_o 	<= 0;
						ctx_pair_mvd_11_o 	<= 0;
						ctx_pair_mvd_12_o 	<= 0;
						ctx_pair_mvd_13_o 	<= 0;
						ctx_pair_mvd_14_o 	<= 0;
						ctx_pair_mvd_15_o 	<= 0;
						valid_num_bin_mvd_o <= valid_num_bin_mvd_prefix_r;
					end
				7:	begin
						ctx_pair_mvd_0_o  	<= ctx_pair_mvd_prefix_0_w;
						ctx_pair_mvd_1_o  	<= ctx_pair_mvd_prefix_1_w;
						ctx_pair_mvd_2_o  	<= ctx_pair_mvd_prefix_2_w;
						ctx_pair_mvd_3_o  	<= ctx_pair_mvd_prefix_3_w;
						ctx_pair_mvd_4_o  	<= ctx_pair_mvd_prefix_4_w;
						ctx_pair_mvd_5_o  	<= ctx_pair_mvd_prefix_5_w;
						ctx_pair_mvd_6_o  	<= ctx_pair_mvd_prefix_6_w;
						ctx_pair_mvd_7_o  	<= ctx_pair_mvd_prefix_7_w;
						ctx_pair_mvd_8_o  	<= ctx_pair_mvd_bypass_w;
						ctx_pair_mvd_9_o  	<= 0;
						ctx_pair_mvd_10_o 	<= 0;
						ctx_pair_mvd_11_o 	<= 0;
						ctx_pair_mvd_12_o 	<= 0;
						ctx_pair_mvd_13_o 	<= 0;
						ctx_pair_mvd_14_o 	<= 0;
						ctx_pair_mvd_15_o 	<= 0;
						valid_num_bin_mvd_o <= valid_num_bin_mvd_prefix_r;
					end
				8:	begin
						ctx_pair_mvd_0_o  	<= ctx_pair_mvd_prefix_0_w;
						ctx_pair_mvd_1_o  	<= ctx_pair_mvd_prefix_1_w;
						ctx_pair_mvd_2_o  	<= ctx_pair_mvd_prefix_2_w;
						ctx_pair_mvd_3_o  	<= ctx_pair_mvd_prefix_3_w;
						ctx_pair_mvd_4_o  	<= ctx_pair_mvd_prefix_4_w;
						ctx_pair_mvd_5_o  	<= ctx_pair_mvd_prefix_5_w;
						ctx_pair_mvd_6_o  	<= ctx_pair_mvd_prefix_6_w;
						ctx_pair_mvd_7_o  	<= ctx_pair_mvd_prefix_7_w;
						ctx_pair_mvd_8_o  	<= ctx_pair_mvd_prefix_8_w;
						ctx_pair_mvd_9_o  	<= ctx_pair_mvd_bypass_w;
						ctx_pair_mvd_10_o 	<= 0;
						ctx_pair_mvd_11_o 	<= 0;
						ctx_pair_mvd_12_o 	<= 0;
						ctx_pair_mvd_13_o 	<= 0;
						ctx_pair_mvd_14_o 	<= 0;
						ctx_pair_mvd_15_o 	<= 0;
						valid_num_bin_mvd_o <= valid_num_bin_mvd_prefix_r;
					end
				default:	begin
								ctx_pair_mvd_0_o  	<= 0;
								ctx_pair_mvd_1_o  	<= 0;
								ctx_pair_mvd_2_o  	<= 0;
								ctx_pair_mvd_3_o  	<= 0;
								ctx_pair_mvd_4_o  	<= 0;
								ctx_pair_mvd_5_o  	<= 0;
								ctx_pair_mvd_6_o  	<= 0;
								ctx_pair_mvd_7_o  	<= 0;
								ctx_pair_mvd_8_o  	<= 0;
								ctx_pair_mvd_9_o  	<= 0;
								ctx_pair_mvd_10_o 	<= 0;
								ctx_pair_mvd_11_o 	<= 0;
								ctx_pair_mvd_12_o 	<= 0;
								ctx_pair_mvd_13_o 	<= 0;
								ctx_pair_mvd_14_o 	<= 0;
								ctx_pair_mvd_15_o 	<= 0;
								valid_num_bin_mvd_o <= 0;
							end				
			endcase
		end
	end
	else if(~prefix_encode_flag_r) begin
		if(abs_mvd_r<9) begin
			ctx_pair_mvd_0_o  	<= 0;
			ctx_pair_mvd_1_o  	<= 0;
			ctx_pair_mvd_2_o  	<= 0;
			ctx_pair_mvd_3_o  	<= 0;
			ctx_pair_mvd_4_o  	<= 0;
			ctx_pair_mvd_5_o  	<= 0;
			ctx_pair_mvd_6_o  	<= 0;
			ctx_pair_mvd_7_o  	<= 0;
			ctx_pair_mvd_8_o  	<= 0;
			ctx_pair_mvd_9_o  	<= 0;
			ctx_pair_mvd_10_o 	<= 0;
			ctx_pair_mvd_11_o 	<= 0;
			ctx_pair_mvd_12_o 	<= 0;
			ctx_pair_mvd_13_o 	<= 0;
			ctx_pair_mvd_14_o 	<= 0;
			ctx_pair_mvd_15_o 	<= 0;
			valid_num_bin_mvd_o <= 0;
		end
		else begin
			case(mvd_bypass_length_r)
				4:	begin
					ctx_pair_mvd_0_o  	<= {2'b01, bin_string_mvd_suffix_r[15], 9'd511};
					ctx_pair_mvd_1_o  	<= {2'b01, bin_string_mvd_suffix_r[14], 9'd511};
					ctx_pair_mvd_2_o  	<= {2'b01, bin_string_mvd_suffix_r[13], 9'd511};
					ctx_pair_mvd_3_o  	<= {2'b01, bin_string_mvd_suffix_r[12], 9'd511};
					ctx_pair_mvd_4_o  	<= ctx_pair_mvd_bypass_w;
					ctx_pair_mvd_5_o  	<= 0;
					ctx_pair_mvd_6_o  	<= 0;
					ctx_pair_mvd_7_o  	<= 0;
					ctx_pair_mvd_8_o  	<= 0;
					ctx_pair_mvd_9_o  	<= 0;
					ctx_pair_mvd_10_o 	<= 0;
					ctx_pair_mvd_11_o 	<= 0;
					ctx_pair_mvd_12_o 	<= 0;
					ctx_pair_mvd_13_o 	<= 0;
					ctx_pair_mvd_14_o 	<= 0;
					ctx_pair_mvd_15_o 	<= 0;
					valid_num_bin_mvd_o <= 5;
				end
				6:	begin
						ctx_pair_mvd_0_o  	<= {2'b01, bin_string_mvd_suffix_r[15], 9'd511};
						ctx_pair_mvd_1_o  	<= {2'b01, bin_string_mvd_suffix_r[14], 9'd511};
						ctx_pair_mvd_2_o  	<= {2'b01, bin_string_mvd_suffix_r[13], 9'd511};
						ctx_pair_mvd_3_o  	<= {2'b01, bin_string_mvd_suffix_r[12], 9'd511};
						ctx_pair_mvd_4_o  	<= {2'b01, bin_string_mvd_suffix_r[11], 9'd511};
						ctx_pair_mvd_5_o  	<= {2'b01, bin_string_mvd_suffix_r[10], 9'd511};
						ctx_pair_mvd_6_o  	<= ctx_pair_mvd_bypass_w;
						ctx_pair_mvd_7_o  	<= 0;
						ctx_pair_mvd_8_o  	<= 0;
						ctx_pair_mvd_9_o  	<= 0;
						ctx_pair_mvd_10_o 	<= 0;
						ctx_pair_mvd_11_o 	<= 0;
						ctx_pair_mvd_12_o 	<= 0;
						ctx_pair_mvd_13_o 	<= 0;
						ctx_pair_mvd_14_o 	<= 0;
						ctx_pair_mvd_15_o 	<= 0;
						valid_num_bin_mvd_o <= 7;
				end
				8:	begin
						ctx_pair_mvd_0_o  	<= {2'b01, bin_string_mvd_suffix_r[15], 9'd511};
						ctx_pair_mvd_1_o  	<= {2'b01, bin_string_mvd_suffix_r[14], 9'd511};
						ctx_pair_mvd_2_o  	<= {2'b01, bin_string_mvd_suffix_r[13], 9'd511};
						ctx_pair_mvd_3_o  	<= {2'b01, bin_string_mvd_suffix_r[12], 9'd511};
						ctx_pair_mvd_4_o  	<= {2'b01, bin_string_mvd_suffix_r[11], 9'd511};
						ctx_pair_mvd_5_o  	<= {2'b01, bin_string_mvd_suffix_r[10], 9'd511};
						ctx_pair_mvd_6_o  	<= {2'b01, bin_string_mvd_suffix_r[9], 9'd511};
						ctx_pair_mvd_7_o  	<= {2'b01, bin_string_mvd_suffix_r[8], 9'd511};
						ctx_pair_mvd_8_o  	<= ctx_pair_mvd_bypass_w;
						ctx_pair_mvd_9_o  	<= 0;
						ctx_pair_mvd_10_o 	<= 0;
						ctx_pair_mvd_11_o 	<= 0;
						ctx_pair_mvd_12_o 	<= 0;
						ctx_pair_mvd_13_o 	<= 0;
						ctx_pair_mvd_14_o 	<= 0;
						ctx_pair_mvd_15_o 	<= 0;
						valid_num_bin_mvd_o <= 9;
				end
				10:	begin
						ctx_pair_mvd_0_o  	<= {2'b01, bin_string_mvd_suffix_r[15], 9'd511};
						ctx_pair_mvd_1_o  	<= {2'b01, bin_string_mvd_suffix_r[14], 9'd511};
						ctx_pair_mvd_2_o  	<= {2'b01, bin_string_mvd_suffix_r[13], 9'd511};
						ctx_pair_mvd_3_o  	<= {2'b01, bin_string_mvd_suffix_r[12], 9'd511};
						ctx_pair_mvd_4_o  	<= {2'b01, bin_string_mvd_suffix_r[11], 9'd511};
						ctx_pair_mvd_5_o  	<= {2'b01, bin_string_mvd_suffix_r[10], 9'd511};
						ctx_pair_mvd_6_o  	<= {2'b01, bin_string_mvd_suffix_r[9], 9'd511};
						ctx_pair_mvd_7_o  	<= {2'b01, bin_string_mvd_suffix_r[8], 9'd511};
						ctx_pair_mvd_8_o  	<= {2'b01, bin_string_mvd_suffix_r[7], 9'd511};
						ctx_pair_mvd_9_o  	<= {2'b01, bin_string_mvd_suffix_r[6], 9'd511};
						ctx_pair_mvd_10_o 	<= ctx_pair_mvd_bypass_w;
						ctx_pair_mvd_11_o 	<= 0;
						ctx_pair_mvd_12_o 	<= 0;
						ctx_pair_mvd_13_o 	<= 0;
						ctx_pair_mvd_14_o 	<= 0;
						ctx_pair_mvd_15_o 	<= 0;
						valid_num_bin_mvd_o <= 11;
				end
				12: begin
						ctx_pair_mvd_0_o  	<= {2'b01, bin_string_mvd_suffix_r[15], 9'd511};
						ctx_pair_mvd_1_o  	<= {2'b01, bin_string_mvd_suffix_r[14], 9'd511};
						ctx_pair_mvd_2_o  	<= {2'b01, bin_string_mvd_suffix_r[13], 9'd511};
						ctx_pair_mvd_3_o  	<= {2'b01, bin_string_mvd_suffix_r[12], 9'd511};
						ctx_pair_mvd_4_o  	<= {2'b01, bin_string_mvd_suffix_r[11], 9'd511};
						ctx_pair_mvd_5_o  	<= {2'b01, bin_string_mvd_suffix_r[10], 9'd511};
						ctx_pair_mvd_6_o  	<= {2'b01, bin_string_mvd_suffix_r[9], 9'd511};
						ctx_pair_mvd_7_o  	<= {2'b01, bin_string_mvd_suffix_r[8], 9'd511};
						ctx_pair_mvd_8_o  	<= {2'b01, bin_string_mvd_suffix_r[7], 9'd511};
						ctx_pair_mvd_9_o  	<= {2'b01, bin_string_mvd_suffix_r[6], 9'd511};
						ctx_pair_mvd_10_o 	<= {2'b01, bin_string_mvd_suffix_r[5], 9'd511};
						ctx_pair_mvd_11_o 	<= {2'b01, bin_string_mvd_suffix_r[4], 9'd511};
						ctx_pair_mvd_12_o 	<= ctx_pair_mvd_bypass_w;
						ctx_pair_mvd_13_o 	<= 0;
						ctx_pair_mvd_14_o 	<= 0;
						ctx_pair_mvd_15_o 	<= 0;
						valid_num_bin_mvd_o <= 13;
				end
				default:	begin
					ctx_pair_mvd_0_o  	<= 0;
					ctx_pair_mvd_1_o  	<= 0;
					ctx_pair_mvd_2_o  	<= 0;
					ctx_pair_mvd_3_o  	<= 0;
					ctx_pair_mvd_4_o  	<= 0;
					ctx_pair_mvd_5_o  	<= 0;
					ctx_pair_mvd_6_o  	<= 0;
					ctx_pair_mvd_7_o  	<= 0;
					ctx_pair_mvd_8_o  	<= 0;
					ctx_pair_mvd_9_o  	<= 0;
					ctx_pair_mvd_10_o 	<= 0;
					ctx_pair_mvd_11_o 	<= 0;
					ctx_pair_mvd_12_o 	<= 0;
					ctx_pair_mvd_13_o 	<= 0;
					ctx_pair_mvd_14_o 	<= 0;
					ctx_pair_mvd_15_o 	<= 0;
					valid_num_bin_mvd_o <= 0;
				end
			endcase
		end
	end
	else begin
		ctx_pair_mvd_0_o  	<= 0;
		ctx_pair_mvd_1_o  	<= 0;
		ctx_pair_mvd_2_o  	<= 0;
		ctx_pair_mvd_3_o  	<= 0;
		ctx_pair_mvd_4_o  	<= 0;
		ctx_pair_mvd_5_o  	<= 0;
		ctx_pair_mvd_6_o  	<= 0;
		ctx_pair_mvd_7_o  	<= 0;
		ctx_pair_mvd_8_o  	<= 0;
		ctx_pair_mvd_9_o  	<= 0;
		ctx_pair_mvd_10_o 	<= 0;
		ctx_pair_mvd_11_o 	<= 0;
		ctx_pair_mvd_12_o 	<= 0;
		ctx_pair_mvd_13_o 	<= 0;
		ctx_pair_mvd_14_o 	<= 0;
		ctx_pair_mvd_15_o 	<= 0;
		valid_num_bin_mvd_o <= 0;
	end	
end




















// ********************************************
//                                             
//    Sequential Logic              
//                                             
// ********************************************

//mvd done flag
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		mvd_done_o <= 0;
	else if(curr_state_i==CABAC_mvd && write_cyc_num_r==7)
		mvd_done_o <= 1;
	else 
		mvd_done_o <= 0;
end

//mvd encode done flag
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		mvd_encode_done_r <= 0;
	else if((mvd_curr_state_r==MVD_ENCODE) && (mb_partition_i!=D_8x8) && mvd_e_done_r) begin
		case(mb_partition_i)
			D_16x16:	begin
				if(mvd_idx_encode_r==0 && mvd_idx_r==1)
					mvd_encode_done_r <= 1;
				else
					mvd_encode_done_r <= 0;
			end
			D_16x8:		begin
				if(mvd_idx_encode_r==8)
					mvd_encode_done_r <= 1;
				else
					mvd_encode_done_r <= 0;
			end
			D_8x16:		begin
				if(mvd_idx_encode_r==4)
					mvd_encode_done_r <= 1;
				else
					mvd_encode_done_r <= 0;	
			end
			default:	begin
				mvd_encode_done_r <= 0;
			end
		endcase
	end
	else if((mvd_curr_state_r==MVD_ENCODE) && (mb_partition_i==D_8x8) && (mvd_8x8_idx_encode_r==3) && mvd_e_done_r) begin
		case(mb_sub_part_encode_r)
			D_L0_8x8:	begin
				if(mvd_idx_encode_r==12) 
					mvd_encode_done_r <= 1;
				else 
					mvd_encode_done_r <= 0;
			end
			D_L0_8x4:	begin
				if(mvd_idx_encode_r==14)
					mvd_encode_done_r <= 1;
				else
					mvd_encode_done_r <= 0;
			end
			D_L0_4x8:	begin
				if(mvd_idx_encode_r==13)
					mvd_encode_done_r <= 1;
				else
					mvd_encode_done_r <= 0;
			end
			D_L0_4x4:	begin
				if(mvd_idx_encode_r==15)
					mvd_encode_done_r <= 1;
				else
					mvd_encode_done_r <= 0;
			end
			default:	begin
				mvd_encode_done_r <= 0;
			end				
		endcase   
	end
	else if(curr_state_i!=CABAC_mvd)
		mvd_encode_done_r <= 0;
	else
		mvd_encode_done_r <= mvd_encode_done_r;	
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		mvd_idx_encode_r <= 0;
	else if(mvd_encode_done_r)
		mvd_idx_encode_r <= 0;
	else if(mvd_e_done_r)
		mvd_idx_encode_r <= mvd_idx_r;
	else 
		mvd_idx_encode_r <= mvd_idx_encode_r;
end

//mvd index of sub block
always@(posedge clk or negedge rst_n) begin
	if(!rst_n)begin
		mvd_idx_0_r <= 0;
	end
	else if(curr_state_i!=CABAC_mvd)
		mvd_idx_0_r <= 0;
	else if(mvd_encode_done_r)begin
		case(write_cyc_num_r)
			0:	begin mvd_idx_0_r <= 5; end
			1:	begin mvd_idx_0_r <= 7; end
			2:	begin mvd_idx_0_r <= 13; end
			3:	begin mvd_idx_0_r <= 15; end
			4:	begin mvd_idx_0_r <= 14; end
			5:	begin mvd_idx_0_r <= 11; end
			6:	begin mvd_idx_0_r <= 10; end
			default:
				begin mvd_idx_0_r <= 0; end			
		endcase
	end
	else begin
		case(mb_partition_i)
			D_16x16		:	begin
								if(mvd_e_done_r) 
									mvd_idx_0_r <= 1;
								else
									mvd_idx_0_r <= mvd_idx_0_r;
							end
			D_16x8		:	begin
								if(mvd_e_done_r) begin
									mvd_idx_0_r <= 8;
								end
								else begin
									mvd_idx_0_r <= mvd_idx_0_r;
								end
							end
			D_8x16		:	begin
								if(mvd_e_done_r) begin
									mvd_idx_0_r <= 4;
								end
								else begin
									mvd_idx_0_r <= mvd_idx_0_r;
								end
							end
			default:		
							mvd_idx_0_r <= 0;
		endcase
	end
end

always @* begin
	if(curr_state_i!=CABAC_mvd)
		mvd_idx_r = 0;
	else if(mvd_encode_done_r)
		mvd_idx_r = mvd_idx_0_r;
	else
		mvd_idx_r = mb_partition_i==D_8x8 ? ((mvd_8x8_idx_r<<2) + mvd_8x8_sub_idx_r) : mvd_idx_0_r;
end

//mvd index of 8x8 block reading
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		mvd_8x8_idx_r <= 0;
	end
	else if(curr_state_i!=CABAC_mvd)
		mvd_8x8_idx_r <= 0;
	else if(mvd_encode_done_r) begin
		mvd_8x8_idx_r <= 0;
	end
	else if(mvd_8x8_done_r) begin
		if(mvd_8x8_idx_r==3) begin
			mvd_8x8_idx_r <= 0;
		end
		else begin
			mvd_8x8_idx_r <= mvd_8x8_idx_r + 1;
		end
	end
	else begin
		mvd_8x8_idx_r <= mvd_8x8_idx_r;
	end
end

//mvd index of 8x8 block encoding
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) 
		mvd_8x8_idx_encode_r <= 0;
	else if(mvd_e_done_r)
		mvd_8x8_idx_encode_r <= mvd_8x8_idx_r;
	else
		mvd_8x8_idx_encode_r <= mvd_8x8_idx_encode_r;
end

//mvd sub_idx of 4x4 block
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		mvd_8x8_sub_idx_r <= 0;
	else if(curr_state_i!=CABAC_mvd)
		mvd_8x8_sub_idx_r <= 0;
	else if(mvd_encode_done_r)
		mvd_8x8_sub_idx_r <= 0;
	else if(mvd_idx_r==0 && mvd_idx_encode_r>0) 
		mvd_8x8_sub_idx_r <= 0;
	else begin
		case(mb_sub_part_r)
			D_L0_8x8:	begin
							mvd_8x8_sub_idx_r <= 0;
						end
			D_L0_8x4:	begin
							if(mvd_e_done_r) begin
								if(mvd_8x8_sub_idx_r==2)
									mvd_8x8_sub_idx_r <= 0;
								else
									mvd_8x8_sub_idx_r <= 2;								
							end
							else
								mvd_8x8_sub_idx_r <= mvd_8x8_sub_idx_r;	
						end
			D_L0_4x8:	begin
							if(mvd_e_done_r) begin
								if(mvd_8x8_sub_idx_r==1)
									mvd_8x8_sub_idx_r <= 0;
								else
									mvd_8x8_sub_idx_r <= 1;								
							end
							else
								mvd_8x8_sub_idx_r <= mvd_8x8_sub_idx_r;
						end
			D_L0_4x4:	begin
							if(mvd_e_done_r) begin 
								if(mvd_8x8_sub_idx_r==3)
									mvd_8x8_sub_idx_r <= 0;
								else
									mvd_8x8_sub_idx_r <= mvd_8x8_sub_idx_r + 1;	
							end
							else
								mvd_8x8_sub_idx_r <= mvd_8x8_sub_idx_r;
						end
			default:	begin
							mvd_8x8_sub_idx_r <= mvd_8x8_sub_idx_r;
						end
		endcase
	end	
end



//neighbour infor
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) 
		write_cyc_num_r <= 0;
	else if(curr_state_i!=CABAC_mvd)
		write_cyc_num_r <= 0;
	else if(write_cyc_num_r==8)
		write_cyc_num_r <= 0;	
	else if(mvd_encode_done_r)
		write_cyc_num_r <= write_cyc_num_r + 1;
	else 
		write_cyc_num_r <= write_cyc_num_r;
end

//left
assign	r_mvd_left_en_w   = r_mvd_left_en_r	  	;
assign	w_mvd_left_en_w   = w_mvd_left_en_r	  	;
assign	r_addr_mvd_left_w = r_addr_mvd_left_r	;
assign	w_addr_mvd_left_w = w_addr_mvd_left_r	;
assign	w_data_mvd_left_w = w_data_mvd_left_r	;

//left read
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		r_data_mvd_left_r <= 0;
	else if(mvd_e_done_delay_r)
		r_data_mvd_left_r <= r_data_mvd_left_w;
	else 
		r_data_mvd_left_r <= r_data_mvd_left_r;
end
                   
//read left enable and address                    
always @* begin
	if(curr_state_i!=CABAC_mvd) begin
		r_mvd_left_en_r   = 0;
		r_addr_mvd_left_r = 0;
	end
	else if(mvd_curr_state_r==MVD_IDLE) begin		//0
		r_mvd_left_en_r   = 1;
		r_addr_mvd_left_r = 0;
	end
	else if(mvd_e_done_r) begin
		if(mb_partition_i!=D_8x8) begin
			if(mb_partition_i==D_16x8) begin		//8
				r_mvd_left_en_r   = 1;
				r_addr_mvd_left_r = 2;				
			end
			else begin
				r_mvd_left_en_r   = 0;
				r_addr_mvd_left_r = 0;
			end
		end
		else if(mb_partition_i==D_8x8) begin
			if(mb_sub_partition_i[1:0]==D_L0_4x4 && mvd_idx_encode_r==1) begin		//2
				r_mvd_left_en_r   = 1;		
				r_addr_mvd_left_r = 1;
			end
			else if(mb_sub_partition_i[1:0]==D_L0_8x4 && mvd_idx_encode_r==0) begin	//2
				r_mvd_left_en_r   = 1;
				r_addr_mvd_left_r = 1;			
			end
			else if(mb_sub_partition_i[3:2]==D_L0_4x4 && mvd_idx_encode_r==7) begin	//8
				r_mvd_left_en_r   = 1;
				r_addr_mvd_left_r = 2;
			end
			else if(mb_sub_partition_i[3:2]==D_L0_8x4 && mvd_idx_encode_r==6) begin
				r_mvd_left_en_r   = 1;
				r_addr_mvd_left_r = 2;
			end
			else if(mb_sub_partition_i[3:2]==D_L0_4x8 && mvd_idx_encode_r==5) begin
				r_mvd_left_en_r   = 1;
				r_addr_mvd_left_r = 2;
			end
			else if(mb_sub_partition_i[3:2]==D_L0_8x8 && mvd_idx_encode_r==4) begin
				r_mvd_left_en_r   = 1;
				r_addr_mvd_left_r = 2;
			end
			else if(mb_sub_partition_i[5:4]==D_L0_4x4 && mvd_idx_encode_r==9) begin		//10
				r_mvd_left_en_r   = 1;
				r_addr_mvd_left_r = 3;
			end
			else if(mb_sub_partition_i[5:4]==D_L0_8x4 && mvd_idx_encode_r==8) begin
				r_mvd_left_en_r   = 1;
				r_addr_mvd_left_r = 3;
			end
			else begin
				r_mvd_left_en_r   = 0;
				r_addr_mvd_left_r = 0;
			end
		end
		else begin
			r_mvd_left_en_r   = 0;
			r_addr_mvd_left_r = 0;
		end
	end
	else begin
		r_mvd_left_en_r   = 0;
		r_addr_mvd_left_r = 0;
	end
end                   
 
//left write
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		w_mvd_left_en_r <= 0;
	else if(curr_state_i==CABAC_mvd && write_cyc_num_r>=1 && write_cyc_num_r<=4)
		w_mvd_left_en_r <= 1;
	else 
		w_mvd_left_en_r <= 0;
end                   
                   
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		w_addr_mvd_left_r <= 0;
	else if(w_addr_mvd_left_r==3)
		w_addr_mvd_left_r <= 0;
	else if(w_mvd_left_en_r && write_cyc_num_r>=2 && write_cyc_num_r<=4)
		w_addr_mvd_left_r <= w_addr_mvd_left_r + 1;
	else 
		w_addr_mvd_left_r <= 0; 
end                   
                   
always @* begin
	w_data_mvd_left_r = mvd_curr_r;
end                   
                   
                   
//top
assign	r_mvd_top_en_w    = r_mvd_top_en_r	  	;
assign	w_mvd_top_en_w    = w_mvd_top_en_r	  	;
assign	r_addr_mvd_top_w  = r_addr_mvd_top_r	;
assign	w_addr_mvd_top_w  = w_addr_mvd_top_r	;
assign	w_data_mvd_top_w  = w_data_mvd_top_r	;

//top read
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		r_data_mvd_top_r <= 0;
	else if(mvd_e_done_delay_r)
		r_data_mvd_top_r <= r_data_mvd_top_w;
	else 
		r_data_mvd_top_r <= r_data_mvd_top_r;
end

wire	[8:0]		r_addr_mvd_top_base_w			;
assign	r_addr_mvd_top_base_w = (mb_x_i << 2);

//read top enable and address
always @* begin
	if(curr_state_i!=CABAC_mvd) begin
		r_mvd_top_en_r   = 0;
		r_addr_mvd_top_r = 0;
	end
	else if(mvd_curr_state_r==MVD_IDLE) begin
		r_mvd_top_en_r   = 1;
		r_addr_mvd_top_r = r_addr_mvd_top_base_w;
	end
	else if(mvd_e_done_r) begin
		if(mb_partition_i!=D_8x8) begin
			if(mb_partition_i==D_8x16) begin 
				r_mvd_top_en_r   = 1;
				r_addr_mvd_top_r = r_addr_mvd_top_base_w + 2;
			end
			else begin  
				r_mvd_top_en_r   = 0;
				r_addr_mvd_top_r = 0;
			end
		end
		else if(mb_partition_i==D_8x8) begin
			if((mb_sub_partition_i[1:0]==D_L0_4x4 || mb_sub_partition_i[1:0]==D_L0_4x8) && mvd_idx_encode_r==0) begin
				r_mvd_top_en_r   = 1;
				r_addr_mvd_top_r = r_addr_mvd_top_base_w + 1;
			end
			else if(mb_sub_partition_i[1:0]==D_L0_4x4 && mvd_idx_encode_r==3) begin
				r_mvd_top_en_r   = 1;
				r_addr_mvd_top_r = r_addr_mvd_top_base_w + 2;
			end
			else if(mb_sub_partition_i[1:0]==D_L0_4x8 && mvd_idx_encode_r==1) begin
				r_mvd_top_en_r   = 1;
				r_addr_mvd_top_r = r_addr_mvd_top_base_w + 2;
			end
			else if(mb_sub_partition_i[1:0]==D_L0_8x4 && mvd_idx_encode_r==2) begin
				r_mvd_top_en_r   = 1;
				r_addr_mvd_top_r = r_addr_mvd_top_base_w + 2;
			end
			else if(mb_sub_partition_i[1:0]==D_L0_8x8 && mvd_idx_encode_r==0) begin
				r_mvd_top_en_r   = 1;
				r_addr_mvd_top_r = r_addr_mvd_top_base_w + 2;
			end
			else if((mb_sub_partition_i[3:2]==D_L0_4x4 || mb_sub_partition_i[3:2]==D_L0_4x8) && mvd_idx_encode_r==4) begin
				r_mvd_top_en_r   = 1;
				r_addr_mvd_top_r = r_addr_mvd_top_base_w + 3;
			end
			else begin
				r_mvd_top_en_r   = 0;
				r_addr_mvd_top_r = 0;
			end
		end
		else begin
			r_mvd_top_en_r  = 0;
			r_addr_mvd_top_r = 0;
		end
	end
	else begin
		r_mvd_top_en_r   = 0;
		r_addr_mvd_top_r = 0;
	end
end

//top write
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		w_mvd_top_en_r <= 0;
	else if(curr_state_i==CABAC_mvd && (write_cyc_num_r>=4 && write_cyc_num_r<=7))
		w_mvd_top_en_r <= 1;
	else 
		w_mvd_top_en_r <= 0;
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		w_addr_mvd_top_r <= 0;
	else if(write_cyc_num_r==8)
		w_addr_mvd_top_r <= 0;
	else begin
		case(write_cyc_num_r)
			7:	begin w_addr_mvd_top_r <= r_addr_mvd_top_base_w; end
			6:	begin w_addr_mvd_top_r <= r_addr_mvd_top_base_w + 1; end
			5:	begin w_addr_mvd_top_r <= r_addr_mvd_top_base_w + 2; end
			4:	begin w_addr_mvd_top_r <= r_addr_mvd_top_base_w + 3; end
			default:                      
				begin w_addr_mvd_top_r <= r_addr_mvd_top_base_w; end
		endcase
	end
end

always @* begin
	w_data_mvd_top_r = mvd_curr_r;
end     



// ********************************************
//                                             
//    Sub Block               
//                                             
// ********************************************

cabac_mvd_left_2p_18x4 cabac_mvd_left_2p_18x4_u0(
	.clk   	(clk				),
	.r_en  	(r_mvd_left_en_w	),
	.r_addr (r_addr_mvd_left_w	),
	.r_data (r_data_mvd_left_w	),
	.w_en  	(w_mvd_left_en_w	),
	.w_addr (w_addr_mvd_left_w	),
	.w_data (w_data_mvd_left_w	)
);

cabac_mvd_top_2p_18xMB_X_TOTAL cabac_mvd_top_2p_18xMB_X_TOTAL_u0(
	.clk   	(clk				),
	.r_en  	(r_mvd_top_en_w		),
	.r_addr (r_addr_mvd_top_w	),
	.r_data (r_data_mvd_top_w	),
	.w_en  	(w_mvd_top_en_w		),
	.w_addr (w_addr_mvd_top_w	),
	.w_data (w_data_mvd_top_w	)
);











endmodule