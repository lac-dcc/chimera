// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 

    parameter idle=2'd0, one=2'd1, two=2'd2, three=2'd3;
    reg	[1:0]	state, next_state;
    
    always@(*) begin
        case({state, x})
            {idle, 1'b0}:	next_state = idle;
            {idle, 1'b1}:	next_state = one;
            {one, 1'b0}:	next_state = two;
            {one, 1'b1}:	next_state = one;
            {two, 1'b0}:	next_state = idle;
            {two, 1'b1}:	next_state = three;
        endcase
    end
    
    always@(posedge clk or negedge aresetn) begin
        if(~aresetn)
            state <= idle;
        else
            state <= next_state;
    end
    
    assign	z = (state == two && x == 1'b1);
    
endmodule

/* 官方
*
    * module top_module (
        input clk,
        input aresetn,
        input x,
        output reg z
);

        // Give state names and assignments. I'm lazy, so I like to use decimal numbers.
        // It doesn't really matter what assignment is used, as long as they're unique.
        parameter S=0, S1=1, S10=2;
        reg[1:0] state, next;           // Make sure state and next are big enough to hold the state encodings.



        // Edge-triggered always block (DFFs) for state flip-flops. Asynchronous reset.
        always@(posedge clk, negedge aresetn)
                if (<= S;
                else
                        state <= next;



    // Combinational always block for state transition logic. Given the current state and inputs,
    // what should be next state be?
    // Combinational always block: Use blocking assignments.
        always@(*) begin
                case (state)
                        S: next = x ? S1 : S;
                        S1: next = x ? S1 : S10;
                        S10: next = x ? S1 : S;
                        default: next = 'x;
                endcase
        end



        // Combinational output logic. I used a combinational always block.
        // In a Mealy state machine, the output depends on the current state *and*
        // the inputs.
        always@(*) begin
                case (state)
                        S: z = 0;
                        S1: z = 0;
                        S10: z = x;             // This is a Mealy state machine: The output can depend (combinational) on the input.
                        default: z = 1'bx;
                endcase
        end

endmodule

