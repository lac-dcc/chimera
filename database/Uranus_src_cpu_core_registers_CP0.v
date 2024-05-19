// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../define/bus.v"
`include "../define/cp0.v"
`include "../define/exception.v"

module CP0(
    input clk,
    input rst,
    // control signals
    input write_en,
    input [`CP0_ADDR_BUS] write_addr,
    input [`CP0_ADDR_BUS] read_addr,
    input [`DATA_BUS] write_data,
    // hardware interrupt input & output
    input [4:0] interrupt,
    // exception signals
    input [`ADDR_BUS] cp0_badvaddr_write_data,
    input [`EXC_TYPE_BUS] exception_type,
    input delayslot_flag,
    input [`ADDR_BUS] current_pc_addr,
    // data output
    output [`DATA_BUS] status,
    output [`DATA_BUS] cause,
    output [`DATA_BUS] epc,
    output [`DATA_BUS] ebase,
    output reg[`DATA_BUS] data_out
);

    // Coprocessor 0 registers
    reg[`DATA_BUS] reg_badvaddr;
    reg[`DATA_BUS] reg_count;
    reg[`DATA_BUS] reg_compare;
    reg[`DATA_BUS] reg_status;
    reg[`DATA_BUS] reg_cause;
    reg[`DATA_BUS] reg_epc;
    reg[`DATA_BUS] reg_prid;
    reg[`DATA_BUS] reg_ebase;
    reg[`DATA_BUS] reg_config;
    reg timer_int;

    wire[`DATA_BUS] exc_epc;

    assign status = rst ? reg_status : 0;
    assign cause = rst ? reg_cause : 0;
    assign epc = rst ? reg_epc : 0;
    assign ebase = rst ? reg_ebase : 0;
    assign exc_epc = delayslot_flag ? current_pc_addr - 4 : current_pc_addr;

    // write data into registers
    always @(posedge clk) begin
        if (!rst) begin
            reg_badvaddr <= `CP0_REG_BADVADDR_VALUE;
            reg_count <= 0;
            reg_compare <= 0;
            reg_status <= `CP0_REG_STATUS_VALUE;
            reg_cause <= `CP0_REG_CAUSE_VALUE;
            reg_epc <= `CP0_REG_EPC_VALUE;
            reg_prid <= `CP0_REG_PRID_VALUE;
            reg_ebase <= `CP0_REG_EBASE_VALUE;
            reg_config <= `CP0_REG_CONFIG_VALUE;
            timer_int <= 0;
        end
        else begin
            // store the status of hardware interrupts
            reg_cause[`CP0_SEG_HWI] <= {timer_int, interrupt};
            // generate the timer interrupt
            reg_count <= reg_count + 1;
            if (reg_compare && reg_count == reg_compare) begin
                timer_int <= 1;
            end
            // write data to registers from write signals
            if (write_en) begin
                case (write_addr)
                    `CP0_REG_COUNT: begin
                        reg_count <= write_data;
                    end
                    `CP0_REG_COMPARE: begin
                        reg_compare <= write_data;
                        timer_int <= 0;
                    end
                    `CP0_REG_STATUS: begin
                        reg_status[22] <= write_data[22];   // allow write to BEV
                        reg_status[15:8] <= write_data[15:8];
                        reg_status[1:0] <= write_data[1:0];
                    end
                    `CP0_REG_EPC: begin
                        reg_epc <= write_data;
                    end
                    `CP0_REG_EBASE: begin
                        reg_ebase[29:12] <= write_data[29:12];
                    end
                    `CP0_REG_CAUSE: begin
                        reg_cause[9:8] <= write_data[9:8];
                    end
                endcase
            end
            // write data to registers from exception signals
            case (exception_type[`EXC_TYPE_POS_INT])
                `EXC_TYPE_INT: begin
                    reg_epc <= exc_epc;
                    reg_cause[`CP0_SEG_BD] <= delayslot_flag;
                    reg_status[`CP0_SEG_EXL] <= 1;
                    reg_cause[`CP0_SEG_EXCCODE] <= `CP0_EXCCODE_INT;
                end
                `EXC_TYPE_IF, `EXC_TYPE_ADEL: begin
                    reg_epc <= exc_epc;
                    reg_cause[`CP0_SEG_BD] <= delayslot_flag;
                    reg_badvaddr <= cp0_badvaddr_write_data;
                    reg_status[`CP0_SEG_EXL] <= 1;
                    reg_cause[`CP0_SEG_EXCCODE] <= `CP0_EXCCODE_ADEL;
                end
                `EXC_TYPE_RI: begin
                    reg_epc <= exc_epc;
                    reg_cause[`CP0_SEG_BD] <= delayslot_flag;
                    reg_status[`CP0_SEG_EXL] <= 1;
                    reg_cause[`CP0_SEG_EXCCODE] <= `CP0_EXCCODE_RI;
                end
                `EXC_TYPE_OV: begin
                    reg_epc <= exc_epc;
                    reg_cause[`CP0_SEG_BD] <= delayslot_flag;
                    reg_status[`CP0_SEG_EXL] <= 1;
                    reg_cause[`CP0_SEG_EXCCODE] <= `CP0_EXCCODE_OV;
                end
                `EXC_TYPE_BP: begin
                    reg_epc <= exc_epc;
                    reg_cause[`CP0_SEG_BD] <= delayslot_flag;
                    reg_status[`CP0_SEG_EXL] <= 1;
                    reg_cause[`CP0_SEG_EXCCODE] <= `CP0_EXCCODE_BP;
                end
                `EXC_TYPE_SYS: begin
                    reg_epc <= exc_epc;
                    reg_cause[`CP0_SEG_BD] <= delayslot_flag;
                    reg_status[`CP0_SEG_EXL] <= 1;
                    reg_cause[`CP0_SEG_EXCCODE] <= `CP0_EXCCODE_SYS;
                end
                `EXC_TYPE_ADES: begin
                    reg_epc <= exc_epc;
                    reg_cause[`CP0_SEG_BD] <= delayslot_flag;
                    reg_badvaddr <= cp0_badvaddr_write_data;
                    reg_status[`CP0_SEG_EXL] <= 1;
                    reg_cause[`CP0_SEG_EXCCODE] <= `CP0_EXCCODE_ADES;
                end
                `EXC_TYPE_ERET: begin
                    reg_status[`CP0_SEG_EXL] <= 0;
                end
                default:;
            endcase
        end
    end

    // generate data output
    always@(*) begin
        if (!rst) begin
            data_out <= 0;
        end
        else begin
            case (read_addr)
                `CP0_REG_BADVADDR: data_out <= reg_badvaddr;
                `CP0_REG_COUNT: data_out <= reg_count;
                `CP0_REG_COMPARE: data_out <= reg_compare;
                `CP0_REG_STATUS: data_out <= reg_status;
                `CP0_REG_CAUSE: data_out <= reg_cause;
                `CP0_REG_EPC: data_out <= reg_epc;
                `CP0_REG_PRID: data_out <= reg_prid;
                `CP0_REG_EBASE: data_out <= reg_ebase;
                `CP0_REG_CONFIG: data_out <= reg_config;
                default: data_out <= 0;
            endcase
        end
    end

endmodule // CP0
