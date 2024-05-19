// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module top (
  input CLK,    // 16 MHz Global Clock
  output LED,   // On-board LED
  output USBPU  // USB Pull-up Resistor
);

  // Disable USB
  assign USBPU = 0;

  reg [25:0] blink_counter;
  wire [31:0] blink_pattern = 32'b101010001110111011100010101;

  always @(posedge CLK) begin
    blink_counter <= blink_counter + 1;
  end

  assign LED = blink_pattern[blink_counter[25:21]];
endmodule
