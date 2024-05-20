// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 08:37:01 AM
// Design Name: 
// Module Name: Z_word_decoder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module Z_word_decoder_tb;

  // Parameters
  parameter WIDTH = 9;

  // Inputs
  reg [WIDTH - 1: 0] z_word;

  // Outputs
  wire one_bits;
  wire [1:0] two_bits;
  wire [2:0] three_bits;
  wire [3:0] four_bits;
  wire [4:0] five_bits;
  wire [5:0] six_bits;
  wire [6:0] seven_bits;
  wire [7:0] eight_bits;
  wire [8:0] nine_bits;
  wire [9:0] ten_bits;
  wire [10:0] eleven_bits;
  wire [11:0] twelve_bits;
  wire [12:0] thirteen_bits;
  wire [13:0] fourteen_bits;
  wire [14:0] fifteen_bits;
  wire [15:0] sixteen_bits;

  // Instantiate the module
  Z_word_decoder #(.WIDTH(WIDTH)) decoder(
    .z_word(z_word),
    .one_bits(one_bits),
    .two_bits(two_bits),
    .three_bits(three_bits),
    .four_bits(four_bits),
    .five_bits(five_bits),
    .six_bits(six_bits),
    .seven_bits(seven_bits),
    .eight_bits(eight_bits),
    .nine_bits(nine_bits),
    .ten_bits(ten_bits),
    .eleven_bits(eleven_bits),
    .twelve_bits(twelve_bits),
    .thirteen_bits(thirteen_bits),
    .fourteen_bits(fourteen_bits),
    .fifteen_bits(fifteen_bits),
    .sixteen_bits(sixteen_bits)
  );

  // Stimulus
  initial begin
    // Test with various z_word values
    z_word = 9'b000000001;
    #10;
    z_word = 9'b000000010;
    #10;
    // Add more test cases as needed
    // Make sure to give enough time between changes to observe outputs
    // Add assertions to check outputs if needed
    // Finish the simulation after all tests are done
    $finish;
  end

endmodule

