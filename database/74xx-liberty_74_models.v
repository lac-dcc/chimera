module \74HC85_1x1CMP4 (A, B, Li, Ei, Gi, Lo, Eo, Go);

input [3:0] A;
input [3:0] B;
input Li, Ei, Gi;
output Lo, Eo, Go;

assign Lo = (A < B) || (A == B && !Gi && !Ei);
assign Go = (A > B) || (A == B && !Li && !Ei);
assign Eo = (A == B) && Ei;

endmodule

module \74AC283_1x1ADD4 (A, B, CI, S, CO);

input [3:0] A;
input [3:0] B;
input CI;
output [3:0] S;
output CO;

assign {CO, S} = A + B + CI;

endmodule

module \74AC377_8x1DFFE (D, CE, CP, Q);

input D, CE, CP;
output reg Q;

always @(posedge CP) begin
    if (!CE) Q <= D;
end

endmodule

module \74HC688_1x1EQ8 (A, B, E, Q);

input [7:0] A;
input [7:0] B;
input E;
output Q;

assign Q = E || !(A == B);

endmodule

module \74AC161_1x1COUNT4 (A, Q, RCO, ENT, CLK, LOAD);
input [3:0] A;
input CLK;
input ENT;
input LOAD;
output reg [3:0] Q;
output RCO;

assign RCO = Q == 4'b1111;

always @ (posedge CLK) begin
  if (!LOAD) begin
    Q <= A;
  end else if (ENT) begin
    Q <= Q + 1'b1;
  end
end
endmodule
