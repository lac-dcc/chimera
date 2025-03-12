// Seed: 2471527683
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
    id_12
);
  output wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd87,
    parameter id_3 = 32'd39
) (
    id_1,
    _id_2,
    _id_3
);
  output wire _id_3;
  inout wire _id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  integer id_4[id_3 : id_2  .  product];
  assign id_3#(
      .id_2(1),
      .id_1(1 - 1)
  ) = id_1;
  assign id_4 = 1;
endmodule
