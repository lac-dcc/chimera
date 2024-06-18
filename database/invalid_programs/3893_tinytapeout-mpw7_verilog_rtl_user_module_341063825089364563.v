// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-mpw7
// License: Apache License 2.0

`default_nettype none

// Keep I/O fixed for TinyTapeout
module user_module_341063825089364563(
  input [7:0] io_in,
  output [7:0] io_out
);
  parameter COUNTER_WIDTH = 11;
  parameter FADE_COUNTER_WIDTH = 10;
  parameter FADE_WIDTH = 4;
  parameter PWM_COUNTER_WIDTH = 4; // Can't be less than FADE_WIDTH

  // using io_in[0] as clk, io_in[1] as reset
  wire clk;
  assign clk = io_in[0];
  wire reset;
  assign reset = io_in[1];

  reg [2:0] counter_speed_prefix;
  reg direction;
  reg tail;
  reg led_invert;
  reg [2:0] state;
  reg [6:0] led_out;
  reg [FADE_WIDTH-1:0] segments [6:0];
  reg [COUNTER_WIDTH-1:0] counter;
  wire [FADE_COUNTER_WIDTH-1:0] fade_counter;
  wire [FADE_WIDTH-1:0] pwm_counter_slice;
  wire [COUNTER_WIDTH-1:0] counter_speed;

  assign pwm_counter_slice = counter[PWM_COUNTER_WIDTH-1:PWM_COUNTER_WIDTH-FADE_WIDTH];
  assign counter_speed = {counter_speed_prefix, {COUNTER_WIDTH-1-3{1'b1}}};
  assign fade_counter = counter[FADE_COUNTER_WIDTH-1:0];
  assign io_out = {0, led_out} ^ {8{led_invert}};

  always @(posedge clk) begin
    counter_speed_prefix <= ~io_in[4:2];
    tail <= io_in[5];
    direction <= io_in[6];
    led_invert <= io_in[7];
  end

  always @(posedge clk) begin
    if(reset) begin
        counter <= 0;
        state <= 0;
        led_out <= 8'b00000000;
        segments[0] <= {FADE_WIDTH-1{1'b0}};
        segments[1] <= {FADE_WIDTH-1{1'b0}};
        segments[2] <= {FADE_WIDTH-1{1'b0}};
        segments[3] <= {FADE_WIDTH-1{1'b0}};
        segments[4] <= {FADE_WIDTH-1{1'b0}};
        segments[5] <= {FADE_WIDTH-1{1'b0}};
        segments[6] <= {FADE_WIDTH-1{1'b0}};
    end else begin
      if(counter >= counter_speed) begin
        counter <= 0;
        if(direction)
          state <= state + 3'b001;
        else
          if(state == 3'b000)
            state <= 3'b111;
          else
            state <= state - 3'b001;
      end else begin
        counter <= counter + 1;
      end
    end

    led_out[0] <= segments[0] > pwm_counter_slice;
    led_out[1] <= segments[1] > pwm_counter_slice;
    led_out[2] <= segments[2] > pwm_counter_slice;
    led_out[3] <= segments[3] > pwm_counter_slice;
    led_out[4] <= segments[4] > pwm_counter_slice;
    led_out[5] <= segments[5] > pwm_counter_slice;
    led_out[6] <= segments[6] > pwm_counter_slice;

    if(tail) begin
      if(fade_counter == 0)
      begin
        segments[0] <= segments[0] >> 1;
        segments[1] <= segments[1] >> 1;
        segments[2] <= segments[2] >> 1;
        segments[3] <= segments[3] >> 1;
        segments[4] <= segments[4] >> 1;
        segments[5] <= segments[5] >> 1;
        segments[6] <= segments[6] >> 1;
      end
    end else begin
      segments[0] <= {FADE_WIDTH-1{1'b0}};
      segments[1] <= {FADE_WIDTH-1{1'b0}};
      segments[2] <= {FADE_WIDTH-1{1'b0}};
      segments[3] <= {FADE_WIDTH-1{1'b0}};
      segments[4] <= {FADE_WIDTH-1{1'b0}};
      segments[5] <= {FADE_WIDTH-1{1'b0}};
      segments[6] <= {FADE_WIDTH-1{1'b0}};
    end

    case(state)
      3'b000 : segments[0] <= {FADE_WIDTH-1{1'b1}};
      3'b001 : segments[1] <= {FADE_WIDTH-1{1'b1}};
      3'b010 : segments[6] <= {FADE_WIDTH-1{1'b1}};
      3'b011 : segments[4] <= {FADE_WIDTH-1{1'b1}};
      3'b100 : segments[3] <= {FADE_WIDTH-1{1'b1}};
      3'b101 : segments[2] <= {FADE_WIDTH-1{1'b1}};
      3'b110 : segments[6] <= {FADE_WIDTH-1{1'b1}};
      3'b111 : segments[5] <= {FADE_WIDTH-1{1'b1}};
    endcase
  end
endmodule
