// This program was cloned from: https://github.com/katherinezhao02/karatroc-hsm
// License: MIT License

module fifo #(
    parameter WIDTH = 32
) (
    input clk,
    input resetn,
    input rd,
    input wr,
    input [WIDTH-1:0] data_in,
    output full,
    output empty,
    output [WIDTH-1:0] data_out
);

reg [WIDTH-1:0] data;
reg have_data;

always @(posedge clk) begin
    if (!resetn) begin
        have_data <= 0;
    end else begin
        if (wr && !have_data) begin
            data <= data_in;
            have_data <= 1;
        end else if (rd) begin
            have_data <= 0; /* note that we don't clear data */
        end
    end
end

always @(*) begin
    data_out = have_data ? data : 0;
    full = have_data;
    empty = !have_data;
end

endmodule
