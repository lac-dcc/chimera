module floor_tb;
  reg clk;
  reg [31:0] floor_a;
  wire [31:0] floor_z;
  integer floor_a_file;
  integer floor_z_file;
  integer floor_a_count;
  integer floor_z_count;

  floor floor1 (clk, floor_a, floor_z);
  initial
  begin
    floor_z_file = $fopen("stim/floor_z");
    floor_a_file = $fopen("stim/floor_a", "r");
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
    $fdisplay(floor_z_file, "%d", floor_z);
    #0 floor_a_count = $fscanf(floor_a_file, "%d\n", floor_a);
  end
endmodule
