// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module tb_ripple_adder;

  // Inputs
  reg [3:0] a;
  reg [3:0] b;

  // Outputs
  wire [3:0] sum;
  wire cout;

  // Instantiate the ripple adder module
  ripple_adder uut(
    .a(a),
    .b(b),
    .sum(sum),
    .cout(cout)
  );

  // Monitor statements to display signals during simulation
  always @(a or b or sum or cout)
    $display("Time=%0t a=%b b=%b sum=%b cout=%b", $time, a, b, sum, cout);

  // Test case simulation
  initial begin
  $dumpfile("ripple_1.vcd");
  $dumpvars(1);
    // Test case 1
    a = 4'b0000;
    b = 4'b0000;
    #10;

    // Test case 2
    a = 4'b1101;
    b = 4'b1011;
    #10;

    // Test case 3
    a = 4'b1111;
    b = 4'b0001;
    #10;

    // Add more test cases as needed

    // Stop the simulation
    $finish;
  end

endmodule

