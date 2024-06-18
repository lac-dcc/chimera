// This program was cloned from: https://github.com/kbob/icebreaker-candy
// License: GNU General Public License v3.0

`default_nettype none

// producer produces numbers 0..255.
// consumers checks numbers.
// WHen done, lights green or red LED

module top (input CLK, output LEDR_N, output LEDG_N);

    localparam SLOW_PRODUCER = 1;
    localparam SLOW_CONSUMER = 1;

    reg [22:0] counter = 0;
    reg reset = 1;

    always @(posedge CLK) begin
        if (counter[1])
            reset <= 0;
        counter <= counter + 1;
    end

    wire       alice_ready;
    wire       bob_ready;
    wire       bob_bad, bob_good;
    wire       fifo_is_empty;
    wire       fifo_is_full;
    wire [7:0] alice_data_out;
    wire [7:0] bob_data_in;

    assign LEDG_N = ~bob_good;
    assign LEDR_N = ~bob_bad;

    producer #(
            .SLOW(SLOW_PRODUCER)
        ) alice (
            .clk(CLK),
            .reset(reset),
            .enable(~fifo_is_full),
            .ready(alice_ready),
            .data_out(alice_data_out)
        );

    consumer #(
            .SLOW(SLOW_CONSUMER)
        ) bob (
            .clk(CLK),
            .reset(reset),
            .enable(~fifo_is_empty),
            .data_in(bob_data_in),
            .ready(bob_ready),
            .good(bob_good),
            .bad(bob_bad)
        );

    synchronous_fifo carol (
        .clk(CLK),
        .reset(reset),
        .enqueue_request(alice_ready),
        .dequeue_request(bob_ready),
        .data_in(alice_data_out),
        .is_empty(fifo_is_empty),
        .is_full(fifo_is_full),
        .data_out(bob_data_in)
    );

endmodule // top


module producer #(
        parameter    SLOW = 0
    ) (
        input        clk,
        input        reset,
        input        enable,
        output       ready,
        output [7:0] data_out
    );

    localparam START_VALUE = 8'h0;  // change to cause failure
    localparam STOP_VALUE  = 8'hFF;

    localparam S_READY     = 3'b001;
    localparam S_STALL     = 3'b010;
    localparam S_DONE      = 3'b100;

    function automatic [7:0] first_set(input [7:0] n);
        first_set = n & ~(n - 8'b1);
    endfunction

    function automatic [7:0] next_set(input [7:0] n, input [7:0] i);
        next_set = first_set(n & ~i);
    endfunction

    function automatic [7:0] set_next(input [7:0] n, input [7:0] i);
        set_next = i | next_set(n, i);
    endfunction

    reg [2:0] state;
    reg [7:0] data_r;
    reg [7:0] delay_r;

    always @(posedge clk)
        if (reset) begin
            state   <= S_READY;
            data_r  <= START_VALUE;
            if (SLOW)
                delay_r <= first_set(START_VALUE);
        end
        else case (state)

            S_READY: begin
                if (enable) begin
                    if (data_r == STOP_VALUE)
                        state <= S_DONE;
                    else begin
                        data_r <= data_r + 1;
                        if (SLOW) begin
                            delay_r <= first_set(data_r + 1);
                            if (first_set(data_r + 1) == data_r + 1)
                                state <= S_READY;
                            else
                                state <= S_STALL;
                        end
                        else
                            state <= S_READY;
                    end
                end
            end

            S_STALL: begin
                delay_r <= set_next(data_r, delay_r);
                if (set_next(data_r, delay_r) == data_r)
                    state <= S_READY;
                else
                    state <= S_STALL;
            end

        endcase

    assign ready    = state >> $clog2(S_READY);
    assign data_out = ready ? data_r : 0;

endmodule // producer


module consumer #(
        parameter   SLOW = 0
    ) (
        input       clk,
        input       reset,
        input       enable,
        input [7:0] data_in,
        output      ready,
        output      good,
        output      bad
    );

    localparam START_VALUE = 0;
    localparam STOP_VALUE  = 8'hFF;

    reg       good_r, bad_r;
    reg       ready_r;
    reg [7:0] expected_r;
    reg [7:0] delay_r;

    wire done = good_r || bad_r;

    always @(posedge clk)
        if (reset) begin
            good_r <= 0;
            bad_r <= 0;
            ready_r <= 1;
            expected_r <= START_VALUE;
            if (SLOW)
                delay_r <= 0;
        end
        else if (SLOW && delay_r != expected_r[2:0])
            delay_r <= delay_r + 1;
        else if (ready_r && enable && !done) begin
            bad_r <= data_in != expected_r;
            if (expected_r == STOP_VALUE)
                good_r <= data_in == STOP_VALUE;
            else begin
                expected_r <= expected_r + 1;
                delay_r <= 0;
            end
        end

    assign ready = !done && (SLOW ? delay_r == expected_r[2:0] : 1);
    assign good = good_r;
    assign bad = bad_r;

endmodule // consumer


module synchronous_fifo #(
        parameter    LENGTH = 4,   // power of 2
        parameter    WIDTH = 8
    ) (
        input         clk,
        input         reset,
        input         enqueue_request,
        input         dequeue_request,
        input  [WH:0] data_in,
        output        is_empty,
        output        is_full,
        output [WH:0] data_out
    );

    localparam FL = LENGTH - 1;
    localparam FB = $clog2(LENGTH);
    localparam WB = WIDTH;
    localparam FH = FB - 1;
    localparam WH = WB - 1;

    reg  [WH:0] fifo [0:FL];
    reg  [FB:0] nqi, dqi;    // enqueue index, dequeue index
    reg         is_empty_r, is_full_r;

    wire        is_empty_i = nqi == dqi;
    wire        is_full_i  = (nqi ^ dqi) == 1 << FB;
    wire        do_enqueue = enqueue_request && !is_full_i;
    wire        do_dequeue = dequeue_request && !is_empty_i;
    wire [FB:0] next_nqi   = nqi + do_enqueue;
    wire [FB:0] next_dqi   = dqi + do_dequeue;

    always @(posedge clk)
        if (reset) begin
            nqi <= 0;
            dqi <= 0;
            is_empty_r <= 1;
            is_full_r <= 0;
        end
        else begin
            if (do_enqueue)
                fifo[nqi[FH:0]] <= data_in;
            nqi <= next_nqi;
            dqi <= next_dqi;
            is_empty_r <= next_nqi == next_dqi;
            is_full_r  <= (next_nqi ^ next_dqi) == 1 << FB;
        end

    assign is_empty = is_empty_r;
    assign is_full  = is_full_r;
    assign data_out = fifo[dqi[FH:0]];

endmodule // synchronous_fifo


module XXsynchronous_fifo (
        input        clk,
        input        reset,
        input        enqueue_request,
        input        dequeue_request,
        input  [7:0] data_in,
        output       is_empty,
        output       is_full,
        output [7:0] data_out
    );

    reg [7:0] fifo [0:3];
    reg [2:0] nqi, dqi;    // enqueue index, dequeue index

    wire [7:0] f0 = fifo[0];
    wire [7:0] f1 = fifo[1];
    wire [7:0] f2 = fifo[2];
    wire [7:0] f3 = fifo[3];

    always @(posedge clk)
        if (reset) begin
            nqi <= 0;
            dqi <= 0;
        end
        else begin
            // if (enqueue_request && (nqi ^ dqi) != 3'b100) begin
            if (enqueue_request && !is_full) begin
                fifo[nqi[1:0]] <= data_in;
                nqi <= nqi + 1;
            end
            // if (dequeue_request && nqi != dqi)
            if (dequeue_request && !is_empty)
                dqi <= dqi + 1;
        end

    assign is_empty = nqi == dqi;
    assign is_full = (nqi ^ dqi) == 3'b100;
    assign data_out = fifo[dqi[1:0]];

endmodule // synchronous_fifo
