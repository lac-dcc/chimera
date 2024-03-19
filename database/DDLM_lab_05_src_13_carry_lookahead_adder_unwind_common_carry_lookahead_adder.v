module carry_lookahead_adder
# (
    parameter WIDTH = 8
)
(
    input                  carry_in,
    input  [WIDTH - 1 : 0] x,
    input  [WIDTH - 1 : 0] y,
    output [WIDTH - 1 : 0] z,
    output                 carry_out,
    output                 group_generate,
    output                 group_propagate
);
    wire [WIDTH : 0] carry;
    wire [WIDTH - 1 : 0] generate_wire, propagate_wire; 
    
    assign carry[0] = carry_in; 
    
    carry_lookahead_generator #(.WIDTH(WIDTH)) i_CLG
    (
        .carry_in       (carry_in        ),
        .generate_in    (generate_wire   ),
        .propagate_in   (propagate_wire  ),
        .carry          (carry[WIDTH : 1]),
        .group_generate (group_generate  ),
        .group_propagate(group_propagate )        
    );
    
    generate
        
        genvar i;
        
        for (i = 0; i <= WIDTH - 1; i = i + 1)
        begin : stage
            //Create generate and propagate signals
            assign generate_wire [i] = x[i] & y[i];
            assign propagate_wire[i] = x[i] ^ y[i];
            //Calculate sum (z bus)
            assign z[i] = carry[i] ^ propagate_wire[i];
        end
    endgenerate
    
    assign carry_out = carry[WIDTH];

endmodule
