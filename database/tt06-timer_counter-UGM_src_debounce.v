// This program was cloned from: https://github.com/Shofuuu/tt06-timer_counter-UGM
// License: Apache License 2.0

`default_nettype none
// `timescale 1ns/1ns

module debounce #(
    parameter SREG_SIZE = 8
)(
    input wire clk, btn, rst,
    output reg q
);
    
    localparam [SREG_SIZE-1:0] hi_value = 2 ** SREG_SIZE-1;

    reg [SREG_SIZE-1:0] sreg;

    always @ (posedge clk or negedge rst) begin
        if (~rst) begin
            sreg <= {SREG_SIZE{1'b0}};
            q <= 1'b0;
        end
        else begin
            sreg <= {sreg[SREG_SIZE-2:0], btn};

            if (sreg == hi_value)
                q <= 1'b1;
            else if (sreg == {SREG_SIZE{1'b0}})
                q <= 1'b0;
            else
                q <= q;
        end
    end

endmodule



