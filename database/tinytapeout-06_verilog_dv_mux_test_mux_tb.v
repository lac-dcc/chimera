// This program was cloned from: https://github.com/TinyTapeout/tinytapeout-06
// License: Apache License 2.0

`default_nettype none

module test_mux_tb (
    // the user module's interface
    input wire clk,
    input wire reset_n,
    input wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input wire [7:0] uio_in,  // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path

    // control interface
    input wire ctrl_sel_rst_n,
    input wire ctrl_sel_inc,
    input wire ctrl_ena
);

  // signals for openframe_project_wrapper
  reg  [`MPRJ_IO_PADS-1:0] io_in;
  wire [`MPRJ_IO_PADS-1:0] io_out;
  wire [`MPRJ_IO_PADS-1:0] io_oeb;

  assign io_in[23:16] = uio_in[7:0];
  assign uio_out[7:0] = io_out[23:16];

  assign io_in[14]    = clk;
  assign io_in[15]    = reset_n;
  assign io_in[13]    = ui_in[7];
  assign io_in[6:0]   = ui_in[6:0];
  assign uo_out[7:0]  = io_out[31:24];

  assign io_in[40]    = ctrl_sel_rst_n;
  assign io_in[39]    = ctrl_sel_inc;
  assign io_in[38]    = ctrl_ena;

`ifdef SIM_ICARUS
  initial begin
    string f_name;
    $timeformat(-9, 2, " ns", 20);
    if ($value$plusargs("WAVE_FILE=%s", f_name)) begin
      $display("%0t: Capturing wave file %s", $time, f_name);
      $dumpfile(f_name);
      $dumpvars(0, test_mux_tb);
    end else begin
      $display("%0t: No filename provided - disabling wave capture", $time);
    end
  end
`endif

  wire [43:0] gpio_in;
  wire [43:0] gpio_out;
  wire [43:0] gpio_oeb;
  wire [43:0] gpio_inp_dis;
  wire [43:0] gpio_dm2;
  wire [43:0] gpio_dm1;
  wire [43:0] gpio_dm0;

  assign gpio_in = io_in;
  assign io_out  = gpio_out & ~gpio_oeb & gpio_dm2 & gpio_dm1;
  assign io_oeb  = gpio_oeb;
  wire [43:0] inp_ena = (gpio_dm0 | gpio_dm1 | gpio_dm2) & ~gpio_inp_dis;

  openframe_project_wrapper user_project_wrapper (
`ifdef GL_TEST
      .vccd1             (1'b1),
      .vssd1             (1'b0),
`endif
      .gpio_loopback_zero({44{1'b0}}),
      .gpio_loopback_one ({44{1'b1}}),
      .gpio_in           (gpio_in & inp_ena),
      .gpio_out          (gpio_out),
      .gpio_oeb          (gpio_oeb),
      .gpio_inp_dis      (gpio_inp_dis),
      .gpio_dm2          (gpio_dm2),
      .gpio_dm1          (gpio_dm1),
      .gpio_dm0          (gpio_dm0)
  );

endmodule
