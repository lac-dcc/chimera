module mul_tb;
  reg clk;
  reg [31:0] mul_a;
  reg [31:0] mul_b;
  wire [31:0] mul_z;
  integer mul_a_file;
  integer mul_b_file;
  integer mul_z_file;
  integer mul_a_count;
  integer mul_b_count;
  integer mul_z_count;

  mul mul1 (clk, mul_a, mul_b, mul_z);
  initial
  begin
    mul_z_file = $fopen("stim/mul_z");
    mul_a_file = $fopen("stim/mul_a", "r");
    mul_b_file = $fopen("stim/mul_b", "r");
  end

  initial
  begin
    #50100 $finish;
  end

  initial
  begin
    clk <= 1'b0;
    while (1) begin
      #5 clk <= ~clk;
    end
  end

  always @ (posedge clk)
  begin
    $fdisplay(mul_z_file, "%d", mul_z);
    #0 mul_a_count = $fscanf(mul_a_file, "%d\n", mul_a);
    #0 mul_b_count = $fscanf(mul_b_file, "%d\n", mul_b);
  end
endmodule
