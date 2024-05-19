// This program was cloned from: https://github.com/john9636/SortingNetwork
// License: Apache License 2.0

//////////////////////////////////////////
//
// Module Name: input_2.v
// Created date: 08/10/2020
// Last Modified: 08/10/2020
// Description: 2 input comparing/sorting
// Author: John Zhang
// Company: Shanghai Jiao Tong University
// 
///////////////////////////////////////////

`timescale 1ns / 1ps
module input_2 #
(
    parameter DATA_WIDTH = 8,
    parameter LABEL_WIDTH = 1,
    parameter SIGNED = 0,
    parameter ASCENDING = 1
)
(
    input clk, rst, x_valid,
    input [DATA_WIDTH-1 : 0] x_0, x_1,
    input [LABEL_WIDTH-1 : 0] x_label_0, x_label_1,
    output reg [DATA_WIDTH-1 : 0] y_0, y_1,
    output reg [LABEL_WIDTH-1 : 0] y_label_0, y_label_1,
    output reg y_valid
);

always @ (posedge clk)
begin
    if (rst == 1'b1) begin
        y_0 <= 0;
        y_1 <= 0;
        y_valid <= 0;
    end else begin
        y_valid <= x_valid;
        if (SIGNED == 0) begin
            if (ASCENDING == 1) begin
                if ($unsigned(x_0) < $unsigned(x_1)) begin
                    y_0 <= x_0;
                    y_label_0 <= x_label_0;
                    y_1 <= x_1;
                    y_label_1 <= x_label_1;
                end else begin
                    y_0 <= x_1;
                    y_label_0 <= x_label_1;
                    y_1 <= x_0;
                    y_label_1 <= x_label_0;
                end
            end else if (ASCENDING == 0) begin
                if ($unsigned(x_0) > $unsigned(x_1)) begin
                    y_0 <= x_0;
                    y_label_0 <= x_label_0;
                    y_1 <= x_1;
                    y_label_1 <= x_label_1;
                end else begin
                    y_0 <= x_1;
                    y_label_0 <= x_label_1;
                    y_1 <= x_0;
                    y_label_1 <= x_label_0;
                end
            end
        end else if (SIGNED == 1) begin
            if (ASCENDING == 1) begin
                if ($signed(x_0) < $signed(x_1)) begin
                    y_0 <= x_0;
                    y_label_0 <= x_label_0;
                    y_1 <= x_1;
                    y_label_1 <= x_label_1;
                end else begin
                    y_0 <= x_1;
                    y_label_0 <= x_label_1;
                    y_1 <= x_0;
                    y_label_1 <= x_label_0;
                end
            end else if (ASCENDING == 0) begin
                if ($signed(x_0) > $signed(x_1)) begin
                    y_0 <= x_0;
                    y_label_0 <= x_label_0;
                    y_1 <= x_1;
                    y_label_1 <= x_label_1;
                end else begin
                    y_0 <= x_1;
                    y_label_0 <= x_label_1;
                    y_1 <= x_0;
                    y_label_1 <= x_label_0;
                end
            end
        end
    end
end

endmodule


