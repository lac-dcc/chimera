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
// Filename       : db_normal_filter_1.v
// Author         : Chewein
// Created        : 2014-04-18
// Description    : calculation the delta ahead one cycles 
//----------------------------------------------------------------------------
module db_normal_filter_1(
							tc_i,
							p0_0_i  ,  p0_1_i  ,  p0_2_i ,
							p1_0_i  ,  p1_1_i  ,  p1_2_i ,
							p2_0_i  ,  p2_1_i  ,  p2_2_i ,
							p3_0_i  ,  p3_1_i  ,  p3_2_i ,
							                             
							q0_0_i  ,  q0_1_i  ,  q0_2_i ,
							q1_0_i  ,  q1_1_i  ,  q1_2_i ,
							q2_0_i  ,  q2_1_i  ,  q2_2_i ,
							q3_0_i  ,  q3_1_i  ,  q3_2_i ,
							
							delta0_o ,
							delta1_o ,
							delta2_o ,
							delta3_o ,
							
							not_nature_edge_o   
							);
//-------------------------- -------------------------------------------------
//
//                        INPUT/OUTPUT DECLARATION 
//
//----------------------------------------------------------------------------
input [4:0] tc_i      ;

input [7:0] p0_0_i  ,  p0_1_i  ,  p0_2_i  ,
		    p1_0_i  ,  p1_1_i  ,  p1_2_i  ,
		    p2_0_i  ,  p2_1_i  ,  p2_2_i  ,
		    p3_0_i  ,  p3_1_i  ,  p3_2_i  ;
                                             
input [7:0] q0_0_i  ,  q0_1_i  ,  q0_2_i  ,
            q1_0_i  ,  q1_1_i  ,  q1_2_i  ,
            q2_0_i  ,  q2_1_i  ,  q2_2_i  ,
            q3_0_i  ,  q3_1_i  ,  q3_2_i  ;
		
output [8:0]  delta0_o	 	;
output [8:0]  delta1_o	 	;
output [8:0]  delta2_o	 	;
output [8:0]  delta3_o	 	;

output [3:0] not_nature_edge_o  ;

wire signed [8:0]  delta0_o  ;
wire signed [8:0]  delta1_o  ;
wire signed [8:0]  delta2_o  ;
wire signed [8:0]  delta3_o  ;
//---------------------------------------------------------------------------
//
//              COMBINATION  CIRCUIT:cacl amplitude
//
//----------------------------------------------------------------------------
wire signed [8:0]  p0_0_s_w  =  {1'b0 , p0_0_i } ;
wire signed [8:0]  p0_1_s_w  =  {1'b0 , p0_1_i } ;
wire signed [8:0]  p0_2_s_w  =  {1'b0 , p0_2_i } ;
wire signed [8:0]  p1_0_s_w  =  {1'b0 , p1_0_i } ;
wire signed [8:0]  p1_1_s_w  =  {1'b0 , p1_1_i } ;
wire signed [8:0]  p1_2_s_w  =  {1'b0 , p1_2_i } ;
wire signed [8:0]  p2_0_s_w  =  {1'b0 , p2_0_i } ;
wire signed [8:0]  p2_1_s_w  =  {1'b0 , p2_1_i } ;
wire signed [8:0]  p2_2_s_w  =  {1'b0 , p2_2_i } ;
wire signed [8:0]  p3_0_s_w  =  {1'b0 , p3_0_i } ;
wire signed [8:0]  p3_1_s_w  =  {1'b0 , p3_1_i } ;
wire signed [8:0]  p3_2_s_w  =  {1'b0 , p3_2_i } ;
                                                
wire signed [8:0]  q0_0_s_w  =  {1'b0 , q0_0_i } ;
wire signed [8:0]  q0_1_s_w  =  {1'b0 , q0_1_i } ;
wire signed [8:0]  q0_2_s_w  =  {1'b0 , q0_2_i } ;
wire signed [8:0]  q1_0_s_w  =  {1'b0 , q1_0_i } ;
wire signed [8:0]  q1_1_s_w  =  {1'b0 , q1_1_i } ;
wire signed [8:0]  q1_2_s_w  =  {1'b0 , q1_2_i } ;
wire signed [8:0]  q2_0_s_w  =  {1'b0 , q2_0_i } ;
wire signed [8:0]  q2_1_s_w  =  {1'b0 , q2_1_i } ;
wire signed [8:0]  q2_2_s_w  =  {1'b0 , q2_2_i } ;
wire signed [8:0]  q3_0_s_w  =  {1'b0 , q3_0_i } ;
wire signed [8:0]  q3_1_s_w  =  {1'b0 , q3_1_i } ;
wire signed [8:0]  q3_2_s_w  =  {1'b0 , q3_2_i } ;

wire [8:0] tc_mux_10 = (tc_i<<3) + (tc_i<<1) ;

wire signed  [5:0] tc_x = ~tc_i + 1'b1 ;
wire signed  [5:0] tc_y = {1'b0,tc_i};

//1 pixel filtered  
wire  signed [8:0]  qm_p00      =  q0_0_s_w - p0_0_s_w   ; 
wire  signed [8:0]  qm_p10      =  q1_0_s_w - p1_0_s_w   ; 
wire  signed [8:0]  qm_p20      =  q2_0_s_w - p2_0_s_w   ; 
wire  signed [8:0]  qm_p30      =  q3_0_s_w - p3_0_s_w   ; 

wire  signed [8:0]  qm_p01      =  q0_1_s_w - p0_1_s_w   ;
wire  signed [8:0]  qm_p11      =  q1_1_s_w - p1_1_s_w   ;
wire  signed [8:0]  qm_p21      =  q2_1_s_w - p2_1_s_w   ;
wire  signed [8:0]  qm_p31      =  q3_1_s_w - p3_1_s_w   ;

wire  signed [11:0] qm_p0_m_8_w = {qm_p00,3'b0}      ;
wire  signed [11:0] qm_p1_m_8_w = {qm_p10,3'b0}      ;
wire  signed [11:0] qm_p2_m_8_w = {qm_p20,3'b0}      ;
wire  signed [11:0] qm_p3_m_8_w = {qm_p30,3'b0}      ;

wire  signed [11:0] qm_p0_m_1_w = {{2{qm_p01[8]}},qm_p01,1'b0} ;
wire  signed [11:0] qm_p1_m_1_w = {{2{qm_p11[8]}},qm_p11,1'b0} ;
wire  signed [11:0] qm_p2_m_1_w = {{2{qm_p21[8]}},qm_p21,1'b0} ;
wire  signed [11:0] qm_p3_m_1_w = {{2{qm_p31[8]}},qm_p31,1'b0} ;

wire signed  [11:0] qm_p0_w     = qm_p0_m_8_w - qm_p0_m_1_w; 
wire signed  [11:0] qm_p1_w     = qm_p1_m_8_w - qm_p1_m_1_w;
wire signed  [11:0] qm_p2_w     = qm_p2_m_8_w - qm_p2_m_1_w;
wire signed  [11:0] qm_p3_w     = qm_p3_m_8_w - qm_p3_m_1_w;
  
wire signed  [8:0]  qm_q0_w     = qm_p00  -   qm_p01   ;
wire signed  [8:0]  qm_q1_w     = qm_p10  -   qm_p11   ;
wire signed  [8:0]  qm_q2_w     = qm_p20  -   qm_p21   ;
wire signed  [8:0]  qm_q3_w     = qm_p30  -   qm_p31   ;
   
wire signed  [11:0] qm_q0_e3_w  = {{3{qm_q0_w[8]}},qm_q0_w};
wire signed  [11:0] qm_q1_e3_w  = {{3{qm_q1_w[8]}},qm_q1_w};
wire signed  [11:0] qm_q2_e3_w  = {{3{qm_q2_w[8]}},qm_q2_w};
wire signed  [11:0] qm_q3_e3_w  = {{3{qm_q3_w[8]}},qm_q3_w};

wire signed  [12:0] delta0_w     = qm_p0_w + qm_q0_e3_w+8;
wire signed  [12:0] delta1_w     = qm_p1_w + qm_q1_e3_w+8;
wire signed  [12:0] delta2_w     = qm_p2_w + qm_q2_e3_w+8;
wire signed  [12:0] delta3_w     = qm_p3_w + qm_q3_e3_w+8;

wire  signed [8:0] delta0       =  delta0_w[12:4];
wire  signed [8:0] delta1       =  delta1_w[12:4];
wire  signed [8:0] delta2       =  delta2_w[12:4];
wire  signed [8:0] delta3       =  delta3_w[12:4];

//wire  signed [8:0] delta0   =  delta0_m[12:4] ;
//wire  signed [8:0] delta1   =  delta1_m[12:4] ;
//wire  signed [8:0] delta2   =  delta2_m[12:4] ;
//wire  signed [8:0] delta3   =  delta3_m[12:4] ;

wire [8:0]  delta0_abs  =  delta0[8]  ?  ( ~delta0 + 1'b1 ) : delta0 ;
wire [8:0]  delta1_abs  =  delta1[8]  ?  ( ~delta1 + 1'b1 ) : delta1 ;
wire [8:0]  delta2_abs  =  delta2[8]  ?  ( ~delta2 + 1'b1 ) : delta2 ;
wire [8:0]  delta3_abs  =  delta3[8]  ?  ( ~delta3 + 1'b1 ) : delta3 ;

assign not_nature_edge_o[0] = ( delta0_abs < tc_mux_10) ? 1'b1 : 1'b0 ;
assign not_nature_edge_o[1] = ( delta1_abs < tc_mux_10) ? 1'b1 : 1'b0 ;
assign not_nature_edge_o[2] = ( delta2_abs < tc_mux_10) ? 1'b1 : 1'b0 ;
assign not_nature_edge_o[3] = ( delta3_abs < tc_mux_10) ? 1'b1 : 1'b0 ;
   
assign delta0_o  = (delta0 <  tc_x ) ? tc_x : (delta0 > tc_y ? tc_y : delta0) ;
assign delta1_o  = (delta1 <  tc_x ) ? tc_x : (delta1 > tc_y ? tc_y : delta1) ;
assign delta2_o  = (delta2 <  tc_x ) ? tc_x : (delta2 > tc_y ? tc_y : delta2) ;
assign delta3_o  = (delta3 <  tc_x ) ? tc_x : (delta3 > tc_y ? tc_y : delta3) ;


endmodule 
