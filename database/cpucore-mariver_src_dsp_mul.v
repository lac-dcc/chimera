// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    基于DSP的24*17位单周期无符号乘法器
*/

module dsp_mul(
    input           clk,
    input           resetn,
    input[23:0]     A,
    input[16:0]     B,
    input           a_wait,
    output[40:0]    result
    );

    wire[6:0] unused;

    DSP48E1 #(
        // Feature Control Attributes: Data Path Selection
      .A_INPUT("DIRECT"),               // Selects A input source, "DIRECT" (A port) or "CASCADE" (ACIN port)
      .B_INPUT("DIRECT"),               // Selects B input source, "DIRECT" (B port) or "CASCADE" (BCIN port)
      .USE_DPORT("FALSE"),              // Select D port usage (TRUE or FALSE)
      .USE_MULT("MULTIPLY"),            // Select multiplier usage ("MULTIPLY", "DYNAMIC", or "NONE")
      .USE_SIMD("ONE48"),               // SIMD selection ("ONE48", "TWO24", "FOUR12")
        // Pattern Detector Attributes: Pattern Detection Configuration
      .AUTORESET_PATDET("NO_RESET"),    // "NO_RESET", "RESET_MATCH", "RESET_NOT_MATCH"
      .MASK(48'h3fffffffffff),          // 48-bit mask value for pattern detect (1=ignore)
      .PATTERN(48'h000000000000),       // 48-bit pattern match for pattern detect
      .SEL_MASK("MASK"),                // "C", "MASK", "ROUNDING_MODE1", "ROUNDING_MODE2"
      .SEL_PATTERN("PATTERN"),          // Select pattern value ("PATTERN" or "C")
      .USE_PATTERN_DETECT("NO_PATDET"), // Enable pattern detect ("PATDET" or "NO_PATDET")
        // Register Control Attributes: Pipeline Register Configuration
      .ACASCREG(0),                     // Number of pipeline stages between A/ACIN and ACOUT (0, 1 or 2)
      .ADREG(0),                        // Number of pipeline stages for pre-adder (0 or 1)
      .ALUMODEREG(0),                   // Number of pipeline stages for ALUMODE (0 or 1)
      .AREG(0),                         // Number of pipeline stages for A (0, 1 or 2)
      .BCASCREG(0),                     // Number of pipeline stages between B/BCIN and BCOUT (0, 1 or 2)
      .BREG(0),                         // Number of pipeline stages for B (0, 1 or 2)
      .CARRYINREG(0),                   // Number of pipeline stages for CARRYIN (0 or 1)
      .CARRYINSELREG(0),                // Number of pipeline stages for CARRYINSEL (0 or 1)
      .CREG(0),                         // Number of pipeline stages for C (0 or 1)
      .DREG(0),                         // Number of pipeline stages for D (0 or 1)
      .INMODEREG(0),                    // Number of pipeline stages for INMODE (0 or 1)
      .MREG(0),                         // Number of multiplier pipeline stages (0 or 1)
      .OPMODEREG(0),                    // Number of pipeline stages for OPMODE (0 or 1)
      .PREG(1)                          // Number of pipeline stages for P (0 or 1)
    )
    DSP48E1_inst (
        // Cascade: 30-bit (each) output: Cascade Ports
        .ACOUT(),                       // 30-bit output: A port cascade output
        .BCOUT(),                       // 18-bit output: B port cascade output
        .CARRYCASCOUT(),                // 1-bit output: Cascade carry output
        .MULTSIGNOUT(),                 // 1-bit output: Multiplier sign cascade output
        .PCOUT(),                       // 48-bit output: Cascade output
        // Control: 1-bit (each) output: Control Inputs/Status Bits
        .OVERFLOW(),                    // 1-bit output: Overflow in add/acc output
        .PATTERNBDETECT(),              // 1-bit output: Pattern bar detect output
        .PATTERNDETECT(),               // 1-bit output: Pattern detect output
        .UNDERFLOW(),                   // 1-bit output: Underflow in add/acc output
        // Data: 4-bit (each) output: Data Ports
        .CARRYOUT(),                    // 4-bit output: Carry output
        .P({unused,result}),                     // 48-bit output: Primary data output
        // Cascade: 30-bit (each) input: Cascade Ports
        .ACIN(30'd0),                   // 30-bit input: A cascade data input
        .BCIN(18'd0),                   // 18-bit input: B cascade input
        .CARRYCASCIN(1'b0),             // 1-bit input: Cascade carry input
        .MULTSIGNIN(1'b0),              // 1-bit input: Multiplier sign input
        .PCIN(48'b0),                   // 48-bit input: P cascade input
        // Control: 4-bit (each) input: Control Inputs/Status Bits
        .ALUMODE(4'b0000),              // 4-bit input: ALU control input
        .CARRYINSEL(3'b000),            // 3-bit input: Carry select input
        .CLK(clk),                      // 1-bit input: Clock input
        .INMODE(5'b00000),              // 5-bit input: INMODE control input
        .OPMODE(7'b0000101),            // 7-bit input: Operation mode input
        // Data: 30-bit (each) input: Data Ports
        .A({6'b0,A}),                   // 30-bit input: A data input
        .B({1'b0,B}),                   // 18-bit input: B data input
        .C(0),                          // 48-bit input: C data input
        .CARRYIN(1'b0),                 // 1-bit input: Carry input signal
        .D(0),                          // 25-bit input: D data input
        // Reset/Clock Enable: 1-bit (each) input: Reset/Clock Enable Inputs
        .CEA1(~a_wait),                 // 1-bit input: Clock enable input for 1st stage AREG
        .CEA2(~a_wait),                 // 1-bit input: Clock enable input for 2nd stage AREG
        .CEAD(1'b0),                    // 1-bit input: Clock enable input for ADREG
        .CEALUMODE(~a_wait),            // 1-bit input: Clock enable input for ALUMODE
        .CEB1(~a_wait),                 // 1-bit input: Clock enable input for 1st stage BREG
        .CEB2(~a_wait),                 // 1-bit input: Clock enable input for 2nd stage BREG
        .CEC(~a_wait),                  // 1-bit input: Clock enable input for CREG
        .CECARRYIN(1'b0),               // 1-bit input: Clock enable input for CARRYINREG
        .CECTRL(~a_wait),               // 1-bit input: Clock enable input for OPMODEREG and CARRYINSELREG
        .CED(1'b0),                     // 1-bit input: Clock enable input for DREG
        .CEINMODE(~a_wait),             // 1-bit input: Clock enable input for INMODEREG
        .CEM(~a_wait),                  // 1-bit input: Clock enable input for MREG
        .CEP(~a_wait),                  // 1-bit input: Clock enable input for PREG
        .RSTA(1'b0),                    // 1-bit input: Reset input for AREG
        .RSTALLCARRYIN(1'b0),           // 1-bit input: Reset input for CARRYINREG
        .RSTALUMODE(1'b0),              // 1-bit input: Reset input for ALUMODEREG
        .RSTB(1'b0),                    // 1-bit input: Reset input for BREG
        .RSTC(1'b0),                    // 1-bit input: Reset input for CREG
        .RSTCTRL(1'b0),                 // 1-bit input: Reset input for OPMODEREG and CARRYINSELREG
        .RSTD(1'b0),                    // 1-bit input: Reset input for DREG and ADREG
        .RSTINMODE(1'b0),               // 1-bit input: Reset input for INMODEREG
        .RSTM(1'b0),                    // 1-bit input: Reset input for MREG
        .RSTP(~resetn)                  // 1-bit input: Reset input for PREG
    );    

endmodule