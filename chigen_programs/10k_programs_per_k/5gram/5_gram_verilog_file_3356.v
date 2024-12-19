// Seed: 1635560778
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
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  tri1 id_9 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  id_3(
      .id_0(),
      .id_1(1'h0),
      .id_2(id_2),
      .id_3((1)),
      .id_4(id_1),
      .id_5(1),
      .id_6(~id_4 ==? id_4),
      .id_7(id_4)
  );
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1
  );
  assign modCall_1.id_9 = 0;
endmodule
