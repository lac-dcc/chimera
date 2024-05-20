// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module maxnet_tb();

  reg clk,reset;

    reg start;

    wire ready;

    Maxnet maxnet (
        .clk(clk),
        .rst(reset),
        .start(start),
        .ready(ready)
    );


    initial
    begin
        reset = 1;
        start = 0;
        #10 reset = 0;
        #10 start = 1;
        #10 start = 0;
        #200 start = 1;
        #10 start = 0;
        #3000 $stop;
        
    end

    initial
    begin
        clk = 0;
        forever
        begin
            #5 clk = ~clk;
        end
    end

endmodule
