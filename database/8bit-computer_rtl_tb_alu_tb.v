module alu_tb;

  reg [7:0] in_a;
  reg [7:0] in_b;
  reg cin = 0;

  wire [7:0] sum;
  wire cout;

  alu alu (cin, cout, in_a, in_b, sum);

  initial begin
    #10 in_a = 10;
    #10 in_b = 20;

    #10 in_a = 50;
    #10 in_b = 10;
  end

  initial begin
    $monitor("time = %2d, CIN = %1b, COUT = %1b, A = %d, B = %d, SUM = %d", $time, cin, cout, in_a, in_b, sum);
  end

endmodule
