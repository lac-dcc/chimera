// This program was cloned from: https://github.com/ManuFerHi/N-GO
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`default_nettype none

//////////////////////////////////////////////////////////////////////////////////
// Company: AZXUNO
// Engineer: Miguel Angel Rodriguez Jodar
// 
// Create Date:    19:12:34 03/16/2017 
// Design Name:    
// Module Name:    config_retriever
// Project Name:   Modulo para extraer la configuracion inicial RGB-VGA de la SRAM
// Target Devices: ZXUNO Spartan 6
// Additional Comments: all rights reserved for now
//
//////////////////////////////////////////////////////////////////////////////////

module config_retriever (
  input wire clk,
  output tri [20:0] sram_addr,
  input wire [7:0] sram_data,
  output tri sram_we_n,
  output wire pwon_reset_n,
  output wire vga_on,
  output wire scanlines_on
  );
  
  reg [7:0] videoconfig = 8'h00;
  reg [63:0] shift_master_reset = 64'd0;
  
  always @(posedge clk) begin
    shift_master_reset <= {shift_master_reset[62:0], 1'b1};
    if (shift_master_reset[32:31] == 2'b01)
      videoconfig <= sram_data;
  end
  assign pwon_reset_n = shift_master_reset[63];
  
  assign sram_addr = (pwon_reset_n == 1'b0)? 21'h008FD5 : 21'hZZZZZZ;
  assign sram_we_n = (pwon_reset_n == 1'b0)? 1'b1 : 1'bZ;
  assign vga_on = videoconfig[0];
  assign scanlines_on = videoconfig[1];
endmodule
