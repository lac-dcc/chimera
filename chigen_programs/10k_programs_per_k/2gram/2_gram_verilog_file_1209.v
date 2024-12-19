// Seed: 603811122
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wand id_4 = 1;
  wire id_5;
endmodule
module module_1 (
    output tri1  id_0,
    input  logic id_1,
    output tri1  id_2,
    input  logic id_3,
    input  logic id_4,
    inout  logic id_5
);
  assign id_5 = id_4;
  wire  id_7;
  logic id_8;
  always
    if ((1)) begin : LABEL_0
      id_5 <= 1;
    end
  wire id_9;
  id_10(
      1
  ); id_11 :
  assert property (@(posedge id_8) {1 <-> 1'b0 / 1, 1, id_5, id_3, 1, id_1})
  else;
  always #1;
  wire id_12;
  module_0 modCall_1 (
      id_9,
      id_12,
      id_9
  );
endmodule
