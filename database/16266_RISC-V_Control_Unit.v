// This program was cloned from: https://github.com/MihVuongNguyen/RISC-V
// License: Apache License 2.0

module Control (
    input [31:0] instruction,
    input BrEQ, BrLT,
    output [3:0] ALU_sel,
    output [2:0] Imm_sel, load_sel,
    output [1:0] WB_sel,
    output PC_sel, Reg_W_en, Mem_W_en, A_sel, B_sel
);
    
reg [12:0] Control_signals;
wire [1:0] ALUop;
wire branchOP, jump;

alu_decoder ALU (
    .ALUop(ALUop),
    .func({instruction[5], instruction[30], instruction[14:12]}),
    .opcode(ALU_sel)
);

branch_decoder branch (
    .branchOP(branchOP),
    .jump(jump),
    .func(instruction[14:12]),
    .BrEQ(BrEQ),
    .BrLT(BrLT),
    .PCsel(PC_sel)
);

assign load_sel = instruction[14:12];

assign {ALUop, branchOP, Imm_sel, Reg_W_en, Mem_W_en, A_sel, B_sel, WB_sel, jump} = Control_signals;

always @(*) begin
    case (instruction[6:0])
        7'b011_0011: Control_signals = 13'b00_0_000_1_0_0_0_01_0; //R-Type
        7'b001_0011: Control_signals = 13'b01_0_000_1_0_0_1_01_0; //Imm
        7'b000_0011: Control_signals = 13'b10_0_000_1_0_0_1_00_0; //load
        7'b010_0011: Control_signals = 13'b10_0_001_0_1_0_1_00_0; //store
        7'b110_0011: Control_signals = 13'b10_1_010_0_0_1_1_00_0; //branch
        7'b110_1111: Control_signals = 13'b10_0_011_1_0_1_1_10_1; //JAL
        7'b110_0111: Control_signals = 13'b10_0_000_1_0_0_1_10_1; //JALR
        7'b011_0111: Control_signals = 13'b00_0_100_1_0_0_0_11_0; //LUI
        7'b001_0111: Control_signals = 13'b10_0_100_1_0_1_1_01_1; //AUIPC
        default: Control_signals = 0;
    endcase
end

endmodule