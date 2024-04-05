`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/01/2020 03:08:55 PM
// Design Name: 
// Module Name: cpu_testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module cpu_testbench;

reg clock = 0;
reg [19:0] ram_memory_address = 0;
reg should_write = 0;
reg [31:0] i_data;
wire [31:0] o_data;

// Control Unit
reg start_execution = 0;

always #5
begin
    clock <= ~clock;
end

rom rom_chip(
    .i_clock(clock),
    .i_memory_address(pc_out_inst_addr),
    .o_data(rom_out_data)
);

register ram_chip (
    .i_clock(clock),
    .i_sel(pc_out_inst_addr),
    .i_should_write(ram_should_write),
    .i_data(ram_in_data),
    .o_data(rom_out_data)
);

register register_chip(
    .i_clock(clock),
    .i_sel(reg_sel),
    .i_should_write(reg_should_write),
    .i_data(reg_in_data),
    .o_data(reg_out_data)
);

control_unit control_unit_chip(
    .i_clock(clock),
    .i_decode_en(decode_en_in),
    .i_alu_en(alu_en_in),
    .i_writer_en(writer_en_in),
    .i_fetch(fetch_en_in),
    .o_decode_en(decode_en_out),
    .o_alu_en(alu_en_out),
    .o_writer_en(writer_en_out),
    .o_fetch(fetch_en_out)
);
// turn off fetch chip once we're done
program_counter program_counter_chip(
    .i_clock(clock),
    .i_en(fetch_en_out),
    .i_next_inst_addr(inst_next_inst_addr),
    .i_should_jump(inst_should_jump),
    .i_should_reset(inst_should_reset),
    .o_done(pc_done),
    .o_instruction(pc_out_inst_addr)
);
assign fetch_en_in = ~pc_done;

decoder decode_chip(
    .i_clock(clock),
    .i_en(alu_en_out),
    .i_en(decode_en_out),
    .i_instruction(rom_out_data),
    .o_done(decoder_done),
    .o_opcode(inst_opcode),
    .o_condition(inst_condition),
    .o_next_instruction_address(inst_next_inst_addr),
    .o_should_jump(inst_should_jump),
    .o_data_a(inst_data_a),
    .o_data_b(inst_data_b),
    .o_should_reset(inst_should_reset),
    .o_start_execution(o_start_execution)
);
assign decode_en_in = ~decoder_done;

alu alu_chip(
    .i_clock(clock),
    .i_start_execution(start_execution),
    .i_opcode(inst_opcode),
    .i_condition(inst_condition),
    .i_data_a(inst_data_a),
    .i_data_b(inst_data_b),
    .o_done(alu_done),
    .o_data(alu_out_data)
);
assign alu_en_in = ~alu_done;

writer writer_chip(
    .i_clock(clock),
    .i_en(writer_en_out),
    .i_opcode(inst_opcode),
    .i_data_a(inst_data_a),
    .i_data_b(inst_data_b),
    .i_alu_out_data(alu_out_data),
    .o_done(writer_done),
    .o_reg_sel(reg_sel),
    .o_reg_should_write(reg_should_write),
    .o_reg_in_data(reg_in_data)
)
assign writer_en_in = ~writer_done;

// TODO: add cpu flags as registes. Ex: less_than_0, is_zero, ...
/*
initial
begin
    // Initially empty
    memory_address = 20'b00000000000000000000;
    #20    
    if (o_data != 32'b00000000000000000000000000000000)
    begin
        $display("Test failed :(");
    end
    
end
endmodule
*/