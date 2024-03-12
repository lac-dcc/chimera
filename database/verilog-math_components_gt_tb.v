module gt_tb;
  reg clk;
  reg [31:0] gt_a;
  reg [31:0] gt_b;
  wire [0:0] gt_z;
  integer gt_a_file;
  integer gt_b_file;
  integer gt_z_file;
  integer gt_a_count;
  integer gt_b_count;
  integer gt_z_count;

  gt gt1 (clk, gt_a, gt_b, gt_z);
  initial
  begin
    gt_z_file = $fopen("stim/gt_z");
    gt_a_file = $fopen("stim/gt_a", "r");
    gt_b_file = $fopen("stim/gt_b", "r");
  end

  initial
  begin
    #50080 $finish;
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
    $fdisplay(gt_z_file, "%d", gt_z);
    #0 gt_a_count = $fscanf(gt_a_file, "%d\n", gt_a);
    #0 gt_b_count = $fscanf(gt_b_file, "%d\n", gt_b);
  end
endmodule
