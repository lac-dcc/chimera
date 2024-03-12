`include "defines.v"

module mem(
    input  wire                      reset,

    input  wire[`ALUOpBus]           aluop_input,
    input  wire[`RegisterBus]        memory_address_input,
    input  wire[`RegisterBus]        reg2_input,

    input  wire[`RegisterBus]        memory_data_input,

    input  wire[`RegisterAddressBus] write_reg_address_input,
    input  wire                      write_reg_enable_input,
    input  wire[`RegisterBus]        write_reg_data_input,
    
    input  wire[`RegisterBus]        hi_input,
    input  wire[`RegisterBus]        lo_input,
    input  wire                      whilo_input,

    input  wire                      LLbit_input,
    input  wire                      wb_LLbit_write_enable_input,
    input  wire                      wb_LLbit_input,

    input  wire                      cp0_reg_write_enable_input,
    input  wire[4:0]                 cp0_reg_write_address_input,
    input  wire[`RegisterBus]        cp0_reg_data_input,

    input  wire[31:0]                exception_type_input,
    input  wire                      is_in_delay_slot_input,
    input  wire[`RegisterBus]        current_instruction_address_input,

    input  wire[`RegisterBus]        cp0_status_input,
    input  wire[`RegisterBus]        cp0_cause_input,
    input  wire[`RegisterBus]        cp0_epc_input,

    input  wire                      wb_cp0_reg_write_enable,
    input  wire[4:0]                 wb_cp0_reg_write_address,
    input  wire[`RegisterBus]        wb_cp0_reg_data,

    output reg[`RegisterAddressBus]  write_reg_address_output,
    output reg                       write_reg_enable_output,
    output reg[`RegisterBus]         write_reg_data_output,

    output reg[`RegisterBus]         hi_output,
    output reg[`RegisterBus]         lo_output,
    output reg                       whilo_output,

    output reg[`RegisterBus]         memory_address_output,
    output wire                      memory_write_enable_output,
    output reg[3:0]                  memory_sel_output,
    output reg[`RegisterBus]         memory_data_output,
    output reg                       memory_chip_enable_output,

    output reg                       LLbit_write_enable_output,
    output reg                       LLbit_output,

    output reg                       cp0_reg_write_enable_output,
    output reg[4:0]                  cp0_reg_write_address_output,
    output reg[`RegisterBus]         cp0_reg_data_output,
 
    output reg[31:0]                 exception_type_output,
    output wire[`RegisterBus]        cp0_epc_output,
    output wire                      is_in_delay_slot_output,
 
    output wire[`RegisterBus]        current_instruction_address_output
);

    reg               LLbit;
    reg[`RegisterBus] cp0_status;
    reg[`RegisterBus] cp0_cause;
    reg[`RegisterBus] cp0_epc;
    reg               mem_write_enable;

    assign is_in_delay_slot_output = is_in_delay_slot_input;
    assign current_instruction_address_output = current_instruction_address_input;

    always @ (*) begin
        if (reset == `ResetEnable) begin
            cp0_status <= `ZeroWord;
        end else if ((wb_cp0_reg_write_enable == `WriteEnable) &&
                    (wb_cp0_reg_write_address == `CP0_REG_STATUS)) begin
            cp0_status <= wb_cp0_reg_data;
        end else begin
            cp0_status <= cp0_status_input;
        end
    end

    always @ (*) begin
        if (reset == `ResetEnable) begin
            cp0_epc <= `ZeroWord;
        end else if ((wb_cp0_reg_write_enable == `WriteEnable) &&
                    (wb_cp0_reg_write_address == `CP0_REG_EPC)) begin
            cp0_epc <= wb_cp0_reg_data;
        end else begin
            cp0_epc <= cp0_epc_input;
        end
    end

    assign cp0_epc_output = cp0_epc;

    always @ (*) begin
        if (reset == `ResetEnable) begin
            cp0_cause <= `ZeroWord;
        end else if ((wb_cp0_reg_write_enable == `WriteEnable) &&
                    (wb_cp0_reg_write_address == `CP0_REG_CAUSE)) begin
            cp0_cause[9:8] <= wb_cp0_reg_data[9:8];
            cp0_cause[22] <= wb_cp0_reg_data[22];
            cp0_cause[23] <= wb_cp0_reg_data[23];
        end else begin
            cp0_cause <= cp0_cause_input;
        end
    end

    always @ (*) begin
        if (reset == `ResetEnable) begin
            exception_type_output <= `ZeroWord;
        end else begin
            exception_type_output <= `ZeroWord;
            if (current_instruction_address_input != `ZeroWord) begin
                if (((cp0_cause[15:8] & cp0_status[15:8]) != 8'h00) &&
                    (cp0_status[1] == 1'b0) &&
                    (cp0_status[0] == 1'b1)) begin
                    exception_type_output <= 32'h00000001;
                end else if (exception_type_input[8] == 1'b1) begin
                    exception_type_output <= 32'h00000008;
                end else if (exception_type_input[9] == 1'b1) begin
                    exception_type_output <= 32'h0000000a;
                end else if (exception_type_input[10] == 1'b1) begin
                    exception_type_output <= 32'h0000000d;
                end else if (exception_type_input[11] == 1'b1) begin
                    exception_type_output <= 32'h0000000c;
                end else if (exception_type_input[12] == 1'b1) begin
                    exception_type_output <= 32'h0000000e;
                end
            end
        end
    end

    assign memory_write_enable_output = mem_write_enable & (~(|exception_type_output));

    always @ (*) begin
        if (reset == `ResetEnable) begin
            LLbit <= 1'b0;
        end else begin
            if (wb_LLbit_write_enable_input == 1'b1) begin
                LLbit <= wb_LLbit_input;
            end else begin
                LLbit <= LLbit_input;
            end
        end
    end

    always @ (*) begin
        if (reset == `ResetEnable) begin
            write_reg_address_output <= `NOPRegisterAddress;
            write_reg_enable_output <= `WriteDisable;
            write_reg_data_output <= `ZeroWord;
            hi_output <= `ZeroWord;
            lo_output <= `ZeroWord;
            whilo_output <= `WriteDisable;
            memory_address_output <= `ZeroWord;
            mem_write_enable <= `WriteDisable;
            memory_sel_output <= 4'b0000;
            memory_data_output <= `ZeroWord;
            memory_chip_enable_output <= `ChipDisable;
            LLbit_write_enable_output <= 1'b0;
            LLbit_output <= 1'b0;
            cp0_reg_write_enable_output <= `WriteDisable;
            cp0_reg_write_address_output <= 5'b00000;
            cp0_reg_data_output <= `ZeroWord;
        end else begin
            write_reg_address_output <= write_reg_address_input;
            write_reg_enable_output <= write_reg_enable_input;
            write_reg_data_output <= write_reg_data_input;
            hi_output <= hi_input;
            lo_output <= lo_input;
            whilo_output <= whilo_input;
            LLbit_write_enable_output <= 1'b0;
            LLbit_output <= 1'b0;
            memory_address_output <= `ZeroWord;
            mem_write_enable <= `WriteDisable;
            memory_sel_output <= 4'b1111;
            memory_chip_enable_output <= `ChipDisable;
            cp0_reg_write_enable_output <= cp0_reg_write_enable_input;
            cp0_reg_write_address_output <= cp0_reg_write_address_input;
            cp0_reg_data_output <= cp0_reg_data_input;
            case (aluop_input)
                `EXE_LB_OP: begin
                    memory_address_output <= memory_address_input;
                    mem_write_enable <= `WriteDisable;
                    memory_chip_enable_output <= `ChipEnable;
                    case (memory_address_input[1:0])
                        2'b00: begin
                            write_reg_data_output <= {{24{memory_data_input[31]}}, memory_data_input[31:24]};
                            memory_sel_output <= 4'b1000;
                        end
                        2'b01: begin
                            write_reg_data_output <= {{24{memory_data_input[23]}}, memory_data_input[23:16]};
                            memory_sel_output <= 4'b0100;
                        end
                        2'b10: begin
                            write_reg_data_output <= {{24{memory_data_input[15]}}, memory_data_input[15:8]};
                            memory_sel_output <= 4'b0010;
                        end
                        2'b11: begin
                            write_reg_data_output <= {{24{memory_data_input[7]}}, memory_data_input[7:0]};
                            memory_sel_output <= 4'b0001;
                        end
                        default: begin
                            write_reg_data_output <= `ZeroWord;
                        end
                    endcase
                end
                `EXE_LBU_OP: begin
                    memory_address_output <= memory_address_input;
                    mem_write_enable <= `WriteDisable;
                    memory_chip_enable_output <= `ChipEnable;
                    case (memory_address_input[1:0])
                        2'b00: begin
                            write_reg_data_output <= {{24{1'b0}}, memory_data_input[31:24]};
                            memory_sel_output <= 4'b1000;
                        end
                        2'b01: begin
                              write_reg_data_output <= {{24{1'b0}}, memory_data_input[23:16]};
                            memory_sel_output <= 4'b0100;
                        end
                        2'b10: begin
                              write_reg_data_output <= {{24{1'b0}}, memory_data_input[15:8]};
                            memory_sel_output <= 4'b0010;
                        end
                        2'b11: begin
                              write_reg_data_output <= {{24{1'b0}}, memory_data_input[7:0]};
                            memory_sel_output <= 4'b0001;
                        end
                        default: begin
                            write_reg_data_output <= `ZeroWord;
                        end
                    endcase
                end
                `EXE_LH_OP: begin
                    memory_address_output <= memory_address_input;
                    mem_write_enable <= `WriteDisable;
                    memory_chip_enable_output <= `ChipEnable;
                    case (memory_address_input[1:0])
                        2'b00: begin
                            write_reg_data_output <= {{16{memory_data_input[31]}}, memory_data_input[31:16]};
                            memory_sel_output <= 4'b1100;
                        end
                        2'b10: begin
                              write_reg_data_output <= {{16{memory_data_input[15]}}, memory_data_input[15:0]};
                            memory_sel_output <= 4'b0011;
                        end
                        default: begin
                            write_reg_data_output <= `ZeroWord;
                        end
                    endcase
                end
                `EXE_LHU_OP: begin
                    memory_address_output <= memory_address_input;
                    mem_write_enable <= `WriteDisable;
                    memory_chip_enable_output <= `ChipEnable;
                    case (memory_address_input[1:0])
                        2'b00: begin
                            write_reg_data_output <= {{16{1'b0}}, memory_data_input[31:16]};
                            memory_sel_output <= 4'b1100;
                        end
                        2'b10: begin
                              write_reg_data_output <= {{16{1'b0}}, memory_data_input[15:0]};
                            memory_sel_output <= 4'b0011;
                        end
                        default: begin
                            write_reg_data_output <= `ZeroWord;
                        end
                    endcase
                end
                `EXE_LW_OP: begin
                    memory_address_output <= memory_address_input;
                    mem_write_enable <= `WriteDisable;
                    memory_chip_enable_output <= `ChipEnable;
                    write_reg_data_output <= memory_data_input;
                    memory_sel_output <= 4'b1111;
                end
                `EXE_LWL_OP: begin
                    memory_address_output <= {memory_address_input[31:2], 2'b00};
                    mem_write_enable <= `WriteDisable;
                    memory_chip_enable_output <= `ChipEnable;
                    memory_sel_output <= 4'b1111;
                    case (memory_address_input[1:0])
                        2'b00: begin
                            write_reg_data_output <= memory_data_input;
                        end
                        2'b01: begin
                            write_reg_data_output <= {memory_data_input[23:0], reg2_input[7:0]};
                        end
                        2'b10: begin
                            write_reg_data_output <= {memory_data_input[15:0], reg2_input[15:0]};
                        end
                        2'b11: begin
                            write_reg_data_output <= {memory_data_input[7:0], reg2_input[23:0]};
                        end
                        default: begin
                            write_reg_data_output <= `ZeroWord;
                        end
                    endcase
                end
                `EXE_LWR_OP: begin
                    memory_address_output <= {memory_address_input[31:2], 2'b00};
                    mem_write_enable <= `WriteDisable;
                    memory_chip_enable_output <= `ChipEnable;
                    memory_sel_output <= 4'b1111;
                    case (memory_address_input[1:0])
                        2'b00: begin
                            write_reg_data_output <= {reg2_input[31:8], memory_data_input[31:24]};
                        end
                        2'b01: begin
                              write_reg_data_output <= {reg2_input[31:16], memory_data_input[31:16]};
                        end
                        2'b10: begin
                              write_reg_data_output <= {reg2_input[31:24], memory_data_input[31:8]};
                        end
                        2'b11: begin
                              write_reg_data_output <= memory_data_input;
                        end
                        default: begin
                            write_reg_data_output <= `ZeroWord;
                        end
                    endcase
                end
                `EXE_SB_OP: begin
                    memory_address_output <= memory_address_input;
                    mem_write_enable <= `WriteEnable;
                    memory_data_output <= {reg2_input[7:0], reg2_input[7:0], reg2_input[7:0], reg2_input[7:0]};
                    memory_chip_enable_output <= `ChipEnable;
                    case (memory_address_input[1:0])
                        2'b00: begin
                            memory_sel_output <= 4'b1000;
                        end
                        2'b01: begin
                              memory_sel_output <= 4'b0100;
                        end
                        2'b10: begin
                              memory_sel_output <= 4'b0010;
                        end
                        2'b11: begin
                              memory_sel_output <= 4'b0001;
                        end
                        default: begin
                            memory_sel_output <= 4'b0000;
                        end
                    endcase
                end
                `EXE_SH_OP: begin
                    memory_address_output <= memory_address_input;
                    mem_write_enable <= `WriteEnable;
                    memory_data_output <= {reg2_input[15:0], reg2_input[15:0]};
                    memory_chip_enable_output <= `ChipEnable;
                    case (memory_address_input[1:0])
                        2'b00: begin
                            memory_sel_output <= 4'b1100;
                        end
                        2'b10: begin
                              memory_sel_output <= 4'b0011;
                        end
                        default: begin
                              memory_sel_output <= 4'b0000;
                        end
                    endcase
                end
                `EXE_SW_OP: begin
                    memory_address_output <= memory_address_input;
                    mem_write_enable <= `WriteEnable;
                    memory_data_output <= reg2_input;
                    memory_sel_output <= 4'b1111;
                    memory_chip_enable_output <= `ChipEnable;
                end
                `EXE_SWL_OP: begin
                    memory_address_output <= {memory_address_input[31:2], 2'b00};
                    mem_write_enable <= `WriteEnable;
                    memory_chip_enable_output <= `ChipEnable;
                    case (memory_address_input[1:0])
                        2'b00: begin
                            memory_sel_output <= 4'b1111;
                            memory_data_output <= reg2_input;
                        end
                        2'b01: begin
                              memory_sel_output <= 4'b0111;
                            memory_data_output <= {{8{1'b0}}, reg2_input[31:8]};
                        end
                        2'b10: begin
                              memory_sel_output <= 4'b0011;
                            memory_data_output <= {{16{1'b0}}, reg2_input[31:16]};
                        end
                        2'b11: begin
                              memory_sel_output <= 4'b0001;
                            memory_data_output <= {{24{1'b0}}, reg2_input[31:24]};
                        end
                        default: begin
                              memory_sel_output <= 4'b0000;
                        end
                    endcase
                end
                `EXE_SWR_OP: begin
                    memory_address_output <= {memory_address_input[31:2], 2'b00};
                    mem_write_enable <= `WriteEnable;
                    memory_chip_enable_output <= `ChipEnable;
                    case (memory_address_input[1:0])
                        2'b00: begin
                            memory_sel_output <= 4'b1000;
                            memory_data_output <= {reg2_input[7:0], {24{1'b0}}};
                        end
                        2'b01: begin
                            memory_sel_output <= 4'b1100;
                            memory_data_output <= {reg2_input[15:0], {16{1'b0}}};
                        end
                        2'b10: begin
                            memory_sel_output <= 4'b1110;
                            memory_data_output <= {reg2_input[23:0], {8{1'b0}}};
                        end
                        2'b11: begin
                            memory_sel_output <= 4'b1111;
                            memory_data_output <= reg2_input;
                        end
                        default: begin
                            memory_sel_output <= 4'b0000;
                        end
                    endcase
                end
                `EXE_LL_OP: begin
                    memory_address_output <= memory_address_input;
                    mem_write_enable <= `WriteDisable;
                    write_reg_data_output <= memory_data_input;
                    LLbit_write_enable_output <= 1'b1;
                    LLbit_output <= 1'b1;
                    memory_sel_output <= 4'b1111;
                    memory_chip_enable_output <= `ChipEnable;
                end
                `EXE_SC_OP: begin
                    if (LLbit == 1'b1) begin
                        LLbit_write_enable_output <= 1'b1;
                        LLbit_output <= 1'b0;
                        memory_address_output <= memory_address_input;
                        mem_write_enable <= `WriteEnable;
                        memory_data_output <= reg2_input;
                        write_reg_data_output <= 32'b1;
                        memory_sel_output <= 4'b1111;
                        memory_chip_enable_output <= `ChipEnable;
                    end else begin
                        write_reg_data_output <= 32'b0;
                    end
                end
                default: begin
                end
            endcase
        end
    end

endmodule