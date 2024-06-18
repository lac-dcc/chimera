// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

module StopwatchCounter (
  input clk,
  output reg counter_trigger
);

  // Clock speed in MHz
  parameter integer CLOCK_SPEED = 100;

  // Desired time period in seconds
  parameter real DESIRED_PERIOD = 1/10;

  // Internal counter register
  reg [31:0] counter;

  initial begin
    counter <= 0;
    counter_trigger <= 1'b0;
  end

  always @(posedge clk) begin
    if (counter == (CLOCK_SPEED * 10**6 * DESIRED_PERIOD) - 1) begin
      counter <= 0;
      counter_trigger <= 1'b1;
    end else begin
      counter <= counter + 1;
      counter_trigger <= 1'b0;
    end
  end
endmodule