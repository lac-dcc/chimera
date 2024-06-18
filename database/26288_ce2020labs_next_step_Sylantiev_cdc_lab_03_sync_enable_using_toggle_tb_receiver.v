// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module tb_receiver
(
    input            clk,
    input            rst,
    input            en,
    input      [3:0] data,
    output reg [3:0] expected,
    output reg       failure
);

    always @ (posedge clk or posedge rst)
        if (rst)
        begin
            expected <= 1;
            failure  <= 0;
        end
        else if (en)
        begin
            if (data == expected)
            begin
                $display ("Receive %d", data);
                failure <= 0;
            end
            else
            begin
                $display ("Failure: receive %d, expected %d",
                    data, expected);

                failure <= 1;
            end

            expected <= expected + 1;
        end
        else
        begin
            failure <= 0;
        end

endmodule
