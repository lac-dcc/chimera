module mux_4_1_case(
input [1:0] x1, x2, x3, x4,
input [1:0] s,
output reg [1:0] f
);

always@ (*)
begin
case (s)
2'b 00: f = x1;
2'b 01: f = x2;
2'b 10: f = x3;
2'b 11: f = x4;
endcase
end
endmodule