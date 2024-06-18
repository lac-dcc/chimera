// This program was cloned from: https://github.com/ccattuto/tt07-serial-charmatrix
// License: Apache License 2.0

module ws2812b (
    input wire clk20,             // 20 MHz input clock
    input wire reset,
    input wire [23:0] data_in,    // color data
    input wire valid,
    input wire latch,
    output reg ready,
    output reg led          // output signal to LED strip
);

  // Define timing parameters according to WS2812B datasheet
  localparam T0H = 400e-9;       // width of '0' high pulse (400ns)
  localparam T1H = 800e-9;       // width of '1' high pulse (800ns)
  localparam T0L = 850e-9;       // width of '0' low pulse (850ns)
  localparam T1L = 450e-9;       // width of '1' low pulse (450ns)
  localparam PERIOD = 1250e-9;   // total period of one bit (1250ns)
  localparam RES_DELAY = 300e-6; // reset duration (300us)

  // Calculate clock cycles needed based on input clock frequency
  parameter CLOCK_FREQ = 20e6; // 20MHz clock frequency

  // Calculate clock cycles for each timing parameter
  localparam [15:0] CYCLES_PERIOD = $floor(CLOCK_FREQ * PERIOD);
  localparam [15:0] CYCLES_T0H = $floor(CLOCK_FREQ * T0H);
  localparam [15:0] CYCLES_T1H = $floor(CLOCK_FREQ * T1H);
  localparam [15:0] CYCLES_T0L = CYCLES_PERIOD - CYCLES_T0H;
  localparam [15:0] CYCLES_T1L = CYCLES_PERIOD - CYCLES_T1H;
  localparam [15:0] CYCLES_RESET = $floor(CLOCK_FREQ * RES_DELAY);

  // state machine
  parameter IDLE = 0, START = 1, SEND_BIT = 2, RESET = 3;
  reg [1:0] state;

  reg [4:0] bitpos;
  reg [15:0] time_counter;
  reg [23:0] data;
  reg will_latch;

  // State machine logic
  always @(posedge clk20) begin
    if (reset) begin
      state <= RESET;
      bitpos <= 0;
      time_counter <= 0;
      led <= 0;
      ready <= 0;
      data <= 24'b0;
      will_latch <= 0;
    end else begin
      case (state)
        IDLE: begin
          bitpos <= 0;
          time_counter <= 0;
          led <= 0;
          if (ready & valid) begin
            data <= data_in;
            will_latch <= latch;
            ready <= 0;
            state <= START;
          end else begin
            ready <= 1;
          end
        end

        START: begin
          // Initialize for sending data
          state <= SEND_BIT;
          bitpos <= 23;
          time_counter <= 0;
          led <= 1;
          ready <= 0;
        end

        SEND_BIT: begin
          if (time_counter < CYCLES_PERIOD - 1) begin
            // Continue sending current bit
            time_counter <= time_counter + 1;
            if (time_counter == (data[bitpos] ? CYCLES_T1H - 1 : CYCLES_T0H - 1))
                led <= 0;
          end else if (bitpos > 0) begin
            // Move to next bit
            bitpos <= bitpos - 1;
            time_counter <= 0;
            led <= 1;
          end else begin
            // All bits sent
            state <= will_latch ? RESET : IDLE;
            will_latch <= 0;
            time_counter <= 0;
            led <= 0;
          end
        end

        RESET: begin
          if (time_counter < CYCLES_RESET) begin
            // Continue reset pulse
            time_counter <= time_counter + 1;
          end else begin
            // Reset complete, return to idle
            state <= IDLE;
          end
        end

        default: begin
          state <= RESET;
        end
      endcase
    end
  end

endmodule
