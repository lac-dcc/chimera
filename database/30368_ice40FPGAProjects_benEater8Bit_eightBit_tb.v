// This program was cloned from: https://github.com/jasonkaufmann/ice40FPGAProjects
// License: MIT License

`timescale 1s/100ns

module eightBit_tb();

    reg clk = 1;
    reg pushClk = 0;
    reg clockChooser = 1;
    reg rst = 0;

    localparam DURATION = 1; // this is 1 second
    
    always begin
        #0.0001 //that's 1s/(10kHz)
        clk = ~clk;
    end

    //make CPU 
    eightBit uut  (
        .fastClk(clk),
        .pushButttonClock(pushClk), 
        .clockChooser(clockChooser),
        .rst(rst)
    );

    initial begin
        rst = 0;
        #0.0001
        rst = 1;
        #0.0001
        rst = 0;
    end

    //run the simulation
    initial begin
        $dumpfile("eightBit_tb.vcd");
        $dumpvars(0, eightBit_tb); //the zero means we wanna see all the variables no matter the depth

        #(DURATION)

        $display("Finished!");
        $finish;
    end
endmodule