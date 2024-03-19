module ps2_test (
   input clk_25mhz,
   input ps2_clk,
   input ps2_data,
   output ftdi_rxd,
   output [3:0] led,
   output usb_fpga_pu_dp,
   output usb_fpga_pu_dn
);

   assign usb_fpga_pu_dp = 1;
   assign usb_fpga_pu_dn = 1;

   wire  reset_n = &reset_counter;
   reg [9:0] reset_counter = 0;

   // reset_n will be held low for 1ms, then stay high
   always @(posedge clk_25mhz)
     begin
       if (!reset_n) 
         begin
           reset_counter = reset_counter + 1;
         end
     end

   // ===============================================================
   // PS/2 keyboard interface
   // ===============================================================

   wire [7:0]       keyb_data;
   wire             keyb_valid;
   wire             keyb_error;

   ps2_intf ps2
     (
      .CLK    (clk_25mhz),
      .nRESET (reset_n),
      .PS2_CLK  (ps2_clk),
      .PS2_DATA (ps2_data),
      .DATA  (keyb_data),
      .VALID (keyb_valid),
      .ERROR (keyb_error)
      );

   assign led = {keyb_valid, keyb_error, keyb_data[1:0]};

   wire [7:0] hex1, hex2; // Ascii hex chars to print

   // Convert ascii code tp hex
   byte_to_hex h1(keyb_data[3:0], hex1);
   byte_to_hex h2(keyb_data[7:4], hex2);

   // Send the key to the UART
   wire [15:0] text = {hex2, hex1};
   reg text_req, text_done;

   debug #(.text_len(2)) db (
     .clk(clk_25mhz), 
     .reset(~reset_n), 
     .text_req(text_req), 
     .text_done(text_done),
     .debug_text(text), 
     .uart_tx(ftdi_rxd));

   always @(posedge clk_25mhz) begin
     if (text_done) text_req = 1'b0;
     if (keyb_valid) text_req = 1'b1;
   end

endmodule
