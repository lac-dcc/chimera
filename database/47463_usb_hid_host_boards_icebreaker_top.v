// This program was cloned from: https://github.com/nand2mario/usb_hid_host
// License: Apache License 2.0

//
// Example using the usb_hid_host core, for iCEBreaker board
// based on the icesugar-pro example by nand2mario, 9/2023
//

module top (
    input sys_clk,
    input sys_resetn,
    // input s1,

    // UART
    input UART_RXD,
    output UART_TXD,

    // LEDs
    output led,

    // USB
    inout usbdm,
    inout usbdp
);

wire [1:0] usb_type;
wire [7:0] key_modifiers, key1, key2, key3, key4;
wire [7:0] mouse_btn;
wire signed [7:0] mouse_dx, mouse_dy;
wire [63:0] hid_report;
wire usb_report, usb_conerr, game_l, game_r, game_u, game_d, game_a, game_b, game_x, game_y;
wire game_sel, game_sta;
wire [13:0] dbg_pc;
wire [3:0] dbg_inst;

usb_hid_host usb (
    .usbclk(sys_clk), .usbrst_n(sys_resetn),
    .usb_dm(usbdm), .usb_dp(usbdp),	
    .typ(usb_type), .report(usb_report),
    .key_modifiers(key_modifiers), .key1(key1), .key2(key2), .key3(key3), .key4(key4),
    .mouse_btn(mouse_btn), .mouse_dx(mouse_dx), .mouse_dy(mouse_dy),
    .game_l(game_l), .game_r(game_r), .game_u(game_u), .game_d(game_d),
    .game_a(game_a), .game_b(game_b), .game_x(game_x), .game_y(game_y), 
    .game_sel(game_sel), .game_sta(game_sta),
    .conerr(usb_conerr), .dbg_hid_report(hid_report)
);

hid_printer prt (
    .clk(sys_clk), .resetn(sys_resetn),
    .uart_tx(UART_TXD), .usb_type(usb_type), .usb_report(usb_report),
    .key_modifiers(key_modifiers), .key1(key1), .key2(key2), .key3(key3), .key4(key4),
    .mouse_btn(mouse_btn), .mouse_dx(mouse_dx), .mouse_dy(mouse_dy),
    .game_l(game_l), .game_r(game_r), .game_u(game_u), .game_d(game_d),
    .game_a(game_a), .game_b(game_b), .game_x(game_x), .game_y(game_y), 
    .game_sel(game_sel), .game_sta(game_sta)
);

reg report_toggle;      // blinks whenever there's a report
always @(posedge sys_clk) if (usb_report) report_toggle <= ~report_toggle;

assign led = report_toggle;
//assign leds[7:0] = ~{6'b0, usb_type};
//assign leds[15:8] = ~8'b0;

endmodule
