// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module register
#(  parameter WIDTH = 8 )
(
    input clk,
    input rst_n,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out
);

    always @(posedge clk)
        begin
            if(!rst_n)
                data_out <= 0;
            else
                data_out <= data_in;
        end


endmodule
