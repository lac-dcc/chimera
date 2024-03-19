`include "mealy.v"
module tb_mealy();
    
    initial begin
        $dumpfile("tb_mealy.vcd");
        $dumpvars;
    end

    reg clock;
    wire outp;
    reg inp, reset;

    initial 
        clock = 1'b1;

    always
        #5 clock = ~clock;

    mealy m1(.reset(reset), .clock(clock), .inp(inp), .outp(outp));

    initial begin

            reset <= 1'b1;
            inp <= 1'b0;
        #10  reset <= 1'b0;
        #10 inp <= 1'b1; 
        #10 inp <= 1'b1;
        #10 inp <= 1'b0;  
        #10 inp <= 1'b0;
        #10 $finish;
    end

endmodule