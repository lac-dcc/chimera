// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module down_counter_3bit(
    input wire clk,
    input wire rst,
    output reg [7:0] count
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 8'd0;
        else
            count <= count - 1;
    end

endmodule

