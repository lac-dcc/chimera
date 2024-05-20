// This program was cloned from: https://github.com/mbalestrini/tt06_usb_cdc_devices
// License: Apache License 2.0

`default_nettype none

module usb_cdc_devices
  (
   input wire clk, // 48MHz Clock = 12*BIT_SAMPLES
   input wire rstn_i,

   output wire dp_pu_o, // USB 1.5kOhm Pullup EN

   output wire tx_en_o, // USB+- tristate control
   output wire dp_tx_o, // USB+
   input wire dp_rx_i,  // USB+
   output wire dn_tx_o, // USB-
   input wire dn_rx_i,   // USB-
   
   output wire debug_usb_configured_o, // While USB_CDC is in configured state, configured_o shall be high.
   output wire debug_usb_tx_en_o,
   output wire [10:0] debug_usb_frame_o, // frame_o shall be last recognized USB frame number sent by USB host.
   
   output wire debug_led_o, // User LED ON=1, OFF=0

   input wire [7:0] inputs_i
   );

   /**** usb_cdc ****/
   localparam VENDOR_ID = 16'h0000;
   localparam PRODUCT_ID = 16'h0000;
   localparam BIT_SAMPLES = 'd4;    
   localparam CHANNELS = 'd2;
   // If we use a different clock for the app we should set APP_CLK_FREQ.
   // The important value is the 12MHz threshold, not the exact value. 
   // in_fifo and out_fifo synchronize clocks according to if the clock is <=12 or not
   localparam USE_APP_CLK = 1;
   localparam APP_CLK_FREQ = 12;

   localparam ARCADE_IO_CHAN = 0;
   localparam LOOPBACK_CHAN = 1;

   /**** arcade_io_device ****/
   localparam ARCADE_IO_NUM_INPUTS = 8;

   

   wire             clk_usb;
   wire             clk_app;

   wire [10:0]      frame;
   wire             configured;
   
   wire [8*CHANNELS-1:0]   out_data;
   wire [CHANNELS-1:0]     out_valid;
   wire [CHANNELS-1:0]     in_ready;
   wire [8*CHANNELS-1:0]   in_data;
   wire [CHANNELS-1:0]     in_valid;
   wire [CHANNELS-1:0]      out_ready;

   

   assign clk_usb = clk;
   // assign clk_app = clk;
   assign clk_app = clk_12mhz;

   assign debug_led_o = (configured) ? frame[9] : ~&frame[4:3];
   assign debug_usb_configured_o = configured;
   assign debug_usb_tx_en_o = tx_en_o;
   assign debug_usb_frame_o = frame;
   

   wire             clk_24mhz;
   wire             clk_12mhz;
   wire             clk_6mhz;
   wire             clk_3mhz;
   prescaler u_prescaler (.clk_i(clk_usb),
                        .rstn_i(rstn_i),
                        .clk_div2_o(clk_24mhz),
                        .clk_div4_o(clk_12mhz),
                        .clk_div8_o(clk_6mhz),
                        .clk_div16_o(clk_3mhz));


   reg [1:0]        rstn_sync;
   wire             rstn;
   
   assign rstn = rstn_sync[0];

   always @(posedge clk_app or negedge rstn_i) begin
      if (~rstn_i) begin
         rstn_sync <= 2'd0;
      end else begin
         rstn_sync <= {1'b1, rstn_sync[1]};
      end
   end                        
                        
   arcade_io_device #(
            .NUM_INPUTS(ARCADE_IO_NUM_INPUTS)
   ) u_device0 (
            .clk_i(clk_app),
            .rstn_i(rstn),
            .inputs_i(inputs_i),
            .frame_i(frame),
            .out_data_i(out_data[(ARCADE_IO_CHAN+1)*8-1:ARCADE_IO_CHAN*8]),
            .out_valid_i(out_valid[ARCADE_IO_CHAN]),
            .in_ready_i(in_ready[ARCADE_IO_CHAN]),
            .out_ready_o(out_ready[ARCADE_IO_CHAN]),
            .in_data_o(in_data[(ARCADE_IO_CHAN+1)*8-1:ARCADE_IO_CHAN*8]),
            .in_valid_o(in_valid[ARCADE_IO_CHAN]),
            .usb_configured_i(configured)
            );

   loopback_device u_device1 (
      .out_data_i(out_data[(LOOPBACK_CHAN+1)*8-1:LOOPBACK_CHAN*8]),
      .out_valid_i(out_valid[LOOPBACK_CHAN]),
      .in_ready_i(in_ready[LOOPBACK_CHAN]),
      .out_ready_o(out_ready[LOOPBACK_CHAN]),
      .in_data_o(in_data[(LOOPBACK_CHAN+1)*8-1:LOOPBACK_CHAN*8]),
      .in_valid_o(in_valid[LOOPBACK_CHAN])
   );

   usb_cdc #(.VENDORID(VENDOR_ID),
             .PRODUCTID(PRODUCT_ID),
             .CHANNELS(CHANNELS),
             .IN_BULK_MAXPACKETSIZE('d8),
             .OUT_BULK_MAXPACKETSIZE('d8),
             .BIT_SAMPLES(BIT_SAMPLES),
             .USE_APP_CLK(USE_APP_CLK),
             .APP_CLK_FREQ(APP_CLK_FREQ))
   u_usb_cdc (.frame_o(frame),
              .configured_o(configured),
              .app_clk_i(clk_app),
              .clk_i(clk_usb),
              .rstn_i(rstn),
              .out_ready_i(out_ready),
              .in_data_i(in_data),
              .in_valid_i(in_valid),
              .dp_rx_i(dp_rx_i),
              .dn_rx_i(dn_rx_i),
              .out_data_o(out_data),
              .out_valid_o(out_valid),
              .in_ready_o(in_ready),
              .dp_pu_o(dp_pu_o),
              .tx_en_o(tx_en_o),
              .dp_tx_o(dp_tx_o),
              .dn_tx_o(dn_tx_o));

   

endmodule
