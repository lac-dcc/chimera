// This program was cloned from: https://github.com/sdmay24-21/ASIC-GuitarPedal
// License: Apache License 2.0

module multiplier /*(
//parameter IMPULSE_LENGTH = 15'h00FF,

);*/(
    input clk,
    input adc_clock,
    input record,
    input loop,
    input off_chip_mem,
    input off_chip_mem_ready,
    input [15:0] delay_reverb,
    input [15:0] gain,
    input [15:0] impulses,
    input [15:0] data_in,
    output memory_we,
    output [15:0] address_out,
    output [15:0] data_out
    );


 always @(posedge clk) begin
    mult_output = (data_in +

  + (|data_in) ? (data_in<<0): 0 
  + (|data_in) ? (data_in<<1): 0
  + (|data_in) ? (data_in<<2): 0
  + (|data_in) ? (data_in<<3): 0
  + (|data_in) ? (data_in<<4): 0
  + (|data_in) ? (data_in<<5): 0
  + (|data_in) ? (data_in<<6): 0
  + (|data_in) ? (data_in<<7): 0 


  + (data_in & (8'h01)) ? (data_in << 8) : 8'h00
  + (data_in & (8'h02)) ? (data_in << 9) : 8'h00
  + (data_in & (8'h04)) ? (data_in << 10) : 8'h00
  + (data_in & (8'h08)) ? (data_in << 11) : 8'h00
  + (data_in & (8'h10)) ? (data_in << 12) : 8'h00
  + (data_in & (8'h20)) ? (data_in << 13) : 8'h00
  + (data_in & (8'h40)) ? (data_in << 14) : 8'h00
  + (data_in & (8'h80)) ? (data_in << 15) : 8'h00

/*
  + (data_in&(0x01<<0)) ? (data_in<<8): 0 
  + (data_in&(0x01<<1)) ? (data_in<<9): 0
  + (data_in&(0x01<<2)) ? (data_in<<10): 0
  + (data_in&(0x01<<3)) ? (data_in<<11): 0//p
  + (data_in&(0x01<<4)) ? (data_in<<12): 0
  + (data_in&(0x01<<5)) ? (data_in<<13): 0
  + (data_in&(0x01<<6)) ? (data_in<<14): 0
  + (data_in&(0x01<<7)) ? (data_in<<15): 0
  */
  );


 end




endmodule