// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
//
// -------------------------------------------------------------------
module filt_cici #(
  parameter gp_interpolation_factor = 4,
  parameter gp_order                = 3,
  parameter gp_diff_delay           = 1,
  parameter gp_phase                = 0,
  parameter gp_inp_width            = 8,
  parameter gp_oup_width            = gp_inp_width + gp_order*$clog2(gp_interpolation_factor*gp_diff_delay)
) (
  input  wire                           i_rst_an,
  input  wire                           i_ena,
  input  wire                           i_clk,
  input  wire                           i_fclk,
  input  wire signed [gp_inp_width-1:0] i_data,
  output wire signed [gp_oup_width-1:0] o_data
);
// -------------------------------------------------------------------
  // CONSTANT DECLARATION
  localparam c_fill_width = gp_oup_width - gp_inp_width;
  // REGISTER DECLARATION
  //wire w_sclk;
  wire signed [gp_oup_width-1         :0] r_int_inp;
  wire signed [gp_order*gp_oup_width-1:0] r_int_dly;
  wire signed [gp_order*gp_oup_width-1:0] r_comb_dly;
  // WIRE DECLARATION
  wire signed [gp_oup_width-1         :0] w_data;
  wire signed [gp_oup_width-1         :0] w_upsample_inp;
  wire signed [gp_order*gp_oup_width-1:0] w_int_add;
  wire signed [gp_order*gp_oup_width-1:0] w_comb_diff;
// -------------------------------------------------------------------   
  genvar i;
// -------------------------------------------------------------------  
  /*********************/
  /* INPUT MSB PADDING */
  /*********************/
  assign w_data = $signed({{c_fill_width{i_data[gp_inp_width-1]}},i_data});

  /****************/
  /* COMB SECTION */
  /****************/	            
  generate
    for (i=0; i<gp_order; i=i+1)
      begin: g_comb
        if (i==0)
          begin: g_comb_0
            shift_register #(
              .gp_data_width (gp_oup_width),
              .gp_nr_stages  (gp_diff_delay)
            ) CIC_COMB_SR (
              .i_rst_an (i_rst_an),
              .i_ena	(i_ena),
              .i_clk	(i_clk),  
              .i_data	(w_data), 
              .o_data	(r_comb_dly[(i+1)*gp_oup_width-1 -: gp_oup_width]),
              .o_shift_done ()  
            );
            assign w_comb_diff[(i+1)*gp_oup_width-1 -: gp_oup_width] = $signed(w_data) - $signed(r_comb_dly[(i+1)*gp_oup_width-1 -: gp_oup_width]);
          end
        else
          begin: g_comb_1_n
            shift_register #(
              .gp_data_width (gp_oup_width),
              .gp_nr_stages  (gp_diff_delay)
            ) CIC_COMB_SR (
              .i_rst_an (i_rst_an),
              .i_ena	(i_ena),
              .i_clk	(i_clk),  
              .i_data	(w_comb_diff[i*gp_oup_width-1 -: gp_oup_width]), 
              .o_data	(r_comb_dly[(i+1)*gp_oup_width-1 -: gp_oup_width]),
              .o_shift_done ()  
            );  	    
            assign w_comb_diff[(i+1)*gp_oup_width-1 -: gp_oup_width] = $signed(w_comb_diff[i*gp_oup_width-1 -: gp_oup_width]) - $signed(r_comb_dly[(i+1)*gp_oup_width-1 -: gp_oup_width]); 
          end
        
      end
  endgenerate
  
  /**********************/
  /* UPSAMPLE SECTION */
  /**********************/  
  assign w_upsample_inp = $signed(w_comb_diff[gp_order*gp_oup_width-1 -: gp_oup_width]); // for debugging
  upsample #(
    .gp_data_width (gp_oup_width),
    .gp_nr_stages  (gp_interpolation_factor),
    .gp_phase (gp_phase)
  ) cici_upsample (
    .i_rst_an (i_rst_an),
    .i_ena    (i_ena),
    .i_clk    (i_fclk),  
    .i_data   (w_upsample_inp), 
    .o_data   (r_int_inp),
    .o_shift_done ()  
  );  
  
  /**********************/
  /* INTEGRATOR SECTION */
  /**********************/
  generate
    for (i=0; i<gp_order; i=i+1)
      begin: g_integrator
        if (i==0)
          begin: g_int_0
            assign w_int_add[(i+1)*gp_oup_width-1 -: gp_oup_width] = $signed(r_int_inp) + $signed(r_int_dly[(i+1)*gp_oup_width-1 -: gp_oup_width]);
            dff #(
	      .gp_data_width (gp_oup_width)
	    ) CIC_INT_DLY (
	      .i_rst_an (i_rst_an),
              .i_ena	(i_ena),
              .i_clk	(i_fclk),
	      .i_data	(w_int_add[(i+1)*gp_oup_width-1 -: gp_oup_width]),
	      .o_data	(r_int_dly[(i+1)*gp_oup_width-1 -: gp_oup_width])
	    );  	    
          end
        else
          begin: g_int_1_n
            assign w_int_add[(i+1)*gp_oup_width-1 -: gp_oup_width] = $signed(w_int_add[i*gp_oup_width-1 -: gp_oup_width]) + $signed(r_int_dly[(i+1)*gp_oup_width-1 -: gp_oup_width]);
            dff #(
	      .gp_data_width (gp_oup_width)
	    ) CIC_INT_DLY (
	      .i_rst_an (i_rst_an),
              .i_ena	(i_ena),
              .i_clk	(i_fclk),
	      .i_data	(w_int_add[(i+1)*gp_oup_width-1 -: gp_oup_width]),
	      .o_data	(r_int_dly[(i+1)*gp_oup_width-1 -: gp_oup_width])
	    );  	  
          end
      end
  endgenerate
 
 assign o_data = w_int_add[gp_order*gp_oup_width-1 -: gp_oup_width];
   
endmodule

