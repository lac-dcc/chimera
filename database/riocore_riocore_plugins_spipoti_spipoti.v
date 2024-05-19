// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0

/* verilator lint_off WIDTH */

module spipoti
    #(parameter WIDTH = 8, DIVIDER = 100000)
     (
         input clk,
         output reg mosi = 0,
         output reg sclk = 0,
         output reg sel = 1,
         input wire [7:0] value
     );
    parameter cmd = 8'd0;
    reg [7:0] state = 0;
    reg [7:0] data_pos = 0;
    reg [31:0] counter = 0;
    reg mclk = 0;
    reg next_clk = 0;
    wire [15:0] cmddata = {cmd, value};
    always @(posedge clk) begin
        if (counter == 0) begin
            counter <= DIVIDER;
            mclk <= ~mclk;
        end else begin
            counter <= counter - 1;
        end
    end
    always @(posedge mclk) begin
        if (state == 0) begin
            sclk = 0;
            sel = 0;
            data_pos = 0;
            state = 1;
            next_clk = 0;
        end else if (state == 1) begin
            if (next_clk == 1) begin
                next_clk = 0;
                sclk = 1;
            end else if (data_pos < 16) begin
                sclk = 0;
                mosi = cmddata[15 - data_pos];
                next_clk = 1;
                data_pos = data_pos + 1;
            end else begin
                state = 2;
                mosi = 0;
                sclk = 0;
            end
        end else if (state == 2) begin
            sel = 1;
            state = state + 1;
        end else if (state == 3) begin
            state = 0;
        end
    end
endmodule

