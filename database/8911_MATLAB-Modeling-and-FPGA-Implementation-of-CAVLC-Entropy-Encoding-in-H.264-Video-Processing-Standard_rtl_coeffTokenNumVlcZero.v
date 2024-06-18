// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2024 10:49:36 PM
// Design Name: 
// Module Name: coeffTokenNumVlcZero
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


module coeffTokenNumVlcZero #(parameter aWIDTH= 7 , vcWIDTH= 8)(
input       [aWIDTH-1  :0] addr,
output  reg [vcWIDTH -1:0] vlcCode
    );
    
    
    always @(*)begin
      case(addr)
                                             // The length is reduced by one from the original size to save the resources 
                                             // if the length is zero and the value is zero this means that no output in the vlc or it's not a cas 
             // T1s =0   NZQs                length-1   value                    
               {2'h0  ,  5'd0}   : vlcCode = {4'd0  ,  4'b0001} ;           // str= 1 
               {2'h0  ,  5'd1 }  : vlcCode = {4'd5  ,  4'b0101} ;           // str= 000101             
               {2'h0  ,  5'd2 }  : vlcCode = {4'd7  ,  4'b0111} ;           // str= 00000111           
               {2'h0  ,  5'd3 }  : vlcCode = {4'd8  ,  4'b0111} ;           // str= 000000111          
               {2'h0  ,  5'd4 }  : vlcCode = {4'd9  ,  4'b0111} ;           // str= 0000000111         
               {2'h0  ,  5'd5 }  : vlcCode = {4'd10 ,  4'b0111} ;           // str= 00000000111        
               {2'h0  ,  5'd6 }  : vlcCode = {4'd12 ,  4'b1111} ;           // str= 0000000001111      
               {2'h0  ,  5'd7 }  : vlcCode = {4'd12 ,  4'b1011} ;           // str= 0000000001011      
               {2'h0  ,  5'd8 }  : vlcCode = {4'd12 ,  4'b1000} ;           // str= 0000000001000      
               {2'h0  ,  5'd9 }  : vlcCode = {4'd13 ,  4'b1111} ;           // str= 00000000001111     
               {2'h0  ,  5'd10}  : vlcCode = {4'd13 ,  4'b1011} ;           // str= 00000000001011     
               {2'h0  ,  5'd11}  : vlcCode = {4'd14 ,  4'b1111} ;           // str= 000000000001111    
               {2'h0  ,  5'd12}  : vlcCode = {4'd14 ,  4'b1011} ;           // str= 000000000001011    
               {2'h0  ,  5'd13}  : vlcCode = {4'd15 ,  4'b1111} ;           // str= 0000000000001111   
               {2'h0  ,  5'd14}  : vlcCode = {4'd15 ,  4'b1011} ;           // str= 0000000000001011   
               {2'h0  ,  5'd15}  : vlcCode = {4'd15 ,  4'b0111} ;           // str= 0000000000000111                  
               {2'h0  ,  5'd16}  : vlcCode = {4'd15 ,  4'b0100} ;           // str= 0000000000000100 
                                                       
                                                 
             // T1s =1   NZQs                length-1   value                    
               {2'h1  ,  5'd0}   : vlcCode = {4'd0 ,  4'b0000} ;           // str= ""  No thing          
               {2'h1  ,  5'd1 }  : vlcCode = {4'd1 ,  4'b0001} ;           // str= "01"               
               {2'h1  ,  5'd2 }  : vlcCode = {4'd5 ,  4'b0100} ;           // str= "000100"           
               {2'h1  ,  5'd3 }  : vlcCode = {4'd7 ,  4'b0110} ;           // str= "00000110"         
               {2'h1  ,  5'd4 }  : vlcCode = {4'd8 ,  4'b0110} ;           // str= "000000110"        
               {2'h1  ,  5'd5 }  : vlcCode = {4'd9 ,  4'b0110} ;           // str= "0000000110"       
               {2'h1  ,  5'd6 }  : vlcCode = {4'd10 ,  4'b0110} ;           // str= "00000000110"       
               {2'h1  ,  5'd7 }  : vlcCode = {4'd12 ,  4'b1110} ;           // str= "0000000001110"     
               {2'h1  ,  5'd8 }  : vlcCode = {4'd12 ,  4'b1010} ;           // str= "0000000001010"     
               {2'h1  ,  5'd9 }  : vlcCode = {4'd13 ,  4'b1110} ;           // str= "00000000001110"    
               {2'h1  ,  5'd10}  : vlcCode = {4'd13 ,  4'b1010} ;           // str= "00000000001010"    
               {2'h1  ,  5'd11}  : vlcCode = {4'd14 ,  4'b1110} ;           // str= "000000000001110"   
               {2'h1  ,  5'd12}  : vlcCode = {4'd14 ,  4'b1010} ;           // str= "000000000001010"   
               {2'h1  ,  5'd13}  : vlcCode = {4'd14 ,  4'b0001} ;           // str= "000000000000001"   
               {2'h1  ,  5'd14}  : vlcCode = {4'd15 ,  4'b1110} ;           // str= "0000000000001110"   
               {2'h1  ,  5'd15}  : vlcCode = {4'd15 ,  4'b1010} ;           // str= "0000000000001010"                  
               {2'h1  ,  5'd16}  : vlcCode = {4'd15 ,  4'b0110} ;           // str= "0000000000000110" 
                    
             // T1s =2   NZQs                length-1   value                    
               {2'h0  ,  5'd0}   : vlcCode = {4'd0  ,  4'b0000} ;           // str= ""     No thing         
               {2'h0  ,  5'd1 }  : vlcCode = {4'd0  ,  4'b0000} ;           // str= ""     No thing            
               {2'h0  ,  5'd2 }  : vlcCode = {4'd2  ,  4'b0001} ;           // str= "001"            
               {2'h0  ,  5'd3 }  : vlcCode = {4'd6  ,  4'b0101} ;           // str= "0000101"        
               {2'h0  ,  5'd4 }  : vlcCode = {4'd7  ,  4'b0101} ;           // str= "00000101"       
               {2'h0  ,  5'd5 }  : vlcCode = {4'd8  ,  4'b0101} ;           // str= "000000101"      
               {2'h0  ,  5'd6 }  : vlcCode = {4'd9  ,  4'b0101} ;           // str= "0000000101"        
               {2'h0  ,  5'd7 }  : vlcCode = {4'd10 ,  4'b0101} ;           // str= "00000000101"       
               {2'h0  ,  5'd8 }  : vlcCode = {4'd12 ,  4'b1101} ;           // str= "0000000001101"     
               {2'h0  ,  5'd9 }  : vlcCode = {4'd12 ,  4'b1001} ;           // str= "0000000001001"     
               {2'h0  ,  5'd10}  : vlcCode = {4'd13 ,  4'b1101} ;           // str= "00000000001101"    
               {2'h0  ,  5'd11}  : vlcCode = {4'd13 ,  4'b1001} ;           // str= "00000000001001"    
               {2'h0  ,  5'd12}  : vlcCode = {4'd14 ,  4'b1101} ;           // str= "000000000001101"   
               {2'h0  ,  5'd13}  : vlcCode = {4'd14 ,  4'b1001} ;           // str= "000000000001001"   
               {2'h0  ,  5'd14}  : vlcCode = {4'd15 ,  4'b1101} ;           // str= "0000000000001101"   
               {2'h0  ,  5'd15}  : vlcCode = {4'd15 ,  4'b1001} ;           // str= "0000000000001001"                  
               {2'h0  ,  5'd16}  : vlcCode = {4'd15 ,  4'b0101} ;           // str= "0000000000000101" 
                  
             // T1s =3   NZQs                length-1   value                    
               {2'h0  ,  5'd0}   : vlcCode = {4'd0 ,  4'b0000} ;           // str= ""        No thing         
               {2'h0  ,  5'd1 }  : vlcCode = {4'd0 ,  4'b0000} ;           // str= ""        No thing           
               {2'h0  ,  5'd2 }  : vlcCode = {4'd0 ,  4'b0000} ;           // str= ""        No thing  
               {2'h0  ,  5'd3 }  : vlcCode = {4'd4 ,  4'b0011} ;           // str= "00011"     
               {2'h0  ,  5'd4 }  : vlcCode = {4'd5 ,  4'b0011} ;           // str= "000011"    
               {2'h0  ,  5'd5 }  : vlcCode = {4'd6 ,  4'b0100} ;           // str= "0000100"   
               {2'h0  ,  5'd6 }  : vlcCode = {4'd7 ,  4'b0100} ;           // str= "00000100"   
               {2'h0  ,  5'd7 }  : vlcCode = {4'd8 ,  4'b0100} ;           // str= "000000100"  
               {2'h0  ,  5'd8 }  : vlcCode = {4'd9 ,  4'b0100} ;           // str= "0000000100" 
               {2'h0  ,  5'd9 }  : vlcCode = {4'd10 ,  4'b0100} ;           // str= "00000000100"  
               {2'h0  ,  5'd10}  : vlcCode = {4'd12 ,  4'b1100} ;           // str= "0000000001100"  
               {2'h0  ,  5'd11}  : vlcCode = {4'd13 ,  4'b1100} ;           // str= "00000000001100"  
               {2'h0  ,  5'd12}  : vlcCode = {4'd13 ,  4'b1000} ;           // str= "00000000001000"  
               {2'h0  ,  5'd13}  : vlcCode = {4'd14 ,  4'b1100} ;           // str= "000000000001100"  
               {2'h0  ,  5'd14}  : vlcCode = {4'd14 ,  4'b1000} ;           // str= "000000000001000"   
               {2'h0  ,  5'd15}  : vlcCode = {4'd15 ,  4'b1100} ;           // str= "0000000000001100"                  
               {2'h0  ,  5'd16}  : vlcCode = {4'd15 ,  4'b1000} ;           // str= "0000000000001000" 
                                  
                default:vlcCode = 8'h00;
            endcase    
    end   
endmodule


