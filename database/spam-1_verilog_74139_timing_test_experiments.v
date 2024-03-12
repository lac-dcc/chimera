// License: Mozilla Public License : Version 2.0
// Author : John Lonergan
// verilator lint_off UNOPTFLAT

// SEE Figure 5 - https://www-inst.eecs.berkeley.edu/~cs152/fa06/handouts/CummingsHDLCON1999_BehavioralDelays_Rev1_1.pdf


//`define CORRECT_RHS_NON_BLOCKING
//`define INCORRECT_LHS_BLOCKING
//`define INCORRECT_RHS_BLOCKING
`define CONTINUOUS_ASSIGN

module adder_t6 (co, sum, a, b, ci);
 output co;
 output [3:0] sum;
 input [3:0] a, b;
 input ci;
 reg co;
 reg [3:0] sum;

 always @(a or b or ci)
`ifdef CORRECT_RHS_NON_BLOCKING
    {co, sum} <= #12 a + b + ci;
`else
    `ifdef INCORRECT_LHS_BLOCKING
        #12 {co, sum} = a + b + ci;
    `else
        `ifdef INCORRECT_RHS_BLOCKING
            {co, sum} = #12 a + b + ci;
        `else
            $write(""); // noop
        `endif
    `endif
`endif

`ifdef CONTINUOUS_ASSIGN
    // output is delayed until all inputs have been stable for at least 12 ns - so output wil be continuously deferred
    assign #12 {co, sum} =  (a + b + 4'(ci));
`endif

endmodule


module test();
 wire co;
 wire [3:0] sum;
 logic [3:0] a, b;
 logic ci;

    adder_t6 a1(.co, .sum, .a, .b, .ci);

    localparam propagation_delay=12;
    localparam short_delay=2;
    localparam long_delay=propagation_delay+1;

    initial begin
        a=0;
        b=1;
        ci=0;

        #long_delay 
        a=1;

        #short_delay 
        b=2;

    end

    initial begin
        #long_delay
        if (sum != 1) begin
            $display($time, " bad sum: expected 1 but got ", sum);
        end

        #(propagation_delay+1)
        if (sum != 2) begin
            $display($time, " bad sum: expected 2 but got ", sum);
        end

        #(short_delay)
        if (sum != 3) begin
            $display($time, " bad sum: expected 3 but got ", sum);
        end

        #100 
        // does it ever emerge?
        if (sum != 3) begin
            $display($time, " bad sum: expected 3 but got ", sum);
        end


        $display("tweak");
        #10
        a=2;
        #10
        b=1;
        #10
        a=1;
        #10
        b=2;


        #1000
        $display("end");
    end

    always @* begin
        $display($time, " co %d sum %d", co, sum);
    end

endmodule
