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
    output reg  [7:0] value
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
    reg  [ 1:0] State;
    reg  [23:0] cnt;
    reg  [ 7:0] buffer;

    // State hold registers next value
    reg  [ 1:0] Next;
    reg  [23:0] cntNext;
    reg  [ 7:0] bufferNext;
    reg  [ 7:0] valueNext;

    // Next value to state on every clock
    always @ (posedge clk or negedge rst_n)
        if(~rst_n) begin
            State  <= S_IDLE;
            cnt    <= 24'b0;
            buffer <= 8'b0;
            value  <= 8'b0;
            end
        else begin
            State  <= Next;
            cnt    <= cntNext;
            buffer <= bufferNext;
            value  <= valueNext;
        end

    // Next state determining
    always @(*) begin
        Next = State;
        if(sck_edge)
            case(State)
                S_IDLE    : if(cnt == IDLE_SIZE)    Next = S_PREFIX;
                S_PREFIX  : if(cnt == PREFIX_SIZE)  Next = S_DATA;
                S_DATA    : if(cnt == DATA_SIZE)    Next = S_POSTFIX;
                S_POSTFIX : if(cnt == POSTFIX_SIZE) Next = S_IDLE;
            endcase
    end

    always @(*) begin
        cntNext = cnt;
        if(sck_edge) begin
            cntNext = cnt + 1;
            case(State)
                S_IDLE    : if (cnt == IDLE_SIZE)    cntNext = 0;
                S_PREFIX  : if (cnt == PREFIX_SIZE)  cntNext = 0;
                S_DATA    : if (cnt == DATA_SIZE)    cntNext = 0;
                S_POSTFIX : if (cnt == POSTFIX_SIZE) cntNext = 0;
            endcase
        end
    end

    always @(*) begin
        bufferNext = buffer;
        valueNext = value;
        if(sck_edge)
            case(State)
                S_DATA    : bufferNext = { bufferNext[6:0], sdo };
                S_POSTFIX : valueNext = bufferNext;
            endcase
    end

    // output
    assign cs = (State == S_IDLE);

endmodule


module sck_clk_divider
(
    input       clk,
    input       rst_n,
    output      sck,
    output      sck_edge
);
    localparam  S_DOWN = 0,
                S_EDGE = 1,
                S_UP   = 2;

    localparam  DOWN_SIZE = 7,
                UP_SIZE = DOWN_SIZE - 1; // because 1 cycle of S_EDGE;

    // State hold registers
    reg  [1:0] State;
    reg  [2:0] cnt;

    // State hold registers next value
    reg  [1:0] Next;
    reg  [2:0] cntNext;

    always @ (posedge clk or negedge rst_n)
        if(~rst_n) begin
            State  <= S_DOWN;
            cnt    <= 3'b0;
            end
        else begin
            State  <= Next;
            cnt    <= cntNext;
        end

    // Next state determining
    always @(*) begin
        Next = State;
        case(State)
            S_DOWN  : if(cnt == DOWN_SIZE) Next = S_EDGE;
            S_EDGE  : Next = S_UP;
            S_UP    : if(cnt == UP_SIZE) Next = S_DOWN;
        endcase
    end

    always @(*) begin
        cntNext = cnt + 1;
        case(State)
            S_DOWN  : if (cnt == DOWN_SIZE) cntNext = 0;
            S_EDGE  : cntNext = 0;
            S_UP    : if (cnt == UP_SIZE) cntNext = 0;
        endcase
    end

    // Output value
    assign sck      = (State != S_DOWN);
    assign sck_edge = (State == S_EDGE);

endmodule
