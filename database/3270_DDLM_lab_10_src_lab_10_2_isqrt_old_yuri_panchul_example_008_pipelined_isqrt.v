// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

// pipelined with configurable number of stages

module isqrt
(
    input         clock,
    input         reset_n,
    input  [31:0] x,
    output [15:0] y
);

    parameter n_pipe_stages = 16;

    localparam n_slices           = 16;
    localparam n_slices_per_stage = n_slices / n_pipe_stages;

    localparam [31:0] m = 32'h4000_0000;

    wire [31:0] ix [0:15], iy [0:15];
    wire [31:0] ox [0:15], oy [0:15];

    generate
        genvar i;

        for (i = 0; i < 16; i = i + 1)
        begin : u
            if (i % n_slices_per_stage != n_slices_per_stage - 1)
            begin
                isqrt_slice_comb #(.m (m >> i * 2)) inst
                (
                    .ix      ( ix [i]  ),
                    .iy      ( iy [i]  ),
                    .ox      ( ox [i]  ),
                    .oy      ( oy [i]  )
                );
            end
            else
            begin
                isqrt_slice_reg #(.m (m >> i * 2)) inst
                (
                    .clock   ( clock   ),
                    .reset_n ( reset_n ),
                    .ix      ( ix [i]  ),
                    .iy      ( iy [i]  ),
                    .ox      ( ox [i]  ),
                    .oy      ( oy [i]  )
                );
            end
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
