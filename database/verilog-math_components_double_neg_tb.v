module double_neg_tb;
  reg clk;
  reg [63:0] double_neg_a;
  wire [63:0] double_neg_z;
  integer double_neg_a_file;
  integer double_neg_z_file;
  integer double_neg_a_count;
  integer double_neg_z_count;

  double_neg double_neg1 (clk, double_neg_a, double_neg_z);
  initial
  begin
    double_neg_z_file = $fopen("stim/double_neg_z");
    double_neg_a_file = $fopen("stim/double_neg_a", "r");
  end

  initial
  begin
    #10010 $finish;
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
    $fdisplay(double_neg_z_file, "%d", double_neg_z);
    #0 double_neg_a_count = $fscanf(double_neg_a_file, "%d\n", double_neg_a);
  end
endmodule
