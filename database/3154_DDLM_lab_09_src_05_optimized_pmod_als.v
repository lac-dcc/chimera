// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

/*
 * Digital Design Lab Manual
 * Lab #9
 *
 * Copyright(c) 2017 Stanislav Zhelnio 
 *
 */
 
module pmod_als
#(
    parameter QUERY_DELAY = 40
)
(
    input             clk,
    input             rst_n,
    output            cs,
    output            sck,
    input             sdo,
    output      [7:0] value
);

    localparam  S_IDLE       = 0,
                S_PREFIX     = 1,
                S_DATA       = 2,
                S_POSTFIX    = 3;

    localparam  IDLE_SIZE    = QUERY_DELAY,
                PREFIX_SIZE  = 2,
                DATA_SIZE    = 7,
                POSTFIX_SIZE = 4;

    // sck clock divider
    wire sck_edge;
    sck_clk_divider scd
    (
        .clk        ( clk      ),
        .rst_n      ( rst_n    ),
        .sck        ( sck      ),
        .sck_edge   ( sck_edge )
    );

    // State hold registers
    wire [1:0] State;
    reg  [1:0] Next;
    register_we #(.SIZE(2)) r_state(clk, rst_n, sck_edge, Next, State);

    wire [23:0] cnt;
    reg  [23:0] cntNext;
    register_we #(.SIZE(24)) r_cnt(clk, rst_n, sck_edge, cntNext, cnt);

    wire [7:0] buffer;
    reg  [7:0] bufferNext;
    register_we #(.SIZE(8)) r_buffer(clk, rst_n, sck_edge, bufferNext, buffer);

    reg  [7:0] valueNext;
    register_we #(.SIZE(8)) r_value(clk, rst_n, sck_edge, valueNext, value);

    // Next state determining
    always @(*) begin
        Next = State;
        case(State)
            S_IDLE    : if(cnt == IDLE_SIZE)    Next = S_PREFIX;
            S_PREFIX  : if(cnt == PREFIX_SIZE)  Next = S_DATA;
            S_DATA    : if(cnt == DATA_SIZE)    Next = S_POSTFIX;
            S_POSTFIX : if(cnt == POSTFIX_SIZE) Next = S_IDLE;
        endcase
    end

    always @(*) begin
        cntNext = cnt + 1;
        case(State)
            S_IDLE    : if (cnt == IDLE_SIZE)    cntNext = 0;
            S_PREFIX  : if (cnt == PREFIX_SIZE)  cntNext = 0;
            S_DATA    : if (cnt == DATA_SIZE)    cntNext = 0;
            S_POSTFIX : if (cnt == POSTFIX_SIZE) cntNext = 0;
        endcase
    end

    always @(*) begin
        bufferNext = buffer;
        valueNext = value;
        case(State)
            S_DATA    : bufferNext = { bufferNext[6:0], sdo };
            S_POSTFIX : valueNext = bufferNext;
        endcase
    end

    // buffered output
    wire csNext = (Next == S_IDLE);
    register_we #(.SIZE(1)) r_cs(clk, rst_n, sck_edge, csNext, cs);

endmodule


module sck_clk_divider
(
    input       clk,
    input       rst_n,
    output      sck,
    output      sck_edge
);
    wire [3:0] cnt;
    wire [3:0] cntNext = cnt + 1;
    register #(.SIZE(4)) r_cnt(clk, rst_n, cntNext, cnt);

    assign sck = cnt[3];
    assign sck_edge = (cnt == 4'b1000);

endmodule

