// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-bit microprocessor counter8
// 8-bit synchronous counter

module counter8(
    input  [3:0]    COUNTER_IN_LOW,     // 
    input  [7:4]    COUNTER_IN_HIGH,    // 
    input           MPC_LOAD_BAR,       //
    input           RESET,              //
    input           COUNT,              //
    input           SYSTEM_CLK,         // 
    output [7:0]    COUNTER_OUT         // 
);

// WIRES
wire            CARRY;
wire            NOTHING;

// ASSIGN VALUES
assign HIGH             = 1'b1;

// COUNTER1 - 4-bit synchronous counter
ta161_bar COUNTER1 (
    .CLR_BAR(RESET),
    .LD_BAR(MPC_LOAD_BAR),
    .ENT(HIGH),
    .ENP(COUNT),
    .CLK(SYSTEM_CLK),
    .A(COUNTER_IN_LOW[0]),
    .B(COUNTER_IN_LOW[1]),
    .C(COUNTER_IN_LOW[2]),
    .D(COUNTER_IN_LOW[3]),
    .QA(COUNTER_OUT[0]),
    .QB(COUNTER_OUT[1]),
    .QC(COUNTER_OUT[2]),
    .QD(COUNTER_OUT[3]),
    .RCO(CARRY)
);

// COUNTER2 - 4-bit synchronous counter
ta161_bar COUNTER2 (
    .CLR_BAR(RESET),
    .LD_BAR(MPC_LOAD_BAR),
    .ENT(CARRY),
    .ENP(COUNT),
    .CLK(SYSTEM_CLK),
    .A(COUNTER_IN_HIGH[4]),
    .B(COUNTER_IN_HIGH[5]),
    .C(COUNTER_IN_HIGH[6]),
    .D(COUNTER_IN_HIGH[7]),
    .QA(COUNTER_OUT[4]),
    .QB(COUNTER_OUT[5]),
    .QC(COUNTER_OUT[6]),
    .QD(COUNTER_OUT[7]),
    .RCO(NOTHING)
);

endmodule
