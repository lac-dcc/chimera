module tone(
    input clk,
    input [31:0] duration, // millis
    input [31:0] freq, //hz
    output reg tone_out, // pin
    output reg done
    );

parameter CLK_F = 48; // CLK freq in MHz

reg [7:0] prescaler = 0;
reg [31:0] tone_counter = 0;
reg [31:0] time_counter = 0;
reg [31:0] millis  = 0;
wire [31:0] period = 1000000 / freq;

always @(posedge clk) if (duration > 0) begin
  if (time_counter == CLK_F * 1000 - 1) begin
    millis <= millis + 1;
    time_counter <= 0;
  end else time_counter <= time_counter + 1;

  if (millis < duration) begin
    prescaler <= prescaler + 1;
    if (prescaler == CLK_F / 2 - 1) begin
      prescaler <= 0;
      tone_counter <= tone_counter + 1;
      if (tone_counter >= period - 1) begin
        tone_counter <= 0;
        tone_out <= ~tone_out;
      end
    end
  end else begin
    tone_out <= 0;
    done = 1;
  end
end else begin
  millis <= 0;
  done <= 0;
  prescaler <= 0;
  time_counter <= 0;
  tone_counter <= 0;
end

endmodule
