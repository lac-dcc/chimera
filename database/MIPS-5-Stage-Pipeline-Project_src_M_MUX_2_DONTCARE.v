// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_MUX_2_DONTCARE #(
    parameter WIDTH = 32
)(  input [WIDTH-1:0] d0, d1,
    input s,
    output reg[WIDTH-1:0] y);

    always @(*)begin
        case(s)
            1'b0 : y<=d0;
            1'bx : y<=d0;
            1'b1 : y<=d1;
        endcase
    end

endmodule