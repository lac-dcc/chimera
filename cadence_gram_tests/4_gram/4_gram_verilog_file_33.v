// Seed: 1405925021
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_1 = $realtime & 1;
  wire id_10;
  id_11(
      .id_0(-1), .id_1($realtime & -1 & $realtime), .id_2(id_10)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_6;
  assign id_3 = -1 ? $realtime : id_4;
  wire id_7;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_7,
      id_3,
      id_6,
      id_1,
      id_2,
      id_2,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule
