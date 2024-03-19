module mux_2_1_if
(
input x1 ,
input x2 ,
input s,
output reg f
);
always@ (*)
begin
if(s)
f = x2;
else
f = x1;
end
endmodule
