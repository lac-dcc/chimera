// This program was cloned from: https://github.com/openXC7/primitive-tests
// License: BSD 3-Clause "New" or "Revised" License

`default_nettype none   //do not allow undeclared wires

module startup (
    input  wire clk,
    output wire led
    );

    wire cclk, feedback, locked;
    
    PLLE2_ADV #(
            .CLKFBOUT_MULT(8'd16),
            .CLKIN1_PERIOD(20.0),
            .CLKOUT0_DIVIDE(8'd128),
            .CLKOUT0_PHASE(1'd0),
            .DIVCLK_DIVIDE(8'd1),
            .REF_JITTER1(0.01),
            .STARTUP_WAIT("FALSE")
    ) PLLE2_ADV (
            .CLKFBIN(feedback),
            .CLKIN1(clk),
            .RST(1'b0),
            .CLKFBOUT(feedback),
            .CLKOUT0(cclk),
            .LOCKED(locked)
    );

    assign led = ~locked;

    reg [21:0] r_count = 0;
    always @(posedge(clk)) r_count <= r_count + 1;

    STARTUPE2 STARTUPE2 (
        .CLK(1'b0),
        .GSR(1'b0),
        .GTS(1'b0),
        .KEYCLEARB(1'b1),
        .PACK(1'b0),
        .PREQ(),
  
        // Drive clock.
        .USRCCLKO (cclk),
        .USRCCLKTS(1'b0),
  
        // These control the DONE pin.  UG470 says USRDONETS should
        // usually be low to enable DONE output.  But by default
        // (i.e. when the STARTUPE2 is not instaintiated), the DONE pin
        // goes to hi-z after initialization.  This is how to do that.
        .USRDONEO (r_count[21]),
        .USRDONETS(1'b0),
  
        .CFGCLK(),
        .CFGMCLK(),
        .EOS()
    );

endmodule
