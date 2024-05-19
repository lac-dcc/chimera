// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// Synchronous presettable 4-bit binary counter, asynchronous clear.
// Based on the 7400-series integrated circuits used in my programable-8-bit-microprocessor.
//
// MUST PUT includes IN TESTBENCH SINCE MY 8-bit PROCESSOR IS CALLING THESE FILES
//`include "sections/output-section.v"

module jeff_74x161(
    input           clr_bar,             // ASYNC CLEAR
    input           ld_bar,              // LOAD
    input           ent,                 // ENABLE T
    input           enp,                 // ENABLE P
    input           clk,                 // CLK
    input           a, b, c, d,          // DATA IN
    output          qa, qb, qc, qd,      // DATA OUT
    output          rco);                // RIPPLE CARRY OUTPUT

    wire ld;
    wire ent_and_enp;

    assign rco = ent & qd & qc & qb & qa;

    assign ld = ~ld_bar;
    assign ent_and_enp = ent & enp;

    assign feedback_qd = ent_and_enp & qc & qb & qa;

    output_section OUTPUT_QD (
        .clr_bar(clr_bar),
        .ld(ld),
        .feedback(feedback_qd),
        .clk(clk),
        .data(d),
        .q(qd)
    );

    assign feedback_qc =  ent_and_enp & qb & qa;

    output_section OUTPUT_QC (
        .clr_bar(clr_bar),
        .ld(ld),
        .feedback(feedback_qc),
        .clk(clk),
        .data(c),
        .q(qc)
    );

    assign feedback_qb = ent_and_enp & qa;

    output_section OUTPUT_QB (
        .clr_bar(clr_bar),
        .ld(ld),
        .feedback(feedback_qb),
        .clk(clk),
        .data(b),
        .q(qb)
    );

    assign feedback_qa = ent_and_enp;

    output_section OUTPUT_QA (
        .clr_bar(clr_bar),
        .ld(ld),
        .feedback(feedback_qa),
        .clk(clk),
        .data(a),
        .q(qa)
    );

endmodule
