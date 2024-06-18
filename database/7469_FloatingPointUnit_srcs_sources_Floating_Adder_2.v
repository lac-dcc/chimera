// This program was cloned from: https://github.com/quocthinh1511/FloatingPointUnit
// License: MIT License


`timescale 1ns / 1ps
module Converter #(parameter XLEN=32)
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
reg MSB;
reg [7:0] A_Exponent,B_Exponent,Temp_Exponent,diff_Exponent,B_Exponent_comp, diff_Exponent_comp_ex;
reg  A_sign,B_sign,Temp_sign;
reg [32:0] Temp;
reg carry;
reg [2:0] one_hot;
reg  comp;
reg sign_bit;
reg [7:0] exp_adjust;
reg [23:0] generate_bit; 
reg [23:0] propegate_bit; 
reg [24:0] carry_bit; 
reg [24:0] carry_bit_diff, carry_bit_comp_ex, carry_bit_comp_bman; 
reg [23:0] sum, sum_diff; 
wire [23:0] sum_result; 
reg [23:0] c_out_add;
reg [31:0] B_comp;
reg [7:0] one; 
reg [23:0] one_24bit;
reg cin;
integer i ; 
integer g ; 
integer t ; 
integer p; 
integer z; 


always @(*) begin

  one = 8'b00000001;
  one_24bit= 24'b000000000000000000000001;
  comp =  (A[30:23] >= B[30:23])? 1'b1 : 1'b0;
  A_Mantissa = comp ? {1'b1,A[22:0]} : {1'b1,B[22:0]};
  A_Exponent = comp ? A[30:23] : B[30:23];
  A_sign = comp ? A[31] : B[31];
  
  B_Mantissa = comp ? {1'b1,B[22:0]} : {1'b1,A[22:0]};
  B_Exponent = comp ? B[30:23] : A[30:23];
  B_sign = comp ? B[31] : A[31];


exp_adjust = A_Exponent;
B_Exponent = ~B_Exponent;
carry_bit_comp_ex[0]=1'b0;
    for(t=0;t<8; t=t+1) begin   
        B_Exponent_comp[t] = B_Exponent[t] ^ one[t] ^ carry_bit_comp_ex[t];
        carry_bit_comp_ex[t+1] = (B_Exponent[t] &  one[t] )|( one[t] & carry_bit_comp_ex[t])|(carry_bit_comp_ex[t] & B_Exponent[t]);
    end

carry_bit_diff[0]=1'b0;
    for(g=0;g<8; g=g+1) begin   
        diff_Exponent[g] = A_Exponent[g] ^ B_Exponent_comp[g] ^ carry_bit_diff[g];
        carry_bit_diff[g+1] = (A_Exponent[g] &  B_Exponent_comp[g] )|( B_Exponent_comp[g] & carry_bit_diff[g])|(carry_bit_diff[g] & A_Exponent[g]);
    end

    for(z=0;z<diff_Exponent; z=z+1) begin   
          B_Mantissa = {1'b0, B_Mantissa[23:1]};
    end


  if(A[31] ^ B[31] ==1) begin
    B_Mantissa = ~B_Mantissa;
    carry_bit_comp_bman[0]=1'b0;
    for(p=0;p<24; p=p+1) begin   
        B_comp[p] = B_Mantissa[p] ^ one_24bit[p] ^ carry_bit_comp_bman[p];
        carry_bit_comp_bman[p+1] = (B_Mantissa[p] &  one_24bit[p] )|( one_24bit[p] & carry_bit_comp_bman[p])|(carry_bit_comp_bman[p] & B_Mantissa[p]);
    end
end
else begin
    B_comp = B_Mantissa;
end


    carry_bit[0] = 1'b0;
    for(i=0;i<24; i=i+1) begin   
        sum[i] = A_Mantissa[i] ^ B_comp[i] ^ carry_bit[i];
        carry_bit[i+1] = (A_Mantissa[i] &  B_comp[i] )|( B_comp[i] & carry_bit[i])|(carry_bit[i] & A_Mantissa[i]);
    end



    $display("A_man : %d", A_Mantissa); 
    $display("B_man : %d", B_Mantissa); 
    $display("sum : %d", sum); 

carry = carry_bit[24];


     g=0;
if(A[31] ^ B[31] ==1) begin 
    if(!carry)
    begin
        sum =  {1'b0, sum[23:1]};
    end 
else
    begin
    while(!sum[23])
        begin
         sum = {sum[22:0],1'b0};
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
  $display("trai dau");  
 Sign =sign_bit;
 Mantissa = sum;
 Exponent = exp_adjust-g;
 result = {Sign,Exponent,Mantissa};
end
else begin 
    if(carry)
    begin
        sum = {1'b0, sum[23:1]};
        exp_adjust = exp_adjust+1'b1;
    end
else
    begin
    while(!sum[23])
        begin
           sum =  { sum[22:0],1'b0};
           exp_adjust =  exp_adjust-1'b1;
        end
    end
  if(A[31]==1 && B[31] ==1) begin 
    sign_bit =1;
  end      
  else begin
    sign_bit =0;
  end
  $display("cung dau");
 Sign =sign_bit;
 Mantissa = sum;
 Exponent = exp_adjust;
 result = {Sign,Exponent,Mantissa};

end
end
endmodule



