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
// Filename       : cabac_modeling.v
// Author         : guo yong
// Created        : 2014-02
// Description    : H.265 context modeling module
//               
// $Id$ 
//-------------------------------------------------------------------
`include "enc_defines.v"

module cabac_modeling(
					//input
					clk 					,
					rst_n					,
                                            
                    modeling_pair_0_i		,
                    modeling_pair_1_i		,
                    modeling_pair_2_i		,
                    modeling_pair_3_i		,
                    valid_num_modeling_i	,
                    
                    cabac_start_i			,	
                    slice_qp_i				,
                    slice_type_i			,
                    first_mb_flag_i			,
                    
                    w_en_ctx_state_0_i		,
                	w_addr_ctx_state_0_i	,
                	w_data_ctx_state_0_i	,
					
                	w_en_ctx_state_1_i		,
                	w_addr_ctx_state_1_i	,
                	w_data_ctx_state_1_i	,
					
                	w_en_ctx_state_2_i		,
                	w_addr_ctx_state_2_i	,
                	w_data_ctx_state_2_i	,
                	
					w_en_ctx_state_3_i		,
                	w_addr_ctx_state_3_i	,
                	w_data_ctx_state_3_i	,
                	
					w_en_ctx_state_4_i		,
                	w_addr_ctx_state_4_i	,
                	w_data_ctx_state_4_i	,

                    //output                            
                    modeling_ctx_pair_0_o	,  
                    modeling_ctx_pair_1_o	,  
                    modeling_ctx_pair_2_o	,
                    modeling_ctx_pair_3_o	,
                    valid_num_modeling_o		
);

//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//                                             
//    INPUT / OUTPUT DECLARATION               
//                                             
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
input				clk 					;	//clock
input				rst_n					;	//reset signal                

input	[10:0]		modeling_pair_0_i		;	//{coding_mode, bin, ctx_idx} pair modeling input from binarization	
input	[10:0]		modeling_pair_1_i		;	//{coding_mode, bin, ctx_idx} pair modeling input from binarization
input	[10:0]		modeling_pair_2_i		;	//{coding_mode, bin, ctx_idx} pair modeling input from binarization
input	[10:0]		modeling_pair_3_i		;	//{coding_mode, bin, ctx_idx} pair modeling input from binarization
input	[2:0]		valid_num_modeling_i	;	//valid number of modeling pairs	

input				cabac_start_i			;	
input	[5:0]		slice_qp_i				;
input				slice_type_i			;	
input				first_mb_flag_i			;

input				w_en_ctx_state_0_i		;	//write enable context state 0 
input   [5:0]		w_addr_ctx_state_0_i	;   //write address context state 0
input   [6:0]		w_data_ctx_state_0_i	;   //write data context state 0   
input   			w_en_ctx_state_1_i		;   //write enable context state 1 
input   [5:0]		w_addr_ctx_state_1_i	;   //write address context state 1
input   [6:0]		w_data_ctx_state_1_i	;   //write data context state 1   
input   			w_en_ctx_state_2_i		;   //write enable context state 2 
input   [5:0]		w_addr_ctx_state_2_i	;   //write address context state 2
input   [6:0]		w_data_ctx_state_2_i	;   //write data context state 2   
input   			w_en_ctx_state_3_i		;   //write enable context state 3 
input   [5:0]		w_addr_ctx_state_3_i	;   //write address context state 3
input   [6:0]		w_data_ctx_state_3_i	;   //write data context state 3   
input   			w_en_ctx_state_4_i		;   //write enable context state 4 
input   [5:0]		w_addr_ctx_state_4_i	;   //write address context state 4
input   [6:0]		w_data_ctx_state_4_i	;   //write data context state 4   

output	[9:0]		modeling_ctx_pair_0_o	;	//{coding_mode, bin, MPS, pStateIdx} pair after modeling	 
output	[9:0]		modeling_ctx_pair_1_o	;	//{coding_mode, bin, MPS, pStateIdx} pair after modeling
output	[9:0]		modeling_ctx_pair_2_o	;	//{coding_mode, bin, MPS, pStateIdx} pair after modeling		
output	[9:0]		modeling_ctx_pair_3_o	;	//{coding_mode, bin, MPS, pStateIdx} pair after modeling	
output	[2:0]		valid_num_modeling_o	;	//valid number of modeling pairs 

//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//                                             
//    Reg / Wire DECLARATION               
//                                             
//-----------------------------------------------------------------------------------------------------------------------------------------------------------

reg		[9:0]		modeling_ctx_pair_0_o	;	//{coding_mode, bin, MPS, pStateIdx} pair after modeling	 
reg		[9:0]		modeling_ctx_pair_1_o	;	//{coding_mode, bin, MPS, pStateIdx} pair after modeling
reg		[9:0]		modeling_ctx_pair_2_o	;	//{coding_mode, bin, MPS, pStateIdx} pair after modeling		
reg		[9:0]		modeling_ctx_pair_3_o	;	//{coding_mode, bin, MPS, pStateIdx} pair after modeling	
reg		[2:0]		valid_num_modeling_o	;	//valid number of modeling pairs
reg		[2:0]		valid_num_modeling_r	;	

reg					comparator01			;	//comparator between ctx_addr_0 and ctx_addr_1
reg					comparator12			;	//comparator between ctx_addr_1 and ctx_addr_2
reg					comparator23			;	//comparator between ctx_addr_2 and ctx_addr_3
reg					comparator02			;	//comparator between ctx_addr_0 and ctx_addr_2
reg					comparator03			;	//comparator between ctx_addr_0 and ctx_addr_3
reg					comparator13			;	//comparator between ctx_addr_1 and ctx_addr_3


reg					mps_0_r					;	//mps 0
reg					mps_1_r					;	//mps 1
reg					mps_2_r					;	//mps 2
reg					mps_3_r					;	//mps 3

reg		[5:0]		pstate_0_r				;	//pstate 0
reg		[5:0]		pstate_1_r				;	//pstate 1
reg		[5:0]		pstate_2_r				;	//pstate 2
reg		[5:0]		pstate_3_r				;	//pstate 3

reg		[6:0]		ctx_state_0_m_r			;	//ctx_state_i transform because bin=mps
reg		[6:0]		ctx_state_1_m_r			;	//ctx_state_i transform because bin=mps
reg		[6:0]		ctx_state_2_m_r			;	//ctx_state_i transform because bin=mps
reg		[6:0]		ctx_state_3_m_r			;	//ctx_state_i transform because bin=mps

reg		[6:0]		ctx_state_0_l_r			;	//ctx_state_i transform because bin=lps
reg		[6:0]		ctx_state_1_l_r			;	//ctx_state_i transform because bin=lps
reg		[6:0]		ctx_state_2_l_r			;	//ctx_state_i transform because bin=lps
reg		[6:0]		ctx_state_3_l_r			;	//ctx_state_i transform because bin=lps

reg		[6:0]		ctx_state_0_u_r			;	//update ctx_state_i 
reg		[6:0]		ctx_state_1_u_r			;	//update ctx_state_i 
reg		[6:0]		ctx_state_2_u_r			;	//update ctx_state_i 
reg		[6:0]		ctx_state_3_u_r			;	//update ctx_state_i 

reg		[6:0]		ctx_state_0_r			;	//ctx state 0 after arbitration
reg		[6:0]		ctx_state_1_r			;	//ctx state 1 after arbitration
reg		[6:0]		ctx_state_2_r			;	//ctx state 2 after arbitration
reg		[6:0]		ctx_state_3_r			;	//ctx state 3 after arbitration

wire	[6:0]		ctx_state_0_w			;	//ctx state 0 after arbitration
wire	[6:0]		ctx_state_1_w			;	//ctx state 1 after arbitration
wire	[6:0]		ctx_state_2_w			;	//ctx state 2 after arbitration
wire	[6:0]		ctx_state_3_w			;	//ctx state 3 after arbitration

//sram 0
reg					r_en_0_r				;
reg		[5:0]		r_addr_0_r				;
reg		[6:0]		r_data_0_r				; 
reg		[6:0]		w_data_delay_0_r		;

reg					w_en_0_r				;
reg		[5:0]		w_addr_0_r				;
reg		[6:0]		w_data_0_r				;	

wire				r_en_0_w				;
wire	[5:0]		r_addr_0_w				;
wire	[6:0]		r_data_0_w				;
wire				w_en_0_w				;
wire	[5:0]		w_addr_0_w				;
wire	[6:0]		w_data_0_w				;		
                                    		
//sram 1                            		
reg					r_en_1_r				;
reg		[5:0]		r_addr_1_r				;
reg		[6:0]		r_data_1_r				;
reg		[6:0]		w_data_delay_1_r		;

reg					w_en_1_r				;
reg		[5:0]		w_addr_1_r				;
reg		[6:0]		w_data_1_r				;	
                                    		
wire				r_en_1_w				;
wire	[5:0]		r_addr_1_w				;
wire	[6:0]		r_data_1_w				;
wire				w_en_1_w				;
wire	[5:0]		w_addr_1_w				;
wire	[6:0]		w_data_1_w				;	
                                    		
//sram 2                            		
reg					r_en_2_r				;
reg		[5:0]		r_addr_2_r				;
reg		[6:0]		r_data_2_r				;
reg		[6:0]		w_data_delay_2_r		;

reg					w_en_2_r				;
reg		[5:0]		w_addr_2_r				;
reg		[6:0]		w_data_2_r				;	
                                    		
wire				r_en_2_w				;
wire	[5:0]		r_addr_2_w				;
wire	[6:0]		r_data_2_w				;
wire				w_en_2_w				;
wire	[5:0]		w_addr_2_w				;
wire	[6:0]		w_data_2_w				;	
                                    		
//sram 3                            		
reg					r_en_3_r				;   
reg		[5:0]		r_addr_3_r				;   
reg		[6:0]		r_data_3_r				;   
reg		[6:0]		w_data_delay_3_r		;

reg					w_en_3_r				;   
reg		[5:0]		w_addr_3_r				;   
reg		[6:0]		w_data_3_r				;	
                                    		    
wire				r_en_3_w				;   
wire	[5:0]		r_addr_3_w				;   
wire	[6:0]		r_data_3_w				;   
wire				w_en_3_w				;   
wire	[5:0]		w_addr_3_w				;   
wire	[6:0]		w_data_3_w				;	

//4
reg					r_en_4_r				;   
reg		[5:0]		r_addr_4_r				;   
reg		[6:0]		r_data_4_r				;   
reg		[6:0]		w_data_delay_4_r		;

reg					w_en_4_r				;   
reg		[5:0]		w_addr_4_r				;   
reg		[6:0]		w_data_4_r				;	
                                    		   
wire				r_en_4_w				;   
wire	[5:0]		r_addr_4_w				;   
wire	[6:0]		r_data_4_w				;   
wire				w_en_4_w				;   
wire	[5:0]		w_addr_4_w				;   
wire	[6:0]		w_data_4_w				;	

reg					r_en_delay_0_r			;
reg					r_en_delay_1_r			;
reg					r_en_delay_2_r			;
reg					r_en_delay_3_r			;
reg					r_en_delay_4_r			;

reg		[5:0]		w_addr_delay_0_r		;
reg		[5:0]		w_addr_delay_1_r		;
reg		[5:0]		w_addr_delay_2_r		;
reg		[5:0]		w_addr_delay_3_r		;
reg		[5:0]		w_addr_delay_4_r		;

reg					w_addr_equal_0_r		;
reg					w_addr_equal_1_r		;
reg					w_addr_equal_2_r		;
reg					w_addr_equal_3_r		;
reg					w_addr_equal_4_r		;

reg					bin_delay_0_r			;
reg					bin_delay_1_r			;
reg					bin_delay_2_r			;
reg					bin_delay_3_r			;

reg     [7:0]       ctx_pair_delay_0_r      ; // [7:0]
reg     [7:0]       ctx_pair_delay_1_r      ; // [7:0]
reg     [7:0]       ctx_pair_delay_2_r      ; // [7:0]
reg     [7:0]       ctx_pair_delay_3_r      ; // [7:0]

reg		[1:0]		coding_mode_delay_0_r	;
reg		[1:0]		coding_mode_delay_1_r	;
reg		[1:0]		coding_mode_delay_2_r	;
reg		[1:0]		coding_mode_delay_3_r	;

//extra register
reg		[6:0]		ctx_state_50_r			;	//the extra register {3'd5, 5'd0}
reg		[6:0]		ctx_state_51_r			;	//the extra register {3'd5, 5'd1}

//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//                                             
//    Combinational Logic               
//                                             
//-----------------------------------------------------------------------------------------------------------------------------------------------------------


always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		comparator01 <= 0;
	    comparator12 <= 0;
	    comparator23 <= 0;
	    comparator02 <= 0;
	    comparator03 <= 0;
	    comparator13 <= 0;
	end
	else 
	begin
		comparator01 <= (modeling_pair_0_i[7:0]==modeling_pair_1_i[7:0]&&modeling_pair_0_i[10:9]==2'd0&&modeling_pair_1_i[10:9]==2'd0);
		comparator12 <= (modeling_pair_1_i[7:0]==modeling_pair_2_i[7:0]&&modeling_pair_1_i[10:9]==2'd0&&modeling_pair_2_i[10:9]==2'd0);
		comparator23 <= (modeling_pair_2_i[7:0]==modeling_pair_3_i[7:0]&&modeling_pair_2_i[10:9]==2'd0&&modeling_pair_3_i[10:9]==2'd0);
		comparator02 <= (modeling_pair_0_i[7:0]==modeling_pair_2_i[7:0]&&modeling_pair_0_i[10:9]==2'd0&&modeling_pair_2_i[10:9]==2'd0);
		comparator03 <= (modeling_pair_0_i[7:0]==modeling_pair_3_i[7:0]&&modeling_pair_0_i[10:9]==2'd0&&modeling_pair_3_i[10:9]==2'd0);
		comparator13 <= (modeling_pair_1_i[7:0]==modeling_pair_3_i[7:0]&&modeling_pair_1_i[10:9]==2'd0&&modeling_pair_3_i[10:9]==2'd0);
	end
end

 
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		modeling_ctx_pair_0_o <= 10'h1ff;
		modeling_ctx_pair_1_o <= 10'h1ff;
		modeling_ctx_pair_2_o <= 10'h1ff;
		modeling_ctx_pair_3_o <= 10'h1ff;
	end                
	else begin
		modeling_ctx_pair_0_o <= ( (valid_num_modeling_r>3'd0) ? 
		                         ( coding_mode_delay_0_r==2'b00 ? {coding_mode_delay_0_r, bin_delay_0_r, mps_0_r, pstate_0_r[5:0]}:{coding_mode_delay_0_r, ctx_pair_delay_0_r} )
				                  : 10'h1ff);
		modeling_ctx_pair_1_o <= ( (valid_num_modeling_r>3'd1) ? 
		                         ( coding_mode_delay_1_r==2'b00 ? {coding_mode_delay_1_r, bin_delay_1_r, mps_1_r, pstate_1_r[5:0]}:{coding_mode_delay_1_r, ctx_pair_delay_1_r} )
				                  : 10'h1ff);
		modeling_ctx_pair_2_o <= ( (valid_num_modeling_r>3'd2) ? 
		                         ( coding_mode_delay_2_r==2'b00 ? {coding_mode_delay_2_r, bin_delay_2_r, mps_2_r, pstate_2_r[5:0]}:{coding_mode_delay_2_r, ctx_pair_delay_2_r} )
				                  : 10'h1ff);  
		modeling_ctx_pair_3_o <= ( (valid_num_modeling_r>3'd3) ? 
		                         ( coding_mode_delay_3_r==2'b00 ? {coding_mode_delay_3_r, bin_delay_3_r, mps_3_r, pstate_3_r[5:0]}:{coding_mode_delay_3_r, ctx_pair_delay_3_r} )
				                  : 10'h1ff);  
	end
end


always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		bin_delay_0_r  <= 1'd0;
		bin_delay_1_r  <= 1'd0;
		bin_delay_2_r  <= 1'd0;
		bin_delay_3_r  <= 1'd0;
		
		ctx_pair_delay_0_r   <=  8'd0;
		ctx_pair_delay_1_r   <=  8'd0;
		ctx_pair_delay_2_r   <=  8'd0;
		ctx_pair_delay_3_r   <=  8'd0;
		
		coding_mode_delay_0_r <= 2'd0;
		coding_mode_delay_1_r <= 2'd0;
		coding_mode_delay_2_r <= 2'd0;
		coding_mode_delay_3_r <= 2'd0;	
	end
	else begin
		bin_delay_0_r  <= modeling_pair_0_i[8]  ; 			// bin
		bin_delay_1_r  <= modeling_pair_1_i[8]  ; 			// bin
		bin_delay_2_r  <= modeling_pair_2_i[8]  ; 			// bin
		bin_delay_3_r  <= modeling_pair_3_i[8]  ; 			// bin 
		
		ctx_pair_delay_0_r  <=  modeling_pair_0_i[7:0];
		ctx_pair_delay_1_r  <=  modeling_pair_1_i[7:0];
		ctx_pair_delay_2_r  <=  modeling_pair_2_i[7:0];
		ctx_pair_delay_3_r  <=  modeling_pair_3_i[7:0];
		
		coding_mode_delay_0_r <= modeling_pair_0_i[10:9];   // coding mode 
		coding_mode_delay_1_r <= modeling_pair_1_i[10:9];   // coding mode 
		coding_mode_delay_2_r <= modeling_pair_2_i[10:9];   // coding mode 
		coding_mode_delay_3_r <= modeling_pair_3_i[10:9];   // coding mode 
	end	
end

reg					reg_00_r	;
reg					reg_10_r	;
reg					reg_20_r	;
reg					reg_30_r	;

reg					reg_01_r	;
reg					reg_11_r	;
reg					reg_21_r	;
reg					reg_31_r	;    

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		reg_00_r <= 'd0;
	else if(!modeling_pair_0_i[10:9]&&modeling_pair_0_i[7:0]=={3'd5, 5'd0})
		reg_00_r <= 'd1;
	else 
		reg_00_r <= 'd0;
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		reg_10_r <= 'd0;
	else if(!modeling_pair_1_i[10:9]&&modeling_pair_1_i[7:0]=={3'd5, 5'd0})
		reg_10_r <= 'd1;
	else 
		reg_10_r <= 'd0;
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		reg_20_r <= 'd0;
	else if(!modeling_pair_2_i[10:9]&&modeling_pair_2_i[7:0]=={3'd5, 5'd0})
		reg_20_r <= 'd1;
	else 
		reg_20_r <= 'd0;
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		reg_30_r <= 'd0;
	else if(!modeling_pair_3_i[10:9]&&modeling_pair_3_i[7:0]=={3'd5, 5'd0})
		reg_30_r <= 'd1;
	else 
		reg_30_r <= 'd0;
end


always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		reg_01_r <= 'd0;
	else if(!modeling_pair_0_i[10:9]&&modeling_pair_0_i[7:0]=={3'd5, 5'd1})
		reg_01_r <= 'd1;
	else 
		reg_01_r <= 'd0;
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		reg_11_r <= 'd0;
	else if(!modeling_pair_1_i[10:9]&&modeling_pair_1_i[7:0]=={3'd5, 5'd1})
		reg_11_r <= 'd1;
	else 
		reg_11_r <= 'd0;
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		reg_21_r <= 'd0;
	else if(!modeling_pair_2_i[10:9]&&modeling_pair_2_i[7:0]=={3'd5, 5'd1})
		reg_21_r <= 'd1;
	else 
		reg_21_r <= 'd0;
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		reg_31_r <= 'd0;
	else if(!modeling_pair_3_i[10:9]&&modeling_pair_3_i[7:0]=={3'd5, 5'd1})
		reg_31_r <= 'd1;
	else 
		reg_31_r <= 'd0;
end


always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		w_data_delay_0_r <= 0;
		w_data_delay_1_r <= 0;
		w_data_delay_2_r <= 0;
		w_data_delay_3_r <= 0;
		w_data_delay_4_r <= 0;
	end
	else begin
		w_data_delay_0_r <= w_data_0_r;
		w_data_delay_1_r <= w_data_1_r;
		w_data_delay_2_r <= w_data_2_r;
		w_data_delay_3_r <= w_data_3_r;
		w_data_delay_4_r <= w_data_4_r;
	end	
end

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		valid_num_modeling_r <= 'd0;
	else 
		valid_num_modeling_r <= valid_num_modeling_i;
end          

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) 
		valid_num_modeling_o <= 0;
	else
		valid_num_modeling_o <= valid_num_modeling_r;	
end
    
//context state arbitration
always @* begin
	case(ctx_pair_delay_0_r[7:5])//ctx_pair_delay_0_r[7:5]  : bank number
		0:	begin ctx_state_0_r = r_data_0_r; end 
		1:	begin ctx_state_0_r = r_data_1_r; end
		2:	begin ctx_state_0_r = r_data_2_r; end
		3:  begin ctx_state_0_r = r_data_3_r; end  
		4:	begin ctx_state_0_r = r_data_4_r; end
		5: 	begin 
				if(reg_00_r)
					ctx_state_0_r = ctx_state_50_r;
				else 
					ctx_state_0_r = ctx_state_51_r;
		end
		default:	
			begin ctx_state_0_r = r_data_0_r; end	
	endcase 
end


//bin 0
always @* begin
	case(ctx_state_0_r)                       // nextStateLPS 
		  0:	 begin ctx_state_0_l_r =   1; end
		  1:	 begin ctx_state_0_l_r =   0; end
		  2:	 begin ctx_state_0_l_r =   0; end
		  3:	 begin ctx_state_0_l_r =   1; end
		  4:	 begin ctx_state_0_l_r =   2; end
		  5:	 begin ctx_state_0_l_r =   3; end
		  6:	 begin ctx_state_0_l_r =   4; end
		  7:	 begin ctx_state_0_l_r =   5; end
		  8:	 begin ctx_state_0_l_r =   4; end
		  9:	 begin ctx_state_0_l_r =   5; end
		 10:	 begin ctx_state_0_l_r =   8; end
		 11:	 begin ctx_state_0_l_r =   9; end
		 12:	 begin ctx_state_0_l_r =   8; end
		 13:	 begin ctx_state_0_l_r =   9; end
		 14:	 begin ctx_state_0_l_r =  10; end
		 15:	 begin ctx_state_0_l_r =  11; end
		 16:	 begin ctx_state_0_l_r =  12; end
		 17:	 begin ctx_state_0_l_r =  13; end
		 18:	 begin ctx_state_0_l_r =  14; end
		 19:	 begin ctx_state_0_l_r =  15; end
		 20:	 begin ctx_state_0_l_r =  16; end
		 21:	 begin ctx_state_0_l_r =  17; end
		 22:	 begin ctx_state_0_l_r =  18; end
		 23:	 begin ctx_state_0_l_r =  19; end
		 24:	 begin ctx_state_0_l_r =  18; end
		 25:	 begin ctx_state_0_l_r =  19; end
		 26:	 begin ctx_state_0_l_r =  22; end
		 27:	 begin ctx_state_0_l_r =  23; end
		 28:	 begin ctx_state_0_l_r =  22; end
		 29:	 begin ctx_state_0_l_r =  23; end
		 30:	 begin ctx_state_0_l_r =  24; end
		 31:	 begin ctx_state_0_l_r =  25; end
		 32:	 begin ctx_state_0_l_r =  26; end
		 33:	 begin ctx_state_0_l_r =  27; end
		 34:	 begin ctx_state_0_l_r =  26; end
		 35:	 begin ctx_state_0_l_r =  27; end
		 36:	 begin ctx_state_0_l_r =  30; end
		 37:	 begin ctx_state_0_l_r =  31; end
		 38:	 begin ctx_state_0_l_r =  30; end
		 39:	 begin ctx_state_0_l_r =  31; end
		 40:	 begin ctx_state_0_l_r =  32; end
		 41:	 begin ctx_state_0_l_r =  33; end
		 42:	 begin ctx_state_0_l_r =  32; end
		 43:	 begin ctx_state_0_l_r =  33; end
		 44:	 begin ctx_state_0_l_r =  36; end
		 45:	 begin ctx_state_0_l_r =  37; end
		 46:	 begin ctx_state_0_l_r =  36; end
		 47:	 begin ctx_state_0_l_r =  37; end
		 48:	 begin ctx_state_0_l_r =  38; end
		 49:	 begin ctx_state_0_l_r =  39; end
		 50:	 begin ctx_state_0_l_r =  38; end
		 51:	 begin ctx_state_0_l_r =  39; end
		 52:	 begin ctx_state_0_l_r =  42; end
		 53:	 begin ctx_state_0_l_r =  43; end
		 54:	 begin ctx_state_0_l_r =  42; end
		 55:	 begin ctx_state_0_l_r =  43; end
		 56:	 begin ctx_state_0_l_r =  44; end
		 57:	 begin ctx_state_0_l_r =  45; end
		 58:	 begin ctx_state_0_l_r =  44; end
		 59:	 begin ctx_state_0_l_r =  45; end
		 60:	 begin ctx_state_0_l_r =  46; end
		 61:	 begin ctx_state_0_l_r =  47; end
		 62:	 begin ctx_state_0_l_r =  48; end
		 63:	 begin ctx_state_0_l_r =  49; end
		 64:	 begin ctx_state_0_l_r =  48; end
		 65:	 begin ctx_state_0_l_r =  49; end
		 66:	 begin ctx_state_0_l_r =  50; end
		 67:	 begin ctx_state_0_l_r =  51; end
		 68:	 begin ctx_state_0_l_r =  52; end
		 69:	 begin ctx_state_0_l_r =  53; end
		 70:	 begin ctx_state_0_l_r =  52; end
		 71:	 begin ctx_state_0_l_r =  53; end
		 72:	 begin ctx_state_0_l_r =  54; end
		 73:	 begin ctx_state_0_l_r =  55; end
		 74:	 begin ctx_state_0_l_r =  54; end
		 75:	 begin ctx_state_0_l_r =  55; end
		 76:	 begin ctx_state_0_l_r =  56; end
		 77:	 begin ctx_state_0_l_r =  57; end
		 78:	 begin ctx_state_0_l_r =  58; end
		 79:	 begin ctx_state_0_l_r =  59; end
		 80:	 begin ctx_state_0_l_r =  58; end
		 81:	 begin ctx_state_0_l_r =  59; end
		 82:	 begin ctx_state_0_l_r =  60; end
		 83:	 begin ctx_state_0_l_r =  61; end
		 84:	 begin ctx_state_0_l_r =  60; end
		 85:	 begin ctx_state_0_l_r =  61; end
		 86:	 begin ctx_state_0_l_r =  60; end
		 87:	 begin ctx_state_0_l_r =  61; end
		 88:	 begin ctx_state_0_l_r =  62; end
		 89:	 begin ctx_state_0_l_r =  63; end
		 90:	 begin ctx_state_0_l_r =  64; end
		 91:	 begin ctx_state_0_l_r =  65; end
		 92:	 begin ctx_state_0_l_r =  64; end
		 93:	 begin ctx_state_0_l_r =  65; end
		 94:	 begin ctx_state_0_l_r =  66; end
		 95:	 begin ctx_state_0_l_r =  67; end
		 96:	 begin ctx_state_0_l_r =  66; end
		 97:	 begin ctx_state_0_l_r =  67; end
		 98:	 begin ctx_state_0_l_r =  66; end
		 99:	 begin ctx_state_0_l_r =  67; end
		100:	 begin ctx_state_0_l_r =  68; end
		101:	 begin ctx_state_0_l_r =  69; end
		102:	 begin ctx_state_0_l_r =  68; end
		103:	 begin ctx_state_0_l_r =  69; end
		104:	 begin ctx_state_0_l_r =  70; end
		105:	 begin ctx_state_0_l_r =  71; end
		106:	 begin ctx_state_0_l_r =  70; end
		107:	 begin ctx_state_0_l_r =  71; end
		108:	 begin ctx_state_0_l_r =  70; end
		109:	 begin ctx_state_0_l_r =  71; end
		110:	 begin ctx_state_0_l_r =  72; end
		111:	 begin ctx_state_0_l_r =  73; end
		112:	 begin ctx_state_0_l_r =  72; end
		113:	 begin ctx_state_0_l_r =  73; end
		114:	 begin ctx_state_0_l_r =  72; end
		115:	 begin ctx_state_0_l_r =  73; end
		116:	 begin ctx_state_0_l_r =  74; end
		117:	 begin ctx_state_0_l_r =  75; end
		118:	 begin ctx_state_0_l_r =  74; end
		119:	 begin ctx_state_0_l_r =  75; end
		120:	 begin ctx_state_0_l_r =  74; end
		121:	 begin ctx_state_0_l_r =  75; end
		122:	 begin ctx_state_0_l_r =  76; end
		123:	 begin ctx_state_0_l_r =  77; end
		124:	 begin ctx_state_0_l_r =  76; end
		125:	 begin ctx_state_0_l_r =  77; end
		126:	 begin ctx_state_0_l_r = 126; end
		127:	 begin ctx_state_0_l_r = 127; end
		default: begin ctx_state_0_l_r =   0; end
	endcase
end

always @* begin                              //nextStateMPS
	if(ctx_state_0_r<=123)
		ctx_state_0_m_r = ctx_state_0_r + 2;
	else 
		ctx_state_0_m_r = ctx_state_0_r;
end
 
always @* begin				                 // nextState
	if(bin_delay_0_r==ctx_state_0_r[0])     
		ctx_state_0_u_r = ctx_state_0_m_r;   // bin == MPS
	else
		ctx_state_0_u_r = ctx_state_0_l_r;   // bin == LPS
end

always @* begin                            
		if(comparator01)
			ctx_state_1_r = ctx_state_0_u_r; // bin 1 initial state 
		else begin
			case(ctx_pair_delay_1_r[7:5])
				0:	begin ctx_state_1_r = r_data_0_r; end 
				1:	begin ctx_state_1_r = r_data_1_r; end
				2:	begin ctx_state_1_r = r_data_2_r; end
				3:  begin ctx_state_1_r = r_data_3_r; end
				4:	begin ctx_state_1_r = r_data_4_r; end
				5:	begin
						if(reg_10_r)
							ctx_state_1_r = ctx_state_50_r;
						else
							ctx_state_1_r = ctx_state_51_r;
				end
				default:	
					begin ctx_state_1_r = r_data_0_r; end	
			endcase
		end
end

always @* begin
		if(comparator12)
			ctx_state_2_r = ctx_state_1_u_r;
		else if(comparator02)
			ctx_state_2_r = ctx_state_0_u_r;
		else begin
			case(ctx_pair_delay_2_r[7:5])
				0:	begin ctx_state_2_r = r_data_0_r; end 
				1:	begin ctx_state_2_r = r_data_1_r; end
				2:	begin ctx_state_2_r = r_data_2_r; end
				3:  begin ctx_state_2_r = r_data_3_r; end
				4: 	begin ctx_state_2_r = r_data_4_r; end
				5:	begin
						if(reg_20_r)
							ctx_state_2_r = ctx_state_50_r;
						else
							ctx_state_2_r = ctx_state_51_r;
				end
				default:	
					begin ctx_state_2_r = r_data_0_r; end	
			endcase
		end
end

always @* begin
		if(comparator23)
			ctx_state_3_r = ctx_state_2_u_r;
		else if(comparator13)
			ctx_state_3_r = ctx_state_1_u_r;
		else if(comparator03)
			ctx_state_3_r = ctx_state_0_u_r;
		else begin
			case(ctx_pair_delay_3_r[7:5])
				0:	begin ctx_state_3_r = r_data_0_r; end 
				1:	begin ctx_state_3_r = r_data_1_r; end
				2:	begin ctx_state_3_r = r_data_2_r; end
				3:  begin ctx_state_3_r = r_data_3_r; end
				4:	begin ctx_state_3_r = r_data_4_r; end
				5:	begin
						if(reg_30_r)
							ctx_state_3_r = ctx_state_50_r;
						else
							ctx_state_3_r = ctx_state_51_r;
				end
				default:	
					begin ctx_state_3_r = r_data_0_r; end	
			endcase
		end       
end

//bin 1
always @* begin
	case(ctx_state_1_r)
		  0:	 begin ctx_state_1_l_r =   1; end
		  1:	 begin ctx_state_1_l_r =   0; end
		  2:	 begin ctx_state_1_l_r =   0; end
		  3:	 begin ctx_state_1_l_r =   1; end
		  4:	 begin ctx_state_1_l_r =   2; end
		  5:	 begin ctx_state_1_l_r =   3; end
		  6:	 begin ctx_state_1_l_r =   4; end
		  7:	 begin ctx_state_1_l_r =   5; end
		  8:	 begin ctx_state_1_l_r =   4; end
		  9:	 begin ctx_state_1_l_r =   5; end
		 10:	 begin ctx_state_1_l_r =   8; end
		 11:	 begin ctx_state_1_l_r =   9; end
		 12:	 begin ctx_state_1_l_r =   8; end
		 13:	 begin ctx_state_1_l_r =   9; end
		 14:	 begin ctx_state_1_l_r =  10; end
		 15:	 begin ctx_state_1_l_r =  11; end
		 16:	 begin ctx_state_1_l_r =  12; end
		 17:	 begin ctx_state_1_l_r =  13; end
		 18:	 begin ctx_state_1_l_r =  14; end
		 19:	 begin ctx_state_1_l_r =  15; end
		 20:	 begin ctx_state_1_l_r =  16; end
		 21:	 begin ctx_state_1_l_r =  17; end
		 22:	 begin ctx_state_1_l_r =  18; end
		 23:	 begin ctx_state_1_l_r =  19; end
		 24:	 begin ctx_state_1_l_r =  18; end
		 25:	 begin ctx_state_1_l_r =  19; end
		 26:	 begin ctx_state_1_l_r =  22; end
		 27:	 begin ctx_state_1_l_r =  23; end
		 28:	 begin ctx_state_1_l_r =  22; end
		 29:	 begin ctx_state_1_l_r =  23; end
		 30:	 begin ctx_state_1_l_r =  24; end
		 31:	 begin ctx_state_1_l_r =  25; end
		 32:	 begin ctx_state_1_l_r =  26; end
		 33:	 begin ctx_state_1_l_r =  27; end
		 34:	 begin ctx_state_1_l_r =  26; end
		 35:	 begin ctx_state_1_l_r =  27; end
		 36:	 begin ctx_state_1_l_r =  30; end
		 37:	 begin ctx_state_1_l_r =  31; end
		 38:	 begin ctx_state_1_l_r =  30; end
		 39:	 begin ctx_state_1_l_r =  31; end
		 40:	 begin ctx_state_1_l_r =  32; end
		 41:	 begin ctx_state_1_l_r =  33; end
		 42:	 begin ctx_state_1_l_r =  32; end
		 43:	 begin ctx_state_1_l_r =  33; end
		 44:	 begin ctx_state_1_l_r =  36; end
		 45:	 begin ctx_state_1_l_r =  37; end
		 46:	 begin ctx_state_1_l_r =  36; end
		 47:	 begin ctx_state_1_l_r =  37; end
		 48:	 begin ctx_state_1_l_r =  38; end
		 49:	 begin ctx_state_1_l_r =  39; end
		 50:	 begin ctx_state_1_l_r =  38; end
		 51:	 begin ctx_state_1_l_r =  39; end
		 52:	 begin ctx_state_1_l_r =  42; end
		 53:	 begin ctx_state_1_l_r =  43; end
		 54:	 begin ctx_state_1_l_r =  42; end
		 55:	 begin ctx_state_1_l_r =  43; end
		 56:	 begin ctx_state_1_l_r =  44; end
		 57:	 begin ctx_state_1_l_r =  45; end
		 58:	 begin ctx_state_1_l_r =  44; end
		 59:	 begin ctx_state_1_l_r =  45; end
		 60:	 begin ctx_state_1_l_r =  46; end
		 61:	 begin ctx_state_1_l_r =  47; end
		 62:	 begin ctx_state_1_l_r =  48; end
		 63:	 begin ctx_state_1_l_r =  49; end
		 64:	 begin ctx_state_1_l_r =  48; end
		 65:	 begin ctx_state_1_l_r =  49; end
		 66:	 begin ctx_state_1_l_r =  50; end
		 67:	 begin ctx_state_1_l_r =  51; end
		 68:	 begin ctx_state_1_l_r =  52; end
		 69:	 begin ctx_state_1_l_r =  53; end
		 70:	 begin ctx_state_1_l_r =  52; end
		 71:	 begin ctx_state_1_l_r =  53; end
		 72:	 begin ctx_state_1_l_r =  54; end
		 73:	 begin ctx_state_1_l_r =  55; end
		 74:	 begin ctx_state_1_l_r =  54; end
		 75:	 begin ctx_state_1_l_r =  55; end
		 76:	 begin ctx_state_1_l_r =  56; end
		 77:	 begin ctx_state_1_l_r =  57; end
		 78:	 begin ctx_state_1_l_r =  58; end
		 79:	 begin ctx_state_1_l_r =  59; end
		 80:	 begin ctx_state_1_l_r =  58; end
		 81:	 begin ctx_state_1_l_r =  59; end
		 82:	 begin ctx_state_1_l_r =  60; end
		 83:	 begin ctx_state_1_l_r =  61; end
		 84:	 begin ctx_state_1_l_r =  60; end
		 85:	 begin ctx_state_1_l_r =  61; end
		 86:	 begin ctx_state_1_l_r =  60; end
		 87:	 begin ctx_state_1_l_r =  61; end
		 88:	 begin ctx_state_1_l_r =  62; end
		 89:	 begin ctx_state_1_l_r =  63; end
		 90:	 begin ctx_state_1_l_r =  64; end
		 91:	 begin ctx_state_1_l_r =  65; end
		 92:	 begin ctx_state_1_l_r =  64; end
		 93:	 begin ctx_state_1_l_r =  65; end
		 94:	 begin ctx_state_1_l_r =  66; end
		 95:	 begin ctx_state_1_l_r =  67; end
		 96:	 begin ctx_state_1_l_r =  66; end
		 97:	 begin ctx_state_1_l_r =  67; end
		 98:	 begin ctx_state_1_l_r =  66; end
		 99:	 begin ctx_state_1_l_r =  67; end
		100:	 begin ctx_state_1_l_r =  68; end
		101:	 begin ctx_state_1_l_r =  69; end
		102:	 begin ctx_state_1_l_r =  68; end
		103:	 begin ctx_state_1_l_r =  69; end
		104:	 begin ctx_state_1_l_r =  70; end
		105:	 begin ctx_state_1_l_r =  71; end
		106:	 begin ctx_state_1_l_r =  70; end
		107:	 begin ctx_state_1_l_r =  71; end
		108:	 begin ctx_state_1_l_r =  70; end
		109:	 begin ctx_state_1_l_r =  71; end
		110:	 begin ctx_state_1_l_r =  72; end
		111:	 begin ctx_state_1_l_r =  73; end
		112:	 begin ctx_state_1_l_r =  72; end
		113:	 begin ctx_state_1_l_r =  73; end
		114:	 begin ctx_state_1_l_r =  72; end
		115:	 begin ctx_state_1_l_r =  73; end
		116:	 begin ctx_state_1_l_r =  74; end
		117:	 begin ctx_state_1_l_r =  75; end
		118:	 begin ctx_state_1_l_r =  74; end
		119:	 begin ctx_state_1_l_r =  75; end
		120:	 begin ctx_state_1_l_r =  74; end
		121:	 begin ctx_state_1_l_r =  75; end
		122:	 begin ctx_state_1_l_r =  76; end
		123:	 begin ctx_state_1_l_r =  77; end
		124:	 begin ctx_state_1_l_r =  76; end
		125:	 begin ctx_state_1_l_r =  77; end
		126:	 begin ctx_state_1_l_r = 126; end
		127:	 begin ctx_state_1_l_r = 127; end
		default: begin ctx_state_1_l_r =   0; end		
	endcase
end


always @* begin
	if(ctx_state_1_r<=123)
		ctx_state_1_m_r = ctx_state_1_r + 2;
	else 
		ctx_state_1_m_r = ctx_state_1_r;
end


always @* begin
	if(bin_delay_1_r==ctx_state_1_r[0])
		ctx_state_1_u_r = ctx_state_1_m_r;
	else
		ctx_state_1_u_r = ctx_state_1_l_r;
end

//bin 2
always @* begin
	case(ctx_state_2_r)
		  0:	 begin ctx_state_2_l_r =   1; end
		  1:	 begin ctx_state_2_l_r =   0; end
		  2:	 begin ctx_state_2_l_r =   0; end
		  3:	 begin ctx_state_2_l_r =   1; end
		  4:	 begin ctx_state_2_l_r =   2; end
		  5:	 begin ctx_state_2_l_r =   3; end
		  6:	 begin ctx_state_2_l_r =   4; end
		  7:	 begin ctx_state_2_l_r =   5; end
		  8:	 begin ctx_state_2_l_r =   4; end
		  9:	 begin ctx_state_2_l_r =   5; end
		 10:	 begin ctx_state_2_l_r =   8; end
		 11:	 begin ctx_state_2_l_r =   9; end
		 12:	 begin ctx_state_2_l_r =   8; end
		 13:	 begin ctx_state_2_l_r =   9; end
		 14:	 begin ctx_state_2_l_r =  10; end
		 15:	 begin ctx_state_2_l_r =  11; end
		 16:	 begin ctx_state_2_l_r =  12; end
		 17:	 begin ctx_state_2_l_r =  13; end
		 18:	 begin ctx_state_2_l_r =  14; end
		 19:	 begin ctx_state_2_l_r =  15; end
		 20:	 begin ctx_state_2_l_r =  16; end
		 21:	 begin ctx_state_2_l_r =  17; end
		 22:	 begin ctx_state_2_l_r =  18; end
		 23:	 begin ctx_state_2_l_r =  19; end
		 24:	 begin ctx_state_2_l_r =  18; end
		 25:	 begin ctx_state_2_l_r =  19; end
		 26:	 begin ctx_state_2_l_r =  22; end
		 27:	 begin ctx_state_2_l_r =  23; end
		 28:	 begin ctx_state_2_l_r =  22; end
		 29:	 begin ctx_state_2_l_r =  23; end
		 30:	 begin ctx_state_2_l_r =  24; end
		 31:	 begin ctx_state_2_l_r =  25; end
		 32:	 begin ctx_state_2_l_r =  26; end
		 33:	 begin ctx_state_2_l_r =  27; end
		 34:	 begin ctx_state_2_l_r =  26; end
		 35:	 begin ctx_state_2_l_r =  27; end
		 36:	 begin ctx_state_2_l_r =  30; end
		 37:	 begin ctx_state_2_l_r =  31; end
		 38:	 begin ctx_state_2_l_r =  30; end
		 39:	 begin ctx_state_2_l_r =  31; end
		 40:	 begin ctx_state_2_l_r =  32; end
		 41:	 begin ctx_state_2_l_r =  33; end
		 42:	 begin ctx_state_2_l_r =  32; end
		 43:	 begin ctx_state_2_l_r =  33; end
		 44:	 begin ctx_state_2_l_r =  36; end
		 45:	 begin ctx_state_2_l_r =  37; end
		 46:	 begin ctx_state_2_l_r =  36; end
		 47:	 begin ctx_state_2_l_r =  37; end
		 48:	 begin ctx_state_2_l_r =  38; end
		 49:	 begin ctx_state_2_l_r =  39; end
		 50:	 begin ctx_state_2_l_r =  38; end
		 51:	 begin ctx_state_2_l_r =  39; end
		 52:	 begin ctx_state_2_l_r =  42; end
		 53:	 begin ctx_state_2_l_r =  43; end
		 54:	 begin ctx_state_2_l_r =  42; end
		 55:	 begin ctx_state_2_l_r =  43; end
		 56:	 begin ctx_state_2_l_r =  44; end
		 57:	 begin ctx_state_2_l_r =  45; end
		 58:	 begin ctx_state_2_l_r =  44; end
		 59:	 begin ctx_state_2_l_r =  45; end
		 60:	 begin ctx_state_2_l_r =  46; end
		 61:	 begin ctx_state_2_l_r =  47; end
		 62:	 begin ctx_state_2_l_r =  48; end
		 63:	 begin ctx_state_2_l_r =  49; end
		 64:	 begin ctx_state_2_l_r =  48; end
		 65:	 begin ctx_state_2_l_r =  49; end
		 66:	 begin ctx_state_2_l_r =  50; end
		 67:	 begin ctx_state_2_l_r =  51; end
		 68:	 begin ctx_state_2_l_r =  52; end
		 69:	 begin ctx_state_2_l_r =  53; end
		 70:	 begin ctx_state_2_l_r =  52; end
		 71:	 begin ctx_state_2_l_r =  53; end
		 72:	 begin ctx_state_2_l_r =  54; end
		 73:	 begin ctx_state_2_l_r =  55; end
		 74:	 begin ctx_state_2_l_r =  54; end
		 75:	 begin ctx_state_2_l_r =  55; end
		 76:	 begin ctx_state_2_l_r =  56; end
		 77:	 begin ctx_state_2_l_r =  57; end
		 78:	 begin ctx_state_2_l_r =  58; end
		 79:	 begin ctx_state_2_l_r =  59; end
		 80:	 begin ctx_state_2_l_r =  58; end
		 81:	 begin ctx_state_2_l_r =  59; end
		 82:	 begin ctx_state_2_l_r =  60; end
		 83:	 begin ctx_state_2_l_r =  61; end
		 84:	 begin ctx_state_2_l_r =  60; end
		 85:	 begin ctx_state_2_l_r =  61; end
		 86:	 begin ctx_state_2_l_r =  60; end
		 87:	 begin ctx_state_2_l_r =  61; end
		 88:	 begin ctx_state_2_l_r =  62; end
		 89:	 begin ctx_state_2_l_r =  63; end
		 90:	 begin ctx_state_2_l_r =  64; end
		 91:	 begin ctx_state_2_l_r =  65; end
		 92:	 begin ctx_state_2_l_r =  64; end
		 93:	 begin ctx_state_2_l_r =  65; end
		 94:	 begin ctx_state_2_l_r =  66; end
		 95:	 begin ctx_state_2_l_r =  67; end
		 96:	 begin ctx_state_2_l_r =  66; end
		 97:	 begin ctx_state_2_l_r =  67; end
		 98:	 begin ctx_state_2_l_r =  66; end
		 99:	 begin ctx_state_2_l_r =  67; end
		100:	 begin ctx_state_2_l_r =  68; end
		101:	 begin ctx_state_2_l_r =  69; end
		102:	 begin ctx_state_2_l_r =  68; end
		103:	 begin ctx_state_2_l_r =  69; end
		104:	 begin ctx_state_2_l_r =  70; end
		105:	 begin ctx_state_2_l_r =  71; end
		106:	 begin ctx_state_2_l_r =  70; end
		107:	 begin ctx_state_2_l_r =  71; end
		108:	 begin ctx_state_2_l_r =  70; end
		109:	 begin ctx_state_2_l_r =  71; end
		110:	 begin ctx_state_2_l_r =  72; end
		111:	 begin ctx_state_2_l_r =  73; end
		112:	 begin ctx_state_2_l_r =  72; end
		113:	 begin ctx_state_2_l_r =  73; end
		114:	 begin ctx_state_2_l_r =  72; end
		115:	 begin ctx_state_2_l_r =  73; end
		116:	 begin ctx_state_2_l_r =  74; end
		117:	 begin ctx_state_2_l_r =  75; end
		118:	 begin ctx_state_2_l_r =  74; end
		119:	 begin ctx_state_2_l_r =  75; end
		120:	 begin ctx_state_2_l_r =  74; end
		121:	 begin ctx_state_2_l_r =  75; end
		122:	 begin ctx_state_2_l_r =  76; end
		123:	 begin ctx_state_2_l_r =  77; end
		124:	 begin ctx_state_2_l_r =  76; end
		125:	 begin ctx_state_2_l_r =  77; end
		126:	 begin ctx_state_2_l_r = 126; end
		127:	 begin ctx_state_2_l_r = 127; end
		default: begin ctx_state_2_l_r =   0; end		
	endcase
end


always @* begin
	if(ctx_state_2_r<=123)
		ctx_state_2_m_r = ctx_state_2_r + 2;
	else 
		ctx_state_2_m_r = ctx_state_2_r;
end


always @* begin
	if(bin_delay_2_r==ctx_state_2_r[0])
		ctx_state_2_u_r = ctx_state_2_m_r;
	else
		ctx_state_2_u_r = ctx_state_2_l_r;
end

//bin 3
always @* begin
	case(ctx_state_3_r)
		  0:	 begin ctx_state_3_l_r =   1; end
		  1:	 begin ctx_state_3_l_r =   0; end
		  2:	 begin ctx_state_3_l_r =   0; end
		  3:	 begin ctx_state_3_l_r =   1; end
		  4:	 begin ctx_state_3_l_r =   2; end
		  5:	 begin ctx_state_3_l_r =   3; end
		  6:	 begin ctx_state_3_l_r =   4; end
		  7:	 begin ctx_state_3_l_r =   5; end
		  8:	 begin ctx_state_3_l_r =   4; end
		  9:	 begin ctx_state_3_l_r =   5; end
		 10:	 begin ctx_state_3_l_r =   8; end
		 11:	 begin ctx_state_3_l_r =   9; end
		 12:	 begin ctx_state_3_l_r =   8; end
		 13:	 begin ctx_state_3_l_r =   9; end
		 14:	 begin ctx_state_3_l_r =  10; end
		 15:	 begin ctx_state_3_l_r =  11; end
		 16:	 begin ctx_state_3_l_r =  12; end
		 17:	 begin ctx_state_3_l_r =  13; end
		 18:	 begin ctx_state_3_l_r =  14; end
		 19:	 begin ctx_state_3_l_r =  15; end
		 20:	 begin ctx_state_3_l_r =  16; end
		 21:	 begin ctx_state_3_l_r =  17; end
		 22:	 begin ctx_state_3_l_r =  18; end
		 23:	 begin ctx_state_3_l_r =  19; end
		 24:	 begin ctx_state_3_l_r =  18; end
		 25:	 begin ctx_state_3_l_r =  19; end
		 26:	 begin ctx_state_3_l_r =  22; end
		 27:	 begin ctx_state_3_l_r =  23; end
		 28:	 begin ctx_state_3_l_r =  22; end
		 29:	 begin ctx_state_3_l_r =  23; end
		 30:	 begin ctx_state_3_l_r =  24; end
		 31:	 begin ctx_state_3_l_r =  25; end
		 32:	 begin ctx_state_3_l_r =  26; end
		 33:	 begin ctx_state_3_l_r =  27; end
		 34:	 begin ctx_state_3_l_r =  26; end
		 35:	 begin ctx_state_3_l_r =  27; end
		 36:	 begin ctx_state_3_l_r =  30; end
		 37:	 begin ctx_state_3_l_r =  31; end
		 38:	 begin ctx_state_3_l_r =  30; end
		 39:	 begin ctx_state_3_l_r =  31; end
		 40:	 begin ctx_state_3_l_r =  32; end
		 41:	 begin ctx_state_3_l_r =  33; end
		 42:	 begin ctx_state_3_l_r =  32; end
		 43:	 begin ctx_state_3_l_r =  33; end
		 44:	 begin ctx_state_3_l_r =  36; end
		 45:	 begin ctx_state_3_l_r =  37; end
		 46:	 begin ctx_state_3_l_r =  36; end
		 47:	 begin ctx_state_3_l_r =  37; end
		 48:	 begin ctx_state_3_l_r =  38; end
		 49:	 begin ctx_state_3_l_r =  39; end
		 50:	 begin ctx_state_3_l_r =  38; end
		 51:	 begin ctx_state_3_l_r =  39; end
		 52:	 begin ctx_state_3_l_r =  42; end
		 53:	 begin ctx_state_3_l_r =  43; end
		 54:	 begin ctx_state_3_l_r =  42; end
		 55:	 begin ctx_state_3_l_r =  43; end
		 56:	 begin ctx_state_3_l_r =  44; end
		 57:	 begin ctx_state_3_l_r =  45; end
		 58:	 begin ctx_state_3_l_r =  44; end
		 59:	 begin ctx_state_3_l_r =  45; end
		 60:	 begin ctx_state_3_l_r =  46; end
		 61:	 begin ctx_state_3_l_r =  47; end
		 62:	 begin ctx_state_3_l_r =  48; end
		 63:	 begin ctx_state_3_l_r =  49; end
		 64:	 begin ctx_state_3_l_r =  48; end
		 65:	 begin ctx_state_3_l_r =  49; end
		 66:	 begin ctx_state_3_l_r =  50; end
		 67:	 begin ctx_state_3_l_r =  51; end
		 68:	 begin ctx_state_3_l_r =  52; end
		 69:	 begin ctx_state_3_l_r =  53; end
		 70:	 begin ctx_state_3_l_r =  52; end
		 71:	 begin ctx_state_3_l_r =  53; end
		 72:	 begin ctx_state_3_l_r =  54; end
		 73:	 begin ctx_state_3_l_r =  55; end
		 74:	 begin ctx_state_3_l_r =  54; end
		 75:	 begin ctx_state_3_l_r =  55; end
		 76:	 begin ctx_state_3_l_r =  56; end
		 77:	 begin ctx_state_3_l_r =  57; end
		 78:	 begin ctx_state_3_l_r =  58; end
		 79:	 begin ctx_state_3_l_r =  59; end
		 80:	 begin ctx_state_3_l_r =  58; end
		 81:	 begin ctx_state_3_l_r =  59; end
		 82:	 begin ctx_state_3_l_r =  60; end
		 83:	 begin ctx_state_3_l_r =  61; end
		 84:	 begin ctx_state_3_l_r =  60; end
		 85:	 begin ctx_state_3_l_r =  61; end
		 86:	 begin ctx_state_3_l_r =  60; end
		 87:	 begin ctx_state_3_l_r =  61; end
		 88:	 begin ctx_state_3_l_r =  62; end
		 89:	 begin ctx_state_3_l_r =  63; end
		 90:	 begin ctx_state_3_l_r =  64; end
		 91:	 begin ctx_state_3_l_r =  65; end
		 92:	 begin ctx_state_3_l_r =  64; end
		 93:	 begin ctx_state_3_l_r =  65; end
		 94:	 begin ctx_state_3_l_r =  66; end
		 95:	 begin ctx_state_3_l_r =  67; end
		 96:	 begin ctx_state_3_l_r =  66; end
		 97:	 begin ctx_state_3_l_r =  67; end
		 98:	 begin ctx_state_3_l_r =  66; end
		 99:	 begin ctx_state_3_l_r =  67; end
		100:	 begin ctx_state_3_l_r =  68; end
		101:	 begin ctx_state_3_l_r =  69; end
		102:	 begin ctx_state_3_l_r =  68; end
		103:	 begin ctx_state_3_l_r =  69; end
		104:	 begin ctx_state_3_l_r =  70; end
		105:	 begin ctx_state_3_l_r =  71; end
		106:	 begin ctx_state_3_l_r =  70; end
		107:	 begin ctx_state_3_l_r =  71; end
		108:	 begin ctx_state_3_l_r =  70; end
		109:	 begin ctx_state_3_l_r =  71; end
		110:	 begin ctx_state_3_l_r =  72; end
		111:	 begin ctx_state_3_l_r =  73; end
		112:	 begin ctx_state_3_l_r =  72; end
		113:	 begin ctx_state_3_l_r =  73; end
		114:	 begin ctx_state_3_l_r =  72; end
		115:	 begin ctx_state_3_l_r =  73; end
		116:	 begin ctx_state_3_l_r =  74; end
		117:	 begin ctx_state_3_l_r =  75; end
		118:	 begin ctx_state_3_l_r =  74; end
		119:	 begin ctx_state_3_l_r =  75; end
		120:	 begin ctx_state_3_l_r =  74; end
		121:	 begin ctx_state_3_l_r =  75; end
		122:	 begin ctx_state_3_l_r =  76; end
		123:	 begin ctx_state_3_l_r =  77; end
		124:	 begin ctx_state_3_l_r =  76; end
		125:	 begin ctx_state_3_l_r =  77; end
		126:	 begin ctx_state_3_l_r = 126; end
		127:	 begin ctx_state_3_l_r = 127; end
		default: begin ctx_state_3_l_r =   0; end		
	endcase
end


always @* begin
	if(ctx_state_3_r<=123)
		ctx_state_3_m_r = ctx_state_3_r + 2;
	else 
		ctx_state_3_m_r = ctx_state_3_r;
end


always @* begin
	if(bin_delay_3_r==ctx_state_3_r[0])
		ctx_state_3_u_r = ctx_state_3_m_r;
	else
		ctx_state_3_u_r = ctx_state_3_l_r;
end


//mps and pstate for modeling_ctx_pair
always @* begin
	if(coding_mode_delay_0_r==2'd0) begin
		mps_0_r    = ctx_state_0_r[0];
		pstate_0_r = ctx_state_0_r[6:1];
	end
	else begin
		mps_0_r    = 1;
		pstate_0_r = 6'h3f;
	end
end

always @* begin
	if(coding_mode_delay_1_r==2'd0) begin
		mps_1_r    = ctx_state_1_r[0];
		pstate_1_r = ctx_state_1_r[6:1];
	end
	else begin
		mps_1_r    = 1;
		pstate_1_r = 6'h3f;
	end
end

always @* begin
	if(coding_mode_delay_2_r==2'd0) begin
		mps_2_r    = ctx_state_2_r[0];
		pstate_2_r = ctx_state_2_r[6:1];
	end
	else begin
		mps_2_r    = 1; 
		pstate_2_r = 6'h3f;
	end
	
end

always @* begin
	if(coding_mode_delay_3_r==2'd0) begin
		mps_3_r    = ctx_state_3_r[0];
		pstate_3_r = ctx_state_3_r[6:1];
	end
	else begin
		mps_3_r    = 1;
		pstate_3_r = 6'h3f;
	end
end

//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//                                             
//    Sequential Logic               
//                                             
//-----------------------------------------------------------------------------------------------------------------------------------------------------------

always @* begin     
	if(w_addr_delay_1_r==r_addr_1_r)
		w_addr_equal_1_r = 1;
	else
		w_addr_equal_1_r = 0;
end

always @* begin     
	if(w_addr_delay_2_r==r_addr_2_r)
		w_addr_equal_2_r = 1;
	else
		w_addr_equal_2_r = 0;
end

always @* begin     
	if(w_addr_delay_3_r==r_addr_3_r)
		w_addr_equal_3_r = 1;
	else
		w_addr_equal_3_r = 0;
end

always @* begin     
	if(w_addr_delay_4_r==r_addr_4_r)
		w_addr_equal_4_r = 1;
	else
		w_addr_equal_4_r = 0;
end

reg	 signed [6:0]	clip_qp_r			;	//clip qp
wire signed [7:0]	ctx_50_m_w			;
wire signed [7:0]	ctx_50_n_w			;
wire signed [15:0] 	ctx_50_a_w			;
wire signed [15:0] 	ctx_50_b_w			;
wire signed [7:0]	ctx_state_50_w		;
reg	 signed [6:0]	clip_ctx_state_50_r	;
wire				mps_state_50_w		;

reg					cabac_start_delay1	;
reg					cabac_start_delay2	;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		cabac_start_delay1 <= 'd0;
		cabac_start_delay2 <= 'd0;	
	end
	else begin
		cabac_start_delay1 <= cabac_start_i;
		cabac_start_delay2 <= cabac_start_delay1;
	end
end

//clip qp
always @* begin
	if(slice_qp_i<0)
		clip_qp_r = 1;
	else if(slice_qp_i>51)
		clip_qp_r = 51;
	else
		clip_qp_r = slice_qp_i;// (`INIT_QP);	
end

assign	ctx_50_m_w = slice_type_i==(`SLICE_TYPE_I) ? 8'h00 : 8'hf1;
assign	ctx_50_n_w = slice_type_i==(`SLICE_TYPE_I) ? 8'h30 : 8'h48;
assign	ctx_50_a_w = ctx_50_m_w * clip_qp_r;
assign	ctx_50_b_w = ctx_50_a_w >> 4      ;// + ctx_50_n_w;
assign 	ctx_state_50_w = ctx_50_b_w + ctx_50_n_w;
assign	mps_state_50_w = (clip_ctx_state_50_r>='d64) ? 'd1 : 'd0;
always @* begin
	if(ctx_state_50_w<0)
		clip_ctx_state_50_r = 1;
	else if(ctx_state_50_w>126)
		clip_ctx_state_50_r = 126;
	else
		clip_ctx_state_50_r = ctx_state_50_w;	
end

//ctx_state_50_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		ctx_state_50_r <= 'd0; 
	else if(cabac_start_delay2 && first_mb_flag_i)
		ctx_state_50_r <= ((mps_state_50_w ? (clip_ctx_state_50_r-'d64) : ('d63-clip_ctx_state_50_r)) << 1) + mps_state_50_w;
	else if(reg_00_r && ~comparator01 && ~comparator02 && ~comparator03) 
		ctx_state_50_r <= ctx_state_0_u_r;
	else if(reg_10_r && ~comparator12 && ~comparator13) 
		ctx_state_50_r <= ctx_state_1_u_r;
	else if(reg_20_r && ~comparator23) 
		ctx_state_50_r <= ctx_state_2_u_r;
	else if(reg_30_r) 
		ctx_state_50_r <= ctx_state_3_u_r;
	else 
		ctx_state_50_r <= ctx_state_50_r;
end


wire signed [7:0]	ctx_51_m_w			;
wire signed [7:0]	ctx_51_n_w			;
wire signed [15:0] 	ctx_51_a_w			;
wire signed [15:0] 	ctx_51_b_w			;
wire signed [7:0]	ctx_state_51_w		;
reg	 signed [6:0]	clip_ctx_state_51_r	;
wire				mps_state_51_w		;

assign	ctx_51_m_w = slice_type_i==(`SLICE_TYPE_I) ? 8'hfb : 8'hf6;
assign	ctx_51_n_w = slice_type_i==(`SLICE_TYPE_I) ? 8'h30 : 8'h38;
assign	ctx_51_a_w = ctx_51_m_w * clip_qp_r;
assign	ctx_51_b_w = ctx_51_a_w >>> 4;
assign	ctx_state_51_w = ctx_51_b_w + ctx_51_n_w;
assign	mps_state_51_w = (clip_ctx_state_51_r>='d64) ? 'd1 : 'd0;
always @* begin
	if(ctx_state_51_w<0)
		clip_ctx_state_51_r = 1;
	else if(ctx_state_51_w>126)
		clip_ctx_state_51_r = 126;
	else
		clip_ctx_state_51_r = ctx_state_51_w;	
end

//ctx_state_51_r
always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		ctx_state_51_r <= 'd0; 
	else if(cabac_start_delay2 && first_mb_flag_i)
		ctx_state_51_r <= ((mps_state_51_w ? (clip_ctx_state_51_r-'d64) : ('d63-clip_ctx_state_51_r)) << 1) + mps_state_51_w;
	else if(reg_01_r && ~comparator01 && ~comparator02 && ~comparator03) 
		ctx_state_51_r <= ctx_state_0_u_r;
	else if(reg_11_r && ~comparator12 && ~comparator13) 
		ctx_state_51_r <= ctx_state_1_u_r;
	else if(reg_21_r && ~comparator23) 
		ctx_state_51_r <= ctx_state_2_u_r;
	else if(reg_31_r) 
		ctx_state_51_r <= ctx_state_3_u_r;
	else 
		ctx_state_51_r <= ctx_state_51_r;
end


//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//sram 0
assign	r_en_0_w   = r_en_0_r		; // read enable 
assign  r_addr_0_w = r_addr_0_r		; // read address
		
assign	w_en_0_w   = w_en_0_r		; // write enable 
assign	w_addr_0_w = w_addr_0_r		; // write address 
assign  w_data_0_w = w_data_0_r		; // write data 

reg		rw_simultaneous_case_0_r	;

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		rw_simultaneous_case_0_r <= 0;
	else if(r_en_0_r==w_en_0_r && r_addr_0_r==w_addr_0_r)
		rw_simultaneous_case_0_r <= 1;
	else
		rw_simultaneous_case_0_r <= 0;
end

always @* begin
	r_data_0_r = (w_addr_0_r==w_addr_delay_0_r) ? (w_data_0_r) : (rw_simultaneous_case_0_r ? w_data_delay_0_r : r_data_0_w);	
end

//read
always @* begin                               // read enable : regular mode && sram bank number==0
	if(valid_num_modeling_i>=1) begin
		if( (modeling_pair_0_i[7:5]==3'd0 && modeling_pair_0_i[10:9]==2'd0) || (modeling_pair_1_i[7:5]==3'd0 && modeling_pair_1_i[10:9]==2'd0)
			 || (modeling_pair_2_i[7:5]==3'd0 && modeling_pair_2_i[10:9]==2'd0) || (modeling_pair_3_i[7:5]==3'd0 && modeling_pair_3_i[10:9]==2'd0) )
			r_en_0_r = 1;
		else
			r_en_0_r = 0;
	end
	else
		r_en_0_r = 0;
end

always @* begin                               // read address : sram bank && regular mode ? address  
	if(valid_num_modeling_i>=1) begin
		if(modeling_pair_0_i[7:5]==3'd0 && modeling_pair_0_i[10:9]==2'b00) begin
			r_addr_0_r    = modeling_pair_0_i[4:0]	;
		end
		else if(modeling_pair_1_i[7:5]==3'd0 && modeling_pair_1_i[10:9]==2'b00) begin
			r_addr_0_r    = modeling_pair_1_i[4:0]	;
		end
		else if(modeling_pair_2_i[7:5]==3'd0 && modeling_pair_2_i[10:9]==2'b00) begin
			r_addr_0_r    = modeling_pair_2_i[4:0]	; 
		end
		else if(modeling_pair_3_i[7:5]==3'd0 && modeling_pair_3_i[10:9]==2'b00) begin
			r_addr_0_r    = modeling_pair_3_i[4:0]	;
		end
		else begin
			r_addr_0_r  = 6'd63;
		end
	end
	else begin
		r_addr_0_r  = 6'd63;
	end
end


//write
always @(posedge clk or negedge rst_n) begin  // read enable delay 1 cycles 
	if(!rst_n)
		r_en_delay_0_r <= 0;
	else
		r_en_delay_0_r <= r_en_0_r;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n) 
		w_addr_delay_0_r <= 0;
	else
		w_addr_delay_0_r <= r_addr_0_r;
end

always @* begin     
	if(w_addr_delay_0_r==r_addr_0_r)         //judge conflict 
		w_addr_equal_0_r = 1;
	else
		w_addr_equal_0_r = 0;
end

always @(posedge clk or negedge rst_n) begin // write enable : initial enable ? initial enable : read enable ? not conflict  
	if(!rst_n)
		w_en_0_r <= 0;
	else
		w_en_0_r <= w_en_ctx_state_0_i || (r_en_delay_0_r && w_addr_equal_0_r==0);
end

always @(posedge clk or negedge rst_n) begin //write address :initial enable ? initial address : read address 
	if(!rst_n)
		w_addr_0_r <= 0;
	else
		w_addr_0_r <= w_en_ctx_state_0_i ? w_addr_ctx_state_0_i : w_addr_delay_0_r;
end

always @(posedge clk or negedge rst_n) begin //write data 
	if(!rst_n)
		w_data_0_r <= 0;
	else if(w_en_ctx_state_0_i)              //initial 
		w_data_0_r <= w_data_ctx_state_0_i;
	else if(ctx_pair_delay_0_r[7:5]==3'd0 && ~comparator01 && ~comparator02 && ~comparator03) 
		w_data_0_r <= ctx_state_0_u_r;
	else if(ctx_pair_delay_1_r[7:5]==3'd0 && ~comparator12 && ~comparator13) 
		w_data_0_r <= ctx_state_1_u_r;
	else if(ctx_pair_delay_2_r[7:5]==3'd0 && ~comparator23) 
		w_data_0_r <= ctx_state_2_u_r;
	else if(ctx_pair_delay_3_r[7:5]==3'd0) 
		w_data_0_r <= ctx_state_3_u_r;
	else 
		w_data_0_r <= w_data_0_r;
end


//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//sram 1
assign	r_en_1_w   = r_en_1_r		;
assign  r_addr_1_w = r_addr_1_r		;
		
assign	w_en_1_w   = w_en_1_r		;
assign	w_addr_1_w = w_addr_1_r		;
assign  w_data_1_w = w_data_1_r		;

reg				rw_simultaneous_case_1_r	;

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		rw_simultaneous_case_1_r <= 0;
	else if(r_en_1_r==w_en_1_r && r_addr_1_r==w_addr_1_r)
		rw_simultaneous_case_1_r <= 1;
	else
		rw_simultaneous_case_1_r <= 0;
end

always @* begin
	r_data_1_r = (w_addr_1_r==w_addr_delay_1_r) ? w_data_1_r : (rw_simultaneous_case_1_r ? w_data_delay_1_r : r_data_1_w);
end

//read
always @* begin
	if(valid_num_modeling_i>=1) begin
		if( (modeling_pair_0_i[7:5]==3'd1 && modeling_pair_0_i[10:9]==0) || (modeling_pair_1_i[7:5]==3'd1 && modeling_pair_1_i[10:9]==0)
			 || (modeling_pair_2_i[7:5]==3'd1 && modeling_pair_2_i[10:9]==0) || (modeling_pair_3_i[7:5]==3'd1 && modeling_pair_3_i[10:9]==0) )
			r_en_1_r = 1;
		else
			r_en_1_r = 0;
	end
	else
		r_en_1_r = 0;
end

always @* begin
	if(valid_num_modeling_i>=1) begin
		if(modeling_pair_0_i[7:5]==3'd1 && modeling_pair_0_i[10:9]==2'b00) begin
			r_addr_1_r  = modeling_pair_0_i[4:0];
		end
		else if(modeling_pair_1_i[7:5]==3'd1 && modeling_pair_1_i[10:9]==2'b00) begin
			r_addr_1_r  = modeling_pair_1_i[4:0];
		end
		else if(modeling_pair_2_i[7:5]==3'd1 && modeling_pair_2_i[10:9]==2'b00) begin
			r_addr_1_r  = modeling_pair_2_i[4:0]; 
		end
		else if(modeling_pair_3_i[7:5]==3'd1 && modeling_pair_3_i[10:9]==2'b00) begin
			r_addr_1_r  = modeling_pair_3_i[4:0];
		end
		else begin
			r_addr_1_r  = 6'd63;
		end
	end
	else begin
		r_addr_1_r  = 6'd63;
	end
end

//write
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		r_en_delay_1_r <= 0;
	else
		r_en_delay_1_r <= r_en_1_r;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_en_1_r <= 0;
	else
		w_en_1_r <= w_en_ctx_state_1_i || (r_en_delay_1_r && w_addr_equal_1_r==0);
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_addr_delay_1_r <= 0;
	else
		w_addr_delay_1_r <= r_addr_1_r;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_addr_1_r <= 0;
	else
		w_addr_1_r <= w_en_ctx_state_1_i ? w_addr_ctx_state_1_i : w_addr_delay_1_r;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_data_1_r <= 0;
	else if(w_en_ctx_state_1_i)
		w_data_1_r <= w_data_ctx_state_1_i;
	else if(ctx_pair_delay_0_r[7:5]==3'd1 && ~comparator01 && ~comparator02 && ~comparator03) 
		w_data_1_r <= ctx_state_0_u_r;
	else if(ctx_pair_delay_1_r[7:5]==3'd1 && ~comparator12 && ~comparator13) 
		w_data_1_r <= ctx_state_1_u_r;
	else if(ctx_pair_delay_2_r[7:5]==3'd1 && ~comparator23) 
		w_data_1_r <= ctx_state_2_u_r;
	else if(ctx_pair_delay_3_r[7:5]==3'd1) 
		w_data_1_r <= ctx_state_3_u_r;
	else 
		w_data_1_r <= w_data_1_r;
end

//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//sram 2
assign	r_en_2_w   = r_en_2_r		;
assign  r_addr_2_w = r_addr_2_r		;
		
assign	w_en_2_w   = w_en_2_r		;
assign	w_addr_2_w = w_addr_2_r		;
assign  w_data_2_w = w_data_2_r		;

reg					r_en_2_delay_r	;
reg					w_en_2_delay_r	;

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		r_en_2_delay_r <= 0;
		w_en_2_delay_r <= 0;
	end
	else begin
		r_en_2_delay_r <= r_en_2_r;
		w_en_2_delay_r <= w_en_2_r;
	end
end

reg				rw_simultaneous_case_2_r	;

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		rw_simultaneous_case_2_r <= 0;
	else if(r_en_2_r==w_en_2_r && r_addr_2_r==w_addr_2_r)
		rw_simultaneous_case_2_r <= 1;
	else
		rw_simultaneous_case_2_r <= 0;
end

always @* begin
	r_data_2_r = (w_addr_2_r==w_addr_delay_2_r) ? (w_data_2_r) : (rw_simultaneous_case_2_r ? w_data_delay_2_r : r_data_2_w);		
end

//read
always @* begin
	if(valid_num_modeling_i>=1) begin
		if( (modeling_pair_0_i[7:5]==3'd2 && modeling_pair_0_i[10:9]==0) || (modeling_pair_1_i[7:5]==3'd2 && modeling_pair_1_i[10:9]==0)
			 || (modeling_pair_2_i[7:5]==3'd2 && modeling_pair_2_i[10:9]==0) || (modeling_pair_3_i[7:5]==3'd2 && modeling_pair_3_i[10:9]==0) )
			r_en_2_r = 1;
		else
			r_en_2_r = 0;
	end
	else
		r_en_2_r = 0;
		
end

always @* begin  
	if(valid_num_modeling_i>=1) begin
		if(modeling_pair_0_i[7:5]==3'd2 && modeling_pair_0_i[10:9]==2'b00) begin
			r_addr_2_r  = modeling_pair_0_i[4:0];
		end
		else if(modeling_pair_1_i[7:5]==3'd2 && modeling_pair_1_i[10:9]==2'b00) begin
			r_addr_2_r  = modeling_pair_1_i[4:0];
		end
		else if(modeling_pair_2_i[7:5]==3'd2 && modeling_pair_2_i[10:9]==2'b00) begin
			r_addr_2_r  = modeling_pair_2_i[4:0]; 
		end
		else if(modeling_pair_3_i[7:5]==3'd2 && modeling_pair_3_i[10:9]==2'b00) begin
			r_addr_2_r  = modeling_pair_3_i[4:0];
		end
		else begin
			r_addr_2_r  = 6'd63;
		end               
	end
	else begin
		r_addr_2_r  = 6'd63;
	end
end

//write
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		r_en_delay_2_r <= 0;
	else
		r_en_delay_2_r <= r_en_2_r;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_en_2_r <= 0;
	else
		w_en_2_r <= w_en_ctx_state_2_i || (r_en_delay_2_r && w_addr_equal_2_r==0);
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_addr_delay_2_r <= 0;
	else 
		w_addr_delay_2_r <= r_addr_2_r;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_addr_2_r <= 0;
	else
		w_addr_2_r <= w_en_ctx_state_2_i ? w_addr_ctx_state_2_i : w_addr_delay_2_r;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_data_2_r <= 0;
	else if(w_en_ctx_state_2_i)
		w_data_2_r <= w_data_ctx_state_2_i;
	else if(ctx_pair_delay_0_r[7:5]==3'd2 && ~comparator01 && ~comparator02 && ~comparator03) 
		w_data_2_r <= ctx_state_0_u_r;
	else if(ctx_pair_delay_1_r[7:5]==3'd2 && ~comparator12 && ~comparator13) 
		w_data_2_r <= ctx_state_1_u_r;
	else if(ctx_pair_delay_2_r[7:5]==3'd2 && ~comparator23) 
		w_data_2_r <= ctx_state_2_u_r;
	else if(ctx_pair_delay_3_r[7:5]==3'd2) 
		w_data_2_r <= ctx_state_3_u_r;
	else 
		w_data_2_r <= w_data_2_r;
end

//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//sram 3
assign	r_en_3_w   = r_en_3_r		;
assign  r_addr_3_w = r_addr_3_r		;
		
assign	w_en_3_w   = w_en_3_r		;
assign	w_addr_3_w = w_addr_3_r		;
assign  w_data_3_w = w_data_3_r		;

reg					r_en_3_delay_r	;
reg					w_en_3_delay_r	;

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		r_en_3_delay_r <= 0;
		w_en_3_delay_r <= 0;
	end
	else begin
		r_en_3_delay_r <= r_en_3_r;
		w_en_3_delay_r <= w_en_3_r;
	end
end

reg				rw_simultaneous_case_3_r	;

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		rw_simultaneous_case_3_r <= 0;
	else if(r_en_3_r==w_en_3_r && r_addr_3_r==w_addr_3_r)
		rw_simultaneous_case_3_r <= 1;
	else
		rw_simultaneous_case_3_r <= 0;
end

always @* begin
	r_data_3_r = (w_addr_3_r==w_addr_delay_3_r) ? (w_data_3_r) : (rw_simultaneous_case_3_r ? w_data_delay_3_r : r_data_3_w);		
end

//read
always @* begin
	if(valid_num_modeling_i>=1) begin
		if( (modeling_pair_0_i[7:5]==3'd3 && modeling_pair_0_i[10:9]==0) || (modeling_pair_1_i[7:5]==3'd3 && modeling_pair_1_i[10:9]==0)
			 || (modeling_pair_2_i[7:5]==3'd3 && modeling_pair_2_i[10:9]==0) || (modeling_pair_3_i[7:5]==3'd3 && modeling_pair_3_i[10:9]==0) )
			r_en_3_r = 1;
		else
			r_en_3_r = 0;
	end
	else
		r_en_3_r = 0;		
end

always @* begin
	if(valid_num_modeling_i>=1) begin
		if(modeling_pair_0_i[7:5]==3'd3 && modeling_pair_0_i[10:9]==2'b00) begin
			r_addr_3_r  = modeling_pair_0_i[4:0];
		end
		else if(modeling_pair_1_i[7:5]==3'd3 && modeling_pair_1_i[10:9]==2'b00) begin
			r_addr_3_r  = modeling_pair_1_i[4:0];
		end
		else if(modeling_pair_2_i[7:5]==3'd3 && modeling_pair_2_i[10:9]==2'b00) begin
			r_addr_3_r  = modeling_pair_2_i[4:0]; 
		end
		else if(modeling_pair_3_i[7:5]==3'd3 && modeling_pair_3_i[10:9]==2'b00) begin
			r_addr_3_r  = modeling_pair_3_i[4:0];
		end
		else begin
			r_addr_3_r  = 6'd63;
		end            
	end
	else begin
		r_addr_3_r  = 6'd63;
	end
end


//write
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		r_en_delay_3_r <= 0;
	else 
		r_en_delay_3_r <= r_en_3_r;
end



always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_en_3_r <= 0;
	else 
		w_en_3_r <= w_en_ctx_state_3_i || (r_en_delay_3_r && w_addr_equal_3_r==0);
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_addr_delay_3_r <= 0;
	else
		w_addr_delay_3_r <= w_en_ctx_state_3_i ? w_addr_ctx_state_3_i : r_addr_3_r;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_addr_3_r <= 0;
	else 
		w_addr_3_r <= w_en_ctx_state_3_i ? w_addr_ctx_state_3_i : w_addr_delay_3_r;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_data_3_r <= 0;
	else if(w_en_ctx_state_3_i)
		w_data_3_r <= w_data_ctx_state_3_i;
	else if(ctx_pair_delay_0_r[7:5]==3'd3 && ~comparator01 && ~comparator02 && ~comparator03) 
		w_data_3_r <= ctx_state_0_u_r;
	else if(ctx_pair_delay_1_r[7:5]==3'd3 && ~comparator12 && ~comparator13) 
		w_data_3_r <= ctx_state_1_u_r;
	else if(ctx_pair_delay_2_r[7:5]==3'd3 && ~comparator23) 
		w_data_3_r <= ctx_state_2_u_r;
	else if(ctx_pair_delay_3_r[7:5]==3'd3) 
		w_data_3_r <= ctx_state_3_u_r;
	else 
		w_data_3_r <= w_data_3_r;
end

//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//sram 4
assign	r_en_4_w   = r_en_4_r		;
assign  r_addr_4_w = r_addr_4_r		;
		
assign	w_en_4_w   = w_en_4_r		;
assign	w_addr_4_w = w_addr_4_r		;
assign  w_data_4_w = w_data_4_r		;

reg					r_en_4_delay_r	;
reg					w_en_4_delay_r	;

always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		r_en_4_delay_r <= 0;
		w_en_4_delay_r <= 0;
	end
	else begin
		r_en_4_delay_r <= r_en_4_r;
		w_en_4_delay_r <= w_en_4_r;
	end
end

reg				rw_simultaneous_case_4_r	;

always @(posedge clk or negedge rst_n) begin
	if(~rst_n)
		rw_simultaneous_case_4_r <= 0;
	else if(r_en_4_r==w_en_4_r && r_addr_4_r==w_addr_4_r)
		rw_simultaneous_case_4_r <= 1;
	else
		rw_simultaneous_case_4_r <= 0;
end

always @* begin
	r_data_4_r = (w_addr_4_r==w_addr_delay_4_r) ? (w_data_4_r) : (rw_simultaneous_case_4_r ? w_data_delay_4_r : r_data_4_w);		
end

//read
always @* begin
	if(valid_num_modeling_i>=1) begin
		if( (modeling_pair_0_i[7:5]==3'd4 && modeling_pair_0_i[10:9]==0) || (modeling_pair_1_i[7:5]==3'd4 && modeling_pair_1_i[10:9]==0)
			 || (modeling_pair_2_i[7:5]==3'd4 && modeling_pair_2_i[10:9]==0) || (modeling_pair_3_i[7:5]==3'd4 && modeling_pair_3_i[10:9]==0) )
			r_en_4_r = 1;
		else
			r_en_4_r = 0;
	end
	else
		r_en_4_r = 0;		
end

always @* begin
	if(valid_num_modeling_i>=1) begin
		if(modeling_pair_0_i[7:5]==3'd4 && modeling_pair_0_i[10:9]==2'b00) begin
			r_addr_4_r  = modeling_pair_0_i[4:0];
		end
		else if(modeling_pair_1_i[7:5]==3'd4 && modeling_pair_1_i[10:9]==2'b00) begin
			r_addr_4_r  = modeling_pair_1_i[4:0];
		end
		else if(modeling_pair_2_i[7:5]==3'd4 && modeling_pair_2_i[10:9]==2'b00) begin
			r_addr_4_r  = modeling_pair_2_i[4:0]; 
		end
		else if(modeling_pair_3_i[7:5]==3'd4 && modeling_pair_3_i[10:9]==2'b00) begin
			r_addr_4_r  = modeling_pair_3_i[4:0];
		end
		else begin
			r_addr_4_r  = 6'd63;
		end
	end
	else begin
		r_addr_4_r  = 6'd63;
	end
end

//write
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		r_en_delay_4_r <= 0;
	else 
		r_en_delay_4_r <= r_en_4_r;
end


always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_en_4_r <= 0;
	else 
		w_en_4_r <= w_en_ctx_state_4_i || (r_en_delay_4_r && w_addr_equal_4_r==0);
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_addr_delay_4_r <= 0;
	else
		w_addr_delay_4_r <= w_en_ctx_state_4_i ? w_addr_ctx_state_4_i : r_addr_4_r;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_addr_4_r <= 0;
	else 
		w_addr_4_r <= w_en_ctx_state_4_i ? w_addr_ctx_state_4_i : w_addr_delay_4_r;
end

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		w_data_4_r <= 0;
	else if(w_en_ctx_state_4_i)
		w_data_4_r <= w_data_ctx_state_4_i;
	else if(ctx_pair_delay_0_r[7:5]==3'd4 && ~comparator01 && ~comparator02 && ~comparator03) 
		w_data_4_r <= ctx_state_0_u_r;
	else if(ctx_pair_delay_1_r[7:5]==3'd4 && ~comparator12 && ~comparator13) 
		w_data_4_r <= ctx_state_1_u_r;
	else if(ctx_pair_delay_2_r[7:5]==3'd4 && ~comparator23) 
		w_data_4_r <= ctx_state_2_u_r;
	else if(ctx_pair_delay_3_r[7:5]==3'd4) 
		w_data_4_r <= ctx_state_3_u_r;
	else 
		w_data_4_r <= w_data_4_r;
end


//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//                                             
//    Sub Modules                              
//                                             
//-----------------------------------------------------------------------------------------------------------------------------------------------------------
//get ctx_state data from 6-SRAM and update it after using it
cabac_ctx_state_2p_7x64  cabac_ctx_state_2p_7x64_u0(
	.clk    (clk		),
    .r_en   (r_en_0_w	),
    .r_addr (r_addr_0_w	),
    .r_data (r_data_0_w	),
    .w_en   (w_en_0_w	),
    .w_addr (w_addr_0_w	),
    .w_data (w_data_0_w	)
);

cabac_ctx_state_2p_7x64  cabac_ctx_state_2p_7x64_u1(
	.clk    (clk		),
    .r_en   (r_en_1_w	),
    .r_addr (r_addr_1_w	),
    .r_data (r_data_1_w	),
    .w_en   (w_en_1_w	),
    .w_addr (w_addr_1_w	),
    .w_data (w_data_1_w	)
);

cabac_ctx_state_2p_7x64  cabac_ctx_state_2p_7x64_u2(
	.clk    (clk		),
    .r_en   (r_en_2_w	),
    .r_addr (r_addr_2_w	),
    .r_data (r_data_2_w	),
    .w_en   (w_en_2_w	),
    .w_addr (w_addr_2_w	),
    .w_data (w_data_2_w	)
);

cabac_ctx_state_2p_7x64  cabac_ctx_state_2p_7x64_u3(
	.clk    (clk		),
    .r_en   (r_en_3_w	),
    .r_addr (r_addr_3_w	),
    .r_data (r_data_3_w	),
    .w_en   (w_en_3_w	),
    .w_addr (w_addr_3_w	),
    .w_data (w_data_3_w	)
);

cabac_ctx_state_2p_7x64  cabac_ctx_state_2p_7x64_u4(
	.clk    (clk		),
    .r_en   (r_en_4_w	),
    .r_addr (r_addr_4_w	),
    .r_data (r_data_4_w	),
    .w_en   (w_en_4_w	),
    .w_addr (w_addr_4_w	),
    .w_data (w_data_4_w	)
);

endmodule

