// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
`define DIV(N, D) (N%D==0) ? (N/D) : (N/D+1)
// -------------------------------------------------------------------
module mul_add #(
  parameter gp_idata_width          = 8,                 // Set input data width
  parameter gp_interpolation_factor = 32,                // Set number of output channels
  parameter gp_coeff_length         = 53,                // Set filter coefficient length
  parameter gp_coeff_width          = 16,                // Set filter coefficient filter bit-width
  parameter gp_tf_df                = 1,                 // Select filter topology 1-> TF | 0-> DF  
  parameter gp_ccw                  = 0,                 // Select multiplier 1-> Counter Clock Wise | 0 -> Clock Wise
  parameter gp_odata_width          = ( gp_idata_width+gp_coeff_width+(`DIV(gp_coeff_length,gp_interpolation_factor)) )*gp_interpolation_factor
                                                         // Set output bit-width
) (
  input  wire                             i_rst_an,      // Asynchronous active low reset
  input  wire                             i_ena,	 // Synchronous active high enable
  input  wire                             i_clk,	 // Rising-edge clock
  input  wire signed [gp_idata_width-1:0] i_data,	 // Input data with gp_idata_width bits MSB:LSB, signed
  output wire signed [gp_odata_width-1:0] o_data	 // Output data with gp_interpolation_factor x gp_idata_width width MSB:LSB, signed
);
// -------------------------------------------------------------------
  // CONSTANT DECLARATION
  localparam c_coeff_2          = `DIV(gp_coeff_length, 2);
  localparam c_col              = `DIV(gp_coeff_length, gp_interpolation_factor);
  localparam c_row_x_col        = gp_interpolation_factor * c_col;
  localparam c_mul_out_width    = gp_idata_width       + gp_coeff_width;
  localparam c_sum_out_width    = c_mul_out_width      + c_col;
  localparam c_reg_out_width    = (gp_tf_df) ? c_sum_out_width : gp_idata_width;
  // WIRE DECLARATION
  wire signed [gp_coeff_width-1                                       :0] c_coeff [0:c_coeff_2-1]; 
  wire signed [c_mul_out_width*c_row_x_col-1                          :0] w_mul;
  wire signed [c_sum_out_width*c_row_x_col-1                          :0] w_sum;
  wire signed [c_reg_out_width*(c_row_x_col-gp_interpolation_factor)-1:0] w_reg;
  // GENERATE VARIABLES DECLARATION
  genvar i;
// -------------------------------------------------------------------
  /***********************/
  /* FILTER COEFFICIENTS */
  /***********************/
  `include "filt_coeff.v"

  /****************************************/
  /* TRANSPOSED-FORM (TF) FILTER TOPOLOGY */
  /****************************************/
  generate
    if (gp_tf_df)
      begin: g_tf_ppi
        for (i=0; i<c_row_x_col; i=i+1)
	  begin: g_tf_mul
	    if (i<c_coeff_2)
              assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = $signed(i_data) * $signed(c_coeff[i]);
            else if (i<gp_coeff_length)
              assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = $signed(i_data) * $signed(c_coeff[gp_coeff_length-i-1]);
            else
              assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = 'd0;
	  end
	  
	for (i=gp_interpolation_factor; i<c_row_x_col; i=i+1)
	  begin: g_tf_reg
	    if (gp_ccw)
	      begin: g_ccw
                dff #(
                  .gp_data_width (c_reg_out_width)
                ) TF_DFF (
                  .i_rst_an (i_rst_an),
	          .i_ena    (i_ena),
                  .i_clk    (i_clk),
                  .i_data   (w_sum[(i+1)*c_sum_out_width-1 -: c_sum_out_width]),
                  .o_data   (w_reg[(i-gp_interpolation_factor+1)*c_reg_out_width-1 -: c_reg_out_width])
                );	
	      end
	    else
	      begin: g_cw
                dff #(
                  .gp_data_width (c_reg_out_width)
                ) TF_DFF (
                  .i_rst_an (i_rst_an),
	          .i_ena    (i_ena),
                  .i_clk    (i_clk),
                  .i_data   (w_sum[(i-gp_interpolation_factor+1)*c_sum_out_width-1 -: c_sum_out_width]),
                  .o_data   (w_reg[(i-gp_interpolation_factor+1)*c_reg_out_width-1 -: c_reg_out_width])
                );	    
	      end    
	  end
	  
	for (i=0; i<c_row_x_col; i=i+1)
	  begin: g_tf_add
	    if (gp_ccw)
	      begin: g_ccw
	        if (i<(c_row_x_col-gp_interpolation_factor))
		  assign w_sum[(i+1)*c_sum_out_width-1 -: c_sum_out_width] = $signed(w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width]) + $signed(w_reg[(i+1)*c_reg_out_width-1 -: c_reg_out_width]);
		else
		  assign w_sum[(i+1)*c_sum_out_width-1 -: c_sum_out_width] = $signed(w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width]); 
	      end
	    else
	      begin: g_cw
	        if (i<gp_interpolation_factor)
		  assign w_sum[(i+1)*c_sum_out_width-1 -: c_sum_out_width] = $signed(w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width]);
		else
		  assign w_sum[(i+1)*c_sum_out_width-1 -: c_sum_out_width] = $signed(w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width]) + $signed(w_reg[(i-gp_interpolation_factor+1)*c_reg_out_width-1 -: c_reg_out_width]);
	      end
	  end
	  
	if (gp_ccw)
	  begin: g_oup_ccw
	    assign o_data = w_sum[gp_odata_width-1:0];
	  end
	else
	  begin: g_oup_cw
	    assign o_data = w_sum[c_sum_out_width*c_row_x_col-1:c_sum_out_width*c_row_x_col-gp_odata_width];
	  end
      end
  endgenerate  

  /************************************/
  /* DIRECT-FORM (DF) FILTER TOPOLOGY */
  /************************************/
  generate
    if (!gp_tf_df)
      begin: g_df_ppi
        for (i=0; i<c_row_x_col; i=i+1)
	  begin: g_df_mul
	    if (gp_ccw)
	      begin: g_ccw
	        if (i<c_coeff_2)
                  begin
    	            if (i<gp_interpolation_factor)
    		      assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = $signed(c_coeff[i]) * $signed(i_data);
    		    else
    		      assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = $signed(c_coeff[i]) * $signed(w_reg[(i-gp_interpolation_factor+1)*c_reg_out_width-1 -: c_reg_out_width]);
    	          end
                else if (i<gp_coeff_length)
                  assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = $signed(c_coeff[gp_coeff_length-i-1]) * $signed(w_reg[(i-gp_interpolation_factor+1)*c_reg_out_width-1 -: c_reg_out_width]);
                else
                  assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = 'd0;
	      end
	    else
	      begin: g_cw
	        if (i<c_coeff_2)
                  assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = $signed(c_coeff[i]) * $signed(w_reg[(i+1)*c_reg_out_width-1 -: c_reg_out_width]);
                else if (i<gp_coeff_length)
                  begin
		    if (i<c_row_x_col-gp_interpolation_factor)
		      assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = $signed(c_coeff[gp_coeff_length-i-1]) * $signed(w_reg[(i+1)*c_reg_out_width-1 -: c_reg_out_width]);
	            else
		      assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = $signed(c_coeff[gp_coeff_length-i-1]) * $signed(i_data);
		  end
                else
                  assign w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width] = 'd0;
	      end
	  end
	  
	for (i=0; i<c_row_x_col-gp_interpolation_factor; i=i+1)
	  begin: g_df_reg
	    if (gp_ccw)
	      begin: g_ccw
	        if (i<gp_interpolation_factor)
		  begin
                    dff #(
                      .gp_data_width (c_reg_out_width)
                    ) TF_DFF (
                      .i_rst_an (i_rst_an),
	              .i_ena    (i_ena),
                      .i_clk    (i_clk),
                      .i_data   (i_data),
                      .o_data   (w_reg[(i+1)*c_reg_out_width-1 -: c_reg_out_width])
                    );	
		  end
		else
		  begin
                    dff #(
                      .gp_data_width (c_reg_out_width)
                    ) TF_DFF (
                      .i_rst_an (i_rst_an),
	              .i_ena    (i_ena),
                      .i_clk    (i_clk),
                      .i_data   (w_reg[(i-gp_interpolation_factor+1)*c_reg_out_width-1 -: c_reg_out_width]),
                      .o_data   (w_reg[(i+1)*c_reg_out_width-1 -: c_reg_out_width])
                    );
		  end
	      end
	    else
	      begin: g_cw
	        if (i<c_row_x_col-2*gp_interpolation_factor)
		  begin
                    dff #(
                      .gp_data_width (c_reg_out_width)
                    ) TF_DFF (
                      .i_rst_an (i_rst_an),
	              .i_ena    (i_ena),
                      .i_clk    (i_clk),
                      .i_data   (w_reg[(i+gp_interpolation_factor+1)*c_reg_out_width-1 -: c_reg_out_width]),
                      .o_data   (w_reg[(i+1)*c_reg_out_width-1 -: c_reg_out_width])
                    );	
		  end
		else
		  begin
                    dff #(
                      .gp_data_width (c_reg_out_width)
                    ) TF_DFF (
                      .i_rst_an (i_rst_an),
	              .i_ena    (i_ena),
                      .i_clk    (i_clk),
                      .i_data   (i_data),
                      .o_data   (w_reg[(i+1)*c_reg_out_width-1 -: c_reg_out_width])
                    );
		  end	    
	      end    
	  end
	  
	for (i=0; i<c_row_x_col; i=i+1)
	  begin: g_df_add
	    if (gp_ccw)
	      begin: g_ccw
	        if (i<gp_interpolation_factor)
		  assign w_sum[(i+1)*c_sum_out_width-1 -: c_sum_out_width] = $signed(w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width]);
		else
		  assign w_sum[(i+1)*c_sum_out_width-1 -: c_sum_out_width] = $signed(w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width]) + $signed(w_sum[(i-gp_interpolation_factor+1)*c_sum_out_width-1 -: c_sum_out_width]); 
	      end
	    else
	      begin: g_cw
	        if (i<c_row_x_col-gp_interpolation_factor)
		  assign w_sum[(i+1)*c_sum_out_width-1 -: c_sum_out_width] = $signed(w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width]) + $signed(w_sum[(i+gp_interpolation_factor+1)*c_sum_out_width-1 -: c_sum_out_width]);
		else
		  assign w_sum[(i+1)*c_sum_out_width-1 -: c_sum_out_width] = $signed(w_mul[(i+1)*c_mul_out_width-1 -: c_mul_out_width]);
	      end
	  end
	  
	if (gp_ccw)
	  begin: g_oup_ccw
	    assign o_data = w_sum[c_sum_out_width*c_row_x_col-1:c_sum_out_width*c_row_x_col-gp_odata_width];
	  end
	else
	  begin: g_oup_cw
	    assign o_data = w_sum[gp_odata_width-1:0];
	  end
      end
  endgenerate  
  
endmodule

/*
TF CCW
C11 C07 C03
C10 C06 C02
C09 C05 C01
C08 C04 C00

TF CW
C00 C04 C08
C01 C05 C09
C02 C06 C10
C03 C07 C11

DF CCW
C03 C07 C11
C02 C06 C10
C01 C05 C09
C00 C04 C08

DF CW
C08 C04 C00
C09 C05 C01
C10 C06 C02
C11 C07 C03
*/
