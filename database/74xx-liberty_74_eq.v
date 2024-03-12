// Note: this file is kept around for posterity; ABC is very good at
// optimising equality checks.

(* techmap_celltype = "$eq" *)
module _80_74HC688_eq (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;
parameter _TECHMAP_CONSTMSK_A_ = 0;
parameter _TECHMAP_CONSTVAL_A_ = 0;
parameter _TECHMAP_CONSTMSK_B_ = 0;
parameter _TECHMAP_CONSTVAL_B_ = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

wire _TECHMAP_FAIL_ = (A_WIDTH <= 6 && B_WIDTH <= 6) || &_TECHMAP_CONSTMSK_A_ || &_TECHMAP_CONSTMSK_B_;

localparam WIDTH = ((Y_WIDTH + 7) / 8) * 8;

wire [Y_WIDTH-1:0] A_buf, B_buf;
\$pos #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(Y_WIDTH)) A_conv (.A(A), .Y(A_buf));
\$pos #(.A_SIGNED(B_SIGNED), .A_WIDTH(B_WIDTH), .Y_WIDTH(Y_WIDTH)) B_conv (.A(B), .Y(B_buf));

wire [WIDTH-1:0] AA = A_buf;
wire [WIDTH-1:0] BB = B_buf;
wire [WIDTH-1:0] YY;
wire [WIDTH:0] C;

assign C[0] = 0;

genvar i;
generate for (i = 0; i < WIDTH; i = i + 8) begin:slice
    \74HC688_1x1EQ8 eq_i (
        .A(AA[i+7:i]),
        .B(BB[i+7:i]),
        .E(C[i]),
        .Q(C[i+8])
    );
end
endgenerate

assign Y = !C[WIDTH];

endmodule

(* techmap_celltype = "$ne" *)
module _80_74HC688_ne (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;
parameter _TECHMAP_CONSTMSK_A_ = 0;
parameter _TECHMAP_CONSTVAL_A_ = 0;
parameter _TECHMAP_CONSTMSK_B_ = 0;
parameter _TECHMAP_CONSTVAL_B_ = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

wire _TECHMAP_FAIL_ = (A_WIDTH <= 6 && B_WIDTH <= 6) || &_TECHMAP_CONSTMSK_A_ || &_TECHMAP_CONSTMSK_B_;

localparam WIDTH = ((Y_WIDTH + 7) / 8) * 8;

wire [Y_WIDTH-1:0] A_buf, B_buf;
\$pos #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(Y_WIDTH)) A_conv (.A(A), .Y(A_buf));
\$pos #(.A_SIGNED(B_SIGNED), .A_WIDTH(B_WIDTH), .Y_WIDTH(Y_WIDTH)) B_conv (.A(B), .Y(B_buf));

wire [WIDTH-1:0] AA = A_buf;
wire [WIDTH-1:0] BB = B_buf;
wire [WIDTH-1:0] YY;
wire [WIDTH:0] C;

assign C[0] = 0;

genvar i;
generate for (i = 0; i < WIDTH; i = i + 8) begin:slice
    \74HC688_1x1EQ8 eq_i (
        .A(AA[i+7:i]),
        .B(BB[i+7:i]),
        .E(C[i]),
        .Q(C[i+8])
    );
end
endgenerate

assign Y = C[WIDTH];

endmodule
