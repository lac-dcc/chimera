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
// Filename       : db_top.v
// Author         : Chewein
// Created        : 2014-04-18
// Description    : TOP module of Deblocking Filter 
//-------------------------------------------------------------------
`include "enc_defines.v"

module db_top(
				clk					,
				rst_n				,
				mb_x_total_i		,
				mb_y_total_i		,
				mb_x_i				,
				mb_y_i				,
				qp_i				,
				start_i				,
				done_o				,
				
				mb_type_i			,
				mb_partition_i	    ,
				mb_p_pu_mode_i      ,
				mb_cbf_i		    ,
				mb_cbf_u_i			,
				mb_cbf_v_i			,
				
				mb_mv_ren_o	    	,
				mb_mv_raddr_o	    ,
				mb_mv_rdata_i	    ,
								
				tq_ren_o			,
				tq_raddr_o			,
				tq_rdata_i			,
				
				tq_ori_data_i       ,
				
				mb_db_en_o			,
				mb_db_rw_o			,
				mb_db_addr_o		,	
				mb_db_data_o        ,
				
				db_wen_o 	        ,
				db_w4x4_x_o 	    ,
				db_w4x4_y_o 	    ,
				db_wprevious_o      ,
				db_wdone_o          ,
				db_wsel_o           ,
				db_wdata_o 	        ,
				
				mb_db_ren_o         ,
				mb_db_r4x4_o        ,
				mb_db_ridx_o        ,
				mb_db_data_i		
					
);

// *********************************************************************
//                                             
//    Parameter DECLARATION                     
//                                             
// *********************************************************************
parameter  DATA_WIDTH  = 128	;
parameter IDLE   = 3'b000, LOAD  = 3'b001, YVER  = 3'b011,YHOR	=3'b010;
parameter CVER   = 3'b110, CHOR  = 3'b111, OUTLT = 3'b101,OUT   =3'b100;

// *********************************************************************
//                                             
//    INPUT / OUTPUT DECLARATION               
//                                             
// *********************************************************************
input							clk				;//clock
input							rst_n			;//reset signal   
// CTRL IF                      
input [`PIC_X_WIDTH-1:0] 		mb_x_total_i 	;// Total LCU number-1 in X ,PIC_X_WIDTH = 8
input [`PIC_Y_WIDTH-1:0]  		mb_y_total_i 	;// Total LCU number-1 in y ,PIC_Y_WIDTH = 8
input [`PIC_X_WIDTH-1:0] 		mb_x_i 			;// Current LCU in X
input [`PIC_Y_WIDTH-1:0]  		mb_y_i 			;// Current LCU in y
input [5:0]						qp_i 			;// QP 
input							start_i			;// cabac start
output 							done_o 			;// cabac done
// Intra/Inter IF
input							mb_type_i		;// 1: I MB, 0: P/B MB 
input [20:0]					mb_partition_i	;// CU partition mode,0:not split,1:split,[0] for 64x64
input [41:0]					mb_p_pu_mode_i  ;// Inter PU partition mode for every CU size  
input [255:0]					mb_cbf_i        ;// cbf for every 4x4 cu in zig-zag scan order 
input [255:0]					mb_cbf_u_i      ;// cbf for every 4x4 cu in zig-zag scan order 
input [255:0]					mb_cbf_v_i      ;// cbf for every 4x4 cu in zig-zag scan order 

// MV RAM IF
output							mb_mv_ren_o		; // Inter MVD MEM IF
output [6:0]					mb_mv_raddr_o	; // CU_DEPTH  = 3,each 8x8 cu,include mv top,0-63:lcu
input  [`FMV_WIDTH*2-1:0]		mb_mv_rdata_i	; // FMV_WIDTH = 10
// TQ IF  rec data of current LCU                      	
output 							tq_ren_o		; // tq read enable
output [8:0]					tq_raddr_o		; // tq read address
input  [4*32-1:0] 				tq_rdata_i		; // tq read data of an 4x4cu ,COEFF_WIDTH  =  4

input [DATA_WIDTH-1:0]          tq_ori_data_i   ; //tq read data of original pixels 
// MB  deblocking pixel IF :write pixels 
output 							mb_db_en_o		; // db pixel RW enable
output 		 					mb_db_rw_o		; // db pixel read/write 0: read, 1: write
output [8:0]					mb_db_addr_o	; // db address
output [DATA_WIDTH-1:0]         mb_db_data_o	; // db pixel 	

output 	 [1-1:0] 	            db_wen_o 	    ;// db write enable 
output 	 [5-1:0] 	            db_w4x4_x_o 	;// db write 4x4 block index in x 
output 	 [5-1:0] 	            db_w4x4_y_o 	;// db write 4x4 block index in y 
output   [1-1:0]                db_wprevious_o  ;// db write previous lcu data , 1: previous,0:current 
output   [1-1:0]                db_wdone_o      ;// db write previous lcu done
output   [2-1:0]                db_wsel_o       ;// db write 4x4 block sel : 0x:luma, 10: u, 11:v
output 	 [DATA_WIDTH-1:0] 	    db_wdata_o 	    ;// db write 4x4 block data 

// MB deblocking pixel IF :read top 
output					        mb_db_ren_o     ; // read top pixels enable
output [5-1:0]   		        mb_db_r4x4_o    ; // the index x 
output [2-1:0]			        mb_db_ridx_o    ; // the index y
input  [DATA_WIDTH-1:0]         mb_db_data_i	; // db pixel 		

reg    [DATA_WIDTH-1:0]         mb_db_data_o	; // db pixel 	
reg    [DATA_WIDTH-1:0] 	    db_wdata_o 	    ;// db write 4x4 block data 
 
// *********************************************************************
//                                             
//    Register DECLARATION                         
//                                             
// *********************************************************************


// *********************************************************************
//                                             
//    Wire DECLARATION                         
//                                             
// *********************************************************************
wire                       op_enable_w          ; // original pixel enable
wire                       oq_enable_w          ; // original pixel enable
wire [DATA_WIDTH-1:0]      op_w  				; // original pixels
wire [DATA_WIDTH-1:0]      oq_w  				; // original pixels
wire [DATA_WIDTH-1:0]      f_p_w				; // filtered p
wire [DATA_WIDTH-1:0]      f_q_w				; // filtered q
wire [DATA_WIDTH-1:0]      p_w					; // pixels before deblocking 
wire [DATA_WIDTH-1:0]      q_w					; // pixels before deblocking 


wire 					   tu_edge_w			;
wire                       pu_edge_w			;
wire [ 5:0]				   qp_p_w				;
wire [ 5:0]				   qp_q_w				;
wire       				   cbf_p_w 				;
wire       				   cbf_q_w 				;
wire [`FMV_WIDTH*2-1:0]    mv_p_w  				;
wire [`FMV_WIDTH*2-1:0]    mv_q_w  				;

wire                       is_ver_w				;
wire                       is_luma_w            ;
wire                       is_tran_w            ;
wire                       sao_data_end_w       ;

wire [ 1:0]				   bs_w					;
wire [ 8:0]  			   cnt_w				;
wire [ 2:0]  			   state_w				;

// sao signals 
wire [16:0]                sao_curr_w           ;
reg  [16:0]                sao_curr_r           ;
reg  [16:0]                sao_left_r           ;
reg  [16:0]                sao_top_r            ;
reg  [16:0]                sao_tl_r             ;
reg  [16:0]                sao_add_r            ;

reg                        sao_left_valid_r     ;
reg                        sao_top_valid_r      ;
reg                        sao_tl_valid_r       ;
reg                        sao_curr_valid_r     ;

reg                        sao_oen_r            ;
reg                        sao_wen_r            ;
wire [`PIC_X_WIDTH-1:0]    sao_addr_w           ;
wire [16:0]                sao_data_w           ;

wire [DATA_WIDTH-1:0]      mb_db_data_w	        ; // db pixel 
wire [DATA_WIDTH-1:0]      db_wdata_w	        ; // db pixel 

// *********************************************************************
//                                             
//    Logic DECLARATION                         
//                                             
// *********************************************************************
db_controller ucontro(
					   .clk	     	(clk            ),
					   .rst_n  	 	(rst_n          ),
					   .start_i	 	(start_i        ),
					   //output			                   
					   .done_o 	 	(done_o  	    ),
					   .cnt_r	 	(cnt_w	        ),
                       .state	 	(state_w	    )
					);

db_ram_contro uram(
						//input
					   .clk	   		  ( clk          ),
					   .rst_n  		  ( rst_n        ),
					   .start_i		  ( start_i      ),
					   .cnt_i	 	  ( cnt_w	     ),
					   .state_i	 	  ( state_w	     ),
					   .mb_x_i        ( mb_x_i       ),
					   .mb_y_i        ( mb_y_i       ),
					   .mb_x_total_i  ( mb_x_total_i ),
					   .f_p_i		  ( f_p_w	     ),
					   .f_q_i		  ( f_q_w	     ),
					   //output		  
                       .op_enable_o   (op_enable_w   ),			 		   
                       .oq_enable_o	  (oq_enable_w   ),				   
				       .op_o          (op_w          ),
				       .oq_o          (oq_w          ),
					   .p_o			  (p_w		     ),	
					   .q_o			  (q_w		     ),	
					   .tq_ren_o      (tq_ren_o      ),
					   .tq_raddr_o    (tq_raddr_o    ),
					   .tq_rdata_i    (tq_rdata_i	 ),
					   .tq_ori_data_i (tq_ori_data_i ),
					   
					   .mb_db_en_o	  (mb_db_en_o    ),
					   .mb_db_rw_o	  (mb_db_rw_o    ),
					   .mb_db_addr_o  (mb_db_addr_o  ),
					   .mb_db_data_o  (mb_db_data_w  ),
					   
					   .db_wen_o 	  (db_wen_o 	 ), 
					   .db_w4x4_x_o   (db_w4x4_x_o   ),
					   .db_w4x4_y_o   (db_w4x4_y_o   ),
					   .db_wprevious_o(db_wprevious_o),
					   .db_wdone_o    (db_wdone_o    ),
					   .db_wsel_o     (db_wsel_o     ),
					   .db_wdata_o 	  (db_wdata_w 	 ),			   
					   
					   .mb_db_ren_o   (mb_db_ren_o   ),
					   .mb_db_r4x4_o  (mb_db_r4x4_o  ),
					   .mb_db_ridx_o  (mb_db_ridx_o  ),
					   .mb_db_data_i  (mb_db_data_i  ),			   
					   

					   .is_ver_o	  (is_ver_w		 ),
					   .is_luma_o     (is_luma_w     ),
					   .sao_data_end_o(sao_data_end_w)
					);

db_bs  		ubs  (  
						//input
					   .clk			  (clk			 ),
                       .rst_n		  (rst_n		 ),
					   .cnt_i	      (cnt_w		 ),
					   .state_i	      (state_w		 ),
			           .mb_x_total_i  (mb_x_total_i  ),	 	
					   .mb_y_total_i  (mb_y_total_i  ),	 	
					   .mb_x_i 	      (mb_x_i 	     ),			
					   .mb_y_i 	      (mb_y_i 	     ),	 		
					   	
					   .mb_partition_i(mb_partition_i),
					   .mb_p_pu_mode_i(mb_p_pu_mode_i),
					   .mb_cbf_i      (mb_cbf_i    	 ),
					   .mb_cbf_u_i    (mb_cbf_u_i    ),
					   .mb_cbf_v_i    (mb_cbf_v_i    ),

					   .qp_i 		  (qp_i 		 ),				   
					   //output
					   .tu_edge_o	  (tu_edge_w	 ),
					   .pu_edge_o     (pu_edge_w     ),
					   .qp_p_o	      (qp_p_w		 ),
					   .qp_q_o	      (qp_q_w		 ),
					   .cbf_p_o       (cbf_p_w       ),
					   .cbf_q_o       (cbf_q_w       ),
					   .is_tran_o     (is_tran_w	 )
					);

db_mv  		 udbmv(
						.clk		  (clk			  ),
						.rst_n		  (rst_n		  ),	
						.cnt_i	      (cnt_w		  ),
						.state_i	  (state_w		  ),			   
						.mb_x_total_i (mb_x_total_i   ),		
						.mb_y_total_i (mb_y_total_i   ),		
						.mb_x_i 	  (mb_x_i 	      ),		
						.mb_y_i 	  (mb_y_i 	      ),		

					    .mb_mv_ren_o  (mb_mv_ren_o	  ),
					    .mb_mv_raddr_o(mb_mv_raddr_o  ),
			            .mb_mv_rdata_i(mb_mv_rdata_i  ),
			   
					    .mv_p_o       (mv_p_w         ),
					    .mv_q_o       (mv_q_w         )
);
	
db_pipeline  udbf(
					//input
					   .clk		      (clk			  ),
					   .rst_n	      (rst_n		  ),
					   .tu_edge_i	  (tu_edge_w	  ),
					   .pu_edge_i     (pu_edge_w      ),
					   .qp_p_i        (qp_p_w		  ),
					   .qp_q_i        (qp_q_w		  ),
					   .cbf_p_i       (cbf_p_w        ),
					   .cbf_q_i       (cbf_q_w        ),
					   .mv_p_i        (mv_p_w         ),
					   .mv_q_i        (mv_q_w         ),
					   .mb_type_i	  (mb_type_i	  ),
					   .is_ver_i	  (is_ver_w		  ), 
					   .is_luma_i     (is_luma_w      ),
					   .is_tran_i     (is_tran_w	  ),
					   
					   .p_i           (p_w            ),
					   .q_i           (q_w			  ),
					   .f_p_o		  (f_p_w		  ),
					   .f_q_o		  (f_q_w		  )
				);							  

db_sao_top    u_sao(
                       .clk           (clk           ),  
                       .rst_n         (rst_n         ),
                       .dp_i          (f_p_w         ),
                       .dq_i          (f_q_w         ),
                       .op_i          (op_w          ),
                       .oq_i          (oq_w          ),
					   .op_enable_i   (op_enable_w   ),
					   .oq_enable_i   (oq_enable_w   ),
                       .is_luma_i     (is_luma_w     ),
                       .is_ver_i      (is_ver_w      ),
                       .data_end_i    (sao_data_end_w),
					   .sao_data_o    (sao_curr_w    )
                    );

// sao data ram organization   

// read from ram 
always@(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        sao_oen_r  <=   1'b1     ;
    else if((state_w==LOAD)&&(cnt_w==9'd0))
        sao_oen_r  <=   1'b0     ;
	else 
        sao_oen_r  <=   1'b1     ;
end 


// write to ram 
always@(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        sao_wen_r  <=   1'b1     ;
    else if((state_w==CVER)&&(cnt_w==9'd0))
        sao_wen_r  <=   1'b0     ;
	else 
        sao_wen_r  <=   1'b1     ;
end 

assign  sao_addr_w  =  mb_x_i    ;

always@(posedge clk or negedge rst_n) begin 	
    if(!rst_n)
        sao_curr_r   <=   18'd0     ;
    else if(state_w==CVER&&(cnt_w==9'd0)) 
        sao_curr_r   <=   sao_curr_w;
end 

db_ram_1p #(.Word_Width(17),.Addr_Width(`PIC_X_WIDTH)) 
                    db_sao_top(
                                .clk    ( clk        ),
                                .cen_i  ( 1'b0       ),					
                                .oen_i  ( sao_oen_r  ),					
                                .wen_i  ( sao_wen_r  ),					
                                .addr_i ( sao_addr_w ),
                                .data_i ( sao_curr_r ),
                                .data_o	( sao_data_w )
                            );

// sao top and left data
always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        sao_top_r  <=  18'd0         ;
    else if((state_w==LOAD)&&(cnt_w==9'd1))
        sao_top_r  <=  sao_data_w    ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        sao_left_r  <=  18'd0         ;
    else if((state_w==OUT)&&(cnt_w==9'd384))
        sao_left_r  <=  sao_curr_r    ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        sao_tl_r  <=  18'd0         ;
    else if((state_w==OUT)&&(cnt_w==9'd384)&&mb_y_i)
        sao_tl_r  <=  sao_top_r    ;
end 


always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        sao_tl_valid_r  <=  1'b0         ;
    else if((state_w==OUTLT)&&(cnt_w==9'd64)&&mb_y_i&&mb_x_i)
        sao_tl_valid_r  <=  1'b1    ;
	else 
	    sao_tl_valid_r  <=  1'b0    ;
end 



always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        sao_left_valid_r  <=  1'b0  ;
	else if(state_w==OUTLT&&(!cnt_w[8:4])&&mb_y_i==mb_y_total_i) // mb_x_i==mb_x_total_i 0...15
	    sao_left_valid_r  <=  1'b1  ;
    else if(state_w==OUTLT&&(!cnt_w[8:4])&&mb_x_i&&cnt_w[3:0]!=4'b1111) // 0...14, !=15
        sao_left_valid_r  <=  1'b1  ;
    else 
        sao_left_valid_r  <=  1'b0  ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        sao_top_valid_r  <=  1'b0  ;
    else if(state_w==OUTLT&&(cnt_w[5:4]==2'b10)&&mb_y_i) // 32....47
        sao_top_valid_r  <=  1'b1  ;
    else 
        sao_top_valid_r  <=  1'b0  ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n)
        sao_curr_valid_r  <=  1'b0  ;
    else if(state_w==OUT&&(!cnt_w[8]))begin // <256 
	    if(mb_x_i==mb_x_total_i&&mb_y_i==mb_y_total_i)
	        sao_curr_valid_r  <=  1'b1  ;
		else if(mb_x_i==mb_x_total_i)
		    sao_curr_valid_r  <=  (!(cnt_w[7:4]==4'b1111));
		else if(mb_y_i==mb_y_total_i)
		    sao_curr_valid_r  <=  (!(cnt_w[3:0]==4'b1111));
		else 
            sao_curr_valid_r  <=  (!(cnt_w[7:4]==4'b1111))&&(!(cnt_w[3:0]==4'b1111));
	end 
    else 
        sao_curr_valid_r  <=  1'b0  ;
end 

always @* begin 
    if(sao_tl_valid_r)//??sao_tl_valid_r
        sao_add_r  =   sao_tl_r     ;
    else if(sao_left_valid_r)
        sao_add_r  =   sao_left_r   ;
    else if(sao_top_valid_r)
        sao_add_r  =   sao_top_r    ;
	else if(sao_curr_valid_r)
	    sao_add_r  =   sao_curr_r   ;
	else 
	    sao_add_r  =   18'd0        ;
end 

wire [DATA_WIDTH-1:0]         mb_db_data_sao_w	; // db pixel 	

db_sao_add_offset udbaddoffset(
                                .mb_db_data_i   (mb_db_data_w     ),
                                .sao_add_i      (sao_add_r        ),
                                .mb_db_data_o   (mb_db_data_sao_w )
);

always @* begin 
    if(`SAO_OPEN==1) begin
		mb_db_data_o  =  mb_db_data_sao_w;
		db_wdata_o    =  mb_db_data_sao_w;
	end
    else begin
		mb_db_data_o  =  mb_db_data_w    ;
		db_wdata_o    =  mb_db_data_w    ;
	end
end 


endmodule

