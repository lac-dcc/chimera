module double_floor_tb;
  reg clk;
  reg [63:0] double_floor_a;
  wire [63:0] double_floor_z;
  integer double_floor_a_file;
  integer double_floor_z_file;
  integer double_floor_a_count;
  integer double_floor_z_count;

  double_floor double_floor1 (clk, double_floor_a, double_floor_z);
  initial
  begin
    double_floor_z_file = $fopen("stim/double_floor_z");
    double_floor_a_file = $fopen("stim/double_floor_a", "r");
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
    $fdisplay(double_floor_z_file, "%d", double_floor_z);
    #0 double_floor_a_count = $fscanf(double_floor_a_file, "%d\n", double_floor_a);
  end
endmodule
