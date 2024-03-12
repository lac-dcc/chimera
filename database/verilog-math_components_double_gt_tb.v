module double_gt_tb;
  reg clk;
  reg [63:0] double_gt_a;
  reg [63:0] double_gt_b;
  wire [0:0] double_gt_z;
  integer double_gt_a_file;
  integer double_gt_b_file;
  integer double_gt_z_file;
  integer double_gt_a_count;
  integer double_gt_b_count;
  integer double_gt_z_count;

  double_gt double_gt1 (clk, double_gt_a, double_gt_b, double_gt_z);
  initial
  begin
    double_gt_z_file = $fopen("stim/double_gt_z");
    double_gt_a_file = $fopen("stim/double_gt_a", "r");
    double_gt_b_file = $fopen("stim/double_gt_b", "r");
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
    $fdisplay(double_gt_z_file, "%d", double_gt_z);
    #0 double_gt_a_count = $fscanf(double_gt_a_file, "%d\n", double_gt_a);
    #0 double_gt_b_count = $fscanf(double_gt_b_file, "%d\n", double_gt_b);
  end
endmodule
