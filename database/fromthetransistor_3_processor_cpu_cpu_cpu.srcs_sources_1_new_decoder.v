`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2020 07:53:26 PM
// Design Name: 
// Module Name: decoder
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

/*
    .i_instruction(rom_out_data),
    .o_opcode(inst_opcode),
    .o_condition(inst_condition),
    .o_next_instruction_address(inst_next_inst_addr),
    .o_should_jump(inst_should_jump),
    .o_data_a(inst_data_a),
    .o_data_b(inst_data_b),
    .o_should_write_reg(inst_should_write_reg),
    .o_should_write_mem(inst_should_write_mem),
    .o_dest_register(inst_dest_register),
    .o_dest_mem_address(inst_dest_mem_address),
    .o_should_reset(inst_should_reset),
    .o_imm_value(inst_imm_value)

*/
module decoder(
    input wire i_clock,
    input wire i_en,
    input wire [31:0] i_instruction,
    input wire i_ram_out_data,
    output reg o_done,
    output reg o_opcode,
    output reg o_ram_addr,
    output reg o_condition,
    output reg o_next_instruction_address,
    output reg o_should_jump,
    output reg o_data_a,
    output reg o_data_b,
    output reg o_dest_addr,
    output reg o_should_reset
);
    
localparam add_imm_opcode = 7'b0010100;

reg is_reading = 0;

localparam START = 00;
localparam READING = 01;
localparam DONE = 10;

reg state = START;

reg [31:0] source_reg = 0;
reg dest_reg = 0;

reg opcode = 0;
reg condition = 0;
reg data_a = 0;
reg data_b = 0;

always @(posedge i_clock)
begin
// START DECODING
    if (i_en)
    begin
        case (state)
            START:
            begin
              case (i_instruction[10:4])
                    /*
                    ADD imm
                    1110 0010100 0 0000 0000 000000000000
                    ____ _______ _ ____ ____ ____________
                    cond inst    s rn   rd   imm
                    */
                    add_imm_opcode:
                    begin
                        opcode <= i_instruction[10:4];
                        condition <= i_instruction[3:0];
                        data_b <= i_instruction[31:20]; // imm value
                        condition <= i_instruction[3:0];
                        source_reg <= i_instruction[15:12];
                        dest_reg <= i_instruction[19:16];
                        
                        state <= READING;
                    end // add_imm_opcode
                endcase // case (i_instruction[10:4])
            end // START

            READING:
            begin
                case (opcode)
                    add_imm_opcode:
                    begin
                        // fetch a
                        if (o_ram_addr != source_reg)
                        begin
                            o_ram_addr <= source_reg;
                        end // if
                        else
                        begin
                            data_a <= i_ram_out_data;
                            state <= DONE;
                        end // else
                    end // add_imm_opcode:
                endcase // case (o_inst_opcode)
            end // READING

            DONE:
            begin
                case (i_instruction[10:14])
                    add_imm_opcode:
                    begin
                        o_opcode <= opcode;
                        o_data_a <= data_a;
                        o_data_b <= data_b;
                        o_condition <= condition;
                        o_dest_addr <= dest_reg;
                        o_done <= 1;
                        state = START;
                    end // add_imm_opcode;
                endcase // case (i_instruction[10:14])
            end // DONE
        endcase // case (STATE)
    end // if(i_en)
end // always
endmodule

