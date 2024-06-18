// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    parameter LEFT_W=0, LEFT_F=1, LEFT_DIG =2, RIGHT_W=3, RIGHT_F=4, RIGHT_DIG=5 ;//, ...
	reg [2:0] state, next_state;	

    always @(*) begin
        // State transition logic
        case(state)
            LEFT_W: next_state<=(~ground)?LEFT_F:(dig)?LEFT_DIG:(bump_left)?RIGHT_W:LEFT_W;
            LEFT_F: next_state<=(ground)?LEFT_W:LEFT_F;
            LEFT_DIG: next_state<=(~ground)?LEFT_F:LEFT_DIG;
            RIGHT_W: next_state<=(~ground)?RIGHT_F:(dig)?(RIGHT_DIG):(bump_right)?LEFT_W:RIGHT_W;
            RIGHT_F: next_state<=(ground)?RIGHT_W:RIGHT_F;
            RIGHT_DIG: next_state<=(~ground)?RIGHT_F:RIGHT_DIG;
        endcase            
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state<=LEFT_W;
        else
            state<=next_state;
    end

    // Output logic
    assign aaah = (state == LEFT_F || state == RIGHT_F);
    assign walk_left = (state == LEFT_W);
    assign walk_right = (state == RIGHT_W);
	assign digging = (state == LEFT_DIG || state == RIGHT_DIG);


endmodule
