// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

//--------------------------------------------------------------------
//
// Author:      Omkar Girish Kamath
// Module:      grav
// Date:        Oct 21st, 2023
// Description: Calculates Normalised acceleration due to gravity 
//              between 2 objects and adds partial sum.
//--------------------------------------------------------------------

module grav (
	     x1,
	     x2,
	     y1,
	     y2,
	     m1,
	     m2,
	     x1old_psum,
	     x2old_psum,
	     y1old_psum,
	     y2old_psum,
	     x1new_psum,
	     x2new_psum,
	     y1new_psum,
	     y2new_psum
	     );

   //--------------------------------------------------------------------
   // Inputs
   //--------------------------------------------------------------------
   input wire [26:0] x1;
   input wire [26:0] x2;
   input wire [26:0] y1;
   input wire [26:0] y2;
   input wire [26:0] m1;
   input wire [26:0] m2;
   input wire [26:0] x1old_psum;
   input wire [26:0] x2old_psum;
   input wire [26:0] y1old_psum;
   input wire [26:0] y2old_psum;
   
   //--------------------------------------------------------------------
   // Outputs
   //--------------------------------------------------------------------
   output reg [26:0] x1new_psum;
   output reg [26:0] x2new_psum;
   output reg [26:0] y1new_psum;
   output reg [26:0] y2new_psum;

   //--------------------------------------------------------------------
   // Internals
   //--------------------------------------------------------------------
   
   //stage 1-2
   reg [26:0] 	     m1_1_2;
   reg [26:0] 	     m2_1_2;
		     
   //stage 2-3
   reg [26:0] 	     m1_2_3;
   reg [26:0] 	     m2_2_3;
   reg [26:0] 	     dx_2_3;     // (x1-x2)
   reg [26:0] 	     dy_2_3;     // (y1-y2)

   //stage 3-4
   reg [26:0] 	     m1_3_4;
   reg [26:0] 	     m2_3_4;
   reg [26:0] 	     dx_3_4;
   reg [26:0] 	     dy_3_4;
   reg [26:0] 	     sqdx_3_4;   // (dx)^2
   reg [26:0] 	     sqdy_3_4;   // (dy)^2

   //stage 4-5
   reg [26:0] 	     m1_4_5;
   reg [26:0] 	     m2_4_5;
   reg [26:0] 	     dx_4_5;
   reg [26:0] 	     dy_4_5;

   //stage 5-6
   reg [26:0] 	     m1_5_6;
   reg [26:0] 	     m2_5_6;
   reg [26:0] 	     dx_5_6;     // delta y
   reg [26:0] 	     dy_5_6;     // delta x
   reg [26:0] 	     sqr_5_6;    //sq indicates square, r is radius
   
   //stage 6-7
   reg [26:0] 	     m1_6_7;
   reg [26:0] 	     m2_6_7;
   reg [26:0] 	     dx_6_7;
   reg [26:0] 	     dy_6_7;
   reg [26:0] 	     sqr_6_7;

   //stage 7-8
   reg [26:0] 	     m1_7_8;
   reg [26:0] 	     m2_7_8;
   reg [26:0] 	     dx_7_8;
   reg [26:0] 	     dy_7_8;
   reg [26:0] 	     sqr_7_8;
   reg [26:0] 	     epsr_7_8;  // r^2 + e^2
   
   //stage 8-9
   reg [26:0] 	     m1_8_9;
   reg [26:0] 	     m2_8_9;
   reg [26:0] 	     dx_8_9;
   reg [26:0] 	     dy_8_9;
   reg [26:0] 	     sqr_8_9;  // r^2
   
   //stage 9-10
   reg [26:0] 	     m1_9_10;
   reg [26:0] 	     m2_9_10;
   reg [26:0] 	     dx_9_10;
   reg [26:0] 	     dy_9_10;
   reg [26:0] 	     sqr_9_10;
   
   //stage 10-11
   reg [26:0] 	     m1_10_11;
   reg [26:0] 	     m2_10_11;
   reg [26:0] 	     dx_10_11;
   reg [26:0] 	     dy_10_11;
   reg [26:0] 	     sqr_10_11;
   reg [26:0] 	     invr_10_11; // 1/r
   
   //stage 11-12
   reg [26:0] 	     m1_11_12;
   reg [26:0] 	     m2_11_12;
   reg [26:0] 	     xhat_11_12;
   reg [26:0] 	     yhat_11_12;
   reg [26:0] 	     r_11_12;  // r

   //stage 12-13
   reg [26:0] 	     m1_12_13;
   reg [26:0] 	     m2_12_13;
   reg [26:0] 	     xhat_12_13;
   reg [26:0] 	     yhat_12_13;
   reg [26:0] 	     r_12_13;
   reg [26:0] 	     invsqepsr_12_13; // 1/(r^2+e^2)^(1/2)
   
   //stage 13-14
   reg [26:0] 	     m1_13_14;
   reg [26:0] 	     m2_13_14;
   reg [26:0] 	     xhat_13_14;
   reg [26:0] 	     yhat_13_14;
   reg [26:0] 	     rinvsqepsr_13_14;// r/(r^2+e^2)^(1/2)
   reg [26:0] 	     invepsr_13_14;   // 1/(r^2+e^2) 
   
   //stage 14-15
   reg [26:0] 	     m1_14_15;
   reg [26:0] 	     m2_14_15;
   reg [26:0] 	     xhat_14_15;
   reg [26:0] 	     yhat_14_15;
   reg [26:0] 	     fin_dist_14_15;// r/(r^2+e^2)^(3/2)

   //stage 15-16
   reg [26:0] 	     m1_15_16;    // m1
   reg [26:0] 	     negm2_15_16; //-m2
   reg [26:0] 	     axpart_15_16;// fin_dist * xhat
   reg [26:0] 	     aypart_15_16;// fin_dist * yhat
   
   //stage 16-17
   reg [26:0] 	     a2x_16_17;// fin_dist * yhat
   reg [26:0] 	     a2y_16_17;// fin_dist * yhat
   reg [26:0] 	     a1x_16_17;// fin_dist * yhat
   reg [26:0] 	     a1y_16_17;// fin_dist * yhat
   
   //stage 17-18
   // empty as all pipeline reg are present inside FpAdd mod
   
   //stage 18-19
   reg [26:0] 	     a2xpartsum_18_19;// new partial sum obj2 ax
   reg [26:0] 	     a2ypartsum_18_19;// new partial sum obj2 ay
   reg [26:0] 	     a1xpartsum_18_19;// new partial sum obj1 ax
   reg [26:0] 	     a1ypartsum_18_19;// new partial sum obj1 ay

   
   //--------------------------------------------------------------------
   // Module Contents
   //--------------------------------------------------------------------
   
   //--------------------------------------------------------------------
   // Stage 1
   //--------------------------------------------------------------------
   fp_negate neg1 (.in(x2),.neg_out(neg_x2));
   fp_negate neg1 (.in(x2),.neg_out(neg_x2));
   
   //--------------------------------------------------------------------
   // Stage 1
   //--------------------------------------------------------------------

   //--------------------------------------------------------------------
   // Stage 1
   //--------------------------------------------------------------------

   //--------------------------------------------------------------------
   // Stage 1
   //--------------------------------------------------------------------

   //--------------------------------------------------------------------
   // Stage 1
   //--------------------------------------------------------------------

   
   
endmodule // grav


// fast_inv_sqrt (.i_clk(),.i_rst(),.i_x(),.o_inv_sqrt());
// FpAdd (.clk(),.in1(),.in2(),.sum(),.rst());
// fp_mul (.num1(),.num2(),.res());
// fp_negate (.in(),.neg_out());
