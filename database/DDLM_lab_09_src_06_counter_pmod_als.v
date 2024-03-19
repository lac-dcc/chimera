/*
 * Digital Design Lab Manual
 * Lab #9
 *
 * Copyright(c) 2017 Stanislav Zhelnio 
 *
 */
 
module pmod_als
#(
    parameter CNTSIZE = 11
)
(
    input             clk,
    input             rst_n,
    output            cs,
    output            sck,
    input             sdo,
    output      [7:0] value
);
    wire [ CNTSIZE - 1:0] cnt;
    wire [ CNTSIZE - 1:0] cntNext = cnt + 1;
    register #(.SIZE(CNTSIZE)) r_counter(clk, rst_n, cntNext, cnt);

    assign sck = cnt [3];
    assign cs  = ~(cnt[CNTSIZE - 1:8] == { (CNTSIZE - 8) { 1'b1 }});

    wire sampleBit = ( cs == 1'b0 && cnt [3:0] == 4'b1000     );
    wire valueDone = ( cs == 1'b0 && cnt [7:0] == 8'b10101001 );

    wire [7:0] shift;
    wire [7:0] shiftNext = (shift << 1) | sdo;
    register_we #(.SIZE(8)) r_shift(clk, rst_n, sampleBit, shiftNext, shift);

    wire [7:0] valueNext = shift;
    register_we #(.SIZE(8))  r_value(clk, rst_n, valueDone, valueNext, value);

endmodule
