// This program was cloned from: https://github.com/johnMamish/jfpjc
// License: MIT License

/**
 * Copyright John Mamish, 2020
 */

/**
 * In order to do a 2-D DCT composed of 1-D DCTs, first we must do 1-D DCTs on each row, and then
 * 1-D DCTs on each column.
 *
 * If the intraline index is indicated to be row major,
 *     index = (intraline index) + (8 * (line number)).
 *
 * If the intraline index is indicated to be column major,
 *     index = (8 * (intraline index)) + (line number).
 */

`timescale 1ns/100ps

`define ROW_MAJOR 1'b0
`define COLUMN_MAJOR 1'b1

module block_indexer(input  [2:0] intraline_index,
                     input  [2:0]      line_number,
                     input     row_or_column_major,
                     output reg [5:0] result_index);
    always @ * begin
        case (row_or_column_major)
            `ROW_MAJOR: result_index = { line_number, intraline_index };
            `COLUMN_MAJOR: result_index = { intraline_index, line_number};
        endcase
    end
endmodule

/**
 * This hardware component reads pixel bytes sequentially in row-major order from a memory buffer
 * and computes an 8x8 DCT on them. It outputs the resuting DCT coefficients in row-major order.
 *
 *
 * The input data is expected in the q8 format, in the range [-128, 127]. The jpeg standard talks
 * about level shifting. See section A.3.1 for details. This module expects that data fed to it has
 * already been level shifted.
 *
 * This module works by doing 16 1D DCTs on an 8x8 grid of values. The first 8 DCTs are done in
 * row-major order on the data, that is:
 *     DCT #1 is on elements {(0, 0), (0, 1), ... (0, 7)},
 *            or eqivalently for elements stored in row-major order {0, 1, 2, 3, ... 7}
 *     DCT #2 is on elements {(1, 0), (1, 1), ... (1, 7)},
 *            or eqivalently for elements stored in row-major order {8, 9, 10, ...  15}
 * ...
 *     DCT #8 is on elements {(7, 0), (7, 1), ... (7, 7)},
 *            or eqivalently for elements stored in row-major order {56, 57, 58,... 63}
 *
 * The final 8 DCTs are on done in column major order, that is:
 *     DCT #1 is on elements {(0, 0), (1, 0), ... (7, 0)},
 *            or eqivalently for elements stored in row-major order { 0,  8, 16, 24, ... 56}
 *     DCT #2 is on elements {(1, 1), (1, 1), ... (7, 1)},
 *            or eqivalently for elements stored in row-major order { 1,  9, 17, 25, ... 57}
 * ...
 *     DCT #8 is on elements {(0, 7), (1, 7), ... (7, 7)},
 *            or eqivalently for elements stored in row-major order { 7, 15, 23, 31, ... 63}
 */
module loeffler_dct_88(input             clock,
                       input             nreset,

                       output reg  [5:0] fetch_addr,
                       input       [7:0] src_data_in,

                       output reg  [5:0] result_write_addr,
                       output reg  [0:0]  result_wren,
                       output reg [15:0] result_out,

                       output reg [0:0]  finished);

    // internal flip-flops
    reg [3:0] xform_number;

    // internal signals
    reg [7:0] tempmem_read_addr;
    wire [15:0] tempmem_read_data;

    reg [7:0] tempmem_write_addr;
    reg       tempmem_wren;
    reg [15:0] tempmem_write_data;

    reg       dct_1d_reset;
    reg       dct_1d_finished_edgedetect;

    reg       dct_1d_read_src_delayed;

    // Instantiate 1d DCT core
    wire [2:0] dct_1d_fetch_addr;
    reg [15:0] dct_1d_src_data_in_3q12;

    wire [4:0] dct_1d_scratchpad_read_addr;
    reg [15:0] dct_1d_scratchpad_read_data;

    wire [2:0] dct_1d_result_write_addr;
    wire       dct_1d_result_wren;
    wire [15:0] dct_1d_result_out;

    wire [4:0] dct_1d_scratchpad_write_addr;
    wire       dct_1d_scratchpad_wren;
    wire [15:0] dct_1d_scratchpad_write_data;

    wire dct_1d_read_src_scratchpad;
    wire dct_1d_finished;
    loeffler_dct_8 dct_1d(.clock(clock),
                          .nreset(dct_1d_reset),

                          .fetch_addr(dct_1d_fetch_addr),
                          .src_data_in_3q12(dct_1d_src_data_in_3q12),

                          .scratchpad_read_addr(dct_1d_scratchpad_read_addr),
                          .scratchpad_read_data(dct_1d_scratchpad_read_data),

                          .result_write_addr(dct_1d_result_write_addr),
                          .result_wren(dct_1d_result_wren),
                          .result_out(dct_1d_result_out),

                          .scratchpad_write_addr(dct_1d_scratchpad_write_addr),
                          .scratchpad_wren(dct_1d_scratchpad_wren),
                          .scratchpad_write_data(dct_1d_scratchpad_write_data),

                          .read_src_scratchpad(dct_1d_read_src_scratchpad),
                          .finished(dct_1d_finished));

    ice40_ebr #(.addr_width(8), .data_width(16)) tempmem(.din(tempmem_write_data),
                                                         .write_en(tempmem_wren),
                                                         .waddr(tempmem_write_addr),
                                                         .wclk(clock),
                                                         .raddr(tempmem_read_addr),
                                                         .rclk(clock),
                                                         .dout(tempmem_read_data));


    // These wires transform the indexes accessed by the 1-D DCT engine into 2D row- or column-
    // major indexes depending on what transform we're on.
    wire [5:0] rowcol_sweep_read_addr;
    wire [5:0] rowcol_sweep_write_addr;
    block_indexer read_block_indexer(.intraline_index(dct_1d_fetch_addr),
                                     .line_number(xform_number[2:0]),
                                     .row_or_column_major(xform_number[3]),
                                     .result_index(rowcol_sweep_read_addr));
    block_indexer write_block_indexer(.intraline_index(dct_1d_result_write_addr),
                                      .line_number(xform_number[2:0]),
                                      .row_or_column_major(xform_number[3]),
                                      .result_index(rowcol_sweep_write_addr));


    always @ * begin
        // The address that we want to read input data from this cycle
        // TODO: it would be nice if a read enable signal was provided from dct8_1d for power saving
        fetch_addr = rowcol_sweep_read_addr;

        // The tempmem memory's lower 64 bytes hold row-major 1d DCT results, which sometimes need
        // to be used as input data to the 1d DCT, so the tempmem read addr depends on whether
        // the 1d DCT engine is trying to access its temporary scratchpad variables or if it's trying
        // to access its input data.
        case (dct_1d_read_src_scratchpad)
            1'b0: tempmem_read_addr = {2'b00,  rowcol_sweep_read_addr};   // read from tempmem bytes [0, 63]
            1'b1: tempmem_read_addr = {3'b010, dct_1d_scratchpad_read_addr};  // read from bytes [64, 96]
        endcase

        case ({ dct_1d_scratchpad_wren, dct_1d_result_wren })
            2'b01: tempmem_write_addr = {2'b00, rowcol_sweep_write_addr};   // write to bytes [0, 63]
            2'b10: tempmem_write_addr = {3'b010, dct_1d_scratchpad_write_addr}; // write to bytes [64, 96]
            default: tempmem_write_addr = 8'hxx;
        endcase

        tempmem_wren = ((dct_1d_scratchpad_wren) ||
                        ((xform_number[3] == 1'b0) && (dct_1d_result_wren)));
        result_wren = ((xform_number[3] == 1'b1) && (dct_1d_result_wren));

        // If we are doing transforms 0 - 7, we read from the input memory, otherwise, we read
        // from the intermediate results in temp memory.
        if (xform_number < 4'h8) begin
            dct_1d_src_data_in_3q12 = { {4{src_data_in[7]}}, src_data_in[7:0], 4'h0 };
        end else begin
            dct_1d_src_data_in_3q12 = tempmem_read_data;
        end

        // muxes for data going into temp memory
        case ({ dct_1d_scratchpad_wren, dct_1d_result_wren })
            2'b01: begin
                if (xform_number < 4'h8) begin
                    tempmem_write_data = dct_1d_result_out;
                end else begin
                    tempmem_write_data = 16'hxxxx;
                end
            end
            2'b10: tempmem_write_data = dct_1d_scratchpad_write_data;
            default: tempmem_write_data = 16'hxxxx;
        endcase

        // this register needs to be delayed by 1.
        //case (dct_1d_read_src_scratchpad)
        case (dct_1d_read_src_delayed)
            1'b0: dct_1d_scratchpad_read_data = 16'hxxxx;
            1'b1: dct_1d_scratchpad_read_data = tempmem_read_data;
        endcase

        case (result_wren)
            1'b0: result_write_addr = 6'hxx;
            1'b1: result_write_addr = rowcol_sweep_write_addr;
        endcase

        result_out = dct_1d_result_out;
        //result_out = 16'hxxxx;

        if (nreset == 1'b0) begin
            dct_1d_reset = 1'b0;
        end else begin
            if (dct_1d_finished && (xform_number != 4'd15)) begin
                dct_1d_reset = 1'b0;
            end else begin
                dct_1d_reset = 1'b1;
            end
        end

        finished = (xform_number == 4'd15) && dct_1d_finished;
    end

    always @ (posedge clock) begin
        if (nreset) begin
            // only increment xform_number on rising edge of dct_1d_finished.
            // xform_number should saturate on reaching 15.
            if ((dct_1d_finished_edgedetect == 1'b0) && (dct_1d_finished == 1'b1)) begin
                xform_number <= (xform_number == 4'd15) ? (4'd15) : (xform_number + 1);
            end else begin
                xform_number <= xform_number;
            end

            dct_1d_finished_edgedetect <= dct_1d_finished;

            dct_1d_read_src_delayed <= dct_1d_read_src_scratchpad;
        end else begin
            dct_1d_finished_edgedetect <= 1'b0;
            xform_number <= 4'h0;
            dct_1d_read_src_delayed <= 1'b0;
        end
    end
endmodule
