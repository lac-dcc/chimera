// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 10:54:19 PM
// Design Name: 
// Module Name: coeffTokenNumVlcThree
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


module coeffTokenNumVlcThree #(parameter aWIDTH= 7 , vcWIDTH= 8)(
input       [aWIDTH-1  :0] addr,
output  reg [vcWIDTH -1:0] vlcCode
    );
    
// VLCThree is diffeenet as it has a fixed lenght of 6 bits only
//    
    always @(*)begin
      case(addr)
                                             // The length is reduced by one from the original size to save the resources 
                                             // if the length is zero and the value is zero this means that no output in the vlc or it's not a cas 
             // T1s =0   NZQs                    value                    
               {2'h0  ,  5'd0}   : vlcCode = { 6'b000011} ;           // str= 1 
               {2'h0  ,  5'd1 }  : vlcCode = { 6'b000000} ;           // str= 000101             
               {2'h0  ,  5'd2 }  : vlcCode = { 6'b000100} ;           // str= 00000111           
               {2'h0  ,  5'd3 }  : vlcCode = { 6'b001000} ;           // str= 000000111          
               {2'h0  ,  5'd4 }  : vlcCode = { 6'b001100} ;           // str= 0000000111         
               {2'h0  ,  5'd5 }  : vlcCode = { 6'b010000} ;           // str= 00000000111        
               {2'h0  ,  5'd6 }  : vlcCode = { 6'b010100} ;           // str= 0000000001111      
               {2'h0  ,  5'd7 }  : vlcCode = { 6'b011000} ;           // str= 0000000001011      
               {2'h0  ,  5'd8 }  : vlcCode = { 6'b011100} ;           // str= 0000000001000      
               {2'h0  ,  5'd9 }  : vlcCode = { 6'b100000} ;           // str= 00000000001111     
               {2'h0  ,  5'd10}  : vlcCode = { 6'b100100} ;           // str= 00000000001011     
               {2'h0  ,  5'd11}  : vlcCode = { 6'b101000} ;           // str= 000000000001111    
               {2'h0  ,  5'd12}  : vlcCode = { 6'b101100} ;           // str= 000000000001011    
               {2'h0  ,  5'd13}  : vlcCode = { 6'b110000} ;           // str= 0000000000001111   
               {2'h0  ,  5'd14}  : vlcCode = { 6'b110100} ;           // str= 0000000000001011   
               {2'h0  ,  5'd15}  : vlcCode = { 6'b111000} ;           // str= 0000000000000111                  
               {2'h0  ,  5'd16}  : vlcCode = { 6'b111100} ;           // str= 0000000000000100 
                                               
                                               
             // T1s =1   NZQs                   value                    
               {2'h1  ,  5'd0}   : vlcCode = { 6'b000010} ;           // str= ""  No thing  000010 this is the output for no thing         
               {2'h1  ,  5'd1 }  : vlcCode = { 6'b000010} ;           // str= "01"               
               {2'h1  ,  5'd2 }  : vlcCode = { 6'b000101} ;           // str= "000100"           
               {2'h1  ,  5'd3 }  : vlcCode = { 6'b001001} ;           // str= "00000110"         
               {2'h1  ,  5'd4 }  : vlcCode = { 6'b001101} ;           // str= "000000110"        
               {2'h1  ,  5'd5 }  : vlcCode = { 6'b010001} ;           // str= "0000000110"       
               {2'h1  ,  5'd6 }  : vlcCode = { 6'b010101} ;           // str= "00000000110"       
               {2'h1  ,  5'd7 }  : vlcCode = { 6'b011001} ;           // str= "0000000001110"     
               {2'h1  ,  5'd8 }  : vlcCode = { 6'b011101} ;           // str= "0000000001010"     
               {2'h1  ,  5'd9 }  : vlcCode = { 6'b100001} ;           // str= "00000000001110"    
               {2'h1  ,  5'd10}  : vlcCode = { 6'b100101} ;           // str= "00000000001010"    
               {2'h1  ,  5'd11}  : vlcCode = { 6'b101001} ;           // str= "000000000001110"   
               {2'h1  ,  5'd12}  : vlcCode = { 6'b101101} ;           // str= "000000000001010"   
               {2'h1  ,  5'd13}  : vlcCode = { 6'b110001} ;           // str= "000000000000001"   
               {2'h1  ,  5'd14}  : vlcCode = { 6'b110101} ;           // str= "0000000000001110"   
               {2'h1  ,  5'd15}  : vlcCode = { 6'b111001} ;           // str= "0000000000001010"                  
               {2'h1  ,  5'd16}  : vlcCode = { 6'b111101} ;           // str= "0000000000000110" 
                                               
             // T1s =2   NZQs                   value                    
               {2'h0  ,  5'd0}   : vlcCode = { 6'b000010} ;           // str= ""     No thing         
               {2'h0  ,  5'd1 }  : vlcCode = { 6'b000010} ;           // str= ""     No thing            
               {2'h0  ,  5'd2 }  : vlcCode = { 6'b000110} ;           // str= "001"            
               {2'h0  ,  5'd3 }  : vlcCode = { 6'b001010} ;           // str= "0000101"        
               {2'h0  ,  5'd4 }  : vlcCode = { 6'b001110} ;           // str= "00000101"       
               {2'h0  ,  5'd5 }  : vlcCode = { 6'b010010} ;           // str= "000000101"      
               {2'h0  ,  5'd6 }  : vlcCode = { 6'b010110} ;           // str= "0000000101"        
               {2'h0  ,  5'd7 }  : vlcCode = { 6'b011010} ;           // str= "00000000101"       
               {2'h0  ,  5'd8 }  : vlcCode = { 6'b011110} ;           // str= "0000000001101"     
               {2'h0  ,  5'd9 }  : vlcCode = { 6'b100010} ;           // str= "0000000001001"     
               {2'h0  ,  5'd10}  : vlcCode = { 6'b100110} ;           // str= "00000000001101"    
               {2'h0  ,  5'd11}  : vlcCode = { 6'b101010} ;           // str= "00000000001001"    
               {2'h0  ,  5'd12}  : vlcCode = { 6'b101110} ;           // str= "000000000001101"   
               {2'h0  ,  5'd13}  : vlcCode = { 6'b110010} ;           // str= "000000000001001"   
               {2'h0  ,  5'd14}  : vlcCode = { 6'b110110} ;           // str= "0000000000001101"   
               {2'h0  ,  5'd15}  : vlcCode = { 6'b111010} ;           // str= "0000000000001001"                  
               {2'h0  ,  5'd16}  : vlcCode = { 6'b111110} ;           // str= "0000000000000101" 
                                               
             // T1s =3   NZQs                   value                    
               {2'h0  ,  5'd0}   : vlcCode = { 6'b000010} ;           // str= ""        No thing         
               {2'h0  ,  5'd1 }  : vlcCode = { 6'b000010} ;           // str= ""        No thing           
               {2'h0  ,  5'd2 }  : vlcCode = { 6'b000010} ;           // str= ""        No thing  
               {2'h0  ,  5'd3 }  : vlcCode = { 6'b010111} ;           // str= "00011"     
               {2'h0  ,  5'd4 }  : vlcCode = { 6'b011011} ;           // str= "000011"    
               {2'h0  ,  5'd5 }  : vlcCode = { 6'b011111} ;           // str= "0000100"   
               {2'h0  ,  5'd6 }  : vlcCode = { 6'b100011} ;           // str= "00000100"   
               {2'h0  ,  5'd7 }  : vlcCode = { 6'b100111} ;           // str= "000000100"  
               {2'h0  ,  5'd8 }  : vlcCode = { 6'b101011} ;           // str= "0000000100" 
               {2'h0  ,  5'd9 }  : vlcCode = { 6'b101111} ;           // str= "00000000100"  
               {2'h0  ,  5'd10}  : vlcCode = { 6'b110011} ;           // str= "0000000001100"  
               {2'h0  ,  5'd11}  : vlcCode = { 6'b110111} ;           // str= "00000000001100"  
               {2'h0  ,  5'd12}  : vlcCode = { 6'b111011} ;           // str= "00000000001000"  
               {2'h0  ,  5'd13}  : vlcCode = { 6'b111111} ;           // str= "000000000001100"  
               {2'h0  ,  5'd14}  : vlcCode = { 6'b111111} ;           // str= "000000000001000"   
               {2'h0  ,  5'd15}  : vlcCode = { 6'b111111} ;           // str= "0000000000001100"                  
               {2'h0  ,  5'd16}  : vlcCode = { 6'b111111} ;           // str= "0000000000001000" 
                                 
                default:vlcCode = 8'h00;
            endcase    
    end   
endmodule
