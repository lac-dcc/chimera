module double_ceil_tb;
  reg clk;
  reg [63:0] double_ceil_a;
  wire [63:0] double_ceil_z;
  integer double_ceil_a_file;
  integer double_ceil_z_file;
  integer double_ceil_a_count;
  integer double_ceil_z_count;

  double_ceil double_ceil1 (clk, double_ceil_a, double_ceil_z);
  initial
  begin
    double_ceil_z_file = $fopen("stim/double_ceil_z");
    double_ceil_a_file = $fopen("stim/double_ceil_a", "r");
  end

  initial
  begin
    #10080 $finish;
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
    $fdisplay(double_ceil_z_file, "%d", double_ceil_z);
    #0 double_ceil_a_count = $fscanf(double_ceil_a_file, "%d\n", double_ceil_a);
  end
endmodule
