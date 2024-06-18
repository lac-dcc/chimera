// This program was cloned from: https://github.com/DigitalDesignSchool/ce2020labs
// License: MIT License


//tunable clock devider
module sm_clk_divider
#(
    parameter shift  = 16,
              bypass = 0
)
(
    input           clkIn,
    input           rst_n,
    input   [ 3:0 ] devide,
    input           enable,
    output          clkOut
);
    reg  [39:0] cntr;
    wire [39:0] cntrNext = cntr + 1;
    //sm_register_we r_cntr(clkIn, rst_n, enable, cntrNext, cntr);
    always @(posedge clkIn) cntr <= cntrNext;

    assign clkOut = bypass ? clkIn 
                           : cntr[shift + devide];
endmodule