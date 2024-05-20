// This program was cloned from: https://github.com/PaolaUniSa/tt6_rsnn_test0
// License: Apache License 2.0

module MemoryCU(
    input wire clk,                 // Clock input
    input wire rst,                 // Asynchronous reset input
    input wire enable,              // Enable signal for FSM control
    input wire load_params,         // Signal to start loading parameters
    output reg params_reg_enable // Control signal for writing to the FIFO
);

// Define FSM states using parameters
parameter IDLE  = 3'b000,
          WRITE = 3'b001,
          WAIT  = 3'b010;

// State registers
reg [2:0] current_state, next_state;

// FSM state transition and output logic
always @(posedge clk or posedge rst) begin
    if (rst) begin
        current_state <= IDLE;
    end else if (enable) begin
        current_state <= next_state;
    end
end

// Next state logic
always @(*) begin
    if (!enable) begin
        next_state = current_state;  // Maintain current state if not enabled
    end else begin
        case (current_state)
            IDLE: begin
                if (load_params) begin
                    next_state = WRITE;
                end else begin
                    next_state = IDLE;
                end
            end
            WRITE: begin
                next_state = WAIT;
            end
            WAIT: begin
                if (!load_params) begin
                    next_state = IDLE;
                end else begin
                    next_state = WAIT;
                end
            end
            default: begin
                next_state = IDLE;
            end
        endcase
    end
end

// Output logic based on the states
always @(posedge clk or posedge rst) begin
    if (rst) begin
        params_reg_enable <= 0;
    end else if (enable) begin
        case (current_state)
            WRITE: begin
                params_reg_enable <= 1;
            end
            WAIT: begin
                params_reg_enable <= 0;
            end
            default: begin
                params_reg_enable <= 0;
            end
        endcase
    end else begin
        params_reg_enable <= 0;  // Ensure params_reg_enable is off when not enabled
    end
end

endmodule
