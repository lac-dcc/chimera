// This program was cloned from: https://github.com/ahmedshahein/DSP-RTL-Lib
// License: BSD 2-Clause "Simplified" License

// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
`define DIV(N, D) (N%D==0) ? (N/D) : (N/D+1)
// -------------------------------------------------------------------
module filt_ppd #(  
  parameter gp_idata_width       = 6,                              // Set input data width
  parameter gp_decimation_factor = 31,                              // Set number of output channels
  parameter gp_coeff_length      = 53,                             // Set filter coefficient length
  parameter gp_coeff_width       = 16,                              // Set filter coefficient filter bit-width
  parameter gp_tf_df             = 0,                              // Select filter topology 1-> TF | 0-> DF   
  parameter gp_comm_reg_oup      = 1,                              // Select commutator 1-> registered output | 0 -> none-registered
  parameter gp_comm_ccw          = 1,                              // Select commutator 1-> Counter Clock Wise | 0 -> Clock Wise
  parameter gp_mul_ccw           = 0,                              // Select multiplier 1-> Counter Clock Wise | 0 -> Clock Wise
  parameter gp_comm_phase        = 0,                              // Select downsample phase 0:gp_decimation_factor-1
  parameter gp_odata_width       = gp_idata_width+gp_coeff_width+$clog2(gp_decimation_factor)+$clog2(`DIV(gp_coeff_length,gp_decimation_factor))
				                                   // Set output bit-width
) (
  input  wire                             i_rst_an,                // Asynchronous active low reset
  input  wire                             i_ena,                   // Synchronous active high enable
  input  wire                             i_clk,                   // Rising-edge clock
  input  wire signed [gp_idata_width-1:0] i_data,                  // Input data with gp_idata_width bits MSB:LSB, signed
  output wire signed [gp_odata_width-1:0] o_data,                  // Output data with gp_decimation_factor x gp_idata_width width MSB:LSB, signed
  output wire                             o_sclk                   // Slow clock pulsed output
);
// -------------------------------------------------------------------
  // WIRE DECLARATION
  wire                                           s_clk;
  wire [gp_decimation_factor*gp_idata_width-1:0] comm_data;
// -------------------------------------------------------------------  
  commutator #(
    .gp_ccw               (gp_comm_ccw         ),
    .gp_idata_width       (gp_idata_width      ),
    .gp_decimation_factor (gp_decimation_factor),
    .gp_reg_oup           (gp_comm_reg_oup     ),                     
    .gp_phase             (gp_comm_phase       )
  ) ppd_commutator                             
  (
    .i_rst_an (i_rst_an ),
    .i_ena    (i_ena    ),
    .i_clk    (i_clk    ),
    .i_data   (i_data   ),
    .o_data   (comm_data),     
    .o_clk    (s_clk    ) 
  );
        
  mul_add #(
    .gp_idata_width       (gp_idata_width      ),   
    .gp_decimation_factor (gp_decimation_factor),
    .gp_coeff_length      (gp_coeff_length     ),
    .gp_coeff_width       (gp_coeff_width      ),
    .gp_tf_df	          (gp_tf_df            ),
    .gp_ccw	          (gp_mul_ccw          ),
    .gp_odata_width       (gp_odata_width      )
  ) ppd_mul_add (
    .i_rst_an (i_rst_an ),
    .i_ena    (i_ena    ),
    .i_clk    (s_clk    ),
    .i_data   (comm_data),
    .o_data   (o_data   )
  );

  assign o_sclk = s_clk;
  
endmodule
