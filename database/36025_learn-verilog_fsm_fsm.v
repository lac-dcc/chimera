// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// fsm

module fsm
(
    input clk,
    input rst_n,
    input key_in,
    output reg [1:0] out
);

    localparam
        S1 = 2'b00,
        S2 = 2'b01,
        S3 = 2'b10,
        S4 = 2'b11;

    // current state:
    reg [1:0] cs;

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n)
            cs <= S1;
        else begin
            case (cs)
                S1: begin
                    if (!key_in)
                        cs <= S2;
                end
                S2: begin
                    if (!key_in)
                        cs <= S3;
                end
                S3: begin
                    if (!key_in)
                        cs <= S4;
                end
                S4: begin
                    if (!key_in)
                        cs <= S1;
                end
                default: cs <= S1;
            endcase
        end
    end

    always @ (posedge clk or negedge rst_n) begin
        if (! rst_n)
            out <= S1;
        else
            case (cs)
                S1: out <= S1;
                S2: out <= S2;
                S3: out <= S3;
                S4: out <= S4;
                default: out <= S1;
            endcase
    end
endmodule
