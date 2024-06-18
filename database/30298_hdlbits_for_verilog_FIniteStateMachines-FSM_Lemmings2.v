// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
	output aaah); //  

    parameter LEFT_W=0, LEFT_F=1, RIGHT_W=2, RIGHT_F=3;//, ...
    reg [1:0] state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            LEFT_W: next_state<=(~ground)?LEFT_F:((bump_left)?RIGHT_W:LEFT_W);
            LEFT_F: next_state<=(ground)?LEFT_W:LEFT_F;
            RIGHT_W: next_state<=(~ground)?RIGHT_F:((bump_right)?LEFT_W:RIGHT_W);
            RIGHT_F: next_state<=(ground)?RIGHT_W:RIGHT_F;
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

endmodule
