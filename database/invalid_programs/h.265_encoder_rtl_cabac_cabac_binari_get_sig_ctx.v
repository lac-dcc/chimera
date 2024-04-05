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
// Filename       : cu_binari_tree.v
// Author         : chewein
// Created        : 2014-9-20
// Description    : binarization the nxn block coeff 
//-----------------------------------------------------------------------------------------------------------------------------
`include"enc_defines.v" 
module cabac_binari_get_sig_ctx(
                                pattern_sig_ctx_i          ,
                                scan_idx_i                 ,
                                pos_x_i                    ,
                                pos_y_i                    ,
                                tu_depth_i                 ,
                                coeff_type_i               ,
 
                                ctx_pair_scf_addr_o                
);
//-----------------------------------------------------------------------------------------------------------------------------
//
//               input and output signals declaration 
//
//-----------------------------------------------------------------------------------------------------------------------------
input    [  1:0 ]                      pattern_sig_ctx_i                       ;
input    [  1:0 ]                      scan_idx_i                              ;
input    [  4:0 ]                      pos_x_i                                 ;
input    [  4:0 ]                      pos_y_i                                 ;
input    [  1:0 ]                      tu_depth_i                              ;
input    [  1:0 ]                      coeff_type_i                            ;

output   [  7:0 ]                      ctx_pair_scf_addr_o                     ;
 
//-----------------------------------------------------------------------------------------------------------------------------
//
//              calculation sig_ctx_inc : calculation ctxIndMap
//
//-----------------------------------------------------------------------------------------------------------------------------
reg      [  3:0 ]                      ctxIndMap_r                              ;         

wire     [  3:0 ]                      ctxIndMap_index_w                        ;

assign   ctxIndMap_index_w   =         (pos_y_i[1:0]<<2) + pos_x_i[1:0]         ;

always @* begin
    case(ctxIndMap_index_w)
        6'd0  :    ctxIndMap_r   =    4'd0                                     ;
        6'd1  :    ctxIndMap_r   =    4'd1                                     ;
        6'd2  :    ctxIndMap_r   =    4'd4                                     ;
        6'd3  :    ctxIndMap_r   =    4'd5                                     ;
        6'd4  :    ctxIndMap_r   =    4'd2                                     ;
        6'd5  :    ctxIndMap_r   =    4'd3                                     ;
        6'd6  :    ctxIndMap_r   =    4'd4                                     ;
        6'd7  :    ctxIndMap_r   =    4'd5                                     ;
        6'd8  :    ctxIndMap_r   =    4'd6                                     ;
        6'd9  :    ctxIndMap_r   =    4'd6                                     ;
        6'd10 :    ctxIndMap_r   =    4'd8                                     ;
        6'd11 :    ctxIndMap_r   =    4'd8                                     ;
        6'd12 :    ctxIndMap_r   =    4'd7                                     ;
        6'd13 :    ctxIndMap_r   =    4'd7                                     ;
        6'd14 :    ctxIndMap_r   =    4'd8                                     ;
        6'd15 :    ctxIndMap_r   =    4'd8                                     ;
    endcase 
end 

//-----------------------------------------------------------------------------------------------------------------------------
//
//              calculation sig_ctx_inc : calculation base , cnt and offset 
//
//-----------------------------------------------------------------------------------------------------------------------------
wire     [  1:0 ]                      base_w                                  ;
wire     [  4:0 ]                      offset_w                                ;
reg      [  1:0 ]                      cnt_r                                   ;

wire     [  1:0 ]                      pos_x_inSubset_w                        ;
wire     [  1:0 ]                      pos_y_inSubset_w                        ;
wire     [  2:0 ]                      pos_xy_sum_w                            ;

assign  base_w    =  coeff_type_i[1] &&(pos_x_i[4:2]||pos_y_i[4:2])? 2'd3:2'd0 ;

assign  offset_w  =  (tu_depth_i == 2'd2) ? ( scan_idx_i==`SCAN_DIAG ? 5'd9 : 5'd15) :(coeff_type_i[1] ? 5'd21 : 5'd12);     

// cnt_r
always @* begin 
    if(pattern_sig_ctx_i==2'd0)
        cnt_r  = pos_xy_sum_w < 3'd3 ? (pos_xy_sum_w==3'd0 ? 2'd2 : 2'd1):2'd0 ;  
    else if(pattern_sig_ctx_i==2'd1)
        cnt_r  = pos_y_inSubset_w[1] ? 2'd0 : (pos_y_inSubset_w ? 2'd1 : 2'd2) ;
    else if(pattern_sig_ctx_i==2'd2)
        cnt_r  = pos_x_inSubset_w[1] ? 2'd0 : (pos_x_inSubset_w ? 2'd1 : 2'd2) ;
    else  
        cnt_r  = 2'd2                                                          ;
end 

assign   pos_x_inSubset_w    =         pos_x_i[1:0]                            ;
assign   pos_y_inSubset_w    =         pos_y_i[1:0]                            ;
assign   pos_xy_sum_w        =         pos_x_i[1:0] + pos_y_i[1:0]             ;
//-----------------------------------------------------------------------------------------------------------------------------
//
//              calculation sig_ctx_inc 
//
//-----------------------------------------------------------------------------------------------------------------------------
reg      [  5:0 ]                      sig_ctx_r                               ;

always @* begin 
    if( (pos_x_i==5'd0) && (pos_y_i == 5'd0) )
        sig_ctx_r            =     coeff_type_i[1] ? 6'd0  : 6'd27              ;
    else if(tu_depth_i==2'd3)                                 //4x4 
        sig_ctx_r            =     coeff_type_i[1] ? ctxIndMap_r : ctxIndMap_r + 6'd27    ; 
    else 
        sig_ctx_r            =     coeff_type_i[1] ? base_w + cnt_r + offset_w : base_w + cnt_r + offset_w   + 6'd27 ;
end 
//-----------------------------------------------------------------------------------------------------------------------------
//
//              calculation ctx_pair_scf_addr_o : look up table  
//
//-----------------------------------------------------------------------------------------------------------------------------
reg      [   7:0 ]                     ctx_pair_scf_addr_r                     ;

always @* begin 
    case(sig_ctx_r)
        6'd0  :    ctx_pair_scf_addr_r    =   {3'd3 , 5'd31 }     ; 
	    6'd1  :    ctx_pair_scf_addr_r    =   {3'd2 , 5'd17 }     ; 
	    6'd2  :    ctx_pair_scf_addr_r    =   {3'd2 , 5'd16 }     ; 
	    6'd3  :    ctx_pair_scf_addr_r    =   {3'd4 , 5'd8  }     ; 
	    6'd4  :    ctx_pair_scf_addr_r    =   {3'd1 , 5'd17 }     ; 
	    6'd5  :    ctx_pair_scf_addr_r    =   {3'd4 , 5'd7  }     ; 
	    6'd6  :    ctx_pair_scf_addr_r    =   {3'd4 , 5'd9  }     ; 
	    6'd7  :    ctx_pair_scf_addr_r    =   {3'd1 , 5'd18 }     ; 
	    6'd8  :    ctx_pair_scf_addr_r    =   {3'd2 , 5'd18 }     ; 
	    6'd9  :    ctx_pair_scf_addr_r    =   {3'd0 , 5'd16 }     ; 
	    6'd10 :    ctx_pair_scf_addr_r    =   {3'd4 , 5'd1  }     ; 
	    6'd11 :    ctx_pair_scf_addr_r    =   {3'd2 , 5'd10 }     ; 
	    6'd12 :    ctx_pair_scf_addr_r    =   {3'd0 , 5'd17 }     ; 
	    6'd13 :    ctx_pair_scf_addr_r    =   {3'd4 , 5'd2  }     ; 
	    6'd14 :    ctx_pair_scf_addr_r    =   {3'd2 , 5'd11 }     ; 
	    6'd15 :    ctx_pair_scf_addr_r    =   {3'd0 , 5'd18 }     ; 
	    6'd16 :    ctx_pair_scf_addr_r    =   {3'd4 , 5'd3  }     ; 
	    6'd17 :    ctx_pair_scf_addr_r    =   {3'd2 , 5'd12 }     ; 
	    6'd18 :    ctx_pair_scf_addr_r    =   {3'd0 , 5'd19 }     ; 
	    6'd19 :    ctx_pair_scf_addr_r    =   {3'd4 , 5'd4  }     ; 
	    6'd20 :    ctx_pair_scf_addr_r    =   {3'd2 , 5'd13 }     ; 
	    6'd21 :    ctx_pair_scf_addr_r    =   {3'd0 , 5'd20 }     ; 
	    6'd22 :    ctx_pair_scf_addr_r    =   {3'd4 , 5'd5  }     ; 
	    6'd23 :    ctx_pair_scf_addr_r    =   {3'd2 , 5'd14 }     ; 
	    6'd24 :    ctx_pair_scf_addr_r    =   {3'd0 , 5'd21 }     ; 
	    6'd25 :    ctx_pair_scf_addr_r    =   {3'd4 , 5'd6  }     ; 
	    6'd26 :    ctx_pair_scf_addr_r    =   {3'd2 , 5'd15 }     ; 
	    6'd27 :    ctx_pair_scf_addr_r    =   {3'd3 , 5'd16 }     ; 
	    6'd28 :    ctx_pair_scf_addr_r    =   {3'd2 , 5'd8  }     ; 
	    6'd29 :    ctx_pair_scf_addr_r    =   {3'd0 , 5'd14 }     ; 
	    6'd30 :    ctx_pair_scf_addr_r    =   {3'd3 , 5'd30 }     ; 
	    6'd31 :    ctx_pair_scf_addr_r    =   {3'd1 , 5'd16 }     ; 
	    6'd32 :    ctx_pair_scf_addr_r    =   {3'd4 , 5'd0  }     ; 
	    6'd33 :    ctx_pair_scf_addr_r    =   {3'd5 , 5'd0  }     ; 
	    6'd34 :    ctx_pair_scf_addr_r    =   {3'd5 , 5'd1  }     ; 
	    6'd35 :    ctx_pair_scf_addr_r    =   {3'd2 , 5'd9  }     ; 
	    6'd36 :    ctx_pair_scf_addr_r    =   {3'd4 , 5'd10 }     ; 
        6'd37 :    ctx_pair_scf_addr_r    =   {3'd1 , 5'd19 }     ; 
        6'd38 :    ctx_pair_scf_addr_r    =   {3'd2 , 5'd19 }     ; 
        6'd39 :    ctx_pair_scf_addr_r    =   {3'd4 , 5'd11 }     ; 
        6'd40 :    ctx_pair_scf_addr_r    =   {3'd1 , 5'd20 }     ; 
        6'd41 :    ctx_pair_scf_addr_r    =   {3'd2 , 5'd20 }     ; 
	  default :    ctx_pair_scf_addr_r    =   {3'd5 , 5'h1f }     ; 
	endcase
end 

assign   ctx_pair_scf_addr_o    =   ctx_pair_scf_addr_r                        ;
	
endmodule