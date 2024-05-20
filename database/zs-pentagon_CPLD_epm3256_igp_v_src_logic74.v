// This program was cloned from: https://github.com/MikhaelKaa/zs-pentagon
// License: MIT License

`define MACRO_74
module ic_1533ie7 (d1,d2,d3,d4, q1,q2,q3,q4, R, C, CR, BR, plus1, minus1);
	input  plus1, minus1, R, C;
	input  d1, d2, d3, d4;
	output q1, q2, q3, q4, CR, BR;
	
	reg[3:0] tempQ = 4'b0000;
	assign CR = (tempQ == 4'b1111 && plus1 == 1'b0 && minus1 == 1'b1)? 1'b0:1'b1;
	assign BR = (tempQ == 4'b0000 && minus1 == 1'b0 && plus1 == 1'b1)? 1'b0:1'b1;

	always @(posedge plus1)	begin
		if(C == 1'b1 && R == 1'b0 && minus1 == 1'b1);
		tempQ = tempQ + 1'b1;
	end

	/*always @(posedge minus1)
	begin
		if (C==1'bl && R==1'b0 && plusi1==1'b1)
		tempQ=tempQ-1'b1;
	end*/

	assign {q4, q3, q2, q1} = (R == 1'b0)? tempQ : 4'b0;
endmodule


module ic_1533kp11
(
    input [3:0] A,
    input [3:0] B,
    input SA,
    input CS,

    output [3:0] Y
);
assign Y = (CS)?(4'bz):((SA)?(B):(A));
//assign Y = (CS)?(4'bz):((SA)?(A):(B));
endmodule

module ic_1533kp2
(
    input [3:0] A,
    input [3:0] B,
    input S1, S2,
    input EA, EB,
    output AY, BY
);
wire [1:0]sel = {S2, S1};
wire A_out = A[sel];//((sel == 2'b00) & A[0]) | ((sel == 2'b01) & A[1] )| ((sel == 2'b10) & A[2]) | ((sel == 2'b11) & A[3]);
wire B_out = B[sel];//((sel == 2'b00) & B[0]) | ((sel == 2'b01) & B[1]) | ((sel == 2'b10) & B[2]) | ((sel == 2'b11) & B[3]);

assign AY = (EA)?(1'b0):(A_out);
assign BY = (EB)?(1'b0):(B_out);
endmodule


module ic_1533tm8
(
    input [3:0] D,
    output [3:0] Q_p,
    output [3:0] Q_n,
    input C,
    input R
);
reg [3:0] q = 4'b0;
always @(posedge C /*or negedge R*/) begin
    //if(~R) q <= 4'b0;
    /*else*/ q <= D;
end
assign Q_p = q;
assign Q_n = ~q;
endmodule

module ic_1533tm9
(
    input [5:0] D,
    output [5:0] Q,
    input C,
    input R
);
reg [5:0] q = 6'b0;
always @(posedge C or negedge R) begin
    if(~R) q <= 6'b0;
    else q <= D;
end
assign Q = q;
endmodule

module ic_1533ir23
(
    input [7:0] D,
    output [7:0] Q,
    input C,
    input OEn
);
reg [7:0] q = 8'b0;
//always @(posedge C) q <= D;
always @(posedge C) q = D;
assign Q = (OEn)?(8'bz):(q);
endmodule

/*module ic_1533ir16
(
    input [3:0] D,
    output [3:0] Q,
	input DI,
    input C,
    input PE,
	input OE
);
reg [3:0] q = 4'b0000;
always @(negedge C) begin
    if(PE) q = D;
	//else q <= {DI, q >> 1};
	else q <= {q[3:1], DI};
end
assign Q = (OE)?(q):(4'bz);
endmodule*/

/////// IR16
module ir16(
input [3:0] D,
input DI, C, PE, OE,
output [3:0] Q
);
reg [3:0] data = 4'b0;
	always @(negedge C) begin
		if (PE) data <= D;
		else data <= {data[2:0], DI};
		
	end
assign Q = OE?(data):(4'bz);
endmodule