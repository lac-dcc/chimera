`include "defines.v"

module cp0_reg(
    input  wire               clock,
    input  wire               reset,
    input  wire               write_enable_input,
    input  wire[4:0]          write_address_input,
    input  wire[4:0]          read_address_input,
    input  wire[`RegisterBus] data_input,
    input  wire[5:0]          interrupt_input,

    output reg[`RegisterBus]  data_output,
    output reg[`RegisterBus]  count_output,
    output reg[`RegisterBus]  compare_output,
    output reg[`RegisterBus]  status_output,
    output reg[`RegisterBus]  cause_output,
    output reg[`RegisterBus]  epc_output,
    output reg[`RegisterBus]  config_output,
    output reg[`RegisterBus]  prid_output,
    output reg                timer_interrupt_output
);

    always @ (posedge clock) begin
        if (reset == `ResetEnable) begin
            count_output <= `ZeroWord;
            compare_output <= `ZeroWord;
            status_output <= 32'b00010000000000000000000000000000;
            cause_output <= `ZeroWord;
            epc_output <= `ZeroWord;
            config_output <= 32'b00000000000000001000000000000000;
            prid_output <= 32'b00000000010011000000000100000010;
            timer_interrupt_output <= `InterruptNotAssert;
        end else begin
            count_output <= count_output + 1;
            cause_output[15:10] <= interrupt_input;
            
            if (compare_output != `ZeroWord && count_output == compare_output) begin
                timer_interrupt_output <= `InterruptAssert;
            end

            if (write_enable_input == `WriteEnable) begin
                case (write_address_input)
                    `CP0_REG_COUNT: begin
                        count_output <= data_input;
                    end
                    `CP0_REG_COMPARE: begin
                        compare_output <= data_input;
                        timer_interrupt_output <= `InterruptNotAssert;
                    end
                    `CP0_REG_STATUS: begin
                        status_output <= data_input;
                    end
                    `CP0_REG_EPC: begin
                        epc_output <= data_input;
                    end
                    `CP0_REG_CAUSE: begin
                        cause_output[9:8] <= data_input[9:8];
                        cause_output[23] <= data_input[23];
                        cause_output[22] <= data_input[22];
                    end
                    default: begin
                    end
                endcase
            end
        end
    end

    always @ (*) begin
        if (reset == `ResetEnable) begin
            data_output <= `ZeroWord;
        end else begin
            case (read_address_input)
                `CP0_REG_COUNT: begin
                    data_output <= count_output;            
                end
                `CP0_REG_COMPARE: begin
                    data_output <= compare_output;
                end
                `CP0_REG_STATUS: begin
                    data_output <= status_output;
                end
                `CP0_REG_CAUSE: begin
                    data_output <= cause_output;
                end
                `CP0_REG_EPC: begin
                    data_output <= epc_output;
                end
                `CP0_REG_PrId: begin
                    data_output <= prid_output;
                end
                `CP0_REG_CONFIG: begin
                    data_output <= config_output;
                end
                default: begin
                end
            endcase
        end
    end

endmodule