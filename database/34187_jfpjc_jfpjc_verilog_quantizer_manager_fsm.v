// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

/**
 * This FSM monitors the quantizer's progress and feeds in new buffers from the dct output stage
 * when the quantizer is ready and when there is more data ready in the dct output stage buffers.
 */
module quantizer_manager_fsm(input                   clock,
                             input                   nreset,

                             input  [1:0]            dcts_frontbuffer,

                             output reg [1:0]            quantizer_readbuf,
                             output reg [5:0]        coefficient_index,
                             output [2:0]            ebr_index,
                             output [1:0]            quantizer_output_buffer,
                             output reg              dividend_divisor_valid);
    reg [0:0] quantizer_state;
`define QUANTIZER_STATE_WAIT 1'h0
`define QUANTIZER_STATE_QUANTIZE 1'h1
    reg [2:0] ebr_index_internal [0:1];
    reg [1:0] quantizer_output_buffer_internal [0:1];

    assign ebr_index = ebr_index_internal[1];
    assign quantizer_output_buffer = quantizer_output_buffer_internal[1];

    always @(posedge clock) begin
        if (nreset) begin
            ebr_index_internal[1] <= ebr_index_internal[0];
            quantizer_output_buffer_internal[1] <= quantizer_output_buffer_internal[0];
            case (quantizer_state)
                `QUANTIZER_STATE_WAIT: begin
                    quantizer_readbuf <= quantizer_readbuf;
                    coefficient_index <= 'h0;
                    dividend_divisor_valid <= 1'h0;
                    ebr_index_internal[0] <= 'h0;
                    if (quantizer_readbuf != dcts_frontbuffer) begin
                        quantizer_state <= `QUANTIZER_STATE_QUANTIZE;
                    end else begin
                        quantizer_state <= `QUANTIZER_STATE_WAIT;
                    end
                end

                `QUANTIZER_STATE_QUANTIZE: begin
                    coefficient_index <= coefficient_index + 6'h1;
                    dividend_divisor_valid <= 1'h1;

                    if (coefficient_index == 'h3f) begin
                        quantizer_output_buffer_internal[0] <= quantizer_output_buffer_internal[0] + 'h1;

                        if (ebr_index_internal[0] == 3'h4) begin
                            quantizer_state <= `QUANTIZER_STATE_WAIT;
                            quantizer_readbuf <= quantizer_readbuf + 'h1;
                            ebr_index_internal[0] <= 'h0;
                        end else begin
                            quantizer_state <= `QUANTIZER_STATE_QUANTIZE;
                            quantizer_readbuf <= quantizer_readbuf;
                            ebr_index_internal[0] <= ebr_index_internal[0] + 'h1;
                        end
                    end else begin
                        quantizer_output_buffer_internal[0] <= quantizer_output_buffer_internal[0];
                        quantizer_state <= `QUANTIZER_STATE_QUANTIZE;
                        ebr_index_internal[0] <= ebr_index_internal[0];
                    end
                end
            endcase
        end else begin
            quantizer_state <= `QUANTIZER_STATE_WAIT;
            quantizer_readbuf <= 2'h0;
            quantizer_output_buffer_internal[0] <= 2'h0;
            quantizer_output_buffer_internal[1] <= 2'h0;
            coefficient_index <= 'h0;
            ebr_index_internal[0] <= 'h0;
            ebr_index_internal[1] <= 'h0;
            dividend_divisor_valid <= 'h0;
        end
    end
endmodule
