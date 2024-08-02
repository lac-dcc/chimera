// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

module FIFO_8BIT #(
    parameter DEPTH = 13  // Depth of the FIFO (maximum 16)
) (
    input rst,                // Asynchronous reset
    input wr_en,              // Write enable
    input rd_en,              // Read enable
    input [7:0] data_in,      // Data input
    output reg [7:0] data_out,// Data output
    output full,              // FIFO full flag
    output empty              // FIFO empty flag
);

    /* verilator lint_off LATCH */
    /* verilator lint_off BLKSEQ */
    /* verilator lint_off UNOPTFLAT */

    // Calculate address width based on depth
    localparam ADDR_WIDTH = $clog2(DEPTH + 1);

    reg [7:0] mem [0:DEPTH-1];  // Memory array
    reg [ADDR_WIDTH-1:0] wr_ptr; // Write pointer
    reg [ADDR_WIDTH-1:0] rd_ptr; // Read pointer
    reg [ADDR_WIDTH:0] fifo_count; // Counter for number of elements in the FIFO

    // Write operation
    always @(posedge wr_en) begin
        if (wr_en && !full) begin
            mem[wr_ptr] = data_in;
            wr_ptr = (wr_ptr == (DEPTH - 1)) ? 0 : wr_ptr + 1;
        end
    end

    // Read operation
    always @(posedge rd_en) begin
        if (rd_en && !empty) begin
            data_out = mem[rd_ptr];
            if (rd_ptr == DEPTH - 1)
                rd_ptr = 0;
            else
                rd_ptr = rd_ptr + 1;

            //rd_ptr = (rd_ptr == (DEPTH - 1)) ? 0 : rd_ptr + 1;
        end
    end

    // FIFO count management
    always @(*) begin
        if (rst) begin
            fifo_count = 0;
            wr_ptr = 0;
            rd_ptr = 0;
            data_out = 8'b0;
        end else begin
            if (wr_en && !rd_en && !full) begin
                fifo_count = fifo_count + 1;
            end else if (!wr_en && rd_en && !empty) begin
                fifo_count = fifo_count - 1;
            end
        end
    end

    // Full and empty flags
    assign full = (fifo_count == DEPTH);
    assign empty = (fifo_count == 0);

endmodule
