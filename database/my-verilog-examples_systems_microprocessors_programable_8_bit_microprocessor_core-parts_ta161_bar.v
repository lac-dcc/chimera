// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// 8-bit microprocessor ta161_bar
// 4-bit synchronous counter
// UPDATE FROM THESIS
//   Replaced ta161 in THESIS with jeff-74x161
//   4-bit synchronous counter

module ta161_bar (
    input           CLR_BAR,             // CLEAR
    input           LD_BAR,              // LOAD
    input           ENT,                 // ENABLE T
    input           ENP,                 // ENABLE P
    input           CLK,                 // CLK 
    input           A, B, C, D,          // DATA IN
    output          QA, QB, QC, QD,      // DATA OUT
    output          RCO                  // RIPPLE CARRY OUTPUT
);

// 4-bit synchronous counter
// Replaced ta161 in THESIS with jeff_74x161
jeff_74x161 U1 (
    .clr_bar(CLR_BAR),
    .ld_bar(LD_BAR),
    .ent(ENT),
    .enp(ENP),
    .clk(CLK),
    .a(A),
    .b(B),
    .c(C),
    .d(D),
    .qa(QA),
    .qb(QB),
    .qc(QC),
    .qd(QD),
    .rco(RCO)
);

endmodule