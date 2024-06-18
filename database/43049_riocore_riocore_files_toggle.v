// This program was cloned from: https://github.com/multigcs/riocore
// License: GNU General Public License v2.0


module toggle
    (
        input clk,
        input din,
        output reg dout = 0
    );

    reg[2:0] dinr;
    always @(posedge clk) begin
        dinr <= {dinr[1:0], din};
    end

    wire din_risingedge = (dinr[2:1]==2'b01);

    always @(posedge clk) begin
        if (din_risingedge) begin
            dout <= ~dout;
        end
    end
endmodule
