// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-06-staging
// License: Apache License 2.0

`default_nettype none

// just a stub to keep the Tiny Tapeout tools happy

module tt_um_argunda_tiny_opamp (
    input  wire       VGND,
    input  wire       VPWR,
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    inout  wire [7:0] ua,       // analog pins
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire vbias_i;

    top pong1(
        .VPWR  (VPWR),
        .VGND  (VGND),
        .ui_in  (ui_in[3:0]),
        .uo_out (uo_out),
        //.uio_in(),
        //.uio_out(),
        //.uio_oe(),
        //.ena    (1), 
        .clk    (clk),
        .rst_n  (rst_n)
    );

    opamp opamp1(
	.VDD(VPWR),
	.VSS(VGND),
	.VBIAS(vbias_i),
	.VOUT(ua[0]),
	.PLUS(ua[1]),
	.MINUS(ua[2])
	);
    
    opamp opamp2(
	.VDD(VPWR),
	.VSS(VGND),
	.VBIAS(vbias_i),
	.VOUT(ua[3]),
	.PLUS(ua[4]),
	.MINUS(ua[5])
	);

    vbias_resistor vbias_resistor1(
	.VDD(VPWR),
	.VSS(VGND),
	.VBIAS(vbias_i)
    );

    assign uio_out[0] = VGND;
    assign uio_out[1] = VGND;
    assign uio_out[2] = VGND;
    assign uio_out[3] = VGND;
    assign uio_out[4] = VGND;
    assign uio_out[5] = VGND;
    assign uio_out[6] = VGND;
    assign uio_out[7] = VGND;

    assign uio_oe[0] = VGND;
    assign uio_oe[1] = VGND;
    assign uio_oe[2] = VGND;
    assign uio_oe[3] = VGND;
    assign uio_oe[4] = VGND;
    assign uio_oe[5] = VGND;
    assign uio_oe[6] = VGND;
    assign uio_oe[7] = VGND;
    
endmodule
