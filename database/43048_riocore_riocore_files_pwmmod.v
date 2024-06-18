// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module pwmmod
    #(parameter DIVIDER_FREQ = 255, parameter DIVIDER_DTY = 128)
    (
        input clk,
        input din,
        output reg dout = 0
    );

    reg [31:0] counter = 0;
    always @ (posedge clk) begin
        counter <= counter + 1;
        if (counter == DIVIDER_FREQ) begin
            dout <= din;
            counter <= 0;
        end else if (counter == DIVIDER_DTY) begin
            dout <= 0;
        end
    end

endmodule
