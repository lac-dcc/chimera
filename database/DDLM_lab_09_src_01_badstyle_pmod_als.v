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
    output reg        cs,
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

    // Next state determining
    always @ (posedge clk or negedge rst_n)
        if(~rst_n) begin
            State  <= S_IDLE;
            cnt    <= 24'b0;
            buffer <= 8'b0;
            value  <= 8'b0;
            cs     <= 1'b1;
            end
        else begin
            if (sck_edge)
                case(State) 
                    S_IDLE    : begin 
                                    if(cnt == IDLE_SIZE) begin
                                        State <= S_PREFIX;
                                        cs <= 1'b0;
                                    end
                                    cnt <= (cnt == IDLE_SIZE) ? 0 : cnt + 1;
                                end
                    S_PREFIX  : begin 
                                    if(cnt == PREFIX_SIZE) State <= S_DATA;
                                    cnt <= (cnt == PREFIX_SIZE) ? 0 : cnt + 1;
                                end
                    S_DATA    : begin 
                                    if(cnt == DATA_SIZE) State <= S_POSTFIX;
                                    cnt <= (cnt == DATA_SIZE) ? 0 : cnt + 1;
                                    buffer <= { buffer[6:0], sdo };
                                end
                    S_POSTFIX : begin 
                                    if(cnt == POSTFIX_SIZE) begin
                                        State <= S_IDLE;
                                        cs <= 1'b1;
                                    end
                                    cnt <= (cnt == POSTFIX_SIZE) ? 0 : cnt + 1;
                                    value <= buffer;
                                end
                endcase
        end

endmodule


module sck_clk_divider
(
    input       clk,
    input       rst_n,
    output  reg sck,
    output  reg sck_edge
);
    localparam  S_DOWN = 0,
                S_EDGE = 1,
                S_UP   = 2;

    localparam  DOWN_SIZE = 7,
                UP_SIZE = DOWN_SIZE - 1; // because 1 cycle of S_EDGE;

    // State hold registers
    reg  [1:0] State;
    reg  [2:0] cnt;

    // Next state determining
    always @ (posedge clk or negedge rst_n)
        if(~rst_n) begin
            State  <= S_DOWN;
            cnt    <= 3'b0;
            end
        else begin
            case(State) 
                S_DOWN : begin 
                            if(cnt == DOWN_SIZE) begin
                                State <= S_EDGE;
                                sck_edge <= 1'b1;
                                sck <= 1'b1;
                            end
                            cnt <= (cnt == DOWN_SIZE) ? 0 : cnt + 1;
                         end
                S_EDGE : begin 
                            State <= S_UP; 
                            cnt <= 0;
                            sck_edge <= 1'b0;
                         end
                S_UP   : begin 
                            if(cnt == UP_SIZE) begin
                                State <= S_DOWN;
                                sck <= 1'b0;
                            end
                            cnt <= (cnt == UP_SIZE) ? 0 : cnt + 1;
                         end
            endcase
        end

endmodule

