// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module soc_tb();

reg clk, reset;
wire rx, tx;
wire [7:0] led;

always #1 clk = ~clk;

Risco_5_SOC #(
    .CLOCK_FREQ(25000000),
    .BIT_RATE(115200),
    .MEMORY_SIZE(8192),
    .MEMORY_FILE("software/memory/generic.hex")
) SOC(
    .clk(clk),
    .reset(reset),
    .leds(led),
    .rx(rx),
    .tx(tx)
);

initial begin
    $dumpfile("build/soc.vcd");
    $dumpvars;

    clk = 1'b0;
    reset = 1'b1;
    #6
    reset = 1'b0;
    //#560

    #3600

    $finish;
end

endmodule
