// This program was cloned from: https://github.com/mbalestrini/tt06_usb_cdc_devices
// License: Apache License 2.0

module loopback_device (
   // ---- to/from USB_CDC ------------------------------------------
   output wire [7:0] in_data_o,
   output wire   in_valid_o,
   // While in_valid_o is high, in_data_o shall be valid.
   input wire   in_ready_i,
   // When both in_ready_i and in_valid_o are high, in_data_o shall
   //   be consumed.
   input wire [7:0]  out_data_i,
   input wire        out_valid_i,
   // While out_valid_i is high, the out_data_i shall be valid and both
   //   out_valid_i and out_data_i shall not change until consumed.
   output wire       out_ready_o
   // When both out_valid_i and out_ready_o are high, the out_data_i shall
   //   be consumed.
);

assign out_ready_o = in_ready_i;
assign in_valid_o = out_valid_i;
assign in_data_o = out_data_i;



endmodule
