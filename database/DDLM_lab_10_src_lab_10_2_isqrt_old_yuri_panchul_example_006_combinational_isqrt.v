// combinational structured

module isqrt
(
    input  [31:0] x,
    output [15:0] y
);

    localparam [31:0] m = 32'h4000_0000;

    wire [31:0] ix [0:15], iy [0:15];
    wire [31:0] ox [0:15], oy [0:15];

    generate
        genvar i;

        for (i = 0; i < 16; i = i + 1)
        begin : u
            isqrt_slice #(.m (m >> i * 2)) inst
            (
                .ix (ix [i]),
                .iy (iy [i]),
                .ox (ox [i]),
                .oy (oy [i])
            );
        end

        for (i = 1; i < 16; i = i + 1)
        begin : v
            assign ix [i] = ox [i - 1];
            assign iy [i] = oy [i - 1];
        end

    endgenerate


    assign ix [0] = x;
    assign iy [0] = 0;

    assign y = oy [15];

endmodule
