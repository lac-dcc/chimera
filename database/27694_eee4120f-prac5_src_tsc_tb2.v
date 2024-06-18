// This program was cloned from: https://github.com/nkosinathintuli/eee4120f-prac5
// License: MIT License

`timescale 1ns / 1ps

module tsc_tb2;

    // TSC inputs
    reg reset;
    reg start;
    reg clk;
    reg sbf;
    
    // ADC outputs
    wire [7:0] adc_data;
    wire adc_rdy;
    
    // TSC outputs
    wire req;
    wire trd;
    wire cd;
    wire [31:0] trigtm;
    wire sd;

    // Instantiate the TSC module
    TSC tsc_inst (
        .reset(reset),
        .start(start),
        .clk(clk),
        .adc_data(adc_data),
        .adc_rdy(adc_rdy),
        .sbf(sbf),
        .req(req),
        .trd(trd),
        .cd(cd),
        .trigtm(trigtm),
        .sd(sd)
    );

    // Instantiate the ADC module
    ADC adc_inst (
        .req(req),
        .rst(reset),
        .rdy(adc_rdy),
        .dat(adc_data)
    );

    // Clock generation
    always #5 clk = ~clk;
    integer i;

    initial begin
    reset = 1;
    clk = 0;
    //$display("SD value: %d",sd);
    #5
    reset = 0;
    start = 1;
    sbf = 1;
    #5
    start = 0;
    // If SBF goes HIGH when TRD is LOW, SD must be unset/null.
    // TRD should be updated 16 cycles after a trigger was detected.
    // TRIGTM is updated after Data Recieved is 0xd0=(208) > 0xc8(200) and
    // It should correspond to the cycle no. 
    // If the clock signal stops the TSC module should stop operating and
    // if the clock signal restarts the module should continue operating from the last stop.
    for(i=0; i<60; i=i+1) begin
        
        $display("\nCycle No.%3d| DAT: %h, TRD: %d, SD: %d, TRIGTM: %1d",i,adc_data, trd, sd, trigtm);
        #10
        sbf = 1;
        if(i>40 && i<50) begin
            if (i == 41) begin 
                $display("\n|Stoping the Clock| \n");
            end
            clk = 1'bX; // This stops clock  
        end
        else if (i>50) begin
            if (i==51) begin
                $display("\n|Restarting the Clock|\n");
            end
            clk = 0;
        end
    end

    $finish;
    end   
    initial begin
        $dumpfile("dump2.vcd");
        $dumpvars; 
    end 
endmodule