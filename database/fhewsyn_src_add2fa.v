// This program was cloned from: https://github.com/Chair-for-Security-Engineering/fhewsyn
// License: BSD 3-Clause "New" or "Revised" License

`define MAX(a, b) (a > b ? a : b)

(* techmap_celltype = "$add" *)
module _80_add(A, B, Y);
	parameter A_SIGNED = 0;
	parameter B_SIGNED = 0;
	parameter A_WIDTH = 0;
	parameter B_WIDTH = 0;
	parameter Y_WIDTH = 0;

	(* force_downto *)
	input [A_WIDTH-1:0] A;
	(* force_downto *)
	input [B_WIDTH-1:0] B;
	(* force_downto *)
	output [Y_WIDTH-1:0] Y;

	parameter [A_WIDTH-1:0] _TECHMAP_CONSTMSK_A_ = 0;
	parameter [B_WIDTH-1:0] _TECHMAP_CONSTMSK_B_ = 0;
	localparam [A_WIDTH-1:0] A_ALLONE = ~0;
	localparam [B_WIDTH-1:0] B_ALLONE = ~0;

	genvar i;
	generate
		if (_TECHMAP_CONSTMSK_A_ == A_ALLONE || _TECHMAP_CONSTMSK_B_ == B_ALLONE)
			\$__soft_add #(
				.A_SIGNED(A_SIGNED),
				.B_SIGNED(B_SIGNED),
				.A_WIDTH(A_WIDTH),
				.B_WIDTH(B_WIDTH),
				.Y_WIDTH(Y_WIDTH)
			) _TECHMAP_REPLACE_ (
				.A(A),
				.B(B),
				.Y(Y)
			);
		else begin
			localparam AB_MAX = `MAX(A_WIDTH, B_WIDTH);
			wire [AB_MAX-1:0] Aext, Bext, C;

			assign Aext = A_SIGNED && B_SIGNED ? $signed(A) : $unsigned(A);
			assign Bext = A_SIGNED && B_SIGNED ? $signed(B) : $unsigned(B);

			for (i = 0; i < Y_WIDTH; i = i + 1)
				if (i == 0)
					FA add (.A(Aext[i]), .B(Bext[i]), .CI(0), .S(Y[i]), .CO(C[i]));
				else if (i < AB_MAX)
					FA add (.A(Aext[i]), .B(Bext[i]), .CI(C[i-1]), .S(Y[i]), .CO(C[i]));
				else if (i == AB_MAX)
					assign Y[i] = C[i-1];
				else
					assign Y[i] = 0;
		end
	endgenerate
endmodule

(* techmap_celltype = "$sub" *)
module _80_sub(A, B, Y);
	parameter A_SIGNED = 0;
	parameter B_SIGNED = 0;
	parameter A_WIDTH = 0;
	parameter B_WIDTH = 0;
	parameter Y_WIDTH = 0;

	(* force_downto *)
	input [A_WIDTH-1:0] A;
	(* force_downto *)
	input [B_WIDTH-1:0] B;
	(* force_downto *)
	output [Y_WIDTH-1:0] Y;

	parameter [A_WIDTH-1:0] _TECHMAP_CONSTMSK_A_ = 0;
	parameter [B_WIDTH-1:0] _TECHMAP_CONSTMSK_B_ = 0;
	localparam [A_WIDTH-1:0] A_ALLONE = ~0;
	localparam [B_WIDTH-1:0] B_ALLONE = ~0;

	genvar i;
	generate
		if (_TECHMAP_CONSTMSK_A_ == A_ALLONE || _TECHMAP_CONSTMSK_B_ == B_ALLONE)
			\$__soft_sub #(
				.A_SIGNED(A_SIGNED),
				.B_SIGNED(B_SIGNED),
				.A_WIDTH(A_WIDTH),
				.B_WIDTH(B_WIDTH),
				.Y_WIDTH(Y_WIDTH)
			) _TECHMAP_REPLACE_ (
				.A(A),
				.B(B),
				.Y(Y)
			);
		else begin
			localparam AB_MAX = `MAX(A_WIDTH, B_WIDTH);
			wire [AB_MAX-1:0] Aext, Bext, Binv, C;

			assign Aext = A_SIGNED && B_SIGNED ? $signed(A) : $unsigned(A);
			assign Bext = A_SIGNED && B_SIGNED ? $signed(B) : $unsigned(B);

			for (i = 0; i < Y_WIDTH; i = i + 1) begin
				if (i == 0) begin
					INV inv (.I(Bext[i]), .O(Binv[i]));
					FA sub (.A(Aext[i]), .B(Binv[i]), .CI(1), .S(Y[i]), .CO(C[i]));
				end else if (i < AB_MAX) begin
					INV inv (.I(Bext[i]), .O(Binv[i]));
					FA sub (.A(Aext[i]), .B(Binv[i]), .CI(C[i-1]), .S(Y[i]), .CO(C[i]));
				end else if (i == AB_MAX)
					assign Y[i] = C[i-1];
				else
					assign Y[i] = 0;
			end
		end
	endgenerate
endmodule
