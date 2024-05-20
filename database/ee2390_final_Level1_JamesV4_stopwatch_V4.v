// This program was cloned from: https://github.com/tlimato/ee2390_final
// License: MIT License

module stopwatch (
  input clk, reset, Start, Stop, Clear, Countdown,
  output reg [3:0] Minutes, Tens_Seconds, Ones_Seconds, Tenths_Seconds,
  output wire counter_trigger
);

  StopwatchCounter counter (
    .clk(clk),
    .counter_trigger(counter_trigger)
  );

  reg [3:0] next_Minutes, next_Tens_Seconds, next_Ones_Seconds, next_Tenths_Seconds;
  reg running, nice_D;

  always @(posedge clk) begin
    if (Start) running <= 1;
    if (Stop) running <= 0;
  end

  always @(posedge clk) begin
    if (reset) begin
      Minutes <= 4'd0;
      Tens_Seconds <= 4'd0;
      Ones_Seconds <= 4'd0;
      Tenths_Seconds <= 4'd0;
    end else begin
      Minutes <= next_Minutes;
      Tens_Seconds <= next_Tens_Seconds;
      Ones_Seconds <= next_Ones_Seconds;
      Tenths_Seconds <= next_Tenths_Seconds;
    end
  end
  //Countdown Enabler Logic
  always @(Countdown) begin
    if (~Countdown) nice_D <= 0;
    else nice_D <= 1;
  end
  //countup logic
  always @(posedge clk) begin
    if (running && ~nice_D) begin
      if (counter_trigger) begin
        if (Tenths_Seconds == 4'd9) begin
          next_Tenths_Seconds <= 4'd0;
          next_Ones_Seconds <= Ones_Seconds + 1;
        end else begin
          next_Tenths_Seconds <= Tenths_Seconds + 1;
        end
        if (Ones_Seconds == 4'd9 && Tenths_Seconds == 4'd9) begin
          next_Ones_Seconds <= 4'd0;
          next_Tens_Seconds <= Tens_Seconds + 1;
        end
        if (Tens_Seconds == 4'd5 && Ones_Seconds == 4'd9 && Tenths_Seconds == 4'd9) begin
          next_Tens_Seconds <= 4'd0;
          next_Minutes <= Minutes + 1;
        end
        if (Minutes == 4'd9 && Tens_Seconds == 4'd5 && Ones_Seconds == 4'd9 && Tenths_Seconds == 4'd9) begin
          next_Minutes <= 4'd0;
        end
      end
    end
  end

  //count down logic
  always @(posedge clk) begin
    if (running && nice_D) begin
        if (counter_trigger) begin
          if (Tenths_Seconds == 4'd0) begin
            Tenths_Seconds <= 4'd9;
            Ones_Seconds <= Ones_Seconds - 1;
          end else begin
            Tenths_Seconds <= Tenths_Seconds - 1;
          end
          if (Ones_Seconds == 4'd0 && Tenths_Seconds == 4'b0) begin
            Ones_Seconds <= 4'd9;
            Tens_Seconds <= Tens_Seconds - 1;
          end

          if (Tens_Seconds == 4'd0 && Ones_Seconds == 4'd0 && Tenths_Seconds == 4'd0) begin
            Tens_Seconds <= 4'd5;
            Minutes <= Minutes - 1;
          end

          if (Minutes == 4'd0 && Tens_Seconds == 4'd0 && Ones_Seconds == 4'd0 && Tenths_Seconds == 4'd0) begin
            Minutes <= 4'd9;
          end
      end
    end
  end


endmodule