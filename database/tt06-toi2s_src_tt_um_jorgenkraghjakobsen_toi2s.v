// This program was cloned from: https://github.com/jorgenkraghjakobsen/tt06-toi2s
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Jørgen Kragh Jakobsen
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_jorgenkraghjakobsen_toi2s (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  
  wire [5:0] debug_out;
  wire i2c_scl;
  wire i2c_sdai;
  wire i2c_sdao;
  wire rx_in;
  wire amp_i2s_bck;
  wire amp_i2s_ws;
  wire amp_i2s_d0;
  wire amp_i2c_scl;
  wire amp_i2c_sdai;
  wire amp_i2c_sdao;
  wire amp_nenable;
  wire amp_nmute;
  wire pwm_out;
  wire debug_in;
  

  toi2s_tt_top tt_top_inst ( 
    .clk(clk),                        //! TT harnest clock
    .resetb(rst_n),                   //! TT harnest reset active low
    .ena(ena),                        //! TT harnest Circuit enable 

    .i2c_scl(i2c_scl),                
    .i2c_sdai(i2c_sdai),
    .i2c_sdao(i2c_sdao),
    
    .rx_in(rx_in), 
    
    .amp_i2s_bck(amp_i2s_bck),
    .amp_i2s_ws(amp_i2s_ws),
    .amp_i2s_d0(amp_i2s_d0),
    
    .amp_i2c_scl(amp_i2c_scl),        //! amp i2c clk control  (master ->  amp (slave))
    .amp_i2c_sdai(amp_i2c_sdai),      //! amp i2c data control (master)
    .amp_i2c_sdao(amp_i2c_sdao),      //! amp i2c data control (master)
    
    .amp_nenable(amp_nenable),        //! amp nenable
    .amp_nmute(amp_nmute),              //! amp mute      

    .pwm_out(pwm_out),

    .debug_out(debug_out),
    .debug_in(debug_in)

    ); 
  
  // Dedicated inputs 
    
  assign rx_in      = ui_in[0];   
  assign debug_in   = ui_in[1];    
    
    
  // Dedicated outputs 

  assign uo_out[0] = amp_i2s_bck; 
  assign uo_out[1] = amp_i2s_ws;  
  assign uo_out[2] = amp_i2s_d0; 
  assign uo_out[3] = amp_nenable; 
  assign uo_out[4] = amp_nmute;   
  assign uo_out[5] = 1'b0;    // free 
  assign uo_out[6] = 1'b0;    // free 
  assign uo_out[7] = pwm_out; // 

  // Bidirectional input / output 

  // I2C to circuit - client and input is only input (No strech mode imp.)
  assign i2c_scl    = uio_in[0];
  assign uio_oe[0]  = 1'b0;
  assign uio_out[0] = 1'b0; 
  
  assign i2c_sdai   = uio_in[1];
  assign uio_oe[1]  = (i2c_sdao == 1'b0) ? 1'b1 : 1'b0;
  assign uio_out[1] = i2c_sdao; 

  // I2C to amplifier - I2C clock on pin amp_i2c_scl is only output to Amp
  //assign amp_i2c_scl= uio_in[2];
  assign uio_oe[2]  = 1'b1;
  assign uio_out[2] = amp_i2c_scl; 

  assign amp_i2c_sdai = uio_in[3]; 
  assign uio_oe[3]  = (amp_i2c_sdao == 1'b0) ? 1'b1 : 1'b0;
  assign uio_out[3] = amp_i2c_sdao; 

  assign uio_out[7:4] = debug_out[3:0];
  assign uio_oe[7:4]  = 4'b1111;

endmodule
