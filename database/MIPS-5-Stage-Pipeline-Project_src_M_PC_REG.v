// This program was cloned from: https://github.com/the-pinbo/MIPS-5-Stage-Pipeline-Project
// License: MIT License

module M_PC_REG #(
    parameter WIDTH = 8
)(
    input stallF,
    input clk, reset,
    input[WIDTH-1:0] d,
    output reg[WIDTH-1:0] q);

    always@(posedge clk, posedge reset)
    if (reset) 
        q <= 0;
    else begin
        case(stallF)
            1'b0 : q<=d;
            1'bx : q<=d;
        endcase
    end

endmodule