module top (
  input  pin_clk,

  inout  pin_usbp,
  inout  pin_usbn,
  output pin_pu,

  output pin_led,
  output audio_left
);

  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////
  //////// generate 48 mhz clock
  ////////
  ////////////////////////////////////////////////////////////////////////////////
  ////////////////////////////////////////////////////////////////////////////////
  wire clk_48mhz;

  SB_PLL40_CORE #(
    .DIVR(4'b0000),
    .DIVF(7'b0101111),
    .DIVQ(3'b100),
    .FILTER_RANGE(3'b001),
    .FEEDBACK_PATH("SIMPLE"),
    .DELAY_ADJUSTMENT_MODE_FEEDBACK("FIXED"),
    .FDA_FEEDBACK(4'b0000),
    .DELAY_ADJUSTMENT_MODE_RELATIVE("FIXED"),
    .FDA_RELATIVE(4'b0000),
    .SHIFTREG_DIV_MODE(2'b00),
    .PLLOUT_SELECT("GENCLK"),
    .ENABLE_ICEGATE(1'b0)
  ) usb_pll_inst (
    .REFERENCECLK(pin_clk),
    .PLLOUTCORE(clk_48mhz),
    .PLLOUTGLOBAL(),
    .EXTFEEDBACK(),
    .DYNAMICDELAY(),
    .RESETB(1'b1),
    .BYPASS(1'b0),
    .LATCHINPUTVALUE(),
    .LOCK(),
    .SDI(),
    .SDO(),
    .SCLK()
  );

  assign pin_led = 1;

  reg [7:0] uart_di = 0;
  wire [7:0] uart_do;
  reg uart_re, uart_we = 0;
  wire uart_wait;

  // Generate reset signal
  reg [5:0] reset_cnt = 0;
  wire resetn = &reset_cnt;

  always @(posedge clk_48mhz) reset_cnt <= reset_cnt + !resetn;

  localparam  C = 262, D = 294, E = 330, F = 349, G = 392, A = 440 , B = 494, c = 523;

  reg [31:0] frequency;
  reg [31:0] duration = 0;
  reg [21:0] beat_counter = 0;
  reg [2:0] note_counter = 0;
  reg bar_counter = 0;
  wire done;

  reg delay_count;
  reg [1:0] state = 0;

  always @(posedge clk_48mhz) begin
    delay_count <= delay_count + 1;

    if (done) begin
      duration <= 0;
      state <= 0;
    end

    if (resetn && !uart_wait) begin
      uart_we <= 0;
      uart_re <= 0;

      if (!uart_we && !uart_re) begin
        case (state)
        0:begin
          uart_re <= 1;
          if (&delay_count) state <= 1;
        end
        1: begin
          duration <= 400;
          case (uart_do)
          "A" : frequency <= A;
          "B" : frequency <= B;
          "C" : frequency <= C;
          "D" : frequency <= D;
          "E" : frequency <= E;
          "F" : frequency <= F;
          "G" : frequency <= G;
          "c" : frequency <= c;
          endcase
        end
        endcase
      end
    end
  end

  // usb uart
  usb_uart uart (
    .clk_48mhz  (clk_48mhz),
    .resetn     (resetn),

    .usb_p_tx(usb_p_tx),
    .usb_n_tx(usb_n_tx),
    .usb_p_rx(usb_p_rx),
    .usb_n_rx(usb_n_rx),
    .usb_tx_en(usb_tx_en),

    .uart_we  (uart_we),
    .uart_re  (uart_re),
    .uart_di  (uart_di),
    .uart_do  (uart_do),
    .uart_wait(uart_wait)
  );

  wire usb_p_tx;
  wire usb_n_tx;
  wire usb_p_rx;
  wire usb_n_rx;
  wire usb_tx_en;
  wire usb_p_in;
  wire usb_n_in;

  assign pin_pu = 1'b1;

/*
  assign pin_usbp = usb_tx_en ? usb_p_tx : 1'bz;
  assign pin_usbn = usb_tx_en ? usb_n_tx : 1'bz;
  assign usb_p_rx = usb_tx_en ? 1'b1 : pin_usbp;
  assign usb_n_rx = usb_tx_en ? 1'b0 : pin_usbn;
*/

  assign usb_p_rx = usb_tx_en ? 1'b1 : usb_p_in;
  assign usb_n_rx = usb_tx_en ? 1'b0 : usb_n_in;

  SB_IO #(
    .PIN_TYPE(6'b 1010_01), // PIN_OUTPUT_TRISTATE - PIN_INPUT
    .PULLUP(1'b 0)
  )
  iobuf_usbp
  (
    .PACKAGE_PIN(pin_usbp),
    .OUTPUT_ENABLE(usb_tx_en),
    .D_OUT_0(usb_p_tx),
    .D_IN_0(usb_p_in)
  );

  SB_IO #(
    .PIN_TYPE(6'b 1010_01), // PIN_OUTPUT_TRISTATE - PIN_INPUT
    .PULLUP(1'b 0)
  )
  iobuf_usbn
  (
    .PACKAGE_PIN(pin_usbn),
    .OUTPUT_ENABLE(usb_tx_en),
    .D_OUT_0(usb_n_tx),
    .D_IN_0(usb_n_in)
  );

  tone t(.clk (clk_48mhz), .duration(duration), .freq (frequency), .tone_out (audio_left), .done(done));

endmodule
