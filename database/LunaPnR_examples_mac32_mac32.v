// SPDX-FileCopyrightText: 2021-2024 Niels Moseley <asicsforthemasses@gmail.com>
//
// SPDX-License-Identifier: GPL-3.0-only
//
// clocked 32x32 multiplier with 64 bit accumulator

module mac32
(
    input  clk,
    input  rst_an,
    input  signed [31:0] a_in,
    input  signed [31:0] b_in,
    output signed [63:0] data_out
);

    wire signed [63:0] multresult;
    reg  signed [63:0] accu;

    assign multresult = a_in * b_in;

    always @(posedge clk or negedge rst_an)
    begin
        if (rst_an == 0)
        begin
            accu <= 0;
        end
        else
        begin
            accu <= accu + multresult;
        end
    end

    assign data_out = accu;

endmodule