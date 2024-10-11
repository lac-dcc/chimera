// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module pulse_to_toggle
(
    input      clk,
    input      rst,
    input      pulse,
    output reg toggle
);

    always @ (posedge clk or posedge rst)
        if (rst)
            toggle <= 0;
        else
            toggle <= toggle ^ pulse;

endmodule
