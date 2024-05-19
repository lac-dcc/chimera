// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

module carry_lookahead_generator
# (
    parameter WIDTH = 8
)
(
    input                  carry_in,
    input  [WIDTH - 1 : 0] generate_in, propagate_in,
    output [WIDTH     : 0] carry
);
   
    assign carry[0] = carry_in;
    
    generate
        
        genvar i;
        
        for (i = 0; i <= WIDTH - 1; i = i + 1)
        begin : stage
            assign carry[i + 1] = generate_in[i] | propagate_in[i] & carry[i];
        end
    endgenerate

endmodule