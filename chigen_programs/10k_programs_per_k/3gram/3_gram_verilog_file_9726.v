// Seed: 3145954437
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_9  = id_4;
  assign id_14 = id_3;
  supply1 id_15 = 1 - 1;
  assign id_14 = 1;
  id_16(
      .id_0(1), .id_1(!id_13), .id_2(id_3), .id_3(id_7)
  );
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  output wire id_1;
  wire id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_2,
      id_3,
      id_2,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.id_3 = 0;
endmodule
