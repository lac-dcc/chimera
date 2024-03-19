module ripple_carry_adder
# (
    parameter WIDTH = 8
)
(
    input                  carry_in,
    input  [WIDTH - 1 : 0] x,
    input  [WIDTH - 1 : 0] y,
    output [WIDTH - 1 : 0] z,
    output                 carry_out
);
    wire [WIDTH : 0] carry;
    
    assign carry[0] = carry_in; 
    
    generate
    
        genvar i;
    
        for (i = 0; i <= WIDTH - 1; i = i + 1)
        begin : stage
            full_adder FA
            (
                .x		   (x    [i]    ),
                .y         (y    [i]    ),
                .z         (z    [i]    ),
                .carry_in  (carry[i]    ),
                .carry_out (carry[i + 1])
            );
        end
    endgenerate
    
    assign carry_out = carry[WIDTH];

endmodule
