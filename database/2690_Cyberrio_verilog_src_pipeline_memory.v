// This program was cloned from: https://github.com/hello-eternity/Cyberrio
// License: Apache License 2.0

module memory (
    `ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
    `endif
    input clk,
    // from execute
    input [31:0] pc_in,
    input [31:0] next_pc_in,
    // from execute (control MEM)
    input [31:0] alu_data_in,
    input [31:0] alu_addition_in,
    input [31:0] rs2_data_in,
    input [31:0] csr_data_in,
    input branch_in,
    input jump_in,
    input cmp_output_in,
    input load_in,
    input store_in,
    input [1:0] load_store_size_in,
    input load_signed_in,
    input bypass_memory_in,
    // from execute (control WB)
    input [1:0] write_select_in,
    input [4:0] rd_address_in,
    input [11:0] csr_address_in,
    input csr_write_in,
    input mret_in,
    input wfi_in,
    // from execute
    input valid_in,
    input [3:0] ecause_in,
    input exception_in,
    
    // from hazard
    input stall,
    input invalidate,

    // to decode
    output [4:0] bypass_address,
    output [31:0] bypass_data,

    // to busio
    output [31:0] mem_address,
    output [31:0] mem_store_data,
    output [1:0] mem_size,
    output mem_signed,
    output mem_load,
    output mem_store,
    
    // from busio
    input [31:0] mem_load_data,
    
    // to fetch
    output branch_taken,
    output [31:0] branch_address,

    // to writeback
    output reg [31:0] pc_out,
    output reg [31:0] next_pc_out,
    // to writeback (control WB)
    output reg [31:0] alu_data_out,
    output reg [31:0] csr_data_out,
    output reg [31:0] load_data_out,
    output reg [1:0] write_select_out,
    output reg [4:0] rd_address_out,
    output reg [11:0] csr_address_out,
    output reg csr_write_out,
    output reg mret_out,
    output reg wfi_out,
    // to writeback
    output reg valid_out,
    output reg [3:0] ecause_out,
    output reg exception_out
);

wire to_execute = !exception_in && valid_in;

assign bypass_address = (valid_in && bypass_memory_in) ? rd_address_in : 5'h0;
assign bypass_data = write_select_in[0] ? csr_data_in : alu_data_in;

wire valid_branch_address = (alu_addition_in[1:0] == 0);
reg valid_mem_address;

always @(*) begin
    case (load_store_size_in)
        2'b00: valid_mem_address = 1;
        2'b01: valid_mem_address = (alu_addition_in[0] == 0);
        2'b10: valid_mem_address = (alu_addition_in[1:0] == 0);
        2'b11: valid_mem_address = 0;
    endcase
end

wire should_branch = branch_in && (jump_in || cmp_output_in);
assign branch_taken = valid_in && valid_branch_address && should_branch;
assign branch_address = alu_addition_in;

assign mem_load = to_execute && valid_mem_address && load_in;
assign mem_store = to_execute && valid_mem_address && store_in;
assign mem_size = load_store_size_in;
assign mem_signed = load_signed_in;
assign mem_address = alu_addition_in;
assign mem_store_data = rs2_data_in;

always @(posedge clk) begin
    valid_out <= (stall ? valid_out : valid_in) && !invalidate;
    if (!stall) begin
        pc_out <= pc_in;
        next_pc_out <= next_pc_in;
        alu_data_out <= alu_data_in;
        csr_data_out <= csr_data_in;
        load_data_out <= mem_load_data;
        write_select_out <= write_select_in;
        rd_address_out <= rd_address_in;
        csr_address_out <= csr_address_in;
        csr_write_out <= csr_write_in;
        mret_out <= mret_in;
        wfi_out <= wfi_in;
        if (!exception_in && should_branch && !valid_branch_address) begin
            ecause_out <= 0;
            exception_out <= 1;
        end else if (!exception_in && (load_in || store_in) && !valid_mem_address) begin
            ecause_out <= load_in ? 4'h4 : 4'h6;
            exception_out <= 1;
        end else begin
            ecause_out <= ecause_in;
            exception_out <= exception_in;
        end
    end
end

endmodule
