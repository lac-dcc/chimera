// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-bit microprocessor control section
// Control section structural view
// UPDATE FROM THESIS
//   Replaced xor2 in THESIS with jeff's xor2

module control (
    input  [3:0]    OPCODE,             //
    input           GO_BAR,             // 
    input           RESET,              // 
    input           JAM,                // 
    input           SYSTEM_CLK,         //
    input  [3:0]    STATUS_BITS,        // 
    input  [23:0]   MW,                 //
    output [7:0]    MICROADDRESS,       //
    output [23:13]  CONTROL_BITS,       // PASS THREW FOR MW[23:13]
    output          EIL_BAR             // 
);

// WIRES
wire [3:0]      MICRO_AD_LOW;
wire [7:4]      MICRO_AD_HIGH;
wire            COUNT;
wire [12:9]     BOP;
wire [7:4]      COUNTER_IN_HIGH_SIG;
wire [7:0]      BUFFER_IN;
wire            MPC_LOAD_BAR;
wire            COND_OUT;
wire            HIGH;
wire [7:0]      HIGH8;
wire            LOW;
wire            NOTHING;

// BREAK UP THE MICROWORD (MW) INTO FIELDS
assign MICRO_AD_LOW     = MW[3:0];
assign MICRO_AD_HIGH    = MW[7:4];
assign COUNT            = MW[8];
assign BOP              = MW[12:9];
assign CONTROL_BITS     = MW[23:13];

// ASSIGN VALUES
assign HIGH             = 1'b1;
assign HIGH8            = 8'b11111111;
assign LOW              = 1'b0;

// COUNTER8 SECTION
counter8 COUNTER_8 (
    .COUNTER_IN_LOW(MICRO_AD_LOW),
    .COUNTER_IN_HIGH(COUNTER_IN_HIGH_SIG),
    .MPC_LOAD_BAR(MPC_LOAD_BAR),
    .RESET(RESET),
    .COUNT(COUNT),
    .SYSTEM_CLK(SYSTEM_CLK),
    .COUNTER_OUT(BUFFER_IN)
);

// MUX8 SECTION - Eight (2x1) multiplexers
ta157_8 MUX8 (
    .A8(BUFFER_IN),
    .B8(HIGH8),
    .S(JAM),
    .EN_BAR(LOW),
    .Y8(MICROADDRESS)
);

// OPCODEDEC SECTION
opcodedec OPCODEDEC0 (
    .OPCODE(OPCODE),
    .MW_AD_HIGH(MICRO_AD_HIGH),
    .MW_BOP(BOP),
    .TO_COUNTER(COUNTER_IN_HIGH_SIG),
    .EIL_BAR(EIL_BAR)
);

// COND_SELECT SECTION
ta151_bar COND_SELECT (
    .D0(STATUS_BITS[2]),
    .D1(LOW),
    .D2(STATUS_BITS[0]),
    .D3(STATUS_BITS[1]),
    .D4(GO_BAR),
    .D5(STATUS_BITS[3]),
    .D6(LOW),
    .D7(LOW),
    .A(BOP[9]),
    .B(BOP[10]),
    .C(BOP[11]),
    .EN_BAR(LOW),
    .Y(NOTHING),
    .W(COND_OUT)
);

//   Replaced xor2 in THESIS with jeff's xor2
xor2_behavioral XOR_2 (
    .a(BOP[12]),
    .b(COND_OUT),
    .y(MPC_LOAD_BAR)
);

endmodule