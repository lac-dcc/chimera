// This program was cloned from: https://github.com/szym-mie/vga3
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns/1ps

// Xilinx DCM clock source

module clksrc #(
    parameter CLKIN_PERIOD=10, // in ns
    parameter CLK_DIV=2,
    parameter CLK_MUL=4
) (
    input wire ClkInIBufg,
    output wire ClkOutSrc
);

wire ClkIbufg;
wire ClkBufg;
wire ClkDcmOut;

wire DcmRst;
wire[7:0] DcmStatus;
wire DcmLocked;
wire DcmClkFxStopped = DcmStatus[2];

assign DcmRst = DcmClkFxStopped & ~DcmLocked;

DCM_SP #(
    .CLKIN_PERIOD(CLKIN_PERIOD),
    .CLK_FEEDBACK("1X"),
    .CLKDV_DIVIDE(2.0), // not used
    .CLKFX_MULTIPLY(CLK_MUL),
    .CLKFX_DIVIDE(CLK_DIV)
) ClkDcmInst (
    .CLKIN(ClkInIBufg),
    .CLKFB(1'b0),
    .RST(DcmRst),
    .PSEN(1'b0),
    .PSINCDEC(1'b0),
    .PSCLK(1'b0),
    .CLK0(),
    .CLK90(),
    .CLK180(),
    .CLK270(),
    .CLK2X(),
    .CLK2X180(),
    .CLKDV(),
    .CLKFX(ClkDcmOut),
    .CLKFX180(),
    .STATUS(DcmStatus),
    .LOCKED(DcmLocked),
    .PSDONE(),
    .DSSEN(1'b0)
);

BUFG ClkBufgInst (
    .I(ClkDcmOut),
    .O(ClkOutSrc)
);

endmodule
