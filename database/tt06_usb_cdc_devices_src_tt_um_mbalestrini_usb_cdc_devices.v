// This program was cloned from: https://github.com/mbalestrini/tt06_usb_cdc_devices
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Maximo Balestrini
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_mbalestrini_usb_cdc_devices (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  wire usb_dp_pu; // USB 1.5kOhm Pullup EN
  wire usb_tx_en; // USB+- tristate control
  wire usb_dp_tx; // USB+
  wire usb_dp_rx; // USB+
  wire usb_dn_tx; // USB-
  wire usb_dn_rx; // USB-

  wire debug_usb_configured;
  wire debug_usb_tx_en;
  wire debug_led;
  wire [10:0] debug_usb_frame;
  wire [7:0] device_inputs;

  // All output pins must be assigned. If not used, assign to 0.

  // OUTPUT pins
  assign uo_out = {debug_usb_frame[3:0], debug_usb_tx_en, debug_usb_configured, debug_led, usb_dp_pu};

  // BIDIR pins
  assign uio_oe = {6'b000000, usb_tx_en, usb_tx_en};
  assign uio_out = {6'b000000, usb_dn_tx, usb_dp_tx};
  assign usb_dp_rx = uio_in[0];
  assign usb_dn_rx = uio_in[1];
  
  // INPUT pins  
  assign device_inputs[7:0] = ui_in[7:0];

  usb_cdc_devices u_usb_cdc_devices (
    .clk(clk), 
    .rstn_i(rst_n),

    .dp_pu_o(usb_dp_pu), // USB 1.5kOhm Pullup EN

    .tx_en_o(usb_tx_en), // USB+- tristate control
    .dp_tx_o(usb_dp_tx), // USB+
    .dp_rx_i(usb_dp_rx),  // USB+
    .dn_tx_o(usb_dn_tx), // USB-
    .dn_rx_i(usb_dn_rx),   // USB-

    .debug_usb_configured_o(debug_usb_configured), // While USB_CDC is in configured state, configured_o shall be high.
    .debug_usb_tx_en_o(debug_usb_tx_en),
    .debug_usb_frame_o(debug_usb_frame), // frame_o shall be last recognized USB frame number sent by USB host.
   
    .debug_led_o(debug_led), // User LED ON=1, OFF=0
    .inputs_i(device_inputs)
  );

endmodule
