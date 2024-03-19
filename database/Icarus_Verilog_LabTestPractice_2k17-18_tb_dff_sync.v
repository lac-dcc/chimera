`include "dff_async_clear.v"
module tb_dff_sync();

    reg clock, d, clear;
    wire q;

    dff_async_clear dff(.q(q), .d(d), .clear(clear), .clock(clock));

    initial begin
        $dumpfile("tb_dff.vcd");
        $dumpvars;
    end

    initial
        clock = 1'b0;

    always
    #5  clock = ~clock;

    initial begin
    
         d = 1'b0;
         clear = 1'b1;
    #10  d = 1'b1;
    #10  d = 1'b0;
    #10  clear = 1'b0;
    #10  d = 1'b1;
    #10  d = 1'b0;
    #10  $finish;
    end

endmodule
