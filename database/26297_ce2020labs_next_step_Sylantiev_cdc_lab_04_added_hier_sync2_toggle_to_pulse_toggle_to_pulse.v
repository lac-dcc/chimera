// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module toggle_to_pulse
(
    input  clk,
    input  rst,
    input  toggle,
    output pulse
);

    reg r_toggle;

    always @ (posedge clk or posedge rst)
        if (rst)
            r_toggle <= 0;
        else
            r_toggle <= toggle;

    assign pulse = toggle ^ r_toggle;

endmodule
