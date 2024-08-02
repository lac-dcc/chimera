// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

///////// CARRY CHAIN /////////

/* verilator lint_off DECLFILENAME */
/* verilator lint_off UNOPTFLAT */
module carry_chain_single (
        input P, 
        input G, 
        input Ci,
        output Co, 
        output S
    );

    assign Co = P ? Ci : G;
    assign S  = P ^ Ci;
endmodule

module carry_chain #(
        parameter INPUTS=4
    ) (
        input  [INPUTS-1:0] P,
        input  [INPUTS-1:0] G,
        output [INPUTS-1:0] S,
        input  Ci,
        output Co
    );

    wire [INPUTS:0] C;
    assign C[0] = Ci;
    assign Co = C[INPUTS];

    generate 
        genvar i;
        for (i = 0; i < INPUTS; i=i+1) begin
            carry_chain_single cc1 (
                .P(P[i]),
                .G(G[i]),
                .S(S[i]),
                .Ci(C[i]),
                .Co(C[i+1])
            );
        end
    endgenerate
endmodule

/* lint_on */
