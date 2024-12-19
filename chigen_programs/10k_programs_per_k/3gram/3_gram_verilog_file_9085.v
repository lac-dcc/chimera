// Seed: 3751320128
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
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  id_9(
      .id_0(1),
      .id_1(1 || 1 || (id_1)),
      .id_2(id_3),
      .id_3(id_3),
      .id_4(id_5),
      .id_5(id_7 | 1),
      .id_6(1),
      .id_7(1)
  );
  wire id_10;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  not primCall (id_2, id_1);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2
  );
  assign modCall_1.id_7 = 0;
endmodule
