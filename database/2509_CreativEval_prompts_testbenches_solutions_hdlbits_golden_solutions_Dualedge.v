// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module (
    input clk,
    input d,
    output q
);
    
    reg [1:0] status;
    
    always @(posedge clk) begin
        status[0] = d;
    end
    
    always @(negedge clk) begin
        status[1] = d;
    end
    
    assign q = clk ? status[0] : status[1];
    
endmodule