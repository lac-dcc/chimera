// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module sync2
(
    input      clk,
    input      rst,
    input      in,
    output reg out
);

    reg r;

    always @ (posedge clk or posedge rst)
        if (rst)
            { out, r } <= 0;
        else
            { out, r } <= { r, in };

endmodule
