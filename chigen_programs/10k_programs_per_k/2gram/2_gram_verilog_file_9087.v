// Seed: 3586267665
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
  input wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire  id_10;
  wire  id_11;
  wire  id_12;
  uwire id_13 = 1;
  wire  id_14;
  id_15(
      .id_0(1)
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_1,
      id_4
  );
  assign id_2[1] = id_1;
endmodule
