// This program was cloned from: https://github.com/viktor-prutyanov/drec-fpga-intro
// License: GNU General Public License v2.0

module uart_tx (
    input clk,
    input start,
    input [7:0]data,
    output reg q = 1'b1
);

reg [12:0]cnt = 13'b0;
reg [3:0]bit_num = 4'b1111;
wire bit_start = (cnt == 5208);
wire idle = (bit_num == 4'hF);

always @(posedge clk) begin
    if (start && idle)
        cnt <= 13'b0;
    else if (bit_start)
        cnt <= 13'b0;
    else
        cnt <= cnt + 13'b1;
end

always @(posedge clk) begin
    if (start && idle) begin
        bit_num <= 4'h0;
        q <= 1'b0; // Start
    end
    else if (bit_start) begin
        case (bit_num)
        4'h0: begin bit_num <= 4'h1; q <= data[0]; end
        4'h1: begin bit_num <= 4'h2; q <= data[1]; end
        4'h2: begin bit_num <= 4'h3; q <= data[2]; end
        4'h3: begin bit_num <= 4'h4; q <= data[3]; end
        4'h4: begin bit_num <= 4'h5; q <= data[4]; end
        4'h5: begin bit_num <= 4'h6; q <= data[5]; end
        4'h6: begin bit_num <= 4'h7; q <= data[6]; end
        4'h7: begin bit_num <= 4'h8; q <= data[7]; end
        4'h8: begin bit_num <= 4'h9; q <= 1'b1; end // Stop
        default: begin bit_num <= 4'hF; end
        endcase
    end
end

endmodule
