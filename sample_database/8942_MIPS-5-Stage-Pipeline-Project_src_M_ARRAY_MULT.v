// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

// `include "M_ADDER.v"

module M_ARRAY_MULT #(
    parameter N = 3
) (
    input[N-1:0] a, b,
    output[2*N-1:0] product
);
    wire[N*N-1:0] w_partial_prod;
    wire[N-1:0] w_partial_carry;
    genvar g_i;
    generate
        assign w_partial_carry[0] = 0;
        assign w_partial_prod[N-1:0] = a&{N{b[0]}};
        for(g_i=1; g_i<N; g_i=g_i+1) begin: L_G_PARTIAL_PROD
            M_ADDER #(.N(N)) fa_i(
                .a(a&{N{b[g_i]}}), 
                .b({w_partial_carry[g_i-1],w_partial_prod[N*g_i-1:N*(g_i-1)+1]}),
                .sum(w_partial_prod[N*(g_i+1)-1:N*g_i]),
                .carry(w_partial_carry[g_i]));
            assign product[g_i-1] = w_partial_prod[N*(g_i-1)];
        end    
        assign product[2*N-1:N-1] = {w_partial_carry[N-1],w_partial_prod[N*N-1:N*(N-1)]};
    endgenerate
endmodule




