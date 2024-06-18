// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _mov_v_
`define _mov_v_

// logic circuit for mov
// opcode: 8'b00000001
// MOV X/Y/MAR/MDR, in_s
// in_s = X/Y/MAR/MDR
module mov(
    input [15:0] instruction,
    input [15:0] X,
    input [15:0] Y,
    input [15:0] MAR,
    input [15:0] MDR,

    output reg [15:0] Xout,
    output reg [15:0] Yout,
    output reg [15:0] MARout,
    output reg [15:0] MDRout
);

reg [15:0] in_s;
always @* begin
    case (instruction[3:0])
        4'b0001: in_s = MDR;
        4'b0010: in_s = MAR;
        4'b0100: in_s = Y;
        4'b1000: in_s = X;
        default: in_s = 16'b0;
    endcase
end

always @* begin
    if (instruction[15:8] == OP_MOVE) begin
        MDRout = MDR;
        MARout = MAR;
        Yout = Y;
        Xout = X;

        case (instruction[7:4])
            4'b0001: MDRout = in_s;
            4'b0010: MARout = in_s;
            4'b0100: Yout = in_s;
            4'b1000: Xout = in_s;
            default: begin
            end
        endcase
    end else begin
        Xout = X;
        Yout = Y;
        MARout = MAR;
        MDRout = MDR;
    end
end 

endmodule

`endif 