(* techmap_celltype = "$lt" *)
module _80_74HC85_lt (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

wire _TECHMAP_FAIL_ = A_WIDTH <= 3 && B_WIDTH <= 3;

localparam MAX_WIDTH = (A_WIDTH > B_WIDTH) ? A_WIDTH : B_WIDTH;
localparam WIDTH = ((MAX_WIDTH + 3) / 4) * 4;

wire [MAX_WIDTH-1:0] A_buf, B_buf;
\$pos #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(MAX_WIDTH)) A_conv (.A(A), .Y(A_buf));
\$pos #(.A_SIGNED(B_SIGNED), .A_WIDTH(B_WIDTH), .Y_WIDTH(MAX_WIDTH)) B_conv (.A(B), .Y(B_buf));

wire [WIDTH-1:0] AA = A_buf;
wire [WIDTH-1:0] BB = B_buf;
wire [WIDTH:0] G;
wire [WIDTH:0] E;
wire [WIDTH:0] L;

assign G[0] = 0;
assign E[0] = 1;
assign L[0] = 0;

genvar i;
generate for (i = 0; i < WIDTH; i = i + 4) begin:slice
    \74HC85_1x1CMP4 cmp_i(
        .A(AA[i+3:i]),
        .B(BB[i+3:i]),
        .Li(L[i]),
        .Ei(E[i]),
        .Gi(G[i]),
        .Lo(L[i+4]),
        .Eo(E[i+4]),
        .Go(G[i+4])
    );
end
endgenerate

assign Y = L[WIDTH];

endmodule

(* techmap_celltype = "$gt" *)
module _80_74HC85_gt (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

wire _TECHMAP_FAIL_ = A_WIDTH <= 3 && B_WIDTH <= 3;
localparam MAX_WIDTH = (A_WIDTH > B_WIDTH) ? A_WIDTH : B_WIDTH;
localparam WIDTH = ((MAX_WIDTH + 3) / 4) * 4;

wire [MAX_WIDTH-1:0] A_buf, B_buf;
\$pos #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(MAX_WIDTH)) A_conv (.A(A), .Y(A_buf));
\$pos #(.A_SIGNED(B_SIGNED), .A_WIDTH(B_WIDTH), .Y_WIDTH(MAX_WIDTH)) B_conv (.A(B), .Y(B_buf));

wire [WIDTH-1:0] AA = A_buf;
wire [WIDTH-1:0] BB = B_buf;
wire [WIDTH:0] G;
wire [WIDTH:0] E;
wire [WIDTH:0] L;

assign G[0] = 0;
assign E[0] = 1;
assign L[0] = 0;

genvar i;
generate for (i = 0; i < WIDTH; i = i + 4) begin:slice
    \74HC85_1x1CMP4 cmp_i(
        .A(AA[i+3:i]),
        .B(BB[i+3:i]),
        .Li(L[i]),
        .Ei(E[i]),
        .Gi(G[i]),
        .Lo(L[i+4]),
        .Eo(E[i+4]),
        .Go(G[i+4])
    );
end
endgenerate

assign Y = G[WIDTH];

endmodule

(* techmap_celltype = "$le" *)
module _80_74HC85_le (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

wire _TECHMAP_FAIL_ = A_WIDTH <= 3 && B_WIDTH <= 3;
localparam MAX_WIDTH = (A_WIDTH > B_WIDTH) ? A_WIDTH : B_WIDTH;
localparam WIDTH = ((MAX_WIDTH + 3) / 4) * 4;

wire [MAX_WIDTH-1:0] A_buf, B_buf;
\$pos #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(MAX_WIDTH)) A_conv (.A(A), .Y(A_buf));
\$pos #(.A_SIGNED(B_SIGNED), .A_WIDTH(B_WIDTH), .Y_WIDTH(MAX_WIDTH)) B_conv (.A(B), .Y(B_buf));

wire [WIDTH-1:0] AA = A_buf;
wire [WIDTH-1:0] BB = B_buf;
wire [WIDTH:0] G;
wire [WIDTH:0] E;
wire [WIDTH:0] L;

assign G[0] = 0;
assign E[0] = 1;
assign L[0] = 0;

genvar i;
generate for (i = 0; i < WIDTH; i = i + 4) begin:slice
    \74HC85_1x1CMP4 cmp_i(
        .A(AA[i+3:i]),
        .B(BB[i+3:i]),
        .Li(L[i]),
        .Ei(E[i]),
        .Gi(G[i]),
        .Lo(L[i+4]),
        .Eo(E[i+4]),
        .Go(G[i+4])
    );
end
endgenerate

assign Y = !G[WIDTH];

endmodule

(* techmap_celltype = "$ge" *)
module _80_74HC85_ge (A, B, Y);

parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 0;
parameter B_WIDTH = 0;
parameter Y_WIDTH = 0;

input [A_WIDTH-1:0] A;
input [B_WIDTH-1:0] B;
output [Y_WIDTH-1:0] Y;

wire _TECHMAP_FAIL_ = A_WIDTH <= 3 && B_WIDTH <= 3;
localparam MAX_WIDTH = (A_WIDTH > B_WIDTH) ? A_WIDTH : B_WIDTH;
localparam WIDTH = ((MAX_WIDTH + 3) / 4) * 4;

wire [MAX_WIDTH-1:0] A_buf, B_buf;
\$pos #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(MAX_WIDTH)) A_conv (.A(A), .Y(A_buf));
\$pos #(.A_SIGNED(B_SIGNED), .A_WIDTH(B_WIDTH), .Y_WIDTH(MAX_WIDTH)) B_conv (.A(B), .Y(B_buf));

wire [WIDTH-1:0] AA = A_buf;
wire [WIDTH-1:0] BB = B_buf;
wire [WIDTH:0] G;
wire [WIDTH:0] E;
wire [WIDTH:0] L;

assign G[0] = 0;
assign E[0] = 1;
assign L[0] = 0;

genvar i;
generate for (i = 0; i < WIDTH; i = i + 4) begin:slice
    \74HC85_1x1CMP4 cmp_i(
        .A(AA[i+3:i]),
        .B(BB[i+3:i]),
        .Li(L[i]),
        .Ei(E[i]),
        .Gi(G[i]),
        .Lo(L[i+4]),
        .Eo(E[i+4]),
        .Go(G[i+4])
    );
end
endgenerate

assign Y = !L[WIDTH];

endmodule
