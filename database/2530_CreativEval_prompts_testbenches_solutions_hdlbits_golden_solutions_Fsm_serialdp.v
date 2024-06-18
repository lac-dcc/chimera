// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
);

    // State definition
    typedef enum logic [2:0] {
        IDLE,
        START_WAIT,
        DATA_WAIT,
        PARITY_WAIT,
        STOP_WAIT
    } state_t;
    
    state_t state, next_state;
    
    // Counter to keep track of received bits
    reg [2:0] bit_count = 0;
    
    // Output register for holding the received byte
    reg [7:0] received_byte = 0;
    
    // Signal for the start and stop bits
    reg start_bit = 0;
    reg stop_bit = 1;
    
    // Signal to hold parity
    reg odd_parity = 0;
    
    // Parity module instantiation
    wire parity_out;
    parity parity_inst (
        .clk(clk),
        .reset(reset),
        .in(in),
        .odd(parity_out)
    );
    
    // Output registers
    reg [7:0] out_byte_reg = 0;
    reg done_reg = 0;

    // FSM
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end
    
    // Datapath
    always @(posedge clk) begin
        // Update next_state
        case (state)
            IDLE: next_state = (in == 0) ? START_WAIT : IDLE;
            START_WAIT: next_state = bit_count == 0 ? DATA_WAIT : START_WAIT;
            DATA_WAIT: next_state = bit_count == 8 ? PARITY_WAIT : DATA_WAIT;
            PARITY_WAIT: next_state = bit_count == 9 ? STOP_WAIT : PARITY_WAIT;
            STOP_WAIT: next_state = stop_bit == 1 ? IDLE : STOP_WAIT;
            default: next_state = IDLE;
        endcase
        
        // FSM actions
        case (state)
            IDLE: begin
                bit_count <= 0;
                received_byte <= 0;
                start_bit <= 0;
                stop_bit <= 1;
                odd_parity <= 0;
                out_byte_reg <= 0;
                done_reg <= 0;
            end
            START_WAIT: begin
                start_bit <= 1;
            end
            DATA_WAIT: begin
                received_byte <= {received_byte[6:0], in};
                bit_count <= bit_count + 1;
            end
            PARITY_WAIT: begin
                odd_parity <= parity_out;
                bit_count <= bit_count + 1;
            end
            STOP_WAIT: begin
                stop_bit <= in;
                bit_count <= 0;
                if (stop_bit == 1 && odd_parity == 1)
                    done_reg <= 1;
            end
        endcase
        
        // Output assignment
        out_byte_reg <= received_byte;
    end

    // Assign outputs
    assign out_byte = out_byte_reg;
    assign done = done_reg;

endmodule