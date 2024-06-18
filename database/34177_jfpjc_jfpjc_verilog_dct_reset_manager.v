// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

`timescale 1ns/100ps

/**
 * This state machine watches the ingester unit and resets the
 * DCT engines when there is a new buffer that can be processed.
 *
 * It is also responsible for managing which 64-word output buffer the DCTs are pointed to.
 *
 * When the backbuffer changes, this state machine holds the DCT engines in reset for 3 clock
 * cycles, then sets them loose with new base addresses and output addresses.
 */
module dct_reset_manager(input            clock,
                         input            nreset,

                         input            ingester_frontbuffer_select,
                         input            dcts_finished,

                         output reg [2:0] mcu_groups_processed,
                         output reg [1:0] dcts_frontbuffer,
                         output reg       dct_nreset);

`define DCTS_STATE_WAIT_FRAMEBUFFER 3'h0
`define DCTS_STATE_RESET 3'h1
`define DCTS_STATE_DCTS_ACTIVE 3'h2
`define DCTS_STATE_ERR 3'h3
    reg [2:0] DCTs_state;
    reg [1:0] reset_cnt;
    reg       ingester_frontbuffer [0:1];
    wire      buffer_swapped;
    assign buffer_swapped = (ingester_frontbuffer[0] != ingester_frontbuffer[1]);
    always @ (posedge clock) begin
        if (nreset) begin
            ingester_frontbuffer[0] <= ingester_frontbuffer_select;
            ingester_frontbuffer[1] <= ingester_frontbuffer[0];

            case (DCTs_state)
                `DCTS_STATE_WAIT_FRAMEBUFFER: begin
                    mcu_groups_processed <= 'h0;
                    reset_cnt <= 'h0;
                    dcts_frontbuffer <= dcts_frontbuffer;
                    if (buffer_swapped) begin
                        DCTs_state <= `DCTS_STATE_RESET;
                    end else begin
                        DCTs_state <= DCTs_state;
                    end
                end

                `DCTS_STATE_RESET: begin
                    mcu_groups_processed <= mcu_groups_processed;
                    dcts_frontbuffer <= dcts_frontbuffer;
                    if (buffer_swapped) begin
                        reset_cnt <= 'h0;
                        DCTs_state <= `DCTS_STATE_ERR;
                    end else if (reset_cnt < 'h2) begin
                        reset_cnt <= reset_cnt + 'h1;
                        DCTs_state <= `DCTS_STATE_RESET;
                    end else begin
                        reset_cnt <= 'h0;
                        DCTs_state <= `DCTS_STATE_DCTS_ACTIVE;
                    end
                end

                `DCTS_STATE_DCTS_ACTIVE: begin
                    reset_cnt <= 'h0;

                    if (buffer_swapped) begin
                        mcu_groups_processed <= mcu_groups_processed;
                        DCTs_state <= `DCTS_STATE_ERR;
                        dcts_frontbuffer <= dcts_frontbuffer;
                    end else if (dcts_finished) begin
                        mcu_groups_processed <= mcu_groups_processed + 'h1;
                        if (mcu_groups_processed == 'h7) begin
                            DCTs_state <= `DCTS_STATE_WAIT_FRAMEBUFFER;
                            dcts_frontbuffer <= dcts_frontbuffer + 'h1;
                        end else begin
                            DCTs_state <= `DCTS_STATE_RESET;
                            dcts_frontbuffer <= dcts_frontbuffer + 'h1;
                        end
                    end else begin
                        mcu_groups_processed <= mcu_groups_processed;
                        DCTs_state <= `DCTS_STATE_DCTS_ACTIVE;
                        dcts_frontbuffer <= dcts_frontbuffer;
                    end
                end

                `DCTS_STATE_ERR: begin
                    mcu_groups_processed <= 'hx;
                    reset_cnt <= 'hx;
                    DCTs_state <= `DCTS_STATE_ERR;
                    dcts_frontbuffer <= 'hx;
                end
            endcase
        end else begin
            DCTs_state <= `DCTS_STATE_WAIT_FRAMEBUFFER;
            ingester_frontbuffer[0] <= 1'b0;
            ingester_frontbuffer[1] <= 1'b0;
            mcu_groups_processed <= 'h0;
            reset_cnt <= 'h0;
            dcts_frontbuffer <= 'h0;
        end
    end

    always @* begin
        case (DCTs_state)
            `DCTS_STATE_WAIT_FRAMEBUFFER: begin
                dct_nreset = 1'b0;
            end

            `DCTS_STATE_RESET: begin
                dct_nreset = 1'b0;
            end

            `DCTS_STATE_DCTS_ACTIVE: begin
                dct_nreset = 1'b1;
            end

            `DCTS_STATE_ERR: begin
                dct_nreset = 1'b1;
            end

            default: begin
                dct_nreset = 1'bx;
            end
        endcase // case (DCTs_state)
    end
endmodule
