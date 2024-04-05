`ifndef COUTNER_4BIT
`define COUNTER_4BIT
`include "tff.v"
    module counter_4bit(
        output [3:0] q,
        input clock,
        input clear
    );

        reg [3:0]q;
        initial 
            q = 4'b0;

        wire inpff1, inpff3, inpff4;
        wire [3:0] outpff;
        assign inpff1 = 1'b1;
        and( inpff3, outpff[1], outpff[0]);
        and( inpff4, outpff[2], inpff3);
        
        tff ff1(.q(outpff[0]), .t(inpff1), .clock(clock), .clear(clear));
        tff ff2(.q(outpff[1]), .t(outpff[0]), .clock(clock), .clear(clear));
        tff ff3(.q(outpff[2]), .t(inpff3), .clock(clock), .clear(clear));
        tff ff4(.q(outpff[3]), .t(inpff4), .clock(clock), .clear(clear));

        always @(posedge clock or clear) begin

            if(clear)
                q = 4'b0;
            else
                q = outpff;

        end

    endmodule
`endif
