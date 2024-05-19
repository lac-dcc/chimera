// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

`default_nettype none

`timescale 1 ns / 1 ps

`include "fpga_consts.vh"
`include "caravel.v"
`include "spiflash.v"

module integration_tb;
	reg clock;
  reg RSTB;
	reg power1, power2;
	reg power3, power4;
	wire gpio;
	wire [37:0] mprj_io;

  assign mprj_io[10] = ~RSTB; // --> gpio_north[9] --> fpga reset
                              // (see verilog/rtl/user_project_wrapper.v)

	// External clock is used by default.  Make this artificially fast for the
	// simulation.  Normally this would be a slow clock and the digital PLL
	// would be the fast clock.

  initial clock = 0;
	always #12.5 clock = ~clock;

  localparam BITS_PER_COL = `CLB_TILE_BITSTREAM_SIZE * `NUM_ROWS;
	initial begin
		//$dumpfile("integration_tb.vcd");
		//$dumpvars(0, integration_tb);

		// Repeat cycles of 1000 clock edges as needed to complete testbench
		repeat (BITS_PER_COL) begin
			repeat (1000) @(posedge clock);
		end
		$display("%c[1;31m",27);
		$display ("Monitor: Timeout, Test Failed. Time %t!", $time);
		$display("%c[0m",27);
		$finish;
	end

	initial begin
		repeat (2) begin
			repeat (1000) @(posedge clock);
		end

	  wait(uut.mprj.fpga250.wishbonatron_00.set_out != 0);
		wait(uut.mprj.fpga250.wishbonatron_10.set_out != 0);

    @(posedge clock);
	  $display("FPGA Configuration Done!");

		repeat (1000) @(posedge clock);
    $display("mprj_io: %b", mprj_io);
    $display("FPGA250_GPIO_NORTH=%b", uut.mprj.fpga250.gpio_north);
    $display("FPGA250_GPIO_SOUTH=%b", uut.mprj.fpga250.gpio_south);
    $display("FPGA250_GPIO_EAST=%b",  uut.mprj.fpga250.gpio_east);
    $display("FPGA250_GPIO_WEST=%b",  uut.mprj.fpga250.gpio_west);

    if (uut.mprj.fpga250.gpio_south[0] === 1'b1 &&
        uut.mprj.fpga250.gpio_south[0] === mprj_io[24])
      $display("[gpio test] PASSED!");
    else
      $display("[gpio test] FAILED!");

	  $finish;
	end

	initial begin
		RSTB <= 1'b0;
		#2000;
		RSTB <= 1'b1;	    // Release reset
	end

	initial begin		// Power-up sequence
		power1 <= 1'b0;
		power2 <= 1'b0;
		power3 <= 1'b0;
		power4 <= 1'b0;
		#200;
		power1 <= 1'b1;
		#200;
		power2 <= 1'b1;
		#200;
		power3 <= 1'b1;
		#200;
		power4 <= 1'b1;
	end

  reg [31:0] wbs00_cnt = 0;
  reg [31:0] wbs10_cnt = 0;
  always @(posedge uut.mprj.fpga250.wb_clk_i) begin
    if (uut.mprj.fpga250.wishbonatron_00.cen === 1'b1) begin
      $display("[Time %t, wbs00_cnt=%d/%d] Wishbone 00 output = %b", $time,
        wbs00_cnt, BITS_PER_COL,
        uut.mprj.fpga250.wishbonatron_00.shift_out);
        wbs00_cnt <= wbs00_cnt + 1;
    end

    if (uut.mprj.fpga250.wishbonatron_10.cen === 1'b1) begin
      $display("[Time %t, wbs10_cnt=%d/%d] Wishbone 10 output = %b", $time,
      wbs10_cnt, BITS_PER_COL,
      uut.mprj.fpga250.wishbonatron_10.shift_out);
      wbs10_cnt <= wbs10_cnt + 1;
    end
  end

	wire flash_csb;
	wire flash_clk;
	wire flash_io0;
	wire flash_io1;

	wire VDD3V3 = power1;
	wire VDD1V8 = power2;
	wire USER_VDD3V3 = power3;
	wire USER_VDD1V8 = power4;
	wire VSS = 1'b0;

	caravel uut (
		.vddio	  (VDD3V3),
		.vssio	  (VSS),
		.vdda	    (VDD3V3),
		.vssa	    (VSS),
		.vccd	    (VDD1V8),
		.vssd	    (VSS),
		.vdda1    (USER_VDD3V3),
		.vdda2    (USER_VDD3V3),
		.vssa1	  (VSS),
		.vssa2	  (VSS),
		.vccd1	  (USER_VDD1V8),
		.vccd2	  (USER_VDD1V8),
		.vssd1	  (VSS),
		.vssd2	  (VSS),
		.clock	  (clock),
		.gpio     (gpio),
    .mprj_io  (mprj_io),
		.flash_csb(flash_csb),
		.flash_clk(flash_clk),
		.flash_io0(flash_io0),
		.flash_io1(flash_io1),
		.resetb	  (RSTB)
	);

	spiflash #(
		.FILENAME("software.hex")
	) spiflash (
		.csb(flash_csb),
		.clk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1),
		.io2(),			// not used
		.io3()			// not used
	);

endmodule
`default_nettype wire
