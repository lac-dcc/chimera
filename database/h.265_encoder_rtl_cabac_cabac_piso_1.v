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
// Filename       : cabac_piso.v
// Author         : guo yong
// Created        : 2013-06
// Description    : parallel in serial out module between binarization and modeling,
//                  to provide relatively stable output, piso_1 is used to store
//                  {coding_mode, bin, ctx_idx}, for H.264
//               
//-------------------------------------------------------------------
`include "enc_defines.v"

module cabac_piso_1(
             //input
             clk                    ,   
             rst_n                  ,
             cabac_curr_state_i		,
             bina_ctx_pair_0_i      ,
             bina_ctx_pair_1_i      ,
             bina_ctx_pair_2_i      ,
             bina_ctx_pair_3_i      ,
             bina_ctx_pair_4_i      ,
             bina_ctx_pair_5_i      ,
             bina_ctx_pair_6_i      ,
             bina_ctx_pair_7_i      ,
             bina_ctx_pair_8_i      ,
             bina_ctx_pair_9_i      ,
             bina_ctx_pair_10_i     ,
             bina_ctx_pair_11_i     ,
             bina_ctx_pair_12_i     ,
             bina_ctx_pair_13_i     ,
             bina_ctx_pair_14_i     ,
             bina_ctx_pair_15_i     ,
             valid_num_bina_i       ,
             
             
             //output               
//             piso_1_input_en_o      ,
             valid_num_modeling_o   ,
             modeling_pair_0_o      ,
             modeling_pair_1_o      ,
             modeling_pair_2_o      ,
             modeling_pair_3_o      
             

);



// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION               
//                                             
// ********************************************  
input               clk                     	;   //clock signal  
input               rst_n                   	;   //reset signal
input	[3:0]		cabac_curr_state_i			;	//cabac current state
input   [10:0]      bina_ctx_pair_0_i      		;   //context pair {coding_mode, bin, ctx_idx} from binarization 
input   [10:0]      bina_ctx_pair_1_i      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [10:0]      bina_ctx_pair_2_i      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [10:0]      bina_ctx_pair_3_i      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [10:0]      bina_ctx_pair_4_i      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [10:0]      bina_ctx_pair_5_i      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [10:0]      bina_ctx_pair_6_i      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [10:0]      bina_ctx_pair_7_i      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [10:0]      bina_ctx_pair_8_i      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [10:0]      bina_ctx_pair_9_i      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [10:0]      bina_ctx_pair_10_i     		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [10:0]      bina_ctx_pair_11_i     		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [10:0]      bina_ctx_pair_12_i     		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [10:0]      bina_ctx_pair_13_i     		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [10:0]      bina_ctx_pair_14_i     		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [10:0]      bina_ctx_pair_15_i     		;   //context pair {coding_mode, bin, ctx_idx} from binarization
input   [4:0]       valid_num_bina_i       		;   //valid number of binarization bin


//output              piso_1_input_en_o      		;   //enable piso_1 input signal         
output  [2:0]       valid_num_modeling_o   		;   //valid number of modeling bin        
output  [10:0]      modeling_pair_0_o      		;   //context pair {coding_mode, bin, ctx_idx} to modeling
output  [10:0]      modeling_pair_1_o      		;   //context pair {coding_mode, bin, ctx_idx} to modeling
output  [10:0]      modeling_pair_2_o      		;   //context pair {coding_mode, bin, ctx_idx} to modeling
output  [10:0]      modeling_pair_3_o      		;   //context pair {coding_mode, bin, ctx_idx} to modeling






// ********************************************
//                                             
//    Reg / Wire DECLARATION               
//                                             
// ********************************************
reg     [10:0]      bina_ctx_pair_0_r      		;   //context pair {coding_mode, bin, ctx_idx} from binarization 
reg     [10:0]      bina_ctx_pair_1_r      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_2_r      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_3_r      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_4_r      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_5_r      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_6_r      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_7_r      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_8_r      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_9_r      		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_10_r     		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_11_r     		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_12_r     		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_13_r     		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_14_r     		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_15_r     		;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg		[4:0]		valid_num_bina_r			;	//valid number of input bins

reg     [10:0]      bina_ctx_pair_0_delay_r     ;   //context pair {coding_mode, bin, ctx_idx} from binarization 
reg     [10:0]      bina_ctx_pair_1_delay_r     ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_2_delay_r     ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_3_delay_r     ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_4_delay_r     ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_5_delay_r     ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_6_delay_r     ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_7_delay_r     ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_8_delay_r     ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_9_delay_r     ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_10_delay_r    ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_11_delay_r    ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_12_delay_r    ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_13_delay_r    ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_14_delay_r    ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg     [10:0]      bina_ctx_pair_15_delay_r    ;   //context pair {coding_mode, bin, ctx_idx} from binarization
reg		[4:0]		valid_num_bina_delay_r		;	//valid number of input bins
                                           	
//reg                 piso_1_input_en_o      		;   //piso_1 output enable signal          
reg     [2:0]       valid_num_modeling_o   		;   //valid number of modeling bin         
reg     [10:0]      modeling_pair_0_o      		;   //context pair {coding_mode, bin, ctx_idx} to modeling
reg     [10:0]      modeling_pair_1_o      		;   //context pair {coding_mode, bin, ctx_idx} to modeling
reg     [10:0]      modeling_pair_2_o      		;   //context pair {coding_mode, bin, ctx_idx} to modeling
reg     [10:0]      modeling_pair_3_o      		;   //context pair {coding_mode, bin, ctx_idx} to modeling
                                           		
reg     [2:0]       output_cycle_r         		;   //output cycle of all pairs
reg     [1:0]       count_cycle_r          		;   //count of cycle, maximum is output_cycle_r
                                            	
reg		[4:0]		piso_valid_num_r			;   //valid number of bin in piso

parameter			PISO_IDLE       = 3'd0		,
					PISO_INPUT      = 3'd1		,
					PISO_OUTPUT     = 3'd2		,
					PISO_INOUT      = 3'd3		;
                                            	
                                            	
reg		[2:0]      	piso_curr_state				;
reg		[2:0]      	piso_next_state				;




// ********************************************
//                                             
//    Combination Logic                   
//                                             
// ********************************************

always @* begin
	piso_valid_num_r = valid_num_bina_i;
end


          
always @* begin
    case(piso_valid_num_r)
    	0				  : begin output_cycle_r = 0; end
        1, 2, 3, 4		  : begin output_cycle_r = 1; end
        5, 6, 7, 8		  : begin output_cycle_r = 2; end
        9,10,11, 12		  : begin output_cycle_r = 3; end	
        13, 14, 15, 16    : begin output_cycle_r = 4; end
        default           : begin output_cycle_r = 1; end
    endcase
end          
          
          
          
          
          
          
          
          
          
//output pairs cycle by cycle 
always @* begin
    if(output_cycle_r==1) begin
    	valid_num_modeling_o = valid_num_bina_r;    
        modeling_pair_0_o = bina_ctx_pair_0_r;
        modeling_pair_1_o = ((valid_num_modeling_o>=2) ? bina_ctx_pair_1_r : 11'h7ff);
        modeling_pair_2_o = ((valid_num_modeling_o>=3) ? bina_ctx_pair_2_r : 11'h7ff);
        modeling_pair_3_o = ((valid_num_modeling_o>=4) ? bina_ctx_pair_3_r : 11'h7ff);
    end
    else if(output_cycle_r==2) begin
        if(count_cycle_r==0) begin
            modeling_pair_0_o = bina_ctx_pair_0_r;
            modeling_pair_1_o = bina_ctx_pair_1_r;
            modeling_pair_2_o = bina_ctx_pair_2_r;
            modeling_pair_3_o = bina_ctx_pair_3_r;
            valid_num_modeling_o = 4;
        end
        else begin 
            valid_num_modeling_o = valid_num_bina_r - 4'd4;        	
            modeling_pair_0_o = bina_ctx_pair_4_r;
            modeling_pair_1_o = ((valid_num_modeling_o>=2) ? bina_ctx_pair_5_r : 11'h7ff);
            modeling_pair_2_o = ((valid_num_modeling_o>=3) ? bina_ctx_pair_6_r : 11'h7ff);
            modeling_pair_3_o = ((valid_num_modeling_o>=4) ? bina_ctx_pair_7_r : 11'h7ff);
        end
    end
    else if(output_cycle_r==3) begin
        if(count_cycle_r==0) begin
            modeling_pair_0_o = bina_ctx_pair_0_r;
            modeling_pair_1_o = bina_ctx_pair_1_r;
            modeling_pair_2_o = bina_ctx_pair_2_r;
            modeling_pair_3_o = bina_ctx_pair_3_r;
            valid_num_modeling_o = 4;
        end
        else if(count_cycle_r==1) begin
            modeling_pair_0_o = bina_ctx_pair_4_r;
            modeling_pair_1_o = bina_ctx_pair_5_r;
            modeling_pair_2_o = bina_ctx_pair_6_r;
            modeling_pair_3_o = bina_ctx_pair_7_r;
            valid_num_modeling_o = 4;
        end
        else begin
        	valid_num_modeling_o = valid_num_bina_r - 4'd8;
            modeling_pair_0_o = bina_ctx_pair_8_r; 
            modeling_pair_1_o = ((valid_num_modeling_o>=2) ? bina_ctx_pair_9_r  : 11'h7ff); 
            modeling_pair_2_o = ((valid_num_modeling_o>=3) ? bina_ctx_pair_10_r : 11'h7ff); 
            modeling_pair_3_o = ((valid_num_modeling_o>=4) ? bina_ctx_pair_11_r : 11'h7ff); 
        end
    end         
	else if(output_cycle_r==4) begin
		if(count_cycle_r==0) begin
            modeling_pair_0_o = bina_ctx_pair_0_r;
            modeling_pair_1_o = bina_ctx_pair_1_r;
            modeling_pair_2_o = bina_ctx_pair_2_r;
            modeling_pair_3_o = bina_ctx_pair_3_r;
            valid_num_modeling_o = 4;
        end
        else if(count_cycle_r==1) begin
            modeling_pair_0_o = bina_ctx_pair_4_r;
            modeling_pair_1_o = bina_ctx_pair_5_r;
            modeling_pair_2_o = bina_ctx_pair_6_r;
            modeling_pair_3_o = bina_ctx_pair_7_r;
            valid_num_modeling_o = 4;
        end
   		else if(count_cycle_r==2) begin
    		modeling_pair_0_o = bina_ctx_pair_8_r; 
            modeling_pair_1_o = bina_ctx_pair_9_r; 
            modeling_pair_2_o = bina_ctx_pair_10_r;
            modeling_pair_3_o = bina_ctx_pair_11_r;
            valid_num_modeling_o = 4;
    	end
        else begin
        	valid_num_modeling_o = valid_num_bina_r - 4'd12;
            modeling_pair_0_o = bina_ctx_pair_12_r; 
            modeling_pair_1_o = ((valid_num_modeling_o>=2) ? bina_ctx_pair_13_r : 11'h7ff); 
            modeling_pair_2_o = ((valid_num_modeling_o>=3) ? bina_ctx_pair_14_r : 11'h7ff); 
            modeling_pair_3_o = ((valid_num_modeling_o>=4) ? bina_ctx_pair_15_r : 11'h7ff); 
        end
	end
    else begin
        modeling_pair_0_o = 11'd0;
        modeling_pair_1_o = 11'd0;
        modeling_pair_2_o = 11'd0;
        modeling_pair_3_o = 11'd0;
        valid_num_modeling_o = 3'd0;
    end
end

	










// ********************************************
//                                             
//    Sequential Logic                   
//                                             
// ********************************************
//register input binarization context pair
always @(posedge clk or negedge rst_n) begin
	if(~rst_n) begin
		bina_ctx_pair_0_delay_r  <= 0;
        bina_ctx_pair_1_delay_r  <= 0;
        bina_ctx_pair_2_delay_r  <= 0;
        bina_ctx_pair_3_delay_r  <= 0;
        bina_ctx_pair_4_delay_r  <= 0;
        bina_ctx_pair_5_delay_r  <= 0;
        bina_ctx_pair_6_delay_r  <= 0;
        bina_ctx_pair_7_delay_r  <= 0;
        bina_ctx_pair_8_delay_r  <= 0;
        bina_ctx_pair_9_delay_r  <= 0;
        bina_ctx_pair_10_delay_r <= 0;
        bina_ctx_pair_11_delay_r <= 0;
        bina_ctx_pair_12_delay_r <= 0;
        bina_ctx_pair_13_delay_r <= 0;
        bina_ctx_pair_14_delay_r <= 0;
        bina_ctx_pair_15_delay_r <= 0;
        valid_num_bina_delay_r   <= 0;
	end        
	else if(piso_curr_state==PISO_INPUT) begin
		bina_ctx_pair_0_delay_r  <= bina_ctx_pair_0_i;
        bina_ctx_pair_1_delay_r  <= bina_ctx_pair_1_i;
        bina_ctx_pair_2_delay_r  <= bina_ctx_pair_2_i;
        bina_ctx_pair_3_delay_r  <= bina_ctx_pair_3_i;
        bina_ctx_pair_4_delay_r  <= bina_ctx_pair_4_i;
        bina_ctx_pair_5_delay_r  <= bina_ctx_pair_5_i;
        bina_ctx_pair_6_delay_r  <= bina_ctx_pair_6_i;
        bina_ctx_pair_7_delay_r  <= bina_ctx_pair_7_i;
        bina_ctx_pair_8_delay_r  <= bina_ctx_pair_8_i;
        bina_ctx_pair_9_delay_r  <= bina_ctx_pair_9_i;
        bina_ctx_pair_10_delay_r <= bina_ctx_pair_10_i;
        bina_ctx_pair_11_delay_r <= bina_ctx_pair_11_i;
        bina_ctx_pair_12_delay_r <= bina_ctx_pair_12_i;
        bina_ctx_pair_13_delay_r <= bina_ctx_pair_13_i;
        bina_ctx_pair_14_delay_r <= bina_ctx_pair_14_i;
        bina_ctx_pair_15_delay_r <= bina_ctx_pair_15_i;
        valid_num_bina_delay_r   <= valid_num_bina_i  ;
	end
	else begin
		bina_ctx_pair_0_delay_r  <= bina_ctx_pair_0_delay_r ;
        bina_ctx_pair_1_delay_r  <= bina_ctx_pair_1_delay_r ;
        bina_ctx_pair_2_delay_r  <= bina_ctx_pair_2_delay_r ;
        bina_ctx_pair_3_delay_r  <= bina_ctx_pair_3_delay_r ;
        bina_ctx_pair_4_delay_r  <= bina_ctx_pair_4_delay_r ;
        bina_ctx_pair_5_delay_r  <= bina_ctx_pair_5_delay_r ;
        bina_ctx_pair_6_delay_r  <= bina_ctx_pair_6_delay_r ;
        bina_ctx_pair_7_delay_r  <= bina_ctx_pair_7_delay_r ;
        bina_ctx_pair_8_delay_r  <= bina_ctx_pair_8_delay_r ;
        bina_ctx_pair_9_delay_r  <= bina_ctx_pair_9_delay_r ;
        bina_ctx_pair_10_delay_r <= bina_ctx_pair_10_delay_r;
        bina_ctx_pair_11_delay_r <= bina_ctx_pair_11_delay_r;
        bina_ctx_pair_12_delay_r <= bina_ctx_pair_12_delay_r;
        bina_ctx_pair_13_delay_r <= bina_ctx_pair_13_delay_r;
        bina_ctx_pair_14_delay_r <= bina_ctx_pair_14_delay_r;
        bina_ctx_pair_15_delay_r <= bina_ctx_pair_15_delay_r;
        valid_num_bina_delay_r   <= valid_num_bina_delay_r  ;
	end	
end





always @* begin
    if(piso_curr_state==PISO_OUTPUT || piso_curr_state==PISO_INOUT) begin
		bina_ctx_pair_0_r  = bina_ctx_pair_0_delay_r ;
        bina_ctx_pair_1_r  = bina_ctx_pair_1_delay_r ;
        bina_ctx_pair_2_r  = bina_ctx_pair_2_delay_r ;
        bina_ctx_pair_3_r  = bina_ctx_pair_3_delay_r ;
        bina_ctx_pair_4_r  = bina_ctx_pair_4_delay_r ;
        bina_ctx_pair_5_r  = bina_ctx_pair_5_delay_r ;
        bina_ctx_pair_6_r  = bina_ctx_pair_6_delay_r ;
        bina_ctx_pair_7_r  = bina_ctx_pair_7_delay_r ;
        bina_ctx_pair_8_r  = bina_ctx_pair_8_delay_r ;
        bina_ctx_pair_9_r  = bina_ctx_pair_9_delay_r ;
        bina_ctx_pair_10_r = bina_ctx_pair_10_delay_r;
        bina_ctx_pair_11_r = bina_ctx_pair_11_delay_r;
        bina_ctx_pair_12_r = bina_ctx_pair_12_delay_r;
        bina_ctx_pair_13_r = bina_ctx_pair_13_delay_r;
        bina_ctx_pair_14_r = bina_ctx_pair_14_delay_r;
        bina_ctx_pair_15_r = bina_ctx_pair_15_delay_r;
        valid_num_bina_r   = valid_num_bina_delay_r  ;
	end
    else begin
        bina_ctx_pair_0_r  = bina_ctx_pair_0_i ;
        bina_ctx_pair_1_r  = bina_ctx_pair_1_i ;
        bina_ctx_pair_2_r  = bina_ctx_pair_2_i ;
        bina_ctx_pair_3_r  = bina_ctx_pair_3_i ;
        bina_ctx_pair_4_r  = bina_ctx_pair_4_i ;
        bina_ctx_pair_5_r  = bina_ctx_pair_5_i ;
        bina_ctx_pair_6_r  = bina_ctx_pair_6_i ;
        bina_ctx_pair_7_r  = bina_ctx_pair_7_i ;
        bina_ctx_pair_8_r  = bina_ctx_pair_8_i ;
        bina_ctx_pair_9_r  = bina_ctx_pair_9_i ;
        bina_ctx_pair_10_r = bina_ctx_pair_10_i;
        bina_ctx_pair_11_r = bina_ctx_pair_11_i;
        bina_ctx_pair_12_r = bina_ctx_pair_12_i;
        bina_ctx_pair_13_r = bina_ctx_pair_13_i;
        bina_ctx_pair_14_r = bina_ctx_pair_14_i;
        bina_ctx_pair_15_r = bina_ctx_pair_15_i;
        valid_num_bina_r   = valid_num_bina_i  ;
    end
end




always @(posedge clk or negedge rst_n) begin
	if (!rst_n)                                 
		piso_curr_state <= PISO_IDLE;           
	else                                        
		piso_curr_state <= piso_next_state;     
end                                         

                                                                                
always @* begin                                                                 
	case(piso_curr_state)                                                       
		PISO_IDLE		:   if(cabac_curr_state_i>'d1) begin                           
			                	piso_next_state = PISO_INPUT;                       
			                end                                                     
			                else begin                                              
			                	piso_next_state = PISO_IDLE;                        
			                end                                      
    	                                                                        
		PISO_INPUT      :	if((piso_valid_num_r>4)) begin
			                	piso_next_state = PISO_OUTPUT;                      
			                end                                                     
			                else begin                                              
			                	piso_next_state = PISO_INPUT;                       
			                end	                                                    
		                                                                            
		PISO_OUTPUT     :	begin          
			                	if(piso_valid_num_r==0)
			                		piso_next_state = PISO_INPUT;             
			                	else if(count_cycle_r==(output_cycle_r-1)) begin     
			                		piso_next_state = PISO_INPUT;                 
								end                                             
								else begin                                      
									piso_next_state = piso_curr_state;            
								end                                             
			                end		                                         
			                		                                                		                	                                                    
		PISO_INOUT      :  if(count_cycle_r==(output_cycle_r-1)) begin
			                	piso_next_state = PISO_INPUT;                       
			                end                                                     
			                else begin                                              
			                	piso_next_state = PISO_INOUT;                       
			                end  	                                                
			                                                                        
		default			:   piso_next_state = PISO_IDLE;                            
	endcase                                                                     
end                     


always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		count_cycle_r <= 0;
	end
	else if(piso_next_state==PISO_OUTPUT) begin
		if(count_cycle_r==(output_cycle_r-1)) begin
			count_cycle_r <= 0;
		end
		else begin
			count_cycle_r <= count_cycle_r + 1;
		end
	end
	else if(piso_next_state==PISO_INOUT) begin
		if(count_cycle_r==(output_cycle_r-1)) begin
			count_cycle_r <= 0;
		end
		else begin
			count_cycle_r <= count_cycle_r + 1;
		end
	end
	else begin
		count_cycle_r <= 0;
	end
end


/*
always @* begin
	case(piso_next_state)
		PISO_IDLE	: begin piso_1_input_en_o = 1; end
		PISO_INPUT	: begin piso_1_input_en_o = 1; end
		PISO_INOUT	: begin piso_1_input_en_o = 0; end
		PISO_OUTPUT : begin piso_1_input_en_o = 0; end
		default		: begin piso_1_input_en_o = 0; end	
	endcase
end
*/



































endmodule                                                        