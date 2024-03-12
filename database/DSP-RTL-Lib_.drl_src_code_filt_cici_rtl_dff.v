// -------------------------------------------------------------------
// Copyright (C) 2019 Ahmed Shahein
// -------------------------------------------------------------------
//
// -------------------------------------------------------------------
module dff #(
  parameter gp_data_width = 8                  // Set input & output bit-width
) 
(
  input  wire                     i_rst_an,    // Asynchronous active low reset
  input  wire                     i_ena,       // Synchronous active high enable
  input  wire                     i_clk,       // Rising-edge clock
  input  wire [gp_data_width-1:0] i_data,      // Input data with gp_data_width bits MSB:LSB, signed or unsigned
  output wire [gp_data_width-1:0] o_data       // Output data with gp_data_width bits MSB:LSB, signed or unsigned
);
// -------------------------------------------------------------------
  reg [gp_data_width-1:0] r_data;
// -------------------------------------------------------------------  
  always @(posedge i_clk or negedge i_rst_an)
    begin: p_dff
      if (!i_rst_an)
        r_data <= 'd0;
      else if (i_ena)
        r_data <= i_data;  
    end
  
  assign o_data = r_data;
endmodule
