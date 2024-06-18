// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// Recognize the pattern 00110 in a serial stream.

module moore_state_machine_behavioral (
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
    parameter [2:0] FOUND     = 3'b110;

    // MOORE STATE MACHINE
    // ALWAYS BLOCK with NON-BLOCKING PROCEDURAL ASSIGNMENT STATEMENT
    always @ (posedge clk) begin
        if (rst) begin
            state <= START;
            found <= 1'b0;
        end else begin
            case (state)
                START: begin
                    found <= 1'b0;
                    if (in==0)  begin state <= ZERO;   end
                    else        begin state <= START;  end
                end
                ZERO: begin
                    found <= 1'b0;
                    if (in==0)  begin state <= WAIT;   end
                    else        begin state <= START;  end
                end
                WAIT: begin
                    found <= 1'b0;
                    if (in==1)  begin state <= S1;     end
                    else        begin state <= WAIT;   end
                end
                S1: begin
                    found <= 1'b0;
                    if (in==1)  begin state <= S2;     end
                    else        begin state <= ZERO;   end
                end
                S2:begin
                    found <= 1'b0;
                    if (in==0)  begin state <= S3;     end
                    else        begin state <= START;  end
                end
                S3:begin
                    found <= 1'b0;
                    if (in==1)  begin state <= FOUND;  end // Found pattern
                    else        begin state <= WAIT;   end
                end
                FOUND:begin
                    found <= 1'b1;
                    if (in==1)  begin state <= START;  end
                    else        begin state <= ZERO;   end
                end
            endcase
        end
    end

endmodule
