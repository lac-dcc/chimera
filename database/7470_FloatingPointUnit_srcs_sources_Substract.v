// This program was cloned from: https://github.com/quocthinh1511/FloatingPointUnit
// License: MIT License

`timescale 1ns / 1ps
module Substract #(parameter XLEN=32)
                        (input [XLEN-1:0]A,
                         input [XLEN-1:0]B,
                         input clk,
                         output overflow,
                         output underflow,
                         output exception,
                         output reg  [XLEN-1:0] result);

reg [23:0] A_Mantissa,B_Mantissa;
reg [23:0] Temp_Mantissa;
reg [22:0] Mantissa;
reg [7:0] Exponent;
reg Sign;
wire MSB;
reg [7:0] A_Exponent,B_Exponent,Temp_Exponent,diff_Exponent;
reg A_sign,B_sign,Temp_sign;
reg [32:0] Temp;
reg carry;
reg [2:0] one_hot;
reg comp;
reg sign_bit;
reg [7:0] exp_adjust;
reg [23:0] generate_bit; 
reg [23:0] propegate_bit; 
reg [24:0] carry_bit; 
reg [23:0] sum; 
reg [23:0] diff; 
reg [31:0] B_comp;
integer i ; 
integer g;

always @(*)
begin

g=0;
comp =  (A[30:23] >= B[30:23])? 1'b1 : 1'b0;
A_Mantissa = comp ? {1'b1,A[22:0]} : {1'b1,B[22:0]};
A_Exponent = comp ? A[30:23] : B[30:23];
A_sign = comp ? A[31] : B[31];
  
B_Mantissa = comp ? {1'b1,B[22:0]} : {1'b1,A[22:0]};

B_Exponent = comp ? B[30:23] : A[30:23];
B_sign = comp ? B[31] : A[31];


diff_Exponent = A_Exponent-B_Exponent;

B_Mantissa = (B_Mantissa >> diff_Exponent);
B_comp = ~B_Mantissa + 1'b1;


// {carry,Temp_Mantissa} =  (A_sign ~^ B_sign)? A_Mantissa + B_Mantissa : A_Mantissa-B_Mantissa ; 

// B_Exponent = B_Exponent + diff_Exponent;
exp_adjust = A_Exponent;
// diff = A_Mantissa + B_Mantissa;

generate_bit = A_Mantissa & B_comp ;
propegate_bit = A_Mantissa ^ B_comp ; 

carry_bit[0] = 1'b1;

for(i=1; i<25;i++) begin 
    carry_bit[i] = generate_bit[i-1] | propegate_bit[i-1] & carry_bit[i-1];
end

sum[0] =propegate_bit[0]^carry_bit[0];

for(i=1; i<24;i++) begin 
    sum[i] = propegate_bit[i] ^ carry_bit[i];
end
// sum = propegate_bit^carry_bit;

carry = carry_bit[24];

// sum = diff;

if(!carry)
    begin
        sum = sum>>1;
        // exp_adjust = exp_adjust+1'b1;
    end 
else
    begin
    while(!sum[23])
        begin
           sum = sum<<1;
        //    exp_adjust =  exp_adjust-1'b1;
           g=g+1;
        end
    end

    if(comp) begin 
        if(A[31]==1) begin 
             sign_bit =1;
        end 
        else begin
            sign_bit =0;
        end      
    end
    else begin
        if(A[31]==1) begin 
             sign_bit =0;
        end 
        else begin
            sign_bit =1;
        end 
    end  


Sign =sign_bit;
Mantissa = sum;
Exponent = exp_adjust-g;
// Exponent = (Exponent<<g);
result = {Sign,Exponent,Mantissa};


//Temp_Mantissa = (A_sign ~^ B_sign) ? (carry ? Temp_Mantissa>>1 : Temp_Mantissa) : (0); 
//Temp_Exponent = carry ? A_Exponent + 1'b1 : A_Exponent; 
//Temp_sign = A_sign;
//result = {Temp_sign,Temp_Exponent,Temp_Mantissa[22:0]};
end
endmodule