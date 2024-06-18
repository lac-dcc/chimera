// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A d flip-flop which is pulse-triggered can save input data on output.

module d_flip_flop_gate (
    input       clk,        // Clock
    input       d,          // Inputs
    output      q,          // Output
    output      qbar);      //

    // INTERNAL WIRES
    wire        s, r;
    wire        s1, r1;
  
    assign s = d;
  
    // NOT1
    not (r, s);

    // SR FLIP-FLOP ---------------------------------

    // NAND3
    nand (s1, s, clk);

    // NAND4
    nand (r1, r, clk);

    // SR-LATCH -------------------------------------
    
    // NAND1
    nand (q, s1, qbar);

    // NAND2
    nand (qbar, r1, q);

endmodule

module d_flip_flop_dataflow (
    input       clk,        // Clock
    input       d,          // Inputs
    output      q,          // Output
    output      qbar);      //

    assign s = d;
    assign r = ~d;

    // SR FLIP-FLOP ---------------------------------

    // INTERNAL WIRES
    wire        s1, r1;
  
    // NAND3
    assign s1 = ~(s & clk);

    // NAND4
    assign r1 = ~(r & clk);

    // SR- LATCH -------------------------------------
    
    // NAND1
    assign q = ~(s1 & qbar);

    // NAND2
    assign qbar = ~(r1 & q);

endmodule

module d_flip_flop_behavioral (
    input       clk,        // Clock
    input       d,          // Inputs
    output reg  q,          // Output
    output      qbar);      //

    parameter    DATA0 = 1'b0,
                 DATA1 = 1'b1;

    // INTERNAL WIRES
    assign qbar = ~q;

    always @(posedge clk) begin
        case({d})
            DATA0 : q <= 1'b0;
            DATA1 : q <= 1'b1;
        endcase
    end

endmodule
