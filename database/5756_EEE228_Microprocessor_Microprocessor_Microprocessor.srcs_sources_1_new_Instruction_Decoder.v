// This program was cloned from: https://github.com/BlackWatch0/EEE228_Microprocessor
// License: GNU General Public License v3.0

module Instruction_Decoder(
    input [3:0] instruction,
    input clk,
    input shifter_flag,
    output reg loadA,
    output reg loadB,
    output reg loadO,
    output reg MUX_0=0,
    output reg MUX_1=0,
    output reg shift_direction,
    output reg shifter_en=0,
    output reg load_shifter=0,
    output reg [3:0] ALU_Sel,
    output reg ALU_update=0,
    output reg update_PC = 0,
    output reg acc_reset = 0
);

// Define operations
localparam LD_A         = 4'b0000;
localparam LD_B         = 4'b0001;
localparam LD_O         = 4'b0010;
localparam LD_SH_A      = 4'b0011;
localparam LD_SH_B      = 4'b0100;
localparam SHR          = 4'b0101;
localparam SHL          = 4'b0110;
localparam ACC_NZ_A     = 4'b0111;
localparam ACC_NZ_SH    = 4'b1000;
localparam ADD          = 4'b1001;
localparam SUB          = 4'b1010;
localparam INV          = 4'b1011;
localparam AND          = 4'b1100;
localparam OR           = 4'b1101;
localparam XOR          = 4'b1110;
localparam CLR_ACC      = 4'b1111;

reg [1:0] counter=2'b00;

always @(clk) begin
    counter = counter+2'b01;
    case (counter)
        2'b00:begin
        loadA = 0;
        loadB = 0;
        loadO = 0;
        shift_direction = 0;
        acc_reset = 0;
        end
        // step 2
        2'b01:begin
        case(instruction)
                LD_A:       begin MUX_0 = 0; MUX_1 = 0; end
                LD_B:       begin MUX_0 = 1; MUX_1 = 0; end
                LD_O:       begin end
                LD_SH_A:    begin MUX_0 = 0; end
                LD_SH_B:    begin MUX_0 = 1; end
                SHR:        begin end
                SHL:        begin end
                ACC_NZ_A:   begin
                                if(shifter_flag) begin
                                    MUX_0 = 0; MUX_1 = 0;
                                end
                            end
                ACC_NZ_SH:  begin
                                if(shifter_flag) begin
                                    MUX_0 = 0; MUX_1 = 1;
                                end
                            end
                ADD:        begin end
                SUB:        begin end
                INV:        begin end
                AND:        begin end
                OR:         begin end
                XOR:        begin end
                CLR_ACC:    begin acc_reset = 1; end
                default:    begin end
        endcase
        end
        // step 3
        2'b10:
        begin
        case(instruction)
                LD_A:       begin loadA = 1; end
                LD_B:       begin loadB = 1; end
                LD_O:       begin loadO = 1; end
                LD_SH_A:    begin load_shifter = ~load_shifter; end
                LD_SH_B:    begin load_shifter = ~load_shifter; end
                SHR:        begin shifter_en = ~shifter_en; shift_direction = 0; end
                SHL:        begin shifter_en = ~shifter_en; shift_direction = 1; end
                ACC_NZ_A:   begin
                                if(shifter_flag) begin
                                    ALU_Sel = 4'b0111;
                                    ALU_update=~ALU_update;
                                end
                            end
                ACC_NZ_SH:  begin
                                if(shifter_flag) begin
                                    ALU_Sel = 4'b1000;
                                    ALU_update=~ALU_update;
                                end
                            end
                ADD:        begin ALU_Sel <= instruction;ALU_update=~ALU_update; end
                SUB:        begin ALU_Sel <= instruction;ALU_update=~ALU_update; end
                INV:        begin ALU_Sel <= instruction;ALU_update=~ALU_update; end
                AND:        begin ALU_Sel <= instruction;ALU_update=~ALU_update; end
                OR:         begin ALU_Sel <= instruction;ALU_update=~ALU_update; end
                XOR:        begin ALU_Sel <= instruction;ALU_update=~ALU_update; end
                CLR_ACC:    begin acc_reset = 0; end
                default:    begin end
        endcase
        end
        2'b11:begin
        // Step 4: Update program counter
        update_PC = ~update_PC;
        end
        endcase
end

endmodule
