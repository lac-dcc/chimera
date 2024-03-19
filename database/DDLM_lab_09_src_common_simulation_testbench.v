/*
 * Digital Design Lab Manual
 * Lab #9
 *
 * Copyright(c) 2017 Stanislav Zhelnio 
 *
 */
 
`timescale 1 ns / 100 ps

module testbench;

    // simulation options
    parameter Tt     = 20;
    parameter Cycles = 4000;

    // global signals
    reg         clk;
    reg         rst_n;

    // SPI bus
    wire        cs;
    wire        sck;
    wire        sdo;

    // sensor value
    wire  [7:0] value;

    // DUT start
    pmod_als als
    (
        .clk    ( clk   ),
        .rst_n  ( rst_n ),
        .cs     ( cs    ),
        .sck    ( sck   ),
        .sdo    ( sdo   ),
        .value  ( value )
    );
    // DUT end

    // peripheral device stub
    pmod_als_stub stub
    (
        .cs     ( cs    ),
        .sck    ( sck   ),
        .sdo    ( sdo   )
    );

    // simulation init - clock
    initial begin
        clk = 0;
        forever clk = #(Tt/2) ~clk;
    end

    // simulation init - reset
    initial begin
        rst_n   = 0;
        repeat (4)  @(posedge clk);
        rst_n   = 1;
    end

    // simulation duration
    initial begin
        repeat (Cycles)  @(posedge clk);
        $display ("Timeout");
        $stop;
    end

    // simulation output
    initial 
        $monitor("value=%h", value);

    initial 
        $dumpvars;

endmodule
