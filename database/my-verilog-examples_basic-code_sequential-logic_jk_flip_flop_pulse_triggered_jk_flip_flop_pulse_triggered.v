// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A pulse-triggered jk flip-flop (cascading) can be set, reset and toggled.

module jk_flip_flop_pulse_triggered_gate (
    input       clk,        // Clock
    input       j,          // Inputs
    input       k,          // 
    output      q,          // Output
    output      qbar);      //

    // INTERNAL WIRES
    wire        clk2;
    wire        s1, r1;
    wire        s2, r2;
    wire        q1, q1bar;

    // JK FLIP FLOP 1 -----------------------------------

        // NAND7
        nand (s1, j, clk, qbar);

        // NAND8
        nand (r1, k, clk, q);

        // SR- LATCH -------------------------------------
        
        // NAND6
        nand (q1, s1, q1bar);

        // NAND6
        nand (q1bar, r1, q1);

    // JK FLIP FLOP 2 -----------------------------------

        // NAND3
        nand (s2, q1, clk2);

        // NAND4
        nand (r2, q1bar, clk2);

        // SR- LATCH -------------------------------------
        
        // NAND1
        nand (q, s2, qbar);

        // NAND2
        nand (qbar, r2, q);

    // CLOCK -------------------------------------------

        not (clk2, clk);

endmodule

module jk_flip_flop_pulse_triggered_dataflow (
    input       clk,        // Clock
    input       j,          // Inputs
    input       k,          // 
    output      q,          // Output
    output      qbar);      //

    // JK FLIP FLOP 1 -----------------------------------

        // NAND7
        assign s1 = ~(j & clk & qbar);

        // NAND8
        assign r1 = ~(k & clk & q);

        // SR- LATCH -------------------------------------
        
        // NAND6
        assign q1 = ~(s1 & q1bar);

        // NAND6
        assign q1bar = ~(r1 & q1);

    // JK FLIP FLOP 2 -----------------------------------

        // NAND3
        assign s2 = ~(q1 & clk2);

        // NAND4
        assign r2 = ~(q1bar & clk2);

        // SR- LATCH -------------------------------------
        
        // NAND1
        assign q = ~(s2 & qbar);

        // NAND2
        assign qbar = ~(r2 & q);

    // CLOCK -------------------------------------------

        assign clk2 = ~(clk);

endmodule

module jk_flip_flop_pulse_triggered_behavioral (
    input       clk,        // Clock
    input       j,          // Inputs
    input       k,          // 
    output reg  q,          // Output
    output      qbar);      //

    // INTERNAL WIRES
    assign qbar = ~q;

    always @(posedge clk) begin
        case({j,k})
            2'b0_0 : q <= q;
            2'b0_1 : q <= 1'b0;
            2'b1_0 : q <= 1'b1;
            2'b1_1 : q <= ~q;
        endcase
    end

endmodule