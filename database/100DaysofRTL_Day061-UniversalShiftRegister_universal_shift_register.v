// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module universal_shift_register (
    input clk, reset, shift_left, shift_right,
    input [7:0] parallel_in,
    output [7:0] parallel_out
    );

    reg [7:0] reg_data;

    always @(posedge clk) 
     begin
        if (reset)
            reg_data <= 8'b0;

        else if (shift_left)
            reg_data <= {reg_data[6:0], 1'b0};

        else if (shift_right)
            reg_data <= {1'b0, reg_data[7:1]};

        else
            reg_data <= parallel_in;
     end

    assign parallel_out = reg_data;

endmodule

