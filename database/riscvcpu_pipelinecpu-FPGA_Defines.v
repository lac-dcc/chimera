// This program was cloned from: https://github.com/immortalrover/riscvcpu
// License: MIT License

// Width
`define InstrWidth										32
`define AddrWidth											32
`define MemAddrWidth									12
`define DataWidth											32
`define OpcodeWidth										7
`define Func3Width										3
`define Func7Width										7
`define RegNumWidth										5
`define ALUOpWidth										4
`define StateWidth										3

// States
`define IDLE													0
`define RegWrite											1
`define MemReadRegWrite								2
`define MemWrite											3
`define PCSelectWrite									4
`define	PCWrite												5
`define LuiRegWrite										6

// ALU operation
`define ADD														4'h0
`define SUB														4'h1
`define OR														4'h2
`define XOR														4'h3
`define AND														4'h4
`define LesserThanUnsigned						4'h5
`define LesserThanSigned							4'h6
`define ShiftRightUnsigned						4'h7
`define ShiftRightSigned							4'h8
`define ShiftLeftUnsigned							4'h9
`define ShiftLeftSigned								4'hA
`define GreaterThanOrEqualUnsigned		4'hB
`define GreaterThanOrEqualSigned			4'hC
`define Equal													4'hD
`define NotEqual											4'hE

// FPGA defines
/* `define LEDWidth											8 */
/* `define SwitchNum											16 */
`define DisplayDataWidth							64
