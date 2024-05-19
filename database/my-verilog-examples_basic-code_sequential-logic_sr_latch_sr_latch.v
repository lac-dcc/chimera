// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A sr (set ready) latch which is level-triggered that can be set and reset.
// The latch forms the basic building block of other types of latches and flip-flops.

module sr_latch_gate (
    input       s,          // Inputs
    input       r,          // 
    output      q,          // Output
    output      qbar);      //
    
    // NAND1
    nand (q, s, qbar);

    // NAND2
    nand (qbar, r, q);

endmodule

module sr_latch_dataflow (
    input       s,          // Inputs
    input       r,          // 
    output      q,          // Output
    output      qbar);      //

    // NAND1
    assign q = ~(s & qbar);

    // NAND2
    assign qbar = ~(r & q);

endmodule

module sr_latch_behavioral (
    input       s,          // Inputs
    input       r,          // 
    output reg  q,          // Output
    output      qbar);      //

    always @(*) begin
        case({s,r})
            2'b0_0 : q <= 1'bx;
            2'b0_1 : q <= 1'b1;
            2'b1_0 : q <= 1'b0;
            2'b1_1 : q <= q;
        endcase
    end

endmodule
