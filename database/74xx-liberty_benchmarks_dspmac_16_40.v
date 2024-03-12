// DSP multiply-and-accumulate block without saturation
// Author: Niels A. Moseley

module dspmac_16_40(
    input clk, 
    input rst_n, 
    input [1:0] opcode,
    input signed [16-1:0] a_in, 
    input signed [16-1:0] b_in, 
    output signed [40-1:0] accu_out
    );

reg signed [40-1:0] accu;

parameter [1:0] OP_CLR = 2'b00,
                OP_MUL = 2'b01,
                OP_MAC = 2'b10,
                OP_NOP = 2'b11;    

always @(posedge clk or negedge rst_n)
begin
    if (rst_n == 1'b0)
        accu <= 40'd0;  // set accumulator to zero
    else
    begin
        case(opcode)
        OP_CLR:
            accu <= 0;
        OP_MUL:
            accu <= a_in*b_in;
        OP_MAC:
            accu <= accu+a_in*b_in;
        OP_NOP:
            accu <= accu;
        default:
            accu <= accu;
        endcase
    end
end

assign accu_out = accu;

endmodule
