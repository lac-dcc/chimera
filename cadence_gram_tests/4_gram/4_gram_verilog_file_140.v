// Seed: 2190862486
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
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = $realtime;
  wire id_10;
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
  assign id_5 = id_6;
  id_8(
      -1, id_1, id_5
  );
  wire id_9;
  id_10(
      .id_0($realtime)
  );
  module_0 modCall_1 (
      id_2,
      id_6,
      id_5,
      id_9,
      id_5,
      id_1,
      id_7,
      id_2,
      id_2
  );
  wire id_11;
endmodule
