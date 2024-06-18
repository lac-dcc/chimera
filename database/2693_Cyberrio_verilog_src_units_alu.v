// This program was cloned from: https://github.com/hello-eternity/Cyberrio
// License: Apache License 2.0

module alu (
    `ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
    `endif
    input clk,

    input [31:0] input_a,
    input [31:0] input_b,

    input [2:0] function_select,
    input function_modifier,

    // 1st cycle output
    output [31:0] add_result,
    // 2nd cycle output
    output reg [31:0] result
);

    // Define function codes
    localparam 
        ALU_ADD_SUB = 3'b000,
        ALU_SLL     = 3'b001,
        ALU_SLT     = 3'b010,
        ALU_SLTU    = 3'b011,
        ALU_XOR     = 3'b100,
        ALU_SRL_SRA = 3'b101,
        ALU_OR      = 3'b110,
        ALU_AND_CLR = 3'b111;

    // Define result registers
    reg [31:0] result_add_sub, result_sll, result_slt, result_sltu,
                result_xor, result_srl_sra, result_or, result_and_clr;
    /* verilator lint_off UNUSED */ // The first bit [32] will intentionally be ignored
    wire [32:0] tmp_shifted = $signed({function_modifier ? input_a[31] : 1'b0, input_a}) >>> input_b[4:0];
    /* verilator lint_on UNUSED */
    // Store the old function
    reg [2:0] old_function;
    assign add_result = result_add_sub;
    // Calculate results based on the selected function
    always @(posedge clk) begin
        // Compute add/subtract result
        if (function_select == ALU_ADD_SUB)
            result_add_sub <= function_modifier ? (input_a - input_b) : (input_a + input_b);

        // Compute shift left logical result
        if (function_select == ALU_SLL)
            result_sll <= input_a << input_b[4:0];

        // Compute set less than result
        if (function_select == ALU_SLT)
            result_slt <= ($signed(input_a) < $signed(input_b)) ? 1 : 0;

        // Compute set less than unsigned result
        if (function_select == ALU_SLTU)
            result_sltu <= (input_a < input_b) ? 1 : 0;

        // Compute XOR result
        if (function_select == ALU_XOR)
            result_xor <= input_a ^ input_b;

        // Compute shift right logical/arithmetic result
        if (function_select == ALU_SRL_SRA)
            result_srl_sra <= tmp_shifted[31:0];

        // Compute OR result
        if (function_select == ALU_OR)
            result_or <= input_a | input_b;

        // Compute AND/CLR result
        if (function_select == ALU_AND_CLR)
            result_and_clr <= (function_modifier ? ~input_a : input_a) & input_b;
        
        // Update old function
        old_function <= function_select;
    end
    // Output result based on the old function
    always @(*) begin
        case (old_function)
            ALU_ADD_SUB: result = result_add_sub;
            ALU_SLL:     result = result_sll;
            ALU_SLT:     result = result_slt;
            ALU_SLTU:    result = result_sltu;
            ALU_XOR:     result = result_xor;
            ALU_SRL_SRA: result = result_srl_sra;
            ALU_OR:      result = result_or;
            ALU_AND_CLR: result = result_and_clr;
        endcase
    end

    // Output add/subtract result immediately

endmodule
