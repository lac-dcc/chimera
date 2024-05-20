// This program was cloned from: https://github.com/ika-musume/ArcadeStuffs
// License: GNU General Public License v2.0

module GXL01Top
(
    //Master clock
    input   wire            CLK,

    //Mode select
    input   wire    [1:0]   MODE,
    input   wire            BITSEL,

    //Ports
    input   wire    [7:0]   REG0_IN,
    input   wire    [7:0]   REG1_IN,
    input   wire    [7:0]   REG2_IN,
    input   wire    [7:0]   REG3_IN,
    output  wire            REG0_OUT,
    output  wire            REG1_OUT,
    output  wire            REG2_OUT,
    output  wire            REG3_OUT
);

ShiftRegister   Reg0    (.clock(CLK),   .mode_select(MODE), .bit_select(BITSEL),    .parallel_in(REG0_IN),  .serial_out(REG0_OUT));
ShiftRegister   Reg1    (.clock(CLK),   .mode_select(MODE), .bit_select(BITSEL),    .parallel_in(REG1_IN),  .serial_out(REG1_OUT));
ShiftRegister   Reg2    (.clock(CLK),   .mode_select(MODE), .bit_select(BITSEL),    .parallel_in(REG2_IN),  .serial_out(REG2_OUT));
ShiftRegister   Reg3    (.clock(CLK),   .mode_select(MODE), .bit_select(BITSEL),    .parallel_in(REG3_IN),  .serial_out(REG3_OUT));

endmodule