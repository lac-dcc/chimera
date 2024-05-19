// This program was cloned from: https://github.com/asicsforthemasses/LunaPnR
// License: GNU General Public License v3.0

(* techmap_celltype = "$alu" *)
module tsmc018_alu (A, B, CI, BI, X, Y, CO);
parameter A_SIGNED = 0;
parameter B_SIGNED = 0;
parameter A_WIDTH = 1;
parameter B_WIDTH = 1;
parameter Y_WIDTH = 1;

input [A_WIDTH-1:0] A;      // Input operand
input [B_WIDTH-1:0] B;      // Input operand
output [Y_WIDTH-1:0] X;     // A xor B (sign-extended, optional B inversion,
                            //          used in combination with
                            //          reduction-AND for $eq/$ne ops)
output [Y_WIDTH-1:0] Y;     // Sum

input CI;                   // Carry-in (set for $sub)
input BI;                   // Invert-B (set for $sub)
output [Y_WIDTH-1:0] CO;    // Carry-out

wire [Y_WIDTH-1:0] AA, BB;

    generate
        if (A_SIGNED && B_SIGNED) begin:BLOCK1
            assign AA = $signed(A), BB = BI ? ~$signed(B) : $signed(B);
        end else begin:BLOCK2
            assign AA = $unsigned(A), BB = BI ? ~$unsigned(B) : $unsigned(B);
        end
    endgenerate

    genvar i;
    generate
        FAX1 adder (
            .A(AA[0]), 
            .B(BB[0]), 
            .C(CI), 
            .YC(CO[0]), 
            .YS(Y[0]));

        for (i = 1; i < Y_WIDTH; i = i+1) begin:BLOCK2
            FAX1 adder(
                .A(AA[i]), 
                .B(BB[i]), 
                .C(CO[i-1]), 
                .YC(CO[i]), 
                .YS(Y[i]));
        end
    endgenerate

endmodule