// This program was cloned from: https://github.com/Mahmoud-Abdelraouf/Computer-Organization-and-Architecture
// License: MIT License

module PeripheralInterruptEnable (
  input clk,           // Clock input
  input enable_pie,    // Enable signal for Peripheral Interrupt Enable
  output reg pie       // Peripheral Interrupt Enable
);

  always @(posedge clk) begin
    if (enable_pie) begin
      // Enable PIE when requested is set
      pie <= 1;
    end else begin
      // Disable PIE
      pie <= 0;
    end
  end

endmodule
