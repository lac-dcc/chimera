// This program was cloned from: https://github.com/namberino/nam80
// License: BSD 2-Clause "Simplified" License

module ir(
    input clk,
    input rst,
    input write_en,
    input[7:0] data_in,
    output[7:0] out
);

    reg[7:0] ir;

    always @ (posedge clk, posedge rst)
    begin
        if (rst)
            ir <= 8'b0;
        else if (write_en)
            ir <= data_in;
    end

    assign out = ir;

endmodule
