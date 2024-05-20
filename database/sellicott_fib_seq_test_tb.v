// This program was cloned from: https://github.com/sellicott/sellicott_fib_seq
// License: Apache License 2.0

`default_nettype none
`timescale 1ns / 1ns

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module tb ();

  // Dump the signals to a VCD file. You can view it with gtkwave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Wire up the inputs and outputs:
  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] ui_in;
  reg [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

  // Replace tt_um_example with your module name:
  tt_um_sellicott_fib_seq user_project (

      // Include power ports for the Gate Level test:
`ifdef GL_TEST
      .VPWR(1'b1),
      .VGND(1'b0),
`endif

      .ui_in  (ui_in),    // Dedicated inputs
      .uo_out (uo_out),   // Dedicated outputs
      .uio_in (uio_in),   // IOs: Input path
      .uio_out(uio_out),  // IOs: Output path
      .uio_oe (uio_oe),   // IOs: Enable path (active high: 0=input, 1=output)
      .ena    (ena),      // enable - goes high when design is selected
      .clk    (clk),      // clock
      .rst_n  (rst_n)     // not reset
  );

  // Testbench code for simulating with Icarus Verilog instead of cocotb
`ifdef ICARUS

  localparam CLK_PERIOD = 20; // 20ns -> run at 50MHz
  localparam CLK_HALF_PERIOD = CLK_PERIOD / 2;

  // toggle clock every half period
  always #(CLK_HALF_PERIOD) begin
    clk = ~clk;
  end

  initial begin: fib_test
    // reset the system
    initilize();

    $display("Test project behavior");
    // test the first 10 fibonacci sequence numbers
    test_n_fib(10);

    // finish the simulation
    close();
  end

  // task to initilize all of the top level registers and reset the system
  task initilize();
  begin: initilize
    clk = 1'h0;
    $display("Start");
    #2;
    $display("Reset");
    ena    = 1'h1;
    ui_in  = 8'h0;
    uio_in = 8'h0;
    rst_n  = 1'h0;

    // wait 10 clock cycles
    repeat(10) @(posedge clk);
    rst_n = 1'h1;
  end
  endtask

  task close();
  begin: close
    $display("Closing");
    // wait 10 clock cycles to give us time to read last value
    repeat(10) @(posedge clk);

    $finish;
  end
  endtask

  task test_n_fib(
    input integer n
  );
  begin: test_n_fib_block
    integer fib_idx;
    fib_idx = 0;
    for (fib_idx = 0; fib_idx < n; fib_idx++)
    begin: fib_test_iter
      integer fib_calc;
      integer fib_hw;
      fib_hw = 0;
      // calculate the current fibonacci sequence value
      fib_calc = calc_fib(fib_idx);
      run_fib_seq(fib_idx);
      fib_hw = uo_out[7:0];
      $display("Test n=%d", fib_idx);
      $display("hw_fib: %d, sw fib: %d", fib_hw, fib_calc);
      // exit if the values don't match
      if(fib_hw != fib_calc) close();
    end
  end
  endtask

  // make a task to read the fibonachi value
  task run_fib_seq(
    input integer n
  );
  begin
    // wait a clock cycle and set the strobe signal
    @(posedge clk);
    uio_in[0]  = 1'h1;
    ui_in[7:0] = n[7:0];
    // wait a clock cycle and clear the strobe signal
    @(posedge clk);
    uio_in[0] = 1'h0;
    @(posedge clk);
    // wait until the busy signal is low, each time wait another clock cycle
    for(; uio_out[1]; ) @(posedge clk);
  end
  endtask

  // iteratively calculate the nth fibonacci sequence number
  function integer calc_fib(
    input integer n
  );
  begin: calc_fib_block
    integer a;
    integer b;
    integer c;
    integer i;

    a = 0;
    b = 1;
    c = 0;

    if (n == 0) begin
      calc_fib = a;
    end
    else begin
      for (i = 1; i < n; i++) begin
        c = a + b;
        a = b;
        b = c;
      end
      calc_fib = b;
    end

  end
  endfunction

`endif

endmodule
