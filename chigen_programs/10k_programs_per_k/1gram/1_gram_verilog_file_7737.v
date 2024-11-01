// Seed: 2120379848
module module_0 ();
  always return id_1;
endmodule
module module_1 (
    input logic id_0,
    input logic id_1,
    input logic id_2
);
  id_4 :
  assert property (@(posedge !1 or negedge 1) 1) begin
    id_4 = id_1;
    begin
      id_4 <= 1'd0;
      id_4 = id_0;
      if (1) assert (1 ^ id_2) if (1) id_4 = 1;
      id_4 = 1;
    end
  end
  module_0();
  always #1 id_4 <= 1;
  assign id_4 = id_1;
  assign id_4 = id_1;
  initial id_4 = id_2;
endmodule
