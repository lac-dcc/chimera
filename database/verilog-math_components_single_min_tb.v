module single_min_tb;
  reg clk;
  reg [31:0] single_min_a;
  reg [31:0] single_min_b;
  wire [31:0] single_min_z;
  integer single_min_a_file;
  integer single_min_b_file;
  integer single_min_z_file;
  integer single_min_a_count;
  integer single_min_b_count;
  integer single_min_z_count;

  single_min single_min1 (clk, single_min_a, single_min_b, single_min_z);
  initial
  begin
    single_min_z_file = $fopen("stim/single_min_z");
    single_min_a_file = $fopen("stim/single_min_a", "r");
    single_min_b_file = $fopen("stim/single_min_b", "r");
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
    $fdisplay(single_min_z_file, "%d", single_min_z);
    #0 single_min_a_count = $fscanf(single_min_a_file, "%d\n", single_min_a);
    #0 single_min_b_count = $fscanf(single_min_b_file, "%d\n", single_min_b);
  end
endmodule
