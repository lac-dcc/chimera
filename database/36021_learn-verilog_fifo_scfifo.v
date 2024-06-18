// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// sync fifo

module scfifo #(
    parameter DATA_BITS = 8,
    parameter SIZE = 8 // size must be 2, 4, 8, 16, ...
)
(
    input clk,
    input rst_n,
    input rdreq,
    input wrreq,
    input [DATA_BITS-1:0] data,
    output reg [DATA_BITS-1:0] q,
    output full,
    output empty
);

    localparam DEPTH_BITS = $clog2(SIZE);

    reg [DATA_BITS-1:0] mem [SIZE];
    reg [DEPTH_BITS:0] rp;
    reg [DEPTH_BITS:0] wp;
    reg [DATA_BITS-1:0] q_cache;
    wire sig_empty;

    // write:
    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            wp <= 0;
        end else begin
            if (wrreq && !full) begin
                mem[wp[DEPTH_BITS-1:0]] <= data;
                wp <= wp + 1'b1;
            end
        end
    end

    // read:
    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n) begin
            rp <= 0;
        end else begin
            if (rdreq && !empty) begin
                q_cache <= mem[rp[DEPTH_BITS-1:0]];
                rp <= rp + 1'b1;
            end else begin
                q_cache <= {DATA_BITS{1'b0}};
            end
            q <= q_cache;
        end
    end

    assign empty = (rp == wp) ? 1'b1 : 1'b0;
    assign full = rp[DEPTH_BITS] != wp[DEPTH_BITS] && (rp[DEPTH_BITS-1:0] == wp[DEPTH_BITS-1:0]);

endmodule
