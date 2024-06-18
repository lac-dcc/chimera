// This program was cloned from: https://github.com/pmezydlo/BeagleWire
// License: GNU General Public License v2.0

module gpio_port (inout  [7:0] io,
                  input  [7:0] dir,
                  input  [7:0] Input,
                  output [7:0] Output);

//Tri-State buffer controll
SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b 0)
) io0 (
    .PACKAGE_PIN(io[0]),
    .OUTPUT_ENABLE(dir[0] == 1'b1),
    .D_OUT_0(Output[0]),
    .D_IN_0(Input[0]),
);

//Tri-State buffer controll
SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b 0)
) io1 (
    .PACKAGE_PIN(io[1]),
    .OUTPUT_ENABLE(dir[1] == 1'b1),
    .D_OUT_0(Output[1]),
    .D_IN_0(Input[1]),
);

//Tri-State buffer controll
SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b 0)
) io2 (
    .PACKAGE_PIN(io[2]),
    .OUTPUT_ENABLE(dir[2] == 1'b1),
    .D_OUT_0(Output[2]),
    .D_IN_0(Input[2]),
);

//Tri-State buffer controll
SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b 0)
) io3 (
    .PACKAGE_PIN(io[3]),
    .OUTPUT_ENABLE(dir[3] == 1'b1),
    .D_OUT_0(Output[3]),
    .D_IN_0(Input[3]),
);

//Tri-State buffer controll
SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b 0)
) io4 (
    .PACKAGE_PIN(io[4]),
    .OUTPUT_ENABLE(dir[4] == 1'b1),
    .D_OUT_0(Output[4]),
    .D_IN_0(Input[4]),
);

//Tri-State buffer controll
SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b 0)
) io5 (
    .PACKAGE_PIN(io[5]),
    .OUTPUT_ENABLE(dir[5] == 1'b1),
    .D_OUT_0(Output[5]),
    .D_IN_0(Input[5]),
);

//Tri-State buffer controll
SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b 0)
) io6 (
    .PACKAGE_PIN(io[6]),
    .OUTPUT_ENABLE(dir[6] == 1'b1),
    .D_OUT_0(Output[6]),
    .D_IN_0(Input[6]),
);

//Tri-State buffer controll
SB_IO # (
    .PIN_TYPE(6'b1010_01),
    .PULLUP(1'b 0)
) io7 (
    .PACKAGE_PIN(io[7]),
    .OUTPUT_ENABLE(dir[7] == 1'b1),
    .D_OUT_0(Output[7]),
    .D_IN_0(Input[7]),
);

endmodule
