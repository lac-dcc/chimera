// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module tristate_buffer
#(
    parameter WIDTH = 8,
    parameter PRIMITIVES = 0
)
(
    input [WIDTH-1:0] a,
    input g,
    output reg [WIDTH-1:0] q
);

generate
    if(!PRIMITIVES)
        always @*
            q <= g ? a : {WIDTH{1'bz}};
    else
        for (genvar i = 0; i < WIDTH; i = i + 1)
        begin: tri_buf_gen
            bufif1 bufif (
                .q(q[i]),
                .i(a[i]),
                .en(g)
            );
        end
endgenerate

endmodule