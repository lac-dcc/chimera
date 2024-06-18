// This program was cloned from: https://github.com/hello-eternity/Cyberrio
// License: Apache License 2.0

module fetch #(
    parameter RESET_VECTOR = 32'h8000_0000
) (
    `ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
    `endif
    input clk,
    input reset,

    // from execute
    input branch,
    input [31:0] branch_vector,

    // from writeback
    input trap,
    input mret,

    // from csr
    input [31:0] trap_vector,
    input [31:0] mret_vector,

    // from hazard
    input stall,
    input invalidate,

    // to busio
    output [31:0] fetch_address,
    // from busio
    input [31:0] fetch_data,

    // to decode
    output reg [31:0] pc_out,
    output reg [31:0] next_pc_out,
    output reg [31:0] instruction_out,
    output reg valid_out
);

    reg [31:0] pc = RESET_VECTOR;
    wire [31:0] next_pc = pc + 4;

// Select the next PC
// Select the next PC
always @(posedge clk) begin
    if (reset) begin
        pc <= RESET_VECTOR;
    end
    else if (trap) begin
        pc <= trap_vector;
    end
    else if (mret) begin
        pc <= mret_vector;
    end
    else if (branch) begin
        pc <= branch_vector;
    end
    else if (stall || invalidate) begin
        pc <= pc;
    end
    else begin
        pc <= next_pc;
    end
end


    // Output fetch address to busio
    assign fetch_address = pc;

    // Handle instruction fetch and output to decode
    always @(posedge clk) begin
        if(stall || invalidate)
            valid_out <= 0;
        else
            valid_out <= 1;

        if(!stall) begin
            pc_out <= pc;
            next_pc_out <= next_pc;
            instruction_out <= fetch_data;
        end
    end

endmodule
