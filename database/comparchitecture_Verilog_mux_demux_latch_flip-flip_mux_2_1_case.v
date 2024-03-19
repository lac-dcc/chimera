module mux_2_1_case (
input x1 ,
input x2 ,
input s,
output reg f
);
always@ (*)
begin
case (s)
0: f = x1;
1: f = x2;
endcase
end
endmodule