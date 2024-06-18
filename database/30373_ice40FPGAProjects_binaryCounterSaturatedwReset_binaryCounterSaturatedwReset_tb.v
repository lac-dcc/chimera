// This program was cloned from: https://github.com/jasonkaufmann/ice40FPGAProjects
// License: MIT License

//------------------------------------------------------------------
//-- Hello world example for the iCE40-HX8K board
//-- 8 bit binary counter
//------------------------------------------------------------------

`timescale 1s/100ns

module binaryCounterSaturatedwReset_tb ();

    //leds outputs
    wire [7:0] leds;

    reg clk = 0;
    reg rst_btn = 1;

    localparam DURATION = 8; // this is 5 seconds
    
    always begin
        #0.0001 //that's 1s/(10kHz)
        clk = ~clk;
    end

    //leds make the saturated binary counter
    binaryCounter #(.MAX_COUNT(100)) uut  (
        .leds(leds),
        .rst(rst_btn),
        .clk(clk)
    );

    initial begin
        #1 //wait a sec
        rst_btn = 0;
        #2 //wait 5 seconds
        rst_btn = 1;
        #4 //wait 4 seconds
        rst_btn = 0;
    end

    //run the simulation
    initial begin
        $dumpfile("binaryCounterSaturatedwReset_tb.vcd");
        $dumpvars(0, binaryCounterSaturatedwReset_tb); //the zero means we wanna see all the variables no matter the depth

        #(DURATION)

        $display("Finished!");
        $finish;
    end
endmodule