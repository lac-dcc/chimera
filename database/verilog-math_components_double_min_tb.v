module double_min_tb;
  reg clk;
  reg [63:0] double_min_a;
  reg [63:0] double_min_b;
  wire [63:0] double_min_z;
  integer double_min_a_file;
  integer double_min_b_file;
  integer double_min_z_file;
  integer double_min_a_count;
  integer double_min_b_count;
  integer double_min_z_count;

  double_min double_min1 (clk, double_min_a, double_min_b, double_min_z);
  initial
  begin
    double_min_z_file = $fopen("stim/double_min_z");
    double_min_a_file = $fopen("stim/double_min_a", "r");
    double_min_b_file = $fopen("stim/double_min_b", "r");
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
    $fdisplay(double_min_z_file, "%d", double_min_z);
    #0 double_min_a_count = $fscanf(double_min_a_file, "%d\n", double_min_a);
    #0 double_min_b_count = $fscanf(double_min_b_file, "%d\n", double_min_b);
  end
endmodule
