// This program was cloned from: https://github.com/pongsagon/tt07-tiniest-gpu
// License: Apache License 2.0

// Project F Library - Division: Signed Fixed-Point with Gaussian Rounding
// (C)2023 Will Green, Open source hardware released under the MIT License
// Learn more at https://projectf.io/verilog-lib/
//`timescale 1ns / 1ps

module div #(
    parameter WIDTH=32,  // width of numbers in bits (integer and fractional)
    parameter FBITS=16   // fractional bits within WIDTH
    ) (
    input clk,                  // clock
    input rst,                  // reset
    input start,                // start calculation
    output reg busy,            // calculation in progress
    output reg done,            // calculation is complete (high for one tick)
    output reg valid,           // result is valid
    output reg dbz,             // divide by zero
    output reg ovf,             // overflow
    input signed [WIDTH-1:0] a,   // dividend (numerator)
    input signed [WIDTH-1:0] b,   // divisor (denominator)
    output reg signed [WIDTH-1:0] val  // result value: quotient
    );

    localparam WIDTHU = WIDTH - 1;                 // unsigned widths are 1 bit narrower
    localparam FBITSW = (FBITS == 0) ? 1 : FBITS;  // avoid negative vector width when FBITS=0
    localparam SMALLEST = {1'b1, {WIDTHU{1'b0}}};  // smallest negative number

    localparam ITER = WIDTHU + FBITS;  // iteration count: unsigned input width + fractional bits
    reg [$clog2(ITER):0] i;          // iteration counter (allow ITER+1 iterations for rounding)

    reg a_sig, b_sig, sig_diff;      // signs of inputs and whether different
    reg [WIDTHU-1:0] au, bu;         // absolute version of inputs (unsigned)
    reg [WIDTHU-1:0] quo, quo_next;  // intermediate quotients (unsigned)
    reg [WIDTHU:0] acc, acc_next;    // accumulator (unsigned but 1 bit wider)

    // input signs
    always @(*) begin
        a_sig = a[WIDTH-1+:1];
        b_sig = b[WIDTH-1+:1];
    end

    // division algorithm iteration
    always @(*) begin
        if (acc >= {1'b0, bu}) begin
            acc_next = acc - bu;
            {acc_next, quo_next} = {acc_next[WIDTHU-1:0], quo, 1'b1};
        end else begin
            {acc_next, quo_next} = {acc, quo} << 1;
        end
    end

    // calculation state machine
    reg [2:0] state;
    localparam IDLE = 0;
    localparam INIT = 1;
    localparam CALC = 2;
    localparam ROUND = 3;
    localparam SIGN = 4;
    // enum cant syn to ASIC
    //enum {IDLE, INIT, CALC, ROUND, SIGN} state; 
    always @(posedge clk) begin
        done <= 0;
        case (state)
            INIT: begin
                state <= CALC;
                ovf <= 0;
                i <= 0;
                {acc, quo} <= {{WIDTHU{1'b0}}, au, 1'b0};  // initialize calculation
            end
            CALC: begin
                if (i == WIDTHU-1 && quo_next[WIDTHU-1:WIDTHU-FBITSW] != 0) begin  // overflow
                    state <= IDLE;
                    busy <= 0;
                    done <= 1;
                    ovf <= 1;
                end else begin
                    if (i == ITER-1) state <= ROUND;  // calculation complete after next iteration
                    i <= i + 1;
                    acc <= acc_next;
                    quo <= quo_next;
                end
            end
            ROUND: begin  // Gaussian rounding
                state <= SIGN;
                if (quo_next[0] == 1'b1) begin  // next digit is 1, so consider rounding
                    // round up if quotient is odd or remainder is non-zero
                    if (quo[0] == 1'b1 || acc_next[WIDTHU:1] != 0) quo <= quo + 1;
                end
            end
            SIGN: begin  // adjust quotient sign if non-zero and input signs differ
                state <= IDLE;
                if (quo != 0) val <= (sig_diff) ? {1'b1, -quo} : {1'b0, quo};
                busy <= 0;
                done <= 1;
                valid <= 1;
            end
            default: begin  // IDLE
                if (start) begin
                    valid <= 0;
                    val <= 0;
                    if (b == 0) begin  // divide by zero
                        state <= IDLE;
                        busy <= 0;
                        done <= 1;
                        dbz <= 1;
                        ovf <= 0;
                    end else if (a == SMALLEST || b == SMALLEST) begin  // overflow
                        state <= IDLE;
                        busy <= 0;
                        done <= 1;
                        dbz <= 0;
                        ovf <= 1;
                    end else begin
                        state <= INIT;
                        au <= (a_sig) ? -a[WIDTHU-1:0] : a[WIDTHU-1:0];  // register abs(a)
                        bu <= (b_sig) ? -b[WIDTHU-1:0] : b[WIDTHU-1:0];  // register abs(b)
                        sig_diff <= (a_sig ^ b_sig);  // register input sign difference
                        busy <= 1;
                        dbz <= 0;
                        ovf <= 0;
                    end
                end
            end
        endcase
        if (rst) begin
            state <= IDLE;
            busy <= 0;
            done <= 0;
            valid <= 0;
            dbz <= 0;
            ovf <= 0;
            val <= 0;
        end
    end
endmodule
