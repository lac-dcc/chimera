// This program was cloned from: https://github.com/Mario-Hero/Async-Karin
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Mario-Hero
//
// Create Date: 11/30/2019 02:40:46 PM
// Module Name: sort8
// Description: This module can sort eight numbers and output them from the smallest to the biggest in a line.
//              This module builds a Bitonic Sorting Network to sort eight numbers.
//              The input and output cannot be matrix in Verilog so you should input and catch them in a line.
// 
// Dependencies: compareSwap, reqAnd
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module sort8 #(parameter Width=16) (req,fin,numberInput,numberOutput);
input req;
output wire fin;
input [Width*8-1:0] numberInput;
output wire [Width*8-1:0] numberOutput;   
    
(* dont_touch="true" *) wire [8:0] step [0:9];
wire [Width*8-1:0] swapOut [0:8];
assign numberOutput=swapOut[8];
assign fin=step[9][8];

genvar i;
generate

for(i=0;i<8;i=i+1) 
begin:c
    assign step[0][i]=req;
end

for(i=0;i<10;i=i+1) 
begin:cs
    reqAnd #(8) reqAnd (step[i][7:0],step[i][8]);
end

for(i=0;i<8;i=i+2) 
begin:s0
    assign step[1][i+1]=1'b1;
    if(i==0||i==2) begin
        compareSwap #(Width) comp010 (step[0][i],step[1][i],numberInput[i*Width+Width-1:i*Width],numberInput[(i+1)*Width+Width-1:(i+1)*Width],swapOut[0][i*Width+Width-1:i*Width],swapOut[0][(i+1)*Width+Width-1:(i+1)*Width]);  
    end
    else begin
        compareSwap #(Width) comp011 (step[0][i],step[1][i],numberInput[i*Width+Width-1:i*Width],numberInput[(i+1)*Width+Width-1:(i+1)*Width],swapOut[0][(i+1)*Width+Width-1:(i+1)*Width],swapOut[0][i*Width+Width-1:i*Width]);  
    end
end

for(i=0;i<8;i=i+1) 
begin:s1
    if(i==0||i==1) begin
        compareSwap #(Width) comp120 (step[1][8],step[2][i],swapOut[0][i*Width+Width-1:i*Width],swapOut[0][(i+2)*Width+Width-1:(i+2)*Width],swapOut[1][i*Width+Width-1:i*Width],swapOut[1][(i+2)*Width+Width-1:(i+2)*Width]);  
    end
    else if(i==4||i==5) begin
        compareSwap #(Width) comp121 (step[1][8],step[2][i],swapOut[0][i*Width+Width-1:i*Width],swapOut[0][(i+2)*Width+Width-1:(i+2)*Width],swapOut[1][(i+2)*Width+Width-1:(i+2)*Width],swapOut[1][i*Width+Width-1:i*Width]);  
    end
    else begin
        assign step[2][i]=1'b1;  
    end
end

for(i=0;i<8;i=i+2) 
begin:s2
    assign step[3][i+1]=1'b1;  
    if(i==0||i==2) begin
        compareSwap #(Width) comp210 (step[2][8],step[3][i],swapOut[1][i*Width+Width-1:i*Width],swapOut[1][(i+1)*Width+Width-1:(i+1)*Width],swapOut[2][i*Width+Width-1:i*Width],swapOut[2][(i+1)*Width+Width-1:(i+1)*Width]);  
    end
    else begin
        compareSwap #(Width) comp211 (step[2][8],step[3][i],swapOut[1][i*Width+Width-1:i*Width],swapOut[1][(i+1)*Width+Width-1:(i+1)*Width],swapOut[2][(i+1)*Width+Width-1:(i+1)*Width],swapOut[2][i*Width+Width-1:i*Width]);  
    end
end

for(i=0;i<4;i=i+1) 
begin:s3
    assign step[4][i+4]=1'b1;  
    compareSwap #(Width) comp34 (step[3][8],step[4][i],swapOut[2][i*Width+Width-1:i*Width],swapOut[2][(i+4)*Width+Width-1:(i+4)*Width],swapOut[3][i*Width+Width-1:i*Width],swapOut[3][(i+4)*Width+Width-1:(i+4)*Width]);  
end

for(i=0;i<8;i=i+1) 
begin:s4
    if(i==0||i==1) begin
        compareSwap #(Width) comp420 (step[4][8],step[5][i],swapOut[3][i*Width+Width-1:i*Width],swapOut[3][(i+2)*Width+Width-1:(i+2)*Width],swapOut[4][i*Width+Width-1:i*Width],swapOut[4][(i+2)*Width+Width-1:(i+2)*Width]);  
    end
    else if(i==4||i==5) begin
        compareSwap #(Width) comp421 (step[4][8],step[5][i],swapOut[3][i*Width+Width-1:i*Width],swapOut[3][(i+2)*Width+Width-1:(i+2)*Width],swapOut[4][(i+2)*Width+Width-1:(i+2)*Width],swapOut[4][i*Width+Width-1:i*Width]);  
    end
    else begin:s110
        assign step[5][i]=1'b1;  
    end
end

for(i=0;i<8;i=i+2) 
begin:s5
    assign step[6][i+1]=1'b1;  
    if(i==0||i==2) begin
        compareSwap #(Width) comp510 (step[5][8],step[6][i],swapOut[4][i*Width+Width-1:i*Width],swapOut[4][(i+1)*Width+Width-1:(i+1)*Width],swapOut[5][i*Width+Width-1:i*Width],swapOut[5][(i+1)*Width+Width-1:(i+1)*Width]);  
    end
    else begin
        compareSwap #(Width) comp511 (step[5][8],step[6][i],swapOut[4][i*Width+Width-1:i*Width],swapOut[4][(i+1)*Width+Width-1:(i+1)*Width],swapOut[5][(i+1)*Width+Width-1:(i+1)*Width],swapOut[5][i*Width+Width-1:i*Width]);  
    end
end

for(i=0;i<4;i=i+1) 
begin:s6
    assign step[7][i+4]=1'b1;  
    compareSwap #(Width) comp64 (step[6][8],step[7][i],swapOut[5][i*Width+Width-1:i*Width],swapOut[5][(i+4)*Width+Width-1:(i+4)*Width],swapOut[6][i*Width+Width-1:i*Width],swapOut[6][(i+4)*Width+Width-1:(i+4)*Width]);  
end

for(i=0;i<8;i=i+1) 
begin:s7
    if(i==0||i==1||i==4||i==5) begin
        compareSwap #(Width) comp72 (step[7][8],step[8][i],swapOut[6][i*Width+Width-1:i*Width],swapOut[6][(i+2)*Width+Width-1:(i+2)*Width],swapOut[7][i*Width+Width-1:i*Width],swapOut[7][(i+2)*Width+Width-1:(i+2)*Width]);  
    end
    else begin
        assign step[8][i]=1'b1;  
    end
end

for(i=0;i<8;i=i+2) 
begin:s8
    assign step[9][i+1]=1'b1;  
    compareSwap #(Width) comp81 (step[8][8],step[9][i],swapOut[7][i*Width+Width-1:i*Width],swapOut[7][(i+1)*Width+Width-1:(i+1)*Width],swapOut[8][i*Width+Width-1:i*Width],swapOut[8][(i+1)*Width+Width-1:(i+1)*Width]);  

end
endgenerate
endmodule








