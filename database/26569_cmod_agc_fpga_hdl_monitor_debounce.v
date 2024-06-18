// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module debounce(
    input wire clk,
    input wire rst_n,
    input wire [WIDTH:1] in,
    output reg [WIDTH:1] out
);

parameter WIDTH = 16;
parameter COUNT = 5;

reg [3:0] counter;

reg [WIDTH-1:0] in_sr1;
reg [WIDTH-1:0] in_sr2;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        counter <= COUNT;
        in_sr1 <= {WIDTH{1'b0}};
        in_sr2 <= {WIDTH{1'b0}};
        out <= {WIDTH{1'b0}};
    end else begin
        in_sr1 <= in;
        in_sr2 <= in_sr1;
        if (in_sr1 != in_sr2) begin
            counter <= COUNT;
        end else begin
            if (counter > 4'b0) begin
                counter <= counter - 1;
            end else begin
                out <= in_sr2;
            end
        end
    end
end

endmodule
`default_nettype wire
