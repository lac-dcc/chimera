// This program was cloned from: https://github.com/matahho/Computer-Architecture-Lab
// License: MIT License

module ConditionCheck(
    input [3:0] cond,
    input [3:0] status,
    output reg result
);
    wire n, z, c, v;
    assign {n, z, c, v} = status;

    always @(cond, n, z, c, v) begin
        result = 1'b0;
        case (cond)
            4'b0000: result = z;             // EQ
            4'b0001: result = ~z;            // NE
            4'b0010: result = c;             // CS/HS
            4'b0011: result = ~c;            // CC/LO
            4'b0100: result = n;             // MI
            4'b0101: result = ~n;            // PL
            4'b0110: result = v;             // VS
            4'b0111: result = ~v;            // VC
            4'b1000: result = c & ~z;        // HI
            4'b1001: result = ~c | z;        // LS
            4'b1010: result = (n == v);      // GE
            4'b1011: result = (n != v);      // LT
            4'b1100: result = ~z & (n == v); // GT
            4'b1101: result = z & (n != v);  // LE
            4'b1110: result = 1'b1;          // AL
            default: result = 1'b0;
        endcase
    end
endmodule
