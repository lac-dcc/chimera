// This program was cloned from: https://github.com/p-ariza/tfg-2324
// License: MIT License

/*

Copyright (c) 2023 Carlos Megías Núñez

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

`resetall
`timescale 1ns / 1ps
`default_nettype none

/*
 * Modified version of Alex Forencich's AXI4-Stream FIFO
 */
module switch_simple_fifo #
(
    // FIFO depth
    // Rounded up to nearest power of 2 cycles
    parameter DEPTH = 128,
    // Width of the data words in bits
    parameter DATA_WIDTH = 12,
    // Fill at initialization
    parameter FILL_INIT = 0,
    // Frame FIFO mode - operate on frames instead of cycles in write port
    parameter FRAME_FIFO_WR = 0,
    // Frame FIFO mode - operate on frames instead of cycles in read port
    parameter FRAME_FIFO_RD = 0,
    // Drop frames larger than FIFO
    // Requires FRAME_FIFO set
    parameter DROP_OVERSIZE_FRAME = FRAME_FIFO_RD || FRAME_FIFO_WR,
    // Drop frames marked bad
    // Requires FRAME_FIFO and DROP_OVERSIZE_FRAME set
    parameter DROP_BAD_FRAME = 0,
    // Drop incoming frames when full
    // When set, sw_in_data_ready is always asserted
    // Requires FRAME_FIFO and DROP_OVERSIZE_FRAME set
    parameter DROP_WHEN_FULL = 0
)
(
    input  wire                   clk,
    input  wire                   rst,
    
    /*
     * Write interface
     */
    input  wire [DATA_WIDTH-1:0]  wr_data,
    input  wire                   wr_enable,
    output wire                   wr_ready,
    input  wire                   wr_sof,
    input  wire                   wr_eof,
    input  wire                   wr_drop,

    /*
     * Read interface
     */
    output wire [DATA_WIDTH-1:0]  rd_data,
    input  wire                   rd_enable,
    output wire                   rd_valid,
    input  wire                   rd_sof,
    input  wire                   rd_eof,
    input  wire                   rd_drop,

    /*
     * Status output
     */
    output wire                   empty,
    output wire                   full,
    output wire [$clog2(DEPTH):0] status_depth,
    output wire [$clog2(DEPTH):0] status_depth_commit,
    output wire                   status_overflow,
    output wire                   status_bad_frame,
    output wire                   status_good_frame
);

// Width of the address (write and read pointers) bus in width
parameter ADDR_WIDTH = $clog2(DEPTH);

// check configuration
initial begin
    if (FRAME_FIFO_WR && FRAME_FIFO_RD) begin
        $error("Error: FRAME_FIFO_WR and FRAME_FIFO_RD are not compatible (instance %m)");
        $finish;
    end

    if (FRAME_FIFO_WR && FILL_INIT) begin
        $error("Error: FRAME_FIFO_WR and FILL_INIT are not compatible (instance %m)");
        $finish;
    end

    if (DROP_OVERSIZE_FRAME && !(FRAME_FIFO_WR || FRAME_FIFO_RD)) begin
        $error("Error: DROP_OVERSIZE_FRAME set requires FRAME_FIFO_WR or FRAME_FIFO_RD set (instance %m)");
        $finish;
    end

    if (DROP_BAD_FRAME && !((FRAME_FIFO_WR || FRAME_FIFO_RD) && DROP_OVERSIZE_FRAME)) begin
        $error("Error: DROP_BAD_FRAME set requires FRAME_FIFO_WR or FRAME_FIFO_RD and DROP_OVERSIZE_FRAME set (instance %m)");
        $finish;
    end

    if (DROP_WHEN_FULL && !((FRAME_FIFO_WR || FRAME_FIFO_RD) && DROP_OVERSIZE_FRAME)) begin
        $error("Error: DROP_WHEN_FULL set requires FRAME_FIFO_WR or FRAME_FIFO_RD and DROP_OVERSIZE_FRAME set (instance %m)");
        $finish;
    end
end

// instantiate RAM for FIFO
(* ramstyle = "no_rw_check" *)
reg [DATA_WIDTH-1:0] mem[(2**ADDR_WIDTH)-1:0];

// auxiliar registers and wires
reg [DATA_WIDTH-1:0] rd_data_reg;
reg [DATA_WIDTH-1:0] rd_data_commit_reg;
reg [DATA_WIDTH-1:0] rd_data_bad_reg;
reg rd_data_select_reg = 1'b0;

// register for reading shortcircuit
reg rd_valid_reg = 1'b0;

reg [ADDR_WIDTH:0] wr_ptr_reg = 0;
reg [ADDR_WIDTH:0] wr_ptr_commit_reg = 0;
reg [ADDR_WIDTH:0] rd_ptr_reg = 0;
reg [ADDR_WIDTH:0] rd_ptr_commit_reg = 0;

// full when first MSB different but rest same
assign full = wr_ptr_reg == (rd_ptr_reg ^ {1'b1, {ADDR_WIDTH{1'b0}}});
// empty when pointers match exactly
assign empty = wr_ptr_commit_reg == rd_ptr_reg;
// overflow within packet
wire empty_rd = rd_ptr_reg == (rd_ptr_commit_reg ^ {1'b1, {ADDR_WIDTH{1'b0}}});
wire full_wr = wr_ptr_reg == (wr_ptr_commit_reg ^ {1'b1, {ADDR_WIDTH{1'b0}}});

reg drop_frame_reg = 1'b0;
reg send_frame_reg = 1'b0;
reg [ADDR_WIDTH:0] depth_reg = 0;
reg [ADDR_WIDTH:0] depth_commit_reg = 0;
reg overflow_reg = 1'b0;
reg bad_frame_reg = 1'b0;
reg good_frame_reg = 1'b0;

assign wr_ready = FRAME_FIFO_WR ? (!full || (full_wr && DROP_OVERSIZE_FRAME) || DROP_WHEN_FULL) : !full;

// map output read
assign rd_data = !rd_data_select_reg ? rd_data_reg : rd_data_bad_reg;
// valid read data
assign rd_valid = rd_valid_reg;

// status depth signal
assign status_depth = depth_reg;
assign status_depth_commit = depth_commit_reg;
assign status_overflow = overflow_reg;
assign status_bad_frame = bad_frame_reg;
assign status_good_frame = good_frame_reg;

generate
    if (FILL_INIT) begin
        reg fill = 1'b1;
        // Write logic
        always @(posedge clk) begin
            if (fill == 1'b0) begin
                // check if something to write
                if (wr_ready && wr_enable) begin
                    // store data
                    mem[wr_ptr_reg[ADDR_WIDTH-1:0]] <= wr_data;
                    wr_ptr_reg <= wr_ptr_reg + 1;
                    wr_ptr_commit_reg <= wr_ptr_reg + 1;                    
                end else begin
                    wr_ptr_reg <= wr_ptr_reg;
                    wr_ptr_commit_reg <= wr_ptr_commit_reg;
                end

            end else begin
                if (wr_ptr_reg < 2**ADDR_WIDTH) begin
                    mem[wr_ptr_reg[ADDR_WIDTH-1:0]] <= wr_ptr_reg;
                    wr_ptr_reg <= wr_ptr_reg + 1;
                    wr_ptr_commit_reg <= wr_ptr_reg + 1;                    
                end else begin
                    // wr_ptr_reg <= wr_ptr_reg + 1;
                    fill <= 1'b0;
                end
            end

            if (rst) begin
                fill <= 1'b1;
                wr_ptr_reg <= 0;
            end
        end
    end else begin
        // Write logic
        always @(posedge clk) begin
            overflow_reg <= 1'b0;
            bad_frame_reg <= 1'b0;
            good_frame_reg <= 1'b0;

            if (FRAME_FIFO_WR) begin
                // frame FIFO mode
                if (wr_ready && wr_enable) begin
                    // transfer in
                    if ((full && DROP_WHEN_FULL) || (full_wr && DROP_OVERSIZE_FRAME) || drop_frame_reg) begin
                        // packet overflow, or currently dropping frame
                        // drop frame
                        drop_frame_reg <= 1'b1;
                        if (wr_eof) begin
                            wr_ptr_reg <= wr_ptr_commit_reg;
                            drop_frame_reg <= 1'b0;
                            overflow_reg <= 1'b1;
                        end
                    end else begin
                        mem[wr_ptr_reg[ADDR_WIDTH-1:0]] <= wr_data;
                        wr_ptr_reg <= wr_ptr_reg + 1;
                        if (wr_eof || (!DROP_OVERSIZE_FRAME && (full_wr || send_frame_reg))) begin
                            // end of frame or send frame
                            send_frame_reg <= !wr_eof;
                            if (wr_eof && DROP_BAD_FRAME && wr_drop) begin
                                // bad packet, reset write pointer
                                wr_ptr_reg <= wr_ptr_commit_reg;
                                bad_frame_reg <= 1'b1;
                            end else begin
                                // good packet or packet overflow, update write pointer
                                wr_ptr_commit_reg <= wr_ptr_reg + 1;
                                good_frame_reg <= wr_eof;
                            end
                        end
                    end
                end else if (wr_enable && full_wr && !DROP_OVERSIZE_FRAME) begin
                    // data valid with packet overflow
                    // update write pointer
                    send_frame_reg <= 1'b1;
                    wr_ptr_commit_reg <= wr_ptr_reg;
                end

                if (rst) begin
                    drop_frame_reg <= 1'b0;
                    send_frame_reg <= 1'b0;
                    overflow_reg <= 1'b0;
                    bad_frame_reg <= 1'b0;
                    good_frame_reg <= 1'b0;
                end
            end else begin
                // normal FIFO mode
                if (wr_ready && wr_enable) begin
                    // store data
                    mem[wr_ptr_reg[ADDR_WIDTH-1:0]] <= wr_data;
                    wr_ptr_reg <= wr_ptr_reg + 1;
                    wr_ptr_commit_reg <= wr_ptr_reg + 1;
                end else begin
                    wr_ptr_reg <= wr_ptr_reg;
                    wr_ptr_commit_reg <= wr_ptr_commit_reg;
                end
            end

            if (rst) begin
                wr_ptr_reg <= 0;
                wr_ptr_commit_reg <= 0;
            end
        end
    end
endgenerate

// Status
always @(posedge clk) begin
    depth_reg <= wr_ptr_reg - rd_ptr_reg;
    if (FRAME_FIFO_WR) begin 
        depth_commit_reg <= wr_ptr_commit_reg - rd_ptr_reg;
    end else begin
        depth_commit_reg <= wr_ptr_reg - rd_ptr_commit_reg;
    end
end

// Read logic
always @(posedge clk) begin
    overflow_reg <= 1'b0;
    bad_frame_reg <= 1'b0;
    good_frame_reg <= 1'b0;

    if (FRAME_FIFO_RD) begin
        // if reading a valid thing
        if ((!empty && rd_enable) || !rd_valid_reg) begin
            rd_valid_reg <= 1'b0;

            // update commit pointer and data with current at starting new frame if previous frame was valid
            if (rd_sof && !rd_data_select_reg) begin
                rd_ptr_commit_reg <= rd_ptr_reg;
                rd_data_commit_reg <= rd_data_reg;
            end

            if ((empty && DROP_WHEN_FULL) || (empty_rd && DROP_OVERSIZE_FRAME) || drop_frame_reg) begin
                // packet overflow, or currently dropping frame
                // drop frame
                drop_frame_reg <= 1'b1;
                if (rd_eof) begin
                    rd_ptr_reg <= rd_ptr_commit_reg;
                    drop_frame_reg <= 1'b0;
                    overflow_reg <= 1'b1;
                end
            end else begin
                rd_valid_reg <= 1'b1;
                rd_data_reg <= mem[rd_ptr_reg[ADDR_WIDTH-1:0]];
                rd_ptr_reg <= rd_ptr_reg + 1;
                rd_data_select_reg <= 1'b0;
                if (rd_eof) begin
                    // end of frame or send frame
                    send_frame_reg <= !rd_eof;
                    if (rd_eof && DROP_BAD_FRAME && rd_drop) begin
                        // bad frame, reset read pointer, reset data
                        if (rd_sof && !rd_data_select_reg) begin
                            rd_ptr_reg <= rd_ptr_reg;
                            rd_data_bad_reg <= rd_data_reg;
                        end else begin
                            rd_ptr_reg <= rd_ptr_commit_reg;
                            rd_data_bad_reg <= rd_data_commit_reg;
                        end
                        rd_data_select_reg <= 1'b1;
                        bad_frame_reg <= 1'b1;
                    end else begin
                        // good packet or packet overflow, update read pointer
                        rd_ptr_commit_reg <= rd_ptr_reg + 1;
                        good_frame_reg <= rd_eof;
                    end
                end
            end
        end else if (rd_enable && empty_rd && !DROP_OVERSIZE_FRAME) begin
            // data valid with packet overflow
            // update read pointer
            send_frame_reg <= 1'b1;
            rd_ptr_commit_reg <= rd_ptr_reg;
        end

        if (rst) begin
            drop_frame_reg <= 1'b0;
            send_frame_reg <= 1'b0;
            overflow_reg <= 1'b0;
            bad_frame_reg <= 1'b0;
            good_frame_reg <= 1'b0;
        end
    end else begin
        if (rd_enable) begin
            rd_valid_reg <= 1'b0;
        end

        if (rd_enable || !rd_valid_reg) begin
            // retrieve current element
            rd_valid_reg <= 1'b0;
            rd_data_reg <= mem[rd_ptr_reg[ADDR_WIDTH-1:0]];

            if (!empty) begin
                // increment read pointer
                rd_valid_reg <= 1'b1;
                rd_ptr_reg <= rd_ptr_reg + 1;
                rd_ptr_commit_reg <= rd_ptr_reg + 1;
            end else begin
                // keep pointer value
                rd_ptr_reg <= rd_ptr_reg;
                rd_ptr_commit_reg <= rd_ptr_commit_reg;
            end
        end
    end

    if (rst) begin
        rd_ptr_reg <= {ADDR_WIDTH+1{1'b0}};
        rd_ptr_commit_reg <= {ADDR_WIDTH+1{1'b0}};
        rd_valid_reg <= 1'b0;
    end
end

endmodule