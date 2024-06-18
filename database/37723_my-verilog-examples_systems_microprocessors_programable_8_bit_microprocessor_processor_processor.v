// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-bit microprocessor processor section
// Processor section structural view

module processor (
    input  [7:0]    DATA_IN_A,          // 
    input  [7:0]    DATA_IN_B,          // 
    input           SYSTEM_CLK,         //
    input           EIL_BAR,            //
    input  [23:13]  CONTROL_BITS,       //
    output [3:0]    STATUS_BITS,        // 
    output [7:0]    DATA_OUT            // 
);

// WIRES
wire [7:0]      DATA_OUT_A;
wire [7:0]      DATA_OUT_B;
wire [7:0]      DATA_OUT_TA;
wire [7:0]      DATA_OUT_TB;
wire [7:0]      ALU_IN_A;
wire [7:0]      ALU_IN_B;
wire [7:0]      ALU_OUT;
wire            A_SOURCE;
wire            B_SOURCE;
wire [19:15]    ALU_FUNC;
wire            CIN;
wire [23:21]    ALU_DEST;
wire [7:0]      IN_ZP;
wire            LOW;

// BREAK UP THE CONTROL_BITS INTO FIELDS
assign A_SOURCE     = CONTROL_BITS[13];
assign B_SOURCE     = CONTROL_BITS[14];
assign ALU_FUNC     = CONTROL_BITS[19:15];
assign CIN          = CONTROL_BITS[20];
assign ALU_DEST     = CONTROL_BITS[23:21];

// ASSIGN VALUES
assign LOW              = 1'b0;
assign DATA_OUT         = IN_ZP;

// REGISTERA SECTION
register_ab8 REGISTERA (
    .DATA_IN(DATA_IN_A),
    .SYSTEM_CLK(SYSTEM_CLK),
    .ENABLE_CLK(EIL_BAR),
    .DATA_OUT(DATA_OUT_A)
);

// REGISTERB SECTION
register_ab8 REGISTERB (
    .DATA_IN(DATA_IN_B),
    .SYSTEM_CLK(SYSTEM_CLK),
    .ENABLE_CLK(EIL_BAR),
    .DATA_OUT(DATA_OUT_B)
);

// TEMP_REGISTER_A SECTION
register_ab8 TEMP_REGISTER_A (
    .DATA_IN(ALU_OUT),
    .SYSTEM_CLK(SYSTEM_CLK),
    .ENABLE_CLK(ALU_DEST[21]),
    .DATA_OUT(DATA_OUT_TA)    
);

// TEMP_REGISTER_B SECTION
register_ab8 TEMP_REGISTER_B (
    .DATA_IN(ALU_OUT),
    .SYSTEM_CLK(SYSTEM_CLK),
    .ENABLE_CLK(ALU_DEST[22]),
    .DATA_OUT(DATA_OUT_TB)
);

// MUX_A SECTION
ta157_8 MUX_A (
    .A8(DATA_OUT_TA),
    .B8(DATA_OUT_A),
    .S(A_SOURCE),
    .EN_BAR(LOW),
    .Y8(ALU_IN_A)
);

// MUX_B SECTION
ta157_8 MUX_B (
    .A8(DATA_OUT_TB),
    .B8(DATA_OUT_B),
    .S(B_SOURCE),
    .EN_BAR(LOW),
    .Y8(ALU_IN_B)
);

// ALU1 SECTION
alu ALU1 (
    .IN_A(ALU_IN_A),
    .IN_B(ALU_IN_B),
    .CIN(CIN),
    .ALU_FUNC(ALU_FUNC),
    .OUT8(ALU_OUT),
    .C4(STATUS_BITS[0]),
    .C8(STATUS_BITS[1]),
    .Z(STATUS_BITS[2])
);

// F_REGISTER SECTION
register_ab8 F_REGISTER (
    .DATA_IN(ALU_OUT),
    .SYSTEM_CLK(SYSTEM_CLK),
    .ENABLE_CLK(ALU_DEST[23]),
    .DATA_OUT(IN_ZP)
);

// ZP_BIT1 SECTION
zp_bit ZP_BIT1 (
    .F8(IN_ZP),
    .ZP_BAR(STATUS_BITS[3])
);

endmodule
