// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

// An example of an automated test. Run 'apio test' to test and 'apio sim' to examine
// the wave signals.

`timescale 10 ns / 1 ns

`define DUMPSTR(x) `"x.vcd`"

// A macro that check that given signal has given value. Normally it abors the simulation 
// with an error, except when running with 'apio sim', in which case it prints an error
// message and continues so we can examine the signal with gtkwave.
`define EXPECT(signal, value) \
    if (signal !== (value)) begin \
        $display("ASSERTION FAILED in %m: signal != value  ('h%h)", (signal)); \
        `ifndef INTERACTIVE_SIM \
             $fatal; \
        `endif \
    end

// A macro to wait for N clk positive edges, and then a little bit more for the last clock
// to settle.
`define CLK(n) \
    begin \
       repeat(n)  @ (posedge clk); \
       #0.1; \
    end

// A macro to count N times.
`define COUNT(n) \
    begin \
        `CLK(1) \
        count_en = 1; \
        `CLK(n) \
        count_en = 0; \
        `CLK(1) \
    end


module main_tb ();

  always begin
    #10 clk = ~clk;
  end

  // Inputs
  reg clk = 0;
  reg reset = 1;
  reg count_en = 0;


  // Outputs
  wire [3:0] digit_1;
  wire [3:0] digit_10;
  wire carry;

  // Counts the number of clocks with carry=1 so far.
  reg [5:0] carry_count = 0;

  always @(posedge clk) begin
    carry_count <= reset ? 0 : carry ? carry_count + 1 : carry_count;
  end

  main main (
      .clk(clk),
      .reset(reset),
      .count_en(count_en),
      .digit_1(digit_1),
      .digit_10(digit_10),
      .carry(carry)
  );

  initial begin
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, main_tb);

    // Test reset.
    `CLK(3)
    reset = 0;
    `EXPECT(digit_10, 0) // count = 00
    `EXPECT(digit_1, 0)
    `EXPECT(carry_count, 0)

    // Test transition from 09 to 10,
    `CLK(3);
    `COUNT(9)
    `EXPECT(digit_10, 0)  // count = 09
    `EXPECT(digit_1, 9)
    `EXPECT(carry_count, 0)
    `COUNT(1)
    `EXPECT(digit_10, 1)  // count = 10
    `EXPECT(digit_1, 0)
    `EXPECT(carry_count, 0)

    // Test transition from 99 to 00.
    `COUNT(89)
    `EXPECT(digit_10, 9) // count = 99
    `EXPECT(digit_1, 9)
    `EXPECT(carry_count, 0)
    `COUNT(1)
    `EXPECT(digit_10, 0) // count = 00
    `EXPECT(digit_1, 0)
    `EXPECT(carry_count, 1)

    // Count a few more
    `COUNT(12)
    `EXPECT(digit_10, 1) // count = 12
    `EXPECT(digit_1, 2)
    `EXPECT(carry_count, 1)

    // All done.
    `CLK(10)
    $display("End of simulation");
    $finish;
  end

endmodule
