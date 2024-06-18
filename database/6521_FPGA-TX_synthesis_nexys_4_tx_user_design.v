// This program was cloned from: https://github.com/dawsonjon/FPGA-TX
// License: MIT License

module user_design(clk, rst, exception, input_rs232_rx, input_gps_rx, input_gps_count, input_rs232_rx_stb, input_gps_rx_stb, input_gps_count_stb, input_rs232_rx_ack, input_gps_rx_ack, input_gps_count_ack, output_tx_ctl, output_rs232_tx, output_leds, output_gps_tx, output_tx_freq, output_tx_am, output_tx_ctl_stb, output_rs232_tx_stb, output_leds_stb, output_gps_tx_stb, output_tx_freq_stb, output_tx_am_stb, output_tx_ctl_ack, output_rs232_tx_ack, output_leds_ack, output_gps_tx_ack, output_tx_freq_ack, output_tx_am_ack);
  input  clk;
  input  rst;
  output  exception;
  input  [31:0] input_rs232_rx;
  input  input_rs232_rx_stb;
  output input_rs232_rx_ack;
  input  [31:0] input_gps_rx;
  input  input_gps_rx_stb;
  output input_gps_rx_ack;
  input  [31:0] input_gps_count;
  input  input_gps_count_stb;
  output input_gps_count_ack;
  output [31:0] output_tx_ctl;
  output output_tx_ctl_stb;
  input  output_tx_ctl_ack;
  output [31:0] output_rs232_tx;
  output output_rs232_tx_stb;
  input  output_rs232_tx_ack;
  output [31:0] output_leds;
  output output_leds_stb;
  input  output_leds_ack;
  output [31:0] output_gps_tx;
  output output_gps_tx_stb;
  input  output_gps_tx_ack;
  output [31:0] output_tx_freq;
  output output_tx_freq_stb;
  input  output_tx_freq_ack;
  output [31:0] output_tx_am;
  output output_tx_am_stb;
  input  output_tx_am_ack;
  wire   exception_140581388082136;
  main_0 main_0_140581388082136(
    .clk(clk),
    .rst(rst),
    .exception(exception_140581388082136),
    .input_gps_count(input_gps_count),
    .input_gps_count_stb(input_gps_count_stb),
    .input_gps_count_ack(input_gps_count_ack),
    .input_gps_rx(input_gps_rx),
    .input_gps_rx_stb(input_gps_rx_stb),
    .input_gps_rx_ack(input_gps_rx_ack),
    .input_rs232_rx(input_rs232_rx),
    .input_rs232_rx_stb(input_rs232_rx_stb),
    .input_rs232_rx_ack(input_rs232_rx_ack),
    .output_rs232_tx(output_rs232_tx),
    .output_rs232_tx_stb(output_rs232_tx_stb),
    .output_rs232_tx_ack(output_rs232_tx_ack),
    .output_leds(output_leds),
    .output_leds_stb(output_leds_stb),
    .output_leds_ack(output_leds_ack),
    .output_freq_out(output_tx_freq),
    .output_freq_out_stb(output_tx_freq_stb),
    .output_freq_out_ack(output_tx_freq_ack),
    .output_gps_tx(output_gps_tx),
    .output_gps_tx_stb(output_gps_tx_stb),
    .output_gps_tx_ack(output_gps_tx_ack),
    .output_ctl_out(output_tx_ctl),
    .output_ctl_out_stb(output_tx_ctl_stb),
    .output_ctl_out_ack(output_tx_ctl_ack),
    .output_am_out(output_tx_am),
    .output_am_out_stb(output_tx_am_stb),
    .output_am_out_ack(output_tx_am_ack));
  assign exception = exception_140581388082136;
endmodule
