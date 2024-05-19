// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

module heartbeat (
  input  clock_i,   // Global clock input
  output pulse_o    // Heartbeat pulse output
);

  // Register to count clock pulses
  reg [23:0] counter;

  // Increment counter on clock pulse
  always @ (posedge clock_i) begin
    counter <= counter + 1;

    // Reset counter at 6,144,000
    if (counter > 6.144e6) counter <= 0;
  end

  // Pulse pattern
  assign pulse_o = (counter < 300e3) || (counter > 1e6 && counter < 1.3e6);
endmodule
