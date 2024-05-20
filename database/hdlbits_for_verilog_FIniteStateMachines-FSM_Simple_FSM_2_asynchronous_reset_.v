// This program was cloned from: https://github.com/anik-m/hdlbits_for_verilog
// License: GNU General Public License v3.0

module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        if(state == OFF)
            next_state <= (j)?ON:OFF;
        else if(state == ON)
            next_state <= (k)?OFF:ON;
            
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset)
            state<=OFF;
        else 
            state<=next_state;
    end

    assign out = state;
    // Output logic
    // assign out = (state == ...);

endmodule
