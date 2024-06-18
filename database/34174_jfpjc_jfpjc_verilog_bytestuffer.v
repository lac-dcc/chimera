// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

/**
 * Jpeg requires us to stuff bytes following ff with a 00.
 *
 * This module does that. It will eventurally overflow and return bad results if - in the steady
 * state - it recieves more valid 0xff data_in bytes than invalid bytes in. This module has a buffer
 * depth of 512, so this will never happen for sane jpeg encodings.
 *
 * This module assumes that the buffer depth is a power of 2.
 *
 * @port in  clock         Clock signal for the module. All input and output signals are latched on
 *                         rising edges of this clock
 * @port in  nreset        When this signal is kept low on the rising edge of clock, the module will
 *                         be reset. Hold high for normal operation
 * @port in  data_in_valid If data_in_valid is 1'b1 @ posedge clock, value presented on data_in will
 *                         be ingested.
 * @port in  data_in       If data_in_valid is 1'b1, data on this port will be ingested
 *                         @ posedge clock
 *
 * @port out data_out_valid   If data_out_valid is 1'b1 @ posedge clock, value presented on data_out
 *                            is valid and must be read by subsequent circuitry.
 * @port out data_out         If data_out_valid is 1'b1, subsequent circuitry must store data
 *                            driven on this port @ posedge clock.
 * @port out overflow         If this buffer overflows becuase it recieved too many 0xffs in a row,
 *                            this signal is driven high. It can be cleared with a module reset.
 */
module bytestuffer(input               clock,
                   input               nreset,

                   input               data_in_valid,
                   input         [7:0] data_in,

                   output reg          data_out_valid,
                   output reg    [7:0] data_out,
                   output reg          overflow);
    reg data_out_valid_next;
    reg [7:0] data_out_next;

    reg [8:0] data_in_ptr;
    reg [8:0] data_in_ptr_next;

    reg [8:0] data_out_ptr;
    reg [8:0] data_out_ptr_next;
    wire [7:0] mem_out;

    ice40_ebr ice40_ebr(.din(data_in),
                        .write_en(data_in_valid),
                        .waddr(data_in_ptr),
                        .wclk(clock),
                        .raddr(data_out_ptr),
                        .rclk(clock),
                        .dout(mem_out));
    defparam ice40_ebr.addr_width = 9;
    defparam ice40_ebr.data_width = 8;

`define BYTESTUFFER_STATE_WAIT 2'b00
`define BYTESTUFFER_STATE_OUTPUT_MEMVAL 2'b01
`define BYTESTUFFER_STATE_OUTPUT_ZERO 2'b10
    reg [1:0] bytestuffer_state;
    reg [1:0] bytestuffer_state_next;

    always @* begin
        if (data_in_valid) begin
            data_in_ptr_next = data_in_ptr + 9'h001;
        end else begin
            data_in_ptr_next = data_in_ptr;
        end

        case (bytestuffer_state)
            `BYTESTUFFER_STATE_WAIT: begin
                data_out_valid_next = 1'b0;
                data_out_next = 8'hxx;
                if (data_in_ptr != data_out_ptr) begin
                    data_out_ptr_next = data_out_ptr + 9'h001;
                    bytestuffer_state_next = `BYTESTUFFER_STATE_OUTPUT_MEMVAL;
                end else begin
                    data_out_ptr_next = data_out_ptr;
                    bytestuffer_state_next = `BYTESTUFFER_STATE_WAIT;
                end
            end

            `BYTESTUFFER_STATE_OUTPUT_MEMVAL: begin
                data_out_valid_next = 1'b1;
                data_out_next = mem_out;
                if (mem_out == 8'hff) begin
                    data_out_ptr_next = data_out_ptr;
                    bytestuffer_state_next = `BYTESTUFFER_STATE_OUTPUT_ZERO;
                end else if (data_out_ptr != data_in_ptr) begin
                    data_out_ptr_next = data_out_ptr + 9'h001;
                    bytestuffer_state_next = `BYTESTUFFER_STATE_OUTPUT_MEMVAL;
                end else begin
                    data_out_ptr_next = data_out_ptr;
                    bytestuffer_state_next = `BYTESTUFFER_STATE_WAIT;
                end
            end

            `BYTESTUFFER_STATE_OUTPUT_ZERO: begin
                data_out_valid_next = 1'b1;
                data_out_next = 8'h00;
                if (data_out_ptr != data_in_ptr) begin
                    data_out_ptr_next = data_out_ptr + 9'h001;
                    bytestuffer_state_next = `BYTESTUFFER_STATE_OUTPUT_MEMVAL;
                end else begin
                    data_out_ptr_next = data_out_ptr;
                    bytestuffer_state_next = `BYTESTUFFER_STATE_WAIT;
                end
            end

            default: begin
                data_out_valid_next = 1'bx;
                data_out_next = 8'hxx;
                data_out_ptr_next = 9'hxxx;
                bytestuffer_state_next = 2'bxx;
            end
        endcase
    end

    always @(posedge clock) begin
        if (nreset) begin
            // Overflow detection
            if (((data_in_ptr + 9'h1) == data_out_ptr) &&
                (data_in_ptr_next == data_out_ptr_next)) begin
                overflow <= 1'b1;
            end else begin
                overflow <= overflow;
            end

            data_in_ptr <= data_in_ptr_next;
            data_out_ptr <= data_out_ptr_next;

            data_out_valid <= data_out_valid_next;
            data_out <= data_out_next;
            data_out_ptr <= data_out_ptr_next;
            bytestuffer_state <= bytestuffer_state_next;
        end else begin
            data_in_ptr <= 9'h000;
            data_out_ptr <= 9'h000;
            data_out_valid <= 1'b0;
            data_out <= 8'h0;
            bytestuffer_state <= `BYTESTUFFER_STATE_WAIT;
            overflow <= 1'b0;
        end
    end

endmodule
