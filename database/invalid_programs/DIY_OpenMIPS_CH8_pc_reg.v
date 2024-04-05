`include "defines.v"

module pc_reg(
    input  wire                         clock,
    input  wire                         reset,
        
    input  wire[`StopAllBus]            stop_all,
        
    input  wire                         is_branch_input,
    input  wire[`RegisterBus]           branch_address_input,

    input  wire                         flush_input,
    input  wire[`InstructionAddressBus] new_program_counter_input,

    output reg[`InstructionAddressBus]  program_counter,
    output reg                          chip_enable
);

    always @ (posedge clock) begin
        if (reset == `ResetEnable) begin
            chip_enable <= `ChipDisable;
        end else begin
            chip_enable <= `ChipEnable;
        end
    end
     
    always @ (posedge clock) begin
        if (chip_enable == `ChipDisable) begin
            program_counter <= 32'h00000000;
        end else begin
            if (flush_input == 1'b1) begin
                program_counter <= new_program_counter_input;
            end else if (stop_all[0] == `NoStop) begin
                if (is_branch_input == `Branch) begin
                    program_counter <= branch_address_input;
                end else begin
                    program_counter <= program_counter + 4'h4;  
                end
            end
        end
    end

endmodule