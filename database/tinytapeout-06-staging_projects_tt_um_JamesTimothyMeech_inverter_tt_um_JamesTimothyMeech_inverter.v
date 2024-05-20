// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-06-staging
// License: Apache License 2.0

`default_nettype none

// just a stub to keep the Tiny Tapeout tools happy

module tt_um_JamesTimothyMeech_inverter (
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

inverter inverter (
    .VDD(VPWR),
    .VSS(VGND),
    .OUT(ua[4]),
    .IN(ua[5])
    );

analog_mux analog_mux_0 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(ui_in[0]),
    .bus(ua[0])
    );

analog_mux analog_mux_1 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(ui_in[1]),
    .bus(ua[0])
    );

analog_mux analog_mux_2 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(ui_in[2]),
    .bus(ua[0])
    );

analog_mux analog_mux_3 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(ui_in[3]),
    .bus(ua[0])
    );

analog_mux analog_mux_4 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(ui_in[4]),
    .bus(ua[0])
    );

analog_mux analog_mux_5 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(ui_in[5]),
    .bus(ua[0])
    );

analog_mux analog_mux_6 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(ui_in[6]),
    .bus(ua[0])
    );

analog_mux analog_mux_7 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(ui_in[7]),
    .bus(ua[0])
    );

analog_mux analog_mux_8 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(uio_in[0]),
    .bus(ua[0])
    );

analog_mux analog_mux_9 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(uio_in[1]),
    .bus(ua[0])
    );

analog_mux analog_mux_10 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(uio_in[2]),
    .bus(ua[0])
    );

analog_mux analog_mux_11 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(uio_in[3]),
    .bus(ua[0])
    );

analog_mux analog_mux_12 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(uio_in[4]),
    .bus(ua[0])
    );

analog_mux analog_mux_13 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(uio_in[5]),
    .bus(ua[0])
    );

analog_mux analog_mux_14 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(uio_in[6]),
    .bus(ua[0])
    );

analog_mux analog_mux_15 (
    .VPWR(VPWR),
    .VGND(VGND),
    .ctrl(uio_in[7]),
    .bus(ua[0])
    );

assign uo_out[0] = VGND;
assign uo_out[1] = VGND;
assign uo_out[2] = VGND;
assign uo_out[3] = VGND;
assign uo_out[4] = VGND;
assign uo_out[5] = VGND;
assign uo_out[6] = VGND;
assign uo_out[7] = VGND;

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