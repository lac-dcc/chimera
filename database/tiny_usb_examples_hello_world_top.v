module top (
  input  pin_clk,

  inout  pin_usbp,
  inout  pin_usbn,
  output pin_pu,

  output pin_led,
  output [7:0] leds
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
    .RESETB(1'b1),
    .BYPASS(1'b0),
    .LATCHINPUTVALUE(),
    .LOCK(),
    .SDI(),
    .SDO(),
    .SCLK()
  );

  localparam TEXT_LEN = 13;

  assign leds = {uart_we, uart_re, uart_wait, state};
  assign pin_led = 1;

  reg [7:0] uart_di;
  wire [7:0] uart_do;
  reg uart_re = 0, uart_we;
  wire uart_wait;

  // Generate reset signal
  reg [5:0] reset_cnt = 0;
  wire resetn = &reset_cnt;

  always @(posedge clk_48mhz) reset_cnt <= reset_cnt + !resetn;

  // Create the text string
  reg [7:0] text [0:TEXT_LEN-1];
  reg [3:0] char_count;

  initial begin
    text[0]  <= "H";
    text[1]  <= "e";
    text[2]  <= "l";
    text[3]  <= "l";
    text[4]  <= "o";
    text[5]  <= " ";
    text[6]  <= "W";
    text[7]  <= "o";
    text[8]  <= "r";
    text[9]  <= "l";
    text[10] <= "d";
    text[11] <= "!";
    text[12] <= "\n";
  end

  // Send message about every second
  reg [26:0] delay_count;
  reg [1:0] state = 0;

  always @(posedge clk_48mhz) begin
    delay_count <= delay_count + 1;

    if (resetn && !uart_wait) begin
      uart_we <= 0;

      if (!uart_we) begin // wait a clock cycle before setting write enable again
        if (char_count == TEXT_LEN) begin
          if (&delay_count) char_count <= 0; // wait for delay before sending message again
        end else begin
          uart_di <= text[char_count];
          uart_we <= 1;
          char_count <= char_count + 1;
        end
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

endmodule
