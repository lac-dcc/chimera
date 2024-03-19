module mux_2_1_ternary
(
input x1 ,
input x2 ,
input s,
output f
);
assign f = s ? x2 : x1;
endmodule
