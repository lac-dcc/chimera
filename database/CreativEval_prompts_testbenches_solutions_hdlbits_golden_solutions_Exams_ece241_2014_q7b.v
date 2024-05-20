// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    
    wire [3:0] q0, q1, q2;

    bcdcount counter0 (clk, reset, c_enable[0], q0);
    bcdcount counter1 (clk, reset, c_enable[1], q1);
    bcdcount counter2 (clk, reset, c_enable[2], q2);

    assign c_enable = {(q1 == 4'd9) && (q0 == 4'd9), q0 == 4'd9, 1'b1};
    assign OneHertz = (q2 == 4'd9) && (q1 == 4'd9) && (q0 == 4'd9);
    
endmodule