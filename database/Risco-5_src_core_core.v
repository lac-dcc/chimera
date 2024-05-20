// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module Core #(
    parameter BOOT_ADDRESS=32'h00000000
) (
    // Control signal
    input wire clk,
    input wire halt,
    input wire reset,

    // Memory BUS
    input wire memory_response,
    output wire memory_read,
    output wire memory_write,
    output wire [2:0] option,
    input  wire [31:0] read_data,
    output wire [31:0] address,
    output wire [31:0] write_data,

    // Interrupções
    input wire interruption_request_external,
    input wire interruption_request_timer,
    input wire interruption_request_software,
    input wire [15:0] interruption_request_fast

    // RISCV FORMAL
`ifdef RISCV_FORMAL
    ,output reg 		      rvfi_valid = 1'b0,
    output reg [63:0] 	      rvfi_order = 64'd0,
    output reg [31:0] 	      rvfi_insn = 32'd0,
    output reg 		      rvfi_trap = 1'b0,
    output reg 		      rvfi_halt = 1'b0,
    output reg 		      rvfi_intr = 1'b0,
    output reg [1:0] 	      rvfi_mode = 2'b11,
    output reg [1:0] 	      rvfi_ixl = 2'b01,
    output reg [4:0] 	      rvfi_rs1_addr,
    output reg [4:0] 	      rvfi_rs2_addr,
    output reg [31:0] 	      rvfi_rs1_rdata,
    output reg [31:0] 	      rvfi_rs2_rdata,
    output reg [4:0] 	      rvfi_rd_addr,
    output reg [31:0] 	      rvfi_rd_wdata,
    output reg [31:0] 	      rvfi_pc_rdata,
    output reg [31:0] 	      rvfi_pc_wdata,
    output reg [31:0] 	      rvfi_mem_addr,
    output reg [3:0] 	      rvfi_mem_rmask,
    output reg [3:0] 	      rvfi_mem_wmask,
    output reg [31:0] 	      rvfi_mem_rdata,
    output reg [31:0] 	      rvfi_mem_wdata,
`endif
);

wire IRWrite, zero, reg_write, pc_load, and_zero_out,
    pc_write_cond, pc_write, is_immediate, csr_write_enable,
    alu_input_selector, save_address, control_memory_op,
    save_value, save_value_2, write_data_in, save_write_value;
wire [1:0] aluop, lorD;
wire [2:0] alu_src_a, alu_src_b, memory_to_reg, control_unit_memory_op;
wire [3:0] aluop_out, control_unit_aluop;
wire [31:0] pc_output, pc_input, register_input,
    alu_input_a, alu_input_b, alu_out, immediate, 
    register_data_1_out, register_data_2_out,
    csr_data_out, register_data_RD_out;
reg [31:0] instruction_register, memory_register, alu_out_register,
    register_data_1, register_data_2, pc_old, temp_address, temp_reg2,
    temp_reg3, temp_write_value;

assign write_data = (write_data_in == 1'b1)  ? temp_write_value : register_data_2_out;
assign option = (lorD == 2'b00 | control_memory_op == 1'b1) 
    ? control_unit_memory_op : instruction_register[14:12];

initial begin
    instruction_register = 32'h00000000;
    memory_register      = 32'h00000000;
    register_data_1      = 32'h00000000;
    register_data_2      = 32'h00000000;
    alu_out_register     = 32'h00000000;
    pc_old               = 32'h00000000;
    temp_address         = 32'h00000000;
    temp_reg2            = 32'h00000000;
    temp_write_value     = 32'h00000000;
end

PC Pc(
    .clk(clk),
    .reset(reset),
    .load(pc_load & memory_response),
    .Input(pc_input),
    .Output(pc_output)
);

MUX MemoryAddressMUX(
    .option({1'b0, lorD}),
    .A(pc_output),
    .B(alu_out_register),
    .C(temp_address),
    .D(0),
    .E(0),
    .F(0),
    .G(0),
    .H(0),
    .S(address)
);

MUX MemoryDataMUX(
    .option(memory_to_reg),
    .A(alu_out_register),
    .B(memory_register),
    .C(csr_data_out),
    .D({16'h0000, alu_out_register[15:0]}),
    .E({24'h000000, alu_out_register[7:0]}),
    .F({{16{alu_out_register[15]}}, alu_out_register[15:0]}),
    .G({{24{alu_out_register[7]}}, alu_out_register[7:0]}),
    .H(0),
    .S(register_input)
);

MUX AluInputAMUX(
    .option(alu_src_a),
    .A(pc_output),
    .B(register_data_1),
    .C(pc_old),
    .D(32'd0),
    .E(memory_register),
    .F(alu_out_register),
    .G(temp_address),
    .H(temp_reg2),
    .S(alu_input_a)
);

MUX AluInputBMUX(
    .option(alu_src_b),
    .A(register_data_2),
    .B(32'd4),
    .C(immediate),
    .D(register_data_RD_out),
    .E({27'h00000, temp_address[1:0], 3'h0}),
    .F({26'h00000, 3'b100 - temp_address[1:0], 3'h0}),
    .G(temp_reg3),
    .H({27'h00000, temp_address[1:0] + 1'b1, 3'h0}),
    .S(alu_input_b)
);

MUX PCSourceMUX(
    .option({2'b0, pc_source}),
    .A(alu_out),
    .B(alu_out_register),
    .C(0),
    .D(0),
    .E(0),
    .F(0),
    .G(0),
    .H(0),
    .S(pc_input)
);

Registers RegisterBank(
    .clk(clk),
    .reset(reset),
    .regWrite(reg_write),
    .readRegister1(instruction_register[19:15]),
    .readRegister2(instruction_register[24:20]),
    .writeRegister(instruction_register[11:7]),
    .writeData(register_input),
    .readData1(register_data_1_out),
    .readData2(register_data_2_out),
    .readDataRD(register_data_RD_out)
);

and(and_zero_out, zero, pc_write_cond);
or(pc_load, pc_write, and_zero_out);

Control_Unit Control_Unit(
    .clk(clk),
    .reset(reset),
    .last_bits(alu_out[1:0]),
    .last_bits_saved_address(temp_address[1:0]),
    .func3(instruction_register[14:12]),
    .instruction_opcode(instruction_register[6:0]),
    .pc_write_cond(pc_write_cond),
    .pc_write(pc_write),
    .lorD(lorD),
    .memory_read(memory_read),
    .memory_write(memory_write),
    .memory_to_reg(memory_to_reg),
    .ir_write(IRWrite),
    .pc_source(pc_source),
    .aluop(aluop),
    .alu_src_b(alu_src_b),
    .alu_src_a(alu_src_a),
    .reg_write(reg_write),
    .is_immediate(is_immediate),
    .csr_write_enable(csr_write_enable),
    .alu_input_selector(alu_input_selector),
    .control_unit_aluop(control_unit_aluop),
    .save_address(save_address),
    .control_unit_memory_op(control_unit_memory_op),
    .control_memory_op(control_memory_op),
    .save_value(save_value),
    .save_value_2(save_value_2),
    .write_data_in(write_data_in),
    .memory_response(memory_response),
    .save_write_value(save_write_value)
);

ALU_Control ALU_Control(
    .is_immediate(is_immediate),
    .aluop_in(aluop),
    .func7(instruction_register[31:25]),
    .func3(instruction_register[14:12]),
    .aluop_out(aluop_out)
);

wire [3:0] aluop_res;

assign aluop_res = (alu_input_selector == 1'b1) ? control_unit_aluop : aluop_out;

Alu Alu(
    .operation(aluop_res),
    .ALU_in_X(alu_input_a),
    .ALU_in_Y(alu_input_b),
    .ALU_out_S(alu_out),
    .ZR(zero)
);

Immediate_Generator Immediate_Generator(
    .instruction(instruction_register),
    .immediate(immediate)
);

CSR_Unit CSR_Unit(
    .clk(clk),
    .reset(reset),
    .func3(instruction_register[14:12]),
    .csr_immediate(instruction_register[19:15]),
    .csr_write_enable(csr_write_enable),
    .csr_address(immediate[11:0]),
    .csr_data_in(register_data_1),
    .csr_data_out(csr_data_out),
    .interruption_request_external(interruption_request_external),
    .interruption_request_timer(interruption_request_timer),
    .interruption_request_software(interruption_request_software),
    .interruption_request_fast(interruption_request_fast),
    .pc_value(pc_old)
);

always @(posedge clk ) begin
    if(reset == 1'b1) begin
        instruction_register <= 32'h00000000;
        memory_register <= 32'h00000000;
        register_data_1 <= 32'h00000000;
        register_data_2 <= 32'h00000000;
        alu_out_register <= 32'h00000000;
        pc_old <= 32'h00000000;
        temp_address <= 32'h00000000;
        temp_reg2 <= 32'h00000000;
        temp_reg3 <= 32'h00000000;
        temp_write_value <= 32'h00000000;
    end else begin
        if(IRWrite == 1'b1 && memory_response == 1'b1)begin
            instruction_register <= read_data;
            pc_old <= pc_output;
        end
        if(save_address == 1'b1) begin
            temp_address <= alu_out;
        end
        if(save_value == 1'b1) begin
            temp_reg2 <= memory_register;
        end
        if(save_value_2 == 1'b1) begin
            temp_reg3 <= alu_out_register;
        end
        if(save_write_value) begin
            temp_write_value <= alu_out;
        end
        
        memory_register <= read_data;
        register_data_1 <= register_data_1_out;
        register_data_2 <= register_data_2_out;
        alu_out_register <= alu_out;
    end
end
    
`ifdef RISCV_FORMAL
    assign rvfi_rs1_addr = instruction_register[19:15]
    assign rvfi_rs2_addr = instruction_register[24:20]
    assign rvfi_rs1_rdata = register_data_1_out;
    assign rvfi_rs2_rdata = register_data_2_out;
    assign rvfi_rd_addr = instruction_register[11:7];
    assign rvfi_rd_wdata = register_input;
    assign rvfi_pc_rdata = pc_output;
    assign rvfi_pc_wdata = pc_input;
    assign rvfi_mem_addr = address;
    assign rvfi_mem_rmask = {1'b0, option};
    assign rvfi_mem_wmask = {1'b0, option};
    assign rvfi_mem_rdata = read_data;
    assign rvfi_mem_wdata = write_data;
`endif

endmodule
