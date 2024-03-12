module double_ge_tb;
  reg clk;
  reg [63:0] double_ge_a;
  reg [63:0] double_ge_b;
  wire [0:0] double_ge_z;
  integer double_ge_a_file;
  integer double_ge_b_file;
  integer double_ge_z_file;
  integer double_ge_a_count;
  integer double_ge_b_count;
  integer double_ge_z_count;

  double_ge double_ge1 (clk, double_ge_a, double_ge_b, double_ge_z);
  initial
  begin
    double_ge_z_file = $fopen("stim/double_ge_z");
    double_ge_a_file = $fopen("stim/double_ge_a", "r");
    double_ge_b_file = $fopen("stim/double_ge_b", "r");
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
    $fdisplay(double_ge_z_file, "%d", double_ge_z);
    #0 double_ge_a_count = $fscanf(double_ge_a_file, "%d\n", double_ge_a);
    #0 double_ge_b_count = $fscanf(double_ge_b_file, "%d\n", double_ge_b);
  end
endmodule
