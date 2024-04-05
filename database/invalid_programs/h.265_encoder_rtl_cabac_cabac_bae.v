//-------------------------------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
// Filename       : cabac_bae.v
//-------------------------------------------------------------------------------------------
// Author         : chewein
// Created        : 2014-09-03
// Description    : cabac binary arithmetic encoding
//-------------------------------------------------------------------------------------------
`include "enc_defines.v"

module cabac_bae(
                //input
                clk                     ,
                rst_n                   ,
                table_build_end_i		,
  
                bae_ctx_pair_0_i        ,
                bae_ctx_pair_1_i        ,
                bae_ctx_pair_2_i        ,
                bae_ctx_pair_3_i        ,
                                        
                //output                
                bae_output_byte_o       ,
                output_byte_en_o        ,
                no_bit_flag_o			
);

//-------------------------------------------------------------------------------------------

input                   clk                                          ;   // clock
input                   rst_n                                        ;   // reset signal        
input				    table_build_end_i		                     ;	// table_build_end_i

input       [9:0]       bae_ctx_pair_0_i                             ;   // {coding_mode, bin, MPS, pStateIdx} {1,1,1,1,6}   
input       [9:0]       bae_ctx_pair_1_i                             ;   // {coding_mode, bin, MPS, pStateIdx} {1,1,1,1,6}
input       [9:0]       bae_ctx_pair_2_i                             ;   // {coding_mode, bin, MPS, pStateIdx} {1,1,1,1,6}      
input       [9:0]       bae_ctx_pair_3_i                             ;   // {coding_mode, bin, MPS, pStateIdx} {1,1,1,1,6}  
                                                                // coding_mode:0:invalid,1:regular mode,2:bypass mode,3:terminal mode 
output      [7:0]       bae_output_byte_o                            ;   // output byte after bae
output                  output_byte_en_o                             ;   // output byte enable signal
output	    			no_bit_flag_o			                     ;	// no bits in bit_pack_buffer flag

reg					    no_bit_flag_o			                     ;	// no bits in bit_pack_buffer flag      

//-------------------------------------------------------------------------------------------
//
//stage 1 : loop up table for i_range_lut and shift_lut and calculation bin_eq_lps  
//
//-------------------------------------------------------------------------------------------

//instance 0 signal 
wire         [5:0]      state_0_w                                    ;   
wire                    bin_0_w                                      ;
wire                    mps_0_w                                      ;  
  
wire         [31:0]     range_lps_lut_0_w                            ;          
wire         [15:0]     shift_lut_0_w                                ;
wire                    bin_eq_lps_0_w                               ;
wire         [35:0]     range_lps_update_lut_0_w                     ;

reg          [9:0]      bae_ctx_pair_0_d1_r                          ;  
reg          [31:0]     range_lps_lut_0_r                            ;
reg          [15:0]     shift_lut_0_r                                ;
reg                     bin_eq_lps_0_r                               ;
reg          [35:0]     range_lps_update_lut_0_r                     ;

//instance 1 signal 
wire         [5:0]      state_1_w                                    ;   
wire                    bin_1_w                                      ;
wire                    mps_1_w                                      ;    

wire         [31:0]     range_lps_lut_1_w                            ;          
wire         [15:0]     shift_lut_1_w                                ;
wire                    bin_eq_lps_1_w                               ;
wire         [35:0]     range_lps_update_lut_1_w                     ;

reg          [9:0]      bae_ctx_pair_1_d1_r                          ;  
reg          [31:0]     range_lps_lut_1_r                            ;
reg          [15:0]     shift_lut_1_r                                ;
reg                     bin_eq_lps_1_r                               ;
reg          [35:0]     range_lps_update_lut_1_r                     ;

//instance 2 signal 
wire         [5:0]      state_2_w                                    ;   
wire                    bin_2_w                                      ;
wire                    mps_2_w                                      ;    

wire         [31:0]     range_lps_lut_2_w                            ;          
wire         [15:0]     shift_lut_2_w                                ;
wire                    bin_eq_lps_2_w                               ;
wire         [35:0]     range_lps_update_lut_2_w                     ;

reg          [9:0]      bae_ctx_pair_2_d1_r                          ;  
reg          [31:0]     range_lps_lut_2_r                            ;
reg          [15:0]     shift_lut_2_r                                ;
reg                     bin_eq_lps_2_r                               ;
reg          [35:0]     range_lps_update_lut_2_r                     ;

//instance 3 signal 
wire         [5:0]      state_3_w                                    ;   
wire                    bin_3_w                                      ;
wire                    mps_3_w                                      ;    

wire         [31:0]     range_lps_lut_3_w                            ;          
wire         [15:0]     shift_lut_3_w                                ;
wire                    bin_eq_lps_3_w                               ;
wire         [35:0]     range_lps_update_lut_3_w                     ;

reg          [9:0]      bae_ctx_pair_3_d1_r                          ;  
reg          [31:0]     range_lps_lut_3_r                            ;
reg          [15:0]     shift_lut_3_r                                ;
reg                     bin_eq_lps_3_r                               ;
reg          [35:0]     range_lps_update_lut_3_r                     ;

//instance input signal 
assign   state_0_w  =  bae_ctx_pair_0_i[5:0]                         ;
assign   bin_0_w    =  bae_ctx_pair_0_i[7]                           ;
assign   mps_0_w    =  bae_ctx_pair_0_i[6]                           ;

assign   state_1_w  =  bae_ctx_pair_1_i[5:0]                         ;
assign   bin_1_w    =  bae_ctx_pair_1_i[7]                           ;
assign   mps_1_w    =  bae_ctx_pair_1_i[6]                           ;

assign   state_2_w  =  bae_ctx_pair_2_i[5:0]                         ;
assign   bin_2_w    =  bae_ctx_pair_2_i[7]                           ;
assign   mps_2_w    =  bae_ctx_pair_2_i[6]                           ;

assign   state_3_w  =  bae_ctx_pair_3_i[5:0]                         ;
assign   bin_3_w    =  bae_ctx_pair_3_i[7]                           ;
assign   mps_3_w    =  bae_ctx_pair_3_i[6]                           ;
//instance  
cabac_bae_stage1 u_cabac_bae_stage1_0(
                                    //input 
                                    .state_i               ( state_0_w              ),
							        .bin_i                 ( bin_0_w                ),
							        .mps_i                 ( mps_0_w                ),
									//output                                        
                                    .range_lps_o           ( range_lps_lut_0_w      ),                     
                                    .shift_lut_o           ( shift_lut_0_w          ),
							        .bin_eq_lps_o          ( bin_eq_lps_0_w         ),
                                    .range_lps_update_lut_o(range_lps_update_lut_0_w)									
                                    );

cabac_bae_stage1 u_cabac_bae_stage1_1(
                                    //input 
                                    .state_i               ( state_1_w              ),
							        .bin_i                 ( bin_1_w                ),
							        .mps_i                 ( mps_1_w                ),
									//output                
                                    .range_lps_o           ( range_lps_lut_1_w      ),                     
                                    .shift_lut_o           ( shift_lut_1_w          ),
							        .bin_eq_lps_o          ( bin_eq_lps_1_w         ),
                                    .range_lps_update_lut_o(range_lps_update_lut_1_w)									
                                    );
									
cabac_bae_stage1 u_cabac_bae_stage1_2(
                                    //input 
                                    .state_i               ( state_2_w              ),
							        .bin_i                 ( bin_2_w                ),
							        .mps_i                 ( mps_2_w                ),
									//output                                       
                                    .range_lps_o           ( range_lps_lut_2_w      ),                     
                                    .shift_lut_o           ( shift_lut_2_w          ),
							        .bin_eq_lps_o          ( bin_eq_lps_2_w         ),
                                    .range_lps_update_lut_o(range_lps_update_lut_2_w)									
                                    );		

cabac_bae_stage1 u_cabac_bae_stage1_3(
                                    //input 
                                    .state_i               ( state_3_w              ),
							        .bin_i                 ( bin_3_w                ),
							        .mps_i                 ( mps_3_w                ),
									//output                                       
                                    .range_lps_o           ( range_lps_lut_3_w      ),                     
                                    .shift_lut_o           ( shift_lut_3_w          ),
							        .bin_eq_lps_o          ( bin_eq_lps_3_w         ),
                                    .range_lps_update_lut_o(range_lps_update_lut_3_w)									
                                    );										

// output reg 									
always @(posedge clk or negedge rst_n) begin									
    if(!rst_n) begin  
        range_lps_lut_0_r  <=  32'b0                         ;
	    shift_lut_0_r      <=  16'b0                         ;
	    bin_eq_lps_0_r     <=  1'b0                          ; 
		bae_ctx_pair_0_d1_r<=  10'h1ff                       ;
		range_lps_update_lut_0_r<=32'd0                      ;
    end	                                                     
	else begin                                               
        range_lps_lut_0_r  <=  range_lps_lut_0_w             ;
	    shift_lut_0_r      <=  shift_lut_0_w                 ;
	    bin_eq_lps_0_r     <=  bin_eq_lps_0_w                ;
		bae_ctx_pair_0_d1_r<=  bae_ctx_pair_0_i              ;
	    range_lps_update_lut_0_r <= range_lps_update_lut_0_w ;
    end  									                 
end 									                     

always @(posedge clk or negedge rst_n) begin		          							
    if(!rst_n) begin                                         
        range_lps_lut_1_r  <=  32'b0                                 ;
	    shift_lut_1_r      <=  16'b0                                 ;
	    bin_eq_lps_1_r     <=  1'b0                                  ; 
		bae_ctx_pair_1_d1_r<=  10'h1ff                               ;
       range_lps_update_lut_1_r <= 32'd0                             ;
    end	                                                             
	else begin                                                       
        range_lps_lut_1_r  <=  range_lps_lut_1_w                     ;
	    shift_lut_1_r      <=  shift_lut_1_w                         ;
	    bin_eq_lps_1_r     <=  bin_eq_lps_1_w                        ;
		bae_ctx_pair_1_d1_r<=  bae_ctx_pair_1_i                      ;
		range_lps_update_lut_1_r <= range_lps_update_lut_1_w         ;
    end  									                 
end 		                                                 

always @(posedge clk or negedge rst_n) begin		          							
    if(!rst_n) begin                                         
        range_lps_lut_2_r  <=  32'b0                         ;
	    shift_lut_2_r      <=  16'b0                         ;
	    bin_eq_lps_2_r     <=  1'b0                          ; 
		bae_ctx_pair_2_d1_r<=  10'h1ff                       ;
	    range_lps_update_lut_2_r <= 32'd0                    ;
    end	                                                     
	else begin                                               
        range_lps_lut_2_r  <=  range_lps_lut_2_w             ;
	    shift_lut_2_r      <=  shift_lut_2_w                 ;
	    bin_eq_lps_2_r     <=  bin_eq_lps_2_w                ;
		bae_ctx_pair_2_d1_r<=  bae_ctx_pair_2_i              ;
	    range_lps_update_lut_2_r <= range_lps_update_lut_2_w ;
    end  									
end 

always @(posedge clk or negedge rst_n) begin		          							
    if(!rst_n) begin                                         
        range_lps_lut_3_r  <=  32'b0                         ;
	    shift_lut_3_r      <=  16'b0                         ;
	    bin_eq_lps_3_r     <=  1'b0                          ; 
		bae_ctx_pair_3_d1_r<=  10'h1ff                       ;
	    range_lps_update_lut_3_r <= 32'd0                    ;
    end	                                                     
	else begin                                               
        range_lps_lut_3_r  <=  range_lps_lut_3_w             ;
	    shift_lut_3_r      <=  shift_lut_3_w                 ;
	    bin_eq_lps_3_r     <=  bin_eq_lps_3_w                ;
		bae_ctx_pair_3_d1_r<=  bae_ctx_pair_3_i              ;
	    range_lps_update_lut_3_r <= range_lps_update_lut_3_w ;
    end  									
end 

//-------------------------------------------------------------------------------------------
//
//stage 2 : range update 
//
//-------------------------------------------------------------------------------------------
//instance 0 signal 
wire         [8:0]      range_0_w                                    ;
wire                    bin_valid_0_w                                ;
wire         [2:0]      bin_mode_0_w                                 ;

wire         [8:0]      range_update_0_w                             ;
wire         [8:0]      t_range_0_w                                  ;
wire                    bin_neq_mps_0_w                              ;   
wire         [3:0]      shift_0_w                                    ;

reg          [9:0]      bae_ctx_pair_0_d2_r                          ;  
reg          [8:0]      range_update_0_r                             ;
reg          [8:0]      t_range_0_r                                  ;
reg                     bin_eq_lps_0_d1_r                            ;
reg                     bin_neq_mps_0_r                              ;   
reg          [3:0]      shift_0_r                                    ;

//instance 1 signal                                                  
wire         [8:0]      range_1_w                                    ;
wire                    bin_valid_1_w                                ;
wire         [2:0]      bin_mode_1_w                                 ;

wire         [8:0]      range_update_1_w                             ;
wire         [8:0]      t_range_1_w                                  ;
wire                    bin_neq_mps_1_w                              ;   
wire         [3:0]      shift_1_w                                    ;

reg          [9:0]      bae_ctx_pair_1_d2_r                          ;  
reg          [8:0]      range_update_1_r                             ;
reg          [8:0]      t_range_1_r                                  ;
reg                     bin_eq_lps_1_d1_r                            ;
reg                     bin_neq_mps_1_r                              ;   
reg          [3:0]      shift_1_r                                    ;

//instance 2 signal                                                  
wire         [8:0]      range_2_w                                    ;
wire                    bin_valid_2_w                                ;
wire         [2:0]      bin_mode_2_w                                 ;

wire         [8:0]      range_update_2_w                             ;
wire         [8:0]      t_range_2_w                                  ;
wire                    bin_neq_mps_2_w                              ;   
wire         [3:0]      shift_2_w                                    ;

reg          [9:0]      bae_ctx_pair_2_d2_r                          ;  
reg          [8:0]      range_update_2_r                             ;
reg          [8:0]      t_range_2_r                                  ;
reg                     bin_eq_lps_2_d1_r                            ;
reg                     bin_neq_mps_2_r                              ;   
reg          [3:0]      shift_2_r                                    ;

//instance 3 signal                                                  
wire         [8:0]      range_3_w                                    ;
wire                    bin_valid_3_w                                ;
wire         [2:0]      bin_mode_3_w                                 ;

wire         [8:0]      range_update_3_w                             ;
wire         [8:0]      t_range_3_w                                  ;
wire                    bin_neq_mps_3_w                              ;   
wire         [3:0]      shift_3_w                                    ;

reg          [9:0]      bae_ctx_pair_3_d2_r                          ;  
reg          [8:0]      range_update_3_r                             ;
reg          [8:0]      t_range_3_r                                  ;
reg                     bin_eq_lps_3_d1_r                            ;
reg                     bin_neq_mps_3_r                              ;   
reg          [3:0]      shift_3_r                                    ;

//------------------------------------------------------------------------------------------
// internal signal
reg                     table_build_end_d1_r                         ;
reg         [8:0]       range_last_r                                 ;

// table_build_end_d1_r
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        table_build_end_d1_r  <=  1'd0                               ;
	else                                                             
		table_build_end_d1_r  <=  table_build_end_i                  ;

end 

// range_last_r
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        range_last_r       <=  9'd510                                ;
	else if(table_build_end_d1_r)                                    
		range_last_r 	   <=  9'd510                                ;
	else if(bin_valid_3_w)                                           
	    range_last_r       <=  range_update_3_w                      ;
    else if(bin_valid_2_w)                                           
	    range_last_r       <=  range_update_2_w                      ;
    else if(bin_valid_1_w)                                           
	    range_last_r       <=  range_update_1_w                      ;
	else if(bin_valid_0_w)                                           
	    range_last_r       <=  range_update_0_w                      ;
    else                                                             
		range_last_r       <=  range_last_r                          ;
end  

//instance input signal
assign        bin_valid_0_w        = bae_ctx_pair_0_d1_r[9:8]!=2'b01 ;
assign        bin_mode_0_w         = bae_ctx_pair_0_d1_r[9:7]        ;
 // 1:input unvalid, 0: regular mode,2:bypass mode ,3:terminal mode 

assign        bin_valid_1_w        = bae_ctx_pair_1_d1_r[9:8]!=2'b01 ;
assign        bin_mode_1_w         = bae_ctx_pair_1_d1_r[9:7]        ; 

assign        bin_valid_2_w        = bae_ctx_pair_2_d1_r[9:8]!=2'b01 ;
assign        bin_mode_2_w         = bae_ctx_pair_2_d1_r[9:7]        ; 

assign        bin_valid_3_w        = bae_ctx_pair_3_d1_r[9:8]!=2'b01 ;
assign        bin_mode_3_w         = bae_ctx_pair_3_d1_r[9:7]        ; 

assign        range_0_w            =  range_last_r                   ;
assign        range_1_w            =  range_update_0_w               ;
assign        range_2_w            =  range_update_1_w               ;
assign        range_3_w            =  range_update_2_w               ;

cabac_bae_stage2 u_cabac_bae_stage2_0(
                    // regular mode 
                    .range_lps_lut_i       ( range_lps_lut_0_r      ),
                    .shift_lut_i           ( shift_lut_0_r          ),
                    .range_i               ( range_0_w              ),
					.bin_eq_lps_i          ( bin_eq_lps_0_r         ),
					//mode decision        
					.bin_mode_i            ( bin_mode_0_w           ),
					.range_lps_update_lut_i(range_lps_update_lut_0_r),
					
					.range_update_o        ( range_update_0_w       ),
                    .t_rang_o              ( t_range_0_w            ),
					.bin_neq_mps_o         ( bin_neq_mps_0_w        ),
                    .shift_o               ( shift_0_w              )									  
                );

cabac_bae_stage2 u_cabac_bae_stage2_1(
                    .range_lps_lut_i       ( range_lps_lut_1_r      ),
                    .shift_lut_i           ( shift_lut_1_r          ),
                    .range_i               ( range_1_w              ),
					.bin_eq_lps_i          ( bin_eq_lps_1_r         ),
					.bin_mode_i            ( bin_mode_1_w           ),
					.range_lps_update_lut_i(range_lps_update_lut_1_r),
					
					.range_update_o        ( range_update_1_w       ),
                    .t_rang_o              ( t_range_1_w            ),
					.bin_neq_mps_o         ( bin_neq_mps_1_w        ),
                    .shift_o               ( shift_1_w              )									  
                );
									
cabac_bae_stage2 u_cabac_bae_stage2_2(
                    .range_lps_lut_i       ( range_lps_lut_2_r      ),
                    .shift_lut_i           ( shift_lut_2_r          ),
                    .range_i               ( range_2_w              ),
					.bin_eq_lps_i          ( bin_eq_lps_2_r         ),
					.bin_mode_i            ( bin_mode_2_w           ),
					.range_lps_update_lut_i(range_lps_update_lut_2_r),

					.range_update_o        ( range_update_2_w       ),
                    .t_rang_o              ( t_range_2_w            ),
					.bin_neq_mps_o         ( bin_neq_mps_2_w        ),
                    .shift_o               ( shift_2_w              )									  
                );	

cabac_bae_stage2 u_cabac_bae_stage2_3(
                    .range_lps_lut_i       ( range_lps_lut_3_r      ),
                    .shift_lut_i           ( shift_lut_3_r          ),
                    .range_i               ( range_3_w              ),
					.bin_eq_lps_i          ( bin_eq_lps_3_r         ),
					.bin_mode_i            ( bin_mode_3_w           ),
					.range_lps_update_lut_i(range_lps_update_lut_3_r),

					.range_update_o        ( range_update_3_w       ),
                    .t_rang_o              ( t_range_3_w            ),
					.bin_neq_mps_o         ( bin_neq_mps_3_w        ),
                    .shift_o               ( shift_3_w              )									  
                );										

//output reg 									
always @(posedge clk or negedge rst_n) begin									
    if(!rst_n) begin                                          
        range_update_0_r   <=  9'b0                                  ;
	    t_range_0_r        <=  9'b0                                  ;
	    bin_neq_mps_0_r    <=  1'b0                                  ; 
		bin_eq_lps_0_d1_r  <=  1'b0                                  ;  
		shift_0_r          <=  4'b0                                  ;
		bae_ctx_pair_0_d2_r<=  10'h1ff                               ;
    end	                                                             
	else begin                                                       
        range_update_0_r   <=  range_update_0_w                      ;
	    t_range_0_r        <=  t_range_0_w                           ;
	    bin_neq_mps_0_r    <=  bin_neq_mps_0_w                       ; 
		bin_eq_lps_0_d1_r  <=  bin_eq_lps_0_r                        ;
		shift_0_r          <=  shift_0_w                             ;
		bae_ctx_pair_0_d2_r<=  bae_ctx_pair_0_d1_r                   ;
    end  									                  
end 	                                                      

always @(posedge clk or negedge rst_n) begin		            							
    if(!rst_n) begin                                          
        range_update_1_r   <=  9'b0                           ;
	    t_range_1_r        <=  9'b0                           ;
	    bin_neq_mps_1_r    <=  1'b0                           ; 
		bin_eq_lps_1_d1_r  <=  1'b0                           ;  
		shift_1_r          <=  4'b0                           ;
		bae_ctx_pair_1_d2_r<=  10'h1ff                        ;
    end	                                                      
	else begin                                                
        range_update_1_r   <=  range_update_1_w               ;
	    t_range_1_r        <=  t_range_1_w                    ;
	    bin_neq_mps_1_r    <=  bin_neq_mps_1_w                ; 
		bin_eq_lps_1_d1_r  <=  bin_eq_lps_1_r                 ;
		shift_1_r          <=  shift_1_w                      ;
		bae_ctx_pair_1_d2_r<=  bae_ctx_pair_1_d1_r            ;
    end  									
end 									

always @(posedge clk or negedge rst_n) begin									
    if(!rst_n) begin  
        range_update_2_r   <=  9'b0                           ;
	    t_range_2_r        <=  9'b0                           ;
	    bin_neq_mps_2_r    <=  1'b0                           ; 
		bin_eq_lps_2_d1_r  <=  1'b0                           ;  
		shift_2_r          <=  4'b0                           ;
		bae_ctx_pair_2_d2_r<=  10'h1ff                        ;
    end	                                                      
	else begin                                                
        range_update_2_r   <=  range_update_2_w               ;
	    t_range_2_r        <=  t_range_2_w                    ;
	    bin_neq_mps_2_r    <=  bin_neq_mps_2_w                ; 
		bin_eq_lps_2_d1_r  <=  bin_eq_lps_2_r                 ;
		shift_2_r          <=  shift_2_w                      ;
		bae_ctx_pair_2_d2_r<=  bae_ctx_pair_2_d1_r            ;
    end  									
end 									

always @(posedge clk or negedge rst_n) begin									
    if(!rst_n) begin  
        range_update_3_r   <=  9'b0                           ;
	    t_range_3_r        <=  9'b0                           ;
	    bin_neq_mps_3_r    <=  1'b0                           ; 
		bin_eq_lps_3_d1_r  <=  1'b0                           ;  
		shift_3_r          <=  4'b0                           ;
		bae_ctx_pair_3_d2_r<=  10'h1ff                        ;
    end	                                                      
	else begin                                                
        range_update_3_r   <=  range_update_3_w               ;
	    t_range_3_r        <=  t_range_3_w                    ;
	    bin_neq_mps_3_r    <=  bin_neq_mps_3_w                ; 
		bin_eq_lps_3_d1_r  <=  bin_eq_lps_3_r                 ;
		shift_3_r          <=  shift_3_w                      ;
		bae_ctx_pair_3_d2_r<=  bae_ctx_pair_3_d1_r            ;
    end  									
end 

//-------------------------------------------------------------------------------------------
//
//stage 3 : low update 
//
//-------------------------------------------------------------------------------------------
// instance 0
wire        [ 9:0]    low_0_w                                        ;
wire                  bin_valid_0_d1_w                               ;
wire        [ 9:0]    low_update_0_w                                 ;
wire        [ 2:0]    overflow_bits_num_0_w                          ;
wire        [ 5:0]    overflow_bits_0_w                              ;
wire                  outstanding_flag_0_w                           ;  
// instance 1                                                        
wire        [ 9:0]    low_1_w                                        ;
wire                  bin_valid_1_d1_w                               ;
wire        [ 9:0]    low_update_1_w                                 ;
wire        [ 2:0]    overflow_bits_num_1_w                          ;
wire        [ 5:0]    overflow_bits_1_w                              ;
wire                  outstanding_flag_1_w                           ;  
// instance 2                                                        
wire        [ 9:0]    low_2_w                                        ;
wire                  bin_valid_2_d1_w                               ;
wire        [ 9:0]    low_update_2_w                                 ;
wire        [ 2:0]    overflow_bits_num_2_w                          ;
wire        [ 5:0]    overflow_bits_2_w                              ;
wire                  outstanding_flag_2_w                           ;  

// instance 3                                                        
wire        [ 9:0]    low_3_w                                        ;
wire                  bin_valid_3_d1_w                               ;
wire        [ 9:0]    low_update_3_w                                 ;
wire        [ 2:0]    overflow_bits_num_3_w                          ;
wire        [ 5:0]    overflow_bits_3_w                              ;
wire                  outstanding_flag_3_w                           ;  

// internal signal 
reg                   table_build_end_d2_r                           ;
reg         [9:0]     low_last_r                                     ;

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        table_build_end_d2_r    <=  9'd0                             ;
	else 
        table_build_end_d2_r    <=  table_build_end_d1_r             ;
end 

// low_last_r
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        low_last_r       <=  10'd0                                   ;
	else if(table_build_end_d1_r)                                    
		low_last_r 	     <=  10'd0                                   ;
	else if(bin_valid_3_d1_w)                                        
	    low_last_r       <=  low_update_3_w[9:0]                    ; 
    else if(bin_valid_2_d1_w)                                         
	    low_last_r       <=  low_update_2_w[9:0]                    ;
    else if(bin_valid_1_d1_w)                                         
	    low_last_r       <=  low_update_1_w[9:0]                    ;
	else if(bin_valid_0_d1_w)                                         
	    low_last_r       <=  low_update_0_w[9:0]                    ;
    else                                                             
		low_last_r       <=  low_last_r                              ;
end  

// input signal 
assign      bin_valid_0_d1_w       = bae_ctx_pair_0_d2_r[9:8]!=2'b01 ;
assign      bin_valid_1_d1_w       = bae_ctx_pair_1_d2_r[9:8]!=2'b01 ;
assign      bin_valid_2_d1_w       = bae_ctx_pair_2_d2_r[9:8]!=2'b01 ;
assign      bin_valid_3_d1_w       = bae_ctx_pair_3_d2_r[9:8]!=2'b01 ;
  
assign      low_0_w                = low_last_r                      ;

assign      low_1_w                = low_update_0_w                  ;

assign      low_2_w                = low_update_1_w                  ;
assign      low_3_w                = low_update_2_w                  ;

cabac_bae_stage3 u_cabac_bae_stage3_0(
                                    .low_i                  ( low_0_w               ),
						            .shift_i                ( shift_0_r             ),
						            .t_range_i              ( t_range_0_r           ),
						            .bin_eq_lps_i           ( bin_eq_lps_0_d1_r     ),
                                    .bin_neq_mps_i          ( bin_neq_mps_0_r       ),
									.range_i                ( range_update_0_r      ), 
								    .bae_ctx_pair_i         ( bae_ctx_pair_0_d2_r   ),

						            .low_update_o           ( low_update_0_w        ),
                                    .overflow_bits_num_o    ( overflow_bits_num_0_w ),
									.overflow_bits_o        ( overflow_bits_0_w     ),
                                    .outstanding_flag_o     ( outstanding_flag_0_w  )									
                                );
									
cabac_bae_stage3 u_cabac_bae_stage3_1(
                                    .low_i                  ( low_1_w               ),
						            .shift_i                ( shift_1_r             ),
						            .t_range_i              ( t_range_1_r           ),
						            .bin_eq_lps_i           ( bin_eq_lps_1_d1_r     ),
                                    .bin_neq_mps_i          ( bin_neq_mps_1_r       ),
									.range_i                ( range_update_1_r      ), 
								    .bae_ctx_pair_i         ( bae_ctx_pair_1_d2_r   ),

						            .low_update_o           ( low_update_1_w        ),
                                    .overflow_bits_num_o    ( overflow_bits_num_1_w ),
									.overflow_bits_o        ( overflow_bits_1_w     ),
                                    .outstanding_flag_o     ( outstanding_flag_1_w  )				
				                );									

cabac_bae_stage3 u_cabac_bae_stage3_2(
                                    .low_i                  ( low_2_w               ),
						            .shift_i                ( shift_2_r             ),
						            .t_range_i              ( t_range_2_r           ),
						            .bin_eq_lps_i           ( bin_eq_lps_2_d1_r     ),
                                    .bin_neq_mps_i          ( bin_neq_mps_2_r       ),
									.range_i                ( range_update_2_r      ), 
								    .bae_ctx_pair_i         ( bae_ctx_pair_2_d2_r   ),									

								    .low_update_o           ( low_update_2_w        ),
                                    .overflow_bits_num_o    ( overflow_bits_num_2_w ),
									.overflow_bits_o        ( overflow_bits_2_w     ),
                                    .outstanding_flag_o     ( outstanding_flag_2_w  )									
								);	
									
cabac_bae_stage3 u_cabac_bae_stage3_3(
                                    .low_i                  ( low_3_w               ),
						            .shift_i                ( shift_3_r             ),
						            .t_range_i              ( t_range_3_r           ),
						            .bin_eq_lps_i           ( bin_eq_lps_3_d1_r     ),
                                    .bin_neq_mps_i          ( bin_neq_mps_3_r       ),
									.range_i                ( range_update_3_r      ), 
							        .bae_ctx_pair_i         ( bae_ctx_pair_3_d2_r   ),

									.low_update_o           ( low_update_3_w        ),
								    .overflow_bits_num_o    ( overflow_bits_num_3_w ),
									.overflow_bits_o        ( overflow_bits_3_w     ),
                                    .outstanding_flag_o     ( outstanding_flag_3_w  )	
                                );	
	
// output reg 
reg         [ 2:0]    overflow_bits_num_0_r                          ; // shift num 
reg         [ 2:0]    overflow_bits_num_1_r                          ; // shift num 
reg         [ 2:0]    overflow_bits_num_2_r                          ; // shift num 
reg         [ 2:0]    overflow_bits_num_3_r                          ; // shift num 
reg         [ 5:0]    overflow_bits_0_r                              ; // 
reg         [ 5:0]    overflow_bits_1_r                              ; //
reg         [ 5:0]    overflow_bits_2_r                              ; //
reg         [ 5:0]    overflow_bits_3_r                              ; //

reg                   outstanding_flag_0_r                           ;
reg                   outstanding_flag_1_r                           ;
reg                   outstanding_flag_2_r                           ;
reg                   outstanding_flag_3_r                           ;

reg                   flush_flag_r                                   ;
reg                   flush_flag_d1_r                                ;
reg                   flush_flag_d2_r                                ;
reg                   flush_flag_d3_r                                ;
reg                   flush_flag_d4_r                                ;

reg         [ 2:0]    determinded_bits_num_0_r                       ; //
reg         [ 2:0]    determinded_bits_num_1_r                       ; //
reg         [ 2:0]    determinded_bits_num_2_r                       ; //
reg         [ 2:0]    determinded_bits_num_3_r                       ; // 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        overflow_bits_num_0_r  <=  3'd0                              ;
        overflow_bits_num_1_r  <=  3'd0                              ;
	    overflow_bits_num_2_r  <=  3'd0                              ;
	    overflow_bits_num_3_r  <=  3'd0                              ;	

		overflow_bits_0_r      <=  6'd0                              ;
		overflow_bits_1_r      <=  6'd0                              ;
		overflow_bits_2_r      <=  6'd0                              ;
		overflow_bits_3_r      <=  6'd0                              ;

	    outstanding_flag_0_r   <=  1'd0                              ;
	    outstanding_flag_1_r   <=  1'd0                              ;
	    outstanding_flag_2_r   <=  1'd0                              ;
	    outstanding_flag_3_r   <=  1'd0                              ;
    end                                                              
	else begin                                                       
	    overflow_bits_num_0_r  <=  overflow_bits_num_0_w             ;
	    overflow_bits_num_1_r  <=  overflow_bits_num_1_w             ;
	    overflow_bits_num_2_r  <=  overflow_bits_num_2_w             ;
	    overflow_bits_num_3_r  <=  overflow_bits_num_3_w             ;
		
		overflow_bits_0_r      <=  overflow_bits_0_w &((6'b1<<overflow_bits_num_0_w)-1'b1) ;
		overflow_bits_1_r      <=  overflow_bits_1_w &((6'b1<<overflow_bits_num_1_w)-1'b1) ;
		overflow_bits_2_r      <=  overflow_bits_2_w &((6'b1<<overflow_bits_num_2_w)-1'b1) ;
		overflow_bits_3_r      <=  overflow_bits_3_w &((6'b1<<overflow_bits_num_3_w)-1'b1) ;
		
	    outstanding_flag_0_r   <=  outstanding_flag_0_w              ;
	    outstanding_flag_1_r   <=  outstanding_flag_1_w              ;
	    outstanding_flag_2_r   <=  outstanding_flag_2_w              ;
	    outstanding_flag_3_r   <=  outstanding_flag_3_w              ;
	end                            
end 

// flush_flag_r 
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        flush_flag_r   <=      1'b0                           ;
	else if(bae_ctx_pair_0_d2_r[9:7]==3'b111)
        flush_flag_r   <=      1'b1                           ;
    else
	    flush_flag_r   <=      1'b0                           ;
end 

// flush_flag_d1_r 
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        flush_flag_d1_r  <=  1'b0           ;
        flush_flag_d2_r  <=  1'b0           ;
        flush_flag_d3_r  <=  1'b0           ;
        flush_flag_d4_r  <=  1'b0           ;
	end 
    else begin  
	    flush_flag_d1_r  <=  flush_flag_r   ;
	    flush_flag_d2_r  <=  flush_flag_d1_r;
	    flush_flag_d3_r  <=  flush_flag_d2_r;
	    flush_flag_d4_r  <=  flush_flag_d3_r;
	end 
end 

// determinded_bits_num_0_r
always@(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        determinded_bits_num_0_r        <=       3'd0         ;
    else  begin 
	    case(overflow_bits_num_0_w)
            3'd1 :  determinded_bits_num_0_r <=  3'd0         ;
			3'd2 :  begin 
	                if(!overflow_bits_0_w[0])
	                    determinded_bits_num_0_r <= 3'd1      ;
	                else 
					    determinded_bits_num_0_r <= 3'd0      ;
	        end 
	        3'd3 :  begin 
	                if(!overflow_bits_0_w[0])
	                    determinded_bits_num_0_r <= 3'd2      ;
	                else if(!overflow_bits_0_w[1])
					    determinded_bits_num_0_r <= 3'd1      ;
					else 
					    determinded_bits_num_0_r <= 3'd0      ;
	        end 
			3'd4 :  begin 
	                if(!overflow_bits_0_w[0])
	                    determinded_bits_num_0_r <= 3'd3      ;
	                else if(!overflow_bits_0_w[1])
					    determinded_bits_num_0_r <= 3'd2      ;
					else if(!overflow_bits_0_w[2])
					    determinded_bits_num_0_r <= 3'd1      ;
					else 
					    determinded_bits_num_0_r <= 3'd0      ;
	        end  
	        3'd5 :  begin 
	                if(!overflow_bits_0_w[0])
	                    determinded_bits_num_0_r <= 3'd4      ;
	                else if(!overflow_bits_0_w[1])
					    determinded_bits_num_0_r <= 3'd3      ;
					else if(!overflow_bits_0_w[2])
					    determinded_bits_num_0_r <= 3'd2      ;
					else if(!overflow_bits_0_w[3])
					    determinded_bits_num_0_r <= 3'd1      ;
					else 
					    determinded_bits_num_0_r <= 3'd0      ;
	        end 
	        3'd6 :  begin 
	                if(!overflow_bits_0_w[0])
	                    determinded_bits_num_0_r <= 3'd5      ;
	                else if(!overflow_bits_0_w[1])
					    determinded_bits_num_0_r <= 3'd4      ;
					else if(!overflow_bits_0_w[2])
					    determinded_bits_num_0_r <= 3'd3      ;
					else if(!overflow_bits_0_w[3])
					    determinded_bits_num_0_r <= 3'd2      ;
					else if(!overflow_bits_0_w[4])
					    determinded_bits_num_0_r <= 3'd1      ;	
					else 
					    determinded_bits_num_0_r <= 3'd0      ;
	        end 
	        default:  determinded_bits_num_0_r <=  3'd0       ;
        endcase 
    end 
end 

// determinded_bits_num_1_r
always@(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        determinded_bits_num_1_r        <=       3'd0         ;
    else  begin 
	    case(overflow_bits_num_1_w)
            3'd1 :  determinded_bits_num_1_r <=  3'd0         ;
			3'd2 :  begin 
	                if(!overflow_bits_1_w[0])
	                    determinded_bits_num_1_r <= 3'd1      ;
	                else 
					    determinded_bits_num_1_r <= 3'd0      ;
	        end 
	        3'd3 :  begin 
	                if(!overflow_bits_1_w[0])
	                    determinded_bits_num_1_r <= 3'd2      ;
	                else if(!overflow_bits_1_w[1])
					    determinded_bits_num_1_r <= 3'd1      ;
					else 
					    determinded_bits_num_1_r <= 3'd0      ;
	        end 
			3'd4 :  begin 
	                if(!overflow_bits_1_w[0])
	                    determinded_bits_num_1_r <= 3'd3      ;
	                else if(!overflow_bits_1_w[1])
					    determinded_bits_num_1_r <= 3'd2      ;
					else if(!overflow_bits_1_w[2])
					    determinded_bits_num_1_r <= 3'd1      ;
					else 
					    determinded_bits_num_1_r <= 3'd0      ;
	        end  
	        3'd5 :  begin 
	                if(!overflow_bits_1_w[0])
	                    determinded_bits_num_1_r <= 3'd4      ;
	                else if(!overflow_bits_1_w[1])
					    determinded_bits_num_1_r <= 3'd3      ;
					else if(!overflow_bits_1_w[2])
					    determinded_bits_num_1_r <= 3'd2      ;
					else if(!overflow_bits_1_w[3])
					    determinded_bits_num_1_r <= 3'd1      ;
					else 
					    determinded_bits_num_1_r <= 3'd0      ;
	        end 
	        3'd6 :  begin 
	                if(!overflow_bits_1_w[0])
	                    determinded_bits_num_1_r <= 3'd5      ;
	                else if(!overflow_bits_1_w[1])
					    determinded_bits_num_1_r <= 3'd4      ;
					else if(!overflow_bits_1_w[2])
					    determinded_bits_num_1_r <= 3'd3      ;
					else if(!overflow_bits_1_w[3])
					    determinded_bits_num_1_r <= 3'd2      ;
					else if(!overflow_bits_1_w[4])
					    determinded_bits_num_1_r <= 3'd1      ;	
					else 
					    determinded_bits_num_1_r <= 3'd0      ;
	        end 
	        default:  determinded_bits_num_1_r <=  3'd0       ;
        endcase 
    end 
end 

// determinded_bits_num_2_r
always@(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        determinded_bits_num_2_r        <=       3'd0         ;
    else  begin 
	    case(overflow_bits_num_2_w)
            3'd1 :  determinded_bits_num_2_r <=  3'd0         ;
			3'd2 :  begin 
	                if(!overflow_bits_2_w[0])
	                    determinded_bits_num_2_r <= 3'd1      ;
	                else 
					    determinded_bits_num_2_r <= 3'd0      ;
	        end 
	        3'd3 :  begin 
	                if(!overflow_bits_2_w[0])
	                    determinded_bits_num_2_r <= 3'd2      ;
	                else if(!overflow_bits_2_w[1])
					    determinded_bits_num_2_r <= 3'd1      ;
					else 
					    determinded_bits_num_2_r <= 3'd0      ;
	        end 
			3'd4 :  begin 
	                if(!overflow_bits_2_w[0])
	                    determinded_bits_num_2_r <= 3'd3      ;
	                else if(!overflow_bits_2_w[1])
					    determinded_bits_num_2_r <= 3'd2      ;
					else if(!overflow_bits_2_w[2])
					    determinded_bits_num_2_r <= 3'd1      ;
					else 
					    determinded_bits_num_2_r <= 3'd0      ;
	        end  
	        3'd5 :  begin 
	                if(!overflow_bits_2_w[0])
	                    determinded_bits_num_2_r <= 3'd4      ;
	                else if(!overflow_bits_2_w[1])
					    determinded_bits_num_2_r <= 3'd3      ;
					else if(!overflow_bits_2_w[2])
					    determinded_bits_num_2_r <= 3'd2      ;
					else if(!overflow_bits_2_w[3])
					    determinded_bits_num_2_r <= 3'd1      ;
					else 
					    determinded_bits_num_2_r <= 3'd0      ;
	        end 
	        3'd6 :  begin 
	                if(!overflow_bits_2_w[0])
	                    determinded_bits_num_2_r <= 3'd5      ;
	                else if(!overflow_bits_2_w[1])
					    determinded_bits_num_2_r <= 3'd4      ;
					else if(!overflow_bits_2_w[2])
					    determinded_bits_num_2_r <= 3'd3      ;
					else if(!overflow_bits_2_w[3])
					    determinded_bits_num_2_r <= 3'd2      ;
					else if(!overflow_bits_2_w[4])
					    determinded_bits_num_2_r <= 3'd1      ;	
					else 
					    determinded_bits_num_2_r <= 3'd0      ;
	        end 
	        default:  determinded_bits_num_2_r <=  3'd0       ;
        endcase 
    end 
end 

// determinded_bits_num_3_r
always@(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        determinded_bits_num_3_r        <=       3'd0         ;
    else  begin 
	    case(overflow_bits_num_3_w)
            3'd1 :  determinded_bits_num_3_r <=  3'd0         ;
			3'd2 :  begin 
	                if(!overflow_bits_3_w[0])
	                    determinded_bits_num_3_r <= 3'd1      ;
	                else 
					    determinded_bits_num_3_r <= 3'd0      ;
	        end 
	        3'd3 :  begin 
	                if(!overflow_bits_3_w[0])
	                    determinded_bits_num_3_r <= 3'd2      ;
	                else if(!overflow_bits_3_w[1])
					    determinded_bits_num_3_r <= 3'd1      ;
					else 
					    determinded_bits_num_3_r <= 3'd0      ;
	        end 
			3'd4 :  begin 
	                if(!overflow_bits_3_w[0])
	                    determinded_bits_num_3_r <= 3'd3      ;
	                else if(!overflow_bits_3_w[1])
					    determinded_bits_num_3_r <= 3'd2      ;
					else if(!overflow_bits_3_w[2])
					    determinded_bits_num_3_r <= 3'd1      ;
					else 
					    determinded_bits_num_3_r <= 3'd0      ;
	        end  
	        3'd5 :  begin 
	                if(!overflow_bits_3_w[0])
	                    determinded_bits_num_3_r <= 3'd4      ;
	                else if(!overflow_bits_3_w[1])
					    determinded_bits_num_3_r <= 3'd3      ;
					else if(!overflow_bits_3_w[2])
					    determinded_bits_num_3_r <= 3'd2      ;
					else if(!overflow_bits_3_w[3])
					    determinded_bits_num_3_r <= 3'd1      ;
					else 
					    determinded_bits_num_3_r <= 3'd0      ;
	        end 
	        3'd6 :  begin 
	                if(!overflow_bits_3_w[0])
	                    determinded_bits_num_3_r <= 3'd5      ;
	                else if(!overflow_bits_3_w[1])
					    determinded_bits_num_3_r <= 3'd4      ;
					else if(!overflow_bits_3_w[2])
					    determinded_bits_num_3_r <= 3'd3      ;
					else if(!overflow_bits_3_w[3])
					    determinded_bits_num_3_r <= 3'd2      ;
					else if(!overflow_bits_3_w[4])
					    determinded_bits_num_3_r <= 3'd1      ;	
					else 
					    determinded_bits_num_3_r <= 3'd0      ;
	        end 
	        default:  determinded_bits_num_3_r <=  3'd0       ;
        endcase 
    end 
end 


//-------------------------------------------------------------------------------------------
//
//stage 4 : bits generation  
//
//-------------------------------------------------------------------------------------------

reg                   table_build_end_d3_r                           ;

// table_build_end_d3_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        table_build_end_d3_r    <=  9'd0                             ;
	else 
        table_build_end_d3_r    <=  table_build_end_d2_r             ;
end 

wire                  contain_0_flag_0_w                             ;
wire                  contain_0_flag_1_w                             ;
wire                  contain_0_flag_2_w                             ;
wire                  contain_0_flag_3_w                             ;

reg		[63:0]		  total_determined_bits_r	                     ;
reg		[ 5:0]		  total_determined_bits_num_r                    ;
reg		[ 5:0]		  total_determined_bits_num_d1_r                 ;
reg		[63:0]		  total_overflow_bits_r			                 ;
reg		[ 5:0]		  total_overflow_bits_num_r		                 ;
wire    [31:0]        overflow_bits_0123_w                           ;
wire    [20:0]        outstanding_bits_w                             ;

wire    [ 5:0]		  total_determined_bits_num_d1_w                 ;
wire    [ 5:0]        overflow_bits_num_01_w                         ;
wire    [ 5:0]        overflow_bits_num_012_w                        ;
wire    [ 5:0]        overflow_bits_num_0123_w                       ;
wire    [ 5:0]        overflow_bits_num_123_w                        ;
wire    [ 5:0]        overflow_bits_num_23_w                         ;

wire                  first_bit_flag_dw                              ;
reg                   first_bit_flag_d4_r                            ;
reg                   first_bit_flag_d5_r                            ;
reg                   first_bit_flag_d6_r                            ;
reg                   first_bit_flag_d7_r                            ;
reg                   first_bit_flag_d8_r                            ;

assign first_bit_flag_dw   = table_build_end_d3_r & (!table_build_end_d2_r)  ; 

wire                  first_bit_flag_w                               ;
reg                   first_bit_flag_d1_r                            ;
reg                   first_bit_flag_d2_r                            ;
wire                  first_bit_flag_valid_w                         ;

assign  first_bit_flag_w = overflow_bits_num_0_w ||overflow_bits_num_1_w||overflow_bits_num_2_w||overflow_bits_num_3_w;

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        first_bit_flag_d1_r  <=  1'b0     ;
    else if(table_build_end_d1_r)
        first_bit_flag_d1_r  <=  1'b0     ;
	else if(!first_bit_flag_d1_r&&first_bit_flag_w)
	    first_bit_flag_d1_r  <=  1'b1     ;
end 

always@(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        first_bit_flag_d2_r  <=  1'b0                  ;
	else 
        first_bit_flag_d2_r  <=  first_bit_flag_d1_r   ;
end 

assign  first_bit_flag_valid_w  =  first_bit_flag_d1_r && !first_bit_flag_d2_r;







always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        first_bit_flag_d4_r   <=   1'b0                              ;       
        first_bit_flag_d5_r   <=   1'b0                              ;
        first_bit_flag_d6_r   <=   1'b0                              ;
        first_bit_flag_d7_r   <=   1'b0                              ;
        first_bit_flag_d8_r   <=   1'b0                              ;
    end                                                              
	else begin                                                       
        first_bit_flag_d4_r   <=   first_bit_flag_dw                 ;
        first_bit_flag_d5_r   <=   first_bit_flag_d4_r               ;
        first_bit_flag_d6_r   <=   first_bit_flag_d5_r               ;
        first_bit_flag_d7_r   <=   first_bit_flag_d6_r               ;
        first_bit_flag_d8_r   <=   first_bit_flag_d7_r               ;
    end 
end 

assign contain_0_flag_0_w = ((((6'b1<<overflow_bits_num_0_r)-1'b1) & overflow_bits_0_r)!=((6'b1<<overflow_bits_num_0_r)-1'b1))&&(!first_bit_flag_valid_w);
assign contain_0_flag_1_w = ((((6'b1<<overflow_bits_num_1_r)-1'b1) & overflow_bits_1_r)!=((6'b1<<overflow_bits_num_1_r)-1'b1));
assign contain_0_flag_2_w = ((((6'b1<<overflow_bits_num_2_r)-1'b1) & overflow_bits_2_r)!=((6'b1<<overflow_bits_num_2_r)-1'b1));
assign contain_0_flag_3_w = ((((6'b1<<overflow_bits_num_3_r)-1'b1) & overflow_bits_3_r)!=((6'b1<<overflow_bits_num_3_r)-1'b1));

assign overflow_bits_num_01_w  = overflow_bits_num_0_r   + overflow_bits_num_1_r      ;
assign overflow_bits_num_012_w = overflow_bits_num_01_w  + overflow_bits_num_2_r      ;
assign overflow_bits_num_0123_w= overflow_bits_num_012_w + overflow_bits_num_3_r      ;

assign overflow_bits_num_123_w = overflow_bits_num_1_r + overflow_bits_num_23_w       ;
assign overflow_bits_num_23_w  = overflow_bits_num_2_r + overflow_bits_num_3_r        ;

// total_determined_bits_num_r  
always @* begin
    if(flush_flag_r)
        total_determined_bits_num_r  =  total_overflow_bits_num_r + 4'd10             ;
    else if(contain_0_flag_3_w)
        total_determined_bits_num_r  =  total_overflow_bits_num_r + determinded_bits_num_3_r + overflow_bits_num_012_w - first_bit_flag_valid_w  ;
    else if(contain_0_flag_2_w)
        total_determined_bits_num_r  =  total_overflow_bits_num_r + determinded_bits_num_2_r + overflow_bits_num_01_w  - first_bit_flag_valid_w  ;
    else if(contain_0_flag_1_w)
        total_determined_bits_num_r  =  total_overflow_bits_num_r + determinded_bits_num_1_r + overflow_bits_num_0_r   - first_bit_flag_valid_w  ;
    else if(contain_0_flag_0_w)
        total_determined_bits_num_r  =  total_overflow_bits_num_r + determinded_bits_num_0_r - first_bit_flag_valid_w                            ;
    else 
        total_determined_bits_num_r  =  6'd0                                                                             ;
end 

// total_determined_bits_num_d1_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        total_determined_bits_num_d1_r   <=  6'd0                            ;
    else 
        total_determined_bits_num_d1_r   <=  total_determined_bits_num_r     ;
end 


// total_determined_bits_r
always @* begin 
    if(flush_flag_d1_r)
        total_determined_bits_r  =  total_overflow_bits_r&( (6'd1<<total_overflow_bits_num_r)-1'd1);
    else 
        total_determined_bits_r  =  (total_overflow_bits_r>>total_overflow_bits_num_r) & ( (64'd1<<total_determined_bits_num_d1_r)-1'd1) ;
end 

// total_overflow_bits_num_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        total_overflow_bits_num_r  <=  6'd0      ;
		total_overflow_bits_r      <=  64'd0     ;
	end 
	else if(table_build_end_d3_r) begin 
        total_overflow_bits_num_r  <=  6'd0      ;
		total_overflow_bits_r      <=  64'd0     ;
	end else if(flush_flag_d1_r) begin  
        total_overflow_bits_num_r  <=  6'd0      ;
		total_overflow_bits_r      <=  64'd0     ;
	end 
	else if(flush_flag_r) begin  
        total_overflow_bits_num_r  <=   total_overflow_bits_num_r + 4'd10            ;
		total_overflow_bits_r      <=  ((total_overflow_bits_r+outstanding_flag_0_r)<<4'd10) +  low_last_r  ;
	end 
    else begin  
        total_overflow_bits_num_r  <=  total_overflow_bits_num_r + overflow_bits_num_0123_w - total_determined_bits_num_r -first_bit_flag_valid_w ;
		total_overflow_bits_r      <=  (total_overflow_bits_r<<(overflow_bits_num_0123_w-first_bit_flag_valid_w)) + overflow_bits_0123_w + outstanding_bits_w           ;
	end 
end  

// overflow_bits_0123_w
assign  overflow_bits_0123_w =   (overflow_bits_0_r  << overflow_bits_num_123_w  )
                               + (overflow_bits_1_r  << overflow_bits_num_23_w   )
							   + (overflow_bits_2_r  << overflow_bits_num_3_r    )
                               + (overflow_bits_3_r                              );
  
// outstanding_bits_w 
assign  outstanding_bits_w   =  (outstanding_flag_0_r << overflow_bits_num_0123_w)
                              + (outstanding_flag_1_r << overflow_bits_num_123_w ) 
							  + (outstanding_flag_2_r << overflow_bits_num_23_w  )
                              + (outstanding_flag_3_r << overflow_bits_num_3_r   );
							 
reg     [ 2:0]        bit_align_num_r                            ;
reg		[ 6:0]	      bit_pack_buf_num_r      	   	             ;
reg		[ 6:0]	      bit_pack_buf_num_d1_r      	   	         ;
reg		[63:0]	      bit_pack_buf_r			   	             ;

reg                   output_byte_en_r                           ;
reg     [7:0 ]        output_byte_r                              ;

// bit_align_num_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
	    bit_align_num_r  <=    3'd0                              ;
    else if(flush_flag_d1_r)
        bit_align_num_r  <=   (4'd8-bit_pack_buf_num_r[2:0])     ;
    else if(flush_flag_d2_r)
	    bit_align_num_r  <=   bit_align_num_r                    ;
	else 
        bit_align_num_r  <=   3'd0                               ;
end 

// bit_pack_buf_num_r
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		bit_pack_buf_num_r <= 7'd0                 ;
	else if(flush_flag_d2_r)	
	        bit_pack_buf_num_r <= bit_pack_buf_num_r + bit_align_num_r                    ;
    else if(flush_flag_d3_r)			
			bit_pack_buf_num_r <= bit_pack_buf_num_r                                      ;
	else if(bit_pack_buf_num_r[6:3])
			bit_pack_buf_num_r <= bit_pack_buf_num_r + total_determined_bits_num_r - 4'd8 ;
	else
			bit_pack_buf_num_r <= bit_pack_buf_num_r + total_determined_bits_num_r        ;
end							  

// bit_pack_buf_num_d1_r
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        bit_pack_buf_num_d1_r   <=    7'd0                    ;
    else 
	    bit_pack_buf_num_d1_r   <=     bit_pack_buf_num_r     ;
end 

 // bit_pack_buf_r
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		bit_pack_buf_r <= 64'd0;
	else if(flush_flag_d3_r)
	        bit_pack_buf_r <= (bit_pack_buf_r<<bit_align_num_r)+((!bit_pack_buf_r[0])<<bit_align_num_r);
	else if(total_determined_bits_num_d1_r)
			bit_pack_buf_r <= (bit_pack_buf_r << total_determined_bits_num_d1_r) + total_determined_bits_r;
end

always @* begin
    if(flush_flag_d4_r||flush_flag_d3_r)
	    output_byte_en_r = 1'b0 ;
    else if(bit_pack_buf_num_d1_r[6:3])
		output_byte_en_r = 1'b1 ; 
	else
		output_byte_en_r = 1'b0 ;
end

always @* begin
	if(output_byte_en_r)
		output_byte_r = (bit_pack_buf_r >> (bit_pack_buf_num_d1_r-4'd8));
	else
		output_byte_r = 8'd0                                            ;
end


//-------------------------------------------------------------------------------------------
//
//stage 5: output 
//
//-------------------------------------------------------------------------------------------


assign  bae_output_byte_o   =   output_byte_r     ;
assign  output_byte_en_o    =   output_byte_en_r  ;


























endmodule 
