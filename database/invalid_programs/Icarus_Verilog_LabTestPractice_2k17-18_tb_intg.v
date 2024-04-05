`include "intg.v"
`timescale 1ms/1ns
module tb_intg();

    initial begin
        $dumpfile("tb_intg.vcd");
        $dumpvars;
    end

    reg clear, clock;
    wire wf;

    intg mod(.wf(wf), .clear(clear), .clock(clock));

    initial 
        clock = 1'b0;
    always
        #0.5 clock = ~clock;
    
    initial begin
            clear = 1'b1;
        #1  clear = 1'b0;
        #1000 $finish;
    end

    // initial 
    //     $monitor("Main := clock = %b, clear = %b, wf = %b \n Cntr3bit := clock = %b, q = %d \n Cntr4bit := clock = %b, q = %d \n MuxLarge := input = %b, sel = %d, output = %b\n\n",clock, clear, wf, mod.cnt3bit.clock, mod.cnt3bit.q,mod.cnt4bit.clock, mod.cnt4bit.q,mod.mux.inp,mod.mux.sel, mod.mux.outp);

endmodule