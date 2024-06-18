// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0

/* verilator lint_off WIDTHTRUNC */
module shiftreg
    #(
         parameter WIDTH = 8,
         parameter DIVIDER = 100000
     )
     (
         input clk,
         output reg out = 0,
         input in,
         output reg sclk = 0,
         output reg load = 1,
         output reg [WIDTH-1:0] data_in = 0,
         input [WIDTH-1:0] data_out
     );
    reg [7:0] data_pos = 0;
    reg [31:0] counter = 0;
    reg [8:0] state = 0;
    reg delay = 0;

    always @(posedge clk) begin
        if (counter == 0) begin
            counter <= DIVIDER;

            if (state == 0) begin
                if (delay == 1) begin
                    delay <= 0;
                    sclk <= 1;
                end else if (sclk == 1) begin
                    sclk <= 0;
                    data_pos <= data_pos + 1;
                end else if (data_pos < WIDTH) begin
                    data_in[data_pos] = in;
                    out = data_out[WIDTH - 1 - data_pos];
                    delay <= 1;
                end else begin
                    load <= 1'd0;
                    state <= 1;
                end
            end else if (state == 1) begin
                // output
                load <= 1'd1;
                sclk <= 1'd0;
                data_pos <= 8'd0;
                state <= 0;
            end

        end else begin
            counter <= counter - 1;
        end
    end
endmodule
