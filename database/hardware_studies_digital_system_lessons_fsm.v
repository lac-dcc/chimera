// This program was cloned from: https://github.com/MathBorgess/hardware_studies
// License: MIT License

module counter(
    input clk,
    input rst,
    output reg [2:0] count
);
    reg [2:0] state, next_state;
    parameter [2:0] S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101, S6 = 3'b110, S7 = 3'b111;

    always @(posedge clk or negedge rst) begin: STATE_MEMORY
        if (!rst) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end
    
    always @(state) begin: NEXT_STATE_LOGIC
        case (state)
            S0: next_state = S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = S4;
            S4: next_state = S5;
            S5: next_state = S6;
            S6: next_state = S7;
            S7: next_state = S0;
        endcase
    end

    always @(state) begin: OUTPUT_LOGIC
        count = state;
    end
endmodule
