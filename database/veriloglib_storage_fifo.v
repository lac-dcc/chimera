// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module fifo
#( parameter WIDTH = 4, parameter DEPTH = 8)
(
    input clk,
    input rst_n,
    input wr_en,
    input rd_en,
    input [WIDTH-1:0] data_in,
    output full,
    output empty,
    output reg [WIDTH-1:0] data_out
);

    localparam PTR_WIDTH = $clog2(DEPTH);

    reg [WIDTH-1:0] fifo_mem [DEPTH-1:0];
    reg [PTR_WIDTH-1:0] rd_ptr;
    reg [PTR_WIDTH-1:0] wr_ptr;

    assign empty = (rd_ptr == wr_ptr) ? 1 : 0;
    assign full = (rd_ptr == (wr_ptr+1)) ? 1 : 0;

    always @(posedge clk)
        begin: write_process
            if(wr_en & !full) begin
                fifo_mem[wr_ptr] <= data_in;
                wr_ptr <= wr_ptr+1;
            end

        end

    always @(posedge clk)
        begin: read_process
            if(rd_en & !empty) begin
                data_out <= fifo_mem[rd_ptr];
                rd_ptr <= rd_ptr+1;
            end
        end

    always @(posedge clk)
        begin: reset_process
            if(!rst_n) begin
                wr_ptr <= 0;
                rd_ptr <= 0;
                data_out <= 0;
            end
        end

endmodule
