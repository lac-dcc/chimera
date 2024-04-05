`default_nettype none


module to_gray (
    input        clk,
    input        enable,
    input  [3:0] binary,
    output [3:0] gray
    );

    reg [3:0] gray_reg;

    always @(posedge clk)
        if (enable)
            gray_reg <= binary ^ binary >> 1;

    assign gray = gray_reg;

endmodule // to_gray


module to_binary (
    input        clk,
    input        enable,
    input  [3:0] gray,
    output [3:0] binary
    );

    reg [3:0] binary_reg;

    always @(posedge clk)
        if (enable)
            binary_reg <= {
                ^gray[3:3],
                ^gray[3:2],
                ^gray[3:1],
                ^gray[3:0]
            };

    assign binary = binary_reg;

endmodule // to_binary


module top (input CLK, output LEDG_N, output LEDR_N);

    reg  [3:0] binary;
    reg        ok;
    wire [3:0] gray;
    wire [3:0] bin2;

    to_gray uut1 (.clk(CLK), .enable(1), .binary(binary), .gray(gray));
    to_binary uut2 (.clk(CLK), .enable(1), .gray(gray), .binary(bin2));

    initial
        binary = 0;

    always @(posedge CLK) begin
        binary <= binary + 1;
        ok <= bin2 + 4'd2 == binary;
    end

    assign LEDG_N = ~ok;
    assign LEDR_N = ok;

endmodule //top
