// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

module inv_shift_reg
(
    din,
    dout,
    clock,
    rst
);

    input din;
    output dout;

    input clock;
    input rst;

    reg [31:0] s_reg;

    always @ (posedge clock)
        if(rst)
            s_reg <= 32'b0;
        else
            begin
                s_reg[31:1] <= s_reg[30:0];
                s_reg[0] <= din;
            end

    assign dout = s_reg[31];

endmodule
