// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-06
// License: Apache License 2.0

`default_nettype none

// just a stub to keep the Tiny Tapeout tools happy

module tt_um_psychogenic_wowa(
    input  wire       VGND,
    input  wire       VPWR,
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    inout  wire [7:0] ua, // analog pins
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
 
 
  wire [7:0] dac_set;
  wire threshold_select;
  wire do_calibrate;
  wire comparator_nenable;
  wire comparator_output;
  wire external_threshold;

  wowa_digital wowa_digital(
        .clk(clk),   
	.rst(ui_in[0]),
	.calib_enable(ui_in[1]),
	.user_enable(ui_in[2]),
	.use_ext_thresh(ui_in[3]),
	.dac_set(dac_set),
	.thresh_sel(threshold_select),
	.do_calibrate(do_calibrate),
	.comparator_nen(comparator_nenable),
	.analog_comparator_out(comparator_output),
	.result_ready(uio_out[0]),
	.result(uo_out),
        .VPWR(VPWR),
        .VGND(VGND)
        );


    wowa_analog wowa_analog(
        .b0(dac_set[0]),
        .b1(dac_set[1]),
        .b2(dac_set[2]),
        .b3(dac_set[3]),
        .b4(dac_set[4]),
        .b5(dac_set[5]),
        .b6(dac_set[6]),
        .b7(dac_set[7]),
	.USEEXT(threshold_select),
	.CAL(do_calibrate),
	.EN_N(comparator_nenable),
	.INPUT(ua[4]),
	.DACOUT(ua[5]),
	.COMPOUT(comparator_output),
	.EXTTHRESH(external_threshold),
        .VCC(VPWR),
        .VSS(VGND)
        );

    p3_opamp p3_opamp(
	    .PLUS(ua[2]),
	    .MINUS(external_threshold),
	    .VOUT(ua[1]),

	    .VDD(VPWR),
            .VSS(VGND)
    );




    assign ua[0] = comparator_output;
    assign ua[3] = external_threshold;

   
    assign uio_out[1] = VGND;
    assign uio_out[2] = VGND;
    assign uio_out[3] = VGND;

    assign uio_out[4] = VPWR;
    assign uio_out[5] = VPWR;
    assign uio_out[6] = VPWR;
    assign uio_out[7] = VPWR;

    assign uio_oe[0] = VPWR;
    assign uio_oe[1] = VPWR;
    assign uio_oe[2] = VPWR;
    assign uio_oe[3] = VPWR;
    assign uio_oe[4] = VPWR;
    assign uio_oe[5] = VPWR;
    assign uio_oe[6] = VPWR;
    assign uio_oe[7] = VPWR;



endmodule
