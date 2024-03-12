// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
//
// -------------------------------------------------------------------
module filt_mac #(
  parameter gp_inp_width        = 8,                              // Set input data width
  parameter gp_coeff_length      = 17,
  parameter gp_coeff_width       = 12,
  parameter gp_symm              = 1,
  parameter gp_oup_width         = gp_inp_width+gp_coeff_width+gp_coeff_length
) (
  input  wire                           i_rst_an,
  input  wire                           i_ena,
  input  wire                           i_clk,
  input  wire signed [gp_inp_width-1:0] i_data,
  output wire signed [gp_oup_width-1:0] o_data,
  output wire                           o_done
);
// -------------------------------------------------------------------
  // CONSTANT DECLARATION
  localparam c_coeff_size    = (gp_symm) ? ((gp_coeff_length/2)+(gp_coeff_length%2)) : gp_coeff_length;
  localparam c_even_odd_symm = (gp_symm && ((gp_coeff_length%2)==0) ) ? 1'b1 : 1'b0;
  localparam c_count_width   = $clog2(c_coeff_size);
  localparam c_mul_oup_width = gp_inp_width   + gp_coeff_width;
  localparam c_add_oup_width = c_mul_oup_width + gp_coeff_length;
  // REGISTER DECLARATION
  reg  signed [gp_inp_width-1  :0] r_delay_line [0:gp_coeff_length-1];
  reg         [c_count_width-1  :0] r_count_coeff;
  reg  signed [c_add_oup_width-1:0] r_add_oup;
  reg  signed [gp_oup_width-1   :0] r_data;
  // WIRE DECLARATION
  wire signed [gp_coeff_width-1 :0] c_coeff     [0:c_coeff_size-1];
  wire signed [gp_inp_width    :0] w_mul_inp_a; // for symmetric filters to avoid overflow of DL addition
  wire signed [gp_coeff_width-1 :0] w_mul_inp_b;
  wire signed [c_mul_oup_width-1:0] w_mul_oup;
  wire signed [c_add_oup_width-1:0] w_add_oup;
  wire                              w_done;
  integer i;
// -------------------------------------------------------------------
  `include "filt_coeff.v"
// -------------------------------------------------------------------
  // DELAY LINE
  always @(posedge i_clk or negedge i_rst_an)
    begin: p_delay_line
      if (!i_rst_an)
        begin
	  for (i=0; i<gp_coeff_length; i=i+1)
	    r_delay_line[i] <= 'sd0;
	end
      else if (i_ena)
        begin
	if(w_done) 
	  begin
	    r_delay_line[0] <= i_data;
	    for (i=1; i<gp_coeff_length; i=i+1)
	      r_delay_line[i] <= r_delay_line[i-1];
	  end
	end
    end
  
  // MUX SELECTOR - COUNTER
  always @(posedge i_clk or negedge i_rst_an)
    begin: p_cnt_mux_sel
      if (!i_rst_an)
        r_count_coeff <= {c_count_width{1'b1}};
      else if (i_ena)
        begin
	  if (r_count_coeff < c_coeff_size-1)
	    r_count_coeff <= r_count_coeff + 1'b1;
	  else
	    r_count_coeff <= 'd0;
	end
    end  
  
  // MULTIPLIER INPUT A
  generate
    if (gp_symm)
      begin: g_symm_inp_a
        assign w_mul_inp_a = ( !c_even_odd_symm && (r_count_coeff==c_coeff_size-1) ) ? // MIDDLE TAP
					                       r_delay_line[r_count_coeff] 
							     : // MIRRORED TAPS
							       ($signed(r_delay_line[r_count_coeff]) +  $signed(r_delay_line[gp_coeff_length-1-r_count_coeff]));
      end
    else
      begin: g_asymm_inp_a
        assign w_mul_inp_a = (r_count_coeff<c_coeff_size) ? $signed(r_delay_line[r_count_coeff]) : 'sd0;
      end
  endgenerate
  
  // MULTIPLIER INP B
  assign w_mul_inp_b = (r_count_coeff<c_coeff_size) ? $signed(c_coeff[r_count_coeff])      : 'sd0;
  
  // SIGNED MULTIPLIER
  assign w_mul_oup   = $signed(w_mul_inp_a) * $signed(w_mul_inp_b);
  
  // SIGNED ACCUMULATOR
  assign w_add_oup   = $signed(w_mul_oup)   + $signed(r_add_oup);

  // ACCUMULATOR REGISTER
  always @(posedge i_clk or negedge i_rst_an)
    begin: p_reg_adder
      if (!i_rst_an)
        r_add_oup <= 'd0;
      else if (i_ena)
        begin
	  if (w_done)
	    r_add_oup <= 'd0;
	  else
            r_add_oup <= w_add_oup;
	end
    end
  
  // OUTPUT REGISTER  
  always @(posedge i_clk or negedge i_rst_an)
    begin: p_reg_oup
      if (!i_rst_an)
        r_data <= 'd0;
      else if (i_ena)
        begin
	  if (w_done)
	    r_data <= w_add_oup;
	end
    end    
  
  // FLAG DONE/LOAD
  assign w_done = (r_count_coeff>=c_coeff_size-1) ? 1'b1 : 1'b0;
  
  // OUTPUT ASSIGNMENTS
  assign o_data = r_data;  
  assign o_done = w_done;
  
endmodule
