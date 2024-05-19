// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module counter
(
    d_out, clock, rst, d_en
);

    input clock;
    input rst;
    input d_en;
    output [63:0] d_out;

    reg [63:0] counter;

    always @ (posedge clock)
        if(rst)
        begin
            counter <= 64'b0;
        end
        else if(d_en)
        begin
            counter <= counter + 1'b1;
        end
        else
        begin
            counter <= counter;
        end

    assign d_out = counter;

endmodule
