// This program was cloned from: https://github.com/Anas-Salah/MATLAB-Modeling-and-FPGA-Implementation-of-CAVLC-Entropy-Encoding-in-H.264-Video-Processing-Standard
// License: MIT License

`timescale 1ns / 1ps


module coeffTokenEnc #(parameter aWIDTH= 6 , vcWIDTH= 8, vc3WIDTH= 8) (
input       clk_n,
input       rst,
input [3:0] nC, // 4 bits for the worst case 
input [1:0] T1,
input [4:0] NZQs,

output reg  [vcWIDTH -1:0] coeffTokenC,
output reg   coeffTokenC3Flag // A flag for the coeff token code for vlc three which is fixed length

    );

//    It's good to make four adresses for optimization t oreduce the mux size 
    // I thinl it will be already reduced due to optimization 


//    Adrres of Num_VLC0 1 bit for nC 2 bits for T1s and 4 bits for  NZQs   

/* 
The output is 8 bits and divided as follow:
4 bit for the length 
and 4 bits for the value but the length is decremented by one means that if 
the length is 16 bits I will represent it as f in hexadecimal 
*/

// also if I have one bit lenght I will represent it as 0 
// special case incase of no thing case it will not happen but I modeled it as 8'h10 and it will be reconized at the decding module to reduce the number of bits 
/*
The input address is as foloow 7 bits {2 bits for the T1s and 5 bits for the total NZQs ranging from }
*/
/*
The comparison in the case statement should be done with specific values,
 not ranges like >= 'd8. You can use specific values to match cases like 'd8, 'd9, etc.,
  but for greater than or equal comparison, you would need to use a separate if condition.
*/
wire [5:0] addr; 
    assign addr = {T1, NZQs};


reg [7:0] vlc_code;
 /*       vlcOneAddr
          vlcTwoAddr
          vlcThreeAddr
*/
// Thor the inistantiation 
wire   [7:0]  vlcCodeZero;
wire   [7:0]  vlcCodeOne;
wire   [7:0]  vlcCodeTwo;
wire   [5:0]  vlcCodeThree;
// -- Choicing the VLC --

        coeffTokenNumVlcZero u0 (
            .addr(addr),
            .vlcCode(vlcCodeZero)        
        );
    
        coeffTokenNumVlcOne u1 (
            .addr(addr),
            .vlcCode(vlcCodeOne)        
        );         
 
        coeffTokenNumVlcTwo u2 (
            .addr(addr),
            .vlcCode(vlcCodeTwo)        
        );          
    
        coeffTokenNumVlcThree u3 (
            .addr(addr),
            .vlcCode(vlcCodeThree)        
        );  
    
 always @(*) begin
    if (nC == 0 || nC == 1) begin
       coeffTokenC = vlcCodeZero;
       coeffTokenC3Flag = 1'b0; 
    end
    else if (nC == 2 || nC == 3) begin
      coeffTokenC = vlcCodeOne;
      coeffTokenC3Flag = 1'b0;          
    end   
    else if (nC == 4 || nC == 5 || nC == 6 || nC == 7) begin
       coeffTokenC = vlcCodeTwo;
       coeffTokenC3Flag = 1'b0;      
    end
    else begin
          
           coeffTokenC = vlcCodeThree ;       
           coeffTokenC3Flag = 1'b1;     
    end
end       

    
    
    
endmodule
