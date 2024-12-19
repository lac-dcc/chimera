// Seed: 826846629
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
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_9;
  wire id_10 = id_1;
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
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_3,
      id_2,
      id_1,
      id_4,
      id_5,
      id_6
  );
  wand id_7 = 1, id_8;
  id_9(
      .id_0(id_4), .id_1(id_8), .id_2(1), .id_3(1 == 1)
  );
  assign id_3 = 1 * id_8 == id_7;
endmodule
