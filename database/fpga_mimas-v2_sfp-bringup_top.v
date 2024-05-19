// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module top(
    input   SFP0_DETECT,
    input   SFP0_LOS,
    output  SFP0_DISABLE,
    output  SFP0_TX,

    input   SFP1_DETECT,
    input   SFP1_LOS,
    output  SFP1_DISABLE,
    output  SFP1_TX,

    input   SFP2_DETECT,
    input   SFP2_LOS,
    output  SFP2_DISABLE,
    output  SFP2_TX,

    input   SFP3_DETECT,
    input   SFP3_LOS,
    output  SFP3_DISABLE,
    output  SFP3_TX,

    input           CLK_100MHz,
    input   [3:0]   DP,
    output 	[7:0]   LED,
    output  [2:0]   SevenSegmentEnable,
    output  [0:0]   SevenSegment
);

    sfp sfp0(
        .detect(SFP0_DETECT),
        .los(SFP0_LOS),
        .shutdown(SFP0_DISABLE),
        .tx(SFP0_TX),

        .clk(CLK_100MHz),
        .o_detect(LED[7]),
        .o_los(LED[6]),
        .i_shutdown(DP[0])
    );

    sfp sfp1(
        .detect(SFP1_DETECT),
        .los(SFP1_LOS),
        .shutdown(SFP1_DISABLE),
        .tx(SFP1_TX),

        .clk(CLK_100MHz),
        .o_detect(LED[5]),
        .o_los(LED[4]),
        .i_shutdown(DP[1])
    );

    sfp sfp2(
        .detect(SFP2_DETECT),
        .los(SFP2_LOS),
        .shutdown(SFP2_DISABLE),
        .tx(SFP2_TX),

        .clk(CLK_100MHz),
        .o_detect(LED[3]),
        .o_los(LED[2]),
        .i_shutdown(DP[2])
    );

    sfp sfp3(
        .detect(SFP3_DETECT),
        .los(SFP3_LOS),
        .shutdown(SFP3_DISABLE),
        .tx(SevenSegment[0]),

        .clk(CLK_100MHz),
        .o_detect(LED[1]),
        .o_los(LED[0]),
        .i_shutdown(DP[3])
    );
    

    // Disable seven segment display
    assign SevenSegmentEnable = 3'b111;

endmodule
