(* techmap_celltype = "$add" *)
module _80_74AC283_add (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 4;
parameter B_WIDTH = 4;
parameter Y_WIDTH = 4;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

wire _TECHMAP_FAIL_ = Y_WIDTH <= 1;

localparam WIDTH = ((Y_WIDTH + 3) / 4) * 4;

wire [Y_WIDTH-1:0] A_buf, B_buf;
\$pos #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(Y_WIDTH)) A_conv (.A(A), .Y(A_buf));
\$pos #(.A_SIGNED(B_SIGNED), .A_WIDTH(B_WIDTH), .Y_WIDTH(Y_WIDTH)) B_conv (.A(B), .Y(B_buf));

wire [WIDTH-1:0] AA = A_buf;
wire [WIDTH-1:0] BB = B_buf;
wire [WIDTH-1:0] YY;
wire [WIDTH:0] C;

assign C[0] = 0;

genvar i;
generate for (i = 0; i < WIDTH; i = i + 4) begin:slice
    \74AC283_1x1ADD4 adder_i(
        .A(AA[i+3:i]),
        .B(BB[i+3:i]),
        .CI(C[i]),
        .S(YY[i+3:i]),
        .CO(C[i+4]),
    );
end
endgenerate

assign Y = YY[Y_WIDTH-1:0];

endmodule

(* techmap_celltype = "$sub" *)
module _80_74AC283_sub (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 4;
parameter B_WIDTH = 4;
parameter Y_WIDTH = 4;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

wire _TECHMAP_FAIL_ = Y_WIDTH <= 1;

localparam WIDTH = ((Y_WIDTH + 3) / 4) * 4;

wire [Y_WIDTH-1:0] A_buf, B_buf;
\$pos #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(Y_WIDTH)) A_conv (.A(A), .Y(A_buf));
\$pos #(.A_SIGNED(B_SIGNED), .A_WIDTH(B_WIDTH), .Y_WIDTH(Y_WIDTH)) B_conv (.A(B), .Y(B_buf));

wire [WIDTH-1:0] AA = A_buf;
wire [WIDTH-1:0] BB = B_buf;
wire [WIDTH-1:0] YY;
wire [WIDTH:0] C;

assign C[0] = 1;

genvar i;
generate for (i = 0; i < WIDTH; i = i + 4) begin:slice
    \74AC283_1x1ADD4 adder_i (
        .A(AA[i+3:i]),
        .B(~BB[i+3:i]),
        .CI(C[i]),
        .S(YY[i+3:i]),
        .CO(C[i+4]),
    );
end
endgenerate

assign Y = YY[Y_WIDTH-1:0];

endmodule
