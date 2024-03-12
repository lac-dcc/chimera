`define ResetEnable         1'b1
`define ResetDisable        1'b0
`define ZeroWord            32'h00000000
`define WriteEnable         1'b1
`define WriteDisable        1'b0
`define ReadEnable          1'b1
`define ReadDisable         1'b0
`define ALUOpBus            7:0
`define ALUSelBus           2:0
`define InstructionValid    1'b1
`define InstructionInvalid  1'b0
`define TrueValue           1'b1
`define FalseValue          1'b0
`define ChipEnable          1'b1
`define ChipDisable         1'b0

`define EXE_ORI             6'b001101
`define EXE_NOP             6'b000000

`define EXE_OR_OP           8'b00100101
`define EXE_NOP_OP          8'b00000000

`define EXE_RES_LOGIC       3'b001

`define EXE_RES_NOP         3'b000

`define AddressBus          31:0
`define DataBus             31:0
`define MemoryNum           131071
`define MemoryNumLog2       17

`define RegisterAddressBus  4:0
`define RegisterBus         31:0
`define RegisterWidth       32
`define DoubleRegisterWidth 64
`define DoubleRegisterBus   63:0
`define RegisterNum         32
`define RegisterNumLog2     5
`define NOPRegisterAddress  5'b00000