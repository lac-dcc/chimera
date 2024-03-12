//----------------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//----------------------------------------------------------------------------
// Filename       : dbf_pipeline.v
// Author         : Chewein
// Created        : 2014-04-18
// Description    : the 4-stage pipeline of filter process          
//----------------------------------------------------------------------------
module db_pipeline(
					//input
					clk		  ,
					rst_n	  ,
					
					tu_edge_i ,
					pu_edge_i ,
					qp_p_i	  ,
					qp_q_i	  ,
					cbf_p_i   ,
					cbf_q_i   ,
					mv_p_i    ,
					mv_q_i    ,
					mb_type_i ,
					is_ver_i  ,
					is_luma_i ,
					is_tran_i ,
					
					p_i		  ,
					q_i		  ,
					
					//output  
					f_p_o       ,
					f_q_o  
				);	
//---------------------------------------------------------------------------
//
//                        INPUT/OUTPUT DECLARATION 
//
//----------------------------------------------------------------------------
parameter DATA_WIDTH	=	128	            ;

input  						clk				;
input          				rst_n			;

input 					    tu_edge_i		;
input                       pu_edge_i		;
input [5:0]    				qp_p_i			;
input [5:0]    				qp_q_i			;
input       			    cbf_p_i 		;
input       			    cbf_q_i 		;
input [10*2-1:0]            mv_p_i  		;
input [10*2-1:0]            mv_q_i  		;

input				        mb_type_i		;// 1: I MB , 0: P/B MB 
input                       is_ver_i		;// 1: ver  , 0: hor
input                       is_luma_i		;// 1: luma , 0: chroma 
input                       is_tran_i       ;// 1: transposition ,1 : not transpositon

input  [DATA_WIDTH-1:0] 	p_i    , q_i	;

output [DATA_WIDTH-1:0]     f_p_o  , f_q_o	;
reg    [DATA_WIDTH-1:0]     f_p_o  , f_q_o	;
//---------------------------------------------------------------------------
//
//           stage0: calcu middle variabls  and split p_i/q_i
//
//----------------------------------------------------------------------------		
wire [4:0] 		tc_w 		;
wire [6:0]      beta_w      ;
reg  [1:0]      bs_w		;

wire  [5:0] qpw     = ( qp_p_i + qp_q_i + 1 ) >> 1;  
wire  [5:0] qpwcc   = qpw - 6'd30                 ;
wire  [5:0] qpw2    = qpw - 6'd6				  ;
reg   [5:0] qpw1                                  ;
reg   [5:0] qpc     							  ;

wire   [5:0] qp_lc_w								  ;

always @* begin
	case(qpwcc)
		6'd0 :qpw1 = 6'd29;
		6'd1 :qpw1 = 6'd30;
		6'd2 :qpw1 = 6'd31;
		6'd3 :qpw1 = 6'd32;
		6'd4 :qpw1 = 6'd33;
		6'd5 :qpw1 = 6'd33;
		6'd6 :qpw1 = 6'd34;
		6'd7 :qpw1 = 6'd34;
		6'd8 :qpw1 = 6'd35;
		6'd9 :qpw1 = 6'd35;
		6'd10:qpw1 = 6'd36;
		6'd11:qpw1 = 6'd36;
		6'd12:qpw1 = 6'd37;
		6'd13:qpw1 = 6'd37;
	  default:qpw1 = 6'd0 ;
	endcase
end

always @* begin
	if(qpw>6'd29&&qpw<6'd44)begin
		qpc  = qpw1; 
	end	
	else if(qpw<6'd30)begin
	    qpc  = qpw ;   
	end
	else begin
		qpc  = qpw2;
	end	
end 			   

assign qp_lc_w  = is_luma_i	? qpw : qpc ;

db_lut_beta	ubeta1( 	
						.qp_i(qpw),
						.beta_o(beta_w)	  
					  );
					  
db_lut_tc	      utc1( 	
						.qp_i(qp_lc_w),
						.mb_type_i(mb_type_i),
						.tc_o(tc_w)	  
					 );			
//bs_l1_r calcu
//intra   : tu_edge                       	-->2
//inter tu: tu_edge &&    (cbf_p || cbf_q)  -->1
//      pu: pu_edge &  abs_l1_r(mv_p.x-mv_q.x)>3 -->1
//          pu_edge &  abs_l1_r(mv_p.y-mv_q.y)>3 -->1
//other   :                                 -->0
//inter chroma donot filter
wire  signed [9:0]  mv_p_x		,  mv_q_x		 ;
wire  signed [9:0]  mv_p_y		,  mv_q_y		 ;
                
wire  [9:0]         mv_m_x      ,  mv_m_y 		 ;
wire                mv_x_gt_3_w	,  mv_y_gt_3_w   ;

assign mv_p_x     =  mv_p_i[ 9: 0] ;//? ~mv_p_i[9:0]  + 1'b1 : mv_p_i[9:0]  ;
assign mv_p_y     =  mv_p_i[19:10];//? ~mv_p_i[19:10]+ 1'b1 : mv_p_i[19:10];
assign mv_q_x     =  mv_q_i[ 9: 0] ;//? ~mv_q_i[9:0]  + 1'b1 : mv_q_i[9:0]  ;
assign mv_q_y     =  mv_q_i[19:10];//? ~mv_q_i[19:10]+ 1'b1 : mv_q_i[19:10];

assign mv_m_x     = mv_p_x   > mv_q_x  ? (mv_p_x - mv_q_x ):(mv_q_x - mv_p_x);
assign mv_m_y     = mv_p_y   > mv_q_y  ? (mv_p_y - mv_q_y ):(mv_q_y - mv_p_y);

assign mv_x_gt_3_w=	mv_m_x  > 10'd3 ? 1'b1 : 1'b0	;	
assign mv_y_gt_3_w=	mv_m_y  > 10'd3 ? 1'b1 : 1'b0	;	
				 					 
always @* begin
	if(mb_type_i)
		bs_w	=   tu_edge_i	;
	else 	
		bs_w    =   is_luma_i&&((tu_edge_i&&(cbf_p_i||cbf_q_i) )|| (pu_edge_i&&(mv_x_gt_3_w||mv_y_gt_3_w)));
end	
//----------------------------------------------------------------------------
// pipeline 0:reg delay 
reg [6:0] 				beta_r      				;							
reg [1:0]            	bs_r        				;
reg [4:0]               tc_r						;
reg                     is_ver_r					;
reg                     is_luma_r					;
reg                     is_tran_r                   ;
	
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		beta_r    		<=	7'b0	;
		tc_r			<=	5'b0	;
		bs_r			<=	2'b0	;
		is_ver_r	    <=  1'b0    ;
		is_luma_r       <=  1'b0    ;
		is_tran_r       <=  1'b0    ;
	end
    else begin
		beta_r    		<=   beta_w 					;
		tc_r            <=	 tc_w						;
		bs_r			<=	 bs_w						;
		is_ver_r	    <=   is_ver_i                   ;	
		is_luma_r       <=   is_luma_i                  ;
		is_tran_r       <=   is_tran_i                  ;
    end
end	 
reg [7:0]    			p0_0_i,p0_1_i,p0_2_i,p0_3_i	,
						p1_0_i,p1_1_i,p1_2_i,p1_3_i	,
						p2_0_i,p2_1_i,p2_2_i,p2_3_i	,
						p3_0_i,p3_1_i,p3_2_i,p3_3_i	;
							
reg	[7:0]  				q0_0_i,q0_1_i,q0_2_i,q0_3_i	,			
						q1_0_i,q1_1_i,q1_2_i,q1_3_i	,
						q2_0_i,q2_1_i,q2_2_i,q2_3_i	,
						q3_0_i,q3_1_i,q3_2_i,q3_3_i	;

//     p0_3_i,p0_2_i,p0_1_i,p0_0_i   |   q0_0_i,q0_1_i,q0_2_i,q0_3_i					
//     p1_3_i,p1_2_i,p1_1_i,p1_0_i   |   q1_0_i,q1_1_i,q1_2_i,q1_3_i					
//     p2_3_i,p2_2_i,p2_1_i,p2_0_i   |   q2_0_i,q2_1_i,q2_2_i,q2_3_i
//     p3_3_i,p3_2_i,p3_1_i,p3_0_i   |   q3_0_i,q3_1_i,q3_2_i,q3_3_i
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
		p0_3_i<=8'b0;p0_2_i<=8'b0;p0_1_i<=8'b0;p0_0_i<=8'b0;q0_0_i<=8'b0;q0_1_i<=8'b0;q0_2_i<=8'b0;q0_3_i<=8'b0;
		p1_3_i<=8'b0;p1_2_i<=8'b0;p1_1_i<=8'b0;p1_0_i<=8'b0;q1_0_i<=8'b0;q1_1_i<=8'b0;q1_2_i<=8'b0;q1_3_i<=8'b0;
		p2_3_i<=8'b0;p2_2_i<=8'b0;p2_1_i<=8'b0;p2_0_i<=8'b0;q2_0_i<=8'b0;q2_1_i<=8'b0;q2_2_i<=8'b0;q2_3_i<=8'b0;
		p3_3_i<=8'b0;p3_2_i<=8'b0;p3_1_i<=8'b0;p3_0_i<=8'b0;q3_0_i<=8'b0;q3_1_i<=8'b0;q3_2_i<=8'b0;q3_3_i<=8'b0;
	end
	else begin
		case({is_ver_i,is_tran_i})
			2'b10:begin//ver and not tran
				p3_0_i<=p_i[7  :0 ];p3_1_i<=p_i[15 : 8 ];p3_2_i<=p_i[23 :16 ];p3_3_i<=p_i[31 :24 ];   
				p2_0_i<=p_i[39 :32];p2_1_i<=p_i[47 : 40];p2_2_i<=p_i[55 :48 ];p2_3_i<=p_i[63 :56 ];   
				p1_0_i<=p_i[71 :64];p1_1_i<=p_i[79 : 72];p1_2_i<=p_i[87 :80 ];p1_3_i<=p_i[95 :88 ];   
				p0_0_i<=p_i[103:96];p0_1_i<=p_i[111:104];p0_2_i<=p_i[119:112];p0_3_i<=p_i[127:120];   
				q3_3_i<=q_i[7  :0 ];q3_2_i<=q_i[15 : 8 ];q3_1_i<=q_i[23 :16 ];q3_0_i<=q_i[31 :24 ];
				q2_3_i<=q_i[39 :32];q2_2_i<=q_i[47 : 40];q2_1_i<=q_i[55 :48 ];q2_0_i<=q_i[63 :56 ];
				q1_3_i<=q_i[71 :64];q1_2_i<=q_i[79 : 72];q1_1_i<=q_i[87 :80 ];q1_0_i<=q_i[95 :88 ];
				q0_3_i<=q_i[103:96];q0_2_i<=q_i[111:104];q0_1_i<=q_i[119:112];q0_0_i<=q_i[127:120];
			end
			2'b11:begin//ver and tran
				q3_3_i<=p_i[7  :0 ];q3_2_i<=p_i[15 : 8 ];q3_1_i<=p_i[23 :16 ];q3_0_i<=p_i[31 :24 ];   
				q2_3_i<=p_i[39 :32];q2_2_i<=p_i[47 : 40];q2_1_i<=p_i[55 :48 ];q2_0_i<=p_i[63 :56 ];   
				q1_3_i<=p_i[71 :64];q1_2_i<=p_i[79 : 72];q1_1_i<=p_i[87 :80 ];q1_0_i<=p_i[95 :88 ];   
				q0_3_i<=p_i[103:96];q0_2_i<=p_i[111:104];q0_1_i<=p_i[119:112];q0_0_i<=p_i[127:120];   
				p3_0_i<=q_i[7  :0 ];p3_1_i<=q_i[15 : 8 ];p3_2_i<=q_i[23 :16 ];p3_3_i<=q_i[31 :24 ];
				p2_0_i<=q_i[39 :32];p2_1_i<=q_i[47 : 40];p2_2_i<=q_i[55 :48 ];p2_3_i<=q_i[63 :56 ];
				p1_0_i<=q_i[71 :64];p1_1_i<=q_i[79 : 72];p1_2_i<=q_i[87 :80 ];p1_3_i<=q_i[95 :88 ];
				p0_0_i<=q_i[103:96];p0_1_i<=q_i[111:104];p0_2_i<=q_i[119:112];p0_3_i<=q_i[127:120];		
			end
			2'b00:begin//hor and not tran
				p3_0_i<=p_i[7  :0 ];p2_0_i<=p_i[15 : 8 ];p1_0_i<=p_i[23 :16 ];p0_0_i<=p_i[31 :24 ]; 
				p3_1_i<=p_i[39 :32];p2_1_i<=p_i[47 : 40];p1_1_i<=p_i[55 :48 ];p0_1_i<=p_i[63 :56 ]; 
				p3_2_i<=p_i[71 :64];p2_2_i<=p_i[79 : 72];p1_2_i<=p_i[87 :80 ];p0_2_i<=p_i[95 :88 ]; 
				p3_3_i<=p_i[103:96];p2_3_i<=p_i[111:104];p1_3_i<=p_i[119:112];p0_3_i<=p_i[127:120]; 
				q3_3_i<=q_i[7  :0 ];q2_3_i<=q_i[15 : 8 ];q1_3_i<=q_i[23 :16 ];q0_3_i<=q_i[31 :24 ];
				q3_2_i<=q_i[39 :32];q2_2_i<=q_i[47 : 40];q1_2_i<=q_i[55 :48 ];q0_2_i<=q_i[63 :56 ];
				q3_1_i<=q_i[71 :64];q2_1_i<=q_i[79 : 72];q1_1_i<=q_i[87 :80 ];q0_1_i<=q_i[95 :88 ];
				q3_0_i<=q_i[103:96];q2_0_i<=q_i[111:104];q1_0_i<=q_i[119:112];q0_0_i<=q_i[127:120];
			end
			2'b01:begin//hor and tran 
				q3_3_i<=p_i[7  :0 ];q2_3_i<=p_i[15 : 8 ];q1_3_i<=p_i[23 :16 ];q0_3_i<=p_i[31 :24 ]; 
				q3_2_i<=p_i[39 :32];q2_2_i<=p_i[47 : 40];q1_2_i<=p_i[55 :48 ];q0_2_i<=p_i[63 :56 ]; 
				q3_1_i<=p_i[71 :64];q2_1_i<=p_i[79 : 72];q1_1_i<=p_i[87 :80 ];q0_1_i<=p_i[95 :88 ]; 
				q3_0_i<=p_i[103:96];q2_0_i<=p_i[111:104];q1_0_i<=p_i[119:112];q0_0_i<=p_i[127:120]; 
				p3_0_i<=q_i[7  :0 ];p2_0_i<=q_i[15 : 8 ];p1_0_i<=q_i[23 :16 ];p0_0_i<=q_i[31 :24 ];
				p3_1_i<=q_i[39 :32];p2_1_i<=q_i[47 : 40];p1_1_i<=q_i[55 :48 ];p0_1_i<=q_i[63 :56 ];
				p3_2_i<=q_i[71 :64];p2_2_i<=q_i[79 : 72];p1_2_i<=q_i[87 :80 ];p0_2_i<=q_i[95 :88 ];
				p3_3_i<=q_i[103:96];p2_3_i<=q_i[111:104];p1_3_i<=q_i[119:112];p0_3_i<=q_i[127:120];
			end
		default:begin
				p3_0_i<=8'b0       ;p2_0_i<=8'b0        ;p1_0_i<=8'b0        ;p0_0_i<=8'b0; 
				p3_1_i<=8'b0       ;p2_1_i<=8'b0        ;p1_1_i<=8'b0        ;p0_1_i<=8'b0; 
				p3_2_i<=8'b0       ;p2_2_i<=8'b0        ;p1_2_i<=8'b0        ;p0_2_i<=8'b0; 
				p3_3_i<=8'b0       ;p2_3_i<=8'b0        ;p1_3_i<=8'b0        ;p0_3_i<=8'b0; 
				q3_3_i<=8'b0       ;q2_3_i<=8'b0        ;q1_3_i<=8'b0        ;q0_3_i<=8'b0;
				q3_2_i<=8'b0       ;q2_2_i<=8'b0        ;q1_2_i<=8'b0        ;q0_2_i<=8'b0;
				q3_1_i<=8'b0       ;q2_1_i<=8'b0        ;q1_1_i<=8'b0        ;q0_1_i<=8'b0;
				q3_0_i<=8'b0       ;q2_0_i<=8'b0        ;q1_0_i<=8'b0        ;q0_0_i<=8'b0;
			end
		endcase
	end
end 
//---------------------------------------------------------------------------
//
//                     	stage1_a:calcu middle variabls 
//
//----------------------------------------------------------------------------		
wire signed [8:0]  p0_0_s_w      , p0_1_s_w      ,p0_2_s_w  ;
wire signed [8:0]  p3_0_s_w      , p3_1_s_w      ,p3_2_s_w  ;
wire signed [8:0]  q0_0_s_w      , q0_1_s_w      ,q0_2_s_w  ;
wire signed [8:0]  q3_0_s_w      , q3_1_s_w      ,q3_2_s_w  ;
 
wire signed [9:0]  dp0_w         ,  dp3_w        ;
wire signed [9:0]  dq0_w         ,  dq3_w        ;
wire        [9:0]  dpw           ,  dqw          ;
wire        [9:0]  dqp0_w        ,  dqp3_w       ;
wire        [10:0] dqp0_m_2_w    ,  dqp3_m_2_w   ;             
wire        [10:0] d_w	 		 ;
wire 		[6:0]  tc_mux_3_2_w  ;

wire 		[6:0] beta_m_w   	;

wire 		[9:0] dp0_abs_l1_r_w,dp3_abs_l1_r_w  ;
wire 		[9:0] dq0_abs_l1_r_w,dq3_abs_l1_r_w  ;
		
wire 		[7:0] dp0_3_0       ,dq0_3_0,dpq0_0_0;
wire 		[7:0] dp3_3_0       ,dq3_3_0,dpq3_0_0;

wire   			  dsam0 		, dsam3			 ;

assign  p0_0_s_w  =  {1'b0,p0_0_i} ;
assign  p0_1_s_w  =  {1'b0,p0_1_i} ;
assign  p0_2_s_w  =  {1'b0,p0_2_i} ;
assign  p3_0_s_w  =  {1'b0,p3_0_i} ;
assign  p3_1_s_w  =  {1'b0,p3_1_i} ;
assign  p3_2_s_w  =  {1'b0,p3_2_i} ;
assign  q0_0_s_w  =  {1'b0,q0_0_i} ;
assign  q0_1_s_w  =  {1'b0,q0_1_i} ;
assign  q0_2_s_w  =  {1'b0,q0_2_i} ;
assign  q3_0_s_w  =  {1'b0,q3_0_i} ;
assign  q3_1_s_w  =  {1'b0,q3_1_i} ;
assign  q3_2_s_w  =  {1'b0,q3_2_i} ;

assign beta_m_w   =  (beta_r + (beta_r>>1)) >>3	;

assign dp0_w =  p0_2_s_w + p0_0_s_w - p0_1_s_w - p0_1_s_w ;
assign dp3_w =  p3_2_s_w + p3_0_s_w - p3_1_s_w - p3_1_s_w ;
assign dq0_w =  q0_2_s_w + q0_0_s_w - q0_1_s_w - q0_1_s_w ;
assign dq3_w =  q3_2_s_w + q3_0_s_w - q3_1_s_w - q3_1_s_w ;

assign dp0_abs_l1_r_w = dp0_w[9] ? (~dp0_w + 1'b1) : dp0_w; 
assign dp3_abs_l1_r_w = dp3_w[9] ? (~dp3_w + 1'b1) : dp3_w; 
assign dq0_abs_l1_r_w = dq0_w[9] ? (~dq0_w + 1'b1) : dq0_w; 
assign dq3_abs_l1_r_w = dq3_w[9] ? (~dq3_w + 1'b1) : dq3_w; 

assign dpw		=  dp0_abs_l1_r_w  +  dp3_abs_l1_r_w ;
assign dqw	 	=  dq0_abs_l1_r_w  +  dq3_abs_l1_r_w ;

assign dqp0_w 	=  dp0_abs_l1_r_w  +  dq0_abs_l1_r_w;
assign dqp3_w 	=  dp3_abs_l1_r_w  +  dq3_abs_l1_r_w;

assign d_w      =  dpw       +  dqw     ;

assign dp0_3_0  =  p0_0_i >  p0_3_i ? (p0_0_i - p0_3_i) : (p0_3_i - p0_0_i);
assign dq0_3_0  =  q0_0_i >  q0_3_i ? (q0_0_i - q0_3_i) : (q0_3_i - q0_0_i);
                                   
assign dp3_3_0  =  p3_0_i >  p3_3_i ? (p3_0_i - p3_3_i) : (p3_3_i - p3_0_i);
assign dq3_3_0  =  q3_0_i >  q3_3_i ? (q3_0_i - q3_3_i) : (q3_3_i - q3_0_i);
                                     
assign dpq0_0_0 = p0_0_i  > q0_0_i  ? (p0_0_i - q0_0_i) : (q0_0_i - p0_0_i);
assign dpq3_0_0 = p3_0_i  > q3_0_i  ? (p3_0_i - q3_0_i) : (q3_0_i - p3_0_i);

assign tc_mux_3_2_w    =  ({tc_r,2'b0}+tc_r+1)>>1  	    ;

assign dqp0_m_2_w = {dqp0_w,1'b0} ;
assign dqp3_m_2_w = {dqp3_w,1'b0} ;

assign dsam0 = ((dqp0_m_2_w< beta_r[6:2])&&((dp0_3_0 + dq0_3_0)< beta_r[6:3])&&( dpq0_0_0< tc_mux_3_2_w )) ? 1'b1 : 1'b0 ;
assign dsam3 = ((dqp3_m_2_w< beta_r[6:2])&&((dp3_3_0 + dq3_3_0)< beta_r[6:3])&&( dpq3_0_0< tc_mux_3_2_w )) ? 1'b1 : 1'b0 ;

//---------------------------------------------------------------------------
//
//                     	stage1_b:calc conditions and filter dicisons 
//
//----------------------------------------------------------------------------
wire d_less_beta_w 		;		//0:no filter		,	1:filter
wire norm_str_w			;		//0:normal filter	,	1:strong filter
wire filter_cout_pw  	;		//0:1 pixel filtered,   1:2 pixels filtered
wire filter_cout_qw  	;

assign  d_less_beta_w =  (d_w  < beta_r  ) ? 1'b1  : 1'b0  	; 

assign filter_cout_pw =  (dpw < beta_m_w ) ?  1'b1 : 1'b0	;
assign filter_cout_qw =  (dqw < beta_m_w ) ?  1'b1 : 1'b0 	;

assign norm_str_w     =  (dsam0&&dsam3   ) ?  1'b1 : 1'b0 	;

//---------------------------------------------------------------------------
//
//          stage1_c:normal filter  and  only filter 1 pixels 
//
//----------------------------------------------------------------------------
wire signed [8:0]  delta0_w  	 ;
wire signed [8:0]  delta1_w  	 ;
wire signed [8:0]  delta2_w  	 ;
wire signed [8:0]  delta3_w  	 ;

wire [3:0]  		not_nature_edge_w ;

db_normal_filter_1  unormal_1(
									//input 
									.tc_i     (tc_r     ),
                                    .p0_0_i(p0_0_i ) , .p0_1_i(p0_1_i ) , .p0_2_i(p0_2_i),
									.p1_0_i(p1_0_i ) , .p1_1_i(p1_1_i ) , .p1_2_i(p1_2_i),
									.p2_0_i(p2_0_i ) , .p2_1_i(p2_1_i ) , .p2_2_i(p2_2_i),
									.p3_0_i(p3_0_i ) , .p3_1_i(p3_1_i ) , .p3_2_i(p3_2_i),									                                                 
									
									.q0_0_i(q0_0_i ) , .q0_1_i(q0_1_i ) , .q0_2_i(q0_2_i),
									.q1_0_i(q1_0_i ) , .q1_1_i(q1_1_i ) , .q1_2_i(q1_2_i),
									.q2_0_i(q2_0_i ) , .q2_1_i(q2_1_i ) , .q2_2_i(q2_2_i),
                                    .q3_0_i(q3_0_i ) , .q3_1_i(q3_1_i ) , .q3_2_i(q3_2_i),
									//output              
									.delta0_o(delta0_w),
									.delta1_o(delta1_w),
									.delta2_o(delta2_w),
									.delta3_o(delta3_w),
									
									.not_nature_edge_o(not_nature_edge_w)
								 );
//----------------------------------------------------------------------------------------------
//reg delay 1 cycles 
reg [7:0] 		  p0_0_l1_r,p0_1_l1_r,p0_2_l1_r,p0_3_l1_r,
				  p1_0_l1_r,p1_1_l1_r,p1_2_l1_r,p1_3_l1_r,
				  p2_0_l1_r,p2_1_l1_r,p2_2_l1_r,p2_3_l1_r,
				  p3_0_l1_r,p3_1_l1_r,p3_2_l1_r,p3_3_l1_r;
				  
reg [7:0]   	  q0_0_l1_r,q0_1_l1_r,q0_2_l1_r,q0_3_l1_r,	
				  q1_0_l1_r,q1_1_l1_r,q1_2_l1_r,q1_3_l1_r,
				  q2_0_l1_r,q2_1_l1_r,q2_2_l1_r,q2_3_l1_r,
				  q3_0_l1_r,q3_1_l1_r,q3_2_l1_r,q3_3_l1_r;
                  
	
reg signed [8:0]  delta0_r  	        	;
reg signed [8:0]  delta1_r  	        	;
reg signed [8:0]  delta2_r  	        	;
reg signed [8:0]  delta3_r  	        	;
	
reg [3:0]  		  not_nature_edge_r	    	;
reg [4:0] 		  tc_l1_r 					;
reg [1:0]         bs_l1_r         			;

reg               is_ver_d1_r	            ;
reg               is_luma_d1_r              ;
reg               is_tran_d1_r              ;

	
reg 			  d_less_beta_l1_r 			;
reg 			  norm_str_l1_r				;
reg 			  filter_cout_pl1_r  		;
reg 			  filter_cout_ql1_r  		;


always @(posedge clk or negedge rst_n) begin
    if(!rst_n)  begin
	    p0_0_l1_r<= 8'b0 ; p0_1_l1_r<= 8'b0 ; p0_2_l1_r<= 8'b0 ; p0_3_l1_r<= 8'b0 ;
		p1_0_l1_r<= 8'b0 ; p1_1_l1_r<= 8'b0 ; p1_2_l1_r<= 8'b0 ; p1_3_l1_r<= 8'b0 ;
		p2_0_l1_r<= 8'b0 ; p2_1_l1_r<= 8'b0 ; p2_2_l1_r<= 8'b0 ; p2_3_l1_r<= 8'b0 ;
		p3_0_l1_r<= 8'b0 ; p3_1_l1_r<= 8'b0 ; p3_2_l1_r<= 8'b0 ; p3_3_l1_r<= 8'b0 ;
			       
		q0_0_l1_r<= 8'b0 ; q0_1_l1_r<= 8'b0 ; q0_2_l1_r<= 8'b0 ; q0_3_l1_r<= 8'b0 ;
		q1_0_l1_r<= 8'b0 ; q1_1_l1_r<= 8'b0 ; q1_2_l1_r<= 8'b0 ; q1_3_l1_r<= 8'b0 ;
		q2_0_l1_r<= 8'b0 ; q2_1_l1_r<= 8'b0 ; q2_2_l1_r<= 8'b0 ; q2_3_l1_r<= 8'b0 ;
		q3_0_l1_r<= 8'b0 ; q3_1_l1_r<= 8'b0 ; q3_2_l1_r<= 8'b0 ; q3_3_l1_r<= 8'b0 ;
		
		delta0_r  <=9'b0 ; delta1_r  <=9'b0; delta2_r   <=9'b0 ; delta3_r  <=9'b0 ;
		
		not_nature_edge_r <=4'b0;		
		
		tc_l1_r 	<=	5'b0	;	
		bs_l1_r     <=  2'b0    ;
		
		is_ver_d1_r	<=  1'b0    ;
		is_luma_d1_r<=  1'b0    ; 
		is_tran_d1_r<=  1'b0    ; 
		
		d_less_beta_l1_r 	 <= 1'b0;
		norm_str_l1_r		 <= 1'b0;
		filter_cout_pl1_r   <= 1'b0	;
		filter_cout_ql1_r   <= 1'b0	;	
	end
	else begin
		p0_0_l1_r<=p0_0_i ; p0_1_l1_r<=p0_1_i ; p0_2_l1_r<=p0_2_i ; p0_3_l1_r<=p0_3_i;
		p1_0_l1_r<=p1_0_i ; p1_1_l1_r<=p1_1_i ; p1_2_l1_r<=p1_2_i ; p1_3_l1_r<=p1_3_i;
		p2_0_l1_r<=p2_0_i ; p2_1_l1_r<=p2_1_i ; p2_2_l1_r<=p2_2_i ; p2_3_l1_r<=p2_3_i;
		p3_0_l1_r<=p3_0_i ; p3_1_l1_r<=p3_1_i ; p3_2_l1_r<=p3_2_i ; p3_3_l1_r<=p3_3_i;
		                                                            
		q0_0_l1_r<=q0_0_i ; q0_1_l1_r<=q0_1_i ; q0_2_l1_r<=q0_2_i ; q0_3_l1_r<=q0_3_i;
		q1_0_l1_r<=q1_0_i ; q1_1_l1_r<=q1_1_i ; q1_2_l1_r<=q1_2_i ; q1_3_l1_r<=q1_3_i;
		q2_0_l1_r<=q2_0_i ; q2_1_l1_r<=q2_1_i ; q2_2_l1_r<=q2_2_i ; q2_3_l1_r<=q2_3_i;
		q3_0_l1_r<=q3_0_i ; q3_1_l1_r<=q3_1_i ; q3_2_l1_r<=q3_2_i ; q3_3_l1_r<=q3_3_i;
		
		delta0_r   <=delta0_w  ; delta1_r   <=delta1_w  ; delta2_r  <=delta2_w  ;delta3_r  <= delta3_w  ;
		
		not_nature_edge_r <=not_nature_edge_w;	
		
		tc_l1_r 	<=	tc_r	;
		bs_l1_r		<=  bs_r    ;
		
		is_ver_d1_r	<=is_ver_r	;
		is_luma_d1_r<=is_luma_r ;   
		is_tran_d1_r<=is_tran_r ;   
		
		d_less_beta_l1_r 	 <= d_less_beta_w 	;
		norm_str_l1_r		 <= norm_str_w		;
		filter_cout_pl1_r   <= filter_cout_pw ;
		filter_cout_ql1_r   <= filter_cout_qw ;			
	end
 end 
//---------------------------------------------------------------------------
//
//                     	stage2:filter process  
//
//----------------------------------------------------------------------------
//strong filter
wire [7:0] 	p0_0_str_w,p0_1_str_w,p0_2_str_w,
            p1_0_str_w,p1_1_str_w,p1_2_str_w,
            p2_0_str_w,p2_1_str_w,p2_2_str_w,
            p3_0_str_w,p3_1_str_w,p3_2_str_w;
	
wire [7:0] 	q0_0_str_w,q0_1_str_w,q0_2_str_w,
            q1_0_str_w,q1_1_str_w,q1_2_str_w,
            q2_0_str_w,q2_1_str_w,q2_2_str_w,
            q3_0_str_w,q3_1_str_w,q3_2_str_w;	
			
db_strong_filter  ustrong_filter(
			//input 
				.tc_i(tc_l1_r),
				.p0_0_i(p0_0_l1_r)  , .p0_1_i(p0_1_l1_r)  , .p0_2_i(p0_2_l1_r)  , .p0_3_i(p0_3_l1_r),
				.p1_0_i(p1_0_l1_r)  , .p1_1_i(p1_1_l1_r)  , .p1_2_i(p1_2_l1_r)  , .p1_3_i(p1_3_l1_r),
				.p2_0_i(p2_0_l1_r)  , .p2_1_i(p2_1_l1_r)  , .p2_2_i(p2_2_l1_r)  , .p2_3_i(p2_3_l1_r),
				.p3_0_i(p3_0_l1_r)  , .p3_1_i(p3_1_l1_r)  , .p3_2_i(p3_2_l1_r)  , .p3_3_i(p3_3_l1_r),
				                                                                   
				.q0_0_i(q0_0_l1_r)  , .q0_1_i(q0_1_l1_r)  , .q0_2_i(q0_2_l1_r)  , .q0_3_i(q0_3_l1_r),
				.q1_0_i(q1_0_l1_r)  , .q1_1_i(q1_1_l1_r)  , .q1_2_i(q1_2_l1_r)  , .q1_3_i(q1_3_l1_r),
				.q2_0_i(q2_0_l1_r)  , .q2_1_i(q2_1_l1_r)  , .q2_2_i(q2_2_l1_r)  , .q2_3_i(q2_3_l1_r),
				.q3_0_i(q3_0_l1_r)  , .q3_1_i(q3_1_l1_r)  , .q3_2_i(q3_2_l1_r)  , .q3_3_i(q3_3_l1_r),
			//output                                                               
				.p0_0_o(p0_0_str_w) , .p0_1_o(p0_1_str_w) , .p0_2_o(p0_2_str_w) ,
				.p1_0_o(p1_0_str_w) , .p1_1_o(p1_1_str_w) , .p1_2_o(p1_2_str_w) ,
				.p2_0_o(p2_0_str_w) , .p2_1_o(p2_1_str_w) , .p2_2_o(p2_2_str_w) ,
				.p3_0_o(p3_0_str_w) , .p3_1_o(p3_1_str_w) , .p3_2_o(p3_2_str_w) ,
				                                                                   
				.q0_0_o(q0_0_str_w) , .q0_1_o(q0_1_str_w) , .q0_2_o(q0_2_str_w) ,
				.q1_0_o(q1_0_str_w) , .q1_1_o(q1_1_str_w) , .q1_2_o(q1_2_str_w) ,
				.q2_0_o(q2_0_str_w) , .q2_1_o(q2_1_str_w) , .q2_2_o(q2_2_str_w) ,
			    .q3_0_o(q3_0_str_w) , .q3_1_o(q3_1_str_w) , .q3_2_o(q3_2_str_w) 
				);			
//----------------------------------------------------------------------------
//normal filter	
wire [7:0] 		p0_0_nor_w , q0_0_nor_w;
wire [7:0] 		p1_0_nor_w , q1_0_nor_w;
wire [7:0] 		p2_0_nor_w , q2_0_nor_w;
wire [7:0] 		p3_0_nor_w , q3_0_nor_w;

wire [7:0] 		p0_1_nor_w , q0_1_nor_w;
wire [7:0] 		p1_1_nor_w , q1_1_nor_w;
wire [7:0] 		p2_1_nor_w , q2_1_nor_w;
wire [7:0] 		p3_1_nor_w , q3_1_nor_w;

wire [7:0]  	p0_0_c_w   , q0_0_c_w  ;//chroma output 
wire [7:0]  	p1_0_c_w   , q1_0_c_w  ;
wire [7:0]  	p2_0_c_w   , q2_0_c_w  ;
wire [7:0]  	p3_0_c_w   , q3_0_c_w  ;	

db_normal_filter_2  unormal_2(
				//input 
				.tc_i    (tc_l1_r   ),
				.p0_0_i  (p0_0_l1_r ),.p0_1_i(p0_1_l1_r),.p0_2_i(p0_2_l1_r), 
				.p1_0_i  (p1_0_l1_r ),.p1_1_i(p1_1_l1_r),.p1_2_i(p1_2_l1_r), 
				.p2_0_i  (p2_0_l1_r ),.p2_1_i(p2_1_l1_r),.p2_2_i(p2_2_l1_r), 
				.p3_0_i  (p3_0_l1_r ),.p3_1_i(p3_1_l1_r),.p3_2_i(p3_2_l1_r), 
      
				.q0_0_i  (q0_0_l1_r ),.q0_1_i(q0_1_l1_r),.q0_2_i(q0_2_l1_r), 
				.q1_0_i  (q1_0_l1_r ),.q1_1_i(q1_1_l1_r),.q1_2_i(q1_2_l1_r), 
				.q2_0_i  (q2_0_l1_r ),.q2_1_i(q2_1_l1_r),.q2_2_i(q2_2_l1_r), 
				.q3_0_i  (q3_0_l1_r ),.q3_1_i(q3_1_l1_r),.q3_2_i(q3_2_l1_r), 
	
				.delta0_i(delta0_r  ),
				.delta1_i(delta1_r  ),
				.delta2_i(delta2_r  ),
				.delta3_i(delta3_r  ),
			//output   
				.p0_0_o  (p0_0_nor_w),
				.p1_0_o  (p1_0_nor_w),
				.p2_0_o  (p2_0_nor_w),
				.p3_0_o  (p3_0_nor_w),
		
				.q0_0_o  (q0_0_nor_w),
				.q1_0_o  (q1_0_nor_w),
				.q2_0_o  (q2_0_nor_w),
                .q3_0_o  (q3_0_nor_w),

				.p0_1_o  (p0_1_nor_w),
				.p1_1_o  (p1_1_nor_w),
				.p2_1_o  (p2_1_nor_w),
				.p3_1_o  (p3_1_nor_w),
	
				.q0_1_o  (q0_1_nor_w),
				.q1_1_o  (q1_1_nor_w),
				.q2_1_o  (q2_1_nor_w),
                .q3_1_o  (q3_1_nor_w),

		        .p0_0_c_o(p0_0_c_w  ),
				.p1_0_c_o(p1_0_c_w  ),
				.p2_0_c_o(p2_0_c_w  ),
				.p3_0_c_o(p3_0_c_w  ),
	
				.q0_0_c_o(q0_0_c_w  ),
				.q1_0_c_o(q1_0_c_w  ),
				.q2_0_c_o(q2_0_c_w  ),
				.q3_0_c_o(q3_0_c_w  ) 
			);			                                                                                                                                          																																  

//---------------------------------------------------------------------------
//
//stage3:output,select strong/normal filter 2 pixels/normal filter 1 pixels 
//
//----------------------------------------------------------------------------	
reg	[7:0]				p0_0_o,p0_1_o,p0_2_o,p0_3_o	,				
						p1_0_o,p1_1_o,p1_2_o,p1_3_o	,
						p2_0_o,p2_1_o,p2_2_o,p2_3_o	,
						p3_0_o,p3_1_o,p3_2_o,p3_3_o	;
							
reg	[7:0]				q0_0_o,q0_1_o,q0_2_o,q0_3_o	,
						q1_0_o,q1_1_o,q1_2_o,q1_3_o	,
						q2_0_o,q2_1_o,q2_2_o,q2_3_o	,
						q3_0_o,q3_1_o,q3_2_o,q3_3_o	;						 			

// p0_0 p0_1 p0_2 p0_3	
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
		 p0_0_o <= 8'b0 ; 
		 p0_1_o <= 8'b0 ; 
		 p0_2_o <= 8'b0 ;	
	end 
	else if(!is_luma_d1_r&&bs_l1_r) begin  // chroma 
	     p0_0_o <= p0_0_c_w  ;
	     p0_1_o <= p0_1_l1_r ;
	     p0_2_o <= p0_2_l1_r ;
	
	end
	else if(!(bs_l1_r &&d_less_beta_l1_r&&not_nature_edge_r[0]) )  begin	// no filter	
		 p0_0_o <= p0_0_l1_r ; 
		 p0_1_o <= p0_1_l1_r ; 
		 p0_2_o <= p0_2_l1_r ;
	end
	else begin 
	    if(norm_str_l1_r)  begin			//strong filter
			p0_0_o <= p0_0_str_w ; 
			p0_1_o <= p0_1_str_w ; 
			p0_2_o <= p0_2_str_w ;	
		end
		else begin							//normal filter
			if(filter_cout_pl1_r) begin     //p 2 fixels filter
				p0_0_o <= p0_0_nor_w ; 
				p0_1_o <= p0_1_nor_w ; 
				p0_2_o <= p0_2_l1_r  ;
		    end
			else begin						//p 1 fixels filter
				p0_0_o <= p0_0_nor_w ; 
				p0_1_o <= p0_1_l1_r  ; 
				p0_2_o <= p0_2_l1_r  ;			
			end
		end
    end
end

// p1_0 p1_1 p1_2 p1_3	
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
		 p1_0_o <= 8'b0 ; 
		 p1_1_o <= 8'b0 ; 
		 p1_2_o <= 8'b0 ;	
	end 
	else if(!is_luma_d1_r&&bs_l1_r)begin
		p1_0_o <= p1_0_c_w  ;
		p1_1_o <= p1_1_l1_r ;
	    p1_2_o <= p1_2_l1_r ;
	end
	else if(! (bs_l1_r &&d_less_beta_l1_r&&not_nature_edge_r[1]) )  begin	// no filter	
		 p1_0_o <= p1_0_l1_r ; 
		 p1_1_o <= p1_1_l1_r ; 
		 p1_2_o <= p1_2_l1_r ;
	end
	else begin 
	    if(norm_str_l1_r)  begin			//strong filter
			p1_0_o <= p1_0_str_w ; 
			p1_1_o <= p1_1_str_w ; 
			p1_2_o <= p1_2_str_w ;	
		end
		else begin							//normal filter
			if(filter_cout_pl1_r) begin    //p 2 fixels filter
				p1_0_o <= p1_0_nor_w ; 
				p1_1_o <= p1_1_nor_w ; 
				p1_2_o <= p1_2_l1_r  ;
		    end
			else begin						//p 1 fixels filter
				p1_0_o <= p1_0_nor_w ; 
				p1_1_o <= p1_1_l1_r  ; 
				p1_2_o <= p1_2_l1_r  ;			
			end
		end
    end
end

// p2_0 p2_1 p2_2 p2_3	
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
		 p2_0_o <= 8'b0 ; 
		 p2_1_o <= 8'b0 ; 
		 p2_2_o <= 8'b0 ;	
	end 
	else if(!is_luma_d1_r&&bs_l1_r)begin
		p2_0_o <= p2_0_c_w  ;
		p2_1_o <= p2_1_l1_r ;
	    p2_2_o <= p2_2_l1_r ;
	end
	else if(! (bs_l1_r &&d_less_beta_l1_r&&not_nature_edge_r[2]) )  begin	// no filter	
		 p2_0_o <= p2_0_l1_r ; 
		 p2_1_o <= p2_1_l1_r ; 
		 p2_2_o <= p2_2_l1_r ;
	end
	else begin 
	    if(norm_str_l1_r)  begin			//strong filter
			p2_0_o <= p2_0_str_w ; 
			p2_1_o <= p2_1_str_w ; 
			p2_2_o <= p2_2_str_w ;	
		end
		else begin							//normal filter
			if(filter_cout_pl1_r) begin    //p 2 fixels filter
				p2_0_o <= p2_0_nor_w ; 
				p2_1_o <= p2_1_nor_w ; 
				p2_2_o <= p2_2_l1_r  ;
		    end
			else begin						//p 1 fixels filter
				p2_0_o <= p2_0_nor_w ; 
				p2_1_o <= p2_1_l1_r  ; 
				p2_2_o <= p2_2_l1_r  ;			
			end
		end
    end
end

// p3_0 p3_1 p3_2 p3_3	
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
		 p3_0_o <= 8'b0 ; 
		 p3_1_o <= 8'b0 ; 
		 p3_2_o <= 8'b0 ;	
	end 
	else if(!is_luma_d1_r&&bs_l1_r)begin
		p3_0_o <= p3_0_c_w  ;
		p3_1_o <= p3_1_l1_r ;
	    p3_2_o <= p3_2_l1_r ;
	end
	else if(! (bs_l1_r &&d_less_beta_l1_r&&not_nature_edge_r[3]) )  begin	// no filter	
		 p3_0_o <= p3_0_l1_r ; 
		 p3_1_o <= p3_1_l1_r ; 
		 p3_2_o <= p3_2_l1_r ;
	end
	else begin 
	    if(norm_str_l1_r)  begin			//strong filter
			p3_0_o <= p3_0_str_w ; 
			p3_1_o <= p3_1_str_w ; 
			p3_2_o <= p3_2_str_w ;	
		end
		else begin							//normal filter
			if(filter_cout_pl1_r) begin    //p 2 fixels filter
				p3_0_o <= p3_0_nor_w ; 
				p3_1_o <= p3_1_nor_w ; 
				p3_2_o <= p3_2_l1_r  ;
		    end
			else begin						//p 1 fixels filter
				p3_0_o <= p3_0_nor_w ; 
				p3_1_o <= p3_1_l1_r  ; 
				p3_2_o <= p3_2_l1_r  ;			
			end
		end
    end
end

// q0_0 q0_1 q0_2 q0_3	
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
		 q0_0_o <= 8'b0 ; 
		 q0_1_o <= 8'b0 ; 
		 q0_2_o <= 8'b0 ;	
	end 
	else if(!is_luma_d1_r&&bs_l1_r)begin
		q0_0_o <= q0_0_c_w  ;
		q0_1_o <= q0_1_l1_r ;
	    q0_2_o <= q0_2_l1_r ;
	end
	else if(! (bs_l1_r &&d_less_beta_l1_r&&not_nature_edge_r[0]) )  begin	// no filter	
		 q0_0_o <= q0_0_l1_r ; 
		 q0_1_o <= q0_1_l1_r ; 
		 q0_2_o <= q0_2_l1_r ;
	end
	else begin 
	    if(norm_str_l1_r)  begin			//strong filter
			q0_0_o <= q0_0_str_w ; 
			q0_1_o <= q0_1_str_w ; 
			q0_2_o <= q0_2_str_w ;	
		end
		else begin							//normal filter
			if(filter_cout_ql1_r) begin    //q 2 fixels filter
				q0_0_o <= q0_0_nor_w ; 
				q0_1_o <= q0_1_nor_w ;
				q0_2_o <= q0_2_l1_r  ;
		    end
			else begin						//q 1 fixels filter
				q0_0_o <= q0_0_nor_w ; 
				q0_1_o <= q0_1_l1_r  ; 
				q0_2_o <= q0_2_l1_r  ;			
			end
		end
    end
end

// q1_0 q1_1 q1_2 q1_3	
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
		 q1_0_o <= 8'b0 ; 
		 q1_1_o <= 8'b0 ; 
		 q1_2_o <= 8'b0 ;	
	end 
	else if(!is_luma_d1_r&&bs_l1_r)begin
		q1_0_o <= q1_0_c_w  ;
		q1_1_o <= q1_1_l1_r ;
	    q1_2_o <= q1_2_l1_r ;
	end
	else if(! (bs_l1_r &&d_less_beta_l1_r&&not_nature_edge_r[1]) )  begin	// no filter	
		 q1_0_o <= q1_0_l1_r ; 
		 q1_1_o <= q1_1_l1_r ; 
		 q1_2_o <= q1_2_l1_r ;
	end
	else begin 
	    if(norm_str_l1_r)  begin			//strong filter
			q1_0_o <= q1_0_str_w ; 
			q1_1_o <= q1_1_str_w ; 
			q1_2_o <= q1_2_str_w ;	
		end
		else begin							//normal filter
			if(filter_cout_ql1_r) begin    //q 2 fixels filter
				q1_0_o <= q1_0_nor_w ; 
				q1_1_o <= q1_1_nor_w ; 
				q1_2_o <= q1_2_l1_r  ;
		    end
			else begin						//q 1 fixels filter
				q1_0_o <= q1_0_nor_w ; 
				q1_1_o <= q1_1_l1_r  ; 
				q1_2_o <= q1_2_l1_r  ;			
			end
		end
    end
end

// q2_0 q2_1 q2_2 q2_3	
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
		 q2_0_o <= 8'b0 ; 
		 q2_1_o <= 8'b0 ; 
		 q2_2_o <= 8'b0 ;	
	end 
	else if(!is_luma_d1_r&&bs_l1_r)begin
		q2_0_o <= q2_0_c_w  ;
		q2_1_o <= q2_1_l1_r ;
	    q2_2_o <= q2_2_l1_r ;
	end
	else if(! (bs_l1_r &&d_less_beta_l1_r&&not_nature_edge_r[2]) )  begin	// no filter	
		 q2_0_o <= q2_0_l1_r ; 
		 q2_1_o <= q2_1_l1_r ; 
		 q2_2_o <= q2_2_l1_r ;
	end
	else begin 
	    if(norm_str_l1_r)  begin			//strong filter
			q2_0_o <= q2_0_str_w ; 
			q2_1_o <= q2_1_str_w ; 
			q2_2_o <= q2_2_str_w ;	
		end
		else begin							//normal filter
			if(filter_cout_ql1_r) begin    //q 2 fixels filter
				q2_0_o <= q2_0_nor_w ; 
				q2_1_o <= q2_1_nor_w ; 
				q2_2_o <= q2_2_l1_r  ;
		    end
			else begin						//q 1 fixels filter
				q2_0_o <= q2_0_nor_w ; 
				q2_1_o <= q2_1_l1_r  ; 
				q2_2_o <= q2_2_l1_r  ;			
			end
		end
    end
end

// q3_0 q3_1 q3_2 q3_3	
always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
		 q3_0_o <= 8'b0 ; 
		 q3_1_o <= 8'b0 ; 
		 q3_2_o <= 8'b0 ;	
	end 
	else if(!is_luma_d1_r&&bs_l1_r)begin
		q3_0_o <= q3_0_c_w  ;
		q3_1_o <= q3_1_l1_r ;
	    q3_2_o <= q3_2_l1_r ;
	end
	else if(! (bs_l1_r &&d_less_beta_l1_r&&not_nature_edge_r[3]) )  begin	// no filter	
		 q3_0_o <= q3_0_l1_r ; 
		 q3_1_o <= q3_1_l1_r ; 
		 q3_2_o <= q3_2_l1_r ;
	end
	else begin 
	    if(norm_str_l1_r)  begin			//strong filter
			q3_0_o <= q3_0_str_w ; 
			q3_1_o <= q3_1_str_w ; 
			q3_2_o <= q3_2_str_w ;	
		end
		else begin							//normal filter
			if(filter_cout_ql1_r) begin    //q 2 fixels filter
				q3_0_o <= q3_0_nor_w ; 
				q3_1_o <= q3_1_nor_w ; 
				q3_2_o <= q3_2_l1_r  ;
		    end
			else begin						//q 1 fixels filter
				q3_0_o <= q3_0_nor_w ; 
				q3_1_o <= q3_1_l1_r  ; 
				q3_2_o <= q3_2_l1_r  ;			
			end
		end
    end
end

// p0_3_o p1_3_o p2_3_o p3_3_o q0_3_o q1_3_o q2_3_o q3_3_o
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
        p0_3_o  <=  8'b0       ;				
        p1_3_o  <=  8'b0       ;
		p2_3_o  <=  8'b0       ;
		p3_3_o  <=  8'b0       ;
                       
        q0_3_o  <=  8'b0       ;				
        q1_3_o  <=  8'b0       ;
		q2_3_o  <=  8'b0       ;
		q3_3_o  <=  8'b0       ;	  
	end
    else begin
		p0_3_o  <=  p0_3_l1_r ;			          
		p1_3_o  <=  p1_3_l1_r ;		          
		p2_3_o  <=  p2_3_l1_r ;		          
		p3_3_o  <=  p3_3_l1_r ;
                                                                   
		q0_3_o  <=  q0_3_l1_r ;			
		q1_3_o  <=  q1_3_l1_r ;		
		q2_3_o  <=  q2_3_l1_r ;	
		q3_3_o  <=  q3_3_l1_r ;
	end
end
reg 	is_tran_d2_r	;

always @(posedge clk or negedge rst_n) begin
	if(!rst_n)
		is_tran_d2_r	<=	1'b0;
	else 
		is_tran_d2_r	<=	is_tran_d1_r;
end

always @* begin
	case({is_ver_d1_r,is_tran_d2_r})
		2'b10:begin//ver and not tran
			f_p_o[7  :0 ]=p3_0_o;f_p_o[15 : 8 ]=p3_1_o;f_p_o[23 :16 ]=p3_2_o;f_p_o[31 :24 ]=p3_3_o;   
			f_p_o[39 :32]=p2_0_o;f_p_o[47 : 40]=p2_1_o;f_p_o[55 :48 ]=p2_2_o;f_p_o[63 :56 ]=p2_3_o;   
			f_p_o[71 :64]=p1_0_o;f_p_o[79 : 72]=p1_1_o;f_p_o[87 :80 ]=p1_2_o;f_p_o[95 :88 ]=p1_3_o;   
			f_p_o[103:96]=p0_0_o;f_p_o[111:104]=p0_1_o;f_p_o[119:112]=p0_2_o;f_p_o[127:120]=p0_3_o;   
			f_q_o[7  :0 ]=q3_3_o;f_q_o[15 : 8 ]=q3_2_o;f_q_o[23 :16 ]=q3_1_o;f_q_o[31 :24 ]=q3_0_o;
			f_q_o[39 :32]=q2_3_o;f_q_o[47 : 40]=q2_2_o;f_q_o[55 :48 ]=q2_1_o;f_q_o[63 :56 ]=q2_0_o;
			f_q_o[71 :64]=q1_3_o;f_q_o[79 : 72]=q1_2_o;f_q_o[87 :80 ]=q1_1_o;f_q_o[95 :88 ]=q1_0_o;
			f_q_o[103:96]=q0_3_o;f_q_o[111:104]=q0_2_o;f_q_o[119:112]=q0_1_o;f_q_o[127:120]=q0_0_o;
		end
		2'b11:begin//ver and tran
			f_q_o[7  :0 ]=p3_0_o;f_q_o[15 : 8 ]=p3_1_o;f_q_o[23 :16 ]=p3_2_o;f_q_o[31 :24 ]=p3_3_o;   
			f_q_o[39 :32]=p2_0_o;f_q_o[47 : 40]=p2_1_o;f_q_o[55 :48 ]=p2_2_o;f_q_o[63 :56 ]=p2_3_o;   
			f_q_o[71 :64]=p1_0_o;f_q_o[79 : 72]=p1_1_o;f_q_o[87 :80 ]=p1_2_o;f_q_o[95 :88 ]=p1_3_o;   
			f_q_o[103:96]=p0_0_o;f_q_o[111:104]=p0_1_o;f_q_o[119:112]=p0_2_o;f_q_o[127:120]=p0_3_o;   
			f_p_o[7  :0 ]=q3_3_o;f_p_o[15 : 8 ]=q3_2_o;f_p_o[23 :16 ]=q3_1_o;f_p_o[31 :24 ]=q3_0_o;
			f_p_o[39 :32]=q2_3_o;f_p_o[47 : 40]=q2_2_o;f_p_o[55 :48 ]=q2_1_o;f_p_o[63 :56 ]=q2_0_o;
			f_p_o[71 :64]=q1_3_o;f_p_o[79 : 72]=q1_2_o;f_p_o[87 :80 ]=q1_1_o;f_p_o[95 :88 ]=q1_0_o;
			f_p_o[103:96]=q0_3_o;f_p_o[111:104]=q0_2_o;f_p_o[119:112]=q0_1_o;f_p_o[127:120]=q0_0_o;	
		end
		2'b00:begin//hor and not tran	
			f_p_o[7  :0 ]=p3_0_o;f_p_o[15 : 8 ]=p2_0_o;f_p_o[23 :16 ]=p1_0_o;f_p_o[31 :24 ]=p0_0_o; 
			f_p_o[39 :32]=p3_1_o;f_p_o[47 : 40]=p2_1_o;f_p_o[55 :48 ]=p1_1_o;f_p_o[63 :56 ]=p0_1_o; 
			f_p_o[71 :64]=p3_2_o;f_p_o[79 : 72]=p2_2_o;f_p_o[87 :80 ]=p1_2_o;f_p_o[95 :88 ]=p0_2_o; 
			f_p_o[103:96]=p3_3_o;f_p_o[111:104]=p2_3_o;f_p_o[119:112]=p1_3_o;f_p_o[127:120]=p0_3_o; 
			f_q_o[7  :0 ]=q3_3_o;f_q_o[15 : 8 ]=q2_3_o;f_q_o[23 :16 ]=q1_3_o;f_q_o[31 :24 ]=q0_3_o;
			f_q_o[39 :32]=q3_2_o;f_q_o[47 : 40]=q2_2_o;f_q_o[55 :48 ]=q1_2_o;f_q_o[63 :56 ]=q0_2_o;
			f_q_o[71 :64]=q3_1_o;f_q_o[79 : 72]=q2_1_o;f_q_o[87 :80 ]=q1_1_o;f_q_o[95 :88 ]=q0_1_o;
			f_q_o[103:96]=q3_0_o;f_q_o[111:104]=q2_0_o;f_q_o[119:112]=q1_0_o;f_q_o[127:120]=q0_0_o; 
		end
		2'b01:begin//hor and tran 			
			f_q_o[7  :0 ]=p3_0_o;f_q_o[15 : 8 ]=p2_0_o;f_q_o[23 :16 ]=p1_0_o;f_q_o[31 :24 ]=p0_0_o; 
			f_q_o[39 :32]=p3_1_o;f_q_o[47 : 40]=p2_1_o;f_q_o[55 :48 ]=p1_1_o;f_q_o[63 :56 ]=p0_1_o; 
			f_q_o[71 :64]=p3_2_o;f_q_o[79 : 72]=p2_2_o;f_q_o[87 :80 ]=p1_2_o;f_q_o[95 :88 ]=p0_2_o; 
			f_q_o[103:96]=p3_3_o;f_q_o[111:104]=p2_3_o;f_q_o[119:112]=p1_3_o;f_q_o[127:120]=p0_3_o; 
			f_p_o[7  :0 ]=q3_3_o;f_p_o[15 : 8 ]=q2_3_o;f_p_o[23 :16 ]=q1_3_o;f_p_o[31 :24 ]=q0_3_o;
			f_p_o[39 :32]=q3_2_o;f_p_o[47 : 40]=q2_2_o;f_p_o[55 :48 ]=q1_2_o;f_p_o[63 :56 ]=q0_2_o;
			f_p_o[71 :64]=q3_1_o;f_p_o[79 : 72]=q2_1_o;f_p_o[87 :80 ]=q1_1_o;f_p_o[95 :88 ]=q0_1_o;
			f_p_o[103:96]=q3_0_o;f_p_o[111:104]=q2_0_o;f_p_o[119:112]=q1_0_o;f_p_o[127:120]=q0_0_o;
        end
	  default:begin f_q_o =  128'b0	;f_p_o = 128'b0; end	 
    endcase	  
end


endmodule 		

			