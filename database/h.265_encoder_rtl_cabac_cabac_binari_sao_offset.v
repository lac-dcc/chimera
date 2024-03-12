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
// Filename       : cabac_binari_sao_offset.v
// Author         : chewein
// Created        : 2014-9-11
// Description    : binarization an cu , cu size is 8x8 , 16x16 , 32x32 64x64
//-----------------------------------------------------------------------------------------------------------------------------
`include"enc_defines.v" 

module cabac_binari_sao_offset(
                                sao_data_i         ,
								sao_compidx_i      ,
								sao_merge_i        ,
								cu_binary_sao_0_o  ,
								cu_binary_sao_1_o  ,
								cu_binary_sao_2_o  ,
								cu_binary_sao_3_o  ,
								cu_binary_sao_4_o  ,
								cu_binary_sao_5_o  ,
								cu_binary_sao_6_o  ,
								cu_binary_sao_7_o  
							
                            );
// -----------------------------------------------------------------------------------------------------------------------------
//
//		INPUT and OUTPUT DECLARATION
//
// -----------------------------------------------------------------------------------------------------------------------------
input     [19:0]                sao_data_i              ;
input     [ 1:0]                sao_compidx_i           ;
input                           sao_merge_i             ;

output    [10:0]                cu_binary_sao_0_o		;								
output    [10:0]                cu_binary_sao_1_o		;	
output    [10:0]                cu_binary_sao_2_o		;	
output    [10:0]                cu_binary_sao_3_o		;	
output    [10:0]                cu_binary_sao_4_o		;	
output    [10:0]                cu_binary_sao_5_o		;	
output    [10:0]                cu_binary_sao_6_o		;	
output    [10:0]                cu_binary_sao_7_o		;	

// -----------------------------------------------------------------------------------------------------------------------------
//
//		wire and reg signals declaration 
//
// -----------------------------------------------------------------------------------------------------------------------------
reg       [10:0]                cu_binary_sao_0_r		;								
reg       [10:0]                cu_binary_sao_1_r		;	
reg       [10:0]                cu_binary_sao_2_r		;	
reg       [10:0]                cu_binary_sao_3_r		;	
reg       [10:0]                cu_binary_sao_4_r		;	
reg       [10:0]                cu_binary_sao_5_r		;	
reg       [10:0]                cu_binary_sao_6_r		;	
reg       [10:0]                cu_binary_sao_7_r		;	

wire         [2:0]              sao_type_w              ;
wire         [4:0]              sao_sub_type_w          ;

wire signed  [2:0]              sao_offset_0_w          ;
wire signed  [2:0]              sao_offset_1_w          ;
wire signed  [2:0]              sao_offset_2_w          ;
wire signed  [2:0]              sao_offset_3_w          ;

reg          [2:0]              sao_offset_0_r          ;
reg          [2:0]              sao_offset_1_r          ;
reg          [2:0]              sao_offset_2_r          ;
reg          [2:0]              sao_offset_3_r          ;

reg          [4:0]              sao_max_uvlc_0_r        ;// [4:0]:bins       
reg          [4:0]              sao_max_uvlc_1_r        ;// [4:0]:bins       
reg          [4:0]              sao_max_uvlc_2_r        ;// [4:0]:bins       
reg          [4:0]              sao_max_uvlc_3_r        ;// [4:0]:bins       

wire         [2:0]              sao_max_uvlc_num_0_w    ;
wire         [2:0]              sao_max_uvlc_num_1_w    ;
wire         [2:0]              sao_max_uvlc_num_2_w    ;
wire         [2:0]              sao_max_uvlc_num_3_w    ;

wire                            sao_offset_neq0_0_w     ;  
wire                            sao_offset_neq0_1_w     ;  
wire                            sao_offset_neq0_2_w     ;  
wire                            sao_offset_neq0_3_w     ;
  
reg          [4:0]              sao_bo_offset_sign_r    ; 
wire         [2:0]              sao_bo_offset_num_w     ; 


wire         [2:0]              ui_symbol_w             ;

assign   sao_type_w        =     sao_data_i[19:17]      ;
assign   sao_sub_type_w    =     sao_data_i[16:12]      ;

assign   sao_offset_3_w    =     sao_data_i[11:9 ]      ;
assign   sao_offset_2_w    =     sao_data_i[ 8:6 ]      ;
assign   sao_offset_1_w    =     sao_data_i[ 5:3 ]      ;
assign   sao_offset_0_w    =     sao_data_i[ 2:0 ]      ;


assign     ui_symbol_w     =     sao_type_w   + 2'b1    ;

// sao_offset_abs 
always @* begin 
    case(sao_offset_0_w[2])
	    1'b1:  sao_offset_0_r =  (~sao_offset_0_w) + 2'b1 ;
		1'b0:  sao_offset_0_r =  sao_offset_0_w           ;
	endcase
end 

always @* begin 
    case(sao_offset_1_w[2])
	    1'b1:  sao_offset_1_r =  (~sao_offset_1_w) + 2'b1 ;
		1'b0:  sao_offset_1_r =  sao_offset_1_w           ;
	endcase
end 

always @* begin 
    case(sao_offset_2_w[2])
	    1'b1:  sao_offset_2_r =  (~sao_offset_2_w) + 2'b1 ;
		1'b0:  sao_offset_2_r =  sao_offset_2_w           ;
	endcase
end 

always @* begin 
    case(sao_offset_3_w[2])
	    1'b1:  sao_offset_3_r =  (~sao_offset_3_w) + 2'b1 ;
		1'b0:  sao_offset_3_r =  sao_offset_3_w           ;
	endcase
end 

// sao_max_uvlc 
always @* begin 
    case(sao_offset_0_r)
        3'd0 : sao_max_uvlc_0_r =  5'b0000_0 ;
        3'd1 : sao_max_uvlc_0_r =  5'b0001_0 ;
        3'd2 : sao_max_uvlc_0_r =  5'b0011_0 ;
        3'd3 : sao_max_uvlc_0_r =  5'b0111_0 ;
        3'd4 : sao_max_uvlc_0_r =  5'b1111_0 ;
        3'd5 : sao_max_uvlc_0_r =  5'b1111_1 ;
        3'd6 : sao_max_uvlc_0_r =  5'b1111_1 ;
        3'd7 : sao_max_uvlc_0_r =  5'b1111_1 ;
    endcase 
end 

always @* begin 
    case(sao_offset_1_r)
        3'd0 : sao_max_uvlc_1_r =  5'b0000_0 ;
        3'd1 : sao_max_uvlc_1_r =  5'b0001_0 ;
        3'd2 : sao_max_uvlc_1_r =  5'b0011_0 ;
        3'd3 : sao_max_uvlc_1_r =  5'b0111_0 ;
        3'd4 : sao_max_uvlc_1_r =  5'b1111_0 ;
        3'd5 : sao_max_uvlc_1_r =  5'b1111_1 ;
        3'd6 : sao_max_uvlc_1_r =  5'b1111_1 ;
        3'd7 : sao_max_uvlc_1_r =  5'b1111_1 ;
    endcase 
end

always @* begin 
    case(sao_offset_2_r)
        3'd0 : sao_max_uvlc_2_r =  5'b0000_0 ;
        3'd1 : sao_max_uvlc_2_r =  5'b0001_0 ;
        3'd2 : sao_max_uvlc_2_r =  5'b0011_0 ;
        3'd3 : sao_max_uvlc_2_r =  5'b0111_0 ;
        3'd4 : sao_max_uvlc_2_r =  5'b1111_0 ;
        3'd5 : sao_max_uvlc_2_r =  5'b1111_1 ;
        3'd6 : sao_max_uvlc_2_r =  5'b1111_1 ;
        3'd7 : sao_max_uvlc_2_r =  5'b1111_1 ;
    endcase 
end

always @* begin 
    case(sao_offset_3_r)
        3'd0 : sao_max_uvlc_3_r =  5'b0000_0 ;
        3'd1 : sao_max_uvlc_3_r =  5'b0001_0 ;
        3'd2 : sao_max_uvlc_3_r =  5'b0011_0 ;
        3'd3 : sao_max_uvlc_3_r =  5'b0111_0 ;
        3'd4 : sao_max_uvlc_3_r =  5'b1111_0 ;
        3'd5 : sao_max_uvlc_3_r =  5'b1111_1 ;
        3'd6 : sao_max_uvlc_3_r =  5'b1111_1 ;
        3'd7 : sao_max_uvlc_3_r =  5'b1111_1 ;
    endcase 
end

assign   sao_max_uvlc_num_0_w  =   sao_offset_0_r + 2'b1  ;
assign   sao_max_uvlc_num_1_w  =   sao_offset_1_r + 2'b1  ;
assign   sao_max_uvlc_num_2_w  =   sao_offset_2_r + 2'b1  ;
assign   sao_max_uvlc_num_3_w  =   sao_offset_3_r + 2'b1  ;

assign   sao_offset_neq0_0_w   =   !(!sao_offset_0_w)     ;
assign   sao_offset_neq0_1_w   =   !(!sao_offset_1_w)     ;
assign   sao_offset_neq0_2_w   =   !(!sao_offset_2_w)     ;
assign   sao_offset_neq0_3_w   =   !(!sao_offset_3_w)     ;

assign   sao_bo_offset_num_w   =  sao_offset_neq0_0_w + sao_offset_neq0_1_w + 
                                  sao_offset_neq0_2_w + sao_offset_neq0_3_w ;
								  
always @*begin 
    case({sao_offset_neq0_0_w,sao_offset_neq0_1_w,sao_offset_neq0_2_w,sao_offset_neq0_3_w})
        4'b0000: sao_bo_offset_sign_r =  5'b0;
        4'b0001: sao_bo_offset_sign_r =  {4'b0,sao_offset_3_w[2]} ;
		4'b0010: sao_bo_offset_sign_r =  {4'b0,sao_offset_2_w[2]} ;
        4'b0011: sao_bo_offset_sign_r =  {3'b0,sao_offset_2_w[2],sao_offset_3_w[2]};
        4'b0100: sao_bo_offset_sign_r =  {4'b0,sao_offset_1_w[2]} ;
        4'b0101: sao_bo_offset_sign_r =  {3'b0,sao_offset_1_w[2],sao_offset_3_w[2]};
        4'b0110: sao_bo_offset_sign_r =  {3'b0,sao_offset_1_w[2],sao_offset_2_w[2]};
        4'b0111: sao_bo_offset_sign_r =  {2'b0,sao_offset_1_w[2],sao_offset_2_w[2],sao_offset_3_w[2]};
		4'b1000: sao_bo_offset_sign_r =  {4'b0,sao_offset_0_w[2]} ;
		4'b1001: sao_bo_offset_sign_r =  {3'b0,sao_offset_0_w[2],sao_offset_3_w[2]};
		4'b1010: sao_bo_offset_sign_r =  {3'b0,sao_offset_0_w[2],sao_offset_2_w[2]};
		4'b1011: sao_bo_offset_sign_r =  {2'b0,sao_offset_0_w[2],sao_offset_2_w[2],sao_offset_3_w[2]};
		4'b1100: sao_bo_offset_sign_r =  {3'b0,sao_offset_0_w[2],sao_offset_1_w[2]};
		4'b1101: sao_bo_offset_sign_r =  {2'b0,sao_offset_0_w[2],sao_offset_1_w[2],sao_offset_3_w[2]};
		4'b1110: sao_bo_offset_sign_r =  {2'b0,sao_offset_0_w[2],sao_offset_1_w[2],sao_offset_2_w[2]};
		4'b1111: sao_bo_offset_sign_r =  {1'b0,sao_offset_0_w[2],sao_offset_1_w[2],sao_offset_2_w[2],sao_offset_3_w[2]}; 
    endcase 
end 

// saoTypeIdx
always @* begin 
    if (sao_merge_i)begin            // sao_merge_i = merge_left || merge_top 
	    cu_binary_sao_0_r  =  {2'b01,1'b0,8'hff    };
	    cu_binary_sao_1_r  =  {2'b01,1'b0,8'hff    };
	end  
    else if(sao_compidx_i[1]) begin  // sao_compidx_i == 2 
	    cu_binary_sao_0_r  =  {2'b01,1'b0,8'hff    };
	    cu_binary_sao_1_r  =  {2'b01,1'b0,8'hff    };
	end 
    else if(ui_symbol_w==3'd6) begin // ui_symbol_w ==6 
	    cu_binary_sao_0_r  =  {2'b00,1'b0,3'd4,5'd20}; 
	    cu_binary_sao_1_r  =  {2'b01,1'b0,8'hff    };
	end 
	else begin 
	    cu_binary_sao_0_r  =  {2'b00,1'b1,3'd4,5'd20}; 
	    cu_binary_sao_1_r  =  {2'b10,1'b0,3'd1,4'b0,(!sao_type_w[2])};
	end 
end 

// sao_offset
always @* begin 
    if (sao_merge_i)begin            // sao_merge_i = merge_left || merge_top 
        cu_binary_sao_2_r =  {2'b01,1'b0,8'hff};
        cu_binary_sao_3_r =  {2'b01,1'b0,8'hff};
	    cu_binary_sao_4_r =  {2'b01,1'b0,8'hff};
	    cu_binary_sao_5_r =  {2'b01,1'b0,8'hff};
	end
    else if(ui_symbol_w==3'd6)begin 
        cu_binary_sao_2_r =  {2'b01,1'b0,8'hff};
        cu_binary_sao_3_r =  {2'b01,1'b0,8'hff};
	    cu_binary_sao_4_r =  {2'b01,1'b0,8'hff};
	    cu_binary_sao_5_r =  {2'b01,1'b0,8'hff};
    end 
	else begin 
	    cu_binary_sao_2_r =  {2'b10,1'b0,sao_max_uvlc_num_0_w,sao_max_uvlc_0_r} ;
		cu_binary_sao_3_r =  {2'b10,1'b0,sao_max_uvlc_num_1_w,sao_max_uvlc_1_r} ;
		cu_binary_sao_4_r =  {2'b10,1'b0,sao_max_uvlc_num_2_w,sao_max_uvlc_2_r} ;
        cu_binary_sao_5_r =  {2'b10,1'b0,sao_max_uvlc_num_3_w,sao_max_uvlc_3_r} ;
    end 
end 

// sao_bo_offsetsign 
always @* begin 
     if (sao_merge_i)       // sao_merge_i = merge_left || merge_top 
        cu_binary_sao_6_r =  {2'b01,1'b0,8'hff};
    else if(ui_symbol_w==3'd6) 
        cu_binary_sao_6_r =  {2'b01,1'b0,8'hff};
    else if(sao_type_w==3'd4) // SAO_BO
        cu_binary_sao_6_r =  {2'b10,1'b0,sao_bo_offset_num_w,sao_bo_offset_sign_r};
    else 
        cu_binary_sao_6_r = {2'b01,1'b0,8'hff};
end 

// sao_subTypeIdx 
always @* begin 
    if (sao_merge_i)   // sao_merge_i = merge_left || merge_top 
	    cu_binary_sao_7_r  =  {2'b01,1'b0,8'hff}; 
    else if(ui_symbol_w==3'd6)
        cu_binary_sao_7_r  =  {2'b01,1'b0,8'hff};  
    else if(sao_type_w[2]) // SAO_BO
        cu_binary_sao_7_r  =  {2'b10,1'b0,3'd5,sao_sub_type_w};  
	else if(sao_compidx_i[1])  // comp_idx ==2
	    cu_binary_sao_7_r  =  {2'b01,1'b0,8'hff};  
	else 
	    cu_binary_sao_7_r  =  {2'b10,1'b0,3'd2,2'd0,sao_type_w};  
end 


assign   cu_binary_sao_0_o  =   cu_binary_sao_0_r  ;
assign   cu_binary_sao_1_o  =   cu_binary_sao_1_r  ;
assign   cu_binary_sao_2_o  =   cu_binary_sao_2_r  ;
assign   cu_binary_sao_3_o  =   cu_binary_sao_3_r  ;
assign   cu_binary_sao_4_o  =   cu_binary_sao_4_r  ;
assign   cu_binary_sao_5_o  =   cu_binary_sao_5_r  ;
assign   cu_binary_sao_6_o  =   cu_binary_sao_6_r  ;
assign   cu_binary_sao_7_o  =   cu_binary_sao_7_r  ;



endmodule 
