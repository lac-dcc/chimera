// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module mux1bit2to1(input a, b, input sel, output out);
	wire sel_not;
	wire w[1:0];

    Not N1(sel, sel_not);
    And A1(.A(a), .B(sel), .out(w[0]));
    And A2(.A(b), .B(sel_not), .out(w[1]));
    Or O1(.A(w[0]), .B(w[1]), .out(out));
endmodule

module mux2bit2to1(input [1:0] a, b, input s, output [1:0] w);
    wire [1:0] tmp0, tmp1;
    wire n_s;


    Not N1(s, n_s);

    And A1(.A(n_s), .B(a[0]), .out(tmp0[0]));
    And A2(.A(s), .B(b[0]), .out(tmp0[1]));
    And A3(.A(n_s), .B(a[1]), .out(tmp1[0]));
    And A4(.A(s), .B(b[1]), .out(tmp1[1]));


    Or O1(.A(tmp0[0]), .B(tmp0[1]), .out(w[0]));
    Or O2(.A(tmp1[0]), .B(tmp1[1]), .out(w[1]));

endmodule

module mux5bit2to1( input [4:0] a, b, input s, output [4:0] w);
    mux2bit2to1 mux0( a[1:0], b[1:0], s, w[1:0]);
    mux2bit2to1 mux1( a[3:2], b[3:2], s,w[3:2]);
    mux1bit2to1 mux2(.a(a[4]), .b(b[4]), .sel(s), .out(w[4]));
endmodule