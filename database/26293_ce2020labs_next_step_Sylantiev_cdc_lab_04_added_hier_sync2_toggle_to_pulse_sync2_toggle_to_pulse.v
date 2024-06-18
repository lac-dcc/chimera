// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License

module sync2_toggle_to_pulse
(
    input      clk,
    input      rst,
    input      toggle,
    output     pulse,
    output reg out_toggle
);

    wire s_toggle;

    sync2 i_sync2 (clk, rst, toggle, s_toggle);

    always @ (posedge clk or posedge rst)
        if (rst)
            out_toggle <= 0;
        else
            out_toggle <= s_toggle;

    assign pulse = s_toggle ^ out_toggle;

endmodule
