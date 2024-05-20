// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module Control_Unit (
    input wire clk,
    input wire reset,
    input wire memory_response,
    input wire [1:0] last_bits,
    input wire [1:0] last_bits_saved_address,
    input wire [2:0] func3,
    input wire [6:0] instruction_opcode,
    output reg pc_write,
    output reg ir_write,
    output reg pc_source,
    output reg reg_write,
    output reg memory_read,
    output reg is_immediate,
    output reg memory_write,
    output reg pc_write_cond,
    output reg csr_write_enable,
    output reg alu_input_selector,
    output reg save_address,
    output reg save_value,
    output reg save_value_2,
    output reg save_write_value,
    output reg control_memory_op,
    output reg write_data_in,
    output reg [1:0] lorD,
    output reg [1:0] aluop,
    output reg [2:0] alu_src_a,
    output reg [2:0] alu_src_b,
    output reg [2:0] memory_to_reg,
    output reg [2:0] control_unit_memory_op,
    output reg [3:0] control_unit_aluop
);

// machine states
localparam FETCH              = 6'b000000;
localparam DECODE             = 6'b000001;
localparam MEMADR             = 6'b000010;
localparam MEMREAD            = 6'b000011;
localparam MEMWB              = 6'b000100;
localparam MEMWRITE           = 6'b000101;
localparam EXECUTER           = 6'b000110;
localparam ALUWB              = 6'b000111;
localparam EXECUTEI           = 6'b001000;
localparam JAL                = 6'b001001;
localparam BEQ                = 6'b001010;
localparam JALR               = 6'b001011;
localparam AUIPC              = 6'b001100;
localparam LUI                = 6'b001101;
localparam JALR_PC            = 6'b001110;
localparam EXECUTECSR         = 6'b001111;
localparam LOAD_FIRST_BLOCK   = 6'b010000;
localparam SAVE_FIRST_BLOCK   = 6'b010001;
localparam CALC_NEXT_ADDRESS  = 6'b010010;
localparam READ_SECOND_BLOCK  = 6'b010011;
localparam LOAD_SECOND_BLOCK  = 6'b010100;
localparam MERGE_BLOCKS       = 6'b010101;
localparam MEMREAD_UNALIGNED  = 6'b010110;
localparam FILTER_ALU_WB      = 6'b010111;
localparam MEMWRITE_UNALIGNED = 6'b011000;
localparam GEN_FIRST_BLOCK_PART_1 = 6'b011001;
localparam GEN_FIRST_BLOCK_PART_2 = 6'b011010;
localparam GEN_SECOND_BLOCK_PART_1 = 6'b011011;
localparam GEN_SECOND_BLOCK_PART_2 = 6'b011100;
localparam MERGE_WRITE_BLOCKS = 6'b011101;
localparam SWAP_VALUE_DIRECTION = 6'b011110;
localparam CLEAR_VALUE = 6'b011111;
localparam MERGE_WRITE_VALUE_1 = 6'b100000;
localparam WRITE_VALUE_1 = 6'b100001;
localparam CLEAR_VALUE_HALF_BYTE_ONE_BLOCK = 6'b100010;
localparam CLEAR_VALUE_HALF_BYTE_ONE_BLOCK_2 = 6'b100011;
localparam CLEAR_VALUE_HALF_BYTE_ONE_BLOCK_3 = 6'b100100;
localparam CALC_SECOND_BLOCK_ADDRESS_TO_WRITE = 6'b100101;
localparam READ_SECOND_BLOCK_TO_WRITE = 6'b100110;
localparam LOAD_SECOND_BLOCK_TO_WRITE = 6'b100111;
localparam LOAD_SECOND_BLOCK_TO_WRITE_2 = 6'b101000;
localparam SWAP_VALUE_DIRECTION_2 = 6'b101001;
localparam CLEAR_VALUE_PART_2 = 6'b101010;
localparam CLEAR_VALUE_PART_2_1 = 6'b101011;
localparam MERGE_WRITE_VALUE_2 = 6'b101100;
localparam WRITE_VALUE_2 = 6'b101101;

// Instruction Opcodes
localparam LW     = 7'b0000011;
localparam SW     = 7'b0100011;
localparam RTYPE  = 7'b0110011;
localparam ITYPE  = 7'b0010011;
localparam JALI   = 7'b1101111;
localparam BEQI   = 7'b1100011;
localparam JALRI  = 7'b1100111;
localparam AUIPCI = 7'b0010111;
localparam LUII   = 7'b0110111;
localparam CSR    = 7'b1110011;

wire unaligned;
wire [2:0] second_block_write_src_b;
reg [2:0] wb_filter, clear_hal_byte_one_block_option, 
    clear_hal_byte_one_block_option_2;
reg [5:0] state, nextstate;

assign unaligned = |last_bits;
assign second_block_write_src_b = (func3[0] == 1) ? 3'b101 : 3'b111 ;

initial begin
    state = 6'b000000;
    nextstate = 6'b000000;
    pc_write_cond = 1'b0;
    pc_write = 1'b0;
    lorD = 2'b00;
    memory_read = 1'b0;
    memory_write = 1'b0;
    memory_to_reg = 3'b000;
    ir_write = 1'b0;
    pc_source = 1'b0;
    aluop = 2'b00;
    alu_src_b = 3'b000;
    alu_src_a = 3'b000;
    reg_write = 1'b0;
    is_immediate = 1'b0;
    csr_write_enable = 1'b0;
    alu_input_selector = 1'b0;
    control_unit_aluop = 4'h0;
    save_address = 1'b0;
    control_unit_memory_op = 3'b010;
    control_memory_op = 1'b0;
    save_value = 1'b0;
    save_value_2 = 1'b0;
    write_data_in = 1'b0;
    clear_hal_byte_one_block_option = 1'b0;
    clear_hal_byte_one_block_option_2 = 1'b0;
    save_write_value = 1'b0;
end

always @(posedge clk ) begin
    if(reset) begin
        state <= FETCH;
    end else begin
        state <= nextstate;
    end
end

always @(*) begin
    nextstate = FETCH;
    case (state)
        FETCH: begin
            if(memory_response) begin
                nextstate = DECODE;
            end else begin
                nextstate = FETCH;
            end
        end
        DECODE: begin
            case (instruction_opcode)
                LW: nextstate = MEMADR;
                SW: nextstate = MEMADR;
                RTYPE: nextstate = EXECUTER;
                ITYPE: nextstate = EXECUTEI;
                JALI: nextstate = JAL;
                BEQI: nextstate = BEQ;
                AUIPCI: nextstate = AUIPC;
                LUII: nextstate = LUI;
                JALRI: nextstate = JALR_PC;
                CSR: nextstate = EXECUTECSR;
            endcase
        end
        MEMADR: begin
            if(instruction_opcode == LW)
                if(unaligned == 1'b1) begin
                    nextstate = MEMREAD_UNALIGNED;
                end else begin
                    nextstate = MEMREAD;
                end
            else
                if(unaligned == 1'b1) begin
                    nextstate = MEMWRITE_UNALIGNED;
                end else begin
                    nextstate = MEMWRITE;
                end
        end
        MEMREAD: begin
            if(memory_response)
                nextstate = MEMWB;
            else
                nextstate = MEMREAD;
        end
        MEMREAD_UNALIGNED: begin
            if(memory_response) begin
                nextstate = LOAD_FIRST_BLOCK;
            end else begin
                nextstate = MEMREAD_UNALIGNED;
            end
        end
        MEMWB: nextstate = FETCH;
        MEMWRITE: begin
            if(memory_response)
                nextstate = FETCH;
            else
                nextstate = MEMWRITE;
        end
        EXECUTER: nextstate = ALUWB;
        ALUWB: nextstate = FETCH;
        EXECUTEI: nextstate = ALUWB;
        JAL: nextstate = ALUWB;
        BEQ: nextstate = FETCH;
        JALR_PC: nextstate = JALR;
        JALR: nextstate = ALUWB;
        AUIPC: nextstate = ALUWB;
        LUI: nextstate = ALUWB;
        EXECUTECSR: nextstate = FETCH;
        LOAD_FIRST_BLOCK: nextstate = SAVE_FIRST_BLOCK;
        SAVE_FIRST_BLOCK: begin
            if(func3[1] == 1'b1 || (func3[0] == 1'b1 && last_bits_saved_address == 2'b11)) begin
                nextstate = CALC_NEXT_ADDRESS;
            end else begin
                nextstate = FETCH;
            end
        end
        FILTER_ALU_WB: nextstate = FETCH;
        CALC_NEXT_ADDRESS: nextstate = READ_SECOND_BLOCK;
        READ_SECOND_BLOCK: begin
            if(memory_response) begin
                nextstate = LOAD_SECOND_BLOCK;
            end else begin
                nextstate = READ_SECOND_BLOCK;
            end
        end
        LOAD_SECOND_BLOCK: nextstate = MERGE_BLOCKS;
        MERGE_BLOCKS: nextstate = FILTER_ALU_WB;
        MEMWRITE_UNALIGNED: begin
            if(memory_response) begin
                nextstate = GEN_FIRST_BLOCK_PART_1;
            end else begin
                nextstate = MEMWRITE_UNALIGNED;
            end
        end
        GEN_FIRST_BLOCK_PART_1: nextstate = GEN_FIRST_BLOCK_PART_2;
        GEN_FIRST_BLOCK_PART_2: begin
            if((func3 == 3'b000 && ~(&last_bits_saved_address)) || 
            (func3[0] == 1'b1 & last_bits_saved_address == 2'b01)) begin
                nextstate = GEN_SECOND_BLOCK_PART_1;
            end else begin
                nextstate = SWAP_VALUE_DIRECTION;
            end
        end
        GEN_SECOND_BLOCK_PART_1: nextstate = GEN_SECOND_BLOCK_PART_2;
        GEN_SECOND_BLOCK_PART_2: nextstate = MERGE_WRITE_BLOCKS;
        MERGE_WRITE_BLOCKS: nextstate = SWAP_VALUE_DIRECTION;
        SWAP_VALUE_DIRECTION: begin
            if((func3[1:0] == 2'b00 && ^last_bits_saved_address) ||
                (func3[0] == 1'b1 && last_bits_saved_address == 2'b01)
            )begin
                nextstate = CLEAR_VALUE_HALF_BYTE_ONE_BLOCK;
            end else begin
                nextstate = CLEAR_VALUE;
            end
        end
        CLEAR_VALUE: nextstate = MERGE_WRITE_VALUE_1;
        CLEAR_VALUE_HALF_BYTE_ONE_BLOCK: nextstate = CLEAR_VALUE_HALF_BYTE_ONE_BLOCK_2;
        CLEAR_VALUE_HALF_BYTE_ONE_BLOCK_2: begin
            if(func3[0] == 1'b0 && last_bits_saved_address[1] == 1'b1) begin
                nextstate = CLEAR_VALUE_HALF_BYTE_ONE_BLOCK_3;
            end else begin
                nextstate = MERGE_WRITE_VALUE_1;
            end
        end
        CLEAR_VALUE_HALF_BYTE_ONE_BLOCK_3: nextstate = MERGE_WRITE_VALUE_1;
        MERGE_WRITE_VALUE_1: nextstate = WRITE_VALUE_1;
        WRITE_VALUE_1: begin
            if(memory_response) begin
                if(func3 == 3'b010 || (func3 == 3'b001 && last_bits_saved_address == 2'b11)) begin
                    nextstate = CALC_SECOND_BLOCK_ADDRESS_TO_WRITE;
                end else begin
                    nextstate = FETCH;
                end
            end else begin
                nextstate = WRITE_VALUE_1;
            end
        end
        CALC_SECOND_BLOCK_ADDRESS_TO_WRITE: nextstate = READ_SECOND_BLOCK_TO_WRITE;
        READ_SECOND_BLOCK_TO_WRITE: begin
            if(memory_response) begin
                nextstate = LOAD_SECOND_BLOCK_TO_WRITE;
            end else begin
                nextstate = READ_SECOND_BLOCK_TO_WRITE;
            end
        end
        LOAD_SECOND_BLOCK_TO_WRITE: nextstate = LOAD_SECOND_BLOCK_TO_WRITE_2;
        LOAD_SECOND_BLOCK_TO_WRITE_2: nextstate = SWAP_VALUE_DIRECTION_2;
        SWAP_VALUE_DIRECTION_2: nextstate = CLEAR_VALUE_PART_2;
        CLEAR_VALUE_PART_2: nextstate = CLEAR_VALUE_PART_2_1;
        CLEAR_VALUE_PART_2_1: nextstate = MERGE_WRITE_VALUE_2;
        MERGE_WRITE_VALUE_2: nextstate = WRITE_VALUE_2;
        WRITE_VALUE_2: begin
            if(memory_response) begin
                nextstate = FETCH;
            end else begin
                nextstate = WRITE_VALUE_2;
            end
        end
        default: nextstate = FETCH;
    endcase
end

always @(*) begin
    pc_write_cond       <= 1'b0;
    pc_write            <= 1'b0;
    ir_write            <= 1'b0;
    lorD                <= 2'b00;
    memory_read         <= 1'b0;
    memory_write        <= 1'b0;
    memory_to_reg       <= 3'b000;
    pc_source           <= 1'b0;
    aluop               <= 2'b00;
    alu_src_b           <= 3'b000;
    alu_src_a           <= 3'b000;
    reg_write           <= 1'b0;
    is_immediate        <= 1'b0;
    csr_write_enable    <= 1'b0;
    alu_input_selector  <= 1'b0;
    control_unit_aluop  <= 4'h0;
    save_address        <= 1'b0;
    control_unit_memory_op <= 3'b010;
    control_memory_op <= 1'b0;
    save_value <= 1'b0;
    save_value_2 <= 1'b0;
    write_data_in <= 1'b0;
    save_write_value <= 1'b0;

    case (state)
        FETCH: begin
            memory_read <= 1'b1;
            alu_src_b   <= 3'b001;
            ir_write    <= 1'b1;
            pc_write    <= 1'b1;
        end

        DECODE: begin
            alu_src_a <= 3'b010;
            alu_src_b <= 3'b010;
        end

        MEMADR: begin
            alu_src_a <= 3'b001;
            alu_src_b <= 3'b010;
            save_address <= 1'b1;
        end
        
        MEMREAD: begin
            memory_read <= 1'b1;
            lorD        <= 2'b10;
        end

        MEMREAD_UNALIGNED: begin
            control_memory_op <= 1'b1;
            memory_read       <= 1'b1;
            lorD              <= 2'b10;
        end

        MEMWB: begin
            reg_write     <= 1'b1;
            memory_to_reg <= 3'b001;
        end

        LOAD_FIRST_BLOCK: begin
            alu_src_a          <= 3'b100;
            alu_src_b          <= 3'b100;
            control_unit_aluop <= 4'b1001;
            alu_input_selector <= 1'b1;
        end

        SAVE_FIRST_BLOCK: begin
            reg_write     <= 1'b1;
            memory_to_reg <= wb_filter;
        end

        CALC_NEXT_ADDRESS: begin
            save_address <= 1'b1;
            alu_src_a <= 3'b110;
            alu_src_b <= 3'b001;
        end

        READ_SECOND_BLOCK: begin
            memory_read <= 1'b1;
            lorD        <= 2'b10;
            control_memory_op <= 1'b1;
        end

        LOAD_SECOND_BLOCK: begin
            alu_src_a          <= 3'b100;
            alu_src_b          <= 3'b101;
            control_unit_aluop <= 4'b1000;
            alu_input_selector <= 1'b1;
        end

        MERGE_BLOCKS: begin
            alu_src_a          <= 3'b101;
            alu_src_b          <= 3'b011;
        end

        MEMWRITE: begin
            memory_write <= 1'b1;
            lorD         <= 2'b10;
        end

        MEMWRITE_UNALIGNED: begin
            control_memory_op <= 1'b1;
            memory_read       <= 1'b1;
            lorD              <= 2'b10;
        end

        GEN_FIRST_BLOCK_PART_1: begin
            alu_src_a          <= 3'b100;
            alu_src_b          <= 3'b101;
            control_unit_aluop <= 4'b1000;
            alu_input_selector <= 1'b1;
            save_value        <= 1'b1;
        end

        GEN_FIRST_BLOCK_PART_2: begin
            save_value_2 <= 1'b1;
            alu_src_a          <= 3'b101;
            alu_src_b          <= 3'b101;
            control_unit_aluop <= 4'b1001;
            alu_input_selector <= 1'b1;
        end

        GEN_SECOND_BLOCK_PART_1: begin
            save_value_2 <= 1'b1;
            alu_src_a <= 3'b111;
            alu_src_b <= second_block_write_src_b;
            control_unit_aluop <= 4'b1001;
            alu_input_selector <= 1'b1;
        end

        GEN_SECOND_BLOCK_PART_2: begin
            alu_src_a <= 3'b101;
            alu_src_b <= second_block_write_src_b;
            control_unit_aluop <= 4'b1000;
            alu_input_selector <= 1'b1;
        end

        MERGE_WRITE_BLOCKS: begin
            alu_src_a <= 3'b101;
            alu_src_b <= 3'b110;
        end

        SWAP_VALUE_DIRECTION: begin
            save_value_2 <= 1'b1;
            alu_src_a <= 3'b011;
            alu_src_b <= 3'b000;
        end

        CLEAR_VALUE: begin
            alu_src_a <= 3'b101;
            alu_src_b <= 3'b100;
            control_unit_aluop <= 4'b1000;
            alu_input_selector <= 1'b1;
        end

        CLEAR_VALUE_HALF_BYTE_ONE_BLOCK: begin
            alu_src_a <= 3'b101;
            alu_src_b <= clear_hal_byte_one_block_option;
            control_unit_aluop <= 4'b1000;
            alu_input_selector <= 1'b1;
        end

        CLEAR_VALUE_HALF_BYTE_ONE_BLOCK_2: begin
            alu_src_a <= 3'b101;
            alu_src_b <= clear_hal_byte_one_block_option_2;
            control_unit_aluop <= 4'b1001;
            alu_input_selector <= 1'b1;
        end

        CLEAR_VALUE_HALF_BYTE_ONE_BLOCK_3: begin
            alu_src_a <= 3'b101;
            alu_src_b <= clear_hal_byte_one_block_option_2;
            control_unit_aluop <= 4'b1001;
            alu_input_selector <= 1'b1;
        end

        MERGE_WRITE_VALUE_1: begin
            alu_src_a <= 3'b101;
            alu_src_b <= 3'b110;
            save_write_value <= 1'b1;
        end

        WRITE_VALUE_1: begin
            memory_write  <= 1'b1;
            lorD          <= 2'b10;
            write_data_in <= 1'b1;
            control_memory_op <= 1'b1;
        end

        CALC_SECOND_BLOCK_ADDRESS_TO_WRITE: begin
            alu_src_a <= 3'b110;
            alu_src_b <= 3'b001;
            save_address <= 1'b1;
        end

        READ_SECOND_BLOCK_TO_WRITE: begin
            memory_read <= 1'b1;
            lorD        <= 2'b10;
            control_memory_op <= 1'b1;
        end

        LOAD_SECOND_BLOCK_TO_WRITE: begin
            alu_src_a          <= 3'b100;
            alu_src_b          <= (func3[1] == 1'b1) ? 3'b100 : 101;
            control_unit_aluop <= 4'b1001;
            alu_input_selector <= 1'b1;
        end

        LOAD_SECOND_BLOCK_TO_WRITE_2: begin
            alu_src_a          <= 3'b101;
            alu_src_b          <= (func3[1] == 1'b1) ? 3'b100 : 101;
            control_unit_aluop <= 4'b1000;
            alu_input_selector <= 1'b1;
        end

        SWAP_VALUE_DIRECTION_2: begin
            save_value_2 <= 1'b1;
            alu_src_a <= 3'b011;
            alu_src_b <= 3'b000;
        end

        CLEAR_VALUE_PART_2: begin
            alu_src_a          <= 3'b101;
            alu_src_b          <= (func3[1] == 1'b1) ? 3'b101 : 100;
            control_unit_aluop <= 4'b1000;
            alu_input_selector <= 1'b1;
        end

        CLEAR_VALUE_PART_2_1: begin
            alu_src_a          <= 3'b101;
            alu_src_b          <= (func3[1] == 1'b1) ? 3'b101 : 100;
            control_unit_aluop <= 4'b1001;
            alu_input_selector <= 1'b1;
        end

        MERGE_WRITE_VALUE_2: begin
            save_write_value <= 1'b1;
            alu_src_a <= 3'b101;
            alu_src_b <= 3'b110;
        end

        WRITE_VALUE_2: begin
            memory_write  <= 1'b1;
            lorD          <= 2'b10;
            write_data_in <= 1'b1;
            control_memory_op <= 1'b1;
        end

        EXECUTER: begin
            alu_src_a <= 3'b001;
            aluop     <= 2'b10;
        end

        ALUWB: begin
            reg_write <= 1'b1;
        end

        FILTER_ALU_WB: begin
            reg_write <= 1'b1;
            memory_to_reg <= wb_filter;
        end

        EXECUTEI: begin
            alu_src_a   <= 3'b001;
            alu_src_b   <= 3'b010;
            aluop        <= 2'b10;
            is_immediate <= 1'b1;
        end

        JAL: begin
            alu_src_a <= 3'b010;
            alu_src_b <= 3'b001; // 01
            pc_write  <= 1'b1;
            pc_source <= 1'b1;
        end

        BEQ: begin
            alu_src_a     <= 3'b001;
            aluop         <= 2'b01;
            pc_write_cond <= 1'b1;
            pc_source     <= 1'b1;
        end

        JALR_PC: begin // Ciclo intermediario para calcular o endereço a ser gravado no PC
            alu_src_a <= 3'b001;
            alu_src_b <= 3'b010;
        end

        JALR: begin
            alu_src_a    <= 3'b010;
            alu_src_b    <= 3'b001; // 01
            pc_write     <= 1'b1;
            pc_source    <= 1'b1;
            is_immediate <= 1'b1;
        end

        AUIPC: begin
            alu_src_a <= 3'b010;
            alu_src_b <= 3'b010;
        end

        LUI: begin
            alu_src_a <= 3'b011;
            alu_src_b <= 3'b010;
        end

        EXECUTECSR: begin
            reg_write        <= 1'b1;
            memory_to_reg    <= 3'b010;
            csr_write_enable <= 1'b1;
        end
    endcase
end

always @(*) begin
    case (func3)
        3'b100: wb_filter <= 3'b100;
        3'b101: wb_filter <= 3'b011;
        3'b000: wb_filter <= 3'b110;
        3'b001: wb_filter <= 3'b101;
        default: wb_filter <= 3'b000;
    endcase
end

always @(*) begin
    case ({func3[0], last_bits_saved_address})
        3'b010: begin
            clear_hal_byte_one_block_option <= 3'b111;
            clear_hal_byte_one_block_option_2 <= 3'b001;
        end
        3'b001: begin
            clear_hal_byte_one_block_option <= 3'b101;
            clear_hal_byte_one_block_option_2 <= 3'b111;
        end 
        3'b101: begin
            clear_hal_byte_one_block_option <= 3'b111;
            clear_hal_byte_one_block_option_2 <= 3'b100;
        end
        default: begin
            clear_hal_byte_one_block_option <= 3'b100;
            clear_hal_byte_one_block_option_2 <= 3'b000;
        end 
    endcase
end
    
endmodule
