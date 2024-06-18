// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module tb_sender
(
    input            clk,
    input            rst,
    output reg [3:0] data,
    output reg       en,

    input      [7:0] gap_from,
    input      [7:0] gap_to
);

    reg [7:0] cnt;

    always @ (posedge clk or posedge rst)
        if (rst)
        begin
            data <= 0;
            en   <= 0;
            cnt  <= 0;
        end
        else if (cnt != 0)
        begin
            cnt  <= cnt - 1;
            en   <= 0;
        end
        else
        begin
            $display ("Sending %d", data + 1);

            data <= data + 1;
            en   <= 1;

            cnt  <= $urandom_range (gap_from, gap_to);
        end

endmodule
