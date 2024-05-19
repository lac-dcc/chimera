// This program was cloned from: https://github.com/ucb-cs250/caravel_fpga250
// License: Apache License 2.0

// This is an adaptation of [fabric_team]/testbench/fpga_test_harness.v for
// the user_project_wrapper in Caravel.

`timescale 1ns/1ps

`include "defines.v"

`include "libs.ref/sky130_fd_sc_hd/verilog/primitives.v"
`include "libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v"

`include "fpga_consts.vh"
`include "user_project_wrapper.v"

module user_project_wrapper_tb();

  reg clk, rst;

  localparam CLOCK_PERIOD = 12.5;

  initial clk = 0;
  always #(CLOCK_PERIOD/2) clk = ~clk;

  // Array is 8 rows x 7 columns of CLB tiles
  localparam MX = 7;
  localparam MY = 8;

  // We use two Wishbone modules to load the bitstream
  localparam NUM_CONFIG_REGIONS = 2;

  // Wishbone signals
  wire wbs_stb_i;
  wire wbs_cyc_i;
  wire wbs_we_i;

  // Write mask
  wire [3:0] wbs_sel_i;
  wire [31:0] wbs_data_i;
  wire [31:0] wbs_addr_i;
  wire wbs_ack_o;
  wire [31:0] wbs_data_o;

  // mprj_io ~ io_in ~ io_out (bidir)
  wire [`MPRJ_IO_PADS-1:0] io_in;
  wire [`MPRJ_IO_PADS-1:0] io_out;

  user_project_wrapper dut (
    .wb_clk_i(clk),
    .wb_rst_i(rst),

    // Wishbone signals
    .wbs_stb_i(wbs_stb_i),   // input
    .wbs_cyc_i(wbs_cyc_i),   // input
    .wbs_we_i(wbs_we_i),     // input
    // Write mask
    .wbs_sel_i(wbs_sel_i),   // input
    .wbs_dat_i(wbs_data_i),  // input
    .wbs_adr_i(wbs_addr_i),  // input
    .wbs_ack_o(wbs_ack_o),   // output
    .wbs_dat_o(wbs_data_o),  // output

     // IOs
    .io_in(io_in),
    .io_out(io_out),
    .io_oeb(),

     // Logic Analyzer Signals
    .la_data_in(),
    .la_data_out(),
    .la_oen(),

    .analog_io(),
    .user_clock2()
  );

  reg [31:0] address = 32'h3000_0000;
  reg [31:0] write_data = 0;
  reg transact = 0;
  reg we = 0;
  reg [3:0] select = 4'b1111;

  wire [1:0] ack;
  wire [31:0] read_data;

  assign wbs_stb_i  = transact;
  assign wbs_cyc_i  = transact;
  assign wbs_we_i   = we;
  assign wbs_sel_i  = select;
  assign wbs_data_i = write_data;
  assign wbs_addr_i = address;
  assign ack        = wbs_ack_o;
  assign read_data  = wbs_data_o;

  reg fabric_reset;
  assign io_in[10] = fabric_reset;

  // MSB<[bitstream(0,0), bitstream(1,0), ..., bitstream(N-1,0)],
  //     [bitstream(0,1), bitstream(1,1), ..., bitstream(N-1,1)],
  //     ...
  //     [bitstream(0,N-1), bitstream(1,N-1), ..., bitstream(N-1,N-1)]>LSB

  localparam COL_BITS  = `CLB_TILE_BITSTREAM_SIZE * MY;
  localparam FPGA_BITS = COL_BITS * MX;
  reg [FPGA_BITS-1:0]     bitstream[1];
  reg [8*MX*MY-1:0]       gold_sync_output[1];
  reg [8*MX*MY-1:0]       gold_comb_output[1];
  reg [`MPRJ_IO_PADS-1:0] gold_gpio_output[1];

  reg [1023:0] load_config = 0;
  reg [1023:0] load_sync_output = 0;
  reg [1023:0] load_comb_output = 0;
  reg [1023:0] load_gpio_output = 0;
  reg status = 0;
  initial begin
    #0.1 status = $value$plusargs("load_config=%s",      load_config);
    #0.1 status = $value$plusargs("load_sync_output=%s", load_sync_output);
    #0.1 status = $value$plusargs("load_comb_output=%s", load_comb_output);
    #0.1 status = $value$plusargs("load_gpio_output=%s", load_gpio_output);

    #1;
    $readmemb(load_config, bitstream);
    $readmemb(load_sync_output, gold_sync_output);
    $readmemb(load_comb_output, gold_comb_output);
    $readmemb(load_gpio_output, gold_gpio_output);
  end

  wire [COL_BITS-1:0] col_bitstream [MX-1:0];

  genvar k, x, y;
  generate
    for (k = 0; k < MX; k = k + 1) begin
      assign col_bitstream[MX-1-k] = bitstream[0][COL_BITS * (k + 1) - 1: COL_BITS * k];
    end
  endgenerate

  wire [8*MX*MY-1:0] fabric_sync_output;
  wire [8*MX*MY-1:0] fabric_comb_output;

  // Extract the current registers' states from the Fabric
  // They will be compared against the golden registers' states given by a test
  generate
    for (x = 0; x < MX; x = x + 1) begin
      for (y = 0; y < MY; y = y + 1) begin
`ifndef GATE_LV
        assign fabric_sync_output[x * MY * 8 + y * 8 +: 8] = dut.fpga250.X[MX-1-x].Y[MY-1-y].clb.slice.sync_output;
        assign fabric_comb_output[x * MY * 8 + y * 8 +: 8] = dut.fpga250.X[MX-1-x].Y[MY-1-y].clb.slice.comb_output;
`endif
      end
    end
  endgenerate

//  always @(posedge clk) begin
//    $display("[At %t] TEST shift00=%b cen00=%b set_out00=%b, shift10=%b, cen10=%b, set_out10=%b", $time,
//      dut.fpga250.wishbonatron_00.shift_out,
//      dut.fpga250.wishbonatron_00.cen,
//      dut.fpga250.wishbonatron_00.set_out,
//
//      dut.fpga250.wishbonatron_10.shift_out,
//      dut.fpga250.wishbonatron_10.cen,
//      dut.fpga250.wishbonatron_10.set_out);
//  end

  reg failed_tests = 0;

  localparam NUM_BYTES = COL_BITS / 8;
  localparam REM_BITS  = COL_BITS - NUM_BYTES * 8;
  integer i, j, z, wb;
  initial begin
    //$dumpfile("fpga_test_harness.vcd");
    //$dumpvars;

    rst = 1'b1;
    fabric_reset= 1'b1;
    repeat (10) @(posedge clk);

    @(negedge clk);
    rst = 1'b0;
    fabric_reset = 1'b0;

    for (wb = 0; wb < NUM_CONFIG_REGIONS; wb = wb + 1) begin
      // Wishbone wb
      address <= 32'h3000_0004 + (wb << 4);
      write_data <= {8'hFF, 8'hFF, 8'hFF, 8'hFF};
      we <= 1;
      transact <= 1;

      @(posedge ack);
      transact <= 0;
      we <= 0;

      @(negedge ack);
    end

    for (wb = 0; wb < NUM_CONFIG_REGIONS; wb = wb + 1) begin
      for (i = 0; i < NUM_BYTES; i = i + 1) begin
        // sending the bits
        address <= 32'h3000_0008 + (wb << 4);
        for (j = wb * 4; j < wb * 4 + 4; j = j + 1) begin
          if (j < MX)
            write_data[(j % 4) * 8 +: 8] <= col_bitstream[j][i * 8 +: 8];
        end
        we <= 1;
        transact <= 1;

        @(posedge ack);
        transact <= 0;
        we <= 0;
        @(negedge ack);

        repeat(5) @(posedge clk);
      end
    end

    if (REM_BITS > 0) begin
    // Send the remaining bits
      for (wb = 0; wb < NUM_CONFIG_REGIONS; wb = wb + 1) begin
        address <= 32'h3000_0004 + (wb << 4);
        for (i = wb * 4; i < wb * 4 + 4; i = i + 1) begin
          if (i < MX)
            write_data[(i % 4) * 8 +: 8] <= REM_BITS;
        end

        we <= 1;
        transact <= 1;

        @(posedge ack);
        transact <= 0;
        we <= 0;
        @(negedge ack);

        repeat(5) @(posedge clk);
      end

      for (wb = 0; wb < NUM_CONFIG_REGIONS; wb = wb + 1) begin
        // sending the bits
        address <= 32'h3000_0008 + (wb << 4);
        for (i = wb * 4; i < wb * 4 + 4; i = i + 1) begin
          if (i < MX)
            for (z = 0; z < REM_BITS; z = z + 1)
              write_data[(i % 4) * 8 + z] <= col_bitstream[i][NUM_BYTES * 8 + z];
        end
        we <= 1;
        transact <= 1;

        @(posedge ack);
        transact <= 0;
        we <= 0;
        @(negedge ack);

        repeat(5) @(posedge clk);
      end
    end
    else begin
      // Set the counters to 0 to fire cen
      for (wb = 0; wb < NUM_CONFIG_REGIONS; wb = wb + 1) begin
        address <= 32'h3000_0004 + (wb << 4);
        write_data = {8'h00, 8'h00, 8'h00, 8'h00};

        we <= 1;
        transact <= 1;

        @(posedge ack);
        transact <= 0;
        we <= 0;
        @(negedge ack);

        repeat(5) @(posedge clk);
      end

      for (wb = 0; wb < NUM_CONFIG_REGIONS; wb = wb + 1) begin
        // We don't actually send anything here
        address <= 32'h3000_0008 + (wb << 4);
        we <= 1;
        transact <= 1;

        @(posedge ack);
        transact <= 0;
        we <= 1;
        @(negedge ack);

        repeat(5) @(posedge clk);
      end
    end

    repeat(5) @(posedge clk);

    $display("Configuration done!");

    repeat (100) @(posedge clk);

    $display("Number of bits per column: %d\n", COL_BITS);
    $display("Bitstream size: %d\n", FPGA_BITS);

    $display("GPIO_NORTH=%b", dut.fpga250.gpio_north);
    $display("GPIO_SOUTH=%b", dut.fpga250.gpio_south);
    $display("GPIO_EAST=%b",  dut.fpga250.gpio_east);
    $display("GPIO_WEST=%b",  dut.fpga250.gpio_west);

    $display("fabric_gpio_output = %b",
      {dut.fpga250.gpio_north,
       dut.fpga250.gpio_south,
       dut.fpga250.gpio_east,
       dut.fpga250.gpio_west});
    $display("gold_gpio_output   = %b", gold_gpio_output[0]);

    if ({dut.fpga250.gpio_north,
         dut.fpga250.gpio_south,
         dut.fpga250.gpio_east,
         dut.fpga250.gpio_west} === gold_gpio_output[0])
       $display("[gpio test] PASSED!");
    else begin
       $display("[gpio test] FAILED: gpio_output mismatch!");
       failed_tests = failed_tests + 1;
    end

`ifndef GATE_LV

    $display("fabric_sync_output = %b", fabric_sync_output);
    $display("gold_sync_output   = %b", gold_sync_output[0]);

    $display("fabric_comb_output = %b", fabric_comb_output);
    $display("gold_comb_output   = %b", gold_comb_output[0]);

    if (fabric_sync_output === gold_sync_output[0])
      $display("[sync test] PASSED!");
    else begin
      $display("[sync test] FAILED: sync_output mismatch!");
      failed_tests = failed_tests + 1;
    end

    if (fabric_comb_output === gold_comb_output[0])
      $display("[comb test] PASSED!");
    else begin
      $display("[comb test] FAILED: comb_output mismatch!");
      failed_tests = failed_tests + 1;
    end
`endif

    #100;
    $display("Fabric test done! Num tests failed: %d", failed_tests);
    $finish;
  end

endmodule
