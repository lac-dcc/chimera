// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module freqout
    (
        input clk,
        input signed [31:0] frequency,
        input disabled,
        output freq
    );

    wire DIR;
    assign DIR = (frequency > 0);
    reg [31:0] freqCounter = 32'd0;
    reg [31:0] frequencyAbs = 32'd0;
    reg _signal = 0;
    assign freq = _signal;
    always @ (posedge clk) begin
        if (DIR) begin
            frequencyAbs <= frequency / 2;
        end else begin
            frequencyAbs <= -frequency / 2;
        end
        freqCounter <= freqCounter + 1;
        if (frequency != 0) begin
            if (freqCounter >= frequencyAbs) begin
                _signal <= ~_signal;
                freqCounter <= 32'b0;
            end
        end
    end
endmodule
