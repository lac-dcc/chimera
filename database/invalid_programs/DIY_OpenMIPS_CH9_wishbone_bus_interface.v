`include "defines.v"

module wishbone_bus_interface(
    input  wire               clock,
    input  wire               reset,
         
    input  wire[5:0]          stop_all_input,
    input  wire               flush_input,
         
    input  wire               cpu_chip_enable_input,
    input  wire[`RegisterBus] cpu_data_input,
    input  wire[`RegisterBus] cpu_address_input,
    input  wire               cpu_write_enable_input,
    input  wire[3:0]          cpu_sel_input,
    output reg[`RegisterBus]  cpu_data_output,

    input  wire[`RegisterBus] wishbone_data_input,
    input  wire               wishbone_ack_input,
    output reg[`RegisterBus]  wishbone_address_output,
    output reg[`RegisterBus]  wishbone_data_output,
    output reg                wishbone_write_enable_output,
    output reg[3:0]           wishbone_sel_output,
    output reg                wishbone_stb_output,
    output reg                wishbone_cyc_output,

    output reg                stop_all_req_output
);

    reg[1:0]          wishbone_state;
    reg[`RegisterBus] read_buf;

    always @ (posedge clock) begin
        if (reset == `ResetEnable) begin
            wishbone_state <= `WB_IDLE;
            wishbone_address_output <= `ZeroWord;
            wishbone_data_output <= `ZeroWord;
            wishbone_write_enable_output <= `WriteDisable;
            wishbone_sel_output <= 4'b0000;
            wishbone_stb_output <= 1'b0;
            wishbone_cyc_output <= 1'b0;
            read_buf <= `ZeroWord;
        end else begin
            case (wishbone_state)
                `WB_IDLE: begin
                    if ((cpu_chip_enable_input == 1'b1) && (flush_input == `FalseValue)) begin
                        wishbone_stb_output <= 1'b1;
                        wishbone_cyc_output <= 1'b1;
                        wishbone_address_output <= cpu_address_input;
                        wishbone_data_output <= cpu_data_input;
                        wishbone_write_enable_output <= cpu_write_enable_input;
                        wishbone_sel_output <= cpu_sel_input;
                        wishbone_state <= `WB_BUSY;
                        read_buf <= `ZeroWord;
                    end
                end
                `WB_BUSY: begin
                    if (wishbone_ack_input == 1'b1) begin
                        wishbone_stb_output <= 1'b0;
                        wishbone_cyc_output <= 1'b0;
                        wishbone_address_output <= `ZeroWord;
                        wishbone_data_output <= `ZeroWord;
                        wishbone_write_enable_output <= `WriteDisable;
                        wishbone_sel_output <= 4'b0000;
                        wishbone_state <= `WB_IDLE;
                        if(cpu_write_enable_input == `WriteDisable) begin
                            read_buf <= wishbone_data_input;
                        end
                        if (stop_all_input != 6'b000000) begin
                            wishbone_state <= `WB_WAIT_FOR_STOP_ALL;
                        end
                    end else if (flush_input == `TrueValue) begin
                        wishbone_stb_output <= 1'b0;
                        wishbone_cyc_output <= 1'b0;
                        wishbone_address_output <= `ZeroWord;
                        wishbone_data_output <= `ZeroWord;
                        wishbone_write_enable_output <= `WriteDisable;
                        wishbone_sel_output <= 4'b0000;
                        wishbone_state <= `WB_IDLE;
                        read_buf <= `ZeroWord;
                    end
                end
                `WB_WAIT_FOR_STOP_ALL: begin
                    if (stop_all_input == 6'b000000) begin
                        wishbone_state <= `WB_IDLE;
                    end
                end 
                default: begin
                end
            endcase
        end
    end

    always @ (*) begin
        if (reset == `ResetEnable) begin
            stop_all_req_output <= `NoStop;
            cpu_data_output <= `ZeroWord;
        end else begin
            stop_all_req_output <= `NoStop;
            case (wishbone_state)
                `WB_IDLE: begin
                    if ((cpu_chip_enable_input == 1'b1) && flush_input == `FalseValue) begin
                        stop_all_req_output <= `Stop;
                        cpu_data_output <= `ZeroWord;
                    end
                end
                `WB_BUSY: begin
                    if (wishbone_ack_input == 1'b1) begin
                        stop_all_req_output <= `NoStop;
                        if (wishbone_write_enable_output <= `WriteDisable) begin
                            cpu_data_output <= wishbone_data_input;
                        end else begin
                            cpu_data_output <= `ZeroWord;
                        end
                    end else begin
                        stop_all_req_output <= `Stop;
                        cpu_data_output <= `ZeroWord;
                    end
                end
                `WB_WAIT_FOR_STOP_ALL: begin
                    stop_all_req_output <= `NoStop;
                    cpu_data_output <= read_buf;
                end
                default: begin
                end
            endcase
        end
    end

endmodule