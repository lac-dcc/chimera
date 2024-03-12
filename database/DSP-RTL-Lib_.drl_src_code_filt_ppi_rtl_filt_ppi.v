// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
`define DIV(N, D) (N%D==0) ? (N/D) : (N/D+1)
// -------------------------------------------------------------------
module filt_ppi #(
  parameter gp_idata_width          = 8,                           // Set input data width
  parameter gp_interpolation_factor = 30,                          // Set number of output channels
  parameter gp_coeff_length         = 53,                          // Set filter coefficient length
  parameter gp_coeff_width          = 16,                          // Set filter coefficient filter bit-width
  parameter gp_tf_df                = 1,                           // Select filter topology 1-> TF | 0-> DF   
  parameter gp_comm_ccw             = 1,                           // Select commutator 1-> Counter Clock Wise | 0 -> Clock Wise
  parameter gp_mul_ccw              = 1,                           // Select multiplier 1-> Counter Clock Wise | 0 -> Clock Wise
  parameter gp_comm_phase           = 0,                           // Select downsample phase 0:gp_interpolation_factor-1
  parameter gp_odata_width          = gp_idata_width+gp_coeff_width+(`DIV(gp_coeff_length,gp_interpolation_factor))
				                                   // Set output bit-width
) (
  input  wire                             i_rst_an,                // Asynchronous active low reset
  input  wire                             i_ena,                   // Synchronous active high enable
  input  wire                             i_clk,                   // Rising-edge clock
  input  wire                             i_fclk,                  // Rising-edge clock
  input  wire signed [gp_idata_width-1:0] i_data,                  // Input data with gp_idata_width bits MSB:LSB, signed
  output wire signed [gp_odata_width-1:0] o_data,                  // Output data with gp_interpolation_factor x gp_idata_width width MSB:LSB, signed
  output wire                             o_sclk                   // Slow clock pulsed output
);
// -------------------------------------------------------------------
wire [gp_interpolation_factor*gp_odata_width-1:0] mul_add_2_comm;
wire [gp_odata_width-1                        :0] w_data;
// -------------------------------------------------------------------

  mul_add #(
    .gp_idata_width          (gp_idata_width),
    .gp_interpolation_factor (gp_interpolation_factor),
    .gp_coeff_length         (gp_coeff_length),
    .gp_coeff_width          (gp_coeff_width),
    .gp_tf_df                (gp_tf_df),
    .gp_ccw                  (gp_mul_ccw),
    .gp_odata_width          (gp_odata_width*gp_interpolation_factor)
  ) ppi_mul_add (
    .i_rst_an (i_rst_an),
    .i_ena    (i_ena),
    .i_clk    (i_clk),
    .i_data   (i_data),
    .o_data   (mul_add_2_comm)
  );
  
  commutator #(
    .gp_ccw                  (1'b1),
    .gp_idata_width          (gp_odata_width),
    .gp_interpolation_factor (gp_interpolation_factor)
  ) ppi_commutator (
    .i_rst_an (i_rst_an),  
    .i_ena    (i_ena),     
    .i_clk    (i_fclk),  
    .i_data   (mul_add_2_comm),    
    .o_data   (w_data),    
    .o_clk    (o_sclk)
  );

  generate
    if (gp_comm_phase==0)
      begin: SR_PHASE_EQ_0
	assign o_data = w_data;
      end
    else	  
      begin: g_phase_alignment
        shift_register #(
	  .gp_data_width (gp_odata_width),
	  .gp_nr_stages  (gp_comm_phase)
	) SR_PHASE_LT_0 (
	  .i_rst_an     (i_rst_an),
	  .i_ena        (i_ena),  
	  .i_clk        (i_fclk),  
	  .i_data       (w_data), 
	  .o_data       (o_data),
	  .o_shift_done ()  
	);
      end
  endgenerate
	       
endmodule
