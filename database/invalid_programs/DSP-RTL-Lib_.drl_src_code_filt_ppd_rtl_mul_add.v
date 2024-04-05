// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
`define DIV(N, D) (N%D==0) ? (N/D) : (N/D+1)
// -------------------------------------------------------------------
module mul_add #(
  parameter gp_idata_width       = 6,                                    // Set input data width
  parameter gp_decimation_factor = 31,                                    // Set number of output channels
  parameter gp_coeff_length      = 53,                                   // Set filter coefficient length
  parameter gp_coeff_width       = 16,                                   // Set filter coefficient filter bit-width
  parameter gp_tf_df             = 1,                                    // Select filter topology 1-> TF | 0-> DF  
  parameter gp_ccw               = 1,                                    // Select multiplier 1-> Counter Clock Wise | 0 -> Clock Wise
  parameter gp_odata_width       = gp_idata_width+gp_coeff_width+$clog2(gp_decimation_factor)+$clog2(`DIV(gp_coeff_length,gp_decimation_factor))
                                                                         // Set output bit-width
) (
  input  wire                                                  i_rst_an, // Asynchronous active low reset
  input  wire                                                  i_ena,	 // Synchronous active high enable
  input  wire                                                  i_clk,	 // Rising-edge clock
  input  wire signed [gp_decimation_factor*gp_idata_width-1:0] i_data,	 // Input data with gp_idata_width bits MSB:LSB, signed
  output wire signed [gp_odata_width-1:0]                      o_data	 // Output data with gp_decimation_factor x gp_idata_width width MSB:LSB, signed
);
// -------------------------------------------------------------------
  // CONSTANT DECLARATION
  localparam c_coeff_2          = `DIV(gp_coeff_length, 2);
  localparam c_col              = `DIV(gp_coeff_length, gp_decimation_factor);
  localparam c_row_x_col        = gp_decimation_factor * c_col;
  localparam c_mul_out_width    = gp_idata_width       + gp_coeff_width;
  localparam c_add_out_width    = $clog2(gp_decimation_factor) + c_mul_out_width;
  localparam c_sum_out_width    = c_add_out_width      + $clog2(c_col);
  localparam c_commutator_width = gp_decimation_factor * gp_idata_width;
  localparam c_msb_filler_width = c_sum_out_width      - c_add_out_width;
  // WIRE DECLARATION
  wire signed [gp_coeff_width-1:0]                      c_coeff [0:c_coeff_2-1]; 
  wire signed [c_mul_out_width*c_row_x_col-1:0]         w_mul;
  wire signed [c_add_out_width*(c_row_x_col-c_col)-1:0] w_add_tree;
  wire signed [c_row_x_col*gp_idata_width-1:0]          w_mul_inp_tf;
  wire signed [c_row_x_col*gp_idata_width-1:0]          w_mul_inp_df;
  wire signed [c_row_x_col*gp_idata_width-1:0]          w_mul_inp;
  wire signed [c_sum_out_width*c_col-1:0]               w_sum;
  wire signed [c_sum_out_width*(c_col-1)-1:0]           d_sum;
  wire signed [gp_decimation_factor*gp_idata_width-1:0] w_byte_reverse;
  // GENERATE VARIABLES DECLARATION
  genvar i, j, k, l, m, n, o;
// -------------------------------------------------------------------
  /***********************/
  /* FILTER COEFFICIENTS */
  /***********************/
  `include "filt_coeff.v"

  /***********************/
  /* CONSTANT MULTIPLIER */
  /**********************/
  generate
    // TRANSPOSED-FORM CONSTANT MULTIPLIER //
    if (gp_tf_df)
      begin: g_mul_tf
        // COUNTER CLOCK-WISE //
	if (gp_ccw)
	  begin: g_mul_tf_ccw
	    for (i=0; i<c_row_x_col; i=i+1)
	      begin: g_mul_coeff
	        if (i<c_coeff_2)
                  assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = $signed(w_mul_inp[(i+1)*gp_idata_width-1 -: gp_idata_width]) * c_coeff[i];
                else if (i<gp_coeff_length)
                  assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = $signed(w_mul_inp[(i+1)*gp_idata_width-1 -: gp_idata_width]) * c_coeff[gp_coeff_length-i-1];
                else
                  assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = 'd0;
	      end
	  end
	// CLOCK-WISE //
	else
	  begin: g_mul_tf_cw
	    for (i=0; i<c_row_x_col; i=i+1)
	      begin: g_mul_coeff
	        if (i<c_coeff_2)
                  assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = $signed(w_mul_inp[(c_row_x_col-i)*gp_idata_width-1 -: gp_idata_width]) * c_coeff[i];
                else if (i<gp_coeff_length)
                  assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = $signed(w_mul_inp[(c_row_x_col-i)*gp_idata_width-1 -: gp_idata_width]) * c_coeff[gp_coeff_length-i-1];
                else
                  assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = 'd0;
	      end	  
	  end
      end
    // DIRECT-FORM CONSTANT MULTIPLIER //
    else
      begin: g_mul_df
        // COUNTER CLOCK-WISE //
	if (gp_ccw)
	  begin: g_mul_df_ccw
	    for (i=0; i<c_row_x_col; i=i+1)
	      begin: g_mul_coeff
	        if (i<c_coeff_2)
                  assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = $signed(w_mul_inp[ (c_row_x_col-(gp_decimation_factor-1-i%gp_decimation_factor)-((i/gp_decimation_factor)*gp_decimation_factor))*gp_idata_width-1 -: gp_idata_width]) * c_coeff[i];
                else if (i<gp_coeff_length)
                  assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = $signed(w_mul_inp[ (c_row_x_col-(gp_decimation_factor-1-i%gp_decimation_factor)-((i/gp_decimation_factor)*gp_decimation_factor))*gp_idata_width-1 -: gp_idata_width]) * c_coeff[gp_coeff_length-i-1];
                else
                  assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = 'd0;	      
	      end
	  end
	// CLOCK-WISE //
	else
	  begin: g_mul_df_cw
	    for (i=0; i<c_row_x_col; i=i+1)
	      begin: g_mul_coeff
	        if (i<c_coeff_2)
                  assign w_mul[(c_row_x_col-i)*c_mul_out_width-1 -: c_mul_out_width] = $signed(w_mul_inp[(c_row_x_col-i)*gp_idata_width-1 -: gp_idata_width]) * c_coeff[i];
                else if (i<gp_coeff_length)
                  assign w_mul[(c_row_x_col-i)*c_mul_out_width-1 -: c_mul_out_width] = $signed(w_mul_inp[(c_row_x_col-i)*gp_idata_width-1 -: gp_idata_width]) * c_coeff[gp_coeff_length-i-1];
                else
                  assign w_mul[(c_row_x_col-i)*c_mul_out_width-1 -: c_mul_out_width] = 'd0;
	      end	  
	  end
      end
  endgenerate
  
  /*************************/
  /* ADDER TREE PER COLUMN */
  /*************************/
  generate
    for (j=0; j<(c_row_x_col-c_col); j=j+1)
      begin: g_add_tree
        if (j%(gp_decimation_factor-1)==0)
          assign w_add_tree[(j+1)*c_add_out_width-1:j*c_add_out_width] = $signed(w_mul[(j+1+j/(gp_decimation_factor-1))*c_mul_out_width-1:(j+j/(gp_decimation_factor-1))*c_mul_out_width]) + $signed(w_mul[(j+2+j/(gp_decimation_factor-1))*c_mul_out_width-1:(j+1+j/(gp_decimation_factor-1))*c_mul_out_width]);
        else
          assign w_add_tree[(j+1)*c_add_out_width-1:j*c_add_out_width] = $signed(w_add_tree[j*c_add_out_width-1:(j-1)*c_add_out_width])                                                  + $signed(w_mul[(j+2+j/(gp_decimation_factor-1))*c_mul_out_width-1:(j+1+j/(gp_decimation_factor-1))*c_mul_out_width]);
      end
  endgenerate
  
  /************************************************/
  /* MULTIPLIER INPUT FOR TF & DF FILTER TOPOLOGY */
  /************************************************/
  generate
    if (gp_tf_df)
      begin: g_mul_inp_tf
        for (k=0; k<c_col; k=k+1)
          begin: g_mul_inp_tf_loop
            assign w_mul_inp_tf[(1+k)*gp_decimation_factor*gp_idata_width-1 -: gp_decimation_factor*gp_idata_width] = i_data;
          end//FOR_k	  
      end
    else
      begin: g_mul_inp_df
        for (k=c_row_x_col-1; k>=0; k=k-1)
	  begin: g_mul_inp_df_loop
	    if (k/gp_decimation_factor==c_col-1)
	      begin: g_mul_inp_df_inp_col
	        assign w_mul_inp_df[(k+1)*gp_idata_width-1 -: gp_idata_width] = i_data[((k%gp_decimation_factor)+1)*gp_idata_width-1 -: gp_idata_width];
	      end
	    else
	      begin: g_mul_inp_df_remain_cols
	        dff #(
                  .gp_data_width (gp_idata_width)
                ) CCW_DF_DFF (
                  .i_rst_an (i_rst_an),
		  .i_ena    (i_ena),
		  .i_clk    (i_clk),
                  .i_data   (w_mul_inp_df[(k+gp_decimation_factor+1)*gp_idata_width-1 -: gp_idata_width]),
                  .o_data   (w_mul_inp_df[(k+1)*gp_idata_width-1 -: gp_idata_width])
                );
	      end
	  end
      end
  endgenerate

  generate
    if (gp_tf_df)
      begin: g_sel_inp_tf
        assign w_mul_inp = w_mul_inp_tf;
      end
    else
      begin: g_sel_inp_df
        assign w_mul_inp = w_mul_inp_df;
      end
  endgenerate
  
  /****************************************/
  /* PIPE-LINE ACCUMULATOR TF/DF TOPOLOGY */
  /****************************************/
  generate
    if (gp_tf_df)
      begin: g_dly_line_tf
        for (n=c_col; n>0; n=n-1)
          begin: g_dly_line_tf_loop
            if (n==c_col)
              begin: g_sum_tf_col_n               
                assign w_sum[n*c_sum_out_width-1-:c_sum_out_width] = $signed(w_add_tree[(gp_decimation_factor-1)*(n)*c_add_out_width-1-:c_add_out_width]);
              end//IF_UM_TF_COL_0
            else
              begin: g_sum_tf_col_n_0                
                dff #(
                  .gp_data_width (c_sum_out_width)
                ) SUM_TF_DFF (
                  .i_rst_an (i_rst_an),
		  .i_ena    (i_ena),
		  .i_clk    (i_clk),
                  .i_data   (w_sum[(n+1)*c_sum_out_width-1 -: c_sum_out_width]),
                  .o_data   (d_sum[(n)*c_sum_out_width-1 -: c_sum_out_width])
                );
		assign w_sum[n*c_sum_out_width-1-:c_sum_out_width] = $signed(w_add_tree[(gp_decimation_factor-1)*(n)*c_add_out_width-1-:c_add_out_width]) + $signed(d_sum[n*c_sum_out_width-1 -: c_sum_out_width]);
              end//ELSE_SUM_TF_COL_1_N
          end//FOR_sum_TF_COLs
      end//IF_SUM_TF
    else
      begin: g_dly_line_df
        for (n=0; n<c_col; n=n+1)
          begin: g_dly_line_df_loop
            if (n == 0)
              assign w_sum[(n+1)*c_sum_out_width-1-:c_sum_out_width] = $signed(w_add_tree[(gp_decimation_factor-1)*(n+1)*c_add_out_width-1-:c_add_out_width]);
	    else
	      assign w_sum[(n+1)*c_sum_out_width-1-:c_sum_out_width] = $signed(w_add_tree[(gp_decimation_factor-1)*(n+1)*c_add_out_width-1-:c_add_out_width]) + $signed(w_sum[n*c_sum_out_width-1-:c_sum_out_width]);
          end
      end
  endgenerate
  
  /*********************/
  /* PPD FILTER OUTPUT */
  /*********************/  
  generate
    if (gp_tf_df)
      begin: g_oup_assignment_tf
        assign o_data = w_sum[c_sum_out_width-1:0];// CCW+TF
      end
    else
      begin: g_oup_assignment_df
        assign o_data = w_sum[c_sum_out_width*c_col-1 -: c_sum_out_width];// CCW+DF
      end
  endgenerate
  
endmodule
