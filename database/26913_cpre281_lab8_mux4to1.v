// This program was cloned from: https://github.com/regales/cpre281
// License: Apache License 2.0

module mux4to1(wo,w1,w2,w3,s,f);
input wo,w1,w2,w3;
input [1:0] s;
output f;

assign f= s[1]? s[0]? w3:w2 :  s[0]? w1:wo;

endmodule