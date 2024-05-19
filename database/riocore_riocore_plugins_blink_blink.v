// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module blink
    #(parameter DIVIDER = 100000)
    (
        input clk,
        output led
    );
    reg rled = 0;
    reg [31:0] counter = 0;
    assign led = rled;
    always @(posedge clk) begin
        if (counter == 0) begin
            counter <= DIVIDER;
            rled <= ~rled;
        end else begin
            counter <= counter - 1;
        end
    end
endmodule
