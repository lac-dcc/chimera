// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module (
    input clk,
    input resetn,
    input [1:0] byteena,
    input [15:0] d,
    output [15:0] q
);
    
    always @(posedge clk) begin
        if(!resetn) begin
            q <= 0;
        end
        else begin
            q[15:8] <= byteena[1] ? d[15:8] : q[15:8];
            q[7:0] <= byteena[0] ? d[7:0] : q[7:0];
        end
    end

endmodule