// This program was cloned from: https://github.com/ahmedshahein/DSP-RTL-Lib
// License: BSD 2-Clause "Simplified" License

// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
//
// -------------------------------------------------------------------
module sgen_cordic #(
  parameter gp_mode_rot_vec            = 0,
  parameter gp_impl_unrolled_iterative = 0,
  parameter gp_nr_iter                 = 16,
  parameter gp_angle_width             = 16,
  parameter gp_angle_depth             = 16,
  parameter gp_xy_width                = 8,
  parameter gp_z_width                 = 8
) (
  input  wire                          i_rst_an,
  input  wire                          i_ena,
  input  wire                          i_clk,
  input  wire signed [gp_xy_width-1:0] i_x,
  input  wire signed [gp_xy_width-1:0] i_y,
  input  wire signed [gp_z_width-1 :0] i_z,
  output wire signed [gp_xy_width-1:0] o_x,
  output wire signed [gp_xy_width-1:0] o_y,
  output wire signed [gp_z_width-1 :0] o_z,
  output wire                          o_done
);
// -------------------------------------------------------------------
  // CONSTANT DECLARATION
  localparam c_ext_bits          = $clog2(gp_nr_iter);
  localparam c_xy_internal_width = gp_xy_width + c_ext_bits;
  localparam c_z_internal_width  = gp_z_width;
  localparam c_iter_width        = (!gp_impl_unrolled_iterative) ? c_ext_bits : 0;
  // WIRE DECLARATION
  wire signed [gp_angle_width-1:0] atan_lut [0:gp_angle_depth-1];
// -------------------------------------------------------------------
  `include "atan_lut.v"
// -------------------------------------------------------------------
  
  genvar i;
  generate
    if (gp_impl_unrolled_iterative)
      begin: g_cordic_unrolled
        // WIRE DECLARATION
        wire signed [c_xy_internal_width-1:0] x_init;
        wire signed [c_xy_internal_width-1:0] y_init;
        wire signed [c_z_internal_width-1 :0] z_init;
        wire                                  d [0:gp_nr_iter-1];
        wire signed [c_xy_internal_width-1:0] x [0:gp_nr_iter-1];
        wire signed [c_xy_internal_width-1:0] y [0:gp_nr_iter-1];
        wire signed [c_z_internal_width-1 :0] z [0:gp_nr_iter-1];

	// INITIALIZATION
        assign x_init = i_x<<<c_ext_bits;
	assign y_init = i_y<<<c_ext_bits;
	assign z_init = i_z;
	// CORDIC UNROLLED ITERATIONS
        for (i=0; i<gp_nr_iter; i=i+1)
          begin: g_cordic_iterations
            if (i==0)
    	      begin: g_cordic_init
    	        if (gp_mode_rot_vec)
    	          begin: g_d_init_rot
    	            assign d[i] = (z_init[c_z_internal_width-1] == 0)  ? 1'b1 : 1'b0;
    	          end
    	        else
    	          begin: g_d_init_vec
    	            assign d[i] = (y_init[c_xy_internal_width-1] == 1) ? 1'b1 : 1'b0;
    	          end
    	        // CORDIC ALGORITHM
    	        assign x[i] = (d[i]) ? x_init - y_init      : x_init + y_init;
    	        assign y[i] = (d[i]) ? y_init + x_init      : y_init - x_init;
    	        assign z[i] = (d[i]) ? z_init - atan_lut[i] : z_init + atan_lut[i];
    	      end
    	    else
    	      begin
    	        if (gp_mode_rot_vec)
    	          begin: g_d_rot
    	            assign d[i] = (z[i-1][c_z_internal_width-1] == 0)  ? 1'b1 : 1'b0;
    	          end
    	        else
    	          begin: g_d_vec
    	            assign d[i] = (y[i-1][c_xy_internal_width-1] == 1) ? 1'b1 : 1'b0;
    	          end	  
    	        // CORDIC ALGORITHM
    	        assign x[i] = (d[i]) ? x[i-1] - (y[i-1] >>> i) : x[i-1] + (y[i-1] >>> i);
    	        assign y[i] = (d[i]) ? y[i-1] + (x[i-1] >>> i) : y[i-1] - (x[i-1] >>> i);
    	        assign z[i] = (d[i]) ? z[i-1] - atan_lut[i]    : z[i-1] + atan_lut[i];
    	    end	
          end//FOR_CORDIC_UNROLLED

	// OUTPUT ASSIGNMENT
	assign o_x = x[gp_nr_iter-1];        
        assign o_y = y[gp_nr_iter-1];
        assign o_z = z[gp_nr_iter-1];
      end//IF_CORDIC_ROT
  endgenerate
  
  generate
    if (!gp_impl_unrolled_iterative)
      begin: g_cordic_iterative
        // WIRE DECLARATION
        wire signed [c_xy_internal_width-1:0] w_x;
        wire signed [c_xy_internal_width-1:0] w_y;
        wire signed [c_z_internal_width-1 :0] w_z;
        wire signed [c_xy_internal_width-1:0] x;
        wire signed [c_xy_internal_width-1:0] y;
        wire signed [c_z_internal_width-1 :0] z;
        // REGISTER DECLARATION
	reg  signed [c_xy_internal_width-1:0] r_x;
        reg  signed [c_xy_internal_width-1:0] r_y;
        reg  signed [c_z_internal_width-1 :0] r_z;
        reg         [c_iter_width-1       :0] r_count_iter;
        // ITERATION COUNTER
        always @(posedge i_clk or negedge i_rst_an)
          begin: p_iter_count
            if (!i_rst_an)
              begin
      	        r_count_iter <= {c_iter_width{1'b1}};
      	      end
            else if (i_ena)
              begin
      	        if (r_count_iter < gp_nr_iter)
      	          r_count_iter <= r_count_iter + 1'b1;
      	        else
      	          r_count_iter <= {c_iter_width{1'b0}};
      	      end
          end
        // CORDIC REG-BANK
        always @(posedge i_clk or negedge i_rst_an)
          begin: p_cordic_iter_regbank
            if (!i_rst_an)
              begin
      	        r_x <= 'd0;
      	        r_y <= 'd0;
      	        r_z <= 'd0;
      	      end
            else if (i_ena)
              begin
      	        if (r_count_iter>(gp_nr_iter-1))
      	          begin
      	            r_x <= i_x<<<c_ext_bits;
      	            r_y <= i_y<<<c_ext_bits;
      	            r_z <= i_z;
      	          end
      	        else
      	          begin
      	            r_x <= x;
      	            r_y <= y;
      	            r_z <= z;
      	          end	  
      	      end
          end
        
        // RESOURCE SHARING
        assign w_x = (gp_mode_rot_vec) ? ( (r_z[c_z_internal_width-1])  ? -r_x :  r_x )   // ROTATION MODE
	                               : ( (r_y[c_xy_internal_width-1]) ?  r_x : -r_x );  // VECTORING MODE
        assign w_y = (gp_mode_rot_vec) ? ( (r_z[c_z_internal_width-1])  ?  r_y : -r_y )   // ROTATION MODE
	                               : ( (r_y[c_xy_internal_width-1]) ? -r_y :  r_y );  // VECTORING MODE      
        assign w_z = (gp_mode_rot_vec) ? ( (r_z[c_z_internal_width-1])  ?  atan_lut[r_count_iter] : -atan_lut[r_count_iter])   // ROTATION MODE
                                       : ( (r_y[c_xy_internal_width-1]) ? -atan_lut[r_count_iter] :  atan_lut[r_count_iter]);  // VECTORING MODE
        
	// CORDIC ALGORITHM - ITERATIVE RESOURCE SHARING
        assign x = r_x + (w_y >>> r_count_iter);
        assign y = r_y + (w_x >>> r_count_iter);
        assign z = r_z + w_z;
	
	// OUTPUT ASSIGNMENT
	assign o_x = x;        
        assign o_y = y;
        assign o_z = z;	
      end//IF_CORDIC_VEC
  endgenerate  
  
endmodule

// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
//
// -------------------------------------------------------------------
module cordic_gain #(
  parameter gp_mode_rot_vec = 0,
  parameter gp_gain_width   = 12,
  parameter gp_xy_width     = 8,
  parameter gp_xy_owidth    = gp_xy_width+$clog2(gp_gain_width)
) (
  input  wire signed [gp_xy_width-1 :0] i_cordic_x,
  input  wire signed [gp_xy_width-1 :0] i_cordic_y,
  output wire signed [gp_xy_owidth-1:0] o_cordic_x,
  output wire signed [gp_xy_owidth-1:0] o_cordic_y
);
// -------------------------------------------------------------------
  localparam c_1_gain = $rtoi( 0.607252959138945 * (2.0**(gp_gain_width-1)) );
  wire signed [gp_xy_width+gp_gain_width-1:0] x_tmp;
  wire signed [gp_xy_width+gp_gain_width-1:0] y_tmp;
// -------------------------------------------------------------------  
  assign x_tmp = i_cordic_x * c_1_gain;
	
  if (gp_mode_rot_vec)
    begin	    	    
      assign y_tmp = i_cordic_x * c_1_gain;
    end
  else
    begin
      assign y_tmp = 'd0;
    end	

  // OUTPUT ASSIGNMENT
  assign o_cordic_x = x_tmp >>> (gp_gain_width-1);    
  assign o_cordic_y = y_tmp >>> (gp_gain_width-1);
endmodule
