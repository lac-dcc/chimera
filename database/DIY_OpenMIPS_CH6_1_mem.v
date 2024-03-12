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

    output reg[`RegisterAddressBus]  write_reg_address_output,
    output reg                       write_reg_enable_output,
    output reg[`RegisterBus]         write_reg_data_output,

    output reg[`RegisterBus]         hi_output,
    output reg[`RegisterBus]         lo_output,
    output reg                       whilo_output,

    output reg[`RegisterBus]         memory_address_output,
    output reg                       memory_write_enable_output,
    output reg[3:0]                  memory_sel_output,
    output reg[`RegisterBus]         memory_data_output,
    output reg                       memory_chip_enable_output
);

    always @ (*) begin
        if (reset == `ResetEnable) begin
            write_reg_address_output <= `NOPRegisterAddress;
            write_reg_enable_output <= `WriteDisable;
            write_reg_data_output <= `ZeroWord;
            hi_output <= `ZeroWord;
            lo_output <= `ZeroWord;
            whilo_output <= `WriteDisable;
            memory_address_output <= `ZeroWord;
            memory_write_enable_output <= `WriteDisable;
            memory_sel_output <= 4'b0000;
            memory_data_output <= `ZeroWord;
            memory_chip_enable_output <= `ChipDisable;
        end else begin
            write_reg_address_output <= write_reg_address_input;
            write_reg_enable_output <= write_reg_enable_input;
            write_reg_data_output <= write_reg_data_input;
            hi_output <= hi_input;
            lo_output <= lo_input;
            whilo_output <= whilo_input;
            memory_address_output <= `ZeroWord;
            memory_write_enable_output <= `WriteDisable;
            memory_sel_output <= 4'b1111;
            memory_chip_enable_output <= `ChipDisable;
            case (aluop_input)
                `EXE_LB_OP: begin
                    memory_address_output <= memory_address_input;
                    memory_write_enable_output <= `WriteDisable;
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
                    memory_write_enable_output <= `WriteDisable;
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
                    memory_write_enable_output <= `WriteDisable;
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
                    memory_write_enable_output <= `WriteDisable;
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
                    memory_write_enable_output <= `WriteDisable;
                    memory_chip_enable_output <= `ChipEnable;
                    write_reg_data_output <= memory_data_input;
                    memory_sel_output <= 4'b1111;
                end
                `EXE_LWL_OP: begin
                    memory_address_output <= {memory_address_input[31:2], 2'b00};
                    memory_write_enable_output <= `WriteDisable;
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
                    memory_write_enable_output <= `WriteDisable;
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
                    memory_write_enable_output <= `WriteEnable;
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
                    memory_write_enable_output <= `WriteEnable;
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
                    memory_write_enable_output <= `WriteEnable;
                    memory_data_output <= reg2_input;
                    memory_sel_output <= 4'b1111;
                    memory_chip_enable_output <= `ChipEnable;
                end
                `EXE_SWL_OP: begin
                    memory_address_output <= {memory_address_input[31:2], 2'b00};
                    memory_write_enable_output <= `WriteEnable;
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
                    memory_write_enable_output <= `WriteEnable;
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
                default: begin
                end
            endcase
        end
    end

endmodule