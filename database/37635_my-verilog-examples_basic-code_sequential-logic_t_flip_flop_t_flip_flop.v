// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A t flip-flop which is pulse-triggered can be toggled.
// This has a race condition when clock is high.

module t_flip_flop_gate (
    input       clk,        // Clock
    input       t,          // Inputs
    output      q,          // Output
    output      qbar);      //

    // INTERNAL WIRES
    wire        j, k;
    wire        s, r;

    assign j = t;
    assign k = t;

    // JK FLIP-FLOP -----------------------------------

    // NAND3
    nand (s, j, clk, qbar);

    // NAND4
    nand (r, k, clk, q);

    // SR- LATCH -------------------------------------
    
    // NAND1
    nand (q, s, qbar);

    // NAND2
    nand (qbar, r, q);

endmodule

module t_flip_flop_dataflow (
    input       clk,        // Clock
    input       t,          // Inputs
    output      q,          // Output
    output      qbar);      //

    // INTERNAL WIRES
    wire        s, r;

    // JK FLIP-FLOP -----------------------------------
  
    // NAND3
    assign s = ~(t & clk & qbar);

    // NAND4
    assign r = ~(t & clk & q);

    // SR- LATCH -------------------------------------
    
    // NAND1
    assign q = ~(s & qbar);

    // NAND2
    assign qbar = ~(r & q);

endmodule

module t_flip_flop_behavioral (
    input       clk,        // Clock
    input       t,          // Inputs
    output reg  q,          // Output
    output      qbar);      //

    parameter   HOLD   = 1'b0,
                TOGGLE = 1'b1;

    // INTERNAL WIRES
    assign qbar = ~q;

    always @(posedge clk) begin
        case({t})
            HOLD :    q <= q;
            TOGGLE :  q <= ~q;
        endcase
    end

endmodule