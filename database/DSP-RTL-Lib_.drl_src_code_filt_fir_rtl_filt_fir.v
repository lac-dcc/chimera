// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
`define DIV(N, D) (N%D==0) ? (N/D) : (N/D+1)
// -------------------------------------------------------------------
module filt_fir #(
  parameter gp_inp_width         = 8,                              // Set input data width
  parameter gp_coeff_length      = 17,
  parameter gp_coeff_width       = 8,
  parameter gp_tf_df             = 1,                              // 1-> TF, 0-> DF   
  parameter gp_symm              = 1,
  parameter gp_oup_width         = gp_inp_width+gp_coeff_width+$clog2(gp_coeff_length)
) (
  input  wire                           i_rst_an,
  input  wire                           i_ena,
  input  wire                           i_clk,
  input  wire signed [gp_inp_width-1:0] i_data,
  output wire signed [gp_oup_width-1:0] o_data
);
// -------------------------------------------------------------------
  localparam c_mul_oup_width = gp_inp_width   + gp_coeff_width;
  localparam c_add_oup_width = c_mul_oup_width + $clog2(gp_coeff_length);
  localparam c_filler_length = c_add_oup_width - c_mul_oup_width;
  localparam c_coeff_2       = (gp_symm) ? `DIV(gp_coeff_length, 2) : gp_coeff_length;
  
  wire signed [gp_coeff_length*c_mul_oup_width-1:0]     w_mul;
  wire signed [gp_coeff_length*c_add_oup_width-1:0]     w_add; 
  wire signed [gp_coeff_width-1:0]                      c_coeff [0:c_coeff_2-1];
// -------------------------------------------------------------------  
  genvar i;
// -------------------------------------------------------------------  
  `include "filt_coeff.v"
// -------------------------------------------------------------------
  generate
    /******************************/
    /* TRANSPOSED-FORM FIR FILTER */  
    /******************************/    
    if (gp_tf_df)
      begin:g_fir_tf
        wire signed [(gp_coeff_length-1)*c_add_oup_width-1:0] r_dly_tf;
        for (i=0; i<gp_coeff_length; i=i+1)
	  begin: g_fir
	    if (gp_symm)
	      begin: g_fir_symm
	        if (i<c_coeff_2)
	          begin: g_fir_0_n_2
                    assign w_mul[(i+1)*c_mul_oup_width-1 -: c_mul_oup_width] = $signed(i_data) * c_coeff[i];
	          end
                else
	          begin: g_fir_n_2_n
                    assign w_mul[(i+1)*c_mul_oup_width-1 -: c_mul_oup_width] = $signed(i_data) * c_coeff[gp_coeff_length-1-i];
                  end
	      end
	    else
	      begin: g_fir_unsymm
	        assign w_mul[(i+1)*c_mul_oup_width-1 -: c_mul_oup_width] = $signed(i_data) * c_coeff[i];
	      end
	      
	    if (i==gp_coeff_length-1)
	      begin: g_fir_add_last
                assign w_add[(i+1)*c_add_oup_width-1 -: c_add_oup_width] = $signed(w_mul[(i+1)*c_mul_oup_width-1 -: c_mul_oup_width]);  
	      end
            else
	      begin: g_fir_add
                assign w_add[(i+1)*c_add_oup_width-1 -: c_add_oup_width] = $signed(w_mul[(i+1)*c_mul_oup_width-1 -: c_mul_oup_width]) + $signed(r_dly_tf[(i+1)*c_add_oup_width-1 -: c_add_oup_width]);
              end
	      
	    if (i>0)
              begin: g_fir_dly_tf
                dff #(
                  .gp_data_width (c_add_oup_width)
                ) FIR_TF_DFF (
                  .i_rst_an (i_rst_an),
	          .i_ena    (i_ena),
	          .i_clk    (i_clk),
                  .i_data   (w_add[(i+1)*c_add_oup_width-1 -: c_add_oup_width]),
                  .o_data   (r_dly_tf[i*c_add_oup_width-1 -: c_add_oup_width])
                );
              end
	  end//FOR	
      end//IF_TF
    /**************************/
    /* DIRECT-FORM FIR FILTER */  
    /**************************/
    else
      begin: g_fir_df
        wire signed [gp_coeff_length*gp_inp_width-1:0]       r_dly_df;
	if (gp_symm)
	  begin: g_fir_symm
	    for (i=0; i<gp_coeff_length; i=i+1)
              begin: g_mul
		if (i<c_coeff_2)
	          begin: g_fir_0_n_2
                    assign w_mul[(i+1)*c_mul_oup_width-1 -: c_mul_oup_width] = $signed(r_dly_df[(i+1)*gp_inp_width-1 -: gp_inp_width]) * c_coeff[i];
	          end
                else
	          begin: g_fir_n_2_n
                    assign w_mul[(i+1)*c_mul_oup_width-1 -: c_mul_oup_width] = $signed(r_dly_df[(i+1)*gp_inp_width-1 -: gp_inp_width]) * c_coeff[gp_coeff_length-1-i];
                  end
              end//FOR
	  end
	else
	  begin: g_fir_unsymm
	    for (i=0; i<gp_coeff_length; i=i+1)
	      begin: g_mul
	        assign w_mul[(i+1)*c_mul_oup_width-1 -: c_mul_oup_width] = $signed(r_dly_df[(i+1)*gp_inp_width-1 -: gp_inp_width]) * c_coeff[i];
              end//FOR
	  end//ELSE_UNSYMM
	
	for (i=0; i<gp_coeff_length; i=i+1)
	  begin: g_add    
	    if (i==0)
	      begin: g_fir_add_first
	        assign w_add[(i+1)*c_add_oup_width-1 -: c_add_oup_width] = $signed(w_mul[(i+1)*c_mul_oup_width-1 -: c_mul_oup_width]);
	      end
	    else
	      begin: g_fir_add
	        assign w_add[(i+1)*c_add_oup_width-1 -: c_add_oup_width] = $signed(w_mul[(i+1)*c_mul_oup_width-1 -: c_mul_oup_width]) + $signed(w_add[i*c_add_oup_width-1 -: c_add_oup_width]);
	      end
	  end//FOR
	
	for (i=0; i<gp_coeff_length; i=i+1)
	  begin: g_dly 
	    if (i==0)
	      begin: g_fir_dly_first
	        assign  r_dly_df[(i+1)*gp_inp_width-1 -: gp_inp_width] = i_data;
	      end
	    else
              begin: g_fir_dly
                dff #(
                  .gp_data_width (gp_inp_width)
                ) FIR_TF_DFF (
                  .i_rst_an (i_rst_an),
	          .i_ena    (i_ena),
	          .i_clk    (i_clk),
                  .i_data   (r_dly_df[i*gp_inp_width-1 -: gp_inp_width]),
                  .o_data   (r_dly_df[(i+1)*gp_inp_width-1 -: gp_inp_width])
                );
              end	    
	  end//FOR    
      end
  endgenerate

generate
  if (gp_tf_df)
    assign o_data = w_add[c_add_oup_width-1:0];
  else
    assign o_data = w_add[gp_coeff_length*c_add_oup_width-1 -: gp_oup_width];
endgenerate
  
endmodule
