module ripple_block_CLA
# (
    parameter GROUP_WIDTH = 4,
    parameter GROUP_COUNT = 2
)
(
    input                                      carry_in,
    input  [GROUP_COUNT * GROUP_WIDTH - 1 : 0] x,
    input  [GROUP_COUNT * GROUP_WIDTH - 1 : 0] y,
    output [GROUP_COUNT * GROUP_WIDTH - 1 : 0] z,
    output                                     carry_out
);
    wire [GROUP_COUNT : 0] carry;
    
    assign carry[0] = carry_in;
        
    generate
        
        genvar i;
        
        for (i = 0; i <= GROUP_COUNT - 1; i = i + 1)
        begin : stage
            carry_lookahead_adder #(.WIDTH(GROUP_WIDTH)) i_CLA
            (
                .carry_in (carry[i]                                      ),
                .x        (x[(i + 1) * GROUP_WIDTH - 1 : i * GROUP_WIDTH]),
                .y        (y[(i + 1) * GROUP_WIDTH - 1 : i * GROUP_WIDTH]),
                .z        (z[(i + 1) * GROUP_WIDTH - 1 : i * GROUP_WIDTH]),
                .carry_out(carry[i + 1]                                  )        
            );
        end
    endgenerate
    
    assign carry_out = carry[GROUP_COUNT];

endmodule
