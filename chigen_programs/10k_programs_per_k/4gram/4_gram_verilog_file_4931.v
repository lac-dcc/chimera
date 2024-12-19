// Seed: 4274279649
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_9;
  wire id_10;
  wire id_11;
  always force id_1 = 1'h0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  final $display(1);
  wire  id_5;
  uwire id_6;
  assign id_3 = id_5;
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_7,
      id_5,
      id_6,
      id_1,
      id_6,
      id_1
  );
  id_8 :
  assert property (@(posedge 1) 1'b0)
  else $display(id_6, 1);
endmodule
