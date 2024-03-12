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
// Filename       : cabac_cu_binari_intra_luma_mode.v
// Author         : chewein
// Created        : 2014-9-11
// Description    : binarization an cu , cu size is 8x8 , 16x16 , 32x32 64x64
//-----------------------------------------------------------------------------------------------------------------------------
`include"enc_defines.v"

module cabac_cu_binari_intra_luma_mode(
                                // input 
                                luma_curr_mode_i        , 
                                luma_left_mode_i        ,							
                                luma_top_mode_i         ,                     
                                //output 					
                                ctx_pair_luma_mode_0_o  ,					
                                ctx_pair_luma_mode_1_o   				
				 ); 	
				 
//-----------------------------------------------------------------------------------------------------------------------------
//
//                                input signals and output signals 
//
//-----------------------------------------------------------------------------------------------------------------------------
input   [5:0]    luma_curr_mode_i                   ;
input   [5:0]    luma_left_mode_i                   ;
input   [5:0]    luma_top_mode_i                    ;

output  [10:0]    ctx_pair_luma_mode_0_o            ;
output  [10:0]    ctx_pair_luma_mode_1_o            ;

//-----------------------------------------------------------------------------------------------------------------------------
//
//                              reg and wire signals declaration  
//
//-----------------------------------------------------------------------------------------------------------------------------
reg      [5:0]    preds_0_r  ,  preds_1_r  , preds_2_r                   ;
reg      [1:0]    pred_idx_r ;

wire              preds_0_le_1_w    ,preds_0_le_2_w     ,preds_1_le_2_w  ;

reg      [5:0]    preds_0_sort_r    ,preds_1_sort_r     ,preds_2_sort_r  ;

wire     [5:0]    luma_curr_mode_minus1_w                                ;
wire     [5:0]    luma_curr_mode_minus2_w                                ;
wire     [5:0]    luma_curr_mode_minus3_w                                ;
reg      [5:0]    luma_mode_dir_r                                        ;

// calculation prediction candidates : preds_0_r ,preds_1_r ,preds_2_r
always @* begin 
    if(luma_top_mode_i == luma_left_mode_i) begin 
        if(luma_left_mode_i[5:1])   begin //  >6'd1
            preds_0_r  =   luma_left_mode_i                          ;
			preds_1_r  =   ((luma_left_mode_i + 6'd29)&7'd31) + 6'd2 ;
			preds_2_r  =   ((luma_left_mode_i - 6'd1 )&7'd31) + 6'd2 ;   
		end 
		else begin 
		    preds_0_r  =   6'd0               ;
			preds_1_r  =   6'd1               ;
			preds_2_r  =   6'd26              ;
        end 
    end 
	else begin 
        if(luma_left_mode_i && luma_top_mode_i) begin 
	        preds_0_r  =   luma_left_mode_i  ;
	        preds_1_r  =   luma_top_mode_i   ;
			preds_2_r  =   6'd0                ;
	    end 
        else begin 
	        preds_0_r  =   luma_left_mode_i  ;
	        preds_1_r  =   luma_top_mode_i   ;
			preds_2_r  =   (luma_left_mode_i + luma_top_mode_i)<7'd2 ? 6'd26 :6'd1 ;
        end 	
	end 
end 

// most  probably candidates : pred_idx_r
always @* begin 
    if(luma_curr_mode_i == preds_2_r)
        pred_idx_r  =    2'd2   ;
    else if(luma_curr_mode_i == preds_1_r)
        pred_idx_r  =    2'd1   ;
    else if(luma_curr_mode_i == preds_0_r)
        pred_idx_r  =    2'd0   ;						
	else 
	    pred_idx_r  =    2'd3   ;
end

// prediction candidates resorting 										
assign   preds_0_le_1_w   =		preds_0_r  <  preds_1_r   ;
assign   preds_0_le_2_w   =     preds_0_r  <  preds_2_r   ;				
assign   preds_1_le_2_w   =     preds_1_r  <  preds_2_r   ;				
						
always @* begin
	if(preds_0_le_1_w && preds_0_le_2_w && preds_1_le_2_w) begin
		preds_0_sort_r = preds_0_r;
		preds_1_sort_r = preds_1_r;
		preds_2_sort_r = preds_2_r;		
	end
	else if(preds_0_le_1_w && preds_0_le_2_w && (!preds_1_le_2_w) )begin
		preds_0_sort_r = preds_0_r;
		preds_1_sort_r = preds_2_r;	
		preds_2_sort_r = preds_1_r;
	end
	else if(preds_0_le_1_w && (!preds_0_le_2_w) )begin
		preds_0_sort_r = preds_2_r;
		preds_1_sort_r = preds_0_r;
		preds_2_sort_r = preds_1_r;	
	end
	else if((!preds_0_le_1_w) && preds_0_le_2_w) begin
		preds_0_sort_r = preds_1_r;
		preds_1_sort_r = preds_0_r;
		preds_2_sort_r = preds_2_r;
	end
	else if( (!preds_0_le_1_w) && (!preds_0_le_2_w) && preds_1_le_2_w) begin
		preds_0_sort_r = preds_1_r;
		preds_1_sort_r = preds_2_r;
		preds_2_sort_r = preds_0_r;
	end		
	else begin
		preds_0_sort_r = preds_2_r;
		preds_1_sort_r = preds_1_r;
		preds_2_sort_r = preds_0_r;		
	end
end		

// calculation  luma_mode_dir_r : final modified luma mode 

assign luma_curr_mode_minus1_w  = luma_curr_mode_i - 6'd1  ;						
assign luma_curr_mode_minus2_w  = luma_curr_mode_i - 6'd2  ;						
assign luma_curr_mode_minus3_w  = luma_curr_mode_i - 6'd3  ;						
						
always @* begin
	if(luma_curr_mode_i>preds_2_sort_r) begin
		if(luma_curr_mode_minus1_w>preds_1_sort_r) begin
			if(luma_curr_mode_minus2_w>preds_0_sort_r) begin
				luma_mode_dir_r = luma_curr_mode_minus3_w  ;
			end
			else begin
				luma_mode_dir_r = luma_curr_mode_minus2_w  ;
			end
		end	
		else begin
			if(luma_curr_mode_minus1_w>preds_0_sort_r) begin
				luma_mode_dir_r = luma_curr_mode_minus2_w  ;
			end
			else begin
				luma_mode_dir_r = luma_curr_mode_minus1_w   ;	
			end
		end
	end
	else begin
		if(luma_curr_mode_i>preds_1_sort_r) begin
			if(luma_curr_mode_minus1_w>preds_0_sort_r) begin
				luma_mode_dir_r = luma_curr_mode_minus2_w  ;
			end
			else begin
				luma_mode_dir_r = luma_curr_mode_minus1_w  ;
			end
		end
		else begin
			if(luma_curr_mode_i>preds_0_sort_r) begin
				luma_mode_dir_r = luma_curr_mode_minus1_w  ;
			end
			else begin
				luma_mode_dir_r = luma_curr_mode_i         ;
			end
		end	
	end	
end						

//-----------------------------------------------------------------------------------------------------------------------------
//
//                          output signals 
//
//-----------------------------------------------------------------------------------------------------------------------------
reg    [8:0]    bin_string_luma_mode_r                     ;

always @* begin
    case(pred_idx_r)
	    2'd0:	bin_string_luma_mode_r = {3'b001,1'b1,3'b000,1'b0, 1'b0}     ; // 2 bins = 1bin regular + 1bypass
		2'd1:	bin_string_luma_mode_r = {3'b010,1'b1,3'b000,1'b1, 1'b0}     ; // 3 bins = 1bin regular + 2bypass
		2'd2:	bin_string_luma_mode_r = {3'b010,1'b1,3'b000,1'b1, 1'b1}     ; // 3 bins = 1bin regular + 2bypass
		2'd3:	bin_string_luma_mode_r = {3'b101,1'b0, luma_mode_dir_r[4:0]} ; // 6 bins = 1bin regular + 5bypass
    default:    bin_string_luma_mode_r = 9'd0;
	endcase
end						

// coding_mode:0:regular mode,1:invalid,2:bypass mode,3:terminal mode 
// regular:{2'b01, bin, bank_num,addr_idx} {2,1,3,5}  
// bypass :{2'b10,1resverd,bins_num,bin_string} {2,1resverd,3,5}
assign ctx_pair_luma_mode_0_o  =  {2'b00,bin_string_luma_mode_r[5]  ,3'd0, 5'd30};
assign ctx_pair_luma_mode_1_o  =  {2'b10,1'b0,bin_string_luma_mode_r[8:6],bin_string_luma_mode_r[4:0]};




endmodule 						
