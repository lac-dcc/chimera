// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module top (
  input  PIN_14,  // External clock
  output LED,     // On-board LED
  output PIN_4,   // Heartbeat pin
  output PIN_5,   // Block status pin
  output PIN_6,   // Frame status pin
  output PIN_7,   // Sub-frame status pin
  output PIN_8,   // S/PDIF pin
  output USBPU    // USB pull-up
);

  // Disable USB
  assign USBPU = 0;

  // Create S/PDIF core instance
  spdif core(PIN_14, PIN_8, PIN_7, PIN_6, PIN_5);

  // Create Heartbeat module instance
  wire pulse;
  heartbeat beat(PIN_14, pulse);
  assign LED = pulse;
  assign PIN_4 = pulse;
endmodule
