// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2024 06:44:04 AM
// Design Name: 
// Module Name: Z_word_decoder
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


module Z_word_decoder #(parameter WIDTH= 9)(

input   wire    [WIDTH -1:0]    z_word,

output   reg                    one_bits,
output   reg     [1:0]          two_bits,
output   reg     [2:0]          three_bits,
output   reg     [3:0]          four_bits,
output   reg     [4:0]          five_bits,
output   reg     [5:0]          six_bits,
output   reg     [6:0]          seven_bits,
output   reg     [7:0]          eight_bits,
output   reg     [8:0]          nine_bits,
output   reg     [9:0]          ten_bits,
output   reg     [10:0]         eleven_bits,
output   reg     [11:0]         twelve_bits,
output   reg     [12:0]         thirteen_bits,
output   reg     [13:0]         fourteen_bits,
output   reg     [14:0]         fifteen_bits,
output   reg     [15:0]         sixteen_bits
    );
    
    always@*
        begin
               one_bits      = 'b0 ;
               two_bits      = 'b0 ;  
               three_bits    = 'b0 ;
               four_bits     = 'b0 ;
               five_bits     = 'b0 ;
               six_bits      = 'b0 ;
               seven_bits    = 'b0 ;
               eight_bits    = 'b0 ;
                nine_bits    = 'b0 ;
               ten_bits      = 'b0 ;
               eleven_bits   = 'b0 ;
               twelve_bits   = 'b0 ;
               thirteen_bits = 'b0 ;
               fourteen_bits = 'b0 ;
               fifteen_bits  = 'b0 ;
               sixteen_bits   = 'b0 ;
            case (z_word[WIDTH -1:WIDTH -5])
              'd1: one_bits =           z_word[0:0];               
              'd2: two_bits =           z_word[1:0];
              'd3: three_bits =         z_word[2:0];
              'd4: four_bits =          z_word[3:0];
              'd5: five_bits =          z_word[3:0];
              'd6: six_bits =           z_word[3:0];
              'd7: seven_bits =         z_word[3:0];
              'd8: eight_bits =         z_word[3:0];
              'd9: nine_bits =          z_word[3:0];
              'd10: ten_bits =          z_word[3:0];
              'd11: eleven_bits =       z_word[3:0];
              'd12: twelve_bits =       z_word[3:0];
              'd13: thirteen_bits  =    z_word[3:0];
              'd14: fourteen_bits =     z_word[3:0];
              'd15: fifteen_bits =      z_word[3:0];
              'd16: sixteen_bits =      z_word[3:0];
              
              
/* This is not the best for the resources see the above
              'd5: five_bits =          {1'b0,z_word[3:0]};
              'd6: six_bits =           {2'b0,z_word[3:0]};
              'd7: seven_bits =         {3'b0,z_word[3:0]};
              'd8: eight_bits =         {4'b0,z_word[3:0]};
              'd9: nine_bits =          {5'b0,z_word[3:0]};
              'd10: ten_bits =          {6'b0,z_word[3:0]};
              'd11: eleven_bits =       {7'b0,z_word[3:0]};
              'd12: twelve_bits =       {8'b0,z_word[3:0]};
              'd13: thirteen_bits  =    {9'b0,z_word[3:0]};
              'd14: fourteen_bits =     {10'b0,z_word[3:0]};
              'd15: fifteen_bits =      {11'b0,z_word[3:0]};
              'd16: sixteen_bits =      {12'b0,z_word[3:0]};

*/              
              
              default:        begin  
               one_bits      = 'b0 ;
               two_bits      = 'b0 ;  
               three_bits    = 'b0 ;
               four_bits     = 'b0 ;
               five_bits     = 'b0 ;
               six_bits      = 'b0 ;
               seven_bits    = 'b0 ;
               eight_bits    = 'b0 ;
                nine_bits    = 'b0 ;
               ten_bits      = 'b0 ;
               eleven_bits   = 'b0 ;
               twelve_bits   = 'b0 ;
               thirteen_bits = 'b0 ;
               fourteen_bits = 'b0 ;
               fifteen_bits  = 'b0 ;
               sixteen_bits   = 'b0 ;
               end
              
            endcase
        
        end
    
    
    
    
    
    
    
endmodule
