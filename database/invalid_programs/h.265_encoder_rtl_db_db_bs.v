//-----------------------------------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUtu_veD WITHOUT THE      
//  EXPRESSED WRITtu_veN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//------------------------------------------------------------------------------------------------
// Filename       : db_bs.v
// Author         : Chewein
// Creatu_ved     : 2014-04-18
// Description    :         
//------------------------------------------------------------------------------------------------
`include "enc_defines.v"

module db_bs(  
			   clk			 ,
               rst_n		 ,	
			   cnt_i		 ,
			   state_i		 ,			   
               mb_x_total_i  ,	
               mb_y_total_i  ,	
               mb_x_i 	     ,	
               mb_y_i 	     ,	
               
               mb_partition_i,
               mb_p_pu_mode_i,
               mb_cbf_i      ,
			   mb_cbf_u_i	 ,
			   mb_cbf_v_i	 ,
			   qp_i 		 ,
			   
              //output
               tu_edge_o	 ,
			   pu_edge_o	 ,
			   qp_p_o		 ,
			   qp_q_o		 ,
			   cbf_p_o       ,
			   cbf_q_o       ,
			   is_tran_o     
			);
// *************************************************************************************************
//                                             
//    INPUT / OUTPUT DECLARATION               
//                                             
// *************************************************************************************************
input							clk				;//clock
input							rst_n			;//reset signal  

// CTRL IF                   
input [`PIC_X_WIDTH-1:0] 		mb_x_total_i 	;// Total LCU number-1 in X ,PIC_X_WIDTH = 8
input [`PIC_Y_WIDTH-1:0]  		mb_y_total_i 	;// Total LCU number-1 in y ,PIC_Y_WIDTH = 8
input [`PIC_X_WIDTH-1:0] 		mb_x_i 			;// Current LCU in X
input [`PIC_Y_WIDTH-1:0]  		mb_y_i 			;// Current LCU in y
input [8:0]         			cnt_i			;
input [2:0]         			state_i			;

input [20:0]					mb_partition_i	;// CU partition mode,0:not split , 1:split
input [41:0]					mb_p_pu_mode_i  ;// Intu_ver PU partition mode for every CU size
input [255:0]					mb_cbf_i        ;//  cbf for every 4x4 cu    
input [255:0]					mb_cbf_u_i      ;//  cbf for every 4x4 cu  
input [255:0]					mb_cbf_v_i      ;//  cbf for every 4x4 cu  

input [5:0]						qp_i 			;// QP 

output              			tu_edge_o		;
output    						pu_edge_o		; 
output [5:0]        			qp_p_o          ;
output [5:0]        			qp_q_o          ;	
output              			cbf_p_o         ;
output              			cbf_q_o         ;	

output              			is_tran_o       ;

reg                 			tu_edge_o		;
reg       						pu_edge_o		;
reg    [5:0]        			qp_p_o          ;
reg    [5:0]        			qp_q_o          ;
reg                 			cbf_p_o         ;
reg                 			cbf_q_o         ;
reg                 			is_tran_o		;
//***************************************************************************************************
//                                             
//    Parameter DECLARATION                     
//                                             
//***************************************************************************************************

parameter IDLE   = 3'b000, LOAD  = 3'b001, YVER  = 3'b011,YHOR	=3'b010;
parameter CVER   = 3'b110, CHOR  = 3'b111, OUTLT = 3'b100,OUT   =3'b100;


//***************************************************************************************************
//                                             
//    				stort cbf top to memory   
//                                             
//***************************************************************************************************
wire  		                cbf_top_cen_w    ;  // chip enable, low active
wire  		                cbf_top_oen_w    ;  // data output enable, low active
wire  		                cbf_top_wen_w    ;  // write enable, low active
wire    [`PIC_X_WIDTH-1:0]  cbf_top_addr_w   ;  // address input
wire    [          16-1:0]  cbf_top_data_i_w ;  // data input
wire	[          16-1:0]  cbf_top_data_o_w ;  // data output

reg                         cbf_top_oen_r    ;

wire   [ 16-1 : 0 ]             cbf_top_w       ;
reg    [ 16-1 : 0 ]             cbf_top_r       ;
	
assign  cbf_top_w = { mb_cbf_i[255],mb_cbf_i[254],mb_cbf_i[251],mb_cbf_i[250],
                      mb_cbf_i[239],mb_cbf_i[238],mb_cbf_i[235],mb_cbf_i[234],
                      mb_cbf_i[191],mb_cbf_i[190],mb_cbf_i[187],mb_cbf_i[186],
					  mb_cbf_i[175],mb_cbf_i[174],mb_cbf_i[171],mb_cbf_i[170]};

					 
// mv top memory buffer
assign  cbf_top_cen_w     = !(state_i == LOAD  || state_i == OUTLT)       ;
assign  cbf_top_oen_w     = !(state_i == LOAD )|| cnt_i                   ; // read enable  
assign  cbf_top_wen_w     = !(state_i == OUT  )|| cnt_i                   ; // write enable 	
assign  cbf_top_addr_w    = mb_x_i                 ;	
assign  cbf_top_data_i_w  = cbf_top_w              ;						  

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) 
        cbf_top_oen_r  <=  1'b0          ;
    else 
        cbf_top_oen_r  <=  cbf_top_oen_w ;
end 

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) 
        cbf_top_r  <=  16'b0            ;
    else if(mb_y_i&&!cbf_top_oen_r)
        cbf_top_r  <=  cbf_top_data_o_w ;
	else if(!cbf_top_oen_r)
	    cbf_top_r  <=  16'b0            ;
end 


db_ram_1p #(.Addr_Width(`PIC_X_WIDTH), .Word_Width(16))	
u_ram_1p_64x192 (
    .clk  	    ( clk		        ), 
    .cen_i      ( cbf_top_cen_w      ),
    .oen_i      ( cbf_top_oen_r      ), // read   enable 
    .wen_i      ( cbf_top_wen_w      ), // write  enable 
    .addr_i     ( cbf_top_addr_w     ),
    .data_i     ( cbf_top_data_i_w   ),
    .data_o     ( cbf_top_data_o_w   )
);				

//***************************************************************************************************
//                                             
//    					cacl tu edge and pu edge 
//                                             
//***************************************************************************************************

wire 	[7:0] 	   tu_ve0,tu_ve1,tu_ve2 ,tu_ve3 ,tu_ve4 ,tu_ve5 ,tu_ve6 ,tu_ve7	;
wire    [7:0]      tu_ve8,tu_ve9,tu_ve10,tu_ve11,tu_ve12,tu_ve13,tu_ve14,tu_ve15;
	
wire 	[15:0] 	   tu_he0,tu_he1,tu_he2,tu_he3,tu_he4,tu_he5,tu_he6,tu_he7		;
reg     [7:0]      tu_le											;

assign tu_ve0[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve1[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve2[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve3[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve4[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve5[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve6[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve7[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve8[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve9[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve10[0]   =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve11[0]   =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve12[0]   =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve13[0]   =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve14[0]   =   mb_x_i 	?	1'd1	:	1'd0	;
assign tu_ve15[0]   =   mb_x_i 	?	1'd1	:	1'd0	;

assign tu_he0		=	mb_y_i	? 	16'hffff : 	16'd0	;

db_tu_edge utuedge(
						.mb_partition_i(mb_partition_i),
						.v0	   		   (tu_ve0[7:1]	  ),
						.v1	   		   (tu_ve1[7:1]	  ),
						.v2	   		   (tu_ve2[7:1]	  ),
						.v3	   		   (tu_ve3[7:1]	  ),
						.v4	   		   (tu_ve4[7:1]	  ),
						.v5	   		   (tu_ve5[7:1]	  ),
						.v6	   		   (tu_ve6[7:1]	  ),
						.v7	   		   (tu_ve7[7:1]	  ),
						.v8	   		   (tu_ve8[7:1]	  ),
						.v9	   		   (tu_ve9[7:1]	  ),
						.v10	   	   (tu_ve10[7:1]  ),
						.v11	   	   (tu_ve11[7:1]  ),
						.v12   		   (tu_ve12[7:1]  ),
						.v13	   	   (tu_ve13[7:1]  ),
						.v14	   	   (tu_ve14[7:1]  ),
						.v15	   	   (tu_ve15[7:1]  ),

						.h1			   (tu_he1		  ),
						.h2			   (tu_he2		  ),
						.h3			   (tu_he3		  ),
						.h4			   (tu_he4		  ),
						.h5			   (tu_he5		  ),
						.h6			   (tu_he6		  ),
						.h7			   (tu_he7		  )					
						
);	

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		tu_le     <=  'd0	 ;
	else if(state_i==OUT) begin
		tu_le[0]  <=  tu_he0[15];
		tu_le[1]  <=  tu_he1[15];
		tu_le[2]  <=  tu_he2[15];
		tu_le[3]  <=  tu_he3[15];
		tu_le[4]  <=  tu_he4[15];
		tu_le[5]  <=  tu_he5[15];
		tu_le[6]  <=  tu_he6[15];
		tu_le[7]  <=  tu_he7[15];
    end
	else 
	    tu_le     <=  tu_le	   ;
end
//******************************************************************************************************
//				cacl pu edge 
//******************************************************************************************************
wire 	[7:0] 	   pu_ve0,pu_ve1,pu_ve2 ,pu_ve3 ,pu_ve4 ,pu_ve5 ,pu_ve6 ,pu_ve7 ;
wire 	[7:0] 	   pu_ve8,pu_ve9,pu_ve10,pu_ve11,pu_ve12,pu_ve13,pu_ve14,pu_ve15;

wire 	[15:0] 	   pu_he0,pu_he1,pu_he2,pu_he3,pu_he4,pu_he5,pu_he6,pu_he7;
reg     [7:0]	   pu_le												  ;

assign pu_ve0[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve1[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve2[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve3[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve4[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve5[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve6[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve7[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve8[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve9[0]    =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve10[0]   =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve11[0]   =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve12[0]   =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve13[0]   =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve14[0]   =   mb_x_i 	?	1'd1	:	1'd0	;
assign pu_ve15[0]   =   mb_x_i 	?	1'd1	:	1'd0	;

assign pu_he0		=	mb_y_i 	?	16'hffff:	16'd0	;

db_pu_edge upuedge(
				        .mb_partition_i(mb_partition_i),
						.mb_p_pu_mode_i(mb_p_pu_mode_i),
						.v0	   		   (pu_ve0[7:1]	  ),
						.v1	   		   (pu_ve1[7:1]	  ),
						.v2	   		   (pu_ve2[7:1]	  ),
						.v3	   		   (pu_ve3[7:1]	  ),
						.v4	   		   (pu_ve4[7:1]	  ),
						.v5	   		   (pu_ve5[7:1]	  ),
						.v6	   		   (pu_ve6[7:1]	  ),
						.v7	   		   (pu_ve7[7:1]	  ),
						.v8	   		   (pu_ve8[7:1]	  ),
						.v9	   		   (pu_ve9[7:1]	  ),
						.v10	   	   (pu_ve10[7:1]  ),
						.v11	   	   (pu_ve11[7:1]  ),
						.v12   		   (pu_ve12[7:1]  ),
						.v13	   	   (pu_ve13[7:1]  ),
						.v14	   	   (pu_ve14[7:1]  ),
						.v15	   	   (pu_ve15[7:1]  ),
						
						.h1			   (pu_he1		  ),
						.h2			   (pu_he2		  ),
						.h3			   (pu_he3		  ),
						.h4			   (pu_he4		  ),
						.h5			   (pu_he5		  ),
						.h6			   (pu_he6		  ),
						.h7			   (pu_he7		  )
				);
				
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		pu_le     <=  'd0	 ;
	else if(state_i==OUT) begin
		pu_le[0]  <=  pu_he0[15];
		pu_le[1]  <=  pu_he1[15];
		pu_le[2]  <=  pu_he2[15];
		pu_le[3]  <=  pu_he3[15];
		pu_le[4]  <=  pu_he4[15];
		pu_le[5]  <=  pu_he5[15];
		pu_le[6]  <=  pu_he6[15];
		pu_le[7]  <=  pu_he7[15];
    end
	else 
	    pu_le     <=  pu_le	   ;
end				
//******************************************************************************************************
//                                             
//    	select tu_ve  pu_ve  pu_he depedent on the cnt_i and state_i
//                                             
//******************************************************************************************************

reg  [7:0]	 cver_tue_r	,	cver_pue_r	;
reg  [15:0]	 chor_tue_r	,   chor_pue_r	;

reg          cver_tue   ,   chor_tue	;
reg          cver_pue   ,   chor_pue	;

reg  [7:0]	 yver_tue_r	,   yver_pue_r	;
reg  [15:0]  yhor_tue_r	,	yhor_pue_r	;
 
reg          yver_tue   ,   yhor_tue	;
reg          yver_pue   ,   yhor_pue	;

wire         x_end  =   mb_x_i == mb_x_total_i ;
wire         cx_en  =   x_end|cnt_i[6];// chroma hor 

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)	begin
		tu_edge_o	<=    1'b0	;
		pu_edge_o	<=    1'b0	;
	end
	else begin
		case(state_i)
			CVER:begin tu_edge_o <= cver_tue;pu_edge_o <= cver_pue;end
	        CHOR:begin tu_edge_o <= chor_tue;pu_edge_o <= chor_pue;end
			YVER:begin tu_edge_o <= yver_tue;pu_edge_o <= yver_pue;end
			YHOR:begin tu_edge_o <= yhor_tue;pu_edge_o <= yhor_pue;end
		 default:begin tu_edge_o <= 1'b0    ;pu_edge_o <= 1'b0    ;end	
		endcase
	end
end	
//******************************************************************************************************
//cver
always @*  begin
	case(cnt_i[4:2])
		4'h0	:begin cver_tue_r  = tu_ve0  ;cver_pue_r  =  pu_ve0 ;end
		4'h1	:begin cver_tue_r  = tu_ve2  ;cver_pue_r  =  pu_ve2 ;end
		4'h2	:begin cver_tue_r  = tu_ve4  ;cver_pue_r  =  pu_ve4 ;end
		4'h3	:begin cver_tue_r  = tu_ve6  ;cver_pue_r  =  pu_ve6 ;end
		4'h4	:begin cver_tue_r  = tu_ve8  ;cver_pue_r  =  pu_ve8 ;end
		4'h5	:begin cver_tue_r  = tu_ve10 ;cver_pue_r  =  pu_ve10;end
		4'h6	:begin cver_tue_r  = tu_ve12 ;cver_pue_r  =  pu_ve12;end
		4'h7	:begin cver_tue_r  = tu_ve14 ;cver_pue_r  =  pu_ve14;end
		default	:begin cver_tue_r  = 8'h00   ;cver_pue_r  =  8'h00  ;end
	endcase
end

always @* begin
	case(cnt_i[1:0])
		2'h0    :begin cver_tue = cver_tue_r[0] ;cver_pue = cver_pue_r[0];end
        2'h1    :begin cver_tue = cver_tue_r[2] ;cver_pue = cver_pue_r[2];end
        2'h2    :begin cver_tue = cver_tue_r[4] ;cver_pue = cver_pue_r[4];end
        2'h3    :begin cver_tue = cver_tue_r[6] ;cver_pue = cver_pue_r[6];end
	  default   :begin cver_tue = 1'b0			;cver_pue = 1'b0		 ;end
    endcase
end
//*******************************************************************************************************
//chor

always @*  begin
	if(cnt_i[6]) begin
			chor_tue_r = {1'b0,tu_le[6],1'b0,tu_le[4],1'b0,tu_le[2],1'b0,tu_le[0],1'b0,tu_le[6],1'b0,tu_le[4],1'b0,tu_le[2],1'b0,tu_le[0]};
			chor_pue_r = {1'b0,pu_le[6],1'b0,pu_le[4],1'b0,pu_le[2],1'b0,pu_le[0],1'b0,pu_le[6],1'b0,pu_le[4],1'b0,pu_le[2],1'b0,pu_le[0]};
	end
	else  begin
		case(cnt_i[4:3])
			4'h0	:begin chor_tue_r  = tu_he0  ;chor_pue_r  =  pu_he0 ;end
			4'h1	:begin chor_tue_r  = tu_he2  ;chor_pue_r  =  pu_he2 ;end
			4'h2	:begin chor_tue_r  = tu_he4  ;chor_pue_r  =  pu_he4 ;end
			4'h3	:begin chor_tue_r  = tu_he6  ;chor_pue_r  =  pu_he6 ;end
			default	:begin chor_tue_r  = 8'h00   ;chor_pue_r  =  8'h00  ;end
		endcase
	end
end

always @*  begin
	case(cnt_i[2:0])
		4'h0	:begin chor_tue = chor_tue_r[0 ]        ;chor_pue = chor_pue_r[0 ]       ;end
		4'h1	:begin chor_tue = chor_tue_r[2 ]        ;chor_pue = chor_pue_r[2 ]       ;end
		4'h2	:begin chor_tue = chor_tue_r[4 ]        ;chor_pue = chor_pue_r[4 ]       ;end
		4'h3	:begin chor_tue = chor_tue_r[6 ]        ;chor_pue = chor_pue_r[6 ]       ;end
		4'h4	:begin chor_tue = chor_tue_r[8 ]        ;chor_pue = chor_pue_r[8 ]       ;end
		4'h5	:begin chor_tue = chor_tue_r[10]        ;chor_pue = chor_pue_r[10]       ;end
		4'h6	:begin chor_tue = chor_tue_r[12]        ;chor_pue = chor_pue_r[12]       ;end
		4'h7	:begin chor_tue = chor_tue_r[14]&cx_en  ;chor_pue = chor_pue_r[14]&cx_en ;end
		default	:begin chor_tue = 1'b0		            ;chor_pue = 1'b0		         ;end
	endcase
end

//*******************************************************************************************************
//yver
always @* begin
	case(cnt_i[6:3])
		4'h0	:begin yver_tue_r  = tu_ve0  ;yver_pue_r  =  pu_ve0 ;end
		4'h1	:begin yver_tue_r  = tu_ve1  ;yver_pue_r  =  pu_ve1 ;end
		4'h2	:begin yver_tue_r  = tu_ve2  ;yver_pue_r  =  pu_ve2 ;end
		4'h3	:begin yver_tue_r  = tu_ve3  ;yver_pue_r  =  pu_ve3 ;end
		4'h4	:begin yver_tue_r  = tu_ve4  ;yver_pue_r  =  pu_ve4 ;end
		4'h5	:begin yver_tue_r  = tu_ve5  ;yver_pue_r  =  pu_ve5 ;end
		4'h6	:begin yver_tue_r  = tu_ve6  ;yver_pue_r  =  pu_ve6 ;end
		4'h7	:begin yver_tue_r  = tu_ve7  ;yver_pue_r  =  pu_ve7 ;end
		4'h8	:begin yver_tue_r  = tu_ve8  ;yver_pue_r  =  pu_ve8 ;end
		4'h9	:begin yver_tue_r  = tu_ve9  ;yver_pue_r  =  pu_ve9 ;end
		4'ha	:begin yver_tue_r  = tu_ve10 ;yver_pue_r  =  pu_ve10;end
		4'hb	:begin yver_tue_r  = tu_ve11 ;yver_pue_r  =  pu_ve11;end
		4'hc    :begin yver_tue_r  = tu_ve12 ;yver_pue_r  =  pu_ve12;end
		4'hd	:begin yver_tue_r  = tu_ve13 ;yver_pue_r  =  pu_ve13;end
		4'he	:begin yver_tue_r  = tu_ve14 ;yver_pue_r  =  pu_ve14;end
		4'hf	:begin yver_tue_r  = tu_ve15 ;yver_pue_r  =  pu_ve15;end
		default	:begin yver_tue_r  = 8'h00   ;yver_pue_r  =  8'h00  ;end	 
	endcase  
end

always @*   begin
	case(cnt_i[2:0])
		3'd0	:begin yver_tue = yver_tue_r[0];yver_pue = yver_pue_r[0];end
		3'd1	:begin yver_tue = yver_tue_r[1];yver_pue = yver_pue_r[1];end
		3'd2	:begin yver_tue = yver_tue_r[2];yver_pue = yver_pue_r[2];end
		3'd3	:begin yver_tue = yver_tue_r[3];yver_pue = yver_pue_r[3];end
		3'd4	:begin yver_tue = yver_tue_r[4];yver_pue = yver_pue_r[4];end
		3'd5	:begin yver_tue = yver_tue_r[5];yver_pue = yver_pue_r[5];end
		3'd6	:begin yver_tue = yver_tue_r[6];yver_pue = yver_pue_r[6];end
		3'd7	:begin yver_tue = yver_tue_r[7];yver_pue = yver_pue_r[7];end
		default	:begin yver_tue = 1'b0		   ;yver_pue = 1'b0		;end
	endcase
end

//*******************************************************************************************************
//yhor
always @* begin 
	if(cnt_i[7])begin
		yhor_tue_r  = tu_le	;
		yhor_pue_r	= pu_le	;
	end
	else  begin
		case(cnt_i[6:4])
			3'd0	:begin yhor_tue_r  = tu_he0  ;yhor_pue_r  =  pu_he0 ;end
			3'd1	:begin yhor_tue_r  = tu_he1  ;yhor_pue_r  =  pu_he1 ;end
            3'd2	:begin yhor_tue_r  = tu_he2  ;yhor_pue_r  =  pu_he2 ;end
            3'd3	:begin yhor_tue_r  = tu_he3  ;yhor_pue_r  =  pu_he3 ;end
            3'd4	:begin yhor_tue_r  = tu_he4  ;yhor_pue_r  =  pu_he4 ;end
            3'd5	:begin yhor_tue_r  = tu_he5  ;yhor_pue_r  =  pu_he5 ;end
            3'd6	:begin yhor_tue_r  = tu_he6  ;yhor_pue_r  =  pu_he6 ;end
            3'd7	:begin yhor_tue_r  = tu_he7  ;yhor_pue_r  =  pu_he7 ;end
            default	:begin yhor_tue_r  = 16'b0   ;yhor_pue_r  =  16'b0  ;end
		endcase
	end
end

always @* begin
	case(cnt_i[3:0])
		4'h0	:begin yhor_tue = yhor_tue_r[0 ]       ;yhor_pue = yhor_pue_r[0 ]       ;end
		4'h1	:begin yhor_tue = yhor_tue_r[1 ]       ;yhor_pue = yhor_pue_r[1 ]       ;end
		4'h2	:begin yhor_tue = yhor_tue_r[2 ]       ;yhor_pue = yhor_pue_r[2 ]       ;end
		4'h3	:begin yhor_tue = yhor_tue_r[3 ]       ;yhor_pue = yhor_pue_r[3 ]       ;end
		4'h4	:begin yhor_tue = yhor_tue_r[4 ]       ;yhor_pue = yhor_pue_r[4 ]       ;end
		4'h5	:begin yhor_tue = yhor_tue_r[5 ]       ;yhor_pue = yhor_pue_r[5 ]       ;end
		4'h6	:begin yhor_tue = yhor_tue_r[6 ]       ;yhor_pue = yhor_pue_r[6 ]       ;end
		4'h7	:begin yhor_tue = yhor_tue_r[7 ]       ;yhor_pue = yhor_pue_r[7 ]       ;end
		4'h8	:begin yhor_tue = yhor_tue_r[8 ]       ;yhor_pue = yhor_pue_r[8 ]       ;end
		4'h9	:begin yhor_tue = yhor_tue_r[9 ]       ;yhor_pue = yhor_pue_r[9 ]       ;end
		4'ha	:begin yhor_tue = yhor_tue_r[10]       ;yhor_pue = yhor_pue_r[10]       ;end
		4'hb	:begin yhor_tue = yhor_tue_r[11]       ;yhor_pue = yhor_pue_r[11]       ;end
		4'hc    :begin yhor_tue = yhor_tue_r[12]       ;yhor_pue = yhor_pue_r[12]       ;end
		4'hd	:begin yhor_tue = yhor_tue_r[13]       ;yhor_pue = yhor_pue_r[13]       ;end
		4'he	:begin yhor_tue = yhor_tue_r[14]       ;yhor_pue = yhor_pue_r[14]       ;end
		4'hf	:begin yhor_tue = yhor_tue_r[15]&&x_end;yhor_pue = yhor_pue_r[15]&&x_end;end
		default	:begin yhor_tue = 1'b0          		;yhor_pue = 1'b0		  		;end	 
	endcase  
end

//******************************************************************************************************
//                                             
//    					select cbf 
//                                             
//******************************************************************************************************
reg [15:0] 	cbf_left	;
reg         cbf_tl      ;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
        cbf_left 	<=	16'h0000	;	
	else if(state_i==OUT) begin
	    cbf_left[0 ]  <=  mb_cbf_i[ 85] ;
        cbf_left[1 ]  <=  mb_cbf_i[ 87] ;
        cbf_left[2 ]  <=  mb_cbf_i[ 93] ;
        cbf_left[3 ]  <=  mb_cbf_i[ 95] ;
        cbf_left[4 ]  <=  mb_cbf_i[117] ;
        cbf_left[5 ]  <=  mb_cbf_i[119] ;
        cbf_left[6 ]  <=  mb_cbf_i[125] ;
        cbf_left[7 ]  <=  mb_cbf_i[127] ;
        cbf_left[8 ]  <=  mb_cbf_i[213] ;
        cbf_left[9 ]  <=  mb_cbf_i[215] ;
        cbf_left[10]  <=  mb_cbf_i[221] ;
        cbf_left[11]  <=  mb_cbf_i[223] ;
		cbf_left[12]  <=  mb_cbf_i[245] ;
	    cbf_left[13]  <=  mb_cbf_i[247] ;
	    cbf_left[14]  <=  mb_cbf_i[253] ;
	    cbf_left[15]  <=  mb_cbf_i[255] ;
	end
end      

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
	    cbf_tl  <=  1'b0 ;
	else if(state_i==OUT)
	    cbf_tl  <=  cbf_top_r[15];
end

wire [7:0] cbf_v0_p  , cbf_v0_q	; 
wire [7:0] cbf_v1_p  , cbf_v1_q	; 
wire [7:0] cbf_v2_p  , cbf_v2_q	; 
wire [7:0] cbf_v3_p  , cbf_v3_q	; 
wire [7:0] cbf_v4_p  , cbf_v4_q	; 
wire [7:0] cbf_v5_p  , cbf_v5_q	; 
wire [7:0] cbf_v6_p  , cbf_v6_q	; 
wire [7:0] cbf_v7_p  , cbf_v7_q	; 
wire [7:0] cbf_v8_p  , cbf_v8_q	; 
wire [7:0] cbf_v9_p  , cbf_v9_q	; 
wire [7:0] cbf_v10_p , cbf_v10_q; 
wire [7:0] cbf_v11_p , cbf_v11_q; 
wire [7:0] cbf_v12_p , cbf_v12_q; 
wire [7:0] cbf_v13_p , cbf_v13_q; 
wire [7:0] cbf_v14_p , cbf_v14_q; 
wire [7:0] cbf_v15_p , cbf_v15_q; 


assign  cbf_v0_p   = {cbf_left[ 0],mb_cbf_i[  1],mb_cbf_i[  5],mb_cbf_i[ 17],mb_cbf_i[21] ,mb_cbf_i[ 65],mb_cbf_i[ 69],mb_cbf_i[ 81]};
assign  cbf_v1_p   = {cbf_left[ 1],mb_cbf_i[  3],mb_cbf_i[  7],mb_cbf_i[ 19],mb_cbf_i[23] ,mb_cbf_i[ 67],mb_cbf_i[ 71],mb_cbf_i[ 83]};
assign  cbf_v2_p   = {cbf_left[ 2],mb_cbf_i[  9],mb_cbf_i[ 13],mb_cbf_i[ 25],mb_cbf_i[29] ,mb_cbf_i[ 73],mb_cbf_i[ 77],mb_cbf_i[ 89]};
assign  cbf_v3_p   = {cbf_left[ 3],mb_cbf_i[ 11],mb_cbf_i[ 15],mb_cbf_i[ 27],mb_cbf_i[31] ,mb_cbf_i[ 75],mb_cbf_i[ 79],mb_cbf_i[ 91]};
assign  cbf_v4_p   = {cbf_left[ 4],mb_cbf_i[ 33],mb_cbf_i[ 37],mb_cbf_i[ 49],mb_cbf_i[53] ,mb_cbf_i[ 97],mb_cbf_i[101],mb_cbf_i[113]};
assign  cbf_v5_p   = {cbf_left[ 5],mb_cbf_i[ 35],mb_cbf_i[ 39],mb_cbf_i[ 51],mb_cbf_i[55] ,mb_cbf_i[ 99],mb_cbf_i[103],mb_cbf_i[115]};
assign  cbf_v6_p   = {cbf_left[ 6],mb_cbf_i[ 41],mb_cbf_i[ 45],mb_cbf_i[ 57],mb_cbf_i[61] ,mb_cbf_i[105],mb_cbf_i[109],mb_cbf_i[121]};
assign  cbf_v7_p   = {cbf_left[ 7],mb_cbf_i[ 43],mb_cbf_i[ 47],mb_cbf_i[ 59],mb_cbf_i[63] ,mb_cbf_i[107],mb_cbf_i[111],mb_cbf_i[123]};
assign  cbf_v8_p   = {cbf_left[ 8],mb_cbf_i[129],mb_cbf_i[133],mb_cbf_i[145],mb_cbf_i[149],mb_cbf_i[193],mb_cbf_i[197],mb_cbf_i[209]};
assign  cbf_v9_p   = {cbf_left[ 9],mb_cbf_i[131],mb_cbf_i[135],mb_cbf_i[147],mb_cbf_i[151],mb_cbf_i[195],mb_cbf_i[199],mb_cbf_i[211]};
assign  cbf_v10_p  = {cbf_left[10],mb_cbf_i[137],mb_cbf_i[141],mb_cbf_i[153],mb_cbf_i[157],mb_cbf_i[201],mb_cbf_i[205],mb_cbf_i[217]};
assign  cbf_v11_p  = {cbf_left[11],mb_cbf_i[139],mb_cbf_i[143],mb_cbf_i[155],mb_cbf_i[159],mb_cbf_i[203],mb_cbf_i[207],mb_cbf_i[219]};
assign  cbf_v12_p  = {cbf_left[12],mb_cbf_i[161],mb_cbf_i[165],mb_cbf_i[177],mb_cbf_i[181],mb_cbf_i[225],mb_cbf_i[229],mb_cbf_i[241]};
assign  cbf_v13_p  = {cbf_left[13],mb_cbf_i[163],mb_cbf_i[167],mb_cbf_i[179],mb_cbf_i[183],mb_cbf_i[227],mb_cbf_i[231],mb_cbf_i[243]};
assign  cbf_v14_p  = {cbf_left[14],mb_cbf_i[169],mb_cbf_i[173],mb_cbf_i[185],mb_cbf_i[189],mb_cbf_i[233],mb_cbf_i[237],mb_cbf_i[249]};
assign  cbf_v15_p  = {cbf_left[15],mb_cbf_i[171],mb_cbf_i[175],mb_cbf_i[187],mb_cbf_i[191],mb_cbf_i[235],mb_cbf_i[239],mb_cbf_i[251]};

assign cbf_v0_q	   = {mb_cbf_i[  0],mb_cbf_i[  4],mb_cbf_i[ 16],mb_cbf_i[ 20],mb_cbf_i[ 64],mb_cbf_i[ 68],mb_cbf_i[ 80],mb_cbf_i[ 84]};
assign cbf_v1_q	   = {mb_cbf_i[  2],mb_cbf_i[  6],mb_cbf_i[ 18],mb_cbf_i[ 22],mb_cbf_i[ 66],mb_cbf_i[ 70],mb_cbf_i[ 82],mb_cbf_i[ 86]};
assign cbf_v2_q	   = {mb_cbf_i[  8],mb_cbf_i[ 12],mb_cbf_i[ 24],mb_cbf_i[ 28],mb_cbf_i[ 72],mb_cbf_i[ 76],mb_cbf_i[ 88],mb_cbf_i[ 92]};
assign cbf_v3_q	   = {mb_cbf_i[ 10],mb_cbf_i[ 14],mb_cbf_i[ 26],mb_cbf_i[ 30],mb_cbf_i[ 74],mb_cbf_i[ 78],mb_cbf_i[ 90],mb_cbf_i[ 94]};
assign cbf_v4_q	   = {mb_cbf_i[ 32],mb_cbf_i[ 36],mb_cbf_i[ 48],mb_cbf_i[ 52],mb_cbf_i[ 96],mb_cbf_i[100],mb_cbf_i[112],mb_cbf_i[116]};
assign cbf_v5_q	   = {mb_cbf_i[ 34],mb_cbf_i[ 38],mb_cbf_i[ 50],mb_cbf_i[ 54],mb_cbf_i[ 98],mb_cbf_i[102],mb_cbf_i[114],mb_cbf_i[118]};
assign cbf_v6_q	   = {mb_cbf_i[ 40],mb_cbf_i[ 44],mb_cbf_i[ 56],mb_cbf_i[ 60],mb_cbf_i[104],mb_cbf_i[108],mb_cbf_i[120],mb_cbf_i[124]};
assign cbf_v7_q	   = {mb_cbf_i[ 42],mb_cbf_i[ 46],mb_cbf_i[ 58],mb_cbf_i[ 62],mb_cbf_i[106],mb_cbf_i[110],mb_cbf_i[122],mb_cbf_i[126]};
assign cbf_v8_q	   = {mb_cbf_i[128],mb_cbf_i[132],mb_cbf_i[144],mb_cbf_i[148],mb_cbf_i[192],mb_cbf_i[196],mb_cbf_i[208],mb_cbf_i[212]};
assign cbf_v9_q	   = {mb_cbf_i[130],mb_cbf_i[134],mb_cbf_i[146],mb_cbf_i[150],mb_cbf_i[194],mb_cbf_i[198],mb_cbf_i[210],mb_cbf_i[214]};
assign cbf_v10_q   = {mb_cbf_i[136],mb_cbf_i[140],mb_cbf_i[152],mb_cbf_i[156],mb_cbf_i[200],mb_cbf_i[204],mb_cbf_i[216],mb_cbf_i[220]};
assign cbf_v11_q   = {mb_cbf_i[138],mb_cbf_i[142],mb_cbf_i[154],mb_cbf_i[158],mb_cbf_i[202],mb_cbf_i[206],mb_cbf_i[218],mb_cbf_i[222]};
assign cbf_v12_q   = {mb_cbf_i[160],mb_cbf_i[164],mb_cbf_i[176],mb_cbf_i[180],mb_cbf_i[224],mb_cbf_i[228],mb_cbf_i[240],mb_cbf_i[244]};
assign cbf_v13_q   = {mb_cbf_i[162],mb_cbf_i[166],mb_cbf_i[178],mb_cbf_i[182],mb_cbf_i[226],mb_cbf_i[230],mb_cbf_i[242],mb_cbf_i[246]};
assign cbf_v14_q   = {mb_cbf_i[168],mb_cbf_i[172],mb_cbf_i[184],mb_cbf_i[188],mb_cbf_i[232],mb_cbf_i[236],mb_cbf_i[248],mb_cbf_i[252]};
assign cbf_v15_q   = {mb_cbf_i[170],mb_cbf_i[174],mb_cbf_i[186],mb_cbf_i[190],mb_cbf_i[234],mb_cbf_i[238],mb_cbf_i[250],mb_cbf_i[254]};

wire [15:0] cbf_h0_p  , cbf_h0_q	; 
wire [15:0] cbf_h1_p  , cbf_h1_q	; 
wire [15:0] cbf_h2_p  , cbf_h2_q	; 
wire [15:0] cbf_h3_p  , cbf_h3_q	; 
wire [15:0] cbf_h4_p  , cbf_h4_q	; 
wire [15:0] cbf_h5_p  , cbf_h5_q	; 
wire [15:0] cbf_h6_p  , cbf_h6_q	; 
wire [15:0] cbf_h7_p  , cbf_h7_q	; 

wire [15:0] cbf_chor_left_p,cbf_chor_left_q; 
wire [15:0] cbf_yhor_left_p,cbf_yhor_left_q;

assign cbf_h0_p	= {cbf_top_r[0 ],cbf_top_r[1 ],cbf_top_r[2 ],cbf_top_r[3 ],cbf_top_r[4 ],cbf_top_r[5 ],cbf_top_r[6 ],cbf_top_r[7 ],cbf_top_r[8 ],cbf_top_r[9 ],cbf_top_r[10],cbf_top_r[11],cbf_top_r[12],cbf_top_r[13],cbf_top_r[14],cbf_top_r[15]} ;//{mb_cbf_i[  0],mb_cbf_i[  1],mb_cbf_i[  4],mb_cbf_i[  5],mb_cbf_i[ 16],mb_cbf_i[ 17],mb_cbf_i[ 20],mb_cbf_i[ 21],mb_cbf_i[ 64],mb_cbf_i[ 65],mb_cbf_i[ 68],mb_cbf_i[ 69],mb_cbf_i[ 80],mb_cbf_i[ 81],mb_cbf_i[ 84],mb_cbf_i[ 85]};
assign cbf_h1_p	= {mb_cbf_i[  2],mb_cbf_i[  3],mb_cbf_i[  6],mb_cbf_i[  7],mb_cbf_i[ 18],mb_cbf_i[ 19],mb_cbf_i[ 22],mb_cbf_i[ 23],mb_cbf_i[ 66],mb_cbf_i[ 67],mb_cbf_i[ 70],mb_cbf_i[ 71],mb_cbf_i[ 82],mb_cbf_i[ 83],mb_cbf_i[ 86],mb_cbf_i[ 87]};
assign cbf_h2_p	= {mb_cbf_i[ 10],mb_cbf_i[ 11],mb_cbf_i[ 14],mb_cbf_i[ 15],mb_cbf_i[ 26],mb_cbf_i[ 27],mb_cbf_i[ 30],mb_cbf_i[ 31],mb_cbf_i[ 74],mb_cbf_i[ 75],mb_cbf_i[ 78],mb_cbf_i[ 79],mb_cbf_i[ 90],mb_cbf_i[ 91],mb_cbf_i[ 94],mb_cbf_i[ 95]};
assign cbf_h3_p	= {mb_cbf_i[ 34],mb_cbf_i[ 35],mb_cbf_i[ 38],mb_cbf_i[ 39],mb_cbf_i[ 50],mb_cbf_i[ 51],mb_cbf_i[ 54],mb_cbf_i[ 55],mb_cbf_i[ 98],mb_cbf_i[ 99],mb_cbf_i[102],mb_cbf_i[103],mb_cbf_i[114],mb_cbf_i[115],mb_cbf_i[118],mb_cbf_i[119]};
assign cbf_h4_p	= {mb_cbf_i[ 42],mb_cbf_i[ 43],mb_cbf_i[ 46],mb_cbf_i[ 47],mb_cbf_i[ 58],mb_cbf_i[ 59],mb_cbf_i[ 62],mb_cbf_i[ 63],mb_cbf_i[106],mb_cbf_i[107],mb_cbf_i[110],mb_cbf_i[111],mb_cbf_i[122],mb_cbf_i[123],mb_cbf_i[126],mb_cbf_i[127]};
assign cbf_h5_p	= {mb_cbf_i[130],mb_cbf_i[131],mb_cbf_i[134],mb_cbf_i[135],mb_cbf_i[146],mb_cbf_i[147],mb_cbf_i[150],mb_cbf_i[151],mb_cbf_i[194],mb_cbf_i[195],mb_cbf_i[198],mb_cbf_i[199],mb_cbf_i[210],mb_cbf_i[211],mb_cbf_i[214],mb_cbf_i[215]};
assign cbf_h6_p	= {mb_cbf_i[138],mb_cbf_i[139],mb_cbf_i[142],mb_cbf_i[143],mb_cbf_i[154],mb_cbf_i[155],mb_cbf_i[158],mb_cbf_i[159],mb_cbf_i[202],mb_cbf_i[203],mb_cbf_i[206],mb_cbf_i[207],mb_cbf_i[218],mb_cbf_i[219],mb_cbf_i[222],mb_cbf_i[223]};
assign cbf_h7_p	= {mb_cbf_i[162],mb_cbf_i[163],mb_cbf_i[166],mb_cbf_i[167],mb_cbf_i[178],mb_cbf_i[179],mb_cbf_i[182],mb_cbf_i[183],mb_cbf_i[226],mb_cbf_i[227],mb_cbf_i[230],mb_cbf_i[231],mb_cbf_i[242],mb_cbf_i[243],mb_cbf_i[246],mb_cbf_i[247]};

assign cbf_h0_q = {mb_cbf_i[  0],mb_cbf_i[  1],mb_cbf_i[  4],mb_cbf_i[  5],mb_cbf_i[ 16],mb_cbf_i[ 17],mb_cbf_i[ 20],mb_cbf_i[ 21],mb_cbf_i[ 64],mb_cbf_i[ 65],mb_cbf_i[ 68],mb_cbf_i[ 69],mb_cbf_i[ 80],mb_cbf_i[ 81],mb_cbf_i[ 84],mb_cbf_i[ 85]};
assign cbf_h1_q = {mb_cbf_i[  8],mb_cbf_i[  9],mb_cbf_i[ 12],mb_cbf_i[ 13],mb_cbf_i[ 24],mb_cbf_i[ 25],mb_cbf_i[ 28],mb_cbf_i[ 29],mb_cbf_i[ 72],mb_cbf_i[ 73],mb_cbf_i[ 76],mb_cbf_i[ 77],mb_cbf_i[ 88],mb_cbf_i[ 89],mb_cbf_i[ 92],mb_cbf_i[ 93]};
assign cbf_h2_q = {mb_cbf_i[ 32],mb_cbf_i[ 33],mb_cbf_i[ 36],mb_cbf_i[ 37],mb_cbf_i[ 48],mb_cbf_i[ 49],mb_cbf_i[ 52],mb_cbf_i[ 53],mb_cbf_i[ 96],mb_cbf_i[ 97],mb_cbf_i[100],mb_cbf_i[101],mb_cbf_i[112],mb_cbf_i[113],mb_cbf_i[116],mb_cbf_i[117]};
assign cbf_h3_q = {mb_cbf_i[ 40],mb_cbf_i[ 41],mb_cbf_i[ 44],mb_cbf_i[ 45],mb_cbf_i[ 56],mb_cbf_i[ 57],mb_cbf_i[ 60],mb_cbf_i[ 61],mb_cbf_i[104],mb_cbf_i[105],mb_cbf_i[108],mb_cbf_i[109],mb_cbf_i[120],mb_cbf_i[121],mb_cbf_i[124],mb_cbf_i[125]};
assign cbf_h4_q = {mb_cbf_i[128],mb_cbf_i[129],mb_cbf_i[132],mb_cbf_i[133],mb_cbf_i[144],mb_cbf_i[145],mb_cbf_i[148],mb_cbf_i[149],mb_cbf_i[192],mb_cbf_i[193],mb_cbf_i[196],mb_cbf_i[197],mb_cbf_i[208],mb_cbf_i[209],mb_cbf_i[212],mb_cbf_i[213]};
assign cbf_h5_q = {mb_cbf_i[136],mb_cbf_i[137],mb_cbf_i[140],mb_cbf_i[141],mb_cbf_i[152],mb_cbf_i[153],mb_cbf_i[156],mb_cbf_i[157],mb_cbf_i[200],mb_cbf_i[201],mb_cbf_i[204],mb_cbf_i[205],mb_cbf_i[216],mb_cbf_i[217],mb_cbf_i[220],mb_cbf_i[221]};
assign cbf_h6_q = {mb_cbf_i[160],mb_cbf_i[161],mb_cbf_i[164],mb_cbf_i[165],mb_cbf_i[176],mb_cbf_i[177],mb_cbf_i[180],mb_cbf_i[181],mb_cbf_i[224],mb_cbf_i[225],mb_cbf_i[228],mb_cbf_i[229],mb_cbf_i[240],mb_cbf_i[241],mb_cbf_i[244],mb_cbf_i[245]};
assign cbf_h7_q = {mb_cbf_i[168],mb_cbf_i[169],mb_cbf_i[172],mb_cbf_i[173],mb_cbf_i[184],mb_cbf_i[185],mb_cbf_i[188],mb_cbf_i[189],mb_cbf_i[232],mb_cbf_i[233],mb_cbf_i[236],mb_cbf_i[237],mb_cbf_i[248],mb_cbf_i[249],mb_cbf_i[252],mb_cbf_i[253]};

assign cbf_chor_left_p =  {cbf_left[0],1'b0,cbf_left[2],1'b0,cbf_left[4],1'b0,cbf_left[6],1'b0,cbf_left[8],1'b0,cbf_left[10],1'b0,cbf_left[12],1'b0,cbf_left[14],1'b0};
assign cbf_chor_left_q =  {cbf_tl     ,1'b0,cbf_left[1],1'b0,cbf_left[3],1'b0,cbf_left[5],1'b0,cbf_left[7],1'b0,cbf_left[9] ,1'b0,cbf_left[11],1'b0,cbf_left[13],1'b0};

assign cbf_yhor_left_p =  {cbf_left[0],cbf_left[2],cbf_left[4],cbf_left[6],cbf_left[8],cbf_left[10],cbf_left[12],cbf_left[14],8'b0};
assign cbf_yhor_left_q =  {cbf_tl     ,cbf_left[1],cbf_left[3],cbf_left[5],cbf_left[7],cbf_left[9] ,cbf_left[11],cbf_left[13],8'b0};

reg       	cbf_p		,	cbf_q		;

reg [7:0]     cbf_cver_p_r	,	cbf_cver_q_r	;                                             
reg [7:0]     cbf_yver_p_r	,	cbf_yver_q_r	;  

reg 	      cbf_cver_p    ,   cbf_cver_q      ;
reg 	      cbf_yver_p    ,   cbf_yver_q      ;

reg [15:0]    cbf_chor_p_r  ,   cbf_chor_q_r    ;
reg [15:0]    cbf_yhor_p_r  ,   cbf_yhor_q_r    ;

reg    		  cbf_chor_p    ,   cbf_chor_q      ;
reg      	  cbf_yhor_p    ,   cbf_yhor_q      ;

//cver
always @*  begin
	case(cnt_i[4:2])   
		4'h0	:begin cbf_cver_p_r =  cbf_v0_p  ; cbf_cver_q_r =  cbf_v0_q  ; end  
		4'h1	:begin cbf_cver_p_r =  cbf_v2_p  ; cbf_cver_q_r =  cbf_v2_q  ; end  
		4'h2	:begin cbf_cver_p_r =  cbf_v4_p  ; cbf_cver_q_r =  cbf_v4_q  ; end  
		4'h3	:begin cbf_cver_p_r =  cbf_v6_p  ; cbf_cver_q_r =  cbf_v6_q  ; end  
		4'h4	:begin cbf_cver_p_r =  cbf_v8_p  ; cbf_cver_q_r =  cbf_v8_q  ; end  
		4'h5	:begin cbf_cver_p_r =  cbf_v10_p ; cbf_cver_q_r =  cbf_v10_q ; end  
		4'h6	:begin cbf_cver_p_r =  cbf_v12_p ; cbf_cver_q_r =  cbf_v12_q ; end  
		4'h7	:begin cbf_cver_p_r =  cbf_v14_p ; cbf_cver_q_r =  cbf_v14_q ; end  
		default	:begin cbf_cver_p_r =  8'd0      ; cbf_cver_q_r =  8'd0      ; end  
	endcase
end

always @* begin
    case(cnt_i[1:0]) 
		2'd0:begin  cbf_cver_p = cbf_cver_p_r[7]  ; cbf_cver_q = cbf_cver_q_r[7];    end
        2'd1:begin  cbf_cver_p = cbf_cver_p_r[5]  ; cbf_cver_q = cbf_cver_q_r[5];    end
        2'd2:begin  cbf_cver_p = cbf_cver_p_r[3]  ; cbf_cver_q = cbf_cver_q_r[3];    end
        2'd3:begin  cbf_cver_p = cbf_cver_p_r[1]  ; cbf_cver_q = cbf_cver_q_r[1];    end
	 default:begin  cbf_cver_p = 1'b0             ; cbf_cver_q = 1'b0           ;    end
	endcase 
end

//chor 
always @* begin
	if(cnt_i[6])   begin
	   cbf_chor_p_r  =  cbf_chor_left_p ;
	   cbf_chor_q_r  =  cbf_chor_left_q ;
	end
	case(cnt_i[4:3])
	    2'b00:begin cbf_chor_p_r = cbf_h0_p ;cbf_chor_q_r = cbf_h1_q ; end
        2'b01:begin cbf_chor_p_r = cbf_h2_p ;cbf_chor_q_r = cbf_h3_q ; end
        2'b10:begin cbf_chor_p_r = cbf_h4_p ;cbf_chor_q_r = cbf_h5_q ; end
        2'b11:begin cbf_chor_p_r = cbf_h6_p ;cbf_chor_q_r = cbf_h7_q ; end
	  default:begin cbf_chor_p_r = 8'b0     ;cbf_chor_q_r = 8'b0   ; end
	endcase
end

always @* begin
    case(cnt_i[2:0])
        3'd0:begin cbf_chor_p = cbf_chor_p_r[15] ; cbf_chor_q = cbf_chor_q_r[15] ; end
        3'd1:begin cbf_chor_p = cbf_chor_p_r[13] ; cbf_chor_q = cbf_chor_q_r[13] ; end
        3'd2:begin cbf_chor_p = cbf_chor_p_r[11] ; cbf_chor_q = cbf_chor_q_r[11] ; end
        3'd3:begin cbf_chor_p = cbf_chor_p_r[9 ] ; cbf_chor_q = cbf_chor_q_r[9 ] ; end
        3'd4:begin cbf_chor_p = cbf_chor_p_r[7 ] ; cbf_chor_q = cbf_chor_q_r[7 ] ; end
        3'd5:begin cbf_chor_p = cbf_chor_p_r[5 ] ; cbf_chor_q = cbf_chor_q_r[5 ] ; end
        3'd6:begin cbf_chor_p = cbf_chor_p_r[3 ] ; cbf_chor_q = cbf_chor_q_r[3 ] ; end
		3'd7:begin cbf_chor_p = cbf_chor_p_r[1 ] ; cbf_chor_q = cbf_chor_q_r[1 ] ; end
	 default:begin cbf_chor_p = 1'b0             ; cbf_chor_q = 1'b0       ; end
    endcase
end

//yver
always @*  begin
    case(cnt_i[6:3]) 
	    4'h0	:begin  cbf_yver_p_r =  cbf_v0_p  ; cbf_yver_q_r = cbf_v0_q ; end
		4'h1	:begin  cbf_yver_p_r =  cbf_v1_p  ; cbf_yver_q_r = cbf_v1_q ; end
		4'h2	:begin  cbf_yver_p_r =  cbf_v2_p  ; cbf_yver_q_r = cbf_v2_q ; end
		4'h3	:begin  cbf_yver_p_r =  cbf_v3_p  ; cbf_yver_q_r = cbf_v3_q ; end
		4'h4	:begin  cbf_yver_p_r =  cbf_v4_p  ; cbf_yver_q_r = cbf_v4_q ; end
		4'h5	:begin  cbf_yver_p_r =  cbf_v5_p  ; cbf_yver_q_r = cbf_v5_q ; end
		4'h6	:begin  cbf_yver_p_r =  cbf_v6_p  ; cbf_yver_q_r = cbf_v6_q ; end
		4'h7	:begin  cbf_yver_p_r =  cbf_v7_p  ; cbf_yver_q_r = cbf_v7_q ; end
		4'h8	:begin  cbf_yver_p_r =  cbf_v8_p  ; cbf_yver_q_r = cbf_v8_q ; end
		4'h9	:begin  cbf_yver_p_r =  cbf_v9_p  ; cbf_yver_q_r = cbf_v9_q ; end
		4'ha	:begin  cbf_yver_p_r =  cbf_v10_p ; cbf_yver_q_r = cbf_v10_q; end
		4'hb	:begin  cbf_yver_p_r =  cbf_v11_p ; cbf_yver_q_r = cbf_v11_q; end
		4'hc    :begin  cbf_yver_p_r =  cbf_v12_p ; cbf_yver_q_r = cbf_v12_q; end
		4'hd	:begin  cbf_yver_p_r =  cbf_v13_p ; cbf_yver_q_r = cbf_v13_q; end
		4'he	:begin  cbf_yver_p_r =  cbf_v14_p ; cbf_yver_q_r = cbf_v14_q; end
        4'hf	:begin  cbf_yver_p_r =  cbf_v15_p ; cbf_yver_q_r = cbf_v15_q; end
        default	:begin  cbf_yver_p_r =  8'b0      ; cbf_yver_q_r = 8'b0     ; end
    endcase
end

always @* begin
    case(cnt_i[2:0])
        3'd0	:begin  cbf_yver_p = cbf_yver_p_r[7] ; cbf_yver_q = cbf_yver_q_r[7] ; end
        3'd1	:begin  cbf_yver_p = cbf_yver_p_r[6] ; cbf_yver_q = cbf_yver_q_r[6] ; end
        3'd2	:begin  cbf_yver_p = cbf_yver_p_r[5] ; cbf_yver_q = cbf_yver_q_r[5] ; end
        3'd3	:begin  cbf_yver_p = cbf_yver_p_r[4] ; cbf_yver_q = cbf_yver_q_r[4] ; end
        3'd4	:begin  cbf_yver_p = cbf_yver_p_r[3] ; cbf_yver_q = cbf_yver_q_r[3] ; end
        3'd5	:begin  cbf_yver_p = cbf_yver_p_r[2] ; cbf_yver_q = cbf_yver_q_r[2] ; end
        3'd6	:begin  cbf_yver_p = cbf_yver_p_r[1] ; cbf_yver_q = cbf_yver_q_r[1] ; end
        3'd7	:begin  cbf_yver_p = cbf_yver_p_r[0] ; cbf_yver_q = cbf_yver_q_r[0] ; end
        default	:begin  cbf_yver_p = 1'b0			 ; cbf_yver_q = 1'b0			; end
    endcase
end
//yhor
always @* begin
    if(cnt_i[7]) begin
		cbf_yhor_p_r = cbf_yhor_left_p ;
	    cbf_yhor_q_r = cbf_yhor_left_q ;
    end
	else  begin
        case(cnt_i[6:4])
            3'd0	:begin  cbf_yhor_p_r = cbf_h0_p ; cbf_yhor_q_r = cbf_h0_q ;end
            3'd1	:begin  cbf_yhor_p_r = cbf_h1_p ; cbf_yhor_q_r = cbf_h1_q ;end
            3'd2	:begin  cbf_yhor_p_r = cbf_h2_p ; cbf_yhor_q_r = cbf_h2_q ;end
            3'd3	:begin  cbf_yhor_p_r = cbf_h3_p ; cbf_yhor_q_r = cbf_h3_q ;end
            3'd4	:begin  cbf_yhor_p_r = cbf_h4_p ; cbf_yhor_q_r = cbf_h4_q ;end
            3'd5	:begin  cbf_yhor_p_r = cbf_h5_p ; cbf_yhor_q_r = cbf_h5_q ;end
            3'd6	:begin  cbf_yhor_p_r = cbf_h6_p ; cbf_yhor_q_r = cbf_h6_q ;end
            3'd7	:begin  cbf_yhor_p_r = cbf_h7_p ; cbf_yhor_q_r = cbf_h7_q ;end
            default	:begin  cbf_yhor_p_r = 15'h0000 ; cbf_yhor_q_r = 15'h0000 ;end
        endcase
    end
end

always @* begin
    case(cnt_i[3:0])
        4'h0	:begin cbf_yhor_p = cbf_yhor_p_r[15] ;cbf_yhor_q = cbf_yhor_q_r[15] ;  end
	    4'h1	:begin cbf_yhor_p = cbf_yhor_p_r[14] ;cbf_yhor_q = cbf_yhor_q_r[14] ;  end
	    4'h2	:begin cbf_yhor_p = cbf_yhor_p_r[13] ;cbf_yhor_q = cbf_yhor_q_r[13] ;  end
	    4'h3	:begin cbf_yhor_p = cbf_yhor_p_r[12] ;cbf_yhor_q = cbf_yhor_q_r[12] ;  end
	    4'h4	:begin cbf_yhor_p = cbf_yhor_p_r[11] ;cbf_yhor_q = cbf_yhor_q_r[11] ;  end
	    4'h5	:begin cbf_yhor_p = cbf_yhor_p_r[10] ;cbf_yhor_q = cbf_yhor_q_r[10] ;  end
	    4'h6	:begin cbf_yhor_p = cbf_yhor_p_r[9 ] ;cbf_yhor_q = cbf_yhor_q_r[9 ] ;  end
	    4'h7	:begin cbf_yhor_p = cbf_yhor_p_r[8 ] ;cbf_yhor_q = cbf_yhor_q_r[8 ] ;  end
	    4'h8	:begin cbf_yhor_p = cbf_yhor_p_r[7 ] ;cbf_yhor_q = cbf_yhor_q_r[7 ] ;  end
	    4'h9	:begin cbf_yhor_p = cbf_yhor_p_r[6 ] ;cbf_yhor_q = cbf_yhor_q_r[6 ] ;  end
	    4'ha	:begin cbf_yhor_p = cbf_yhor_p_r[5 ] ;cbf_yhor_q = cbf_yhor_q_r[5 ] ;  end
	    4'hb	:begin cbf_yhor_p = cbf_yhor_p_r[4 ] ;cbf_yhor_q = cbf_yhor_q_r[4 ] ;  end
	    4'hc    :begin cbf_yhor_p = cbf_yhor_p_r[3 ] ;cbf_yhor_q = cbf_yhor_q_r[3 ] ;  end
	    4'hd	:begin cbf_yhor_p = cbf_yhor_p_r[2 ] ;cbf_yhor_q = cbf_yhor_q_r[2 ] ;  end
	    4'he	:begin cbf_yhor_p = cbf_yhor_p_r[1 ] ;cbf_yhor_q = cbf_yhor_q_r[1 ] ;  end
        4'hf	:begin cbf_yhor_p = cbf_yhor_p_r[0 ] ;cbf_yhor_q = cbf_yhor_q_r[0 ] ;  end
        default	:begin cbf_yhor_p = 1'b0			 ;cbf_yhor_q = 1'b0			    ;  end
    endcase 
end


always @(posedge clk or negedge rst_n) begin
	if(!rst_n)	begin
		cbf_p_o	<=    1'b0	;
		cbf_q_o	<=    1'b0	;
	end
	else begin
		case(state_i)
			CVER:begin cbf_p_o <= cbf_cver_p;cbf_q_o <= cbf_cver_q;end
	        CHOR:begin cbf_p_o <= cbf_chor_p;cbf_q_o <= cbf_chor_q;end
			YVER:begin cbf_p_o <= cbf_yver_p;cbf_q_o <= cbf_yver_q;end
			YHOR:begin cbf_p_o <= cbf_yhor_p;cbf_q_o <= cbf_yhor_q;end
		 default:begin cbf_p_o <= 1'b0      ;cbf_q_o <= 1'b0      ;end	
		endcase
	end
end	

//******************************************************************************************************
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		is_tran_o 	<=	1'b0;
	else begin
		case(state_i)
			YVER:is_tran_o  <= !cnt_i[3]					 ;
			YHOR:is_tran_o	<=  cnt_i[7]	? 1'b0: !cnt_i[0];
			CVER:is_tran_o	<= !cnt_i[2]					 ;
			CHOR:is_tran_o  <=  cnt_i[6]    ? 1'b0: !cnt_i[0];
		 default:is_tran_o  <=  1'b0						 ;
		endcase
	end
end

//----------------------------------------------------------------------------------------------
//
//		qp	modified 
//
//----------------------------------------------------------------------------------------------
//store two qp values and modified flag of every lcu
//modified flag ==1 indicatesthe 8x8 qp is modified 
//input [255:0]		mb_cbf_i        ;// cbf for every 4x4 cu , zig-zag scan order    
//input [255:0]		mb_cbf_u_i      ;// cbf for every 4x4 cu , zig-zag scan order  
//input [255:0]		mb_cbf_v_i      ;// cbf for every 4x4 cu , zig-zag scan order 

wire   [63:0]		qp_flag	        		;//=1 , modified in zig-zag scan order 

wire  [19:0]		qp_top_reg   			;//[5:0] qp_top [11:6]:qp_top_modified [19:12]:qp_top_flag[7:0] 


reg  [5:0]			qp_top   				;
reg  [5:0]			qp_top_modified 		;
reg  [7:0]			qp_top_flag				;

reg   [5:0]			qp_left					;
reg   [5:0]			qp_left_modified		;
reg   [7:0]			qp_left_flag			;

wire    qp_first  =   (mb_x_i || mb_y_i) ? (!(mb_partition_i[0]||mb_cbf_i||mb_cbf_u_i||mb_cbf_v_i))||mb_partition_i[0]:1'b0;

db_qp   udbpq_00(clk , rst_n, mb_cbf_i[0] , mb_cbf_u_i[0] , mb_cbf_v_i[0] ,  qp_first , qp_flag[0]  );// 0
db_qp   udbpq_01(clk , rst_n, mb_cbf_i[4] , mb_cbf_u_i[4] , mb_cbf_v_i[4] , qp_flag[0], qp_flag[1]  );// 1
db_qp   udbpq_10(clk , rst_n, mb_cbf_i[8] , mb_cbf_u_i[8] , mb_cbf_v_i[8] , qp_flag[1], qp_flag[2]  );// 2
db_qp   udbpq_11(clk , rst_n, mb_cbf_i[12], mb_cbf_u_i[12], mb_cbf_v_i[12], qp_flag[2], qp_flag[3]  );// 3
db_qp   udbpq_02(clk , rst_n, mb_cbf_i[16], mb_cbf_u_i[16], mb_cbf_v_i[16], qp_flag[3], qp_flag[4]  );// 4
db_qp   udbpq_03(clk , rst_n, mb_cbf_i[20], mb_cbf_u_i[20], mb_cbf_v_i[20], qp_flag[4], qp_flag[5]  );// 5
db_qp   udbpq_12(clk , rst_n, mb_cbf_i[24], mb_cbf_u_i[24], mb_cbf_v_i[24], qp_flag[5], qp_flag[6]  );// 6
db_qp   udbpq_13(clk , rst_n, mb_cbf_i[28], mb_cbf_u_i[28], mb_cbf_v_i[28], qp_flag[6], qp_flag[7]  );// 7
 
db_qp   udbpq_20(clk , rst_n, mb_cbf_i[32], mb_cbf_u_i[32], mb_cbf_v_i[32], qp_flag[ 7], qp_flag[ 8]);// 8
db_qp   udbpq_21(clk , rst_n, mb_cbf_i[36], mb_cbf_u_i[36], mb_cbf_v_i[36], qp_flag[ 8], qp_flag[ 9]);// 9
db_qp   udbpq_30(clk , rst_n, mb_cbf_i[40], mb_cbf_u_i[40], mb_cbf_v_i[40], qp_flag[ 9], qp_flag[10]);//10
db_qp   udbpq_31(clk , rst_n, mb_cbf_i[44], mb_cbf_u_i[44], mb_cbf_v_i[44], qp_flag[10], qp_flag[11]);//11
db_qp   udbpq_22(clk , rst_n, mb_cbf_i[48], mb_cbf_u_i[48], mb_cbf_v_i[48], qp_flag[11], qp_flag[12]);//12
db_qp   udbpq_23(clk , rst_n, mb_cbf_i[52], mb_cbf_u_i[52], mb_cbf_v_i[52], qp_flag[12], qp_flag[13]);//13
db_qp   udbpq_32(clk , rst_n, mb_cbf_i[56], mb_cbf_u_i[56], mb_cbf_v_i[56], qp_flag[13], qp_flag[14]);//14
db_qp   udbpq_33(clk , rst_n, mb_cbf_i[60], mb_cbf_u_i[60], mb_cbf_v_i[60], qp_flag[14], qp_flag[15]);//15

db_qp   udbpq_04(clk , rst_n, mb_cbf_i[64], mb_cbf_u_i[64], mb_cbf_v_i[64], qp_flag[15], qp_flag[16]);//16
db_qp   udbpq_05(clk , rst_n, mb_cbf_i[68], mb_cbf_u_i[68], mb_cbf_v_i[68], qp_flag[16], qp_flag[17]);//17
db_qp   udbpq_14(clk , rst_n, mb_cbf_i[72], mb_cbf_u_i[72], mb_cbf_v_i[72], qp_flag[17], qp_flag[18]);//18
db_qp   udbpq_15(clk , rst_n, mb_cbf_i[76], mb_cbf_u_i[76], mb_cbf_v_i[76], qp_flag[18], qp_flag[19]);//19
db_qp   udbpq_06(clk , rst_n, mb_cbf_i[80], mb_cbf_u_i[80], mb_cbf_v_i[80], qp_flag[19], qp_flag[20]);//20
db_qp   udbpq_07(clk , rst_n, mb_cbf_i[84], mb_cbf_u_i[84], mb_cbf_v_i[84], qp_flag[20], qp_flag[21]);//21
db_qp   udbpq_16(clk , rst_n, mb_cbf_i[88], mb_cbf_u_i[88], mb_cbf_v_i[88], qp_flag[21], qp_flag[22]);//22
db_qp   udbpq_17(clk , rst_n, mb_cbf_i[92], mb_cbf_u_i[92], mb_cbf_v_i[92], qp_flag[22], qp_flag[23]);//23

db_qp   udbpq_24(clk , rst_n, mb_cbf_i[ 96], mb_cbf_u_i[ 96], mb_cbf_v_i[ 96], qp_flag[23], qp_flag[24]);//24
db_qp   udbpq_25(clk , rst_n, mb_cbf_i[100], mb_cbf_u_i[100], mb_cbf_v_i[100], qp_flag[24], qp_flag[25]);//25
db_qp   udbpq_34(clk , rst_n, mb_cbf_i[104], mb_cbf_u_i[104], mb_cbf_v_i[104], qp_flag[25], qp_flag[26]);//26
db_qp   udbpq_35(clk , rst_n, mb_cbf_i[108], mb_cbf_u_i[108], mb_cbf_v_i[108], qp_flag[26], qp_flag[27]);//27
db_qp   udbpq_26(clk , rst_n, mb_cbf_i[112], mb_cbf_u_i[112], mb_cbf_v_i[112], qp_flag[27], qp_flag[28]);//28
db_qp   udbpq_27(clk , rst_n, mb_cbf_i[116], mb_cbf_u_i[116], mb_cbf_v_i[116], qp_flag[28], qp_flag[29]);//29
db_qp   udbpq_36(clk , rst_n, mb_cbf_i[120], mb_cbf_u_i[120], mb_cbf_v_i[120], qp_flag[29], qp_flag[30]);//30
db_qp   udbpq_37(clk , rst_n, mb_cbf_i[124], mb_cbf_u_i[124], mb_cbf_v_i[124], qp_flag[30], qp_flag[31]);//31

db_qp   udbpq_40(clk , rst_n, mb_cbf_i[128], mb_cbf_u_i[128], mb_cbf_v_i[128], qp_flag[31], qp_flag[32]);//32
db_qp   udbpq_41(clk , rst_n, mb_cbf_i[132], mb_cbf_u_i[132], mb_cbf_v_i[132], qp_flag[32], qp_flag[33]);//33
db_qp   udbpq_50(clk , rst_n, mb_cbf_i[136], mb_cbf_u_i[136], mb_cbf_v_i[136], qp_flag[33], qp_flag[34]);//34
db_qp   udbpq_51(clk , rst_n, mb_cbf_i[140], mb_cbf_u_i[140], mb_cbf_v_i[140], qp_flag[34], qp_flag[35]);//35
db_qp   udbpq_42(clk , rst_n, mb_cbf_i[144], mb_cbf_u_i[144], mb_cbf_v_i[144], qp_flag[35], qp_flag[36]);//36
db_qp   udbpq_43(clk , rst_n, mb_cbf_i[148], mb_cbf_u_i[148], mb_cbf_v_i[148], qp_flag[36], qp_flag[37]);//37
db_qp   udbpq_52(clk , rst_n, mb_cbf_i[152], mb_cbf_u_i[152], mb_cbf_v_i[152], qp_flag[37], qp_flag[38]);//38
db_qp   udbpq_53(clk , rst_n, mb_cbf_i[156], mb_cbf_u_i[156], mb_cbf_v_i[156], qp_flag[38], qp_flag[39]);//39
 
db_qp   udbpq_60(clk , rst_n, mb_cbf_i[160], mb_cbf_u_i[160], mb_cbf_v_i[160], qp_flag[39], qp_flag[40]);//40
db_qp   udbpq_61(clk , rst_n, mb_cbf_i[164], mb_cbf_u_i[164], mb_cbf_v_i[164], qp_flag[40], qp_flag[41]);//41
db_qp   udbpq_70(clk , rst_n, mb_cbf_i[168], mb_cbf_u_i[168], mb_cbf_v_i[168], qp_flag[41], qp_flag[42]);//42
db_qp   udbpq_71(clk , rst_n, mb_cbf_i[172], mb_cbf_u_i[172], mb_cbf_v_i[172], qp_flag[42], qp_flag[43]);//43
db_qp   udbpq_62(clk , rst_n, mb_cbf_i[176], mb_cbf_u_i[176], mb_cbf_v_i[176], qp_flag[43], qp_flag[44]);//44
db_qp   udbpq_63(clk , rst_n, mb_cbf_i[180], mb_cbf_u_i[180], mb_cbf_v_i[180], qp_flag[44], qp_flag[45]);//45
db_qp   udbpq_72(clk , rst_n, mb_cbf_i[184], mb_cbf_u_i[184], mb_cbf_v_i[184], qp_flag[45], qp_flag[46]);//46
db_qp   udbpq_73(clk , rst_n, mb_cbf_i[188], mb_cbf_u_i[188], mb_cbf_v_i[188], qp_flag[46], qp_flag[47]);//47

db_qp   udbpq_44(clk , rst_n, mb_cbf_i[192], mb_cbf_u_i[192], mb_cbf_v_i[192], qp_flag[47], qp_flag[48]);//48
db_qp   udbpq_45(clk , rst_n, mb_cbf_i[196], mb_cbf_u_i[196], mb_cbf_v_i[196], qp_flag[48], qp_flag[49]);//49
db_qp   udbpq_54(clk , rst_n, mb_cbf_i[200], mb_cbf_u_i[200], mb_cbf_v_i[200], qp_flag[49], qp_flag[50]);//50
db_qp   udbpq_55(clk , rst_n, mb_cbf_i[204], mb_cbf_u_i[204], mb_cbf_v_i[204], qp_flag[50], qp_flag[51]);//51
db_qp   udbpq_46(clk , rst_n, mb_cbf_i[208], mb_cbf_u_i[208], mb_cbf_v_i[208], qp_flag[51], qp_flag[52]);//52
db_qp   udbpq_47(clk , rst_n, mb_cbf_i[212], mb_cbf_u_i[212], mb_cbf_v_i[212], qp_flag[52], qp_flag[53]);//53
db_qp   udbpq_56(clk , rst_n, mb_cbf_i[216], mb_cbf_u_i[216], mb_cbf_v_i[216], qp_flag[53], qp_flag[54]);//54
db_qp   udbpq_57(clk , rst_n, mb_cbf_i[220], mb_cbf_u_i[220], mb_cbf_v_i[220], qp_flag[54], qp_flag[55]);//55

db_qp   udbpq_64(clk , rst_n, mb_cbf_i[224], mb_cbf_u_i[224], mb_cbf_v_i[224], qp_flag[55], qp_flag[56]);//56
db_qp   udbpq_65(clk , rst_n, mb_cbf_i[228], mb_cbf_u_i[228], mb_cbf_v_i[228], qp_flag[56], qp_flag[57]);//57
db_qp   udbpq_74(clk , rst_n, mb_cbf_i[232], mb_cbf_u_i[232], mb_cbf_v_i[232], qp_flag[57], qp_flag[58]);//58
db_qp   udbpq_75(clk , rst_n, mb_cbf_i[236], mb_cbf_u_i[236], mb_cbf_v_i[236], qp_flag[58], qp_flag[59]);//59
db_qp   udbpq_66(clk , rst_n, mb_cbf_i[240], mb_cbf_u_i[240], mb_cbf_v_i[240], qp_flag[59], qp_flag[60]);//60
db_qp   udbpq_67(clk , rst_n, mb_cbf_i[244], mb_cbf_u_i[244], mb_cbf_v_i[244], qp_flag[60], qp_flag[61]);//61
db_qp   udbpq_76(clk , rst_n, mb_cbf_i[248], mb_cbf_u_i[248], mb_cbf_v_i[248], qp_flag[61], qp_flag[62]);//62
db_qp   udbpq_77(clk , rst_n, mb_cbf_i[252], mb_cbf_u_i[252], mb_cbf_v_i[252], qp_flag[62], qp_flag[63]);//63


always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		qp_left_flag	<=	8'b0;	
	else  if(state_i==OUT)
		qp_left_flag	<=	{qp_flag[21],qp_flag[23],qp_flag[29],qp_flag[31],qp_flag[53],qp_flag[55],qp_flag[61],qp_flag[63]};
	else
		qp_left_flag	<=	qp_left_flag	;
end

always @(posedge clk or negedge rst_n)	begin
	if(!rst_n) begin
		qp_left				<=	6'd0;
		qp_left_modified	<=	6'd0;
	end
	else if(state_i==OUT&&!cnt_i) begin
		qp_left_modified	<=	qp_left	     ;
	    qp_left			   <=	qp_flag[63] ? qp_left:qp_i	;
	end
    else begin  
		qp_left				<=  qp_left			 ;
        qp_left_modified	<=  qp_left_modified ;
	end
end

wire       					 qp_ram_cen_w     ;//chip  enable ,low active
wire       					 qp_ram_oen_w     ;//read  enable ,low active
wire       					 qp_ram_wen_w     ;//write enable ,low active
wire  [`PIC_X_WIDTH-1:0]     qp_ram_addr_w    ;//address 
wire  [19:0]      			 qp_ram_data_o    ;//data output

reg							 qp_ram_oen_r     ;//read  enable ,low active 

assign qp_ram_cen_w = state_i == LOAD || state_i ==OUT ? 1'b0 : 1'b1;
assign qp_ram_oen_w = state_i == LOAD && !cnt_i        ? 1'b0 : 1'b1;
assign qp_ram_wen_w = state_i == OUT  && !cnt_i        ? 1'b0 : 1'b1;
assign qp_ram_addr_w= mb_x_i										;



db_qp_ram udbqpram(
						.clk   (clk   		     ),
						.cen_i (  qp_ram_cen_w   ),
						.oen_i (  qp_ram_oen_r   ),
						.wen_i (  qp_ram_wen_w   ),
						.addr_i(  qp_ram_addr_w  ),
						.data_i(  qp_top_reg     ),		
						.data_o(  qp_ram_data_o  )	        
					);
					
always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		qp_ram_oen_r	<=	1'b0			;
	else
		qp_ram_oen_r	<=	qp_ram_oen_w	;		
end					

assign  qp_top_reg		 =	{qp_flag[63],qp_flag[62],qp_flag[59],qp_flag[58],qp_flag[47],qp_flag[46],qp_flag[43],qp_flag[42],qp_left,qp_i};

always @(posedge clk or negedge rst_n) begin 
    if(!rst_n) begin 
        qp_top   		 <=  6'd0  ;
	    qp_top_modified  <=  6'd0  ;
	    qp_top_flag		 <=  8'd0  ;
    end 
	else if(!qp_ram_oen_r) begin 
        qp_top   		 <=  qp_ram_data_o[5:0]   ;
        qp_top_modified  <=	 qp_ram_data_o[11:6]  ;
        qp_top_flag		 <=	 qp_ram_data_o[19:12] ;
	end 
end 

/*
assign  qp_top   		 =  qp_ram_oen_r  ? qp_top 		   :qp_ram_data_o[5:0]   ;
assign  qp_top_modified  =  qp_ram_oen_r  ? qp_top_modified:qp_ram_data_o[11:6]  ;
assign  qp_top_flag		 =  qp_ram_oen_r  ? qp_top_flag    :qp_ram_data_o[19:12] ;
*/
 
wire [7:0] qp_flag_v0_p  , qp_flag_v0_q	; 
wire [7:0] qp_flag_v1_p  , qp_flag_v1_q	; 
wire [7:0] qp_flag_v2_p  , qp_flag_v2_q	; 
wire [7:0] qp_flag_v3_p  , qp_flag_v3_q	; 
wire [7:0] qp_flag_v4_p  , qp_flag_v4_q	; 
wire [7:0] qp_flag_v5_p  , qp_flag_v5_q	; 
wire [7:0] qp_flag_v6_p  , qp_flag_v6_q	; 
wire [7:0] qp_flag_v7_p  , qp_flag_v7_q	; 

wire [7:0] qp_left_flag_hor_p, qp_left_flag_hor_q;
wire [7:0] qp_left_flag_chor_p, qp_left_flag_chor_q;


assign  qp_flag_v0_p = {qp_left_flag[7],qp_flag[ 0],qp_flag[ 1],qp_flag[ 4],qp_flag[ 5],qp_flag[16],qp_flag[17],qp_flag[20]};
assign  qp_flag_v1_p = {qp_left_flag[6],qp_flag[ 2],qp_flag[ 3],qp_flag[ 6],qp_flag[ 7],qp_flag[18],qp_flag[19],qp_flag[22]};
assign  qp_flag_v2_p = {qp_left_flag[5],qp_flag[ 8],qp_flag[ 9],qp_flag[12],qp_flag[13],qp_flag[24],qp_flag[25],qp_flag[28]};
assign  qp_flag_v3_p = {qp_left_flag[4],qp_flag[10],qp_flag[11],qp_flag[14],qp_flag[15],qp_flag[26],qp_flag[27],qp_flag[30]};
assign  qp_flag_v4_p = {qp_left_flag[3],qp_flag[32],qp_flag[33],qp_flag[36],qp_flag[37],qp_flag[48],qp_flag[49],qp_flag[52]};
assign  qp_flag_v5_p = {qp_left_flag[2],qp_flag[34],qp_flag[35],qp_flag[38],qp_flag[39],qp_flag[50],qp_flag[51],qp_flag[54]};
assign  qp_flag_v6_p = {qp_left_flag[1],qp_flag[40],qp_flag[41],qp_flag[44],qp_flag[45],qp_flag[56],qp_flag[57],qp_flag[60]};
assign  qp_flag_v7_p = {qp_left_flag[0],qp_flag[42],qp_flag[43],qp_flag[46],qp_flag[47],qp_flag[58],qp_flag[59],qp_flag[62]};

assign qp_flag_v0_q	 = {qp_flag[  0],qp_flag[ 1],qp_flag[ 4],qp_flag[ 5],qp_flag[16],qp_flag[17],qp_flag[20],qp_flag[21]};
assign qp_flag_v1_q	 = {qp_flag[  2],qp_flag[ 3],qp_flag[ 6],qp_flag[ 7],qp_flag[18],qp_flag[19],qp_flag[22],qp_flag[23]};
assign qp_flag_v2_q	 = {qp_flag[  8],qp_flag[ 9],qp_flag[12],qp_flag[13],qp_flag[24],qp_flag[25],qp_flag[28],qp_flag[29]};
assign qp_flag_v3_q	 = {qp_flag[ 10],qp_flag[11],qp_flag[14],qp_flag[15],qp_flag[26],qp_flag[27],qp_flag[30],qp_flag[31]};
assign qp_flag_v4_q	 = {qp_flag[ 32],qp_flag[33],qp_flag[36],qp_flag[37],qp_flag[48],qp_flag[49],qp_flag[52],qp_flag[53]};
assign qp_flag_v5_q	 = {qp_flag[ 34],qp_flag[35],qp_flag[38],qp_flag[39],qp_flag[50],qp_flag[51],qp_flag[54],qp_flag[55]};
assign qp_flag_v6_q	 = {qp_flag[ 40],qp_flag[41],qp_flag[44],qp_flag[45],qp_flag[56],qp_flag[57],qp_flag[60],qp_flag[61]};
assign qp_flag_v7_q	 = {qp_flag[ 42],qp_flag[43],qp_flag[46],qp_flag[47],qp_flag[58],qp_flag[59],qp_flag[62],qp_flag[63]};


wire [7:0]  qp_flag_h0	; 
wire [7:0]  qp_flag_h1	; 
wire [7:0]  qp_flag_h2	; 
wire [7:0]  qp_flag_h3	; 
wire [7:0]  qp_flag_h4	; 
wire [7:0]  qp_flag_h5	; 
wire [7:0]  qp_flag_h6	; 
wire [7:0]  qp_flag_h7	; 
wire [7:0]  qp_flag_h8	;

assign qp_flag_h0	= {qp_top_flag[0 ],qp_top_flag[1 ],qp_top_flag[2 ],qp_top_flag[3 ],qp_top_flag[4 ],qp_top_flag[5 ],qp_top_flag[6 ],qp_top_flag[7 ]} ;
assign qp_flag_h1	= {qp_flag[ 0],qp_flag[ 1],qp_flag[ 4],qp_flag[ 5],qp_flag[16],qp_flag[17],qp_flag[20],qp_flag[21]};
assign qp_flag_h2	= {qp_flag[ 2],qp_flag[ 3],qp_flag[ 6],qp_flag[ 7],qp_flag[18],qp_flag[19],qp_flag[22],qp_flag[23]};
assign qp_flag_h3	= {qp_flag[ 8],qp_flag[ 9],qp_flag[12],qp_flag[13],qp_flag[24],qp_flag[25],qp_flag[28],qp_flag[29]};
assign qp_flag_h4	= {qp_flag[10],qp_flag[11],qp_flag[14],qp_flag[15],qp_flag[26],qp_flag[27],qp_flag[30],qp_flag[31]};
assign qp_flag_h5	= {qp_flag[32],qp_flag[33],qp_flag[36],qp_flag[37],qp_flag[48],qp_flag[49],qp_flag[52],qp_flag[53]};
assign qp_flag_h6	= {qp_flag[34],qp_flag[35],qp_flag[38],qp_flag[39],qp_flag[50],qp_flag[51],qp_flag[54],qp_flag[55]};
assign qp_flag_h7	= {qp_flag[40],qp_flag[41],qp_flag[44],qp_flag[45],qp_flag[56],qp_flag[57],qp_flag[60],qp_flag[61]};
assign qp_flag_h8	= {qp_flag[42],qp_flag[43],qp_flag[46],qp_flag[47],qp_flag[58],qp_flag[59],qp_flag[62],qp_flag[63]};

assign qp_left_flag_hor_p = {1'b0,qp_left_flag[6:0]};
assign qp_left_flag_hor_q = qp_left_flag;


reg [7:0]     qp_flag_yver_p_r	,	qp_flag_yver_q_r	; 
reg [7:0]     qp_flag_yhor_p_r	,	qp_flag_yhor_q_r	;
reg [7:0]     qp_flag_cver_p_r	,	qp_flag_cver_q_r	;
reg [7:0]     qp_flag_chor_p_r	,	qp_flag_chor_q_r	;

reg  		  qp_flag_yver_p	,	qp_flag_yver_q		; 
reg  		  qp_flag_yhor_p	,	qp_flag_yhor_q		;
reg  		  qp_flag_cver_p	,	qp_flag_cver_q		;
reg  		  qp_flag_chor_p	,	qp_flag_chor_q		;
//yver
always @* begin
	case(cnt_i[6:4])
		3'd0: begin qp_flag_yver_p_r =  qp_flag_v0_p;qp_flag_yver_q_r = qp_flag_v0_q;end
		3'd1: begin qp_flag_yver_p_r =  qp_flag_v1_p;qp_flag_yver_q_r = qp_flag_v1_q;end
		3'd2: begin qp_flag_yver_p_r =  qp_flag_v2_p;qp_flag_yver_q_r = qp_flag_v2_q;end
		3'd3: begin qp_flag_yver_p_r =  qp_flag_v3_p;qp_flag_yver_q_r = qp_flag_v3_q;end
		3'd4: begin qp_flag_yver_p_r =  qp_flag_v4_p;qp_flag_yver_q_r = qp_flag_v4_q;end
		3'd5: begin qp_flag_yver_p_r =  qp_flag_v5_p;qp_flag_yver_q_r = qp_flag_v5_q;end
		3'd6: begin qp_flag_yver_p_r =  qp_flag_v6_p;qp_flag_yver_q_r = qp_flag_v6_q;end
		3'd7: begin qp_flag_yver_p_r =  qp_flag_v7_p;qp_flag_yver_q_r = qp_flag_v7_q;end
	 default: begin qp_flag_yver_p_r =  8'd0		;qp_flag_yver_q_r = 8'd0		;end
    endcase
end

always @* begin 
	case(cnt_i[2:0])
       	3'd0: begin qp_flag_yver_p = qp_flag_yver_p_r[7];qp_flag_yver_q = qp_flag_yver_q_r[7]; end
       	3'd1: begin qp_flag_yver_p = qp_flag_yver_p_r[6];qp_flag_yver_q = qp_flag_yver_q_r[6]; end
       	3'd2: begin qp_flag_yver_p = qp_flag_yver_p_r[5];qp_flag_yver_q = qp_flag_yver_q_r[5]; end
       	3'd3: begin qp_flag_yver_p = qp_flag_yver_p_r[4];qp_flag_yver_q = qp_flag_yver_q_r[4]; end
       	3'd4: begin qp_flag_yver_p = qp_flag_yver_p_r[3];qp_flag_yver_q = qp_flag_yver_q_r[3]; end
       	3'd5: begin qp_flag_yver_p = qp_flag_yver_p_r[2];qp_flag_yver_q = qp_flag_yver_q_r[2]; end
		3'd6: begin qp_flag_yver_p = qp_flag_yver_p_r[1];qp_flag_yver_q = qp_flag_yver_q_r[1]; end
	   	3'd7: begin qp_flag_yver_p = qp_flag_yver_p_r[0];qp_flag_yver_q = qp_flag_yver_q_r[0]; end
     default: begin qp_flag_yver_p = 1'b0               ;qp_flag_yver_q = 1'b0               ; end
    endcase	
end		

//yhor 
always @* begin
	case(cnt_i[6:4])
	  	3'd0:begin qp_flag_yhor_p_r = qp_flag_h0;qp_flag_yhor_q_r = qp_flag_h1;end
	  	3'd1:begin qp_flag_yhor_p_r = qp_flag_h1;qp_flag_yhor_q_r = qp_flag_h2;end
	  	3'd2:begin qp_flag_yhor_p_r = qp_flag_h2;qp_flag_yhor_q_r = qp_flag_h3;end
	  	3'd3:begin qp_flag_yhor_p_r = qp_flag_h3;qp_flag_yhor_q_r = qp_flag_h4;end
	  	3'd4:begin qp_flag_yhor_p_r = qp_flag_h4;qp_flag_yhor_q_r = qp_flag_h5;end
	  	3'd5:begin qp_flag_yhor_p_r = qp_flag_h5;qp_flag_yhor_q_r = qp_flag_h6;end
        3'd6:begin qp_flag_yhor_p_r = qp_flag_h6;qp_flag_yhor_q_r = qp_flag_h7;end
        3'd7:begin qp_flag_yhor_p_r = qp_flag_h7;qp_flag_yhor_q_r = qp_flag_h8;end
     default:begin qp_flag_yhor_p_r = 8'd0	  ;qp_flag_yhor_q_r = 8'd0      ;end
    endcase	
end

always @* begin
	if(cnt_i[7])  begin//left
		case(cnt_i[2:0])
			3'd0:begin qp_flag_yhor_p = qp_left_flag_hor_p[7];qp_flag_yhor_q = qp_left_flag_hor_q[7];end
			3'd1:begin qp_flag_yhor_p = qp_left_flag_hor_p[6];qp_flag_yhor_q = qp_left_flag_hor_q[6];end
			3'd2:begin qp_flag_yhor_p = qp_left_flag_hor_p[5];qp_flag_yhor_q = qp_left_flag_hor_q[5];end
			3'd3:begin qp_flag_yhor_p = qp_left_flag_hor_p[4];qp_flag_yhor_q = qp_left_flag_hor_q[4];end
			3'd4:begin qp_flag_yhor_p = qp_left_flag_hor_p[3];qp_flag_yhor_q = qp_left_flag_hor_q[3];end
			3'd5:begin qp_flag_yhor_p = qp_left_flag_hor_p[2];qp_flag_yhor_q = qp_left_flag_hor_q[2];end
			3'd6:begin qp_flag_yhor_p = qp_left_flag_hor_p[1];qp_flag_yhor_q = qp_left_flag_hor_q[1];end
			3'd7:begin qp_flag_yhor_p = qp_left_flag_hor_p[0];qp_flag_yhor_q = qp_left_flag_hor_q[0];end
		 default:begin qp_flag_yhor_p = 1'b0				 ;qp_flag_yhor_q = 1'b0				    ;end
		endcase	
	end
	else begin
		case(cnt_i[3:1])
	    	3'd0:begin qp_flag_yhor_p = qp_flag_yhor_p_r[7];qp_flag_yhor_q = qp_flag_yhor_q_r[7];end
	    	3'd1:begin qp_flag_yhor_p = qp_flag_yhor_p_r[6];qp_flag_yhor_q = qp_flag_yhor_q_r[6];end
        	3'd2:begin qp_flag_yhor_p = qp_flag_yhor_p_r[5];qp_flag_yhor_q = qp_flag_yhor_q_r[5];end
        	3'd3:begin qp_flag_yhor_p = qp_flag_yhor_p_r[4];qp_flag_yhor_q = qp_flag_yhor_q_r[4];end
        	3'd4:begin qp_flag_yhor_p = qp_flag_yhor_p_r[3];qp_flag_yhor_q = qp_flag_yhor_q_r[3];end
			3'd5:begin qp_flag_yhor_p = qp_flag_yhor_p_r[2];qp_flag_yhor_q = qp_flag_yhor_q_r[2];end
			3'd6:begin qp_flag_yhor_p = qp_flag_yhor_p_r[1];qp_flag_yhor_q = qp_flag_yhor_q_r[1];end
			3'd7:begin qp_flag_yhor_p = qp_flag_yhor_p_r[0];qp_flag_yhor_q = qp_flag_yhor_q_r[0];end
		 default:begin qp_flag_yhor_p = 1'b0               ;qp_flag_yhor_q = 1'b0               ;end
		endcase	
    end
end
//cver 
always @* begin	
	case(cnt_i[4:2])
		3'd0:begin qp_flag_cver_p_r = qp_flag_v0_p; qp_flag_cver_q_r = qp_flag_v0_q;end
		3'd1:begin qp_flag_cver_p_r = qp_flag_v1_p; qp_flag_cver_q_r = qp_flag_v1_q;end
		3'd2:begin qp_flag_cver_p_r = qp_flag_v2_p; qp_flag_cver_q_r = qp_flag_v2_q;end
		3'd3:begin qp_flag_cver_p_r = qp_flag_v3_p; qp_flag_cver_q_r = qp_flag_v3_q;end
		3'd4:begin qp_flag_cver_p_r = qp_flag_v4_p; qp_flag_cver_q_r = qp_flag_v4_q;end
		3'd5:begin qp_flag_cver_p_r = qp_flag_v5_p; qp_flag_cver_q_r = qp_flag_v5_q;end
		3'd6:begin qp_flag_cver_p_r = qp_flag_v6_p; qp_flag_cver_q_r = qp_flag_v6_q;end
		3'd7:begin qp_flag_cver_p_r = qp_flag_v7_p; qp_flag_cver_q_r = qp_flag_v7_q;end
	 default:begin qp_flag_cver_p_r = 8'd0        ; qp_flag_cver_q_r = 8'd0        ;end
	endcase 
end
	
always @* begin	
	case(cnt_i[1:0])
		2'd0: begin qp_flag_cver_p = qp_flag_cver_p_r[7]; qp_flag_cver_q = qp_flag_cver_q_r[7];end 
		2'd1: begin qp_flag_cver_p = qp_flag_cver_p_r[5]; qp_flag_cver_q = qp_flag_cver_q_r[5];end 
		2'd2: begin qp_flag_cver_p = qp_flag_cver_p_r[3]; qp_flag_cver_q = qp_flag_cver_q_r[3];end 
		2'd3: begin qp_flag_cver_p = qp_flag_cver_p_r[1]; qp_flag_cver_q = qp_flag_cver_q_r[1];end 
	 default: begin qp_flag_cver_p = 1'b0               ; qp_flag_cver_q = 1'b0               ;end 
	endcase	
end
	
//chor 	
always @* begin	
	case(cnt_i[4:3])
		2'd0:begin qp_flag_chor_p_r = qp_flag_h0; qp_flag_chor_q_r = qp_flag_h1;   end 
	    2'd1:begin qp_flag_chor_p_r = qp_flag_h2; qp_flag_chor_q_r = qp_flag_h3;   end 
	    2'd2:begin qp_flag_chor_p_r = qp_flag_h4; qp_flag_chor_q_r = qp_flag_h5;   end 
        2'd3:begin qp_flag_chor_p_r = qp_flag_h6; qp_flag_chor_q_r = qp_flag_h7;   end
	 default:begin qp_flag_chor_p_r = 8'd0      ; qp_flag_chor_q_r = 8'd0      ;   end 
	endcase
end
	
always @* begin	
	if(cnt_i[6]) begin//left 
        case(cnt_i[1:0])
			2'd0:begin qp_flag_chor_p = qp_left_flag_hor_p[7]; qp_flag_chor_q = qp_left_flag_hor_q[7]; end
			2'd1:begin qp_flag_chor_p = qp_left_flag_hor_p[5]; qp_flag_chor_q = qp_left_flag_hor_q[5]; end
			2'd2:begin qp_flag_chor_p = qp_left_flag_hor_p[3]; qp_flag_chor_q = qp_left_flag_hor_q[3]; end
			2'd3:begin qp_flag_chor_p = qp_left_flag_hor_p[1]; qp_flag_chor_q = qp_left_flag_hor_q[1]; end
		 default:begin qp_flag_chor_p = 1'b0				 ; qp_flag_chor_q = 1'b0; end
        endcase
	end
   else begin
		case(cnt_i[2:0])
			3'd0:begin qp_flag_chor_p = qp_flag_chor_p_r[7];qp_flag_chor_q = qp_flag_chor_q_r[7];  end
			3'd1:begin qp_flag_chor_p = qp_flag_chor_p_r[6];qp_flag_chor_q = qp_flag_chor_q_r[6];  end
			3'd2:begin qp_flag_chor_p = qp_flag_chor_p_r[5];qp_flag_chor_q = qp_flag_chor_q_r[5];  end
			3'd3:begin qp_flag_chor_p = qp_flag_chor_p_r[4];qp_flag_chor_q = qp_flag_chor_q_r[4];  end
			3'd4:begin qp_flag_chor_p = qp_flag_chor_p_r[3];qp_flag_chor_q = qp_flag_chor_q_r[3];  end
			3'd5:begin qp_flag_chor_p = qp_flag_chor_p_r[2];qp_flag_chor_q = qp_flag_chor_q_r[2];  end
			3'd6:begin qp_flag_chor_p = qp_flag_chor_p_r[1];qp_flag_chor_q = qp_flag_chor_q_r[1];  end
			3'd7:begin qp_flag_chor_p = qp_flag_chor_p_r[0];qp_flag_chor_q = qp_flag_chor_q_r[0];  end
	     default:begin qp_flag_chor_p = 1'b0			    ;qp_flag_chor_q = 1'b0			    ;  end
		endcase
	end
end
		
//******************************************************************************************************
//                                             
//    					select qp
//                                             
//******************************************************************************************************
reg 	[5:0]   cver_qp_p  ,	cver_qp_q	 ;
reg 	[5:0]   chor_qp_p  ,	chor_qp_q	 ;
reg 	[5:0]   yver_qp_p  ,	yver_qp_q	 ;
reg 	[5:0]   yhor_qp_p  ,	yhor_qp_q	 ;

wire     [5:0]   qp_tl      ;

assign  qp_tl	=	qp_top_flag[7] ? qp_top_modified:qp_top;


always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		qp_p_o <= 6'd0;
		qp_q_o <= 6'd0;
	end
	else begin
		case(state_i)
			CVER:begin qp_p_o <= cver_qp_p;qp_q_o <= cver_qp_q;end
			CHOR:begin qp_p_o <= chor_qp_p;qp_q_o <= chor_qp_q;end
			YVER:begin qp_p_o <= yver_qp_p;qp_q_o <= yver_qp_q;end
			YHOR:begin qp_p_o <= yhor_qp_p;qp_q_o <= yhor_qp_q;end
	     default:begin qp_p_o <= 5'b0     ;qp_q_o <= 5'b0     ;end	
		endcase
	end
end	

//cver
always @* begin
	if(cnt_i[1:0])	begin 
		cver_qp_p	=	qp_flag_cver_p ? qp_left :qp_i	      ;
		cver_qp_q   =   qp_flag_cver_q ? qp_left :qp_i	      ;
	end
    else            begin	 // 4 8 12 16 20 24 28 32 36 ....
		cver_qp_p	=	qp_flag_cver_p ? qp_left_modified :qp_left;
		cver_qp_q   =   qp_flag_cver_q ? qp_left      :qp_i	  ;

	end
end
//chor
always @* begin
	if(cnt_i[6]&&cnt_i[1:0])		begin //left 
		chor_qp_p	=	qp_flag_chor_p ? qp_left_modified:qp_left;
		chor_qp_q   =   qp_flag_chor_q ? qp_left_modified:qp_left;
	end  	
	else if(cnt_i[6]) begin
		chor_qp_p	=	qp_tl	 ;
		chor_qp_q   =   qp_flag_chor_p ? qp_left_modified:qp_left;	
	
	end
    else if(cnt_i[4:3])	begin 
		chor_qp_p	=	qp_flag_chor_p ? qp_left :qp_i	      ;
		chor_qp_q   =   qp_flag_chor_q ? qp_left :qp_i	      ;
	end
	else 				begin // 0-7 and  32-39
		chor_qp_p	=	qp_flag_chor_p ? qp_top_modified :qp_top   ;
		chor_qp_q   =   qp_flag_chor_q ? qp_left     :qp_i	  ;
	end
end

//yver
always @* begin
	if(cnt_i[2:0])	begin 
		yver_qp_p	=	qp_flag_yver_p ? qp_left :qp_i	      ;
		yver_qp_q   =   qp_flag_yver_q ? qp_left :qp_i	      ;
	end
    else            begin	 //0  8  16  24  32  ....
		yver_qp_p	=	qp_flag_yver_p ? qp_left_modified:qp_left  ;
		yver_qp_q   =   qp_flag_yver_q ? qp_left      :qp_i	  ;

	end
end
//yhor
always @* begin
	if(cnt_i[7]&&cnt_i[2:0])		begin //left 
		yhor_qp_p	=	qp_flag_yhor_p ? qp_left_modified:qp_left  ;
		yhor_qp_q   =   qp_flag_yhor_q ? qp_left_modified:qp_left  ;
	end  
    else if(cnt_i[7]) begin
		yhor_qp_p	=	qp_tl;
		yhor_qp_q   =   qp_flag_yhor_q ? qp_left_modified:qp_left  ;

    end	
    else if(cnt_i[6:4])	begin 
		yhor_qp_p	=	qp_flag_yhor_p ? qp_left :qp_i	      ;
		yhor_qp_q   =   qp_flag_yhor_q ? qp_left :qp_i	      ;
	end
	else 				begin //0-15
		yhor_qp_p	=	qp_flag_yhor_p ? qp_top_modified :qp_top   ;
		yhor_qp_q   =   qp_flag_yhor_q ? qp_left :qp_i	      ;
	end
end	
		
endmodule 



