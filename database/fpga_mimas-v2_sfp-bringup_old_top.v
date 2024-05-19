// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module top(
    input 		    CLK_100MHz,

    input           SFP0_RX,
    output          SFP0_TX,
    input           SFP0_DETECT,
    input           SFP0_LOS,
    input           SFP0_FAULT,
    output          SFP0_DISABLE,
    inout           SFP0_SDA,
    output          SFP0_SCL,
    input           DP1,

    //input         SFP3_RX,
    output          SFP3_TX,
    input           SFP3_DETECT,
    input           SFP3_LOS,
    //input         SFP3_FAULT,
    output          SFP3_DISABLE,
    inout           SFP3_SDA,
    output          SFP3_SCL,
    input           DP4,

    output 	[7:0]   LED,
    output  [2:0]   SevenSegmentEnable
);

    sfp sfp0 (
        .rx(SFP0_RX),
        .tx(SFP0_TX),
        .detect(SFP0_DETECT),
        .los(SFP0_LOS),
        .fault(SFP0_FAULT),
        .shutdown(SFP0_DISABLE),
        .sda(SFP0_SDA),
        .scl(SFP0_SCL),

        .clk(CLK_100MHz),
        .enable(DP1)
    );



    //////////
    // SFP3 //
    //////////

    // Disable I²C interface
    assign SFP3_SDA = 1'b0;
    assign SFP3_SCL = 1'b0;

    // Disable transmitter with button (active low)
    assign SFP3_DISABLE = ~DP4;

    // Assign DETECT and LOS to LEDs
    assign LED[1] = ~SFP3_DETECT;
    assign LED[0] = SFP3_LOS;

    assign SFP3_TX = 1'b0;



    // Disable seven segment display and unused LEDs
    assign LED[5:2] = 4'b0000;
    assign SevenSegmentEnable = 3'b111;

endmodule
