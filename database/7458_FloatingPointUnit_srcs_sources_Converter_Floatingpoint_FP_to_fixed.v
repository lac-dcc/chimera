// This program was cloned from: https://github.com/quocthinh1511/FloatingPointUnit
// License: MIT License


// `include "../sources/Converter_Floatingpoint/tim_phan_nguyen.v"
// `include "../sources/Converter_Floatingpoint//tinh_mu.v"
// `include "../sources/Converter_Floatingpoint/tinh_phan_tp.v"
// `include "../sources/Converter_Floatingpoint/botru.v"
// `include "../sources/Converter_Floatingpoint/cong_8bit.v"
// `include "../sources/Converter_Floatingpoint/cong_24bit.v"
// `include "../sources/Converter_Floatingpoint/tru_8bit.v"
module FP_sang_TP(a,result);
input [31:0]a ;   // so fp
output  [31:0]  result;
wire Cout; 
wire Cout_check; 
wire [7:0] dau;
real test;
real temp;
wire [7:0] exponent; 
reg [7:0] exponent_temp; 



assign exponent = a[30:23]-127;




 
always @(*) begin

    if(exponent[7]==1) begin
        exponent_temp = ~ exponent +1'b1;  

        temp =(1*1.0/exponent_temp)*($itor({1'b1,a[22:0]})/2**23)*((-1)**(a[31]));
    end

    else begin
         temp =(2**(a[30:23]-127))*($itor({1'b1,a[22:0]})/2**23)*((-1)**(a[31]));
    end
    $display("gia tri la %f", temp);
end
assign result = temp;
endmodule 

module botru(in1, S, Cout,dau);
  input [7:0] in1;
  output [7:0] S;
  output Cout;
  output [7:0]dau;
 wire [7:0]in11,in22,in111; 
wire Cout;
wire [7:0]dau;
assign in111=~in1;
assign in11=(in1>=(8'b0111_1111))?in1:in111;
assign in22=(in1>=(8'b0111_1111))?(8'b1000_0001):(8'b1000_0000);
cong_8bit r(in11,in22,S,Cout);
  assign dau=(in1>=(8'b0111_1111))?(8'h2B):(8'h2D); //   + -
endmodule

module FA (a, b, cin, s ,cout);
input a , b , cin;
output s , cout;
wire a,b,cin;
wire c1,c0;
wire sum,cout,s  ;
half_adder half_adder_00(a , b , c0, sum );
half_adder half_adder_01(sum , cin , c1 , s);
assign cout = c1 | c0;
endmodule
module half_adder (a, b, c, s);
input a,b;
output s,c;
wire a,b,c,s;
assign s = a ^ b;
assign c = a &b;
endmodule
module cong_8bit(  in1,in2  , S , Cout);
input [7:0]in1,in2; 
output [7:0]S ;
output Cout; 
wire [8:1] temp;

FA FA_0(in1[0], in2[0], 1'b0, S[0], temp[1]);
  FA FA_1(in1[1], in2[1], temp[1], S[1], temp[2]);
  FA FA_2(in1[2], in2[2], temp[2], S[2], temp[3]);
  FA FA_3(in1[3], in2[3], temp[3], S[3], temp[4]);
  FA FA_4(in1[4], in2[4], temp[4], S[4], temp[5]);
  FA FA_5(in1[5], in2[5], temp[5], S[5], temp[6]);
  FA FA_6(in1[6], in2[6], temp[6], S[6], temp[7]);
  FA FA_7(in1[7], in2[7], temp[7], S[7], temp[8]);
 
assign Cout=temp[8];
//assign S[8]=Cout;

endmodule 