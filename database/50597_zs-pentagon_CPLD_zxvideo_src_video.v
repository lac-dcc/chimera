// This program was cloned from: https://github.com/MikhaelKaa/zs-pentagon
// License: MIT License

module video (
input CLK,
input RESET,
input [7:0] Q,
input C17, C3, C18, C1, C2,

input [3:0] D,
input WR,
input A0,
input IORQ,
input BL,
input C5,
input C7,

output R, G, B, I,

output test

);

wire [7:0] DD37_Q;
ir23 DD37(.D(Q), .C(C17), .OE(1'b0), .Q(DD37_Q));

wire [7:0] DD40_Q;
ir23 DD40(.D(DD37_Q), .C(C3), .OE(1'b0), .Q(DD40_Q));

wire [7:0] DD38_Q;
ir23 DD38(.D(Q), .C(C18), .OE(1'b0), .Q(DD38_Q));

wire [3:0] DD41_Q;
ir16 DD41(.D({DD38_Q[3], DD38_Q[2], DD38_Q[1], DD38_Q[0]}), .DI(1'b0), .C(C1), .PE(C2), .OE(1'b1), .Q(DD41_Q));

wire [3:0] DD42_Q;
ir16 DD42(.D({DD38_Q[7], DD38_Q[6], DD38_Q[5], DD38_Q[4]}), .DI(DD41_Q[3]), .C(C1), .PE(C2), .OE(1'b1), .Q(DD42_Q));

reg [31:0] flash_cnt = 0;

always @(negedge CLK) begin
	flash_cnt = flash_cnt + 1;
end

//kp2 DD46()

assign R = DD46_by;
assign G = DD47_ay;
assign B = DD46_ay;
assign I = DD47_by;

assign test = flash_cnt[23];
wire flash;
assign flash = flash_cnt[23];

//////////////////////////////////////////////////////////
wire A0_port;
assign A0_port = ~(WR | A0 | IORQ);
reg  [3:0] DD43 = 4'b0;
always @(posedge A0_port) begin
	DD43 <= D;
end
wire K9, K10, K11;
assign K9 = DD43[0];
assign K10 = DD43[1];
assign K11 = DD43[2];

/////////////////////////////////////
wire DD46_ay, DD46_by;
wire DD47_ay, DD47_by;
kp2 DD46(.A({K9, K9, DD40_Q[3] ,DD40_Q[0]}), .B({K10, K10, DD40_Q[4], DD40_Q[1]}), .S1(pix), .S2(C5), .EA(BL), .EB(BL), .AY(DD46_ay), .BY(DD46_by));
kp2 DD47(.A({K11, K11, DD40_Q[5] ,DD40_Q[2]}), .B({1'b0, 1'b0, DD40_Q[6], DD40_Q[6]}), .S1(pix), .S2(C5), .EA(BL), .EB(BL), .AY(DD47_ay), .BY(DD47_by));

/////////////////////////////////////
wire pix;
assign pix = dd6_11;
	wire dd7_11 = ~(DD40_Q[7] & flash);
	wire dd6_11 = dd7_11 ^ DD42_Q[3];


endmodule

/////// IR23
module ir23(
input [7:0] D,
input C, OE,
output [7:0] Q
);
reg [7:0] data = 8'b0;
	always @(posedge C) begin
		data = D;
	end
assign Q = OE?(8'bz):(data);
endmodule

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

///////////////////////////// KP2
/*module kp2(
input [3:0] A,
input EA,
input [3:0] B,
input EB,
input S1, S2,
output AY, BY
);
wire adr = {S2, S1};
reg Ad = 1'b0, Bd = 1'b0;

always @* begin 
	case (adr)
		2'b00: begin Ad = EA?(1'b0):(A[0]); Bd = EB?(1'b0):(A[0]); end 
		2'b01: begin Ad = EA?(1'b0):(A[1]); Bd = EB?(1'b0):(A[1]); end 
		2'b10: begin Ad = EA?(1'b0):(A[2]); Bd = EB?(1'b0):(A[2]); end 
		2'b11: begin Ad = EA?(1'b0):(A[3]); Bd = EB?(1'b0):(A[3]); end 
	endcase
end

assign AY = Ad;
assign BY = Bd;

endmodule*/
///////////////////////////
module kp2
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


