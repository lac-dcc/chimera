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
// Filename       : db_normal_filter_2.v
// Author         : Chewein
// Created        : 2014-04-018
// Description    : 1. normal filter with 1 pixels filtered
//					2. normal filter with 2 pixels filtered
//        			3. chroma filter 
//----------------------------------------------------------------------------
module db_normal_filter_2(
							tc_i,
							
							p0_0_i  ,  p0_1_i  ,  p0_2_i ,
							p1_0_i  ,  p1_1_i  ,  p1_2_i ,
							p2_0_i  ,  p2_1_i  ,  p2_2_i ,
							p3_0_i  ,  p3_1_i  ,  p3_2_i ,
							                             
							q0_0_i  ,  q0_1_i  ,  q0_2_i ,
							q1_0_i  ,  q1_1_i  ,  q1_2_i ,
							q2_0_i  ,  q2_1_i  ,  q2_2_i ,
							q3_0_i  ,  q3_1_i  ,  q3_2_i ,
							
							delta0_i,
							delta1_i,
							delta2_i,
							delta3_i,
							
							p0_0_o  ,
							p1_0_o  ,
							p2_0_o  ,
							p3_0_o  ,
 
							q0_0_o  ,
							q1_0_o  ,
							q2_0_o  ,
							q3_0_o  , 
							
						    p0_1_o  ,
						    p1_1_o  ,
						    p2_1_o  ,
						    p3_1_o  ,
						           
						    q0_1_o  ,
						    q1_1_o  ,
				            q2_1_o  ,
                            q3_1_o  ,  
							
							p0_0_c_o,
                            p1_0_c_o,
                            p2_0_c_o,
                            p3_0_c_o,
							 
							q0_0_c_o,
							q1_0_c_o,
							q2_0_c_o,
                            q3_0_c_o
						);
//-------------------------- -------------------------------------------------
//
//                        INPUT/OUTPUT DECLARATION 
//
//----------------------------------------------------------------------------
input [4:0] tc_i;

input [7:0] p0_0_i  ,  p0_1_i  ,  p0_2_i  ,
		    p1_0_i  ,  p1_1_i  ,  p1_2_i  ,
		    p2_0_i  ,  p2_1_i  ,  p2_2_i  ,
		    p3_0_i  ,  p3_1_i  ,  p3_2_i  ;
                                             
input [7:0] q0_0_i  ,  q0_1_i  ,  q0_2_i  ,
            q1_0_i  ,  q1_1_i  ,  q1_2_i  ,
            q2_0_i  ,  q2_1_i  ,  q2_2_i  ,
            q3_0_i  ,  q3_1_i  ,  q3_2_i  ;

input [8:0] delta0_i  	     ;
input [8:0] delta1_i  	     ;
input [8:0] delta2_i  	     ;
input [8:0] delta3_i  	     ;

output[7:0] p0_0_o  ,  p1_0_o  ,  p2_0_o   , p3_0_o ;                   
output[7:0] q0_0_o  ,  q1_0_o  ,  q2_0_o   , q3_0_o ;

output[7:0] p0_1_o  ,  p1_1_o  ,  p2_1_o   , p3_1_o	 ;
output[7:0] q0_1_o  ,  q1_1_o  ,  q2_1_o   , q3_1_o  ;
			  
output [7:0]  p0_0_c_o,q0_0_c_o ;//chroma output 
output [7:0]  p1_0_c_o,q1_0_c_o ;
output [7:0]  p2_0_c_o,q2_0_c_o ;
output [7:0]  p3_0_c_o,q3_0_c_o ;			  
			  
wire  signed [8:0]  delta0_i  ;
wire  signed [8:0]  delta1_i  ;
wire  signed [8:0]  delta2_i  ;
wire  signed [8:0]  delta3_i  ;			  

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
//-----------------------------------------------------------------------------
//normal filter:1
wire  signed [9:0] pplus_delta00_w  =   p0_0_s_w + delta0_i    ;
wire  signed [9:0] pplus_delta10_w  =   p1_0_s_w + delta1_i    ;
wire  signed [9:0] pplus_delta20_w  =   p2_0_s_w + delta2_i    ;
wire  signed [9:0] pplus_delta30_w  =   p3_0_s_w + delta3_i    ;

wire  signed [9:0] qplus_delta00_w  =   q0_0_s_w - delta0_i    ;
wire  signed [9:0] qplus_delta10_w  =   q1_0_s_w - delta1_i    ;
wire  signed [9:0] qplus_delta20_w  =   q2_0_s_w - delta2_i    ;
wire  signed [9:0] qplus_delta30_w  =   q3_0_s_w - delta3_i    ;
                   
assign  p0_0_o  =   pplus_delta00_w[9] ? 8'b0 : ( (pplus_delta00_w  >  10'd255 )? 8'd255 : pplus_delta00_w[7:0] );
assign  p1_0_o  =   pplus_delta10_w[9] ? 8'b0 : ( (pplus_delta10_w  >  10'd255 )? 8'd255 : pplus_delta10_w[7:0] );
assign  p2_0_o  =   pplus_delta20_w[9] ? 8'b0 : ( (pplus_delta20_w  >  10'd255 )? 8'd255 : pplus_delta20_w[7:0] );
assign  p3_0_o  =   pplus_delta30_w[9] ? 8'b0 : ( (pplus_delta30_w  >  10'd255 )? 8'd255 : pplus_delta30_w[7:0] );
           
assign  q0_0_o  =   qplus_delta00_w[9] ? 8'b0 : ( (qplus_delta00_w  >  10'd255 )? 8'd255 : qplus_delta00_w[7:0] );
assign  q1_0_o  =   qplus_delta10_w[9] ? 8'b0 : ( (qplus_delta10_w  >  10'd255 )? 8'd255 : qplus_delta10_w[7:0] );
assign  q2_0_o  =   qplus_delta20_w[9] ? 8'b0 : ( (qplus_delta20_w  >  10'd255 )? 8'd255 : qplus_delta20_w[7:0] );
assign  q3_0_o  =   qplus_delta30_w[9] ? 8'b0 : ( (qplus_delta30_w  >  10'd255 )? 8'd255 : qplus_delta30_w[7:0] );
//-----------------------------------------------------------------------------
//normal filter:2

wire signed [4:0] tc_div_x =~(tc_i[4:1]) + 1'b1;
wire signed [4:0] tc_div_y ={1'b0,tc_i[4:1]} ;

wire  signed [8:0] deltap2_0_w  =  ( ( (p0_2_s_w + p0_0_s_w + 1) >>1) - p0_1_s_w + delta0_i) >>1 ;
wire  signed [8:0] deltap2_1_w  =  ( ( (p1_2_s_w + p1_0_s_w + 1) >>1) - p1_1_s_w + delta1_i) >>1 ;
wire  signed [8:0] deltap2_2_w  =  ( ( (p2_2_s_w + p2_0_s_w + 1) >>1) - p2_1_s_w + delta2_i) >>1 ;
wire  signed [8:0] deltap2_3_w  =  ( ( (p3_2_s_w + p3_0_s_w + 1) >>1) - p3_1_s_w + delta3_i) >>1 ;

wire  signed [8:0] deltaq2_0_w  =  ( ( (q0_2_s_w + q0_0_s_w + 1) >>1) - q0_1_s_w - delta0_i) >>1 ;
wire  signed [8:0] deltaq2_1_w  =  ( ( (q1_2_s_w + q1_0_s_w + 1) >>1) - q1_1_s_w - delta1_i) >>1 ;
wire  signed [8:0] deltaq2_2_w  =  ( ( (q2_2_s_w + q2_0_s_w + 1) >>1) - q2_1_s_w - delta2_i) >>1 ;
wire  signed [8:0] deltaq2_3_w  =  ( ( (q3_2_s_w + q3_0_s_w + 1) >>1) - q3_1_s_w - delta3_i) >>1 ;

wire  signed [8:0] delta2_p0_w  = deltap2_0_w < tc_div_x ?  tc_div_x : (deltap2_0_w > tc_div_y  ? tc_div_y  : deltap2_0_w);
wire  signed [8:0] delta2_p1_w  = deltap2_1_w < tc_div_x ?  tc_div_x : (deltap2_1_w > tc_div_y  ? tc_div_y  : deltap2_1_w); 
wire  signed [8:0] delta2_p2_w  = deltap2_2_w < tc_div_x ?  tc_div_x : (deltap2_2_w > tc_div_y  ? tc_div_y  : deltap2_2_w); 
wire  signed [8:0] delta2_p3_w  = deltap2_3_w < tc_div_x ?  tc_div_x : (deltap2_3_w > tc_div_y  ? tc_div_y  : deltap2_3_w);  
                                  
wire  signed [8:0] delta2_q0_w  = deltaq2_0_w < tc_div_x ?  tc_div_x : (deltaq2_0_w > tc_div_y  ? tc_div_y  : deltaq2_0_w);
wire  signed [8:0] delta2_q1_w  = deltaq2_1_w < tc_div_x ?  tc_div_x : (deltaq2_1_w > tc_div_y  ? tc_div_y  : deltaq2_1_w); 
wire  signed [8:0] delta2_q2_w  = deltaq2_2_w < tc_div_x ?  tc_div_x : (deltaq2_2_w > tc_div_y  ? tc_div_y  : deltaq2_2_w); 
wire  signed [8:0] delta2_q3_w  = deltaq2_3_w < tc_div_x ?  tc_div_x : (deltaq2_3_w > tc_div_y  ? tc_div_y  : deltaq2_3_w);  

wire  signed [9:0] pplus_delta01_w  =   p0_1_s_w + delta2_p0_w  ;
wire  signed [9:0] pplus_delta11_w  =   p1_1_s_w + delta2_p1_w  ;
wire  signed [9:0] pplus_delta21_w  =   p2_1_s_w + delta2_p2_w  ;
wire  signed [9:0] pplus_delta31_w  =   p3_1_s_w + delta2_p3_w  ;
                                             
wire  signed [9:0] qplus_delta01_w  =   q0_1_s_w + delta2_q0_w  ;
wire  signed [9:0] qplus_delta11_w  =   q1_1_s_w + delta2_q1_w  ;
wire  signed [9:0] qplus_delta21_w  =   q2_1_s_w + delta2_q2_w  ;
wire  signed [9:0] qplus_delta31_w  =   q3_1_s_w + delta2_q3_w  ;

assign p0_1_o   =   pplus_delta01_w[9] ? 8'd0 : ( pplus_delta01_w[8]? 8'd255 : pplus_delta01_w[7:0]);
assign p1_1_o   =   pplus_delta11_w[9] ? 8'd0 : ( pplus_delta11_w[8]? 8'd255 : pplus_delta11_w[7:0]);
assign p2_1_o   =   pplus_delta21_w[9] ? 8'd0 : ( pplus_delta21_w[8]? 8'd255 : pplus_delta21_w[7:0]);
assign p3_1_o   =   pplus_delta31_w[9] ? 8'd0 : ( pplus_delta31_w[8]? 8'd255 : pplus_delta31_w[7:0]);
  
assign q0_1_o   =   qplus_delta01_w[9] ? 8'd0 : ( qplus_delta01_w[8]? 8'd255 : qplus_delta01_w[7:0]);
assign q1_1_o   =   qplus_delta11_w[9] ? 8'd0 : ( qplus_delta11_w[8]? 8'd255 : qplus_delta11_w[7:0]);
assign q2_1_o   =   qplus_delta21_w[9] ? 8'd0 : ( qplus_delta21_w[8]? 8'd255 : qplus_delta21_w[7:0]);
assign q3_1_o   =   qplus_delta31_w[9] ? 8'd0 : ( qplus_delta31_w[8]? 8'd255 : qplus_delta31_w[7:0]);
//--------------------------------------------------------------------------------------------------------------------------
//chroma filter
wire  signed [8:0]  delta0_w  ;//chroma delta
wire  signed [8:0]  delta1_w  ;//chroma delta
wire  signed [8:0]  delta2_w  ;//chroma delta
wire  signed [8:0]  delta3_w  ;//chroma delta

wire  signed [5:0]  tc_x        ;
wire  signed [5:0]  tc_y        ;

assign delta0_w = ((((q0_0_s_w-p0_0_s_w)<<2)+p0_1_s_w-q0_1_s_w+4)>>3);
assign delta1_w = ((((q1_0_s_w-p1_0_s_w)<<2)+p1_1_s_w-q1_1_s_w+4)>>3);
assign delta2_w = ((((q2_0_s_w-p2_0_s_w)<<2)+p2_1_s_w-q2_1_s_w+4)>>3);
assign delta3_w = ((((q3_0_s_w-p3_0_s_w)<<2)+p3_1_s_w-q3_1_s_w+4)>>3);

assign tc_x       = ~tc_i + 1'b1 ;
assign tc_y       = {1'b0,tc_i}  ;

wire  signed [8:0]  delta0_tc_w  ;//chroma delta
wire  signed [8:0]  delta1_tc_w  ;//chroma delta
wire  signed [8:0]  delta2_tc_w  ;//chroma delta
wire  signed [8:0]  delta3_tc_w  ;//chroma delta

assign delta0_tc_w = delta0_w < tc_x ? tc_x : (delta0_w > tc_y ? tc_y :delta0_w ) ;
assign delta1_tc_w = delta1_w < tc_x ? tc_x : (delta1_w > tc_y ? tc_y :delta1_w ) ;
assign delta2_tc_w = delta2_w < tc_x ? tc_x : (delta2_w > tc_y ? tc_y :delta2_w ) ;
assign delta3_tc_w = delta3_w < tc_x ? tc_x : (delta3_w > tc_y ? tc_y :delta3_w ) ;

wire signed [9:0] p0_0_m_w,q0_0_m_w ;
wire signed [9:0] p1_0_m_w,q1_0_m_w ;
wire signed [9:0] p2_0_m_w,q2_0_m_w ;
wire signed [9:0] p3_0_m_w,q3_0_m_w ;

assign p0_0_m_w  = p0_0_s_w  + delta0_tc_w  ;
assign p1_0_m_w  = p1_0_s_w  + delta1_tc_w  ;
assign p2_0_m_w  = p2_0_s_w  + delta2_tc_w  ;
assign p3_0_m_w  = p3_0_s_w  + delta3_tc_w  ;
assign q0_0_m_w  = q0_0_s_w  - delta0_tc_w  ;
assign q1_0_m_w  = q1_0_s_w  - delta1_tc_w  ;
assign q2_0_m_w  = q2_0_s_w  - delta2_tc_w  ;
assign q3_0_m_w  = q3_0_s_w  - delta3_tc_w  ;

assign p0_0_c_o  =  p0_0_m_w[9] ? 8'd0 :(p0_0_m_w[8] ? 8'd255 :p0_0_m_w[7:0]);
assign p1_0_c_o  =  p1_0_m_w[9] ? 8'd0 :(p1_0_m_w[8] ? 8'd255 :p1_0_m_w[7:0]);
assign p2_0_c_o  =  p2_0_m_w[9] ? 8'd0 :(p2_0_m_w[8] ? 8'd255 :p2_0_m_w[7:0]);
assign p3_0_c_o  =  p3_0_m_w[9] ? 8'd0 :(p3_0_m_w[8] ? 8'd255 :p3_0_m_w[7:0]);

assign q0_0_c_o  =  q0_0_m_w[9] ? 8'd0 :(q0_0_m_w[8] ? 8'd255 :q0_0_m_w[7:0]);
assign q1_0_c_o  =  q1_0_m_w[9] ? 8'd0 :(q1_0_m_w[8] ? 8'd255 :q1_0_m_w[7:0]);
assign q2_0_c_o  =  q2_0_m_w[9] ? 8'd0 :(q2_0_m_w[8] ? 8'd255 :q2_0_m_w[7:0]);
assign q3_0_c_o  =  q3_0_m_w[9] ? 8'd0 :(q3_0_m_w[8] ? 8'd255 :q3_0_m_w[7:0]);

endmodule 
