module two_level_CLA
# (
    parameter WIDTH_0 = 2,
    parameter WIDTH_1 = 2,
    parameter GROUP_COUNT = 2
)
(
    input                                             carry_in,
    input  [GROUP_COUNT * WIDTH_1 * WIDTH_0 - 1 : 0 ] x,
    input  [GROUP_COUNT * WIDTH_1 * WIDTH_0 - 1 : 0 ] y,
    output [GROUP_COUNT * WIDTH_1 * WIDTH_0 - 1 : 0 ] z,
    output                                            carry_out
);
    wire [GROUP_COUNT * WIDTH_1 - 1 : 0] p_temp, g_temp;
    wire [GROUP_COUNT * WIDTH_1 : 0]     c_temp;

    
    assign c_temp[0] = carry_in;
        
    generate
        
        genvar i;
        genvar j;
        
        for (i = 0; i <= GROUP_COUNT * WIDTH_1 - 1; i = i + 1)
        begin : stage
            carry_lookahead_adder #(.WIDTH(WIDTH_0)) i_CLA
            (
                .carry_in       (c_temp[i]                             ),
                .x              (x[(i + 1) * WIDTH_0 - 1 : i * WIDTH_0]),
                .y              (y[(i + 1) * WIDTH_0 - 1 : i * WIDTH_0]),
                .z              (z[(i + 1) * WIDTH_0 - 1 : i * WIDTH_0]),
                .group_propagate(p_temp[i]                             ),
                .group_generate (g_temp[i]                             ),
                .carry_out      ()
            );
        end
        
        for (j = 0; j <= GROUP_COUNT - 1; j = j + 1)
        begin : clg_stage
            carry_lookahead_generator #(.WIDTH(WIDTH_1)) i_CLG
            (
                .carry_in       (c_temp[WIDTH_1 * j]                        ),
                .generate_in    (g_temp[WIDTH_1 * (j + 1) - 1 : WIDTH_1 * j]),
                .propagate_in   (p_temp[WIDTH_1 * (j + 1) - 1 : WIDTH_1 * j]),
                .carry          (c_temp[WIDTH_1 * (j + 1) : WIDTH_1 * j + 1]),
                .group_propagate(),
                .group_generate ()        
            );
        end
    endgenerate
    
    assign carry_out = c_temp[GROUP_COUNT * WIDTH_1];

endmodule
