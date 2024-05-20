// This program was cloned from: https://github.com/uwsampl/lakeroad-evaluation
// License: MIT License

module two_stage_mult(input [15:0] a, input [15:0] b, output [31:0] out, input clk);
    logic [31:0] register;
    logic [31:0] register2;

    always @ (posedge clk) begin
        register <= a * b;
        register2 <= register;
    end

    assign out = register2;
endmodule