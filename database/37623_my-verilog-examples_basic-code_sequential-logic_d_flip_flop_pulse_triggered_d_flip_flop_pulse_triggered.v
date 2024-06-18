// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// A pulse-triggered d flip-flop (cascading) can save input data on output.

module d_flip_flop_pulse_triggered_gate (
    input       clk,        // Clock
    input       d,          // Inputs
    output      q,          // Output
    output      qbar);      //

    // INTERNAL WIRES
    wire        clk1;

    //NOT 3  
    not (clk1, clk);

    // D-FLIP FLOP (BOSS)

        // INTERNAL WIRES
        wire        s1, r1;
        wire        s2, r2;
      
        assign s1 = d;
      
        // NOT2
        not (r1, s1);

        // SR FLIP-FLOP ---------------------------------

        // NAND7
        nand (s2, s1, clk1);

        // NAND8
        nand (r2, r1, clk1);

        // SR-LATCH -------------------------------------
        
        // NAND5
        nand (q1, s2, q1bar);

        // NAND6
        nand (q1bar, r2, q1);

    // D-FLIP FLOP (WORKER)

        // INTERNAL WIRES
        wire        s3, r3;
        wire        s4, r4;
      
        assign s3 = q1;
      
        // NOT1
        not (r3, s3);

        // SR FLIP-FLOP ---------------------------------

        // NAND3
        nand (s4, s3, clk1);

        // NAND4
        nand (r4, r3, clk1);

        // SR-LATCH -------------------------------------
        
        // NAND1
        nand (q, s4, qbar);

        // NAND2
        nand (qbar, r4, q);

endmodule

module d_flip_flop_pulse_triggered_dataflow (
    input       clk,        // Clock
    input       d,          // Inputs
    output      q,          // Output
    output      qbar);      //

    // INTERNAL WIRES
    wire        clk1;

    // NOT3  
    assign clk1 = ~clk;

    // D-FLIP FLOP (BOSS)

        // INTERNAL WIRES
        wire        s1, r1;
        wire        s2, r2;
      
        assign s1 = d;
      
        // NOT2
        assign r1 = ~s1;

        // SR FLIP-FLOP ---------------------------------

        // NAND7
        assign s2 = ~(s1 & clk1);

        // NAND8
        assign r2 = ~(r1 & clk1);

        // SR-LATCH -------------------------------------
        
        // NAND5
        assign q1 = ~( s2 & q1bar);

        // NAND6
        assign q1bar = ~(r2 & q1);

    // D-FLIP FLOP (WORKER)

        // INTERNAL WIRES
        wire        s3, r3;
        wire        s4, r4;
      
        assign s3 = q1;
      
        // NOT1
        assign r3 = ~s3;

        // SR FLIP-FLOP ---------------------------------

        // NAND3
        assign s4 = ~(s3 & clk1);

        // NAND4
        assign r4 = ~(r3 & clk1);

        // SR-LATCH -------------------------------------
        
        // NAND1
        assign q = ~(s4 & qbar);

        // NAND2
        assign qbar = ~(r4 & q);

endmodule

module d_flip_flop_pulse_triggered_behavioral (
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
