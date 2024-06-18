// This program was cloned from: https://github.com/hello-eternity/Cyberrio
// License: Apache License 2.0

module execute (
    `ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
    `endif
    input clk,

    // from decode
    input [31:0] pc_in,
    input [31:0] next_pc_in,
    // from decode (control EX)
    input [31:0] rs1_data_in,
    input [31:0] rs2_data_in,
    input [31:0] rs1_bypass_in,
    input [31:0] rs2_bypass_in,
    input rs1_bypassed_in,
    input rs2_bypassed_in,
    input [31:0] csr_data_in,
    input [31:0] imm_data_in,
    input [2:0] alu_function_in,
    input alu_function_modifier_in,
    input [1:0] alu_select_a_in,
    input [1:0] alu_select_b_in,
    input [2:0] cmp_function_in,
    input jump_in,
    input branch_in,
    input csr_read_in,
    input csr_write_in,
    input csr_readable_in,
    input csr_writeable_in,
    // from decode (control MEM)
    input load_in,
    input store_in,
    input [1:0] load_store_size_in,
    input load_signed_in,
    input bypass_memory_in,
    // from decode (control WB)
    input [1:0] write_select_in,
    input [4:0] rd_address_in,
    input [11:0] csr_address_in,
    input mret_in,
    input wfi_in,
    // from decode
    input valid_in,
    input [3:0] ecause_in,
    input exception_in,
    
    // from hazard
    input stall,
    input invalidate,

    // to memory
    output reg [31:0] pc_out,
    output reg [31:0] next_pc_out,
    // to memory (control MEM)
    output [31:0] alu_data_out,
    output [31:0] alu_addition_out,
    output reg [31:0] rs2_data_out,
    output reg [31:0] csr_data_out,
    output reg branch_out,
    output reg jump_out,
    output cmp_output_out,
    output reg load_out,
    output reg store_out,
    output reg [1:0] load_store_size_out,
    output reg load_signed_out,
    output reg bypass_memory_out,
    // to memory (control WB)
    output reg [1:0] write_select_out,
    output reg [4:0] rd_address_out,
    output reg [11:0] csr_address_out,
    output reg csr_write_out,
    output reg mret_out,
    output reg wfi_out,
    // to memory
    output reg valid_out,
    output reg [3:0] ecause_out,
    output reg exception_out
);

// Instantiate a compare module for comparison operations
cmp ex_cmp (
    `ifdef USE_POWER_PINS
    .vccd1(vccd1),	// User area 1 1.8V supply
    .vssd1(vssd1),	// User area 1 digital ground
    `endif
    .clk(clk),
    .input_a(rs1_bypassed_in ? rs1_bypass_in : rs1_data_in),
    .input_b(rs2_bypassed_in ? rs2_bypass_in : rs2_data_in),
    .function_select(cmp_function_in),
    .result(cmp_output_out)
);

// Instantiate an ALU module for arithmetic and logic operations
alu ex_alu (
    `ifdef USE_POWER_PINS
    .vccd1(vccd1),	// User area 1 1.8V supply
    .vssd1(vssd1),	// User area 1 digital ground
    `endif
    .clk(clk),
    .input_a(alu_input_a),
    .input_b(alu_input_b),
    .function_select(alu_function_in),
    .function_modifier(alu_function_modifier_in),
    .add_result(alu_addition_out),
    .result(alu_data_out)
);

// Wire to bypass the operands if needed
wire [31:0] acctual_rs1 = rs1_bypassed_in ? rs1_bypass_in : rs1_data_in;
wire [31:0] acctual_rs2 = rs2_bypassed_in ? rs2_bypass_in : rs2_data_in;

// Wires to hold ALU inputs based on select signals
reg [31:0] alu_input_a;
reg [31:0] alu_input_b;

always @(*) begin
    case (alu_select_a_in)
        2'b00 : alu_input_a = acctual_rs1;  // Select rs1_data_in
        2'b01 : alu_input_a = imm_data_in;  // Select imm_data_in
        2'b10 : alu_input_a = pc_in;        // Select pc_in
        2'b11 : alu_input_a = csr_data_in;  // Select csr_data_in
    endcase

    case (alu_select_b_in)
        2'b00 : alu_input_b = acctual_rs2;  // Select rs2_data_in
        2'b01 : alu_input_b = imm_data_in;  // Select imm_data_in
        2'b10 : alu_input_b = pc_in;        // Select pc_in
        2'b11 : alu_input_b = csr_data_in;  // Select csr_data_in
    endcase
end


// Check for CSR exceptions
wire csr_exception = ((csr_read_in && !csr_readable_in) || (csr_write_in && !csr_writeable_in));

always @(posedge clk) begin
    valid_out <= (stall ? valid_out : valid_in) && !invalidate;
    if (!stall) begin
        pc_out <= pc_in;
        next_pc_out <= next_pc_in;
        rs2_data_out <= acctual_rs2;
        csr_data_out <= csr_data_in;
        branch_out <= branch_in;
        jump_out <= jump_in;
        load_out <= load_in;
        store_out <= store_in;
        load_store_size_out <= load_store_size_in;
        load_signed_out <= load_signed_in;
        write_select_out <= write_select_in;
        rd_address_out <= rd_address_in;
        bypass_memory_out <= bypass_memory_in;
        csr_address_out <= csr_address_in;
        csr_write_out <= csr_write_in;
        mret_out <= mret_in;
        wfi_out <= wfi_in;
        if (!exception_in && csr_exception) begin
            ecause_out <= 2;  // CSR exception code
            exception_out <= 1;  // Exception occurred
        end else begin
            ecause_out <= ecause_in;
            exception_out <= exception_in;
        end
    end
end

endmodule
