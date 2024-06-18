// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_MUX_3_DONTCARE(
    input[31:0] d0, d1, d2,
    input[1:0] s,
    output reg[31:0] y);

    always@(*)
    begin
        case(s)
            2'bxx : y<=d0;
            2'b00 : y<=d0;
            2'b01 : y<=d1;
            2'b10 : y<=d2;
        endcase
    end

endmodule