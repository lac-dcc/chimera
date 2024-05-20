// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

module Stopwatch (
  input clk, reset, Start, Stop, Clear, Countdown,
  output reg [3:0] Minutes, Tens_Seconds, Ones_Seconds, Tenths_Seconds
);

  reg [3:0] next_Minutes, next_Tens_Seconds, next_Ones_Seconds, next_Tenths_Seconds;
  reg running, nice_D;

  // Instantiate the counter module
  StopwatchCounter counter (
    .clk(clk),
    .counter_trigger(counter_trigger)
  );

  //wire counter_trigger;  // Connect output from counter module

  always @(posedge clk) begin
    if (reset) begin
      Minutes <= 4'd0;
      Tens_Seconds <= 4'd0;
      Ones_Seconds <= 4'd0;
      Tenths_Seconds <= 4'd0;
      running <= 1'b0;  // Reset also sets to stopped state
    end else begin
      Minutes <= next_Minutes;
      Tens_Seconds <= next_Tens_Seconds;
      Ones_Seconds <= next_Ones_Seconds;
      Tenths_Seconds <= next_Tenths_Seconds;
    end
  end

  // Countdown Enabler Logic (remains mostly the same)
  always @(Countdown) begin
    if (~Countdown) nice_D <= 0;
    else nice_D <= 1;
  end

  // Countup logic with counter_trigger integration
always @(posedge clk) begin
  if (running && ~nice_D) begin  // Only increment if running and not counting down
    if (counter_trigger) begin  // Increment on counter trigger
      if (Tenths_Seconds == 4'd9) begin
        next_Tenths_Seconds <= 4'd0;
        next_Ones_Seconds <= Ones_Seconds + 1;
      end else begin
        next_Tenths_Seconds <= Tenths_Seconds + 1;
      end
      // Check for overflow and wrap-around
      if (Ones_Seconds == 4'd9 && Tenths_Seconds == 4'd9) begin
        next_Ones_Seconds <= 4'd0;
        next_Tens_Seconds <= Tens_Seconds + 1;
      end
      if (Tens_Seconds == 4'd5 && Ones_Seconds == 4'd9 && Tenths_Seconds == 4'd9) begin
        next_Tens_Seconds <= 4'd0;
        next_Minutes <= Minutes + 1;
      end
    end
  end
end

// Countdown logic with counter_trigger integration
always @(posedge clk) begin
  if (running && nice_D) begin  // Only decrement if running and counting down
    if (counter_trigger) begin  // Decrement on counter trigger
      if (Tenths_Seconds == 4'd0) begin
        Tenths_Seconds <= 4'd9;
        next_Ones_Seconds <= Ones_Seconds - 1;
      end else begin
        next_Tenths_Seconds <= Tenths_Seconds - 1;
      end
      // Check for underflow and wrap-around
      if (Ones_Seconds == 4'd0 && Tenths_Seconds == 4'd0) begin
        next_Ones_Seconds <= 4'd9;
        next_Tens_Seconds <= Tens_Seconds - 1;
      end
      if (Tens_Seconds == 4'd0 && Ones_Seconds == 4'd0 && Tenths_Seconds == 4'd0) begin
        next_Tens_Seconds <= 4'd5;
        next_Minutes <= Minutes - 1;
      end
    end 
  end
end

  // Stop/Start and Clear functionality (mostly remains the same)
  always @(posedge clk) begin
    if (Start) running <= 1'b1;
    if (Stop) running <= 1'b0;

    if (Clear & ~running) begin  // Clear only when stopped
      Minutes <= 4'd0;
      Tens_Seconds <= 4'd0;
      Ones_Seconds <= 4'd0;
      Tenths_Seconds <= 4'd0;
    end
  end

endmodule