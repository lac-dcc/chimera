// This program was cloned from: https://github.com/ahmedshahein/DSP-RTL-Lib
// License: BSD 2-Clause "Simplified" License

// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
//
// -------------------------------------------------------------------
module filt_cicd #(
  parameter gp_decimation_factor = 4,
  parameter gp_order             = 3,
  parameter gp_diff_delay        = 1,
  parameter gp_phase             = 0,
  parameter gp_inp_width         = 8,
  parameter gp_oup_width         = gp_inp_width + gp_order*$clog2(gp_decimation_factor*gp_diff_delay)
) (
  input  wire                           i_rst_an,
  input  wire                           i_ena,
  input  wire                           i_clk,
  input  wire signed [gp_inp_width-1:0] i_data,
  output wire signed [gp_oup_width-1:0] o_data
);
// -------------------------------------------------------------------
  // CONSTANT DECLARATION
  localparam c_fill_width = gp_oup_width - gp_inp_width;
  // REGISTER DECLARATION
  wire w_sclk;
  wire signed [gp_oup_width-1         :0] r_comb_inp;  
  reg         [gp_decimation_factor-1 :0] r_count;
  wire signed [gp_order*gp_oup_width-1:0] r_int_dly;
  wire signed [gp_order*gp_oup_width-1:0] r_comb_dly;
  // WIRE DECLARATION
  wire signed [gp_oup_width-1         :0] w_data;
  wire signed [gp_order*gp_oup_width-1:0] w_int_add;
  wire signed [gp_order*gp_oup_width-1:0] w_comb_diff;
// -------------------------------------------------------------------   
  genvar i;
// -------------------------------------------------------------------  
  /****************/
  /* RING COUNTER */
  /****************/
  always @(posedge i_clk or negedge i_rst_an)
    begin: p_ring_counter
      if (!i_rst_an)
        begin
	  r_count <= 'd0;
	end
      else if (i_ena)
       begin
         if (r_count=='d0)
           r_count[0] <= 1'b1;
	 else
	   begin
	     r_count[0] <= r_count[gp_decimation_factor-1];
	     r_count[gp_decimation_factor-1:1] <= r_count[gp_decimation_factor-2:0];
	   end
       end
    end
  
  /*********************/
  /* INPUT MSB PADDING */
  /*********************/
  assign w_data = {{c_fill_width{i_data[gp_inp_width-1]}},i_data};
  
  /**********************/
  /* INTEGRATOR SECTION */
  /**********************/
  generate
    for (i=0; i<gp_order; i=i+1)
      begin: g_integrator
        if (i==0)
          begin: g_int_0
            assign w_int_add[(i+1)*gp_oup_width-1 -: gp_oup_width] = $signed(w_data) + $signed(r_int_dly[(i+1)*gp_oup_width-1 -: gp_oup_width]);
            dff #(
	      .gp_data_width (gp_oup_width)
	    ) CIC_INT_DLY (
	      .i_rst_an (i_rst_an),
              .i_ena	(i_ena),
              .i_clk	(i_clk),
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
              .i_clk	(i_clk),
	      .i_data	(w_int_add[(i+1)*gp_oup_width-1 -: gp_oup_width]),
	      .o_data	(r_int_dly[(i+1)*gp_oup_width-1 -: gp_oup_width])
	    );  	  
          end
      end
  endgenerate
  
  /**********************/
  /* DOWNSAMPLE SECTION */
  /**********************/
  assign w_sclk = r_count[gp_phase];
  dff #(
    .gp_data_width (gp_oup_width)
  ) cicd_downsample (
    .i_rst_an (i_rst_an),
    .i_ena    (w_sclk),
    .i_clk    (i_clk),
    .i_data   (w_int_add[gp_order*gp_oup_width-1 -: gp_oup_width]),
    .o_data   (r_comb_inp)
  );
  
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
              .i_ena	(r_count[gp_phase]),  
              .i_clk	(i_clk),  
              .i_data	(r_comb_inp), 
              .o_data	(r_comb_dly[(i+1)*gp_oup_width-1 -: gp_oup_width]),
              .o_shift_done ()  
            );
            assign w_comb_diff[(i+1)*gp_oup_width-1 -: gp_oup_width] = $signed(r_comb_inp) - $signed(r_comb_dly[(i+1)*gp_oup_width-1 -: gp_oup_width]);
          end
        else
          begin: g_comb_1_n
            shift_register #(
              .gp_data_width (gp_oup_width),
              .gp_nr_stages  (gp_diff_delay)
            ) CIC_COMB_SR (
              .i_rst_an (i_rst_an),
              .i_ena	(r_count[gp_phase]),  
              .i_clk	(i_clk),  
              .i_data	(w_comb_diff[i*gp_oup_width-1 -: gp_oup_width]), 
              .o_data	(r_comb_dly[(i+1)*gp_oup_width-1 -: gp_oup_width]),
              .o_shift_done ()  
            );  	    
            assign w_comb_diff[(i+1)*gp_oup_width-1 -: gp_oup_width] = $signed(w_comb_diff[i*gp_oup_width-1 -: gp_oup_width]) - $signed(r_comb_dly[(i+1)*gp_oup_width-1 -: gp_oup_width]); 
          end
        
      end
  endgenerate
 
 assign o_data = w_comb_diff[gp_order*gp_oup_width-1 -: gp_oup_width];
   
endmodule

