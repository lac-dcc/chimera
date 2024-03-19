`ifndef COUNTER_3BIT
`define COUNTER_3BIT
`include "tff.v"
    module counter_3bit(
        output [2:0] q,
        input clock,
        input clear
    );

    reg [2:0] q;
    wire inpff1, inpff3;
    wire [2:0] outpff;
    assign inpff1 = 1'b1;
    and( inpff3, outpff[1], outpff[0]);

    tff ff1(.q(outpff[0]), .t(inpff1), .clock(clock), .clear(clear));
    tff ff2(.q(outpff[1]), .t(outpff[0]), .clock(clock), .clear(clear));
    tff ff3(.q(outpff[2]), .t(inpff3), .clock(clock), .clear(clear));

    always @(posedge clock or clear) begin

        if(clear)
            q = 4'b0;
        else
            q = outpff;

    end

    endmodule
`endif
