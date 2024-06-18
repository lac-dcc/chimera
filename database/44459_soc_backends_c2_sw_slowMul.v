// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

// Non-pipelined multiplier
module slowMul(input clk,
               input         rst,
               input         req,
               
               input [31:0]  p0,
               input [31:0]  p1,
               output        ack,
               output [31:0] out);

    mul32x32_fsm S(.clk(clk),
                   .rst(rst),
                   .req(req),
                   .ack(ack),
                   .p0(p0),
                   .p1(p1),
                   .out(out));

endmodule
