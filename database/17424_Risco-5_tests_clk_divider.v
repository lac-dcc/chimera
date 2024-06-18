// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module clk_divider_tb ();

parameter COUNTER_BITS = 32;
parameter PULSE_BITS = 32;

wire clk_o;
reg option, out_enable, clk, reset, write_pulse;
reg [COUNTER_BITS - 1 : 0] divider;
reg [PULSE_BITS - 1 : 0] pulse;

initial begin
    $dumpfile("build/clk_divider.vcd");
    $dumpvars;

    clk = 0;
    reset = 0;
    option = 1'b0;
    out_enable = 1'b1;
    pulse = 32'd0;
    divider = 32'd0;
    write_pulse = 1'b0;

    #2
    reset = 1'b1;
    #2
    reset = 1'b0;

    #2
    
    out_enable = 1'b0;

    #2

    out_enable = 1'b1;

    #2

    pulse = 32'd8;

    #16

    write_pulse = 1'b1;

    #2

    write_pulse = 1'b0;

    #2


    #40

    $finish;
end

always #1 clk = ~clk;

ClkDivider #(
    .COUNTER_BITS(COUNTER_BITS),
    .PULSE_BITS(PULSE_BITS)
) ClkDivider(
    .clk(clk),
    .reset(reset),
    .option(option),
    .write_pulse(write_pulse),
    .out_enable(out_enable),
    .divider(divider),
    .pulse(pulse),
    .clk_o(clk_o)
);
    
endmodule