module double_le_tb;
  reg clk;
  reg [63:0] double_le_a;
  reg [63:0] double_le_b;
  wire [0:0] double_le_z;
  integer double_le_a_file;
  integer double_le_b_file;
  integer double_le_z_file;
  integer double_le_a_count;
  integer double_le_b_count;
  integer double_le_z_count;

  double_le double_le1 (clk, double_le_a, double_le_b, double_le_z);
  initial
  begin
    double_le_z_file = $fopen("stim/double_le_z");
    double_le_a_file = $fopen("stim/double_le_a", "r");
    double_le_b_file = $fopen("stim/double_le_b", "r");
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
    $fdisplay(double_le_z_file, "%d", double_le_z);
    #0 double_le_a_count = $fscanf(double_le_a_file, "%d\n", double_le_a);
    #0 double_le_b_count = $fscanf(double_le_b_file, "%d\n", double_le_b);
  end
endmodule
