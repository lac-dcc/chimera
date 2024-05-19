// This program was cloned from: https://github.com/chsasank/ARM7
// License: MIT License

module test;

reg clk;
DeepPipeline arm(clk);

initial
 begin
 	clk = 1;
    $dumpfile("test.vcd");
    $dumpvars(0,test);

    #1 clk = ~clk;

    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;

    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;

    #1 clk = ~clk;
    #1 clk = ~clk;
    
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;
    #1 clk = ~clk;

    #1 clk = ~clk;

#1 clk = ~clk;


#1 clk = ~clk;

#1 clk = ~clk;


#1 clk = ~clk;

#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;
#1 clk = ~clk;






 end

endmodule