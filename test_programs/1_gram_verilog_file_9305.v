// Seed: 456968280
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6, id_7;
  wire id_8, id_9, id_10;
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = id_1;
  uwire id_5, id_6;
  id_7(
      1, id_5, id_2
  );
  wire id_8;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_6,
      id_4
  );
  assign id_6 = -1;
  wire id_9;
  wire id_10;
  id_11 :
  assert property (@(posedge id_1 or posedge -1) 1) $display;
endmodule
