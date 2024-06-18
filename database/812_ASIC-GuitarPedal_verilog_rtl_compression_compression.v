// This program was cloned from: https://github.com/sdmay24-21/ASIC-GuitarPedal
// License: Apache License 2.0

`timescale 1ns/1ps 

module compression(
  input wire [7:0] threshold,
  input wire [7:0] ratio,
  input wire [15:0] audio_in,
  output wire [15:0] audio_out

);

  wire [15:0] threshold16pos;
  wire [15:0] threshold16neg;
  wire [15:0] audio_excesspos;
  wire [15:0] audio_excessneg;
  wire [23:0] audio_excessPosTimeRatio23;
  wire [23:0] audio_excessNegTimeRatio23;
  wire [15:0] audio_excessPosTimeRatio15;
  wire [15:0] audio_excessNegTimeRatio15;
  wire [15:0] audio_outpos;
  wire [15:0] audio_outneg;
  




  // Concatenate 8 zeros to the threshold to make it 16 bits
  assign threshold16pos = {threshold, 8'b0};
  assign threshold16neg = {threshold, 8'b0} * -1;

  // Calculate the difference between audio_in and threshold16
  assign audio_excesspos = audio_in - threshold16pos;
  assign audio_excessneg = threshold16neg - audio_in;
  assign audio_excessPosTimeRatio23 = (audio_excesspos * ratio);
  assign audio_excessNegTimeRatio23 = (audio_excessneg * ratio);
  
  assign audio_excessPosTimeRatio15 = (audio_excessPosTimeRatio23) >> 8;
  assign audio_excessNegTimeRatio15 = (audio_excessNegTimeRatio23) >> 8;
  
  
  assign audio_outpos = (audio_excesspos[15] == 1'b0) ? 
								(threshold16pos + audio_excessPosTimeRatio15) :
								audio_in;
  assign audio_outneg = (audio_excessneg[15] == 1'b0) ? 
								(threshold16neg - audio_excessNegTimeRatio15) :
								audio_in;
  
  

  // Calculate audio_out based on conditions
  assign audio_out = (audio_in[15] == 1'b0) ? audio_outpos :
                    (audio_in[15] == 1'b1) ? audio_outneg :
                    audio_in;

endmodule