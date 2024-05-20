// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter LEFT=0, RIGHT=1;//, ...
    reg state, next_state;

    always @(*) begin
        // State transition logic
        case(state)
            LEFT: next_state<=(bump_left)?RIGHT:LEFT;
            RIGHT: next_state<=(bump_right)?LEFT:RIGHT;
        endcase            
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state<=LEFT;
        else
            state<=next_state;
    end

    // Output logic
    assign walk_left = (state == LEFT);
    assign walk_right = (state == RIGHT);

endmodule

