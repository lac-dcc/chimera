// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// Recognize the pattern 00110 in a serial stream.

module mealy_state_machine_behavioral (
    input        clk,           // clk
    input        rst,           // Reset
    input        in,            // Serial in
    output reg   found);        // Found pattern

    // DATA TYPES
    reg [2:0] state;

    // STATES - BINARY ENCODED STYLE - USE ANY STYLE YOU WANT
    parameter [2:0] START     = 3'b000;
    parameter [2:0] ZERO      = 3'b001;
    parameter [2:0] WAIT      = 3'b010;
    parameter [2:0] S1        = 3'b011;
    parameter [2:0] S2        = 3'b100;
    parameter [2:0] S3        = 3'b101;

    // MEALY STATE MACHINE
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ (posedge clk) begin
        if (rst) begin
            state <= START;
            found <= 1'b0;
        end else begin
            case (state)
                START: begin
                    if (in==0)  begin state <= ZERO;  found <= 1'b0; end
                    else        begin state <= START; found <= 1'b0; end
                end
                ZERO: begin
                    if (in==0)  begin state <= WAIT;  found <= 1'b0; end
                    else        begin state <= START; found <= 1'b0; end
                end
                WAIT: begin
                    if (in==1)  begin state <= S1;    found <= 1'b0; end
                    else        begin state <= WAIT;  found <= 1'b0; end
                end
                S1: begin
                    if (in==1)  begin state <= S2;    found <= 1'b0; end
                    else        begin state <= ZERO;  found <= 1'b0; end
                end
                S2:begin
                    if (in==0)  begin state <= S3;    found <= 1'b0; end
                    else        begin state <= START; found <= 1'b0; end
                end
                S3:begin
                    if (in==1)  begin state <= START; found <= 1'b1; end // Found pattern
                    else        begin state <= WAIT;  found <= 1'b0; end
                end
            endcase
        end
    end

endmodule
