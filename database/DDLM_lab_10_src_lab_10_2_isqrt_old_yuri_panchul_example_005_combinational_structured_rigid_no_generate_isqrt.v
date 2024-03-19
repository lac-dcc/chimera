// combinational structured rigid no generate

module isqrt
(
    input  [31:0] x,
    output [15:0] y
);

    localparam [31:0] m = 32'h4000_0000;

    wire [31:0] ix [0:15], iy [0:15];
    wire [31:0] ox [0:15], oy [0:15];

    isqrt_slice #(.m (m >>  0 * 2)) i00 (.ix (ix [ 0]), .iy (iy [ 0]), .ox (ox [ 0]), .oy (oy [ 0]));
    isqrt_slice #(.m (m >>  1 * 2)) i01 (.ix (ix [ 1]), .iy (iy [ 1]), .ox (ox [ 1]), .oy (oy [ 1]));
    isqrt_slice #(.m (m >>  2 * 2)) i02 (.ix (ix [ 2]), .iy (iy [ 2]), .ox (ox [ 2]), .oy (oy [ 2]));
    isqrt_slice #(.m (m >>  3 * 2)) i03 (.ix (ix [ 3]), .iy (iy [ 3]), .ox (ox [ 3]), .oy (oy [ 3]));
    isqrt_slice #(.m (m >>  4 * 2)) i04 (.ix (ix [ 4]), .iy (iy [ 4]), .ox (ox [ 4]), .oy (oy [ 4]));
    isqrt_slice #(.m (m >>  5 * 2)) i05 (.ix (ix [ 5]), .iy (iy [ 5]), .ox (ox [ 5]), .oy (oy [ 5]));
    isqrt_slice #(.m (m >>  6 * 2)) i06 (.ix (ix [ 6]), .iy (iy [ 6]), .ox (ox [ 6]), .oy (oy [ 6]));
    isqrt_slice #(.m (m >>  7 * 2)) i07 (.ix (ix [ 7]), .iy (iy [ 7]), .ox (ox [ 7]), .oy (oy [ 7]));
    isqrt_slice #(.m (m >>  8 * 2)) i08 (.ix (ix [ 8]), .iy (iy [ 8]), .ox (ox [ 8]), .oy (oy [ 8]));
    isqrt_slice #(.m (m >>  9 * 2)) i09 (.ix (ix [ 9]), .iy (iy [ 9]), .ox (ox [ 9]), .oy (oy [ 9]));
    isqrt_slice #(.m (m >> 10 * 2)) i10 (.ix (ix [10]), .iy (iy [10]), .ox (ox [10]), .oy (oy [10]));
    isqrt_slice #(.m (m >> 11 * 2)) i11 (.ix (ix [11]), .iy (iy [11]), .ox (ox [11]), .oy (oy [11]));
    isqrt_slice #(.m (m >> 12 * 2)) i12 (.ix (ix [12]), .iy (iy [12]), .ox (ox [12]), .oy (oy [12]));
    isqrt_slice #(.m (m >> 13 * 2)) i13 (.ix (ix [13]), .iy (iy [13]), .ox (ox [13]), .oy (oy [13]));
    isqrt_slice #(.m (m >> 14 * 2)) i14 (.ix (ix [14]), .iy (iy [14]), .ox (ox [14]), .oy (oy [14]));
    isqrt_slice #(.m (m >> 15 * 2)) i15 (.ix (ix [15]), .iy (iy [15]), .ox (ox [15]), .oy (oy [15]));

    assign ix [ 0] = x;
    assign ix [ 1] = ox [ 0];
    assign ix [ 2] = ox [ 1];
    assign ix [ 3] = ox [ 2];
    assign ix [ 4] = ox [ 3];
    assign ix [ 5] = ox [ 4];
    assign ix [ 6] = ox [ 5];
    assign ix [ 7] = ox [ 6];
    assign ix [ 8] = ox [ 7];
    assign ix [ 9] = ox [ 8];
    assign ix [10] = ox [ 9];
    assign ix [11] = ox [10];
    assign ix [12] = ox [11];
    assign ix [13] = ox [12];
    assign ix [14] = ox [13];
    assign ix [15] = ox [14];

    assign iy [ 0] = 0;
    assign iy [ 1] = oy [ 0];
    assign iy [ 2] = oy [ 1];
    assign iy [ 3] = oy [ 2];
    assign iy [ 4] = oy [ 3];
    assign iy [ 5] = oy [ 4];
    assign iy [ 6] = oy [ 5];
    assign iy [ 7] = oy [ 6];
    assign iy [ 8] = oy [ 7];
    assign iy [ 9] = oy [ 8];
    assign iy [10] = oy [ 9];
    assign iy [11] = oy [10];
    assign iy [12] = oy [11];
    assign iy [13] = oy [12];
    assign iy [14] = oy [13];
    assign iy [15] = oy [14];

    assign y       = oy [15];

endmodule
