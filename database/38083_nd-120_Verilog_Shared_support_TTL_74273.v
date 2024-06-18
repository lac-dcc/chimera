// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

// 74273
// OCTAL D-TYPE FLIP-FLOP WITH CLEAR
//
// Documentation:  https://www.ti.com/lit/ds/symlink/sn54ls273-sp.pdf


module TTL_74273 (
    input wire CLK,        // Clock input
    input wire CLR_n,      // Active low clear input
    input wire [7:0] D,    // 8-bit data input
    output reg [7:0] Q     // 8-bit output
);

    // Flip-flop logic
    always @(posedge CLK or negedge CLR_n) begin
        if (!CLR_n) begin
            Q <= 8'b0;     // Reset output to 0 when clr_n is low
        end else begin
            Q <= D;        // Load data into flip-flops on rising edge of clk
        end
    end

endmodule