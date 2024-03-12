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
// Filename       : cabac_pu_binari_mv.v
// Author         : chewein
// Created        : 2014-9-11
// Description    : binarization inter mv and mv index 
//-----------------------------------------------------------------------------------------------------------------------------
`include"enc_defines.v"

module cabac_pu_binari_mv(
                            mvp_idx_i          ,
                            mv_i               ,
                      
					        ctx_pair_mv_0_o    ,
							ctx_pair_mv_1_o    ,
							ctx_pair_mv_2_o    ,
							ctx_pair_mv_3_o    ,
					        ctx_pair_mv_4_o    ,
					        ctx_pair_mv_5_o    ,
					        ctx_pair_mv_6_o    ,
					        ctx_pair_mv_7_o    ,
					        ctx_pair_mv_8_o    ,
                            ctx_pair_mv_9_o    ,
							ctx_pair_mv_10_o   ,
							ctx_pair_mv_11_o   ,
							ctx_pair_mv_12_o   ,
							ctx_pair_mv_13_o   ,
							ctx_pair_mv_14_o   
							
);

//-----------------------------------------------------------------------------------------------------------------------------
//
//              inputs and outputs declaration 
//
//-----------------------------------------------------------------------------------------------------------------------------
input         [2:0]                    mvp_idx_i                     ;  
input         [2*`MVD_WIDTH-1:0]       mv_i                          ;  

output        [10:0]                   ctx_pair_mv_0_o               ;
output        [10:0]                   ctx_pair_mv_1_o               ;
output        [10:0]                   ctx_pair_mv_2_o               ;
output        [10:0]                   ctx_pair_mv_3_o               ;
output        [10:0]                   ctx_pair_mv_4_o               ;
output        [10:0]                   ctx_pair_mv_5_o               ;
output        [10:0]                   ctx_pair_mv_6_o               ;
output        [10:0]                   ctx_pair_mv_7_o               ;
output        [10:0]                   ctx_pair_mv_8_o               ;
output        [10:0]                   ctx_pair_mv_9_o               ;
output        [10:0]                   ctx_pair_mv_10_o              ;
output        [10:0]                   ctx_pair_mv_11_o              ;
output        [10:0]                   ctx_pair_mv_12_o              ;
output        [10:0]                   ctx_pair_mv_13_o              ;
output        [10:0]                   ctx_pair_mv_14_o              ;

//-----------------------------------------------------------------------------------------------------------------------------
//
//                 wire and reg declaration  
//
//-----------------------------------------------------------------------------------------------------------------------------
wire  signed  [10:0]                   mv_x_s_w                      ;
wire  signed  [10:0]                   mv_y_s_w                      ;

wire          [10:0]                   mv_x_abs_w                    ;
wire          [10:0]                   mv_y_abs_w                    ;

wire                                   mv_x_no_equal_zero_w          ;
wire                                   mv_y_no_equal_zero_w          ;

wire                                   mv_x_abs_gl_1_w               ;
wire                                   mv_y_abs_gl_1_w               ;

// mvp idx 
wire                                   mvp_idx_no_equal_zero_w       ;
wire                                   i_code_last_w                 ;

wire                                   mvp_idx_1_valid_w             ;
wire                                   mvp_idx_2_valid_w             ;
wire                                   mvp_idx_3_valid_w             ;
wire                                   mvp_idx_4_valid_w             ;

// mv_x_abs_minus2_w binarization :1 kth epxgolomb 
wire          [ 2:0]   		           num_bins_x_2_w                ;
wire          [ 2:0]   		           num_bins_x_1_w                ;
wire          [ 2:0]   		           num_bins_x_0_w                ;	
wire          [14:0]                   mv_x_bins_w                   ;
// mv_y_abs_minus2_w binarization :1 kth epxgolomb 
wire          [ 2:0]   		           num_bins_y_2_w                ;
wire          [ 2:0]   		           num_bins_y_1_w                ;
wire          [ 2:0]   		           num_bins_y_0_w                ;	
wire          [14:0]                   mv_y_bins_w                   ;

wire          [10:0]                   ctx_pair_mv_0_w               ; // mv 
wire          [10:0]                   ctx_pair_mv_1_w               ; // mv 
reg           [10:0]                   ctx_pair_mv_2_r               ; // mv 
reg           [10:0]                   ctx_pair_mv_3_r               ; // mv 
reg           [10:0]                   ctx_pair_mv_4_r               ; // mv 
reg           [10:0]                   ctx_pair_mv_5_r               ; // mv 
reg           [10:0]                   ctx_pair_mv_6_r               ; // mv 
reg           [10:0]                   ctx_pair_mv_7_r               ; // mv 
reg           [10:0]                   ctx_pair_mv_8_r               ; // mv 
reg           [10:0]                   ctx_pair_mv_9_r               ; // mv 

wire          [10:0]                   ctx_pair_mv_10_w              ; // mvp idx 
reg           [10:0]                   ctx_pair_mv_11_r              ; // mvp idx 
reg           [10:0]                   ctx_pair_mv_12_r              ; // mvp idx 
reg           [10:0]                   ctx_pair_mv_13_r              ; // mvp idx 
reg           [10:0]                   ctx_pair_mv_14_r              ; // mvp idx 


//-----------------------------------------------------------------------------------------------------------------------------
//
//                 mv binarization 
//
//-----------------------------------------------------------------------------------------------------------------------------
assign   mv_x_s_w            =  mv_i[21:11]                                    ;
assign   mv_y_s_w            =  mv_i[10:0 ]                                    ;

assign   mv_x_abs_w          =  mv_x_s_w[10] ? (~mv_x_s_w + 1'b1) : mv_x_s_w    ;
assign   mv_y_abs_w          =  mv_y_s_w[10] ? (~mv_y_s_w + 1'b1) : mv_y_s_w    ;

assign   mv_x_no_equal_zero_w=  !(!mv_x_s_w)                                   ;
assign   mv_y_no_equal_zero_w=  !(!mv_y_s_w)                                   ;

assign   mv_x_abs_gl_1_w     =  !(!mv_x_abs_w[10:1])                            ;
assign   mv_y_abs_gl_1_w     =  !(!mv_y_abs_w[10:1])                            ;

//   binarization : 1 kth epxgolomb 
cabac_binari_epxgolomb_1kth  mv_x_abs(
                                        .symbol_i         ( mv_x_abs_w[7:0]       ),
                                        .mv_sign_i        ( mv_x_s_w[10]          ),
                                        .num_bins_2_o     ( num_bins_x_2_w        ),
                                        .num_bins_1_o     ( num_bins_x_1_w        ),
                                        .num_bins_0_o     ( num_bins_x_0_w        ),
										.mv_bins_o        ( mv_x_bins_w           ) 
                            );

//   binarization : 1 kth epxgolomb 
cabac_binari_epxgolomb_1kth  mv_y_abs(
                                        .symbol_i         ( mv_y_abs_w[7:0]       ),
                                        .mv_sign_i        ( mv_y_s_w[10]          ),
                                        .num_bins_2_o     ( num_bins_y_2_w        ),
                                        .num_bins_1_o     ( num_bins_y_1_w        ),
                                        .num_bins_0_o     ( num_bins_y_0_w        ),
							            .mv_bins_o        ( mv_y_bins_w           )			
                            );

// coding_mode:0:regular mode,1:invalid,2:bypass mode,3:terminal mode 
// regular:{2'b01, bin, bank_num,addr_idx} {2,1,3,5}  
// bypass :{2'b10,1resverd,bins_num,bin_string} {2,1resverd,3,5}

assign   ctx_pair_mv_0_w     =  {2'b00,mv_x_no_equal_zero_w,3'd1,5'd31}        ;
assign   ctx_pair_mv_1_w     =  {2'b00,mv_y_no_equal_zero_w,3'd1,5'd31}        ;

// ctx_pair_mv_2_r
always @* begin 
    if(mv_x_no_equal_zero_w)
	    ctx_pair_mv_2_r      =  {2'b00,mv_x_abs_gl_1_w,3'd4,5'd30}             ;
    else 
        ctx_pair_mv_2_r      =  {2'b01,1'b0           ,8'hff     }             ;
end 

// ctx_pair_mv_3_r
always @* begin 
    if(mv_y_no_equal_zero_w)
	    ctx_pair_mv_3_r      =  {2'b00,mv_y_abs_gl_1_w,3'd4,5'd30}             ;
    else 
        ctx_pair_mv_3_r      =  {2'b01,1'b0           ,8'hff     }             ;
end 

/*
// ctx_pair_mv_4_r ,ctx_pair_mv_5_r ,ctx_pair_mv_6_r
always @* begin 
    if(mv_x_no_equal_zero_w&&mv_x_abs_gl_1_w) begin 
	    case(num_group_x_w)
		    2'd1: begin 
			    ctx_pair_mv_4_r = {2'b10,1'b0,num_bins_x_2_w,1'b0,bins_group_x_2_w   }        ;
			    ctx_pair_mv_5_r = {2'b10,1'b0,3'b001        ,4'b0,mv_x_s_w[9]        }        ;
			    ctx_pair_mv_6_r = {2'b01,1'b0,8'hff                                  }        ;
			end                                                                               
			2'd2: begin                                                                       
			    ctx_pair_mv_4_r = {2'b10,1'b0,num_bins_x_2_w,1'b0,bins_group_x_2_w   }        ;
			    ctx_pair_mv_5_r = {2'b10,1'b0,num_bins_x_1_w,1'b0,bins_group_x_1_w   }        ;
			    ctx_pair_mv_6_r = {2'b10,1'b0,3'b001        ,4'b0,mv_x_s_w[9]        }        ;
			end                                                                      
			2'd3: begin                                                              
			    ctx_pair_mv_4_r = {2'b10,1'b0,num_bins_x_2_w,1'b0,bins_group_x_2_w   }        ;
			    ctx_pair_mv_5_r = {2'b10,1'b0,num_bins_x_1_w,1'b0,bins_group_x_1_w   }        ;
			    ctx_pair_mv_6_r = {2'b10,1'b0,num_bins_x_0_w,bins_group_x_0_w,mv_x_s_w[9 ]  } ;
			end 
		 default: begin 
		        ctx_pair_mv_4_r = {2'b10,1'b0,3'b001,{4'b0000,mv_x_s_w[ 9]} };
		        ctx_pair_mv_5_r = {2'b01,1'b0,8'hff                         };
		        ctx_pair_mv_6_r = {2'b01,1'b0,8'hff                         };
		    end 
		endcase 	
	end 
	else if(mv_x_no_equal_zero_w) begin 
	    ctx_pair_mv_4_r = {2'b10,1'b0,3'b001 ,{4'b0000,mv_x_s_w[9] }}  ;
	    ctx_pair_mv_5_r = {2'b01,1'b0,8'hff}                           ;
	    ctx_pair_mv_6_r = {2'b01,1'b0,8'hff}                           ;	
	end 
	else begin 
	    ctx_pair_mv_4_r = {2'b01,1'b0,8'hff}                           ;
	    ctx_pair_mv_5_r = {2'b01,1'b0,8'hff}                           ;
	    ctx_pair_mv_6_r = {2'b01,1'b0,8'hff}                           ;
    end 
end 								

// ctx_pair_mv_7_r ,ctx_pair_mv_8_r ,ctx_pair_mv_9_r
always @* begin 
    if(mv_y_no_equal_zero_w&&mv_y_abs_gl_1_w) begin 
	    case(num_group_y_w)
		    2'd1: begin 
			    ctx_pair_mv_7_r = {2'b10,1'b0,num_bins_y_2_w,1'b0,bins_group_y_2_w   }        ;
			    ctx_pair_mv_8_r = {2'b10,1'b0,3'b001        ,4'b0,mv_y_s_w[9]        }        ;
			    ctx_pair_mv_9_r = {2'b01,1'b0,8'b1111_1111                           }        ;
			end                                                                               
			2'd2: begin                                                                       
			    ctx_pair_mv_7_r = {2'b10,1'b0,num_bins_y_2_w,1'b0,bins_group_y_2_w   }        ;
			    ctx_pair_mv_8_r = {2'b10,1'b0,num_bins_y_1_w,1'b0,bins_group_y_1_w   }        ;
			    ctx_pair_mv_9_r = {2'b10,1'b0,3'b001        ,4'b0,mv_y_s_w[9]        }        ;
			end 
			2'd3: begin 
			    ctx_pair_mv_7_r = {2'b10,1'b0,num_bins_y_2_w,1'b0,bins_group_y_2_w   }        ;
			    ctx_pair_mv_8_r = {2'b10,1'b0,num_bins_y_1_w,1'b0,bins_group_y_1_w   }        ;
			    ctx_pair_mv_9_r = {2'b10,1'b0,num_bins_y_0_w,bins_group_y_0_w,mv_y_s_w[9]    };
			end 
		 default: begin 
		        ctx_pair_mv_7_r = {2'b10,1'b0,3'b001,4'b0000,mv_y_s_w[9]    };
		        ctx_pair_mv_8_r = {2'b01,1'b0,8'hff                         };
		        ctx_pair_mv_9_r = {2'b01,1'b0,8'hff                         };
		    end 
		endcase 	
	end 
	else if(mv_y_no_equal_zero_w) begin 
	    ctx_pair_mv_7_r = {2'b10,1'b0,3'b001 ,{4'b0000,mv_y_s_w[9]}}   ;
	    ctx_pair_mv_8_r = {2'b01,1'b0,8'hff}                           ;
	    ctx_pair_mv_9_r = {2'b01,1'b0,8'hff}                           ;	
	end 
	else begin 
	    ctx_pair_mv_7_r = {2'b01,1'b0,8'hff}                           ;
	    ctx_pair_mv_8_r = {2'b01,1'b0,8'hff}                           ;
	    ctx_pair_mv_9_r = {2'b01,1'b0,8'hff}                           ;
    end 
end 
*/

// ctx_pair_mv_4_r ,ctx_pair_mv_5_r ,ctx_pair_mv_6_r
// ctx_pair_mv_4_r ,ctx_pair_mv_5_r ,ctx_pair_mv_6_r

always @* begin 
	if(num_bins_x_2_w)
        ctx_pair_mv_4_r        =  {2'b10,1'b0,num_bins_x_2_w,mv_x_bins_w[14:10]}; 
    else 
        ctx_pair_mv_4_r        =  {2'b01,1'b0,8'hff}; 
end 

always @* begin 
    if(num_bins_x_1_w)
        ctx_pair_mv_5_r        =  {2'b10,1'b0,num_bins_x_1_w,mv_x_bins_w[ 9:5 ]};
    else 
	    ctx_pair_mv_5_r        =  {2'b01,1'b0,8'hff};
end 

always @* begin 
    if(num_bins_x_0_w)
        ctx_pair_mv_6_r        =  {2'b10,1'b0,num_bins_x_0_w,mv_x_bins_w[ 4:0 ]};
    else 
	    ctx_pair_mv_6_r        =  {2'b01,1'b0,8'hff};
end 

always @* begin 
    if(num_bins_y_2_w)
        ctx_pair_mv_7_r        =  {2'b10,1'b0,num_bins_y_2_w,mv_y_bins_w[14:10]};
    else 
	    ctx_pair_mv_7_r        =  {2'b01,1'b0,8'hff};

end 

always @* begin 
    if(num_bins_y_1_w)
        ctx_pair_mv_8_r        =  {2'b10,1'b0,num_bins_y_1_w,mv_y_bins_w[ 9:5 ]};
    else 
	    ctx_pair_mv_8_r        =  {2'b01,1'b0,8'hff};

end 

always @* begin 
    if(num_bins_y_0_w)
        ctx_pair_mv_9_r        =  {2'b10,1'b0,num_bins_y_0_w,mv_y_bins_w[ 4:0 ]};
    else 
	    ctx_pair_mv_9_r        =  {2'b01,1'b0,8'hff};

end 


//-----------------------------------------------------------------------------------------------------------------------------
//
//                 mvp_idx binarization 
//
//-----------------------------------------------------------------------------------------------------------------------------

assign   mvp_idx_no_equal_zero_w=   !(!mvp_idx_i)                              ; 

assign   mvp_idx_1_valid_w      =   mvp_idx_i > 3'd1                           ;
assign   mvp_idx_2_valid_w      =   mvp_idx_i > 3'd2                           ;
assign   mvp_idx_3_valid_w      =   mvp_idx_i > 3'd3                           ;
assign   mvp_idx_4_valid_w      =   mvp_idx_i > 3'd4                           ;

// ctx_pair_mv_10_w
assign   ctx_pair_mv_10_w       =   {2'b00,mvp_idx_no_equal_zero_w,3'd0,5'd31} ; 

// ctx_pair_mv_11_r
always @* begin 
    if(mvp_idx_1_valid_w)
        ctx_pair_mv_11_r     =  {2'b00,1'b1,3'd4,5'd31}                        ;
    else 
	    ctx_pair_mv_11_r     =  {2'b01,1'b0,8'hff     }                        ;
end 

// ctx_pair_mv_12_r
always @* begin 
    if(mvp_idx_2_valid_w)
        ctx_pair_mv_12_r     =  {2'b00,1'b1,3'd4,5'd31}                        ;
    else 
	    ctx_pair_mv_12_r     =  {2'b01,1'b0,8'hff     }                        ;
end 

// ctx_pair_mv_13_r
always @* begin 
    if(mvp_idx_3_valid_w)
        ctx_pair_mv_13_r     =  {2'b00,1'b1,3'd4,5'd31}                        ;
    else 
	    ctx_pair_mv_13_r     =  {2'b01,1'b0,8'hff     }                        ;
end 

// ctx_pair_mv_14_r
always @* begin 
    if(mvp_idx_4_valid_w)
        ctx_pair_mv_14_r     =  {2'b00,1'b1,3'd4,5'd31}                        ;
    else 
	    ctx_pair_mv_14_r     =  {2'b01,1'b0,8'hff     }                        ;
end 

//-----------------------------------------------------------------------------------------------------------------------------
//
//                 output 
//
//-----------------------------------------------------------------------------------------------------------------------------
assign   ctx_pair_mv_0_o     =   ctx_pair_mv_0_w                               ;
assign   ctx_pair_mv_1_o     =   ctx_pair_mv_1_w                               ;
assign   ctx_pair_mv_2_o     =   ctx_pair_mv_2_r                               ;
assign   ctx_pair_mv_3_o     =   ctx_pair_mv_3_r                               ;
assign   ctx_pair_mv_4_o     =   ctx_pair_mv_4_r                               ;
assign   ctx_pair_mv_5_o     =   ctx_pair_mv_5_r                               ;
assign   ctx_pair_mv_6_o     =   ctx_pair_mv_6_r                               ;
assign   ctx_pair_mv_7_o     =   ctx_pair_mv_7_r                               ;
assign   ctx_pair_mv_8_o     =   ctx_pair_mv_8_r                               ;
assign   ctx_pair_mv_9_o     =   ctx_pair_mv_9_r                               ;
assign   ctx_pair_mv_10_o    =   ctx_pair_mv_10_w                              ;
assign   ctx_pair_mv_11_o    =   ctx_pair_mv_11_r                              ;
assign   ctx_pair_mv_12_o    =   ctx_pair_mv_12_r                              ;
assign   ctx_pair_mv_13_o    =   ctx_pair_mv_13_r                              ;
assign   ctx_pair_mv_14_o    =   ctx_pair_mv_14_r                              ;



endmodule 
