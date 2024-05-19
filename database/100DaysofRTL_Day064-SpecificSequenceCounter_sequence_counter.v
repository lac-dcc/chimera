// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module sequence_counter(
    input clk,
    input reset,
    output reg [3:0] counter
);

reg [3:0] count;

always @(posedge clk, posedge reset) begin
    if (reset) begin
        count <= 4'b0000;
        counter <= 4'b0000;
    end 

    else begin
        case (count)
            4'b0000: begin // 0
                counter <= 4'b0000;
                count <= 3'b010;
            end
            4'b0010: begin // 2
                counter <= 4'b0010;
                count <= 4'b0101;
            end
            4'b0101: begin // 5
                counter <= 4'b0101;
                count <= 4'b1000;
            end
            4'b1000: begin // 8
                counter <= 4'b1000;
                count <= 4'b1011;
            end
            4'b1011: begin // 11
                counter <= 4'b1011;
                count <= 4'b1110;
            end
            4'b1110: begin // 14
                counter <= 4'b1110;
                count <= 4'b0000;
            end
            default: count <= 4'b0000;
        endcase
    end
end

endmodule

